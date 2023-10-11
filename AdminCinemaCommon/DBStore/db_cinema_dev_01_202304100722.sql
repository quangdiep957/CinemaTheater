﻿--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.338.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 4/10/2023 7:22:14 AM
-- Server version: 8.0.31
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE db_cinema_dev_01;

--
-- Drop procedure `Proc_GetAccountIDRole`
--
DROP PROCEDURE IF EXISTS Proc_GetAccountIDRole;

--
-- Drop procedure `Proc_CreateNewRoomSeat`
--
DROP PROCEDURE IF EXISTS Proc_CreateNewRoomSeat;

--
-- Drop procedure `Proc_GetSeatRoomCinema`
--
DROP PROCEDURE IF EXISTS Proc_GetSeatRoomCinema;

--
-- Drop procedure `Proc_UpdateSeatRoomCinema`
--
DROP PROCEDURE IF EXISTS Proc_UpdateSeatRoomCinema;

--
-- Drop table `statusroomcinema`
--
DROP TABLE IF EXISTS statusroomcinema;

--
-- Drop table `accountvoucher`
--
DROP TABLE IF EXISTS accountvoucher;

--
-- Drop table `voucher`
--
DROP TABLE IF EXISTS voucher;

--
-- Drop table `historydetail`
--
DROP TABLE IF EXISTS historydetail;

--
-- Drop table `history`
--
DROP TABLE IF EXISTS history;

--
-- Drop procedure `Proc_InsertNewMovie`
--
DROP PROCEDURE IF EXISTS Proc_InsertNewMovie;

--
-- Drop procedure `Proc_UpdateMovie`
--
DROP PROCEDURE IF EXISTS Proc_UpdateMovie;

--
-- Drop table `moviecategorydetail`
--
DROP TABLE IF EXISTS moviecategorydetail;

--
-- Drop procedure `Proc_GetCategoryMovie`
--
DROP PROCEDURE IF EXISTS Proc_GetCategoryMovie;

--
-- Drop table `categorymovie`
--
DROP TABLE IF EXISTS categorymovie;

--
-- Drop table `ticket`
--
DROP TABLE IF EXISTS ticket;

--
-- Drop table `roomcinema`
--
DROP TABLE IF EXISTS roomcinema;

--
-- Drop table `templatepirce`
--
DROP TABLE IF EXISTS templatepirce;

--
-- Drop table `templatetimemoiveon`
--
DROP TABLE IF EXISTS templatetimemoiveon;

--
-- Drop procedure `Proc_DeleteMovieByID`
--
DROP PROCEDURE IF EXISTS Proc_DeleteMovieByID;

--
-- Drop procedure `Proc_DeleteMovies`
--
DROP PROCEDURE IF EXISTS Proc_DeleteMovies;

--
-- Drop procedure `Proc_GetListMovie`
--
DROP PROCEDURE IF EXISTS Proc_GetListMovie;

--
-- Drop table `movie`
--
DROP TABLE IF EXISTS movie;

--
-- Drop procedure `Proc_GetTypeMovie`
--
DROP PROCEDURE IF EXISTS Proc_GetTypeMovie;

--
-- Drop table `typemovie`
--
DROP TABLE IF EXISTS typemovie;

--
-- Drop table `seat`
--
DROP TABLE IF EXISTS seat;

--
-- Drop table `room`
--
DROP TABLE IF EXISTS room;

--
-- Drop table `listcinema`
--
DROP TABLE IF EXISTS listcinema;

--
-- Drop table `account`
--
DROP TABLE IF EXISTS account;

--
-- Set default database
--
USE db_cinema_dev_01;

--
-- Create table `account`
--
CREATE TABLE account (
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

--
-- Create table `listcinema`
--
CREATE TABLE listcinema (
  CinemaID char(36) NOT NULL DEFAULT '' COMMENT 'Id của rạp',
  CinemaCode varchar(20) NOT NULL DEFAULT '' COMMENT 'Mã rạp',
  CinemaName varchar(500) NOT NULL DEFAULT '' COMMENT 'Tên tạp',
  CinemaAddress varchar(500) DEFAULT NULL COMMENT 'Địa chỉ',
  SortOrder varchar(10) DEFAULT NULL COMMENT 'Thứ tự',
  AccountID char(36) DEFAULT NULL,
  About text DEFAULT NULL COMMENT 'Chi tiết',
  Hotline varchar(10) DEFAULT NULL,
  Fax varchar(20) DEFAULT NULL,
  PRIMARY KEY (CinemaID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng danh sách các rạp chiếu phim';

--
-- Create foreign key
--
ALTER TABLE listcinema
ADD CONSTRAINT FK_listcinema_AccountID FOREIGN KEY (AccountID)
REFERENCES account (AccountID) ON DELETE CASCADE;

--
-- Create table `room`
--
CREATE TABLE room (
  RoomID char(36) NOT NULL DEFAULT '' COMMENT 'Id cua room',
  RoomCode varchar(20) NOT NULL DEFAULT '' COMMENT 'Mã của phòng',
  CinemaID char(36) DEFAULT NULL COMMENT 'Id rạp phim',
  TotalSeat int DEFAULT NULL COMMENT 'Số ghế ngồi',
  TemplateRoom varchar(200) DEFAULT NULL COMMENT 'Cấu trúc phòng',
  PRIMARY KEY (RoomID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Phòng chiếu phim';

--
-- Create foreign key
--
ALTER TABLE room
ADD CONSTRAINT FK_Room_CinemaID FOREIGN KEY (CinemaID)
REFERENCES listcinema (CinemaID) ON DELETE CASCADE;

--
-- Create table `seat`
--
CREATE TABLE seat (
  SeatID char(36) NOT NULL DEFAULT '' COMMENT 'Id của ghế',
  `Row` varchar(20) DEFAULT NULL COMMENT 'Hàng',
  Number varchar(20) DEFAULT NULL COMMENT 'SỐ',
  RoomID char(36) DEFAULT NULL COMMENT 'Id phòng',
  SeatName varchar(255) DEFAULT NULL COMMENT 'Tên ghế',
  Type int DEFAULT NULL COMMENT 'Kiểu',
  PRIMARY KEY (SeatID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Thông tin ghế ngồi';

--
-- Create foreign key
--
ALTER TABLE seat
ADD CONSTRAINT FK_Seat_RoomID FOREIGN KEY (RoomID)
REFERENCES room (RoomID) ON DELETE CASCADE;

--
-- Create table `typemovie`
--
CREATE TABLE typemovie (
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

--
-- Create procedure `Proc_GetTypeMovie`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetTypeMovie ()
COMMENT 'Thủ tục lấy danh sách loại phim'
BEGIN
  DROP TEMPORARY TABLE IF EXISTS tmpTable;
  CREATE TEMPORARY TABLE tmpTable (
    TypeID char(36),
    TypeName varchar(500)
  );

  INSERT INTO tmpTable
    SELECT
      t.TypeID,
      t.TypeName
    FROM typemovie t;

  SELECT
    *
  FROM tmpTable;
END
$$

DELIMITER ;

--
-- Create table `movie`
--
CREATE TABLE movie (
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
  PRIMARY KEY (MovieID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng thông tin phim';

--
-- Create foreign key
--
ALTER TABLE movie
ADD CONSTRAINT FK_movie_TypeID FOREIGN KEY (TypeID)
REFERENCES typemovie (TypeID) ON DELETE CASCADE;

DELIMITER $$

--
-- Create procedure `Proc_GetListMovie`
--
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
      CASE WHEN m.FromDate <= $TimeNow AND
          m.ToDate >= $TimeNow THEN 1 WHEN $TimeNow < m.FromDate THEN 2 ELSE 3 END AS Period
    FROM movie m
    WHERE ($MovieCode IS NULL
    OR m.MovieCode LIKE CONCAT('%', $MovieCode, '%'))
    AND ($MovieName IS NULL
    OR m.MovieName LIKE CONCAT('%', $MovieName, '%'))
    AND ($Actor IS NULL
    OR m.Actor LIKE CONCAT('%', $Actor, '%'))
    AND ($Direction IS NULL
    OR m.Directions LIKE CONCAT('%', $Direction, '%'));


  SELECT
    *
  FROM tmpTable
  WHERE ($TypeFilter = 0
  OR $TypeFilter = Period);
END
$$

--
-- Create procedure `Proc_DeleteMovies`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_DeleteMovies (IN $MovieIDs varchar(255))
COMMENT 'Hàm thực hiện xóa phim'
BEGIN
  DELETE
    FROM movie
  WHERE MovieID IN ($MovieIDs);
END
$$

--
-- Create procedure `Proc_DeleteMovieByID`
--
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

--
-- Create table `templatetimemoiveon`
--
CREATE TABLE templatetimemoiveon (
  TemplateTimeCode varchar(20) NOT NULL DEFAULT '' COMMENT 'Code của template',
  Time time DEFAULT NULL COMMENT 'Giờ',
  PRIMARY KEY (TemplateTimeCode)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng lưu template của khung giờ chiếu phim';

--
-- Create table `templatepirce`
--
CREATE TABLE templatepirce (
  MovieID char(36) NOT NULL DEFAULT '' COMMENT 'Id của movie',
  TemplateTimeCode varchar(20) NOT NULL DEFAULT '' COMMENT 'Mã thời gian',
  Price decimal(22, 4) DEFAULT NULL COMMENT 'Giá',
  PRIMARY KEY (MovieID, TemplateTimeCode)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng template giá theo giờ';

--
-- Create foreign key
--
ALTER TABLE templatepirce
ADD CONSTRAINT FK_TemplatePirce_MovieID FOREIGN KEY (MovieID)
REFERENCES movie (MovieID) ON DELETE CASCADE;

--
-- Create foreign key
--
ALTER TABLE templatepirce
ADD CONSTRAINT FK_TemplatePirce_TemplateTimeCode FOREIGN KEY (TemplateTimeCode)
REFERENCES templatetimemoiveon (TemplateTimeCode) ON DELETE CASCADE;

--
-- Create table `roomcinema`
--
CREATE TABLE roomcinema (
  RoomCinemaID char(36) NOT NULL DEFAULT '' COMMENT 'Id của phòng chiếu hiện tại',
  RoomID char(36) DEFAULT NULL,
  MovieID char(36) DEFAULT NULL,
  TemplateTimeCode varchar(20) DEFAULT NULL,
  PRIMARY KEY (RoomCinemaID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Phòng đang chiếu phim';

--
-- Create foreign key
--
ALTER TABLE roomcinema
ADD CONSTRAINT FK_RoomCinema_MovieID FOREIGN KEY (MovieID)
REFERENCES movie (MovieID) ON DELETE CASCADE;

--
-- Create foreign key
--
ALTER TABLE roomcinema
ADD CONSTRAINT FK_RoomCinema_RoomID FOREIGN KEY (RoomID)
REFERENCES room (RoomID) ON DELETE CASCADE;

--
-- Create foreign key
--
ALTER TABLE roomcinema
ADD CONSTRAINT FK_RoomCinema_TemplateTimeCode FOREIGN KEY (TemplateTimeCode)
REFERENCES templatetimemoiveon (TemplateTimeCode) ON DELETE CASCADE;

--
-- Create table `ticket`
--
CREATE TABLE ticket (
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

--
-- Create foreign key
--
ALTER TABLE ticket
ADD CONSTRAINT FK_Ticket_AccountID FOREIGN KEY (AccountID)
REFERENCES account (AccountID) ON DELETE CASCADE;

--
-- Create foreign key
--
ALTER TABLE ticket
ADD CONSTRAINT FK_Ticket_RoomCinemaID FOREIGN KEY (RoomCinemaID)
REFERENCES roomcinema (RoomCinemaID) ON DELETE CASCADE;

--
-- Create foreign key
--
ALTER TABLE ticket
ADD CONSTRAINT FK_Ticket_SeatID FOREIGN KEY (SeatID)
REFERENCES seat (SeatID) ON DELETE CASCADE;

--
-- Create table `categorymovie`
--
CREATE TABLE categorymovie (
  CategoryID char(36) NOT NULL DEFAULT '' COMMENT 'Id của thể loại phim',
  CategoryName varchar(500) DEFAULT NULL,
  PRIMARY KEY (CategoryID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Thể loại phim';

DELIMITER $$

--
-- Create procedure `Proc_GetCategoryMovie`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetCategoryMovie ()
COMMENT 'Thủ tục lấy danh sách thể loại phim'
BEGIN
  DROP TEMPORARY TABLE IF EXISTS tmpTable;
  CREATE TEMPORARY TABLE tmpTable (
    CategoryID char(36),
    CategoryName varchar(500)
  );

  INSERT INTO tmpTable
    SELECT
      t.CategoryID,
      t.CategoryName
    FROM categorymovie t;

  SELECT
    *
  FROM tmpTable;
END
$$

DELIMITER ;

--
-- Create table `moviecategorydetail`
--
CREATE TABLE moviecategorydetail (
  MovieID char(36) NOT NULL DEFAULT '',
  CategoryID char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (MovieID, CategoryID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng chi tiết thể loại';

--
-- Create foreign key
--
ALTER TABLE moviecategorydetail
ADD CONSTRAINT FK_moviecategorydetail_CategoryID FOREIGN KEY (CategoryID)
REFERENCES categorymovie (CategoryID) ON DELETE CASCADE;

--
-- Create foreign key
--
ALTER TABLE moviecategorydetail
ADD CONSTRAINT FK_moviecategorydetail_MovieID FOREIGN KEY (MovieID)
REFERENCES movie (MovieID) ON DELETE CASCADE;

DELIMITER $$

--
-- Create procedure `Proc_UpdateMovie`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_UpdateMovie (IN $MovieCode varchar(20), IN $MovieName varchar(500), IN $ReleaseDate datetime, IN $Actor varchar(500), IN $Directions varchar(255), IN $TypeID char(36), IN $Language varchar(100), IN $TrailerLink varchar(500), IN $PosterLink varchar(500), IN $Content text, IN $FromDate datetime, IN $ToDate datetime, IN $IsOpen bit, IN $Tag varchar(20), IN $CategoryIDs varchar(255), IN $MovieID char(36))
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

  DELETE
    FROM movie
  WHERE MovieID = $MovieID;

  DELETE
    FROM moviecategorydetail
  WHERE MovieID = $MovieID;

  INSERT INTO movie (MovieID, MovieCode, MovieName, ReleaseDate, Actor, Directions, TypeID, Language, TrailerLink, PosterLink, Content, FromDate, ToDate, IsOpen, Tag)
    VALUES ($MovieID, $MovieCode, $MovieName, $ReleaseDate, $Actor, $Directions, $TypeID, $Language, $TrailerLink, $PosterLink, $Content, $FromDate, $ToDate, NULL, $Tag)
  ;

  INSERT INTO moviecategorydetail
    SELECT
      $MovieID,
      tt.ID
    FROM tmpTable tt;
END
$$

--
-- Create procedure `Proc_InsertNewMovie`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_InsertNewMovie (IN $MovieCode varchar(20), IN $MovieName varchar(500), IN $ReleaseDate datetime, IN $Actor varchar(500), IN $Directions varchar(255), IN $TypeID char(36), IN $Language varchar(100), IN $TrailerLink varchar(500), IN $PosterLink varchar(500), IN $Content text, IN $FromDate datetime, IN $ToDate datetime, IN $IsOpen bit, IN $Tag varchar(20), IN $CategoryIDs varchar(255), IN $MovieID char(36))
COMMENT 'Thủ tục thêm mới phim'
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

  INSERT INTO movie (MovieID, MovieCode, MovieName, ReleaseDate, Actor, Directions, TypeID, Language, TrailerLink, PosterLink, Content, FromDate, ToDate, IsOpen, Tag)
    VALUES ($MovieID, $MovieCode, $MovieName, $ReleaseDate, $Actor, $Directions, $TypeID, $Language, $TrailerLink, $PosterLink, $Content, $FromDate, $ToDate, NULL, $Tag)
  ;

  INSERT INTO moviecategorydetail
    SELECT
      $MovieID,
      tt.ID
    FROM tmpTable tt;

END
$$

DELIMITER ;

--
-- Create table `history`
--
CREATE TABLE history (
  CheckoutID char(36) NOT NULL DEFAULT '' COMMENT 'Mã thanh toán',
  TotalAmount decimal(22, 4) DEFAULT NULL COMMENT 'Tổng giá trị thanh toán',
  CreatedDate datetime DEFAULT NULL COMMENT 'Ngày tạo',
  CreatedBy varchar(255) DEFAULT NULL COMMENT 'Người tạo',
  PRIMARY KEY (CheckoutID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng lưu lịch sử thanh toán ';

--
-- Create table `historydetail`
--
CREATE TABLE historydetail (
  CheckoutID char(36) NOT NULL DEFAULT '',
  TicketID char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (TicketID, CheckoutID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng chi tiết thanh toán';

--
-- Create foreign key
--
ALTER TABLE historydetail
ADD CONSTRAINT FK_HistoryDetail_CheckoutID FOREIGN KEY (CheckoutID)
REFERENCES history (CheckoutID) ON DELETE CASCADE;

--
-- Create foreign key
--
ALTER TABLE historydetail
ADD CONSTRAINT FK_HistoryDetail_TicketID FOREIGN KEY (TicketID)
REFERENCES ticket (TicketID) ON DELETE CASCADE;

--
-- Create table `voucher`
--
CREATE TABLE voucher (
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

--
-- Create table `accountvoucher`
--
CREATE TABLE accountvoucher (
  AccountID char(36) NOT NULL DEFAULT '' COMMENT 'Id của tài khoản',
  VoucherID char(36) NOT NULL DEFAULT '' COMMENT 'Id của voucher',
  PRIMARY KEY (AccountID, VoucherID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng thông tin chi tiết voucher của tài khoản';

--
-- Create foreign key
--
ALTER TABLE accountvoucher
ADD CONSTRAINT FK_AccountVoucher_AccountID FOREIGN KEY (AccountID)
REFERENCES account (AccountID) ON DELETE CASCADE;

--
-- Create foreign key
--
ALTER TABLE accountvoucher
ADD CONSTRAINT FK_AccountVoucher_VoucherID FOREIGN KEY (VoucherID)
REFERENCES voucher (VoucherID) ON DELETE CASCADE;

--
-- Create table `statusroomcinema`
--
CREATE TABLE statusroomcinema (
  RoomCinemaID char(36) DEFAULT NULL,
  ColSeat int DEFAULT NULL,
  RowSeat int DEFAULT NULL,
  Status int DEFAULT NULL COMMENT '- 1: Trống, - 2: Có bàn, -3:  Khác'
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 655,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng lưu trạng thái ghế trong rạp';

DELIMITER $$

--
-- Create procedure `Proc_UpdateSeatRoomCinema`
--
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

--
-- Create procedure `Proc_GetSeatRoomCinema`
--
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
    RoomCinemaID char(36)
  );

  INSERT INTO tmpTable
    SELECT
      s.ColSeat,
      s.RowSeat,
      s.Status,
      s.RoomCinemaID
    FROM statusroomcinema s
    WHERE s.RoomCinemaID = $RoomCinemaID;

  SELECT
    *
  FROM tmpTable tt
  ORDER BY tt.RowSeat, tt.ColSeat;


END
$$

--
-- Create procedure `Proc_CreateNewRoomSeat`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_CreateNewRoomSeat (IN $Col int, IN $Row int, IN $CinemaRoomID char(36))
COMMENT 'Thủ tục tạo hàng và cột vào trong một room'
BEGIN
  DECLARE i int DEFAULT 1;
  DECLARE j int DEFAULT 1;

  WHILE i <= $Row DO
    WHILE j <= $Col DO
      INSERT INTO statusroomcinema (RoomCinemaID, ColSeat, RowSeat, Status)
        VALUES ($CinemaRoomID, j, i, 1);
      SET j = j + 1;
    END WHILE;

    SET j = 1;
    SET i = i + 1;
  END WHILE;

END
$$

--
-- Create procedure `Proc_GetAccountIDRole`
--
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

DELIMITER ;

-- 
-- Dumping data for table account
--
INSERT INTO account VALUES
('4555fff1-cd74-11ed-a44f-907841e9040c', 'admin', 'admin', 1, 'Admin', 0, '2001-08-18', NULL, NULL, NULL, NULL, NULL, NULL);

-- 
-- Dumping data for table listcinema
--
-- Table db_cinema_dev_01.listcinema does not contain any data (it is empty)

-- 
-- Dumping data for table typemovie
--
INSERT INTO typemovie VALUES
('73db8507-d17b-11ed-a44f-907841e9040c', '3D', 'Phim 3D');

-- 
-- Dumping data for table templatetimemoiveon
--
-- Table db_cinema_dev_01.templatetimemoiveon does not contain any data (it is empty)

-- 
-- Dumping data for table room
--
-- Table db_cinema_dev_01.room does not contain any data (it is empty)

-- 
-- Dumping data for table movie
--
INSERT INTO movie VALUES
('1df72af9-d17c-11ed-a44f-907841e9040c', 'P0001', 'Phim Mới', '2023-04-03 00:00:00', 'Vũ Công Đoàn', 'Vũ Công Đoàn', '73db8507-d17b-11ed-a44f-907841e9040c', 'VN', NULL, 'images/20230218_121800.jpg', 'Phim dành cho trẻ con', '2023-04-03 00:00:00', '2023-04-15 00:00:00', NULL, NULL),
('235afca0-7217-43e0-b4b1-c40c7768b494', 'P012', 'Phim mới hay', '2023-04-05 00:00:00', 'Đoàn', 'Đoàn', '73db8507-d17b-11ed-a44f-907841e9040c', 'VN', NULL, 'images/8d86c480-054b-42e3-85d8-bce19ccf09d8', 'hi', '2023-04-05 00:00:00', '2023-04-05 00:00:00', NULL, NULL);

-- 
-- Dumping data for table seat
--
-- Table db_cinema_dev_01.seat does not contain any data (it is empty)

-- 
-- Dumping data for table roomcinema
--
-- Table db_cinema_dev_01.roomcinema does not contain any data (it is empty)

-- 
-- Dumping data for table categorymovie
--
INSERT INTO categorymovie VALUES
('54687a5a-d207-11ed-afa1-0242ac120002', 'Tình cảm'),
('5e260de6-d207-11ed-afa1-0242ac120002', 'Hoạt hình'),
('61aa4b93-d208-11ed-a44f-907841e9040c', 'Kinh dị'),
('61ab1fc2-d208-11ed-a44f-907841e9040c', 'Kịch'),
('61ab21a8-d208-11ed-a44f-907841e9040c', 'Huyền ảo'),
('7685b7d8-d207-11ed-afa1-0242ac120002', 'Hài hước'),
('8cf95452-d207-11ed-afa1-0242ac120002', 'Khoa học viên tưởng'),
('9b43e7b6-d207-11ed-afa1-0242ac120002', 'Ca nhạc'),
('b4bb3e2e-d207-11ed-afa1-0242ac120002', 'Phiêu lưu'),
('ea6a3fa5-d17b-11ed-a44f-907841e9040c', 'Hành động');

-- 
-- Dumping data for table ticket
--
-- Table db_cinema_dev_01.ticket does not contain any data (it is empty)

-- 
-- Dumping data for table history
--
-- Table db_cinema_dev_01.history does not contain any data (it is empty)

-- 
-- Dumping data for table voucher
--
-- Table db_cinema_dev_01.voucher does not contain any data (it is empty)

-- 
-- Dumping data for table templatepirce
--
-- Table db_cinema_dev_01.templatepirce does not contain any data (it is empty)

-- 
-- Dumping data for table statusroomcinema
--
INSERT INTO statusroomcinema VALUES
('ca589116-d5b2-11ed-a44f-907841e9040c', 1, 1, 1),
('ca589116-d5b2-11ed-a44f-907841e9040c', 2, 1, 1),
('ca589116-d5b2-11ed-a44f-907841e9040c', 3, 1, 1),
('ca589116-d5b2-11ed-a44f-907841e9040c', 4, 1, 1),
('ca589116-d5b2-11ed-a44f-907841e9040c', 5, 1, 1),
('ca589116-d5b2-11ed-a44f-907841e9040c', 1, 2, 1),
('ca589116-d5b2-11ed-a44f-907841e9040c', 2, 2, 1),
('ca589116-d5b2-11ed-a44f-907841e9040c', 3, 2, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 4, 2, 1),
('ca589116-d5b2-11ed-a44f-907841e9040c', 5, 2, 1),
('ca589116-d5b2-11ed-a44f-907841e9040c', 1, 3, 1),
('ca589116-d5b2-11ed-a44f-907841e9040c', 2, 3, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 3, 3, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 4, 3, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 5, 3, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 1, 4, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 2, 4, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 3, 4, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 4, 4, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 5, 4, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 1, 5, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 2, 5, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 3, 5, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 4, 5, 0),
('ca589116-d5b2-11ed-a44f-907841e9040c', 5, 5, 0);

-- 
-- Dumping data for table moviecategorydetail
--
-- Table db_cinema_dev_01.moviecategorydetail does not contain any data (it is empty)

-- 
-- Dumping data for table historydetail
--
-- Table db_cinema_dev_01.historydetail does not contain any data (it is empty)

-- 
-- Dumping data for table accountvoucher
--
-- Table db_cinema_dev_01.accountvoucher does not contain any data (it is empty)

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;