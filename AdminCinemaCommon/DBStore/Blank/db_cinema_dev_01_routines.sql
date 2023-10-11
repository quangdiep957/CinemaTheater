-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 35.234.5.238    Database: db_cinema_dev_01
-- ------------------------------------------------------
-- Server version	8.0.33



--
-- Dumping routines for database 'db_cinema_dev_01'
--
DELIMITER ;;
CREATE PROCEDURE `InsertToHistory`(IN $TotalAmount decimal, IN $CreatedBy varchar(255), IN $ListSeatID text, IN $CustomerName varchar(255), IN $PhoneNumber varchar(10), IN $MovieName varchar(500), IN $MovieID char(36), IN $RoomCinemaID char(36), IN $TemplateTimeCode varchar(20))
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE IF NOT EXISTS tmpTable (

    ID char(36)

  );

  INSERT INTO tmpTable

    SELECT

      *

    FROM JSON_TABLE (

    $ListSeatID,

    "$[*]"

    COLUMNS (

    ID char(36) PATH "$"

    )

    ) data;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_AcceptAccount`(IN $AccountID char(36), IN $Status int)
    COMMENT 'Thủ tục phê duyệt tài khoản'
BEGIN

  IF $Status = 1 THEN

    INSERT INTO account (AccountID, AccountName, Password, Role, CreatedDate)

      SELECT

        a.AccountID,

        a.AccountName,

        a.Password,

        a.Role,

        NOW() AS CreatedDate

      FROM accounttemp a

      WHERE a.AccountID = $AccountID;



    UPDATE accounttemp a

    SET a.Status = 3

    WHERE a.AccountID = $AccountID;

  ELSE

    UPDATE accounttemp a

    SET a.Status = 2

    WHERE a.AccountID = $AccountID;

  END IF;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_AddNewDBOptions`(IN $Keyword varchar(255), IN $KeyValue varchar(255))
BEGIN

  INSERT INTO dboptions (Keyword, KeyValue)

    VALUES ($Keyword, $KeyValue);

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_AddWaitListAccount`(IN $AccountName varchar(50), IN $Password varchar(50), IN $Role int, IN $Name varchar(255))
    COMMENT 'Thêm tài khoản cần phê duyệt'
BEGIN

  INSERT INTO accounttemp (AccountID, AccountName, Password, Role, Status, CreatedDate, Name)

    SELECT

      UUID(),

      $AccountName,

      $Password,

      $Role,

      1,

      NOW(),

      $Name;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_ChangeDBOptions`(IN $Keyword varchar(255), IN $KeyValue varchar(255))
BEGIN

  UPDATE dboptions

  SET KeyValue = $KeyValue

  WHERE Keyword = $Keyword;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_CheckExistAccount`(IN $AccountName varchar(50))
    COMMENT 'Hàm kiểm tra thủ tục đã tồn tại'
BEGIN



  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    AccountID char(36)

  );

  INSERT INTO tmpTable

    SELECT

      a.AccountID

    FROM account a

    WHERE a.AccountName = $AccountName;



  INSERT INTO tmpTable

    SELECT

      a.AccountID

    FROM accounttemp a

    WHERE a.AccountName = $AccountName;



  SELECT

    *

  FROM tmpTable;





END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_CreateNewCinemaRoom`(IN $RoomID char(36), IN $PostDate date, IN $MovieID char(36), IN $ListTemplateTimeCode varchar(20))
    COMMENT 'Thủ tục tạo phòng chiếu phim ảo mới'
BEGIN

  DECLARE $ColSeat int;

  DECLARE $RowSeat int;

  DECLARE $my_array json;



  DECLARE $RoomCinemaID char(36);



  SELECT

    JSON_EXTRACT($ListTemplateTimeCode, '$[*]') INTO $my_array;



  SELECT

    r.ColSeat,

    r.RowSeat INTO $ColSeat, $RowSeat

  FROM room r

  WHERE r.RoomID = $RoomID LIMIT 1;



  WHILE JSON_LENGTH($my_array) > 0 DO

    SELECT

      JSON_UNQUOTE(JSON_EXTRACT($my_array, '$[0]')) INTO @value;



    SET $RoomCinemaID = UUID();



    INSERT INTO roomcinema (RoomCinemaID, RoomID, MovieID, TemplateTimeCode, PostDate)

      VALUES ($RoomCinemaID, $RoomID, $MovieID, @value, $PostDate);



    CALL Proc_CreateNewRoomSeat($ColSeat, $RowSeat, $RoomCinemaID, $RoomID);

    SET $my_array = JSON_REMOVE($my_array, '$[0]');

  END WHILE;







END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_CreateNewRealRoom`(IN $RoomCode varchar(20), IN $RowSeat int, IN $ColSeat int)
    COMMENT 'Thủ tục tạo phòng thực'
BEGIN

  DECLARE $idRoom char(36);



  DECLARE i int DEFAULT 1;

  DECLARE j int DEFAULT 1;



  SET $idRoom = UUID();



  INSERT INTO room (RoomID, RoomCode, CinemaID, RowSeat, ColSeat, Status)

    VALUES ($idRoom, $RoomCode, NULL, $RowSeat, $ColSeat, 1);







  WHILE i <= $RowSeat DO

    WHILE j <= $ColSeat DO

      INSERT INTO seat (SeatID, ColSeat, RowSeat, RoomID, SeatName, Type)

        VALUES (UUID(), i, j, $idRoom, NULL, 1);

      SET j = j + 1;

    END WHILE;



    SET j = 1;

    SET i = i + 1;

  END WHILE;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_CreateNewRoomSeat`(IN $Col int, IN $Row int, IN $CinemaRoomID char(36), IN $RoomID char(36))
    COMMENT 'Thủ tục tạo hàng và cột vào trong một room'
BEGIN

  DECLARE i int DEFAULT 1;

  DECLARE j int DEFAULT 1;

  DECLARE $Type int DEFAULT 1;



  WHILE i <= $Row DO

    WHILE j <= $Col DO

      SELECT

        c.Type INTO $Type

      FROM seat c

      WHERE c.RowSeat = i

      AND c.ColSeat = j

      AND c.RoomID = $RoomID LIMIT 1;

      INSERT INTO statusroomcinema (RoomCinemaID, ColSeat, RowSeat, Status, Type)

        VALUES ($CinemaRoomID, j, i, 1, $Type);

      SET j = j + 1;

    END WHILE;



    SET j = 1;

    SET i = i + 1;

  END WHILE;



END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_CreateNewTemplateTime`(IN $TemplateTimeCode varchar(20), IN $Time varchar(255))
BEGIN

  INSERT INTO templatetimemovieon

    SELECT

      $TemplateTimeCode,

      $Time;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_CreateRealCinemaRoom`(IN $RoomCode varchar(20), IN $RowSeat int, IN $ColSeat int)
BEGIN

  DECLARE $idRoom char(36);

  DECLARE i int DEFAULT 1;

  DECLARE j int DEFAULT 1;

  SET $idRoom = UUID();

  INSERT INTO room

    VALUES ($idRoom, $RoomCode, NULL, $RowSeat, $ColSeat, 1);







  WHILE i <= $RowSeat DO

    WHILE j <= $ColSeat DO

      INSERT INTO seat (SeatID, RowSeat, ColSeat, RoomID, SeatName, Type)

        VALUES (UUID(), i, j, $idRoom, NULL, 1);

      SET j = j + 1;

    END WHILE;



    SET j = 1;

    SET i = i + 1;

  END WHILE;



END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_DeleteMovieByID`(IN $MovieID char(36))
    COMMENT 'Thủ tục thực hiện xóa phim theo id của phim'
BEGIN

  DELETE

    FROM movie

  WHERE MovieID = $MovieID;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_DeleteMovies`(IN $MovieIDs varchar(255))
    COMMENT 'Hàm thực hiện xóa phim'
BEGIN

  DELETE

    FROM movie

  WHERE MovieID IN ($MovieIDs);

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_DeleteRealRoom`(In $RoomID char(36))
BEGIN

	Delete from room r WHERE r.RoomID = $RoomID;

	Delete FROM seat s WHERE s.RoomID = $RoomID;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_DeleteRoomCinemaVirtual`(IN $RoomCinemaID char(36))
BEGIN

	delete from roomcinema t where t.RoomCinemaID = $RoomCinemaID; 

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetAccountIDRole`(IN $account_name varchar(50), IN $account_password varchar(50))
    COMMENT 'Thủ tục lấy ra account id và role'
BEGIN

  SELECT

    AccountID AS AccountID,

    Role AS Role

  FROM account

  WHERE AccountName = $account_name

  AND Password = $account_password LIMIT 1;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetAllAccount`()
    COMMENT 'Thủ tục lấy ra tất cả tài khoản'
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    AccountID char(36),

    AccountName varchar(50),

    Password varchar(50),

    Role int,

    Name varchar(255),

    Gender int,

    DateOfBirth date,

    PhoneNumber varchar(10),

    Email varchar(100)

  );



  INSERT INTO tmpTable (AccountID, AccountName, Password, Role, Name, Gender, DateOfBirth, PhoneNumber, Email)

    SELECT

      a.AccountID,

      a.AccountName,

      a.Password,

      a.Role,

      a.Name,

      a.Gender,

      a.DateOfBirth,

      a.PhoneNumber,

      a.Email

    FROM account a;



  SELECT

    *

  FROM account a

  ORDER BY a.Role, a.AccountName, a.PhoneNumber;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetAllAccountTemp`()
    COMMENT 'Thủ tục lấy ra tất cả tài khoản cần chờ duyệt mà chưa được duyệt'
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    AccountID char(36),

    AccountName varchar(50),

    Password varchar(50),

    Role int,

    Status int,

    CreatedDate date,

    Name varchar(255)

  );



  INSERT INTO tmpTable (AccountID, AccountName, Password, Role, Status, CreatedDate, Name)

    SELECT

      t.AccountID,

      t.AccountName,

      t.Password,

      t.Role,

      t.Status,

      t.CreatedDate,

      t.Name

    FROM accounttemp t

    WHERE t.Status = 1;



  SELECT

    *

  FROM tmpTable;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetBiggestMovieCode`()
    COMMENT 'Thủ tục lấy ra chuỗi lớn nhất của movie code'
BEGIN

  SELECT

    m.moviecode AS MovieCode

  FROM movie m

  ORDER BY LENGTH(moviecode) DESC, SUBSTRING(moviecode, 1, 1) DESC, CAST(SUBSTRING(moviecode, 2) AS UNSIGNED) DESC LIMIT 1;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetCategoryMovie`()
    COMMENT 'Thủ tục lấy danh sách thể loại phim'
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    CategoryID char(36),

    CategoryName varchar(500),

    CategoryCode varchar(20)

  );



  INSERT INTO tmpTable

    SELECT

      t.CategoryID,

      t.CategoryName,

      t.CategoryCode

    FROM categorymovie t

    ORDER BY t.CategoryName;



  SELECT

    *

  FROM tmpTable;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetChartDayByMovie`()
    COMMENT 'Thủ tục lấy dữ liệu thống kê theo ngày theo từng phim'
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    MovieName text,

    MovieID char(36),

    Amount decimal(22, 4)

  );



  INSERT INTO tmpTable (MovieName, MovieID, Amount)

    SELECT

      m.MovieName,

      m.MovieID,

      0 AS Amount

    FROM movie m

    WHERE m.ToDate >= CURDATE()

    AND m.FromDate <= CURDATE();





  UPDATE tmpTable t

  INNER JOIN (SELECT

      h.MovieID AS MovieID,

      SUM(IFNULL(h.TotalAmount, 0)) AS Amount

    FROM history h

    WHERE DATE(h.CreatedDate) = CURDATE()

    AND h.ParentID IS NOT NULL

    GROUP BY h.MovieID) AS tmp

    ON tmp.MovieID = t.MovieID

  SET t.Amount = tmp.Amount;





  SELECT

    *

  FROM tmpTable

  ORDER BY MovieName;





END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetChartMonthByMovie`(IN $MovieID char(36))
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    Amount decimal(22, 4),

    PostDay varchar(20),

    ShowDate datetime

  );



  INSERT INTO tmpTable

    SELECT

      SUM(IFNULL(h.TotalAmount, 0)),

      DATE_FORMAT(h.ShowDate, '%d-%m'),

      h.ShowDate

    FROM history h

    WHERE h.MovieID = $MovieID

    AND h.ParentID IS NOT NULL

    GROUP BY DATE_FORMAT(h.ShowDate, '%d-%m'),

             h.ShowDate;



  SELECT

    *

  FROM tmpTable

  ORDER BY ShowDate;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetChartThisMonth`()
    COMMENT 'Thủ tục lấy ra số liệu thống kê phim trong tháng này'
BEGIN



  DECLARE $ThisMonth int;

  DECLARE $ThisYear int;

  SELECT

    MONTH(CURDATE()) INTO $ThisMonth;



  SELECT

    YEAR(CURDATE()) INTO $ThisYear;

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    Amount decimal(22, 4),

    MovieName text

  );

  INSERT INTO tmpTable (Amount, MovieName)

    SELECT

      SUM(IFNULL(h.TotalAmount, 0)) AS Amount,

      h.MovieName AS MovieName

    FROM history h

    WHERE MONTH(h.ShowDate) = $ThisMonth

    AND YEAR(h.ShowDate) = $ThisYear

    GROUP BY h.MovieID,

             h.MovieName

  ;



  SELECT

    *

  FROM tmpTable

  ORDER BY MovieName;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetChartThisYearByMonth`()
    COMMENT 'Lấy ra dữ liệu thống kê theo từng tháng trong năm'
BEGIN





  DECLARE $ThisYear int;



  SELECT

    YEAR(CURDATE()) INTO $ThisYear;

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    Amount decimal(22, 4),

    Month int

  );



  INSERT INTO tmpTable

    SELECT

      SUM(IFNULL(h.TotalAmount, 0)) AS Amount,

      MONTH(h.ShowDate) AS Month

    FROM history h

    WHERE h.ParentID IS NOT NULL

    AND YEAR(h.ShowDate) = $ThisYear

    GROUP BY MONTH(h.ShowDate)

    ORDER BY Month;



  SELECT

    *

  FROM tmpTable;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetCinemaInfo`()
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    CinemaID char(36),

    CinemaCode varchar(20),

    CinemaName varchar(500),

    CinemaAddress varchar(500),

    SortOrder varchar(10),

    About text,

    Hotline varchar(10),

    Fax varchar(20),

    MST varchar(50)

  );



  INSERT INTO tmpTable (CinemaID, CinemaCode, CinemaName, CinemaAddress, SortOrder, About, Hotline, Fax, MST)

    SELECT

      lc.CinemaID,

      lc.CinemaCode,

      lc.CinemaName,

      lc.CinemaAddress,

      lc.SortOrder,

      lc.About,

      lc.Hotline,

      lc.Fax,

      lc.MST

    FROM listcinema lc LIMIT 1;



  SELECT

    *

  FROM tmpTable;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetCinemaRoom`()
    COMMENT 'Thủ tục lấy phòng thực'
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    RoomID char(36),

    RoomCode varchar(20),

    RowSeat int,

    ColSeat int,

    Status bit

  );





  INSERT INTO tmpTable

    SELECT

      r.RoomID,

      r.RoomCode,

      r.RowSeat,

      r.ColSeat,

      r.Status

    FROM room r

    WHERE r.Status = 1;



  SELECT

    *

  FROM tmpTable

  ORDER BY RoomCode;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetDBOption`()
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    Keyword varchar(255),

    KeyValue varchar(255)

  );



  INSERT INTO tmpTable (Keyword, KeyValue)

    SELECT

      Keyword,

      KeyValue

    FROM dboptions;



  SELECT

    *

  FROM tmpTable;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetHistory`()
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    CheckoutID char(36),

    TicketID char(36),

    MovieID char(36),

    RoomCinemaID char(36),

    ParentID char(36),

    MovieName varchar(1000),

    CustomerName varchar(255),

    PhoneNumber varchar(10),

    TotalAmount decimal(22, 4),

    SeatName varchar(20),

    TemplateTimeCode varchar(20),

    CreatedBy varchar(255),

    CreatedDate datetime,

    ShowDate datetime,

    Time varchar(50),

    Type int,

    RoomCode varchar(45),

    IsExported bit

  );



  INSERT INTO tmpTable (CheckoutID,

  TicketID,

  MovieID,

  RoomCinemaID,

  ParentID,

  MovieName,

  CustomerName,

  PhoneNumber,

  TotalAmount,

  SeatName,

  TemplateTimeCode,

  CreatedBy,

  CreatedDate,

  ShowDate,

  Time,

  Type,

  RoomCode,

  IsExported)

    SELECT

      CheckoutID,

      TicketID,

      MovieID,

      RoomCinemaID,

      ParentID,

      MovieName,

      CustomerName,

      PhoneNumber,

      TotalAmount,

      SeatName,

      TemplateTimeCode,

      CreatedBy,

      CreatedDate,

      ShowDate,

      Time,

      Type,

      RoomCode,

      IsExported

    FROM history;



  SELECT

    *

  FROM tmpTable

  ORDER BY CreatedDate DESC, ParentID, Type;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetListCustomer`()
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    AccountID char(36),

    AccountName varchar(50),

    Role int,

    Name varchar(255),

    Gender int,

    DateOfBirth date,

    PhoneNumber varchar(10),

    Point int,

    MemberCode varchar(20),

    TypeMember int,

    CreatedDate datetime,

    Email varchar(100)

  );



  INSERT INTO tmpTable

    SELECT

      a.AccountID AS AccountID,

      a.AccountName AS AccountName,

      a.Role AS Role,

      a.Name AS Name,

      a.Gender AS Gender,

      a.DateOfBirth AS DateOfBirth,

      a.PhoneNumber AS PhoneNumber,

      a.Point AS Point,

      a.MemberCode AS MemberCode,

      a.TypeMember AS TypeMember,

      a.CreatedDate AS CreatedDate,

      a.Email AS Email

    FROM account a

    WHERE Role = 5;



  SELECT

    *

  FROM tmpTable;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetListLanguage`()
    COMMENT 'Thủ tục lấy ra danh sách ngôn ngữ'
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    LanguageCode varchar(10),

    LanguageName varchar(50)

  );



  INSERT INTO tmpTable (LanguageCode, LanguageName)

    SELECT

      l.LanguageCode,

      l.LanguageName

    FROM language l

    ORDER BY l.LanguageCode;



  SELECT

    *

  FROM tmpTable t;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetListMovie`(IN $MovieCode varchar(50), IN $MovieName varchar(200), IN $Actor varchar(200), IN $Direction varchar(200), IN $TypeFilter int)
    COMMENT 'Thủ tục thực hiện lấy ra danh sách phim'
BEGIN

  DECLARE $TimeNow datetime;

  SET $TimeNow = NOW();

  CREATE TEMPORARY TABLE IF NOT EXISTS tmpTable (

    MovieID char(36),

    MovieCode varchar(20),

    MovieName varchar(500),

    ReleaseDate datetime,

    Actor varchar(500),

    Directions varchar(255),

    TypeID char(36),

    Language varchar(100),

    TrailerLink varchar(500),

    PosterLink varchar(500),

    Content text,

    FromDate datetime,

    ToDate datetime,

    IsOpen bit,

    Tag varchar(20),

    TimeLine int,

    TypeName varchar(500),

    CategoryName varchar(4000),

    Period int

  );



  INSERT INTO tmpTable

    SELECT

      m.MovieID AS MovieID,

      m.MovieCode AS MovieCode,

      m.MovieName AS MovieName,

      m.ReleaseDate AS ReleaseDate,

      m.Actor AS Actor,

      m.Directions AS Directions,

      m.TypeID AS TypeID,

      m.Language AS Language,

      m.TrailerLink AS TrailerLink,

      m.PosterLink AS PosterLink,

      m.Content AS Content,

      m.FromDate AS FromDate,

      m.ToDate AS ToDate,

      m.IsOpen AS IsOpen,

      m.Tag AS Tag,

      m.TimeLine AS TimeLine,

      tm.TypeName AS TypeName,

      GROUP_CONCAT(cm.CategoryName SEPARATOR ','),

      CASE WHEN m.FromDate <= $TimeNow AND

          m.ToDate >= $TimeNow THEN 1 WHEN $TimeNow < m.FromDate THEN 2 ELSE 3 END AS Period

    FROM movie m

      INNER JOIN typemovie tm

        ON tm.TypeID = m.TypeID

      LEFT JOIN moviecategorydetail mc

        ON m.MovieID = mc.MovieID

      LEFT JOIN categorymovie cm

        ON cm.CategoryID = mc.CategoryID

    WHERE ($MovieCode IS NULL

    OR m.MovieCode LIKE CONCAT('%', $MovieCode, '%'))

    AND ($MovieName IS NULL

    OR m.MovieName LIKE CONCAT('%', $MovieName, '%'))

    AND ($Actor IS NULL

    OR m.Actor LIKE CONCAT('%', $Actor, '%'))

    AND ($Direction IS NULL

    OR m.Directions LIKE CONCAT('%', $Direction, '%'))

    GROUP BY m.TypeID,

             m.Language,

             m.TrailerLink,

             m.PosterLink,

             m.Content,

             m.FromDate,

             m.ToDate,

             m.IsOpen,

             m.Tag,

             m.TimeLine,

             tm.TypeName,

             CASE WHEN m.FromDate <= $TimeNow AND

                 m.ToDate >= $TimeNow THEN 1 WHEN $TimeNow < m.FromDate THEN 2 ELSE 3 END,

             m.MovieID

  ;



  SELECT

    *

  FROM tmpTable

  WHERE ($TypeFilter = 0

  OR $TypeFilter = Period);

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetListRoom`()
    COMMENT 'Thủ tục lấy ra danh sách phòng'
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    RoomID char(36),

    RoomCode varchar(20)

  );



  INSERT INTO tmpTable

    SELECT

      r.RoomID,

      r.RoomCode

    FROM room r;



  SELECT

    *

  FROM tmpTable

  ORDER BY RoomCode;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetListRoomCinemaByMovieID`(IN $MovieID char(36), IN $PostDate date)
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    RoomCinemaID char(36),

    RoomID char(36),

    RoomCode varchar(20),

    Time varchar(255),

    PostDate date,

    TemplateTimeCode varchar(20)

  );



  INSERT INTO tmpTable

    SELECT

      rc.RoomCinemaID,

      rc.RoomID,

      r.RoomCode,

      tt.`Time`,

      rc.PostDate,

      tt.TemplateTimeCode

    FROM roomcinema rc

      INNER JOIN room r

        ON rc.RoomID = r.RoomID

      INNER JOIN templatetimemoiveon tt

        ON tt.TemplateTimeCode = rc.TemplateTimeCode

    WHERE rc.MovieID = $MovieID

    AND (rc.PostDate = $PostDate

    OR $PostDate IS NULL);



  SELECT

    *

  FROM tmpTable

  ORDER BY PostDate, RoomCode, Time;



END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetListTemplateTicket`()
BEGIN

  DECLARE $CinemaName varchar(500);

  DECLARE $CinemaAddress varchar(500);

  DECLARE $Hotline varchar(10);

  DECLARE $About text(10);

  DECLARE $MST varchar(50);

  SELECT

    lc.CinemaName,

    lc.CinemaAddress,

    lc.Hotline,

    lc.About,

    lc.MST INTO $CinemaName, $CinemaAddress, $Hotline, $About, $MST

  FROM listcinema lc LIMIT 1;



  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    TemplateTicketID char(36),

    MovieID char(36),

    MovieCode varchar(20),

    MovieName varchar(500),

    ReleaseDate datetime,

    Language varchar(100),

    TimeLine int,

    Type int,

    Cost decimal(22, 4),

    CinemaName varchar(500),

    CinemaAddress varchar(500),

    Hotline varchar(10),

    About text,

    MST varchar(50)

  );



  INSERT INTO tmpTable

    SELECT

      t.TemplateTicketID AS TemplateTicketID,

      t.MovieID AS MovieID,

      m.MovieCode AS MovieCode,

      m.MovieName AS MovieName,

      m.ReleaseDate AS ReleaseDate,

      m.Language AS Language,

      m.TimeLine AS TimeLine,

      t.Type AS Type,

      t.Cost AS Cost,

      $CinemaName AS CinemaName,

      $CinemaAddress AS CinemaAddress,

      $Hotline AS Hotline,

      $About AS About,

      $MST AS MST

    FROM templateticketmovie t

      INNER JOIN movie m

        ON t.MovieID = m.MovieID

    WHERE m.FromDate <= NOW()

    AND m.ToDate >= NOW();



  SELECT

    *

  FROM tmpTable

  ORDER BY ReleaseDate, Type;



END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetMovieByID`(IN $MovieID char(36))
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    MovieID char(36),

    MovieCode varchar(20),

    MovieName varchar(500),

    ReleaseDate datetime,

    Actor varchar(500),

    Directions varchar(255),

    TypeID char(36),

    Language varchar(100),

    TrailerLink varchar(500),

    PosterLink varchar(500),

    Content text,

    FromDate datetime,

    ToDate datetime,

    IsOpen bit,

    Tag varchar(20),

    TimeLine int,

    CategoryIDs text

  );



  INSERT INTO tmpTable

    SELECT

      m.MovieID,

      m.MovieCode,

      m.MovieName,

      m.ReleaseDate,

      m.Actor,

      m.Directions,

      m.TypeID,

      m.Language,

      m.TrailerLink,

      m.PosterLink,

      m.Content,

      m.FromDate,

      m.ToDate,

      m.IsOpen,

      m.Tag,

      m.TimeLine,

      REPLACE(REPLACE(JSON_ARRAYAGG(CONCAT(c.CategoryID)), '[[', '['), ']]', ']') AS CategoryIDs

    FROM movie m

      LEFT JOIN (SELECT

          MovieID,

          CategoryID

        FROM moviecategorydetail) c

        ON c.MovieID = m.MovieID

    WHERE m.MovieID = $MovieID

    GROUP BY m.MovieID;

  SELECT

    *

  FROM tmpTable;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetRealSeatByRoom`(IN $RoomID char(36))
    COMMENT 'Thủ tục lấy ra danh sách ghế thực trong phòng'
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    SeatID char(36),

    RowSeat int,

    ColSeat int,

    Type int

  );



  INSERT INTO tmpTable (SeatID, RowSeat, ColSeat, Type)

    SELECT

      s.SeatID,

      s.RowSeat,

      s.ColSeat,

      s.Type

    FROM seat s

    WHERE s.RoomID = $RoomID;



  SELECT

    *

  FROM tmpTable

  ORDER BY RowSeat, ColSeat;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetSeatRoomCinema`(IN $RoomCinemaID char(36))
    COMMENT 'Thủ tục lấy ra seat room cinema'
BEGIN



  -- Thủ tục lấy ra thứ tự và status của chỗ ngồi trong phòng

  DROP TEMPORARY TABLE IF EXISTS tmpTable;



  CREATE TEMPORARY TABLE IF NOT EXISTS tmpTable (

    ColSeat int,

    RowSeat int,

    Status int,

    RoomCinemaID char(36),

    Type int

  );



  INSERT INTO tmpTable

    SELECT

      s.ColSeat,

      s.RowSeat,

      s.Status,

      s.RoomCinemaID,

      s.Type

    FROM statusroomcinema s

    WHERE s.RoomCinemaID = $RoomCinemaID;



  SELECT

    *

  FROM tmpTable tt

  ORDER BY tt.RowSeat, tt.ColSeat;





END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetTemplateTimeCode`()
    COMMENT 'Thủ tục lấy ra tất cả khung giờ'
BEGIN

  SELECT

    t.TemplateTimeCode AS TemplateTimeCode,

    t.Time AS Time

  FROM templatetimemoiveon t

  ORDER BY t.Time;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetTemplateTimeCodeByMovieID`(IN $MovieID char(36), IN $PostDate date, IN $RoomID char(36))
    COMMENT 'Thủ tục lấy ra danh sách template time code'
BEGIN

  DECLARE tempText text;

  SELECT

    GROUP_CONCAT(r.TemplateTimeCode SEPARATOR ',') INTO tempText

  FROM roomcinema r

  WHERE r.PostDate = $PostDate

  AND r.RoomID = $RoomID;



  SELECT

    *

  FROM templatetimemoiveon t

  WHERE tempText NOT LIKE CONCAT('%', TemplateTimeCode, '%')

  OR tempText IS NULL;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_GetTypeMovie`()
    COMMENT 'Thủ tục lấy danh sách loại phim'
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE tmpTable (

    TypeID char(36),

    TypeCode varchar(20),

    TypeName varchar(500)

  );



  INSERT INTO tmpTable

    SELECT

      t.TypeID,

      t.TypeCode,

      t.TypeName

    FROM typemovie t;



  SELECT

    *

  FROM tmpTable;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_InsertCategoryMovie`(IN $CategoryName varchar(500), IN $CategoryCode varchar(20))
    COMMENT 'THủ tục thêm mới thể loại phim'
BEGIN

  INSERT INTO categorymovie (CategoryID, CategoryName, CategoryCode)

    VALUES (UUID(), $CategoryName, $CategoryCode);

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_InsertNewLanguage`(IN $LanguageCode varchar(10), IN $LanguageName varchar(50))
    COMMENT 'Thủ tục thêm mới một ngôn ngữ'
BEGIN

  INSERT INTO language (LanguageCode, LanguageName)

    VALUES ($LanguageCode, $LanguageName);

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_InsertNewMovie`(IN $MovieCode varchar(20), IN $MovieName varchar(500), IN $ReleaseDate datetime, IN $Actor varchar(500), IN $Directions varchar(255), IN $TypeID char(36), IN $Language varchar(100), IN $TrailerLink varchar(500), IN $PosterLink varchar(500), IN $Content text, IN $FromDate datetime, IN $ToDate datetime, IN $IsOpen bit, IN $Tag varchar(20), IN $CategoryIDs varchar(255), IN $MovieID char(36), IN $TimeLine int)
    COMMENT 'Thủ tục thêm mới phim'
BEGIN

  DECLARE $Normal_Cost decimal(22, 4);

  DECLARE $VIP_Cost decimal(22, 4);



  SELECT

    CONVERT(KeyValue, decimal(22, 4)) INTO $Normal_Cost

  FROM dboptions d

  WHERE d.Keyword = 'Default_Seat_Normal' LIMIT 1;

  SELECT

    CONVERT(KeyValue, decimal(22, 4)) INTO $VIP_Cost

  FROM dboptions d

  WHERE d.Keyword = 'Default_Seat_VIP' LIMIT 1;

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE IF NOT EXISTS tmpTable (

    ID char(36)

  );

  INSERT INTO tmpTable

    SELECT

      *

    FROM JSON_TABLE (

    $CategoryIDs,

    "$[*]"

    COLUMNS (

    ID char(36) PATH "$"

    )

    ) data;



  INSERT INTO movie (MovieID, MovieCode, MovieName, ReleaseDate, Actor, Directions, TypeID, Language, TrailerLink, PosterLink, Content, FromDate, ToDate, IsOpen, Tag, TimeLine)

    VALUES ($MovieID, $MovieCode, $MovieName, $ReleaseDate, $Actor, $Directions, $TypeID, $Language, $TrailerLink, $PosterLink, $Content, $FromDate, $ToDate, NULL, $Tag, $TimeLine)

  ;



  INSERT INTO moviecategorydetail

    SELECT

      $MovieID,

      tt.ID

    FROM tmpTable tt;



  INSERT INTO templateticketmovie (TemplateTicketID, MovieID, Type, Cost)

    VALUES (UUID(), $MovieID, 1, $Normal_Cost);

  INSERT INTO templateticketmovie (TemplateTicketID, MovieID, Type, Cost)

    VALUES (UUID(), $MovieID, 2, $VIP_Cost);



END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_InsertTemplateTimeCode`(IN $TemplateTimeCode varchar(20), IN $Time varchar(255))
    COMMENT 'Thủ tục thêm mới múi thời gian'
BEGIN

  INSERT INTO templatetimemoiveon (TemplateTimeCode, Time)

    VALUES ($TemplateTimeCode, $Time);

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_InsertToHistory`(IN $CreatedBy varchar(255),

IN $DataTicket text,

IN $CustomerName varchar(255),

IN $PhoneNumber varchar(10),

IN $MovieName varchar(500),

IN $MovieID char(36),

IN $RoomCinemaID char(36),

IN $TemplateTimeCode varchar(20),

IN $ShowDate datetime,

IN $Time varchar(50),

IN $RoomCode varchar(20),

IN $IsExported bit)
BEGIN

  DECLARE i int DEFAULT 0;

  DECLARE $Cost_N decimal(22, 4);

  DECLARE $Cost_V decimal(22, 4);

  DECLARE $n int DEFAULT JSON_LENGTH($DataTicket);

  DECLARE $Type int;

  DECLARE $seat_name varchar(20);

  DECLARE $sum_amount decimal(22, 4);



  DECLARE $parent_id char(36);



  SELECT

    UUID() INTO $parent_id;



  SELECT

    t.Cost INTO $Cost_N

  FROM templateticketmovie t

  WHERE t.MovieID = $MovieID

  AND t.Type = 1;



  SELECT

    t.Cost INTO $Cost_V

  FROM templateticketmovie t

  WHERE t.MovieID = $MovieID

  AND t.Type = 2;



  WHILE i < $n DO

    SET $type = JSON_EXTRACT($DataTicket, CONCAT('$[', i, '].Type'));

    SET $seat_name = JSON_UNQUOTE(JSON_EXTRACT($DataTicket, CONCAT('$[', i, '].SeatName')));

    IF $type = 1 THEN

      SET $sum_amount = $sum_amount + $Cost_N;

    ELSE

      SET $sum_amount = $sum_amount + $Cost_V;

    END IF;

    INSERT INTO history (CheckoutID, TicketID, MovieID, RoomCinemaID, ParentID, MovieName, CustomerName, PhoneNumber, TotalAmount, SeatName, TemplateTimeCode, CreatedBy, CreatedDate, ShowDate, Time, Type, RoomCode, IsExported)

      SELECT

        UUID() AS CheckoutID,

        UUID() AS TicketID,

        $MovieID AS MovieID,

        $RoomCinemaID AS RoomCinemaID,

        $parent_id AS ParentID,

        $MovieName AS MovieName,

        $CustomerName AS CustomerName,

        $PhoneNumber AS PhoneNumber,

        CASE WHEN $type = 1 THEN $Cost_N ELSE $Cost_V END AS TotalAmount,

        $seat_name AS SeatName,

        $TemplateTimeCode AS TemplateTimeCode,

        $CreatedBy AS CreatedBy,

        NOW() AS CreatedDate,

        $ShowDate AS ShowDate,

        $Time AS Time,

        $type AS Type,

        $RoomCode AS RoomCode,

        $IsExported AS IsExported;

    SET i = i + 1;

  END WHILE;



  INSERT INTO history (CheckoutID, TicketID, MovieID, RoomCinemaID, ParentID, MovieName, CustomerName, PhoneNumber, TotalAmount, SeatName, TemplateTimeCode, CreatedBy, CreatedDate, ShowDate, Time, Type, RoomCode, IsExported)

    SELECT

      UUID() AS CheckoutID,

      UUID() AS TicketID,

      $MovieID AS MovieID,

      $RoomCinemaID AS RoomCinemaID,

      NULL AS ParentID,

      $MovieName AS MovieName,

      $CustomerName AS CustomerName,

      $PhoneNumber AS PhoneNumber,

      $sum_amount AS TotalAmount,

      NULL AS SeatName,

      $TemplateTimeCode AS TemplateTimeCode,

      $CreatedBy AS CreatedBy,

      NOW() AS CreatedDate,

      $ShowDate AS ShowDate,

      $Time AS Time,

      $type AS Type,

      $RoomCode AS RoomCode,

      $IsExported AS IsExported;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_InsertTypeMovie`(IN $TypeCode varchar(20), IN $TypeName varchar(500))
    COMMENT 'Thủ tục thêm mới một loại phim'
BEGIN

  INSERT INTO typemovie (TypeID, TypeCode, TypeName)

    VALUES (UUID(), $TypeCode, $TypeName);

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_UpdateAccount`(IN $AccountID char(36), IN $Password varchar(50), IN $Role int, IN $Name varchar(255), IN $Gender int, IN $DateOfBirth date, IN $PhoneNumber varchar(10), IN $Email varchar(100))
    COMMENT 'Thủ tục cập nhật tài khoản'
BEGIN

  UPDATE account a

  SET a.Password = $Password,

      a.Role = $Role,

      a.Name = $Name,

      a.Gender = $Gender,

      a.DateOfBirth = $DateOfBirth,

      a.PhoneNumber = $PhoneNumber,

      a.Email = $Email

  WHERE a.AccountID = $AccountID;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_UpdateCinemaInfo`(IN $CinemaID char(36), IN $CinemaCode varchar(20), IN $CinemaName varchar(500), IN $CinemaAddress varchar(500), IN $About text, IN $Hotline varchar(10), IN $MST varchar(50))
BEGIN

  UPDATE listcinema lc

  SET lc.CinemaCode = $CinemaCode,

      lc.CinemaName = $CinemaName,

      lc.CinemaAddress = $CinemaAddress,

      lc.About = $About,

      lc.Hotline = $Hotline,

      lc.MST = $MST

  WHERE lc.CinemaID = $CinemaID;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_UpdateCostOfTicket`(IN $TemplateTicketID char(36), IN $Cost decimal(22, 4))
BEGIN

  UPDATE templateticketmovie t

  SET t.Cost = $Cost

  WHERE t.TemplateTicketID = $TemplateTicketID;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_UpdateDBOption`(IN $Keyword varchar(255), IN $KeyValue varchar(255))
BEGIN

  UPDATE dboptions d

  SET d.KeyValue = $KeyValue

  WHERE d.Keyword = $Keyword;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_UpdateMovie`(IN $MovieCode varchar(20), IN $MovieName varchar(500), IN $ReleaseDate datetime, IN $Actor varchar(500), IN $Directions varchar(255), IN $TypeID char(36), IN $Language varchar(100), IN $TrailerLink varchar(500), IN $PosterLink varchar(500), IN $Content text, IN $FromDate datetime, IN $ToDate datetime, IN $IsOpen bit, IN $Tag varchar(20), IN $CategoryIDs text, IN $MovieID char(36), IN $TimeLine varchar(255))
    COMMENT 'Thủ tục update movie'
BEGIN

  DROP TEMPORARY TABLE IF EXISTS tmpTable;

  CREATE TEMPORARY TABLE IF NOT EXISTS tmpTable (

    ID char(36)

  );

  INSERT INTO tmpTable

    SELECT

      *

    FROM JSON_TABLE (

    $CategoryIDs,

    "$[*]"

    COLUMNS (

    ID char(36) PATH "$"

    )

    ) data;



  SELECT

    *

  FROM tmpTable t;



  DELETE

    FROM movie

  WHERE MovieID = $MovieID;



  DELETE

    FROM moviecategorydetail

  WHERE MovieID = $MovieID;



  INSERT INTO movie (MovieID, MovieCode, MovieName, ReleaseDate, Actor, Directions, TypeID, Language, TrailerLink, PosterLink, Content, FromDate, ToDate, IsOpen, Tag, TimeLine)

    VALUES ($MovieID, $MovieCode, $MovieName, $ReleaseDate, $Actor, $Directions, $TypeID, $Language, $TrailerLink, $PosterLink, $Content, $FromDate, $ToDate, NULL, $Tag, $TimeLine)

  ;



  INSERT INTO moviecategorydetail

    SELECT

      $MovieID,

      tt.ID

    FROM tmpTable tt;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_UpdateRealSeatRoom`(IN $ListSeatSelected text)
    COMMENT 'Thủ tục cập nhật trang thái ghế'
BEGIN

  DECLARE i int DEFAULT 0;

  DECLARE n int DEFAULT JSON_LENGTH($ListSeatSelected);

  DECLARE row_seat int;

  DECLARE col_seat int;

  DECLARE cinema_id varchar(36);

  DECLARE $type int;



  WHILE i < n DO

    SET row_seat = JSON_EXTRACT($ListSeatSelected, CONCAT('$[', i, '].RowSeat'));

    SET col_seat = JSON_EXTRACT($ListSeatSelected, CONCAT('$[', i, '].ColSeat'));

    SET cinema_id = JSON_UNQUOTE(JSON_EXTRACT($ListSeatSelected, CONCAT('$[', i, '].RoomID')));

    SET $type = JSON_EXTRACT($ListSeatSelected, CONCAT('$[', i, '].Type'));

    UPDATE seat s

    SET s.Type = $type

    WHERE s.RowSeat = row_seat

    AND s.ColSeat = col_seat

    AND s.RoomID = cinema_id;



    SET i = i + 1;

  END WHILE;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_UpdateSeatRoomCinema`(IN $ListSeatSelected text)
    COMMENT 'Thủ tục update lại status của ghế'
BEGIN

  DECLARE i int DEFAULT 0;

  DECLARE n int DEFAULT JSON_LENGTH($ListSeatSelected);

  DECLARE row_seat int;

  DECLARE col_seat int;

  DECLARE cinema_id varchar(36);



  WHILE i < n DO

    SET row_seat = JSON_EXTRACT($ListSeatSelected, CONCAT('$[', i, '].RowSeat'));

    SET col_seat = JSON_EXTRACT($ListSeatSelected, CONCAT('$[', i, '].ColSeat'));

    SET cinema_id = JSON_UNQUOTE(JSON_EXTRACT($ListSeatSelected, CONCAT('$[', i, '].RoomCinemaID')));



    UPDATE statusroomcinema s

    SET s.Status = 0

    WHERE s.RowSeat = row_seat

    AND s.ColSeat = col_seat

    AND s.RoomCinemaID = cinema_id;



    SET i = i + 1;

  END WHILE;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_UpdateStatusExportedInCinema`(IN $DataTicket text,

IN $MovieID char(36),

IN $TemplateTimeCode varchar(20),

IN $ShowDate datetime,

IN $RoomCode varchar(20))
BEGIN

  DECLARE i int DEFAULT 0;

  DECLARE $n int DEFAULT JSON_LENGTH($DataTicket);

  DECLARE $seat_name varchar(20);



  WHILE i < $n DO

    SET $seat_name = JSON_UNQUOTE(JSON_EXTRACT($DataTicket, CONCAT('$[', i, '].SeatName')));

    UPDATE history h

    SET h.IsExported = 1

    WHERE h.MovieID = $MovieID

    AND h.TemplateTimeCode = $TemplateTimeCode

    AND h.ShowDate = $ShowDate

    AND h.RoomCode = $RoomCode

    AND h.SeatName = $seat_name;

    SET i = i + 1;

  END WHILE;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE PROCEDURE `Proc_UpdateStatusExportedInHistory`(IN $CheckoutID char(36))
    COMMENT 'Thủ tục cập nhật trạng thái đã xuất vé trong rạp chiếu phim'
BEGIN

  UPDATE history h

  SET h.IsExported = 1

  WHERE h.CheckoutID = $CheckoutID;

END ;;
DELIMITER ;


-- Dump completed on 2023-06-03 14:36:26
