-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 04, 2016 at 11:14 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salestock`
--

-- --------------------------------------------------------

--
-- Table structure for table `nu_category`
--

CREATE TABLE `nu_category` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nu_category`
--

INSERT INTO `nu_category` (`id_category`, `category_name`, `category_parent`) VALUES
(1, 'Blazer Modern', NULL),
(2, 'Blouse', NULL),
(3, 'Cardigan', NULL),
(4, 'Couple Set', 21),
(5, 'Cropped Pants', 20),
(6, 'Culottes Pants', 20),
(7, 'Dress', NULL),
(8, 'Dress Set', 21),
(9, 'Hand Bag', NULL),
(10, 'Jacket', NULL),
(11, 'Jumpsuit', NULL),
(12, 'Long Pants', 20),
(13, 'Maxi Dress', 7),
(14, 'Midi Dress', 7),
(15, 'Mini Dress', 7),
(16, 'Muslim Blouse', NULL),
(17, 'Muslim Dress', 7),
(18, 'Muslim Set', 21),
(19, 'Outer', NULL),
(20, 'Pants', NULL),
(21, 'Set', NULL),
(22, 'Shirt', NULL),
(23, 'Sling Bag', NULL),
(24, 'Tote', NULL),
(25, 'Wearpack', NULL),
(26, 'Wristwatch', NULL),
(27, 'Kaos Oblong', NULL),
(28, 'Sendal', NULL),
(29, 'Sendal', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nu_client`
--

CREATE TABLE `nu_client` (
  `id_client` int(11) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `api_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nu_client`
--

INSERT INTO `nu_client` (`id_client`, `client_name`, `api_key`) VALUES
(1, 'Pasar Malam', '1067cce5bc8569b846f2e9e6f3a56ac1');

-- --------------------------------------------------------

--
-- Table structure for table `nu_color`
--

CREATE TABLE `nu_color` (
  `id_color` int(11) NOT NULL,
  `color_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nu_color`
--

INSERT INTO `nu_color` (`id_color`, `color_name`) VALUES
(1, 'Broken White'),
(2, 'Brown'),
(3, 'Caramel'),
(4, 'Tangerine'),
(5, 'Black'),
(6, 'Navy'),
(7, 'Cream'),
(8, 'White'),
(9, 'Baby Pink'),
(10, 'Blue'),
(11, 'Red'),
(12, 'Light Blue'),
(13, 'Maroon'),
(14, 'Teal'),
(15, 'Dark Grey'),
(16, 'Dusty Purple'),
(17, 'Light Grey'),
(18, 'Mint '),
(19, 'Pink'),
(20, 'Grey'),
(21, 'Black (Grey)'),
(22, 'Black (Pink)'),
(23, 'Grey (Black)'),
(24, 'Grey (Pink)'),
(25, 'Pink (Black)'),
(26, 'Pink (Grey)'),
(27, 'Tosca'),
(28, 'Purple'),
(29, 'Khaki'),
(30, 'Fuchsia'),
(31, 'Salmon'),
(32, 'Black (Broken White)'),
(33, 'Black (White)'),
(34, 'Red (Broken White)'),
(35, 'Red (White)'),
(36, 'Orange'),
(37, 'Peach'),
(38, 'Yellow'),
(39, 'Green'),
(40, 'Dark Blue'),
(41, 'El Blue'),
(42, 'Salem'),
(43, 'Choco'),
(44, 'Mocca'),
(45, 'Violet'),
(46, 'Brick'),
(47, 'Mustard'),
(48, 'Dark Brown'),
(49, 'Milo'),
(50, 'Baby Blue'),
(51, 'Lime'),
(52, 'White (Tangerine)'),
(53, 'White (Grey)'),
(54, 'White (Pink)'),
(55, 'Magenta'),
(56, 'Black Motif 1'),
(57, 'Black Motif 2'),
(58, 'Cream (Black)'),
(59, 'Cream (Red)'),
(60, 'Nude Pink');

-- --------------------------------------------------------

--
-- Table structure for table `nu_item`
--

CREATE TABLE `nu_item` (
  `id_item` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_color` int(11) NOT NULL,
  `id_size` int(11) NOT NULL,
  `item_price` int(11) NOT NULL COMMENT 'override product price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nu_item`
--

INSERT INTO `nu_item` (`id_item`, `id_product`, `id_color`, `id_size`, `item_price`) VALUES
(1, 1, 1, 1, 0),
(2, 1, 2, 1, 0),
(3, 1, 3, 1, 0),
(4, 1, 4, 1, 0),
(5, 2, 5, 2, 0),
(6, 2, 6, 2, 0),
(7, 3, 7, 3, 0),
(8, 3, 7, 4, 0),
(9, 3, 7, 5, 0),
(10, 3, 7, 6, 0),
(11, 4, 8, 5, 0),
(12, 5, 9, 2, 0),
(13, 5, 5, 2, 0),
(14, 5, 10, 2, 0),
(15, 5, 11, 2, 0),
(16, 5, 8, 2, 0),
(17, 6, 12, 7, 0),
(18, 6, 12, 8, 0),
(19, 6, 12, 9, 0),
(20, 6, 12, 10, 0),
(21, 7, 9, 5, 0),
(22, 7, 2, 5, 0),
(23, 7, 13, 5, 0),
(24, 7, 14, 5, 0),
(25, 8, 5, 1, 0),
(26, 8, 15, 1, 0),
(27, 8, 16, 1, 0),
(28, 8, 17, 1, 0),
(29, 9, 5, 4, 0),
(30, 9, 18, 4, 0),
(31, 9, 6, 4, 0),
(32, 9, 19, 4, 0),
(33, 10, 5, 5, 0),
(34, 10, 7, 5, 0),
(35, 10, 15, 5, 0),
(36, 10, 20, 5, 0),
(37, 11, 21, 4, 0),
(38, 11, 22, 4, 0),
(39, 11, 23, 4, 0),
(40, 11, 24, 4, 0),
(41, 11, 25, 4, 0),
(42, 11, 26, 4, 0),
(43, 12, 5, 3, 0),
(44, 12, 8, 3, 0),
(45, 13, 20, 3, 0),
(46, 13, 13, 3, 0),
(47, 14, 5, 1, 0),
(48, 14, 20, 1, 0),
(49, 14, 11, 1, 0),
(50, 14, 27, 1, 0),
(51, 15, 5, 1, 0),
(52, 15, 20, 1, 0),
(53, 15, 13, 1, 0),
(54, 15, 28, 1, 0),
(55, 15, 11, 1, 0),
(56, 16, 5, 5, 0),
(57, 16, 29, 5, 0),
(58, 16, 6, 5, 0),
(59, 17, 5, 5, 0),
(60, 17, 10, 5, 0),
(61, 17, 30, 5, 0),
(62, 17, 31, 5, 0),
(63, 18, 5, 3, 0),
(64, 19, 19, 4, 0),
(65, 20, 8, 3, 0),
(66, 21, 32, 1, 0),
(67, 21, 33, 1, 0),
(68, 21, 2, 1, 0),
(69, 21, 6, 1, 0),
(70, 21, 34, 1, 0),
(71, 21, 35, 1, 0),
(72, 22, 7, 4, 0),
(73, 22, 36, 4, 0),
(74, 22, 37, 4, 0),
(75, 22, 27, 4, 0),
(76, 23, 10, 5, 0),
(77, 23, 7, 5, 0),
(78, 23, 37, 5, 0),
(79, 23, 19, 5, 0),
(80, 23, 8, 5, 0),
(81, 23, 38, 5, 0),
(82, 24, 27, 3, 0),
(83, 25, 5, 1, 0),
(84, 25, 7, 1, 0),
(85, 25, 37, 1, 0),
(86, 25, 27, 1, 0),
(87, 26, 5, 1, 0),
(88, 26, 2, 1, 0),
(89, 26, 7, 1, 0),
(90, 26, 6, 1, 0),
(91, 27, 15, 4, 0),
(92, 27, 30, 4, 0),
(93, 27, 37, 4, 0),
(94, 27, 8, 4, 0),
(95, 28, 12, 9, 0),
(96, 28, 12, 7, 0),
(97, 28, 12, 8, 0),
(98, 28, 12, 10, 0),
(99, 29, 5, 4, 0),
(100, 29, 10, 4, 0),
(101, 29, 2, 4, 0),
(102, 29, 7, 4, 0),
(103, 29, 38, 4, 0),
(104, 30, 10, 5, 0),
(105, 30, 30, 5, 0),
(106, 30, 39, 5, 0),
(107, 30, 20, 5, 0),
(108, 30, 4, 5, 0),
(109, 31, 5, 5, 0),
(110, 31, 8, 5, 0),
(111, 32, 5, 4, 0),
(112, 32, 6, 4, 0),
(113, 33, 5, 5, 0),
(114, 33, 10, 5, 0),
(115, 33, 40, 5, 0),
(116, 33, 13, 5, 0),
(117, 33, 6, 5, 0),
(118, 33, 27, 5, 0),
(119, 34, 5, 3, 0),
(120, 34, 41, 3, 0),
(121, 34, 30, 3, 0),
(122, 34, 11, 3, 0),
(123, 35, 5, 1, 0),
(124, 36, 5, 11, 0),
(125, 36, 7, 11, 0),
(126, 36, 13, 11, 0),
(127, 36, 37, 11, 0),
(128, 36, 42, 11, 0),
(129, 37, 5, 1, 0),
(130, 38, 5, 3, 0),
(131, 39, 5, 5, 0),
(132, 39, 43, 5, 0),
(133, 39, 7, 5, 0),
(134, 39, 15, 5, 0),
(135, 39, 17, 5, 0),
(136, 40, 5, 5, 0),
(137, 40, 15, 5, 0),
(138, 40, 20, 5, 0),
(139, 40, 6, 5, 0),
(140, 41, 5, 5, 0),
(141, 41, 15, 5, 0),
(142, 41, 20, 5, 0),
(143, 41, 6, 5, 0),
(144, 42, 5, 5, 0),
(145, 42, 15, 5, 0),
(146, 42, 20, 5, 0),
(147, 42, 6, 5, 0),
(148, 43, 5, 5, 0),
(149, 43, 8, 5, 0),
(150, 44, 10, 5, 0),
(151, 44, 6, 5, 0),
(152, 44, 37, 5, 0),
(153, 44, 38, 5, 0),
(154, 45, 7, 5, 0),
(155, 45, 20, 5, 0),
(156, 45, 44, 5, 0),
(157, 45, 6, 5, 0),
(158, 46, 5, 11, 0),
(159, 46, 29, 11, 0),
(160, 46, 37, 11, 0),
(161, 46, 45, 11, 0),
(162, 47, 5, 4, 0),
(163, 47, 46, 4, 0),
(164, 47, 47, 4, 0),
(165, 47, 6, 4, 0),
(166, 48, 5, 5, 0),
(167, 48, 6, 5, 0),
(168, 49, 39, 6, 0),
(169, 49, 6, 6, 0),
(170, 49, 37, 6, 0),
(171, 49, 11, 6, 0),
(172, 50, 5, 11, 0),
(173, 50, 7, 11, 0),
(174, 50, 13, 11, 0),
(175, 50, 38, 11, 0),
(176, 51, 5, 5, 0),
(177, 51, 15, 5, 0),
(178, 51, 20, 5, 0),
(179, 51, 6, 5, 0),
(180, 52, 5, 5, 0),
(181, 52, 6, 5, 0),
(182, 52, 37, 5, 0),
(183, 52, 8, 5, 0),
(184, 53, 2, 3, 0),
(185, 53, 43, 3, 0),
(186, 53, 48, 3, 0),
(187, 53, 20, 3, 0),
(188, 53, 6, 3, 0),
(189, 54, 20, 4, 0),
(190, 54, 13, 4, 0),
(191, 55, 13, 2, 0),
(192, 55, 18, 2, 0),
(193, 55, 19, 2, 0),
(194, 55, 8, 2, 0),
(195, 56, 10, 4, 0),
(196, 56, 39, 4, 0),
(197, 56, 20, 4, 0),
(198, 56, 19, 4, 0),
(199, 57, 5, 6, 0),
(200, 57, 15, 6, 0),
(201, 57, 20, 6, 0),
(202, 57, 49, 6, 0),
(203, 58, 10, 3, 0),
(204, 58, 39, 3, 0),
(205, 58, 20, 3, 0),
(206, 58, 11, 3, 0),
(207, 59, 5, 4, 0),
(208, 59, 15, 4, 0),
(209, 59, 6, 4, 0),
(210, 59, 11, 4, 0),
(211, 60, 5, 4, 0),
(212, 60, 7, 4, 0),
(213, 60, 6, 4, 0),
(214, 60, 8, 4, 0),
(215, 61, 39, 4, 0),
(216, 61, 20, 4, 0),
(217, 61, 49, 4, 0),
(218, 61, 19, 4, 0),
(219, 61, 42, 4, 0),
(220, 61, 8, 4, 0),
(221, 62, 50, 11, 0),
(222, 62, 5, 11, 0),
(223, 62, 20, 11, 0),
(224, 62, 37, 11, 0),
(225, 63, 9, 2, 0),
(226, 63, 5, 2, 0),
(227, 63, 51, 2, 0),
(228, 63, 8, 2, 0),
(229, 63, 9, 5, 0),
(230, 63, 51, 5, 0),
(231, 63, 8, 5, 0),
(232, 63, 5, 6, 0),
(233, 63, 51, 6, 0),
(234, 63, 9, 11, 0),
(235, 63, 5, 11, 0),
(236, 63, 51, 11, 0),
(237, 63, 8, 11, 0),
(238, 64, 10, 3, 0),
(239, 64, 39, 3, 0),
(240, 64, 20, 3, 0),
(241, 64, 11, 3, 0),
(242, 65, 52, 4, 0),
(243, 66, 20, 4, 0),
(244, 66, 23, 4, 0),
(245, 66, 53, 4, 0),
(246, 66, 54, 4, 0),
(247, 67, 5, 5, 0),
(248, 67, 20, 5, 0),
(249, 67, 44, 5, 0),
(250, 67, 6, 5, 0),
(251, 67, 36, 5, 0),
(252, 67, 27, 5, 0),
(253, 68, 5, 5, 0),
(254, 68, 20, 5, 0),
(255, 68, 19, 5, 0),
(256, 69, 50, 11, 0),
(257, 69, 5, 11, 0),
(258, 69, 19, 11, 0),
(259, 69, 8, 11, 0),
(260, 70, 20, 5, 0),
(261, 70, 55, 5, 0),
(262, 70, 6, 5, 0),
(263, 70, 37, 5, 0),
(264, 71, 5, 4, 0),
(265, 71, 2, 4, 0),
(266, 71, 28, 4, 0),
(267, 71, 11, 4, 0),
(268, 72, 5, 3, 0),
(269, 72, 6, 3, 0),
(270, 72, 37, 3, 0),
(271, 72, 11, 3, 0),
(272, 73, 10, 5, 0),
(273, 73, 46, 5, 0),
(274, 74, 56, 12, 0),
(275, 74, 56, 2, 0),
(276, 74, 57, 2, 0),
(277, 74, 57, 12, 0),
(278, 74, 56, 11, 0),
(279, 75, 8, 5, 0),
(280, 76, 40, 4, 0),
(281, 77, 5, 2, 0),
(282, 77, 2, 2, 0),
(283, 77, 39, 2, 0),
(284, 78, 5, 4, 0),
(285, 78, 6, 4, 0),
(286, 78, 8, 4, 0),
(287, 79, 5, 3, 0),
(288, 79, 10, 3, 0),
(289, 79, 11, 3, 0),
(290, 80, 58, 5, 0),
(291, 80, 59, 5, 0),
(292, 81, 5, 3, 0),
(293, 81, 6, 3, 0),
(294, 81, 28, 3, 0),
(295, 81, 11, 3, 0),
(296, 82, 5, 3, 0),
(297, 82, 10, 3, 0),
(298, 82, 30, 3, 0),
(299, 82, 11, 3, 0),
(300, 83, 5, 4, 0),
(301, 83, 13, 4, 0),
(302, 83, 6, 4, 0),
(303, 83, 8, 4, 0),
(304, 84, 5, 5, 0),
(305, 84, 6, 5, 0),
(306, 85, 10, 2, 0),
(307, 85, 20, 2, 0),
(308, 85, 51, 2, 0),
(309, 85, 13, 2, 0),
(310, 85, 18, 2, 0),
(311, 85, 60, 2, 0),
(312, 86, 5, 4, 0),
(313, 86, 6, 4, 0),
(314, 86, 8, 4, 0),
(315, 87, 5, 5, 0),
(316, 87, 20, 5, 0),
(317, 87, 6, 5, 0),
(318, 88, 5, 3, 0),
(319, 88, 6, 3, 0),
(320, 88, 19, 3, 0),
(321, 88, 11, 3, 0),
(322, 88, 8, 3, 0),
(323, 89, 20, 5, 0),
(324, 89, 19, 5, 0),
(325, 89, 8, 5, 0),
(326, 90, 10, 5, 0),
(327, 90, 47, 5, 0),
(328, 90, 6, 5, 0),
(329, 90, 31, 5, 0),
(330, 91, 5, 5, 0),
(331, 91, 19, 5, 0),
(332, 91, 28, 5, 0),
(333, 92, 13, 3, 0),
(334, 92, 14, 3, 0),
(335, 93, 20, 4, 0),
(336, 93, 13, 4, 0),
(337, 93, 6, 4, 0),
(338, 93, 8, 4, 0),
(339, 94, 1, 5, 0),
(340, 95, 2, 5, 0),
(341, 95, 15, 5, 0),
(342, 95, 6, 5, 0),
(343, 95, 19, 5, 0),
(344, 95, 28, 5, 0),
(345, 95, 27, 5, 0),
(346, 96, 10, 6, 0),
(347, 96, 30, 6, 0),
(348, 96, 39, 6, 0),
(349, 96, 20, 6, 0),
(350, 96, 44, 6, 0),
(351, 96, 38, 6, 0),
(352, 97, 5, 5, 0),
(353, 97, 6, 5, 0),
(354, 97, 8, 5, 0),
(355, 98, 39, 6, 0),
(356, 98, 20, 6, 0),
(357, 98, 6, 6, 0),
(358, 98, 19, 6, 0),
(359, 98, 31, 6, 0),
(360, 98, 27, 6, 0),
(361, 99, 9, 6, 0),
(362, 99, 5, 6, 0),
(363, 99, 7, 6, 0),
(364, 99, 20, 6, 0),
(365, 100, 5, 2, 0),
(366, 100, 8, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `nu_product`
--

CREATE TABLE `nu_product` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_description` text NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nu_product`
--

INSERT INTO `nu_product` (`id_product`, `product_name`, `product_price`, `product_description`, `id_category`) VALUES
(1, 'Lafita Army Over Size Tote', 99000, 'Warna Broken White Brown, Caramel, dan Tangerine,  \n1 Ruang utama, 1 Kancing, 1 Saku depan  \nPanjang 40 cm, Tinggi 44 cm, Lebar 8 cm. Panjang tali 58 cm  \nBahan Canvas', 24),
(2, 'Bivanska Plain Pleated Culottes Big Pants', 159000, 'Warna Navy dan Black  \nSatu Ukuran Muat Sampai Size XXXL  \nLingkar Pinggang 92 cm, Lingkar Pinggul 126 cm, Panjang 57 cm  \nBahan Jeans  \nPinggang Belakang Karet, Saku Samping', 6),
(3, 'Bergent List Black Chino Long Pants', 98000, 'Warna Cream  \n\nSize S:  \nLingkar pinggang 72 cm, Lingkar pinggul 90 cm, Panjang 90 cm  \n\nSize M:  \nLingkar pinggang 74 cm, Lingkar pinggul 92 cm, Panjang 91 cm  \n\nSize L:  \nLingkar pinggang 78 cm, Lingkar pinggul 94 cm, Panjang 91 cm  \n\nSize XL:  \nLingkar pinggang 80 cm, Lingkar pinggul 98 cm, Panjang 91 cm  \n\nBahan Katun Twill  \n1 Kancing depan, Resleting depan, 2 Saku samping da 2 saku belakang variasi', 12),
(4, 'Raquelin Michigan Jacket Couple Set', 159000, 'Warna White  \nSatu Ukuran Muat Sampai Size L  \n\nWanita  \nLingkar Dada 100 cm, Lebar Bahu 43 cm, Panjang Lengan 48 cm,  \nLingkar Lengan 32 cm, Panjang 58 cm, Lingkar Pinggang 94 cm  \nBahan Baby Terry  \nRetsleting Depan, 2 Saku Depan  \n\nPria  \nLingkar Dada 108 cm, Lebar Bahu 44 cm, Panjang Lengan 52 cm,  \nLingkar Lengan 38 cm, Panjang 68 cm, Lingkar Pinggang 106 cm  \nBahan Baby Terry  \nRetsleting Depan, 2 Saku Depan', 4),
(5, 'Dessiva Floral Flare Big Midi Dress', 129000, 'Warna Baby Pink, Black, Blue, Red dan White  \nSatu ukuran muat sampai size XXXL  \nLingkar dada 112 cm, Lebar bahu 46 cm, Lingkar lengan 56 cm,  \nPanjang 92 cm, Lingkar pinggang 90 cm  \nBahan Satin  \nPinggang belakang full karet', 14),
(6, 'Helaski Plain Casual Cropped Big Pants', 129000, 'Warna Light Blue  \nSize 31  \nLingkar Pinggang 84 cm, Lingkar Pinggul 88 cm, Panjang 66 cm  \nSize 32  \nLingkar Pinggang 86 cm, Lingkar Pinggul 90 cm, Panjang 67 cm  \nSize 33  \nLingkar Pinggang 88 cm, Lingkar Pinggul 94 cm, Panjang 68 cm  \nSize 34  \nLingkar Pinggang 92 cm, Lingkar Pinggul 96 cm, Panjang 69 cm  \nBahan Denim  \n1 Kancing dan Retsleting Depan  \n2 Saku Samping dan Saku Belakang', 5),
(7, 'Bhareqya Flowery Casual Mini Dress', 95000, 'Warna Baby Pink, Brown, Teal, dan Maroon  \nSatu ukuran muat sampai size L  \nLingkar dada 96 cm, Lebar bahu 38 cm, Lingkar lengan 42 cm, Panajng 92 cm, Lingkar pinggang 84 cm  \nBahan Spandek Kombinasi Brukat Lapis Puring  \nResleting belakang', 15),
(8, 'Shizuita Plain Satchel Hand Bag', 189000, '(Depan- Belakang) Warna Black, Light Grey, Daark Grey dan Dusty Purple  \nTutup Resleting  \nPanjang 30 cm, Tinggi 20 cm, Lebar 10 cm, Panjang tali 40 cm dan Panjang tali tambahan 120 cm  \nTerdapat 2 kantong kecil di dalam dan 1 Kantong resleting di dalam  \nBahan Synthetic Leather', 9),
(9, 'Amelia Plain Cape Maxi Dress', 102000, 'Warna Black, Mint, Navy, dan Pink  \nSatu ukuran muat sampai size M  \nLingkar dada 90 cm, Lebar bahu 36 cm, Lingkar lengan 44 cm, Panjang 139 cm, Lingkar pinggang 68 cm  \nBahan Crepe', 13),
(10, 'Luxiana Plain Longsleeve Cardigan', 119000, 'Warna Black, Cream, Dark Grey, dan Grey  \nSatu Ukuran Muat Sampai Size L  \nLingkar Dada 100 cm, Lebar Bahu 38 cm, Panjang Lengan 54 cm, Lingkar Lengan 34 cm, Panjang 93 cm, Lingkar Pinggang 94 cm, Lingkar Pinggul 108 cm  \nBahan Misty', 3),
(11, 'Misheliya Flowery Overall Wearpack', 159000, '(kiri-kanan) Warna Black (Grey), Black (Pink), Grey (Black), Grey (Pink), Pink (Black), dan Pink (Grey)  \nSatu ukuran muat sampai size M  \nInner:  \nLingkar dada 88 cm, Lebar bahu 33 cm, Panjang lengan 53 cm  \nLingkar lengan 34 cm, Panjang 52 cm, Lingkar pinggang 86 cm, Lingkar pinggul 86 cm  \nBahan Crepe  \n1 kancing belakang  \nWearpack:  \nLingkar dada 80 cm, Lebar bahu 42 cm  \nLingkar lengan 52 cm, Panjang 130 cm, Lingkar pinggang 124 cm, Lingkar pinggul 130 cm  \nBahan Balotely  \nResleting belakang', 25),
(12, 'Sazara Stripe Flare Mini Dress', 99000, 'Warna Black dan White  \nSatu ukuran muat sampai size S  \nLingkar dada 80 cm, Lebar bahu 35 cm, Lingkar lengan 42 cm, Panjang 96 cm, Lingkar pinggang 70 cm,  \nPanjang lengan 51 cm  \nBahan Wedges Scuba', 15),
(13, 'Anisyahrani Two Tone Casual Blouse', 79000, 'Warna Maroon dan Grey  \nSatu Ukuran Muat Sampai Size S  \nLingkar Dada 88 cm, Lebar Bahu 38 cm, Lingkar Lengan 32 cm, Panjang lengan 32 cm, Panjang 58 cm, Lingkar Pinggang 88 cm  \nBahan Katun', 2),
(14, 'Frilysa Plain Flap Hand Bag', 189000, 'Warna Black, Grey, Red dan Tosca  \nTutup Resleting  \nPanjang 30 cm, Tinggi 21,5 cm, Lebar 10 cm, Panjang tali 25 cm dan Panjang tali tambahan 120 cm  \nTerdapat 2 kantong kecil di dalam, 1 Kantong resleting di dalam dan 1 buah Mini Pouch di dalam  \nUkuran Mini Pouch  \nPanjang 18 cm dan Tinggi 10,5 cm  \nBahan Synthetic Leather', 9),
(15, 'Heravaty Zipper Plain Sling Bag', 189000, '(Depan- Belakang) Warna Maroon, Black, Purple, Grey dan Red   \nTutup Resleting  \nPanjang 30 cm, Tinggi 20 cm, Lebar 8,5 cm, Panjang tali 88 cm  \nBahan Synthetic Leather', 23),
(16, 'Biedysqa Plain Casual Outer', 79000, 'WArna Black, Khaki, dan Navy  \nSatu Ukuran Muat Sampai Size L  \nLingkar Dada 96 cm, Lebar Bahu 34 cm, Lingkar Lengan 56 cm, Panjang 94 cm Lingkar Pinggang 108 cm  \nBahan Katun Rayon  \n2 Kancing depan, Free Belt', 19),
(17, 'Evialina Plain Flare Shirt', 89000, 'Warna Black, Blue, Fuchsia dan Salmon  \nSatu ukuran muat sampai size L  \nLingkar dada 100 cm, Panjang 77-88 cm, Panjang lengan 38 cm, Lingkar pinggang 116 cm,  \nLebar bahu 38 cm, Lingkar lengan 40 cm  \nBahan Katun Rayon  \nKancing depan 7', 22),
(18, 'Shintana Embroideries Elegant Muslim Dress', 149000, 'Warna Black  \nSatu Ukuran Muat Sampai Size S  \nLingkar Dada 80 cm, Lebar Bahu 40 cm, Panjang Lengan 57 cm,  \nLingkar Lengan 38 cm, Panjang 139 cm, Lingkar Pinggang 74 cm  \nBahan Katun Silk kombinasi Sifon Lapis Furing  \nRetsleting Belakang, Pinggang Belakang Karet', 17),
(19, 'Zerqeinha Two Tone Flare Muslim Set', 149000, 'Warna Pink  \nSatu ukuran muat sampai size M  \nDress :  \nLingkar dada 90 cm, Lebar bahu 40 cm, Panjang lengan 55 cm   \nLingkar lengan 36 cm, Panjang 123 cm, Lingkar pinggang 84 cm,  \nLingkar Pinggul 126 cm  \nBahan Jersey  \nBergo :  \nPanjang 88 cm, Lebar 88 cm  \nBahan Jersey', 18),
(20, 'Fritessa Paris Short Pants Couple Set', 119000, 'Warna White  \nSatu ukuran muat sampai Size S  \n\nUkuran Untuk Wanita :  \nPanjang 30 cm, Lingkar Pinggang 74 cm dan Lingkar Pinggul 92 cm  \nPinggang Full karet, Tali pinggang mati dan Terdapat 2 Saku samping  \nBahan Baby Terry  \n\nUkuran Untuk Pria :  \nPanjang 47 cm, Lingkar Pinggang 78 cm dan Lingkar Pinggul 96 cm  \nPinggang Full karet, Tali pinggang mati dan Terdapat 2 Saku samping  \nBahan Baby Terry', 4),
(21, 'Crescencia Stripes Mini Sling Bag', 99000, '(Depan- Belakang) Warna Black (White) , Red (White), Black (Broken White), Red (Broken White), Brown dan Navy   \nTutup Lock  \nPanjang 21 cm, Tinggi 19 cm, Lebar 4,5 cm, Panjang tali 52-73 cm  \nTerdapat 1 ruang  \nBahan Canvas  \nBerat 120 gr', 23),
(22, 'Shafiraski Stripe Longsleeve Blouse', 83000, 'Warna Cream, Orange, Peach, dan Tosca  \nSatu Ukuran Muat Sampai Size M  \nLingkar Dada 86 cm, Lebar Bahu 334 cm, Lingkar Lengan 34 cm, Panjang lengan 55 cm, Panjang 63 cm, Lingkar Pinggang 86 cm  \nBahan Sifon lapis Furing', 2),
(23, 'Laifore Perforated Scallop Blouse', 103000, 'Warna Blue, Cream, Peach, Pink, Yellow, dan White  \nSatu ukuran muat sampai size L Kecil  \nLingkar dada 94 cm, Lebar bahu 39 cm, Panjang lengan 57 cm, Lingkar lengan 36 cm, Panjang 72 cm, Lingkar pinggang 94 cm, Lingkar pinggul 96 cm  \nBahan Wedges Waffle', 2),
(24, 'Mariestya Flowery Sport Swimsuit Set', 169000, 'Warna Tosca  \n\nAtasan:  \nSatu ukuran muat sampai size S  \nLingkar dada 80 cm, Lebar bahu 37 cm, Lingkar lengan 28 cm, Panjang 69 cm, Lingkar pinggang 80 cm, Panjang lengan 54 cm, Lingkar pinggul 72 cm  \nBahan Spande Nylon  \nResleting depan  \n\nBawahan:  \nLingkar pinggang 72 cm, Lingkar pinggul 80 cm, Panjang 82 cm  \nBahan Spandek Nylon  \nPinggang full karet  \n\nHoodie:  \nPanjang 31 cm, lebar 16 cm  \nbahan Spandke Nylon', 21),
(25, 'Zhalibia Envelope Mini Sling Bag', 99000, '(Depan- Belakang) Warna Peach, Cream, Tosca dan Black   \nTutup Lock dan Resleting  \nPanjang 26 cm, Tinggi 18 cm, Lebar 10 cm, Panjang tali 16-111 cm  \nTerdapat 1 ruang utama  \nBahan Taiga', 23),
(26, 'Descrisa Plain Trapeze Hand Bag', 99000, '(Depan- Belakang) Warna Cream, Black, Navy dan Brown   \nTutup Resleting  \nPanjang 35 cm, Tinggi 22 cm, Lebar 10,5 cm, Panjang tali 37 cm dan Panjang tali tambahan 109 cm  \nTerdapat 1 kantong kecil di dalam  \nBahan Synthetic Leather', 9),
(27, 'Georvia Plain Longsleeve Blouse', 85000, 'Warna Dark Grey, Fuchsia, Peach, dan White  \nSatu Ukuran Muat Sampai Size M  \nLingkar Dada 90 cm, Lebar Bahu 37 cm, Panjang Lengan 57 cm,  \nLingkar Lengan 34 cm, Panjang 61 cm, Lingkar Pinggang 80 cm  \nBahan Wedges kombinasi Sifon  \n1 Kancing lengan dan Resleting Belakang', 2),
(28, 'Guerivala Plain Casual Big Long Pants', 159000, 'Warna Light Blue  \n\nSize 31:  \nLingkar pinggang 78 cm, Lingkar pinggul 84 cm, Panjang 100 cm  \nSize 32:  \nLingkar pinggang 80 cm, Lingkar pinggul 86 cm, Panjang 100 cm  \nSize 33:  \nLingkar pinggang 82 cm, Lingkar pinggul 88 cm, Panjang 102 cm  \nSize 34:  \nLingkar pinggang 84 cm, Lingkar pinggul 90 cm, Panjang 102 cm  \nBahan Denim  \n10 kancing depan variasi samping, Resleting samping, 2 Saku belakang', 12),
(29, 'Chamisa Two Tone Sport Pants', 89000, 'Warna Black, Brown, Yellow, dan Cream  \nSatu ukuran muat sampai size M  \nLingkar pinggang 76 cm, Panjang 27 cm, Lingkar pinggul 80 cm  \nBahan Polyster  \nTali Samping Hidup', 20),
(30, 'Gaslyka Ethnic Penguin Blouse', 88000, 'Warna Blue, Fuchsia, Green, Grey dan Tangerine   \nSatu ukuran muat sampai size L kecil  \nLingkar dada 93 cm, Lebar bahu 26 cm, Lingkar lengan 44 cm, Panjang 52-74 cm  \nLingkar pinggul 132 cm, Lingkar pinggang 110 cm   \nBahan Katun  \nResleting belakang', 2),
(31, 'Meyhaca Flowery Cold Shoulder Blouse', 85000, 'Warna Black dan White  \nSatu ukuran muat sampai size L  \nLingkar dada 99 cm, Panjang 62 cm  \nBahan Crepe Kombinasi Lace', 2),
(32, 'Oneida Flowery Bodycon Mini Dress', 104000, 'Warna Black dan Navy  \nSatu ukuran muat sampai size M  \nLingkar dada 81-91 cm, Panjang 94 cm, Lebar bahu 34 cm, Panjang lengan 31 cm,   \nLingkar lengan 42 cm, Lingkar Pinggang 68-78 cm, Lingkar Pinggul 78-88 cm  \nBrukat Katun Stretch Kombinasi Tile  \n1 Kancing belakang, Resleting belakang', 15),
(33, 'Latifah Plain Sabrina Blouse', 83000, 'Warna Black, Dark Blue, Blue, Maroon, Navy, dan Tosca  \nSatu ukuran muat sampai size L Kecil  \nLingkar dada 93 cm, Panjang 63 cm, Lingkar Belakang 37 Cm  \nBahan Crepe  \n6 Kancing Depan', 2),
(34, 'Geysiva Peplum Cold Shoulder Mini Dress', 129000, 'Warna Black, El Blue, Fuchsia, dan Red  \nSatu ukuran muat sampai size S  \nLingkar dada 84 cm, Lebar bahu 34 cm  \nLingkar lengan 24 cm, Panjang 96 cm, Lingkar pinggang 68 cm  \nBahan Wedges Scuba  \nResleting belakang', 15),
(35, 'Afrean Plain Digital Wristwatch', 99000, 'Warna Black  \nLength : 23 cm, Width : 3,5 cm  \nBahan Rubber  \nWeight : 93 gr', 26),
(36, 'Tequivria Flowery Flare Big Mini Dress', 199000, 'Warna Black, Cream, Maroon, Peach dan Salem  \nSatu ukuran muat sampai size XXL  \nLingkar dada 106 cm, Lebar bahu 39 cm, Panjang Lengan 27 cm, Lingkar Lengan 36 cm, Panjang 90 cm, Lingkar Pinggang 98 cm  \nBahan Brukat', 15),
(37, 'Friseina Plain Zipper Hand Bag', 199000, 'Warna Black  \nTutup Resleting  \nPanjang 44 cm, Tinggi 26 cm, Lebar 14 cm, Panjang tali 28 cm dan Panjang tali tambahan 60 cm  \nTerdapat 2 Ruang utama, 2 Kantong kecil di dalam, 1 Kantong resleting di dalam dan 1 Kantong Resleting di belakang (3 Resleting depan hanya hiasan)  \nBahan Synthetic Leather', 9),
(38, 'Lhesca Square Flare Muslim Set', 99000, 'Warna Black  \nAtasan :  \nSatu Ukuran Muat sampai size S  \nLingkar dada 82 cm, Lingkar pinggang 86 cm, Lebar bahu 34 cm, Lingkar lengan 38 cm, Panjang 123 cm  \nBahan Spandek  \n\nCardigan :  \nSatu Ukuran Muat sampai size L  \nLingkar dada 98 cm, Lebar bahu 36 cm, Lingkar pinggang 92 cm, Panjang lengan 53 cm, Lingkar lengan 30 cm, Panjang 56 cm  \nBahan Spandek  \n\nPashmina :  \nPanjang 116 cm, Lebar 45 cm  \nBahan Spandek', 18),
(39, 'Shabyna Plain Flare Maxi Dress', 139000, 'Warna Black, Choco, Cream, Dark Grey dan Light Grey  \nSatu Ukuran Muat Sampai Size L  \nLingkar Dada 98 cm, Lebar Bahu 82 cm, Panjang Lengan 55 cm, Lingkar Lengan 32 cm,  \nPanjang 128 cm, Lingkar Pinggang 82 cm, Lingkar Pinggul 124 cm  \nBahan Katun Cigarel  \n3 Kancing depan dan Pinggang belakang full karet', 13),
(40, 'Risrania Square Tunic Muslim Blouse', 89000, 'Warna Black, Dark Grey, Grey, dan Navy  \nSatu ukuran muat sampai size L  \nLingkar dada 100 cm, Lebar bahu 41 cm, Panjang lengan 52 cm, Lingkar lengan 36 cm  \nLingkar pinggang 98 cm, Lingkar pinggul 110 cm, Panjang 92-112 cm  \nBahan Baby Terry Kombinasi Katun  \n1 Kancing belakang', 16),
(41, 'Quechaza Text Longsleeve Blouse', 89000, 'Warna Black, Dark Grey, Grey, dan Navy  \nSatu ukuran muat sampai size M  \nLingkar dada 88 cm, Lebar bahu 36 cm, Panjang lengan 54 cm, Lingkar lengan 42 cm, Lingkar pinggang 88 cm, Lingkar pinggul 10 cm, Panjang 84 cm  \nBahan Baby Terry  \n2 Kancing belakang', 2),
(42, 'Okreqixe Text Longsleeve Muslim Blouse', 89000, 'Warna Black, Dark Grey, Grey, dan Navy  \nSatu ukuran muat sampai size L  \nLingkar dada 98 cm, Lebar bahu 37 cm, Panjang lengan 55 cm, Lingkar lengan 30 cm,  \nLingkar pinggang 86 cm, Lingkar pinggul 102 cm, Panjang 60 cm  \nBahan Baby Terry', 16),
(43, 'Nevritha Stripe Layer Blouse', 129000, 'Warna Black dan White  \nSatu ukuran muat sampai size L  \nLingkar dada 100 cm, Lebar bahu 59 cm, Panjang lengan 54 cm  \nLingkar lengan 36 cm, Panjang 98 cm, Lingkar pinggang 106 cm, Lingkar pinggul 150 cm  \nBahan Crepe  \n1 kancing belakang', 2),
(44, 'Nauyaria Flowery Overall Muslim Dress', 159000, 'Warna Blue, Navy, Peach dan Yellow  \nSatu ukuran muat sampai size L  \nLingkar dada 100 cm, Lebar bahu 40 cm, Panjang Lengan 57 cm, Lingkar lengan 36 cm, Panjang 129 cm, Lingkar pinggang 112 cm  \nBahan Katun Jepang', 17),
(45, 'Nathlia Plain Slit Blouse', 129000, '(Kiri- Kanan) Warna Mocca, Grey, Navy dan Cream  \nSatu ukuran muat sampai size L kecil  \nLingkar dada 92 cm, Lebar bahu 36 cm, Panjang lengan 17 cm, Lingkar lengan 40 cm, Panjang 120 cm, Lingkar pinggang 110 cm  \nBahan Katun', 2),
(46, 'Marjami Two Tone V-neck Blouse', 99000, 'Warna Black, Peach, Khaki dan Violet  \nSatu Ukuran Muat sampai size XXL  \nLingkar dada 106 cm, Lebar bahu 39 cm, Panjang lengan 46 cm,  \nLingkar lengan 38 cm, Panjang 70 cm, Lingkar pinggang 108 cm,  \nLingkar Pinggul 112 cm  \nBahan Crepe  \n1 Kancing Belakang', 2),
(47, 'Juviltha Plain High Neck Blouse', 99000, 'Warna Black, Brick , Mustard, dan Navy   \nSatu ukuran muat sampai size M  \nLingkar dada 90 cm, Lebar bahu 36 cm, Panjang lengan 40 cm  \nLingkar lengan 44 cm, Panjang 56 cm, Lingkar pinggang 92 cm, Lingkar pinggul 98 cm  \nBahan Twistcone  \n1 kancing belakang', 2),
(48, 'Hanvera Stripes Casual Blouse', 99000, 'Warna Black dan Navy  \nSatu ukuran muat sampai size L kecil  \nLingkar dada 94 cm, Lebar bahu 33 cm Lingkar lengan 40 cm, Panjang 52 cm, Lingkar pinggang 102 cm, Lingkar pinggul 106 cm   \nBahan Twistcone  \n1 kancing belakang', 2),
(49, 'Gezchia Square V-neck Blouse', 109000, '(Belakang- Depan) Warna Green, Navy, Peach dan Red  \nSatu ukuran muat sampai size XL  \nLingkar dada 104 cm, Lebar bahu 39 cm, Panjang Lengan 54 cm, Lingkar lengan 36 cm, Panjang 112 cm, Lingkar pinggang 120 cm, Lingkar pinggul 128 cm   \nBahan Crepe  \n4 kancing depan variasi', 2),
(50, 'Flexikia Stripes Tunic Dress', 129000, 'Warna Black, Cream, Maroon, dan Yellow  \nSatu Ukuran Muat sampai size XXL  \nLingkar dada 104 cm, Lebar bahu 37 cm, Panjang Lengan 55 cm, Lingkar lengan 36 cm, Panjang 110 cm, Lingkar pinggang 100 cm, Lingkar Pinggul 114 cm  \nBahan Crepe  \n1 Kancing Belakang, 1 Kancing Ujung Lengan, 1 Kancing Siku', 7),
(51, 'Faetrila Stripe Longsleeve Muslim Blouse', 89000, 'Warna Black, Dark Grey, Grey, dan Navy  \nSatu ukuran muat sampai size L  \nLingkar dada 92 cm, Lebar bahu 36 cm, Panjang lengan 56 cm, Lingkar lengan 30 cm,  \nLingkar pinggang 88 cm, Lingkar pinggul 90 cm, Panjang 84 cm  \nBahan Baby Terry', 16),
(52, 'Derlimina Flowery Casual Muslim Set', 159000, 'Warna Black, Navy, Peach, dan White  \nSatu Ukuran Muat Sampai Size L  \nDress:  \nLingkar dada 96 cm, Lebar bahu 38 cm, Lingkar lengan 48 cm, Panjang 129 cm, Lingkar pinggang 100 cm  \nBahan Katun Silk  \n\nInner:  \nLingkar dada 100 cm, Lebar bahu 34 cm, Panjang lengan 51 cm, Lingkar lengan 36 cm, Panjang 53 cm  \nBahan Katun Silk  \nResleting belakang', 18),
(53, 'Denthania Plain Flare Maxi Dress', 129000, 'Warna Brown, Choco, Dark Brown, Grey dan Navy  \nSatu ukuran muat sampai size S  \nLingkar dada 82 cm, Lebar bahu 29 cm, Panjang Lengan 53 cm, Lingkar lengan 32 cm, Panjang 124 cm, Lingkar pinggang 80 cm  \nBahan Katun Stretch  \nResleting depan', 13),
(54, 'Cefshila Abstract Cold Shoulder Midi Dress', 129000, 'Warna Grey dan Maroon  \nSatu ukuran muat sampai size M  \nLingkar dada 90 cm, Lebar bahu 31 cm, Panjang Lengan 32 cm, Lingkar lengan 24 cm, Panjang 104 cm, Lingkar pinggang 68 cm  \nBahan Spandek Rajut', 14),
(55, 'Careslina Plain Comfy Cardigan', 109000, 'Warna Maroon, Mint, Pink dan White  \nSatu Ukuran Muat Sampai Size XXXL  \nLingkar Dada 114 cm, Lebar Bahu 40 cm, Panjang Lengan 50 cm, Lingkar Lengan 38 cm, Panjang 76 cm, Lingkar Pinggang 112 cm, Lingkar Pinggul 114 cm  \nBahan Koshibo  \n2 Kancing Ujung Lengan, Tali Pinggang', 3),
(56, 'Ashvira Plain Sleeveless Jumpsuit', 159000, 'Warna Blue, Green, Grey dan Pink  \nSatu Ukuran Muat Sampai Size M  \nLingkar Dada 90 cm, Lebar Bahu 33 cm, Lingkar Lengan 48 cm,  \nPanjang 133 cm, Lingkar Pinggang 74 cm, Lingkar Pinggul 98 cm  \nBahan Wedges Emboss  \n1 Resleting belakang dan 2 Saku samping', 11),
(57, 'Ancirtana Misty Tied Cardigan', 119000, 'Warna Black, Dark Grey, Grey dan Milo  \nSatu Ukuran Muat Sampai Size XL  \nLingkar dada 102 cm, Lebar bahu 46 cm, Panjang lengan 28 cm, Lingkar lengan 54 cm, Panjang 97 cm, Lingkar pinggang 98 cm  \nBahan Baby Terry  \nPinggang belakang karet', 3),
(58, 'Sherlitya Square Overall Wearpack', 159000, 'Warna Blue, Grey, Green, dan Red  \nSatu ukuran muat sampai size S  \nInner:  \nLingkar dada 80 cm, Lebar bahu 32 cm, Panjang lengan 52 cm  \nLingkar lengan 30 cm, Panjang 52 cm, Lingkar pinggang 80 cm, Lingkar pinggul 88 cm  \nBahan Kaos  \nWearpack:  \nLingkar dada 80 cm, Lebar bahu 42 cm  \nLingkar lengan 52 cm, Panjang 130 cm, Lingkar pinggang 124 cm, Lingkar pinggul 130 cm  \nBahan Flanel  \nResleting belakang', 25),
(59, 'Elujyte Text Longsleeve Blouse', 89000, 'Warna Black, Dark Grey, Navy, dan Red  \nSatu ukuran muat sampai size M  \nLingkar dada 90 cm, Lebar bahu 36 cm, Panjang lengan 54 cm, Lingkar lengan 38 cm, Panjang 78 cm, Lingkar pinggang 84 cm, Lingkar pinggul 90 cm  \nBahan Baby Terry', 2),
(60, 'Sintiamila Peasley Flare Muslim Dress', 159000, 'Warna Black, Cream, Navy dan White   \nSatu Ukuran Muat Sampai Size M  \nDress:  \nLingkar dada 86 cm, Lebar bahu 34 cm, Lingkar lengan 56 cm, Panjang 127 cm, Lingkar pinggang 100 cm  \n\nInner:  \nLingkar dada 184 cm, Lebar bahu 52 cm, Panjang lengan 52 cm, Lingkar lengan 32 cm, Panjang 48 cm, Lingkar pinggang 180 cm   \nBahan Katun Silk Kombinasi Spandek  \nResleting belakang', 17),
(61, 'Batilia Plain Assymetric Blouse', 99000, 'Warna Green, Grey, Milo, Pink, Salem, dan White   \nSatu ukuran muat sampai size M  \nLingkar dada 88 cm, Lebar bahu 35 cm, Panjang lengan 15 cm, Lingkar lengan 34 cm, Panjang 57 cm, Lingkar pinggang 90 cm, Lingkar pinggul 102 cm  \nBahan Katun Rayon  \n1 Kancing belakang', 2),
(62, 'Tivrania Two Tone Casual Shirt', 109000, 'Warna Baby Blue, Black, Grey, dan Peach  \nSatu ukuran muat sampai size XXL  \nLingkar dada 106 cm, Lebar bahu 42 cm, Panjang lengan 55 cm  \nLingkar lengan 36 cm, Panjang 74 cm, Lingkar pinggang 106 cm, Lingkar pinggul 110 cm  \nBahan Peach Sofie  \n7 kancing depan, 2 kancing ujung lengan', 22),
(63, 'Leanira Plain Hoodie Jacket', 179000, 'Warna Baby, Pink, Lime, White dan Black   \n\nSize L:  \nLingkar dada 96 cm, Lebar bahu 39 cm, Panjang lengan 58 cm, Lingkar lengan 34 cm, Panjang 64 cm, Lingkar pinggang 90 cm, Lingkar pinggul 96 cm  \n\nSize XL:  \nLingkar dada 102 cm, Lebar bahu 40 cm, Panjang lengan 58 cm, Lingkar lengan 34 cm, Panjang 65 cm, Lingkar pinggang 94 cm, Lingkar pinggul 104 cm  \n\nSize XXL:  \nLingkar dada 104 cm, Lebar bahu 42 cm, Panjang lengan 60 cm, Lingkar lengan 36 cm, Panjang 67 cm, Lingkar pinggang 96 cm, Lingkar pinggul 108 cm  \n\nSize XXXL:  \nLingkar dada 106 cm, Lebar bahu 44 cm, Panjang lengan 63 cm, Lingkar lengan 38 cm, Panjang 90 cm, Lingkar pinggang 98 cm, Lingkar pinggul 110 cm  \n\nBahan Parasut lapis Wool  \nResleting depan, 2 Resleting saku, 2 Saku depan', 10),
(64, 'Traniya Square Overall Dress Set', 159000, 'Warna Blue, Green, Grey dan Red  \nSatu Ukuran Muat Sampai Size S  \n\nDress :  \nLingkar Dada 82 cm, Lebar Bahu 40 cm, Lingkar Lengan 43 cm, Panjang 134 cm, Lingkar Pinggang 98 cm  \nBahan Flanel  \nRetsleting samping  \n\nInner :  \nLingkar Dada 84 cm, Lebar Bahu 32 cm, Lingkar Lengan 30 cm, Panjang 52 cm, Lingkar Pinggang 84 cm, Panjang lengan 54 cm, Lingkar pinggul 84 cm  \nBahan Kaos', 8),
(65, 'Tsaly Plain Longsleeve Muslim Set', 149000, 'Warna White (Tangerine)  \nSatu ukuran muat sampai size M  \n\nDress:  \nLingkar dada 88 cm, Lebar bahu 36 cm, Panjang lengan 55 cm  \nLingkar lengan 34 cm, Panjang 135 cm, Lingkar pinggang 100 cm, Lingkar pinggul 128 cm  \nBahan Wedges Emboss  \nResleting depan dan Terdapat belt  \n\nPashmina:  \nPanjang 184 cm, Lebar 62 cm  \nBahan Spandek', 18),
(66, 'Udesoju Text Longsleeve Blouse', 89000, 'Warna Grey, Grey (Black), White (Grey), dan White (Pink)  \nSatu Ukuran Muat sampai size M  \nLingkar dada 90 cm, Lebar bahu 37 cm, Lingkar lengan 30 cm, Panjang 60 cm, Lingkar pinggang 80 cm, Panjang lengan 52 cm  \nBahan Baby Terry', 2),
(67, 'Lomytah Stripes Flare Blouse', 119000, 'Warna Black, Grey, Mocca, Navy, Orange, dan Tosca  \nSatu Ukuran Muat sampai size L Kecil  \nLingkar dada 92 cm, Lebar bahu 40 cm, Panjang lengan 55 cm,  \nLingkar lengan 36 cm, Panjang 95 cm, Lingkar pinggang 76 cm,  \nLingkar Pinggul 82 cm  \nBahan Crepe  \n3 Kancing Depan, Karet Pinggang Belakang, Tali Pinggang Mati', 2),
(68, 'Usyelqa Text Longsleeve Blouse', 89000, 'Warna Black, Grey, dan Pink  \nSatu ukuran muat sampai size L  \nLingkar dada 94 cm, Lebar bahu 37 cm, Panjang lengan 54 cm, Lingkar lengan 30 cm,  \nLingkar pinggang 90 cm, Lingkar pinggul 96 cm, Panjang 64 cm  \nBahan Baby Terry', 2),
(69, 'Vayarana Plain Oversize Blouse', 109000, 'Warna Black, Baby Blue, Pink dan White  \nSatu ukuran muat sampai size XXL  \nLingkar dada 108 cm, Lebar bahu 39 cm, Panjang Lengan 45 cm, Lingkar lengan 36 cm, Panjang 67 cm, Lingkar pinggang 114 cm, Lingkar pinggul 114 cm  \nBahan Crepe  \n1 kancing belakang', 2),
(70, 'Weinada Glitter Longsleeve Big Blouse', 169000, 'Warna Grey, Magenta, Navy, dan Peach  \nSatu ukuran muat sampai size L  \nLingkar dada 98 cm, Lebar bahu 32 cm, Lingkar lengan 32 cm, Panjang 62 cm, Lingkar pinggang 104 cm, Panjang lengan 50 cm  \nBahan Knit', 2),
(71, 'Deopiqe Tartan Overall Wearpack', 129000, 'Warna Black, Brown, Purple, dan Red  \nSatu ukuran muat sampai size M  \nLingkar pinggang 86 cm, Lebar dada 27 cm, Panjang 129 cm  \nBahan Katun  \nPinggang belakang karet, 3 kancing depan, 1 Saku depan, 2 Saku samping', 25),
(72, 'Renidias Flowery Sleeveless Maxi Dress', 109000, 'Warna Black, Navy, Peach, dan Red  \nSatu Ukuran Muat Sampai Size S  \nLingkar Dada 78 cm, Lebar Bahu 34 cm, Lingkar Lengan 42 cm, Panjang 79 cm, Lingkar Pinggang 78 cm  \nBahan Brukat  \nResleting Belakang', 15),
(73, 'Gabyune Tartan Tunic Shirt', 109000, 'Warna Blue dan Brick  \nSatu ukuran muat sampai size L  \nLingkar dada 96 cm, Lebar bahu 37 cm, Panjang lengan 56 cm, Lingkar lengan 34 cm, Panjang 98 cm, Lingkar pinggang 96 cm  \nBahan Cotton  \n6 Kancing depan, 2 Saku depan', 22),
(74, 'Nereide Polkadot Casual Big Blazer', 189000, 'Warna Black Motif 1 dan Black Motif 2  \n\nSize XXL:  \nLingkar dada 126 cm, Lebar bahu 44 cm, Panjang lengan 39 cm, Lingkar lengan 38 cm, Panjang 64 cm, Lingakr pinggang 126 cm, Lingkar pinggul 134 cm  \n\nSize XXXL:  \nLingkar dada 129 cm, Lebar bahu 47 cm, Panjang lengan 42 cm, Lingkar lengan 40 cm, Panjang 67 cm, Lingakr pinggang 128 cm, Lingkar pinggul 137 cm  \n\nSize XXXXL:  \nLingkar dada 132 cm, Lebar bahu 50 cm, Panjang lengan 45 cm, Lingkar lengan 44 cm, Panjang 70 cm, Lingakr pinggang 132 cm, Lingkar pinggul 140 cm  \n\nBahan Katun Twill  \n2 Kancing depan, 2 Saku depan', 1),
(75, 'Wizzy Plain Pussybow Blouse', 99000, 'Warna White  \nSatu ukuran muat sampai size L  \nLingkar dada 98 cm, Lebar bahu 37 cm, Lingkar lengan 40 cm,  \nPanjang 59 cm, Lingkar pinggang 102 cm  \nPanjang lengan 55 cm  \nBahan Katun Zara', 2),
(76, 'Charlinnta Plain Flare Maxi Dress', 139000, 'Warna Dark Blue  \nSatu Ukuran Muat Sampai Size M  \nLingkar dada 90 cm, Lebar bahu 39 cm, Panjang lengan 53 cm, Lingkar lengan 44 cm, Panjang 127 cm, Lingkar pinggul 80 cm  \nBahan Denim Stretch  \n5 Kancing depan, 2 Saku depan, 2 Kancing saku, 2 Kancing ujung lengan, Pinggang belakang karet', 13),
(77, 'Jhevline Army Longsleeve Big Blouse', 139000, 'Warna Black, Brown, dan Green  \nSatu Ukuran Muat sampai size XXXL  \nLingkar dada 112 cm, Lebar bahu 40 cm, Panjang lengan 55 cm, Lingkar lengan 32 cm, Panjang 85 cm, Lingkar pinggang 122 cm, Lingkar pinggul 136 cm  \nBahan Rayon', 2),
(78, 'Jhaxza Square Casual Mini Dress', 109000, 'Warna Black, Navy, dan White  \nSatu Ukuran Muat sampai size M  \nLingkar dada 88 cm, Lebar bahu 35 cm, Panjang lengan 20 cm, Lingkar lengan 48 cm, Panjang 83 cm, Lingkar pinggul 92 cm  \nBahan Polyster  \nResleting belakang', 15),
(79, 'Aselly Plain Peplum Mini Dress', 139000, 'Warna Black, Blue dan Red  \nSatu Ukuran Muat sampai size S  \nLingkar dada 76 cm, Lebar bahu 80 cm, Lingkar lengan 28 cm, Panjang 82 cm, Lingkar pinggang 66 cm  \nBahan Wedges Scuba', 15),
(80, 'Auztya Square Sleeveless Blouse', 89000, 'Warna Cream (Black) dan Cream (Red)  \nSatu ukuran muat sampai size L kecil  \nLingkar dada 92 cm, Lebar bahu 32 cm, Lingkar lengan 42 cm, Panjang 60 cm dan Lingkar pinggang 88 cm, Lingkar pinggul 92 cm   \nBahan Katun kombinasi Princess  \nResleting belakang', 2),
(81, 'Rizanifa Stripe Overall Muslim Dress', 159000, 'Warna Black, Navy, Purple, dan Red  \nSatu Ukuran Muat Sampai Size S  \n\nInner :  \nLingkar dada 84 cm, Lebar bahu 34 cm, Panjang lengan 54 cm, Lingkar lengan 32 cm, Panjang 50 cm, Lingkar pinggang 84 cm  \n\nOuter :  \nLingkar dada 82 cm, Lebar bahu 43 cm, Lingkar lengan 52 cm, Panjang 13` cm, Lingkar pinggang 78 cm, Lingkar Pinggul 110 cm  \nResleting belakang  \n\nBahan Katun', 17),
(82, 'Bangkityami Plain Bodycon Mini Dress', 139000, 'Warna Black, Blue, Fuchsia, dan Red  \nSatu Ukuran Muat Sampai Size S  \nLingkar dada 82 cm, Lebar bahu 31 cm, Panjang lengan 42 cm, Lingkar lengan 34 cm, Panjang 82 cm,  \nLingkar pinggang 70 cm  \nBahan Wedges Scuba  \nResleting belakang', 15),
(83, 'Zharavinsa Two Tone Longsleeve Blouse', 89000, '(Kanan- Kiri) Warna Black, Maroon, Navy, dan White  \nSatu ukuran muat sampai size M  \nLingkar dada 86 cm, Lebar bahu 36 cm, Panajng lengan 55 cm, Lingkar lengan 32 cm, Panjang 62 cm, Lingkar pinggang 86 cm  \nBahan Spandek', 2),
(84, 'Cedasa Plain Longsleeve Blazer', 119000, 'Warna Black dan Navy  \nSatu Ukuran Muat sampai size L  \nLingkar dada 100 cm, Lebar bahu 38 cm, Panjang lengan 55 cm, Lingkar lengan 40 cm, Panjang 94 cm, Lingkar pinggang 92 cm, Lingkar pinggul 100 cm  \nBahan Denim  \n3 Kancing depan', 1),
(85, 'Berxira Two Tone Casual Big Blouse', 119000, 'Warna Blue, Grey, Lime, Maroon, Mint, dan Nude Pink  \nSatu Ukuran Muat Sampai Size XXXL  \nLingkar dada 116 cm, Lebar bahu 40 cm, Panjang lengan 55 cm, Lingkar lengan 40 cm, Panjang 76 cm, Lingkar pinggang 116 cm, Lingkar pinggul 130 cm  \nBahan Madelaine', 2),
(86, 'Adriennele Square Sleeveless Mini Dress', 109000, 'Warna Black, Navy dan White  \nSatu ukuran muat sampai size M  \nLingkar Dada 90 cm, Lebar Bahu 34 cm, Lingkar Lengan 40 cm,  \nPanjang 81 cm, Lingkar Pinggang 84 cm  \nBahan Polyster  \n1 Resleting Belakang', 15),
(87, 'Chesari Pearl Longsleeve Muslim Dress', 159000, 'Warna Black, Grey, dan Navy  \nSatu ukuran muat sampai size L kecil  \n\nInner :  \nLingkar dada 94 cm, Lebar bahu 40 cm, Panjang lengan 57 cm,  \nLingkar lengan 34 cm, Panjang 65 cm Lingkar pinggang 94 cm  \nBahan katun kombinasi baby terry  \n6 Kancing depan, 2 Kancing ujung lengan  \n\nOuter:  \nLingkar dada 98 cm, Lebar bahu 30 cm, Lingkar lengan 52 cm, Panjang 130 cm Lingkar pinggang 100 cm  \nBahan katun kombinasi baby terry', 17),
(88, 'Charlote Flowery Sleeveless Mini Dress', 109000, 'Warna Black, Navy, Pink, Red dan White   \nSatu ukuran muat sampai size S  \nLingkar Dada 72 cm, Lebar Bahu 18 cm, Lingkar Lengan 42 cm, Panjang 87 cm, Lingkar Pinggang 84 cm, Lingkar Pinggul 74 cm  \nBahan Brukat kombinasi Twistcone  \n1 Resleting Belakang', 15),
(89, 'Pershell Two Tone Longsleeve Blouse', 109000, 'Warna Grey, Peach dan White   \nSatu Ukuran Muat sampai size L  \nLingkar dada 96 cm, Lebar bahu 37 cm, Panjang lengan 50 cm,  \nLingkar lengan 32 cm, Panjang 70 cm, Lingkar pinggang 100 cm,  \nLingkar Pinggul 102 cm  \nBahan Twistcone  \n1 Kancing Belakang, 1 Kancing Ujung Lengan, Tali Pinggang Samping', 2),
(90, 'Macadreava Plain V-neck Blouse', 99000, 'Warna Blue, Mustard, Navy, dan Salmon   \nSatu ukuran muat sampai size L kecil  \nLingkar dada 92 cm, Lebar bahu 36 cm, Panjang lengan 40 cm  \nLingkar lengan 33 cm, Panjang 61 cm, Lingkar pinggang 94 cm, Lingkar pinggul 100 cm  \nBahan Katun  \n2 kancing ujung lengan', 2),
(91, 'Kaviara Tartan Overall Wearpack', 159000, 'Warna Black, Pink, dan Purple  \nSatu ukuran muat sampai size L kecil  \nInner:  \nLingkar dada 94 cm, Lebar bahu 37 cm, Panjang lengan 54 cm  \nLingkar lengan 34 cm, Panjang 53 cm, Lingkar pinggang 94 cm, Lingkar pinggul 96 cm  \nBahan Crepe  \n1 kancing belakang  \nWearpack:  \nLingkar dada 82 cm, Lebar bahu 84 cm  \nLingkar lengan 66 cm, Panjang 133 cm, Lingkar pinggang 106 cm, Lingkar pinggul 138 cm  \nBahan Balotely  \nResleting belakang', 25),
(92, 'Civila Tartan Casual Set', 89000, 'Warna Maroon dan Teal   \nSatu ukuran muat sampai size S  \nBlazer:  \nLingkar dada 82 cm, Panjang 63 cm, Lebar bahu 35 cm, Lingkar lengan 32 cm, Panjang lengan 52 cm, Lingkar pinggang 80 cm  \nBahan Katun Stretch  \n\nInner:  \nLingkar dada 82, Panjang 49 cm, Lebar bahu 25 cm, Lingkar lengan 48 cm, Lingkar pinggang 82 cm  \nBahan Katun Stretch', 21),
(93, 'Kasmitxe Monochrome Flare Muslim Blouse', 89000, 'Warna Grey, Maroon, Navy, dan White  \nSatu ukuran muat sampai size M  \nLingkar dada 90 cm, Lebar bahu 36 cm, Lingkar lengan 32 cm,  \nPanjang 90 cm, Lingkar pinggang 92 cm, Panjang lengan 50 cm  \nBahan Katun Rayon Kombinasi Wedges Waffle  \nResleting depan', 16),
(94, 'Darazira Flowery Layer Big Blouse', 109000, 'Warna Broken White  \nSatu Ukuran Muat Sampai Size L  \nLingkar dada 96 cm, Lebar bahu 40 cm, Panjang lengan 48 cm, Lingkar lengan 40 cm, Panjang 69 cm, Lingkar pinggang 84 cm, Lingkar pinggul 112 cm  \nBahan Katun', 2),
(95, 'Giordyna Plain Layer Blouse', 89000, 'Warna Brown, Dark Grey, Navy, Pink, Purple dan Tosca   \nSatu Ukuran Muat Sampai Size L  \nLingkar Dada 100 cm, Lebar Bahu 41 cm, Panjang Lengan 23 cm, Lingkar Lengan 50 cm  \nPanjang 80 cm, Lingkar Pinggang 110 cm, Lingkar Pinggul 116 cm  \nBahan Katun Rayon  \nTerdapat 4 kancing depan hidup', 2),
(96, 'Davhanzi Ethnic Assymetric Big Blouse', 109000, 'Warna Blue, Green, Grey, Fuchsia, Mocca dan Yellow  \nSatu Ukuran Muat Sampai Size XL  \nLingkar dada 102 cm, Lebar bahu 37 cm, Panjang lengan 47 cm, Lingkar lengan 40 cm, Panjang 72 cm, Lingkar pinggang 118 cm  \nBahan Katun  \n1 Kancing belakang', 2),
(97, 'Elizzania Two Tone Longsleeve Muslim Blouse', 109000, 'Warna Black, Navy, dan White  \nSatu ukuran muat sampai size L  \nLingkar dada 96 cm, Lebar bahu 36 cm, Panjang lengan 48 cm, Lingkar lengan 46 cm, Lingkar pinggang 90 cm, Panjang 69 cm, Lingkar pinggul 104 cm  \nBahan Crepe  \n1 Kancing Depan Hidup', 16),
(98, 'Dondyen Plain Casual Big Shirt', 89000, 'Warna Green, Grey, Navy, Pink, Salmon, dan Tosca  \nSatu Ukuran Muat Sampai Size XL  \nLingkar dada 102 cm, Lebar bahu 36 cm, Panjang lengan 42 cm, Lingkar lengan 42 cm, Panjang 75 cm, Lingkar pinggang 116 cm, Lingkar pinggul 134 cm  \nBahan Katun  \n6 Kancing depan', 22),
(99, 'Derviona Plain Comfy Shirt', 99000, 'Warna Baby Pink, Black, Cream dan Grey   \nSatu ukuran muat sampai size XL  \nLingkar dada 104 cm, Lebar bahu 41 cm, Panjang lengan 22 cm  \nLingkar lengan 34 cm, Panjang 62 cm, Lingkar pinggang 108 cm, Lingkar pinggul 110 cm  \nBahan Satin  \n4 kancing depan', 22),
(100, 'Dreasna Square V-neck Big Blouse', 119000, 'Warna Black dan White  \nSatu Ukuran Muat Sampai Size XXL  \nLingkar dada 120 cm, Lebar bahu 46 cm, Panjang lengan 57 cm, Lingkar lengan 54 cm, Panjang 90 cm, Lingkar pinggang 124 cm  \nBahan Crepe kombinasi Katun', 2),
(101, '', 0, '', 1),
(102, '', 0, '', 1),
(103, '', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nu_session`
--

CREATE TABLE `nu_session` (
  `id_session` int(11) NOT NULL,
  `session_key` varchar(255) NOT NULL,
  `session_value` text NOT NULL,
  `session_start` int(11) NOT NULL,
  `session_expired` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nu_size`
--

CREATE TABLE `nu_size` (
  `id_size` int(11) NOT NULL,
  `size_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nu_size`
--

INSERT INTO `nu_size` (`id_size`, `size_name`) VALUES
(1, 'No Size'),
(2, 'XXXL'),
(3, 'S'),
(4, 'M'),
(5, 'L'),
(6, 'XL'),
(7, '31'),
(8, '32'),
(9, '33'),
(10, '34'),
(11, 'XXL'),
(12, 'XXXXL');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nu_category`
--
ALTER TABLE `nu_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `nu_client`
--
ALTER TABLE `nu_client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `nu_color`
--
ALTER TABLE `nu_color`
  ADD PRIMARY KEY (`id_color`);

--
-- Indexes for table `nu_item`
--
ALTER TABLE `nu_item`
  ADD PRIMARY KEY (`id_item`);

--
-- Indexes for table `nu_product`
--
ALTER TABLE `nu_product`
  ADD PRIMARY KEY (`id_product`);

--
-- Indexes for table `nu_session`
--
ALTER TABLE `nu_session`
  ADD PRIMARY KEY (`id_session`);

--
-- Indexes for table `nu_size`
--
ALTER TABLE `nu_size`
  ADD PRIMARY KEY (`id_size`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nu_category`
--
ALTER TABLE `nu_category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `nu_client`
--
ALTER TABLE `nu_client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `nu_color`
--
ALTER TABLE `nu_color`
  MODIFY `id_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `nu_item`
--
ALTER TABLE `nu_item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=367;
--
-- AUTO_INCREMENT for table `nu_product`
--
ALTER TABLE `nu_product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `nu_session`
--
ALTER TABLE `nu_session`
  MODIFY `id_session` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nu_size`
--
ALTER TABLE `nu_size`
  MODIFY `id_size` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
