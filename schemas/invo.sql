/*
Navicat MySQL Data Transfer

Source Server         : home
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : invo

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2014-04-12 23:26:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `companies`
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `telephone` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `address` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `city` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES ('1', 'Acme', '31566564', 'Address', 'Hello');
INSERT INTO `companies` VALUES ('2', 'Acme Inc', '+44 564612345', 'Guildhall, PO Box 270, London', 'London');

-- ----------------------------
-- Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `comments` text COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of contact
-- ----------------------------

-- ----------------------------
-- Table structure for `navigations`
-- ----------------------------
DROP TABLE IF EXISTS `navigations`;
CREATE TABLE `navigations` (
  `navigationID` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  `position` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-1',
  PRIMARY KEY (`navigationID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of navigations
-- ----------------------------
INSERT INTO `navigations` VALUES ('1', 'index', 'index', 'Nhà', '0', '1', 'top-menu', '-1');
INSERT INTO `navigations` VALUES ('2', 'index', 'invoices', 'Hóa đơn', '1', '1', 'top-menu', '1');
INSERT INTO `navigations` VALUES ('3', 'index', 'about', 'Về chúng tôi', '2', '1', 'top-menu', '-1');
INSERT INTO `navigations` VALUES ('4', 'index', 'contact', 'Liên hệ', '3', '1', 'top-menu', '-1');
INSERT INTO `navigations` VALUES ('5', 'index', 'invoices', 'Hóa đơn', '0', '1', 'admin-menu', '1');
INSERT INTO `navigations` VALUES ('6', 'index', 'companies', 'Công ty', '1', '1', 'admin-menu', '1');
INSERT INTO `navigations` VALUES ('7', 'index', 'products', 'Sản phẩm', '2', '1', 'admin-menu', '1');
INSERT INTO `navigations` VALUES ('8', 'index', 'producttypes', 'Phân loại', '3', '1', 'admin-menu', '1');
INSERT INTO `navigations` VALUES ('9', 'profile', 'invoices', 'Hồ sơ cá nhân', '4', '1', 'admin-menu', '-1');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_types_id` int(10) unsigned NOT NULL,
  `name` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `active` enum('Y','N') COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '5', 'Artichoke', '10.50', 'Y');
INSERT INTO `products` VALUES ('2', '5', 'Bell pepper', '10.40', 'Y');
INSERT INTO `products` VALUES ('3', '5', 'Cauliflower', '20.10', 'Y');
INSERT INTO `products` VALUES ('4', '5', 'Chinese cabbage', '15.50', 'Y');
INSERT INTO `products` VALUES ('5', '5', 'Malabar spinach', '7.50', 'Y');
INSERT INTO `products` VALUES ('6', '5', 'Onion', '3.50', 'Y');
INSERT INTO `products` VALUES ('7', '5', 'Peanut', '4.50', 'Y');

-- ----------------------------
-- Table structure for `product_types`
-- ----------------------------
DROP TABLE IF EXISTS `product_types`;
CREATE TABLE `product_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of product_types
-- ----------------------------
INSERT INTO `product_types` VALUES ('5', 'Vegetables');
INSERT INTO `product_types` VALUES ('6', 'Fruits');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `password` char(40) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `role` int(11) NOT NULL DEFAULT '0',
  `active` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'demo', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', 'Phalcon Demo', 'demo@phalconphp.com', '2012-04-10 20:53:03', '1', 'Y');
INSERT INTO `users` VALUES ('4', 'hoansinvo', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', 'hoan nguyen', 'hoans.email@yahoo.com', '2014-03-17 11:28:04', '0', 'Y');
