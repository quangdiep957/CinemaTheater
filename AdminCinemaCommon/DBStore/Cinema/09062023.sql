-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: 35.234.5.238    Database: db_cinema_dev_01
-- ------------------------------------------------------
-- Server version	8.0.33

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
INSERT INTO `account` VALUES ('4555fff1-cd74-11ed-a44f-907841e9040c','admin','admin',1,'Admin',0,'2001-08-18',NULL,NULL,NULL,NULL,NULL,NULL),('69d3e4b8-e306-11ed-857f-88aedd095151','taikhoan1','taikhoan1',5,'Công Đoàn',1,'2001-08-18','0936561355',0,'0000001',1,'2023-04-25 00:00:00','congdoan123@gmail.com'),('8dff97e8-e283-11ed-a14e-88aedd095151','congdoan','congdoan',2,'employee',0,'2001-08-18',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounttemp`
--

DROP TABLE IF EXISTS `accounttemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounttemp` (
  `AccountID` char(36) NOT NULL DEFAULT '',
  `AccountName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Role` int DEFAULT NULL,
  `Status` int DEFAULT NULL COMMENT '1: chưa phê duyệt,2: từ chối, 3:đã phê duyệt',
  `CreatedDate` date DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=4096 COMMENT='Bảng lưu các tài khoản chờ duyệt';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttemp`
--

LOCK TABLES `accounttemp` WRITE;
/*!40000 ALTER TABLE `accounttemp` DISABLE KEYS */;
INSERT INTO `accounttemp` VALUES ('908f3f17-e74b-11ed-8b5d-907841e9040c','congdoan4','congdoan1',2,1,'2023-04-30','Đoàn'),('9c0a7a74-e74b-11ed-8b5d-907841e9040c','congdoan5','congdoan1',2,1,'2023-04-30','Đoàn'),('9c89d472-e738-11ed-8b5d-907841e9040c','congdoan2','congdoan',2,1,'2023-04-30','Đoàn 2'),('a476e5b0-e737-11ed-8b5d-907841e9040c','congdoan1','congdoan',2,1,'2023-04-30','Đoàn'),('f592ab85-e74b-11ed-8b5d-907841e9040c','congdoan5','congdoan1',2,1,'2023-04-30','Đoàn');
/*!40000 ALTER TABLE `accounttemp` ENABLE KEYS */;
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
  `CategoryCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=1638 COMMENT='Thể loại phim';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorymovie`
--

LOCK TABLES `categorymovie` WRITE;
/*!40000 ALTER TABLE `categorymovie` DISABLE KEYS */;
INSERT INTO `categorymovie` VALUES ('54687a5a-d207-11ed-afa1-0242ac120002','Tình cảm','10'),('5e260de6-d207-11ed-afa1-0242ac120002','Hoạt hình','04'),('61aa4b93-d208-11ed-a44f-907841e9040c','Kinh dị','08'),('61ab1fc2-d208-11ed-a44f-907841e9040c','Kịch','07'),('61ab21a8-d208-11ed-a44f-907841e9040c','Huyền ảo','05'),('7685b7d8-d207-11ed-afa1-0242ac120002','Hài hước','02'),('8cf95452-d207-11ed-afa1-0242ac120002','Khoa học viễn tưởng','06'),('9b43e7b6-d207-11ed-afa1-0242ac120002','Ca nhạc','01'),('b4bb3e2e-d207-11ed-afa1-0242ac120002','Phiêu lưu','09'),('e5999ba3-01e3-11ee-b204-0242ac130002','Hồi hộp','11'),('ea6a3fa5-d17b-11ed-a44f-907841e9040c','Hành động','03');
/*!40000 ALTER TABLE `categorymovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dboptions`
--

DROP TABLE IF EXISTS `dboptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dboptions` (
  `NumberKey` int NOT NULL AUTO_INCREMENT,
  `Keyword` varchar(255) NOT NULL,
  `KeyValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NumberKey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dboptions`
--

LOCK TABLES `dboptions` WRITE;
/*!40000 ALTER TABLE `dboptions` DISABLE KEYS */;
INSERT INTO `dboptions` VALUES (1,'Default_Seat_Normal','60000'),(2,'Default_Seat_VIP','70000');
/*!40000 ALTER TABLE `dboptions` ENABLE KEYS */;
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
  `IsExported` bit(1) DEFAULT b'0',
  PRIMARY KEY (`CheckoutID`,`TicketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=481 COMMENT='Bảng lưu lịch sử thanh toán ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES ('0a959605-06a6-11ee-b204-0242ac130002','0a95961a-06a6-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','0a957ba0-06a6-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50001.0000,'H9','01','','2023-06-09 16:14:30','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('0a9679f1-06a6-11ee-b204-0242ac130002','0a967a04-06a6-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','0a957ba0-06a6-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50001.0000,'H10','01','','2023-06-09 16:14:30','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('0a97b382-06a6-11ee-b204-0242ac130002','0a97b3a8-06a6-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002',NULL,'NHỮNG KẺ THAO TÚNG','','',NULL,NULL,'01','','2023-06-09 16:14:30','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('0b83cdc7-01cd-11ee-b204-0242ac130002','0b83cdd2-01cd-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','0b83c089-01cd-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'A7','03','','2023-06-03 12:11:06','2023-06-02 00:00:00','19:30','1','A1',NULL),('0b84a0e8-01cd-11ee-b204-0242ac130002','0b84a0fc-01cd-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','0b83c089-01cd-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'B7','03','','2023-06-03 12:11:06','2023-06-02 00:00:00','19:30','1','A1',NULL),('0b857b50-01cd-11ee-b204-0242ac130002','0b857b74-01cd-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 12:11:06','2023-06-02 00:00:00','19:30','1','A1',NULL),('0e39d903-f58c-11ed-906e-907841e9040c','0e39d915-f58c-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','456e9730-ed6b-11ed-8709-88aedd095151','0e39c69c-f58c-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'C5','02','taikhoan1','2023-05-18 21:55:40','2023-04-04 00:00:00','18:30:00','1','A2',_binary '\0'),('0e3b6de3-f58c-11ed-906e-907841e9040c','0e3b6df8-f58c-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','456e9730-ed6b-11ed-8709-88aedd095151','0e39c69c-f58c-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'C6','02','taikhoan1','2023-05-18 21:55:40','2023-04-04 00:00:00','18:30:00','1','A2',_binary '\0'),('0e3bd9d3-f58c-11ed-906e-907841e9040c','0e3bd9f6-f58c-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','456e9730-ed6b-11ed-8709-88aedd095151',NULL,'VỆ BINH DẢI NGÂN HÀ 3','','',NULL,NULL,'02','taikhoan1','2023-05-18 21:55:40','2023-04-04 00:00:00','18:30:00','1','A2',_binary '\0'),('13b2edfb-01c4-11ee-b204-0242ac130002','13b2ee15-01c4-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','13b2cf38-01c4-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',50000.0000,'F9','02','','2023-06-03 11:06:55','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('13b46520-01c4-11ee-b204-0242ac130002','13b4653d-01c4-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','13b2cf38-01c4-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',50000.0000,'F8','02','','2023-06-03 11:06:55','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('13b52e54-01c4-11ee-b204-0242ac130002','13b52e70-01c4-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151',NULL,'FAST AND FURIOUS X','','',NULL,NULL,'02','','2023-06-03 11:06:55','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('15edce1e-06a4-11ee-b204-0242ac130002','15edce30-06a4-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','15edb886-06a4-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50001.0000,'D10','01','admin1','2023-06-09 16:00:30','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('15ef090e-06a4-11ee-b204-0242ac130002','15ef0928-06a4-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','15edb886-06a4-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50001.0000,'D9','01','admin1','2023-06-09 16:00:30','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('15f07e45-06a4-11ee-b204-0242ac130002','15f07e6d-06a4-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002',NULL,'NHỮNG KẺ THAO TÚNG','','',NULL,NULL,'01','admin1','2023-06-09 16:00:30','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('1a13e2b1-e987-11ed-906e-907841e9040c','1a13e2bc-e987-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','0bdce2b6-e987-11ed-906e-907841e9040c','1a13dabd-e987-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',50000.0000,'A1','03','','2023-05-03 14:49:58','2023-05-11 00:00:00','19:30','1','A1',_binary '\0'),('1a143ec8-e987-11ed-906e-907841e9040c','1a143eda-e987-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','0bdce2b6-e987-11ed-906e-907841e9040c','1a13dabd-e987-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',50000.0000,'A2','03','','2023-05-03 14:49:58','2023-05-11 00:00:00','19:30','1','A1',_binary '\0'),('1a1478bf-e987-11ed-906e-907841e9040c','1a1478ce-e987-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','0bdce2b6-e987-11ed-906e-907841e9040c','1a13dabd-e987-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',50000.0000,'A4','03','','2023-05-03 14:49:58','2023-05-11 00:00:00','19:30','1','A1',_binary '\0'),('1a151260-e987-11ed-906e-907841e9040c','1a15127c-e987-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','0bdce2b6-e987-11ed-906e-907841e9040c','1a13dabd-e987-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',50000.0000,'A5','03','','2023-05-03 14:49:58','2023-05-11 00:00:00','19:30','1','A1',_binary '\0'),('1a154f73-e987-11ed-906e-907841e9040c','1a154f86-e987-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','0bdce2b6-e987-11ed-906e-907841e9040c',NULL,'VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',NULL,NULL,'03','','2023-05-03 14:49:58','2023-05-11 00:00:00','19:30','1','A1',_binary '\0'),('1cf6efdf-0049-11ee-9013-88aedd095151','1cf6efec-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'D5','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf752db-0049-11ee-9013-88aedd095151','1cf752e9-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'D6','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf79c06-0049-11ee-9013-88aedd095151','1cf79c11-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'D7','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf80c31-0049-11ee-9013-88aedd095151','1cf80c40-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'E7','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf8672d-0049-11ee-9013-88aedd095151','1cf86737-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'E6','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf8cb64-0049-11ee-9013-88aedd095151','1cf8cb73-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'E5','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf91ab2-0049-11ee-9013-88aedd095151','1cf91ac1-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'F5','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf9b2cb-0049-11ee-9013-88aedd095151','1cf9b2db-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'F6','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cfa28d3-0049-11ee-9013-88aedd095151','1cfa28df-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'F7','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cfac987-0049-11ee-9013-88aedd095151','1cfac9ac-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',NULL,NULL,'01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1e2e8ee7-01c8-11ee-b204-0242ac130002','1e2e8ef6-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','1e2e7f8e-01c8-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D4','03','','2023-06-03 11:35:50','2023-06-02 00:00:00','19:30','1','A1',NULL),('1e2fb25e-01c8-11ee-b204-0242ac130002','1e2fb279-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','1e2e7f8e-01c8-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'E4','03','','2023-06-03 11:35:50','2023-06-02 00:00:00','19:30','1','A1',NULL),('1e306c9e-01c8-11ee-b204-0242ac130002','1e306cc0-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 11:35:50','2023-06-02 00:00:00','19:30','1','A1',NULL),('1e6763fa-01cb-11ee-b204-0242ac130002','1e67640b-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','1e6754b9-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'F5','03','','2023-06-03 11:57:19','2023-06-02 00:00:00','19:30','1','A1',NULL),('1e68560f-01cb-11ee-b204-0242ac130002','1e685625-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','1e6754b9-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'F4','03','','2023-06-03 11:57:19','2023-06-02 00:00:00','19:30','1','A1',NULL),('1e696bfb-01cb-11ee-b204-0242ac130002','1e696c1c-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 11:57:19','2023-06-02 00:00:00','19:30','1','A1',NULL),('2053c7ed-ea1e-11ed-8128-88aedd095151','2053c804-ea1e-11ed-8128-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c','2053af10-ea1e-11ed-8128-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',110000.0000,'D4','01','','2023-05-04 08:51:03','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('20555ec4-ea1e-11ed-8128-88aedd095151','20555ed9-ea1e-11ed-8128-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c','2053af10-ea1e-11ed-8128-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',110000.0000,'E4','01','','2023-05-04 08:51:03','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('2055e9fb-ea1e-11ed-8128-88aedd095151','2055ea1e-ea1e-11ed-8128-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c',NULL,'NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',NULL,NULL,'01','','2023-05-04 08:51:03','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('2792c5f9-01ca-11ee-b204-0242ac130002','2792c610-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','2792b0b1-01ca-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',70000.0000,'D6','02','','2023-06-03 11:50:25','2023-06-01 00:00:00','18:30:00','2','A4',NULL),('2793bd6a-01ca-11ee-b204-0242ac130002','2793bd84-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','2792b0b1-01ca-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',70000.0000,'E6','02','','2023-06-03 11:50:25','2023-06-01 00:00:00','18:30:00','2','A4',NULL),('2794b6ed-01ca-11ee-b204-0242ac130002','2794b70f-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151',NULL,'FAST AND FURIOUS X','','',NULL,NULL,'02','','2023-06-03 11:50:25','2023-06-01 00:00:00','18:30:00','2','A4',NULL),('2b9d8272-01c9-11ee-b204-0242ac130002','2b9d8289-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','2b9d70a5-01c9-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'E6','03','','2023-06-03 11:43:22','2023-06-02 00:00:00','19:30','1','A1',NULL),('2b9e6e76-01c9-11ee-b204-0242ac130002','2b9e6e92-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','2b9d70a5-01c9-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'F6','03','','2023-06-03 11:43:22','2023-06-02 00:00:00','19:30','1','A1',NULL),('2b9f6486-01c9-11ee-b204-0242ac130002','2b9f64ba-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 11:43:22','2023-06-02 00:00:00','19:30','1','A1',NULL),('2dd8c599-06ab-11ee-b204-0242ac130002','2dd8c5b6-06ab-11ee-b204-0242ac130002','87f0fcaa-bf50-449b-b5f8-4ddc0d76c2a5','af43d2c8-01e6-11ee-b204-0242ac130002','2dd8a830-06ab-11ee-b204-0242ac130002','NÀNG TIÊN CÁ','','',60000.0000,'E7','01','','2023-06-09 16:51:17','2023-06-03 00:00:00','17:30:00','1','A3',NULL),('2dda07ce-06ab-11ee-b204-0242ac130002','2dda07e5-06ab-11ee-b204-0242ac130002','87f0fcaa-bf50-449b-b5f8-4ddc0d76c2a5','af43d2c8-01e6-11ee-b204-0242ac130002','2dd8a830-06ab-11ee-b204-0242ac130002','NÀNG TIÊN CÁ','','',60000.0000,'F7','01','','2023-06-09 16:51:17','2023-06-03 00:00:00','17:30:00','1','A3',NULL),('2ddb514b-06ab-11ee-b204-0242ac130002','2ddb5165-06ab-11ee-b204-0242ac130002','87f0fcaa-bf50-449b-b5f8-4ddc0d76c2a5','af43d2c8-01e6-11ee-b204-0242ac130002','2dd8a830-06ab-11ee-b204-0242ac130002','NÀNG TIÊN CÁ','','',60000.0000,'F6','01','','2023-06-09 16:51:17','2023-06-03 00:00:00','17:30:00','1','A3',NULL),('2ddc7ccb-06ab-11ee-b204-0242ac130002','2ddc7cdb-06ab-11ee-b204-0242ac130002','87f0fcaa-bf50-449b-b5f8-4ddc0d76c2a5','af43d2c8-01e6-11ee-b204-0242ac130002','2dd8a830-06ab-11ee-b204-0242ac130002','NÀNG TIÊN CÁ','','',60000.0000,'E6','01','','2023-06-09 16:51:17','2023-06-03 00:00:00','17:30:00','1','A3',NULL),('2dddf7b2-06ab-11ee-b204-0242ac130002','2dddf7db-06ab-11ee-b204-0242ac130002','87f0fcaa-bf50-449b-b5f8-4ddc0d76c2a5','af43d2c8-01e6-11ee-b204-0242ac130002',NULL,'NÀNG TIÊN CÁ','','',NULL,NULL,'01','','2023-06-09 16:51:17','2023-06-03 00:00:00','17:30:00','1','A3',NULL),('2e783460-eb1e-11ed-a4e4-88aedd095151','2e783469-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J4','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e787d0f-eb1e-11ed-a4e4-88aedd095151','2e787d1a-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J5','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e78f7a1-eb1e-11ed-a4e4-88aedd095151','2e78f7aa-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J6','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7998a0-eb1e-11ed-a4e4-88aedd095151','2e7998ab-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J7','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7a0ed4-eb1e-11ed-a4e4-88aedd095151','2e7a0ede-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J8','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7a664d-eb1e-11ed-a4e4-88aedd095151','2e7a6656-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J9','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7aca16-eb1e-11ed-a4e4-88aedd095151','2e7aca20-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J10','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7b37fc-eb1e-11ed-a4e4-88aedd095151','2e7b380b-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J2','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7c261a-eb1e-11ed-a4e4-88aedd095151','2e7c2625-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J1','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7cc8da-eb1e-11ed-a4e4-88aedd095151','2e7cc8ef-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151',NULL,'NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',NULL,NULL,'03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2ee3dce6-01c6-11ee-b204-0242ac130002','2ee3dcfd-01c6-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151','2ee3c666-01c6-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'C1','02','','2023-06-03 11:21:59','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('2ee4b642-01c6-11ee-b204-0242ac130002','2ee4b65a-01c6-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151','2ee3c666-01c6-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D1','02','','2023-06-03 11:21:59','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('2ee587d8-01c6-11ee-b204-0242ac130002','2ee587f0-01c6-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'02','','2023-06-03 11:21:59','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('2faa076a-01c5-11ee-b204-0242ac130002','2faa0775-01c5-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','2fa9f90c-01c5-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D1','01','','2023-06-03 11:14:51','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('2faaca98-01c5-11ee-b204-0242ac130002','2faacaaa-01c5-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','2fa9f90c-01c5-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'E1','01','','2023-06-03 11:14:51','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('2fab9553-01c5-11ee-b204-0242ac130002','2fab9576-01c5-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'01','','2023-06-03 11:14:51','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('30971dc2-e41c-11ed-9a9a-88aedd095151','30971dcd-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','30971406-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'C4','01','','2023-04-26 17:22:04','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('30979763-e41c-11ed-9a9a-88aedd095151','30979771-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','30971406-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'D4','01','','2023-04-26 17:22:04','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('30981ce8-e41c-11ed-9a9a-88aedd095151','30981cf6-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','','',NULL,NULL,'01','','2023-04-26 17:22:04','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('367c9944-e41c-11ed-9a9a-88aedd095151','367c9977-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','367c8bad-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'D3','01','','2023-04-26 17:22:14','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('367d133b-e41c-11ed-9a9a-88aedd095151','367d134e-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','367c8bad-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'C3','01','','2023-04-26 17:22:14','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('367d91f8-e41c-11ed-9a9a-88aedd095151','367d9227-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','','',NULL,NULL,'01','','2023-04-26 17:22:14','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('39feecec-01c4-11ee-b204-0242ac130002','39feed65-01c4-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','39fe99da-01c4-11ee-b204-0242ac130002','FAST AND FURIOUS X','Công Đoàn','0936561355',50000.0000,'E8','02','','2023-06-03 11:07:59','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('3a02b115-01c4-11ee-b204-0242ac130002','3a02b1a2-01c4-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','39fe99da-01c4-11ee-b204-0242ac130002','FAST AND FURIOUS X','Công Đoàn','0936561355',50000.0000,'E9','02','','2023-06-03 11:07:59','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('3a05a3be-01c4-11ee-b204-0242ac130002','3a05a41c-01c4-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151',NULL,'FAST AND FURIOUS X','Công Đoàn','0936561355',NULL,NULL,'02','','2023-06-03 11:07:59','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('40316cbb-ea1e-11ed-8128-88aedd095151','40316cee-ea1e-11ed-8128-88aedd095151','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','4031428d-ea1e-11ed-8128-88aedd095151','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','','',140000.0000,'J1','03','','2023-05-04 08:51:56','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('40332b4a-ea1e-11ed-8128-88aedd095151','40332b6e-ea1e-11ed-8128-88aedd095151','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','4031428d-ea1e-11ed-8128-88aedd095151','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','','',140000.0000,'J2','03','','2023-05-04 08:51:56','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('4033ac47-ea1e-11ed-8128-88aedd095151','4033ac73-ea1e-11ed-8128-88aedd095151','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151',NULL,'LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','','',NULL,NULL,'03','','2023-05-04 08:51:56','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('41ccb1f0-01ca-11ee-b204-0242ac130002','41ccb201-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','41cca1d4-01ca-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',70000.0000,'D7','02','','2023-06-03 11:51:09','2023-06-01 00:00:00','18:30:00','2','A4',NULL),('41cda489-01ca-11ee-b204-0242ac130002','41cda4a0-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','41cca1d4-01ca-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',70000.0000,'E7','02','','2023-06-03 11:51:09','2023-06-01 00:00:00','18:30:00','2','A4',NULL),('41cf028c-01ca-11ee-b204-0242ac130002','41cf02b1-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151',NULL,'FAST AND FURIOUS X','','',NULL,NULL,'02','','2023-06-03 11:51:09','2023-06-01 00:00:00','18:30:00','2','A4',NULL),('447aed3b-01f8-11ee-b204-0242ac130002','447aed4d-01f8-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','447adc8f-01f8-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'D5','01','admin1','2023-06-03 17:20:30','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('447bc9ed-01f8-11ee-b204-0242ac130002','447bc9ff-01f8-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','447adc8f-01f8-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'E5','01','admin1','2023-06-03 17:20:30','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('447c8c35-01f8-11ee-b204-0242ac130002','447c8c55-01f8-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','447adc8f-01f8-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'E6','01','admin1','2023-06-03 17:20:30','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('447d480f-01f8-11ee-b204-0242ac130002','447d4828-01f8-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','447adc8f-01f8-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'D6','01','admin1','2023-06-03 17:20:30','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('447de0f7-01f8-11ee-b204-0242ac130002','447de115-01f8-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002',NULL,'NHỮNG KẺ THAO TÚNG','','',NULL,NULL,'01','admin1','2023-06-03 17:20:30','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('447f4514-f58c-11ed-906e-907841e9040c','447f451e-f58c-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151','447f3a9c-f58c-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',50000.0000,'B5','01','','2023-05-18 21:57:11','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('447f7286-f58c-11ed-906e-907841e9040c','447f7292-f58c-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151','447f3a9c-f58c-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',50000.0000,'B4','01','','2023-05-18 21:57:11','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('447f9f3a-f58c-11ed-906e-907841e9040c','447f9f55-f58c-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151',NULL,'VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',NULL,NULL,'01','','2023-05-18 21:57:11','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('449f57f8-01b7-11ee-97c4-0242ac140002','449f5809-01b7-11ee-97c4-0242ac140002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6dd22ece-0050-11ee-9013-88aedd095151','449f39ca-01b7-11ee-97c4-0242ac140002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'F8','02','','2023-06-03 09:35:13','2023-06-10 00:00:00','18:30:00','1','A1',NULL),('44a079ab-01b7-11ee-97c4-0242ac140002','44a079d2-01b7-11ee-97c4-0242ac140002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6dd22ece-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'02','','2023-06-03 09:35:13','2023-06-10 00:00:00','18:30:00','1','A1',NULL),('44bfa8da-01e6-11ee-b204-0242ac130002','44bfa8ee-01e6-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','44bf9097-01e6-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','Vũ Công Đoàn','0936561533',50000.0000,'D3','01','','2023-06-03 15:11:40','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('44c081a8-01e6-11ee-b204-0242ac130002','44c081ba-01e6-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','44bf9097-01e6-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','Vũ Công Đoàn','0936561533',50000.0000,'E3','01','','2023-06-03 15:11:40','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('44c10bd3-01e6-11ee-b204-0242ac130002','44c10bee-01e6-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002',NULL,'NHỮNG KẺ THAO TÚNG','Vũ Công Đoàn','0936561533',NULL,NULL,'01','','2023-06-03 15:11:40','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('46f3a8da-ea1c-11ed-8128-88aedd095151','46f3a8f1-ea1c-11ed-8128-88aedd095151','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151','46f39718-ea1c-11ed-8128-88aedd095151','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'A4','01','','2023-05-04 08:37:48','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('46f41280-ea1c-11ed-8128-88aedd095151','46f41299-ea1c-11ed-8128-88aedd095151','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151','46f39718-ea1c-11ed-8128-88aedd095151','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'A5','01','','2023-05-04 08:37:48','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('46f476e3-ea1c-11ed-8128-88aedd095151','46f476f7-ea1c-11ed-8128-88aedd095151','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151','46f39718-ea1c-11ed-8128-88aedd095151','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'B6','01','','2023-05-04 08:37:48','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('46f4bfa6-ea1c-11ed-8128-88aedd095151','46f4bfc3-ea1c-11ed-8128-88aedd095151','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151',NULL,'VỆ BINH DẢI NGÂN HÀ 3','','',NULL,NULL,'01','','2023-05-04 08:37:48','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('4c0a5e6f-01c9-11ee-b204-0242ac130002','4c0a5e81-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','4c0a4eac-01c9-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D6','03','','2023-06-03 11:44:17','2023-06-02 00:00:00','19:30','1','A1',NULL),('4c0b20fb-01c9-11ee-b204-0242ac130002','4c0b2110-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','4c0a4eac-01c9-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'C6','03','','2023-06-03 11:44:17','2023-06-02 00:00:00','19:30','1','A1',NULL),('4c0c1c9b-01c9-11ee-b204-0242ac130002','4c0c1cb6-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 11:44:17','2023-06-02 00:00:00','19:30','1','A1',NULL),('4e28eaa6-01c5-11ee-b204-0242ac130002','4e28eafe-01c5-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','4e28c4fa-01c5-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'E2','01','','2023-06-03 11:15:42','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('4e2a17e8-01c5-11ee-b204-0242ac130002','4e2a17fe-01c5-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','4e28c4fa-01c5-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'F2','01','','2023-06-03 11:15:42','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('4e2ad418-01c5-11ee-b204-0242ac130002','4e2ad439-01c5-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'01','','2023-06-03 11:15:42','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('52024427-06ab-11ee-b204-0242ac130002','52024439-06ab-11ee-b204-0242ac130002','24aa75fc-0409-4926-9489-465e6fe2d377','c6d8bc97-01e6-11ee-b204-0242ac130002','52023003-06ab-11ee-b204-0242ac130002','NƠI TA GẶP NHAU','','',60000.0000,'D7','02','','2023-06-09 16:52:18','2023-06-11 00:00:00','18:30:00','1','A2',NULL),('52034047-06ab-11ee-b204-0242ac130002','52034061-06ab-11ee-b204-0242ac130002','24aa75fc-0409-4926-9489-465e6fe2d377','c6d8bc97-01e6-11ee-b204-0242ac130002','52023003-06ab-11ee-b204-0242ac130002','NƠI TA GẶP NHAU','','',60000.0000,'E7','02','','2023-06-09 16:52:18','2023-06-11 00:00:00','18:30:00','1','A2',NULL),('52044813-06ab-11ee-b204-0242ac130002','52044832-06ab-11ee-b204-0242ac130002','24aa75fc-0409-4926-9489-465e6fe2d377','c6d8bc97-01e6-11ee-b204-0242ac130002','52023003-06ab-11ee-b204-0242ac130002','NƠI TA GẶP NHAU','','',60000.0000,'E6','02','','2023-06-09 16:52:18','2023-06-11 00:00:00','18:30:00','1','A2',NULL),('5205b39a-06ab-11ee-b204-0242ac130002','5205b3b6-06ab-11ee-b204-0242ac130002','24aa75fc-0409-4926-9489-465e6fe2d377','c6d8bc97-01e6-11ee-b204-0242ac130002','52023003-06ab-11ee-b204-0242ac130002','NƠI TA GẶP NHAU','','',60000.0000,'D6','02','','2023-06-09 16:52:18','2023-06-11 00:00:00','18:30:00','1','A2',NULL),('5206771d-06ab-11ee-b204-0242ac130002','52067750-06ab-11ee-b204-0242ac130002','24aa75fc-0409-4926-9489-465e6fe2d377','c6d8bc97-01e6-11ee-b204-0242ac130002',NULL,'NƠI TA GẶP NHAU','','',NULL,NULL,'02','','2023-06-09 16:52:18','2023-06-11 00:00:00','18:30:00','1','A2',NULL),('546d952c-01cb-11ee-b204-0242ac130002','546d953d-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','546d8193-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',60000.0000,'C7','01','','2023-06-03 11:58:50','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('546f32f8-01cb-11ee-b204-0242ac130002','546f3316-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','546d8193-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',60000.0000,'C6','01','','2023-06-03 11:58:50','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('547049ee-01cb-11ee-b204-0242ac130002','54704a17-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',NULL,NULL,'01','','2023-06-03 11:58:50','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('5af726a9-01c8-11ee-b204-0242ac130002','5af726b9-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6d9b62b8-0050-11ee-9013-88aedd095151','5af718a7-01c8-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Công Đoàn 1','090909109',60000.0000,'E5','01','','2023-06-03 11:37:32','2023-06-10 00:00:00','17:30:00','1','A1',NULL),('5af82428-01c8-11ee-b204-0242ac130002','5af82442-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6d9b62b8-0050-11ee-9013-88aedd095151','5af718a7-01c8-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Công Đoàn 1','090909109',60000.0000,'F5','01','','2023-06-03 11:37:32','2023-06-10 00:00:00','17:30:00','1','A1',NULL),('5af9b5c2-01c8-11ee-b204-0242ac130002','5af9b5f0-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6d9b62b8-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Công Đoàn 1','090909109',NULL,NULL,'01','','2023-06-03 11:37:32','2023-06-10 00:00:00','17:30:00','1','A1',NULL),('5b340da5-01b7-11ee-97c4-0242ac140002','5b340dbc-01b7-11ee-97c4-0242ac140002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6d9b62b8-0050-11ee-9013-88aedd095151','5b33f434-01b7-11ee-97c4-0242ac140002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Công Đoàn 1','090909109',60000.0000,'D6','01','','2023-06-03 09:35:51','2023-06-10 00:00:00','17:30:00','1','A1',NULL),('5b35047c-01b7-11ee-97c4-0242ac140002','5b3504a9-01b7-11ee-97c4-0242ac140002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6d9b62b8-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Công Đoàn 1','090909109',NULL,NULL,'01','','2023-06-03 09:35:51','2023-06-10 00:00:00','17:30:00','1','A1',NULL),('5f2fa496-038d-11ee-b204-0242ac130002','5f2fa4ac-038d-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','5f2f8de6-038d-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'C7','01','','2023-06-05 17:40:21','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('5f3095d6-038d-11ee-b204-0242ac130002','5f3095ec-038d-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','5f2f8de6-038d-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'B7','01','','2023-06-05 17:40:21','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('5f318ebd-038d-11ee-b204-0242ac130002','5f318eec-038d-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002',NULL,'NHỮNG KẺ THAO TÚNG','','',NULL,NULL,'01','','2023-06-05 17:40:21','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('6128a9b9-e41c-11ed-9a9a-88aedd095151','6128a9c8-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','61289b4b-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'E7','01','','2023-04-26 17:23:25','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('612a5dd2-e41c-11ed-9a9a-88aedd095151','612a5dfd-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','61289b4b-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'F7','01','','2023-04-26 17:23:25','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('612adb31-e41c-11ed-9a9a-88aedd095151','612adb4a-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','','',NULL,NULL,'01','','2023-04-26 17:23:25','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('6290f644-01c9-11ee-b204-0242ac130002','6290f657-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','6290e39a-01c9-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'C5','03','','2023-06-03 11:44:54','2023-06-02 00:00:00','19:30','1','A1',NULL),('6291c55d-01c9-11ee-b204-0242ac130002','6291c575-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','6290e39a-01c9-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'B5','03','','2023-06-03 11:44:54','2023-06-02 00:00:00','19:30','1','A1',NULL),('6292cf79-01c9-11ee-b204-0242ac130002','6292cfa3-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 11:44:54','2023-06-02 00:00:00','19:30','1','A1',NULL),('63559817-e82b-11ed-906e-907841e9040c','63559831-e82b-11ed-906e-907841e9040c','ac6b11da-ebef-4889-9f77-a971c292066b','7388b793-e6ff-11ed-8b5d-907841e9040c','63551d3f-e82b-11ed-906e-907841e9040c','Phim thử','Công Đoàn','0936561355',50000.0000,'A4','02','','2023-05-01 21:20:56','2023-04-13 00:00:00','18:30:00','1','A3',_binary '\0'),('6355eb08-e82b-11ed-906e-907841e9040c','6355eb18-e82b-11ed-906e-907841e9040c','ac6b11da-ebef-4889-9f77-a971c292066b','7388b793-e6ff-11ed-8b5d-907841e9040c',NULL,'Phim thử','Công Đoàn','0936561355',NULL,NULL,'02','','2023-05-01 21:20:56','2023-04-13 00:00:00','18:30:00','1','A3',_binary '\0'),('639eb4dd-fa35-11ed-906e-907841e9040c','639eb4f2-fa35-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','639d4b48-fa35-11ed-906e-907841e9040c','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Công Đoàn','0936561355',140000.0000,'D9','03','taikhoan1','2023-05-24 20:17:52','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('639f0dbb-fa35-11ed-906e-907841e9040c','639f0dca-fa35-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','639d4b48-fa35-11ed-906e-907841e9040c','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Công Đoàn','0936561355',140000.0000,'D10','03','taikhoan1','2023-05-24 20:17:52','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('639f702f-fa35-11ed-906e-907841e9040c','639f7044-fa35-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151',NULL,'LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Công Đoàn','0936561355',NULL,NULL,'03','taikhoan1','2023-05-24 20:17:52','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('6d7d1f10-038d-11ee-b204-0242ac130002','6d7d1f2f-038d-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','6d7d03d9-038d-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'C7','01','','2023-06-05 17:40:45','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('6d7e0669-038d-11ee-b204-0242ac130002','6d7e0680-038d-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','6d7d03d9-038d-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'B7','01','','2023-06-05 17:40:45','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('6d7ed94e-038d-11ee-b204-0242ac130002','6d7ed971-038d-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002',NULL,'NHỮNG KẺ THAO TÚNG','','',NULL,NULL,'01','','2023-06-05 17:40:45','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('6df7f35e-01ca-11ee-b204-0242ac130002','6df7f36e-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','6df7e358-01ca-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',70000.0000,'F7','02','','2023-06-03 11:52:23','2023-06-01 00:00:00','18:30:00','2','A4',NULL),('6df8db19-01ca-11ee-b204-0242ac130002','6df8db36-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','6df7e358-01ca-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',70000.0000,'F6','02','','2023-06-03 11:52:23','2023-06-01 00:00:00','18:30:00','2','A4',NULL),('6df9de74-01ca-11ee-b204-0242ac130002','6df9de95-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151',NULL,'FAST AND FURIOUS X','','',NULL,NULL,'02','','2023-06-03 11:52:23','2023-06-01 00:00:00','18:30:00','2','A4',NULL),('6f9dbee5-0024-11ee-9013-88aedd095151','6f9dbeff-0024-11ee-9013-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151','6f9daac0-0024-11ee-9013-88aedd095151','FAST AND FURIOUS X','Công Đoàn','09090909',50000.0000,'D6','02','','2023-06-01 09:31:38','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('6f9e2981-0024-11ee-9013-88aedd095151','6f9e299c-0024-11ee-9013-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151','6f9daac0-0024-11ee-9013-88aedd095151','FAST AND FURIOUS X','Công Đoàn','09090909',50000.0000,'D5','02','','2023-06-01 09:31:38','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('6f9ee1bf-0024-11ee-9013-88aedd095151','6f9ee1d2-0024-11ee-9013-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151',NULL,'FAST AND FURIOUS X','Công Đoàn','09090909',NULL,NULL,'02','','2023-06-01 09:31:38','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('6ff77094-01c7-11ee-b204-0242ac130002','6ff7709f-01c7-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','6ff76476-01c7-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',50000.0000,'B5','02','','2023-06-03 11:30:58','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('6ff86ec2-01c7-11ee-b204-0242ac130002','6ff86ee0-01c7-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','6ff76476-01c7-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',50000.0000,'C5','02','','2023-06-03 11:30:58','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('6ff96a4b-01c7-11ee-b204-0242ac130002','6ff96a71-01c7-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151',NULL,'FAST AND FURIOUS X','','',NULL,NULL,'02','','2023-06-03 11:30:58','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('71cddfe8-fb79-11ed-816c-88aedd095151','71cddff8-fb79-11ed-816c-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151','71cdc964-fb79-11ed-816c-88aedd095151','FAST AND FURIOUS X','Minh Đoàn','0911123984',50000.0000,'E4','02','','2023-05-26 10:57:33','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('71ce7691-fb79-11ed-816c-88aedd095151','71ce76ac-fb79-11ed-816c-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151','71cdc964-fb79-11ed-816c-88aedd095151','FAST AND FURIOUS X','Minh Đoàn','0911123984',50000.0000,'F4','02','','2023-05-26 10:57:33','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('71cee177-fb79-11ed-816c-88aedd095151','71cee18d-fb79-11ed-816c-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151','71cdc964-fb79-11ed-816c-88aedd095151','FAST AND FURIOUS X','Minh Đoàn','0911123984',50000.0000,'E7','02','','2023-05-26 10:57:33','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('71cf5d6f-fb79-11ed-816c-88aedd095151','71cf5d8a-fb79-11ed-816c-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151','71cdc964-fb79-11ed-816c-88aedd095151','FAST AND FURIOUS X','Minh Đoàn','0911123984',50000.0000,'F7','02','','2023-05-26 10:57:33','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('71cfb01e-fb79-11ed-816c-88aedd095151','71cfb04d-fb79-11ed-816c-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151',NULL,'FAST AND FURIOUS X','Minh Đoàn','0911123984',NULL,NULL,'02','','2023-05-26 10:57:33','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('7619e6d4-e82b-11ed-906e-907841e9040c','7619e6de-e82b-11ed-906e-907841e9040c','ac6b11da-ebef-4889-9f77-a971c292066b','7388b793-e6ff-11ed-8b5d-907841e9040c','7619de34-e82b-11ed-906e-907841e9040c','Phim thử','Công Đoàn','0936561355',50000.0000,'A5','02','','2023-05-01 21:21:28','2023-04-13 00:00:00','18:30:00','1','A3',_binary '\0'),('761bb5df-e82b-11ed-906e-907841e9040c','761bb5f3-e82b-11ed-906e-907841e9040c','ac6b11da-ebef-4889-9f77-a971c292066b','7388b793-e6ff-11ed-8b5d-907841e9040c',NULL,'Phim thử','Công Đoàn','0936561355',NULL,NULL,'02','','2023-05-01 21:21:28','2023-04-13 00:00:00','18:30:00','1','A3',_binary '\0'),('7b32a5ce-01c8-11ee-b204-0242ac130002','7b32a5df-01c8-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','7b3297ab-01c8-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',70000.0000,'D5','02','','2023-06-03 11:38:26','2023-06-01 00:00:00','18:30:00','2','A4',NULL),('7b340fb5-01c8-11ee-b204-0242ac130002','7b340fd6-01c8-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','7b3297ab-01c8-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',70000.0000,'E5','02','','2023-06-03 11:38:26','2023-06-01 00:00:00','18:30:00','2','A4',NULL),('7b3550bd-01c8-11ee-b204-0242ac130002','7b3550ed-01c8-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151',NULL,'FAST AND FURIOUS X','','',NULL,NULL,'02','','2023-06-03 11:38:26','2023-06-01 00:00:00','18:30:00','2','A4',NULL),('7be85adf-e98a-11ed-906e-907841e9040c','7be85aed-e98a-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c','7be829b7-e98a-11ed-906e-907841e9040c','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',110000.0000,'E6','01','','2023-05-03 15:14:11','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('7be89973-e98a-11ed-906e-907841e9040c','7be8998a-e98a-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c','7be829b7-e98a-11ed-906e-907841e9040c','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',110000.0000,'D5','01','','2023-05-03 15:14:11','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('7be8c300-e98a-11ed-906e-907841e9040c','7be8c30f-e98a-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c','7be829b7-e98a-11ed-906e-907841e9040c','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',110000.0000,'D6','01','','2023-05-03 15:14:11','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('7be8fa5a-e98a-11ed-906e-907841e9040c','7be8fa69-e98a-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c','7be829b7-e98a-11ed-906e-907841e9040c','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',110000.0000,'E5','01','','2023-05-03 15:14:11','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('7be949f6-e98a-11ed-906e-907841e9040c','7be94a0d-e98a-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c',NULL,'NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',NULL,NULL,'01','','2023-05-03 15:14:11','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('7cb2f63c-01b7-11ee-97c4-0242ac140002','7cb2f64b-01b7-11ee-97c4-0242ac140002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6d9b62b8-0050-11ee-9013-88aedd095151','7cb2e303-01b7-11ee-97c4-0242ac140002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Công Đoàn 1','090909109',60000.0000,'D5','01','','2023-06-03 09:36:47','2023-06-10 00:00:00','17:30:00','1','A1',NULL),('7cb42f56-01b7-11ee-97c4-0242ac140002','7cb42f8a-01b7-11ee-97c4-0242ac140002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6d9b62b8-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Công Đoàn 1','090909109',NULL,NULL,'01','','2023-06-03 09:36:47','2023-06-10 00:00:00','17:30:00','1','A1',NULL),('7f58077a-01cb-11ee-b204-0242ac130002','7f580791-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','7f57ef65-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',60000.0000,'D6','01','','2023-06-03 12:00:02','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('7f58f8d2-01cb-11ee-b204-0242ac130002','7f58f8ea-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','7f57ef65-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',60000.0000,'E6','01','','2023-06-03 12:00:02','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('7f598e35-01cb-11ee-b204-0242ac130002','7f598e4e-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',NULL,NULL,'01','','2023-06-03 12:00:02','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('8475f51c-01cc-11ee-b204-0242ac130002','8475f527-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','8475e82f-01cc-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',60000.0000,'C2','03','','2023-06-03 12:07:20','2023-06-02 00:00:00','19:30','1','A1',NULL),('8476d287-01cc-11ee-b204-0242ac130002','8476d2ac-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','8475e82f-01cc-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',60000.0000,'D2','03','','2023-06-03 12:07:20','2023-06-02 00:00:00','19:30','1','A1',NULL),('8477d34f-01cc-11ee-b204-0242ac130002','8477d375-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',NULL,NULL,'03','','2023-06-03 12:07:20','2023-06-02 00:00:00','19:30','1','A1',NULL),('85fd93a3-01ca-11ee-b204-0242ac130002','85fd93af-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','85fd84c3-01ca-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',50000.0000,'B6','02','','2023-06-03 11:53:03','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('85fef692-01ca-11ee-b204-0242ac130002','85fef6a8-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','85fd84c3-01ca-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',50000.0000,'C6','02','','2023-06-03 11:53:03','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('8600eac7-01ca-11ee-b204-0242ac130002','8600eaeb-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151',NULL,'FAST AND FURIOUS X','','',NULL,NULL,'02','','2023-06-03 11:53:03','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('8610c0c2-e4b0-11ed-8328-88aedd095151','8610c0ce-e4b0-11ed-8328-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151','8610b06f-e4b0-11ed-8328-88aedd095151','PHIM ANH EM SUPER MARIO','','',NULL,'D5','01','','2023-04-27 11:03:53','2023-04-13 00:00:00','17:30:00','1','A1',_binary '\0'),('86112d55-e4b0-11ed-8328-88aedd095151','86112d68-e4b0-11ed-8328-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151','8610b06f-e4b0-11ed-8328-88aedd095151','PHIM ANH EM SUPER MARIO','','',NULL,'D4','01','','2023-04-27 11:03:53','2023-04-13 00:00:00','17:30:00','1','A1',_binary '\0'),('86119625-e4b0-11ed-8328-88aedd095151','8611964a-e4b0-11ed-8328-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151',NULL,'PHIM ANH EM SUPER MARIO','','',NULL,NULL,'01','','2023-04-27 11:03:53','2023-04-13 00:00:00','17:30:00','1','A1',_binary '\0'),('870db608-01db-11ee-b204-0242ac130002','870db618-01db-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6dd22ece-0050-11ee-9013-88aedd095151','870d9d8a-01db-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Vũ Công Đoàn','0936561533',60000.0000,'A4','02','','2023-06-03 13:54:47','2023-06-10 00:00:00','18:30:00','1','A1',NULL),('870ed5ba-01db-11ee-b204-0242ac130002','870ed5cf-01db-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6dd22ece-0050-11ee-9013-88aedd095151','870d9d8a-01db-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Vũ Công Đoàn','0936561533',60000.0000,'B4','02','','2023-06-03 13:54:47','2023-06-10 00:00:00','18:30:00','1','A1',NULL),('870fd197-01db-11ee-b204-0242ac130002','870fd1bb-01db-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6dd22ece-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Vũ Công Đoàn','0936561533',NULL,NULL,'02','','2023-06-03 13:54:47','2023-06-10 00:00:00','18:30:00','1','A1',NULL),('87954a91-01c8-11ee-b204-0242ac130002','87954a9f-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151','879539f3-01c8-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D4','02','','2023-06-03 11:38:47','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('8797129b-01c8-11ee-b204-0242ac130002','879712bd-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151','879539f3-01c8-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'E4','02','','2023-06-03 11:38:47','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('87982a0f-01c8-11ee-b204-0242ac130002','87982a38-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'02','','2023-06-03 11:38:47','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('887ff1a9-0345-11ee-b204-0242ac130002','887ff1c0-0345-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','887fd397-0345-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'E8','01','admin1','2023-06-05 09:06:07','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('88812311-0345-11ee-b204-0242ac130002','88812328-0345-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','887fd397-0345-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'E9','01','admin1','2023-06-05 09:06:07','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('8881dd6b-0345-11ee-b204-0242ac130002','8881dd8d-0345-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002',NULL,'NHỮNG KẺ THAO TÚNG','','',NULL,NULL,'01','admin1','2023-06-05 09:06:07','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('8a54457f-01cc-11ee-b204-0242ac130002','8a54458a-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','8a543919-01cc-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'C2','03','','2023-06-03 12:07:30','2023-06-02 00:00:00','19:30','1','A1',NULL),('8a555157-01cc-11ee-b204-0242ac130002','8a555176-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','8a543919-01cc-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D2','03','','2023-06-03 12:07:30','2023-06-02 00:00:00','19:30','1','A1',NULL),('8a5622b0-01cc-11ee-b204-0242ac130002','8a5622d5-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 12:07:30','2023-06-02 00:00:00','19:30','1','A1',NULL),('93bd16c9-f58b-11ed-906e-907841e9040c','93bd16e1-f58b-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','456e9730-ed6b-11ed-8709-88aedd095151','93bc84bc-f58b-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'D6','02','','2023-05-18 21:52:14','2023-04-04 00:00:00','18:30:00','1','A2',_binary '\0'),('93bde8f6-f58b-11ed-906e-907841e9040c','93bde909-f58b-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','456e9730-ed6b-11ed-8709-88aedd095151','93bc84bc-f58b-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'D5','02','','2023-05-18 21:52:14','2023-04-04 00:00:00','18:30:00','1','A2',_binary '\0'),('93be3a77-f58b-11ed-906e-907841e9040c','93be3a9b-f58b-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','456e9730-ed6b-11ed-8709-88aedd095151',NULL,'VỆ BINH DẢI NGÂN HÀ 3','','',NULL,NULL,'02','','2023-05-18 21:52:14','2023-04-04 00:00:00','18:30:00','1','A2',_binary '\0'),('95d04962-0345-11ee-b204-0242ac130002','95d04974-0345-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','95d037ec-0345-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'F7','01','admin1','2023-06-05 09:06:29','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('95d17f46-0345-11ee-b204-0242ac130002','95d17f59-0345-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','95d037ec-0345-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'G7','01','admin1','2023-06-05 09:06:29','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('95d2c85c-0345-11ee-b204-0242ac130002','95d2c86d-0345-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','95d037ec-0345-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'H7','01','admin1','2023-06-05 09:06:29','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('95d3cb87-0345-11ee-b204-0242ac130002','95d3cba2-0345-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','95d037ec-0345-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'I7','01','admin1','2023-06-05 09:06:29','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('95d4a3ba-0345-11ee-b204-0242ac130002','95d4a3d3-0345-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','95d037ec-0345-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'I8','01','admin1','2023-06-05 09:06:29','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('95d5bd0e-0345-11ee-b204-0242ac130002','95d5bd2b-0345-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','95d037ec-0345-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'H8','01','admin1','2023-06-05 09:06:29','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('95d6b215-0345-11ee-b204-0242ac130002','95d6b227-0345-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','95d037ec-0345-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'G8','01','admin1','2023-06-05 09:06:29','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('95d778f6-0345-11ee-b204-0242ac130002','95d77909-0345-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','95d037ec-0345-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'F8','01','admin1','2023-06-05 09:06:29','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('95d8632b-0345-11ee-b204-0242ac130002','95d86354-0345-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002',NULL,'NHỮNG KẺ THAO TÚNG','','',NULL,NULL,'01','admin1','2023-06-05 09:06:29','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('9bd867f3-01c7-11ee-b204-0242ac130002','9bd86801-01c7-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','9bd85639-01c7-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'C4','03','','2023-06-03 11:32:11','2023-06-02 00:00:00','19:30','1','A1',NULL),('9bd95796-01c7-11ee-b204-0242ac130002','9bd957af-01c7-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','9bd85639-01c7-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'B4','03','','2023-06-03 11:32:11','2023-06-02 00:00:00','19:30','1','A1',NULL),('9bda2b2a-01c7-11ee-b204-0242ac130002','9bda2b4b-01c7-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 11:32:11','2023-06-02 00:00:00','19:30','1','A1',NULL),('9c98834e-01cb-11ee-b204-0242ac130002','9c98835c-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','9c987604-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'G4','03','','2023-06-03 12:00:51','2023-06-02 00:00:00','19:30','1','A1',NULL),('9c9959c9-01cb-11ee-b204-0242ac130002','9c9959e2-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','9c987604-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'G5','03','','2023-06-03 12:00:51','2023-06-02 00:00:00','19:30','1','A1',NULL),('9c9a35dd-01cb-11ee-b204-0242ac130002','9c9a3605-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 12:00:51','2023-06-02 00:00:00','19:30','1','A1',NULL),('9dd40a0a-fa33-11ed-906e-907841e9040c','9dd40a17-fa33-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','9dd3c8f2-fa33-11ed-906e-907841e9040c','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Minh Đoàn','0911123984',140000.0000,'D5','03','','2023-05-24 20:05:11','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('9dd4b18c-fa33-11ed-906e-907841e9040c','9dd4b19d-fa33-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','9dd3c8f2-fa33-11ed-906e-907841e9040c','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Minh Đoàn','0911123984',140000.0000,'D6','03','','2023-05-24 20:05:11','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('9dd4da67-fa33-11ed-906e-907841e9040c','9dd4da7b-fa33-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151',NULL,'LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Minh Đoàn','0911123984',NULL,NULL,'03','','2023-05-24 20:05:11','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('a0793030-015a-11ee-97c4-0242ac140002','a0793041-015a-11ee-97c4-0242ac140002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','a07907f9-015a-11ee-97c4-0242ac140002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'A4','03','','2023-06-02 22:32:04','2023-06-02 00:00:00','19:30','1','A1',_binary '\0'),('a07a5869-015a-11ee-97c4-0242ac140002','a07a5884-015a-11ee-97c4-0242ac140002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','a07907f9-015a-11ee-97c4-0242ac140002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'A5','03','','2023-06-02 22:32:04','2023-06-02 00:00:00','19:30','1','A1',_binary '\0'),('a07c2289-015a-11ee-97c4-0242ac140002','a07c22b5-015a-11ee-97c4-0242ac140002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-02 22:32:04','2023-06-02 00:00:00','19:30','1','A1',_binary '\0'),('a17d6d0f-01cb-11ee-b204-0242ac130002','a17d6d22-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','a17d5b50-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'G6','03','','2023-06-03 12:00:59','2023-06-02 00:00:00','19:30','1','A1',NULL),('a17e7a60-01cb-11ee-b204-0242ac130002','a17e7a74-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','a17d5b50-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'G7','03','','2023-06-03 12:00:59','2023-06-02 00:00:00','19:30','1','A1',NULL),('a17f6f9b-01cb-11ee-b204-0242ac130002','a17f6fbf-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 12:00:59','2023-06-02 00:00:00','19:30','1','A1',NULL),('a79bd037-01ca-11ee-b204-0242ac130002','a79bd043-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','a79bc2e4-01ca-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',50000.0000,'C8','02','','2023-06-03 11:54:00','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('a79d5255-01ca-11ee-b204-0242ac130002','a79d5273-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','a79bc2e4-01ca-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',50000.0000,'D8','02','','2023-06-03 11:54:00','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('a79e3890-01ca-11ee-b204-0242ac130002','a79e38c2-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151',NULL,'FAST AND FURIOUS X','','',NULL,NULL,'02','','2023-06-03 11:54:00','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('ad0f0530-e41b-11ed-9a9a-88aedd095151','ad0f0540-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'E5','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('ad0f75b8-e41b-11ed-9a9a-88aedd095151','ad0f75c7-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'E6','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('ad0fd05f-e41b-11ed-9a9a-88aedd095151','ad0fd074-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'D6','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('ad1047ab-e41b-11ed-9a9a-88aedd095151','ad1047bf-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'D5','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('ad10aab8-e41b-11ed-9a9a-88aedd095151','ad10aacc-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'C5','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('ad10f483-e41b-11ed-9a9a-88aedd095151','ad10f491-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'C6','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('ad114c5d-e41b-11ed-9a9a-88aedd095151','ad114c75-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','','',NULL,NULL,'01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('af119f2f-01c9-11ee-b204-0242ac130002','af119f43-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','af1189c3-01c9-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D7','03','','2023-06-03 11:47:03','2023-06-02 00:00:00','19:30','1','A1',NULL),('af129cc8-01c9-11ee-b204-0242ac130002','af129ce5-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','af1189c3-01c9-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'E7','03','','2023-06-03 11:47:03','2023-06-02 00:00:00','19:30','1','A1',NULL),('af149c45-01c9-11ee-b204-0242ac130002','af149c6c-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 11:47:03','2023-06-02 00:00:00','19:30','1','A1',NULL),('b340a7e0-01c9-11ee-b204-0242ac130002','b340a7eb-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','b3409bee-01c9-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D8','03','','2023-06-03 11:47:10','2023-06-02 00:00:00','19:30','1','A1',NULL),('b34193c3-01c9-11ee-b204-0242ac130002','b34193d6-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','b3409bee-01c9-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'E8','03','','2023-06-03 11:47:10','2023-06-02 00:00:00','19:30','1','A1',NULL),('b3428a0e-01c9-11ee-b204-0242ac130002','b3428a32-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 11:47:10','2023-06-02 00:00:00','19:30','1','A1',NULL),('b501133c-035c-11ee-b204-0242ac130002','b501134a-035c-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','b500f647-035c-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'A7','01','','2023-06-05 11:52:00','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('b501f4b7-035c-11ee-b204-0242ac130002','b501f4cd-035c-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','b500f647-035c-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'A9','01','','2023-06-05 11:52:00','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('b5028749-035c-11ee-b204-0242ac130002','b5028760-035c-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','b500f647-035c-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'A10','01','','2023-06-05 11:52:00','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('b5035618-035c-11ee-b204-0242ac130002','b503562e-035c-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','b500f647-035c-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'G10','01','','2023-06-05 11:52:00','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('b5046065-035c-11ee-b204-0242ac130002','b5046086-035c-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002',NULL,'NHỮNG KẺ THAO TÚNG','','',NULL,NULL,'01','','2023-06-05 11:52:00','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('b514ac20-01df-11ee-b204-0242ac130002','b514ac31-01df-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6d9b62b8-0050-11ee-9013-88aedd095151','b51496f7-01df-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Vũ Công Đoàn','0936561533',60000.0000,'F6','01','','2023-06-03 14:24:42','2023-06-10 00:00:00','17:30:00','1','A1',NULL),('b515c2ef-01df-11ee-b204-0242ac130002','b515c316-01df-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6d9b62b8-0050-11ee-9013-88aedd095151','b51496f7-01df-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Vũ Công Đoàn','0936561533',60000.0000,'E6','01','','2023-06-03 14:24:42','2023-06-10 00:00:00','17:30:00','1','A1',NULL),('b51736a1-01df-11ee-b204-0242ac130002','b51736c9-01df-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6d9b62b8-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Vũ Công Đoàn','0936561533',NULL,NULL,'01','','2023-06-03 14:24:42','2023-06-10 00:00:00','17:30:00','1','A1',NULL),('b5fe8ce6-06a5-11ee-b204-0242ac130002','b5fe8cf4-06a5-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','b5fe76a7-06a5-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50001.0000,'D10','01','admin1','2023-06-09 16:12:08','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('b5ffa563-06a5-11ee-b204-0242ac130002','b5ffa57a-06a5-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','b5fe76a7-06a5-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50001.0000,'D9','01','admin1','2023-06-09 16:12:08','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('b600a7ec-06a5-11ee-b204-0242ac130002','b600a809-06a5-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002',NULL,'NHỮNG KẺ THAO TÚNG','','',NULL,NULL,'01','admin1','2023-06-09 16:12:08','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('bb6122a5-01a9-11ee-97c4-0242ac140002','bb6122b1-01a9-11ee-97c4-0242ac140002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','bb6113cf-01a9-11ee-97c4-0242ac140002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0911123984',60000.0000,'C1','01','admin1','2023-06-03 07:58:19','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('bb624f27-01a9-11ee-97c4-0242ac140002','bb624f4d-01a9-11ee-97c4-0242ac140002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0911123984',NULL,NULL,'01','admin1','2023-06-03 07:58:19','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('be106300-01ca-11ee-b204-0242ac130002','be10630c-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','be10555d-01ca-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',50000.0000,'C7','02','','2023-06-03 11:54:37','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('be117375-01ca-11ee-b204-0242ac130002','be11738c-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','be10555d-01ca-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',50000.0000,'H6','02','','2023-06-03 11:54:37','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('be12a01b-01ca-11ee-b204-0242ac130002','be12a035-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151','be10555d-01ca-11ee-b204-0242ac130002','FAST AND FURIOUS X','','',50000.0000,'I6','02','','2023-06-03 11:54:37','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('be135c64-01ca-11ee-b204-0242ac130002','be135c8b-01ca-11ee-b204-0242ac130002','adcbe5cc-7cda-4351-8ee1-e391892199c8','de38a4b9-0049-11ee-9013-88aedd095151',NULL,'FAST AND FURIOUS X','','',NULL,NULL,'02','','2023-06-03 11:54:37','2023-06-01 00:00:00','18:30:00','1','A4',NULL),('c357c848-01f8-11ee-b204-0242ac130002','c357c858-01f8-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','c357b87e-01f8-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'D7','01','admin1','2023-06-03 17:24:03','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('c358b5ff-01f8-11ee-b204-0242ac130002','c358b613-01f8-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','c357b87e-01f8-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'E7','01','admin1','2023-06-03 17:24:03','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('c3597bdf-01f8-11ee-b204-0242ac130002','c3597bf9-01f8-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','c357b87e-01f8-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'D8','01','admin1','2023-06-03 17:24:03','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('c35a4878-01f8-11ee-b204-0242ac130002','c35a489d-01f8-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002',NULL,'NHỮNG KẺ THAO TÚNG','','',NULL,NULL,'01','admin1','2023-06-03 17:24:03','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('c3845ece-01cb-11ee-b204-0242ac130002','c3845ee1-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','c3844d79-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'H5','03','','2023-06-03 12:01:56','2023-06-02 00:00:00','19:30','1','A1',NULL),('c385d5f0-01cb-11ee-b204-0242ac130002','c385d602-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','c3844d79-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'I5','03','','2023-06-03 12:01:56','2023-06-02 00:00:00','19:30','1','A1',NULL),('c3869f4a-01cb-11ee-b204-0242ac130002','c3869f69-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','c3844d79-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'I6','03','','2023-06-03 12:01:56','2023-06-02 00:00:00','19:30','1','A1',NULL),('c3873ec5-01cb-11ee-b204-0242ac130002','c3873ee0-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','c3844d79-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'H6','03','','2023-06-03 12:01:56','2023-06-02 00:00:00','19:30','1','A1',NULL),('c3882a1c-01cb-11ee-b204-0242ac130002','c3882a33-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','c3844d79-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',70000.0000,'J6','03','','2023-06-03 12:01:56','2023-06-02 00:00:00','19:30','2','A1',NULL),('c388f12f-01cb-11ee-b204-0242ac130002','c388f14b-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','c3844d79-01cb-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',70000.0000,'J5','03','','2023-06-03 12:01:56','2023-06-02 00:00:00','19:30','2','A1',NULL),('c389caca-01cb-11ee-b204-0242ac130002','c389caeb-01cb-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 12:01:56','2023-06-02 00:00:00','19:30','2','A1',NULL),('c5b3d843-01c4-11ee-b204-0242ac130002','c5b3d856-01c4-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','c5b3c58f-01c4-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Công Đoàn 1','090909109',60000.0000,'C2','01','','2023-06-03 11:11:53','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('c5b5173c-01c4-11ee-b204-0242ac130002','c5b5174f-01c4-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','c5b3c58f-01c4-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Công Đoàn 1','090909109',60000.0000,'D2','01','','2023-06-03 11:11:53','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('c5b5fe45-01c4-11ee-b204-0242ac130002','c5b5fe65-01c4-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Công Đoàn 1','090909109',NULL,NULL,'01','','2023-06-03 11:11:53','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('d37bb9de-fa33-11ed-906e-907841e9040c','d37bb9f1-fa33-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','d37a3ed2-fa33-11ed-906e-907841e9040c','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Công Đoàn','09090909',140000.0000,'D7','03','','2023-05-24 20:06:41','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('d37c07d7-fa33-11ed-906e-907841e9040c','d37c07e9-fa33-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','d37a3ed2-fa33-11ed-906e-907841e9040c','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Công Đoàn','09090909',140000.0000,'D8','03','','2023-05-24 20:06:41','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('d37c4940-fa33-11ed-906e-907841e9040c','d37c4953-fa33-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151',NULL,'LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Công Đoàn','09090909',NULL,NULL,'03','','2023-05-24 20:06:41','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('d59d30f4-e41b-11ed-9a9a-88aedd095151','d59d3115-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','d59d12f5-e41b-11ed-9a9a-88aedd095151','Phim thử 3','Công Đoàn','0936561355',52000.0000,'C7','01','','2023-04-26 17:19:31','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('d59eeb7d-e41b-11ed-9a9a-88aedd095151','d59eebab-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','d59d12f5-e41b-11ed-9a9a-88aedd095151','Phim thử 3','Công Đoàn','0936561355',52000.0000,'D7','01','','2023-04-26 17:19:31','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('d59f6948-e41b-11ed-9a9a-88aedd095151','d59f6975-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','Công Đoàn','0936561355',NULL,NULL,'01','','2023-04-26 17:19:31','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('d686edfe-01ca-11ee-b204-0242ac130002','d686ee10-01ca-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','d686dd58-01ca-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'F7','01','','2023-06-03 11:55:18','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('d687dd09-01ca-11ee-b204-0242ac130002','d687dd1d-01ca-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','d686dd58-01ca-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'E7','01','','2023-06-03 11:55:18','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('d688fcac-01ca-11ee-b204-0242ac130002','d688fcc4-01ca-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','d686dd58-01ca-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D7','01','','2023-06-03 11:55:18','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('d68a21d1-01ca-11ee-b204-0242ac130002','d68a21e8-01ca-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','d686dd58-01ca-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D8','01','','2023-06-03 11:55:18','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('d68af106-01ca-11ee-b204-0242ac130002','d68af121-01ca-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','d686dd58-01ca-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'E8','01','','2023-06-03 11:55:18','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('d68b99e3-01ca-11ee-b204-0242ac130002','d68b9a04-01ca-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','d686dd58-01ca-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'F8','01','','2023-06-03 11:55:18','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('d68c4e8d-01ca-11ee-b204-0242ac130002','d68c4ead-01ca-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'01','','2023-06-03 11:55:18','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('de24fca2-01c8-11ee-b204-0242ac130002','de24fcb2-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151','de24ec6e-01c8-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'E5','02','','2023-06-03 11:41:12','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('de25fbc2-01c8-11ee-b204-0242ac130002','de25fbd3-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151','de24ec6e-01c8-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D5','02','','2023-06-03 11:41:12','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('de26f331-01c8-11ee-b204-0242ac130002','de26f355-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'02','','2023-06-03 11:41:12','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('de3262ad-01cc-11ee-b204-0242ac130002','de3262bc-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151','de3253ca-01cc-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',60000.0000,'C4','02','','2023-06-03 12:09:50','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('de332eda-01cc-11ee-b204-0242ac130002','de332ef2-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151','de3253ca-01cc-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',60000.0000,'C5','02','','2023-06-03 12:09:50','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('de340b47-01cc-11ee-b204-0242ac130002','de340b69-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',NULL,NULL,'02','','2023-06-03 12:09:50','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('df4645e3-0477-11ee-b204-0242ac130002','df4645f5-0477-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','df4631ca-0477-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'F6','01','admin1','2023-06-06 21:38:58','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('df474abb-0477-11ee-b204-0242ac130002','df474acf-0477-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','df4631ca-0477-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'G6','01','admin1','2023-06-06 21:38:58','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('df482a4e-0477-11ee-b204-0242ac130002','df482a6a-0477-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002',NULL,'NHỮNG KẺ THAO TÚNG','','',NULL,NULL,'01','admin1','2023-06-06 21:38:58','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('e1d34305-01cc-11ee-b204-0242ac130002','e1d34310-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151','e1d33776-01cc-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',60000.0000,'C6','02','','2023-06-03 12:09:56','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('e1d43ec1-01cc-11ee-b204-0242ac130002','e1d43edd-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151','e1d33776-01cc-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',60000.0000,'D6','02','','2023-06-03 12:09:56','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('e1d51b4a-01cc-11ee-b204-0242ac130002','e1d51b67-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',NULL,NULL,'02','','2023-06-03 12:09:56','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('e3ca576b-05b4-11ee-b204-0242ac130002','e3ca5786-05b4-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','e3ca308a-05b4-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'C6','01','','2023-06-08 11:28:16','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('e3cc3d1f-05b4-11ee-b204-0242ac130002','e3cc3d40-05b4-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002','e3ca308a-05b4-11ee-b204-0242ac130002','NHỮNG KẺ THAO TÚNG','','',50000.0000,'C5','01','','2023-06-08 11:28:16','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('e3cd9f16-05b4-11ee-b204-0242ac130002','e3cd9f3c-05b4-11ee-b204-0242ac130002','cef32a5e-21e4-4633-b241-9fab2fab1939','30c024e4-01e6-11ee-b204-0242ac130002',NULL,'NHỮNG KẺ THAO TÚNG','','',NULL,NULL,'01','','2023-06-08 11:28:16','2023-06-03 00:00:00','17:30:00','1','A4',NULL),('efe69a63-01cd-11ee-b204-0242ac130002','efe69a73-01cd-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151','efe686a5-01cd-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'C2','02','','2023-06-03 12:17:29','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('efe7722e-01cd-11ee-b204-0242ac130002','efe77247-01cd-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151','efe686a5-01cd-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D2','02','','2023-06-03 12:17:29','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('efe81e91-01cd-11ee-b204-0242ac130002','efe81eb9-01cd-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','672ee774-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'02','','2023-06-03 12:17:29','2023-06-02 00:00:00','18:30:00','1','A1',NULL),('f7336662-01c7-11ee-b204-0242ac130002','f7336676-01c7-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','f73352c4-01c7-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D4','01','','2023-06-03 11:34:45','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('f73476ff-01c7-11ee-b204-0242ac130002','f734771a-01c7-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151','f73352c4-01c7-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'E4','01','','2023-06-03 11:34:45','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('f735688a-01c7-11ee-b204-0242ac130002','f735689f-01c7-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6768bac0-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'01','','2023-06-03 11:34:45','2023-06-02 00:00:00','17:30:00','1','A1',NULL),('f756337f-e410-11ed-9a9a-88aedd095151','f75633b3-e410-11ed-9a9a-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151','f755f2a2-e410-11ed-9a9a-88aedd095151','PHIM ANH EM SUPER MARIO','','',NULL,'E5','01','','2023-04-26 16:01:43','2023-04-13 00:00:00','17:30:00',NULL,NULL,_binary '\0'),('f7572c95-e410-11ed-9a9a-88aedd095151','f7572cb7-e410-11ed-9a9a-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151','f755f2a2-e410-11ed-9a9a-88aedd095151','PHIM ANH EM SUPER MARIO','','',NULL,'F5','01','','2023-04-26 16:01:43','2023-04-13 00:00:00','17:30:00',NULL,NULL,_binary '\0'),('f757c21d-e410-11ed-9a9a-88aedd095151','f757c24b-e410-11ed-9a9a-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151',NULL,'PHIM ANH EM SUPER MARIO','','',NULL,NULL,'01','','2023-04-26 16:01:43','2023-04-13 00:00:00','17:30:00',NULL,NULL,_binary '\0'),('f889bd09-01c8-11ee-b204-0242ac130002','f889bd1a-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','f889ad3f-01c8-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D5','03','','2023-06-03 11:41:56','2023-06-02 00:00:00','19:30','1','A1',NULL),('f88a8703-01c8-11ee-b204-0242ac130002','f88a871d-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','f889ad3f-01c8-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'E5','03','','2023-06-03 11:41:56','2023-06-02 00:00:00','19:30','1','A1',NULL),('f88b3c8a-01c8-11ee-b204-0242ac130002','f88b3cba-01c8-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 11:41:57','2023-06-02 00:00:00','19:30','1','A1',NULL),('f8fdae7a-01c9-11ee-b204-0242ac130002','f8fdae8a-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','f8fd9cef-01c9-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Công Đoàn','0936561355',60000.0000,'A6','03','','2023-06-03 11:49:07','2023-06-02 00:00:00','19:30','1','A1',NULL),('f8fedba3-01c9-11ee-b204-0242ac130002','f8fedbbb-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','f8fd9cef-01c9-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Công Đoàn','0936561355',60000.0000,'B6','03','','2023-06-03 11:49:07','2023-06-02 00:00:00','19:30','1','A1',NULL),('f8ffb58c-01c9-11ee-b204-0242ac130002','f8ffb5bb-01c9-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Công Đoàn','0936561355',NULL,NULL,'03','','2023-06-03 11:49:07','2023-06-02 00:00:00','19:30','1','A1',NULL),('fb8acf69-01c6-11ee-b204-0242ac130002','fb8acf7c-01c6-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6d9b62b8-0050-11ee-9013-88aedd095151','fb8ab163-01c6-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'D4','01','','2023-06-03 11:27:43','2023-06-10 00:00:00','17:30:00','1','A1',NULL),('fb8c5797-01c6-11ee-b204-0242ac130002','fb8c57b2-01c6-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6d9b62b8-0050-11ee-9013-88aedd095151','fb8ab163-01c6-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'E4','01','','2023-06-03 11:27:43','2023-06-10 00:00:00','17:30:00','1','A1',NULL),('fb8d406d-01c6-11ee-b204-0242ac130002','fb8d408f-01c6-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','6d9b62b8-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'01','','2023-06-03 11:27:43','2023-06-10 00:00:00','17:30:00','1','A1',NULL),('fc750f66-01cc-11ee-b204-0242ac130002','fc750f71-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','fc750219-01cc-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'I7','03','','2023-06-03 12:10:41','2023-06-02 00:00:00','19:30','1','A1',NULL),('fc75dbc9-01cc-11ee-b204-0242ac130002','fc75dbde-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151','fc750219-01cc-11ee-b204-0242ac130002','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',60000.0000,'I8','03','','2023-06-03 12:10:41','2023-06-02 00:00:00','19:30','1','A1',NULL),('fc76991f-01cc-11ee-b204-0242ac130002','fc769940-01cc-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','66f3b360-0050-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','','',NULL,NULL,'03','','2023-06-03 12:10:41','2023-06-02 00:00:00','19:30','1','A1',NULL);
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
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `LanguageCode` varchar(10) NOT NULL DEFAULT '' COMMENT 'Mã ngôn ngữ',
  `LanguageName` varchar(50) DEFAULT NULL COMMENT 'Tên ngôn ngữ',
  PRIMARY KEY (`LanguageCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=5461 COMMENT='Bảng lưu danh mục ngôn ngữ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES ('EN','English'),('JP','Japanese'),('KR','Korean'),('THL','Thailand'),('VN','Việt Nam');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
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
INSERT INTO `listcinema` VALUES ('7e18991f-e768-11ed-8b5d-907841e9040c','R2','Rạp chiếu phim Mỹ Đình','Mỹ Đình, Hà Nội, Việt Nam',NULL,NULL,'Công ty TNHH Cinema - VN chi nhánh Hà Nội','088888888',NULL,'00325412512314521');
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
INSERT INTO `movie` VALUES ('24aa75fc-0409-4926-9489-465e6fe2d377','P0034','NƠI TA GẶP NHAU','2023-06-01 17:00:00','Thidalat Vongsili, Phanukorn Inyim','Wittawin Lertrasamala, Chanset Wisetchai','ebed1079-002e-11ee-9013-88aedd095151','THL',NULL,'images/188cdfa3-035e-48c7-bbd1-fac6e3790d51','Đây là câu chuyện về “Tình yêu đơn phương\" giữa hai người. Kong, (do Panukorn Inyim thủ vai) một chàng trai trẻ lãng mạn vô vọng, được ông chủ giao nhiệm vụ quan sát và nghiên cứu lối sống của người dân địa phương ở Banphasing, quận Nong Wua So, Udon Tỉnh Thani.Một ngày anh gặp Nam (do Thidalat Vongsiri thủ vai), một nhà văn trẻ châu Á có nhiều thành tích nổi trội, cô ây đang trong dự án cần viết một bài báo về lịch sử, truyền thống, văn hóa và tín ngưỡng địa phương của tỉnh Udon Thani. Từ thời điểm họ gặp nhau Kong ngay lập tức thích Nam. Mỗi ngày trôi qua, họ càng hiểu nhau nhiều hơn, mối quan hệ và tình yêu của họ dành cho nhau ngày càng lớn dần. Singh, là đàn anh của Kong (do Son the Star thủ vai), người đóng vai trò là người bạn đồng hành của cặp đôi. mai mối và giúp Kong bằng mọi cách để có thể tiếp cận được Nam, nhưng khi bạn trai của Nam là Nott (do Athit Si Lao thủ vai) bất ngờ xuất hiện để đưa cô về, Kong và Singh phát hiện ra rằng còn nhiều điều ở cô mà họ không biết. Bởi vì lời cuối cùng của Nam trước khi cô ấy rời đi: “Khi hai người gặp nhau, bạn có thể nghĩ rằng đó chỉ là một sự trùng hợp ngẫu nhiên. Nhưng đối với tôi, đó là số phận.”','2023-06-01 17:00:00','2023-07-29 17:00:00',NULL,NULL,104),('2aed159b-a87f-4f86-b889-c3a2ece2fdb1','P0036','CÔ BÉ CỨU HỎA','2023-06-28 17:00:00',NULL,'Laurent Zeitoun, Theodore Ty','73db8507-d17b-11ed-a44f-907841e9040c','EN',NULL,'images/c88ce88a-0ee9-4484-a574-6dfa3ca08555','Cô Bé Cứu Hoả (tên tiếng Anh: Fireheart) đưa người xem bước vào hành trình phiêu lưu kỳ thú của Georgia Nolan - một cô bé thông minh, nhiệt huyết với ước mơ trở thành lính cứu hoả như ba mình. Tuy nhiên, năm 1932 tại New York, phụ nữ không được phép làm công việc này. Nhưng cơ hội “vàng” đã đến khi Georgia nảy ra ý định cải trang thành Joe - một chàng trai vụng về gia nhập đội cứu hoả do chính ba mình thành lập. Vừa phải bảo vệ danh tính thật, vừa phải dấn thân vào phi vụ mạo hiểm: Giải cứu những người lính cứu hoả của thành phố đã lần lượt biến mất trong ngọn lửa bí ẩn thiêu rụi Nhà hát Broadway, liệu Georgia có dũng cảm vượt qua tất cả và thành công?','2023-06-29 17:00:00','2023-07-29 17:00:00',NULL,NULL,92),('3aa6c663-36d9-4797-94b9-dcd6dcc51e2e','P0001','PHIM CÚ ÚP RỔ ĐẦU TIÊN','2023-04-04 17:00:00','Masaya Fukunishi, Yoshiaki Hasegawa, Katsuhisa Hoki, Tetsu Inada, Ryota Iwasaki, Shinichiro Kamio, Mitsuaki Kanuka, Jun Kasama, Subaru Kimura,..','Takehiko Inoue, Yasuyuki Ebara','73db8507-d17b-11ed-a44f-907841e9040c','JP',NULL,'images/f2cf4678-8226-4b5a-ad7f-de62454ddda8','Bộ phim hoạt hình chuyển thể từ loạt truyện tranh “Slam Dunk” nổi tiếng của Takehiko Inoue, khắc họa quá trình trưởng thành cá nhân của những học sinh trung học cống hiến tuổi trẻ cho bóng rổ. Phim theo chân Ryota Miyagi, hậu vệ của đội bóng rổ trường trung học Shohoku. Anh có một người anh trai, Sota, hơn anh ba tuổi và là người đã truyền cảm hứng cho tình yêu bóng rổ của anh. Ryota và các đồng đội của mình là Hanamichi Sakuragi, Takenori Akagi, Hisashi Mitsui và Kaede Rukawa thách đấu nhà vô địch bóng rổ liên trường, đội bóng rổ trường trung học Sannoh. Tác giả nguyên tác Inoue phụ trách chỉ đạo và viết kịch bản.','2023-04-05 17:00:00','2023-04-19 17:00:00',NULL,NULL,120),('53a1c706-f6ac-41b4-bb24-183cf38acc42','P0031','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','2023-05-09 17:00:00','Lý Hải, Quốc Cường, Trung Dũng, Huy Khánh, Thanh Thức, Trần Kim Hải, Huỳnh Thi, Diệp Bảo Ngọc, Tú Tri, Quỳnh Như, Tạ Lâm, bé Thùy Linh…','Lý Hải','73db8507-d17b-11ed-a44f-907841e9040c','VN',NULL,'images/8b0cce51-6630-40da-92bf-568818d3b69e','Lật mặt 6 sẽ thuộc thể loại giật gân, tâm lý pha hành động, hài hước.','2023-05-01 17:00:00','2023-05-30 17:00:00',NULL,NULL,132),('54861f66-6dfd-4fe4-9e5f-795e64df4f70','P001','VỆ BINH DẢI NGÂN HÀ 3','2023-05-01 17:00:00','Chris Pratt, Zoe Saldana, Dave Bautista','James Gunn','73db8507-d17b-11ed-a44f-907841e9040c','JP','https://www.youtube.com/embed/LWiuzy-c2ag','images/2ea48c71-a5b6-4bc2-b861-5a1b4693c1b6','Cho dù vũ trụ này có bao la đến đâu, các Vệ Binh của chúng ta cũng không thể trốn chạy mãi mãi. Vệ Binh Dải Ngân Hà 3 dự kiến khởi chiếu tại rạp từ 03.05.2023.','2026-04-10 17:00:00','2027-05-20 17:00:00',NULL,NULL,149),('6e718478-a0c0-4425-bd2c-75a969a286ab','P0003','CREED III: TAY ĐẤM HUYỀN THOẠI','2023-03-31 17:00:00','Michael B. Jordan, Tessa Thompson, Jonathan Majors, Wood Harris, Phylicia Rashad, Mila Davis-Kent, Jose Benavidez, Selenis Leyva, Florian Munteanu','Michael B. Jordan','73db8507-d17b-11ed-a44f-907841e9040c','EN',NULL,'images/3ee7bee5-3f30-4ae9-86df-2b6f1557a3be','Sau khi thống trị thế giới quyền anh, Adonis Creed đã phát triển mạnh mẽ trong cả sự nghiệp và cuộc sống gia đình. Khi một người bạn thời thơ ấu và cựu thần đồng quyền anh, Damian (Jonathan Majors), tái xuất sau khi thụ án tù dài hạn, anh ta háo hức chứng minh rằng mình xứng đáng được trở lại võ đài. Cuộc chạm trán giữa những người bạn cũ không chỉ là một cuộc chiến trên võ đài thông thường. Để có thể chiến thắng, Adonis phải đặt tương lai của mình lên trên hết để chiến đấu với Damian — một võ sĩ không còn gì để mất.','2023-04-06 17:00:00','2023-04-19 17:00:00',NULL,NULL,117),('81ea1112-6d7f-4dee-85d8-15c75785de3c','P0002','PHIM ANH EM SUPER MARIO','2023-03-31 17:00:00','Chris Pratt, Anya Taylor-Joy, Charlie Day, …','Aaron Horvath, Michael Jelenic','73db8507-d17b-11ed-a44f-907841e9040c','EN','','images/3b8502f8-9813-4d58-8952-932622c796ef','Câu chuyện về cuộc phiêu lưu của anh em Super Mario đến vương quốc Nấm.','2023-04-05 17:00:00','2023-04-27 17:00:00',NULL,NULL,93),('87f0fcaa-bf50-449b-b5f8-4ddc0d76c2a5','P0035','NÀNG TIÊN CÁ','2023-05-23 17:00:00','Halle Bailey, Jonah Hauer-King, Daveed Diggs, Awkwafina, Jacob Tremblay, Noma Dumezweni, Art Malik, with Javier Bardem and Melissa McCarthy','Rob Marshall','73db8507-d17b-11ed-a44f-907841e9040c','EN',NULL,'images/527efc8d-8d40-44b8-89db-4ac03e95ba86','“Nàng Tiên Cá” là câu chuyện được yêu thích về Ariel - một nàng tiên cá trẻ xinh đẹp và mạnh mẽ với khát khao phiêu lưu. Ariel là con gái út của Vua Triton và cũng là người ngang ngạnh nhất, nàng khao khát khám phá về thế giới bên kia đại dương. Trong một lần ghé thăm đất liền, nàng đã phải lòng Hoàng tử Eric bảnh bao. Trong khi tiên cá bị cấm tiếp xúc với con người, Ariel đã làm theo trái tim mình. Nàng đã thỏa thuận với phù thủy biển Ursula hung ác để cơ hội sống cuộc sống trên đất liền. Nhưng cuối cùng việc này lại đe dọa tới mạng sống của Ariel và vương miện của cha nàng.','2023-05-25 17:00:00','2023-06-29 17:00:00',NULL,NULL,135),('8ff2ad96-1114-4c19-a164-352a8b29d8db','P0032','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','2023-05-31 17:00:00','Shameik Moore','Joaquim Dos Santos, Justin K. Thompson, Kemp Powers','ebed1079-002e-11ee-9013-88aedd095151','EN',NULL,'images/7d7bdc2f-4978-420e-b974-d5a30b598b8a','Miles Morales tái xuất trong phần tiếp theo của bom tấn hoạt hình từng đoạt giải Oscar - Spider-Man: Across the Spider-Verse. Sau khi gặp lại Gwen Stacy, chàng Spider-Man thân thiện đến từ Brooklyn phải du hành qua đa vũ trụ và gặp một nhóm Người Nhện chịu trách nhiệm bảo vệ các vũ trụ song song. Nhưng khi nhóm siêu anh hùng xung đột về cách xử lý một mối đe dọa mới, Miles buộc phải đọ sức với các Người Nhện khác và phải xác định lại ý nghĩa của việc trở thành một người hùng để có thể cứu những người cậu yêu thương nhất.','2023-05-31 17:00:00','2023-06-29 17:00:00',NULL,NULL,140),('9eda84a6-dcc8-48a2-9840-a79d6b470993','P0033','NOBITA VÀ VÙNG ĐẤT LÝ TƯỞNG TRÊN BẦU TRỜI','2023-05-31 17:00:00',NULL,'Takumi Doyama','ebed1079-002e-11ee-9013-88aedd095151','JP',NULL,'images/6e0163e2-9fe6-43ef-88a6-ec063e919973','Phim điện ảnh Doraemon: Nobita Và Vùng Đất Lý Tưởng Trên Bầu Trời kể câu chuyện khi Nobita tìm thấy một hòn đảo hình lưỡi liềm trên trời mây. Ở nơi đó, tất cả đều hoàn hảo… đến mức cậu nhóc Nobita mê ngủ ngày cũng có thể trở thành một thần đồng toán học, một siêu sao thể thao. Cả hội Doraemon cùng sử dụng một món bảo bối độc đáo chưa từng xuất hiện trước đây để đến với vương quốc tuyệt vời này. Cùng với những người bạn ở đây, đặc biệt là chàng robot mèo Sonya, cả hội đã có chuyến hành trình tới vương quốc trên mây tuyệt vời… cho đến khi những bí mật đằng sau vùng đất lý tưởng này được hé lộ.','2023-06-02 17:00:00','2023-06-29 17:00:00',NULL,NULL,124),('a8d283ca-040b-4924-99cb-48f166e5afaf','P002','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','2023-05-09 17:00:00','John Francis Daley, Jonathan Goldstein','Chris Pine, Michelle Rodriguez, Regé-Jean Page','73db8507-d17b-11ed-a44f-907841e9040c','EN',NULL,'images/f9247c63-6304-4664-83a7-30e02c4d5df3','Theo chân một tên trộm quyến rũ và một nhóm những kẻ bịp bợm nghiệp dư thực hiện vụ trộm sử thi nhằm lấy lại một di vật đã mất, nhưng mọi thứ trở nên nguy hiểm khó lường hơn bao giờ hết khi họ đã chạm trán nhầm người. Ngục Tối Và Rồng: Danh Dự Của Kẻ Trộm mang thế giới huyền ảo của trò chơi nhập vai huyền thoại lên màn ảnh rộng bằng một cuộc phiêu lưu tràn ngập các màn hành động đã mắt cùng màu sắc hài hước, vui nhộn.','2023-05-01 17:00:00','2023-05-24 17:00:00',NULL,NULL,134),('adcbe5cc-7cda-4351-8ee1-e391892199c8','P001','FAST AND FURIOUS X','2023-05-20 17:00:00','Vin Diesel, Jason Momoa, Brie Larson','Louis Leterrier','ebed1079-002e-11ee-9013-88aedd095151','JP','https://www.youtube.com/embed/LWiuzy-c2ag','images/2522a4c0-e430-40e6-8b20-766cd9914ec6','Dom Toretto và gia đình của anh ấy bị trở thành mục tiêu của người con trai đầy thù hận của ông trùm ma túy Hernan Reyes','2023-05-23 17:00:00','2023-06-29 17:00:00',NULL,NULL,100),('cef32a5e-21e4-4633-b241-9fab2fab1939','P0002','NHỮNG KẺ THAO TÚNG','2023-05-09 17:00:00','Ben Affleck, Alice Braga, William Fichtner, JD Pardo','Robert Rodriguez','ebed1079-002e-11ee-9013-88aedd095151','VN',NULL,'images/7cb50430-ff13-47cf-8048-65bdab0c3c39','Phim theo chân thám tử Daniel Rourke (Ben Affleck) trong hành trình tìm kiếm cô con gái bị mất tích. Anh sớm nhận ra tất cả những chuyện bí ẩn này đều liên quan đến một người đàn ông có sức mạnh thôi miên, bẻ cong thực tại. Với sự hỗ trợ từ nhà ngoại cảm Diana Cruz (Alice Braga), Daniel bắt đầu truy đuổi hắn và phải tìm mọi cách để đưa con gái mình trở về nhà an toàn.','2023-05-03 17:00:00','2023-06-29 17:00:00',NULL,NULL,120),('de609974-d6c1-45af-ab26-517885625c6f','P0004','BIỆT ĐỘI RẤT ỔN','2023-03-31 17:00:00','Lê Khánh, Hứa Vĩ Văn, Hoàng Oanh, Quang Tuấn, Võ Tấn Phát, Nguyên Thảo, Ngọc Phước, Ngọc Hoa, Lạc Hoàng Long','Tạ Nguyên Hiệp','73db8507-d17b-11ed-a44f-907841e9040c','VN',NULL,'images/2cd6a515-46bf-4797-bc22-5d184cbd862d','BIỆT ĐỘI RẤT ỔN xoay quanh bộ đôi Quyên (Hoàng Oanh) và Phong (Hứa Vĩ Văn). Sau lần chạm trán tình cờ, bộ đôi lôi kéo Bảy Cục (Võ Tấn Phát), Bảy Súc (Nguyên Thảo), Quạu (Ngọc Phước), Quọ (Ngọc Hoa) tham gia vào phi vụ đặc biệt: Đánh tráo chiếc vòng đính hôn bằng kim cương quý giá và lật tẩy bộ mặt thật của Tuấn - chồng cũ của Quyên trong đám cưới giữa hắn và Tư Xoàn - nữ đại gia miền Tây sở hữu khối tài sản triệu đô. Màn kết hợp bất đắc dĩ của Biệt Đội Rất Ổn - Phong, Quyên và Gia Đình Cục Súc nhằm qua mắt “cô dâu, chú rể” tại khu resort sang chảnh hứa hẹn cực kỳ gay cấn, hồi hộp nhưng không kém phần hài hước, xúc động.','2023-04-06 17:00:00','2023-04-28 17:00:00',NULL,NULL,100);
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
INSERT INTO `moviecategorydetail` VALUES ('24aa75fc-0409-4926-9489-465e6fe2d377','54687a5a-d207-11ed-afa1-0242ac120002'),('6e718478-a0c0-4425-bd2c-75a969a286ab','54687a5a-d207-11ed-afa1-0242ac120002'),('2aed159b-a87f-4f86-b889-c3a2ece2fdb1','5e260de6-d207-11ed-afa1-0242ac120002'),('3aa6c663-36d9-4797-94b9-dcd6dcc51e2e','5e260de6-d207-11ed-afa1-0242ac120002'),('81ea1112-6d7f-4dee-85d8-15c75785de3c','5e260de6-d207-11ed-afa1-0242ac120002'),('9eda84a6-dcc8-48a2-9840-a79d6b470993','5e260de6-d207-11ed-afa1-0242ac120002'),('adcbe5cc-7cda-4351-8ee1-e391892199c8','5e260de6-d207-11ed-afa1-0242ac120002'),('cef32a5e-21e4-4633-b241-9fab2fab1939','5e260de6-d207-11ed-afa1-0242ac120002'),('54861f66-6dfd-4fe4-9e5f-795e64df4f70','61aa4b93-d208-11ed-a44f-907841e9040c'),('adcbe5cc-7cda-4351-8ee1-e391892199c8','61aa4b93-d208-11ed-a44f-907841e9040c'),('53a1c706-f6ac-41b4-bb24-183cf38acc42','61ab1fc2-d208-11ed-a44f-907841e9040c'),('a8d283ca-040b-4924-99cb-48f166e5afaf','61ab1fc2-d208-11ed-a44f-907841e9040c'),('cef32a5e-21e4-4633-b241-9fab2fab1939','61ab1fc2-d208-11ed-a44f-907841e9040c'),('24aa75fc-0409-4926-9489-465e6fe2d377','7685b7d8-d207-11ed-afa1-0242ac120002'),('81ea1112-6d7f-4dee-85d8-15c75785de3c','7685b7d8-d207-11ed-afa1-0242ac120002'),('9eda84a6-dcc8-48a2-9840-a79d6b470993','7685b7d8-d207-11ed-afa1-0242ac120002'),('adcbe5cc-7cda-4351-8ee1-e391892199c8','7685b7d8-d207-11ed-afa1-0242ac120002'),('de609974-d6c1-45af-ab26-517885625c6f','7685b7d8-d207-11ed-afa1-0242ac120002'),('54861f66-6dfd-4fe4-9e5f-795e64df4f70','8cf95452-d207-11ed-afa1-0242ac120002'),('8ff2ad96-1114-4c19-a164-352a8b29d8db','8cf95452-d207-11ed-afa1-0242ac120002'),('adcbe5cc-7cda-4351-8ee1-e391892199c8','8cf95452-d207-11ed-afa1-0242ac120002'),('54861f66-6dfd-4fe4-9e5f-795e64df4f70','9b43e7b6-d207-11ed-afa1-0242ac120002'),('54861f66-6dfd-4fe4-9e5f-795e64df4f70','b4bb3e2e-d207-11ed-afa1-0242ac120002'),('81ea1112-6d7f-4dee-85d8-15c75785de3c','b4bb3e2e-d207-11ed-afa1-0242ac120002'),('87f0fcaa-bf50-449b-b5f8-4ddc0d76c2a5','b4bb3e2e-d207-11ed-afa1-0242ac120002'),('8ff2ad96-1114-4c19-a164-352a8b29d8db','b4bb3e2e-d207-11ed-afa1-0242ac120002'),('24aa75fc-0409-4926-9489-465e6fe2d377','e5999ba3-01e3-11ee-b204-0242ac130002'),('53a1c706-f6ac-41b4-bb24-183cf38acc42','ea6a3fa5-d17b-11ed-a44f-907841e9040c'),('54861f66-6dfd-4fe4-9e5f-795e64df4f70','ea6a3fa5-d17b-11ed-a44f-907841e9040c'),('8ff2ad96-1114-4c19-a164-352a8b29d8db','ea6a3fa5-d17b-11ed-a44f-907841e9040c'),('9eda84a6-dcc8-48a2-9840-a79d6b470993','ea6a3fa5-d17b-11ed-a44f-907841e9040c'),('a8d283ca-040b-4924-99cb-48f166e5afaf','ea6a3fa5-d17b-11ed-a44f-907841e9040c'),('cef32a5e-21e4-4633-b241-9fab2fab1939','ea6a3fa5-d17b-11ed-a44f-907841e9040c');
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
INSERT INTO `room` VALUES ('5eb33c7d-01f8-11ee-b204-0242ac130002','A6',NULL,10,10,_binary ''),('7fc8b77d-e6ff-11ed-8b5d-907841e9040c','A2',NULL,10,10,_binary ''),('88cfb5b3-01e3-11ee-b204-0242ac130002','A3',NULL,11,11,_binary ''),('9eb34399-0048-11ee-9013-88aedd095151','A4',NULL,10,10,_binary ''),('c8210f0e-df44-11ed-bf13-88aedd095151','A1',NULL,10,10,_binary '');
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
INSERT INTO `roomcinema` VALUES ('0f57c5b4-eb1e-11ed-a4e4-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','03','2023-05-05',NULL),('30c024e4-01e6-11ee-b204-0242ac130002','9eb34399-0048-11ee-9013-88aedd095151','cef32a5e-21e4-4633-b241-9fab2fab1939','01','2023-06-03',NULL),('32d4b4d1-ea1e-11ed-8128-88aedd095151','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','03','2023-05-04',NULL),('5f202d06-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','01','2023-06-11',NULL),('5f5563d3-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','02','2023-06-11',NULL),('5f87539e-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','03','2023-06-11',NULL),('66f3b360-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','03','2023-06-02',NULL),('672ee774-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','02','2023-06-02',NULL),('6768bac0-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','01','2023-06-02',NULL),('68861520-e28c-11ed-a14e-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','6e718478-a0c0-4425-bd2c-75a969a286ab','01','2023-04-07',NULL),('6c03dda2-e98a-11ed-906e-907841e9040c','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf','01','2023-05-16',NULL),('6d9b62b8-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','01','2023-06-10',NULL),('6dd22ece-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','02','2023-06-10',NULL),('6e0817f6-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','03','2023-06-10',NULL),('820fcf75-e28c-11ed-a14e-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','6e718478-a0c0-4425-bd2c-75a969a286ab','02','2023-04-07',NULL),('87b3da12-eae3-11ed-a4e4-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','01','2023-05-05',NULL),('9a5517dd-01e3-11ee-b204-0242ac130002','88cfb5b3-01e3-11ee-b204-0242ac130002','8ff2ad96-1114-4c19-a164-352a8b29d8db','03','2023-06-03',NULL),('aa98ab5e-df49-11ed-bf13-88aedd095151','68610f42-dec3-11ed-8b5d-907841e9040c','6e718478-a0c0-4425-bd2c-75a969a286ab','01','2023-04-13',NULL),('af43d2c8-01e6-11ee-b204-0242ac130002','88cfb5b3-01e3-11ee-b204-0242ac130002','87f0fcaa-bf50-449b-b5f8-4ddc0d76c2a5','01','2023-06-03',NULL),('afaa52cc-01e6-11ee-b204-0242ac130002','88cfb5b3-01e3-11ee-b204-0242ac130002','87f0fcaa-bf50-449b-b5f8-4ddc0d76c2a5','02','2023-06-03',NULL),('b9cbea88-e336-11ed-857f-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','01','2023-04-13',NULL),('ba28fd2a-01e6-11ee-b204-0242ac130002','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','8ff2ad96-1114-4c19-a164-352a8b29d8db','03','2023-06-03',NULL),('c61e5bca-01e6-11ee-b204-0242ac130002','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','24aa75fc-0409-4926-9489-465e6fe2d377','01','2023-06-11',NULL),('c67c3b68-01e6-11ee-b204-0242ac130002','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','24aa75fc-0409-4926-9489-465e6fe2d377','03','2023-06-11',NULL),('c6d8bc97-01e6-11ee-b204-0242ac130002','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','24aa75fc-0409-4926-9489-465e6fe2d377','02','2023-06-11',NULL),('d55a7416-01e6-11ee-b204-0242ac130002','88cfb5b3-01e3-11ee-b204-0242ac130002','9eda84a6-dcc8-48a2-9840-a79d6b470993','02','2023-06-10',NULL),('de38a4b9-0049-11ee-9013-88aedd095151','9eb34399-0048-11ee-9013-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','02','2023-06-01',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=291 COMMENT='Thông tin ghế ngồi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES ('5eb47722-01f8-11ee-b204-0242ac130002',1,1,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eb610ea-01f8-11ee-b204-0242ac130002',2,1,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eb6d404-01f8-11ee-b204-0242ac130002',3,1,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eb771d8-01f8-11ee-b204-0242ac130002',4,1,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eb86095-01f8-11ee-b204-0242ac130002',5,1,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eb94292-01f8-11ee-b204-0242ac130002',6,1,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eb9d89a-01f8-11ee-b204-0242ac130002',7,1,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eba94d9-01f8-11ee-b204-0242ac130002',8,1,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ebb4aed-01f8-11ee-b204-0242ac130002',9,1,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ebc13d6-01f8-11ee-b204-0242ac130002',10,1,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,2),('5ebcf039-01f8-11ee-b204-0242ac130002',1,2,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ebe0011-01f8-11ee-b204-0242ac130002',2,2,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ebeccc0-01f8-11ee-b204-0242ac130002',3,2,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ebf92b2-01f8-11ee-b204-0242ac130002',4,2,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ec02e5c-01f8-11ee-b204-0242ac130002',5,2,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ec0d664-01f8-11ee-b204-0242ac130002',6,2,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ec188e9-01f8-11ee-b204-0242ac130002',7,2,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ec24ffe-01f8-11ee-b204-0242ac130002',8,2,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ec30dd4-01f8-11ee-b204-0242ac130002',9,2,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ec3a96d-01f8-11ee-b204-0242ac130002',10,2,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,2),('5ec43f6f-01f8-11ee-b204-0242ac130002',1,3,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,4),('5ec50454-01f8-11ee-b204-0242ac130002',2,3,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,4),('5ec5eea9-01f8-11ee-b204-0242ac130002',3,3,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,4),('5ec6a628-01f8-11ee-b204-0242ac130002',4,3,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,4),('5ec77c05-01f8-11ee-b204-0242ac130002',5,3,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,4),('5ec83c9d-01f8-11ee-b204-0242ac130002',6,3,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,4),('5ec8ff8d-01f8-11ee-b204-0242ac130002',7,3,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,4),('5ec9aa4f-01f8-11ee-b204-0242ac130002',8,3,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,4),('5eca6c74-01f8-11ee-b204-0242ac130002',9,3,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,4),('5ecb1c9e-01f8-11ee-b204-0242ac130002',10,3,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,4),('5ecbb5f2-01f8-11ee-b204-0242ac130002',1,4,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ecc5e70-01f8-11ee-b204-0242ac130002',2,4,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ecd0c7c-01f8-11ee-b204-0242ac130002',3,4,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ecddad1-01f8-11ee-b204-0242ac130002',4,4,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ece9c58-01f8-11ee-b204-0242ac130002',5,4,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ecf8d05-01f8-11ee-b204-0242ac130002',6,4,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ed072d6-01f8-11ee-b204-0242ac130002',7,4,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ed15c8d-01f8-11ee-b204-0242ac130002',8,4,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ed285a5-01f8-11ee-b204-0242ac130002',9,4,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ed34365-01f8-11ee-b204-0242ac130002',10,4,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,2),('5ed3f440-01f8-11ee-b204-0242ac130002',1,5,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ed4ae5e-01f8-11ee-b204-0242ac130002',2,5,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ed562f6-01f8-11ee-b204-0242ac130002',3,5,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ed64750-01f8-11ee-b204-0242ac130002',4,5,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ed6e45d-01f8-11ee-b204-0242ac130002',5,5,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ed7db79-01f8-11ee-b204-0242ac130002',6,5,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ed8a099-01f8-11ee-b204-0242ac130002',7,5,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ed96567-01f8-11ee-b204-0242ac130002',8,5,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eda38d2-01f8-11ee-b204-0242ac130002',9,5,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5edae3d7-01f8-11ee-b204-0242ac130002',10,5,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,2),('5edb8bcd-01f8-11ee-b204-0242ac130002',1,6,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5edc3068-01f8-11ee-b204-0242ac130002',2,6,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5edd080d-01f8-11ee-b204-0242ac130002',3,6,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eddcaa3-01f8-11ee-b204-0242ac130002',4,6,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ede99d4-01f8-11ee-b204-0242ac130002',5,6,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5edf69d3-01f8-11ee-b204-0242ac130002',6,6,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ee0251e-01f8-11ee-b204-0242ac130002',7,6,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ee0e39d-01f8-11ee-b204-0242ac130002',8,6,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ee197ff-01f8-11ee-b204-0242ac130002',9,6,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ee2532d-01f8-11ee-b204-0242ac130002',10,6,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,2),('5ee3091e-01f8-11ee-b204-0242ac130002',1,7,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ee3b929-01f8-11ee-b204-0242ac130002',2,7,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ee4964c-01f8-11ee-b204-0242ac130002',3,7,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ee54368-01f8-11ee-b204-0242ac130002',4,7,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ee5f395-01f8-11ee-b204-0242ac130002',5,7,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ee6a22f-01f8-11ee-b204-0242ac130002',6,7,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ee74863-01f8-11ee-b204-0242ac130002',7,7,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ee80907-01f8-11ee-b204-0242ac130002',8,7,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ee8c4a6-01f8-11ee-b204-0242ac130002',9,7,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ee989dd-01f8-11ee-b204-0242ac130002',10,7,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,2),('5eea4cbd-01f8-11ee-b204-0242ac130002',1,8,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eeb124a-01f8-11ee-b204-0242ac130002',2,8,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eebe004-01f8-11ee-b204-0242ac130002',3,8,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eed41a9-01f8-11ee-b204-0242ac130002',4,8,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eee3f74-01f8-11ee-b204-0242ac130002',5,8,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eef27d3-01f8-11ee-b204-0242ac130002',6,8,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ef00868-01f8-11ee-b204-0242ac130002',7,8,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ef1325b-01f8-11ee-b204-0242ac130002',8,8,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ef211ba-01f8-11ee-b204-0242ac130002',9,8,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ef2ff14-01f8-11ee-b204-0242ac130002',10,8,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,2),('5ef3d6a0-01f8-11ee-b204-0242ac130002',1,9,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ef49ced-01f8-11ee-b204-0242ac130002',2,9,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ef575e7-01f8-11ee-b204-0242ac130002',3,9,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ef654be-01f8-11ee-b204-0242ac130002',4,9,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ef71e09-01f8-11ee-b204-0242ac130002',5,9,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ef7e6fb-01f8-11ee-b204-0242ac130002',6,9,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ef8d142-01f8-11ee-b204-0242ac130002',7,9,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5ef9ab59-01f8-11ee-b204-0242ac130002',8,9,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5efaa1de-01f8-11ee-b204-0242ac130002',9,9,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5efb7f66-01f8-11ee-b204-0242ac130002',10,9,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,2),('5efc4d2d-01f8-11ee-b204-0242ac130002',1,10,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5efd855e-01f8-11ee-b204-0242ac130002',2,10,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5efe8c32-01f8-11ee-b204-0242ac130002',3,10,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5eff7614-01f8-11ee-b204-0242ac130002',4,10,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5f028bbf-01f8-11ee-b204-0242ac130002',5,10,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5f03686d-01f8-11ee-b204-0242ac130002',6,10,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5f044831-01f8-11ee-b204-0242ac130002',7,10,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5f057779-01f8-11ee-b204-0242ac130002',8,10,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5f065f89-01f8-11ee-b204-0242ac130002',9,10,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,1),('5f081e61-01f8-11ee-b204-0242ac130002',10,10,'5eb33c7d-01f8-11ee-b204-0242ac130002',NULL,2),('7fc97dd0-e6ff-11ed-8b5d-907841e9040c',1,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fc9a39c-e6ff-11ed-8b5d-907841e9040c',2,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fc9fb4f-e6ff-11ed-8b5d-907841e9040c',3,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fca7985-e6ff-11ed-8b5d-907841e9040c',4,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcaa28c-e6ff-11ed-8b5d-907841e9040c',5,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcacee4-e6ff-11ed-8b5d-907841e9040c',6,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcaf0e6-e6ff-11ed-8b5d-907841e9040c',7,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcb1c44-e6ff-11ed-8b5d-907841e9040c',8,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcb48e6-e6ff-11ed-8b5d-907841e9040c',9,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcb6969-e6ff-11ed-8b5d-907841e9040c',10,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcb88cf-e6ff-11ed-8b5d-907841e9040c',1,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcba469-e6ff-11ed-8b5d-907841e9040c',2,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcbb9fc-e6ff-11ed-8b5d-907841e9040c',3,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcbd8be-e6ff-11ed-8b5d-907841e9040c',4,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcbeed7-e6ff-11ed-8b5d-907841e9040c',5,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcc0b6e-e6ff-11ed-8b5d-907841e9040c',6,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcc308b-e6ff-11ed-8b5d-907841e9040c',7,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcc4896-e6ff-11ed-8b5d-907841e9040c',8,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcc5eae-e6ff-11ed-8b5d-907841e9040c',9,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcc7553-e6ff-11ed-8b5d-907841e9040c',10,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fccc56c-e6ff-11ed-8b5d-907841e9040c',1,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fccdafb-e6ff-11ed-8b5d-907841e9040c',2,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fccee38-e6ff-11ed-8b5d-907841e9040c',3,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcd0549-e6ff-11ed-8b5d-907841e9040c',4,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcd1f14-e6ff-11ed-8b5d-907841e9040c',5,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcd3408-e6ff-11ed-8b5d-907841e9040c',6,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcd4f6f-e6ff-11ed-8b5d-907841e9040c',7,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcd66c8-e6ff-11ed-8b5d-907841e9040c',8,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcd8a92-e6ff-11ed-8b5d-907841e9040c',9,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcdabf9-e6ff-11ed-8b5d-907841e9040c',10,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcdc493-e6ff-11ed-8b5d-907841e9040c',1,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcdeb57-e6ff-11ed-8b5d-907841e9040c',2,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fce18ce-e6ff-11ed-8b5d-907841e9040c',3,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fce3c78-e6ff-11ed-8b5d-907841e9040c',4,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fce5f7a-e6ff-11ed-8b5d-907841e9040c',5,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fce7fba-e6ff-11ed-8b5d-907841e9040c',6,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcea0a1-e6ff-11ed-8b5d-907841e9040c',7,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcecb6b-e6ff-11ed-8b5d-907841e9040c',8,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fceeff4-e6ff-11ed-8b5d-907841e9040c',9,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcf1575-e6ff-11ed-8b5d-907841e9040c',10,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcf3970-e6ff-11ed-8b5d-907841e9040c',1,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcf59b2-e6ff-11ed-8b5d-907841e9040c',2,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcf75e1-e6ff-11ed-8b5d-907841e9040c',3,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcf9540-e6ff-11ed-8b5d-907841e9040c',4,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcfb829-e6ff-11ed-8b5d-907841e9040c',5,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcfd8d1-e6ff-11ed-8b5d-907841e9040c',6,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcff791-e6ff-11ed-8b5d-907841e9040c',7,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd01b57-e6ff-11ed-8b5d-907841e9040c',8,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd03ebf-e6ff-11ed-8b5d-907841e9040c',9,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd060c6-e6ff-11ed-8b5d-907841e9040c',10,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd08324-e6ff-11ed-8b5d-907841e9040c',1,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd0aaf0-e6ff-11ed-8b5d-907841e9040c',2,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd0d42c-e6ff-11ed-8b5d-907841e9040c',3,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd0f677-e6ff-11ed-8b5d-907841e9040c',4,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd11b00-e6ff-11ed-8b5d-907841e9040c',5,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd13e1b-e6ff-11ed-8b5d-907841e9040c',6,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd160dd-e6ff-11ed-8b5d-907841e9040c',7,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd181bc-e6ff-11ed-8b5d-907841e9040c',8,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd1a26a-e6ff-11ed-8b5d-907841e9040c',9,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd1c6bc-e6ff-11ed-8b5d-907841e9040c',10,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd1ea0b-e6ff-11ed-8b5d-907841e9040c',1,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd20bf7-e6ff-11ed-8b5d-907841e9040c',2,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd22d90-e6ff-11ed-8b5d-907841e9040c',3,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd2477a-e6ff-11ed-8b5d-907841e9040c',4,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd28825-e6ff-11ed-8b5d-907841e9040c',5,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd2ad0f-e6ff-11ed-8b5d-907841e9040c',6,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd2d01d-e6ff-11ed-8b5d-907841e9040c',7,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd2f42a-e6ff-11ed-8b5d-907841e9040c',8,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd31609-e6ff-11ed-8b5d-907841e9040c',9,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd338c2-e6ff-11ed-8b5d-907841e9040c',10,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd35685-e6ff-11ed-8b5d-907841e9040c',1,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd37690-e6ff-11ed-8b5d-907841e9040c',2,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd3956b-e6ff-11ed-8b5d-907841e9040c',3,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd3adc2-e6ff-11ed-8b5d-907841e9040c',4,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd3c7ca-e6ff-11ed-8b5d-907841e9040c',5,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd3e04e-e6ff-11ed-8b5d-907841e9040c',6,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd3f66d-e6ff-11ed-8b5d-907841e9040c',7,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd43b8a-e6ff-11ed-8b5d-907841e9040c',8,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd46d57-e6ff-11ed-8b5d-907841e9040c',9,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd48556-e6ff-11ed-8b5d-907841e9040c',10,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd4a05f-e6ff-11ed-8b5d-907841e9040c',1,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd4d80a-e6ff-11ed-8b5d-907841e9040c',2,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd4f097-e6ff-11ed-8b5d-907841e9040c',3,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd50eab-e6ff-11ed-8b5d-907841e9040c',4,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd532fd-e6ff-11ed-8b5d-907841e9040c',5,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd552b0-e6ff-11ed-8b5d-907841e9040c',6,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd56731-e6ff-11ed-8b5d-907841e9040c',7,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd57e89-e6ff-11ed-8b5d-907841e9040c',8,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd593bb-e6ff-11ed-8b5d-907841e9040c',9,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd5a873-e6ff-11ed-8b5d-907841e9040c',10,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd5be9f-e6ff-11ed-8b5d-907841e9040c',1,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd5d856-e6ff-11ed-8b5d-907841e9040c',2,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd60311-e6ff-11ed-8b5d-907841e9040c',3,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd61a7e-e6ff-11ed-8b5d-907841e9040c',4,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd630f6-e6ff-11ed-8b5d-907841e9040c',5,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd64d79-e6ff-11ed-8b5d-907841e9040c',6,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd66157-e6ff-11ed-8b5d-907841e9040c',7,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd67caa-e6ff-11ed-8b5d-907841e9040c',8,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd69244-e6ff-11ed-8b5d-907841e9040c',9,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd6bfa8-e6ff-11ed-8b5d-907841e9040c',10,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('88d0c1e9-01e3-11ee-b204-0242ac130002',1,1,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88d1b399-01e3-11ee-b204-0242ac130002',2,1,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88d2fd4a-01e3-11ee-b204-0242ac130002',3,1,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88d3b6e3-01e3-11ee-b204-0242ac130002',4,1,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88d46c8e-01e3-11ee-b204-0242ac130002',5,1,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88d51747-01e3-11ee-b204-0242ac130002',6,1,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88d5c0a4-01e3-11ee-b204-0242ac130002',7,1,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88d68363-01e3-11ee-b204-0242ac130002',8,1,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88d759d1-01e3-11ee-b204-0242ac130002',9,1,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88d832f2-01e3-11ee-b204-0242ac130002',10,1,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88d92161-01e3-11ee-b204-0242ac130002',11,1,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88da1bfa-01e3-11ee-b204-0242ac130002',1,2,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88db0826-01e3-11ee-b204-0242ac130002',2,2,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88dbdc8e-01e3-11ee-b204-0242ac130002',3,2,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88dcbc7f-01e3-11ee-b204-0242ac130002',4,2,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88dd9533-01e3-11ee-b204-0242ac130002',5,2,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88de48bc-01e3-11ee-b204-0242ac130002',6,2,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88df51c6-01e3-11ee-b204-0242ac130002',7,2,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88e01f49-01e3-11ee-b204-0242ac130002',8,2,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88e0eda9-01e3-11ee-b204-0242ac130002',9,2,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88e1b322-01e3-11ee-b204-0242ac130002',10,2,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88e274e7-01e3-11ee-b204-0242ac130002',11,2,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88e3448b-01e3-11ee-b204-0242ac130002',1,3,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88e426fd-01e3-11ee-b204-0242ac130002',2,3,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88e4f9f1-01e3-11ee-b204-0242ac130002',3,3,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88e5cbb3-01e3-11ee-b204-0242ac130002',4,3,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88e695d7-01e3-11ee-b204-0242ac130002',5,3,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88e78fb5-01e3-11ee-b204-0242ac130002',6,3,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88e86223-01e3-11ee-b204-0242ac130002',7,3,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88e94f42-01e3-11ee-b204-0242ac130002',8,3,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88ea11e0-01e3-11ee-b204-0242ac130002',9,3,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88eacceb-01e3-11ee-b204-0242ac130002',10,3,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88eb983e-01e3-11ee-b204-0242ac130002',11,3,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88ec6042-01e3-11ee-b204-0242ac130002',1,4,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88ed2a91-01e3-11ee-b204-0242ac130002',2,4,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88ee2650-01e3-11ee-b204-0242ac130002',3,4,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88eeeac4-01e3-11ee-b204-0242ac130002',4,4,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88efab24-01e3-11ee-b204-0242ac130002',5,4,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88f06635-01e3-11ee-b204-0242ac130002',6,4,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88f12954-01e3-11ee-b204-0242ac130002',7,4,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88f21c27-01e3-11ee-b204-0242ac130002',8,4,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88f394bf-01e3-11ee-b204-0242ac130002',9,4,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88f4e1fc-01e3-11ee-b204-0242ac130002',10,4,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88f5b7e8-01e3-11ee-b204-0242ac130002',11,4,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88f6b1a2-01e3-11ee-b204-0242ac130002',1,5,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88f7a1c2-01e3-11ee-b204-0242ac130002',2,5,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88f885b9-01e3-11ee-b204-0242ac130002',3,5,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88f9a987-01e3-11ee-b204-0242ac130002',4,5,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88fa8904-01e3-11ee-b204-0242ac130002',5,5,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88fb866a-01e3-11ee-b204-0242ac130002',6,5,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88fc511f-01e3-11ee-b204-0242ac130002',7,5,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88fd20ef-01e3-11ee-b204-0242ac130002',8,5,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88fdd9f8-01e3-11ee-b204-0242ac130002',9,5,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88febbf5-01e3-11ee-b204-0242ac130002',10,5,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('88ffb150-01e3-11ee-b204-0242ac130002',11,5,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('890078d0-01e3-11ee-b204-0242ac130002',1,6,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('890127fd-01e3-11ee-b204-0242ac130002',2,6,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8901ee8e-01e3-11ee-b204-0242ac130002',3,6,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8902e5c2-01e3-11ee-b204-0242ac130002',4,6,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('890401b2-01e3-11ee-b204-0242ac130002',5,6,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89051c1c-01e3-11ee-b204-0242ac130002',6,6,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8905e564-01e3-11ee-b204-0242ac130002',7,6,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8906bc37-01e3-11ee-b204-0242ac130002',8,6,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89078dd4-01e3-11ee-b204-0242ac130002',9,6,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89087208-01e3-11ee-b204-0242ac130002',10,6,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89096e78-01e3-11ee-b204-0242ac130002',11,6,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('890a3f15-01e3-11ee-b204-0242ac130002',1,7,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('890b2149-01e3-11ee-b204-0242ac130002',2,7,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('890c17d2-01e3-11ee-b204-0242ac130002',3,7,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('890d0fbc-01e3-11ee-b204-0242ac130002',4,7,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('890e0fd3-01e3-11ee-b204-0242ac130002',5,7,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('890eff44-01e3-11ee-b204-0242ac130002',6,7,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('891007e3-01e3-11ee-b204-0242ac130002',7,7,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('891116e9-01e3-11ee-b204-0242ac130002',8,7,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89121004-01e3-11ee-b204-0242ac130002',9,7,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('891346c3-01e3-11ee-b204-0242ac130002',10,7,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('891468b6-01e3-11ee-b204-0242ac130002',11,7,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8915428a-01e3-11ee-b204-0242ac130002',1,8,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89161c9a-01e3-11ee-b204-0242ac130002',2,8,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8917091f-01e3-11ee-b204-0242ac130002',3,8,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8917d120-01e3-11ee-b204-0242ac130002',4,8,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8918a054-01e3-11ee-b204-0242ac130002',5,8,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89195a27-01e3-11ee-b204-0242ac130002',6,8,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('891a0621-01e3-11ee-b204-0242ac130002',7,8,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('891ad45b-01e3-11ee-b204-0242ac130002',8,8,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('891b7cf6-01e3-11ee-b204-0242ac130002',9,8,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('891c3717-01e3-11ee-b204-0242ac130002',10,8,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('891d4e47-01e3-11ee-b204-0242ac130002',11,8,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('891e0b1f-01e3-11ee-b204-0242ac130002',1,9,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('891ec9a1-01e3-11ee-b204-0242ac130002',2,9,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('891f6e06-01e3-11ee-b204-0242ac130002',3,9,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89203675-01e3-11ee-b204-0242ac130002',4,9,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8920feda-01e3-11ee-b204-0242ac130002',5,9,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8921d8a4-01e3-11ee-b204-0242ac130002',6,9,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8922be55-01e3-11ee-b204-0242ac130002',7,9,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8923b07f-01e3-11ee-b204-0242ac130002',8,9,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89246e0c-01e3-11ee-b204-0242ac130002',9,9,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8925ff26-01e3-11ee-b204-0242ac130002',10,9,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89271220-01e3-11ee-b204-0242ac130002',11,9,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8927e474-01e3-11ee-b204-0242ac130002',1,10,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8928d652-01e3-11ee-b204-0242ac130002',2,10,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8929c729-01e3-11ee-b204-0242ac130002',3,10,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('892aa807-01e3-11ee-b204-0242ac130002',4,10,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('892b7c8a-01e3-11ee-b204-0242ac130002',5,10,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('892c5265-01e3-11ee-b204-0242ac130002',6,10,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('892da69b-01e3-11ee-b204-0242ac130002',7,10,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('892e8509-01e3-11ee-b204-0242ac130002',8,10,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('892f69ee-01e3-11ee-b204-0242ac130002',9,10,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89305b4c-01e3-11ee-b204-0242ac130002',10,10,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89314289-01e3-11ee-b204-0242ac130002',11,10,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89320316-01e3-11ee-b204-0242ac130002',1,11,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8932eb45-01e3-11ee-b204-0242ac130002',2,11,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8933dcf6-01e3-11ee-b204-0242ac130002',3,11,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89349d4b-01e3-11ee-b204-0242ac130002',4,11,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89356a8d-01e3-11ee-b204-0242ac130002',5,11,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('89364975-01e3-11ee-b204-0242ac130002',6,11,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('893811d4-01e3-11ee-b204-0242ac130002',7,11,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8938f85b-01e3-11ee-b204-0242ac130002',8,11,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('8939f3cc-01e3-11ee-b204-0242ac130002',9,11,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('893aee54-01e3-11ee-b204-0242ac130002',10,11,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('893bed6f-01e3-11ee-b204-0242ac130002',11,11,'88cfb5b3-01e3-11ee-b204-0242ac130002',NULL,1),('9eb64819-0048-11ee-9013-88aedd095151',1,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eb6c6ce-0048-11ee-9013-88aedd095151',2,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eb7af3d-0048-11ee-9013-88aedd095151',3,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eb84fc8-0048-11ee-9013-88aedd095151',4,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eb8ccb8-0048-11ee-9013-88aedd095151',5,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eb94ca1-0048-11ee-9013-88aedd095151',6,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eb9b6c7-0048-11ee-9013-88aedd095151',7,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eba2998-0048-11ee-9013-88aedd095151',8,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebab50f-0048-11ee-9013-88aedd095151',9,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebb44dc-0048-11ee-9013-88aedd095151',10,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebb9105-0048-11ee-9013-88aedd095151',1,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebbf6af-0048-11ee-9013-88aedd095151',2,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebc6406-0048-11ee-9013-88aedd095151',3,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebcb6fa-0048-11ee-9013-88aedd095151',4,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebd4324-0048-11ee-9013-88aedd095151',5,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebdc8ee-0048-11ee-9013-88aedd095151',6,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebe1772-0048-11ee-9013-88aedd095151',7,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebe80c4-0048-11ee-9013-88aedd095151',8,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebee589-0048-11ee-9013-88aedd095151',9,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebf7513-0048-11ee-9013-88aedd095151',10,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebffad8-0048-11ee-9013-88aedd095151',1,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec06afd-0048-11ee-9013-88aedd095151',2,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec0cd69-0048-11ee-9013-88aedd095151',3,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec11a84-0048-11ee-9013-88aedd095151',4,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec18985-0048-11ee-9013-88aedd095151',5,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec1fd95-0048-11ee-9013-88aedd095151',6,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec26719-0048-11ee-9013-88aedd095151',7,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec2dbf7-0048-11ee-9013-88aedd095151',8,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec36271-0048-11ee-9013-88aedd095151',9,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec3d530-0048-11ee-9013-88aedd095151',10,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec42902-0048-11ee-9013-88aedd095151',1,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec4a7d8-0048-11ee-9013-88aedd095151',2,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec52253-0048-11ee-9013-88aedd095151',3,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec58e4e-0048-11ee-9013-88aedd095151',4,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec5d566-0048-11ee-9013-88aedd095151',5,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec63698-0048-11ee-9013-88aedd095151',6,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec68e31-0048-11ee-9013-88aedd095151',7,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec701d6-0048-11ee-9013-88aedd095151',8,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec78ba5-0048-11ee-9013-88aedd095151',9,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec8200c-0048-11ee-9013-88aedd095151',10,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec87083-0048-11ee-9013-88aedd095151',1,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec8d83d-0048-11ee-9013-88aedd095151',2,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec951b8-0048-11ee-9013-88aedd095151',3,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec9e970-0048-11ee-9013-88aedd095151',4,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eca63e9-0048-11ee-9013-88aedd095151',5,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecaca9a-0048-11ee-9013-88aedd095151',6,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecb36b6-0048-11ee-9013-88aedd095151',7,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecb9da3-0048-11ee-9013-88aedd095151',8,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecbeeb9-0048-11ee-9013-88aedd095151',9,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecc682f-0048-11ee-9013-88aedd095151',10,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecd02cd-0048-11ee-9013-88aedd095151',1,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecd55b0-0048-11ee-9013-88aedd095151',2,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecdba4b-0048-11ee-9013-88aedd095151',3,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ece26d5-0048-11ee-9013-88aedd095151',4,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ece7fdd-0048-11ee-9013-88aedd095151',5,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecf0991-0048-11ee-9013-88aedd095151',6,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecf8baf-0048-11ee-9013-88aedd095151',7,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecff8fa-0048-11ee-9013-88aedd095151',8,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed044ea-0048-11ee-9013-88aedd095151',9,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed0e805-0048-11ee-9013-88aedd095151',10,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed16707-0048-11ee-9013-88aedd095151',1,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed1ece0-0048-11ee-9013-88aedd095151',2,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed25a13-0048-11ee-9013-88aedd095151',3,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed2abc6-0048-11ee-9013-88aedd095151',4,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed317a2-0048-11ee-9013-88aedd095151',5,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed37112-0048-11ee-9013-88aedd095151',6,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed3ee73-0048-11ee-9013-88aedd095151',7,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed47f30-0048-11ee-9013-88aedd095151',8,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed4eb1a-0048-11ee-9013-88aedd095151',9,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed53949-0048-11ee-9013-88aedd095151',10,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed5a1bf-0048-11ee-9013-88aedd095151',1,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed610d9-0048-11ee-9013-88aedd095151',2,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed664c5-0048-11ee-9013-88aedd095151',3,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed6f29b-0048-11ee-9013-88aedd095151',4,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed78e7a-0048-11ee-9013-88aedd095151',5,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed7f9e1-0048-11ee-9013-88aedd095151',6,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed845df-0048-11ee-9013-88aedd095151',7,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed949e8-0048-11ee-9013-88aedd095151',8,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed9c389-0048-11ee-9013-88aedd095151',9,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eda119f-0048-11ee-9013-88aedd095151',10,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eda77a3-0048-11ee-9013-88aedd095151',1,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edae63a-0048-11ee-9013-88aedd095151',2,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edb2f45-0048-11ee-9013-88aedd095151',3,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edbabbc-0048-11ee-9013-88aedd095151',4,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edc2dc0-0048-11ee-9013-88aedd095151',5,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edc82a6-0048-11ee-9013-88aedd095151',6,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edcea7a-0048-11ee-9013-88aedd095151',7,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edd61a8-0048-11ee-9013-88aedd095151',8,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eddb4df-0048-11ee-9013-88aedd095151',9,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ede6a8d-0048-11ee-9013-88aedd095151',10,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eded53f-0048-11ee-9013-88aedd095151',1,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edf7d09-0048-11ee-9013-88aedd095151',2,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edfe890-0048-11ee-9013-88aedd095151',3,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee041e4-0048-11ee-9013-88aedd095151',4,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee0b9eb-0048-11ee-9013-88aedd095151',5,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee1370c-0048-11ee-9013-88aedd095151',6,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee1a2b0-0048-11ee-9013-88aedd095151',7,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee1e9f0-0048-11ee-9013-88aedd095151',8,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee24f3f-0048-11ee-9013-88aedd095151',9,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee2987b-0048-11ee-9013-88aedd095151',10,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('c82235b7-df44-11ed-bf13-88aedd095151',1,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82349f2-df44-11ed-bf13-88aedd095151',2,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c823ee79-df44-11ed-bf13-88aedd095151',3,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82546b4-df44-11ed-bf13-88aedd095151',4,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c825d851-df44-11ed-bf13-88aedd095151',5,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8263b71-df44-11ed-bf13-88aedd095151',6,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8269ef3-df44-11ed-bf13-88aedd095151',7,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c826ea24-df44-11ed-bf13-88aedd095151',8,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82753d2-df44-11ed-bf13-88aedd095151',9,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8297558-df44-11ed-bf13-88aedd095151',10,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c829e318-df44-11ed-bf13-88aedd095151',1,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82a5fbd-df44-11ed-bf13-88aedd095151',2,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82ac3bf-df44-11ed-bf13-88aedd095151',3,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82b12f5-df44-11ed-bf13-88aedd095151',4,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82b8133-df44-11ed-bf13-88aedd095151',5,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82bdd59-df44-11ed-bf13-88aedd095151',6,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82c531f-df44-11ed-bf13-88aedd095151',7,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82cb7b8-df44-11ed-bf13-88aedd095151',8,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82d24bf-df44-11ed-bf13-88aedd095151',9,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82dc61a-df44-11ed-bf13-88aedd095151',10,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c82e3e86-df44-11ed-bf13-88aedd095151',1,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82ea876-df44-11ed-bf13-88aedd095151',2,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82f0966-df44-11ed-bf13-88aedd095151',3,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82f541f-df44-11ed-bf13-88aedd095151',4,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82fbbbd-df44-11ed-bf13-88aedd095151',5,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82ff792-df44-11ed-bf13-88aedd095151',6,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8304df2-df44-11ed-bf13-88aedd095151',7,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c830a6e9-df44-11ed-bf13-88aedd095151',8,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8312058-df44-11ed-bf13-88aedd095151',9,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8318925-df44-11ed-bf13-88aedd095151',10,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c831de11-df44-11ed-bf13-88aedd095151',1,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8323bb2-df44-11ed-bf13-88aedd095151',2,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83281eb-df44-11ed-bf13-88aedd095151',3,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c832ef64-df44-11ed-bf13-88aedd095151',4,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83360de-df44-11ed-bf13-88aedd095151',5,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c833cee1-df44-11ed-bf13-88aedd095151',6,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8344419-df44-11ed-bf13-88aedd095151',7,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c834bc6d-df44-11ed-bf13-88aedd095151',8,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8352580-df44-11ed-bf13-88aedd095151',9,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8356f55-df44-11ed-bf13-88aedd095151',10,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c835d548-df44-11ed-bf13-88aedd095151',1,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8363653-df44-11ed-bf13-88aedd095151',2,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c836c509-df44-11ed-bf13-88aedd095151',3,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83745e5-df44-11ed-bf13-88aedd095151',4,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c837b4ea-df44-11ed-bf13-88aedd095151',5,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c837fb3d-df44-11ed-bf13-88aedd095151',6,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8386c20-df44-11ed-bf13-88aedd095151',7,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c838dc77-df44-11ed-bf13-88aedd095151',8,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83934c9-df44-11ed-bf13-88aedd095151',9,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c839aee5-df44-11ed-bf13-88aedd095151',10,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c83ae595-df44-11ed-bf13-88aedd095151',1,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83b719f-df44-11ed-bf13-88aedd095151',2,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83be54a-df44-11ed-bf13-88aedd095151',3,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83c3cd9-df44-11ed-bf13-88aedd095151',4,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83c9d81-df44-11ed-bf13-88aedd095151',5,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83cddaf-df44-11ed-bf13-88aedd095151',6,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83d3cf0-df44-11ed-bf13-88aedd095151',7,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83db29c-df44-11ed-bf13-88aedd095151',8,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83e0810-df44-11ed-bf13-88aedd095151',9,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83e8979-df44-11ed-bf13-88aedd095151',10,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c83f06b3-df44-11ed-bf13-88aedd095151',1,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83f45da-df44-11ed-bf13-88aedd095151',2,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83fa773-df44-11ed-bf13-88aedd095151',3,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83ff7bc-df44-11ed-bf13-88aedd095151',4,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c840a20b-df44-11ed-bf13-88aedd095151',5,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8415a61-df44-11ed-bf13-88aedd095151',6,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c841c211-df44-11ed-bf13-88aedd095151',7,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c842212e-df44-11ed-bf13-88aedd095151',8,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8428e67-df44-11ed-bf13-88aedd095151',9,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c842e26a-df44-11ed-bf13-88aedd095151',10,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c8435ccc-df44-11ed-bf13-88aedd095151',1,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c843d6b0-df44-11ed-bf13-88aedd095151',2,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8442356-df44-11ed-bf13-88aedd095151',3,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8448e95-df44-11ed-bf13-88aedd095151',4,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c844d440-df44-11ed-bf13-88aedd095151',5,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8454504-df44-11ed-bf13-88aedd095151',6,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c845b271-df44-11ed-bf13-88aedd095151',7,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84611d4-df44-11ed-bf13-88aedd095151',8,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8468d4d-df44-11ed-bf13-88aedd095151',9,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c846fc34-df44-11ed-bf13-88aedd095151',10,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c8474cb0-df44-11ed-bf13-88aedd095151',1,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c847f0d0-df44-11ed-bf13-88aedd095151',2,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8485afe-df44-11ed-bf13-88aedd095151',3,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c848c8ab-df44-11ed-bf13-88aedd095151',4,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84919b5-df44-11ed-bf13-88aedd095151',5,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8498382-df44-11ed-bf13-88aedd095151',6,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c849e7bb-df44-11ed-bf13-88aedd095151',7,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84a3804-df44-11ed-bf13-88aedd095151',8,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84aa18b-df44-11ed-bf13-88aedd095151',9,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84af718-df44-11ed-bf13-88aedd095151',10,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c84b7656-df44-11ed-bf13-88aedd095151',1,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84be33d-df44-11ed-bf13-88aedd095151',2,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84c2fc2-df44-11ed-bf13-88aedd095151',3,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84c98aa-df44-11ed-bf13-88aedd095151',4,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84d0a82-df44-11ed-bf13-88aedd095151',5,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84d58d0-df44-11ed-bf13-88aedd095151',6,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84e1115-df44-11ed-bf13-88aedd095151',7,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84e8854-df44-11ed-bf13-88aedd095151',8,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84ef1e2-df44-11ed-bf13-88aedd095151',9,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84f3d6b-df44-11ed-bf13-88aedd095151',10,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2);
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
INSERT INTO `statusroomcinema` VALUES ('101542fe-d808-11ed-9a6b-88aedd095151',1,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',1,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',1,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',1,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',1,5,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,5,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,5,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,5,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,3,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,3,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,3,0,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,3,0,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,3,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,1,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,1,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,1,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,1,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,1,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,1,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,2,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,3,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,4,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,4,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,4,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,4,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,4,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,4,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,6,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,5,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,5,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,5,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,5,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,4,0,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,5,0,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,6,1,NULL),('25cba963-df1a-11ed-bf13-88aedd095151',1,1,1,NULL),('a626e44a-df1a-11ed-bf13-88aedd095151',1,1,1,NULL),('952a45bf-df1c-11ed-bf13-88aedd095151',1,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',1,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',1,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',1,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',1,5,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,5,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,5,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,5,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,5,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',2,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',3,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',4,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',5,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',2,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',3,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',4,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',5,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,3,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',2,3,0,2),('6c6980ff-df36-11ed-bf13-88aedd095151',3,3,0,2),('6c6980ff-df36-11ed-bf13-88aedd095151',4,3,0,2),('6c6980ff-df36-11ed-bf13-88aedd095151',5,3,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,4,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',2,4,0,3),('6c6980ff-df36-11ed-bf13-88aedd095151',3,4,0,3),('6c6980ff-df36-11ed-bf13-88aedd095151',4,4,0,3),('6c6980ff-df36-11ed-bf13-88aedd095151',5,4,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,5,1,4),('6c6980ff-df36-11ed-bf13-88aedd095151',2,5,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',3,5,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',4,5,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',5,5,1,4),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,2,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,2,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,2,0,3),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,2,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,2,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,3,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,3,1,2),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,3,1,2),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,3,1,2),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,3,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,4,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,4,0,3),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,4,0,3),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,4,0,3),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,4,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,5,1,4),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,5,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,5,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,5,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,5,1,4),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,10,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,2,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,2,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,2,1,3),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,2,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,2,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,3,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,3,1,2),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,3,1,2),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,3,1,2),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,3,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,4,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,4,1,3),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,4,1,3),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,4,1,3),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,4,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,5,1,4),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,5,1,4),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,5,1,4),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,5,1,4),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,5,1,4),('68861520-e28c-11ed-a14e-88aedd095151',1,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,10,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',2,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',3,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',4,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',5,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',6,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',7,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',8,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',9,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',10,10,0,2),('3e939490-e336-11ed-857f-88aedd095151',1,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',2,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',3,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',4,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',5,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',1,2,1,1),('3e939490-e336-11ed-857f-88aedd095151',2,2,1,1),('3e939490-e336-11ed-857f-88aedd095151',3,2,1,3),('3e939490-e336-11ed-857f-88aedd095151',4,2,1,1),('3e939490-e336-11ed-857f-88aedd095151',5,2,1,1),('3e939490-e336-11ed-857f-88aedd095151',1,3,1,1),('3e939490-e336-11ed-857f-88aedd095151',2,3,1,2),('3e939490-e336-11ed-857f-88aedd095151',3,3,0,2),('3e939490-e336-11ed-857f-88aedd095151',4,3,1,2),('3e939490-e336-11ed-857f-88aedd095151',5,3,1,1),('3e939490-e336-11ed-857f-88aedd095151',1,4,1,1),('3e939490-e336-11ed-857f-88aedd095151',2,4,1,3),('3e939490-e336-11ed-857f-88aedd095151',3,4,1,3),('3e939490-e336-11ed-857f-88aedd095151',4,4,1,3),('3e939490-e336-11ed-857f-88aedd095151',5,4,1,1),('3e939490-e336-11ed-857f-88aedd095151',1,5,1,4),('3e939490-e336-11ed-857f-88aedd095151',2,5,1,4),('3e939490-e336-11ed-857f-88aedd095151',3,5,1,4),('3e939490-e336-11ed-857f-88aedd095151',4,5,1,4),('3e939490-e336-11ed-857f-88aedd095151',5,5,1,4),('4bdb694a-e336-11ed-857f-88aedd095151',1,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',2,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',3,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',4,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',5,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',6,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',7,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',8,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',9,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',10,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',1,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,4,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,4,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,4,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,4,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,5,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,5,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,5,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,6,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,6,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,6,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,9,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,9,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,9,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,9,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',2,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',3,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',4,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',5,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',6,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',7,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',8,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',9,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',10,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,5,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,5,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,5,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,6,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,10,1,2),('7388b793-e6ff-11ed-8b5d-907841e9040c',1,1,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',2,1,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',3,1,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',4,1,0,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',5,1,0,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',1,2,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',2,2,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',3,2,1,3),('7388b793-e6ff-11ed-8b5d-907841e9040c',4,2,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',5,2,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',1,3,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',2,3,1,2),('7388b793-e6ff-11ed-8b5d-907841e9040c',3,3,1,2),('7388b793-e6ff-11ed-8b5d-907841e9040c',4,3,1,2),('7388b793-e6ff-11ed-8b5d-907841e9040c',5,3,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',1,4,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',2,4,1,3),('7388b793-e6ff-11ed-8b5d-907841e9040c',3,4,1,3),('7388b793-e6ff-11ed-8b5d-907841e9040c',4,4,1,3),('7388b793-e6ff-11ed-8b5d-907841e9040c',5,4,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',1,5,1,4),('7388b793-e6ff-11ed-8b5d-907841e9040c',2,5,1,4),('7388b793-e6ff-11ed-8b5d-907841e9040c',3,5,1,4),('7388b793-e6ff-11ed-8b5d-907841e9040c',4,5,1,4),('7388b793-e6ff-11ed-8b5d-907841e9040c',5,5,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',1,1,0,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,1,0,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,1,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,1,0,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,1,0,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,1,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,1,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,1,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,1,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,1,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,2,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,3,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,4,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,5,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,6,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,7,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,8,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,9,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',2,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',3,10,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',5,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',6,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',7,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',8,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',9,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',10,10,1,2),('6c03dda2-e98a-11ed-906e-907841e9040c',1,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,4,0,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,4,0,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,4,0,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,5,0,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,5,0,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,5,0,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,10,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,1,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,1,0,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,1,0,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,2,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,2,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,2,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,2,0,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,2,0,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,2,0,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,2,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,2,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,2,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,2,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,3,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,4,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,5,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,6,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,7,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,8,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,9,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',2,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',3,10,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',5,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',6,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',7,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',8,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',9,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',10,10,1,2),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,4,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,4,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,4,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,4,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,4,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,4,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,4,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,4,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,4,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,4,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,10,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,10,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,10,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,1,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,2,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,3,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,4,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,5,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,6,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,7,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,8,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,9,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,10,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,10,1,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,1,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,2,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,3,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,4,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,5,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,6,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,7,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,8,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,9,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,10,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,10,0,2),('456e9730-ed6b-11ed-8709-88aedd095151',1,1,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',2,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,1,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',1,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,2,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',3,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,2,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',10,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,3,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,3,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,3,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',4,3,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,3,0,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,3,0,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,3,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,3,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',9,3,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,3,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,4,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,4,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,4,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,4,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',5,4,0,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,4,0,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,4,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',8,4,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,4,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,4,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,5,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',6,5,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',7,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,6,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',6,6,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',7,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,7,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',5,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,7,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',8,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,8,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',4,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,8,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',9,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,9,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',3,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,9,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',10,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,10,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',2,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,10,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',1,1,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',2,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,1,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',1,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,2,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',3,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,2,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',10,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,3,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',4,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,3,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',9,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,4,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,4,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,4,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,4,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',5,4,0,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,4,0,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,4,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',8,4,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,4,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,4,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,5,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,5,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,5,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,5,0,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,5,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',6,5,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',7,5,0,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,5,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,5,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,5,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,6,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,6,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,6,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,6,0,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,6,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',6,6,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',7,6,0,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,6,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,6,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,6,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,7,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',5,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,7,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',8,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,8,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',4,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,8,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',9,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,9,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',3,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,9,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',10,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,10,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',2,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,10,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',1,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,1,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,2,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,3,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,4,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,4,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,4,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,4,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,4,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',6,4,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',7,4,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',8,4,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,4,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,4,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,5,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,5,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,5,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,5,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,5,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',6,5,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',7,5,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',8,5,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,5,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,5,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,6,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,6,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,6,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,6,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,6,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',6,6,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',7,6,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',8,6,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,6,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,6,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,7,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,8,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',5,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',5,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,1,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,2,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,2,0,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,2,0,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,3,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,3,0,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,3,0,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,3,0,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,3,0,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,4,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,4,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,4,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,4,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,4,0,2),('de38a4b9-0049-11ee-9013-88aedd095151',6,4,0,2),('de38a4b9-0049-11ee-9013-88aedd095151',7,4,0,2),('de38a4b9-0049-11ee-9013-88aedd095151',8,4,0,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,4,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,4,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,5,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,5,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,5,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,5,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,5,0,2),('de38a4b9-0049-11ee-9013-88aedd095151',6,5,0,2),('de38a4b9-0049-11ee-9013-88aedd095151',7,5,0,2),('de38a4b9-0049-11ee-9013-88aedd095151',8,5,0,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,5,0,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,5,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,6,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,6,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,6,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,6,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,6,1,2),('de38a4b9-0049-11ee-9013-88aedd095151',6,6,0,2),('de38a4b9-0049-11ee-9013-88aedd095151',7,6,0,2),('de38a4b9-0049-11ee-9013-88aedd095151',8,6,0,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,6,0,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,6,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,7,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,8,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,8,0,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',5,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,9,0,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',5,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,1,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,2,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,3,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,4,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,4,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,4,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,4,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,4,1,2),('1baa5735-004a-11ee-9013-88aedd095151',6,4,1,2),('1baa5735-004a-11ee-9013-88aedd095151',7,4,1,2),('1baa5735-004a-11ee-9013-88aedd095151',8,4,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,4,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,4,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,5,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,5,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,5,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,5,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,5,1,2),('1baa5735-004a-11ee-9013-88aedd095151',6,5,1,2),('1baa5735-004a-11ee-9013-88aedd095151',7,5,1,2),('1baa5735-004a-11ee-9013-88aedd095151',8,5,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,5,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,5,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,6,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,6,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,6,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,6,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,6,1,2),('1baa5735-004a-11ee-9013-88aedd095151',6,6,1,2),('1baa5735-004a-11ee-9013-88aedd095151',7,6,1,2),('1baa5735-004a-11ee-9013-88aedd095151',8,6,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,6,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,6,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,7,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,8,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',5,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',5,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,1,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,2,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,3,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,4,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,4,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,4,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,4,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,4,1,2),('403d56f6-004a-11ee-9013-88aedd095151',6,4,1,2),('403d56f6-004a-11ee-9013-88aedd095151',7,4,1,2),('403d56f6-004a-11ee-9013-88aedd095151',8,4,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,4,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,4,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,5,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,5,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,5,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,5,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,5,1,2),('403d56f6-004a-11ee-9013-88aedd095151',6,5,1,2),('403d56f6-004a-11ee-9013-88aedd095151',7,5,1,2),('403d56f6-004a-11ee-9013-88aedd095151',8,5,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,5,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,5,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,6,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,6,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,6,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,6,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,6,1,2),('403d56f6-004a-11ee-9013-88aedd095151',6,6,1,2),('403d56f6-004a-11ee-9013-88aedd095151',7,6,1,2),('403d56f6-004a-11ee-9013-88aedd095151',8,6,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,6,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,6,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,7,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,8,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',5,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',5,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,10,1,1),('730166da-004c-11ee-9013-88aedd095151',1,1,1,1),('730166da-004c-11ee-9013-88aedd095151',2,1,1,1),('730166da-004c-11ee-9013-88aedd095151',3,1,1,1),('730166da-004c-11ee-9013-88aedd095151',4,1,1,4),('730166da-004c-11ee-9013-88aedd095151',5,1,1,1),('730166da-004c-11ee-9013-88aedd095151',6,1,1,1),('730166da-004c-11ee-9013-88aedd095151',7,1,1,1),('730166da-004c-11ee-9013-88aedd095151',8,1,1,1),('730166da-004c-11ee-9013-88aedd095151',9,1,1,1),('730166da-004c-11ee-9013-88aedd095151',10,1,1,1),('730166da-004c-11ee-9013-88aedd095151',1,2,1,1),('730166da-004c-11ee-9013-88aedd095151',2,2,1,1),('730166da-004c-11ee-9013-88aedd095151',3,2,1,1),('730166da-004c-11ee-9013-88aedd095151',4,2,1,4),('730166da-004c-11ee-9013-88aedd095151',5,2,1,1),('730166da-004c-11ee-9013-88aedd095151',6,2,1,1),('730166da-004c-11ee-9013-88aedd095151',7,2,1,1),('730166da-004c-11ee-9013-88aedd095151',8,2,1,1),('730166da-004c-11ee-9013-88aedd095151',9,2,1,1),('730166da-004c-11ee-9013-88aedd095151',10,2,1,1),('730166da-004c-11ee-9013-88aedd095151',1,3,1,1),('730166da-004c-11ee-9013-88aedd095151',2,3,1,1),('730166da-004c-11ee-9013-88aedd095151',3,3,1,1),('730166da-004c-11ee-9013-88aedd095151',4,3,1,4),('730166da-004c-11ee-9013-88aedd095151',5,3,1,1),('730166da-004c-11ee-9013-88aedd095151',6,3,1,1),('730166da-004c-11ee-9013-88aedd095151',7,3,1,1),('730166da-004c-11ee-9013-88aedd095151',8,3,1,1),('730166da-004c-11ee-9013-88aedd095151',9,3,1,1),('730166da-004c-11ee-9013-88aedd095151',10,3,1,1),('730166da-004c-11ee-9013-88aedd095151',1,4,1,1),('730166da-004c-11ee-9013-88aedd095151',2,4,1,1),('730166da-004c-11ee-9013-88aedd095151',3,4,1,1),('730166da-004c-11ee-9013-88aedd095151',4,4,1,4),('730166da-004c-11ee-9013-88aedd095151',5,4,1,2),('730166da-004c-11ee-9013-88aedd095151',6,4,1,2),('730166da-004c-11ee-9013-88aedd095151',7,4,1,2),('730166da-004c-11ee-9013-88aedd095151',8,4,1,1),('730166da-004c-11ee-9013-88aedd095151',9,4,1,1),('730166da-004c-11ee-9013-88aedd095151',10,4,1,1),('730166da-004c-11ee-9013-88aedd095151',1,5,1,1),('730166da-004c-11ee-9013-88aedd095151',2,5,1,1),('730166da-004c-11ee-9013-88aedd095151',3,5,1,1),('730166da-004c-11ee-9013-88aedd095151',4,5,1,4),('730166da-004c-11ee-9013-88aedd095151',5,5,1,2),('730166da-004c-11ee-9013-88aedd095151',6,5,1,2),('730166da-004c-11ee-9013-88aedd095151',7,5,1,2),('730166da-004c-11ee-9013-88aedd095151',8,5,1,1),('730166da-004c-11ee-9013-88aedd095151',9,5,1,1),('730166da-004c-11ee-9013-88aedd095151',10,5,1,1),('730166da-004c-11ee-9013-88aedd095151',1,6,1,1),('730166da-004c-11ee-9013-88aedd095151',2,6,1,1),('730166da-004c-11ee-9013-88aedd095151',3,6,1,1),('730166da-004c-11ee-9013-88aedd095151',4,6,1,4),('730166da-004c-11ee-9013-88aedd095151',5,6,1,2),('730166da-004c-11ee-9013-88aedd095151',6,6,1,2),('730166da-004c-11ee-9013-88aedd095151',7,6,1,2),('730166da-004c-11ee-9013-88aedd095151',8,6,1,1),('730166da-004c-11ee-9013-88aedd095151',9,6,1,1),('730166da-004c-11ee-9013-88aedd095151',10,6,1,1),('730166da-004c-11ee-9013-88aedd095151',1,7,1,1),('730166da-004c-11ee-9013-88aedd095151',2,7,1,1),('730166da-004c-11ee-9013-88aedd095151',3,7,1,1),('730166da-004c-11ee-9013-88aedd095151',4,7,1,4),('730166da-004c-11ee-9013-88aedd095151',5,7,1,1),('730166da-004c-11ee-9013-88aedd095151',6,7,1,1),('730166da-004c-11ee-9013-88aedd095151',7,7,1,1),('730166da-004c-11ee-9013-88aedd095151',8,7,1,1),('730166da-004c-11ee-9013-88aedd095151',9,7,1,1),('730166da-004c-11ee-9013-88aedd095151',10,7,1,1),('730166da-004c-11ee-9013-88aedd095151',1,8,1,1),('730166da-004c-11ee-9013-88aedd095151',2,8,1,1),('730166da-004c-11ee-9013-88aedd095151',3,8,1,1),('730166da-004c-11ee-9013-88aedd095151',4,8,1,4),('730166da-004c-11ee-9013-88aedd095151',5,8,1,1),('730166da-004c-11ee-9013-88aedd095151',6,8,1,1),('730166da-004c-11ee-9013-88aedd095151',7,8,1,1),('730166da-004c-11ee-9013-88aedd095151',8,8,1,1),('730166da-004c-11ee-9013-88aedd095151',9,8,1,1),('730166da-004c-11ee-9013-88aedd095151',10,8,1,1),('730166da-004c-11ee-9013-88aedd095151',1,9,1,1),('730166da-004c-11ee-9013-88aedd095151',2,9,1,1),('730166da-004c-11ee-9013-88aedd095151',3,9,1,1),('730166da-004c-11ee-9013-88aedd095151',4,9,1,1),('730166da-004c-11ee-9013-88aedd095151',5,9,1,1),('730166da-004c-11ee-9013-88aedd095151',6,9,1,1),('730166da-004c-11ee-9013-88aedd095151',7,9,1,1),('730166da-004c-11ee-9013-88aedd095151',8,9,1,1),('730166da-004c-11ee-9013-88aedd095151',9,9,1,1),('730166da-004c-11ee-9013-88aedd095151',10,9,1,1),('730166da-004c-11ee-9013-88aedd095151',1,10,1,1),('730166da-004c-11ee-9013-88aedd095151',2,10,1,1),('730166da-004c-11ee-9013-88aedd095151',3,10,1,1),('730166da-004c-11ee-9013-88aedd095151',4,10,1,1),('730166da-004c-11ee-9013-88aedd095151',5,10,1,1),('730166da-004c-11ee-9013-88aedd095151',6,10,1,1),('730166da-004c-11ee-9013-88aedd095151',7,10,1,1),('730166da-004c-11ee-9013-88aedd095151',8,10,1,1),('730166da-004c-11ee-9013-88aedd095151',9,10,1,1),('730166da-004c-11ee-9013-88aedd095151',10,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,1,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,2,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,3,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,4,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,4,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,4,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,4,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,4,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',6,4,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',7,4,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',8,4,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,4,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,4,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,5,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,5,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,5,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,5,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,5,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',6,5,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',7,5,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',8,5,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,5,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,5,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,6,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,6,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,6,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,6,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,6,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',6,6,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',7,6,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',8,6,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,6,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,6,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,7,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,8,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',5,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',5,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,1,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,2,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,3,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,4,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,4,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,4,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,4,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,4,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',6,4,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',7,4,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',8,4,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,4,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,4,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,5,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,5,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,5,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,5,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,5,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',6,5,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',7,5,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',8,5,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,5,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,5,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,6,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,6,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,6,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,6,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,6,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',6,6,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',7,6,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',8,6,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,6,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,6,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,7,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,8,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',5,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',5,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,1,1,4),('4ee67704-0050-11ee-9013-88aedd095151',2,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,1,1,4),('4ee67704-0050-11ee-9013-88aedd095151',1,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,2,1,4),('4ee67704-0050-11ee-9013-88aedd095151',3,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,2,1,4),('4ee67704-0050-11ee-9013-88aedd095151',10,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,3,1,4),('4ee67704-0050-11ee-9013-88aedd095151',4,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,3,1,4),('4ee67704-0050-11ee-9013-88aedd095151',9,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,4,1,4),('4ee67704-0050-11ee-9013-88aedd095151',5,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,4,1,4),('4ee67704-0050-11ee-9013-88aedd095151',8,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,5,1,4),('4ee67704-0050-11ee-9013-88aedd095151',6,5,1,4),('4ee67704-0050-11ee-9013-88aedd095151',7,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,6,1,4),('4ee67704-0050-11ee-9013-88aedd095151',6,6,1,4),('4ee67704-0050-11ee-9013-88aedd095151',7,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,7,1,4),('4ee67704-0050-11ee-9013-88aedd095151',5,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,7,1,4),('4ee67704-0050-11ee-9013-88aedd095151',8,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,8,1,4),('4ee67704-0050-11ee-9013-88aedd095151',4,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,8,1,4),('4ee67704-0050-11ee-9013-88aedd095151',9,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,9,1,4),('4ee67704-0050-11ee-9013-88aedd095151',3,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,9,1,4),('4ee67704-0050-11ee-9013-88aedd095151',10,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,10,1,4),('4ee67704-0050-11ee-9013-88aedd095151',2,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,10,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',1,1,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',2,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,1,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',1,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,2,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',3,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,2,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',10,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,3,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',4,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,3,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',9,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,4,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',5,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,4,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',8,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,5,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',6,5,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',7,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,6,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',6,6,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',7,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,7,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',5,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,7,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',8,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,8,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',4,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,8,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',9,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,9,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',3,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,9,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',10,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,10,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',2,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,10,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',1,1,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',2,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,1,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',1,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,2,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',3,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,2,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',10,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,3,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',4,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,3,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',9,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,4,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',5,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,4,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',8,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,5,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',6,5,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',7,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,6,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',6,6,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',7,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,7,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',5,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,7,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',8,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,8,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',4,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,8,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',9,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,9,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',3,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,9,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',10,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,10,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',2,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,10,1,4),('5f202d06-0050-11ee-9013-88aedd095151',1,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,1,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,2,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,3,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,4,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,5,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,6,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,7,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,8,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,9,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',2,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',3,10,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',5,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',6,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',7,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',8,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',9,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',10,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',1,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,1,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,2,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,3,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,4,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,5,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,6,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,7,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,8,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,9,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',2,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',3,10,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',5,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',6,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',7,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',8,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',9,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',10,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',1,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,1,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,2,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,3,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,4,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,5,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,6,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,7,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,8,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,9,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',2,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',3,10,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',5,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',6,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',7,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',8,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',9,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',10,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',1,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,1,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,1,0,1),('66f3b360-0050-11ee-9013-88aedd095151',5,1,0,1),('66f3b360-0050-11ee-9013-88aedd095151',6,1,0,1),('66f3b360-0050-11ee-9013-88aedd095151',7,1,0,1),('66f3b360-0050-11ee-9013-88aedd095151',8,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,2,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,2,0,1),('66f3b360-0050-11ee-9013-88aedd095151',5,2,0,1),('66f3b360-0050-11ee-9013-88aedd095151',6,2,0,1),('66f3b360-0050-11ee-9013-88aedd095151',7,2,0,1),('66f3b360-0050-11ee-9013-88aedd095151',8,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,3,0,1),('66f3b360-0050-11ee-9013-88aedd095151',3,3,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,3,0,1),('66f3b360-0050-11ee-9013-88aedd095151',5,3,0,1),('66f3b360-0050-11ee-9013-88aedd095151',6,3,0,1),('66f3b360-0050-11ee-9013-88aedd095151',7,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',8,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,4,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,4,0,1),('66f3b360-0050-11ee-9013-88aedd095151',3,4,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,4,0,1),('66f3b360-0050-11ee-9013-88aedd095151',5,4,0,1),('66f3b360-0050-11ee-9013-88aedd095151',6,4,0,1),('66f3b360-0050-11ee-9013-88aedd095151',7,4,0,1),('66f3b360-0050-11ee-9013-88aedd095151',8,4,0,1),('66f3b360-0050-11ee-9013-88aedd095151',9,4,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,4,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,5,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,5,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,5,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,5,0,1),('66f3b360-0050-11ee-9013-88aedd095151',5,5,0,1),('66f3b360-0050-11ee-9013-88aedd095151',6,5,0,1),('66f3b360-0050-11ee-9013-88aedd095151',7,5,0,1),('66f3b360-0050-11ee-9013-88aedd095151',8,5,0,1),('66f3b360-0050-11ee-9013-88aedd095151',9,5,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,5,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,6,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,6,0,1),('66f3b360-0050-11ee-9013-88aedd095151',5,6,0,1),('66f3b360-0050-11ee-9013-88aedd095151',6,6,0,1),('66f3b360-0050-11ee-9013-88aedd095151',7,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',8,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,7,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,7,0,1),('66f3b360-0050-11ee-9013-88aedd095151',5,7,0,1),('66f3b360-0050-11ee-9013-88aedd095151',6,7,0,1),('66f3b360-0050-11ee-9013-88aedd095151',7,7,0,1),('66f3b360-0050-11ee-9013-88aedd095151',8,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,8,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',5,8,0,1),('66f3b360-0050-11ee-9013-88aedd095151',6,8,0,1),('66f3b360-0050-11ee-9013-88aedd095151',7,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',8,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,9,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',5,9,0,1),('66f3b360-0050-11ee-9013-88aedd095151',6,9,0,1),('66f3b360-0050-11ee-9013-88aedd095151',7,9,0,1),('66f3b360-0050-11ee-9013-88aedd095151',8,9,0,1),('66f3b360-0050-11ee-9013-88aedd095151',9,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',2,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',3,10,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',5,10,0,2),('66f3b360-0050-11ee-9013-88aedd095151',6,10,0,2),('66f3b360-0050-11ee-9013-88aedd095151',7,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',8,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',9,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',10,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',1,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,1,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,2,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,3,0,1),('672ee774-0050-11ee-9013-88aedd095151',2,3,0,1),('672ee774-0050-11ee-9013-88aedd095151',3,3,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,3,0,1),('672ee774-0050-11ee-9013-88aedd095151',5,3,0,1),('672ee774-0050-11ee-9013-88aedd095151',6,3,0,1),('672ee774-0050-11ee-9013-88aedd095151',7,3,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,3,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,3,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,3,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,4,0,1),('672ee774-0050-11ee-9013-88aedd095151',2,4,0,1),('672ee774-0050-11ee-9013-88aedd095151',3,4,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,4,0,1),('672ee774-0050-11ee-9013-88aedd095151',5,4,0,1),('672ee774-0050-11ee-9013-88aedd095151',6,4,0,1),('672ee774-0050-11ee-9013-88aedd095151',7,4,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,4,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,4,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,4,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,5,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,5,0,1),('672ee774-0050-11ee-9013-88aedd095151',5,5,0,1),('672ee774-0050-11ee-9013-88aedd095151',6,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,6,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,7,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,8,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,9,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',2,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',3,10,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',5,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',6,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',7,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',8,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',9,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',10,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',1,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,1,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,2,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,3,0,1),('6768bac0-0050-11ee-9013-88aedd095151',2,3,0,1),('6768bac0-0050-11ee-9013-88aedd095151',3,3,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,3,0,1),('6768bac0-0050-11ee-9013-88aedd095151',7,3,0,1),('6768bac0-0050-11ee-9013-88aedd095151',8,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,4,0,1),('6768bac0-0050-11ee-9013-88aedd095151',2,4,0,1),('6768bac0-0050-11ee-9013-88aedd095151',3,4,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,4,0,1),('6768bac0-0050-11ee-9013-88aedd095151',5,4,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,4,0,1),('6768bac0-0050-11ee-9013-88aedd095151',7,4,0,1),('6768bac0-0050-11ee-9013-88aedd095151',8,4,0,1),('6768bac0-0050-11ee-9013-88aedd095151',9,4,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,4,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,5,0,1),('6768bac0-0050-11ee-9013-88aedd095151',2,5,0,1),('6768bac0-0050-11ee-9013-88aedd095151',3,5,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,5,0,1),('6768bac0-0050-11ee-9013-88aedd095151',5,5,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,5,0,1),('6768bac0-0050-11ee-9013-88aedd095151',7,5,0,1),('6768bac0-0050-11ee-9013-88aedd095151',8,5,0,1),('6768bac0-0050-11ee-9013-88aedd095151',9,5,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,5,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,6,0,1),('6768bac0-0050-11ee-9013-88aedd095151',3,6,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,6,0,1),('6768bac0-0050-11ee-9013-88aedd095151',8,6,0,1),('6768bac0-0050-11ee-9013-88aedd095151',9,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,7,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,8,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,9,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',2,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',3,10,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',5,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',6,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',7,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',8,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',9,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',10,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',1,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,1,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,2,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,3,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,4,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,4,0,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,4,0,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,4,0,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,5,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,5,0,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,5,0,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,5,0,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,6,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,6,0,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,6,0,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,7,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,8,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,9,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',2,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',3,10,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',5,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',6,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',7,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',8,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',9,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',10,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',1,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,1,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,1,0,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,2,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,2,0,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,3,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,4,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,5,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,6,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,6,0,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,7,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,8,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,9,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',2,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',3,10,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',5,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',6,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',7,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',8,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',9,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',10,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',1,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,1,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,2,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,3,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,4,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,5,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,6,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,7,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,8,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,9,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',2,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',3,10,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',5,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',6,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',7,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',8,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',9,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',10,10,1,2),('7812e5de-0053-11ee-9013-88aedd095151',1,1,1,4),('7812e5de-0053-11ee-9013-88aedd095151',2,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,1,1,4),('7812e5de-0053-11ee-9013-88aedd095151',1,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,2,1,4),('7812e5de-0053-11ee-9013-88aedd095151',3,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,2,1,4),('7812e5de-0053-11ee-9013-88aedd095151',10,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,3,1,4),('7812e5de-0053-11ee-9013-88aedd095151',4,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,3,1,4),('7812e5de-0053-11ee-9013-88aedd095151',9,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,4,1,4),('7812e5de-0053-11ee-9013-88aedd095151',5,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,4,1,4),('7812e5de-0053-11ee-9013-88aedd095151',8,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,5,1,4),('7812e5de-0053-11ee-9013-88aedd095151',6,5,1,4),('7812e5de-0053-11ee-9013-88aedd095151',7,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,6,1,4),('7812e5de-0053-11ee-9013-88aedd095151',6,6,1,4),('7812e5de-0053-11ee-9013-88aedd095151',7,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,7,1,4),('7812e5de-0053-11ee-9013-88aedd095151',5,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,7,1,4),('7812e5de-0053-11ee-9013-88aedd095151',8,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,8,1,4),('7812e5de-0053-11ee-9013-88aedd095151',4,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,8,1,4),('7812e5de-0053-11ee-9013-88aedd095151',9,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,9,1,4),('7812e5de-0053-11ee-9013-88aedd095151',3,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,9,1,4),('7812e5de-0053-11ee-9013-88aedd095151',10,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,10,1,4),('7812e5de-0053-11ee-9013-88aedd095151',2,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,10,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',1,1,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',2,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,1,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',1,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,2,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',3,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,2,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',10,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,3,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',4,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,3,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',9,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,4,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',5,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,4,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',8,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,5,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',6,5,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',7,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,6,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',6,6,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',7,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,7,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',5,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,7,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',8,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,8,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',4,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,8,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',9,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,9,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',3,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,9,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',10,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,10,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',2,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,10,1,4),('7882e40f-0053-11ee-9013-88aedd095151',1,1,1,4),('7882e40f-0053-11ee-9013-88aedd095151',2,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,1,1,4),('7882e40f-0053-11ee-9013-88aedd095151',1,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,2,1,4),('7882e40f-0053-11ee-9013-88aedd095151',3,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,2,1,4),('7882e40f-0053-11ee-9013-88aedd095151',10,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,3,1,4),('7882e40f-0053-11ee-9013-88aedd095151',4,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,3,1,4),('7882e40f-0053-11ee-9013-88aedd095151',9,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,4,1,4),('7882e40f-0053-11ee-9013-88aedd095151',5,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,4,1,4),('7882e40f-0053-11ee-9013-88aedd095151',8,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,5,1,4),('7882e40f-0053-11ee-9013-88aedd095151',6,5,1,4),('7882e40f-0053-11ee-9013-88aedd095151',7,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,6,1,4),('7882e40f-0053-11ee-9013-88aedd095151',6,6,1,4),('7882e40f-0053-11ee-9013-88aedd095151',7,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,7,1,4),('7882e40f-0053-11ee-9013-88aedd095151',5,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,7,1,4),('7882e40f-0053-11ee-9013-88aedd095151',8,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,8,1,4),('7882e40f-0053-11ee-9013-88aedd095151',4,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,8,1,4),('7882e40f-0053-11ee-9013-88aedd095151',9,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,9,1,4),('7882e40f-0053-11ee-9013-88aedd095151',3,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,9,1,4),('7882e40f-0053-11ee-9013-88aedd095151',10,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,10,1,4),('7882e40f-0053-11ee-9013-88aedd095151',2,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,10,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',1,1,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',2,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,1,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',1,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,2,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',3,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,2,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',10,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,3,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',4,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,3,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',9,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,4,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',5,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,4,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',8,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,5,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',6,5,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',7,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,6,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',6,6,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',7,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,7,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',5,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,7,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',8,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,8,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',4,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,8,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',9,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,9,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',3,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,9,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',10,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,10,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',2,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,10,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',1,1,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',2,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,1,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',1,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,2,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',3,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,2,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',10,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,3,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',4,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,3,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',9,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,4,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',5,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,4,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',8,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,5,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',6,5,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',7,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,6,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',6,6,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',7,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,7,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',5,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,7,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',8,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,8,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',4,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,8,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',9,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,9,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',3,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,9,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',10,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,10,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',2,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,10,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',1,1,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',2,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,1,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',1,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,2,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',3,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,2,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',10,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,3,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',4,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,3,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',9,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,4,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',5,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,4,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',8,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,5,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',6,5,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',7,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,6,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',6,6,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',7,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,7,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',5,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,7,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',8,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,8,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',4,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,8,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',9,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,9,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',3,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,9,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',10,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,10,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',2,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,10,1,4),('9a5517dd-01e3-11ee-b204-0242ac130002',1,1,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',2,1,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',3,1,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',4,1,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',5,1,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',6,1,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',7,1,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',8,1,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',9,1,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',10,1,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',11,1,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',1,2,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',2,2,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',3,2,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',4,2,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',5,2,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',6,2,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',7,2,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',8,2,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',9,2,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',10,2,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',11,2,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',1,3,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',2,3,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',3,3,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',4,3,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',5,3,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',6,3,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',7,3,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',8,3,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',9,3,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',10,3,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',11,3,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',1,4,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',2,4,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',3,4,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',4,4,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',5,4,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',6,4,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',7,4,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',8,4,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',9,4,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',10,4,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',11,4,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',1,5,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',2,5,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',3,5,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',4,5,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',5,5,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',6,5,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',7,5,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',8,5,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',9,5,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',10,5,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',11,5,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',1,6,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',2,6,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',3,6,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',4,6,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',5,6,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',6,6,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',7,6,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',8,6,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',9,6,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',10,6,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',11,6,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',1,7,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',2,7,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',3,7,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',4,7,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',5,7,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',6,7,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',7,7,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',8,7,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',9,7,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',10,7,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',11,7,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',1,8,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',2,8,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',3,8,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',4,8,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',5,8,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',6,8,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',7,8,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',8,8,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',9,8,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',10,8,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',11,8,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',1,9,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',2,9,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',3,9,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',4,9,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',5,9,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',6,9,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',7,9,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',8,9,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',9,9,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',10,9,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',11,9,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',1,10,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',2,10,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',3,10,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',4,10,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',5,10,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',6,10,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',7,10,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',8,10,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',9,10,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',10,10,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',11,10,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',1,11,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',2,11,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',3,11,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',4,11,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',5,11,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',6,11,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',7,11,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',8,11,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',9,11,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',10,11,1,1),('9a5517dd-01e3-11ee-b204-0242ac130002',11,11,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',1,1,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',2,1,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',3,1,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',4,1,1,4),('30c024e4-01e6-11ee-b204-0242ac130002',5,1,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',6,1,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',7,1,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',8,1,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',9,1,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',10,1,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',1,2,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',2,2,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',3,2,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',4,2,1,4),('30c024e4-01e6-11ee-b204-0242ac130002',5,2,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',6,2,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',7,2,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',8,2,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',9,2,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',10,2,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',1,3,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',2,3,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',3,3,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',4,3,1,4),('30c024e4-01e6-11ee-b204-0242ac130002',5,3,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',6,3,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',7,3,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',8,3,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',9,3,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',10,3,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',1,4,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',2,4,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',3,4,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',4,4,1,4),('30c024e4-01e6-11ee-b204-0242ac130002',5,4,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',6,4,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',7,4,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',8,4,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',9,4,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',10,4,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',1,5,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',2,5,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',3,5,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',4,5,1,4),('30c024e4-01e6-11ee-b204-0242ac130002',5,5,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',6,5,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',7,5,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',8,5,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',9,5,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',10,5,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',1,6,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',2,6,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',3,6,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',4,6,1,4),('30c024e4-01e6-11ee-b204-0242ac130002',5,6,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',6,6,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',7,6,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',8,6,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',9,6,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',10,6,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',1,7,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',2,7,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',3,7,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',4,7,1,4),('30c024e4-01e6-11ee-b204-0242ac130002',5,7,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',6,7,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',7,7,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',8,7,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',9,7,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',10,7,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',1,8,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',2,8,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',3,8,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',4,8,1,4),('30c024e4-01e6-11ee-b204-0242ac130002',5,8,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',6,8,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',7,8,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',8,8,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',9,8,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',10,8,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',1,9,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',2,9,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',3,9,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',4,9,1,4),('30c024e4-01e6-11ee-b204-0242ac130002',5,9,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',6,9,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',7,9,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',8,9,0,1),('30c024e4-01e6-11ee-b204-0242ac130002',9,9,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',10,9,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',1,10,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',2,10,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',3,10,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',4,10,1,4),('30c024e4-01e6-11ee-b204-0242ac130002',5,10,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',6,10,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',7,10,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',8,10,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',9,10,1,1),('30c024e4-01e6-11ee-b204-0242ac130002',10,10,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',1,1,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',2,1,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',3,1,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',4,1,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',5,1,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',6,1,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',7,1,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',8,1,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',9,1,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',10,1,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',11,1,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',1,2,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',2,2,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',3,2,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',4,2,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',5,2,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',6,2,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',7,2,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',8,2,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',9,2,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',10,2,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',11,2,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',1,3,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',2,3,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',3,3,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',4,3,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',5,3,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',6,3,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',7,3,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',8,3,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',9,3,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',10,3,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',11,3,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',1,4,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',2,4,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',3,4,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',4,4,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',5,4,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',6,4,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',7,4,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',8,4,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',9,4,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',10,4,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',11,4,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',1,5,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',2,5,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',3,5,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',4,5,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',5,5,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',6,5,0,1),('af43d2c8-01e6-11ee-b204-0242ac130002',7,5,0,1),('af43d2c8-01e6-11ee-b204-0242ac130002',8,5,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',9,5,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',10,5,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',11,5,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',1,6,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',2,6,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',3,6,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',4,6,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',5,6,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',6,6,0,1),('af43d2c8-01e6-11ee-b204-0242ac130002',7,6,0,1),('af43d2c8-01e6-11ee-b204-0242ac130002',8,6,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',9,6,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',10,6,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',11,6,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',1,7,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',2,7,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',3,7,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',4,7,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',5,7,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',6,7,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',7,7,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',8,7,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',9,7,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',10,7,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',11,7,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',1,8,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',2,8,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',3,8,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',4,8,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',5,8,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',6,8,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',7,8,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',8,8,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',9,8,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',10,8,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',11,8,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',1,9,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',2,9,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',3,9,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',4,9,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',5,9,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',6,9,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',7,9,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',8,9,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',9,9,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',10,9,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',11,9,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',1,10,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',2,10,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',3,10,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',4,10,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',5,10,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',6,10,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',7,10,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',8,10,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',9,10,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',10,10,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',11,10,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',1,11,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',2,11,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',3,11,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',4,11,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',5,11,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',6,11,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',7,11,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',8,11,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',9,11,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',10,11,1,1),('af43d2c8-01e6-11ee-b204-0242ac130002',11,11,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',1,1,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',2,1,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',3,1,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',4,1,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',5,1,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',6,1,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',7,1,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',8,1,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',9,1,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',10,1,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',11,1,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',1,2,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',2,2,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',3,2,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',4,2,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',5,2,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',6,2,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',7,2,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',8,2,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',9,2,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',10,2,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',11,2,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',1,3,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',2,3,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',3,3,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',4,3,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',5,3,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',6,3,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',7,3,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',8,3,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',9,3,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',10,3,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',11,3,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',1,4,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',2,4,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',3,4,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',4,4,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',5,4,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',6,4,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',7,4,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',8,4,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',9,4,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',10,4,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',11,4,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',1,5,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',2,5,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',3,5,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',4,5,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',5,5,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',6,5,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',7,5,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',8,5,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',9,5,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',10,5,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',11,5,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',1,6,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',2,6,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',3,6,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',4,6,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',5,6,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',6,6,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',7,6,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',8,6,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',9,6,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',10,6,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',11,6,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',1,7,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',2,7,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',3,7,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',4,7,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',5,7,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',6,7,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',7,7,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',8,7,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',9,7,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',10,7,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',11,7,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',1,8,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',2,8,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',3,8,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',4,8,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',5,8,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',6,8,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',7,8,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',8,8,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',9,8,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',10,8,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',11,8,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',1,9,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',2,9,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',3,9,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',4,9,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',5,9,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',6,9,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',7,9,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',8,9,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',9,9,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',10,9,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',11,9,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',1,10,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',2,10,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',3,10,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',4,10,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',5,10,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',6,10,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',7,10,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',8,10,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',9,10,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',10,10,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',11,10,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',1,11,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',2,11,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',3,11,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',4,11,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',5,11,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',6,11,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',7,11,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',8,11,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',9,11,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',10,11,1,1),('afaa52cc-01e6-11ee-b204-0242ac130002',11,11,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',1,1,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',2,1,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',3,1,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',4,1,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',5,1,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',6,1,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',7,1,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',8,1,1,4),('ba28fd2a-01e6-11ee-b204-0242ac130002',9,1,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',10,1,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',1,2,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',2,2,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',3,2,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',4,2,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',5,2,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',6,2,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',7,2,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',8,2,1,4),('ba28fd2a-01e6-11ee-b204-0242ac130002',9,2,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',10,2,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',1,3,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',2,3,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',3,3,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',4,3,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',5,3,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',6,3,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',7,3,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',8,3,1,4),('ba28fd2a-01e6-11ee-b204-0242ac130002',9,3,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',10,3,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',1,4,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',2,4,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',3,4,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',4,4,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',5,4,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',6,4,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',7,4,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',8,4,1,4),('ba28fd2a-01e6-11ee-b204-0242ac130002',9,4,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',10,4,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',1,5,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',2,5,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',3,5,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',4,5,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',5,5,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',6,5,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',7,5,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',8,5,1,4),('ba28fd2a-01e6-11ee-b204-0242ac130002',9,5,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',10,5,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',1,6,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',2,6,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',3,6,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',4,6,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',5,6,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',6,6,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',7,6,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',8,6,1,4),('ba28fd2a-01e6-11ee-b204-0242ac130002',9,6,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',10,6,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',1,7,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',2,7,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',3,7,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',4,7,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',5,7,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',6,7,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',7,7,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',8,7,1,4),('ba28fd2a-01e6-11ee-b204-0242ac130002',9,7,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',10,7,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',1,8,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',2,8,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',3,8,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',4,8,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',5,8,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',6,8,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',7,8,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',8,8,1,4),('ba28fd2a-01e6-11ee-b204-0242ac130002',9,8,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',10,8,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',1,9,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',2,9,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',3,9,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',4,9,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',5,9,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',6,9,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',7,9,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',8,9,1,4),('ba28fd2a-01e6-11ee-b204-0242ac130002',9,9,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',10,9,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',1,10,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',2,10,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',3,10,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',4,10,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',5,10,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',6,10,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',7,10,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',8,10,1,4),('ba28fd2a-01e6-11ee-b204-0242ac130002',9,10,1,1),('ba28fd2a-01e6-11ee-b204-0242ac130002',10,10,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',1,1,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',2,1,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',3,1,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',4,1,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',5,1,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',6,1,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',7,1,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',8,1,1,4),('c61e5bca-01e6-11ee-b204-0242ac130002',9,1,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',10,1,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',1,2,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',2,2,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',3,2,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',4,2,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',5,2,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',6,2,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',7,2,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',8,2,1,4),('c61e5bca-01e6-11ee-b204-0242ac130002',9,2,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',10,2,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',1,3,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',2,3,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',3,3,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',4,3,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',5,3,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',6,3,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',7,3,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',8,3,1,4),('c61e5bca-01e6-11ee-b204-0242ac130002',9,3,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',10,3,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',1,4,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',2,4,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',3,4,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',4,4,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',5,4,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',6,4,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',7,4,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',8,4,1,4),('c61e5bca-01e6-11ee-b204-0242ac130002',9,4,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',10,4,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',1,5,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',2,5,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',3,5,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',4,5,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',5,5,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',6,5,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',7,5,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',8,5,1,4),('c61e5bca-01e6-11ee-b204-0242ac130002',9,5,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',10,5,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',1,6,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',2,6,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',3,6,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',4,6,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',5,6,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',6,6,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',7,6,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',8,6,1,4),('c61e5bca-01e6-11ee-b204-0242ac130002',9,6,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',10,6,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',1,7,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',2,7,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',3,7,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',4,7,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',5,7,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',6,7,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',7,7,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',8,7,1,4),('c61e5bca-01e6-11ee-b204-0242ac130002',9,7,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',10,7,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',1,8,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',2,8,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',3,8,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',4,8,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',5,8,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',6,8,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',7,8,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',8,8,1,4),('c61e5bca-01e6-11ee-b204-0242ac130002',9,8,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',10,8,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',1,9,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',2,9,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',3,9,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',4,9,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',5,9,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',6,9,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',7,9,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',8,9,1,4),('c61e5bca-01e6-11ee-b204-0242ac130002',9,9,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',10,9,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',1,10,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',2,10,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',3,10,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',4,10,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',5,10,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',6,10,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',7,10,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',8,10,1,4),('c61e5bca-01e6-11ee-b204-0242ac130002',9,10,1,1),('c61e5bca-01e6-11ee-b204-0242ac130002',10,10,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',1,1,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',2,1,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',3,1,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',4,1,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',5,1,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',6,1,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',7,1,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',8,1,1,4),('c67c3b68-01e6-11ee-b204-0242ac130002',9,1,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',10,1,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',1,2,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',2,2,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',3,2,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',4,2,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',5,2,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',6,2,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',7,2,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',8,2,1,4),('c67c3b68-01e6-11ee-b204-0242ac130002',9,2,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',10,2,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',1,3,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',2,3,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',3,3,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',4,3,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',5,3,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',6,3,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',7,3,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',8,3,1,4),('c67c3b68-01e6-11ee-b204-0242ac130002',9,3,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',10,3,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',1,4,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',2,4,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',3,4,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',4,4,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',5,4,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',6,4,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',7,4,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',8,4,1,4),('c67c3b68-01e6-11ee-b204-0242ac130002',9,4,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',10,4,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',1,5,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',2,5,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',3,5,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',4,5,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',5,5,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',6,5,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',7,5,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',8,5,1,4),('c67c3b68-01e6-11ee-b204-0242ac130002',9,5,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',10,5,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',1,6,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',2,6,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',3,6,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',4,6,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',5,6,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',6,6,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',7,6,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',8,6,1,4),('c67c3b68-01e6-11ee-b204-0242ac130002',9,6,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',10,6,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',1,7,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',2,7,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',3,7,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',4,7,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',5,7,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',6,7,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',7,7,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',8,7,1,4),('c67c3b68-01e6-11ee-b204-0242ac130002',9,7,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',10,7,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',1,8,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',2,8,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',3,8,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',4,8,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',5,8,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',6,8,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',7,8,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',8,8,1,4),('c67c3b68-01e6-11ee-b204-0242ac130002',9,8,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',10,8,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',1,9,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',2,9,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',3,9,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',4,9,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',5,9,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',6,9,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',7,9,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',8,9,1,4),('c67c3b68-01e6-11ee-b204-0242ac130002',9,9,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',10,9,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',1,10,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',2,10,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',3,10,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',4,10,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',5,10,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',6,10,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',7,10,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',8,10,1,4),('c67c3b68-01e6-11ee-b204-0242ac130002',9,10,1,1),('c67c3b68-01e6-11ee-b204-0242ac130002',10,10,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',1,1,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',2,1,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',3,1,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',4,1,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',5,1,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',6,1,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',7,1,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',8,1,1,4),('c6d8bc97-01e6-11ee-b204-0242ac130002',9,1,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',10,1,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',1,2,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',2,2,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',3,2,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',4,2,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',5,2,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',6,2,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',7,2,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',8,2,1,4),('c6d8bc97-01e6-11ee-b204-0242ac130002',9,2,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',10,2,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',1,3,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',2,3,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',3,3,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',4,3,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',5,3,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',6,3,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',7,3,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',8,3,1,4),('c6d8bc97-01e6-11ee-b204-0242ac130002',9,3,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',10,3,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',1,4,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',2,4,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',3,4,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',4,4,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',5,4,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',6,4,0,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',7,4,0,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',8,4,1,4),('c6d8bc97-01e6-11ee-b204-0242ac130002',9,4,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',10,4,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',1,5,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',2,5,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',3,5,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',4,5,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',5,5,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',6,5,0,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',7,5,0,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',8,5,1,4),('c6d8bc97-01e6-11ee-b204-0242ac130002',9,5,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',10,5,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',1,6,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',2,6,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',3,6,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',4,6,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',5,6,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',6,6,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',7,6,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',8,6,1,4),('c6d8bc97-01e6-11ee-b204-0242ac130002',9,6,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',10,6,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',1,7,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',2,7,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',3,7,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',4,7,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',5,7,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',6,7,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',7,7,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',8,7,1,4),('c6d8bc97-01e6-11ee-b204-0242ac130002',9,7,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',10,7,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',1,8,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',2,8,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',3,8,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',4,8,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',5,8,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',6,8,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',7,8,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',8,8,1,4),('c6d8bc97-01e6-11ee-b204-0242ac130002',9,8,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',10,8,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',1,9,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',2,9,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',3,9,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',4,9,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',5,9,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',6,9,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',7,9,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',8,9,1,4),('c6d8bc97-01e6-11ee-b204-0242ac130002',9,9,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',10,9,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',1,10,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',2,10,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',3,10,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',4,10,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',5,10,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',6,10,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',7,10,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',8,10,1,4),('c6d8bc97-01e6-11ee-b204-0242ac130002',9,10,1,1),('c6d8bc97-01e6-11ee-b204-0242ac130002',10,10,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',1,1,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',2,1,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',3,1,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',4,1,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',5,1,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',6,1,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',7,1,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',8,1,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',9,1,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',10,1,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',11,1,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',1,2,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',2,2,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',3,2,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',4,2,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',5,2,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',6,2,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',7,2,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',8,2,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',9,2,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',10,2,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',11,2,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',1,3,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',2,3,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',3,3,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',4,3,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',5,3,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',6,3,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',7,3,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',8,3,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',9,3,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',10,3,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',11,3,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',1,4,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',2,4,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',3,4,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',4,4,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',5,4,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',6,4,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',7,4,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',8,4,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',9,4,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',10,4,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',11,4,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',1,5,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',2,5,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',3,5,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',4,5,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',5,5,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',6,5,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',7,5,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',8,5,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',9,5,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',10,5,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',11,5,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',1,6,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',2,6,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',3,6,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',4,6,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',5,6,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',6,6,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',7,6,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',8,6,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',9,6,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',10,6,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',11,6,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',1,7,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',2,7,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',3,7,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',4,7,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',5,7,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',6,7,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',7,7,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',8,7,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',9,7,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',10,7,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',11,7,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',1,8,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',2,8,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',3,8,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',4,8,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',5,8,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',6,8,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',7,8,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',8,8,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',9,8,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',10,8,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',11,8,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',1,9,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',2,9,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',3,9,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',4,9,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',5,9,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',6,9,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',7,9,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',8,9,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',9,9,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',10,9,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',11,9,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',1,10,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',2,10,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',3,10,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',4,10,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',5,10,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',6,10,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',7,10,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',8,10,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',9,10,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',10,10,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',11,10,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',1,11,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',2,11,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',3,11,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',4,11,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',5,11,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',6,11,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',7,11,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',8,11,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',9,11,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',10,11,1,1),('d55a7416-01e6-11ee-b204-0242ac130002',11,11,1,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=1170;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templateticketmovie`
--

LOCK TABLES `templateticketmovie` WRITE;
/*!40000 ALTER TABLE `templateticketmovie` DISABLE KEYS */;
INSERT INTO `templateticketmovie` VALUES ('3aedfe2a-01e5-11ee-b204-0242ac130002','87f0fcaa-bf50-449b-b5f8-4ddc0d76c2a5',1,60000.0000),('3aeed0be-01e5-11ee-b204-0242ac130002','87f0fcaa-bf50-449b-b5f8-4ddc0d76c2a5',2,70000.0000),('4a3bdbb1-0047-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db',1,60000.0000),('4a3c555c-0047-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db',2,70000.0000),('6eeddccc-fb7b-11ed-816c-88aedd095151','dbda62f0-9c62-4cc8-9f7e-06415f2714dd',1,60000.0000),('6eee6b40-fb7b-11ed-816c-88aedd095151','dbda62f0-9c62-4cc8-9f7e-06415f2714dd',2,70001.0000),('73d8295b-01cc-11ee-b204-0242ac130002','9eda84a6-dcc8-48a2-9840-a79d6b470993',1,60000.0000),('73d8fa03-01cc-11ee-b204-0242ac130002','9eda84a6-dcc8-48a2-9840-a79d6b470993',2,70001.0000),('790c0272-e986-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70',1,50000.0000),('790c25d6-e986-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70',2,70000.0000),('9adcae8c-df51-11ed-bf13-88aedd095151','d6ed7e34-fada-474f-9682-2c2cf3ba4bed',1,50000.0000),('9adcf5c2-df51-11ed-bf13-88aedd095151','d6ed7e34-fada-474f-9682-2c2cf3ba4bed',2,70000.0000),('a0bcaf22-fa31-11ed-906e-907841e9040c','adcbe5cc-7cda-4351-8ee1-e391892199c8',1,50000.0000),('a0bd3a5b-fa31-11ed-906e-907841e9040c','adcbe5cc-7cda-4351-8ee1-e391892199c8',2,70000.0000),('a59c548d-e986-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf',1,110000.0000),('a59c8a64-e986-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf',2,70000.0000),('af560c01-e31b-11ed-857f-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b',1,52000.0000),('af566af1-e31b-11ed-857f-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b',2,70000.0000),('b2ab2aa5-fb7b-11ed-816c-88aedd095151','ec435b57-d585-4cc4-90d7-4d0db5c4abde',1,60000.0000),('b2ab9a82-fb7b-11ed-816c-88aedd095151','ec435b57-d585-4cc4-90d7-4d0db5c4abde',2,70001.0000),('c4235402-fb77-11ed-816c-88aedd095151','65cbd457-2f10-4652-9916-64f904ab5cd0',1,60000.0000),('c423f943-fb77-11ed-816c-88aedd095151','65cbd457-2f10-4652-9916-64f904ab5cd0',2,70001.0000),('db6c30b1-01e4-11ee-b204-0242ac130002','24aa75fc-0409-4926-9489-465e6fe2d377',1,60000.0000),('db6d29d2-01e4-11ee-b204-0242ac130002','24aa75fc-0409-4926-9489-465e6fe2d377',2,70000.0000),('e0e7f2f2-e986-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42',1,140000.0000),('e0e837ec-e986-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42',2,70000.0000),('e82fd726-fa31-11ed-906e-907841e9040c','cef32a5e-21e4-4633-b241-9fab2fab1939',1,50001.0000),('e8305fce-fa31-11ed-906e-907841e9040c','cef32a5e-21e4-4633-b241-9fab2fab1939',2,70000.0000),('f7b12214-e5a9-11ed-b285-88aedd095151','668aede5-2336-459a-b0ad-26969ea141d9',1,50000.0000),('f7b17761-e5a9-11ed-b285-88aedd095151','668aede5-2336-459a-b0ad-26969ea141d9',2,70000.0000),('fd8e9794-01e5-11ee-b204-0242ac130002','2aed159b-a87f-4f86-b889-c3a2ece2fdb1',1,60000.0000),('fd8fb8b6-01e5-11ee-b204-0242ac130002','2aed159b-a87f-4f86-b889-c3a2ece2fdb1',2,70000.0000),('ff39b0f6-e316-11ed-857f-88aedd095151','ac6b11da-ebef-4889-9f77-a971c292066b',1,50001.0000),('ff3a0b0f-e316-11ed-857f-88aedd095151','ac6b11da-ebef-4889-9f77-a971c292066b',2,70000.0000);
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
INSERT INTO `templatetimemoiveon` VALUES ('01','17:30:00'),('02','18:30:00'),('03','19:30');
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
INSERT INTO `typemovie` VALUES ('73db8507-d17b-11ed-a44f-907841e9040c','3D','Phim 3D'),('ebed1079-002e-11ee-9013-88aedd095151','2D','Phim 2D');
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

--
-- Dumping events for database 'db_cinema_dev_01'
--

--
-- Dumping routines for database 'db_cinema_dev_01'
--
/*!50003 DROP PROCEDURE IF EXISTS `InsertToHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `InsertToHistory`(IN $TotalAmount decimal, IN $CreatedBy varchar(255), IN $ListSeatID text, IN $CustomerName varchar(255), IN $PhoneNumber varchar(10), IN $MovieName varchar(500), IN $MovieID char(36), IN $RoomCinemaID char(36), IN $TemplateTimeCode varchar(20))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_AcceptAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_AcceptAccount`(IN $AccountID char(36), IN $Status int)
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_AddNewDBOptions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_AddNewDBOptions`(IN $Keyword varchar(255), IN $KeyValue varchar(255))
BEGIN
  INSERT INTO dboptions (Keyword, KeyValue)
    VALUES ($Keyword, $KeyValue);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_AddWaitListAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_AddWaitListAccount`(IN $AccountName varchar(50), IN $Password varchar(50), IN $Role int, IN $Name varchar(255))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ChangeDBOptions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_ChangeDBOptions`(IN $Keyword varchar(255), IN $KeyValue varchar(255))
BEGIN
  UPDATE dboptions
  SET KeyValue = $KeyValue
  WHERE Keyword = $Keyword;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_CheckExistAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_CheckExistAccount`(IN $AccountName varchar(50))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_CreateNewCinemaRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_CreateNewCinemaRoom`(IN $RoomID char(36), IN $PostDate date, IN $MovieID char(36), IN $ListTemplateTimeCode varchar(20))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_CreateNewRealRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_CreateNewRealRoom`(IN $RoomCode varchar(20), IN $RowSeat int, IN $ColSeat int)
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_CreateNewRoomSeat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_CreateNewRoomSeat`(IN $Col int, IN $Row int, IN $CinemaRoomID char(36), IN $RoomID char(36))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_CreateNewTemplateTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_CreateNewTemplateTime`(IN $TemplateTimeCode varchar(20), IN $Time varchar(255))
BEGIN
  INSERT INTO templatetimemovieon
    SELECT
      $TemplateTimeCode,
      $Time;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_CreateRealCinemaRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_CreateRealCinemaRoom`(IN $RoomCode varchar(20), IN $RowSeat int, IN $ColSeat int)
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_DeleteMovieByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_DeleteMovieByID`(IN $MovieID char(36))
    COMMENT 'Thủ tục thực hiện xóa phim theo id của phim'
BEGIN
  DELETE
    FROM movie
  WHERE MovieID = $MovieID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_DeleteMovies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_DeleteMovies`(IN $MovieIDs varchar(255))
    COMMENT 'Hàm thực hiện xóa phim'
BEGIN
  DELETE
    FROM movie
  WHERE MovieID IN ($MovieIDs);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_DeleteRealRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_DeleteRealRoom`(In $RoomID char(36))
BEGIN
	Delete from room r WHERE r.RoomID = $RoomID;
	Delete FROM seat s WHERE s.RoomID = $RoomID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_DeleteRoomCinemaVirtual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_DeleteRoomCinemaVirtual`(IN $RoomCinemaID char(36))
BEGIN
	delete from roomcinema t where t.RoomCinemaID = $RoomCinemaID; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetAccountIDRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetAccountIDRole`(IN $account_name varchar(50), IN $account_password varchar(50))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetAllAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetAllAccount`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetAllAccountTemp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetAllAccountTemp`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetBiggestMovieCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetBiggestMovieCode`()
    COMMENT 'Thủ tục lấy ra chuỗi lớn nhất của movie code'
BEGIN
  SELECT
    m.moviecode AS MovieCode
  FROM movie m
  ORDER BY LENGTH(moviecode) DESC, SUBSTRING(moviecode, 1, 1) DESC, CAST(SUBSTRING(moviecode, 2) AS UNSIGNED) DESC LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetCategoryMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetCategoryMovie`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetChartDayByMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetChartDayByMovie`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetChartMonthByMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetChartMonthByMovie`(IN $MovieID char(36))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetChartThisMonth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetChartThisMonth`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetChartThisYearByMonth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetChartThisYearByMonth`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetCinemaInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetCinemaInfo`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetCinemaRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetCinemaRoom`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetDBOption` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetDBOption`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetHistory`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetListCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetListCustomer`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetListLanguage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetListLanguage`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetListMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetListMovie`(IN $MovieCode varchar(50), IN $MovieName varchar(200), IN $Actor varchar(200), IN $Direction varchar(200), IN $TypeFilter int)
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
  OR $TypeFilter = Period) ORDER BY FromDate,MovieName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetListRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetListRoom`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetListRoomCinemaByMovieID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetListRoomCinemaByMovieID`(IN $MovieID char(36), IN $PostDate date)
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetListTemplateTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetListTemplateTicket`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetMovieByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetMovieByID`(IN $MovieID char(36))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetRealSeatByRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetRealSeatByRoom`(IN $RoomID char(36))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetSeatRoomCinema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetSeatRoomCinema`(IN $RoomCinemaID char(36))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetTemplateTimeCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetTemplateTimeCode`()
    COMMENT 'Thủ tục lấy ra tất cả khung giờ'
BEGIN
  SELECT
    t.TemplateTimeCode AS TemplateTimeCode,
    t.Time AS Time
  FROM templatetimemoiveon t
  ORDER BY t.Time;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetTemplateTimeCodeByMovieID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetTemplateTimeCodeByMovieID`(IN $MovieID char(36), IN $PostDate date, IN $RoomID char(36))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetTypeMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_GetTypeMovie`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_InsertCategoryMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_InsertCategoryMovie`(IN $CategoryName varchar(500), IN $CategoryCode varchar(20))
    COMMENT 'THủ tục thêm mới thể loại phim'
BEGIN
  INSERT INTO categorymovie (CategoryID, CategoryName, CategoryCode)
    VALUES (UUID(), $CategoryName, $CategoryCode);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_InsertNewLanguage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_InsertNewLanguage`(IN $LanguageCode varchar(10), IN $LanguageName varchar(50))
    COMMENT 'Thủ tục thêm mới một ngôn ngữ'
BEGIN
  INSERT INTO language (LanguageCode, LanguageName)
    VALUES ($LanguageCode, $LanguageName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_InsertNewMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_InsertNewMovie`(IN $MovieCode varchar(20), IN $MovieName varchar(500), IN $ReleaseDate datetime, IN $Actor varchar(500), IN $Directions varchar(255), IN $TypeID char(36), IN $Language varchar(100), IN $TrailerLink varchar(500), IN $PosterLink varchar(500), IN $Content text, IN $FromDate datetime, IN $ToDate datetime, IN $IsOpen bit, IN $Tag varchar(20), IN $CategoryIDs varchar(255), IN $MovieID char(36), IN $TimeLine int)
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_InsertTemplateTimeCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_InsertTemplateTimeCode`(IN $TemplateTimeCode varchar(20), IN $Time varchar(255))
    COMMENT 'Thủ tục thêm mới múi thời gian'
BEGIN
  INSERT INTO templatetimemoiveon (TemplateTimeCode, Time)
    VALUES ($TemplateTimeCode, $Time);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_InsertToHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_InsertToHistory`(IN $CreatedBy varchar(255),
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_InsertTypeMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_InsertTypeMovie`(IN $TypeCode varchar(20), IN $TypeName varchar(500))
    COMMENT 'Thủ tục thêm mới một loại phim'
BEGIN
  INSERT INTO typemovie (TypeID, TypeCode, TypeName)
    VALUES (UUID(), $TypeCode, $TypeName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_UpdateAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_UpdateAccount`(IN $AccountID char(36), IN $Password varchar(50), IN $Role int, IN $Name varchar(255), IN $Gender int, IN $DateOfBirth date, IN $PhoneNumber varchar(10), IN $Email varchar(100))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_UpdateCinemaInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_UpdateCinemaInfo`(IN $CinemaID char(36), IN $CinemaCode varchar(20), IN $CinemaName varchar(500), IN $CinemaAddress varchar(500), IN $About text, IN $Hotline varchar(10), IN $MST varchar(50))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_UpdateCostOfTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_UpdateCostOfTicket`(IN $TemplateTicketID char(36), IN $Cost decimal(22, 4))
BEGIN
  UPDATE templateticketmovie t
  SET t.Cost = $Cost
  WHERE t.TemplateTicketID = $TemplateTicketID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_UpdateDBOption` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_UpdateDBOption`(IN $Keyword varchar(255), IN $KeyValue varchar(255))
BEGIN
  UPDATE dboptions d
  SET d.KeyValue = $KeyValue
  WHERE d.Keyword = $Keyword;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_UpdateMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_UpdateMovie`(IN $MovieCode varchar(20), IN $MovieName varchar(500), IN $ReleaseDate datetime, IN $Actor varchar(500), IN $Directions varchar(255), IN $TypeID char(36), IN $Language varchar(100), IN $TrailerLink varchar(500), IN $PosterLink varchar(500), IN $Content text, IN $FromDate datetime, IN $ToDate datetime, IN $IsOpen bit, IN $Tag varchar(20), IN $CategoryIDs text, IN $MovieID char(36), IN $TimeLine varchar(255))
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_UpdateRealSeatRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_UpdateRealSeatRoom`(IN $ListSeatSelected text)
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_UpdateSeatRoomCinema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_UpdateSeatRoomCinema`(IN $ListSeatSelected text)
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_UpdateStatusExportedInCinema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_UpdateStatusExportedInCinema`(IN $DataTicket text,
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_UpdateStatusExportedInHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Proc_UpdateStatusExportedInHistory`(IN $CheckoutID char(36))
    COMMENT 'Thủ tục cập nhật trạng thái đã xuất vé trong rạp chiếu phim'
BEGIN
  UPDATE history h
  SET h.IsExported = 1
  WHERE h.CheckoutID = $CheckoutID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-09 17:12:57
