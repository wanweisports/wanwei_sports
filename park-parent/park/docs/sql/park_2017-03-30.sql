# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.13)
# Database: park
# Generation Time: 2017-03-30 08:52:56 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table good_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `good_info`;

CREATE TABLE `good_info` (
  `goodId` int(11) NOT NULL AUTO_INCREMENT,
  `goodNo` varchar(32) NOT NULL COMMENT '商品编号',
  `goodName` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `goodPic` varchar(255) DEFAULT NULL COMMENT '商品图片地址',
  `goodTypeId` int(11) DEFAULT NULL COMMENT '商品类型id',
  `goodMoneyType` varchar(1) DEFAULT NULL COMMENT '计费方式（1. 计次收费  2. 计时收费）',
  `goodPrice` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goodDiscount` varchar(16) DEFAULT NULL COMMENT '商品折扣	1：无折扣，2：会员折扣',
  `goodStatus` varchar(1) DEFAULT NULL COMMENT '商品状态	1：在售，2：预售，3：下架',
  `goodCount` int(11) DEFAULT NULL COMMENT '商品库存量',
  `goodRemark` varchar(255) DEFAULT NULL COMMENT '商品备注',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `goodOriginalPrice` decimal(10,2) NOT NULL COMMENT '商品原始价格',
  PRIMARY KEY (`goodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

LOCK TABLES `good_info` WRITE;
/*!40000 ALTER TABLE `good_info` DISABLE KEYS */;

INSERT INTO `good_info` (`goodId`, `goodNo`, `goodName`, `goodPic`, `goodTypeId`, `goodMoneyType`, `goodPrice`, `goodDiscount`, `goodStatus`, `goodCount`, `goodRemark`, `createTime`, `updateTime`, `salesId`, `goodOriginalPrice`)
VALUES
	(1,'717957-356','棒球夹克外套',NULL,3,'1',349.00,'1','1',9,'','2017-03-30 10:45:36',NULL,16,300.00);

/*!40000 ALTER TABLE `good_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table good_inventory_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `good_inventory_log`;

CREATE TABLE `good_inventory_log` (
  `inventoryId` int(11) NOT NULL AUTO_INCREMENT,
  `goodId` int(11) DEFAULT NULL COMMENT '商品id',
  `countChange` int(11) DEFAULT NULL COMMENT '数量变化',
  `opType` varchar(1) DEFAULT NULL COMMENT '操作类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`inventoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存日志';

LOCK TABLES `good_inventory_log` WRITE;
/*!40000 ALTER TABLE `good_inventory_log` DISABLE KEYS */;

INSERT INTO `good_inventory_log` (`inventoryId`, `goodId`, `countChange`, `opType`, `remark`, `createTime`, `updateTime`, `salesId`)
VALUES
	(1,1,10,'1','新商品初始化库存10','2017-03-30 10:45:36',NULL,16),
	(2,1,-1,'3','商品销售库存1','2017-03-30 10:57:50',NULL,16);

/*!40000 ALTER TABLE `good_inventory_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table good_shopping
# ------------------------------------------------------------

DROP TABLE IF EXISTS `good_shopping`;

CREATE TABLE `good_shopping` (
  `shoppingId` int(11) NOT NULL AUTO_INCREMENT,
  `goodId` int(11) DEFAULT NULL COMMENT '商品id',
  `shoppingName` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `shoppingGoodAmount` int(6) DEFAULT NULL COMMENT '商品数量',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`shoppingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';



# Dump of table good_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `good_type`;

CREATE TABLE `good_type` (
  `goodTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品类型id',
  `goodTypeName` varchar(32) DEFAULT NULL COMMENT '类型名称',
  `goodTypeDescribe` varchar(255) DEFAULT NULL COMMENT '类型描述',
  `goodTypeStatus` varchar(1) DEFAULT NULL COMMENT '类型状态（1：有效  2：无效）',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`goodTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型表';

LOCK TABLES `good_type` WRITE;
/*!40000 ALTER TABLE `good_type` DISABLE KEYS */;

INSERT INTO `good_type` (`goodTypeId`, `goodTypeName`, `goodTypeDescribe`, `goodTypeStatus`, `createTime`, `updateTime`, `salesId`)
VALUES
	(1,'食品饮料','','1','2017-02-20 22:53:17',NULL,17),
	(2,'运动器材','','1','2017-02-20 22:53:48',NULL,17),
	(3,'体育周边','','1','2017-02-20 22:54:14',NULL,17);

/*!40000 ALTER TABLE `good_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table member_card
# ------------------------------------------------------------

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
  `cardDeposit` decimal(10,2) DEFAULT NULL COMMENT '当时办卡的押金',
  PRIMARY KEY (`cardId`),
  UNIQUE KEY `cardNo_Unique` (`cardNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员卡信息表';

LOCK TABLES `member_card` WRITE;
/*!40000 ALTER TABLE `member_card` DISABLE KEYS */;

INSERT INTO `member_card` (`cardId`, `memberId`, `cardNo`, `cardBalance`, `cardDeadline`, `cardStatus`, `cardTypeId`, `createTime`, `updateTime`, `cardRemark`, `salesId`, `cardDeposit`)
VALUES
	(1,1,'m10329341170',940.00,'0','1',2,'2017-03-29 11:05:58',NULL,'',16,0.00),
	(2,2,'m20329265764',0.00,'0','1',1,'2017-03-29 15:15:51',NULL,'教师卡免费',17,0.00),
	(3,NULL,'m30329762900',NULL,'0','1',3,'2017-03-29 15:28:42',NULL,NULL,17,50.00),
	(4,3,'m20329517814',0.00,'0','1',1,'2017-03-29 18:33:33',NULL,'教师卡免费',17,0.00),
	(5,4,'m10330464576',2100.00,'0','1',2,'2017-03-30 09:23:32',NULL,'',17,0.00),
	(6,NULL,'m30330598319',NULL,'0','1',3,'2017-03-30 09:24:49',NULL,NULL,17,50.00),
	(7,6,'m10330234580',21000.00,'0','1',2,'2017-03-30 15:07:54',NULL,'',17,0.00);

/*!40000 ALTER TABLE `member_card` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table member_card_type
# ------------------------------------------------------------

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
  `cardDeposit` decimal(10,2) DEFAULT NULL COMMENT '卡押金',
  PRIMARY KEY (`cardTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员卡类型表';

LOCK TABLES `member_card_type` WRITE;
/*!40000 ALTER TABLE `member_card_type` DISABLE KEYS */;

INSERT INTO `member_card_type` (`cardTypeId`, `cardTypeName`, `cardType`, `cardTypeStatus`, `cardTypeMonth`, `cardTypeWeek`, `cardTypeTimeStart`, `cardTypeTimeEnd`, `cardTypeAhead`, `cardTypeMoney`, `cardTypeCredit`, `createTime`, `updateTime`, `salesId`, `cardTypeDiscount`, `cardDeposit`)
VALUES
	(1,'教师卡','1','1','0','1,2,3,4,5,6,7','06:00,06:00,06:00,06:00,06:00,06:00,06:00','23:00,23:00,23:00,23:00,23:00,23:00,23:00',0,0.00,NULL,'2016-11-22 01:10:23','2016-11-22 01:10:23',13,NULL,0.00),
	(2,'会员卡','1','1','0','1,2,3,4,5,6,7','06:00,06:00,06:00,06:00,06:00,06:00,06:00','23:00,23:00,23:00,23:00,23:00,23:00,23:00',0,0.00,NULL,'2016-11-22 01:10:23','2016-11-22 01:10:23',13,NULL,0.00),
	(3,'学生卡','1','1','0','1,2,3,4,5,6,7','06:00,06:00,06:00,06:00,06:00,06:00,06:00','23:00,23:00,23:00,23:00,23:00,23:00,23:00',0,0.00,NULL,'2016-11-22 01:10:23','2016-11-22 01:10:23',13,NULL,50.00);

/*!40000 ALTER TABLE `member_card_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table member_receivable
# ------------------------------------------------------------

DROP TABLE IF EXISTS `member_receivable`;

CREATE TABLE `member_receivable` (
  `receivableId` int(11) NOT NULL AUTO_INCREMENT COMMENT '应收款id',
  `memberId` int(11) DEFAULT NULL COMMENT '会员id',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`receivableId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应收款表';



# Dump of table member_site_sign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `member_site_sign`;

CREATE TABLE `member_site_sign` (
  `signId` int(11) NOT NULL AUTO_INCREMENT,
  `signMemberCardNo` varchar(32) DEFAULT NULL COMMENT '签到的会员卡号',
  `signName` varchar(32) DEFAULT NULL COMMENT '签到人',
  `signMobile` varchar(16) DEFAULT NULL COMMENT '签到人手机',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `signType` varchar(1) DEFAULT NULL COMMENT '签到类型（1：会员  2：散客  3：教师）',
  `reserveTimeId` int(11) DEFAULT NULL COMMENT '场地预定时间id（不能重复签到）',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `signDate` varchar(20) DEFAULT NULL COMMENT '签到日期',
  PRIMARY KEY (`signId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员场地签到表';

LOCK TABLES `member_site_sign` WRITE;
/*!40000 ALTER TABLE `member_site_sign` DISABLE KEYS */;

INSERT INTO `member_site_sign` (`signId`, `signMemberCardNo`, `signName`, `signMobile`, `orderId`, `signType`, `reserveTimeId`, `createTime`, `updateTime`, `salesId`, `signDate`)
VALUES
	(1,'m10329341170','戚文文','13001001457',1,'1',1,'2017-03-30 16:07:32',NULL,17,'2017-03-30'),
	(2,'m10329341170','戚文文','13001001457',1,'1',2,'2017-03-30 16:07:32',NULL,17,'2017-03-30'),
	(3,'m10329341170','戚文文','13001001457',1,'1',3,'2017-03-30 16:07:32',NULL,17,'2017-03-30'),
	(4,'m10329341170','戚文文','13001001457',1,'1',4,'2017-03-30 16:07:32',NULL,17,'2017-03-30');

/*!40000 ALTER TABLE `member_site_sign` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table member_site_student_sign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `member_site_student_sign`;

CREATE TABLE `member_site_student_sign` (
  `signId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) DEFAULT NULL COMMENT '学生id',
  `signStudentCardNo` varchar(32) DEFAULT NULL COMMENT '签到的会员卡号',
  `signName` varchar(32) DEFAULT NULL COMMENT '签到人',
  `signMobile` varchar(16) DEFAULT NULL COMMENT '签到人手机',
  `sportId` int(11) DEFAULT NULL COMMENT '场地类型id',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`signId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生签到表';



# Dump of table notifications_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications_files`;

CREATE TABLE `notifications_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `noteId` int(11) DEFAULT NULL COMMENT '通知ID',
  `fileURI` int(11) DEFAULT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table notifications_receivers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications_receivers`;

CREATE TABLE `notifications_receivers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `noteId` int(11) DEFAULT NULL COMMENT '通知ID',
  `receiverId` int(11) DEFAULT NULL COMMENT '收件人ID',
  `readTime` varchar(20) DEFAULT NULL COMMENT '阅读时间',
  `receiverStatus` varchar(1) DEFAULT NULL COMMENT '接收状态：1，已读 2，未读 3，删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table notifications_senders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications_senders`;

CREATE TABLE `notifications_senders` (
  `noteId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '通知ID',
  `noteTitle` varchar(100) DEFAULT NULL COMMENT '通知标题',
  `noteContent` text COMMENT '通知内容',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `senderId` int(11) DEFAULT NULL COMMENT '发送人',
  `sendTime` varchar(20) DEFAULT NULL COMMENT '发送时间',
  `sendStatus` varchar(1) DEFAULT NULL COMMENT '发送状态：1，已发送 2，未发送 3，已删除',
  PRIMARY KEY (`noteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table order_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `orderDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `itemId` int(11) DEFAULT NULL COMMENT '商品id',
  `itemName` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `itemPrice` decimal(10,2) DEFAULT NULL COMMENT '商品支付价格',
  `itemStartTime` varchar(20) DEFAULT NULL COMMENT '商品开始时间',
  `itemEndTime` varchar(20) DEFAULT NULL COMMENT '商品结束时间',
  `itemAmount` int(11) DEFAULT NULL COMMENT '商品数量',
  `itemRemark` text COMMENT '商品描述',
  `itemMoneyType` varchar(1) DEFAULT NULL COMMENT '当时的计费方式（1. 计次收费  2. 计时收费）',
  `itemDiscount` int(11) DEFAULT NULL COMMENT '当时的商品折扣（0-100）',
  `orderDetailStatus` varchar(1) DEFAULT NULL COMMENT '订单详情状态（1：已完成  2：未完成  3：进行中）',
  PRIMARY KEY (`orderDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情表';

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;

INSERT INTO `order_detail` (`orderDetailId`, `orderId`, `itemId`, `itemName`, `itemPrice`, `itemStartTime`, `itemEndTime`, `itemAmount`, `itemRemark`, `itemMoneyType`, `itemDiscount`, `orderDetailStatus`)
VALUES
	(1,1,1,'【羽毛球】',NULL,'2017-03-30 16:00','2017-03-30 17:00',1,NULL,'2',NULL,'2'),
	(2,1,2,'【羽毛球】',NULL,'2017-03-30 16:00','2017-03-30 17:00',1,NULL,'2',NULL,'2'),
	(3,1,3,'【羽毛球】',NULL,'2017-03-30 17:00','2017-03-30 18:00',1,NULL,'2',NULL,'2'),
	(4,1,4,'【羽毛球】',NULL,'2017-03-30 17:00','2017-03-30 18:00',1,NULL,'2',NULL,'2'),
	(5,2,1,'棒球夹克外套',349.00,NULL,NULL,1,NULL,'1',NULL,'1');

/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_info
# ------------------------------------------------------------

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
  `orderSumCount` int(11) DEFAULT NULL COMMENT '子订单商品数量的合计数量',
  `orderDiscount` int(11) DEFAULT NULL COMMENT '当时的商品折扣（0-100）',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `sumCount` int(11) DEFAULT NULL COMMENT '总次数',
  `payCount` int(11) DEFAULT NULL COMMENT '支付次数',
  `useCount` int(11) DEFAULT NULL COMMENT '已使用次数',
  `name` varchar(32) DEFAULT NULL COMMENT '订单人',
  `mobile` varchar(20) DEFAULT NULL COMMENT '订单人手机',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;

INSERT INTO `order_info` (`orderId`, `orderNo`, `operatorId`, `memberId`, `orderServiceType`, `orderStatus`, `payStatus`, `payType`, `payTime`, `orderSumPrice`, `paySumPrice`, `subAmount`, `additionalPrice`, `checkNo`, `orderRemark`, `orderSumCount`, `orderDiscount`, `createTime`, `updateTime`, `salesId`, `sumCount`, `payCount`, `useCount`, `name`, `mobile`)
VALUES
	(1,'20170330093047',NULL,1,'100','2','1','1','2017-03-30 09:30:47',160.00,160.00,0.00,0.00,NULL,'',4,NULL,'2017-03-30 09:30:47','2017-03-30 09:30:47',17,4,4,4,'戚文文','13001001457'),
	(2,'20170330105750',NULL,4,'300','1','1','3','2017-03-30 10:57:50',349.00,349.00,0.00,0.00,NULL,'',1,100,'2017-03-30 10:57:50','2017-03-30 10:57:50',16,NULL,NULL,NULL,'辛嘉欣','13001004751');

/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table other_balance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `other_balance`;

CREATE TABLE `other_balance` (
  `balanceId` int(11) NOT NULL AUTO_INCREMENT,
  `balanceNo` varchar(32) NOT NULL COMMENT '流水号',
  `balanceServiceType` varchar(16) NOT NULL COMMENT '业务类型',
  `balanceServiceId` int(11) NOT NULL COMMENT '业务标识',
  `balanceServiceName` varchar(100) DEFAULT NULL COMMENT '业务项名称',
  `balanceType` varchar(1) DEFAULT NULL COMMENT '类型 1：充值  2：消费  3：其他',
  `balanceStyle` varchar(1) DEFAULT NULL COMMENT '支付方式 1：现金  2：支付宝  3：微信 4：银联 5：支票',
  `balanceCheckNo` varchar(100) DEFAULT NULL COMMENT '支票号',
  `oldAmount` decimal(10,2) DEFAULT NULL COMMENT '原始金额（充值金额|升级金额|补办金额）',
  `realAmount` decimal(10,2) DEFAULT NULL COMMENT '实际价格（最终支付金额）',
  `xjAmount` decimal(10,2) DEFAULT NULL COMMENT '最终现金支付金额（不含扣卡金额）',
  `subAmount` decimal(10,2) DEFAULT NULL COMMENT '优惠金额',
  `givingAmount` decimal(10,2) DEFAULT NULL COMMENT '赠送金额',
  `divBalance` decimal(10,2) DEFAULT '0.00' COMMENT '剩余未付金额',
  `balanceStatus` varchar(1) DEFAULT NULL COMMENT '订单状态 (充值)1：已收全款  2：未付款  3：部分收款  (消费)1：已支付  2：未支付',
  `serviceDate` varchar(20) DEFAULT NULL COMMENT '业务日期',
  `changeAmount` decimal(10,2) DEFAULT NULL COMMENT '金额变化',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `balanceCardId` int(11) DEFAULT NULL COMMENT '会员卡Id',
  PRIMARY KEY (`balanceId`),
  UNIQUE KEY `balanceNo_Unique` (`balanceNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收支流水表';

LOCK TABLES `other_balance` WRITE;
/*!40000 ALTER TABLE `other_balance` DISABLE KEYS */;

INSERT INTO `other_balance` (`balanceId`, `balanceNo`, `balanceServiceType`, `balanceServiceId`, `balanceServiceName`, `balanceType`, `balanceStyle`, `balanceCheckNo`, `oldAmount`, `realAmount`, `xjAmount`, `subAmount`, `givingAmount`, `divBalance`, `balanceStatus`, `serviceDate`, `changeAmount`, `createTime`, `updateTime`, `salesId`, `remark`, `balanceCardId`)
VALUES
	(1,'20170329110558','10',1,NULL,'3','1','',1000.00,1000.00,1000.00,NULL,100.00,NULL,'1','2017-03-29 11:05:58',NULL,'2017-03-29 11:05:58',NULL,16,NULL,NULL),
	(2,'20170329151551','10',2,NULL,'3','1',NULL,0.00,0.00,0.00,NULL,0.00,NULL,'1','2017-03-29 15:15:51',NULL,'2017-03-29 15:15:51',NULL,17,NULL,NULL),
	(3,'20170329152842','10',3,NULL,'3','1',NULL,50.00,50.00,50.00,NULL,NULL,NULL,'1','2017-03-29 15:28:42',NULL,'2017-03-29 15:28:42',NULL,17,NULL,NULL),
	(4,'20170329183333','10',4,NULL,'3','1',NULL,0.00,0.00,0.00,NULL,0.00,NULL,'1','2017-03-29 18:33:33',NULL,'2017-03-29 18:33:33',NULL,17,NULL,NULL),
	(5,'20170330092332','10',5,NULL,'3','2','',2000.00,2000.00,2000.00,NULL,100.00,NULL,'1','2017-03-30 09:23:32',NULL,'2017-03-30 09:23:32',NULL,17,NULL,NULL),
	(6,'20170330092449','10',6,NULL,'3','1',NULL,50.00,50.00,50.00,NULL,NULL,NULL,'1','2017-03-30 09:24:49',NULL,'2017-03-30 09:24:49',NULL,17,NULL,NULL),
	(7,'20170330093047','100',1,NULL,'3','1',NULL,160.00,160.00,0.00,0.00,NULL,NULL,'1','2017-03-30 09:30:47',NULL,'2017-03-30 09:30:47',NULL,17,NULL,1),
	(8,'20170330105750','300',2,NULL,'3','3',NULL,349.00,349.00,349.00,0.00,NULL,NULL,'1','2017-03-30 10:57:50',NULL,'2017-03-30 10:57:50',NULL,16,NULL,5),
	(9,'20170330150754','10',7,NULL,'3','5','xx00121123',20000.00,20000.00,20000.00,NULL,1000.00,NULL,'1','2017-03-30 15:07:54',NULL,'2017-03-30 15:07:54',NULL,17,NULL,NULL);

/*!40000 ALTER TABLE `other_balance` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table other_collate_info
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='核对财务表';



# Dump of table other_invoice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `other_invoice`;

CREATE TABLE `other_invoice` (
  `invoiceId` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceNo` varchar(32) DEFAULT NULL COMMENT '流水号（和订单流水相同）',
  `invoiceServiceType` varchar(16) NOT NULL COMMENT '发票业务类型',
  `invoiceServiceId` int(11) NOT NULL COMMENT '发票业务标识',
  `invoiceHeader` varchar(100) DEFAULT NULL COMMENT '发票抬头	公司或者个人名称',
  `invoiceContent` varchar(50) DEFAULT '' COMMENT '服务项目',
  `invoiceMoney` decimal(10,2) DEFAULT NULL COMMENT '发票金额',
  `invoiceRemark` varchar(255) DEFAULT NULL COMMENT '发票内容备注',
  `invoiceState` varchar(1) DEFAULT '2' COMMENT '领取状态    1：已领取，2：未领取',
  `createTime` varchar(20) DEFAULT NULL COMMENT '登记时间',
  `printTime` varchar(20) DEFAULT NULL COMMENT '打印时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `invoiceOpenState` varchar(1) DEFAULT '2' COMMENT '发票已开状态 1：是  2：否',
  `openTime` varchar(20) DEFAULT NULL COMMENT '开票时间',
  `invoiceType` varchar(1) DEFAULT '2' COMMENT '发票类型：1，专票 2，普票',
  PRIMARY KEY (`invoiceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发票登记表';

LOCK TABLES `other_invoice` WRITE;
/*!40000 ALTER TABLE `other_invoice` DISABLE KEYS */;

INSERT INTO `other_invoice` (`invoiceId`, `invoiceNo`, `invoiceServiceType`, `invoiceServiceId`, `invoiceHeader`, `invoiceContent`, `invoiceMoney`, `invoiceRemark`, `invoiceState`, `createTime`, `printTime`, `salesId`, `invoiceOpenState`, `openTime`, `invoiceType`)
VALUES
	(1,'20170330150754','10',6,'深圳鲲鹏科创信息技术有限公司','场地费',20000.00,'','2','2017-03-30 15:08:11',NULL,17,'2',NULL,'1');

/*!40000 ALTER TABLE `other_invoice` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table other_resource
# ------------------------------------------------------------

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



# Dump of table park_business
# ------------------------------------------------------------

DROP TABLE IF EXISTS `park_business`;

CREATE TABLE `park_business` (
  `businessId` int(11) NOT NULL AUTO_INCREMENT,
  `businessStartTime` varchar(20) DEFAULT NULL COMMENT '营业开始时间',
  `businessEndTime` varchar(20) DEFAULT NULL COMMENT '营业结束时间',
  `businessTimePeriod` varchar(20) DEFAULT NULL COMMENT '营业时间段',
  `businessName` varchar(255) DEFAULT NULL COMMENT '场馆名称',
  `businessAreaName` varchar(512) DEFAULT NULL COMMENT '所在省市',
  `businessContact` varchar(32) DEFAULT NULL COMMENT '联系人',
  `businessPhone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `businessAddress` varchar(1024) DEFAULT NULL COMMENT '详细地址',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `points` int(11) DEFAULT NULL COMMENT '安装点数（限制能创建几个员工）',
  PRIMARY KEY (`businessId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场馆表';

LOCK TABLES `park_business` WRITE;
/*!40000 ALTER TABLE `park_business` DISABLE KEYS */;

INSERT INTO `park_business` (`businessId`, `businessStartTime`, `businessEndTime`, `businessTimePeriod`, `businessName`, `businessAreaName`, `businessContact`, `businessPhone`, `businessAddress`, `createTime`, `updateTime`, `salesId`, `points`)
VALUES
	(1,'08:00','22:00',NULL,'北京一七一中学体育俱乐部','1','李老师','19010068132','北京市朝阳区和平里北街8号','2016-11-17 10:37:53','2017-03-30 14:02:51',14,5);

/*!40000 ALTER TABLE `park_business` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table site_info
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场地表';

LOCK TABLES `site_info` WRITE;
/*!40000 ALTER TABLE `site_info` DISABLE KEYS */;

INSERT INTO `site_info` (`siteId`, `siteName`, `siteNo`, `siteRemark`, `siteType`, `siteStatus`, `createTime`, `updateTime`, `salesId`)
VALUES
	(1,'场地1','723022','',1,'1','2016-11-17 16:17:19',NULL,13),
	(2,'场地2','548604','',1,'1','2016-11-17 16:17:26',NULL,13),
	(3,'场地3','133921','',1,'1','2016-11-17 16:17:31',NULL,13),
	(4,'场地4','563045','',1,'1','2016-11-17 16:17:37',NULL,13),
	(5,'场地5','306246','',1,'1','2016-11-17 16:17:42',NULL,13),
	(6,'场地6','180651','',1,'1','2016-11-17 16:17:54',NULL,13),
	(7,'场地7','324212','',1,'1','2016-11-17 16:18:09',NULL,13),
	(8,'场地8','326854','',1,'1','2016-11-17 16:18:14',NULL,13),
	(9,'场地9','736195','',1,'1','2016-11-17 16:18:20',NULL,13),
	(10,'场地10','532826','',1,'1','2016-11-17 16:18:26',NULL,13),
	(11,'场地11','088485','场地被征用，临时关闭',1,'2','2016-11-17 16:18:41','2017-01-13 23:21:15',13),
	(12,'露天1','028059','露天场地',2,'1','2016-11-20 00:00:20',NULL,13),
	(13,'露天2','977477','',2,'1','2016-11-20 00:00:34',NULL,13),
	(14,'露天3','456082','',2,'1','2016-11-20 00:00:45',NULL,13),
	(15,'露天4','223615','',2,'1','2016-11-20 00:00:56',NULL,13),
	(16,'室内1','734241','室内场地',2,'1','2016-11-20 00:01:08',NULL,13),
	(17,'室内2','783809','',2,'1','2016-11-20 00:01:16',NULL,13),
	(18,'球桌1','175309','',3,'1','2016-11-20 00:02:02',NULL,13),
	(19,'球桌2','351355','',3,'1','2016-11-20 00:02:11',NULL,13),
	(20,'球桌3','582378','',3,'1','2016-11-20 00:02:20',NULL,13),
	(21,'球桌4','651144','',3,'1','2016-11-20 00:02:29',NULL,13),
	(22,'球桌5','887055','',3,'1','2016-11-20 00:02:36',NULL,13),
	(23,'球桌6','241961','',3,'1','2016-11-20 00:02:46',NULL,13);

/*!40000 ALTER TABLE `site_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table site_meal_info
# ------------------------------------------------------------

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



# Dump of table site_order
# ------------------------------------------------------------

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



# Dump of table site_reserve_basic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `site_reserve_basic`;

CREATE TABLE `site_reserve_basic` (
  `siteReserveId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '预订者姓名',
  `mobile` varchar(11) DEFAULT NULL COMMENT '预订者手机号',
  `opType` varchar(1) DEFAULT NULL COMMENT '预定者身份（1：会员  2：散客）',
  `siteReserveStatus` varchar(1) DEFAULT NULL COMMENT '场地当前状态（1.已付款  2.未付款   3.已锁定   4.不可预订  5.可预订）',
  `reserveType` varchar(1) DEFAULT NULL COMMENT '预定类型（1：PC  2：手机网页  3：打电话）',
  `reserveModel` varchar(1) DEFAULT NULL COMMENT '预定模式（1：普通  2：批量）',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `memberId` int(11) DEFAULT NULL COMMENT '会员id',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`siteReserveId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场地序列图表';

LOCK TABLES `site_reserve_basic` WRITE;
/*!40000 ALTER TABLE `site_reserve_basic` DISABLE KEYS */;

INSERT INTO `site_reserve_basic` (`siteReserveId`, `name`, `mobile`, `opType`, `siteReserveStatus`, `reserveType`, `reserveModel`, `createTime`, `updateTime`, `salesId`, `memberId`, `orderId`)
VALUES
	(1,'戚文文','13001001457','1','1','1','1','2017-03-30 09:30:47',NULL,17,1,1);

/*!40000 ALTER TABLE `site_reserve_basic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table site_reserve_date
# ------------------------------------------------------------

DROP TABLE IF EXISTS `site_reserve_date`;

CREATE TABLE `site_reserve_date` (
  `reserveDateId` int(11) NOT NULL AUTO_INCREMENT,
  `siteReserveId` int(11) DEFAULT NULL COMMENT '基础表id',
  `reserveStartDate` varchar(20) DEFAULT NULL COMMENT '预定开始日期',
  `reserveEndDate` varchar(20) DEFAULT NULL COMMENT '预定结束日期',
  `reserveWeek` varchar(20) DEFAULT NULL COMMENT '预定时间范围内的哪些周（多个逗号分隔）',
  `reserveDates` mediumtext COMMENT '时间星期内包含的所有时间（多个逗号分隔）',
  PRIMARY KEY (`reserveDateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场地预定日期表';

LOCK TABLES `site_reserve_date` WRITE;
/*!40000 ALTER TABLE `site_reserve_date` DISABLE KEYS */;

INSERT INTO `site_reserve_date` (`reserveDateId`, `siteReserveId`, `reserveStartDate`, `reserveEndDate`, `reserveWeek`, `reserveDates`)
VALUES
	(1,1,'2017-03-30','2017-03-30','4','2017-03-30');

/*!40000 ALTER TABLE `site_reserve_date` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table site_reserve_time
# ------------------------------------------------------------

DROP TABLE IF EXISTS `site_reserve_time`;

CREATE TABLE `site_reserve_time` (
  `reserveTimeId` int(11) NOT NULL AUTO_INCREMENT,
  `reserveDateId` int(11) DEFAULT NULL COMMENT '预定日期id',
  `siteId` int(11) DEFAULT NULL COMMENT '场地id',
  `siteStartTime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `siteEndTime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `isUse` varchar(1) DEFAULT '2' COMMENT '使用情况 1，已使用 2，未使用',
  PRIMARY KEY (`reserveTimeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场地预定时间表';

LOCK TABLES `site_reserve_time` WRITE;
/*!40000 ALTER TABLE `site_reserve_time` DISABLE KEYS */;

INSERT INTO `site_reserve_time` (`reserveTimeId`, `reserveDateId`, `siteId`, `siteStartTime`, `siteEndTime`, `isUse`)
VALUES
	(1,1,5,'16:00','17:00','2'),
	(2,1,6,'16:00','17:00','2'),
	(3,1,5,'17:00','18:00','2'),
	(4,1,6,'17:00','18:00','2');

/*!40000 ALTER TABLE `site_reserve_time` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table site_sport
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场地类型表';

LOCK TABLES `site_sport` WRITE;
/*!40000 ALTER TABLE `site_sport` DISABLE KEYS */;

INSERT INTO `site_sport` (`sportId`, `sportName`, `sportMoney`, `sportDeposit`, `startTime`, `endTime`, `sportStatus`, `sportCustom`, `createTime`, `updateTime`, `salesId`)
VALUES
	(1,'羽毛球',40.00,100.00,'08:00','22:00','1',NULL,'2016-11-17 16:09:11',NULL,13),
	(2,'篮球',20.00,100.00,'08:00','22:00','1',NULL,'2016-11-17 16:09:57','2017-01-13 17:11:27',13),
	(3,'乒乓球',20.00,40.00,'08:00','22:00','1',NULL,'2016-11-19 23:59:34',NULL,13);

/*!40000 ALTER TABLE `site_sport` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_dict
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_dict`;

CREATE TABLE `system_dict` (
  `dictId` int(9) NOT NULL AUTO_INCREMENT,
  `parentDictId` int(9) DEFAULT NULL,
  `dictName` varchar(32) NOT NULL,
  `dictKey` varchar(16) NOT NULL,
  `dictValue` varchar(32) NOT NULL,
  `dictAdditional` text,
  `dictSort` int(11) DEFAULT NULL,
  PRIMARY KEY (`dictId`),
  KEY `AK_Key_2` (`dictName`,`dictKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `system_dict` WRITE;
/*!40000 ALTER TABLE `system_dict` DISABLE KEYS */;

INSERT INTO `system_dict` (`dictId`, `parentDictId`, `dictName`, `dictKey`, `dictValue`, `dictAdditional`, `dictSort`)
VALUES
	(1,NULL,'BALANCE_SERVICE_TYPE','10','注册会员',NULL,1),
	(2,NULL,'BALANCE_SERVICE_TYPE','11','会员充值',NULL,2),
	(3,NULL,'BALANCE_SERVICE_TYPE','12','升级会员卡',NULL,3),
	(4,NULL,'BALANCE_SERVICE_TYPE','13','补办会员卡',NULL,4),
	(20,NULL,'BALANCE_STATUS','1','已付全款',NULL,NULL),
	(21,NULL,'BALANCE_STATUS','2','未付款',NULL,NULL),
	(22,NULL,'BALANCE_STATUS','3','部分付款',NULL,NULL),
	(30,NULL,'STATUS','1','有效',NULL,NULL),
	(31,NULL,'STATUS','2','无效',NULL,NULL),
	(40,NULL,'SEX','1','男',NULL,NULL),
	(41,NULL,'SEX','2','女',NULL,NULL),
	(50,NULL,'BALANCE_STYLE','1','现金',NULL,NULL),
	(51,NULL,'BALANCE_STYLE','2','支付宝',NULL,NULL),
	(52,NULL,'BALANCE_STYLE','3','微信',NULL,NULL),
	(53,NULL,'BALANCE_STYLE','4','银联',NULL,NULL),
	(54,NULL,'BALANCE_STYLE','5','支票',NULL,NULL),
	(55,NULL,'BALANCE_SERVICE_TYPE','20','教师补办会员卡',NULL,NULL),
	(56,NULL,'BALANCE_SERVICE_TYPE','30','学生补办会员卡',NULL,NULL),
	(57,NULL,'BALANCE_SERVICE_TYPE','100','场地预订',NULL,5),
	(58,NULL,'BALANCE_SERVICE_TYPE','200','包场预订',NULL,6),
	(59,NULL,'BALANCE_SERVICE_TYPE','220','应收款',NULL,8),
	(60,NULL,'BALANCE_SERVICE_TYPE','300','商品消费',NULL,7);

/*!40000 ALTER TABLE `system_dict` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_menu`;

CREATE TABLE `system_menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单标识',
  `menuCode` varchar(32) DEFAULT NULL COMMENT '菜单代码',
  `menuName` varchar(32) NOT NULL COMMENT '菜单名称',
  `menuSort` int(11) DEFAULT '1' COMMENT '菜单排序',
  `menuURL` text NOT NULL COMMENT '菜单链接',
  `menuStatus` varchar(1) DEFAULT '0' COMMENT '菜单状态：0可用，1不可用',
  `parentMenuId` int(11) DEFAULT NULL COMMENT '父菜单标识',
  `parentMenuSort` int(11) DEFAULT NULL COMMENT '父菜单排序',
  `isQuick` varchar(1) DEFAULT '1' COMMENT '快捷方式：1左侧菜单，2左侧快捷，3左侧右上',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

LOCK TABLES `system_menu` WRITE;
/*!40000 ALTER TABLE `system_menu` DISABLE KEYS */;

INSERT INTO `system_menu` (`menuId`, `menuCode`, `menuName`, `menuSort`, `menuURL`, `menuStatus`, `parentMenuId`, `parentMenuSort`, `isQuick`)
VALUES
	(1,'user','会员管理',1,'','0',0,1,'1'),
	(2,'','新会员办理',1,'/member/regMember','0',1,1,'2'),
	(3,NULL,'会员查询',2,'/member/memberList','0',1,1,'1'),
	(4,NULL,'会员卡充值',3,'/member/getMembersCardRecharge','0',1,1,'1'),
	(5,NULL,'会员卡升级',4,'','1',1,1,'1'),
	(6,NULL,'会员卡补办',5,'/member/getMembersCardRefresh','0',1,1,'1'),
	(7,NULL,'应收款管理',7,'/member/getMembersLoans','0',1,1,'1'),
	(8,NULL,'发票登记查询',8,'/member/getInvoices?invoiceOpenState=2&invoiceState=2','0',1,1,'2'),
	(9,NULL,'会员类型设置',9,'/member/getMemberCarTypes','0',1,1,'1'),
	(10,'calendar','场地预订',4,'','0',0,4,'1'),
	(11,NULL,'场地预订',1,'/site/getSiteReservationInfo','0',10,4,'2'),
	(12,NULL,'批量预订',3,'/site/getSiteReservationBatch','0',10,4,'2'),
	(13,NULL,'场地订单',4,'/order/getOrderList?orderServiceTypes=100,200','0',10,4,'1'),
	(14,NULL,'场地热点分析',5,'','1',10,4,'1'),
	(15,NULL,'场地设置',6,'/site/getSiteInfos','0',10,4,'1'),
	(16,NULL,'场地类型设置',7,'/site/getSiteSports','0',10,4,'1'),
	(17,'shopping-cart','商品管理',5,'','0',0,5,'1'),
	(18,NULL,'商品设置',2,'/good/settingGood','0',17,5,'1'),
	(19,NULL,'进销存管理',6,'/good/getGoodsStock?countNum=21','0',17,5,'1'),
	(20,NULL,'商品销售',4,'/good/getGoodsMarket','0',17,5,'1'),
	(21,NULL,'库存操作明细',7,'/good/getGoodsStockDetails?countNum=21','0',17,5,'1'),
	(22,'bar-chart','数据统计',6,'','0',0,6,'1'),
	(23,NULL,'会员办理统计',1,'/data/getMembersRegister?countNum=21','0',22,6,'1'),
	(24,NULL,'营业收支统计',3,'/data/getBusinessIncome?countNum=21','0',22,6,'2'),
	(25,NULL,'场地使用率',4,'/data/getVenuePercentage?countNum=21','0',22,6,'1'),
	(26,NULL,'场地签到记录',4,'/data/getMembersAttendance?countNum=21','0',22,6,'1'),
	(27,'cogs','系统设置',8,'','0',0,8,'1'),
	(28,NULL,'场馆基础设置',1,'/settings/common','0',27,8,'1'),
	(29,NULL,'员工信息设置',3,'/settings/getUsers','0',27,8,'1'),
	(30,NULL,'员工权限设置',2,'/settings/getRoles','0',27,8,'1'),
	(31,NULL,'通知管理',1,'/office/getNotifications?type=2','0',37,7,'1'),
	(32,NULL,'小票模板设置',4,'/settings/printTemplate','1',27,8,'1'),
	(33,NULL,'数据库操作',5,'/settings/database','1',27,8,'1'),
	(34,NULL,'定场预订',2,'/site/getSiteReservationFixed','0',10,4,'1'),
	(35,'tree','教师管理',2,'','0',0,2,'1'),
	(36,'graduation-cap','学生管理',3,'','0',0,3,'1'),
	(37,'folder','办公系统',7,'','0',0,7,'1'),
	(39,NULL,'会员卡注销',6,'','1',1,1,'1'),
	(40,NULL,'商品类型设置',1,'/good/typeGood','0',17,5,'1'),
	(41,NULL,'商品订单',5,'/order/getOrderList?orderServiceTypes=300','0',17,5,'1'),
	(42,NULL,'教师办卡',1,'/teachers/register','0',35,2,'1'),
	(43,NULL,'教师查询',2,'/teachers/list','0',35,2,'1'),
	(44,NULL,'教师用场统计',3,'/teachers/data','0',35,2,'1'),
	(45,NULL,'教师订餐统计',4,'/site/getMeals','0',35,2,'1'),
	(46,NULL,'学生办卡',1,'/students/register','0',36,3,'1'),
	(47,NULL,'学生查询',2,'/students/list','0',36,3,'1'),
	(48,NULL,'学生用场统计',3,'/students/data','0',36,3,'1'),
	(49,NULL,'排班管理',2,'/office/schedule?countNum=21','0',37,7,'1'),
	(50,NULL,'培训课程管理',3,'/office/getTrainsCourseList','0',37,7,'1'),
	(54,NULL,'商品查询',3,'/good/getGoods','0',17,5,'1'),
	(55,NULL,'营业流水日志',2,'/data/getBusinessIncomeLog?countNum=21','0',22,6,'1'),
	(56,NULL,'培训班级管理',4,'/office/getTrainsClassList','0',37,7,'1'),
	(57,NULL,'系统日志',6,'/settings/systemLogs','1',27,8,'1');

/*!40000 ALTER TABLE `system_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_role`;

CREATE TABLE `system_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色标识',
  `roleName` varchar(32) NOT NULL COMMENT '角色名称',
  `roleStatus` varchar(16) NOT NULL COMMENT '角色状态',
  `readOnly` varchar(16) NOT NULL COMMENT '只读',
  `roleDescribe` varchar(255) DEFAULT NULL COMMENT '角色说明',
  `roleLevel` int(11) DEFAULT '1' COMMENT '显示优先级',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

LOCK TABLES `system_role` WRITE;
/*!40000 ALTER TABLE `system_role` DISABLE KEYS */;

INSERT INTO `system_role` (`roleId`, `roleName`, `roleStatus`, `readOnly`, `roleDescribe`, `roleLevel`, `createTime`, `updateTime`, `salesId`)
VALUES
	(1,'超级管理员','1','1',NULL,NULL,'2016-10-13 10:00:00',NULL,NULL),
	(2,'场馆经理','1','2','统筹安排场馆的所有业务工作。',NULL,'2017-03-28 16:26:59','2017-03-28 17:48:16',13),
	(3,'场馆财务','1','2','负责场馆财务工作。',NULL,'2017-03-28 17:55:13',NULL,14),
	(4,'场馆收银','1','2','负责场馆的收银工作。',NULL,'2017-03-28 18:05:14',NULL,14);

/*!40000 ALTER TABLE `system_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_role_function
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_role_function`;

CREATE TABLE `system_role_function` (
  `roleId` int(11) NOT NULL COMMENT '角色标识',
  `functionId` varchar(16) NOT NULL COMMENT '功能标识',
  PRIMARY KEY (`roleId`,`functionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色功能';



# Dump of table system_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_role_menu`;

CREATE TABLE `system_role_menu` (
  `roleId` int(11) NOT NULL COMMENT '角色标识',
  `menuId` int(11) NOT NULL COMMENT '菜单标识',
  PRIMARY KEY (`roleId`,`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限菜单';

LOCK TABLES `system_role_menu` WRITE;
/*!40000 ALTER TABLE `system_role_menu` DISABLE KEYS */;

INSERT INTO `system_role_menu` (`roleId`, `menuId`)
VALUES
	(2,0),
	(2,1),
	(2,2),
	(2,3),
	(2,4),
	(2,6),
	(2,7),
	(2,8),
	(2,9),
	(2,10),
	(2,11),
	(2,12),
	(2,13),
	(2,15),
	(2,16),
	(2,17),
	(2,18),
	(2,19),
	(2,20),
	(2,21),
	(2,22),
	(2,23),
	(2,24),
	(2,25),
	(2,26),
	(2,27),
	(2,28),
	(2,29),
	(2,30),
	(2,31),
	(2,34),
	(2,35),
	(2,36),
	(2,37),
	(2,40),
	(2,41),
	(2,42),
	(2,43),
	(2,44),
	(2,45),
	(2,46),
	(2,47),
	(2,48),
	(2,49),
	(2,50),
	(2,54),
	(2,55),
	(2,56),
	(3,7),
	(3,8),
	(3,13),
	(3,22),
	(3,23),
	(3,24),
	(3,25),
	(3,26),
	(3,31),
	(3,44),
	(3,45),
	(3,48),
	(3,49),
	(3,55),
	(4,1),
	(4,2),
	(4,3),
	(4,4),
	(4,6),
	(4,7),
	(4,8),
	(4,9),
	(4,10),
	(4,11),
	(4,12),
	(4,13),
	(4,15),
	(4,16),
	(4,17),
	(4,18),
	(4,19),
	(4,20),
	(4,21),
	(4,34),
	(4,35),
	(4,36),
	(4,40),
	(4,41),
	(4,42),
	(4,43),
	(4,44),
	(4,45),
	(4,46),
	(4,47),
	(4,48),
	(4,54);

/*!40000 ALTER TABLE `system_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_role_operator
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_role_operator`;

CREATE TABLE `system_role_operator` (
  `roleId` int(11) NOT NULL COMMENT '角色标识',
  `operatorId` varchar(64) NOT NULL COMMENT '登录账号标识',
  PRIMARY KEY (`roleId`,`operatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

LOCK TABLES `system_role_operator` WRITE;
/*!40000 ALTER TABLE `system_role_operator` DISABLE KEYS */;

INSERT INTO `system_role_operator` (`roleId`, `operatorId`)
VALUES
	(1,'admin'),
	(2,'lilaoshi'),
	(2,'m10329341170'),
	(2,'m10330083501'),
	(2,'m10330234580'),
	(2,'m10330464576'),
	(2,'m20329265764'),
	(2,'m20329517814'),
	(3,'anlaoshi'),
	(4,'gelaoshi'),
	(4,'gulaoshi');

/*!40000 ALTER TABLE `system_role_operator` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table trains_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trains_class`;

CREATE TABLE `trains_class` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `courseId` int(11) DEFAULT NULL COMMENT '课程ID',
  `className` varchar(20) DEFAULT NULL COMMENT '班级名称',
  `classRemark` varchar(500) DEFAULT NULL COMMENT '班级描述',
  `saleId` int(11) DEFAULT NULL COMMENT '操作员',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `startTime` varchar(20) DEFAULT NULL COMMENT '报名开始时间',
  `endTime` varchar(20) DEFAULT NULL COMMENT '报名结束时间',
  `leaderName` varchar(20) DEFAULT NULL COMMENT '责任老师',
  `leaderPhone` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `leaderMobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `address` varchar(500) DEFAULT NULL COMMENT '联系地址',
  `classPrice` decimal(10,2) DEFAULT '0.00' COMMENT '班级价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table trains_class_students
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trains_class_students`;

CREATE TABLE `trains_class_students` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentName` varchar(20) DEFAULT NULL COMMENT '学生姓名',
  `studentMobile` varchar(20) DEFAULT NULL COMMENT '学生手机号',
  `signTime` varchar(20) DEFAULT NULL COMMENT '报名时间',
  `classId` int(11) DEFAULT NULL COMMENT '报名班级',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `saleId` int(11) DEFAULT NULL COMMENT '操作人',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `payStatus` varchar(1) DEFAULT '2' COMMENT '支付状态，1已支付，2未支付',
  `payPrice` decimal(10,2) DEFAULT '0.00' COMMENT '支付价格',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table trains_course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trains_course`;

CREATE TABLE `trains_course` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `courseName` varchar(20) DEFAULT NULL COMMENT '课程名称',
  `courseNo` varchar(20) DEFAULT NULL COMMENT '课程编号',
  `courseRemark` varchar(500) DEFAULT NULL COMMENT '课程描述',
  `saleId` int(11) DEFAULT NULL COMMENT '操作员',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `courseTag` varchar(20) DEFAULT NULL COMMENT '课程标签',
  `courseStatus` varchar(1) DEFAULT '1' COMMENT '课程状态，1开放，2不开放',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user_member
# ------------------------------------------------------------

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
  `parentMemberId` int(11) DEFAULT NULL COMMENT '父会员id',
  PRIMARY KEY (`memberId`),
  UNIQUE KEY `memberMobile_Unique` (`memberMobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员信息表';

LOCK TABLES `user_member` WRITE;
/*!40000 ALTER TABLE `user_member` DISABLE KEYS */;

INSERT INTO `user_member` (`memberId`, `operationId`, `memberName`, `memberType`, `memberMobile`, `memberMobile2`, `memberSex`, `memberIdcard`, `memberBirthday`, `memberPayPassword`, `memberStatus`, `memberAddress`, `memberRemark`, `createTime`, `updateTime`, `salesId`, `tempCardNo`, `parentMemberId`)
VALUES
	(1,'m10329341170','戚文文','1','13001001457',NULL,'2','230709197804240385','1978-04-24',NULL,'1','','','2017-03-29 10:40:23','2017-03-29 11:17:55',16,NULL,NULL),
	(2,'m20329265764','沙君','1','13001002222',NULL,'1','150221198610144952','1986-10-14',NULL,'1','','','2017-03-29 15:15:51',NULL,17,NULL,NULL),
	(3,'m20329517814','陈星','1','13001004507',NULL,'1','50023519821112339X','1982-11-12',NULL,'1','','','2017-03-29 18:33:33',NULL,17,NULL,NULL),
	(4,'m10330464576','辛嘉欣','1','13001004751',NULL,'2','330400198510214143','1985-10-21',NULL,'1','','','2017-03-30 09:23:13',NULL,17,NULL,NULL),
	(5,'m10330083501','韩云彪','1','13001005849',NULL,'1','330803199412317574','1994-12-31',NULL,'1','','','2017-03-30 14:38:42',NULL,17,'m10330083501',NULL),
	(6,'m10330234580','沈瑶霖','1','18800137502',NULL,'2','211001198201030488','1982-01-03',NULL,'1','','深圳鲲鹏科创信息技术有限公司','2017-03-30 15:07:20',NULL,17,NULL,NULL),
	(7,NULL,'何飞',NULL,'18810150237',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-30 15:15:03','2017-03-30 15:15:03',NULL,NULL,6),
	(8,NULL,'顾俊博',NULL,'18810150252',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-30 15:17:48','2017-03-30 15:17:48',NULL,NULL,6),
	(9,NULL,'武彦辉',NULL,'15803213214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-30 15:19:10','2017-03-30 15:19:10',NULL,NULL,6),
	(10,NULL,'田颖',NULL,'15011432387',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-30 15:19:38','2017-03-30 15:19:38',NULL,NULL,6),
	(11,NULL,'王霞',NULL,'13426540987',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-30 15:20:14','2017-03-30 15:20:14',NULL,NULL,6),
	(12,NULL,'陈向成',NULL,'13885671356',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-30 15:21:32','2017-03-30 15:21:32',NULL,NULL,6),
	(13,NULL,'潘盈',NULL,'13331067778',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-30 15:24:34','2017-03-30 15:24:34',NULL,NULL,6),
	(14,NULL,'鄂子桐',NULL,'18911718885',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-30 15:24:54','2017-03-30 15:24:54',NULL,NULL,6),
	(15,NULL,'杨文军',NULL,'13311238558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-30 15:26:07','2017-03-30 15:26:07',NULL,NULL,6),
	(16,NULL,'杨正祥',NULL,'18910592229',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-30 15:26:40','2017-03-30 15:26:40',NULL,NULL,6),
	(17,NULL,'李敏',NULL,'18901059339',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-30 15:58:46','2017-03-30 15:58:46',NULL,NULL,6);

/*!40000 ALTER TABLE `user_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_operator
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_operator`;

CREATE TABLE `user_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operatorNo` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `operatorId` varchar(32) NOT NULL COMMENT '登录帐号',
  `operatorName` varchar(32) DEFAULT NULL COMMENT '用户名称',
  `operatorPwd` varchar(32) DEFAULT NULL COMMENT '登录密码',
  `operatorMobile` varchar(16) DEFAULT NULL COMMENT '用户手机号',
  `status` varchar(1) DEFAULT '1' COMMENT '状态 1：有效   2：锁定',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `lastLoginTime` varchar(20) DEFAULT NULL COMMENT '最后一次登录时间',
  `operatorEffectDate` varchar(20) DEFAULT NULL COMMENT '生效日期',
  `operatorEndDate` varchar(20) DEFAULT NULL COMMENT '截止日期',
  `operatorBirthday` varchar(20) DEFAULT NULL COMMENT '用户生日',
  `operatorContact` varchar(32) DEFAULT NULL COMMENT '联系人',
  `operatorAddress` varchar(512) DEFAULT NULL COMMENT '用户联系地址',
  `operatorSex` varchar(1) DEFAULT '1' COMMENT '用户性别（1：男  2：女）',
  `operatorType` varchar(1) DEFAULT NULL COMMENT '用户类型，1管理员，2操作员，3客户',
  `openId` varchar(32) DEFAULT NULL COMMENT '微信OpenId',
  PRIMARY KEY (`id`),
  UNIQUE KEY `operatorId_Unique` (`operatorId`),
  KEY `operatorId_Normal` (`operatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录用户表';

LOCK TABLES `user_operator` WRITE;
/*!40000 ALTER TABLE `user_operator` DISABLE KEYS */;

INSERT INTO `user_operator` (`id`, `operatorNo`, `operatorId`, `operatorName`, `operatorPwd`, `operatorMobile`, `status`, `createTime`, `updateTime`, `lastLoginTime`, `operatorEffectDate`, `operatorEndDate`, `operatorBirthday`, `operatorContact`, `operatorAddress`, `operatorSex`, `operatorType`, `openId`)
VALUES
	(13,'u00000','admin','超级管理员','q123456','11012345678','1','2016-11-17 10:37:53','2017-03-28 17:51:17','2017-03-29 18:35:15',NULL,NULL,'1988-03-02',NULL,'','2','1',NULL),
	(14,'u198851','lilaoshi','李老师','q123456','11052005200','1','2017-03-28 17:32:08',NULL,'2017-03-30 13:55:01','2017-03-28 17:32:08','2020-07-17','1964-03-03','李老师','北京市东城区第一七一中学',NULL,'2',NULL),
	(15,'u127395','anlaoshi','安老师','q123456','11052105210','1','2017-03-28 17:56:39',NULL,'2017-03-30 16:07:44','2017-03-28 17:56:39','2019-05-11','1987-07-14','安老师','北京市东城区第一七一中学',NULL,'2',NULL),
	(16,'u768349','gelaoshi','葛老师','q123456','11052005200','1','2017-03-28 18:06:37',NULL,'2017-03-30 10:18:58','2017-03-28 18:06:37','2019-06-12','1972-06-30','葛老师','北京市东城区第一七一中学',NULL,'2',NULL),
	(17,'u634127','gulaoshi','顾老师','q123456','11053005300','1','2017-03-28 18:07:31',NULL,'2017-03-30 15:00:33','2017-03-28 18:07:31','2019-06-05','1991-07-31','顾老师','北京市东城区第一七一中学',NULL,'2',NULL),
	(18,NULL,'m10329341170','戚文文','q123456','13001001457','1','2017-03-29 10:40:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3',NULL),
	(19,NULL,'m20329265764','沙君','q123456','13001002222','1','2017-03-29 15:15:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3',NULL),
	(20,NULL,'m20329517814','陈星','q123456','13001004507','1','2017-03-29 18:33:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3',NULL),
	(21,NULL,'m10330464576','辛嘉欣','q123456','13001004751','1','2017-03-30 09:23:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3',NULL),
	(22,NULL,'m10330083501','韩云彪','q123456','13001005849','1','2017-03-30 14:38:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3',NULL),
	(23,NULL,'m10330234580','沈瑶霖','q123456','18800137502','1','2017-03-30 15:07:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3',NULL);

/*!40000 ALTER TABLE `user_operator` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_operator_card
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_operator_card`;

CREATE TABLE `user_operator_card` (
  `operatorId` varchar(32) NOT NULL COMMENT '登录帐号',
  `cardNo` varchar(32) DEFAULT NULL COMMENT '会员卡编号	唯一的',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`operatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员卡绑定多个用户';



# Dump of table user_scheduling
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='排班表';



# Dump of table user_student
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_student`;

CREATE TABLE `user_student` (
  `studentId` int(11) NOT NULL AUTO_INCREMENT,
  `cardId` int(11) DEFAULT NULL COMMENT '学生卡id',
  `studentName` varchar(32) DEFAULT NULL COMMENT '学生姓名',
  `studentGrade` varchar(32) DEFAULT NULL COMMENT '学生年级',
  `studentClass` varchar(32) DEFAULT NULL COMMENT '学生班级',
  `studentMobile` varchar(16) DEFAULT NULL COMMENT '学生手机',
  `siteCount` int(11) DEFAULT NULL COMMENT '用场次数',
  `studentSex` varchar(1) DEFAULT '1' COMMENT '学生性别	1：男，2：女',
  `studentStatus` varchar(1) DEFAULT '1' COMMENT '学生状态	1：有效，2：锁定',
  `studentAddress` varchar(255) DEFAULT NULL COMMENT '学生联系地址',
  `studentRemark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`studentId`),
  UNIQUE KEY `studentMobile` (`studentMobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表';

LOCK TABLES `user_student` WRITE;
/*!40000 ALTER TABLE `user_student` DISABLE KEYS */;

INSERT INTO `user_student` (`studentId`, `cardId`, `studentName`, `studentGrade`, `studentClass`, `studentMobile`, `siteCount`, `studentSex`, `studentStatus`, `studentAddress`, `studentRemark`, `createTime`, `updateTime`, `salesId`)
VALUES
	(1,3,'于震','2006','01','13001002249',0,'1','1','','','2017-03-29 15:28:42',NULL,17),
	(2,6,'薛婕','2016','02','13001004997',0,'2','1','','','2017-03-30 09:24:49',NULL,17);

/*!40000 ALTER TABLE `user_student` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
