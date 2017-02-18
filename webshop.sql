-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (armv7l)
--
-- Host: localhost    Database: webshop
-- ------------------------------------------------------
-- Server version	5.5.52-0+deb8u1

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
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` char(30) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `ssn` varchar(15) NOT NULL,
  `adress` varchar(50) NOT NULL,
  `city` char(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Sven','Andersson','19571017-7425','testbacken 2','testeborg','sven.tester@helloworld.com','0700001334','kalops'),(2,'Anna','Svensson','19850427-7425','testgatan 7','testköping','annatest@helloworld.com','0704572157','uggla'),(3,'Kristian','Testström','19120427-7136','testvägen 33','testeå','Krilletest@helloworld.com','07045743673','honung'),(4,'Elsa','Testsson','19781201-5761','teststigen 4','testholm','testerElsa@helloworld.com','0706971482','aftonbladet'),(5,'Julia','Testingsson','19920211-4247','testbacken 8','testeborg','juliatesting@helloworld.com','07069831486','jordgubbe');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (5,1,1486927281),(6,1,1486927308),(7,1,1486927979),(8,1,1486928011),(9,1,1486929697),(10,1,1486930365),(11,1,1486930526),(12,1,1486930821),(13,1,1486930859),(14,1,1486930867),(15,1,1486930915),(16,1,1486930981),(17,1,1486931099),(18,1,1486931182),(19,1,1486931215),(20,1,1486931321),(21,1,1486932519),(22,1,1487153029),(23,1,1487153074),(24,1,1487153102),(25,2,1487240326),(26,2,1487240434);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderProduct`
--

DROP TABLE IF EXISTS `OrderProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderProduct` (
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderProduct`
--

LOCK TABLES `OrderProduct` WRITE;
/*!40000 ALTER TABLE `OrderProduct` DISABLE KEYS */;
INSERT INTO `OrderProduct` VALUES (353,7),(115,7),(814,7),(353,8),(115,8),(814,8),(353,9),(115,9),(814,9),(115,9),(115,9),(115,9),(115,9),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(902,10),(353,12),(902,12),(814,14),(814,14),(814,20),(115,21),(353,21),(385,21),(421,21),(902,21),(814,21),(115,22),(814,23),(814,23),(353,24),(353,24),(385,25),(46,26),(100,26),(104,26),(101,26);
/*!40000 ALTER TABLE `OrderProduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `imgname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `manufacturer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `instock` int(11) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (45,'Toyota','Almost new.','toy.jpg','Toyota',1,5000.00),(46,'Yugo','Slow and defective.','yugo.jpg','Yugo',15,1.00),(100,'Låda','Låda med okänt innehåll. Fantastiskt tillfälle att köpa grisen i säcken!','lada.jpg','Unknown',3,50000.00),(101,'Mård','Nästan tam mård, ej rumsren.','mard.jpg','Svensk',9,500.00),(102,'Ekorre','Fridlyst ekorre.','ekorre.jpg','SydSvensk',1,1500.00),(103,'Jord','Säckar med jord säljes billigt.','jord.jpg','Landtmanna',30,100.00),(104,'Skottkärra','Fin gammal skottkärra i topskick!','skott.jpg','Åbykärran',99,1500.00),(105,'Micro','Fabriksny micro!!!','micro.jpg','Elon',3,999.00),(115,'Paper bag','Needful Things branded Paper bag.','1.png','Paper-R-Us',99992,100.00),(353,'Volvo','A retro Volvo Amazon -69. Still in mint condition!','volvo.jpg','Volvo',3,100000.00),(385,'SAAB','A retro SAAB that needs some tender loving care.','saab.jpg','SAAB',1,100.00),(421,'Boat','A used boat in good condition that still floats!','boat.jpg','Winth',1,1500.00),(814,'Book','Needful Things by Stephen King. Brand new!','2.jpg','Stephen King',8,300.00),(902,'iPhone','A defective iPhone in need of repair.','iphone.jpg','Apple',1000,400.00);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-16 11:49:20
