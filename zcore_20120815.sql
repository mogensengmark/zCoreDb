-- MySQL dump 10.13  Distrib 5.5.21, for CYGWIN (i686)
--
-- Host: 127.0.0.1    Database: topspejder
-- ------------------------------------------------------
-- Server version	5.1.50-community

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
-- Table structure for table `adress`
--

DROP TABLE IF EXISTS `adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adress` (
  `adressId` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(64) NOT NULL,
  `number` int(11) NOT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `side` varchar(10) DEFAULT NULL,
  `zip` varchar(10) NOT NULL,
  PRIMARY KEY (`adressId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
INSERT INTO `adress` VALUES (1,'Slettevej',5,'','','4160');
/*!40000 ALTER TABLE `adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogentries`
--

DROP TABLE IF EXISTS `blogentries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogentries` (
  `blogEntryId` int(11) NOT NULL AUTO_INCREMENT,
  `headLine` varchar(64) NOT NULL,
  `subHeader` varchar(64) NOT NULL,
  `content` text NOT NULL,
  `entryCreated` datetime NOT NULL,
  `entryCreatedBy` int(11) NOT NULL,
  `entryEdited` datetime NOT NULL,
  `entryEditedBy` int(11) NOT NULL,
  `fk_blogsId` int(11) NOT NULL,
  PRIMARY KEY (`blogEntryId`),
  KEY `fk_blogEntries_users_created` (`entryCreatedBy`),
  KEY `fk_blogEntries_users_edited` (`entryEditedBy`),
  KEY `fk_blogEntries_blogs` (`fk_blogsId`),
  CONSTRAINT `fk_blogEntries_blogs` FOREIGN KEY (`fk_blogsId`) REFERENCES `blogs` (`blogId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_blogEntries_users_created` FOREIGN KEY (`entryCreatedBy`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_blogEntries_users_edited` FOREIGN KEY (`entryEditedBy`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogentries`
--

LOCK TABLES `blogentries` WRITE;
/*!40000 ALTER TABLE `blogentries` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogentries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `blogId` int(11) NOT NULL AUTO_INCREMENT,
  `blogName` varchar(64) NOT NULL,
  PRIMARY KEY (`blogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bruger`
--

DROP TABLE IF EXISTS `bruger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bruger` (
  `emailid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`emailid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bruger`
--

LOCK TABLES `bruger` WRITE;
/*!40000 ALTER TABLE `bruger` DISABLE KEYS */;
INSERT INTO `bruger` VALUES (1,'rts@rts.dk','123');
/*!40000 ALTER TABLE `bruger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chart`
--

DROP TABLE IF EXISTS `chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart` (
  `chart_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `chart_vote` varchar(50) NOT NULL DEFAULT '',
  `chart_navn` varchar(50) NOT NULL,
  PRIMARY KEY (`chart_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chart`
--

LOCK TABLES `chart` WRITE;
/*!40000 ALTER TABLE `chart` DISABLE KEYS */;
INSERT INTO `chart` VALUES (1,'01','Team Awesome'),(2,'02','Bente Grafik'),(3,'03','Lars 3D SVend'),(4,'04','Bo & Lis'),(5,'05','Hans-Kage'),(6,'06',''),(7,'07',''),(8,'08',''),(9,'09',''),(10,'10',''),(11,'11',''),(12,'12',''),(13,'13',''),(14,'14',''),(15,'15',''),(16,'16',''),(17,'17',''),(18,'18',''),(19,'19',''),(20,'20',''),(21,'21',''),(22,'22',''),(23,'23',''),(24,'24',''),(25,'25',''),(26,'26',''),(27,'27',''),(28,'28',''),(29,'29',''),(30,'30',''),(31,'31',''),(32,'32',''),(33,'33',''),(34,'34',''),(35,'35','');
/*!40000 ALTER TABLE `chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuitems` (
  `menuItemId` int(11) NOT NULL AUTO_INCREMENT,
  `menuItemLabel` varchar(64) NOT NULL,
  `menuItemController` varchar(64) NOT NULL,
  `menuItemAction` varchar(64) NOT NULL,
  `menuItemParameters` varchar(64) NOT NULL,
  `fk_userrightId` int(11) DEFAULT NULL,
  `fk_organisationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuItemId`),
  UNIQUE KEY `menuItemId` (`menuItemId`),
  KEY `fk_menuItems_userrights` (`fk_userrightId`),
  KEY `fk_organisation_id` (`fk_organisationId`),
  CONSTRAINT `fk_menuItems_userrights` FOREIGN KEY (`fk_userrightId`) REFERENCES `userrights` (`userRightsId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_organisation_id` FOREIGN KEY (`fk_organisationId`) REFERENCES `organisation` (`organisationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
INSERT INTO `menuitems` VALUES (1,'Forsiden','index','index','',NULL,1),(2,'Om gruppen','index','about','',NULL,NULL),(3,'Kontakt','index','contact','',NULL,NULL),(4,'Login','auth','login','',NULL,NULL),(5,'Enhederne','index','units','',NULL,2),(6,'Enhederne','page','enheder','/pname/enheder',NULL,2),(7,'Familiespejder','page','familiespejd','',NULL,2),(8,'Bævere','page','baever','',NULL,2),(9,'Ulve','page','ulve','',NULL,2),(10,'Juniorer','page','junior','',NULL,2),(11,'Trop','page','trop','',NULL,2),(12,'Senior','page','senior','',NULL,2),(13,'Rover','page','rover','',NULL,2),(14,'Billeder','page','billeder','',NULL,2);
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(64) NOT NULL,
  `fk_organisationId` int(11) NOT NULL,
  PRIMARY KEY (`menuId`),
  UNIQUE KEY `menuId` (`menuId`),
  KEY `fk_menus_organisation` (`fk_organisationId`),
  CONSTRAINT `fk_menus_organisation` FOREIGN KEY (`fk_organisationId`) REFERENCES `organisation` (`organisationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'zCoreDefault',1),(2,'topspejder.dk',2);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus-menuitems-map`
--

DROP TABLE IF EXISTS `menus-menuitems-map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus-menuitems-map` (
  `menusMenuItemsMapId` int(11) NOT NULL AUTO_INCREMENT,
  `fk_menusId` int(11) DEFAULT NULL,
  `fk_menuItemsId` int(11) DEFAULT NULL,
  `fk_parentItemId` int(11) DEFAULT NULL,
  `menuItemWeight` int(11) DEFAULT NULL,
  PRIMARY KEY (`menusMenuItemsMapId`),
  KEY `fk_menu_menus-menuitems-map` (`fk_menusId`),
  KEY `fk_menuitems_menus-menuitems-map` (`fk_menuItemsId`),
  CONSTRAINT `fk_menuitems_menus-menuitems-map` FOREIGN KEY (`fk_menuItemsId`) REFERENCES `menuitems` (`menuItemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_menus-menuitems-map` FOREIGN KEY (`fk_menusId`) REFERENCES `menus` (`menuId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='					';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus-menuitems-map`
--

LOCK TABLES `menus-menuitems-map` WRITE;
/*!40000 ALTER TABLE `menus-menuitems-map` DISABLE KEYS */;
INSERT INTO `menus-menuitems-map` VALUES (3,1,1,0,0),(4,1,4,0,0),(8,1,2,1,1),(9,1,1,3,2),(10,1,2,3,2),(11,1,3,0,2),(12,2,1,0,0),(13,2,6,0,1),(14,2,7,6,0),(15,2,8,6,1),(16,2,9,6,2),(17,2,10,6,3),(18,2,11,6,4),(19,2,12,6,5),(20,2,13,6,6),(21,2,14,0,2),(22,2,2,0,3),(23,2,3,0,4);
/*!40000 ALTER TABLE `menus-menuitems-map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offset`
--

DROP TABLE IF EXISTS `offset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offset` (
  `id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offset`
--

LOCK TABLES `offset` WRITE;
/*!40000 ALTER TABLE `offset` DISABLE KEYS */;
INSERT INTO `offset` VALUES (120);
/*!40000 ALTER TABLE `offset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisation`
--

DROP TABLE IF EXISTS `organisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation` (
  `organisationId` int(11) NOT NULL AUTO_INCREMENT,
  `organisationName` varchar(64) NOT NULL,
  `organizationParentId` int(11) NOT NULL,
  `fk_adressId` int(11) NOT NULL,
  PRIMARY KEY (`organisationId`),
  KEY `fk_organisation_adress` (`fk_adressId`),
  KEY `fk_organisation_organisation` (`organizationParentId`),
  CONSTRAINT `fk_organisation_adress` FOREIGN KEY (`fk_adressId`) REFERENCES `adress` (`adressId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_organisation_organisation` FOREIGN KEY (`organizationParentId`) REFERENCES `organisation` (`organisationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisation`
--

LOCK TABLES `organisation` WRITE;
/*!40000 ALTER TABLE `organisation` DISABLE KEYS */;
INSERT INTO `organisation` VALUES (1,'zCore',1,1),(2,'KFUM Spejderne Herlufmagle Gruppe',1,1);
/*!40000 ALTER TABLE `organisation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagecontent`
--

DROP TABLE IF EXISTS `pagecontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagecontent` (
  `pageContentId` int(11) NOT NULL AUTO_INCREMENT,
  `pageContent` text NOT NULL,
  `pageInserted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_pageId` int(11) NOT NULL,
  `pageInsertedBy` int(11) NOT NULL,
  PRIMARY KEY (`pageContentId`),
  KEY `fk_pageContent_pages` (`fk_pageId`),
  KEY `fk_pageContent_users` (`pageInsertedBy`),
  CONSTRAINT `fk_pageContent_pages` FOREIGN KEY (`fk_pageId`) REFERENCES `pages` (`pageId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pageContent_users` FOREIGN KEY (`pageInsertedBy`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagecontent`
--

LOCK TABLES `pagecontent` WRITE;
/*!40000 ALTER TABLE `pagecontent` DISABLE KEYS */;
INSERT INTO `pagecontent` VALUES (1,'<p>\r\n	hej med dig</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&aelig;blemand</p>\r\n','2011-09-04 11:57:22',2,0),(2,'<p>\r\n	hej med dig</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&aelig;blemand - h&aelig;ngebugsvin</p>\r\n','2011-09-04 11:58:46',2,0);
/*!40000 ALTER TABLE `pagecontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `pageName` varchar(64) NOT NULL,
  `fk_organisationId` int(11) NOT NULL,
  `fk_pageTypeId` int(11) NOT NULL,
  `pageState` tinyint(4) NOT NULL,
  `pageId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pageId`),
  KEY `fk_pages_organisation` (`fk_organisationId`),
  KEY `fk_pages_pageTypes` (`fk_pageTypeId`),
  CONSTRAINT `fk_pages_organisation` FOREIGN KEY (`fk_organisationId`) REFERENCES `organisation` (`organisationId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pages_pageTypes` FOREIGN KEY (`fk_pageTypeId`) REFERENCES `pagetypes` (`pageTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES ('hest',2,2,0,1),('hest2',2,2,0,2),('hest3',2,2,0,3),('4321',2,2,0,4),('4322',2,2,0,5),('eeeee',2,2,0,6),('aaaa',2,1,0,7),('213',2,1,0,8),('lilh',2,2,0,9),('lilh234',2,2,0,10),('lkajsfsdfasdfadsf',2,2,1,11),('klser',2,2,1,12),('asdasd',2,2,1,13),('mogens2',2,1,1,14);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagesblogsmap`
--

DROP TABLE IF EXISTS `pagesblogsmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagesblogsmap` (
  `fk_pageId` int(11) NOT NULL,
  `fk_blogId` int(11) NOT NULL,
  KEY `fk_pagesblogsmap_blogs` (`fk_blogId`),
  KEY `fk_pagesblogsmap_pages` (`fk_pageId`),
  CONSTRAINT `fk_pagesblogsmap_blogs` FOREIGN KEY (`fk_blogId`) REFERENCES `blogs` (`blogId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagesblogsmap_pages` FOREIGN KEY (`fk_pageId`) REFERENCES `pages` (`pageId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagesblogsmap`
--

LOCK TABLES `pagesblogsmap` WRITE;
/*!40000 ALTER TABLE `pagesblogsmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagesblogsmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagetypes`
--

DROP TABLE IF EXISTS `pagetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagetypes` (
  `pageTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `pageType` varchar(64) NOT NULL,
  PRIMARY KEY (`pageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagetypes`
--

LOCK TABLES `pagetypes` WRITE;
/*!40000 ALTER TABLE `pagetypes` DISABLE KEYS */;
INSERT INTO `pagetypes` VALUES (1,'custom'),(2,'blog');
/*!40000 ALTER TABLE `pagetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms`
--

DROP TABLE IF EXISTS `sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms` (
  `sms_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sms_mobilnummer` varchar(8) NOT NULL DEFAULT '',
  `sms_besked` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`sms_id`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms`
--

LOCK TABLES `sms` WRITE;
/*!40000 ALTER TABLE `sms` DISABLE KEYS */;
INSERT INTO `sms` VALUES (1,'31572406','10'),(2,'31572406','19'),(3,'31572406','01'),(4,'31572406','13'),(5,'31572406','32'),(6,'31572406','03'),(7,'31572406','32'),(8,'31572406','32'),(9,'31572406','03'),(10,'31572406','21'),(11,'31572406','23'),(12,'31572406','07'),(13,'31572406','08'),(14,'31572406','09'),(15,'31572406','09'),(16,'31572406','09'),(17,'31572406','09'),(18,'31572406','09'),(19,'31572406','19'),(20,'31572406','19'),(21,'31572406','21'),(22,'31572406','21'),(23,'31572406','21'),(24,'31572406','08'),(25,'31572406','17'),(26,'31572406','17'),(27,'31572406','17'),(28,'31572406','17'),(29,'31572406','17'),(30,'31572406','17'),(31,'31572406','17'),(32,'31572406','17'),(33,'31572406','17'),(34,'31572406','17'),(35,'31572406','17'),(36,'31572406','17'),(37,'31572406','17'),(38,'31572406','17'),(39,'31572406','21'),(40,'31572406','29'),(41,'31572406','29'),(42,'31572406','07'),(43,'31572406','07'),(44,'31572406','07'),(45,'31572406','01'),(46,'31572406','01'),(47,'31572406','01'),(48,'31572406','01'),(49,'31572406','01'),(50,'31572406','01'),(51,'31572406','35'),(52,'31572406','31'),(53,'31572406','31'),(54,'31572406','31'),(55,'31572406','03'),(56,'31572406','35'),(57,'53348494','27'),(58,'53348494','27'),(59,'',''),(60,'',''),(61,'',''),(62,'',''),(63,'',''),(64,'',''),(65,'',''),(66,'',''),(67,'',''),(68,'',''),(69,'',''),(70,'',''),(71,'',''),(72,'',''),(73,'',''),(74,'',''),(75,'',''),(76,'',''),(77,'',''),(78,'',''),(79,'',''),(80,'',''),(81,'',''),(82,'',''),(83,'',''),(84,'',''),(85,'',''),(86,'',''),(87,'',''),(88,'',''),(89,'',''),(90,'',''),(91,'',''),(92,'',''),(93,'',''),(94,'',''),(95,'',''),(96,'',''),(97,'',''),(98,'',''),(99,'',''),(100,'',''),(101,'',''),(102,'',''),(103,'',''),(104,'',''),(105,'',''),(106,'',''),(107,'',''),(108,'',''),(109,'',''),(110,'',''),(111,'',''),(112,'',''),(113,'',''),(114,'',''),(115,'',''),(116,'',''),(117,'',''),(118,'',''),(119,'','');
/*!40000 ALTER TABLE `sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercontact`
--

DROP TABLE IF EXISTS `usercontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usercontact` (
  `fk_usersId` int(11) NOT NULL,
  `fk_userContactType_id` int(11) NOT NULL,
  `contactValue` varchar(128) NOT NULL,
  KEY `fk_userContact_userContactTypes` (`fk_userContactType_id`),
  KEY `fk_userContact_users` (`fk_usersId`),
  CONSTRAINT `fk_userContact_userContactTypes` FOREIGN KEY (`fk_userContactType_id`) REFERENCES `usercontacttypes` (`userContactTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userContact_users` FOREIGN KEY (`fk_usersId`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercontact`
--

LOCK TABLES `usercontact` WRITE;
/*!40000 ALTER TABLE `usercontact` DISABLE KEYS */;
INSERT INTO `usercontact` VALUES (4,2,'61700856');
/*!40000 ALTER TABLE `usercontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercontacttypes`
--

DROP TABLE IF EXISTS `usercontacttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usercontacttypes` (
  `userContactTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `contactType` varchar(64) NOT NULL,
  PRIMARY KEY (`userContactTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercontacttypes`
--

LOCK TABLES `usercontacttypes` WRITE;
/*!40000 ALTER TABLE `usercontacttypes` DISABLE KEYS */;
INSERT INTO `usercontacttypes` VALUES (1,'Phone'),(2,'Mobile'),(3,'Email'),(4,'Fax');
/*!40000 ALTER TABLE `usercontacttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrelations`
--

DROP TABLE IF EXISTS `userrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrelations` (
  `userRelationFrom` int(11) NOT NULL,
  `userRelationTo` int(11) NOT NULL,
  `fk_userRelationTypesId` int(11) NOT NULL,
  KEY `fk_userRelations_userRelationTypes` (`fk_userRelationTypesId`),
  KEY `fk_userRelations_users_FROM` (`userRelationFrom`),
  KEY `fk_userRelations_users_TO` (`userRelationTo`),
  CONSTRAINT `fk_userRelations_userRelationTypes` FOREIGN KEY (`fk_userRelationTypesId`) REFERENCES `userrelationtypes` (`userRelationTypesId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userRelations_users_FROM` FOREIGN KEY (`userRelationFrom`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userRelations_users_TO` FOREIGN KEY (`userRelationTo`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrelations`
--

LOCK TABLES `userrelations` WRITE;
/*!40000 ALTER TABLE `userrelations` DISABLE KEYS */;
INSERT INTO `userrelations` VALUES (4,3,2);
/*!40000 ALTER TABLE `userrelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrelationtypes`
--

DROP TABLE IF EXISTS `userrelationtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrelationtypes` (
  `userRelationTypesId` int(11) NOT NULL AUTO_INCREMENT,
  `userRelationType` varchar(64) NOT NULL,
  PRIMARY KEY (`userRelationTypesId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrelationtypes`
--

LOCK TABLES `userrelationtypes` WRITE;
/*!40000 ALTER TABLE `userrelationtypes` DISABLE KEYS */;
INSERT INTO `userrelationtypes` VALUES (1,'mother'),(2,'father'),(3,'caretaker');
/*!40000 ALTER TABLE `userrelationtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrights`
--

DROP TABLE IF EXISTS `userrights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrights` (
  `userRightsId` int(11) NOT NULL AUTO_INCREMENT,
  `userRightName` varchar(64) DEFAULT NULL,
  `userRightDescription` varchar(64) DEFAULT NULL,
  `fk_organisationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userRightsId`),
  KEY `fk_organisation_userrights` (`fk_organisationId`),
  CONSTRAINT `fk_organisation_userrights` FOREIGN KEY (`fk_organisationId`) REFERENCES `organisation` (`organisationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrights`
--

LOCK TABLES `userrights` WRITE;
/*!40000 ALTER TABLE `userrights` DISABLE KEYS */;
/*!40000 ALTER TABLE `userrights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userroles` (
  `userRolesId` int(11) NOT NULL AUTO_INCREMENT,
  `userRole` varchar(64) NOT NULL,
  `fk_organisationId` int(11) NOT NULL DEFAULT '1',
  `allowInherit` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userRolesId`),
  KEY `fk_userRoles_organisation` (`fk_organisationId`),
  CONSTRAINT `fk_userRoles_organisation` FOREIGN KEY (`fk_organisationId`) REFERENCES `organisation` (`organisationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroles`
--

LOCK TABLES `userroles` WRITE;
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
INSERT INTO `userroles` VALUES (1,'Master',1,0),(2,'Administrator',1,1),(3,'User',1,1),(4,'Parent',1,1);
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userroles-userrights-map`
--

DROP TABLE IF EXISTS `userroles-userrights-map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userroles-userrights-map` (
  `userRolesId` int(11) NOT NULL,
  `userRightsId` int(11) DEFAULT NULL,
  KEY `fk_userroles_userroles-userrights-map` (`userRolesId`),
  KEY `fk_userrights_userroles-userrights-map` (`userRightsId`),
  CONSTRAINT `fk_userrights_userroles-userrights-map` FOREIGN KEY (`userRightsId`) REFERENCES `userrights` (`userRightsId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userroles_userroles-userrights-map` FOREIGN KEY (`userRolesId`) REFERENCES `userroles` (`userRolesId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroles-userrights-map`
--

LOCK TABLES `userroles-userrights-map` WRITE;
/*!40000 ALTER TABLE `userroles-userrights-map` DISABLE KEYS */;
/*!40000 ALTER TABLE `userroles-userrights-map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(64) NOT NULL,
  `middleName` varchar(64) DEFAULT NULL,
  `lastName` varchar(64) NOT NULL,
  `login` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `fk_adressId` int(11) NOT NULL,
  `fk_userRolesId` int(11) NOT NULL,
  `fk_organisationId` int(11) NOT NULL,
  `birthday` varchar(8) NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `renewPassword` tinyint(4) NOT NULL,
  `userState` tinyint(4) NOT NULL,
  `memberStartDate` date NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `fk_users_adress` (`fk_adressId`),
  KEY `fk_users_organisation` (`fk_organisationId`),
  KEY `fk_users_userRoles` (`fk_userRolesId`),
  CONSTRAINT `fk_users_adress` FOREIGN KEY (`fk_adressId`) REFERENCES `adress` (`adressId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_organisation` FOREIGN KEY (`fk_organisationId`) REFERENCES `organisation` (`organisationId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_userRoles` FOREIGN KEY (`fk_userRolesId`) REFERENCES `userroles` (`userRolesId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'zCoreAdmin','','Master','zCoreAdmin','1234',1,1,1,'',0,0,0,'0000-00-00'),(2,'Topspejder','','Admin','admin','be9e820ff071e8791fff0fb18cbca79f2ea65120',1,2,2,'',0,0,0,'0000-00-00'),(3,'Mathias','Jeppesen','Engmark','mathias','be9e820ff071e8791fff0fb18cbca79f2ea65120',1,3,2,'',0,0,0,'0000-00-00'),(4,'Mogens','','Engmark','mogens','be9e820ff071e8791fff0fb18cbca79f2ea65120',1,4,2,'',0,0,0,'0000-00-00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-15 23:17:27
