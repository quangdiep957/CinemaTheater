-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: db_cinema_dev_01
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
INSERT INTO `categorymovie` VALUES ('54687a5a-d207-11ed-afa1-0242ac120002','Tình cảm','10'),('5e260de6-d207-11ed-afa1-0242ac120002','Hoạt hình','04'),('61aa4b93-d208-11ed-a44f-907841e9040c','Kinh dị','08'),('61ab1fc2-d208-11ed-a44f-907841e9040c','Kịch','07'),('61ab21a8-d208-11ed-a44f-907841e9040c','Huyền ảo','05'),('7685b7d8-d207-11ed-afa1-0242ac120002','Hài hước','02'),('8cf95452-d207-11ed-afa1-0242ac120002','Khoa học viên tưởng','06'),('9b43e7b6-d207-11ed-afa1-0242ac120002','Ca nhạc','01'),('b4bb3e2e-d207-11ed-afa1-0242ac120002','Phiêu lưu','09'),('ea6a3fa5-d17b-11ed-a44f-907841e9040c','Hành động','03');
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
INSERT INTO `dboptions` VALUES (1,'Default_Seat_Normal','60000'),(2,'Default_Seat_VIP','70001');
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
INSERT INTO `history` VALUES ('0e39d903-f58c-11ed-906e-907841e9040c','0e39d915-f58c-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','456e9730-ed6b-11ed-8709-88aedd095151','0e39c69c-f58c-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'C5','02','taikhoan1','2023-05-18 21:55:40','2023-04-04 00:00:00','18:30:00','1','A2',_binary '\0'),('0e3b6de3-f58c-11ed-906e-907841e9040c','0e3b6df8-f58c-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','456e9730-ed6b-11ed-8709-88aedd095151','0e39c69c-f58c-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'C6','02','taikhoan1','2023-05-18 21:55:40','2023-04-04 00:00:00','18:30:00','1','A2',_binary '\0'),('0e3bd9d3-f58c-11ed-906e-907841e9040c','0e3bd9f6-f58c-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','456e9730-ed6b-11ed-8709-88aedd095151',NULL,'VỆ BINH DẢI NGÂN HÀ 3','','',NULL,NULL,'02','taikhoan1','2023-05-18 21:55:40','2023-04-04 00:00:00','18:30:00','1','A2',_binary '\0'),('1a13e2b1-e987-11ed-906e-907841e9040c','1a13e2bc-e987-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','0bdce2b6-e987-11ed-906e-907841e9040c','1a13dabd-e987-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',50000.0000,'A1','03','','2023-05-03 14:49:58','2023-05-11 00:00:00','19:30','1','A1',_binary '\0'),('1a143ec8-e987-11ed-906e-907841e9040c','1a143eda-e987-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','0bdce2b6-e987-11ed-906e-907841e9040c','1a13dabd-e987-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',50000.0000,'A2','03','','2023-05-03 14:49:58','2023-05-11 00:00:00','19:30','1','A1',_binary '\0'),('1a1478bf-e987-11ed-906e-907841e9040c','1a1478ce-e987-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','0bdce2b6-e987-11ed-906e-907841e9040c','1a13dabd-e987-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',50000.0000,'A4','03','','2023-05-03 14:49:58','2023-05-11 00:00:00','19:30','1','A1',_binary '\0'),('1a151260-e987-11ed-906e-907841e9040c','1a15127c-e987-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','0bdce2b6-e987-11ed-906e-907841e9040c','1a13dabd-e987-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',50000.0000,'A5','03','','2023-05-03 14:49:58','2023-05-11 00:00:00','19:30','1','A1',_binary '\0'),('1a154f73-e987-11ed-906e-907841e9040c','1a154f86-e987-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','0bdce2b6-e987-11ed-906e-907841e9040c',NULL,'VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',NULL,NULL,'03','','2023-05-03 14:49:58','2023-05-11 00:00:00','19:30','1','A1',_binary '\0'),('1cf6efdf-0049-11ee-9013-88aedd095151','1cf6efec-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'D5','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf752db-0049-11ee-9013-88aedd095151','1cf752e9-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'D6','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf79c06-0049-11ee-9013-88aedd095151','1cf79c11-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'D7','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf80c31-0049-11ee-9013-88aedd095151','1cf80c40-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'E7','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf8672d-0049-11ee-9013-88aedd095151','1cf86737-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'E6','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf8cb64-0049-11ee-9013-88aedd095151','1cf8cb73-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'E5','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf91ab2-0049-11ee-9013-88aedd095151','1cf91ac1-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'F5','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cf9b2cb-0049-11ee-9013-88aedd095151','1cf9b2db-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'F6','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cfa28d3-0049-11ee-9013-88aedd095151','1cfa28df-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151','1cf6c690-0049-11ee-9013-88aedd095151','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',70001.0000,'F7','01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('1cfac987-0049-11ee-9013-88aedd095151','1cfac9ac-0049-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','0e4a23c0-0049-11ee-9013-88aedd095151',NULL,'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','Minh Đoàn','0838336272',NULL,NULL,'01','','2023-06-01 13:54:11','2023-06-01 00:00:00','17:30:00','2','A4',_binary '\0'),('2053c7ed-ea1e-11ed-8128-88aedd095151','2053c804-ea1e-11ed-8128-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c','2053af10-ea1e-11ed-8128-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',110000.0000,'D4','01','','2023-05-04 08:51:03','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('20555ec4-ea1e-11ed-8128-88aedd095151','20555ed9-ea1e-11ed-8128-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c','2053af10-ea1e-11ed-8128-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',110000.0000,'E4','01','','2023-05-04 08:51:03','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('2055e9fb-ea1e-11ed-8128-88aedd095151','2055ea1e-ea1e-11ed-8128-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c',NULL,'NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',NULL,NULL,'01','','2023-05-04 08:51:03','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('2e783460-eb1e-11ed-a4e4-88aedd095151','2e783469-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J4','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e787d0f-eb1e-11ed-a4e4-88aedd095151','2e787d1a-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J5','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e78f7a1-eb1e-11ed-a4e4-88aedd095151','2e78f7aa-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J6','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7998a0-eb1e-11ed-a4e4-88aedd095151','2e7998ab-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J7','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7a0ed4-eb1e-11ed-a4e4-88aedd095151','2e7a0ede-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J8','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7a664d-eb1e-11ed-a4e4-88aedd095151','2e7a6656-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J9','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7aca16-eb1e-11ed-a4e4-88aedd095151','2e7aca20-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J10','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7b37fc-eb1e-11ed-a4e4-88aedd095151','2e7b380b-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J2','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7c261a-eb1e-11ed-a4e4-88aedd095151','2e7c2625-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151','2e782af3-eb1e-11ed-a4e4-88aedd095151','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',70000.0000,'J1','03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('2e7cc8da-eb1e-11ed-a4e4-88aedd095151','2e7cc8ef-eb1e-11ed-a4e4-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','0f57c5b4-eb1e-11ed-a4e4-88aedd095151',NULL,'NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',NULL,NULL,'03','','2023-05-05 15:23:57','2023-05-05 00:00:00','19:30','2','A1',_binary '\0'),('30971dc2-e41c-11ed-9a9a-88aedd095151','30971dcd-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','30971406-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'C4','01','','2023-04-26 17:22:04','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('30979763-e41c-11ed-9a9a-88aedd095151','30979771-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','30971406-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'D4','01','','2023-04-26 17:22:04','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('30981ce8-e41c-11ed-9a9a-88aedd095151','30981cf6-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','','',NULL,NULL,'01','','2023-04-26 17:22:04','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('367c9944-e41c-11ed-9a9a-88aedd095151','367c9977-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','367c8bad-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'D3','01','','2023-04-26 17:22:14','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('367d133b-e41c-11ed-9a9a-88aedd095151','367d134e-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','367c8bad-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'C3','01','','2023-04-26 17:22:14','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('367d91f8-e41c-11ed-9a9a-88aedd095151','367d9227-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','','',NULL,NULL,'01','','2023-04-26 17:22:14','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('40316cbb-ea1e-11ed-8128-88aedd095151','40316cee-ea1e-11ed-8128-88aedd095151','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','4031428d-ea1e-11ed-8128-88aedd095151','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','','',140000.0000,'J1','03','','2023-05-04 08:51:56','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('40332b4a-ea1e-11ed-8128-88aedd095151','40332b6e-ea1e-11ed-8128-88aedd095151','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','4031428d-ea1e-11ed-8128-88aedd095151','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','','',140000.0000,'J2','03','','2023-05-04 08:51:56','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('4033ac47-ea1e-11ed-8128-88aedd095151','4033ac73-ea1e-11ed-8128-88aedd095151','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151',NULL,'LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','','',NULL,NULL,'03','','2023-05-04 08:51:56','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('447f4514-f58c-11ed-906e-907841e9040c','447f451e-f58c-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151','447f3a9c-f58c-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',50000.0000,'B5','01','','2023-05-18 21:57:11','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('447f7286-f58c-11ed-906e-907841e9040c','447f7292-f58c-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151','447f3a9c-f58c-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',50000.0000,'B4','01','','2023-05-18 21:57:11','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('447f9f3a-f58c-11ed-906e-907841e9040c','447f9f55-f58c-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151',NULL,'VỆ BINH DẢI NGÂN HÀ 3','Công Đoàn','0936561355',NULL,NULL,'01','','2023-05-18 21:57:11','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('46f3a8da-ea1c-11ed-8128-88aedd095151','46f3a8f1-ea1c-11ed-8128-88aedd095151','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151','46f39718-ea1c-11ed-8128-88aedd095151','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'A4','01','','2023-05-04 08:37:48','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('46f41280-ea1c-11ed-8128-88aedd095151','46f41299-ea1c-11ed-8128-88aedd095151','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151','46f39718-ea1c-11ed-8128-88aedd095151','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'A5','01','','2023-05-04 08:37:48','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('46f476e3-ea1c-11ed-8128-88aedd095151','46f476f7-ea1c-11ed-8128-88aedd095151','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151','46f39718-ea1c-11ed-8128-88aedd095151','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'B6','01','','2023-05-04 08:37:48','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('46f4bfa6-ea1c-11ed-8128-88aedd095151','46f4bfc3-ea1c-11ed-8128-88aedd095151','54861f66-6dfd-4fe4-9e5f-795e64df4f70','41247f08-ea1c-11ed-8128-88aedd095151',NULL,'VỆ BINH DẢI NGÂN HÀ 3','','',NULL,NULL,'01','','2023-05-04 08:37:48','2023-05-04 00:00:00','17:30:00','1','A1',_binary '\0'),('6128a9b9-e41c-11ed-9a9a-88aedd095151','6128a9c8-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','61289b4b-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'E7','01','','2023-04-26 17:23:25','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('612a5dd2-e41c-11ed-9a9a-88aedd095151','612a5dfd-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','61289b4b-e41c-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'F7','01','','2023-04-26 17:23:25','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('612adb31-e41c-11ed-9a9a-88aedd095151','612adb4a-e41c-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','','',NULL,NULL,'01','','2023-04-26 17:23:25','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('63559817-e82b-11ed-906e-907841e9040c','63559831-e82b-11ed-906e-907841e9040c','ac6b11da-ebef-4889-9f77-a971c292066b','7388b793-e6ff-11ed-8b5d-907841e9040c','63551d3f-e82b-11ed-906e-907841e9040c','Phim thử','Công Đoàn','0936561355',50000.0000,'A4','02','','2023-05-01 21:20:56','2023-04-13 00:00:00','18:30:00','1','A3',_binary '\0'),('6355eb08-e82b-11ed-906e-907841e9040c','6355eb18-e82b-11ed-906e-907841e9040c','ac6b11da-ebef-4889-9f77-a971c292066b','7388b793-e6ff-11ed-8b5d-907841e9040c',NULL,'Phim thử','Công Đoàn','0936561355',NULL,NULL,'02','','2023-05-01 21:20:56','2023-04-13 00:00:00','18:30:00','1','A3',_binary '\0'),('639eb4dd-fa35-11ed-906e-907841e9040c','639eb4f2-fa35-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','639d4b48-fa35-11ed-906e-907841e9040c','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Công Đoàn','0936561355',140000.0000,'D9','03','taikhoan1','2023-05-24 20:17:52','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('639f0dbb-fa35-11ed-906e-907841e9040c','639f0dca-fa35-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','639d4b48-fa35-11ed-906e-907841e9040c','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Công Đoàn','0936561355',140000.0000,'D10','03','taikhoan1','2023-05-24 20:17:52','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('639f702f-fa35-11ed-906e-907841e9040c','639f7044-fa35-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151',NULL,'LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Công Đoàn','0936561355',NULL,NULL,'03','taikhoan1','2023-05-24 20:17:52','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('6f9dbee5-0024-11ee-9013-88aedd095151','6f9dbeff-0024-11ee-9013-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151','6f9daac0-0024-11ee-9013-88aedd095151','FAST AND FURIOUS X','Công Đoàn','09090909',50000.0000,'D6','02','','2023-06-01 09:31:38','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('6f9e2981-0024-11ee-9013-88aedd095151','6f9e299c-0024-11ee-9013-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151','6f9daac0-0024-11ee-9013-88aedd095151','FAST AND FURIOUS X','Công Đoàn','09090909',50000.0000,'D5','02','','2023-06-01 09:31:38','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('6f9ee1bf-0024-11ee-9013-88aedd095151','6f9ee1d2-0024-11ee-9013-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151',NULL,'FAST AND FURIOUS X','Công Đoàn','09090909',NULL,NULL,'02','','2023-06-01 09:31:38','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('71cddfe8-fb79-11ed-816c-88aedd095151','71cddff8-fb79-11ed-816c-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151','71cdc964-fb79-11ed-816c-88aedd095151','FAST AND FURIOUS X','Minh Đoàn','0911123984',50000.0000,'E4','02','','2023-05-26 10:57:33','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('71ce7691-fb79-11ed-816c-88aedd095151','71ce76ac-fb79-11ed-816c-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151','71cdc964-fb79-11ed-816c-88aedd095151','FAST AND FURIOUS X','Minh Đoàn','0911123984',50000.0000,'F4','02','','2023-05-26 10:57:33','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('71cee177-fb79-11ed-816c-88aedd095151','71cee18d-fb79-11ed-816c-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151','71cdc964-fb79-11ed-816c-88aedd095151','FAST AND FURIOUS X','Minh Đoàn','0911123984',50000.0000,'E7','02','','2023-05-26 10:57:33','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('71cf5d6f-fb79-11ed-816c-88aedd095151','71cf5d8a-fb79-11ed-816c-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151','71cdc964-fb79-11ed-816c-88aedd095151','FAST AND FURIOUS X','Minh Đoàn','0911123984',50000.0000,'F7','02','','2023-05-26 10:57:33','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('71cfb01e-fb79-11ed-816c-88aedd095151','71cfb04d-fb79-11ed-816c-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','6af65f5a-fb79-11ed-816c-88aedd095151',NULL,'FAST AND FURIOUS X','Minh Đoàn','0911123984',NULL,NULL,'02','','2023-05-26 10:57:33','2023-05-27 00:00:00','18:30:00','1','A2',_binary '\0'),('7619e6d4-e82b-11ed-906e-907841e9040c','7619e6de-e82b-11ed-906e-907841e9040c','ac6b11da-ebef-4889-9f77-a971c292066b','7388b793-e6ff-11ed-8b5d-907841e9040c','7619de34-e82b-11ed-906e-907841e9040c','Phim thử','Công Đoàn','0936561355',50000.0000,'A5','02','','2023-05-01 21:21:28','2023-04-13 00:00:00','18:30:00','1','A3',_binary '\0'),('761bb5df-e82b-11ed-906e-907841e9040c','761bb5f3-e82b-11ed-906e-907841e9040c','ac6b11da-ebef-4889-9f77-a971c292066b','7388b793-e6ff-11ed-8b5d-907841e9040c',NULL,'Phim thử','Công Đoàn','0936561355',NULL,NULL,'02','','2023-05-01 21:21:28','2023-04-13 00:00:00','18:30:00','1','A3',_binary '\0'),('7be85adf-e98a-11ed-906e-907841e9040c','7be85aed-e98a-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c','7be829b7-e98a-11ed-906e-907841e9040c','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',110000.0000,'E6','01','','2023-05-03 15:14:11','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('7be89973-e98a-11ed-906e-907841e9040c','7be8998a-e98a-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c','7be829b7-e98a-11ed-906e-907841e9040c','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',110000.0000,'D5','01','','2023-05-03 15:14:11','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('7be8c300-e98a-11ed-906e-907841e9040c','7be8c30f-e98a-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c','7be829b7-e98a-11ed-906e-907841e9040c','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',110000.0000,'D6','01','','2023-05-03 15:14:11','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('7be8fa5a-e98a-11ed-906e-907841e9040c','7be8fa69-e98a-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c','7be829b7-e98a-11ed-906e-907841e9040c','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',110000.0000,'E5','01','','2023-05-03 15:14:11','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('7be949f6-e98a-11ed-906e-907841e9040c','7be94a0d-e98a-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf','6c03dda2-e98a-11ed-906e-907841e9040c',NULL,'NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','','',NULL,NULL,'01','','2023-05-03 15:14:11','2023-05-16 00:00:00','17:30:00','1','A2',_binary '\0'),('8610c0c2-e4b0-11ed-8328-88aedd095151','8610c0ce-e4b0-11ed-8328-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151','8610b06f-e4b0-11ed-8328-88aedd095151','PHIM ANH EM SUPER MARIO','','',NULL,'D5','01','','2023-04-27 11:03:53','2023-04-13 00:00:00','17:30:00','1','A1',_binary '\0'),('86112d55-e4b0-11ed-8328-88aedd095151','86112d68-e4b0-11ed-8328-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151','8610b06f-e4b0-11ed-8328-88aedd095151','PHIM ANH EM SUPER MARIO','','',NULL,'D4','01','','2023-04-27 11:03:53','2023-04-13 00:00:00','17:30:00','1','A1',_binary '\0'),('86119625-e4b0-11ed-8328-88aedd095151','8611964a-e4b0-11ed-8328-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151',NULL,'PHIM ANH EM SUPER MARIO','','',NULL,NULL,'01','','2023-04-27 11:03:53','2023-04-13 00:00:00','17:30:00','1','A1',_binary '\0'),('93bd16c9-f58b-11ed-906e-907841e9040c','93bd16e1-f58b-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','456e9730-ed6b-11ed-8709-88aedd095151','93bc84bc-f58b-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'D6','02','','2023-05-18 21:52:14','2023-04-04 00:00:00','18:30:00','1','A2',_binary '\0'),('93bde8f6-f58b-11ed-906e-907841e9040c','93bde909-f58b-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','456e9730-ed6b-11ed-8709-88aedd095151','93bc84bc-f58b-11ed-906e-907841e9040c','VỆ BINH DẢI NGÂN HÀ 3','','',50000.0000,'D5','02','','2023-05-18 21:52:14','2023-04-04 00:00:00','18:30:00','1','A2',_binary '\0'),('93be3a77-f58b-11ed-906e-907841e9040c','93be3a9b-f58b-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70','456e9730-ed6b-11ed-8709-88aedd095151',NULL,'VỆ BINH DẢI NGÂN HÀ 3','','',NULL,NULL,'02','','2023-05-18 21:52:14','2023-04-04 00:00:00','18:30:00','1','A2',_binary '\0'),('9dd40a0a-fa33-11ed-906e-907841e9040c','9dd40a17-fa33-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','9dd3c8f2-fa33-11ed-906e-907841e9040c','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Minh Đoàn','0911123984',140000.0000,'D5','03','','2023-05-24 20:05:11','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('9dd4b18c-fa33-11ed-906e-907841e9040c','9dd4b19d-fa33-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','9dd3c8f2-fa33-11ed-906e-907841e9040c','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Minh Đoàn','0911123984',140000.0000,'D6','03','','2023-05-24 20:05:11','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('9dd4da67-fa33-11ed-906e-907841e9040c','9dd4da7b-fa33-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151',NULL,'LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Minh Đoàn','0911123984',NULL,NULL,'03','','2023-05-24 20:05:11','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('ad0f0530-e41b-11ed-9a9a-88aedd095151','ad0f0540-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'E5','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('ad0f75b8-e41b-11ed-9a9a-88aedd095151','ad0f75c7-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'E6','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('ad0fd05f-e41b-11ed-9a9a-88aedd095151','ad0fd074-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'D6','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('ad1047ab-e41b-11ed-9a9a-88aedd095151','ad1047bf-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'D5','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('ad10aab8-e41b-11ed-9a9a-88aedd095151','ad10aacc-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'C5','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('ad10f483-e41b-11ed-9a9a-88aedd095151','ad10f491-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','ad0ef99d-e41b-11ed-9a9a-88aedd095151','Phim thử 3','','',52000.0000,'C6','01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('ad114c5d-e41b-11ed-9a9a-88aedd095151','ad114c75-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','','',NULL,NULL,'01','','2023-04-26 17:18:23','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('d37bb9de-fa33-11ed-906e-907841e9040c','d37bb9f1-fa33-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','d37a3ed2-fa33-11ed-906e-907841e9040c','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Công Đoàn','09090909',140000.0000,'D7','03','','2023-05-24 20:06:41','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('d37c07d7-fa33-11ed-906e-907841e9040c','d37c07e9-fa33-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151','d37a3ed2-fa33-11ed-906e-907841e9040c','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Công Đoàn','09090909',140000.0000,'D8','03','','2023-05-24 20:06:41','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('d37c4940-fa33-11ed-906e-907841e9040c','d37c4953-fa33-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','32d4b4d1-ea1e-11ed-8128-88aedd095151',NULL,'LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','Công Đoàn','09090909',NULL,NULL,'03','','2023-05-24 20:06:41','2023-05-04 00:00:00','19:30','1','A2',_binary '\0'),('d59d30f4-e41b-11ed-9a9a-88aedd095151','d59d3115-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','d59d12f5-e41b-11ed-9a9a-88aedd095151','Phim thử 3','Công Đoàn','0936561355',52000.0000,'C7','01','','2023-04-26 17:19:31','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('d59eeb7d-e41b-11ed-9a9a-88aedd095151','d59eebab-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151','d59d12f5-e41b-11ed-9a9a-88aedd095151','Phim thử 3','Công Đoàn','0936561355',52000.0000,'D7','01','','2023-04-26 17:19:31','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('d59f6948-e41b-11ed-9a9a-88aedd095151','d59f6975-e41b-11ed-9a9a-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b','9ea44367-e41b-11ed-9a9a-88aedd095151',NULL,'Phim thử 3','Công Đoàn','0936561355',NULL,NULL,'01','','2023-04-26 17:19:31','2023-04-30 00:00:00','17:30:00','1','A1',_binary '\0'),('f756337f-e410-11ed-9a9a-88aedd095151','f75633b3-e410-11ed-9a9a-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151','f755f2a2-e410-11ed-9a9a-88aedd095151','PHIM ANH EM SUPER MARIO','','',NULL,'E5','01','','2023-04-26 16:01:43','2023-04-13 00:00:00','17:30:00',NULL,NULL,_binary '\0'),('f7572c95-e410-11ed-9a9a-88aedd095151','f7572cb7-e410-11ed-9a9a-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151','f755f2a2-e410-11ed-9a9a-88aedd095151','PHIM ANH EM SUPER MARIO','','',NULL,'F5','01','','2023-04-26 16:01:43','2023-04-13 00:00:00','17:30:00',NULL,NULL,_binary '\0'),('f757c21d-e410-11ed-9a9a-88aedd095151','f757c24b-e410-11ed-9a9a-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','b9cbea88-e336-11ed-857f-88aedd095151',NULL,'PHIM ANH EM SUPER MARIO','','',NULL,NULL,'01','','2023-04-26 16:01:43','2023-04-13 00:00:00','17:30:00',NULL,NULL,_binary '\0');
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
INSERT INTO `language` VALUES ('EN','English'),('JP','Japanese'),('KR','Korean'),('VN','Việt Nam');
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
INSERT INTO `movie` VALUES ('3aa6c663-36d9-4797-94b9-dcd6dcc51e2e','P0001','PHIM CÚ ÚP RỔ ĐẦU TIÊN','2023-04-04 17:00:00','Masaya Fukunishi, Yoshiaki Hasegawa, Katsuhisa Hoki, Tetsu Inada, Ryota Iwasaki, Shinichiro Kamio, Mitsuaki Kanuka, Jun Kasama, Subaru Kimura,..','Takehiko Inoue, Yasuyuki Ebara','73db8507-d17b-11ed-a44f-907841e9040c','JP',NULL,'images/f2cf4678-8226-4b5a-ad7f-de62454ddda8','Bộ phim hoạt hình chuyển thể từ loạt truyện tranh “Slam Dunk” nổi tiếng của Takehiko Inoue, khắc họa quá trình trưởng thành cá nhân của những học sinh trung học cống hiến tuổi trẻ cho bóng rổ. Phim theo chân Ryota Miyagi, hậu vệ của đội bóng rổ trường trung học Shohoku. Anh có một người anh trai, Sota, hơn anh ba tuổi và là người đã truyền cảm hứng cho tình yêu bóng rổ của anh. Ryota và các đồng đội của mình là Hanamichi Sakuragi, Takenori Akagi, Hisashi Mitsui và Kaede Rukawa thách đấu nhà vô địch bóng rổ liên trường, đội bóng rổ trường trung học Sannoh. Tác giả nguyên tác Inoue phụ trách chỉ đạo và viết kịch bản.','2023-04-05 17:00:00','2023-04-19 17:00:00',NULL,NULL,120),('53a1c706-f6ac-41b4-bb24-183cf38acc42','P0031','LẬT MẶT 6: TẤM VÉ ĐỊNH MỆNH','2023-05-09 17:00:00','Lý Hải, Quốc Cường, Trung Dũng, Huy Khánh, Thanh Thức, Trần Kim Hải, Huỳnh Thi, Diệp Bảo Ngọc, Tú Tri, Quỳnh Như, Tạ Lâm, bé Thùy Linh…','Lý Hải','73db8507-d17b-11ed-a44f-907841e9040c','VN',NULL,'images/8b0cce51-6630-40da-92bf-568818d3b69e','Lật mặt 6 sẽ thuộc thể loại giật gân, tâm lý pha hành động, hài hước.','2023-05-01 17:00:00','2023-05-30 17:00:00',NULL,NULL,132),('54861f66-6dfd-4fe4-9e5f-795e64df4f70','P001','VỆ BINH DẢI NGÂN HÀ 3','2023-05-01 17:00:00','Chris Pratt, Zoe Saldana, Dave Bautista','James Gunn','73db8507-d17b-11ed-a44f-907841e9040c','JP','https://www.youtube.com/embed/LWiuzy-c2ag','images/2ea48c71-a5b6-4bc2-b861-5a1b4693c1b6','Cho dù vũ trụ này có bao la đến đâu, các Vệ Binh của chúng ta cũng không thể trốn chạy mãi mãi. Vệ Binh Dải Ngân Hà 3 dự kiến khởi chiếu tại rạp từ 03.05.2023.','2026-04-10 17:00:00','2027-05-20 17:00:00',NULL,NULL,149),('6e718478-a0c0-4425-bd2c-75a969a286ab','P0003','CREED III: TAY ĐẤM HUYỀN THOẠI','2023-03-31 17:00:00','Michael B. Jordan, Tessa Thompson, Jonathan Majors, Wood Harris, Phylicia Rashad, Mila Davis-Kent, Jose Benavidez, Selenis Leyva, Florian Munteanu','Michael B. Jordan','73db8507-d17b-11ed-a44f-907841e9040c','EN',NULL,'images/3ee7bee5-3f30-4ae9-86df-2b6f1557a3be','Sau khi thống trị thế giới quyền anh, Adonis Creed đã phát triển mạnh mẽ trong cả sự nghiệp và cuộc sống gia đình. Khi một người bạn thời thơ ấu và cựu thần đồng quyền anh, Damian (Jonathan Majors), tái xuất sau khi thụ án tù dài hạn, anh ta háo hức chứng minh rằng mình xứng đáng được trở lại võ đài. Cuộc chạm trán giữa những người bạn cũ không chỉ là một cuộc chiến trên võ đài thông thường. Để có thể chiến thắng, Adonis phải đặt tương lai của mình lên trên hết để chiến đấu với Damian — một võ sĩ không còn gì để mất.','2023-04-06 17:00:00','2023-04-19 17:00:00',NULL,NULL,117),('81ea1112-6d7f-4dee-85d8-15c75785de3c','P0002','PHIM ANH EM SUPER MARIO','2023-03-31 17:00:00','Chris Pratt, Anya Taylor-Joy, Charlie Day, …','Aaron Horvath, Michael Jelenic','73db8507-d17b-11ed-a44f-907841e9040c','EN','','images/3b8502f8-9813-4d58-8952-932622c796ef','Câu chuyện về cuộc phiêu lưu của anh em Super Mario đến vương quốc Nấm.','2023-04-05 17:00:00','2023-04-27 17:00:00',NULL,NULL,93),('8ff2ad96-1114-4c19-a164-352a8b29d8db','P0032','NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN','2023-05-31 17:00:00','Shameik Moore','Joaquim Dos Santos, Justin K. Thompson, Kemp Powers','ebed1079-002e-11ee-9013-88aedd095151','EN',NULL,'images/7d7bdc2f-4978-420e-b974-d5a30b598b8a','Miles Morales tái xuất trong phần tiếp theo của bom tấn hoạt hình từng đoạt giải Oscar - Spider-Man: Across the Spider-Verse. Sau khi gặp lại Gwen Stacy, chàng Spider-Man thân thiện đến từ Brooklyn phải du hành qua đa vũ trụ và gặp một nhóm Người Nhện chịu trách nhiệm bảo vệ các vũ trụ song song. Nhưng khi nhóm siêu anh hùng xung đột về cách xử lý một mối đe dọa mới, Miles buộc phải đọ sức với các Người Nhện khác và phải xác định lại ý nghĩa của việc trở thành một người hùng để có thể cứu những người cậu yêu thương nhất.','2023-05-31 17:00:00','2023-06-29 17:00:00',NULL,NULL,140),('a8d283ca-040b-4924-99cb-48f166e5afaf','P002','NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM','2023-05-09 17:00:00','John Francis Daley, Jonathan Goldstein','Chris Pine, Michelle Rodriguez, Regé-Jean Page','73db8507-d17b-11ed-a44f-907841e9040c','EN',NULL,'images/f9247c63-6304-4664-83a7-30e02c4d5df3','Theo chân một tên trộm quyến rũ và một nhóm những kẻ bịp bợm nghiệp dư thực hiện vụ trộm sử thi nhằm lấy lại một di vật đã mất, nhưng mọi thứ trở nên nguy hiểm khó lường hơn bao giờ hết khi họ đã chạm trán nhầm người. Ngục Tối Và Rồng: Danh Dự Của Kẻ Trộm mang thế giới huyền ảo của trò chơi nhập vai huyền thoại lên màn ảnh rộng bằng một cuộc phiêu lưu tràn ngập các màn hành động đã mắt cùng màu sắc hài hước, vui nhộn.','2023-05-01 17:00:00','2023-05-24 17:00:00',NULL,NULL,134),('adcbe5cc-7cda-4351-8ee1-e391892199c8','P001','FAST AND FURIOUS X','2023-05-20 17:00:00','Vin Diesel, Jason Momoa, Brie Larson','Louis Leterrier','ebed1079-002e-11ee-9013-88aedd095151','JP','https://www.youtube.com/embed/LWiuzy-c2ag','images/2522a4c0-e430-40e6-8b20-766cd9914ec6','Dom Toretto và gia đình của anh ấy bị trở thành mục tiêu của người con trai đầy thù hận của ông trùm ma túy Hernan Reyes','2023-05-23 17:00:00','2023-06-29 17:00:00',NULL,NULL,100),('cef32a5e-21e4-4633-b241-9fab2fab1939','P0002','NHỮNG KẺ THAO TÚNG','2023-05-09 17:00:00','Ben Affleck, Alice Braga, William Fichtner, JD Pardo','Robert Rodriguez','ebed1079-002e-11ee-9013-88aedd095151','VN',NULL,'images/7cb50430-ff13-47cf-8048-65bdab0c3c39','Phim theo chân thám tử Daniel Rourke (Ben Affleck) trong hành trình tìm kiếm cô con gái bị mất tích. Anh sớm nhận ra tất cả những chuyện bí ẩn này đều liên quan đến một người đàn ông có sức mạnh thôi miên, bẻ cong thực tại. Với sự hỗ trợ từ nhà ngoại cảm Diana Cruz (Alice Braga), Daniel bắt đầu truy đuổi hắn và phải tìm mọi cách để đưa con gái mình trở về nhà an toàn.','2023-05-03 17:00:00','2023-06-29 17:00:00',NULL,NULL,120),('de609974-d6c1-45af-ab26-517885625c6f','P0004','BIỆT ĐỘI RẤT ỔN','2023-03-31 17:00:00','Lê Khánh, Hứa Vĩ Văn, Hoàng Oanh, Quang Tuấn, Võ Tấn Phát, Nguyên Thảo, Ngọc Phước, Ngọc Hoa, Lạc Hoàng Long','Tạ Nguyên Hiệp','73db8507-d17b-11ed-a44f-907841e9040c','VN',NULL,'images/2cd6a515-46bf-4797-bc22-5d184cbd862d','BIỆT ĐỘI RẤT ỔN xoay quanh bộ đôi Quyên (Hoàng Oanh) và Phong (Hứa Vĩ Văn). Sau lần chạm trán tình cờ, bộ đôi lôi kéo Bảy Cục (Võ Tấn Phát), Bảy Súc (Nguyên Thảo), Quạu (Ngọc Phước), Quọ (Ngọc Hoa) tham gia vào phi vụ đặc biệt: Đánh tráo chiếc vòng đính hôn bằng kim cương quý giá và lật tẩy bộ mặt thật của Tuấn - chồng cũ của Quyên trong đám cưới giữa hắn và Tư Xoàn - nữ đại gia miền Tây sở hữu khối tài sản triệu đô. Màn kết hợp bất đắc dĩ của Biệt Đội Rất Ổn - Phong, Quyên và Gia Đình Cục Súc nhằm qua mắt “cô dâu, chú rể” tại khu resort sang chảnh hứa hẹn cực kỳ gay cấn, hồi hộp nhưng không kém phần hài hước, xúc động.','2023-04-06 17:00:00','2023-04-28 17:00:00',NULL,NULL,100);
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
INSERT INTO `moviecategorydetail` VALUES ('6e718478-a0c0-4425-bd2c-75a969a286ab','54687a5a-d207-11ed-afa1-0242ac120002'),('3aa6c663-36d9-4797-94b9-dcd6dcc51e2e','5e260de6-d207-11ed-afa1-0242ac120002'),('81ea1112-6d7f-4dee-85d8-15c75785de3c','5e260de6-d207-11ed-afa1-0242ac120002'),('adcbe5cc-7cda-4351-8ee1-e391892199c8','5e260de6-d207-11ed-afa1-0242ac120002'),('cef32a5e-21e4-4633-b241-9fab2fab1939','5e260de6-d207-11ed-afa1-0242ac120002'),('54861f66-6dfd-4fe4-9e5f-795e64df4f70','61aa4b93-d208-11ed-a44f-907841e9040c'),('adcbe5cc-7cda-4351-8ee1-e391892199c8','61aa4b93-d208-11ed-a44f-907841e9040c'),('53a1c706-f6ac-41b4-bb24-183cf38acc42','61ab1fc2-d208-11ed-a44f-907841e9040c'),('a8d283ca-040b-4924-99cb-48f166e5afaf','61ab1fc2-d208-11ed-a44f-907841e9040c'),('cef32a5e-21e4-4633-b241-9fab2fab1939','61ab1fc2-d208-11ed-a44f-907841e9040c'),('81ea1112-6d7f-4dee-85d8-15c75785de3c','7685b7d8-d207-11ed-afa1-0242ac120002'),('adcbe5cc-7cda-4351-8ee1-e391892199c8','7685b7d8-d207-11ed-afa1-0242ac120002'),('de609974-d6c1-45af-ab26-517885625c6f','7685b7d8-d207-11ed-afa1-0242ac120002'),('54861f66-6dfd-4fe4-9e5f-795e64df4f70','8cf95452-d207-11ed-afa1-0242ac120002'),('8ff2ad96-1114-4c19-a164-352a8b29d8db','8cf95452-d207-11ed-afa1-0242ac120002'),('adcbe5cc-7cda-4351-8ee1-e391892199c8','8cf95452-d207-11ed-afa1-0242ac120002'),('54861f66-6dfd-4fe4-9e5f-795e64df4f70','9b43e7b6-d207-11ed-afa1-0242ac120002'),('54861f66-6dfd-4fe4-9e5f-795e64df4f70','b4bb3e2e-d207-11ed-afa1-0242ac120002'),('81ea1112-6d7f-4dee-85d8-15c75785de3c','b4bb3e2e-d207-11ed-afa1-0242ac120002'),('8ff2ad96-1114-4c19-a164-352a8b29d8db','b4bb3e2e-d207-11ed-afa1-0242ac120002'),('53a1c706-f6ac-41b4-bb24-183cf38acc42','ea6a3fa5-d17b-11ed-a44f-907841e9040c'),('54861f66-6dfd-4fe4-9e5f-795e64df4f70','ea6a3fa5-d17b-11ed-a44f-907841e9040c'),('8ff2ad96-1114-4c19-a164-352a8b29d8db','ea6a3fa5-d17b-11ed-a44f-907841e9040c'),('a8d283ca-040b-4924-99cb-48f166e5afaf','ea6a3fa5-d17b-11ed-a44f-907841e9040c'),('cef32a5e-21e4-4633-b241-9fab2fab1939','ea6a3fa5-d17b-11ed-a44f-907841e9040c');
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
INSERT INTO `room` VALUES ('68610f42-dec3-11ed-8b5d-907841e9040c','A3',NULL,5,5,_binary ''),('7fc8b77d-e6ff-11ed-8b5d-907841e9040c','A2',NULL,10,10,_binary ''),('9eb34399-0048-11ee-9013-88aedd095151','A4',NULL,10,10,_binary ''),('c8210f0e-df44-11ed-bf13-88aedd095151','A1',NULL,10,10,_binary '');
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
INSERT INTO `roomcinema` VALUES ('0e4a23c0-0049-11ee-9013-88aedd095151','9eb34399-0048-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','01','2023-06-01',NULL),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','03','2023-05-05',NULL),('2f0d6024-00e8-11ee-9603-88aedd095151','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','adcbe5cc-7cda-4351-8ee1-e391892199c8','01','2023-06-02',NULL),('2f3fba62-00e8-11ee-9603-88aedd095151','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','adcbe5cc-7cda-4351-8ee1-e391892199c8','02','2023-06-02',NULL),('2f71176b-00e8-11ee-9603-88aedd095151','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','adcbe5cc-7cda-4351-8ee1-e391892199c8','03','2023-06-02',NULL),('32d4b4d1-ea1e-11ed-8128-88aedd095151','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42','03','2023-05-04',NULL),('403d56f6-004a-11ee-9013-88aedd095151','9eb34399-0048-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','02','2023-06-01',NULL),('4ee67704-0050-11ee-9013-88aedd095151','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','8ff2ad96-1114-4c19-a164-352a8b29d8db','03','2023-06-01',NULL),('4f18c3f8-0050-11ee-9013-88aedd095151','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','8ff2ad96-1114-4c19-a164-352a8b29d8db','02','2023-06-01',NULL),('5f202d06-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','01','2023-06-11',NULL),('5f5563d3-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','02','2023-06-11',NULL),('5f87539e-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','03','2023-06-11',NULL),('66f3b360-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','03','2023-06-02',NULL),('672ee774-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','02','2023-06-02',NULL),('6768bac0-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','01','2023-06-02',NULL),('68861520-e28c-11ed-a14e-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','6e718478-a0c0-4425-bd2c-75a969a286ab','01','2023-04-07',NULL),('6c03dda2-e98a-11ed-906e-907841e9040c','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf','01','2023-05-16',NULL),('6d9b62b8-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','01','2023-06-10',NULL),('6dd22ece-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','02','2023-06-10',NULL),('6e0817f6-0050-11ee-9013-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','03','2023-06-10',NULL),('730166da-004c-11ee-9013-88aedd095151','9eb34399-0048-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','03','2023-06-01',NULL),('7812e5de-0053-11ee-9013-88aedd095151','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','8ff2ad96-1114-4c19-a164-352a8b29d8db','02','2023-06-04',NULL),('784b1ba2-0053-11ee-9013-88aedd095151','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','8ff2ad96-1114-4c19-a164-352a8b29d8db','01','2023-06-04',NULL),('7882e40f-0053-11ee-9013-88aedd095151','7fc8b77d-e6ff-11ed-8b5d-907841e9040c','8ff2ad96-1114-4c19-a164-352a8b29d8db','03','2023-06-04',NULL),('820fcf75-e28c-11ed-a14e-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','6e718478-a0c0-4425-bd2c-75a969a286ab','02','2023-04-07',NULL),('87b3da12-eae3-11ed-a4e4-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','a8d283ca-040b-4924-99cb-48f166e5afaf','01','2023-05-05',NULL),('9a3f2e46-004e-11ee-9013-88aedd095151','9eb34399-0048-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','01','2023-06-02',NULL),('9a6c78bb-004e-11ee-9013-88aedd095151','9eb34399-0048-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db','02','2023-06-02',NULL),('aa98ab5e-df49-11ed-bf13-88aedd095151','68610f42-dec3-11ed-8b5d-907841e9040c','6e718478-a0c0-4425-bd2c-75a969a286ab','01','2023-04-13',NULL),('b9cbea88-e336-11ed-857f-88aedd095151','c8210f0e-df44-11ed-bf13-88aedd095151','81ea1112-6d7f-4dee-85d8-15c75785de3c','01','2023-04-13',NULL),('de38a4b9-0049-11ee-9013-88aedd095151','9eb34399-0048-11ee-9013-88aedd095151','adcbe5cc-7cda-4351-8ee1-e391892199c8','02','2023-06-01',NULL);
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
INSERT INTO `seat` VALUES ('6861c05d-dec3-11ed-8b5d-907841e9040c',1,1,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('68622d17-dec3-11ed-8b5d-907841e9040c',2,1,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6862582c-dec3-11ed-8b5d-907841e9040c',3,1,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('68632c30-dec3-11ed-8b5d-907841e9040c',4,1,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('68636e96-dec3-11ed-8b5d-907841e9040c',5,1,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,4),('6863ae1f-dec3-11ed-8b5d-907841e9040c',1,2,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6863d00b-dec3-11ed-8b5d-907841e9040c',2,2,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6863eb24-dec3-11ed-8b5d-907841e9040c',3,2,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,2),('68641151-dec3-11ed-8b5d-907841e9040c',4,2,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,3),('68642d01-dec3-11ed-8b5d-907841e9040c',5,2,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,4),('6864c3a8-dec3-11ed-8b5d-907841e9040c',1,3,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6864ebbd-dec3-11ed-8b5d-907841e9040c',2,3,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,3),('6865187e-dec3-11ed-8b5d-907841e9040c',3,3,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,2),('68653bbf-dec3-11ed-8b5d-907841e9040c',4,3,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,3),('68656e18-dec3-11ed-8b5d-907841e9040c',5,3,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,4),('6865b2c1-dec3-11ed-8b5d-907841e9040c',1,4,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6865d8b3-dec3-11ed-8b5d-907841e9040c',2,4,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('68660088-dec3-11ed-8b5d-907841e9040c',3,4,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,2),('68661b77-dec3-11ed-8b5d-907841e9040c',4,4,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,3),('6866348a-dec3-11ed-8b5d-907841e9040c',5,4,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,4),('68664d80-dec3-11ed-8b5d-907841e9040c',1,5,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('686668ff-dec3-11ed-8b5d-907841e9040c',2,5,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('68668544-dec3-11ed-8b5d-907841e9040c',3,5,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6866bfb3-dec3-11ed-8b5d-907841e9040c',4,5,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,1),('6866e537-dec3-11ed-8b5d-907841e9040c',5,5,'68610f42-dec3-11ed-8b5d-907841e9040c',NULL,4),('7fc97dd0-e6ff-11ed-8b5d-907841e9040c',1,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fc9a39c-e6ff-11ed-8b5d-907841e9040c',2,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fc9fb4f-e6ff-11ed-8b5d-907841e9040c',3,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fca7985-e6ff-11ed-8b5d-907841e9040c',4,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcaa28c-e6ff-11ed-8b5d-907841e9040c',5,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcacee4-e6ff-11ed-8b5d-907841e9040c',6,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcaf0e6-e6ff-11ed-8b5d-907841e9040c',7,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcb1c44-e6ff-11ed-8b5d-907841e9040c',8,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcb48e6-e6ff-11ed-8b5d-907841e9040c',9,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcb6969-e6ff-11ed-8b5d-907841e9040c',10,1,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fcb88cf-e6ff-11ed-8b5d-907841e9040c',1,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcba469-e6ff-11ed-8b5d-907841e9040c',2,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fcbb9fc-e6ff-11ed-8b5d-907841e9040c',3,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcbd8be-e6ff-11ed-8b5d-907841e9040c',4,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcbeed7-e6ff-11ed-8b5d-907841e9040c',5,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcc0b6e-e6ff-11ed-8b5d-907841e9040c',6,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcc308b-e6ff-11ed-8b5d-907841e9040c',7,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcc4896-e6ff-11ed-8b5d-907841e9040c',8,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcc5eae-e6ff-11ed-8b5d-907841e9040c',9,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fcc7553-e6ff-11ed-8b5d-907841e9040c',10,2,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fccc56c-e6ff-11ed-8b5d-907841e9040c',1,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fccdafb-e6ff-11ed-8b5d-907841e9040c',2,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fccee38-e6ff-11ed-8b5d-907841e9040c',3,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fcd0549-e6ff-11ed-8b5d-907841e9040c',4,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcd1f14-e6ff-11ed-8b5d-907841e9040c',5,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcd3408-e6ff-11ed-8b5d-907841e9040c',6,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcd4f6f-e6ff-11ed-8b5d-907841e9040c',7,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcd66c8-e6ff-11ed-8b5d-907841e9040c',8,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fcd8a92-e6ff-11ed-8b5d-907841e9040c',9,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcdabf9-e6ff-11ed-8b5d-907841e9040c',10,3,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcdc493-e6ff-11ed-8b5d-907841e9040c',1,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcdeb57-e6ff-11ed-8b5d-907841e9040c',2,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fce18ce-e6ff-11ed-8b5d-907841e9040c',3,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fce3c78-e6ff-11ed-8b5d-907841e9040c',4,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fce5f7a-e6ff-11ed-8b5d-907841e9040c',5,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fce7fba-e6ff-11ed-8b5d-907841e9040c',6,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcea0a1-e6ff-11ed-8b5d-907841e9040c',7,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fcecb6b-e6ff-11ed-8b5d-907841e9040c',8,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fceeff4-e6ff-11ed-8b5d-907841e9040c',9,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcf1575-e6ff-11ed-8b5d-907841e9040c',10,4,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcf3970-e6ff-11ed-8b5d-907841e9040c',1,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcf59b2-e6ff-11ed-8b5d-907841e9040c',2,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcf75e1-e6ff-11ed-8b5d-907841e9040c',3,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcf9540-e6ff-11ed-8b5d-907841e9040c',4,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fcfb829-e6ff-11ed-8b5d-907841e9040c',5,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fcfd8d1-e6ff-11ed-8b5d-907841e9040c',6,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fcff791-e6ff-11ed-8b5d-907841e9040c',7,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd01b57-e6ff-11ed-8b5d-907841e9040c',8,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd03ebf-e6ff-11ed-8b5d-907841e9040c',9,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd060c6-e6ff-11ed-8b5d-907841e9040c',10,5,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd08324-e6ff-11ed-8b5d-907841e9040c',1,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd0aaf0-e6ff-11ed-8b5d-907841e9040c',2,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd0d42c-e6ff-11ed-8b5d-907841e9040c',3,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd0f677-e6ff-11ed-8b5d-907841e9040c',4,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd11b00-e6ff-11ed-8b5d-907841e9040c',5,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd13e1b-e6ff-11ed-8b5d-907841e9040c',6,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd160dd-e6ff-11ed-8b5d-907841e9040c',7,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd181bc-e6ff-11ed-8b5d-907841e9040c',8,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd1a26a-e6ff-11ed-8b5d-907841e9040c',9,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd1c6bc-e6ff-11ed-8b5d-907841e9040c',10,6,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd1ea0b-e6ff-11ed-8b5d-907841e9040c',1,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd20bf7-e6ff-11ed-8b5d-907841e9040c',2,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd22d90-e6ff-11ed-8b5d-907841e9040c',3,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd2477a-e6ff-11ed-8b5d-907841e9040c',4,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd28825-e6ff-11ed-8b5d-907841e9040c',5,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd2ad0f-e6ff-11ed-8b5d-907841e9040c',6,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd2d01d-e6ff-11ed-8b5d-907841e9040c',7,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd2f42a-e6ff-11ed-8b5d-907841e9040c',8,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd31609-e6ff-11ed-8b5d-907841e9040c',9,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd338c2-e6ff-11ed-8b5d-907841e9040c',10,7,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd35685-e6ff-11ed-8b5d-907841e9040c',1,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd37690-e6ff-11ed-8b5d-907841e9040c',2,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd3956b-e6ff-11ed-8b5d-907841e9040c',3,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd3adc2-e6ff-11ed-8b5d-907841e9040c',4,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd3c7ca-e6ff-11ed-8b5d-907841e9040c',5,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd3e04e-e6ff-11ed-8b5d-907841e9040c',6,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd3f66d-e6ff-11ed-8b5d-907841e9040c',7,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd43b8a-e6ff-11ed-8b5d-907841e9040c',8,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd46d57-e6ff-11ed-8b5d-907841e9040c',9,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd48556-e6ff-11ed-8b5d-907841e9040c',10,8,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd4a05f-e6ff-11ed-8b5d-907841e9040c',1,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd4d80a-e6ff-11ed-8b5d-907841e9040c',2,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd4f097-e6ff-11ed-8b5d-907841e9040c',3,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd50eab-e6ff-11ed-8b5d-907841e9040c',4,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd532fd-e6ff-11ed-8b5d-907841e9040c',5,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd552b0-e6ff-11ed-8b5d-907841e9040c',6,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd56731-e6ff-11ed-8b5d-907841e9040c',7,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd57e89-e6ff-11ed-8b5d-907841e9040c',8,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd593bb-e6ff-11ed-8b5d-907841e9040c',9,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd5a873-e6ff-11ed-8b5d-907841e9040c',10,9,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd5be9f-e6ff-11ed-8b5d-907841e9040c',1,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('7fd5d856-e6ff-11ed-8b5d-907841e9040c',2,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd60311-e6ff-11ed-8b5d-907841e9040c',3,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd61a7e-e6ff-11ed-8b5d-907841e9040c',4,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd630f6-e6ff-11ed-8b5d-907841e9040c',5,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd64d79-e6ff-11ed-8b5d-907841e9040c',6,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd66157-e6ff-11ed-8b5d-907841e9040c',7,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd67caa-e6ff-11ed-8b5d-907841e9040c',8,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd69244-e6ff-11ed-8b5d-907841e9040c',9,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,1),('7fd6bfa8-e6ff-11ed-8b5d-907841e9040c',10,10,'7fc8b77d-e6ff-11ed-8b5d-907841e9040c',NULL,4),('9eb64819-0048-11ee-9013-88aedd095151',1,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eb6c6ce-0048-11ee-9013-88aedd095151',2,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eb7af3d-0048-11ee-9013-88aedd095151',3,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eb84fc8-0048-11ee-9013-88aedd095151',4,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eb8ccb8-0048-11ee-9013-88aedd095151',5,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eb94ca1-0048-11ee-9013-88aedd095151',6,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eb9b6c7-0048-11ee-9013-88aedd095151',7,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eba2998-0048-11ee-9013-88aedd095151',8,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebab50f-0048-11ee-9013-88aedd095151',9,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebb44dc-0048-11ee-9013-88aedd095151',10,1,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebb9105-0048-11ee-9013-88aedd095151',1,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebbf6af-0048-11ee-9013-88aedd095151',2,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebc6406-0048-11ee-9013-88aedd095151',3,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebcb6fa-0048-11ee-9013-88aedd095151',4,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebd4324-0048-11ee-9013-88aedd095151',5,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebdc8ee-0048-11ee-9013-88aedd095151',6,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebe1772-0048-11ee-9013-88aedd095151',7,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebe80c4-0048-11ee-9013-88aedd095151',8,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebee589-0048-11ee-9013-88aedd095151',9,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebf7513-0048-11ee-9013-88aedd095151',10,2,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ebffad8-0048-11ee-9013-88aedd095151',1,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec06afd-0048-11ee-9013-88aedd095151',2,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec0cd69-0048-11ee-9013-88aedd095151',3,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec11a84-0048-11ee-9013-88aedd095151',4,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec18985-0048-11ee-9013-88aedd095151',5,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec1fd95-0048-11ee-9013-88aedd095151',6,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec26719-0048-11ee-9013-88aedd095151',7,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec2dbf7-0048-11ee-9013-88aedd095151',8,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec36271-0048-11ee-9013-88aedd095151',9,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec3d530-0048-11ee-9013-88aedd095151',10,3,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec42902-0048-11ee-9013-88aedd095151',1,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec4a7d8-0048-11ee-9013-88aedd095151',2,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec52253-0048-11ee-9013-88aedd095151',3,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec58e4e-0048-11ee-9013-88aedd095151',4,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec5d566-0048-11ee-9013-88aedd095151',5,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec63698-0048-11ee-9013-88aedd095151',6,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec68e31-0048-11ee-9013-88aedd095151',7,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec701d6-0048-11ee-9013-88aedd095151',8,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,4),('9ec78ba5-0048-11ee-9013-88aedd095151',9,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec8200c-0048-11ee-9013-88aedd095151',10,4,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec87083-0048-11ee-9013-88aedd095151',1,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec8d83d-0048-11ee-9013-88aedd095151',2,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec951b8-0048-11ee-9013-88aedd095151',3,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ec9e970-0048-11ee-9013-88aedd095151',4,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,2),('9eca63e9-0048-11ee-9013-88aedd095151',5,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,2),('9ecaca9a-0048-11ee-9013-88aedd095151',6,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,2),('9ecb36b6-0048-11ee-9013-88aedd095151',7,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecb9da3-0048-11ee-9013-88aedd095151',8,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecbeeb9-0048-11ee-9013-88aedd095151',9,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecc682f-0048-11ee-9013-88aedd095151',10,5,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecd02cd-0048-11ee-9013-88aedd095151',1,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecd55b0-0048-11ee-9013-88aedd095151',2,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecdba4b-0048-11ee-9013-88aedd095151',3,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ece26d5-0048-11ee-9013-88aedd095151',4,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,2),('9ece7fdd-0048-11ee-9013-88aedd095151',5,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,2),('9ecf0991-0048-11ee-9013-88aedd095151',6,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,2),('9ecf8baf-0048-11ee-9013-88aedd095151',7,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ecff8fa-0048-11ee-9013-88aedd095151',8,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed044ea-0048-11ee-9013-88aedd095151',9,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed0e805-0048-11ee-9013-88aedd095151',10,6,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed16707-0048-11ee-9013-88aedd095151',1,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed1ece0-0048-11ee-9013-88aedd095151',2,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed25a13-0048-11ee-9013-88aedd095151',3,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed2abc6-0048-11ee-9013-88aedd095151',4,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,2),('9ed317a2-0048-11ee-9013-88aedd095151',5,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,2),('9ed37112-0048-11ee-9013-88aedd095151',6,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,2),('9ed3ee73-0048-11ee-9013-88aedd095151',7,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed47f30-0048-11ee-9013-88aedd095151',8,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed4eb1a-0048-11ee-9013-88aedd095151',9,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed53949-0048-11ee-9013-88aedd095151',10,7,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed5a1bf-0048-11ee-9013-88aedd095151',1,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed610d9-0048-11ee-9013-88aedd095151',2,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed664c5-0048-11ee-9013-88aedd095151',3,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed6f29b-0048-11ee-9013-88aedd095151',4,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed78e7a-0048-11ee-9013-88aedd095151',5,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed7f9e1-0048-11ee-9013-88aedd095151',6,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed845df-0048-11ee-9013-88aedd095151',7,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed949e8-0048-11ee-9013-88aedd095151',8,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ed9c389-0048-11ee-9013-88aedd095151',9,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eda119f-0048-11ee-9013-88aedd095151',10,8,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eda77a3-0048-11ee-9013-88aedd095151',1,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edae63a-0048-11ee-9013-88aedd095151',2,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edb2f45-0048-11ee-9013-88aedd095151',3,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edbabbc-0048-11ee-9013-88aedd095151',4,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edc2dc0-0048-11ee-9013-88aedd095151',5,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edc82a6-0048-11ee-9013-88aedd095151',6,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edcea7a-0048-11ee-9013-88aedd095151',7,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edd61a8-0048-11ee-9013-88aedd095151',8,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eddb4df-0048-11ee-9013-88aedd095151',9,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ede6a8d-0048-11ee-9013-88aedd095151',10,9,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9eded53f-0048-11ee-9013-88aedd095151',1,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edf7d09-0048-11ee-9013-88aedd095151',2,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9edfe890-0048-11ee-9013-88aedd095151',3,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee041e4-0048-11ee-9013-88aedd095151',4,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee0b9eb-0048-11ee-9013-88aedd095151',5,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee1370c-0048-11ee-9013-88aedd095151',6,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee1a2b0-0048-11ee-9013-88aedd095151',7,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee1e9f0-0048-11ee-9013-88aedd095151',8,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee24f3f-0048-11ee-9013-88aedd095151',9,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('9ee2987b-0048-11ee-9013-88aedd095151',10,10,'9eb34399-0048-11ee-9013-88aedd095151',NULL,1),('c82235b7-df44-11ed-bf13-88aedd095151',1,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82349f2-df44-11ed-bf13-88aedd095151',2,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c823ee79-df44-11ed-bf13-88aedd095151',3,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82546b4-df44-11ed-bf13-88aedd095151',4,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c825d851-df44-11ed-bf13-88aedd095151',5,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8263b71-df44-11ed-bf13-88aedd095151',6,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8269ef3-df44-11ed-bf13-88aedd095151',7,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c826ea24-df44-11ed-bf13-88aedd095151',8,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82753d2-df44-11ed-bf13-88aedd095151',9,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8297558-df44-11ed-bf13-88aedd095151',10,1,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c829e318-df44-11ed-bf13-88aedd095151',1,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82a5fbd-df44-11ed-bf13-88aedd095151',2,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82ac3bf-df44-11ed-bf13-88aedd095151',3,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82b12f5-df44-11ed-bf13-88aedd095151',4,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82b8133-df44-11ed-bf13-88aedd095151',5,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82bdd59-df44-11ed-bf13-88aedd095151',6,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82c531f-df44-11ed-bf13-88aedd095151',7,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82cb7b8-df44-11ed-bf13-88aedd095151',8,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82d24bf-df44-11ed-bf13-88aedd095151',9,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c82dc61a-df44-11ed-bf13-88aedd095151',10,2,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c82e3e86-df44-11ed-bf13-88aedd095151',1,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,4),('c82ea876-df44-11ed-bf13-88aedd095151',2,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,4),('c82f0966-df44-11ed-bf13-88aedd095151',3,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,4),('c82f541f-df44-11ed-bf13-88aedd095151',4,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,4),('c82fbbbd-df44-11ed-bf13-88aedd095151',5,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,4),('c82ff792-df44-11ed-bf13-88aedd095151',6,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,4),('c8304df2-df44-11ed-bf13-88aedd095151',7,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,4),('c830a6e9-df44-11ed-bf13-88aedd095151',8,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,4),('c8312058-df44-11ed-bf13-88aedd095151',9,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,4),('c8318925-df44-11ed-bf13-88aedd095151',10,3,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,4),('c831de11-df44-11ed-bf13-88aedd095151',1,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8323bb2-df44-11ed-bf13-88aedd095151',2,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83281eb-df44-11ed-bf13-88aedd095151',3,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c832ef64-df44-11ed-bf13-88aedd095151',4,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83360de-df44-11ed-bf13-88aedd095151',5,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c833cee1-df44-11ed-bf13-88aedd095151',6,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8344419-df44-11ed-bf13-88aedd095151',7,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c834bc6d-df44-11ed-bf13-88aedd095151',8,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8352580-df44-11ed-bf13-88aedd095151',9,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8356f55-df44-11ed-bf13-88aedd095151',10,4,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c835d548-df44-11ed-bf13-88aedd095151',1,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8363653-df44-11ed-bf13-88aedd095151',2,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c836c509-df44-11ed-bf13-88aedd095151',3,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83745e5-df44-11ed-bf13-88aedd095151',4,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c837b4ea-df44-11ed-bf13-88aedd095151',5,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c837fb3d-df44-11ed-bf13-88aedd095151',6,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8386c20-df44-11ed-bf13-88aedd095151',7,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c838dc77-df44-11ed-bf13-88aedd095151',8,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83934c9-df44-11ed-bf13-88aedd095151',9,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c839aee5-df44-11ed-bf13-88aedd095151',10,5,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c83ae595-df44-11ed-bf13-88aedd095151',1,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83b719f-df44-11ed-bf13-88aedd095151',2,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83be54a-df44-11ed-bf13-88aedd095151',3,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83c3cd9-df44-11ed-bf13-88aedd095151',4,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83c9d81-df44-11ed-bf13-88aedd095151',5,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83cddaf-df44-11ed-bf13-88aedd095151',6,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83d3cf0-df44-11ed-bf13-88aedd095151',7,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83db29c-df44-11ed-bf13-88aedd095151',8,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83e0810-df44-11ed-bf13-88aedd095151',9,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83e8979-df44-11ed-bf13-88aedd095151',10,6,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c83f06b3-df44-11ed-bf13-88aedd095151',1,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83f45da-df44-11ed-bf13-88aedd095151',2,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83fa773-df44-11ed-bf13-88aedd095151',3,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c83ff7bc-df44-11ed-bf13-88aedd095151',4,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c840a20b-df44-11ed-bf13-88aedd095151',5,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8415a61-df44-11ed-bf13-88aedd095151',6,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c841c211-df44-11ed-bf13-88aedd095151',7,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c842212e-df44-11ed-bf13-88aedd095151',8,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8428e67-df44-11ed-bf13-88aedd095151',9,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c842e26a-df44-11ed-bf13-88aedd095151',10,7,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c8435ccc-df44-11ed-bf13-88aedd095151',1,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c843d6b0-df44-11ed-bf13-88aedd095151',2,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8442356-df44-11ed-bf13-88aedd095151',3,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8448e95-df44-11ed-bf13-88aedd095151',4,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c844d440-df44-11ed-bf13-88aedd095151',5,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8454504-df44-11ed-bf13-88aedd095151',6,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c845b271-df44-11ed-bf13-88aedd095151',7,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84611d4-df44-11ed-bf13-88aedd095151',8,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8468d4d-df44-11ed-bf13-88aedd095151',9,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c846fc34-df44-11ed-bf13-88aedd095151',10,8,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c8474cb0-df44-11ed-bf13-88aedd095151',1,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c847f0d0-df44-11ed-bf13-88aedd095151',2,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8485afe-df44-11ed-bf13-88aedd095151',3,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c848c8ab-df44-11ed-bf13-88aedd095151',4,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84919b5-df44-11ed-bf13-88aedd095151',5,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c8498382-df44-11ed-bf13-88aedd095151',6,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c849e7bb-df44-11ed-bf13-88aedd095151',7,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84a3804-df44-11ed-bf13-88aedd095151',8,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84aa18b-df44-11ed-bf13-88aedd095151',9,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84af718-df44-11ed-bf13-88aedd095151',10,9,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2),('c84b7656-df44-11ed-bf13-88aedd095151',1,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84be33d-df44-11ed-bf13-88aedd095151',2,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84c2fc2-df44-11ed-bf13-88aedd095151',3,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84c98aa-df44-11ed-bf13-88aedd095151',4,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84d0a82-df44-11ed-bf13-88aedd095151',5,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84d58d0-df44-11ed-bf13-88aedd095151',6,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84e1115-df44-11ed-bf13-88aedd095151',7,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84e8854-df44-11ed-bf13-88aedd095151',8,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84ef1e2-df44-11ed-bf13-88aedd095151',9,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,1),('c84f3d6b-df44-11ed-bf13-88aedd095151',10,10,'c8210f0e-df44-11ed-bf13-88aedd095151',NULL,2);
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
INSERT INTO `statusroomcinema` VALUES ('101542fe-d808-11ed-9a6b-88aedd095151',1,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,1,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',1,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,2,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',1,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,3,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',1,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,4,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',1,5,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',2,5,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',3,5,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',4,5,1,NULL),('101542fe-d808-11ed-9a6b-88aedd095151',5,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,1,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,2,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,3,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,3,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,3,0,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,3,0,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,3,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,4,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',1,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',2,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',3,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',4,5,1,NULL),('dbebc769-d813-11ed-9a6b-88aedd095151',5,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,1,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,1,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,1,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,1,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,1,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,1,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,2,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,2,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,3,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,3,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,4,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,4,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,4,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,4,0,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,4,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,4,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,5,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',1,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',2,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',3,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',4,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',5,6,1,NULL),('08cad548-d815-11ed-9a6b-88aedd095151',6,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,1,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,2,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,3,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,4,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,5,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',1,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',2,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',3,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',4,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',5,6,1,NULL),('d5df01a9-d81a-11ed-9a6b-88aedd095151',6,6,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,1,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,2,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,3,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,4,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',1,5,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',2,5,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',3,5,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',4,5,1,NULL),('fa33de94-ddf1-11ed-8b5d-907841e9040c',5,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,1,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,2,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,3,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,4,0,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,4,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,5,0,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,5,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',1,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',2,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',3,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',4,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',5,6,1,NULL),('82195007-ddf5-11ed-8b5d-907841e9040c',6,6,1,NULL),('25cba963-df1a-11ed-bf13-88aedd095151',1,1,1,NULL),('a626e44a-df1a-11ed-bf13-88aedd095151',1,1,1,NULL),('952a45bf-df1c-11ed-bf13-88aedd095151',1,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,1,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',1,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,2,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',1,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,3,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',1,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,4,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',1,5,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',2,5,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',3,5,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',4,5,1,1),('952a45bf-df1c-11ed-bf13-88aedd095151',5,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,1,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,2,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,3,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,4,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',1,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',2,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',3,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',4,5,1,1),('9086de66-df1d-11ed-bf13-88aedd095151',5,5,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',2,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',3,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',4,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',5,1,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',2,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',3,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',4,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',5,2,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,3,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',2,3,0,2),('6c6980ff-df36-11ed-bf13-88aedd095151',3,3,0,2),('6c6980ff-df36-11ed-bf13-88aedd095151',4,3,0,2),('6c6980ff-df36-11ed-bf13-88aedd095151',5,3,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,4,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',2,4,0,3),('6c6980ff-df36-11ed-bf13-88aedd095151',3,4,0,3),('6c6980ff-df36-11ed-bf13-88aedd095151',4,4,0,3),('6c6980ff-df36-11ed-bf13-88aedd095151',5,4,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',1,5,1,4),('6c6980ff-df36-11ed-bf13-88aedd095151',2,5,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',3,5,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',4,5,1,1),('6c6980ff-df36-11ed-bf13-88aedd095151',5,5,1,4),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,1,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,2,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,2,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,2,0,3),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,2,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,2,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,3,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,3,1,2),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,3,1,2),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,3,1,2),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,3,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,4,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,4,0,3),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,4,0,3),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,4,0,3),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,4,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',1,5,1,4),('9ba3ddbf-df38-11ed-bf13-88aedd095151',2,5,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',3,5,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',4,5,1,1),('9ba3ddbf-df38-11ed-bf13-88aedd095151',5,5,1,4),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,1,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,2,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,3,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,4,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,5,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,6,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,7,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,8,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,9,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',1,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',2,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',3,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',4,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',5,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',6,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',7,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',8,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',9,10,1,1),('d0cb1fb5-df44-11ed-bf13-88aedd095151',10,10,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,1,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,2,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,2,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,2,1,3),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,2,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,2,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,3,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,3,1,2),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,3,1,2),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,3,1,2),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,3,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,4,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,4,1,3),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,4,1,3),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,4,1,3),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,4,1,1),('aa98ab5e-df49-11ed-bf13-88aedd095151',1,5,1,4),('aa98ab5e-df49-11ed-bf13-88aedd095151',2,5,1,4),('aa98ab5e-df49-11ed-bf13-88aedd095151',3,5,1,4),('aa98ab5e-df49-11ed-bf13-88aedd095151',4,5,1,4),('aa98ab5e-df49-11ed-bf13-88aedd095151',5,5,1,4),('68861520-e28c-11ed-a14e-88aedd095151',1,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,1,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,2,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,3,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,4,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,5,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,6,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,7,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,8,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,9,1,1),('68861520-e28c-11ed-a14e-88aedd095151',1,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',2,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',3,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',4,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',5,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',6,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',7,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',8,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',9,10,1,1),('68861520-e28c-11ed-a14e-88aedd095151',10,10,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,1,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,2,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,3,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,4,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,5,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,6,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,7,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,8,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',2,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',3,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',4,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',5,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',6,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',7,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',8,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',9,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',10,9,1,1),('820fcf75-e28c-11ed-a14e-88aedd095151',1,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',2,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',3,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',4,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',5,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',6,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',7,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',8,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',9,10,0,2),('820fcf75-e28c-11ed-a14e-88aedd095151',10,10,0,2),('3e939490-e336-11ed-857f-88aedd095151',1,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',2,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',3,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',4,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',5,1,1,1),('3e939490-e336-11ed-857f-88aedd095151',1,2,1,1),('3e939490-e336-11ed-857f-88aedd095151',2,2,1,1),('3e939490-e336-11ed-857f-88aedd095151',3,2,1,3),('3e939490-e336-11ed-857f-88aedd095151',4,2,1,1),('3e939490-e336-11ed-857f-88aedd095151',5,2,1,1),('3e939490-e336-11ed-857f-88aedd095151',1,3,1,1),('3e939490-e336-11ed-857f-88aedd095151',2,3,1,2),('3e939490-e336-11ed-857f-88aedd095151',3,3,0,2),('3e939490-e336-11ed-857f-88aedd095151',4,3,1,2),('3e939490-e336-11ed-857f-88aedd095151',5,3,1,1),('3e939490-e336-11ed-857f-88aedd095151',1,4,1,1),('3e939490-e336-11ed-857f-88aedd095151',2,4,1,3),('3e939490-e336-11ed-857f-88aedd095151',3,4,1,3),('3e939490-e336-11ed-857f-88aedd095151',4,4,1,3),('3e939490-e336-11ed-857f-88aedd095151',5,4,1,1),('3e939490-e336-11ed-857f-88aedd095151',1,5,1,4),('3e939490-e336-11ed-857f-88aedd095151',2,5,1,4),('3e939490-e336-11ed-857f-88aedd095151',3,5,1,4),('3e939490-e336-11ed-857f-88aedd095151',4,5,1,4),('3e939490-e336-11ed-857f-88aedd095151',5,5,1,4),('4bdb694a-e336-11ed-857f-88aedd095151',1,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,1,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,2,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,3,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,4,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,5,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,6,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,7,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,8,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',2,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',3,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',4,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',5,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',6,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',7,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',8,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',9,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',10,9,1,1),('4bdb694a-e336-11ed-857f-88aedd095151',1,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',2,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',3,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',4,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',5,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',6,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',7,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',8,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',9,10,1,2),('4bdb694a-e336-11ed-857f-88aedd095151',10,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',1,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,1,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,2,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,3,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,4,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,4,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,4,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,4,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,4,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,5,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,5,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,5,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,5,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,6,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,6,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,6,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,6,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,7,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,7,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,8,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,8,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',2,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',3,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',4,9,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',5,9,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',6,9,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',7,9,0,1),('b9cbea88-e336-11ed-857f-88aedd095151',8,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',9,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',10,9,1,1),('b9cbea88-e336-11ed-857f-88aedd095151',1,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',2,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',3,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',4,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',5,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',6,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',7,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',8,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',9,10,1,2),('b9cbea88-e336-11ed-857f-88aedd095151',10,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,1,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,2,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,3,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,3,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,4,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,4,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,5,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,5,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,5,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,5,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,6,0,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,6,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,7,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,8,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,9,1,1),('9ea44367-e41b-11ed-9a9a-88aedd095151',1,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',2,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',3,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',4,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',5,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',6,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',7,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',8,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',9,10,1,2),('9ea44367-e41b-11ed-9a9a-88aedd095151',10,10,1,2),('7388b793-e6ff-11ed-8b5d-907841e9040c',1,1,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',2,1,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',3,1,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',4,1,0,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',5,1,0,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',1,2,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',2,2,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',3,2,1,3),('7388b793-e6ff-11ed-8b5d-907841e9040c',4,2,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',5,2,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',1,3,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',2,3,1,2),('7388b793-e6ff-11ed-8b5d-907841e9040c',3,3,1,2),('7388b793-e6ff-11ed-8b5d-907841e9040c',4,3,1,2),('7388b793-e6ff-11ed-8b5d-907841e9040c',5,3,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',1,4,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',2,4,1,3),('7388b793-e6ff-11ed-8b5d-907841e9040c',3,4,1,3),('7388b793-e6ff-11ed-8b5d-907841e9040c',4,4,1,3),('7388b793-e6ff-11ed-8b5d-907841e9040c',5,4,1,1),('7388b793-e6ff-11ed-8b5d-907841e9040c',1,5,1,4),('7388b793-e6ff-11ed-8b5d-907841e9040c',2,5,1,4),('7388b793-e6ff-11ed-8b5d-907841e9040c',3,5,1,4),('7388b793-e6ff-11ed-8b5d-907841e9040c',4,5,1,4),('7388b793-e6ff-11ed-8b5d-907841e9040c',5,5,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',1,1,0,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,1,0,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,1,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,1,0,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,1,0,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,1,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,1,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,1,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,1,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,1,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,2,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,2,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,3,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,3,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,4,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,4,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,5,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,5,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,6,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,6,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,7,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,7,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,8,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,8,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',2,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',3,9,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',5,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',6,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',7,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',8,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',9,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',10,9,1,1),('0bdce2b6-e987-11ed-906e-907841e9040c',1,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',2,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',3,10,1,4),('0bdce2b6-e987-11ed-906e-907841e9040c',4,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',5,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',6,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',7,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',8,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',9,10,1,2),('0bdce2b6-e987-11ed-906e-907841e9040c',10,10,1,2),('6c03dda2-e98a-11ed-906e-907841e9040c',1,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,1,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,2,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,3,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,4,0,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,4,0,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,4,0,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,4,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,5,0,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,5,0,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,5,0,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,5,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,6,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,7,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,8,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,9,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',1,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',2,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',3,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',4,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',5,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',6,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',7,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',8,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',9,10,1,1),('6c03dda2-e98a-11ed-906e-907841e9040c',10,10,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,1,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,1,0,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,1,0,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,1,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,2,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,2,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,2,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,2,0,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,2,0,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,2,0,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,2,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,2,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,2,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,2,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,3,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,3,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,4,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,4,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,5,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,5,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,6,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,6,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,7,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,7,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,8,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,8,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',2,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',3,9,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',5,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',6,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',7,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',8,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',9,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',10,9,1,1),('41247f08-ea1c-11ed-8128-88aedd095151',1,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',2,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',3,10,1,4),('41247f08-ea1c-11ed-8128-88aedd095151',4,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',5,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',6,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',7,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',8,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',9,10,1,2),('41247f08-ea1c-11ed-8128-88aedd095151',10,10,1,2),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,1,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,2,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,3,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,4,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,4,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,4,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,4,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,4,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,4,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,4,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,4,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,4,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,4,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,5,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,6,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,7,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,8,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,9,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',1,10,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',2,10,0,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',3,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',4,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',5,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',6,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',7,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',8,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',9,10,1,1),('32d4b4d1-ea1e-11ed-8128-88aedd095151',10,10,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,1,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,1,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,2,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,2,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,3,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,3,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,4,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,4,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,5,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,5,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,6,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,6,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,7,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,7,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,8,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,8,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,9,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,9,1,1),('87b3da12-eae3-11ed-a4e4-88aedd095151',1,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',2,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',3,10,1,4),('87b3da12-eae3-11ed-a4e4-88aedd095151',4,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',5,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',6,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',7,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',8,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',9,10,1,2),('87b3da12-eae3-11ed-a4e4-88aedd095151',10,10,1,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,1,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,1,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,2,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,2,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,3,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,3,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,4,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,4,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,5,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,5,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,6,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,6,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,7,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,7,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,8,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,8,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,9,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,9,1,1),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',1,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',2,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',3,10,1,4),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',4,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',5,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',6,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',7,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',8,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',9,10,0,2),('0f57c5b4-eb1e-11ed-a4e4-88aedd095151',10,10,0,2),('456e9730-ed6b-11ed-8709-88aedd095151',1,1,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',2,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,1,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,1,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',1,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,2,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',3,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,2,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',10,2,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,3,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,3,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,3,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',4,3,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,3,0,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,3,0,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,3,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,3,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',9,3,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,3,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,4,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,4,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,4,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,4,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',5,4,0,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,4,0,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,4,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',8,4,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,4,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,4,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,5,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',6,5,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',7,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,5,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,6,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',6,6,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',7,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,6,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,7,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',5,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,7,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',8,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,7,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,8,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',4,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,8,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',9,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,8,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',2,9,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',3,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,9,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',10,9,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',1,10,1,4),('456e9730-ed6b-11ed-8709-88aedd095151',2,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',3,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',4,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',5,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',6,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',7,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',8,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',9,10,1,1),('456e9730-ed6b-11ed-8709-88aedd095151',10,10,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',1,1,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',2,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,1,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,1,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',1,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,2,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',3,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,2,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',10,2,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,3,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',4,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,3,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',9,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,3,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,4,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,4,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,4,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,4,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',5,4,0,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,4,0,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,4,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',8,4,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,4,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,4,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,5,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,5,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,5,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,5,0,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,5,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',6,5,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',7,5,0,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,5,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,5,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,5,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,6,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,6,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,6,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,6,0,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,6,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',6,6,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',7,6,0,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,6,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,6,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,6,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,7,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',5,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,7,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',8,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,7,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,8,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',4,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,8,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',9,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,8,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',2,9,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',3,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,9,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',10,9,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',1,10,1,4),('6af65f5a-fb79-11ed-816c-88aedd095151',2,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',3,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',4,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',5,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',6,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',7,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',8,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',9,10,1,1),('6af65f5a-fb79-11ed-816c-88aedd095151',10,10,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',1,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,1,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,1,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,2,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,2,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,3,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,3,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,4,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,4,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,4,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,4,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,4,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',6,4,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',7,4,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',8,4,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,4,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,4,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,5,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,5,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,5,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,5,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,5,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',6,5,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',7,5,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',8,5,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,5,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,5,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,6,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,6,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,6,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,6,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,6,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',6,6,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',7,6,0,2),('0e4a23c0-0049-11ee-9013-88aedd095151',8,6,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,6,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,6,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,7,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,7,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,8,1,4),('0e4a23c0-0049-11ee-9013-88aedd095151',5,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,8,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',5,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,9,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',1,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',2,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',3,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',4,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',5,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',6,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',7,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',8,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',9,10,1,1),('0e4a23c0-0049-11ee-9013-88aedd095151',10,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,1,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,1,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,2,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,2,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,3,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,3,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,4,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,4,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,4,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,4,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,4,1,2),('de38a4b9-0049-11ee-9013-88aedd095151',6,4,1,2),('de38a4b9-0049-11ee-9013-88aedd095151',7,4,1,2),('de38a4b9-0049-11ee-9013-88aedd095151',8,4,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,4,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,4,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,5,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,5,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,5,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,5,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,5,1,2),('de38a4b9-0049-11ee-9013-88aedd095151',6,5,1,2),('de38a4b9-0049-11ee-9013-88aedd095151',7,5,1,2),('de38a4b9-0049-11ee-9013-88aedd095151',8,5,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,5,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,5,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,6,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,6,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,6,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,6,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,6,1,2),('de38a4b9-0049-11ee-9013-88aedd095151',6,6,1,2),('de38a4b9-0049-11ee-9013-88aedd095151',7,6,1,2),('de38a4b9-0049-11ee-9013-88aedd095151',8,6,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,6,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,6,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,7,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,7,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,8,1,4),('de38a4b9-0049-11ee-9013-88aedd095151',5,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,8,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',5,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,9,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',1,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',2,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',3,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',4,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',5,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',6,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',7,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',8,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',9,10,1,1),('de38a4b9-0049-11ee-9013-88aedd095151',10,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,1,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,1,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,2,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,2,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,3,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,3,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,4,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,4,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,4,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,4,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,4,1,2),('1baa5735-004a-11ee-9013-88aedd095151',6,4,1,2),('1baa5735-004a-11ee-9013-88aedd095151',7,4,1,2),('1baa5735-004a-11ee-9013-88aedd095151',8,4,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,4,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,4,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,5,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,5,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,5,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,5,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,5,1,2),('1baa5735-004a-11ee-9013-88aedd095151',6,5,1,2),('1baa5735-004a-11ee-9013-88aedd095151',7,5,1,2),('1baa5735-004a-11ee-9013-88aedd095151',8,5,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,5,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,5,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,6,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,6,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,6,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,6,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,6,1,2),('1baa5735-004a-11ee-9013-88aedd095151',6,6,1,2),('1baa5735-004a-11ee-9013-88aedd095151',7,6,1,2),('1baa5735-004a-11ee-9013-88aedd095151',8,6,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,6,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,6,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,7,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,7,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,8,1,4),('1baa5735-004a-11ee-9013-88aedd095151',5,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,8,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',5,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,9,1,1),('1baa5735-004a-11ee-9013-88aedd095151',1,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',2,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',3,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',4,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',5,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',6,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',7,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',8,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',9,10,1,1),('1baa5735-004a-11ee-9013-88aedd095151',10,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,1,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,1,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,2,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,2,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,3,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,3,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,4,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,4,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,4,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,4,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,4,1,2),('403d56f6-004a-11ee-9013-88aedd095151',6,4,1,2),('403d56f6-004a-11ee-9013-88aedd095151',7,4,1,2),('403d56f6-004a-11ee-9013-88aedd095151',8,4,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,4,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,4,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,5,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,5,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,5,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,5,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,5,1,2),('403d56f6-004a-11ee-9013-88aedd095151',6,5,1,2),('403d56f6-004a-11ee-9013-88aedd095151',7,5,1,2),('403d56f6-004a-11ee-9013-88aedd095151',8,5,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,5,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,5,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,6,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,6,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,6,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,6,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,6,1,2),('403d56f6-004a-11ee-9013-88aedd095151',6,6,1,2),('403d56f6-004a-11ee-9013-88aedd095151',7,6,1,2),('403d56f6-004a-11ee-9013-88aedd095151',8,6,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,6,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,6,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,7,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,7,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,8,1,4),('403d56f6-004a-11ee-9013-88aedd095151',5,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,8,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',5,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,9,1,1),('403d56f6-004a-11ee-9013-88aedd095151',1,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',2,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',3,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',4,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',5,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',6,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',7,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',8,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',9,10,1,1),('403d56f6-004a-11ee-9013-88aedd095151',10,10,1,1),('730166da-004c-11ee-9013-88aedd095151',1,1,1,1),('730166da-004c-11ee-9013-88aedd095151',2,1,1,1),('730166da-004c-11ee-9013-88aedd095151',3,1,1,1),('730166da-004c-11ee-9013-88aedd095151',4,1,1,4),('730166da-004c-11ee-9013-88aedd095151',5,1,1,1),('730166da-004c-11ee-9013-88aedd095151',6,1,1,1),('730166da-004c-11ee-9013-88aedd095151',7,1,1,1),('730166da-004c-11ee-9013-88aedd095151',8,1,1,1),('730166da-004c-11ee-9013-88aedd095151',9,1,1,1),('730166da-004c-11ee-9013-88aedd095151',10,1,1,1),('730166da-004c-11ee-9013-88aedd095151',1,2,1,1),('730166da-004c-11ee-9013-88aedd095151',2,2,1,1),('730166da-004c-11ee-9013-88aedd095151',3,2,1,1),('730166da-004c-11ee-9013-88aedd095151',4,2,1,4),('730166da-004c-11ee-9013-88aedd095151',5,2,1,1),('730166da-004c-11ee-9013-88aedd095151',6,2,1,1),('730166da-004c-11ee-9013-88aedd095151',7,2,1,1),('730166da-004c-11ee-9013-88aedd095151',8,2,1,1),('730166da-004c-11ee-9013-88aedd095151',9,2,1,1),('730166da-004c-11ee-9013-88aedd095151',10,2,1,1),('730166da-004c-11ee-9013-88aedd095151',1,3,1,1),('730166da-004c-11ee-9013-88aedd095151',2,3,1,1),('730166da-004c-11ee-9013-88aedd095151',3,3,1,1),('730166da-004c-11ee-9013-88aedd095151',4,3,1,4),('730166da-004c-11ee-9013-88aedd095151',5,3,1,1),('730166da-004c-11ee-9013-88aedd095151',6,3,1,1),('730166da-004c-11ee-9013-88aedd095151',7,3,1,1),('730166da-004c-11ee-9013-88aedd095151',8,3,1,1),('730166da-004c-11ee-9013-88aedd095151',9,3,1,1),('730166da-004c-11ee-9013-88aedd095151',10,3,1,1),('730166da-004c-11ee-9013-88aedd095151',1,4,1,1),('730166da-004c-11ee-9013-88aedd095151',2,4,1,1),('730166da-004c-11ee-9013-88aedd095151',3,4,1,1),('730166da-004c-11ee-9013-88aedd095151',4,4,1,4),('730166da-004c-11ee-9013-88aedd095151',5,4,1,2),('730166da-004c-11ee-9013-88aedd095151',6,4,1,2),('730166da-004c-11ee-9013-88aedd095151',7,4,1,2),('730166da-004c-11ee-9013-88aedd095151',8,4,1,1),('730166da-004c-11ee-9013-88aedd095151',9,4,1,1),('730166da-004c-11ee-9013-88aedd095151',10,4,1,1),('730166da-004c-11ee-9013-88aedd095151',1,5,1,1),('730166da-004c-11ee-9013-88aedd095151',2,5,1,1),('730166da-004c-11ee-9013-88aedd095151',3,5,1,1),('730166da-004c-11ee-9013-88aedd095151',4,5,1,4),('730166da-004c-11ee-9013-88aedd095151',5,5,1,2),('730166da-004c-11ee-9013-88aedd095151',6,5,1,2),('730166da-004c-11ee-9013-88aedd095151',7,5,1,2),('730166da-004c-11ee-9013-88aedd095151',8,5,1,1),('730166da-004c-11ee-9013-88aedd095151',9,5,1,1),('730166da-004c-11ee-9013-88aedd095151',10,5,1,1),('730166da-004c-11ee-9013-88aedd095151',1,6,1,1),('730166da-004c-11ee-9013-88aedd095151',2,6,1,1),('730166da-004c-11ee-9013-88aedd095151',3,6,1,1),('730166da-004c-11ee-9013-88aedd095151',4,6,1,4),('730166da-004c-11ee-9013-88aedd095151',5,6,1,2),('730166da-004c-11ee-9013-88aedd095151',6,6,1,2),('730166da-004c-11ee-9013-88aedd095151',7,6,1,2),('730166da-004c-11ee-9013-88aedd095151',8,6,1,1),('730166da-004c-11ee-9013-88aedd095151',9,6,1,1),('730166da-004c-11ee-9013-88aedd095151',10,6,1,1),('730166da-004c-11ee-9013-88aedd095151',1,7,1,1),('730166da-004c-11ee-9013-88aedd095151',2,7,1,1),('730166da-004c-11ee-9013-88aedd095151',3,7,1,1),('730166da-004c-11ee-9013-88aedd095151',4,7,1,4),('730166da-004c-11ee-9013-88aedd095151',5,7,1,1),('730166da-004c-11ee-9013-88aedd095151',6,7,1,1),('730166da-004c-11ee-9013-88aedd095151',7,7,1,1),('730166da-004c-11ee-9013-88aedd095151',8,7,1,1),('730166da-004c-11ee-9013-88aedd095151',9,7,1,1),('730166da-004c-11ee-9013-88aedd095151',10,7,1,1),('730166da-004c-11ee-9013-88aedd095151',1,8,1,1),('730166da-004c-11ee-9013-88aedd095151',2,8,1,1),('730166da-004c-11ee-9013-88aedd095151',3,8,1,1),('730166da-004c-11ee-9013-88aedd095151',4,8,1,4),('730166da-004c-11ee-9013-88aedd095151',5,8,1,1),('730166da-004c-11ee-9013-88aedd095151',6,8,1,1),('730166da-004c-11ee-9013-88aedd095151',7,8,1,1),('730166da-004c-11ee-9013-88aedd095151',8,8,1,1),('730166da-004c-11ee-9013-88aedd095151',9,8,1,1),('730166da-004c-11ee-9013-88aedd095151',10,8,1,1),('730166da-004c-11ee-9013-88aedd095151',1,9,1,1),('730166da-004c-11ee-9013-88aedd095151',2,9,1,1),('730166da-004c-11ee-9013-88aedd095151',3,9,1,1),('730166da-004c-11ee-9013-88aedd095151',4,9,1,1),('730166da-004c-11ee-9013-88aedd095151',5,9,1,1),('730166da-004c-11ee-9013-88aedd095151',6,9,1,1),('730166da-004c-11ee-9013-88aedd095151',7,9,1,1),('730166da-004c-11ee-9013-88aedd095151',8,9,1,1),('730166da-004c-11ee-9013-88aedd095151',9,9,1,1),('730166da-004c-11ee-9013-88aedd095151',10,9,1,1),('730166da-004c-11ee-9013-88aedd095151',1,10,1,1),('730166da-004c-11ee-9013-88aedd095151',2,10,1,1),('730166da-004c-11ee-9013-88aedd095151',3,10,1,1),('730166da-004c-11ee-9013-88aedd095151',4,10,1,1),('730166da-004c-11ee-9013-88aedd095151',5,10,1,1),('730166da-004c-11ee-9013-88aedd095151',6,10,1,1),('730166da-004c-11ee-9013-88aedd095151',7,10,1,1),('730166da-004c-11ee-9013-88aedd095151',8,10,1,1),('730166da-004c-11ee-9013-88aedd095151',9,10,1,1),('730166da-004c-11ee-9013-88aedd095151',10,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,1,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,1,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,2,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,2,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,3,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,3,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,4,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,4,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,4,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,4,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,4,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',6,4,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',7,4,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',8,4,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,4,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,4,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,5,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,5,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,5,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,5,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,5,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',6,5,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',7,5,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',8,5,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,5,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,5,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,6,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,6,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,6,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,6,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,6,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',6,6,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',7,6,1,2),('9a3f2e46-004e-11ee-9013-88aedd095151',8,6,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,6,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,6,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,7,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,7,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,8,1,4),('9a3f2e46-004e-11ee-9013-88aedd095151',5,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,8,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',5,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,9,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',1,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',2,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',3,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',4,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',5,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',6,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',7,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',8,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',9,10,1,1),('9a3f2e46-004e-11ee-9013-88aedd095151',10,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,1,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,1,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,2,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,2,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,3,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,3,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,4,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,4,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,4,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,4,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,4,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',6,4,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',7,4,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',8,4,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,4,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,4,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,5,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,5,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,5,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,5,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,5,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',6,5,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',7,5,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',8,5,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,5,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,5,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,6,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,6,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,6,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,6,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,6,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',6,6,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',7,6,1,2),('9a6c78bb-004e-11ee-9013-88aedd095151',8,6,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,6,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,6,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,7,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,7,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,8,1,4),('9a6c78bb-004e-11ee-9013-88aedd095151',5,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,8,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',5,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,9,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',1,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',2,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',3,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',4,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',5,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',6,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',7,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',8,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',9,10,1,1),('9a6c78bb-004e-11ee-9013-88aedd095151',10,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,1,1,4),('4ee67704-0050-11ee-9013-88aedd095151',2,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,1,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,1,1,4),('4ee67704-0050-11ee-9013-88aedd095151',1,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,2,1,4),('4ee67704-0050-11ee-9013-88aedd095151',3,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,2,1,4),('4ee67704-0050-11ee-9013-88aedd095151',10,2,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,3,1,4),('4ee67704-0050-11ee-9013-88aedd095151',4,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,3,1,4),('4ee67704-0050-11ee-9013-88aedd095151',9,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,3,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,4,1,4),('4ee67704-0050-11ee-9013-88aedd095151',5,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,4,1,4),('4ee67704-0050-11ee-9013-88aedd095151',8,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,4,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,5,1,4),('4ee67704-0050-11ee-9013-88aedd095151',6,5,1,4),('4ee67704-0050-11ee-9013-88aedd095151',7,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,5,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,6,1,4),('4ee67704-0050-11ee-9013-88aedd095151',6,6,1,4),('4ee67704-0050-11ee-9013-88aedd095151',7,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,6,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,7,1,4),('4ee67704-0050-11ee-9013-88aedd095151',5,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,7,1,4),('4ee67704-0050-11ee-9013-88aedd095151',8,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,7,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,8,1,4),('4ee67704-0050-11ee-9013-88aedd095151',4,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,8,1,4),('4ee67704-0050-11ee-9013-88aedd095151',9,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,8,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',2,9,1,4),('4ee67704-0050-11ee-9013-88aedd095151',3,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,9,1,4),('4ee67704-0050-11ee-9013-88aedd095151',10,9,1,1),('4ee67704-0050-11ee-9013-88aedd095151',1,10,1,4),('4ee67704-0050-11ee-9013-88aedd095151',2,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',3,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',4,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',5,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',6,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',7,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',8,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',9,10,1,1),('4ee67704-0050-11ee-9013-88aedd095151',10,10,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',1,1,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',2,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,1,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,1,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',1,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,2,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',3,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,2,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',10,2,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,3,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',4,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,3,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',9,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,3,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,4,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',5,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,4,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',8,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,4,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,5,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',6,5,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',7,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,5,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,6,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',6,6,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',7,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,6,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,7,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',5,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,7,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',8,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,7,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,8,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',4,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,8,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',9,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,8,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',2,9,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',3,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,9,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',10,9,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',1,10,1,4),('4f18c3f8-0050-11ee-9013-88aedd095151',2,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',3,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',4,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',5,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',6,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',7,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',8,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',9,10,1,1),('4f18c3f8-0050-11ee-9013-88aedd095151',10,10,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',1,1,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',2,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,1,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,1,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',1,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,2,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',3,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,2,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',10,2,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,3,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',4,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,3,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',9,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,3,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,4,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',5,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,4,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',8,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,4,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,5,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',6,5,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',7,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,5,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,6,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',6,6,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',7,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,6,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,7,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',5,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,7,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',8,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,7,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,8,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',4,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,8,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',9,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,8,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',2,9,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',3,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,9,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',10,9,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',1,10,1,4),('4f47efcc-0050-11ee-9013-88aedd095151',2,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',3,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',4,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',5,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',6,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',7,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',8,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',9,10,1,1),('4f47efcc-0050-11ee-9013-88aedd095151',10,10,1,4),('5f202d06-0050-11ee-9013-88aedd095151',1,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,1,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,1,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,2,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,2,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,3,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,3,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,4,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,4,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,5,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,5,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,6,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,6,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,7,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,7,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,8,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,8,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',2,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',3,9,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',5,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',6,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',7,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',8,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',9,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',10,9,1,1),('5f202d06-0050-11ee-9013-88aedd095151',1,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',2,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',3,10,1,4),('5f202d06-0050-11ee-9013-88aedd095151',4,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',5,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',6,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',7,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',8,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',9,10,1,2),('5f202d06-0050-11ee-9013-88aedd095151',10,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',1,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,1,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,1,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,2,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,2,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,3,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,3,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,4,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,4,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,5,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,5,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,6,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,6,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,7,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,7,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,8,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,8,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',2,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',3,9,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',5,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',6,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',7,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',8,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',9,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',10,9,1,1),('5f5563d3-0050-11ee-9013-88aedd095151',1,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',2,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',3,10,1,4),('5f5563d3-0050-11ee-9013-88aedd095151',4,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',5,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',6,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',7,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',8,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',9,10,1,2),('5f5563d3-0050-11ee-9013-88aedd095151',10,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',1,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,1,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,1,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,2,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,2,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,3,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,3,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,4,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,4,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,5,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,5,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,6,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,6,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,7,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,7,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,8,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,8,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',2,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',3,9,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',5,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',6,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',7,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',8,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',9,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',10,9,1,1),('5f87539e-0050-11ee-9013-88aedd095151',1,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',2,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',3,10,1,4),('5f87539e-0050-11ee-9013-88aedd095151',4,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',5,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',6,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',7,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',8,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',9,10,1,2),('5f87539e-0050-11ee-9013-88aedd095151',10,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',1,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,1,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',5,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',6,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',7,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',8,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,1,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,2,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',5,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',6,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',7,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',8,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,2,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,3,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',5,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',6,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',7,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',8,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,3,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,4,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,4,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,4,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,4,1,1),('66f3b360-0050-11ee-9013-88aedd095151',5,4,1,1),('66f3b360-0050-11ee-9013-88aedd095151',6,4,1,1),('66f3b360-0050-11ee-9013-88aedd095151',7,4,1,1),('66f3b360-0050-11ee-9013-88aedd095151',8,4,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,4,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,4,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,5,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,5,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,5,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,5,1,1),('66f3b360-0050-11ee-9013-88aedd095151',5,5,1,1),('66f3b360-0050-11ee-9013-88aedd095151',6,5,1,1),('66f3b360-0050-11ee-9013-88aedd095151',7,5,1,1),('66f3b360-0050-11ee-9013-88aedd095151',8,5,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,5,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,5,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,6,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',5,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',6,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',7,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',8,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,6,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,7,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',5,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',6,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',7,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',8,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,7,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,8,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',5,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',6,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',7,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',8,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,8,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',2,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',3,9,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',5,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',6,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',7,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',8,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',9,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',10,9,1,1),('66f3b360-0050-11ee-9013-88aedd095151',1,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',2,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',3,10,1,4),('66f3b360-0050-11ee-9013-88aedd095151',4,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',5,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',6,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',7,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',8,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',9,10,1,2),('66f3b360-0050-11ee-9013-88aedd095151',10,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',1,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,1,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,1,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,2,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,2,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,3,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,3,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,3,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,3,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,3,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,3,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,3,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,3,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,3,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,3,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,4,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,4,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,4,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,4,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,4,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,4,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,4,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,4,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,4,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,4,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,5,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,5,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,6,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,6,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,7,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,7,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,8,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,8,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',2,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',3,9,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',5,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',6,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',7,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',8,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',9,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',10,9,1,1),('672ee774-0050-11ee-9013-88aedd095151',1,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',2,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',3,10,1,4),('672ee774-0050-11ee-9013-88aedd095151',4,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',5,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',6,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',7,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',8,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',9,10,1,2),('672ee774-0050-11ee-9013-88aedd095151',10,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',1,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,1,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,1,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,2,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,2,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,3,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,3,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,4,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,4,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,4,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,4,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,4,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,4,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,4,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,4,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,4,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,4,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,5,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,5,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,5,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,5,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,5,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,5,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,5,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,5,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,5,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,5,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,6,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,6,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,7,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,7,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,8,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,8,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',2,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',3,9,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',5,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',6,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',7,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',8,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',9,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',10,9,1,1),('6768bac0-0050-11ee-9013-88aedd095151',1,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',2,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',3,10,1,4),('6768bac0-0050-11ee-9013-88aedd095151',4,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',5,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',6,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',7,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',8,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',9,10,1,2),('6768bac0-0050-11ee-9013-88aedd095151',10,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',1,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,1,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,1,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,2,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,2,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,3,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,3,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,4,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,4,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,5,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,5,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,6,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,6,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,7,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,7,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,8,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,8,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',2,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',3,9,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',5,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',6,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',7,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',8,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',9,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',10,9,1,1),('6d9b62b8-0050-11ee-9013-88aedd095151',1,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',2,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',3,10,1,4),('6d9b62b8-0050-11ee-9013-88aedd095151',4,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',5,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',6,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',7,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',8,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',9,10,1,2),('6d9b62b8-0050-11ee-9013-88aedd095151',10,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',1,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,1,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,1,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,2,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,2,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,3,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,3,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,4,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,4,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,5,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,5,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,6,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,6,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,7,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,7,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,8,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,8,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',2,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',3,9,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',5,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',6,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',7,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',8,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',9,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',10,9,1,1),('6dd22ece-0050-11ee-9013-88aedd095151',1,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',2,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',3,10,1,4),('6dd22ece-0050-11ee-9013-88aedd095151',4,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',5,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',6,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',7,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',8,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',9,10,1,2),('6dd22ece-0050-11ee-9013-88aedd095151',10,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',1,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,1,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,1,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,2,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,2,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,3,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,3,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,4,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,4,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,5,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,5,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,6,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,6,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,7,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,7,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,8,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,8,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',2,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',3,9,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',5,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',6,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',7,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',8,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',9,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',10,9,1,1),('6e0817f6-0050-11ee-9013-88aedd095151',1,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',2,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',3,10,1,4),('6e0817f6-0050-11ee-9013-88aedd095151',4,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',5,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',6,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',7,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',8,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',9,10,1,2),('6e0817f6-0050-11ee-9013-88aedd095151',10,10,1,2),('7812e5de-0053-11ee-9013-88aedd095151',1,1,1,4),('7812e5de-0053-11ee-9013-88aedd095151',2,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,1,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,1,1,4),('7812e5de-0053-11ee-9013-88aedd095151',1,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,2,1,4),('7812e5de-0053-11ee-9013-88aedd095151',3,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,2,1,4),('7812e5de-0053-11ee-9013-88aedd095151',10,2,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,3,1,4),('7812e5de-0053-11ee-9013-88aedd095151',4,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,3,1,4),('7812e5de-0053-11ee-9013-88aedd095151',9,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,3,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,4,1,4),('7812e5de-0053-11ee-9013-88aedd095151',5,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,4,1,4),('7812e5de-0053-11ee-9013-88aedd095151',8,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,4,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,5,1,4),('7812e5de-0053-11ee-9013-88aedd095151',6,5,1,4),('7812e5de-0053-11ee-9013-88aedd095151',7,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,5,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,6,1,4),('7812e5de-0053-11ee-9013-88aedd095151',6,6,1,4),('7812e5de-0053-11ee-9013-88aedd095151',7,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,6,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,7,1,4),('7812e5de-0053-11ee-9013-88aedd095151',5,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,7,1,4),('7812e5de-0053-11ee-9013-88aedd095151',8,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,7,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,8,1,4),('7812e5de-0053-11ee-9013-88aedd095151',4,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,8,1,4),('7812e5de-0053-11ee-9013-88aedd095151',9,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,8,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',2,9,1,4),('7812e5de-0053-11ee-9013-88aedd095151',3,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,9,1,4),('7812e5de-0053-11ee-9013-88aedd095151',10,9,1,1),('7812e5de-0053-11ee-9013-88aedd095151',1,10,1,4),('7812e5de-0053-11ee-9013-88aedd095151',2,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',3,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',4,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',5,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',6,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',7,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',8,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',9,10,1,1),('7812e5de-0053-11ee-9013-88aedd095151',10,10,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',1,1,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',2,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,1,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,1,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',1,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,2,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',3,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,2,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',10,2,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,3,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',4,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,3,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',9,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,3,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,4,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',5,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,4,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',8,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,4,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,5,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',6,5,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',7,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,5,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,6,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',6,6,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',7,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,6,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,7,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',5,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,7,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',8,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,7,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,8,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',4,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,8,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',9,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,8,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',2,9,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',3,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,9,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',10,9,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',1,10,1,4),('784b1ba2-0053-11ee-9013-88aedd095151',2,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',3,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',4,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',5,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',6,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',7,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',8,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',9,10,1,1),('784b1ba2-0053-11ee-9013-88aedd095151',10,10,1,4),('7882e40f-0053-11ee-9013-88aedd095151',1,1,1,4),('7882e40f-0053-11ee-9013-88aedd095151',2,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,1,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,1,1,4),('7882e40f-0053-11ee-9013-88aedd095151',1,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,2,1,4),('7882e40f-0053-11ee-9013-88aedd095151',3,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,2,1,4),('7882e40f-0053-11ee-9013-88aedd095151',10,2,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,3,1,4),('7882e40f-0053-11ee-9013-88aedd095151',4,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,3,1,4),('7882e40f-0053-11ee-9013-88aedd095151',9,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,3,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,4,1,4),('7882e40f-0053-11ee-9013-88aedd095151',5,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,4,1,4),('7882e40f-0053-11ee-9013-88aedd095151',8,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,4,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,5,1,4),('7882e40f-0053-11ee-9013-88aedd095151',6,5,1,4),('7882e40f-0053-11ee-9013-88aedd095151',7,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,5,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,6,1,4),('7882e40f-0053-11ee-9013-88aedd095151',6,6,1,4),('7882e40f-0053-11ee-9013-88aedd095151',7,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,6,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,7,1,4),('7882e40f-0053-11ee-9013-88aedd095151',5,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,7,1,4),('7882e40f-0053-11ee-9013-88aedd095151',8,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,7,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,8,1,4),('7882e40f-0053-11ee-9013-88aedd095151',4,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,8,1,4),('7882e40f-0053-11ee-9013-88aedd095151',9,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,8,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',2,9,1,4),('7882e40f-0053-11ee-9013-88aedd095151',3,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,9,1,4),('7882e40f-0053-11ee-9013-88aedd095151',10,9,1,1),('7882e40f-0053-11ee-9013-88aedd095151',1,10,1,4),('7882e40f-0053-11ee-9013-88aedd095151',2,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',3,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',4,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',5,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',6,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',7,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',8,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',9,10,1,1),('7882e40f-0053-11ee-9013-88aedd095151',10,10,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',1,1,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',2,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,1,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,1,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',1,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,2,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',3,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,2,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',10,2,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,3,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',4,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,3,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',9,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,3,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,4,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',5,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,4,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',8,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,4,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,5,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',6,5,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',7,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,5,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,6,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',6,6,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',7,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,6,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,7,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',5,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,7,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',8,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,7,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,8,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',4,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,8,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',9,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,8,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',2,9,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',3,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,9,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',10,9,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',1,10,1,4),('2f0d6024-00e8-11ee-9603-88aedd095151',2,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',3,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',4,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',5,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',6,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',7,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',8,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',9,10,1,1),('2f0d6024-00e8-11ee-9603-88aedd095151',10,10,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',1,1,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',2,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,1,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,1,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',1,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,2,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',3,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,2,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',10,2,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,3,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',4,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,3,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',9,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,3,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,4,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',5,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,4,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',8,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,4,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,5,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',6,5,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',7,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,5,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,6,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',6,6,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',7,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,6,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,7,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',5,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,7,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',8,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,7,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,8,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',4,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,8,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',9,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,8,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',2,9,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',3,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,9,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',10,9,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',1,10,1,4),('2f3fba62-00e8-11ee-9603-88aedd095151',2,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',3,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',4,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',5,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',6,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',7,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',8,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',9,10,1,1),('2f3fba62-00e8-11ee-9603-88aedd095151',10,10,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',1,1,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',2,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,1,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,1,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',1,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,2,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',3,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,2,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',10,2,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,3,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',4,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,3,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',9,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,3,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,4,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',5,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,4,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',8,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,4,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,5,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',6,5,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',7,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,5,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,6,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',6,6,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',7,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,6,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,7,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',5,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,7,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',8,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,7,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,8,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',4,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,8,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',9,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,8,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',2,9,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',3,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,9,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',10,9,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',1,10,1,4),('2f71176b-00e8-11ee-9603-88aedd095151',2,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',3,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',4,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',5,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',6,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',7,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',8,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',9,10,1,1),('2f71176b-00e8-11ee-9603-88aedd095151',10,10,1,4);
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
INSERT INTO `templateticketmovie` VALUES ('4a3bdbb1-0047-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db',1,60000.0000),('4a3c555c-0047-11ee-9013-88aedd095151','8ff2ad96-1114-4c19-a164-352a8b29d8db',2,70000.0000),('6eeddccc-fb7b-11ed-816c-88aedd095151','dbda62f0-9c62-4cc8-9f7e-06415f2714dd',1,60000.0000),('6eee6b40-fb7b-11ed-816c-88aedd095151','dbda62f0-9c62-4cc8-9f7e-06415f2714dd',2,70001.0000),('790c0272-e986-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70',1,50000.0000),('790c25d6-e986-11ed-906e-907841e9040c','54861f66-6dfd-4fe4-9e5f-795e64df4f70',2,70000.0000),('9adcae8c-df51-11ed-bf13-88aedd095151','d6ed7e34-fada-474f-9682-2c2cf3ba4bed',1,50000.0000),('9adcf5c2-df51-11ed-bf13-88aedd095151','d6ed7e34-fada-474f-9682-2c2cf3ba4bed',2,70000.0000),('a0bcaf22-fa31-11ed-906e-907841e9040c','adcbe5cc-7cda-4351-8ee1-e391892199c8',1,50000.0000),('a0bd3a5b-fa31-11ed-906e-907841e9040c','adcbe5cc-7cda-4351-8ee1-e391892199c8',2,70000.0000),('a59c548d-e986-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf',1,110000.0000),('a59c8a64-e986-11ed-906e-907841e9040c','a8d283ca-040b-4924-99cb-48f166e5afaf',2,70000.0000),('af560c01-e31b-11ed-857f-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b',1,52000.0000),('af566af1-e31b-11ed-857f-88aedd095151','124f65ff-f5db-4b0e-bb00-ab3fea14141b',2,70000.0000),('b2ab2aa5-fb7b-11ed-816c-88aedd095151','ec435b57-d585-4cc4-90d7-4d0db5c4abde',1,60000.0000),('b2ab9a82-fb7b-11ed-816c-88aedd095151','ec435b57-d585-4cc4-90d7-4d0db5c4abde',2,70001.0000),('c4235402-fb77-11ed-816c-88aedd095151','65cbd457-2f10-4652-9916-64f904ab5cd0',1,60000.0000),('c423f943-fb77-11ed-816c-88aedd095151','65cbd457-2f10-4652-9916-64f904ab5cd0',2,70001.0000),('e0e7f2f2-e986-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42',1,140000.0000),('e0e837ec-e986-11ed-906e-907841e9040c','53a1c706-f6ac-41b4-bb24-183cf38acc42',2,70000.0000),('e82fd726-fa31-11ed-906e-907841e9040c','cef32a5e-21e4-4633-b241-9fab2fab1939',1,50000.0000),('e8305fce-fa31-11ed-906e-907841e9040c','cef32a5e-21e4-4633-b241-9fab2fab1939',2,70000.0000),('f7b12214-e5a9-11ed-b285-88aedd095151','668aede5-2336-459a-b0ad-26969ea141d9',1,50000.0000),('f7b17761-e5a9-11ed-b285-88aedd095151','668aede5-2336-459a-b0ad-26969ea141d9',2,70000.0000),('ff39b0f6-e316-11ed-857f-88aedd095151','ac6b11da-ebef-4889-9f77-a971c292066b',1,50001.0000),('ff3a0b0f-e316-11ed-857f-88aedd095151','ac6b11da-ebef-4889-9f77-a971c292066b',2,70000.0000);
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
CREATE   PROCEDURE `InsertToHistory`(IN $TotalAmount decimal, IN $CreatedBy varchar(255), IN $ListSeatID text, IN $CustomerName varchar(255), IN $PhoneNumber varchar(10), IN $MovieName varchar(500), IN $MovieID char(36), IN $RoomCinemaID char(36), IN $TemplateTimeCode varchar(20))
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
CREATE   PROCEDURE `Proc_AcceptAccount`(IN $AccountID char(36), IN $Status int)
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
CREATE   PROCEDURE `Proc_AddNewDBOptions`(IN $Keyword varchar(255), IN $KeyValue varchar(255))
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
CREATE   PROCEDURE `Proc_AddWaitListAccount`(IN $AccountName varchar(50), IN $Password varchar(50), IN $Role int, IN $Name varchar(255))
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
CREATE   PROCEDURE `Proc_ChangeDBOptions`(IN $Keyword varchar(255), IN $KeyValue varchar(255))
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
CREATE   PROCEDURE `Proc_CheckExistAccount`(IN $AccountName varchar(50))
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
CREATE   PROCEDURE `Proc_CreateNewCinemaRoom`(IN $RoomID char(36), IN $PostDate date, IN $MovieID char(36), IN $ListTemplateTimeCode varchar(20))
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
CREATE   PROCEDURE `Proc_CreateNewRealRoom`(IN $RoomCode varchar(20), IN $RowSeat int, IN $ColSeat int)
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
CREATE   PROCEDURE `Proc_CreateNewRoomSeat`(IN $Col int, IN $Row int, IN $CinemaRoomID char(36), IN $RoomID char(36))
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
CREATE   PROCEDURE `Proc_CreateNewTemplateTime`(IN $TemplateTimeCode varchar(20), IN $Time varchar(255))
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
CREATE   PROCEDURE `Proc_CreateRealCinemaRoom`(IN $RoomCode varchar(20), IN $RowSeat int, IN $ColSeat int)
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
CREATE   PROCEDURE `Proc_DeleteMovieByID`(IN $MovieID char(36))
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
CREATE   PROCEDURE `Proc_DeleteMovies`(IN $MovieIDs varchar(255))
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
CREATE   PROCEDURE `Proc_DeleteRealRoom`(In $RoomID char(36))
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
CREATE   PROCEDURE `Proc_DeleteRoomCinemaVirtual`(IN $RoomCinemaID char(36))
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
CREATE   PROCEDURE `Proc_GetAccountIDRole`(IN $account_name varchar(50), IN $account_password varchar(50))
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
CREATE   PROCEDURE `Proc_GetAllAccount`()
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
CREATE   PROCEDURE `Proc_GetAllAccountTemp`()
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
CREATE   PROCEDURE `Proc_GetBiggestMovieCode`()
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
CREATE   PROCEDURE `Proc_GetCategoryMovie`()
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
CREATE   PROCEDURE `Proc_GetChartDayByMovie`()
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
CREATE   PROCEDURE `Proc_GetChartMonthByMovie`(IN $MovieID char(36))
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
CREATE   PROCEDURE `Proc_GetChartThisMonth`()
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
CREATE   PROCEDURE `Proc_GetChartThisYearByMonth`()
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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `Proc_GetCinemaInfo`()
BEGIN
	drop temporary table if exists tmpTable;
    create temporary table tmpTable(
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
    
    insert into tmpTable(CinemaID,CinemaCode,CinemaName,CinemaAddress,SortOrder,About,Hotline,Fax,MST) 
    select lc.CinemaID, lc.CinemaCode, lc.CinemaName, lc.CinemaAddress, lc.SortOrder, lc.About,lc.Hotline,lc.Fax,lc.MST  from listcinema lc limit 1;
    
    select * from tmpTable;
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
CREATE   PROCEDURE `Proc_GetCinemaRoom`()
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
CREATE   PROCEDURE `Proc_GetDBOption`()
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
CREATE   PROCEDURE `Proc_GetHistory`()
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
CREATE   PROCEDURE `Proc_GetListCustomer`()
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
CREATE   PROCEDURE `Proc_GetListLanguage`()
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE   PROCEDURE `Proc_GetListMovie`(IN $MovieCode varchar(50), IN $MovieName varchar(200), IN $Actor varchar(200), IN $Direction varchar(200), IN $TypeFilter int)
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
CREATE   PROCEDURE `Proc_GetListRoom`()
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
CREATE   PROCEDURE `Proc_GetListRoomCinemaByMovieID`(IN $MovieID char(36), IN $PostDate date)
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
CREATE   PROCEDURE `Proc_GetListTemplateTicket`()
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
CREATE   PROCEDURE `Proc_GetMovieByID`(IN $MovieID char(36))
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
CREATE   PROCEDURE `Proc_GetRealSeatByRoom`(IN $RoomID char(36))
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
CREATE   PROCEDURE `Proc_GetSeatRoomCinema`(IN $RoomCinemaID char(36))
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
CREATE   PROCEDURE `Proc_GetTemplateTimeCode`()
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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `Proc_GetTemplateTimeCodeByMovieID`(IN $MovieID char(36), IN $PostDate date, IN $RoomID char(36))
    COMMENT 'Thủ tục lấy ra danh sách template time code'
BEGIN
  DECLARE tempText text;
  SELECT
    GROUP_CONCAT(r.TemplateTimeCode SEPARATOR ',') INTO tempText
  FROM roomcinema r
  WHERE  r.PostDate = $PostDate and r.RoomID = $RoomID;

  SELECT
    *
  FROM templatetimemoiveon t
  WHERE tempText NOT Like CONCAT('%', TemplateTimeCode, '%')
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
CREATE   PROCEDURE `Proc_GetTypeMovie`()
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
CREATE   PROCEDURE `Proc_InsertCategoryMovie`(IN $CategoryName varchar(500), IN $CategoryCode varchar(20))
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
CREATE   PROCEDURE `Proc_InsertNewLanguage`(IN $LanguageCode varchar(10), IN $LanguageName varchar(50))
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
CREATE   PROCEDURE `Proc_InsertNewMovie`(IN $MovieCode varchar(20), IN $MovieName varchar(500), IN $ReleaseDate datetime, IN $Actor varchar(500), IN $Directions varchar(255), IN $TypeID char(36), IN $Language varchar(100), IN $TrailerLink varchar(500), IN $PosterLink varchar(500), IN $Content text, IN $FromDate datetime, IN $ToDate datetime, IN $IsOpen bit, IN $Tag varchar(20), IN $CategoryIDs varchar(255), IN $MovieID char(36), IN $TimeLine int)
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
CREATE   PROCEDURE `Proc_InsertTemplateTimeCode`(IN $TemplateTimeCode varchar(20), IN $Time varchar(255))
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
CREATE   PROCEDURE `Proc_InsertToHistory`(IN $CreatedBy varchar(255),
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
CREATE   PROCEDURE `Proc_InsertTypeMovie`(IN $TypeCode varchar(20), IN $TypeName varchar(500))
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
CREATE   PROCEDURE `Proc_UpdateAccount`(IN $AccountID char(36), IN $Password varchar(50), IN $Role int, IN $Name varchar(255), IN $Gender int, IN $DateOfBirth date, IN $PhoneNumber varchar(10), IN $Email varchar(100))
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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `Proc_UpdateCinemaInfo`(In $CinemaID char(36),In $CinemaCode varchar(20), In $CinemaName varchar(500), In $CinemaAddress varchar(500),In $About text, In $Hotline varchar(10), In $MST varchar(50) )
BEGIN
	Update listcinema lc set lc.CinemaCode = $CinemaCode,lc.CinemaName = $CinemaName, lc.CinemaAddress = $CinemaAddress, lc.About = $About,lc.Hotline = $Hotline, lc.MST = $MST
    where lc.CinemaID = $CinemaID;
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
CREATE   PROCEDURE `Proc_UpdateCostOfTicket`(IN $TemplateTicketID char(36), IN $Cost decimal(22, 4))
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
CREATE   PROCEDURE `Proc_UpdateDBOption`(IN $Keyword varchar(255), IN $KeyValue varchar(255))
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
CREATE   PROCEDURE `Proc_UpdateMovie`(IN $MovieCode varchar(20), IN $MovieName varchar(500), IN $ReleaseDate datetime, IN $Actor varchar(500), IN $Directions varchar(255), IN $TypeID char(36), IN $Language varchar(100), IN $TrailerLink varchar(500), IN $PosterLink varchar(500), IN $Content text, IN $FromDate datetime, IN $ToDate datetime, IN $IsOpen bit, IN $Tag varchar(20), IN $CategoryIDs text, IN $MovieID char(36), IN $TimeLine varchar(255))
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
CREATE   PROCEDURE `Proc_UpdateRealSeatRoom`(IN $ListSeatSelected text)
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
CREATE   PROCEDURE `Proc_UpdateSeatRoomCinema`(IN $ListSeatSelected text)
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-02 16:36:27
