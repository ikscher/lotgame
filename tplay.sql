/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : tplay

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-03-22 16:49:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hov_admin`
-- ----------------------------
DROP TABLE IF EXISTS `hov_admin`;
CREATE TABLE `hov_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `thumb` int(11) NOT NULL DEFAULT '1' COMMENT '管理员头像',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `login_time` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登录ip',
  `admin_cate_id` int(2) NOT NULL DEFAULT '1' COMMENT '管理员分组',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `admin_cate_id` (`admin_cate_id`) USING BTREE,
  KEY `nickname` (`nickname`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_admin
-- ----------------------------
INSERT INTO `hov_admin` VALUES ('1', 'Tplay', 'admin', 'af314b7fd5ecf184709747eba294d8d5', '1', '1510885948', '1517622948', '1553171534', '192.168.1.102', '1');
INSERT INTO `hov_admin` VALUES ('16', 'admin', '', '', '1', '0', '0', null, '192.168.1.109', '1');

-- ----------------------------
-- Table structure for `hov_admin_cate`
-- ----------------------------
DROP TABLE IF EXISTS `hov_admin_cate`;
CREATE TABLE `hov_admin_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `permissions` text COMMENT '权限菜单',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `desc` text COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_admin_cate
-- ----------------------------
INSERT INTO `hov_admin_cate` VALUES ('1', '超级管理员', '4,5,6,7,8,11,13,14,16,17,19,20,21,53,54,55,42,43,44,45,47,48,25,26,28,29,34,35,37,38,39,40,60,61,62,63,71,72,73,74,75,76,77,78,79,80,81,83,84,85,92,93,94,95,96,97,98,104,108,109,111,112', '0', '1553156814', '超级管理员，拥有最高权限！');

-- ----------------------------
-- Table structure for `hov_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `hov_admin_log`;
CREATE TABLE `hov_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_menu_id` int(11) NOT NULL COMMENT '操作菜单id',
  `admin_id` int(11) NOT NULL COMMENT '操作者id',
  `ip` varchar(100) DEFAULT NULL COMMENT '操作ip',
  `operation` varchar(200) DEFAULT NULL COMMENT '操作关联id',
  `create_time` int(11) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=442 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_admin_log
-- ----------------------------
INSERT INTO `hov_admin_log` VALUES ('3', '40', '1', '192.168.1.103', null, '21342143');
INSERT INTO `hov_admin_log` VALUES ('4', '30', '1', '192.168.1.103', null, '343434');
INSERT INTO `hov_admin_log` VALUES ('6', '50', '1', '192.168.1.102', '', '1552396652');
INSERT INTO `hov_admin_log` VALUES ('7', '28', '1', '192.168.1.102', '1', '1552396679');
INSERT INTO `hov_admin_log` VALUES ('8', '28', '1', '192.168.1.102', '1', '1552397046');
INSERT INTO `hov_admin_log` VALUES ('9', '28', '1', '192.168.1.102', '1', '1552397171');
INSERT INTO `hov_admin_log` VALUES ('10', '28', '1', '192.168.1.102', '1', '1552397242');
INSERT INTO `hov_admin_log` VALUES ('11', '28', '1', '192.168.1.102', '1', '1552397246');
INSERT INTO `hov_admin_log` VALUES ('12', '28', '1', '192.168.1.102', '修改角色信息成功', '1552397526');
INSERT INTO `hov_admin_log` VALUES ('13', '28', '1', '192.168.1.102', '修改角色信息成功', '1552398005');
INSERT INTO `hov_admin_log` VALUES ('14', '11', '1', '192.168.1.102', '网站设置提交成功', '1552401448');
INSERT INTO `hov_admin_log` VALUES ('15', '11', '1', '192.168.1.102', '网站设置提交成功', '1552401463');
INSERT INTO `hov_admin_log` VALUES ('16', '11', '1', '192.168.1.107', '网站设置提交成功', '1552442397');
INSERT INTO `hov_admin_log` VALUES ('17', '4', '1', '192.168.1.107', '52', '1552443044');
INSERT INTO `hov_admin_log` VALUES ('18', '4', '1', '192.168.1.107', '52', '1552443174');
INSERT INTO `hov_admin_log` VALUES ('19', '4', '1', '192.168.1.107', '52', '1552449142');
INSERT INTO `hov_admin_log` VALUES ('20', '4', '1', '192.168.1.107', '52', '1552449189');
INSERT INTO `hov_admin_log` VALUES ('21', '4', '1', '192.168.1.107', '53', '1552449405');
INSERT INTO `hov_admin_log` VALUES ('22', '4', '1', '192.168.1.107', '54', '1552449499');
INSERT INTO `hov_admin_log` VALUES ('23', '4', '1', '192.168.1.107', '54', '1552449550');
INSERT INTO `hov_admin_log` VALUES ('24', '4', '1', '192.168.1.107', '53', '1552449566');
INSERT INTO `hov_admin_log` VALUES ('25', '4', '1', '192.168.1.107', '55', '1552449604');
INSERT INTO `hov_admin_log` VALUES ('26', '4', '1', '192.168.1.107', '52', '1552452794');
INSERT INTO `hov_admin_log` VALUES ('27', '4', '1', '192.168.1.107', '53', '1552452890');
INSERT INTO `hov_admin_log` VALUES ('28', '4', '1', '192.168.1.107', '54', '1552452904');
INSERT INTO `hov_admin_log` VALUES ('29', '4', '1', '192.168.1.107', '55', '1552452915');
INSERT INTO `hov_admin_log` VALUES ('30', '28', '1', '192.168.1.107', '修改角色信息成功', '1552458647');
INSERT INTO `hov_admin_log` VALUES ('31', '50', '1', '192.168.1.107', '', '1552526383');
INSERT INTO `hov_admin_log` VALUES ('32', '8', '1', '192.168.1.107', '密码修改成功', '1552526426');
INSERT INTO `hov_admin_log` VALUES ('33', '50', '1', '192.168.1.107', '', '1552526450');
INSERT INTO `hov_admin_log` VALUES ('34', '53', '1', '192.168.1.107', '签到等级添加成功-1', '1552526726');
INSERT INTO `hov_admin_log` VALUES ('35', '54', '1', '192.168.1.107', '签到等级设置成功-1', '1552526735');
INSERT INTO `hov_admin_log` VALUES ('36', '54', '1', '192.168.1.107', '签到等级设置成功-1', '1552526743');
INSERT INTO `hov_admin_log` VALUES ('37', '53', '1', '192.168.1.107', '签到等级修改成功', '1552526904');
INSERT INTO `hov_admin_log` VALUES ('38', '53', '1', '192.168.1.107', '签到等级添加成功-2', '1552526923');
INSERT INTO `hov_admin_log` VALUES ('39', '53', '1', '192.168.1.107', '签到等级添加成功-3', '1552526942');
INSERT INTO `hov_admin_log` VALUES ('40', '53', '1', '192.168.1.107', '签到等级添加成功-4', '1552526955');
INSERT INTO `hov_admin_log` VALUES ('41', '53', '1', '192.168.1.107', '签到等级添加成功-5', '1552526964');
INSERT INTO `hov_admin_log` VALUES ('42', '20', '1', '192.168.1.107', '1', '1552527083');
INSERT INTO `hov_admin_log` VALUES ('43', '20', '1', '192.168.1.107', '1', '1552527087');
INSERT INTO `hov_admin_log` VALUES ('44', '53', '1', '192.168.1.107', '签到等级添加成功-6', '1552527148');
INSERT INTO `hov_admin_log` VALUES ('45', '54', '1', '192.168.1.107', '签到等级设置成功-6', '1552527158');
INSERT INTO `hov_admin_log` VALUES ('46', '53', '1', '192.168.1.107', '签到等级修改成功', '1552527169');
INSERT INTO `hov_admin_log` VALUES ('47', '53', '1', '192.168.1.107', '签到等级添加成功-7', '1552527894');
INSERT INTO `hov_admin_log` VALUES ('48', '54', '1', '192.168.1.107', '签到等级设置成功-7', '1552527898');
INSERT INTO `hov_admin_log` VALUES ('49', '54', '1', '192.168.1.107', '签到等级设置成功-7', '1552527904');
INSERT INTO `hov_admin_log` VALUES ('50', '53', '1', '192.168.1.107', '签到等级添加成功-8', '1552527917');
INSERT INTO `hov_admin_log` VALUES ('51', '55', '1', '192.168.1.107', '删除签到等级成功-8', '1552527922');
INSERT INTO `hov_admin_log` VALUES ('52', '4', '1', '192.168.1.107', '56', '1552528416');
INSERT INTO `hov_admin_log` VALUES ('53', '4', '1', '192.168.1.107', '56', '1552528592');
INSERT INTO `hov_admin_log` VALUES ('54', '4', '1', '192.168.1.107', '57', '1552528804');
INSERT INTO `hov_admin_log` VALUES ('55', '4', '1', '192.168.1.107', '57', '1552528951');
INSERT INTO `hov_admin_log` VALUES ('56', '4', '1', '192.168.1.107', '56', '1552529132');
INSERT INTO `hov_admin_log` VALUES ('57', '4', '1', '192.168.1.107', '57', '1552529188');
INSERT INTO `hov_admin_log` VALUES ('58', '4', '1', '192.168.1.107', '57', '1552529363');
INSERT INTO `hov_admin_log` VALUES ('59', '4', '1', '192.168.1.107', '58', '1552529760');
INSERT INTO `hov_admin_log` VALUES ('60', '5', '1', '192.168.1.107', '58', '1552530456');
INSERT INTO `hov_admin_log` VALUES ('61', '5', '1', '192.168.1.107', '57', '1552530463');
INSERT INTO `hov_admin_log` VALUES ('62', '5', '1', '192.168.1.107', '56', '1552530473');
INSERT INTO `hov_admin_log` VALUES ('63', '4', '1', '192.168.1.107', '31', '1552530517');
INSERT INTO `hov_admin_log` VALUES ('64', '4', '1', '192.168.1.107', '32', '1552530554');
INSERT INTO `hov_admin_log` VALUES ('65', '4', '1', '192.168.1.107', '36', '1552530575');
INSERT INTO `hov_admin_log` VALUES ('66', '4', '1', '192.168.1.107', '36', '1552533893');
INSERT INTO `hov_admin_log` VALUES ('67', '4', '1', '192.168.1.107', '32', '1552534595');
INSERT INTO `hov_admin_log` VALUES ('68', '4', '1', '192.168.1.107', '36', '1552534640');
INSERT INTO `hov_admin_log` VALUES ('69', '4', '1', '192.168.1.107', '36', '1552534734');
INSERT INTO `hov_admin_log` VALUES ('70', '4', '1', '192.168.1.107', '41', '1552534874');
INSERT INTO `hov_admin_log` VALUES ('71', '4', '1', '192.168.1.107', '46', '1552534907');
INSERT INTO `hov_admin_log` VALUES ('72', '4', '1', '192.168.1.107', '59', '1552534989');
INSERT INTO `hov_admin_log` VALUES ('73', '34', '1', '192.168.1.107', '1', '1552537765');
INSERT INTO `hov_admin_log` VALUES ('74', '49', '1', '192.168.1.107', '2', '1552537822');
INSERT INTO `hov_admin_log` VALUES ('75', '37', '1', '192.168.1.107', '1', '1552537824');
INSERT INTO `hov_admin_log` VALUES ('76', '49', '1', '192.168.1.107', '3', '1552548375');
INSERT INTO `hov_admin_log` VALUES ('77', '37', '1', '192.168.1.107', '2', '1552548392');
INSERT INTO `hov_admin_log` VALUES ('78', '49', '1', '192.168.1.107', '4', '1552550879');
INSERT INTO `hov_admin_log` VALUES ('79', '37', '1', '192.168.1.107', '3', '1552550880');
INSERT INTO `hov_admin_log` VALUES ('80', '40', '1', '192.168.1.107', '3', '1552550885');
INSERT INTO `hov_admin_log` VALUES ('81', '4', '1', '192.168.1.107', '60', '1552554050');
INSERT INTO `hov_admin_log` VALUES ('82', '4', '1', '192.168.1.107', '60', '1552554069');
INSERT INTO `hov_admin_log` VALUES ('83', '4', '1', '192.168.1.107', '61', '1552554116');
INSERT INTO `hov_admin_log` VALUES ('84', '4', '1', '192.168.1.107', '62', '1552554163');
INSERT INTO `hov_admin_log` VALUES ('85', '4', '1', '192.168.1.107', '63', '1552554205');
INSERT INTO `hov_admin_log` VALUES ('86', '50', '1', '192.168.1.102', '', '1552567328');
INSERT INTO `hov_admin_log` VALUES ('87', '28', '1', '192.168.1.102', '修改角色信息成功', '1552569820');
INSERT INTO `hov_admin_log` VALUES ('88', '60', '1', '192.168.1.102', '添加公告成功-50', '1552569834');
INSERT INTO `hov_admin_log` VALUES ('89', '61', '1', '192.168.1.102', '公告设置状态成功-50', '1552569975');
INSERT INTO `hov_admin_log` VALUES ('90', '61', '1', '192.168.1.102', '公告设置状态成功-50', '1552569980');
INSERT INTO `hov_admin_log` VALUES ('91', '62', '1', '192.168.1.102', '公告置顶设置成功-50', '1552569983');
INSERT INTO `hov_admin_log` VALUES ('92', '62', '1', '192.168.1.102', '公告置顶设置成功-50', '1552569985');
INSERT INTO `hov_admin_log` VALUES ('93', '62', '1', '192.168.1.102', '公告置顶设置成功-50', '1552569986');
INSERT INTO `hov_admin_log` VALUES ('94', '62', '1', '192.168.1.102', '公告置顶设置成功-49', '1552569999');
INSERT INTO `hov_admin_log` VALUES ('95', '62', '1', '192.168.1.102', '公告置顶设置成功-49', '1552570019');
INSERT INTO `hov_admin_log` VALUES ('96', '61', '1', '192.168.1.102', '公告设置状态成功-49', '1552570020');
INSERT INTO `hov_admin_log` VALUES ('97', '49', '1', '192.168.1.102', '5', '1552570746');
INSERT INTO `hov_admin_log` VALUES ('98', '37', '1', '192.168.1.102', '4', '1552570770');
INSERT INTO `hov_admin_log` VALUES ('99', '49', '1', '192.168.1.102', '6', '1552571665');
INSERT INTO `hov_admin_log` VALUES ('100', '49', '1', '192.168.1.102', '7', '1552571816');
INSERT INTO `hov_admin_log` VALUES ('101', '37', '1', '192.168.1.102', '添加活动成功-5', '1552571907');
INSERT INTO `hov_admin_log` VALUES ('102', '40', '1', '192.168.1.102', '5', '1552572162');
INSERT INTO `hov_admin_log` VALUES ('103', '37', '1', '192.168.1.102', '修改成功-4', '1552572278');
INSERT INTO `hov_admin_log` VALUES ('104', '4', '1', '192.168.1.107', '64', '1552615251');
INSERT INTO `hov_admin_log` VALUES ('105', '4', '1', '192.168.1.107', '64', '1552615591');
INSERT INTO `hov_admin_log` VALUES ('106', '4', '1', '192.168.1.107', '65', '1552615700');
INSERT INTO `hov_admin_log` VALUES ('107', '4', '1', '192.168.1.107', '66', '1552615922');
INSERT INTO `hov_admin_log` VALUES ('108', '4', '1', '192.168.1.107', '66', '1552615939');
INSERT INTO `hov_admin_log` VALUES ('109', '4', '1', '192.168.1.107', '65', '1552615973');
INSERT INTO `hov_admin_log` VALUES ('110', '4', '1', '192.168.1.107', '67', '1552616198');
INSERT INTO `hov_admin_log` VALUES ('111', '4', '1', '192.168.1.107', '68', '1552616333');
INSERT INTO `hov_admin_log` VALUES ('112', '4', '1', '192.168.1.107', '69', '1552616387');
INSERT INTO `hov_admin_log` VALUES ('113', '4', '1', '192.168.1.107', '70', '1552616781');
INSERT INTO `hov_admin_log` VALUES ('114', '4', '1', '192.168.1.107', '65', '1552616937');
INSERT INTO `hov_admin_log` VALUES ('115', '4', '1', '192.168.1.107', '66', '1552617173');
INSERT INTO `hov_admin_log` VALUES ('116', '4', '1', '192.168.1.107', '65', '1552619073');
INSERT INTO `hov_admin_log` VALUES ('117', '4', '1', '192.168.1.107', '71', '1552619261');
INSERT INTO `hov_admin_log` VALUES ('118', '4', '1', '192.168.1.107', '72', '1552619308');
INSERT INTO `hov_admin_log` VALUES ('119', '34', '1', '192.168.1.107', '2', '1552619459');
INSERT INTO `hov_admin_log` VALUES ('120', '34', '1', '192.168.1.107', '3', '1552619470');
INSERT INTO `hov_admin_log` VALUES ('121', '34', '1', '192.168.1.107', '4', '1552619482');
INSERT INTO `hov_admin_log` VALUES ('122', '34', '1', '192.168.1.107', '5', '1552619502');
INSERT INTO `hov_admin_log` VALUES ('123', '34', '1', '192.168.1.107', '6', '1552619613');
INSERT INTO `hov_admin_log` VALUES ('124', '35', '1', '192.168.1.107', '6', '1552619622');
INSERT INTO `hov_admin_log` VALUES ('125', '28', '1', '192.168.1.107', '修改角色信息成功', '1552619847');
INSERT INTO `hov_admin_log` VALUES ('126', '71', '1', '192.168.1.107', '添加奖品分类成功-2', '1552619867');
INSERT INTO `hov_admin_log` VALUES ('127', '71', '1', '192.168.1.107', '添加奖品分类成功-3', '1552619876');
INSERT INTO `hov_admin_log` VALUES ('128', '71', '1', '192.168.1.107', '添加奖品分类成功-4', '1552619962');
INSERT INTO `hov_admin_log` VALUES ('129', '72', '1', '192.168.1.107', '删除奖品分类成功-4', '1552619967');
INSERT INTO `hov_admin_log` VALUES ('130', '4', '1', '192.168.1.107', '64', '1552632780');
INSERT INTO `hov_admin_log` VALUES ('131', '4', '1', '192.168.1.107', '64', '1552632831');
INSERT INTO `hov_admin_log` VALUES ('132', '4', '1', '192.168.1.107', '66', '1552632878');
INSERT INTO `hov_admin_log` VALUES ('133', '49', '1', '192.168.1.107', '8', '1552634229');
INSERT INTO `hov_admin_log` VALUES ('134', '49', '1', '192.168.1.107', '9', '1552634372');
INSERT INTO `hov_admin_log` VALUES ('135', '49', '1', '192.168.1.107', '10', '1552635658');
INSERT INTO `hov_admin_log` VALUES ('136', '49', '1', '192.168.1.107', '11', '1552635796');
INSERT INTO `hov_admin_log` VALUES ('137', '28', '1', '192.168.1.107', '修改角色信息成功', '1552637440');
INSERT INTO `hov_admin_log` VALUES ('138', '49', '1', '192.168.1.107', '12', '1552637469');
INSERT INTO `hov_admin_log` VALUES ('139', '73', '1', '192.168.1.107', '添加奖品成功-5', '1552637483');
INSERT INTO `hov_admin_log` VALUES ('140', '73', '1', '192.168.1.107', '修改奖品成功-5', '1552637767');
INSERT INTO `hov_admin_log` VALUES ('141', '73', '1', '192.168.1.107', '修改奖品成功-5', '1552637775');
INSERT INTO `hov_admin_log` VALUES ('142', '4', '1', '192.168.1.102', '75', '1552660116');
INSERT INTO `hov_admin_log` VALUES ('143', '4', '1', '192.168.1.102', '76', '1552660152');
INSERT INTO `hov_admin_log` VALUES ('144', '28', '1', '192.168.1.102', '修改角色信息成功', '1552660193');
INSERT INTO `hov_admin_log` VALUES ('145', '75', '1', '192.168.1.102', '修改奖品评论成功-1', '1552662557');
INSERT INTO `hov_admin_log` VALUES ('146', '75', '1', '192.168.1.102', '修改奖品评论成功-1', '1552662570');
INSERT INTO `hov_admin_log` VALUES ('147', '76', '1', '192.168.1.102', '删除奖品评论成功-2', '1552662873');
INSERT INTO `hov_admin_log` VALUES ('148', '75', '1', '192.168.1.102', '修改奖品评论成功-1', '1552662969');
INSERT INTO `hov_admin_log` VALUES ('149', '54', '1', '192.168.1.102', '签到等级设置成功-6', '1552663131');
INSERT INTO `hov_admin_log` VALUES ('150', '54', '1', '192.168.1.102', '签到等级设置成功-6', '1552663136');
INSERT INTO `hov_admin_log` VALUES ('151', '50', '1', '192.168.1.102', '', '1552696213');
INSERT INTO `hov_admin_log` VALUES ('152', '75', '1', '192.168.1.102', '修改奖品评论成功-1', '1552696573');
INSERT INTO `hov_admin_log` VALUES ('153', '75', '1', '192.168.1.102', '修改奖品评论成功-1', '1552696584');
INSERT INTO `hov_admin_log` VALUES ('154', '75', '1', '192.168.1.102', '修改奖品评论成功-1', '1552697801');
INSERT INTO `hov_admin_log` VALUES ('155', '75', '1', '192.168.1.102', '修改奖品评论成功-1', '1552697808');
INSERT INTO `hov_admin_log` VALUES ('156', '4', '1', '192.168.1.102', '68', '1552699618');
INSERT INTO `hov_admin_log` VALUES ('157', '4', '1', '192.168.1.102', '68', '1552700024');
INSERT INTO `hov_admin_log` VALUES ('158', '4', '1', '192.168.1.102', '77', '1552702032');
INSERT INTO `hov_admin_log` VALUES ('159', '4', '1', '192.168.1.102', '78', '1552702102');
INSERT INTO `hov_admin_log` VALUES ('160', '4', '1', '192.168.1.102', '77', '1552702120');
INSERT INTO `hov_admin_log` VALUES ('161', '4', '1', '192.168.1.102', '79', '1552702179');
INSERT INTO `hov_admin_log` VALUES ('162', '28', '1', '192.168.1.102', '修改角色信息成功', '1552717064');
INSERT INTO `hov_admin_log` VALUES ('163', '61', '1', '192.168.1.102', '公告设置状态成功-48', '1552721471');
INSERT INTO `hov_admin_log` VALUES ('164', '61', '1', '192.168.1.102', '公告设置状态成功-48', '1552721473');
INSERT INTO `hov_admin_log` VALUES ('165', '61', '1', '192.168.1.102', '公告设置状态成功-49', '1552721475');
INSERT INTO `hov_admin_log` VALUES ('166', '61', '1', '192.168.1.102', '公告设置状态成功-49', '1552721482');
INSERT INTO `hov_admin_log` VALUES ('167', '77', '1', '192.168.1.102', '6', '1552723547');
INSERT INTO `hov_admin_log` VALUES ('168', '77', '1', '192.168.1.102', '1', '1552723553');
INSERT INTO `hov_admin_log` VALUES ('169', '77', '1', '192.168.1.102', '7', '1552723651');
INSERT INTO `hov_admin_log` VALUES ('170', '77', '1', '192.168.1.102', '10', '1552723653');
INSERT INTO `hov_admin_log` VALUES ('171', '77', '1', '192.168.1.102', '3', '1552724355');
INSERT INTO `hov_admin_log` VALUES ('172', '77', '1', '192.168.1.102', '8', '1552724365');
INSERT INTO `hov_admin_log` VALUES ('173', '77', '1', '192.168.1.102', '11', '1552724379');
INSERT INTO `hov_admin_log` VALUES ('174', '77', '1', '192.168.1.102', '4', '1552724419');
INSERT INTO `hov_admin_log` VALUES ('175', '77', '1', '192.168.1.102', '10', '1552724658');
INSERT INTO `hov_admin_log` VALUES ('176', '77', '1', '192.168.1.102', '3', '1552724786');
INSERT INTO `hov_admin_log` VALUES ('177', '77', '1', '192.168.1.102', '8', '1552724792');
INSERT INTO `hov_admin_log` VALUES ('178', '77', '1', '192.168.1.102', '7', '1552724796');
INSERT INTO `hov_admin_log` VALUES ('179', '77', '1', '192.168.1.102', '1', '1552734283');
INSERT INTO `hov_admin_log` VALUES ('180', '77', '1', '192.168.1.102', '5', '1552734336');
INSERT INTO `hov_admin_log` VALUES ('181', '77', '1', '192.168.1.102', '6', '1552734339');
INSERT INTO `hov_admin_log` VALUES ('182', '79', '1', '192.168.1.102', '删除兑换记录-4', '1552734346');
INSERT INTO `hov_admin_log` VALUES ('183', '4', '1', '192.168.1.102', '69', '1552735018');
INSERT INTO `hov_admin_log` VALUES ('184', '77', '1', '192.168.1.102', '10', '1552735102');
INSERT INTO `hov_admin_log` VALUES ('185', '50', '1', '192.168.1.102', '', '1552789043');
INSERT INTO `hov_admin_log` VALUES ('186', '4', '1', '192.168.1.102', '52', '1552789871');
INSERT INTO `hov_admin_log` VALUES ('187', '4', '1', '192.168.1.102', '53', '1552789887');
INSERT INTO `hov_admin_log` VALUES ('188', '4', '1', '192.168.1.102', '54', '1552789900');
INSERT INTO `hov_admin_log` VALUES ('189', '4', '1', '192.168.1.102', '55', '1552789913');
INSERT INTO `hov_admin_log` VALUES ('190', '53', '1', '192.168.1.102', '签到等级修改成功', '1552790060');
INSERT INTO `hov_admin_log` VALUES ('191', '4', '1', '192.168.1.102', '70', '1552790354');
INSERT INTO `hov_admin_log` VALUES ('192', '4', '1', '192.168.1.102', '70', '1552790384');
INSERT INTO `hov_admin_log` VALUES ('193', '4', '1', '192.168.1.102', '80', '1552790476');
INSERT INTO `hov_admin_log` VALUES ('194', '4', '1', '192.168.1.102', '81', '1552790520');
INSERT INTO `hov_admin_log` VALUES ('195', '4', '1', '192.168.1.102', '22', '1552791854');
INSERT INTO `hov_admin_log` VALUES ('196', '28', '1', '192.168.1.102', '修改角色信息成功', '1552792082');
INSERT INTO `hov_admin_log` VALUES ('197', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552809791');
INSERT INTO `hov_admin_log` VALUES ('198', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552809799');
INSERT INTO `hov_admin_log` VALUES ('199', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552810311');
INSERT INTO `hov_admin_log` VALUES ('200', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552810318');
INSERT INTO `hov_admin_log` VALUES ('201', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552811254');
INSERT INTO `hov_admin_log` VALUES ('202', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552812625');
INSERT INTO `hov_admin_log` VALUES ('203', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552812836');
INSERT INTO `hov_admin_log` VALUES ('204', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552812847');
INSERT INTO `hov_admin_log` VALUES ('205', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552812894');
INSERT INTO `hov_admin_log` VALUES ('206', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552812902');
INSERT INTO `hov_admin_log` VALUES ('207', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552812910');
INSERT INTO `hov_admin_log` VALUES ('208', '80', '1', '192.168.1.102', '兑换手续费规则添加成功-2', '1552813146');
INSERT INTO `hov_admin_log` VALUES ('209', '80', '1', '192.168.1.102', '兑换手续费规则添加成功-3', '1552813395');
INSERT INTO `hov_admin_log` VALUES ('210', '80', '1', '192.168.1.102', '兑换手续费规则添加成功-4', '1552813511');
INSERT INTO `hov_admin_log` VALUES ('211', '81', '1', '192.168.1.102', '兑换手续费规则删除成功-3', '1552813522');
INSERT INTO `hov_admin_log` VALUES ('212', '80', '1', '192.168.1.102', '兑换手续费规则添加成功-5', '1552813557');
INSERT INTO `hov_admin_log` VALUES ('213', '81', '1', '192.168.1.102', '兑换手续费规则删除成功-5', '1552813588');
INSERT INTO `hov_admin_log` VALUES ('214', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552822377');
INSERT INTO `hov_admin_log` VALUES ('215', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552822401');
INSERT INTO `hov_admin_log` VALUES ('216', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552822409');
INSERT INTO `hov_admin_log` VALUES ('217', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1552822418');
INSERT INTO `hov_admin_log` VALUES ('218', '4', '1', '192.168.1.102', '82', '1552823552');
INSERT INTO `hov_admin_log` VALUES ('219', '4', '1', '192.168.1.102', '82', '1552823677');
INSERT INTO `hov_admin_log` VALUES ('220', '4', '1', '192.168.1.102', '65', '1552823767');
INSERT INTO `hov_admin_log` VALUES ('221', '4', '1', '192.168.1.102', '82', '1552826557');
INSERT INTO `hov_admin_log` VALUES ('222', '50', '1', '192.168.1.107', '', '1552872813');
INSERT INTO `hov_admin_log` VALUES ('223', '53', '1', '192.168.1.107', '签到等级修改成功', '1552873408');
INSERT INTO `hov_admin_log` VALUES ('224', '4', '1', '192.168.1.107', '84', '1552875093');
INSERT INTO `hov_admin_log` VALUES ('225', '4', '1', '192.168.1.107', '85', '1552875129');
INSERT INTO `hov_admin_log` VALUES ('226', '28', '1', '192.168.1.107', '修改角色信息成功', '1552875156');
INSERT INTO `hov_admin_log` VALUES ('227', '83', '1', '192.168.1.107', '流水手续费修改成功', '1552875165');
INSERT INTO `hov_admin_log` VALUES ('228', '83', '1', '192.168.1.107', '流水手续费修改成功', '1552875169');
INSERT INTO `hov_admin_log` VALUES ('229', '84', '1', '192.168.1.107', '添加用户手续费规则成功-1', '1552875272');
INSERT INTO `hov_admin_log` VALUES ('230', '84', '1', '192.168.1.107', '添加用户手续费规则成功-2', '1552876270');
INSERT INTO `hov_admin_log` VALUES ('231', '84', '1', '192.168.1.107', '添加用户手续费规则成功-3', '1552876333');
INSERT INTO `hov_admin_log` VALUES ('232', '4', '1', '192.168.1.107', '85', '1552876361');
INSERT INTO `hov_admin_log` VALUES ('233', '84', '1', '192.168.1.107', '添加用户手续费规则成功-4', '1552876408');
INSERT INTO `hov_admin_log` VALUES ('234', '85', '1', '192.168.1.107', '用户兑换手续费规则删除成功-4', '1552876412');
INSERT INTO `hov_admin_log` VALUES ('235', '83', '1', '192.168.1.107', '流水手续费修改成功', '1552877263');
INSERT INTO `hov_admin_log` VALUES ('236', '83', '1', '192.168.1.107', '流水手续费修改成功', '1552877267');
INSERT INTO `hov_admin_log` VALUES ('237', '83', '1', '192.168.1.107', '流水手续费修改成功', '1552877328');
INSERT INTO `hov_admin_log` VALUES ('238', '83', '1', '192.168.1.107', '流水手续费修改成功', '1552877331');
INSERT INTO `hov_admin_log` VALUES ('239', '4', '1', '192.168.1.107', '86', '1552877606');
INSERT INTO `hov_admin_log` VALUES ('240', '4', '1', '192.168.1.107', '86', '1552877632');
INSERT INTO `hov_admin_log` VALUES ('241', '4', '1', '192.168.1.107', '86', '1552877812');
INSERT INTO `hov_admin_log` VALUES ('242', '4', '1', '192.168.1.107', '86', '1552877842');
INSERT INTO `hov_admin_log` VALUES ('243', '4', '1', '192.168.1.107', '87', '1552878214');
INSERT INTO `hov_admin_log` VALUES ('244', '4', '1', '192.168.1.107', '87', '1552878333');
INSERT INTO `hov_admin_log` VALUES ('245', '4', '1', '192.168.1.107', '88', '1552878363');
INSERT INTO `hov_admin_log` VALUES ('246', '4', '1', '192.168.1.107', '87', '1552878566');
INSERT INTO `hov_admin_log` VALUES ('247', '4', '1', '192.168.1.107', '89', '1552878715');
INSERT INTO `hov_admin_log` VALUES ('248', '4', '1', '192.168.1.107', '90', '1552878842');
INSERT INTO `hov_admin_log` VALUES ('249', '4', '1', '192.168.1.107', '91', '1552879181');
INSERT INTO `hov_admin_log` VALUES ('250', '4', '1', '192.168.1.107', '92', '1552879872');
INSERT INTO `hov_admin_log` VALUES ('251', '4', '1', '192.168.1.107', '93', '1552879903');
INSERT INTO `hov_admin_log` VALUES ('252', '28', '1', '192.168.1.107', '修改角色信息成功', '1552880443');
INSERT INTO `hov_admin_log` VALUES ('253', '92', '1', '192.168.1.107', '修改用户级别成功-2', '1552881923');
INSERT INTO `hov_admin_log` VALUES ('254', '92', '1', '192.168.1.107', '修改用户级别成功-2', '1552881954');
INSERT INTO `hov_admin_log` VALUES ('255', '92', '1', '192.168.1.107', '添加用户级别成功-4', '1552881974');
INSERT INTO `hov_admin_log` VALUES ('256', '93', '1', '192.168.1.107', '删除用户级别成功-4', '1552881980');
INSERT INTO `hov_admin_log` VALUES ('257', '4', '1', '192.168.1.107', '94', '1552893155');
INSERT INTO `hov_admin_log` VALUES ('258', '4', '1', '192.168.1.107', '95', '1552893191');
INSERT INTO `hov_admin_log` VALUES ('259', '4', '1', '192.168.1.107', '96', '1552893423');
INSERT INTO `hov_admin_log` VALUES ('260', '4', '1', '192.168.1.107', '97', '1552893452');
INSERT INTO `hov_admin_log` VALUES ('261', '4', '1', '192.168.1.107', '98', '1552893480');
INSERT INTO `hov_admin_log` VALUES ('262', '50', '1', '192.168.1.102', '', '1552912401');
INSERT INTO `hov_admin_log` VALUES ('263', '28', '1', '192.168.1.102', '修改角色信息成功', '1552914583');
INSERT INTO `hov_admin_log` VALUES ('264', '95', '1', '192.168.1.102', '删除用户成功-3', '1552914775');
INSERT INTO `hov_admin_log` VALUES ('265', '28', '1', '192.168.1.102', '修改角色信息成功', '1552914827');
INSERT INTO `hov_admin_log` VALUES ('266', '28', '1', '192.168.1.102', '修改角色信息成功', '1552914976');
INSERT INTO `hov_admin_log` VALUES ('267', '4', '1', '192.168.1.102', '94', '1552915492');
INSERT INTO `hov_admin_log` VALUES ('268', '50', '1', '192.168.1.102', '', '1552919264');
INSERT INTO `hov_admin_log` VALUES ('269', '50', '1', '192.168.1.102', '', '1552919358');
INSERT INTO `hov_admin_log` VALUES ('270', '49', '1', '192.168.1.102', '13', '1552920567');
INSERT INTO `hov_admin_log` VALUES ('271', '49', '1', '192.168.1.102', '14', '1552920912');
INSERT INTO `hov_admin_log` VALUES ('272', '94', '1', '192.168.1.102', '修改用户信息成功-2', '1552920919');
INSERT INTO `hov_admin_log` VALUES ('273', '49', '1', '192.168.1.102', '15', '1552921021');
INSERT INTO `hov_admin_log` VALUES ('274', '94', '1', '192.168.1.102', '修改用户信息成功-2', '1552921023');
INSERT INTO `hov_admin_log` VALUES ('275', '49', '1', '192.168.1.102', '16', '1552921093');
INSERT INTO `hov_admin_log` VALUES ('276', '94', '1', '192.168.1.102', '修改用户信息成功-2', '1552921094');
INSERT INTO `hov_admin_log` VALUES ('277', '28', '1', '192.168.1.107', '修改角色信息成功', '1552959439');
INSERT INTO `hov_admin_log` VALUES ('278', '28', '1', '192.168.1.107', '修改角色信息成功', '1552959515');
INSERT INTO `hov_admin_log` VALUES ('279', '96', '1', '192.168.1.107', '冻结用户成功-2', '1552959573');
INSERT INTO `hov_admin_log` VALUES ('280', '96', '1', '192.168.1.107', '冻结用户成功-1', '1552960349');
INSERT INTO `hov_admin_log` VALUES ('281', '96', '1', '192.168.1.107', '解冻用户成功-1', '1552960926');
INSERT INTO `hov_admin_log` VALUES ('282', '96', '1', '192.168.1.107', '冻结用户成功-1', '1552960989');
INSERT INTO `hov_admin_log` VALUES ('283', '96', '1', '192.168.1.107', '解冻用户成功-2', '1552961129');
INSERT INTO `hov_admin_log` VALUES ('284', '96', '1', '192.168.1.107', '冻结用户成功-1', '1552961134');
INSERT INTO `hov_admin_log` VALUES ('285', '96', '1', '192.168.1.107', '解冻用户成功-1', '1552961144');
INSERT INTO `hov_admin_log` VALUES ('286', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552979199');
INSERT INTO `hov_admin_log` VALUES ('287', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552979743');
INSERT INTO `hov_admin_log` VALUES ('288', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552979964');
INSERT INTO `hov_admin_log` VALUES ('289', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552979978');
INSERT INTO `hov_admin_log` VALUES ('290', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552980054');
INSERT INTO `hov_admin_log` VALUES ('291', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552980135');
INSERT INTO `hov_admin_log` VALUES ('292', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552980146');
INSERT INTO `hov_admin_log` VALUES ('293', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552980400');
INSERT INTO `hov_admin_log` VALUES ('294', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552980845');
INSERT INTO `hov_admin_log` VALUES ('295', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552980856');
INSERT INTO `hov_admin_log` VALUES ('296', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552980882');
INSERT INTO `hov_admin_log` VALUES ('297', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552980902');
INSERT INTO `hov_admin_log` VALUES ('298', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552980954');
INSERT INTO `hov_admin_log` VALUES ('299', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552981129');
INSERT INTO `hov_admin_log` VALUES ('300', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552981211');
INSERT INTO `hov_admin_log` VALUES ('301', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552981226');
INSERT INTO `hov_admin_log` VALUES ('302', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552981241');
INSERT INTO `hov_admin_log` VALUES ('303', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552981252');
INSERT INTO `hov_admin_log` VALUES ('304', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552981647');
INSERT INTO `hov_admin_log` VALUES ('305', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552982018');
INSERT INTO `hov_admin_log` VALUES ('306', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552982025');
INSERT INTO `hov_admin_log` VALUES ('307', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552982069');
INSERT INTO `hov_admin_log` VALUES ('308', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552982075');
INSERT INTO `hov_admin_log` VALUES ('309', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552982110');
INSERT INTO `hov_admin_log` VALUES ('310', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552982145');
INSERT INTO `hov_admin_log` VALUES ('311', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552983024');
INSERT INTO `hov_admin_log` VALUES ('312', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552983030');
INSERT INTO `hov_admin_log` VALUES ('313', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552983039');
INSERT INTO `hov_admin_log` VALUES ('314', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552983294');
INSERT INTO `hov_admin_log` VALUES ('315', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552983300');
INSERT INTO `hov_admin_log` VALUES ('316', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552983306');
INSERT INTO `hov_admin_log` VALUES ('317', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552983313');
INSERT INTO `hov_admin_log` VALUES ('318', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552983474');
INSERT INTO `hov_admin_log` VALUES ('319', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552983490');
INSERT INTO `hov_admin_log` VALUES ('320', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552983520');
INSERT INTO `hov_admin_log` VALUES ('321', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552983652');
INSERT INTO `hov_admin_log` VALUES ('322', '94', '1', '192.168.1.107', '修改用户信息成功-2', '1552983662');
INSERT INTO `hov_admin_log` VALUES ('323', '50', '1', '192.168.1.102', '', '1552999110');
INSERT INTO `hov_admin_log` VALUES ('324', '75', '1', '192.168.1.102', '修改奖品评论成功-1', '1553000946');
INSERT INTO `hov_admin_log` VALUES ('325', '4', '1', '192.168.1.102', '89', '1553001206');
INSERT INTO `hov_admin_log` VALUES ('326', '92', '1', '192.168.1.102', '修改用户级别成功-2', '1553002578');
INSERT INTO `hov_admin_log` VALUES ('327', '4', '1', '192.168.1.102', '99', '1553004310');
INSERT INTO `hov_admin_log` VALUES ('328', '4', '1', '192.168.1.102', '100', '1553004335');
INSERT INTO `hov_admin_log` VALUES ('329', '99', '1', '192.168.1.102', '回复问题成功-1', '1553004349');
INSERT INTO `hov_admin_log` VALUES ('330', '99', '1', '192.168.1.102', '回复问题成功-1', '1553004368');
INSERT INTO `hov_admin_log` VALUES ('331', '50', '1', '192.168.1.107', '', '1553044696');
INSERT INTO `hov_admin_log` VALUES ('332', '99', '1', '192.168.1.107', '回复问题成功-1', '1553044800');
INSERT INTO `hov_admin_log` VALUES ('333', '99', '1', '192.168.1.107', '回复问题成功-1', '1553045047');
INSERT INTO `hov_admin_log` VALUES ('334', '99', '1', '192.168.1.107', '回复问题成功-1', '1553045165');
INSERT INTO `hov_admin_log` VALUES ('335', '99', '1', '192.168.1.107', '回复问题成功-1', '1553045274');
INSERT INTO `hov_admin_log` VALUES ('336', '99', '1', '192.168.1.107', '回复问题成功-1', '1553045282');
INSERT INTO `hov_admin_log` VALUES ('337', '99', '1', '192.168.1.107', '回复问题成功-1', '1553045288');
INSERT INTO `hov_admin_log` VALUES ('338', '99', '1', '192.168.1.107', '创建工单成功-2', '1553045303');
INSERT INTO `hov_admin_log` VALUES ('339', '100', '1', '192.168.1.107', '删除工单成功-1', '1553046034');
INSERT INTO `hov_admin_log` VALUES ('340', '99', '1', '192.168.1.107', '回复问题成功-2', '1553046304');
INSERT INTO `hov_admin_log` VALUES ('341', '99', '1', '192.168.1.107', '创建工单成功-3', '1553047231');
INSERT INTO `hov_admin_log` VALUES ('342', '50', '1', '192.168.1.107', '', '1553049608');
INSERT INTO `hov_admin_log` VALUES ('343', '4', '1', '192.168.1.107', '101', '1553051319');
INSERT INTO `hov_admin_log` VALUES ('344', '4', '1', '192.168.1.107', '101', '1553051356');
INSERT INTO `hov_admin_log` VALUES ('345', '4', '1', '192.168.1.107', '102', '1553051566');
INSERT INTO `hov_admin_log` VALUES ('346', '4', '1', '192.168.1.107', '103', '1553051827');
INSERT INTO `hov_admin_log` VALUES ('347', '4', '1', '192.168.1.107', '102', '1553053022');
INSERT INTO `hov_admin_log` VALUES ('348', '4', '1', '192.168.1.107', '103', '1553053034');
INSERT INTO `hov_admin_log` VALUES ('349', '4', '1', '192.168.1.107', '103', '1553053253');
INSERT INTO `hov_admin_log` VALUES ('350', '50', '1', '192.168.1.107', '', '1553053998');
INSERT INTO `hov_admin_log` VALUES ('351', '4', '1', '192.168.1.107', '104', '1553055683');
INSERT INTO `hov_admin_log` VALUES ('352', '28', '1', '192.168.1.107', '修改角色信息成功', '1553055765');
INSERT INTO `hov_admin_log` VALUES ('353', '4', '1', '192.168.1.107', '105', '1553057085');
INSERT INTO `hov_admin_log` VALUES ('354', '4', '1', '192.168.1.107', '106', '1553057155');
INSERT INTO `hov_admin_log` VALUES ('355', '102', '1', '192.168.1.107', '发送站内信成功-4', '1553065042');
INSERT INTO `hov_admin_log` VALUES ('356', '104', '1', '192.168.1.107', '删除站内信成功-4', '1553065099');
INSERT INTO `hov_admin_log` VALUES ('357', '102', '1', '192.168.1.107', '发送站内信成功-5', '1553065119');
INSERT INTO `hov_admin_log` VALUES ('358', '104', '1', '192.168.1.107', '删除站内信成功-2', '1553065134');
INSERT INTO `hov_admin_log` VALUES ('359', '50', '1', '192.168.1.102', '', '1553089578');
INSERT INTO `hov_admin_log` VALUES ('360', '4', '1', '192.168.1.102', '107', '1553089721');
INSERT INTO `hov_admin_log` VALUES ('361', '4', '1', '192.168.1.102', '107', '1553089758');
INSERT INTO `hov_admin_log` VALUES ('362', '102', '1', '192.168.1.102', '发送站内信成功-6', '1553090056');
INSERT INTO `hov_admin_log` VALUES ('363', '49', '1', '192.168.1.102', '17', '1553090249');
INSERT INTO `hov_admin_log` VALUES ('364', '94', '1', '192.168.1.102', '修改用户信息成功-1', '1553090275');
INSERT INTO `hov_admin_log` VALUES ('365', '50', '1', '192.168.1.107', '', '1553131111');
INSERT INTO `hov_admin_log` VALUES ('366', '49', '1', '192.168.1.107', '18', '1553135048');
INSERT INTO `hov_admin_log` VALUES ('367', '4', '1', '192.168.1.107', '108', '1553135156');
INSERT INTO `hov_admin_log` VALUES ('368', '4', '1', '192.168.1.107', '109', '1553135181');
INSERT INTO `hov_admin_log` VALUES ('369', '49', '1', '192.168.1.107', '19', '1553135444');
INSERT INTO `hov_admin_log` VALUES ('370', '108', '1', '192.168.1.107', '添加卡类成功-1', '1553135470');
INSERT INTO `hov_admin_log` VALUES ('371', '108', '1', '192.168.1.107', '修改卡类成功-1', '1553136671');
INSERT INTO `hov_admin_log` VALUES ('372', '108', '1', '192.168.1.107', '修改卡类成功-1', '1553136747');
INSERT INTO `hov_admin_log` VALUES ('373', '108', '1', '192.168.1.107', '修改卡类成功-1', '1553136755');
INSERT INTO `hov_admin_log` VALUES ('374', '108', '1', '192.168.1.107', '修改卡类成功-1', '1553136764');
INSERT INTO `hov_admin_log` VALUES ('375', '108', '1', '192.168.1.107', '修改卡类成功-1', '1553136773');
INSERT INTO `hov_admin_log` VALUES ('376', '108', '1', '192.168.1.107', '修改卡类成功-1', '1553137234');
INSERT INTO `hov_admin_log` VALUES ('377', '108', '1', '192.168.1.107', '修改卡类成功-1', '1553137329');
INSERT INTO `hov_admin_log` VALUES ('378', '109', '1', '192.168.1.107', '删除卡类成功-1', '1553137340');
INSERT INTO `hov_admin_log` VALUES ('379', '49', '1', '192.168.1.107', '20', '1553137645');
INSERT INTO `hov_admin_log` VALUES ('380', '108', '1', '192.168.1.107', '添加卡类成功-2', '1553137662');
INSERT INTO `hov_admin_log` VALUES ('381', '108', '1', '192.168.1.107', '添加卡类成功-3', '1553137724');
INSERT INTO `hov_admin_log` VALUES ('382', '108', '1', '192.168.1.107', '添加卡类成功-4', '1553137799');
INSERT INTO `hov_admin_log` VALUES ('383', '108', '1', '192.168.1.107', '添加卡类成功-5', '1553137961');
INSERT INTO `hov_admin_log` VALUES ('384', '108', '1', '192.168.1.107', '添加卡类成功-6', '1553138020');
INSERT INTO `hov_admin_log` VALUES ('385', '108', '1', '192.168.1.107', '添加卡类成功-7', '1553138095');
INSERT INTO `hov_admin_log` VALUES ('386', '108', '1', '192.168.1.107', '添加卡类成功-8', '1553138141');
INSERT INTO `hov_admin_log` VALUES ('387', '108', '1', '192.168.1.107', '添加卡类成功-9', '1553138205');
INSERT INTO `hov_admin_log` VALUES ('388', '4', '1', '192.168.1.107', '108', '1553138762');
INSERT INTO `hov_admin_log` VALUES ('389', '4', '1', '192.168.1.107', '109', '1553138788');
INSERT INTO `hov_admin_log` VALUES ('390', '108', '1', '192.168.1.107', '修改卡类成功-5', '1553138803');
INSERT INTO `hov_admin_log` VALUES ('391', '4', '1', '192.168.1.107', '110', '1553138971');
INSERT INTO `hov_admin_log` VALUES ('392', '4', '1', '192.168.1.107', '86', '1553139073');
INSERT INTO `hov_admin_log` VALUES ('393', '4', '1', '192.168.1.107', '88', '1553139100');
INSERT INTO `hov_admin_log` VALUES ('394', '4', '1', '192.168.1.107', '22', '1553139154');
INSERT INTO `hov_admin_log` VALUES ('395', '4', '1', '192.168.1.107', '111', '1553156754');
INSERT INTO `hov_admin_log` VALUES ('396', '4', '1', '192.168.1.107', '112', '1553156793');
INSERT INTO `hov_admin_log` VALUES ('397', '28', '1', '192.168.1.107', '修改角色信息成功', '1553156814');
INSERT INTO `hov_admin_log` VALUES ('398', '112', '1', '192.168.1.107', '删除代理分类成功-4', '1553157391');
INSERT INTO `hov_admin_log` VALUES ('399', '112', '1', '192.168.1.107', '删除代理分类成功-3', '1553157395');
INSERT INTO `hov_admin_log` VALUES ('400', '112', '1', '192.168.1.107', '删除代理分类成功-2', '1553157398');
INSERT INTO `hov_admin_log` VALUES ('401', '112', '1', '192.168.1.107', '删除代理分类成功-1', '1553157402');
INSERT INTO `hov_admin_log` VALUES ('402', '111', '1', '192.168.1.107', '添加代理分类成功-5', '1553157411');
INSERT INTO `hov_admin_log` VALUES ('403', '111', '1', '192.168.1.107', '添加代理分类成功-6', '1553157436');
INSERT INTO `hov_admin_log` VALUES ('404', '111', '1', '192.168.1.107', '添加代理分类成功-7', '1553157449');
INSERT INTO `hov_admin_log` VALUES ('405', '111', '1', '192.168.1.107', '添加代理分类成功-8', '1553157465');
INSERT INTO `hov_admin_log` VALUES ('406', '111', '1', '192.168.1.107', '修改代理分类成功-8', '1553157478');
INSERT INTO `hov_admin_log` VALUES ('407', '71', '1', '192.168.1.107', '添加奖品分类成功-5', '1553157533');
INSERT INTO `hov_admin_log` VALUES ('408', '71', '1', '192.168.1.107', '添加奖品分类成功-6', '1553157539');
INSERT INTO `hov_admin_log` VALUES ('409', '72', '1', '192.168.1.107', '删除奖品分类成功-6', '1553157543');
INSERT INTO `hov_admin_log` VALUES ('410', '112', '1', '192.168.1.107', '删除代理分类成功-8', '1553157663');
INSERT INTO `hov_admin_log` VALUES ('411', '111', '1', '192.168.1.107', '修改代理分类成功-5', '1553157673');
INSERT INTO `hov_admin_log` VALUES ('412', '111', '1', '192.168.1.107', '修改代理分类成功-6', '1553157679');
INSERT INTO `hov_admin_log` VALUES ('413', '111', '1', '192.168.1.107', '修改代理分类成功-7', '1553157690');
INSERT INTO `hov_admin_log` VALUES ('414', '50', '1', '192.168.1.102', '', '1553171534');
INSERT INTO `hov_admin_log` VALUES ('415', '4', '1', '192.168.1.102', '113', '1553174793');
INSERT INTO `hov_admin_log` VALUES ('416', '4', '1', '192.168.1.102', '114', '1553174885');
INSERT INTO `hov_admin_log` VALUES ('417', '4', '1', '192.168.1.102', '115', '1553174913');
INSERT INTO `hov_admin_log` VALUES ('418', '108', '1', '192.168.1.107', '修改卡类成功-3', '1553221145');
INSERT INTO `hov_admin_log` VALUES ('419', '108', '1', '192.168.1.107', '修改卡类成功-3', '1553221511');
INSERT INTO `hov_admin_log` VALUES ('420', '108', '1', '192.168.1.107', '修改卡类成功-3', '1553221784');
INSERT INTO `hov_admin_log` VALUES ('421', '108', '1', '192.168.1.107', '修改卡类成功-2', '1553221817');
INSERT INTO `hov_admin_log` VALUES ('422', '108', '1', '192.168.1.107', '修改卡类成功-4', '1553221844');
INSERT INTO `hov_admin_log` VALUES ('423', '108', '1', '192.168.1.107', '修改卡类成功-5', '1553221861');
INSERT INTO `hov_admin_log` VALUES ('424', '108', '1', '192.168.1.107', '修改卡类成功-6', '1553221881');
INSERT INTO `hov_admin_log` VALUES ('425', '108', '1', '192.168.1.107', '修改卡类成功-7', '1553221901');
INSERT INTO `hov_admin_log` VALUES ('426', '108', '1', '192.168.1.107', '修改卡类成功-8', '1553221928');
INSERT INTO `hov_admin_log` VALUES ('427', '108', '1', '192.168.1.107', '修改卡类成功-9', '1553221947');
INSERT INTO `hov_admin_log` VALUES ('428', '114', '1', '192.168.1.107', '成功生成卡密-1', '1553224047');
INSERT INTO `hov_admin_log` VALUES ('429', '114', '1', '192.168.1.107', '成功生成卡密', '1553225522');
INSERT INTO `hov_admin_log` VALUES ('430', '115', '1', '192.168.1.107', '4', '1553225596');
INSERT INTO `hov_admin_log` VALUES ('431', '115', '1', '192.168.1.107', '3', '1553225600');
INSERT INTO `hov_admin_log` VALUES ('432', '115', '1', '192.168.1.107', '2', '1553225604');
INSERT INTO `hov_admin_log` VALUES ('433', '115', '1', '192.168.1.107', '7', '1553225608');
INSERT INTO `hov_admin_log` VALUES ('434', '115', '1', '192.168.1.107', '6', '1553225612');
INSERT INTO `hov_admin_log` VALUES ('435', '115', '1', '192.168.1.107', '5', '1553225616');
INSERT INTO `hov_admin_log` VALUES ('436', '114', '1', '192.168.1.107', '成功生成卡密', '1553225623');
INSERT INTO `hov_admin_log` VALUES ('437', '4', '1', '192.168.1.107', '116', '1553231481');
INSERT INTO `hov_admin_log` VALUES ('438', '4', '1', '192.168.1.107', '117', '1553231607');
INSERT INTO `hov_admin_log` VALUES ('439', '4', '1', '192.168.1.107', '118', '1553231643');
INSERT INTO `hov_admin_log` VALUES ('440', '4', '1', '192.168.1.107', '119', '1553241725');
INSERT INTO `hov_admin_log` VALUES ('441', '4', '1', '192.168.1.107', '120', '1553241824');

-- ----------------------------
-- Table structure for `hov_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `hov_admin_menu`;
CREATE TABLE `hov_admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL COMMENT '模块',
  `controller` varchar(100) NOT NULL COMMENT '控制器',
  `function` varchar(100) NOT NULL COMMENT '方法',
  `parameter` varchar(50) DEFAULT NULL COMMENT '参数',
  `description` varchar(250) DEFAULT NULL COMMENT '描述',
  `is_display` int(1) NOT NULL DEFAULT '1' COMMENT '1显示在左侧菜单2只作为节点',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '1权限节点2普通节点',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级菜单0为顶级菜单',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_open` int(1) NOT NULL DEFAULT '0' COMMENT '0默认闭合1默认展开',
  `orders` int(11) NOT NULL DEFAULT '0' COMMENT '排序值，越小越靠前',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `module` (`module`) USING BTREE,
  KEY `controller` (`controller`) USING BTREE,
  KEY `function` (`function`) USING BTREE,
  KEY `is_display` (`is_display`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of hov_admin_menu
-- ----------------------------
INSERT INTO `hov_admin_menu` VALUES ('1', '系统', '', '', '', '', '系统设置。', '1', '2', '0', '0', '1517015748', 'fa-cog', '1', '0');
INSERT INTO `hov_admin_menu` VALUES ('2', '菜单', '', '', '', '', '菜单管理。', '1', '2', '1', '0', '1517015764', 'fa-paw', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('51', '系统菜单排序', 'admin', 'menu', 'orders', '', '系统菜单排序。', '2', '1', '3', '1517562047', '1517562047', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('3', '系统菜单', 'admin', 'menu', 'index', null, '系统菜单管理', '1', '2', '2', '0', '0', 'fa-share-alt', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('4', '新增/修改系统菜单', 'admin', 'menu', 'publish', '', '新增/修改系统菜单.', '2', '1', '3', '1516948769', '1516948769', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('5', '删除系统菜单', 'admin', 'menu', 'delete', '', '删除系统菜单。', '2', '1', '3', '1516948857', '1516948857', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('6', '个人', '', '', '', '', '个人信息管理。', '1', '1', '1', '1516949308', '1517021986', 'fa-user', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('7', '个人信息', 'admin', 'admin', 'personal', '', '个人信息修改。', '1', '1', '6', '1516949435', '1516949435', 'fa-user', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('8', '修改密码', 'admin', 'admin', 'editpassword', '', '管理员修改个人密码。', '1', '1', '6', '1516949702', '1517619887', 'fa-unlock-alt', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('9', '设置', '', '', '', '', '系统相关设置。', '1', '2', '1', '1516949853', '1517015878', 'fa-cog', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('10', '网站设置', 'admin', 'webconfig', 'index', '', '网站相关设置首页。', '1', '2', '9', '1516949994', '1516949994', 'fa-bullseye', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('11', '修改网站设置', 'admin', 'webconfig', 'publish', '', '修改网站设置。', '2', '1', '10', '1516950047', '1516950047', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('12', '邮件设置', 'admin', 'emailconfig', 'index', '', '邮件配置首页。', '1', '2', '9', '1516950129', '1516950129', 'fa-envelope', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('13', '修改邮件设置', 'admin', 'emailconfig', 'publish', '', '修改邮件设置。', '2', '1', '12', '1516950215', '1516950215', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('14', '发送测试邮件', 'admin', 'emailconfig', 'mailto', '', '发送测试邮件。', '2', '1', '12', '1516950295', '1516950295', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('15', '短信设置', 'admin', 'smsconfig', 'index', '', '短信设置首页。', '1', '2', '9', '1516950394', '1516950394', 'fa-comments', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('16', '修改短信设置', 'admin', 'smsconfig', 'publish', '', '修改短信设置。', '2', '1', '15', '1516950447', '1516950447', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('17', '发送测试短信', 'admin', 'smsconfig', 'smsto', '', '发送测试短信。', '2', '1', '15', '1516950483', '1516950483', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('18', 'URL 设置', 'admin', 'urlsconfig', 'index', '', 'url 设置。', '1', '2', '9', '1516950738', '1516950804', 'fa-code-fork', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('19', '新增/修改url设置', 'admin', 'urlsconfig', 'publish', '', '新增/修改url设置。', '2', '1', '18', '1516950850', '1516950850', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('20', '启用/禁用url美化', 'admin', 'urlsconfig', 'status', '', '启用/禁用url美化。', '2', '1', '18', '1516950909', '1516950909', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('21', ' 删除url美化规则', 'admin', 'urlsconfig', 'delete', '', ' 删除url美化规则。', '2', '1', '18', '1516950941', '1516950941', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('22', '后台', '', '', '', '', '', '1', '2', '0', '1516950991', '1553139154', 'fa-tv', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('23', '管理员', '', '', '', '', '系统管理员管理。', '1', '2', '22', '1516951071', '1517015819', 'fa-user', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('24', '管理员', 'admin', 'admin', 'index', '', '系统管理员列表。', '1', '2', '23', '1516951163', '1516951163', 'fa-user', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('25', '新增/修改管理员', 'admin', 'admin', 'publish', '', '新增/修改系统管理员。', '2', '1', '24', '1516951224', '1516951224', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('26', '删除管理员', 'admin', 'admin', 'delete', '', '删除管理员。', '2', '1', '24', '1516951253', '1516951253', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('27', '权限组', 'admin', 'admin', 'admincate', '', '权限分组。', '1', '2', '23', '1516951353', '1517018168', 'fa-dot-circle-o', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('28', '新增/修改权限组', 'admin', 'admin', 'admincatepublish', '', '新增/修改权限组。', '2', '1', '27', '1516951483', '1516951483', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('29', '删除权限组', 'admin', 'admin', 'admincatedelete', '', '删除权限组。', '2', '1', '27', '1516951515', '1516951515', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('30', '操作日志', 'admin', 'admin', 'log', '', '系统管理员操作日志。', '1', '2', '23', '1516951754', '1517018196', 'fa-pencil', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('31', '信息', '', '', '', '', '信息管管理或活动管理', '1', '2', '0', '1516952262', '1552530517', 'fa-th-large', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('32', '活动', '', '', '', '', '发布文章相关', '1', '2', '31', '1516952698', '1552534595', 'fa-bookmark', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('33', '分类', 'admin', 'articlecate', 'index', '', '文章分类管理。', '1', '2', '32', '1516952856', '1516952856', 'fa-tag', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('34', '新增/修改文章分类', 'admin', 'articlecate', 'publish', '', '新增/修改文章分类。', '2', '1', '33', '1516952896', '1516952896', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('35', '删除文章分类', 'admin', 'articlecate', 'delete', '', '删除文章分类。', '2', '1', '33', '1516952942', '1516952942', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('36', '内容', 'admin', 'article', 'index', '', '文章内容管理。', '1', '2', '32', '1516953011', '1552534734', 'fa-tasks', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('37', '新增/修改文章', 'admin', 'article', 'publish', '', '新增/修改文章。', '2', '1', '36', '1516953056', '1516953056', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('38', '审核/拒绝文章', 'admin', 'article', 'status', '', '审核/拒绝文章。', '2', '1', '36', '1516953113', '1516953113', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('39', '置顶/取消置顶文章', 'admin', 'article', 'is_top', '', '置顶/取消置顶文章。', '2', '1', '36', '1516953162', '1516953162', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('40', '删除文章', 'admin', 'article', 'delete', '', '删除文章。', '2', '1', '36', '1516953183', '1516953183', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('41', '附件', 'admin', 'attachment', 'index', '', '附件管理。', '1', '2', '1', '1516953306', '1552534874', 'fa-cube', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('42', '附件审核', 'admin', 'attachment', 'audit', '', '附件审核。', '2', '1', '41', '1516953359', '1516953440', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('43', '附件上传', 'admin', 'attachment', 'upload', '', '附件上传。', '2', '1', '41', '1516953392', '1516953392', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('44', '附件下载', 'admin', 'attachment', 'download', '', '附件下载。', '2', '1', '41', '1516953430', '1516953430', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('45', '附件删除', 'admin', 'attachment', 'delete', '', '附件删除。', '2', '1', '41', '1516953477', '1516953477', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('46', '留言', 'admin', 'tomessages', 'index', '', '留言管理。', '1', '2', '1', '1516953526', '1552534907', 'fa-comments', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('47', '留言处理', 'admin', 'tomessages', 'mark', '', '留言处理。', '2', '1', '46', '1516953605', '1516953605', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('48', '留言删除', 'admin', 'tomessages', 'delete', '', '留言删除。', '2', '1', '46', '1516953648', '1516953648', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('49', '图片上传', 'admin', 'common', 'upload', '', '图片上传。', '2', '2', '0', '1516954491', '1516954491', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('50', '管理员登录', 'admin', 'common', 'login', '', '管理员登录。', '2', '2', '0', '1516954517', '1516954517', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('52', '签到设置', 'admin', 'signinconfig', 'index', '', '签到设置', '1', '2', '9', '1552443044', '1552789871', 'fa-check', '1', '0');
INSERT INTO `hov_admin_menu` VALUES ('53', '新增/修改签到等级', 'admin', 'signinconfig', 'publish', '', '新增/修改签到设置', '2', '1', '52', '1552449405', '1552789887', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('54', '启用/禁用签到等级', 'admin', 'signinconfig', 'status', '', '启用/禁用签到等级', '2', '1', '52', '1552449499', '1552789900', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('55', '删除签到等级', 'admin', 'signinconfig', 'delete', '', '删除签到等级', '2', '1', '52', '1552449604', '1552789913', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('59', '公告', 'admin', 'board', 'index', '', '', '1', '2', '31', '1552534989', '1552534989', 'fa-sticky-note-o', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('60', '新增/修改公告', 'admin', 'board', 'publish', '', '新增/修改公告', '2', '1', '59', '1552554050', '1552554069', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('61', '审核/拒绝公告', 'admin', 'board', 'status', '', '审核/拒绝公告', '2', '1', '59', '1552554116', '1552554116', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('62', '置顶/取消置顶公告', 'admin', 'board', 'is_top', '', '置顶/取消置顶公告', '2', '1', '59', '1552554163', '1552554163', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('63', '删除公告', 'admin', 'board', 'delete', '', '删除公告', '2', '1', '59', '1552554205', '1552554205', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('64', '奖品', '', '', '', '', '', '1', '2', '0', '1552615251', '1552632831', 'fa-gift', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('65', '类别', 'admin', 'prizecate', 'index', '', '奖品类别', '1', '2', '64', '1552615700', '1552823767', 'fa-list-ol', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('66', '管理', 'admin', 'prize', 'index', '', '奖品管理', '1', '2', '64', '1552615922', '1552632878', 'fa-cutlery', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('67', '评论', 'admin', 'prize', 'remark', '', '奖品评论', '1', '2', '64', '1552616198', '1552616198', 'fa-comment', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('68', '兑奖审查', 'admin', 'prizeexchange', 'index', '', '兑奖审查', '1', '2', '64', '1552616333', '1552700024', 'fa-check-circle', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('69', '兑奖历史', 'admin', 'prizehistory', 'index', '', '兑奖历史', '1', '2', '64', '1552616387', '1552735018', 'fa-history', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('70', '手续费', 'admin', 'chargeconfig', 'index', '', '', '1', '2', '64', '1552616781', '1552790384', 'fa-minus-circle', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('71', '新增/修改类别', 'admin', 'prizecate', 'publish', '', '新增/修改类别', '2', '1', '65', '1552619261', '1552619261', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('72', '删除类别', 'admin', 'prizecate', 'delete', '', '删除类别', '2', '1', '65', '1552619308', '1552619308', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('73', '新增/修改奖品', 'admin', 'prize', 'publish', '', '', '2', '1', '66', '1552637353', '1552637353', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('74', '删除奖品', 'admin', 'prize', 'delete', '', '删除奖品', '2', '1', '66', '1552637391', '1552637391', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('75', '编辑评论', 'admin', 'prize', 'editremark', '', '编辑奖品评论', '2', '1', '67', '1552660116', '1552660116', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('76', '删除评论', 'admin', 'prize', 'deleteremark', '', '删除奖品评论', '2', '1', '67', '1552660152', '1552660152', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('77', '审核/拒绝', 'admin', 'prizeexchange', 'status', '', '审核/拒绝兑换奖品', '2', '1', '68', '1552702032', '1552702120', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('78', '批量审核', 'admin', 'prizeexchange', 'batchstatus', '', '批量审核通过奖品兑换', '2', '1', '68', '1552702102', '1552702102', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('79', '删除兑奖', 'admin', 'prizeexchange', 'delete', '', '删除用户兑换的奖品', '2', '1', '68', '1552702179', '1552702179', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('80', '新增/修改手续费规则', 'admin', 'chargeconfig', 'publish', '', '新增/修改手续费规则', '2', '1', '70', '1552790476', '1552790476', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('81', '删除规则', 'admin', 'chargeconfig', 'delete', '', '删除兑奖手续费规则', '2', '1', '70', '1552790520', '1552790520', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('82', '流水手续（投注）', 'admin', 'prizeflowcharge', 'index', '', '流水手续', '1', '2', '64', '1552823552', '1552826557', 'fa-list', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('83', '修改流水手续费（投注）', 'admin', 'prizeflowcharge', 'publish', '', '', '2', '1', '82', '1552875003', '1552875003', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('84', '新增特殊用户手续费规则', 'admin', 'prizeflowcharge', 'adduserrule', '', '', '2', '1', '82', '1552875093', '1552875093', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('85', '删除特殊用户手续费规则', 'admin', 'prizeflowcharge', 'deleteuserrule', '', '', '2', '1', '82', '1552875129', '1552876361', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('86', '用户', '', '', '', '', '网站注册会员（用户）', '1', '2', '0', '1552877606', '1553139073', 'fa-user', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('87', '级别', 'admin', 'usergrade', 'index', '', '', '1', '2', '86', '1552878214', '1552878566', 'fa-male', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('88', '用户', 'admin', 'user', 'index', '', '', '1', '2', '86', '1552878363', '1553139100', 'fa-user', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('89', '工单', 'admin', 'userquestion', 'index', '', '用户工单管理', '1', '2', '86', '1552878715', '1553001206', 'fa-tasks', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('90', '日志', 'admin', 'userlog', 'index', '', '用户日志管理', '1', '2', '86', '1552878842', '1552878842', 'fa-tags', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('91', '盈利', 'admin', 'userprofit', 'index', '', '用户盈利分析', '1', '2', '86', '1552879181', '1552879181', 'fa-area-chart', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('92', '新增/修改用户级别', 'admin', 'usergrade', 'publish', '', '', '2', '1', '87', '1552879872', '1552879872', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('93', '删除用户级别', 'admin', 'usergrade', 'delete', '', '', '2', '1', '87', '1552879903', '1552879903', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('94', '修改用户', 'admin', 'user', 'publish', '', '', '2', '1', '88', '1552893155', '1552915492', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('95', '删除用户', 'admin', 'user', 'delete', '', '删除网站注册用户', '2', '1', '88', '1552893191', '1552893191', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('96', '冻结用户', 'admin', 'user', 'freeze', '', '', '2', '1', '88', '1552893423', '1552893423', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('97', '批量删除用户', 'admin', 'user', 'batchdelete', '', '', '2', '1', '88', '1552893452', '1552893452', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('98', '批量冻结用户', 'admin', 'user', 'batchfreeze', '', '', '2', '1', '88', '1552893480', '1552893480', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('99', '新增/修改用户工单', 'admin', 'userquestion', 'publish', '', '新增/修改用户工单', '2', '1', '89', '1553004310', '1553004310', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('100', '删除用户工单', 'admin', 'userquestion', 'delete', '', '', '2', '1', '89', '1553004335', '1553004335', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('101', '站内信', '', '', '', '', '', '1', '2', '0', '1553051319', '1553051356', 'fa-sticky-note-o', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('102', '发站内信', 'admin', 'usernote', 'send', '', '', '1', '2', '101', '1553051566', '1553053022', 'fa-send-o', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('103', '发送历史', 'admin', 'usernote', 'index', '', '', '1', '2', '101', '1553051827', '1553053253', 'fa-paw', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('104', '删除站内信', 'admin', 'usernote', 'delete', '', '', '2', '1', '101', '1553055683', '1553055683', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('105', '商务管理', '', '', '', '', '', '1', '2', '0', '1553057085', '1553057085', 'fa-gg', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('106', '游戏管理', '', '', '', '', '', '1', '2', '0', '1553057155', '1553057155', 'fa-gamepad', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('107', '卡类管理', 'admin', 'cardcate', 'index', '', '', '1', '2', '105', '1553089721', '1553089758', 'fa-vcard-o', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('108', '新增/修改卡类', 'admin', 'cardcate', 'publish', '', '', '2', '1', '107', '1553135156', '1553138762', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('109', '删除卡类', 'admin', 'cardcate', 'delete', '', '', '2', '1', '107', '1553135181', '1553138788', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('110', '代理分类', 'admin', 'agentcate', 'index', '', '', '1', '2', '105', '1553138971', '1553138971', 'fa-asterisk', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('111', '新增/修改代理分类', 'admin', 'agentcate', 'publish', '', '', '2', '1', '110', '1553156754', '1553156754', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('112', '删除代理分类', 'admin', 'agentcate', 'delete', '', '', '2', '1', '110', '1553156793', '1553156793', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('113', '卡密管理', 'admin', 'cardpwd', 'index', '', '', '1', '2', '105', '1553174793', '1553174793', 'fa-id-card', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('114', '生成新卡密', 'admin', 'cardpwd', 'publish', '', '', '2', '1', '113', '1553174885', '1553174885', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('115', '删除卡密', 'admin', 'cardpwd', 'delete', '', '', '2', '1', '113', '1553174913', '1553174913', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('116', '代理管理', 'admin', 'agent', 'index', '', '', '1', '2', '105', '1553231481', '1553231481', 'fa-film', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('117', '代理提现', 'admin', 'agent', 'withdraw', '', '', '1', '2', '105', '1553231607', '1553231607', 'fa-upload', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('118', '代理充值', 'admin', 'agent', 'deposit', '', '', '1', '2', '105', '1553231643', '1553231643', 'fa-download', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('119', '新增/修改代理', 'admin', 'agent', 'publish', '', '', '2', '1', '116', '1553241725', '1553241725', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('120', '删除代理', 'admin', 'agent', 'delete', '', '', '2', '1', '116', '1553241824', '1553241824', '', '0', '0');

-- ----------------------------
-- Table structure for `hov_agent`
-- ----------------------------
DROP TABLE IF EXISTS `hov_agent`;
CREATE TABLE `hov_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_cate_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `balance` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `qq` char(13) DEFAULT NULL,
  `advance` decimal(10,2) DEFAULT NULL COMMENT '铺货量',
  `stock` decimal(10,2) DEFAULT NULL,
  `discount` decimal(3,2) DEFAULT NULL,
  `reclaim_reward` decimal(5,2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_show` tinyint(1) DEFAULT '0',
  `is_freeze` tinyint(1) DEFAULT NULL,
  `thumb` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_agent
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_agent_cate`
-- ----------------------------
DROP TABLE IF EXISTS `hov_agent_cate`;
CREATE TABLE `hov_agent_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tag` varchar(250) DEFAULT NULL COMMENT '关键词',
  `description` varchar(250) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_agent_cate
-- ----------------------------
INSERT INTO `hov_agent_cate` VALUES ('5', '安徽省', '', '', '1553157411', '1553157673', '0');
INSERT INTO `hov_agent_cate` VALUES ('6', '合肥市', '', '', '1553157436', '1553157679', '5');
INSERT INTO `hov_agent_cate` VALUES ('7', '包河区', '', '', '1553157449', '1553157690', '6');

-- ----------------------------
-- Table structure for `hov_article`
-- ----------------------------
DROP TABLE IF EXISTS `hov_article`;
CREATE TABLE `hov_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `article_cate_id` int(11) NOT NULL,
  `thumb` int(11) DEFAULT NULL,
  `content` text,
  `admin_id` int(11) NOT NULL,
  `begin_time` int(11) NOT NULL COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `edit_admin_id` int(11) NOT NULL COMMENT '最后修改人',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0待审核1已审核',
  `is_top` int(1) NOT NULL DEFAULT '0' COMMENT '1置顶0普通',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_top` (`is_top`) USING BTREE,
  KEY `article_cate_id` (`article_cate_id`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_article
-- ----------------------------
INSERT INTO `hov_article` VALUES ('1', '活动1', '', '', '1', '2', '<p>彩豆28也是推出了非常难得出充值返利活动，活动期间，玩家可以获得每天首次单笔充值金额的0.5000%返利。作为充值返利，不设上限，也不设下限，所以大户玩家，完全可以多充多得！次日领取返利！这是彩豆28极少举行的充值返利活动。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;比起活动，我们更加注重的应该是网站的信誉和稳定，彩豆28作为业内大站，网站的实力和信誉都是大家有目共睹的！所以这个站点到现在为止，单单靠网站的口碑，在玩家群体中，就有着非常多的忠实粉丝！</p><p><br/></p>', '1', '0', '0', '1552537824', '1552537824', '1', '0', '0');
INSERT INTO `hov_article` VALUES ('2', '活动2', '', '', '1', '3', '<p><strong style=\"margin: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; text-align: center; white-space: normal; background-color: rgb(243, 243, 243);\"><span style=\"color:#ff0000\"><p>站点必定会有更大的发展，喜欢返利活动的玩家可以多多关注一下彩豆28，这个站点大额游戏绝对没有任何问题，所以大家都是可以放心游戏的！彩豆28在2017中，相信会有更大的成长！</p><p>充值有礼送抽奖活动</p><p>【www.leodu288.com】</p></span></strong></p>', '1', '0', '0', '1552548392', '1552548392', '1', '0', '0');
INSERT INTO `hov_article` VALUES ('4', 'sdf', 'sdfasf', 'sdfasdf', '1', '5', '<p>sdf</p>', '1', '1552572226', '1553720708', '1552570770', '1552572278', '1', '0', '0');

-- ----------------------------
-- Table structure for `hov_article_cate`
-- ----------------------------
DROP TABLE IF EXISTS `hov_article_cate`;
CREATE TABLE `hov_article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tag` varchar(250) DEFAULT NULL COMMENT '关键词',
  `description` varchar(250) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_article_cate
-- ----------------------------
INSERT INTO `hov_article_cate` VALUES ('1', '分类1', '', '', '1552537765', '1552537765', '0');
INSERT INTO `hov_article_cate` VALUES ('2', '分类2', '', '', '1552619459', '1552619459', '0');
INSERT INTO `hov_article_cate` VALUES ('3', '分类21', '', '', '1552619470', '1552619470', '2');
INSERT INTO `hov_article_cate` VALUES ('4', '分类211', '', '', '1552619482', '1552619482', '3');
INSERT INTO `hov_article_cate` VALUES ('5', '分类3', '', '', '1552619502', '1552619502', '0');

-- ----------------------------
-- Table structure for `hov_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `hov_attachment`;
CREATE TABLE `hov_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL DEFAULT '' COMMENT '所属模块',
  `filename` char(50) NOT NULL DEFAULT '' COMMENT '文件名',
  `filepath` char(200) NOT NULL DEFAULT '' COMMENT '文件路径+文件名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `fileext` char(10) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `uploadip` char(15) NOT NULL DEFAULT '' COMMENT '上传IP',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未审核1已审核-1不通过',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_id` int(11) NOT NULL COMMENT '审核者id',
  `audit_time` int(11) NOT NULL COMMENT '审核时间',
  `use` varchar(200) DEFAULT NULL COMMENT '用处',
  `download` int(11) NOT NULL DEFAULT '0' COMMENT '下载量',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `filename` (`filename`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';

-- ----------------------------
-- Records of hov_attachment
-- ----------------------------
INSERT INTO `hov_attachment` VALUES ('1', 'admin', '79811855a6c06de53047471c4ff82a36.jpg', '\\uploads\\admin\\admin_thumb\\20180104\\79811855a6c06de53047471c4ff82a36.jpg', '13781', 'jpg', '1', '127.0.0.1', '1', '1515046060', '1', '1515046060', 'admin_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('2', 'admin', '880549630e0754f903ef7af923a2a9f5.jpg', '\\uploads\\admin\\article_thumb\\20190314\\880549630e0754f903ef7af923a2a9f5.jpg', '134483', 'jpg', '1', '192.168.1.107', '1', '1552537822', '1', '1552537822', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('3', 'admin', '8c1e970d0bb3a55fe8dcb03fca0f46ce.jpg', '\\uploads\\admin\\article_thumb\\20190314\\8c1e970d0bb3a55fe8dcb03fca0f46ce.jpg', '15902', 'jpg', '1', '192.168.1.107', '1', '1552548374', '1', '1552548374', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('4', 'admin', '3e6c9e0820be139fcb05baacdcd2a795.jpg', '\\uploads\\admin\\article_thumb\\20190314\\3e6c9e0820be139fcb05baacdcd2a795.jpg', '6071', 'jpg', '1', '192.168.1.107', '1', '1552550879', '1', '1552550879', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('5', 'admin', '1c464dc8db62c0578fe267cbda63d0fb.jpg', '\\uploads\\admin\\article_thumb\\20190314\\1c464dc8db62c0578fe267cbda63d0fb.jpg', '51653', 'jpg', '1', '192.168.1.102', '1', '1552570746', '1', '1552570746', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('6', 'admin', '75a8a893f61211f535a65532838ce82f.jpg', '\\uploads\\admin\\article_thumb\\20190314\\75a8a893f61211f535a65532838ce82f.jpg', '51653', 'jpg', '1', '192.168.1.102', '1', '1552571665', '1', '1552571665', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('7', 'admin', 'c50ec813521d1e620888646ab3ad2997.jpg', '\\uploads\\admin\\article_thumb\\20190314\\c50ec813521d1e620888646ab3ad2997.jpg', '51653', 'jpg', '1', '192.168.1.102', '1', '1552571816', '1', '1552571816', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('8', 'admin', '4f2e47b25da92d48df1504a9e5c15e1c.jpg', '\\uploads\\admin\\prize_thumb\\20190315\\4f2e47b25da92d48df1504a9e5c15e1c.jpg', '134483', 'jpg', '1', '192.168.1.107', '1', '1552634229', '1', '1552634229', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('9', 'admin', 'eb41f8b1762c90d995c485b6cc4e2dca.jpg', '\\uploads\\admin\\prize_thumb\\20190315\\eb41f8b1762c90d995c485b6cc4e2dca.jpg', '134483', 'jpg', '1', '192.168.1.107', '1', '1552634372', '1', '1552634372', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('10', 'admin', 'e72b53e9e93f8c0d118c38049e5bb267.jpg', '\\uploads\\admin\\prize_thumb\\20190315\\e72b53e9e93f8c0d118c38049e5bb267.jpg', '77024', 'jpg', '1', '192.168.1.107', '1', '1552635657', '1', '1552635657', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('11', 'admin', '000e75bd5dac1eb7b44aebc6ef1aeb26.jpg', '\\uploads\\admin\\prize_thumb\\20190315\\000e75bd5dac1eb7b44aebc6ef1aeb26.jpg', '77024', 'jpg', '1', '192.168.1.107', '1', '1552635796', '1', '1552635796', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('12', 'admin', '976c253cdad57f3173994703a918ea0b.jpg', '\\uploads\\admin\\prize_thumb\\20190315\\976c253cdad57f3173994703a918ea0b.jpg', '78825', 'jpg', '1', '192.168.1.107', '1', '1552637469', '1', '1552637469', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('13', 'admin', '3861ff1399afa9fc613e641aaae51a5f.jpg', '\\uploads\\admin\\article_thumb\\20190318\\3861ff1399afa9fc613e641aaae51a5f.jpg', '51653', 'jpg', '1', '192.168.1.102', '1', '1552920567', '1', '1552920567', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('14', 'admin', '7e1fe4feb5b036236942cd219d4d7841.jpg', '\\uploads\\admin\\user_thumb\\20190318\\7e1fe4feb5b036236942cd219d4d7841.jpg', '51653', 'jpg', '1', '192.168.1.102', '1', '1552920912', '1', '1552920912', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('15', 'admin', '9c85a10e4e82ee973d29c3076ede592d.jpg', '\\uploads\\admin\\user_thumb\\20190318\\9c85a10e4e82ee973d29c3076ede592d.jpg', '51653', 'jpg', '1', '192.168.1.102', '1', '1552921021', '1', '1552921021', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('16', 'admin', 'a59713d0c41d6b9ada888bdde091280b.jpg', '\\uploads\\admin\\user_thumb\\20190318\\a59713d0c41d6b9ada888bdde091280b.jpg', '51653', 'jpg', '1', '192.168.1.102', '1', '1552921093', '1', '1552921093', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('17', 'admin', '67f14a50fd1c11cbb25c60702bae9d42.jpg', '\\uploads\\admin\\user_thumb\\20190320\\67f14a50fd1c11cbb25c60702bae9d42.jpg', '51653', 'jpg', '1', '192.168.1.102', '1', '1553090248', '1', '1553090248', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('18', 'admin', '242f411b90f2f6b519bbf4312ecd8ca1.png', '\\uploads\\admin\\prize_thumb\\20190321\\242f411b90f2f6b519bbf4312ecd8ca1.png', '999', 'png', '1', '192.168.1.107', '1', '1553135048', '1', '1553135048', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('19', 'admin', '40ec749605502eecf6f3ab5bf229eb26.png', '\\uploads\\admin\\prize_thumb\\20190321\\40ec749605502eecf6f3ab5bf229eb26.png', '999', 'png', '1', '192.168.1.107', '1', '1553135444', '1', '1553135444', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('20', 'admin', '9a7f644d4aff6fe9a9a793b98f8bdf0f.png', '\\uploads\\admin\\prize_thumb\\20190321\\9a7f644d4aff6fe9a9a793b98f8bdf0f.png', '999', 'png', '1', '192.168.1.107', '1', '1553137645', '1', '1553137645', 'prize_thumb', '0');

-- ----------------------------
-- Table structure for `hov_board`
-- ----------------------------
DROP TABLE IF EXISTS `hov_board`;
CREATE TABLE `hov_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `is_top` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_board
-- ----------------------------
INSERT INTO `hov_board` VALUES ('1', '1', '公告1', '<p>士大夫撒地方撒旦</p>', '1552549710', '1552549710', '1', '1');
INSERT INTO `hov_board` VALUES ('2', '1', '公告1', '<p>士大夫撒地方撒旦</p>', '1552549721', '1552549721', '1', '1');
INSERT INTO `hov_board` VALUES ('3', '1', '公告1', '<p>士大夫撒地方撒旦</p>', '1552549955', '1552549955', '1', '1');
INSERT INTO `hov_board` VALUES ('4', '1', '啊', '<p>发生的发生<br/></p>', '1552550155', '1552550155', '1', '1');
INSERT INTO `hov_board` VALUES ('5', '1', '啊', '<p>发生的发生<br/></p>', '1552550266', '1552550266', '1', '1');
INSERT INTO `hov_board` VALUES ('6', '1', '啊', '<p>发生的发生<br/></p>', '1552550350', '1552550350', '1', '1');
INSERT INTO `hov_board` VALUES ('7', '1', '啊', '<p>发生的发生<br/></p>', '1552550351', '1552550351', '1', '1');
INSERT INTO `hov_board` VALUES ('8', '1', 'sdf', '<p>sdfasdfasfd</p>', '1552550359', '1552550359', '1', '1');
INSERT INTO `hov_board` VALUES ('9', '1', 'sdf', '<p>sdfsdf</p>', '1552551016', '1552551016', '1', '1');
INSERT INTO `hov_board` VALUES ('10', '1', 'sdf', '<p>sdfsdf</p>', '1552551033', '1552551033', '1', '1');
INSERT INTO `hov_board` VALUES ('11', '1', 'sdf', '<p>sdfsdf</p>', '1552551169', '1552551169', '1', '1');
INSERT INTO `hov_board` VALUES ('12', '1', 'sdf', '<p>sdfsdf</p>', '1552551174', '1552551174', '1', '1');
INSERT INTO `hov_board` VALUES ('13', '1', 'sdf', '<p>sdfsdf</p>', '1552551544', '1552551544', '1', '1');
INSERT INTO `hov_board` VALUES ('14', '1', 'sdf', '<p>sdfsdf</p>', '1552551552', '1552551552', '1', '1');
INSERT INTO `hov_board` VALUES ('15', '1', 'sdf', '<p>sdfsdf</p>', '1552551554', '1552551554', '1', '1');
INSERT INTO `hov_board` VALUES ('16', '1', 'sdf', '<p>sdfsdf</p>', '1552551927', '1552551927', '1', '1');
INSERT INTO `hov_board` VALUES ('19', '1', 'sdf', '<p>sdfsafsafd</p>', null, null, '1', '1');
INSERT INTO `hov_board` VALUES ('20', '1', 'sdf', '<p>sdfsafsafd</p>', null, null, '1', '1');
INSERT INTO `hov_board` VALUES ('21', '1', 'sdfsadf', '<p>sdfasdfasfasfd</p>', '1552552293', '1552552293', '1', '1');
INSERT INTO `hov_board` VALUES ('22', '1', 'asdf', '<p>sadfsadf</p>', '1552552622', '1552552622', '1', '0');
INSERT INTO `hov_board` VALUES ('24', '1', 'rtre', '<p>ertertert</p>', '1552553036', '1552553036', '1', '0');
INSERT INTO `hov_board` VALUES ('25', '1', 'rtre', '<p>ertertert</p>', '1552553099', '1552553099', '1', '0');
INSERT INTO `hov_board` VALUES ('26', '1', 'rtre', '<p>ertertert</p>', '1552553216', '1552553216', '1', '0');
INSERT INTO `hov_board` VALUES ('27', '1', 'rtre', '<p>ertertert</p>', '1552553236', '1552553236', '1', '0');
INSERT INTO `hov_board` VALUES ('28', '1', 'rtre', '<p>ertertert</p>', '1552553250', '1552553250', '1', '0');
INSERT INTO `hov_board` VALUES ('29', '1', 'rtre', '<p>ertertert</p>', '1552553382', '1552553382', '1', '0');
INSERT INTO `hov_board` VALUES ('30', '1', 'rtre', '<p>ertertert</p>', '1552553391', '1552553391', '1', '0');
INSERT INTO `hov_board` VALUES ('31', '1', 'rtre', '<p>ertertert</p>', '1552553493', '1552553493', '1', '0');
INSERT INTO `hov_board` VALUES ('32', '1', 'wer', '<p>werwer</p>', '1552554216', '1552554216', '1', '0');
INSERT INTO `hov_board` VALUES ('33', '1', 'wer', '<p>werwer</p>', '1552554223', '1552554223', '1', '0');
INSERT INTO `hov_board` VALUES ('34', '1', 'wer', '<p>werwer</p>', '1552554283', '1552554283', '1', '0');
INSERT INTO `hov_board` VALUES ('35', '1', 'wer', '<p>werwer</p>', '1552554286', '1552554286', '1', '0');
INSERT INTO `hov_board` VALUES ('36', '1', 'wer', '<p>werwer</p>', '1552554325', '1552554325', '1', '0');
INSERT INTO `hov_board` VALUES ('37', '1', 'dsf', '<p>sdfsf<br/></p>', '1552567766', '1552567766', '1', '0');
INSERT INTO `hov_board` VALUES ('38', '1', 'dsf', '<p>sdfsf<br/></p>', '1552567916', '1552567916', '1', '0');
INSERT INTO `hov_board` VALUES ('39', '1', 'asd', '<p>sdfasf</p>', '1552567990', '1552567990', '1', '0');
INSERT INTO `hov_board` VALUES ('40', '1', 'sdfsdf', '<p>sdfasdf</p>', '1552568040', '1552568040', '1', '0');
INSERT INTO `hov_board` VALUES ('41', '1', 'sdf', '<p>sdfsdf</p>', '1552568522', '1552568522', '1', '0');
INSERT INTO `hov_board` VALUES ('42', '1', 'sdf', '<p>sdfsdf</p>', '1552568567', '1552568567', '1', '0');
INSERT INTO `hov_board` VALUES ('43', '1', 'sdf', '<p>sdfsdf</p>', '1552568666', '1552568666', '1', '0');
INSERT INTO `hov_board` VALUES ('44', '1', 'sdf', '<p>sdfsdf</p>', '1552569432', '1552569432', '1', '0');
INSERT INTO `hov_board` VALUES ('45', '1', 'sdf', '<p>sdfsdf</p>', '1552569462', '1552569462', '1', '0');
INSERT INTO `hov_board` VALUES ('46', '1', 'sdf', '<p>sdfsdf</p>', '1552569513', '1552569513', '1', '0');
INSERT INTO `hov_board` VALUES ('47', '1', 'sdf', '<p>sdfsdf</p>', '1552569542', '1552569542', '1', '0');
INSERT INTO `hov_board` VALUES ('48', '1', 'sdf', '<p>sdfsdf</p>', '1552569555', '1552569555', '1', '0');
INSERT INTO `hov_board` VALUES ('49', '1', 'sdf', '<p>sdfsdf</p>', '1552569566', '1552569566', '0', '0');
INSERT INTO `hov_board` VALUES ('50', '1', 'sdf', '<p>sdfsdfasf</p>', '1552569834', '1552569834', '1', '1');

-- ----------------------------
-- Table structure for `hov_card_cate`
-- ----------------------------
DROP TABLE IF EXISTS `hov_card_cate`;
CREATE TABLE `hov_card_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '卡名称',
  `header` char(10) DEFAULT NULL COMMENT '卡头',
  `random_bits` tinyint(2) DEFAULT NULL COMMENT '随机位数',
  `random_type` tinyint(1) DEFAULT '3' COMMENT '1：数字，2：数字+大写字母，3：数字+大写字母+小写字母',
  `thumb` int(11) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL COMMENT '价格',
  `is_vip` tinyint(1) DEFAULT '0' COMMENT '是否需要开通VIP才有效1：是，0：不是',
  `coin` int(11) DEFAULT NULL COMMENT '金币面值',
  `experiment` int(11) DEFAULT '0',
  `day_coin` int(11) DEFAULT '0',
  `day_experiment` int(11) DEFAULT '0',
  `valid_time` int(11) DEFAULT NULL COMMENT '（有效）领取天数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `is_agent` tinyint(1) DEFAULT '0' COMMENT '1：代理能生成，0：不能',
  `desc` varchar(300) DEFAULT NULL COMMENT '卡类介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_card_cate
-- ----------------------------
INSERT INTO `hov_card_cate` VALUES ('2', '红钻卡(每天领1W2)', 'gz1', '8', '3', '20', '300.00', '0', '0', '0', '12000', '0', '30', '1553137662', '1553221816', '0', '');
INSERT INTO `hov_card_cate` VALUES ('3', '金龙卡', '15', '8', '3', null, '1500.00', '0', '1500000', '0', '50000', '0', '30', '1553137724', '1553221784', '0', '');
INSERT INTO `hov_card_cate` VALUES ('4', '1000元中国移动手机充值卡', 'd1', '8', '3', null, '1000.00', '0', '1000000', '0', '0', '0', '0', '1553137799', '1553221844', '1', '');
INSERT INTO `hov_card_cate` VALUES ('5', 'VIP贵宾卡', 'vi', '8', '3', null, '0.00', '1', '0', '0', '0', '0', '0', '1553137961', '1553221861', '0', '');
INSERT INTO `hov_card_cate` VALUES ('6', '20元广告体验卡', '20', '15', '3', null, '20.00', '0', '20000', '10', '0', '0', '0', '1553138020', '1553221881', '1', '');
INSERT INTO `hov_card_cate` VALUES ('7', '1元红包卡', 'HB', '8', '2', null, '1.00', '0', '0', '0', '0', '0', '0', '1553138095', '1553221901', '1', '');
INSERT INTO `hov_card_cate` VALUES ('8', '兑奖200元专用卡', 'd200', '15', '3', null, '200.00', '0', '200000', '0', '0', '0', '0', '1553138141', '1553221928', '0', '');
INSERT INTO `hov_card_cate` VALUES ('9', '兑奖50元专用卡', 'd50', '15', '2', null, '50.00', '0', '50000', '0', '0', '0', '0', '1553138205', '1553221947', '0', '');

-- ----------------------------
-- Table structure for `hov_card_pwd`
-- ----------------------------
DROP TABLE IF EXISTS `hov_card_pwd`;
CREATE TABLE `hov_card_pwd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(30) DEFAULT NULL,
  `card_pwd` varchar(30) DEFAULT NULL,
  `card_cate_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '2已回收 | 3已充值 | 1未充值 | 4已兑出(未回收)',
  `create_time` int(11) DEFAULT NULL,
  `use_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_card_pwd
-- ----------------------------
INSERT INTO `hov_card_pwd` VALUES ('1', 'gz1WbTX6VsD', '5l5a0sCk', '2', null, null, '1', '1553224047', null);
INSERT INTO `hov_card_pwd` VALUES ('8', 'd200HjtCpKzvmYQY7Tc', 'CVbfn8uJpLcu2yp', '8', null, null, '1', '1553225623', null);
INSERT INTO `hov_card_pwd` VALUES ('9', 'd200nr2TAaRVr7ajWCW', 'jw1iQlimi0D3Chn', '8', null, null, '1', '1553225623', null);
INSERT INTO `hov_card_pwd` VALUES ('10', 'd200yDAg1K0T3kcqX34', 'fipzwIIG45Gk9ar', '8', null, null, '1', '1553225623', null);

-- ----------------------------
-- Table structure for `hov_chargeconfig`
-- ----------------------------
DROP TABLE IF EXISTS `hov_chargeconfig`;
CREATE TABLE `hov_chargeconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:兑奖次数，2：兑奖件数',
  `lower` int(11) DEFAULT NULL,
  `upper` int(11) DEFAULT NULL,
  `by` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：按照固定数额，2：按照百分比',
  `charge` decimal(8,2) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1:启用0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_chargeconfig
-- ----------------------------
INSERT INTO `hov_chargeconfig` VALUES ('1', '1', '1000', '1000000', '1', '12.00', null, '1552812910', '1');
INSERT INTO `hov_chargeconfig` VALUES ('2', '2', '500', '50000', '1', '3.00', '1552813146', '1552822418', '1');
INSERT INTO `hov_chargeconfig` VALUES ('4', '1', '44', '4433', '2', '5.00', '1552813511', '1552822409', '0');

-- ----------------------------
-- Table structure for `hov_emailconfig`
-- ----------------------------
DROP TABLE IF EXISTS `hov_emailconfig`;
CREATE TABLE `hov_emailconfig` (
  `email` varchar(5) NOT NULL COMMENT '邮箱配置标识',
  `from_email` varchar(50) NOT NULL COMMENT '邮件来源也就是邮件地址',
  `from_name` varchar(50) NOT NULL,
  `smtp` varchar(50) NOT NULL COMMENT '邮箱smtp服务器',
  `username` varchar(100) NOT NULL COMMENT '邮箱账号',
  `password` varchar(100) NOT NULL COMMENT '邮箱密码',
  `title` varchar(200) NOT NULL COMMENT '邮件标题',
  `content` text NOT NULL COMMENT '邮件模板',
  KEY `email` (`email`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_emailconfig
-- ----------------------------
INSERT INTO `hov_emailconfig` VALUES ('email', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `hov_messages`
-- ----------------------------
DROP TABLE IF EXISTS `hov_messages`;
CREATE TABLE `hov_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `is_look` int(1) NOT NULL DEFAULT '0' COMMENT '0未读1已读',
  `message` text NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `is_look` (`is_look`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_messages
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_prize`
-- ----------------------------
DROP TABLE IF EXISTS `hov_prize`;
CREATE TABLE `hov_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(120) NOT NULL,
  `thumb` varchar(120) NOT NULL,
  `prize_cate_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `units` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `desc` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_prize
-- ----------------------------
INSERT INTO `hov_prize` VALUES ('1', null, '移动充值卡100元', '10', '1', '100.00', '100000', '0', '0', '<p>移动充值卡100元</p>', '1552635673', '1552635673', '0');
INSERT INTO `hov_prize` VALUES ('2', null, '移动充值卡100元', '10', '1', '100.00', '100000', '0', '0', '<p>移动充值卡100元</p>', '1552635681', '1552635681', '0');
INSERT INTO `hov_prize` VALUES ('3', null, '移动充值卡100元', '11', '1', '100.00', '100000', '0', '0', '<p>移动充值卡100元</p>', '1552636795', '1552636795', '0');
INSERT INTO `hov_prize` VALUES ('4', null, '移动充值卡100元', '11', '1', '100.00', '100000', '0', '0', '<p>移动充值卡100元</p>', '1552636993', '1552636993', '0');
INSERT INTO `hov_prize` VALUES ('5', null, '移动充值卡5000元', '12', '1', '5000.00', '5000000', '0', '0', '<p>移动充值卡5000元问问</p>', '1552637483', '1552637774', '0');

-- ----------------------------
-- Table structure for `hov_prize_cate`
-- ----------------------------
DROP TABLE IF EXISTS `hov_prize_cate`;
CREATE TABLE `hov_prize_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tag` varchar(250) DEFAULT NULL COMMENT '关键词',
  `description` varchar(250) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_prize_cate
-- ----------------------------
INSERT INTO `hov_prize_cate` VALUES ('1', '分类1', '', '', '1552537765', '1552537765', '0');
INSERT INTO `hov_prize_cate` VALUES ('2', '类别2', '', '', '1552619867', '1552619867', '0');
INSERT INTO `hov_prize_cate` VALUES ('3', '类别21', '', '', '1552619876', '1552619876', '2');
INSERT INTO `hov_prize_cate` VALUES ('5', '211', '', '', '1553157533', '1553157533', '3');

-- ----------------------------
-- Table structure for `hov_signinconfig`
-- ----------------------------
DROP TABLE IF EXISTS `hov_signinconfig`;
CREATE TABLE `hov_signinconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` char(10) NOT NULL COMMENT '等级',
  `increment_num` tinyint(4) NOT NULL COMMENT '增数',
  `max_successive_day` tinyint(4) DEFAULT NULL COMMENT '最大连续天数',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否有效',
  `menu` varchar(50) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_signinconfig
-- ----------------------------
INSERT INTO `hov_signinconfig` VALUES ('1', 'V0', '1', '7', '1', 'V0等级', '1552526726', '1552526904');
INSERT INTO `hov_signinconfig` VALUES ('2', 'V1', '1', '7', '1', '', '1552526923', '1552526923');
INSERT INTO `hov_signinconfig` VALUES ('3', 'V2', '1', '7', '1', '', '1552526942', '1552526942');
INSERT INTO `hov_signinconfig` VALUES ('4', 'V3', '1', '7', '1', '', '1552526955', '1552526955');
INSERT INTO `hov_signinconfig` VALUES ('5', 'V4', '1', '7', '1', '', '1552526964', '1552526964');
INSERT INTO `hov_signinconfig` VALUES ('6', 'V5', '1', '7', '1', '', '1552527148', '1552790060');
INSERT INTO `hov_signinconfig` VALUES ('7', 'V6', '1', '7', '1', '', '1552527894', '1552873408');

-- ----------------------------
-- Table structure for `hov_smsconfig`
-- ----------------------------
DROP TABLE IF EXISTS `hov_smsconfig`;
CREATE TABLE `hov_smsconfig` (
  `sms` varchar(10) NOT NULL DEFAULT 'sms' COMMENT '标识',
  `appkey` varchar(200) NOT NULL,
  `secretkey` varchar(200) NOT NULL,
  `type` varchar(100) DEFAULT 'normal' COMMENT '短信类型',
  `name` varchar(100) NOT NULL COMMENT '短信签名',
  `code` varchar(100) NOT NULL COMMENT '短信模板ID',
  `content` text NOT NULL COMMENT '短信默认模板',
  KEY `sms` (`sms`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_smsconfig
-- ----------------------------
INSERT INTO `hov_smsconfig` VALUES ('sms', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `hov_urlconfig`
-- ----------------------------
DROP TABLE IF EXISTS `hov_urlconfig`;
CREATE TABLE `hov_urlconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aliases` varchar(200) NOT NULL COMMENT '想要设置的别名',
  `url` varchar(200) NOT NULL COMMENT '原url结构',
  `desc` text COMMENT '备注',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '0禁用1使用',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_urlconfig
-- ----------------------------
INSERT INTO `hov_urlconfig` VALUES ('1', 'admin_login', 'admin/common/login', '后台登录地址。', '0', '1517621629', '1517621629');

-- ----------------------------
-- Table structure for `hov_user`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user`;
CREATE TABLE `hov_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL COMMENT '1:male,2:female',
  `avatar` int(11) DEFAULT NULL COMMENT '用户头像',
  `user_type` tinyint(1) DEFAULT '1' COMMENT '用户类型1:普通，2：vip类型',
  `email` varchar(100) NOT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `coin` int(11) DEFAULT NULL COMMENT '金币数',
  `bank` int(11) DEFAULT NULL COMMENT '银行金币数',
  `exchange_num` int(11) DEFAULT NULL COMMENT '兑奖数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `user_grade_id` tinyint(2) DEFAULT NULL COMMENT '用户等级',
  `login_ip` char(30) DEFAULT NULL COMMENT '登录IP',
  `is_vip` tinyint(1) DEFAULT '0' COMMENT '1：是，0：否',
  `vip_expire` int(11) DEFAULT NULL COMMENT 'vip到期时间',
  `points` int(11) DEFAULT NULL COMMENT '积分',
  `emoney` int(11) DEFAULT NULL COMMENT '虚拟币',
  `experiments` int(11) DEFAULT NULL,
  `is_email` tinyint(1) DEFAULT NULL COMMENT '1:email verified,0:email unverified',
  `is_mobile` tinyint(1) DEFAULT NULL COMMENT '1:mobile verified,0:mobile unverified',
  `safe_q` tinyint(1) DEFAULT NULL COMMENT 'question safety',
  `safe_a` varchar(100) DEFAULT NULL COMMENT 'answer safety',
  `qq` char(12) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `is_freeze` tinyint(1) DEFAULT '1' COMMENT '1:normal,2:frozen',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user
-- ----------------------------
INSERT INTO `hov_user` VALUES ('1', 'ikscher', '2323223', '2', '17', null, 'ikscher@163.com', '13856900659', '12', '23', null, null, '1553090275', null, '114.102.155.30', null, '0', '23', null, null, '1', '0', null, null, '2323423', '1970-01-01', null, '1');
INSERT INTO `hov_user` VALUES ('2', 'wenthuang', '222222', '2', '16', null, 'wenthuang@sina.com', '13856900456', '23', '2', null, '0', '1552983662', null, '116.27.147.29', null, '1553616000', '23', null, null, '0', '1', null, null, '435345345', '2018-06-02', null, '1');

-- ----------------------------
-- Table structure for `hov_user_charge`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_charge`;
CREATE TABLE `hov_user_charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `flow_times` decimal(6,2) DEFAULT NULL COMMENT '流水倍数要求',
  `charge_ratio` decimal(8,4) DEFAULT NULL COMMENT '手续费比例',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_charge
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_user_exchange`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_exchange`;
CREATE TABLE `hov_user_exchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `prize_id` int(11) NOT NULL,
  `ex_price` decimal(10,2) DEFAULT NULL COMMENT '兑换价格',
  `create_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '奖品是否通过审核1：通过，2：不通过，0：默认未审核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_exchange
-- ----------------------------
INSERT INTO `hov_user_exchange` VALUES ('1', '1', '2', '100.00', '1552636993', '1');
INSERT INTO `hov_user_exchange` VALUES ('2', '1', '3', '366.00', '1552096993', '1');
INSERT INTO `hov_user_exchange` VALUES ('3', '1', '4', '50.00', '1552296993', '1');
INSERT INTO `hov_user_exchange` VALUES ('5', '1', '2', '88.00', '1552776993', '1');
INSERT INTO `hov_user_exchange` VALUES ('6', '1', '3', '47.00', '1552786993', '0');
INSERT INTO `hov_user_exchange` VALUES ('7', '2', '1', '99.00', '1552566993', '1');
INSERT INTO `hov_user_exchange` VALUES ('8', '1', '1', '334.00', '1552436993', '1');
INSERT INTO `hov_user_exchange` VALUES ('9', '1', '4', '22.00', '1552836993', '1');
INSERT INTO `hov_user_exchange` VALUES ('10', '1', '5', '322.00', '1552634993', '1');
INSERT INTO `hov_user_exchange` VALUES ('11', '2', '2', '333.00', '1552136993', '1');

-- ----------------------------
-- Table structure for `hov_user_grade`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_grade`;
CREATE TABLE `hov_user_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '头衔名称',
  `exp_min` int(11) DEFAULT NULL,
  `exp_max` int(11) DEFAULT NULL,
  `grade` tinyint(2) DEFAULT NULL COMMENT '等级',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_grade
-- ----------------------------
INSERT INTO `hov_user_grade` VALUES ('1', 'VIP0', '0', '1000', '0', null, null);
INSERT INTO `hov_user_grade` VALUES ('2', 'VIP1', '1001', '2000', '1', null, '1553002578');
INSERT INTO `hov_user_grade` VALUES ('3', 'VIP2', '2001', '3000', '2', null, null);

-- ----------------------------
-- Table structure for `hov_user_log`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_log`;
CREATE TABLE `hov_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_log
-- ----------------------------
INSERT INTO `hov_user_log` VALUES ('1', '1', '1212', '1510885948');
INSERT INTO `hov_user_log` VALUES ('2', '1', '12', '1510485948');

-- ----------------------------
-- Table structure for `hov_user_note`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_note`;
CREATE TABLE `hov_user_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '收件人',
  `type` tinyint(1) DEFAULT NULL COMMENT '1:所有人2:vip3:单用户',
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(800) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL COMMENT '1已读0未读',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_note
-- ----------------------------
INSERT INTO `hov_user_note` VALUES ('1', '1', '1', '12222', '123', '0', '1553616000');
INSERT INTO `hov_user_note` VALUES ('5', null, '1', 'sdfas', '<p>sdfasdf</p>', null, '1553065119');
INSERT INTO `hov_user_note` VALUES ('6', null, '1', 'ewr', '<p>werwer<br/></p>', null, '1553090056');

-- ----------------------------
-- Table structure for `hov_user_question`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_question`;
CREATE TABLE `hov_user_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `question` varchar(800) DEFAULT NULL,
  `answer` varchar(600) DEFAULT NULL,
  `attachment` text,
  `status` tinyint(1) DEFAULT '1' COMMENT '1待处理，2正在处理，3待用户反馈，4已解决，5已取消',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_question
-- ----------------------------
INSERT INTO `hov_user_question` VALUES ('2', '2', '1', 'dddd', 'aaaa', '<p>ccccc</p>', null, '1', '1553045303', '1553046304');
INSERT INTO `hov_user_question` VALUES ('3', '1', '1', '122', '2323', null, null, '0', '1553047231', '1553047231');

-- ----------------------------
-- Table structure for `hov_user_remark`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_remark`;
CREATE TABLE `hov_user_remark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `prize_id` int(11) DEFAULT NULL,
  `content` varchar(190) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_remark
-- ----------------------------
INSERT INTO `hov_user_remark` VALUES ('1', '1', '1', '<p>ewrewrwersdfafsdfasssf问问</p><p>斯蒂芬斯蒂芬abcds</p>', '1552572226', '1553000946');

-- ----------------------------
-- Table structure for `hov_webconfig`
-- ----------------------------
DROP TABLE IF EXISTS `hov_webconfig`;
CREATE TABLE `hov_webconfig` (
  `id` int(11) NOT NULL COMMENT '网站配置标识',
  `sitename` varchar(200) NOT NULL COMMENT '网站名称',
  `keywords` text COMMENT '关键词',
  `desc` text COMMENT '描述',
  `is_log` int(1) NOT NULL DEFAULT '1' COMMENT '1开启日志0关闭',
  `file_type` varchar(200) DEFAULT NULL COMMENT '允许上传的类型',
  `file_size` bigint(20) DEFAULT NULL COMMENT '允许上传的最大值',
  `statistics` text COMMENT '统计代码',
  `black_ip` text COMMENT 'ip黑名单',
  `url_suffix` varchar(20) DEFAULT NULL COMMENT 'url伪静态后缀',
  `currency` varchar(30) DEFAULT '金币' COMMENT '货币名称',
  `numofverify` int(11) NOT NULL DEFAULT '0' COMMENT '金币超过多少要求手机验证',
  `allowonlinenum` tinyint(2) DEFAULT '0' COMMENT '一个账户允许几个客户端同时在线',
  `agent_depositrate` smallint(6) DEFAULT '1000' COMMENT '代理直冲比例',
  `agent_depositexp` decimal(3,1) DEFAULT '0.5' COMMENT '代理直冲送经验',
  `first_depositrate` decimal(6,4) DEFAULT '0.5000' COMMENT '首充返利比例',
  `sub_bid_rrate` decimal(4,2) DEFAULT NULL COMMENT '下线投注返利比例',
  `fix_rate` decimal(6,4) DEFAULT NULL COMMENT '固定赔率游戏赔率',
  `min_withdraw` decimal(4,0) DEFAULT NULL COMMENT '直营模式最低提现(元)',
  `max_deposit` decimal(4,0) DEFAULT NULL COMMENT '直营模式最低充值(元)',
  `flow_days` tinyint(2) DEFAULT '7' COMMENT '兑换奖品-流水计算天数',
  `charge_ratio` decimal(8,4) DEFAULT NULL COMMENT '兑换奖品-额外兑换奖品手续费比例',
  `flow_times` decimal(6,2) DEFAULT NULL COMMENT '兑换奖品-流水倍数要求',
  `flow_autobid` tinyint(1) DEFAULT '0' COMMENT '兑换奖品-自动投资算流水（1：算入，0：不算入）',
  PRIMARY KEY (`id`),
  KEY `web` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_webconfig
-- ----------------------------
INSERT INTO `hov_webconfig` VALUES ('101', 'Tplay后台管理框架', 'Tplay,后台管理,thinkphp5,layui', 'Tplay是一款基于ThinkPHP5.0.12 + layui2.2.45 + ECharts + Mysql开发的后台管理框架，集成了一般应用所必须的基础性功能，为开发者节省大量的时间。', '1', 'jpg,png,gif,mp4,zip,jpeg', '500', '', '', null, '金币', '0', '0', '1000', '0.4', '0.5000', '0.05', '0.9920', '50', '50', '7', '3.0000', '3.00', '1');
