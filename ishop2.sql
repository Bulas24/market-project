-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 30 2019 г., 15:02
-- Версия сервера: 5.5.62
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ishop2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_group`
--

CREATE TABLE `attribute_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `attribute_group`
--

INSERT INTO `attribute_group` (`id`, `title`) VALUES
(1, 'Механизм'),
(2, 'Стекло'),
(3, 'Ремешок'),
(4, 'Корпус'),
(5, 'Индикация');

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_product`
--

CREATE TABLE `attribute_product` (
  `attr_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `attribute_product`
--

INSERT INTO `attribute_product` (`attr_id`, `product_id`) VALUES
(1, 1),
(1, 3),
(1, 38),
(2, 2),
(2, 4),
(3, 4),
(3, 13),
(4, 30),
(4, 31),
(4, 32),
(5, 2),
(5, 4),
(6, 1),
(6, 3),
(6, 6),
(6, 33),
(6, 38),
(7, 4),
(7, 5),
(7, 14),
(8, 3),
(8, 4),
(9, 4),
(9, 8),
(9, 13),
(9, 38),
(10, 4),
(11, 9),
(11, 10),
(12, 2),
(12, 3),
(13, 38),
(14, 4),
(14, 13),
(16, 5),
(18, 4),
(19, 3),
(19, 4),
(19, 5),
(19, 12),
(19, 38);

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_value`
--

CREATE TABLE `attribute_value` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `attr_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `attribute_value`
--

INSERT INTO `attribute_value` (`id`, `value`, `attr_group_id`) VALUES
(1, 'Механика с автоподзаводом', 1),
(2, 'Механика с ручным заводом', 1),
(3, 'Кварцевый от батарейки', 1),
(4, 'Кварцевый от солнечного аккумулятора', 1),
(5, 'Сапфировое', 2),
(6, 'Минеральное', 2),
(7, 'Полимерное', 2),
(8, 'Стальной', 3),
(9, 'Кожаный', 3),
(10, 'Каучуковый', 3),
(11, 'Полимерный', 3),
(12, 'Нержавеющая сталь', 4),
(13, 'Титановый сплав', 4),
(14, 'Латунь', 4),
(15, 'Полимер', 4),
(16, 'Керамика', 4),
(17, 'Алюминий', 4),
(18, 'Аналоговые', 5),
(19, 'Цифровые', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `brand`
--

CREATE TABLE `brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'brand_no_image.jpg',
  `description` text,
  `keywords` varchar(255) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `brand`
--

INSERT INTO `brand` (`id`, `title`, `alias`, `img`, `description`, `keywords`, `content`) VALUES
(1, 'Casio', 'casio', '30a5bdd34920035b1c59a2975bb7e8e2.jpg', 'Casio Computer Co., Ltd. (яп. カシオ計算機株式会社 Касио кэйсанки кабусики гайся) — японский производитель электронных устройств. Корпорация основана в апреле 1946 года в Токио. Наиболее известна как производитель калькуляторов, аудио оборудования, КПК, фотокамер, музыкальных инструментов, планшетов и наручных часов.', 'wwwwww', '<p>CASIO - Всемирно известная марка родных, японских часов. Не было бы на земном шаре человека, который бы не знал о компании CASIO. Его происхождение уходит в глубокие сороковые годы прошлого века. Это фамилия семи основателей всемирно известных часов.</p>\r\n\r\n<p>Компания CASIO бесспорно является одним из мировых лидеров среди производителей часовой продукции. С самых первых выпусков CASIO является эталоном качественности, многофункциональности, оригинальности, разнообразия... много эпитетов можно подобрать в это слово.</p>\r\n\r\n<p>Корпоративное кредо CASIO - созидание и содействие. Оно отображает обязательство, данное компанией обществу - предлагать ему постоянно новые и полезные изделия, которые под силу произвести только CASIO.</p>\r\n'),
(2, 'Citizen', 'citizen', 'abt-2.jpg', 'Описание бренда часов Citizen', '', '<p>Контент бренда часов Citizen</p>\r\n'),
(3, 'Royal London', 'royal-london', 'abt-3.jpg', 'Описание бренда часов Royal London', '', '<p>Контент бренда часов Royal London</p>\r\n'),
(5, 'Diesel', 'diesel', '52d6d3bde21aebe12f1196235caecad5.jpg', 'Описание бренда часов Diesel', '', '<p>Дизайн часов Diesel можно описать всего двумя словами: смелый и дерзкий. Этот брэнд давно доказал, что его творения вне конкуренции, смелые и дерзкие, с урбанистическим духом, - носить Diesel - значит показать свою индивидуальность. Эти яркие цвета, ремни по ширине не уступающие брючным, дизайн как будто с другой планеты &ndash; все это скажет миру, что вы так же уникальны и позитивны как часы Diesel, которые вы носите.</p>\r\n\r\n<p>Часы Дизель могут быть какими угодно, только не обычными. Детали в часах привлекательны и современны, что делает часы подходящими для носки и с костюмом, и с джинсами. Наручные часы Diesel зарекомендовали себя как обязательный атрибут продвинутых и модных молодых людей, живущих яркой, динамичной жизнью. Часы Diesel имеют некоторые характерные черты, благодаря которым бренд выделяется на фоне других марок направления fashion. Настоящей находкой Diesel стал большой, а иногда просто огромный циферблат. Суть задумки проста: часы заметны и легко узнаваемы. Также сам спортивно-дерзкий стиль Diesel является популярным и востребованным во всем мире. Брэнд играет с разнообразными материалами &ndash; тут и кожа, и сталь, и пластик, и каучук, и силикон. В цветовой палитре бестселлерами являются природные расцветки &ndash; матовый темно коричневый, коричневый с золотистым шиммером, темно-зеленый синий, черный, а также игра контрастов &ndash; белый ремень с красной светодиодной подсветкой, желтое на черном. Среди коллекций есть классика, электронные модели, хронографы, часы с 5 часовыми зонами, знаменитые SBA.</p>\r\n'),
(6, 'Seico', 'seico', '6c953bebec250de488b1306776d2ecd2.jpg', 'описание бренда часов Seico', 'новый', '<p>Контент бренда часов Diesel</p>\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `parent_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`, `alias`, `parent_id`, `keywords`, `description`) VALUES
(1, 'Men', 'men', 0, 'Men', 'Men'),
(2, 'Women', 'women', 0, 'Women', 'Women'),
(3, 'Kids', 'kids', 0, 'Kids', 'Kids'),
(4, 'Электронные', 'elektronnye', 1, 'Электронные', 'Электронные'),
(5, 'Механические', 'mehanicheskie', 1, 'mehanicheskie', 'mehanicheskie'),
(6, 'Casio', 'casio', 4, 'Casio', 'Casio'),
(7, 'Citizen', 'citizen', 4, 'Citizen', 'Citizen'),
(8, 'Royal London', 'royal-london', 5, 'Royal London', 'Royal London'),
(9, 'Seiko', 'seiko', 5, 'Seiko', 'Seiko'),
(10, 'Epos', 'epos', 5, 'Epos', 'Epos'),
(11, 'Электронные', 'elektronnye-11', 2, 'Электронные', 'Электронные'),
(12, 'Механические', 'mehanicheskie-12', 2, 'Механические', 'Механические'),
(13, 'Adriatica', 'adriatica', 11, 'Adriatica', 'Adriatica'),
(16, 'Clain', 'clain', 12, 'Clain', 'Clain');

-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

CREATE TABLE `currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(10) NOT NULL,
  `symbol_right` varchar(10) NOT NULL,
  `value` float(15,2) NOT NULL,
  `base` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`id`, `title`, `code`, `symbol_left`, `symbol_right`, `value`, `base`) VALUES
(1, 'Рубль', 'RUB', '₽', '', 65.00, '0'),
(2, 'доллар', 'USD', '$', '', 1.00, '1'),
(3, 'Евро', 'EUR', '€', '', 1.13, '0'),
(4, 'Гривна', 'UAH', '', '₴', 25.19, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

CREATE TABLE `gallery` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gallery`
--

INSERT INTO `gallery` (`id`, `product_id`, `img`) VALUES
(1, 2, 's-1.jpg'),
(4, 2, '04323c506fa413cb78c47db41525b60a.jpg'),
(5, 2, '35708d420a42c7fb2f340e70c73a1a0f.jpg'),
(6, 3, '049010c7b5dc47ac56ed6d3426ac8cc7.jpg'),
(7, 3, '77d5c8f49946eef9dca565326a54f803.jpg'),
(8, 3, '452e26ec15fd8823bebdc4156045c1b6.jpg'),
(9, 3, '71d8ce0c851abe58dbbdcce3f099c670.jpg'),
(10, 3, '77e25ac3c4a6a61f15ae30d44da22838.jpg'),
(11, 3, '373a05210f8243a77e89c4fa3cd543c9.jpg'),
(12, 1, '7042736dca600c5d098d12eee8cf4018.jpg'),
(13, 1, '86d96573a2e09ff5cd7cb22f1049f37c.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_brand`
--

CREATE TABLE `gallery_brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gallery_brand`
--

INSERT INTO `gallery_brand` (`id`, `brand_id`, `img`) VALUES
(9, 1, '79cf50167253774c28c58430ff3ab4bf.jpg'),
(11, 1, 'a649dbf21c61b90ba95ead2489c00353.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `modification`
--

CREATE TABLE `modification` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL DEFAULT '0',
  `old_price` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `modification`
--

INSERT INTO `modification` (`id`, `product_id`, `title`, `price`, `old_price`) VALUES
(7, 5, 'Silver', 200, 240),
(8, 5, 'Red', 250, 0),
(225, 2, 'Silver', 80, 0),
(226, 2, 'Red', 70, 100),
(227, 1, 'Dark Black', 305, 0),
(228, 1, 'Red', 310, 350),
(229, 1, 'Silverr333', 370, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  `currency` varchar(10) NOT NULL,
  `note` text,
  `sum` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `user_id`, `status`, `date`, `update_at`, `currency`, `note`, `sum`) VALUES
(39, 29, '0', '2019-08-05 06:40:23', '2019-08-16 06:26:25', 'RUB', '', 0),
(46, 29, '0', '2019-08-11 09:20:57', NULL, 'USD', '', 0),
(47, 29, '0', '2019-08-11 09:21:17', NULL, 'USD', '', 0),
(48, 29, '0', '2019-08-11 09:21:57', NULL, 'USD', '', 0),
(49, 29, '0', '2019-08-11 09:22:29', NULL, 'USD', '', 0),
(50, 29, '1', '2019-08-11 09:22:41', '2019-08-16 06:26:14', 'USD', '', 0),
(51, 29, '0', '2019-08-19 11:41:01', NULL, 'RUB', '', 76375),
(52, 29, '0', '2019-08-19 12:25:58', NULL, 'USD', '', 475),
(56, 29, '0', '2019-08-21 17:33:50', NULL, 'RUB', '', 26000),
(57, 29, '0', '2019-08-21 17:34:51', NULL, 'RUB', '', 19500),
(58, 29, '0', '2019-08-21 17:35:23', NULL, 'RUB', '', 26000),
(59, 29, '0', '2019-08-21 17:46:27', NULL, 'RUB', '', 4875),
(60, 29, '0', '2019-08-30 11:54:09', NULL, 'RUB', '', 149500),
(61, 29, '0', '2019-08-31 04:25:06', NULL, 'RUB', '', 31200),
(62, 29, '0', '2019-08-31 04:26:29', NULL, 'RUB', '', 250575);

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `qty`, `title`, `price`) VALUES
(69, 39, 1, 1, 'Casio MRP-700-1AVEF', 18846),
(70, 39, 2, 1, 'Casio MQ-24-7BUL', 4397),
(82, 46, 1, 1, 'Casio MRP-700-1AVEF', 300),
(83, 46, 2, 1, 'Casio MQ-24-7BUL', 75),
(84, 47, 5, 1, 'Citizen BJ2111-08E', 500),
(85, 47, 1, 2, 'Casio MRP-700-1AVEF (Black)', 640),
(86, 48, 133, 3, 'Новый товар 6', 300),
(87, 48, 133, 1, 'Новый товар 6 (Red)', 300),
(88, 49, 2, 1, 'Casio MQ-24-7BUL', 75),
(89, 49, 3, 1, 'Casio GA-1000-1AER', 400),
(90, 50, 1, 1, 'Casio MRP-700-1AVEF', 300),
(91, 51, 1, 1, 'Casio MRP-700-1AVEF', 19500),
(92, 51, 2, 1, 'Casio MQ-24-7BUL', 4875),
(93, 51, 4, 2, 'Citizen JP1010-00E', 52000),
(94, 52, 2, 1, 'Casio MQ-24-7BUL', 75),
(95, 52, 3, 1, 'Casio GA-1000-1AER', 400),
(99, 56, 4, 1, 'Citizen JP1010-00E', 26000),
(100, 57, 1, 1, 'Casio MRP-700-1AVEF', 19500),
(101, 58, 3, 1, 'Casio GA-1000-1AER', 26000),
(102, 59, 2, 1, 'Casio MQ-24-7BUL', 4875),
(103, 60, 5, 3, 'Citizen BJ2111-08E', 97500),
(104, 60, 3, 2, 'Casio GA-1000-1AER', 52000),
(105, 61, 2, 6, 'Casio MQ-24-7BUL (Silver)', 31200),
(106, 62, 5, 4, 'Citizen BJ2111-08E', 130000),
(107, 62, 1, 1, 'Casio MRP-700-1AVEF (Dark Black)', 19825),
(108, 62, 1, 5, 'Casio MRP-700-1AVEF (Red)', 100750);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `brand_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `content` text,
  `price` float NOT NULL DEFAULT '0',
  `old_price` float NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `keywords` varchar(255) DEFAULT NULL,
  `description` text,
  `img` varchar(255) NOT NULL DEFAULT 'no_image.jpg',
  `hit` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `brand_id`, `title`, `alias`, `content`, `price`, `old_price`, `status`, `keywords`, `description`, `img`, `hit`) VALUES
(1, 6, 1, 'Casio MRP-700-1AVEF', 'casio-mrp-700-1avef', '', 300, 0, '1', '', '', 'p-1.png', '1'),
(2, 4, 1, 'Casio MQ-24-7BUL', 'casio-mq-24-7bul', '<p>Lorem контент ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique, diam in consequat iaculis, est purus iaculis mauris, imperdiet facilisis ante ligula at nulla. Quisque volutpat nulla risus, id maximus ex aliquet ut. Suspendisse potenti. Nulla varius lectus id turpis dignissim porta. Quisque magna arcu, blandit quis felis vehicula, feugiat gravida diam. Nullam nec turpis ligula. Aliquam quis blandit elit, ac sodales nisl. Aliquam eget dolor eget elit malesuada aliquet. In varius lorem lorem, semper bibendum lectus lobortis ac.</p>\r\n\r\n<p>Mauris placerat vitae lorem gravida viverra. Mauris in fringilla ex. Nulla facilisi. Etiam scelerisque tincidunt quam facilisis lobortis. In malesuada pulvinar neque a consectetur. Nunc aliquam gravida purus, non malesuada sem accumsan in. Morbi vel sodales libero.</p>\r\n', 75, 115, '1', 'ключевые слова', 'Кварцевые наручные часы в классическом исполнении, корпус пластиковый круглой формы, секундная стрелка центральная на белом циферблате.', 'b29c7c749ff85cf436a33ad19891759a.png', '1'),
(3, 4, 1, 'Casio GA-1000-1AER', 'casio-ga-1000-1aer', '<p>content</p>\r\n', 400, 450, '1', 'keywords', 'desc', 'p-3.png', '1'),
(4, 4, 2, 'Citizen JP1010-00E', 'citizen-jp1010-00e', NULL, 400, 500, '1', NULL, NULL, 'p-4.png', '1'),
(5, 7, 2, 'Citizen BJ2111-08E', 'citizen-bj2111-08e', NULL, 500, 540, '1', '111', '222', 'p-5.png', '1'),
(6, 7, 2, 'Citizen AT0696-59E', 'citizen-at0696-59e', NULL, 350, 450, '1', NULL, NULL, 'p-6.png', '1'),
(7, 4, 5, 'Q&Q Q956J302Y', 'q-and-q-q956j302y', NULL, 20, 0, '1', NULL, NULL, 'no_image.jpg', '1'),
(8, 8, 3, 'Royal London 41040-01', 'royal-london-41040-01', NULL, 90, 0, '1', NULL, NULL, 'p-8.png', '1'),
(9, 8, 3, 'Royal London 200345-02', 'royal-london-200345-02', '', 115, 0, '1', '', '', 'no_image.jpg', '0'),
(10, 8, 3, 'Royal London 41156-02', 'royal-london-41156-02', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique, diam in consequat iaculis, est purus iaculis mauris, imperdiet facilisis ante ligula at nulla. Quisque volutpat nulla risus, id maximus ex aliquet ut. Suspendisse potenti. Nulla varius lectus id turpis dignissim porta. Quisque magna arcu, blandit quis felis vehicula, feugiat gravida diam. Nullam nec turpis ligula. Aliquam quis blandit elit, ac sodales nisl. Aliquam eget dolor eget elit malesuada aliquet. In varius lorem lorem, semper bibendum lectus lobortis ac.</p>\n\n                                            <p>Mauris placerat vitae lorem gravida viverra. Mauris in fringilla ex. Nulla facilisi. Etiam scelerisque tincidunt quam facilisis lobortis. In malesuada pulvinar neque a consectetur. Nunc aliquam gravida purus, non malesuada sem accumsan in. Morbi vel sodales libero.</p>', 100, 0, '1', NULL, NULL, 'p-10.jpg', '0'),
(12, 6, 2, 'Часы 1', 'chasy-1', '', 100, 0, '1', '', '', 'no_image.jpg', '1'),
(13, 7, 2, 'Часы 2', 'chasy-2', NULL, 105, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(14, 7, 2, 'Часы 3', 'chasy-3', NULL, 110, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(15, 13, 2, 'Часы 4', 'chasy-4', NULL, 115, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(16, 7, 2, 'Часы 5', 'chasy-5', NULL, 115, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(17, 7, 2, 'Часы 6', 'chasy-6', NULL, 120, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(20, 7, 2, 'Часы 7', 'chasy-7', NULL, 120, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(21, 7, 2, 'Часы 8', 'chasy-8', NULL, 120, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(22, 7, 2, 'Часы 9', 'chasy-9', NULL, 125, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(23, 7, 2, 'Часы 10', 'chasy-10', NULL, 125, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(24, 7, 2, 'Часы 11', 'chasy-11', NULL, 125, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(25, 7, 2, 'Часы 12', 'chasy-12', NULL, 125, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(26, 7, 2, 'Часы 13', 'chasy-13', NULL, 125, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(27, 7, 2, 'Часы 14', 'chasy-14', NULL, 125, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(28, 7, 2, 'Часы 15', 'chasy-15', NULL, 125, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(29, 7, 2, 'Часы 16', 'chasy-16', NULL, 125, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(30, 7, 2, 'Часы 17', 'chasy-17', NULL, 125, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(31, 7, 2, 'Часы 18', 'chasy-18', NULL, 125, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(32, 7, 2, 'Часы 19', 'chasy-19', NULL, 125, 0, '1', NULL, NULL, 'no_image.jpg', '0'),
(33, 7, 2, 'Часы 20', 'chasy-20', NULL, 125, 0, '1', NULL, NULL, 'no_image.jpg', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `related_product`
--

CREATE TABLE `related_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `related_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `related_product`
--

INSERT INTO `related_product` (`product_id`, `related_id`) VALUES
(1, 24),
(2, 1),
(2, 3),
(5, 1),
(5, 7),
(5, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `email`, `name`, `address`, `role`, `number`) VALUES
(29, 'user1', '$2y$10$ocF4eJXt9ReYCcjkC4RC9OwqFGfUWhLSysxid6yL7V/wGYxw3qpJq', 'he14@mail.ru', 'Евгений', '11123ввввв11', 'admin', '89135568444'),
(35, 'user66', '$2y$10$neHtlBIayI2yf66j.fmJ9OdzRXOxybc3VRrXjDB/BEnimmqvIJsOS', 'user66@user.ru', 'Ron66', '1666вввв', 'user', '89135668544'),
(41, 'user11', '$2y$10$ta.AKdpqrz2Vk8KvmAn6MeZIiqq0g5gNXz21BHADEkNfNuEdkneei', 'user11@user.ru', 'dddd', '111', 'user', '83333458444'),
(43, 'user12', '$2y$10$lKZy0rmd5SBkQyCmfP/xMu/bZVvLGRsx0/f/LEiqvpyZjILhItEQ6', 'user12@user.ru', 'Ron', '11123ввввв', 'user', '89145567444'),
(44, 'user13', '$2y$10$Hv.TbtnP1CfG4WKZhuG3deR7PxNqqM0HF/Sb2.oa9Dw2CE22iYFe.', 'user13@user.ru', 'User13', '11123ввввв', 'user', '891355455667'),
(45, 'user14', '$2y$10$KDvUfyv9mQ5GYoc91nrlsuH5kcMT3FgAkKhaaV4YeAYStD/EDgcpO', 'user14@user.ru', 'Ron', '11123ввввв', 'user', '8912125568444'),
(46, 'user15', '$2y$10$65GdHwNeaT2UZ9SlJXUYxukPTTh84iszGYuAUEVtEH/ZdUQhuNOIS', 'user15@user.ru', 'Ron', '11123ввввв', 'user', '89135968444'),
(47, 'user16', '$2y$10$ApZeVIJlHvyo7/q6.T9uFen0npIPHHy9DW8UJbrBHxyYrvliBd9HK', 'user16@user.ru', 'Ron', '11123ввввв', 'user', '89135568477'),
(48, 'user17', '$2y$10$ljHnZtQmC.9LLcUi1IeBWeygqj9NrhS3luMFSAL7MfeZtcg.RQ2hW', 'user17@user.ru', 'Ron', '1331', 'user', '89135568999');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `attribute_group`
--
ALTER TABLE `attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`attr_id`,`product_id`);

--
-- Индексы таблицы `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`),
  ADD KEY `attr_group_id` (`attr_group_id`);

--
-- Индексы таблицы `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Индексы таблицы `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gallery_brand`
--
ALTER TABLE `gallery_brand`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `modification`
--
ALTER TABLE `modification`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`),
  ADD KEY `category_id` (`category_id`,`brand_id`),
  ADD KEY `hit` (`hit`);

--
-- Индексы таблицы `related_product`
--
ALTER TABLE `related_product`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user_number_uindex` (`number`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `attribute_group`
--
ALTER TABLE `attribute_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `attribute_value`
--
ALTER TABLE `attribute_value`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `gallery_brand`
--
ALTER TABLE `gallery_brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `modification`
--
ALTER TABLE `modification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
