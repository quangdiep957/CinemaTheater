-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: db_cinema_dev_01
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `AccountID` char(36) NOT NULL DEFAULT '' COMMENT 'Id của tài khoản',
  `AccountName` varchar(50) NOT NULL DEFAULT '' COMMENT 'Tên tài khoản',
  `Password` varchar(50) NOT NULL DEFAULT '' COMMENT 'Mật khẩu',
  `Role` int NOT NULL COMMENT 'Loại tài khoản',
  `Name` varchar(255) DEFAULT NULL COMMENT 'Họ và tên chủ tài khoản',
  `Gender` int DEFAULT NULL COMMENT 'Giời tính',
  `DateOfBirth` date DEFAULT NULL COMMENT 'Ngày sinh',
  `PhoneNumber` varchar(10) DEFAULT NULL COMMENT 'Số điện thoại',
  `Point` int DEFAULT NULL COMMENT 'Điểm tích lũy',
  `MemberCode` varchar(20) DEFAULT NULL COMMENT 'Mã thành viên',
  `TypeMember` int DEFAULT NULL COMMENT 'Loại thành viên',
  `CreatedDate` datetime DEFAULT NULL COMMENT 'Ngày tạo tài khoản',
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384 COMMENT='Bảng lưu tài khoản - thông tin người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('4555fff1-cd74-11ed-a44f-907841e9040c','admin','admin',1,'Admin',0,'2001-08-18',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountvoucher`
--

DROP TABLE IF EXISTS `accountvoucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountvoucher` (
  `AccountID` char(36) NOT NULL DEFAULT '' COMMENT 'Id của tài khoản',
  `VoucherID` char(36) NOT NULL DEFAULT '' COMMENT 'Id của voucher',
  PRIMARY KEY (`AccountID`,`VoucherID`),
  KEY `FK_AccountVoucher_VoucherID` (`VoucherID`),
  CONSTRAINT `FK_AccountVoucher_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `FK_AccountVoucher_VoucherID` FOREIGN KEY (`VoucherID`) REFERENCES `voucher` (`VoucherID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bảng thông tin chi tiết voucher của tài khoản';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountvoucher`
--

LOCK TABLES `accountvoucher` WRITE;
/*!40000 ALTER TABLE `accountvoucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountvoucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorymovie`
--

DROP TABLE IF EXISTS `categorymovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorymovie` (
  `CategoryID` char(36) NOT NULL DEFAULT '' COMMENT 'Id của thể loại phim',
  `CategoryName` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=1638 COMMENT='Thể loại phim';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorymovie`
--

LOCK TABLES `categorymovie` WRITE;
/*!40000 ALTER TABLE `categorymovie` DISABLE KEYS */;
INSERT INTO `categorymovie` VALUES ('54687a5a-d207-11ed-afa1-0242ac120002','Tình cảm'),('5e260de6-d207-11ed-afa1-0242ac120002','Hoạt hình'),('61aa4b93-d208-11ed-a44f-907841e9040c','Kinh dị'),('61ab1fc2-d208-11ed-a44f-907841e9040c','Kịch'),('61ab21a8-d208-11ed-a44f-907841e9040c','Huyền ảo'),('7685b7d8-d207-11ed-afa1-0242ac120002','Hài hước'),('8cf95452-d207-11ed-afa1-0242ac120002','Khoa học viên tưởng'),('9b43e7b6-d207-11ed-afa1-0242ac120002','Ca nhạc'),('b4bb3e2e-d207-11ed-afa1-0242ac120002','Phiêu lưu'),('ea6a3fa5-d17b-11ed-a44f-907841e9040c','Hành động');
/*!40000 ALTER TABLE `categorymovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `CheckoutID` char(36) NOT NULL DEFAULT '' COMMENT 'Mã thanh toán',
  `TotalAmount` decimal(22,4) DEFAULT NULL COMMENT 'Tổng giá trị thanh toán',
  `CreatedDate` datetime DEFAULT NULL COMMENT 'Ngày tạo',
  `CreatedBy` varchar(255) DEFAULT NULL COMMENT 'Người tạo',
  PRIMARY KEY (`CheckoutID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bảng lưu lịch sử thanh toán ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historydetail`
--

DROP TABLE IF EXISTS `historydetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historydetail` (
  `CheckoutID` char(36) NOT NULL DEFAULT '',
  `TicketID` char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`TicketID`,`CheckoutID`),
  KEY `FK_HistoryDetail_CheckoutID` (`CheckoutID`),
  CONSTRAINT `FK_HistoryDetail_CheckoutID` FOREIGN KEY (`CheckoutID`) REFERENCES `history` (`CheckoutID`) ON DELETE CASCADE,
  CONSTRAINT `FK_HistoryDetail_TicketID` FOREIGN KEY (`TicketID`) REFERENCES `ticket` (`TicketID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bảng chi tiết thanh toán';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historydetail`
--

LOCK TABLES `historydetail` WRITE;
/*!40000 ALTER TABLE `historydetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `historydetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listcinema`
--

DROP TABLE IF EXISTS `listcinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listcinema` (
  `CinemaID` char(36) NOT NULL DEFAULT '' COMMENT 'Id của rạp',
  `CinemaCode` varchar(20) NOT NULL DEFAULT '' COMMENT 'Mã rạp',
  `CinemaName` varchar(500) NOT NULL DEFAULT '' COMMENT 'Tên tạp',
  `CinemaAddress` varchar(500) DEFAULT NULL COMMENT 'Địa chỉ',
  `SortOrder` varchar(10) DEFAULT NULL COMMENT 'Thứ tự',
  `AccountID` char(36) DEFAULT NULL,
  `About` text COMMENT 'Chi tiết',
  `Hotline` varchar(10) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CinemaID`),
  KEY `FK_listcinema_AccountID` (`AccountID`),
  CONSTRAINT `FK_listcinema_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bảng danh sách các rạp chiếu phim';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listcinema`
--

LOCK TABLES `listcinema` WRITE;
/*!40000 ALTER TABLE `listcinema` DISABLE KEYS */;
INSERT INTO `listcinema` VALUES ('6151bc92-d79b-11ed-afa1-0242ac120002','R1','Rạp 01',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `listcinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `MovieID` char(36) NOT NULL DEFAULT '' COMMENT 'Id cuả phim',
  `MovieCode` varchar(20) NOT NULL DEFAULT '' COMMENT 'Mã phim',
  `MovieName` varchar(500) NOT NULL DEFAULT '' COMMENT 'Tên phim',
  `ReleaseDate` datetime DEFAULT NULL COMMENT 'Ngày phát hành',
  `Actor` varchar(500) DEFAULT NULL COMMENT 'Diễn viên',
  `Directions` varchar(255) DEFAULT NULL COMMENT 'Đạo diễn',
  `TypeID` char(36) DEFAULT NULL COMMENT 'Loại phim',
  `Language` varchar(100) DEFAULT NULL COMMENT 'Ngôn ngữ',
  `TrailerLink` varchar(500) DEFAULT NULL COMMENT 'L',
  `PosterLink` varchar(500) DEFAULT NULL,
  `Content` text COMMENT 'Nội dung',
  `FromDate` datetime DEFAULT NULL COMMENT 'Ngày chiếu',
  `ToDate` datetime DEFAULT NULL COMMENT 'Ngày kết thúc chiếu',
  `IsOpen` bit(1) DEFAULT NULL,
  `Tag` varchar(20) DEFAULT NULL COMMENT 'Mác phim (18+, 3+ ,..)',
  `TimeLine` int DEFAULT NULL COMMENT 'Thời lương',
  PRIMARY KEY (`MovieID`),
  KEY `FK_movie_TypeID` (`TypeID`),
  CONSTRAINT `FK_movie_TypeID` FOREIGN KEY (`TypeID`) REFERENCES `typemovie` (`TypeID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=8192 COMMENT='Bảng thông tin phim';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES ('6dce102f-903c-4307-ad21-e2f87b75b8d8','P000','Đoàn','2023-04-11 17:00:00','Đoàn','Đoàn','73db8507-d17b-11ed-a44f-907841e9040c','VN',NULL,'images/3137e238-81b9-4d04-85d6-c746503fc173','Đéo có gì','2023-04-13 17:00:00','2023-04-13 17:00:00',NULL,NULL,100);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moviecategorydetail`
--

DROP TABLE IF EXISTS `moviecategorydetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moviecategorydetail` (
  `MovieID` char(36) NOT NULL DEFAULT '',
  `CategoryID` char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`MovieID`,`CategoryID`),
  KEY `FK_moviecategorydetail_CategoryID` (`CategoryID`),
  CONSTRAINT `FK_moviecategorydetail_CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `categorymovie` (`CategoryID`) ON DELETE CASCADE,
  CONSTRAINT `FK_moviecategorydetail_MovieID` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bảng chi tiết thể loại';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moviecategorydetail`
--

LOCK TABLES `moviecategorydetail` WRITE;
/*!40000 ALTER TABLE `moviecategorydetail` DISABLE KEYS */;
INSERT INTO `moviecategorydetail` VALUES ('6dce102f-903c-4307-ad21-e2f87b75b8d8','9b43e7b6-d207-11ed-afa1-0242ac120002');
/*!40000 ALTER TABLE `moviecategorydetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `RoomID` char(36) NOT NULL DEFAULT '' COMMENT 'Id cua room',
  `RoomCode` varchar(20) NOT NULL DEFAULT '' COMMENT 'Mã của phòng',
  `CinemaID` char(36) DEFAULT NULL COMMENT 'Id rạp phim',
  `RowSeat` int DEFAULT NULL COMMENT 'Số ghế ngồi',
  `ColSeat` int DEFAULT NULL COMMENT 'Cấu trúc phòng',
  `Status` bit(1) DEFAULT b'1' COMMENT 'Tình trạng phòng',
  PRIMARY KEY (`RoomID`),
  KEY `FK_Room_CinemaID` (`CinemaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=8192 COMMENT='Phòng chiếu phim';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('320e3c76-d79b-11ed-afa1-0242ac120002','A1','6151bc92-d79b-11ed-afa1-0242ac120002',5,5,_binary ''),('ae99ed94-d79b-11ed-afa1-0242ac120002','A2','6151bc92-d79b-11ed-afa1-0242ac120002',6,6,_binary '');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomcinema`
--

DROP TABLE IF EXISTS `roomcinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomcinema` (
  `RoomCinemaID` char(36) NOT NULL DEFAULT '' COMMENT 'Id của phòng chiếu hiện tại',
  `RoomID` char(36) DEFAULT NULL,
  `MovieID` char(36) DEFAULT NULL,
  `TemplateTimeCode` varchar(20) DEFAULT NULL,
  `PostDate` date DEFAULT NULL,
  PRIMARY KEY (`RoomCinemaID`),
  KEY `FK_RoomCinema_MovieID` (`MovieID`),
  KEY `FK_RoomCinema_RoomID` (`RoomID`),
  KEY `FK_RoomCinema_TemplateTimeCode` (`TemplateTimeCode`),
  CONSTRAINT `FK_RoomCinema_MovieID` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`) ON DELETE CASCADE,
  CONSTRAINT `FK_RoomCinema_RoomID` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`) ON DELETE CASCADE,
  CONSTRAINT `FK_RoomCinema_TemplateTimeCode` FOREIGN KEY (`TemplateTimeCode`) REFERENCES `templatetimemoiveon` (`TemplateTimeCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384 COMMENT='Phòng đang chiếu phim';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomcinema`
--

LOCK TABLES `roomcinema` WRITE;
/*!40000 ALTER TABLE `roomcinema` DISABLE KEYS */;
INSERT INTO `roomcinema` VALUES ('82195007-ddf5-11ed-8b5d-907841e9040c','ae99ed94-d79b-11ed-afa1-0242ac120002','6dce102f-903c-4307-ad21-e2f87b75b8d8','02','2023-04-06');
/*!40000 ALTER TABLE `roomcinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `SeatID` char(36) NOT NULL DEFAULT '' COMMENT 'Id của ghế',
  `RowSeat` int DEFAULT NULL COMMENT 'Hàng',
  `ColSeat` int DEFAULT NULL COMMENT 'SỐ',
  `RoomID` char(36) DEFAULT NULL COMMENT 'Id phòng',
  `SeatName` varchar(255) DEFAULT NULL COMMENT 'Tên ghế',
  `Type` int DEFAULT NULL COMMENT 'Kiểu',
  PRIMARY KEY (`SeatID`),
  KEY `FK_Seat_RoomID` (`RoomID`),
  CONSTRAINT `FK_Seat_RoomID` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Thông tin ghế ngồi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusroomcinema`
--

DROP TABLE IF EXISTS `statusroomcinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statusroomcinema` (
  `RoomCinemaID` char(36) DEFAULT NULL,
  `ColSeat` int DEFAULT NULL,
  `RowSeat` int DEFAULT NULL,
  `Status` int DEFAULT NULL COMMENT '- 1: Trống, - 2: Có bàn, -3:  Khác'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=655 COMMENT='Bảng lưu trạng thái ghế trong rạp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusroomcinema`
--

LOCK TABLES `statusroomcinema` WRITE;
/*!40000 ALTER TABLE `statusroomcinema` DISABLE KEYS */;
INSERT INTO `statusroomcinema` VALUES ('101542fe-d808-11ed-9a6b-88aedd095151',1,1,1),('101542fe-d808-11ed-9a6b-88aedd095151',2,1,1),('101542fe-d808-11ed-9a6b-88aedd095151',3,1,1),('101542fe-d808-11ed-9a6b-88aedd095151',4,1,1),('101542fe-d808-11ed-9a6b-88aedd095151',5,1,1),('101542fe-d808-11ed-9a6b-88aedd095151',1,2,1),('101542fe-d808-11ed-9a6b-88aedd095151',2,2,1),('101542fe-d808-11ed-9a6b-88aedd095151',3,2,1),('101542fe-d808-11ed-9a6b-88aedd095151',4,2,1),('101542fe-d808-11ed-9a6b-88aedd095151',5,2,1),('101542fe-d808-11ed-9a6b-88aedd095151',1,3,1),('101542fe-d808-11ed-9a6b-88aedd095151',2,3,1),('101542fe-d808-11ed-9a6b-88aedd095151',3,3,1),('101542fe-d808-11ed-9a6b-88aedd095151',4,3,1),('101542fe-d808-11ed-9a6b-88aedd095151',5,3,1),('101542fe-d808-11ed-9a6b-88aedd095151',1,4,1),('101542fe-d808-11ed-9a6b-88aedd095151',2,4,1),('101542fe-d808-11ed-9a6b-88aedd095151',3,4,1),('101542fe-d808-11ed-9a6b-88aedd095151',4,4,1),('101542fe-d808-11ed-9a6b-88aedd095151',5,4,1),('101542fe-d808-11ed-9a6b-88aedd095151',1,5,1),('101542fe-d808-11ed-9a6b-88aedd095151',2,5,1),('101542fe-d808-11ed-9a6b-88aedd095151',3,5,1),('101542fe-d808-11ed-9a6b-88aedd095151',4,5,1),('101542fe-d808-11ed-9a6b-88aedd095151',5,5,1),('dbebc769-d813-11ed-9a6b-88aedd095151',1,1,1),('dbebc769-d813-11ed-9a6b-88aedd095151',2,1,1),('dbebc769-d813-11ed-9a6b-88aedd095151',3,1,1),('dbebc769-d813-11ed-9a6b-88aedd095151',4,1,1),('dbebc769-d813-11ed-9a6b-88aedd095151',5,1,1),('dbebc769-d813-11ed-9a6b-88aedd095151',1,2,1),('dbebc769-d813-11ed-9a6b-88aedd095151',2,2,1),('dbebc769-d813-11ed-9a6b-88aedd095151',3,2,1),('dbebc769-d813-11ed-9a6b-88aedd095151',4,2,1),('dbebc769-d813-11ed-9a6b-88aedd095151',5,2,1),('dbebc769-d813-11ed-9a6b-88aedd095151',1,3,1),('dbebc769-d813-11ed-9a6b-88aedd095151',2,3,1),('dbebc769-d813-11ed-9a6b-88aedd095151',3,3,0),('dbebc769-d813-11ed-9a6b-88aedd095151',4,3,0),('dbebc769-d813-11ed-9a6b-88aedd095151',5,3,1),('dbebc769-d813-11ed-9a6b-88aedd095151',1,4,1),('dbebc769-d813-11ed-9a6b-88aedd095151',2,4,1),('dbebc769-d813-11ed-9a6b-88aedd095151',3,4,1),('dbebc769-d813-11ed-9a6b-88aedd095151',4,4,1),('dbebc769-d813-11ed-9a6b-88aedd095151',5,4,1),('dbebc769-d813-11ed-9a6b-88aedd095151',1,5,1),('dbebc769-d813-11ed-9a6b-88aedd095151',2,5,1),('dbebc769-d813-11ed-9a6b-88aedd095151',3,5,1),('dbebc769-d813-11ed-9a6b-88aedd095151',4,5,1),('dbebc769-d813-11ed-9a6b-88aedd095151',5,5,1),('08cad548-d815-11ed-9a6b-88aedd095151',1,1,1),('08cad548-d815-11ed-9a6b-88aedd095151',2,1,0),('08cad548-d815-11ed-9a6b-88aedd095151',3,1,0),('08cad548-d815-11ed-9a6b-88aedd095151',4,1,0),('08cad548-d815-11ed-9a6b-88aedd095151',5,1,1),('08cad548-d815-11ed-9a6b-88aedd095151',6,1,1),('08cad548-d815-11ed-9a6b-88aedd095151',1,2,0),('08cad548-d815-11ed-9a6b-88aedd095151',2,2,0),('08cad548-d815-11ed-9a6b-88aedd095151',3,2,0),('08cad548-d815-11ed-9a6b-88aedd095151',4,2,0),('08cad548-d815-11ed-9a6b-88aedd095151',5,2,0),('08cad548-d815-11ed-9a6b-88aedd095151',6,2,1),('08cad548-d815-11ed-9a6b-88aedd095151',1,3,0),('08cad548-d815-11ed-9a6b-88aedd095151',2,3,0),('08cad548-d815-11ed-9a6b-88aedd095151',3,3,0),('08cad548-d815-11ed-9a6b-88aedd095151',4,3,0),('08cad548-d815-11ed-9a6b-88aedd095151',5,3,0),('08cad548-d815-11ed-9a6b-88aedd095151',6,3,1),('08cad548-d815-11ed-9a6b-88aedd095151',1,4,1),('08cad548-d815-11ed-9a6b-88aedd095151',2,4,1),('08cad548-d815-11ed-9a6b-88aedd095151',3,4,0),('08cad548-d815-11ed-9a6b-88aedd095151',4,4,0),('08cad548-d815-11ed-9a6b-88aedd095151',5,4,1),('08cad548-d815-11ed-9a6b-88aedd095151',6,4,1),('08cad548-d815-11ed-9a6b-88aedd095151',1,5,1),('08cad548-d815-11ed-9a6b-88aedd095151',2,5,1),('08cad548-d815-11ed-9a6b-88aedd095151',3,5,1),('08cad548-d815-11ed-9a6b-88aedd095151',4,5,1),('08cad548-d815-11ed-9a6b-88aedd095151',5,5,1),('08cad548-d815-11ed-9a6b-88aedd095151',6,5,1),('08cad548-d815-11ed-9a6b-88aedd095151',1,6,1),('08cad548-d815-11ed-9a6b-88aedd095151',2,6,1),('08cad548-d815-11ed-9a6b-88aedd095151',3,6,1),('08cad548-d815-11ed-9a6b-88aedd095151',4,6,1),('08cad548-d815-11ed-9a6b-88aedd095151',5,6,1),('08cad548-d815-11ed-9a6b-88aedd095151',6,6,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,1,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,1,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,1,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,1,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,1,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,1,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,2,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,2,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,2,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,2,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,2,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,2,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,3,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,3,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,3,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,3,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,3,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,3,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,4,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,4,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,4,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,4,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,4,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,4,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,5,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,5,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,5,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,5,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,5,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,5,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,6,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,6,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,6,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,6,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,6,1),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,6,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,1,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,1,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,1,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,1,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,1,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,2,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,2,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,2,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,2,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,2,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,3,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,3,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,3,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,3,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,3,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,4,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,4,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,4,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,4,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,4,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,5,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,5,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,5,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,5,1),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,5,1),('82195007-ddf5-11ed-8b5d-907841e9040c',1,1,1),('82195007-ddf5-11ed-8b5d-907841e9040c',2,1,1),('82195007-ddf5-11ed-8b5d-907841e9040c',3,1,1),('82195007-ddf5-11ed-8b5d-907841e9040c',4,1,1),('82195007-ddf5-11ed-8b5d-907841e9040c',5,1,1),('82195007-ddf5-11ed-8b5d-907841e9040c',6,1,1),('82195007-ddf5-11ed-8b5d-907841e9040c',1,2,1),('82195007-ddf5-11ed-8b5d-907841e9040c',2,2,1),('82195007-ddf5-11ed-8b5d-907841e9040c',3,2,1),('82195007-ddf5-11ed-8b5d-907841e9040c',4,2,1),('82195007-ddf5-11ed-8b5d-907841e9040c',5,2,1),('82195007-ddf5-11ed-8b5d-907841e9040c',6,2,1),('82195007-ddf5-11ed-8b5d-907841e9040c',1,3,1),('82195007-ddf5-11ed-8b5d-907841e9040c',2,3,1),('82195007-ddf5-11ed-8b5d-907841e9040c',3,3,1),('82195007-ddf5-11ed-8b5d-907841e9040c',4,3,1),('82195007-ddf5-11ed-8b5d-907841e9040c',5,3,1),('82195007-ddf5-11ed-8b5d-907841e9040c',6,3,1),('82195007-ddf5-11ed-8b5d-907841e9040c',1,4,1),('82195007-ddf5-11ed-8b5d-907841e9040c',2,4,1),('82195007-ddf5-11ed-8b5d-907841e9040c',3,4,1),('82195007-ddf5-11ed-8b5d-907841e9040c',4,4,1),('82195007-ddf5-11ed-8b5d-907841e9040c',5,4,1),('82195007-ddf5-11ed-8b5d-907841e9040c',6,4,1),('82195007-ddf5-11ed-8b5d-907841e9040c',1,5,1),('82195007-ddf5-11ed-8b5d-907841e9040c',2,5,1),('82195007-ddf5-11ed-8b5d-907841e9040c',3,5,1),('82195007-ddf5-11ed-8b5d-907841e9040c',4,5,1),('82195007-ddf5-11ed-8b5d-907841e9040c',5,5,1),('82195007-ddf5-11ed-8b5d-907841e9040c',6,5,1),('82195007-ddf5-11ed-8b5d-907841e9040c',1,6,1),('82195007-ddf5-11ed-8b5d-907841e9040c',2,6,1),('82195007-ddf5-11ed-8b5d-907841e9040c',3,6,1),('82195007-ddf5-11ed-8b5d-907841e9040c',4,6,1),('82195007-ddf5-11ed-8b5d-907841e9040c',5,6,1),('82195007-ddf5-11ed-8b5d-907841e9040c',6,6,1);
/*!40000 ALTER TABLE `statusroomcinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatepirce`
--

DROP TABLE IF EXISTS `templatepirce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatepirce` (
  `MovieID` char(36) NOT NULL DEFAULT '' COMMENT 'Id của movie',
  `TemplateTimeCode` varchar(20) NOT NULL DEFAULT '' COMMENT 'Mã thời gian',
  `Price` decimal(22,4) DEFAULT NULL COMMENT 'Giá',
  PRIMARY KEY (`MovieID`,`TemplateTimeCode`),
  KEY `FK_TemplatePirce_TemplateTimeCode` (`TemplateTimeCode`),
  CONSTRAINT `FK_TemplatePirce_MovieID` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`) ON DELETE CASCADE,
  CONSTRAINT `FK_TemplatePirce_TemplateTimeCode` FOREIGN KEY (`TemplateTimeCode`) REFERENCES `templatetimemoiveon` (`TemplateTimeCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bảng template giá theo giờ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatepirce`
--

LOCK TABLES `templatepirce` WRITE;
/*!40000 ALTER TABLE `templatepirce` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatepirce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatetimemoiveon`
--

DROP TABLE IF EXISTS `templatetimemoiveon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatetimemoiveon` (
  `TemplateTimeCode` varchar(20) NOT NULL DEFAULT '' COMMENT 'Code của template',
  `Time` varchar(255) DEFAULT NULL COMMENT 'Giờ',
  PRIMARY KEY (`TemplateTimeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=8192 COMMENT='Bảng lưu template của khung giờ chiếu phim';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatetimemoiveon`
--

LOCK TABLES `templatetimemoiveon` WRITE;
/*!40000 ALTER TABLE `templatetimemoiveon` DISABLE KEYS */;
INSERT INTO `templatetimemoiveon` VALUES ('01','17:30:00'),('02','18:30:00');
/*!40000 ALTER TABLE `templatetimemoiveon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TicketID` char(36) NOT NULL DEFAULT '' COMMENT 'Id của vé xem phim',
  `RoomCinemaID` char(36) DEFAULT NULL COMMENT 'Id của phòng xem phim',
  `AccountID` char(36) DEFAULT NULL COMMENT 'Id của account',
  `SeatID` char(36) DEFAULT NULL COMMENT 'Id của ghế ngồi',
  `Type` int DEFAULT NULL COMMENT 'Loại ghế ngồi',
  `IsExport` bit(1) DEFAULT NULL COMMENT 'Đã xuất vé ',
  `TimeMovie` time DEFAULT NULL COMMENT 'Giờ xem phim',
  `CreatedDate` datetime DEFAULT NULL COMMENT 'Ngày tạo',
  `CreatedBy` varchar(255) DEFAULT NULL COMMENT 'Người tạo',
  `Cost` decimal(22,4) DEFAULT NULL COMMENT 'Giá vé',
  PRIMARY KEY (`TicketID`),
  KEY `FK_Ticket_AccountID` (`AccountID`),
  KEY `FK_Ticket_RoomCinemaID` (`RoomCinemaID`),
  KEY `FK_Ticket_SeatID` (`SeatID`),
  CONSTRAINT `FK_Ticket_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Ticket_RoomCinemaID` FOREIGN KEY (`RoomCinemaID`) REFERENCES `roomcinema` (`RoomCinemaID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Ticket_SeatID` FOREIGN KEY (`SeatID`) REFERENCES `seat` (`SeatID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Vé';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typemovie`
--

DROP TABLE IF EXISTS `typemovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typemovie` (
  `TypeID` char(36) NOT NULL DEFAULT '' COMMENT 'Id của loại phim',
  `TypeCode` varchar(20) DEFAULT NULL COMMENT 'Code của loại phim',
  `TypeName` varchar(500) DEFAULT NULL COMMENT 'Tên của loại phim',
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384 COMMENT='Bảng danh sách loại phim';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typemovie`
--

LOCK TABLES `typemovie` WRITE;
/*!40000 ALTER TABLE `typemovie` DISABLE KEYS */;
INSERT INTO `typemovie` VALUES ('73db8507-d17b-11ed-a44f-907841e9040c','3D','Phim 3D');
/*!40000 ALTER TABLE `typemovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
  `VoucherID` char(36) NOT NULL DEFAULT '' COMMENT 'Id của voucher',
  `VoucherCode` varchar(20) NOT NULL DEFAULT '' COMMENT 'Code của voucher',
  `VoucherName` varchar(255) DEFAULT NULL COMMENT 'Tên voucher',
  `VoucherType` int DEFAULT NULL COMMENT 'Loại voucher',
  `DiscountAmount` int DEFAULT NULL COMMENT 'Tỷ lệ giảm giá / khấu trừ',
  PRIMARY KEY (`VoucherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bảng danh sách các voucher';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-19 18:03:50
