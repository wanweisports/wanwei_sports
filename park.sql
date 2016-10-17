/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 60011
Source Host           : 127.0.0.1:3306
Source Database       : park

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2016-10-17 22:50:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for good_info
-- ----------------------------
DROP TABLE IF EXISTS `good_info`;
CREATE TABLE `good_info` (
  `goodId` int(11) NOT NULL AUTO_INCREMENT,
  `goodNo` varchar(32) NOT NULL COMMENT '商品编号',
  `goodName` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `goodPic` varchar(255) DEFAULT NULL COMMENT '商品图片地址',
  `goodType` varchar(16) DEFAULT NULL COMMENT '商品类型',
  `goodMoneyType` varchar(1) DEFAULT NULL COMMENT '计费方式（1. 计次收费  2. 计时收费）',
  `goodPrice` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goodDiscount` varchar(16) DEFAULT NULL COMMENT '商品折扣	1：无折扣，2：会员折扣',
  `goodStatus` varchar(1) DEFAULT NULL COMMENT '商品状态	1：在售，2：预售，3：下架',
  `goodCount` int(11) DEFAULT NULL COMMENT '商品库存量',
  `goodRemark` varchar(255) DEFAULT NULL COMMENT '商品备注',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`goodId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of good_info
-- ----------------------------
INSERT INTO `good_info` VALUES ('1', 'F0001', '农夫山泉', null, null, '1', '2.00', '1', '1', '1', '矿泉水', '2016-10-11 15:16:37', '2016-10-11 15:17:08', '1');
INSERT INTO `good_info` VALUES ('2', '1', '3', '/photo/imgs/09869d87ae5a4ce0ad9da7011b9b3ef4.jpg', null, '2', '2.00', '2', '1', '1', '5', '2016-10-12 13:11:01', '2016-10-12 14:15:49', '1');

-- ----------------------------
-- Table structure for member_card
-- ----------------------------
DROP TABLE IF EXISTS `member_card`;
CREATE TABLE `member_card` (
  `cardId` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL COMMENT '会员id',
  `cardNo` varchar(32) DEFAULT NULL COMMENT '会员卡编号	唯一的',
  `cardBalance` decimal(10,2) DEFAULT NULL COMMENT '会员卡余额',
  `cardDeadline` varchar(32) DEFAULT NULL COMMENT '会员卡截止日期 0：无限制',
  `cardStatus` varchar(1) NOT NULL DEFAULT '1' COMMENT '1：有效，2：失效',
  `cardTypeId` int(11) NOT NULL COMMENT '会员卡类型ID',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `cardRemark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`cardId`),
  UNIQUE KEY `cardNo_Unique` (`cardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员卡信息表';

-- ----------------------------
-- Records of member_card
-- ----------------------------
INSERT INTO `member_card` VALUES ('2', '4', '761715', '12.00', '0', '1', '2', '2016-10-10 10:34:50', '2016-10-10 14:58:24', '13', '1');
INSERT INTO `member_card` VALUES ('3', '5', '922444', '21.00', '2017-04-10', '1', '3', '2016-10-10 11:50:52', '2016-10-10 13:45:54', '1', '1');
INSERT INTO `member_card` VALUES ('4', '6', '561963', '8.00', '2017-04-10', '1', '3', '2016-10-10 11:53:23', '2016-10-10 14:02:27', '1', '1');
INSERT INTO `member_card` VALUES ('5', '7', '104561', '2.00', '0', '1', '2', '2016-10-10 18:35:45', null, '1', '1');
INSERT INTO `member_card` VALUES ('6', '8', '461136', '2.00', '0', '1', '2', '2016-10-10 18:37:35', null, '1', '1');

-- ----------------------------
-- Table structure for member_card_type
-- ----------------------------
DROP TABLE IF EXISTS `member_card_type`;
CREATE TABLE `member_card_type` (
  `cardTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `cardTypeName` varchar(16) NOT NULL COMMENT '类型名称	至尊卡，金卡',
  `cardType` varchar(1) NOT NULL COMMENT '会员卡支付类型（1.预付类型   2.记账类型）',
  `cardTypeStatus` varchar(1) NOT NULL DEFAULT '1' COMMENT '类型状态	1：可用，2：锁定',
  `cardTypeMonth` varchar(32) DEFAULT NULL COMMENT '类别周期月限制（月）	0：不限制',
  `cardTypeWeek` varchar(32) DEFAULT NULL COMMENT '1-7：周一~周日',
  `cardTypeTimeStart` varchar(64) DEFAULT NULL COMMENT '类别开始时间许可',
  `cardTypeTimeEnd` varchar(64) DEFAULT NULL COMMENT '类别结束时间许可',
  `cardTypeAhead` int(11) DEFAULT NULL COMMENT '可提前预订的时间',
  `cardTypeMoney` decimal(10,2) NOT NULL COMMENT '类别价格（会费）',
  `cardTypeCredit` decimal(10,2) DEFAULT NULL COMMENT '信用额度		可以抵账的额度',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `cardTypeDiscount` int(11) DEFAULT NULL COMMENT '类别折扣	0-100',
  PRIMARY KEY (`cardTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员卡类型表';

-- ----------------------------
-- Records of member_card_type
-- ----------------------------
INSERT INTO `member_card_type` VALUES ('2', '金卡', '1', '1', '0', '1,2,3,4,5,6,7', '08:00,08:00,08:00,08:00,08:00,08:00,08:00', '20:00,20:00,20:00,20:00,20:00,20:00,20:00', '0', '10.00', '0.00', '2016-10-10 10:34:34', null, '1', '10');
INSERT INTO `member_card_type` VALUES ('3', '真金卡', '1', '1', '6', '1,2,3,4,5,6,7', '08:00,08:00,08:00,08:00,08:00,08:00,08:00', '20:00,20:00,20:00,20:00,20:00,20:00,20:00', '10', '20.00', '0.00', '2016-10-10 13:44:55', null, '1', '20');
INSERT INTO `member_card_type` VALUES ('4', '大撒旦', '2', '1', '0', '1,2,3,4,5,6,7', '08:00,08:00,08:00,08:00,08:00,08:00,08:00', '20:00,20:00,20:00,20:00,20:00,20:00,20:00', '0', '0.00', null, '2016-10-10 16:25:09', null, '1', '0');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `orderDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `itemId` int(11) DEFAULT NULL COMMENT '商品id',
  `itemName` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `itemPrice` decimal(10,2) DEFAULT NULL COMMENT '商品支付价格',
  `itemStartTime` varchar(20) DEFAULT NULL COMMENT '商品开始时间',
  `itemEndTime` varchar(20) DEFAULT NULL COMMENT '商品结束时间',
  `itemRemark` text COMMENT '商品描述',
  `itemMoneyType` varchar(1) DEFAULT NULL COMMENT '当时的计费方式（1. 计次收费  2. 计时收费）',
  `itemDiscount` int(11) DEFAULT NULL COMMENT '当时的商品折扣（0-100）',
  PRIMARY KEY (`orderDetailId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('13', '10', '1', '羽毛球万能的场地', '50.00', '10:00', '11:00', null, '2', null);
INSERT INTO `order_detail` VALUES ('14', '10', '1', '羽毛球万能的场地', '50.00', '12:00', '13:00', null, '2', null);
INSERT INTO `order_detail` VALUES ('15', '10', '2', '篮球场地2', '1.00', '13:00', '14:00', null, '2', null);
INSERT INTO `order_detail` VALUES ('16', '11', '1', '羽毛球万能的场地', '50.00', '10: 00', '11: 00', null, '2', null);
INSERT INTO `order_detail` VALUES ('17', '12', '1', '羽毛球万能的场地', '50.00', '09:00', '10:00', null, '2', null);
INSERT INTO `order_detail` VALUES ('18', '12', '1', '羽毛球万能的场地', '50.00', '10:00', '11:00', null, '2', null);
INSERT INTO `order_detail` VALUES ('19', '13', '1', '羽毛球万能的场地', '50.00', '08:00', '09:00', null, '2', null);
INSERT INTO `order_detail` VALUES ('20', '14', '1', '羽毛球万能的场地', '50.00', '08:00', '09:00', null, '2', null);

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
  `orderStatus` varchar(1) DEFAULT NULL COMMENT '订单状态',
  `payStatus` varchar(1) DEFAULT NULL COMMENT '支付状态（1：已支付  2：未支付  3：部分支付）',
  `payType` varchar(1) DEFAULT NULL COMMENT '支付类型',
  `payTime` varchar(20) DEFAULT NULL COMMENT '支付时间',
  `orderSumPrice` decimal(10,2) DEFAULT NULL COMMENT '订单应付总价',
  `paySumPrice` decimal(10,2) DEFAULT NULL COMMENT '支付总价',
  `subAmount` decimal(10,2) DEFAULT NULL COMMENT '优惠金额(元)',
  `additionalPrice` decimal(10,2) DEFAULT NULL COMMENT '附加费用',
  `checkNo` varchar(64) DEFAULT NULL COMMENT '支票号',
  `orderRemark` text COMMENT '订单描述',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('10', '20161013180443', null, '9', '1', null, '1', '1', null, '101.00', null, null, null, null, null, '2016-10-13 18:04:43', null, '1');
INSERT INTO `order_info` VALUES ('11', '20161016214601', null, '4', '1', null, '2', null, null, '50.00', null, null, null, null, null, '2016-10-16 21:46:01', null, '1');
INSERT INTO `order_info` VALUES ('12', '20161017214245', null, '0', '1', null, '2', null, null, '100.00', null, null, null, null, null, '2016-10-17 21:42:45', null, '1');
INSERT INTO `order_info` VALUES ('13', '20161017214356', null, '0', '1', null, '2', null, null, '50.00', null, null, null, null, null, '2016-10-17 21:43:56', null, '1');
INSERT INTO `order_info` VALUES ('14', '20161017214544', null, '0', '1', null, '1', '1', '2016-10-17 22:33:55', '100.00', '100.00', '10.00', '10.00', '110119ABC', null, '2016-10-17 21:45:44', '2016-10-17 22:33:55', '1');

-- ----------------------------
-- Table structure for other_balance
-- ----------------------------
DROP TABLE IF EXISTS `other_balance`;
CREATE TABLE `other_balance` (
  `balanceId` int(11) NOT NULL AUTO_INCREMENT,
  `balanceNo` varchar(32) NOT NULL COMMENT '流水号',
  `balanceServiceType` varchar(16) NOT NULL COMMENT '业务类型',
  `balanceServiceId` int(11) NOT NULL COMMENT '业务标识',
  `balanceServiceName` varchar(100) DEFAULT NULL COMMENT '业务项名称',
  `balanceType` varchar(1) DEFAULT NULL COMMENT '类型 1：充值  2：消费  3：其他',
  `balanceStyle` varchar(1) DEFAULT NULL COMMENT '支付方式 1：现金  2：支付宝  3：微信',
  `oldAmount` decimal(10,2) DEFAULT NULL COMMENT '原始金额（充值金额|升级金额|补办金额）',
  `realAmount` decimal(10,2) DEFAULT NULL COMMENT '实际价格（最终支付金额）',
  `subAmount` decimal(10,2) DEFAULT NULL COMMENT '优惠金额',
  `givingAmount` decimal(10,2) DEFAULT NULL COMMENT '赠送金额',
  `divBalance` decimal(10,2) DEFAULT '0.00' COMMENT '剩余未付金额',
  `balanceStatus` varchar(1) DEFAULT NULL COMMENT '订单状态 (充值)1：已收全款  2：未付款  3：部分收款  (消费)1：已支付  2：未支付',
  `serviceDate` varchar(20) DEFAULT NULL COMMENT '业务日期',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`balanceId`),
  UNIQUE KEY `balanceNo_Unique` (`balanceNo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='收支流水表';

-- ----------------------------
-- Records of other_balance
-- ----------------------------
INSERT INTO `other_balance` VALUES ('2', '20161010103450', '10', '2', null, '3', '1', '11.00', '19.00', '2.00', '1.00', null, '1', '2016-10-10 10:34:50', '2016-10-10 10:34:50', null, '1', null);
INSERT INTO `other_balance` VALUES ('3', '20161010115052', '10', '3', null, '3', '1', '11.00', '20.00', '1.00', '0.00', null, '1', '2016-10-10 11:50:52', '2016-10-10 11:50:52', null, '1', null);
INSERT INTO `other_balance` VALUES ('4', '20161010115323', '10', '4', null, '3', '1', '1.00', '10.00', '1.00', '1.00', null, '1', '2016-10-10 11:53:23', '2016-10-10 11:53:23', null, '1', null);
INSERT INTO `other_balance` VALUES ('5', '20161010134526', '12', '4', null, '3', '1', '1.00', '1.00', '0.00', '0.00', null, null, '2016-10-10 13:45:26', '2016-10-10 13:45:26', null, '1', '1');
INSERT INTO `other_balance` VALUES ('6', '20161010134554', '12', '3', null, '3', '1', '1.00', '1.00', '0.00', '10.00', null, null, '2016-10-10 13:45:54', '2016-10-10 13:45:54', null, '1', '1');
INSERT INTO `other_balance` VALUES ('7', '20161010140227', '11', '4', null, '1', '1', '6.00', '6.00', '0.00', '0.00', null, null, '2016-10-10 14:02:27', '2016-10-10 14:02:27', null, '1', '维权');
INSERT INTO `other_balance` VALUES ('8', '20161010145824', '13', '2', null, '3', '1', '1.00', '1.00', '0.00', '0.00', null, null, '2016-10-10 14:58:24', '2016-10-10 14:58:24', null, '1', '13');
INSERT INTO `other_balance` VALUES ('9', '20161010183545', '10', '5', null, '3', '1', '1.00', '10.00', '1.00', '1.00', null, '1', '2016-10-10 18:35:45', '2016-10-10 18:35:45', null, '1', null);
INSERT INTO `other_balance` VALUES ('10', '20161010183735', '10', '6', null, '3', '0', '1.00', '10.00', '1.00', '1.00', null, '1', '2016-10-10 18:37:35', '2016-10-10 18:37:35', null, '1', null);

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
  `invoiceState` varchar(1) DEFAULT NULL COMMENT '领取状态	1：已领取，2：未领取',
  `createTime` varchar(20) DEFAULT NULL COMMENT '登记时间',
  `printTime` varchar(20) DEFAULT NULL COMMENT '打印时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`invoiceId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='发票登记表';

-- ----------------------------
-- Records of other_invoice
-- ----------------------------
INSERT INTO `other_invoice` VALUES ('2', null, '10', '4', '', '', null, '', '2', '2016-10-10 10:34:55', null, '1');
INSERT INTO `other_invoice` VALUES ('3', null, '10', '5', '', '', null, '', '2', '2016-10-10 11:50:53', null, '1');
INSERT INTO `other_invoice` VALUES ('4', null, '10', '6', '', '', null, '', '2', '2016-10-10 11:53:25', null, '1');
INSERT INTO `other_invoice` VALUES ('5', '20161010183551', '10', '7', '', '', null, '', '2', '2016-10-10 18:35:51', null, '1');
INSERT INTO `other_invoice` VALUES ('6', '20161010183804', '10', '8', '', '', null, '', '2', '2016-10-10 18:38:04', null, '1');

-- ----------------------------
-- Table structure for other_resource
-- ----------------------------
DROP TABLE IF EXISTS `other_resource`;
CREATE TABLE `other_resource` (
  `resourceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `resourceServiceId` int(9) NOT NULL,
  `resourceServiceType` varchar(16) NOT NULL,
  `resourceSeq` int(9) DEFAULT NULL,
  `resourceType` varchar(16) DEFAULT NULL,
  `resourceName` varchar(64) DEFAULT NULL,
  `resourceOriginal` varchar(64) DEFAULT NULL,
  `resourcePath` text,
  `fileSize` int(9) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of other_resource
-- ----------------------------

-- ----------------------------
-- Table structure for park_business
-- ----------------------------
DROP TABLE IF EXISTS `park_business`;
CREATE TABLE `park_business` (
  `businessId` int(11) NOT NULL AUTO_INCREMENT,
  `businessStartTime` varchar(20) DEFAULT NULL COMMENT '营业开始时间',
  `businessEndTime` varchar(20) DEFAULT NULL COMMENT '营业结束时间',
  `businessTimePeriod` varchar(20) DEFAULT NULL COMMENT '营业时间段',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`businessId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='营业时间表';

-- ----------------------------
-- Records of park_business
-- ----------------------------
INSERT INTO `park_business` VALUES ('1', '08:00', '15:00', '1', '2016-10-12 19:41:31', null, '1');

-- ----------------------------
-- Table structure for park_business_period
-- ----------------------------
DROP TABLE IF EXISTS `park_business_period`;
CREATE TABLE `park_business_period` (
  `businessPeriodId` int(11) NOT NULL AUTO_INCREMENT,
  `businessId` int(11) DEFAULT NULL COMMENT '营业时间id',
  `periodStartTime` varchar(20) DEFAULT NULL COMMENT '时间段开始时间',
  `periodEndTime` varchar(20) DEFAULT NULL COMMENT '时间段结束时间',
  PRIMARY KEY (`businessPeriodId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='营业时间段表';

-- ----------------------------
-- Records of park_business_period
-- ----------------------------
INSERT INTO `park_business_period` VALUES ('1', '1', '08:00', '09:00');
INSERT INTO `park_business_period` VALUES ('2', '1', '09:00', '10:00');
INSERT INTO `park_business_period` VALUES ('3', '1', '11:00', '12:00');
INSERT INTO `park_business_period` VALUES ('4', '1', '12:00', '13:00');

-- ----------------------------
-- Table structure for site_info
-- ----------------------------
DROP TABLE IF EXISTS `site_info`;
CREATE TABLE `site_info` (
  `siteId` int(11) NOT NULL AUTO_INCREMENT COMMENT '场地id',
  `siteName` varchar(32) DEFAULT NULL COMMENT '场地名称',
  `siteNo` varchar(32) DEFAULT NULL COMMENT '场地编号	标注唯一',
  `siteRemark` varchar(255) DEFAULT NULL COMMENT '场地备注',
  `siteType` int(11) DEFAULT NULL COMMENT '场地类型ID',
  `siteStatus` varchar(1) DEFAULT NULL COMMENT '场地状态   1：开放   2：关闭',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`siteId`),
  UNIQUE KEY `siteNo_Unique` (`siteNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='场地表';

-- ----------------------------
-- Records of site_info
-- ----------------------------
INSERT INTO `site_info` VALUES ('1', '万能的场地', '646841', '场地1', '1', '1', '2016-10-11 21:10:26', null, '1');
INSERT INTO `site_info` VALUES ('2', '场地2', '888523', '', '2', '1', '2016-10-13 13:06:09', null, '1');

-- ----------------------------
-- Table structure for site_order
-- ----------------------------
DROP TABLE IF EXISTS `site_order`;
CREATE TABLE `site_order` (
  `orderId` int(11) NOT NULL,
  `orderNo` varchar(32) NOT NULL COMMENT '订单编号',
  `orderStatus` varchar(1) DEFAULT NULL COMMENT '订单状态',
  `siteId` int(11) DEFAULT NULL COMMENT '预订的场地编号',
  `orderDate` varchar(20) DEFAULT NULL COMMENT '订单日期',
  `startTime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `endTime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `operatorId` varchar(32) DEFAULT NULL COMMENT '用户帐号',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site_order
-- ----------------------------

-- ----------------------------
-- Table structure for site_reserve
-- ----------------------------
DROP TABLE IF EXISTS `site_reserve`;
CREATE TABLE `site_reserve` (
  `siteReserveId` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) DEFAULT NULL COMMENT '场地id',
  `name` varchar(32) DEFAULT NULL COMMENT '预订者姓名',
  `mobile` varchar(11) DEFAULT NULL COMMENT '预订者手机号',
  `opType` varchar(1) DEFAULT NULL COMMENT '预定者身份（1：会员  2：散客）',
  `siteReserveStatus` varchar(1) DEFAULT NULL COMMENT '场地当前状态（1.已付款  2.未付款   3.已锁定   4.不可预订  5.可预订）',
  `siteDate` varchar(20) DEFAULT NULL COMMENT '场地日期',
  `siteStartTime` varchar(20) DEFAULT NULL COMMENT '时间段（开始时间）',
  `siteEndTime` varchar(20) DEFAULT NULL COMMENT '时间段（结束时间）',
  `reserveType` varchar(1) DEFAULT NULL COMMENT '预定类型（1：PC  2：手机网页  3：打电话）',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `memberId` int(11) DEFAULT NULL COMMENT '会员id',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`siteReserveId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='场地序列图表';

-- ----------------------------
-- Records of site_reserve
-- ----------------------------
INSERT INTO `site_reserve` VALUES ('15', '1', '发送', '11111111111', '1', '1', '2016-10-13', '10:00', '11:00', '1', '2016-10-13 18:04:43', null, '1', '9', '10');
INSERT INTO `site_reserve` VALUES ('16', '1', '发送', '11111111111', '1', '1', '2016-10-13', '12:00', '13:00', '1', '2016-10-13 18:04:43', null, '1', '9', '10');
INSERT INTO `site_reserve` VALUES ('17', '2', '发送', '11111111111', '1', '1', '2016-10-13', '13:00', '14:00', '1', '2016-10-13 18:04:43', null, '1', '9', '10');
INSERT INTO `site_reserve` VALUES ('18', '1', 'asd1', '15110275787', '1', '2', '2016-10-13', '10: 00', '11: 00', '1', '2016-10-16 21:46:01', null, '1', '4', '11');
INSERT INTO `site_reserve` VALUES ('19', '1', '张三', '13051788101', '2', '2', '2016-10-17', '09:00', '10:00', '1', '2016-10-17 21:42:45', null, '1', '0', '12');
INSERT INTO `site_reserve` VALUES ('20', '1', '张三', '13051788101', '2', '2', '2016-10-17', '10:00', '11:00', '1', '2016-10-17 21:42:45', null, '1', '0', '12');
INSERT INTO `site_reserve` VALUES ('21', '1', '张三', '13051788101', '2', '2', '2016-10-17', '08:00', '09:00', '1', '2016-10-17 21:43:56', null, '1', '0', '13');
INSERT INTO `site_reserve` VALUES ('22', '1', '张三', '13051788101', '2', '1', '2016-10-18', '08:00', '09:00', '1', '2016-10-17 21:45:44', null, '1', '0', '14');

-- ----------------------------
-- Table structure for site_sport
-- ----------------------------
DROP TABLE IF EXISTS `site_sport`;
CREATE TABLE `site_sport` (
  `sportId` int(11) NOT NULL AUTO_INCREMENT COMMENT '场地类型id',
  `sportName` varchar(32) DEFAULT NULL COMMENT '类型名称	羽毛球场，篮球场。。。',
  `sportMoney` decimal(10,2) DEFAULT NULL COMMENT '类型价格，单价	元',
  `sportDeposit` decimal(10,2) DEFAULT NULL COMMENT '类型预订押金	元',
  `startTime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `endTime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `sportStatus` varchar(1) DEFAULT NULL COMMENT '场地类型状态  1：开放   2：关闭',
  `sportCustom` varchar(1) DEFAULT NULL COMMENT '可细化时间设置单价（1：是   2：否）',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`sportId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='场地类型表';

-- ----------------------------
-- Records of site_sport
-- ----------------------------
INSERT INTO `site_sport` VALUES ('1', '羽毛球', '50.00', '100.00', '08:00', '11:00', '1', null, '2016-10-11 21:07:04', null, '1');
INSERT INTO `site_sport` VALUES ('2', '篮球', '1.00', '1.00', '10:00', '13:00', '1', null, '2016-10-13 13:05:48', null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `menuId` varchar(16) NOT NULL COMMENT '菜单标识',
  `parentMenuId` varchar(16) DEFAULT NULL COMMENT '父菜单标识',
  `menuName` varchar(32) NOT NULL COMMENT '菜单名称',
  `menuCode` varchar(32) DEFAULT NULL COMMENT '菜单代码',
  `menuURL` text NOT NULL COMMENT '菜单链接',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of system_menu
-- ----------------------------

-- ----------------------------
-- Table structure for system_privilege
-- ----------------------------
DROP TABLE IF EXISTS `system_privilege`;
CREATE TABLE `system_privilege` (
  `privilegeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限标识',
  `privilegeName` varchar(32) NOT NULL COMMENT '权限名称',
  `privilegeStatus` varchar(16) NOT NULL COMMENT '权限状态',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`privilegeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限';

-- ----------------------------
-- Records of system_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for system_privilege_function
-- ----------------------------
DROP TABLE IF EXISTS `system_privilege_function`;
CREATE TABLE `system_privilege_function` (
  `privilegeId` int(11) NOT NULL COMMENT '权限标识',
  `functionId` varchar(16) NOT NULL COMMENT '功能标识',
  PRIMARY KEY (`privilegeId`,`functionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限功能';

-- ----------------------------
-- Records of system_privilege_function
-- ----------------------------

-- ----------------------------
-- Table structure for system_privilege_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_privilege_menu`;
CREATE TABLE `system_privilege_menu` (
  `privilegeId` int(11) NOT NULL COMMENT '权限标识',
  `menuId` varchar(16) NOT NULL COMMENT '菜单标识',
  PRIMARY KEY (`privilegeId`,`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限菜单';

-- ----------------------------
-- Records of system_privilege_menu
-- ----------------------------

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色标识',
  `roleName` varchar(32) NOT NULL COMMENT '角色名称',
  `roleStatus` varchar(16) NOT NULL COMMENT '角色状态',
  `readOnly` varchar(16) NOT NULL COMMENT '只读',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES ('1', '超级管理员', '1', '1', '2016-10-13 10:00:00', null);
INSERT INTO `system_role` VALUES ('2', '会员', '1', '1', '2016-10-13 10:00:00', null);
INSERT INTO `system_role` VALUES ('3', '普通用户', '1', '1', '2016-10-13 10:00:00', null);

-- ----------------------------
-- Table structure for system_role_operator
-- ----------------------------
DROP TABLE IF EXISTS `system_role_operator`;
CREATE TABLE `system_role_operator` (
  `roleId` int(11) NOT NULL COMMENT '角色标识',
  `operatorId` varchar(64) NOT NULL COMMENT '登录账号标识',
  PRIMARY KEY (`roleId`,`operatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of system_role_operator
-- ----------------------------
INSERT INTO `system_role_operator` VALUES ('1', '123456');
INSERT INTO `system_role_operator` VALUES ('2', '864422');

-- ----------------------------
-- Table structure for system_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `system_role_privilege`;
CREATE TABLE `system_role_privilege` (
  `roleId` int(11) NOT NULL COMMENT '角色标识',
  `privilegeId` int(11) NOT NULL COMMENT '权限标识',
  PRIMARY KEY (`roleId`,`privilegeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限';

-- ----------------------------
-- Records of system_role_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for user_member
-- ----------------------------
DROP TABLE IF EXISTS `user_member`;
CREATE TABLE `user_member` (
  `memberId` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `operationId` varchar(32) DEFAULT NULL COMMENT '用户帐号',
  `memberName` varchar(16) DEFAULT NULL COMMENT '会员名称	汉字',
  `memberType` varchar(1) DEFAULT '1' COMMENT '支付类型 1.预付类型   2.记账类型',
  `memberMobile` varchar(16) DEFAULT NULL COMMENT '会员手机号	11位手机号',
  `memberMobile2` varchar(16) DEFAULT NULL COMMENT '会员备用手机号',
  `memberSex` varchar(1) DEFAULT '1' COMMENT '会员性别	1：男，2：女',
  `memberIdcard` varchar(22) DEFAULT NULL COMMENT '会员身份证号	18位身份证号',
  `memberBirthday` varchar(11) DEFAULT NULL COMMENT '会员生日',
  `memberPayPassword` varchar(32) DEFAULT NULL COMMENT '支付密码',
  `memberStatus` varchar(1) DEFAULT '1' COMMENT '会员状态	1：有效，2：锁定',
  `memberAddress` varchar(255) DEFAULT NULL COMMENT '会员联系地址',
  `memberRemark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `tempCardNo` varchar(32) DEFAULT NULL COMMENT '临时会员卡号（第一次注册未绑卡使用）',
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='会员信息表';

-- ----------------------------
-- Records of user_member
-- ----------------------------
INSERT INTO `user_member` VALUES ('4', null, 'asd1', '1', '15110275787', '15110275787', '1', '510603199007307955', '2016-09-03', null, null, 'dsadsa', 'dsadsadsa', '2016-10-10 10:34:01', '2016-10-10 10:34:09', '1', null);
INSERT INTO `user_member` VALUES ('5', null, '范德萨', '1', '15111151111', '15111151111', '2', '510603199007307953', '2016-10-08', null, null, '倒萨', '额我去俄武器', '2016-10-10 11:33:52', null, '1', null);
INSERT INTO `user_member` VALUES ('6', null, '斯蒂芬', '1', '11111111112', '11111111111', '1', '510603101007305555', '2016-10-06', null, null, 'ads', '安德森', '2016-10-10 11:52:56', null, '1', null);
INSERT INTO `user_member` VALUES ('7', null, '我的', '1', '11111111111', '11111111111', '1', '5106031990921231231111', '2016-09-29', null, null, 'a', '啊', '2016-10-10 18:35:11', null, '1', null);
INSERT INTO `user_member` VALUES ('8', null, '低洼', '1', '11111111111', '11111111111', '1', '510603199007302321', '2016-09-29', null, null, '11111111111', '11111111111', '2016-10-10 18:37:22', null, '1', null);
INSERT INTO `user_member` VALUES ('9', '864422', '发送', '1', '11111111111', '11111111111', '1', '511111111111111111', '2016-10-01', null, null, '11111111111', '11111111111', '2016-10-13 10:41:49', null, '1', '864422');

-- ----------------------------
-- Table structure for user_operator
-- ----------------------------
DROP TABLE IF EXISTS `user_operator`;
CREATE TABLE `user_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operatorId` varchar(32) NOT NULL COMMENT '登录帐号',
  `operatorName` varchar(32) DEFAULT NULL COMMENT '用户名称',
  `operatorPwd` varchar(32) DEFAULT NULL COMMENT '登录密码',
  `operatorMobile` varchar(16) DEFAULT NULL COMMENT '用户手机号',
  `status` varchar(1) DEFAULT '1' COMMENT '状态 1：有效   2：锁定',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `operatorId_Unique` (`operatorId`),
  KEY `operatorId_Normal` (`operatorId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='登录用户表';

-- ----------------------------
-- Records of user_operator
-- ----------------------------
INSERT INTO `user_operator` VALUES ('1', '123456', '李晓丹1', '123456', '15110275788', '1', '2016-09-23 19:10:23', null);
INSERT INTO `user_operator` VALUES ('2', '864422', '发送', '123456', '11111111111', '1', '2016-10-13 10:41:49', null);

-- ----------------------------
-- Table structure for user_operator_card
-- ----------------------------
DROP TABLE IF EXISTS `user_operator_card`;
CREATE TABLE `user_operator_card` (
  `operatorId` varchar(32) NOT NULL COMMENT '登录帐号',
  `cardNo` varchar(32) DEFAULT NULL COMMENT '会员卡编号	唯一的',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`operatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员卡绑定多个用户';

-- ----------------------------
-- Records of user_operator_card
-- ----------------------------
