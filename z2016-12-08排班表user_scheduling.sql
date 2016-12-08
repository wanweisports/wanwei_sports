/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : park

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-12-08 10:47:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_scheduling
-- ----------------------------
DROP TABLE IF EXISTS `user_scheduling`;
CREATE TABLE `user_scheduling` (
  `schedulingId` int(11) NOT NULL AUTO_INCREMENT,
  `operatorId` varchar(32) DEFAULT NULL COMMENT '登录帐号',
  `date` varchar(20) DEFAULT NULL COMMENT '排班日期',
  `startTime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `endTime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `schedulingJob` varchar(255) DEFAULT NULL COMMENT '工作内容',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`schedulingId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='排班表';
