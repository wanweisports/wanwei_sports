/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : park

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-12-08 14:33:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for system_dict
-- ----------------------------
DROP TABLE IF EXISTS `system_dict`;
CREATE TABLE `system_dict` (
  `dictId` int(9) NOT NULL AUTO_INCREMENT,
  `parentDictId` int(9) DEFAULT NULL,
  `dictName` varchar(32) NOT NULL,
  `dictKey` varchar(16) NOT NULL,
  `dictValue` varchar(32) NOT NULL,
  `dictAdditional` text,
  PRIMARY KEY (`dictId`),
  KEY `AK_Key_2` (`dictName`,`dictKey`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_dict
-- ----------------------------
INSERT INTO `system_dict` VALUES ('1', null, 'BALANCE_SERVICE_TYPE', '10', '注册会员', null);
INSERT INTO `system_dict` VALUES ('2', null, 'BALANCE_SERVICE_TYPE', '11', '会员充值', null);
INSERT INTO `system_dict` VALUES ('3', null, 'BALANCE_SERVICE_TYPE', '12', '升级会员卡', null);
INSERT INTO `system_dict` VALUES ('4', null, 'BALANCE_SERVICE_TYPE', '13', '补办会员卡', null);
INSERT INTO `system_dict` VALUES ('20', null, 'BALANCE_STATUS', '1', '已付全款', null);
INSERT INTO `system_dict` VALUES ('21', null, 'BALANCE_STATUS', '2', '未付款', null);
INSERT INTO `system_dict` VALUES ('22', null, 'BALANCE_STATUS', '3', '部分付款', null);
INSERT INTO `system_dict` VALUES ('30', null, 'STATUS', '1', '有效', null);
INSERT INTO `system_dict` VALUES ('31', null, 'STATUS', '2', '无效', null);
INSERT INTO `system_dict` VALUES ('40', null, 'SEX', '1', '男', null);
INSERT INTO `system_dict` VALUES ('41', null, 'SEX', '2', '女', null);
INSERT INTO `system_dict` VALUES ('50', null, 'BALANCE_STYLE', '1', '现金', null);
INSERT INTO `system_dict` VALUES ('51', null, 'BALANCE_STYLE', '2', '支付宝', null);
INSERT INTO `system_dict` VALUES ('52', null, 'BALANCE_STYLE', '3', '微信', null);
INSERT INTO `system_dict` VALUES ('53', null, 'BALANCE_SERVICE_TYPE', '20', '教师补办会员卡', null);
INSERT INTO `system_dict` VALUES ('54', null, 'BALANCE_SERVICE_TYPE', '30', '学生补办会员卡', null);
INSERT INTO `system_dict` VALUES ('55', null, 'BALANCE_SERVICE_TYPE', '100', '场地预订', null);
INSERT INTO `system_dict` VALUES ('56', null, 'BALANCE_SERVICE_TYPE', '200', '包场预订', null);
INSERT INTO `system_dict` VALUES ('57', null, 'BALANCE_SERVICE_TYPE', '220', '应收款', null);
INSERT INTO `system_dict` VALUES ('58', null, 'BALANCE_SERVICE_TYPE', '300', '商品消费', null);
