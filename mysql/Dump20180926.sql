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
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `almacen` (
  `idAlmacen` int(11) NOT NULL,
  `nomAlmacen` varchar(50) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idAlmacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,'Almacen 01',_binary '');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `NomCategoria` varchar(50) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE KEY `NomCategoria_UNIQUE` (`NomCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'EPP',_binary ''),(2,'MOTOBOMBA',_binary ''),(3,'DISCO DE CORTE',_binary ''),(4,'LUBRICANTE',_binary ''),(5,'SILICONA',_binary ''),(6,'TRANSFORMADOR',_binary ''),(7,'ABRAZADERA',_binary ''),(8,'AEROSOL',_binary ''),(9,'CONECTOR',_binary ''),(10,'CINTA',_binary ''),(11,'FUSIBLE',_binary ''),(12,'FILTRO',_binary ''),(13,'KIT DE REPARACION',_binary ''),(14,'LIMPIEZA',_binary ''),(15,'PARCHE',_binary ''),(16,'RETEN',_binary ''),(17,'SOLDADURA',_binary ''),(18,'TAPA CIEGA',_binary ''),(19,'TERMINAL',_binary ''),(20,'MENEKE',_binary ''),(21,'ENCHUFE',_binary ''),(22,'ALARMA',_binary '');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compra` (
  `idCompra` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `subTotal` decimal(10,2) NOT NULL,
  `igv` decimal(10,2) NOT NULL,
  `dcto` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `nroComprob` varchar(15) NOT NULL,
  `fechaCompra` date NOT NULL,
  `fechaIngreso` date NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `fk_Compra_Proveedor1_idx` (`idProveedor`),
  CONSTRAINT `fk_Compra_Proveedor1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detalle_compra` (
  `idCompra` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precUnit` decimal(10,2) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idCompra`,`idProducto`),
  KEY `fk_Detalle_Compra_Compra1_idx` (`idCompra`),
  KEY `fk_Detalle_Compra_Producto1_idx` (`idProducto`),
  CONSTRAINT `fk_Detalle_Compra_Compra1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idcompra`),
  CONSTRAINT `fk_Detalle_Compra_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detalle_pedido` (
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Cantidad` decimal(10,2) DEFAULT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idPedido`,`idProducto`),
  KEY `fk_Detalle_Pedido_Pedido_idx` (`idPedido`),
  KEY `fk_Detalle_Pedido_Producto1_idx` (`idProducto`),
  CONSTRAINT `fk_Detalle_Pedido_Pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idpedido`),
  CONSTRAINT `fk_Detalle_Pedido_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL,
  `NomEmpresa` varchar(100) NOT NULL,
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Transportes Paquita S.R.L');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`idMarca`),
  UNIQUE KEY `marca_UNIQUE` (`marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'VOLVO',_binary ''),(2,'HONDA',_binary ''),(3,'MENEKES',_binary '');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `nroPedido` varchar(7) NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `fecha` date NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `validado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_Usuario1_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_Pedido_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
  CONSTRAINT `fk_Producto_Categoria1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idcategoria`),
  CONSTRAINT `fk_Producto_Marca1` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idmarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Toma visible IP44 16 (Meneke macho)','4015394007975',0.00,'unidad','S/M',0.00,_binary '','S/U','\\imgProd\\meneke macho.jpg',3,20,'para electricidad'),(2,'meneke macho','s/s',0.00,'unidad','s/m',0.00,_binary '','s/u','..\\imgProd\\meneke macho.jpg',3,20,'electricidad');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_almacen`
--

DROP TABLE IF EXISTS `producto_almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `producto_almacen` (
  `idProducto` int(11) NOT NULL,
  `idAlmacen` int(11) NOT NULL,
  `Cant` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idCompra` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`,`idAlmacen`),
  KEY `fk_Producto_Almacen_Producto1_idx` (`idProducto`),
  KEY `fk_Producto_Almacen_Almacen1_idx` (`idAlmacen`),
  KEY `fk_Producto_Almacen_Usuario1_idx` (`idUsuario`),
  KEY `fk_Producto_Almacen_Compra1_idx` (`idCompra`),
  CONSTRAINT `fk_Producto_Almacen_Almacen1` FOREIGN KEY (`idAlmacen`) REFERENCES `almacen` (`idalmacen`),
  CONSTRAINT `fk_Producto_Almacen_Compra1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idcompra`),
  CONSTRAINT `fk_Producto_Almacen_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `fk_Producto_Almacen_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_almacen`
--

LOCK TABLES `producto_almacen` WRITE;
/*!40000 ALTER TABLE `producto_almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `nomProv` varchar(100) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  `direcc` varchar(100) DEFAULT NULL,
  `telef` varchar(23) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trabajador` (
  `idTrabajador` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(100) DEFAULT NULL,
  `Dni` varchar(8) DEFAULT NULL,
  `Direcc` varchar(60) DEFAULT NULL,
  `idEmpresa` int(11) NOT NULL,
  `telefono` varchar(11) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`idTrabajador`),
  KEY `fk_Trabajador_Empresa1_idx` (`idEmpresa`),
  CONSTRAINT `fk_Trabajador_Empresa1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` VALUES (1,'Anthony Alexis','Yarleque Galan','7289097','Calle cuba mz D 21 lote 13 Santa Julia',1,'920466951',_binary '');
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `pass` varchar(350) DEFAULT NULL,
  `idTrabajador` int(11) NOT NULL,
  `estado` bit(1) NOT NULL,
  `nivel` bit(1) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_Usuario_Trabajador1_idx` (`idTrabajador`),
  CONSTRAINT `fk_Usuario_Trabajador1` FOREIGN KEY (`idTrabajador`) REFERENCES `trabajador` (`idtrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'anya','e10adc3949ba59abbe56e057f20f883e',1,_binary '',_binary '');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'almacenbd'
--

--
-- Dumping routines for database 'almacenbd'
--
/*!50003 DROP PROCEDURE IF EXISTS `paIngresaAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paIngresaAlmacen`(
	almacen varchar(50)
)
BEGIN
	declare idAlmac int;
    
    set idAlmac:= (select count(*) from almacen);
    set idAlmac=idAlmac+1;
	start transaction;
    insert into almacen(idAlmacen,nomAlmacen,estado)
		values (idAlmac,almacen,true);
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paIngresaCateg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paIngresaCateg`(
	nomCat varchar(50)
)
BEGIN
	declare idCat int;
    
    set idCat:= (select count(*) from categoria);
    set idCat=idCat+1;
	start transaction;
    insert into categoria(idCategoria,NomCategoria,estado)
		values (idCat,nomCat,true);
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paIngresaMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paIngresaMarca`(
	marca varchar(45)
)
BEGIN
	declare idMarca int;
    
    set idMarca:= (select count(*) from marca);
    set idMarca=idMarca+1;
	start transaction;
    insert into marca(idMarca,marca,estado)
		values (idMarca,marca,true);
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraCategoria`()
BEGIN
	select idCategoria, NomCategoria from categoria
		where estado=true
        order by NomCategoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraMarca`()
BEGIN
	select idMarca, marca from marca
		where estado=true
        order by marca;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paRegistraProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paRegistraProd`(
	descrip varchar(80),
	nroSerie varchar(20), 
	unidMed varchar(10),
	modelo varchar(50),
	estado bit,
    ubicacion varchar(45),
	foto varchar(400),
	idMarca int,
	idCategoria int,
    obs varchar(80)
)
BEGIN
	declare idProd int;
    
    set idProd:= (select count(*) from producto);
    set idProd=idProd+1;
	start transaction;
    insert into producto
		values (idProd,descrip,nroSerie,0,unidMed,modelo,0,estado,ubicacion,foto,idMarca,idCategoria,obs);
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paValidaUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paValidaUsuario`(usser varchar(45),passw varchar(350))
begin

	select 1 estado,u.nivel,concat(t.Nombre,' ',t.Apellidos) nombre,idUsuario from usuario u inner join trabajador t
		on u.idTrabajador=t.idTrabajador
			where u.pass=md5(passw) and u.usuario=usser and u.estado=1;
    
end ;;
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

-- Dump completed on 2018-09-26 16:04:23
