/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 60011
Source Host           : 127.0.0.1:3306
Source Database       : park

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2016-12-10 18:54:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for site_meal_info
-- ----------------------------
DROP TABLE IF EXISTS `site_meal_info`;
CREATE TABLE `site_meal_info` (
  `mealId` int(11) NOT NULL AUTO_INCREMENT,
  `mealType` varchar(32) DEFAULT NULL COMMENT '订餐类型（现在就一种）',
  `mealCount` int(11) DEFAULT NULL COMMENT '点餐份数',
  `mealDate` varchar(20) DEFAULT NULL COMMENT '点餐时间(与场地时间表有关系)',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `memberId` int(11) DEFAULT NULL COMMENT '会员老师id',
  `mealOpName` varchar(32) DEFAULT NULL COMMENT '订餐人',
  `mealOpMobile` varchar(16) DEFAULT NULL COMMENT '订餐手机号',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`mealId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点餐信息';
