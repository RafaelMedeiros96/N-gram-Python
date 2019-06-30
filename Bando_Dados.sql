-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 30-Jun-2019 às 18:26
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_léxico`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `algorithm`
--

CREATE TABLE `algorithm` (
  `idalgorithm` int(11) NOT NULL,
  `language` varchar(45) DEFAULT NULL,
  `language_version` varchar(45) DEFAULT '',
  `library` varchar(45) DEFAULT NULL,
  `library_version` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `authors`
--

CREATE TABLE `authors` (
  `idauthor` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `lattes` varchar(100) DEFAULT NULL,
  `lattes_update_date` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `citation_name` varchar(100) DEFAULT NULL,
  `academic_title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ngrams`
--

CREATE TABLE `ngrams` (
  `idngram` int(11) NOT NULL,
  `gram` varchar(100) DEFAULT '',
  `length` int(11) DEFAULT NULL,
  `frequency` double DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `algorithm_idalgorithm` int(11) NOT NULL,
  `publication_idpublication` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `publication`
--

CREATE TABLE `publication` (
  `idpublication` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `publisher` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `types_idtype` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `publication_authors`
--

CREATE TABLE `publication_authors` (
  `authors_idauthor` int(11) NOT NULL,
  `publication_idpublication` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `types`
--

CREATE TABLE `types` (
  `idtype` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `algorithm`
--
ALTER TABLE `algorithm`
  ADD PRIMARY KEY (`idalgorithm`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`idauthor`);

--
-- Indexes for table `ngrams`
--
ALTER TABLE `ngrams`
  ADD PRIMARY KEY (`idngram`),
  ADD KEY `fk_ngrams_algorithm1_idx` (`algorithm_idalgorithm`),
  ADD KEY `fk_ngrams_publication1_idx` (`publication_idpublication`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`idpublication`),
  ADD KEY `fk_publication_types1_idx` (`types_idtype`);

--
-- Indexes for table `publication_authors`
--
ALTER TABLE `publication_authors`
  ADD PRIMARY KEY (`authors_idauthor`,`publication_idpublication`),
  ADD KEY `fk_publication_authors_authors1_idx` (`authors_idauthor`),
  ADD KEY `fk_publication_authors_publication1_idx` (`publication_idpublication`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`idtype`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `algorithm`
--
ALTER TABLE `algorithm`
  MODIFY `idalgorithm` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `idauthor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ngrams`
--
ALTER TABLE `ngrams`
  MODIFY `idngram` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publication`
--
ALTER TABLE `publication`
  MODIFY `idpublication` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `idtype` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `ngrams`
--
ALTER TABLE `ngrams`
  ADD CONSTRAINT `fk_ngrams_algorithm1` FOREIGN KEY (`algorithm_idalgorithm`) REFERENCES `algorithm` (`idalgorithm`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ngrams_publication1` FOREIGN KEY (`publication_idpublication`) REFERENCES `publication` (`idpublication`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `fk_publication_types1` FOREIGN KEY (`types_idtype`) REFERENCES `types` (`idtype`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `publication_authors`
--
ALTER TABLE `publication_authors`
  ADD CONSTRAINT `fk_publication_authors_authors1` FOREIGN KEY (`authors_idauthor`) REFERENCES `authors` (`idauthor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_publication_authors_publication1` FOREIGN KEY (`publication_idpublication`) REFERENCES `publication` (`idpublication`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
