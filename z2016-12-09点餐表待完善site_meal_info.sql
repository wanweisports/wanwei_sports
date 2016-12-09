/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : park

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-12-09 14:01:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for site_meal_info
-- ----------------------------
DROP TABLE IF EXISTS `site_meal_info`;
CREATE TABLE `site_meal_info` (
  `mealId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`mealId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点餐信息';

-- ----------------------------
-- Records of site_meal_info
-- ----------------------------
