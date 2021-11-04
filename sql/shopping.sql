-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3308
-- Thời gian đã tạo: Th10 02, 2021 lúc 01:56 PM
-- Phiên bản máy phục vụ: 5.7.31
-- Phiên bản PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopping`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `accounts`
--

INSERT INTO `accounts` (`id`, `user_name`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'thang1234', '$2y$10$hGJMUooQA9DxyKrQxSYyA.8Gvj5X0Iikf/CW68UKLkZlyj.OvTUoS', 'customer', NULL, NULL, '2021-11-01 07:27:37'),
(2, 'manager1', '$2y$10$wTLIc9H2fmYcfz8mccHsHOWHRaQUHZULQhBRBshFZ0HXDZ2jFNWW6', 'admin', NULL, NULL, '2021-11-01 22:19:27'),
(3, 'admin1', '$2y$10$wupFzqBkcoctPlIQsrB9ueGztZgd0Kyvf2zAFCyxQLxFitaJ1AiBK', 'admin', NULL, NULL, NULL),
(4, 'thang1609', '$2y$10$wTLIc9H2fmYcfz8mccHsHOWHRaQUHZULQhBRBshFZ0HXDZ2jFNWW6', 'customer', NULL, '2021-10-29 08:21:11', '2021-10-29 08:21:11'),
(5, 'thangoi', '$2y$10$hGJMUooQA9DxyKrQxSYyA.8Gvj5X0Iikf/CW68UKLkZlyj.OvTUoS', 'customer', NULL, '2021-11-01 08:43:37', '2021-11-01 22:17:57'),
(6, 'thangoi1609', '$2y$10$9Y097rwzF4DbsWmc2kNF/.TxBELqwHXlQJlnOULXQVEN44G4meRUW', 'admin', NULL, '2021-11-01 18:57:28', '2021-11-01 18:57:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `person_id` int(10) UNSIGNED NOT NULL,
  `role_admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admins_person_id_foreign` (`person_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `person_id`, `role_admin`, `created_at`, `updated_at`) VALUES
(1, 2, 'manager', NULL, NULL),
(2, 3, 'editer', NULL, NULL),
(3, 6, 'editer', '2021-11-01 18:57:28', '2021-11-01 18:57:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `person_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_person_id_foreign` (`person_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `person_id`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'vip', NULL, '2021-11-02 06:12:13'),
(2, 4, 'vip', '2021-10-29 08:21:11', '2021-11-02 06:12:23'),
(3, 5, 'normal', '2021-11-01 08:43:37', '2021-11-01 08:43:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufactures`
--

DROP TABLE IF EXISTS `manufactures`;
CREATE TABLE IF NOT EXISTS `manufactures` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `manu_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `manufactures`
--

INSERT INTO `manufactures` (`id`, `manu_name`, `created_at`, `updated_at`) VALUES
(1, 'Supreme', NULL, '2021-11-01 20:50:05'),
(2, 'Adidas', NULL, NULL),
(3, 'Nike', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(51, '2014_10_12_100000_create_password_resets_table', 1),
(52, '2021_07_19_030041_create_slides_table', 1),
(53, '2021_07_20_022324_create_types_table', 1),
(54, '2021_07_20_022514_create_protypes_table', 1),
(55, '2021_07_20_022542_create_products_table', 1),
(56, '2021_07_23_131241_create_manufactures_table', 1),
(57, '2021_07_27_130928_create_sizes_table', 1),
(58, '2021_07_27_131250_create_products_sizes_table', 1),
(59, '2021_09_15_071822_create_accounts_table', 1),
(60, '2021_09_15_071903_create_persons_table', 1),
(61, '2021_09_15_071926_create_customers_table', 1),
(62, '2021_10_21_113345_create_admins_table', 1),
(63, '2021_10_28_114354_create_orders_table', 1),
(64, '2021_10_28_114444_create_order_items_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `grand_price` int(11) NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_customer_id_foreign` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `total_quantity`, `grand_price`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 2730000, 'Giao nhanh hộ bố', 'cancel', '2021-10-28 06:28:28', '2021-10-30 18:37:45'),
(2, 1, 14, 15000000, 'giao nhanh nha', 'cancel', '2021-10-28 06:30:40', '2021-11-01 05:04:36'),
(3, 2, 1, 300000, 'okok', 'received', '2021-10-29 08:40:45', '2021-11-02 06:33:55'),
(5, 1, 1, 320000, '', 'received', '2021-11-02 06:29:22', '2021-11-02 06:30:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price_sell` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `sub_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `price_sell`, `size`, `quantity`, `sub_price`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 400000, 'M', 3, 1200000, '2021-10-28 06:28:28', '2021-10-28 06:28:28'),
(2, 1, 3, 510000, 'XL', 3, 1530000, '2021-10-28 06:28:28', '2021-10-28 06:28:28'),
(3, 2, 1, 300000, 'S', 1, 300000, '2021-10-28 06:30:40', '2021-10-28 06:30:40'),
(4, 2, 1, 300000, 'M', 3, 900000, '2021-10-28 06:30:40', '2021-10-28 06:30:40'),
(5, 2, 1, 300000, 'L', 1, 300000, '2021-10-28 06:30:40', '2021-10-28 06:30:40'),
(6, 2, 4, 1500000, 'S', 6, 9000000, '2021-10-28 06:30:41', '2021-10-28 06:30:41'),
(7, 2, 4, 1500000, 'M', 3, 4500000, '2021-10-28 06:30:41', '2021-10-28 06:30:41'),
(8, 3, 1, 300000, 'XXL', 1, 300000, '2021-10-29 08:40:45', '2021-10-29 08:40:45'),
(11, 5, 1, 300000, 'S', 1, 300000, '2021-11-02 06:29:22', '2021-11-02 06:29:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `persons`
--

DROP TABLE IF EXISTS `persons`;
CREATE TABLE IF NOT EXISTS `persons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persons_account_id_foreign` (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `persons`
--

INSERT INTO `persons` (`id`, `account_id`, `full_name`, `gender`, `address`, `date_of_birth`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nguyễn Hữu Thắng', 'Male', 'K3, Tân Hiệp, Kiên Giang', '2001-09-16', '0844370255', 'nguyenhuuthang12c8@gmail.com', NULL, '2021-10-29 05:36:32'),
(2, 2, 'Thắng Nguyễn', 'Male', 'Thủ Đức', '2005-01-01', '0844370111', 'nguyenhuuthang1609@gmail.com', NULL, '2021-11-01 22:03:51'),
(3, 3, 'Phan Ngọc Luân', 'Male', 'Vũng Tàu', '2009-01-01', '0123456789', 'nguyenhuuthang12c4@gmail.com', NULL, NULL),
(4, 4, 'thang huu nguyen', 'Male', 'ha noi', '2001-02-16', '0844324123', 'hack@gmail.com', '2021-10-29 08:21:11', '2021-10-29 08:41:50'),
(5, 5, 'Nguyễn Hữu Thắng', 'Male', 'Kiên Giang', '2001-12-24', '0844370698', 'nguyenhuuthangfuture@gmail.com', '2021-11-01 08:43:37', '2021-11-01 22:20:04'),
(6, 6, 'Nguyễn Hữu Thắng', 'Male', 'ha noi', '2015-12-09', '0844370789', 'hack1111@gmail.com', '2021-11-01 18:57:28', '2021-11-01 18:57:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `manu_id` int(10) UNSIGNED NOT NULL,
  `protype_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pro_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `promotion_price` int(11) NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_manu_id_foreign` (`manu_id`),
  KEY `products_protype_id_foreign` (`protype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `manu_id`, `protype_id`, `name`, `pro_image`, `origin`, `price`, `promotion_price`, `description`, `feature`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Áo Khoác Đen', 'img-pro-01.jpg', 'VietNam', 400000, 300000, 'Nam sagittis a augue eget scelerisque. Nullam lacinia consectetur sagittis. Nam sed neque id eros fermentum dignissim quis at tortor. Nullam ultricies urna quis sem sagittis pharetra. Nam erat turpis, cursus in ipsum at, tempor imperdiet metus. In interdum id nulla tristique accumsan. Ut semper in quam nec pretium. Donec egestas finibus suscipit. Curabitur tincidunt convallis arcu.', 0, NULL, NULL),
(2, 2, 1, 'Váy đen', 'img-pro-02.jpg', 'USA', 600000, 500000, 'Nam sagittis a augue eget scelerisque. Nullam lacinia consectetur sagittis. Nam sed neque id eros fermentum dignissim quis at tortor. Nullam ultricies urna quis sem sagittis pharetra. Nam erat turpis, cursus in ipsum at, tempor imperdiet metus. In interdum id nulla tristique accumsan. Ut semper in quam nec pretium. Donec egestas finibus suscipit. Curabitur tincidunt convallis arcu.', 1, NULL, '2021-11-01 20:05:00'),
(3, 2, 5, 'Túi xách nữ', 'img-pro-03.jpg', 'Malaysia', 632000, 510000, 'Nam sagittis a augue eget scelerisque. Nullam lacinia consectetur sagittis. Nam sed neque id eros fermentum dignissim quis at tortor. Nullam ultricies urna quis sem sagittis pharetra. Nam erat turpis, cursus in ipsum at, tempor imperdiet metus. In interdum id nulla tristique accumsan. Ut semper in quam nec pretium. Donec egestas finibus suscipit. Curabitur tincidunt convallis arcu.', 1, NULL, NULL),
(4, 3, 5, 'Đồng hồ rolex', 'img-pro-04.jpg', 'Switzerland', 1500000, 0, 'Nam sagittis a augue eget scelerisque. Nullam lacinia consectetur sagittis. Nam sed neque id eros fermentum dignissim quis at tortor. Nullam ultricies urna quis sem sagittis pharetra. Nam erat turpis, cursus in ipsum at, tempor imperdiet metus. In interdum id nulla tristique accumsan. Ut semper in quam nec pretium. Donec egestas finibus suscipit. Curabitur tincidunt convallis arcu.', 0, NULL, NULL),
(5, 2, 5, 'Đồng hồ rolex', 'img-pro-04.jpg', 'Switzerland', 1500000, 0, 'Nam sagittis a augue eget scelerisque. Nullam lacinia consectetur sagittis. Nam sed neque id eros fermentum dignissim quis at tortor. Nullam ultricies urna quis sem sagittis pharetra. Nam erat turpis, cursus in ipsum at, tempor imperdiet metus. In interdum id nulla tristique accumsan. Ut semper in quam nec pretium. Donec egestas finibus suscipit. Curabitur tincidunt convallis arcu.', 0, NULL, NULL),
(6, 1, 5, 'Đồng hồ rolex 1', 'img-pro-04.jpg', 'Switzerland', 1500000, 0, 'Nam sagittis a augue eget scelerisque. Nullam lacinia consectetur sagittis. Nam sed neque id eros fermentum dignissim quis at tortor. Nullam ultricies urna quis sem sagittis pharetra. Nam erat turpis, cursus in ipsum at, tempor imperdiet metus. In interdum id nulla tristique accumsan. Ut semper in quam nec pretium. Donec egestas finibus suscipit. Curabitur tincidunt convallis arcu.', 0, NULL, NULL),
(7, 1, 5, 'Đồng hồ rolex 2', 'img-pro-04.jpg', 'Switzerland', 1500000, 0, 'Nam sagittis a augue eget scelerisque. Nullam lacinia consectetur sagittis. Nam sed neque id eros fermentum dignissim quis at tortor. Nullam ultricies urna quis sem sagittis pharetra. Nam erat turpis, cursus in ipsum at, tempor imperdiet metus. In interdum id nulla tristique accumsan. Ut semper in quam nec pretium. Donec egestas finibus suscipit. Curabitur tincidunt convallis arcu.', 0, NULL, NULL),
(8, 3, 5, 'Đồng hồ rolex 3', 'img-pro-04.jpg', 'Switzerland', 1500000, 0, 'Nam sagittis a augue eget scelerisque. Nullam lacinia consectetur sagittis. Nam sed neque id eros fermentum dignissim quis at tortor. Nullam ultricies urna quis sem sagittis pharetra. Nam erat turpis, cursus in ipsum at, tempor imperdiet metus. In interdum id nulla tristique accumsan. Ut semper in quam nec pretium. Donec egestas finibus suscipit. Curabitur tincidunt convallis arcu.', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_sizes`
--

DROP TABLE IF EXISTS `products_sizes`;
CREATE TABLE IF NOT EXISTS `products_sizes` (
  `pro_id` int(10) UNSIGNED NOT NULL,
  `size_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `products_sizes_pro_id_foreign` (`pro_id`),
  KEY `products_sizes_size_id_foreign` (`size_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products_sizes`
--

INSERT INTO `products_sizes` (`pro_id`, `size_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(1, 2, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL),
(1, 5, NULL, NULL),
(2, 5, '2021-11-01 20:05:00', '2021-11-01 20:05:00'),
(2, 2, '2021-11-01 20:05:00', '2021-11-01 20:05:00'),
(3, 1, NULL, NULL),
(3, 2, NULL, NULL),
(3, 3, NULL, NULL),
(3, 4, NULL, NULL),
(3, 5, NULL, NULL),
(3, 6, NULL, NULL),
(3, 7, NULL, NULL),
(4, 1, NULL, NULL),
(4, 2, NULL, NULL),
(4, 3, NULL, NULL),
(4, 4, NULL, NULL),
(4, 5, NULL, NULL),
(4, 6, NULL, NULL),
(5, 1, NULL, NULL),
(5, 2, NULL, NULL),
(5, 3, NULL, NULL),
(5, 4, NULL, NULL),
(5, 5, NULL, NULL),
(5, 6, NULL, NULL),
(6, 1, NULL, NULL),
(6, 2, NULL, NULL),
(6, 3, NULL, NULL),
(6, 4, NULL, NULL),
(6, 5, NULL, NULL),
(6, 6, NULL, NULL),
(7, 1, NULL, NULL),
(7, 2, NULL, NULL),
(7, 3, NULL, NULL),
(7, 4, NULL, NULL),
(7, 5, NULL, NULL),
(7, 6, NULL, NULL),
(8, 1, NULL, NULL),
(8, 2, NULL, NULL),
(8, 3, NULL, NULL),
(8, 4, NULL, NULL),
(8, 5, NULL, NULL),
(8, 6, NULL, NULL),
(2, 6, '2021-11-01 20:05:00', '2021-11-01 20:05:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `protypes`
--

DROP TABLE IF EXISTS `protypes`;
CREATE TABLE IF NOT EXISTS `protypes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_id` int(10) UNSIGNED NOT NULL,
  `protype_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protype_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `protypes_type_id_foreign` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `protypes`
--

INSERT INTO `protypes` (`id`, `type_id`, `protype_name`, `protype_image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Shirt', 'shirt-img.jpg', NULL, '2021-11-01 20:33:45'),
(2, 1, 'T-Shirts', 't-shirts-img.jpg', NULL, NULL),
(3, 1, 'Hot', 'shoes-img.jpg', NULL, NULL),
(4, 2, 'Shoes', 'shoes-img.jpg', NULL, NULL),
(5, 3, 'Wallets', 'wallet-img.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

DROP TABLE IF EXISTS `sizes`;
CREATE TABLE IF NOT EXISTS `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'S', NULL, NULL),
(2, 'M', NULL, NULL),
(3, 'L', NULL, NULL),
(4, 'XL', NULL, NULL),
(5, 'XXL', NULL, NULL),
(6, '3XL', NULL, NULL),
(7, '4XL', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slides`
--

DROP TABLE IF EXISTS `slides`;
CREATE TABLE IF NOT EXISTS `slides` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slide_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slides`
--

INSERT INTO `slides` (`id`, `slide_image`, `created_at`, `updated_at`) VALUES
(1, 'banner-01.jpg', NULL, NULL),
(2, 'banner-02.jpg', NULL, NULL),
(3, 'banner-03.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `types`
--

INSERT INTO `types` (`type_id`, `type_name`, `created_at`, `updated_at`) VALUES
(1, 'top', NULL, NULL),
(2, 'bottom', NULL, NULL),
(3, 'accessories', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
