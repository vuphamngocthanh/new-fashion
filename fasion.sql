-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for google
CREATE DATABASE IF NOT EXISTS `google` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `google`;

-- Dumping structure for table google.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table google.categories: ~0 rows (approximately)
INSERT INTO `categories` (`id`, `name`) VALUES
	(1, 'Áo Nam'),
	(2, 'Quần Nam');

-- Dumping structure for table google.colors
CREATE TABLE IF NOT EXISTS `colors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table google.colors: ~3 rows (approximately)
INSERT INTO `colors` (`id`, `color`) VALUES
	(1, 'Den'),
	(2, 'Vang'),
	(3, 'Do');

-- Dumping structure for table google.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table google.countries: ~0 rows (approximately)

-- Dumping structure for table google.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `authentication_type` varchar(10) DEFAULT NULL,
  `city` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `postal_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `verification_code` varchar(64) DEFAULT NULL,
  `reset_password_token` varchar(30) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rfbvkrffamfql7cjmen8v976v` (`email`),
  KEY `FK7b7p2myt0y31l4nyj1p7sk0b1` (`country_id`),
  CONSTRAINT `FK7b7p2myt0y31l4nyj1p7sk0b1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table google.customers: ~6 rows (approximately)
INSERT INTO `customers` (`id`, `address_line1`, `address_line_2`, `authentication_type`, `city`, `created_time`, `email`, `enabled`, `first_name`, `last_name`, `password`, `phone_number`, `postal_code`, `state`, `verification_code`, `reset_password_token`, `country_id`) VALUES
	(1, '', NULL, 'GOOGLE', '', '2023-03-09 10:19:56.464000', 'protonmailvideo@gmail.com', b'1', 'Thanh', ' Vũ', '$2a$10$i5ifq0n5LsncOMd1VpBd2OYWunb9MiryzDtMPRlPLNIEz1EGTHVdC', '', '', '', NULL, NULL, NULL),
	(2, '', NULL, 'GOOGLE', '', '2023-03-14 16:52:39.372000', 'quans1471@gmail.com', b'1', 'Nguyễn', ' Quân', '', '', '', '', NULL, NULL, NULL),
	(3, NULL, NULL, 'DATABASE', NULL, '2023-03-15 09:13:54.632000', 'admin@admin.com', b'1', 'Thanh', 'Vũ', '$2a$10$0hSCxKgGRkw/lopVpAMnCeFUyHyHZ7/tOjcwRcLOyW.EVyExnO5hK', NULL, NULL, NULL, 'QLYhly2lIFtaZoN0JRtvlhaD00Zbyl46caNaehyoUbZMVvRHvZKAr6w1kpTulaJh', 'EiORnC7iHYRvvl0oBaGGCNgTZAryEY', NULL),
	(5, NULL, NULL, 'DATABASE', NULL, '2023-03-15 09:25:11.500000', 'thanh@admin.com', b'1', 'Thanh', 'Vũ', '$2a$10$Y2jI.gSvMDE6cKHzncmh/uEPqi9DR0n2BnvjS6QyeEeGDT4oOYxIC', NULL, NULL, NULL, 'DjulkDzIkBsXh7gppAC1u97RLO4XA1ADybRILq4RhGHxy5Iv60Ye3GoscAvIEQfy', NULL, NULL),
	(11, NULL, NULL, 'DATABASE', NULL, '2023-03-16 13:55:37.384000', 'vuphamngocthanh@gmail.com', b'1', 'Thanh', NULL, '$2a$10$RPwRHrnGYfWWoEngI6SLGe4cVkr.TOYwxuRTp4FZQm./GDq.QKeui', NULL, NULL, NULL, 'MmAYU97euPVhhlkKysIJ8FJ41x0FtAHDlDnK5Zqs2t7p0IdKwCg5prnKnq6J7Vjc', 'B56PgUySGsTwx03dg3wO3tC3XNeILR', NULL),
	(12, '', NULL, 'GOOGLE', '', '2023-03-16 15:35:40.105000', 'ceoweball@gmail.com', b'1', 'weball', 'ceo', '', '', '', '', NULL, NULL, NULL);

-- Dumping structure for table google.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `detailed_description` varchar(255) DEFAULT NULL,
  `fabric_material` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `volume` bigint DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table google.products: ~11 rows (approximately)
INSERT INTO `products` (`id`, `created_at`, `detailed_description`, `fabric_material`, `name`, `photo`, `price`, `volume`, `category_id`) VALUES
	(1, '2023-03-14 11:12:18.000000', 'Áo nam tay dài', 'Áo nam tay dài', 'Áo Nam Kiểu ', 'https://bizweb.dktcdn.net/thumb/grande/100/396/594/products/fapas-020223-4-5.jpg?v=1675407282613', 20000, 20, 1),
	(2, '2023-03-14 11:13:30.000000', 'Áo nam tay ngắn', 'Áo nam tay ngắn', 'Áo Nam Cá Sấu', 'https://cf.shopee.vn/file/sg-11134201-22120-o0dnnvf6bblv0a', 30000, NULL, 1),
	(3, '2023-03-14 11:15:51.000000', 'Áo nam tay ngắn', 'Áo nam tay ngắn', 'Áo Nam Hàn Quốc', 'https://khohangsiann.com/wp-content/uploads/si-quan-ao-nam-ha-noi.png', 60000, NULL, 1),
	(4, '2023-03-14 11:23:38.000000', 'ÁO POLO REGULAR GENES', 'ÁO POLO REGULAR GENES', 'ÁO POLO REGULAR GENES', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/396/594/products/fapas-160822-3-6-result.jpg?v=1660729593613', 30000, NULL, 1),
	(5, '2023-03-14 11:22:20.000000', 'ÁO POLO REGULAR HIGHS', 'ÁO POLO REGULAR HIGHS', 'ÁO POLO REGULAR HIGHS', 'https://bizweb.dktcdn.net/thumb/grande/100/396/594/products/fapas-160223-2-10.jpg?v=1676620616000', 10000, NULL, 1),
	(6, '2023-03-14 11:23:41.000000', 'ÁO POLO REGULAR DEBUTIN', 'ÁO POLO REGULAR DEBUTIN', 'ÁO POLO REGULAR DEBUTIN', 'https://bizweb.dktcdn.net/thumb/grande/100/396/594/products/fapas-141222-3-1-min.jpg?v=1671245845000', 50000, NULL, 1),
	(7, '2023-03-14 11:26:21.000000', 'QUẦN JEANS SLIMFIT COSETTE', 'QUẦN JEANS SLIMFIT COSETTE', 'QUẦN JEANS SLIMFIT COSETTE', 'https://bizweb.dktcdn.net/thumb/grande/100/396/594/products/fapas-291222-2-1.jpg?v=1672503237000', 30000, NULL, 2),
	(8, '2023-03-14 11:26:04.000000', 'QUẦN JEAN SKINNY BINGER', 'QUẦN JEAN SKINNY BINGER', 'QUẦN JEAN SKINNY BINGER', 'https://bizweb.dktcdn.net/thumb/grande/100/396/594/products/fapas-281222-2-4.jpg?v=1672286540000', 30000, NULL, 2),
	(9, '2023-03-14 11:27:35.000000', 'QUẦN JEANS SKINNY LUX', 'QUẦN JEANS SKINNY LUX', 'QUẦN JEANS SKINNY LUX', 'https://bizweb.dktcdn.net/thumb/grande/100/396/594/products/fapas-141222-2-3.jpg?v=1671341834000', 50000, NULL, 2),
	(10, '2023-03-14 11:27:57.000000', 'QUẦN JEANS SKINNY WARNER', 'QUẦN JEANS SKINNY WARNER', 'QUẦN JEANS SKINNY WARNER', 'https://bizweb.dktcdn.net/thumb/grande/100/396/594/products/fapas-190822-2-1-result.jpg?v=1660969140000', 200000, NULL, 2),
	(11, '2023-03-14 11:28:46.000000', 'QUẦN JEANS STRAIGHT CONS', 'QUẦN JEANS STRAIGHT CONS', 'QUẦN JEANS STRAIGHT CONS', 'https://bizweb.dktcdn.net/thumb/grande/100/396/594/products/fapas-200722-1-3-result.jpg?v=1658463766000', 60000, NULL, 2),
	(12, '2023-03-14 11:29:59.000000', 'QUẦN JEANS SKINNY PURE', 'QUẦN JEANS SKINNY PURE', 'QUẦN JEANS SKINNY PURE', 'https://bizweb.dktcdn.net/thumb/grande/100/396/594/products/fapas-270722-3-4-result.jpg?v=1659081993000', 20000, NULL, 2),
	(13, '2023-03-14 11:31:19.000000', 'QUẦN JEAN SKINNY CROP ARMIN', 'QUẦN JEAN SKINNY CROP ARMIN', 'QUẦN JEAN SKINNY CROP ARMIN', 'https://bizweb.dktcdn.net/thumb/grande/100/396/594/products/fapas-291222-2-4.jpg?v=1672372376000', 60000, NULL, 2);

-- Dumping structure for table google.products_colors
CREATE TABLE IF NOT EXISTS `products_colors` (
  `product_id` bigint NOT NULL,
  `color_id` bigint NOT NULL,
  KEY `FK2sj6smh11h53dhsn5py2qavfo` (`color_id`),
  KEY `FKdgbs2nmaolo4bcho8kjp16swj` (`product_id`),
  CONSTRAINT `FK2sj6smh11h53dhsn5py2qavfo` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `FKdgbs2nmaolo4bcho8kjp16swj` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table google.products_colors: ~9 rows (approximately)
INSERT INTO `products_colors` (`product_id`, `color_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(13, 1),
	(13, 2),
	(13, 3),
	(12, 1),
	(10, 2);

-- Dumping structure for table google.products_sizes
CREATE TABLE IF NOT EXISTS `products_sizes` (
  `product_id` bigint NOT NULL,
  `size_id` bigint NOT NULL,
  KEY `FKt7lhs1lrbb2w48cjdxvax5m9g` (`size_id`),
  KEY `FKddbtdcgrf05hypy7y2rol12tc` (`product_id`),
  CONSTRAINT `FKddbtdcgrf05hypy7y2rol12tc` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKt7lhs1lrbb2w48cjdxvax5m9g` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table google.products_sizes: ~7 rows (approximately)
INSERT INTO `products_sizes` (`product_id`, `size_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(13, 1),
	(12, 1),
	(10, 1);

-- Dumping structure for table google.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table google.roles: ~0 rows (approximately)
INSERT INTO `roles` (`id`, `description`, `name`) VALUES
	(1, 'Ad', 'ROLE_ADMIN');

-- Dumping structure for table google.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `key` varchar(128) NOT NULL,
  `category` varchar(45) NOT NULL,
  `value` varchar(1024) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table google.settings: 0 rows
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table google.sizes
CREATE TABLE IF NOT EXISTS `sizes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `size` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table google.sizes: ~3 rows (approximately)
INSERT INTO `sizes` (`id`, `size`) VALUES
	(1, 'M'),
	(2, 'L'),
	(3, 'S');

-- Dumping structure for table google.states
CREATE TABLE IF NOT EXISTS `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKskkdphjml9vjlrqn4m5hi251y` (`country_id`),
  CONSTRAINT `FKskkdphjml9vjlrqn4m5hi251y` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table google.states: ~0 rows (approximately)

-- Dumping structure for table google.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table google.users: ~0 rows (approximately)
INSERT INTO `users` (`id`, `email`, `fullname`, `password`, `photo`, `status`, `username`) VALUES
	(1, 'thanh@admin.com', 'thanh11123', '$2a$12$KC9W16W03vDkEFT.6ZoE1.XqnVFmOwMCSzML/4cXlhnL3GXdbLB2u', '/uploads/multi_module_spring_boot_project.png', b'0', 'vuthanh');

-- Dumping structure for table google.users_roles
CREATE TABLE IF NOT EXISTS `users_roles` (
  `user_id` bigint NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table google.users_roles: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
