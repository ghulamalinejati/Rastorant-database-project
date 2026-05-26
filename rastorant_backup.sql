-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: rastorant
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(40) NOT NULL,
  `cust_addres` varchar(30) DEFAULT 'kabul',
  `cust_email` varchar(40) DEFAULT NULL,
  `cust_ph_num` varchar(15) DEFAULT NULL,
  `cust_gender` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `cust_email` (`cust_email`),
  UNIQUE KEY `cust_ph_num` (`cust_ph_num`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Ali','Dasht-e-Barchi','ali@gmail.com','0765820241','Male'),(2,'Mahdi','Dasht-e-Barchi','mahdi@gmail.com','0772317219','Male'),(3,'Farhad','Dasht-e-Barchi','farhad@gmail.com','0772317220','Male'),(4,'Qasim','Dasht-e-Barchi','qasim@gmail.com','0772317223','Male'),(5,'Jafar','Dasht-e-Barchi','jafar@gmail.com','0772317224','Male'),(6,'Rahman','Dasht-e-Barchi','rahman@gmail.com','0772317225','Male'),(7,'Rasul','Dasht-e-Barchi','rasul@gmail.com','0772317226','Male'),(8,'Sajad','Dasht-e-Barchi','sajad@gmail.com','0772317227','Male'),(9,'Hadi','Dasht-e-Barchi','hadi@gmail.com','0772317228','Male');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foods` (
  `food_id` int(11) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(40) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'halwa',110),(2,'kabab',180),(3,'biriani',150),(4,'pizza',300),(5,'sokhari',250),(6,'qaboli',170),(7,'tokhm',70),(8,'bamia',80),(9,'shorwa',140),(10,'bargar',100);
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL,
  `order_date_time` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`order_id`),
  KEY `cust_id` (`cust_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,8,'2026-05-25 07:39:04'),(2,1,2,'2026-05-25 07:39:04'),(3,2,3,'2026-05-25 07:39:04'),(4,2,4,'2026-05-25 07:39:04'),(5,3,5,'2026-05-25 07:39:04'),(6,4,6,'2026-05-25 07:39:04'),(7,5,7,'2026-05-25 07:39:04'),(8,7,7,'2026-05-25 10:36:33'),(9,8,8,'2026-05-25 10:36:33'),(10,8,5,'2026-05-25 10:36:33'),(11,3,7,'2026-05-25 10:36:33'),(12,5,2,'2026-05-25 10:36:33'),(13,1,1,'2026-05-25 18:27:43'),(14,2,1,'2026-05-25 18:29:21'),(15,3,1,'2026-05-25 18:29:21'),(16,4,1,'2026-05-25 18:29:21'),(17,5,1,'2026-05-25 18:29:21'),(18,6,1,'2026-05-25 18:29:21'),(19,7,1,'2026-05-25 18:29:21'),(20,8,1,'2026-05-25 18:29:21');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-26  7:57:25
