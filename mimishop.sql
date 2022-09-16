/*
 Navicat Premium Data Transfer

 Source Server         : DataTest
 Source Server Type    : MySQL
 Source Server Version : 50536
 Source Host           : localhost:3306
 Source Schema         : mimishop

 Target Server Type    : MySQL
 Target Server Version : 50536
 File Encoding         : 65001

 Date: 02/09/2022 15:45:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'c984aed014aec7623a54f0591da07a85fd4b762d');
INSERT INTO `admin` VALUES (2, 'xiaoxin', '9cf4ad06d5d6eb16930bdcb1136ca758887d6973');

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info`  (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_price` int(11) NULL DEFAULT NULL,
  `p_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_number` int(11) NULL DEFAULT NULL,
  `type_id` int(11) NULL DEFAULT NULL,
  `p_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`p_id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  CONSTRAINT `product_info_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `product_type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES (3, '红米Note4X', '5.5英寸 绿色 4GB内存 64GB闪存', 1299, 'hmNote4X.jpg', 499, 1, '2022-06-19');
INSERT INTO `product_info` VALUES (5, '红米4X', '5英寸 黑色 3GB内存 32GB闪存', 899, 'hm4X.jpg', 500, 1, '2018-01-08');
INSERT INTO `product_info` VALUES (6, '小米平板3', '7.9英寸 金色 4GB内存 64GB闪存', 1499, 'xmPad3.jpg', 500, 2, '2018-01-09');
INSERT INTO `product_info` VALUES (7, '小米Air12', '12.5英寸 银色 4GB内存 128GB闪存', 3599, 'xmAir12.jpg', 500, 2, '2018-01-18');
INSERT INTO `product_info` VALUES (8, '小米Air13', '13.3英寸 银色 8GB内存 256GB闪存', 4999, 'xmAir13.jpg', 500, 2, '2018-01-17');
INSERT INTO `product_info` VALUES (9, '小米Pro', '15.6英寸 灰色 16GB内存 256GB闪存', 6999, 'xmPro.jpg', 500, 2, '2018-01-16');
INSERT INTO `product_info` VALUES (10, '小米电视4', '49英寸 原装LG屏 3840×2160 真4K', 3299, 'xmTV4-49.jpg', 500, 3, '2018-01-15');
INSERT INTO `product_info` VALUES (11, '小米电视4', '55英寸 原装三星屏 3840×2160 真4K', 3999, 'xmTV4-55.jpg', 500, 3, '2018-01-13');
INSERT INTO `product_info` VALUES (12, '小米电视4', '65英寸 原装三星屏 3840×2160 真4K', 8999, 'xmTV4-65.jpg', 500, 3, '2018-01-22');
INSERT INTO `product_info` VALUES (13, '小米电视4A', '43英寸 FHD全高清屏 1920*1080', 1999, 'xmTV4A-43.jpg', 500, 3, '2018-01-11');
INSERT INTO `product_info` VALUES (14, '小米电视4A', '49英寸 FHD全高清屏 1920*1080', 2299, 'xmTV4A-49.jpg', 500, 3, '2018-01-21');
INSERT INTO `product_info` VALUES (15, '小米MIX2', '全陶瓷 黑色 8GB内存 128GB闪存', 4699, 'xmMIX2.jpg', 500, 1, '2018-04-01');
INSERT INTO `product_info` VALUES (16, '小米Note3', '全网通 蓝色 6GB内存 64GB闪存', 2499, 'xmNote3.jpg', 500, 1, '2018-03-01');
INSERT INTO `product_info` VALUES (17, '小米6', '玻璃金属 白色 6GB内存 128GB闪存', 2899, 'xm6.jpg', 500, 1, '2018-02-01');
INSERT INTO `product_info` VALUES (21, '宝马550i', '8888', 9999, '35390ae589d44ce2abeadce9f1bf8c38.jpg', 10, 1, NULL);

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES (1, '手机');
INSERT INTO `product_type` VALUES (2, '电脑');
INSERT INTO `product_type` VALUES (3, '电视');

SET FOREIGN_KEY_CHECKS = 1;
