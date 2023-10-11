-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-03 14:36:18
