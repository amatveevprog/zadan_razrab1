-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 11 2016 г., 16:29
-- Версия сервера: 5.6.20
-- Версия PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `test_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name_of_category` text COLLATE utf8_unicode_ci NOT NULL,
  `description_of_category` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name_of_category`, `description_of_category`) VALUES
(1, 0, 'НОСКИ', ''),
(2, 0, 'Еда', ''),
(3, 2, 'Гамбургер', 'просто гамбургер'),
(4, 0, 'Одежда', 'Одежда'),
(5, 4, 'Норковая шуба', ''),
(6, 0, 'Смартфоны', ''),
(7, 6, 'Iphone', 'Apple Corporation');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
`id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `good_name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `price` int(11) NOT NULL,
  `sklad_qty` int(11) NOT NULL COMMENT 'Количество на складе'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='товар' AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `category_id`, `good_name`, `description`, `price`, `sklad_qty`) VALUES
(1, 7, 'Iphone 7S ', 'Камера 100 Мпикс!', 70, 20),
(3, 1, 'Носки ХБ', NULL, 190, 2),
(4, 5, 'Норковая шуба 1', NULL, 100000, 3),
(5, 2, 'Макароны', 'Спагетти', 100, 5),
(6, 3, 'Гамбургер с говядиной', '50%', 140, 10),
(7, 6, 'Смартфон Lenovo', 'Смартфон с интернетом', 12000, 23);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `description`) VALUES
(1, 1, 'Заказ 1 Васи Пупкина'),
(2, 1, 'Заказ 2 Васи Пупкина'),
(3, 3, 'Заказ Елены 1'),
(4, 2, 'Заказ Пети Раз'),
(5, 1, 'Заказ Васи Пупкина третий раз!');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_goods`
--

CREATE TABLE IF NOT EXISTS `orders_goods` (
`id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'Количество товара'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `orders_goods`
--

INSERT INTO `orders_goods` (`id`, `order_id`, `goods_id`, `quantity`) VALUES
(1, 5, 6, 2),
(2, 1, 1, 1),
(3, 2, 5, 1),
(4, 3, 4, 1),
(5, 4, 3, 20),
(6, 4, 7, 2),
(7, 4, 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `user_name` text COLLATE utf8_unicode_ci NOT NULL,
  `user_info` text COLLATE utf8_unicode_ci,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'пароль пользователя на сайте'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_info`, `password`) VALUES
(1, 'Вася Пупкин', 'Самый известный человек', '0'),
(2, 'Петя Иванов', 'Самый богатый парень', '0'),
(3, 'Лена Сидорова', 'Самая модная девушка', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
 ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`), ADD KEY `category_id` (`category_id`), ADD KEY `category_id_2` (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders_goods`
--
ALTER TABLE `orders_goods`
 ADD PRIMARY KEY (`id`), ADD KEY `order_id` (`order_id`,`goods_id`), ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `goods`
--
ALTER TABLE `goods`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `orders_goods`
--
ALTER TABLE `orders_goods`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `goods`
--
ALTER TABLE `goods`
ADD CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `orders_goods`
--
ALTER TABLE `orders_goods`
ADD CONSTRAINT `orders_goods_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `orders_goods_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
