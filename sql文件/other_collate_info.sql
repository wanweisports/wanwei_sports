/*
Navicat MySQL Data Transfer

Source Server         : 106.14.72.151
Source Server Version : 50635
Source Host           : 106.14.72.151:3306
Source Database       : park

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-02-26 20:46:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for other_collate_info
-- ----------------------------
DROP TABLE IF EXISTS `other_collate_info`;
CREATE TABLE `other_collate_info` (
  `collateId` int(11) NOT NULL AUTO_INCREMENT,
  `collateType` varchar(1) DEFAULT NULL COMMENT '核对类型（1：现金  2：支付宝  3：微信 4：银联 5：支票）',
  `oldAmount` decimal(10,2) DEFAULT NULL COMMENT '计算金额',
  `collateCountNum` varchar(10) DEFAULT NULL COMMENT '核对时间类型',
  `collateAmount` decimal(10,2) DEFAULT NULL COMMENT '核对金额',
  `collateStatus` varchar(1) DEFAULT NULL COMMENT '核对状态（1：无误  2：有误）',
  `collateRemark` varchar(255) DEFAULT NULL COMMENT '备注',
  `collateStartTime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `collateEndTime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`collateId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='核对财务表';
