-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: dbveterinaria
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblclientes`
--

DROP TABLE IF EXISTS `tblclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblclientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblclientes`
--

LOCK TABLES `tblclientes` WRITE;
/*!40000 ALTER TABLE `tblclientes` DISABLE KEYS */;
INSERT INTO `tblclientes` VALUES (1,'Francisco Martinez','franmar@gmail.com','3224568790','Mar Rojo 388 San Vicente','2023-04-19 00:52:46');
/*!40000 ALTER TABLE `tblclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmascotas`
--

DROP TABLE IF EXISTS `tblmascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmascotas` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `especie` varchar(50) NOT NULL,
  `raza` varchar(50) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `id_cliente` int NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_mascota`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `tblmascotas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tblclientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmascotas`
--

LOCK TABLES `tblmascotas` WRITE;
/*!40000 ALTER TABLE `tblmascotas` DISABLE KEYS */;
INSERT INTO `tblmascotas` VALUES (6,'Michifusa','2022-02-02','Gato','Domestico comun','Hembra',1,'8b9528265b488f849e258aa0550c060a'),(7,'Milaneso','2019-08-14','Perro','Criollo','Macho',1,'a3b7097dca7e14d4409e15fc5f8d40e4');
/*!40000 ALTER TABLE `tblmascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmembresia`
--

DROP TABLE IF EXISTS `tblmembresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmembresia` (
  `id_membresia` int NOT NULL AUTO_INCREMENT,
  `tipo_membresia` enum('normal','premium') NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_membresia`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `tblmembresia_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tblclientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmembresia`
--

LOCK TABLES `tblmembresia` WRITE;
/*!40000 ALTER TABLE `tblmembresia` DISABLE KEYS */;
INSERT INTO `tblmembresia` VALUES (1,'normal','2023-04-19','2023-06-19',200.00,1);
/*!40000 ALTER TABLE `tblmembresia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-22 14:45:51
