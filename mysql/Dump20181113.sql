-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: almacenbd
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- ORDER BY:  `idAlmacen`

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,'Almacen 01',''),(2,'Almacen 02',''),(3,'Almacen 03','');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trIngresaProdAlmacNvo` AFTER INSERT ON `almacen` FOR EACH ROW BEGIN

  

	declare vueltas int;

    declare cont int;

    

    set vueltas:=(select count(*) from producto);

    set cont=1;

		

    while  cont<=vueltas do

		insert into producto_almacen(idProducto, idAlmacen, Cant)

			values(cont,NEW.idAlmacen, 0);

		

        set cont=cont+1;

    end while;

    

  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- ORDER BY:  `idCategoria`

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'EPP',''),(2,'MOTOBOMBA',''),(3,'DISCO DE CORTE',''),(4,'LUBRICANTE',''),(5,'SILICONA',''),(6,'TRANSFORMADOR',''),(7,'ABRAZADERA',''),(8,'AEROSOL',''),(9,'CONECTOR',''),(10,'CINTA',''),(11,'FUSIBLE',''),(12,'FILTRO',''),(13,'KIT DE REPARACION',''),(14,'LIMPIEZA',''),(15,'PARCHE',''),(16,'RETEN',''),(17,'SOLDADURA',''),(18,'TAPA CIEGA',''),(19,'TERMINAL',''),(20,'MENEKE',''),(21,'ENCHUFE',''),(22,'ALARMA',''),(23,'BROCA',''),(24,'ELECTRICIDAD','');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  UNIQUE KEY `nroComprob_UNIQUE` (`nroComprob`),
  KEY `fk_Compra_Proveedor1_idx` (`idProveedor`),
  CONSTRAINT `fk_Compra_Proveedor1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--
-- ORDER BY:  `idCompra`

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,0.00,0.00,0.00,0.00,'Ninguno','2018-10-04','2018-10-10'),(2,3,15.00,5.00,0.00,20.00,'FT09-4587','2018-10-04','2018-10-15');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_compra` (
  `idCompra` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precUnit` decimal(10,2) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idCompra`,`idProducto`),
  KEY `fk_Detalle_Compra_Compra1_idx` (`idCompra`),
  KEY `fk_Detalle_Compra_Producto1_idx` (`idProducto`),
  CONSTRAINT `fk_Detalle_Compra_Compra1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idCompra`),
  CONSTRAINT `fk_Detalle_Compra_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--
-- ORDER BY:  `idCompra`,`idProducto`

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_pedido` (
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Cantidad` decimal(10,2) DEFAULT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`idPedido`,`idProducto`),
  KEY `fk_Detalle_Pedido_Pedido_idx` (`idPedido`),
  KEY `fk_Detalle_Pedido_Producto1_idx` (`idProducto`),
  CONSTRAINT `fk_Detalle_Pedido_Pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_Detalle_Pedido_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--
-- ORDER BY:  `idPedido`,`idProducto`

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,85.00,10.00,850.00,'\0'),(1,4,15.00,10.00,150.00,'\0'),(1,6,20.00,10.00,200.00,''),(2,1,85.00,5.00,425.00,''),(2,2,85.00,5.00,425.00,''),(2,3,8.00,25.00,200.00,''),(2,4,15.00,25.00,375.00,''),(2,5,3.50,50.00,175.00,''),(4,1,20.00,15.00,300.00,''),(4,6,85.00,20.00,1700.00,''),(5,2,3.50,100.00,350.00,''),(5,5,85.00,15.00,1275.00,''),(6,2,15.00,50.00,750.00,''),(6,3,8.00,20.00,160.00,''),(7,4,3.50,15.00,52.50,''),(7,5,85.00,15.00,1275.00,'');
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL,
  `NomEmpresa` varchar(100) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--
-- ORDER BY:  `idEmpresa`

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Transportes Paquita S.R.L',''),(2,'Triangulo de Oro de Yojana Rdriguez Sanchez S.R.L',''),(3,'Servicentro el Triangulo de Oro S.R.L',''),(4,'Inversiones y servicios YyM S.R.L','');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- ORDER BY:  `idMarca`

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'VOLVO',''),(2,'HONDA',''),(3,'MENEKES',''),(4,'S/M',''),(5,'BELLSAFE',''),(6,'NARVA',''),(7,'VIPAL','');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

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
-- ORDER BY:  `idMovProd`

LOCK TABLES `movprod` WRITE;
/*!40000 ALTER TABLE `movprod` DISABLE KEYS */;
INSERT INTO `movprod` VALUES (1,7,1,150.00,0.00,'2018-10-30','17:24:07',150.00,NULL,1,'','',''),(2,7,1,0.00,3.00,'2018-10-30','17:25:23',147.00,2,1,'','hwkjh','aru-125'),(3,5,1,12.00,0.00,'2018-11-06','13:05:13',12.00,NULL,1,'','',''),(4,4,1,200.00,0.00,'2018-11-06','13:05:13',200.00,NULL,1,'','',''),(5,8,1,10.00,0.00,'2018-11-06','13:05:13',10.00,NULL,1,'','',''),(6,9,3,100.00,0.00,'2018-11-06','19:53:36',100.00,NULL,1,'','',''),(7,10,3,120.00,0.00,'2018-11-06','19:53:36',120.00,NULL,1,'','',''),(8,9,3,0.00,2.00,'2018-11-06','19:55:02',98.00,5,1,'','Taller mecanica','TEB 989'),(9,10,3,0.00,1.00,'2018-11-06','19:55:02',119.00,5,1,'','Taller mecanica','TEB 989'),(10,8,1,15.00,0.00,'2018-11-08','14:48:55',25.00,NULL,1,'','',''),(11,1,1,15.00,0.00,'2018-11-08','14:49:24',15.00,NULL,1,'','',''),(12,1,1,0.00,1.00,'2018-11-08','14:51:19',14.00,6,1,'','TALLER','MOTOBOMBA'),(13,1,1,5.00,0.00,'2018-11-08','14:58:05',19.00,NULL,1,'','',''),(14,1,1,0.00,2.00,'2018-11-08','15:00:58',17.00,7,1,'','CAMPO','AXL 789');
/*!40000 ALTER TABLE `movprod` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trActualizaCant after INSERT ON movprod
  FOR EACH ROW BEGIN
  
	if NEW.cantIngr=0 then
        
			update producto_almacen set Cant=Cant-NEW.cantSalida
				where idProducto=NEW.idProducto and idAlmacen=NEW.idAlmacen;
			
            update producto set stock=stock-NEW.cantSalida
				where idProducto=NEW.idProducto;
	else
		update producto_almacen set Cant=Cant+NEW.cantIngr
			where idProducto=NEW.idProducto and idAlmacen=NEW.idAlmacen;
		
        update producto set stock=stock+NEW.CantIngr
				where idProducto=NEW.idProducto;
	end if;
      
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `nroPedido` varchar(7) NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `fecha` date NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `validado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_Usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_Pedido_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--
-- ORDER BY:  `idPedido`

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'P000001',1200.00,'2018-10-05',1,''),(2,'P000002',1600.00,'2018-10-15',1,'\0'),(4,'P000004',2000.00,'2018-10-16',1,'\0'),(5,'P000005',1625.00,'2018-10-16',1,'\0'),(6,'P000006',910.00,'2018-10-16',1,'\0'),(7,'P000007',1327.50,'2018-10-16',1,'\0');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

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
-- ORDER BY:  `idProducto`

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Toma visible IP44 16 (Meneke macho) ','4015394007975 ',17.00,'unidad','S/M',20.00,'','S/U','\\src\\imgProd\\meneke macho.jpg',3,20,'Para electricidad'),(2,'Lentes de protección (Oscuros)','S/S',0.00,'unidad','S/M',15.00,'','S/U','\\src\\imgProd\\lentes negros 2.jpg',4,1,'lentes cuadrados oscuros'),(3,'Lentes de protección (Claros)','S/S',10.00,'unidad','S/M',8.00,'','S/U','\\src\\imgProd\\lentes claros.png',4,1,''),(4,'Tapon de oidos para industria de 4 aletas','2000001086066',100.00,'unidad','NRR: 33 dB',3.50,'','S/U','\\src\\imgProd\\tapon de oidos.jpg',5,1,'taponeras de oidos'),(5,'Led PIRATA color Amarillo 12/24V','S/S',12.00,'unidad','S/M',85.00,'','S/U','\\src\\imgProd\\led pirata amarillo.jpg',4,24,'focos para vehiculos'),(6,'Led PIRATA color rojo 12/24V','S/S',0.00,'unidad','S/M',85.00,'','S/U','\\src\\imgProd\\led pirata rojo.png',4,24,'focos para vehiculos'),(7,'Foco H7 estándar 24V 70W UV stop','S/S',147.00,'unidad','S/M',0.00,'','S/U','\\src\\imgProd\\FOCO018.jpg',6,24,''),(8,'Toma visible IP44 (Meneke hembra)','S/S',25.00,'unidad','S/M',0.00,'','S/U','\\src\\imgProd\\meneke hembra.jpeg',3,20,'para electricidad'),(9,'Parche R-01','S/S',0.00,'unidad','S/M',0.00,'','S/U','\\src\\imgProd\\parche r01.jpg',7,15,''),(10,'Parche R-02','S/S',0.00,'unidad','S/M',0.00,'','S/U','\\src\\imgProd\\parche r02.jpg',7,15,'');
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

--
-- Table structure for table `producto_almacen`
--

DROP TABLE IF EXISTS `producto_almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_almacen` (
  `idProducto` int(11) NOT NULL,
  `idAlmacen` int(11) NOT NULL,
  `Cant` decimal(10,2) NOT NULL,
  `CantInv` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idProducto`,`idAlmacen`),
  KEY `fk_Producto_Almacen_Producto1_idx` (`idProducto`),
  KEY `fk_Producto_Almacen_Almacen1_idx` (`idAlmacen`),
  CONSTRAINT `fk_Producto_Almacen_Almacen1` FOREIGN KEY (`idAlmacen`) REFERENCES `almacen` (`idAlmacen`),
  CONSTRAINT `fk_Producto_Almacen_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_almacen`
--
-- ORDER BY:  `idProducto`,`idAlmacen`

LOCK TABLES `producto_almacen` WRITE;
/*!40000 ALTER TABLE `producto_almacen` DISABLE KEYS */;
INSERT INTO `producto_almacen` VALUES (1,1,17.00,0.00),(1,2,0.00,0.00),(1,3,0.00,0.00),(2,1,0.00,0.00),(2,2,0.00,0.00),(2,3,0.00,0.00),(3,1,10.00,0.00),(3,2,0.00,0.00),(3,3,200.00,0.00),(4,1,100.00,0.00),(4,2,0.00,0.00),(4,3,200.00,0.00),(5,1,12.00,0.00),(5,2,0.00,0.00),(5,3,0.00,0.00),(6,1,0.00,0.00),(6,2,0.00,0.00),(6,3,0.00,0.00),(7,1,147.00,0.00),(7,2,0.00,0.00),(7,3,0.00,0.00),(8,1,25.00,0.00),(8,2,0.00,0.00),(8,3,0.00,0.00),(9,1,0.00,0.00),(9,2,0.00,0.00),(9,3,98.00,0.00),(10,1,0.00,0.00),(10,2,0.00,0.00),(10,3,119.00,0.00);
/*!40000 ALTER TABLE `producto_almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- ORDER BY:  `idProveedor`

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'S/P','','','','',''),(2,'MAESTRO HOME CENTER','20112273922','Av. Angamos Este N° 1805','','',''),(3,'MAKRO','','','','',''),(4,'PROMART','20536557858','Av. Aviacion 2405-Lima','','','');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `fk_Trabajador_Empresa1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--
-- ORDER BY:  `idTrabajador`

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` VALUES (1,'Anthony Alexis','Yarleque Galan','72889097','Calle cuba mz D 21 lote 13 Santa Julia',1,'920466951',''),(2,'MARTÍN TEODORO','HIDALGO ALBURQUEQUE','03853012','',1,'',''),(3,'TERESA DEL ROCIO','YOVERA JIMENEZ','77038701','',1,'',''),(4,'VILMA CLARIBEL','SERNA SERNAQUE','46032383','',1,'',''),(5,'JOSE','SANCHEZ REQUENES','41866767','',2,'',''),(6,'JAVIER','CHIROQUE','','',3,'',''),(7,'GUILLERMO','VALDIVIEZO','','',1,'','');
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `pass` varchar(350) DEFAULT NULL,
  `idTrabajador` int(11) NOT NULL,
  `estado` bit(1) NOT NULL,
  `nivel` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `fk_Usuario_Trabajador1_idx` (`idTrabajador`),
  CONSTRAINT `fk_Usuario_Trabajador1` FOREIGN KEY (`idTrabajador`) REFERENCES `trabajador` (`idTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--
-- ORDER BY:  `idUsuario`

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'anya','e10adc3949ba59abbe56e057f20f883e',1,'',1),(2,'teyo','ebaa7b6e37dfd3fbcc148682ae0f94c6',3,'\0',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_ingresoprod`
--

DROP TABLE IF EXISTS `vista_ingresoprod`;
/*!50001 DROP VIEW IF EXISTS `vista_ingresoprod`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_ingresoprod` AS SELECT 
 1 AS `descrip`,
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `unidMed`,
 1 AS `nomAlmacen`,
 1 AS `ubicacion`,
 1 AS `cantIngr`,
 1 AS `cantSalida`,
 1 AS `fecha`,
 1 AS `hora`,
 1 AS `stock`,
 1 AS `area`,
 1 AS `unidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_salidaprod`
--

DROP TABLE IF EXISTS `vista_salidaprod`;
/*!50001 DROP VIEW IF EXISTS `vista_salidaprod`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_salidaprod` AS SELECT 
 1 AS `descrip`,
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `unidMed`,
 1 AS `nomAlmacen`,
 1 AS `ubicacion`,
 1 AS `cantIngr`,
 1 AS `cantSalida`,
 1 AS `fecha`,
 1 AS `hora`,
 1 AS `stock`,
 1 AS `area`,
 1 AS `unidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'almacenbd'
--

--
-- Dumping routines for database 'almacenbd'
--
/*!50003 DROP PROCEDURE IF EXISTS `paConciliaExistencias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paConciliaExistencias`(
	idProd int,
    idAlmac int,
    cant decimal(10,2)
)
BEGIN
	start transaction;
		update producto_almacen set CantInv=cant
			where idProducto=idProd and idAlmacen=idAlmac;
		
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paEliminaAlm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paEliminaAlm`(idAlm int)
BEGIN

	start transaction;

		update almacen set estado=false

			where idAlmacen=idAlm;

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paEliminaCat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paEliminaCat`(idCat int)
BEGIN

	start transaction;

		update categoria set estado=false

			where idCategoria=idCat;

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paEliminaMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paEliminaMarca`(idMarc int)
BEGIN

	start transaction;

		update marca set estado=false

			where idMarca=idMarc;

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paEliminaProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paEliminaProd`(idProd int)
BEGIN

	start transaction;

		update producto set estado=false

			where idProducto=idProd;

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paEliminarProv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paEliminarProv`(idProv int)
BEGIN

	start transaction;

		update proveedor set estado=false

			where idProveedor=idProv;

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paEliminaTrab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paEliminaTrab`(idTrab int)
BEGIN

	start transaction;

		update trabajador set estado=false

			where idTrabajador=idTrab;

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paEliminaUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paEliminaUsuario`(idUser int)
BEGIN

	start transaction;

		update usuario set estado=false

			where idUsuario=idUser;

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paIngresaAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `paIngresaCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paIngresaCompra`(

	idProv int,

    subtot decimal(10,2),

    IGV decimal(10,2),

    dcto decimal(10,2),

    tot decimal(10,2),

    comprob varchar(15),

    fechaCompr varchar(10)

)
BEGIN

	declare idCompr int;

    set idCompr:= (select count(*) from compra);

    set idCompr=idCompr+1;

    start transaction;

		

		insert into compra(idCompra, idProveedor, subTotal, igv, dcto, total, nroComprob, fechaCompra, fechaIngreso)

			values(idCompr,idProv,subtot,IGV,dcto,tot,comprob,STR_TO_DATE(fechaCompr, '%d/%m/%Y'),now());

        

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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `paIngresaPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paIngresaPedido`(

	idProd int,

	prec decimal(10,2),

    cant decimal(10,2),

    totProd decimal(10,2),

    suma decimal(10,2),

    idUser int,

    band bit

)
BEGIN

	declare nroPed int(6) zerofill;

	declare idPed int;

    set idPed:= (select count(*) from pedido);

    set idPed=idPed+1;

    start transaction;

		if band=false then

			set idPed=idPed+1;

            set nroPed=idPed;

			insert into pedido(idPedido, nroPedido,total,fecha,idUsuario,validado)

				values(idPed,concat('P',nroPed),suma,now(),idUser,false);

                

			insert into detalle_pedido(idPedido, idProducto, Precio, Cantidad, SubTotal, estado)

				values(idPed,idProd,prec,cant,totProd,true);

		

        else

			insert into detalle_pedido(idPedido, idProducto, Precio, Cantidad, SubTotal, estado)

				values(idPed,idProd,prec,cant,totProd,true);

        end if;

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paIngresaProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paIngresaProveedor`(

	nombre varchar(100),

	RUC varchar(11),

	direc varchar(100),

	telf varchar(23),

	email varchar(50)

)
BEGIN

	declare idProv int;

    

    set idProv:= (select count(*) from proveedor);

    set idProv=idProv+1;

	start transaction;

    insert into proveedor(idProveedor, nomProv, ruc, direcc, telef, correo, estado)

		values (idProv,nombre,RUC,direc,telf,email,true);

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paIngresaTrabajador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paIngresaTrabajador`(

	Nombr varchar(50),

	Apell varchar(100),

	DNI varchar(8),

	Dir varchar(60),

	idEmpr int,

	telf varchar(11)

)
BEGIN

	declare idTrab int;

    

    set idTrab:= (select count(*) from trabajador);

    set idTrab=idTrab+1;

    

	start transaction;

		insert into trabajador(idTrabajador, Nombre, Apellidos, Dni, Direcc, idEmpresa, telefono, estado)

			values (idTrab, Nombr, Apell, DNI, Dir, idEmpr, telf, true);

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paIngresaUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paIngresaUser`(

	usuar varchar(45),

    idTrab int,

    nivl int

)
BEGIN

	declare idUser int;

    

    set idUser:= (select count(*) from usuario);

    set idUser=idUser+1;

    

	start transaction;

		insert into usuario(idUsuario,usuario,pass,idTrabajador,estado,nivel)

			values(idUser,usuar,md5(concat(usuar,'p18')),idTrab,true,nivl);

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paInicializaInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paInicializaInventario`(
	idProd int,
    idAlmac int,
    cant decimal(10,2)
)
BEGIN
	start transaction;
		update producto_almacen set Cant=cant
			where idProducto=idProd and idAlmacen=idAlmac;
		
        update producto set stock=cant
			where idProducto=idProd;
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paModificarCat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paModificarCat`(

	idCat int,

    nombre varchar(50)

)
BEGIN

	start transaction;

		update categoria set NomCategoria=nombre

			where idCategoria=idCat;

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paModificarMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paModificarMarca`(

	idMarc int,

	nombre varchar(45)

)
BEGIN

	start transaction;

		update marca set marca=nombre

			where idMarca=idMarc;

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paModificarProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paModificarProd`(

	idProd int,

    nombre varchar(80),

    serie varchar(20),

	unMed varchar(10),

	model varchar(50),

	prec decimal(10,2), 

	ubic varchar(45),

	ruta varchar(400),

	idMarc int,

	idCat int,

	observ varchar(80)

)
BEGIN

	start transaction;

		update producto set descrip=nombre, nroSerie=serie, unidMed=unMed, modelo=model, precio=prec, ubicacion=ubic, foto=ruta, idMarca=idMarc, idCategoria=idCat, obs=observ

			where idProducto=idProd;

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paModificarProveed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paModificarProveed`(

	idProv int,

    nombre varchar(100),

    RUC varchar(11),

    dir varchar(100),

    telf varchar(23),

    email varchar(50)

)
BEGIN

	start transaction;

		update proveedor set nomProv=nombre, ruc=RUC, direcc=dir, telef=telf, correo=email

			where idProveedor=idProv;

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paModificarTrab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paModificarTrab`(

	idTrab int,

	nomb varchar(50),

	apell varchar(100),

	DNI varchar(8),

	dir varchar(60),

	idEmpres int,

	telf varchar(11)

)
BEGIN

	start transaction;

		update trabajador set Nombre=nomb, Apellidos=apell,Dni=DNI, direcc=dir, idEmpresa=idEmpres, telefono=telf

			where idTrabajador=idTrab;

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraAlmacen`()
BEGIN

	select idAlmacen, nomAlmacen from almacen

		where estado=true

        order by nomAlmacen;

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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraCompras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraCompras`()
BEGIN

	select c.nroComprob, c.idCompra, c.idProveedor, p.nomProv

		from compra c join proveedor p on c.idProveedor=p.idProveedor

        order by c.fechaIngreso;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraDatosIngrProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraDatosIngrProd`(

	desde date,

	hasta date

)
BEGIN

	select p.descrip, m.marca, p.modelo, p.unidMed, al.nomAlmacen, p.ubicacion, mp.cantIngr, mp.fecha, mp.hora, mp.stock, concat(t.Nombre,' ',t.Apellidos) usuario 

		from producto p join movprod mp on p.idProducto=mp.idProducto

			join usuario u on mp.idUsuario=u.idUsuario

            join trabajador t on u.idTrabajador=t.idTrabajador

            join almacen al on mp.idAlmacen=al.idAlmacen

            join marca m on p.idMarca=m.idMarca

            where mp.cantIngr>0 and (mp.fecha between desde and hasta);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraDatosMovProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraDatosMovProd`(
	desde date,
    hasta date
)
BEGIN
	select p.descrip, m.marca, p.modelo, p.unidMed, al.nomAlmacen, p.ubicacion, mp.cantIngr, mp.cantSalida, mp.fecha,concat(t.nombre,' ',t.Apellidos) trab, concat(mp.hora,'') hora, mp.stock, mp.area, mp.unidad
		from producto p join movprod mp on p.idProducto=mp.idProducto
	   left join trabajador t on mp.idTrabajador=t.idTrabajador
            join almacen al on mp.idAlmacen=al.idAlmacen
            join marca m on p.idMarca=m.idMarca
            where mp.fecha between desde and hasta
            order by mp.idMovProd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraDatosMovProdID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraDatosMovProdID`(
	desde date,
    hasta date,
    idProd int
)
BEGIN
	select p.descrip, m.marca, p.modelo, p.unidMed, al.nomAlmacen, p.ubicacion, mp.cantIngr, mp.cantSalida, mp.fecha,concat(t.nombre,' ', t.Apellidos) trab, concat(mp.hora,'') hora, mp.stock, mp.area, mp.unidad
		from producto p join movprod mp on p.idProducto=mp.idProducto
	   left join trabajador t on mp.idTrabajador=t.idTrabajador
            join almacen al on mp.idAlmacen=al.idAlmacen
            join marca m on p.idMarca=m.idMarca
            where (mp.fecha between desde and hasta) and mp.idProducto=idProd
            order by mp.idMovProd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraDatosPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraDatosPedido`(idPed int)
BEGIN

	select dp.idPedido, pr.descrip, dp.idProducto, dp.precio, dp.Cantidad, dp.Subtotal

		from detalle_pedido dp join producto pr on dp.idProducto=pr.idProducto

			where dp.estado=true and dp.idPedido=idPed;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraDatosProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraDatosProd`(

	idProd int, 

	serie varchar(20)

)
BEGIN

	select p.descrip, m.marca, c.NomCategoria cat, p.modelo, p.nroSerie, p.ubicacion, p.obs,  p.unidMed,  p.precio,  p.foto, p.idProducto

		from Producto p join Categoria c 

			on p.idCategoria=c.idCategoria join Marca m on p.idMarca=m.idMarca

				where (p.idProducto=idProd or p.nroSerie=serie) and p.estado=true;

                

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraDatosProdxAlmac` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraDatosProdxAlmac`(IN `idProd` INT, IN `serie` VARCHAR(20), IN `idAlmac` INT)
BEGIN

	select p.descrip, m.marca, c.NomCategoria cat, p.modelo, p.nroSerie, p.ubicacion, p.obs,  p.unidMed,  p.precio,  p.foto, p.idProducto, pa.Cant

		from Producto p join Categoria c 

			on p.idCategoria=c.idCategoria 

            join Marca m on p.idMarca=m.idMarca

            join producto_almacen pa on p.idProducto=pa.idProducto

				where (p.idProducto=idProd or p.nroSerie=serie) and p.estado=true and pa.idAlmacen=idAlmac;

                

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraDatosProdxIDAlmac` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraDatosProdxIDAlmac`(
	idAlmac int
)
BEGIN
	select p.descrip, m.marca, c.NomCategoria cat, p.modelo, p.nroSerie, p.ubicacion, p.obs,  p.unidMed,  p.precio,  p.foto, p.idProducto, pa.Cant, p.idProducto

		from Producto p join Categoria c 

			on p.idCategoria=c.idCategoria 

            join Marca m on p.idMarca=m.idMarca

            join producto_almacen pa on p.idProducto=pa.idProducto

				where p.estado=true and pa.idAlmacen=idAlmac;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraDatosProdxStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraDatosProdxStock`(
	stock decimal(10,2)
)
BEGIN
	select p.descrip, m.marca, c.NomCategoria cat, p.modelo, p.nroSerie, p.ubicacion, p.obs,  p.unidMed,  p.precio,  p.foto, p.idProducto, p.stock
		from Producto p join Categoria c 
			on p.idCategoria=c.idCategoria join Marca m on p.idMarca=m.idMarca
				where p.stock<=stock and p.estado=true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraDatosProv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraDatosProv`(

	idProv int

)
BEGIN

	select * from proveedor

		where idProveedor=idProv;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraDatosSalidaProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraDatosSalidaProd`(

	desde date,

	hasta date

)
BEGIN

	select p.descrip, m.marca, p.modelo, p.unidMed, al.nomAlmacen, p.ubicacion, mp.cantIngr, mp.fecha, mp.hora, mp.stock, concat(t.Nombre,' ',t.Apellidos) trab, mp.area, mp.unidad 

		from producto p join movprod mp on p.idProducto=mp.idProducto

			join trabajador t on mp.idTrabajador=t.idTrabajador

            join almacen al on mp.idAlmacen=al.idAlmacen

            join marca m on p.idMarca=m.idMarca

            where mp.cantSalida>0 and (mp.fecha between desde and hasta);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraDatosSalidaProdxTrab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraDatosSalidaProdxTrab`(

	idTrab int,

    fecha date

)
BEGIN

	select p.descrip, m.marca, p.modelo, p.unidMed, al.nomAlmacen, p.ubicacion, mp.cantIngr, mp.fecha, mp.hora, mp.stock, concat(t.Nombre,' ',t.Apellidos) trab, mp.area, mp.unidad 

		from producto p join movprod mp on p.idProducto=mp.idProducto

			join trabajador t on mp.idTrabajador=t.idTrabajador

            join almacen al on mp.idAlmacen=al.idAlmacen

            join marca m on p.idMarca=m.idMarca

            where mp.cantSalida>0 and mp.fecha=fecha and mp.idTrabajador=idTrab;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraDatostrab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraDatostrab`(idTrab int)
BEGIN

	select t.idTrabajador, t.Nombre, t.Apellidos, t.Dni, t.Direcc, e.NomEmpresa, t.telefono

		from trabajador t join empresa e on t.idEmpresa=e.idEmpresa

			where idTrabajador=idTrab;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraDiferencias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraDiferencias`(
	idAlmac int
)
BEGIN
	select a.nomAlmacen, p.descrip, c.NomCategoria cat, m.marca, p.modelo, p.nroSerie, p.ubicacion, pa.Cant cantidad, pa.CantInv, pa.CantInv-pa.Cant diferencia
		from producto_almacen pa join producto p on pa.idProducto=p.idProducto
        join marca m on p.idMarca=m.idMarca
        join almacen a on pa.idAlmacen=a.idAlmacen
        join categoria c on p.idCategoria=c.idCategoria
			where a.idAlmacen=idAlmac and pa.Cant>0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraEmpresas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraEmpresas`()
BEGIN

	select idEmpresa, NomEmpresa from empresa

		where estado=true;

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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraMovProdTodos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraMovProdTodos`(IN `desde` DATE, IN `hasta` DATE)
    NO SQL
select p.descrip, m.marca, p.modelo, p.unidMed, al.nomAlmacen, p.ubicacion, mp.cantIngr, mp.cantSalida, mp.fecha, concat(mp.hora,'') hora, mp.stock, concat(t.Nombre,' ',t.Apellidos) trab, mp.area, mp.unidad

		from producto p join movprod mp on p.idProducto=mp.idProducto

	  join trabajador t on mp.idTrabajador=t.idTrabajador

            join almacen al on mp.idAlmacen=al.idAlmacen

            join marca m on p.idMarca=m.idMarca

            where (mp.cantSalida>0 and mp.cantIngr>0) and mp.fecha BETWEEN desde and hasta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraPedidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraPedidos`()
BEGIN

	select p.idPedido,p.nroPedido, concat(t.Nombre,' ',t.Apellidos) nombre, p.fecha 

		from pedido p join usuario u on p.idUsuario=u.idUsuario

			join trabajador t on u.idTrabajador=t.idTrabajador

		order by nroPedido;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraProd`()
BEGIN

	select idProducto, descrip from Producto

    where estado=true

    order by descrip;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraProdxCat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraProdxCat`(idcat int)
BEGIN

	select idProducto, descrip from Producto

    where idCategoria=idCat and estado=true

    order by descrip;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraProveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraProveedores`()
BEGIN

	select idProveedor, nomProv from proveedor

		where estado=true

        order by idProveedor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraTrab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraTrab`()
BEGIN

	select idTrabajador, concat(Nombre, ' ' ,Apellidos) nombre from trabajador

		where estado=true

        order by nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraTrabSinUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraTrabSinUser`()
BEGIN

	select t.idTrabajador, t.Nombre, t.Apellidos

		from trabajador t left join usuario u 

			on t.idTrabajador=u.idTrabajador

			where t.estado=true and (u.idTrabajador is null or u.estado=false);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paMuestraUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paMuestraUsuarios`()
BEGIN

	select u.idUsuario, t.Nombre 

		from usuario u join trabajador t on u.idTrabajador=t.idTrabajador

		where u.estado=true

        order by t.Nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paRegistraIngrProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paRegistraIngrProd`(

	idCompra int,

	idProd int,

    idAlmac int,

	cant decimal(10,2),

	precUnit decimal(10,2),

	idUser int,

    tipoMov bit,

    stockF decimal(10,2)

)
BEGIN

	declare idMovProd int;

    -- declare stock decimal(10,2);

    set idMovProd:= (select count(*) from movprod);

    set idMovProd=idMovProd+1;

    -- set stock:=(select Cant from producto_almacen where idProducto=idProd and idAlmacen=idAlmac);

    

    start transaction;

		if tipoMov=1 then -- Es un ingreso de productos

			-- set stock=stock+cant;

			insert into movprod(idMovProd, idProducto, idAlmacen,cantIngr,CantSalida, fecha, hora, stock, idTrabajador, idUsuario, estado, area, unidad)

				values(idMovProd,idProd,idAlmac,cant, 0, now(), now(), stockF, null, idUser, true,'','');

		else -- Es una salida de productos

			insert into movprod(idMovProd, idProducto, idAlmacen,cantIngr,CantSalida, fecha, hora, stock, idTrabajador, idUsuario, estado)

				values(idMovProd,idProd,idAlmac,0, cant, now(), now(), stockF, null, idUser, true);

        end if;

    commit;

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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `paRegistraSalidaProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paRegistraSalidaProd`(

	idProd int,

    idAlmac int,

	cant decimal(10,2),

	idUser int,

    idTrab int,

    area varchar(45),

    unid varchar(45),

    stock decimal(10,2)

)
BEGIN

	declare idMovProd int;

    -- declare stock decimal(10,2);

    set idMovProd:= (select count(*) from movprod);

    set idMovProd=idMovProd+1;

    -- set stock:=(select Cant from producto_almacen where idProducto=idProd and idAlmacen=idAlmac);

    -- set stock=stock-cant;

    start transaction;

		-- Es una salida de productos

		insert into movprod(idMovProd, idProducto, idAlmacen,cantIngr,CantSalida, fecha, hora, stock, idTrabajador, idUsuario, estado, area, unidad)

			values(idMovProd,idProd,idAlmac,0, cant, now(), now(), stock, idTrab, idUser, true, area, unid);

        

    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paRetornaStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paRetornaStock`( 

	idAlmac int,

	idProd int

)
BEGIN

	select pa.cant from producto_almacen pa

		where idProducto=idProd and idAlmacen=idAlmac;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paValidaPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paValidaPedido`(

	idProd int,

    idPed int,

    ultDato bit

)
BEGIN

	start transaction;

		update detalle_pedido set estado=0

			where idProducto=idProd and idPedido=idPed;

            

		if ultDato=1 then

			update pedido set validado=1

				where idPedido=idPed;

        end if;

        

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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

--
-- Final view structure for view `vista_ingresoprod`
--

/*!50001 DROP VIEW IF EXISTS `vista_ingresoprod`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ingresoprod` AS select `p`.`descrip` AS `descrip`,`m`.`marca` AS `marca`,`p`.`modelo` AS `modelo`,`p`.`unidMed` AS `unidMed`,`al`.`nomAlmacen` AS `nomAlmacen`,`p`.`ubicacion` AS `ubicacion`,`mp`.`cantIngr` AS `cantIngr`,`mp`.`cantSalida` AS `cantSalida`,`mp`.`fecha` AS `fecha`,concat(`mp`.`hora`,'') AS `hora`,`mp`.`stock` AS `stock`,`mp`.`area` AS `area`,`mp`.`unidad` AS `unidad` from (((`producto` `p` join `movprod` `mp` on((`p`.`idProducto` = `mp`.`idProducto`))) join `almacen` `al` on((`mp`.`idAlmacen` = `al`.`idAlmacen`))) join `marca` `m` on((`p`.`idMarca` = `m`.`idMarca`))) where (`mp`.`cantIngr` > 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_salidaprod`
--

/*!50001 DROP VIEW IF EXISTS `vista_salidaprod`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_salidaprod` AS select `p`.`descrip` AS `descrip`,`m`.`marca` AS `marca`,`p`.`modelo` AS `modelo`,`p`.`unidMed` AS `unidMed`,`al`.`nomAlmacen` AS `nomAlmacen`,`p`.`ubicacion` AS `ubicacion`,`mp`.`cantIngr` AS `cantIngr`,`mp`.`cantSalida` AS `cantSalida`,`mp`.`fecha` AS `fecha`,concat(`mp`.`hora`,'') AS `hora`,`mp`.`stock` AS `stock`,`mp`.`area` AS `area`,`mp`.`unidad` AS `unidad` from (((`producto` `p` join `movprod` `mp` on((`p`.`idProducto` = `mp`.`idProducto`))) join `almacen` `al` on((`mp`.`idAlmacen` = `al`.`idAlmacen`))) join `marca` `m` on((`p`.`idMarca` = `m`.`idMarca`))) where (`mp`.`cantIngr` > 0) */;
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

-- Dump completed on 2018-11-13 19:00:55
