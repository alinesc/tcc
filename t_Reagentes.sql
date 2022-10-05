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
-- Table structure for table `t_frasco`
--

DROP TABLE IF EXISTS `t_frasco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_frasco` (
  `id_frasco` varchar(255) DEFAULT NULL,
  `qtd_Frasco` int DEFAULT NULL,
  `dt_vencimento` date DEFAULT NULL,
  `id_lab` varchar(255) DEFAULT NULL,
  `id_Reagente` char(36) DEFAULT NULL,
  KEY `fk_FrascoReagente` (`id_Reagente`),
  CONSTRAINT `fk_FrascoReagente` FOREIGN KEY (`id_Reagente`) REFERENCES `t_reagentes` (`id_Reagente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_frasco`
--

LOCK TABLES `t_frasco` WRITE;
/*!40000 ALTER TABLE `t_frasco` DISABLE KEYS */;
INSERT INTO `t_frasco` VALUES ('qualquer coisas',13,'2022-01-14','13','f99145f4-bb48-4e46-a23a-33327172df99');
/*!40000 ALTER TABLE `t_frasco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_reagentes`
--

DROP TABLE IF EXISTS `t_reagentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_reagentes` (
  `id_Reagente` char(36) NOT NULL,
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
INSERT INTO `t_reagentes` VALUES ('2B\0\0\0\0\0\0\0\0\0\0\0\0\0\0','7647-01-0','Ácido Clorídrico','Hydrochloric acid','I9','https://www.sigmaaldrich.com/BR/pt/sds/sigald/320331','Neutralizar a solução com bicarbonato de sõdio'),('3a2a8d80-438b-11ed-9bbd-5ccd5bc30f36','','Nome de teste','','','',''),('3C\0\0\0\0\0\0\0\0\0\0\0\0\0\0','7786-30-3','Cloreto de Magnésio','Magnesium Chloride','I3','https://www.sigmaaldrich.com/BR/pt/sds/sigma/m8266','Enviar para incineração.'),('BB\0\0\0\0\0\0\0\0\0\0\0\0\0\0','1234','Cloreto de Sódio','Sodium Chloride','I2','https://www.sigmaaldrich.com/BR/pt/sds/sigald/s9888',''),('Bp\0\0\0\0\0\0\0\0\0\0\0\0\0\0','123','Cloreto de Sódio popopo','Sodium Chloride','I2','https://www.sigmaaldrich.com/BR/pt/sds/sigald/s9888',''),('CP\0\0\0\0\0\0\0\0\0\0\0\0\0\0','454564','Cloreto de Sódi','Sodium Chloride','I2','https://www.sigmaaldrich.com/BR/pt/sds/sigald/s9888',''),('f99145f4-bb48-4e46-a23a-33327172df99','7647-14-5','Cloreto de Sódio','Sodium Chloride','IA','https://www.sigmaaldrich.com/BR/pt/sds/sigald/s9888','Informações'),('TR8\0\0\0\0\0\0\0\0\0\0\0\0\0','75-09-2','Diclorometano alterado','Dichlorometane','O5','https://www.sigmaaldrich.com/BR/pt/sds/sial/270997','Enviar para incineração.'),('TY6\0\0\0\0\0\0\0\0\0\0\0\0\0','182-42-5','n-Heptano alterado','Heptane','O3','https://www.sigmaaldrich.com/BR/pt/sds/sigald/34873','Enviar para incineração.');
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

-- Dump completed on 2022-10-04 22:39:34
