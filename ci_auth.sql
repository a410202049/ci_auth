/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : ci_auth

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-05-06 18:18:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `esc_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `esc_auth_group`;
CREATE TABLE `esc_auth_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_auth_group
-- ----------------------------
INSERT INTO `esc_auth_group` VALUES ('2', '编辑组', '1', '3,1003,1006,1007,1008,1004,1005,1012,1013,1014,1016', '1461319543');
INSERT INTO `esc_auth_group` VALUES ('1', '超级管理员', '1', '1,2,3,53,54,57,55,56', '1461318997');

-- ----------------------------
-- Table structure for `esc_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `esc_auth_group_access`;
CREATE TABLE `esc_auth_group_access` (
  `uid` smallint(5) unsigned NOT NULL,
  `group_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_auth_group_access
-- ----------------------------
INSERT INTO `esc_auth_group_access` VALUES ('1', '1');
INSERT INTO `esc_auth_group_access` VALUES ('8', '2');

-- ----------------------------
-- Table structure for `esc_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `esc_auth_rule`;
CREATE TABLE `esc_auth_rule` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `pid` smallint(5) NOT NULL COMMENT '父级ID',
  `sort` tinyint(4) NOT NULL DEFAULT '50' COMMENT '排序',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `icon` varchar(30) DEFAULT NULL,
  `isshow` int(11) DEFAULT '1',
  `condition` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1019 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_auth_rule
-- ----------------------------
INSERT INTO `esc_auth_rule` VALUES ('3', '管理员设置', '', '0', '2', '1461304352', 'fa fa-user', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1003', '权限菜单', 'AuthMenu/index', '3', '4', '1462421741', '', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1004', '管理员列表', 'AuthMenu/adminList', '3', '2', '1462426444', '', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1005', '用户组', 'AuthMenu/groupList', '3', '3', '1462432238', '', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1006', '添加菜单', 'AuthMenu/addMenu', '1003', '50', '1462439203', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1007', '删除菜单', 'AuthMenu/delMenu', '1003', '50', '1462439251', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1008', '菜单排序', 'AuthMenu/order', '1003', '50', '1462439284', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1009', '添加用户', 'AuthMenu/addUser', '1004', '127', '1462439315', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1010', '禁用用户', 'AuthMenu/disableUser', '1004', '50', '1462439420', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1011', '删除用户', 'AuthMenu/delUser', '1004', '50', '1462439454', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1012', '添加分组', 'AuthMenu/addGroup', '1005', '50', '1462439568', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1013', '编辑分组', 'AuthMenu/editGroup', '1005', '50', '1462439607', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1014', '删除分组', 'AuthMenu/delGroup', '1005', '50', '1462439637', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1016', '系统主页', 'Main/index', '0', '1', '1462446704', 'fa fa-home', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1017', '修改密码', 'Main/changePassword', '1016', '50', '1462516089', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1018', '修改头像', 'Main/changeAvatar', '1016', '50', '1462517698', '', '0', null);

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
  `is_manage` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`) USING BTREE,
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='管理员数据表';

-- ----------------------------
-- Records of esc_user
-- ----------------------------
INSERT INTO `esc_user` VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', '410202049@qq.com', '', '1', '1462515455', '127.0.0.1', 'avatar572c6c41b337d_431_name1.jpg', '1');
INSERT INTO `esc_user` VALUES ('8', 'kerry', 'b2f7d28f741d8a6094cec4a68213375b', '', '', '1', '1462529455', '127.0.0.1', null, '1');

-- ----------------------------
-- Table structure for `esc_vendors`
-- ----------------------------
DROP TABLE IF EXISTS `esc_vendors`;
CREATE TABLE `esc_vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(50) DEFAULT NULL COMMENT '厂商排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=463 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_vendors
-- ----------------------------
INSERT INTO `esc_vendors` VALUES ('58', '上汽大众');
INSERT INTO `esc_vendors` VALUES ('8', '一汽-大众');
INSERT INTO `esc_vendors` VALUES ('50', '大众(进口)');
INSERT INTO `esc_vendors` VALUES ('155', '广汽丰田');
INSERT INTO `esc_vendors` VALUES ('40', '一汽丰田');
INSERT INTO `esc_vendors` VALUES ('63', '丰田(进口)');
INSERT INTO `esc_vendors` VALUES ('43', '长安福特');
INSERT INTO `esc_vendors` VALUES ('447', '江铃福特');
INSERT INTO `esc_vendors` VALUES ('61', '福特(进口)');
INSERT INTO `esc_vendors` VALUES ('180', '北京克莱斯勒');
INSERT INTO `esc_vendors` VALUES ('51', '东南汽车');
INSERT INTO `esc_vendors` VALUES ('69', '克莱斯勒(进口)');
INSERT INTO `esc_vendors` VALUES ('375', '东风雷诺');
INSERT INTO `esc_vendors` VALUES ('89', '雷诺(进口)');
INSERT INTO `esc_vendors` VALUES ('427', '广汽菲克菲亚特');
INSERT INTO `esc_vendors` VALUES ('34', '南京菲亚特');
INSERT INTO `esc_vendors` VALUES ('165', '菲亚特(进口)');
INSERT INTO `esc_vendors` VALUES ('27', '北京现代');
INSERT INTO `esc_vendors` VALUES ('402', '四川现代');
INSERT INTO `esc_vendors` VALUES ('74', '现代(进口)');
INSERT INTO `esc_vendors` VALUES ('38', '东风标致');
INSERT INTO `esc_vendors` VALUES ('88', '标致(进口)');
INSERT INTO `esc_vendors` VALUES ('151', '东风本田');
INSERT INTO `esc_vendors` VALUES ('32', '广汽本田');
INSERT INTO `esc_vendors` VALUES ('75', '本田(进口)');
INSERT INTO `esc_vendors` VALUES ('29', '华晨宝马');
INSERT INTO `esc_vendors` VALUES ('80', '宝马(进口)');
INSERT INTO `esc_vendors` VALUES ('345', '宝马M');
INSERT INTO `esc_vendors` VALUES ('159', '上汽集团');
INSERT INTO `esc_vendors` VALUES ('53', '华晨中华');
INSERT INTO `esc_vendors` VALUES ('30', '哈飞汽车');
INSERT INTO `esc_vendors` VALUES ('54', '吉利汽车');
INSERT INTO `esc_vendors` VALUES ('33', '奇瑞汽车');
INSERT INTO `esc_vendors` VALUES ('405', '奇瑞新能源');
INSERT INTO `esc_vendors` VALUES ('312', '北京汽车');
INSERT INTO `esc_vendors` VALUES ('172', '东风汽车');
INSERT INTO `esc_vendors` VALUES ('173', '郑州日产');
INSERT INTO `esc_vendors` VALUES ('9', '一汽-大众奥迪');
INSERT INTO `esc_vendors` VALUES ('79', '奥迪(进口)');
INSERT INTO `esc_vendors` VALUES ('346', '奥迪RS');
INSERT INTO `esc_vendors` VALUES ('86', '阿尔法罗密欧');
INSERT INTO `esc_vendors` VALUES ('108', '阿斯顿·马丁');
INSERT INTO `esc_vendors` VALUES ('152', '北京奔驰');
INSERT INTO `esc_vendors` VALUES ('301', '福建奔驰');
INSERT INTO `esc_vendors` VALUES ('47', '奔驰(进口)');
INSERT INTO `esc_vendors` VALUES ('344', '梅赛德斯-AMG');
INSERT INTO `esc_vendors` VALUES ('407', '梅赛德斯-迈巴赫');
INSERT INTO `esc_vendors` VALUES ('145', '布加迪');
INSERT INTO `esc_vendors` VALUES ('93', '上汽通用别克');
INSERT INTO `esc_vendors` VALUES ('182', '别克(进口)');
INSERT INTO `esc_vendors` VALUES ('120', '宾利');
INSERT INTO `esc_vendors` VALUES ('81', '保时捷');
INSERT INTO `esc_vendors` VALUES ('175', '道奇(进口)');
INSERT INTO `esc_vendors` VALUES ('78', '法拉利');
INSERT INTO `esc_vendors` VALUES ('42', '悍马');
INSERT INTO `esc_vendors` VALUES ('85', '捷豹');
INSERT INTO `esc_vendors` VALUES ('187', 'smart');
INSERT INTO `esc_vendors` VALUES ('12', '北京吉普');
INSERT INTO `esc_vendors` VALUES ('319', '广汽菲克Jeep');
INSERT INTO `esc_vendors` VALUES ('71', 'Jeep(进口)');
INSERT INTO `esc_vendors` VALUES ('363', 'SRT');
INSERT INTO `esc_vendors` VALUES ('122', '上汽通用凯迪拉克');
INSERT INTO `esc_vendors` VALUES ('44', '凯迪拉克(进口)');
INSERT INTO `esc_vendors` VALUES ('83', '兰博基尼');
INSERT INTO `esc_vendors` VALUES ('376', '奇瑞捷豹路虎');
INSERT INTO `esc_vendors` VALUES ('49', '路虎(进口)');
INSERT INTO `esc_vendors` VALUES ('110', '路特斯');
INSERT INTO `esc_vendors` VALUES ('56', '林肯');
INSERT INTO `esc_vendors` VALUES ('65', '雷克萨斯');
INSERT INTO `esc_vendors` VALUES ('414', '雷克萨斯F');
INSERT INTO `esc_vendors` VALUES ('31', '昌河铃木');
INSERT INTO `esc_vendors` VALUES ('35', '长安铃木');
INSERT INTO `esc_vendors` VALUES ('161', '铃木(进口)');
INSERT INTO `esc_vendors` VALUES ('107', '劳斯莱斯');
INSERT INTO `esc_vendors` VALUES ('144', '迈巴赫');
INSERT INTO `esc_vendors` VALUES ('143', 'MINI');
INSERT INTO `esc_vendors` VALUES ('369', 'MINI JCW');
INSERT INTO `esc_vendors` VALUES ('3', '玛莎拉蒂');
INSERT INTO `esc_vendors` VALUES ('176', '长安马自达');
INSERT INTO `esc_vendors` VALUES ('11', '一汽马自达');
INSERT INTO `esc_vendors` VALUES ('119', '马自达(进口)');
INSERT INTO `esc_vendors` VALUES ('87', '欧宝');
INSERT INTO `esc_vendors` VALUES ('157', '讴歌(进口)');
INSERT INTO `esc_vendors` VALUES ('140', '帕加尼');
INSERT INTO `esc_vendors` VALUES ('57', '东风悦达起亚');
INSERT INTO `esc_vendors` VALUES ('111', '起亚(进口)');
INSERT INTO `esc_vendors` VALUES ('92', '东风日产');
INSERT INTO `esc_vendors` VALUES ('73', '日产(进口)');
INSERT INTO `esc_vendors` VALUES ('97', '萨博');
INSERT INTO `esc_vendors` VALUES ('116', '斯巴鲁');
INSERT INTO `esc_vendors` VALUES ('184', '世爵');
INSERT INTO `esc_vendors` VALUES ('162', '上汽大众斯柯达');
INSERT INTO `esc_vendors` VALUES ('138', '斯柯达(进口)');
INSERT INTO `esc_vendors` VALUES ('355', '广汽三菱');
INSERT INTO `esc_vendors` VALUES ('128', '三菱(进口)');
INSERT INTO `esc_vendors` VALUES ('76', '双龙汽车');
INSERT INTO `esc_vendors` VALUES ('181', '长安沃尔沃');
INSERT INTO `esc_vendors` VALUES ('367', '沃尔沃亚太');
INSERT INTO `esc_vendors` VALUES ('84', '沃尔沃(进口)');
INSERT INTO `esc_vendors` VALUES ('139', '上汽通用雪佛兰');
INSERT INTO `esc_vendors` VALUES ('142', '雪佛兰(进口)');
INSERT INTO `esc_vendors` VALUES ('37', '东风雪铁龙');
INSERT INTO `esc_vendors` VALUES ('82', '雪铁龙(进口)');
INSERT INTO `esc_vendors` VALUES ('392', '东风英菲尼迪');
INSERT INTO `esc_vendors` VALUES ('72', '英菲尼迪(进口)');
INSERT INTO `esc_vendors` VALUES ('433', '广汽中兴');
INSERT INTO `esc_vendors` VALUES ('189', '中兴汽车');
INSERT INTO `esc_vendors` VALUES ('146', '比亚迪');
INSERT INTO `esc_vendors` VALUES ('160', '长安汽车');
INSERT INTO `esc_vendors` VALUES ('4', '长城汽车');
INSERT INTO `esc_vendors` VALUES ('141', '猎豹汽车');
INSERT INTO `esc_vendors` VALUES ('177', '昌河汽车');
INSERT INTO `esc_vendors` VALUES ('154', '重庆力帆');
INSERT INTO `esc_vendors` VALUES ('186', '广汽乘用车');
INSERT INTO `esc_vendors` VALUES ('169', '华晨金杯');
INSERT INTO `esc_vendors` VALUES ('409', '华晨鑫源');
INSERT INTO `esc_vendors` VALUES ('417', '绵阳金杯');
INSERT INTO `esc_vendors` VALUES ('170', '江淮汽车');
INSERT INTO `esc_vendors` VALUES ('90', '华普汽车');
INSERT INTO `esc_vendors` VALUES ('26', '海马汽车');
INSERT INTO `esc_vendors` VALUES ('341', '海马郑州');
INSERT INTO `esc_vendors` VALUES ('117', '华泰汽车');
INSERT INTO `esc_vendors` VALUES ('158', '陆风汽车');
INSERT INTO `esc_vendors` VALUES ('179', '莲花汽车');
INSERT INTO `esc_vendors` VALUES ('7', '双环汽车');
INSERT INTO `esc_vendors` VALUES ('190', '一汽红旗');
INSERT INTO `esc_vendors` VALUES ('166', '一汽吉林');
INSERT INTO `esc_vendors` VALUES ('150', '永源汽车');
INSERT INTO `esc_vendors` VALUES ('171', '众泰汽车');
INSERT INTO `esc_vendors` VALUES ('10', '一汽奔腾');
INSERT INTO `esc_vendors` VALUES ('188', '福田汽车');
INSERT INTO `esc_vendors` VALUES ('191', '曙光汽车');
INSERT INTO `esc_vendors` VALUES ('194', '西雅特');
INSERT INTO `esc_vendors` VALUES ('195', '威兹曼');
INSERT INTO `esc_vendors` VALUES ('196', '科尼赛克');
INSERT INTO `esc_vendors` VALUES ('208', '开瑞汽车');
INSERT INTO `esc_vendors` VALUES ('203', '广汽吉奥');
INSERT INTO `esc_vendors` VALUES ('204', 'KTM');
INSERT INTO `esc_vendors` VALUES ('39', '天津一汽');
INSERT INTO `esc_vendors` VALUES ('338', '一汽通用');
INSERT INTO `esc_vendors` VALUES ('206', '野马汽车');
INSERT INTO `esc_vendors` VALUES ('207', 'GMC');
INSERT INTO `esc_vendors` VALUES ('210', '东风乘用车');
INSERT INTO `esc_vendors` VALUES ('59', '上汽通用五菱');
INSERT INTO `esc_vendors` VALUES ('304', '光冈自动车');
INSERT INTO `esc_vendors` VALUES ('305', 'AC Schnitzer');
INSERT INTO `esc_vendors` VALUES ('306', '劳伦士');
INSERT INTO `esc_vendors` VALUES ('307', '江铃汽车');
INSERT INTO `esc_vendors` VALUES ('314', '迈凯伦');
INSERT INTO `esc_vendors` VALUES ('315', '东风裕隆');
INSERT INTO `esc_vendors` VALUES ('318', '特斯拉');
INSERT INTO `esc_vendors` VALUES ('326', '巴博斯');
INSERT INTO `esc_vendors` VALUES ('328', '福迪汽车');
INSERT INTO `esc_vendors` VALUES ('327', '东风小康');
INSERT INTO `esc_vendors` VALUES ('185', '北京汽车制造厂');
INSERT INTO `esc_vendors` VALUES ('329', '南京依维柯');
INSERT INTO `esc_vendors` VALUES ('330', '厦门金龙');
INSERT INTO `esc_vendors` VALUES ('332', '一汽欧朗');
INSERT INTO `esc_vendors` VALUES ('333', '陕汽通家');
INSERT INTO `esc_vendors` VALUES ('334', '苏州金龙');
INSERT INTO `esc_vendors` VALUES ('335', '九龙汽车');
INSERT INTO `esc_vendors` VALUES ('336', '观致汽车');
INSERT INTO `esc_vendors` VALUES ('356', '上汽大通');
INSERT INTO `esc_vendors` VALUES ('339', '卡尔森');
INSERT INTO `esc_vendors` VALUES ('347', '比亚迪戴姆勒');
INSERT INTO `esc_vendors` VALUES ('373', '长安跨越');
INSERT INTO `esc_vendors` VALUES ('397', '长安轻型车');
INSERT INTO `esc_vendors` VALUES ('349', '恒天汽车');
INSERT INTO `esc_vendors` VALUES ('164', '东风风行');
INSERT INTO `esc_vendors` VALUES ('394', '江西五十铃');
INSERT INTO `esc_vendors` VALUES ('350', '庆铃汽车');
INSERT INTO `esc_vendors` VALUES ('351', '摩根');
INSERT INTO `esc_vendors` VALUES ('357', '长安标致雪铁龙');
INSERT INTO `esc_vendors` VALUES ('358', '如虎');
INSERT INTO `esc_vendors` VALUES ('359', '厦门金旅');
INSERT INTO `esc_vendors` VALUES ('364', '新凯汽车');
INSERT INTO `esc_vendors` VALUES ('372', '潍柴汽车');
INSERT INTO `esc_vendors` VALUES ('377', '成功汽车');
INSERT INTO `esc_vendors` VALUES ('378', '福汽新龙马');
INSERT INTO `esc_vendors` VALUES ('380', '卡威汽车');
INSERT INTO `esc_vendors` VALUES ('382', '泰卡特');
INSERT INTO `esc_vendors` VALUES ('383', '北汽银翔');
INSERT INTO `esc_vendors` VALUES ('385', '陆地方舟');
INSERT INTO `esc_vendors` VALUES ('387', '威蒙积泰');
INSERT INTO `esc_vendors` VALUES ('388', '知豆电动车');
INSERT INTO `esc_vendors` VALUES ('390', '北汽新能源');
INSERT INTO `esc_vendors` VALUES ('386', '江铃集团轻汽');
INSERT INTO `esc_vendors` VALUES ('384', '南京金龙');
INSERT INTO `esc_vendors` VALUES ('398', '凯翼汽车');
INSERT INTO `esc_vendors` VALUES ('393', '雷丁');
INSERT INTO `esc_vendors` VALUES ('399', '康迪电动汽车');
INSERT INTO `esc_vendors` VALUES ('400', '华晨华颂');
INSERT INTO `esc_vendors` VALUES ('401', '安凯客车');
INSERT INTO `esc_vendors` VALUES ('406', '浙江卡尔森');
INSERT INTO `esc_vendors` VALUES ('415', '宝沃汽车');
INSERT INTO `esc_vendors` VALUES ('422', '天津汽车');
INSERT INTO `esc_vendors` VALUES ('423', '斯达泰克');
INSERT INTO `esc_vendors` VALUES ('426', 'LOCAL MOTORS');
INSERT INTO `esc_vendors` VALUES ('431', '明君汽车');
INSERT INTO `esc_vendors` VALUES ('445', '华泰新能源');
INSERT INTO `esc_vendors` VALUES ('462', '其它');
