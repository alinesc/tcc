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
-- Table structure for table `t_emprestimo`
--

DROP TABLE IF EXISTS `t_emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_emprestimo` (
  `id_emprestimo` char(36) NOT NULL,
  `id_lab_origem` char(36) NOT NULL,
  `id_lab_destino` char(36) NOT NULL,
  `qtd_emprestimo` double NOT NULL,
  `id_frasco` char(36) NOT NULL,
  `status` enum('APROVADO','PENDENTE','REPROVADO') NOT NULL DEFAULT 'PENDENTE',
  `id_solicitante` char(36) NOT NULL,
  `id_aprovador` char(36) DEFAULT NULL,
  PRIMARY KEY (`id_emprestimo`),
  KEY `fk_id_frasco_idx` (`id_frasco`),
  KEY `fk_id_lab_origem_idx` (`id_lab_origem`),
  KEY `fk_id_lab_destino_idx` (`id_lab_destino`),
  KEY `fk_solicitante_idx` (`id_solicitante`),
  KEY `fk_id_aprovador_idx` (`id_aprovador`),
  CONSTRAINT `fk_id_aprovador` FOREIGN KEY (`id_aprovador`) REFERENCES `t_usuario` (`id_usuario`),
  CONSTRAINT `fk_id_frasco` FOREIGN KEY (`id_frasco`) REFERENCES `t_frasco` (`id_frasco`),
  CONSTRAINT `fk_id_lab_destino` FOREIGN KEY (`id_lab_destino`) REFERENCES `t_laboratorio` (`id_laboratorio`),
  CONSTRAINT `fk_id_lab_origem` FOREIGN KEY (`id_lab_origem`) REFERENCES `t_laboratorio` (`id_laboratorio`),
  CONSTRAINT `fk_id_solicitante` FOREIGN KEY (`id_solicitante`) REFERENCES `t_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_emprestimo`
--

LOCK TABLES `t_emprestimo` WRITE;
/*!40000 ALTER TABLE `t_emprestimo` DISABLE KEYS */;
INSERT INTO `t_emprestimo` VALUES ('0fce7484-5325-11ed-b4be-5ccd5bc30f36','2e7662f0-88c8-4214-9aad-5c38d20b4c13','1cbd9651-adda-481d-bb62-8f6c021d174b',99,'483c8a69-8e02-470a-955c-d4a58279097e','PENDENTE','04f33cff-41ad-4469-be10-0e038127b9b2',NULL),('1f4d2e18-531b-11ed-b4be-5ccd5bc30f36','2e7662f0-88c8-4214-9aad-5c38d20b4c13','1cbd9651-adda-481d-bb62-8f6c021d174b',0.1,'483c8a69-8e02-470a-955c-d4a58279097e','PENDENTE','04f33cff-41ad-4469-be10-0e038127b9b2',NULL),('b622f394-531f-11ed-b4be-5ccd5bc30f36','2e7662f0-88c8-4214-9aad-5c38d20b4c13','1cbd9651-adda-481d-bb62-8f6c021d174b',0.1,'483c8a69-8e02-470a-955c-d4a58279097e','PENDENTE','04f33cff-41ad-4469-be10-0e038127b9b2',NULL),('c7b114a2-531f-11ed-b4be-5ccd5bc30f36','2e7662f0-88c8-4214-9aad-5c38d20b4c13','1cbd9651-adda-481d-bb62-8f6c021d174b',1,'483c8a69-8e02-470a-955c-d4a58279097e','REPROVADO','04f33cff-41ad-4469-be10-0e038127b9b2',NULL),('e4f7811c-5325-11ed-b4be-5ccd5bc30f36','ec86b896-9803-4e99-bc58-486eb9852a36','1cbd9651-adda-481d-bb62-8f6c021d174b',0,'50a6e329-525d-11ed-b4be-5ccd5bc30f36','PENDENTE','04f33cff-41ad-4469-be10-0e038127b9b2',NULL),('eea6a63e-5324-11ed-b4be-5ccd5bc30f36','2e7662f0-88c8-4214-9aad-5c38d20b4c13','1cbd9651-adda-481d-bb62-8f6c021d174b',66,'483c8a69-8e02-470a-955c-d4a58279097e','APROVADO','04f33cff-41ad-4469-be10-0e038127b9b2',NULL);
/*!40000 ALTER TABLE `t_emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_frasco`
--

DROP TABLE IF EXISTS `t_frasco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_frasco` (
  `id_frasco` char(36) NOT NULL,
  `qtd_Frasco` double NOT NULL,
  `dt_vencimento` date NOT NULL,
  `id_lab` char(36) NOT NULL,
  `id_Reagente` char(36) NOT NULL,
  `unidade` enum('LITRO','KILO') DEFAULT NULL,
  `status` enum('PENDENTE','APROVADO','REPROVADO') DEFAULT 'PENDENTE',
  PRIMARY KEY (`id_frasco`),
  KEY `fk_id_frasco_idx` (`id_frasco`),
  KEY `fk_FrascoReagente` (`id_Reagente`),
  KEY `fk_IdLaboratorio_idx` (`id_lab`),
  CONSTRAINT `fk_FrascoReagente` FOREIGN KEY (`id_Reagente`) REFERENCES `t_reagentes` (`id_Reagente`),
  CONSTRAINT `fk_IdLaboratorio` FOREIGN KEY (`id_lab`) REFERENCES `t_laboratorio` (`id_laboratorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_frasco`
--

LOCK TABLES `t_frasco` WRITE;
/*!40000 ALTER TABLE `t_frasco` DISABLE KEYS */;
INSERT INTO `t_frasco` VALUES ('04287264-5451-11ed-b4be-5ccd5bc30f36',1,'2026-10-25','ec86b896-9803-4e99-bc58-486eb9852a36','833a158d-44eb-11ed-95d5-5ccd5bc30f36','KILO','PENDENTE'),('0dc5a126-5452-11ed-b4be-5ccd5bc30f36',1,'2022-10-25','1cbd9651-adda-481d-bb62-8f6c021d174b','89046381-8c95-4cca-ab1b-cdde7bf9c33f','LITRO','PENDENTE'),('23edd847-5276-11ed-b4be-5ccd5bc30f36',67,'2023-03-04','ec86b896-9803-4e99-bc58-486eb9852a36','833a158d-44eb-11ed-95d5-5ccd5bc30f36','LITRO',NULL),('2e3f0165-faf0-4d60-8ed3-a691780139ed',1.3,'2022-05-14','1cbd9651-adda-481d-bb62-8f6c021d174b','f99145f4-bb48-4e46-a23a-33327172df99','KILO',NULL),('33b851d1-52fc-11ed-b4be-5ccd5bc30f36',33,'2023-12-22','2e7662f0-88c8-4214-9aad-5c38d20b4c13','bbfe42bc-44ee-11ed-95d5-5ccd5bc30f36','LITRO',NULL),('483c8a69-8e02-470a-955c-d4a58279097e',0.5,'2022-01-14','2e7662f0-88c8-4214-9aad-5c38d20b4c13','f99145f4-bb48-4e46-a23a-33327172df99','KILO',NULL),('4d137f39-353e-4c0c-a098-7dd1ce819531',0,'2022-05-14','ec86b896-9803-4e99-bc58-486eb9852a36','f99145f4-bb48-4e46-a23a-33327172df99','KILO',NULL),('50a6e329-525d-11ed-b4be-5ccd5bc30f36',9,'2022-02-20','ec86b896-9803-4e99-bc58-486eb9852a36','24668da6-e1e5-4d1a-b6e7-9c2c4c10600f','KILO',NULL),('7d5ce5bf-53f0-11ed-b4be-5ccd5bc30f36',1,'2025-10-25','1cbd9651-adda-481d-bb62-8f6c021d174b','24668da6-e1e5-4d1a-b6e7-9c2c4c10600f','LITRO','PENDENTE'),('95837362-f204-468f-aef6-b7273580840f',13,'2022-01-14','1cbd9651-adda-481d-bb62-8f6c021d174b','f99145f4-bb48-4e46-a23a-33327172df99','KILO',NULL);
/*!40000 ALTER TABLE `t_frasco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_laboratorio`
--

DROP TABLE IF EXISTS `t_laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_laboratorio` (
  `id_laboratorio` char(36) NOT NULL,
  `nome_laboratorio` varchar(45) NOT NULL,
  PRIMARY KEY (`id_laboratorio`),
  UNIQUE KEY `nome_laboratorio_UNIQUE` (`nome_laboratorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_laboratorio`
--

LOCK TABLES `t_laboratorio` WRITE;
/*!40000 ALTER TABLE `t_laboratorio` DISABLE KEYS */;
INSERT INTO `t_laboratorio` VALUES ('2e7662f0-88c8-4214-9aad-5c38d20b4c13','Laboratorio 001'),('1cbd9651-adda-481d-bb62-8f6c021d174b','Laboratorio 002'),('ec86b896-9803-4e99-bc58-486eb9852a36','Laboratorio 003');
/*!40000 ALTER TABLE `t_laboratorio` ENABLE KEYS */;
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
INSERT INTO `t_reagentes` VALUES ('24668da6-e1e5-4d1a-b6e7-9c2c4c10600f','75-09-2','Diclorometano alterado','Dichlorometane','O5','https://www.sigmaaldrich.com/BR/pt/sds/sial/270997','Enviar para incineração.'),('5a99cb65-eb88-4b8f-ba19-13dc8a62d04a','7440-23-5','Cloreto de Sódi','Sodium Chloride','I2','https://www.sigmaaldrich.com/BR/pt/sds/sigald/s9888',''),('833a158d-44eb-11ed-95d5-5ccd5bc30f36','12125029','Cloreto de amônio','Ammonium chloride','I3','link','Observação - adicionada'),('89046381-8c95-4cca-ab1b-cdde7bf9c33f','142-82-5','n-Heptano alterado','Heptane','O3','https://www.sigmaaldrich.com/BR/pt/sds/sigald/34873','Enviar para incineração.'),('b74c5517-e733-486c-8eeb-6075277f7d28','7786303','Cloreto de Magnésio','Magnesium Chloride','I3','https://www.sigmaaldrich.com/BR/pt/sds/sigma/m8266','Enviar para incineração.'),('bbfe42bc-44ee-11ed-95d5-5ccd5bc30f36','7697-37-2','Ácido nítrico','Nitric acid','A5','link','Observação -adiciona'),('c9cfa1e3-51bc-4e97-bec8-d48a1681ac2a','7647-01-0','Ácido Clorídrico','Hydrochloric acid','I9','https://www.sigmaaldrich.com/BR/pt/sds/sigald/320331','Neutralizar a solução com bicarbonato de sódio'),('f99145f4-bb48-4e46-a23a-33327172df99','7647-14-5','Cloreto de Sódio','Sodium Chloride','IA','https://www.sigmaaldrich.com/BR/pt/sds/sigald/s9888','Informações');
/*!40000 ALTER TABLE `t_reagentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_usuario`
--

DROP TABLE IF EXISTS `t_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_usuario` (
  `id_usuario` char(36) NOT NULL,
  `email_usp` varchar(256) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `tipo_usuario` enum('docente','tecnico','pesquisador','setor') NOT NULL,
  `id_lab` char(36) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`),
  UNIQUE KEY `email_usp_UNIQUE` (`email_usp`),
  KEY `fk_id_lab_idx` (`id_lab`),
  CONSTRAINT `fk_id_lab` FOREIGN KEY (`id_lab`) REFERENCES `t_laboratorio` (`id_laboratorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_usuario`
--

LOCK TABLES `t_usuario` WRITE;
/*!40000 ALTER TABLE `t_usuario` DISABLE KEYS */;
INSERT INTO `t_usuario` VALUES ('04f33cff-41ad-4469-be10-0e038127b9b2','tecnico-002@usp.br','EFGH','tecnico','1cbd9651-adda-481d-bb62-8f6c021d174b'),('0857c8b0-a94a-4d36-a776-009c3399df37','pesquisador-003@usp.br','IJKL','pesquisador','1cbd9651-adda-481d-bb62-8f6c021d174b'),('461c2ef2-86d4-4b0a-bd4e-b201bc32d81a','docente-001@usp.br','ABCD','docente','2e7662f0-88c8-4214-9aad-5c38d20b4c13'),('4a5fa301-c1e2-446e-ad8a-465cb6203d9f','pesquisador-001@usp.br','IJKL','pesquisador','2e7662f0-88c8-4214-9aad-5c38d20b4c13'),('5239c8b3-3152-4788-98d5-5d81f96ad0de','tecnico-001@usp.br','EFGH','tecnico','2e7662f0-88c8-4214-9aad-5c38d20b4c13'),('9b6ae977-14a1-41eb-8e77-0d8ffdbad66c','docente-002@usp.br','ABCD','docente','1cbd9651-adda-481d-bb62-8f6c021d174b'),('9c212c64-1397-494f-81d4-0789db48edd7','setor@usp.br','MNOP','setor','ec86b896-9803-4e99-bc58-486eb9852a36'),('b92c02cc-5865-4c14-b484-642cbd1522e9','pesquisador-002@usp.br','IJKL','pesquisador','1cbd9651-adda-481d-bb62-8f6c021d174b'),('d95df641-10bc-4810-bc48-e6a379a3f488','docente-003@usp.br','ABCD','docente','ec86b896-9803-4e99-bc58-486eb9852a36');
/*!40000 ALTER TABLE `t_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-13 14:08:47
