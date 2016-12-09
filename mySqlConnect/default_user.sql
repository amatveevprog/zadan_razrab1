-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 09 2016 г., 21:45
-- Версия сервера: 5.6.20
-- Версия PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `default_user`
--

-- --------------------------------------------------------

--
-- Структура таблицы `courier_delivery`
--

CREATE TABLE IF NOT EXISTS `courier_delivery` (
`id` int(11) NOT NULL COMMENT 'index',
  `fio` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `additional_info` text COLLATE utf8_unicode_ci NOT NULL,
  `additiona_info_2` text COLLATE utf8_unicode_ci,
  `checked_one` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Veni',
  `checked_two` tinyint(1) DEFAULT NULL,
  `StreetName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `HouseNum` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `GateNum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FloorNum` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FlatNum` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Corp` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_latin` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица доставки курьером' AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `courier_delivery`
--

INSERT INTO `courier_delivery` (`id`, `fio`, `phone`, `email`, `additional_info`, `additiona_info_2`, `checked_one`, `checked_two`, `StreetName`, `HouseNum`, `GateNum`, `Code`, `FloorNum`, `FlatNum`, `Corp`, `text_latin`) VALUES
(1, '', '', 'as@fsadfas.sd', 'sdsdd', '', 'Vici', 1, 'Новозадрищенская', '5', '65', '654234', '-1', '-2', 'если есть', 'Я привык!'),
(2, 'Матвеев А.В.', '+7 965 322 70 22', 'alexey.matveev1@rambler.ru', 'не подставляться!', 'Дщку', 'Errare Humanum est', 0, 'одни', 'два', 'три', 'четыре', 'пять', 'шесть', 'есть', 'удивлен'),
(3, 'ывааываыва', '23123123', 'alexey.matveev1@rambler.ru', 'dfsdfsdfsdf', 'sdfsdfsdfsdf', 'Vici', 1, 'sdfsdfsd', 'sdfsdfsd', 'sdfsdfsdf', 'ccccc', 'cccc', '4444', '223', 'lk');

-- --------------------------------------------------------

--
-- Структура таблицы `forms`
--

CREATE TABLE IF NOT EXISTS `forms` (
`id` int(11) NOT NULL,
  `fio` varchar(100) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `additional_info` text NOT NULL,
  `additional_info2` text,
  `check_one` varchar(50) DEFAULT 'Veni',
  `checkbox-latin` varchar(10) DEFAULT NULL,
  `delivery` varchar(30) DEFAULT NULL,
  `Street` varchar(80) NOT NULL,
  `House` varchar(20) NOT NULL,
  `Gate` varchar(20) DEFAULT NULL,
  `Code` varchar(20) DEFAULT NULL,
  `Floor` varchar(10) DEFAULT NULL,
  `FlatNum` varchar(10) DEFAULT NULL,
  `Corp` varchar(10) DEFAULT NULL,
  `select_point` varchar(30) NOT NULL,
  `additional-info-latin` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
`id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `value` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `value`) VALUES
(1, 0, 'Блютуз наушники'),
(2, 0, 'Микронаушники'),
(3, 0, 'Блютуз колонки'),
(4, 0, 'Аксессуары'),
(5, 0, 'Доставка и оплата'),
(6, 0, 'Гарантия'),
(7, 0, 'О нас'),
(8, 0, 'Контакты'),
(9, 5, 'Lorem'),
(10, 5, 'Ipsum'),
(11, 5, 'Et cetera terra terra'),
(12, 11, 'Lorem'),
(13, 11, 'Ipsum');

-- --------------------------------------------------------

--
-- Структура таблицы `self_delivery`
--

CREATE TABLE IF NOT EXISTS `self_delivery` (
`id` int(11) NOT NULL COMMENT 'index',
  `fio` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `additional_info` text COLLATE utf8_unicode_ci NOT NULL,
  `additiona_info_2` text COLLATE utf8_unicode_ci,
  `checked_one` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Veni',
  `checked_two` tinyint(1) DEFAULT NULL,
  `extraction_point` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `text_latin` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица самовывоза' AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `self_delivery`
--

INSERT INTO `self_delivery` (`id`, `fio`, `phone`, `email`, `additional_info`, `additiona_info_2`, `checked_one`, `checked_two`, `extraction_point`, `text_latin`) VALUES
(1, 'fio', '+712093091230891203', 'asd@ad.ls', 'additional1', 'additional2', 'Vinnie', 0, '2', 'why'),
(2, 'fio2', '+712093091230891203', 'asd@ad.ls', 'additional1', 'additional2', 'Vinnie', 1, '2', 'why'),
(3, 'ddd', 'aaa', 'amatveev.prog@gmail.com', 'fff', '', 'Vici', 0, '2', 'why?'),
(4, 'ddd', 'aaa', 'amatveev.prog@gmail.com', 'fff', '', 'Vici', 1, '2', 'why?'),
(5, 'Фамилия И.О.', '42344234234', 'as@fsadfas.sd', '123fff', 'ddddddd', 'Errare Humanum est', 1, '4', 'gjxthdf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courier_delivery`
--
ALTER TABLE `courier_delivery`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD KEY `id_2` (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
 ADD UNIQUE KEY `id` (`id`), ADD KEY `id_2` (`id`);

--
-- Indexes for table `self_delivery`
--
ALTER TABLE `self_delivery`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courier_delivery`
--
ALTER TABLE `courier_delivery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'index',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `self_delivery`
--
ALTER TABLE `self_delivery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'index',AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
