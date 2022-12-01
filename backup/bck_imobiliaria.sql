-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: imobiliaria
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `id_administrador` int NOT NULL AUTO_INCREMENT,
  `id_corretor` int NOT NULL,
  `senha` varchar(20) NOT NULL,
  `email` varchar(35) NOT NULL,
  PRIMARY KEY (`id_administrador`),
  KEY `id_corretor` (`id_corretor`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_corretor`) REFERENCES `corretor` (`id_corretor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,2,'carlalopes@email.com','12345');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda_corretor`
--

DROP TABLE IF EXISTS `agenda_corretor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agenda_corretor` (
  `id_agenda_corretor` int NOT NULL AUTO_INCREMENT,
  `dia` int DEFAULT NULL,
  `mes` int DEFAULT NULL,
  `ano` int DEFAULT NULL,
  PRIMARY KEY (`id_agenda_corretor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_corretor`
--

LOCK TABLES `agenda_corretor` WRITE;
/*!40000 ALTER TABLE `agenda_corretor` DISABLE KEYS */;
INSERT INTO `agenda_corretor` VALUES (1,23,4,2022),(2,2,12,2022),(3,28,6,2022);
/*!40000 ALTER TABLE `agenda_corretor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agendamento_visita`
--

DROP TABLE IF EXISTS `agendamento_visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamento_visita` (
  `id_agendamento_visita` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_imovel` int NOT NULL,
  PRIMARY KEY (`id_agendamento_visita`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_imovel` (`id_imovel`),
  CONSTRAINT `agendamento_visita_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `agendamento_visita_ibfk_2` FOREIGN KEY (`id_imovel`) REFERENCES `imovel` (`id_imovel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento_visita`
--

LOCK TABLES `agendamento_visita` WRITE;
/*!40000 ALTER TABLE `agendamento_visita` DISABLE KEYS */;
INSERT INTO `agendamento_visita` VALUES (1,3,3),(2,4,2),(3,1,5);
/*!40000 ALTER TABLE `agendamento_visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `sobrenome` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `email` varchar(35) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Pedro','Silva','11111','pedrosilva@email.com','11111111111'),(2,'Jessica','Teixeira','22222','jessicateixeira@email.com','22222222222'),(3,'Algusta','Santos','33333','algustasantos@email.com','33333333333'),(4,'Carlos','Souza','44444','carlossouza@email.com','44444444444'),(5,'Lais','Correa','55555','laiscorrea@email.com','55555555555'),(6,'Mariana','Larrubia','66666','marianalarrubia@email.com','66666666666');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corretor`
--

DROP TABLE IF EXISTS `corretor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corretor` (
  `id_corretor` int NOT NULL AUTO_INCREMENT,
  `id_agenda_corretor` int NOT NULL,
  `nome` varchar(20) NOT NULL,
  `sobrenome` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `email` varchar(35) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `aprovado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_corretor`),
  KEY `id_agenda_corretor` (`id_agenda_corretor`),
  CONSTRAINT `corretor_ibfk_1` FOREIGN KEY (`id_agenda_corretor`) REFERENCES `agenda_corretor` (`id_agenda_corretor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corretor`
--

LOCK TABLES `corretor` WRITE;
/*!40000 ALTER TABLE `corretor` DISABLE KEYS */;
INSERT INTO `corretor` VALUES (1,1,'Mario','Brazzi','11111','mariobrazzi@email.com','44444444444',1),(2,2,'Carla','Lopes','22222','carlalopes@email.com','55555555555',1),(3,3,'Rodrigo','Nobrega','33333','rodrigonobrega@email.com','66666666666',1);
/*!40000 ALTER TABLE `corretor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `rua` varchar(50) NOT NULL,
  `numero` int NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Alvarenga de Alencar',123,'Campos do Goytacazes','Rio de Janeiro'),(2,'Travessa Murilo Peixoto',435,'Campos do Goytacazes','Rio de Janeiro'),(3,'Rua Vinte e Seis de Janeiro',34,'Campos do Goytacazes','Rio de Janeiro'),(4,'Rua Mariana dos Santos Martins',23,'Campos do Goytacazes','Rio de Janeiro'),(5,'Rua Mariana dos Santos Martins',145,'Campos do Goytacazes','Rio de Janeiro'),(6,'Rua Amaro Burla',46,'Campos do Goytacazes','Rio de Janeiro'),(7,'Rua Carapebus',234,'Campos do Goytacazes','Rio de Janeiro');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imovel`
--

DROP TABLE IF EXISTS `imovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imovel` (
  `id_imovel` int NOT NULL AUTO_INCREMENT,
  `id_corretor` int DEFAULT NULL,
  `id_endereco` int NOT NULL,
  `id_cliente_compra` int DEFAULT NULL,
  `id_cliente_venda` int DEFAULT NULL,
  `area` int NOT NULL,
  `valor` float NOT NULL,
  `qtde_banheiro` int NOT NULL,
  `observacao` varchar(250) DEFAULT 'sem observação',
  `tipo_imovel` enum('Casa','Apartamento','Terreno') NOT NULL,
  `aluguel_venda` enum('Aluguel','Venda') NOT NULL,
  `negociado` tinyint(1) DEFAULT '0',
  `aprovado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_imovel`),
  KEY `idx_endereco` (`id_endereco`),
  KEY `id_corretor` (`id_corretor`),
  KEY `id_cliente_compra` (`id_cliente_compra`),
  KEY `id_cliente_venda` (`id_cliente_venda`),
  CONSTRAINT `imovel_ibfk_1` FOREIGN KEY (`id_corretor`) REFERENCES `corretor` (`id_corretor`) ON DELETE SET NULL,
  CONSTRAINT `imovel_ibfk_2` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`) ON DELETE RESTRICT,
  CONSTRAINT `imovel_ibfk_3` FOREIGN KEY (`id_cliente_compra`) REFERENCES `cliente` (`id_cliente`) ON DELETE SET NULL,
  CONSTRAINT `imovel_ibfk_4` FOREIGN KEY (`id_cliente_venda`) REFERENCES `cliente` (`id_cliente`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imovel`
--

LOCK TABLES `imovel` WRITE;
/*!40000 ALTER TABLE `imovel` DISABLE KEYS */;
INSERT INTO `imovel` VALUES (1,2,1,NULL,2,140,400000,5,'sem observação','Casa','Venda',0,0),(2,3,2,3,1,80,850,1,'precisa reformar piso','Apartamento','Aluguel',1,1),(3,2,3,NULL,1,300,1400000,7,'possui jardim','Casa','Venda',0,1),(4,3,4,NULL,6,80,200000,2,'uma suite','Casa','Venda',0,0),(5,2,5,4,4,60,600,1,'sem observação','Apartamento','Aluguel',0,1),(6,3,6,NULL,6,80,150000,1,'casa com dois andares','Casa','Venda',0,1),(7,2,7,NULL,6,80,150000,1,'casa com dois andares','Casa','Venda',0,0);
/*!40000 ALTER TABLE `imovel` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `atualizar_negociado` BEFORE INSERT ON `imovel` FOR EACH ROW BEGIN
	UPDATE imovel SET negociado = 1 
    where id_cliente_compra != null;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-19 18:00:33
