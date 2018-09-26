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
-- Table structure for table `movprod`
--

DROP TABLE IF EXISTS `movprod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movprod` (
  `idMovProd` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idAlmacen` int(11) NOT NULL,
  `cant` decimal(10,2) NOT NULL,
  `tipoMov` bit(1) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `stock` decimal(10,2) NOT NULL,
  `idTrabajador` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `idProveedor` int(11) NOT NULL,
  PRIMARY KEY (`idMovProd`),
  KEY `fk_MovProd_Producto_Almacen1_idx` (`idProducto`,`idAlmacen`),
  KEY `fk_MovProd_Trabajador1_idx` (`idTrabajador`),
  KEY `fk_MovProd_Usuario1_idx` (`idUsuario`),
  KEY `fk_MovProd_Proveedor1_idx` (`idProveedor`),
  CONSTRAINT `fk_MovProd_Producto_Almacen1` FOREIGN KEY (`idProducto`, `idAlmacen`) REFERENCES `producto_almacen` (`idproducto`, `idalmacen`),
  CONSTRAINT `fk_MovProd_Proveedor1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idproveedor`),
  CONSTRAINT `fk_MovProd_Trabajador1` FOREIGN KEY (`idTrabajador`) REFERENCES `trabajador` (`idtrabajador`),
  CONSTRAINT `fk_MovProd_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movprod`
--

LOCK TABLES `movprod` WRITE;
/*!40000 ALTER TABLE `movprod` DISABLE KEYS */;
/*!40000 ALTER TABLE `movprod` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-26 15:56:51
