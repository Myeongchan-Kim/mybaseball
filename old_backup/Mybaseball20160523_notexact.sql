CREATE DATABASE  IF NOT EXISTS `mybaseball` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mybaseball`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: mybaseball
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `batter_record`
--

DROP TABLE IF EXISTS `batter_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batter_record` (
  `game_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `total_plate` int(11) DEFAULT NULL,
  `at_bat` int(11) DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `hit2` int(11) DEFAULT NULL,
  `hit3` int(11) DEFAULT NULL,
  `hr` int(11) DEFAULT NULL,
  `r` int(11) DEFAULT NULL,
  `rbi` int(11) DEFAULT NULL,
  `bb` int(11) DEFAULT NULL,
  `k` int(11) DEFAULT NULL,
  `hbp` int(11) DEFAULT NULL,
  `sac_fly` int(11) DEFAULT NULL,
  `sac_bunt` int(11) DEFAULT NULL,
  `sb` int(11) DEFAULT NULL,
  `detail` text,
  PRIMARY KEY (`game_id`,`player_id`),
  KEY `fk_batter_record_player1_idx` (`player_id`),
  CONSTRAINT `fk_batter_record_game1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_batter_record_player1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batter_record`
--

LOCK TABLES `batter_record` WRITE;
/*!40000 ALTER TABLE `batter_record` DISABLE KEYS */;
INSERT INTO `batter_record` VALUES (1,75,1,1,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(1,76,3,3,1,1,0,0,2,1,0,0,NULL,0,0,0,NULL),(1,78,4,3,1,0,0,0,2,0,0,2,NULL,0,0,0,NULL),(1,79,2,1,1,0,0,0,0,0,1,0,NULL,0,0,0,NULL),(1,80,4,4,1,1,0,0,1,2,0,2,NULL,0,0,0,NULL),(1,83,4,3,0,2,0,0,2,0,1,0,NULL,0,0,0,NULL),(1,84,4,3,0,0,0,0,0,0,1,0,NULL,0,0,0,NULL),(1,85,1,0,0,0,0,0,2,0,1,0,NULL,0,0,0,NULL),(1,86,2,0,0,0,0,0,2,0,2,0,NULL,0,0,0,NULL),(1,88,4,4,1,0,0,0,0,1,0,0,NULL,0,0,0,NULL),(1,91,3,3,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(1,142,4,4,1,0,0,0,1,2,0,0,NULL,0,0,0,NULL),(1,143,1,1,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(2,75,3,1,0,0,0,0,0,0,2,0,NULL,0,1,0,NULL),(2,76,3,2,2,0,0,0,0,2,1,0,NULL,0,0,1,NULL),(2,78,3,0,0,0,0,0,0,1,3,0,NULL,0,0,0,NULL),(2,79,3,3,0,0,0,0,0,0,0,3,NULL,0,0,0,NULL),(2,80,3,1,0,0,0,0,1,1,2,0,NULL,0,1,0,NULL),(2,87,4,4,0,2,0,0,2,0,0,1,NULL,0,0,0,NULL),(2,91,3,3,1,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(2,143,3,1,0,0,0,0,1,0,2,0,NULL,0,0,0,NULL),(3,76,4,3,2,1,0,0,3,2,0,0,NULL,0,0,2,NULL),(3,80,4,4,0,0,0,0,1,0,0,1,NULL,0,0,0,NULL),(3,83,4,3,1,1,0,0,2,1,0,0,NULL,0,0,0,NULL),(3,84,4,4,2,0,0,0,1,3,0,0,NULL,0,0,0,NULL),(3,86,3,1,1,0,0,0,2,0,1,0,NULL,0,0,2,NULL),(3,87,2,2,1,0,0,0,1,0,0,1,NULL,0,0,0,NULL),(3,88,3,3,1,0,0,0,2,0,0,0,NULL,0,0,2,NULL),(3,91,1,1,1,0,0,0,1,0,0,0,NULL,0,0,0,NULL),(3,142,4,3,2,1,0,0,3,1,1,0,NULL,0,0,1,NULL),(3,143,3,2,1,0,0,0,0,1,0,0,NULL,0,0,0,NULL),(4,75,3,2,1,0,0,0,1,1,1,1,NULL,0,0,1,NULL),(4,76,4,1,0,0,0,0,2,0,3,1,NULL,0,0,2,NULL),(4,78,3,0,0,0,0,0,1,1,2,0,NULL,0,0,1,NULL),(4,83,4,3,1,1,0,0,2,2,1,0,NULL,0,0,1,NULL),(4,84,4,3,2,0,0,0,2,3,0,0,NULL,0,0,1,NULL),(4,88,4,3,1,0,0,0,0,1,1,1,NULL,0,0,0,NULL),(4,91,3,3,1,1,0,0,1,3,0,0,NULL,0,0,0,NULL),(4,96,2,1,1,0,0,0,1,1,1,0,NULL,0,0,1,NULL),(4,141,4,2,1,0,0,0,2,0,1,1,NULL,0,0,2,NULL),(5,75,1,1,0,0,0,0,1,1,0,0,NULL,0,0,2,NULL),(5,76,1,1,0,1,0,0,0,0,0,0,NULL,0,0,0,NULL),(5,84,1,1,0,0,0,0,0,0,0,0,NULL,0,0,0,NULL),(5,85,1,1,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(5,86,1,1,1,0,0,0,0,1,0,0,NULL,0,0,0,NULL),(5,87,2,1,0,0,0,0,1,0,1,1,NULL,0,0,1,NULL),(5,88,1,1,0,0,0,0,0,0,0,0,NULL,0,0,0,NULL),(5,91,2,1,1,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(5,96,1,1,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(5,142,1,1,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(6,75,3,3,1,0,0,0,0,1,0,0,NULL,0,0,0,NULL),(6,76,4,2,1,0,0,0,0,1,2,0,NULL,0,0,0,NULL),(6,78,4,4,0,1,0,0,2,0,0,1,NULL,0,0,0,NULL),(6,83,4,4,2,0,0,0,1,0,0,0,NULL,0,0,1,NULL),(6,84,2,2,0,0,0,0,0,0,0,0,NULL,0,0,0,NULL),(6,87,4,3,2,0,0,0,1,1,1,0,NULL,0,0,0,NULL),(6,88,4,1,1,0,0,0,1,0,3,0,NULL,0,0,0,NULL),(6,91,3,3,2,1,0,0,2,0,0,0,NULL,0,0,1,NULL),(6,96,2,1,0,0,0,0,0,2,1,1,NULL,0,0,0,NULL),(6,142,4,3,1,0,0,0,0,1,1,0,NULL,0,0,1,NULL),(7,75,1,1,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(7,76,2,1,0,1,0,0,2,0,1,0,NULL,0,0,1,NULL),(7,78,1,0,0,0,0,0,0,0,1,0,NULL,0,0,1,NULL),(7,80,3,3,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(7,84,3,3,0,0,0,0,1,0,0,0,NULL,0,0,1,NULL),(7,87,3,3,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(7,88,2,1,0,0,0,0,0,0,1,1,NULL,0,0,0,NULL),(7,91,3,2,1,0,0,0,0,3,0,0,NULL,1,0,0,NULL),(7,96,1,1,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(7,141,1,1,0,0,0,0,1,0,0,0,NULL,0,0,0,NULL),(7,142,3,3,1,0,0,0,1,0,0,0,NULL,0,0,1,NULL),(7,143,2,2,1,0,0,0,1,0,0,1,NULL,0,0,0,NULL),(9,75,2,2,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(9,76,3,2,0,1,0,0,0,1,1,0,NULL,0,0,0,NULL),(9,80,2,2,0,1,0,0,0,0,0,0,NULL,0,0,2,NULL),(9,83,3,3,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(9,87,3,1,0,0,0,0,2,0,2,0,NULL,0,0,2,NULL),(9,88,3,3,1,1,0,0,2,1,0,1,NULL,0,0,1,NULL),(9,91,3,3,2,0,0,0,0,2,0,0,NULL,0,0,2,NULL),(9,142,3,3,0,1,0,0,1,2,0,0,NULL,0,0,1,NULL),(9,143,2,1,0,0,0,0,0,0,1,1,NULL,0,0,0,NULL),(10,78,3,2,0,0,0,0,1,0,1,0,NULL,0,0,4,NULL),(10,83,3,3,0,0,0,0,1,2,0,0,NULL,0,0,1,NULL),(10,84,3,2,0,1,0,0,2,0,1,0,NULL,0,0,3,NULL),(10,85,3,2,0,0,0,0,1,0,1,2,NULL,0,0,2,NULL),(10,86,3,3,0,2,0,0,3,0,0,0,NULL,0,0,2,NULL),(10,88,3,3,0,1,0,0,0,2,0,2,NULL,0,0,1,NULL),(10,91,3,2,0,0,0,0,2,0,1,0,NULL,0,0,1,NULL),(10,96,3,2,0,0,0,0,1,0,1,2,NULL,0,0,1,NULL),(10,143,3,3,0,0,0,0,0,0,0,2,NULL,0,0,0,NULL),(11,76,3,2,0,0,0,0,0,1,1,1,NULL,0,0,1,NULL),(11,78,2,1,1,0,0,0,0,1,0,0,NULL,0,0,1,NULL),(11,83,3,3,1,0,0,0,2,2,0,0,NULL,0,0,2,NULL),(11,84,3,3,2,0,0,0,1,1,1,1,NULL,0,0,1,NULL),(11,86,3,3,1,0,0,0,1,1,0,1,NULL,0,0,2,NULL),(11,87,3,1,1,0,0,0,1,0,1,0,NULL,0,0,2,NULL),(11,88,3,3,0,0,0,0,1,0,0,1,NULL,0,0,0,NULL),(11,91,3,3,1,0,0,0,1,2,0,0,NULL,0,0,1,NULL),(11,142,3,2,0,0,0,0,1,0,1,1,NULL,1,0,0,NULL),(12,75,3,1,0,0,0,0,0,0,2,0,NULL,0,1,0,NULL),(12,76,3,2,0,0,0,0,0,0,1,0,NULL,1,1,0,NULL),(12,80,3,3,0,0,0,0,0,0,0,2,NULL,0,1,0,NULL),(12,83,3,3,1,0,0,0,0,0,0,0,NULL,1,1,1,NULL),(12,84,3,2,0,0,0,0,0,0,1,0,NULL,0,2,2,NULL),(12,86,3,2,0,0,0,0,0,0,1,0,NULL,0,2,1,NULL),(12,88,3,3,0,0,0,0,0,0,0,0,NULL,2,1,0,NULL),(12,91,3,3,2,0,0,0,0,0,0,0,NULL,0,1,2,NULL),(12,142,3,2,0,0,0,0,0,0,1,0,NULL,1,1,1,NULL),(13,75,3,3,0,0,0,0,0,0,0,2,NULL,0,0,0,NULL),(13,76,4,3,2,0,0,0,2,2,1,0,NULL,0,0,0,NULL),(13,78,3,1,0,0,0,0,1,0,2,0,NULL,0,0,0,NULL),(13,83,1,0,0,0,0,0,1,0,1,0,NULL,0,0,0,NULL),(13,84,3,3,1,1,0,0,0,2,0,0,NULL,0,0,0,NULL),(13,85,2,2,0,0,0,0,0,0,0,1,NULL,0,0,1,NULL),(13,87,4,2,0,0,0,0,1,0,2,1,NULL,0,0,0,NULL),(13,88,4,4,0,2,0,0,1,2,0,1,NULL,0,0,0,NULL),(13,91,3,3,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(13,142,4,3,0,0,0,0,1,0,1,0,NULL,0,0,1,NULL),(14,75,2,1,0,0,0,0,0,0,1,0,NULL,0,0,0,NULL),(14,76,2,1,0,0,0,0,0,0,1,1,NULL,0,0,0,NULL),(14,78,2,2,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(14,83,2,2,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(14,84,2,2,0,1,0,0,0,2,0,1,NULL,0,0,0,NULL),(14,87,3,2,0,0,0,0,1,0,1,2,NULL,0,0,2,NULL),(14,88,2,1,0,0,0,0,0,0,1,1,NULL,0,0,0,NULL),(14,91,2,0,0,0,0,0,1,0,2,0,NULL,0,0,1,NULL),(14,92,2,1,0,0,0,0,0,0,1,0,NULL,0,0,0,NULL),(15,75,3,2,2,0,0,0,2,1,1,0,NULL,0,0,2,NULL),(15,76,4,2,1,0,0,0,3,0,2,0,NULL,0,0,2,NULL),(15,81,4,3,0,0,0,0,0,0,1,1,NULL,0,0,0,NULL),(15,84,4,2,0,0,0,0,0,1,2,1,NULL,0,0,1,NULL),(15,86,4,2,0,0,0,0,1,0,1,0,NULL,0,0,0,NULL),(15,87,4,3,1,0,0,0,2,4,1,0,NULL,0,0,2,NULL),(15,88,4,3,1,0,0,0,1,1,1,0,NULL,0,0,1,NULL),(15,91,4,3,1,1,0,0,0,2,1,1,NULL,0,0,0,NULL),(15,142,4,2,0,0,0,0,0,0,2,0,NULL,0,0,0,NULL),(17,75,3,3,0,0,0,0,0,0,0,2,NULL,0,0,0,NULL),(17,76,3,3,1,1,0,0,2,1,0,0,NULL,0,0,2,NULL),(17,78,3,3,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(17,81,3,3,0,1,0,0,1,2,0,1,NULL,0,0,0,NULL),(17,86,3,2,0,1,0,0,0,1,1,0,NULL,0,0,2,NULL),(17,87,3,3,0,1,0,0,1,1,0,1,NULL,0,0,0,NULL),(17,92,2,1,0,0,0,0,1,0,1,1,NULL,0,0,0,NULL),(17,96,2,2,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(17,144,2,0,0,0,0,0,1,0,2,0,NULL,0,0,1,NULL),(18,75,5,4,2,0,0,0,1,2,1,2,NULL,0,0,0,NULL),(18,76,5,4,2,0,0,0,3,3,0,0,NULL,1,0,0,NULL),(18,80,5,1,1,0,0,0,2,2,3,0,NULL,1,0,1,NULL),(18,81,5,3,1,2,0,0,4,1,2,0,NULL,0,0,3,NULL),(18,82,5,3,0,0,0,0,2,0,2,2,NULL,0,0,0,NULL),(18,83,6,6,1,1,0,0,3,3,0,0,NULL,0,0,0,NULL),(18,86,6,3,3,0,0,0,3,3,3,0,NULL,0,0,0,NULL),(18,87,6,2,1,0,0,1,4,6,4,0,NULL,0,0,1,NULL),(18,88,5,3,0,0,0,0,2,3,2,0,NULL,0,0,0,NULL),(20,75,2,2,1,0,0,0,0,2,0,0,NULL,0,0,0,NULL),(20,76,2,1,0,0,0,0,0,0,1,1,NULL,0,0,1,NULL),(20,78,2,1,0,0,0,0,0,0,1,0,NULL,0,0,1,NULL),(20,80,1,1,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(20,81,3,3,1,0,0,0,1,0,0,0,NULL,0,0,2,NULL),(20,83,3,3,1,0,0,0,0,0,0,1,NULL,0,0,1,NULL),(20,84,3,1,0,0,0,0,1,0,2,0,NULL,0,0,1,NULL),(20,86,3,3,0,0,0,0,0,0,0,2,NULL,0,0,0,NULL),(20,90,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,NULL),(20,91,3,3,2,0,0,0,1,1,0,0,NULL,0,0,0,NULL),(20,96,2,2,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(21,75,2,1,0,0,0,0,1,0,1,0,NULL,0,0,0,NULL),(21,76,3,3,2,0,0,0,1,2,0,0,NULL,0,0,2,NULL),(21,78,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,NULL),(21,80,2,1,0,0,0,0,1,0,1,1,NULL,0,0,0,NULL),(21,81,3,3,0,0,0,0,0,0,0,3,NULL,0,0,0,NULL),(21,82,2,2,0,0,0,0,0,0,0,2,NULL,0,0,0,NULL),(21,83,3,1,0,0,0,0,1,3,2,1,NULL,0,0,3,NULL),(21,84,3,2,0,0,0,0,1,1,1,1,NULL,0,0,1,NULL),(21,87,3,3,1,0,0,0,1,1,0,2,NULL,0,0,1,NULL),(21,90,3,1,0,0,0,0,1,0,2,0,NULL,0,0,0,NULL),(21,91,1,1,0,0,0,0,0,0,0,0,NULL,0,0,0,NULL),(22,76,3,3,1,1,0,0,2,0,0,0,NULL,0,0,3,NULL),(22,80,3,3,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(22,81,3,2,1,0,0,0,3,0,1,0,NULL,0,0,3,NULL),(22,84,3,3,0,0,0,0,0,1,0,0,NULL,0,0,0,NULL),(22,86,3,3,1,1,0,0,2,1,0,0,NULL,0,0,4,NULL),(22,87,4,4,0,1,0,0,1,0,0,2,NULL,0,0,1,NULL),(22,88,3,1,0,0,0,0,0,0,2,0,NULL,0,0,3,NULL),(22,91,3,2,0,0,0,0,0,1,1,0,NULL,0,0,0,NULL),(22,92,3,2,0,0,0,0,0,0,1,1,NULL,0,0,1,NULL),(23,75,4,3,2,0,0,0,0,1,1,0,NULL,0,0,2,NULL),(23,76,5,3,0,0,0,0,4,0,2,0,NULL,0,0,2,NULL),(23,78,2,2,0,0,0,0,0,0,0,2,NULL,0,0,0,NULL),(23,80,4,3,0,0,0,0,0,1,1,0,NULL,0,0,1,NULL),(23,82,4,2,1,0,0,0,2,0,2,1,NULL,0,0,1,NULL),(23,83,5,5,1,0,0,0,1,1,0,0,NULL,0,0,1,NULL),(23,84,5,4,1,0,1,0,3,3,1,0,NULL,0,0,3,NULL),(23,86,5,3,1,1,0,0,2,1,2,0,NULL,0,0,0,NULL),(23,88,4,4,1,1,0,0,0,2,0,0,NULL,0,0,0,NULL),(23,92,2,2,0,0,0,0,0,0,0,2,NULL,0,0,0,NULL),(24,75,3,2,0,0,0,0,1,0,1,0,NULL,0,0,3,NULL),(24,78,4,3,0,1,0,0,1,2,1,2,NULL,0,0,1,NULL),(24,79,3,3,0,0,0,0,0,1,0,2,NULL,0,0,0,NULL),(24,80,3,2,0,0,1,0,1,1,1,1,NULL,0,0,1,NULL),(24,83,4,3,0,0,0,0,1,1,1,1,NULL,0,0,2,NULL),(24,85,2,2,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(24,86,1,1,1,0,0,0,1,1,0,0,NULL,0,0,1,NULL),(24,87,4,3,2,0,0,0,1,0,1,0,NULL,0,0,2,NULL),(24,88,3,2,0,0,0,0,0,0,1,0,NULL,0,0,0,NULL),(24,92,3,2,1,0,0,0,2,0,1,1,NULL,0,0,2,NULL),(25,75,2,2,1,0,0,0,1,1,0,0,NULL,0,0,0,NULL),(25,81,3,2,0,0,0,0,0,1,0,1,NULL,0,0,0,NULL),(25,83,3,3,2,0,0,0,1,0,0,0,NULL,0,0,2,NULL),(25,85,2,1,0,0,0,0,2,1,1,0,NULL,0,0,0,NULL),(25,87,3,3,1,0,1,1,2,3,0,0,NULL,0,0,1,NULL),(25,89,3,2,0,0,0,0,1,0,1,0,NULL,0,0,1,NULL),(25,90,2,1,0,0,0,0,1,1,1,0,NULL,0,0,0,NULL),(25,92,3,1,0,0,0,0,2,0,2,1,NULL,0,0,0,NULL),(25,94,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,NULL),(25,95,3,2,0,0,0,0,0,0,1,1,NULL,0,0,1,NULL),(26,74,2,1,0,0,0,0,0,0,1,1,NULL,0,0,0,NULL),(26,75,1,1,0,0,0,0,1,1,0,0,NULL,0,0,0,NULL),(26,81,4,4,2,0,0,0,2,1,0,2,NULL,0,0,1,NULL),(26,82,1,1,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(26,83,4,4,2,0,1,0,2,3,0,0,NULL,0,0,4,NULL),(26,84,4,2,1,1,0,0,2,1,2,0,NULL,0,0,5,NULL),(26,85,3,3,1,0,0,0,0,0,0,2,NULL,0,0,0,NULL),(26,87,4,3,1,0,0,0,1,2,1,2,NULL,0,0,0,NULL),(26,89,4,4,2,0,0,0,1,3,0,1,NULL,0,0,2,NULL),(26,90,4,4,1,0,0,0,1,0,0,1,NULL,0,0,2,NULL),(26,92,4,3,0,0,0,0,1,0,1,0,NULL,0,0,0,NULL),(29,57,2,2,0,0,0,0,0,0,0,2,NULL,0,0,0,NULL),(29,58,2,0,0,0,0,0,0,0,2,0,NULL,0,0,0,NULL),(29,60,2,1,1,0,0,0,0,1,0,0,NULL,1,0,0,NULL),(29,61,2,2,1,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(29,62,3,3,1,0,0,0,1,0,0,1,NULL,0,0,0,NULL),(29,65,2,2,1,0,0,0,0,0,0,0,NULL,0,0,0,NULL),(29,66,2,2,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(29,69,2,1,0,0,0,0,0,0,1,0,NULL,0,0,0,NULL),(29,71,2,2,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(29,97,3,2,0,1,0,0,3,1,0,0,NULL,0,0,0,NULL),(29,100,2,2,0,1,0,0,1,0,0,0,NULL,0,0,0,NULL),(29,103,2,1,0,0,0,0,1,0,1,0,NULL,0,0,0,NULL),(29,106,3,3,2,0,0,0,2,1,0,0,NULL,0,0,0,NULL),(29,110,2,2,1,0,0,0,0,2,0,0,NULL,0,0,0,NULL),(29,115,3,2,1,0,0,0,0,2,1,0,NULL,0,0,0,NULL),(29,116,3,3,2,0,0,0,1,1,0,0,NULL,0,0,0,NULL),(29,118,3,2,1,1,0,0,2,0,1,0,NULL,0,0,0,NULL),(29,120,2,2,0,0,0,0,1,0,1,1,NULL,0,0,0,NULL),(31,11,3,3,1,1,0,0,1,1,0,0,NULL,0,0,0,NULL),(31,12,3,3,1,0,0,0,2,0,0,0,NULL,0,0,0,NULL),(31,13,2,2,0,0,0,0,1,0,0,1,NULL,0,0,0,NULL),(31,14,2,1,0,0,0,0,1,0,1,1,NULL,0,0,0,NULL),(31,15,3,2,0,0,0,0,1,1,1,2,NULL,0,0,0,NULL),(31,17,3,3,1,1,0,0,1,2,0,0,NULL,0,0,0,NULL),(31,21,3,3,0,0,0,0,0,0,0,2,NULL,0,0,0,NULL),(31,22,3,3,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(31,97,2,1,0,0,0,0,1,0,1,0,NULL,0,0,0,NULL),(31,99,2,1,0,0,0,0,1,0,1,0,NULL,0,0,0,NULL),(31,100,1,1,1,0,0,0,0,0,0,0,NULL,0,0,0,NULL),(31,102,3,1,0,0,0,0,0,0,2,1,NULL,0,0,0,NULL),(31,103,2,2,0,0,0,0,0,1,0,1,NULL,0,0,0,NULL),(31,106,1,1,0,0,0,0,1,0,0,0,NULL,0,0,0,NULL),(31,107,1,1,0,0,0,0,0,0,0,0,NULL,0,0,0,NULL),(31,108,2,1,0,0,0,0,0,0,1,0,NULL,0,0,0,NULL),(31,110,2,2,1,0,0,0,0,1,0,1,NULL,0,0,0,NULL),(31,111,1,1,0,0,0,1,1,2,0,0,NULL,0,0,0,NULL),(31,115,3,2,0,0,0,0,0,1,1,0,NULL,0,0,0,NULL),(31,116,3,3,0,1,0,0,1,0,0,1,NULL,0,0,0,NULL),(31,118,3,2,0,1,0,0,1,1,1,0,NULL,0,0,0,NULL),(33,1,2,2,0,0,0,0,1,0,1,0,NULL,0,0,0,NULL),(33,2,1,1,0,0,0,0,0,1,0,0,NULL,0,0,0,NULL),(33,3,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,NULL),(33,4,2,1,0,0,0,0,0,0,1,0,NULL,0,0,0,NULL),(33,5,2,2,0,0,0,0,0,0,0,0,NULL,0,0,0,NULL),(33,6,2,1,0,0,0,0,0,0,1,1,NULL,0,0,0,NULL),(33,7,1,1,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(33,8,1,1,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(33,9,1,1,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(33,122,3,3,3,0,0,0,4,2,0,0,NULL,0,0,0,NULL),(33,123,3,2,0,0,0,0,3,1,1,0,NULL,0,0,0,NULL),(33,126,3,3,0,0,0,0,3,1,0,0,NULL,0,0,0,NULL),(33,130,4,4,1,1,0,0,3,1,1,0,NULL,0,0,0,NULL),(33,132,3,2,2,0,0,0,4,5,1,0,NULL,0,0,0,NULL),(33,134,3,3,1,2,0,0,4,7,0,0,NULL,0,0,0,NULL),(33,135,4,4,3,0,0,0,3,4,1,0,NULL,0,0,0,NULL),(33,137,4,4,3,0,0,0,3,3,0,1,NULL,0,0,0,NULL),(33,138,3,3,2,0,0,0,3,2,0,1,NULL,0,0,0,NULL),(33,139,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,NULL),(37,27,3,3,2,0,0,0,2,1,0,1,NULL,0,0,0,NULL),(37,28,3,2,0,0,0,0,0,0,1,1,NULL,0,0,0,NULL),(37,29,3,2,0,0,0,0,0,0,1,2,NULL,0,0,0,NULL),(37,30,3,3,0,1,0,0,1,2,0,1,NULL,0,0,0,NULL),(37,31,3,3,0,0,0,0,0,0,0,0,NULL,0,0,0,NULL),(37,32,4,4,0,0,0,0,1,0,0,2,NULL,0,0,0,NULL),(37,35,3,1,0,0,0,0,0,1,2,1,NULL,0,0,0,NULL),(37,36,3,2,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(37,38,3,3,0,1,0,0,0,1,0,1,NULL,0,0,0,NULL),(37,58,3,2,1,0,0,0,0,0,1,0,NULL,0,0,0,NULL),(37,59,4,4,0,0,0,0,0,0,0,1,NULL,0,0,0,NULL),(37,60,3,3,1,0,0,0,0,0,0,0,NULL,0,0,1,NULL),(37,65,3,2,0,0,0,0,0,0,1,0,NULL,0,0,0,NULL),(37,67,4,3,0,0,0,0,1,0,1,1,NULL,0,0,1,NULL),(37,68,3,2,0,1,0,0,1,1,1,0,NULL,0,0,1,NULL),(37,73,3,3,2,1,0,0,1,1,0,0,NULL,0,0,0,NULL);
/*!40000 ALTER TABLE `batter_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `league_id` int(11) NOT NULL,
  `round` varchar(45) NOT NULL,
  `gameday` date DEFAULT NULL,
  `gametime` time DEFAULT NULL,
  `hometeam` int(11) DEFAULT NULL,
  `awayteam` int(11) DEFAULT NULL,
  `result` varchar(5) NOT NULL,
  `hscore` int(11) DEFAULT NULL,
  `ascore` int(11) DEFAULT NULL,
  `scoreboard` text,
  `location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `fk_game_team_idx` (`hometeam`),
  KEY `fk_game_team1_idx` (`awayteam`),
  KEY `fk_game_league1_idx` (`league_id`),
  CONSTRAINT `fk_game_league1` FOREIGN KEY (`league_id`) REFERENCES `league` (`league_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_team` FOREIGN KEY (`hometeam`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_team1` FOREIGN KEY (`awayteam`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,3,'비공식','2010-01-18',NULL,1,8,'패',0,1,NULL,NULL),(2,3,'비공식','2010-01-26',NULL,1,8,'패',4,8,NULL,NULL),(3,3,'비공식','2010-02-22',NULL,1,2,'무',0,0,NULL,NULL),(4,3,'비공식','2010-03-02',NULL,1,20,'패',0,1,NULL,NULL),(5,3,'비공식','2010-03-15',NULL,1,2,'무',2,2,NULL,NULL),(6,1,'리그경기','2011-03-15',NULL,1,10,'패',7,9,NULL,NULL),(7,1,'리그경기','2010-03-29',NULL,1,2,'패',6,15,NULL,NULL),(8,1,'리그경기','2010-04-05',NULL,1,8,'승',12,11,NULL,NULL),(9,2,'리그경기','2010-04-12',NULL,1,11,'패',6,11,NULL,NULL),(10,3,'비공식','2010-04-12',NULL,1,12,'패',10,14,NULL,NULL),(11,2,'리그경기','2010-04-26',NULL,1,14,'승',7,5,NULL,NULL),(12,2,'리그경기','2010-05-10',NULL,1,13,'패',4,11,NULL,NULL),(13,1,'리그경기','2010-05-17',NULL,1,4,'패',7,10,NULL,NULL),(14,2,'리그경기','2010-05-24',NULL,1,17,'패',2,14,NULL,NULL),(15,1,'리그경기','2010-06-07',NULL,1,7,'승',9,8,NULL,NULL),(16,3,'비공식','2010-06-28',NULL,1,2,'패',3,15,NULL,NULL),(17,2,'리그경기','2010-07-12',NULL,1,19,'패',6,11,NULL,NULL),(18,1,'리그경기','2010-08-30',NULL,1,16,'승',24,9,NULL,NULL),(19,3,'비공식','2010-06-05',NULL,1,18,'패',3,7,NULL,NULL),(20,2,'리그경기','2010-09-27',NULL,1,13,'패',3,10,NULL,NULL),(21,2,'리그경기','2010-09-27',NULL,1,17,'패',7,8,NULL,NULL),(22,2,'리그경기','2010-10-25',NULL,1,12,'패',8,10,NULL,NULL),(23,2,'리그경기','2010-11-08',NULL,1,11,'승',12,8,NULL,NULL),(24,2,'리그경기','2011-12-13',NULL,1,19,'패',8,15,NULL,NULL),(25,2,'리그경기','2011-02-28',NULL,1,14,'패',10,17,NULL,NULL),(26,2,'리그경기','2011-02-28',NULL,1,12,'패',11,13,NULL,NULL),(27,1,'리그경기','2010-10-04',NULL,1,6,'패',11,12,NULL,NULL),(28,1,'리그경기','2010-11-01',NULL,1,7,'패',4,15,NULL,NULL),(29,1,'리그경기','2010-02-26',NULL,7,2,'패',4,10,NULL,NULL),(31,1,'리그경기','2010-02-26',NULL,2,4,'무',7,7,NULL,NULL),(33,1,'리그경기','2010-03-05',NULL,8,3,'승',18,0,NULL,NULL),(35,1,'리그경기','2010-03-05',NULL,8,6,'승',10,0,NULL,NULL),(37,1,'리그경기','2010-03-12',NULL,5,7,'패',5,7,NULL,NULL),(39,1,'리그경기','2010-03-12',NULL,8,7,'패',2,9,NULL,NULL);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `join_team`
--

DROP TABLE IF EXISTS `join_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `join_team` (
  `team_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `title` varchar(10) DEFAULT '주전',
  `backnumber` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`team_id`,`player_id`),
  KEY `fk_team_player_team1_idx` (`team_id`),
  KEY `fk_team_player_player1_idx` (`player_id`),
  CONSTRAINT `fk_team_player_player1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_player_team1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `join_team`
--

LOCK TABLES `join_team` WRITE;
/*!40000 ALTER TABLE `join_team` DISABLE KEYS */;
INSERT INTO `join_team` VALUES (1,74,'주전','56'),(1,75,'주전','12'),(1,76,'주전','25'),(1,77,'주전','44'),(1,78,'주전','3'),(1,79,'주전','29'),(1,80,'주전','31'),(1,81,'주전','5'),(1,82,'주전','9'),(1,83,'주전','7'),(1,84,'주전','77'),(1,85,'주전','1'),(1,86,'주전','61'),(1,87,'주전','4'),(1,88,'주전','11'),(1,89,'주전','8'),(1,90,'주전','37'),(1,91,'주전','20'),(1,92,'주전','10'),(1,93,'주전','33'),(1,94,'주전','22'),(1,95,'주전','51'),(1,96,'주전','99'),(1,141,'주전',NULL),(1,142,'주전',NULL),(1,143,'주전',NULL),(1,144,'주전',NULL),(2,97,'주전','10'),(2,98,'주전','33'),(2,99,'주전','50'),(2,100,'주전','2'),(2,101,'주전','3'),(2,102,'주전','7'),(2,103,'주전','8'),(2,104,'주전','38'),(2,105,'주전','39'),(2,106,'주전','12'),(2,107,'주전','13'),(2,108,'주전','14'),(2,109,'주전','5'),(2,110,'주전','20'),(2,111,'주전','31'),(2,112,'주전','34'),(2,113,'주전','35'),(2,114,'주전','15'),(2,115,'주전','45'),(2,116,'주전','19'),(2,117,'주전','53'),(2,118,'주전','56'),(2,119,'주전','61'),(2,120,'주전','24'),(2,121,'주전','29'),(3,1,'주전','51'),(3,2,'주전','0'),(3,3,'주전','7'),(3,4,'주전',NULL),(3,5,'주전','9'),(3,6,'주전','17'),(3,7,'주전','12'),(3,8,'주전','10'),(3,9,'주전','1'),(4,10,'주전','19'),(4,11,'주전','44'),(4,12,'주전','25'),(4,13,'주전','13'),(4,14,'주전','5'),(4,15,'주전','14'),(4,16,'주전','23'),(4,17,'주전','35'),(4,18,'주전','45'),(4,19,'주전','29'),(4,20,'주전','7'),(4,21,'주전','10'),(4,22,'주전','32'),(4,23,'주전','10--1'),(4,24,'주전','22'),(5,25,'주전','61'),(5,26,'주전','0'),(5,27,'주전','20'),(5,28,'주전','1'),(5,29,'주전','28'),(5,30,'주전','58'),(5,31,'주전','12'),(5,32,'주전','3'),(5,33,'주전','10'),(5,34,'주전','33'),(5,35,'주전','7'),(5,36,'주전','8'),(5,37,'주전','29'),(5,38,'주전','40'),(6,39,'주전','1'),(6,40,'주전','68'),(6,41,'주전','7'),(6,42,'주전',NULL),(6,43,'주전','13'),(6,44,'주전','5'),(6,45,'주전','12'),(6,46,'주전','82'),(6,47,'주전','18'),(6,48,'주전',NULL),(6,49,'주전','44'),(6,50,'주전','22'),(6,51,'주전','2'),(6,52,'주전','21'),(6,53,'주전','61'),(6,54,'주전',NULL),(6,55,'주전',NULL),(6,56,'주전',NULL),(7,57,'주전','39'),(7,58,'주전','29'),(7,59,'주전','5'),(7,60,'주전','52'),(7,61,'주전','99'),(7,62,'주전','41'),(7,63,'주전','7'),(7,64,'주전','61'),(7,65,'주전','8'),(7,66,'주전','24'),(7,67,'주전','13'),(7,68,'주전','50'),(7,69,'주전','6'),(7,70,'주전','19'),(7,71,'주전','10'),(7,72,'주전','28'),(7,73,'주전','45'),(8,122,'주전','51'),(8,123,'주전','1'),(8,125,'주전','5'),(8,126,'주전','8'),(8,127,'주전','22'),(8,128,'주전','25'),(8,129,'주전','29'),(8,130,'주전','33'),(8,131,'주전','36'),(8,132,'주전','37'),(8,133,'주전','49'),(8,134,'주전','50'),(8,135,'주전','53'),(8,136,'주전','77'),(8,137,'주전','12'),(8,138,'주전','17'),(8,139,'주전','14'),(8,140,'주전','13');
/*!40000 ALTER TABLE `join_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `league` (
  `league_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_num` int(11) NOT NULL,
  `league_year` year(4) NOT NULL,
  `league_name` varchar(45) NOT NULL,
  PRIMARY KEY (`league_id`),
  KEY `fk_league_organization1_idx` (`org_num`),
  CONSTRAINT `fk_league_organization1` FOREIGN KEY (`org_num`) REFERENCES `organization` (`org_num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league`
--

LOCK TABLES `league` WRITE;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` VALUES (1,1,2010,'한양리그'),(2,2,2010,'청량중 토요리그'),(3,3,2010,'비공식경기');
/*!40000 ALTER TABLE `league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `org_num` int(11) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(45) NOT NULL,
  PRIMARY KEY (`org_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'한양대학교 야구연합회'),(2,'쥬신 청량중리그'),(3,'비공식 경기');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participate`
--

DROP TABLE IF EXISTS `participate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participate` (
  `league_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `record` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`league_id`,`team_id`),
  KEY `fk_participate_legue1` (`league_id`),
  KEY `fk_participate_team1` (`team_id`),
  CONSTRAINT `fk_participate_legue1` FOREIGN KEY (`league_id`) REFERENCES `league` (`league_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participate_team1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participate`
--

LOCK TABLES `participate` WRITE;
/*!40000 ALTER TABLE `participate` DISABLE KEYS */;
INSERT INTO `participate` VALUES (1,1,''),(1,2,''),(1,3,''),(1,4,''),(1,5,''),(1,6,''),(1,7,''),(1,8,''),(1,10,''),(1,16,''),(2,1,''),(2,11,''),(2,12,''),(2,13,''),(2,14,''),(2,17,''),(2,19,''),(3,1,''),(3,2,''),(3,3,''),(3,4,''),(3,5,''),(3,6,''),(3,7,''),(3,8,''),(3,10,''),(3,11,''),(3,12,''),(3,13,''),(3,14,''),(3,15,''),(3,16,''),(3,17,''),(3,18,''),(3,19,''),(3,20,'');
/*!40000 ALTER TABLE `participate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pitcher_record`
--

DROP TABLE IF EXISTS `pitcher_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pitcher_record` (
  `game_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `out_get` int(11) DEFAULT NULL,
  `winner` tinyint(1) DEFAULT NULL,
  `hold` tinyint(1) DEFAULT NULL,
  `k` int(11) DEFAULT NULL,
  `bb` int(11) DEFAULT NULL,
  `hbp` int(11) DEFAULT NULL,
  `run` int(11) DEFAULT NULL,
  `earn_run` int(11) DEFAULT NULL,
  `detail` text,
  PRIMARY KEY (`game_id`,`player_id`),
  KEY `fk_pitcher_record_game1_idx` (`game_id`),
  KEY `fk_pitcher_record_player1_idx` (`player_id`),
  CONSTRAINT `fk_pitcher_record_game1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pitcher_record_player1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pitcher_record`
--

LOCK TABLES `pitcher_record` WRITE;
/*!40000 ALTER TABLE `pitcher_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `pitcher_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `player_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_name` varchar(45) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `pro` tinyint(1) DEFAULT NULL,
  `highschool` varchar(45) DEFAULT NULL,
  `main_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'최경호','1986-01-16',0,NULL,1),(2,'정인욱','1987-09-17',0,NULL,2),(3,'유환수','1987-08-17',0,NULL,3),(4,'김건희','1987-05-06',0,NULL,4),(5,'박병석','1989-03-23',0,NULL,5),(6,'최성락','1988-10-06',0,NULL,6),(7,'신수용','1988-09-09',0,NULL,7),(8,'최문규','1986-05-12',0,NULL,8),(9,'최강현','1987-12-23',0,NULL,9),(10,'김낙현','1987-07-01',0,NULL,10),(11,'김동원','1978-02-18',0,NULL,11),(12,'김동윤','1985-03-02',0,NULL,12),(13,'김우환','1987-06-19',0,NULL,0),(14,'김지형','1990-08-22',0,NULL,1),(15,'박지용','1988-01-18',0,NULL,2),(16,'박진석','1986-10-10',0,NULL,3),(17,'박천호','1986-10-08',0,NULL,4),(18,'이명규','1987-12-06',0,NULL,5),(19,'이종후','1987-07-01',0,NULL,6),(20,'이준용','1978-11-15',0,NULL,7),(21,'이호','1986-01-22',0,NULL,8),(22,'정진','1986-10-02',0,NULL,9),(23,'주환익','1986-10-03',0,NULL,10),(24,'한지헌','1985-09-08',0,NULL,11),(25,'권순호','1983-04-20',0,NULL,12),(26,'김경원','1984-09-01',0,NULL,0),(27,'박승환','1987-02-23',0,NULL,1),(28,'유주태','1984-06-19',0,NULL,2),(29,'윤재천','1988-01-15',0,NULL,3),(30,'이겨레','1987-11-02',0,NULL,4),(31,'임성훈','1982-11-22',0,NULL,5),(32,'전병익','1985-08-17',0,NULL,6),(33,'전영표','1983-04-20',0,NULL,7),(34,'황의상','1988-02-24',0,NULL,8),(35,'홍준의','1986-05-19',0,NULL,9),(36,'정현수','1991-01-08',0,NULL,10),(37,'이동훈','1982-12-04',0,NULL,11),(38,'박주형','1989-04-24',0,NULL,12),(39,'김성수','1964-02-20',0,NULL,0),(40,'정웅교','1987-09-22',0,NULL,1),(41,'서종진','1969-02-07',0,NULL,2),(42,'변훈','1966-10-30',0,NULL,3),(43,'김건욱','1970-01-13',0,NULL,4),(44,'김기범','1970-01-29',0,NULL,5),(45,'정인서','1968-10-10',0,NULL,6),(46,'이상목','1970-08-30',0,NULL,7),(47,'표정현','1970-04-15',0,NULL,8),(48,'이상현','1973-11-22',0,NULL,9),(49,'이종용','1987-10-01',0,NULL,10),(50,'홍영민','1983-08-29',0,NULL,11),(51,'이문배','1980-01-31',0,NULL,12),(52,'배관호','1984-07-10',0,NULL,0),(53,'임재관','1984-04-08',0,NULL,1),(54,'차승환','1983-03-22',0,NULL,2),(55,'조기정','1983-11-16',0,NULL,3),(56,'김정우','1986-05-16',0,NULL,4),(57,'서준혁','1984-11-12',0,NULL,5),(58,'오용민','1986-06-18',0,NULL,6),(59,'김우석','1982-05-03',0,NULL,7),(60,'안수한','1986-10-13',0,NULL,8),(61,'조승표','1988-03-01',0,NULL,9),(62,'야나기와 타카유키','1987-04-13',0,NULL,10),(63,'이중배','1986-06-16',0,NULL,11),(64,'박종주','1987-03-23',0,NULL,12),(65,'강기철','1986-08-10',0,NULL,0),(66,'나의석','1983-07-05',0,NULL,1),(67,'신진범','1987-06-09',0,NULL,2),(68,'전경훈','1984-01-17',0,NULL,3),(69,'홍대정','1986-12-26',0,NULL,4),(70,'허정','1988-10-01',0,NULL,5),(71,'장다솔','1986-03-01',0,NULL,6),(72,'장한솔','1984-12-16',0,NULL,7),(73,'김세훈','1985-04-23',0,NULL,8),(74,'구찬우','1988-09-25',0,NULL,9),(75,'김명찬','1985-12-14',0,NULL,10),(76,'김무건','1986-01-10',0,NULL,11),(77,'김연각','1988-05-28',0,NULL,12),(78,'김윤성','1989-02-04',0,NULL,0),(79,'김재현','1984-04-25',0,NULL,1),(80,'남진훈','1986-04-25',0,NULL,2),(81,'문종열','1986-05-16',0,NULL,3),(82,'문준혁','1990-02-10',0,NULL,4),(83,'박정우','1988-01-13',0,NULL,5),(84,'서준상','1986-03-18',0,NULL,6),(85,'여현철','1985-01-04',0,NULL,7),(86,'이경준','1986-01-30',0,NULL,8),(87,'이정룡','1984-09-25',0,NULL,9),(88,'이철민','1986-12-04',0,NULL,10),(89,'이호준','1987-09-24',0,NULL,11),(90,'정지훈','1987-03-02',0,NULL,12),(91,'최목','1984-11-15',0,NULL,0),(92,'최일준','1987-02-22',0,NULL,1),(93,'최형승','1989-07-20',0,NULL,2),(94,'김우경','1988-10-24',0,NULL,3),(95,'문정우','1993-01-04',0,NULL,4),(96,'이태엽','1986-09-29',0,NULL,5),(97,'유재석','1983-06-10',0,NULL,6),(98,'김상윤','1985-08-03',0,NULL,7),(99,'윤석호','1979-01-20',0,NULL,8),(100,'정훈영','1983-03-29',0,NULL,9),(101,'복종욱','1983-05-03',0,NULL,10),(102,'이시우','1988-03-23',0,NULL,11),(103,'백광선','1984-09-01',0,NULL,12),(104,'황창준','1983-11-17',0,NULL,0),(105,'이석찬','1983-09-01',0,NULL,1),(106,'문치권','1985-10-04',0,NULL,2),(107,'박주용','1982-06-18',0,NULL,3),(108,'김성윤','1985-05-22',0,NULL,4),(109,'곽동준','1984-04-03',0,NULL,5),(110,'심정현','1985-08-03',0,NULL,6),(111,'이영재','1985-08-15',0,NULL,7),(112,'김경환','1985-11-11',0,NULL,8),(113,'이상호','1985-09-30',0,NULL,9),(114,'김범식','1985-06-02',0,NULL,10),(115,'임희섭','1984-11-23',0,NULL,11),(116,'전우람','1990-05-28',0,NULL,12),(117,'최준호','1984-10-12',0,NULL,0),(118,'최지원','1991-12-27',0,NULL,1),(119,'김성현','1984-11-20',0,NULL,2),(120,'최용재','1986-11-22',0,NULL,3),(121,'신성','1986-11-22',0,NULL,4),(122,'최동순','1987-12-13',0,NULL,5),(123,'김정석','1987-12-14',0,NULL,6),(125,'서동익','1987-12-16',0,NULL,8),(126,'최광욱','1987-12-17',0,NULL,9),(127,'박우열','1987-12-18',0,NULL,10),(128,'최현재','1987-12-19',0,NULL,11),(129,'이성구','1987-12-20',0,NULL,12),(130,'김동현','1987-12-21',0,NULL,0),(131,'인기철','1987-12-22',0,NULL,1),(132,'박준범','1987-12-23',0,NULL,2),(133,'김준호','1987-12-24',0,NULL,3),(134,'유형석','1987-12-25',0,NULL,4),(135,'김명준','1987-12-26',0,NULL,5),(136,'김범식','1987-12-27',0,NULL,6),(137,'문원교','1987-12-28',0,NULL,7),(138,'주현호','1987-12-29',0,NULL,8),(139,'홍석승','1987-12-30',0,NULL,9),(140,'이성근','1987-12-31',0,NULL,10),(141,'손영석','1988-01-01',0,NULL,11),(142,'조원준','1988-01-02',0,NULL,12),(143,'변인우','1988-01-03',0,NULL,0),(144,'윤동현','1988-01-04',0,NULL,1);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `show_games`
--

DROP TABLE IF EXISTS `show_games`;
/*!50001 DROP VIEW IF EXISTS `show_games`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `show_games` AS SELECT 
 1 AS `game_id`,
 1 AS `league_id`,
 1 AS `league_name`,
 1 AS `season`,
 1 AS `round`,
 1 AS `gameday`,
 1 AS `h_id`,
 1 AS `home`,
 1 AS `a_id`,
 1 AS `away`,
 1 AS `result`,
 1 AS `hscore`,
 1 AS `ascore`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `elo` int(11) DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'짤유','서울',NULL),(2,'Bullets','서울',NULL),(3,'Metros','서울',NULL),(4,'Civilians','서울',NULL),(5,'행당Hits','서울',NULL),(6,'아슬아슬','서울',NULL),(7,'디독스','서울',NULL),(8,'언더독','서울',NULL),(10,'루키즈','서울',NULL),(11,'MBCtalent','서울',NULL),(12,'레전드','서울',NULL),(13,'D-train','서울',NULL),(14,'GS타임즈','서울',NULL),(15,'기타','기타',NULL),(16,'에스큘레피우스','서울',NULL),(17,'AceBraves','서울',NULL),(18,'불새','서울',NULL),(19,'러쉬','서울',NULL),(20,'올베','서울',NULL);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versus_player`
--

DROP TABLE IF EXISTS `versus_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versus_player` (
  `vs_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `pitcher_id` int(11) NOT NULL,
  `batter_id` int(11) NOT NULL,
  `cur_inning` int(11) NOT NULL,
  `cur_base` int(11) DEFAULT NULL,
  `result` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`vs_id`),
  KEY `fk_versus_player1_idx` (`pitcher_id`),
  KEY `fk_versus_player2_idx` (`batter_id`),
  KEY `fk_versus_game1_idx` (`game_id`),
  CONSTRAINT `fk_versus_game1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_versus_player1` FOREIGN KEY (`pitcher_id`) REFERENCES `player` (`player_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_versus_player2` FOREIGN KEY (`batter_id`) REFERENCES `player` (`player_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versus_player`
--

LOCK TABLES `versus_player` WRITE;
/*!40000 ALTER TABLE `versus_player` DISABLE KEYS */;
/*!40000 ALTER TABLE `versus_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `show_games`
--

/*!50001 DROP VIEW IF EXISTS `show_games`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_games` AS select `g`.`game_id` AS `game_id`,`l`.`league_id` AS `league_id`,`l`.`league_name` AS `league_name`,`l`.`league_year` AS `season`,`g`.`round` AS `round`,`g`.`gameday` AS `gameday`,`th`.`team_id` AS `h_id`,`th`.`team_name` AS `home`,`ta`.`team_id` AS `a_id`,`ta`.`team_name` AS `away`,`g`.`result` AS `result`,`g`.`hscore` AS `hscore`,`g`.`ascore` AS `ascore` from (((`game` `g` join `team` `th`) join `team` `ta`) join `league` `l`) where ((`g`.`hometeam` = `th`.`team_id`) and (`g`.`awayteam` = `ta`.`team_id`) and (`g`.`league_id` = `l`.`league_id`)) */;
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

-- Dump completed on 2016-05-23 14:18:05
