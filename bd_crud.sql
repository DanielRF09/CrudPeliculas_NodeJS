-- MySQL dump 10.13  Distrib 5.6.10, for Win32 (x86)
--
-- Host: localhost    Database: bd_peliculas
-- ------------------------------------------------------
-- Server version	5.6.10-log

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
-- Table structure for table `actor`
--

CREATE DATABASE bd_crud;
USE bd_crud;

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `idActor` int(11) NOT NULL AUTO_INCREMENT,
  `nombreActor` varchar(45) NOT NULL,
  `appatActor` varchar(45) NOT NULL,
  `apmatActor` varchar(45) NOT NULL,
  `fechaActor` date NOT NULL,
  `sexoActor` char(1) NOT NULL,
  `nacionalidadActor` varchar(45) NOT NULL,
  PRIMARY KEY (`idActor`),
  UNIQUE KEY `idActor_UNIQUE` (`idActor`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'Rodney','Sturt','Taylor','1930-01-11','M','Estadounidense'),(2,'Nathalie','Kay','Hedren','1930-01-19','F','Estadounidense'),(3,'Jessie','Alice','Tandy','1909-06-07','F','Britanica'),(4,'Elizabeth','Welter','Wilson','1921-04-04','F','Estadounidense'),(5,'Nigel John','Dermot','Neill','1947-09-14','M','Britanico'),(6,'Laura Elizabeth','Dern','Ladd','1967-02-10','F','Estadounidense'),(7,'Richard Samuel','Attenborough','Sim','1923-08-29','M','Britanico'),(8,'Jeffrey','Lynn','Goldblum','1952-10-22','M','Estadounidense'),(9,'Keanu','Charles','Reeves','1964-09-02','M','Canadiense'),(10,'Carrie','Anne','Moss','1967-08-21','F','Canadiense'),(11,'Laurence','John ','Fishburne III','1961-07-30','M','Estadounidense'),(12,'Hugo','Wallace','Weaving','1960-04-04','M','Anglo Australiano'),(13,'Joseph','Peter','Pantoliano','1951-09-12','M','Estadounidense'),(14,'Tobias','Vincent','Maguire','1975-06-27','M','Estadounidense'),(15,'William','James','Dafoe','1955-07-22','M','Estadounidense'),(16,'Kirsten','Caroline','Dunst','1982-12-30','F','Estadounidense'),(17,'James','Edward','Franco','1978-12-19','M','Estadounidense'),(18,'Naomi','Ellen','Watts','1968-09-28','F','Inglesa'),(19,'David Benjamin','Douglas','Dorfman','1993-02-07','M','Estadounidense'),(20,'Daveigh Elizabeth','Chase','Schwallier','1990-07-24','F','Estadounidense'),(21,'Brian','Denis','Cock','1946-06-01','M','Escoces');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `idDirector` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDirector` varchar(45) NOT NULL,
  `appatDirector` varchar(45) NOT NULL,
  `apmatDirector` varchar(45) NOT NULL,
  `fechaDirector` date NOT NULL,
  `sexoDirector` char(1) NOT NULL,
  `nacionalidadDirector` varchar(45) NOT NULL,
  PRIMARY KEY (`idDirector`),
  UNIQUE KEY `idDirector_UNIQUE` (`idDirector`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Alfred','Hitchcock','Whelan','1899-08-13','M','Britanico'),(2,'Quentin','Jerome','Tarantino','1963-03-27','M','Estadounidense'),(3,'Steven','Allan','Spielberg','1946-12-18','M','Estadounidense'),(5,'Lana','Wachowski','Alisa','1965-06-21','F','Estadounidense'),(6,'Samuel','Marshall','Raimi','1959-10-23','M','Estadounidense'),(7,'Gregor','Verbinski','.','1964-03-16','M','Estadounidense');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `idGenero` int(11) NOT NULL AUTO_INCREMENT,
  `nombreGenero` varchar(45) NOT NULL,
  PRIMARY KEY (`idGenero`),
  UNIQUE KEY `idGeneros_UNIQUE` (`idGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Terror'),(2,'Suspenso'),(3,'Comedia'),(4,'Drama'),(5,'Animada'),(6,'Accion'),(7,'Aventura'),(8,'Musical'),(14,'Ciencia Ficcion'),(15,'Superheroes');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelicula` (
  `idPelicula` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `idGenero` int(11) NOT NULL,
  `fechaPelicula` date DEFAULT NULL,
  `duracion` varchar(45) NOT NULL,
  `clasificacion` varchar(45) NOT NULL,
  `idDirector` int(11) NOT NULL,
  `sinopsis` mediumtext NOT NULL,
  PRIMARY KEY (`idPelicula`),
  UNIQUE KEY `idPelicula_UNIQUE` (`idPelicula`),
  KEY `idDirector_idx` (`idDirector`),
  KEY `idGenero_idx` (`idGenero`),
  CONSTRAINT `idDirector` FOREIGN KEY (`idDirector`) REFERENCES `director` (`idDirector`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idGenero` FOREIGN KEY (`idGenero`) REFERENCES `genero` (`idGenero`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (1,'TheBirds','https://images-na.ssl-images-amazon.com/images/I/91U6fpoJ-SL._SL1500_.jpg',1,'1963-10-23','119 minutos','PG-13',1,'Melanie Daniels una joven proveniente de una familia rica que pertenece a la élite de San Francisco, va a comprar un pájaro para su tía a una tienda de mascotas y allí conoce a Mitch Brenner un abogado de éxito por el que se siente atraída al instante. Acostumbrada a tener siempre lo que quiere, Melanie va a buscarle a Bodega Bay para regalarle unos periquitos y conseguir que él sienta lo mismo por ella. Al llegar al pueblo costero, es inexplicablemente atacada por una gaviota que le abre una brecha en la frente. De repente, miles de pájaros invaden la ciudad atacando a los colegiales y residentes. La situación se agrava cada vez más, provocando el pánico en toda la población ante la incertidumbre del extraño comportamiento de las aves.'),(3,'The Matrix','https://i.pinimg.com/originals/9f/75/f6/9f75f696cc69e4186bd3a1227d2fd48e.jpg',14,'1999-03-31','131 minutos','R',5,'Un experto en computadoras descubre que su mundo es una simulación total creada con maliciosas intenciones por parte de la ciberinteligencia.'),(4,'Jurassic Park','https://www.cinemascomics.com/wp-content/uploads/2015/08/Jurassic-Park-galeria-serie-de-animacion.jpg',7,'1993-06-11','127 minutos','PG-13',3,'Tres expertos y otras personas son invitados a un parque de diversiones, donde se encuentran dinosaurios creados en base al ADN.'),(5,'Spider Man','https://www.tupuntodelatecnologia.com/wp-content/uploads/2019/12/spiderman-2002-poster.png',15,'2002-04-29','121 minutos','PG 13',6,'Luego de sufrir la picadura de una araña genéticamente modificada, un estudiante de secundaria tímido y torpe adquiere increíbles capacidades como arácnido. Pronto comprenderá que su misión es utilizarlas para luchar contra el mal y defender a sus vecinos.'),(6,'El Aro','https://i.pinimg.com/originals/b2/3e/56/b23e56f0facb411eef280537d051fdf9.jpg',1,'2002-10-18','116 minutos','PG 13',7,'Una reportera debe resolver el misterio de una cinta que trae muerte a sus espectadores, antes de que sucumba a su poder.');
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_pelicula_actor`
--

DROP TABLE IF EXISTS `relacion_pelicula_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_pelicula_actor` (
  `idRelacion_pelicula_actor` int(11) NOT NULL AUTO_INCREMENT,
  `idPelicula` int(11) NOT NULL,
  `idActor` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idRelacion_pelicula_actor`),
  KEY `idPelicula_idx` (`idPelicula`),
  KEY `idActor_idx` (`idActor`),
  CONSTRAINT `idActor` FOREIGN KEY (`idActor`) REFERENCES `actor` (`idActor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPelicula` FOREIGN KEY (`idPelicula`) REFERENCES `pelicula` (`idPelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_pelicula_actor`
--

LOCK TABLES `relacion_pelicula_actor` WRITE;
/*!40000 ALTER TABLE `relacion_pelicula_actor` DISABLE KEYS */;
INSERT INTO `relacion_pelicula_actor` VALUES (1,1,1,'Interpreta a Mitch Brener en la pelicula The Birds.'),(6,1,2,'Interpreta a Melanie Daniels en la pelicula The Birds.'),(7,1,3,'Interpreta a Lydia Brenner en la pelicula The Birds.'),(8,4,5,'Interpreta al Dr. Alan Grant en Jurassic Park: un paleontólogo que al comienzo de la película trabaja en una excavación en las tierras baldías de Montana.'),(9,4,6,'Interpreta a la Dra. Ellie Sattler: experta en paleobotánica y novia de Grant. En Jurassic Park.'),(10,4,7,'Interpreta a John Hammond: principal responsable del Parque Jurásico.'),(11,4,8,'Interpreta al Dr. Ian Malcolm: un matemático y profesor de la Teoría del Caos que advierte del riesgo de la clonación de dinosaurios.'),(12,1,4,'Interpreta a Helen Carter en la pelicula The Birds.'),(13,3,9,'Interpreta a Thomas Anderson / Neo: Un programador de computadoras de la corporación Metacortex que trabaja en las noches como hacker en la pelicula Matrix. '),(14,3,10,'Interpreta a Trinity en la pelicula The Matrix.'),(15,3,11,'Interpreta a Morfeo en la Pelicula The Matrix.'),(16,3,12,'Interpreta al agente Smith en la pelicula The Matrix.'),(17,3,13,'Interpreta a Cypher.'),(18,5,14,'Interpreta a Peter Parker/Spider-Man: Un estudiante dotado académicamente pero socialmente inepto que es mordido por una araña genéticamente modificada y adquiere habilidades de araña.'),(19,5,15,'Interpreta a Norman Osborn/Duende Verde: El CEO de Oscorp que prueba un potenciador de fuerza inestable en sí mismo y se convierte en el loco y poderoso Green Goblin.'),(20,5,16,'Interpreta Mary Jane Watson: La chica de la que Parker estaba enamorada desde que tenía seis años.'),(21,5,17,'Interpreta a Harry Osborn: El mejor amigo y compañero de piso de Parker.'),(22,6,18,'Interpreta a Rachel Keller en la pelicula el aro.'),(23,6,19,'Interpreta a Aidan Keller en la pelicula El Aro.'),(24,6,20,'Interpreta a Samara Morgan en la pelicula El Aro.'),(25,6,21,'Interpreta a Richard Morgan en la pelicula El Aro.');
/*!40000 ALTER TABLE `relacion_pelicula_actor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-13  0:49:16
