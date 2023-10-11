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
-- Table structure for table `DBOptions`
--

DROP TABLE IF EXISTS `DBOptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DBOptions` (
  `NumberKey` int NOT NULL AUTO_INCREMENT,
  `Keyword` varchar(255) NOT NULL,
  `KeyValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NumberKey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DBOptions`
--

LOCK TABLES `DBOptions` WRITE;
/*!40000 ALTER TABLE `DBOptions` DISABLE KEYS */;
INSERT INTO `DBOptions` VALUES (1,'Default_Seat_Normal','50000'),(2,'Default_Seat_VIP','70000');
/*!40000 ALTER TABLE `DBOptions` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `account` VALUES ('4555fff1-cd74-11ed-a44f-907841e9040c','admin','admin',1,'Admin',0,'2001-08-18',NULL,NULL,NULL,NULL,NULL,NULL),('69d3e4b8-e306-11ed-857f-88aedd095151','taikhoan1','taikhoan1',5,'Công Đoàn',1,'2001-08-18','0936561355',0,'0000001',1,'2023-04-25 00:00:00','congdoan123@gmail.com'),('8dff97e8-e283-11ed-a14e-88aedd095151','congdoan','congdoan',2,'employee',0,'2001-08-18',NULL,NULL,NULL,NULL,NULL,NULL);
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
  `TicketID` char(36) NOT NULL,
  `MovieID` char(36) DEFAULT NULL,
  `RoomCinemaID` char(36) DEFAULT NULL,
  `ParentID` char(36) DEFAULT NULL,
  `MovieName` varchar(1000) DEFAULT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL,
  `TotalAmount` decimal(22,4) DEFAULT NULL COMMENT 'Tổng giá trị thanh toán',
  `SeatName` varchar(20) DEFAULT NULL,
  `TemplateTimeCode` varchar(45) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL COMMENT 'Người tạo',
  `CreatedDate` datetime DEFAULT NULL COMMENT 'Ngày tạo',
  `ShowDate` datetime DEFAULT NULL,
  `Time` varchar(50) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `RoomCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CheckoutID`,`TicketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bảng lưu lịch sử thanh toán ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES ('30971dc2-e41c-11ed-9a9a-88aedd095151','30971dcd-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','30971406-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'C4','01','','2023-04-26 17:22:04','2023-04-30 00:00:00','17:30:00','1','A1'),('30979763-e41c-11ed-9a9a-88aedd095151','30979771-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','30971406-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'D4','01','','2023-04-26 17:22:04','2023-04-30 00:00:00','17:30:00','1','A1'),('30981ce8-e41c-11ed-9a9a-88aedd095151','30981cf6-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','','',NULL,NULL,'01','','2023-04-26 17:22:04','2023-04-30 00:00:00','17:30:00','1','A1'),('367c9944-e41c-11ed-9a9a-88aedd095151','367c9977-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','367c8bad-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'D3','01','','2023-04-26 17:22:14','2023-04-30 00:00:00','17:30:00','1','A1'),('367d133b-e41c-11ed-9a9a-88aedd095151','367d134e-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','367c8bad-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'C3','01','','2023-04-26 17:22:14','2023-04-30 00:00:00','17:30:00','1','A1'),('367d91f8-e41c-11ed-9a9a-88aedd095151','367d9227-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','','',NULL,NULL,'01','','2023-04-26 17:22:14','2023-04-30 00:00:00','17:30:00','1','A1'),('6128a9b9-e41c-11ed-9a9a-88aedd095151','6128a9c8-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','61289b4b-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'E7','01','','2023-04-26 17:23:25','2023-04-30 00:00:00','17:30:00','1','A1'),('612a5dd2-e41c-11ed-9a9a-88aedd095151','612a5dfd-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','61289b4b-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'F7','01','','2023-04-26 17:23:25','2023-04-30 00:00:00','17:30:00','1','A1'),('612adb31-e41c-11ed-9a9a-88aedd095151','612adb4a-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','','',NULL,NULL,'01','','2023-04-26 17:23:25','2023-04-30 00:00:00','17:30:00','1','A1'),('ad0f0530-e41b-11ed-9a9a-88aedd095151','ad0f0540-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'E5','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1'),('ad0f75b8-e41b-11ed-9a9a-88aedd095151','ad0f75c7-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'E6','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1'),('ad0fd05f-e41b-11ed-9a9a-88aedd095151','ad0fd074-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'D6','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1'),('ad1047ab-e41b-11ed-9a9a-88aedd095151','ad1047bf-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'D5','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1'),('ad10aab8-e41b-11ed-9a9a-88aedd095151','ad10aacc-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'C5','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1'),('ad10f483-e41b-11ed-9a9a-88aedd095151','ad10f491-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'C6','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1'),('ad114c5d-e41b-11ed-9a9a-88aedd095151','ad114c75-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','','',NULL,NULL,'01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1'),('d59d30f4-e41b-11ed-9a9a-88aedd095151','d59d3115-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','d59d12f5-e41b-11ed-9a9a-88aedd095151','Phim thử 3','Công Đoàn','0936561355',52000.0000,'C7','01','','2023-04-26 17:19:31','2023-04-30 00:00:00','17:30:00','1','A1'),('d59eeb7d-e41b-11ed-9a9a-88aedd095151','d59eebab-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','d59d12f5-e41b-11ed-9a9a-88aedd095151','Phim thử 3','Công Đoàn','0936561355',52000.0000,'D7','01','','2023-04-26 17:19:31','2023-04-30 00:00:00','17:30:00','1','A1'),('d59f6948-e41b-11ed-9a9a-88aedd095151','d59f6975-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','Công Đoàn','0936561355',NULL,NULL,'01','','2023-04-26 17:19:31','2023-04-30 00:00:00','17:30:00','1','A1'),('f756337f-e410-11ed-9a9a-88aedd095151','f75633b3-e410-11ed-9a9a-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151','f755f2a2-e410-11ed-9a9a-88aedd095151','PHIM ANH EM SUPER MARIO','','',NULL,'E5','01','','2023-04-26 16:01:43','2023-04-13 00:00:00','17:30:00',NULL,NULL),('f7572c95-e410-11ed-9a9a-88aedd095151','f7572cb7-e410-11ed-9a9a-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151','f755f2a2-e410-11ed-9a9a-88aedd095151','PHIM ANH EM SUPER MARIO','','',NULL,'F5','01','','2023-04-26 16:01:43','2023-04-13 00:00:00','17:30:00',NULL,NULL),('f757c21d-e410-11ed-9a9a-88aedd095151','f757c24b-e410-11ed-9a9a-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151',NULL,'PHIM ANH EM SUPER MARIO','','',NULL,NULL,'01','','2023-04-26 16:01:43','2023-04-13 00:00:00','17:30:00',NULL,NULL);
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
  `MST` varchar(50) DEFAULT NULL,
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
INSERT INTO `listcinema` VALUES ('6151bc92-d79b-11ed-afa1-0242ac120002','R1','Rạp 01','Hà Nội, Việt Nam',NULL,NULL,'Công ty TNHH Cinema - VN chi nhánh Hà Nội','088888888',NULL,'00325412512314521');
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
INSERT INTO `movie` VALUES ('3aa6c663-36d9-4797-94b9-dcd6dcc51e2e','P0001','PHIM CÚ ÚP RỔ ĐẦU TIÊN','2023-04-04 17:00:00','Masaya Fukunishi, Yoshiaki Hasegawa, Katsuhisa Hoki, Tetsu Inada, Ryota Iwasaki, Shinichiro Kamio, Mitsuaki Kanuka, Jun Kasama, Subaru Kimura,..','Takehiko Inoue, Yasuyuki Ebara','73db8507-d17b-11ed-a44f-907841e9040c','JP',NULL,'images/f2cf4678-8226-4b5a-ad7f-de62454ddda8','Bộ phim hoạt hình chuyển thể từ loạt truyện tranh “Slam Dunk” nổi tiếng của Takehiko Inoue, khắc họa quá trình trưởng thành cá nhân của những học sinh trung học cống hiến tuổi trẻ cho bóng rổ. Phim theo chân Ryota Miyagi, hậu vệ của đội bóng rổ trường trung học Shohoku. Anh có một người anh trai, Sota, hơn anh ba tuổi và là người đã truyền cảm hứng cho tình yêu bóng rổ của anh. Ryota và các đồng đội của mình là Hanamichi Sakuragi, Takenori Akagi, Hisashi Mitsui và Kaede Rukawa thách đấu nhà vô địch bóng rổ liên trường, đội bóng rổ trường trung học Sannoh. Tác giả nguyên tác Inoue phụ trách chỉ đạo và viết kịch bản.','2023-04-05 17:00:00','2023-04-19 17:00:00',NULL,NULL,120),('6e718478-a0c0-4425-bd2c-75a969a286ab','P0003','CREED III: TAY ĐẤM HUYỀN THOẠI','2023-03-31 17:00:00','Michael B. Jordan, Tessa Thompson, Jonathan Majors, Wood Harris, Phylicia Rashad, Mila Davis-Kent, Jose Benavidez, Selenis Leyva, Florian Munteanu','Michael B. Jordan','73db8507-d17b-11ed-a44f-907841e9040c','EN',NULL,'images/3ee7bee5-3f30-4ae9-86df-2b6f1557a3be','Sau khi thống trị thế giới quyền anh, Adonis Creed đã phát triển mạnh mẽ trong cả sự nghiệp và cuộc sống gia đình. Khi một người bạn thời thơ ấu và cựu thần đồng quyền anh, Damian (Jonathan Majors), tái xuất sau khi thụ án tù dài hạn, anh ta háo hức chứng minh rằng mình xứng đáng được trở lại võ đài. Cuộc chạm trán giữa những người bạn cũ không chỉ là một cuộc chiến trên võ đài thông thường. Để có thể chiến thắng, Adonis phải đặt tương lai của mình lên trên hết để chiến đấu với Damian — một võ sĩ không còn gì để mất.','2023-04-06 17:00:00','2023-04-19 17:00:00',NULL,NULL,117),('81ea1112-6d7f-4dee-85d8-15c75785de3c','P0002','PHIM ANH EM SUPER MARIO','2023-03-31 17:00:00','Chris Pratt, Anya Taylor-Joy, Charlie Day, …','Aaron Horvath, Michael Jelenic','73db8507-d17b-11ed-a44f-907841e9040c','EN','','images/3b8502f8-9813-4d58-8952-932622c796ef','Câu chuyện về cuộc phiêu lưu của anh em Super Mario đến vương quốc Nấm.','2023-04-05 17:00:00','2023-04-27 17:00:00',NULL,NULL,93),('ac6b11da-ebef-4889-9f77-a971c292066b','P1112','Phim thử','2023-03-30 17:00:00','Không','Không','73db8507-d17b-11ed-a44f-907841e9040c','VN',NULL,'images/f9c0d534-20c5-4b61-b99a-f525d0e06975','Phim thử','2023-03-31 17:00:00','2023-05-25 17:00:00',NULL,NULL,122),('d6ed7e34-fada-474f-9682-2c2cf3ba4bed','P111','Thử','2023-04-20 17:00:00','Thử','Thử','73db8507-d17b-11ed-a44f-907841e9040c','VN',NULL,'images/b3a1451c-1913-42bb-85a8-cb0513697a67','Thử','2023-04-05 17:00:00','2023-04-12 17:00:00',NULL,NULL,100),('de609974-d6c1-45af-ab26-517885625c6f','P0004','BIỆT ĐỘI RẤT ỔN','2023-03-31 17:00:00','Lê Khánh, Hứa Vĩ Văn, Hoàng Oanh, Quang Tuấn, Võ Tấn Phát, Nguyên Thảo, Ngọc Phước, Ngọc Hoa, Lạc Hoàng Long','Tạ Nguyên Hiệp','73db8507-d17b-11ed-a44f-907841e9040c','VN',NULL,'images/2cd6a515-46bf-4797-bc22-5d184cbd862d','BIỆT ĐỘI RẤT ỔN xoay quanh bộ đôi Quyên (Hoàng Oanh) và Phong (Hứa Vĩ Văn). Sau lần chạm trán tình cờ, bộ đôi lôi kéo Bảy Cục (Võ Tấn Phát), Bảy Súc (Nguyên Thảo), Quạu (Ngọc Phước), Quọ (Ngọc Hoa) tham gia vào phi vụ đặc biệt: Đánh tráo chiếc vòng đính hôn bằng kim cương quý giá và lật tẩy bộ mặt thật của Tuấn - chồng cũ của Quyên trong đám cưới giữa hắn và Tư Xoàn - nữ đại gia miền Tây sở hữu khối tài sản triệu đô. Màn kết hợp bất đắc dĩ của Biệt Đội Rất Ổn - Phong, Quyên và Gia Đình Cục Súc nhằm qua mắt “cô dâu, chú rể” tại khu resort sang chảnh hứa hẹn cực kỳ gay cấn, hồi hộp nhưng không kém phần hài hước, xúc động.','2023-04-06 17:00:00','2023-04-28 17:00:00',NULL,NULL,100);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384 COMMENT='Bảng chi tiết thể loại';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moviecategorydetail`
--

LOCK TABLES `moviecategorydetail` WRITE;
/*!40000 ALTER TABLE `moviecategorydetail` DISABLE KEYS */;
INSERT INTO `moviecategorydetail` VALUES ('6e718478-a0c0-4425-bd2c-75a969a286ab','54687a5a-d207-11ed-afa1-0242ac120002'),('d6ed7e34-fada-474f-9682-2c2cf3ba4bed','54687a5a-d207-11ed-afa1-0242ac120002'),('3aa6c663-36d9-4797-94b9-dcd6dcc51e2e','5e260de6-d207-11ed-afa1-0242ac120002'),('81ea1112-6d7f-4dee-85d8-15c75785de3c','5e260de6-d207-11ed-afa1-0242ac120002'),('ac6b11da-ebef-4889-9f77-a971c292066b','61ab1fc2-d208-11ed-a44f-907841e9040c'),('81ea1112-6d7f-4dee-85d8-15c75785de3c','7685b7d8-d207-11ed-afa1-0242ac120002'),('de609974-d6c1-45af-ab26-517885625c6f','7685b7d8-d207-11ed-afa1-0242ac120002'),('81ea1112-6d7f-4dee-85d8-15c75785de3c','b4bb3e2e-d207-11ed-afa1-0242ac120002');
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
  KEY `FK_Room_CinemaID` (`CinemaID`),
  CONSTRAINT `FK_Room_CinemaID` FOREIGN KEY (`CinemaID`) REFERENCES `listcinema` (`CinemaID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=8192 COMMENT='Phòng chiếu phim';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('68610f42-dec3-11ed-8b5d-907841e9040c','A3',NULL,5,5,_binary ''),('c8210f0e-df44-11ed-bf13-88aedd095151','A1',NULL,10,10,_binary '');
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
  `RoomCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RoomCinemaID`),
  KEY `FK_RoomCinema_MovieID` (`MovieID`),
  KEY `FK_RoomCinema_TemplateTimeCode` (`TemplateTimeCode`),
  CONSTRAINT `FK_RoomCinema_MovieID` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`) ON DELETE CASCADE,
  CONSTRAINT `FK_RoomCinema_TemplateTimeCode` FOREIGN KEY (`TemplateTimeCode`) REFERENCES `templatetimemoiveon` (`TemplateTimeCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384 COMMENT='Phòng đang chiếu phim';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomcinema`
--

LOCK TABLES `roomcinema` WRITE;
/*!40000 ALTER TABLE `roomcinema` DISABLE KEYS */;
INSERT INTO `roomcinema` VALUES ('68861520-e28c-11ed-a14e-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','6e718478-a0c0-4425-bd2c-75a969a286ab','01','2023-04-07',NULL),('820fcf75-e28c-11ed-a14e-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','6e718478-a0c0-4425-bd2c-75a969a286ab','02','2023-04-07',NULL),('aa98ab5e-df49-11ed-bf13-88aedd095151','68610f42-dec3-11ed-8b5d-907841e9040c','6e718478-a0c0-4425-bd2c-75a969a286ab','01','2023-04-13',NULL),('b9cbea88-e336-11ed-857f-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','01','2023-04-13',NULL);
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
  `Type` int DEFAULT NULL COMMENT '1-ghế thường, 2-vip,3-đôi',
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
INSERT INTO `seat` VALUES ('6861c05d-dec3-11ed-8b5d-907841e9040c',1,1,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('68622d17-dec3-11ed-8b5d-907841e9040c',2,1,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6862582c-dec3-11ed-8b5d-907841e9040c',3,1,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('68632c30-dec3-11ed-8b5d-907841e9040c',4,1,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('68636e96-dec3-11ed-8b5d-907841e9040c',5,1,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,4),('6863ae1f-dec3-11ed-8b5d-907841e9040c',1,2,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6863d00b-dec3-11ed-8b5d-907841e9040c',2,2,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6863eb24-dec3-11ed-8b5d-907841e9040c',3,2,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,2),('68641151-dec3-11ed-8b5d-907841e9040c',4,2,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,3),('68642d01-dec3-11ed-8b5d-907841e9040c',5,2,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,4),('6864c3a8-dec3-11ed-8b5d-907841e9040c',1,3,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6864ebbd-dec3-11ed-8b5d-907841e9040c',2,3,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,3),('6865187e-dec3-11ed-8b5d-907841e9040c',3,3,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,2),('68653bbf-dec3-11ed-8b5d-907841e9040c',4,3,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,3),('68656e18-dec3-11ed-8b5d-907841e9040c',5,3,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,4),('6865b2c1-dec3-11ed-8b5d-907841e9040c',1,4,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6865d8b3-dec3-11ed-8b5d-907841e9040c',2,4,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('68660088-dec3-11ed-8b5d-907841e9040c',3,4,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,2),('68661b77-dec3-11ed-8b5d-907841e9040c',4,4,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,3),('6866348a-dec3-11ed-8b5d-907841e9040c',5,4,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,4),('68664d80-dec3-11ed-8b5d-907841e9040c',1,5,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('686668ff-dec3-11ed-8b5d-907841e9040c',2,5,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('68668544-dec3-11ed-8b5d-907841e9040c',3,5,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6866bfb3-dec3-11ed-8b5d-907841e9040c',4,5,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6866e537-dec3-11ed-8b5d-907841e9040c',5,5,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,4),('c82235b7-df44-11ed-bf13-88aedd095151',1,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82349f2-df44-11ed-bf13-88aedd095151',2,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c823ee79-df44-11ed-bf13-88aedd095151',3,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82546b4-df44-11ed-bf13-88aedd095151',4,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c825d851-df44-11ed-bf13-88aedd095151',5,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8263b71-df44-11ed-bf13-88aedd095151',6,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8269ef3-df44-11ed-bf13-88aedd095151',7,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c826ea24-df44-11ed-bf13-88aedd095151',8,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82753d2-df44-11ed-bf13-88aedd095151',9,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8297558-df44-11ed-bf13-88aedd095151',10,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c829e318-df44-11ed-bf13-88aedd095151',1,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82a5fbd-df44-11ed-bf13-88aedd095151',2,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82ac3bf-df44-11ed-bf13-88aedd095151',3,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82b12f5-df44-11ed-bf13-88aedd095151',4,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82b8133-df44-11ed-bf13-88aedd095151',5,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82bdd59-df44-11ed-bf13-88aedd095151',6,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82c531f-df44-11ed-bf13-88aedd095151',7,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82cb7b8-df44-11ed-bf13-88aedd095151',8,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82d24bf-df44-11ed-bf13-88aedd095151',9,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82dc61a-df44-11ed-bf13-88aedd095151',10,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c82e3e86-df44-11ed-bf13-88aedd095151',1,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82ea876-df44-11ed-bf13-88aedd095151',2,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82f0966-df44-11ed-bf13-88aedd095151',3,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82f541f-df44-11ed-bf13-88aedd095151',4,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82fbbbd-df44-11ed-bf13-88aedd095151',5,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82ff792-df44-11ed-bf13-88aedd095151',6,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8304df2-df44-11ed-bf13-88aedd095151',7,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c830a6e9-df44-11ed-bf13-88aedd095151',8,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8312058-df44-11ed-bf13-88aedd095151',9,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8318925-df44-11ed-bf13-88aedd095151',10,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c831de11-df44-11ed-bf13-88aedd095151',1,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8323bb2-df44-11ed-bf13-88aedd095151',2,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83281eb-df44-11ed-bf13-88aedd095151',3,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c832ef64-df44-11ed-bf13-88aedd095151',4,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83360de-df44-11ed-bf13-88aedd095151',5,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c833cee1-df44-11ed-bf13-88aedd095151',6,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8344419-df44-11ed-bf13-88aedd095151',7,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c834bc6d-df44-11ed-bf13-88aedd095151',8,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8352580-df44-11ed-bf13-88aedd095151',9,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8356f55-df44-11ed-bf13-88aedd095151',10,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c835d548-df44-11ed-bf13-88aedd095151',1,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8363653-df44-11ed-bf13-88aedd095151',2,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c836c509-df44-11ed-bf13-88aedd095151',3,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83745e5-df44-11ed-bf13-88aedd095151',4,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c837b4ea-df44-11ed-bf13-88aedd095151',5,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c837fb3d-df44-11ed-bf13-88aedd095151',6,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8386c20-df44-11ed-bf13-88aedd095151',7,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c838dc77-df44-11ed-bf13-88aedd095151',8,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83934c9-df44-11ed-bf13-88aedd095151',9,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c839aee5-df44-11ed-bf13-88aedd095151',10,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c83ae595-df44-11ed-bf13-88aedd095151',1,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83b719f-df44-11ed-bf13-88aedd095151',2,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83be54a-df44-11ed-bf13-88aedd095151',3,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83c3cd9-df44-11ed-bf13-88aedd095151',4,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83c9d81-df44-11ed-bf13-88aedd095151',5,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83cddaf-df44-11ed-bf13-88aedd095151',6,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83d3cf0-df44-11ed-bf13-88aedd095151',7,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83db29c-df44-11ed-bf13-88aedd095151',8,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83e0810-df44-11ed-bf13-88aedd095151',9,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83e8979-df44-11ed-bf13-88aedd095151',10,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c83f06b3-df44-11ed-bf13-88aedd095151',1,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83f45da-df44-11ed-bf13-88aedd095151',2,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83fa773-df44-11ed-bf13-88aedd095151',3,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83ff7bc-df44-11ed-bf13-88aedd095151',4,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c840a20b-df44-11ed-bf13-88aedd095151',5,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8415a61-df44-11ed-bf13-88aedd095151',6,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c841c211-df44-11ed-bf13-88aedd095151',7,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c842212e-df44-11ed-bf13-88aedd095151',8,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8428e67-df44-11ed-bf13-88aedd095151',9,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c842e26a-df44-11ed-bf13-88aedd095151',10,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c8435ccc-df44-11ed-bf13-88aedd095151',1,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c843d6b0-df44-11ed-bf13-88aedd095151',2,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8442356-df44-11ed-bf13-88aedd095151',3,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8448e95-df44-11ed-bf13-88aedd095151',4,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c844d440-df44-11ed-bf13-88aedd095151',5,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8454504-df44-11ed-bf13-88aedd095151',6,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c845b271-df44-11ed-bf13-88aedd095151',7,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84611d4-df44-11ed-bf13-88aedd095151',8,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8468d4d-df44-11ed-bf13-88aedd095151',9,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c846fc34-df44-11ed-bf13-88aedd095151',10,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c8474cb0-df44-11ed-bf13-88aedd095151',1,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c847f0d0-df44-11ed-bf13-88aedd095151',2,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8485afe-df44-11ed-bf13-88aedd095151',3,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c848c8ab-df44-11ed-bf13-88aedd095151',4,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84919b5-df44-11ed-bf13-88aedd095151',5,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8498382-df44-11ed-bf13-88aedd095151',6,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c849e7bb-df44-11ed-bf13-88aedd095151',7,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84a3804-df44-11ed-bf13-88aedd095151',8,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84aa18b-df44-11ed-bf13-88aedd095151',9,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84af718-df44-11ed-bf13-88aedd095151',10,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c84b7656-df44-11ed-bf13-88aedd095151',1,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84be33d-df44-11ed-bf13-88aedd095151',2,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84c2fc2-df44-11ed-bf13-88aedd095151',3,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84c98aa-df44-11ed-bf13-88aedd095151',4,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84d0a82-df44-11ed-bf13-88aedd095151',5,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84d58d0-df44-11ed-bf13-88aedd095151',6,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84e1115-df44-11ed-bf13-88aedd095151',7,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84e8854-df44-11ed-bf13-88aedd095151',8,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84ef1e2-df44-11ed-bf13-88aedd095151',9,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84f3d6b-df44-11ed-bf13-88aedd095151',10,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2);
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
  `Status` int DEFAULT NULL COMMENT '- 1: Trống, - 2: Có bàn, -3:  Khác',
  `Type` int DEFAULT NULL COMMENT '1: Ghế thường, 2: Ghế vip, 3: Bảo trì,4: không tồn tại'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=655 COMMENT='Bảng lưu trạng thái ghế trong rạp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusroomcinema`
--

LOCK TABLES `statusroomcinema` WRITE;
/*!40000 ALTER TABLE `statusroomcinema` DISABLE KEYS */;
INSERT INTO `statusroomcinema` VALUES ('101542fe-d808-11ed-9a6b-88aedd095151',1,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',1,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',1,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',1,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',1,5,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,5,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,5,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,5,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,3,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,3,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,3,0,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,3,0,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,3,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,1,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,1,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,1,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,1,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,1,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,1,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,2,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,3,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,4,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,4,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,4,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,4,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,4,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,4,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,6,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,5,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,5,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,5,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,5,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,4,0,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,5,0,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,6,1,NULL),('25cba963-df1a-11ed-bf13-88aedd095151',1,1,1,NULL),('a626e44a-df1a-11ed-bf13-88aedd095151',1,1,1,NULL),('952a45bf-df1c-11ed-bf13-88aedd095151',1,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',1,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',1,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',1,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',1,5,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,5,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,5,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,5,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,5,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',2,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',3,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',4,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',5,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',2,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',3,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',4,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',5,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,3,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',2,3,0,2),('6c6980ff-df36-11ed-bf13-88aedd095151',3,3,0,2),('6c6980ff-df36-11ed-bf13-88aedd095151',4,3,0,2),('6c6980ff-df36-11ed-bf13-88aedd095151',5,3,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,4,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',2,4,0,3),('6c6980ff-df36-11ed-bf13-88aedd095151',3,4,0,3),('6c6980ff-df36-11ed-bf13-88aedd095151',4,4,0,3),('6c6980ff-df36-11ed-bf13-88aedd095151',5,4,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,5,1,4),('6c6980ff-df36-11ed-bf13-88aedd095151',2,5,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',3,5,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',4,5,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',5,5,1,4),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,2,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,2,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,2,0,3),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,2,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,2,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,3,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,3,1,2),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,3,1,2),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,3,1,2),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,3,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,4,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,4,0,3),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,4,0,3),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,4,0,3),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,4,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,5,1,4),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,5,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,5,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,5,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,5,1,4),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,10,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,2,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,2,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,2,1,3),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,2,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,2,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,3,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,3,1,2),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,3,1,2),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,3,1,2),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,3,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,4,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,4,1,3),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,4,1,3),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,4,1,3),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,4,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,5,1,4),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,5,1,4),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,5,1,4),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,5,1,4),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,5,1,4),('68861520-e28c-11ed-a14e-88aedd095151',1,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,10,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',2,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',3,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',4,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',5,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',6,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',7,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',8,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',9,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',10,10,0,2),('3e939490-e336-11ed-857f-88aedd095151',1,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',2,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',3,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',4,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',5,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',1,2,1,1),('3e939490-e336-11ed-857f-88aedd095151',2,2,1,1),('3e939490-e336-11ed-857f-88aedd095151',3,2,1,3),('3e939490-e336-11ed-857f-88aedd095151',4,2,1,1),('3e939490-e336-11ed-857f-88aedd095151',5,2,1,1),('3e939490-e336-11ed-857f-88aedd095151',1,3,1,1),('3e939490-e336-11ed-857f-88aedd095151',2,3,1,2),('3e939490-e336-11ed-857f-88aedd095151',3,3,0,2),('3e939490-e336-11ed-857f-88aedd095151',4,3,1,2),('3e939490-e336-11ed-857f-88aedd095151',5,3,1,1),('3e939490-e336-11ed-857f-88aedd095151',1,4,1,1),('3e939490-e336-11ed-857f-88aedd095151',2,4,1,3),('3e939490-e336-11ed-857f-88aedd095151',3,4,1,3),('3e939490-e336-11ed-857f-88aedd095151',4,4,1,3),('3e939490-e336-11ed-857f-88aedd095151',5,4,1,1),('3e939490-e336-11ed-857f-88aedd095151',1,5,1,4),('3e939490-e336-11ed-857f-88aedd095151',2,5,1,4),('3e939490-e336-11ed-857f-88aedd095151',3,5,1,4),('3e939490-e336-11ed-857f-88aedd095151',4,5,1,4),('3e939490-e336-11ed-857f-88aedd095151',5,5,1,4),('4bdb694a-e336-11ed-857f-88aedd095151',1,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',2,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',3,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',4,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',5,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',6,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',7,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',8,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',9,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',10,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',1,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,4,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,4,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,5,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,5,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,5,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,6,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,6,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,6,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,9,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,9,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,9,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,9,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',2,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',3,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',4,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',5,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',6,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',7,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',8,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',9,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',10,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,5,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,5,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,5,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,6,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,10,1,2);
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
-- Table structure for table `templateticketmovie`
--

DROP TABLE IF EXISTS `templateticketmovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templateticketmovie` (
  `TemplateTicketID` char(36) NOT NULL,
  `MovieID` char(36) DEFAULT NULL,
  `Type` int DEFAULT NULL,
  `Cost` decimal(22,4) DEFAULT NULL,
  PRIMARY KEY (`TemplateTicketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templateticketmovie`
--

LOCK TABLES `templateticketmovie` WRITE;
/*!40000 ALTER TABLE `templateticketmovie` DISABLE KEYS */;
INSERT INTO `templateticketmovie` VALUES ('9adcae8c-df51-11ed-bf13-88aedd095151','d6ed7e34-fada-474f-9682-2c2cf3ba4bed',1,50000.0000),('9adcf5c2-df51-11ed-bf13-88aedd095151','d6ed7e34-fada-474f-9682-2c2cf3ba4bed',2,70000.0000),('af560c01-e31b-11ed-857f-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b',1,52000.0000),('af566af1-e31b-11ed-857f-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b',2,70000.0000),('ff39b0f6-e316-11ed-857f-88aedd095151','ac6b11da-ebef-4889-9f77-a971c292066b',1,50000.0000),('ff3a0b0f-e316-11ed-857f-88aedd095151','ac6b11da-ebef-4889-9f77-a971c292066b',2,70000.0000);
/*!40000 ALTER TABLE `templateticketmovie` ENABLE KEYS */;
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

-- Dump completed on 2023-04-26 17:48:16
