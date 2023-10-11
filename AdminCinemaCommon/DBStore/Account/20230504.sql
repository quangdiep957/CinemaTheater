-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: db_cinema_account
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
  `Role` int NOT NULL COMMENT '1: admin, 2:',
  `Name` varchar(255) DEFAULT NULL COMMENT 'Họ và tên chủ tài khoản',
  `Gender` int DEFAULT NULL COMMENT 'Giời tính',
  `DateOfBirth` date DEFAULT NULL COMMENT 'Ngày sinh',
  `PhoneNumber` varchar(10) DEFAULT NULL COMMENT 'Số điện thoại',
  `Point` int DEFAULT NULL COMMENT 'Điểm tích lũy',
  `MemberCode` varchar(20) DEFAULT NULL COMMENT 'Mã thành viên',
  `TypeMember` int DEFAULT NULL COMMENT 'Loại thành viên',
  `CreatedDate` datetime DEFAULT NULL COMMENT 'Ngày tạo tài khoản',
  `Email` varchar(100) DEFAULT NULL,
  `CinemaID` char(36) DEFAULT NULL,
  `NameDB` varchar(500) DEFAULT NULL,
  `Avatar` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384 COMMENT='Bảng lưu tài khoản - thông tin người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('1725e0dc-ea5c-11ed-8128-88aedd095151','vmhoang','vmhoang',2,'Vũ Minh Hoàng',NULL,NULL,NULL,NULL,NULL,NULL,'2023-05-04 16:15:10',NULL,'7e18991f-e768-11ed-8b5d-907841e9040c','db_cinema_dev_01',''),('4555fff1-cd74-11ed-a44f-907841e9040c','admin','admin',1,'Admin',1,'2001-08-18',NULL,NULL,NULL,NULL,NULL,NULL,'7e18991f-e768-11ed-8b5d-907841e9040c','db_cinema_dev_01','avatar/a8375e49-1b16-4dc8-99ea-15d6c52d7438'),('69d3e4b8-e306-11ed-857f-88aedd095151','taikhoan1','taikhoan1',5,'Công Đoàn',1,'2001-08-18','0936561355',0,'0000001',1,'2023-04-25 00:00:00','congdoan123@gmail.com','7e18991f-e768-11ed-8b5d-907841e9040c','db_cinema_dev_01',NULL),('8dff97e8-e283-11ed-a14e-88aedd095151','congdoan','congdoan',2,'employee',0,'2001-08-18',NULL,NULL,NULL,NULL,NULL,NULL,'7e18991f-e768-11ed-8b5d-907841e9040c','db_cinema_dev_01','avatar/cab9dc4c-60c0-4e82-b83b-f442ee04f7c6'),('ab869e84-e80c-11ed-906e-907841e9040c','admin1','admin',1,'Hoàng',1,NULL,'',NULL,NULL,NULL,'2023-05-01 17:41:03','','7e18991f-e768-11ed-8b5d-907841e9040c','db_cinema_dev_01','avatar/d479d331-e8a6-4308-baa5-f041738ac364'),('b58f38bc-e80d-11ed-906e-907841e9040c','admin2','admin',2,'Minh Chi',2,'2023-05-01','098737332',NULL,NULL,NULL,'2023-05-01 17:48:29','minhchi@gmail.com','7e18991f-e768-11ed-8b5d-907841e9040c','db_cinema_dev_01','avatar/892d6d57-30ae-4ae8-8413-d06c2ec20266'),('df923bfa-e80f-11ed-906e-907841e9040c','nttmai','admin',2,'Nguyễn thị Tuyết Mai',NULL,NULL,NULL,NULL,NULL,NULL,'2023-05-01 18:04:09',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=2340 COMMENT='Bảng lưu các tài khoản chờ duyệt';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttemp`
--

LOCK TABLES `accounttemp` WRITE;
/*!40000 ALTER TABLE `accounttemp` DISABLE KEYS */;
INSERT INTO `accounttemp` VALUES ('1725e0dc-ea5c-11ed-8128-88aedd095151','vmhoang','vmhoang',2,3,'2023-05-04','Vũ Minh Hoàng'),('908f3f17-e74b-11ed-8b5d-907841e9040c','congdoan4','congdoan1',2,3,'2023-04-30','Đoàn'),('9c0a7a74-e74b-11ed-8b5d-907841e9040c','congdoan5','congdoan1',2,3,'2023-04-30','Đoàn'),('9c89d472-e738-11ed-8b5d-907841e9040c','congdoan2','congdoan',2,2,'2023-04-30','Đoàn 2'),('a476e5b0-e737-11ed-8b5d-907841e9040c','congdoan1','congdoan',2,3,'2023-04-30','Đoàn'),('c3053725-e80f-11ed-906e-907841e9040c','nthmai','admin',2,2,'2023-05-01','Nguyễn Thi Hoàng Mai'),('df923bfa-e80f-11ed-906e-907841e9040c','nttmai','admin',2,3,'2023-05-01','Nguyễn thị Tuyết Mai'),('f592ab85-e74b-11ed-8b5d-907841e9040c','congdoan5','congdoan1',2,1,'2023-04-30','Đoàn');
/*!40000 ALTER TABLE `accounttemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinematenant`
--

DROP TABLE IF EXISTS `cinematenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinematenant` (
  `CinemaID` char(36) NOT NULL DEFAULT '',
  `DBName` varchar(500) DEFAULT NULL,
  `CinemaName` text,
  PRIMARY KEY (`CinemaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384 COMMENT='Bảng chứa danh sách các rạp phim và db tương ứng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinematenant`
--

LOCK TABLES `cinematenant` WRITE;
/*!40000 ALTER TABLE `cinematenant` DISABLE KEYS */;
INSERT INTO `cinematenant` VALUES ('7e18991f-e768-11ed-8b5d-907841e9040c','db_cinema_dev_01','Rạp chiếu phim Mỹ Đình');
/*!40000 ALTER TABLE `cinematenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_cinema_account'
--

--
-- Dumping routines for database 'db_cinema_account'
--
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_AcceptAccount`(IN $AccountID char(36), IN $Status int)
    COMMENT 'Thủ tục phê duyệt tài khoản'
BEGIN
  IF $Status = 1 THEN
    INSERT INTO account (AccountID, AccountName, Password, Role, CreatedDate, Name)
      SELECT
        a.AccountID,
        a.AccountName,
        a.Password,
        a.Role,
        NOW() AS CreatedDate,
        a.Name
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_AddWaitListAccount`(IN $AccountName varchar(50), IN $Password varchar(50), IN $Role int, IN $Name varchar(255))
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_CheckExistAccount`(IN $AccountName varchar(50))
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
/*!50003 DROP PROCEDURE IF EXISTS `Proc_DeleteAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_DeleteAccount`(IN $AccountID char(36))
    COMMENT 'Thủ tục xóa tài khoản'
BEGIN
  DELETE
    FROM account
  WHERE AccountID = $AccountID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetAccountByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_GetAccountByID`(IN $AccountID char(36))
    COMMENT 'Thủ tục lấy ra tài khoản theo id'
BEGIN
  SELECT
    a.AccountID AS AccountID,
    a.AccountName AS AccountName,
    a.Password AS Password,
    a.Role AS Role,
    a.Name AS Name,
    a.Gender AS Gender,
    a.DateOfBirth AS DateOfBirth,
    a.PhoneNumber AS PhoneNumber,
    a.Email AS Email,
    a.NameDB AS NameDB,
    a.CinemaID AS CinemaID,
    a.Avatar AS Avatar
  FROM account a
  WHERE a.AccountID = $AccountID;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_GetAccountIDRole`(IN $account_name varchar(50), IN $account_password varchar(50))
    COMMENT 'Thủ tục lấy ra account id và role'
BEGIN
  SELECT
    a.AccountID AS AccountID,
    a.Role AS Role,
    a.CinemaID AS CinemaID,
    a.NameDB AS NameDB,
    c.CinemaName AS CinemaName
  FROM account a
    INNER JOIN cinematenant c
      ON a.CinemaID = c.CinemaID
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_GetAllAccount`()
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
    Email varchar(100),
    CinemaID char(36),
    CinemaName varchar(500),
    Avatar varchar(500)
  );

  INSERT INTO tmpTable (AccountID, AccountName, Password, Role, Name, Gender, DateOfBirth, PhoneNumber, Email, CinemaID, CinemaName, Avatar)
    SELECT
      a.AccountID,
      a.AccountName,
      a.Password,
      a.Role,
      a.Name,
      a.Gender,
      a.DateOfBirth,
      a.PhoneNumber,
      a.Email,
      a.CinemaID,
      c.CinemaName,
      a.Avatar
    FROM account a
      LEFT JOIN cinematenant c
        ON a.CinemaID = c.CinemaID;

  SELECT
    *
  FROM tmpTable a
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_GetAllAccountTemp`()
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
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GetListCinema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_GetListCinema`()
    COMMENT 'Thủ tục lấy ra danh sách rạp phim'
BEGIN
  SELECT
    c.CinemaID AS CinemaID,
    c.DBName AS NameDB,
    c.CinemaName AS CinemaName
  FROM cinematenant c
  ORDER BY CinemaName;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_GetListCustomer`()
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
/*!50003 DROP PROCEDURE IF EXISTS `Proc_InsertNewAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_InsertNewAccount`(IN $AccountName varchar(50), IN $Password varchar(50), IN $Role int, IN $Name varchar(255), IN $Gender int, IN $DateOfBirth date, IN $Email varchar(100), IN $CinemaID char(36), IN $Avatar varchar(500), IN $PhoneNumber varchar(10))
    COMMENT 'Thủ tục tạo tài khoản mới'
BEGIN
  DECLARE $NameDB varchar(500);
  SELECT
    c.DBName INTO $NameDB
  FROM cinematenant c
  WHERE c.CinemaID = $CinemaID;

  INSERT INTO account (AccountID, AccountName, Password, Role, Name, Gender, DateOfBirth, PhoneNumber, CreatedDate, Email, CinemaID, NameDB, Avatar)
    VALUES (UUID(), $AccountName, $Password, $Role, $Name, $Gender, $DateOfBirth, $PhoneNumber, NOW(), $Email, $CinemaID, $NameDB, $Avatar);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_UpdateAccount`(IN $AccountID char(36), IN $Password varchar(50), IN $Role int, IN $Name varchar(255), IN $Gender int, IN $DateOfBirth date, IN $PhoneNumber varchar(10), IN $Email varchar(100), IN $CinemaID char(36), IN $Avatar varchar(500))
    COMMENT 'Thủ tục cập nhật tài khoản'
BEGIN

  DECLARE $NameDB varchar(500);

  SELECT
    DBName INTO $NameDB
  FROM cinematenant
  WHERE CinemaID = $CinemaID;
  UPDATE account a
  SET a.Password = $Password,
      a.Role = $Role,
      a.Name = $Name,
      a.Gender = $Gender,
      a.DateOfBirth = $DateOfBirth,
      a.PhoneNumber = $PhoneNumber,
      a.Email = $Email,
      a.CinemaID = $CinemaID,
      a.NameDB = $NameDB,
      a.Avatar = $Avatar
  WHERE a.AccountID = $AccountID;
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

-- Dump completed on 2023-05-04 17:27:59
