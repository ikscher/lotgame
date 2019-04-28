/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : tplay

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-04-28 22:10:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hov_ad`
-- ----------------------------
DROP TABLE IF EXISTS `hov_ad`;
CREATE TABLE `hov_ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(5000) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `ad_type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_ad
-- ----------------------------
INSERT INTO `hov_ad` VALUES ('1', '<span style=\"margin-left:10px;font-size:8px;\"><span style=\"font-family:simhei;\"><span style=\"font-family:simsun;\"><img alt=\"\" height=\"53\" src=\"/UF/Uploads/Article/20150312145204.png\" style=\"height:51px;width:254px;float:none;margin:0px;\" width=\"419\" /> </span></span></span>', '1357660800', '1391097600', '1357715233', null, '首页LOGO图片（推荐LOGO图片大小：220*65像素）', '0');
INSERT INTO `hov_ad` VALUES ('2', '', '1357660800', '1391097600', '1357715437', null, '首页顶部中间广告条（尺寸大小：485*65像素）', '0');
INSERT INTO `hov_ad` VALUES ('3', '', '1357660800', '1522339200', '1357715509', null, '首页顶部联系电话图片（推荐尺寸大小：225*65像素）', '0');
INSERT INTO `hov_ad` VALUES ('4', '', '1357660800', '1391097600', '1357715551', '1555599490', '首页幻灯片展示', '1');
INSERT INTO `hov_ad` VALUES ('5', '<img style=\"float:none;margin:0px;\" alt=\"\" src=\"/UF/Uploads/Article/20170607151350.jpg\" />', '1357660800', '1393516800', '1357716501', null, '内页中上部大广告位', '0');
INSERT INTO `hov_ad` VALUES ('6', '<img style=\"height: 97px; width: 300px; float: none; margin: 0px;\" alt=\"\" src=\"/UF/Uploads/Article/20130812220516.jpg\" />', '1365436800', '1397750400', '1367025431', null, '顶部滑动图片', '0');
INSERT INTO `hov_ad` VALUES ('8', '<img style=\"height: 100px; width: 100px; float: none; margin: 0px;\" alt=\"\" src=\"/UF/Uploads/Article/20140327173642.gif\" />', '0', '0', '0', null, '官方微博', '0');
INSERT INTO `hov_ad` VALUES ('9', '<img style=\"margin: 0px; width: 38px; float: none; height: 35px\" alt=\"\" src=\"/UF/Uploads/Article/20150326104053.png\" width=\"42\" height=\"40\" />', '0', '0', '0', null, '官方微信', '0');
INSERT INTO `hov_ad` VALUES ('11', '', '0', '0', '0', '1555599673', '网站底部版权', '0');
INSERT INTO `hov_ad` VALUES ('12', '<img style=\"height: 6px; width: 50px; float: none; margin: 0px;\" alt=\"\" src=\"/UF/Uploads/Article/20150116155833.png\" />', '0', '0', '0', null, '客服热线', '0');
INSERT INTO `hov_ad` VALUES ('20', '/Style/H/images/new/rongzi_bg.jpg', '0', '0', '0', null, '我要融资页背景', '0');
INSERT INTO `hov_ad` VALUES ('21', '', '0', '0', '0', null, '首页公告', '0');
INSERT INTO `hov_ad` VALUES ('22', '<dl class=\"dl_box\"><dd><span style=\"color:rgb(0, 0, 0);\"><span style=\"font-family:microsoft yahei;\">&nbsp; 5100个智慧的投资人加入红顶</span></span></dd>&nbsp; &nbsp; 累计成功投资金额1亿5136万元</dl><dl class=\"dl_box\"><br /></dl>', '0', '0', '0', null, '微官网首页－数据统计', '0');
INSERT INTO `hov_ad` VALUES ('24', 'a:2:{i:0;a:3:{s:3:\"img\";s:35:\"UF/Uploads/Ad/20150422112451288.jpg\";s:4:\"info\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:1;a:3:{s:3:\"img\";s:35:\"UF/Uploads/Ad/20181206105953230.jpg\";s:4:\"info\";s:0:\"\";s:3:\"url\";s:0:\"\";}}', '0', '0', '0', null, '微官网首页－幻灯片（推荐图片使用601*263像素）', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_admin
-- ----------------------------
INSERT INTO `hov_admin` VALUES ('1', 'lotgame', 'admin', 'af314b7fd5ecf184709747eba294d8d5', '1', '1510885948', '1555722824', '1556368742', '192.168.1.104', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_admin_cate
-- ----------------------------
INSERT INTO `hov_admin_cate` VALUES ('1', '超级管理员', '4,5,51,6,7,8,11,13,14,16,17,19,20,21,53,54,55,42,43,44,45,47,48,134,135,136,138,139,141,142,25,26,28,29,34,35,37,38,39,40,60,61,62,63,71,72,73,74,75,76,77,78,79,80,81,83,84,85,92,93,94,95,96,97,98,129,99,100,104,108,109,111,112,114,115,119,120,130,131,122,123,124,125,126,127,128', '0', '1555658648', '超级管理员，拥有最高权限！');

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
) ENGINE=InnoDB AUTO_INCREMENT=889 DEFAULT CHARSET=utf8;

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
INSERT INTO `hov_admin_log` VALUES ('442', '111', '1', '192.168.1.102', '添加代理分类成功-9', '1553261427');
INSERT INTO `hov_admin_log` VALUES ('443', '111', '1', '192.168.1.102', '添加代理分类成功-10', '1553261438');
INSERT INTO `hov_admin_log` VALUES ('444', '111', '1', '192.168.1.102', '添加代理分类成功-11', '1553261477');
INSERT INTO `hov_admin_log` VALUES ('445', '111', '1', '192.168.1.102', '添加代理分类成功-12', '1553261484');
INSERT INTO `hov_admin_log` VALUES ('446', '119', '1', '192.168.1.102', '添加代理成功-1', '1553265488');
INSERT INTO `hov_admin_log` VALUES ('447', '115', '1', '192.168.1.102', '1', '1553265583');
INSERT INTO `hov_admin_log` VALUES ('448', '120', '1', '192.168.1.102', '1', '1553265614');
INSERT INTO `hov_admin_log` VALUES ('449', '119', '1', '192.168.1.102', '添加代理成功-2', '1553265931');
INSERT INTO `hov_admin_log` VALUES ('450', '119', '1', '192.168.1.102', '修改代理成功-2', '1553266355');
INSERT INTO `hov_admin_log` VALUES ('451', '119', '1', '192.168.1.102', '修改代理成功-2', '1553266429');
INSERT INTO `hov_admin_log` VALUES ('452', '119', '1', '192.168.1.102', '修改代理成功-2', '1553267035');
INSERT INTO `hov_admin_log` VALUES ('453', '119', '1', '192.168.1.102', '修改代理成功-2', '1553267057');
INSERT INTO `hov_admin_log` VALUES ('454', '119', '1', '192.168.1.102', '修改代理成功-2', '1553267459');
INSERT INTO `hov_admin_log` VALUES ('455', '119', '1', '192.168.1.102', '添加代理成功-3', '1553267614');
INSERT INTO `hov_admin_log` VALUES ('456', '49', '1', '192.168.1.102', '21', '1553267657');
INSERT INTO `hov_admin_log` VALUES ('457', '119', '1', '192.168.1.102', '修改代理成功-3', '1553267658');
INSERT INTO `hov_admin_log` VALUES ('458', '119', '1', '192.168.1.102', '修改代理成功-3', '1553267682');
INSERT INTO `hov_admin_log` VALUES ('459', '119', '1', '192.168.1.102', '修改代理成功-3', '1553267741');
INSERT INTO `hov_admin_log` VALUES ('460', '119', '1', '192.168.1.102', '修改代理成功-3', '1553267909');
INSERT INTO `hov_admin_log` VALUES ('461', '50', '1', '192.168.1.102', '', '1553302651');
INSERT INTO `hov_admin_log` VALUES ('462', '119', '1', '192.168.1.102', '添加代理成功-4', '1553306931');
INSERT INTO `hov_admin_log` VALUES ('463', '120', '1', '192.168.1.102', '删除代理成功-4', '1553307368');
INSERT INTO `hov_admin_log` VALUES ('464', '120', '1', '192.168.1.102', '删除代理成功-3', '1553307867');
INSERT INTO `hov_admin_log` VALUES ('465', '119', '1', '192.168.1.102', '添加代理成功-5', '1553307875');
INSERT INTO `hov_admin_log` VALUES ('466', '120', '1', '192.168.1.102', '删除代理成功-5', '1553308582');
INSERT INTO `hov_admin_log` VALUES ('467', '119', '1', '192.168.1.102', '添加代理成功-6', '1553308614');
INSERT INTO `hov_admin_log` VALUES ('468', '120', '1', '192.168.1.102', '删除代理成功-1', '1553308631');
INSERT INTO `hov_admin_log` VALUES ('469', '119', '1', '192.168.1.102', '添加代理成功-7', '1553308660');
INSERT INTO `hov_admin_log` VALUES ('470', '4', '1', '192.168.1.102', '121', '1553309362');
INSERT INTO `hov_admin_log` VALUES ('471', '50', '1', '192.168.1.102', '', '1553607528');
INSERT INTO `hov_admin_log` VALUES ('472', '49', '1', '192.168.1.102', '29', '1553608719');
INSERT INTO `hov_admin_log` VALUES ('473', '119', '1', '192.168.1.102', '添加代理成功-1', '1553608721');
INSERT INTO `hov_admin_log` VALUES ('474', '120', '1', '192.168.1.102', '删除代理成功-1', '1553608788');
INSERT INTO `hov_admin_log` VALUES ('475', '49', '1', '192.168.1.102', '30', '1553608818');
INSERT INTO `hov_admin_log` VALUES ('476', '119', '1', '192.168.1.102', '添加代理成功-10000', '1553608821');
INSERT INTO `hov_admin_log` VALUES ('477', '49', '1', '192.168.1.107', '31', '1553675513');
INSERT INTO `hov_admin_log` VALUES ('478', '119', '1', '192.168.1.107', '添加代理成功-10001', '1553675514');
INSERT INTO `hov_admin_log` VALUES ('479', '50', '1', '192.168.1.107', '', '1553745168');
INSERT INTO `hov_admin_log` VALUES ('480', '72', '1', '192.168.1.107', '删除奖品分类成功-1', '1553760596');
INSERT INTO `hov_admin_log` VALUES ('481', '72', '1', '192.168.1.107', '删除奖品分类成功-6', '1553760600');
INSERT INTO `hov_admin_log` VALUES ('482', '72', '1', '192.168.1.107', '删除奖品分类成功-7', '1553760604');
INSERT INTO `hov_admin_log` VALUES ('483', '72', '1', '192.168.1.107', '删除奖品分类成功-3', '1553760608');
INSERT INTO `hov_admin_log` VALUES ('484', '72', '1', '192.168.1.107', '删除奖品分类成功-2', '1553760612');
INSERT INTO `hov_admin_log` VALUES ('485', '71', '1', '192.168.1.107', '添加奖品分类成功-8', '1553760641');
INSERT INTO `hov_admin_log` VALUES ('486', '71', '1', '192.168.1.107', '添加奖品分类成功-9', '1553760654');
INSERT INTO `hov_admin_log` VALUES ('487', '71', '1', '192.168.1.107', '添加奖品分类成功-10', '1553760669');
INSERT INTO `hov_admin_log` VALUES ('488', '71', '1', '192.168.1.107', '添加奖品分类成功-11', '1553760681');
INSERT INTO `hov_admin_log` VALUES ('489', '71', '1', '192.168.1.107', '添加奖品分类成功-12', '1553760691');
INSERT INTO `hov_admin_log` VALUES ('490', '72', '1', '192.168.1.107', '删除奖品分类成功-12', '1553760696');
INSERT INTO `hov_admin_log` VALUES ('491', '71', '1', '192.168.1.107', '添加奖品分类成功-13', '1553760704');
INSERT INTO `hov_admin_log` VALUES ('492', '71', '1', '192.168.1.107', '添加奖品分类成功-14', '1553762167');
INSERT INTO `hov_admin_log` VALUES ('493', '72', '1', '192.168.1.107', '删除奖品分类成功-14', '1553762193');
INSERT INTO `hov_admin_log` VALUES ('494', '74', '1', '192.168.1.107', '1', '1553762773');
INSERT INTO `hov_admin_log` VALUES ('495', '74', '1', '192.168.1.107', '2', '1553762777');
INSERT INTO `hov_admin_log` VALUES ('496', '74', '1', '192.168.1.107', '3', '1553762781');
INSERT INTO `hov_admin_log` VALUES ('497', '73', '1', '192.168.1.107', '修改奖品成功-5', '1553762802');
INSERT INTO `hov_admin_log` VALUES ('498', '73', '1', '192.168.1.107', '修改奖品成功-4', '1553762812');
INSERT INTO `hov_admin_log` VALUES ('499', '49', '1', '192.168.1.107', '32', '1553762894');
INSERT INTO `hov_admin_log` VALUES ('500', '73', '1', '192.168.1.107', '添加奖品成功-6', '1553762909');
INSERT INTO `hov_admin_log` VALUES ('501', '50', '1', '192.168.1.101', '', '1553775733');
INSERT INTO `hov_admin_log` VALUES ('502', '49', '1', '192.168.1.101', '33', '1553776657');
INSERT INTO `hov_admin_log` VALUES ('503', '73', '1', '192.168.1.101', '添加奖品成功-7', '1553776674');
INSERT INTO `hov_admin_log` VALUES ('504', '49', '1', '192.168.1.101', '34', '1553776719');
INSERT INTO `hov_admin_log` VALUES ('505', '73', '1', '192.168.1.101', '添加奖品成功-8', '1553776727');
INSERT INTO `hov_admin_log` VALUES ('506', '49', '1', '192.168.1.101', '35', '1553776750');
INSERT INTO `hov_admin_log` VALUES ('507', '49', '1', '192.168.1.101', '36', '1553776765');
INSERT INTO `hov_admin_log` VALUES ('508', '49', '1', '192.168.1.101', '37', '1553776768');
INSERT INTO `hov_admin_log` VALUES ('509', '73', '1', '192.168.1.101', '修改奖品成功-8', '1553776774');
INSERT INTO `hov_admin_log` VALUES ('510', '49', '1', '192.168.1.101', '38', '1553776809');
INSERT INTO `hov_admin_log` VALUES ('511', '73', '1', '192.168.1.101', '添加奖品成功-9', '1553776816');
INSERT INTO `hov_admin_log` VALUES ('512', '49', '1', '192.168.1.101', '39', '1553776869');
INSERT INTO `hov_admin_log` VALUES ('513', '73', '1', '192.168.1.101', '添加奖品成功-10', '1553776882');
INSERT INTO `hov_admin_log` VALUES ('514', '50', '1', '192.168.1.107', '', '1553824467');
INSERT INTO `hov_admin_log` VALUES ('515', '73', '1', '192.168.1.107', '修改奖品成功-4', '1553824486');
INSERT INTO `hov_admin_log` VALUES ('516', '73', '1', '192.168.1.107', '修改奖品成功-4', '1553824559');
INSERT INTO `hov_admin_log` VALUES ('517', '81', '1', '192.168.1.107', '兑换手续费规则删除成功-2', '1553830945');
INSERT INTO `hov_admin_log` VALUES ('518', '81', '1', '192.168.1.107', '兑换手续费规则删除成功-4', '1553830949');
INSERT INTO `hov_admin_log` VALUES ('519', '80', '1', '192.168.1.107', '兑换手续费规则修改成功', '1553830964');
INSERT INTO `hov_admin_log` VALUES ('520', '80', '1', '192.168.1.107', '兑换手续费规则修改成功', '1553830976');
INSERT INTO `hov_admin_log` VALUES ('521', '83', '1', '192.168.1.107', '流水手续费修改成功', '1553842513');
INSERT INTO `hov_admin_log` VALUES ('522', '79', '1', '192.168.1.107', '删除兑换记录-25', '1553847962');
INSERT INTO `hov_admin_log` VALUES ('523', '79', '1', '192.168.1.107', '删除兑换记录-26', '1553847970');
INSERT INTO `hov_admin_log` VALUES ('524', '79', '1', '192.168.1.107', '删除兑换记录-27', '1553847974');
INSERT INTO `hov_admin_log` VALUES ('525', '79', '1', '192.168.1.107', '删除兑换记录-24', '1553847977');
INSERT INTO `hov_admin_log` VALUES ('526', '79', '1', '192.168.1.107', '删除兑换记录-23', '1553847981');
INSERT INTO `hov_admin_log` VALUES ('527', '79', '1', '192.168.1.107', '删除兑换记录-3', '1553847985');
INSERT INTO `hov_admin_log` VALUES ('528', '79', '1', '192.168.1.107', '删除兑换记录-9', '1553847989');
INSERT INTO `hov_admin_log` VALUES ('529', '79', '1', '192.168.1.107', '删除兑换记录-10', '1553847993');
INSERT INTO `hov_admin_log` VALUES ('530', '79', '1', '192.168.1.107', '删除兑换记录-28', '1553847995');
INSERT INTO `hov_admin_log` VALUES ('531', '79', '1', '192.168.1.101', '删除兑换记录-13', '1553908508');
INSERT INTO `hov_admin_log` VALUES ('532', '79', '1', '192.168.1.101', '删除兑换记录-12', '1553908513');
INSERT INTO `hov_admin_log` VALUES ('533', '77', '1', '192.168.1.101', '审核用户1奖品兑换', '1553908601');
INSERT INTO `hov_admin_log` VALUES ('534', '77', '1', '192.168.1.101', '审核用户1奖品兑换', '1553908906');
INSERT INTO `hov_admin_log` VALUES ('535', '77', '1', '192.168.1.101', '审核用户1奖品兑换', '1553909098');
INSERT INTO `hov_admin_log` VALUES ('536', '77', '1', '192.168.1.101', '审核用户1奖品兑换', '1553909154');
INSERT INTO `hov_admin_log` VALUES ('537', '77', '1', '192.168.1.101', '审核用户1奖品兑换', '1553909958');
INSERT INTO `hov_admin_log` VALUES ('538', '77', '1', '192.168.1.101', '审核用户1奖品兑换', '1553910010');
INSERT INTO `hov_admin_log` VALUES ('539', '4', '1', '192.168.1.101', '102', '1553925317');
INSERT INTO `hov_admin_log` VALUES ('540', '4', '1', '192.168.1.101', '103', '1553925338');
INSERT INTO `hov_admin_log` VALUES ('541', '4', '1', '192.168.1.101', '104', '1553925351');
INSERT INTO `hov_admin_log` VALUES ('542', '49', '1', '192.168.1.101', '40', '1553948093');
INSERT INTO `hov_admin_log` VALUES ('543', '42', '1', '192.168.1.101', '50', '1553952761');
INSERT INTO `hov_admin_log` VALUES ('544', '50', '1', '192.168.1.107', '', '1554104550');
INSERT INTO `hov_admin_log` VALUES ('545', '50', '1', '192.168.1.107', '', '1554360435');
INSERT INTO `hov_admin_log` VALUES ('546', '4', '1', '192.168.1.107', '129', '1554360642');
INSERT INTO `hov_admin_log` VALUES ('547', '28', '1', '192.168.1.107', '修改角色信息成功', '1554360684');
INSERT INTO `hov_admin_log` VALUES ('548', '96', '1', '192.168.1.107', '冻结用户成功-4', '1554361168');
INSERT INTO `hov_admin_log` VALUES ('549', '96', '1', '192.168.1.107', '解冻用户成功-4', '1554361172');
INSERT INTO `hov_admin_log` VALUES ('550', '96', '1', '192.168.1.107', '冻结用户成功-4', '1554361185');
INSERT INTO `hov_admin_log` VALUES ('551', '95', '1', '192.168.1.107', '删除用户成功-4', '1554362834');
INSERT INTO `hov_admin_log` VALUES ('552', '95', '1', '192.168.1.107', '删除用户成功-3', '1554362838');
INSERT INTO `hov_admin_log` VALUES ('553', '95', '1', '192.168.1.107', '删除用户成功-2', '1554362843');
INSERT INTO `hov_admin_log` VALUES ('554', '95', '1', '192.168.1.107', '删除用户成功-1', '1554362847');
INSERT INTO `hov_admin_log` VALUES ('555', '94', '1', '192.168.1.107', '修改用户信息成功-5', '1554364285');
INSERT INTO `hov_admin_log` VALUES ('556', '50', '1', '192.168.1.101', '', '1554430284');
INSERT INTO `hov_admin_log` VALUES ('557', '13', '1', '192.168.1.101', '', '1554431179');
INSERT INTO `hov_admin_log` VALUES ('558', '14', '1', '192.168.1.101', '45397312@qq.com', '1554431198');
INSERT INTO `hov_admin_log` VALUES ('559', '14', '1', '192.168.1.101', '45397312@qq.com', '1554432698');
INSERT INTO `hov_admin_log` VALUES ('560', '92', '1', '192.168.1.101', '添加用户级别成功-4', '1554446281');
INSERT INTO `hov_admin_log` VALUES ('561', '92', '1', '192.168.1.101', '修改用户级别成功-1', '1554446292');
INSERT INTO `hov_admin_log` VALUES ('562', '92', '1', '192.168.1.101', '添加用户级别成功-5', '1554446322');
INSERT INTO `hov_admin_log` VALUES ('563', '92', '1', '192.168.1.101', '添加用户级别成功-6', '1554446352');
INSERT INTO `hov_admin_log` VALUES ('564', '92', '1', '192.168.1.101', '添加用户级别成功-7', '1554446381');
INSERT INTO `hov_admin_log` VALUES ('565', '92', '1', '192.168.1.101', '修改用户级别成功-1', '1554446393');
INSERT INTO `hov_admin_log` VALUES ('566', '73', '1', '192.168.1.101', '修改奖品成功-10', '1554460239');
INSERT INTO `hov_admin_log` VALUES ('567', '73', '1', '192.168.1.101', '修改奖品成功-10', '1554465967');
INSERT INTO `hov_admin_log` VALUES ('568', '73', '1', '192.168.1.101', '修改奖品成功-10', '1554465975');
INSERT INTO `hov_admin_log` VALUES ('569', '73', '1', '192.168.1.101', '修改奖品成功-10', '1554465982');
INSERT INTO `hov_admin_log` VALUES ('570', '73', '1', '192.168.1.101', '修改奖品成功-10', '1554466246');
INSERT INTO `hov_admin_log` VALUES ('571', '73', '1', '192.168.1.101', '修改奖品成功-10', '1554466254');
INSERT INTO `hov_admin_log` VALUES ('572', '114', '1', '192.168.1.101', '成功生成卡密', '1554468991');
INSERT INTO `hov_admin_log` VALUES ('573', '73', '1', '192.168.1.101', '修改奖品成功-8', '1554510788');
INSERT INTO `hov_admin_log` VALUES ('574', '73', '1', '192.168.1.101', '修改奖品成功-8', '1554510806');
INSERT INTO `hov_admin_log` VALUES ('575', '73', '1', '192.168.1.101', '修改奖品成功-8', '1554511036');
INSERT INTO `hov_admin_log` VALUES ('576', '114', '1', '192.168.1.102', '成功生成卡密', '1554556313');
INSERT INTO `hov_admin_log` VALUES ('577', '73', '1', '192.168.1.102', '修改奖品成功-10', '1554618879');
INSERT INTO `hov_admin_log` VALUES ('578', '73', '1', '192.168.1.102', '修改奖品成功-10', '1554618956');
INSERT INTO `hov_admin_log` VALUES ('579', '83', '1', '192.168.1.102', '流水手续费修改成功', '1554620437');
INSERT INTO `hov_admin_log` VALUES ('580', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1554621799');
INSERT INTO `hov_admin_log` VALUES ('581', '80', '1', '192.168.1.102', '兑换手续费规则添加成功-2', '1554621839');
INSERT INTO `hov_admin_log` VALUES ('582', '80', '1', '192.168.1.102', '兑换手续费规则添加成功-3', '1554621863');
INSERT INTO `hov_admin_log` VALUES ('583', '83', '1', '192.168.1.102', '流水手续费修改成功', '1554622355');
INSERT INTO `hov_admin_log` VALUES ('584', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1554627793');
INSERT INTO `hov_admin_log` VALUES ('585', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1554627803');
INSERT INTO `hov_admin_log` VALUES ('586', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1554627817');
INSERT INTO `hov_admin_log` VALUES ('587', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1554627829');
INSERT INTO `hov_admin_log` VALUES ('588', '80', '1', '192.168.1.102', '兑换手续费规则修改成功', '1554627840');
INSERT INTO `hov_admin_log` VALUES ('589', '50', '1', '192.168.1.107', '', '1554688920');
INSERT INTO `hov_admin_log` VALUES ('590', '114', '1', '192.168.1.107', '成功生成卡密', '1554689265');
INSERT INTO `hov_admin_log` VALUES ('591', '114', '1', '192.168.1.107', '成功生成卡密', '1554690746');
INSERT INTO `hov_admin_log` VALUES ('592', '114', '1', '192.168.1.107', '成功生成卡密', '1554691915');
INSERT INTO `hov_admin_log` VALUES ('593', '108', '1', '192.168.1.107', '添加卡类成功-10', '1554698695');
INSERT INTO `hov_admin_log` VALUES ('594', '73', '1', '192.168.1.107', '修改奖品成功-4', '1554698714');
INSERT INTO `hov_admin_log` VALUES ('595', '114', '1', '192.168.1.107', '成功生成卡密', '1554698811');
INSERT INTO `hov_admin_log` VALUES ('596', '50', '1', '192.168.1.102', '', '1554725485');
INSERT INTO `hov_admin_log` VALUES ('597', '114', '1', '192.168.1.102', '成功生成卡密', '1554725518');
INSERT INTO `hov_admin_log` VALUES ('598', '108', '1', '192.168.1.102', '修改卡类成功-10', '1554726300');
INSERT INTO `hov_admin_log` VALUES ('599', '114', '1', '192.168.1.102', '成功生成卡密', '1554726576');
INSERT INTO `hov_admin_log` VALUES ('600', '108', '1', '192.168.1.102', '修改卡类成功-4', '1554726620');
INSERT INTO `hov_admin_log` VALUES ('601', '114', '1', '192.168.1.102', '成功生成卡密', '1554727591');
INSERT INTO `hov_admin_log` VALUES ('602', '50', '1', '192.168.1.107', '', '1554775013');
INSERT INTO `hov_admin_log` VALUES ('603', '94', '1', '192.168.1.107', '修改用户信息成功-5', '1554775182');
INSERT INTO `hov_admin_log` VALUES ('604', '94', '1', '192.168.1.107', '修改用户信息成功-10', '1554775437');
INSERT INTO `hov_admin_log` VALUES ('605', '94', '1', '192.168.1.107', '修改用户信息成功-10', '1554775451');
INSERT INTO `hov_admin_log` VALUES ('606', '94', '1', '192.168.1.107', '修改用户信息成功-10', '1554775464');
INSERT INTO `hov_admin_log` VALUES ('607', '94', '1', '192.168.1.107', '修改用户信息成功-10', '1554775622');
INSERT INTO `hov_admin_log` VALUES ('608', '94', '1', '192.168.1.107', '修改用户信息成功-10', '1554775633');
INSERT INTO `hov_admin_log` VALUES ('609', '94', '1', '192.168.1.107', '修改用户信息成功-10', '1554775645');
INSERT INTO `hov_admin_log` VALUES ('610', '49', '1', '192.168.1.107', '51', '1554775692');
INSERT INTO `hov_admin_log` VALUES ('611', '94', '1', '192.168.1.107', '修改用户信息成功-10', '1554775693');
INSERT INTO `hov_admin_log` VALUES ('612', '94', '1', '192.168.1.107', '修改用户信息成功-10', '1554775717');
INSERT INTO `hov_admin_log` VALUES ('613', '92', '1', '192.168.1.107', '修改用户级别成功-7', '1554777049');
INSERT INTO `hov_admin_log` VALUES ('614', '54', '1', '192.168.1.107', '签到等级设置成功-7', '1554779690');
INSERT INTO `hov_admin_log` VALUES ('615', '54', '1', '192.168.1.107', '签到等级设置成功-7', '1554779695');
INSERT INTO `hov_admin_log` VALUES ('616', '53', '1', '192.168.1.107', '签到等级修改成功', '1554780098');
INSERT INTO `hov_admin_log` VALUES ('617', '53', '1', '192.168.1.107', '签到等级修改成功', '1554780135');
INSERT INTO `hov_admin_log` VALUES ('618', '53', '1', '192.168.1.107', '签到等级修改成功', '1554780149');
INSERT INTO `hov_admin_log` VALUES ('619', '53', '1', '192.168.1.107', '签到等级修改成功', '1554780159');
INSERT INTO `hov_admin_log` VALUES ('620', '53', '1', '192.168.1.107', '签到等级修改成功', '1554780172');
INSERT INTO `hov_admin_log` VALUES ('621', '53', '1', '192.168.1.107', '签到等级修改成功', '1554780183');
INSERT INTO `hov_admin_log` VALUES ('622', '53', '1', '192.168.1.107', '签到等级修改成功', '1554780190');
INSERT INTO `hov_admin_log` VALUES ('623', '53', '1', '192.168.1.107', '签到等级修改成功', '1554780714');
INSERT INTO `hov_admin_log` VALUES ('624', '53', '1', '192.168.1.107', '签到等级修改成功', '1554780905');
INSERT INTO `hov_admin_log` VALUES ('625', '53', '1', '192.168.1.107', '签到等级修改成功', '1554780913');
INSERT INTO `hov_admin_log` VALUES ('626', '13', '1', '192.168.1.102', '', '1554810619');
INSERT INTO `hov_admin_log` VALUES ('627', '50', '1', '192.168.1.102', '', '1554811840');
INSERT INTO `hov_admin_log` VALUES ('628', '53', '1', '192.168.1.102', '签到等级修改成功', '1554813123');
INSERT INTO `hov_admin_log` VALUES ('629', '119', '1', '192.168.1.102', '修改代理成功-10001', '1554817692');
INSERT INTO `hov_admin_log` VALUES ('630', '50', '1', '192.168.1.107', '', '1554864976');
INSERT INTO `hov_admin_log` VALUES ('631', '119', '1', '192.168.1.107', '修改代理成功-10001', '1554865306');
INSERT INTO `hov_admin_log` VALUES ('632', '77', '1', '192.168.1.107', '拒绝用户10兑换的奖品', '1554884726');
INSERT INTO `hov_admin_log` VALUES ('633', '50', '1', '192.168.1.107', '', '1554954886');
INSERT INTO `hov_admin_log` VALUES ('634', '115', '1', '192.168.1.107', '42', '1554969488');
INSERT INTO `hov_admin_log` VALUES ('635', '115', '1', '192.168.1.107', '28', '1554969505');
INSERT INTO `hov_admin_log` VALUES ('636', '50', '1', '192.168.1.107', '', '1555039600');
INSERT INTO `hov_admin_log` VALUES ('637', '50', '1', '192.168.1.102', '', '1555114323');
INSERT INTO `hov_admin_log` VALUES ('638', '114', '1', '192.168.1.102', '成功生成卡密', '1555121515');
INSERT INTO `hov_admin_log` VALUES ('639', '114', '1', '192.168.1.102', '成功生成卡密', '1555121928');
INSERT INTO `hov_admin_log` VALUES ('640', '50', '1', '192.168.1.107', '', '1555310794');
INSERT INTO `hov_admin_log` VALUES ('641', '119', '1', '192.168.1.107', '修改代理成功-10001', '1555312775');
INSERT INTO `hov_admin_log` VALUES ('642', '119', '1', '192.168.1.107', '修改代理成功-10000', '1555312783');
INSERT INTO `hov_admin_log` VALUES ('643', '119', '1', '192.168.1.107', '添加代理成功-10002', '1555312799');
INSERT INTO `hov_admin_log` VALUES ('644', '120', '1', '192.168.1.107', '删除代理成功-10002', '1555312802');
INSERT INTO `hov_admin_log` VALUES ('645', '50', '1', '192.168.1.104', '', '1555335459');
INSERT INTO `hov_admin_log` VALUES ('646', '4', '1', '192.168.1.104', '118', '1555336860');
INSERT INTO `hov_admin_log` VALUES ('647', '4', '1', '192.168.1.104', '130', '1555342304');
INSERT INTO `hov_admin_log` VALUES ('648', '4', '1', '192.168.1.104', '131', '1555342355');
INSERT INTO `hov_admin_log` VALUES ('649', '28', '1', '192.168.1.104', '修改角色信息成功', '1555342377');
INSERT INTO `hov_admin_log` VALUES ('650', '131', '1', '192.168.1.104', '拒绝代理(10001)提现', '1555342384');
INSERT INTO `hov_admin_log` VALUES ('651', '131', '1', '192.168.1.104', '拒绝代理(10001)提现', '1555342423');
INSERT INTO `hov_admin_log` VALUES ('652', '131', '1', '192.168.1.104', '拒绝代理(10001)提现', '1555342436');
INSERT INTO `hov_admin_log` VALUES ('653', '131', '1', '192.168.1.104', '拒绝代理(10001)提现', '1555342504');
INSERT INTO `hov_admin_log` VALUES ('654', '4', '1', '192.168.1.100', '118', '1555388522');
INSERT INTO `hov_admin_log` VALUES ('655', '50', '1', '192.168.1.100', '', '1555391457');
INSERT INTO `hov_admin_log` VALUES ('656', '50', '1', '192.168.1.104', '', '1555426735');
INSERT INTO `hov_admin_log` VALUES ('657', '4', '1', '192.168.1.104', '132', '1555427053');
INSERT INTO `hov_admin_log` VALUES ('658', '4', '1', '192.168.1.104', '132', '1555427104');
INSERT INTO `hov_admin_log` VALUES ('659', '4', '1', '192.168.1.104', '132', '1555427133');
INSERT INTO `hov_admin_log` VALUES ('660', '50', '1', '192.168.1.104', '', '1555510655');
INSERT INTO `hov_admin_log` VALUES ('661', '50', '1', '192.168.1.100', '', '1555555337');
INSERT INTO `hov_admin_log` VALUES ('662', '42', '1', '192.168.1.100', '52', '1555556278');
INSERT INTO `hov_admin_log` VALUES ('663', '4', '1', '192.168.1.100', '133', '1555556708');
INSERT INTO `hov_admin_log` VALUES ('664', '4', '1', '192.168.1.100', '133', '1555558152');
INSERT INTO `hov_admin_log` VALUES ('665', '4', '1', '192.168.1.100', '134', '1555560682');
INSERT INTO `hov_admin_log` VALUES ('666', '28', '1', '192.168.1.100', '修改角色信息成功', '1555560716');
INSERT INTO `hov_admin_log` VALUES ('667', '134', '1', '192.168.1.100', '广告删除成功-10', '1555560725');
INSERT INTO `hov_admin_log` VALUES ('668', '4', '1', '192.168.1.100', '135', '1555560935');
INSERT INTO `hov_admin_log` VALUES ('669', '28', '1', '192.168.1.100', '修改角色信息成功', '1555561178');
INSERT INTO `hov_admin_log` VALUES ('670', '135', '1', '192.168.1.100', '广告修改成功-11', '1555563437');
INSERT INTO `hov_admin_log` VALUES ('671', '135', '1', '192.168.1.100', '广告修改成功-11', '1555563532');
INSERT INTO `hov_admin_log` VALUES ('672', '50', '1', '192.168.1.100', '', '1555571270');
INSERT INTO `hov_admin_log` VALUES ('673', '49', '1', '192.168.1.100', '53', '1555577968');
INSERT INTO `hov_admin_log` VALUES ('674', '49', '1', '192.168.1.100', '54', '1555577988');
INSERT INTO `hov_admin_log` VALUES ('675', '49', '1', '192.168.1.100', '55', '1555578207');
INSERT INTO `hov_admin_log` VALUES ('676', '49', '1', '192.168.1.100', '56', '1555578213');
INSERT INTO `hov_admin_log` VALUES ('677', '49', '1', '192.168.1.100', '57', '1555578317');
INSERT INTO `hov_admin_log` VALUES ('678', '49', '1', '192.168.1.100', '58', '1555578328');
INSERT INTO `hov_admin_log` VALUES ('679', '135', '1', '192.168.1.100', '广告修改成功-4', '1555578757');
INSERT INTO `hov_admin_log` VALUES ('680', '49', '1', '192.168.1.100', '59', '1555578845');
INSERT INTO `hov_admin_log` VALUES ('681', '49', '1', '192.168.1.100', '60', '1555578848');
INSERT INTO `hov_admin_log` VALUES ('682', '135', '1', '192.168.1.100', '广告修改成功-4', '1555578883');
INSERT INTO `hov_admin_log` VALUES ('683', '49', '1', '192.168.1.100', '61', '1555578939');
INSERT INTO `hov_admin_log` VALUES ('684', '135', '1', '192.168.1.100', '广告修改成功-4', '1555578953');
INSERT INTO `hov_admin_log` VALUES ('685', '50', '1', '192.168.1.104', '', '1555591492');
INSERT INTO `hov_admin_log` VALUES ('686', '49', '1', '192.168.1.104', '62', '1555591667');
INSERT INTO `hov_admin_log` VALUES ('687', '135', '1', '192.168.1.104', '广告修改成功-4', '1555591670');
INSERT INTO `hov_admin_log` VALUES ('688', '49', '1', '192.168.1.104', '63', '1555591693');
INSERT INTO `hov_admin_log` VALUES ('689', '135', '1', '192.168.1.104', '广告修改成功-4', '1555591697');
INSERT INTO `hov_admin_log` VALUES ('690', '49', '1', '192.168.1.104', '64', '1555593195');
INSERT INTO `hov_admin_log` VALUES ('691', '49', '1', '192.168.1.104', '65', '1555593209');
INSERT INTO `hov_admin_log` VALUES ('692', '49', '1', '192.168.1.104', '66', '1555593215');
INSERT INTO `hov_admin_log` VALUES ('693', '135', '1', '192.168.1.104', '广告修改成功-4', '1555593238');
INSERT INTO `hov_admin_log` VALUES ('694', '4', '1', '192.168.1.104', '136', '1555593564');
INSERT INTO `hov_admin_log` VALUES ('695', '28', '1', '192.168.1.104', '修改角色信息成功', '1555593597');
INSERT INTO `hov_admin_log` VALUES ('696', '135', '1', '192.168.1.104', '广告修改成功-4', '1555596478');
INSERT INTO `hov_admin_log` VALUES ('697', '49', '1', '192.168.1.104', '67', '1555597205');
INSERT INTO `hov_admin_log` VALUES ('698', '135', '1', '192.168.1.104', '广告修改成功-4', '1555597207');
INSERT INTO `hov_admin_log` VALUES ('699', '49', '1', '192.168.1.104', '68', '1555597828');
INSERT INTO `hov_admin_log` VALUES ('700', '135', '1', '192.168.1.104', '广告修改成功-4', '1555597830');
INSERT INTO `hov_admin_log` VALUES ('701', '49', '1', '192.168.1.104', '69', '1555597969');
INSERT INTO `hov_admin_log` VALUES ('702', '135', '1', '192.168.1.104', '广告修改成功-4', '1555597975');
INSERT INTO `hov_admin_log` VALUES ('703', '49', '1', '192.168.1.104', '70', '1555598046');
INSERT INTO `hov_admin_log` VALUES ('704', '49', '1', '192.168.1.104', '71', '1555598078');
INSERT INTO `hov_admin_log` VALUES ('705', '135', '1', '192.168.1.104', '广告修改成功-4', '1555598079');
INSERT INTO `hov_admin_log` VALUES ('706', '49', '1', '192.168.1.104', '72', '1555598205');
INSERT INTO `hov_admin_log` VALUES ('707', '135', '1', '192.168.1.104', '广告修改成功-4', '1555598410');
INSERT INTO `hov_admin_log` VALUES ('708', '135', '1', '192.168.1.104', '广告修改成功-4', '1555598558');
INSERT INTO `hov_admin_log` VALUES ('709', '49', '1', '192.168.1.104', '73', '1555598574');
INSERT INTO `hov_admin_log` VALUES ('710', '135', '1', '192.168.1.104', '广告修改成功-4', '1555598575');
INSERT INTO `hov_admin_log` VALUES ('711', '135', '1', '192.168.1.104', '广告修改成功-4', '1555598582');
INSERT INTO `hov_admin_log` VALUES ('712', '49', '1', '192.168.1.104', '74', '1555598809');
INSERT INTO `hov_admin_log` VALUES ('713', '135', '1', '192.168.1.104', '广告修改成功-4', '1555598811');
INSERT INTO `hov_admin_log` VALUES ('714', '135', '1', '192.168.1.104', '广告修改成功-4', '1555599319');
INSERT INTO `hov_admin_log` VALUES ('715', '49', '1', '192.168.1.104', '75', '1555599423');
INSERT INTO `hov_admin_log` VALUES ('716', '135', '1', '192.168.1.104', '广告修改成功-4', '1555599425');
INSERT INTO `hov_admin_log` VALUES ('717', '135', '1', '192.168.1.104', '广告修改成功-4', '1555599435');
INSERT INTO `hov_admin_log` VALUES ('718', '49', '1', '192.168.1.104', '76', '1555599454');
INSERT INTO `hov_admin_log` VALUES ('719', '49', '1', '192.168.1.104', '77', '1555599457');
INSERT INTO `hov_admin_log` VALUES ('720', '49', '1', '192.168.1.104', '78', '1555599459');
INSERT INTO `hov_admin_log` VALUES ('721', '135', '1', '192.168.1.104', '广告修改成功-4', '1555599461');
INSERT INTO `hov_admin_log` VALUES ('722', '135', '1', '192.168.1.104', '广告修改成功-4', '1555599490');
INSERT INTO `hov_admin_log` VALUES ('723', '134', '1', '192.168.1.104', '广告删除成功-7', '1555599643');
INSERT INTO `hov_admin_log` VALUES ('724', '135', '1', '192.168.1.104', '广告修改成功-11', '1555599673');
INSERT INTO `hov_admin_log` VALUES ('725', '134', '1', '192.168.1.104', '广告删除成功-23', '1555599687');
INSERT INTO `hov_admin_log` VALUES ('726', '4', '1', '192.168.1.100', '137', '1555638431');
INSERT INTO `hov_admin_log` VALUES ('727', '4', '1', '192.168.1.100', '137', '1555638714');
INSERT INTO `hov_admin_log` VALUES ('728', '4', '1', '192.168.1.100', '138', '1555638750');
INSERT INTO `hov_admin_log` VALUES ('729', '4', '1', '192.168.1.100', '139', '1555638786');
INSERT INTO `hov_admin_log` VALUES ('730', '4', '1', '192.168.1.100', '24', '1555638860');
INSERT INTO `hov_admin_log` VALUES ('731', '4', '1', '192.168.1.100', '27', '1555638899');
INSERT INTO `hov_admin_log` VALUES ('732', '4', '1', '192.168.1.100', '30', '1555638930');
INSERT INTO `hov_admin_log` VALUES ('733', '5', '1', '192.168.1.100', '23', '1555638949');
INSERT INTO `hov_admin_log` VALUES ('734', '28', '1', '192.168.1.100', '修改角色信息成功', '1555638983');
INSERT INTO `hov_admin_log` VALUES ('735', '139', '1', '192.168.1.100', '砸蛋设置添加成功-1', '1555641673');
INSERT INTO `hov_admin_log` VALUES ('736', '139', '1', '192.168.1.100', '砸蛋设置添加成功-2', '1555641783');
INSERT INTO `hov_admin_log` VALUES ('737', '139', '1', '192.168.1.100', '砸蛋设置添加成功-3', '1555641800');
INSERT INTO `hov_admin_log` VALUES ('738', '139', '1', '192.168.1.100', '砸蛋设置添加成功-4', '1555641814');
INSERT INTO `hov_admin_log` VALUES ('739', '139', '1', '192.168.1.100', '砸蛋设置添加成功-5', '1555641826');
INSERT INTO `hov_admin_log` VALUES ('740', '139', '1', '192.168.1.100', '砸蛋设置添加成功-6', '1555641839');
INSERT INTO `hov_admin_log` VALUES ('741', '139', '1', '192.168.1.100', '砸蛋设置添加成功-7', '1555641860');
INSERT INTO `hov_admin_log` VALUES ('742', '139', '1', '192.168.1.100', '砸蛋设置添加成功-8', '1555641903');
INSERT INTO `hov_admin_log` VALUES ('743', '138', '1', '192.168.1.100', '砸蛋设置删除成功-8', '1555641915');
INSERT INTO `hov_admin_log` VALUES ('744', '139', '1', '192.168.1.100', '砸蛋设置添加成功-9', '1555641921');
INSERT INTO `hov_admin_log` VALUES ('745', '138', '1', '192.168.1.100', '砸蛋设置删除成功-9', '1555641929');
INSERT INTO `hov_admin_log` VALUES ('746', '139', '1', '192.168.1.100', '砸蛋设置修改成功-7', '1555642186');
INSERT INTO `hov_admin_log` VALUES ('747', '139', '1', '192.168.1.100', '砸蛋设置修改成功-7', '1555642195');
INSERT INTO `hov_admin_log` VALUES ('748', '139', '1', '192.168.1.100', '砸蛋设置修改成功-7', '1555642200');
INSERT INTO `hov_admin_log` VALUES ('749', '50', '1', '192.168.1.100', '', '1555657604');
INSERT INTO `hov_admin_log` VALUES ('750', '4', '1', '192.168.1.100', '140', '1555657669');
INSERT INTO `hov_admin_log` VALUES ('751', '4', '1', '192.168.1.100', '141', '1555657714');
INSERT INTO `hov_admin_log` VALUES ('752', '4', '1', '192.168.1.100', '142', '1555657750');
INSERT INTO `hov_admin_log` VALUES ('753', '28', '1', '192.168.1.100', '修改角色信息成功', '1555658649');
INSERT INTO `hov_admin_log` VALUES ('754', '139', '1', '192.168.1.100', '砸蛋设置添加成功-10', '1555658980');
INSERT INTO `hov_admin_log` VALUES ('755', '138', '1', '192.168.1.100', '砸蛋设置删除成功-10', '1555658985');
INSERT INTO `hov_admin_log` VALUES ('756', '142', '1', '192.168.1.104', '抽奖设置修改成功-8', '1555676218');
INSERT INTO `hov_admin_log` VALUES ('757', '142', '1', '192.168.1.104', '抽奖设置修改成功-8', '1555677233');
INSERT INTO `hov_admin_log` VALUES ('758', '142', '1', '192.168.1.104', '抽奖设置修改成功-1', '1555677280');
INSERT INTO `hov_admin_log` VALUES ('759', '142', '1', '192.168.1.104', '抽奖设置修改成功-2', '1555677309');
INSERT INTO `hov_admin_log` VALUES ('760', '142', '1', '192.168.1.104', '抽奖设置修改成功-3', '1555677330');
INSERT INTO `hov_admin_log` VALUES ('761', '142', '1', '192.168.1.104', '抽奖设置修改成功-4', '1555677343');
INSERT INTO `hov_admin_log` VALUES ('762', '142', '1', '192.168.1.104', '抽奖设置修改成功-5', '1555677355');
INSERT INTO `hov_admin_log` VALUES ('763', '142', '1', '192.168.1.104', '抽奖设置修改成功-6', '1555677403');
INSERT INTO `hov_admin_log` VALUES ('764', '142', '1', '192.168.1.104', '抽奖设置修改成功-6', '1555677409');
INSERT INTO `hov_admin_log` VALUES ('765', '142', '1', '192.168.1.104', '抽奖设置修改成功-7', '1555677491');
INSERT INTO `hov_admin_log` VALUES ('766', '142', '1', '192.168.1.104', '抽奖设置修改成功-8', '1555677763');
INSERT INTO `hov_admin_log` VALUES ('767', '50', '1', '192.168.1.104', '', '1555722585');
INSERT INTO `hov_admin_log` VALUES ('768', '4', '1', '192.168.1.104', '10', '1555722677');
INSERT INTO `hov_admin_log` VALUES ('769', '4', '1', '192.168.1.104', '12', '1555722693');
INSERT INTO `hov_admin_log` VALUES ('770', '4', '1', '192.168.1.104', '15', '1555722707');
INSERT INTO `hov_admin_log` VALUES ('771', '4', '1', '192.168.1.104', '18', '1555722723');
INSERT INTO `hov_admin_log` VALUES ('772', '4', '1', '192.168.1.104', '52', '1555722742');
INSERT INTO `hov_admin_log` VALUES ('773', '5', '1', '192.168.1.104', '9', '1555722748');
INSERT INTO `hov_admin_log` VALUES ('774', '25', '1', '192.168.1.104', '修改管理员信息成功', '1555722824');
INSERT INTO `hov_admin_log` VALUES ('775', '4', '1', '192.168.1.104', '7', '1555722892');
INSERT INTO `hov_admin_log` VALUES ('776', '4', '1', '192.168.1.104', '8', '1555722906');
INSERT INTO `hov_admin_log` VALUES ('777', '5', '1', '192.168.1.104', '6', '1555722912');
INSERT INTO `hov_admin_log` VALUES ('778', '4', '1', '192.168.1.104', '3', '1555723013');
INSERT INTO `hov_admin_log` VALUES ('779', '5', '1', '192.168.1.104', '2', '1555723019');
INSERT INTO `hov_admin_log` VALUES ('780', '50', '1', '192.168.1.104', '', '1555814419');
INSERT INTO `hov_admin_log` VALUES ('781', '122', '1', '192.168.1.104', '修改游戏成功-25', '1555814452');
INSERT INTO `hov_admin_log` VALUES ('782', '122', '1', '192.168.1.104', '修改游戏成功-25', '1555814698');
INSERT INTO `hov_admin_log` VALUES ('783', '122', '1', '192.168.1.104', '修改游戏成功-25', '1555814840');
INSERT INTO `hov_admin_log` VALUES ('784', '122', '1', '192.168.1.104', '修改游戏成功-25', '1555814996');
INSERT INTO `hov_admin_log` VALUES ('785', '122', '1', '192.168.1.104', '修改游戏成功-25', '1555821321');
INSERT INTO `hov_admin_log` VALUES ('786', '122', '1', '192.168.1.104', '修改游戏成功-1', '1555831390');
INSERT INTO `hov_admin_log` VALUES ('787', '122', '1', '192.168.1.104', '修改游戏成功-1', '1555831606');
INSERT INTO `hov_admin_log` VALUES ('788', '122', '1', '192.168.1.104', '修改游戏成功-2', '1555831679');
INSERT INTO `hov_admin_log` VALUES ('789', '122', '1', '192.168.1.104', '修改游戏成功-3', '1555831704');
INSERT INTO `hov_admin_log` VALUES ('790', '122', '1', '192.168.1.104', '修改游戏成功-4', '1555831733');
INSERT INTO `hov_admin_log` VALUES ('791', '122', '1', '192.168.1.104', '修改游戏成功-6', '1555831759');
INSERT INTO `hov_admin_log` VALUES ('792', '122', '1', '192.168.1.104', '修改游戏成功-7', '1555831779');
INSERT INTO `hov_admin_log` VALUES ('793', '122', '1', '192.168.1.104', '修改游戏成功-8', '1555831817');
INSERT INTO `hov_admin_log` VALUES ('794', '122', '1', '192.168.1.104', '修改游戏成功-5', '1555831872');
INSERT INTO `hov_admin_log` VALUES ('795', '122', '1', '192.168.1.104', '修改游戏成功-19', '1555831969');
INSERT INTO `hov_admin_log` VALUES ('796', '122', '1', '192.168.1.104', '修改游戏成功-20', '1555831992');
INSERT INTO `hov_admin_log` VALUES ('797', '122', '1', '192.168.1.104', '修改游戏成功-20', '1555832005');
INSERT INTO `hov_admin_log` VALUES ('798', '122', '1', '192.168.1.104', '修改游戏成功-32', '1555832064');
INSERT INTO `hov_admin_log` VALUES ('799', '122', '1', '192.168.1.104', '修改游戏成功-9', '1555832104');
INSERT INTO `hov_admin_log` VALUES ('800', '122', '1', '192.168.1.104', '修改游戏成功-11', '1555832120');
INSERT INTO `hov_admin_log` VALUES ('801', '122', '1', '192.168.1.104', '修改游戏成功-10', '1555844956');
INSERT INTO `hov_admin_log` VALUES ('802', '122', '1', '192.168.1.104', '修改游戏成功-29', '1555844981');
INSERT INTO `hov_admin_log` VALUES ('803', '123', '1', '192.168.1.104', '删除游戏成功-30', '1555845012');
INSERT INTO `hov_admin_log` VALUES ('804', '123', '1', '192.168.1.104', '删除游戏成功-32', '1555845028');
INSERT INTO `hov_admin_log` VALUES ('805', '122', '1', '192.168.1.104', '修改游戏成功-37', '1555845053');
INSERT INTO `hov_admin_log` VALUES ('806', '122', '1', '192.168.1.104', '修改游戏成功-35', '1555845069');
INSERT INTO `hov_admin_log` VALUES ('807', '122', '1', '192.168.1.104', '修改游戏成功-36', '1555845087');
INSERT INTO `hov_admin_log` VALUES ('808', '122', '1', '192.168.1.104', '修改游戏成功-34', '1555845110');
INSERT INTO `hov_admin_log` VALUES ('809', '122', '1', '192.168.1.104', '修改游戏成功-38', '1555845124');
INSERT INTO `hov_admin_log` VALUES ('810', '122', '1', '192.168.1.104', '修改游戏成功-58', '1555845150');
INSERT INTO `hov_admin_log` VALUES ('811', '122', '1', '192.168.1.104', '修改游戏成功-33', '1555845167');
INSERT INTO `hov_admin_log` VALUES ('812', '122', '1', '192.168.1.104', '修改游戏成功-26', '1555845185');
INSERT INTO `hov_admin_log` VALUES ('813', '122', '1', '192.168.1.104', '修改游戏成功-25', '1555845201');
INSERT INTO `hov_admin_log` VALUES ('814', '122', '1', '192.168.1.104', '修改游戏成功-23', '1555845212');
INSERT INTO `hov_admin_log` VALUES ('815', '122', '1', '192.168.1.104', '修改游戏成功-22', '1555845224');
INSERT INTO `hov_admin_log` VALUES ('816', '122', '1', '192.168.1.104', '修改游戏成功-24', '1555845237');
INSERT INTO `hov_admin_log` VALUES ('817', '122', '1', '192.168.1.104', '修改游戏成功-27', '1555845274');
INSERT INTO `hov_admin_log` VALUES ('818', '123', '1', '192.168.1.104', '删除游戏成功-48', '1555845350');
INSERT INTO `hov_admin_log` VALUES ('819', '123', '1', '192.168.1.104', '删除游戏成功-49', '1555845360');
INSERT INTO `hov_admin_log` VALUES ('820', '123', '1', '192.168.1.104', '删除游戏成功-62', '1555845372');
INSERT INTO `hov_admin_log` VALUES ('821', '123', '1', '192.168.1.104', '删除游戏成功-61', '1555845382');
INSERT INTO `hov_admin_log` VALUES ('822', '123', '1', '192.168.1.104', '删除游戏成功-60', '1555845387');
INSERT INTO `hov_admin_log` VALUES ('823', '123', '1', '192.168.1.104', '删除游戏成功-59', '1555845392');
INSERT INTO `hov_admin_log` VALUES ('824', '123', '1', '192.168.1.104', '删除游戏成功-47', '1555845421');
INSERT INTO `hov_admin_log` VALUES ('825', '122', '1', '192.168.1.104', '修改游戏成功-29', '1555845435');
INSERT INTO `hov_admin_log` VALUES ('826', '122', '1', '192.168.1.104', '修改游戏成功-28', '1555845471');
INSERT INTO `hov_admin_log` VALUES ('827', '123', '1', '192.168.1.104', '删除游戏成功-51', '1555845490');
INSERT INTO `hov_admin_log` VALUES ('828', '123', '1', '192.168.1.104', '删除游戏成功-42', '1555845520');
INSERT INTO `hov_admin_log` VALUES ('829', '123', '1', '192.168.1.104', '删除游戏成功-43', '1555845526');
INSERT INTO `hov_admin_log` VALUES ('830', '123', '1', '192.168.1.104', '删除游戏成功-45', '1555845531');
INSERT INTO `hov_admin_log` VALUES ('831', '123', '1', '192.168.1.104', '删除游戏成功-44', '1555845537');
INSERT INTO `hov_admin_log` VALUES ('832', '123', '1', '192.168.1.104', '删除游戏成功-39', '1555845562');
INSERT INTO `hov_admin_log` VALUES ('833', '123', '1', '192.168.1.104', '删除游戏成功-40', '1555845568');
INSERT INTO `hov_admin_log` VALUES ('834', '123', '1', '192.168.1.104', '删除游戏成功-41', '1555845574');
INSERT INTO `hov_admin_log` VALUES ('835', '123', '1', '192.168.1.104', '删除游戏成功-46', '1555845580');
INSERT INTO `hov_admin_log` VALUES ('836', '122', '1', '192.168.1.104', '修改游戏成功-56', '1555845612');
INSERT INTO `hov_admin_log` VALUES ('837', '122', '1', '192.168.1.104', '修改游戏成功-54', '1555845632');
INSERT INTO `hov_admin_log` VALUES ('838', '122', '1', '192.168.1.104', '修改游戏成功-53', '1555845652');
INSERT INTO `hov_admin_log` VALUES ('839', '122', '1', '192.168.1.104', '修改游戏成功-52', '1555845671');
INSERT INTO `hov_admin_log` VALUES ('840', '122', '1', '192.168.1.104', '修改游戏成功-55', '1555845697');
INSERT INTO `hov_admin_log` VALUES ('841', '122', '1', '192.168.1.104', '修改游戏成功-57', '1555845731');
INSERT INTO `hov_admin_log` VALUES ('842', '122', '1', '192.168.1.104', '修改游戏成功-50', '1555845759');
INSERT INTO `hov_admin_log` VALUES ('843', '122', '1', '192.168.1.104', '修改游戏成功-16', '1555845777');
INSERT INTO `hov_admin_log` VALUES ('844', '122', '1', '192.168.1.104', '修改游戏成功-15', '1555845788');
INSERT INTO `hov_admin_log` VALUES ('845', '122', '1', '192.168.1.104', '修改游戏成功-13', '1555845808');
INSERT INTO `hov_admin_log` VALUES ('846', '122', '1', '192.168.1.104', '修改游戏成功-12', '1555845818');
INSERT INTO `hov_admin_log` VALUES ('847', '122', '1', '192.168.1.104', '修改游戏成功-14', '1555845829');
INSERT INTO `hov_admin_log` VALUES ('848', '122', '1', '192.168.1.104', '修改游戏成功-17', '1555845852');
INSERT INTO `hov_admin_log` VALUES ('849', '122', '1', '192.168.1.104', '修改游戏成功-18', '1555845869');
INSERT INTO `hov_admin_log` VALUES ('850', '122', '1', '192.168.1.104', '修改游戏成功-38', '1555845894');
INSERT INTO `hov_admin_log` VALUES ('851', '122', '1', '192.168.1.104', '修改游戏成功-21', '1555845929');
INSERT INTO `hov_admin_log` VALUES ('852', '122', '1', '192.168.1.104', '修改游戏成功-31', '1555845950');
INSERT INTO `hov_admin_log` VALUES ('853', '4', '1', '192.168.1.104', '124', '1555846816');
INSERT INTO `hov_admin_log` VALUES ('854', '122', '1', '192.168.1.104', '修改游戏成功-2', '1555849236');
INSERT INTO `hov_admin_log` VALUES ('855', '122', '1', '192.168.1.104', '修改游戏成功-1', '1555849355');
INSERT INTO `hov_admin_log` VALUES ('856', '122', '1', '192.168.1.104', '修改游戏成功-2', '1555849368');
INSERT INTO `hov_admin_log` VALUES ('857', '122', '1', '192.168.1.104', '修改游戏成功-2', '1555849378');
INSERT INTO `hov_admin_log` VALUES ('858', '122', '1', '192.168.1.104', '修改游戏成功-2', '1555849466');
INSERT INTO `hov_admin_log` VALUES ('859', '122', '1', '192.168.1.104', '修改游戏成功-3', '1555849476');
INSERT INTO `hov_admin_log` VALUES ('860', '122', '1', '192.168.1.104', '修改游戏成功-3', '1555849484');
INSERT INTO `hov_admin_log` VALUES ('861', '122', '1', '192.168.1.104', '修改游戏成功-3', '1555849511');
INSERT INTO `hov_admin_log` VALUES ('862', '122', '1', '192.168.1.104', '修改游戏成功-4', '1555849523');
INSERT INTO `hov_admin_log` VALUES ('863', '122', '1', '192.168.1.104', '修改游戏成功-6', '1555849540');
INSERT INTO `hov_admin_log` VALUES ('864', '122', '1', '192.168.1.104', '修改游戏成功-7', '1555849555');
INSERT INTO `hov_admin_log` VALUES ('865', '122', '1', '192.168.1.104', '修改游戏成功-8', '1555849564');
INSERT INTO `hov_admin_log` VALUES ('866', '122', '1', '192.168.1.104', '修改游戏成功-5', '1555849581');
INSERT INTO `hov_admin_log` VALUES ('867', '50', '1', '192.168.1.104', '', '1556031360');
INSERT INTO `hov_admin_log` VALUES ('868', '122', '1', '192.168.1.104', '修改游戏成功-1', '1556111053');
INSERT INTO `hov_admin_log` VALUES ('869', '122', '1', '192.168.1.104', '修改游戏成功-2', '1556111068');
INSERT INTO `hov_admin_log` VALUES ('870', '122', '1', '192.168.1.104', '修改游戏成功-1', '1556111129');
INSERT INTO `hov_admin_log` VALUES ('871', '122', '1', '192.168.1.104', '修改游戏成功-3', '1556111184');
INSERT INTO `hov_admin_log` VALUES ('872', '122', '1', '192.168.1.104', '修改游戏成功-6', '1556111190');
INSERT INTO `hov_admin_log` VALUES ('873', '122', '1', '192.168.1.104', '修改游戏成功-7', '1556111201');
INSERT INTO `hov_admin_log` VALUES ('874', '122', '1', '192.168.1.104', '修改游戏成功-8', '1556111294');
INSERT INTO `hov_admin_log` VALUES ('875', '122', '1', '192.168.1.104', '修改游戏成功-5', '1556111300');
INSERT INTO `hov_admin_log` VALUES ('876', '122', '1', '192.168.1.104', '修改游戏成功-4', '1556111309');
INSERT INTO `hov_admin_log` VALUES ('877', '50', '1', '192.168.1.100', '', '1556163197');
INSERT INTO `hov_admin_log` VALUES ('878', '114', '1', '192.168.1.100', '成功生成卡密', '1556163356');
INSERT INTO `hov_admin_log` VALUES ('879', '50', '1', '192.168.1.104', '', '1556200765');
INSERT INTO `hov_admin_log` VALUES ('880', '50', '1', '192.168.1.100', '', '1556247196');
INSERT INTO `hov_admin_log` VALUES ('881', '50', '1', '192.168.1.104', '', '1556279895');
INSERT INTO `hov_admin_log` VALUES ('882', '50', '1', '192.168.1.104', '', '1556368742');
INSERT INTO `hov_admin_log` VALUES ('883', '122', '1', '192.168.1.104', '修改游戏成功-1', '1556368786');
INSERT INTO `hov_admin_log` VALUES ('884', '122', '1', '192.168.1.104', '修改游戏成功-1', '1556369531');
INSERT INTO `hov_admin_log` VALUES ('885', '122', '1', '192.168.1.104', '修改游戏成功-1', '1556369838');
INSERT INTO `hov_admin_log` VALUES ('886', '122', '1', '192.168.1.104', '修改游戏成功-1', '1556370081');
INSERT INTO `hov_admin_log` VALUES ('887', '122', '1', '192.168.1.104', '修改游戏成功-2', '1556451907');
INSERT INTO `hov_admin_log` VALUES ('888', '122', '1', '192.168.1.104', '修改游戏成功-2', '1556451914');

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
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of hov_admin_menu
-- ----------------------------
INSERT INTO `hov_admin_menu` VALUES ('1', '系统', '', '', '', '', '系统设置。', '1', '2', '0', '0', '1517015748', 'fa-cog', '1', '0');
INSERT INTO `hov_admin_menu` VALUES ('3', '菜单设置', 'admin', 'menu', 'index', '', '系统菜单管理', '1', '2', '1', '0', '1555723013', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('4', '新增/修改系统菜单', 'admin', 'menu', 'publish', '', '新增/修改系统菜单.', '2', '1', '3', '1516948769', '1516948769', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('5', '删除系统菜单', 'admin', 'menu', 'delete', '', '删除系统菜单。', '2', '1', '3', '1516948857', '1516948857', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('7', '管理员信息', 'admin', 'admin', 'personal', '', '个人信息修改。', '1', '1', '22', '1516949435', '1555722892', 'fa-user', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('8', '修改密码', 'admin', 'admin', 'editpassword', '', '管理员修改个人密码。', '1', '1', '22', '1516949702', '1555722906', 'fa-unlock-alt', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('10', '网站设置', 'admin', 'webconfig', 'index', '', '网站相关设置首页。', '1', '2', '1', '1516949994', '1555722677', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('11', '修改网站设置', 'admin', 'webconfig', 'publish', '', '修改网站设置。', '2', '1', '10', '1516950047', '1516950047', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('12', '邮件设置', 'admin', 'emailconfig', 'index', '', '邮件配置首页。', '1', '2', '1', '1516950129', '1555722693', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('13', '修改邮件设置', 'admin', 'emailconfig', 'publish', '', '修改邮件设置。', '2', '1', '12', '1516950215', '1516950215', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('14', '发送测试邮件', 'admin', 'emailconfig', 'mailto', '', '发送测试邮件。', '2', '1', '12', '1516950295', '1516950295', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('15', '短信设置', 'admin', 'smsconfig', 'index', '', '短信设置首页。', '1', '2', '1', '1516950394', '1555722707', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('16', '修改短信设置', 'admin', 'smsconfig', 'publish', '', '修改短信设置。', '2', '1', '15', '1516950447', '1516950447', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('17', '发送测试短信', 'admin', 'smsconfig', 'smsto', '', '发送测试短信。', '2', '1', '15', '1516950483', '1516950483', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('18', 'URL 设置', 'admin', 'urlsconfig', 'index', '', 'url 设置。', '1', '2', '1', '1516950738', '1555722723', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('19', '新增/修改url设置', 'admin', 'urlsconfig', 'publish', '', '新增/修改url设置。', '2', '1', '18', '1516950850', '1516950850', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('20', '启用/禁用url美化', 'admin', 'urlsconfig', 'status', '', '启用/禁用url美化。', '2', '1', '18', '1516950909', '1516950909', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('21', ' 删除url美化规则', 'admin', 'urlsconfig', 'delete', '', ' 删除url美化规则。', '2', '1', '18', '1516950941', '1516950941', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('22', '后台', '', '', '', '', '', '1', '2', '0', '1516950991', '1553139154', 'fa-tv', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('24', '管理员', 'admin', 'admin', 'index', '', '系统管理员列表。', '1', '2', '22', '1516951163', '1555638859', 'fa-user', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('25', '新增/修改管理员', 'admin', 'admin', 'publish', '', '新增/修改系统管理员。', '2', '1', '24', '1516951224', '1516951224', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('26', '删除管理员', 'admin', 'admin', 'delete', '', '删除管理员。', '2', '1', '24', '1516951253', '1516951253', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('27', '权限组', 'admin', 'admin', 'admincate', '', '权限分组。', '1', '2', '22', '1516951353', '1555638899', 'fa-dot-circle-o', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('28', '新增/修改权限组', 'admin', 'admin', 'admincatepublish', '', '新增/修改权限组。', '2', '1', '27', '1516951483', '1516951483', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('29', '删除权限组', 'admin', 'admin', 'admincatedelete', '', '删除权限组。', '2', '1', '27', '1516951515', '1516951515', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('30', '操作日志', 'admin', 'admin', 'log', '', '系统管理员操作日志。', '1', '2', '22', '1516951754', '1555638930', 'fa-pencil', '0', '0');
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
INSERT INTO `hov_admin_menu` VALUES ('51', '系统菜单排序', 'admin', 'menu', 'orders', '', '系统菜单排序。', '2', '1', '3', '1517562047', '1517562047', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('52', '签到设置', 'admin', 'signinconfig', 'index', '', '签到设置', '1', '2', '1', '1552443044', '1555722742', '', '1', '0');
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
INSERT INTO `hov_admin_menu` VALUES ('102', '发站内信', 'admin', 'usermsg', 'send', '', '', '1', '2', '101', '1553051566', '1553925317', 'fa-send-o', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('103', '发送历史', 'admin', 'usermsg', 'index', '', '', '1', '2', '101', '1553051827', '1553925338', 'fa-paw', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('104', '删除站内信', 'admin', 'usermsg', 'delete', '', '', '2', '1', '101', '1553055683', '1553925351', '', '0', '0');
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
INSERT INTO `hov_admin_menu` VALUES ('118', '充值管理', 'admin', 'agent', 'charge', '', '', '1', '2', '105', '1553231643', '1555388522', 'fa-download', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('119', '新增/修改代理', 'admin', 'agent', 'publish', '', '', '2', '1', '116', '1553241725', '1553241725', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('120', '删除代理', 'admin', 'agent', 'delete', '', '', '2', '1', '116', '1553241824', '1553241824', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('121', '游戏开关', 'admin', 'game', 'index', '', '', '1', '2', '106', '1553309362', '1553309362', 'fa-gamepad', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('122', '新增/修改游戏', 'admin', 'game', 'publish', '', '', '2', '1', '106', '1553312314', '1553312314', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('123', '删除游戏', 'admin', 'game', 'delete', '', '', '2', '1', '106', '1553312355', '1553312355', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('124', '游戏开关', 'admin', 'game', 'onoff', '', '', '2', '1', '106', '1553315191', '1555846816', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('125', '游戏配置', 'admin', 'game', 'setup', '', '', '2', '1', '106', '1553329792', '1553329792', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('126', '游戏管理', 'admin', 'game', 'manage', '', '', '2', '1', '106', '1553329824', '1553329824', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('127', '判断游戏表存在', 'admin', 'game', 'istable', '', '', '2', '1', '106', '1553408992', '1553408992', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('128', '创建游戏表', 'admin', 'game', 'createtable', '', '', '2', '1', '106', '1553415373', '1553415373', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('129', '模拟会员登录', 'admin', 'user', 'login', '', '模拟会员登录', '2', '1', '88', '1554360642', '1554360642', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('130', '确认打款', 'admin', 'agent', 'dealed', '', '打款完毕（到代理）', '2', '1', '117', '1555342304', '1555342304', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('131', '拒绝提现', 'admin', 'agent', 'rejected', '', '拒绝代理提现', '2', '1', '117', '1555342355', '1555342355', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('132', '其他功能', 'admin', 'user', 'other', '', '', '1', '2', '86', '1555427053', '1555427133', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('133', '广告管理', 'admin', 'ad', 'index', '', '', '1', '2', '1', '1555556708', '1555558152', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('134', '广告删除', 'admin', 'ad', 'delete', '', '', '2', '1', '133', '1555560682', '1555560682', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('135', '广告发布', 'admin', 'ad', 'publish', '', '', '2', '1', '133', '1555560935', '1555560935', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('136', '图片删除', 'admin', 'ad', 'deleteimg', '', '', '2', '1', '133', '1555593564', '1555593564', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('137', '砸蛋设置', 'admin', 'smashegg', 'index', '', '', '1', '2', '1', '1555638431', '1555638714', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('138', '砸蛋删除', 'admin', 'smashegg', 'delete', '', '', '2', '1', '137', '1555638750', '1555638750', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('139', '砸蛋新增修改', 'admin', 'smashegg', 'publish', '', '', '2', '1', '137', '1555638786', '1555638786', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('140', '抽奖设置', 'admin', 'drawlottery', 'index', '', '', '1', '2', '1', '1555657669', '1555657669', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('141', '抽奖删除', 'admin', 'drawlottery', 'delete', '', '', '2', '1', '140', '1555657714', '1555657714', '', '0', '0');
INSERT INTO `hov_admin_menu` VALUES ('142', '抽奖新增/修改', 'admin', 'drawlottery', 'publish', '', '', '2', '1', '140', '1555657750', '1555657750', '', '0', '0');

-- ----------------------------
-- Table structure for `hov_agent`
-- ----------------------------
DROP TABLE IF EXISTS `hov_agent`;
CREATE TABLE `hov_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_cate_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `qq` char(13) DEFAULT NULL,
  `advance` decimal(10,2) DEFAULT '0.00' COMMENT '铺货量',
  `stock` decimal(10,2) DEFAULT '0.00',
  `discount` decimal(5,2) DEFAULT '1.00' COMMENT '制卡、代充折扣',
  `reclaim_reward` decimal(5,2) DEFAULT '0.00' COMMENT '收卡奖励比例(百分比%)',
  `user_id` int(11) DEFAULT NULL,
  `is_show` tinyint(1) DEFAULT '1',
  `is_freeze` tinyint(1) DEFAULT '0',
  `thumb` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_agent
-- ----------------------------
INSERT INTO `hov_agent` VALUES ('10000', '0', '阿尔法', '1313.88', '234598983', '2333.00', '211.00', '0.00', '0.00', '0', '1', '1', '30', '1553608821', '1555312783');
INSERT INTO `hov_agent` VALUES ('10001', '0', '龙发点卡', '812.00', '4543566', '12.00', '2.00', '0.98', '2.00', '10', '1', '0', '31', '1553675514', '1555312775');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_agent_cate
-- ----------------------------
INSERT INTO `hov_agent_cate` VALUES ('5', '安徽省', '', '', '1553157411', '1553157673', '0');
INSERT INTO `hov_agent_cate` VALUES ('6', '合肥市', '', '', '1553157436', '1553157679', '5');
INSERT INTO `hov_agent_cate` VALUES ('7', '包河区', '', '', '1553157449', '1553157690', '6');
INSERT INTO `hov_agent_cate` VALUES ('9', '江西省', '', '', '1553261427', '1553261427', '0');
INSERT INTO `hov_agent_cate` VALUES ('10', '南昌市', '', '', '1553261438', '1553261438', '9');
INSERT INTO `hov_agent_cate` VALUES ('11', '东湖区', '', '', '1553261477', '1553261477', '10');
INSERT INTO `hov_agent_cate` VALUES ('12', '西湖区', '', '', '1553261484', '1553261484', '10');

-- ----------------------------
-- Table structure for `hov_agent_deposit`
-- ----------------------------
DROP TABLE IF EXISTS `hov_agent_deposit`;
CREATE TABLE `hov_agent_deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '3：提现取消，2：提现成功，1：待审核，4：提现失败（后台拒绝）',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_agent_deposit
-- ----------------------------
INSERT INTO `hov_agent_deposit` VALUES ('6', '10001', '9.00', '3', '1555332513', '1555332513');
INSERT INTO `hov_agent_deposit` VALUES ('7', '10001', '10.00', '3', '1555333076', '1555333076');
INSERT INTO `hov_agent_deposit` VALUES ('8', '10001', '19.00', '3', '1555335028', '1555335028');
INSERT INTO `hov_agent_deposit` VALUES ('9', '10001', '100.00', '2', '1555335391', '1555335391');
INSERT INTO `hov_agent_deposit` VALUES ('10', '10001', '10.00', '2', '1555338352', '1555338352');
INSERT INTO `hov_agent_deposit` VALUES ('11', '10001', '10.00', '4', '1555338688', '1555338688');
INSERT INTO `hov_agent_deposit` VALUES ('12', '10001', '8.96', '4', '1555340499', '1555340499');
INSERT INTO `hov_agent_deposit` VALUES ('13', '10001', '0.04', '4', '1555340551', '1555340551');

-- ----------------------------
-- Table structure for `hov_agent_log`
-- ----------------------------
DROP TABLE IF EXISTS `hov_agent_log`;
CREATE TABLE `hov_agent_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) DEFAULT NULL,
  `reclaim_money` decimal(11,2) DEFAULT '0.00' COMMENT '回收金额',
  `charge_money` decimal(11,2) DEFAULT '0.00' COMMENT '代充金额',
  `sale_money` decimal(11,2) DEFAULT '0.00' COMMENT '售卡金额',
  `deposit_money` decimal(11,2) DEFAULT '0.00' COMMENT '提现金额',
  `transfer_money` decimal(11,2) DEFAULT '0.00' COMMENT '代理互转金额',
  `balance` decimal(11,2) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL COMMENT '1：代理代充2：代理收卡3：代理售卡4：代理制卡,5:代充撤回,6：提现，7：提现取消',
  `ip` varchar(40) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0' COMMENT '主要记录代充和代充撤回的标志位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_agent_log
-- ----------------------------
INSERT INTO `hov_agent_log` VALUES ('26', '10001', '0.00', '-98.00', '0.00', null, null, '856.40', '1', '192.168.1.102', '1555119094', '2019-04-13', '10', '2');
INSERT INTO `hov_agent_log` VALUES ('27', '10001', '0.00', '98.00', '0.00', null, null, '954.40', '5', '192.168.1.102', '1555119140', '2019-04-13', '10', '0');
INSERT INTO `hov_agent_log` VALUES ('28', '10001', '100.00', '0.00', '0.00', null, null, '1054.40', '2', '192.168.1.102', '1555121988', '2019-04-13', 'd10LVPT61SCDYA3GQJH|10', '0');
INSERT INTO `hov_agent_log` VALUES ('29', '10001', '0.00', '0.00', '0.00', '-10.00', null, '990.00', '6', '192.168.1.104', '1555333076', '2019-04-15', '提现', '0');
INSERT INTO `hov_agent_log` VALUES ('30', '10001', '0.00', '0.00', '0.00', '10.00', null, '1000.00', '7', '192.168.1.104', '1555334606', '2019-04-15', '提现取消', '0');
INSERT INTO `hov_agent_log` VALUES ('31', '10001', '0.00', '0.00', '0.00', '9.00', null, '1009.00', '7', '192.168.1.104', '1555334853', '2019-04-15', '提现取消', '0');
INSERT INTO `hov_agent_log` VALUES ('32', '10001', '0.00', '0.00', '0.00', '0.00', null, '990.00', '6', '192.168.1.104', '1555335028', '2019-04-15', '提现', '0');
INSERT INTO `hov_agent_log` VALUES ('33', '10001', '0.00', '0.00', '0.00', '19.00', null, '1009.00', '7', '192.168.1.104', '1555335340', '2019-04-15', '提现取消', '0');
INSERT INTO `hov_agent_log` VALUES ('34', '10001', '0.00', '0.00', '0.00', '-100.00', null, '909.00', '6', '192.168.1.104', '1555335391', '2019-04-15', '提现', '0');
INSERT INTO `hov_agent_log` VALUES ('35', '10001', '0.00', '0.00', '0.00', '-10.00', null, '899.00', '6', '192.168.1.104', '1555338352', '2019-04-15', '提现', '0');
INSERT INTO `hov_agent_log` VALUES ('36', '10001', '0.00', '0.00', '0.00', '-10.00', null, '889.00', '6', '192.168.1.104', '1555338688', '2019-04-15', '提现', '0');
INSERT INTO `hov_agent_log` VALUES ('37', '10001', '0.00', '0.00', '0.00', '-8.96', null, '880.04', '6', '192.168.1.104', '1555340499', '2019-04-15', '提现', '0');
INSERT INTO `hov_agent_log` VALUES ('38', '10001', '0.00', '0.00', '0.00', '-0.04', null, '880.00', '6', '192.168.1.104', '1555340551', '2019-04-15', '提现', '0');
INSERT INTO `hov_agent_log` VALUES ('39', '10001', '0.00', '-98.00', '0.00', '0.00', null, '827.88', '1', '192.168.1.100', '1555388271', '2019-04-16', '10', '2');
INSERT INTO `hov_agent_log` VALUES ('40', '10001', '0.00', '98.00', '0.00', '0.00', null, '925.88', '5', '192.168.1.100', '1555388305', '2019-04-16', '10', '0');
INSERT INTO `hov_agent_log` VALUES ('41', '10001', '0.00', '0.00', '0.00', '0.00', '-13.88', '912.00', '8', '192.168.1.100', '1555486270', '2019-04-17', '代理10001转给10000', '0');
INSERT INTO `hov_agent_log` VALUES ('42', '10000', '0.00', '0.00', '0.00', '0.00', '13.88', '1213.88', '8', '192.168.1.100', '1555486270', '2019-04-17', '代理10001转给10000', '0');
INSERT INTO `hov_agent_log` VALUES ('43', '10001', '0.00', '0.00', '0.00', '0.00', '-100.00', '812.00', '8', '192.168.1.100', '1555486652', '2019-04-17', '代理10001转给10000', '0');
INSERT INTO `hov_agent_log` VALUES ('44', '10000', '0.00', '0.00', '0.00', '0.00', '100.00', '1313.88', '8', '192.168.1.100', '1555486652', '2019-04-17', '代理10001转给10000', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='活动表';

-- ----------------------------
-- Records of hov_article
-- ----------------------------
INSERT INTO `hov_article` VALUES ('6', '充值送VIP', '', '彩豆28送免手续帐号活动！代理99折收卡！', '7', '22', '<p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">代理99折收卡！</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">满足以下条件之一，即可次日向客服领取</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">1、单笔充值达到58元。</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">2、单日累计充值达到88元。</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">3、单日盈利达到188元。</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">4，成功推广五名免手续费下线会员。</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">5，排行榜每日前10名。</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">满足条件后，次日向客服领取。</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">拥有贵宾卡即可享受原价兑换奖品</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">网站在线客服&nbsp; &nbsp;QQ红包群：2577000</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">caidou288.com &nbsp; &nbsp;【2017.04.07 宣】</span></strong></p><p><br/></p>', '1', '1551542400', '1571932800', '1553518212', '1553518212', '1', '1', '0');
INSERT INTO `hov_article` VALUES ('7', '群内红包领到手软', '', '让红包再飞一会！QQ群：2577000', '7', '23', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">【</strong></span><strong style=\"margin: 0px; padding: 0px; color: rgb(255, 0, 0);\">让</strong><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">红包再飞一会】</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\"><br/></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">参加对象：所有认证会员</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\"><br/></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">查看活动详情，平台每天不定时，不定期。</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\"><br/></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">随机在群里发拼手气红包，先到先到，抢完为止。</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\"><br/></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">拼手气红包金额随机，有大有小，欢迎玩家加群分享快乐。</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\"><br/></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">信誉网站【乐豆28】</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\"><br/></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">客服QQ：2577000</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\"><br/></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">ledou288.com</strong></span><strong style=\"margin: 0px; padding: 0px; color: rgb(255, 0, 0);\">【2017-04-07宣】</strong></p><p><br/></p>', '1', '1552147200', '1553875200', '1553518591', '1553518591', '1', '1', '0');
INSERT INTO `hov_article` VALUES ('8', '亏损奖励送不停', '', '彩豆28亏损次日返利2%返利特惠，返利返不停！', '7', '24', '<p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">彩豆28亏损次日返利2%</strong></span></p><p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\"><br/></strong></span></p><p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">返利规则</strong></span></p><p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\"><br/></strong></span></p><p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">次日返利：</strong></span></p><p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">次日返利按照您当天的亏损总和的2%来计算次日在会员中心领取。</strong></span></p><p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">【会员中心-亏损返利领取】</strong></span></p><p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\"><br/></strong></span></p><p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">caidou288.com【2017.04.05宣】</strong></span><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">&nbsp;</span>&nbsp;</strong></p><p><br/></p>', '1', '1551628800', '1585065600', '1553518654', '1553518654', '1', '1', '0');
INSERT INTO `hov_article` VALUES ('9', '福利越玩越大上排行榜奖励多', '', '【实力信誉】彩豆28冲刺排行榜用能力你就来！', '7', '25', '<p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">【实力信誉】彩豆28现推出每日盈利排行</strong></span></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">请进入牛人榜页面查看</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">只要你够实力上榜，我们必送上丰厚奖励，来，等你来战！</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">为了答谢亲们对彩豆28的支持 ，乐豆28自4月7日起提升牛人榜奖金！</strong></span></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">牛人榜上榜名次增加到前10名，让更多的亲们上榜秀实力，欢迎大家争做牛人！</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">caidou288.com【2017.04.05宣】&nbsp;</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px\"></span></strong></p><p><br/></p>', '1', '1551542400', '1558713600', '1553518801', '1553518801', '1', '1', '0');
INSERT INTO `hov_article` VALUES ('10', '推广下线奖励拿到爆', '', '推广下线奖励拿到爆！！！', '7', '26', '<p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">推广下线奖励拿到爆</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px; color: rgb(255, 0, 0);\">下线升级您也有奖励拿爽爆了！</strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">乐豆28推出下线升级也有金币福利！</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">网站长期回馈推广用户，人人都是推广员，推广下线充值，可以获得2%的推广收益提成！</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">信誉为上，希望大家可以在乐豆28有一个非常愉快的旅程，给乐豆28一份期待，乐豆送给您一份惊喜！</span></strong><br/></p><p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">ledou28.com</strong></span></p><p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">【2017.04.06 宣】</strong></span></p><p><br/></p>', '1', '1551628800', '1567094400', '1553518861', '1553518861', '1', '1', '0');
INSERT INTO `hov_article` VALUES ('11', '首充奖励尽情领', '', '彩豆28为了反馈玩家特推出每日首冲就送的活动！抽奖活动依然在，顾客至上，信誉第一！', '7', '27', '<p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\">首冲返利&nbsp;</strong></p><p><strong style=\"margin: 0px; padding: 0px;\">【www.caidou28.com】&nbsp;</strong></p><p><strong style=\"margin: 0px; padding: 0px;\">&nbsp; 彩豆28也是推出了非常难得出充值返利活动，活动期间，玩家可以获得每天首次单笔充值金额的0.5000%返利。作为充值返利，不设上限，也不设下限，所以大户玩家，完全可以多充多得！次日领取返利！这是彩豆28极少举行的充值返利活动。</strong></p><p><strong style=\"margin: 0px; padding: 0px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;比起活动，我们更加注重的应该是网站的信誉和稳定，彩豆28作为业内大站，网站的实力和信誉都是大家有目共睹的！所以这个站点到现在为止，单单靠网站的口碑，在玩家群体中，就有着非常多的忠实粉丝！</strong></p><p><strong style=\"margin: 0px; padding: 0px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ，这个站点必定会有更大的发展，喜欢返利活动的玩家可以多多关注一下彩豆28，这个站点大额游戏绝对没有任何问题，所以大家都是可以放心游戏的！彩豆28在2017中，相信会有更大的成长！</strong></p><p><strong style=\"margin: 0px; padding: 0px;\">充值有礼送抽奖活动</strong></p><p><strong style=\"margin: 0px; padding: 0px;\">【www.caidou28.com】</strong></p><p></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">现在凡单笔充值满 200,000 金豆 可获得1次抽奖机会，抽取的金币直接打入您的帐户中。</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">注意：充值金额不可累积，次数可以累积。</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">（例：充值 200,000 金豆 获得1次抽奖机会，再充 200,000 金豆 再获得1次抽奖机会，但是单笔充值 600,000 金豆获得3次抽奖机会）</span></strong></p><p><span style=\"color:#ff0000\"><strong style=\"margin: 0px; padding: 0px;\">彩豆</strong></span><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">28每天不定时，不定期 随机在群里发拼手气红包，先到先到，抢完为止，拼手气红包金额随机 有大有小，欢迎玩家加群分享快乐，QQ群号：2577000</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">caidou28.com</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">&nbsp; &nbsp;【2017-04-06宣】 &nbsp;</span></strong>&nbsp;</p><p><br/></p>', '1', '1552320000', '1564070400', '1553518961', '1553518961', '1', '1', '0');
INSERT INTO `hov_article` VALUES ('12', '红包来啦', '', '彩豆28红包来了！', '7', '28', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">彩豆28红包来了</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">群内活动每天发QQ群：2577000</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">站内红包天天发网址：www.caidou288.com</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">caidou288.com</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(84, 84, 84); font-family: &quot;Microsoft YaHei&quot;, Arial, Verdana, sans-serif, &quot;Segoe UI&quot;, Tahoma; font-size: 14px; white-space: normal; text-align: center;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">【2017.04.06宣】</span></strong></p><p><br/></p>', '1', '1552233600', '1553875200', '1553519043', '1553519043', '1', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_article_cate
-- ----------------------------
INSERT INTO `hov_article_cate` VALUES ('7', '活动分类1', '', '', '1553517920', '1553517920', '0');

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
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '审核者id',
  `audit_time` int(11) NOT NULL COMMENT '审核时间',
  `use` varchar(200) DEFAULT NULL COMMENT '用处',
  `download` int(11) NOT NULL DEFAULT '0' COMMENT '下载量',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `filename` (`filename`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';

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
INSERT INTO `hov_attachment` VALUES ('21', 'admin', '357c152455be9c044d93cd115dd088ed.jpg', '\\uploads\\admin\\prize_thumb\\20190322\\357c152455be9c044d93cd115dd088ed.jpg', '51653', 'jpg', '1', '192.168.1.102', '1', '1553267657', '1', '1553267657', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('22', 'admin', '17bda0b655f6dfdad415ae94d1d3598d.jpg', '\\uploads\\admin\\article_thumb\\20190325\\17bda0b655f6dfdad415ae94d1d3598d.jpg', '78321', 'jpg', '1', '192.168.1.102', '1', '1553518169', '1', '1553518169', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('23', 'admin', 'd401eb3f5a80a88f1d088ae054ad0ae4.jpg', '\\uploads\\admin\\article_thumb\\20190325\\d401eb3f5a80a88f1d088ae054ad0ae4.jpg', '49335', 'jpg', '1', '192.168.1.102', '1', '1553518589', '1', '1553518589', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('24', 'admin', '803537d381058bea3685c3f64318d99d.jpg', '\\uploads\\admin\\article_thumb\\20190325\\803537d381058bea3685c3f64318d99d.jpg', '70305', 'jpg', '1', '192.168.1.102', '1', '1553518642', '1', '1553518642', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('25', 'admin', '5a57f615373d65da638a44771e6556dd.jpg', '\\uploads\\admin\\article_thumb\\20190325\\5a57f615373d65da638a44771e6556dd.jpg', '58663', 'jpg', '1', '192.168.1.102', '1', '1553518766', '1', '1553518766', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('26', 'admin', '128b97aaddd57488cae4ab03eb68ddec.jpg', '\\uploads\\admin\\article_thumb\\20190325\\128b97aaddd57488cae4ab03eb68ddec.jpg', '149147', 'jpg', '1', '192.168.1.102', '1', '1553518846', '1', '1553518846', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('27', 'admin', '1c4f165e319f5bbe01afe5648b426b6c.jpg', '\\uploads\\admin\\article_thumb\\20190325\\1c4f165e319f5bbe01afe5648b426b6c.jpg', '99585', 'jpg', '1', '192.168.1.102', '1', '1553518952', '1', '1553518952', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('28', 'admin', 'b7cac549076f333b2860e3b01485e3ae.jpg', '\\uploads\\admin\\article_thumb\\20190325\\b7cac549076f333b2860e3b01485e3ae.jpg', '98893', 'jpg', '1', '192.168.1.102', '1', '1553519037', '1', '1553519037', 'article_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('29', 'admin', 'ee5f6c68e5ce35f26985c809bffe46db.jpg', '\\uploads\\admin\\prize_thumb\\20190326\\ee5f6c68e5ce35f26985c809bffe46db.jpg', '51653', 'jpg', '1', '192.168.1.102', '1', '1553608719', '1', '1553608719', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('30', 'admin', 'c25c6f275892eb06928e40de636232eb.jpg', '\\uploads\\admin\\prize_thumb\\20190326\\c25c6f275892eb06928e40de636232eb.jpg', '51653', 'jpg', '1', '192.168.1.102', '1', '1553608818', '1', '1553608818', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('31', 'admin', '9d898ed29b2133d0aebe6b65516a9902.jpg', '\\uploads\\admin\\prize_thumb\\20190327\\9d898ed29b2133d0aebe6b65516a9902.jpg', '47615', 'jpg', '1', '192.168.1.107', '1', '1553675512', '1', '1553675512', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('32', 'admin', '8ae61ef4660a7d56c20eda1f5237523a.jpg', '\\uploads\\admin\\prize_thumb\\20190328\\8ae61ef4660a7d56c20eda1f5237523a.jpg', '51030', 'jpg', '1', '192.168.1.107', '1', '1553762894', '1', '1553762894', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('33', 'admin', 'cc7d2e09ac19a03a25f7bb1546bc2cfb.jpg', '\\uploads\\admin\\prize_thumb\\20190328\\cc7d2e09ac19a03a25f7bb1546bc2cfb.jpg', '79975', 'jpg', '1', '192.168.1.101', '1', '1553776657', '1', '1553776657', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('34', 'admin', '1e61431b2b5de8709885a2d14084c9af.jpg', '\\uploads\\admin\\prize_thumb\\20190328\\1e61431b2b5de8709885a2d14084c9af.jpg', '78825', 'jpg', '1', '192.168.1.101', '1', '1553776719', '1', '1553776719', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('35', 'admin', '0405ef6b1eb0c05eb06794e47f8bd1fe.jpg', '\\uploads\\admin\\prize_thumb\\20190328\\0405ef6b1eb0c05eb06794e47f8bd1fe.jpg', '80044', 'jpg', '1', '192.168.1.101', '1', '1553776750', '1', '1553776750', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('36', 'admin', 'a57caf2a32265b3f66dbca818a0b7f09.jpg', '\\uploads\\admin\\prize_thumb\\20190328\\a57caf2a32265b3f66dbca818a0b7f09.jpg', '78400', 'jpg', '1', '192.168.1.101', '1', '1553776765', '1', '1553776765', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('37', 'admin', '051440617a1d23002aa2d43a4a60142d.jpg', '\\uploads\\admin\\prize_thumb\\20190328\\051440617a1d23002aa2d43a4a60142d.jpg', '78400', 'jpg', '1', '192.168.1.101', '1', '1553776768', '1', '1553776768', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('38', 'admin', 'a435be7595bf22cf080ec6d549cf52dd.jpg', '\\uploads\\admin\\prize_thumb\\20190328\\a435be7595bf22cf080ec6d549cf52dd.jpg', '80044', 'jpg', '1', '192.168.1.101', '1', '1553776809', '1', '1553776809', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('39', 'admin', '43483d311f2b79cd577786059fe82106.jpg', '\\uploads\\admin\\prize_thumb\\20190328\\43483d311f2b79cd577786059fe82106.jpg', '79385', 'jpg', '1', '192.168.1.101', '1', '1553776869', '1', '1553776869', 'prize_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('40', 'admin', 'caf5837c4665a50aaa93353a6645b3bb.jpg', '\\uploads\\admin\\user_thumb\\20190330\\caf5837c4665a50aaa93353a6645b3bb.jpg', '53872', 'jpg', '1', '192.168.1.101', '1', '1553948092', '1', '1553948092', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('41', 'admin', '28bc9c51784a1c110eca7655f039db03.jpg', '\\uploads\\admin\\user_thumb\\20190330\\28bc9c51784a1c110eca7655f039db03.jpg', '117591', 'jpg', '0', '192.168.1.101', '0', '1553949714', '0', '0', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('42', 'admin', 'caf837cff6452c88b01bb3eb42efeaf6.jpg', '\\uploads\\admin\\user_thumb\\20190330\\caf837cff6452c88b01bb3eb42efeaf6.jpg', '117591', 'jpg', '0', '192.168.1.101', '0', '1553949719', '0', '0', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('43', 'admin', '6b0e245c8f061c8ddfea7af9877bb764.jpg', '\\uploads\\admin\\user_thumb\\20190330\\6b0e245c8f061c8ddfea7af9877bb764.jpg', '117591', 'jpg', '0', '192.168.1.101', '0', '1553949807', '0', '0', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('44', 'admin', '29272d99f165cf58f0afede17d979c20.jpg', '\\uploads\\admin\\user_thumb\\20190330\\29272d99f165cf58f0afede17d979c20.jpg', '117591', 'jpg', '0', '192.168.1.101', '0', '1553949941', '0', '0', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('45', 'admin', 'e3605f9a1d5c989cb409d0595e926fff.jpg', '\\uploads\\admin\\user_thumb\\20190330\\e3605f9a1d5c989cb409d0595e926fff.jpg', '117591', 'jpg', '0', '192.168.1.101', '0', '1553950108', '0', '0', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('46', 'front', '12dc568c6fa0c2c3a193baffe51d2e06.jpg', '\\uploads\\front\\user_thumb\\20190330\\12dc568c6fa0c2c3a193baffe51d2e06.jpg', '117591', 'jpg', '0', '192.168.1.101', '0', '1553950211', '0', '0', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('47', 'front', 'dae06916e8c40f8cf4aa6edf98306fe0.jpg', '\\uploads\\front\\user_thumb\\20190330\\dae06916e8c40f8cf4aa6edf98306fe0.jpg', '38862', 'jpg', '0', '192.168.1.101', '0', '1553950706', '0', '0', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('48', 'front', 'd4df918757c744647da5cdad4bec5b71.jpg', '\\uploads\\front\\user_thumb\\20190330\\d4df918757c744647da5cdad4bec5b71.jpg', '57848', 'jpg', '0', '192.168.1.101', '0', '1553950887', '0', '0', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('49', 'front', 'e8ca106d500b4595f99f8e6dbdb94b02.jpg', '\\uploads\\front\\user_thumb\\20190330\\e8ca106d500b4595f99f8e6dbdb94b02.jpg', '51066', 'jpg', '0', '192.168.1.101', '0', '1553950932', '0', '0', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('50', 'front', 'f107951a181f00b1f013ee6e1785eca7.jpg', '\\uploads\\front\\user_thumb\\20190330\\f107951a181f00b1f013ee6e1785eca7.jpg', '46742', 'jpg', '0', '192.168.1.101', '1', '1553952608', '0', '1553952761', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('51', 'admin', 'b83303c3a2e7018aacf519e5979ed977.png', '\\uploads\\admin\\user_thumb\\20190409\\b83303c3a2e7018aacf519e5979ed977.png', '232267', 'png', '1', '192.168.1.107', '1', '1554775691', '1', '1554775691', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('52', 'front', '1a4434647a5f5fa60c0b396b4cf62dc1.jpg', '\\uploads\\front\\user_thumb\\20190418\\1a4434647a5f5fa60c0b396b4cf62dc1.jpg', '134483', 'jpg', '0', '192.168.1.100', '1', '1555556224', '0', '1555556278', 'user_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('53', 'admin', '3eee9be28af1554ffe795d563eedf799.gif', '\\uploads\\admin\\ad_thumb\\20190418\\3eee9be28af1554ffe795d563eedf799.gif', '17946', 'gif', '1', '192.168.1.100', '1', '1555577968', '1', '1555577968', 'ad_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('54', 'admin', '1081a3f95017d607a24014fcc00ba2b5.jpg', '\\uploads\\admin\\ad_thumb\\20190418\\1081a3f95017d607a24014fcc00ba2b5.jpg', '9495', 'jpg', '1', '192.168.1.100', '1', '1555577988', '1', '1555577988', 'ad_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('55', 'admin', 'faa2fbe28e4d06bfb211b96ae4d64c70.jpg', '\\uploads\\admin\\ad_thumb\\20190418\\faa2fbe28e4d06bfb211b96ae4d64c70.jpg', '16110', 'jpg', '1', '192.168.1.100', '1', '1555578207', '1', '1555578207', 'ad_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('56', 'admin', 'a28753ec1677d30dc60d16acdecbcc1c.jpg', '\\uploads\\admin\\ad_thumb\\20190418\\a28753ec1677d30dc60d16acdecbcc1c.jpg', '106228', 'jpg', '1', '192.168.1.100', '1', '1555578213', '1', '1555578213', 'ad_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('57', 'admin', '2c28cfdf045bbcaadf48a8ccadbe5a00.gif', '\\uploads\\admin\\ad_thumb\\20190418\\2c28cfdf045bbcaadf48a8ccadbe5a00.gif', '17946', 'gif', '1', '192.168.1.100', '1', '1555578317', '1', '1555578317', 'ad_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('58', 'admin', '80321ddfe10a224647faaee6fefb9c1a.jpg', '\\uploads\\admin\\ad_thumb\\20190418\\80321ddfe10a224647faaee6fefb9c1a.jpg', '16110', 'jpg', '1', '192.168.1.100', '1', '1555578328', '1', '1555578328', 'ad_thumb', '0');
INSERT INTO `hov_attachment` VALUES ('70', 'admin', '8273e6d056d09ac1989fad47d93b908f.jpg', '\\uploads\\admin\\ad_thumb\\20190418\\8273e6d056d09ac1989fad47d93b908f.jpg', '53509', 'jpg', '1', '192.168.1.104', '1', '1555598046', '1', '1555598046', 'ad_thumb', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COMMENT='公告表';

-- ----------------------------
-- Records of hov_board
-- ----------------------------
INSERT INTO `hov_board` VALUES ('51', '1', '游戏已经全部恢复！祝您游戏愉快！', '<p><span style=\"color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimHei, 黑体, Arial, HELVETICA; font-size: 15px; background-color: rgb(255, 255, 255);\">游戏已经全部恢复！</span></p>', '1553478276', '1553478276', '1', '0');
INSERT INTO `hov_board` VALUES ('52', '1', '2019年春节蛋蛋/北京类游戏停机公告', '<p><strong style=\"margin: 0px; padding: 0px;\">亲爱的彩豆会员：</strong></p><p><strong style=\"margin: 0px; padding: 0px;\">&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;因第三方平台北京福利彩票官网“北京快乐8”、“北京PK拾”将在春节期间休市，2019年2月3日（农历二十九）0:00至2月11日（正月初七）24:00期间，平台里的北京28、蛋蛋28、北京赛车将暂停开奖。在此期间，极速28 加拿大28 韩国28正常运作，祝大家玩的开心！</strong></p><p><span class=\"news_time\" style=\"margin: 60px 0px 0px; padding: 0px; color: rgb(85, 85, 85); background-color: rgb(255, 255, 255); display: inline-block; text-align: right; width: 716px; font-family: UKIJTor, 微软雅黑, &quot;Microsoft YaHei UI&quot;, Helvetica, Arial, sans-serif; letter-spacing: 4px;\"><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; text-align: start;\">彩豆</span>28</strong></p></span></p><p><br/></p>', '1553478306', '1553478306', '1', '0');
INSERT INTO `hov_board` VALUES ('53', '1', '妞妞点卡解除合作', '<p>因妞妞点卡个人原因和网站解除合作关系，如果玩家有需要请找其他代理合作，谢谢！</p><p>如再有玩家执意要找妞妞点卡交易的，造成的损失，一切后果玩家自行承担！</p><p><br/></p>', '1553478341', '1553478341', '1', '0');
INSERT INTO `hov_board` VALUES ('54', '1', '跨年红包中奖用户如下！', '<p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">ID：22551&nbsp;</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">ID：890921</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">ID：24344&nbsp;</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">ID：22992&nbsp;</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">ID：21537</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">ID：890995&nbsp;</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">ID：22694&nbsp;<span class=\"Apple-tab-span\" style=\"margin: 0px; padding: 0px; white-space: pre;\">	</span></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">ID：890034&nbsp;</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">ID：23360</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">ID：890727&nbsp;</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"color:#ff0000\">以上中奖用户联系对应代理找客服领取588元<img src=\"http://test.lotgame.com/static/public/ueditor/themes/default/images/spacer.gif\"/>红包【系统已经站内信通知】！</span></strong></p><p><br/></p>', '1553478369', '1553478369', '1', '0');
INSERT INTO `hov_board` VALUES ('55', '1', '2019元旦快乐', '<p><span style=\"color: rgb(255, 255, 255); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimHei, 黑体, Arial, HELVETICA; font-size: 15px; text-align: center; background-color: rgb(255, 0, 0);\">新的一年祝大家工作顺利，全家平安，同时也祝愿祖国繁荣昌盛！</span></p>', '1553478400', '1553478400', '1', '0');
INSERT INTO `hov_board` VALUES ('56', '1', '11月10日更新开奖接口（更高效更精准）！', '<p><span style=\"color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimHei, 黑体, Arial, HELVETICA; font-size: 15px; background-color: rgb(255, 255, 255);\">11月10日更新开奖接口（更高效更精准）！</span></p>', '1553478441', '1553478441', '1', '0');
INSERT INTO `hov_board` VALUES ('57', '1', '乐豆28元旦活动礼品奖励公布如下', '<p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">乐豆28元旦活动礼品奖励公布如下：</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">以下用户已发货！快递订单号已发往站内信请注意查看！</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">乐豆28从始至终活动都 公平 公正！后期活动还请尽请期待！！！</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月1日排名第一名称 :【发发发9999】 &nbsp; &nbsp; &nbsp;奖品：8,888,000 &nbsp;Apple苹果iPhoneX</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月1日排名第二名称 :【大哥来袭】 &nbsp; &nbsp; &nbsp; &nbsp;奖品：6,100,000 LV男士手包</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月2日排名第一名称 : 【忙着玩 28 】 &nbsp; &nbsp; 奖品：16,999,000 外星人ALW15C-R273</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月2日排名第二名称 : 【我不管 我最帅】 &nbsp;奖品：5,500,000 prada男士手提包</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月3日排名第一名称 : 【 我叫28 】 &nbsp; &nbsp; &nbsp; 奖品：8,888,000 &nbsp;Apple苹果iPhoneX</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月3日排名第二名称 : 【 我不叫大户 】 &nbsp; 奖品：12,900,000 全球购 路易威登（LV）新款</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月4日排名第一名称 : 【雷迪嘎嘎 &nbsp; 】 &nbsp; &nbsp;奖品：16,999,000 外星人ALW15C-R273</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月4日排名第二名称 : 【 &nbsp;喵喵嘿嘿 】 &nbsp; &nbsp;奖品：3,800,000 LV男士钱包</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月5日排名第一名称 : 【巴巴爸爸不 &nbsp;】 &nbsp; 奖品：12,999,000 &nbsp;VETAS V5轻奢智能手机</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月5日排名第二名称 : 【 我是小星星 &nbsp;】 &nbsp;奖品：16,899,000 prada女士单肩包</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月6日排名第一名称 ：【 全中 】 &nbsp; &nbsp; &nbsp; &nbsp; 奖品：6,458,000 &nbsp;iPhone7 Plus</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月6日排名第二名称 : 【每天赢一点】 &nbsp; &nbsp; 奖品：2,298,000 Versace皮带男式范思哲</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月7日排名第一名称 : 【好吧来吧 】 &nbsp; &nbsp; &nbsp;奖品：8,888,000 &nbsp;Apple苹果iPhoneX</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月7日排名第二名称 : 【 石哥 &nbsp;】 &nbsp; &nbsp; &nbsp; &nbsp;奖品：16,899,000 prada女士单肩包</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月1日至1月7日周第一名称 :【518518 】 &nbsp; 奖品：16,999,000 外星人ALW15C-R273</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">1月1日至1月7日周第二名称 :【 明日再战 】奖品：16,899,000 prada女士单肩包</span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\"><br/></span></strong></p><p><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px;color:#ff0000\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 没有拿到奖励的还有更多活动等你哦！</span></strong></p><p><br/></p>', '1553479470', '1553479470', '1', '0');
INSERT INTO `hov_board` VALUES ('58', '1', '鸿福点卡解除合作', '<p>因鸿福点卡个人原因和网站解除合作关系，如果玩家有需要请找其他代理合作，谢谢！</p><p>如再有玩家执意要找鸿福点卡交易的，造成的损失，一切后果玩家自行承担！</p><p><br/></p>', '1553479489', '1553479489', '1', '0');
INSERT INTO `hov_board` VALUES ('59', '1', '本平台再次申明禁止多开账号！', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimHei, 黑体, Arial, HELVETICA; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px\">本平台三令五声禁止多开账号！一人只能一个ID</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimHei, 黑体, Arial, HELVETICA; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"font-size:18px\">&nbsp; &nbsp; 如果发现一个IP下有多个ID，我们将永久冻结账号，不给予解封，请广大玩家告知！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimHei, 黑体, Arial, HELVETICA; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaheiUI&quot;, &quot;Microsoft YaHei&quot;, SimHei, 宋体, simsun, sans-serif; font-size: large; font-weight: bold; text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 谢谢理解和配合。</span></p><p><br/></p>', '1553479510', '1553479510', '1', '0');
INSERT INTO `hov_board` VALUES ('60', '1', '小强点卡跑路通知！', '<p><span style=\"color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimHei, 黑体, Arial, HELVETICA; font-size: 15px; background-color: rgb(255, 255, 255);\">小强点卡已经跑路！</span><span style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaheiUI&quot;, &quot;Microsoft YaHei&quot;, SimHei, 宋体, simsun, sans-serif; line-height: 40px; text-indent: 4%; background-color: rgb(255, 255, 255);\">，请各位玩家联系其他合作商家！</span></p>', '1553483470', '1553483470', '1', '0');
INSERT INTO `hov_board` VALUES ('61', '1', '乐豆28实力信誉60款游戏等你来玩！', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimHei, 黑体, Arial, HELVETICA; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\">乐豆28为了方便玩家对游戏的选择现共有60多款游戏！更多游戏正在开发中！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimHei, 黑体, Arial, HELVETICA; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\">请大家关注乐豆28官网：www.ledou288.com &nbsp; &nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimHei, 黑体, Arial, HELVETICA; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\">客服QQ：2577000</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimHei, 黑体, Arial, HELVETICA; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\">交流群QQ：2577000</p><p><br/></p>', '1553483494', '1553483494', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_card_cate
-- ----------------------------
INSERT INTO `hov_card_cate` VALUES ('2', '红钻卡(每天领1W2)', 'gz1', '8', '3', '20', '300.00', '0', '0', '0', '12000', '0', '30', '1553137662', '1553221816', '0', '');
INSERT INTO `hov_card_cate` VALUES ('3', '金龙卡', '15', '8', '3', null, '1500.00', '0', '1500000', '0', '50000', '0', '30', '1553137724', '1553221784', '0', '');
INSERT INTO `hov_card_cate` VALUES ('4', '1000元中国移动手机充值卡', 'd1', '8', '3', null, '1000.00', '0', '1000000', '1000', '0', '0', '0', '1553137799', '1554726620', '0', '');
INSERT INTO `hov_card_cate` VALUES ('5', 'VIP贵宾卡', 'vi', '8', '3', null, '0.00', '1', '0', '0', '0', '0', '0', '1553137961', '1553221861', '0', '');
INSERT INTO `hov_card_cate` VALUES ('6', '20元广告体验卡', '20', '15', '3', null, '20.00', '0', '20000', '10', '0', '0', '0', '1553138020', '1553221881', '1', '');
INSERT INTO `hov_card_cate` VALUES ('7', '1元红包卡', 'HB', '8', '2', null, '1.00', '0', '0', '0', '0', '0', '0', '1553138095', '1553221901', '1', '');
INSERT INTO `hov_card_cate` VALUES ('8', '兑奖200元专用卡', 'd200', '15', '3', null, '200.00', '0', '200000', '0', '0', '0', '0', '1553138141', '1553221928', '0', '');
INSERT INTO `hov_card_cate` VALUES ('9', '兑奖50元专用卡', 'd50', '15', '2', null, '50.00', '0', '50000', '0', '0', '0', '0', '1553138205', '1553221947', '0', '');
INSERT INTO `hov_card_cate` VALUES ('10', '兑奖100元专用卡', 'd10', '16', '2', null, '100.00', '0', '100000', '100', '0', '0', '0', '1554698695', '1554726300', '0', '');

-- ----------------------------
-- Table structure for `hov_card_pwd`
-- ----------------------------
DROP TABLE IF EXISTS `hov_card_pwd`;
CREATE TABLE `hov_card_pwd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(30) DEFAULT NULL,
  `card_pwd` varchar(30) DEFAULT NULL,
  `card_cate_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '3已回收 | 4已充值 | 1未充值 | 2已兑出(未回收)',
  `create_time` int(11) DEFAULT NULL,
  `use_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_card_pwd
-- ----------------------------
INSERT INTO `hov_card_pwd` VALUES ('8', 'd200HjtCpKzvmYQY7Tc', 'CVbfn8uJpLcu2yp', '8', null, '5', '4', '1553225623', '1554689102');
INSERT INTO `hov_card_pwd` VALUES ('9', 'd200nr2TAaRVr7ajWCW', 'jw1iQlimi0D3Chn', '8', null, '5', '4', '1553225623', '1554557823');
INSERT INTO `hov_card_pwd` VALUES ('10', 'd200yDAg1K0T3kcqX34', 'fipzwIIG45Gk9ar', '8', null, '5', '4', '1553225623', '1554558177');
INSERT INTO `hov_card_pwd` VALUES ('11', 'd1ruGtx6zv', 'U17NIHQB', '4', null, null, '4', '1554468991', null);
INSERT INTO `hov_card_pwd` VALUES ('12', 'd1iKMeTl2V', 'tHY2tdu1', '4', null, '5', '4', '1554468991', '1554558177');
INSERT INTO `hov_card_pwd` VALUES ('13', 'd1mZRkK1m9', 'ngguCHPf', '4', null, '5', '4', '1554468991', '1554688955');
INSERT INTO `hov_card_pwd` VALUES ('14', 'vimehbXM2R', 'c6wpp9sy', '5', '0', null, '1', '1554556313', null);
INSERT INTO `hov_card_pwd` VALUES ('15', 'viV7vdMplT', 'OMNUS5kY', '5', '0', null, '1', '1554556313', null);
INSERT INTO `hov_card_pwd` VALUES ('16', 'd200GtWS9N8O6uM2sGD', 'cDFY8hJcjb3mvDU', '8', '0', '5', '4', '1554689264', '1554689331');
INSERT INTO `hov_card_pwd` VALUES ('17', 'd200WF2wYXGKEjJqEP1', 'NG7vEvcIdWIVvIk', '8', '0', '5', '4', '1554689264', '1554689796');
INSERT INTO `hov_card_pwd` VALUES ('18', 'd200hETQTBJMRz5gW2c', '6QVu3aLfLREyi7s', '8', '0', '5', '4', '1554689264', '1554691889');
INSERT INTO `hov_card_pwd` VALUES ('19', 'd200Y5zxH31o1eQQog2', '4xdNjzqpQ7xkKaT', '8', '0', '5', '4', '1554689264', '1554690101');
INSERT INTO `hov_card_pwd` VALUES ('20', 'd200iRlSwV35wvpy0JV', 'ThTwr3TBpqm1TtF', '8', '0', '5', '4', '1554689264', '1554690143');
INSERT INTO `hov_card_pwd` VALUES ('21', 'd50ITCJMYNAWSZKKFC', 'OEQW8Q9NM95S5G2', '9', '0', '5', '4', '1554690746', '1554691619');
INSERT INTO `hov_card_pwd` VALUES ('22', 'd505OLZYZ2XE535RYW', 'MAN881DQB9HOA5T', '9', '0', '5', '4', '1554690746', '1554690781');
INSERT INTO `hov_card_pwd` VALUES ('23', 'd50UQZSL0WIL1Z7D99', 'BWMMJMR2YI3T8Y8', '9', '0', '5', '4', '1554690746', '1554690781');
INSERT INTO `hov_card_pwd` VALUES ('24', 'd200DwCaFH9PM9WochE', 'bIxMxH2hOx8k5AO', '8', '0', '5', '4', '1554691915', '1554691967');
INSERT INTO `hov_card_pwd` VALUES ('25', 'd2009HgUswW1EYCqQAu', 'FHGhQV5eImMrneB', '8', '0', '5', '4', '1554691915', '1554691967');
INSERT INTO `hov_card_pwd` VALUES ('26', 'd200I6mOnmvUoMNNZNv', '1hOAx4rr4WFc0FU', '8', '0', null, '1', '1554691915', null);
INSERT INTO `hov_card_pwd` VALUES ('27', 'd108CBYQ7CHYBEVLC4E', 'DI61YLS94PXUPSGY', '10', '0', null, '2', '1554698811', null);
INSERT INTO `hov_card_pwd` VALUES ('29', 'd100RODP07J11NQ2CAN', 'MDN3RAI7XQ6Y1EXY', '10', '0', null, '2', '1554698811', null);
INSERT INTO `hov_card_pwd` VALUES ('30', 'd102DYG62UIPQ5O1GWT', 'Y09HOKX6J5R6XV2Q', '10', '0', '5', '4', '1554725518', '1554726531');
INSERT INTO `hov_card_pwd` VALUES ('31', 'd10WCMVXI1OSM076TCO', 'STZINMUSPB5IMHOL', '10', '0', null, '2', '1554725518', null);
INSERT INTO `hov_card_pwd` VALUES ('32', 'd10KFQ7QPX3TCX3WOFL', 'KBS8S1SZGDCZC4LQ', '10', '0', '5', '4', '1554725518', '1554725556');
INSERT INTO `hov_card_pwd` VALUES ('33', 'd1qeOPSJkX', 'cWn3UVc9', '4', '0', null, '1', '1554726576', null);
INSERT INTO `hov_card_pwd` VALUES ('34', 'd1X0w6Pdyd', 'ePNN9WWf', '4', '0', '10', '4', '1554726576', '1554868559');
INSERT INTO `hov_card_pwd` VALUES ('35', 'd1EyOpO5mt', 'zkOuqWhf', '4', '0', '5', '4', '1554726576', '1554727096');
INSERT INTO `hov_card_pwd` VALUES ('36', 'd1pFFRlaCm', '2zvwEev4', '4', '0', '5', '4', '1554726576', '1554727096');
INSERT INTO `hov_card_pwd` VALUES ('37', 'd1agYZ14cF', '0mFOhYh3', '4', '0', null, '1', '1554726576', null);
INSERT INTO `hov_card_pwd` VALUES ('38', 'd10DI5MID1GC5L91L3K', 'O4K8MZGV4G9CWGFJ', '10', '0', null, '3', '1554727591', null);
INSERT INTO `hov_card_pwd` VALUES ('39', 'd10W142UKJIQQXM61DN', '1BHZYZS0Z98I6JOT', '10', '0', '5', '4', '1554727591', '1554729921');
INSERT INTO `hov_card_pwd` VALUES ('40', 'd10F2XO3BEZ97OESSB1', '7A1WTJ8FI0NM8SGQ', '10', '0', null, '3', '1554727591', null);
INSERT INTO `hov_card_pwd` VALUES ('41', 'd10TQU6I71MDLG5ZVFF', 'F1UV6E0ENR0BYA1Y', '10', '0', '10', '3', '1554727591', '2019');
INSERT INTO `hov_card_pwd` VALUES ('43', 'd105IT1ZNN6ASRMJ584', 'AXV854ZMS2FJ7VQK', '10', '0', '10', '2', '1554727591', '1554956298');
INSERT INTO `hov_card_pwd` VALUES ('44', 'd1002AJ8Z3TVY2PJUOJ', 'LNO8C0VQQCWAANG6', '10', '0', '10', '3', '1554727591', '1554956298');
INSERT INTO `hov_card_pwd` VALUES ('45', 'd10HR85Z9KDS4DE66CC', 'BAG0ATFANO8KE9VU', '10', '0', '5', '4', '1554727591', '1554729921');
INSERT INTO `hov_card_pwd` VALUES ('46', 'd10MVDUNKRTL2L92CJ9', 'ZEEM381BVTTY33AF', '10', '0', '5', '4', '1554727591', '1554729777');
INSERT INTO `hov_card_pwd` VALUES ('47', 'd10M2MY6Z1MMO35U3J9', 'S26EV6PPF1A5XR3G', '10', '0', '5', '4', '1554727591', '1554729777');
INSERT INTO `hov_card_pwd` VALUES ('48', 'd1D9AY6Pv5', 'LHfpSmYJ', '4', '0', '8', '4', '1555121515', '1555662551');
INSERT INTO `hov_card_pwd` VALUES ('49', 'd1fHAHy6eJ', 'Q97z8TDw', '4', '0', null, '1', '1555121515', null);
INSERT INTO `hov_card_pwd` VALUES ('50', 'd1kAbIecH4', 'DfGTqx0P', '4', '0', '10', '4', '1555121515', '1555121539');
INSERT INTO `hov_card_pwd` VALUES ('51', 'd10LVPT61SCDYA3GQJH', 'T54RMJL4LGHD4P70', '10', '0', '10', '3', '1555121928', '2019');
INSERT INTO `hov_card_pwd` VALUES ('52', 'd10QTWHHM77SHQRPDNM', 'OFT5RA535WQ68RJN', '10', '0', '10', '2', '1555121928', '1555121939');
INSERT INTO `hov_card_pwd` VALUES ('53', 'd10HTDQB2YGM5BSTS1S', 'DG6SEUVHSJPESLXO', '10', '0', '9', '4', '1555121928', '1555505492');
INSERT INTO `hov_card_pwd` VALUES ('54', 'd101YWCVOTMO9NI9MR4', 'OKR58Z7366JWUJ6A', '10', '0', '10', '2', '1555121928', '1555600483');
INSERT INTO `hov_card_pwd` VALUES ('55', 'd102KXZ660FTL1QVEWC', 'ZOYJ0GFIRAVQVQ9I', '10', '0', '10', '2', '1555121928', '1555684074');
INSERT INTO `hov_card_pwd` VALUES ('56', 'd200aGYz6irdQioCL6x', 'G63HhlWuelU2WGb', '8', '0', null, '1', '1556163356', null);
INSERT INTO `hov_card_pwd` VALUES ('57', 'd200zJEVwhhorhTuX1g', 'cNNDb3rF0FrdVum', '8', '0', '6', '4', '1556163356', '1556279966');
INSERT INTO `hov_card_pwd` VALUES ('58', 'd2006OEV2yng2Gcr7tM', 'zidQHpmAdKqPax6', '8', '0', null, '1', '1556163356', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_chargeconfig
-- ----------------------------
INSERT INTO `hov_chargeconfig` VALUES ('1', '1', '1', '5', '2', '2.00', null, '1554627817', '1');
INSERT INTO `hov_chargeconfig` VALUES ('2', '1', '6', '15', '2', '5.00', '1554621839', '1554627829', '1');
INSERT INTO `hov_chargeconfig` VALUES ('3', '1', '16', '100', '2', '7.00', '1554621863', '1554627840', '1');

-- ----------------------------
-- Table structure for `hov_draw_lottery`
-- ----------------------------
DROP TABLE IF EXISTS `hov_draw_lottery`;
CREATE TABLE `hov_draw_lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT '0',
  `money` int(11) DEFAULT NULL,
  `odd` smallint(4) DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `sort` tinyint(2) DEFAULT '0' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_draw_lottery
-- ----------------------------
INSERT INTO `hov_draw_lottery` VALUES ('1', '彩豆大礼包', '188', '100', '270', '310', '1', '1555641672', '1555677280');
INSERT INTO `hov_draw_lottery` VALUES ('2', '666金币', '666', '10', '225', '265', '2', '1555641783', '1555677309');
INSERT INTO `hov_draw_lottery` VALUES ('3', '2888金币', '2888', '8', '180', '220', '3', '1555641800', '1555677330');
INSERT INTO `hov_draw_lottery` VALUES ('4', '6888金币', '6888', '5', '135', '175', '4', '1555641814', '1555677343');
INSERT INTO `hov_draw_lottery` VALUES ('5', '58800金币', '58800', '3', '90', '130', '5', '1555641826', '1555677355');
INSERT INTO `hov_draw_lottery` VALUES ('6', '188000金币', '188000', '1', '45', '85', '6', '1555641838', '1555677409');
INSERT INTO `hov_draw_lottery` VALUES ('7', '888000金币', '888000', '0', '0', '40', '7', null, '1555677490');
INSERT INTO `hov_draw_lottery` VALUES ('8', '谢谢参与', '0', '500', '315', '355', '0', '1555641860', '1555677763');

-- ----------------------------
-- Table structure for `hov_emailconfig`
-- ----------------------------
DROP TABLE IF EXISTS `hov_emailconfig`;
CREATE TABLE `hov_emailconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(5) NOT NULL COMMENT '邮箱配置标识',
  `from_email` varchar(50) NOT NULL COMMENT '邮件来源也就是邮件地址',
  `from_name` varchar(50) NOT NULL,
  `smtp` varchar(50) NOT NULL COMMENT '邮箱smtp服务器',
  `username` varchar(100) NOT NULL COMMENT '邮箱账号',
  `password` varchar(100) NOT NULL COMMENT '邮箱密码',
  `title` varchar(200) NOT NULL COMMENT '邮件标题',
  `content` text NOT NULL COMMENT '邮件模板',
  PRIMARY KEY (`id`),
  KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_emailconfig
-- ----------------------------
INSERT INTO `hov_emailconfig` VALUES ('1', 'email', 'ikscher@163.com', 'ikscher', 'smtp.163.com', 'ikscher@163.com', 'hongwinter@520', 'ceshi', '&amp;lt;p&amp;gt;as&amp;lt;/p&amp;gt;');

-- ----------------------------
-- Table structure for `hov_game`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game`;
CREATE TABLE `hov_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_type` tinyint(2) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `gtag` varchar(20) DEFAULT NULL COMMENT 'ww(外围）,basic,sc',
  `ntype` varchar(20) DEFAULT NULL COMMENT '系统开奖js，第三方开奖',
  `gtype` tinyint(2) DEFAULT NULL,
  `pressnum` varchar(150) DEFAULT NULL,
  `intro` text,
  `draw_ratio` decimal(6,2) DEFAULT NULL COMMENT '抽水比例',
  `forbid` int(11) DEFAULT '0' COMMENT '禁止投注时间(秒）',
  `min_bid` int(11) DEFAULT NULL COMMENT '限额',
  `max_bid` int(11) DEFAULT NULL,
  `reward_exp` varchar(500) DEFAULT NULL,
  `reward_points` varchar(500) DEFAULT NULL,
  `help` text,
  `sort` tinyint(2) DEFAULT '0' COMMENT '越小越靠前',
  `tip` varchar(100) DEFAULT NULL,
  `onoff` tinyint(1) DEFAULT '0' COMMENT '1开，0关',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game
-- ----------------------------
INSERT INTO `hov_game` VALUES ('1', '1', '幸运百家乐', 'xybjl', 'basic', 'js', '3', '10,10,10', '&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20190427/1556368782.png&amp;quot; title=&amp;quot;1556368782.png&amp;quot; alt=&amp;quot;bjl.png&amp;quot;/&amp;gt;&amp;lt;/p&amp;gt;', null, '0', '100', '30000000', null, null, null, '1', null, '1', '1553311975', '1556370081');
INSERT INTO `hov_game` VALUES ('2', '1', '幸运10', 'xy10', 'basic', 'js', '10', '10,10,10,10,10,10,10,10,10,10', '', null, '0', '0', '0', null, null, null, '2', null, '1', '1553312074', '1556451914');
INSERT INTO `hov_game` VALUES ('3', '1', '幸运11', 'xy11', 'basic', 'js', null, null, '', '0.00', '0', '0', '0', '0', '0', '', '3', '', '1', '1553312148', '1556111184');
INSERT INTO `hov_game` VALUES ('4', '1', '幸运16', 'xy16', 'basic', 'js', null, null, '', null, '0', null, null, null, null, null, '4', null, '1', null, '1556111309');
INSERT INTO `hov_game` VALUES ('5', '1', '幸运冠亚军', 'xygyj', 'basic', 'js', null, null, '', null, '0', null, null, null, null, null, '8', null, '1', null, '1556111300');
INSERT INTO `hov_game` VALUES ('6', '1', '幸运22', 'xy22', 'basic', 'js', null, null, '', null, '0', null, null, null, null, null, '5', null, '1', '1553312250', '1556111190');
INSERT INTO `hov_game` VALUES ('7', '1', '幸运28', 'xy28', 'basic', 'js', null, null, '', '1.30', '23', '33', '344', '{\"1\":{\"min_exp_from\":\"1\",\"max_exp_to\":\"2\",\"seq_reward_exp\":\"3\"},\"2\":{\"min_exp_from\":\"4\",\"max_exp_to\":\"5\",\"seq_reward_exp\":\"6\"},\"3\":{\"min_exp_from\":\"3\",\"max_exp_to\":\"34\",\"seq_reward_exp\":\"3\"},\"4\":{\"min_exp_from\":\"12\",\"max_exp_to\":\"\",\"seq_reward_exp\":\"22\"}}', '[{\"min_points_from\":\"\",\"max_points_to\":\"\",\"seq_reward_points\":\"\"},{\"min_points_from\":\"23\",\"max_points_to\":\"324\",\"seq_reward_points\":\"2\"},{\"min_points_from\":\"\",\"max_points_to\":\"\",\"seq_reward_points\":\"\"},{\"min_points_from\":\"32334\",\"max_points_to\":\"43434\",\"seq_reward_points\":\"345\"},{\"min_points_from\":\"\",\"max_points_to\":\"\",\"seq_reward_points\":\"\"}]', '<table class=\"table_list\" width=\"1100\" style=\"width: 968px;\"><tbody style=\"margin: 0px; padding: 0px;\"><tr style=\"margin: 0px; padding: 0px;\" class=\"firstRow\"><td colspan=\"4\" style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">采用北京福彩中心快乐8数据，与PC蛋蛋结果相同，每5分钟一期，每天179期，每天0-9点暂停开奖</td></tr><tr style=\"margin: 0px; padding: 0px;\"><td width=\"120\" style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">如第654574期</td><td colspan=\"3\" style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">02,04,07,08,18,22,25,30,35,36,43,49,50,53,59,66,69,71,74,75(按照由小到大的顺序依次排列)</td></tr><tr style=\"margin: 0px; padding: 0px;\"><td width=\"120\" style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">区位</td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">第一区[第1/2/3/4/5/6位数字]</td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">第二区[第7/8/9/10/11/12位数字]</td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">第三区[第13/14/15/16/17/18位数字]</td></tr><tr style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">数字</td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">02,04,07,08,18,22</td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">25,30,35,36,43,49</td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">50,53,59,66,69,71</td></tr><tr style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">求和</td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">61</td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">218</td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">368</td></tr><tr style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">计算</td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">取尾数</td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">取尾数</td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">取尾数</td></tr><tr style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">结果</td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\"><ul class=\" list-paddingleft-2\"><li><p>1</p></li></ul></td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\"><ul class=\" list-paddingleft-2\"><li><p>8</p></li></ul></td><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\"><ul class=\" list-paddingleft-2\"><li><p>8</p></li></ul></td></tr><tr style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\">开奖</td><td colspan=\"3\" style=\"margin: 0px; padding: 0px; border-color: rgb(204, 204, 204); text-align: center; color: rgb(85, 85, 85); line-height: 45px; font-size: 15px;\"><ul class=\" list-paddingleft-2\"><li><p>1</p></li><li><p>&nbsp;+&nbsp;&nbsp;</p></li><li><p>8</p></li><li><p>&nbsp;+&nbsp;&nbsp;</p></li><li><p>8</p></li><li><p>&nbsp;=&nbsp;&nbsp;</p></li><li><p>17</p></li></ul></td></tr></tbody></table><p><br/></p>', '6', '游戏时间：北京时间 09:05 ～ 23:55,每 5分钟 一期，全天 179 期。', '1', '1553312368', '1556111201');
INSERT INTO `hov_game` VALUES ('8', '1', '幸运36', 'xy36', 'basic', 'js', null, null, '', null, '0', null, null, null, null, null, '7', null, '1', null, '1556111293');
INSERT INTO `hov_game` VALUES ('9', '2', '蛋蛋28', 'dd28', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555832104');
INSERT INTO `hov_game` VALUES ('10', '2', '蛋蛋外围21', 'ddww21', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555844956');
INSERT INTO `hov_game` VALUES ('11', '2', '蛋蛋36', 'dd36', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555832120');
INSERT INTO `hov_game` VALUES ('12', '6', '韩国28', 'hg28', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845818');
INSERT INTO `hov_game` VALUES ('13', '6', '韩国16', 'hg16', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845808');
INSERT INTO `hov_game` VALUES ('14', '6', '韩国36', 'hg36', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845829');
INSERT INTO `hov_game` VALUES ('15', '6', '韩国11', 'hg11', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845788');
INSERT INTO `hov_game` VALUES ('16', '6', '韩国10', 'hg10', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845777');
INSERT INTO `hov_game` VALUES ('17', '6', '韩国外围21', 'hgww21', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845852');
INSERT INTO `hov_game` VALUES ('18', '6', '韩国外围28', 'hgdw28', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845869');
INSERT INTO `hov_game` VALUES ('19', '2', '北京28', 'bj28', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555831969');
INSERT INTO `hov_game` VALUES ('20', '2', '北京16', 'bj16', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555832005');
INSERT INTO `hov_game` VALUES ('21', '2', '北京36', 'bj36', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845929');
INSERT INTO `hov_game` VALUES ('22', '4', '加拿大28', 'jnd28', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845224');
INSERT INTO `hov_game` VALUES ('23', '4', '加拿大16', 'jnd16', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845212');
INSERT INTO `hov_game` VALUES ('24', '4', '加拿大36', 'jnd36', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845237');
INSERT INTO `hov_game` VALUES ('25', '4', '加拿大11', 'jnd11', 'basic', null, null, null, '&amp;lt;table&amp;gt;&amp;lt;tbody&amp;gt;&amp;lt;tr class=&amp;quot;firstRow&amp;quot;&amp;gt;&amp;lt;td colspan=&amp;quot;4&amp;quot;&amp;gt;采用加拿大快乐8数据，每4分钟一期，每天336期，每天19:00-20:30暂停开奖&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td&amp;gt;如第1773065期&amp;lt;/td&amp;gt;&amp;lt;td colspan=&amp;quot;3&amp;quot;&amp;gt;01,06,07,13,15,28,31,32,33,35,40,43,44,53,57,62,64,65,68,80(从小到大依次排列)&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td&amp;gt;&amp;lt;strong&amp;gt;区位&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;&amp;lt;td&amp;gt;第一区[第1/4/7/10/13/16位数字]&amp;lt;/td&amp;gt;&amp;lt;td style=&amp;quot;word-break: break-all;&amp;quot; rowspan=&amp;quot;1&amp;quot; colspan=&amp;quot;2&amp;quot;&amp;gt;第二区[第2/5/8/11/14/17位数字]&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td&amp;gt;&amp;lt;strong&amp;gt;数字&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;&amp;lt;td&amp;gt;01,13,31,35,44,62&amp;lt;/td&amp;gt;&amp;lt;td rowspan=&amp;quot;1&amp;quot; colspan=&amp;quot;2&amp;quot;&amp;gt;07,28,33,43,57,65&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td&amp;gt;&amp;lt;strong&amp;gt;求和&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;&amp;lt;td&amp;gt;186&amp;lt;/td&amp;gt;&amp;lt;td rowspan=&amp;quot;1&amp;quot; colspan=&amp;quot;2&amp;quot;&amp;gt;233&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td&amp;gt;&amp;lt;strong&amp;gt;计算&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;&amp;lt;td&amp;gt;186除以6的余数 + 1&amp;lt;/td&amp;gt;&amp;lt;td rowspan=&amp;quot;1&amp;quot; colspan=&amp;quot;2&amp;quot;&amp;gt;233除以6的余数 + 1&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td&amp;gt;&amp;lt;strong&amp;gt;结果&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;&amp;lt;td&amp;gt;&amp;lt;p&amp;gt;1&amp;lt;/p&amp;gt;&amp;lt;/td&amp;gt;&amp;lt;td rowspan=&amp;quot;1&amp;quot; colspan=&amp;quot;2&amp;quot;&amp;gt;&amp;lt;p&amp;gt;6&amp;lt;/p&amp;gt;&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td class=&amp;quot;rule16&amp;quot;&amp;gt;&amp;lt;strong&amp;gt;开奖&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;&amp;lt;td colspan=&amp;quot;3&amp;quot; style=&amp;quot;word-break: break-all;&amp;quot;&amp;gt;&amp;lt;p&amp;gt;1+6=7&amp;lt;/p&amp;gt;&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;/tbody&amp;gt;&amp;lt;/table&amp;gt;', null, '0', null, null, null, null, null, null, null, '1', null, '1555845201');
INSERT INTO `hov_game` VALUES ('26', '4', '加拿大10', 'jnd10', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845185');
INSERT INTO `hov_game` VALUES ('27', '4', '加拿大外围21', 'jndww21', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845274');
INSERT INTO `hov_game` VALUES ('28', '4', '加拿大外围28', 'jnddww28', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845471');
INSERT INTO `hov_game` VALUES ('29', '2', '蛋蛋外围28', 'ddww28', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845435');
INSERT INTO `hov_game` VALUES ('31', '2', '北京10', 'bj10', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845950');
INSERT INTO `hov_game` VALUES ('33', '3', '重庆时时彩', 'cqssc', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845167');
INSERT INTO `hov_game` VALUES ('34', '3', 'PK冠亚', 'pkgy', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845110');
INSERT INTO `hov_game` VALUES ('35', '3', 'PK22', 'pk22', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845069');
INSERT INTO `hov_game` VALUES ('36', '3', 'PK冠军', 'pkgj', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845087');
INSERT INTO `hov_game` VALUES ('37', '3', 'PK10', 'pk10', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845053');
INSERT INTO `hov_game` VALUES ('38', '3', 'PK龙虎', 'pklh', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845894');
INSERT INTO `hov_game` VALUES ('50', '5', '印度外围28', 'ydww28', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845759');
INSERT INTO `hov_game` VALUES ('52', '5', '印度28', 'yd28', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845671');
INSERT INTO `hov_game` VALUES ('53', '5', '印度16', 'yd16', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845652');
INSERT INTO `hov_game` VALUES ('54', '5', '印度11', 'yd11', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845632');
INSERT INTO `hov_game` VALUES ('55', '5', '印度36', 'yd36', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845697');
INSERT INTO `hov_game` VALUES ('56', '5', '印度10', 'yd10', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845612');
INSERT INTO `hov_game` VALUES ('57', '5', '印度外围21', 'ydww21', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845731');
INSERT INTO `hov_game` VALUES ('58', '3', 'PK赛车', 'pksc', 'basic', null, null, null, '', null, '0', null, null, null, null, null, null, null, '1', null, '1555845149');

-- ----------------------------
-- Table structure for `hov_game_bj10`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_bj10`;
CREATE TABLE `hov_game_bj10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_bj10
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_bj11`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_bj11`;
CREATE TABLE `hov_game_bj11` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_bj11
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_bj16`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_bj16`;
CREATE TABLE `hov_game_bj16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_bj16
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_bj28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_bj28`;
CREATE TABLE `hov_game_bj28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_bj28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_bj36`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_bj36`;
CREATE TABLE `hov_game_bj36` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_bj36
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_cqssc`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_cqssc`;
CREATE TABLE `hov_game_cqssc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_cqssc
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_dd16`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_dd16`;
CREATE TABLE `hov_game_dd16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_dd16
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_dd28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_dd28`;
CREATE TABLE `hov_game_dd28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_dd28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_dd36`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_dd36`;
CREATE TABLE `hov_game_dd36` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_dd36
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_dddw`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_dddw`;
CREATE TABLE `hov_game_dddw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_dddw
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_ddww`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_ddww`;
CREATE TABLE `hov_game_ddww` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_ddww
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_ddww21`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_ddww21`;
CREATE TABLE `hov_game_ddww21` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_ddww21
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_ddww28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_ddww28`;
CREATE TABLE `hov_game_ddww28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_ddww28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_ft10`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_ft10`;
CREATE TABLE `hov_game_ft10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_ft10
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_ft22`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_ft22`;
CREATE TABLE `hov_game_ft22` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_ft22
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_ftgj`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_ftgj`;
CREATE TABLE `hov_game_ftgj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_ftgj
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_gdbj28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_gdbj28`;
CREATE TABLE `hov_game_gdbj28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_gdbj28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_gddd28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_gddd28`;
CREATE TABLE `hov_game_gddd28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_gddd28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_gdhg28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_gdhg28`;
CREATE TABLE `hov_game_gdhg28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_gdhg28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_gdjnd28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_gdjnd28`;
CREATE TABLE `hov_game_gdjnd28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_gdjnd28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_hg10`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_hg10`;
CREATE TABLE `hov_game_hg10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_hg10
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_hg11`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_hg11`;
CREATE TABLE `hov_game_hg11` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_hg11
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_hg16`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_hg16`;
CREATE TABLE `hov_game_hg16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_hg16
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_hg28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_hg28`;
CREATE TABLE `hov_game_hg28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_hg28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_hg36`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_hg36`;
CREATE TABLE `hov_game_hg36` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_hg36
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_hgdw`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_hgdw`;
CREATE TABLE `hov_game_hgdw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_hgdw
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_hgdw28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_hgdw28`;
CREATE TABLE `hov_game_hgdw28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_hgdw28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_hgww`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_hgww`;
CREATE TABLE `hov_game_hgww` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_hgww
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_hgww21`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_hgww21`;
CREATE TABLE `hov_game_hgww21` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_hgww21
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_jnd10`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_jnd10`;
CREATE TABLE `hov_game_jnd10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_jnd10
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_jnd11`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_jnd11`;
CREATE TABLE `hov_game_jnd11` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_jnd11
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_jnd16`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_jnd16`;
CREATE TABLE `hov_game_jnd16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_jnd16
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_jnd28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_jnd28`;
CREATE TABLE `hov_game_jnd28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_jnd28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_jnd36`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_jnd36`;
CREATE TABLE `hov_game_jnd36` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_jnd36
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_jnddw`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_jnddw`;
CREATE TABLE `hov_game_jnddw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_jnddw
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_jnddww28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_jnddww28`;
CREATE TABLE `hov_game_jnddww28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_jnddww28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_jndww`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_jndww`;
CREATE TABLE `hov_game_jndww` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_jndww
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_jndww21`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_jndww21`;
CREATE TABLE `hov_game_jndww21` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_jndww21
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_js10`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_js10`;
CREATE TABLE `hov_game_js10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_js10
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_js11`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_js11`;
CREATE TABLE `hov_game_js11` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_js11
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_js16`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_js16`;
CREATE TABLE `hov_game_js16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_js16
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_js22`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_js22`;
CREATE TABLE `hov_game_js22` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` varchar(50) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_js22
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_js28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_js28`;
CREATE TABLE `hov_game_js28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_js28
-- ----------------------------
INSERT INTO `hov_game_js28` VALUES ('1', '1223423', null, null, '3', '3', '23423424', null, null);

-- ----------------------------
-- Table structure for `hov_game_js36`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_js36`;
CREATE TABLE `hov_game_js36` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_js36
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_jsgy`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_jsgy`;
CREATE TABLE `hov_game_jsgy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_jsgy
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_pk10`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_pk10`;
CREATE TABLE `hov_game_pk10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_pk10
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_pk22`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_pk22`;
CREATE TABLE `hov_game_pk22` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_pk22
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_pkgj`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_pkgj`;
CREATE TABLE `hov_game_pkgj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_pkgj
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_pkgy`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_pkgy`;
CREATE TABLE `hov_game_pkgy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_pkgy
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_pklh`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_pklh`;
CREATE TABLE `hov_game_pklh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_pklh
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_pksc`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_pksc`;
CREATE TABLE `hov_game_pksc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_pksc
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_qb16`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_qb16`;
CREATE TABLE `hov_game_qb16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_qb16
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_rs11`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_rs11`;
CREATE TABLE `hov_game_rs11` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_rs11
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_rs16`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_rs16`;
CREATE TABLE `hov_game_rs16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_rs16
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_rs28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_rs28`;
CREATE TABLE `hov_game_rs28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_rs28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_rs36`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_rs36`;
CREATE TABLE `hov_game_rs36` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_rs36
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_tx11`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_tx11`;
CREATE TABLE `hov_game_tx11` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_tx11
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_tx16`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_tx16`;
CREATE TABLE `hov_game_tx16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_tx16
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_tx28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_tx28`;
CREATE TABLE `hov_game_tx28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_tx28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_tx36`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_tx36`;
CREATE TABLE `hov_game_tx36` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_tx36
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_xdl10`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xdl10`;
CREATE TABLE `hov_game_xdl10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xdl10
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_xdl11`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xdl11`;
CREATE TABLE `hov_game_xdl11` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xdl11
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_xdl16`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xdl16`;
CREATE TABLE `hov_game_xdl16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xdl16
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_xdl28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xdl28`;
CREATE TABLE `hov_game_xdl28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xdl28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_xdl36`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xdl36`;
CREATE TABLE `hov_game_xdl36` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xdl36
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_xdlww`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xdlww`;
CREATE TABLE `hov_game_xdlww` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xdlww
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_xn28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xn28`;
CREATE TABLE `hov_game_xn28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_num` int(11) DEFAULT NULL COMMENT '期号',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `result` char(50) DEFAULT NULL COMMENT '开奖结果',
  `hits` int(11) DEFAULT NULL COMMENT '中奖次数',
  `bids` int(11) DEFAULT NULL COMMENT '投注次数',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `odd` varchar(300) DEFAULT NULL COMMENT '开奖赔率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xn28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_xy10`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xy10`;
CREATE TABLE `hov_game_xy10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xy10
-- ----------------------------
INSERT INTO `hov_game_xy10` VALUES ('1', '', '1556427360', '10,7,9,2,4,8,3,5,6,1', '10', '0', '1556427360', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('2', '', '1556427420', '9,5,8,7,10,1,3,4,6,2', '9', '0', '1556427420', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('3', '', '1556427480', '7,4,2,5,8,1,9,10,6,3', '7', '0', '1556427480', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('4', '', '1556427540', '1,3,7,5,10,9,2,8,4,6', '1', '0', '1556427540', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('5', '', '1556427600', '6,5,7,10,2,4,9,8,1,3', '6', '0', '1556427600', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('6', '', '1556427660', '1,5,10,6,2,3,8,7,9,4', '1', '0', '1556427660', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('7', '', '1556427720', '9,5,6,2,1,3,8,7,10,4', '9', '0', '1556427720', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('8', '', '1556427780', '3,6,1,8,7,5,10,9,2,4', '3', '0', '1556427780', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('9', '', '1556427840', '6,7,9,4,5,8,3,2,10,1', '6', '0', '1556427840', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('10', '', '1556427900', '10,6,4,8,9,3,5,7,1,2', '10', '0', '1556427900', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('11', '', '1556427960', '9,8,10,2,6,3,5,7,1,4', '9', '0', '1556427960', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('12', '', '1556428020', '7,2,5,3,4,6,9,10,1,8', '7', '0', '1556428020', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('13', '', '1556428080', '2,10,5,9,8,7,1,3,6,4', '2', '0', '1556428080', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('14', '', '1556428140', '8,1,7,10,5,3,4,6,9,2', '8', '0', '1556428140', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('15', '', '1556428200', '8,6,9,10,3,5,1,7,4,2', '8', '0', '1556428200', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('16', '', '1556428261', '9,5,8,6,10,3,4,7,2,1', '9', '0', '1556428261', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('17', '', '1556428320', '4,3,6,1,5,10,7,2,8,9', '4', '0', '1556428320', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('18', '', '1556428380', '4,3,1,6,5,2,8,9,10,7', '4', '0', '1556428380', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('19', '', '1556428440', '9,1,3,4,8,10,7,5,6,2', '9', '0', '1556428440', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('20', '', '1556428500', '2,8,10,4,3,1,5,7,6,9', '2', '0', '1556428500', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('21', '', '1556428560', '7,8,1,5,9,3,6,10,4,2', '7', '0', '1556428560', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('22', '', '1556428620', '4,6,8,5,7,2,9,1,3,10', '4', '0', '1556428620', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('23', '', '1556428680', '9,10,8,2,7,4,5,1,3,6', '9', '0', '1556428680', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('24', '', '1556428740', '4,5,3,2,9,10,7,6,1,8', '4', '0', '1556428740', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('25', '', '1556428800', '9,2,10,6,1,3,5,8,4,7', '9', '0', '1556428800', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('26', '', '1556428860', '5,1,7,2,9,8,3,6,10,4', '5', '0', '1556428860', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('27', '', '1556428920', '2,8,1,6,10,3,7,9,4,5', '2', '0', '1556428920', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('28', '', '1556428980', '8,5,6,1,9,10,4,7,3,2', '8', '0', '1556428980', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('29', '', '1556429040', '8,9,6,4,3,7,10,2,1,5', '8', '0', '1556429040', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('30', '', '1556429100', '6,7,4,3,9,8,10,2,5,1', '6', '0', '1556429100', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('31', '', '1556429160', '7,2,5,4,6,8,1,9,10,3', '7', '0', '1556429160', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('32', '', '1556429220', '7,4,1,6,3,2,5,8,10,9', '7', '0', '1556429220', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('33', '', '1556429280', '6,5,4,1,7,3,8,9,10,2', '6', '0', '1556429280', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('34', '', '1556429340', '7,4,3,9,5,2,10,6,1,8', '7', '0', '1556429340', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('35', '', '1556429400', '2,4,5,3,7,6,9,10,1,8', '2', '0', '1556429400', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('36', '', '1556429460', '9,1,7,3,6,8,2,5,10,4', '9', '0', '1556429460', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('37', '', '1556429520', '9,4,10,3,6,2,5,1,8,7', '9', '0', '1556429520', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('38', '', '1556429580', '9,2,7,8,10,5,6,1,4,3', '9', '0', '1556429580', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('39', '', '1556429640', '2,9,6,7,10,1,4,5,8,3', '2', '0', '1556429640', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('40', '', '1556429700', '8,5,4,3,2,7,10,1,9,6', '8', '0', '1556429700', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('41', '', '1556429761', '1,5,8,4,2,10,7,9,6,3', '1', '0', '1556429761', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('42', '', '1556429820', '5,4,6,7,10,8,9,2,3,1', '5', '0', '1556429820', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('43', '', '1556429880', '5,7,6,10,3,8,1,2,4,9', '5', '0', '1556429880', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('44', '', '1556429940', '8,9,1,6,2,3,5,10,4,7', '8', '0', '1556429940', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('45', '', '1556430000', '5,4,2,1,8,7,10,3,6,9', '5', '0', '1556430000', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('46', '', '1556434261', '4,3,1,6,8,9,10,7,2,5', '4', '0', '1556434261', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('47', '', '1556434320', '8,10,1,9,6,7,2,5,3,4', '8', '0', '1556434320', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('48', '', '1556434380', '1,8,10,4,5,7,6,2,9,3', '1', '0', '1556434380', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('49', '', '1556434440', '8,3,2,5,7,6,1,10,4,9', '8', '0', '1556434440', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('50', '', '1556434500', '6,2,4,8,5,3,7,9,10,1', '6', '0', '1556434500', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('51', '', '1556434560', '5,7,3,4,10,6,2,1,9,8', '5', '0', '1556434560', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('52', '', '1556434620', '2,4,1,7,5,8,10,3,9,6', '2', '0', '1556434620', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('53', '', '1556434680', '3,5,2,7,4,6,8,1,9,10', '3', '0', '1556434680', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('54', '', '1556434740', '10,2,9,8,4,7,5,3,6,1', '10', '0', '1556434740', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('55', '', '1556434800', '2,9,4,3,6,8,1,10,7,5', '2', '0', '1556434800', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('56', '', '1556434842', '1,9,7,5,10,6,3,8,4,2', '1', '0', '1556434842', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('57', '', '1556434860', '4,8,7,10,5,6,1,2,9,3', '4', '0', '1556434860', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('58', '', '1556434920', '3,9,5,1,8,7,4,2,10,6', '3', '0', '1556434920', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('59', '', '1556434980', '9,7,10,1,4,2,5,3,6,8', '9', '0', '1556434980', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('60', '', '1556435040', '2,6,4,10,3,9,1,8,7,5', '2', '0', '1556435040', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('61', '', '1556435100', '2,10,1,6,9,5,7,3,4,8', '2', '0', '1556435100', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('62', '', '1556435161', '2,10,1,4,6,7,3,5,9,8', '2', '0', '1556435161', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('63', '', '1556435220', '1,9,5,10,3,4,2,7,8,6', '1', '0', '1556435220', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('64', '', '1556435281', '2,8,10,6,5,3,1,9,4,7', '2', '0', '1556435281', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('65', '', '1556435342', '10,9,5,8,3,2,1,7,6,4', '10', '0', '1556435342', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('66', '', '1556435401', '6,3,4,1,10,8,7,2,5,9', '6', '0', '1556435401', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('67', '', '1556435461', '9,5,4,6,7,8,1,2,3,10', '9', '0', '1556435461', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('68', '', '1556435521', '3,7,5,8,4,9,10,1,6,2', '3', '0', '1556435521', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('69', '', '1556435581', '6,7,3,1,9,10,4,2,5,8', '6', '0', '1556435581', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('70', '', '1556435640', '10,9,5,6,8,1,7,3,2,4', '10', '0', '1556435640', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('71', '', '1556435700', '2,5,7,1,8,10,4,3,9,6', '2', '0', '1556435700', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('72', '', '1556435760', '3,10,5,1,7,6,4,8,2,9', '3', '0', '1556435760', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('73', '', '1556435820', '3,10,1,5,4,7,8,6,2,9', '3', '0', '1556435820', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('74', '', '1556435880', '8,9,10,7,6,1,2,3,4,5', '8', '0', '1556435880', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('75', '', '1556435940', '5,6,9,1,4,10,8,7,3,2', '5', '0', '1556435940', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('76', '', '1556436000', '3,8,5,1,7,6,10,2,4,9', '3', '0', '1556436000', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('77', '', '1556436066', '3,10,8,6,9,1,7,2,5,4', '3', '0', '1556436066', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('78', '', '1556436134', '7,5,9,4,8,3,10,6,2,1', '7', '0', '1556436134', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('79', '', '1556436180', '3,7,9,1,8,2,5,6,10,4', '3', '0', '1556436180', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('80', '', '1556436240', '5,4,9,3,2,7,1,10,8,6', '5', '0', '1556436240', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('81', '', '1556436300', '7,2,9,3,5,8,6,4,10,1', '7', '0', '1556436300', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('82', '', '1556436360', '9,7,8,6,5,3,4,10,2,1', '9', '0', '1556436360', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('83', '', '1556436420', '6,7,8,3,1,9,5,10,4,2', '6', '0', '1556436420', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('84', '', '1556436480', '6,2,7,4,10,5,8,9,1,3', '6', '0', '1556436480', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('85', '', '1556436540', '9,10,2,4,7,5,3,8,1,6', '9', '0', '1556436540', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('86', '', '1556436600', '1,9,5,6,4,10,3,2,7,8', '1', '0', '1556436600', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('87', '', '1556436660', '10,5,6,2,1,4,8,9,3,7', '10', '0', '1556436660', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('88', '', '1556436722', '2,6,8,4,1,7,5,3,9,10', '2', '0', '1556436722', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('89', '', '1556436780', '4,8,10,3,2,9,5,7,1,6', '4', '0', '1556436780', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('90', '', '1556436840', '5,10,8,4,3,6,9,7,2,1', '5', '0', '1556436840', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('91', '', '1556436900', '3,9,8,1,2,7,5,6,10,4', '3', '0', '1556436900', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('92', '', '1556436960', '6,7,2,5,10,1,4,8,3,9', '6', '0', '1556436960', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('93', '', '1556437020', '6,3,7,2,4,8,10,1,5,9', '6', '0', '1556437020', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('94', '', '1556437080', '5,7,9,4,2,1,3,8,6,10', '5', '0', '1556437080', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('95', '', '1556437140', '2,5,7,6,8,10,4,9,1,3', '2', '0', '1556437140', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('96', '', '1556437200', '6,10,2,7,9,5,4,8,1,3', '6', '0', '1556437200', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('97', '', '1556437260', '5,8,3,10,6,2,1,9,4,7', '5', '0', '1556437260', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('98', '', '1556437322', '4,7,8,3,2,6,9,5,10,1', '4', '0', '1556437322', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('99', '', '1556437381', '8,5,3,10,9,4,6,7,1,2', '8', '0', '1556437381', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('100', '', '1556437440', '4,9,6,5,7,2,8,3,1,10', '4', '0', '1556437440', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('101', '', '1556437500', '1,2,9,7,4,8,3,6,5,10', '1', '0', '1556437500', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('102', '', '1556437560', '3,1,10,2,5,4,9,7,6,8', '3', '0', '1556437560', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('103', '', '1556437620', '8,2,5,10,9,6,1,4,7,3', '8', '0', '1556437620', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('104', '', '1556437680', '5,4,8,10,3,2,1,7,9,6', '5', '0', '1556437680', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('105', '', '1556437741', '7,1,4,10,6,3,8,2,9,5', '7', '0', '1556437741', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('106', '', '1556437800', '5,8,4,10,3,9,2,6,7,1', '5', '0', '1556437800', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('107', '', '1556437861', '9,8,5,2,4,10,7,1,3,6', '9', '0', '1556437861', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('108', '', '1556437920', '5,4,10,1,3,6,8,9,7,2', '5', '0', '1556437920', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('109', '', '1556437980', '1,4,7,9,10,2,3,6,5,8', '1', '0', '1556437980', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('110', '', '1556438040', '8,7,2,6,10,5,4,1,9,3', '8', '0', '1556438040', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('111', '', '1556438100', '6,7,3,8,9,10,1,5,4,2', '6', '0', '1556438100', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('112', '', '1556438160', '5,7,6,1,3,8,4,2,9,10', '5', '0', '1556438160', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('113', '', '1556438220', '9,2,4,3,10,6,1,8,5,7', '9', '0', '1556438220', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('114', '', '1556438280', '2,4,9,1,8,10,5,7,6,3', '2', '0', '1556438280', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('115', '', '1556438340', '1,7,8,6,2,10,9,3,4,5', '1', '0', '1556438340', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('116', '', '1556438400', '2,8,10,9,4,7,3,6,1,5', '2', '0', '1556438400', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('117', '', '1556438460', '5,7,9,10,3,2,1,4,8,6', '5', '0', '1556438460', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('118', '', '1556438520', '4,9,1,8,3,10,7,6,5,2', '4', '0', '1556438520', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('119', '', '1556438581', '2,4,8,5,10,9,6,1,7,3', '2', '0', '1556438581', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('120', '', '1556438640', '4,7,1,10,9,5,6,3,8,2', '4', '0', '1556438640', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('121', '', '1556438700', '3,7,10,5,2,4,8,9,6,1', '3', '0', '1556438700', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('122', '', '1556438761', '9,4,3,8,10,2,6,7,1,5', '9', '0', '1556438761', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('123', '', '1556438820', '1,9,2,10,7,4,5,6,8,3', '1', '0', '1556438820', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('124', '', '1556438880', '6,2,9,10,3,5,8,4,7,1', '6', '0', '1556438880', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('125', '', '1556438941', '2,5,8,6,1,9,7,10,4,3', '2', '0', '1556438941', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('126', '', '1556439000', '2,3,7,1,4,10,6,5,8,9', '2', '0', '1556439000', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('127', '', '1556439060', '8,1,7,2,10,6,9,3,4,5', '8', '0', '1556439060', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('128', '', '1556439120', '4,10,2,9,6,3,1,5,7,8', '4', '0', '1556439120', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('129', '', '1556439180', '6,3,9,4,7,1,5,2,10,8', '6', '0', '1556439180', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('130', '', '1556439240', '6,1,3,4,2,9,5,10,8,7', '6', '0', '1556439240', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('131', '', '1556439300', '10,6,5,2,3,1,7,8,9,4', '10', '0', '1556439300', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('132', '', '1556439360', '9,1,3,6,7,8,5,10,4,2', '9', '0', '1556439360', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('133', '', '1556439420', '4,3,9,5,2,6,8,1,10,7', '4', '0', '1556439420', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('134', '', '1556439481', '8,3,9,5,7,6,2,1,4,10', '8', '0', '1556439481', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('135', '', '1556439540', '8,5,1,6,3,2,10,7,4,9', '8', '0', '1556439540', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('136', '', '1556439600', '9,5,10,3,7,8,2,4,1,6', '9', '0', '1556439600', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('137', '', '1556439660', '7,2,4,1,10,3,5,8,6,9', '7', '0', '1556439660', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('138', '', '1556439720', '3,4,5,10,8,6,1,2,9,7', '3', '0', '1556439720', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('139', '', '1556439780', '6,2,3,5,4,8,9,7,10,1', '6', '0', '1556439780', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('140', '', '1556439840', '9,7,2,3,10,4,8,6,1,5', '9', '0', '1556439840', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('141', '', '1556439900', '7,10,1,4,3,6,9,5,2,8', '7', '0', '1556439900', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('142', '', '1556439960', '4,8,3,6,10,5,7,9,2,1', '4', '0', '1556439960', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('143', '', '1556440020', '3,7,9,6,4,8,5,2,10,1', '3', '0', '1556440020', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('144', '', '1556440081', '7,4,1,8,5,3,9,10,6,2', '7', '0', '1556440081', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('145', '', '1556440140', '6,3,7,2,8,10,1,9,5,4', '6', '0', '1556440140', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('146', '', '1556440200', '10,7,5,6,4,3,9,1,8,2', '10', '0', '1556440200', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('147', '', '1556440261', '3,5,1,7,2,4,9,10,6,8', '3', '0', '1556440261', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('148', '', '1556440320', '10,7,5,6,3,2,4,9,8,1', '10', '0', '1556440320', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('149', '', '1556440380', '7,9,4,5,2,6,3,8,10,1', '7', '0', '1556440380', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('150', '', '1556440440', '6,9,10,5,3,7,1,2,8,4', '6', '0', '1556440440', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('151', '', '1556440500', '9,6,2,1,8,4,10,7,3,5', '9', '0', '1556440500', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('152', '', '1556440560', '7,8,2,4,6,10,3,1,9,5', '7', '0', '1556440560', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('153', '', '1556440620', '3,10,2,4,5,9,1,6,7,8', '3', '0', '1556440620', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('154', '', '1556440680', '1,9,8,4,10,3,2,5,6,7', '1', '0', '1556440680', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('155', '', '1556440740', '10,2,5,7,1,4,6,9,3,8', '10', '0', '1556440740', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('156', '', '1556440800', '4,2,10,5,7,6,3,9,8,1', '4', '0', '1556440800', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('157', '', '1556440860', '10,4,1,3,7,6,8,5,9,2', '10', '0', '1556440860', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('158', '', '1556440921', '9,2,3,6,8,10,1,4,7,5', '9', '0', '1556440921', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('159', '', '1556440980', '5,9,1,4,8,2,7,10,6,3', '5', '0', '1556440980', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('160', '', '1556441040', '1,7,4,5,10,2,8,6,9,3', '1', '0', '1556441040', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('161', '', '1556441100', '5,1,10,7,9,3,8,2,6,4', '5', '0', '1556441100', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('162', '', '1556441161', '9,1,5,10,2,4,6,3,7,8', '9', '0', '1556441161', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('163', '', '1556441220', '9,10,3,1,6,5,4,8,7,2', '9', '0', '1556441220', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('164', '', '1556441280', '9,3,5,6,4,2,8,7,10,1', '9', '0', '1556441280', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('165', '', '1556441340', '6,8,7,9,1,4,5,10,2,3', '6', '0', '1556441340', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('166', '', '1556441400', '4,6,10,8,3,7,5,1,2,9', '4', '0', '1556441400', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('167', '', '1556441460', '7,9,10,2,5,4,3,8,1,6', '7', '0', '1556441460', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('168', '', '1556441521', '5,7,3,4,6,1,9,10,8,2', '5', '0', '1556441521', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('169', '', '1556441580', '2,6,9,7,3,8,5,10,4,1', '2', '0', '1556441580', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('170', '', '1556441640', '6,8,1,10,7,3,5,9,4,2', '6', '0', '1556441640', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('171', '', '1556441700', '2,4,6,7,8,9,5,1,10,3', '2', '0', '1556441700', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('172', '', '1556441760', '9,1,7,5,10,2,6,4,3,8', '9', '0', '1556441760', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('173', '', '1556441820', '5,8,3,7,1,2,4,6,10,9', '5', '0', '1556441820', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('174', '', '1556441880', '9,7,4,2,6,1,3,5,8,10', '9', '0', '1556441880', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('175', '', '1556441940', '7,8,4,5,10,1,2,3,6,9', '7', '0', '1556441940', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('176', '', '1556442000', '8,7,4,2,3,9,1,5,10,6', '8', '0', '1556442000', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('177', '', '1556442060', '6,9,3,8,2,4,7,5,1,10', '6', '0', '1556442060', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('178', '', '1556442120', '6,3,7,1,10,2,9,4,5,8', '6', '0', '1556442120', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('179', '', '1556442180', '8,4,1,9,5,7,3,10,6,2', '8', '0', '1556442180', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('180', '', '1556442240', '7,4,10,8,9,3,1,2,6,5', '7', '0', '1556442240', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('181', '', '1556442300', '4,3,9,8,2,6,1,5,10,7', '4', '0', '1556442300', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('182', '', '1556442360', '1,2,4,9,10,7,5,8,6,3', '1', '0', '1556442360', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('183', '', '1556442420', '1,2,3,4,9,10,5,6,8,7', '1', '0', '1556442420', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('184', '', '1556442480', '7,6,3,9,1,5,4,10,2,8', '7', '0', '1556442480', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('185', '', '1556442540', '1,5,4,9,8,10,7,2,6,3', '1', '0', '1556442540', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('186', '', '1556442600', '2,9,5,8,7,1,3,4,6,10', '2', '0', '1556442600', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('187', '', '1556442661', '5,7,3,8,1,6,4,9,10,2', '5', '0', '1556442661', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('188', '', '1556442720', '5,3,8,10,2,6,1,4,9,7', '5', '0', '1556442720', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('189', '', '1556442780', '2,6,10,7,4,8,5,3,1,9', '2', '0', '1556442780', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('190', '', '1556442840', '3,8,4,7,10,9,6,1,2,5', '3', '0', '1556442840', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('191', '', '1556442900', '10,5,7,8,1,6,4,2,9,3', '10', '0', '1556442900', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('192', '', '1556442961', '10,4,7,9,6,2,5,3,1,8', '10', '0', '1556442961', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('193', '', '1556443020', '5,6,3,4,9,2,10,8,1,7', '5', '0', '1556443020', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('194', '', '1556443080', '2,7,3,8,4,5,1,10,6,9', '2', '0', '1556443080', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('195', '', '1556443140', '5,10,7,6,9,2,1,8,4,3', '5', '0', '1556443140', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('196', '', '1556443200', '4,6,10,2,7,9,8,5,3,1', '4', '0', '1556443200', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('197', '', '1556443260', '4,8,6,3,1,9,5,2,10,7', '4', '0', '1556443260', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('198', '', '1556443321', '10,7,4,1,2,5,6,3,9,8', '10', '0', '1556443321', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('199', '', '1556443381', '3,4,9,6,7,2,10,1,8,5', '3', '0', '1556443381', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('200', '', '1556443440', '1,6,10,2,9,5,3,4,7,8', '1', '0', '1556443440', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('201', '', '1556443500', '10,5,6,4,7,1,8,3,9,2', '10', '0', '1556443500', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('202', '', '1556443562', '1,7,4,6,10,2,9,8,5,3', '1', '0', '1556443562', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('203', '', '1556443620', '5,9,7,10,1,8,4,6,2,3', '5', '0', '1556443620', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('204', '', '1556443680', '8,1,6,5,2,3,7,10,4,9', '8', '0', '1556443680', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('205', '', '1556443740', '3,8,2,4,6,9,5,1,10,7', '3', '0', '1556443740', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('206', '', '1556443800', '3,8,5,10,1,9,4,7,6,2', '3', '0', '1556443800', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('207', '', '1556443860', '7,6,9,10,8,4,2,3,1,5', '7', '0', '1556443860', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('208', '', '1556443920', '1,3,9,2,4,8,10,5,6,7', '1', '0', '1556443920', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('209', '', '1556443980', '2,1,5,6,7,10,8,3,4,9', '2', '0', '1556443980', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('210', '', '1556450706', '2,3,5,1,9,7,10,8,6,4', '2', '0', '1556450706', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('211', '', '1556450760', '6,5,10,8,4,1,9,7,3,2', '6', '0', '1556450760', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('212', '', '1556450820', '6,7,1,10,5,3,9,2,8,4', '6', '0', '1556450820', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('213', '', '1556450880', '2,6,4,7,1,3,5,8,9,10', '2', '0', '1556450880', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('214', '', '1556450940', '1,2,6,7,5,3,10,4,8,9', '1', '0', '1556450940', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('215', '', '1556451000', '9,4,8,1,6,7,2,5,3,10', '9', '0', '1556451000', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('216', '', '1556451060', '10,2,7,6,9,3,5,4,1,8', '10', '0', '1556451060', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('217', '', '1556451120', '5,2,8,4,10,3,6,7,1,9', '5', '0', '1556451120', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('218', '', '1556451181', '1,5,7,9,4,2,3,6,8,10', '1', '0', '1556451181', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('219', '', '1556451241', '10,1,3,6,2,4,9,8,7,5', '10', '0', '1556451241', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('220', '', '1556451295', '1,8,7,10,2,9,4,3,6,5', '1', '0', '1556451295', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('221', '', '1556451300', '10,9,2,1,4,8,7,5,6,3', '10', '0', '1556451300', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('222', '', '1556451361', '8,9,10,2,6,7,1,4,5,3', '8', '0', '1556451361', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('223', '', '1556451420', '8,7,5,4,2,10,9,1,3,6', '8', '0', '1556451420', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('224', '', '1556451480', '3,6,1,9,8,10,4,5,7,2', '3', '0', '1556451480', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('225', '', '1556451540', '6,1,10,7,8,5,3,4,2,9', '6', '0', '1556451540', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('226', '', '1556451600', '2,10,1,3,5,9,8,7,6,4', '2', '0', '1556451600', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('227', '', '1556451660', '3,5,1,4,7,9,2,6,10,8', '3', '0', '1556451660', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('228', '', '1556451720', '2,4,8,10,1,3,9,5,7,6', '2', '0', '1556451720', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('229', '', '1556451780', '2,10,3,4,1,8,6,9,7,5', '2', '0', '1556451780', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('230', '', '1556451840', '7,8,9,2,10,1,3,5,6,4', '7', '0', '1556451840', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('231', '', '1556451901', '2,3,10,4,7,5,9,1,8,6', '2', '0', '1556451901', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('232', '', '1556451960', '6,3,4,10,5,9,1,8,7,2', '6', '0', '1556451960', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('233', '', '1556452020', '4,6,2,1,3,5,8,7,10,9', '4', '0', '1556452020', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('234', '', '1556452080', '8,5,7,4,2,10,9,6,1,3', '8', '0', '1556452080', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('235', '', '1556452140', '3,9,5,10,6,8,2,1,4,7', '3', '0', '1556452140', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('236', '', '1556452200', '1,5,2,6,4,9,8,3,10,7', '1', '0', '1556452200', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('237', '', '1556452260', '2,3,10,9,4,6,7,8,5,1', '2', '0', '1556452260', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('238', '', '1556452320', '8,2,10,7,4,9,6,1,3,5', '8', '0', '1556452320', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('239', '', '1556452380', '2,10,8,5,4,7,3,6,9,1', '2', '0', '1556452380', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('240', '', '1556452441', '1,9,4,5,10,8,2,3,7,6', '1', '0', '1556452441', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('241', '', '1556452501', '6,4,5,8,9,7,3,1,10,2', '6', '0', '1556452501', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('242', '', '1556452560', '10,4,9,7,5,1,8,3,6,2', '10', '0', '1556452560', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('243', '', '1556452620', '3,9,2,1,6,7,5,4,8,10', '3', '0', '1556452620', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('244', '', '1556452680', '10,4,1,7,8,3,6,2,9,5', '10', '0', '1556452680', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('245', '', '1556452740', '10,9,2,1,7,4,5,8,6,3', '10', '0', '1556452740', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('246', '', '1556452800', '6,1,7,4,3,8,9,5,2,10', '6', '0', '1556452800', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('247', '', '1556452860', '4,10,1,9,5,8,2,6,3,7', '4', '0', '1556452860', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('248', '', '1556452920', '7,1,8,6,9,4,5,10,2,3', '7', '0', '1556452920', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('249', '', '1556452980', '8,7,5,6,3,4,2,1,9,10', '8', '0', '1556452980', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('250', '', '1556453040', '6,5,9,3,2,4,8,10,7,1', '6', '0', '1556453040', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('251', '', '1556453100', '10,5,7,9,8,2,1,4,3,6', '10', '0', '1556453100', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('252', '', '1556453160', '6,1,7,9,4,3,2,8,5,10', '6', '0', '1556453160', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('253', '', '1556453220', '4,1,10,6,5,2,7,8,3,9', '4', '0', '1556453220', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('254', '', '1556453280', '6,3,8,4,2,5,9,10,7,1', '6', '0', '1556453280', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('255', '', '1556453340', '10,8,3,7,9,6,1,5,2,4', '10', '0', '1556453340', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('256', '', '1556453400', '8,6,10,7,3,9,4,2,5,1', '8', '0', '1556453400', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('257', '', '1556453461', '2,5,10,9,8,3,1,7,6,4', '2', '0', '1556453461', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('258', '', '1556453520', '4,1,6,5,10,2,3,8,9,7', '4', '0', '1556453520', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('259', '', '1556453580', '10,2,9,3,7,6,1,5,8,4', '10', '0', '1556453580', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('260', '', '1556453640', '7,6,2,9,4,1,3,10,5,8', '7', '0', '1556453640', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('261', '', '1556453700', '5,2,4,10,9,8,6,1,7,3', '5', '0', '1556453700', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('262', '', '1556453760', '1,4,8,9,3,7,6,2,10,5', '1', '0', '1556453760', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('263', '', '1556453820', '6,10,5,1,7,9,3,2,8,4', '6', '0', '1556453820', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('264', '', '1556453880', '8,2,10,6,7,3,1,9,5,4', '8', '0', '1556453880', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('265', '', '1556453941', '7,6,10,9,4,3,5,1,2,8', '7', '0', '1556453941', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('266', '', '1556454000', '9,5,1,6,4,7,2,10,3,8', '9', '0', '1556454000', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('267', '', '1556454061', '7,6,3,5,8,2,4,1,9,10', '7', '0', '1556454061', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('268', '', '1556454120', '9,6,2,5,10,3,1,8,7,4', '9', '0', '1556454120', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('269', '', '1556454180', '8,1,10,2,7,5,9,3,4,6', '8', '0', '1556454180', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('270', '', '1556454240', '10,9,2,7,8,4,3,6,5,1', '10', '0', '1556454240', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('271', '', '1556454300', '6,9,5,2,3,8,1,10,4,7', '6', '0', '1556454300', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('272', '', '1556454360', '3,5,2,9,7,6,1,8,10,4', '3', '0', '1556454360', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('273', '', '1556454420', '7,9,3,6,4,1,5,2,8,10', '7', '0', '1556454420', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('274', '', '1556454480', '2,1,8,5,6,7,10,3,4,9', '2', '0', '1556454480', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('275', '', '1556454540', '6,1,5,10,8,3,9,7,2,4', '6', '0', '1556454540', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('276', '', '1556454600', '6,1,9,10,4,7,3,2,5,8', '6', '0', '1556454600', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('277', '', '1556454660', '7,6,5,3,4,1,9,8,2,10', '7', '0', '1556454660', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('278', '', '1556454720', '3,5,4,6,8,2,9,1,7,10', '3', '0', '1556454720', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('279', '', '1556454780', '9,8,5,7,4,3,1,10,6,2', '9', '0', '1556454780', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('280', '', '1556454840', '2,4,10,7,5,1,3,6,9,8', '2', '0', '1556454840', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('281', '', '1556454900', '5,10,8,1,3,6,4,9,7,2', '5', '0', '1556454900', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('282', '', '1556454960', '9,4,3,10,6,7,2,5,8,1', '9', '0', '1556454960', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('283', '', '1556455020', '5,3,8,2,7,6,10,4,1,9', '5', '0', '1556455020', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('284', '', '1556455080', '5,3,10,2,1,4,8,6,7,9', '5', '0', '1556455080', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('285', '', '1556455140', '2,4,8,5,6,3,10,1,7,9', '2', '0', '1556455140', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('286', '', '1556455200', '7,4,5,3,1,9,10,6,2,8', '7', '0', '1556455200', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('287', '', '1556455260', '8,3,9,6,5,4,7,10,2,1', '8', '0', '1556455260', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('288', '', '1556455320', '3,5,2,9,6,7,8,1,10,4', '3', '0', '1556455320', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('289', '', '1556455380', '4,7,10,2,3,5,8,6,1,9', '4', '0', '1556455380', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('290', '', '1556455440', '10,9,4,6,5,8,7,2,3,1', '10', '0', '1556455440', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('291', '', '1556455500', '2,6,9,7,4,1,5,3,8,10', '2', '0', '1556455500', null, '2', '', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('292', '', '1556455560', '7,6,1,2,9,8,3,4,10,5', '7', '0', '1556455560', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('293', '', '1556455620', '5,3,2,4,8,10,6,1,7,9', '5', '0', '1556455620', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('294', '', '1556455680', '8,1,7,3,6,10,5,9,4,2', '8', '100', '1556455680', null, '2', '', '1', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('295', '', '1556455740', '4,3,1,5,6,9,2,10,8,7', '4', '0', '1556455740', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('296', '', '1556455800', '6,1,5,4,8,2,7,3,9,10', '6', '100', '1556455800', null, '2', '', '1', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('297', '', '1556455861', '6,5,4,7,8,9,10,1,3,2', '6', '0', '1556455861', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('298', '', '1556455920', '1,4,8,2,6,5,10,3,7,9', '1', '0', '1556455920', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('299', '', '1556455980', '6,5,10,7,9,8,1,3,2,4', '6', '0', '1556455980', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('300', '', '1556456040', '3,2,9,4,1,10,5,8,7,6', '3', '0', '1556456040', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('301', '', '1556456100', '10,3,4,9,2,8,1,6,7,5', '10', '0', '1556456100', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('302', '', '1556456160', '9,3,8,5,7,6,2,1,4,10', '9', '0', '1556456160', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('303', '', '1556456220', '7,9,6,2,10,8,5,1,4,3', '7', '0', '1556456220', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('304', '', '1556456280', '8,7,4,3,1,6,9,10,2,5', '8', '0', '1556456280', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('305', '', '1556456340', '6,5,9,3,8,4,10,2,7,1', '6', '0', '1556456340', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('306', '', '1556456400', '1,4,3,10,6,2,7,9,5,8', '1', '0', '1556456400', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('307', '', '1556456460', '5,6,2,7,3,4,10,9,8,1', '5', '0', '1556456460', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('308', '', '1556456520', '1,3,6,8,9,4,7,2,5,10', '1', '0', '1556456520', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('309', '', '1556456580', '5,10,7,4,6,3,9,2,8,1', '5', '0', '1556456580', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('310', '', '1556456640', '2,5,3,9,10,7,6,1,4,8', '2', '0', '1556456640', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('311', '', '1556456700', '1,7,3,4,6,9,2,8,5,10', '1', '0', '1556456700', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('312', '', '1556456760', '6,10,3,4,9,5,1,7,8,2', '6', '0', '1556456760', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('313', '', '1556456821', '3,4,1,6,5,8,9,10,2,7', '3', '0', '1556456821', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('314', '', '1556456880', '7,5,6,8,1,2,4,9,10,3', '7', '0', '1556456880', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('315', '', '1556456940', '6,5,2,7,1,9,3,4,10,8', '6', '0', '1556456940', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('316', '', '1556457000', '7,10,9,6,2,4,5,3,1,8', '7', '0', '1556457000', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('317', '', '1556457060', '3,9,8,2,4,1,5,6,7,10', '3', '0', '1556457060', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('318', '', '1556457120', '6,1,2,5,9,3,7,10,4,8', '6', '0', '1556457120', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('319', '', '1556457180', '5,2,6,10,9,7,3,8,4,1', '5', '0', '1556457180', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('320', '', '1556457240', '2,1,8,9,7,4,5,10,6,3', '2', '0', '1556457240', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('321', '', '1556457300', '1,9,8,6,3,7,2,4,5,10', '1', '0', '1556457300', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('322', '', '1556457360', '3,10,9,5,8,1,2,6,7,4', '3', '0', '1556457360', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('323', '', '1556457420', '8,7,10,1,2,5,6,9,3,4', '8', '0', '1556457420', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('324', '', '1556457480', '8,5,2,3,9,6,4,1,7,10', '8', '0', '1556457480', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('325', '', '1556457540', '2,7,3,6,1,4,5,9,10,8', '2', '0', '1556457540', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('326', '', '1556457601', '1,8,3,2,4,5,9,7,6,10', '1', '0', '1556457601', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('327', '', '1556457660', '9,4,3,8,1,6,2,7,5,10', '9', '0', '1556457660', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('328', '', '1556457720', '8,5,3,10,9,4,7,6,2,1', '8', '0', '1556457720', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('329', '', '1556457780', '2,5,3,6,10,7,4,1,8,9', '2', '250', '1556457780', null, '2', '', '1', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('330', '', '1556457840', '6,7,10,3,5,4,1,2,9,8', '6', '0', '1556457840', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('331', '', '1556457900', '3,7,5,8,9,4,6,1,2,10', '3', '0', '1556457900', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('332', '', '1556457960', '4,5,10,3,9,6,1,8,7,2', '4', '0', '1556457960', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('333', '', '1556458020', '6,5,9,8,1,2,7,10,4,3', '6', '0', '1556458020', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('334', '', '1556458080', '10,3,9,7,4,6,1,8,2,5', '10', '0', '1556458080', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('335', '', '1556458140', '6,8,5,9,10,7,1,2,3,4', '6', '0', '1556458140', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('336', '', '1556458200', '9,7,5,4,3,2,6,8,10,1', '9', '0', '1556458200', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('337', '', '1556458260', '6,9,5,7,1,4,2,3,8,10', '6', '0', '1556458260', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('338', '', '1556458320', '7,3,1,9,5,2,10,6,8,4', '7', '0', '1556458320', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('339', '', '1556458380', '5,3,9,8,6,7,2,4,1,10', '5', '0', '1556458380', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('340', '', '1556458440', '10,7,1,2,8,6,4,3,9,5', '10', '0', '1556458440', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('341', '', '1556458501', '8,2,4,5,6,10,3,9,1,7', '8', '0', '1556458501', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('342', '', '1556458561', '10,3,8,2,4,5,7,9,6,1', '10', '0', '1556458561', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('343', '', '1556458620', '4,9,5,2,8,6,3,10,7,1', '4', '0', '1556458620', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('344', '', '1556458680', '1,7,9,4,8,5,3,10,2,6', '1', '0', '1556458680', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('345', '', '1556458740', '10,8,4,9,7,1,5,6,3,2', '10', '0', '1556458740', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('346', '', '1556458800', '9,10,8,7,3,2,5,4,6,1', '9', '0', '1556458800', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('347', '', '1556458861', '1,9,4,6,5,2,3,10,7,8', '1', '0', '1556458861', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('348', '', '1556458920', '2,6,7,5,3,1,4,9,10,8', '2', '0', '1556458920', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('349', '', '1556458980', '4,10,5,1,3,2,8,9,6,7', '4', '0', '1556458980', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('350', '', '1556459040', '6,4,2,9,7,1,3,8,10,5', '6', '0', '1556459040', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('351', '', '1556459100', '7,10,9,8,1,4,3,6,5,2', '7', '0', '1556459100', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('352', '', '1556459160', '6,2,3,9,7,5,8,4,1,10', '6', '0', '1556459160', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('353', '', '1556459220', '5,8,10,1,4,2,6,7,9,3', '5', '0', '1556459220', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('354', '', '1556459280', '3,1,6,10,5,4,9,2,8,7', '3', '0', '1556459280', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('355', '', '1556459340', '4,3,2,8,1,10,6,9,5,7', '4', '0', '1556459340', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('356', '', '1556459400', '7,4,8,5,6,2,1,9,10,3', '7', '0', '1556459400', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('357', '', '1556459460', '1,2,7,5,3,6,8,10,9,4', '1', '0', '1556459460', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('358', '', '1556459521', '5,10,1,8,4,7,3,6,2,9', '5', '0', '1556459521', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('359', '', '1556459581', '2,5,10,6,1,8,9,3,4,7', '2', '0', '1556459581', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('360', '', '1556459641', '2,9,4,6,10,8,5,3,1,7', '2', '0', '1556459641', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('361', '', '1556459700', '10,9,7,6,2,5,4,1,3,8', '10', '0', '1556459700', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('362', '', '1556459760', '10,8,4,7,1,9,3,2,6,5', '10', '0', '1556459760', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('363', '', '1556459820', '10,2,1,4,8,5,3,9,6,7', '10', '0', '1556459820', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('364', '', '1556459881', '9,2,3,10,6,8,7,4,5,1', '9', '0', '1556459881', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('365', '', '1556459940', '6,3,4,5,1,7,10,9,8,2', '6', '0', '1556459940', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('366', '', '1556460000', '10,9,8,2,4,6,3,1,5,7', '10', '100', '1556460000', null, '2', '', '1', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('367', '', '1556460060', '5,6,3,4,8,2,10,1,9,7', '5', '0', '1556460060', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('368', '', '1556460121', '4,3,10,8,1,5,7,2,9,6', '4', '0', '1556460121', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('369', '', '1556460180', '1,8,2,3,9,6,7,5,10,4', '1', '0', '1556460180', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('370', '', '1556460240', '2,6,1,5,9,3,4,7,8,10', '2', '0', '1556460240', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('371', '', '1556460301', '2,3,4,8,9,10,1,7,5,6', '2', '0', '1556460301', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('372', '', '1556460361', '9,2,1,10,5,6,3,4,8,7', '9', '0', '1556460361', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('373', '', '1556460420', '8,2,5,1,7,6,10,4,9,3', '8', '0', '1556460420', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('374', '', '1556460480', '1,7,2,8,6,10,3,4,5,9', '1', '0', '1556460480', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('375', '', '1556460540', '2,10,3,8,1,6,9,5,7,4', '2', '0', '1556460540', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('376', '', '1556460600', '8,2,1,10,6,5,4,3,7,9', '8', '0', '1556460600', null, '2', '', '0', '0', '{\"f10\":9.98,\"f9\":9.98,\"f8\":9.98,\"f7\":9.98,\"f6\":9.98,\"f5\":9.98,\"f4\":9.98,\"f3\":9.98,\"f2\":9.98,\"f1\":9.98}');
INSERT INTO `hov_game_xy10` VALUES ('377', '', '1556460660', null, null, '0', null, null, '1', 'thisTimes', '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('378', '', '1556460721', null, null, '0', null, null, '1', null, '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('379', '', '1556460780', null, null, '0', null, null, '1', null, '0', '0', '');
INSERT INTO `hov_game_xy10` VALUES ('380', '', '1556460840', null, null, '0', null, null, '1', null, '0', '0', '');

-- ----------------------------
-- Table structure for `hov_game_xy11`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xy11`;
CREATE TABLE `hov_game_xy11` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xy11
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_xy16`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xy16`;
CREATE TABLE `hov_game_xy16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xy16
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_xy22`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xy22`;
CREATE TABLE `hov_game_xy22` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xy22
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_xy28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xy28`;
CREATE TABLE `hov_game_xy28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xy28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_xy36`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xy36`;
CREATE TABLE `hov_game_xy36` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xy36
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_xybjl`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xybjl`;
CREATE TABLE `hov_game_xybjl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11697 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xybjl
-- ----------------------------
INSERT INTO `hov_game_xybjl` VALUES ('11118', '', '1556365800', '{\"banker\":[\"13b\",\"5d\",\"9b\"],\"player\":[\"11b\",\"1b\",\"7a\"]}', 'PLAYER', '0', '1556365800', null, '2', '', '0', '0', '{\"f1\":\"2.2384\",\"f2\":\"2.1753\",\"f3\":\"10.4736\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11119', '', '1556365860', '{\"banker\":[\"6a\",\"9b\",\"1c\"],\"player\":[\"5b\",\"8a\",\"4d\"]}', 'PLAYER', '0', '1556365860', null, '2', '', '0', '0', '{\"f1\":\"2.2398\",\"f2\":\"2.1758\",\"f3\":\"10.4716\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11120', '', '1556365920', '{\"banker\":[\"7a\",\"8b\",\"9b\"],\"player\":[\"1d\",\"5d\"]}', 'PLAYER', '0', '1556365920', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1759\",\"f3\":\"10.4768\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11121', '', '1556365980', '{\"banker\":[\"11c\",\"12c\",\"11a\"],\"player\":[\"5d\",\"12b\",\"13c\"]}', 'PLAYER', '0', '1556365980', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1753\",\"f3\":\"10.4935\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11122', '', '1556366040', '{\"banker\":[\"3d\",\"6b\"],\"player\":[\"5d\",\"5c\",\"9b\"]}', 'TIE', '0', '1556366040', null, '2', '', '0', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1765\",\"f3\":\"10.4874\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11123', '', '1556366100', '{\"banker\":[\"6d\",\"5c\",\"2c\"],\"player\":[\"13b\",\"4a\",\"7b\"]}', 'BANKER', '0', '1556366100', null, '2', '', '0', '0', '{\"f1\":\"2.2366\",\"f2\":\"2.1791\",\"f3\":\"10.4866\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11124', '', '1556366160', '{\"banker\":[\"8b\",\"3b\",\"11a\"],\"player\":[\"11c\",\"12d\",\"4c\"]}', 'PLAYER', '0', '1556366160', null, '2', '', '0', '0', '{\"f1\":\"2.2392\",\"f2\":\"2.1763\",\"f3\":\"10.4887\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11125', '', '1556366220', '{\"banker\":[\"3b\",\"1d\",\"11d\"],\"player\":[\"3b\",\"8a\",\"2c\"]}', 'BANKER', '0', '1556366220', null, '2', '', '0', '0', '{\"f1\":\"2.2387\",\"f2\":\"2.1791\",\"f3\":\"10.4894\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11126', '', '1556366280', '{\"banker\":[\"1a\",\"7a\"],\"player\":[\"9c\",\"6b\",\"2c\"]}', 'BANKER', '300', '1556366280', null, '2', '', '1', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1781\",\"f3\":\"10.4806\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11127', '', '1556366340', '{\"banker\":[\"4a\",\"13d\",\"9b\"],\"player\":[\"5a\",\"6a\",\"2a\"]}', 'TIE', '0', '1556366340', null, '2', '', '0', '0', '{\"f1\":\"2.2390\",\"f2\":\"2.1778\",\"f3\":\"10.4882\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11128', '', '1556366400', '{\"banker\":[\"7a\",\"7d\"],\"player\":[\"6b\",\"6b\",\"10a\"]}', 'BANKER', '195', '1556366400', null, '2', '', '1', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1798\",\"f3\":\"10.4933\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11129', '', '1556366460', '{\"banker\":[\"10b\",\"13a\",\"2b\"],\"player\":[\"11b\",\"9d\"]}', 'PLAYER', '0', '1556366460', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1785\",\"f3\":\"10.4843\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11130', '', '1556366520', '{\"banker\":[\"4d\",\"5d\"],\"player\":[\"13a\",\"7a\"]}', 'BANKER', '0', '1556366520', null, '2', '', '0', '0', '{\"f1\":\"2.2395\",\"f2\":\"2.1761\",\"f3\":\"10.4712\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11131', '', '1556366580', '{\"banker\":[\"3a\",\"3b\"],\"player\":[\"6b\",\"12a\"]}', 'TIE', '300', '1556366580', null, '2', '', '1', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1750\",\"f3\":\"10.4837\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11132', '', '1556366640', '{\"banker\":[\"5b\",\"1d\"],\"player\":[\"3a\",\"12d\",\"3a\"]}', 'TIE', '0', '1556366640', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1764\",\"f3\":\"10.4934\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11133', '', '1556366700', '{\"banker\":[\"9c\",\"5a\",\"3d\"],\"player\":[\"2b\",\"7a\"]}', 'PLAYER', '0', '1556366700', null, '2', '', '0', '0', '{\"f1\":\"2.2381\",\"f2\":\"2.1787\",\"f3\":\"10.4831\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11134', '', '1556366760', '{\"banker\":[\"9b\",\"5c\",\"8b\"],\"player\":[\"6d\",\"12b\"]}', 'PLAYER', '0', '1556366760', null, '2', '', '0', '0', '{\"f1\":\"2.2352\",\"f2\":\"2.1799\",\"f3\":\"10.4818\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11135', '', '1556366820', '{\"banker\":[\"4d\",\"13b\"],\"player\":[\"12a\",\"3a\",\"8c\"]}', 'BANKER', '0', '1556366820', null, '2', '', '0', '0', '{\"f1\":\"2.2352\",\"f2\":\"2.1794\",\"f3\":\"10.4742\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11136', '', '1556366880', '{\"banker\":[\"4b\",\"8a\",\"12d\"],\"player\":[\"7d\",\"2c\"]}', 'PLAYER', '0', '1556366880', null, '2', '', '0', '0', '{\"f1\":\"2.2370\",\"f2\":\"2.1754\",\"f3\":\"10.4781\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11137', '', '1556366940', '{\"banker\":[\"7d\",\"9c\"],\"player\":[\"11b\",\"7a\"]}', 'PLAYER', '0', '1556366940', null, '2', '', '0', '0', '{\"f1\":\"2.2378\",\"f2\":\"2.1788\",\"f3\":\"10.4787\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11138', '', '1556367000', '{\"banker\":[\"8a\",\"9b\"],\"player\":[\"12c\",\"13a\",\"1d\"]}', 'BANKER', '0', '1556367000', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1784\",\"f3\":\"10.4905\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11139', '', '1556367060', '{\"banker\":[\"13c\",\"5b\",\"13a\"],\"player\":[\"6c\",\"12b\"]}', 'PLAYER', '0', '1556367060', null, '2', '', '0', '0', '{\"f1\":\"2.2350\",\"f2\":\"2.1799\",\"f3\":\"10.4734\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11140', '', '1556367120', '{\"banker\":[\"3a\",\"4c\"],\"player\":[\"13c\",\"4c\",\"9d\"]}', 'BANKER', '0', '1556367120', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1769\",\"f3\":\"10.4808\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11141', '', '1556367180', '{\"banker\":[\"6b\",\"4c\",\"1c\"],\"player\":[\"9a\",\"7c\"]}', 'PLAYER', '0', '1556367180', null, '2', '', '0', '0', '{\"f1\":\"2.2377\",\"f2\":\"2.1763\",\"f3\":\"10.4719\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11142', '', '1556367240', '{\"banker\":[\"13a\",\"5b\"],\"player\":[\"1d\",\"13a\",\"11c\"]}', 'BANKER', '0', '1556367240', null, '2', '', '0', '0', '{\"f1\":\"2.2371\",\"f2\":\"2.1775\",\"f3\":\"10.4724\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11143', '', '1556367300', '{\"banker\":[\"12a\",\"11c\",\"4b\"],\"player\":[\"3b\",\"4c\"]}', 'PLAYER', '0', '1556367300', null, '2', '', '0', '0', '{\"f1\":\"2.2368\",\"f2\":\"2.1753\",\"f3\":\"10.4789\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11144', '', '1556367360', '{\"banker\":[\"13d\",\"13a\",\"4d\"],\"player\":[\"10c\",\"12c\",\"9b\"]}', 'PLAYER', '0', '1556367360', null, '2', '', '0', '0', '{\"f1\":\"2.2357\",\"f2\":\"2.1768\",\"f3\":\"10.4821\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11145', '', '1556367420', '{\"banker\":[\"12c\",\"7c\"],\"player\":[\"3c\",\"7a\",\"3c\"]}', 'BANKER', '0', '1556367420', null, '2', '', '0', '0', '{\"f1\":\"2.2395\",\"f2\":\"2.1752\",\"f3\":\"10.4852\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11146', '', '1556367480', '{\"banker\":[\"7a\",\"3d\",\"7b\"],\"player\":[\"5b\",\"4b\"]}', 'PLAYER', '0', '1556367480', null, '2', '', '0', '0', '{\"f1\":\"2.2365\",\"f2\":\"2.1776\",\"f3\":\"10.4839\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11147', '', '1556367540', '{\"banker\":[\"8b\",\"8b\"],\"player\":[\"12d\",\"3d\",\"8a\"]}', 'BANKER', '0', '1556367540', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1772\",\"f3\":\"10.4837\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11148', '', '1556367600', '{\"banker\":[\"4b\",\"2d\"],\"player\":[\"10a\",\"13c\",\"10d\"]}', 'BANKER', '0', '1556367600', null, '2', '', '0', '0', '{\"f1\":\"2.2391\",\"f2\":\"2.1775\",\"f3\":\"10.4794\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11149', '', '1556367660', '{\"banker\":[\"1a\",\"1a\",\"3a\"],\"player\":[\"10a\",\"3a\",\"2a\"]}', 'TIE', '0', '1556367660', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1765\",\"f3\":\"10.4792\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11150', '', '1556367720', '{\"banker\":[\"12c\",\"5d\",\"1a\"],\"player\":[\"10b\",\"9d\"]}', 'PLAYER', '150', '1556367720', null, '2', '', '1', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1760\",\"f3\":\"10.4911\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11151', '', '1556367780', '{\"banker\":[\"10b\",\"1d\",\"11a\"],\"player\":[\"11b\",\"13d\",\"7d\"]}', 'PLAYER', '0', '1556367780', null, '2', '', '0', '0', '{\"f1\":\"2.2395\",\"f2\":\"2.1770\",\"f3\":\"10.4856\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11152', '', '1556367840', '{\"banker\":[\"8d\",\"4c\",\"13c\"],\"player\":[\"9c\",\"11b\"]}', 'PLAYER', '0', '1556367840', null, '2', '', '0', '0', '{\"f1\":\"2.2374\",\"f2\":\"2.1770\",\"f3\":\"10.4777\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11153', '', '1556367900', '{\"banker\":[\"12b\",\"8c\"],\"player\":[\"9a\",\"3a\",\"8a\"]}', 'BANKER', '0', '1556367900', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1768\",\"f3\":\"10.4846\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11154', '', '1556367960', '{\"banker\":[\"1a\",\"5c\"],\"player\":[\"10c\",\"2c\",\"12b\"]}', 'BANKER', '0', '1556367960', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1792\",\"f3\":\"10.4790\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11155', '', '1556368020', '{\"banker\":[\"1d\",\"4c\",\"6a\"],\"player\":[\"7a\",\"11d\"]}', 'PLAYER', '0', '1556368020', null, '2', '', '0', '0', '{\"f1\":\"2.2376\",\"f2\":\"2.1783\",\"f3\":\"10.4720\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11156', '', '1556368080', '{\"banker\":[\"5b\",\"13d\",\"10a\"],\"player\":[\"12b\",\"9b\"]}', 'PLAYER', '0', '1556368080', null, '2', '', '0', '0', '{\"f1\":\"2.2355\",\"f2\":\"2.1753\",\"f3\":\"10.4810\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11157', '', '1556368140', '{\"banker\":[\"2a\",\"11d\",\"1b\"],\"player\":[\"5c\",\"4a\"]}', 'PLAYER', '0', '1556368140', null, '2', '', '0', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1776\",\"f3\":\"10.4715\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11158', '', '1556368200', '{\"banker\":[\"6d\",\"13a\"],\"player\":[\"6b\",\"13a\"]}', 'TIE', '0', '1556368200', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1795\",\"f3\":\"10.4875\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11159', '', '1556368260', '{\"banker\":[\"10c\",\"9b\"],\"player\":[\"6b\",\"10d\"]}', 'BANKER', '0', '1556368260', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1756\",\"f3\":\"10.4888\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11160', '', '1556368320', '{\"banker\":[\"11a\",\"11c\",\"6b\"],\"player\":[\"9b\",\"3b\",\"8c\"]}', 'BANKER', '0', '1556368320', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1759\",\"f3\":\"10.4868\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11161', '', '1556368380', '{\"banker\":[\"7d\",\"3a\",\"13d\"],\"player\":[\"13c\",\"6c\"]}', 'PLAYER', '0', '1556368380', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1791\",\"f3\":\"10.4808\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11162', '', '1556368440', '{\"banker\":[\"3a\",\"2d\"],\"player\":[\"1c\",\"9d\",\"2a\"]}', 'BANKER', '0', '1556368440', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1785\",\"f3\":\"10.4744\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11163', '', '1556368500', '{\"banker\":[\"1d\",\"4d\"],\"player\":[\"9b\",\"5a\",\"9b\"]}', 'BANKER', '0', '1556368500', null, '2', '', '0', '0', '{\"f1\":\"2.2395\",\"f2\":\"2.1763\",\"f3\":\"10.4908\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11164', '', '1556368560', '{\"banker\":[\"4b\",\"9c\",\"10a\"],\"player\":[\"12b\",\"8a\"]}', 'PLAYER', '0', '1556368560', null, '2', '', '0', '0', '{\"f1\":\"2.2380\",\"f2\":\"2.1781\",\"f3\":\"10.4769\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11165', '', '1556368620', '{\"banker\":[\"13a\",\"3a\",\"2b\"],\"player\":[\"8b\",\"1c\"]}', 'PLAYER', '0', '1556368620', null, '2', '', '0', '0', '{\"f1\":\"2.2382\",\"f2\":\"2.1750\",\"f3\":\"10.4747\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11166', '', '1556368680', '{\"banker\":[\"1c\",\"9b\",\"6d\"],\"player\":[\"1b\",\"3d\",\"13c\"]}', 'BANKER', '0', '1556368680', null, '2', '', '0', '0', '{\"f1\":\"2.2372\",\"f2\":\"2.1752\",\"f3\":\"10.4843\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11167', '', '1556368740', '{\"banker\":[\"7d\",\"10a\"],\"player\":[\"6a\",\"7c\",\"13b\"]}', 'BANKER', '0', '1556368740', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1756\",\"f3\":\"10.4787\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11168', '', '1556368800', '{\"banker\":[\"4b\",\"6d\",\"10d\"],\"player\":[\"13d\",\"10b\",\"5d\"]}', 'PLAYER', '0', '1556368800', null, '2', '', '0', '0', '{\"f1\":\"2.2390\",\"f2\":\"2.1755\",\"f3\":\"10.4944\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11169', '', '1556368860', '{\"banker\":[\"12a\",\"12d\",\"11a\"],\"player\":[\"13a\",\"6d\"]}', 'PLAYER', '0', '1556368860', null, '2', '', '0', '0', '{\"f1\":\"2.2391\",\"f2\":\"2.1774\",\"f3\":\"10.4895\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11170', '', '1556368920', '{\"banker\":[\"3a\",\"4c\"],\"player\":[\"8d\",\"2c\",\"5b\"]}', 'BANKER', '0', '1556368920', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1798\",\"f3\":\"10.4806\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11171', '', '1556368980', '{\"banker\":[\"3b\",\"13c\",\"1c\"],\"player\":[\"6c\",\"9a\",\"9b\"]}', 'TIE', '0', '1556368980', null, '2', '', '0', '0', '{\"f1\":\"2.2378\",\"f2\":\"2.1759\",\"f3\":\"10.4950\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11172', '', '1556369040', '{\"banker\":[\"3a\",\"1b\",\"8c\"],\"player\":[\"8d\",\"10d\"]}', 'PLAYER', '0', '1556369040', null, '2', '', '0', '0', '{\"f1\":\"2.2355\",\"f2\":\"2.1752\",\"f3\":\"10.4819\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11173', '', '1556369100', '{\"banker\":[\"5a\",\"11b\",\"3a\"],\"player\":[\"10c\",\"7c\"]}', 'BANKER', '0', '1556369100', null, '2', '', '0', '0', '{\"f1\":\"2.2376\",\"f2\":\"2.1754\",\"f3\":\"10.4842\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11174', '', '1556369160', '{\"banker\":[\"6d\",\"3b\"],\"player\":[\"6d\",\"13c\"]}', 'BANKER', '0', '1556369160', null, '2', '', '0', '0', '{\"f1\":\"2.2379\",\"f2\":\"2.1790\",\"f3\":\"10.4825\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11175', '', '1556369220', '{\"banker\":[\"9a\",\"10b\"],\"player\":[\"9a\",\"1d\",\"10c\"]}', 'BANKER', '0', '1556369220', null, '2', '', '0', '0', '{\"f1\":\"2.2374\",\"f2\":\"2.1794\",\"f3\":\"10.4919\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11176', '', '1556369280', '{\"banker\":[\"1b\",\"2c\"],\"player\":[\"4b\",\"9b\",\"8c\"]}', 'BANKER', '0', '1556369280', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1777\",\"f3\":\"10.4894\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11177', '', '1556369340', '{\"banker\":[\"4c\",\"8c\",\"6d\"],\"player\":[\"6b\",\"8a\",\"7a\"]}', 'BANKER', '0', '1556369340', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1782\",\"f3\":\"10.4719\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11178', '', '1556369400', '{\"banker\":[\"12a\",\"12d\",\"8c\"],\"player\":[\"12c\",\"7c\"]}', 'BANKER', '0', '1556369400', null, '2', '', '0', '0', '{\"f1\":\"2.2398\",\"f2\":\"2.1781\",\"f3\":\"10.4737\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11179', '', '1556369460', '{\"banker\":[\"5a\",\"6a\",\"10c\"],\"player\":[\"6b\",\"1d\"]}', 'PLAYER', '0', '1556369460', null, '2', '', '0', '0', '{\"f1\":\"2.2365\",\"f2\":\"2.1765\",\"f3\":\"10.4846\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11180', '', '1556369520', '{\"banker\":[\"5c\",\"13b\",\"4c\"],\"player\":[\"3c\",\"6c\"]}', 'TIE', '0', '1556369520', null, '2', '', '0', '0', '{\"f1\":\"2.2366\",\"f2\":\"2.1782\",\"f3\":\"10.4752\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11181', '', '1556369580', '{\"banker\":[\"8a\",\"10b\"],\"player\":[\"1d\",\"7b\"]}', 'TIE', '0', '1556369580', null, '2', '', '0', '0', '{\"f1\":\"2.2371\",\"f2\":\"2.1776\",\"f3\":\"10.4805\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11182', '', '1556369640', '{\"banker\":[\"6d\",\"4d\",\"6a\"],\"player\":[\"6d\",\"4d\",\"9d\"]}', 'PLAYER', '0', '1556369640', null, '2', '', '0', '0', '{\"f1\":\"2.2365\",\"f2\":\"2.1757\",\"f3\":\"10.4949\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11183', '', '1556369700', '{\"banker\":[\"12d\",\"4d\",\"12d\"],\"player\":[\"1c\",\"11c\",\"5d\"]}', 'PLAYER', '0', '1556369700', null, '2', '', '0', '0', '{\"f1\":\"2.2382\",\"f2\":\"2.1751\",\"f3\":\"10.4856\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11184', '', '1556369760', '{\"banker\":[\"2a\",\"5b\"],\"player\":[\"10d\",\"2a\",\"12b\"]}', 'BANKER', '0', '1556369760', null, '2', '', '0', '0', '{\"f1\":\"2.2368\",\"f2\":\"2.1790\",\"f3\":\"10.4887\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11185', '', '1556369820', '{\"banker\":[\"10a\",\"5a\",\"4a\"],\"player\":[\"11b\",\"6d\"]}', 'BANKER', '0', '1556369820', null, '2', '', '0', '0', '{\"f1\":\"2.2392\",\"f2\":\"2.1766\",\"f3\":\"10.4714\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11186', '', '1556369880', '{\"banker\":[\"2c\",\"12a\",\"13d\"],\"player\":[\"4d\",\"11c\",\"11b\"]}', 'PLAYER', '0', '1556369880', null, '2', '', '0', '0', '{\"f1\":\"2.2367\",\"f2\":\"2.1793\",\"f3\":\"10.4745\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11187', '', '1556369940', '{\"banker\":[\"9a\",\"2b\",\"8b\"],\"player\":[\"13c\",\"4b\",\"4a\"]}', 'BANKER', '0', '1556369940', null, '2', '', '0', '0', '{\"f1\":\"2.2378\",\"f2\":\"2.1780\",\"f3\":\"10.4935\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11188', '', '1556370000', '{\"banker\":[\"9b\",\"4a\",\"4b\"],\"player\":[\"11b\",\"4a\",\"2d\"]}', 'BANKER', '0', '1556370000', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1772\",\"f3\":\"10.4941\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11189', '', '1556370060', '{\"banker\":[\"6b\",\"12b\"],\"player\":[\"13b\",\"6c\"]}', 'TIE', '0', '1556370060', null, '2', '', '0', '0', '{\"f1\":\"2.2374\",\"f2\":\"2.1750\",\"f3\":\"10.4894\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11190', '', '1556370120', '{\"banker\":[\"4b\",\"3a\"],\"player\":[\"13c\",\"9d\"]}', 'PLAYER', '0', '1556370120', null, '2', '', '0', '0', '{\"f1\":\"2.2388\",\"f2\":\"2.1796\",\"f3\":\"10.4891\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11191', '', '1556370180', '{\"banker\":[\"6a\",\"12c\",\"3a\"],\"player\":[\"2d\",\"9d\",\"7d\"]}', 'BANKER', '0', '1556370180', null, '2', '', '0', '0', '{\"f1\":\"2.2351\",\"f2\":\"2.1776\",\"f3\":\"10.4740\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11192', '', '1556370240', '{\"banker\":[\"11a\",\"5c\"],\"player\":[\"12d\",\"12a\",\"12d\"]}', 'BANKER', '0', '1556370240', null, '2', '', '0', '0', '{\"f1\":\"2.2382\",\"f2\":\"2.1766\",\"f3\":\"10.4744\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11193', '', '1556370300', '{\"banker\":[\"6d\",\"7a\",\"10a\"],\"player\":[\"9d\",\"3b\",\"6c\"]}', 'PLAYER', '0', '1556370300', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1774\",\"f3\":\"10.4764\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11194', '', '1556370360', '{\"banker\":[\"5a\",\"6a\",\"4a\"],\"player\":[\"2b\",\"12b\",\"4d\"]}', 'PLAYER', '0', '1556370360', null, '2', '', '0', '0', '{\"f1\":\"2.2371\",\"f2\":\"2.1794\",\"f3\":\"10.4822\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11195', '', '1556370420', '{\"banker\":[\"12a\",\"4d\"],\"player\":[\"13a\",\"4b\",\"10a\"]}', 'TIE', '0', '1556370420', null, '2', '', '0', '0', '{\"f1\":\"2.2365\",\"f2\":\"2.1771\",\"f3\":\"10.4903\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11196', '', '1556370480', '{\"banker\":[\"8c\",\"1b\"],\"player\":[\"6c\",\"3d\"]}', 'TIE', '0', '1556370480', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1787\",\"f3\":\"10.4828\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11197', '', '1556370540', '{\"banker\":[\"10a\",\"1c\",\"5d\"],\"player\":[\"7b\",\"9b\"]}', 'TIE', '0', '1556370540', null, '2', '', '0', '0', '{\"f1\":\"2.2384\",\"f2\":\"2.1777\",\"f3\":\"10.4825\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11198', '', '1556370600', '{\"banker\":[\"6d\",\"1c\"],\"player\":[\"10a\",\"1a\",\"1a\"]}', 'BANKER', '0', '1556370600', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1752\",\"f3\":\"10.4814\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11199', '', '1556370660', '{\"banker\":[\"6a\",\"9c\"],\"player\":[\"6c\",\"5d\",\"10d\"]}', 'BANKER', '0', '1556370660', null, '2', '', '0', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1797\",\"f3\":\"10.4842\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11200', '', '1556370720', '{\"banker\":[\"4c\",\"8a\",\"3b\"],\"player\":[\"4b\",\"4c\"]}', 'PLAYER', '0', '1556370720', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1760\",\"f3\":\"10.4713\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11201', '', '1556370780', '{\"banker\":[\"2b\",\"1b\",\"7b\"],\"player\":[\"11a\",\"4a\",\"7d\"]}', 'PLAYER', '0', '1556370780', null, '2', '', '0', '0', '{\"f1\":\"2.2358\",\"f2\":\"2.1754\",\"f3\":\"10.4832\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11202', '', '1556370840', '{\"banker\":[\"8b\",\"10d\"],\"player\":[\"7b\",\"12b\"]}', 'BANKER', '0', '1556370840', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1769\",\"f3\":\"10.4782\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11203', '', '1556370900', '{\"banker\":[\"7b\",\"13a\"],\"player\":[\"8d\",\"4c\",\"9b\"]}', 'BANKER', '0', '1556370900', null, '2', '', '0', '0', '{\"f1\":\"2.2366\",\"f2\":\"2.1780\",\"f3\":\"10.4925\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11204', '', '1556370960', '{\"banker\":[\"11c\",\"8a\"],\"player\":[\"2c\",\"8c\",\"11a\"]}', 'BANKER', '0', '1556370960', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1783\",\"f3\":\"10.4714\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11205', '', '1556371020', '{\"banker\":[\"7b\",\"8b\"],\"player\":[\"13b\",\"10b\",\"8a\"]}', 'PLAYER', '0', '1556371020', null, '2', '', '0', '0', '{\"f1\":\"2.2380\",\"f2\":\"2.1788\",\"f3\":\"10.4702\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11206', '', '1556371080', '{\"banker\":[\"4c\",\"10c\"],\"player\":[\"13b\",\"5d\",\"13d\"]}', 'PLAYER', '0', '1556371080', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1753\",\"f3\":\"10.4937\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11207', '', '1556371140', '{\"banker\":[\"5b\",\"8d\",\"13b\"],\"player\":[\"12c\",\"12b\",\"7c\"]}', 'PLAYER', '0', '1556371140', null, '2', '', '0', '0', '{\"f1\":\"2.2385\",\"f2\":\"2.1797\",\"f3\":\"10.4818\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11208', '', '1556371200', '{\"banker\":[\"1c\",\"3b\",\"9c\"],\"player\":[\"3d\",\"12d\",\"4b\"]}', 'PLAYER', '0', '1556371200', null, '2', '', '0', '0', '{\"f1\":\"2.2380\",\"f2\":\"2.1796\",\"f3\":\"10.4711\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11209', '', '1556371260', '{\"banker\":[\"12b\",\"9a\"],\"player\":[\"3b\",\"2b\",\"4a\"]}', 'TIE', '0', '1556371260', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1766\",\"f3\":\"10.4710\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11210', '', '1556371320', '{\"banker\":[\"2c\",\"11b\",\"6d\"],\"player\":[\"7a\",\"8b\",\"2b\"]}', 'BANKER', '0', '1556371320', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1764\",\"f3\":\"10.4897\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11211', '', '1556371380', '{\"banker\":[\"12d\",\"2b\",\"7b\"],\"player\":[\"2b\",\"11c\",\"7b\"]}', 'TIE', '0', '1556371380', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1794\",\"f3\":\"10.4894\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11212', '', '1556371440', '{\"banker\":[\"1a\",\"7b\"],\"player\":[\"13b\",\"12c\",\"12b\"]}', 'BANKER', '0', '1556371440', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1792\",\"f3\":\"10.4747\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11213', '', '1556371500', '{\"banker\":[\"8a\",\"12c\"],\"player\":[\"11c\",\"4d\",\"8a\"]}', 'BANKER', '0', '1556371500', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1756\",\"f3\":\"10.4874\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11214', '', '1556371560', '{\"banker\":[\"3d\",\"8b\",\"11d\"],\"player\":[\"3a\",\"6a\"]}', 'PLAYER', '0', '1556371560', null, '2', '', '0', '0', '{\"f1\":\"2.2357\",\"f2\":\"2.1768\",\"f3\":\"10.4734\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11215', '', '1556371620', '{\"banker\":[\"8a\",\"3a\",\"10d\"],\"player\":[\"13b\",\"6a\"]}', 'PLAYER', '0', '1556371620', null, '2', '', '0', '0', '{\"f1\":\"2.2367\",\"f2\":\"2.1792\",\"f3\":\"10.4825\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11216', '', '1556371680', '{\"banker\":[\"3b\",\"8a\",\"12a\"],\"player\":[\"4c\",\"8a\",\"11b\"]}', 'PLAYER', '0', '1556371680', null, '2', '', '0', '0', '{\"f1\":\"2.2355\",\"f2\":\"2.1753\",\"f3\":\"10.4858\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11217', '', '1556371740', '{\"banker\":[\"3a\",\"3d\"],\"player\":[\"12b\",\"6b\"]}', 'TIE', '0', '1556371740', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1778\",\"f3\":\"10.4760\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11218', '', '1556371800', '{\"banker\":[\"13b\",\"5a\",\"7c\"],\"player\":[\"4c\",\"13b\",\"6c\"]}', 'BANKER', '0', '1556371800', null, '2', '', '0', '0', '{\"f1\":\"2.2350\",\"f2\":\"2.1766\",\"f3\":\"10.4863\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11219', '', '1556371860', '{\"banker\":[\"6d\",\"6d\",\"10a\"],\"player\":[\"6c\",\"5a\",\"12b\"]}', 'BANKER', '0', '1556371860', null, '2', '', '0', '0', '{\"f1\":\"2.2379\",\"f2\":\"2.1766\",\"f3\":\"10.4947\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11220', '', '1556371920', '{\"banker\":[\"2b\",\"13c\",\"3d\"],\"player\":[\"6d\",\"6d\",\"6d\"]}', 'PLAYER', '0', '1556371920', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1757\",\"f3\":\"10.4704\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11221', '', '1556371980', '{\"banker\":[\"2d\",\"12d\",\"12a\"],\"player\":[\"13d\",\"7c\"]}', 'PLAYER', '0', '1556371980', null, '2', '', '0', '0', '{\"f1\":\"2.2371\",\"f2\":\"2.1785\",\"f3\":\"10.4872\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11222', '', '1556372040', '{\"banker\":[\"2c\",\"6d\"],\"player\":[\"11d\",\"11a\",\"7b\"]}', 'BANKER', '0', '1556372040', null, '2', '', '0', '0', '{\"f1\":\"2.2350\",\"f2\":\"2.1781\",\"f3\":\"10.4751\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11223', '', '1556372100', '{\"banker\":[\"2d\",\"13b\",\"2c\"],\"player\":[\"3a\",\"11a\",\"12c\"]}', 'BANKER', '0', '1556372100', null, '2', '', '0', '0', '{\"f1\":\"2.2398\",\"f2\":\"2.1758\",\"f3\":\"10.4783\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11224', '', '1556372160', '{\"banker\":[\"4d\",\"4a\"],\"player\":[\"7a\",\"2d\"]}', 'PLAYER', '0', '1556372160', null, '2', '', '0', '0', '{\"f1\":\"2.2357\",\"f2\":\"2.1772\",\"f3\":\"10.4837\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11225', '', '1556372220', '{\"banker\":[\"11d\",\"4b\",\"2c\"],\"player\":[\"13c\",\"10b\",\"5d\"]}', 'BANKER', '0', '1556372220', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1756\",\"f3\":\"10.4760\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11226', '', '1556372280', '{\"banker\":[\"10b\",\"7c\"],\"player\":[\"2a\",\"9a\",\"13a\"]}', 'BANKER', '0', '1556372280', null, '2', '', '0', '0', '{\"f1\":\"2.2365\",\"f2\":\"2.1767\",\"f3\":\"10.4734\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11227', '', '1556372340', '{\"banker\":[\"5c\",\"4b\"],\"player\":[\"11d\",\"11b\",\"13d\"]}', 'BANKER', '0', '1556372340', null, '2', '', '0', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1789\",\"f3\":\"10.4893\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11228', '', '1556372400', '{\"banker\":[\"12c\",\"6b\"],\"player\":[\"4c\",\"9b\",\"1c\"]}', 'BANKER', '0', '1556372400', null, '2', '', '0', '0', '{\"f1\":\"2.2381\",\"f2\":\"2.1762\",\"f3\":\"10.4939\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11229', '', '1556372460', '{\"banker\":[\"3d\",\"8d\",\"7d\"],\"player\":[\"12d\",\"4a\",\"2a\"]}', 'BANKER', '0', '1556372460', null, '2', '', '0', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1761\",\"f3\":\"10.4869\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11230', '', '1556372520', '{\"banker\":[\"5b\",\"6b\",\"1a\"],\"player\":[\"11a\",\"8c\"]}', 'PLAYER', '0', '1556372520', null, '2', '', '0', '0', '{\"f1\":\"2.2351\",\"f2\":\"2.1792\",\"f3\":\"10.4805\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11231', '', '1556372580', '{\"banker\":[\"10c\",\"6a\"],\"player\":[\"9b\",\"8d\"]}', 'PLAYER', '0', '1556372580', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1758\",\"f3\":\"10.4732\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11232', '', '1556372640', '{\"banker\":[\"3a\",\"11d\",\"7c\"],\"player\":[\"11c\",\"11b\",\"11b\"]}', 'TIE', '0', '1556372640', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1795\",\"f3\":\"10.4780\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11233', '', '1556372700', '{\"banker\":[\"3a\",\"2b\",\"9b\"],\"player\":[\"2a\",\"7d\"]}', 'PLAYER', '0', '1556372700', null, '2', '', '0', '0', '{\"f1\":\"2.2361\",\"f2\":\"2.1755\",\"f3\":\"10.4757\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11234', '', '1556372760', '{\"banker\":[\"1b\",\"11b\",\"6b\"],\"player\":[\"12d\",\"4a\",\"11c\"]}', 'BANKER', '0', '1556372760', null, '2', '', '0', '0', '{\"f1\":\"2.2369\",\"f2\":\"2.1755\",\"f3\":\"10.4834\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11235', '', '1556372820', '{\"banker\":[\"9d\",\"4c\",\"12b\"],\"player\":[\"10b\",\"11b\",\"3d\"]}', 'TIE', '0', '1556372820', null, '2', '', '0', '0', '{\"f1\":\"2.2378\",\"f2\":\"2.1760\",\"f3\":\"10.4922\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11236', '', '1556372880', '{\"banker\":[\"10b\",\"6b\"],\"player\":[\"12b\",\"12d\",\"1d\"]}', 'BANKER', '0', '1556372880', null, '2', '', '0', '0', '{\"f1\":\"2.2372\",\"f2\":\"2.1799\",\"f3\":\"10.4737\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11237', '', '1556372940', '{\"banker\":[\"9b\",\"6c\"],\"player\":[\"4c\",\"8a\",\"8a\"]}', 'BANKER', '0', '1556372940', null, '2', '', '0', '0', '{\"f1\":\"2.2385\",\"f2\":\"2.1754\",\"f3\":\"10.4789\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11238', '', '1556373000', '{\"banker\":[\"6b\",\"5c\",\"10c\"],\"player\":[\"13d\",\"2d\",\"9b\"]}', 'TIE', '0', '1556373000', null, '2', '', '0', '0', '{\"f1\":\"2.2366\",\"f2\":\"2.1752\",\"f3\":\"10.4902\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11239', '', '1556373065', '{\"banker\":[\"13c\",\"10d\",\"13d\"],\"player\":[\"2a\",\"2d\",\"4a\"]}', 'PLAYER', '0', '1556373065', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1779\",\"f3\":\"10.4937\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11240', '', '1556373121', '{\"banker\":[\"4d\",\"3d\"],\"player\":[\"11d\",\"7b\"]}', 'TIE', '0', '1556373121', null, '2', '', '0', '0', '{\"f1\":\"2.2357\",\"f2\":\"2.1793\",\"f3\":\"10.4777\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11241', '', '1556373180', '{\"banker\":[\"12d\",\"12c\",\"1b\"],\"player\":[\"10c\",\"3b\",\"4b\"]}', 'PLAYER', '0', '1556373180', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1755\",\"f3\":\"10.4752\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11242', '', '1556373240', '{\"banker\":[\"1b\",\"6c\"],\"player\":[\"13b\",\"7c\"]}', 'TIE', '0', '1556373240', null, '2', '', '0', '0', '{\"f1\":\"2.2352\",\"f2\":\"2.1760\",\"f3\":\"10.4931\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11243', '', '1556373300', '{\"banker\":[\"5c\",\"6d\",\"5c\"],\"player\":[\"4c\",\"6d\",\"8a\"]}', 'PLAYER', '0', '1556373300', null, '2', '', '0', '0', '{\"f1\":\"2.2387\",\"f2\":\"2.1757\",\"f3\":\"10.4937\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11244', '', '1556373360', '{\"banker\":[\"2c\",\"3d\"],\"player\":[\"6c\",\"5d\",\"2c\"]}', 'BANKER', '0', '1556373360', null, '2', '', '0', '0', '{\"f1\":\"2.2378\",\"f2\":\"2.1767\",\"f3\":\"10.4858\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11245', '', '1556373420', '{\"banker\":[\"4d\",\"4a\"],\"player\":[\"1c\",\"4b\",\"11a\"]}', 'BANKER', '0', '1556373420', null, '2', '', '0', '0', '{\"f1\":\"2.2384\",\"f2\":\"2.1753\",\"f3\":\"10.4703\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11246', '', '1556373480', '{\"banker\":[\"8d\",\"12c\"],\"player\":[\"5c\",\"8c\",\"13c\"]}', 'BANKER', '0', '1556373480', null, '2', '', '0', '0', '{\"f1\":\"2.2374\",\"f2\":\"2.1787\",\"f3\":\"10.4805\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11247', '', '1556373540', '{\"banker\":[\"3a\",\"8d\",\"11b\"],\"player\":[\"8b\",\"8b\"]}', 'PLAYER', '0', '1556373540', null, '2', '', '0', '0', '{\"f1\":\"2.2399\",\"f2\":\"2.1785\",\"f3\":\"10.4820\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11248', '', '1556373600', '{\"banker\":[\"9b\",\"9d\"],\"player\":[\"7b\",\"7d\",\"13d\"]}', 'BANKER', '0', '1556373600', null, '2', '', '0', '0', '{\"f1\":\"2.2355\",\"f2\":\"2.1781\",\"f3\":\"10.4917\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11249', '', '1556373660', '{\"banker\":[\"10a\",\"10a\",\"4b\"],\"player\":[\"9d\",\"7c\"]}', 'PLAYER', '0', '1556373660', null, '2', '', '0', '0', '{\"f1\":\"2.2368\",\"f2\":\"2.1761\",\"f3\":\"10.4777\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11250', '', '1556373720', '{\"banker\":[\"1a\",\"1b\",\"1b\"],\"player\":[\"7b\",\"1b\"]}', 'PLAYER', '0', '1556373720', null, '2', '', '0', '0', '{\"f1\":\"2.2385\",\"f2\":\"2.1778\",\"f3\":\"10.4781\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11251', '', '1556373780', '{\"banker\":[\"11d\",\"5c\"],\"player\":[\"13c\",\"12c\",\"11d\"]}', 'BANKER', '0', '1556373780', null, '2', '', '0', '0', '{\"f1\":\"2.2369\",\"f2\":\"2.1772\",\"f3\":\"10.4806\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11252', '', '1556373840', '{\"banker\":[\"8a\",\"6b\"],\"player\":[\"7a\",\"4a\",\"9d\"]}', 'BANKER', '0', '1556373840', null, '2', '', '0', '0', '{\"f1\":\"2.2388\",\"f2\":\"2.1765\",\"f3\":\"10.4914\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11253', '', '1556373900', '{\"banker\":[\"3c\",\"12d\",\"11b\"],\"player\":[\"10a\",\"13d\",\"3c\"]}', 'TIE', '0', '1556373900', null, '2', '', '0', '0', '{\"f1\":\"2.2375\",\"f2\":\"2.1795\",\"f3\":\"10.4889\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11254', '', '1556373960', '{\"banker\":[\"8b\",\"7d\",\"5c\"],\"player\":[\"9a\",\"11c\"]}', 'PLAYER', '0', '1556373960', null, '2', '', '0', '0', '{\"f1\":\"2.2372\",\"f2\":\"2.1790\",\"f3\":\"10.4772\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11255', '', '1556374020', '{\"banker\":[\"13c\",\"13d\",\"13b\"],\"player\":[\"1b\",\"1c\",\"8a\"]}', 'TIE', '0', '1556374020', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1774\",\"f3\":\"10.4829\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11256', '', '1556374080', '{\"banker\":[\"12c\",\"5c\"],\"player\":[\"13a\",\"10d\",\"10b\"]}', 'BANKER', '0', '1556374080', null, '2', '', '0', '0', '{\"f1\":\"2.2394\",\"f2\":\"2.1784\",\"f3\":\"10.4901\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11257', '', '1556374140', '{\"banker\":[\"11c\",\"8c\"],\"player\":[\"3d\",\"13b\",\"4c\"]}', 'BANKER', '0', '1556374140', null, '2', '', '0', '0', '{\"f1\":\"2.2351\",\"f2\":\"2.1781\",\"f3\":\"10.4829\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11258', '', '1556374200', '{\"banker\":[\"4a\",\"4b\"],\"player\":[\"6d\",\"6a\",\"9b\"]}', 'BANKER', '0', '1556374200', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1772\",\"f3\":\"10.4721\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11259', '', '1556374260', '{\"banker\":[\"11a\",\"12b\",\"3b\"],\"player\":[\"6a\",\"3b\"]}', 'PLAYER', '0', '1556374260', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1787\",\"f3\":\"10.4947\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11260', '', '1556374321', '{\"banker\":[\"9d\",\"9b\"],\"player\":[\"8b\",\"12b\"]}', 'TIE', '0', '1556374321', null, '2', '', '0', '0', '{\"f1\":\"2.2382\",\"f2\":\"2.1758\",\"f3\":\"10.4774\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11261', '', '1556374380', '{\"banker\":[\"4c\",\"7c\",\"2a\"],\"player\":[\"7c\",\"10d\"]}', 'PLAYER', '0', '1556374380', null, '2', '', '0', '0', '{\"f1\":\"2.2378\",\"f2\":\"2.1794\",\"f3\":\"10.4933\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11262', '', '1556374440', '{\"banker\":[\"11c\",\"2a\",\"9d\"],\"player\":[\"5d\",\"2c\"]}', 'PLAYER', '0', '1556374440', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1798\",\"f3\":\"10.4768\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11263', '', '1556374500', '{\"banker\":[\"7a\",\"4d\",\"10c\"],\"player\":[\"6a\",\"2a\"]}', 'PLAYER', '0', '1556374500', null, '2', '', '0', '0', '{\"f1\":\"2.2391\",\"f2\":\"2.1750\",\"f3\":\"10.4936\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11264', '', '1556374560', '{\"banker\":[\"3c\",\"7c\",\"10c\"],\"player\":[\"3a\",\"12d\",\"8c\"]}', 'PLAYER', '0', '1556374560', null, '2', '', '0', '0', '{\"f1\":\"2.2385\",\"f2\":\"2.1762\",\"f3\":\"10.4838\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11265', '', '1556374620', '{\"banker\":[\"12d\",\"7b\"],\"player\":[\"10d\",\"12d\",\"6c\"]}', 'BANKER', '0', '1556374620', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1765\",\"f3\":\"10.4809\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11266', '', '1556374680', '{\"banker\":[\"6b\",\"10d\"],\"player\":[\"3a\",\"13a\",\"1b\"]}', 'BANKER', '0', '1556374680', null, '2', '', '0', '0', '{\"f1\":\"2.2381\",\"f2\":\"2.1784\",\"f3\":\"10.4770\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11267', '', '1556374740', '{\"banker\":[\"4a\",\"6c\",\"8c\"],\"player\":[\"4b\",\"10a\",\"10c\"]}', 'BANKER', '0', '1556374740', null, '2', '', '0', '0', '{\"f1\":\"2.2356\",\"f2\":\"2.1798\",\"f3\":\"10.4812\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11268', '', '1556374800', '{\"banker\":[\"12a\",\"4c\",\"2d\"],\"player\":[\"6a\",\"12b\"]}', 'TIE', '0', '1556374800', null, '2', '', '0', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1759\",\"f3\":\"10.4942\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11269', '', '1556374860', '{\"banker\":[\"5b\",\"1d\"],\"player\":[\"3a\",\"3a\"]}', 'TIE', '0', '1556374860', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1775\",\"f3\":\"10.4760\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11270', '', '1556374920', '{\"banker\":[\"8c\",\"13d\"],\"player\":[\"3b\",\"8c\",\"12d\"]}', 'BANKER', '0', '1556374920', null, '2', '', '0', '0', '{\"f1\":\"2.2375\",\"f2\":\"2.1775\",\"f3\":\"10.4937\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11271', '', '1556374980', '{\"banker\":[\"6c\",\"4b\",\"11a\"],\"player\":[\"1c\",\"3d\",\"1a\"]}', 'PLAYER', '0', '1556374980', null, '2', '', '0', '0', '{\"f1\":\"2.2375\",\"f2\":\"2.1782\",\"f3\":\"10.4868\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11272', '', '1556375040', '{\"banker\":[\"9b\",\"2a\",\"12a\"],\"player\":[\"10a\",\"1b\",\"8b\"]}', 'PLAYER', '0', '1556375040', null, '2', '', '0', '0', '{\"f1\":\"2.2391\",\"f2\":\"2.1761\",\"f3\":\"10.4774\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11273', '', '1556375100', '{\"banker\":[\"7c\",\"3d\",\"4d\"],\"player\":[\"10a\",\"13c\",\"3d\"]}', 'BANKER', '0', '1556375100', null, '2', '', '0', '0', '{\"f1\":\"2.2379\",\"f2\":\"2.1781\",\"f3\":\"10.4713\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11274', '', '1556375160', '{\"banker\":[\"7a\",\"9c\"],\"player\":[\"10b\",\"7d\"]}', 'PLAYER', '0', '1556375160', null, '2', '', '0', '0', '{\"f1\":\"2.2399\",\"f2\":\"2.1752\",\"f3\":\"10.4828\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11275', '', '1556375220', '{\"banker\":[\"5d\",\"3b\"],\"player\":[\"1b\",\"13a\",\"1a\"]}', 'BANKER', '0', '1556375220', null, '2', '', '0', '0', '{\"f1\":\"2.2358\",\"f2\":\"2.1771\",\"f3\":\"10.4774\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11276', '', '1556375280', '{\"banker\":[\"7d\",\"1b\"],\"player\":[\"12d\",\"1b\",\"11b\"]}', 'BANKER', '0', '1556375280', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1782\",\"f3\":\"10.4835\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11277', '', '1556375340', '{\"banker\":[\"2a\",\"11b\",\"5d\"],\"player\":[\"8a\",\"6c\",\"12d\"]}', 'BANKER', '0', '1556375340', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1767\",\"f3\":\"10.4780\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11278', '', '1556375400', '{\"banker\":[\"11c\",\"1d\",\"6c\"],\"player\":[\"2a\",\"4c\"]}', 'BANKER', '0', '1556375400', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1753\",\"f3\":\"10.4945\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11279', '', '1556375460', '{\"banker\":[\"6a\",\"11c\",\"5c\"],\"player\":[\"4d\",\"6a\",\"6c\"]}', 'PLAYER', '0', '1556375460', null, '2', '', '0', '0', '{\"f1\":\"2.2376\",\"f2\":\"2.1764\",\"f3\":\"10.4731\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11280', '', '1556375520', '{\"banker\":[\"13d\",\"9d\"],\"player\":[\"10a\",\"2d\",\"13b\"]}', 'BANKER', '0', '1556375520', null, '2', '', '0', '0', '{\"f1\":\"2.2356\",\"f2\":\"2.1781\",\"f3\":\"10.4946\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11281', '', '1556375580', '{\"banker\":[\"12c\",\"1b\",\"5a\"],\"player\":[\"8b\",\"5a\",\"8d\"]}', 'BANKER', '0', '1556375580', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1799\",\"f3\":\"10.4860\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11282', '', '1556375640', '{\"banker\":[\"2c\",\"2c\"],\"player\":[\"2d\",\"10c\",\"9d\"]}', 'BANKER', '0', '1556375640', null, '2', '', '0', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1797\",\"f3\":\"10.4815\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11283', '', '1556375700', '{\"banker\":[\"7d\",\"10d\"],\"player\":[\"2a\",\"13d\",\"10b\"]}', 'BANKER', '0', '1556375700', null, '2', '', '0', '0', '{\"f1\":\"2.2399\",\"f2\":\"2.1754\",\"f3\":\"10.4717\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11284', '', '1556375760', '{\"banker\":[\"13a\",\"3b\",\"7d\"],\"player\":[\"8a\",\"4a\",\"3c\"]}', 'PLAYER', '0', '1556375760', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1767\",\"f3\":\"10.4883\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11285', '', '1556375820', '{\"banker\":[\"7c\",\"12b\"],\"player\":[\"1a\",\"9a\",\"13c\"]}', 'BANKER', '0', '1556375820', null, '2', '', '0', '0', '{\"f1\":\"2.2382\",\"f2\":\"2.1761\",\"f3\":\"10.4797\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11286', '', '1556375880', '{\"banker\":[\"7a\",\"1b\"],\"player\":[\"13b\",\"10d\",\"9d\"]}', 'PLAYER', '0', '1556375880', null, '2', '', '0', '0', '{\"f1\":\"2.2350\",\"f2\":\"2.1755\",\"f3\":\"10.4782\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11287', '', '1556375940', '{\"banker\":[\"12c\",\"2c\",\"2a\"],\"player\":[\"13d\",\"8d\"]}', 'PLAYER', '0', '1556375940', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1773\",\"f3\":\"10.4704\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11288', '', '1556376000', '{\"banker\":[\"12a\",\"7b\"],\"player\":[\"9a\",\"5a\",\"5b\"]}', 'PLAYER', '0', '1556376000', null, '2', '', '0', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1798\",\"f3\":\"10.4914\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11289', '', '1556376061', '{\"banker\":[\"6b\",\"2d\"],\"player\":[\"3b\",\"9b\",\"7a\"]}', 'PLAYER', '0', '1556376061', null, '2', '', '0', '0', '{\"f1\":\"2.2357\",\"f2\":\"2.1759\",\"f3\":\"10.4907\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11290', '', '1556376120', '{\"banker\":[\"3b\",\"6d\"],\"player\":[\"11b\",\"12a\",\"9b\"]}', 'TIE', '0', '1556376120', null, '2', '', '0', '0', '{\"f1\":\"2.2391\",\"f2\":\"2.1768\",\"f3\":\"10.4939\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11291', '', '1556376180', '{\"banker\":[\"3d\",\"5b\"],\"player\":[\"7c\",\"13a\"]}', 'BANKER', '0', '1556376180', null, '2', '', '0', '0', '{\"f1\":\"2.2371\",\"f2\":\"2.1795\",\"f3\":\"10.4915\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11292', '', '1556376240', '{\"banker\":[\"13d\",\"13a\",\"7b\"],\"player\":[\"13b\",\"10a\",\"2d\"]}', 'BANKER', '0', '1556376240', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1777\",\"f3\":\"10.4882\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11293', '', '1556376300', '{\"banker\":[\"9d\",\"7c\"],\"player\":[\"11c\",\"11a\",\"11b\"]}', 'BANKER', '0', '1556376300', null, '2', '', '0', '0', '{\"f1\":\"2.2370\",\"f2\":\"2.1778\",\"f3\":\"10.4950\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11294', '', '1556376360', '{\"banker\":[\"6c\",\"10a\"],\"player\":[\"8d\",\"12a\"]}', 'PLAYER', '0', '1556376360', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1752\",\"f3\":\"10.4724\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11295', '', '1556376420', '{\"banker\":[\"1b\",\"11b\",\"10c\"],\"player\":[\"10c\",\"12b\",\"2d\"]}', 'PLAYER', '0', '1556376420', null, '2', '', '0', '0', '{\"f1\":\"2.2392\",\"f2\":\"2.1792\",\"f3\":\"10.4853\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11296', '', '1556376480', '{\"banker\":[\"12b\",\"8c\"],\"player\":[\"12a\",\"9a\"]}', 'PLAYER', '0', '1556376480', null, '2', '', '0', '0', '{\"f1\":\"2.2357\",\"f2\":\"2.1761\",\"f3\":\"10.4791\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11297', '', '1556376540', '{\"banker\":[\"1c\",\"1b\",\"1a\"],\"player\":[\"12a\",\"6b\"]}', 'PLAYER', '0', '1556376540', null, '2', '', '0', '0', '{\"f1\":\"2.2385\",\"f2\":\"2.1772\",\"f3\":\"10.4706\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11298', '', '1556376600', '{\"banker\":[\"8a\",\"11a\"],\"player\":[\"7d\",\"4d\",\"11a\"]}', 'BANKER', '0', '1556376600', null, '2', '', '0', '0', '{\"f1\":\"2.2399\",\"f2\":\"2.1795\",\"f3\":\"10.4871\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11299', '', '1556376660', '{\"banker\":[\"2a\",\"6a\"],\"player\":[\"5c\",\"3b\"]}', 'TIE', '0', '1556376660', null, '2', '', '0', '0', '{\"f1\":\"2.2394\",\"f2\":\"2.1781\",\"f3\":\"10.4894\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11300', '', '1556376720', '{\"banker\":[\"5c\",\"3d\"],\"player\":[\"1a\",\"6b\"]}', 'BANKER', '0', '1556376720', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1754\",\"f3\":\"10.4939\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11301', '', '1556376780', '{\"banker\":[\"8c\",\"7b\",\"6b\"],\"player\":[\"13a\",\"7b\"]}', 'PLAYER', '0', '1556376780', null, '2', '', '0', '0', '{\"f1\":\"2.2356\",\"f2\":\"2.1781\",\"f3\":\"10.4748\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11302', '', '1556376840', '{\"banker\":[\"3d\",\"7c\",\"2d\"],\"player\":[\"4b\",\"12b\",\"5b\"]}', 'PLAYER', '0', '1556376840', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1773\",\"f3\":\"10.4913\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11303', '', '1556376900', '{\"banker\":[\"7b\",\"5d\",\"6d\"],\"player\":[\"7a\",\"10b\"]}', 'BANKER', '0', '1556376900', null, '2', '', '0', '0', '{\"f1\":\"2.2392\",\"f2\":\"2.1751\",\"f3\":\"10.4763\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11304', '', '1556376960', '{\"banker\":[\"5b\",\"2d\"],\"player\":[\"10d\",\"12b\",\"2d\"]}', 'BANKER', '0', '1556376960', null, '2', '', '0', '0', '{\"f1\":\"2.2375\",\"f2\":\"2.1768\",\"f3\":\"10.4700\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11305', '', '1556377020', '{\"banker\":[\"9d\",\"13d\"],\"player\":[\"11a\",\"1d\",\"10c\"]}', 'BANKER', '0', '1556377020', null, '2', '', '0', '0', '{\"f1\":\"2.2390\",\"f2\":\"2.1767\",\"f3\":\"10.4911\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11306', '', '1556377080', '{\"banker\":[\"5d\",\"10a\",\"10b\"],\"player\":[\"2d\",\"10c\",\"7d\"]}', 'PLAYER', '0', '1556377080', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1764\",\"f3\":\"10.4717\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11307', '', '1556377140', '{\"banker\":[\"1b\",\"2c\",\"9d\"],\"player\":[\"11c\",\"9d\"]}', 'PLAYER', '0', '1556377140', null, '2', '', '0', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1778\",\"f3\":\"10.4911\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11308', '', '1556377200', '{\"banker\":[\"11c\",\"13c\",\"7b\"],\"player\":[\"8b\",\"1a\"]}', 'PLAYER', '0', '1556377200', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1752\",\"f3\":\"10.4905\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11309', '', '1556377260', '{\"banker\":[\"8d\",\"1c\"],\"player\":[\"9b\",\"3c\",\"5b\"]}', 'BANKER', '0', '1556377260', null, '2', '', '0', '0', '{\"f1\":\"2.2374\",\"f2\":\"2.1789\",\"f3\":\"10.4780\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11310', '', '1556377320', '{\"banker\":[\"10a\",\"7b\"],\"player\":[\"2a\",\"13a\",\"10a\"]}', 'BANKER', '0', '1556377320', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1784\",\"f3\":\"10.4855\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11311', '', '1556377380', '{\"banker\":[\"13d\",\"12d\",\"8b\"],\"player\":[\"13a\",\"3b\",\"3d\"]}', 'BANKER', '0', '1556377380', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1791\",\"f3\":\"10.4735\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11312', '', '1556377440', '{\"banker\":[\"2a\",\"13c\",\"8c\"],\"player\":[\"9d\",\"9b\"]}', 'PLAYER', '0', '1556377440', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1765\",\"f3\":\"10.4829\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11313', '', '1556377500', '{\"banker\":[\"12b\",\"10a\",\"9d\"],\"player\":[\"11a\",\"9b\"]}', 'TIE', '0', '1556377500', null, '2', '', '0', '0', '{\"f1\":\"2.2371\",\"f2\":\"2.1762\",\"f3\":\"10.4927\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11314', '', '1556377560', '{\"banker\":[\"11b\",\"12c\",\"7b\"],\"player\":[\"2b\",\"1d\",\"1b\"]}', 'BANKER', '0', '1556377560', null, '2', '', '0', '0', '{\"f1\":\"2.2378\",\"f2\":\"2.1789\",\"f3\":\"10.4855\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11315', '', '1556427240', '{\"banker\":[\"8a\",\"11c\"],\"player\":[\"2c\",\"5d\"]}', 'BANKER', '0', '1556427240', null, '2', '', '0', '0', '{\"f1\":\"2.2366\",\"f2\":\"2.1782\",\"f3\":\"10.4711\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11316', '', '1556427300', '{\"banker\":[\"3c\",\"11d\",\"3c\"],\"player\":[\"13b\",\"3c\",\"10c\"]}', 'BANKER', '0', '1556427300', null, '2', '', '0', '0', '{\"f1\":\"2.2369\",\"f2\":\"2.1761\",\"f3\":\"10.4802\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11317', '', '1556427360', '{\"banker\":[\"9c\",\"13a\"],\"player\":[\"10c\",\"7a\"]}', 'BANKER', '0', '1556427360', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1790\",\"f3\":\"10.4704\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11318', '', '1556427420', '{\"banker\":[\"4d\",\"12c\",\"4c\"],\"player\":[\"5a\",\"3b\"]}', 'TIE', '0', '1556427420', null, '2', '', '0', '0', '{\"f1\":\"2.2358\",\"f2\":\"2.1796\",\"f3\":\"10.4902\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11319', '', '1556427480', '{\"banker\":[\"8b\",\"12c\"],\"player\":[\"1a\",\"10d\",\"13c\"]}', 'BANKER', '0', '1556427480', null, '2', '', '0', '0', '{\"f1\":\"2.2357\",\"f2\":\"2.1775\",\"f3\":\"10.4931\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11320', '', '1556427540', '{\"banker\":[\"12b\",\"13d\",\"12b\"],\"player\":[\"13b\",\"8b\"]}', 'PLAYER', '0', '1556427540', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1759\",\"f3\":\"10.4905\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11321', '', '1556427600', '{\"banker\":[\"3d\",\"6d\"],\"player\":[\"4b\",\"10d\",\"12b\"]}', 'BANKER', '0', '1556427600', null, '2', '', '0', '0', '{\"f1\":\"2.2388\",\"f2\":\"2.1780\",\"f3\":\"10.4825\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11322', '', '1556427660', '{\"banker\":[\"2c\",\"1b\",\"6d\"],\"player\":[\"2d\",\"10d\",\"2b\"]}', 'BANKER', '0', '1556427660', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1778\",\"f3\":\"10.4885\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11323', '', '1556427720', '{\"banker\":[\"12a\",\"1a\",\"9a\"],\"player\":[\"5b\",\"13b\",\"9c\"]}', 'PLAYER', '0', '1556427720', null, '2', '', '0', '0', '{\"f1\":\"2.2375\",\"f2\":\"2.1796\",\"f3\":\"10.4929\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11324', '', '1556427780', '{\"banker\":[\"7a\",\"7a\"],\"player\":[\"11d\",\"13d\",\"1c\"]}', 'BANKER', '0', '1556427780', null, '2', '', '0', '0', '{\"f1\":\"2.2379\",\"f2\":\"2.1790\",\"f3\":\"10.4744\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11325', '', '1556427840', '{\"banker\":[\"7d\",\"11a\"],\"player\":[\"2d\",\"4d\"]}', 'BANKER', '0', '1556427840', null, '2', '', '0', '0', '{\"f1\":\"2.2358\",\"f2\":\"2.1756\",\"f3\":\"10.4929\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11326', '', '1556427900', '{\"banker\":[\"1b\",\"8c\"],\"player\":[\"9b\",\"12b\"]}', 'TIE', '0', '1556427900', null, '2', '', '0', '0', '{\"f1\":\"2.2366\",\"f2\":\"2.1762\",\"f3\":\"10.4702\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11327', '', '1556427960', '{\"banker\":[\"7c\",\"7a\",\"7a\"],\"player\":[\"2a\",\"12b\",\"7d\"]}', 'PLAYER', '0', '1556427960', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1791\",\"f3\":\"10.4936\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11328', '', '1556428020', '{\"banker\":[\"11d\",\"11d\",\"3d\"],\"player\":[\"6b\",\"2a\"]}', 'PLAYER', '0', '1556428020', null, '2', '', '0', '0', '{\"f1\":\"2.2366\",\"f2\":\"2.1793\",\"f3\":\"10.4800\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11329', '', '1556428080', '{\"banker\":[\"11a\",\"2b\",\"8a\"],\"player\":[\"11b\",\"10c\",\"9a\"]}', 'PLAYER', '0', '1556428080', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1774\",\"f3\":\"10.4844\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11330', '', '1556428140', '{\"banker\":[\"4d\",\"4a\"],\"player\":[\"4d\",\"10b\",\"9a\"]}', 'BANKER', '0', '1556428140', null, '2', '', '0', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1761\",\"f3\":\"10.4793\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11331', '', '1556428200', '{\"banker\":[\"10a\",\"7d\"],\"player\":[\"7d\",\"4a\",\"9a\"]}', 'BANKER', '0', '1556428200', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1770\",\"f3\":\"10.4878\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11332', '', '1556428260', '{\"banker\":[\"13a\",\"10c\",\"13c\"],\"player\":[\"12a\",\"2a\",\"11d\"]}', 'PLAYER', '0', '1556428260', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1794\",\"f3\":\"10.4840\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11333', '', '1556428320', '{\"banker\":[\"5c\",\"13d\",\"6d\"],\"player\":[\"3d\",\"9a\",\"7c\"]}', 'PLAYER', '0', '1556428320', null, '2', '', '0', '0', '{\"f1\":\"2.2392\",\"f2\":\"2.1767\",\"f3\":\"10.4716\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11334', '', '1556428380', '{\"banker\":[\"8c\",\"7b\",\"9a\"],\"player\":[\"1c\",\"7b\"]}', 'PLAYER', '0', '1556428380', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1760\",\"f3\":\"10.4949\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11335', '', '1556428440', '{\"banker\":[\"2c\",\"11c\",\"6a\"],\"player\":[\"2d\",\"11d\",\"2c\"]}', 'BANKER', '0', '1556428440', null, '2', '', '0', '0', '{\"f1\":\"2.2356\",\"f2\":\"2.1760\",\"f3\":\"10.4706\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11336', '', '1556428500', '{\"banker\":[\"8c\",\"13a\"],\"player\":[\"1a\",\"7d\"]}', 'TIE', '0', '1556428500', null, '2', '', '0', '0', '{\"f1\":\"2.2370\",\"f2\":\"2.1789\",\"f3\":\"10.4946\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11337', '', '1556428560', '{\"banker\":[\"3d\",\"11d\"],\"player\":[\"7c\",\"8d\",\"8d\"]}', 'TIE', '0', '1556428560', null, '2', '', '0', '0', '{\"f1\":\"2.2391\",\"f2\":\"2.1773\",\"f3\":\"10.4780\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11338', '', '1556428620', '{\"banker\":[\"7d\",\"13d\"],\"player\":[\"13b\",\"9b\"]}', 'PLAYER', '0', '1556428620', null, '2', '', '0', '0', '{\"f1\":\"2.2366\",\"f2\":\"2.1768\",\"f3\":\"10.4806\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11339', '', '1556428680', '{\"banker\":[\"9d\",\"12c\"],\"player\":[\"9a\",\"6a\",\"8a\"]}', 'BANKER', '0', '1556428680', null, '2', '', '0', '0', '{\"f1\":\"2.2372\",\"f2\":\"2.1753\",\"f3\":\"10.4891\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11340', '', '1556428740', '{\"banker\":[\"7d\",\"10c\"],\"player\":[\"5c\",\"3a\"]}', 'PLAYER', '0', '1556428740', null, '2', '', '0', '0', '{\"f1\":\"2.2366\",\"f2\":\"2.1793\",\"f3\":\"10.4780\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11341', '', '1556428800', '{\"banker\":[\"9a\",\"7a\"],\"player\":[\"9b\",\"3d\",\"11a\"]}', 'BANKER', '0', '1556428800', null, '2', '', '0', '0', '{\"f1\":\"2.2390\",\"f2\":\"2.1759\",\"f3\":\"10.4885\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11342', '', '1556428860', '{\"banker\":[\"13d\",\"12c\",\"6a\"],\"player\":[\"9c\",\"10b\"]}', 'PLAYER', '0', '1556428860', null, '2', '', '0', '0', '{\"f1\":\"2.2356\",\"f2\":\"2.1790\",\"f3\":\"10.4700\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11343', '', '1556428920', '{\"banker\":[\"2d\",\"4b\"],\"player\":[\"10d\",\"1d\",\"10a\"]}', 'BANKER', '0', '1556428920', null, '2', '', '0', '0', '{\"f1\":\"2.2390\",\"f2\":\"2.1765\",\"f3\":\"10.4808\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11344', '', '1556428980', '{\"banker\":[\"11d\",\"1d\",\"1d\"],\"player\":[\"7d\",\"6d\",\"3c\"]}', 'PLAYER', '0', '1556428980', null, '2', '', '0', '0', '{\"f1\":\"2.2398\",\"f2\":\"2.1796\",\"f3\":\"10.4732\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11345', '', '1556429040', '{\"banker\":[\"9d\",\"12d\"],\"player\":[\"6a\",\"10a\"]}', 'BANKER', '0', '1556429040', null, '2', '', '0', '0', '{\"f1\":\"2.2378\",\"f2\":\"2.1750\",\"f3\":\"10.4760\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11346', '', '1556429100', '{\"banker\":[\"3a\",\"6b\"],\"player\":[\"5d\",\"10c\",\"1d\"]}', 'BANKER', '0', '1556429100', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1776\",\"f3\":\"10.4870\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11347', '', '1556429160', '{\"banker\":[\"1c\",\"11d\",\"4c\"],\"player\":[\"2c\",\"7d\"]}', 'PLAYER', '0', '1556429160', null, '2', '', '0', '0', '{\"f1\":\"2.2381\",\"f2\":\"2.1759\",\"f3\":\"10.4711\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11348', '', '1556429220', '{\"banker\":[\"7a\",\"6d\",\"10d\"],\"player\":[\"2a\",\"12d\",\"5a\"]}', 'PLAYER', '0', '1556429220', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1754\",\"f3\":\"10.4877\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11349', '', '1556429280', '{\"banker\":[\"11a\",\"9a\"],\"player\":[\"2a\",\"13d\",\"12d\"]}', 'BANKER', '0', '1556429280', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1760\",\"f3\":\"10.4825\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11350', '', '1556429340', '{\"banker\":[\"9c\",\"13c\"],\"player\":[\"7a\",\"5d\",\"6d\"]}', 'BANKER', '0', '1556429340', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1788\",\"f3\":\"10.4885\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11351', '', '1556429400', '{\"banker\":[\"7b\",\"6b\",\"2d\"],\"player\":[\"2d\",\"2c\",\"4d\"]}', 'PLAYER', '0', '1556429400', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1780\",\"f3\":\"10.4829\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11352', '', '1556429460', '{\"banker\":[\"8c\",\"8a\",\"5a\"],\"player\":[\"11b\",\"3a\",\"7c\"]}', 'BANKER', '0', '1556429460', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1758\",\"f3\":\"10.4767\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11353', '', '1556429520', '{\"banker\":[\"7c\",\"2b\"],\"player\":[\"10c\",\"3b\",\"3b\"]}', 'BANKER', '0', '1556429520', null, '2', '', '0', '0', '{\"f1\":\"2.2378\",\"f2\":\"2.1788\",\"f3\":\"10.4926\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11354', '', '1556429580', '{\"banker\":[\"5b\",\"7b\",\"8d\"],\"player\":[\"11c\",\"4a\",\"10b\"]}', 'PLAYER', '0', '1556429580', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1754\",\"f3\":\"10.4798\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11355', '', '1556429640', '{\"banker\":[\"11a\",\"5d\",\"5b\"],\"player\":[\"8a\",\"11c\"]}', 'PLAYER', '0', '1556429640', null, '2', '', '0', '0', '{\"f1\":\"2.2374\",\"f2\":\"2.1782\",\"f3\":\"10.4837\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11356', '', '1556429700', '{\"banker\":[\"1a\",\"9a\",\"13d\"],\"player\":[\"5b\",\"12d\",\"1d\"]}', 'PLAYER', '0', '1556429700', null, '2', '', '0', '0', '{\"f1\":\"2.2356\",\"f2\":\"2.1760\",\"f3\":\"10.4826\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11357', '', '1556429760', '{\"banker\":[\"9d\",\"5c\",\"13d\"],\"player\":[\"5d\",\"10a\",\"2b\"]}', 'PLAYER', '0', '1556429760', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1765\",\"f3\":\"10.4830\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11358', '', '1556429820', '{\"banker\":[\"4a\",\"6a\",\"4c\"],\"player\":[\"5a\",\"5c\",\"2b\"]}', 'BANKER', '0', '1556429820', null, '2', '', '0', '0', '{\"f1\":\"2.2395\",\"f2\":\"2.1769\",\"f3\":\"10.4702\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11359', '', '1556429880', '{\"banker\":[\"6a\",\"4a\",\"1b\"],\"player\":[\"8b\",\"11b\"]}', 'PLAYER', '0', '1556429880', null, '2', '', '0', '0', '{\"f1\":\"2.2369\",\"f2\":\"2.1753\",\"f3\":\"10.4860\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11360', '', '1556429940', '{\"banker\":[\"8c\",\"3a\",\"4c\"],\"player\":[\"5d\",\"5b\",\"8d\"]}', 'PLAYER', '0', '1556429940', null, '2', '', '0', '0', '{\"f1\":\"2.2351\",\"f2\":\"2.1763\",\"f3\":\"10.4733\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11361', '', '1556430000', '{\"banker\":[\"5b\",\"8a\",\"13a\"],\"player\":[\"2c\",\"8d\",\"7a\"]}', 'PLAYER', '0', '1556430000', null, '2', '', '0', '0', '{\"f1\":\"2.2385\",\"f2\":\"2.1786\",\"f3\":\"10.4919\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11362', '', '1556434261', '{\"banker\":[\"5c\",\"3b\"],\"player\":[\"11d\",\"8b\"]}', 'TIE', '0', '1556434261', null, '2', '', '0', '0', '{\"f1\":\"2.2385\",\"f2\":\"2.1750\",\"f3\":\"10.4706\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11363', '', '1556434320', '{\"banker\":[\"3a\",\"1a\",\"5c\"],\"player\":[\"6c\",\"6c\",\"3b\"]}', 'BANKER', '0', '1556434320', null, '2', '', '0', '0', '{\"f1\":\"2.2398\",\"f2\":\"2.1799\",\"f3\":\"10.4865\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11364', '', '1556434380', '{\"banker\":[\"7c\",\"7c\",\"13d\"],\"player\":[\"10a\",\"8a\"]}', 'PLAYER', '0', '1556434380', null, '2', '', '0', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1756\",\"f3\":\"10.4820\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11365', '', '1556434440', '{\"banker\":[\"8d\",\"3c\",\"12d\"],\"player\":[\"1b\",\"7b\"]}', 'PLAYER', '0', '1556434440', null, '2', '', '0', '0', '{\"f1\":\"2.2372\",\"f2\":\"2.1794\",\"f3\":\"10.4862\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11366', '', '1556434500', '{\"banker\":[\"8c\",\"1c\"],\"player\":[\"7a\",\"4c\",\"8c\"]}', 'TIE', '0', '1556434500', null, '2', '', '0', '0', '{\"f1\":\"2.2376\",\"f2\":\"2.1765\",\"f3\":\"10.4705\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11367', '', '1556434560', '{\"banker\":[\"3b\",\"3a\"],\"player\":[\"10a\",\"7c\"]}', 'PLAYER', '0', '1556434560', null, '2', '', '0', '0', '{\"f1\":\"2.2357\",\"f2\":\"2.1753\",\"f3\":\"10.4890\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11368', '', '1556434620', '{\"banker\":[\"11b\",\"7c\"],\"player\":[\"6b\",\"4c\",\"13a\"]}', 'BANKER', '0', '1556434620', null, '2', '', '0', '0', '{\"f1\":\"2.2385\",\"f2\":\"2.1766\",\"f3\":\"10.4784\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11369', '', '1556434680', '{\"banker\":[\"12b\",\"5c\"],\"player\":[\"9c\",\"6b\",\"12a\"]}', 'TIE', '0', '1556434680', null, '2', '', '0', '0', '{\"f1\":\"2.2374\",\"f2\":\"2.1796\",\"f3\":\"10.4752\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11370', '', '1556434740', '{\"banker\":[\"9d\",\"1a\",\"12a\"],\"player\":[\"5d\",\"4c\"]}', 'PLAYER', '0', '1556434740', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1766\",\"f3\":\"10.4944\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11371', '', '1556434800', '{\"banker\":[\"1c\",\"11b\",\"13a\"],\"player\":[\"9b\",\"2d\",\"11c\"]}', 'TIE', '0', '1556434800', null, '2', '', '0', '0', '{\"f1\":\"2.2395\",\"f2\":\"2.1758\",\"f3\":\"10.4737\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11372', '', '1556434842', '{\"banker\":[\"4b\",\"8a\",\"4c\"],\"player\":[\"3d\",\"12d\",\"6d\"]}', 'PLAYER', '0', '1556434842', null, '2', '', '0', '0', '{\"f1\":\"2.2394\",\"f2\":\"2.1794\",\"f3\":\"10.4743\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11373', '', '1556434860', '{\"banker\":[\"5b\",\"12c\",\"4d\"],\"player\":[\"13c\",\"6d\"]}', 'BANKER', '0', '1556434860', null, '2', '', '0', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1775\",\"f3\":\"10.4873\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11374', '', '1556434920', '{\"banker\":[\"12c\",\"2a\",\"2b\"],\"player\":[\"8d\",\"12b\"]}', 'PLAYER', '0', '1556434920', null, '2', '', '0', '0', '{\"f1\":\"2.2358\",\"f2\":\"2.1799\",\"f3\":\"10.4706\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11375', '', '1556434980', '{\"banker\":[\"11b\",\"11b\",\"13b\"],\"player\":[\"8d\",\"9c\"]}', 'PLAYER', '0', '1556434980', null, '2', '', '0', '0', '{\"f1\":\"2.2398\",\"f2\":\"2.1753\",\"f3\":\"10.4829\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11376', '', '1556435040', '{\"banker\":[\"2c\",\"7d\"],\"player\":[\"11b\",\"11b\",\"12b\"]}', 'BANKER', '0', '1556435040', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1754\",\"f3\":\"10.4795\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11377', '', '1556435100', '{\"banker\":[\"8b\",\"8d\"],\"player\":[\"12b\",\"8d\"]}', 'PLAYER', '0', '1556435100', null, '2', '', '0', '0', '{\"f1\":\"2.2365\",\"f2\":\"2.1753\",\"f3\":\"10.4847\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11378', '', '1556435160', '{\"banker\":[\"7c\",\"1c\"],\"player\":[\"3a\",\"12c\",\"13b\"]}', 'BANKER', '0', '1556435160', null, '2', '', '0', '0', '{\"f1\":\"2.2399\",\"f2\":\"2.1791\",\"f3\":\"10.4773\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11379', '', '1556435220', '{\"banker\":[\"7c\",\"12b\"],\"player\":[\"10b\",\"7d\"]}', 'TIE', '0', '1556435220', null, '2', '', '0', '0', '{\"f1\":\"2.2381\",\"f2\":\"2.1756\",\"f3\":\"10.4730\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11380', '', '1556435281', '{\"banker\":[\"5d\",\"11a\"],\"player\":[\"10d\",\"12d\",\"3b\"]}', 'BANKER', '0', '1556435281', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1765\",\"f3\":\"10.4841\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11381', '', '1556435341', '{\"banker\":[\"11d\",\"7c\"],\"player\":[\"10a\",\"4c\",\"13c\"]}', 'BANKER', '0', '1556435341', null, '2', '', '0', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1797\",\"f3\":\"10.4773\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11382', '', '1556435401', '{\"banker\":[\"7d\",\"1c\"],\"player\":[\"7a\",\"8a\",\"7a\"]}', 'BANKER', '0', '1556435401', null, '2', '', '0', '0', '{\"f1\":\"2.2356\",\"f2\":\"2.1772\",\"f3\":\"10.4850\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11383', '', '1556435460', '{\"banker\":[\"9c\",\"11b\"],\"player\":[\"5a\",\"11d\",\"5a\"]}', 'BANKER', '0', '1556435460', null, '2', '', '0', '0', '{\"f1\":\"2.2351\",\"f2\":\"2.1792\",\"f3\":\"10.4761\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11384', '', '1556435520', '{\"banker\":[\"6d\",\"3d\"],\"player\":[\"7c\",\"1c\"]}', 'BANKER', '0', '1556435520', null, '2', '', '0', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1792\",\"f3\":\"10.4906\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11385', '', '1556435580', '{\"banker\":[\"6b\",\"7c\",\"8d\"],\"player\":[\"4c\",\"1a\",\"9b\"]}', 'PLAYER', '0', '1556435580', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1779\",\"f3\":\"10.4727\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11386', '', '1556435640', '{\"banker\":[\"3c\",\"1a\",\"4c\"],\"player\":[\"4a\",\"5b\"]}', 'PLAYER', '0', '1556435640', null, '2', '', '0', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1799\",\"f3\":\"10.4914\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11387', '', '1556435700', '{\"banker\":[\"3c\",\"10a\",\"10a\"],\"player\":[\"9b\",\"13c\"]}', 'PLAYER', '0', '1556435700', null, '2', '', '0', '0', '{\"f1\":\"2.2382\",\"f2\":\"2.1766\",\"f3\":\"10.4888\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11388', '', '1556435760', '{\"banker\":[\"8b\",\"11b\"],\"player\":[\"6b\",\"1d\"]}', 'BANKER', '0', '1556435760', null, '2', '', '0', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1750\",\"f3\":\"10.4739\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11389', '', '1556435820', '{\"banker\":[\"10c\",\"5d\"],\"player\":[\"10d\",\"1d\",\"2c\"]}', 'BANKER', '0', '1556435820', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1756\",\"f3\":\"10.4853\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11390', '', '1556435880', '{\"banker\":[\"13c\",\"1a\",\"6d\"],\"player\":[\"5d\",\"8a\",\"11d\"]}', 'BANKER', '0', '1556435880', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1795\",\"f3\":\"10.4848\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11391', '', '1556435940', '{\"banker\":[\"11d\",\"9b\"],\"player\":[\"13b\",\"10b\",\"12b\"]}', 'BANKER', '0', '1556435940', null, '2', '', '0', '0', '{\"f1\":\"2.2370\",\"f2\":\"2.1770\",\"f3\":\"10.4941\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11392', '', '1556436000', '{\"banker\":[\"6d\",\"12c\"],\"player\":[\"5d\",\"5d\",\"13c\"]}', 'BANKER', '0', '1556436000', null, '2', '', '0', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1789\",\"f3\":\"10.4742\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11393', '', '1556436061', '{\"banker\":[\"12c\",\"1b\",\"7a\"],\"player\":[\"11a\",\"12c\",\"10a\"]}', 'BANKER', '0', '1556436061', null, '2', '', '0', '0', '{\"f1\":\"2.2352\",\"f2\":\"2.1784\",\"f3\":\"10.4826\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11394', '', '1556436133', '{\"banker\":[\"5c\",\"8a\",\"1c\"],\"player\":[\"2a\",\"3b\",\"3b\"]}', 'PLAYER', '0', '1556436133', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1779\",\"f3\":\"10.4823\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11395', '', '1556436180', '{\"banker\":[\"2a\",\"3d\",\"9d\"],\"player\":[\"1c\",\"5b\"]}', 'PLAYER', '0', '1556436180', null, '2', '', '0', '0', '{\"f1\":\"2.2388\",\"f2\":\"2.1775\",\"f3\":\"10.4722\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11396', '', '1556436240', '{\"banker\":[\"9b\",\"2b\",\"4a\"],\"player\":[\"9d\",\"8b\"]}', 'PLAYER', '0', '1556436240', null, '2', '', '0', '0', '{\"f1\":\"2.2377\",\"f2\":\"2.1771\",\"f3\":\"10.4888\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11397', '', '1556436300', '{\"banker\":[\"13c\",\"3d\",\"1c\"],\"player\":[\"7c\",\"9b\"]}', 'PLAYER', '0', '1556436300', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1796\",\"f3\":\"10.4808\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11398', '', '1556436360', '{\"banker\":[\"5a\",\"10c\",\"6b\"],\"player\":[\"8b\",\"1c\"]}', 'PLAYER', '0', '1556436360', null, '2', '', '0', '0', '{\"f1\":\"2.2387\",\"f2\":\"2.1766\",\"f3\":\"10.4840\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11399', '', '1556436420', '{\"banker\":[\"8b\",\"11a\"],\"player\":[\"12c\",\"4b\",\"3d\"]}', 'BANKER', '0', '1556436420', null, '2', '', '0', '0', '{\"f1\":\"2.2358\",\"f2\":\"2.1785\",\"f3\":\"10.4762\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11400', '', '1556436480', '{\"banker\":[\"8c\",\"3c\",\"9a\"],\"player\":[\"13c\",\"13d\",\"8a\"]}', 'PLAYER', '0', '1556436480', null, '2', '', '0', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1751\",\"f3\":\"10.4794\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11401', '', '1556436540', '{\"banker\":[\"2d\",\"7a\"],\"player\":[\"1a\",\"13a\",\"4a\"]}', 'BANKER', '0', '1556436540', null, '2', '', '0', '0', '{\"f1\":\"2.2367\",\"f2\":\"2.1783\",\"f3\":\"10.4802\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11402', '', '1556436600', '{\"banker\":[\"9b\",\"9c\"],\"player\":[\"10b\",\"5c\",\"11a\"]}', 'BANKER', '0', '1556436600', null, '2', '', '0', '0', '{\"f1\":\"2.2371\",\"f2\":\"2.1759\",\"f3\":\"10.4748\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11403', '', '1556436660', '{\"banker\":[\"2c\",\"5a\"],\"player\":[\"11d\",\"11d\",\"10b\"]}', 'BANKER', '0', '1556436660', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1782\",\"f3\":\"10.4726\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11404', '', '1556436721', '{\"banker\":[\"4a\",\"13b\",\"12b\"],\"player\":[\"5d\",\"13a\",\"6d\"]}', 'BANKER', '0', '1556436721', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1778\",\"f3\":\"10.4860\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11405', '', '1556436780', '{\"banker\":[\"3a\",\"4b\"],\"player\":[\"7d\",\"12a\"]}', 'TIE', '0', '1556436780', null, '2', '', '0', '0', '{\"f1\":\"2.2395\",\"f2\":\"2.1761\",\"f3\":\"10.4718\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11406', '', '1556436840', '{\"banker\":[\"11b\",\"10c\",\"6a\"],\"player\":[\"8c\",\"3d\",\"3a\"]}', 'BANKER', '0', '1556436840', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1767\",\"f3\":\"10.4814\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11407', '', '1556436900', '{\"banker\":[\"4b\",\"5a\"],\"player\":[\"8c\",\"3a\",\"6a\"]}', 'BANKER', '0', '1556436900', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1781\",\"f3\":\"10.4840\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11408', '', '1556436960', '{\"banker\":[\"7d\",\"9a\"],\"player\":[\"11a\",\"11d\",\"2b\"]}', 'BANKER', '0', '1556436960', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1750\",\"f3\":\"10.4888\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11409', '', '1556437020', '{\"banker\":[\"3b\",\"1d\",\"9b\"],\"player\":[\"3a\",\"9c\",\"3a\"]}', 'PLAYER', '0', '1556437020', null, '2', '', '0', '0', '{\"f1\":\"2.2390\",\"f2\":\"2.1774\",\"f3\":\"10.4783\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11410', '', '1556437080', '{\"banker\":[\"8c\",\"11b\"],\"player\":[\"5b\",\"12c\",\"5b\"]}', 'BANKER', '0', '1556437080', null, '2', '', '0', '0', '{\"f1\":\"2.2361\",\"f2\":\"2.1787\",\"f3\":\"10.4790\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11411', '', '1556437140', '{\"banker\":[\"11c\",\"10c\",\"2c\"],\"player\":[\"9a\",\"5a\",\"8b\"]}', 'TIE', '0', '1556437140', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1789\",\"f3\":\"10.4782\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11412', '', '1556437200', '{\"banker\":[\"6d\",\"7a\",\"5c\"],\"player\":[\"7c\",\"5c\",\"13b\"]}', 'BANKER', '0', '1556437200', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1766\",\"f3\":\"10.4945\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11413', '', '1556437260', '{\"banker\":[\"7d\",\"1c\"],\"player\":[\"6c\",\"1c\"]}', 'BANKER', '0', '1556437260', null, '2', '', '0', '0', '{\"f1\":\"2.2365\",\"f2\":\"2.1769\",\"f3\":\"10.4830\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11414', '', '1556437322', '{\"banker\":[\"7c\",\"13c\"],\"player\":[\"13c\",\"6d\"]}', 'BANKER', '0', '1556437322', null, '2', '', '0', '0', '{\"f1\":\"2.2361\",\"f2\":\"2.1755\",\"f3\":\"10.4912\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11415', '', '1556437380', '{\"banker\":[\"3c\",\"5b\"],\"player\":[\"8a\",\"4b\",\"4a\"]}', 'BANKER', '0', '1556437380', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1771\",\"f3\":\"10.4799\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11416', '', '1556437440', '{\"banker\":[\"4b\",\"8c\",\"1d\"],\"player\":[\"1d\",\"11d\",\"8c\"]}', 'PLAYER', '0', '1556437440', null, '2', '', '0', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1754\",\"f3\":\"10.4787\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11417', '', '1556437500', '{\"banker\":[\"3d\",\"1a\"],\"player\":[\"9a\",\"2d\",\"11d\"]}', 'BANKER', '0', '1556437500', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1783\",\"f3\":\"10.4936\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11418', '', '1556437560', '{\"banker\":[\"12c\",\"7c\"],\"player\":[\"1a\",\"12d\",\"13c\"]}', 'BANKER', '0', '1556437560', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1754\",\"f3\":\"10.4891\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11419', '', '1556437620', '{\"banker\":[\"7b\",\"8a\"],\"player\":[\"3c\",\"2d\",\"13b\"]}', 'TIE', '0', '1556437620', null, '2', '', '0', '0', '{\"f1\":\"2.2351\",\"f2\":\"2.1756\",\"f3\":\"10.4751\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11420', '', '1556437680', '{\"banker\":[\"7a\",\"10a\"],\"player\":[\"10a\",\"5b\",\"4c\"]}', 'PLAYER', '0', '1556437680', null, '2', '', '0', '0', '{\"f1\":\"2.2388\",\"f2\":\"2.1766\",\"f3\":\"10.4761\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11421', '', '1556437740', '{\"banker\":[\"9d\",\"3d\",\"6c\"],\"player\":[\"12b\",\"4d\",\"7d\"]}', 'BANKER', '0', '1556437740', null, '2', '', '0', '0', '{\"f1\":\"2.2379\",\"f2\":\"2.1788\",\"f3\":\"10.4792\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11422', '', '1556437800', '{\"banker\":[\"4b\",\"12c\"],\"player\":[\"9b\",\"4b\",\"10c\"]}', 'BANKER', '0', '1556437800', null, '2', '', '0', '0', '{\"f1\":\"2.2395\",\"f2\":\"2.1759\",\"f3\":\"10.4945\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11423', '', '1556437860', '{\"banker\":[\"2d\",\"6b\"],\"player\":[\"13c\",\"13b\",\"2c\"]}', 'BANKER', '0', '1556437860', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1789\",\"f3\":\"10.4795\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11424', '', '1556437920', '{\"banker\":[\"5a\",\"13d\",\"2b\"],\"player\":[\"11c\",\"9d\"]}', 'PLAYER', '0', '1556437920', null, '2', '', '0', '0', '{\"f1\":\"2.2355\",\"f2\":\"2.1778\",\"f3\":\"10.4771\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11425', '', '1556437980', '{\"banker\":[\"4b\",\"12c\"],\"player\":[\"5c\",\"11b\",\"8a\"]}', 'BANKER', '0', '1556437980', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1799\",\"f3\":\"10.4797\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11426', '', '1556438040', '{\"banker\":[\"7d\",\"9b\"],\"player\":[\"4c\",\"4b\"]}', 'PLAYER', '0', '1556438040', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1799\",\"f3\":\"10.4936\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11427', '', '1556438100', '{\"banker\":[\"8a\",\"4c\",\"12c\"],\"player\":[\"8d\",\"2a\",\"12b\"]}', 'BANKER', '0', '1556438100', null, '2', '', '0', '0', '{\"f1\":\"2.2350\",\"f2\":\"2.1750\",\"f3\":\"10.4708\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11428', '', '1556438160', '{\"banker\":[\"12d\",\"7d\"],\"player\":[\"2c\",\"3b\",\"8c\"]}', 'BANKER', '0', '1556438160', null, '2', '', '0', '0', '{\"f1\":\"2.2375\",\"f2\":\"2.1785\",\"f3\":\"10.4771\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11429', '', '1556438220', '{\"banker\":[\"8b\",\"6b\",\"5a\"],\"player\":[\"13d\",\"12b\",\"6d\"]}', 'BANKER', '0', '1556438220', null, '2', '', '0', '0', '{\"f1\":\"2.2374\",\"f2\":\"2.1757\",\"f3\":\"10.4926\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11430', '', '1556438280', '{\"banker\":[\"5a\",\"1b\"],\"player\":[\"6c\",\"8d\",\"10b\"]}', 'BANKER', '0', '1556438280', null, '2', '', '0', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1784\",\"f3\":\"10.4834\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11431', '', '1556438340', '{\"banker\":[\"11a\",\"3d\",\"9d\"],\"player\":[\"1b\",\"6b\"]}', 'PLAYER', '0', '1556438340', null, '2', '', '0', '0', '{\"f1\":\"2.2384\",\"f2\":\"2.1752\",\"f3\":\"10.4813\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11432', '', '1556438400', '{\"banker\":[\"7a\",\"2c\"],\"player\":[\"7b\",\"6d\",\"7a\"]}', 'BANKER', '0', '1556438400', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1771\",\"f3\":\"10.4748\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11433', '', '1556438460', '{\"banker\":[\"7c\",\"5c\",\"9a\"],\"player\":[\"11d\",\"12c\",\"10a\"]}', 'BANKER', '0', '1556438460', null, '2', '', '0', '0', '{\"f1\":\"2.2379\",\"f2\":\"2.1799\",\"f3\":\"10.4717\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11434', '', '1556438520', '{\"banker\":[\"6d\",\"8c\"],\"player\":[\"13d\",\"11c\",\"11c\"]}', 'BANKER', '0', '1556438520', null, '2', '', '0', '0', '{\"f1\":\"2.2377\",\"f2\":\"2.1750\",\"f3\":\"10.4803\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11435', '', '1556438580', '{\"banker\":[\"2b\",\"12a\",\"3c\"],\"player\":[\"9d\",\"7a\"]}', 'PLAYER', '0', '1556438580', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1781\",\"f3\":\"10.4845\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11436', '', '1556438640', '{\"banker\":[\"8a\",\"9c\"],\"player\":[\"10d\",\"10b\",\"5a\"]}', 'BANKER', '0', '1556438640', null, '2', '', '0', '0', '{\"f1\":\"2.2379\",\"f2\":\"2.1793\",\"f3\":\"10.4767\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11437', '', '1556438700', '{\"banker\":[\"2d\",\"11a\",\"13b\"],\"player\":[\"7d\",\"1c\"]}', 'PLAYER', '0', '1556438700', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1750\",\"f3\":\"10.4821\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11438', '', '1556438760', '{\"banker\":[\"10b\",\"5c\"],\"player\":[\"3c\",\"7c\",\"8c\"]}', 'PLAYER', '0', '1556438760', null, '2', '', '0', '0', '{\"f1\":\"2.2387\",\"f2\":\"2.1764\",\"f3\":\"10.4702\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11439', '', '1556438820', '{\"banker\":[\"6c\",\"5a\",\"8a\"],\"player\":[\"13d\",\"9a\"]}', 'TIE', '0', '1556438820', null, '2', '', '0', '0', '{\"f1\":\"2.2372\",\"f2\":\"2.1798\",\"f3\":\"10.4913\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11440', '', '1556438880', '{\"banker\":[\"11c\",\"9d\"],\"player\":[\"4c\",\"8d\",\"2c\"]}', 'BANKER', '0', '1556438880', null, '2', '', '0', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1754\",\"f3\":\"10.4853\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11441', '', '1556438940', '{\"banker\":[\"5c\",\"8b\",\"9c\"],\"player\":[\"13c\",\"3d\",\"3c\"]}', 'PLAYER', '0', '1556438940', null, '2', '', '0', '0', '{\"f1\":\"2.2356\",\"f2\":\"2.1793\",\"f3\":\"10.4863\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11442', '', '1556439000', '{\"banker\":[\"13a\",\"1c\",\"5d\"],\"player\":[\"8a\",\"9a\"]}', 'PLAYER', '0', '1556439000', null, '2', '', '0', '0', '{\"f1\":\"2.2361\",\"f2\":\"2.1760\",\"f3\":\"10.4849\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11443', '', '1556439060', '{\"banker\":[\"6c\",\"9d\",\"7b\"],\"player\":[\"8b\",\"10b\"]}', 'PLAYER', '0', '1556439060', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1782\",\"f3\":\"10.4833\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11444', '', '1556439120', '{\"banker\":[\"10d\",\"13b\",\"11d\"],\"player\":[\"8d\",\"12c\"]}', 'PLAYER', '0', '1556439120', null, '2', '', '0', '0', '{\"f1\":\"2.2371\",\"f2\":\"2.1751\",\"f3\":\"10.4851\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11445', '', '1556439180', '{\"banker\":[\"4b\",\"2c\"],\"player\":[\"1c\",\"1d\",\"1a\"]}', 'BANKER', '0', '1556439180', null, '2', '', '0', '0', '{\"f1\":\"2.2394\",\"f2\":\"2.1764\",\"f3\":\"10.4864\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11446', '', '1556439240', '{\"banker\":[\"12a\",\"10b\",\"11c\"],\"player\":[\"12c\",\"3b\",\"12b\"]}', 'PLAYER', '0', '1556439240', null, '2', '', '0', '0', '{\"f1\":\"2.2376\",\"f2\":\"2.1778\",\"f3\":\"10.4722\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11447', '', '1556439300', '{\"banker\":[\"8b\",\"13c\"],\"player\":[\"12d\",\"2c\",\"5c\"]}', 'BANKER', '0', '1556439300', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1798\",\"f3\":\"10.4943\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11448', '', '1556439360', '{\"banker\":[\"5a\",\"9a\",\"6c\"],\"player\":[\"8d\",\"12b\"]}', 'PLAYER', '0', '1556439360', null, '2', '', '0', '0', '{\"f1\":\"2.2367\",\"f2\":\"2.1774\",\"f3\":\"10.4919\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11449', '', '1556439420', '{\"banker\":[\"5b\",\"12b\",\"3b\"],\"player\":[\"8c\",\"11a\"]}', 'TIE', '0', '1556439420', null, '2', '', '0', '0', '{\"f1\":\"2.2374\",\"f2\":\"2.1751\",\"f3\":\"10.4733\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11450', '', '1556439480', '{\"banker\":[\"2d\",\"7d\"],\"player\":[\"6a\",\"8b\",\"11b\"]}', 'BANKER', '0', '1556439480', null, '2', '', '0', '0', '{\"f1\":\"2.2367\",\"f2\":\"2.1756\",\"f3\":\"10.4756\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11451', '', '1556439540', '{\"banker\":[\"2a\",\"10c\",\"13b\"],\"player\":[\"1b\",\"6c\"]}', 'PLAYER', '0', '1556439540', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1774\",\"f3\":\"10.4714\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11452', '', '1556439600', '{\"banker\":[\"11a\",\"2c\",\"3b\"],\"player\":[\"9a\",\"8b\"]}', 'PLAYER', '0', '1556439600', null, '2', '', '0', '0', '{\"f1\":\"2.2380\",\"f2\":\"2.1796\",\"f3\":\"10.4945\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11453', '', '1556439660', '{\"banker\":[\"13a\",\"8d\"],\"player\":[\"9c\",\"2d\",\"1d\"]}', 'BANKER', '0', '1556439660', null, '2', '', '0', '0', '{\"f1\":\"2.2387\",\"f2\":\"2.1763\",\"f3\":\"10.4880\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11454', '', '1556439720', '{\"banker\":[\"10d\",\"12d\",\"13b\"],\"player\":[\"8c\",\"1c\"]}', 'PLAYER', '0', '1556439720', null, '2', '', '0', '0', '{\"f1\":\"2.2395\",\"f2\":\"2.1795\",\"f3\":\"10.4738\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11455', '', '1556439780', '{\"banker\":[\"3d\",\"12b\",\"7c\"],\"player\":[\"2b\",\"7b\"]}', 'PLAYER', '0', '1556439780', null, '2', '', '0', '0', '{\"f1\":\"2.2392\",\"f2\":\"2.1753\",\"f3\":\"10.4890\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11456', '', '1556439840', '{\"banker\":[\"10a\",\"13d\",\"2a\"],\"player\":[\"2c\",\"7d\"]}', 'PLAYER', '0', '1556439840', null, '2', '', '0', '0', '{\"f1\":\"2.2368\",\"f2\":\"2.1779\",\"f3\":\"10.4769\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11457', '', '1556439900', '{\"banker\":[\"2b\",\"11c\",\"13d\"],\"player\":[\"6b\",\"8a\",\"8c\"]}', 'TIE', '0', '1556439900', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1754\",\"f3\":\"10.4910\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11458', '', '1556439960', '{\"banker\":[\"7b\",\"9b\"],\"player\":[\"7c\",\"5c\",\"4c\"]}', 'TIE', '0', '1556439960', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1751\",\"f3\":\"10.4809\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11459', '', '1556440020', '{\"banker\":[\"2b\",\"8d\",\"4d\"],\"player\":[\"9d\",\"4a\",\"1a\"]}', 'TIE', '0', '1556440020', null, '2', '', '0', '0', '{\"f1\":\"2.2395\",\"f2\":\"2.1761\",\"f3\":\"10.4849\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11460', '', '1556440080', '{\"banker\":[\"11c\",\"9a\"],\"player\":[\"7a\",\"1c\"]}', 'BANKER', '0', '1556440080', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1762\",\"f3\":\"10.4815\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11461', '', '1556440140', '{\"banker\":[\"4b\",\"10b\",\"12b\"],\"player\":[\"3b\",\"6d\"]}', 'PLAYER', '0', '1556440140', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1754\",\"f3\":\"10.4753\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11462', '', '1556440200', '{\"banker\":[\"10d\",\"1c\",\"1c\"],\"player\":[\"5d\",\"1a\"]}', 'PLAYER', '0', '1556440200', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1764\",\"f3\":\"10.4874\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11463', '', '1556440260', '{\"banker\":[\"7d\",\"3b\",\"3a\"],\"player\":[\"8c\",\"2d\",\"10c\"]}', 'BANKER', '0', '1556440260', null, '2', '', '0', '0', '{\"f1\":\"2.2399\",\"f2\":\"2.1751\",\"f3\":\"10.4793\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11464', '', '1556440320', '{\"banker\":[\"1c\",\"8b\"],\"player\":[\"5a\",\"5d\",\"9a\"]}', 'TIE', '0', '1556440320', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1784\",\"f3\":\"10.4903\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11465', '', '1556440380', '{\"banker\":[\"9a\",\"13c\"],\"player\":[\"9a\",\"10c\"]}', 'TIE', '0', '1556440380', null, '2', '', '0', '0', '{\"f1\":\"2.2369\",\"f2\":\"2.1768\",\"f3\":\"10.4846\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11466', '', '1556440440', '{\"banker\":[\"4a\",\"1b\",\"1b\"],\"player\":[\"4a\",\"12d\",\"7d\"]}', 'BANKER', '0', '1556440440', null, '2', '', '0', '0', '{\"f1\":\"2.2398\",\"f2\":\"2.1764\",\"f3\":\"10.4916\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11467', '', '1556440500', '{\"banker\":[\"2c\",\"8c\",\"12b\"],\"player\":[\"10c\",\"13b\",\"2c\"]}', 'PLAYER', '0', '1556440500', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1771\",\"f3\":\"10.4803\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11468', '', '1556440560', '{\"banker\":[\"1d\",\"10a\",\"13a\"],\"player\":[\"4a\",\"5a\"]}', 'PLAYER', '0', '1556440560', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1757\",\"f3\":\"10.4833\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11469', '', '1556440620', '{\"banker\":[\"6d\",\"2c\"],\"player\":[\"4c\",\"5d\"]}', 'PLAYER', '0', '1556440620', null, '2', '', '0', '0', '{\"f1\":\"2.2350\",\"f2\":\"2.1760\",\"f3\":\"10.4747\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11470', '', '1556440680', '{\"banker\":[\"7d\",\"11c\"],\"player\":[\"4c\",\"11c\",\"13c\"]}', 'BANKER', '0', '1556440680', null, '2', '', '0', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1765\",\"f3\":\"10.4873\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11471', '', '1556440740', '{\"banker\":[\"4c\",\"3a\"],\"player\":[\"3c\",\"4d\"]}', 'TIE', '0', '1556440740', null, '2', '', '0', '0', '{\"f1\":\"2.2367\",\"f2\":\"2.1789\",\"f3\":\"10.4702\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11472', '', '1556440800', '{\"banker\":[\"11a\",\"3b\"],\"player\":[\"6a\",\"4a\",\"8d\"]}', 'PLAYER', '0', '1556440800', null, '2', '', '0', '0', '{\"f1\":\"2.2398\",\"f2\":\"2.1796\",\"f3\":\"10.4828\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11473', '', '1556440860', '{\"banker\":[\"3a\",\"2d\",\"8d\"],\"player\":[\"13b\",\"5a\",\"7b\"]}', 'BANKER', '0', '1556440860', null, '2', '', '0', '0', '{\"f1\":\"2.2369\",\"f2\":\"2.1759\",\"f3\":\"10.4766\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11474', '', '1556440920', '{\"banker\":[\"13a\",\"2c\",\"12a\"],\"player\":[\"3b\",\"3d\"]}', 'PLAYER', '0', '1556440920', null, '2', '', '0', '0', '{\"f1\":\"2.2370\",\"f2\":\"2.1760\",\"f3\":\"10.4948\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11475', '', '1556440980', '{\"banker\":[\"10c\",\"8c\"],\"player\":[\"5a\",\"8a\",\"3b\"]}', 'BANKER', '0', '1556440980', null, '2', '', '0', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1768\",\"f3\":\"10.4846\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11476', '', '1556441040', '{\"banker\":[\"3d\",\"12a\",\"6b\"],\"player\":[\"8d\",\"8b\"]}', 'BANKER', '0', '1556441040', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1769\",\"f3\":\"10.4917\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11477', '', '1556441100', '{\"banker\":[\"2c\",\"10c\",\"8b\"],\"player\":[\"6a\",\"7a\",\"5c\"]}', 'PLAYER', '0', '1556441100', null, '2', '', '0', '0', '{\"f1\":\"2.2350\",\"f2\":\"2.1769\",\"f3\":\"10.4745\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11478', '', '1556441160', '{\"banker\":[\"8c\",\"2d\",\"1d\"],\"player\":[\"8b\",\"7a\",\"4c\"]}', 'PLAYER', '0', '1556441160', null, '2', '', '0', '0', '{\"f1\":\"2.2367\",\"f2\":\"2.1771\",\"f3\":\"10.4820\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11479', '', '1556441220', '{\"banker\":[\"4d\",\"4a\"],\"player\":[\"13a\",\"10d\",\"5c\"]}', 'BANKER', '0', '1556441220', null, '2', '', '0', '0', '{\"f1\":\"2.2366\",\"f2\":\"2.1783\",\"f3\":\"10.4949\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11480', '', '1556441280', '{\"banker\":[\"1c\",\"5b\"],\"player\":[\"8a\",\"6c\",\"2c\"]}', 'TIE', '0', '1556441280', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1753\",\"f3\":\"10.4803\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11481', '', '1556441340', '{\"banker\":[\"4a\",\"12b\"],\"player\":[\"7c\",\"3b\",\"12a\"]}', 'BANKER', '0', '1556441340', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1767\",\"f3\":\"10.4872\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11482', '', '1556441400', '{\"banker\":[\"4a\",\"10b\"],\"player\":[\"6d\",\"5c\",\"9a\"]}', 'BANKER', '0', '1556441400', null, '2', '', '0', '0', '{\"f1\":\"2.2385\",\"f2\":\"2.1768\",\"f3\":\"10.4939\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11483', '', '1556441460', '{\"banker\":[\"6a\",\"3a\"],\"player\":[\"1a\",\"1b\",\"6c\"]}', 'BANKER', '0', '1556441460', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1756\",\"f3\":\"10.4737\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11484', '', '1556441520', '{\"banker\":[\"13a\",\"12b\",\"12d\"],\"player\":[\"6b\",\"3c\"]}', 'PLAYER', '0', '1556441520', null, '2', '', '0', '0', '{\"f1\":\"2.2398\",\"f2\":\"2.1776\",\"f3\":\"10.4901\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11485', '', '1556441580', '{\"banker\":[\"2d\",\"7a\"],\"player\":[\"11b\",\"9b\"]}', 'TIE', '0', '1556441580', null, '2', '', '0', '0', '{\"f1\":\"2.2385\",\"f2\":\"2.1772\",\"f3\":\"10.4769\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11486', '', '1556441640', '{\"banker\":[\"12d\",\"3a\",\"6c\"],\"player\":[\"9c\",\"7d\"]}', 'BANKER', '0', '1556441640', null, '2', '', '0', '0', '{\"f1\":\"2.2355\",\"f2\":\"2.1799\",\"f3\":\"10.4911\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11487', '', '1556441700', '{\"banker\":[\"9b\",\"4a\",\"7c\"],\"player\":[\"12d\",\"3d\",\"13a\"]}', 'PLAYER', '0', '1556441700', null, '2', '', '0', '0', '{\"f1\":\"2.2384\",\"f2\":\"2.1752\",\"f3\":\"10.4850\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11488', '', '1556441760', '{\"banker\":[\"7c\",\"5a\",\"9c\"],\"player\":[\"10c\",\"1c\",\"10d\"]}', 'TIE', '0', '1556441760', null, '2', '', '0', '0', '{\"f1\":\"2.2385\",\"f2\":\"2.1797\",\"f3\":\"10.4868\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11489', '', '1556441820', '{\"banker\":[\"11b\",\"7d\"],\"player\":[\"12b\",\"4b\",\"4a\"]}', 'PLAYER', '0', '1556441820', null, '2', '', '0', '0', '{\"f1\":\"2.2367\",\"f2\":\"2.1780\",\"f3\":\"10.4919\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11490', '', '1556441880', '{\"banker\":[\"12c\",\"2c\",\"4c\"],\"player\":[\"6c\",\"9c\",\"5c\"]}', 'BANKER', '0', '1556441880', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1770\",\"f3\":\"10.4728\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11491', '', '1556441940', '{\"banker\":[\"9b\",\"2a\",\"13d\"],\"player\":[\"2a\",\"8b\",\"7c\"]}', 'PLAYER', '0', '1556441940', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1791\",\"f3\":\"10.4751\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11492', '', '1556442000', '{\"banker\":[\"2d\",\"12c\",\"12c\"],\"player\":[\"6c\",\"12d\"]}', 'PLAYER', '0', '1556442000', null, '2', '', '0', '0', '{\"f1\":\"2.2377\",\"f2\":\"2.1762\",\"f3\":\"10.4752\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11493', '', '1556442060', '{\"banker\":[\"3b\",\"7b\",\"13d\"],\"player\":[\"11a\",\"5b\",\"8a\"]}', 'PLAYER', '0', '1556442060', null, '2', '', '0', '0', '{\"f1\":\"2.2368\",\"f2\":\"2.1784\",\"f3\":\"10.4828\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11494', '', '1556442120', '{\"banker\":[\"6b\",\"13d\"],\"player\":[\"7d\",\"3d\",\"9b\"]}', 'PLAYER', '0', '1556442120', null, '2', '', '0', '0', '{\"f1\":\"2.2372\",\"f2\":\"2.1778\",\"f3\":\"10.4752\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11495', '', '1556442180', '{\"banker\":[\"1c\",\"11d\",\"2c\"],\"player\":[\"10a\",\"11d\",\"1a\"]}', 'BANKER', '0', '1556442180', null, '2', '', '0', '0', '{\"f1\":\"2.2374\",\"f2\":\"2.1752\",\"f3\":\"10.4826\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11496', '', '1556442240', '{\"banker\":[\"4a\",\"1a\",\"1b\"],\"player\":[\"8b\",\"13c\"]}', 'PLAYER', '0', '1556442240', null, '2', '', '0', '0', '{\"f1\":\"2.2350\",\"f2\":\"2.1753\",\"f3\":\"10.4935\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11497', '', '1556442300', '{\"banker\":[\"3a\",\"12d\",\"7d\"],\"player\":[\"1d\",\"5c\"]}', 'PLAYER', '0', '1556442300', null, '2', '', '0', '0', '{\"f1\":\"2.2350\",\"f2\":\"2.1779\",\"f3\":\"10.4880\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11498', '', '1556442360', '{\"banker\":[\"11b\",\"10a\",\"13d\"],\"player\":[\"9d\",\"5a\",\"4b\"]}', 'PLAYER', '0', '1556442360', null, '2', '', '0', '0', '{\"f1\":\"2.2380\",\"f2\":\"2.1767\",\"f3\":\"10.4877\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11499', '', '1556442420', '{\"banker\":[\"2b\",\"2d\"],\"player\":[\"10a\",\"4b\",\"1d\"]}', 'PLAYER', '0', '1556442420', null, '2', '', '0', '0', '{\"f1\":\"2.2374\",\"f2\":\"2.1788\",\"f3\":\"10.4864\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11500', '', '1556442480', '{\"banker\":[\"11d\",\"12c\",\"12d\"],\"player\":[\"8a\",\"3d\",\"13d\"]}', 'PLAYER', '0', '1556442480', null, '2', '', '0', '0', '{\"f1\":\"2.2370\",\"f2\":\"2.1796\",\"f3\":\"10.4835\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11501', '', '1556442540', '{\"banker\":[\"7c\",\"8a\"],\"player\":[\"1b\",\"1b\",\"11d\"]}', 'BANKER', '0', '1556442540', null, '2', '', '0', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1762\",\"f3\":\"10.4727\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11502', '', '1556442600', '{\"banker\":[\"2b\",\"4d\"],\"player\":[\"10d\",\"6b\"]}', 'TIE', '0', '1556442600', null, '2', '', '0', '0', '{\"f1\":\"2.2384\",\"f2\":\"2.1766\",\"f3\":\"10.4876\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11503', '', '1556442660', '{\"banker\":[\"8c\",\"11d\"],\"player\":[\"13c\",\"12a\",\"8d\"]}', 'TIE', '0', '1556442660', null, '2', '', '0', '0', '{\"f1\":\"2.2372\",\"f2\":\"2.1754\",\"f3\":\"10.4800\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11504', '', '1556442720', '{\"banker\":[\"13a\",\"4d\",\"11c\"],\"player\":[\"11b\",\"2d\",\"7b\"]}', 'PLAYER', '0', '1556442720', null, '2', '', '0', '0', '{\"f1\":\"2.2358\",\"f2\":\"2.1779\",\"f3\":\"10.4868\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11505', '', '1556442780', '{\"banker\":[\"7a\",\"3c\",\"1d\"],\"player\":[\"7c\",\"1c\"]}', 'PLAYER', '0', '1556442780', null, '2', '', '0', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1773\",\"f3\":\"10.4809\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11506', '', '1556442840', '{\"banker\":[\"3b\",\"10d\",\"9d\"],\"player\":[\"4a\",\"12b\",\"13c\"]}', 'PLAYER', '0', '1556442840', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1776\",\"f3\":\"10.4799\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11507', '', '1556442900', '{\"banker\":[\"1a\",\"5c\"],\"player\":[\"12b\",\"11d\",\"10a\"]}', 'BANKER', '0', '1556442900', null, '2', '', '0', '0', '{\"f1\":\"2.2370\",\"f2\":\"2.1797\",\"f3\":\"10.4711\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11508', '', '1556442961', '{\"banker\":[\"6b\",\"4d\",\"13b\"],\"player\":[\"8d\",\"7c\",\"1d\"]}', 'PLAYER', '0', '1556442961', null, '2', '', '0', '0', '{\"f1\":\"2.2365\",\"f2\":\"2.1764\",\"f3\":\"10.4766\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11509', '', '1556443020', '{\"banker\":[\"9d\",\"6b\",\"4c\"],\"player\":[\"8b\",\"11c\"]}', 'BANKER', '0', '1556443020', null, '2', '', '0', '0', '{\"f1\":\"2.2387\",\"f2\":\"2.1771\",\"f3\":\"10.4720\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11510', '', '1556443080', '{\"banker\":[\"3d\",\"9d\",\"4a\"],\"player\":[\"4a\",\"13a\",\"12b\"]}', 'BANKER', '0', '1556443080', null, '2', '', '0', '0', '{\"f1\":\"2.2388\",\"f2\":\"2.1769\",\"f3\":\"10.4742\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11511', '', '1556443140', '{\"banker\":[\"4d\",\"10c\",\"13c\"],\"player\":[\"8c\",\"8a\"]}', 'PLAYER', '0', '1556443140', null, '2', '', '0', '0', '{\"f1\":\"2.2372\",\"f2\":\"2.1795\",\"f3\":\"10.4851\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11512', '', '1556443200', '{\"banker\":[\"5c\",\"7d\",\"10a\"],\"player\":[\"1a\",\"11c\",\"13c\"]}', 'BANKER', '0', '1556443200', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1779\",\"f3\":\"10.4705\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11513', '', '1556443260', '{\"banker\":[\"8b\",\"10b\"],\"player\":[\"1b\",\"13a\",\"3b\"]}', 'BANKER', '0', '1556443260', null, '2', '', '0', '0', '{\"f1\":\"2.2377\",\"f2\":\"2.1758\",\"f3\":\"10.4737\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11514', '', '1556443321', '{\"banker\":[\"8a\",\"1c\"],\"player\":[\"9c\",\"6b\",\"12b\"]}', 'BANKER', '0', '1556443321', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1777\",\"f3\":\"10.4829\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11515', '', '1556443380', '{\"banker\":[\"4d\",\"13c\",\"1d\"],\"player\":[\"1b\",\"7b\"]}', 'PLAYER', '0', '1556443380', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1772\",\"f3\":\"10.4737\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11516', '', '1556443440', '{\"banker\":[\"4a\",\"7a\",\"9c\"],\"player\":[\"2c\",\"10d\",\"2a\"]}', 'PLAYER', '0', '1556443440', null, '2', '', '0', '0', '{\"f1\":\"2.2371\",\"f2\":\"2.1759\",\"f3\":\"10.4916\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11517', '', '1556443500', '{\"banker\":[\"4d\",\"7d\",\"10b\"],\"player\":[\"5d\",\"6b\",\"11d\"]}', 'TIE', '0', '1556443500', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1790\",\"f3\":\"10.4852\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11518', '', '1556443561', '{\"banker\":[\"1a\",\"9b\",\"9c\"],\"player\":[\"11c\",\"4c\",\"2b\"]}', 'BANKER', '0', '1556443561', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1792\",\"f3\":\"10.4869\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11519', '', '1556443620', '{\"banker\":[\"7b\",\"10d\"],\"player\":[\"11b\",\"1b\",\"7c\"]}', 'PLAYER', '0', '1556443620', null, '2', '', '0', '0', '{\"f1\":\"2.2374\",\"f2\":\"2.1773\",\"f3\":\"10.4710\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11520', '', '1556443680', '{\"banker\":[\"3b\",\"3a\"],\"player\":[\"2b\",\"11c\",\"9c\"]}', 'BANKER', '0', '1556443680', null, '2', '', '0', '0', '{\"f1\":\"2.2379\",\"f2\":\"2.1791\",\"f3\":\"10.4859\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11521', '', '1556443740', '{\"banker\":[\"10a\",\"13b\",\"7c\"],\"player\":[\"7b\",\"3c\",\"11c\"]}', 'BANKER', '0', '1556443740', null, '2', '', '0', '0', '{\"f1\":\"2.2372\",\"f2\":\"2.1758\",\"f3\":\"10.4819\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11522', '', '1556443800', '{\"banker\":[\"11d\",\"13c\",\"12d\"],\"player\":[\"3a\",\"13b\",\"5d\"]}', 'PLAYER', '0', '1556443800', null, '2', '', '0', '0', '{\"f1\":\"2.2388\",\"f2\":\"2.1767\",\"f3\":\"10.4770\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11523', '', '1556443860', '{\"banker\":[\"13a\",\"8c\"],\"player\":[\"12c\",\"10a\",\"3d\"]}', 'BANKER', '0', '1556443860', null, '2', '', '0', '0', '{\"f1\":\"2.2355\",\"f2\":\"2.1792\",\"f3\":\"10.4923\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11524', '', '1556443920', '{\"banker\":[\"3a\",\"8d\",\"5c\"],\"player\":[\"7c\",\"2a\"]}', 'PLAYER', '0', '1556443920', null, '2', '', '0', '0', '{\"f1\":\"2.2377\",\"f2\":\"2.1767\",\"f3\":\"10.4941\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11525', '', '1556443980', '{\"banker\":[\"11b\",\"12a\",\"9c\"],\"player\":[\"10c\",\"5a\",\"8b\"]}', 'BANKER', '0', '1556443980', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1775\",\"f3\":\"10.4748\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11526', '', '1556450705', '{\"banker\":[\"4a\",\"12c\"],\"player\":[\"13c\",\"10a\",\"9c\"]}', 'PLAYER', '0', '1556450705', null, '2', '', '0', '0', '{\"f1\":\"2.2388\",\"f2\":\"2.1789\",\"f3\":\"10.4789\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11527', '', '1556450760', '{\"banker\":[\"3b\",\"2a\",\"5b\"],\"player\":[\"8d\",\"6a\",\"7c\"]}', 'PLAYER', '0', '1556450760', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1777\",\"f3\":\"10.4904\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11528', '', '1556450820', '{\"banker\":[\"12b\",\"3b\",\"6d\"],\"player\":[\"13c\",\"4b\",\"11b\"]}', 'BANKER', '0', '1556450820', null, '2', '', '0', '0', '{\"f1\":\"2.2371\",\"f2\":\"2.1769\",\"f3\":\"10.4875\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11529', '', '1556450880', '{\"banker\":[\"4b\",\"12d\",\"11d\"],\"player\":[\"6b\",\"4c\",\"7c\"]}', 'PLAYER', '0', '1556450880', null, '2', '', '0', '0', '{\"f1\":\"2.2369\",\"f2\":\"2.1750\",\"f3\":\"10.4825\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11530', '', '1556450940', '{\"banker\":[\"5c\",\"8b\",\"7a\"],\"player\":[\"11a\",\"8a\"]}', 'PLAYER', '0', '1556450940', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1764\",\"f3\":\"10.4818\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11531', '', '1556451000', '{\"banker\":[\"7d\",\"1a\"],\"player\":[\"1d\",\"6c\"]}', 'BANKER', '0', '1556451000', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1759\",\"f3\":\"10.4763\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11532', '', '1556451060', '{\"banker\":[\"9c\",\"6b\",\"1a\"],\"player\":[\"6b\",\"2a\"]}', 'PLAYER', '0', '1556451060', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1766\",\"f3\":\"10.4789\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11533', '', '1556451120', '{\"banker\":[\"10b\",\"2a\",\"13b\"],\"player\":[\"1b\",\"7d\"]}', 'PLAYER', '0', '1556451120', null, '2', '', '0', '0', '{\"f1\":\"2.2366\",\"f2\":\"2.1750\",\"f3\":\"10.4823\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11534', '', '1556451181', '{\"banker\":[\"12c\",\"8d\"],\"player\":[\"13c\",\"11a\",\"9c\"]}', 'PLAYER', '0', '1556451181', null, '2', '', '0', '0', '{\"f1\":\"2.2377\",\"f2\":\"2.1797\",\"f3\":\"10.4857\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11535', '', '1556451240', '{\"banker\":[\"11a\",\"6d\"],\"player\":[\"7d\",\"4d\",\"13c\"]}', 'BANKER', '0', '1556451240', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1755\",\"f3\":\"10.4702\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11536', '', '1556451295', '{\"banker\":[\"5d\",\"1d\"],\"player\":[\"3c\",\"3c\"]}', 'TIE', '0', '1556451295', null, '2', '', '0', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1779\",\"f3\":\"10.4723\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11537', '', '1556451300', '{\"banker\":[\"6a\",\"7a\",\"3b\"],\"player\":[\"12a\",\"10c\",\"1c\"]}', 'BANKER', '0', '1556451300', null, '2', '', '0', '0', '{\"f1\":\"2.2385\",\"f2\":\"2.1794\",\"f3\":\"10.4786\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11538', '', '1556451360', '{\"banker\":[\"7b\",\"13c\"],\"player\":[\"7c\",\"12a\"]}', 'TIE', '0', '1556451360', null, '2', '', '0', '0', '{\"f1\":\"2.2380\",\"f2\":\"2.1750\",\"f3\":\"10.4785\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11539', '', '1556451420', '{\"banker\":[\"10b\",\"5d\"],\"player\":[\"7a\",\"5d\",\"8b\"]}', 'BANKER', '0', '1556451420', null, '2', '', '0', '0', '{\"f1\":\"2.2371\",\"f2\":\"2.1790\",\"f3\":\"10.4736\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11540', '', '1556451480', '{\"banker\":[\"13d\",\"3a\",\"12a\"],\"player\":[\"10b\",\"4c\",\"11a\"]}', 'PLAYER', '0', '1556451480', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1761\",\"f3\":\"10.4865\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11541', '', '1556451540', '{\"banker\":[\"9d\",\"6b\"],\"player\":[\"11c\",\"2a\",\"1a\"]}', 'BANKER', '0', '1556451540', null, '2', '', '0', '0', '{\"f1\":\"2.2351\",\"f2\":\"2.1757\",\"f3\":\"10.4739\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11542', '', '1556451600', '{\"banker\":[\"8b\",\"1a\"],\"player\":[\"13a\",\"13c\",\"13c\"]}', 'BANKER', '0', '1556451600', null, '2', '', '0', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1794\",\"f3\":\"10.4720\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11543', '', '1556451660', '{\"banker\":[\"6a\",\"11d\"],\"player\":[\"1b\",\"7c\"]}', 'PLAYER', '0', '1556451660', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1770\",\"f3\":\"10.4820\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11544', '', '1556451720', '{\"banker\":[\"2d\",\"5c\"],\"player\":[\"4a\",\"5a\"]}', 'PLAYER', '0', '1556451720', null, '2', '', '0', '0', '{\"f1\":\"2.2382\",\"f2\":\"2.1791\",\"f3\":\"10.4792\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11545', '', '1556451780', '{\"banker\":[\"10a\",\"13d\",\"1c\"],\"player\":[\"2d\",\"3c\",\"3b\"]}', 'PLAYER', '0', '1556451780', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1751\",\"f3\":\"10.4908\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11546', '', '1556451840', '{\"banker\":[\"12c\",\"7d\"],\"player\":[\"7a\",\"8b\",\"12c\"]}', 'BANKER', '0', '1556451840', null, '2', '', '0', '0', '{\"f1\":\"2.2390\",\"f2\":\"2.1779\",\"f3\":\"10.4876\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11547', '', '1556451900', '{\"banker\":[\"1c\",\"5c\",\"1b\"],\"player\":[\"5a\",\"8b\",\"7b\"]}', 'BANKER', '0', '1556451900', null, '2', '', '0', '0', '{\"f1\":\"2.2352\",\"f2\":\"2.1765\",\"f3\":\"10.4724\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11548', '', '1556451960', '{\"banker\":[\"8c\",\"4b\",\"3a\"],\"player\":[\"10d\",\"1c\",\"10c\"]}', 'BANKER', '0', '1556451960', null, '2', '', '0', '0', '{\"f1\":\"2.2384\",\"f2\":\"2.1753\",\"f3\":\"10.4832\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11549', '', '1556452020', '{\"banker\":[\"11a\",\"8b\"],\"player\":[\"7b\",\"10b\"]}', 'BANKER', '0', '1556452020', null, '2', '', '0', '0', '{\"f1\":\"2.2394\",\"f2\":\"2.1763\",\"f3\":\"10.4801\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11550', '', '1556452080', '{\"banker\":[\"10d\",\"11a\",\"4c\"],\"player\":[\"2b\",\"11c\",\"7d\"]}', 'PLAYER', '0', '1556452080', null, '2', '', '0', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1795\",\"f3\":\"10.4738\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11551', '', '1556452140', '{\"banker\":[\"2b\",\"9d\",\"3a\"],\"player\":[\"13a\",\"10d\",\"6c\"]}', 'PLAYER', '0', '1556452140', null, '2', '', '0', '0', '{\"f1\":\"2.2361\",\"f2\":\"2.1784\",\"f3\":\"10.4743\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11552', '', '1556452200', '{\"banker\":[\"10d\",\"9d\"],\"player\":[\"8c\",\"5c\",\"10b\"]}', 'BANKER', '0', '1556452200', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1782\",\"f3\":\"10.4912\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11553', '', '1556452260', '{\"banker\":[\"3d\",\"4d\"],\"player\":[\"7b\",\"9d\"]}', 'BANKER', '0', '1556452260', null, '2', '', '0', '0', '{\"f1\":\"2.2369\",\"f2\":\"2.1770\",\"f3\":\"10.4766\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11554', '', '1556452320', '{\"banker\":[\"13a\",\"3a\",\"12d\"],\"player\":[\"3c\",\"2b\",\"13c\"]}', 'PLAYER', '0', '1556452320', null, '2', '', '0', '0', '{\"f1\":\"2.2368\",\"f2\":\"2.1762\",\"f3\":\"10.4759\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11555', '', '1556452380', '{\"banker\":[\"12d\",\"3b\",\"9c\"],\"player\":[\"6d\",\"7a\",\"3d\"]}', 'PLAYER', '0', '1556452380', null, '2', '', '0', '0', '{\"f1\":\"2.2394\",\"f2\":\"2.1795\",\"f3\":\"10.4875\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11556', '', '1556452440', '{\"banker\":[\"12c\",\"11d\",\"9d\"],\"player\":[\"8a\",\"12a\"]}', 'BANKER', '0', '1556452440', null, '2', '', '0', '0', '{\"f1\":\"2.2385\",\"f2\":\"2.1783\",\"f3\":\"10.4913\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11557', '', '1556452500', '{\"banker\":[\"1d\",\"13a\",\"3d\"],\"player\":[\"11b\",\"4b\",\"13c\"]}', 'TIE', '0', '1556452500', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1783\",\"f3\":\"10.4732\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11558', '', '1556452560', '{\"banker\":[\"10a\",\"3a\",\"5b\"],\"player\":[\"1c\",\"2d\",\"3d\"]}', 'BANKER', '0', '1556452560', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1784\",\"f3\":\"10.4947\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11559', '', '1556452620', '{\"banker\":[\"8a\",\"2c\",\"12d\"],\"player\":[\"10c\",\"9d\"]}', 'PLAYER', '0', '1556452620', null, '2', '', '0', '0', '{\"f1\":\"2.2381\",\"f2\":\"2.1752\",\"f3\":\"10.4766\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11560', '', '1556452680', '{\"banker\":[\"12b\",\"4c\",\"4c\"],\"player\":[\"8c\",\"10b\"]}', 'TIE', '0', '1556452680', null, '2', '', '0', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1754\",\"f3\":\"10.4744\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11561', '', '1556452740', '{\"banker\":[\"3b\",\"12c\",\"4b\"],\"player\":[\"10c\",\"6d\"]}', 'BANKER', '0', '1556452740', null, '2', '', '0', '0', '{\"f1\":\"2.2355\",\"f2\":\"2.1797\",\"f3\":\"10.4857\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11562', '', '1556452800', '{\"banker\":[\"1c\",\"10d\",\"12b\"],\"player\":[\"6b\",\"9d\",\"11d\"]}', 'PLAYER', '0', '1556452800', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1789\",\"f3\":\"10.4778\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11563', '', '1556452860', '{\"banker\":[\"5c\",\"12b\",\"10b\"],\"player\":[\"4c\",\"3b\"]}', 'PLAYER', '0', '1556452860', null, '2', '', '0', '0', '{\"f1\":\"2.2378\",\"f2\":\"2.1771\",\"f3\":\"10.4722\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11564', '', '1556452920', '{\"banker\":[\"12b\",\"8b\"],\"player\":[\"3a\",\"1c\",\"7a\"]}', 'BANKER', '0', '1556452920', null, '2', '', '0', '0', '{\"f1\":\"2.2375\",\"f2\":\"2.1795\",\"f3\":\"10.4772\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11565', '', '1556452980', '{\"banker\":[\"1b\",\"6a\"],\"player\":[\"9d\",\"10d\"]}', 'PLAYER', '0', '1556452980', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1799\",\"f3\":\"10.4807\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11566', '', '1556453040', '{\"banker\":[\"10a\",\"11c\",\"7b\"],\"player\":[\"1d\",\"9a\",\"11a\"]}', 'BANKER', '300', '1556453040', null, '2', '', '1', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1769\",\"f3\":\"10.4734\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11567', '', '1556453100', '{\"banker\":[\"4d\",\"9c\",\"7c\"],\"player\":[\"2b\",\"2b\",\"5a\"]}', 'PLAYER', '0', '1556453100', null, '2', '', '0', '0', '{\"f1\":\"2.2381\",\"f2\":\"2.1778\",\"f3\":\"10.4841\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11568', '', '1556453160', '{\"banker\":[\"5b\",\"13c\",\"1b\"],\"player\":[\"11d\",\"3c\",\"6a\"]}', 'PLAYER', '0', '1556453160', null, '2', '', '0', '0', '{\"f1\":\"2.2380\",\"f2\":\"2.1774\",\"f3\":\"10.4863\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11569', '', '1556453220', '{\"banker\":[\"1a\",\"13d\",\"11d\"],\"player\":[\"9d\",\"6c\",\"7b\"]}', 'PLAYER', '0', '1556453220', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1764\",\"f3\":\"10.4870\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11570', '', '1556453280', '{\"banker\":[\"1c\",\"1a\",\"12c\"],\"player\":[\"7a\",\"2c\"]}', 'PLAYER', '0', '1556453280', null, '2', '', '0', '0', '{\"f1\":\"2.2388\",\"f2\":\"2.1789\",\"f3\":\"10.4784\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11571', '', '1556453340', '{\"banker\":[\"6b\",\"4a\",\"3c\"],\"player\":[\"2a\",\"13a\",\"2b\"]}', 'PLAYER', '0', '1556453340', null, '2', '', '0', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1778\",\"f3\":\"10.4867\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11572', '', '1556453400', '{\"banker\":[\"5b\",\"4d\"],\"player\":[\"4a\",\"3a\"]}', 'BANKER', '0', '1556453400', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1758\",\"f3\":\"10.4929\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11573', '', '1556453460', '{\"banker\":[\"2d\",\"6c\"],\"player\":[\"8a\",\"1b\"]}', 'PLAYER', '0', '1556453460', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1796\",\"f3\":\"10.4863\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11574', '', '1556453520', '{\"banker\":[\"3b\",\"9b\",\"12a\"],\"player\":[\"6c\",\"3c\"]}', 'PLAYER', '0', '1556453520', null, '2', '', '0', '0', '{\"f1\":\"2.2358\",\"f2\":\"2.1766\",\"f3\":\"10.4817\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11575', '', '1556453580', '{\"banker\":[\"4d\",\"13c\"],\"player\":[\"5d\",\"8a\",\"9b\"]}', 'BANKER', '0', '1556453580', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1770\",\"f3\":\"10.4721\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11576', '', '1556453640', '{\"banker\":[\"7c\",\"9a\"],\"player\":[\"12d\",\"5c\",\"11a\"]}', 'BANKER', '0', '1556453640', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1795\",\"f3\":\"10.4723\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11577', '', '1556453700', '{\"banker\":[\"3c\",\"5a\"],\"player\":[\"6c\",\"9c\",\"8c\"]}', 'BANKER', '0', '1556453700', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1763\",\"f3\":\"10.4707\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11578', '', '1556453760', '{\"banker\":[\"4b\",\"7c\",\"10c\"],\"player\":[\"11d\",\"13b\",\"4a\"]}', 'PLAYER', '0', '1556453760', null, '2', '', '0', '0', '{\"f1\":\"2.2392\",\"f2\":\"2.1751\",\"f3\":\"10.4782\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11579', '', '1556453820', '{\"banker\":[\"8c\",\"12c\"],\"player\":[\"4d\",\"3b\"]}', 'BANKER', '0', '1556453820', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1777\",\"f3\":\"10.4776\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11580', '', '1556453880', '{\"banker\":[\"5c\",\"9d\"],\"player\":[\"12a\",\"4a\",\"10d\"]}', 'TIE', '0', '1556453880', null, '2', '', '0', '0', '{\"f1\":\"2.2390\",\"f2\":\"2.1780\",\"f3\":\"10.4731\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11581', '', '1556453940', '{\"banker\":[\"10a\",\"12a\",\"7d\"],\"player\":[\"7b\",\"13b\"]}', 'TIE', '0', '1556453940', null, '2', '', '0', '0', '{\"f1\":\"2.2391\",\"f2\":\"2.1796\",\"f3\":\"10.4827\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11582', '', '1556454000', '{\"banker\":[\"12d\",\"6d\"],\"player\":[\"8b\",\"8c\"]}', 'TIE', '0', '1556454000', null, '2', '', '0', '0', '{\"f1\":\"2.2373\",\"f2\":\"2.1780\",\"f3\":\"10.4800\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11583', '', '1556454061', '{\"banker\":[\"8a\",\"2a\",\"13d\"],\"player\":[\"7d\",\"6a\",\"11d\"]}', 'PLAYER', '0', '1556454061', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1770\",\"f3\":\"10.4947\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11584', '', '1556454120', '{\"banker\":[\"8c\",\"7a\",\"11b\"],\"player\":[\"6c\",\"11d\"]}', 'PLAYER', '300', '1556454120', null, '2', '', '1', '0', '{\"f1\":\"2.2392\",\"f2\":\"2.1774\",\"f3\":\"10.4714\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11585', '', '1556454180', '{\"banker\":[\"5d\",\"6c\",\"2b\"],\"player\":[\"13c\",\"9a\"]}', 'PLAYER', '150', '1556454180', null, '2', '', '1', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1787\",\"f3\":\"10.4867\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11586', '', '1556454240', '{\"banker\":[\"11c\",\"8b\"],\"player\":[\"11d\",\"8c\"]}', 'TIE', '300', '1556454240', null, '2', '', '1', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1796\",\"f3\":\"10.4885\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11587', '', '1556454300', '{\"banker\":[\"1b\",\"11c\",\"7c\"],\"player\":[\"7d\",\"2b\"]}', 'PLAYER', '0', '1556454300', null, '2', '', '0', '0', '{\"f1\":\"2.2378\",\"f2\":\"2.1780\",\"f3\":\"10.4725\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11588', '', '1556454360', '{\"banker\":[\"7b\",\"10b\"],\"player\":[\"9c\",\"7d\"]}', 'BANKER', '0', '1556454360', null, '2', '', '0', '0', '{\"f1\":\"2.2351\",\"f2\":\"2.1759\",\"f3\":\"10.4788\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11589', '', '1556454420', '{\"banker\":[\"12d\",\"7d\"],\"player\":[\"3b\",\"5c\"]}', 'PLAYER', '0', '1556454420', null, '2', '', '0', '0', '{\"f1\":\"2.2375\",\"f2\":\"2.1789\",\"f3\":\"10.4705\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11590', '', '1556454480', '{\"banker\":[\"3c\",\"3d\"],\"player\":[\"13c\",\"8b\"]}', 'PLAYER', '0', '1556454480', null, '2', '', '0', '0', '{\"f1\":\"2.2368\",\"f2\":\"2.1760\",\"f3\":\"10.4804\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11591', '', '1556454540', '{\"banker\":[\"5a\",\"10a\",\"3a\"],\"player\":[\"11b\",\"13d\",\"7b\"]}', 'BANKER', '0', '1556454540', null, '2', '', '0', '0', '{\"f1\":\"2.2355\",\"f2\":\"2.1757\",\"f3\":\"10.4797\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11592', '', '1556454600', '{\"banker\":[\"4b\",\"11d\"],\"player\":[\"5d\",\"11c\",\"10c\"]}', 'PLAYER', '0', '1556454600', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1778\",\"f3\":\"10.4900\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11593', '', '1556454660', '{\"banker\":[\"8a\",\"1c\"],\"player\":[\"5c\",\"1d\"]}', 'BANKER', '0', '1556454660', null, '2', '', '0', '0', '{\"f1\":\"2.2395\",\"f2\":\"2.1795\",\"f3\":\"10.4914\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11594', '', '1556454720', '{\"banker\":[\"11b\",\"11d\",\"6c\"],\"player\":[\"9c\",\"1c\",\"10c\"]}', 'BANKER', '0', '1556454720', null, '2', '', '0', '0', '{\"f1\":\"2.2380\",\"f2\":\"2.1786\",\"f3\":\"10.4774\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11595', '', '1556454780', '{\"banker\":[\"1b\",\"9a\",\"2b\"],\"player\":[\"11d\",\"3c\",\"6b\"]}', 'PLAYER', '0', '1556454780', null, '2', '', '0', '0', '{\"f1\":\"2.2356\",\"f2\":\"2.1793\",\"f3\":\"10.4743\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11596', '', '1556454840', '{\"banker\":[\"5c\",\"5c\",\"3c\"],\"player\":[\"8b\",\"13d\"]}', 'PLAYER', '0', '1556454840', null, '2', '', '0', '0', '{\"f1\":\"2.2368\",\"f2\":\"2.1793\",\"f3\":\"10.4780\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11597', '', '1556454900', '{\"banker\":[\"13b\",\"4b\",\"9a\"],\"player\":[\"12b\",\"13a\",\"4b\"]}', 'PLAYER', '0', '1556454900', null, '2', '', '0', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1785\",\"f3\":\"10.4895\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11598', '', '1556454960', '{\"banker\":[\"1a\",\"6c\"],\"player\":[\"9c\",\"10c\"]}', 'PLAYER', '0', '1556454960', null, '2', '', '0', '0', '{\"f1\":\"2.2388\",\"f2\":\"2.1752\",\"f3\":\"10.4850\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11599', '', '1556455020', '{\"banker\":[\"10d\",\"3b\",\"7d\"],\"player\":[\"11b\",\"13c\",\"3b\"]}', 'PLAYER', '0', '1556455020', null, '2', '', '0', '0', '{\"f1\":\"2.2392\",\"f2\":\"2.1782\",\"f3\":\"10.4724\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11600', '', '1556455080', '{\"banker\":[\"12c\",\"7c\"],\"player\":[\"6d\",\"10d\"]}', 'BANKER', '0', '1556455080', null, '2', '', '0', '0', '{\"f1\":\"2.2399\",\"f2\":\"2.1799\",\"f3\":\"10.4877\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11601', '', '1556455140', '{\"banker\":[\"8b\",\"4d\",\"11c\"],\"player\":[\"7a\",\"3a\",\"8c\"]}', 'PLAYER', '0', '1556455140', null, '2', '', '0', '0', '{\"f1\":\"2.2350\",\"f2\":\"2.1772\",\"f3\":\"10.4731\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11602', '', '1556455200', '{\"banker\":[\"13a\",\"11a\",\"7d\"],\"player\":[\"3c\",\"7c\",\"12a\"]}', 'BANKER', '0', '1556455200', null, '2', '', '0', '0', '{\"f1\":\"2.2372\",\"f2\":\"2.1770\",\"f3\":\"10.4947\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11603', '', '1556455260', '{\"banker\":[\"6c\",\"5a\",\"12c\"],\"player\":[\"9a\",\"3a\",\"6d\"]}', 'PLAYER', '0', '1556455260', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1796\",\"f3\":\"10.4858\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11604', '', '1556455320', '{\"banker\":[\"9a\",\"10c\"],\"player\":[\"2d\",\"1a\",\"13d\"]}', 'BANKER', '0', '1556455320', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1759\",\"f3\":\"10.4859\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11605', '', '1556455380', '{\"banker\":[\"6b\",\"4c\",\"1d\"],\"player\":[\"7b\",\"13d\"]}', 'PLAYER', '0', '1556455380', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1755\",\"f3\":\"10.4808\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11606', '', '1556455440', '{\"banker\":[\"8b\",\"5a\",\"3a\"],\"player\":[\"8a\",\"5d\",\"2b\"]}', 'BANKER', '0', '1556455440', null, '2', '', '0', '0', '{\"f1\":\"2.2356\",\"f2\":\"2.1771\",\"f3\":\"10.4909\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11607', '', '1556455500', '{\"banker\":[\"9c\",\"5b\",\"8a\"],\"player\":[\"11a\",\"5b\",\"2a\"]}', 'PLAYER', '0', '1556455500', null, '2', '', '0', '0', '{\"f1\":\"2.2375\",\"f2\":\"2.1795\",\"f3\":\"10.4722\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11608', '', '1556455560', '{\"banker\":[\"6b\",\"3a\"],\"player\":[\"7c\",\"9d\"]}', 'BANKER', '0', '1556455560', null, '2', '', '0', '0', '{\"f1\":\"2.2398\",\"f2\":\"2.1782\",\"f3\":\"10.4766\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11609', '', '1556455620', '{\"banker\":[\"11d\",\"10a\",\"6c\"],\"player\":[\"2c\",\"13b\",\"3c\"]}', 'BANKER', '0', '1556455620', null, '2', '', '0', '0', '{\"f1\":\"2.2365\",\"f2\":\"2.1795\",\"f3\":\"10.4886\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11610', '', '1556455680', '{\"banker\":[\"3d\",\"6c\"],\"player\":[\"6d\",\"8a\",\"9d\"]}', 'BANKER', '0', '1556455680', null, '2', '', '0', '0', '{\"f1\":\"2.2378\",\"f2\":\"2.1760\",\"f3\":\"10.4818\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11611', '', '1556455740', '{\"banker\":[\"11b\",\"7a\"],\"player\":[\"11c\",\"11b\",\"13b\"]}', 'BANKER', '0', '1556455740', null, '2', '', '0', '0', '{\"f1\":\"2.2392\",\"f2\":\"2.1779\",\"f3\":\"10.4754\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11612', '', '1556455800', '{\"banker\":[\"8a\",\"7a\",\"1d\"],\"player\":[\"13b\",\"3d\",\"4a\"]}', 'PLAYER', '0', '1556455800', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1778\",\"f3\":\"10.4940\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11613', '', '1556455860', '{\"banker\":[\"11b\",\"5d\",\"4d\"],\"player\":[\"8c\",\"5a\",\"5b\"]}', 'BANKER', '0', '1556455860', null, '2', '', '0', '0', '{\"f1\":\"2.2355\",\"f2\":\"2.1786\",\"f3\":\"10.4826\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11614', '', '1556455920', '{\"banker\":[\"12b\",\"6d\"],\"player\":[\"12a\",\"10c\",\"1b\"]}', 'BANKER', '0', '1556455920', null, '2', '', '0', '0', '{\"f1\":\"2.2366\",\"f2\":\"2.1794\",\"f3\":\"10.4743\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11615', '', '1556455980', '{\"banker\":[\"11b\",\"10c\",\"6d\"],\"player\":[\"5a\",\"11d\",\"7c\"]}', 'BANKER', '0', '1556455980', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1765\",\"f3\":\"10.4721\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11616', '', '1556456040', '{\"banker\":[\"9c\",\"6d\",\"10b\"],\"player\":[\"13c\",\"7c\"]}', 'PLAYER', '0', '1556456040', null, '2', '', '0', '0', '{\"f1\":\"2.2351\",\"f2\":\"2.1750\",\"f3\":\"10.4796\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11617', '', '1556456100', '{\"banker\":[\"13a\",\"1d\",\"3b\"],\"player\":[\"8b\",\"4a\",\"10c\"]}', 'BANKER', '0', '1556456100', null, '2', '', '0', '0', '{\"f1\":\"2.2352\",\"f2\":\"2.1791\",\"f3\":\"10.4702\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11618', '', '1556456160', '{\"banker\":[\"9b\",\"11c\"],\"player\":[\"9c\",\"7d\"]}', 'BANKER', '0', '1556456160', null, '2', '', '0', '0', '{\"f1\":\"2.2384\",\"f2\":\"2.1791\",\"f3\":\"10.4917\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11619', '', '1556456220', '{\"banker\":[\"9c\",\"6d\",\"3d\"],\"player\":[\"10d\",\"6c\"]}', 'BANKER', '0', '1556456220', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1788\",\"f3\":\"10.4947\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11620', '', '1556456280', '{\"banker\":[\"2d\",\"2b\",\"10a\"],\"player\":[\"10a\",\"11d\",\"4b\"]}', 'TIE', '0', '1556456280', null, '2', '', '0', '0', '{\"f1\":\"2.2379\",\"f2\":\"2.1777\",\"f3\":\"10.4757\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11621', '', '1556456340', '{\"banker\":[\"2b\",\"3a\",\"3a\"],\"player\":[\"13b\",\"7c\"]}', 'BANKER', '0', '1556456340', null, '2', '', '0', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1755\",\"f3\":\"10.4898\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11622', '', '1556456400', '{\"banker\":[\"9a\",\"6b\",\"2a\"],\"player\":[\"9b\",\"1c\",\"7d\"]}', 'TIE', '0', '1556456400', null, '2', '', '0', '0', '{\"f1\":\"2.2361\",\"f2\":\"2.1782\",\"f3\":\"10.4805\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11623', '', '1556456460', '{\"banker\":[\"2a\",\"12d\",\"3a\"],\"player\":[\"5d\",\"10c\",\"6b\"]}', 'BANKER', '0', '1556456460', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1769\",\"f3\":\"10.4906\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11624', '', '1556456520', '{\"banker\":[\"4a\",\"10b\",\"3a\"],\"player\":[\"6c\",\"6c\",\"6a\"]}', 'PLAYER', '0', '1556456520', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1755\",\"f3\":\"10.4801\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11625', '', '1556456580', '{\"banker\":[\"5b\",\"1b\"],\"player\":[\"2c\",\"6a\"]}', 'PLAYER', '0', '1556456580', null, '2', '', '0', '0', '{\"f1\":\"2.2351\",\"f2\":\"2.1777\",\"f3\":\"10.4941\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11626', '', '1556456640', '{\"banker\":[\"5d\",\"5a\",\"13d\"],\"player\":[\"7d\",\"1a\"]}', 'PLAYER', '0', '1556456640', null, '2', '', '0', '0', '{\"f1\":\"2.2352\",\"f2\":\"2.1764\",\"f3\":\"10.4800\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11627', '', '1556456700', '{\"banker\":[\"5c\",\"7b\",\"1d\"],\"player\":[\"6b\",\"6d\",\"1a\"]}', 'TIE', '0', '1556456700', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1751\",\"f3\":\"10.4702\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11628', '', '1556456760', '{\"banker\":[\"5a\",\"9a\"],\"player\":[\"12d\",\"2d\",\"1c\"]}', 'BANKER', '0', '1556456760', null, '2', '', '0', '0', '{\"f1\":\"2.2395\",\"f2\":\"2.1753\",\"f3\":\"10.4764\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11629', '', '1556456820', '{\"banker\":[\"3d\",\"10b\",\"9b\"],\"player\":[\"3a\",\"7a\",\"9b\"]}', 'PLAYER', '0', '1556456820', null, '2', '', '0', '0', '{\"f1\":\"2.2354\",\"f2\":\"2.1759\",\"f3\":\"10.4747\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11630', '', '1556456880', '{\"banker\":[\"8b\",\"4d\",\"5a\"],\"player\":[\"10b\",\"6d\"]}', 'BANKER', '0', '1556456880', null, '2', '', '0', '0', '{\"f1\":\"2.2375\",\"f2\":\"2.1774\",\"f3\":\"10.4914\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11631', '', '1556456940', '{\"banker\":[\"3b\",\"4a\"],\"player\":[\"13d\",\"3a\",\"9b\"]}', 'BANKER', '0', '1556456940', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1771\",\"f3\":\"10.4846\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11632', '', '1556457000', '{\"banker\":[\"10d\",\"6c\"],\"player\":[\"11c\",\"5b\",\"13b\"]}', 'BANKER', '0', '1556457000', null, '2', '', '0', '0', '{\"f1\":\"2.2399\",\"f2\":\"2.1799\",\"f3\":\"10.4853\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11633', '', '1556457060', '{\"banker\":[\"8c\",\"9a\"],\"player\":[\"7d\",\"13c\"]}', 'TIE', '0', '1556457060', null, '2', '', '0', '0', '{\"f1\":\"2.2384\",\"f2\":\"2.1790\",\"f3\":\"10.4730\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11634', '', '1556457120', '{\"banker\":[\"4b\",\"7a\",\"6b\"],\"player\":[\"7a\",\"10d\"]}', 'TIE', '0', '1556457120', null, '2', '', '0', '0', '{\"f1\":\"2.2350\",\"f2\":\"2.1760\",\"f3\":\"10.4759\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11635', '', '1556457180', '{\"banker\":[\"3b\",\"10d\",\"7b\"],\"player\":[\"2d\",\"13b\",\"2b\"]}', 'PLAYER', '0', '1556457180', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1785\",\"f3\":\"10.4718\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11636', '', '1556457240', '{\"banker\":[\"6b\",\"3c\"],\"player\":[\"4d\",\"10c\",\"7c\"]}', 'BANKER', '0', '1556457240', null, '2', '', '0', '0', '{\"f1\":\"2.2352\",\"f2\":\"2.1791\",\"f3\":\"10.4947\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11637', '', '1556457300', '{\"banker\":[\"5c\",\"11c\",\"13a\"],\"player\":[\"3c\",\"3a\"]}', 'PLAYER', '0', '1556457300', null, '2', '', '0', '0', '{\"f1\":\"2.2352\",\"f2\":\"2.1796\",\"f3\":\"10.4869\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11638', '', '1556457360', '{\"banker\":[\"11c\",\"9b\"],\"player\":[\"11b\",\"6c\"]}', 'BANKER', '0', '1556457360', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1768\",\"f3\":\"10.4847\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11639', '', '1556457420', '{\"banker\":[\"4b\",\"8c\",\"2a\"],\"player\":[\"4c\",\"11c\",\"9d\"]}', 'BANKER', '0', '1556457420', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1791\",\"f3\":\"10.4810\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11640', '', '1556457480', '{\"banker\":[\"3b\",\"10b\",\"7a\"],\"player\":[\"5d\",\"2b\"]}', 'PLAYER', '0', '1556457480', null, '2', '', '0', '0', '{\"f1\":\"2.2378\",\"f2\":\"2.1768\",\"f3\":\"10.4775\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11641', '', '1556457540', '{\"banker\":[\"11a\",\"2b\",\"12d\"],\"player\":[\"7b\",\"4c\",\"12b\"]}', 'BANKER', '0', '1556457540', null, '2', '', '0', '0', '{\"f1\":\"2.2387\",\"f2\":\"2.1782\",\"f3\":\"10.4875\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11642', '', '1556457600', '{\"banker\":[\"9d\",\"2b\",\"2d\"],\"player\":[\"3a\",\"6c\"]}', 'PLAYER', '0', '1556457600', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1787\",\"f3\":\"10.4777\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11643', '', '1556457660', '{\"banker\":[\"1a\",\"12b\",\"8b\"],\"player\":[\"2a\",\"5d\"]}', 'BANKER', '0', '1556457660', null, '2', '', '0', '0', '{\"f1\":\"2.2366\",\"f2\":\"2.1789\",\"f3\":\"10.4859\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11644', '', '1556457720', '{\"banker\":[\"9c\",\"13d\"],\"player\":[\"10b\",\"11b\",\"8b\"]}', 'BANKER', '0', '1556457720', null, '2', '', '0', '0', '{\"f1\":\"2.2350\",\"f2\":\"2.1758\",\"f3\":\"10.4755\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11645', '', '1556457780', '{\"banker\":[\"5d\",\"9b\",\"1c\"],\"player\":[\"5b\",\"4d\"]}', 'PLAYER', '0', '1556457780', null, '2', '', '0', '0', '{\"f1\":\"2.2370\",\"f2\":\"2.1779\",\"f3\":\"10.4830\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11646', '', '1556457840', '{\"banker\":[\"4a\",\"2a\"],\"player\":[\"11c\",\"6c\"]}', 'TIE', '0', '1556457840', null, '2', '', '0', '0', '{\"f1\":\"2.2352\",\"f2\":\"2.1756\",\"f3\":\"10.4758\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11647', '', '1556457900', '{\"banker\":[\"6d\",\"3a\"],\"player\":[\"2b\",\"11c\",\"7c\"]}', 'TIE', '0', '1556457900', null, '2', '', '0', '0', '{\"f1\":\"2.2391\",\"f2\":\"2.1768\",\"f3\":\"10.4906\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11648', '', '1556457960', '{\"banker\":[\"6a\",\"2c\"],\"player\":[\"5b\",\"12c\",\"13c\"]}', 'BANKER', '0', '1556457960', null, '2', '', '0', '0', '{\"f1\":\"2.2392\",\"f2\":\"2.1750\",\"f3\":\"10.4711\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11649', '', '1556458020', '{\"banker\":[\"1d\",\"10b\",\"10b\"],\"player\":[\"11c\",\"13b\",\"7c\"]}', 'PLAYER', '0', '1556458020', null, '2', '', '0', '0', '{\"f1\":\"2.2361\",\"f2\":\"2.1753\",\"f3\":\"10.4710\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11650', '', '1556458080', '{\"banker\":[\"12d\",\"8d\"],\"player\":[\"5a\",\"11b\",\"9a\"]}', 'BANKER', '0', '1556458080', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1787\",\"f3\":\"10.4713\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11651', '', '1556458140', '{\"banker\":[\"8a\",\"2b\",\"9a\"],\"player\":[\"11d\",\"4b\",\"6d\"]}', 'BANKER', '0', '1556458140', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1787\",\"f3\":\"10.4792\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11652', '', '1556458200', '{\"banker\":[\"13b\",\"12a\",\"4b\"],\"player\":[\"11d\",\"12a\",\"8a\"]}', 'PLAYER', '0', '1556458200', null, '2', '', '0', '0', '{\"f1\":\"2.2380\",\"f2\":\"2.1759\",\"f3\":\"10.4727\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11653', '', '1556458260', '{\"banker\":[\"1b\",\"13b\",\"9c\"],\"player\":[\"6c\",\"12a\"]}', 'PLAYER', '0', '1556458260', null, '2', '', '0', '0', '{\"f1\":\"2.2390\",\"f2\":\"2.1754\",\"f3\":\"10.4808\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11654', '', '1556458320', '{\"banker\":[\"4b\",\"12c\"],\"player\":[\"2a\",\"11a\",\"8c\"]}', 'BANKER', '0', '1556458320', null, '2', '', '0', '0', '{\"f1\":\"2.2355\",\"f2\":\"2.1753\",\"f3\":\"10.4832\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11655', '', '1556458380', '{\"banker\":[\"11a\",\"8a\"],\"player\":[\"13d\",\"11d\",\"7d\"]}', 'BANKER', '0', '1556458380', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1781\",\"f3\":\"10.4895\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11656', '', '1556458440', '{\"banker\":[\"1d\",\"5b\"],\"player\":[\"3c\",\"3b\"]}', 'TIE', '100', '1556458440', null, '2', '', '1', '0', '{\"f1\":\"2.2351\",\"f2\":\"2.1795\",\"f3\":\"10.4840\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11657', '', '1556458500', '{\"banker\":[\"1d\",\"10d\",\"3d\"],\"player\":[\"8b\",\"10c\"]}', 'PLAYER', '0', '1556458500', null, '2', '', '0', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1765\",\"f3\":\"10.4783\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11658', '', '1556458560', '{\"banker\":[\"5c\",\"1c\"],\"player\":[\"13c\",\"6b\"]}', 'TIE', '0', '1556458560', null, '2', '', '0', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1799\",\"f3\":\"10.4729\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11659', '', '1556458620', '{\"banker\":[\"13c\",\"13d\",\"7c\"],\"player\":[\"7c\",\"5c\",\"2d\"]}', 'BANKER', '0', '1556458620', null, '2', '', '0', '0', '{\"f1\":\"2.2361\",\"f2\":\"2.1792\",\"f3\":\"10.4826\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11660', '', '1556458680', '{\"banker\":[\"3a\",\"3c\"],\"player\":[\"3d\",\"13c\",\"3d\"]}', 'TIE', '0', '1556458680', null, '2', '', '0', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1793\",\"f3\":\"10.4940\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11661', '', '1556458740', '{\"banker\":[\"7b\",\"1b\"],\"player\":[\"8d\",\"13a\"]}', 'TIE', '0', '1556458740', null, '2', '', '0', '0', '{\"f1\":\"2.2369\",\"f2\":\"2.1799\",\"f3\":\"10.4852\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11662', '', '1556458800', '{\"banker\":[\"12b\",\"6d\"],\"player\":[\"9a\",\"3d\",\"2b\"]}', 'BANKER', '0', '1556458800', null, '2', '', '0', '0', '{\"f1\":\"2.2394\",\"f2\":\"2.1762\",\"f3\":\"10.4871\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11663', '', '1556458860', '{\"banker\":[\"3a\",\"10b\",\"13c\"],\"player\":[\"9a\",\"10c\"]}', 'PLAYER', '0', '1556458860', null, '2', '', '0', '0', '{\"f1\":\"2.2360\",\"f2\":\"2.1766\",\"f3\":\"10.4822\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11664', '', '1556458920', '{\"banker\":[\"1d\",\"4b\",\"3d\"],\"player\":[\"8d\",\"3d\",\"6a\"]}', 'BANKER', '0', '1556458920', null, '2', '', '0', '0', '{\"f1\":\"2.2389\",\"f2\":\"2.1759\",\"f3\":\"10.4810\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11665', '', '1556458980', '{\"banker\":[\"1d\",\"8b\"],\"player\":[\"4b\",\"5a\"]}', 'TIE', '0', '1556458980', null, '2', '', '0', '0', '{\"f1\":\"2.2376\",\"f2\":\"2.1773\",\"f3\":\"10.4943\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11666', '', '1556459040', '{\"banker\":[\"9c\",\"1b\",\"1d\"],\"player\":[\"6c\",\"11b\"]}', 'PLAYER', '0', '1556459040', null, '2', '', '0', '0', '{\"f1\":\"2.2359\",\"f2\":\"2.1784\",\"f3\":\"10.4777\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11667', '', '1556459100', '{\"banker\":[\"11d\",\"6a\"],\"player\":[\"12b\",\"5a\",\"2c\"]}', 'PLAYER', '0', '1556459100', null, '2', '', '0', '0', '{\"f1\":\"2.2381\",\"f2\":\"2.1755\",\"f3\":\"10.4866\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11668', '', '1556459160', '{\"banker\":[\"12d\",\"13d\",\"13c\"],\"player\":[\"7a\",\"11c\"]}', 'PLAYER', '0', '1556459160', null, '2', '', '0', '0', '{\"f1\":\"2.2399\",\"f2\":\"2.1770\",\"f3\":\"10.4848\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11669', '', '1556459220', '{\"banker\":[\"10d\",\"4b\"],\"player\":[\"10c\",\"2c\",\"8b\"]}', 'BANKER', '0', '1556459220', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1769\",\"f3\":\"10.4829\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11670', '', '1556459280', '{\"banker\":[\"11c\",\"3d\",\"1c\"],\"player\":[\"4d\",\"11b\",\"6b\"]}', 'BANKER', '0', '1556459280', null, '2', '', '0', '0', '{\"f1\":\"2.2386\",\"f2\":\"2.1778\",\"f3\":\"10.4904\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11671', '', '1556459340', '{\"banker\":[\"3a\",\"12b\",\"13b\"],\"player\":[\"7b\",\"1c\"]}', 'PLAYER', '0', '1556459340', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1776\",\"f3\":\"10.4741\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11672', '', '1556459400', '{\"banker\":[\"8d\",\"13a\"],\"player\":[\"8d\",\"5d\",\"5a\"]}', 'TIE', '0', '1556459400', null, '2', '', '0', '0', '{\"f1\":\"2.2399\",\"f2\":\"2.1790\",\"f3\":\"10.4904\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11673', '', '1556459460', '{\"banker\":[\"1b\",\"5b\"],\"player\":[\"10a\",\"5b\",\"12b\"]}', 'BANKER', '0', '1556459460', null, '2', '', '0', '0', '{\"f1\":\"2.2362\",\"f2\":\"2.1771\",\"f3\":\"10.4825\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11674', '', '1556459520', '{\"banker\":[\"1b\",\"5d\",\"6b\"],\"player\":[\"3c\",\"9a\",\"6b\"]}', 'PLAYER', '0', '1556459520', null, '2', '', '0', '0', '{\"f1\":\"2.2351\",\"f2\":\"2.1781\",\"f3\":\"10.4856\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11675', '', '1556459580', '{\"banker\":[\"10a\",\"13d\",\"12b\"],\"player\":[\"1a\",\"8d\"]}', 'PLAYER', '0', '1556459580', null, '2', '', '0', '0', '{\"f1\":\"2.2352\",\"f2\":\"2.1773\",\"f3\":\"10.4871\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11676', '', '1556459640', '{\"banker\":[\"4c\",\"13a\",\"10c\"],\"player\":[\"7a\",\"1d\"]}', 'PLAYER', '0', '1556459640', null, '2', '', '0', '0', '{\"f1\":\"2.2369\",\"f2\":\"2.1788\",\"f3\":\"10.4761\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11677', '', '1556459700', '{\"banker\":[\"7c\",\"9a\"],\"player\":[\"12a\",\"2a\",\"8a\"]}', 'BANKER', '0', '1556459700', null, '2', '', '0', '0', '{\"f1\":\"2.2353\",\"f2\":\"2.1781\",\"f3\":\"10.4790\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11678', '', '1556459760', '{\"banker\":[\"12c\",\"13b\",\"10b\"],\"player\":[\"5d\",\"12d\",\"3b\"]}', 'PLAYER', '0', '1556459760', null, '2', '', '0', '0', '{\"f1\":\"2.2364\",\"f2\":\"2.1762\",\"f3\":\"10.4733\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11679', '', '1556459820', '{\"banker\":[\"11c\",\"3d\",\"6c\"],\"player\":[\"5a\",\"1c\"]}', 'BANKER', '0', '1556459820', null, '2', '', '0', '0', '{\"f1\":\"2.2377\",\"f2\":\"2.1794\",\"f3\":\"10.4724\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11680', '', '1556459880', '{\"banker\":[\"2d\",\"6b\"],\"player\":[\"13b\",\"7a\"]}', 'BANKER', '0', '1556459880', null, '2', '', '0', '0', '{\"f1\":\"2.2351\",\"f2\":\"2.1759\",\"f3\":\"10.4900\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11681', '', '1556459940', '{\"banker\":[\"6d\",\"9d\"],\"player\":[\"12d\",\"2b\",\"3c\"]}', 'TIE', '0', '1556459940', null, '2', '', '0', '0', '{\"f1\":\"2.2357\",\"f2\":\"2.1758\",\"f3\":\"10.4712\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11682', '', '1556460000', '{\"banker\":[\"1d\",\"11c\",\"9b\"],\"player\":[\"11a\",\"1b\",\"13d\"]}', 'PLAYER', '0', '1556460000', null, '2', '', '0', '0', '{\"f1\":\"2.2374\",\"f2\":\"2.1785\",\"f3\":\"10.4927\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11683', '', '1556460060', '{\"banker\":[\"5b\",\"10b\",\"11d\"],\"player\":[\"8b\",\"8b\"]}', 'PLAYER', '0', '1556460060', null, '2', '', '0', '0', '{\"f1\":\"2.2358\",\"f2\":\"2.1785\",\"f3\":\"10.4796\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11684', '', '1556460120', '{\"banker\":[\"2d\",\"6d\"],\"player\":[\"5c\",\"10a\",\"11b\"]}', 'BANKER', '0', '1556460120', null, '2', '', '0', '0', '{\"f1\":\"2.2363\",\"f2\":\"2.1753\",\"f3\":\"10.4885\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11685', '', '1556460180', '{\"banker\":[\"6d\",\"1a\"],\"player\":[\"11c\",\"6a\"]}', 'BANKER', '0', '1556460180', null, '2', '', '0', '0', '{\"f1\":\"2.2383\",\"f2\":\"2.1772\",\"f3\":\"10.4892\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11686', '', '1556460240', '{\"banker\":[\"11c\",\"7a\"],\"player\":[\"1d\",\"4a\",\"7b\"]}', 'BANKER', '0', '1556460240', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1781\",\"f3\":\"10.4816\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11687', '', '1556460300', '{\"banker\":[\"10c\",\"9b\"],\"player\":[\"7a\",\"3a\",\"9c\"]}', 'TIE', '0', '1556460300', null, '2', '', '0', '0', '{\"f1\":\"2.2393\",\"f2\":\"2.1765\",\"f3\":\"10.4840\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11688', '', '1556460360', '{\"banker\":[\"3d\",\"1d\"],\"player\":[\"1d\",\"13a\",\"11a\"]}', 'BANKER', '0', '1556460360', null, '2', '', '0', '0', '{\"f1\":\"2.2369\",\"f2\":\"2.1768\",\"f3\":\"10.4800\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11689', '', '1556460420', '{\"banker\":[\"11c\",\"7b\"],\"player\":[\"12b\",\"6b\"]}', 'BANKER', '0', '1556460420', null, '2', '', '0', '0', '{\"f1\":\"2.2396\",\"f2\":\"2.1753\",\"f3\":\"10.4900\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11690', '', '1556460480', '{\"banker\":[\"12b\",\"3a\",\"8d\"],\"player\":[\"5c\",\"4c\"]}', 'PLAYER', '0', '1556460480', null, '2', '', '0', '0', '{\"f1\":\"2.2352\",\"f2\":\"2.1774\",\"f3\":\"10.4804\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11691', '', '1556460540', '{\"banker\":[\"11a\",\"4a\"],\"player\":[\"6b\",\"9c\",\"1c\"]}', 'PLAYER', '0', '1556460540', null, '2', '', '0', '0', '{\"f1\":\"2.2397\",\"f2\":\"2.1753\",\"f3\":\"10.4896\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11692', '', '1556460600', '{\"banker\":[\"11c\",\"5a\",\"9d\"],\"player\":[\"7a\",\"13a\"]}', 'PLAYER', '0', '1556460600', null, '2', '', '0', '0', '{\"f1\":\"2.2372\",\"f2\":\"2.1790\",\"f3\":\"10.4717\"}');
INSERT INTO `hov_game_xybjl` VALUES ('11693', '', '1556460660', null, null, '0', null, null, '1', 'thisTimes', '0', '0', '');
INSERT INTO `hov_game_xybjl` VALUES ('11694', '', '1556460720', null, null, '0', null, null, '1', null, '0', '0', '');
INSERT INTO `hov_game_xybjl` VALUES ('11695', '', '1556460780', null, null, '0', null, null, '1', null, '0', '0', '');
INSERT INTO `hov_game_xybjl` VALUES ('11696', '', '1556460840', null, null, '0', null, null, '1', null, '0', '0', '');

-- ----------------------------
-- Table structure for `hov_game_xygyj`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_xygyj`;
CREATE TABLE `hov_game_xygyj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `total_money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `win_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_xygyj
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_yd10`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_yd10`;
CREATE TABLE `hov_game_yd10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_yd10
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_yd11`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_yd11`;
CREATE TABLE `hov_game_yd11` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_yd11
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_yd16`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_yd16`;
CREATE TABLE `hov_game_yd16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_yd16
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_yd28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_yd28`;
CREATE TABLE `hov_game_yd28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_yd28
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_yd36`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_yd36`;
CREATE TABLE `hov_game_yd36` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_yd36
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_ydww21`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_ydww21`;
CREATE TABLE `hov_game_ydww21` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_ydww21
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_game_ydww28`
-- ----------------------------
DROP TABLE IF EXISTS `hov_game_ydww28`;
CREATE TABLE `hov_game_ydww28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT '',
  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '开奖描述',
  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1：未开奖的，2：已开奖的',
  `period` varchar(20) DEFAULT NULL COMMENT '1：thisTimes当期开奖的，2：prevTimes上期开奖的',
  `bet_num` int(11) DEFAULT '0',
  `bidrate` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_game_ydww28
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `coin` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `desc` text NOT NULL,
  `de_exp` int(11) DEFAULT '0' COMMENT '扣除经验',
  `de_point` int(11) DEFAULT '0' COMMENT '扣除积分',
  `must_check` tinyint(1) DEFAULT '0' COMMENT '1：每次兑奖必须审核，0：不是',
  `card_cate_id` int(11) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_prize
-- ----------------------------
INSERT INTO `hov_prize` VALUES ('4', null, '移动充值卡100元', '11', '10', '100.00', '100000', '0', '0', '&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;&amp;lt;strong style=&amp;quot;margin: 0px; padding: 0px;&amp;quot;&amp;gt;奖品兑换流程：&amp;lt;/strong&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;&amp;lt;strong style=&amp;quot;margin: 0px; padding: 0px;&amp;quot;&amp;gt;&amp;lt;br/&amp;gt;&amp;lt;/strong&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;&amp;lt;strong style=&amp;quot;margin: 0px; padding: 0px;&amp;quot;&amp;gt;1. 奖品价格已经包含邮寄费用在内，您无须另行支付。兑奖前请确认您的帐户中有足够数量的金额！&amp;lt;/strong&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;&amp;lt;strong style=&amp;quot;margin: 0px; padding: 0px;&amp;quot;&amp;gt;2. 在您要兑奖的奖品页面点击&amp;ldquo;立即兑换&amp;rdquo;按钮，提交您的兑奖申请！&amp;lt;/strong&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;&amp;lt;strong style=&amp;quot;margin: 0px; padding: 0px;&amp;quot;&amp;gt;3. 实物奖品将在您的兑奖确认后的2-5工作日内发出(奖品状态您可通过&amp;ldquo;站内信-兑奖发货通知&amp;rdquo;查询)！&amp;lt;/strong&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;&amp;lt;strong style=&amp;quot;margin: 0px; padding: 0px;&amp;quot;&amp;gt;4. 兑奖中心所有奖品颜色均为随机发送, 敬请谅解！&amp;lt;/strong&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;&amp;lt;strong style=&amp;quot;margin: 0px; padding: 0px;&amp;quot;&amp;gt;5. 奖品受供货商库存影响，会有缺货情况，如有缺货，客服会取消兑奖，退还金额。dd&amp;lt;/strong&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;', '0', '0', '0', '10', '1552636993', '1554698714', '0');
INSERT INTO `hov_prize` VALUES ('5', null, '移动充值卡5000元', '12', '10', '5000.00', '5000000', '0', '0', '<p>移动充值卡5000元问问</p>', null, null, '0', null, '1552637483', '1553762802', '0');
INSERT INTO `hov_prize` VALUES ('6', null, '华为手机', '32', '11', '8000.00', '8000000', '0', '0', '', null, null, '0', null, '1553762909', '1553762909', '0');
INSERT INTO `hov_prize` VALUES ('7', null, '移动充值卡50000元', '33', '10', '50000.00', '50000000', '0', '0', '', null, null, '0', null, '1553776674', '1553776674', '0');
INSERT INTO `hov_prize` VALUES ('8', null, '移动充值卡1000元', '37', '10', '1000.00', '1000000', '0', '0', '', '0', '0', '0', '4', '1553776727', '1554511036', '0');
INSERT INTO `hov_prize` VALUES ('9', null, '移动充值卡30000元', '38', '10', '30000.00', '30000000', '0', '0', '', null, null, '0', null, '1553776816', '1553776816', '0');
INSERT INTO `hov_prize` VALUES ('10', null, '移动充值卡10000元', '39', '10', '10000.00', '10000000', '12', '2333', '', '0', '0', '1', '4', '1553776882', '1554618956', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_prize_cate
-- ----------------------------
INSERT INTO `hov_prize_cate` VALUES ('8', '手机充值卡', '', '', '1553760641', '1553760641', '0');
INSERT INTO `hov_prize_cate` VALUES ('9', '生活用品', '', '', '1553760654', '1553760654', '0');
INSERT INTO `hov_prize_cate` VALUES ('10', '广告体验卡', '', '', '1553760669', '1553760669', '8');
INSERT INTO `hov_prize_cate` VALUES ('11', '数码产品', '', '', '1553760681', '1553760681', '9');
INSERT INTO `hov_prize_cate` VALUES ('13', '奢侈品', '', '', '1553760704', '1553760704', '9');

-- ----------------------------
-- Table structure for `hov_signinconfig`
-- ----------------------------
DROP TABLE IF EXISTS `hov_signinconfig`;
CREATE TABLE `hov_signinconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_grade_id` int(11) NOT NULL COMMENT '等级',
  `base_num` int(11) DEFAULT NULL COMMENT '基数',
  `increment_num` smallint(6) NOT NULL COMMENT '增数',
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
INSERT INTO `hov_signinconfig` VALUES ('1', '0', '0', '1', '7', '1', 'V0等级', '1552526726', '1554780913');
INSERT INTO `hov_signinconfig` VALUES ('2', '1', '20', '1', '7', '1', '', '1552526923', '1554780183');
INSERT INTO `hov_signinconfig` VALUES ('3', '2', '30', '1', '7', '1', '', '1552526942', '1554780172');
INSERT INTO `hov_signinconfig` VALUES ('4', '3', '60', '1', '7', '1', '', '1552526955', '1554780159');
INSERT INTO `hov_signinconfig` VALUES ('5', '4', '100', '1', '7', '1', '', '1552526964', '1554780149');
INSERT INTO `hov_signinconfig` VALUES ('6', '5', '150', '1', '7', '1', '', '1552527148', '1554780134');
INSERT INTO `hov_signinconfig` VALUES ('7', '6', '200', '1', '7', '1', 'ddd', '1552527894', '1554813123');

-- ----------------------------
-- Table structure for `hov_smash_egg`
-- ----------------------------
DROP TABLE IF EXISTS `hov_smash_egg`;
CREATE TABLE `hov_smash_egg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT '0',
  `money` int(11) DEFAULT NULL,
  `odd` smallint(4) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_smash_egg
-- ----------------------------
INSERT INTO `hov_smash_egg` VALUES ('1', '恭喜你，砸中金币188', '188', '100', '1555641672', '1555641672');
INSERT INTO `hov_smash_egg` VALUES ('2', '恭喜你，砸中金币388', '388', '10', '1555641783', '1555641783');
INSERT INTO `hov_smash_egg` VALUES ('3', '恭喜你，砸中金币588', '588', '8', '1555641800', '1555641800');
INSERT INTO `hov_smash_egg` VALUES ('4', '恭喜你，砸中金币1888', '1888', '5', '1555641814', '1555641814');
INSERT INTO `hov_smash_egg` VALUES ('5', '恭喜你，砸中金币3888', '3888', '3', '1555641826', '1555641826');
INSERT INTO `hov_smash_egg` VALUES ('6', '恭喜你，砸中金币5888', '5888', '1', '1555641838', '1555641838');
INSERT INTO `hov_smash_egg` VALUES ('7', '谢谢参与', '0', '200', '1555641860', '1555642200');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
  `gender` tinyint(1) unsigned DEFAULT '1' COMMENT '1:male,2:female',
  `avatar` int(11) DEFAULT NULL COMMENT '用户头像',
  `user_type` tinyint(1) DEFAULT '1' COMMENT '用户类型1:普通，2：vip类型',
  `email` varchar(100) NOT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `coin` int(11) DEFAULT '0' COMMENT '金币数',
  `bank` int(11) DEFAULT '0' COMMENT '银行金币数',
  `create_time` int(11) DEFAULT NULL,
  `login_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `user_grade_id` tinyint(2) DEFAULT '0' COMMENT '用户等级',
  `login_ip` char(30) DEFAULT NULL COMMENT '登录IP',
  `referee_id` int(11) DEFAULT '0' COMMENT '推荐人',
  `is_vip` tinyint(1) DEFAULT '0' COMMENT '1：是，0：否',
  `vip_expire` int(11) DEFAULT NULL COMMENT 'vip到期时间',
  `points` int(11) DEFAULT '0' COMMENT '积分',
  `emoney` int(11) DEFAULT '0' COMMENT '虚拟币',
  `experiments` int(11) DEFAULT '0',
  `is_email` tinyint(1) DEFAULT '0' COMMENT '1:email verified,0:email unverified',
  `is_mobile` tinyint(1) DEFAULT '0' COMMENT '1:mobile verified,0:mobile unverified',
  `login_by_msg` tinyint(4) DEFAULT '0' COMMENT '开启短信验证登录',
  `reward` int(11) DEFAULT '0' COMMENT '下线投注，注册等获得的奖励',
  `safe_q` tinyint(1) DEFAULT NULL COMMENT '''1''=>''您父亲的姓名是什么'',\r\n      ''2''=>''您母亲的姓名是什么'',\r\n      ''3''=>''您的出生地'',\r\n      ''4''=>''您的宠物的名字'',\r\n      ''5''=>''您的职业是什么'',\r\n      ''6''=>''您配偶的职业是什么''',
  `safe_a` varchar(100) DEFAULT NULL COMMENT 'answer safety',
  `qq` char(12) DEFAULT NULL,
  `wechat` char(30) DEFAULT NULL,
  `alipay` char(40) DEFAULT NULL,
  `birth` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `is_freeze` tinyint(1) DEFAULT '1' COMMENT '1:normal,2:frozen',
  `is_can_draw` tinyint(1) DEFAULT '0' COMMENT '充值后是否可以抽奖',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user
-- ----------------------------
INSERT INTO `hov_user` VALUES ('5', 'ikscher', '97e08cd92c60e3d3c0d9f085ba2797ca', '1', null, '1', '45397311@qq.com', '13856911659', '2600880', '3218', '1554362992', '1554733351', '1554775182', '0', '192.168.1.102', '8', null, '0', '0', '0', '1855', '1', '1', '0', null, '1', 'ok', '3', null, '4', '1970', null, '1', '0');
INSERT INTO `hov_user` VALUES ('6', 'ikscher2', '97e08cd92c60e3d3c0d9f085ba2797ca', '1', null, '1', '', '13856922659', '196970', '0', '1554733760', '1556279866', '1554733760', '0', '192.168.1.104', '8', null, null, '0', '0', '0', '0', '1', '0', null, null, null, null, null, null, null, null, '1', '0');
INSERT INTO `hov_user` VALUES ('7', 'ikscher3', '97e08cd92c60e3d3c0d9f085ba2797ca', '1', null, '1', '', '13856933659', '0', '0', '1554734059', null, '1554734059', '0', '192.168.1.102', '8', null, null, '0', '0', '0', '0', '1', '0', null, null, null, null, null, null, null, null, '1', '0');
INSERT INTO `hov_user` VALUES ('8', 'ikscher4', 'b6e6f93000c7ffb987cd56da6d44d538', '1', '52', '1', '', '13856900659', '1000377', '0', '1554734339', '1556244547', '1554734339', null, '192.168.1.100', null, '0', null, '0', '0', '1000', '0', '1', '0', null, null, null, null, null, null, null, null, '1', '0');
INSERT INTO `hov_user` VALUES ('9', 'ikscher5', '97e08cd92c60e3d3c0d9f085ba2797ca', '1', null, '1', '', '13856955659', '270', '0', '1554735892', null, '1554735892', '5', '192.168.1.102', '8', '0', null, '0', '0', '100', '0', '1', '0', null, null, null, null, null, null, null, null, '1', '0');
INSERT INTO `hov_user` VALUES ('10', 'ikscher6', '97e08cd92c60e3d3c0d9f085ba2797ca', '1', '51', '1', '45397312@qq.com', '13856944659', '1464107', '0', '1554736170', '1556263485', '1554817692', '0', '192.168.1.100', '8', '0', '1554739200', '0', '0', '1000', '1', '1', '0', null, '3', 'jxjx', '23232323', null, '', '1054915200', null, '1', '0');
INSERT INTO `hov_user` VALUES ('11', 'fsdf', '2afffabc41c1724a8f3d1fd86da6fc48', '1', null, '1', '', '13956899823', '0', '0', '1554777503', null, '1554777503', '0', '192.168.1.107', '8', '0', null, '0', '0', '0', '0', '1', '0', null, null, null, null, null, null, null, null, '1', '0');

-- ----------------------------
-- Table structure for `hov_user_bid`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_bid`;
CREATE TABLE `hov_user_bid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL COMMENT '投注的比赛ID,如幸运百家乐1',
  `game_number` int(11) NOT NULL COMMENT '开奖期号',
  `bidinfo` varchar(300) DEFAULT NULL COMMENT '投注情况具体(每个数投了多少注）',
  `bidmoney` int(11) DEFAULT NULL COMMENT '投注总金额',
  `prizeinfo` varchar(300) DEFAULT NULL COMMENT '每注损益情况',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_bid
-- ----------------------------
INSERT INTO `hov_user_bid` VALUES ('18', '6', '1', '11126', '{\"f1\":{\"\\u5e84\\u8d62\":\"100\"},\"f2\":{\"\\u95f2\\u8d62\":\"100\"},\"f3\":{\"\\u548c\":\"100\"}}', '300', null, '1556366242', null);
INSERT INTO `hov_user_bid` VALUES ('19', '6', '1', '11128', '{\"f1\":{\"\\u5e84\\u8d62\":\"65\"},\"f2\":{\"\\u95f2\\u8d62\":\"65\"},\"f3\":{\"\\u548c\":\"65\"}}', '195', null, '1556366275', null);
INSERT INTO `hov_user_bid` VALUES ('20', '6', '1', '11131', '{\"f1\":{\"\\u5e84\\u8d62\":\"100\"},\"f2\":{\"\\u95f2\\u8d62\":\"100\"},\"f3\":{\"\\u548c\":\"100\"}}', '300', '{\"f1\":0,\"f2\":0,\"f3\":1048}', '1556366537', null);
INSERT INTO `hov_user_bid` VALUES ('21', '6', '1', '11150', '{\"f1\":{\"\\u5e84\\u8d62\":\"50\"},\"f2\":{\"\\u95f2\\u8d62\":\"50\"},\"f3\":{\"\\u548c\":\"50\"}}', '150', '{\"f1\":0,\"f2\":108,\"f3\":0}', '1556367629', null);
INSERT INTO `hov_user_bid` VALUES ('22', '6', '1', '11566', '{\"f1\":{\"\\u5e84\\u8d62\":\"100\"},\"f2\":{\"\\u95f2\\u8d62\":\"100\"},\"f3\":{\"\\u548c\":\"100\"}}', '300', '{\"f1\":223,\"f2\":0,\"f3\":0}', '1556453009', null);
INSERT INTO `hov_user_bid` VALUES ('23', '6', '1', '11584', '{\"f1\":{\"\\u5e84\\u8d62\":\"100\"},\"f2\":{\"\\u95f2\\u8d62\":\"100\"},\"f3\":{\"\\u548c\":\"100\"}}', '300', '{\"f1\":0,\"f2\":217,\"f3\":0}', '1556454078', null);
INSERT INTO `hov_user_bid` VALUES ('24', '6', '1', '11585', '{\"f1\":{\"\\u5e84\\u8d62\":\"50\"},\"f2\":{\"\\u95f2\\u8d62\":\"50\"},\"f3\":{\"\\u548c\":\"50\"}}', '150', '{\"f1\":0,\"f2\":108,\"f3\":0}', '1556454177', null);
INSERT INTO `hov_user_bid` VALUES ('25', '6', '1', '11586', '{\"f1\":{\"\\u5e84\\u8d62\":\"100\"},\"f2\":{\"\\u95f2\\u8d62\":\"100\"},\"f3\":{\"\\u548c\":\"100\"}}', '300', '{\"f1\":0,\"f2\":0,\"f3\":1048}', '1556454219', null);
INSERT INTO `hov_user_bid` VALUES ('26', '6', '2', '294', '{\"f1\":{\"1\":\"10\"},\"f2\":{\"2\":\"10\"},\"f3\":{\"3\":\"10\"},\"f4\":{\"4\":\"10\"},\"f5\":{\"5\":\"10\"},\"f6\":{\"6\":\"10\"},\"f7\":{\"7\":\"10\"},\"f8\":{\"8\":\"10\"},\"f9\":{\"9\":\"10\"},\"f10\":{\"10\":\"10\"}}', '100', null, '1556455632', null);
INSERT INTO `hov_user_bid` VALUES ('27', '6', '2', '296', '{\"f1\":{\"1\":\"10\"},\"f2\":{\"2\":\"10\"},\"f3\":{\"3\":\"10\"},\"f4\":{\"4\":\"10\"},\"f5\":{\"5\":\"10\"},\"f6\":{\"6\":\"10\"},\"f7\":{\"7\":\"10\"},\"f8\":{\"8\":\"10\"},\"f9\":{\"9\":\"10\"},\"f10\":{\"10\":\"10\"}}', '100', '{\"f1\":0,\"f2\":0,\"f3\":0,\"f4\":0,\"f5\":0,\"f6\":99,\"f7\":0,\"f8\":0,\"f9\":0,\"f10\":0}', '1556455760', null);
INSERT INTO `hov_user_bid` VALUES ('28', '6', '2', '329', '{\"f1\":{\"1\":\"50\"},\"f3\":{\"3\":\"50\"},\"f5\":{\"5\":\"50\"},\"f7\":{\"7\":\"50\"},\"f8\":{\"8\":\"50\"}}', '250', '{\"f1\":0,\"f3\":0,\"f5\":0,\"f7\":0,\"f8\":0}', '1556457744', null);
INSERT INTO `hov_user_bid` VALUES ('29', '6', '1', '11656', '{\"f1\":{\"\\u5e84\\u8d62\":\"100\"}}', '100', '{\"f1\":0}', '1556458376', null);
INSERT INTO `hov_user_bid` VALUES ('30', '6', '2', '366', '{\"f1\":{\"1\":\"10\"},\"f2\":{\"2\":\"10\"},\"f3\":{\"3\":\"10\"},\"f4\":{\"4\":\"10\"},\"f5\":{\"5\":\"10\"},\"f6\":{\"6\":\"10\"},\"f7\":{\"7\":\"10\"},\"f8\":{\"8\":\"10\"},\"f9\":{\"9\":\"10\"},\"f10\":{\"10\":\"10\"}}', '100', '{\"f1\":0,\"f2\":0,\"f3\":0,\"f4\":0,\"f5\":0,\"f6\":0,\"f7\":0,\"f8\":0,\"f9\":0,\"f10\":99}', '1556459920', null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_charge
-- ----------------------------

-- ----------------------------
-- Table structure for `hov_user_exchange`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_exchange`;
CREATE TABLE `hov_user_exchange` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `prize_id` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL COMMENT '兑换价格',
  `num` int(11) DEFAULT NULL COMMENT '兑换数量',
  `aggregate` varchar(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `card` varchar(1000) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '奖品是否通过审核1：待审核，2：通过（已发货），3：不通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_exchange
-- ----------------------------
INSERT INTO `hov_user_exchange` VALUES ('71', '5', '4', '100.00', '1', '114450', '1554711490', null, null, '2');
INSERT INTO `hov_user_exchange` VALUES ('73', '5', '4', '100.00', '1', '114450', '1554713180', null, null, '2');
INSERT INTO `hov_user_exchange` VALUES ('75', '5', '4', '100.00', '1', '114450', '1554714100', null, null, '2');
INSERT INTO `hov_user_exchange` VALUES ('76', '10', '4', '100.00', '1', '109200', '1554879547', null, null, '3');
INSERT INTO `hov_user_exchange` VALUES ('77', '10', '4', '100.00', '1', '109200', '1554884806', null, 'd100RODP07J11NQ2CAN', '2');
INSERT INTO `hov_user_exchange` VALUES ('78', '10', '4', '100.00', '3', '327600', '1554955688', null, '[{\"card_no\":\"d10F2XO3BEZ97OESSB1\",\"card_pwd\":\"7A1WTJ8FI0NM8SGQ\"},{\"card_no\":\"d10TQU6I71MDLG5ZVFF\",\"card_pwd\":\"F1UV6E0ENR0BYA1Y\"},{\"card_no\":\"d10YIOSDEZ0A4ZXEKXD\",\"card_pwd\":\"DRA0IAWYLB0CQCHP\"}]', '2');
INSERT INTO `hov_user_exchange` VALUES ('79', '10', '4', '100.00', '2', '218400', '1554956298', null, '[{\"card_no\":\"d105IT1ZNN6ASRMJ584\",\"card_pwd\":\"AXV854ZMS2FJ7VQK\"},{\"card_no\":\"d1002AJ8Z3TVY2PJUOJ\",\"card_pwd\":\"LNO8C0VQQCWAANG6\"}]', '2');
INSERT INTO `hov_user_exchange` VALUES ('80', '10', '4', '100.00', '2', '218400', '1555121939', null, '[{\"card_no\":\"d10LVPT61SCDYA3GQJH\",\"card_pwd\":\"T54RMJL4LGHD4P70\"},{\"card_no\":\"d10QTWHHM77SHQRPDNM\",\"card_pwd\":\"OFT5RA535WQ68RJN\"}]', '2');
INSERT INTO `hov_user_exchange` VALUES ('81', '10', '4', '100.00', '1', '109200', '1555600483', null, '[{\"card_no\":\"d101YWCVOTMO9NI9MR4\",\"card_pwd\":\"OKR58Z7366JWUJ6A\"}]', '2');
INSERT INTO `hov_user_exchange` VALUES ('82', '10', '4', '100.00', '1', '109200', '1555684074', null, '[{\"card_no\":\"d102KXZ660FTL1QVEWC\",\"card_pwd\":\"ZOYJ0GFIRAVQVQ9I\"}]', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_grade
-- ----------------------------
INSERT INTO `hov_user_grade` VALUES ('1', 'VIP0', '0', '1000', '0', null, '1554446393');
INSERT INTO `hov_user_grade` VALUES ('2', 'VIP1', '1001', '2000', '1', null, '1553002578');
INSERT INTO `hov_user_grade` VALUES ('3', 'VIP2', '2001', '3000', '2', null, null);
INSERT INTO `hov_user_grade` VALUES ('4', 'VIP3', '3000', '8999', '3', '1554446281', '1554446281');
INSERT INTO `hov_user_grade` VALUES ('5', 'VIP4', '8000', '29999', '4', '1554446322', '1554446322');
INSERT INTO `hov_user_grade` VALUES ('6', 'VIP5', '30000', '59999', '5', '1554446352', '1554446352');
INSERT INTO `hov_user_grade` VALUES ('7', 'VIP6', '60000', '2147483647', '6', '1554446381', '1554777049');

-- ----------------------------
-- Table structure for `hov_user_log`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_log`;
CREATE TABLE `hov_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `mp_coin` int(11) DEFAULT '0' COMMENT '增加减少金币',
  `mp_exp` int(11) DEFAULT '0' COMMENT '增加减少经验',
  `coin` int(11) DEFAULT '0',
  `experiment` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `type` char(30) DEFAULT NULL COMMENT '日志类型',
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_log
-- ----------------------------
INSERT INTO `hov_user_log` VALUES ('129', '10', '龙发点卡(10001)代充', '100000', '50', '100000', '0', '1555119094', 'charge_agent', null);
INSERT INTO `hov_user_log` VALUES ('130', '10', '龙发点卡(10001)充值撤回', '-100000', '-50', '0', '0', '1555119140', 'charge_revoke', null);
INSERT INTO `hov_user_log` VALUES ('131', '10', '用户点卡自充值1000000', '1000000', '1000', '1000000', '0', '1555121539', 'charge_user', null);
INSERT INTO `hov_user_log` VALUES ('132', '10', '兑换奖品移动充值卡100元', '-218400', '0', '781600', '0', '1555121939', 'prize', null);
INSERT INTO `hov_user_log` VALUES ('133', '10', '兑奖流水额外手续费', '-4368', '0', '777232', '0', '1555121939', 'prize', null);
INSERT INTO `hov_user_log` VALUES ('134', '10', '兑奖次数额外手续费', '-4368', '0', '772864', '0', '1555121939', 'prize', null);
INSERT INTO `hov_user_log` VALUES ('135', '10', '龙发点卡(10001)代充', '100000', '50', '881600', '0', '1555388271', 'charge_agent', null);
INSERT INTO `hov_user_log` VALUES ('136', '10', '龙发点卡(10001)充值撤回', '-100000', '-50', '781600', '0', '1555388305', 'charge_revoke', null);
INSERT INTO `hov_user_log` VALUES ('137', '10', '每日签到', '2', '0', '781602', '0', '1555389616', 'signin', null);
INSERT INTO `hov_user_log` VALUES ('138', '8', '登录', '0', '0', null, '0', '1555400898', '', null);
INSERT INTO `hov_user_log` VALUES ('139', '8', '登录', '0', '0', null, '0', '1555405204', 'login', null);
INSERT INTO `hov_user_log` VALUES ('140', '8', '登录', '0', '0', null, '0', '1555425194', 'login', null);
INSERT INTO `hov_user_log` VALUES ('141', '8', '登录', '0', '0', null, '0', '1555426507', 'login', null);
INSERT INTO `hov_user_log` VALUES ('142', '8', '登录', '0', '0', null, '0', '1555426656', 'login', null);
INSERT INTO `hov_user_log` VALUES ('143', '9', '每日签到', '2', '0', null, '0', '1555427997', 'signin', null);
INSERT INTO `hov_user_log` VALUES ('144', '8', '登录', '0', '0', null, '0', '1555474232', 'login', null);
INSERT INTO `hov_user_log` VALUES ('147', '8', '每日签到', '1', '0', '1', '0', '1555475270', 'signin', null);
INSERT INTO `hov_user_log` VALUES ('148', '10', '登录', '0', '0', '781602', '0', '1555475339', 'login', null);
INSERT INTO `hov_user_log` VALUES ('149', '10', '每日签到', '1', '0', '781603', '0', '1555475354', 'signin', null);
INSERT INTO `hov_user_log` VALUES ('150', '9', '用户点卡自充值100000', '100000', '100', null, '0', '1555425492', 'charge_user', null);
INSERT INTO `hov_user_log` VALUES ('151', '10', '登录', '0', '0', '781603', '0', '1555556145', 'login', '0');
INSERT INTO `hov_user_log` VALUES ('152', '8', '登录', '0', '0', '1', '0', '1555556204', 'login', '0');
INSERT INTO `hov_user_log` VALUES ('153', '52', '图片上传', '0', '0', '0', '0', '1555556225', '', '0');
INSERT INTO `hov_user_log` VALUES ('154', '8', '头像上传成功', '0', '0', '0', '0', '1555556227', '', '0');
INSERT INTO `hov_user_log` VALUES ('155', '8', '登录', '0', '0', '1', '0', '1555600440', 'login', '0');
INSERT INTO `hov_user_log` VALUES ('156', '10', '登录', '0', '0', '781603', '0', '1555600471', 'login', '0');
INSERT INTO `hov_user_log` VALUES ('157', '10', '兑换奖品移动充值卡100元', '-109200', '0', '672403', '0', '1555600483', 'prize', '0');
INSERT INTO `hov_user_log` VALUES ('158', '10', '兑奖流水额外手续费', '-2184', '0', '670219', '0', '1555600483', 'prize', '0');
INSERT INTO `hov_user_log` VALUES ('159', '10', '兑奖次数额外手续费', '-2184', '0', '668035', '0', '1555600483', 'prize', '0');
INSERT INTO `hov_user_log` VALUES ('160', '8', '砸金蛋', '0', '0', '0', '0', '1555649379', '', '0');
INSERT INTO `hov_user_log` VALUES ('161', '8', '砸金蛋', '0', '0', '189', '0', '1555649836', 'smasheggs', '0');
INSERT INTO `hov_user_log` VALUES ('162', '8', '用户点卡自充值1000000', '1000000', '1000', '1000377', '0', '1555662551', 'charge_user', '0');
INSERT INTO `hov_user_log` VALUES ('163', '10', '兑换奖品移动充值卡100元', '-109200', '0', '1464097', '0', '1555684074', 'prize', '0');
INSERT INTO `hov_user_log` VALUES ('164', '10', '兑奖流水额外手续费', '-2184', '0', '1461913', '0', '1555684074', 'prize', '0');
INSERT INTO `hov_user_log` VALUES ('165', '10', '兑奖次数额外手续费', '-2184', '0', '1459729', '0', '1555684074', 'prize', '0');
INSERT INTO `hov_user_log` VALUES ('166', '10', '取出金币10', '0', '0', '0', '0', '1555761306', '', '0');
INSERT INTO `hov_user_log` VALUES ('167', '8', '登录', '0', '0', '1000377', '0', '1556244548', 'login', '0');
INSERT INTO `hov_user_log` VALUES ('168', '10', '登录', '0', '0', '1464107', '0', '1556263485', 'login', '0');
INSERT INTO `hov_user_log` VALUES ('169', '6', '登录', '0', '0', '1000', '0', '1556263550', 'login', '0');
INSERT INTO `hov_user_log` VALUES ('170', '6', '游戏投注1', '-150', '0', '850', '0', '1556267463', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('171', '6', '游戏投注1', '-150', '0', '700', '0', '1556267479', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('172', '6', '游戏投注1', '-500', '0', '200', '0', '1556267798', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('173', '6', '登录', '0', '0', '200', '0', '1556279866', 'login', '0');
INSERT INTO `hov_user_log` VALUES ('174', '6', '用户点卡自充值200000', '200000', '0', '200200', '0', '1556279966', 'charge_user', '0');
INSERT INTO `hov_user_log` VALUES ('175', '6', '游戏投注1', '-300', '0', '199900', '0', '1556280068', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('176', '6', '游戏投注1', '-3000', '0', '196900', '0', '1556288687', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('177', '6', '游戏投注1', '-300', '0', '196600', '0', '1556288915', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('178', '6', '游戏投注1', '-300', '0', '196300', '0', '1556289088', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('179', '6', '幸运百家乐第10709期,手动投注300金币', '-300', '0', '197049', '0', '1556290675', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('180', '6', '幸运百家乐第10709期,中奖217金币', '217', '0', '197266', '0', '1556290740', 'hit', '0');
INSERT INTO `hov_user_log` VALUES ('181', '6', '幸运百家乐第10711期,手动投注1500金币', '-1500', '0', '195766', '0', '1556290842', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('182', '6', '幸运百家乐第10711期,中奖1089金币', '1089', '0', '196855', '0', '1556290860', 'hit', '0');
INSERT INTO `hov_user_log` VALUES ('183', '6', '幸运百家乐第10846期,手动投注150金币', '-150', '0', '196705', '0', '1556333121', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('184', '6', '幸运百家乐第10846期,中奖111金币', '111', '0', '196816', '0', '1556333160', 'hit', '0');
INSERT INTO `hov_user_log` VALUES ('185', '6', '幸运百家乐第11011期,手动投注300金币', '-300', '0', '196516', '0', '1556352105', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('186', '6', '幸运百家乐第11024期,手动投注300金币', '-300', '0', '196216', '0', '1556352930', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('187', '6', '幸运百家乐第11032期,手动投注300金币', '-300', '0', '195916', '0', '1556353392', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('188', '6', '幸运百家乐第11038期,手动投注300金币', '-300', '0', '195616', '0', '1556353751', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('189', '6', '幸运百家乐第11038期,中奖1049金币', '1049', '0', '196665', '0', '1556353800', 'hit', '0');
INSERT INTO `hov_user_log` VALUES ('190', '6', '幸运百家乐第11126期,手动投注300金币', '-300', '0', '196365', '0', '1556366242', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('191', '6', '幸运百家乐第11128期,手动投注195金币', '-195', '0', '196170', '0', '1556366276', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('192', '6', '幸运百家乐第11131期,手动投注300金币', '-300', '0', '195870', '0', '1556366537', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('193', '6', '幸运百家乐第11131期,中奖1048金币', '1048', '0', '196918', '0', '1556366580', 'hit', '0');
INSERT INTO `hov_user_log` VALUES ('194', '6', '幸运百家乐第11150期,手动投注150金币', '-150', '0', '196768', '0', '1556367629', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('195', '6', '幸运百家乐第11150期,中奖108金币', '108', '0', '196876', '0', '1556367720', 'hit', '0');
INSERT INTO `hov_user_log` VALUES ('196', '6', '幸运百家乐第11566期,手动投注300金币', '-300', '0', '196576', '0', '1556453009', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('197', '6', '幸运百家乐第11566期,中奖223金币', '223', '0', '196799', '0', '1556453040', 'hit', '0');
INSERT INTO `hov_user_log` VALUES ('198', '6', '幸运百家乐第11584期,手动投注300金币', '-300', '0', '196499', '0', '1556454078', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('199', '6', '幸运百家乐第11584期,中奖217金币', '217', '0', '196716', '0', '1556454120', 'hit', '0');
INSERT INTO `hov_user_log` VALUES ('200', '6', '幸运百家乐第11585期,手动投注150金币', '-150', '0', '196566', '0', '1556454177', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('201', '6', '幸运百家乐第11585期,中奖108金币', '108', '0', '196674', '0', '1556454180', 'hit', '0');
INSERT INTO `hov_user_log` VALUES ('202', '6', '幸运百家乐第11586期,手动投注300金币', '-300', '0', '196374', '0', '1556454220', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('203', '6', '幸运百家乐第11586期,中奖1048金币', '1048', '0', '197422', '0', '1556454240', 'hit', '0');
INSERT INTO `hov_user_log` VALUES ('204', '6', '幸运10第294期,手动投注100金币', '-100', '0', '197322', '0', '1556455632', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('205', '6', '幸运10第296期,手动投注100金币', '-100', '0', '197222', '0', '1556455761', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('206', '6', '幸运10第296期,中奖99金币', '99', '0', '197321', '0', '1556455801', 'hit', '0');
INSERT INTO `hov_user_log` VALUES ('207', '6', '幸运10第329期,手动投注250金币', '-250', '0', '197071', '0', '1556457744', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('208', '6', '幸运百家乐第11656期,手动投注100金币', '-100', '0', '196971', '0', '1556458376', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('209', '6', '幸运10第366期,手动投注100金币', '-100', '0', '196871', '0', '1556459920', 'bet', '0');
INSERT INTO `hov_user_log` VALUES ('210', '6', '幸运10第366期,中奖99金币', '99', '0', '196970', '0', '1556460001', 'hit', '0');

-- ----------------------------
-- Table structure for `hov_user_msg`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_msg`;
CREATE TABLE `hov_user_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_uid` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '收件人',
  `type` tinyint(1) DEFAULT NULL COMMENT '1:所有人2:vip3:单用户',
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(800) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL COMMENT '1已读0未读',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COMMENT='站内信';

-- ----------------------------
-- Records of hov_user_msg
-- ----------------------------
INSERT INTO `hov_user_msg` VALUES ('3', null, '1', '1', '3423', 'ewrer', null, '1553065113');
INSERT INTO `hov_user_msg` VALUES ('4', null, '1', '1', 'wer', 'wer', null, '1553065113');
INSERT INTO `hov_user_msg` VALUES ('8', null, '1', '1', '324', '34', null, '1553065113');
INSERT INTO `hov_user_msg` VALUES ('9', null, '1', '1', '12', '234324', null, '1553065110');
INSERT INTO `hov_user_msg` VALUES ('24', '1', '5', '3', '兑奖发货通知', '内容：您兑换的奖品移动充值卡100元已经发货，谢谢您对我们的支持。<br/>d108CBYQ7CHYBEVLC4E DI61YLS94PXUPSGY', null, '1554709060');
INSERT INTO `hov_user_msg` VALUES ('25', '1', '5', '3', '兑奖发货通知', '内容：您兑换的奖品移动充值卡100元已经发货，谢谢您对我们的支持。<br/>d108CBYQ7CHYBEVLC4E DI61YLS94PXUPSGY', null, '1554709121');
INSERT INTO `hov_user_msg` VALUES ('45', '1', '5', '3', '兑奖发货通知', '内容：您兑换的奖品移动充值卡100元已经发货，谢谢您对我们的支持。<br/>d108CBYQ7CHYBEVLC4E DI61YLS94PXUPSGY', null, '1554711467');
INSERT INTO `hov_user_msg` VALUES ('46', '1', '5', '3', '兑奖发货通知', '内容：您兑换的奖品移动充值卡100元已经发货，谢谢您对我们的支持。<br/>d108CBYQ7CHYBEVLC4E DI61YLS94PXUPSGY', null, '1554711491');
INSERT INTO `hov_user_msg` VALUES ('47', '1', '5', '3', '兑奖发货通知', '内容：您兑换的奖品移动充值卡100元已经发货，谢谢您对我们的支持。<br/>d108CBYQ7CHYBEVLC4E DI61YLS94PXUPSGY', null, '1554713180');
INSERT INTO `hov_user_msg` VALUES ('49', '1', '5', '3', '兑奖发货通知', '内容：您兑换的奖品移动充值卡100元已经发货，谢谢您对我们的支持。<br/>d10JUBE2BWDR08NH6IN TDY77L711V6E1I6V', null, '1554714101');
INSERT INTO `hov_user_msg` VALUES ('51', '1', '10', '3', '兑奖缺货通知', '内容：您兑换的奖品移动充值卡100元缺货，谢谢您对我们的支持。<br/>', null, '1554884726');
INSERT INTO `hov_user_msg` VALUES ('52', '1', '10', '3', '兑奖发货通知', '内容：您兑换的奖品移动充值卡100元已经发货，谢谢您对我们的支持。<br/>d100RODP07J11NQ2CAN MDN3RAI7XQ6Y1EXY', null, '1554884806');
INSERT INTO `hov_user_msg` VALUES ('53', '1', '10', '3', '兑奖发货通知', '内容：您兑换的奖品移动充值卡100元已经发货，谢谢您对我们的支持。<br/>d10F2XO3BEZ97OESSB1 7A1WTJ8FI0NM8SGQ<br/>d10TQU6I71MDLG5ZVFF F1UV6E0ENR0BYA1Y<br/>d10YIOSDEZ0A4ZXEKXD DRA0IAWYLB0CQCHP<br/>', null, '1554955688');
INSERT INTO `hov_user_msg` VALUES ('54', '1', '10', '3', '兑奖发货通知', '内容：您兑换的奖品移动充值卡100元已经发货，谢谢您对我们的支持。<br/>d105IT1ZNN6ASRMJ584 AXV854ZMS2FJ7VQK<br/>d1002AJ8Z3TVY2PJUOJ LNO8C0VQQCWAANG6<br/>', null, '1554956298');
INSERT INTO `hov_user_msg` VALUES ('55', '1', '10', '3', '兑奖发货通知', '内容：您兑换的奖品移动充值卡100元已经发货，谢谢您对我们的支持。<br/>d10LVPT61SCDYA3GQJH T54RMJL4LGHD4P70<br/>d10QTWHHM77SHQRPDNM OFT5RA535WQ68RJN<br/>', null, '1555121939');
INSERT INTO `hov_user_msg` VALUES ('56', '1', '10', '3', '兑奖发货通知', '内容：您兑换的奖品移动充值卡100元已经发货，谢谢您对我们的支持。<br/>d101YWCVOTMO9NI9MR4 OKR58Z7366JWUJ6A<br/>', null, '1555600483');
INSERT INTO `hov_user_msg` VALUES ('57', '1', '10', '3', '兑奖发货通知', '内容：您兑换的奖品移动充值卡100元已经发货，谢谢您对我们的支持。<br/>d102KXZ660FTL1QVEWC ZOYJ0GFIRAVQVQ9I<br/>', null, '1555684074');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='站内信';

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户工单';

-- ----------------------------
-- Records of hov_user_question
-- ----------------------------
INSERT INTO `hov_user_question` VALUES ('2', '2', '1', 'dddd', 'aaaa', '<p>ccccc</p>', null, '4', '1553045303', '1553588867');
INSERT INTO `hov_user_question` VALUES ('3', '1', '1', '122', '2323', '', null, '1', '1553047231', '1553588861');

-- ----------------------------
-- Table structure for `hov_user_recomyield`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_recomyield`;
CREATE TABLE `hov_user_recomyield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(30) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `reward` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `referee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_recomyield
-- ----------------------------

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
  `is_show` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='奖品评论表';

-- ----------------------------
-- Records of hov_user_remark
-- ----------------------------
INSERT INTO `hov_user_remark` VALUES ('1', '1', '4', '<p>ewrewrwersdfafsdfasssf问问</p><p>斯蒂芬斯蒂芬abcds</p>', '1552572226', '1553000946', '1');

-- ----------------------------
-- Table structure for `hov_user_safepwd`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_safepwd`;
CREATE TABLE `hov_user_safepwd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `safe` varchar(1000) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_safepwd
-- ----------------------------
INSERT INTO `hov_user_safepwd` VALUES ('2', '8', '{\"A\":{\"1\":\"wm\",\"2\":\"d3\",\"3\":\"ab\",\"4\":\"5e\",\"5\":\"gh\",\"6\":\"ej\",\"7\":\"4p\",\"8\":\"u8\",\"9\":\"wf\"},\"B\":{\"1\":\"k4\",\"2\":\"4k\",\"3\":\"xt\",\"4\":\"ef\",\"5\":\"bw\",\"6\":\"tk\",\"7\":\"ug\",\"8\":\"x9\",\"9\":\"jx\"},\"C\":{\"1\":\"5u\",\"2\":\"6w\",\"3\":\"sk\",\"4\":\"8w\",\"5\":\"sx\",\"6\":\"xf\",\"7\":\"sc\",\"8\":\"7r\",\"9\":\"wy\"},\"D\":{\"1\":\"y6\",\"2\":\"pj\",\"3\":\"3x\",\"4\":\"qp\",\"5\":\"dn\",\"6\":\"cq\",\"7\":\"t3\",\"8\":\"fj\",\"9\":\"ta\"},\"E\":{\"1\":\"93\",\"2\":\"68\",\"3\":\"gm\",\"4\":\"aq\",\"5\":\"hv\",\"6\":\"qc\",\"7\":\"37\",\"8\":\"f7\",\"9\":\"dm\"},\"F\":{\"1\":\"jc\",\"2\":\"wr\",\"3\":\"8v\",\"4\":\"hm\",\"5\":\"9y\",\"6\":\"ka\",\"7\":\"cx\",\"8\":\"ym\",\"9\":\"87\"},\"G\":{\"1\":\"7t\",\"2\":\"he\",\"3\":\"x8\",\"4\":\"nx\",\"5\":\"d5\",\"6\":\"sf\",\"7\":\"qv\",\"8\":\"3h\",\"9\":\"je\"},\"H\":{\"1\":\"ks\",\"2\":\"ny\",\"3\":\"st\",\"4\":\"8j\",\"5\":\"qc\",\"6\":\"uj\",\"7\":\"jc\",\"8\":\"yd\",\"9\":\"9x\"},\"I\":{\"1\":\"9w\",\"2\":\"9r\",\"3\":\"uk\",\"4\":\"9j\",\"5\":\"g9\",\"6\":\"9b\",\"7\":\"uk\",\"8\":\"t6\",\"9\":\"nx\"}}', '1555400915');

-- ----------------------------
-- Table structure for `hov_user_signin`
-- ----------------------------
DROP TABLE IF EXISTS `hov_user_signin`;
CREATE TABLE `hov_user_signin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '签到的天数明细',
  `cur_date` int(11) DEFAULT NULL COMMENT '当前日期（月份）',
  `signin_day` varchar(200) DEFAULT NULL COMMENT '当月签到的天数明细',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hov_user_signin
-- ----------------------------
INSERT INTO `hov_user_signin` VALUES ('1', '10', '1555475354', '[8,9,11,15,16]');
INSERT INTO `hov_user_signin` VALUES ('2', '9', '1555427996', '[15]');
INSERT INTO `hov_user_signin` VALUES ('5', '8', '1555475270', '[16]');

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
  `smashegg_integral` int(11) DEFAULT '0' COMMENT '砸蛋一次消耗积分数',
  `draw_lottery` int(11) DEFAULT '0' COMMENT '充值多少金币得一次抽奖机会',
  PRIMARY KEY (`id`),
  KEY `web` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hov_webconfig
-- ----------------------------
INSERT INTO `hov_webconfig` VALUES ('101', 'Tplay后台管理框架', 'Tplay,后台管理,thinkphp5,layui', 'Tplay是一款基于ThinkPHP5.0.12 + layui2.2.45 + ECharts + Mysql开发的后台管理框架，集成了一般应用所必须的基础性功能，为开发者节省大量的时间。', '1', 'jpg,png,gif,mp4,zip,jpeg', '500', '', '', null, '金币', '0', '0', '1000', '0.4', '0.5000', '0.05', '0.9920', '50', '50', '10', '2.0000', '3.00', '0', '200', '200000');
