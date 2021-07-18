-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: groupomaniatest
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Animaux'),(2,'Comic'),(3,'Drôle'),(4,'Gaming'),(5,'Meme'),(6,'Random');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Posts_id` int NOT NULL,
  `Users_id` int NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`,`Posts_id`,`Users_id`),
  KEY `fk_Comments_Users1_idx` (`Users_id`),
  KEY `fk_Comments_Posts1_idx` (`Posts_id`),
  CONSTRAINT `fk_Comments_Posts1` FOREIGN KEY (`Posts_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_Comments_Users1` FOREIGN KEY (`Users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (5,4,11,'2021-07-02 08:52:05','Ma première publication'),(6,5,12,'2021-07-02 09:01:24','Magnifique lac'),(7,4,12,'2021-07-02 09:02:12','On va pouvoir bronzer !!!'),(8,5,13,'2021-07-02 09:08:54','Ca donne envie !!'),(9,4,13,'2021-07-02 09:11:39','Et faire le lézard ;-)'),(10,7,13,'2021-07-02 09:14:27','Même pas en rêve lol'),(11,6,13,'2021-07-02 09:14:53','Il est beau le soleil'),(13,11,17,'2021-07-02 15:17:25','Ils sont beaux !!!!'),(14,9,17,'2021-07-02 15:18:23','Il se régal :)'),(15,11,7,'2021-07-02 15:20:28','Fan de dragon !!!'),(16,12,7,'2021-07-05 12:18:17','Mon commentaire');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Users_id` int NOT NULL,
  `Categories_id` int NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `image_url` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`,`Users_id`,`Categories_id`),
  KEY `fk_Posts_Categories_idx` (`Categories_id`),
  KEY `fk_Posts_Users1_idx` (`Users_id`),
  CONSTRAINT `fk_Posts_Categories` FOREIGN KEY (`Categories_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_Posts_Users1` FOREIGN KEY (`Users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (4,11,3,'2021-07-02 08:51:44','L\'été et le soleil sont arrivés','http://localhost:4200/images/Sun_Flower.jpg1625215904031.jpeg'),(5,12,6,'2021-07-02 09:00:54','Ballade dans les Vosges !!!','http://localhost:4200/images/Lake.jpg1625216454048.jpeg'),(6,12,2,'2021-07-02 09:03:28','Enfin libre !!!','http://localhost:4200/images/images.jpg1625216608151.jpeg'),(7,13,2,'2021-07-02 09:14:01','Une petite étape de montagne','http://localhost:4200/images/Decouvrez-le-parcours-complet-du-Tour-de-France-2021.jpg1625217241784.jpeg'),(9,13,1,'2021-07-02 09:28:52','Un petit calin !!!','http://localhost:4200/images/18633880lpw-18633909-article-zoo-beauval-animal-jpg_6166393_1250x625.jpg1625218132751.jpeg'),(10,7,1,'2021-07-02 14:09:48','Renard renard !!','http://localhost:4200/images/renard-roux.jpg1625234988919.jpeg'),(11,17,1,'2021-07-02 15:17:02','Les z\'amours','http://localhost:4200/images/index2.jpg1625239022026.jpeg'),(12,7,3,'2021-07-05 12:18:01','Mon new post','http://localhost:4200/images/cadre-commercial-barbu-de-costume-d-homme-82198101.jpg1625487481395.jpeg');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reactions` (
  `Posts_id` int NOT NULL,
  `Users_id` int NOT NULL,
  `reaction` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Posts_id`,`Users_id`),
  KEY `fk_Likes_Users1_idx` (`Users_id`),
  KEY `fk_Reactions_Posts1_idx` (`Posts_id`),
  CONSTRAINT `fk_Likes_Users1` FOREIGN KEY (`Users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_Reactions_Posts1` FOREIGN KEY (`Posts_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reactions`
--

LOCK TABLES `reactions` WRITE;
/*!40000 ALTER TABLE `reactions` DISABLE KEYS */;
INSERT INTO `reactions` VALUES (4,11,'like'),(4,12,'like'),(4,13,'like'),(4,14,'like'),(4,16,'dislike'),(4,17,'like'),(5,12,'like'),(5,13,'like'),(5,16,'like'),(5,17,'dislike'),(6,13,'like'),(6,16,'dislike'),(6,17,'dislike'),(7,13,'like'),(7,17,'dislike'),(9,13,'like'),(9,16,'like'),(9,17,'like'),(10,7,'like'),(10,16,'like'),(10,17,'like'),(11,7,'like'),(11,17,'like'),(12,7,'like');
/*!40000 ALTER TABLE `reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'user',
  `user_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `firstName` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastName` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `photo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `department` varchar(65) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `role` varchar(65) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `linkedin_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'user','2021-06-28 13:43:42','David','Boilon','boilon.david@gmail.com','$2b$10$yC8o0FAjQ5cU7M7VRLTizOPAg2YXcDjp07vfglL6/2Vx1g6oopwtC',NULL,NULL,NULL,NULL),(7,'user','2021-06-29 16:13:04','Chloé','BOILON','cbx@gmail.com','$2b$10$dp.emWMwpZ9OGpmlhZXzKugiMBoO0tqXqFThdxCZ.tVQynXRTy1Lq','http://localhost:4200/images/formation-developpement-webforce3-1200x800.jpeg1625234855601.jpeg','Developpement web','Developpeur Full stack','monadresse@linkedin.com'),(11,'user','2021-07-02 08:48:38','Eric','PIRET','eric.piret@gmail.com','$2b$10$EkxCiXVbImk87JfT9vzE7eQ/uwZuDLpml6eRbDYvBDEQxzPEnpMWC','http://localhost:4200/images/unnamed.jpg1625215822404.jpeg','Ressource humaine','DRH','drh@linkedin.com'),(12,'user','2021-07-02 08:53:17','Laetitia','MARTIN','Laetitia@gmail.com','$2b$10$XS5AC.ybqk5hsDBG.VBNBuvjiT0LOQF1aPTPtIa9c3zm175Ahiz4i','http://localhost:4200/images/images.jpg1625216154871.jpeg','Accueil','Standardiste','byme@linkedin.com'),(13,'user','2021-07-02 09:06:48','Marc','BOILON','marco@gmail.com','$2b$10$nx8/NAGM4O8kG4S10LENXuh/saDNTEjwCf0u3ZAjqDDyLWICDtPW.','http://localhost:4200/images/cadre-commercial-barbu-de-costume-d-homme-82198101.jpg1625216900167.jpeg','Vente','Commercial','marc@linkedin.com'),(14,'user','2021-07-02 12:52:37','Michelle','MARTIN','michellemartin@gmail.com','$2b$10$GVCqeir3/.7XwonylKtuFeEacb6MCrsVd3I.NksHwiDiaF8g4hYiu',NULL,NULL,NULL,NULL),(15,'user','2021-07-02 13:30:05','Chloe','Boilon','chloe@gmail.com','$2b$10$RfpEz7QJA8t30GsLLOvB7u0CGuCUHgV50idoPy30VYj32lkO11vEm',NULL,NULL,NULL,NULL),(16,'user','2021-07-02 14:11:30','Eva','BOILON','evaboilon@gmail.com','$2b$10$vY3ET5JLvTPLp7x9mPf/HOSq5ixn2W8cJEZMTksq2TbWcyzM3ZTMe',NULL,NULL,NULL,NULL),(17,'user','2021-07-02 15:11:27','Elya','ZANONCELLI','elya@gmail.com','$2b$10$OP9aLroTiTRY1gvbbhknbuK0bCWSWetlaF2XVteymCV07ao0DotCq','http://localhost:4200/images/index1.jpg1625238793082.jpeg','Voyage','Commercial','elya@linkedin.com');
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

-- Dump completed on 2021-07-05 14:44:02
