-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: basket_shop
-- ------------------------------------------------------
-- Server version	8.0.17

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
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'admin','admin','admin@gmail.com');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korzina`
--

DROP TABLE IF EXISTS `korzina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korzina` (
  `idkorzina` int(11) NOT NULL AUTO_INCREMENT,
  `account_iduser` int(11) NOT NULL,
  `tovar_idtovar` int(11) NOT NULL,
  `payment` int(11) DEFAULT NULL,
  PRIMARY KEY (`idkorzina`),
  KEY `fk_korzina_account_idx` (`account_iduser`),
  KEY `fk_korzina_tovar1_idx` (`tovar_idtovar`),
  CONSTRAINT `fk_korzina_account` FOREIGN KEY (`account_iduser`) REFERENCES `account` (`iduser`),
  CONSTRAINT `fk_korzina_tovar1` FOREIGN KEY (`tovar_idtovar`) REFERENCES `tovar` (`idtovar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korzina`
--

LOCK TABLES `korzina` WRITE;
/*!40000 ALTER TABLE `korzina` DISABLE KEYS */;
/*!40000 ALTER TABLE `korzina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tovar`
--

DROP TABLE IF EXISTS `tovar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tovar` (
  `idtovar` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `opisanie` varchar(100) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `type_idtype` int(11) NOT NULL,
  PRIMARY KEY (`idtovar`),
  KEY `fk_tovar_type1_idx` (`type_idtype`),
  CONSTRAINT `fk_tovar_type1` FOREIGN KEY (`type_idtype`) REFERENCES `type` (`idtype`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tovar`
--

LOCK TABLES `tovar` WRITE;
/*!40000 ALTER TABLE `tovar` DISABLE KEYS */;
INSERT INTO `tovar` VALUES (1,'Kyrie 7',10000,'Top','',4),(2,'Mavs jersey',5000,'Top',NULL,2),(3,'Headband',2000,'Top',NULL,3),(4,'Jogel J-300',3000,'Top',NULL,1);
/*!40000 ALTER TABLE `tovar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `idtype` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtype`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'balls'),(2,'forma'),(3,'aksesuari'),(4,'krossovki');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zakaz`
--

DROP TABLE IF EXISTS `zakaz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zakaz` (
  `idzakaz` int(11) NOT NULL AUTO_INCREMENT,
  `korzina_idkorzina` int(11) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `sposoboplati` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idzakaz`),
  KEY `fk_zakaz_korzina1_idx` (`korzina_idkorzina`),
  CONSTRAINT `fk_zakaz_korzina1` FOREIGN KEY (`korzina_idkorzina`) REFERENCES `korzina` (`idkorzina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zakaz`
--

LOCK TABLES `zakaz` WRITE;
/*!40000 ALTER TABLE `zakaz` DISABLE KEYS */;
/*!40000 ALTER TABLE `zakaz` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-07 20:06:30
