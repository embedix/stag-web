-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Vytvořeno: Čtv 22. lis 2018, 00:05
-- Verze serveru: 10.1.37-MariaDB-0+deb9u1
-- Verze PHP: 5.6.38-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Databáze: `strasilnet02`
--
CREATE DATABASE IF NOT EXISTS `strasilnet02` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `strasilnet02`;

-- --------------------------------------------------------

--
-- Struktura tabulky `active_guests`
--

CREATE TABLE `active_guests` (
  `ip` varchar(15) NOT NULL DEFAULT '',
  `timestamp` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `active_guests`
--


-- --------------------------------------------------------

--
-- Struktura tabulky `active_users`
--

CREATE TABLE `active_users` (
  `username` varchar(30) NOT NULL DEFAULT '',
  `timestamp` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabulky `banned_users`
--

CREATE TABLE `banned_users` (
  `username` varchar(30) NOT NULL DEFAULT '',
  `timestamp` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `username` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  `userid` varchar(32) DEFAULT NULL,
  `userlevel` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `timestamp` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `users`
--
-- data odstranena /osobni udaje/
-- --------------------------------------------------------

--
-- Struktura tabulky `verze`
--

CREATE TABLE `verze` (
  `cisloverze` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `verze`
--

INSERT INTO `verze` (`cisloverze`) VALUES
(404);

-- --------------------------------------------------------

--
-- Struktura tabulky `vozy`
--

CREATE TABLE `vozy` (
  `id` int(10) UNSIGNED NOT NULL,
  `hnaci` tinyint(10) UNSIGNED DEFAULT NULL,
  `trida` varchar(30) DEFAULT NULL,
  `nazev` varchar(25) DEFAULT NULL,
  `popis` varchar(250) DEFAULT NULL,
  `vykon` int(10) UNSIGNED DEFAULT NULL,
  `hmotnost` int(10) UNSIGNED DEFAULT NULL,
  `delka` float DEFAULT NULL,
  `osob` int(10) UNSIGNED DEFAULT NULL,
  `typ_nakladu` varchar(100) DEFAULT NULL,
  `max_rych` int(5) UNSIGNED DEFAULT NULL,
  `naklad` int(11) DEFAULT NULL,
  `max_rych_hnaci` smallint(5) UNSIGNED DEFAULT NULL,
  `elektro` tinyint(3) UNSIGNED DEFAULT NULL,
  `vyrobce` varchar(100) DEFAULT NULL,
  `sila` int(10) UNSIGNED DEFAULT NULL,
  `autor` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `vozy`
--

INSERT INTO `vozy` (`id`, `hnaci`, `trida`, `nazev`, `popis`, `vykon`, `hmotnost`, `delka`, `osob`, `typ_nakladu`, `max_rych`, `naklad`, `max_rych_hnaci`, `elektro`, `vyrobce`, `sila`, `autor`) VALUES
(1, 0, 'Nákladní vozy speciální', 'Ua', 'Vuz na sypke hmoty speciální', 0, 27, 10, 0, 'sypké hmoty', 50, 52, 80, 0, '', 0, 'puvodni'),
(2, 0, 'Nákladní vozy speciální', 'Flls S', 'Vuz na sypke hmoty', 0, 22, 16, 0, 'štěrk', 65, 58, 80, 0, '', 0, 'puvodni'),
(3, 0, 'Nákladní vozy speciální', 'Flls', 'Vuz na sypke hmoty', 0, 22, 16, 0, 'sypké hmoty', 65, 58, 80, 0, '', 0, 'puvodni'),
(8, 0, 'Nákladní vozy cisternové', 'Zags', 'Vuz na tekuté hmoty', 0, 22, 13, 0, 'tekuté hmoty', 100, 48, 80, 0, '', 0, 'puvodni'),
(9, 0, 'Nákladní vozy cisternové', 'Zaes s', 'Vuz na tekuté hmoty', 0, 26, 12, 0, 'tekuté hmoty', 120, 54, 80, 0, '', 0, 'puvodni'),
(10, 0, 'Nákladní vozy cisternové', 'Zaes zl', 'Vuz na tekuté hmoty', 0, 26, 12, 0, 'tekuté hmoty', 120, 54, 80, 0, '', 0, 'puvodni'),
(11, 0, 'Nákladní vozy cisternové', 'Zacens', 'Vuz na tekuté hmoty', 0, 24, 15, 0, 'tekutá síra', 120, 66, 80, 0, '', 0, 'puvodni'),
(12, 0, 'Nákladní vozy cisternové', 'Ups', 'Vuz na sypké hmoty', 0, 14, 12, 0, 'sypké hmoty', 100, 27, 80, 0, '', 0, 'puvodni'),
(13, 0, 'Nákladní vozy cisternové', 'Ugps', 'Vuz na sypké hmoty', 0, 17, 14, 0, 'sypké hmoty', 100, 28, 80, 0, '', 0, 'puvodni'),
(14, 0, 'Nákladní vozy cisternové', 'Uasc c', 'Vuz na sypké hmoty', 0, 23, 14, 0, 'sypké hmoty', 100, 57, 80, 0, '', 0, 'puvodni'),
(15, 0, 'Nákladní vozy cisternové', 'Uasc m', 'Vuz na sypké hmoty', 0, 23, 14, 0, 'sypké hmoty', 100, 57, 80, 0, '', 0, 'puvodni'),
(16, 0, 'Nákladní vozy cisternové', 'Uapgs', 'Vuz na tekuté hmoty', 0, 24, 15, 0, 'tekuté hmoty', 100, 48, 80, 0, '', 0, 'puvodni'),
(18, 0, 'Nákladní vozy cisternové', 'Uacns c', 'Vuz na sypke hmoty', 0, 19, 18, 0, 'sypké hmoty', 120, 72, 80, 0, '', 0, 'puvodni'),
(19, 0, 'Nákladní vozy cisternové', 'DEC m', 'Vuz na tekute hmoty', 0, 24, 13, 0, 'tekuté hmoty', 100, 56, 80, 0, '', 0, 'puvodni'),
(20, 0, 'Nákladní vozy cisternové', 'DEC c', 'Vuz na tekute hmoty', 0, 24, 13, 0, 'tekuté hmoty', 100, 56, 80, 0, '', 0, 'puvodni'),
(21, 0, 'Nákladní vozy cisternové', 'DEC zl', 'Vuz na tekute hmoty', 0, 24, 13, 0, 'tekuté hmoty', 100, 56, 80, 0, '', 0, 'puvodni'),
(22, 0, 'Nákladní vozy cisternové', 'DEC b', 'Vuz na tekute hmoty', 0, 24, 13, 0, 'tekuté hmoty', 100, 56, 80, 0, '', 0, 'puvodni'),
(23, 0, 'Nákladní vozy plošinové', 'Rmms Ka', 'Vuz na kusové zboží', 0, 28, 18, 0, 'kabely', 120, 52, 80, 0, '', 0, 'puvodni'),
(24, 0, 'Nákladní vozy plošinové', 'Rmms', 'Vuz na kusové zboží', 0, 28, 18, 0, 'kusové zboží', 120, 52, 80, 0, '', 0, 'puvodni'),
(25, 0, 'Nákladní vozy plošinové', 'Ress T', 'Vuz na kusové zboží', 0, 25, 20, 0, 'trubky', 100, 55, 80, 0, '', 0, 'puvodni'),
(26, 0, 'Nákladní vozy plošinové', 'Ress Ka', 'Vuz na kusové zboží', 0, 25, 20, 0, 'kabely', 100, 55, 80, 0, '', 0, 'puvodni'),
(27, 0, 'Nákladní vozy plošinové', 'Ress', 'Vuz na kusové zboží', 0, 25, 20, 0, 'kusové zboží', 120, 55, 80, 0, '', 0, 'puvodni'),
(28, 0, 'Nákladní vozy plošinové', 'Paop A', 'Vuz na přepravu automobilů', 0, 28, 16, 0, 'automobily', 100, 52, 80, 0, '', 0, 'puvodni'),
(29, 0, 'Nákladní vozy plošinové', 'Paop', 'Vuz na přepravu automobilů', 0, 28, 16, 0, 'automobily', 120, 52, 80, 0, '', 0, 'puvodni'),
(31, 0, 'Nákladní vozy plošinové', 'Paon', 'Vuz na kusové a sypké zboží', 0, 23, 15, 0, 'kusové zboží', 80, 57, 80, 0, '', 0, 'puvodni'),
(32, 0, 'Nákladní vozy plošinové', 'Pao Pl', 'Vuz na kusové zboží', 0, 26, 15, 0, 'plech', 100, 54, 80, 0, '', 0, 'puvodni'),
(33, 0, 'Nákladní vozy plošinové', 'Pao Kov', 'Vuz na kusové zboží', 0, 26, 15, 0, 'opracované ingoty', 100, 54, 80, 0, '', 0, 'puvodni'),
(34, 0, 'Nákladní vozy plošinové', 'Pao Ko', 'Vuz na kusové zboží', 0, 26, 15, 0, 'kontejnery', 100, 54, 80, 0, '', 0, 'puvodni'),
(35, 0, 'Nákladní vozy plošinové', 'Pao Ka', 'Vuz na kusové zboží', 0, 26, 15, 0, 'kabely', 100, 54, 80, 0, '', 0, 'puvodni'),
(36, 0, 'Nákladní vozy plošinové', 'Pao D', 'Vuz na kusové zboží', 0, 26, 15, 0, 'dřevo', 100, 54, 80, 0, '', 0, 'puvodni'),
(37, 0, 'Nákladní vozy plošinové', 'Pao', 'Vuz na kusové zboží', 0, 26, 15, 0, 'kusové zboží', 120, 54, 80, 0, '', 0, 'puvodni'),
(39, 0, 'Nákladní vozy plošinové', 'Npp', 'Vuz na přepravu automobilů', 0, 17, 15, 0, 'automobily', 100, 18, 80, 0, '', 0, 'puvodni'),
(40, 0, 'Nákladní vozy plošinové', 'Lpsc A', 'Dvojitý vuz na přepravu', 0, 27, 26, 0, 'automobily', 100, 25, 80, 0, '', 0, 'puvodni'),
(41, 0, 'Nákladní vozy plošinové', 'Lpsc', 'Dvojitý vuz na přepravu', 0, 27, 26, 0, 'automobily', 100, 25, 80, 0, '', 0, 'puvodni'),
(42, 0, 'Nákladní vozy plošinové', 'Ks D', 'Vuz na kusové zboží', 0, 14, 13, 0, 'dřevo', 100, 30, 80, 0, '', 0, 'puvodni'),
(43, 0, 'Nákladní vozy plošinové', 'Ks', 'Vuz na kusové zboží', 0, 14, 13, 0, 'kusové zboží', 120, 30, 80, 0, '', 0, 'puvodni'),
(47, 0, 'Nákladní vozy uzavřené', 'Tbis', 'Vuz na kusové zboží', 0, 15, 15, 0, 'kusové zboží', 120, 26, 80, 0, '', 0, 'puvodni'),
(54, 0, 'Nákladní vozy uzavřené', 'Rils b', 'Vuz na kusové zboží', 0, 25, 19.9, 0, 'kusové zboží', 120, 55, 80, 0, '', 0, 'puvodni'),
(55, 0, 'Nákladní vozy uzavřené', 'Rils m', 'Vuz na kusové zboží', 0, 25, 19.9, 0, 'kusové zboží', 120, 55, 80, 0, '', 0, 'puvodni'),
(56, 0, 'Nákladní vozy uzavřené', 'Rils c', 'Vuz na kusové zboží', 0, 25, 18, 0, 'kusové zboží', 120, 55, 80, 0, '', 0, 'puvodni'),
(57, 0, 'Nákladní vozy uzavřené', 'Rils s', 'Vuz na kusové zboží', 0, 25, 19.9, 0, 'kusové zboží', 120, 55, 80, 0, '', 0, 'puvodni'),
(62, 0, 'Nákladní vozy uzavřené', 'La', 'Chladirenský vuz na kusové', 0, 34, 16, 0, 'pouze potrainy', 100, 37, 80, 0, '', 0, 'puvodni'),
(63, 0, 'Nákladní vozy uzavřené', 'L', 'Vuz na kusové zboží', 0, 12, 12, 0, 'pouze potrainy', 100, 28, 80, 0, '', 0, 'puvodni'),
(64, 0, 'Nákladní vozy uzavřené', 'Iacqr', 'Chladirenský vuz na kusové', 0, 30, 16, 0, 'kusové zboží', 100, 30, 80, 0, '', 0, 'puvodni'),
(68, 0, 'Nákladní vozy uzavřené', 'Haikks', 'Vuz na kusové zboží', 0, 28, 19, 0, 'kusové zboží', 120, 56, 80, 0, '', 0, 'puvodni'),
(69, 0, 'Nákladní vozy uzavřené', 'Hbbillns', 'Vuz na kusové zboží', 0, 17, 16, 0, 'kusové zboží', 120, 27, 80, 0, '', 0, 'puvodni'),
(70, 0, 'Nákladní vozy uzavřené', 'Habbillns', 'Vuz na kusové zboží', 0, 30, 24, 0, 'kusové zboží', 100, 60, 80, 0, '', 0, 'puvodni'),
(71, 0, 'Nákladní vozy uzavřené', 'Habbins', 'Vuz na kusové zboží', 0, 29, 18, 0, 'kusové zboží', 120, 61, 80, 0, '', 0, 'puvodni'),
(72, 0, 'Nákladní vozy uzavřené', 'Gogs', 'Vuz na kusové zboží (obilí)', 0, 25, 16, 0, 'převážně obilí', 100, 55, 80, 0, '', 0, 'puvodni'),
(73, 0, 'Nákladní vozy uzavřené', 'Gbs', 'Vuz na kusové zboží', 0, 15, 16, 0, 'kusové zboží', 100, 26, 80, 0, '', 0, 'puvodni'),
(74, 0, 'Nákladní vozy uzavřené', 'Gbqs', 'Vuz na kusové zboží (len)', 0, 15, 14, 0, 'pouze len', 100, 25, 80, 0, '', 0, 'puvodni'),
(75, 0, 'Nákladní vozy uzavřené', 'Gbkkqss', 'Vuz na kusové zboží', 0, 16, 14, 0, 'kusové zboží', 100, 20, 80, 0, '', 0, 'puvodni'),
(76, 0, 'Nákladní vozy uzavřené', 'Gbkkqs', 'Vuz na kusové zboží', 0, 15, 14, 0, 'kusové zboží', 100, 24, 80, 0, '', 0, 'puvodni'),
(77, 0, 'Nákladní vozy uzavřené', 'Gags', 'Vuz na kusové zboží', 0, 25, 16, 0, 'kusové zboží', 100, 55, 80, 0, '', 0, 'puvodni'),
(78, 0, 'Nákladní vozy otevřené', 'Tdns', 'Vuz na sypke hmoty (hnojiva)', 0, 15, 9.7, 0, 'sypké hmoty', 120, 30, 80, 0, '', 0, 'puvodni'),
(79, 0, 'Nákladní vozy otevřené', 'Tdgns', 'Vuz na sypke hmoty', 0, 15, 10, 0, 'sypké hmoty', 120, 30, 80, 0, '', 0, 'puvodni'),
(80, 0, 'Nákladní vozy otevřené', 'Tcms', 'Vuz na sypke hmoty s', 0, 13, 10, 0, 'sypké hmoty', 100, 20, 80, 0, '', 0, 'puvodni'),
(81, 0, 'Nákladní vozy otevřené', 'Tads zl', 'Vuz na sypke hmoty s', 0, 20, 17, 0, 'sypké hmoty', 100, 60, 80, 0, '', 0, 'puvodni'),
(82, 0, 'Nákladní vozy otevřené', 'Tads s', 'Vuz na sypke hmoty s', 0, 20, 17, 0, 'sypké hmoty', 100, 60, 80, 0, '', 0, 'puvodni'),
(83, 0, 'Nákladní vozy speciální', 'Talls', 'Vuz na sypke hmoty s odklopnou stresni klapkou', 0, 29, 13, 0, 'sypké hmoty', 120, 51, 80, 0, '', 0, 'puvodni'),
(84, 0, 'Nákladní vozy otevřené', 'Vtr S', 'Vuz na sypke hmoty', 0, 12, 12, 0, 'šrot', 90, 30, 80, 0, '', 0, 'puvodni'),
(85, 0, 'Nákladní vozy otevřené', 'Vtr U', 'Vuz na sypke hmoty', 0, 12, 12, 0, 'uhlí', 90, 30, 80, 0, '', 0, 'puvodni'),
(86, 0, 'Nákladní vozy otevřené', 'Vtr R', 'Vuz na sypke hmoty', 0, 12, 12, 0, 'cukrová řepa', 90, 30, 80, 0, '', 0, 'puvodni'),
(87, 0, 'Nákladní vozy otevřené', 'Vtr D', 'Vuz na sypke hmoty', 0, 12, 12, 0, 'dřevo', 90, 30, 80, 0, '', 0, 'puvodni'),
(88, 0, 'Nákladní vozy otevřené', 'Vtr', 'Vuz na sypke hmoty', 0, 12, 12, 0, 'sypké hmoty', 100, 30, 80, 0, '', 0, 'puvodni'),
(89, 0, 'Nákladní vozy otevřené', 'Vsa S', 'Vuz vysokostěný na sypke', 0, 24, 16, 0, 'šrot', 100, 55, 80, 0, '', 0, 'puvodni'),
(90, 0, 'Nákladní vozy otevřené', 'Vsa U', 'Vuz vysokostěný na sypke', 0, 24, 16, 0, 'uhlí', 100, 55, 80, 0, '', 0, 'puvodni'),
(91, 0, 'Nákladní vozy otevřené', 'VSa', 'Vuz vysokostěný na sypke', 0, 24, 16, 0, 'sypké hmoty', 100, 55, 80, 0, '', 0, 'puvodni'),
(95, 0, 'Nákladní vozy otevřené', 'Lhs', 'Vuz na sypke hmoty a kusové', 0, 21, 14, 0, 'sypké hmoty', 100, 52, 80, 0, '', 0, 'puvodni'),
(96, 0, 'Nákladní vozy otevřené', 'Fcc P', 'Vuz na sypke hmoty', 0, 13, 12, 0, 'písek', 80, 27, 80, 0, '', 0, 'puvodni'),
(97, 0, 'Nákladní vozy otevřené', 'Fcc', 'Vuz na sypke hmoty', 0, 12, 9.8, 0, 'sypké hmoty', 80, 28, 80, 0, '', 0, 'puvodni'),
(98, 0, 'Nákladní vozy otevřené', 'Fals-z V', 'Vuz na sypke hmoty', 0, 24, 12.3, 0, 'vápenec', 100, 57, 80, 0, '', 0, 'puvodni'),
(99, 0, 'Nákladní vozy otevřené', 'Fals-z U', 'Vuz na sypke hmoty', 0, 24, 12.3, 0, 'uhlí', 100, 57, 80, 0, '', 0, 'puvodni'),
(100, 0, 'Nákladní vozy otevřené', 'Fals-z', 'Vuz na sypke hmoty', 0, 24, 12.3, 0, 'sypké hmoty', 120, 57, 80, 0, '', 0, 'puvodni'),
(101, 0, 'Nákladní vozy otevřené', 'Falns V', 'Vuz na sypke hmoty', 0, 26, 15, 0, 'vápenec', 100, 47, 80, 0, '', 0, 'puvodni'),
(102, 0, 'Nákladní vozy otevřené', 'Falns U', 'Vuz na sypke hmoty', 0, 26, 13.5, 0, 'uhlí', 100, 47, 80, 0, '', 0, 'puvodni'),
(103, 0, 'Nákladní vozy otevřené', 'Falns', 'Vuz na sypke hmoty', 0, 27, 13.5, 0, 'sypké hmoty', 100, 47, 80, 0, '', 0, 'puvodni'),
(104, 0, 'Nákladní vozy otevřené', 'Faccs V', 'Vuz na sypke hmoty', 0, 23, 12.7, 0, 'vápenec', 90, 56, 80, 0, '', 0, 'puvodni'),
(105, 0, 'Nákladní vozy otevřené', 'Faccs S', 'Vuz na sypke hmoty', 0, 23, 12.7, 0, 'štěrk', 90, 56, 80, 0, '', 0, 'puvodni'),
(106, 0, 'Nákladní vozy otevřené', 'Faccs P', 'Vuz na sypke hmoty', 0, 23, 12.7, 0, 'písek', 90, 56, 80, 0, '', 0, 'puvodni'),
(107, 0, 'Nákladní vozy otevřené', 'Faccs', 'Vuz na sypke hmoty', 0, 23, 12.7, 0, 'sypké hmoty', 100, 56, 80, 0, '', 0, 'puvodni'),
(108, 0, 'Nákladní vozy otevřené', 'Eanos', 'Vůz na sypké hmoty s plachtou', 0, 23, 14, 0, 'sypké hmoty', 120, 56, 80, 0, '', 0, 'puvodni'),
(109, 0, 'Nákladní vozy otevřené', 'Eamos', 'Vůz na sypké hmoty s', 0, 24, 14, 0, 'sypké hmoty', 100, 56, 80, 0, '', 0, 'puvodni'),
(110, 0, 'Nákladní vozy otevřené', 'Eas-u S', 'Vůz na sypké hmoty', 0, 24, 14, 0, 'šrot', 90, 56, 80, 0, '', 0, 'puvodni'),
(111, 0, 'Nákladní vozy otevřené', 'Eas-u U', 'Vůz na sypké hmoty', 0, 24, 14, 0, 'uhlí', 90, 56, 80, 0, '', 0, 'puvodni'),
(112, 0, 'Nákladní vozy otevřené', 'Eas-u', 'Vůz na sypké hmoty', 0, 24, 14, 0, 'sypké hmoty', 100, 56, 80, 0, '', 0, 'puvodni'),
(113, 0, 'Nákladní vozy otevřené', 'Eal U', 'Vůz na sypké hmoty', 0, 22, 14, 0, 'uhlí', 80, 58, 80, 0, '', 0, 'puvodni'),
(114, 0, 'Nákladní vozy otevřené', 'Eal', 'Vůz na sypké hmoty', 0, 22, 14, 0, 'sypké hmoty', 80, 58, 80, 0, '', 0, 'puvodni'),
(1101, 1, 'El. jednotky střídavé', '4020_OBB', 'Elektrická jednotka ÖBB', 1200, 127, 67.4, 184, '', 120, 0, 120, 16, 'SGP, BES, BBC, ELIN, Siemens (1978-1987)', 117, NULL),
(1100, 1, 'Motorové jednotky', '5147_OBB', 'Dvouvozová motorová jednotka ÖBB', 419, 89, 49, 136, '', 120, 0, 120, 0, 'Jenbacher Werke (1992-1994)', 135, NULL),
(123, 0, 'Osobní 2. tř.', 'Brdu_PKP', 'Oddílový vůz 2. třídy, úprava pro přepravu kol', 0, 48, 24.5, 72, '', 160, 0, 80, 0, 'Pafawag Wroclaw (1969-1989)', 0, 'puvodni'),
(125, 0, 'Osobní 2. tř.', 'Bdu_PKP', 'Oddílový vůz 2. třídy', 0, 46, 24.5, 80, '', 120, 0, 80, 0, 'Pafawag Wroclaw (1969-1989)', 0, 'puvodni'),
(126, 0, 'Osobní 1. tř.', 'Adu_PKP', 'Oddílový vůz 1. třídy', 0, 38, 24.5, 54, '', 160, 0, 80, 0, 'Pafawag Wroclaw (1969-1990)', 0, 'puvodni'),
(128, 0, 'Osobní 2. tř.', 'Bd_PKP', 'Oddílový vůz 2. třídy', 0, 38, 24.5, 80, '', 120, 0, 80, 0, 'Pafawag Wroclaw (1969-1989)', 0, 'puvodni'),
(129, 0, 'Osobní 2. tř.', 'B_PKP', 'Oddílový vůz 2. třídy', 0, 39, 24.5, 80, '', 160, 0, 80, 0, 'Pafawag Wroclaw (1969-1989)', 0, 'puvodni'),
(130, 0, 'Osobní 1. tř.', 'A_PKP', 'Oddílový vůz 1. třídy', 0, 38, 24.5, 54, '', 160, 0, 80, 0, 'Pafawag Wroclaw (1969-1990)', 0, 'puvodni'),
(134, 0, 'Osobní 1. tř.', 'A_OBB', 'Oddílový vůz 1. třídy', 0, 38, 24.5, 48, '', 140, 0, 80, 0, '', 0, 'puvodni'),
(136, 0, 'Osobní vozy se služ.oddílem', 'BD_MAV', 'úprava z vozů Ds 95-80: služební oddíl upraven pro cestující, zbytek vozu uzpůsoben pro přepravu jízdních kol.', 0, 38, 24.5, 8, 'Kola', 140, 28, 80, 0, 'Szolnok, rekonstrukce pro MÁV 1996 - 2010', 0, 'puvodni'),
(137, 0, 'Osobní 2. tř.', 'B_MAV', 'Osobní vůz 2 třídy (1982)', 0, 39, 24.5, 80, '', 140, 0, 80, 0, '', 0, 'puvodni'),
(138, 0, 'Osobní 1. tř.', 'A_MAV', 'Osobní vůz 1 třídy (1972)', 0, 39, 24.5, 54, '', 140, 0, 80, 0, '', 0, 'puvodni'),
(142, 0, 'Osobní 1. tř.', 'A_DB', 'Oddílový vůz 1. třídy', 0, 38, 24.5, 54, '', 120, 0, 80, 0, 'Waggonbau Bautzen (1973-1974)', 0, 'puvodni'),
(143, 0, 'Osobní vozy restaurační', 'BRm ZSR', 'Osobní vůz 2 třídy (1975, reko', 0, 48, 26.4, 30, '', 140, 0, 80, 0, '', 0, 'puvodni'),
(145, 0, 'Osobní 2. tř.', 'B_ZSR', 'Osobní vůz 2 třídy (1975)', 0, 39, 24.5, 80, '', 140, 0, 80, 0, '', 0, 'puvodni'),
(146, 0, 'Osobní 2. tř.', 'Bmee_ZSSK', 'Oddílový vůz 2. třídy', 0, 48, 26.4, 66, '', 160, 0, 80, 0, 'Waggonbau Bautzen (1985-1989)', 0, 'puvodni'),
(147, 0, 'Osobní 2. tř.', 'BD_ZSR', 'Úprava z vozů Bc,jedna umývárna a část přilehlého oddílu upraveno na prostor pro přepravu jízdních kol.', 0, 38, 24.5, 58, 'Kola', 140, 2, 80, 0, 'ŽOS Vrútky, 2004 - 2008 (modernizace vozů Bc - Waggonbau Bautzen UIC - Y)', 0, 'puvodni'),
(148, 0, 'Osobní vozy se služ.oddílem', 'BDmee ZSR', 'Os. se služ odd. 2 třídy (1985,', 0, 37, 26.4, 40, '', 160, 0, 80, 0, '', 0, 'puvodni'),
(149, 0, 'Osobní 1. tř.', 'A_ZSR', 'Osobní vůz 1 třídy (1972) interval 19-41', 0, 42, 24.5, 54, '', 140, 0, 80, 0, '', 0, 'puvodni'),
(150, 0, 'Osobní 1. tř.', 'Amee_ZSR', 'Osobní vůz 1 třídy (1985)', 0, 40, 26.4, 66, '', 160, 0, 80, 0, '', 0, 'puvodni'),
(156, 0, 'Osobní vozy poštovní', 'Post 1.1', 'Poštovní vůz s 1 odd. (1980)', 0, 39, 24.5, 0, 'pošta', 140, 16, 80, 0, '', 0, 'puvodni'),
(157, 0, 'Osobní vozy lehátkový', 'WLB821', 'lůžkový vůz 2. třídy', 0, 50, 24.5, 30, '', 140, 0, 80, 0, 'VEB Wagonbau Bautzen 1974', 0, 'puvodni'),
(159, 0, 'Osobní vozy lůžkové', 'WLAB_CD', 'Lůžkový vůz 1. a 2. třídy', 0, 44, 24.5, 30, '', 160, 0, 80, 0, 'Waggonbau Görlitz (1984-1985)', 0, 'puvodni'),
(160, 0, 'Osobní vozy kombinované', 'Sa_CD', 'Osobní vůz salónní', 0, 38, 24.5, 12, '', 160, 0, 80, 0, 'Waggonbau Görlitz (1968,1971)', 0, 'puvodni'),
(167, 0, 'Osobní vozy restaurační', 'BRm', 'oddílový vůz 2. třídy s bufetovým oddílem', 0, 43, 26.4, 54, '', 140, 0, 80, 0, 'VEB Wagonbau Bautzen 1984, reko ŽOS České Velenice 1994', 0, 'puvodni'),
(169, 0, 'Osobní 2. tř.', 'Bymee_CSD', 'Osobní vůz 2 třídy (1989)', 0, 46, 26.4, 96, '', 160, 0, 80, 0, '', 0, 'puvodni'),
(170, 0, 'Osobní 2. tř.', 'Bmpz', 'Osobní vůz 2 třídy s klimatizací', 0, 49, 26.4, 80, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(172, 0, 'Osobní 2. tř.', 'Bmee', 'oddílový vůz 2. třídy (1985)', 0, 38, 26.4, 66, '', 160, 0, 80, 0, 'rekonstrukce 1994-1995', 0, 'puvodni'),
(173, 0, 'Osobní 2. tř.', 'Beer', 'osobní vůz 2. třídy s oddíly atypických velikostí', 0, 41, 24.5, 50, '', 140, 0, 80, 0, 'modernizace MOVO 1992-1994', 0, 'puvodni'),
(175, 0, 'Osobní 2. tř.', 'Btee_CD', 'Velkoprostorový vůz 2. třídy, ex Bt278', 0, 39, 24.5, 88, '', 120, 0, 80, 0, 'Vagónka Studénka (1969-1975), reko ŽOS České Velenice (2005-2007)', 0, 'puvodni'),
(177, 0, 'Osobní 2. tř.', 'Bee', 'oddílový / kombinovaný vůz 2. třídy', 0, 39, 24.5, 58, '', 140, 0, 80, 0, 'rekonstrukce České Velenice 1992, 1996-1997', 0, 'puvodni'),
(1223, 1, 'Kombinované lok.elektro/diesel', '799_CD', 'Lokomotiva řady 799 je dvouzdrojové hnací vozidlo;Lokomotivní řada 799 se používá výhradně pro posun lokomotiv a vozů v depech kolejových vozidel (DKV).', 37, 24, 7.24, 0, '', 10, 0, 10, 0, 'ČMKS Holding 1992-2000;Tyto lokomotivy byly rekounstruovány v letech 1992 až 2000', 62, NULL),
(187, 0, 'Osobní 2. tř.', 'Bai', 'Osobní vůz 2 třídy (1960)', 0, 39, 24.5, 80, '', 120, 0, 80, 0, '', 0, 'puvodni'),
(1095, 1, 'Motorové vozy', '831_KZC', '\'Loďák\' - osobní motorový vůz, historický nátěr, ex M 262.1', 309, 47, 21.2, 56, 'Kola', 90, 3, 90, 0, 'Vagonka Tatra Studénka (1952-1959)', 55, NULL),
(191, 0, 'Osobní 1. tř.', 'Ampz', 'Osobní vůz 1 třídy s klimatizací', 0, 47, 26.4, 58, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(192, 0, 'Osobní 1. tř.', 'Amee', 'Osobní vůz 1 třídy (1985)', 0, 40, 26.4, 66, '', 160, 0, 80, 0, '', 0, 'puvodni'),
(194, 0, 'Osobní 1. tř.', 'Aee', 'Oddílový vůz 1 třídy, rekonstrukce, interval 19-70', 0, 46, 24.5, 54, '', 160, 0, 80, 0, '', 0, 'puvodni'),
(200, 1, 'Řídící vozy', 'Bftn791', 'Přípojný řídící osobní vůz', 0, 38, 19.7, 64, 'Kola', 120, 2, 120, 0, 'Moravskoslezská Vagonka', 0, 'puvodni'),
(201, 1, 'Řídící vozy', '912_CD', '\'Kassandra\' - přípojný řídící osobní vůz', 0, 17, 14.22, 41, '', 80, 0, 80, 0, 'reko Pars Nova Šumperk, 2002', 0, 'puvodni'),
(209, 0, 'Přípojné vozy', '011 ZSR', 'Přípojný osobní vůz', 0, 16, 13.97, 53, '', 80, 0, 80, 0, 'Vagonka Tatra Studénka', 0, 'puvodni'),
(213, 1, 'Motorové vozy', '860', '\'Chrochtadlo\' - osobní motorový vůz', 480, 56, 24.5, 70, '', 100, 0, 100, 0, 'Vagonka Tatra Studénka, 1974', 103, 'puvodni'),
(214, 1, 'Motorové vozy', '854', '\'Katr\' - motorový osobní vůz', 588, 50, 24.79, 48, 'Kola', 120, 5, 120, 0, 'reko Pars Nova Šumperk, 1997-2006', 80, 'puvodni'),
(215, 1, 'Motorové vozy', '853', '\'Hydra\' - motorový osobní vůz', 588, 50, 24.79, 48, '', 120, 0, 120, 0, 'Vagonka Tatra Studénka, 1969-1970', 78, 'puvodni'),
(216, 1, 'Motorové vozy', '852', '\'Hydra\' - motorový osobní vůz', 588, 50, 24.79, 48, '', 120, 0, 120, 0, 'Vagonka Tatra Studénka, 1968-69', 78, 'puvodni'),
(217, 1, 'Motorové vozy', '851', '\'Krokodýl\' - osobní motorový vůz', 515, 50, 24.79, 48, 'Kola', 110, 5, 110, 0, 'Vagonka Tatra Studénka, 1967-1968', 77, 'puvodni'),
(218, 1, 'Motorové vozy', '850', '\'Krokodýl\' - osobní motorový vůz', 515, 50, 24.79, 48, 'Kola', 110, 5, 110, 0, 'Vagonka Tatra Studénka, 1962-1967', 77, 'puvodni'),
(219, 1, 'Motorové vozy', '843', '\'Rakev\' - osobní motorový vůz', 600, 56, 25.2, 64, 'Kola', 110, 5, 110, 0, 'Moravskoslezská Vagonka Studénka, 1995-1997', 100, 'puvodni'),
(220, 1, 'Motorové vozy', '842', '\'Kvatro\' - osobní motorový vůz', 424, 45, 25.2, 80, 'Kola', 100, 8, 100, 0, 'Moravskoslezská Vagonka Studénka, 1989-1994', 60, 'puvodni'),
(1533, 0, 'Osobní vozy kombinované', 'Br_KDS', 'Dvě třetiny vozu tvoří velkoprostorový oddíl s barem. Tento prostor slouží k různým společenským akcím a účelům, jako například svatby, oslavy, diskotéky, konference apod. Pro tyto účely je vůz vybaven profesionální audio a videotechnikou.', 0, 42, 24.5, 44, '', 120, 0, 0, 0, 'výrobce Vagónka Studénka', 0, NULL),
(223, 1, 'Motorové vozy', '830.1s', '\'Kredenc\' - motorový osobní vůz', 301, 43, 21.196, 56, 'Kola', 90, 3, 90, 0, 'Královopolská strojírna, 1949-1950', 45, 'puvodni'),
(224, 1, 'Motorové vozy', '820', '\'Singrovka\' - motorový osobní vůz', 206, 32, 18.5, 56, '', 70, 0, 70, 0, 'Vagonka Tatra Studénka, 1963-1964', 40, 'puvodni'),
(225, 1, 'Motorové vozy', '812_CD', '\'Esmeralda\' - motorový osobní vůz', 242, 22, 14.47, 38, 'Kola', 80, 3, 80, 0, 'reko PARS Nova Šumperk, 2001', 54, 'puvodni'),
(226, 1, 'Motorové vozy', '811_CD', 'Motorový osobní vůz', 155, 20, 14, 95, '', 80, 0, 80, 0, 'Vagonka Tatra Studénka (1973-1984), reko PARS Nova Šumperk (1997)', 40, 'puvodni'),
(227, 1, 'Motorové vozy', '810_CD', '\'Šukafon\' - motorový osobní vůz', 155, 20, 14, 95, '', 80, 0, 80, 0, 'Vagonka Tatra Studénka, 1973-1984', 29, 'puvodni'),
(228, 1, 'Motorové vozy', '801', 'Motorový osobní vůz', 114, 17, 12.1, 0, '', 60, 0, 60, 0, 'Tatra Kopřivnice (1948)', 28, 'puvodni'),
(229, 1, 'Dieselové lokomotivy', '781', 'Dieselelektrická lokomotiva', 1470, 116, 17.55, 0, '', 100, 0, 100, 0, 'Lokomotivka Vorošilovgrad', 285, 'puvodni'),
(230, 1, 'Dieselové lokomotivy', '775', 'Dieselelektrická lokomotiva', 1470, 111, 18, 0, '', 100, 0, 100, 0, 'ČKD Praha (1961)', 244, 'puvodni'),
(231, 1, 'Dieselové lokomotivy', '770', 'Dieselelektrická lokomotiva', 993, 115, 17.24, 0, '', 90, 0, 90, 0, 'SMZ Dubnica n.Váh. (1966)', 280, 'puvodni'),
(232, 1, 'Dieselové lokomotivy', '759', 'Lokomotiva 759 (do roku 1987 řada T 499.0) je dieselová lokomotiva s elektrickým přenosem výkonu.Pro svůj tvar čela s jedním velkým kulatým reflektorem pod oknem stanoviště strojvedoucího si vysloužila přezdívku „kyklop“.', 1766, 85, 17.84, 0, '', 140, 0, 140, 0, 'ČKD Praha (1974)', 270, 'puvodni'),
(233, 1, 'Dieselové lokomotivy', '754', 'Dieselelektrická lokomotiva', 1472, 74, 16.5, 0, '', 100, 0, 100, 0, 'ČKD Praha (1975)', 180, 'puvodni'),
(234, 1, 'Dieselové lokomotivy', '753', 'Dieselelektrická lokomotiva', 1325, 77, 16.5, 0, '', 100, 0, 100, 0, 'ČKD Praha (1970)', 215, 'puvodni'),
(235, 1, 'Dieselové lokomotivy', '752', 'Dieselelektrická lokomotiva', 1102, 74, 16.5, 0, '', 100, 0, 100, 0, 'ČKD Praha (1969)', 215, 'puvodni'),
(236, 1, 'Dieselové lokomotivy', '751', 'Dieselelektrická lokomotiva', 1103, 75, 16.5, 0, '', 100, 0, 100, 0, 'ČKD Praha (1966)', 215, 'puvodni'),
(237, 1, 'Dieselové lokomotivy', '743', 'Dieselelektrická lokomotiva', 800, 66, 13.6, 0, '', 90, 0, 90, 0, 'ČKD Praha (1987)', 123, 'puvodni'),
(238, 1, 'Dieselové lokomotivy', '742', 'Dieselelektrická lokomotiva', 883, 64, 13.6, 0, '', 90, 0, 90, 0, 'ČKD Praha (1977)', 192, 'puvodni'),
(239, 1, 'Dieselové lokomotivy', '735', 'Dieselelektrická lokomotiva', 927, 64, 14.18, 0, '', 90, 0, 90, 0, 'TS Martin (1973)', 192, 'puvodni'),
(240, 1, 'Dieselové lokomotivy', '731', 'Dieselelektrická lokomotiva', 600, 68, 15.28, 0, '', 80, 0, 80, 0, 'ČKD Praha (1990)', 205, 'puvodni'),
(242, 1, 'Dieselové lokomotivy', '721', 'Dieselelektrická lokomotiva', 552, 74, 13.26, 0, '', 80, 0, 80, 0, 'ČKD Praha (1962)', 186, 'puvodni'),
(243, 1, 'Dieselové lokomotivy', '714_CD', '\'Velké lego\' - dieselelektrická lokomotiva, ex 735', 600, 60, 14.2, 0, '', 80, 0, 80, 0, 'reko ČKD Praha (1992-1997)', 154, 'puvodni'),
(244, 1, 'Dieselové lokomotivy', '710', 'Dieselhydromechanická', 301, 41, 9.44, 0, '', 60, 0, 60, 0, 'ČKD Praha (1961)', 57, 'puvodni'),
(245, 1, 'Dieselové lokomotivy', '708', 'Dieselelektrická lokomotiva', 470, 37, 9.45, 0, '', 80, 0, 80, 0, 'ČKD Praha (1997)', 110, 'puvodni'),
(246, 1, 'Dieselové lokomotivy', '704', 'Dieselelektrická lokomotiva', 220, 29, 7.5, 0, '', 60, 0, 60, 0, 'ČKD Praha (1988)', 103, 'puvodni'),
(247, 1, 'Dieselové lokomotivy', '701', 'Dieselmechanická lokomotiva', 147, 22, 7.24, 0, '', 40, 0, 40, 0, 'ČKD Praha (1957)', 58, 'puvodni'),
(248, 1, 'Dieselové lokomotivy', '700', 'Dieselmechanická lokomotiva', 121, 22, 7.24, 0, '', 40, 0, 40, 0, 'ČKD Praha (1955)', 53, 'puvodni'),
(252, 1, 'El. jednotky stejnosměrné', '471_CD', '\'CityElefant/Ešus/Hliník\' - stejnosměrná elektrická jednotka', 2000, 156, 79.2, 310, 'Kola', 140, 12, 140, 1, 'ČKD Vagonka, Škoda Transportation (zač. 1997)', 99, 'puvodni'),
(253, 1, 'El. jednotky stejnosměrné', '470 z', '\'Zelený Kraken\' - elektrická stejnosměrná jednotka', 1952, 266, 132, 590, '', 120, 0, 120, 1, 'Moravskoslezská Vagonka Studénka, 1991', 262, 'puvodni'),
(254, 1, 'El. jednotky stejnosměrné', '470 s', '\'Modrý Kraken\' - elektrická stejnosměrná jednotka', 1952, 266, 132, 590, '', 120, 0, 120, 1, 'Moravskoslezská Vagonka Studénka, 1991', 262, 'puvodni'),
(255, 1, 'El. jednotky stejnosměrné', '460 z', '\'Tornádo\' - stejnosměrná elektrická jednotka', 2000, 239, 122.5, 336, '', 110, 0, 110, 1, 'Vagonka Tatra Studénka, 1971-1978', 260, 'puvodni'),
(256, 1, 'El. jednotky stejnosměrné', '460 m', '\'Tornádo\' - stejnosměrná elektrická jednotka', 2000, 239, 122.5, 336, '', 110, 0, 110, 1, 'Vagonka Tatra Studénka, 1971-1978', 260, 'puvodni'),
(259, 1, 'El. jednotky stejnosměrné', '451.2', '\'CityFrog/Žabotlam\' - stejnosměrná elektrická jednotka', 1320, 182, 95.8, 300, '', 100, 0, 100, 1, 'Vagonka Tatra Studénka, 1964-1968', 78, 'puvodni'),
(260, 1, 'El. jednotky stejnosměrné', '451.1_CD', '\'CityFrog/Žabotlam\' - stejnosměrná elektrická jednotka', 1320, 148, 72.5, 211, '', 100, 0, 100, 1, 'Vagonka Tatra Studénka, 1964-1968', 78, 'puvodni'),
(263, 1, 'El. vícesystémové', '372_CD', '\'Bastard\' - elektrická lokomotiva dvousystémová', 3080, 84, 16.8, 0, '', 120, 0, 120, 17, 'Škoda Plzeň, 1988-1991', 243, 'puvodni'),
(264, 1, 'El. vícesystémové', '371_CD', '\'Bastard\' - elektrická lokomotiva dvousystémová', 3080, 83, 16.8, 0, '', 160, 0, 160, 17, 'Škoda Plzeň, 1996-2001', 205, 'puvodni'),
(999, 0, 'Osobní 2. tř.', 'BDsee [ZSSK]', '	osobní/služební', 0, 25, 24.5, 40, '', 140, 0, 0, 0, 'VEB Waggonbau Bautzen', 0, NULL),
(1092, 1, 'Motorové jednotky', '643_RJ', '\'Talent\' - motorová jednotka', 630, 92, 49.3, 148, '', 120, 0, 120, 0, 'Bombardier Transportation (1996-)', 100, NULL),
(1093, 0, 'Osobní 2. tř.', 'Ampz_RJ', 'Velkoprostorový vůz 2. třídy s klimatizací, zásuvky, reko 2002-2010', 0, 44, 26.4, 60, '', 200, 0, 0, 0, 'Jenbacher (1977-1979)', 0, NULL),
(1094, 0, 'Osobní 2. tř.', 'Bmz_RJ', 'Oddílový vůz 2. třídy, klimatizace, reko 2001-2009', 0, 51, 26.4, 66, '', 200, 0, 0, 0, 'SGP Graz, SGP Simmering/Fiat Torino (1976-1980)', 0, NULL),
(311, 0, 'Nákladní vozy speciální', 'Ua S', 'Vuz na sypke hmoty speciální', 0, 27, 10, 0, 'uhlí', 100, 52, 80, 0, '', 0, 'puvodni'),
(312, 0, 'Nákladní vozy speciální', 'Fas', 'Vuz na kontejnerové vany', 0, 31, 16, 0, 'kontejnerové vany', 100, 61, 80, 0, '', 0, 'puvodni'),
(313, 0, 'Nákladní vozy speciální', 'Fbks', 'Vuz na roztavenou ocel', 0, 16, 13, 0, 'roztavená ocel', 80, 24, 80, 0, '', 0, 'puvodni'),
(314, 0, 'Nákladní vozy speciální', 'Uaain', 'Hlubiný vuz speciální stavby', 0, 70, 28, 0, 'PLM zásilky', 100, 140, 80, 0, '', 0, 'puvodni'),
(322, 0, 'Nákladní vozy', 'Raj', 'Vuz na sypke hmoty', 0, 12, 23, 0, 'sypké hmoty', 100, 30, 80, 0, '', 0, 'puvodni'),
(323, 0, 'Přípojné vozy', '011', 'Pripojny vuz', 0, 12, 14, 85, '', 80, 0, 80, 0, '', 0, 'puvodni'),
(324, 1, 'Dieselové lokomotivy', '705', 'Úzkorozchodná diesel (1954)', 260, 32, 13, 0, '', 50, 0, 50, 0, '', 0, 'puvodni'),
(325, 1, 'Dieselové lokomotivy', '720', 'Motorová lokomotiva s elektrickým přenosem výkonu', 551, 61, 12.4, 0, '', 60, 0, 60, 0, 'ČKD (1958-1961)', 160, 'puvodni'),
(326, 1, 'Dieselové lokomotivy', '749', 'Lokomotiva ČKD (1966)', 1103, 75, 16.5, 0, '', 100, 0, 100, 0, '', 150, 'puvodni'),
(327, 1, 'Dieselové lokomotivy', '750', 'Lokomotiva ČKD (1975)', 1325, 74, 16.5, 0, '', 100, 0, 100, 0, '', 215, 'puvodni'),
(328, 0, 'Osobní 1. tř.', 'A', '1.tr. kupé interval 19-41', 0, 41, 24.5, 54, '', 140, 0, 80, 0, '', 0, 'puvodni'),
(330, 0, 'Osobní vozy kombinované', 'AB', '1.+2.tr. kupe interval 39-41', 0, 42, 24.5, 60, '', 140, 0, 80, 0, '', 0, 'puvodni'),
(331, 0, 'Osobní vozy kombinované', 'BRcm ZSSK', 'Lehátkový vůz s bufetovým oddílem', 0, 43, 26.4, 54, '', 140, 0, 80, 0, 'Waggonbau Bautzen (1984)', 0, 'puvodni'),
(332, 0, 'Osobní 2. tř.', 'B', '2.tr. kupe', 0, 40, 24.5, 80, '', 140, 0, 80, 0, '', 0, 'puvodni'),
(334, 0, 'Osobní vozy se služ.oddílem', 'BDmeer', '2.tr.+služební oddíl', 0, 40, 26.4, 40, '', 160, 0, 80, 0, '', 0, 'puvodni'),
(335, 0, 'Osobní vozy se služ.oddílem', 'BDbmsee', 'oddílový vůz 2. třídy se služebním oddílem, neRIC, zvedací plošina', 0, 37, 26.4, 46, '', 160, 0, 80, 0, 'VEB Wagonbau Bautzen 1987', 0, 'puvodni'),
(336, 0, 'Osobní vozy se služ.oddílem', 'BDs', '2.tr.+služební oddíl', 0, 50, 24.5, 40, 'Kola', 140, 25, 80, 0, '', 0, 'puvodni'),
(337, 0, 'Osobní 2. tř.', 'Bee (Beel)', 'oddílový vůz 2. třídy', 0, 43, 24.5, 60, '', 160, 0, 80, 0, 'rekonstrukce MOVO 1997-1998', 0, 'puvodni'),
(338, 0, 'Osobní 2. tř.', 'Bdmtee', '2.tr. velkoprostor.', 0, 46, 26.4, 96, '', 140, 0, 80, 0, 'VEB Wagonbau Bautzen 1989-1990', 0, 'puvodni'),
(339, 0, 'Osobní 2. tř.', 'Bpee', '2.tr. velkoprostor.', 0, 41, 24.5, 78, '', 160, 0, 80, 0, 'rekonstrukce MOVO 1996-1997', 0, 'puvodni'),
(341, 0, 'Osobní 2. tř.', 'Bt', '2.tr. velkoprostor.', 0, 39, 24.5, 88, '', 120, 0, 80, 0, 'Vagónka Studénka 1969-1975', 0, 'puvodni'),
(342, 0, 'Osobní 2. tř.', 'Bp', 'osobní vůz 2. třídy, 2 oddíly, sedadla s látkovými potahy', 0, 34, 24.5, 86, 'Kola', 120, 4, 80, 0, 'Vagónka Studénka 1991-1992', 0, 'puvodni'),
(343, 0, 'Osobní 2. tř.', 'Bmz', '2.tr. velkoprostor.', 0, 40, 26.4, 80, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(344, 0, 'Přípojné vozy', 'Bmx', 'velkprostorový vůz 2. třídy (050)', 0, 32, 24.8, 80, '', 120, 0, 80, 0, 'Vagónka Studénka 1962-1968', 0, 'puvodni'),
(347, 0, 'Přípojné vozy', 'Btx763', '2.tr. pripojny', 0, 25, 18.5, 64, '', 80, 0, 80, 0, 'modernizace ŽOS Nymburk 1995-1996', 0, 'puvodni'),
(348, 0, 'Služební vozy', 'D', 'pro Mn vlaky', 0, 20, 15, 0, '', 80, 0, 80, 0, '', 0, 'puvodni'),
(349, 0, 'Služební vozy', 'Ds', 'Služební vůz pro osobní vlaky', 0, 38, 24.5, 0, '', 140, 0, 80, 0, '', 0, 'puvodni'),
(350, 0, 'Osobní vozy lůžkové', 'WLABmee61', 'lůžkový vůz 1. a 2. třídy, klimatizovaný', 0, 44, 26.4, 30, '', 160, 0, 80, 0, 'rekonstrukce MOVO 200-2001', 0, 'puvodni'),
(351, 0, 'Osobní vozy restaurační', 'WRRm', '', 0, 20, 26.4, 30, '', 160, 0, 80, 0, '', 0, 'puvodni'),
(352, 0, 'Osobní vozy restaurační', 'WRRmz', '', 0, 57, 26.4, 44, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(353, 0, 'Nákladní vozy uzavřené', 'Habbilns', 'Čtyřnápravový krytý vůz s posuvnými bočními stěnami', 0, 27, 23, 0, 'kusové zboží', 100, 55, 80, 0, '', 0, 'puvodni'),
(354, 0, 'Nákladní vozy', 'Hadgs', 'Vuz na sypke hmoty', 0, 12, 23, 0, 'sypké hmoty', 100, 30, 80, 0, '', 0, 'puvodni'),
(355, 0, 'Nákladní vozy', 'Lp', 'Vuz na sypke hmoty', 0, 12, 23, 0, 'sypké hmoty', 100, 30, 80, 0, '', 0, 'puvodni'),
(356, 0, 'Nákladní vozy', 'Nas', 'Vuz na nakl.auta', 0, 12, 23, 0, 'sypké hmoty', 100, 30, 80, 0, '', 0, 'puvodni'),
(358, 0, 'Nákladní vozy', 'Ra', 'Cisterna', 0, 12, 23, 0, 'kapaliny', 100, 30, 80, 0, '', 0, 'puvodni'),
(360, 0, 'Nákladní vozy', 'Vte', 'Vuz na drevo', 0, 12, 23, 0, 'dřevo', 100, 30, 80, 0, '', 0, 'puvodni'),
(361, 0, 'Nákladní vozy', 'Wap', 'Vuz na sypke hmoty', 0, 12, 23, 0, 'sypké hmoty', 100, 30, 80, 0, '', 0, 'puvodni'),
(362, 0, 'Nákladní vozy', 'Z', 'Krytý vůz', 0, 12, 23, 0, 'kryté zboží', 100, 30, 80, 0, '', 0, 'puvodni'),
(363, 0, 'Nákladní vozy', 'Zaz', 'Krytý vůz', 0, 12, 23, 0, 'kryté zboží', 100, 30, 80, 0, '', 0, 'puvodni'),
(364, 0, 'Nákladní vozy', 'Zts', 'Krytý vůz', 0, 12, 23, 0, 'kryté zboží', 100, 30, 80, 0, '', 0, 'puvodni'),
(365, 0, 'Nákladní vozy', 'Ztsc', 'Krytý vůz', 0, 12, 23, 0, 'kryté zboží', 100, 30, 80, 0, '', 0, 'puvodni'),
(366, 0, 'Nákladní vozy uzavřené', 'Ztsc-Post', 'Dvounápravový krytý vůz běžné stavby', 0, 15, 14, 0, 'kryté zboží', 100, 24, 80, 0, '', 0, 'puvodni'),
(1514, 0, 'Osobní vozy lehátkové', 'Bvcmbz_OBB', 'Vozy odkoupeny od DB v prosinci 2016.', 0, 50, 26.4, 50, '', 200, 0, 0, 0, 'AW Halberstadt, 2001-2002', 0, NULL),
(1517, 0, 'Osobní vozy lůžkové', 'WLABmz7171_OBB', '', 0, 56, 26.4, 33, '', 160, 0, 0, 0, 'modernizace 1999-2000', 0, NULL),
(1518, 0, 'Osobní vozy lůžkové', 'WLABmz7290_OBB', 'Vozy odkoupeny od DB v prosinci 2016.', 0, 60, 26.4, 36, '', 200, 0, 0, 0, 'Siemens SGP Verkehrstechnik, 2003 - 2005', 0, NULL),
(1519, 0, 'Osobní vozy lůžkové', 'WLABmz7571_OBB', 'Lůžkoví vůz 1. a 2. tř.', 0, 58, 26.4, 32, '', 160, 0, 0, 0, '', 0, NULL),
(1520, 0, 'Osobní vozy restaurační', 'WRmz8890_OBB', 'Podvozky MD 522, vozy 200 ... 207 nejsou vybaveny tlakotěsnými přechodovými návalky. V letech 2005 - 2010 proběhla modernizace interiéru (Upgrading-Programm).', 0, 54, 26.9, 40, '', 200, 0, 0, 0, 'SGP Simmering, 1988-1989', 0, NULL),
(374, 1, 'El. jednotky střídavé', '560', 'El. střídavá jednotka', 840, 295, 122, 340, '', 120, 0, 120, 2, 'Vagonka Tatra Studénka', 178, 'puvodni'),
(377, 0, 'Nákladní vozy', 'Cem', 'Nedefinovano', 0, 12, 23, 0, 'ostatni', 120, 30, 80, 0, '', 0, 'puvodni'),
(378, 0, 'Nákladní vozy', 'Eas', 'Nákladní otevřený vůz, prázdný (kvůli Staničáři snížena rychlost na 100 km/h)', 0, 12, 14, 0, 'ostatni', 100, 30, 80, 0, '', 0, 'puvodni'),
(379, 0, 'Nákladní vozy otevřené', 'Falls', 'výsypný čtyřnápravový vůz', 0, 26, 13.5, 0, 'uhlí', 120, 54, 80, 0, '', 0, 'puvodni'),
(380, 0, 'Nákladní vozy', 'Hacgs', 'Nedefinovano', 0, 12, 23, 0, 'ostatni', 120, 30, 80, 0, '', 0, 'puvodni'),
(382, 0, 'Nákladní vozy', 'Ibops', 'Nedefinovano', 0, 12, 23, 0, 'ostatni', 120, 30, 80, 0, '', 0, 'puvodni'),
(383, 0, 'Nákladní vozy', 'Iqrs', 'Nedefinovano', 0, 12, 23, 0, 'ostatni', 120, 30, 80, 0, '', 0, 'puvodni'),
(384, 0, 'Nákladní vozy', 'Kbkks', 'Nedefinovano', 0, 13, 16.2, 0, 'ostatni', 100, 23, 80, 0, '', 0, 'puvodni'),
(385, 0, 'Nákladní vozy', 'Smm', 'Nedefinovano', 0, 12, 23, 0, 'ostatni', 120, 30, 80, 0, '', 0, 'puvodni'),
(386, 0, 'Nákladní vozy', 'Smml', 'Nedefinovano', 0, 12, 23, 0, 'ostatni', 120, 30, 80, 0, '', 0, 'puvodni'),
(387, 0, 'Nákladní vozy cisternové', 'Zae', 'Nedefinovano', 0, 22, 12.3, 0, 'tekuté hmoty', 100, 43, 80, 0, '', 0, 'puvodni'),
(388, 0, 'Nákladní vozy cisternové', 'Zaes', 'Nedefinovano', 0, 23, 12.8, 0, 'tekuté hmoty', 120, 57, 80, 0, '', 0, 'puvodni'),
(389, 0, 'Nákladní vozy', 'Zkks', 'Nedefinovano', 0, 12, 23, 0, 'ostatni', 120, 30, 80, 0, '', 0, 'puvodni'),
(1098, 1, 'Motorové jednotky', '650_VBG', 'Regio-Shuttle RS1', 530, 43, 25.5, 71, '', 120, 0, 120, 0, 'Stadler Pankow GmbH. (2012)', 0, NULL),
(1099, 0, 'Osobní 2. tř.', 'ASmz_RJ', 'Kombinovaný vůz 2. třídy, klimatizace, \'Internet Café\', reko 2005', 0, 48, 26.4, 39, '', 200, 0, 0, 0, 'SGP Simmering (1982)', 0, NULL),
(1096, 1, 'Motorové vozy', '801_KZC', '\'Hurvínek\' - historický motorový osobní vůz, ex M131.1', 114, 17, 12.1, 48, '', 60, 0, 60, 0, 'Tatra Kopřivnice (1951)', 28, NULL),
(1097, 1, 'Motorové jednotky', '642_VBG', 'Motorová jednotka Vogtlandbahn', 550, 90, 45, 110, '', 120, 0, 120, 0, 'Siemens/Düwag 2000', 90, NULL),
(411, 1, 'Motorové jednotky', '610_DB', 'Motorová jednotka DB Regio', 970, 100, 50, 136, '', 160, 0, 160, 0, 'MAN, DUEWAG (1991-1992)', 100, 'puvodni'),
(412, 1, 'Motorové jednotky', '612_DB', 'Motorová jednotka DB Regio', 1120, 116, 51.75, 146, '', 160, 0, 160, 0, 'Adtranz Hennigsdorf, Bombardier Transportation (1998)', 100, 'puvodni'),
(413, 1, 'Motorové jednotky', '642_DB', '\'Desiro\' - motorová jednotka DB Regio a VLB', 550, 69, 41.7, 110, '', 120, 0, 120, 0, 'Siemens Mobility (1999)', 90, 'puvodni'),
(418, 1, 'El. jednotky střídavé', '4024_OBB', '\'Talent\' - dvousystémová elektrická jednotka ÖBB', 1520, 116, 66.87, 199, '', 140, 0, 140, 16, 'Bombaridier, 1996', 100, 'puvodni'),
(419, 1, 'Motorové vozy', '5047_OBB', 'Rakouský motorový vůz určený na regionální tratě', 419, 40, 20, 62, '', 120, 0, 120, 0, '1987', 68, 'puvodni'),
(420, 0, 'Osobní 1. tř.', 'Admnu61_PKP', 'Oddílový vůz 1. třídy, klimatizace, zásuvky', 0, 48, 26.4, 54, '', 160, 0, 80, 0, 'H. Ciegelski - FPS Poznań (1995-1997), reko (2006-2007)', 0, 'puvodni'),
(421, 0, 'Osobní 2. tř.', 'Bdmnu61_PKP', 'Oddílový vůz 2. třídy, klimatizace', 0, 48, 26.4, 66, '', 160, 0, 80, 0, 'PESA Bydgoszcz', 0, 'puvodni'),
(422, 0, 'Osobní 2. tř.', 'Bdhmnu61_PKP', 'Velkoprostorový vůz 2. třídy, klimatizace', 0, 48, 26.4, 80, '', 200, 0, 80, 0, 'H. Ciegelski - FPS Poznań (1999-2003)', 0, 'puvodni'),
(423, 0, 'Osobní vozy restaurační', 'WRdm_PKP', 'Restaurační vůz', 0, 45, 26.4, 40, '', 160, 0, 80, 0, 'Pafawag Wroclaw (1969-1990)', 0, 'puvodni'),
(424, 0, 'Osobní 2. tř.', 'Bdmnu_PKP', 'Oddílový vůz 2. třídy, některé klimatizace', 0, 42, 26.4, 66, '', 160, 0, 80, 0, 'Waggonbau Görlitz, Waggonbau Bautzen, H. Ciegelski - FPS Poznań (1989-1995)', 0, 'puvodni'),
(425, 0, 'Osobní 2. tř.', 'Bdnu_PKP', 'Velkoprostorový vůz 2. třídy', 0, 42, 24.5, 80, '', 140, 0, 80, 0, 'Pafawag Wroclaw (1969-1990)', 0, 'puvodni'),
(426, 0, 'Osobní vozy lehátkové', 'Bc_PKP', 'Lehátkový vůz', 0, 45, 24.5, 72, '', 160, 0, 80, 0, 'Pafawag Wroclaw (1970-1977)', 0, 'puvodni'),
(427, 0, 'Osobní vozy lůžkové', 'WLAB_PKP', 'Lůžkový vůz 1. a 2. třídy', 0, 44, 24.5, 30, '', 160, 0, 80, 0, 'Pafawag Wroclaw (1969-1990)', 0, 'puvodni'),
(428, 1, 'El. stejnosměrné', 'EP09_PKP', 'elektrická stejnosměrná lokomotiva', 2940, 84, 16.74, 0, '', 160, 0, 160, 1, 'Pafawag Wroclaw (1986-1997)', 210, 'puvodni'),
(429, 0, 'Osobní 1. tř.', 'Aeer61_ZSSK', 'Oddílový vůz 1. třídy, klimatizace, zásuvky', 0, 45, 24.5, 54, '', 160, 0, 80, 0, 'reko ŽOS Vrútky (2003-2005)', 0, 'puvodni'),
(430, 0, 'Osobní 1. tř.', 'Apeer61_ZSSK', 'Velkoprostorový vůz 1. třídy, klimatizace, zásuvky', 0, 44, 24.5, 52, '', 160, 0, 80, 0, 'reko ŽOS Vrútky (1996-2002)', 0, 'puvodni'),
(431, 0, 'Osobní vozy kombinované', 'ARpeer61_ZSSK', 'Velkoprostorový vůz 1. třídy s barovým oddílem, klimatizace, zásuvky', 0, 45, 24.5, 39, '', 160, 0, 80, 0, 'reko ŽOS Vrútky (2001)', 0, 'puvodni'),
(432, 0, 'Osobní 2. tř.', 'Bpeer61_ZSSK', 'Velkoprostorový vůz 2. třídy, klimatizace', 0, 43, 24.5, 66, '', 160, 0, 80, 0, 'reko ŽOS Vrútky (1996-2003)', 0, 'puvodni'),
(433, 0, 'Osobní 2. tř.', 'Beer61_ZSSK', 'oddílový vůz 2. třídy, klimatizace', 0, 45, 24.5, 60, '', 160, 0, 80, 0, 'rekonstrukce ŽOS Vrútky', 0, 'puvodni'),
(434, 0, 'Osobní vozy se služ.oddílem', 'BDsheer61_ZSSK', 'Oddílový vůz 2. třídy se služebním oddílem, klimatizace, ex Bh', 0, 44, 24.5, 28, '', 160, 0, 80, 0, 'reko ŽOS Vrútky (1996-2001)', 0, 'puvodni'),
(435, 0, 'Osobní 1. tř.', 'A_ZSSK', 'Oddílový vůz 1. třídy', 0, 40, 24.5, 54, '', 140, 0, 80, 0, 'Waggonbau Bautzen (1974-1985)', 0, 'puvodni'),
(436, 0, 'Osobní 2. tř.', 'B_ZSSK', 'Oddílový vůz 2. třídy', 0, 39, 24.5, 80, '', 140, 0, 80, 0, 'Waggonbau Bautzen (1974-1985)', 0, 'puvodni'),
(437, 0, 'Osobní vozy se služ.oddílem', 'BDshmee_ZSSK', 'Oddílový vůz 2. třídy se služebním oddílem', 0, 39, 26.4, 36, '', 160, 0, 80, 0, 'Waggonbau Bautzen (1989-1990)', 0, 'puvodni'),
(438, 0, 'Osobní 2. tř.', 'Bdt_ZSSK', 'Velkoprostorový vůz 2. třídy', 0, 34, 24.5, 86, '', 120, 0, 80, 0, 'Vagónka Studénka (1990-1991)', 0, 'puvodni'),
(439, 0, 'Osobní 2. tř.', 'Bdt', 'osobní vůz 2. třídy, 2 oddíly', 0, 34, 24.5, 88, '', 120, 0, 80, 0, 'Vagónka Studénka 1990-1992', 0, 'puvodni'),
(440, 0, 'Osobní vozy lehátkové', 'Bc_ZSSK', 'Lehátkový vůz', 0, 42, 24.5, 54, '', 140, 0, 80, 0, 'Waggonbau Bautzen (1975-1984)', 0, 'puvodni'),
(441, 0, 'Osobní vozy lůžkové', 'WLAB_ZSSK', 'Lůžkový vůz 1. a 2. třídy', 0, 46, 24.5, 30, '', 140, 0, 80, 0, 'Waggonbau Görlitz (1978-1985)', 0, 'puvodni'),
(442, 0, 'Osobní vozy lůžkové', 'WLABmee62_ZSSK', 'Lůžkový vůz 1. a 2. třídy, klimatizace', 0, 56, 26.4, 33, '', 200, 0, 80, 0, 'Waggonbau Görlitz (1994-1995)', 0, 'puvodni'),
(444, 0, 'Osobní 1. tř.', 'Ampz73', 'velkoprostorový vůz 1. třídy, klimatizace', 0, 48, 26.4, 30, '', 200, 0, 80, 0, 'SGP-Siemens - MSV Studénka 1998-1999', 0, 'puvodni'),
(445, 0, 'Osobní 1. tř.', 'Apee', 'velkoprostorový vůz 1. třídy', 0, 41, 24.5, 60, '', 160, 0, 80, 0, 'rekonstrukce MOVO 1996-1997', 0, 'puvodni'),
(446, 0, 'Osobní 1. tř.', 'Amz73_OBB', 'Oddílový vůz 1. třídy, klimatizace, zásuvky', 0, 48, 26.4, 40, '', 200, 0, 80, 0, 'SGP Simmering (1989-1993), reko (2006-2007)', 0, 'puvodni'),
(447, 0, 'Osobní 1. tř.', 'Amz61_OBB', 'Oddílový vůz 1. třídy, klimatizace', 0, 48, 26.4, 54, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(448, 0, 'Osobní 1. tř.', 'Amz61_MAV', 'oddílový vůz 1. třídy, klimatizace', 0, 48, 26.4, 54, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(449, 0, 'Osobní 1. tř.', 'Apmz61_H-START', 'velkoprostorový vůz 1. třídy, klimatizace', 0, 46, 26.4, 60, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(450, 0, 'Osobní 1. tř.', 'Apmz61_DB', 'Velkoprostorový vůz 1. třídy, klimatizace', 0, 44, 26.4, 48, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(451, 0, 'Osobní 1. tř.', 'Avmz61_DB', 'Oddílový vůz 1. třídy, klimatizace', 0, 45, 26.4, 54, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(452, 0, 'Osobní 2. tř.', 'B244', 'oddílový vůz 2. třídy, 3 oddíly kuřácké', 0, 39, 24.5, 80, '', 140, 0, 80, 0, '', 0, 'puvodni'),
(453, 0, 'Osobní vozy se služ.oddílem', 'Bdbmrsee', 'oddílový vůz 2. třídy se služebním oddílem, RIC, zvedací plošina', 0, 38, 26.4, 33, '', 160, 0, 80, 0, 'VEB Wagonbau Bautzen 1987-1988', 0, 'puvodni'),
(454, 0, 'Osobní 2. tř.', 'Bimz_DB', 'Vůz 2. třídy kombinovaný oddíly/velkoprostorový', 0, 47, 26.4, 60, '', 200, 0, 80, 0, 'Raw Halberstadt (1984-1990)', 0, 'puvodni'),
(455, 0, 'Osobní 2. tř.', 'Bpmz61_DB', 'velkoprostorový vůz 2. třídy, klimatizace', 0, 45, 26.4, 80, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(456, 0, 'Osobní 2. tř.', 'Bpmbz61_DB', 'Velkoprostorový vůz 2. třídy, klimatizace, úprava pro vozíčkáře', 0, 45, 26.4, 75, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(457, 0, 'Osobní 2. tř.', 'Bpmdz73_DB', 'velkoprostorový vůz 2. třídy, klimatizace, prostor pro jízní kola', 0, 45, 26.4, 64, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(458, 0, 'Osobní 2. tř.', 'Bvmsz73_DB', 'Vůz 2. třídy kombinovaný oddíly/velkoprostorový, klimatizace, zásuvky', 0, 45, 26.4, 64, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(459, 0, 'Osobní 2. tř.', 'Bmz61_MAV', 'oddílový vůz 2. třídy, klimatizace', 0, 51, 26.4, 66, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(460, 0, 'Osobní vozy restaurační', 'Wrmz61_MAV', 'restaurační vůz, klimatizace', 0, 50, 26.4, 36, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(461, 0, 'Osobní vozy restaurační', 'WRmz61_DB', 'Restaurační vůz, klimatizace', 0, 50, 27.5, 34, '', 200, 0, 80, 0, '', 0, 'puvodni'),
(462, 0, 'Osobní vozy restaurační', 'Wrmz73', 'restaurační vůz, klimatizace', 0, 54, 26.4, 34, '', 200, 0, 80, 0, 'SGP-Siemens - MSV Studénka 1997', 0, 'puvodni'),
(463, 0, 'Osobní vozy restaurační', 'WRmee61', 'restaurační vůz s bufetovým oddílem, klimatizace', 0, 44, 26.4, 38, '', 160, 0, 80, 0, 'VEB Wagonbau Bautzen 1978, rekonstrukce 1994', 0, 'puvodni'),
(464, 0, 'Osobní vozy restaurační', 'WRm', 'restaurační vůz s bufetovým oddílem', 0, 44, 26.4, 38, '', 140, 0, 80, 0, 'VEB Wagonbau Bautzen 1978, modernizace 1991', 0, 'puvodni'),
(465, 0, 'Osobní vozy restaurační', 'WR', 'restaurační vůz', 0, 25, 24.5, 48, '', 140, 0, 80, 0, 'VEB Wagonbau Bautzen 1976, rekonstrukce 1989', 0, 'puvodni'),
(466, 0, 'Osobní 2. tř.', 'Bmpz73_OBB', 'Velkoprostorový vůz 2. třídy, klimatizace, zásuvky', 0, 45, 26.4, 83, '', 200, 0, 80, 0, 'Jenbacher Verke, SGP Graz, Simmering (1990-1993), reko (2002-2009)', 0, 'puvodni'),
(467, 0, 'Osobní 2. tř.', 'Bmz61_OBB', 'Oddílový vůz 2. třídy, klimatizace, zásuvky', 0, 51, 26.4, 66, '', 200, 0, 80, 0, 'SGP Graz, SGP Simmering/Fiat Torino (1976-1982), reko (2001-2010)', 0, 'puvodni'),
(468, 0, 'Osobní 2. tř.', 'Bmto', 'patrový osobní vůz 2. třídy', 0, 44, 26.8, 126, '', 100, 0, 80, 0, 'VEB Wagonbau Görlitz, 1976', 0, 'puvodni'),
(469, 0, 'Osobní 2. tř.', 'Btax', 'přípojný vůz 2. třídy', 0, 15, 14, 62, 'Kola', 80, 6, 80, 0, 'Vagónka Stdénka 1973-1983', 0, 'puvodni'),
(470, 0, 'Osobní 2. tř.', 'Btn', 'velkoprostorový přípojný vůz 2. třídy', 0, 34, 24.5, 88, '', 120, 0, 80, 0, 'Vagónka Studénka 1969', 0, 'puvodni'),
(472, 0, 'Osobní vozy lehátkový', 'Bc842', 'lehátkový vůz', 0, 41, 24.5, 72, '', 160, 0, 80, 0, 'VEB Wagonbau Bautzen 1975-1980', 0, 'puvodni'),
(473, 0, 'Osobní vozy lehátkové', 'Bcmz73_OBB', 'Lehátkový vůz, klimatizace', 0, 44, 26.4, 54, '', 200, 0, 80, 0, 'ADtranz (Bombardier) Dunakeszi - Siemens SGP Graz (2000-2001), Jenbacher Werke (1991)', 0, 'puvodni'),
(474, 0, 'Osobní vozy lehátkové', 'Bcmz61_OBB', 'Lehátkový vůz, klimatizace', 0, 42, 26.4, 54, '', 200, 0, 80, 0, 'Jenbacher Verke (1982), reko 1994', 0, 'puvodni'),
(475, 0, 'Osobní 2. tř.', 'Bdt279', 'velkoprostorový vůz 2. třídy , 2 oddíly, pouze el. topení', 0, 34, 24.5, 88, 'Kola', 120, 4, 80, 0, 'Vagónka Studénka 1986-1987', 0, 'puvodni'),
(476, 0, 'Osobní 2. tř.', 'BDtax', 'přípojný vůz 2. třídy s prostorem pro rozšířenou přepravu spoluzavazadel', 0, 15, 14, 52, 'Kola', 80, 12, 80, 0, 'rekonstrukce KOS Krnov 1998 - 2001', 0, 'puvodni'),
(477, 0, 'Osobní 2. tř.', 'B243', 'oddílový vůz 2. třídy, doplněny látkové potahy + CZE', 0, 38, 24.5, 60, '', 140, 0, 80, 0, 'VEB Wagonbau Bautzen 1982_1985, úprava KOS Krnov 2003', 0, 'puvodni'),
(478, 0, 'Osobní 2. tř.', 'Bt283', 'velkoprostorový vůz 2. třídy, služební prostor pro vlak. čety (místo umývárny)', 0, 39, 24.5, 88, '', 120, 0, 80, 0, 'Vagónka Studénka 1969-1975, úprava ŽOS České Velenice 2004-2005', 0, 'puvodni'),
(479, 0, 'Osobní vozy lůžkové', 'WLAB_BC', 'Lůžkový vůz', 0, 57, 24.6, 30, '', 160, 0, 80, 0, '', 0, 'puvodni'),
(480, 0, 'Osobní vozy lůžkové', 'WLAB_RZD', 'Lůžkový vůz', 0, 57, 24.6, 30, '', 160, 0, 80, 0, '', 0, 'puvodni'),
(481, 0, 'Osobní vozy lůžkové', 'WLABee824', 'lůžkový vůz 1. a 2. třídy, prolisy na bočnici', 0, 50, 24.5, 30, '', 140, 0, 80, 0, 'VEB Wagonbau Bautzen 1981, modernizace Pars nova Šumperk 2005', 0, 'puvodni'),
(482, 0, 'Osobní vozy lůžkové', 'WLABm62_RZD', 'Lůžkový vůz 1. a 2. třídy', 0, 56, 26.4, 33, '', 160, 0, 80, 0, '', 0, 'puvodni'),
(483, 0, 'Osobní vozy lůžkové', 'WLABm62_UZ', 'Lůžkový vůz 1. a 2. třídy', 0, 57, 24.6, 30, '', 160, 0, 80, 0, '', 0, 'puvodni'),
(484, 0, 'Osobní vozy lůžkové', 'WLABmee62_RZD', 'Lůžkový vůz 1. a 2. třídy, klimatizace', 0, 56, 26.4, 33, '', 160, 0, 80, 0, '', 0, 'puvodni'),
(485, 0, 'Osobní vozy lůžkové', 'WLB_RZD', 'Lůžkový vůz', 0, 57, 24.6, 30, '', 160, 0, 80, 0, '', 0, 'puvodni'),
(486, 0, 'Osobní vozy lůžkové', 'WLB_ZSSK', 'Lůžkový vůz', 0, 44, 24.5, 30, '', 140, 0, 80, 0, 'Waggonbau Görlitz (1978-1985)', 0, 'puvodni'),
(487, 0, 'Nákladní vozy speciální', 'Lekqss', 'dvoupatrový vůz pro přepravu automobilů', 0, 24, 27, 0, 'automobily', 140, 19, 80, 0, '', 0, 'puvodni'),
(488, 0, 'Nákladní vozy speciální', 'Laaers', 'dvoupatrový vůz pro přepravu automobilů', 0, 17, 17.1, 0, 'automobily', 100, 19, 80, 0, '', 0, 'puvodni'),
(489, 0, 'Nákladní vozy plošinové', 'Sgnss', 'kontejnerový vůz', 0, 20, 19.7, 0, 'kontejnery', 120, 60, 80, 0, '', 0, 'puvodni'),
(490, 0, 'Nákladní vozy plošinové', 'Sgnss Ko', 'kontejnerový vůz - ložený', 0, 20, 19.7, 0, 'kontejnery', 120, 60, 80, 0, '', 0, 'puvodni'),
(491, 0, 'Nákladní vozy plošinové', 'Sggmrss', 'dvoudílný kontejnerový vůz s kloubem', 0, 30, 29.6, 0, 'kontejnery', 100, 80, 80, 0, '', 0, 'puvodni'),
(492, 0, 'Nákladní vozy plošinové', 'Sggmrss Ko', 'dvoudílný kontejnerový vůz s kloubem - v loženém stavu', 0, 30, 29.6, 0, 'kontejnery', 100, 80, 80, 0, '', 0, 'puvodni'),
(493, 0, 'Nákladní vozy otevřené', 'Falls U', 'výsypný čtyřnápravový vůz - v loženém stavu', 0, 26, 13.5, 0, 'uhlí', 100, 54, 80, 0, '', 0, 'puvodni'),
(494, 1, 'El. stejnosměrné', 'ET22_PKP', 'elektrická stejnosměrná lokomotiva', 3000, 120, 19.24, 0, '', 125, 0, 125, 1, 'Pafawag Wroclaw (1969-1989)', 412, 'puvodni'),
(1534, 1, '786', '783', '', 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, NULL),
(1535, 1, 'Motorové jednotky', '628_RJ', 'dieslova jednotka', 485, 77, 46.15, 146, '', 120, 0, 120, 0, '1986–1996', 100, NULL),
(1536, 1, 'El. vícesystémové', '193_CD', 'Siemens Vectron je třída modulárních víceúčelových lokomotiv firmy Siemens Mobility vyráběných v německém Mnichově. Je zamýšlena jako nástupce úspěšné řady EuroSprinter.', 6400, 87, 18.98, 0, '', 160, 0, 200, 19, 'Siemens AG, od 2010', 300, NULL),
(1537, 1, 'El. stejnosměrné', '111_CD', 'Lokomotiva řady 111 je elektrická lokomotiva s na stejnosměrný proud určená pro posun. Vyráběla ji v letech 1981–1982 plzeňská firma Škoda (tovární typ Škoda 78E). Od výchozí řady 110 se liší především použitím tyristorové regulace výkonu.', 760, 70, 14.4, 1, '', 80, 0, 80, 1, 'Škoda Plzeň, 1981–1982', 186, NULL),
(1538, 1, 'El. stejnosměrné', '150.2_CD', 'České dráhy přistoupily k postupné úpravě lokomotiv na řadu 150.2, jejímž cílem bylo zvýšení maximální rychlosti na 140 km/h. Dnes již žádná lokomotiva řady 150 omezení na 120 km/h nemá.', 4000, 82, 16.7, 1, '', 160, 0, 160, 1, 'Škoda Plzeň ', 210, NULL),
(1539, 1, 'El. stejnosměrné', '122_CDC', 'Lokomotiva řady 122 je elektrická lokomotiva pro stejnosměrnou napájecí soustava určená pro nákladní dopravu. Vyrobila ji plzeňská firma Škoda v roce 1967 pod továrním označením Škoda 57E.', 2340, 85, 17.2, 0, '', 90, 0, 90, 1, 'Škoda Plzeň, 1967', 224, NULL),
(1540, 1, 'El. stejnosměrné', '162_CD', 'Lokomotiva řady 162 je elektrická lokomotiva pro stejnosměrnou napájecí soustavu určená pro vozbu rychlíků z produkce Škody Plzeň (tovární typ 98E).', 3480, 84, 16.8, 0, '', 140, 0, 140, 1, 'Škoda Plzeň, 1991', 258, NULL),
(1541, 1, 'El. stejnosměrné', '162_RJ', 'Lokomotiva řady 162 je elektrická lokomotiva pro stejnosměrnou napájecí soustavu určená pro vozbu rychlíků z produkce Škody Plzeň (tovární typ 98E).', 3480, 85, 16.8, 0, '', 140, 0, 140, 1, 'Škoda Plzeň, 1991', 258, NULL),
(1542, 1, 'El. vícesystémové', '193_RJ', 'Siemens Vectron je třída modulárních víceúčelových lokomotiv firmy Siemens Mobility vyráběných v německém Mnichově. Je zamýšlena jako nástupce úspěšné řady EuroSprinter.', 6400, 85, 19, 0, '', 200, 0, 200, 17, 'Siemens AG, od 2010', 300, NULL),
(1543, 1, 'El. stejnosměrné', '163_CD', 'Lokomotiva řady 163 je univerzální traťová lokomotiva pro stejnosměrnou napájecí soustavu 3 kV vyráběná v letech 1984–1986 (tovární označení 71E) a 1991–1992 (99E) plzeňskou firmou Škoda a společností ČKD polovodiče.', 3480, 85, 16.8, 0, '', 120, 0, 120, 1, 'Škoda Plzeň, 1984–1986', 300, NULL),
(1544, 1, 'El. vícesystémové', '350_ZSSK', 'Lokomotiva řady 350 je dvousystémová elektrická lokomotiva, přezdívaná Gorila nebo Krysa, někdy také Potkan. Patří k nejrychlejším a nejvýkonnějším lokomotivám vyrobeným v Československu. Vyráběl ji podnik Škoda Plzeň pod typovým označením 55E.', 4000, 90, 16.7, 0, '', 160, 0, 160, 3, 'Škoda Plzeň, 1973–1975', 210, NULL),
(1545, 1, 'El. jednotky střídavé', '263_CD', 'Lokomotiva 263 je jednosystémová lokomotiva určená pro provoz pod trakční soustavou se střídavým proudem o napětí 25 kV, 50 Hz. Lokomotiva je přezdívána princezna[1] a dle starého systému značení jí náleží řada S 499.2.', 3000, 84, 16.8, 0, '', 120, 0, 120, 2, 'Škoda Plzeň, 1984, 1988', 300, NULL);
INSERT INTO `vozy` (`id`, `hnaci`, `trida`, `nazev`, `popis`, `vykon`, `hmotnost`, `delka`, `osob`, `typ_nakladu`, `max_rych`, `naklad`, `max_rych_hnaci`, `elektro`, `vyrobce`, `sila`, `autor`) VALUES
(1546, 1, 'El. vícesystémové', '361.1_ZSSK', 'Lokomotiva řady 361.1 je dvousystémová lokomotiva vyráběná pro Železničnou spoločnosť Slovensko (ZSSK). Jde o komplexní rekonstrukci strojů řad 162 a 163 ZSSK společností ŽOS Vrútky a.s.', 3600, 86, 16.8, 0, '', 160, 0, 160, 3, 'ŽOS Vrútky, od 2010', 3600, NULL),
(1547, 1, 'El. vícesystémové', '680_CD', '\'Pendolino\' - vícesystémová elektrická jednotka', 4000, 384, 185.3, 333, '', 230, 0, 230, 19, 'Alstom Ferroviaria, Alstom Sesto (2003-2004)', 200, NULL),
(1548, 1, 'El. jednotky stejnosměrné', '480_LE', 'El. stejnosměrná jednotka Stadler FLIRT pro LEO Express', 2600, 150, 90.2, 237, '', 160, 0, 160, 0, 'Stadler 2012', 200, NULL),
(1549, 1, 'Motorové vozy', '809_CD', '\'Šukafon\' - motorový osobní vůz, úprava na samoobslužný provoz, ex 810', 155, 20, 14, 95, '', 80, 0, 80, 0, 'Vagonka Tatra Studénka (1973-1984), reko (1994-1996)', 29, NULL),
(1550, 1, 'Motorové vozy', '814+914_CD', '\'RegioNova\' - motorová jednotka, ex 810, 010', 242, 40, 28.4, 219, '', 80, 0, 80, 0, 'Vagonka Tatra Studénka (1973-1984), reko PARS Nova Šumperk (2007-2010)', 54, NULL),
(1551, 1, 'Motorové jednotky', '814+014_814_CD', '\'RegioNova TRIO\' - motorová jednotka, ex 810, 010', 484, 62, 42.4, 256, '', 80, 0, 80, 0, 'Vagonka Tatra Studénka (1973-1984), reko PARS Nova Šumperk (2007-2010)', 100, NULL),
(1552, 1, 'El. vícesystémové', '660.0_CD', 'InterPanter je nízkopodlažní elektrická jednotka,Jednotky mohou být provozovány na tratích s napětím 25kV/50Hz a 3 kV/ss.Maximální provozní rychlost činí 160 km/h.', 2040, 155, 79.4, 200, '', 160, 0, 160, 3, 'Škoda Vagonka a. s. 2015', 180, NULL),
(1553, 1, 'El. vícesystémové', '660.1_CD', 'InterPanter je nízkopodlažní elektrická jednotka,Jednotky mohou být provozovány na tratích s napětím 25kV/50Hz a 3 kV/ss.Maximální provozní rychlost činí 160 km/h.', 2720, 242, 132.4, 350, '', 160, 0, 160, 3, 'Škoda Vagonka a. s. 2015', 200, NULL),
(1554, 1, 'El. vícesystémové', '650_CD', '\'RegioPanter\' - elektrická vícesystémová jednotka pro regionální provoz', 1360, 107, 52.9, 147, '', 160, 0, 160, 3, 'Škoda Vagonka a. s. (2011-2014)', 180, NULL),
(1555, 1, 'Motorové jednotky', '844_CD', '\'RegioShark\' - regionální motorová jednotka', 780, 84, 43.7, 240, '', 120, 0, 120, 0, 'PESA Bydgoszcz (2011-2013)', 200, NULL),
(1556, 1, 'Motorové jednotky', '840_CD', '\'RegioSpider\' - motorová jednotka', 530, 49, 25.5, 168, '', 120, 0, 120, 0, 'Stadler Rail AG (2011-2012)', 29, NULL),
(1557, 1, 'Motorové jednotky', '841_CD', '\'RegioSpider\' - motorová jednotka', 530, 49, 25.5, 168, '', 120, 0, 120, 0, 'Stadler Rail AG (2011-2012)', 29, NULL),
(1558, 1, 'Řídící vozy', 'Railjet_CD', 'Netrakční vysokorychlostní elektrická jednotka Viaggio Comfort', 0, 393, 186, 446, '', 230, 0, 230, 3, 'Siemens 2014', 0, NULL);

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `active_guests`
--
ALTER TABLE `active_guests`
  ADD PRIMARY KEY (`ip`);

--
-- Klíče pro tabulku `active_users`
--
ALTER TABLE `active_users`
  ADD PRIMARY KEY (`username`);

--
-- Klíče pro tabulku `banned_users`
--
ALTER TABLE `banned_users`
  ADD PRIMARY KEY (`username`);

--
-- Klíče pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Klíče pro tabulku `vozy`
--
ALTER TABLE `vozy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nazev` (`nazev`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `vozy`
--
ALTER TABLE `vozy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1559;
COMMIT;
