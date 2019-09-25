-- MariaDB dump 10.17  Distrib 10.4.7-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ooe_nabati
-- ------------------------------------------------------
-- Server version	10.4.7-MariaDB-1:10.4.7+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `badstock_category`
--

DROP TABLE IF EXISTS `badstock_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badstock_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badstock_category`
--

LOCK TABLES `badstock_category` WRITE;
/*!40000 ALTER TABLE `badstock_category` DISABLE KEYS */;
INSERT INTO `badstock_category` VALUES (1,'BS Adonan MIXING'),(2,'BS Bubble BAKING '),(3,'BS Sheet BAKING'),(4,'BS Kue CREAMING'),(5,'BS Kue COOLING'),(6,'BS Kue Cutting'),(7,'BS Kue PACKAGING'),(8,'BS Roll PACKAGING (Carton)');
/*!40000 ALTER TABLE `badstock_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badstock_timbangan`
--

DROP TABLE IF EXISTS `badstock_timbangan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badstock_timbangan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `rencanaProduksiId` int(11) DEFAULT NULL,
  `machineId` int(11) DEFAULT NULL,
  `badstockCategoryId` int(11) DEFAULT NULL,
  `weight_kg` float NOT NULL,
  `weight` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_34a7156a171277cad541f91dd36` (`rencanaProduksiId`),
  KEY `FK_f7ea4ff052e15afe16c8cedc2a0` (`machineId`),
  KEY `FK_c49bbef14b9dfe80e36532ae9e0` (`badstockCategoryId`),
  CONSTRAINT `FK_34a7156a171277cad541f91dd36` FOREIGN KEY (`rencanaProduksiId`) REFERENCES `rencana_produksi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_c49bbef14b9dfe80e36532ae9e0` FOREIGN KEY (`badstockCategoryId`) REFERENCES `badstock_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_f7ea4ff052e15afe16c8cedc2a0` FOREIGN KEY (`machineId`) REFERENCES `machine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badstock_timbangan`
--

LOCK TABLES `badstock_timbangan` WRITE;
/*!40000 ALTER TABLE `badstock_timbangan` DISABLE KEYS */;
INSERT INTO `badstock_timbangan` VALUES (1,'2019-08-14 11:24:52',NULL,NULL,4,1,1,0,0),(2,'2019-08-16 04:07:53',NULL,NULL,18,1,1,0,0),(3,'2019-08-16 04:22:56',NULL,NULL,18,1,1,0,0),(4,'2019-08-16 04:31:25',NULL,NULL,18,1,1,0,0),(5,'2019-08-16 04:32:32',NULL,NULL,18,1,1,0,0);
/*!40000 ALTER TABLE `badstock_timbangan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downtime`
--

DROP TABLE IF EXISTS `downtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downtime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `duration` float NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `shiftId` int(11) DEFAULT NULL,
  `lineId` int(11) DEFAULT NULL,
  `rencanaProduksiId` int(11) DEFAULT NULL,
  `machineId` int(11) DEFAULT NULL,
  `downtimeCategoryId` int(11) DEFAULT NULL,
  `downtimeReasonId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_571ac4f9455bdad3165d398a04e` (`shiftId`),
  KEY `FK_755146296922df339431d38cf09` (`lineId`),
  KEY `FK_3e7f7a2364bae120fd113cd7df6` (`rencanaProduksiId`),
  KEY `FK_9da602f83260623be2d4aac03af` (`machineId`),
  KEY `FK_3afc23e29e1cbc395cb35f1cbfa` (`downtimeCategoryId`),
  KEY `FK_6e7d58ff9db4cb4302a2d761976` (`downtimeReasonId`),
  CONSTRAINT `FK_3afc23e29e1cbc395cb35f1cbfa` FOREIGN KEY (`downtimeCategoryId`) REFERENCES `downtime_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_3e7f7a2364bae120fd113cd7df6` FOREIGN KEY (`rencanaProduksiId`) REFERENCES `rencana_produksi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_571ac4f9455bdad3165d398a04e` FOREIGN KEY (`shiftId`) REFERENCES `initial_shift` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_6e7d58ff9db4cb4302a2d761976` FOREIGN KEY (`downtimeReasonId`) REFERENCES `downtime_reason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_755146296922df339431d38cf09` FOREIGN KEY (`lineId`) REFERENCES `line` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_9da602f83260623be2d4aac03af` FOREIGN KEY (`machineId`) REFERENCES `machine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downtime`
--

LOCK TABLES `downtime` WRITE;
/*!40000 ALTER TABLE `downtime` DISABLE KEYS */;
INSERT INTO `downtime` VALUES (1,10,'2019-08-14','2019-08-14 06:52:48',NULL,NULL,1,1,NULL,1,1,1),(2,10,'2019-08-14','2019-08-14 06:52:48',NULL,NULL,1,1,NULL,1,2,1),(3,50,'2019-08-17','2019-08-15 12:58:13',NULL,NULL,1,1,NULL,1,1,10),(4,50,'2019-08-17','2019-08-15 13:02:35',NULL,NULL,1,1,NULL,1,1,10),(5,30,'2019-08-17','2019-08-15 13:10:58',NULL,NULL,1,1,NULL,2,1,1),(6,30,'2019-08-17','2019-08-15 13:12:27',NULL,NULL,1,1,NULL,2,1,1),(7,30,'2019-08-17','2019-08-15 13:15:25',NULL,NULL,1,1,NULL,2,1,1),(8,30,'2019-08-18','2019-08-15 13:16:04',NULL,NULL,1,1,NULL,2,1,1),(9,30,'2019-08-18','2019-08-15 13:16:13',NULL,NULL,1,1,NULL,2,1,1),(10,30,'2019-08-18','2019-08-15 13:17:21',NULL,NULL,1,1,NULL,2,1,1),(11,20,'2019-08-17','2019-08-15 13:18:37',NULL,NULL,1,1,NULL,2,1,1),(12,20,'2019-08-17','2019-08-15 13:19:17',NULL,NULL,1,1,NULL,2,1,1),(13,25,'2019-08-17','2019-08-15 13:21:08',NULL,NULL,1,1,NULL,2,1,1),(14,25,'2019-08-18','2019-08-15 13:21:40',NULL,NULL,1,1,NULL,2,1,1),(15,35,'2019-08-18','2019-08-15 13:22:59',NULL,NULL,1,1,NULL,2,1,1),(16,35,'2019-08-17','2019-08-15 13:24:16',NULL,NULL,1,1,NULL,2,1,1),(17,11,'2019-08-17','2019-08-15 13:30:44',NULL,NULL,1,1,NULL,1,1,1),(18,11,'2019-08-17','2019-08-15 13:32:07',NULL,NULL,1,1,NULL,1,1,1),(19,14,'2019-08-17','2019-08-15 13:35:48',NULL,NULL,1,1,NULL,1,1,1),(20,14,'2019-08-18','2019-08-15 13:36:59',NULL,NULL,1,1,NULL,1,1,1),(21,14,'2019-08-18','2019-08-15 13:37:04',NULL,NULL,1,1,NULL,1,1,1),(22,6,'2019-08-18','2019-08-15 13:43:03',NULL,NULL,1,1,NULL,1,1,1),(24,10,'2019-08-17','2019-08-15 13:46:47',NULL,NULL,1,1,NULL,1,1,1),(25,10,'2019-08-17','2019-08-15 13:47:20',NULL,NULL,1,1,NULL,1,1,1),(26,5,'2019-08-17','2019-08-15 13:49:00',NULL,NULL,1,1,NULL,1,1,1),(27,5,'2019-08-17','2019-08-15 14:01:39',NULL,NULL,1,1,NULL,1,1,1),(28,5,'2019-08-17','2019-08-15 14:13:29',NULL,NULL,1,1,NULL,1,1,1),(29,5,'2019-08-17','2019-08-15 14:35:47',NULL,NULL,1,1,NULL,1,1,1),(30,15,'2019-08-17','2019-08-15 14:36:38',NULL,NULL,1,1,NULL,1,1,1),(31,15,'2019-08-17','2019-08-15 14:54:06',NULL,NULL,1,1,NULL,1,1,1),(32,15,'2019-08-17','2019-08-15 16:27:56',NULL,NULL,1,1,NULL,1,1,1),(33,15,'2019-08-17','2019-08-15 16:27:56',NULL,NULL,1,1,NULL,1,1,1),(34,15,'2019-08-17','2019-08-15 16:28:47',NULL,NULL,1,1,NULL,1,1,1),(35,20,'2019-08-17','2019-08-15 16:29:07',NULL,NULL,1,1,NULL,1,1,1),(36,20,'2019-08-17','2019-08-15 16:40:31',NULL,NULL,1,1,NULL,1,2,1),(37,20,'2019-08-17','2019-08-15 16:40:56',NULL,NULL,1,1,NULL,1,3,1),(38,30,'2019-08-17','2019-08-15 16:43:32',NULL,NULL,1,1,NULL,1,3,1),(39,5,'2019-08-17','2019-08-15 16:46:44',NULL,NULL,1,1,NULL,1,3,1),(40,5,'2019-08-17','2019-08-15 16:47:57',NULL,NULL,1,1,NULL,1,2,1),(41,10,'2019-08-17','2019-08-15 16:50:32',NULL,NULL,1,1,NULL,1,2,1),(42,10,'2019-08-17','2019-08-15 16:51:05',NULL,NULL,1,1,NULL,1,3,1),(43,65.1667,'2019-08-18','2019-08-17 11:24:56',NULL,NULL,1,1,NULL,1,1,4),(44,5.25,'2019-08-16','2019-08-17 11:26:11',NULL,NULL,2,2,NULL,1,1,4),(45,5.5,'2019-08-16','2019-08-17 11:27:09',NULL,NULL,1,2,NULL,1,1,5),(46,11.0833,'2019-08-16','2019-08-17 11:33:38',NULL,NULL,2,3,NULL,1,1,3),(47,6.1,'2019-08-17','2019-08-17 14:16:44',NULL,NULL,2,4,NULL,1,1,2);
/*!40000 ALTER TABLE `downtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downtime_category`
--

DROP TABLE IF EXISTS `downtime_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downtime_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downtime_category`
--

LOCK TABLES `downtime_category` WRITE;
/*!40000 ALTER TABLE `downtime_category` DISABLE KEYS */;
INSERT INTO `downtime_category` VALUES (1,'Planned Downtime'),(2,'Unplanned Downtime'),(3,'Performance Losses / Minorstopage');
/*!40000 ALTER TABLE `downtime_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downtime_reason`
--

DROP TABLE IF EXISTS `downtime_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downtime_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downtime_reason`
--

LOCK TABLES `downtime_reason` WRITE;
/*!40000 ALTER TABLE `downtime_reason` DISABLE KEYS */;
INSERT INTO `downtime_reason` VALUES (1,'Cleaning Baking Plate'),(2,'Preventive Maintenance'),(3,'Stock Opname'),(4,'National Holiday'),(5,'New Installation'),(6,'Deep Cleaning'),(7,'Trial R&D'),(8,'Reduce Speed'),(9,'Gas Shortage'),(10,'Cleaning Gang-way Baking Plate'),(11,'4M / Manpower Losses'),(12,'Shortage Material'),(13,'Sheet Menempel / Menumpuk'),(14,'Idle'),(15,'Cream & Coating'),(16,'Ganti Pipa Deposit'),(17,'Water Shortage'),(18,'RM & PM'),(19,'Minor Stoppages Losses'),(20,'Sensor Flame Detector Error'),(21,'Pipa Deposit Tersumbat'),(22,'Temperature Oven Tidak Stabil'),(23,'Cleaning Hopper Adonan'),(24,'Heating/burner Off'),(25,'Sensor Hopper Adonan Error'),(26,'Pressure Gas Turun'),(27,'Rantai Scrapper Rusak'),(28,'Locking Baking Plate Macet'),(29,'Pressure Angin Blower Turun'),(30,'Start-up Oven Lama'),(31,'Nozzle Burner Tidak Menyala'),(32,'Baut Sirip Cooling Box Longgar'),(33,'Sensor Cooling Box Error'),(34,'Pergantian Sensor Proximity'),(35,'Motor Archooler Korslet'),(36,'Roundbelt Putus'),(37,'Frame Cutting Putus'),(38,'Magazine Unsmooth'),(39,'Coding Tidak Sempurna'),(40,'Sensor Gate Conveyor Error'),(41,'Pusher Gate Error'),(42,'Temperature Seal Tidak Stabil'),(43,'Pisau Seal Tumpul'),(44,'Wire Cutting Putus'),(45,'Belt Conveyor Sobek'),(46,'Bearing Conveyor Rusak'),(47,'string'),(48,'string1'),(49,'Baru 5');
/*!40000 ALTER TABLE `downtime_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downtime_reason_machine`
--

DROP TABLE IF EXISTS `downtime_reason_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downtime_reason_machine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `machineId` int(11) DEFAULT NULL,
  `downtimeCategoryId` int(11) DEFAULT NULL,
  `downtimeReasonId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bf4d751959445b22da9e825fc80` (`machineId`),
  KEY `FK_b313168610fd3ac7d3826b5e424` (`downtimeCategoryId`),
  KEY `FK_eaf7bbefc9c6ee25bbf5856bbfd` (`downtimeReasonId`),
  CONSTRAINT `FK_b313168610fd3ac7d3826b5e424` FOREIGN KEY (`downtimeCategoryId`) REFERENCES `downtime_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_bf4d751959445b22da9e825fc80` FOREIGN KEY (`machineId`) REFERENCES `machine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_eaf7bbefc9c6ee25bbf5856bbfd` FOREIGN KEY (`downtimeReasonId`) REFERENCES `downtime_reason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downtime_reason_machine`
--

LOCK TABLES `downtime_reason_machine` WRITE;
/*!40000 ALTER TABLE `downtime_reason_machine` DISABLE KEYS */;
INSERT INTO `downtime_reason_machine` VALUES (1,1,1,1),(3,1,1,2),(4,1,1,3),(5,1,1,4),(6,1,1,5),(7,1,1,6),(8,1,1,7),(9,1,2,20),(10,1,2,21),(11,1,2,22),(12,1,2,23),(13,1,2,24),(14,1,2,25),(15,1,2,26),(16,1,2,27),(17,1,2,28),(18,1,2,29),(19,1,2,30),(20,1,2,31),(21,2,2,49);
/*!40000 ALTER TABLE `downtime_reason_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmi`
--

DROP TABLE IF EXISTS `hmi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hmi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmi`
--

LOCK TABLES `hmi` WRITE;
/*!40000 ALTER TABLE `hmi` DISABLE KEYS */;
INSERT INTO `hmi` VALUES (1,'HMI A'),(2,'HMI B'),(3,'HMI C'),(4,'HMI D');
/*!40000 ALTER TABLE `hmi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmi_lines_line`
--

DROP TABLE IF EXISTS `hmi_lines_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hmi_lines_line` (
  `hmiId` int(11) NOT NULL,
  `lineId` int(11) NOT NULL,
  PRIMARY KEY (`hmiId`,`lineId`),
  KEY `IDX_9e338365c9f5c52172bfa5f200` (`hmiId`),
  KEY `IDX_b9aa871549570e4bddf6478bf6` (`lineId`),
  CONSTRAINT `FK_9e338365c9f5c52172bfa5f2002` FOREIGN KEY (`hmiId`) REFERENCES `hmi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_b9aa871549570e4bddf6478bf65` FOREIGN KEY (`lineId`) REFERENCES `line` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmi_lines_line`
--

LOCK TABLES `hmi_lines_line` WRITE;
/*!40000 ALTER TABLE `hmi_lines_line` DISABLE KEYS */;
INSERT INTO `hmi_lines_line` VALUES (1,1),(1,2),(2,3),(2,4),(3,1),(3,2),(4,3),(4,4);
/*!40000 ALTER TABLE `hmi_lines_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmi_machines_machine`
--

DROP TABLE IF EXISTS `hmi_machines_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hmi_machines_machine` (
  `hmiId` int(11) NOT NULL,
  `machineId` int(11) NOT NULL,
  PRIMARY KEY (`hmiId`,`machineId`),
  KEY `IDX_4d0ccef7c1ca9a155cd89829db` (`hmiId`),
  KEY `IDX_a39aa28fd4662357f051cc287a` (`machineId`),
  CONSTRAINT `FK_4d0ccef7c1ca9a155cd89829db0` FOREIGN KEY (`hmiId`) REFERENCES `hmi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_a39aa28fd4662357f051cc287a3` FOREIGN KEY (`machineId`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmi_machines_machine`
--

LOCK TABLES `hmi_machines_machine` WRITE;
/*!40000 ALTER TABLE `hmi_machines_machine` DISABLE KEYS */;
INSERT INTO `hmi_machines_machine` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9);
/*!40000 ALTER TABLE `hmi_machines_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `initial_shift`
--

DROP TABLE IF EXISTS `initial_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `initial_shift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(255) NOT NULL,
  `shift_operated` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `initial_shift`
--

LOCK TABLES `initial_shift` WRITE;
/*!40000 ALTER TABLE `initial_shift` DISABLE KEYS */;
INSERT INTO `initial_shift` VALUES (1,'Shift 1',480,'06:00:00','14:00:00'),(2,'Shift 2',480,'14:00:00','22:00:00'),(3,'Shift 3',480,'22:00:00','06:00:00');
/*!40000 ALTER TABLE `initial_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `initial_sku`
--

DROP TABLE IF EXISTS `initial_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `initial_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `initial_sku`
--

LOCK TABLES `initial_sku` WRITE;
/*!40000 ALTER TABLE `initial_sku` DISABLE KEYS */;
INSERT INTO `initial_sku` VALUES (1,'Wafer Coklat','SKU000001'),(2,'Wafer Stoberi','SKU000002');
/*!40000 ALTER TABLE `initial_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lakban_finishgood`
--

DROP TABLE IF EXISTS `lakban_finishgood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lakban_finishgood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `rencanaProduksiId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cd2ac7aca0f3965e2aee7438618` (`rencanaProduksiId`),
  CONSTRAINT `FK_cd2ac7aca0f3965e2aee7438618` FOREIGN KEY (`rencanaProduksiId`) REFERENCES `rencana_produksi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lakban_finishgood`
--

LOCK TABLES `lakban_finishgood` WRITE;
/*!40000 ALTER TABLE `lakban_finishgood` DISABLE KEYS */;
/*!40000 ALTER TABLE `lakban_finishgood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lakban_rework`
--

DROP TABLE IF EXISTS `lakban_rework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lakban_rework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `rencanaProduksiId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_81915da2643e5e375bf64580886` (`rencanaProduksiId`),
  CONSTRAINT `FK_81915da2643e5e375bf64580886` FOREIGN KEY (`rencanaProduksiId`) REFERENCES `rencana_produksi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lakban_rework`
--

LOCK TABLES `lakban_rework` WRITE;
/*!40000 ALTER TABLE `lakban_rework` DISABLE KEYS */;
/*!40000 ALTER TABLE `lakban_rework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line`
--

LOCK TABLES `line` WRITE;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` VALUES (1,'Line 13'),(2,'Line 14'),(3,'Line 15'),(4,'Line 16');
/*!40000 ALTER TABLE `line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hmi_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine`
--

LOCK TABLES `machine` WRITE;
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
INSERT INTO `machine` VALUES (1,'Baking',0),(2,'Creaming',0),(3,'Mixing',0),(4,'Cooling',0),(5,'Cutting',0),(6,'Packaging 1',0),(7,'Packaging 2',0),(8,'Packaging 3',0),(9,'Packaging 4',0);
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oee_shift`
--

DROP TABLE IF EXISTS `oee_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oee_shift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shiftId` int(11) DEFAULT NULL,
  `lineId` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `c_total_qty_shift` float NOT NULL DEFAULT 0,
  `b_finishgood_shift` float NOT NULL DEFAULT 0,
  `d_total_defect_qty_karton` float NOT NULL DEFAULT 0,
  `e_total_rework_qty_karton` float NOT NULL DEFAULT 0,
  `total_target_produksi` float NOT NULL DEFAULT 0,
  `total_standart_ct` float NOT NULL DEFAULT 0,
  `total_bottleneck_ct` float NOT NULL DEFAULT 0,
  `total_pieces_to_target` float NOT NULL DEFAULT 0,
  `k_total_planned_dt_losses` float NOT NULL DEFAULT 0,
  `l_loading_hours` float NOT NULL DEFAULT 0,
  `m_total_unplanned_dt` float NOT NULL DEFAULT 0,
  `n_operating_hours` float NOT NULL DEFAULT 0,
  `o_total_performance_losses` float NOT NULL DEFAULT 0,
  `p_running_time` float NOT NULL DEFAULT 0,
  `q_total_defect_losses` float NOT NULL DEFAULT 0,
  `q_total_rework_losses` float NOT NULL DEFAULT 0,
  `q_total_quality_losses` float NOT NULL DEFAULT 0,
  `r_value_added_hours` float NOT NULL DEFAULT 0,
  `availablity` float NOT NULL DEFAULT 0,
  `performance_rate` float NOT NULL DEFAULT 0,
  `quality_product_rate` float NOT NULL DEFAULT 0,
  `line_oee` float NOT NULL DEFAULT 0,
  `l_total_production_time` float NOT NULL DEFAULT 0,
  `w2_total_downtime` float NOT NULL DEFAULT 0,
  `w3_number_of_breakdown` float NOT NULL DEFAULT 0,
  `w4_up_time` float NOT NULL DEFAULT 0,
  `mtbf_x1` float NOT NULL DEFAULT 0,
  `mttr_y1` float NOT NULL DEFAULT 0,
  `mttf_z1` float NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_15f666860b0a5114a7677d098fc` (`shiftId`),
  KEY `FK_9fba487d8aa23e1daca201704f3` (`lineId`),
  CONSTRAINT `FK_15f666860b0a5114a7677d098fc` FOREIGN KEY (`shiftId`) REFERENCES `initial_shift` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_9fba487d8aa23e1daca201704f3` FOREIGN KEY (`lineId`) REFERENCES `line` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oee_shift`
--

LOCK TABLES `oee_shift` WRITE;
/*!40000 ALTER TABLE `oee_shift` DISABLE KEYS */;
INSERT INTO `oee_shift` VALUES (3,1,1,'2019-08-17',0,10,0,0,30,0,0,20,0,480,25,455,20,435,0,0,0,435,94.7917,95.6044,100,90.625,480,45,45,435,9.66667,1,8.66667,'2019-08-17 03:02:45',NULL,NULL),(4,1,1,'2019-08-18',0,0,0,0,0,0,0,0,75.1667,404.833,0,404.833,0,404.833,0,0,0,404.833,100,100,100,100,404.833,0,0,404.833,0,0,0,'2019-08-17 11:24:56',NULL,NULL),(6,1,2,'2019-08-17',0,0,0,0,4000,15,25,0,0,480,0,480,0,480,0,0,0,480,100,100,100,100,480,0,0,480,0,0,0,'2019-08-16 01:55:54',NULL,NULL),(9,1,3,'2019-08-17',0,25,50,40,8000,60,100,7975,10,470,0,470,0,470,0,0,0,470,100,100,100,100,470,0,0,470,0,0,0,'2019-08-16 15:33:29',NULL,NULL),(10,1,3,'2019-08-15',0,794065000,50,40,8000,60,100,-794057000,10,470,0,470,0,470,0,0,0,470,100,100,100,100,470,0,0,470,0,0,0,'2019-09-25 07:11:01',NULL,NULL),(11,2,2,'2019-08-16',0,0,0,0,0,0,0,0,5.25,474.75,0,474.75,0,474.75,0,0,0,474.75,100,100,100,100,474.75,0,0,474.75,0,0,0,'2019-08-17 11:26:11',NULL,NULL),(12,1,2,'2019-08-16',0,0,0,0,0,0,0,0,5.5,474.5,0,474.5,0,474.5,0,0,0,474.5,100,100,100,100,474.5,0,0,474.5,0,0,0,'2019-08-17 11:27:09',NULL,NULL),(13,2,3,'2019-08-16',0,0,0,0,0,0,0,0,11.0833,468.917,0,468.917,0,468.917,0,0,0,468.917,100,100,100,100,468.917,0,0,468.917,0,0,0,'2019-08-17 11:33:38',NULL,NULL),(14,2,4,'2019-08-17',0,0,0,0,0,0,0,0,6.1,473.9,0,473.9,0,473.9,0,0,0,473.9,100,100,100,100,473.9,0,0,473.9,0,0,0,'2019-08-17 14:16:44',NULL,NULL),(15,2,1,'2019-08-15',0,0,0,0,0,0,0,0,0,480,0,480,0,480,0,0,0,480,100,100,100,100,480,0,0,480,0,0,0,'2019-09-25 07:05:30',NULL,NULL);
/*!40000 ALTER TABLE `oee_shift` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mygetzu`@`%`*/ /*!50003 TRIGGER `createCalculation` BEFORE INSERT ON `oee_shift` FOR EACH ROW
BEGIN
	SET NEW.l_loading_hours = 480 - NEW.k_total_planned_dt_losses,
    NEW.n_operating_hours = NEW.l_loading_hours - NEW.m_total_unplanned_dt,
    NEW.p_running_time = NEW.n_operating_hours - NEW.o_total_performance_losses,
    NEW.q_total_quality_losses = NEW.q_total_defect_losses + NEW.q_total_rework_losses,
    NEW.r_value_added_hours = NEW.p_running_time - NEW.q_total_quality_losses,
    NEW.availablity = NEW.n_operating_hours / NEW.l_loading_hours * 100,
    NEW.performance_rate = NEW.p_running_time / NEW.n_operating_hours * 100,
    NEW.quality_product_rate = NEW.r_value_added_hours / NEW.p_running_time * 100,
    NEW.line_oee = (NEW.availablity / 100) * (NEW.performance_rate / 100) * (NEW.quality_product_rate / 100) * 100,
    NEW.l_total_production_time = NEW.l_loading_hours,
    NEW.w2_total_downtime = NEW.m_total_unplanned_dt + NEW.o_total_performance_losses,
    NEW.w3_number_of_breakdown = NEW.m_total_unplanned_dt + NEW.o_total_performance_losses,
    NEW.w4_up_time = NEW.l_total_production_time - NEW.w2_total_downtime;
    
    IF NEW.w3_number_of_breakdown = 0 THEN
    	SET NEW.mtbf_x1 = 0, NEW.mttr_y1 = 0;
    ELSE
    	SET NEW.mtbf_x1 = NEW.w4_up_time / NEW.w3_number_of_breakdown, 
        	NEW.mttr_y1 = NEW.w2_total_downtime / NEW.w3_number_of_breakdown;
    END IF;
    
    SET NEW.mttf_z1 = NEW.mtbf_x1 - NEW.mttr_y1;
    
    SET NEW.total_pieces_to_target = NEW.total_target_produksi - NEW.b_finishgood_shift;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mygetzu`@`%`*/ /*!50003 TRIGGER `updateCalculation` BEFORE UPDATE ON `oee_shift` FOR EACH ROW
BEGIN
	SET NEW.l_loading_hours = 480 - NEW.k_total_planned_dt_losses,
    NEW.n_operating_hours = NEW.l_loading_hours - NEW.m_total_unplanned_dt,
    NEW.p_running_time = NEW.n_operating_hours - NEW.o_total_performance_losses,
    NEW.q_total_quality_losses = NEW.q_total_defect_losses + NEW.q_total_rework_losses,
    NEW.r_value_added_hours = NEW.p_running_time - NEW.q_total_quality_losses,
    NEW.availablity = NEW.n_operating_hours / NEW.l_loading_hours * 100,
    NEW.performance_rate = NEW.p_running_time / NEW.n_operating_hours * 100,
    NEW.quality_product_rate = NEW.r_value_added_hours / NEW.p_running_time * 100,
    NEW.line_oee = (NEW.availablity / 100) * (NEW.performance_rate / 100) * (NEW.quality_product_rate / 100) * 100,
    NEW.l_total_production_time = NEW.l_loading_hours,
    NEW.w2_total_downtime = NEW.m_total_unplanned_dt + NEW.o_total_performance_losses,
    NEW.w3_number_of_breakdown = NEW.m_total_unplanned_dt + NEW.o_total_performance_losses,
    NEW.w4_up_time = NEW.l_total_production_time - NEW.w2_total_downtime;
    
    IF NEW.w3_number_of_breakdown = 0 THEN
    	SET NEW.mtbf_x1 = 0, NEW.mttr_y1 = 0;
    ELSE
    	SET NEW.mtbf_x1 = NEW.w4_up_time / NEW.w3_number_of_breakdown, 
        	NEW.mttr_y1 = NEW.w2_total_downtime / NEW.w3_number_of_breakdown;
    END IF;
    
    SET NEW.mttf_z1 = NEW.mtbf_x1 - NEW.mttr_y1;
    
    SET NEW.total_pieces_to_target = NEW.total_target_produksi - NEW.b_finishgood_shift;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rencana_produksi`
--

DROP TABLE IF EXISTS `rencana_produksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rencana_produksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_number` varchar(255) NOT NULL,
  `target_produksi` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `shiftId` int(11) DEFAULT NULL,
  `lineId` int(11) DEFAULT NULL,
  `skuId` int(11) DEFAULT NULL,
  `supervisorId` int(11) DEFAULT NULL,
  `start_po` time NOT NULL,
  `end_po` time NOT NULL,
  `b_finishgood_qty_karton` float NOT NULL DEFAULT 0,
  `c_total_qty_karton` float NOT NULL DEFAULT 0,
  `d_defect_qty_karton` float NOT NULL DEFAULT 0,
  `e_rework_qty_karton` float NOT NULL DEFAULT 0,
  `q_defect_losses` float NOT NULL DEFAULT 0,
  `q_rework_losses` float NOT NULL DEFAULT 0,
  `q_total_quality_losses` float NOT NULL DEFAULT 0,
  `standart_ct` float NOT NULL DEFAULT 0,
  `bottleneck_ct` float NOT NULL DEFAULT 0,
  `date_startpo` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_b793fdb0c9cfee1742288ca45f5` (`shiftId`),
  KEY `FK_14210e32793e4e2b31b34ea3b01` (`lineId`),
  KEY `FK_4b97066918166022557931e90d5` (`skuId`),
  KEY `FK_ce8fbdb7f4256eac5d7cd8004ee` (`supervisorId`),
  CONSTRAINT `FK_14210e32793e4e2b31b34ea3b01` FOREIGN KEY (`lineId`) REFERENCES `line` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_4b97066918166022557931e90d5` FOREIGN KEY (`skuId`) REFERENCES `initial_sku` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_b793fdb0c9cfee1742288ca45f5` FOREIGN KEY (`shiftId`) REFERENCES `initial_shift` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ce8fbdb7f4256eac5d7cd8004ee` FOREIGN KEY (`supervisorId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rencana_produksi`
--

LOCK TABLES `rencana_produksi` WRITE;
/*!40000 ALTER TABLE `rencana_produksi` DISABLE KEYS */;
INSERT INTO `rencana_produksi` VALUES (4,'POID00001',1440,'2019-08-15','2019-08-16 14:26:13',NULL,NULL,1,3,1,2,'06:00:00','11:00:00',794065000,0,10,230,5,115,120,0.5,10,'2019-08-15 06:00:00'),(5,'POID00002',1440,'2019-08-15','2019-08-15 07:20:01',NULL,NULL,2,1,2,2,'14:00:00','19:00:00',0,0,0,0,0,0,0,0.5,0,'2019-08-15 14:00:00'),(6,'POID00003',1440,'2019-08-16','2019-08-15 07:20:16',NULL,NULL,1,1,1,2,'06:00:00','11:00:00',1350,0,10,230,5,115,120,0.5,10,'2019-08-16 06:00:00'),(7,'P0ID00005',1000,'2019-08-15','2019-08-15 07:17:37',NULL,NULL,2,1,1,2,'17:00:00','18:00:00',45000,0,0,0,0,0,0,10,10,'2019-08-15 17:00:00'),(10,'POID00004',2000,'2019-08-17','2019-08-16 01:55:25',NULL,NULL,1,2,1,2,'06:00:00','09:00:00',0,0,0,0,0,0,0,15,25,'2019-08-17 06:00:00'),(11,'POID00006',2000,'2019-08-18','2019-08-16 13:45:39',NULL,NULL,1,2,1,2,'06:00:00','09:00:00',0,0,0,0,0,0,0,15,25,'2019-08-17 06:00:00'),(16,'POID00007',2000,'2019-08-19','2019-08-16 13:45:44',NULL,NULL,1,3,1,2,'06:00:00','09:00:00',0,0,0,0,0,0,0,15,25,'2019-08-17 06:00:00'),(17,'POID00008',2000,'2019-08-20','2019-08-16 13:45:49',NULL,NULL,1,3,1,2,'09:00:00','12:00:00',15,0,0,0,0,0,0,15,25,'2019-08-17 06:00:00'),(18,'POID00009',2000,'2019-08-20','2019-08-16 13:46:07',NULL,NULL,1,3,1,2,'12:00:00','14:00:00',10,0,50,40,750,600,1350,15,25,'2019-08-17 06:00:00'),(19,'POID00006',2000,'2019-08-21','2019-08-16 13:46:13',NULL,NULL,1,3,1,2,'06:00:00','09:00:00',0,0,0,0,0,0,0,15,25,'2019-08-17 06:00:00');
/*!40000 ALTER TABLE `rencana_produksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rework_line`
--

DROP TABLE IF EXISTS `rework_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rework_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `rencanaProduksiId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fc2524190f344cb7cab4baf90e6` (`rencanaProduksiId`),
  CONSTRAINT `FK_fc2524190f344cb7cab4baf90e6` FOREIGN KEY (`rencanaProduksiId`) REFERENCES `rencana_produksi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rework_line`
--

LOCK TABLES `rework_line` WRITE;
/*!40000 ALTER TABLE `rework_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `rework_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Operator');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c28e52f758e7bbc53828db92194` (`roleId`),
  CONSTRAINT `FK_c28e52f758e7bbc53828db92194` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Admin','test','admin','$2b$10$tnnh6FzQE2BSH9PijLqOIuZBVLW2dq1yz6ZC.pyDKplKhfyLZR/MW','confirm',1),(3,'Operator','test','operator','$2b$10$0v/t4xRxJ/A2YARzRiwsyOMx4K5S0p1J8GufVEVBETPtio361ttfS','confirm',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-25 12:30:05
