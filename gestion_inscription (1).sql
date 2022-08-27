-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 26 août 2022 à 20:30
-- Version du serveur :  8.0.21
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_inscription`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `idEtudiants` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nom` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `dateNaiss` date NOT NULL,
  `tel` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `sexe` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `idGroupe` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`idEtudiants`),
  KEY `idGroupe` (`idGroupe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`idEtudiants`, `nom`, `prenom`, `dateNaiss`, `tel`, `sexe`, `idGroupe`) VALUES
('10', 'NDIAYE', 'Fatou', '0198-10-04', '773456092', 'F', '14'),
('100', 'MENDY', 'Jean', '1998-02-10', 'M', '78092193', '33'),
('12', 'Barro', 'Souleymane', '2021-10-04', '770983938', 'M', '13'),
('122', 'Ndiaye', 'Moussa', '1998-02-11', '774320918', 'M', '5'),
('28', 'Gueye', 'Fatou', '1990-08-13', '774318920', 'F', '13'),
('30', 'BADJI', 'Insa', '1993-09-12', '770983217', 'M', '14'),
('4', 'Moussa', 'Niang', '1998-10-03', '776430910', 'M', '5'),
('42', 'Sy', 'Abdou', '1990-04-11', '763210983', 'M', '14'),
('455', 'SARR', 'Mouhamed', '1997-09-18', '761363897', 'M', '13'),
('76', 'KEBE', 'Seydina', '1998-08-14', '778554838', 'M', '5'),
('88', 'SOW', 'Habib', '1993-09-18', '774521098', 'M', '28'),
('94', 'NDIAYE', 'Astou', '1998-02-15', '772315409', 'F', '13'),
('99', 'Ly', 'Abdou', '1999-01-02', '77091834', 'M', '28');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `idFormation` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `libele` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`idFormation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`idFormation`, `libele`, `description`) VALUES
('104', 'Vue JS', 'FRAMWORK JavaScript Frontend '),
('105', 'React JS', 'FRAMWORK JavaScript Frontend '),
('109', 'Laravel', 'FRAMWORK PHP '),
('110', ' C++', 'Langage de Programmation cote serveur'),
('130', 'Reseau', 'Telecom'),
('136', 'Langage C', 'Langage de Programmation cote serveur'),
('19', 'Symphony', 'FRAMWORK PHP '),
('190', 'Django', 'FRAMWORK Python'),
('23', 'Java', 'Langage de Programmation cote serveur'),
('28', 'Python', 'Langage de programmation cote serveur.'),
('29', 'JavaScript', 'Langage de Programmation cote client'),
('33', 'Angular JS', 'Framework JavaScript Frontend'),
('42', 'MySQL', 'Systeme de Gestion de Base de donnee'),
('49', 'Oracle', 'Systeme de Gestion de Base de donnee'),
('93', 'PHP', 'Langage de programmation Backend');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `idClasse` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nomClasee` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `effectif` int NOT NULL,
  `niveau` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`idClasse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`idClasse`, `nomClasee`, `effectif`, `niveau`) VALUES
('13', 'DIG', 34, 'Licence 3'),
('132', 'AGN', 24, 'Licence 3'),
('14', 'Genie Logiciel', 43, 'Licence 2'),
('28', 'TRM', 54, 'Licence 2'),
('32', 'CINEMA', 84, 'Licence 3'),
('320', 'RTLC', 74, 'Licence 3'),
('33', 'Art Graphique', 30, 'Licence 1');

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `idInscription` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `dateInscription` date NOT NULL,
  `montant` int NOT NULL,
  `matricule` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `idFormation` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`idInscription`),
  KEY `matricule` (`matricule`),
  KEY `idFormation` (`idFormation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`idInscription`, `dateInscription`, `montant`, `matricule`, `idFormation`) VALUES
('12', '2021-01-03', 2000, '12', '23'),
('14', '2021-02-03', 2500, '122', '23'),
('23', '2021-09-12', 25000, '4', '23');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` varchar(50) COLLATE utf8_bin NOT NULL,
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  `passWord` varchar(20) COLLATE utf8_bin NOT NULL,
  `profile` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUser`, `nom`, `passWord`, `profile`) VALUES
('', 'Julo', 'barro', 'Admin'),
('83', 'Souleymane', 'julo', 'Admin');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`matricule`) REFERENCES `etudiant` (`idEtudiants`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`idFormation`) REFERENCES `formation` (`idFormation`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
