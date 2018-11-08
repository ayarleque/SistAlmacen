CREATE DATABASE  IF NOT EXISTS `almacenbd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `almacenbd`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: almacenbd
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.36-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `descrip` varchar(80) NOT NULL,
  `nroSerie` varchar(20) DEFAULT NULL,
  `stock` decimal(10,2) NOT NULL,
  `unidMed` varchar(10) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `ubicacion` varchar(45) DEFAULT NULL,
  `foto` varchar(400) DEFAULT NULL,
  `idMarca` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `obs` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  UNIQUE KEY `descrip_UNIQUE` (`descrip`),
  KEY `fk_Producto_Marca1_idx` (`idMarca`),
  KEY `fk_Producto_Categoria1_idx` (`idCategoria`),
  CONSTRAINT `fk_Producto_Categoria1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  CONSTRAINT `fk_Producto_Marca1` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Toma visible IP44 16 (Meneke macho) ','4015394007975 ',17.00,'unidad','S/M',20.00,'','S/U','\\src\\imgProd\\meneke macho.jpg',3,20,'Para electricidad'),(2,'Lentes de protección (Oscuros)','S/S',0.00,'unidad','S/M',15.00,'','S/U','\\src\\imgProd\\lentes negros 2.jpg',4,1,'lentes cuadrados oscuros'),(3,'Lentes de protección (Claros)','S/S',0.00,'unidad','S/M',8.00,'','S/U','\\src\\imgProd\\lentes claros.png',4,1,''),(4,'Tapon de oidos para industria de 4 aletas','2000001086066',200.00,'unidad','NRR: 33 dB',3.50,'','S/U','\\src\\imgProd\\tapon de oidos.jpg',5,1,'taponeras de oidos'),(5,'Led PIRATA color Amarillo 12/24V','S/S',12.00,'unidad','S/M',85.00,'','S/U','\\src\\imgProd\\led pirata amarillo.jpg',4,24,'focos para vehiculos'),(6,'Led PIRATA color rojo 12/24V','S/S',0.00,'unidad','S/M',85.00,'','S/U','\\src\\imgProd\\led pirata rojo.png',4,24,'focos para vehiculos'),(7,'Foco H7 estándar 24V 70W UV stop','S/S',147.00,'unidad','S/M',0.00,'','S/U','\\src\\imgProd\\FOCO018.jpg',6,24,''),(8,'Toma visible IP44 (Meneke hembra)','S/S',25.00,'unidad','S/M',0.00,'','S/U','\\src\\imgProd\\meneke hembra.jpeg',3,20,'para electricidad'),(9,'Parche R-01','S/S',98.00,'unidad','S/M',0.00,'','S/U','\\src\\imgProd\\parche r01.jpg',7,15,''),(10,'Parche R-02','S/S',119.00,'unidad','S/M',0.00,'','S/U','\\src\\imgProd\\parche r02.jpg',7,15,'');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trIngresaProdAlmac` AFTER INSERT ON `producto` FOR EACH ROW BEGIN
  
	declare vueltas int;
    declare cont int;
    
    set vueltas:=(select count(*) from almacen);
    set cont=1;
		
    while  cont<=vueltas do
		insert into producto_almacen(idProducto, idAlmacen, Cant)
			values(NEW.idProducto, cont, 0);
		
        set cont=cont+1;
    end while;
    
  END */;;
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

-- Dump completed on 2018-11-08 17:26:56
