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
-- Table structure for table `movprod`
--

DROP TABLE IF EXISTS `movprod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movprod` (
  `idMovProd` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idAlmacen` int(11) NOT NULL,
  `cantIngr` decimal(10,2) NOT NULL,
  `cantSalida` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `stock` decimal(10,2) NOT NULL,
  `idTrabajador` int(11) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  `estado` bit(1) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMovProd`),
  KEY `fk_MovProd_Producto_Almacen1_idx` (`idProducto`,`idAlmacen`),
  KEY `fk_MovProd_Trabajador1_idx` (`idTrabajador`),
  KEY `fk_MovProd_Usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_MovProd_Producto_Almacen1` FOREIGN KEY (`idProducto`, `idAlmacen`) REFERENCES `producto_almacen` (`idProducto`, `idAlmacen`),
  CONSTRAINT `fk_MovProd_Trabajador1` FOREIGN KEY (`idTrabajador`) REFERENCES `trabajador` (`idTrabajador`),
  CONSTRAINT `fk_MovProd_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movprod`
--

LOCK TABLES `movprod` WRITE;
/*!40000 ALTER TABLE `movprod` DISABLE KEYS */;
INSERT INTO `movprod` VALUES (1,7,1,150.00,0.00,'2018-10-30','17:24:07',150.00,NULL,1,'','',''),(2,7,1,0.00,3.00,'2018-10-30','17:25:23',147.00,2,1,'','hwkjh','aru-125'),(3,5,1,12.00,0.00,'2018-11-06','13:05:13',12.00,NULL,1,'','',''),(4,4,1,200.00,0.00,'2018-11-06','13:05:13',200.00,NULL,1,'','',''),(5,8,1,10.00,0.00,'2018-11-06','13:05:13',10.00,NULL,1,'','',''),(6,9,3,100.00,0.00,'2018-11-06','19:53:36',100.00,NULL,1,'','',''),(7,10,3,120.00,0.00,'2018-11-06','19:53:36',120.00,NULL,1,'','',''),(8,9,3,0.00,2.00,'2018-11-06','19:55:02',98.00,5,1,'','Taller mecanica','TEB 989'),(9,10,3,0.00,1.00,'2018-11-06','19:55:02',119.00,5,1,'','Taller mecanica','TEB 989'),(10,8,1,15.00,0.00,'2018-11-08','14:48:55',25.00,NULL,1,'','',''),(11,1,1,15.00,0.00,'2018-11-08','14:49:24',15.00,NULL,1,'','',''),(12,1,1,0.00,1.00,'2018-11-08','14:51:19',14.00,6,1,'','TALLER','MOTOBOMBA'),(13,1,1,5.00,0.00,'2018-11-08','14:58:05',19.00,NULL,1,'','',''),(14,1,1,0.00,2.00,'2018-11-08','15:00:58',17.00,7,1,'','CAMPO','AXL 789');
/*!40000 ALTER TABLE `movprod` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trActualizaCant` AFTER INSERT ON `movprod` FOR EACH ROW BEGIN
  
	if NEW.cantIngr=0 then
        
			update producto_almacen set Cant=Cant-NEW.cantSalida
				where idProducto=NEW.idProducto and idAlmacen=NEW.idAlmacen;
			
            update producto set stock=stock-NEW.cantSalida
				where idProducto=NEW.idProducto;
	else
		update producto_almacen set Cant=Cant+NEW.cantIngr
			where idProducto=NEW.idProducto and idAlmacen=NEW.idAlmacen;
		
        update producto set stock=stock+NEW.cantIngr
				where idProducto=NEW.idProducto;
	end if;
      
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
