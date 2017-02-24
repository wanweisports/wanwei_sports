/*
Navicat MySQL Data Transfer

Source Server         : 106.14.72.151
Source Server Version : 50635
Source Host           : 106.14.72.151:3306
Source Database       : park

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-02-23 11:42:36
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
  `collateAmount` decimal(10,2) DEFAULT NULL COMMENT '核对金额',
  `collateStatus` varchar(1) DEFAULT NULL COMMENT '核对状态（1：无误  2：有误）',
  `collateRemark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`collateId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='核对财务表';

-- ----------------------------
-- Records of other_collate_info
-- ----------------------------
INSERT INTO `other_collate_info` VALUES ('1', '1', '75621.00', '75621.00', '1', '对的', '2017-02-23 11:16:43', null, '13');
INSERT INTO `other_collate_info` VALUES ('2', '2', '2701.00', '1701.00', '2', '', '2017-02-23 11:24:19', null, '13');
INSERT INTO `other_collate_info` VALUES ('3', '3', '0.00', '0.00', '2', '才0元？', '2017-02-23 11:24:35', null, '13');
INSERT INTO `other_collate_info` VALUES ('4', '4', '0.00', '100.00', '2', '我怎么多了100', '2017-02-23 11:24:46', null, '13');
