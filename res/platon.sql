-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 09. Nov 2016 um 12:14
-- Server Version: 5.5.52-0ubuntu0.14.04.1
-- PHP-Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `Platon`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fachgebiete`
--

CREATE TABLE IF NOT EXISTS `fachgebiete` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `leitung` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `fachgebiete`
--

INSERT INTO `fachgebiete` (`id`, `name`, `leitung`) VALUES
(1, 'Programmierung', 12),
(2, 'Finanzierung', 1),
(3, 'Techn. Beratung', 5),
(4, 'Allg. Planung', 4),
(5, 'Beschaffung', 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gehalt`
--

CREATE TABLE IF NOT EXISTS `gehalt` (
  `gehaltsgruppe` varchar(1) NOT NULL,
  `grundgehalt` float NOT NULL,
  PRIMARY KEY (`gehaltsgruppe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `gehalt`
--

INSERT INTO `gehalt` (`gehaltsgruppe`, `grundgehalt`) VALUES
('A', 2710),
('B', 3014),
('C', 3258),
('D', 3860);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `geschlecht`
--

CREATE TABLE IF NOT EXISTS `geschlecht` (
  `id` varchar(1) NOT NULL,
  `klartext` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `geschlecht`
--

INSERT INTO `geschlecht` (`id`, `klartext`) VALUES
('M', 'männlich'),
('W', 'weiblich');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mitarbeiter`
--

CREATE TABLE IF NOT EXISTS `mitarbeiter` (
  `mitarbeiterid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `vorname` varchar(30) NOT NULL,
  `geschlecht` varchar(1) NOT NULL,
  `strasse` varchar(50) NOT NULL,
  `hausnummer` int(11) NOT NULL,
  `plz` int(11) NOT NULL,
  `fachgebiet` int(11) NOT NULL,
  `eintrittsdatum` date NOT NULL,
  `gehaltsgruppe` varchar(1) NOT NULL,
  `stundensatz` float NOT NULL,
  PRIMARY KEY (`mitarbeiterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `mitarbeiter`
--

INSERT INTO `mitarbeiter` (`mitarbeiterid`, `name`, `vorname`, `geschlecht`, `strasse`, `hausnummer`, `plz`, `fachgebiet`, `eintrittsdatum`, `gehaltsgruppe`, `stundensatz`) VALUES
(1, 'Schneider', 'Inge', 'W', 'Rheintalweg', 121, 53111, 1, '2003-08-01', 'B', 22.8),
(2, 'Pyplo', 'Jutta', 'W', 'Michelstrasse', 3, 53111, 2, '2007-12-06', 'D', 20.7),
(3, 'Hagemann', 'Mark', 'M', 'Cranachstrasse', 22, 53340, 3, '2005-07-01', 'A', 23.6),
(4, 'Sprott', 'Anton', 'M', 'Mittelpfad', 55, 50105, 3, '2007-05-16', 'A', 19.1),
(5, 'Wagner', 'Chris', 'M', 'Hopfengasse', 2, 53177, 2, '2000-03-01', 'C', 23.6),
(6, 'Sanders', 'Udo', 'M', 'Keltenstrasse', 84, 53229, 1, '2001-08-01', 'C', 30.7),
(7, 'Obama', 'Chantal', 'W', 'Cranachstrasse', 22, 53191, 4, '2002-02-21', 'D', 33.2),
(8, 'Krahe', 'Wilhelm', 'M', 'Koblenzerstrasse', 73, 53840, 1, '2001-04-01', 'A', 25),
(9, 'Otter', 'Paul', 'M', 'Hubertusstrasse', 138, 50170, 1, '2006-04-01', 'B', 23.5),
(10, 'Buhaku', 'Abdul', 'M', 'Segbachstrasse', 42, 50129, 1, '2000-06-12', 'C', 31.5),
(11, 'Asselmacher', 'Paul', 'M', 'Görlitzerweg', 22, 53340, 1, '2006-04-01', 'B', 22.8),
(12, 'Dussa', 'Jörg', 'M', 'Im Biergarten', 24, 53113, 1, '2012-01-31', 'D', 35);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mitarbeiterstandorte`
--

CREATE TABLE IF NOT EXISTS `mitarbeiterstandorte` (
  `mitarbeiterid` int(11) NOT NULL,
  `standort` varchar(2) NOT NULL,
  PRIMARY KEY (`mitarbeiterid`,`standort`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `mitarbeiterstandorte`
--

INSERT INTO `mitarbeiterstandorte` (`mitarbeiterid`, `standort`) VALUES
(1, 'H'),
(1, 'I'),
(2, 'I'),
(3, 'H'),
(4, 'I'),
(5, 'I'),
(6, 'H');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `plz`
--

CREATE TABLE IF NOT EXISTS `plz` (
  `plz` int(11) NOT NULL,
  `ort` varchar(30) NOT NULL,
  PRIMARY KEY (`plz`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `plz`
--

INSERT INTO `plz` (`plz`, `ort`) VALUES
(50105, 'Köln'),
(50129, 'Bergheim'),
(50170, 'Kerpen'),
(53111, 'Bonn'),
(53113, 'Bonn'),
(53117, 'Bonn'),
(53191, 'Weilerswist'),
(53229, 'Bonn'),
(53332, 'Bornheim'),
(53340, 'Meckenheim'),
(53840, 'Troisdorf');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `standorte`
--

CREATE TABLE IF NOT EXISTS `standorte` (
  `standort` varchar(1) NOT NULL,
  `strasse` varchar(50) NOT NULL,
  `hausnummer` int(11) NOT NULL,
  `plz` int(11) NOT NULL,
  `koordinatennord` float NOT NULL,
  `koordniatensued` float NOT NULL,
  PRIMARY KEY (`standort`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `standorte`
--

INSERT INTO `standorte` (`standort`, `strasse`, `hausnummer`, `plz`, `koordinatennord`, `koordniatensued`) VALUES
('H', 'Loerstrasse', 20, 53113, 50.7269, 102279),
('I', 'Koenigstrasse', 68, 53113, 50.7269, 98474);
--
-- Datenbank: `eurodata`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `abteilung`
--

CREATE TABLE IF NOT EXISTS `abteilung` (
  `ID` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `Bezeichnung` varchar(30) NOT NULL DEFAULT '',
  `Etat` double NOT NULL DEFAULT '0',
  `A_Leiter` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `A_Leiter` (`A_Leiter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `abteilung`
--

INSERT INTO `abteilung` (`ID`, `Bezeichnung`, `Etat`, `A_Leiter`) VALUES
(01, 'Rechnungswesen', 4000, 611),
(02, 'Projektabwicklung', 20000, 809),
(03, 'Personalwesen', 3000, 710),
(04, 'Kindergarten', 1550, 105);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kind`
--

CREATE TABLE IF NOT EXISTS `kind` (
  `MNr` smallint(4) NOT NULL DEFAULT '0',
  `Vorname` varchar(30) NOT NULL DEFAULT '',
  `GebDatum` date NOT NULL DEFAULT '0000-00-00',
  KEY `MNr` (`MNr`),
  KEY `Vorname` (`Vorname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `kind`
--

INSERT INTO `kind` (`MNr`, `Vorname`, `GebDatum`) VALUES
(100, 'Pia', '2001-08-05'),
(101, 'Benedikt', '2000-07-20'),
(101, 'Heidi', '1998-02-02'),
(101, 'Martin', '1999-07-20'),
(207, 'Gudrun', '1998-06-04'),
(701, 'Patrick', '2001-09-01'),
(711, 'Daniela', '2000-07-17'),
(711, 'Sarah', '2000-08-05'),
(711, 'Toni', '2000-08-05'),
(805, 'Daniela', '2001-05-05'),
(805, 'Tobias', '1999-07-06'),
(809, 'Kathrin', '1998-03-04');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mitarbeiter`
--

CREATE TABLE IF NOT EXISTS `mitarbeiter` (
  `MNr` smallint(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `Name` varchar(30) NOT NULL DEFAULT '',
  `Vorname` varchar(30) NOT NULL DEFAULT '',
  `Strasse` varchar(30) NOT NULL DEFAULT '',
  `PLZ` varchar(5) NOT NULL DEFAULT '',
  `Ort` varchar(30) NOT NULL DEFAULT '',
  `Telefon` varchar(20) DEFAULT NULL,
  `Geschlecht` enum('m','w') NOT NULL DEFAULT 'm',
  `eingestellt` date NOT NULL DEFAULT '0000-00-00',
  `KFZ1` varchar(10) NOT NULL DEFAULT '',
  `KFZ2` varchar(10) NOT NULL DEFAULT '',
  `Abteilung` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  PRIMARY KEY (`MNr`),
  KEY `Abteilung` (`Abteilung`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `mitarbeiter`
--

INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES
(0100, 'Meier', 'Inge', 'Amselweg 11', '53101', 'Bonn', '0228/124578', 'w', '1995-01-01', 'BN-X 123', 'BN-A 911', 02),
(0101, 'Schneider', 'Ute', 'Hauptstr. 17', '50012', 'Köln', '0221/215211', 'w', '1995-01-01', 'K-OK 777', '', 03),
(0105, 'Berg', 'Anton', 'Am Funkturm 156', '65203', 'Wiesbaden', '0611/928792', 'm', '1995-09-01', 'WI-AK 421', '', 04),
(0108, 'Wasser', 'Ute', 'Weststr. 20', '52074', 'Aachen', '0241/875554', 'w', '1995-12-01', 'AC-UW 222', 'AW-UW 333', 02),
(0200, 'Huber', 'Sepp', 'Bodenseestr. 123', '81243', 'München', '089/8744397', 'm', '1996-02-01', 'M-A 6666', 'M-A 7777', 02),
(0207, 'Schmitz', 'Hans', 'Siegburger Str. 51', '50679', 'Köln', '0221/814447', 'm', '1996-05-01', 'K-XR 333', '', 03),
(0209, 'Schmidt', 'Jürgen', 'Osdorfer Weg 7', '22607', 'Hamburg', '040/899899', 'm', '1996-05-01', 'HH-H 111', '', 01),
(0611, 'Kammer', 'Ulrike', 'Hauptstr. 171', '52146', 'Würselen', '02405/712217', 'w', '1998-06-01', '', '', 00),
(0700, 'Klein', 'Kurth', 'Jollystr. 99', '76137', 'Karlsruhe', '0721/9812124', 'm', '1996-09-15', 'KA-RU 55', 'KA-MK 917', 02),
(0701, 'Huber', 'Anke', 'Gabelsberger Str. 70', '86199', 'Augsburg', '0821/98666', 'w', '1996-12-01', 'A-VV 454', 'A-XX 123', 02),
(0710, 'Schmidt', 'Beate', 'Klosterstr. 1', '40211', 'Düsseldorf', '0211/363636', 'w', '1997-04-01', 'D-K6767', 'D-K 6666', 02),
(0711, 'Bauer', 'Klaus', 'Spielhagenstr. 113', '30107', 'Hannover', '0511/833883', 'm', '1997-04-01', 'H-RR 309', 'H-ZU 777', 02),
(0777, 'Schmied', 'Olga', 'Ahrallee 77', '53474', 'Bad Neuenahr - Ahrweiler', '02641/909090', 'w', '1986-09-17', 'AW-XY 34', '', 02),
(0788, 'Schmitt', 'Hannelore', 'Im Roßberg 123', '53505', 'Altenahr', '02643/996633', 'w', '1985-06-18', 'AW-BA 13', 'AW-BB 13', 03),
(0800, 'Meier', 'Anton', 'Tiroler Weg 32', '79111', 'Freiburg', '0761/443444', 'm', '1997-06-01', 'FR-GG 373', '', 02),
(0802, 'Meier', 'Doris', 'Hauptstr.32', '98528', 'Suhl', '03681/440044', 'w', '1998-01-01', 'SUIH-L 111', '', 02),
(0803, 'Schmidt', 'Barbara', 'Rößlerstr. 33', '09120', 'Chemnitz', '0371/525212', 'w', '1998-01-01', 'CH-GE 919', '', 01),
(0804, 'Walczak', 'Hildegard', 'Altleubnitz 21', '01219', 'Dresden', '0351/788285', 'w', '1998-05-15', 'DR-DN 5421', '', 02),
(0805, 'Schmitz', 'Klaus', 'Vogelsanger Str.77', '50666', 'Köln', '0221/561112', 'm', '1998-06-01', 'K-Q 3456', '', 02),
(0806, 'Lausen', 'Werner', 'Münstereifeler Str. 22', '53879', 'Euskirchen', '02251/868657', 'm', '1998-06-01', 'EU-R 9999', '', 03),
(0807, 'Görner', 'Heidrun', 'Waldstr. 97', '51145', 'Köln-Porz', '02203/912778', 'w', '1998-06-01', 'K-P 5555', 'K-P 6666', 02),
(0809, 'Preuß', 'Karl', 'Peter-Paul-Str. 67', '52249', 'Eschweiler', '02403/151515', 'm', '1998-06-01', '', '', 01),
(0810, 'Messner', 'Bärbel', 'Levenstr. 88', '50259', 'Pulheim', '02238/980021', 'w', '1998-06-01', 'K-ZT 850', '', 01);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `projekt`
--

CREATE TABLE IF NOT EXISTS `projekt` (
  `ProjNr` int(2) unsigned zerofill NOT NULL DEFAULT '00',
  `Bezeichnung` varchar(50) NOT NULL DEFAULT '',
  `Auftragswert` double NOT NULL DEFAULT '0',
  `bezahlt` double DEFAULT NULL,
  `Beginn` date NOT NULL DEFAULT '0000-00-00',
  `Ende` date DEFAULT NULL,
  `Storno` enum('0','1') NOT NULL DEFAULT '0',
  `Leiter` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProjNr`),
  KEY `Leiter` (`Leiter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `projekt`
--

INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES
(77, 'Umzug Stein AG', 50000, 12000, '2006-06-30', NULL, '0', 100),
(78, 'Einrichtung Apache-WEB-Server, Moberg GmbH', 8000, 0, '2006-07-01', '2006-07-15', '0', 810),
(79, 'Aufbau Intranet, Druckerei Wolff', 35000, 7500, '2006-09-01', NULL, '0', 200),
(80, 'Vernetzung, Bau AG', 60000, NULL, '1998-07-01', '2006-07-31', '1', 800),
(81, 'Vernetzung, Großmann', 24000, 5000, '2006-07-05', NULL, '0', 100),
(82, 'DV-Labor, BBS III', 40000, 0, '2006-08-01', NULL, '0', 101),
(84, 'Umzug Stadtanzeiger', 180000, 30000, '2006-08-01', NULL, '0', 805),
(85, 'Umrüstung Neumann OHG', 12000, NULL, '2006-07-01', NULL, '1', 700),
(86, 'Linux-Server, Stadtverwaltung Brühl', 15000, NULL, '2006-08-10', NULL, '0', 809),
(87, 'Win-Server, Lacke Hansen', 25000, NULL, '2006-06-01', '2006-06-10', '1', 803),
(88, 'Adabas-SQL-Server, MTech', 20000, 3000, '2006-09-01', NULL, '0', 804),
(89, 'Office-Schulung, BATIX', 6000, NULL, '2006-10-01', NULL, '0', 803),
(90, 'Umstellung Windows- auf Linux-Server, Zuckmann', 9500, NULL, '2006-10-08', NULL, '0', 200),
(91, 'Schulung, Naumann & Co.', 5000, NULL, '2006-10-15', NULL, '0', 810);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `projektmitarbeiter`
--

CREATE TABLE IF NOT EXISTS `projektmitarbeiter` (
  `ProjNr` int(2) unsigned zerofill NOT NULL DEFAULT '00',
  `MNr` smallint(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `Zeitanteil` tinyint(3) DEFAULT NULL,
  KEY `ProjNr` (`ProjNr`),
  KEY `MNr` (`MNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `projektmitarbeiter`
--

INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES
(77, 0100, 10),
(77, 0701, 5),
(77, 0805, 20),
(78, 0804, 6),
(78, 0810, 8),
(79, 0200, 10),
(79, 0701, 30),
(80, 0105, 20),
(80, 0108, 5),
(80, 0711, 3),
(80, 0800, 5),
(80, 0803, 5),
(80, 0804, 5),
(81, 0100, 3),
(81, 0806, 10),
(81, 0807, 10),
(81, 0809, 20),
(82, 0101, 5),
(82, 0207, 30),
(82, 0710, 5),
(84, 0108, 5),
(84, 0700, 3),
(84, 0710, 5),
(85, 0700, 35),
(86, 0804, 6),
(86, 0809, 10),
(87, 0803, 10),
(88, 0101, 3),
(88, 0711, 5),
(88, 0804, 15),
(89, 0803, 20),
(89, 0807, 10),
(90, 0200, 5),
(90, 0802, 25),
(91, 0108, 8),
(91, 0800, 12),
(91, 0810, 5),
(89, 0803, 20),
(89, 0807, 10),
(90, 0200, 5),
(90, 0802, 25),
(91, 0108, 8),
(91, 0800, 12),
(91, 0810, 5);
--
-- Datenbank: `phpmyadmin`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma_bookmark`
--

CREATE TABLE IF NOT EXISTS `pma_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma_column_info`
--

CREATE TABLE IF NOT EXISTS `pma_column_info` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin' AUTO_INCREMENT=33 ;

--
-- Daten für Tabelle `pma_column_info`
--

INSERT INTO `pma_column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`) VALUES
(1, 'Platon', 'geschlecht', 'id', '', '', '_', ''),
(2, 'Platon', 'geschlecht', 'klartext', '', '', '_', ''),
(3, 'Platon', 'standorte', 'gebÃ¤ude', '', '', '_', ''),
(4, 'Platon', 'standorte', 'strasse', '', '', '_', ''),
(5, 'Platon', 'standorte', 'hausnummer', '', '', '_', ''),
(6, 'Platon', 'standorte', 'plz', '', '', '_', ''),
(7, 'Platon', 'standorte', 'koordinaten nord', '', '', '_', ''),
(8, 'Platon', 'standorte', 'koordniaten sued', '', '', '_', ''),
(9, 'Platon', 'plz', 'plz', '', '', '_', ''),
(10, 'Platon', 'plz', 'ort', '', '', '_', ''),
(11, 'Platon', 'fachgebiete', 'id', '', '', '_', ''),
(12, 'Platon', 'fachgebiete', 'name', '', '', '_', ''),
(13, 'Platon', 'fachgebiete', 'leitung', '', '', '_', ''),
(14, 'Platon', 'gehalt', 'gehaltsgruppe', '', '', '_', ''),
(15, 'Platon', 'gehalt', 'grundgehalt', '', '', '_', ''),
(16, 'Platon', 'mitarbeiter', 'mitarbeiterid', '', '', '_', ''),
(17, 'Platon', 'mitarbeiter', 'name', '', '', '_', ''),
(18, 'Platon', 'mitarbeiter', 'vorname', '', '', '_', ''),
(19, 'Platon', 'mitarbeiter', 'geschlecht', '', '', '_', ''),
(20, 'Platon', 'mitarbeiter', 'strasse', '', '', '_', ''),
(21, 'Platon', 'mitarbeiter', 'hausnummer', '', '', '_', ''),
(22, 'Platon', 'mitarbeiter', 'plz', '', '', '_', ''),
(23, 'Platon', 'mitarbeiter', 'fachgebiet', '', '', '_', ''),
(24, 'Platon', 'mitarbeiter', 'eintrittsdatum', '', '', '_', ''),
(25, 'Platon', 'mitarbeiter', 'gehaltsgruppe', '', '', '_', ''),
(26, 'Platon', 'mitarbeiter', 'stundensatz', '', '', '_', ''),
(27, 'Platon', 'standorte', 'koordinatennord', '', '', '_', ''),
(28, 'Platon', 'standorte', 'koordniatensued', '', '', '_', ''),
(29, 'Platon', 'mitarbeiterstandorte', 'mitarbeiterid', '', '', '_', ''),
(30, 'Platon', 'mitarbeiterstandorte', 'gebÃ¤ude', '', '', '_', ''),
(31, 'Platon', 'standorte', 'standort', '', '', '_', ''),
(32, 'Platon', 'mitarbeiterstandorte', 'standort', '', '', '_', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma_designer_coords`
--

CREATE TABLE IF NOT EXISTS `pma_designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma_history`
--

CREATE TABLE IF NOT EXISTS `pma_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`,`db`,`table`,`timevalue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma_pdf_pages`
--

CREATE TABLE IF NOT EXISTS `pma_pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`page_nr`),
  KEY `db_name` (`db_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma_recent`
--

CREATE TABLE IF NOT EXISTS `pma_recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Daten für Tabelle `pma_recent`
--

INSERT INTO `pma_recent` (`username`, `tables`) VALUES
('root', '[{"db":"Platon","table":"mitarbeiterstandorte"},{"db":"Platon","table":"standorte"},{"db":"Platon","table":"mitarbeiter"},{"db":"Platon","table":"geschlecht"},{"db":"Platon","table":"mitarbeitergeb\\u00e4ude"},{"db":"Platon","table":"fachgebiete"},{"db":"Platon","table":"plz"},{"db":"Platon","table":"mitarbeitergebaeude"},{"db":"Platon","table":"gehalt"},{"db":"Platon","table":"mirarbeiter"}]');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma_relation`
--

CREATE TABLE IF NOT EXISTS `pma_relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  KEY `foreign_field` (`foreign_db`,`foreign_table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma_table_coords`
--

CREATE TABLE IF NOT EXISTS `pma_table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma_table_info`
--

CREATE TABLE IF NOT EXISTS `pma_table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma_table_uiprefs`
--

CREATE TABLE IF NOT EXISTS `pma_table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`,`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma_tracking`
--

CREATE TABLE IF NOT EXISTS `pma_tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`db_name`,`table_name`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma_userconfig`
--

CREATE TABLE IF NOT EXISTS `pma_userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Daten für Tabelle `pma_userconfig`
--

INSERT INTO `pma_userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2016-11-08 07:17:27', '{"lang":"de"}');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
