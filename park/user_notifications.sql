# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.13)
# Database: park
# Generation Time: 2016-11-21 18:29:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table user_notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_notifications`;

CREATE TABLE `user_notifications` (
  `noteId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `noteTitle` varchar(200) DEFAULT NULL COMMENT '通知标题',
  `noteContent` text COMMENT '通知内容',
  `noteSender` int(11) DEFAULT NULL COMMENT '通知发送人',
  `noteReceiver` int(11) DEFAULT NULL COMMENT '通知接收人',
  `noteAttachments` text COMMENT '通知附件',
  `noteStatus` varchar(1) DEFAULT NULL COMMENT '通知状态；1，未读；2，已读；3，未发送',
  `noteCreateTime` varchar(20) DEFAULT NULL COMMENT '通知创建时间',
  `noteReadTime` varchar(20) DEFAULT NULL COMMENT '通知阅读时间',
  `noteUpdateTime` varchar(20) DEFAULT NULL COMMENT '通知更新时间',
  PRIMARY KEY (`noteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_notifications` WRITE;
/*!40000 ALTER TABLE `user_notifications` DISABLE KEYS */;

INSERT INTO `user_notifications` (`noteId`, `noteTitle`, `noteContent`, `noteSender`, `noteReceiver`, `noteAttachments`, `noteStatus`, `noteCreateTime`, `noteReadTime`, `noteUpdateTime`)
VALUES
	(1,'关于2016年场馆建设意见','关于2016年场馆建设意见关于2016年场馆建设意见关于2016年场馆建设意见关于2016年场馆建设意见关于2016年场馆建设意见',13,14,NULL,'2','2016-11-22 00:41:23',NULL,NULL),
	(2,'关于2016年场馆建设意见','关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见。',13,NULL,NULL,'3','2016-11-22 00:57:23',NULL,NULL),
	(3,'关于2016年场馆建设意见','关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见。关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见。关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见。关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见。',13,15,NULL,'1','2016-11-22 01:10:23','2016-11-22 01:11:23',NULL);

/*!40000 ALTER TABLE `user_notifications` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
