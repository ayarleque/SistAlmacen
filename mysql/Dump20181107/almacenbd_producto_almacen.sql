CREATE DATABASE  IF NOT EXISTS `almacenbd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `almacenbd`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: almacenbd
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `producto_almacen`
--

DROP TABLE IF EXISTS `producto_almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `producto_almacen` (
  `idProducto` int(11) NOT NULL,
  `idAlmacen` int(11) NOT NULL,
  `Cant` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idProducto`,`idAlmacen`),
  KEY `fk_Producto_Almacen_Producto1_idx` (`idProducto`),
  KEY `fk_Producto_Almacen_Almacen1_idx` (`idAlmacen`),
  CONSTRAINT `fk_Producto_Almacen_Almacen1` FOREIGN KEY (`idAlmacen`) REFERENCES `almacen` (`idalmacen`),
  CONSTRAINT `fk_Producto_Almacen_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_almacen`
--
-- ORDER BY:  `idProducto`,`idAlmacen`

LOCK TABLES `producto_almacen` WRITE;
/*!40000 ALTER TABLE `producto_almacen` DISABLE KEYS */;
INSERT INTO `producto_almacen` VALUES (1,1,0.00),(1,2,0.00),(1,3,0.00),(2,1,0.00),(2,2,0.00),(2,3,0.00),(3,1,0.00),(3,2,0.00),(3,3,0.00),(4,1,200.00),(4,2,0.00),(4,3,0.00),(5,1,12.00),(5,2,0.00),(5,3,0.00),(6,1,0.00),(6,2,0.00),(6,3,0.00),(7,1,147.00),(7,2,0.00),(7,3,0.00),(8,1,10.00),(8,2,0.00),(8,3,0.00),(9,1,0.00),(9,2,0.00),(9,3,98.00),(10,1,0.00),(10,2,0.00),(10,3,119.00);
/*!40000 ALTER TABLE `producto_almacen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-07 19:06:16
