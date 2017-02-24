/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : park

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-12-13 10:02:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for other_invoice
-- ----------------------------
DROP TABLE IF EXISTS `other_invoice`;
CREATE TABLE `other_invoice` (
  `invoiceId` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceNo` varchar(32) DEFAULT NULL COMMENT '流水号（和订单流水相同）',
  `invoiceServiceType` varchar(16) NOT NULL COMMENT '发票业务类型',
  `invoiceServiceId` int(11) NOT NULL COMMENT '发票业务标识',
  `invoiceHeader` varchar(100) DEFAULT NULL COMMENT '发票抬头	公司或者个人名称',
  `invoiceContent` text COMMENT '发票内容',
  `invoiceMoney` decimal(10,2) DEFAULT NULL COMMENT '发票金额',
  `invoiceRemark` varchar(255) DEFAULT NULL COMMENT '发票内容备注',
  `invoiceOpenState` varchar(1) DEFAULT NULL COMMENT '发票已开状态 1：是  2：否',  //【新】
  `openTime` varchar(20) DEFAULT NULL COMMENT '开票时间',                          //【新】
  `invoiceState` varchar(1) DEFAULT NULL COMMENT '领取状态	1：已领取，2：未领取',
  `printTime` varchar(20) DEFAULT NULL COMMENT '打印时间',
  `createTime` varchar(20) DEFAULT NULL COMMENT '登记时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`invoiceId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='发票登记表';
