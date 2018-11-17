-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: almacenbd
-- ------------------------------------------------------
-- Server version	5.7.24-log

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

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'EPP',''),(2,'MOTOBOMBA',''),(3,'DISCO DE CORTE',''),(4,'LUBRICANTE',''),(5,'SILICONA',''),(6,'TRANSFORMADOR',''),(7,'ABRAZADERA',''),(8,'AEROSOL',''),(9,'CONECTOR',''),(10,'CINTA',''),(11,'FUSIBLE',''),(12,'FILTRO',''),(13,'KIT DE REPARACION',''),(14,'LIMPIEZA',''),(15,'PARCHE',''),(16,'RETEN',''),(17,'SOLDADURA',''),(18,'TAPA CIEGA',''),(19,'TERMINAL',''),(20,'MENEKE',''),(21,'ENCHUFE',''),(22,'ALARMA',''),(23,'BROCA',''),(24,'ELECTRICIDAD',''),(25,'SEGURIDAD',''),(26,'BOTIQUIN',''),(27,'ENLLANTE',''),(28,'ACCESORIOS',''),(29,'CERRAJERIA',''),(30,'VALVULA',''),(31,'PINTURA',''),(32,'VOLVO',''),(33,'RETROESCAVADORA','');
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

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,0.00,0.00,0.00,0.00,'Ninguno','2018-11-14','2018-11-14');
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

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
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

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'VOLVO',''),(2,'HONDA',''),(3,'MENEKES',''),(4,'S/M',''),(5,'BELLSAFE',''),(6,'NARVA',''),(7,'VIPAL',''),(8,'PIRANHA',''),(9,'IMP',''),(10,'LEVITON',''),(11,'ABRO',''),(12,'WURTH',''),(13,'PHILIPS',''),(14,'3M',''),(15,'SHURTAPE',''),(16,'SCOTCH',''),(17,'LIGHTECH',''),(18,'BOSCH',''),(19,'MUEBLEX',''),(20,'PURISIMA',''),(21,'VISTONY',''),(22,'PURE GUARD',''),(23,'CASTROL',''),(24,'FRENOSA',''),(25,'LOCTITE',''),(26,'SIKA',''),(27,'AMERICAN',''),(28,'REY',''),(29,'CKF',''),(30,'QMEDIC',''),(31,'NIPROL',''),(32,'RHOAMEDIC',''),(33,'MEDICAL BT',''),(34,'ALCOFARMA',''),(35,'CUREBAND',''),(36,'PALUX',''),(37,'EPP PERU',''),(38,'RED LINE',''),(39,'TECSEG',''),(40,'VIRUTEX',''),(41,'WERKEN',''),(42,'NORTH',''),(43,'SAFETY',''),(44,'FORTE',''),(45,'CLUTE',''),(46,'IM',''),(47,'ANLLIC',''),(48,'TRUPER',''),(49,'JET',''),(50,'GOOD YEAR',''),(51,'MINSAFE',''),(52,'BETTANIN',''),(53,'DKASA',''),(54,'STANLEY',''),(55,'TRAVEX',''),(56,'FIXSER',''),(57,'SAP',''),(58,'POWER FORCE',''),(59,'VOLTECH',''),(60,'GS-YAMAR',''),(61,'BESTTOOLS',''),(62,'HOMETOOLS',''),(63,'BEARING',''),(64,'YANMAR',''),(65,'SERMEFIT',''),(66,'CANTOL',''),(67,'DWALT',''),(68,'OERLIKON',''),(69,'ACEROS AREQUIPA',''),(70,'BITTRAL',''),(71,'AW',''),(72,'ILL',''),(73,'MRDI',''),(74,'AURORA',''),(75,'VENCEDOR',''),(76,'TEKNO',''),(77,'CPP',''),(78,'KOLOR',''),(79,'AÑORGA',''),(80,'CHEMA',''),(81,'ANDINA',''),(82,'BONN',''),(83,'CHEMISA',''),(84,'CAT',''),(85,'IVECO',''),(86,'CNH','');
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

LOCK TABLES `movprod` WRITE;
/*!40000 ALTER TABLE `movprod` DISABLE KEYS */;
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

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
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

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'FOCO STANDAR 1 FILAMENTO P21W','4013790258052',0.00,'unidad','P21W',0.00,'','6B','\\src\\imgProd\\p21w.jpg',6,24,'Para unidades'),(2,'FOCO PY21W AMBER','4013790161055',0.00,'unidad','P21W',0.00,'','6B','\\src\\imgProd\\63209545427e8b58224a38373983.jpg',6,24,'Para unidades'),(3,'FOCO P21/5W STANDARD','4013790269058',0.00,'unidad','P21/5W',0.00,'','6B','\\src\\imgProd\\p21-5w Narva.png',6,24,'Para unidades'),(4,'FOCO H3 STANDARD','4013790311054',0.00,'unidad','H3',0.00,'','6B','\\src\\imgProd\\narva-48351.jpg',6,24,'Para unidades'),(5,'FOCO H7 STANDARD','4013790393050',0.00,'unidad','H7',0.00,'','6B','\\src\\imgProd\\D_Q_NP_606493-MLB27827889061_072018-Q.jpg',6,24,'Para unidades'),(6,'FOCO H21W 24V 21W STANDARD','4013790799104',0.00,'unidad','H21 24V 21W',0.00,'','6B','\\src\\imgProd\\Narva_H21W-500x500.png',6,24,'Para unidades'),(7,'FOCO TIPO LAGRIMA W3W 24V 3W','4013790224057',0.00,'unidad','W3W 24V 3W',0.00,'','6B','\\src\\imgProd\\w3w 24v 3w Narva.jpg',6,24,'Para unidades'),(8,'FUSIBLE TIPO UÑA IMP 32V ROJO','S/S',0.00,'unidad','32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA ROJO.JPG',9,11,''),(9,'FUSIBLE TIPO MINI UÑA 7.5AH 32V MARRON','S/S',0.00,'unidad','7.5AH 32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA.jpg',9,11,''),(10,'FUSIBLE TIPO UÑA 7.5AH IMP 32V MARRON','S/S',0.00,'unidad','7.5AH 32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA.jpg',9,11,''),(11,'FUSIBLE TIPO UÑA 5AH IMP 32V MARRON','S/S',0.00,'unidad','5AH 32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA.jpg',9,11,''),(12,'FUSIBLE TIPO UÑA 20AH IMP 32V VERDE','S/S',0.00,'unidad','20AH 32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA.jpg',9,11,''),(13,'FUSIBLE TIPO MINI UÑA 20AH IMP 32V VERDE','S/S',0.00,'unidad','20AH 32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA.jpg',9,11,''),(14,'FUSIBLE TIPO UÑA 20AH IMP 32V ROJO','S/S',0.00,'unidad','20AH 32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA.jpg',9,11,''),(15,'FUSIBLE TIPO UÑA 5AH 32V MARRON','S/S',0.00,'unidad','5AH 32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA.jpg',9,11,''),(16,'FUSIBLE TIPO UÑA 7.5AH 32V MARRON','S/S',0.00,'unidad','7.5AH 32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA.jpg',9,11,''),(17,'FUSIBLE TIPO MINI UÑA 15AH 32V AZUL','S/S',0.00,'unidad','7.5AH 32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA.jpg',9,11,''),(18,'FUSIBLE TIPO UÑA 25AH 32V GRIS','S/S',0.00,'unidad','25AH 32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA.jpg',9,11,''),(19,'FUSIBLE TIPO MINI UÑA 25AH 32V GRIS','S/S',0.00,'unidad','25AH 32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA.jpg',9,11,''),(20,'FUSIBLE TIPO UÑA 30AH 32V VERDE','S/S',0.00,'unidad','30AH 32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA.jpg',9,11,''),(21,'FUSIBLE TIPO MINI UÑA 30AH 32V VERDE','S/S',0.00,'unidad','30AH 32V',0.00,'','6B','\\src\\imgProd\\TIPO UNHA.jpg',9,11,'se ubica en el taper tipo rueda'),(22,'TERMINALES TIPO OJO 1/2 AMARILLO','S/S',0.00,'unidad','S/M',0.00,'','6B','\\src\\imgProd\\Terminal tipo ojo amarillo.jpg',9,19,''),(23,'TERMINALES TIPO OJO 3/8 AZUL','S/S',0.00,'unidad','S/M',0.00,'','6B','\\src\\imgProd\\Terminal tipo ojo azul.jpg',9,19,''),(24,'PIN AMARILLO 5.5','S/S',0.00,'unidad','S/M',0.00,'','6B','\\src\\imgProd\\PIN AMARILLO.jpg',9,19,''),(25,'NYLON MACHO AZUL','S/S',0.00,'unidad','BM250FLP',0.00,'','6B','\\src\\imgProd\\nylon.jpg',9,19,''),(26,'TERMINAL TIPO OJO 3/16 AZUL','S/S',0.00,'unidad','S/M',0.00,'','6B','\\src\\imgProd\\Terminal tipo ojo azul pequeño.jpg',9,19,''),(27,'TERMINAL TIPO OJO 3/8 AMARILLO','S/S',0.00,'unidad','S/M',0.00,'','6B','\\src\\imgProd\\Terminal tipo ojo 3-16.jpg',9,19,''),(28,'TERMINAL DE LATON TIPO FASTON HEMBRA','S/S',0.00,'unidad','P67025',0.00,'','6B','\\src\\imgProd\\Terminal de laton tipo faston -  Hembra.jpg',9,19,''),(29,'TERMINAL DE LATON TIPO FASTON MACHO','S/S',0.00,'unidad','MDD2-250',0.00,'','6B','\\src\\imgProd\\Term. Faston macho.jpg',9,19,''),(30,'TERMINAL DE FASTON MACHO CON RETEN','S/S',0.00,'unidad','674.08.00.9/F',0.00,'','6B','\\src\\imgProd\\Term. Faston hemb. con reten.jpg',9,19,''),(31,'CONECTOR DE COBRE 6/8','2000001094914',0.00,'undidad','S/M',0.00,'','6B','\\src\\imgProd\\conector cobre .png',4,9,''),(32,'ENCHUFE TRIFASICO 15A 125V','078477840832',0.00,'undidad','1K47L0',0.00,'','6A','\\src\\imgProd\\Ench. Trifasico.png',10,9,''),(33,'LIMPIADOR DE CONTACTOS','078477840832',0.00,'undidad','EC-533',0.00,'','6A','\\src\\imgProd\\limpiador-de-contactos-abro.jpg',11,24,''),(34,'LIMPIADOR DE BORNES DE BATERIA','4050641623010',0.00,'undidad','S/M',0.00,'','6A','\\src\\imgProd\\Limpiador de bornes.jpg',12,24,''),(35,'PROTECTOR DE POLOS DE BATERIA','4050641645517',0.00,'unidad','S/M',0.00,'','6A','\\src\\imgProd\\protector de polos de B.jpg',12,24,''),(36,'ENCHUFE DE CARRETERA HEMBRA','795689084372',0.00,'unidad','15-730',0.00,'','6A','\\src\\imgProd\\conector 7 vias hembra con resorte.jpg',13,24,''),(37,'CONECTOR DE 7 VIAS MACHO','795689084365',0.00,'unidad','SAE J560',0.00,'','6A','\\src\\imgProd\\Conector 7 vias macho.png',13,24,''),(38,'ALARMA 12-36 VDC','038986600204',0.00,'unidad','60-102',0.00,'','6A','\\src\\imgProd\\alarma.jpg',13,25,''),(39,'FARO LED PIRATA BLANCO 12/24V','S/S',0.00,'unidad','TK-TL041',0.00,'','6C','\\src\\imgProd\\faroblanco.JPG',8,24,''),(40,'FARO LED PIRATA ROJO 12/24V','S/S',0.00,'unidad','TK-TL041',0.00,'','6C','\\src\\imgProd\\faro Red.JPG',8,24,''),(41,'FARO LED PIRATA AMBAR 12/24V','S/S',0.00,'unidad','TK-TL041',0.00,'','6C','\\src\\imgProd\\faro Ambar.JPG',8,24,''),(42,'LED PIRATA BLANCO 27W','S/S',0.00,'unidad','S/M',0.00,'','6C','\\src\\imgProd\\Led Piranha.JPG',8,24,''),(43,'CINTA AISLANTE DE VINIL','7750373000420',0.00,'unidad','S/M',0.00,'','6C','\\src\\imgProd\\Cinta-Aislante-1000.jpg',14,24,''),(44,'CINTA AISLANTE 4 COLORES','7751690000124',0.00,'unidad','S/M',0.00,'','6C','\\src\\imgProd\\cinta 4 colores.jpg',15,24,''),(45,'TAPA CIEGA RECTANGULAR','7753970000473',0.00,'unidad','S/M',0.00,'','6C','\\src\\imgProd\\tapa ciega.jpg',4,24,''),(46,'CINTA ELECTRICA AUTOSOLDABLE','7891040003860',0.00,'unidad','23',0.00,'','6C','\\src\\imgProd\\cinta autosoldable.jpg',16,24,''),(47,'BORNE POSITIVO','S/S',0.00,'unidad','MP',0.00,'','6D','\\src\\imgProd\\BORNE POSITIVO.jpg',4,24,'Para baterias'),(48,'BORNE NEGATIVO','S/S',0.00,'unidad','MP',0.00,'','6D','\\src\\imgProd\\BORNE NEGATIVO.jpg',4,24,'Para baterias'),(49,'CAJA CIEGA RECTANGULAR','S/S',0.00,'unidad','S/M',0.00,'','6D','\\src\\imgProd\\CAJA CIEGA RECTANGULAR.jpg',4,24,''),(50,'CAJA CIEGA OCTAGONAL','S/S',0.00,'unidad','S/M',0.00,'','6D','\\src\\imgProd\\CAJA CIEGA OCTAGONAL.jpg',4,24,''),(51,'PROTECTOR DE BORNES POSITIVO','S/S',0.00,'unidad','S/M',0.00,'','6C','\\src\\imgProd\\Protector de bornes.jpg',4,24,''),(52,'PROTECTOR DE BORNES NEGATIVO','S/S',0.00,'unidad','S/M',0.00,'','6C','\\src\\imgProd\\Protector de bornes.jpg',4,24,''),(53,'FLUORESCENTE 18W','8711500285621',0.00,'unidad','TL-D 18W/865',0.00,'','7A','\\src\\imgProd\\FLUORESCENTE 18W-865.jpg',13,24,''),(54,'FLUORESCENTE 36W','8711500286215',0.00,'unidad','TL-D 36W/54',0.00,'','PISO','\\src\\imgProd\\FLUORESCENTE 36W-54.jpg',13,24,'entre anaquel 5 y 6'),(55,'FLUORESCENTE CON SOCATE','7750902111801',0.00,'unidad','T8/G13',0.00,'','PISO','\\src\\imgProd\\fluorecentes + socate 220v.jpg',17,24,'entre anaquel 5 y 6'),(56,'RELAY 24V','3165141213195',0.00,'unidad','250 25D',0.00,'','6B','\\src\\imgProd\\Relay BOSCH.jpg',18,24,''),(57,'FOCO DE PLACA 12-24V','S/S',0.00,'unidad','S/M',0.00,'','6B','\\src\\imgProd\\FocoPlaca.JPG',4,24,''),(58,'LUCES LATERALES O CARRETEROS AMBAR','S/S',0.00,'unidad','S/M',0.00,'','6C','\\src\\imgProd\\Luces Laterales ambar.JPG',4,24,''),(59,'LUCES LATERALES O CARRETEROS ROJO','S/S',0.00,'unidad','S/M',0.00,'','6C','\\src\\imgProd\\Luces Laterales Red.JPG',4,24,''),(60,'SILICONA GREY','790920121298',0.00,'unidad','999',0.00,'','6D','\\src\\imgProd\\silicona grey 999.jpg',11,24,''),(61,'GARRUCHA PLATAFORMA','7755183024956',0.00,'unidad','S/M',0.00,'','6D','\\src\\imgProd\\Garrucha.jpg',19,24,''),(62,'TOMA VISIBLE IP44 16A HEMBRA','4015394007975',0.00,'unidad','S/M',0.00,'','6D','\\src\\imgProd\\meneke hembra.jpeg',3,24,''),(63,'TOMA VISIBLE IP44 16A MACHO','4015394001430',0.00,'unidad','S/M',0.00,'','6D','\\src\\imgProd\\meneke macho.jpg',3,24,''),(64,'TOMA VISIBLE IP44 32A MACHO','4015394001607',0.00,'unidad','2P/T',0.00,'','6D','\\src\\imgProd\\Mennekes 32A.jpg',3,24,''),(65,'AGUA PARA BATERIAS','S/S',0.00,'unidad','S/M',0.00,'','6D','\\src\\imgProd\\Agua para baterias.JPG',20,24,''),(66,'REFRIGERANTE TRIPLE ACCION','7750804386550',0.00,'unidad','S/M',0.00,'','5A','\\src\\imgProd\\Refrigerante vistony.JPG',21,4,''),(67,'LUBRICANTE FLUIDO TRANSMISION AUTOMATICA','733704930242',0.00,'unidad','S/M',0.00,'','5A','\\src\\imgProd\\pure guard tipo A.jpg',22,4,''),(68,'FILTRO DE ACEITE VOLVO 21707132','P21707132',0.00,'unidad','S/M',0.00,'','5B','\\src\\imgProd\\filtro de aceite volvo.png',1,12,''),(69,'LUBRICANTE TIPO F','7750804000210',0.00,'unidad','ATF',0.00,'','5B','\\src\\imgProd\\atf vistony tipo F.jpg',21,12,''),(70,'REFRIGERANTE PARA RADIADOR VERDE','7750804000449',0.00,'unidad','S/M',0.00,'','5B','\\src\\imgProd\\Refigerante verde Vistony.png',21,4,''),(71,'ACEITE PARA MOTOR A GASOLINA HD SAE50','703206112804',0.00,'unidad','HD SAE 50',0.00,'','5C','\\src\\imgProd\\Aceite Castrol SAE 50.jpg',23,4,''),(72,'LIQUIDO PARA FRENOS SAE J1703','7750975438515',0.00,'unidad','SAE J1703',0.00,'','5C','\\src\\imgProd\\Liquido Frenosa DOT3 355ml.jpeg',24,4,''),(73,'LUBRICANTE PARA COMPRESORA DE AIRE','7750804002214',0.00,'unidad','S/M',0.00,'','5C','\\src\\imgProd\\Aceite Compresora Vistony.jpg',21,4,''),(74,'AROMATIZANTE FLORAL','7750804000661',0.00,'unidad','S/M',0.00,'','5A','\\src\\imgProd\\aromatizante floral Vistony.jpeg',21,8,''),(75,'ACEITE PARA TORNILLOS','079340271319',0.00,'unidad','S/M',0.00,'','5A','\\src\\imgProd\\Aceite p Tuercas Loctite 271.jpg',25,8,''),(76,'SILICONA PARA VENTANAS','3240240006029',0.00,'unidad','S/M',0.00,'','5A','\\src\\imgProd\\sikasil silicona.jpg',26,5,''),(77,'SILICONA LIQUIDA BLANCA','S/S',0.00,'litros','S/M',0.00,'','PASADIZO','\\src\\imgProd\\Silicona Blanca Vistony.jpeg',21,5,''),(78,'GRASA CHASIS','S/S',0.00,'kilogramos','S/M',0.00,'','PASADIZO','\\src\\imgProd\\Grasa Chasis H-2 Vistony.jpeg',21,4,''),(79,'LUBRICANTE AMERICANO','S/S',0.00,'galones','S/M',0.00,'','PASADIZO','\\src\\imgProd\\Lubricante America.jpeg',27,4,''),(80,'GRASA EP-2 LITHIUM','S/S',0.00,'kilogramos','S/M',0.00,'','PASADIZO','\\src\\imgProd\\Lubricante America.jpeg',21,4,''),(81,'GRASA CHASIS SUPER H-2','S/S',0.00,'kilogramos','S/M',0.00,'','PASADIZO','\\src\\imgProd\\Grasa Chasis  H-2 Vistony.jpeg',21,4,''),(82,'FLUIDO DE TRANSMISION AUTOMATICA','S/S',0.00,'litros','HIDROLYNA TIPO F',0.00,'','PASADIZO','\\src\\imgProd\\hidrolyna tipo f.JPG',21,4,''),(83,'LUBRICANTE HYSPIN AWS68','079191502303',0.00,'libras','AWS 68',0.00,'','PASADIZO','\\src\\imgProd\\Castrol.jpeg',23,4,''),(84,'PROTECTOR CEROSO CGS','S/S',0.00,'galones','CG COAT-400',0.00,'','PASADIZO','\\src\\imgProd\\CG Coat-400 Clear.jpeg',23,4,''),(85,'ACEITE DE TRANSMISION','S/S',0.00,'galones','GL-4',0.00,'','PASADIZO','\\src\\imgProd\\Aceite de Transmision API GL-4 Vistony.jpeg',21,4,''),(86,'BOTIQUIN DE MADERA','S/S',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\botiquin madera.jpg',4,26,''),(87,'BOTIQUIN DE PLASTICO','7750062014707',0.00,'unidad','S/N',0.00,'','1','\\src\\imgProd\\botiquin de plastico.jpg',28,26,''),(88,'BOLSA DE ALGODON','7752650109253',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\algodon.jpg',29,26,''),(89,'CINTA ADHESIVA QUIRURGICA','7755969001010',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\CINTA ADHESIVA.jpg',30,26,''),(90,'GUANTES DE LATEX','4968420508208',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\GUANTES DE LATEX.png',31,26,''),(91,'GASA Y ALGODON TIPO IV','S/S',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\GASA.jpg',32,26,''),(92,'VENDA ELASTICA','7751204000084',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\VENDA ELASTICA.png',33,26,''),(93,'ALCOHOL 70°','7753464000378',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\ALCOHOL 70.jpg',34,26,''),(94,'VENDITAS ','7702136645003',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\venditas.png',35,26,''),(95,'GASA ESTERIL','7751204000466',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\GASA ESTERIL.jpg',33,26,''),(96,'SIRENA - SONIDO DE AMBULANCIA 90W','S/S',0.00,'unidad','OP-90S',0.00,'','1','\\src\\imgProd\\SIRENA.jpg',36,22,''),(97,'EXTINTOR PQS','D06591151',0.00,'unidad','30SHISB-ABC',0.00,'','1','\\src\\imgProd\\extintor.jpg',4,25,''),(98,'CINTA PELIGRO AMARILLA','2000000480626',0.00,'metro','S/M',0.00,'','1','\\src\\imgProd\\CINTA PELIGRO AMARILLA.png',37,1,''),(99,'ARNE DE SEGURIDAD','0641817005194',0.00,'unidad','Q4 ABCD',0.00,'','1','\\src\\imgProd\\ARNE.jpg',37,1,''),(100,'LENTES DE PROTECCION NITRO CLAROS','2000001112991',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\LENTES CLAROS NITRO.jpg',38,1,''),(101,'LENTES DE PROTECCION TRANSPARENTES','4045989636990',0.00,'unidad','WZ87',0.00,'','1','\\src\\imgProd\\lentes claros.jpg',12,1,''),(102,'RESPIRADOR 2 VIAS CONTRA POLVOS','2000020839626',0.00,'unidad','BSP-2',0.00,'','1','\\src\\imgProd\\respirador 2 vias.jpg',5,1,''),(103,'PROTECTOR DE VIAS RESPIRATORIAS','4046777536706',0.00,'unidad','GMC',0.00,'','1','\\src\\imgProd\\PROTECTOR 2 VIAS.jpg',12,1,''),(104,'OVEROL MICROPOROSO TALLA XL','S/S',0.00,'unidad','TSG15',0.00,'','1','\\src\\imgProd\\OVEROL MICROPOROSO.jpg',39,1,''),(105,'BOLSA DE BASURA','S/S',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\BOLSA.jpg',40,1,''),(106,'GUANTES DE NITRILO FORRADO VERDE','2000000545004',0.00,'unidad','T9',0.00,'','1','\\src\\imgProd\\guante-verde-nitrilo-flocado-t-l.jpg',41,1,''),(107,'GUANTE DE NITRILO 13\'\'','2050000204456',0.00,'unidad','LA1326B',0.00,'','1','\\src\\imgProd\\guante-verde-nitrilo-flocado-t-l.jpg',42,1,''),(108,'GUANTES CON PUNTOS PVC','S/S',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\guantes pvc.jpg',4,1,''),(109,'GUANTES SOLDADOR','S/S',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\guante soldador.jpg',12,1,''),(110,'GUANTES SOLDADOR DE DESCARNE','7756440000041',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\GUANTE DESCARNE.jpg',43,1,''),(111,'GUANTES CUERO DESCARNE LONA STANDARD','2000000044934',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\guante-cuero-clona-azul.jpg',38,1,''),(112,'GUANTES CON PALMA DE LATEX','4045727030714',0.00,'unidad','0899400530',0.00,'','1','\\src\\imgProd\\guante palma de latex.jpg',12,1,''),(113,'CARTUCHOS CONTRA POLVO','7756155000060',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\CARTUCHOS CONTRA POLVO.jpg',12,1,''),(114,'BARBIQUEJO','7754235000450',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\BARBIQUEJO.jpg',43,1,''),(115,'MASCARILLA','S/S',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\Mascarilla protectora.jpg',4,1,''),(116,'MANDIL IMPERMEABLE NEGRO','S/S',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\mandil negro.jpg',4,1,''),(117,'MANDIL DE CUERO PARA SOLDADOR','S/S',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\mandil soldador plomo.jpg',4,1,''),(118,'CHALECO BAS DRILL VERDE','S/S',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\chaleco verde.jpg',43,1,''),(119,'TAPON DE OIDOS','2000001085066',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\tapon de oidos.jpg',5,1,''),(120,'LENTES PARA SOLDADURA','7756155000121',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\anteojos  protección tipo copa.jpg',5,1,''),(121,'CARTUCHO DE VAPOR ORGANICO','051138216740',0.00,'unidad','6001PB-1',0.00,'','1','\\src\\imgProd\\cartucho de vapor orgánico.jpg',14,1,''),(122,'FILTRO DE PARTICULAS','2000000820248',0.00,'unidad','P100',0.00,'','1','\\src\\imgProd\\filtros de particulas p100.jpg',14,1,''),(123,'CASCO DE PROTECCION DE SEGURIDAD','2000002022299',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\casco blanco.jpg',44,1,''),(124,'CONO 28\'\' NARANJA','7754213000519',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\cono naranja.png',45,1,''),(125,'BOTAS PUNTA DE ACERO TALLA 40','S/S',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\botas negras.png',46,1,''),(126,'SEÑALIZADORES DE EXTINTORES','S/S',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\Señalización de extintor.jpg',4,1,''),(127,'IMPERMEABLE DE LLUVIA','S/S',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\Mandil impermeable Naranja.jpg',47,1,''),(128,'CHALECO DE SEGURIDAD NARANJA','S/S',0.00,'unidad','S/M',0.00,'','1','\\src\\imgProd\\chaleco naranja.jpg',4,1,''),(129,' CALIBRADOR DE NEUMATICOS','S/S',0.00,'unidad','MGA-200X',0.00,'','10B','\\src\\imgProd\\calibrador para neumáticos.jpg',48,1,''),(130,'PARCHE R-01','7897046706828',0.00,'unidad','R-01',0.00,'','10A','\\src\\imgProd\\R1.jpg',7,1,''),(131,'PARCHE R-02','7897046706835',0.00,'unidad','R-02',0.00,'','10A','\\src\\imgProd\\R2.jpg',7,1,''),(132,'PARCHE R-03','7897046706842',0.00,'unidad','R-03',0.00,'','10A','\\src\\imgProd\\R3.jpg',7,1,''),(133,'CEMENTO VULCANIZANTE','7897046714403',0.00,'unidad','BV-03',0.00,'','10A','\\src\\imgProd\\Cemento vulcanizante.jpg',7,1,''),(134,'CAMARA DE MOTOCICLETA','001465',0.00,'unidad','S/M',0.00,'','10A','\\src\\imgProd\\cámara de moto.jpg',49,1,''),(135,'PARCHES DIAGONALES VD-01 A FRIO','7897046706255',0.00,'unidad','VD-01',0.00,'','10A','\\src\\imgProd\\VD 1.jpg',7,1,''),(136,'PARCHES DIAGONALES VD-02 A FRIO','7897046706262',0.00,'unidad','VD-02',0.00,'','10A','\\src\\imgProd\\VD 2.jpg',7,1,''),(137,'PARCHES DIAGONALES VD-03 A FRIO','7897046721470',0.00,'unidad','VD-03',0.00,'','10A','\\src\\imgProd\\VD 3.jpg',7,27,''),(138,'PARCHES DIAGONALES VD-04 A FRIO','7897046706286',0.00,'unidad','VD-04',0.00,'','10A','\\src\\imgProd\\VD 4.jpg',7,27,''),(139,'PARCHES RADIALES VF-08 A FRIO','7897046706378',0.00,'unidad','VF-08',0.00,'','10A','\\src\\imgProd\\VF 8.jpg',7,27,''),(140,'PARCHES RADIALES RAC-12 A FRIO','7897046706156',0.00,'unidad','RAC-12',0.00,'','10A','\\src\\imgProd\\RAC 12.jpg',7,27,''),(141,'PARCHES JA C 45','S/S',0.00,'unidad','C 45',0.00,'','10A','\\src\\imgProd\\JAC 45.jpg',49,27,''),(142,'PARCHES JA C 55','36071410550001',0.00,'unidad','C 55',0.00,'','10A','\\src\\imgProd\\JAC 45.jpg',49,27,''),(143,'INFLADOR DE LLANTAS','9584819602057',0.00,'unidad','160 PSI',0.00,'','10C','\\src\\imgProd\\inflador de ruedas.jpg',50,27,''),(144,'INDICADOR DE TUERCA','S/S',0.00,'unidad','S/M',0.00,'','10B','\\src\\imgProd\\INDICADOR DE TUERCA.jpg',51,28,''),(145,'EXTENSION DE AIRE DE CAUCHO','S/S',0.00,'unidad','S/M',0.00,'','10B','\\src\\imgProd\\EXTENSION DE AIRE PLASTICO.jpg',4,27,''),(146,'EXTENSION DE AIRE V3-20-16','S/S',0.00,'unidad','V3-20-16',0.00,'','10B','\\src\\imgProd\\EXTENSION DE AIRE V3 20 16.jpg',4,27,''),(147,'EXTENSION DE AIRE V3-20-14','S/S',0.00,'unidad','V3-20-14',0.00,'','10B','\\src\\imgProd\\EXTENSION DE AIRE V3 20 14.jpg',4,27,''),(148,'PERNOS PARA LLANTAS','S/S',0.00,'unidad','S/M',0.00,'','10B','\\src\\imgProd\\PERNO PARA LLANTA.jpg',4,27,''),(149,'TUERCAS VARIAS','S/S',0.00,'unidad','S/M',0.00,'','10B','\\src\\imgProd\\TUERCA.jpg',4,27,''),(150,'TUERCAS CILINDRO','S/S',0.00,'unidad','S/M',0.00,'','10B','\\src\\imgProd\\TUERCA CILINDRO.jpg',4,27,''),(151,'PERNOS VARIOS','S/S',0.00,'unidad','S/M',0.00,'','10B','\\src\\imgProd\\PERNOS VARIOS.jpg',4,27,''),(152,'TUERCAS ELLANTE','S/S',0.00,'unidad','S/M',0.00,'','10B','\\src\\imgProd\\TUERCA.jpg',4,27,''),(153,'TUERCAS PARA ENLLANTE','S/S',0.00,'unidad','S/M',0.00,'','10B','\\src\\imgProd\\TUERCA.jpg',4,27,''),(154,'CONECTOR EMT 3/4\"','2000000301792',0.00,'unidad','3/4\"',0.00,'','10B','\\src\\imgProd\\Conector EMT.jpg',4,27,''),(155,'ACOPLE BRONCE CROMADO','S/S',0.00,'unidad','S/M',0.00,'','10B','\\src\\imgProd\\Acople bronce.JPG',4,27,''),(156,'PERNOS MEDIANOS','S/S',0.00,'unidad','S/M',0.00,'','10B','\\src\\imgProd\\PERNOS VARIOS.jpg',4,28,''),(157,'PERNOS PEQUEÑOS','S/S',0.00,'unidad','S/M',0.00,'','10B','\\src\\imgProd\\pernos MEDIANOS.jpg',4,28,''),(158,'REPUESTOS DE PERNOS','S/S',0.00,'unidad','S/M',0.00,'','10B','\\src\\imgProd\\pernos MEDIANOS.jpg',4,28,''),(159,'WAYPE','S/S',0.00,'unidad','S/M',0.00,'','10C','\\src\\imgProd\\TRAPERO COPA.jpg',4,14,''),(160,'REPUESTO TRAPERO COPA','7759998556916',0.00,'unidad','S/M',0.00,'','10C','\\src\\imgProd\\WAYPE.jpg',40,14,''),(161,'REPUESTO MOPA','7898509280510',0.00,'unidad','SUPER PRO',0.00,'','10C','\\src\\imgProd\\TRAPERO COPA.jpg',52,14,'REPUESTO DE TRAPEADOR'),(162,'KIT DE LIMPIEZA DE VIDRIO','7898509284044',0.00,'unidad','SP9059',0.00,'','10C','\\src\\imgProd\\Kit limpia Vidrios.jpg',52,14,''),(163,'MOPA MULTIUSO','7759918002370',0.00,'unidad','S/M',0.00,'','10C','\\src\\imgProd\\MOPA-MULTIUSO-PALO.jpg',53,14,''),(164,'REPUESTO DE LIMPIA VIDRIO','S/S',0.00,'unidad','S/M',0.00,'','10C','\\src\\imgProd\\Repuesto de Limpiavidrio.jpg',52,14,''),(165,'VISAGRAS PARA VENTANA','S/S',0.00,'unidad','S/M',0.00,'','9A','\\src\\imgProd\\Visagra chicas.JPG',4,29,''),(166,'VISAGRAS PEQUEÑAS','S/S',0.00,'unidad','S/M',0.00,'','9A','\\src\\imgProd\\Visagra chicas.JPG',4,29,''),(167,'SET ACCESORIOS PARA TALADRO','7807999057519',0.00,'unidad','S/M',0.00,'','9A','\\src\\imgProd\\SET ACCESORIOS.jpg',4,29,''),(168,'ESCUADRA DE METAL','076174459128',0.00,'unidad','S/M',0.00,'','9A','\\src\\imgProd\\Escuadra.jpg',54,29,''),(169,'VISAGRAS CHICAS','S/S',0.00,'unidad','S/M',0.00,'','9A','\\src\\imgProd\\Visagra chicas.JPG',4,29,''),(170,'VISAGRAS GRANDES','S/S',0.00,'unidad','S/M',0.00,'','9A','\\src\\imgProd\\Visagra chicas.JPG',4,29,''),(171,'CANDADO MULTIPUNTO','7751613001436',0.00,'unidad','50XT',0.00,'','9A','\\src\\imgProd\\CANDADO 50XT.jpg',55,29,''),(172,'CANDADO DE BRONCE 50 MM','7807990094193',0.00,'unidad','50MM',0.00,'','9A','\\src\\imgProd\\CANDADO 50XT.jpg',56,29,''),(173,'CANDADO DE CUELLO STANDARD  1 9/16\'\'','883351383226',0.00,'unidad','CD5640',0.00,'','9A','\\src\\imgProd\\CANDADO STANLEY.jpg',54,29,''),(174,'AJUSTADOR PARA FRENOS 10 DIENTES','815812000465',0.00,'unidad','10 DIENTES',0.00,'','8A','\\src\\imgProd\\AJUSTADOR SAP.jpg',57,29,''),(175,'REFLECTOR LED 30W LUZ FRIA','2000000994970',0.00,'unidad','S/M',0.00,'','8A','\\src\\imgProd\\REFLECTOR30W.png',58,24,''),(176,'REFLECTOR LED 10W LUZ FRIA','2000000994963',0.00,'unidad','S/M',0.00,'','8A','\\src\\imgProd\\REFLECTOR10W.png',58,24,''),(177,'ABRAZADERA TIPO OMEGA 3\"','7506240621546',0.00,'unidad','3\'\'',0.00,'','8A','\\src\\imgProd\\ABRAZADERA TIPO OMEGA.jpg',59,24,''),(178,'TEFLON','7751690000193',0.00,'unidad','3\'\'',0.00,'','8A','\\src\\imgProd\\TEFLON.jpg',15,28,''),(179,'KIT CORTA CIRCULOS 7/8\"','7501206621707',0.00,'unidad','7/8\"',0.00,'','8A','\\src\\imgProd\\CORTACIRCULOS.jpg',48,28,''),(180,'ZEBRAS','S/S',0.00,'unidad','S/M',0.00,'','8A','\\src\\imgProd\\ZEBRAS.jpg',4,28,''),(181,'PERNO PARA TORNAMESA','S/S',0.00,'unidad','S/M',0.00,'','8A','\\src\\imgProd\\PERNO PARA TORNAMESA.jpg',4,28,''),(182,'DIAFRAGMA','S/S',0.00,'unidad','S/M',0.00,'','8A','\\src\\imgProd\\TAPON MOTOBOMBA.jpg',4,2,''),(183,'PERNOS 4\"','S/S',0.00,'unidad','S/M',0.00,'','8B','\\src\\imgProd\\PERNOS4PULG.jpg',4,2,''),(184,'CUBIERTA DE CABEZA DE VALVULA','S/S',0.00,'unidad','DD8',0.00,'','8B/C1','\\src\\imgProd\\CUBIERTA DD8.jpg',60,2,''),(185,'CUBIERTA DE CABEZA DE VALVULA DD7','S/S',0.00,'unidad','DD7',0.00,'','8B/C1','\\src\\imgProd\\CUBIERTA DD8.jpg',60,2,''),(186,'CUBIERTA DE CABEZA DE VALVULA CF3','S/S',0.00,'unidad','CF3',0.00,'','8B/C1','\\src\\imgProd\\CUBIERTA CF3.jpg',60,2,''),(187,'CUBIERTA DE CABEZA DE VALVULA YPZ','S/S',0.00,'unidad','YPZ',0.00,'','8B/C1','\\src\\imgProd\\CUBIERTA DD8.jpg',60,2,''),(188,'PIEZAS DE ACCESORIO DE AIRE','6931598207363',0.00,'unidad','KM-14',0.00,'','8B','\\src\\imgProd\\PIEZAS DE ACCESORIOS DE AIRE.jpg',61,2,''),(189,'PISTOLA SOPLADORA DE AIRE','7807999058615',0.00,'unidad','S/M',0.00,'','8B','\\src\\imgProd\\PISTOLA DE AIRE.jpg',38,2,''),(190,'ACEITERA CON GATILLO DE METAL','7754235001037',0.00,'unidad','S/M',0.00,'','8B','\\src\\imgProd\\ACEITERA CON GATILLO DE METAL.jpg',62,2,''),(191,'RODAJE 6308','S/S',0.00,'unidad','6308 DU',0.00,'','8B','\\src\\imgProd\\RODAJE BEARING.jpg',63,2,''),(192,'EMPAQUETADURA 168FA','S/S',0.00,'unidad','168FA',0.00,'','8B/C1','\\src\\imgProd\\EMPAQUE 186FA.jpg',63,2,''),(193,'FILTRO DE ACEITE CMP','S/S',0.00,'unidad','20033P',0.00,'','8B/C2','\\src\\imgProd\\FILTRO YANMAR.jpg',64,2,''),(194,'PISTON 186FA','S/S',0.00,'unidad','186FA',0.00,'','8B/C2','\\src\\imgProd\\PISTON 186FA.jpg',4,2,''),(195,'RUEDA DE METAL ','S/S',0.00,'unidad','S/M',0.00,'','8B','\\src\\imgProd\\RUEDAS.jpg',65,2,''),(196,'PERNO 31','S/S',0.00,'unidad','31',0.00,'','8B','\\src\\imgProd\\PERNO31.jpg',4,2,''),(197,'JUEGO DE ANILLOS','S/S',0.00,'unidad','S/M',0.00,'','8B/C2','\\src\\imgProd\\JUEGO DE ANILLOS.jpg',4,2,''),(198,'PIN DE BIELA','S/S',0.00,'unidad','S/M',0.00,'','8B/C2','\\src\\imgProd\\PIN DE BIELA.JPG',4,2,''),(199,'BOMBA DE INYECCION','S/S',0.00,'unidad','S/M',0.00,'','8B/C2','\\src\\imgProd\\BOMBA DE INYECCION.jpg',4,2,''),(200,'INYECTORES','S/S',0.00,'unidad','S/M',0.00,'','8B/C2','\\src\\imgProd\\inyectores-motor-diesel-300x200.jpg',4,2,''),(201,'METALES DE MOTOBOMBA','S/S',0.00,'unidad','S/M',0.00,'','8B/C2','\\src\\imgProd\\METALES.jpg',4,2,''),(202,'SELLOS DE MOTOBOMBA','S/S',0.00,'unidad','S/M',0.00,'','8B/C2','\\src\\imgProd\\Sello_Mecanico_WP20X.jpg',4,2,''),(203,'CERRADURA BLINDADA 300','7753960000650',0.00,'unidad','300',0.00,'','9A','\\src\\imgProd\\CERRADURA 300.jpg',66,29,''),(204,'DISCO DE ACERO 230x6x22.3','4038898435723',0.00,'unidad','A 24 P5 BF',0.00,'','9A','\\src\\imgProd\\DISCO1.jpg',12,17,''),(205,'DISCO DE CORTE DE ACERO 180x3.0x22.2','7754127000117',0.00,'unidad','180x3.0x22.2',0.00,'','9A','\\src\\imgProd\\DISCO1.jpg',12,17,''),(206,'DISCO DE CORTE DE METAL 180x1.6x22.23','028877519081',0.00,'unidad','T411',0.00,'','9A','\\src\\imgProd\\DISCO2.jpg',67,17,''),(207,'DISCO DE CORTE DE METAL 180x1.6x22.23 3M','S/S',0.00,'unidad','A 60T-BF',0.00,'','9A','\\src\\imgProd\\DISCO3.jpg',14,17,''),(208,'DISCO DE ACERO INOXIDABLE 115x1.0x22.23','4053479368269',0.00,'unidad','S/M',0.00,'','9A','\\src\\imgProd\\DISCO4.jpg',12,17,''),(209,'DISCO DE ACERO INOXIDABLE 180x1.8x22.23mm','4053479368368',0.00,'unidad','S/M',0.00,'','9A','\\src\\imgProd\\DISCO5.jpg',12,17,''),(210,'DISCO DE DESBASTE 179x6x22mm','051111610558',0.00,'unidad','S/M',0.00,'','9A','\\src\\imgProd\\DISCO6.jpg',14,17,''),(211,'ABRAZADERA 90-110 W2','S/S',0.00,'unidad','90-110 W2',0.00,'','9A','\\src\\imgProd\\ABRAZADERA 90.jpg',14,17,''),(212,'ABRAZADERA 86-91 W1','S/S',0.00,'unidad','86-91 W1',0.00,'','9A','\\src\\imgProd\\ABRAZADERA 86.jpg',4,17,''),(213,'SOLDADURA BLANCA','S/S',0.00,'unidad','5SI',0.00,'','9B','\\src\\imgProd\\SOLD BLANCA.jpg',4,17,''),(214,'ELECTRODOS P/SOLDADURA STANDARD','S/S',0.00,'unidad','AWSE 7018',0.00,'','9B','\\src\\imgProd\\ELECTRODO.jpg',68,17,''),(215,'VIDRIO PARA SOLDAR','7754235002126',0.00,'unidad','S/M',0.00,'','9B','\\src\\imgProd\\VIDRIOPSOLD.jpg',4,17,''),(216,'TIZA PARA METAL','2000001391518',0.00,'unidad','S/M',0.00,'','9B','\\src\\imgProd\\TIZAPM.jpg',62,17,''),(217,'REPUESTO VISOR CLARO','2000000492711',0.00,'unidad','S/M',0.00,'','9B','\\src\\imgProd\\VISORC.jpg',4,17,''),(218,'CASCO PROTECTOR DE SOLDADURA','4046777457872',0.00,'unidad','S/M',0.00,'','9B','\\src\\imgProd\\CASCOSOLD.jpg',12,17,''),(219,'LIMPIA CORDONES DE SOLDADURA','7751371005615',0.00,'unidad','AA41-Z-60',0.00,'','9B','\\src\\imgProd\\LIMPIA CORDONES.jpg',69,17,''),(220,'LIMPIA CORDONES DE SOLDADURA WURTH','4011231722773',0.00,'unidad','S/M',0.00,'','9B','\\src\\imgProd\\LIMPIA CORDONES.jpg',12,17,''),(221,'MONOGAFA CON VISOR','7756155000152',0.00,'unidad','S/M',0.00,'','9B','\\src\\imgProd\\MONOGAFA.jpg',5,17,''),(222,'VALVULA 600W0G','S/S',0.00,'unidad','S/M',0.00,'','9C','\\src\\imgProd\\VALVULA 1.jpg',70,30,''),(223,'VALVULA 4\' PN400','S/S',0.00,'unidad','4\' PN400',0.00,'','9C','\\src\\imgProd\\VALVULA 2.jpg',4,30,''),(224,'VALVULA 1/2 P40','S/S',0.00,'unidad','1/2 P40',0.00,'','9C','\\src\\imgProd\\VALVULA 3.jpg',4,30,''),(225,'VALVULA EV 200','S/S',0.00,'unidad','EV 200',0.00,'','9C','\\src\\imgProd\\VALVULA 4.jpg',4,30,''),(226,'RETEN DE MOTOBOMBA','S/S',0.00,'unidad','S/M',0.00,'','8B/C2','\\src\\imgProd\\RETEN.jpg',4,2,''),(227,'PLOMOS 35gr','S/S',0.00,'unidad','S/M',0.00,'','8C/C1','\\src\\imgProd\\PLOMO35.jpg',4,2,''),(228,'PLOMOS PARA ARO AW 28gr','S/S',0.00,'unidad','S/M',0.00,'','8C/C1','\\src\\imgProd\\PLOMO.jpg',71,2,''),(229,'PLOMOS PARA ARO AW 43 gr','S/S',0.00,'unidad','S/M',0.00,'','8C/C1','\\src\\imgProd\\PLOMO.jpg',71,2,''),(230,'PLOMOS PARA ARO AW 21 gr','S/S',0.00,'unidad','S/M',0.00,'','8C/C1','\\src\\imgProd\\PLOMO.jpg',71,2,''),(231,'PLOMOS PARA ARO AW 14 gr','S/S',0.00,'unidad','S/M',0.00,'','8C/C1','\\src\\imgProd\\PLOMO.jpg',71,2,''),(232,'PLOMOS PARA ARO AW 1/4','S/S',0.00,'unidad','S/M',0.00,'','8C/C1','\\src\\imgProd\\PLOMO.jpg',71,2,''),(233,'PLOMOS PARA ARO AW 26 gr','S/S',0.00,'unidad','S/M',0.00,'','8C/C1','\\src\\imgProd\\PLOMO.jpg',71,2,''),(234,'PLOMOS PARA ARO ILL 1/4 OZ','S/S',0.00,'unidad','S/M',0.00,'','8C/C1','\\src\\imgProd\\PLOMOILL.jpg',72,2,''),(235,'PLOMOS PARA ARO 1.0 ILL 28G','S/S',0.00,'unidad','S/M',0.00,'','8C/C1','\\src\\imgProd\\ILL 28.jpg',72,2,''),(236,'GANCHOS PARA ETERNIT','S/S',0.00,'unidad','S/M',0.00,'','8C/C2','\\src\\imgProd\\GNCHOETERNIT.jpg',4,28,''),(237,'MANGUERA DE AIRE','S/S',0.00,'unidad','S/M',0.00,'','8C/C3','\\src\\imgProd\\MANGUERA.jpg',4,28,''),(238,'PREOSTATO PARA COMPRESORA','S/S',0.00,'unidad','CW2105',0.00,'','8C/C3','\\src\\imgProd\\PRESOSTATO.jpg',73,2,''),(239,'PINTURA DE COMPONENTES AMARILLO','3150320001010161746',0.00,'galones','TTP-115-F-II',0.00,'','8D','\\src\\imgProd\\jet.png',49,31,''),(240,'CATALIZADOR AUROMASTIC','8185000101',0.00,'galones','S/M',0.00,'','8D','\\src\\imgProd\\AURORA.jpg',74,31,''),(241,'ESMALTE SINTETICO VERDE','4801440101010149445',0.00,'galones','S/M',0.00,'','8D','\\src\\imgProd\\EMALTE VENC.jpg',75,31,''),(242,'LATEX BASE PROFUNDO TEKNOLATEX','7752835031089',0.00,'galones','S/M',0.00,'','8D','\\src\\imgProd\\teknolatex.png',76,31,''),(243,'LATEX BASE PASTEL TEKNOLATEX','1091988A41010099947',0.00,'galones','S/M',0.00,'','8D','\\src\\imgProd\\teknolatex.png',76,31,''),(244,'PINTURA DURALATEX CREMA','7752835001242',0.00,'galones','S/M',0.00,'','8D','\\src\\imgProd\\DURALATEX.jpg',77,31,''),(245,'PINTURA DURALATEX BLANCO','7752835001143',0.00,'galones','S/M',0.00,'','8D','\\src\\imgProd\\DURALATEX.jpg',77,31,''),(246,'PINTURA LATEX PREMIUM','2000001751428',0.00,'galones','S/M',0.00,'','8D','\\src\\imgProd\\KOLOR.jpg',78,31,''),(247,'PINTURA UNDERCOATING','S/S',0.00,'galones','S/M',0.00,'','8D','\\src\\imgProd\\AÑORGA.jpg',79,31,''),(248,'SELLADOR TIPO PINTURA','7750278007418',0.00,'galones','S/M',0.00,'','8D','\\src\\imgProd\\CHEMA.jpg',80,31,''),(249,'PINTURA ANDINA TRAFICO TTP-115-F TIPO II','S/S',0.00,'galones','S/M',0.00,'','8D','\\src\\imgProd\\ANDINA.jpg',81,31,''),(250,'PISTOLA AEROGRAFICA PARA PINTURA','2000000641850',0.00,'galones','S/M',0.00,'','8D','\\src\\imgProd\\PISTOLA AEROGRAFICA.jpg',41,31,''),(251,'DILUYENTE PARA TRAFICO TTP 115','7750741001493',0.00,'galones','TTP 115',0.00,'','8D','\\src\\imgProd\\BONN.jpg',82,31,''),(252,'PROTECTOR CHEMMI GLOSS BLANCO','7754361000249',0.00,'galones','S/M',0.00,'','8D','\\src\\imgProd\\GLOSS.jpg',83,31,''),(253,'VO 24426721','V24426721',0.00,'galones','S/M',0.00,'','3B/C1','\\src\\imgProd\\VO24426721.jpg',1,32,''),(254,'TUERCA VO 990940','V990940',0.00,'galones','S/M',0.00,'','3B/C1','\\src\\imgProd\\V990940.jpg',1,32,''),(255,'RELE VO 21244697','V21244697',0.00,'unidad','S/M',0.00,'','3B/C1','\\src\\imgProd\\V21244697.jpg',1,32,''),(256,'VO 3092446','V3092446',0.00,'unidad','S/M',0.00,'','3B/C1','\\src\\imgProd\\V3092446.jpg',1,32,''),(257,'VO 21138357','V21138357',0.00,'unidad','S/M',0.00,'','3B/C1','\\src\\imgProd\\V21138357.jpeg',1,32,''),(258,'VO 20883450','V20883450',0.00,'unidad','S/M',0.00,'','3B/C1','\\src\\imgProd\\V20883450.jpeg',1,32,''),(259,'VO 21017200','V21017200',0.00,'unidad','S/M',0.00,'','3B/C1','\\src\\imgProd\\v21017200.jpg',1,32,''),(260,'TUERCA HEXAGONAL VO 990971','V990971',0.00,'unidad','S/M',0.00,'','3B/C1','\\src\\imgProd\\V990971.JPG',1,32,''),(261,'VO 20736100','V20736100',0.00,'unidad','S/M',0.00,'','3B/C3','\\src\\imgProd\\V20736100.JPG',1,32,''),(262,'CONEXION MANGUERA VO 8189388','V8189388',0.00,'unidad','S/M',0.00,'','3B/C3','\\src\\imgProd\\V8189388.JPG',1,32,''),(263,'SELLADOR DE CABLE VO 25325008','V25325008',0.00,'unidad','S/M',0.00,'','3B/C3','\\src\\imgProd\\V25325008.jpg',1,32,''),(264,'VO 20710525','V20710525',0.00,'unidad','S/M',0.00,'','3A','\\src\\imgProd\\V20710525.jpg',1,32,''),(265,'VO 82358216','V82358216',0.00,'unidad','S/M',0.00,'','3A','\\src\\imgProd\\V82358216.jpg',1,32,''),(266,'VO 22938285','V22938285',0.00,'unidad','S/M',0.00,'','3A','\\src\\imgProd\\V22938285.jpg',1,32,''),(267,'FILTRO HONDA 1722','S/S',0.00,'unidad','RZA-000',0.00,'','3A','\\src\\imgProd\\HONDA 17220.jpg',2,32,''),(268,'VO 22566514','V22566514',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V22566514.jpg',1,32,''),(269,'VO 21021925','V21021925',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V21021925.jpg',1,32,''),(270,'VO 21634017','V21634017',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V21634017.jpg',1,32,''),(271,'JUNTA VO 21392402','V21392402',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V21392402.jpg',1,32,''),(272,'RELE VO 21255974','V21255974',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V21255974.jpg',1,32,''),(273,'RACOR VO 982397','V982397',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V982397.jpg',1,32,''),(274,'TORNILLO EMBRIADO VO 984756','V984756',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V984756.JPG',1,32,''),(275,'CONEXION ELECTRICA VO 20840631','V20840631',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V20840631.jpg',1,32,''),(276,'MANGUERA VO 20592715','V20592715',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V20592715.jpg',1,32,''),(277,'ADAPTADOR VO 3985598','V3985598',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V3985598.jpg',1,32,''),(278,'ANILLO VO 949647','V949647',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V949647.jpg',1,32,''),(279,'VO 1547254','V1547254',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V1547254.jpg',1,32,''),(280,'PIN VO 8150740','V8150740',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V8150740.jpg',1,32,''),(281,'PASADOR VO 8150742','V8150742',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V8150742.jpg',1,32,''),(282,'CONEXION RAPIDA VO 21177275','V21177275',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V21177275.jpg',1,32,''),(283,'TORNILLO VO 1076336','V1076336',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V1076336.jpg',1,32,''),(284,'VO 984745','V984745',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V984745.jpg',1,32,''),(285,'VO 275-9883','V275-9883',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V275-9883.jpg',1,32,''),(286,'VO 1629630','V1629630',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V1629630.jpg',1,32,''),(287,'TORNILLO HEXAGONO VO 979946','V979946',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V979946.jpg',1,32,''),(288,'VO 984886','V984886',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V984886.jpg',1,32,''),(289,'VO 990941','V990941',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V990941.jpg',1,32,''),(290,'VO 990951','V990951',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V990951.jpg',1,32,''),(291,'MANGUITO DISTANCIA VO 846339','V846339',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V846339.jpg',1,32,''),(292,'VO 947624','V947624',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V947624.jpg',1,32,''),(293,'VO 8171700','V8171700',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V8171700.jpg',1,32,''),(294,'TUERCA HEXAGONAL VO 1075914','V1075914',0.00,'unidad','S/M',0.00,'','3B/C2','\\src\\imgProd\\V1075914.jpg',1,32,''),(295,'MOTOR DE ARRANQUE VO 22602940','V22602940',0.00,'unidad','S/M',0.00,'','3C','\\src\\imgProd\\V22602940.jpg',1,32,''),(296,'CINTURON DE SEGURIDAD VO 82206512','V82206512',0.00,'unidad','S/M',0.00,'','3A','\\src\\imgProd\\V82206512.jpg',1,32,''),(297,'ABRAZADERA VO 1629499','V1629499',0.00,'unidad','S/M',0.00,'','3C','\\src\\imgProd\\V1629499.jpg',1,32,''),(298,'RESORTE PROGRESIVO VO 1028449','V1028449',0.00,'unidad','S/M',0.00,'','3C','\\src\\imgProd\\V1028449.jpg',1,32,''),(299,'PERFIL VO 1619160','V1619160',0.00,'unidad','S/M',0.00,'','3C','\\src\\imgProd\\V1619160.jpg',1,32,''),(300,'RETEN VO 822767','V822767',0.00,'unidad','S/M',0.00,'','3B/C3','',1,32,''),(301,'KIT REPARACION VO 3092575','V3092575',0.00,'unidad','S/M',0.00,'','3C','\\src\\imgProd\\V3092575.jpg',1,32,''),(302,'VO 3987066','V3987066',0.00,'unidad','S/M',0.00,'','3C','\\src\\imgProd\\V3987066.jpg',1,32,''),(303,'VALVULA RELE VO 21740038','V21740038',0.00,'unidad','S/M',0.00,'','3B/C4','\\src\\imgProd\\V21740038.JPG',1,32,''),(304,'VO 85108700','V85108700',0.00,'unidad','S/M',0.00,'','3B/C4','\\src\\imgProd\\V85108700.jpg',1,32,''),(305,'JUEGO DE JUNTAS VO 21219942','V21219942',0.00,'unidad','S/M',0.00,'','3B/C4','\\src\\imgProd\\V21219942.jpg',1,32,''),(306,'VO 20532891','V20532891',0.00,'unidad','S/M',0.00,'','3B/C4','\\src\\imgProd\\V20532891.jpg',1,32,''),(307,'VO 3987067','V3987067',0.00,'unidad','S/M',0.00,'','3B/C4','\\src\\imgProd\\V3987066.jpg',1,32,''),(308,'LISTON GUIA VO 3980678','V3980678',0.00,'unidad','S/M',0.00,'','3B/C4','\\src\\imgProd\\V3980678.JPG',1,32,''),(309,'VO 8171928','V8171928',0.00,'unidad','S/M',0.00,'','3B/C4','',1,32,''),(310,'VO 22994134','V22994134',0.00,'unidad','S/M',0.00,'','3B/C4','\\src\\imgProd\\V22994134.jpg',1,32,''),(311,'VO 20533294','V20533294',0.00,'unidad','S/M',0.00,'','3B/C4','\\src\\imgProd\\V20533294.jpg',1,32,''),(312,'MOTOR 65A 12V','S/S',0.00,'unidad','S/M',0.00,'','3C','\\src\\imgProd\\MOTOR 65A 12V.jpg',1,32,''),(313,'FILTRO DE ACEITE HONDA','15400\'PLM\'A01',0.00,'unidad','S/M',0.00,'','3A','\\src\\imgProd\\FILTRO DE ACEITE HONDA.jpg',2,32,''),(314,'RETEN DIXVAL ORING','S/S',0.00,'unidad','0030',0.00,'','3B/C3','\\src\\imgProd\\ORING DIXVAL.jpg',1,32,''),(315,'FILTRO A CAT 7W-2326','S/S',0.00,'unidad','7W-2326',0.00,'','3E/C5','\\src\\imgProd\\FILTER A CAT.jpg',84,33,''),(316,'FILTRO COMBUSTIBLE','503103529',0.00,'unidad','S/M',0.00,'','3B','\\src\\imgProd\\FILTRO COMBUSTIBLE IVECO.jpg',85,33,''),(317,'LAMPARA VO 20826213','V20826213',0.00,'unidad','S/M',0.00,'','3B','\\src\\imgProd\\V20826213.jpg',1,32,''),(318,'LAMPARA VO 20826211','V20826211',0.00,'unidad','S/M',0.00,'','3B','\\src\\imgProd\\V20826211.jpg',1,32,''),(319,'FILTRO CNH INDUSTRIAL','2994048',0.00,'unidad','S/M',0.00,'','3B','\\src\\imgProd\\FILTRO CNH.jpg',86,32,''),(320,'VO 06031034','V06031034',0.00,'unidad','S/M',0.00,'','3D','\\src\\imgProd\\V06031034.jpg',1,32,'');
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
  CONSTRAINT `fk_Producto_Almacen_Producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_almacen`
--

LOCK TABLES `producto_almacen` WRITE;
/*!40000 ALTER TABLE `producto_almacen` DISABLE KEYS */;
INSERT INTO `producto_almacen` VALUES (1,1,0.00,NULL),(1,2,0.00,NULL),(1,3,0.00,NULL),(2,1,0.00,NULL),(2,2,0.00,NULL),(2,3,0.00,NULL),(3,1,0.00,NULL),(3,2,0.00,NULL),(3,3,0.00,NULL),(4,1,0.00,NULL),(4,2,0.00,NULL),(4,3,0.00,NULL),(5,1,0.00,NULL),(5,2,0.00,NULL),(5,3,0.00,NULL),(6,1,0.00,NULL),(6,2,0.00,NULL),(6,3,0.00,NULL),(7,1,0.00,NULL),(7,2,0.00,NULL),(7,3,0.00,NULL),(8,1,0.00,NULL),(8,2,0.00,NULL),(8,3,0.00,NULL),(9,1,0.00,NULL),(9,2,0.00,NULL),(9,3,0.00,NULL),(10,1,0.00,NULL),(10,2,0.00,NULL),(10,3,0.00,NULL),(11,1,0.00,NULL),(11,2,0.00,NULL),(11,3,0.00,NULL),(12,1,0.00,NULL),(12,2,0.00,NULL),(12,3,0.00,NULL),(13,1,0.00,NULL),(13,2,0.00,NULL),(13,3,0.00,NULL),(14,1,0.00,NULL),(14,2,0.00,NULL),(14,3,0.00,NULL),(15,1,0.00,NULL),(15,2,0.00,NULL),(15,3,0.00,NULL),(16,1,0.00,NULL),(16,2,0.00,NULL),(16,3,0.00,NULL),(17,1,0.00,NULL),(17,2,0.00,NULL),(17,3,0.00,NULL),(18,1,0.00,NULL),(18,2,0.00,NULL),(18,3,0.00,NULL),(19,1,0.00,NULL),(19,2,0.00,NULL),(19,3,0.00,NULL),(20,1,0.00,NULL),(20,2,0.00,NULL),(20,3,0.00,NULL),(21,1,0.00,NULL),(21,2,0.00,NULL),(21,3,0.00,NULL),(22,1,0.00,NULL),(22,2,0.00,NULL),(22,3,0.00,NULL),(23,1,0.00,NULL),(23,2,0.00,NULL),(23,3,0.00,NULL),(24,1,0.00,NULL),(24,2,0.00,NULL),(24,3,0.00,NULL),(25,1,0.00,NULL),(25,2,0.00,NULL),(25,3,0.00,NULL),(26,1,0.00,NULL),(26,2,0.00,NULL),(26,3,0.00,NULL),(27,1,0.00,NULL),(27,2,0.00,NULL),(27,3,0.00,NULL),(28,1,0.00,NULL),(28,2,0.00,NULL),(28,3,0.00,NULL),(29,1,0.00,NULL),(29,2,0.00,NULL),(29,3,0.00,NULL),(30,1,0.00,NULL),(30,2,0.00,NULL),(30,3,0.00,NULL),(31,1,0.00,NULL),(31,2,0.00,NULL),(31,3,0.00,NULL),(32,1,0.00,NULL),(32,2,0.00,NULL),(32,3,0.00,NULL),(33,1,0.00,NULL),(33,2,0.00,NULL),(33,3,0.00,NULL),(34,1,0.00,NULL),(34,2,0.00,NULL),(34,3,0.00,NULL),(35,1,0.00,NULL),(35,2,0.00,NULL),(35,3,0.00,NULL),(36,1,0.00,NULL),(36,2,0.00,NULL),(36,3,0.00,NULL),(37,1,0.00,NULL),(37,2,0.00,NULL),(37,3,0.00,NULL),(38,1,0.00,NULL),(38,2,0.00,NULL),(38,3,0.00,NULL),(39,1,0.00,NULL),(39,2,0.00,NULL),(39,3,0.00,NULL),(40,1,0.00,NULL),(40,2,0.00,NULL),(40,3,0.00,NULL),(41,1,0.00,NULL),(41,2,0.00,NULL),(41,3,0.00,NULL),(42,1,0.00,NULL),(42,2,0.00,NULL),(42,3,0.00,NULL),(43,1,0.00,NULL),(43,2,0.00,NULL),(43,3,0.00,NULL),(44,1,0.00,NULL),(44,2,0.00,NULL),(44,3,0.00,NULL),(45,1,0.00,NULL),(45,2,0.00,NULL),(45,3,0.00,NULL),(46,1,0.00,NULL),(46,2,0.00,NULL),(46,3,0.00,NULL),(47,1,0.00,NULL),(47,2,0.00,NULL),(47,3,0.00,NULL),(48,1,0.00,NULL),(48,2,0.00,NULL),(48,3,0.00,NULL),(49,1,0.00,NULL),(49,2,0.00,NULL),(49,3,0.00,NULL),(50,1,0.00,NULL),(50,2,0.00,NULL),(50,3,0.00,NULL),(51,1,0.00,NULL),(51,2,0.00,NULL),(51,3,0.00,NULL),(52,1,0.00,NULL),(52,2,0.00,NULL),(52,3,0.00,NULL),(53,1,0.00,NULL),(53,2,0.00,NULL),(53,3,0.00,NULL),(54,1,0.00,NULL),(54,2,0.00,NULL),(54,3,0.00,NULL),(55,1,0.00,NULL),(55,2,0.00,NULL),(55,3,0.00,NULL),(56,1,0.00,NULL),(56,2,0.00,NULL),(56,3,0.00,NULL),(57,1,0.00,NULL),(57,2,0.00,NULL),(57,3,0.00,NULL),(58,1,0.00,NULL),(58,2,0.00,NULL),(58,3,0.00,NULL),(59,1,0.00,NULL),(59,2,0.00,NULL),(59,3,0.00,NULL),(60,1,0.00,NULL),(60,2,0.00,NULL),(60,3,0.00,NULL),(61,1,0.00,NULL),(61,2,0.00,NULL),(61,3,0.00,NULL),(62,1,0.00,NULL),(62,2,0.00,NULL),(62,3,0.00,NULL),(63,1,0.00,NULL),(63,2,0.00,NULL),(63,3,0.00,NULL),(64,1,0.00,NULL),(64,2,0.00,NULL),(64,3,0.00,NULL),(65,1,0.00,NULL),(65,2,0.00,NULL),(65,3,0.00,NULL),(66,1,0.00,NULL),(66,2,0.00,NULL),(66,3,0.00,NULL),(67,1,0.00,NULL),(67,2,0.00,NULL),(67,3,0.00,NULL),(68,1,0.00,NULL),(68,2,0.00,NULL),(68,3,0.00,NULL),(69,1,0.00,NULL),(69,2,0.00,NULL),(69,3,0.00,NULL),(70,1,0.00,NULL),(70,2,0.00,NULL),(70,3,0.00,NULL),(71,1,0.00,NULL),(71,2,0.00,NULL),(71,3,0.00,NULL),(72,1,0.00,NULL),(72,2,0.00,NULL),(72,3,0.00,NULL),(73,1,0.00,NULL),(73,2,0.00,NULL),(73,3,0.00,NULL),(74,1,0.00,NULL),(74,2,0.00,NULL),(74,3,0.00,NULL),(75,1,0.00,NULL),(75,2,0.00,NULL),(75,3,0.00,NULL),(76,1,0.00,NULL),(76,2,0.00,NULL),(76,3,0.00,NULL),(77,1,0.00,NULL),(77,2,0.00,NULL),(77,3,0.00,NULL),(78,1,0.00,NULL),(78,2,0.00,NULL),(78,3,0.00,NULL),(79,1,0.00,NULL),(79,2,0.00,NULL),(79,3,0.00,NULL),(80,1,0.00,NULL),(80,2,0.00,NULL),(80,3,0.00,NULL),(81,1,0.00,NULL),(81,2,0.00,NULL),(81,3,0.00,NULL),(82,1,0.00,NULL),(82,2,0.00,NULL),(82,3,0.00,NULL),(83,1,0.00,NULL),(83,2,0.00,NULL),(83,3,0.00,NULL),(84,1,0.00,NULL),(84,2,0.00,NULL),(84,3,0.00,NULL),(85,1,0.00,NULL),(85,2,0.00,NULL),(85,3,0.00,NULL),(86,1,0.00,NULL),(86,2,0.00,NULL),(86,3,0.00,NULL),(87,1,0.00,NULL),(87,2,0.00,NULL),(87,3,0.00,NULL),(88,1,0.00,NULL),(88,2,0.00,NULL),(88,3,0.00,NULL),(89,1,0.00,NULL),(89,2,0.00,NULL),(89,3,0.00,NULL),(90,1,0.00,NULL),(90,2,0.00,NULL),(90,3,0.00,NULL),(91,1,0.00,NULL),(91,2,0.00,NULL),(91,3,0.00,NULL),(92,1,0.00,NULL),(92,2,0.00,NULL),(92,3,0.00,NULL),(93,1,0.00,NULL),(93,2,0.00,NULL),(93,3,0.00,NULL),(94,1,0.00,NULL),(94,2,0.00,NULL),(94,3,0.00,NULL),(95,1,0.00,NULL),(95,2,0.00,NULL),(95,3,0.00,NULL),(96,1,0.00,NULL),(96,2,0.00,NULL),(96,3,0.00,NULL),(97,1,0.00,NULL),(97,2,0.00,NULL),(97,3,0.00,NULL),(98,1,0.00,NULL),(98,2,0.00,NULL),(98,3,0.00,NULL),(99,1,0.00,NULL),(99,2,0.00,NULL),(99,3,0.00,NULL),(100,1,0.00,NULL),(100,2,0.00,NULL),(100,3,0.00,NULL),(101,1,0.00,NULL),(101,2,0.00,NULL),(101,3,0.00,NULL),(102,1,0.00,NULL),(102,2,0.00,NULL),(102,3,0.00,NULL),(103,1,0.00,NULL),(103,2,0.00,NULL),(103,3,0.00,NULL),(104,1,0.00,NULL),(104,2,0.00,NULL),(104,3,0.00,NULL),(105,1,0.00,NULL),(105,2,0.00,NULL),(105,3,0.00,NULL),(106,1,0.00,NULL),(106,2,0.00,NULL),(106,3,0.00,NULL),(107,1,0.00,NULL),(107,2,0.00,NULL),(107,3,0.00,NULL),(108,1,0.00,NULL),(108,2,0.00,NULL),(108,3,0.00,NULL),(109,1,0.00,NULL),(109,2,0.00,NULL),(109,3,0.00,NULL),(110,1,0.00,NULL),(110,2,0.00,NULL),(110,3,0.00,NULL),(111,1,0.00,NULL),(111,2,0.00,NULL),(111,3,0.00,NULL),(112,1,0.00,NULL),(112,2,0.00,NULL),(112,3,0.00,NULL),(113,1,0.00,NULL),(113,2,0.00,NULL),(113,3,0.00,NULL),(114,1,0.00,NULL),(114,2,0.00,NULL),(114,3,0.00,NULL),(115,1,0.00,NULL),(115,2,0.00,NULL),(115,3,0.00,NULL),(116,1,0.00,NULL),(116,2,0.00,NULL),(116,3,0.00,NULL),(117,1,0.00,NULL),(117,2,0.00,NULL),(117,3,0.00,NULL),(118,1,0.00,NULL),(118,2,0.00,NULL),(118,3,0.00,NULL),(119,1,0.00,NULL),(119,2,0.00,NULL),(119,3,0.00,NULL),(120,1,0.00,NULL),(120,2,0.00,NULL),(120,3,0.00,NULL),(121,1,0.00,NULL),(121,2,0.00,NULL),(121,3,0.00,NULL),(122,1,0.00,NULL),(122,2,0.00,NULL),(122,3,0.00,NULL),(123,1,0.00,NULL),(123,2,0.00,NULL),(123,3,0.00,NULL),(124,1,0.00,NULL),(124,2,0.00,NULL),(124,3,0.00,NULL),(125,1,0.00,NULL),(125,2,0.00,NULL),(125,3,0.00,NULL),(126,1,0.00,NULL),(126,2,0.00,NULL),(126,3,0.00,NULL),(127,1,0.00,NULL),(127,2,0.00,NULL),(127,3,0.00,NULL),(128,1,0.00,NULL),(128,2,0.00,NULL),(128,3,0.00,NULL),(129,1,0.00,NULL),(129,2,0.00,NULL),(129,3,0.00,NULL),(130,1,0.00,NULL),(130,2,0.00,NULL),(130,3,0.00,NULL),(131,1,0.00,NULL),(131,2,0.00,NULL),(131,3,0.00,NULL),(132,1,0.00,NULL),(132,2,0.00,NULL),(132,3,0.00,NULL),(133,1,0.00,NULL),(133,2,0.00,NULL),(133,3,0.00,NULL),(134,1,0.00,NULL),(134,2,0.00,NULL),(134,3,0.00,NULL),(135,1,0.00,NULL),(135,2,0.00,NULL),(135,3,0.00,NULL),(136,1,0.00,NULL),(136,2,0.00,NULL),(136,3,0.00,NULL),(137,1,0.00,NULL),(137,2,0.00,NULL),(137,3,0.00,NULL),(138,1,0.00,NULL),(138,2,0.00,NULL),(138,3,0.00,NULL),(139,1,0.00,NULL),(139,2,0.00,NULL),(139,3,0.00,NULL),(140,1,0.00,NULL),(140,2,0.00,NULL),(140,3,0.00,NULL),(141,1,0.00,NULL),(141,2,0.00,NULL),(141,3,0.00,NULL),(142,1,0.00,NULL),(142,2,0.00,NULL),(142,3,0.00,NULL),(143,1,0.00,NULL),(143,2,0.00,NULL),(143,3,0.00,NULL),(144,1,0.00,NULL),(144,2,0.00,NULL),(144,3,0.00,NULL),(145,1,0.00,NULL),(145,2,0.00,NULL),(145,3,0.00,NULL),(146,1,0.00,NULL),(146,2,0.00,NULL),(146,3,0.00,NULL),(147,1,0.00,NULL),(147,2,0.00,NULL),(147,3,0.00,NULL),(148,1,0.00,NULL),(148,2,0.00,NULL),(148,3,0.00,NULL),(149,1,0.00,NULL),(149,2,0.00,NULL),(149,3,0.00,NULL),(150,1,0.00,NULL),(150,2,0.00,NULL),(150,3,0.00,NULL),(151,1,0.00,NULL),(151,2,0.00,NULL),(151,3,0.00,NULL),(152,1,0.00,NULL),(152,2,0.00,NULL),(152,3,0.00,NULL),(153,1,0.00,NULL),(153,2,0.00,NULL),(153,3,0.00,NULL),(154,1,0.00,NULL),(154,2,0.00,NULL),(154,3,0.00,NULL),(155,1,0.00,NULL),(155,2,0.00,NULL),(155,3,0.00,NULL),(156,1,0.00,NULL),(156,2,0.00,NULL),(156,3,0.00,NULL),(157,1,0.00,NULL),(157,2,0.00,NULL),(157,3,0.00,NULL),(158,1,0.00,NULL),(158,2,0.00,NULL),(158,3,0.00,NULL),(159,1,0.00,NULL),(159,2,0.00,NULL),(159,3,0.00,NULL),(160,1,0.00,NULL),(160,2,0.00,NULL),(160,3,0.00,NULL),(161,1,0.00,NULL),(161,2,0.00,NULL),(161,3,0.00,NULL),(162,1,0.00,NULL),(162,2,0.00,NULL),(162,3,0.00,NULL),(163,1,0.00,NULL),(163,2,0.00,NULL),(163,3,0.00,NULL),(164,1,0.00,NULL),(164,2,0.00,NULL),(164,3,0.00,NULL),(165,1,0.00,NULL),(165,2,0.00,NULL),(165,3,0.00,NULL),(166,1,0.00,NULL),(166,2,0.00,NULL),(166,3,0.00,NULL),(167,1,0.00,NULL),(167,2,0.00,NULL),(167,3,0.00,NULL),(168,1,0.00,NULL),(168,2,0.00,NULL),(168,3,0.00,NULL),(169,1,0.00,NULL),(169,2,0.00,NULL),(169,3,0.00,NULL),(170,1,0.00,NULL),(170,2,0.00,NULL),(170,3,0.00,NULL),(171,1,0.00,NULL),(171,2,0.00,NULL),(171,3,0.00,NULL),(172,1,0.00,NULL),(172,2,0.00,NULL),(172,3,0.00,NULL),(173,1,0.00,NULL),(173,2,0.00,NULL),(173,3,0.00,NULL),(174,1,0.00,NULL),(174,2,0.00,NULL),(174,3,0.00,NULL),(175,1,0.00,NULL),(175,2,0.00,NULL),(175,3,0.00,NULL),(176,1,0.00,NULL),(176,2,0.00,NULL),(176,3,0.00,NULL),(177,1,0.00,NULL),(177,2,0.00,NULL),(177,3,0.00,NULL),(178,1,0.00,NULL),(178,2,0.00,NULL),(178,3,0.00,NULL),(179,1,0.00,NULL),(179,2,0.00,NULL),(179,3,0.00,NULL),(180,1,0.00,NULL),(180,2,0.00,NULL),(180,3,0.00,NULL),(181,1,0.00,NULL),(181,2,0.00,NULL),(181,3,0.00,NULL),(182,1,0.00,NULL),(182,2,0.00,NULL),(182,3,0.00,NULL),(183,1,0.00,NULL),(183,2,0.00,NULL),(183,3,0.00,NULL),(184,1,0.00,NULL),(184,2,0.00,NULL),(184,3,0.00,NULL),(185,1,0.00,NULL),(185,2,0.00,NULL),(185,3,0.00,NULL),(186,1,0.00,NULL),(186,2,0.00,NULL),(186,3,0.00,NULL),(187,1,0.00,NULL),(187,2,0.00,NULL),(187,3,0.00,NULL),(188,1,0.00,NULL),(188,2,0.00,NULL),(188,3,0.00,NULL),(189,1,0.00,NULL),(189,2,0.00,NULL),(189,3,0.00,NULL),(190,1,0.00,NULL),(190,2,0.00,NULL),(190,3,0.00,NULL),(191,1,0.00,NULL),(191,2,0.00,NULL),(191,3,0.00,NULL),(192,1,0.00,NULL),(192,2,0.00,NULL),(192,3,0.00,NULL),(193,1,0.00,NULL),(193,2,0.00,NULL),(193,3,0.00,NULL),(194,1,0.00,NULL),(194,2,0.00,NULL),(194,3,0.00,NULL),(195,1,0.00,NULL),(195,2,0.00,NULL),(195,3,0.00,NULL),(196,1,0.00,NULL),(196,2,0.00,NULL),(196,3,0.00,NULL),(197,1,0.00,NULL),(197,2,0.00,NULL),(197,3,0.00,NULL),(198,1,0.00,NULL),(198,2,0.00,NULL),(198,3,0.00,NULL),(199,1,0.00,NULL),(199,2,0.00,NULL),(199,3,0.00,NULL),(200,1,0.00,NULL),(200,2,0.00,NULL),(200,3,0.00,NULL),(201,1,0.00,NULL),(201,2,0.00,NULL),(201,3,0.00,NULL),(202,1,0.00,NULL),(202,2,0.00,NULL),(202,3,0.00,NULL),(203,1,0.00,NULL),(203,2,0.00,NULL),(203,3,0.00,NULL),(204,1,0.00,NULL),(204,2,0.00,NULL),(204,3,0.00,NULL),(205,1,0.00,NULL),(205,2,0.00,NULL),(205,3,0.00,NULL),(206,1,0.00,NULL),(206,2,0.00,NULL),(206,3,0.00,NULL),(207,1,0.00,NULL),(207,2,0.00,NULL),(207,3,0.00,NULL),(208,1,0.00,NULL),(208,2,0.00,NULL),(208,3,0.00,NULL),(209,1,0.00,NULL),(209,2,0.00,NULL),(209,3,0.00,NULL),(210,1,0.00,NULL),(210,2,0.00,NULL),(210,3,0.00,NULL),(211,1,0.00,NULL),(211,2,0.00,NULL),(211,3,0.00,NULL),(212,1,0.00,NULL),(212,2,0.00,NULL),(212,3,0.00,NULL),(213,1,0.00,NULL),(213,2,0.00,NULL),(213,3,0.00,NULL),(214,1,0.00,NULL),(214,2,0.00,NULL),(214,3,0.00,NULL),(215,1,0.00,NULL),(215,2,0.00,NULL),(215,3,0.00,NULL),(216,1,0.00,NULL),(216,2,0.00,NULL),(216,3,0.00,NULL),(217,1,0.00,NULL),(217,2,0.00,NULL),(217,3,0.00,NULL),(218,1,0.00,NULL),(218,2,0.00,NULL),(218,3,0.00,NULL),(219,1,0.00,NULL),(219,2,0.00,NULL),(219,3,0.00,NULL),(220,1,0.00,NULL),(220,2,0.00,NULL),(220,3,0.00,NULL),(221,1,0.00,NULL),(221,2,0.00,NULL),(221,3,0.00,NULL),(222,1,0.00,NULL),(222,2,0.00,NULL),(222,3,0.00,NULL),(223,1,0.00,NULL),(223,2,0.00,NULL),(223,3,0.00,NULL),(224,1,0.00,NULL),(224,2,0.00,NULL),(224,3,0.00,NULL),(225,1,0.00,NULL),(225,2,0.00,NULL),(225,3,0.00,NULL),(226,1,0.00,NULL),(226,2,0.00,NULL),(226,3,0.00,NULL),(227,1,0.00,NULL),(227,2,0.00,NULL),(227,3,0.00,NULL),(228,1,0.00,NULL),(228,2,0.00,NULL),(228,3,0.00,NULL),(229,1,0.00,NULL),(229,2,0.00,NULL),(229,3,0.00,NULL),(230,1,0.00,NULL),(230,2,0.00,NULL),(230,3,0.00,NULL),(231,1,0.00,NULL),(231,2,0.00,NULL),(231,3,0.00,NULL),(232,1,0.00,NULL),(232,2,0.00,NULL),(232,3,0.00,NULL),(233,1,0.00,NULL),(233,2,0.00,NULL),(233,3,0.00,NULL),(234,1,0.00,NULL),(234,2,0.00,NULL),(234,3,0.00,NULL),(235,1,0.00,NULL),(235,2,0.00,NULL),(235,3,0.00,NULL),(236,1,0.00,NULL),(236,2,0.00,NULL),(236,3,0.00,NULL),(237,1,0.00,NULL),(237,2,0.00,NULL),(237,3,0.00,NULL),(238,1,0.00,NULL),(238,2,0.00,NULL),(238,3,0.00,NULL),(239,1,0.00,NULL),(239,2,0.00,NULL),(239,3,0.00,NULL),(240,1,0.00,NULL),(240,2,0.00,NULL),(240,3,0.00,NULL),(241,1,0.00,NULL),(241,2,0.00,NULL),(241,3,0.00,NULL),(242,1,0.00,NULL),(242,2,0.00,NULL),(242,3,0.00,NULL),(243,1,0.00,NULL),(243,2,0.00,NULL),(243,3,0.00,NULL),(244,1,0.00,NULL),(244,2,0.00,NULL),(244,3,0.00,NULL),(245,1,0.00,NULL),(245,2,0.00,NULL),(245,3,0.00,NULL),(246,1,0.00,NULL),(246,2,0.00,NULL),(246,3,0.00,NULL),(247,1,0.00,NULL),(247,2,0.00,NULL),(247,3,0.00,NULL),(248,1,0.00,NULL),(248,2,0.00,NULL),(248,3,0.00,NULL),(249,1,0.00,NULL),(249,2,0.00,NULL),(249,3,0.00,NULL),(250,1,0.00,NULL),(250,2,0.00,NULL),(250,3,0.00,NULL),(251,1,0.00,NULL),(251,2,0.00,NULL),(251,3,0.00,NULL),(252,1,0.00,NULL),(252,2,0.00,NULL),(252,3,0.00,NULL),(253,1,0.00,NULL),(253,2,0.00,NULL),(253,3,0.00,NULL),(254,1,0.00,NULL),(254,2,0.00,NULL),(254,3,0.00,NULL),(255,1,0.00,NULL),(255,2,0.00,NULL),(255,3,0.00,NULL),(256,1,0.00,NULL),(256,2,0.00,NULL),(256,3,0.00,NULL),(257,1,0.00,NULL),(257,2,0.00,NULL),(257,3,0.00,NULL),(258,1,0.00,NULL),(258,2,0.00,NULL),(258,3,0.00,NULL),(259,1,0.00,NULL),(259,2,0.00,NULL),(259,3,0.00,NULL),(260,1,0.00,NULL),(260,2,0.00,NULL),(260,3,0.00,NULL),(261,1,0.00,NULL),(261,2,0.00,NULL),(261,3,0.00,NULL),(262,1,0.00,NULL),(262,2,0.00,NULL),(262,3,0.00,NULL),(263,1,0.00,NULL),(263,2,0.00,NULL),(263,3,0.00,NULL),(264,1,0.00,NULL),(264,2,0.00,NULL),(264,3,0.00,NULL),(265,1,0.00,NULL),(265,2,0.00,NULL),(265,3,0.00,NULL),(266,1,0.00,NULL),(266,2,0.00,NULL),(266,3,0.00,NULL),(267,1,0.00,NULL),(267,2,0.00,NULL),(267,3,0.00,NULL),(268,1,0.00,NULL),(268,2,0.00,NULL),(268,3,0.00,NULL),(269,1,0.00,NULL),(269,2,0.00,NULL),(269,3,0.00,NULL),(270,1,0.00,NULL),(270,2,0.00,NULL),(270,3,0.00,NULL),(271,1,0.00,NULL),(271,2,0.00,NULL),(271,3,0.00,NULL),(272,1,0.00,NULL),(272,2,0.00,NULL),(272,3,0.00,NULL),(273,1,0.00,NULL),(273,2,0.00,NULL),(273,3,0.00,NULL),(274,1,0.00,NULL),(274,2,0.00,NULL),(274,3,0.00,NULL),(275,1,0.00,NULL),(275,2,0.00,NULL),(275,3,0.00,NULL),(276,1,0.00,NULL),(276,2,0.00,NULL),(276,3,0.00,NULL),(277,1,0.00,NULL),(277,2,0.00,NULL),(277,3,0.00,NULL),(278,1,0.00,NULL),(278,2,0.00,NULL),(278,3,0.00,NULL),(279,1,0.00,NULL),(279,2,0.00,NULL),(279,3,0.00,NULL),(280,1,0.00,NULL),(280,2,0.00,NULL),(280,3,0.00,NULL),(281,1,0.00,NULL),(281,2,0.00,NULL),(281,3,0.00,NULL),(282,1,0.00,NULL),(282,2,0.00,NULL),(282,3,0.00,NULL),(283,1,0.00,NULL),(283,2,0.00,NULL),(283,3,0.00,NULL),(284,1,0.00,NULL),(284,2,0.00,NULL),(284,3,0.00,NULL),(285,1,0.00,NULL),(285,2,0.00,NULL),(285,3,0.00,NULL),(286,1,0.00,NULL),(286,2,0.00,NULL),(286,3,0.00,NULL),(287,1,0.00,NULL),(287,2,0.00,NULL),(287,3,0.00,NULL),(288,1,0.00,NULL),(288,2,0.00,NULL),(288,3,0.00,NULL),(289,1,0.00,NULL),(289,2,0.00,NULL),(289,3,0.00,NULL),(290,1,0.00,NULL),(290,2,0.00,NULL),(290,3,0.00,NULL),(291,1,0.00,NULL),(291,2,0.00,NULL),(291,3,0.00,NULL),(292,1,0.00,NULL),(292,2,0.00,NULL),(292,3,0.00,NULL),(293,1,0.00,NULL),(293,2,0.00,NULL),(293,3,0.00,NULL),(294,1,0.00,NULL),(294,2,0.00,NULL),(294,3,0.00,NULL),(295,1,0.00,NULL),(295,2,0.00,NULL),(295,3,0.00,NULL),(296,1,0.00,NULL),(296,2,0.00,NULL),(296,3,0.00,NULL),(297,1,0.00,NULL),(297,2,0.00,NULL),(297,3,0.00,NULL),(298,1,0.00,NULL),(298,2,0.00,NULL),(298,3,0.00,NULL),(299,1,0.00,NULL),(299,2,0.00,NULL),(299,3,0.00,NULL),(300,1,0.00,NULL),(300,2,0.00,NULL),(300,3,0.00,NULL),(301,1,0.00,NULL),(301,2,0.00,NULL),(301,3,0.00,NULL),(302,1,0.00,NULL),(302,2,0.00,NULL),(302,3,0.00,NULL),(303,1,0.00,NULL),(303,2,0.00,NULL),(303,3,0.00,NULL),(304,1,0.00,NULL),(304,2,0.00,NULL),(304,3,0.00,NULL),(305,1,0.00,NULL),(305,2,0.00,NULL),(305,3,0.00,NULL),(306,1,0.00,NULL),(306,2,0.00,NULL),(306,3,0.00,NULL),(307,1,0.00,NULL),(307,2,0.00,NULL),(307,3,0.00,NULL),(308,1,0.00,NULL),(308,2,0.00,NULL),(308,3,0.00,NULL),(309,1,0.00,NULL),(309,2,0.00,NULL),(309,3,0.00,NULL),(310,1,0.00,NULL),(310,2,0.00,NULL),(310,3,0.00,NULL),(311,1,0.00,NULL),(311,2,0.00,NULL),(311,3,0.00,NULL),(312,1,0.00,NULL),(312,2,0.00,NULL),(312,3,0.00,NULL),(313,1,0.00,NULL),(313,2,0.00,NULL),(313,3,0.00,NULL),(314,1,0.00,NULL),(314,2,0.00,NULL),(314,3,0.00,NULL),(315,1,0.00,NULL),(315,2,0.00,NULL),(315,3,0.00,NULL),(316,1,0.00,NULL),(316,2,0.00,NULL),(316,3,0.00,NULL),(317,1,0.00,NULL),(317,2,0.00,NULL),(317,3,0.00,NULL),(318,1,0.00,NULL),(318,2,0.00,NULL),(318,3,0.00,NULL),(319,1,0.00,NULL),(319,2,0.00,NULL),(319,3,0.00,NULL),(320,1,0.00,NULL),(320,2,0.00,NULL),(320,3,0.00,NULL);
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

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` VALUES (1,'Anthony Alexis','Yarleque Galan','72889097','Calle cuba mz D 21 lote 13 Santa Julia',1,'920466951',''),(2,'MARTÍN TEODORO','HIDALGO ALBURQUEQUE','03853012','',1,'',''),(3,'TERESA DEL ROCIO','YOVERA JIMENEZ','77038701','',1,'','\0'),(4,'VILMA CLARIBEL','SERNA SERNAQUE','46032383','',1,'',''),(5,'JOSE','SANCHEZ REQUENES','41866767','',2,'',''),(6,'JAVIER','CHIROQUE','','',3,'',''),(7,'GUILLERMO','VALDIVIEZO','','',1,'','');
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

-- Dump completed on 2018-11-17 14:26:21
