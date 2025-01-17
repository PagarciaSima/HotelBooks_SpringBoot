CREATE DATABASE  IF NOT EXISTS `db_hotelsbook` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_hotelsbook`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_hotelsbook
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `number` int NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`,`city_id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_address_city1_idx` (`city_id`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Los Ángeles',541,1),(2,'Los muermos',155,2),(3,'Marcoleta',395,3);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'California','Estados Unidos'),(2,'Transilvania','Estados Unidos'),(3,'Santiago','Chile');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `picture` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`id`,`address_id`),
  KEY `fk_hotel_address_idx` (`address_id`),
  CONSTRAINT `fk_hotel_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Hotel California','300','hotel1.jpg','Hotel ubicado en el centro del estado de California',1),(2,'Hotel Transilvania','230','hotel2.jpg','Hotel ubicado en el centro del estado de California',2),(3,'Hotel ISBI','180','hotel3.jpg','Hotel ubicado en el centro de la capital de Chile',3);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_available`
--

DROP TABLE IF EXISTS `hotel_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_available` (
  `id` bigint NOT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_available`
--

LOCK TABLES `hotel_available` WRITE;
/*!40000 ALTER TABLE `hotel_available` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel_available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_has_review`
--

DROP TABLE IF EXISTS `hotel_has_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_has_review` (
  `hotel_id` int NOT NULL,
  `hotel_address_id` int NOT NULL,
  `review_id` int NOT NULL,
  PRIMARY KEY (`hotel_id`,`hotel_address_id`,`review_id`),
  KEY `fk_hotel_has_review_review1_idx` (`review_id`),
  KEY `fk_hotel_has_review_hotel1_idx` (`hotel_id`,`hotel_address_id`),
  CONSTRAINT `fk_hotel_has_review_hotel1` FOREIGN KEY (`hotel_id`, `hotel_address_id`) REFERENCES `hotel` (`id`, `address_id`),
  CONSTRAINT `fk_hotel_has_review_review1` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_has_review`
--

LOCK TABLES `hotel_has_review` WRITE;
/*!40000 ALTER TABLE `hotel_has_review` DISABLE KEYS */;
INSERT INTO `hotel_has_review` VALUES (1,1,1),(2,2,1),(3,3,1),(1,1,2),(2,2,2),(3,3,2);
/*!40000 ALTER TABLE `hotel_has_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_service_entity`
--

DROP TABLE IF EXISTS `hotel_service_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_service_entity` (
  `hotel_id` bigint NOT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  `service_id` bigint DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_service_entity`
--

LOCK TABLES `hotel_service_entity` WRITE;
/*!40000 ALTER TABLE `hotel_service_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel_service_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_in` date NOT NULL,
  `date_out` date NOT NULL,
  `room_id` int NOT NULL,
  PRIMARY KEY (`id`,`room_id`),
  UNIQUE KEY `unique_reservation_id` (`id`),
  KEY `fk_reservation_room1_idx` (`room_id`),
  CONSTRAINT `fk_reservation_room1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2024-12-12','2024-12-16',1),(2,'2024-12-12','2024-12-16',3),(3,'2024-09-18','2024-09-21',2);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_has_hotel`
--

DROP TABLE IF EXISTS `reservation_has_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_has_hotel` (
  `reservation_id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `hotel_address_id` int NOT NULL,
  PRIMARY KEY (`reservation_id`,`hotel_id`,`hotel_address_id`),
  KEY `fk_reservation_has_hotel_hotel1_idx` (`hotel_id`,`hotel_address_id`),
  KEY `fk_reservation_has_hotel_reservation1_idx` (`reservation_id`),
  CONSTRAINT `fk_reservation_has_hotel_hotel1` FOREIGN KEY (`hotel_id`, `hotel_address_id`) REFERENCES `hotel` (`id`, `address_id`),
  CONSTRAINT `fk_reservation_has_hotel_reservation1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_has_hotel`
--

LOCK TABLES `reservation_has_hotel` WRITE;
/*!40000 ALTER TABLE `reservation_has_hotel` DISABLE KEYS */;
INSERT INTO `reservation_has_hotel` VALUES (1,1,1);
/*!40000 ALTER TABLE `reservation_has_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calification` decimal(3,0) NOT NULL,
  `description` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,5,'Maravilloso'),(2,4,'Excelente'),(3,3,'Bien'),(4,2,'Regular'),(5,1,'Mal');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_entity`
--

DROP TABLE IF EXISTS `review_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_entity` (
  `hotel_id` bigint NOT NULL,
  `average_calification` double DEFAULT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_entity`
--

LOCK TABLES `review_entity` WRITE;
/*!40000 ALTER TABLE `review_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `number_passenger` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,21,'Suite presidencial',4),(2,45,'Suite presidencial',4),(3,2,'Pieza matrimonial',4),(4,13,'Pieza familiar',4);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Wifi gratis'),(2,'Parking gratis'),(3,'Aire acondicionado'),(4,'Restaurante'),(5,'Gym');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_has_hotel`
--

DROP TABLE IF EXISTS `service_has_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_has_hotel` (
  `service_id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `hotel_address_id` int NOT NULL,
  PRIMARY KEY (`service_id`,`hotel_id`,`hotel_address_id`),
  KEY `fk_service_has_hotel_hotel1_idx` (`hotel_id`,`hotel_address_id`),
  KEY `fk_service_has_hotel_service1_idx` (`service_id`),
  CONSTRAINT `fk_service_has_hotel_hotel1` FOREIGN KEY (`hotel_id`, `hotel_address_id`) REFERENCES `hotel` (`id`, `address_id`),
  CONSTRAINT `fk_service_has_hotel_service1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_has_hotel`
--

LOCK TABLES `service_has_hotel` WRITE;
/*!40000 ALTER TABLE `service_has_hotel` DISABLE KEYS */;
INSERT INTO `service_has_hotel` VALUES (1,1,1),(1,2,2),(1,3,3),(2,1,1),(2,2,2),(2,3,3),(3,1,1),(3,2,2),(3,3,3),(4,1,1),(4,2,2),(4,3,3),(5,1,1),(5,2,2),(5,3,3);
/*!40000 ALTER TABLE `service_has_hotel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-17 17:11:02
