/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 60011
Source Host           : 127.0.0.1:3306
Source Database       : park

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2016-12-04 13:11:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for member_site_sign
-- ----------------------------
DROP TABLE IF EXISTS `member_site_sign`;
CREATE TABLE `member_site_sign` (
  `signId` int(11) NOT NULL AUTO_INCREMENT,
  `signMemberCardNo` varchar(32) DEFAULT NULL COMMENT '签到的会员卡号',
  `signName` varchar(32) DEFAULT NULL COMMENT '签到人',
  `signMobile` varchar(16) DEFAULT NULL COMMENT '签到人手机',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `signType` varchar(1) DEFAULT NULL COMMENT '签到类型（1：会员  2：散客）',
  `reserveTimeId` int(11) DEFAULT NULL COMMENT '场地预定时间id（不能重复签到）',
  `signDate` varchar(20) DEFAULT NULL COMMENT '签到日期(年月日)',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`signId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='会员场地签到表';
