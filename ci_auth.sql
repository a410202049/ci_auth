/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : ci_auth

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-07-21 19:00:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `esc_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `esc_auth_rule`;
CREATE TABLE `esc_auth_rule` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `title_language` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `pid` smallint(5) NOT NULL COMMENT '父级ID',
  `sort` tinyint(4) NOT NULL DEFAULT '50' COMMENT '排序',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `icon` varchar(30) DEFAULT NULL,
  `isshow` int(11) DEFAULT '1',
  `condition` varchar(30) DEFAULT NULL,
  `mark` varchar(50) DEFAULT NULL,
  `rule_type` enum('platform','site') DEFAULT 'platform' COMMENT '平台菜单，普通网站菜单',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1042 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_auth_rule
-- ----------------------------
INSERT INTO `esc_auth_rule` VALUES ('1', 'platform_homepage', 'Platform/index', '0', '50', '1461304352', null, '1', null, '平台主页', 'platform');
INSERT INTO `esc_auth_rule` VALUES ('2', 'site_manage', '', '0', '50', '1461304352', null, '1', null, '站点管理', 'platform');
INSERT INTO `esc_auth_rule` VALUES ('3', 'site_list', 'Platform/siteList', '2', '50', '1461304352', null, '1', null, '站点列表', 'platform');
INSERT INTO `esc_auth_rule` VALUES ('4', 'create_site', 'Platform/createSite', '2', '50', '1461304352', null, '1', null, '创建站点', 'platform');
INSERT INTO `esc_auth_rule` VALUES ('5', 'site_setting', 'Platform/siteSetting', '0', '50', '1461304352', null, '1', null, '站点设置', 'platform');

-- ----------------------------
-- Table structure for `esc_pt_group`
-- ----------------------------
DROP TABLE IF EXISTS `esc_pt_group`;
CREATE TABLE `esc_pt_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_pt_group
-- ----------------------------
INSERT INTO `esc_pt_group` VALUES ('1', '平台管理员', '1', '1,2,3,4', '1461318997');
INSERT INTO `esc_pt_group` VALUES ('2', '平台编辑员', '1', '1,2', '1461318997');

-- ----------------------------
-- Table structure for `esc_pt_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `esc_pt_group_access`;
CREATE TABLE `esc_pt_group_access` (
  `uid` smallint(5) unsigned NOT NULL,
  `group_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_pt_group_access
-- ----------------------------
INSERT INTO `esc_pt_group_access` VALUES ('1', '1');
INSERT INTO `esc_pt_group_access` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `esc_site`
-- ----------------------------
DROP TABLE IF EXISTS `esc_site`;
CREATE TABLE `esc_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personality_url` varchar(20) DEFAULT NULL COMMENT '个性域名',
  `add_time` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_site
-- ----------------------------

-- ----------------------------
-- Table structure for `esc_site_group`
-- ----------------------------
DROP TABLE IF EXISTS `esc_site_group`;
CREATE TABLE `esc_site_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_site_group
-- ----------------------------
INSERT INTO `esc_site_group` VALUES ('1', '超级管理员', '1', '3,1003,1006,1007,1008,1004,1009,1010,1011,1005,1012,1013,1014,1016,1017,1018,1019,1031,1033', '1461318997', '1');

-- ----------------------------
-- Table structure for `esc_site_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `esc_site_group_access`;
CREATE TABLE `esc_site_group_access` (
  `uid` smallint(5) unsigned NOT NULL,
  `group_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_site_group_access
-- ----------------------------
INSERT INTO `esc_site_group_access` VALUES ('2', '1');

-- ----------------------------
-- Table structure for `esc_user`
-- ----------------------------
DROP TABLE IF EXISTS `esc_user`;
CREATE TABLE `esc_user` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(40) NOT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `last_login_time` int(11) DEFAULT NULL,
  `last_login_ip` varchar(40) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `user_type` enum('platform','ordinary','site') DEFAULT 'ordinary' COMMENT '平台管理，普通用户，站点管理',
  `site_id` int(11) DEFAULT '0' COMMENT 'siteid不为空 代表是某个站点下的用户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`) USING BTREE,
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='管理员数据表';

-- ----------------------------
-- Records of esc_user
-- ----------------------------
INSERT INTO `esc_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '410202049@qq.com', '', '1', '1469098161', '127.0.0.1', 'avatar578f50d54ebf9_314_name1.jpg', 'platform', '0');
INSERT INTO `esc_user` VALUES ('2', 'kerry', '21232f297a57a5a743894a0e4a801fc3', '410202049@qq.com', '111', '1', '1469097860', '127.0.0.1', 'avatar578f50d54ebf9_314_name1.jpg', 'platform', '0');
INSERT INTO `esc_user` VALUES ('3', 'zero', '21232f297a57a5a743894a0e4a801fc3', '', '', '1', null, null, null, 'ordinary', '0');
