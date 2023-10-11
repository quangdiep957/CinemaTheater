﻿
SET NAMES 'utf8';

DROP PROCEDURE IF EXISTS InsertToHistory;

DROP PROCEDURE IF EXISTS Proc_CreateNewTemplateTime;

DROP PROCEDURE IF EXISTS Proc_GetAccountIDRole;

DROP PROCEDURE IF EXISTS Proc_GetAllAccount;

DROP PROCEDURE IF EXISTS Proc_GetAllAccountTemp;

DROP PROCEDURE IF EXISTS Proc_GetChartMonthByMovie;

DROP PROCEDURE IF EXISTS Proc_GetChartThisMonth;

DROP PROCEDURE IF EXISTS Proc_GetChartThisYearByMonth;

DROP PROCEDURE IF EXISTS Proc_GetCinemaRoom;

DROP PROCEDURE IF EXISTS Proc_GetHistory;

DROP PROCEDURE IF EXISTS Proc_GetListCustomer;

DROP PROCEDURE IF EXISTS Proc_GetListLanguage;

DROP PROCEDURE IF EXISTS Proc_GetRealSeatByRoom;

DROP PROCEDURE IF EXISTS Proc_GetSeatRoomCinema;

DROP PROCEDURE IF EXISTS Proc_GetTemplateTimeCode;

DROP PROCEDURE IF EXISTS Proc_InsertNewLanguage;

DROP PROCEDURE IF EXISTS Proc_UpdateAccount;

DROP TABLE IF EXISTS language;

DROP PROCEDURE IF EXISTS Proc_AcceptAccount;

DROP PROCEDURE IF EXISTS Proc_AddWaitListAccount;

DROP PROCEDURE IF EXISTS Proc_CheckExistAccount;

DROP TABLE IF EXISTS accounttemp;

DROP PROCEDURE IF EXISTS Proc_AddNewDBOptions;

DROP PROCEDURE IF EXISTS Proc_ChangeDBOptions;

DROP PROCEDURE IF EXISTS Proc_GetDBOption;

DROP PROCEDURE IF EXISTS Proc_InsertNewMovie;

DROP PROCEDURE IF EXISTS Proc_UpdateDBOption;

DROP TABLE IF EXISTS dboptions;

DROP PROCEDURE IF EXISTS Proc_GetListTemplateTicket;

DROP PROCEDURE IF EXISTS Proc_InsertToHistory;

DROP PROCEDURE IF EXISTS Proc_UpdateCostOfTicket;

DROP TABLE IF EXISTS templateticketmovie;

DROP PROCEDURE IF EXISTS Proc_CreateNewCinemaRoom;

DROP PROCEDURE IF EXISTS Proc_CreateNewRoomSeat;

DROP PROCEDURE IF EXISTS Proc_UpdateSeatRoomCinema;

DROP TABLE IF EXISTS statusroomcinema;

DROP TABLE IF EXISTS accountvoucher;

DROP TABLE IF EXISTS voucher;

DROP TABLE IF EXISTS historydetail;

DROP TABLE IF EXISTS history;

DROP PROCEDURE IF EXISTS Proc_GetListMovie;

DROP PROCEDURE IF EXISTS Proc_GetMovieByID;

DROP PROCEDURE IF EXISTS Proc_UpdateMovie;

DROP TABLE IF EXISTS moviecategorydetail;

DROP PROCEDURE IF EXISTS Proc_GetCategoryMovie;

DROP PROCEDURE IF EXISTS Proc_InsertCategoryMovie;

DROP TABLE IF EXISTS categorymovie;

DROP TABLE IF EXISTS ticket;

DROP PROCEDURE IF EXISTS Proc_DeleteRoomCinemaVirtual;

DROP PROCEDURE IF EXISTS Proc_GetListRoomCinemaByMovieID;

DROP PROCEDURE IF EXISTS Proc_GetTemplateTimeCodeByMovieID;

DROP TABLE IF EXISTS roomcinema;

DROP TABLE IF EXISTS templatepirce;

DROP PROCEDURE IF EXISTS Proc_InsertTemplateTimeCode;

DROP TABLE IF EXISTS templatetimemoiveon;

DROP PROCEDURE IF EXISTS Proc_DeleteMovieByID;

DROP PROCEDURE IF EXISTS Proc_DeleteMovies;

DROP PROCEDURE IF EXISTS Proc_GetBiggestMovieCode;

DROP PROCEDURE IF EXISTS Proc_GetChartDayByMovie;

DROP TABLE IF EXISTS movie;

DROP PROCEDURE IF EXISTS Proc_GetTypeMovie;

DROP PROCEDURE IF EXISTS Proc_InsertTypeMovie;

DROP TABLE IF EXISTS typemovie;

DROP PROCEDURE IF EXISTS Proc_CreateNewRealRoom;

DROP PROCEDURE IF EXISTS Proc_CreateRealCinemaRoom;

DROP PROCEDURE IF EXISTS Proc_DeleteRealRoom;

DROP PROCEDURE IF EXISTS Proc_UpdateRealSeatRoom;

DROP TABLE IF EXISTS seat;

DROP PROCEDURE IF EXISTS Proc_GetListRoom;

DROP TABLE IF EXISTS room;

DROP TABLE IF EXISTS listcinema;

DROP TABLE IF EXISTS account;

CREATE TABLE IF NOT EXISTS account (
  AccountID char(36) NOT NULL DEFAULT '' COMMENT 'Id của tài khoản',
  AccountName varchar(50) NOT NULL DEFAULT '' COMMENT 'Tên tài khoản',
  Password varchar(50) NOT NULL DEFAULT '' COMMENT 'Mật khẩu',
  Role int NOT NULL COMMENT 'Loại tài khoản',
  Name varchar(255) DEFAULT NULL COMMENT 'Họ và tên chủ tài khoản',
  Gender int DEFAULT NULL COMMENT 'Giời tính',
  DateOfBirth date DEFAULT NULL COMMENT 'Ngày sinh',
  PhoneNumber varchar(10) DEFAULT NULL COMMENT 'Số điện thoại',
  Point int DEFAULT NULL COMMENT 'Điểm tích lũy',
  MemberCode varchar(20) DEFAULT NULL COMMENT 'Mã thành viên',
  TypeMember int DEFAULT NULL COMMENT 'Loại thành viên',
  CreatedDate datetime DEFAULT NULL COMMENT 'Ngày tạo tài khoản',
  Email varchar(100) DEFAULT NULL,
  PRIMARY KEY (AccountID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng lưu tài khoản - thông tin người dùng';

CREATE TABLE IF NOT EXISTS listcinema (
  CinemaID char(36) NOT NULL DEFAULT '' COMMENT 'Id của rạp',
  CinemaCode varchar(20) NOT NULL DEFAULT '' COMMENT 'Mã rạp',
  CinemaName varchar(500) NOT NULL DEFAULT '' COMMENT 'Tên tạp',
  CinemaAddress varchar(500) DEFAULT NULL COMMENT 'Địa chỉ',
  SortOrder varchar(10) DEFAULT NULL COMMENT 'Thứ tự',
  AccountID char(36) DEFAULT NULL,
  About text DEFAULT NULL COMMENT 'Chi tiết',
  Hotline varchar(10) DEFAULT NULL,
  Fax varchar(20) DEFAULT NULL,
  MST varchar(50) DEFAULT NULL,
  PRIMARY KEY (CinemaID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng danh sách các rạp chiếu phim';

ALTER TABLE listcinema
ADD CONSTRAINT FK_listcinema_AccountID FOREIGN KEY (AccountID)
REFERENCES account (AccountID) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS room (
  RoomID char(36) NOT NULL DEFAULT '' COMMENT 'Id cua room',
  RoomCode varchar(20) NOT NULL DEFAULT '' COMMENT 'Mã của phòng',
  CinemaID char(36) DEFAULT NULL COMMENT 'Id rạp phim',
  RowSeat int DEFAULT NULL COMMENT 'Số ghế ngồi',
  ColSeat int DEFAULT NULL COMMENT 'Cấu trúc phòng',
  Status bit(1) DEFAULT b'1' COMMENT 'Tình trạng phòng',
  PRIMARY KEY (RoomID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Phòng chiếu phim';

ALTER TABLE room
ADD CONSTRAINT FK_Room_CinemaID FOREIGN KEY (CinemaID)
REFERENCES listcinema (CinemaID) ON DELETE CASCADE;

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetListRoom ()
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
END
$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS seat (
  SeatID char(36) NOT NULL DEFAULT '' COMMENT 'Id của ghế',
  RowSeat int DEFAULT NULL COMMENT 'Hàng',
  ColSeat int DEFAULT NULL COMMENT 'SỐ',
  RoomID char(36) DEFAULT NULL COMMENT 'Id phòng',
  SeatName varchar(255) DEFAULT NULL COMMENT 'Tên ghế',
  Type int DEFAULT NULL COMMENT '1-ghế thường, 2-vip,3-đôi',
  PRIMARY KEY (SeatID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 291,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Thông tin ghế ngồi';

ALTER TABLE seat
ADD CONSTRAINT FK_Seat_RoomID FOREIGN KEY (RoomID)
REFERENCES room (RoomID) ON DELETE CASCADE;

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_UpdateRealSeatRoom (IN $ListSeatSelected text)
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_DeleteRealRoom(In $RoomID char(36))
BEGIN
	Delete from room r WHERE r.RoomID = $RoomID;
	Delete FROM seat s WHERE s.RoomID = $RoomID;
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_CreateRealCinemaRoom (IN $RoomCode varchar(20), IN $RowSeat int, IN $ColSeat int)
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

END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_CreateNewRealRoom (IN $RoomCode varchar(20), IN $RowSeat int, IN $ColSeat int)
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
END
$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS typemovie (
  TypeID char(36) NOT NULL DEFAULT '' COMMENT 'Id của loại phim',
  TypeCode varchar(20) DEFAULT NULL COMMENT 'Code của loại phim',
  TypeName varchar(500) DEFAULT NULL COMMENT 'Tên của loại phim',
  PRIMARY KEY (TypeID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng danh sách loại phim';

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_InsertTypeMovie (IN $TypeCode varchar(20), IN $TypeName varchar(500))
COMMENT 'Thủ tục thêm mới một loại phim'
BEGIN
  INSERT INTO typemovie (TypeID, TypeCode, TypeName)
    VALUES (UUID(), $TypeCode, $TypeName);
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetTypeMovie ()
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
END
$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS movie (
  MovieID char(36) NOT NULL DEFAULT '' COMMENT 'Id cuả phim',
  MovieCode varchar(20) NOT NULL DEFAULT '' COMMENT 'Mã phim',
  MovieName varchar(500) NOT NULL DEFAULT '' COMMENT 'Tên phim',
  ReleaseDate datetime DEFAULT NULL COMMENT 'Ngày phát hành',
  Actor varchar(500) DEFAULT NULL COMMENT 'Diễn viên',
  Directions varchar(255) DEFAULT NULL COMMENT 'Đạo diễn',
  TypeID char(36) DEFAULT NULL COMMENT 'Loại phim',
  Language varchar(100) DEFAULT NULL COMMENT 'Ngôn ngữ',
  TrailerLink varchar(500) DEFAULT NULL COMMENT 'L',
  PosterLink varchar(500) DEFAULT NULL,
  Content text DEFAULT NULL COMMENT 'Nội dung',
  FromDate datetime DEFAULT NULL COMMENT 'Ngày chiếu',
  ToDate datetime DEFAULT NULL COMMENT 'Ngày kết thúc chiếu',
  IsOpen bit(1) DEFAULT NULL,
  Tag varchar(20) DEFAULT NULL COMMENT 'Mác phim (18+, 3+ ,..)',
  TimeLine int DEFAULT NULL COMMENT 'Thời lương',
  PRIMARY KEY (MovieID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng thông tin phim';

ALTER TABLE movie
ADD CONSTRAINT FK_movie_TypeID FOREIGN KEY (TypeID)
REFERENCES typemovie (TypeID) ON DELETE CASCADE;

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetChartDayByMovie ()
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


END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetBiggestMovieCode ()
COMMENT 'Thủ tục lấy ra chuỗi lớn nhất của movie code'
BEGIN
  SELECT
    m.moviecode AS MovieCode
  FROM movie m
  ORDER BY LENGTH(moviecode) DESC, SUBSTRING(moviecode, 1, 1) DESC, CAST(SUBSTRING(moviecode, 2) AS UNSIGNED) DESC LIMIT 1;
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_DeleteMovies (IN $MovieIDs varchar(255))
COMMENT 'Hàm thực hiện xóa phim'
BEGIN
  DELETE
    FROM movie
  WHERE MovieID IN ($MovieIDs);
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_DeleteMovieByID (IN $MovieID char(36))
COMMENT 'Thủ tục thực hiện xóa phim theo id của phim'
BEGIN
  DELETE
    FROM movie
  WHERE MovieID = $MovieID;
END
$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS templatetimemoiveon (
  TemplateTimeCode varchar(20) NOT NULL DEFAULT '' COMMENT 'Code của template',
  Time varchar(255) DEFAULT NULL COMMENT 'Giờ',
  PRIMARY KEY (TemplateTimeCode)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng lưu template của khung giờ chiếu phim';

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_InsertTemplateTimeCode (IN $TemplateTimeCode varchar(20), IN $Time varchar(255))
COMMENT 'Thủ tục thêm mới múi thời gian'
BEGIN
  INSERT INTO templatetimemoiveon (TemplateTimeCode, Time)
    VALUES ($TemplateTimeCode, $Time);
END
$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS templatepirce (
  MovieID char(36) NOT NULL DEFAULT '' COMMENT 'Id của movie',
  TemplateTimeCode varchar(20) NOT NULL DEFAULT '' COMMENT 'Mã thời gian',
  Price decimal(22, 4) DEFAULT NULL COMMENT 'Giá',
  PRIMARY KEY (MovieID, TemplateTimeCode)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng template giá theo giờ';

ALTER TABLE templatepirce
ADD CONSTRAINT FK_TemplatePirce_MovieID FOREIGN KEY (MovieID)
REFERENCES movie (MovieID) ON DELETE CASCADE;

ALTER TABLE templatepirce
ADD CONSTRAINT FK_TemplatePirce_TemplateTimeCode FOREIGN KEY (TemplateTimeCode)
REFERENCES templatetimemoiveon (TemplateTimeCode) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS roomcinema (
  RoomCinemaID char(36) NOT NULL DEFAULT '' COMMENT 'Id của phòng chiếu hiện tại',
  RoomID char(36) DEFAULT NULL,
  MovieID char(36) DEFAULT NULL,
  TemplateTimeCode varchar(20) DEFAULT NULL,
  PostDate date DEFAULT NULL,
  RoomCode varchar(20) DEFAULT NULL,
  PRIMARY KEY (RoomCinemaID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Phòng đang chiếu phim';

ALTER TABLE roomcinema
ADD CONSTRAINT FK_RoomCinema_MovieID FOREIGN KEY (MovieID)
REFERENCES movie (MovieID) ON DELETE CASCADE;

ALTER TABLE roomcinema
ADD CONSTRAINT FK_RoomCinema_TemplateTimeCode FOREIGN KEY (TemplateTimeCode)
REFERENCES templatetimemoiveon (TemplateTimeCode) ON DELETE CASCADE;

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetTemplateTimeCodeByMovieID (IN $MovieID char(36), IN $PostDate date, IN $RoomID char(36))
COMMENT 'Thủ tục lấy ra danh sách template time code'
BEGIN
  DECLARE tempText text;
  SELECT
    GROUP_CONCAT(r.TemplateTimeCode SEPARATOR ',') INTO tempText
  FROM roomcinema r
  WHERE r.RoomID = $RoomID
  AND r.PostDate = $PostDate;

  SELECT
    *
  FROM templatetimemoiveon t
  WHERE TemplateTimeCode NOT IN (tempText)
  OR tempText IS NULL;
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetListRoomCinemaByMovieID (IN $MovieID char(36), IN $PostDate date)
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

END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_DeleteRoomCinemaVirtual(IN $RoomCinemaID char(36))
BEGIN
	delete from roomcinema t where t.RoomCinemaID = $RoomCinemaID; 
END
$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS ticket (
  TicketID char(36) NOT NULL DEFAULT '' COMMENT 'Id của vé xem phim',
  RoomCinemaID char(36) DEFAULT NULL COMMENT 'Id của phòng xem phim',
  AccountID char(36) DEFAULT NULL COMMENT 'Id của account',
  SeatID char(36) DEFAULT NULL COMMENT 'Id của ghế ngồi',
  Type int DEFAULT NULL COMMENT 'Loại ghế ngồi',
  IsExport bit(1) DEFAULT NULL COMMENT 'Đã xuất vé ',
  TimeMovie time DEFAULT NULL COMMENT 'Giờ xem phim',
  CreatedDate datetime DEFAULT NULL COMMENT 'Ngày tạo',
  CreatedBy varchar(255) DEFAULT NULL COMMENT 'Người tạo',
  Cost decimal(22, 4) DEFAULT NULL COMMENT 'Giá vé',
  PRIMARY KEY (TicketID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Vé';

ALTER TABLE ticket
ADD CONSTRAINT FK_Ticket_AccountID FOREIGN KEY (AccountID)
REFERENCES account (AccountID) ON DELETE CASCADE;

ALTER TABLE ticket
ADD CONSTRAINT FK_Ticket_RoomCinemaID FOREIGN KEY (RoomCinemaID)
REFERENCES roomcinema (RoomCinemaID) ON DELETE CASCADE;

ALTER TABLE ticket
ADD CONSTRAINT FK_Ticket_SeatID FOREIGN KEY (SeatID)
REFERENCES seat (SeatID) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS categorymovie (
  CategoryID char(36) NOT NULL DEFAULT '' COMMENT 'Id của thể loại phim',
  CategoryName varchar(500) DEFAULT NULL,
  CategoryCode varchar(20) DEFAULT NULL,
  PRIMARY KEY (CategoryID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Thể loại phim';

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_InsertCategoryMovie (IN $CategoryName varchar(500), IN $CategoryCode varchar(20))
COMMENT 'THủ tục thêm mới thể loại phim'
BEGIN
  INSERT INTO categorymovie (CategoryID, CategoryName, CategoryCode)
    VALUES (UUID(), $CategoryName, $CategoryCode);
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetCategoryMovie ()
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
END
$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS moviecategorydetail (
  MovieID char(36) NOT NULL DEFAULT '',
  CategoryID char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (MovieID, CategoryID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng chi tiết thể loại';

ALTER TABLE moviecategorydetail
ADD CONSTRAINT FK_moviecategorydetail_CategoryID FOREIGN KEY (CategoryID)
REFERENCES categorymovie (CategoryID) ON DELETE CASCADE;

ALTER TABLE moviecategorydetail
ADD CONSTRAINT FK_moviecategorydetail_MovieID FOREIGN KEY (MovieID)
REFERENCES movie (MovieID) ON DELETE CASCADE;

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_UpdateMovie (IN $MovieCode varchar(20), IN $MovieName varchar(500), IN $ReleaseDate datetime, IN $Actor varchar(500), IN $Directions varchar(255), IN $TypeID char(36), IN $Language varchar(100), IN $TrailerLink varchar(500), IN $PosterLink varchar(500), IN $Content text, IN $FromDate datetime, IN $ToDate datetime, IN $IsOpen bit, IN $Tag varchar(20), IN $CategoryIDs text, IN $MovieID char(36), IN $TimeLine varchar(255))
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetMovieByID (IN $MovieID char(36))
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetListMovie (IN $MovieCode varchar(50), IN $MovieName varchar(200), IN $Actor varchar(200), IN $Direction varchar(200), IN $TypeFilter int)
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
END
$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS history (
  CheckoutID char(36) NOT NULL DEFAULT '' COMMENT 'Mã thanh toán',
  TicketID char(36) NOT NULL,
  MovieID char(36) DEFAULT NULL,
  RoomCinemaID char(36) DEFAULT NULL,
  ParentID char(36) DEFAULT NULL,
  MovieName varchar(1000) DEFAULT NULL,
  CustomerName varchar(255) DEFAULT NULL,
  PhoneNumber varchar(10) DEFAULT NULL,
  TotalAmount decimal(22, 4) DEFAULT NULL COMMENT 'Tổng giá trị thanh toán',
  SeatName varchar(20) DEFAULT NULL,
  TemplateTimeCode varchar(45) DEFAULT NULL,
  CreatedBy varchar(255) DEFAULT NULL COMMENT 'Người tạo',
  CreatedDate datetime DEFAULT NULL COMMENT 'Ngày tạo',
  ShowDate datetime DEFAULT NULL,
  Time varchar(50) DEFAULT NULL,
  Type varchar(45) DEFAULT NULL,
  RoomCode varchar(45) DEFAULT NULL,
  PRIMARY KEY (CheckoutID, TicketID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 481,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng lưu lịch sử thanh toán ';

CREATE TABLE IF NOT EXISTS historydetail (
  CheckoutID char(36) NOT NULL DEFAULT '',
  TicketID char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (TicketID, CheckoutID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng chi tiết thanh toán';

ALTER TABLE historydetail
ADD CONSTRAINT FK_HistoryDetail_CheckoutID FOREIGN KEY (CheckoutID)
REFERENCES history (CheckoutID) ON DELETE CASCADE;

ALTER TABLE historydetail
ADD CONSTRAINT FK_HistoryDetail_TicketID FOREIGN KEY (TicketID)
REFERENCES ticket (TicketID) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS voucher (
  VoucherID char(36) NOT NULL DEFAULT '' COMMENT 'Id của voucher',
  VoucherCode varchar(20) NOT NULL DEFAULT '' COMMENT 'Code của voucher',
  VoucherName varchar(255) DEFAULT NULL COMMENT 'Tên voucher',
  VoucherType int DEFAULT NULL COMMENT 'Loại voucher',
  DiscountAmount int DEFAULT NULL COMMENT 'Tỷ lệ giảm giá / khấu trừ',
  PRIMARY KEY (VoucherID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng danh sách các voucher';

CREATE TABLE IF NOT EXISTS accountvoucher (
  AccountID char(36) NOT NULL DEFAULT '' COMMENT 'Id của tài khoản',
  VoucherID char(36) NOT NULL DEFAULT '' COMMENT 'Id của voucher',
  PRIMARY KEY (AccountID, VoucherID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng thông tin chi tiết voucher của tài khoản';

ALTER TABLE accountvoucher
ADD CONSTRAINT FK_AccountVoucher_AccountID FOREIGN KEY (AccountID)
REFERENCES account (AccountID) ON DELETE CASCADE;

ALTER TABLE accountvoucher
ADD CONSTRAINT FK_AccountVoucher_VoucherID FOREIGN KEY (VoucherID)
REFERENCES voucher (VoucherID) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS statusroomcinema (
  RoomCinemaID char(36) DEFAULT NULL,
  ColSeat int DEFAULT NULL,
  RowSeat int DEFAULT NULL,
  Status int DEFAULT NULL COMMENT '- 1: Trống, - 2: Có bàn, -3:  Khác',
  Type int DEFAULT NULL COMMENT '1: Ghế thường, 2: Ghế vip, 3: Bảo trì,4: không tồn tại'
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 655,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng lưu trạng thái ghế trong rạp';

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_UpdateSeatRoomCinema (IN $ListSeatSelected text)
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_CreateNewRoomSeat (IN $Col int, IN $Row int, IN $CinemaRoomID char(36), IN $RoomID char(36))
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

END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_CreateNewCinemaRoom (IN $RoomID char(36), IN $PostDate date, IN $MovieID char(36), IN $ListTemplateTimeCode varchar(20))
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



END
$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS templateticketmovie (
  TemplateTicketID char(36) NOT NULL,
  MovieID char(36) DEFAULT NULL,
  Type int DEFAULT NULL,
  Cost decimal(22, 4) DEFAULT NULL,
  PRIMARY KEY (TemplateTicketID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1170,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_UpdateCostOfTicket (IN $TemplateTicketID char(36), IN $Cost decimal(22, 4))
BEGIN
  UPDATE templateticketmovie t
  SET t.Cost = $Cost
  WHERE t.TemplateTicketID = $TemplateTicketID;
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_InsertToHistory (IN $CreatedBy varchar(255),
IN $DataTicket text,
IN $CustomerName varchar(255),
IN $PhoneNumber varchar(10),
IN $MovieName varchar(500),
IN $MovieID char(36),
IN $RoomCinemaID char(36),
IN $TemplateTimeCode varchar(20),
IN $ShowDate datetime,
IN $Time varchar(50),
IN $RoomCode varchar(20))
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
    INSERT INTO history (CheckoutID, TicketID, MovieID, RoomCinemaID, ParentID, MovieName, CustomerName, PhoneNumber, TotalAmount, SeatName, TemplateTimeCode, CreatedBy, CreatedDate, ShowDate, Time, Type, RoomCode)
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
        $RoomCode AS RoomCode;
    SET i = i + 1;
  END WHILE;

  INSERT INTO history (CheckoutID, TicketID, MovieID, RoomCinemaID, ParentID, MovieName, CustomerName, PhoneNumber, TotalAmount, SeatName, TemplateTimeCode, CreatedBy, CreatedDate, ShowDate, Time, Type, RoomCode)
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
      $RoomCode AS RoomCode;
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetListTemplateTicket ()
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

END
$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS dboptions (
  NumberKey int NOT NULL AUTO_INCREMENT,
  Keyword varchar(255) NOT NULL,
  KeyValue varchar(255) DEFAULT NULL,
  PRIMARY KEY (NumberKey)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_UpdateDBOption (IN $Keyword varchar(255), IN $KeyValue varchar(255))
BEGIN
  UPDATE dboptions d
  SET d.KeyValue = $KeyValue
  WHERE d.Keyword = $Keyword;
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_InsertNewMovie (IN $MovieCode varchar(20), IN $MovieName varchar(500), IN $ReleaseDate datetime, IN $Actor varchar(500), IN $Directions varchar(255), IN $TypeID char(36), IN $Language varchar(100), IN $TrailerLink varchar(500), IN $PosterLink varchar(500), IN $Content text, IN $FromDate datetime, IN $ToDate datetime, IN $IsOpen bit, IN $Tag varchar(20), IN $CategoryIDs varchar(255), IN $MovieID char(36), IN $TimeLine int)
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

END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetDBOption ()
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_ChangeDBOptions (IN $Keyword varchar(255), IN $KeyValue varchar(255))
BEGIN
  UPDATE dboptions
  SET KeyValue = $KeyValue
  WHERE Keyword = $Keyword;
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_AddNewDBOptions (IN $Keyword varchar(255), IN $KeyValue varchar(255))
BEGIN
  INSERT INTO dboptions (Keyword, KeyValue)
    VALUES ($Keyword, $KeyValue);
END
$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS accounttemp (
  AccountID char(36) NOT NULL DEFAULT '',
  AccountName varchar(50) DEFAULT NULL,
  Password varchar(50) DEFAULT NULL,
  Role int DEFAULT NULL,
  Status int DEFAULT NULL COMMENT '1: chưa phê duyệt,2: từ chối, 3:đã phê duyệt',
  CreatedDate date DEFAULT NULL,
  Name varchar(255) DEFAULT NULL,
  PRIMARY KEY (AccountID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng lưu các tài khoản chờ duyệt';

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_CheckExistAccount (IN $AccountName varchar(50))
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


END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_AddWaitListAccount (IN $AccountName varchar(50), IN $Password varchar(50), IN $Role int, IN $Name varchar(255))
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_AcceptAccount (IN $AccountID char(36), IN $Status int)
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
END
$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS language (
  LanguageCode varchar(10) NOT NULL DEFAULT '' COMMENT 'Mã ngôn ngữ',
  LanguageName varchar(50) DEFAULT NULL COMMENT 'Tên ngôn ngữ',
  PRIMARY KEY (LanguageCode)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng lưu danh mục ngôn ngữ';

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_UpdateAccount (IN $AccountID char(36), IN $Password varchar(50), IN $Role int, IN $Name varchar(255), IN $Gender int, IN $DateOfBirth date, IN $PhoneNumber varchar(10), IN $Email varchar(100))
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_InsertNewLanguage (IN $LanguageCode varchar(10), IN $LanguageName varchar(50))
COMMENT 'Thủ tục thêm mới một ngôn ngữ'
BEGIN
  INSERT INTO language (LanguageCode, LanguageName)
    VALUES ($LanguageCode, $LanguageName);
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetTemplateTimeCode ()
COMMENT 'Thủ tục lấy ra tất cả khung giờ'
BEGIN
  SELECT
    t.TemplateTimeCode AS TemplateTimeCode,
    t.Time AS Time
  FROM templatetimemoiveon t
  ORDER BY t.Time;
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetSeatRoomCinema (IN $RoomCinemaID char(36))
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


END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetRealSeatByRoom (IN $RoomID char(36))
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetListLanguage ()
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetListCustomer ()
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetHistory ()
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
    RoomCode varchar(45)
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
  RoomCode)
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
      RoomCode
    FROM history;

  SELECT
    *
  FROM tmpTable
  ORDER BY CreatedDate DESC, ParentID, Type;
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetCinemaRoom ()
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetChartThisYearByMonth ()
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetChartThisMonth ()
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetChartMonthByMovie (IN $MovieID char(36))
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetAllAccountTemp ()
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetAllAccount ()
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
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetAccountIDRole (IN $account_name varchar(50), IN $account_password varchar(50))
COMMENT 'Thủ tục lấy ra account id và role'
BEGIN
  SELECT
    AccountID AS AccountID,
    Role AS Role
  FROM account
  WHERE AccountName = $account_name
  AND Password = $account_password LIMIT 1;
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_CreateNewTemplateTime (IN $TemplateTimeCode varchar(20), IN $Time varchar(255))
BEGIN
  INSERT INTO templatetimemovieon
    SELECT
      $TemplateTimeCode,
      $Time;
END
$$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE InsertToHistory (IN $TotalAmount decimal, IN $CreatedBy varchar(255), IN $ListSeatID text, IN $CustomerName varchar(255), IN $PhoneNumber varchar(10), IN $MovieName varchar(500), IN $MovieID char(36), IN $RoomCinemaID char(36), IN $TemplateTimeCode varchar(20))
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
END
$$

DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;