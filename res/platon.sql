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
(6, 'Sanders', 'Udo', 'M', 'Keltenstrasse', 84, 53229, 1, '2001-08-01', 'C', 30.7);

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
