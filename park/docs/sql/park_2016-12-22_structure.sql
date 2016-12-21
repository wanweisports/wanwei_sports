# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.13)
# Database: park
# Generation Time: 2016-12-21 20:28:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
	(1,1,'青少年兴趣班','旨在培养青少年对于羽毛球的兴趣爱好；免费的社会服务班级。',13,'2016-12-22 04:24:32','2016-12-22 04:26:34','2016-12-22','2017-01-31','李老师',NULL,'11054343465',NULL,0.00);

/*!40000 ALTER TABLE `trains_class` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
