-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: sgpq
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_reagentes`
--

DROP TABLE IF EXISTS `t_reagentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_reagentes` (
  `id_Reagente` varchar(10) NOT NULL,
  `nr_CAS` varchar(15) NOT NULL,
  `nm_PT` varchar(60) DEFAULT NULL,
  `nm_EN` varchar(60) DEFAULT NULL,
  `gr_Compatibilidade` char(4) NOT NULL,
  `pdf_FISPQ` varchar(100) DEFAULT NULL,
  `info_Descarte` longtext,
  PRIMARY KEY (`id_Reagente`),
  UNIQUE KEY `nr_CAS` (`nr_CAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_reagentes`
--

LOCK TABLES `t_reagentes` WRITE;
/*!40000 ALTER TABLE `t_reagentes` DISABLE KEYS */;
INSERT INTO `t_reagentes` VALUES ('1A','7647-14-5','Cloreto de Sódio','Sodium Chloride','I2','https://www.sigmaaldrich.com/BR/pt/sds/sigald/s9888',''),('2B','7647-01-0','Ácido Clorídrico','Hydrochloric acid','I9','https://www.sigmaaldrich.com/BR/pt/sds/sigald/320331','Neutralizar a solução com bicarbonato de sódio.'),('3C','7786-30-3','Cloreto de Magnésio','Magnesium Chloride','I3','https://www.sigmaaldrich.com/BR/pt/sds/sigma/m8266','Enviar para incineração.');
/*!40000 ALTER TABLE `t_reagentes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-31  8:45:25
