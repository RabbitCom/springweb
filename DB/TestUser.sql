/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50545
Source Host           : 127.0.0.1:3306
Source Database       : nezha_test

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2017-07-26 16:34:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_test
-- ----------------------------
DROP TABLE IF EXISTS `user_test`;
CREATE TABLE `user_test` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_test
-- ----------------------------
INSERT INTO `user_test` VALUES ('1', 'nezha', '111111', '13203977736');
