-- MySQL dump 10.15  Distrib 10.0.28-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.0.28-MariaDB

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
-- Table structure for table `DirecciónXProfesional`
--

DROP TABLE IF EXISTS `DirecciónXProfesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DirecciónXProfesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProfesional` int(11) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `nombreLugar` varchar(50) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `esPrivado` bit(1) NOT NULL DEFAULT b'0',
  `mail` varchar(50) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Dirección_id_uindex` (`id`),
  KEY `DirecciónXProfesional_Profesional_id_fk` (`idProfesional`),
  CONSTRAINT `DirecciónXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DirecciónXProfesional`
--

LOCK TABLES `DirecciónXProfesional` WRITE;
/*!40000 ALTER TABLE `DirecciónXProfesional` DISABLE KEYS */;
INSERT INTO `DirecciónXProfesional` VALUES (1,1,'direccion1','nom1','des1','\0',NULL,'','2016-12-03 02:38:41'),(2,2,'dirreccion2','nom2','des2','\0',NULL,'','2016-12-03 02:38:58'),(3,3,'direccion3','nom3','des3','',NULL,'','2016-12-03 02:39:28'),(4,1,'asidoa 1232','hooo','','','','','2017-01-24 01:04:14'),(5,11,'afasd','fads','des','','ais','','2017-01-24 01:14:12'),(6,12,'afasd','fads','des','','ais','','2017-01-24 01:27:23'),(7,13,'afasd','fads','des','','ais','','2017-01-24 01:49:02'),(8,14,'afasd','fads','des','','ais','','2017-01-24 01:50:40');
/*!40000 ALTER TABLE `DirecciónXProfesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Especialidad`
--

DROP TABLE IF EXISTS `Especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Especialidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Especialidad_id_uindex` (`id`),
  UNIQUE KEY `Especialidad_nombre_uindex` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Especialidad`
--

LOCK TABLES `Especialidad` WRITE;
/*!40000 ALTER TABLE `Especialidad` DISABLE KEYS */;
INSERT INTO `Especialidad` VALUES (1,'Especialidad1','es1','','2016-12-03 02:13:52'),(2,'Especialidad2','es2','','2016-12-03 02:15:13');
/*!40000 ALTER TABLE `Especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EspecialidadXProfesional`
--

DROP TABLE IF EXISTS `EspecialidadXProfesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EspecialidadXProfesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProfesional` int(11) NOT NULL,
  `idEspecialidad` int(11) NOT NULL,
  `idProcedimiento` int(11) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ProcedimientoXProfesionalXEspecialidad_id_uindex` (`id`),
  KEY `EspecialidadXProfesional_Profesional_id_fk` (`idProfesional`),
  KEY `EspecialidadXProfesional_Especialidad_id_fk` (`idEspecialidad`),
  KEY `EspecialidadXProfesional_Procedimiento_id_fk` (`idProcedimiento`),
  CONSTRAINT `EspecialidadXProfesional_Especialidad_id_fk` FOREIGN KEY (`idEspecialidad`) REFERENCES `Especialidad` (`id`),
  CONSTRAINT `EspecialidadXProfesional_Procedimiento_id_fk` FOREIGN KEY (`idProcedimiento`) REFERENCES `Procedimiento` (`id`),
  CONSTRAINT `EspecialidadXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EspecialidadXProfesional`
--

LOCK TABLES `EspecialidadXProfesional` WRITE;
/*!40000 ALTER TABLE `EspecialidadXProfesional` DISABLE KEYS */;
INSERT INTO `EspecialidadXProfesional` VALUES (1,1,1,1,'','2016-12-03 02:46:35'),(2,2,1,2,'','2016-12-03 02:46:39'),(3,3,2,1,'','2016-12-03 02:46:45'),(4,1,2,2,'','2016-12-03 02:47:07'),(5,13,1,1,'','2017-01-24 01:49:02');
/*!40000 ALTER TABLE `EspecialidadXProfesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Localidad`
--

DROP TABLE IF EXISTS `Localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Localidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Localidad_id_uindex` (`id`),
  KEY `Localidad_Provincia_id_fk` (`idProvincia`),
  CONSTRAINT `Localidad_Provincia_id_fk` FOREIGN KEY (`idProvincia`) REFERENCES `Provincia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Localidad`
--

LOCK TABLES `Localidad` WRITE;
/*!40000 ALTER TABLE `Localidad` DISABLE KEYS */;
INSERT INTO `Localidad` VALUES (1,'localidad1',1,'','2016-12-03 02:37:15'),(2,'localidad2',2,'','2016-12-03 02:37:21'),(3,'localidad3',3,'','2016-12-03 02:37:29');
/*!40000 ALTER TABLE `Localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObraSocialXProfesional`
--

DROP TABLE IF EXISTS `ObraSocialXProfesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObraSocialXProfesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProfesional` int(11) NOT NULL,
  `obraSocial` varchar(50) NOT NULL,
  `plan` varchar(50) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ObraSocialXProfesional_id_uindex` (`id`),
  KEY `ObraSocialXProfesional_Profesional_id_fk` (`idProfesional`),
  KEY `ObraSocialXProfesional_ObraSocial_id_fk` (`obraSocial`),
  CONSTRAINT `ObraSocialXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObraSocialXProfesional`
--

LOCK TABLES `ObraSocialXProfesional` WRITE;
/*!40000 ALTER TABLE `ObraSocialXProfesional` DISABLE KEYS */;
INSERT INTO `ObraSocialXProfesional` VALUES (1,1,'1',NULL,'','2016-12-03 02:43:05'),(2,2,'2',NULL,'','2016-12-03 02:43:10'),(3,3,'3',NULL,'','2016-12-03 02:43:15'),(4,1,'2',NULL,'','2016-12-03 02:43:20'),(5,1,'3',NULL,'','2016-12-03 02:43:31'),(6,13,'asd','sda','','2017-01-24 01:49:02'),(7,14,'asd','sda','','2017-01-24 01:50:40');
/*!40000 ALTER TABLE `ObraSocialXProfesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Procedimiento`
--

DROP TABLE IF EXISTS `Procedimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Procedimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Procedimiento_id_uindex` (`id`),
  UNIQUE KEY `Procedimiento_nombre_uindex` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Procedimiento`
--

LOCK TABLES `Procedimiento` WRITE;
/*!40000 ALTER TABLE `Procedimiento` DISABLE KEYS */;
INSERT INTO `Procedimiento` VALUES (1,'n1','des1','','2016-12-03 02:45:27'),(2,'n2','des2','','2016-12-03 02:45:38'),(3,'n3','des3','','2016-12-03 02:45:46'),(4,'n4','des4','','2016-12-03 02:45:56');
/*!40000 ALTER TABLE `Procedimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProcedimientoXEspecialidad`
--

DROP TABLE IF EXISTS `ProcedimientoXEspecialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProcedimientoXEspecialidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEspecialidad` int(11) NOT NULL,
  `idProcedimiento` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ProcedimientoXEspecialidad_Especialidad_id_fk` (`idEspecialidad`),
  KEY `ProcedimientoXEspecialidad_Procedimiento_id_fk` (`idProcedimiento`),
  CONSTRAINT `ProcedimientoXEspecialidad_Especialidad_id_fk` FOREIGN KEY (`idEspecialidad`) REFERENCES `Especialidad` (`id`),
  CONSTRAINT `ProcedimientoXEspecialidad_Procedimiento_id_fk` FOREIGN KEY (`idProcedimiento`) REFERENCES `Procedimiento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProcedimientoXEspecialidad`
--

LOCK TABLES `ProcedimientoXEspecialidad` WRITE;
/*!40000 ALTER TABLE `ProcedimientoXEspecialidad` DISABLE KEYS */;
INSERT INTO `ProcedimientoXEspecialidad` VALUES (1,1,1,'','2017-01-23 23:42:23'),(2,2,2,'','2017-01-23 23:42:27'),(3,1,3,'','2017-01-23 23:42:40'),(4,1,4,'','2017-01-23 23:42:56');
/*!40000 ALTER TABLE `ProcedimientoXEspecialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profesional`
--

DROP TABLE IF EXISTS `Profesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idTitulacion` int(11) NOT NULL DEFAULT '5',
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `idLocalidad` int(11) NOT NULL,
  `moderado` bit(1) NOT NULL DEFAULT b'0',
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Profesional_id_uindex` (`id`),
  KEY `Profesional_Titulacion_id_fk` (`idTitulacion`),
  KEY `Profesional_Localidad_id_fk` (`idLocalidad`),
  CONSTRAINT `Profesional_Localidad_id_fk` FOREIGN KEY (`idLocalidad`) REFERENCES `Localidad` (`id`),
  CONSTRAINT `Profesional_Titulacion_id_fk` FOREIGN KEY (`idTitulacion`) REFERENCES `Titulacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profesional`
--

LOCK TABLES `Profesional` WRITE;
/*!40000 ALTER TABLE `Profesional` DISABLE KEYS */;
INSERT INTO `Profesional` VALUES (1,1,'Nombre1','Apellido1',NULL,1,'\0','','2016-12-03 02:12:38'),(2,2,'Nombre2','Apellido3',NULL,2,'\0','','2016-12-03 02:12:50'),(3,5,'Nombre3','Apellido4',NULL,3,'\0','','2016-12-03 02:15:18'),(4,1,'nombrenvo','apellidonvo','mail',1,'\0','','2017-01-23 21:57:05'),(5,1,'nom','app','algo@algo',1,'\0','','2017-01-23 22:06:57'),(7,2,'nnn','aaaa','mdo@kfo',2,'\0','','2017-01-23 23:30:03'),(8,2,'nnn','aaaa','mdo@kfo',2,'\0','','2017-01-24 00:15:12'),(9,2,'nnn','aaaa','mdo@kfo',2,'\0','','2017-01-24 00:16:38'),(10,2,'nnn','aaaa','mdo@kfo',2,'\0','','2017-01-24 00:17:42'),(11,2,'nnn','aaaa','mdo@kfo',2,'\0','','2017-01-24 01:14:12'),(12,2,'nnn','aaaa','mdo@kfo',2,'\0','','2017-01-24 01:27:22'),(13,2,'nnn','aaaa','mdo@kfo',2,'\0','','2017-01-24 01:49:02'),(14,2,'nnn','aaaa','mdo@kfo',2,'\0','','2017-01-24 01:50:40');
/*!40000 ALTER TABLE `Profesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provincia`
--

DROP TABLE IF EXISTS `Provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Provincia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Provincia_id_uindex` (`id`),
  UNIQUE KEY `Provincia_nombre_uindex` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provincia`
--

LOCK TABLES `Provincia` WRITE;
/*!40000 ALTER TABLE `Provincia` DISABLE KEYS */;
INSERT INTO `Provincia` VALUES (1,'provincia1','','2016-12-03 02:36:51'),(2,'provincia2','','2016-12-03 02:36:55'),(3,'provincia3','','2016-12-03 02:36:59');
/*!40000 ALTER TABLE `Provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TelefonoXDireccion`
--

DROP TABLE IF EXISTS `TelefonoXDireccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TelefonoXDireccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDireccion` int(11) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TelefonoXDireccion_id_uindex` (`id`),
  KEY `TelefonoXDireccion_Telefono_id_fk` (`telefono`),
  KEY `TelefonoXDireccion_Dirección_id_fk` (`idDireccion`),
  CONSTRAINT `TelefonoXDireccion_Dirección_id_fk` FOREIGN KEY (`idDireccion`) REFERENCES `DirecciónXProfesional` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TelefonoXDireccion`
--

LOCK TABLES `TelefonoXDireccion` WRITE;
/*!40000 ALTER TABLE `TelefonoXDireccion` DISABLE KEYS */;
INSERT INTO `TelefonoXDireccion` VALUES (2,1,1,'','2016-12-03 02:49:44'),(3,2,2,'','2016-12-03 02:49:49'),(4,3,3,'','2016-12-03 02:49:57'),(6,1,4,'','2016-12-03 02:50:19'),(7,6,12322,'','2017-01-24 01:27:23'),(8,7,12322,'','2017-01-24 01:49:02'),(9,8,12322,'','2017-01-24 01:50:40');
/*!40000 ALTER TABLE `TelefonoXDireccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Titulacion`
--

DROP TABLE IF EXISTS `Titulacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Titulacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT ' ',
  `fechaDeAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Titulacion_id_uindex` (`id`),
  UNIQUE KEY `Titulacion_nombre_uindex` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Titulacion`
--

LOCK TABLES `Titulacion` WRITE;
/*!40000 ALTER TABLE `Titulacion` DISABLE KEYS */;
INSERT INTO `Titulacion` VALUES (1,'Dr.','2017-01-23 16:40:26',''),(2,'Dra.','2017-01-23 16:40:35',''),(3,'Drx.','2017-01-23 16:40:42',''),(4,'Lic.','2017-01-23 16:41:00',''),(5,' ','2017-01-23 16:41:06','');
/*!40000 ALTER TABLE `Titulacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ValoracionXProfesional`
--

DROP TABLE IF EXISTS `ValoracionXProfesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ValoracionXProfesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProfesional` int(11) NOT NULL,
  `idValoracion` int(11) NOT NULL,
  `comentario` varchar(200) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ValoracionXProfesional_id_uindex` (`id`),
  KEY `ValoracionXProfesional_Profesional_id_fk` (`idProfesional`),
  KEY `ValoracionXProfesional_Valoración_id_fk` (`idValoracion`),
  CONSTRAINT `ValoracionXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`),
  CONSTRAINT `ValoracionXProfesional_Valoración_id_fk` FOREIGN KEY (`idValoracion`) REFERENCES `Valoración` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ValoracionXProfesional`
--

LOCK TABLES `ValoracionXProfesional` WRITE;
/*!40000 ALTER TABLE `ValoracionXProfesional` DISABLE KEYS */;
INSERT INTO `ValoracionXProfesional` VALUES (1,1,1,'comentario1','','2016-12-03 02:52:01'),(2,2,2,'comentario2','','2016-12-03 02:52:05'),(3,3,3,'comentario3','','2016-12-03 02:52:09'),(4,1,4,'comentario4','','2016-12-03 02:52:22'),(5,2,5,'comentario5','','2016-12-03 02:52:27'),(6,3,1,'comentario6','','2016-12-03 02:52:32'),(7,1,2,'ksdnkaksds','','2017-01-23 23:59:36'),(8,10,1,'comentariooo','','2017-01-24 00:17:42'),(9,10,4,'comentariooowwww','','2017-01-24 00:17:42'),(10,11,1,'comentariooo','','2017-01-24 01:14:12'),(11,11,4,'comentariooowwww','','2017-01-24 01:14:12'),(12,12,1,'comentariooo','','2017-01-24 01:27:22'),(13,12,4,'comentariooowwww','','2017-01-24 01:27:22'),(14,13,1,'comentariooo','','2017-01-24 01:49:02'),(15,13,4,'comentariooowwww','','2017-01-24 01:49:02'),(16,14,1,'comentariooo','','2017-01-24 01:50:40'),(17,14,4,'comentariooowwww','','2017-01-24 01:50:40');
/*!40000 ALTER TABLE `ValoracionXProfesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Valoración`
--

DROP TABLE IF EXISTS `Valoración`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Valoración` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Valoración_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Valoración`
--

LOCK TABLES `Valoración` WRITE;
/*!40000 ALTER TABLE `Valoración` DISABLE KEYS */;
INSERT INTO `Valoración` VALUES (1,1,'Muy malo','','2016-12-03 02:51:31'),(2,2,'Malo','','2016-12-03 02:51:36'),(3,3,'Regular','','2016-12-03 02:51:39'),(4,4,'Bueno','','2016-12-03 02:51:42'),(5,5,'Muy bueno','','2016-12-03 02:51:46');
/*!40000 ALTER TABLE `Valoración` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-23 22:54:16
