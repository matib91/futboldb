CREATE DATABASE  IF NOT EXISTS `futboldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `futboldb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: futboldb
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `ciudad_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `pais_id` int NOT NULL,
  PRIMARY KEY (`ciudad_id`),
  KEY `fk_pais_id` (`pais_id`),
  CONSTRAINT `fk_pais_id` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Buenos Aires',1),(2,'Rosario',1),(3,'Rio de Janeiro',2),(4,'São Paulo',2),(5,'Madrid',3),(6,'Barcelona',3),(7,'Roma',4),(8,'Milán',4);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencia`
--

DROP TABLE IF EXISTS `competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competencia` (
  `competencia_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `pais_id` int NOT NULL,
  PRIMARY KEY (`competencia_id`),
  KEY `fk_pais_id_competencia` (`pais_id`),
  CONSTRAINT `fk_pais_id_competencia` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencia`
--

LOCK TABLES `competencia` WRITE;
/*!40000 ALTER TABLE `competencia` DISABLE KEYS */;
INSERT INTO `competencia` VALUES (1,'Liga Profesional Argentina',1),(2,'Brasileirão',2),(3,'La Liga',3),(4,'Serie A',4);
/*!40000 ALTER TABLE `competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `equipo_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `ciudad_id` int NOT NULL,
  PRIMARY KEY (`equipo_id`),
  KEY `fk_ciudad_id` (`ciudad_id`),
  CONSTRAINT `fk_ciudad_id` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudad` (`ciudad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'River Plate',1),(2,'Boca Juniors',1),(3,'Newell\'s Old Boys',2),(4,'Rosario Central',2),(5,'Flamengo',3),(6,'Botafogo',3),(7,'Corinthians',4),(8,'Palmeiras',4),(9,'Real Madrid',5),(10,'Atlético Madrid',5),(11,'Barcelona',6),(12,'Espanyol',6),(13,'AS Roma',7),(14,'Lazio',7),(15,'AC Milan',8),(16,'Inter Milan',8);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo_competencia`
--

DROP TABLE IF EXISTS `equipo_competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo_competencia` (
  `equipo_competencia_id` int NOT NULL AUTO_INCREMENT,
  `equipo_id` int NOT NULL,
  `competencia_id` int NOT NULL,
  PRIMARY KEY (`equipo_competencia_id`),
  KEY `fk_equipo_comp_equipo_id` (`equipo_id`),
  KEY `fk_equipo_comp_competencia_id` (`competencia_id`),
  CONSTRAINT `fk_equipo_comp_competencia_id` FOREIGN KEY (`competencia_id`) REFERENCES `competencia` (`competencia_id`),
  CONSTRAINT `fk_equipo_comp_equipo_id` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`equipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo_competencia`
--

LOCK TABLES `equipo_competencia` WRITE;
/*!40000 ALTER TABLE `equipo_competencia` DISABLE KEYS */;
INSERT INTO `equipo_competencia` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,2),(6,6,2),(7,7,2),(8,8,2),(9,9,3),(10,10,3),(11,11,3),(12,12,3),(13,13,4),(14,14,4),(15,15,4),(16,16,4);
/*!40000 ALTER TABLE `equipo_competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadisticas_jugador`
--

DROP TABLE IF EXISTS `estadisticas_jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadisticas_jugador` (
  `estadistica_id` int NOT NULL AUTO_INCREMENT,
  `partido_id` int NOT NULL,
  `jugador_id` int NOT NULL,
  `goles` int NOT NULL,
  `asistencias` int NOT NULL,
  `minutos_jugados` decimal(5,2) NOT NULL,
  `tarj_roja` tinyint(1) NOT NULL,
  `tarj_amarilla` tinyint(1) NOT NULL,
  PRIMARY KEY (`estadistica_id`),
  KEY `fk_estadisticas_partido_id` (`partido_id`),
  KEY `fk_estadisticas_jugador_id` (`jugador_id`),
  CONSTRAINT `fk_estadisticas_jugador_id` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`jugador_id`),
  CONSTRAINT `fk_estadisticas_partido_id` FOREIGN KEY (`partido_id`) REFERENCES `partido` (`partido_id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadisticas_jugador`
--

LOCK TABLES `estadisticas_jugador` WRITE;
/*!40000 ALTER TABLE `estadisticas_jugador` DISABLE KEYS */;
INSERT INTO `estadisticas_jugador` VALUES (1,1,1,1,0,90.00,0,0),(2,1,2,0,1,85.00,0,1),(3,1,3,0,0,45.00,0,1),(4,1,4,0,0,0.00,0,0),(5,1,5,0,0,0.00,0,0),(6,1,6,1,0,90.00,0,0),(7,1,16,0,1,80.00,0,0),(8,1,17,0,0,90.00,0,0),(9,1,18,1,0,45.00,0,1),(10,1,19,0,0,90.00,0,0),(11,1,20,0,0,80.00,0,0),(12,2,30,0,0,80.00,0,0),(13,2,31,0,0,90.00,0,0),(14,2,32,0,0,90.00,0,0),(15,2,33,0,1,90.00,0,0),(16,2,34,1,0,85.00,0,1),(17,2,41,1,0,90.00,0,0),(18,2,42,0,0,60.00,0,0),(19,2,43,0,0,90.00,0,0),(20,2,44,0,0,90.00,0,0),(21,2,45,1,0,75.00,0,1),(22,2,46,0,0,90.00,0,0),(23,3,20,0,0,90.00,0,0),(24,3,21,0,0,90.00,0,0),(25,3,22,0,0,90.00,0,0),(26,3,23,0,0,90.00,0,0),(27,3,24,0,0,90.00,0,0),(28,3,25,0,0,90.00,0,0),(29,3,1,0,0,70.00,0,0),(30,3,2,0,0,90.00,0,0),(31,3,3,0,1,90.00,0,1),(32,3,4,0,0,30.00,0,0),(33,3,5,0,0,85.00,0,0),(34,4,40,0,0,90.00,0,0),(35,4,41,1,1,90.00,0,0),(36,4,42,1,1,80.00,0,0),(37,4,43,0,0,90.00,0,0),(38,4,44,0,0,90.00,0,0),(39,4,45,0,0,75.00,0,0),(40,4,30,0,0,85.00,0,0),(41,4,31,0,0,90.00,0,0),(42,4,32,0,2,90.00,0,0),(43,4,33,2,0,90.00,0,0),(44,5,1,0,0,90.00,0,0),(45,5,2,0,0,90.00,0,0),(46,5,6,0,0,90.00,0,0),(47,5,7,0,0,70.00,0,0),(48,5,8,1,0,90.00,0,0),(49,5,30,0,0,90.00,0,0),(50,5,31,0,0,90.00,0,0),(51,5,32,0,0,90.00,0,0),(52,5,33,0,0,90.00,0,0),(53,5,34,0,0,90.00,0,0),(54,6,55,3,0,90.00,0,0),(55,6,56,0,3,90.00,0,0),(56,6,57,0,0,90.00,0,0),(57,6,58,0,0,30.00,1,0),(58,6,59,0,0,80.00,0,0),(59,6,75,1,0,90.00,0,0),(60,6,76,1,0,90.00,1,0),(61,6,77,0,2,90.00,0,0),(62,6,78,0,0,90.00,0,0),(63,6,79,0,0,90.00,0,0),(64,7,85,2,0,90.00,0,0),(65,7,86,0,0,90.00,0,0),(66,7,87,0,2,90.00,0,0),(67,7,88,0,0,90.00,0,0),(68,7,89,0,0,80.00,0,0),(69,7,90,0,0,65.00,0,0),(70,7,100,0,0,90.00,0,0),(71,7,103,0,0,90.00,0,1),(72,7,104,0,0,90.00,1,0),(73,7,105,0,0,90.00,0,0),(74,8,70,1,0,90.00,0,0),(75,8,71,0,1,90.00,0,0),(76,8,72,0,0,90.00,0,0),(77,8,73,0,0,90.00,0,0),(78,8,74,0,0,50.00,0,0),(79,8,56,1,0,90.00,0,0),(80,8,57,0,1,90.00,0,0),(81,8,58,0,0,90.00,0,0),(82,8,59,0,0,80.00,1,0),(83,8,60,0,0,80.00,0,0),(84,9,108,0,0,90.00,0,0),(85,9,109,0,0,90.00,0,0),(86,9,110,0,0,90.00,0,0),(87,9,111,0,0,90.00,0,0),(88,9,112,0,0,90.00,0,0),(89,9,113,0,0,90.00,0,0),(90,9,104,0,0,90.00,0,0),(91,9,85,0,1,90.00,0,0),(92,9,86,2,0,90.00,0,0),(93,9,87,1,1,90.00,0,1),(94,10,56,1,0,90.00,0,0),(95,10,57,0,1,90.00,0,0),(96,10,58,0,0,90.00,0,0),(97,10,59,0,0,90.00,0,0),(98,10,60,0,0,70.00,0,0),(99,10,61,0,0,60.00,0,0),(100,10,86,1,0,90.00,0,0),(101,10,87,0,0,90.00,0,0),(102,10,88,0,0,90.00,1,0),(103,10,89,0,0,90.00,0,0),(104,11,115,0,0,90.00,0,0),(105,11,116,2,0,90.00,0,0),(106,11,117,0,0,70.00,0,0),(107,11,118,0,2,90.00,0,0),(108,11,119,0,0,90.00,0,0),(109,11,120,1,0,90.00,0,0),(110,11,132,2,0,90.00,0,0),(111,11,133,0,0,90.00,1,0),(112,11,134,0,2,80.00,0,0),(113,11,135,0,0,70.00,0,0),(114,12,160,0,0,90.00,0,0),(115,12,161,0,0,90.00,1,0),(116,12,162,0,0,80.00,0,0),(117,12,163,0,0,80.00,0,0),(118,12,164,0,0,70.00,0,0),(119,12,165,1,0,90.00,0,1),(120,12,145,0,0,90.00,0,0),(121,12,146,0,3,90.00,0,0),(122,12,147,0,0,90.00,0,0),(123,12,148,3,0,90.00,0,0),(124,13,130,0,0,90.00,0,0),(125,13,131,0,0,90.00,0,0),(126,13,132,0,0,90.00,1,0),(127,13,133,0,0,90.00,1,0),(128,13,134,0,0,90.00,0,0),(129,13,135,0,0,90.00,0,0),(130,13,116,0,0,70.00,0,1),(131,13,118,1,0,90.00,0,0),(132,13,119,0,1,70.00,0,1),(133,13,120,0,0,80.00,0,0),(134,14,161,1,0,90.00,0,0),(135,14,171,0,1,90.00,0,0),(136,14,162,0,0,90.00,0,0),(137,14,163,0,0,90.00,0,0),(138,14,164,0,0,90.00,0,0),(139,14,165,0,0,80.00,0,0),(140,14,146,0,0,8.00,0,1),(141,14,147,0,2,90.00,0,0),(142,14,148,1,0,90.00,0,0),(143,14,149,1,0,90.00,0,0),(144,15,116,0,2,90.00,0,0),(145,15,117,0,0,90.00,0,0),(146,15,118,2,0,90.00,0,0),(147,15,119,0,0,80.00,0,0),(148,15,120,0,0,50.00,0,1),(149,15,147,0,0,60.00,0,0),(150,15,148,0,0,80.00,0,0),(151,15,149,0,0,90.00,0,1),(152,15,150,0,0,90.00,0,0),(153,15,151,0,0,90.00,0,0),(154,16,175,0,1,90.00,0,0),(155,16,176,1,0,90.00,0,0),(156,16,177,0,0,90.00,0,0),(157,16,178,0,0,90.00,0,0),(158,16,179,0,0,90.00,0,0),(159,16,190,0,0,90.00,0,0),(160,16,191,0,0,80.00,0,0),(161,16,192,0,0,70.00,1,0),(162,16,193,1,0,90.00,0,0),(163,16,194,0,1,90.00,0,0),(164,17,209,0,0,90.00,0,0),(165,17,210,2,0,90.00,0,0),(166,17,211,0,1,90.00,0,0),(167,17,212,0,1,50.00,0,1),(168,17,213,0,0,60.00,0,0),(169,17,214,0,0,60.00,0,0),(170,17,224,0,0,90.00,0,0),(171,17,225,0,0,90.00,0,0),(172,17,226,0,2,90.00,0,0),(173,17,227,2,0,90.00,0,0),(174,18,191,0,0,90.00,0,0),(175,18,192,0,0,90.00,0,0),(176,18,193,0,0,90.00,0,0),(177,18,194,0,0,90.00,0,0),(178,18,195,0,0,90.00,0,0),(179,18,196,0,0,90.00,0,0),(180,18,176,0,0,90.00,0,0),(181,18,177,0,0,90.00,0,0),(182,18,178,0,0,90.00,0,0),(183,18,179,0,0,25.00,0,1),(184,19,226,3,0,90.00,0,0),(185,19,227,0,2,90.00,0,0),(186,19,228,0,1,90.00,0,0),(187,19,229,0,0,90.00,1,0),(188,19,230,0,0,70.00,1,0),(189,19,231,0,0,90.00,0,0),(190,19,210,2,0,90.00,0,0),(191,19,215,0,2,90.00,0,0),(192,19,216,1,0,90.00,0,0),(193,19,218,0,1,90.00,0,0),(194,20,176,2,0,90.00,0,0),(195,20,177,0,2,90.00,0,0),(196,20,178,0,0,90.00,0,0),(197,20,179,0,0,90.00,1,0),(198,20,180,0,0,70.00,1,0),(199,20,181,0,0,90.00,0,0),(200,20,210,0,0,90.00,0,0),(201,20,215,0,0,90.00,0,0),(202,20,216,1,0,90.00,0,0),(203,20,218,0,1,90.00,0,0);
/*!40000 ALTER TABLE `estadisticas_jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `jugador_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `equipo_id` int NOT NULL,
  `pais_id` int NOT NULL,
  `posicion` varchar(50) NOT NULL,
  `fecha_nac` date NOT NULL,
  `altura` decimal(4,2) NOT NULL,
  `peso` decimal(5,2) NOT NULL,
  `pierna_habil` varchar(10) NOT NULL,
  PRIMARY KEY (`jugador_id`),
  KEY `fk_jugadores_equipo_id` (`equipo_id`),
  KEY `fk_jugadores_pais_id` (`pais_id`),
  CONSTRAINT `fk_jugadores_equipo_id` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`equipo_id`),
  CONSTRAINT `fk_jugadores_pais_id` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'Ignacio','Scocco',1,1,'Delantero','1985-05-29',1.79,72.00,'Derecha'),(2,'Brian','Romero',1,1,'Delantero','1991-06-15',1.76,74.00,'Derecha'),(3,'Emanuel','Mammana',1,1,'Defensor','1996-02-10',1.84,76.00,'Derecha'),(4,'Cristian','Pavón',1,1,'Delantero','1996-01-21',1.73,74.00,'Derecha'),(5,'Alan','Velasco',1,1,'Delantero','2002-07-27',1.67,67.00,'Derecha'),(6,'Federico','Girotti',1,1,'Delantero','1999-06-02',1.89,83.00,'Izquierda'),(7,'Lautaro','Acosta',1,1,'Delantero','1988-03-14',1.69,68.00,'Derecha'),(8,'Leandro','Díaz',1,1,'Portero','1992-06-06',1.85,79.00,'Derecha'),(9,'Agustín','Bouzat',1,1,'Delantero','1994-03-28',1.69,64.00,'Izquierda'),(10,'Alexander','Barboza',1,1,'Defensor','1995-03-16',1.93,85.00,'Izquierda'),(11,'Leonardo','Sigali',1,1,'Defensor','1987-05-29',1.83,78.00,'Derecha'),(12,'Gabriel','Hauche',1,1,'Delantero','1986-11-27',1.71,70.00,'Derecha'),(13,'Javier','Correa',1,1,'Delantero','1992-10-23',1.84,79.00,'Derecha'),(14,'Alexis','Mac Allister',1,1,'Mediocampista','1998-12-24',1.74,72.00,'Derecha'),(15,'Lautaro','Martínez',1,1,'Delantero','1997-08-22',1.74,72.00,'Derecha'),(16,'Cristian','Ferreira',2,1,'Mediocampista','1999-09-12',1.74,71.00,'Derecha'),(17,'Damián','Batallini',2,1,'Mediocampista','1996-06-24',1.70,70.00,'Derecha'),(18,'Tomás','Belmonte',2,1,'Mediocampista','1998-05-27',1.78,70.00,'Derecha'),(19,'Iván','Marcone',2,1,'Mediocampista','1990-06-03',1.85,80.00,'Derecha'),(20,'Gabriel','Jesus',2,2,'Delantero','1997-04-03',1.75,73.00,'Derecha'),(21,'Everton','Cebolinha',2,2,'Delantero','1996-03-22',1.74,72.00,'Derecha'),(22,'Felipe','Melo',2,2,'Mediocampista','1983-06-26',1.83,75.00,'Derecha'),(23,'Gustavo','Scarpa',2,2,'Mediocampista','1994-01-05',1.76,72.00,'Izquierda'),(24,'Gabriel','Menino',2,2,'Mediocampista','2000-09-29',1.76,70.00,'Derecha'),(25,'Lucas','Martinez',2,2,'Defensor','1990-01-10',1.82,78.00,'Izquierda'),(26,'Ezequiel','Gonzalez',2,3,'Mediocampista','1992-03-15',1.75,70.00,'Derecha'),(27,'Javier','Perez',2,4,'Delantero','1995-07-20',1.80,75.00,'Derecha'),(28,'Matias','Fernandez',2,1,'Portero','1988-02-25',1.85,80.00,'Izquierda'),(29,'Gabriel','Veron',3,2,'Delantero','2002-09-03',1.76,68.00,'Derecha'),(30,'Pedro','Henrique',3,2,'Defensor','1995-02-13',1.87,79.00,'Derecha'),(31,'Thiago','Galhardo',3,2,'Delantero','1989-07-20',1.83,72.00,'Derecha'),(32,'Victor','Cuesta',3,1,'Defensor','1988-11-19',1.87,80.00,'Izquierda'),(33,'Edenílson','Vergara',3,2,'Mediocampista','1989-12-18',1.75,74.00,'Derecha'),(34,'Marcelo','Lomba',3,2,'Portero','1987-12-18',1.89,83.00,'Derecha'),(35,'Jan','Oblak',3,2,'Portero','1993-01-07',1.88,87.00,'Derecha'),(36,'Koke','Suarez',3,3,'Mediocampista','1992-01-08',1.76,74.00,'Derecha'),(37,'Luis','Suárez',3,4,'Delantero','1987-01-24',1.82,86.00,'Derecha'),(38,'João','Félix',3,4,'Delantero','1999-11-10',1.80,70.00,'Derecha'),(39,'Saúl','Ñíguez',3,3,'Mediocampista','1994-11-21',1.84,77.00,'Izquierda'),(40,'Yannick','Carrasco',4,3,'Delantero','1993-09-04',1.85,73.00,'Izquierda'),(41,'José','Giménez',4,3,'Defensor','1995-01-20',1.85,80.00,'Derecha'),(42,'Stefan','Savić',4,3,'Defensor','1991-01-08',1.87,81.00,'Derecha'),(43,'Mario','Hermoso',4,3,'Defensor','1995-06-18',1.84,77.00,'Izquierda'),(44,'Thomas','Lemar',4,3,'Mediocampista','1995-11-12',1.70,65.00,'Izquierda'),(45,'Gerard','Moreno',4,3,'Delantero','1992-04-07',1.80,77.00,'Izquierda'),(46,'Pau','Torres',4,3,'Defensor','1997-01-16',1.91,80.00,'Izquierda'),(47,'Sergio','Asenjo',4,3,'Portero','1989-06-28',1.88,83.00,'Derecha'),(48,'Raúl','Albiol',4,3,'Defensor','1985-09-04',1.90,82.00,'Derecha'),(49,'Moi','Gómez',4,3,'Mediocampista','1994-06-23',1.77,70.00,'Izquierda'),(50,'Samuel','Chukwueze',4,3,'Delantero','1999-05-22',1.72,70.00,'Izquierda'),(51,'Dani','Parejo',4,3,'Mediocampista','1989-04-16',1.82,76.00,'Derecha'),(52,'Vicente','Iborra',4,3,'Mediocampista','1988-01-16',1.90,80.00,'Derecha'),(53,'Alfonso','Pedraza',4,3,'Defensor','1996-04-09',1.84,75.00,'Izquierda'),(54,'Manu','Trigueros',4,3,'Mediocampista','1991-10-17',1.78,72.00,'Derecha'),(55,'Romelu','Lukaku',5,4,'Delantero','1993-05-13',1.90,93.00,'Izquierda'),(56,'Lautaro','Martínez',5,4,'Delantero','1997-08-22',1.74,72.00,'Derecha'),(57,'Samir','Handanovic',5,4,'Portero','1984-07-14',1.93,90.00,'Derecha'),(58,'Stefan','de Vrij',5,4,'Defensor','1992-02-05',1.89,81.00,'Derecha'),(59,'Milan','Skriniar',5,4,'Defensor','1995-02-11',1.87,80.00,'Derecha'),(60,'Achraf','Hakimi',5,4,'Defensor','1998-11-04',1.81,73.00,'Derecha'),(61,'Marcelo','Brozovic',5,4,'Mediocampista','1992-11-16',1.81,68.00,'Derecha'),(62,'Nicolo','Barella',5,4,'Mediocampista','1997-02-07',1.72,68.00,'Derecha'),(63,'Ivan','Perisić',5,4,'Delantero','1989-02-02',1.86,81.00,'Izquierda'),(64,'Christian','Eriksen',5,4,'Mediocampista','1992-02-14',1.82,76.00,'Izquierda'),(65,'Ciro','Immobile',5,4,'Delantero','1990-02-20',1.85,78.00,'Derecha'),(66,'Sergej','Milinkovic',5,4,'Mediocampista','1995-02-27',1.92,76.00,'Derecha'),(67,'Luis','Alberto',5,4,'Mediocampista','1992-09-28',1.82,75.00,'Derecha'),(68,'Pepe','Reina',5,4,'Portero','1982-08-31',1.88,92.00,'Derecha'),(69,'Francesco','Acerbi',5,4,'Defensor','1988-02-10',1.92,87.00,'Izquierda'),(70,'Manuel','Lazzari',6,2,'Defensor','1993-11-29',1.74,70.00,'Derecha'),(71,'Lucas','Leiva',6,2,'Mediocampista','1987-01-09',1.79,79.00,'Derecha'),(72,'Joaquín','Correa',6,2,'Delantero','1994-08-13',1.88,77.00,'Derecha'),(73,'Adam','Marušić',6,2,'Defensor','1992-10-17',1.85,79.00,'Derecha'),(74,'Thomas','Strakosha',6,2,'Portero','1995-03-19',1.93,83.00,'Derecha'),(75,'Marcus','Rashford',6,2,'Delantero','1997-10-31',1.85,75.00,'Derecha'),(76,'David','de Gea',6,2,'Portero','1990-11-07',1.92,82.00,'Derecha'),(77,'Bruno','Fernandes',6,2,'Mediocampista','1994-09-08',1.79,69.00,'Derecha'),(78,'Paul','Pogba',6,2,'Mediocampista','1993-03-15',1.91,84.00,'Derecha'),(79,'Harry','Maguire',6,2,'Defensor','1993-03-05',1.94,100.00,'Derecha'),(80,'Luke','Shaw',6,2,'Defensor','1995-07-12',1.85,75.00,'Izquierda'),(81,'Aaron','Wan-Bissaka',6,2,'Defensor','1997-11-26',1.83,72.00,'Derecha'),(82,'Edinson','Cavani',6,2,'Delantero','1987-02-14',1.84,77.00,'Derecha'),(83,'Mason','Greenwood',6,2,'Delantero','2001-10-01',1.81,70.00,'Izquierda'),(84,'Fred','Gomez',6,2,'Mediocampista','1993-03-05',1.69,62.00,'Izquierda'),(85,'Sadio','Mané',7,3,'Delantero','1992-04-10',1.75,69.00,'Derecha'),(86,'Mohamed','Salah',7,3,'Delantero','1992-06-15',1.75,71.00,'Izquierda'),(87,'Alisson','Becker',7,3,'Portero','1992-10-02',1.91,91.00,'Derecha'),(88,'Virgil','van Dijk',7,3,'Defensor','1991-07-08',1.93,92.00,'Derecha'),(89,'Trent','Alexander-Arnold',7,3,'Defensor','1998-10-07',1.75,69.00,'Derecha'),(90,'Andrew','Robertson',7,3,'Defensor','1994-03-11',1.78,64.00,'Izquierda'),(91,'Fabinho','Tavares',7,3,'Mediocampista','1993-10-23',1.88,78.00,'Derecha'),(92,'Jordan','Henderson',7,3,'Mediocampista','1990-06-17',1.82,80.00,'Derecha'),(93,'Roberto','Firmino',7,3,'Delantero','1991-10-02',1.81,76.00,'Derecha'),(94,'Thiago','Alcántara',7,3,'Mediocampista','1991-04-11',1.74,70.00,'Derecha'),(95,'Ansu','Fati',7,3,'Delantero','2002-10-31',1.78,66.00,'Derecha'),(96,'Sergio','Busquets',7,3,'Mediocampista','1988-07-16',1.89,76.00,'Derecha'),(97,'Gerard','Piqué',7,3,'Defensor','1987-02-02',1.94,85.00,'Derecha'),(98,'Jordi','Alba',7,3,'Defensor','1989-03-21',1.70,68.00,'Izquierda'),(99,'Frenkie','de Jong',7,3,'Mediocampista','1997-05-12',1.80,74.00,'Derecha'),(100,'Antoine','Griezmann',8,4,'Delantero','1991-03-21',1.76,72.00,'Izquierda'),(101,'Marc-André','ter Stegen',8,4,'Portero','1992-04-30',1.87,85.00,'Derecha'),(102,'Lionel','Messi',11,1,'Delantero','1987-06-24',1.70,72.00,'Izquierda'),(103,'Pedri','González',8,4,'Mediocampista','2002-11-25',1.74,60.00,'Derecha'),(104,'Sergi','Roberto',8,4,'Mediocampista','1992-02-07',1.78,68.00,'Derecha'),(105,'Zlatan','Ibrahimović',8,4,'Delantero','1981-10-03',1.95,95.00,'Derecha'),(106,'Franck','Kessié',8,4,'Mediocampista','1996-12-19',1.83,76.00,'Derecha'),(107,'Theo','Hernández',8,4,'Defensor','1997-10-06',1.84,78.00,'Izquierda'),(108,'Simon','Kjær',8,4,'Defensor','1989-03-26',1.90,83.00,'Derecha'),(109,'Gianluigi','Donnarumma',8,4,'Portero','1999-02-25',1.96,90.00,'Derecha'),(110,'Hakan','Çalhanoğlu',8,4,'Mediocampista','1994-02-08',1.78,76.00,'Derecha'),(111,'Rafael','Leão',8,4,'Delantero','1999-06-10',1.88,81.00,'Derecha'),(112,'Alessio','Romagnoli',8,4,'Defensor','1995-01-12',1.88,77.00,'Izquierda'),(113,'Ismael','Bennacer',8,4,'Mediocampista','1997-12-01',1.75,70.00,'Izquierda'),(114,'Davide','Calabria',8,4,'Defensor','1996-12-06',1.77,70.00,'Derecha'),(115,'Manuel','Neuer',9,3,'Portero','1986-03-27',1.93,92.00,'Derecha'),(116,'Thomas','Müller',9,3,'Delantero','1989-09-13',1.85,75.00,'Derecha'),(117,'Joshua','Kimmich',9,3,'Mediocampista','1995-02-08',1.77,75.00,'Derecha'),(118,'Serge','Gnabry',9,3,'Delantero','1995-07-14',1.75,75.00,'Derecha'),(119,'Leroy','Sané',9,2,'Delantero','1996-01-11',1.83,75.00,'Izquierda'),(120,'Leon','Goretzka',9,4,'Mediocampista','1995-02-06',1.89,82.00,'Derecha'),(121,'David','Alaba',9,2,'Defensor','1992-06-24',1.80,78.00,'Izquierda'),(122,'Alphonso','Davies',9,4,'Defensor','2000-11-02',1.81,75.00,'Izquierda'),(123,'Robert','Lewandowski',9,3,'Delantero','1988-08-21',1.85,79.00,'Derecha'),(124,'Lucas','Hernández',9,3,'Defensor','1996-02-14',1.84,79.00,'Izquierda'),(125,'Kylian','Mbappé',9,2,'Delantero','1998-12-20',1.78,73.00,'Derecha'),(126,'Neymar','Jr',9,2,'Delantero','1992-02-05',1.75,68.00,'Derecha'),(127,'Marquinhos','Figeredo',9,2,'Defensor','1994-05-14',1.83,75.00,'Derecha'),(128,'Marco','Verratti',9,4,'Mediocampista','1992-11-05',1.65,60.00,'Derecha'),(129,'Ángel','Di María',9,1,'Delantero','1988-02-14',1.80,70.00,'Izquierda'),(130,'Keylor','Navas',10,3,'Portero','1986-12-15',1.85,80.00,'Derecha'),(131,'Presnel','Kimpembe',10,2,'Defensor','1995-08-13',1.83,77.00,'Izquierda'),(132,'Julian','Draxler',10,4,'Mediocampista','1993-09-20',1.87,72.00,'Izquierda'),(133,'Idrissa','Gueye',10,4,'Mediocampista','1989-09-26',1.74,66.00,'Derecha'),(134,'Mauro','Icardi',10,1,'Delantero','1993-02-19',1.81,75.00,'Derecha'),(135,'Guillermo','Ochoa',10,1,'Portero','1985-07-13',1.85,78.00,'Derecha'),(136,'Jesús','Corona',10,3,'Portero','1981-01-26',1.75,75.00,'Derecha'),(137,'Rodolfo','Cota',10,3,'Portero','1987-07-03',1.83,79.00,'Derecha'),(138,'Hugo','González',10,3,'Portero','1990-05-09',1.85,78.00,'Derecha'),(139,'Néstor','Araujo',10,1,'Defensor','1991-08-29',1.85,77.00,'Derecha'),(140,'Héctor','Moreno',10,2,'Defensor','1988-01-17',1.84,80.00,'Izquierda'),(141,'Carlos','Salcedo',10,3,'Defensor','1993-09-29',1.87,82.00,'Derecha'),(142,'Jesús','Gallardo',10,2,'Defensor','1994-08-15',1.69,63.00,'Izquierda'),(143,'Edson','Álvarez',10,3,'Defensor','1997-10-24',1.88,78.00,'Derecha'),(144,'Andrés','Guardado',10,3,'Mediocampista','1986-09-28',1.71,68.00,'Izquierda'),(145,'Héctor','Herrera',11,2,'Mediocampista','1990-04-19',1.85,82.00,'Derecha'),(146,'Jonathan','dos Santos',11,2,'Mediocampista','1990-04-26',1.78,73.00,'Derecha'),(147,'Carlos','Vela',11,3,'Delantero','1989-03-01',1.78,73.00,'Izquierda'),(148,'Raúl','Jiménez',11,4,'Delantero','1991-05-05',1.90,80.00,'Derecha'),(149,'Javier','Hernández',11,4,'Delantero','1988-06-01',1.75,71.00,'Derecha'),(150,'Uriel','Antuna',11,2,'Delantero','1997-08-21',1.78,73.00,'Derecha'),(151,'Roberto','Alvarado',11,2,'Mediocampista','1998-09-07',1.75,70.00,'Derecha'),(152,'Orbelín','Pineda',11,3,'Mediocampista','1996-03-24',1.75,71.00,'Derecha'),(153,'Diego','Lainez',11,4,'Delantero','2000-06-09',1.67,61.00,'Izquierda'),(154,'José Juan','Macías',11,3,'Delantero','1999-09-22',1.78,75.00,'Derecha'),(155,'Henry','Martín',11,2,'Delantero','1992-11-18',1.80,75.00,'Derecha'),(156,'Jesús','Molina',11,2,'Mediocampista','1988-03-29',1.78,75.00,'Derecha'),(157,'Jonathan','Orozco',11,3,'Portero','1986-05-12',1.85,80.00,'Derecha'),(158,'Néstor','Calderón',11,2,'Defensor','1989-02-14',1.82,78.00,'Derecha'),(159,'Víctor','Guerrero',11,1,'Defensor','1994-11-09',1.85,80.00,'Derecha'),(160,'Emmanuel','Gigliotti',12,1,'Delantero','1987-05-20',1.84,80.00,'Derecha'),(161,'Rogelio','Funes Mori',12,1,'Delantero','1991-03-05',1.85,80.00,'Derecha'),(162,'Alan','Pulido',12,2,'Delantero','1991-03-08',1.76,74.00,'Derecha'),(163,'Ángel','Zaldívar',12,1,'Delantero','1994-12-08',1.80,77.00,'Derecha'),(164,'Luis','Montes',12,3,'Mediocampista','1986-05-15',1.78,74.00,'Izquierda'),(165,'Giovani','dos Santos',12,4,'Delantero','1989-05-11',1.75,72.00,'Derecha'),(166,'Marco','Fabian',12,3,'Mediocampista','1989-07-21',1.75,70.00,'Derecha'),(167,'Carlos','Rodríguez',12,4,'Mediocampista','1997-01-17',1.75,68.00,'Derecha'),(168,'Jesús','Angulo',12,1,'Mediocampista','1997-08-12',1.79,72.00,'Derecha'),(169,'Luis','Romero',12,3,'Portero','1995-09-26',1.85,79.00,'Derecha'),(170,'Erick','Aguiar',12,2,'Defensor','1998-03-19',1.82,75.00,'Derecha'),(171,'José de Jesús','Godínez',12,2,'Delantero','1997-04-24',1.78,74.00,'Derecha'),(172,'Jesús','Molina',12,3,'Mediocampista','1988-03-29',1.78,75.00,'Derecha'),(173,'Miguel','Ponce',12,4,'Defensor','1989-04-12',1.75,70.00,'Izquierda'),(174,'César','Montes',12,3,'Defensor','1997-02-24',1.86,78.00,'Derecha'),(175,'Jesús','Gallardo',13,1,'Defensor','1991-08-15',1.75,63.00,'Izquierda'),(176,'Luis','Fuentes',13,1,'Defensor','1986-12-27',1.76,72.00,'Izquierda'),(177,'Gonzalo','Montiel',13,1,'Defensor','1997-01-01',1.79,74.00,'Derecha'),(178,'Lucas','Martínez Quarta',13,1,'Defensor','1996-05-10',1.82,76.00,'Derecha'),(179,'Nicolás','De La Cruz',13,1,'Mediocampista','1998-05-01',1.72,68.00,'Derecha'),(180,'Julián','Álvarez',13,1,'Delantero','2000-01-31',1.80,75.00,'Derecha'),(181,'Franco','Armani',13,1,'Portero','1986-10-16',1.89,85.00,'Derecha'),(182,'Enzo','Pérez',13,1,'Mediocampista','1986-02-22',1.78,77.00,'Derecha'),(183,'Exequiel','Palacios',13,1,'Mediocampista','1998-10-05',1.75,72.00,'Derecha'),(184,'Matías','Suárez',13,1,'Delantero','1988-05-09',1.72,68.00,'Derecha'),(185,'Lucas','Ocampos',13,1,'Delantero','1994-07-11',1.87,82.00,'Izquierda'),(186,'Giovani','Lo Celso',13,1,'Mediocampista','1996-04-09',1.77,75.00,'Izquierda'),(187,'Emiliano','Martínez',13,1,'Portero','1992-09-02',1.94,90.00,'Derecha'),(188,'Emiliano','Buendía',13,1,'Mediocampista','1996-12-25',1.73,70.00,'Derecha'),(189,'Marcos','Acuña',13,1,'Defensor','1991-10-28',1.76,75.00,'Izquierda'),(190,'Nicolás','Tagliafico',14,1,'Defensor','1992-08-31',1.72,70.00,'Izquierda'),(191,'Lautaro','Martínez',14,1,'Delantero','1997-08-22',1.74,80.00,'Derecha'),(192,'Juan Fernando','Quintero',14,1,'Mediocampista','1993-01-18',1.70,68.00,'Izquierda'),(193,'Matías','Zaracho',14,1,'Mediocampista','1998-03-10',1.72,70.00,'Derecha'),(194,'Agustín','Almendra',14,1,'Mediocampista','2000-02-11',1.82,74.00,'Derecha'),(195,'Carlos','Tevez',14,1,'Delantero','1984-02-05',1.73,75.00,'Derecha'),(196,'Walter','Montoya',14,1,'Mediocampista','1993-02-21',1.75,72.00,'Derecha'),(197,'Fernando','Gago',14,1,'Mediocampista','1986-04-10',1.76,74.00,'Derecha'),(198,'Diego','Silva',14,4,'Defensor','1994-06-22',1.76,72.00,'Izquierda'),(199,'Pablo','Morales',14,4,'Mediocampista','1990-08-14',1.77,73.00,'Derecha'),(200,'Juan','Ortiz',14,4,'Delantero','1993-05-09',1.79,75.00,'Izquierda'),(201,'Esteban','Sosa',14,4,'Portero','1989-02-17',1.88,83.00,'Derecha'),(202,'Martin','Gutierrez',14,4,'Defensor','1996-07-29',1.81,76.00,'Izquierda'),(203,'Alvaro','Alvarez',14,4,'Mediocampista','1992-01-03',1.74,71.00,'Derecha'),(204,'Andres','Herrera',14,4,'Delantero','1986-11-21',1.84,78.00,'Derecha'),(205,'Nicolas','Mendez',14,4,'Portero','1990-09-05',1.87,81.00,'Izquierda'),(206,'Hernan','Castro',14,4,'Defensor','1995-03-12',1.77,74.00,'Derecha'),(207,'Sebastian','Ruiz',14,4,'Mediocampista','1994-06-26',1.72,68.00,'Izquierda'),(208,'Mariano','Gomez',14,4,'Delantero','1991-12-15',1.82,77.00,'Derecha'),(209,'Marcelo','Guzman',15,1,'Mediocampista','1988-02-24',1.76,73.00,'Derecha'),(210,'Jorge','Cabrera',15,1,'Delantero','1992-06-13',1.84,79.00,'Derecha'),(211,'Adrian','Nunez',15,1,'Portero','1989-11-08',1.88,84.00,'Izquierda'),(212,'Lucas','Lopez',15,1,'Defensor','1994-05-11',1.80,75.00,'Derecha'),(213,'Gustavo','Martinez',15,1,'Mediocampista','1990-01-25',1.75,72.00,'Izquierda'),(214,'Oscar','Molina',15,1,'Delantero','1986-09-14',1.82,78.00,'Derecha'),(215,'Hugo','Diaz',15,1,'Portero','1993-04-06',1.87,83.00,'Derecha'),(216,'Federico','Gutierrez',15,1,'Defensor','1995-10-28',1.79,76.00,'Izquierda'),(217,'Ivan','Reyes',15,1,'Mediocampista','1988-06-30',1.74,71.00,'Derecha'),(218,'Alexis','Aguero',15,1,'Delantero','1991-02-15',1.83,77.00,'Derecha'),(219,'Mauricio','Serrano',15,1,'Portero','1989-08-23',1.89,85.00,'Izquierda'),(220,'Matias','Garcia',15,1,'Defensor','1993-11-05',1.81,76.00,'Derecha'),(221,'Emanuel','Peralta',15,1,'Mediocampista','1994-09-19',1.75,72.00,'Izquierda'),(222,'Fernando','Vazquez',15,1,'Delantero','1987-03-11',1.84,78.00,'Derecha'),(223,'Martin','Castillo',15,1,'Portero','1990-12-22',1.86,84.00,'Derecha'),(224,'Gabriel','Lopez',16,1,'Delantero','1992-07-13',1.80,75.00,'Derecha'),(225,'Carlos','Mendoza',16,2,'Defensor','1989-05-21',1.78,74.00,'Izquierda'),(226,'Miguel','Santos',16,3,'Mediocampista','1994-08-11',1.76,70.00,'Derecha'),(227,'Ricardo','Ramirez',16,4,'Portero','1991-02-19',1.88,83.00,'Derecha'),(228,'Jose','Herrera',16,1,'Defensor','1988-03-30',1.82,78.00,'Izquierda'),(229,'Luis','Rojas',16,2,'Delantero','1993-06-25',1.81,76.00,'Derecha'),(230,'David','Torres',16,3,'Mediocampista','1990-10-10',1.74,72.00,'Derecha'),(231,'Juan','Perez',16,4,'Defensor','1995-09-15',1.83,79.00,'Derecha'),(232,'Andres','Sanchez',16,1,'Delantero','1992-12-05',1.84,77.00,'Izquierda'),(233,'Manuel','Fernandez',16,2,'Portero','1990-04-22',1.87,82.00,'Derecha'),(234,'Felipe','Gonzalez',16,3,'Mediocampista','1987-11-18',1.79,74.00,'Izquierda'),(235,'Javier','Martinez',16,4,'Defensor','1994-01-28',1.80,76.00,'Derecha'),(236,'Hector','Ortiz',16,1,'Delantero','1993-07-07',1.82,75.00,'Izquierda'),(237,'Diego','Gomez',16,2,'Mediocampista','1989-05-02',1.75,71.00,'Derecha'),(238,'Alberto','Cruz',16,3,'Portero','1992-03-14',1.89,84.00,'Derecha'),(239,'Claudo','Echeverri',11,1,'Delantero','2006-01-02',1.71,62.00,'Izquierda'),(241,'Agustín','Ruberto',1,1,'Delantero','2006-01-14',1.80,74.00,'Derecha'),(242,'Lucas','Bermudez',2,2,'Defensor','1989-08-05',1.87,83.00,'Derecha'),(243,'Juan','Rodriguez',5,3,'Portero','1988-02-07',1.95,83.00,'Derecha');
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_trigger` BEFORE INSERT ON `jugadores` FOR EACH ROW BEGIN
    SET NEW.nombre = CONCAT(UPPER(SUBSTRING(NEW.nombre, 1, 1)), LOWER(SUBSTRING(NEW.nombre, 2)));
    SET NEW.apellido = CONCAT(UPPER(SUBSTRING(NEW.apellido, 1, 1)), LOWER(SUBSTRING(NEW.apellido, 2)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_trigger` AFTER INSERT ON `jugadores` FOR EACH ROW BEGIN
    DECLARE usuario_actual VARCHAR(255);
    SET usuario_actual = CURRENT_USER();
    
    INSERT INTO log_nuevos_registros (id_jugador, nombre, apellido, equipo_id, usuario)
    VALUES (NEW.jugador_id, NEW.nombre, NEW.apellido, NEW.equipo_id, usuario_actual);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log_nuevos_registros`
--

DROP TABLE IF EXISTS `log_nuevos_registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_nuevos_registros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_jugador` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `equipo_id` int DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_nuevos_registros`
--

LOCK TABLES `log_nuevos_registros` WRITE;
/*!40000 ALTER TABLE `log_nuevos_registros` DISABLE KEYS */;
INSERT INTO `log_nuevos_registros` VALUES (1,'2024-07-25 15:18:33',241,'Agustín','Ruberto',1,'root@localhost'),(2,'2024-07-25 15:46:44',242,'Lucas','Bermudez',2,'root@localhost'),(3,'2024-07-25 15:46:44',243,'Juan','Rodriguez',5,'root@localhost');
/*!40000 ALTER TABLE `log_nuevos_registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `pais_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Argentina'),(2,'Brasil'),(3,'España'),(4,'Italia');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido` (
  `partido_id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `equipo_local_id` int NOT NULL,
  `equipo_visitante_id` int NOT NULL,
  `resultado` varchar(50) NOT NULL,
  `competencia_id` int NOT NULL,
  PRIMARY KEY (`partido_id`),
  KEY `fk_equipo_local_id` (`equipo_local_id`),
  KEY `fk_equipo_visitante_id` (`equipo_visitante_id`),
  KEY `fk_partido_competencia_id` (`competencia_id`),
  CONSTRAINT `fk_equipo_local_id` FOREIGN KEY (`equipo_local_id`) REFERENCES `equipo` (`equipo_id`),
  CONSTRAINT `fk_equipo_visitante_id` FOREIGN KEY (`equipo_visitante_id`) REFERENCES `equipo` (`equipo_id`),
  CONSTRAINT `fk_partido_competencia_id` FOREIGN KEY (`competencia_id`) REFERENCES `competencia` (`competencia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES (1,'2023-01-15',1,2,'2-1',1),(2,'2023-02-10',3,4,'1-1',1),(3,'2023-03-05',2,1,'0-0',1),(4,'2023-04-01',4,3,'2-2',1),(5,'2023-05-12',1,3,'1-0',1),(6,'2023-01-20',5,6,'3-2',2),(7,'2023-02-15',7,8,'2-0',2),(8,'2023-03-10',6,5,'1-1',2),(9,'2023-04-05',8,7,'0-3',2),(10,'2023-05-22',5,7,'1-1',2),(11,'2023-01-25',9,10,'2-2',3),(12,'2023-02-20',11,12,'3-1',3),(13,'2023-03-15',10,9,'0-1',3),(14,'2023-04-10',12,11,'1-2',3),(15,'2023-05-30',9,11,'2-0',3),(16,'2023-01-30',13,14,'1-1',4),(17,'2023-02-25',15,16,'2-2',4),(18,'2023-03-20',14,13,'0-0',4),(19,'2023-04-15',16,15,'3-3',4),(20,'2023-05-25',13,15,'2-1',4),(21,'2023-06-01',1,2,'5-0',1);
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posiciones`
--

DROP TABLE IF EXISTS `posiciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posiciones` (
  `posicion_id` int NOT NULL AUTO_INCREMENT,
  `posicion` int NOT NULL,
  `puntos` int NOT NULL,
  `equipo_competencia_id` int NOT NULL,
  PRIMARY KEY (`posicion_id`),
  KEY `fk_posic_equipo_competencia_id` (`equipo_competencia_id`),
  CONSTRAINT `fk_posic_equipo_competencia_id` FOREIGN KEY (`equipo_competencia_id`) REFERENCES `equipo_competencia` (`equipo_competencia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posiciones`
--

LOCK TABLES `posiciones` WRITE;
/*!40000 ALTER TABLE `posiciones` DISABLE KEYS */;
INSERT INTO `posiciones` VALUES (1,1,28,1),(2,3,23,2),(3,2,24,3),(4,4,20,4),(5,2,28,5),(6,1,32,6),(7,3,27,7),(8,4,25,8),(9,4,18,9),(10,3,20,10),(11,2,22,11),(12,1,27,12),(13,2,26,13),(14,1,34,14),(15,4,20,15),(16,3,24,16);
/*!40000 ALTER TABLE `posiciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_cantidad_jugadores_equipo`
--

DROP TABLE IF EXISTS `view_cantidad_jugadores_equipo`;
/*!50001 DROP VIEW IF EXISTS `view_cantidad_jugadores_equipo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_cantidad_jugadores_equipo` AS SELECT 
 1 AS `equipo`,
 1 AS `pais`,
 1 AS `cantidad_jugadores`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_goleadores_liga_argentina`
--

DROP TABLE IF EXISTS `view_goleadores_liga_argentina`;
/*!50001 DROP VIEW IF EXISTS `view_goleadores_liga_argentina`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_goleadores_liga_argentina` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `equipo`,
 1 AS `total_goles`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_jugadores_lazio`
--

DROP TABLE IF EXISTS `view_jugadores_lazio`;
/*!50001 DROP VIEW IF EXISTS `view_jugadores_lazio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_jugadores_lazio` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `posicion`,
 1 AS `nacionalidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_promedio_edad_altura_peso_posicion`
--

DROP TABLE IF EXISTS `view_promedio_edad_altura_peso_posicion`;
/*!50001 DROP VIEW IF EXISTS `view_promedio_edad_altura_peso_posicion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_promedio_edad_altura_peso_posicion` AS SELECT 
 1 AS `equipo`,
 1 AS `posicion`,
 1 AS `promedio_edad`,
 1 AS `promedio_altura`,
 1 AS `promedio_peso`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_punteros_distintas_ligas`
--

DROP TABLE IF EXISTS `view_punteros_distintas_ligas`;
/*!50001 DROP VIEW IF EXISTS `view_punteros_distintas_ligas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_punteros_distintas_ligas` AS SELECT 
 1 AS `liga`,
 1 AS `equipo`,
 1 AS `puntos`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'futboldb'
--

--
-- Dumping routines for database 'futboldb'
--
/*!50003 DROP FUNCTION IF EXISTS `cantidad_jugadores_por_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cantidad_jugadores_por_pais`(
    p_nombre_pais VARCHAR(255)
) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE cantidad_jugadores INT;
    DECLARE mensaje VARCHAR(255);

    -- Verificamos si el país existe
    SELECT COUNT(*) INTO cantidad_jugadores
    FROM jugadores j
    JOIN pais p ON j.pais_id = p.pais_id
    WHERE p.nombre = p_nombre_pais;

    -- Preparamos el mensaje de salida
    IF cantidad_jugadores > 0 THEN
        SET mensaje = CONCAT('Cantidad de jugadores del país ', p_nombre_pais, ': ', cantidad_jugadores);
    ELSE
        SET mensaje = CONCAT('No hay datos de jugadores del país ', p_nombre_pais);
    END IF;

    RETURN mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `edad_jugador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `edad_jugador`(
    p_nombre VARCHAR(255),
    p_apellido VARCHAR(255),
    p_nombre_equipo VARCHAR(255)
) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE edad INT;
    DECLARE fecha_actual DATE;
    DECLARE contador INT;

    -- Usamos la fecha más reciente en la base de datos
    SET fecha_actual = '2023-06-01';

    -- Verificamos si hay coincidencias para el jugador y el equipo
    SELECT COUNT(*)
    INTO contador
    FROM jugadores j
    JOIN equipo e ON j.equipo_id = e.equipo_id
    WHERE j.nombre = p_nombre
      AND j.apellido = p_apellido
      AND e.nombre = p_nombre_equipo;

    -- Si no hay coincidencias, levanta un error
    IF contador = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró el jugador o el equipo especificado.';
    END IF;

    -- Calculamos la edad del jugador
    SELECT TIMESTAMPDIFF(YEAR, j.fecha_nac, fecha_actual) INTO edad
    FROM jugadores j
    JOIN equipo e ON j.equipo_id = e.equipo_id
    WHERE j.nombre = p_nombre
      AND j.apellido = p_apellido
      AND e.nombre = p_nombre_equipo;

    -- Devolvemos la edad del jugador
    RETURN edad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `minutos_disputados_jugador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `minutos_disputados_jugador`(
    p_jugador_id INT,
    p_fecha_inicio DATE,
    p_fecha_fin DATE
) RETURNS decimal(10,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE total_minutos DECIMAL(10,2);

    SELECT SUM(ej.minutos_jugados) INTO total_minutos
    FROM estadisticas_jugador ej
    JOIN partido p ON ej.partido_id = p.partido_id
    WHERE ej.jugador_id = p_jugador_id
      AND p.fecha BETWEEN p_fecha_inicio AND p_fecha_fin;

    RETURN COALESCE(total_minutos, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_equipo_jugador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_equipo_jugador`(
    IN p_jugador_id INT,
    IN p_nuevo_equipo_id INT
)
BEGIN
    DECLARE jugador_existe INT;
    DECLARE equipo_existe INT;

    -- Verificamos si el jugador existe
    SELECT COUNT(*) INTO jugador_existe FROM jugadores WHERE jugador_id = p_jugador_id;
    IF jugador_existe = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El jugador no existe.';
    END IF;

    -- Verificamos si el nuevo equipo existe
    SELECT COUNT(*) INTO equipo_existe FROM equipo WHERE equipo_id = p_nuevo_equipo_id;
    IF equipo_existe = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nuevo equipo no existe.';
    END IF;

    -- Actualizamos el equipo del jugador
    UPDATE jugadores
    SET equipo_id = p_nuevo_equipo_id
    WHERE jugador_id = p_jugador_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingreso_nuevo_jugador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_nuevo_jugador`(
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_equipo_id INT,
    IN p_pais_id INT,
    IN p_posicion VARCHAR(50),
    IN p_fecha_nac DATE,
    IN p_altura DECIMAL(4,2),
    IN p_peso DECIMAL(5,2),
    IN p_pierna_habil VARCHAR(10)
)
BEGIN
    DECLARE equipo_existe INT;
    DECLARE pais_existe INT;
    DECLARE jugador_existe INT;

    -- Verificamos si el equipo existe
    SELECT COUNT(*) INTO equipo_existe FROM equipo WHERE equipo_id = p_equipo_id;
    IF equipo_existe = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El equipo no existe.';
    END IF;

    -- Verificamos si el país existe
    SELECT COUNT(*) INTO pais_existe FROM pais WHERE pais_id = p_pais_id;
    IF pais_existe = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El país no existe.';
    END IF;

    -- Verificamos si el jugador ya existe
    SELECT COUNT(*) INTO jugador_existe
    FROM jugadores
    WHERE nombre = p_nombre
      AND apellido = p_apellido
      AND fecha_nac = p_fecha_nac
      AND equipo_id = p_equipo_id;

    IF jugador_existe > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El jugador ya existe en la base de datos.';
    END IF;

    -- Insertamos el nuevo jugador si todas las validaciones pasan
    INSERT INTO jugadores (
        nombre,
        apellido,
        equipo_id,
        pais_id,
        posicion,
        fecha_nac,
        altura,
        peso,
        pierna_habil
    ) VALUES (
        p_nombre,
        p_apellido,
        p_equipo_id,
        p_pais_id,
        p_posicion,
        p_fecha_nac,
        p_altura,
        p_peso,
        p_pierna_habil
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_partido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_partido`(
    IN p_fecha DATE,
    IN p_equipo_local_id INT,
    IN p_equipo_visitante_id INT,
    IN p_resultado VARCHAR(50),
    IN p_competencia_id INT
)
BEGIN
    DECLARE equipo_local_competencia_id INT;
    DECLARE equipo_visitante_competencia_id INT;
    DECLARE goles_local INT;
    DECLARE goles_visitante INT;
    DECLARE puntos_local INT DEFAULT 0;
    DECLARE puntos_visitante INT DEFAULT 0;

    -- Insertamos el nuevo partido
    INSERT INTO partido (fecha, equipo_local_id, equipo_visitante_id, resultado, competencia_id)
    VALUES (p_fecha, p_equipo_local_id, p_equipo_visitante_id, p_resultado, p_competencia_id);

    -- Obtenemos el equipo_competencia_id para el equipo local
    SELECT equipo_competencia_id INTO equipo_local_competencia_id
    FROM equipo_competencia
    WHERE equipo_id = p_equipo_local_id AND competencia_id = p_competencia_id;

    -- Obtenemos el equipo_competencia_id para el equipo visitante
    SELECT equipo_competencia_id INTO equipo_visitante_competencia_id
    FROM equipo_competencia
    WHERE equipo_id = p_equipo_visitante_id AND competencia_id = p_competencia_id;

    -- Extraemos los goles del resultado
    SET goles_local = CAST(SUBSTRING_INDEX(p_resultado, '-', 1) AS UNSIGNED);
    SET goles_visitante = CAST(SUBSTRING_INDEX(p_resultado, '-', -1) AS UNSIGNED);

    -- Determinamos los puntos a sumar en función del resultado
    IF goles_local > goles_visitante THEN
        SET puntos_local = 3;
        SET puntos_visitante = 0;
    ELSEIF goles_local < goles_visitante THEN
        SET puntos_local = 0;
        SET puntos_visitante = 3;
    ELSE
        SET puntos_local = 1;
        SET puntos_visitante = 1;
    END IF;

    -- Actualizamos puntos en la tabla posiciones para el equipo local
    UPDATE posiciones
    SET puntos = puntos + puntos_local
    WHERE equipo_competencia_id = equipo_local_competencia_id;

    -- Actualizamos puntos en la tabla posiciones para el equipo visitante
    UPDATE posiciones
    SET puntos = puntos + puntos_visitante
    WHERE equipo_competencia_id = equipo_visitante_competencia_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_cantidad_jugadores_equipo`
--

/*!50001 DROP VIEW IF EXISTS `view_cantidad_jugadores_equipo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_cantidad_jugadores_equipo` AS select `e`.`nombre` AS `equipo`,`p`.`nombre` AS `pais`,count(`j`.`jugador_id`) AS `cantidad_jugadores` from (((`equipo` `e` left join `jugadores` `j` on((`e`.`equipo_id` = `j`.`equipo_id`))) left join `ciudad` `c` on((`e`.`ciudad_id` = `c`.`ciudad_id`))) left join `pais` `p` on((`c`.`pais_id` = `p`.`pais_id`))) group by `e`.`equipo_id`,`e`.`nombre`,`p`.`nombre` order by `cantidad_jugadores` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_goleadores_liga_argentina`
--

/*!50001 DROP VIEW IF EXISTS `view_goleadores_liga_argentina`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_goleadores_liga_argentina` AS select `j`.`nombre` AS `nombre`,`j`.`apellido` AS `apellido`,`e`.`nombre` AS `equipo`,sum(`es`.`goles`) AS `total_goles` from ((((`estadisticas_jugador` `es` join `jugadores` `j` on((`es`.`jugador_id` = `j`.`jugador_id`))) join `partido` `p` on((`es`.`partido_id` = `p`.`partido_id`))) join `competencia` `c` on((`p`.`competencia_id` = `c`.`competencia_id`))) join `equipo` `e` on((`j`.`equipo_id` = `e`.`equipo_id`))) where (`c`.`nombre` = 'Liga Profesional Argentina') group by `j`.`jugador_id`,`j`.`nombre`,`j`.`apellido`,`e`.`nombre` order by `total_goles` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_jugadores_lazio`
--

/*!50001 DROP VIEW IF EXISTS `view_jugadores_lazio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_jugadores_lazio` AS select `j`.`nombre` AS `nombre`,`j`.`apellido` AS `apellido`,`j`.`posicion` AS `posicion`,`p`.`nombre` AS `nacionalidad` from (`jugadores` `j` join `pais` `p` on((`j`.`pais_id` = `p`.`pais_id`))) where (`j`.`equipo_id` = 14) order by `j`.`posicion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_promedio_edad_altura_peso_posicion`
--

/*!50001 DROP VIEW IF EXISTS `view_promedio_edad_altura_peso_posicion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_promedio_edad_altura_peso_posicion` AS select `e`.`nombre` AS `equipo`,`j`.`posicion` AS `posicion`,round(avg(timestampdiff(YEAR,`j`.`fecha_nac`,'2023-06-01')),2) AS `promedio_edad`,round(avg(`j`.`altura`),2) AS `promedio_altura`,round(avg(`j`.`peso`),2) AS `promedio_peso` from (`equipo` `e` join `jugadores` `j` on((`e`.`equipo_id` = `j`.`equipo_id`))) group by `e`.`nombre`,`j`.`posicion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_punteros_distintas_ligas`
--

/*!50001 DROP VIEW IF EXISTS `view_punteros_distintas_ligas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_punteros_distintas_ligas` AS select `c`.`nombre` AS `liga`,`e`.`nombre` AS `equipo`,`p`.`puntos` AS `puntos` from (((`posiciones` `p` join `equipo_competencia` `ec` on((`p`.`equipo_competencia_id` = `ec`.`equipo_competencia_id`))) join `equipo` `e` on((`ec`.`equipo_id` = `e`.`equipo_id`))) join `competencia` `c` on((`ec`.`competencia_id` = `c`.`competencia_id`))) where (`p`.`posicion` = 1) order by `c`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-12 15:27:42
