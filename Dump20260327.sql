-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: smartbudget_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_upper` ((upper(`email`))),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_api_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `api_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_budget`
--

DROP TABLE IF EXISTS `api_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_budget` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `allocated_percentage` decimal(5,2) NOT NULL,
  `allocated_amount` decimal(12,2) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_budget_user_id_0da794a2_fk_api_customuser_id` (`user_id`),
  CONSTRAINT `api_budget_user_id_0da794a2_fk_api_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `api_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_budget`
--

LOCK TABLES `api_budget` WRITE;
/*!40000 ALTER TABLE `api_budget` DISABLE KEYS */;
INSERT INTO `api_budget` VALUES (1,'Food',15.00,15000.00,1),(2,'Travel',8.00,8000.00,1),(3,'Shopping',10.00,10000.00,1),(4,'Entertainment',5.00,5000.00,1),(5,'Utilities',6.00,6000.00,1),(6,'Healthcare',4.00,4000.00,1),(7,'Education',7.00,7000.00,1),(8,'Housing',20.00,20000.00,1),(9,'Insurance',3.00,3000.00,1),(10,'Others',2.00,2000.00,1),(11,'Food',13.30,8000.00,2),(12,'Travel',6.70,4000.00,2),(13,'Shopping',10.00,6000.00,2),(14,'Entertainment',5.00,3000.00,2),(15,'Utilities',6.70,4000.00,2),(16,'Education',16.70,10000.00,2),(17,'Others',8.30,5000.00,2),(18,'Food',15.00,285.00,4),(19,'Travel',8.00,152.00,4),(20,'Utilities',10.00,190.00,4),(21,'Shopping',8.00,152.00,4),(22,'Education',7.00,133.00,4),(23,'Entertainment',7.00,133.00,4),(24,'Recurrent Expenses',15.00,285.00,4),(25,'Savings',22.00,418.00,4),(26,'Others',8.00,152.00,4),(27,'Food',15.00,1800.00,5),(28,'Travel',8.00,960.00,5),(29,'Utilities',10.00,1200.00,5),(30,'Shopping',8.00,960.00,5),(31,'Education',7.00,840.00,5),(32,'Entertainment',7.00,840.00,5),(33,'Recurrent Expenses',15.00,1800.00,5),(34,'Savings',22.00,2640.00,5),(35,'Others',8.00,960.00,5),(36,'Food',15.00,180.00,6),(37,'Travel',8.00,96.00,6),(38,'Utilities',10.00,120.00,6),(39,'Shopping',8.00,96.00,6),(40,'Education',7.00,84.00,6),(41,'Entertainment',7.00,84.00,6),(42,'Recurrent Expenses',15.00,180.00,6),(43,'Savings',22.00,264.00,6),(44,'Others',8.00,96.00,6),(45,'Food',15.00,180.00,7),(46,'Travel',8.00,96.00,7),(47,'Utilities',10.00,120.00,7),(48,'Shopping',8.00,96.00,7),(49,'Education',7.00,84.00,7),(50,'Entertainment',7.00,84.00,7),(51,'Recurrent Expenses',15.00,180.00,7),(52,'Savings',22.00,264.00,7),(53,'Others',8.00,96.00,7);
/*!40000 ALTER TABLE `api_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_customuser`
--

DROP TABLE IF EXISTS `api_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_customuser`
--

LOCK TABLES `api_customuser` WRITE;
/*!40000 ALTER TABLE `api_customuser` DISABLE KEYS */;
INSERT INTO `api_customuser` VALUES (1,'pbkdf2_sha256$600000$RIkY4cQGYpxRwh5fBxLXle$7WhhyPZ+FQ+IC8pG7jfXp2hs2cs6vgrbRDWiWo+ordQ=',NULL,1,'admin','','','admin@gmail.com',1,1,'2026-03-26 06:15:13.924664'),(2,'pbkdf2_sha256$1000000$tYSFB8tJCaM6SStgIfv9AI$c4Uceem79eVdnPcXbLuOSkjKdjgufqj911nO7a1HOjA=',NULL,0,'varsha','','','varsha@example.com',0,1,'2026-03-26 06:17:42.497209'),(3,'pbkdf2_sha256$1000000$OrVVUHsTxE56X6Mg4Lugp8$ojLxsWa917EbLYWJgBsiVOk9T66bTgbx2lAR+U66BSE=',NULL,0,'rahul','','','rahul@example.com',0,1,'2026-03-26 06:17:42.875277'),(4,'pbkdf2_sha256$600000$KZKEP6zre4ny1YzujsXCe3$BLYJCkVL6IZJ+P6XJ8DLpb8igGPE4lwlIv38o/J0RVo=',NULL,0,'Tom','','','tom@gmail.com',0,1,'2026-03-26 06:37:08.608813'),(5,'pbkdf2_sha256$1000000$ZFpUjOXNUIHu6lfIn9ETi0$NZRrkS2+u1uwP76/EpZghqq5D5NTGRgtUQRfoR7/Md0=',NULL,0,'sugu','','','sugu@gmail.com',0,1,'2026-03-26 07:15:41.586845'),(6,'pbkdf2_sha256$600000$mkru1deBWxADCdZnQ9ipyg$7UUv1pdDXrQO3rbYTJKTzaIoSFOAoq0b/gBDX7/PX84=',NULL,0,'varshitha','','','varshithaa31@gmail.com',0,1,'2026-03-26 07:53:00.649582'),(7,'pbkdf2_sha256$600000$xqNrSSufctsL8z03Fc1LuK$6xvGrgO2RFvLvIclqFjUCjZ33SlOHoOL2H9HWRKzKXg=',NULL,0,'Jenny','','','jenny@gmail.com',0,1,'2026-03-26 08:52:18.272073');
/*!40000 ALTER TABLE `api_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_customuser_groups`
--

DROP TABLE IF EXISTS `api_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_customuser_groups_customuser_id_group_id_d5b0c2ab_uniq` (`customuser_id`,`group_id`),
  KEY `api_customuser_groups_group_id_f049027c_fk_auth_group_id` (`group_id`),
  CONSTRAINT `api_customuser_group_customuser_id_9eb4b783_fk_api_custo` FOREIGN KEY (`customuser_id`) REFERENCES `api_customuser` (`id`),
  CONSTRAINT `api_customuser_groups_group_id_f049027c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_customuser_groups`
--

LOCK TABLES `api_customuser_groups` WRITE;
/*!40000 ALTER TABLE `api_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_customuser_user_permissions`
--

DROP TABLE IF EXISTS `api_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_customuser_user_perm_customuser_id_permission_9deacd8d_uniq` (`customuser_id`,`permission_id`),
  KEY `api_customuser_user__permission_id_8735d73e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `api_customuser_user__customuser_id_5365c9ba_fk_api_custo` FOREIGN KEY (`customuser_id`) REFERENCES `api_customuser` (`id`),
  CONSTRAINT `api_customuser_user__permission_id_8735d73e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_customuser_user_permissions`
--

LOCK TABLES `api_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `api_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_feedback`
--

DROP TABLE IF EXISTS `api_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `comment` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_feedback_user_id_af9adbfc_fk_api_customuser_id` (`user_id`),
  CONSTRAINT `api_feedback_user_id_af9adbfc_fk_api_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `api_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_feedback`
--

LOCK TABLES `api_feedback` WRITE;
/*!40000 ALTER TABLE `api_feedback` DISABLE KEYS */;
INSERT INTO `api_feedback` VALUES (1,4,'Love the AI insights!','2026-03-26 06:17:43.574660',1),(2,3,'Very useful for tracking expenses.','2026-03-26 06:17:43.586419',2),(3,3,'','2026-03-26 10:19:52.876040',5);
/*!40000 ALTER TABLE `api_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_goal`
--

DROP TABLE IF EXISTS `api_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_goal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `target_amount` decimal(12,2) NOT NULL,
  `current_amount` decimal(12,2) NOT NULL,
  `deadline` date DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_goal_user_id_b5217161_fk_api_customuser_id` (`user_id`),
  CONSTRAINT `api_goal_user_id_b5217161_fk_api_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `api_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_goal`
--

LOCK TABLES `api_goal` WRITE;
/*!40000 ALTER TABLE `api_goal` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_notification`
--

DROP TABLE IF EXISTS `api_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `type` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_notification_user_id_6cede59e_fk_api_customuser_id` (`user_id`),
  CONSTRAINT `api_notification_user_id_6cede59e_fk_api_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `api_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_notification`
--

LOCK TABLES `api_notification` WRITE;
/*!40000 ALTER TABLE `api_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_passwordresetotp`
--

DROP TABLE IF EXISTS `api_passwordresetotp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_passwordresetotp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `otp_code` varchar(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_used` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_passwordresetotp_user_id_f36296cf_fk_api_customuser_id` (`user_id`),
  CONSTRAINT `api_passwordresetotp_user_id_f36296cf_fk_api_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `api_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_passwordresetotp`
--

LOCK TABLES `api_passwordresetotp` WRITE;
/*!40000 ALTER TABLE `api_passwordresetotp` DISABLE KEYS */;
INSERT INTO `api_passwordresetotp` VALUES (1,'636755','2026-03-26 07:53:32.557747',1,6),(2,'376705','2026-03-26 07:57:04.296611',1,6),(3,'433031','2026-03-26 07:58:15.563849',1,6),(4,'989473','2026-03-26 08:09:32.519927',0,6);
/*!40000 ALTER TABLE `api_passwordresetotp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_transaction`
--

DROP TABLE IF EXISTS `api_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(12,2) NOT NULL,
  `category` varchar(100) NOT NULL,
  `sub_category` varchar(100) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `is_night_spending` tinyint(1) NOT NULL,
  `is_subscription_leak` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_transaction_user_id_4a6f87d2_fk_api_customuser_id` (`user_id`),
  CONSTRAINT `api_transaction_user_id_4a6f87d2_fk_api_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `api_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_transaction`
--

LOCK TABLES `api_transaction` WRITE;
/*!40000 ALTER TABLE `api_transaction` DISABLE KEYS */;
INSERT INTO `api_transaction` VALUES (1,12500.00,'Food','AI-Detected','2026-03-25 03:17:43.393824','Swiggy order - biryani',1,0,1),(2,350.00,'Food','AI-Detected','2026-03-24 00:17:43.393824','Starbucks coffee',0,0,1),(3,2200.00,'Travel','AI-Detected','2026-03-23 05:17:43.393824','Uber to airport',0,0,1),(4,800.00,'Travel','AI-Detected','2026-03-20 19:17:43.393824','Auto rickshaw',0,0,1),(5,4500.00,'Shopping','AI-Detected','2026-03-21 22:17:43.393824','Amazon - headphones',0,0,1),(6,1200.00,'Shopping','AI-Detected','2026-03-19 19:17:43.393824','Clothes from Zara',0,0,1),(7,999.00,'Entertainment','AI-Detected','2026-03-19 03:17:43.393824','Netflix subscription',0,1,1),(8,500.00,'Entertainment','AI-Detected','2026-03-18 02:17:43.393824','Movie tickets',0,0,1),(9,3500.00,'Utilities','AI-Detected','2026-03-17 01:17:43.393824','Electricity bill',0,0,1),(10,1200.00,'Utilities','AI-Detected','2026-03-15 19:17:43.393824','Internet bill',0,0,1),(11,2000.00,'Healthcare','AI-Detected','2026-03-14 21:17:43.393824','Doctor visit',1,0,1),(12,750.00,'Healthcare','AI-Detected','2026-03-14 02:17:43.393824','Pharmacy',0,0,1),(13,5000.00,'Education','AI-Detected','2026-03-13 00:17:43.393824','Udemy courses',1,0,1),(14,1500.00,'Education','AI-Detected','2026-03-12 03:17:43.393824','Books',0,0,1),(15,15000.00,'Housing','AI-Detected','2026-03-10 22:17:43.393824','Monthly rent',0,0,1),(16,800.00,'Food','AI-Detected','2026-03-10 02:17:43.393824','Groceries',0,0,1),(17,350.00,'Food','AI-Detected','2026-03-09 00:17:43.393824','Tea and snacks',0,0,1),(18,3200.00,'Shopping','AI-Detected','2026-03-08 02:17:43.393824','Electronics store',1,0,1),(19,450.00,'Travel','AI-Detected','2026-03-07 04:17:43.393824','Bus ticket',0,0,1),(20,2000.00,'Insurance','AI-Detected','2026-03-06 03:17:43.393824','Health insurance EMI',0,0,1),(21,600.00,'Others','AI-Detected','2026-03-05 06:17:43.393824','Charity donation',0,0,1),(22,1800.00,'Food','AI-Detected','2026-03-03 19:17:43.393824','Restaurant dinner',0,0,1),(23,700.00,'Entertainment','AI-Detected','2026-03-02 21:17:43.393824','Spotify subscription',0,1,1),(24,900.00,'Utilities','AI-Detected','2026-03-01 21:17:43.393824','Water bill',0,0,1),(25,2500.00,'Shopping','AI-Detected','2026-03-01 05:17:43.393824','Birthday gift',0,0,1),(26,500.00,'Food','AI-Detected','2026-03-24 18:17:43.393824','College canteen',0,0,2),(27,1200.00,'Food','AI-Detected','2026-03-23 00:17:43.393824','Pizza Hut',0,0,2),(28,800.00,'Travel','AI-Detected','2026-03-21 05:17:43.393824','Metro card recharge',0,0,2),(29,3000.00,'Education','AI-Detected','2026-03-19 03:17:43.393824','Online course',0,0,2),(30,2500.00,'Shopping','AI-Detected','2026-03-16 00:17:43.393824','New backpack',0,0,2),(31,200.00,'Entertainment','AI-Detected','2026-03-14 00:17:43.393824','Game purchase',0,0,2),(32,1500.00,'Utilities','AI-Detected','2026-03-12 01:17:43.393824','Phone bill',0,0,2),(33,400.00,'Food','AI-Detected','2026-03-10 02:17:43.393824','Snacks',0,0,2),(34,1250.00,'Food','AI-Detected','2026-03-24 19:19:20.597119','Swiggy order - biryani',0,0,1),(35,350.00,'Food','AI-Detected','2026-03-23 23:19:20.597119','Starbucks coffee',0,0,1),(36,2200.00,'Travel','AI-Detected','2026-03-22 23:19:20.597119','Uber to airport',0,0,1),(37,800.00,'Travel','AI-Detected','2026-03-21 05:19:20.597119','Auto rickshaw',0,0,1),(38,4500.00,'Shopping','AI-Detected','2026-03-22 04:19:20.597119','Amazon - headphones',1,0,1),(39,1200.00,'Shopping','AI-Detected','2026-03-19 20:19:20.597119','Clothes from Zara',0,0,1),(40,999.00,'Entertainment','AI-Detected','2026-03-18 23:19:20.597119','Netflix subscription',0,1,1),(41,500.00,'Entertainment','AI-Detected','2026-03-18 04:19:20.597119','Movie tickets',0,0,1),(42,3500.00,'Utilities','AI-Detected','2026-03-16 22:19:20.597119','Electricity bill',1,0,1),(43,1200.00,'Utilities','AI-Detected','2026-03-16 04:19:20.597119','Internet bill',0,0,1),(44,2000.00,'Healthcare','AI-Detected','2026-03-15 01:19:20.597119','Doctor visit',0,0,1),(45,750.00,'Healthcare','AI-Detected','2026-03-14 00:19:20.597119','Pharmacy',0,0,1),(46,5000.00,'Education','AI-Detected','2026-03-13 06:19:20.597119','Udemy courses',1,0,1),(47,1500.00,'Education','AI-Detected','2026-03-12 06:19:20.597119','Books',0,0,1),(48,15000.00,'Housing','AI-Detected','2026-03-11 04:19:20.597119','Monthly rent',0,0,1),(49,800.00,'Food','AI-Detected','2026-03-10 02:19:20.597119','Groceries',0,0,1),(50,350.00,'Food','AI-Detected','2026-03-08 20:19:20.597119','Tea and snacks',0,0,1),(51,3200.00,'Shopping','AI-Detected','2026-03-08 00:19:20.597119','Electronics store',0,0,1),(52,450.00,'Travel','AI-Detected','2026-03-07 01:19:20.597119','Bus ticket',0,0,1),(53,2000.00,'Insurance','AI-Detected','2026-03-06 02:19:20.597119','Health insurance EMI',0,0,1),(54,600.00,'Others','AI-Detected','2026-03-05 06:19:20.597119','Charity donation',0,0,1),(55,1800.00,'Food','AI-Detected','2026-03-03 20:19:20.597119','Restaurant dinner',0,0,1),(56,700.00,'Entertainment','AI-Detected','2026-03-03 03:19:20.597119','Spotify subscription',0,1,1),(57,900.00,'Utilities','AI-Detected','2026-03-01 23:19:20.597119','Water bill',0,0,1),(58,2500.00,'Shopping','AI-Detected','2026-03-01 04:19:20.597119','Birthday gift',0,0,1),(59,500.00,'Food','AI-Detected','2026-03-25 01:19:20.597119','College canteen',0,0,2),(60,1200.00,'Food','AI-Detected','2026-03-22 20:19:20.597119','Pizza Hut',0,0,2),(61,800.00,'Travel','AI-Detected','2026-03-21 02:19:20.597119','Metro card recharge',0,0,2),(62,3000.00,'Education','AI-Detected','2026-03-19 03:19:20.597119','Online course',0,0,2),(63,2500.00,'Shopping','AI-Detected','2026-03-15 19:19:20.597119','New backpack',0,0,2),(64,200.00,'Entertainment','AI-Detected','2026-03-14 04:19:20.597119','Game purchase',0,0,2),(65,1500.00,'Utilities','AI-Detected','2026-03-11 18:19:20.597119','Phone bill',0,0,2),(66,400.00,'Food','AI-Detected','2026-03-10 00:19:20.597119','Snacks',0,0,2),(67,100.00,'Food','User-Entered','2026-03-26 08:54:01.164653','',0,0,7),(68,20.00,'Food','User-Entered','2026-03-26 08:56:45.073703','',0,0,5),(69,2.00,'Entertainment','User-Entered','2026-03-26 08:57:16.357905','',0,0,5),(70,200.00,'Education','User-Entered','2026-03-26 08:57:58.027976','',0,0,5),(71,34.00,'Utilities','AI-Assigned','2026-03-26 08:58:22.057257','34 recurrent expenses',0,0,5),(72,5.00,'Shopping','AI-Assigned','2026-03-26 08:59:05.099156','add 5 for shopping',0,0,5),(73,10.00,'Entertainment','User-Entered','2026-03-26 09:01:01.352418','',0,0,5),(74,10.00,'Shopping','User-Entered','2026-03-26 09:01:10.735346','',0,0,5),(75,20.00,'Recurrent Expenses','User-Entered','2026-03-26 09:01:28.732469','',0,0,5),(76,10.00,'Shopping','User-Entered','2026-03-26 10:13:24.720390','',0,0,5),(77,10.00,'Travel','AI-Assigned','2026-03-26 10:15:37.386736','add 10 to travel',0,0,5),(78,10.00,'Food','AI-Assigned','2026-03-26 14:43:00.868907','add 10 to food',0,0,5);
/*!40000 ALTER TABLE `api_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_userdnaprofile`
--

DROP TABLE IF EXISTS `api_userdnaprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_userdnaprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `income_fixed` decimal(12,2) NOT NULL,
  `income_variable` decimal(12,2) NOT NULL,
  `user_category` varchar(50) NOT NULL,
  `personality_tag` varchar(50) DEFAULT NULL,
  `financial_goals` longtext NOT NULL,
  `user_id` bigint NOT NULL,
  `is_onboarded` tinyint(1) NOT NULL,
  `preferred_currency` varchar(5) NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `api_userdnaprofile_user_id_bc7bb275_fk_api_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `api_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_userdnaprofile`
--

LOCK TABLES `api_userdnaprofile` WRITE;
/*!40000 ALTER TABLE `api_userdnaprofile` DISABLE KEYS */;
INSERT INTO `api_userdnaprofile` VALUES (1,80000.00,20000.00,'Professional','High Roller','Save for vacation, Build emergency fund',1,1,'INR',NULL),(2,50000.00,10000.00,'Student','Balanced','Save for Laptop, Pay off loans',2,1,'INR',NULL),(3,120000.00,30000.00,'Professional','Saver','Buy a car, Invest in stocks',3,1,'USD',NULL),(4,1900.00,0.00,'Professional','Balanced','Travel & Vacation',4,1,'USD',NULL),(5,12000.00,0.00,'Retired','Balanced','Pay off Debt',5,1,'USD',NULL),(6,1200.00,0.00,'Professional','Balanced','Travel & Vacation',6,1,'USD',NULL),(7,1200.00,0.00,'Professional','Balanced','Save for a House, Travel & Vacation',7,1,'USD',NULL);
/*!40000 ALTER TABLE `api_userdnaprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add budget',7,'add_budget'),(26,'Can change budget',7,'change_budget'),(27,'Can delete budget',7,'delete_budget'),(28,'Can view budget',7,'view_budget'),(29,'Can add goal',8,'add_goal'),(30,'Can change goal',8,'change_goal'),(31,'Can delete goal',8,'delete_goal'),(32,'Can view goal',8,'view_goal'),(33,'Can add notification',9,'add_notification'),(34,'Can change notification',9,'change_notification'),(35,'Can delete notification',9,'delete_notification'),(36,'Can view notification',9,'view_notification'),(37,'Can add transaction',10,'add_transaction'),(38,'Can change transaction',10,'change_transaction'),(39,'Can delete transaction',10,'delete_transaction'),(40,'Can view transaction',10,'view_transaction'),(41,'Can add user dna profile',11,'add_userdnaprofile'),(42,'Can change user dna profile',11,'change_userdnaprofile'),(43,'Can delete user dna profile',11,'delete_userdnaprofile'),(44,'Can view user dna profile',11,'view_userdnaprofile'),(45,'Can add feedback',12,'add_feedback'),(46,'Can change feedback',12,'change_feedback'),(47,'Can delete feedback',12,'delete_feedback'),(48,'Can view feedback',12,'view_feedback'),(49,'Can add site',13,'add_site'),(50,'Can change site',13,'change_site'),(51,'Can delete site',13,'delete_site'),(52,'Can view site',13,'view_site'),(53,'Can add email address',14,'add_emailaddress'),(54,'Can change email address',14,'change_emailaddress'),(55,'Can delete email address',14,'delete_emailaddress'),(56,'Can view email address',14,'view_emailaddress'),(57,'Can add email confirmation',15,'add_emailconfirmation'),(58,'Can change email confirmation',15,'change_emailconfirmation'),(59,'Can delete email confirmation',15,'delete_emailconfirmation'),(60,'Can view email confirmation',15,'view_emailconfirmation'),(61,'Can add social account',16,'add_socialaccount'),(62,'Can change social account',16,'change_socialaccount'),(63,'Can delete social account',16,'delete_socialaccount'),(64,'Can view social account',16,'view_socialaccount'),(65,'Can add social application',17,'add_socialapp'),(66,'Can change social application',17,'change_socialapp'),(67,'Can delete social application',17,'delete_socialapp'),(68,'Can view social application',17,'view_socialapp'),(69,'Can add social application token',18,'add_socialtoken'),(70,'Can change social application token',18,'change_socialtoken'),(71,'Can delete social application token',18,'delete_socialtoken'),(72,'Can view social application token',18,'view_socialtoken'),(73,'Can add password reset otp',19,'add_passwordresetotp'),(74,'Can change password reset otp',19,'change_passwordresetotp'),(75,'Can delete password reset otp',19,'delete_passwordresetotp'),(76,'Can view password reset otp',19,'view_passwordresetotp');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_api_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_api_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `api_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'account','emailaddress'),(15,'account','emailconfirmation'),(1,'admin','logentry'),(7,'api','budget'),(6,'api','customuser'),(12,'api','feedback'),(8,'api','goal'),(9,'api','notification'),(19,'api','passwordresetotp'),(10,'api','transaction'),(11,'api','userdnaprofile'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(13,'sites','site'),(16,'socialaccount','socialaccount'),(17,'socialaccount','socialapp'),(18,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-03-26 06:12:57.227478'),(2,'contenttypes','0002_remove_content_type_name','2026-03-26 06:12:57.374254'),(3,'auth','0001_initial','2026-03-26 06:12:57.759832'),(4,'auth','0002_alter_permission_name_max_length','2026-03-26 06:12:57.879854'),(5,'auth','0003_alter_user_email_max_length','2026-03-26 06:12:57.888974'),(6,'auth','0004_alter_user_username_opts','2026-03-26 06:12:57.900639'),(7,'auth','0005_alter_user_last_login_null','2026-03-26 06:12:57.910978'),(8,'auth','0006_require_contenttypes_0002','2026-03-26 06:12:57.918406'),(9,'auth','0007_alter_validators_add_error_messages','2026-03-26 06:12:57.928540'),(10,'auth','0008_alter_user_username_max_length','2026-03-26 06:12:57.938345'),(11,'auth','0009_alter_user_last_name_max_length','2026-03-26 06:12:57.950884'),(12,'auth','0010_alter_group_name_max_length','2026-03-26 06:12:57.991194'),(13,'auth','0011_update_proxy_permissions','2026-03-26 06:12:57.999942'),(14,'auth','0012_alter_user_first_name_max_length','2026-03-26 06:12:58.015458'),(15,'api','0001_initial','2026-03-26 06:12:58.974634'),(16,'admin','0001_initial','2026-03-26 06:12:59.159709'),(17,'admin','0002_logentry_remove_auto_add','2026-03-26 06:12:59.167241'),(18,'admin','0003_logentry_add_action_flag_choices','2026-03-26 06:12:59.181527'),(19,'api','0002_userdnaprofile_is_onboarded_and_more','2026-03-26 06:12:59.334461'),(20,'api','0003_alter_transaction_date','2026-03-26 06:12:59.346434'),(21,'api','0004_feedback','2026-03-26 06:12:59.482407'),(22,'sessions','0001_initial','2026-03-26 06:12:59.538999'),(23,'account','0001_initial','2026-03-26 07:12:07.092693'),(24,'account','0002_email_max_length','2026-03-26 07:12:07.124480'),(25,'account','0003_alter_emailaddress_create_unique_verified_email','2026-03-26 07:12:07.182138'),(26,'account','0004_alter_emailaddress_drop_unique_email','2026-03-26 07:12:07.249989'),(27,'account','0005_emailaddress_idx_upper_email','2026-03-26 07:12:07.292811'),(28,'api','0005_passwordresetotp','2026-03-26 07:12:07.419161'),(29,'sites','0001_initial','2026-03-26 07:12:07.455366'),(30,'sites','0002_alter_domain_unique','2026-03-26 07:12:07.486979'),(31,'socialaccount','0001_initial','2026-03-26 07:12:08.109449'),(32,'socialaccount','0002_token_max_lengths','2026-03-26 07:12:08.174271'),(33,'socialaccount','0003_extra_data_default_dict','2026-03-26 07:12:08.189215'),(34,'socialaccount','0004_app_provider_id_settings','2026-03-26 07:12:08.424558'),(35,'socialaccount','0005_socialtoken_nullable_app','2026-03-26 07:12:08.608344'),(36,'socialaccount','0006_alter_socialaccount_extra_data','2026-03-26 07:12:08.711906'),(37,'api','0006_userdnaprofile_profile_picture','2026-03-26 16:37:42.230754');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6umsq2xkltlcs6r6jrn11s9rsu8v2bpw','eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sImVNOWpsejJNWFljbU1UT2QiXX0:1w5g9y:SXskS5pIA2QY5Vxl8XSLbLGUZ5dib0_nQhfJ2O2tk0M','2026-04-09 08:33:46.336172');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` json NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_social_user_id_8146e70c_fk_api_custo` (`user_id`),
  CONSTRAINT `socialaccount_social_user_id_8146e70c_fk_api_custo` FOREIGN KEY (`user_id`) REFERENCES `api_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-27 10:46:51
