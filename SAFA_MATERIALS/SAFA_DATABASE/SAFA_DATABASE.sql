-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for cheeseshop
CREATE DATABASE IF NOT EXISTS `cheeseshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `cheeseshop`;

-- Dumping structure for table cheeseshop.classes
CREATE TABLE IF NOT EXISTS `classes` (
  `ClassID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `ClassDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cheeseshop.classes: ~0 rows (approximately)
DELETE FROM `classes`;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` (`ClassID`, `ClassName`, `Price`, `ClassDate`) VALUES
	(1, 'How to Be a Great Grater', 109.99, '2022-10-18 16:00:00'),
	(2, 'Brilliant Breads', 89.99, '2022-10-18 16:00:00');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;

-- Dumping structure for table cheeseshop.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime NOT NULL,
  `UserID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OrderID`),
  KEY `FK_orders_users` (`UserID`),
  CONSTRAINT `FK_orders_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cheeseshop.orders: ~13 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`OrderID`, `OrderDate`, `UserID`) VALUES
	(3, '2022-10-08 13:27:05', 1),
	(4, '2022-10-08 13:28:16', 3),
	(5, '2022-10-08 13:28:41', 1),
	(6, '2022-10-08 13:33:20', 3),
	(7, '2022-10-08 14:56:03', 3),
	(8, '2022-10-08 14:56:25', 1),
	(9, '2022-10-08 14:56:28', 1),
	(10, '2022-10-08 15:56:28', 7),
	(11, '2022-10-08 15:56:30', 1),
	(12, '2022-10-08 15:56:31', 7),
	(13, '2022-10-08 15:56:34', 7),
	(14, '2022-10-08 20:59:36', 7),
	(15, '2022-10-09 14:18:16', 3),
	(16, '2022-10-10 15:13:31', 1),
	(17, '2022-10-10 15:19:00', 7);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table cheeseshop.products
CREATE TABLE IF NOT EXISTS `products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `Cost` float NOT NULL DEFAULT '0',
  `ImageURL` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cheeseshop.products: ~7 rows (approximately)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`ProductID`, `ProductName`, `Cost`, `ImageURL`) VALUES
	(1, 'Cheddar', 6.99, 'https://cheese-etc.co.uk/wp-content/uploads/2020/02/goulds-farmhouse-cheddar-cheese.jpeg'),
	(2, 'Red Leicester', 7.99, 'https://ichef.bbci.co.uk/food/ic/food_16x9_320/foods/r/red_leicester_cheese_16x9.jpg'),
	(3, 'Cheddar', 6.99, 'https://cheese-etc.co.uk/wp-content/uploads/2020/02/goulds-farmhouse-cheddar-cheese.jpeg'),
	(4, 'Red Leicester', 7.99, 'https://ichef.bbci.co.uk/food/ic/food_16x9_320/foods/r/red_leicester_cheese_16x9.jpg'),
	(5, 'Dairylea', 1.99, 'https://images.ctfassets.net/6jpeaipefazr/5KA1IjIopASZfOWpHGHBV5/459fd56faf28683d1579e26bb268fe54/P13-7622210317629.jpg'),
	(6, 'Stilton', 10.99, 'https://www.finefoodspecialist.co.uk/media/catalog/product/cache/2eeda6139faec14ae6564fa681987f23/c/r/cropwell_half.jpg'),
	(7, 'Cheese Knife', 109.99, 'https://imageengine.victorinox.com/mediahub/31375/1280Wx1120H/CUT_6_7863_13B__S1.jpg'),
	(9, 'Burger Cheese', 10.99, 'https://complex-res.cloudinary.com/image/upload/a8elykw0n4brqafpbqux.gif');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table cheeseshop.product_orders
CREATE TABLE IF NOT EXISTS `product_orders` (
  `ProductID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`OrderID`),
  KEY `FK_product_orders_orders` (`OrderID`),
  CONSTRAINT `FK_product_orders_orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `FK_product_orders_products` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cheeseshop.product_orders: ~13 rows (approximately)
DELETE FROM `product_orders`;
/*!40000 ALTER TABLE `product_orders` DISABLE KEYS */;
INSERT INTO `product_orders` (`ProductID`, `OrderID`, `Quantity`) VALUES
	(1, 3, 5),
	(1, 6, 8),
	(1, 13, 4),
	(1, 15, 4),
	(2, 4, 7),
	(2, 7, 3),
	(2, 8, 1),
	(2, 10, 1),
	(3, 9, 3),
	(3, 11, 1),
	(4, 5, 4),
	(4, 12, 1),
	(6, 14, 8),
	(7, 16, 4);
/*!40000 ALTER TABLE `product_orders` ENABLE KEYS */;

-- Dumping structure for table cheeseshop.users
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `Password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `Email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `Address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cheeseshop.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`UserID`, `Username`, `Password`, `Email`, `Address`) VALUES
	(1, 'Ben', 'Password123!', 'popleb@btc.ac.uk', 'UCS'),
	(3, 'ben', 'complicatedpassword', 'ben@outlook.com', 'Bridgwater'),
	(7, 'Admin', 'HgHhuTT12K)>>!', 'admin@SAFA.org', 'Somerset');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
