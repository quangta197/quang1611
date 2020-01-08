/*
Navicat MySQL Data Transfer

Source Server         : website
Source Server Version : 50505
Source Host           : 10.1.35.135:3306
Source Database       : thuc_tap_db_web

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-07-18 17:34:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên loại cấu hình',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'tên danh mục cha nếu có là id_category của thằng cha',
  `type` tinyint(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trạng thái',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('2', 'khác', null, '1', '1', '2019-07-10 16:43:00', '2019-07-10 16:43:00');
INSERT INTO `categories` VALUES ('3', 'Laptop - Thiết bị IT', null, '0', null, '2019-07-16 22:41:00', '2019-07-16 22:41:00');
INSERT INTO `categories` VALUES ('4', 'Thời trang - Phụ kiện', null, '1', null, '2019-07-16 22:44:00', '2019-07-16 22:44:00');
INSERT INTO `categories` VALUES ('5', 'Phụ kiện nữ', '4', '1', null, '2019-07-16 22:44:00', '2019-07-16 22:44:00');
INSERT INTO `categories` VALUES ('6', 'Link kiện máy tính', '3', '1', null, '2019-07-16 22:45:00', '2019-07-16 22:45:00');

-- ----------------------------
-- Table structure for configs
-- ----------------------------
DROP TABLE IF EXISTS `configs`;
CREATE TABLE `configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `special` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_id` int(10) unsigned NOT NULL COMMENT 'Tham chiếu từ bảng users',
  `updated_id` int(10) unsigned DEFAULT NULL COMMENT 'Tham chiếu từ bảng users',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `configs_ibfk_2` (`updated_id`) USING BTREE,
  KEY `configs_ibfk_1` (`created_id`),
  CONSTRAINT `configs_ibfk_1` FOREIGN KEY (`created_id`) REFERENCES `users` (`id`),
  CONSTRAINT `configs_ibfk_2` FOREIGN KEY (`updated_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of configs
-- ----------------------------

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên của Group (Admin, Nhân viên bán hàng , Nhân viên Nhập Kho , Giám đốc ...)',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mô tả chức năng từng nhóm và quyền hạn được cấp',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES ('3', 'Giám đốc', 'Giám sát ', '2019-07-11 09:01:00', '2019-07-11 09:01:00');
INSERT INTO `groups` VALUES ('4', 'Người quản lí hệ thống', '', '2019-07-11 17:18:00', '2019-07-11 17:18:00');
INSERT INTO `groups` VALUES ('5', 'Người đăng bài ', '', '2019-07-11 17:21:00', '2019-07-11 17:21:00');
INSERT INTO `groups` VALUES ('6', 'Khách hàng', '', '2019-07-11 17:21:00', '2019-07-11 17:21:00');
INSERT INTO `groups` VALUES ('7', 'Nhân viên hỗ trợ', '', '2019-07-11 17:22:00', '2019-07-11 17:22:00');
INSERT INTO `groups` VALUES ('8', 'Thành viên đăng kí', '', '2019-07-11 17:24:00', '2019-07-11 17:24:00');

-- ----------------------------
-- Table structure for list_permissions
-- ----------------------------
DROP TABLE IF EXISTS `list_permissions`;
CREATE TABLE `list_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên quyền được phép truy nhập',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mô tả cụ thể các chức năng của quyền đó',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of list_permissions
-- ----------------------------
INSERT INTO `list_permissions` VALUES ('2', 'roles_keys.can_view_roles_keys ', 'có thể xem phân quyền');
INSERT INTO `list_permissions` VALUES ('3', 'post.can_edit_news ', 'Có thể sửa Bài viết');
INSERT INTO `list_permissions` VALUES ('4', 'post.can_view_list_post_video ', 'Có thể xem danh sách Bài viết');
INSERT INTO `list_permissions` VALUES ('5', 'post.can_view_uploads_news ', 'Có thể xem Bài viết');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL COMMENT 'id của người mua hàng',
  `delivery_at` datetime NOT NULL COMMENT 'thời gian mua hàng',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT 'Trang thái đơn hàng (chờ xử lí , giao hàng , nhận hàng , xác nhận , đánh giá sản phẩm )',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Địa chỉ',
  `phone_repicient` int(10) NOT NULL COMMENT 'số điện thoại người nhận',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời gian đặt hàng',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name_repicient` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên người nhập ',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '21', '2019-07-17 09:34:00', '1000', '1', 'Ha Dong', '904401250', '2019-07-17 16:34:00', '2019-07-17 16:34:00', 'Tam Anh');
INSERT INTO `orders` VALUES ('2', '22', '2019-07-17 10:19:02', '1001', '1', 'Cầu Giấy', '904444444', '2019-07-17 10:19:33', '2019-07-17 10:19:33', 'TA');
INSERT INTO `orders` VALUES ('3', '23', '2019-07-17 10:25:03', '1002', '1', 'Thanh Xuan', '1234', '2019-07-17 10:24:52', '2019-07-17 10:24:52', 'tam');

-- ----------------------------
-- Table structure for orders_products
-- ----------------------------
DROP TABLE IF EXISTS `orders_products`;
CREATE TABLE `orders_products` (
  `orders_id` int(10) unsigned NOT NULL,
  `products_id` int(10) unsigned NOT NULL,
  `price` int(10) NOT NULL COMMENT 'giá sản phẩm',
  `quantity` int(10) NOT NULL COMMENT 'số lượng sản phẩm',
  `products_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price_sale` int(10) DEFAULT NULL,
  `price_entered` int(10) DEFAULT NULL COMMENT 'Giá tại lúc đã nhập ',
  `price_comercial` int(10) DEFAULT NULL COMMENT 'Giá thị trường',
  KEY `orders_id` (`orders_id`),
  KEY `products_id` (`products_id`),
  CONSTRAINT `orders_products_ibfk_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orders_products_ibfk_2` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orders_products
-- ----------------------------

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tiêu đề trang',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nội dung của trang',
  `type` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT 'Trang thái bài viết',
  `users_id` int(10) unsigned NOT NULL COMMENT 'id người viết bài',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời gian tạo bài viết',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời gian cập nhập bài viết',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tối giản link',
  `count_views` int(10) NOT NULL COMMENT 'Lượt xem của trang',
  `lang` tinyint(4) DEFAULT NULL COMMENT 'Ngôn ngữ ',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('1', 'thoi trang', 'quan ao, day dep, tui sach, ', null, '1', '20', '2019-07-17 22:34:00', '2019-07-17 22:34:00', 'da-trang', '4', null);
INSERT INTO `pages` VALUES ('2', 'my phanm', 'sua rua mat, son ', '0', '1', '28', '2019-07-17 22:43:00', '2019-07-17 22:43:00', 'da-trang', '6', null);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `list_permissions_id` int(10) unsigned NOT NULL COMMENT 'lấy 2 khóa chính của 2 bảng phân quyền và group để tạo khóa chính',
  `groups_id` int(10) unsigned NOT NULL COMMENT 'lấy 2 khóa chính của 2 bảng phân quyền và group để tạo khóa chính',
  `value` tinyint(4) NOT NULL COMMENT '1: được cấp quyền ,0 : không được cấp quyền',
  KEY `list_permissions_id` (`list_permissions_id`),
  KEY `groups_id` (`groups_id`),
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`list_permissions_id`) REFERENCES `list_permissions` (`id`),
  CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên sản phẩm',
  `price_sale` int(10) NOT NULL COMMENT 'Giá bán ra',
  `price_entered` int(10) NOT NULL COMMENT 'Giá nhập vào',
  `price_commercial` int(10) DEFAULT NULL,
  `quantity` int(10) NOT NULL COMMENT 'số lượng tồn kho',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci COMMENT 'Miểu tả ',
  `categories_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tối giản link ',
  `count_views` int(10) DEFAULT NULL COMMENT 'Số lượt xem sản phẩm',
  `status` tinyint(4) DEFAULT NULL COMMENT 'Hiển thị chức năng là đã xóa hay chưa',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `categories_id` (`categories_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('11', 'Mac2017', '33', '88', '33', '33', 'https://tiki.vn/macbook-imac/c2458', 'core i5', '3', 'localhost:8080/macbook-imac/c2458', '3', '1', '2019-07-17 17:43:00', '2019-07-17 17:43:00');
INSERT INTO `products` VALUES ('12', 'mac', '22', '22', '22', '80', 'https://tiki.vn/macbook-imac/c2458', 'ram 4G', '3', 'localhost:8080/macbook-imac/c2458', '22', '2', '2019-07-17 17:44:00', '2019-07-17 17:44:00');
INSERT INTO `products` VALUES ('14', 'vòng', '100', '100', '100', '99', '/.../...??', 'Vòng nữ', '5', '.../...url', '101', '1', '2019-07-17 17:45:00', '2019-07-17 17:45:00');
INSERT INTO `products` VALUES ('17', 'ab7', '666', '667', '66', '66', 'abcc', 'asd', '2', '.../...url', '1', '1', '2024-07-17 18:15:00', '2024-07-17 18:15:00');
INSERT INTO `products` VALUES ('18', 'X99', '2', '2', '2', '22', 'zzzz222', 'z2', '6', '', '2', '1', '2019-07-18 16:02:55', '2019-07-18 16:02:00');
INSERT INTO `products` VALUES ('19', 'r', '4', '4', '4', '4', '4', '4', '4', '4', '4', '1', '2019-07-18 16:48:24', '2019-07-18 16:48:27');
INSERT INTO `products` VALUES ('21', 'b', '8', '9', '8', '8', '8', '9999999', '3', '8', '8', '1', '2019-07-18 16:49:03', '2019-07-18 16:49:00');
INSERT INTO `products` VALUES ('23', 'c', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2019-07-18 17:10:25', '2019-07-18 17:10:28');
INSERT INTO `products` VALUES ('24', 'add', '2', '2', '2', '22', '', 'adddd', '3', '', null, null, '2019-07-19 00:10:00', '2019-07-19 00:10:00');
INSERT INTO `products` VALUES ('25', 'add', '7', '7', '7', '7', '7', '7', '5', '7', '7', '7', '2019-07-19 00:18:00', '2019-07-19 00:18:00');
INSERT INTO `products` VALUES ('26', 'ko hiểu', '1', '1', '1', '1', '1', '2', '2', '1', '1', '1', '2019-07-19 00:22:00', '2019-07-19 00:22:00');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên',
  `lastname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Họ và tên đệm',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tài khoản đăng nhập ',
  `pass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mật khẩu',
  `gender` tinyint(4) DEFAULT NULL COMMENT 'Giới tình',
  `birthday` date DEFAULT NULL COMMENT 'Sinh nhật',
  `avatar` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Link ảnh đại diện',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'chuỗi xác nhận tài khoản',
  `status` tinyint(4) NOT NULL COMMENT 'Trạng Thái',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'thời gian tạo tài khoản',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời gian cập nhập tài khoản',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'thời gian xóa tài khoản',
  `groups_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_id` (`groups_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('20', 'Tạ Văn ', 'Chung', 'chung@gmail.com', 'chung', '$2y$10$rrKVlBc6neFcOAfBFGcV1OC8l1YwAk5L.CEbtICMTMni/SEBFFrfG', '0', '2003-07-16', '', '', '0', '2019-07-16 13:22:27', '2019-07-16 13:22:27', null, '6');
INSERT INTO `users` VALUES ('21', 'Nguyễn ', 'Việt Long', 'long@gmail.com', 'long', '$2y$10$UQx2bo6jLlcxhleGI8kIGuYaIaiLYJecKfZkAPX5CF8cUex6aJ1K2', '0', '1996-06-10', '', '4535323', '0', '2019-07-16 13:23:30', '2019-07-16 13:23:30', null, '3');
INSERT INTO `users` VALUES ('22', 'Nguyễ', 'Tất Vinh', 'vinh@gmail.com', 'vinh', '$2y$10$9TDOTBhFMSPMxgKfpAFrWOucv2CMam1Oq1RFYZUkappQFOSee7ACm', '0', '1999-09-16', '', '', '0', '2019-07-16 13:37:17', '2019-07-16 13:37:17', null, '6');
INSERT INTO `users` VALUES ('23', 'Phạm Thị', 'Bích Thảo', 'bthao@gmail.com', 'bthao', '$2y$10$8Ak5VlUmswDMc9CnyMp4weCGA1tvFaZtnw/jv8MLqsgRvVDuN.7Vi', '1', '1997-09-01', '', '197', '0', '2019-07-16 13:39:47', '2019-07-16 13:39:47', null, '6');
INSERT INTO `users` VALUES ('24', 'Nguyễn', 'Kim', 'duc@gmail.com', 'admin123', '$2y$10$5gAQKoYiOuXOsmS2a7xfJ.rbwy0hThXyKRsljv8Ou4X7a9MfMWlEW', '0', '2016-06-05', 'Kim', '', '0', '2019-07-16 14:31:14', '2019-07-16 14:31:14', null, '5');
INSERT INTO `users` VALUES ('27', 'Nguyễn ', 'Tiến Đạt', 'dat09@gmail.com', 'dat123', '$2y$10$IlGxMC1QW8v6vhf7cuAlPuTcwQf2HkXOIrHdpNn4M/r/ukijJD76y', '0', '1997-03-13', 'Image Pasted at 2019-7-17 08-57.png', null, '1', '2019-07-17 10:24:59', '2019-07-17 10:24:59', null, '6');
INSERT INTO `users` VALUES ('28', 'Hoàng', 'Tâm Anh', 'tamptit2016@gmail.com', 'tam', '$2y$10$nfIRd6vozJIkpGiOduySMe93m0DGD.KtX7U3qMqPkR0QsNASJVE6u', '0', '2001-09-09', 'tam.jpg', null, '0', '2019-07-17 11:26:02', '2019-07-17 11:26:02', null, '4');
INSERT INTO `users` VALUES ('29', 's', 's', 'quang.tavan@vietis.com.vn', 'admin', '$2y$10$jpYM20jJVC.OV3STU26sEONxHmpf8GJDo/N0it91oUGMOtXKogAlq', '0', '2000-01-18', '', null, '0', '2019-07-17 16:51:56', '2019-07-17 16:51:56', null, '3');
INSERT INTO `users` VALUES ('30', 'zz', 'zz', 'z2016@gmail.com', 'zzz', '$2y$10$TliKYu11A6yeQwXSOP7LO.9R8F.q8oB5DOisVWYWqfxbowkJNIp8y', '0', '2000-11-20', '', null, '0', '2019-07-18 16:00:12', '2019-07-18 16:00:12', null, '7');
INSERT INTO `users` VALUES ('31', 'add U', 'U', 'U16@gmail.com', 'u', '$2y$10$mDz/OTznSrB4HCQ8AZf5n.9UztHRoCMh3pzPxQhDgR7MxjrlgzMua', '0', '2001-01-20', '', null, '0', '2019-07-18 16:21:57', '2019-07-18 16:21:57', null, '3');
