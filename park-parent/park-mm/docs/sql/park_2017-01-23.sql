# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.13)
# Database: park
# Generation Time: 2017-01-23 06:19:47 +0000
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
	(1,'G00001','农夫山泉矿泉水',NULL,1,'1',2.00,'1','1',67,'','2017-01-12 17:03:31','2017-01-12 17:16:56',37,1.00),
	(2,'G00002','美汁源果粒橙5L',NULL,1,'1',4.50,'1','1',187,'','2017-01-12 23:39:58',NULL,13,3.00);

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
	(1,1,100,'1','新商品初始化库存100','2017-01-12 17:03:31',NULL,37),
	(2,1,10,'2','商品增加库存10','2017-01-12 17:34:34',NULL,13),
	(3,1,-10,'4','商品损耗库存10','2017-01-12 22:57:21',NULL,13),
	(4,1,-10,'4','商品损耗库存10','2017-01-12 23:05:43',NULL,13),
	(5,1,-10,'4','商品损耗库存10','2017-01-12 23:06:33',NULL,13),
	(6,1,-10,'4','商品损耗库存10','2017-01-12 23:06:43',NULL,13),
	(7,2,210,'1','新商品初始化库存210','2017-01-12 23:39:58',NULL,13),
	(8,2,-20,'4','商品损耗库存20','2017-01-13 00:14:04',NULL,13),
	(9,2,-2,'3','商品销售库存2','2017-01-13 16:15:21',NULL,13),
	(10,1,-3,'3','商品销售库存3','2017-01-13 16:37:52',NULL,37),
	(11,2,-1,'3','商品销售库存1','2017-01-13 16:37:52',NULL,13);

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

LOCK TABLES `good_shopping` WRITE;
/*!40000 ALTER TABLE `good_shopping` DISABLE KEYS */;

INSERT INTO `good_shopping` (`shoppingId`, `goodId`, `shoppingName`, `shoppingGoodAmount`, `createTime`, `updateTime`, `salesId`)
VALUES
	(1,2,'美汁源果粒橙5L',2,'2017-01-14 18:31:24','2017-01-14 18:31:24',13);

/*!40000 ALTER TABLE `good_shopping` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,'食品饮料','','1','2016-11-22 12:04:34',NULL,13),
	(2,'服饰鞋帽','','1','2016-11-22 12:04:55',NULL,13),
	(3,'运动器材','','1','2016-11-22 12:05:14','2016-12-14 23:17:49',13);

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
	(48,72,'m1003112',3000.00,'0','1',2,'2017-01-10 23:23:11',NULL,'',37,0.00),
	(49,73,'m1227746',2940.00,'0','1',2,'2017-01-10 23:34:12','2017-01-11 02:01:34','',37,0.00),
	(50,74,'m1121488',2090.00,'0','1',2,'2017-01-10 23:46:48','2017-01-11 01:36:30','',37,0.00),
	(51,75,'m1851047',10040.00,'0','1',2,'2017-01-11 02:06:56',NULL,'',37,0.00),
	(52,78,'m2806638',0.00,'0','1',1,'2017-01-11 02:15:56',NULL,'教师卡免费',37,0.00),
	(53,NULL,'m3157229',NULL,'0','1',3,'2017-01-11 14:04:43',NULL,NULL,37,50.00);

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
  `signType` varchar(1) DEFAULT NULL COMMENT '签到类型（1：会员  2：散客）',
  `reserveTimeId` int(11) DEFAULT NULL COMMENT '场地预定时间id（不能重复签到）',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `signDate` varchar(20) DEFAULT NULL COMMENT '签到日期',
  PRIMARY KEY (`signId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员场地签到表';



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
	(1,1,2,'美汁源果粒橙5L',9.00,NULL,NULL,2,NULL,'1',NULL,'1'),
	(2,2,1,'农夫山泉矿泉水',6.00,NULL,NULL,3,NULL,'1',NULL,'1'),
	(3,2,2,'美汁源果粒橙5L',4.50,NULL,NULL,1,NULL,'1',NULL,'1'),
	(4,3,1,'【羽毛球】',NULL,'2017-01-14 20:00','2017-01-14 21:00',1,NULL,'2',NULL,'2'),
	(5,3,2,'【羽毛球】',NULL,'2017-01-14 21:00','2017-01-14 22:00',1,NULL,'2',NULL,'2'),
	(6,4,3,'【羽毛球】',NULL,'2017-01-14 20:00','2017-01-14 21:00',1,NULL,'2',NULL,'2'),
	(7,4,4,'【羽毛球】',NULL,'2017-01-14 21:00','2017-01-14 22:00',1,NULL,'2',NULL,'2'),
	(10,6,7,'【羽毛球】',NULL,'2017-01-15 09:00','2017-01-15 11:00',1,NULL,'2',NULL,'2'),
	(11,6,8,'【羽毛球】',NULL,'2017-01-15 09:00','2017-01-15 11:00',1,NULL,'2',NULL,'2'),
	(12,6,9,'【羽毛球】',NULL,'2017-01-15 09:00','2017-01-15 11:00',1,NULL,'2',NULL,'2'),
	(13,7,10,'【羽毛球】',NULL,'2017-01-15 11:00','2017-01-15 13:00',1,NULL,'2',NULL,'2'),
	(14,7,11,'【羽毛球】',NULL,'2017-01-15 11:00','2017-01-15 13:00',1,NULL,'2',NULL,'2'),
	(15,8,12,'【羽毛球】',NULL,'2017-01-15 08:00','2017-01-15 10:00',1,NULL,'2',NULL,'2'),
	(16,9,13,'【羽毛球】',NULL,'2017-01-14 11:00','2017-01-14 13:00',1,NULL,'2',NULL,'2'),
	(17,10,14,'【羽毛球】',NULL,'2017-01-16 08:00','2017-01-22 12:00',1,NULL,'2',NULL,'2'),
	(18,10,15,'【羽毛球】',NULL,'2017-01-16 08:00','2017-01-22 12:00',1,NULL,'2',NULL,'2'),
	(19,11,16,'【羽毛球】',NULL,'2017-01-16 08:00','2017-01-22 12:00',1,NULL,'2',NULL,'2');

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
	(1,'20170113150909',NULL,73,'300','1','1','1','2017-01-13 16:15:21',9.00,9.00,0.00,0.00,NULL,'',2,100,'2017-01-13 15:09:09','2017-01-13 16:15:21',13,NULL,NULL,NULL,'耿若薇','18986338234'),
	(2,'20170113163752',NULL,74,'300','1','1','2','2017-01-13 16:37:52',10.50,10.50,0.00,0.00,NULL,'',4,100,'2017-01-13 16:37:52','2017-01-13 16:37:52',13,NULL,NULL,NULL,'孔映阳','18300888862'),
	(3,'20170114184641',NULL,74,'100','2','1','1','2017-01-14 18:46:41',80.00,80.00,0.00,0.00,NULL,'',2,NULL,'2017-01-14 18:46:41','2017-01-14 18:46:41',13,2,2,0,'孔映阳','18300888862'),
	(4,'20170114184723',NULL,0,'100','2','1','1','2017-01-14 18:47:23',80.00,80.00,0.00,0.00,NULL,'',2,NULL,'2017-01-14 18:47:23','2017-01-14 18:47:23',13,2,2,0,'测散客','19910021233'),
	(6,'20170114222820',NULL,74,'200','2','1','1','2017-01-14 22:39:16',240.00,240.00,0.00,0.00,NULL,'',3,NULL,'2017-01-14 22:28:20','2017-01-14 22:39:16',13,18,18,0,'孔映阳','18300888862'),
	(7,'20170114224335',NULL,0,'200','2','1','3','2017-01-14 22:53:06',160.00,160.00,0.00,0.00,NULL,'',2,NULL,'2017-01-14 22:43:35','2017-01-14 22:53:06',13,8,8,0,'测定场','19901322123'),
	(8,'20170114224532',NULL,73,'200','2','1','2','2017-01-14 22:46:58',80.00,80.00,0.00,0.00,NULL,'',1,NULL,'2017-01-14 22:45:32','2017-01-14 22:46:58',13,2,2,0,'耿若薇','18986338234'),
	(9,'20170114224620',NULL,73,'200','2','1','2','2017-01-14 22:46:20',80.00,80.00,0.00,0.00,NULL,'',1,NULL,'2017-01-14 22:46:20','2017-01-14 22:46:20',13,2,2,0,'耿若薇','18986338234'),
	(10,'20170114231150',NULL,75,'200','2','1','2','2017-01-14 23:23:46',640.00,640.00,0.00,0.00,NULL,'',2,NULL,'2017-01-14 23:11:50','2017-01-14 23:23:46',13,32,32,0,'团博百众','18834842999'),
	(11,'20170114232325',NULL,75,'200','2','1','1','2017-01-14 23:23:25',320.00,320.00,0.00,0.00,NULL,'',1,NULL,'2017-01-14 23:23:25','2017-01-14 23:23:25',13,8,8,0,'团博百众','18834842999');

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
  PRIMARY KEY (`balanceId`),
  UNIQUE KEY `balanceNo_Unique` (`balanceNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收支流水表';

LOCK TABLES `other_balance` WRITE;
/*!40000 ALTER TABLE `other_balance` DISABLE KEYS */;

INSERT INTO `other_balance` (`balanceId`, `balanceNo`, `balanceServiceType`, `balanceServiceId`, `balanceServiceName`, `balanceType`, `balanceStyle`, `balanceCheckNo`, `oldAmount`, `realAmount`, `subAmount`, `givingAmount`, `divBalance`, `balanceStatus`, `serviceDate`, `changeAmount`, `createTime`, `updateTime`, `salesId`, `remark`)
VALUES
	(108,'20170110232311','10',48,NULL,'3','1','',3000.00,3000.00,NULL,NULL,NULL,'1','2017-01-10 23:23:11',NULL,'2017-01-10 23:23:11',NULL,37,NULL),
	(109,'20170110233412','10',49,NULL,'3','2','',2000.00,2000.00,NULL,100.00,NULL,'1','2017-01-10 23:34:12',NULL,'2017-01-10 23:34:12',NULL,37,NULL),
	(110,'20170110234648','10',50,NULL,'3','3','',1200.00,1200.00,NULL,NULL,NULL,'1','2017-01-10 23:46:48',NULL,'2017-01-10 23:46:48',NULL,37,NULL),
	(111,'20170111013126','11',50,NULL,'1','2','',1200.00,1200.00,0.00,10.00,NULL,'1','2017-01-11 01:31:25',NULL,'2017-01-11 01:31:25',NULL,37,''),
	(112,'20170111013630','13',50,NULL,'3','1',NULL,100.00,100.00,0.00,0.00,NULL,NULL,'2017-01-11 01:36:30',NULL,'2017-01-11 01:36:30',NULL,37,''),
	(113,'20170111014908','11',49,NULL,'1','1','',1000.00,1000.00,0.00,0.00,NULL,'1','2017-01-11 01:49:08',NULL,'2017-01-11 01:49:08',NULL,37,''),
	(114,'20170111020134','13',49,NULL,'3','3',NULL,100.00,100.00,0.00,0.00,NULL,NULL,'2017-01-11 02:01:34',NULL,'2017-01-11 02:01:34',NULL,37,''),
	(115,'20170111020656','10',51,NULL,'3','5','xx642123',10000.00,10000.00,NULL,1000.00,NULL,'1','2017-01-11 02:06:56',NULL,'2017-01-11 02:06:56',NULL,37,NULL),
	(116,'20170111021556','10',52,NULL,'3','1',NULL,0.00,0.00,NULL,0.00,NULL,'1','2017-01-11 02:15:56',NULL,'2017-01-11 02:15:56',NULL,37,NULL),
	(117,'20170111140443','10',53,NULL,'3','1',NULL,50.00,50.00,NULL,NULL,NULL,'1','2017-01-11 14:04:43',NULL,'2017-01-11 14:04:43',NULL,37,NULL),
	(118,'20170113161521','300',1,NULL,'3','1',NULL,9.00,9.00,0.00,NULL,NULL,'1','2017-01-13 16:15:21',NULL,'2017-01-13 16:15:21',NULL,13,NULL),
	(119,'20170113163752','300',2,NULL,'3','2',NULL,10.50,10.50,0.00,NULL,NULL,'1','2017-01-13 16:37:52',NULL,'2017-01-13 16:37:52',NULL,13,NULL),
	(120,'20170114184641','100',3,NULL,'3','1',NULL,80.00,80.00,0.00,NULL,NULL,'1','2017-01-14 18:46:41',NULL,'2017-01-14 18:46:41',NULL,13,NULL),
	(121,'20170114184723','100',4,NULL,'3','1',NULL,80.00,80.00,0.00,NULL,NULL,'1','2017-01-14 18:47:23',NULL,'2017-01-14 18:47:23',NULL,13,NULL),
	(122,'20170114223916','200',6,NULL,'3','1',NULL,240.00,240.00,0.00,NULL,NULL,'1','2017-01-14 22:39:16',NULL,'2017-01-14 22:39:16',NULL,13,NULL),
	(123,'20170114224620','200',9,NULL,'3','2',NULL,80.00,80.00,0.00,NULL,NULL,'1','2017-01-14 22:46:20',NULL,'2017-01-14 22:46:20',NULL,13,NULL),
	(124,'20170114224658','200',8,NULL,'3','2',NULL,80.00,80.00,0.00,NULL,NULL,'1','2017-01-14 22:46:58',NULL,'2017-01-14 22:46:58',NULL,13,NULL),
	(125,'20170114225306','200',7,NULL,'3','3',NULL,160.00,160.00,0.00,NULL,NULL,'1','2017-01-14 22:53:06',NULL,'2017-01-14 22:53:06',NULL,13,NULL),
	(126,'20170114232325','200',11,NULL,'3','1',NULL,320.00,320.00,0.00,NULL,NULL,'1','2017-01-14 23:23:25',NULL,'2017-01-14 23:23:25',NULL,13,NULL),
	(127,'20170114232346','200',10,NULL,'3','2',NULL,640.00,640.00,0.00,NULL,NULL,'1','2017-01-14 23:23:46',NULL,'2017-01-14 23:23:46',NULL,13,NULL);

/*!40000 ALTER TABLE `other_balance` ENABLE KEYS */;
UNLOCK TABLES;


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
	(6,'20170110234648','10',74,'北京万为集团','场地费',1200.00,'','2','2017-01-10 23:50:01',NULL,37,'2',NULL,'2'),
	(7,'20170111020656','10',75,'北京团博百众科技有限公司','场地费',10000.00,'','2','2017-01-11 02:07:19',NULL,37,'2',NULL,'1');

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
	(22,'08:00','22:00',NULL,'北京一七一中学体育俱乐部','1','王老师','19010068132','北京市朝阳区和平里北街8号','2016-11-17 10:37:53','2017-01-10 15:05:14',13,5);

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
	(1,'孔映阳','18300888862','1','1','1','1','2017-01-14 18:46:41',NULL,13,74,3),
	(2,'测散客','19910021233','2','1','1','1','2017-01-14 18:47:23',NULL,13,0,4),
	(3,'耿若薇','18986338234','1','2','1','2','2017-01-14 22:08:37',NULL,13,73,5),
	(5,'孔映阳','18300888862','1','1','1','2','2017-01-14 22:28:20',NULL,13,74,6),
	(6,'测定场','19901322123','2','1','1','2','2017-01-14 22:43:35',NULL,13,0,7),
	(7,'耿若薇','18986338234','1','1','1','2','2017-01-14 22:45:32',NULL,13,73,8),
	(8,'耿若薇','18986338234','1','1','1','2','2017-01-14 22:46:20',NULL,13,73,9),
	(9,'团博百众','18834842999','1','1','1','2','2017-01-14 23:11:50',NULL,13,75,10),
	(11,'团博百众','18834842999','1','1','1','2','2017-01-14 23:23:25',NULL,13,75,11);

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
  PRIMARY KEY (`reserveDateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场地预定日期表';

LOCK TABLES `site_reserve_date` WRITE;
/*!40000 ALTER TABLE `site_reserve_date` DISABLE KEYS */;

INSERT INTO `site_reserve_date` (`reserveDateId`, `siteReserveId`, `reserveStartDate`, `reserveEndDate`, `reserveWeek`)
VALUES
	(1,1,'2017-01-14','2017-01-14','6'),
	(2,2,'2017-01-14','2017-01-14','6'),
	(6,5,'2017-01-15','2017-01-15','7'),
	(7,5,'2017-01-15','2017-01-15','7'),
	(8,5,'2017-01-15','2017-01-15','7'),
	(9,6,'2017-01-15','2017-01-15','7'),
	(10,6,'2017-01-15','2017-01-15','7'),
	(11,7,'2017-01-15','2017-01-15','7'),
	(12,8,'2017-01-14','2017-01-14','6'),
	(13,9,'2017-01-16','2017-01-22','3,4'),
	(14,9,'2017-01-16','2017-01-22','3,4'),
	(16,11,'2017-01-16','2017-01-22','3,4');

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
	(1,1,4,'20:00','21:00','2'),
	(2,1,4,'21:00','22:00','2'),
	(3,2,6,'20:00','21:00','2'),
	(4,2,6,'21:00','22:00','2'),
	(7,6,2,'09:00','11:00','2'),
	(8,7,3,'09:00','11:00','2'),
	(9,8,4,'09:00','11:00','2'),
	(10,9,4,'11:00','13:00','2'),
	(11,10,5,'11:00','13:00','2'),
	(12,11,1,'08:00','10:00','2'),
	(13,12,1,'11:00','13:00','2'),
	(14,13,1,'08:00','12:00','2'),
	(15,14,2,'08:00','12:00','2'),
	(16,16,3,'08:00','12:00','2');

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
  PRIMARY KEY (`dictId`),
  KEY `AK_Key_2` (`dictName`,`dictKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `system_dict` WRITE;
/*!40000 ALTER TABLE `system_dict` DISABLE KEYS */;

INSERT INTO `system_dict` (`dictId`, `parentDictId`, `dictName`, `dictKey`, `dictValue`, `dictAdditional`)
VALUES
	(1,NULL,'BALANCE_SERVICE_TYPE','10','注册会员',NULL),
	(2,NULL,'BALANCE_SERVICE_TYPE','11','会员充值',NULL),
	(3,NULL,'BALANCE_SERVICE_TYPE','12','升级会员卡',NULL),
	(4,NULL,'BALANCE_SERVICE_TYPE','13','补办会员卡',NULL),
	(20,NULL,'BALANCE_STATUS','1','已付全款',NULL),
	(21,NULL,'BALANCE_STATUS','2','未付款',NULL),
	(22,NULL,'BALANCE_STATUS','3','部分付款',NULL),
	(30,NULL,'STATUS','1','有效',NULL),
	(31,NULL,'STATUS','2','无效',NULL),
	(40,NULL,'SEX','1','男',NULL),
	(41,NULL,'SEX','2','女',NULL),
	(50,NULL,'BALANCE_STYLE','1','现金',NULL),
	(51,NULL,'BALANCE_STYLE','2','支付宝',NULL),
	(52,NULL,'BALANCE_STYLE','3','微信',NULL),
	(53,NULL,'BALANCE_STYLE','4','银联',NULL),
	(54,NULL,'BALANCE_STYLE','5','支票',NULL),
	(55,NULL,'BALANCE_SERVICE_TYPE','20','教师补办会员卡',NULL),
	(56,NULL,'BALANCE_SERVICE_TYPE','30','学生补办会员卡',NULL),
	(57,NULL,'BALANCE_SERVICE_TYPE','100','场地预订',NULL),
	(58,NULL,'BALANCE_SERVICE_TYPE','200','包场预订',NULL),
	(59,NULL,'BALANCE_SERVICE_TYPE','220','应收款',NULL),
	(60,NULL,'BALANCE_SERVICE_TYPE','300','商品消费',NULL),
	(61,NULL,'BALANCE_STYLE','6','卡余额',NULL);

/*!40000 ALTER TABLE `system_dict` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_menu`;

CREATE TABLE `system_menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单标识',
  `parentMenuId` int(11) DEFAULT NULL COMMENT '父菜单标识',
  `menuName` varchar(32) NOT NULL COMMENT '菜单名称',
  `menuCode` varchar(32) DEFAULT NULL COMMENT '菜单代码',
  `menuURL` text NOT NULL COMMENT '菜单链接',
  `menuStatus` varchar(1) DEFAULT '0' COMMENT '菜单状态：0可用，1不可用',
  `menuSort` int(11) DEFAULT '1' COMMENT '菜单排序',
  `isQuick` varchar(1) DEFAULT '1' COMMENT '快捷方式：1左侧菜单，2左侧快捷，3左侧右上',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

LOCK TABLES `system_menu` WRITE;
/*!40000 ALTER TABLE `system_menu` DISABLE KEYS */;

INSERT INTO `system_menu` (`menuId`, `parentMenuId`, `menuName`, `menuCode`, `menuURL`, `menuStatus`, `menuSort`, `isQuick`)
VALUES
	(1,0,'会员管理',NULL,'','0',1,'1'),
	(2,1,'新会员办理',NULL,'','0',1,'2'),
	(3,1,'会员查询',NULL,'','0',2,'1'),
	(4,1,'会员卡充值',NULL,'','0',3,'1'),
	(5,1,'会员卡升级',NULL,'','1',4,'1'),
	(6,1,'会员卡补办',NULL,'','0',5,'1'),
	(7,1,'应收款管理',NULL,'','0',7,'1'),
	(8,1,'发票登记查询',NULL,'','0',8,'2'),
	(9,1,'会员类型设置',NULL,'','0',9,'1'),
	(10,0,'预订管理',NULL,'','0',4,'1'),
	(11,10,'场地预定',NULL,'','0',1,'2'),
	(12,10,'批量预定',NULL,'','0',3,'2'),
	(13,10,'场地订单',NULL,'','0',4,'1'),
	(14,10,'场地热点分析',NULL,'','1',5,'1'),
	(15,10,'场地设置',NULL,'','0',6,'1'),
	(16,10,'场地类型设置',NULL,'','0',7,'1'),
	(17,0,'商品管理',NULL,'','0',5,'1'),
	(18,17,'商品设置',NULL,'','0',2,'1'),
	(19,17,'进销存管理',NULL,'','0',3,'1'),
	(20,17,'商品销售',NULL,'','0',4,'1'),
	(21,17,'库存明细日志',NULL,'','0',6,'1'),
	(22,0,'数据统计',NULL,'','0',6,'1'),
	(23,22,'会员注册',NULL,'','0',1,'1'),
	(24,22,'营业收支',NULL,'','0',2,'2'),
	(25,22,'场地使用率',NULL,'','0',3,'1'),
	(26,22,'签到记录',NULL,'','0',4,'1'),
	(27,0,'系统设置',NULL,'','0',8,'1'),
	(28,27,'基础设置',NULL,'','0',1,'1'),
	(29,27,'员工信息设置',NULL,'','0',3,'1'),
	(30,27,'员工权限设置',NULL,'','0',2,'1'),
	(31,37,'通知管理',NULL,'','0',1,'1'),
	(32,27,'数据库操作',NULL,'','0',4,'1'),
	(33,27,'系统日志',NULL,'','0',5,'1'),
	(34,10,'定场预订',NULL,'','0',2,'1'),
	(35,0,'教师管理',NULL,'','0',2,'1'),
	(36,0,'学生管理',NULL,'','0',3,'1'),
	(37,0,'办公系统',NULL,'','0',7,'1'),
	(38,0,'个人中心',NULL,'','0',9,'1'),
	(39,1,'会员卡注销',NULL,'','0',6,'1'),
	(40,17,'商品类型设置',NULL,'','0',1,'1'),
	(41,17,'商品订单',NULL,'','0',5,'1'),
	(42,35,'教师办卡',NULL,'','0',1,'1'),
	(43,35,'教师查询',NULL,'','0',2,'1'),
	(44,35,'教师用场统计',NULL,'','0',3,'1'),
	(45,35,'教师订餐统计',NULL,'','0',4,'1'),
	(46,36,'学生办卡',NULL,'','0',1,'1'),
	(47,36,'学生查询',NULL,'','0',2,'1'),
	(48,36,'学生用场统计',NULL,'','0',3,'1'),
	(49,37,'排班管理',NULL,'','0',2,'1'),
	(50,37,'培训报名',NULL,'','0',3,'1'),
	(51,38,'完善信息',NULL,'','0',1,'3'),
	(52,38,'密码重置',NULL,'','0',2,'3'),
	(53,38,'我的消息',NULL,'','0',3,'3');

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
  `roleLevel` int(11) DEFAULT NULL COMMENT '显示优先级',
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
	(2,'会员','1','1',NULL,NULL,'2016-10-13 10:00:00',NULL,NULL),
	(3,'普通用户','1','1',NULL,NULL,'2016-10-13 10:00:00',NULL,NULL),
	(4,'财务经理','1','2','负责金钱有关的业务',NULL,'2016-11-17 11:38:12','2016-12-12 13:06:02',13),
	(5,'前台收银','1','2','收银员工作',NULL,'2016-11-17 14:32:13','2016-12-12 12:52:16',13),
	(6,'场馆经理','1','2','统筹安排场馆工作',NULL,'2016-12-12 12:56:40',NULL,13);

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
	(4,0),
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
	(4,22),
	(4,23),
	(4,24),
	(4,25),
	(4,26),
	(4,27),
	(4,28),
	(4,29),
	(4,30),
	(4,31),
	(4,32),
	(4,33),
	(4,34),
	(4,35),
	(4,36),
	(4,37),
	(4,38),
	(4,39),
	(4,40),
	(4,41),
	(4,42),
	(4,43),
	(4,44),
	(4,45),
	(4,46),
	(4,47),
	(4,48),
	(4,49),
	(4,50),
	(4,51),
	(4,52),
	(4,53),
	(5,0),
	(5,1),
	(5,2),
	(5,3),
	(5,4),
	(5,5),
	(5,6),
	(5,7),
	(5,8),
	(5,9),
	(5,10),
	(5,11),
	(5,12),
	(5,13),
	(5,14),
	(5,15),
	(5,16),
	(5,17),
	(5,18),
	(5,19),
	(5,20),
	(5,21),
	(5,22),
	(5,23),
	(5,24),
	(5,25),
	(5,26),
	(5,27),
	(5,28),
	(5,29),
	(5,30),
	(5,31),
	(5,32),
	(5,33),
	(5,34),
	(5,35),
	(5,36),
	(5,37),
	(5,38),
	(5,39),
	(5,40),
	(5,41),
	(5,42),
	(5,43),
	(5,44),
	(5,45),
	(5,46),
	(5,47),
	(5,48),
	(5,49),
	(5,50),
	(5,51),
	(5,52),
	(5,53),
	(6,0),
	(6,1),
	(6,2),
	(6,3),
	(6,4),
	(6,5),
	(6,6),
	(6,7),
	(6,8),
	(6,9),
	(6,10),
	(6,11),
	(6,12),
	(6,13),
	(6,14),
	(6,15),
	(6,16),
	(6,17),
	(6,18),
	(6,19),
	(6,20),
	(6,21),
	(6,22),
	(6,23),
	(6,24),
	(6,25),
	(6,26),
	(6,27),
	(6,28),
	(6,29),
	(6,30),
	(6,31),
	(6,32),
	(6,33),
	(6,34),
	(6,35),
	(6,36),
	(6,37),
	(6,38),
	(6,39),
	(6,40),
	(6,41),
	(6,42),
	(6,43),
	(6,44),
	(6,45),
	(6,46),
	(6,47),
	(6,48),
	(6,49),
	(6,50),
	(6,51),
	(6,52),
	(6,53);

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
	(2,'1-00-31-12'),
	(2,'1-63-44-73'),
	(2,'1-84-80-26'),
	(2,'m1851047'),
	(2,'m2806638'),
	(4,'lihongxu'),
	(5,'luanbaoshi'),
	(6,'liushaochuan');

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

LOCK TABLES `trains_class` WRITE;
/*!40000 ALTER TABLE `trains_class` DISABLE KEYS */;

INSERT INTO `trains_class` (`id`, `courseId`, `className`, `classRemark`, `saleId`, `createTime`, `updateTime`, `startTime`, `endTime`, `leaderName`, `leaderPhone`, `leaderMobile`, `address`, `classPrice`)
VALUES
	(1,1,'青少年兴趣班','旨在培养青少年对于羽毛球的兴趣爱好；免费的社会服务班级。',13,'2016-12-22 04:24:32','2016-12-23 12:21:10','2016-12-22','2017-01-31','李老师',NULL,'11054343465',NULL,0.00),
	(2,2,'高考突击班','为了迎接半年后的体育高考，特此开设突击班，来为学生打捞基础，提高技能。',13,'2016-12-24 21:59:00','2016-12-24 21:59:00','2016-12-25','2016-12-31','周老师',NULL,'15600901111',NULL,999.00);

/*!40000 ALTER TABLE `trains_class` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `trains_class_students` WRITE;
/*!40000 ALTER TABLE `trains_class_students` DISABLE KEYS */;

INSERT INTO `trains_class_students` (`id`, `studentName`, `studentMobile`, `signTime`, `classId`, `remark`, `saleId`, `createTime`, `payStatus`, `payPrice`, `updateTime`)
VALUES
	(1,'王晓峰','11087654343','2016-12-22 04:25:04',1,'',13,'2016-12-22 04:25:04','1',0.00,'2016-12-22 04:25:04'),
	(2,'赵涛','15726663822','2016-12-24 22:00:05',1,'',13,'2016-12-24 22:00:05','1',0.00,'2016-12-24 22:00:05'),
	(3,'张丽红','15611119762','2016-12-24 22:04:16',1,'',13,'2016-12-24 22:04:16','1',0.00,'2016-12-24 22:04:16'),
	(4,'周子琪','13552830000','2016-12-24 22:04:35',1,'',13,'2016-12-24 22:04:35','1',0.00,'2016-12-24 22:04:35'),
	(5,'钟维晓','15011113723','2016-12-24 22:05:04',1,'',13,'2016-12-24 22:05:04','1',0.00,'2016-12-24 22:05:04'),
	(6,'郭玉萍','18801188002','2016-12-24 22:05:51',1,'',13,'2016-12-24 22:05:51','1',0.00,'2016-12-24 22:05:51'),
	(7,'张婕','18801188011','2016-12-24 22:06:29',1,'',13,'2016-12-24 22:06:29','1',0.00,'2016-12-24 22:06:29'),
	(8,'古月','13901188882','2016-12-24 22:06:54',1,'',13,'2016-12-24 22:06:54','1',0.00,'2016-12-24 22:06:54'),
	(9,'步曙光','13901153127','2016-12-24 22:07:09',1,'',13,'2016-12-24 22:07:09','1',0.00,'2016-12-24 22:07:09'),
	(10,'沙云','15801510835','2016-12-24 22:07:37',1,'',13,'2016-12-24 22:07:37','1',0.00,'2016-12-24 22:07:37'),
	(11,'单怡怡','15810007302','2016-12-24 22:08:13',1,'',13,'2016-12-24 22:08:13','1',0.00,'2016-12-24 22:08:13');

/*!40000 ALTER TABLE `trains_class_students` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `trains_course` WRITE;
/*!40000 ALTER TABLE `trains_course` DISABLE KEYS */;

INSERT INTO `trains_course` (`id`, `courseName`, `courseNo`, `courseRemark`, `saleId`, `createTime`, `updateTime`, `courseTag`, `courseStatus`)
VALUES
	(1,'羽毛球','20161217000026','羽毛球是一项隔着球网，使用长柄网状球拍击打平口端扎有一圈羽毛的半球状软木的室内运动。',13,'2016-12-17 00:02:04','2016-12-17 00:46:11',NULL,'1'),
	(2,'篮球','20161217002238','篮球，是奥运会核心比赛项目，是以手为中心的对抗性体育运动 。',13,'2016-12-17 00:23:27','2016-12-17 11:13:18',NULL,'1'),
	(3,'乒乓球','20161222042223','乒乓球，中国国球，是一种世界流行的球类体育项目，包括进攻、对抗和防守。',13,'2016-12-22 04:23:03','2017-01-15 21:13:28',NULL,'1');

/*!40000 ALTER TABLE `trains_course` ENABLE KEYS */;
UNLOCK TABLES;


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
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员信息表';

LOCK TABLES `user_member` WRITE;
/*!40000 ALTER TABLE `user_member` DISABLE KEYS */;

INSERT INTO `user_member` (`memberId`, `operationId`, `memberName`, `memberType`, `memberMobile`, `memberMobile2`, `memberSex`, `memberIdcard`, `memberBirthday`, `memberPayPassword`, `memberStatus`, `memberAddress`, `memberRemark`, `createTime`, `updateTime`, `salesId`, `tempCardNo`, `parentMemberId`)
VALUES
	(72,'1-00-31-12','江柏忠','1','13841129999',NULL,'1','621224198904268937','1989-04-26',NULL,'1','','','2017-01-10 23:00:21','2017-01-10 23:12:15',37,NULL,NULL),
	(73,'1-84-80-26','耿若薇','1','18986338234',NULL,'2','370403197909181429','1979-09-18',NULL,'1','','','2017-01-10 23:33:53',NULL,37,NULL,NULL),
	(74,'1-63-44-73','孔映阳','1','18300888862',NULL,'1','21012319920924367X','1993-05-24',NULL,'1','','','2017-01-10 23:46:27','2017-01-11 01:14:43',37,NULL,NULL),
	(75,'m1851047','团博百众','1','18834842999',NULL,'1','532628197706110073','1977-06-11',NULL,'1','','企业会员','2017-01-11 02:06:12','2017-01-11 02:07:32',37,NULL,NULL),
	(76,NULL,'于程程',NULL,'15671484848',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-01-11 02:08:10','2017-01-11 02:08:10',NULL,NULL,75),
	(77,NULL,'岳母丹',NULL,'15600111155',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-01-11 02:08:51','2017-01-11 02:08:51',NULL,NULL,75),
	(78,'m2806638','葛婷婷','1','15391577777',NULL,'2','520402198012319821','1980-12-31',NULL,'1','','','2017-01-11 02:15:56','2017-01-11 02:23:14',37,NULL,NULL);

/*!40000 ALTER TABLE `user_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_operator
# ------------------------------------------------------------

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
  `lastLoginTime` varchar(20) DEFAULT NULL COMMENT '最后一次登录时间',
  `operatorNo` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `operatorEffectDate` varchar(20) DEFAULT NULL COMMENT '生效日期',
  `operatorEndDate` varchar(20) DEFAULT NULL COMMENT '截止日期',
  `operatorBirthday` varchar(20) DEFAULT NULL COMMENT '用户生日',
  `operatorContact` varchar(32) DEFAULT NULL COMMENT '联系人',
  `operatorAddress` varchar(512) DEFAULT NULL COMMENT '用户联系地址',
  `operatorSex` varchar(1) DEFAULT NULL COMMENT '用户性别（1：男  2：女）',
  `operatorType` varchar(1) DEFAULT '3' COMMENT '用户类型，1管理员，2操作员，3客户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `operatorId_Unique` (`operatorId`),
  KEY `operatorId_Normal` (`operatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录用户表';

LOCK TABLES `user_operator` WRITE;
/*!40000 ALTER TABLE `user_operator` DISABLE KEYS */;

INSERT INTO `user_operator` (`id`, `operatorId`, `operatorName`, `operatorPwd`, `operatorMobile`, `status`, `createTime`, `updateTime`, `lastLoginTime`, `operatorNo`, `operatorEffectDate`, `operatorEndDate`, `operatorBirthday`, `operatorContact`, `operatorAddress`, `operatorSex`, `operatorType`)
VALUES
	(13,'admin','王军','q123456','11012345678','1','2016-11-17 10:37:53','2016-11-17 11:00:40','2017-01-18 17:12:00','u00000',NULL,NULL,'2016-11-01',NULL,'测测测测V如果让他更让他回合肥规范和风格和风格和符合规范化','1','1'),
	(14,'lihongxu','李洪旭','q123456','11054353422','1','2016-11-17 15:58:58',NULL,'2017-01-06 00:07:58','u00001','2016-11-17','2016-11-30','2016-11-01','李洪旭','和而非开发商就分手的分布式的','1','2'),
	(15,'luanbaoshi','栾宝石','q123456','11097384343','1','2016-11-17 16:03:54',NULL,NULL,'u00002','2016-11-17','2016-12-31','2016-11-01','栾宝石','的所发生的格瑞特二万多问问','1','2'),
	(37,'liushaochuan','刘少川','q123456','11012345678','1','2016-12-12 12:58:13','2017-01-10 17:16:11','2017-01-15 20:48:35','u00003','2016-12-12','2017-03-31','1987-04-10','刘少川','北京市海淀区科学院南路甲14','1','2'),
	(64,'1003112','柏忠','123456','13841129999','1','2017-01-10 23:00:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3'),
	(65,'1848026','耿若薇','123456','18986338234','1','2017-01-10 23:33:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3'),
	(66,'1634473','孔映阳','123456','18300888862','1','2017-01-10 23:46:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3'),
	(67,'m1851047','团博百众','123456','18834842999','1','2017-01-11 02:06:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3'),
	(68,'m2806638','葛婷婷','123456','15391577777','1','2017-01-11 02:15:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3');

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

LOCK TABLES `user_scheduling` WRITE;
/*!40000 ALTER TABLE `user_scheduling` DISABLE KEYS */;

INSERT INTO `user_scheduling` (`schedulingId`, `operatorId`, `date`, `startTime`, `endTime`, `schedulingJob`, `createTime`, `updateTime`, `salesId`)
VALUES
	(1,'lihongxu','2017-01-16','08:00','12:00','','2017-01-15 00:23:18',NULL,13),
	(2,'luanbaoshi','2017-01-15','08:00','22:00','','2017-01-15 20:44:48',NULL,37);

/*!40000 ALTER TABLE `user_scheduling` ENABLE KEYS */;
UNLOCK TABLES;


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
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表';

LOCK TABLES `user_student` WRITE;
/*!40000 ALTER TABLE `user_student` DISABLE KEYS */;

INSERT INTO `user_student` (`studentId`, `cardId`, `studentName`, `studentGrade`, `studentClass`, `studentMobile`, `siteCount`, `studentSex`, `studentStatus`, `studentAddress`, `studentRemark`, `createTime`, `updateTime`, `salesId`)
VALUES
	(4,53,'王小虎','2013','03','15803212421',0,'1','1','','','2017-01-11 14:04:43',NULL,37);

/*!40000 ALTER TABLE `user_student` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
