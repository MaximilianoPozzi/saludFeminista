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
-- Table structure for table `Comentario`
--

DROP TABLE IF EXISTS `Comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comentario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(200) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `moderado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Comentario_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comentario`
--

LOCK TABLES `Comentario` WRITE;
/*!40000 ALTER TABLE `Comentario` DISABLE KEYS */;
INSERT INTO `Comentario` VALUES (1,'C1','','2016-12-02 23:16:27','\0'),(2,'C2','','2016-12-02 23:16:59','\0'),(3,'C3','','2016-12-02 23:17:12','\0');
/*!40000 ALTER TABLE `Comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ComentarioXProfesional`
--

DROP TABLE IF EXISTS `ComentarioXProfesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ComentarioXProfesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idComentario` int(11) NOT NULL,
  `idProfesional` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ComentarioXProfesional_id_uindex` (`id`),
  KEY `ComentarioXProfesional_Comentario_id_fk` (`idComentario`),
  KEY `ComentarioXProfesional_Profesional_id_fk` (`idProfesional`),
  CONSTRAINT `ComentarioXProfesional_Comentario_id_fk` FOREIGN KEY (`idComentario`) REFERENCES `Comentario` (`id`),
  CONSTRAINT `ComentarioXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComentarioXProfesional`
--

LOCK TABLES `ComentarioXProfesional` WRITE;
/*!40000 ALTER TABLE `ComentarioXProfesional` DISABLE KEYS */;
INSERT INTO `ComentarioXProfesional` VALUES (1,1,1,'','2016-12-02 23:17:22'),(2,2,2,'','2016-12-02 23:17:25'),(3,3,3,'','2016-12-02 23:17:30');
/*!40000 ALTER TABLE `ComentarioXProfesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ComentarioXValoracion`
--

DROP TABLE IF EXISTS `ComentarioXValoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ComentarioXValoracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idComentario` int(11) NOT NULL,
  `idValoracion` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ComentarioXValoracion_id_uindex` (`id`),
  KEY `ComentarioXValoracion_Comentario_id_fk` (`idComentario`),
  KEY `ComentarioXValoracion_Valoración_id_fk` (`idValoracion`),
  CONSTRAINT `ComentarioXValoracion_Comentario_id_fk` FOREIGN KEY (`idComentario`) REFERENCES `Comentario` (`id`),
  CONSTRAINT `ComentarioXValoracion_Valoración_id_fk` FOREIGN KEY (`idValoracion`) REFERENCES `Valoración` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComentarioXValoracion`
--

LOCK TABLES `ComentarioXValoracion` WRITE;
/*!40000 ALTER TABLE `ComentarioXValoracion` DISABLE KEYS */;
INSERT INTO `ComentarioXValoracion` VALUES (1,1,1,'','2016-12-21 22:58:52'),(2,2,2,'','2016-12-21 22:59:02'),(3,3,3,'','2016-12-21 22:59:07');
/*!40000 ALTER TABLE `ComentarioXValoracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DireccionXProfesional`
--

DROP TABLE IF EXISTS `DireccionXProfesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DireccionXProfesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDireccion` int(11) NOT NULL,
  `idProfesional` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `DireccionXProfesional_id_uindex` (`id`),
  KEY `DireccionXProfesional_Dirección_id_fk` (`idDireccion`),
  KEY `DireccionXProfesional_Profesional_id_fk` (`idProfesional`),
  CONSTRAINT `DireccionXProfesional_Dirección_id_fk` FOREIGN KEY (`idDireccion`) REFERENCES `Dirección` (`id`),
  CONSTRAINT `DireccionXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DireccionXProfesional`
--

LOCK TABLES `DireccionXProfesional` WRITE;
/*!40000 ALTER TABLE `DireccionXProfesional` DISABLE KEYS */;
INSERT INTO `DireccionXProfesional` VALUES (1,1,1,'','2016-12-02 23:40:15'),(2,2,2,'','2016-12-02 23:40:21'),(4,3,3,'','2016-12-02 23:41:00'),(5,3,1,'','2016-12-02 23:41:11');
/*!40000 ALTER TABLE `DireccionXProfesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dirección`
--

DROP TABLE IF EXISTS `Dirección`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dirección` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(50) NOT NULL,
  `nombreLugar` varchar(50) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `idLocalidad` int(11) NOT NULL,
  `esPrivado` bit(1) NOT NULL DEFAULT b'0',
  `mail` varchar(50) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Dirección_id_uindex` (`id`),
  KEY `Dirección_Localidad_id_fk` (`idLocalidad`),
  CONSTRAINT `Dirección_Localidad_id_fk` FOREIGN KEY (`idLocalidad`) REFERENCES `Localidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dirección`
--

LOCK TABLES `Dirección` WRITE;
/*!40000 ALTER TABLE `Dirección` DISABLE KEYS */;
INSERT INTO `Dirección` VALUES (1,'d1','nom1','des1',1,'\0',NULL,'','2016-12-02 23:38:41'),(2,'d2','nom2','des2',2,'\0',NULL,'','2016-12-02 23:38:58'),(3,'d3','nom3','des3',3,'',NULL,'','2016-12-02 23:39:28');
/*!40000 ALTER TABLE `Dirección` ENABLE KEYS */;
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
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO `Especialidad` VALUES (1,'Es1','es1','','2016-12-02 23:13:52'),(2,'Es2','es2','','2016-12-02 23:15:13');
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
  `idEspecialidad` int(11) NOT NULL,
  `idProfesional` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `EspecialidadXProfesional_id_uindex` (`id`),
  KEY `EspecialidadXProfesional_Especialidad_id_fk` (`idEspecialidad`),
  KEY `EspecialidadXProfesional_Profesional_id_fk` (`idProfesional`),
  CONSTRAINT `EspecialidadXProfesional_Especialidad_id_fk` FOREIGN KEY (`idEspecialidad`) REFERENCES `Especialidad` (`id`),
  CONSTRAINT `EspecialidadXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EspecialidadXProfesional`
--

LOCK TABLES `EspecialidadXProfesional` WRITE;
/*!40000 ALTER TABLE `EspecialidadXProfesional` DISABLE KEYS */;
INSERT INTO `EspecialidadXProfesional` VALUES (1,1,1,'','2016-12-02 23:14:24'),(2,1,2,'','2016-12-02 23:14:31'),(3,2,3,'','2016-12-02 23:15:24'),(4,2,1,'','2016-12-02 23:15:44');
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
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO `Localidad` VALUES (1,'l1',1,'','2016-12-02 23:37:15'),(2,'l2',2,'','2016-12-02 23:37:21'),(3,'l3',3,'','2016-12-02 23:37:29');
/*!40000 ALTER TABLE `Localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObraSocial`
--

DROP TABLE IF EXISTS `ObraSocial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObraSocial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `plan` varchar(50) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ObraSocial_id_uindex` (`id`),
  UNIQUE KEY `ObraSocial_nombre_uindex` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObraSocial`
--

LOCK TABLES `ObraSocial` WRITE;
/*!40000 ALTER TABLE `ObraSocial` DISABLE KEYS */;
INSERT INTO `ObraSocial` VALUES (1,'o1','p1','','2016-12-02 23:42:34'),(2,'o2','p2','','2016-12-02 23:42:43'),(3,'o3','p3','','2016-12-02 23:42:52');
/*!40000 ALTER TABLE `ObraSocial` ENABLE KEYS */;
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
  `idObraSocial` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ObraSocialXProfesional_id_uindex` (`id`),
  KEY `ObraSocialXProfesional_Profesional_id_fk` (`idProfesional`),
  KEY `ObraSocialXProfesional_ObraSocial_id_fk` (`idObraSocial`),
  CONSTRAINT `ObraSocialXProfesional_ObraSocial_id_fk` FOREIGN KEY (`idObraSocial`) REFERENCES `ObraSocial` (`id`),
  CONSTRAINT `ObraSocialXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObraSocialXProfesional`
--

LOCK TABLES `ObraSocialXProfesional` WRITE;
/*!40000 ALTER TABLE `ObraSocialXProfesional` DISABLE KEYS */;
INSERT INTO `ObraSocialXProfesional` VALUES (1,1,1,'','2016-12-02 23:43:05'),(2,2,2,'','2016-12-02 23:43:10'),(3,3,3,'','2016-12-02 23:43:15'),(4,1,2,'','2016-12-02 23:43:20'),(5,1,3,'','2016-12-02 23:43:31');
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
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO `Procedimiento` VALUES (1,'n1','des1','','2016-12-02 23:45:27'),(2,'n2','des2','','2016-12-02 23:45:38'),(3,'n3','des3','','2016-12-02 23:45:46'),(4,'n4','des4','','2016-12-02 23:45:56');
/*!40000 ALTER TABLE `Procedimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProcedimientoXProfesionalXEspecialidad`
--

DROP TABLE IF EXISTS `ProcedimientoXProfesionalXEspecialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProcedimientoXProfesionalXEspecialidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProcedimiento` int(11) NOT NULL,
  `idEspecialidadXProfesional` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ProcedimientoXProfesionalXEspecialidad_id_uindex` (`id`),
  KEY `ProcedimientoXProfesionalXEspecialidad_Procedimiento_id_fk` (`idProcedimiento`),
  KEY `ProcXProfXEsp_EspXProf_id_fk` (`idEspecialidadXProfesional`),
  CONSTRAINT `ProcXProfXEsp_EspXProf_id_fk` FOREIGN KEY (`idEspecialidadXProfesional`) REFERENCES `EspecialidadXProfesional` (`id`),
  CONSTRAINT `ProcedimientoXProfesionalXEspecialidad_Procedimiento_id_fk` FOREIGN KEY (`idProcedimiento`) REFERENCES `Procedimiento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProcedimientoXProfesionalXEspecialidad`
--

LOCK TABLES `ProcedimientoXProfesionalXEspecialidad` WRITE;
/*!40000 ALTER TABLE `ProcedimientoXProfesionalXEspecialidad` DISABLE KEYS */;
INSERT INTO `ProcedimientoXProfesionalXEspecialidad` VALUES (1,1,1,'','2016-12-02 23:46:35'),(2,2,2,'','2016-12-02 23:46:39'),(3,3,3,'','2016-12-02 23:46:45'),(4,4,4,'','2016-12-02 23:47:07');
/*!40000 ALTER TABLE `ProcedimientoXProfesionalXEspecialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profesional`
--

DROP TABLE IF EXISTS `Profesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `moderado` bit(1) NOT NULL DEFAULT b'0',
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Profesional_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profesional`
--

LOCK TABLES `Profesional` WRITE;
/*!40000 ALTER TABLE `Profesional` DISABLE KEYS */;
INSERT INTO `Profesional` VALUES (1,'N1','A1',NULL,'\0','','2016-12-02 23:12:38'),(2,'N2','A2',NULL,'\0','','2016-12-02 23:12:50'),(3,'N3','A3',NULL,'\0','','2016-12-02 23:15:18');
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
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO `Provincia` VALUES (1,'p1','','2016-12-02 23:36:51'),(2,'p2','','2016-12-02 23:36:55'),(3,'p3','','2016-12-02 23:36:59');
/*!40000 ALTER TABLE `Provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefono`
--

DROP TABLE IF EXISTS `Telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Telefono` (
  `numero` bigint(20) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`numero`),
  UNIQUE KEY `Telefono_numero_uindex` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefono`
--

LOCK TABLES `Telefono` WRITE;
/*!40000 ALTER TABLE `Telefono` DISABLE KEYS */;
INSERT INTO `Telefono` VALUES (12,'','2016-12-02 23:47:57'),(23,'','2016-12-02 23:48:01'),(34,'','2016-12-02 23:48:05'),(45,'','2016-12-02 23:48:09');
/*!40000 ALTER TABLE `Telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TelefonoXDireccion`
--

DROP TABLE IF EXISTS `TelefonoXDireccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TelefonoXDireccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telefono` bigint(20) NOT NULL,
  `idDireccion` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TelefonoXDireccion_id_uindex` (`id`),
  KEY `TelefonoXDireccion_Telefono_numero_fk` (`telefono`),
  KEY `TelefonoXDireccion_Dirección_id_fk` (`idDireccion`),
  CONSTRAINT `TelefonoXDireccion_Dirección_id_fk` FOREIGN KEY (`idDireccion`) REFERENCES `Dirección` (`id`),
  CONSTRAINT `TelefonoXDireccion_Telefono_numero_fk` FOREIGN KEY (`telefono`) REFERENCES `Telefono` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TelefonoXDireccion`
--

LOCK TABLES `TelefonoXDireccion` WRITE;
/*!40000 ALTER TABLE `TelefonoXDireccion` DISABLE KEYS */;
INSERT INTO `TelefonoXDireccion` VALUES (2,12,1,'','2016-12-02 23:49:44'),(3,23,2,'','2016-12-02 23:49:49'),(4,34,3,'','2016-12-02 23:49:57'),(6,45,1,'','2016-12-02 23:50:19');
/*!40000 ALTER TABLE `TelefonoXDireccion` ENABLE KEYS */;
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
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ValoracionXProfesional_id_uindex` (`id`),
  KEY `ValoracionXProfesional_Profesional_id_fk` (`idProfesional`),
  KEY `ValoracionXProfesional_Valoración_id_fk` (`idValoracion`),
  CONSTRAINT `ValoracionXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`),
  CONSTRAINT `ValoracionXProfesional_Valoración_id_fk` FOREIGN KEY (`idValoracion`) REFERENCES `Valoración` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ValoracionXProfesional`
--

LOCK TABLES `ValoracionXProfesional` WRITE;
/*!40000 ALTER TABLE `ValoracionXProfesional` DISABLE KEYS */;
INSERT INTO `ValoracionXProfesional` VALUES (1,1,1,'','2016-12-02 23:52:01'),(2,2,2,'','2016-12-02 23:52:05'),(3,3,3,'','2016-12-02 23:52:09'),(4,1,4,'','2016-12-02 23:52:22'),(5,2,5,'','2016-12-02 23:52:27'),(6,3,6,'','2016-12-02 23:52:32');
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
  `valor` float NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Valoración_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Valoración`
--

LOCK TABLES `Valoración` WRITE;
/*!40000 ALTER TABLE `Valoración` DISABLE KEYS */;
INSERT INTO `Valoración` VALUES (1,1,'','2016-12-02 23:51:31'),(2,1,'','2016-12-02 23:51:36'),(3,2,'','2016-12-02 23:51:39'),(4,2,'','2016-12-02 23:51:42'),(5,3,'','2016-12-02 23:51:46'),(6,3,'','2016-12-02 23:51:49');
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

-- Dump completed on 2016-12-27  3:22:23
