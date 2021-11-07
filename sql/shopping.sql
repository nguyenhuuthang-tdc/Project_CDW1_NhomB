-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3308
-- Thời gian đã tạo: Th10 07, 2021 lúc 01:02 AM
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `accounts`
--

INSERT INTO `accounts` (`id`, `user_name`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'thang1234', '$2y$10$wTLIc9H2fmYcfz8mccHsHOWHRaQUHZULQhBRBshFZ0HXDZ2jFNWW6', 'customer', NULL, NULL, NULL),
(2, 'manager1', '$2y$10$wTLIc9H2fmYcfz8mccHsHOWHRaQUHZULQhBRBshFZ0HXDZ2jFNWW6', 'admin', NULL, NULL, NULL),
(3, 'admin1', '$2y$10$wTLIc9H2fmYcfz8mccHsHOWHRaQUHZULQhBRBshFZ0HXDZ2jFNWW6', 'admin', NULL, NULL, NULL),
(4, 'admin2', '$2y$10$Lhlq/s.wpmJFCcqeKZN50uSKQpMfIx2whXVUt/XaasUsKmuXEoSai', 'admin', NULL, '2021-11-06 17:59:40', '2021-11-06 17:59:40'),
(5, 'admin3', '$2y$10$cfp82CoZVLm4spN/LlC1OOV8tgqw87u7JB0ulFDUbCt8bq0marlka', 'admin', NULL, '2021-11-06 18:00:19', '2021-11-06 18:00:19');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `person_id`, `role_admin`, `created_at`, `updated_at`) VALUES
(1, 2, 'manager', NULL, NULL),
(2, 3, 'editer', NULL, NULL),
(3, 4, 'editer', '2021-11-06 17:59:40', '2021-11-06 18:00:22'),
(4, 5, 'editer', '2021-11-06 18:00:19', '2021-11-06 18:00:19');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `person_id`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'normal', NULL, NULL);

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
(1, 'Supreme', NULL, NULL),
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
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(65, '2014_10_12_100000_create_password_resets_table', 1),
(66, '2021_07_19_030041_create_slides_table', 1),
(67, '2021_07_20_022324_create_types_table', 1),
(68, '2021_07_20_022514_create_protypes_table', 1),
(69, '2021_07_20_022542_create_products_table', 1),
(70, '2021_07_23_131241_create_manufactures_table', 1),
(71, '2021_07_27_130928_create_sizes_table', 1),
(72, '2021_07_27_131250_create_products_sizes_table', 1),
(73, '2021_09_15_071822_create_accounts_table', 1),
(74, '2021_09_15_071903_create_persons_table', 1),
(75, '2021_09_15_071926_create_customers_table', 1),
(76, '2021_10_21_113345_create_admins_table', 1),
(77, '2021_10_28_114354_create_orders_table', 1),
(78, '2021_10_28_114444_create_order_items_table', 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `total_quantity`, `grand_price`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 1320000, '', 'progress', '2021-11-06 18:01:45', '2021-11-06 18:01:45');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `price_sell`, `size`, `quantity`, `sub_price`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 260000, 'XL', 4, 1040000, '2021-11-06 18:01:45', '2021-11-06 18:01:45'),
(2, 1, 10, 260000, 'L', 1, 260000, '2021-11-06 18:01:45', '2021-11-06 18:01:45');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `persons`
--

INSERT INTO `persons` (`id`, `account_id`, `full_name`, `gender`, `address`, `date_of_birth`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nguyễn Hữu Thắng', 'Male', 'K3, Tân Hiệp, Kiên Giang', '2000-01-01', '0844370344', 'nguyenhuuthang12c8@gmail.com', NULL, NULL),
(2, 2, 'Thắng Nguyễn', 'Male', 'Thủ Đức', '2005-01-01', '0844370255', 'nguyenhuuthang1609@gmail.com', NULL, NULL),
(3, 3, 'Phan Ngọc Luân', 'Male', 'Vũng Tàu', '2009-01-01', '0123456789', 'nguyenhuuthang12c4@gmail.com', NULL, NULL),
(4, 4, 'Đào Văn Chung', 'Male', 'Xuyên Mộc', '2001-12-16', '0919123456', 'vanchung@gmail.com', '2021-11-06 17:59:40', '2021-11-06 17:59:40'),
(5, 5, 'Lê Công Đức Mạnh', 'Male', 'Xuyên Mộc', '2001-12-08', '0987123412', 'manh@gmail.com', '2021-11-06 18:00:19', '2021-11-06 18:00:19');

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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `manu_id`, `protype_id`, `name`, `pro_image`, `origin`, `price`, `promotion_price`, `description`, `feature`, `created_at`, `updated_at`) VALUES
(19, 3, 5, 'Brown wallets', 'georgi-dyulgerov-j_z2b7Xi3wg-unsplash.jpg', 'Viet Nam', 760000, 600000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 1, '2021-11-06 17:55:26', '2021-11-06 17:55:26'),
(20, 3, 5, 'Big bag', 'jan-de-keijzer-M0g1sV4SEdo-unsplash.jpg', 'Viet Nam', 450000, 120000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 1, '2021-11-06 17:56:25', '2021-11-06 17:56:25'),
(9, 1, 1, 'Black Shirt', 'mahdi-bafande-ZSScmyIxEXQ-unsplash.jpg', 'Viet Nam', 500000, 400000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 1, '2021-11-06 17:41:22', '2021-11-06 17:41:22'),
(10, 1, 1, 'Brown Shirt', 'brooke-cagle-wKOKidNT14w-unsplash.jpg', 'Korea', 450000, 260000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 1, '2021-11-06 17:42:39', '2021-11-06 17:42:39'),
(11, 1, 1, 'Flower Shirts', 'caique-silva-rD3muAr7ngY-unsplash.jpg', 'China', 215000, 100000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 0, '2021-11-06 17:43:46', '2021-11-06 17:43:46'),
(12, 1, 1, 'White Shirt', 'rui-silvestre-hAMJpesMeDE-unsplash.jpg', 'Japan', 410000, 120000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 1, '2021-11-06 17:44:43', '2021-11-06 17:44:43'),
(13, 3, 2, 'T-shirts long hand', 'bewakoof-com-official-EwM1EqeIYzk-unsplash.jpg', 'Viet Nam', 120000, 110000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 1, '2021-11-06 17:48:05', '2021-11-06 17:48:05'),
(14, 3, 2, 'Yellow t-shirt', 'gian-cescon-00ByEXKcSkA-unsplash.jpg', 'Viet Nam', 810000, 700000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 1, '2021-11-06 17:49:01', '2021-11-06 17:49:01'),
(15, 3, 4, 'Red Nike', 'revolt-164_6wVEHfI-unsplash.jpg', 'America', 1250000, 1000000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 1, '2021-11-06 17:51:02', '2021-11-06 17:51:02'),
(16, 2, 4, 'Converse', 'camila-damasio-mWYhrOiAgmA-unsplash.jpg', 'Korea', 870000, 800000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 1, '2021-11-06 17:52:02', '2021-11-06 17:52:02'),
(17, 2, 4, 'Brown Shoes', 'maksim-larin-NOpsC3nWTzY-unsplash.jpg', 'Viet Nam', 3000000, 2500000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 1, '2021-11-06 17:52:54', '2021-11-06 17:52:54'),
(18, 2, 4, 'Red Jordan', 'paul-volkmer-updW-QUccFE-unsplash.jpg', 'Viet Nam', 4870000, 3500000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 1, '2021-11-06 17:53:45', '2021-11-06 17:53:45'),
(21, 1, 5, 'Japan Wallet', 'georgi-dyulgerov-RFCw8jlT1oQ-unsplash.jpg', 'Japan', 450000, 400000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', 1, '2021-11-06 17:58:29', '2021-11-06 17:58:29');

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
(11, 7, '2021-11-06 17:43:46', '2021-11-06 17:43:46'),
(11, 6, '2021-11-06 17:43:46', '2021-11-06 17:43:46'),
(11, 5, '2021-11-06 17:43:46', '2021-11-06 17:43:46'),
(11, 4, '2021-11-06 17:43:46', '2021-11-06 17:43:46'),
(10, 4, '2021-11-06 17:42:39', '2021-11-06 17:42:39'),
(9, 2, '2021-11-06 17:41:22', '2021-11-06 17:41:22'),
(9, 1, '2021-11-06 17:41:22', '2021-11-06 17:41:22'),
(10, 3, '2021-11-06 17:42:39', '2021-11-06 17:42:39'),
(10, 2, '2021-11-06 17:42:39', '2021-11-06 17:42:39'),
(10, 1, '2021-11-06 17:42:39', '2021-11-06 17:42:39'),
(9, 6, '2021-11-06 17:41:22', '2021-11-06 17:41:22'),
(9, 5, '2021-11-06 17:41:22', '2021-11-06 17:41:22'),
(9, 4, '2021-11-06 17:41:22', '2021-11-06 17:41:22'),
(9, 3, '2021-11-06 17:41:22', '2021-11-06 17:41:22'),
(12, 6, '2021-11-06 17:44:43', '2021-11-06 17:44:43'),
(12, 5, '2021-11-06 17:44:43', '2021-11-06 17:44:43'),
(12, 4, '2021-11-06 17:44:43', '2021-11-06 17:44:43'),
(12, 3, '2021-11-06 17:44:43', '2021-11-06 17:44:43'),
(12, 2, '2021-11-06 17:44:43', '2021-11-06 17:44:43'),
(12, 1, '2021-11-06 17:44:43', '2021-11-06 17:44:43'),
(14, 2, '2021-11-06 17:49:01', '2021-11-06 17:49:01'),
(14, 1, '2021-11-06 17:49:01', '2021-11-06 17:49:01'),
(13, 7, '2021-11-06 17:48:05', '2021-11-06 17:48:05'),
(13, 5, '2021-11-06 17:48:05', '2021-11-06 17:48:05'),
(13, 2, '2021-11-06 17:48:05', '2021-11-06 17:48:05'),
(12, 7, '2021-11-06 17:44:43', '2021-11-06 17:44:43'),
(15, 2, '2021-11-06 17:51:02', '2021-11-06 17:51:02'),
(15, 1, '2021-11-06 17:51:02', '2021-11-06 17:51:02'),
(14, 6, '2021-11-06 17:49:01', '2021-11-06 17:49:01'),
(14, 5, '2021-11-06 17:49:01', '2021-11-06 17:49:01'),
(14, 4, '2021-11-06 17:49:01', '2021-11-06 17:49:01'),
(14, 3, '2021-11-06 17:49:01', '2021-11-06 17:49:01'),
(16, 3, '2021-11-06 17:52:02', '2021-11-06 17:52:02'),
(16, 2, '2021-11-06 17:52:02', '2021-11-06 17:52:02'),
(16, 1, '2021-11-06 17:52:02', '2021-11-06 17:52:02'),
(15, 7, '2021-11-06 17:51:02', '2021-11-06 17:51:02'),
(15, 5, '2021-11-06 17:51:02', '2021-11-06 17:51:02'),
(15, 3, '2021-11-06 17:51:02', '2021-11-06 17:51:02'),
(18, 1, '2021-11-06 17:53:45', '2021-11-06 17:53:45'),
(17, 5, '2021-11-06 17:52:54', '2021-11-06 17:52:54'),
(17, 4, '2021-11-06 17:52:54', '2021-11-06 17:52:54'),
(17, 3, '2021-11-06 17:52:54', '2021-11-06 17:52:54'),
(17, 2, '2021-11-06 17:52:54', '2021-11-06 17:52:54'),
(17, 1, '2021-11-06 17:52:54', '2021-11-06 17:52:54'),
(18, 2, '2021-11-06 17:53:45', '2021-11-06 17:53:45'),
(18, 4, '2021-11-06 17:53:45', '2021-11-06 17:53:45'),
(18, 5, '2021-11-06 17:53:45', '2021-11-06 17:53:45'),
(19, 1, '2021-11-06 17:55:26', '2021-11-06 17:55:26'),
(19, 3, '2021-11-06 17:55:26', '2021-11-06 17:55:26'),
(19, 4, '2021-11-06 17:55:26', '2021-11-06 17:55:26'),
(19, 5, '2021-11-06 17:55:26', '2021-11-06 17:55:26'),
(19, 6, '2021-11-06 17:55:26', '2021-11-06 17:55:26'),
(20, 1, '2021-11-06 17:56:25', '2021-11-06 17:56:25'),
(20, 2, '2021-11-06 17:56:25', '2021-11-06 17:56:25'),
(20, 3, '2021-11-06 17:56:25', '2021-11-06 17:56:25'),
(21, 1, '2021-11-06 17:58:29', '2021-11-06 17:58:29'),
(21, 2, '2021-11-06 17:58:29', '2021-11-06 17:58:29'),
(21, 3, '2021-11-06 17:58:29', '2021-11-06 17:58:29');

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
(1, 1, 'Shirts', 'shirt-img.jpg', NULL, NULL),
(2, 1, 'T-Shirts', 't-shirts-img.jpg', NULL, NULL),
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
