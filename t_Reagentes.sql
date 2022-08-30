-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql_db
-- Tempo de geração: 30-Ago-2022 às 00:29
-- Versão do servidor: 8.0.30
-- versão do PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `SGPQ`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_Reagentes`
--

CREATE TABLE `t_Reagentes` (
  `id_Reagente` varchar(10) NOT NULL,
  `nr_CAS` varchar(15) NOT NULL,
  `nm_PT` varchar(60) DEFAULT NULL,
  `nm_EN` varchar(60) DEFAULT NULL,
  `gr_Compatibilidade` char(4) NOT NULL,
  `pdf_FISPQ` varchar(100) DEFAULT NULL,
  `info_Descarte` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `t_Reagentes`
--
ALTER TABLE `t_Reagentes`
  ADD PRIMARY KEY (`id_Reagente`),
  ADD UNIQUE KEY `nr_CAS` (`nr_CAS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
