-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mergedb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `certificatetwo`
--

DROP TABLE IF EXISTS `certificatetwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificatetwo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` varchar(255) DEFAULT NULL,
  `instructor` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pdf_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificatetwo`
--

LOCK TABLES `certificatetwo` WRITE;
/*!40000 ALTER TABLE `certificatetwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificatetwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certification`
--

DROP TABLE IF EXISTS `certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certification` (
  `certificateid` bigint NOT NULL AUTO_INCREMENT,
  `certificate_file` varchar(255) DEFAULT NULL,
  `criteria` varchar(255) DEFAULT NULL,
  `date_issued` date DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `quiztkn_id` bigint DEFAULT NULL,
  PRIMARY KEY (`certificateid`),
  KEY `FKe4itqasqo0hufsvwv39gxjful` (`quiztkn_id`),
  CONSTRAINT `FKe4itqasqo0hufsvwv39gxjful` FOREIGN KEY (`quiztkn_id`) REFERENCES `quiz_taken` (`quiztknid`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certification`
--

LOCK TABLES `certification` WRITE;
/*!40000 ALTER TABLE `certification` DISABLE KEYS */;
INSERT INTO `certification` VALUES (65,'Joshua Allada-Java programming.pdf','test','2024-01-29','B55-310664',1),(66,'John Doe-Java programming.pdf','test','2024-01-29','B55-440397',6),(67,'John Doe-Java programming.pdf','test','2024-01-29','B55-715426',6),(68,'John Doe-Java programming.pdf','test','2024-01-29','B55-654055',6),(69,'John Doe-Java programming.pdf','test','2024-01-29','B55-274639',6),(70,'John Doe-Java programming.pdf','test','2024-01-29','B55-188353',6),(71,'John Doe-Java programming.pdf','test','2024-01-29','B55-806492',6),(72,'Joshua Allada-Java programming.pdf','test','2024-01-29','B55-591617',1),(73,'Joshua Allada-Java programming.pdf','test','2024-01-30','B55-768076',1),(74,'Joshua Allada-Java programming.pdf','test','2024-01-30','B55-63736',1),(75,'Joshua Allada-Java programming.pdf','test','2024-01-30','B55-794111',1),(76,'Joshua Allada-Java programming.pdf','test','2024-01-30','B55-715087',1),(77,'John Doe-Java programming.pdf','test','2024-01-30','B55-295180',6),(78,'John Doe-Java programming.pdf','test','2024-01-30','B55-846269',6);
/*!40000 ALTER TABLE `certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseid` bigint NOT NULL AUTO_INCREMENT,
  `criteria` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `instructor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`courseid`),
  KEY `FKqk2yq2yk124dhlsilomy36qr9` (`instructor_id`),
  CONSTRAINT `FKqk2yq2yk124dhlsilomy36qr9` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructorid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'test','Java basics 101.','2024-02-20','java.pdf','java.png','2024-01-20','Java programming',1);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `enrollmentid` bigint NOT NULL AUTO_INCREMENT,
  `cancellation_reason` varchar(255) DEFAULT NULL,
  `cancelled` varchar(255) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  `support_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`enrollmentid`),
  KEY `FKbhhcqkw1px6yljqg92m0sh2gt` (`course_id`),
  KEY `FKmy1hnpppxotxu770v1lktqc5d` (`support_id`),
  KEY `FK4x08no2mpupkr616h50w3aksx` (`user_id`),
  CONSTRAINT `FK4x08no2mpupkr616h50w3aksx` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`),
  CONSTRAINT `FKbhhcqkw1px6yljqg92m0sh2gt` FOREIGN KEY (`course_id`) REFERENCES `course` (`courseid`),
  CONSTRAINT `FKmy1hnpppxotxu770v1lktqc5d` FOREIGN KEY (`support_id`) REFERENCES `support` (`supportid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (2,'','','2024-01-18',1,1,1);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `instructorid` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instructorid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'nbadong@tspi.com.ph','Norman Badong','test','link',NULL,'nbadong');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `quizid` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `target_score` bigint DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  PRIMARY KEY (`quizid`),
  KEY `FKce16mrsgeokucc022mpyev7xk` (`course_id`),
  CONSTRAINT `FKce16mrsgeokucc022mpyev7xk` FOREIGN KEY (`course_id`) REFERENCES `course` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,'Html and Css quiz','2024-02-20','Link','image file name','2024-01-20',80,'Quiz 1',1);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_taken`
--

DROP TABLE IF EXISTS `quiz_taken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_taken` (
  `quiztknid` bigint NOT NULL AUTO_INCREMENT,
  `quiz_score` bigint DEFAULT NULL,
  `quiz_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`quiztknid`),
  KEY `FK7ak367u7s0qa2qgsrcm2c7je0` (`quiz_id`),
  KEY `FKdg7v46xi5m864xyucto8isr74` (`user_id`),
  CONSTRAINT `FK7ak367u7s0qa2qgsrcm2c7je0` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quizid`),
  CONSTRAINT `FKdg7v46xi5m864xyucto8isr74` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_taken`
--

LOCK TABLES `quiz_taken` WRITE;
/*!40000 ALTER TABLE `quiz_taken` DISABLE KEYS */;
INSERT INTO `quiz_taken` VALUES (1,83,1,1),(2,83,1,NULL),(3,83,1,1),(6,75,1,2),(12,40,1,3);
/*!40000 ALTER TABLE `quiz_taken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support` (
  `supportid` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`supportid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support`
--

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
INSERT INTO `support` VALUES (1,'admin@tspi.com.ph','Administrator','admin','link','admin');
/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userid` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jallada@tspi.com.ph','Joshua Allada','TestTest','link','jallada'),(2,'john@example.com','John Doe','secretpassword','user','johndoe'),(3,'cv@example.com','Christian Villafuerte','-------','user.link','cvillafuerte');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification`
--

DROP TABLE IF EXISTS `verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification` (
  `verificationid` bigint NOT NULL AUTO_INCREMENT,
  `serial_no` bigint DEFAULT NULL,
  `course_title` varchar(255) DEFAULT NULL,
  `full_name` bigint DEFAULT NULL,
  PRIMARY KEY (`verificationid`),
  KEY `FKh4oj6dyemgtkcdr6v873frn8f` (`serial_no`),
  KEY `FKnjhkjot9g2vbiropn1ek4welo` (`full_name`),
  CONSTRAINT `FKh4oj6dyemgtkcdr6v873frn8f` FOREIGN KEY (`serial_no`) REFERENCES `certification` (`certificateid`),
  CONSTRAINT `FKnjhkjot9g2vbiropn1ek4welo` FOREIGN KEY (`full_name`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification`
--

LOCK TABLES `verification` WRITE;
/*!40000 ALTER TABLE `verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-30 14:13:08
