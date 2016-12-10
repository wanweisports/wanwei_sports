/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 60011
Source Host           : 127.0.0.1:3306
Source Database       : park

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2016-12-10 17:42:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(32) DEFAULT NULL COMMENT '订单号',
  `operatorId` varchar(32) DEFAULT NULL COMMENT '登录帐号',
  `memberId` int(11) DEFAULT NULL COMMENT '会员id（0为散客）',
  `orderServiceType` varchar(10) DEFAULT NULL COMMENT '订单业务类型（1. 场地   2. 商品   3.包场）',
  `orderStatus` varchar(1) DEFAULT NULL COMMENT '订单状态（1：已全部完成 2：未完成 3：已取消）',
  `payStatus` varchar(1) DEFAULT NULL COMMENT '支付状态（1：已支付  2：未支付  3：部分支付）',
  `payType` varchar(1) DEFAULT NULL COMMENT '支付类型',
  `payTime` varchar(20) DEFAULT NULL COMMENT '支付时间',
  `orderSumPrice` decimal(10,2) DEFAULT NULL COMMENT '订单应付总价',
  `paySumPrice` decimal(10,2) DEFAULT NULL COMMENT '支付总价',
  `subAmount` decimal(10,2) DEFAULT NULL COMMENT '优惠金额(元)',
  `additionalPrice` decimal(10,2) DEFAULT NULL COMMENT '附加费用',
  `checkNo` varchar(64) DEFAULT NULL COMMENT '支票号',
  `orderRemark` text COMMENT '订单描述',
  `sumCount` int(11) DEFAULT NULL COMMENT '总次数',
  `payCount` int(11) DEFAULT NULL COMMENT '支付次数',
  `useCount` int(11) DEFAULT NULL COMMENT '已使用次数',
  `orderSumCount` int(11) DEFAULT NULL COMMENT '子订单商品数量的合计数量', //【新】
  `orderDiscount` int(11) DEFAULT NULL COMMENT '当时的商品折扣（0-100）',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('7', '20161203145853', null, '1', '200', '2', '1', '2', '2016-12-03 15:00:13', '300.00', '200.00', '100.00', '100.00', '11111', 'èå¸æº', '6', '2', '104', null, null, '2016-12-03 14:58:53', '2016-12-03 15:00:13', '1');
INSERT INTO `order_info` VALUES ('8', '20161203150540', null, '1', '200', '2', '1', '2', '2016-12-03 15:05:55', '300.00', '200.00', '100.00', '100.00', '11111', 'èå¸æº', '54', '20', '0', null, null, '2016-12-03 15:05:40', '2016-12-03 15:05:55', '1');
