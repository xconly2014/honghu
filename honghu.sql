/*
Navicat MySQL Data Transfer

Source Server         : loaalhost
Source Server Version : 50520
Source Host           : 127.0.0.1:3306
Source Database       : honghu

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-03-01 09:24:46
*/
use `honghu`;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account_trade
-- ----------------------------
DROP TABLE IF EXISTS `account_trade`;
CREATE TABLE `account_trade` (
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `security_money` int(11) DEFAULT NULL,
  `game_account_id` int(11) DEFAULT NULL,
  `details` varchar(1024) DEFAULT NULL,
  `image_path` varchar(512) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `limit_hours` int(11) DEFAULT NULL,
  `buyer_user_id` int(11) DEFAULT NULL,
  `seller_user_id` int(11) DEFAULT NULL,
  `platform` tinyint(1) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_trade
-- ----------------------------
INSERT INTO `account_trade` VALUES ('2015-09-10 15:04:57', null, '1', '113', '斯蒂芬', '2000', '400', '1', 'sdfsdfasdf', '/upload/account_trade/20150910/1/', '1', '720', null, '23', '1', '1');

-- ----------------------------
-- Table structure for account_trade_game_account
-- ----------------------------
DROP TABLE IF EXISTS `account_trade_game_account`;
CREATE TABLE `account_trade_game_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `account` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `platform` tinyint(1) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `qufu` varchar(128) DEFAULT NULL,
  `level` varchar(256) DEFAULT NULL,
  `role` varchar(256) DEFAULT NULL,
  `contact_way` varchar(64) DEFAULT NULL,
  `occupation` varchar(256) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_trade_game_account
-- ----------------------------
INSERT INTO `account_trade_game_account` VALUES ('1', '113', 'sdf ', 'sdfsdf', '1', '0', '容易', '突然', '日太阳天', '18514253610', '个人头费', 'sadfasdf ');

-- ----------------------------
-- Table structure for account_trade_order
-- ----------------------------
DROP TABLE IF EXISTS `account_trade_order`;
CREATE TABLE `account_trade_order` (
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `account_trade_id` int(11) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `callback_url` varchar(512) DEFAULT NULL,
  `id_no` varchar(16) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `pay_way` varchar(256) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  `parent_order_id` int(11) DEFAULT NULL,
  `real_payment` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_trade_order
-- ----------------------------
INSERT INTO `account_trade_order` VALUES ('2015-09-10 15:04:57', '2015-09-10 15:05:18', '1', '113', '1', '1', 'Home/AccountTrade/publish_finish/orderId/1', '761441868718', '1', '2015-09-10 15:05:18', 'alipay', null, null, '400');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', '72');
INSERT INTO `admin_user` VALUES ('2', '74');
INSERT INTO `admin_user` VALUES ('5', '74');

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('a005dbda138');

-- ----------------------------
-- Table structure for android_operator
-- ----------------------------
DROP TABLE IF EXISTS `android_operator`;
CREATE TABLE `android_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of android_operator
-- ----------------------------
INSERT INTO `android_operator` VALUES ('1', '360客户端');
INSERT INTO `android_operator` VALUES ('2', '九游');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `rules` varchar(1024) DEFAULT NULL,
  `is_free_pay` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '一级管理员', '1', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137', '1');
INSERT INTO `auth_group` VALUES ('3', '二级管理员', '1', '1,4,22,23,24,25,42,43,44,5,26,27,6,28,29,30,7,31,32,33,8,34,11,47,13,48,49,55,56,57,9,12,60,50,63,51,64,58,59,61,62,65,66,67,68,69,70,15,38,39,16,52,53,19,40,54', null);
INSERT INTO `auth_group` VALUES ('4', '业务部', null, '1,4,22,23,24,25,42,43,44,5,26,27,8,34,11,47,13,48,49,55,56,57,9,12,60,50,63,51,64,58,59,61,62,65,66,67,68,9', null);
INSERT INTO `auth_group` VALUES ('5', '编辑部', null, '6,28,29,30,7,31,32,33,15,38,39,16,52,53,19,40,54,9', null);
INSERT INTO `auth_group` VALUES ('8', '18514253610', '1', '', null);

-- ----------------------------
-- Table structure for auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT NULL,
  `group_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES ('1', '1', '1');
INSERT INTO `auth_group_access` VALUES ('11', '2', '1');
INSERT INTO `auth_group_access` VALUES ('19', '5', '8');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `condition` varchar(100) DEFAULT NULL,
  `m_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('1', 'Admin/Index/index', '后台首页', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('2', 'Admin/User/user_list', '用户列表', '1', '1', '', '6');
INSERT INTO `auth_rule` VALUES ('3', 'Admin/User/group_list', '组权限管理', '1', '1', null, '7');
INSERT INTO `auth_rule` VALUES ('4', 'Admin/Game/game_list', '游戏列表', '1', '1', null, '8');
INSERT INTO `auth_rule` VALUES ('6', 'Admin/Game/strategy', '攻略', '1', '1', null, '10');
INSERT INTO `auth_rule` VALUES ('7', 'Admin/Game/evaluation', '评测', '1', '1', null, '11');
INSERT INTO `auth_rule` VALUES ('8', 'Admin/IOSCZPackage/index', '充值套餐', '1', '1', null, '12');
INSERT INTO `auth_rule` VALUES ('9', 'Admin/CZOrderIOS/order_list', 'ios充值', '1', '1', null, '13');
INSERT INTO `auth_rule` VALUES ('11', 'Admin/Package/package_list', '代练套餐', '1', '1', null, '15');
INSERT INTO `auth_rule` VALUES ('12', 'Admin/IOSScOrder/order_list', '首充号', '1', '1', null, '16');
INSERT INTO `auth_rule` VALUES ('13', 'Admin/Requirement/get_list', '代练需求', '1', '1', null, '17');
INSERT INTO `auth_rule` VALUES ('14', 'Admin/SysConfig/index', '系统配置', '1', '1', null, '18');
INSERT INTO `auth_rule` VALUES ('15', 'Admin/News/news_list', '最新公告', '1', '1', null, '19');
INSERT INTO `auth_rule` VALUES ('16', 'Admin/FriendLink/friend_link_list', '友情链接', '1', '1', null, '20');
INSERT INTO `auth_rule` VALUES ('5', 'Admin/IOSSc/index', '首充号', '1', '1', null, '9');
INSERT INTO `auth_rule` VALUES ('40', 'Admin/Goods/on_sale', '添加商品', '1', '1', null, '21');
INSERT INTO `auth_rule` VALUES ('19', 'Admin/Goods/goods_list', '商品列表', '1', '1', null, '21');
INSERT INTO `auth_rule` VALUES ('20', 'Admin/User/add_group', '添加权限组', '1', '1', null, '7');
INSERT INTO `auth_rule` VALUES ('21', 'Admin/User/update_group_access', '编辑权限组', '1', '1', null, '7');
INSERT INTO `auth_rule` VALUES ('22', 'Admin/Game/on_sale', '添加新游戏', '1', '1', null, '8');
INSERT INTO `auth_rule` VALUES ('23', 'Admin/Game/shelves', '上下架游戏', '1', '1', null, '8');
INSERT INTO `auth_rule` VALUES ('24', 'Admin/Game/list_option', '查看面额', '1', '1', null, '8');
INSERT INTO `auth_rule` VALUES ('25', 'Admin/Game/game_del', '删除游戏', '1', '1', null, '8');
INSERT INTO `auth_rule` VALUES ('26', 'Admin/IOSSc/sc_insert', '添加首冲号', '1', '1', null, '9');
INSERT INTO `auth_rule` VALUES ('27', 'Admin/IOSSc/sc_del', '删除首充号', '1', '1', null, '9');
INSERT INTO `auth_rule` VALUES ('28', 'Admin/Game/write_strategy', '添加攻略', '1', '1', null, '10');
INSERT INTO `auth_rule` VALUES ('29', 'Admin/Game/edit_strategy', '编辑攻略', '1', '1', null, '10');
INSERT INTO `auth_rule` VALUES ('30', 'Admin/Game/del_strategy', '删除攻略', '1', '1', null, '10');
INSERT INTO `auth_rule` VALUES ('31', 'Admin/Game/write_evaluation', '添加评测', '1', '1', null, '11');
INSERT INTO `auth_rule` VALUES ('32', 'Admin/Game/edit_evaluation', '编辑评测', '1', '1', null, '11');
INSERT INTO `auth_rule` VALUES ('33', 'Admin/Game/del_evaluation', '删除评测', '1', '1', null, '11');
INSERT INTO `auth_rule` VALUES ('34', 'Admin/IOSCZPackage/on_sale', '添加充值套餐', '1', '1', null, '12');
INSERT INTO `auth_rule` VALUES ('35', 'Admin/SysConfig/add', '添加系统配置', '1', '1', null, '18');
INSERT INTO `auth_rule` VALUES ('36', 'Admin/SysConfig/edit', '编辑系统配置', '1', '1', null, '18');
INSERT INTO `auth_rule` VALUES ('37', 'Admin/SysConfig/del', '删除系统配置', '1', '1', null, '18');
INSERT INTO `auth_rule` VALUES ('38', 'Admin/News/write_news', '添加公告', '1', '1', null, '19');
INSERT INTO `auth_rule` VALUES ('39', 'Admin/News/del_news', '删除公告', '1', '1', null, '19');
INSERT INTO `auth_rule` VALUES ('41', 'Admin/User/admin_list', '查看添加员管理', '1', '1', null, '22');
INSERT INTO `auth_rule` VALUES ('42', 'Admin/Game/add_option', '添加面额', '1', '1', null, '8');
INSERT INTO `auth_rule` VALUES ('43', 'Admin/Game/ios_option_operate', '隐藏面额', '1', '1', null, '8');
INSERT INTO `auth_rule` VALUES ('44', 'Admin/Game/ios_option_del', '删除面额', '1', '1', null, '8');
INSERT INTO `auth_rule` VALUES ('45', 'Admin/User/edit_admin', '编辑管理员', '1', '1', null, '22');
INSERT INTO `auth_rule` VALUES ('46', 'Admin/User/admin_del', '删除管理员', '1', '1', null, '22');
INSERT INTO `auth_rule` VALUES ('47', 'Admin/Package/package_edit', '套餐审核', '1', '1', null, '15');
INSERT INTO `auth_rule` VALUES ('48', 'Admin/AndroidSc/index', '安卓首充号', '1', '1', null, '25');
INSERT INTO `auth_rule` VALUES ('49', 'Admin/AndroidSc/sc_insert', '添加安卓首充号', '1', '1', null, '25');
INSERT INTO `auth_rule` VALUES ('50', 'Admin/PackageOrder/order_list', '代练套餐', '1', '1', null, '26');
INSERT INTO `auth_rule` VALUES ('51', 'Admin/RequirementOrder/order_list', '代练需求', '1', '1', null, '27');
INSERT INTO `auth_rule` VALUES ('52', 'Admin/FriendLink/write_friend_link', '友链添加', '1', '1', null, '20');
INSERT INTO `auth_rule` VALUES ('53', 'Admin/FriendLink/del_friend_link', '友链删除', '1', '1', null, '20');
INSERT INTO `auth_rule` VALUES ('54', 'Admin/Goods/del_goods', '商品删除', '1', '1', null, '21');
INSERT INTO `auth_rule` VALUES ('55', 'Admin/GroupBuyCz/index', '一元购', '1', '1', null, '28');
INSERT INTO `auth_rule` VALUES ('56', 'Admin/GroupBuyCz/gb_insert', '一元购商品上架', '1', '1', null, '28');
INSERT INTO `auth_rule` VALUES ('57', 'Admin/GroupBuyCz/gb_del', '一元购商品删除', '1', '1', null, '28');
INSERT INTO `auth_rule` VALUES ('58', 'Admin/AccountTradeOrder/order_list', '账号交易', '1', '1', null, '29');
INSERT INTO `auth_rule` VALUES ('59', 'Admin/AccountTradeOrder/details', '账号交易订单查看', '1', '1', null, '29');
INSERT INTO `auth_rule` VALUES ('60', 'Admin/IOSScOrder/details', 'IOS首充号查看', '1', '1', null, '16');
INSERT INTO `auth_rule` VALUES ('61', 'Admin/AndroidScOrder/order_list', '安卓首充号订单列表', '1', '1', null, '30');
INSERT INTO `auth_rule` VALUES ('63', 'Admin/PackageOrder/details', '代练套餐订单详情', '1', '1', null, '26');
INSERT INTO `auth_rule` VALUES ('62', 'Admin/AndroidScOrder/details', '安卓首充号订单详情', '1', '1', null, '30');
INSERT INTO `auth_rule` VALUES ('64', 'Admin/RequirementOrder/details', '代练需求订单详情', '1', '1', null, '27');
INSERT INTO `auth_rule` VALUES ('65', 'Admin/IOSCZPackageOrder/order_list', '充值套餐订单列表', '1', '1', null, '31');
INSERT INTO `auth_rule` VALUES ('66', 'Admin/IOSCZPackageOrder/details', '充值套餐订单详情', '1', '1', null, '31');
INSERT INTO `auth_rule` VALUES ('67', 'Admin/GroupBuyCzOrder/order_list', '一元购订单列表', '1', '1', null, '32');
INSERT INTO `auth_rule` VALUES ('69', 'Admin/GoodsOrder/order_list', '积分兑换订单列表', '1', '1', null, '33');
INSERT INTO `auth_rule` VALUES ('68', 'Admin/GroupBuyCzOrder/details', '一元购订单详情', '1', '1', null, '32');
INSERT INTO `auth_rule` VALUES ('70', 'Admin/GoodsOrder/details', '积分兑换订单详情', '1', '1', null, '33');
INSERT INTO `auth_rule` VALUES ('71', 'Admin/Help/category', '帮助中心目录列表', '1', '1', null, '34');
INSERT INTO `auth_rule` VALUES ('72', 'Admin/Help/categoryInsert', '帮助中心目录添加', '1', '1', null, '34');
INSERT INTO `auth_rule` VALUES ('73', 'Admin/Help/categoryDel', '帮助中心目录删除', '1', '1', null, '34');
INSERT INTO `auth_rule` VALUES ('74', 'Admin/Help/categoryEdit', '帮助中心目录编辑', '1', '1', null, '34');
INSERT INTO `auth_rule` VALUES ('75', 'Admin/Help/article', '帮助中心目录下文章列表', '1', '1', null, '34');
INSERT INTO `auth_rule` VALUES ('76', 'Admin/Help/articleInsert', '帮助中心目录下文章添加', '1', '1', null, '34');
INSERT INTO `auth_rule` VALUES ('77', 'Admin/Help/articleDel', '帮助中心目录下文章删除', '1', '1', null, '34');
INSERT INTO `auth_rule` VALUES ('78', 'Admin/Help/articleEdit', '帮助中心目录下文章编辑', '1', '1', null, '34');
INSERT INTO `auth_rule` VALUES ('79', 'Admin/News/edit_news', '公告编辑', '1', '1', null, '19');
INSERT INTO `auth_rule` VALUES ('80', 'Admin/Suggest/suggest_list', '建议列表', '1', '1', null, '35');
INSERT INTO `auth_rule` VALUES ('81', 'Admin/Suggest/del_suggest', '建议删除', '1', '1', null, '35');
INSERT INTO `auth_rule` VALUES ('82', 'Admin/Goods/edit_goods', '积分商品编辑', '1', '1', null, '28');
INSERT INTO `auth_rule` VALUES ('83', 'Admin/Banner/banner_list', 'banner图片列表', '1', '1', null, '36');
INSERT INTO `auth_rule` VALUES ('84', 'Admin/Banner/write_banner', '编辑banner条目', '1', '1', null, '36');
INSERT INTO `auth_rule` VALUES ('85', 'Admin/Banner/del_banner', '删除banner条目', '1', '1', null, '36');
INSERT INTO `auth_rule` VALUES ('86', 'Admin/CZOrderIOS/order_view', '充值订单查看', '1', '1', null, '13');
INSERT INTO `auth_rule` VALUES ('87', 'Admin/AndroidSc/sc_del', '安卓首充号删除', '1', '1', null, '25');
INSERT INTO `auth_rule` VALUES ('88', 'Admin/CoinsOrder/order_list', '虎币订单', '1', '1', null, '37');
INSERT INTO `auth_rule` VALUES ('89', 'Admin/Game/game_edit', '游戏编辑', '1', '1', null, '8');
INSERT INTO `auth_rule` VALUES ('90', 'Admin/IOSCZPackage/del', 'IOS团购条目删除', '1', '1', null, '12');
INSERT INTO `auth_rule` VALUES ('91', 'Admin/CoinsOrder/record_list', '虎币订单列表', '1', '1', null, '37');
INSERT INTO `auth_rule` VALUES ('92', 'Admin/CZOrderIOS/ajax_edit_state', '订单状态编辑', '1', '1', null, '13');
INSERT INTO `auth_rule` VALUES ('93', 'Admin/CreditRecords/record_list', '积分列表', '1', '1', null, '38');
INSERT INTO `auth_rule` VALUES ('94', 'Admin/CreditRecords/user_record_list', '用户积分详情', '1', '1', null, '38');
INSERT INTO `auth_rule` VALUES ('95', 'Admin/Identify/identify_list', '代练师验证列表', '1', '1', null, '39');
INSERT INTO `auth_rule` VALUES ('96', 'Admin/Identify/identify_edit', '代练师验证编辑', '1', '1', null, '39');
INSERT INTO `auth_rule` VALUES ('97', 'Admin/AndroidSc/ajax_edit_state', '安卓首充号订单状态编辑', '1', '1', null, '30');
INSERT INTO `auth_rule` VALUES ('98', 'Admin/GoodsOrder/ajax_edit_state', '积分兑换订单状态编辑', '1', '1', null, '33');
INSERT INTO `auth_rule` VALUES ('99', 'Admin/IOSCZPackageOrder/ajax_edit_state', 'IOS充值团购订单状态编辑', '1', '1', null, '31');
INSERT INTO `auth_rule` VALUES ('100', 'Admin/IOSScOrder/ajax_edit_state', 'IOS首充号订单编辑', '1', '1', null, '16');
INSERT INTO `auth_rule` VALUES ('101', 'Admin/Package/ajax_edit_state', '代练套餐订单状态编辑', '1', '1', null, '26');
INSERT INTO `auth_rule` VALUES ('102', 'Admin/Requirement/ajax_edit_state', '代练需求订单状态编辑', '1', '1', null, '27');
INSERT INTO `auth_rule` VALUES ('103', 'Admin/Package/details', '代练套餐详情查看', '1', '1', null, '15');
INSERT INTO `auth_rule` VALUES ('104', 'Admin/Requirement/details', '代练需求详情查看', '1', '1', null, '17');
INSERT INTO `auth_rule` VALUES ('105', 'Admin/CoinsOrder/record_details', '虎币充值订单详情', '1', '1', null, '37');
INSERT INTO `auth_rule` VALUES ('106', 'Admin/IOSSc/sc_edit', '苹果首充号编辑', '1', '1', null, '9');
INSERT INTO `auth_rule` VALUES ('107', 'Admin/AndroidSc/sc_edit', '安卓首充号编辑', '1', '1', null, '25');
INSERT INTO `auth_rule` VALUES ('108', 'Admin/SearchWord/word_list', '关键字搜索', '1', '1', null, '40');
INSERT INTO `auth_rule` VALUES ('109', 'Admin/Game/suggest_list', '推荐游戏列表', '1', '1', null, '41');
INSERT INTO `auth_rule` VALUES ('110', 'Admin/Game/suggest_del', '推荐游戏删除', '1', '1', null, '41');
INSERT INTO `auth_rule` VALUES ('111', 'Admin/Game/suggest_add', '推荐游戏添加', '1', '1', null, '41');
INSERT INTO `auth_rule` VALUES ('112', 'Admin/SysConfig/index', 'SEO中心首页', '1', '1', null, '42');
INSERT INTO `auth_rule` VALUES ('113', 'Admin/SysConfig/add', 'SEO添加', '1', '1', null, '42');
INSERT INTO `auth_rule` VALUES ('114', 'Admin/SysConfig/edit', 'SEO编辑', '1', '1', null, '42');
INSERT INTO `auth_rule` VALUES ('115', 'Admin/SysConfig/del', 'SEO删除', '1', '1', null, '42');
INSERT INTO `auth_rule` VALUES ('116', 'Admin/Game/upload_game_pic', '游戏图片上传', '1', '1', null, '8');
INSERT INTO `auth_rule` VALUES ('117', 'Admin/GroupBuyCz/fake_list', '一元购中奖者列表', '1', '1', null, '28');
INSERT INTO `auth_rule` VALUES ('118', 'Admin/GroupBuyCz/add_fake', '添加中奖者', '1', '1', null, '28');
INSERT INTO `auth_rule` VALUES ('119', 'Admin/GroupBuyCz/del_fake', '删除中奖者', '1', '1', null, '28');
INSERT INTO `auth_rule` VALUES ('120', 'Admin/IOSSc/sch_record_list', '首充号账号列表', '1', '1', null, '9');
INSERT INTO `auth_rule` VALUES ('121', 'Admin/IOSSc/sch_record_add', '添加首充号账号信息', '1', '1', null, '9');
INSERT INTO `auth_rule` VALUES ('122', 'Admin/IOSSc/sch_record_del', '删除首充号账号', '1', '1', null, '9');
INSERT INTO `auth_rule` VALUES ('123', 'Admin/Banner/banner_edit', '编辑banner轮播图', '1', '1', null, '36');
INSERT INTO `auth_rule` VALUES ('124', 'Admin/ThirdParty/order_list', '第三方订单列表', '1', '1', null, '13');
INSERT INTO `auth_rule` VALUES ('125', 'Admin/FamilyLogo/logo_list', '堂会logo列表', '1', '1', null, '44');
INSERT INTO `auth_rule` VALUES ('126', 'Admin/FamilyLogo/del_logo', '删除堂会logo', '1', '1', null, '44');
INSERT INTO `auth_rule` VALUES ('127', 'Admin/FamilyLogo/logo_add', '添加堂会logo', '1', '1', null, '44');
INSERT INTO `auth_rule` VALUES ('128', 'Admin/OrderTag/tag_list', '订单标签列表及添加', '1', '1', null, '13');
INSERT INTO `auth_rule` VALUES ('129', 'Admin/OrderTag/del_tag', '删除订单标签', '1', '1', null, '13');
INSERT INTO `auth_rule` VALUES ('130', 'Admin/CZOrderIOS/add_tag_link', '添加订单的标签', '1', '1', null, '13');
INSERT INTO `auth_rule` VALUES ('131', 'Admin/CZOrderIOS/del_tag_link', '删除对应订单的标签', '1', '1', null, '13');
INSERT INTO `auth_rule` VALUES ('132', 'Admin/Family/family_list', '堂会列表', '1', '1', null, '45');
INSERT INTO `auth_rule` VALUES ('133', 'Admin/Family/contribute_list', '成员贡献值列表', '1', '1', null, '45');
INSERT INTO `auth_rule` VALUES ('134', 'Admin/Family/ajax_recommand', '更新堂会推荐', '1', '1', null, '45');
INSERT INTO `auth_rule` VALUES ('135', 'Admin/CZOrderIOS/card_list', 'ID卡列表及添加', '1', '1', null, '13');
INSERT INTO `auth_rule` VALUES ('136', 'Admin/CZOrderIOS/del_card', 'ID卡删除', '1', '1', null, '13');
INSERT INTO `auth_rule` VALUES ('137', 'Admin/CZOrderIOS/ajax_edit_details', '订单详情修改状态', '1', '1', null, '13');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(31) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('2', 'haican', '21232f297a57a5a743894a0e4a801fc3', '2');
INSERT INTO `auth_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1');
INSERT INTO `auth_user` VALUES ('3', 'hai', '21232f297a57a5a743894a0e4a801fc3', '3');
INSERT INTO `auth_user` VALUES ('4', 'linlin', '21232f297a57a5a743894a0e4a801fc3', '3');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(256) DEFAULT NULL,
  `img` varchar(64) DEFAULT NULL,
  `title` varchar(512) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('17', 'http://www.baidu.com', '5698629bc5408.jpg', 'Highcharts Demo', '1');
INSERT INTO `banner` VALUES ('16', 'http://www.honghonghu.com', '5698628943663.jpg', '代练', '0');
INSERT INTO `banner` VALUES ('18', '', '56a0ab3da2f67.jpg', '', '0');

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES ('3', '3333');
INSERT INTO `card` VALUES ('4', '6666');

-- ----------------------------
-- Table structure for coins_order
-- ----------------------------
DROP TABLE IF EXISTS `coins_order`;
CREATE TABLE `coins_order` (
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coins` float DEFAULT NULL COMMENT '虎币数量',
  `is_paid` tinyint(1) DEFAULT NULL COMMENT '是否付款',
  `id_no` varchar(16) DEFAULT NULL,
  `callback_url` varchar(512) DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `pay_way` varchar(256) DEFAULT NULL,
  `real_payment` int(11) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  `tel` varchar(12) DEFAULT NULL COMMENT '支付的手机号',
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coins_order
-- ----------------------------
INSERT INTO `coins_order` VALUES ('2015-08-12 15:56:35', null, '1', '10', null, null, null, null, null, '10', null, null, null);
INSERT INTO `coins_order` VALUES ('2015-08-12 15:56:40', null, '2', '10', null, null, null, null, null, '10', null, null, null);
INSERT INTO `coins_order` VALUES ('2015-08-12 16:18:53', '2015-08-12 16:19:09', '3', '10', '1', '461439367549', '/Home/CoinsCenter/coins_cz_finish/orderId/3', '2015-08-12 16:19:09', '', '10', null, null, null);
INSERT INTO `coins_order` VALUES ('2015-08-12 18:21:10', null, '4', '95', null, null, null, null, null, '0', null, null, null);
INSERT INTO `coins_order` VALUES ('2015-08-12 18:21:52', null, '5', '4', null, null, null, null, null, '0', null, null, null);
INSERT INTO `coins_order` VALUES ('2015-08-12 18:22:04', null, '6', '4', null, null, null, null, null, '0', null, null, null);
INSERT INTO `coins_order` VALUES ('2015-08-12 18:25:25', null, '7', '44', null, null, null, null, null, '111', null, null, null);
INSERT INTO `coins_order` VALUES ('2015-08-12 18:25:53', null, '8', '40', null, null, null, null, null, '100', null, null, null);
INSERT INTO `coins_order` VALUES ('2015-08-12 18:30:07', null, '9', '44.4', null, null, null, null, null, '111', null, null, null);
INSERT INTO `coins_order` VALUES ('2015-08-12 19:03:21', null, '10', '19', null, null, null, null, null, '20', null, '', null);
INSERT INTO `coins_order` VALUES ('2015-08-12 19:08:13', null, '11', '44.4', null, null, null, null, null, '111', null, '18514253610', null);
INSERT INTO `coins_order` VALUES ('2015-08-24 16:05:56', null, '12', '22', null, null, null, null, null, '22', null, '', null);
INSERT INTO `coins_order` VALUES ('2015-08-24 16:06:03', null, '13', '22', null, null, null, null, null, '22', null, '', null);
INSERT INTO `coins_order` VALUES ('2015-08-24 16:06:03', null, '14', '22', null, null, null, null, null, '22', null, '', null);
INSERT INTO `coins_order` VALUES ('2015-08-25 10:30:08', '2015-08-25 10:30:12', '15', '800', '1', '461440469812', '/Home/CoinsCenter/coins_cz_finish/orderId/15', '2015-08-25 10:30:12', 'alipay', '800', null, '', null);
INSERT INTO `coins_order` VALUES ('2015-08-25 10:31:32', '2015-08-25 10:31:36', '16', '1000', '1', '461440469896', '/Home/CoinsCenter/coins_cz_finish/orderId/16', '2015-08-25 10:31:36', 'shengpayICBC', '1000', null, '', null);
INSERT INTO `coins_order` VALUES ('2015-08-27 16:26:44', '2015-08-27 16:28:14', '17', '233', '1', '461440664094', '/Home/CoinsCenter/coins_cz_finish/orderId/17', '2015-08-27 16:28:14', '', '233', null, '', null);
INSERT INTO `coins_order` VALUES ('2015-08-31 09:58:22', null, '18', '1000', null, null, null, null, null, '1000', null, '', '74');
INSERT INTO `coins_order` VALUES ('2015-08-31 09:58:27', null, '19', '1000', null, null, null, null, null, '1000', null, '', '72');
INSERT INTO `coins_order` VALUES ('2015-08-31 10:03:07', '2015-08-31 10:03:07', '20', '0', '1', '461440986587', '/Home/CoinsCenter/coins_cz_finish/orderId/20', '2015-08-31 10:03:07', 'mp_banlance', '0', null, '', '72');
INSERT INTO `coins_order` VALUES ('2015-09-22 15:04:17', '2015-09-22 15:04:17', '21', '95', '1', '461442905457', '/Home/CoinsCenter/coins_cz_finish/orderId/21', '2015-09-22 15:04:17', 'mp_banlance', '100', null, '', '72');
INSERT INTO `coins_order` VALUES ('2015-09-22 18:24:21', '2015-09-22 18:24:21', '22', '28', '1', '461442917461', '/Home/CoinsCenter/coins_cz_finish/orderId/22', '2015-09-22 18:24:21', 'mp_banlance', '30', null, '', '72');
INSERT INTO `coins_order` VALUES ('2015-09-25 18:18:10', null, '23', '1000', null, null, null, null, null, '1000', null, '', '72');
INSERT INTO `coins_order` VALUES ('2015-09-25 18:18:25', null, '24', '28', null, '461443176306', '/Home/CoinsCenter/coins_cz_finish/orderId/24', null, 'mp_banlance', '30', null, '', '72');
INSERT INTO `coins_order` VALUES ('2015-09-25 18:57:20', null, '25', '95', null, '461443178640', '/Home/CoinsCenter/coins_cz_finish/orderId/25', null, 'mp_banlance', '100', null, '', '74');
INSERT INTO `coins_order` VALUES ('2015-11-26 11:42:04', null, '26', '28', null, '4626', 'CoinsCenter/coins_cz_finish', null, 'mp_banlance', '30', null, '', '72');
INSERT INTO `coins_order` VALUES ('2015-12-24 17:08:46', '2015-12-24 17:08:47', '27', '28', '1', '4627', 'CoinsCenter/coins_cz_finish', '2015-12-24 17:08:47', 'mp_banlance', '30', null, '', '72');

-- ----------------------------
-- Table structure for coins_record
-- ----------------------------
DROP TABLE IF EXISTS `coins_record`;
CREATE TABLE `coins_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_id` int(11) DEFAULT NULL COMMENT '订单id',
  `coins_number` int(11) DEFAULT NULL COMMENT '虎币数量',
  `type` smallint(6) DEFAULT NULL COMMENT '类型（话费卡/话费）',
  `user_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `operation` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coins_record
-- ----------------------------
INSERT INTO `coins_record` VALUES ('4', '3', '220', '1', '72', '2015-07-07 18:22:51', '+');
INSERT INTO `coins_record` VALUES ('5', '4', '220', '1', '72', '2015-07-07 18:22:56', '+');
INSERT INTO `coins_record` VALUES ('6', '21', '95', '0', '72', '2015-09-22 15:04:17', '+');
INSERT INTO `coins_record` VALUES ('7', '22', '28', '0', '72', '2015-09-22 18:24:21', '+');
INSERT INTO `coins_record` VALUES ('8', '88', '6', '2', '72', '2015-09-28 10:52:53', '-');
INSERT INTO `coins_record` VALUES ('9', '89', '6', '2', '72', '2015-09-28 11:16:15', '-');
INSERT INTO `coins_record` VALUES ('10', '7', '50', '2', '72', '2015-09-28 11:23:18', '-');
INSERT INTO `coins_record` VALUES ('11', '41', '176', '2', '72', '2015-09-28 11:23:33', '-');
INSERT INTO `coins_record` VALUES ('12', '90', '6', '2', '72', '2015-09-28 11:27:06', '-');
INSERT INTO `coins_record` VALUES ('13', '27', '28', '0', '72', '2015-12-24 17:08:47', '+');

-- ----------------------------
-- Table structure for collect_praise
-- ----------------------------
DROP TABLE IF EXISTS `collect_praise`;
CREATE TABLE `collect_praise` (
  `created_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `contact_way` varchar(64) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect_praise
-- ----------------------------

-- ----------------------------
-- Table structure for contribution_record
-- ----------------------------
DROP TABLE IF EXISTS `contribution_record`;
CREATE TABLE `contribution_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` int(11) DEFAULT NULL,
  `original_id` int(11) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `is_valid` tinyint(1) DEFAULT NULL COMMENT '有效标志',
  `created_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `operation` varchar(8) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contribution_record
-- ----------------------------

-- ----------------------------
-- Table structure for credit_records
-- ----------------------------
DROP TABLE IF EXISTS `credit_records`;
CREATE TABLE `credit_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `operation` varchar(8) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `original_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of credit_records
-- ----------------------------
INSERT INTO `credit_records` VALUES ('79', '17', '-', '222', '30', '2015-09-29 09:39:18', '72');
INSERT INTO `credit_records` VALUES ('80', '17', '-', '222', '30', '2015-09-29 09:39:30', '72');
INSERT INTO `credit_records` VALUES ('81', '1', '+', '360', '129', '2015-10-08 10:48:44', '72');
INSERT INTO `credit_records` VALUES ('82', '1', '+', '360', '130', '2015-10-08 10:53:18', '72');
INSERT INTO `credit_records` VALUES ('83', '1', '+', '360', '131', '2015-10-12 17:30:12', '72');
INSERT INTO `credit_records` VALUES ('84', '1', '+', '360', '132', '2015-10-13 09:20:34', '72');
INSERT INTO `credit_records` VALUES ('85', '4', '+', '10', '26', '2015-10-16 17:13:47', '72');
INSERT INTO `credit_records` VALUES ('86', '4', '+', '10', '27', '2015-10-19 10:39:28', '72');
INSERT INTO `credit_records` VALUES ('87', '1', '+', '0', '136', '2015-10-26 17:44:31', '72');
INSERT INTO `credit_records` VALUES ('88', '4', '+', '10', '28', '2015-10-30 16:30:59', '72');
INSERT INTO `credit_records` VALUES ('89', '4', '+', '10', '29', '2015-11-12 10:43:59', '72');
INSERT INTO `credit_records` VALUES ('90', '1', '+', '12', '138', '2015-11-17 14:48:02', '72');
INSERT INTO `credit_records` VALUES ('91', '1', '+', '1312', '139', '2015-11-17 15:05:50', '72');
INSERT INTO `credit_records` VALUES ('177', '4', '+', '50', '110', '2016-02-26 17:11:20', '72');
INSERT INTO `credit_records` VALUES ('93', '1', '+', '12', '144', '2015-11-30 15:23:11', '72');
INSERT INTO `credit_records` VALUES ('95', '1', '+', '12', '147', '2015-12-01 18:00:05', '72');
INSERT INTO `credit_records` VALUES ('96', '4', '+', '30', '30', '2015-12-16 10:09:48', '74');
INSERT INTO `credit_records` VALUES ('97', '4', '+', '30', '31', '2015-12-17 10:47:43', '72');
INSERT INTO `credit_records` VALUES ('98', '4', '+', '30', '32', '2015-12-17 16:28:13', '74');
INSERT INTO `credit_records` VALUES ('99', '4', '+', '30', '34', '2015-12-18 16:11:08', '72');
INSERT INTO `credit_records` VALUES ('100', '4', '+', '30', '35', '2015-12-18 16:20:18', '72');
INSERT INTO `credit_records` VALUES ('101', '4', '+', '30', '36', '2015-12-18 16:41:06', '72');
INSERT INTO `credit_records` VALUES ('102', '4', '+', '30', '37', '2015-12-18 16:43:29', '72');
INSERT INTO `credit_records` VALUES ('103', '4', '+', '30', '38', '2015-12-18 16:51:26', '72');
INSERT INTO `credit_records` VALUES ('104', '4', '+', '30', '39', '2015-12-18 17:00:54', '72');
INSERT INTO `credit_records` VALUES ('105', '4', '+', '30', '40', '2015-12-18 17:20:18', '72');
INSERT INTO `credit_records` VALUES ('106', '4', '+', '30', '41', '2015-12-18 18:16:08', '72');
INSERT INTO `credit_records` VALUES ('107', '4', '+', '30', '42', '2015-12-21 09:23:39', '72');
INSERT INTO `credit_records` VALUES ('108', '4', '+', '30', '43', '2015-12-21 09:37:03', '72');
INSERT INTO `credit_records` VALUES ('109', '4', '+', '30', '44', '2015-12-21 09:37:41', '72');
INSERT INTO `credit_records` VALUES ('110', '4', '+', '30', '45', '2015-12-21 09:50:51', '72');
INSERT INTO `credit_records` VALUES ('111', '4', '+', '30', '46', '2015-12-21 09:54:17', '72');
INSERT INTO `credit_records` VALUES ('112', '4', '+', '30', '47', '2015-12-21 09:54:53', '72');
INSERT INTO `credit_records` VALUES ('113', '4', '+', '30', '48', '2015-12-21 09:57:40', '72');
INSERT INTO `credit_records` VALUES ('114', '4', '+', '30', '49', '2015-12-21 09:57:57', '72');
INSERT INTO `credit_records` VALUES ('115', '4', '+', '30', '50', '2015-12-21 10:03:33', '74');
INSERT INTO `credit_records` VALUES ('116', '4', '+', '30', '51', '2015-12-21 10:04:31', '74');
INSERT INTO `credit_records` VALUES ('117', '4', '+', '50', '52', '2015-12-21 11:17:22', '74');
INSERT INTO `credit_records` VALUES ('118', '4', '+', '80', '53', '2015-12-21 11:18:41', '74');
INSERT INTO `credit_records` VALUES ('119', '4', '+', '70', '54', '2015-12-21 14:42:52', '74');
INSERT INTO `credit_records` VALUES ('120', '4', '+', '50', '55', '2015-12-21 14:43:42', '74');
INSERT INTO `credit_records` VALUES ('121', '4', '+', '50', '56', '2015-12-21 15:11:40', '74');
INSERT INTO `credit_records` VALUES ('122', '4', '+', '50', '57', '2015-12-21 15:14:31', '74');
INSERT INTO `credit_records` VALUES ('123', '4', '+', '50', '58', '2015-12-21 15:16:14', '74');
INSERT INTO `credit_records` VALUES ('124', '4', '+', '50', '59', '2015-12-21 15:26:27', '74');
INSERT INTO `credit_records` VALUES ('125', '4', '+', '50', '60', '2015-12-21 15:34:33', '74');
INSERT INTO `credit_records` VALUES ('126', '4', '+', '50', '65', '2015-12-21 18:19:30', '74');
INSERT INTO `credit_records` VALUES ('127', '4', '+', '50', '66', '2015-12-21 18:20:55', '74');
INSERT INTO `credit_records` VALUES ('128', '4', '+', '50', '67', '2015-12-21 18:23:14', '74');
INSERT INTO `credit_records` VALUES ('129', '4', '+', '50', '68', '2015-12-21 18:28:31', '74');
INSERT INTO `credit_records` VALUES ('130', '4', '+', '50', '69', '2015-12-21 18:32:34', '74');
INSERT INTO `credit_records` VALUES ('131', '4', '+', '80', '70', '2015-12-21 19:04:51', '74');
INSERT INTO `credit_records` VALUES ('132', '4', '+', '80', '71', '2015-12-22 09:23:49', '72');
INSERT INTO `credit_records` VALUES ('133', '4', '+', '80', '74', '2015-12-22 10:05:48', '74');
INSERT INTO `credit_records` VALUES ('134', '4', '+', '160', '75', '2015-12-22 10:08:26', '74');
INSERT INTO `credit_records` VALUES ('135', '4', '+', '80', '76', '2015-12-22 10:09:33', '74');
INSERT INTO `credit_records` VALUES ('136', '4', '+', '320', '77', '2015-12-22 10:11:32', '74');
INSERT INTO `credit_records` VALUES ('137', '4', '+', '320', '78', '2015-12-22 10:12:04', '74');
INSERT INTO `credit_records` VALUES ('138', '4', '+', '160', '79', '2015-12-22 10:12:58', '74');
INSERT INTO `credit_records` VALUES ('139', '4', '+', '80', '80', '2015-12-22 10:15:01', '74');
INSERT INTO `credit_records` VALUES ('140', '4', '+', '320', '81', '2015-12-22 10:16:09', '74');
INSERT INTO `credit_records` VALUES ('141', '4', '+', '80', '82', '2015-12-22 10:17:40', '74');
INSERT INTO `credit_records` VALUES ('142', '4', '+', '320', '83', '2015-12-22 10:18:41', '74');
INSERT INTO `credit_records` VALUES ('143', '4', '+', '320', '84', '2015-12-22 11:14:38', '74');
INSERT INTO `credit_records` VALUES ('144', '4', '+', '80', '85', '2015-12-22 11:15:18', '74');
INSERT INTO `credit_records` VALUES ('145', '4', '+', '80', '86', '2015-12-22 11:19:16', '74');
INSERT INTO `credit_records` VALUES ('146', '4', '+', '80', '87', '2015-12-22 11:27:59', '74');
INSERT INTO `credit_records` VALUES ('147', '4', '+', '320', '88', '2015-12-22 11:28:54', '74');
INSERT INTO `credit_records` VALUES ('148', '4', '+', '80', '89', '2015-12-22 11:29:23', '74');
INSERT INTO `credit_records` VALUES ('149', '4', '+', '80', '90', '2015-12-22 11:37:53', '74');
INSERT INTO `credit_records` VALUES ('150', '4', '+', '80', '91', '2015-12-22 16:02:10', '74');
INSERT INTO `credit_records` VALUES ('151', '4', '+', '80', '92', '2015-12-22 16:15:15', '74');
INSERT INTO `credit_records` VALUES ('152', '4', '+', '160', '93', '2015-12-22 17:11:42', '74');
INSERT INTO `credit_records` VALUES ('153', '4', '+', '320', '94', '2015-12-22 17:12:12', '74');
INSERT INTO `credit_records` VALUES ('154', '4', '+', '320', '95', '2015-12-22 17:16:15', '74');
INSERT INTO `credit_records` VALUES ('155', '4', '+', '80', '96', '2015-12-22 17:16:34', '74');
INSERT INTO `credit_records` VALUES ('156', '4', '+', '80', '97', '2015-12-22 17:19:13', '72');
INSERT INTO `credit_records` VALUES ('157', '4', '+', '80', '98', '2015-12-24 09:30:01', '72');
INSERT INTO `credit_records` VALUES ('158', '4', '+', '80', '99', '2015-12-29 17:58:25', '72');
INSERT INTO `credit_records` VALUES ('159', '4', '+', '60', '100', '2015-12-31 15:29:08', '72');
INSERT INTO `credit_records` VALUES ('160', '4', '+', '400', '101', '2016-01-04 10:18:40', '72');
INSERT INTO `credit_records` VALUES ('161', '4', '+', '400', '102', '2016-01-04 10:24:36', '72');
INSERT INTO `credit_records` VALUES ('162', '4', '+', '40', '103', '2016-01-04 10:37:27', '72');
INSERT INTO `credit_records` VALUES ('163', '4', '+', '200', '104', '2016-01-05 09:54:23', '72');
INSERT INTO `credit_records` VALUES ('164', '4', '+', '20', '105', '2016-01-07 11:20:05', '72');
INSERT INTO `credit_records` VALUES ('165', '4', '+', '10', '106', '2016-01-07 17:12:22', '76');
INSERT INTO `credit_records` VALUES ('166', '1', '+', '2624', '148', '2016-01-11 17:47:51', '72');
INSERT INTO `credit_records` VALUES ('167', '1', '+', '12', '149', '2016-01-12 09:46:59', '72');
INSERT INTO `credit_records` VALUES ('168', '1', '+', '12', '151', '2016-01-12 09:57:11', '72');
INSERT INTO `credit_records` VALUES ('169', '1', '+', '360', '153', '2016-01-21 15:20:58', '72');
INSERT INTO `credit_records` VALUES ('170', '1', '+', '1312', '154', '2016-01-22 11:11:46', '72');
INSERT INTO `credit_records` VALUES ('171', '4', '+', '20', '107', '2016-01-25 11:33:56', '72');
INSERT INTO `credit_records` VALUES ('172', '4', '+', '30', '108', '2016-01-26 09:51:24', '74');
INSERT INTO `credit_records` VALUES ('173', '17', '-', '222', '32', '2016-02-01 14:42:56', '72');
INSERT INTO `credit_records` VALUES ('174', '4', '+', '50', '109', '2016-02-01 14:49:05', '72');
INSERT INTO `credit_records` VALUES ('175', '17', '-', '222', '35', '2016-02-01 15:10:36', '72');
INSERT INTO `credit_records` VALUES ('176', '17', '-', '222', '36', '2016-02-01 15:15:50', '72');

-- ----------------------------
-- Table structure for cz_game_account_android
-- ----------------------------
DROP TABLE IF EXISTS `cz_game_account_android`;
CREATE TABLE `cz_game_account_android` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `qufu` varchar(128) DEFAULT NULL,
  `qufu_type` varchar(128) DEFAULT NULL,
  `role` varchar(256) DEFAULT NULL,
  `contact_way` varchar(64) DEFAULT NULL,
  `occupation` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cz_game_account_android
-- ----------------------------

-- ----------------------------
-- Table structure for cz_game_account_ios
-- ----------------------------
DROP TABLE IF EXISTS `cz_game_account_ios`;
CREATE TABLE `cz_game_account_ios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `qufu` varchar(128) DEFAULT NULL,
  `qufu_type` varchar(128) DEFAULT NULL,
  `role` varchar(256) DEFAULT NULL,
  `contact_way` varchar(64) DEFAULT NULL,
  `occupation` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=380 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cz_game_account_ios
-- ----------------------------
INSERT INTO `cz_game_account_ios` VALUES ('268', '1111', '111111', '123', 'weixin', '1111', '18773371328', null);
INSERT INTO `cz_game_account_ios` VALUES ('269', '1111', '111111', '1111', 'weixin', '1111', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('270', '1111', '111', 'sdf', '', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('271', 'sdf', '111', 'sdf', '', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('272', '1111', 'fff', '1111', 'weixin', '1111', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('273', '1111', 'dfgsdf', '1111', 'weixin', '1111', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('274', '1111', 'asdf', '1111', 'weixin', '1111', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('275', '1111', 'ddsf', '1111', 'weixin', '1111', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('276', 'sdf', 'dfg', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('277', '斯蒂芬', 'sdf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('278', '斯蒂芬', 'sdf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('279', '斯蒂芬', '1111', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('280', '斯蒂芬', 'sdf', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('281', '斯蒂芬', 'dsf', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('282', '斯蒂芬', 'fgd', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('283', '斯蒂芬', 'fds', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('284', '斯蒂芬', 'sdf', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('285', '斯蒂芬', 'f', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('286', '斯蒂芬', 'dsf', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('287', '斯蒂芬', 'f', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('288', '斯蒂芬', 'dsf', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('289', '斯蒂芬', 'sdf', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('290', '斯蒂芬', 'sdf', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('291', '斯蒂芬', 'sdf', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('292', 'sdf', 'sdf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('293', 'sdf', 'sadf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('294', 'sdf', 'sdf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('295', 'sdf', 'dsfa', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('296', 'df', 'sdf', 'sd as', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('297', '房顶上', 'sf a', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('298', '房顶上', 'sdf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('299', 'sdf', 'sfd', '是否', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('300', 'sdf', 'sfd', 'sdf', 'qq', 'sdaf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('301', 'sdf', 'sdf', 'sdf', 'qq', 'sdaf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('302', 'sdf', 'f', 'sdf', 'qq', 'sdaf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('303', 'sdf', 'sdf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('304', '1111', 'sdf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('305', '斯蒂芬', 'sdf', '斯蒂芬', 'qq', 'sdf 斯蒂芬', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('306', 'df', 'sdf', '手续费', 'qq', 'sdfs', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('307', '1111', 'sdf', '1111', 'weixin', '1111', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('308', '1111', 'dsf', '1111', 'weixin', '1111', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('309', '1111', 'sdf', '1111', 'weixin', '1111', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('310', 'sdf', 'sd', '斯蒂芬', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('311', 'sdf', 'sd', 'sdf', 'weixin', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('312', '1111', 'sdf', '1111', 'weixin', '1111', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('313', '1111', 'f', '1111', 'weixin', '1111', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('314', '1111', '324', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('315', '1111', 'xc', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('316', '1111', '11222', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('317', '1111', '11111', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('318', 'sd', 'sdf', 'dsf', 'qq', 'asdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('319', 'sd', 'sdf', 'dsf', 'qq', 'asdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('320', 'sd', 'dsf', 'dsf', 'qq', 'asdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('321', 'sd', 'sdf', 'dsf', 'qq', 'asdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('322', 'sdf', 'dsf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('323', 'sdf', 'sdf', 'xsadf', 'weixin', 'sd', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('324', 'sdf', 'trgf', 'sdf', '', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('325', 'sdf', 'sdf', '111', '', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('326', 'sdf', 'sfd', 'sdf', '', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('327', 'sdf', 'dgg', 'sdf', '', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('328', 'sdf', 'dsf', 'sdf', '', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('329', 'sdf', 'dd', 'sdf', '', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('330', 'sdf', 'ss', 'sdf', '', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('331', 'sdf', 'dd', 'sdf', '', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('332', 'sdf', 'sdf', 'sdf', '', '1111', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('333', 'sdf', '22', 'sdf', '', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('334', 'sdf', 'sdf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('335', 'sdf', 'sdf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('336', 'sdf', 'sdf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('337', 'sdf', 'dsf', 'sdf', 'weixin', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('338', 'sdf', 'ff', 'sdf', 'weixin', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('339', 'sdf', 'ff', 'sdf', 'weixin', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('340', 'sdf', 'sdf', 'sdf', 'weixin', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('341', 'sdf', 'sadf', 'sadf', 'qq', 'sadf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('342', 'sdf', 'sadf', 'sadf', 'qq', 'sadf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('343', 'sdf', 'sdf', 'sadf', 'qq', 'sadf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('344', 'sdf', 'sdff', 'sadf', 'qq', 'sadf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('345', 'sdf', 'sdf', 'sadf', 'qq', 'sadf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('346', 'sdf', 'sdf', 'sadf', 'qq', 'sadf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('347', 'sdf', 'sdf', 'sadf', 'qq', 'sadf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('348', 'sdf', 'sdf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('349', 'sdf', 'sdf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('350', 'sdf', 'dfsd', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('351', 'sdf', 'sadf', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('352', 'sdf', 'sdf', 'sadf', 'qq', 'sdf 斯蒂芬', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('353', '1111', '11', '1111', 'qq', '1111', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('354', 'sdf', 'ttttt', 'sdf', '', '1111', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('355', 'sdf', 'ddd', 'xsadf', 'weixin', 'sd', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('356', 'sdf', 'fg', 'xsadf', 'weixin', 'sd', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('357', 'sdf', 'dd', 'sdf', 'weixin', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('358', '1111', 'sdf', 'sdf', 'weixin', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('359', 'sdf', 'sadf', 'sdf', 'weixin', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('360', '1111', 'ddd', 'sdf', 'weixin', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('361', 'sdf', 'ff', 'sdf', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('362', 'sdf', 'ds', 'sdf', 'qq', 'sdf', '13413715790', null);
INSERT INTO `cz_game_account_ios` VALUES ('363', 'sdf', 'ddd', 'sdf', 'qq', 'sdf', '13413715790', null);
INSERT INTO `cz_game_account_ios` VALUES ('364', 'sdf', 'ddd', 'sdf', 'qq', 'sdf', '13413715790', null);
INSERT INTO `cz_game_account_ios` VALUES ('365', 'sdf', 'dd', '111', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('366', 'sdf', 'sss', '111', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('367', 'sdf', 'dddd', '111', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('368', 'sdf', 'ddd', '111', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('369', 'sdf', 'ddd', '111', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('370', 'sdf', 'ddd', '111', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('371', 'sdf', 'dddd', '111', 'qq', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('372', 'dd', 'dd', 'dsf', 'weixin', 'dd', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('373', 'dd', 'dd', 'dd', 'weixin', 'ddd', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('374', 'dd', 'dddd', 'dd', 'weixin', 'ddd', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('375', 'sdf', 'ded', 'sdf', 'weixin', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('376', 'sdf', 'dddd', 'sdf', 'weixin', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('377', 'sdf', 'dd', 'sdf', 'weixin', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('378', 'sdf', 'ddd', 'sdf', 'weixin', 'sdf', '18514253610', null);
INSERT INTO `cz_game_account_ios` VALUES ('379', 'sdf', 'ddddd', 'sdf', 'weixin', 'sdf', '18514253610', null);

-- ----------------------------
-- Table structure for cz_option_android
-- ----------------------------
DROP TABLE IF EXISTS `cz_option_android`;
CREATE TABLE `cz_option_android` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `detail` varchar(128) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `hide` tinyint(1) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cz_option_android
-- ----------------------------
INSERT INTO `cz_option_android` VALUES ('1', '2', '1', '125', '125', null, null, null, null);
INSERT INTO `cz_option_android` VALUES ('2', '2', '2', '200', '200', null, null, null, null);

-- ----------------------------
-- Table structure for cz_option_ios
-- ----------------------------
DROP TABLE IF EXISTS `cz_option_ios`;
CREATE TABLE `cz_option_ios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `detail` varchar(128) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `hide` tinyint(1) DEFAULT NULL,
  `text` text,
  `multiple` smallint(6) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3541 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cz_option_ios
-- ----------------------------
INSERT INTO `cz_option_ios` VALUES ('14', '12', '1980', '198', '1980钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('13', '12', '980', '98', '980钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('11', '12', '60', '6', '60钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('12', '12', '300', '30', '300钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('15', '12', '3280', '328', '3280钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('16', '12', '6480', '648', '6480钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('17', '14', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('18', '14', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('19', '361', '300', '30', '300元宝', null, '0', '月卡，每天60元宝持续30天', '2', null);
INSERT INTO `cz_option_ios` VALUES ('20', '14', '1280', '128', '1280元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('21', '14', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('22', '14', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('23', '14', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('24', null, '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('25', null, '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('26', null, '680', '68', '680金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('27', null, '1280', '128', '1280金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('28', null, '1980', '198', '1980金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('29', null, '3280', '328', '3280金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('30', null, '6480', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('31', '16', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('32', '16', '185', '18', '185元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('33', '16', '310', '30', '310元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('34', '16', '710', '68', '710元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('35', '16', '1350', '128', '1350元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('36', '16', '3500', '328', '3500元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('37', '16', '7220', '648', '7220元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('38', '17', '1200', '12', '1200钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('39', '17', '5000', '50', '5000钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('40', '17', '9800', '98', '9800钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('41', '17', '19800', '198', '19800钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('42', '17', '29800', '298', '29800钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('43', '17', '51800', '518', '51800钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('44', '18', '600', '6', '600点券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('45', '18', '3000', '30', '3000点券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('46', '18', '5200', '50', '5200点券', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('47', '18', '11000', '98', '11000点券', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('48', '18', '23000', '198', '23000点券', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('49', '18', '55000', '488', '55000点券', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('50', '19', '100', '12', '100钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('51', '19', '370', '45', '370钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('52', '19', '900', '98', '900钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('53', '19', '1550', '163', '1550钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('54', '19', '3500', '328', '3500钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('55', '19', '7500', '648', '7500钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('56', '20', '50', '6', '50宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('57', '20', '160', '18', '160宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('58', '20', '460', '50', '460宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('59', '20', '960', '98', '960宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('60', '20', '3420', '328', '3420宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('61', '20', '8400', '648', '8400宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('62', '21', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('63', '21', '120', '12', '120钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('64', '21', '320', '30', '320钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('65', '21', '540', '50', '540钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('66', '21', '1078', '98', '1078钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('67', '21', '1415', '128', '1415钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('68', '21', '2220', '198', '2220钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('69', '21', '3715', '328', '3715钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('70', '21', '5610', '488', '5610钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('71', '21', '7480', '648', '7480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('72', '22', '300', '6', '300银两', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('73', '22', '600', '12', '600银两', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('74', '22', '1500', '30', '1500银两', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('75', '22', '3000', '60', '3000银两', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('76', '22', '4900', '98', '4900银两', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('77', '22', '10900', '218', '10900银两', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('78', '22', '15900', '318', '15900银两', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('79', '22', '20900', '418', '20900银两', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('80', '22', '29400', '588', '29400银两', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('81', '150', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('82', '150', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('83', '144', '300', '30', '300黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('84', '144', '1350', '128', '1350黄金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('85', '144', '3600', '328', '3600黄金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('86', '144', '7200', '648', '7200黄金', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('87', null, '60', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('88', null, '180', '18', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('89', null, '680', '68', null, null, '0', null, '3', null);
INSERT INTO `cz_option_ios` VALUES ('90', null, '1280', '128', null, null, '0', null, '3', null);
INSERT INTO `cz_option_ios` VALUES ('91', null, '3280', '328', null, null, '0', null, '4', null);
INSERT INTO `cz_option_ios` VALUES ('92', null, '6480', '648', null, null, '0', null, '5', null);
INSERT INTO `cz_option_ios` VALUES ('93', '25', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('94', '25', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('95', '25', '748', '68', '748元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('96', '25', '1408', '128', '1408元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('97', '25', '3673', '328', '3673元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('98', '25', '7452', '648', '7452元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('99', '26', '65', '6', '65金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('100', '26', '330', '30', '330金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('101', '26', '750', '68', '750金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('102', '26', '2200', '198', '2200金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('103', '26', '3660', '328', '3660金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('104', '26', '7260', '648', '7260金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('105', '27', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('106', '27', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('107', '27', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('108', '27', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('109', '27', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('110', '27', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('111', '28', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('112', '28', '330', '30', '330钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('113', '28', '1080', '98', '1080钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('114', '28', '2280', '198', '2280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('115', '28', '5860', '488', '5860钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('116', '28', '8100', '648', '8100钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('117', '29', '65', '6', '65元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('118', '29', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('119', '29', '750', '68', '750元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('120', '29', '2200', '198', '2200元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('121', '29', '3660', '328', '3660元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('122', '29', '7260', '648', '7260元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('123', '30', '600', '6', '600钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('124', '30', '1908', '18', '1908钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('125', '30', '3270', '30', '3270钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('126', '30', '6720', '60', '6720钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('127', '30', '12420', '108', '12420钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('128', '30', '25724', '218', '25724钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('129', '30', '50578', '418', '50578钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('130', '30', '79704', '648', '79704钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('131', '151', '300', '30', '300魔晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('132', '151', '60', '6', '60魔晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('133', null, '5068', '618', null, null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('134', null, '1530', '198', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('135', null, '688', '93', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('136', null, '360', '50', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('137', null, '84', '12', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('138', '32', '60', '6', '60红钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('139', '32', '300', '30', '300红钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('140', '32', '680', '68', '680红钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('141', '32', '980', '98', '980红钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('142', '32', '1980', '198', '1980红钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('143', '32', '3280', '328', '3280红钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('144', '32', '6480', '648', '6480红钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('145', '33', '60', '6', '60红钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('146', '33', '300', '30', '300红钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('147', '33', '980', '98', '980红钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('148', '33', '1980', '198', '1980红钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('149', '33', '3280', '328', '3280红钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('150', '33', '6480', '648', '6480红钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('151', '34', '200', '6', '200金叶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('152', '34', '1667', '50', '1667金叶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('153', '34', '3594', '98', '3594金叶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('154', '34', '6527', '178', '6527金叶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('155', '34', '12246', '328', '12246金叶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('156', '34', '25920', '648', '25920金叶', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('157', '35', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('158', '35', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('159', '35', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('160', '35', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('161', '35', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('162', '35', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('163', '36', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('164', '36', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('165', '36', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('166', '36', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('167', '36', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('168', '36', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('169', '37', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('170', '37', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('171', '37', '680', '68', '680金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('172', '37', '1980', '198', '1980金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('173', '37', '3280', '328', '3280金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('174', '37', '6480', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('175', '38', '60', '6', '60钻石', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('176', '38', '300', '30', '300钻石', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('177', '38', '980', '98', '980钻石', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('178', '38', '1280', '128', '1280钻石', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('179', '38', '3280', '328', '3280钻石', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('180', '38', '6480', '648', '6480钻石', null, '1', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('181', '326', '300', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('182', '325', '6734', '518', '6734金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('183', '325', '3696', '308', '3696金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('184', '325', '1242', '108', '1242金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('185', '325', '550', '50', '550金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('186', '40', '100', '6', '100金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('187', '40', '300', '18', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('188', '40', '680', '40', '680金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('189', '40', '1530', '88', '1530金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('190', '40', '3100', '178', '3100金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('191', '40', '5000', '278', '5000金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('192', '40', '12000', '648', '12000金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('193', '41', '60', '6', '60点券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('194', '41', '330', '30', '330点券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('195', '41', '750', '68', '750点券', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('196', '41', '2280', '198', '2280点券', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('197', '41', '3980', '328', '3980点券', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('198', '41', '7980', '648', '7980点券', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('199', '42', '60', '6', '120钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('200', '42', '250', '25', '500钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('201', '42', '880', '88', '1760钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('202', '42', '1980', '198', '3960钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('203', '42', '3480', '348', '6960钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('204', '42', '6480', '648', '12960钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('205', '43', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('206', '43', '320', '30', '320元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('207', '43', '750', '68', '750元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('208', '43', '1150', '98', '1150元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('209', '43', '2300', '198', '2300元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('210', '43', '3950', '328', '3950元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('211', '43', '8100', '648', '8100元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('212', '44', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('213', '44', '400', '40', '400钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('214', '44', '1180', '118', '1180钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('215', '44', '3880', '388', '3880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('216', '44', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('217', '45', '60', '6', '60蓝钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('218', '45', '300', '30', '300蓝钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('219', '45', '980', '98', '980蓝钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('220', '45', '1980', '198', '1980蓝钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('221', '45', '3280', '328', '3280蓝钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('222', '45', '6480', '648', '6480蓝钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('223', '46', '60', '6', '60MC', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('224', '46', '300', '30', '300MC', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('225', '46', '500', '50', '500MC', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('226', '46', '1010', '98', '1010MC', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('227', '46', '1400', '138', '1400MC', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('228', '46', '2050', '198', '2050MC', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('229', '46', '4000', '388', '4000MC', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('230', '46', '6800', '648', '6800MC', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('231', '47', '600', '6', '600元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('232', '47', '3000', '30', '3000元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('233', '47', '9800', '98', '9800元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('234', '47', '17800', '178', '17800元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('235', '47', '29800', '298', '29800元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('236', '47', '58800', '588', '58800元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('237', '48', '600', '6', '600奇缘', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('238', '48', '3300', '30', '3300奇缘', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('239', '48', '11500', '98', '11500奇缘', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('240', '48', '35000', '298', '35000奇缘', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('241', '48', '80000', '648', '80000奇缘', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('242', '49', '60', '6', '60宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('243', '49', '35', '30', '35宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('244', '49', '150', '128', '150宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('245', '49', '400', '328', '400宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('246', '49', '800', '648', '800宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('247', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('248', null, '320', '30', '320元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('249', null, '750', '68', '750元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('250', null, '2300', '198', '2300元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('251', null, '3950', '328', '3950元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('252', null, '8100', '648', '8100元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('253', '52', '65', '6', '65元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('254', '52', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('255', '52', '750', '68', '750元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('256', '52', '2200', '198', '2200元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('257', '52', '3660', '328', '3660元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('258', '52', '7260', '648', '7260元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('259', null, '60', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('260', null, '300', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('261', null, '680', '68', null, null, '0', null, '3', null);
INSERT INTO `cz_option_ios` VALUES ('262', null, '1980', '198', null, null, '0', null, '4', null);
INSERT INTO `cz_option_ios` VALUES ('263', null, '3280', '328', null, null, '0', null, '4', null);
INSERT INTO `cz_option_ios` VALUES ('264', null, '6480', '648', null, null, '0', null, '5', null);
INSERT INTO `cz_option_ios` VALUES ('265', '54', '6', '6', '6梦之币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('266', '54', '18', '18', '18梦之币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('267', '54', '40', '40', '40梦之币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('268', '54', '78', '78', '78梦之币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('269', '54', '163', '163', '163梦之币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('270', '54', '328', '328', '328梦之币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('271', '54', '6480', '648', '648梦之币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('272', '55', '60', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('273', '55', '320', '30', '320钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('274', '55', '750', '68', '750钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('275', '55', '1320', '118', '1320钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('276', '55', '2280', '198', '2280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('277', '55', '5780', '488', '5780钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('278', '56', '60', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('279', '56', '180', '19', '180钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('280', '56', '200000', '18', '20万豆', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('281', '56', '325', '30', '328钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('282', '56', '780', '68', '750钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('283', '57', '80', '12', '80金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('284', '57', '100', '30', '100金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('285', '57', '200', '68', '200金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('286', '57', '480', '128', '480金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('287', '57', '750', '198', '750金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('288', '57', '1350', '328', '1350金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('289', '57', '3200', '648', '3200金', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('290', '58', '65', '1', '65G', null, '0', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('291', '58', '330', '5', '330G', null, '0', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('292', '58', '900', '12', '900G', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('293', '58', '1848', '24', '1848G', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('294', '58', '3930', '50', '3930G', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('295', '58', '8080', '100', '8080G', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('296', '59', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('297', '59', '190', '18', '190钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('298', '59', '530', '50', '530钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('299', '59', '1090', '98', '1090钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('300', '59', '1890', '168', '1890钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('301', '59', '4000', '348', '4000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('302', '60', '60', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('303', '60', '190', '19', '190钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('304', '60', '320', '30', '320钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('305', '60', '750', '68', '750钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('306', '60', '1890', '168', '1890钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('307', '60', '3800', '328', '3800钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('308', '61', '60', '6', '60钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('309', '61', '190', '18', '190钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('310', '61', '320', '30', '320钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('311', '61', '730', '68', '730钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('312', '62', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('313', '62', '320', '30', '320钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('314', '62', '190', '18', '190钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('315', '62', '1050', '98', '1050钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('316', '63', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('317', '63', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('318', '63', '750', '68', '750元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('319', '63', '1530', '138', '1530元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('320', '63', '2200', '198', '2200元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('321', '63', '3660', '328', '3660元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('322', '63', '7260', '648', '7260元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('323', '64', '60', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('324', '64', '190', '19', '190钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('325', '64', '320', '30', '320钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('326', '64', '1320', '118', '1320钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('327', '65', '60', '6', '60符石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('328', '65', '330', '30', '330符石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('329', '65', '1410', '128', '1410符石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('330', '65', '3770', '328', '3770符石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('331', '65', '7770', '648', '7770符石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('332', '66', '10', '6', '10钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('333', '66', '55', '30', '55钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('334', '66', '125', '68', '125钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('335', '66', '245', '128', '245钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('336', '66', '660', '328', '660钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('337', '66', '1400', '648', '1400钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('338', '67', '84', '8', '84元宝', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('339', '67', '296', '28', '296元宝', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('340', '67', '300', '30', '320元宝', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('341', '67', '400', '40', '430元宝', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('342', '67', '980', '98', '1078元宝', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('343', '67', '1980', '198', '2218元宝', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('344', '67', '3280', '328', '3738元宝', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('345', '67', '6480', '648', '7528元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('346', '68', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('347', '68', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('348', '68', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('349', '68', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('350', '68', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('351', '68', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('352', '69', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('353', '69', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('354', '69', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('355', '69', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('356', '69', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('357', '69', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('358', '70', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('359', '70', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('360', '70', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('361', '70', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('362', '70', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('363', '70', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('364', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('365', null, '600', '60', '600元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('366', null, '5880', '588', '5880元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('367', '73', '1200', '12', '1200M', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('368', '73', '5000', '50', '5000M', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('369', '73', '9800', '98', '9800M', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('370', '73', '19800', '198', '19800M', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('371', '73', '29800', '298', '29800M', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('372', '73', '51800', '518', '51800M', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('373', '74', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('374', '74', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('375', '74', '780', '78', '780钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('376', '74', '2180', '198', '2180钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('377', '74', '3780', '328', '3780钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('378', '74', '7780', '648', '7780钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('379', '76', '500', '30', '500宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('380', '76', '1200', '68', '1200宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('381', '76', '2500', '128', '2500宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('382', '76', '6500', '328', '6500宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('383', '76', '14000', '648', '14000宝石', null, '0', '双倍积分', '5', null);
INSERT INTO `cz_option_ios` VALUES ('384', '75', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('385', '75', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('386', '75', '660', '60', '660元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('387', '75', '1242', '108', '1242元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('388', '75', '2496', '208', '2496元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('389', '75', '3850', '308', '3850元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('390', '75', '6734', '518', '6734元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('391', '77', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('392', '77', '320', '30', '320元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('393', '77', '750', '68', '750元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('394', '77', '2300', '198', '2300元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('395', '77', '3950', '328', '3950元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('396', '77', '8100', '648', '8100元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('397', '78', '64', '6', '64钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('398', '78', '540', '50', '540钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('399', '78', '1080', '98', '1080钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('400', '78', '2100', '178', '2100钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('401', '78', '8000', '648', '8000钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('402', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('403', null, '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('404', null, '1434', '128', '1434元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('405', null, '3838', '328', '3838元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('406', null, '7770', '648', '7770元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('407', '80', '100', '12', '100钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('408', '80', '315', '30', '315钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('409', '80', '750', '68', '750钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('410', '81', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('411', '81', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('412', '81', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('413', '81', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('414', '81', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('415', '81', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('416', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('417', null, '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('418', null, '500', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('419', null, '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('420', null, '1480', '148', '1480元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('421', null, '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('422', null, '4880', '488', '4880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('423', null, '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('424', '83', '68', '6', '68元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('425', '83', '548', '50', '548元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('426', '83', '1188', '98', '1188元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('427', '83', '2288', '198', '2288元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('428', '83', '8368', '648', '8368元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('429', '84', '100', '6', '100小判', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('430', '84', '525', '30', '525小判', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('431', '84', '2200', '128', '2200小判', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('432', '84', '5750', '328', '5750小判', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('433', '84', '12000', '648', '12000小判', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('434', '144', '60', '6', '60黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('435', '143', '7200', '648', null, null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('436', '143', '3600', '328', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('437', '143', '1350', '128', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('438', '143', '300', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('439', '143', '60', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('440', null, '6', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('441', null, '30', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('442', null, '68', '68', null, null, '0', null, '3', null);
INSERT INTO `cz_option_ios` VALUES ('443', null, '108', '108', null, null, '0', null, '3', null);
INSERT INTO `cz_option_ios` VALUES ('444', null, '188', '188', null, null, '0', null, '4', null);
INSERT INTO `cz_option_ios` VALUES ('445', null, '388', '388', null, null, '0', null, '4', null);
INSERT INTO `cz_option_ios` VALUES ('446', null, '618', '618', null, null, '0', null, '5', null);
INSERT INTO `cz_option_ios` VALUES ('447', '87', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('448', '87', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('449', '87', '600', '60', '600元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('450', '87', '1880', '180', '1880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('451', '87', '2880', '288', '2880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('452', '87', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('453', '88', '70', '6', '70元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('454', '88', '320', '30', '320元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('455', '88', '650', '60', '650元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('456', '88', '1400', '128', '1400元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('457', '88', '3600', '328', '3600元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('458', '88', '7200', '648', '7200元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('459', null, '66', '6', '66元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('460', null, '332', '30', '332元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('461', null, '756', '68', '756元宝', null, '0', null, '3', null);
INSERT INTO `cz_option_ios` VALUES ('462', null, '2208', '198', '2208元宝', null, '0', null, '4', null);
INSERT INTO `cz_option_ios` VALUES ('463', null, '3670', '328', '3670元宝', null, '0', null, '4', null);
INSERT INTO `cz_option_ios` VALUES ('464', null, '7260', '648', '7260元宝', null, '0', null, '5', null);
INSERT INTO `cz_option_ios` VALUES ('465', '90', '40', '6', '40金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('466', '90', '90', '12', '90金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('467', '90', '200', '25', '200金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('468', '90', '420', '50', '420金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('469', '90', '900', '98', '900金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('470', '90', '3100', '328', '3100金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('471', '90', '6480', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('472', '91', '120', '12', '120点数', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('473', '91', '300', '30', '300点数', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('474', '91', '500', '50', '500点数', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('475', '91', '980', '98', '980点数', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('476', '91', '2980', '298', '2980点数', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('477', '91', '5880', '588', '5880点数', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('478', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('479', null, '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('480', null, '500', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('481', null, '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('482', null, '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('483', null, '4880', '488', '4880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('484', '93', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('485', '93', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('486', '93', '680', '68', '680金币', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('487', '93', '1980', '198', '1980金币', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('488', '93', '3280', '328', '3280金币', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('489', '93', '6480', '648', '6480金币', null, '1', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('490', '94', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('491', '94', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('492', '94', '610', '60', '610元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('493', '95', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('494', '95', '714', '68', '714元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('495', '95', '7128', '648', '7128元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('496', null, '60', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('497', null, '300', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('498', null, '680', '68', null, null, '0', null, '3', null);
INSERT INTO `cz_option_ios` VALUES ('499', null, '1980', '198', null, null, '0', null, '4', null);
INSERT INTO `cz_option_ios` VALUES ('500', null, '3280', '328', null, null, '0', null, '4', null);
INSERT INTO `cz_option_ios` VALUES ('501', null, '6480', '648', null, null, '0', null, '5', null);
INSERT INTO `cz_option_ios` VALUES ('502', '230', '120', '12', '120钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('503', '230', '330', '30', '330钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('504', '98', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('505', '98', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('506', '98', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('507', '98', '1480', '148', '1480元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('508', '98', '2980', '298', '2980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('509', '98', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('510', '99', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('511', '99', '330', '30', '330钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('512', '99', '1410', '128', '1410钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('513', '99', '3770', '328', '3770钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('514', '99', '7770', '648', '7770钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('515', '100', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('516', '100', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('517', '100', '1000', '98', '1000元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('518', '100', '3050', '298', '3050元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('519', '100', '5000', '488', '5000元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('520', '101', '60', '6', '60黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('521', '101', '315', '30', '315黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('522', '101', '750', '68', '750黄金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('523', '101', '2300', '198', '2300黄金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('524', '101', '7680', '648', '7680黄金', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('525', '102', '120', '6', '120点券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('526', '102', '240', '12', '240点券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('527', '102', '500', '25', '500点券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('528', '102', '1000', '50', '1000点券', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('529', '102', '2160', '108', '2160点券', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('530', '102', '4160', '208', '4160点券', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('531', '103', '70', '6', '70黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('532', '103', '360', '30', '360黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('533', '103', '830', '68', '830黄金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('534', '103', '1600', '128', '1600黄金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('535', '103', '4200', '328', '4200黄金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('536', '103', '8800', '648', '8800黄金', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('537', '414', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('538', '104', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('539', '104', '330', '30', '330钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('540', '104', '1410', '128', '1410钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('541', '104', '3770', '328', '3770钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('542', '104', '7770', '648', '7770钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('543', null, '1200', '18', '1200金锭', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('544', null, '3500', '50', '3500金锭', null, '0', null, '3', null);
INSERT INTO `cz_option_ios` VALUES ('545', null, '10000', '128', '10000金锭', null, '0', null, '3', null);
INSERT INTO `cz_option_ios` VALUES ('546', null, '25000', '308', '25000金锭', null, '0', null, '4', null);
INSERT INTO `cz_option_ios` VALUES ('547', null, '60000', '648', '60000金锭', null, '0', null, '5', null);
INSERT INTO `cz_option_ios` VALUES ('548', '106', '320', '30', '320晶钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('549', '106', '650', '60', '650晶钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('550', '106', '1100', '98', '1100晶钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('551', '106', '2200', '198', '2200晶钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('552', '106', '6000', '488', '6000晶钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('553', '107', '60', '6', '60黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('554', '107', '300', '30', '300黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('555', '107', '600', '60', '600黄金', null, '0', '赠送10%', '3', null);
INSERT INTO `cz_option_ios` VALUES ('556', '107', '1080', '108', '1080黄金', null, '0', '赠送15%', '3', null);
INSERT INTO `cz_option_ios` VALUES ('557', '107', '2080', '208', '2080黄金', null, '0', '赠送20%', '4', null);
INSERT INTO `cz_option_ios` VALUES ('558', '107', '3080', '308', '3080黄金', null, '0', '赠送25%', '4', null);
INSERT INTO `cz_option_ios` VALUES ('559', '107', '5180', '518', '5180黄金', null, '0', '赠送30%', '5', null);
INSERT INTO `cz_option_ios` VALUES ('560', '108', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('561', '108', '320', '30', '320钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('562', '108', '750', '68', '750钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('563', '108', '1500', '128', '1500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('564', '108', '4000', '328', '4000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('565', '108', '8100', '648', '8100钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('566', '109', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('567', '109', '330', '30', '330钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('568', '109', '700', '68', '700钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('569', '109', '1500', '128', '1500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('570', '109', '3850', '328', '3850钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('571', '109', '7900', '648', '7900钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('572', '110', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('573', '110', '315', '30', '315钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('574', '110', '1100', '98', '1100钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('575', '110', '6000', '488', '6000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('576', '111', '300', '6', '300元宝', null, '0', '限购一次', '2', null);
INSERT INTO `cz_option_ios` VALUES ('577', '111', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('578', '111', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('579', '111', '755', '68', '755元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('580', '111', '1421', '128', '1421元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('581', '111', '3674', '328', '3674元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('582', '112', '550', '55', '300钻石+月卡', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('583', '112', '980', '100', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('584', '112', '1980', '200', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('585', '112', '2960', '300', '2960钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('586', '112', '3460', '350', '3460钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('587', '112', '6480', '648', '6480钻石(赠6480,限购一次)', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('588', '113', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('589', '113', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('590', '113', '680', '68', '680元宝', null, '0', '送76', '3', null);
INSERT INTO `cz_option_ios` VALUES ('591', '113', '1380', '138', '1380元宝', null, '0', '送150', '3', null);
INSERT INTO `cz_option_ios` VALUES ('592', '113', '1980', '198', '1980元宝', null, '0', '送220', '4', null);
INSERT INTO `cz_option_ios` VALUES ('593', '113', '3280', '328', '3280元宝', null, '0', '送380', '4', null);
INSERT INTO `cz_option_ios` VALUES ('594', '113', '6480', '648', '6480元宝', null, '0', '送780', '5', null);
INSERT INTO `cz_option_ios` VALUES ('595', '114', '200', '12', '200钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('596', '114', '500', '30', '500钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('597', '114', '1100', '68', '1100钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('598', '114', '2400', '128', '2400钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('599', '114', '6500', '328', '6500钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('600', '114', '15000', '648', '15000钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('601', null, '60', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('602', null, '300', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('603', null, '980', '98', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('604', null, '1980', '198', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('605', null, '3280', '328', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('606', null, '6480', '648', null, null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('607', '116', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('608', '116', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('609', '116', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('610', '116', '1280', '128', '1280元宝', null, '0', '送78', '3', null);
INSERT INTO `cz_option_ios` VALUES ('611', '116', '3280', '328', '3280元宝', null, '0', '送278', '4', null);
INSERT INTO `cz_option_ios` VALUES ('612', '116', '6480', '648', '6480元宝', null, '0', '送708', '5', null);
INSERT INTO `cz_option_ios` VALUES ('613', '117', '600', '6', '600元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('614', '117', '1250', '12', '1250元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('615', '117', '2600', '25', '2600元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('616', '117', '4200', '40', '4200元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('617', '117', '8250', '78', '8250元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('618', '117', '16800', '158', '16800元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('619', null, '300', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('620', null, '980', '98', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('621', null, '1980', '198', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('622', null, '3280', '328', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('623', null, '6480', '648', null, null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('624', '119', '60', '6', '60魔钻', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('625', '119', '300', '30', '300魔钻', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('626', '119', '980', '98', '980魔钻', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('627', '119', '1980', '198', '1980魔钻', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('628', '119', '3280', '328', '3280魔钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('629', '119', '5880', '588', '5880魔钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('630', '120', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('631', '120', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('632', '120', '1280', '128', '1280金币', null, '0', '再赠145', '3', null);
INSERT INTO `cz_option_ios` VALUES ('633', '120', '3280', '328', '3280金币', null, '0', '再赠380', '4', null);
INSERT INTO `cz_option_ios` VALUES ('634', '120', '6480', '648', '6480金币', null, '0', '再赠800', '5', null);
INSERT INTO `cz_option_ios` VALUES ('635', '121', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('636', '121', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('637', '121', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('638', '121', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('639', '121', '3000', '300', '3000元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('640', '121', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('641', '121', '4480', '448', '4480元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('642', '122', '60', '6', '60神石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('643', '122', '300', '30', '300神石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('644', '122', '680', '68', '680神石', null, '0', '送70神石', '3', null);
INSERT INTO `cz_option_ios` VALUES ('645', '122', '1980', '198', '1980神石', null, '0', '送220神石', '4', null);
INSERT INTO `cz_option_ios` VALUES ('646', '122', '3280', '328', '3280神石', null, '0', '送380神石', '4', null);
INSERT INTO `cz_option_ios` VALUES ('647', '122', '6480', '648', '6480神石', null, '0', '送780神石', '5', null);
INSERT INTO `cz_option_ios` VALUES ('648', '245', '105', '68', '105现金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('649', '244', '19', '12', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('650', '244', '110', '68', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('651', '243', '19', '12', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('652', '243', '110', '68', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('653', '124', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('654', '124', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('655', '124', '680', '68', '680金币', null, '0', '再赠70', '3', null);
INSERT INTO `cz_option_ios` VALUES ('656', '124', '980', '98', '980金币', null, '0', '再赠140', '3', null);
INSERT INTO `cz_option_ios` VALUES ('657', '124', '1980', '198', '1980金币', null, '0', '再赠300', '4', null);
INSERT INTO `cz_option_ios` VALUES ('658', '124', '3280', '328', '3280金币', null, '0', '再赠500', '4', null);
INSERT INTO `cz_option_ios` VALUES ('659', '124', '6480', '648', '6480金币', null, '0', '再赠1000', '5', null);
INSERT INTO `cz_option_ios` VALUES ('660', '125', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('661', '125', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('662', '125', '500', '50', '500元宝', null, '0', '送35元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('663', '125', '680', '68', '680元宝', null, '0', '送70元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('664', '125', '1980', '198', '1980元宝', null, '0', '送240元宝', '4', null);
INSERT INTO `cz_option_ios` VALUES ('665', '125', '3280', '328', '3280元宝', null, '0', '送520元宝', '4', null);
INSERT INTO `cz_option_ios` VALUES ('666', '125', '6480', '648', '6480元宝', null, '0', '送1300元宝', '5', null);
INSERT INTO `cz_option_ios` VALUES ('667', '126', '6', '6', '6魔法石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('668', '126', '30', '30', '30魔法石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('669', '126', '68', '68', '68魔法石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('670', '126', '108', '108', '108魔法石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('671', '126', '188', '188', '188魔法石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('672', '126', '388', '388', '388魔法石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('673', '126', '618', '618', '618魔法石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('674', '127', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('675', '127', '250', '25', '250元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('676', '127', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('677', '127', '400', '40', '400元宝', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('678', '127', '680', '68', '680元宝', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('679', '127', '1280', '128', '1280元宝', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('680', '127', '3280', '318', '3280元宝', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('681', '127', '6480', '599', '6480元宝', null, '1', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('682', '150', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('683', '150', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('684', '150', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('685', '150', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('686', null, '65', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('687', null, '235', '18', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('688', null, '470', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('689', null, '1100', '60', null, null, '0', '送330金锭', '3', null);
INSERT INTO `cz_option_ios` VALUES ('690', null, '2262', '118', null, null, '0', '送679金锭', '3', null);
INSERT INTO `cz_option_ios` VALUES ('691', null, '3758', '178', null, null, '0', '送1127金锭', '4', null);
INSERT INTO `cz_option_ios` VALUES ('692', null, '6556', '298', null, null, '0', '送1967金锭', '4', null);
INSERT INTO `cz_option_ios` VALUES ('693', null, '11015', '488', null, null, '0', '送3305金锭', '4', null);
INSERT INTO `cz_option_ios` VALUES ('694', null, '13720', '588', null, null, '0', '送4116金锭', '5', null);
INSERT INTO `cz_option_ios` VALUES ('695', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('696', null, '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('697', null, '980', '98', '980元宝', null, '0', '送118', '3', null);
INSERT INTO `cz_option_ios` VALUES ('698', null, '1980', '198', '1980元宝', null, '0', '送238', '4', null);
INSERT INTO `cz_option_ios` VALUES ('699', null, '3280', '328', '3280元宝', null, '0', '送408', '4', null);
INSERT INTO `cz_option_ios` VALUES ('700', null, '6480', '648', '6480元宝', null, '0', '送888', '5', null);
INSERT INTO `cz_option_ios` VALUES ('701', '162', '60', '6', '60金豆', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('702', '162', '126', '12', '126金豆', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('703', '162', '330', '30', '330金豆', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('704', '162', '780', '68', '780金豆', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('705', '162', '1620', '128', '1620金豆', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('706', '163', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('707', '163', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('708', '163', '980', '98', '980元宝', null, '0', '送118', '3', null);
INSERT INTO `cz_option_ios` VALUES ('709', '163', '1980', '198', '1980元宝', null, '0', '送238', '4', null);
INSERT INTO `cz_option_ios` VALUES ('710', '163', '3280', '328', '3280元宝', null, '0', '408', '4', null);
INSERT INTO `cz_option_ios` VALUES ('711', '163', '6480', '648', '6480元宝', null, '0', '送888', '5', null);
INSERT INTO `cz_option_ios` VALUES ('712', '164', '100', '6', '100元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('713', '164', '500', '30', '500元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('714', '164', '1600', '78', '1600元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('715', '164', '4500', '198', '4500元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('716', '164', '8500', '328', '8500元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('717', '164', '19500', '648', '19500元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('718', '288', '6000', '518', '6000钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('719', '477', '265', '25', '265钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('720', '165', '2000', '328', '2000宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('721', '165', '5200', '648', '5200宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('722', null, '100', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('723', null, '525', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('724', null, '2200', '128', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('725', null, '5750', '328', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('726', null, '12000', '648', null, null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('727', '167', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('728', '167', '320', '30', '320元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('729', '167', '1080', '98', '1080元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('730', '167', '2880', '258', '2880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('731', '167', '6700', '588', '6700元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('732', '168', '2000', '6', '2000金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('733', '168', '8000', '18', '8000金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('734', '168', '25000', '50', '25000金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('735', '168', '120000', '128', '120000金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('736', '169', '600', '6', '600恋舞币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('737', '169', '1900', '18', '1900恋舞币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('738', '169', '3280', '30', '3280恋舞币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('739', '169', '11080', '98', '11080恋舞币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('740', '169', '33880', '298', '33880恋舞币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('741', '170', '60', '6', '60点券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('742', '170', '130', '12', '130点券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('743', '170', '200', '18', '200点券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('744', '170', '300', '25', '300点券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('745', '170', '650', '50', '650点券', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('746', '170', '1350', '108', '1350点券', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('747', '171', '600', '6', '600钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('748', '171', '1200', '12', '1200钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('749', '171', '3000', '30', '3000钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('750', '171', '4500', '45', '4500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('751', '171', '9800', '98', '9800钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('752', '171', '19800', '198', '19800钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('753', '171', '48800', '488', '48800钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('754', '173', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('755', '173', '500', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('756', '173', '2080', '208', '2080元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('757', '174', '600', '6', '600钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('758', '174', '1200', '12', '1200钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('759', '174', '1890', '18', '1890钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('760', '174', '3150', '30', '3150钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('761', '174', '7200', '68', '7200钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('762', '174', '14000', '128', '14000钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('763', '174', '37000', '328', '37000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('764', '174', '74500', '648', '74500钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('765', '175', '60', '6', '60蓝钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('766', '175', '300', '30', '300蓝钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('767', '175', '980', '98', '980蓝钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('768', '175', '1980', '198', '1980蓝钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('769', '175', '3280', '328', '3280蓝钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('770', '175', '6480', '648', '6480蓝钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('771', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('772', null, '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('773', null, '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('774', null, '1280', '128', '1280元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('775', null, '2980', '298', '2980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('776', null, '5880', '588', '5880元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('777', '177', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('778', '177', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('779', '177', '120', '12', '120元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('780', '177', '600', '60', '600元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('781', '177', '1680', '168', '1680元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('782', '177', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('783', null, '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('784', null, '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('785', null, '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('786', null, '1380', '138', '1380钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('787', null, '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('788', null, '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('789', null, '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('790', null, '60', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('791', null, '400', '40', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('792', null, '980', '98', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('793', null, '2980', '298', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('794', null, '680', '68', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('795', null, '6480', '648', null, null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('796', null, '60', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('797', null, '300', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('798', null, '660', '60', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('799', null, '1242', '108', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('800', null, '6734', '518', null, null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('801', null, '2496', '208', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('802', null, '3850', '308', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('803', '182', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('804', '182', '320', '30', '320金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('805', '182', '1088', '98', '1088金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('806', '182', '8000', '648', '8000金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('807', '182', '125', '12', '125金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('808', '182', '3500', '298', '3500金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('809', null, '100', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('810', null, '550', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('811', null, '1800', '98', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('812', null, '3900', '198', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('813', null, '8400', '388', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('814', null, '15000', '648', null, null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('815', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('816', null, '180', '18', '180元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('817', null, '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('818', null, '1280', '128', '1280元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('819', null, '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('820', null, '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('821', '185', '6', '6', '6传世币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('822', '185', '25', '25', '25传世币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('823', '185', '78', '78', '78传世币', null, '0', '=780元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('824', '185', '163', '163', '163传世币', null, '0', '=1630元宝', '4', null);
INSERT INTO `cz_option_ios` VALUES ('825', '185', '328', '328', '328传世币', null, '0', '=3280元宝', '4', null);
INSERT INTO `cz_option_ios` VALUES ('826', '185', '648', '648', '648传世币', null, '0', '=6480元宝', '5', null);
INSERT INTO `cz_option_ios` VALUES ('827', null, '5', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('828', null, '21', '25', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('829', null, '68', '78', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('830', null, '145', '163', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('831', null, '293', '328', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('832', null, '581', '648', null, null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('833', '187', '5', '6', '5热血币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('834', '187', '21', '25', '21热血币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('835', '187', '68', '78', '68热血币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('836', '187', '145', '163', '145热血币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('837', '187', '293', '328', '293热血币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('838', '187', '581', '648', '581热血币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('839', '188', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('840', '188', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('841', '188', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('842', '188', '1280', '128', '1280元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('843', '188', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('844', '188', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('845', '189', '650', '60', '650晶钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('846', '189', '320', '30', '320晶钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('847', '189', '1100', '98', '1100晶钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('848', '189', '2200', '198', '2200晶钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('849', '189', '6000', '488', '6000晶钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('850', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('851', null, '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('852', null, '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('853', '191', '500', '6', '500金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('854', '191', '1050', '12', '1050金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('855', '191', '1650', '18', '1650金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('856', '191', '2400', '25', '2400金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('857', '191', '3200', '30', '3200金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('858', '191', '7500', '68', '7500金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('859', '191', '15000', '128', '15000金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('860', '191', '40000', '328', '40000金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('861', '192', '120', '12', '120元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('862', '80', '1450', '128', '1450钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('863', '192', '310', '30', '310元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('864', '192', '1060', '98', '1060元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('865', '192', '2280', '198', '2280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('866', '193', '100', '30', '100宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('867', '193', '200', '68', '200宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('868', '193', '480', '128', '480宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('869', '193', '750', '198', '750宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('870', '193', '1325', '328', '1325宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('871', '193', '3200', '648', '3200宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('872', null, '60', '6', '60金子', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('873', null, '320', '30', '320金子', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('874', null, '1480', '138', '1480金子', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('875', null, '2200', '198', '2200金子', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('876', null, '3650', '328', '3650金子', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('877', null, '7250', '648', '7250金子', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('878', '195', '9000', '18', '9000大老二币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('879', '195', '31500', '68', '31500大老二币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('880', '195', '18000', '18', '18000大老二币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('881', '195', '61500', '68', '61500大老二币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('882', '195', '99000', '198', '99000大老二币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('883', '195', '310000', '588', '310000大老二币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('884', '196', '50', '6', '50元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('885', '196', '100', '12', '100元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('886', '196', '230', '25', '230元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('887', '196', '460', '50', '460元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('888', '196', '920', '98', '920元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('889', '196', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('890', '196', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('891', '197', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('892', '197', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('893', '197', '780', '78', '780金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('894', '197', '3280', '328', '3280金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('895', '197', '6480', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('896', '198', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('897', '198', '303', '30', '303元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('898', '198', '1040', '98', '1040元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('899', '198', '3240', '298', '3240元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('900', '198', '5500', '488', '5500元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('901', '198', '7480', '648', '7480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('902', null, '30', '6', '30红宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('903', null, '155', '30', '155红宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('904', null, '515', '98', '515红宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('905', null, '2730', '488', '2730红宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('906', null, '3760', '648', '3760红宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('907', '200', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('908', '200', '315', '30', '315元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('909', '200', '1049', '98', '1049元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('910', '200', '3278', '298', '3278元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('911', '200', '5698', '518', '5698元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('912', '200', '7128', '648', '7128元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('913', '201', '65', '6', '65元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('914', '201', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('915', '201', '550', '50', '550元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('916', '201', '1530', '138', '1530元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('917', '201', '3660', '328', '3660元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('918', '201', '7260', '648', '7260元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('919', '202', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('920', '202', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('921', '202', '1280', '128', '1280钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('922', '202', '2480', '248', '2480钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('923', '202', '4480', '448', '4480钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('924', '202', '6180', '618', '6180钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('925', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('926', null, '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('927', null, '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('928', '204', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('929', '204', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('930', '204', '1000', '98', '1000元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('931', '204', '3050', '298', '3050元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('932', '204', '5000', '488', '5000元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('933', '205', '6', '6', '6元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('934', '205', '32', '30', '32元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('935', '205', '75', '68', '75元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('936', '205', '230', '198', '230元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('937', '205', '30', '6', '30元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('938', '205', '300', '248', '300元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('939', '205', '395', '328', '395元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('940', '205', '810', '648', '810元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('941', '206', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('942', '206', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('943', '206', '780', '78', '780钻石', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('944', '206', '3280', '328', '3280钻石', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('945', '206', '6480', '648', '6480钻石', null, '1', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('946', '207', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('947', '207', '500', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('948', '207', '1000', '98', '1000元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('949', '207', '3000', '298', '3000元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('950', '207', '5500', '488', '5500元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('951', '207', '7800', '648', '7800元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('952', '208', '120', '12', '120元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('953', '208', '500', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('954', '208', '1000', '98', '1000元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('955', '208', '2000', '198', '2000元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('956', '208', '3000', '298', '3000元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('957', '208', '5000', '488', '5000元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('958', '209', '600', '6', '600仙缘', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('959', '209', '3200', '30', '3200仙缘', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('960', '209', '10800', '98', '10800仙缘', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('961', '209', '34000', '298', '34000仙缘', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('962', '209', '74000', '588', '74000仙缘', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('963', '210', '1280', '128', '1280钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('964', '210', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('965', '210', '120', '12', '120钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('966', '210', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('967', '210', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('968', '210', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('969', '210', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('970', '210', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('971', '211', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('972', '211', '120', '12', '120金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('973', '211', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('974', '211', '780', '78', '780金币', null, '0', '送120金币', '3', null);
INSERT INTO `cz_option_ios` VALUES ('975', '211', '3280', '328', '3280金币', null, '0', '送650金币', '4', null);
INSERT INTO `cz_option_ios` VALUES ('976', '211', '6480', '648', '6480金币', null, '0', '1600', '5', null);
INSERT INTO `cz_option_ios` VALUES ('977', '212', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('978', '212', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('979', '212', '730', '68', '730钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('980', '212', '1500', '128', '1500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('981', '212', '4200', '328', '4200钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('982', '212', '9000', '648', '9000钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('983', '213', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('984', '213', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('985', '213', '1030', '98', '1030元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('986', '213', '2220', '198', '2220元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('987', '213', '3880', '328', '3880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('988', '213', '8100', '648', '8100元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('989', null, '1200', '18', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('990', null, '3500', '50', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('991', null, '10000', '128', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('992', null, '25000', '308', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('993', null, '60000', '648', null, null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('994', '215', '250', '25', '250钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('995', '215', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('996', '215', '1380', '138', '1380钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('997', '215', '2630', '263', '2630钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('998', '215', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('999', '215', '4880', '488', '4880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1000', '215', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1001', '216', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1002', '216', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1003', '216', '880', '88', '880元宝', null, '0', '再赠88', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1004', '216', '3280', '328', '3280元宝', null, '0', '再赠492', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1005', '216', '6480', '648', '6480元宝', null, '0', '再赠1296', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1006', '217', '320', '30', '320晶钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1007', '217', '650', '60', '650晶钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1008', '217', '1100', '98', '1100晶钻', null, '0', '198', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1009', '217', '2200', '198', '2200晶钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1010', '217', '6000', '488', '6000晶钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1011', null, '1100', '98', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1012', null, '320', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1013', null, '6000', '488', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1014', null, '650', '60', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1015', null, '2200', '198', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1016', '219', '65', '6', '65金锭', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1017', '219', '235', '18', '235金锭', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1018', '219', '470', '30', '470金锭', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1019', '219', '1100', '60', '1100金锭', null, '0', '赠铜钱6千万，金锭330，四方吞腾2', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1020', '219', '2262', '118', '2262金锭', null, '0', '赠铜钱8千万，金锭679，四方吞腾4', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1021', '219', '3758', '178', '3758金锭', null, '0', '赠铜钱1亿，金锭1127，四方吞腾6', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1022', '219', '6556', '298', '6556金锭', null, '0', '赠铜钱1亿2千万，金锭1967，四方吞腾8', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1023', '219', '11015', '488', '11015金锭', null, '0', '赠铜钱1亿6千万，金锭3305，四方吞腾10', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1024', '219', '15120', '648', '15120金锭', null, '0', '赠铜钱3亿2千万，金锭4536，四方吞腾14', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1025', '220', '30', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1026', '221', '30', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1027', '222', '30', '30', '30元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1028', '222', '100', '50', '100元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1029', '222', '141', '128', '141元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1030', '223', '60', '6', '60宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1031', '223', '300', '30', '300宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1032', '223', '780', '78', '780宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1033', '223', '2180', '198', '2180宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1034', '223', '3780', '328', '3780宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1035', '223', '7780', '648', '7780宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1036', null, '120', '12', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1037', null, '980', '98', null, null, '0', '再赠30', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1038', null, '4880', '488', null, null, '0', '再赠500', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1039', '225', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1040', '225', '180', '18', '180元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1041', '225', '400', '40', '400元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1042', '225', '600', '60', '600元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1043', '225', '5880', '588', '5880元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1044', null, '50', '6', '50钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1045', null, '173', '18', '173钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1046', null, '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1047', null, '1390', '128', '1390钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1048', null, '8100', '648', '8100钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1049', '227', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1050', '227', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1051', '227', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1052', '227', '1630', '163', '1630钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1053', '227', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1054', '228', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1055', '228', '980', '98', '980元宝', null, '0', '月卡：立得980元宝+每天320元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1056', '228', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1057', '228', '750', '68', '750元宝', null, '0', '额外送10%', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1058', '228', '2280', '198', '2280元宝', null, '0', '额外送15%', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1059', '228', '7780', '648', '7780元宝', null, '0', '额外送30%', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1060', '229', '600', '30', '600信用点', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1061', '229', '1250', '68', '1250信用点', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1062', '229', '2750', '128', '2750信用点', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1063', '229', '7000', '328', '7000信用点', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1064', '229', '15000', '648', '15000信用点', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1065', '305', '1', '3', '三等将军令1天', null, '1', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('1066', '230', '680', '60', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1067', '230', '1150', '98', '1150钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1068', '230', '8100', '648', '8100钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1069', '231', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1070', '231', '190', '18', '190钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1071', '231', '266', '25', '266钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1072', '231', '320', '30', '320钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1073', '232', '60', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1074', '232', '320', '30', '320钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1075', '232', '750', '68', '750钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1076', '232', '1890', '168', '1890钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1077', '233', '500', '30', '500宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1078', '233', '1200', '68', '1200宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1079', '233', '2500', '128', '2500宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1080', '233', '6500', '328', '6500宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1081', '151', '980', '98', '980魔晶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1082', '151', '1980', '198', '1980魔晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1083', '151', '3280', '328', '3280魔晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1084', '152', '162', '6', '162珍珠', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1085', '152', '810', '30', '810珍珠', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1086', '152', '1836', '68', '1836珍珠', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1087', '152', '5346', '198', '5346珍珠', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1088', '152', '17496', '648', '17496珍珠', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1089', '153', '300', '30', '300魔石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1090', '153', '780', '78', '780魔石', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1091', '153', '1980', '198', '1980魔石', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1092', '153', '6480', '648', '6480魔石', null, '1', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1093', '234', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1094', '234', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1095', '234', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1096', '234', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1097', '234', '1', '50', '1元宝', null, '0', '月卡：30天', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1098', '31', '60', '6', '60金币', null, '1', '首充送120', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1099', '31', '300', '30', '300金币', null, '1', '首充送600', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1100', '31', '980', '98', '980金币', null, '1', '首充送1960', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1101', '31', '1980', '198', '1980金币', null, '1', '首充送3960', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1102', '31', '3280', '328', '3280金币', null, '1', '首充送6560', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1103', '31', '4880', '488', '4880金币', null, '1', '首充送9760', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1104', '31', '6480', '648', '6480金币', null, '0', '首充送10000', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1105', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1106', null, '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1107', null, '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1108', null, '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1109', null, '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1110', null, '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1111', '236', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1112', '236', '400', '40', '400元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1113', '236', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1114', '236', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1115', '236', '2980', '298', '2980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1116', '236', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1117', '237', '60', '6', '60元宝', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1118', '237', '330', '30', '330元宝', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1119', '237', '665', '60', '665元宝', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1120', '237', '1090', '98', '1090元宝', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1121', '237', '2210', '198', '2210元宝', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1122', '237', '3330', '298', '3330元宝', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1123', '237', '7250', '648', '7250元宝', null, '1', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1124', '238', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1125', '238', '303', '30', '303元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1126', '238', '1040', '98', '1040元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1127', '238', '3240', '298', '3240元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1128', '238', '7480', '648', '7480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1129', '239', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1130', '239', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1131', '239', '980', '98', '980金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1132', '239', '2980', '298', '2980金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1133', '239', '3880', '388', '3880金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1134', '240', '50', '6', '50金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1135', '240', '160', '18', '160金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1136', '240', '460', '50', '460金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1137', '240', '960', '98', '960金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1138', '240', '3420', '328', '3420金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1139', '241', '50', '50', '5000金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1140', '241', '12', '12', '1200金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1141', '241', '108', '108', '10800金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1142', '241', '208', '208', '20800金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1143', '241', '518', '518', '51800金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1144', '245', '19', '12', '19现金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1145', '245', '49', '30', '49现金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1146', '80', '4000', '328', '4000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1147', '80', '8300', '648', '8300钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1148', '192', '8080', '648', '8080元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1149', '245', '345', '198', '345现金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1150', '245', '600', '328', '600现金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1151', '245', '1300', '648', '1300现金', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1152', '245', '19', '12', '19现金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1153', '246', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1154', '246', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1155', '246', '600', '60', '600钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1156', '246', '1980000', '198', '1.98e+06德州币', null, '1', '额外送25万', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1157', '246', '3280', '328', '3280钻石', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1158', '246', '6480', '648', '6480钻石', null, '1', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1159', '232', '3800', '328', '3800钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1160', '232', '5800', '488', '5800钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1161', '231', '660', '60', '660钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1162', '231', '750', '68', '750钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1163', '231', '1200', '108', '1200钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1164', '231', '1320', '118', '1320钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1165', '231', '2230', '198', '2230钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1166', '231', '3800', '328', '3800钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1167', '247', '500', '30', '500钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1168', '247', '1200', '68', '1200钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1169', '247', '2500', '128', '2500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1170', '247', '6500', '328', '6500钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1171', '247', '14000', '648', '14000钻石', null, '0', '双倍积分', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1172', '248', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1173', '248', '300', '30', '315元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1174', '248', '680', '68', '727元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1175', '248', '1980', '198', '2178元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1176', '248', '3280', '328', '3673元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1177', '248', '6480', '648', '7452元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1178', '249', '60', '6', '60仙玉', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1179', '249', '330', '30', '330仙玉', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1180', '249', '1100', '98', '1100仙玉', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1181', '249', '6000', '488', '6000仙玉', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1182', '249', '2300', '198', '2300仙玉', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1183', '250', '120', '12', '120钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1184', '250', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1185', '250', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1186', '250', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1187', '250', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1188', '250', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1189', '250', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1190', '250', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1191', '251', '330', '33', '330水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1192', '251', '60', '9', '60水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1193', '251', '1430', '130', '1430水晶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1194', '251', '3860', '330', '3860水晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1195', '251', '8088', '648', '8088水晶', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1196', null, '120', '12', '120钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1197', null, '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1198', null, '1280', '128', '1280钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1199', null, '7000', '648', '7000钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1200', null, '600', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1201', null, '3000', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1202', null, '1800', '18', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1203', null, '6000', '60', null, null, '0', '送720', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1204', null, '10800', '108', null, null, '0', '送1620', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1205', null, '21800', '218', null, null, '0', '送3924', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1206', null, '64800', '648', null, null, '0', '送14904', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1207', null, '41800', '418', null, null, '0', '送8778', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1208', null, '60', '6', '60金元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1209', null, '300', '30', '300金元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1210', null, '1030', '98', '1030金元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1211', null, '2380', '198', '2380金元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1212', null, '4100', '328', '4100金元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1213', null, '8430', '648', '8430金元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1214', '255', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1215', '255', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1216', '255', '660', '60', '660金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1217', '255', '1440', '128', '1440金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1218', '255', '3780', '328', '3780金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1219', '255', '7780', '648', '7780金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1220', '256', '60', '6', '60水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1221', '256', '120', '12', '120水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1222', '256', '500', '50', '500水晶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1223', '256', '980', '98', '980水晶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1224', '256', '300', '30', '300水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1225', '256', '1980', '198', '1980水晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1226', '256', '2980', '298', '2980水晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1227', '256', '6480', '648', '6480水晶', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1228', '257', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1229', '257', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1230', '257', '648', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1231', '338', '6', '30', '6精灵石月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1232', '338', '1', '6', '1精灵石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1233', '338', '16', '68', '16精灵石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1234', '338', '24', '98', '24精灵石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1235', '336', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1236', '336', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1237', '336', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1238', '336', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1239', '259', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1240', '259', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1241', '259', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1242', '259', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1243', '259', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1244', '259', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1245', '260', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1246', '260', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1247', '260', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1248', '260', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1249', '260', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1250', '260', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1251', null, '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1252', null, '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1253', null, '680', '68', '680金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1254', null, '1980', '198', '1980金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1255', null, '3280', '328', '3280金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1256', null, '6480', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1257', null, '1150', '98', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1258', null, '120', '12', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1259', null, '2350', '198', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1260', null, '8100', '648', null, null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1261', null, '330', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1262', null, '680', '60', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1263', null, '5900', '488', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1264', '263', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1265', '263', '330', '30', '330钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1266', '263', '700', '68', '700钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1267', '263', '1500', '128', '1500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1268', '263', '3850', '328', '3850钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1269', '263', '7900', '648', '7900钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1270', '264', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1271', '264', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1272', '264', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1273', '264', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1274', '264', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1275', '264', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1276', '267', '350', '30', '350钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1277', '267', '1400', '128', '1400钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1278', '267', '3600', '328', '3600钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1279', '267', '7400', '648', '7400钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1280', '268', '300', '6', '300宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1281', '268', '1000', '18', '1000宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1282', '268', '3000', '50', '3000宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1283', '268', '10000', '128', '10000宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1284', '268', '35000', '388', '35000宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1285', '269', '50', '6', '50元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1286', '269', '260', '30', '260元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1287', '269', '540', '68', '540元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1288', '269', '1120', '128', '1120元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1289', '269', '2900', '328', '2900元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1290', '269', '6000', '648', '6000元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1291', '270', '40', '6', '40元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1292', '270', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1293', '270', '760', '68', '760元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1294', '270', '1150', '98', '1150元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1295', '270', '2310', '198', '2310元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1296', '270', '3940', '328', '3940元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1297', '270', '8100', '648', '8100元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1298', '271', '120', '12', '120钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1299', '271', '330', '30', '330钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1300', '271', '550', '50', '550钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1301', '271', '1400', '118', '1400钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1302', '271', '2500', '198', '2500钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1303', '271', '4200', '328', '4200钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1304', '271', '8600', '648', '8600钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1305', '265', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1306', '265', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1307', '265', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1308', '265', '1680', '168', '1680元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1309', '265', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1310', '265', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1311', null, '60', '6', '60米币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1312', null, '308', '30', '308米币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1313', null, '908', '88', '908米币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1314', null, '975', '98', '975米币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1315', null, '1300', '128', '1300米币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1316', null, '1968', '188', '1968米币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1317', null, '4068', '388', '4068米币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1318', null, '6818', '648', '6818米币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1319', '273', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1320', '273', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1321', '273', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1322', '273', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1323', '273', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1324', '273', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1325', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1326', null, '250', '25', '250元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1327', null, '500', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1328', null, '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1329', null, '1580', '158', '1580元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1330', null, '3880', '388', '3880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1331', '275', '60', '6', '60金钟', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1332', '275', '300', '30', '300金钟', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1333', '275', '680', '68', '680金钟', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1334', '275', '1980', '198', '1980金钟', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1335', '275', '3280', '328', '3280金钟', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1336', '275', '6480', '648', '6480金钟', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1337', '276', '300', '6', '300两', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1338', '276', '1400', '28', '1锭400两', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1339', '276', '3400', '68', '3锭400两', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1340', '276', '8400', '168', '8锭400两', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1341', '276', '16400', '328', '16锭400两', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1342', '276', '32400', '648', '32锭400两', null, '1', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1343', '277', '50', '6', '50钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1344', '277', '180', '18', '180钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1345', '277', '1000', '98', '1000钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1346', '277', '2000', '188', '2000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1347', '277', '4000', '308', '4000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1348', '278', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1349', '278', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1350', '278', '880', '88', '880元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1351', '278', '1880', '188', '1880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1352', '278', '2880', '288', '2880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1353', '278', '3880', '388', '3880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1354', '278', '5880', '588', '5880元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1355', '278', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1356', '279', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1357', '279', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1358', '279', '748', '68', '748金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1359', '279', '1408', '128', '1408金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1360', '279', '3772', '328', '3772金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1361', '279', '7776', '648', '7776金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1362', '280', '5000', '73', '5000金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1363', '281', '120', '12', '120钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1364', '281', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1365', '67', '0', '40', '白金会员', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1366', '67', '0', '98', '钻石会员', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1367', '67', '0', '198', '至尊会员', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1368', '284', '60', '6', '60钻石', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1369', '284', '300', '30', '300钻石', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1370', '284', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1371', '284', '1280', '128', '1280钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1372', '284', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1373', '284', '4880', '488', '4880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1374', '285', '1000', '10', '1000宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1375', '285', '3000', '30', '3000宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1376', '285', '10000', '100', '10000宝石', null, '0', '送10张牡丹锅', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1377', '287', '60', '6', '60金券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1378', '287', '330', '30', '330金券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1379', '287', '680', '60', '680金券', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1380', '287', '1410', '128', '1410金券', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1381', '287', '3770', '328', '3770金券', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1382', '287', '7770', '648', '7770金券', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1383', '288', '60', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1384', '288', '190', '18', '190钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1385', '288', '530', '50', '530钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1386', '288', '1090', '98', '1090钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1387', '288', '1890', '168', '1890钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1388', '288', '3770', '328', '3770钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1389', '289', '50', '53', '50元', null, '0', 'app直充', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1390', '289', '100', '105', '100元', null, '0', 'app直充', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1391', '289', '200', '210', '200元', null, '0', 'app直充', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1392', '289', '300', '315', '300元', null, '0', 'app直充', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1393', '289', '500', '525', '500元', null, '0', 'app直充', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1394', '80', '0', '12', '财富银卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1395', '80', '0', '30', '钻石月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1396', '80', '0', '68', '财富金卡', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1397', '80', '0', '68', '超级能量卡', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1398', '290', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1399', '290', '250', '25', '250元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1400', '290', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1401', '290', '400', '40', '400元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1402', '290', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1403', '290', '1280', '128', '1280元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1404', '290', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1405', '290', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1406', '290', '0', '6', '周卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1407', '290', '0', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1408', '291', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1409', '291', '320', '30', '320元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1410', '291', '1410', '128', '1410元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1411', '291', '2220', '198', '2220元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1412', '291', '3700', '328', '3700元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1413', '291', '7500', '648', '7500元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1414', '292', '60', '6', '60宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1415', '292', '320', '30', '320宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1416', '292', '1080', '98', '1080宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1417', '292', '2200', '198', '2200宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1418', '292', '3800', '328', '3800宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1419', '292', '7800', '648', '7800宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1420', '293', '60', '6', '60宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1421', '293', '330', '30', '330宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1422', '293', '1100', '98', '1100宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1423', '293', '1980', '198', '1980宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1424', '293', '3500', '298', '3500宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1425', '293', '7350', '588', '7350宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1426', '294', '210', '6', '210黄金或银币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1427', '294', '420', '12', '420黄金或银币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1428', '294', '1050', '30', '1050黄金或银币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1429', '294', '2100', '60', '2100黄金或银币', null, '0', '黄金礼包', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1430', '294', '4200', '118', '4200黄金或银币', null, '0', '黄金礼包', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1431', '294', '10500', '298', '10500黄金或银币', null, '0', '黄金礼包', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1432', '294', '21000', '618', '21000黄金或银币', null, '0', '黄金礼包', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1433', '294', '1170', '6', '1170黄金或银币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1434', '294', '10500', '30', '10500黄金或银币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1435', '294', '23400', '128', '23400黄金或银币', null, '0', '银币礼包', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1436', '295', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1437', '295', '320', '30', '320元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1438', '295', '2200', '198', '2200元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1439', '295', '3650', '328', '3650元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1440', '295', '7300', '648', '7300元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1441', '296', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1442', '296', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1443', '296', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1444', '296', '1680', '168', '1680元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1445', '296', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1446', '296', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1447', '297', '60', '6', '60海贼币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1448', '297', '189', '18', '189海贼币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1449', '297', '549', '50', '549海贼币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1450', '297', '1100', '98', '1100海贼币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1451', '297', '1659', '148', '1659海贼币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1452', '297', '3330', '288', '3330海贼币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1453', '297', '4440', '388', '4440海贼币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1454', '297', '5798', '518', '5798海贼币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1455', '297', '7280', '648', '7280海贼币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1456', '298', '70', '6', '70钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1457', '298', '369', '30', '369钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1458', '298', '629', '50', '629钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1459', '298', '2499', '198', '2499钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1460', '298', '4599', '328', '4599钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1461', '298', '8999', '588', '8999钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1462', '299', '100', '6', '100金砖', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1463', '299', '300', '12', '300金砖', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1464', '299', '800', '25', '800金砖', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1465', '299', '2500', '60', '2500金砖', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1466', '299', '0', '6', '体力丹', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1467', '299', '0', '45', '易容装', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1468', '300', '240', '6', '240元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1469', '300', '800', '18', '800元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1470', '300', '3360', '68', '3360元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1471', '300', '6400', '118', '6400元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1472', '300', '17200', '288', '17200元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1473', '300', '35600', '588', '35600元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1474', '301', '240', '6', '240元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1475', '301', '504', '12', '504元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1476', '301', '1100', '25', '1100元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1477', '301', '3060', '68', '3060元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1478', '301', '4606', '98', '4606元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1479', '301', '9504', '198', '9504元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1480', '301', '16400', '328', '16400元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1481', '301', '32400', '648', '32400元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1482', '302', '60', '6', '60水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1483', '302', '300', '30', '300水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1484', '302', '680', '68', '680水晶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1485', '302', '1980', '198', '1980水晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1486', '302', '3280', '328', '3280水晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1487', '302', '6480', '648', '6480水晶', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1488', '303', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1489', '303', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1490', '303', '680', '68', '680钻石', null, '0', '送50', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1491', '303', '1980', '198', '1980钻石', null, '0', '送200', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1492', '303', '3280', '328', '3280钻石', null, '0', '送400', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1493', '303', '6480', '648', '6480钻石', null, '0', '送1000', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1494', '303', '0', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1495', '304', '66', '6', '66元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1496', '304', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1497', '304', '755', '68', '755元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1498', '304', '2218', '198', '2218元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1499', '304', '3706', '328', '3706元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1500', '304', '7452', '648', '7452元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1501', '304', '0', '6', '超值大礼包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1502', '305', '30', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1503', '305', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1504', '305', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1505', '305', '1080', '108', '1080金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1506', '305', '2080', '208', '2080金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1507', '305', '5180', '518', '5180金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1508', '306', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1509', '306', '180', '18', '180元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1510', '306', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1511', '306', '600', '60', '600元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1512', '306', '1180', '118', '1180元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1513', '306', '3080', '308', '3080元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1514', '307', '65', '6', '65元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1515', '307', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1516', '307', '750', '68', '750元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1517', '307', '2200', '198', '2200元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1518', '307', '3660', '328', '3660元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1519', '307', '7260', '648', '7260元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1520', '307', '0', '6', '200元宝大礼包', null, '0', '（限购一次）不享受九五折', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1521', '308', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1522', '308', '125', '12', '125元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1523', '308', '320', '30', '320元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1524', '308', '1088', '98', '1088元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1525', '308', '3500', '298', '3500元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1526', '308', '8000', '648', '8000元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1527', '309', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1528', '309', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1529', '309', '1080', '108', '1080钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1530', '309', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1531', '309', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1532', '309', '5880', '588', '5880钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1533', '310', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1534', '310', '180', '18', '180钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1535', '310', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1536', '310', '500', '50', '500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1537', '311', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1538', '311', '190', '18', '190钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1539', '311', '320', '30', '320钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1540', '311', '750', '68', '750钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1541', '311', '1890', '168', '1890钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1542', '311', '3800', '328', '3800钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1543', '312', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1544', '312', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1545', '312', '980', '98', '980金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1546', '312', '1980', '198', '1980金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1547', '312', '3280', '328', '3280金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1548', '312', '6480', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1549', '313', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1550', '313', '189', '18', '189元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1551', '313', '538', '50', '538元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1552', '313', '1490', '138', '1490元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1553', '313', '2178', '198', '2178元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1554', '313', '2778', '248', '2778元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1555', '313', '3778', '328', '3778元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1556', '313', '7668', '648', '7668元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1557', '314', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1558', '314', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1559', '314', '1090', '98', '1090元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1560', '314', '1760', '158', '1760元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1561', '314', '3660', '328', '3660元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1562', '314', '7260', '648', '7260元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1563', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1564', null, '120', '12', '120元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1565', null, '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1566', null, '600', '60', '600元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1567', null, '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1568', null, '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1569', null, '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1570', null, '5180', '518', '5180元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1571', null, '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1572', '316', '300', '25', '300元宝月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1573', '316', '700', '50', '700元宝月卡', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1574', '316', '1600', '98', '1600元宝月卡', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1575', '316', '66', '6', '66元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1576', '316', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1577', null, '60', '6', '60米币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1578', null, '308', '30', '308米币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1579', null, '908', '88', '908米币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1580', null, '1968', '188', '1968米币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1581', null, '100', '6', '100能量块', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1582', null, '600', '30', '600能量块', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1583', null, '1500', '68', '1500能量块', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1584', null, '3000', '128', '3000能量块', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1585', null, '8000', '328', '8000能量块', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1586', null, '16800', '648', '16800能量块', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1587', '319', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1588', '319', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1589', '319', '780', '78', '780元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1590', '319', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1591', '319', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1592', '319', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1593', '320', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1594', '320', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1595', '320', '680', '68', '680金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1596', '320', '1280', '128', '1280金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1597', '320', '1980', '198', '1980金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1598', '320', '3280', '328', '3280金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1599', '320', '6480', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1600', '320', '0', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1601', '321', '600', '6', '600元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1602', '321', '1200', '12', '1200元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1603', '321', '3000', '30', '3000元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1604', '321', '6000', '60', '6000元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1605', '321', '88000', '88', '88000元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1606', '321', '10800', '108', '10800元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1607', '321', '15800', '158', '15800元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1608', '321', '19800', '198', '19800元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1609', '321', '32800', '328', '32800元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1610', '321', '58800', '588', '58800元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1611', '282', '60', '6', '60金砖', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1612', '446', '60', '6', '60钻石', null, '0', '充值送积分', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1613', '282', '600', '60', '600金砖', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1614', '282', '1080', '108', '1080金砖', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1615', '282', '2880', '288', '2880金砖', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1616', '282', '4480', '448', '4480金砖', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1617', '282', '6480', '648', '6480金砖', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1618', '326', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1619', '326', '310', '30', '310钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1620', '326', '1050', '98', '1050钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1621', '326', '2200', '198', '2200钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1622', '326', '5500', '488', '5500钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1623', '326', '7500', '648', '7500钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1624', '327', '35', '30', '35元宝', null, '0', '月卡，不享受九五折', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1625', '327', '75', '68', '75元宝', null, '0', '月卡，不享受首充双倍奖励，连续登陆30天累计获得2250元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1626', '327', '165', '128', '165元宝', null, '0', '月卡，不享受首充双倍奖励，连续登陆30天累计获得4950元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1627', '327', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1628', '327', '350', '30', '350元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1629', '327', '750', '68', '750元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1630', '327', '1650', '128', '1650元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1631', '327', '4350', '328', '4350元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1632', '327', '9000', '648', '9000元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1633', null, '60', '6', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1634', null, '300', '30', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1635', null, '1000', '98', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1636', null, '3050', '298', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1637', null, '5000', '488', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1638', '329', '60', '6', '60哈斯币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1639', '329', '300', '30', '300哈斯币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1640', '329', '980', '98', '980哈斯币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1641', '329', '1780', '178', '1780哈斯币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1642', '329', '2980', '298', '2980哈斯币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1643', '329', '5880', '588', '5880哈斯币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1644', '330', '20', '6', '20超级贝壳', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1645', '330', '105', '30', '105超级贝壳', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1646', '330', '225', '68', '225超级贝壳', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1647', '330', '370', '98', '370超级贝壳', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1648', '330', '650', '163', '650超级贝壳', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1649', '330', '1500', '328', '1500超级贝壳', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1650', '330', '3500', '648', '3500超级贝壳', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1651', null, '45', '6', '45魔酒', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1652', null, '230', '30', '230魔酒', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1653', null, '600', '68', '600魔酒', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1654', null, '2450', '198', '2450魔酒', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1655', null, '4350', '328', '4350魔酒', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1656', null, '9588', '648', '9588魔酒', null, '0', '白菜价，优惠50%喔', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1657', '332', '60', '6', '60骨头', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1658', '332', '120', '12', '120骨头', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1659', '332', '200', '18', '200骨头', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1660', '332', '1200', '98', '1200骨头', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1661', '333', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1662', '333', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1663', '333', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1664', '333', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1665', '333', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1666', '333', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1667', '334', '60', '6', '60勾玉', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1668', '334', '320', '30', '320勾玉', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1669', '334', '750', '68', '750勾玉', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1670', '334', '1890', '168', '1890勾玉', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1671', '334', '3800', '328', '3800勾玉', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1672', '334', '7800', '648', '7800勾玉', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1673', '322', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1674', '322', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1675', '322', '748', '68', '748元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1676', '322', '2277', '198', '2277元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1677', '322', '3936', '328', '3936元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1678', '322', '6100', '488', '6100元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1679', '338', '50', '198', '50精灵石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1680', '338', '80', '308', '80精灵石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1681', '338', '150', '548', '150精灵石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1682', '340', '60', '6', '60树叶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1683', '340', '300', '30', '300树叶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1684', '340', '680', '68', '680树叶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1685', '340', '1980', '198', '1980树叶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1686', null, '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1687', null, '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1688', null, '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1689', null, '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1690', '346', '84', '12', '84黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1691', '346', '360', '50', '360黄金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1692', '346', '688', '93', '688黄金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1693', '347', '6', '25', '6心', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1694', '337', '980', '98', '980钻石', null, '0', '周卡，每周限购一次', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1695', '337', '680', '68', '680钻石', null, '0', '送68钻石', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1696', '337', '980', '98', '980钻石', null, '0', '送98钻石', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1697', '337', '1980', '198', '1980钻石', null, '0', '送298钻石', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1698', '337', '3280', '328', '3280钻石', null, '0', '送500钻石', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1699', '337', '6480', '648', '6480钻石', null, '0', '送980钻石', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1700', '347', '1', '6', '1心', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1701', '347', '16', '68', '16心', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1702', '347', '24', '98', '24心', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1703', '347', '52', '198', '52心', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1704', '347', '88', '318', '88心', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1705', '349', '300', '30', '300银票', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1706', '349', '980', '98', '980银票', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1707', '349', '1980', '198', '1980银票', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1708', '349', '3280', '328', '3280银票', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1709', '349', '6480', '648', '6480银票', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1710', '337', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1711', '258', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1712', '258', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1713', '258', '500', '50', '500金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1714', '258', '980', '98', '980金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1715', '258', '1980', '198', '1980金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1716', '258', '3280', '328', '3280金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1717', '258', '5180', '518', '5180金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1718', '258', '6480', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1719', null, '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1720', null, '1480', '128', '1480元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1721', null, '3780', '328', '3780元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1722', null, '7780', '648', '7780元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1723', '322', '300', '6', '周卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1724', '322', '300', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1725', '324', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1726', '324', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1727', '324', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1728', '324', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1729', '324', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1730', '324', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1731', '337', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1732', '355', '1', '6', '1', null, '0', '一个表情', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1733', '340', '3280', '328', '3280树叶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1734', '340', '6480', '648', '6480树叶', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1735', '349', '60', '6', '60银票', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1736', '228', '300', '30', '300元宝', null, '0', '月卡，不享受九五折', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1737', '65', '300', '30', '300符石', null, '0', '每天额外领取100符石X30天', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1738', '337', '30', '30', '30钻石', null, '0', '月卡礼包，每个月限购一次', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1739', '65', '600', '60', '600符石', null, '0', '每天领取200符石X30天', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1740', '587', '32400', '3240', '32400元宝', null, '1', '三倍积分', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1741', '112', '3880', '400', '3880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1742', null, '300', '30', null, null, '0', '每日领取40萌币（30天）', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1743', null, '160', '8', null, null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1744', null, '1000', '50', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1745', null, '1960', '98', null, null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1746', null, '3960', '198', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1747', null, '6960', '348', null, null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1748', null, '12360', '618', null, null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1749', '360', '160', '8', '160萌币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1750', '360', '1000', '50', '1000萌币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1751', '360', '1960', '98', '1960萌币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1752', '360', '3960', '198', '3960萌币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1753', '360', '6960', '348', '6960萌币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1754', '360', '12360', '618', '12360萌币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1755', '360', '300', '30', '300萌币,每日领取100萌币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1756', '361', '100', '10', '100元宝', null, '0', '首次翻倍', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1757', '361', '500', '50', '500元宝', null, '0', '首次翻倍，并加25元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1758', '361', '1000', '100', '1000元宝', null, '0', '首次翻倍，加80元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1759', '361', '2000', '200', '2000元宝', null, '0', '首次翻倍，并加200元宝', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1760', '361', '5000', '500', '5000元宝', null, '0', '首次翻倍，并加600元宝', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1761', '361', '10000', '1000', '10000元宝', null, '0', '首次翻倍，并加1500元宝', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1762', '361', '20000', '2000', '20000元宝', null, '0', '首次翻倍，并送4000元宝', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1763', null, '3', '98', null, null, '0', '三级红钻30天', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1764', null, '0', '78', '二级红钻60天', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1765', null, '0', '30', '一级红钻30天（不享受打折扣）', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1766', null, '0', '60', '一级红钻60天', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1767', null, '0', '88', '一级红钻90天', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1768', null, '0', '178', '一级红钻180天', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1769', null, '0', '298', '一级红钻360天', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1770', null, '0', '50', '二级红钻30天', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1771', null, '0', '108', '二级红钻90天', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1772', null, '0', '193', '二级红钻180天', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1773', null, '0', '318', '二级红钻360天', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1774', null, '0', '98', '三级红钻30天', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1775', null, '0', '128', '三级红钻60天', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1776', null, '0', '158', '三级红钻90天', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1777', null, '0', '243', '三级红钻180天', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1778', null, '0', '388', '三级红钻360天', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1779', '363', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1780', '363', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1781', '363', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1782', '363', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1783', '363', '3480', '348', '3480钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1784', '363', '5880', '588', '5880钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1785', null, '60', '6', '60金钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1786', null, '180', '18', '180金钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1787', null, '680', '68', '680金钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1788', null, '1280', '128', '1280金钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1789', null, '3280', '328', '3280金钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1790', null, '6480', '648', '6480金钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1791', '446', '300', '30', '300钻石', null, '0', '充值送积分', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1792', '454', '60', '6', '60金币（另送7，首充三倍）', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1793', '487', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1794', '487', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1795', '446', '3280', '328', '3280钻石', null, '0', '充值送积分', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1796', '446', '1980', '198', '1980钻石', null, '0', '充值送积分', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1797', '487', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1798', '449', '2000', '198', '2000元宝大月卡', null, '0', '活动界面领取，多次购买可延长时间', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1799', '449', '300', '30', '300元宝小月卡', null, '0', '活动界面领取，多次购买可延长时间', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1800', '449', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1801', '446', '0', '30', '月光宝盒', null, '0', '充值送积分', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1802', '336', '0', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1803', '449', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1804', '336', '0', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1805', '449', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1806', '449', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1807', '495', '1', '6', '60灵玉', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1808', '495', '1', '98', '980灵玉', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1809', '495', '1', '198', '1980灵玉', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1810', '495', '1', '328', '3280灵玉', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1811', '483', '1100', '258', '1100玛瑙', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1812', '483', '30000', '648', '30000钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1813', '483', '5000', '128', '5000钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1814', '483', '2300', '68', '2300钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1815', '482', '4000', '328', '4000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1816', '482', '2000', '168', '2000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1817', '482', '330', '30', '330钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1818', '481', '0', '30', '300元宝月度礼包', null, '0', '月卡（300元宝月度礼包）', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1819', '383', '0', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1820', '481', '0', '648', '7888元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1821', '481', '0', '128', '1388元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1822', '481', '0', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1823', '374', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1824', '484', '300', '30', '300金条', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1825', '480', '0', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1826', '67', '0', '198', '连理坠', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1827', '480', '0', '328', '3280元宝', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1828', '480', '0', '68', '680元宝', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1829', '480', '0', '60', '600元宝', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1830', '480', '0', '30', '300元宝', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1831', '457', '581', '648', '581赛星币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1832', '480', '0', '6', '60元宝', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1833', '479', '0', '648', '7250元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1834', '479', '0', '198', '2210元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1835', '479', '0', '60', '665元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1836', '479', '0', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1837', '478', '0', '198', '成长基金', null, '0', '成长基金（限一次）', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1838', '457', '266', '298', '266赛星币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1839', '478', '0', '25', '招财进宝', null, '0', '招财进宝（限一次）', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1840', '94', '1320', '128', '1320元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1841', '478', '0', '388', '3880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1842', '478', '0', '60', '600元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1843', '478', '0', '7', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1844', '336', '0', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1845', '457', '86', '98', '86赛星币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1846', '414', '714', '68', '714元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1847', '477', '0', '98', '1090钻石', null, '0', '多送11%', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1848', '477', '0', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1849', '485', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1850', '485', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1851', '457', '43', '50', '43赛星币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1852', '533', '60', '6', '60钻石', null, '0', '第一滴血', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1853', '77', '200', '6', '200元宝远离毒品大礼包', null, '0', '附送的卢,限购一次!', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1854', '107', '1', '78', '季卡', null, '0', '1', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1855', '457', '15', '18', '15赛星币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1856', '398', '0', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1857', '476', '60000', '648', '60000金锭', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1858', '456', '5180', '518', '5180元宝', null, '0', '首充3倍，送668元宝', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1859', '476', '25000', '288', '25000金锭', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1860', '476', '10000', '128', '10000金锭', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1861', '476', '3500', '50', '3500金锭', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1862', '476', '1200', '18', '1200金锭', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1863', '383', '300', '30', '300钻石', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1864', '456', '3280', '328', '3280元宝', null, '0', '首充3倍，送420元宝', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1865', '475', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1866', '475', '1680', '168', '1680元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1867', '475', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1868', '474', '980', '100', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1869', '474', '1', '55', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1870', '474', '1480', '150', '1480元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1871', '474', '1960', '200', '1960元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1872', '473', '4480', '448', '4480钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1873', '473', '3080', '308', '3080钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1874', '473', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1875', '473', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1876', '473', '300', '30', '300钻石', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1877', '485', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1878', '456', '1980', '198', '1980元宝', null, '0', '首充3倍，送238元宝', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1879', '462', '1', '30', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1880', '456', '980', '98', '980元宝', null, '0', '首充3倍，送113元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1881', '485', '1', '68', '季卡(680钻+100钻/90天)', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1882', '472', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1883', '472', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1884', '472', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1885', '472', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1886', '471', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1887', '471', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1888', '470', '2000', '328', '2000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1889', '470', '640', '128', '640钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1890', '456', '300', '30', '300元宝', null, '0', '首充3倍，送30元宝', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1891', '470', '110', '30', '110钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1892', '470', '100', '12', '100钻石', null, '0', '只限一次', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1893', '469', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1894', '469', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1895', '469', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1896', '468', '6480', '648', '6480元宝', null, '0', '首充另赠6480元宝', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1897', '456', '60', '6', '60元宝', null, '0', '首充3倍', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1898', '468', '1980', '198', '1980元宝', null, '0', '首充另赠1980元宝', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1899', '468', '300', '30', '300元宝', null, '0', '首充另赠300元宝', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1900', null, '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1901', '450', '48800', '488', '48800绿钻', null, '0', '首充双倍', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1902', null, '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1903', '486', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1904', '90', '420', '50', '420金币+冲浪高手2000金币礼包', null, '0', '角色时装', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1905', '90', '420', '50', '420金币+滑板少年时装礼包', null, '0', '角色时装', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1906', '90', '420', '50', '420金币+见习女警时装礼包', null, '0', '角色时装', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1907', '90', '420', '50', '420金币+甜美护士时装礼包', null, '0', '角色时装', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1908', '90', '420', '50', '420金币+魔术大师时装礼包', null, '0', '角色时装', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1909', '486', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1910', '495', '1', '648', '6480灵玉', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1911', '486', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1912', '458', '120', '12', '240元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1913', '458', '1360', '68', '1360元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1914', '486', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1915', '486', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1916', '450', '19800', '198', '19800绿钻', null, '0', '首充双倍', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1917', '458', '2560', '128', '2560元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1918', '450', '3000', '30', '3000绿钻', null, '0', '首充双倍', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1919', '90', '420', '50', '420金币', null, '0', '星辉宝石优惠', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1920', '365', '0', '128', '1410钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1921', '365', '0', '30', '330钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1922', '365', '0', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1923', '365', '0', '6', '', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1924', '484', '1980', '198', '1980金条', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1925', '485', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1926', '449', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1927', '464', '1650', '600', '1650钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1928', '464', '250', '120', '250钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1929', '464', '55', '30', '55钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1930', '464', '20', '12', '20钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1931', '463', '5180', '518', '5180钻石', null, '0', '首充双重好礼', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1932', '463', '780', '78', '780钻石', null, '0', '首充双重好礼', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1933', '305', '3', '7', '二等将军令3天', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1934', '365', '0', '25', '', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1935', '462', '1980', '198', '钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1936', '462', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1937', '455', '8000', '648', '8000元宝', null, '0', '首充双倍', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1938', '461', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1939', '461', '500', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1940', '461', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1941', '461', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1942', '455', '2800', '248', '2800元宝', null, '0', '首充双倍', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1943', '460', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1944', '460', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1945', '460', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1946', '460', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1947', '460', '300', '25', '300元宝', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1948', '459', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1949', '459', '4880', '488', '4880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1950', '459', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1951', '487', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1952', '459', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1953', '56', '1950', '168', '1950钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1954', null, '0', '6', '1爱心', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1955', '455', '300', '25', '300元宝', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1956', '162', '4200', '328', '4200金豆', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1957', '455', '200', '18', '200元宝', null, '0', '首充双倍', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1958', '366', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1959', '366', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1960', '366', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1961', '366', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1962', null, '0', '30', '300元宝', null, '0', '不享受95折', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1963', null, '0', '6', '60元宝', null, '0', '不享受95折', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1964', '365', '0', '588', '7060钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1965', '365', '0', '328', '3770钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1966', '459', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1967', '366', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1968', '366', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1969', null, '60', '6', '60钻石', null, '0', '不享受折扣', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1970', null, '300', '30', '300钻石', null, '0', '不享受折扣', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1971', null, '980', '98', '980钻石', null, '0', '九折', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1972', null, '1980', '198', '1980钻石', null, '0', '九折', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1973', null, '6480', '648', '6480钻石', null, '0', '九折', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1974', null, '3280', '328', '3280钻石', null, '0', '九折', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1975', '368', '60', '6', '60元宝', null, '0', '不享受折扣', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1976', '368', '300', '30', '300元宝', null, '0', '月卡（不享受折扣）', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1977', '368', '330', '30', '330元宝', null, '0', '不享受折扣', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1978', '368', '750', '68', '750元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1979', '368', '1480', '128', '1480元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1980', '368', '7780', '648', '7780元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1981', '368', '3780', '328', '3780元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1982', '369', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1983', '369', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1984', '369', '780', '78', '780钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1985', '369', '2178', '198', '2178钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1986', '369', '3772', '328', '3772钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1987', '369', '7776', '648', '7776钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1988', null, '0', '25', '6爱心', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1989', null, '0', '68', '16爱心', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1990', null, '0', '98', '24爱心', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1991', null, '0', '198', '52爱心', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1992', null, '0', '318', '88爱心', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1993', '77', '320', '30', '320元宝月卡大礼包', null, '0', '可累积购买', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1994', '77', '0', '98', '120元宝x30天月卡豪华大礼包', null, '0', '可累积购买', '3', null);
INSERT INTO `cz_option_ios` VALUES ('1995', '77', '0', '198', '200元宝x30天日进斗金大礼包', null, '0', '可累积购买', '4', null);
INSERT INTO `cz_option_ios` VALUES ('1996', '31', '0', '30', '月卡', null, '1', '300金+每日领取50金等', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1997', '305', '6480', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('1998', '377', '60', '6', '60金钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('1999', '377', '180', '18', '180金钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2000', '377', '680', '68', '680金钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2001', '377', '1280', '128', '1280金钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2002', '377', '3280', '328', '3280金钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2003', '377', '6480', '648', '6480金钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2004', '90', '1800', '196', '1800金币', null, '0', '角色：女王皮肤礼包', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2005', '373', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2006', '373', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2007', '373', '1280', '128', '1280钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2008', '373', '2880', '288', '2880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2009', '373', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2010', '373', '400', '40', '400钻石', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2011', '373', '980', '98', '980钻石', null, '0', '季卡', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2012', '373', '1980', '198', '1980钻石', null, '0', '年卡', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2013', '455', '1100', '98', '1100元宝', null, '0', '首充双倍', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2014', null, '0', '30', '500钻石', null, '0', '小堆钻石', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2015', null, '0', '68', '1200钻石', null, '0', '小袋钻石', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2016', null, '0', '128', '2500钻石', null, '0', '大袋钻石', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2017', null, '0', '328', '6500钻石', null, '0', '小盒钻石', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2018', null, '0', '648', '14000钻石', null, '0', '大箱钻石', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2019', '67', '0', '648', '龙凤结', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2020', '446', '880', '88', '880钻石', null, '0', '充值送积分', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2021', '487', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2022', '444', '60', '6', '60符石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2023', '94', '3100', '298', '3100元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2024', '446', '6480', '648', '6480钻石', null, '0', '充值送积分', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2025', '282', '1', '30', '30元月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2026', '449', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2027', '249', '1', '30', '月卡', null, '0', '每天领取100仙玉', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2028', '495', '1', '30', '300灵玉', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2029', '495', '1', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2030', '483', '230', '68', '230玛瑙', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2031', '483', '11000', '258', '11000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2032', '483', '1000', '30', '1000钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2033', '482', '780', '68', '780钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2034', '61', '3400', '298', '3400钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2035', '61', '1400', '128', '1400钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2036', '481', '0', '348', '3988元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2037', '481', '0', '30', '318元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2038', '484', '60', '6', '60金条', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2039', '67', '0', '8', '月心佩', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2040', '480', '0', '488', '4880元宝', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2041', '480', '0', '198', '1980元宝', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2042', '480', '0', '25', '250元宝', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2043', '484', '980', '98', '980金条', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2044', '479', '0', '298', '3330元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2045', '479', '0', '98', '1090元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2046', '479', '0', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2047', '478', '0', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2048', '478', '0', '198', '1980元宝', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2049', '478', '0', '30', '300元宝', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2050', '477', '0', '328', '3800钻石', null, '0', '多送16%', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2051', '477', '0', '168', '1890钻石', null, '0', '多送12%', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2052', '477', '0', '68', '750钻石', null, '0', '多送10%', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2053', '477', '0', '19', '190钻石', null, '0', '多送5%', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2054', '75', '1', '30', '月卡', null, '0', '1', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2055', '111', '7258', '648', '7258元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2056', '90', '420', '50', '420金币+海军少帅时装礼包', null, '0', '角色时装', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2057', '457', '5', '6', '5赛星币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2058', '475', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2059', '456', '4880', '488', '4880元宝', null, '0', '首充3倍，送588元宝', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2060', '475', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2061', '475', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2062', '474', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2063', '474', '3460', '350', '3460元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2064', '474', '2960', '300', '2960元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2065', '474', '3960', '400', '3960元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2066', '473', '6180', '618', '6180钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2067', '473', '1480', '148', '1480钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2068', '473', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2069', '485', '1', '30', '月卡(300钻+80钻/30天)', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2070', '90', '200', '25', '200金币', null, '0', '魔能宝石优惠礼包', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2071', '485', '1', '198', '年卡(1980钻+120钻/365天)', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2072', '472', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2073', '472', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2074', '471', '280', '30', '280钻石', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2075', '471', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2076', '471', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2077', '471', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2078', '471', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2079', '470', '5200', '648', '5200钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2080', '470', '260', '68', '260钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2081', '469', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2082', '454', '1980', '198', '1980金币（另送238，首充三倍）', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2083', '468', '3280', '328', '3280元宝', null, '0', '额外赠送320元宝', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2084', '468', '980', '98', '980元宝', null, '0', '额外赠送80元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2085', '468', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2086', null, '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2087', null, '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2088', null, '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2089', null, '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2090', '486', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2091', '90', '420', '50', '420金币', null, '0', '魔能宝石优惠礼包', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2092', '90', '900', '98', '900金币+炫酷龙影角色礼包', null, '0', '角色时装', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2093', '458', '3960', '198', '3960元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2094', '450', '7800', '78', '7800绿钻', null, '0', '首充双倍', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2095', '90', '200', '25', '200金币', null, '0', '星辉宝石优惠礼包', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2096', '450', '600', '6', '600绿钻', null, '0', '首充双倍', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2097', '456', '1', '648', '6480元宝', null, '0', '非首充，送875元宝', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2098', '484', '6480', '648', '6480金条', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2099', '485', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2100', '485', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2101', '464', '750', '300', '750钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2102', '464', '115', '60', '115钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2103', '463', '6180', '618', '6180钻石', null, '0', '首充双重好礼', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2104', '463', '3280', '328', '3280钻石', null, '0', '首充双重好礼', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2105', '463', '2180', '218', '2180钻石', null, '0', '首充双重好礼', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2106', '463', '1280', '128', '1280钻石', null, '0', '首充双重好礼', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2107', '463', '300', '30', '300钻石', null, '0', '首充双重好礼', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2108', '463', '60', '6', '60钻石', null, '0', '首充双重好礼', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2109', '463', '300', '30', '月卡，300钻石，每日返10钻石', null, '0', '30%经验，金币加成', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2110', '463', '60', '6', '周卡', null, '1', '30%经验，金币加成', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2111', '462', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2112', '462', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2113', '462', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2114', '462', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2115', '462', '300', '30', '300钻石', null, '1', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2116', '461', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2117', '461', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2118', '461', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2119', '455', '5800', '488', '5800元宝', null, '0', '首充双倍', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2120', '461', '300', '30', '300元宝', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2121', '414', '7128', '648', '7128元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2122', '460', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2123', '460', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2124', '459', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2125', '459', '500', '50', '500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2126', '459', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2127', '249', '1', '6', '周卡', null, '0', '每天领取60仙玉', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2128', '251', '330', '6', '330水晶', null, '1', '限购买一次', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2129', '251', '300', '33', '300水晶', null, '0', '月卡礼包,可累计', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2130', '65', '1', '50', '全服广播x1', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2131', '349', '250', '25', '月卡', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2132', '349', '250', '25', '月卡', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2133', '382', '0', '6', '66钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2134', '382', '0', '30', '330钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2135', '382', '0', '198', '2218钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2136', '382', '0', '98', '1093钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2137', '382', '0', '388', '4368钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2138', '382', '0', '648', '7369钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2139', '383', '0', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2140', '383', '0', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2141', '383', '0', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2142', '383', '0', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2143', '383', '0', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2144', '384', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2145', '384', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2146', '384', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2147', '384', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2148', '384', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2149', '384', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2150', '385', '72', '18', '72水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2151', '385', '120', '30', '120水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2152', '385', '240', '68', '240水晶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2153', '385', '480', '128', '480水晶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2154', '385', '1200', '328', '1200水晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2155', '385', '2400', '648', '2400水晶', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2156', '386', '0', '25', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2157', '386', '60', '6', '60五彩石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2158', '386', '300', '30', '300五彩石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2159', '386', '500', '50', '500五彩石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2160', '386', '980', '98', '980五彩石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2161', '386', '1980', '198', '1980五彩石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2162', '386', '4880', '488', '4880五彩石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2163', '386', '6480', '648', '6480五彩石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2164', '31', '500', '50', '500金币', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2165', '374', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2166', '374', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2167', '374', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2168', '374', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2169', '374', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2170', '305', '5', '10', '一等将军令5天', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2171', '387', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2172', '387', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2173', '387', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2174', '387', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2175', '387', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2176', '387', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2177', '388', '60', '6', '60钻石', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2178', '388', '310', '30', '310钻石', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2179', '388', '750', '68', '750钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2180', '388', '1650', '148', '1650钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2181', '388', '3400', '298', '3400钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2182', '388', '5700', '488', '5700钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2183', '395', '7', '6', '7Gem', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2184', '395', '22', '18', '22Gem', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2185', '395', '39', '30', '39Gem', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2186', '395', '81', '68', '81Gem', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2187', '395', '252', '198', '252Gem', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2188', '395', '438', '328', '438Gem', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2189', '395', '910', '648', '910Gem', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2190', '395', '3300', '6', '3300Gold', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2191', '395', '10500', '18', '10500Gold', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2192', '395', '18300', '30', '18300Gold', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2193', null, '120', '12', '120金币', null, '0', '30元以上享受95折', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2194', null, '500', '50', '500金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2195', null, '1000', '98', '1000金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2196', null, '2050', '198', '2050金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2197', null, '3100', '298', '3100金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2198', null, '6800', '648', '6800金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2199', '398', '120', '12', '120金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2200', '398', '500', '50', '500金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2201', '398', '1000', '98', '1000金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2202', '398', '2050', '198', '2050金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2203', '398', '3100', '298', '3100金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2204', '398', '6800', '648', '6800金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2205', '399', '60', '6', '60钻石礼包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2206', '399', '300', '30', '300钻石礼包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2207', '399', '980', '98', '980钻石礼包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2208', '399', '1980', '198', '1980钻石礼包', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2209', '399', '3280', '328', '3280钻石礼包', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2210', '399', '6480', '648', '6480钻石礼包', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2211', '162', '8500', '648', '8500金豆', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2212', '18', '300', '18', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2213', '401', '60', '6', '60水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2214', '401', '300', '30', '300水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2215', '401', '680', '68', '680水晶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2216', '401', '1980', '198', '1980水晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2217', '401', '3280', '328', '3280水晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2218', '401', '6480', '648', '6480水晶', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2219', '403', '50', '6', '50金币', null, '0', '仅限购买一次', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2220', '403', '9', '6', '9金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2221', '403', '50', '30', '50金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2222', '403', '120', '68', '120金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2223', '403', '270', '128', '270金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2224', '403', '750', '328', '750金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2225', '403', '1600', '648', '1600金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2226', null, '50', '6', '50金币', null, '0', '仅限购买一次', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2227', null, '9', '6', '9金币', null, '0', '30以上享受95折', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2228', null, '50', '30', '50金币', null, '0', '30以上享受95折', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2229', null, '120', '68', '120金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2230', null, '270', '128', '270金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2231', null, '750', '328', '750金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2232', null, '1600', '648', '1600金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2233', '455', '60', '6', '60元宝', null, '0', '首充双倍', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2234', '454', '680', '68', '680金币（另送81，首充三倍）', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2235', '346', '1530', '198', '1530黄金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2236', '346', '3100', '388', '3100黄金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2237', '346', '5068', '618', '5068黄金', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2238', '423', '2200', '12', '2200颗红宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2239', '423', '6000', '20', '6000颗红宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2240', '423', '15000', '73', '15000颗红宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2241', '423', '32000', '148', '32000颗红宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2242', '423', '50000', '228', '50000颗红宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2243', '423', '87500', '348', '87500颗红宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2244', '121', '5480', '548', '5480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2245', '424', '60', '6', '60金币包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2246', '424', '300', '30', '300金币包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2247', '424', '680', '68', '680金币包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2248', '424', '1980', '198', '1980金币包', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2249', '424', '3280', '328', '3280金币包', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2250', '424', '6480', '648', '6480金币包', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2251', '316', '750', '68', '750元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2252', '316', '2200', '198', '2200元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2253', '316', '3660', '328', '3660元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2254', '316', '7260', '648', '7260元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2255', '151', '6480', '648', '6480魔晶', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2256', '454', '3280', '328', '3280金币（另送410，首充三倍）', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2257', '351', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2258', '351', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2259', '351', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2260', '351', '1780', '178', '1780元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2261', '351', '2980', '298', '2980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2262', '351', '4880', '488', '4880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2263', '239', '1980', '198', '1980金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2264', '239', '6480', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2265', '425', '0', '6', '600钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2266', '425', '0', '30', '3150钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2267', '425', '0', '68', '7200钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2268', '425', '0', '128', '14000钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2269', '425', '0', '328', '37000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2270', '425', '0', '648', '74400钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2271', '426', '50', '30', '50红宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2272', '426', '100', '68', '100红宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2273', '426', '240', '128', '240红宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2274', '426', '375', '198', '375红宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2275', '426', '665', '328', '665红宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2276', '426', '1600', '648', '1600红宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2277', '427', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2278', '427', '300', '30', '300元宝', null, '0', '首次另赠360元宝', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2279', '427', '680', '68', '680元宝', null, '0', '另赠71元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2280', '427', '1280', '128', '1580元宝', null, '0', '首次另赠1562元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2281', '427', '2580', '258', '2580元宝', null, '0', '另赠297元宝', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2282', '427', '6480', '648', '6480元宝', null, '0', '首次另赠8036元宝', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2283', '428', '60', '6', '60宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2284', '428', '300', '30', '300宝石', null, '0', '送30', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2285', '428', '680', '68', '680宝石', null, '0', '送120', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2286', '428', '1280', '128', '1280宝石', null, '0', '送500', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2287', '428', '3280', '328', '3280宝石', null, '0', '送2000', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2288', '428', '6480', '648', '6480宝石', null, '0', '送6000', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2289', '192', '0', '68', '超值大礼包', null, '0', '超值大礼包', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2290', '429', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2291', '429', '500', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2292', '429', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2293', '429', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2294', '429', '4880', '488', '4880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2295', '429', '7776', '648', '7776元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2296', '42', '300', '30', '300钻石', null, '0', '每天领取60钻石x30天', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2297', '42', '600', '60', '600钻石', null, '0', '每天领取66钻石x30天,买体力5折x30天', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2298', '430', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2299', '430', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2300', '430', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2301', '430', '1280', '128', '1358元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2302', '430', '3280', '328', '3558元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2303', '430', '6480', '648', '7188元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2304', '430', '300', '25', '300元宝', null, '0', '每天领取100元宝x30天', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2305', null, '60', '6', '60元宝', null, '0', '30元以上享受95折', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2306', null, '300', '30', '300元宝', null, '0', '30元以上享受95折', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2307', null, '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2308', null, '1280', '128', '1358元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2309', null, '3280', '328', '3558元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2310', null, '6480', '648', '7188元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2311', null, '300', '25', '300元宝', null, '0', '每天领取100元宝x30天', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2312', '454', '300', '30', '300金币（另送35，首充三倍）', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2313', '437', '50', '12', '50元宝', null, '1', '每个账号每天限购1单，不得多买', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2314', '437', '130', '30', '130元宝', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2315', '437', '275', '68', '275元宝', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2316', '437', '570', '128', '570元宝', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2317', '437', '1500', '258', '1500元宝', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2318', '437', '7500', '1296', '7500元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2319', '438', '1', '6', '1钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2320', '438', '6', '30', '6钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2321', '438', '13', '60', '13钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2322', '438', '30', '128', '30钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2323', '438', '50', '208', '50钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2324', '438', '95', '388', '95钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2325', '438', '135', '518', '135钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2326', '439', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2327', '439', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2328', '439', '695', '68', '695钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2329', '439', '2080', '198', '2080钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2330', '439', '4000', '328', '4000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2331', '439', '8500', '648', '8500钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2332', '440', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2333', '440', '300', '30', '300元宝', null, '0', '赠送30元宝', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2334', '440', '980', '98', '980元宝', null, '0', '赠送98元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2335', '440', '1980', '198', '1980元宝', null, '0', '赠送297元宝', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2336', '440', '5880', '588', '5880元宝', null, '0', '赠送1176元宝', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2337', '94', '6200', '588', '6200元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2338', '444', '300', '30', '300符石', null, '0', '首次购买另赠送300符石', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2339', '444', '980', '98', '980符石', null, '0', '额外赠送20符石', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2340', '444', '1980', '198', '1980符石', null, '0', '首次购买另赠1980符石', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2341', '444', '3280', '328', '3280符石', null, '0', '首次购买另赠送3280符石', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2342', '444', '6480', '648', '6480符石', null, '0', '首次购买另赠送6480符石', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2343', '400', '10', '6', '60红钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2344', '400', '100', '30', '300红钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2345', '400', '300', '98', '980红钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2346', '400', '500', '198', '1980红钻', null, '0', '赠1980钻，限购一次', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2347', '400', '1000', '328', '3280红钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2348', '400', '2000', '648', '6480红钻', null, '0', '赠6480钻，限购1次', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2349', '344', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2350', '56', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2351', '564', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2352', '246', '1280', '128', '1280钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2353', '482', '190', '18', '190钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2354', '482', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2355', '454', '6480', '648', '6480金币（另送830，首充三倍）', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2356', '454', '300', '30', '30月卡（不计首充）', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2357', '344', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2358', '90', '900', '98', '900金币', null, '0', '龙影雪国先锋（限时抢购）', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2359', '487', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2360', '487', '300', '25', '月卡', null, '0', '若月卡生效中,则不能重复购买，如购买则变成4个60钻石', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2361', '488', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2362', '488', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2363', '488', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2364', '488', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2365', '488', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2366', '488', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2367', '488', '1', '30', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2368', '489', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2369', '489', '500', '50', '500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2370', '489', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2371', '489', '2580', '258', '2580钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2372', '489', '5180', '518', '5180钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2373', '489', '1', '30', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2374', '490', '60', '6', '60元宝包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2375', '490', '300', '30', '300元宝包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2376', '490', '680', '68', '680元宝包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2377', '490', '1980', '198', '1980元宝包', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2378', '490', '3280', '328', '3280元宝包', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2379', '490', '6480', '648', '6480元宝包', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2380', '491', '60', '6', '60金条', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2381', '491', '300', '30', '300金条', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2382', '491', '980', '98', '980金条', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2383', '491', '1980', '198', '1980金条', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2384', '491', '6480', '648', '6480金条', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2385', '374', '1', '40', '白金卡', null, '0', '白金卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2386', '492', '63', '6', '63金条包', null, '0', '促销', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2387', '492', '190', '18', '190金条包', null, '0', '促销', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2388', '492', '320', '30', '320金条包', null, '0', '促销', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2389', '492', '750', '68', '750金条包', null, '0', '促销', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2390', '492', '1890', '168', '1890金条包', null, '0', '促销', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2391', '492', '3800', '328', '3800金条包', null, '0', '促销', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2392', '492', '60', '6', '60金条包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2393', '492', '180', '18', '180金条包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2394', '492', '300', '30', '300金条包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2395', '492', '680', '68', '680金条包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2396', '493', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2397', '493', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2398', '493', '880', '88', '880钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2399', '493', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2400', '493', '3480', '348', '3480钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2401', '493', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2402', '493', '1800', '30', '白银月卡', null, '0', '白银月卡（每月仅充一次）', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2403', '493', '3800', '98', '黄金月卡', null, '0', '黄金月卡（每月仅充一次）', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2404', '494', '60', '6', '60陌陌币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2405', '494', '120', '12', '120陌陌币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2406', '494', '300', '30', '300陌陌币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2407', '494', '600', '60', '600陌陌币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2408', '494', '1080', '108', '1080陌陌币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2409', '494', '1', '12', '1个月', null, '0', '会员', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2410', '494', '3', '30', '3个月', null, '0', '会员', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2411', '494', '6', '60', '6个月', null, '0', '会员', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2412', '494', '12', '108', '12个月', null, '0', '会员', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2413', '458', '5160', '258', '5160元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2414', '458', '5960', '298', '5960元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2415', '458', '7760', '388', '7760元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2416', '458', '9760', '488', '9760元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2417', '458', '11760', '588', '11760元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2418', '458', '12960', '648', '12960元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2419', '90', '420', '50', '420金币', null, '0', '假日萝莉时装礼包', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2420', '90', '420', '50', '420金币', null, '0', '魔兽芯片', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2421', '90', '200', '25', '200金币', null, '0', '死神芯片', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2422', '90', '200', '25', '200金币', null, '0', '王虫芯片', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2423', '496', '60', '6', '60个金球', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2424', '496', '306', '30', '306个金球', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2425', '496', '1020', '98', '1020个金球', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2426', '496', '2100', '198', '2100个金球', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2427', '496', '3500', '328', '3500个金球', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2428', '496', '7128', '648', '7128个金球', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2429', '496', '1', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2430', '497', '60', '6', '60彩钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2431', '497', '980', '98', '980彩钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2432', '497', '30', '30', '300彩钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2433', '497', '1980', '198', '1980彩钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2434', '497', '3280', '328', '3280彩钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2435', '497', '6480', '648', '6480彩钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2436', '498', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2437', '498', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2438', '498', '300', '30', '300钻石礼包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2439', '498', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2440', '498', '1280', '128', '1280钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2441', '498', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2442', '498', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2443', '498', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2444', '499', '60', '6', '60宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2445', '499', '300', '30', '300宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2446', '499', '980', '98', '980宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2447', '499', '3280', '328', '3280宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2448', '499', '6480', '648', '6480宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2449', '500', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2450', '500', '190', '18', '190钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2451', '500', '530', '50', '530钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2452', '500', '1090', '98', '1090钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2453', '500', '1890', '168', '1890钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2454', '500', '4000', '348', '4000钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2455', '500', '6480', '648', '7800钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2456', '501', '60', '7', '66元宝', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2457', '501', '300', '31', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2458', '501', '980', '98', '1093元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2459', '501', '1980', '198', '2218元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2460', '501', '3280', '328', '3700元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2461', '501', '6480', '648', '7355元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2462', '502', '62', '6', '62个风车币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2463', '502', '62', '6', '62个风车币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2464', '502', '188', '18', '188风车币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2465', '502', '340', '30', '340风车币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2466', '502', '340', '30', '340风车币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2467', '502', '1568', '128', '1568风车币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2468', '502', '1568', '128', '1568风车币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2469', '503', '1', '6', '600金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2470', '503', '1', '12', '1200金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2471', '503', '1', '18', '1800金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2472', '503', '1', '30', '3000', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2473', '503', '1', '60', '6000', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2474', '503', '1', '148', '14800金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2475', '504', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2476', '504', '330', '30', '330钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2477', '504', '1200', '98', '1200钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2478', '504', '2780', '198', '2780钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2479', '504', '4920', '328', '4920钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2480', '504', '10400', '648', '10400钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2481', '505', '60', '7', '60红宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2482', '505', '300', '31', '300红宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2483', '505', '680', '68', '680红宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2484', '505', '1980', '198', '1980红宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2485', '505', '3280', '328', '3280红宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2486', '505', '6480', '648', '6480红宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2487', '506', '60', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2488', '506', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2489', '506', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2490', '506', '1280', '128', '1280钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2491', '506', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2492', '506', '4880', '488', '4880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2493', '507', '60', '7', '60钻石', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2494', '507', '315', '31', '315钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2495', '507', '735', '68', '735钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2496', '507', '1080', '98', '1080钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2497', '507', '2280', '198', '2280', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2498', '507', '3940', '328', '3940钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2499', '507', '8100', '648', '8100钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2500', '508', '2160', '188', '2160宝珠', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2501', '508', '1100', '98', '1100宝珠', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2502', '508', '60', '6', '60宝珠', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2503', '508', '330', '30', '330宝珠', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2504', '521', '1980', '200', '1980钻石成长基金(升级持续领取总价8000钻)', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2505', '508', '3500', '298', '3500宝珠', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2506', '344', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2507', '90', '420', '50', '420金币', null, '0', '女王教师（角色时装）', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2508', '120', '1', '45', '月卡', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2509', '508', '7200', '588', '7200宝珠', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2510', '422', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2511', '422', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2512', '422', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2513', '422', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2514', '422', '3180', '318', '3180元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2515', '422', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2516', '509', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2517', '509', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2518', '509', '500', '50', '500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2519', '509', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2520', '509', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2521', '509', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2522', '509', '4880', '488', '4880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2523', '509', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2524', '509', '1', '30', '30元月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2525', '511', '1', '6', 'VIP周卡', null, '0', '周卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2526', '511', '1', '30', 'VIP月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2527', '512', '480', '55', '480钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2528', '512', '980', '100', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2529', '512', '1460', '150', '1460钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2530', '512', '2000', '200', '2000钻石', null, '0', '188+12', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2531', '512', '3000', '300', '3000钻石', null, '0', '258+30+6+6', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2532', '512', '3460', '350', '3460钻石', null, '0', '328+18', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2533', '512', '3960', '400', '3960钻石', null, '0', '328+68', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2534', '512', '4980', '500', '4980钻石', null, '0', '328+128+30+6+6', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2535', '512', '5460', '550', '5460钻石', null, '0', '328+188+30', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2536', '512', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2537', '514', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2538', '514', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2539', '514', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2540', '514', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2541', '514', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2542', '514', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2543', '392', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2544', '392', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2545', '392', '400', '40', '400元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2546', '392', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2547', '392', '1280', '128', '1280元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2548', '392', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2549', '392', '2880', '288', '2880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2550', '392', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2551', '515', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2552', '515', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2553', '515', '500', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2554', '515', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2555', '515', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2556', '515', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2557', '516', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2558', '516', '310', '30', '310钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2559', '516', '1050', '98', '1050钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2560', '516', '2200', '198', '2200钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2561', '516', '5500', '488', '5500钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2562', '516', '7500', '648', '7500钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2563', '517', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2564', '517', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2565', '517', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2566', '517', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2567', '517', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2568', '517', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2569', '517', '300', '25', '300钻石月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2570', '518', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2571', '518', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2572', '518', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2573', '518', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2574', '518', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2575', '518', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2576', '518', '300', '25', '300钻石月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2577', '519', '50', '6', '50金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2578', '519', '160', '18', '160金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2579', '519', '460', '50', '460金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2580', '519', '960', '98', '960金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2581', '519', '3420', '328', '3420金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2582', '519', '8400', '648', '8400金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2583', '519', '1', '30', '军需卡', null, '0', '军需卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2584', '513', '20', '6', '20金条', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2585', '513', '40', '12', '40金条', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2586', '513', '100', '30', '100金条', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2587', '513', '200', '60', '200金条', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2588', '513', '480', '128', '480金条', null, '0', '内含赠送20%', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2589', '513', '750', '198', '750金条', null, '0', '内含赠送25%', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2590', '513', '1325', '328', '1325金条', null, '0', '内含赠送33%', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2591', '513', '3200', '648', '3200金条', null, '0', '内含赠送60', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2592', '510', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2593', '510', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2594', '510', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2595', '510', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2596', '510', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2597', '510', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2598', '510', '300', '30', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2599', '520', '300', '1', '300金币', null, '0', '新手大礼包', null, null);
INSERT INTO `cz_option_ios` VALUES ('2600', '520', '770', '30', '770金币', null, '0', '战争机器包', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2601', '520', '770', '30', '770金币', null, '0', '传奇城市包', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2602', '520', '24200', '648', '24200金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2603', '520', '9900', '328', '9900金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2604', '520', '3740', '128', '3740金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2605', '520', '1760', '68', '1760金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2606', '520', '770', '30', '770金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2607', '520', '700', '30', '700金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2608', '520', '1600', '68', '1600金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2609', '520', '3400', '128', '3400金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2610', '520', '9000', '328', '9000金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2611', '520', '22000', '648', '22000金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2612', '511', '300', '6', '300两', null, '0', '送30两', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2613', '511', '1500', '30', '1500两', null, '0', '送200两', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2614', '511', '6900', '138', '6900两', null, '0', '送1200两', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2615', '511', '15900', '318', '15900两', null, '0', '送3500两', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2616', '511', '32400', '648', '32400两', null, '0', '送9000两', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2617', '521', '1', '55', '月卡（立得300钻，每日邮件返120钻）', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2618', '521', '80', '8', '80钻石', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2619', '521', '1', '30', '300钻石', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2620', '521', '1', '150', '1460钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2621', '521', '1', '300', '2880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2622', '521', '1', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2623', '344', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2624', '344', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2625', '344', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2626', '485', '1', '60', '福利卡(永久100钻/每天,可与三卡叠加)', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2627', '522', '60', '7', '60符石', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2628', '522', '300', '31', '300符石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2629', '522', '980', '98', '980符石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2630', '522', '1980', '198', '1980符石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2631', '522', '3280', '328', '3280符石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2632', '522', '6480', '648', '6480符石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2633', '523', '60', '6', '6元证券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2634', '523', '30', '30', '30元证券', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2635', '523', '98', '98', '98元证券', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2636', '523', '198', '198', '198元证券', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2637', '523', '318', '318', '318元证券', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2638', '523', '588', '588', '588元证券', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2639', '524', '100', '12', '100钻石礼包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2640', '524', '120', '30', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2641', '524', '300', '40', '300钻石礼包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2642', '524', '500', '68', '500钻石礼包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2643', '524', '1000', '128', '1000钻石礼包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2644', '524', '3000', '388', '3000钻石礼包', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2645', '524', '5000', '648', '5000钻石礼包', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2646', '525', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2647', '525', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2648', '525', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2649', '525', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2650', '525', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2651', '525', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2652', '526', '6', '6', '6元套餐', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2653', '526', '30', '30', '30元套餐', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2654', '526', '98', '98', '98元套装', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2655', '526', '198', '198', '198元套餐', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2656', '526', '648', '648', '648元套餐', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2657', '528', '99', '6', '99子弹', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2658', '528', '299', '12', '299子弹', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2659', '528', '499', '18', '499子弹', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2660', '529', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2661', '529', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2662', '529', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2663', '529', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2664', '529', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2665', '529', '6180', '618', '6180元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2666', '530', '60', '6', '60星钻(赠6钻)', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2667', '546', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2668', '530', '300', '30', '300星钻(赠30钻)', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2669', '546', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2670', '530', '980', '98', '980星钻(赠98钻)', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2671', '530', '1', '198', '1980星钻(赠198钻)', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2672', '530', '1', '328', '3280星钻(赠328钻)', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2673', '530', '6480', '648', '6480星钻(赠648钻)', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2674', '546', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2675', '546', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2676', '531', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2677', '531', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2678', '531', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2679', '531', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2680', '531', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2681', '531', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2682', '531', '1', '30', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2683', '532', '1', '30', '一衣兜simCash', null, '0', '一衣兜simCash', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2684', '532', '1', '68', '一小堆simCash', null, '0', '一小堆simCash', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2685', '532', '1', '128', '好大一堆simCash', null, '0', '好大一堆simCash', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2686', '532', '1', '648', '一大金库simCash', null, '0', '一大金库simCash', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2687', '532', '1', '233', '一手提袋simCash', null, '0', '一手提袋simCash', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2688', '532', '1', '328', '一大袋simCash', null, '0', '一大袋simCash', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2689', '90', '420', '50', '420金币', null, '0', '国色天香（角色时装）', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2690', '546', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2691', '546', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2692', '546', '1', '30', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2693', '533', '1980', '198', '1980钻石', null, '0', '无人能挡', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2694', '533', '980', '98', '980钻石', null, '0', '主宰战场', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2695', '533', '300', '30', '300钻石', null, '0', '大杀特杀', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2696', '533', '3280', '328', '3280钻石', null, '0', '恶魔再临', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2697', '533', '6480', '648', '6480钻石', null, '0', '超神', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2698', '534', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2699', '534', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2700', '534', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2701', '534', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2702', '534', '4880', '488', '4880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2703', '534', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2704', '535', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2705', '535', '8100', '648', '8100钻石', null, '0', '含额外赠送1620钻石', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2706', '535', '315', '30', '315钻石', null, '0', '含额外赠送15钻石', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2707', '535', '748', '68', '748钻石', null, '0', '含额外赠送68钻石', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2708', '535', '1472', '128', '1472钻石', null, '0', '含额外赠送192钻石', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2709', '535', '3936', '328', '3936钻石', null, '0', '含额外赠送656钻石', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2710', '536', '0', '30', '钻石', null, '0', '贵宾卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2711', '536', '190', '18', '190钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2712', '536', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2713', '536', '760', '68', '760钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2714', '536', '1460', '128', '1460钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2715', '536', '2990', '258', '2990钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2716', '536', '330', '30', '330钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2717', '536', '7800', '648', '7800钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2718', '538', '300', '18', '300宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2719', '538', '10000', '548', '10000宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2720', '538', '3200', '198', '3200宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2721', '538', '600', '40', '600宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2722', '538', '1000', '68', '1000宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2723', '538', '5300', '308', '5300宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2724', '538', '100', '8', '100宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2725', '538', '2100', '128', '2100宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2726', '539', '85', '6', '85金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2727', '539', '350', '25', '350金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2728', '539', '1000', '78', '1000金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2729', '539', '600', '45', '600金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2730', '539', '5200', '388', '5200金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2731', '539', '9000', '648', '9000金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2732', '539', '2000', '153', '2000金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2733', '539', '3000', '233', '3000金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2734', '539', '0', '30', '金币', null, '0', '新手礼包', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2735', '540', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2736', '540', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2737', '540', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2738', '540', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2739', '540', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2740', '540', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2741', '525', '300', '30', '月卡，立得300元宝，总共可获1500元宝，分30天', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2742', '525', '980', '98', '月卡，立得980元宝，总共可获4500元宝，分30天', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2743', '525', '3280', '328', '月卡，立得3280元宝，总共可获15000元宝，分30天', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2744', '515', '300', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2745', '529', '120', '12', '120元宝', null, '0', '半月优惠(获120元宝+15天特权)', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2746', '529', '250', '25', '250元宝', null, '0', '月优惠(获250元宝+30天特权，若月卡已经生效中,则自动充值18元和6元面额，达不到25元的充值面额)', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2747', '529', '500', '50', '500元宝', null, '0', '双月优惠(获500元宝+60天特权，若月卡已经生效中,则自动充值48元面额，达不到50元的充值面额)', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2748', '543', '60', '6', '60金票', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2749', '543', '300', '30', '300金票', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2750', '543', '630', '60', '630金票', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2751', '543', '1920', '178', '1920金票', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2752', '543', '3250', '298', '3250金票', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2753', '545', '62', '6', '62钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2754', '545', '750', '68', '750钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2755', '545', '2280', '198', '2280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2756', '545', '320', '30', '320钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2757', '545', '5780', '488', '5780钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2758', '545', '1320', '118', '1320钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2759', '544', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2760', '544', '182', '18', '182钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2761', '544', '310', '30', '310钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2762', '544', '730', '68', '730钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2763', '544', '1400', '128', '1400钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2764', '544', '3700', '328', '3700钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2765', '544', '7500', '648', '7500钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2766', '336', '30', '30', '30点卷', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2767', '547', '1', '25', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2768', '548', '3000', '30', '3000元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2769', '548', '9800', '98', '9800元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2770', '548', '19800', '198', '19800元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2771', '548', '32800', '328', '32800元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2772', '548', '64800', '648', '64800元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2773', '549', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2774', '549', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2775', '549', '680', '68', '680金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2776', '549', '1980', '198', '1980金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2777', '549', '3280', '328', '3280金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2778', '549', '6480', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2779', '547', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2780', '547', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2781', '547', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2782', '547', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2783', '547', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2784', '547', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2785', '550', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2786', '550', '1', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2787', '550', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2788', '550', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2789', '550', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2790', '550', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2791', '551', '162', '6', '162魔石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2792', '551', '810', '30', '810魔石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2793', '551', '1836', '68', '1836魔石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2794', '551', '3456', '128', '3456魔石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2795', '551', '8856', '328', '8856魔石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2796', '551', '17496', '648', '17496魔石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2797', '552', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2798', '552', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2799', '552', '500', '50', '500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2800', '552', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2801', '552', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2802', '552', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2803', '552', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2804', '553', '6', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2805', '553', '30', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2806', '553', '98', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2807', '553', '198', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2808', '553', '328', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2809', '553', '648', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2810', '554', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2811', '554', '500', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2812', '554', '120', '12', '120元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2813', '554', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2814', '554', '1080', '108', '1080元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2815', '554', '2080', '208', '2080元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2816', '554', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2817', '554', '3880', '388', '3880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2818', '554', '3080', '308', '3080元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2819', '555', '60', '7', '60钻石', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2820', '555', '1', '25', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2821', '555', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2822', '555', '1280', '128', '1280钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2823', '555', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2824', '555', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2825', '555', '2580', '258', '2580钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2826', '556', '60', '6', '60宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2827', '556', '320', '30', '320宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2828', '556', '1080', '98', '1080宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2829', '556', '2200', '198', '2200宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2830', '556', '7800', '648', '7800宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2831', '556', '3800', '328', '3800宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2832', '558', '50', '12', '50钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2833', '558', '130', '30', '130钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2834', '558', '275', '68', '275钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2835', '558', '600', '128', '600钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2836', '558', '1700', '328', '1700钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2837', '558', '3750', '648', '3750钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2838', '559', '12000', '12', '12000游戏币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2839', '559', '36000', '30', '36000游戏币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2840', '559', '80000', '68', '80000游戏币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2841', '559', '192000', '128', '192000游戏币', null, '0', '1', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2842', '559', '500000', '328', '500000游戏币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2843', '559', '1100000', '648', '1100000游戏币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2844', '553', '60', '6', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2845', '553', '300', '30', '月卡', null, '0', '月卡（如月卡未到期不能购买）', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2846', '560', '10', '1', '10钻石', null, '1', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('2847', '560', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2848', '560', '180', '18', '180钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2849', '560', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2850', '560', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2851', '560', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2852', '560', '1680', '168', '1680钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2853', '560', '3480', '348', '3480钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2854', '561', '60', '6', '60水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2855', '561', '250', '25', '250水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2856', '561', '300', '30', '300水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2857', '561', '500', '50', '500水晶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2858', '561', '980', '98', '980水晶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2859', '561', '1980', '198', '1980水晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2860', '561', '2880', '288', '2880水晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2861', '561', '3280', '328', '3280水晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2862', '561', '6480', '6448', '6480水晶', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2863', '562', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2864', '562', '320', '30', '320金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2865', '562', '750', '68', '750金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2866', '562', '1085', '98', '1085', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2867', '562', '2310', '198', '2310金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2868', '562', '3950', '328', '3950金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2869', '562', '8100', '648', '8100金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2870', '563', '50', '6', '50宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2871', '563', '160', '18', '160宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2872', '563', '460', '50', '460宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2873', '563', '960', '98', '960宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2874', '563', '3420', '328', '3420宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2875', '563', '8400', '648', '8400宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2876', '288', '7580', '648', '7580钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2877', '564', '250', '25', '300钻石', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2878', '564', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2879', '564', '600', '60', '600钻石', null, '0', '至尊卡', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2880', '564', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2881', '564', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2882', '564', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2883', '564', '6480', '648', '6480钻石', null, '0', '双倍积分', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2884', '565', '10', '1', '10钻石', null, '1', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('2885', '565', '30', '3', '30钻石', null, '1', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('2886', '565', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2887', '565', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2888', '565', '680', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2889', '565', '1680', '168', '1680钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2890', '565', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2891', '565', '4880', '488', '4880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2892', '566', '10', '1', '10玉帛', null, '1', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('2893', '566', '300', '30', '300玉帛', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2894', '566', '980', '98', '980玉帛', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2895', '566', '1980', '198', '1980玉帛', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2896', '566', '4880', '488', '4880玉帛', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2897', '567', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2898', '567', '300', '30', '300钻石', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2899', '567', '500', '50', '500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2900', '567', '1080', '108', '1080钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2901', '567', '3080', '308', '3080钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2902', '567', '5180', '518', '5180钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2903', '568', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2904', '568', '180', '18', '180钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2905', '568', '300', '30', '300钻石', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2906', '568', '780', '78', '780钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2907', '568', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2908', '568', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2909', '568', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2910', '569', '60', '6', '60水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2911', '569', '300', '30', '300水晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2912', '569', '1080', '108', '1080水晶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2913', '569', '1980', '198', '1980水晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2914', '569', '3280', '328', '3280水晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2915', '569', '5880', '588', '5880水晶', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2916', '570', '12000', '12', '12000积分包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2917', '570', '32000', '30', '32000积分包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2918', '570', '70000', '68', '70000积分包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2919', '570', '168000', '128', '168000积分包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2920', '570', '480000', '328', '480000积分包', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2921', '570', '1200000', '648', '1200000积分包', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2922', '570', '200', '12', '200代币包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2923', '570', '525', '30', '525代币包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2924', '570', '1100', '68', '1100代币包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2925', '570', '2400', '128', '2400代币包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2926', '570', '6500', '328', '6500代币包', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2927', '570', '15000', '648', '15000代币包', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2928', '570', '0', '12', 'D级赛车包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2929', '570', '0', '18', 'C级赛车包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2930', '570', '0', '30', '标准赛车包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2931', '570', '0', '68', 'B级赛车包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2932', '570', '0', '128', '狂野飙车高级包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2933', '570', '0', '163', 'A级赛车包', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2934', '570', '0', '168', '首发高级包', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2935', '570', '0', '328', 'S级赛车包', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2936', '570', '0', '648', '飞行高级包', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2937', '571', '70', '6', '70宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2938', '571', '150', '12', '150宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2939', '571', '500', '30', '500宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2940', '571', '1250', '68', '1250宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2941', '571', '2750', '128', '2750宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2942', '571', '7000', '328', '7000宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2943', '571', '15000', '648', '15000宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2944', '572', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2945', '572', '0', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2946', '572', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2947', '572', '750', '68', '750元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2948', '572', '0', '98', '月卡', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2949', '572', '2280', '198', '2280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2950', '572', '3780', '328', '3780元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2951', '572', '7780', '648', '7780元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2952', '573', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2953', '573', '120', '12', '120钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2954', '573', '0', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2955', '573', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2956', '573', '748', '68', '748钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2957', '573', '1430', '128', '1430钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2958', '573', '7380', '648', '7380钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2959', '574', '600', '6', '600元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2960', '574', '1200', '12', '1200元宝包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2961', '574', '3000', '30', '3000元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2962', '574', '5000', '50', '5000元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2963', '574', '11800', '118', '11800元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2964', '574', '25800', '258', '25800元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2965', '574', '38800', '388', '38800元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2966', '574', '64800', '648', '64800元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2967', '575', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2968', '575', '0', '6', '周卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2969', '575', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2970', '575', '500', '50', '500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2971', '575', '0', '50', '月卡', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2972', '575', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2973', '575', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2974', '575', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2975', '575', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2976', '576', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2977', '576', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2978', '576', '300', '30', '300钻石', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2979', '576', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2980', '576', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2981', '576', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2982', '576', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2983', '577', '66', '6', '66元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2984', '577', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2985', '577', '555', '50', '555元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2986', '577', '1100', '98', '1100元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2987', '577', '2280', '198', '2280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2988', '577', '3800', '328', '3800元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('2989', '577', '7600', '648', '7600元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2990', '578', '12', '6', '12红钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2991', '578', '24', '12', '24红钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2992', '578', '60', '30', '60红钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2993', '578', '136', '68', '136红钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2994', '578', '256', '128', '256红钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('2995', '578', '1296', '648', '1296红钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('2996', '579', '60', '6', '60黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2997', '579', '250', '25', '250黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2998', '579', '300', '30', '300黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('2999', '579', '400', '40', '400黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3000', '579', '600', '60', '600黄金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3001', '579', '680', '68', '680黄金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3002', '579', '1280', '128', '1280黄金', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3003', '579', '2580', '258', '2580黄金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3004', '579', '4880', '488', '4880黄金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3005', '579', '6480', '648', '6480黄金', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3006', '580', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3007', '580', '50000', '6', '50000铜钱', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3008', '580', '200', '18', '200钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3009', '580', '165000', '18', '165000铜钱', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3010', '580', '800', '68', '800钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3011', '580', '680000', '68', '680000铜钱', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3012', '580', '1200', '98', '1200钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3013', '580', '1060000', '98', '1060000铜钱', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3014', '580', '2700', '198', '2700钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3015', '580', '2310000', '198', '2310000铜钱', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3016', '581', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3017', '581', '310', '30', '310金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3018', '581', '525', '50', '525金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3019', '581', '1060', '98', '1060金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3020', '581', '3970', '328', '3970金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3021', '581', '8680', '648', '8680金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3022', '581', '300', '25', '300金币超值礼包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3023', '581', '600', '60', '600金币豪华礼包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3024', '581', '2000', '188', '2000金币奢华礼包', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3025', '581', '2240', '198', '2240金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3026', '582', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3027', '582', '180', '18', '180', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3028', '582', '500', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3029', '582', '1288', '128', '1288元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3030', '582', '2088', '208', '2088元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3031', '582', '3188', '328', '3188元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3032', '582', '4888', '488', '4888元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3033', '582', '6488', '648', '6488元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3034', '583', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3035', '583', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3036', '583', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3037', '583', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3038', '583', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3039', '583', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3040', '584', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3041', '584', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3042', '584', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3043', '584', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3044', '584', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3045', '584', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3046', '585', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3047', '585', '250', '25', '250钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3048', '585', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3049', '585', '120', '12', '120钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3050', '585', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3051', '585', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3052', '585', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3053', '585', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3054', '586', '10', '1', '10元宝', null, '1', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('3055', '586', '62', '7', '62元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3056', '586', '30', '3', '30元宝', null, '1', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('3057', '586', '540', '50', '540元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3058', '586', '1188', '108', '1188元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3059', '586', '3739', '328', '3739元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3060', '586', '5660', '488', '5660元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3061', '586', '7776', '648', '7776元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3062', '587', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3063', '587', '0', '25', '月卡', null, '0', '如月卡未过期，则自动充成元宝', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3064', '587', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3065', '587', '500', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3066', '587', '0', '50', '月卡', null, '0', '如月卡未过期，则自动充成元宝', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3067', '587', '1280', '128', '1280元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3068', '587', '2880', '288', '2880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3069', '587', '5480', '548', '5480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3070', '587', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3071', '588', '60', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3072', '588', '150', '12', '150金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3073', '588', '450', '30', '450金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3074', '589', '66', '6', '66元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3075', '589', '330', '30', '330元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3076', '589', '1165', '98', '1165元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3077', '589', '2178', '198', '2178元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3078', '589', '4222', '328', '4222元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3079', '589', '7128', '648', '7128元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3080', '590', '60', '6', '60宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3081', '590', '300', '30', '300宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3082', '590', '1280', '128', '1280宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3083', '590', '3880', '388', '3880宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3084', '590', '6480', '648', '6480宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3085', '590', '300', '30', '300宝石', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3086', '590', '1280', '128', '1280宝石', null, '0', '月卡', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3087', '590', '3880', '388', '3880宝石', null, '0', '月卡', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3088', '591', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3089', '591', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3090', '591', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3091', '591', '1080', '108', '1080元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3092', '591', '3080', '308', '3080元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3093', '591', '5180', '518', '5180元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3094', '90', '900', '98', '900金币', null, '0', '王者（限时抢购）', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3095', '90', '420', '50', '420金币', null, '0', '王者（限时抢购）', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3096', '90', '900', '98', '900金币', null, '0', '4星电蝎（限时抢购）', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3097', '90', '420', '50', '420金币', null, '0', '特惠女王时装（限时抢购）', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3098', '90', '420', '50', '420', null, '0', '全副武装宝箱（限时抢购）', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3099', '90', '420', '50', '420金币', null, '0', '赤炎战机（限时抢购）', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3100', '512', '12960', '1296', '12960钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3101', '512', '19440', '1944', '19440钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3102', '592', '300', '30', '300元宝', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3103', '592', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3104', '592', '315', '30', '315元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3105', '592', '700', '68', '700元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3106', '592', '1500', '128', '1500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3107', '592', '4000', '328', '4000元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3108', '592', '8888', '648', '8888元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3109', '593', '260', '68', '260钻石', null, '0', '礼包', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3110', '593', '800', '198', '800钻石', null, '0', '礼包', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3111', '593', '1400', '328', '1400钻石', null, '0', '礼包', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3112', '593', '3000', '648', '3000钻石', null, '0', '礼包', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3113', '90', '2000', '198', '2000金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3114', '90', '200', '25', '200金币', null, '0', '王虫芯片', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3115', '553', '32400', '3240', '32400钻石', null, '1', '三倍积分', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3116', '555', '32400', '3000', '32400钻石', null, '1', '优惠240元', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3117', '555', '32400', '3000', '32400钻石', null, '1', '优惠240元', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3118', '288', '37900', '3240', '37900钻石', null, '1', '三倍积分', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3119', '501', '32400', '3000', '36775元宝', null, '1', '优惠240元', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3120', '112', '32400', '3000', '32400钻石', null, '0', '优惠240元', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3121', '530', '1', '298', '终生捷径礼包', null, '0', '终生捷径礼包', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3122', '530', '1', '25', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3123', '530', '1', '128', '成长计划', null, '0', '成长计划', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3124', '594', '0', '12', '周卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3125', '594', '0', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3126', '594', '0', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3127', '594', '0', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3128', '594', '0', '50', '500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3129', '594', '0', '108', '1080钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3130', '594', '0', '208', '2080钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3131', '594', '0', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3132', '594', '0', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3133', '595', '0', '25', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3134', '595', '0', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3135', '595', '0', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3136', '595', '0', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3137', '595', '0', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3138', '595', '0', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3139', '595', '0', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3140', '596', '0', '25', '黄金礼包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3141', '596', '0', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3142', '596', '0', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3143', '596', '0', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3144', '596', '0', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3145', '596', '0', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3146', '596', '0', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3147', '597', '0', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3148', '597', '0', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3149', '597', '0', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3150', '597', '0', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3151', '597', '0', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3152', '597', '0', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3153', '598', '0', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3154', '598', '300', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3155', '598', '0', '68', '680金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3156', '598', '0', '98', '980金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3157', '598', '0', '128', '1280金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3158', '598', '0', '198', '1980金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3159', '598', '0', '328', '3280金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3160', '598', '0', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3161', '599', '0', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3162', '599', '0', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3163', '599', '0', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3164', '599', '0', '168', '168元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3165', '599', '0', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3166', '599', '0', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3167', '600', '0', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3168', '600', '0', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3169', '600', '0', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3170', '601', '0', '6', '1000点卷', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3171', '601', '0', '30', '5000点卷', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3172', '601', '0', '68', '10000点卷', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3173', '601', '0', '128', '20000点卷', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3174', '601', '0', '258', '40000点卷', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3175', '601', '0', '448', '70000点卷', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3176', '601', '0', '648', '100000点卷', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3177', '602', '0', '30', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3178', '602', '0', '68', '套餐大礼包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3179', '602', '0', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3180', '602', '0', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3181', '602', '0', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3182', '602', '0', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3183', '602', '0', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3184', '603', '0', '6', '60虎符', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3185', '603', '0', '12', '120虎符', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3186', '603', '0', '30', '300虎符', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3187', '603', '0', '60', '600虎符', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3188', '603', '1200', '118', '1200虎符', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3189', '603', '0', '198', '2000虎符', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3190', '603', '0', '298', '3000虎符', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3191', '603', '0', '588', '6000虎符', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3192', '604', '0', '6', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3193', '604', '0', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3194', '604', '0', '98', '980金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3195', '604', '0', '198', '1980金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3196', '604', '0', '328', '3280金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3197', '604', '0', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3198', '605', '0', '30', '钻石礼包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3199', '605', '0', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3200', '605', '0', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3201', '605', '0', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3202', '605', '0', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3203', '605', '0', '388', '3880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3204', '605', '0', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3205', '606', '0', '6', '60黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3206', '606', '0', '30', '300黄金', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3207', '606', '0', '980', '980黄金', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3208', '606', '0', '198', '1980黄金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3209', '606', '0', '328', '3280黄金', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3210', '606', '0', '648', '6480黄金', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3211', '607', '0', '6', '600R币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3212', '607', '0', '30', '3000R币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3213', '607', '0', '98', '9800R币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3214', '607', '0', '198', '19800R币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3215', '607', '0', '388', '38800R币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3216', '607', '0', '648', '64800R币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3217', '608', '0', '6', '元宝袋', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3218', '608', '0', '50', '元宝盆', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3219', '608', '0', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3220', '608', '0', '18', '180元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3221', '608', '0', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3222', '608', '0', '128', '1280元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3223', '608', '0', '208', '2080元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3224', '608', '0', '318', '3180元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3225', '608', '0', '488', '4880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3226', '608', '0', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3227', '609', '0', '6', '10000灵魂点', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3228', '609', '0', '18', '40000灵魂点', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3229', '609', '0', '40', '100000灵魂点', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3230', '609', '0', '6', '10颗龙魂珠', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3231', '609', '0', '18', '40颗龙魂珠', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3232', '609', '0', '40', '200颗龙魂珠', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3233', '609', '0', '6', '忍者皮肤', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3234', '609', '0', '6', '摔跤手皮肤', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3235', '609', '0', '12', '熊猫人皮肤', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3236', '609', '0', '18', '舞者皮肤', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3237', '610', '0', '25', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3238', '610', '0', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3239', '610', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3240', '610', '0', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3241', '610', '0', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3242', '610', '0', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3243', '610', '0', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3244', '611', '0', '6', '60金砖', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3245', '611', '0', '30', '320金砖', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3246', '611', '0', '128', '1400金砖', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3247', '611', '0', '328', '3700金砖', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3248', '612', '0', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3249', '612', '0', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3250', '612', '0', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3251', '612', '0', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3252', '612', '1', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3253', '612', '0', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3254', '613', '0', '6', '600元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3255', '613', '0', '12', '1200元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3256', '613', '0', '30', '3000元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3257', '613', '0', '68', '6800元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3258', '613', '0', '128', '12800元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3259', '613', '0', '328', '32800元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3260', '614', '0', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3261', '586', '0', '31', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3262', '614', '0', '25', '250钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3263', '614', '0', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3264', '614', '0', '60', '600钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3265', '614', '0', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3266', '614', '0', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3267', '614', '0', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3268', '614', '0', '488', '4880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3269', '614', '0', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3270', '615', '0', '30', '55宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3271', '615', '0', '68', '120宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3272', '615', '0', '128', '250宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3273', '615', '460', '233', '460宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3274', '615', '0', '328', '690宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3275', '615', '0', '648', '1400宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3276', '584', '300', '30', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3277', '112', '5860', '600', '5860钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3278', '112', '4860', '500', '4860钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3279', '632', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3280', '632', '1', '25', '钻石福袋', null, '0', '钻石福袋', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3281', '485', '600', '60', '补单', null, '1', '补单', null, null);
INSERT INTO `cz_option_ios` VALUES ('3282', '474', '444', '450', '4440元宝', null, '0', '328+98+18', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3283', '589', '1', '88', '半年卡', null, '0', '半年卡', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3284', '564', '32400', '3240', '32400钻石', null, '0', '三倍积分', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3285', '76', '70000', '3240', '70000宝石', null, '0', '三倍积分', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3286', '247', '70000', '3240', '70000钻石', null, '0', '三倍积分', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3287', '589', '1', '188', '终身卡', null, '0', '终身卡', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3288', '589', '1', '25', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3289', '505', '0', '98', '套餐', null, '0', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('3290', '505', '0', '45', '每月一次', null, '0', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('3291', '505', '0', '238', '每月一次', null, '0', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('3292', '505', '0', '488', '每月一次', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3293', '587', '1', '9', '', null, '1', '补拍', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3294', '616', '0', '6', '周卡', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3295', '616', '0', '25', '月卡', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3296', '616', '0', '7', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3297', '616', '0', '30', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3298', '616', '0', '98', '980金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3299', '616', '0', '328', '3280金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3300', '616', '0', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3301', '617', '0', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3302', '617', '0', '30', '300钻石', null, '0', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('3303', '617', '0', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3304', '617', '0', '128', '1280钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3305', '617', '0', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3306', '617', '0', '488', '488钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3307', '618', '0', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3308', '618', '1', '25', '250元宝', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3309', '618', '0', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3310', '618', '0', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3311', '618', '0', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3312', '618', '0', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3313', '618', '0', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3314', '619', '0', '6', '60仙玉', null, '1', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('3315', '619', '0', '55', '500仙玉', null, '1', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3316', '619', '0', '100', '980仙玉', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3317', '619', '0', '150', '1480仙玉', null, '1', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3318', '619', '0', '200', '1980仙玉', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3319', '619', '0', '300', '2980仙玉', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3320', '619', '0', '350', '3480仙玉', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3321', '619', '0', '648', '6480', null, '1', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3322', '620', '0', '6', '60钻石大礼包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3323', '620', '0', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3324', '620', '0', '30', '300钻石大礼包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3325', '620', '0', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3326', '620', '0', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3327', '620', '0', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3328', '620', '0', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3329', '620', '0', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3330', '621', '0', '6', '60符石', null, '0', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('3331', '621', '0', '25', '300符石礼包', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3332', '621', '0', '30', '300符石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3333', '621', '0', '98', '980符石首充礼包', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3334', '621', '0', '198', '1980符石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3335', '621', '0', '328', '3280符石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3336', '621', '0', '648', '6480符石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3337', '622', '0', '6', '60钻石', null, '0', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('3338', '622', '0', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3339', '622', '0', '68', '680钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3340', '622', '0', '168', '1680钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3341', '622', '0', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3342', '622', '0', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3343', '623', '0', '6', '60元宝', null, '0', '', null, null);
INSERT INTO `cz_option_ios` VALUES ('3344', '623', '0', '25', '月卡', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3345', '623', '0', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3346', '623', '0', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3347', '623', '0', '198', '1980', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3348', '623', '0', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3349', '623', '0', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3350', '624', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3351', '624', '315', '30', '315钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3352', '624', '1060', '98', '1060钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3353', '624', '2180', '198', '2180钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3354', '624', '3880', '328', '3880钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3355', '624', '1', '648', '7780钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3356', '616', '0', '198', '1980金币', null, '0', '', '1', null);
INSERT INTO `cz_option_ios` VALUES ('3357', '597', '1', '30', '月卡', null, '0', '如月卡未过期或者重复下单，则自动充值成为钻石', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3358', '38', '14900', '1296', '14900钻石', null, '0', '', '1', null);
INSERT INTO `cz_option_ios` VALUES ('3359', '625', '600', '6', '600蓝钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3360', '625', '3000', '30', '3000蓝钻', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3361', '625', '9800', '98', '9800蓝钻', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3362', '625', '1', '30', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3363', '625', '19800', '198', '19800蓝钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3364', '625', '1', '98', '成长基金', null, '0', '成长基金', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3365', '625', '64800', '648', '64800蓝钻', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3366', '625', '32800', '328', '32800蓝钻', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3367', '626', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3368', '626', '100', '30', '月卡', null, '0', '100元宝/30天', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3369', '626', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3370', '626', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3371', '626', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3372', '626', '100', '78', '季卡', null, '0', '100元宝/季卡', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3373', '626', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3374', '626', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3375', '626', '100', '288', '年卡', null, '0', '100元宝/360天', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3376', '627', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3377', '627', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3378', '627', '680', '68', '680元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3379', '627', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3380', '627', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3381', '627', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3382', '628', '66', '6', '66元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3383', '628', '332', '30', '322元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3384', '628', '132', '12', '132元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3385', '628', '7260', '648', '7260元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3386', '628', '756', '68', '756元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3387', '628', '1425', '128', '1425元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3388', '628', '3670', '328', '3670元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3389', '629', '60', '6', '60紫晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3390', '629', '330', '30', '330紫晶', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3391', '629', '7056', '588', '7056紫晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3392', '629', '1078', '98', '1078紫晶', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3393', '629', '2277', '198', '2277紫晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3394', '629', '3280', '328', '3280紫晶', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3395', '630', '60', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3396', '630', '300', '31', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3397', '630', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3398', '630', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3399', '630', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3400', '630', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3401', '632', '1', '198', '成长基金（限购一次）', null, '0', '成长基金（限购一次）', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3402', '632', '1280', '128', '1280钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3403', '632', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3404', '632', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3405', '631', '60', '6', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3406', '631', '300', '30', '300元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3407', '631', '500', '50', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3408', '631', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3409', '631', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3410', '631', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3411', '631', '4880', '488', '4880元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3412', '631', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3413', '480', '500', '55', '500元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3414', '480', '9800', '100', '980元宝', null, '0', '68+30', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3415', '480', '10300', '150', '1030元宝', null, '0', '68+30+25+25', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3416', '480', '1980', '200', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3417', '480', '20300', '250', '2030元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3418', '480', '2960', '300', '2960元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3419', '480', '3460', '350', '3460元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3420', '480', '3960', '400', '3960元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3421', '480', '4430', '450', '4430元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3422', '480', '5000', '500', '5000元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3423', '480', '5500', '550', '5500元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3424', '480', '5980', '600', '5980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3425', '619', '3960', '400', '3960仙玉', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3426', '619', '1', '500', '5000仙玉', null, '1', '5000', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3427', '619', '5980', '600', '5980仙玉', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3428', '619', '4460', '450', '4460仙玉', null, '1', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3429', '474', '544', '550', '5440元宝', null, '0', '328+198+18', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3430', '474', '5940', '600', '5940元宝', null, '0', '328+198+68', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3431', '633', '45300', '100', '45300两', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3432', '633', '7300', '150', '7300两', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3433', '633', '9900', '200', '9900两', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3434', '633', '14400', '300', '14400两', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3435', '633', '17300', '350', '17300两', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3436', '633', '19700', '400', '19700两', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3437', '633', '22400', '450', '22400两', null, '0', '328+60+60', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3438', '633', '24600', '500', '24600两', null, '0', '328+128+30+6', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3439', '633', '29600', '600', '29600两', null, '0', '328+198+60+6', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3440', '633', '32400', '650', '32400两', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3441', '587', '6480', '195', '补648一单', null, '1', '补单', '1', null);
INSERT INTO `cz_option_ios` VALUES ('3442', '634', '60', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3443', '634', '250', '25', '250钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3444', '634', '600', '60', '600钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3445', '634', '315', '30', '315', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3446', '634', '1080', '98', '1080钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3447', '634', '730', '68', '730钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3448', '634', '2230', '198', '2230钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3449', '634', '7630', '648', '7630钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3450', '634', '3780', '328', '3780钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3451', '619', '19440', '1944', '19440仙玉', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3452', '635', '60', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3453', '635', '190', '19', '180钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3454', '635', '730', '68', '730钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3455', '635', '1060', '98', '1060钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3456', '635', '2168', '198', '2168钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3457', '635', '3608', '328', '3608钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3458', '635', '7248', '648', '7248钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3459', '636', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3460', '636', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3461', '636', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3462', '636', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3463', '636', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3464', '636', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3465', '637', '50', '6', '50宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3466', '637', '250', '30', '250宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3467', '637', '880', '98', '880宝石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3468', '637', '260', '30', '260宝石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3469', '637', '6750', '648', '6750宝石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3470', '637', '1850', '198', '1850宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3471', '637', '3330', '328', '3330宝石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3472', '638', '60', '6', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3473', '638', '300', '30', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3474', '638', '300', '30', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3475', '638', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3476', '638', '600', '60', '600钻石至尊卡', null, '0', '600钻石至尊卡', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3477', '638', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3478', '638', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3479', '638', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3480', '639', '310', '31', '310钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3481', '639', '60', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3482', '639', '190', '19', '190钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3483', '639', '7800', '648', '7800钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3484', '639', '760', '68', '760钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3485', '639', '1460', '128', '1460钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3486', '639', '2990', '258', '2990钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3487', '640', '60', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3488', '640', '300', '31', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3489', '640', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3490', '640', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3491', '640', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3492', '640', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3493', '641', '60', '7', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3494', '641', '1', '26', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3495', '641', '1', '108', '终身卡', null, '0', '终身卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3496', '641', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3497', '641', '300', '31', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3498', '641', '1', '68', '季卡', null, '0', '季卡', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3499', '641', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3500', '641', '3280', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3501', '642', '60', '7', '60', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3502', '642', '1', '26', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3503', '642', '1', '26', '战神基金', null, '0', '战神基金', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3504', '642', '980', '98', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3505', '642', '300', '31', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3506', '642', '1', '50', '天神基金', null, '0', '天神基金', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3507', '642', '500', '50', '500钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3508', '642', '1', '98', '超神基金', null, '0', '超神基金', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3509', '642', '1980', '198', '1980钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3510', '642', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3511', '643', '60', '7', '60元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3512', '643', '1', '31', '豪杰令', null, '0', '豪杰令', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3513', '643', '250', '26', '250元宝', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3514', '643', '980', '98', '980元宝', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3515', '643', '1980', '198', '1980元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3516', '643', '3280', '328', '3280元宝', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3517', '643', '1', '168', '江湖令', null, '0', '江湖令', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3518', '643', '6480', '648', '6480元宝', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3519', '644', '60', '7', '60金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3520', '644', '500', '50', '500金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3521', '644', '300', '31', '300金币', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3522', '644', '1080', '108', '1080金币', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3523', '644', '6480', '648', '6480金币', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3524', '644', '2280', '228', '2280金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3525', '644', '3280', '328', '3280金币', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3526', '645', '200', '19', '200精灵石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3527', '645', '60', '7', '60精灵石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3528', '645', '300', '26', '300精灵石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3529', '645', '8000', '648', '8000精灵石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3530', '645', '1100', '98', '1100精灵石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3531', '645', '2280', '198', '2280精灵石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3532', '645', '3940', '328', '3940精灵石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3533', '646', '60', '9', '60钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3534', '646', '300', '33', '300钻石', null, '0', '', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3535', '646', '300', '28', '月卡', null, '0', '月卡', '2', null);
INSERT INTO `cz_option_ios` VALUES ('3536', '646', '6480', '648', '6480钻石', null, '0', '', '5', null);
INSERT INTO `cz_option_ios` VALUES ('3537', '646', '980', '100', '980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3538', '646', '1980', '200', '1980钻石', null, '0', '', '3', null);
INSERT INTO `cz_option_ios` VALUES ('3539', '646', '330', '328', '3280钻石', null, '0', '', '4', null);
INSERT INTO `cz_option_ios` VALUES ('3540', '6', '122', '111', '111元 = 122钻石( 111 )', '1', '1', '111', '2', null);

-- ----------------------------
-- Table structure for cz_option_ios_discount
-- ----------------------------
DROP TABLE IF EXISTS `cz_option_ios_discount`;
CREATE TABLE `cz_option_ios_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_price` float DEFAULT NULL,
  `number` smallint(6) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cz_option_ios_discount
-- ----------------------------
INSERT INTO `cz_option_ios_discount` VALUES ('12', '648', '1', '0.98');
INSERT INTO `cz_option_ios_discount` VALUES ('13', '648', '2', '0.97');
INSERT INTO `cz_option_ios_discount` VALUES ('14', '648', '4', '0.95');
INSERT INTO `cz_option_ios_discount` VALUES ('15', '648', '8', '0.9');

-- ----------------------------
-- Table structure for cz_order_android
-- ----------------------------
DROP TABLE IF EXISTS `cz_order_android`;
CREATE TABLE `cz_order_android` (
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `customer_user_id` int(11) DEFAULT NULL,
  `game_account_id` int(11) DEFAULT NULL,
  `option_id` varchar(64) DEFAULT NULL,
  `bought_num` smallint(6) DEFAULT NULL,
  `real_payment` float DEFAULT NULL,
  `details` varchar(512) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `callback_url` varchar(512) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `pay_way` varchar(256) DEFAULT NULL,
  `can_modify` tinyint(1) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cz_order_android
-- ----------------------------

-- ----------------------------
-- Table structure for cz_order_ios
-- ----------------------------
DROP TABLE IF EXISTS `cz_order_ios`;
CREATE TABLE `cz_order_ios` (
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `customer_user_id` int(11) DEFAULT NULL,
  `game_account_id` int(11) DEFAULT NULL,
  `option_id` varchar(64) DEFAULT NULL,
  `bought_num` smallint(6) DEFAULT NULL,
  `real_payment` float DEFAULT NULL,
  `details` varchar(512) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `pay_way` varchar(256) DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `callback_url` varchar(512) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  `can_modify` tinyint(1) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `id_no` varchar(16) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `show` tinyint(1) DEFAULT NULL,
  `is_sc` tinyint(1) DEFAULT NULL,
  `is_star` tinyint(1) DEFAULT NULL,
  `card_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cz_order_ios
-- ----------------------------
INSERT INTO `cz_order_ios` VALUES ('2015-09-24 09:43:01', '2015-11-24 11:45:00', '78', '113', null, '263', '588', '1', '6', '6元=60元宝', '1', 'mobile_alipay', '2015-09-24 09:51:19', '/Home/CZIOS/chongzhi_doing/orderId/78', '4', '0', '72', null, '161443059479', '222', '72', null, null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-09-24 10:15:43', '2015-11-24 11:45:00', '79', '113', null, '264', '588', '1', '6', '6元=60元宝', '1', 'mobile_alipay', '2015-09-24 10:15:47', '/Home/CZIOS/chongzhi_doing/orderId/79', '3', '0', '72', null, '161443060947', '', '72', null, null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-09-25 11:46:46', '2015-11-24 11:45:00', '81', '113', null, '266', '588', '2', '12', '6元=60元宝', '1', 'alipay', '2015-09-25 11:46:51', '/Home/CZIOS/chongzhi_doing/orderId/81', '2', '0', '72', null, '161443152811', '654321', '72', null, null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-09-25 14:31:50', '2015-11-24 11:45:00', '82', '113', null, '267', '588', '2', '12', '6元=60元宝', '1', 'wx', '2015-09-25 14:33:12', '/Home/CZIOS/chongzhi_doing/orderId/82', '6', '0', '72', null, '161443162792', '', '72', null, null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-09-25 15:26:37', '2015-11-24 11:45:00', '83', '113', null, '268', '588', '1', '6', '6元=60元宝', '1', 'mobile_alipay', '2015-09-25 15:26:41', '/Home/CZIOS/chongzhi_doing/orderId/83', '3', '0', '72', null, '161443166001', '', '72', null, null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-09-25 15:31:02', '2015-11-24 11:45:00', '84', '113', null, '269', '588', '1', '6', '6元=60元宝', '1', 'mobile_alipay', '2015-09-25 15:31:07', '/Home/CZIOS/chongzhi_doing/orderId/84', '3', '0', '72', null, '161443166267', '', '72', null, null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-09-28 10:52:47', '2015-11-24 11:45:00', '88', '113', null, '273', '588', '1', '6', '6元=60元宝', '1', 'hb', '2015-09-28 10:52:53', '/Home/CZIOS/chongzhi_doing/orderId/88', '1', '0', null, null, '161443408773', 'dfgs', '72', null, null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-09-28 10:53:17', '2015-11-24 11:45:00', '89', '113', null, '274', '588', '1', '6', '6元=60元宝', '1', 'hb', '2015-09-28 11:16:15', '/Home/CZIOS/chongzhi_doing/orderId/89', '2', '0', '72', null, '161443410175', '', '72', null, null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-09-28 11:26:58', '2015-11-24 11:45:00', '90', '113', null, '275', '588', '1', '6', '6元=60元宝', '1', 'hb', '2015-09-28 11:27:06', '/Home/CZIOS/chongzhi_doing/orderId/90', '3', '0', '72', null, '161443410826', '', '72', null, null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-10-08 10:44:22', '2015-11-24 11:45:00', '129', '113', null, '314', '588', '30', '180', '6元=60元宝', '1', 'alipay', '2015-10-08 10:48:43', '/Home/CZIOS/chongzhi_doing/orderId/129', '3', '0', '72', null, '161444272523', '3d', '72', '1', null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-10-08 10:53:15', '2015-11-24 11:45:00', '130', '113', null, '315', '588', '30', '180', '6元=60元宝', '1', 'alipay', '2015-10-08 10:53:18', '/Home/CZIOS/chongzhi_doing/orderId/130', '3', '0', '72', null, '161444272798', '3d', '72', '1', null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-10-12 17:30:08', '2015-11-24 11:45:00', '131', '113', null, '316', '588', '30', '180', '6元=60元宝', '1', 'alipay', '2015-10-12 17:30:12', '/Home/CZIOS/chongzhi_doing/orderId/131', '1', '0', null, null, '161444642212', '3d', '72', '1', null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-10-13 09:20:27', '2015-11-24 11:45:00', '132', '113', null, '317', '588', '30', '180', '6元=60元宝', '1', 'alipay', '2015-10-13 09:20:34', '/Home/CZIOS/chongzhi_doing/orderId/132', '3', '0', '72', null, '161444699234', '3d', '72', '1', null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-11-17 14:47:57', '2015-11-24 11:45:00', '138', '113', null, '323', '588', '1', '6', '6元=60元宝', '1', 'mobile_alipay', '2015-11-17 14:48:02', 'CZIOS/chongzhi_doing', '2', '0', '72', null, '16138', 'sdf ', '72', '1', null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-11-17 15:05:41', '2015-11-24 11:45:00', '139', '113', null, '324', '1096', '1', '328', '328元=3280元宝', '1', 'alipay', '2015-11-17 15:05:50', 'CZIOS/chongzhi_doing', '4', '0', '72', null, '16139', 'gf ', '72', '1', null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-11-30 15:19:17', '2015-11-30 15:19:21', '143', '14', '72', '328', '17', '1', '6', '6元 = 60元宝', '1', '', '2015-11-30 15:19:21', '/Home/CZIOS/chongzhi_doing/orderId/143', '3', '0', '72', null, '161448867961', 'sdf', '72', null, null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-11-30 15:23:08', '2015-11-30 15:23:11', '144', '14', '72', '329', '17', '1', '6', '6元 = 60元宝', '1', '', '2015-11-30 15:23:11', '/Home/CZIOS/chongzhi_doing/orderId/144', '3', '0', '72', null, '161448868191', 'sdf', '72', null, null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-11-30 15:34:32', '2015-11-30 15:34:37', '145', '14', '72', '330', '17', '1', '6', '6元 = 60元宝', '1', '', '2016-02-28 08:00:05', '/Home/CZIOS/chongzhi_doing/orderId/145', '4', '1', '72', null, '161448868877', 'sdf', '74', null, null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2015-12-01 17:58:24', '2015-12-01 18:00:05', '147', '234', null, '332', '1093', '1', '6', '6元=60元宝', '1', 'alipay', '2016-02-28 18:00:05', 'CZIOS/chongzhi_doing', '0', '0', '72', null, '16147', 'sdf', '72', '1', null, null, null);
INSERT INTO `cz_order_ios` VALUES ('2016-01-12 09:46:54', '2016-01-12 09:46:59', '149', '234', null, '354', '1093', '1', '6', '6元=60元宝', '1', 'alipay', '2016-02-28 09:46:59', 'CZIOS/chongzhi_doing', '0', '0', '72', null, '16149', 'sdf', '72', '1', '0', null, null);
INSERT INTO `cz_order_ios` VALUES ('2016-01-12 09:55:04', null, '150', '113', null, '355', '588', '1', '6', '6元=60元宝', '0', null, null, null, '0', '0', null, null, null, 'sdf ', '72', '1', '0', null, null);
INSERT INTO `cz_order_ios` VALUES ('2016-01-12 09:57:05', '2016-01-12 09:57:10', '151', '113', null, '356', '588', '1', '6', '6元=60元宝', '1', 'alipay', '2016-02-28 09:57:10', 'CZIOS/chongzhi_doing', '0', '0', '72', null, '16151', 'sdf ', '72', '1', '0', null, null);
INSERT INTO `cz_order_ios` VALUES ('2016-01-18 18:08:51', null, '152', '113', null, '357', '593', '1', '328', '328元=3280元宝', '0', null, null, null, '0', '0', null, null, null, 'gf ', '72', '1', '0', null, null);
INSERT INTO `cz_order_ios` VALUES ('2016-01-21 15:20:53', '2016-01-21 15:20:58', '153', '113', null, '358', '588', '30', '180', '6元=60元宝', '1', 'alipay', '2016-02-28 15:20:58', 'CZIOS/chongzhi_doing', '2', '1', '72', null, '16153', '3d', '72', '1', '0', null, '');
INSERT INTO `cz_order_ios` VALUES ('2016-01-22 11:11:34', '2016-01-22 11:11:46', '154', '113', null, '359', '593', '1', '328', '328元=3280元宝', '1', 'mobile_alipay', '2016-02-28 11:11:46', 'CZIOS/chongzhi_doing', '2', '1', '74', null, '16154', 'sdf ', '72', '1', '0', null, null);
INSERT INTO `cz_order_ios` VALUES ('2016-01-22 11:22:47', null, '155', '113', null, '360', '588', '30', '180', '6元=60元宝', '0', null, null, null, '0', '0', null, null, null, '3d', '72', '1', '0', null, null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 14:50:35', null, '156', '113', null, '361', '594', '3', '1944', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'ff', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 15:34:15', null, '157', '113', null, '362', '594', '3', '1944', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'ddd', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 15:35:36', null, '158', '113', null, '363', '594', '3', '1905.1', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'ddd', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 15:36:17', null, '159', '113', null, '364', '594', '8', '5080.3', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'ddd', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 15:50:16', null, '160', '113', null, '365', '594', '2', '1270.1', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'dddd', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 15:55:31', null, '161', '113', null, '366', '594', '2', '1270.1', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'dddd', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 16:10:30', null, '162', '113', null, '367', '594', '2', '1257.1', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'dddd', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 16:10:44', null, '163', '113', null, '368', '594', '3', '1885.7', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'dddd', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 16:11:14', null, '164', '113', null, '369', '594', '50', '29160', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'dddd', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 16:11:47', null, '165', '113', null, '370', '594', '8', '4665.6', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'dddd', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 16:28:13', null, '166', '113', null, '371', '594', '4', '2462.4', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'dddd', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 16:42:45', null, '167', '113', null, '372', '593', '6', '1968', '328元=3280元宝', '0', null, null, null, '0', '0', null, null, null, 'ddd', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 16:43:20', null, '168', '113', null, '373', '594', '7', '4309.2', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'ddd', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 16:43:39', null, '169', '113', null, '374', '594', '8', '4665.6', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'ddd', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 16:44:15', null, '170', '113', null, '375', '594', '1', '635', '648元=6480元宝', '0', null, null, null, '0', '0', null, null, null, 'sdf ', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 16:44:40', null, '171', '113', null, '376', '594,593', '3', '2869.7', '648元=6480元宝,328元=3280元宝', '0', null, null, null, '0', '0', null, null, null, 'sdf ', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 16:45:21', null, '172', '113', null, '377', '594,593', '1', '963', '648元=6480元宝,328元=3280元宝', '0', null, null, null, '0', '0', null, null, null, 'sdf ', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 16:45:35', null, '173', '113', null, '378', '594,593', '3', '2869.7', '648元=6480元宝,328元=3280元宝', '0', null, null, null, '0', '0', null, null, null, 'sdf ', '72', '1', '0', '0', null);
INSERT INTO `cz_order_ios` VALUES ('2016-02-18 16:45:59', null, '174', '113', null, '379', '594,593', '1', '963', '648元=6480元宝,328元=3280元宝', '0', null, null, null, '0', '0', null, null, null, 'sdf ', '72', '1', '0', '0', null);

-- ----------------------------
-- Table structure for cz_package
-- ----------------------------
DROP TABLE IF EXISTS `cz_package`;
CREATE TABLE `cz_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL COMMENT '游戏ID',
  `mini_number` int(11) DEFAULT NULL COMMENT '最小购买数量',
  `sum_number` int(11) DEFAULT NULL COMMENT '总数量',
  `option_text` varchar(512) DEFAULT NULL COMMENT '面额描述',
  `price` int(11) DEFAULT NULL COMMENT '单个面额价格',
  `real_price` int(11) DEFAULT NULL COMMENT '原价',
  `active` tinyint(1) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cz_package
-- ----------------------------
INSERT INTO `cz_package` VALUES ('1', '113', '2', '9', '花千骨100元=1200', '100', '999', null, null);
INSERT INTO `cz_package` VALUES ('2', '113', '1', '20', '花千骨100元=1200', '200', '999', null, null);
INSERT INTO `cz_package` VALUES ('3', '113', '1', '25', '花千骨100元=1200', '100', '999', null, null);
INSERT INTO `cz_package` VALUES ('4', '113', null, null, '花千骨100元=1200', '100', '999', null, null);
INSERT INTO `cz_package` VALUES ('5', '113', null, null, '花千骨100元=1200', '100', '999', null, null);
INSERT INTO `cz_package` VALUES ('6', '113', null, null, '花千骨100元=1200', '100', '999', null, null);
INSERT INTO `cz_package` VALUES ('7', '113', null, null, '花千骨100元=1200', '100', '999', null, null);
INSERT INTO `cz_package` VALUES ('8', '113', null, null, '英雄联盟100元=1200元宝', '100', '999', null, null);
INSERT INTO `cz_package` VALUES ('9', '113', null, null, '少年三国志100元=1200元宝', '100', '999', null, null);
INSERT INTO `cz_package` VALUES ('10', '113', null, null, '天天酷跑100元=1200元宝', '100', '999', null, null);
INSERT INTO `cz_package` VALUES ('11', '113', null, null, '傲视西游100元=1200元宝', '100', '999', null, null);
INSERT INTO `cz_package` VALUES ('12', '7', '2', '20', '好好学习，天天向上@~！', '88', '100', '1', '0');
INSERT INTO `cz_package` VALUES ('13', '6', '2', '20', '1000钻石', '88', '100', '1', '0');
INSERT INTO `cz_package` VALUES ('14', '7', '2', '20', '三国志国战版1000元宝', '88', '100', '1', '0');
INSERT INTO `cz_package` VALUES ('15', '7', '2', '20', '元宝', '1', '100', '1', '0');
INSERT INTO `cz_package` VALUES ('16', '6', '3', '8', '56494', '5', '10', '0', '1');
INSERT INTO `cz_package` VALUES ('17', '10', '2', '20', '猎神1000元宝', '88', '100', '1', '0');

-- ----------------------------
-- Table structure for cz_package_game_account
-- ----------------------------
DROP TABLE IF EXISTS `cz_package_game_account`;
CREATE TABLE `cz_package_game_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `qufu` varchar(128) DEFAULT NULL,
  `qufu_type` varchar(128) DEFAULT NULL,
  `role` varchar(256) DEFAULT NULL,
  `contact_way` varchar(64) DEFAULT NULL,
  `occupation` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cz_package_game_account
-- ----------------------------
INSERT INTO `cz_package_game_account` VALUES ('11', '', '', '', null, '', '18514253610', null);
INSERT INTO `cz_package_game_account` VALUES ('12', '', '', '', null, '', '18514253610', null);
INSERT INTO `cz_package_game_account` VALUES ('13', 'fd', 'sdf ', 'sdf ', null, 'dsf ', '18514253610', null);
INSERT INTO `cz_package_game_account` VALUES ('14', '', '', '', null, '', '', null);
INSERT INTO `cz_package_game_account` VALUES ('15', '3', '3', '', null, '333', '18514253610', null);
INSERT INTO `cz_package_game_account` VALUES ('16', '丽丽', '丽丽', '', null, '把', '18514253610', null);
INSERT INTO `cz_package_game_account` VALUES ('17', '说的', 'sdf ', '', null, '第三方', '18514253610', null);
INSERT INTO `cz_package_game_account` VALUES ('18', 'sdf ', 'sdf ', 'sdf ', null, 'sdf ', '18514253610', null);
INSERT INTO `cz_package_game_account` VALUES ('19', 'sdf ', '123456', 'sdf ', null, 'sdf ', '18514253610', null);
INSERT INTO `cz_package_game_account` VALUES ('20', '第三方', 'sd fa', 'sdf ', null, 'sdf ', '18514253610', null);
INSERT INTO `cz_package_game_account` VALUES ('21', '2', '22', '22', null, '22', '18514253610', null);
INSERT INTO `cz_package_game_account` VALUES ('22', 'dfgsd', 'l;kj;l', '', null, 'dfgdfg', '13413715790', null);
INSERT INTO `cz_package_game_account` VALUES ('23', 'hjghj', 'hjgh', '', null, 'jhj', '13413715790', null);
INSERT INTO `cz_package_game_account` VALUES ('24', 'sdf ', 'gggg', 'sdf ', null, 'sdf ', '18514253610', null);
INSERT INTO `cz_package_game_account` VALUES ('25', '1111', 'ff', 'sdf ', null, 'sdf ', '18514253610', null);

-- ----------------------------
-- Table structure for cz_package_order
-- ----------------------------
DROP TABLE IF EXISTS `cz_package_order`;
CREATE TABLE `cz_package_order` (
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cz_package_id` int(11) DEFAULT NULL COMMENT '套餐id',
  `game_account_id` int(11) DEFAULT NULL COMMENT '游戏账号id',
  `customer_user_id` int(11) DEFAULT NULL COMMENT '购买者id',
  `bought_num` smallint(6) DEFAULT NULL COMMENT '购买数量',
  `real_payment` float DEFAULT NULL COMMENT '支付金额',
  `is_paid` tinyint(1) DEFAULT NULL COMMENT '是否已付款',
  `pay_way` varchar(256) DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `callback_url` varchar(512) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL COMMENT '订单状态',
  `id_no` varchar(16) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cz_package_order
-- ----------------------------
INSERT INTO `cz_package_order` VALUES ('2015-07-07 16:36:24', null, '15', '2', null, '23', '1', '0', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-10 17:36:07', null, '16', '2', null, '23', '2', '400', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-10 18:07:47', null, '17', '2', null, '23', '2', '400', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-10 18:14:26', null, '18', '2', null, '23', '0', '0', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-10 18:21:58', null, '19', '2', null, '23', '0', '0', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-10 18:31:40', null, '20', '2', null, '23', '0', '0', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-10 18:41:23', null, '21', '2', null, '23', '0', '0', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-10 18:41:46', null, '22', '2', null, '23', '2', '400', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-10 18:41:55', null, '23', '2', null, '23', '2', '400', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-10 18:43:46', null, '24', '2', null, '23', '2', '400', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-10 18:44:09', null, '25', '2', null, '23', '1', '0', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-10 18:49:28', null, '26', '2', null, '23', '1', '0', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-13 09:45:51', null, '27', '2', null, '23', '1', '0', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-13 10:00:58', null, '28', '2', null, '23', '1', '0', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-13 10:05:29', null, '29', '2', null, '23', '1', '3000', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-07-13 10:07:21', null, '30', '2', '11', '23', '1', '200', '1', '', null, '/Home/IOSCZPackage/cz_package_doing/orderId/30', '3', '361436758139', null);
INSERT INTO `cz_package_order` VALUES ('2015-07-13 10:28:53', null, '31', '2', '12', '23', '1', '200', '1', 'alipay', null, '/Home/IOSCZPackage/cz_package_doing/orderId/31', '3', '361436755535', null);
INSERT INTO `cz_package_order` VALUES ('2015-07-29 17:15:44', null, '32', '1', '13', '23', '2', '200', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-08-06 10:17:37', null, '33', '1', null, '23', '1', '200', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-08-31 09:41:44', null, '34', '2', '14', '23', '1', '200', '1', null, null, null, '3', null, null);
INSERT INTO `cz_package_order` VALUES ('2015-09-23 11:01:29', '2015-09-23 11:12:58', '35', '2', '15', null, '1', '200', '1', 'sp_mobile', '2015-09-23 11:12:58', '/Home/IOSCZPackage/cz_package_doing/orderId/35', '6', '1442978067', '72');
INSERT INTO `cz_package_order` VALUES ('2015-09-23 11:33:33', null, '36', '11', '16', null, '1', '100', '0', null, null, null, '0', null, '72');
INSERT INTO `cz_package_order` VALUES ('2015-09-23 15:43:17', null, '37', '12', null, null, '20', '1760', '0', null, null, null, '0', null, '72');
INSERT INTO `cz_package_order` VALUES ('2015-09-23 15:43:24', null, '38', '12', '17', null, '2', '176', '0', 'sp_mobile', null, '/Home/IOSCZPackage/cz_package_doing/orderId/38', '0', '1442994303', '72');
INSERT INTO `cz_package_order` VALUES ('2015-09-23 15:45:29', null, '39', '12', '18', null, '2', '176', '1', 'alipay', null, '/Home/IOSCZPackage/cz_package_doing/orderId/39', '0', '1442995846', '72');
INSERT INTO `cz_package_order` VALUES ('2015-09-23 16:12:44', null, '40', '12', null, null, '2', '176', '0', null, null, null, '0', null, '72');
INSERT INTO `cz_package_order` VALUES ('2015-09-28 10:28:41', '2015-09-28 11:23:33', '41', '12', '19', null, '2', '176', '1', 'hb', '2015-09-28 11:23:33', '/Home/IOSCZPackage/cz_package_doing/orderId/41', '6', '1443410613', '72');
INSERT INTO `cz_package_order` VALUES ('2015-10-08 18:55:32', null, '42', '14', null, null, '2', '176', '0', null, null, null, '0', null, '72');
INSERT INTO `cz_package_order` VALUES ('2015-10-13 09:30:35', '2015-10-13 09:30:48', '43', '13', '20', null, '2', '176', '1', 'alipay', '2015-10-13 09:30:48', '/Home/IOSCZPackage/cz_package_doing/orderId/43', '6', '1444700882', '72');
INSERT INTO `cz_package_order` VALUES ('2015-11-26 15:56:02', null, '44', '14', null, null, '2', '176', '0', null, null, null, '0', null, '72');
INSERT INTO `cz_package_order` VALUES ('2015-11-26 16:11:12', null, '45', '14', null, null, '2', '176', '0', null, null, null, '0', null, '72');
INSERT INTO `cz_package_order` VALUES ('2015-11-26 16:12:58', '2015-11-26 16:13:35', '46', '14', '21', null, '2', '176', '1', 'alipay', '2015-11-26 16:13:35', '/Home/IOSCZPackage/cz_package_doing/orderId/46', '6', '3646', '72');
INSERT INTO `cz_package_order` VALUES ('2015-12-11 14:50:37', '2015-12-11 14:50:52', '47', '16', '22', null, '4', '20', '1', 'sp_mobile', '2015-12-11 14:50:52', '/Home/IOSCZPackage/cz_package_doing/orderId/47', '6', '3647', '72');
INSERT INTO `cz_package_order` VALUES ('2015-12-11 14:52:02', '2015-12-11 14:52:20', '48', '16', '23', null, '3', '15', '1', 'sp_mobile', '2015-12-11 14:52:20', '/Home/IOSCZPackage/cz_package_doing/orderId/48', '6', '3648', '72');
INSERT INTO `cz_package_order` VALUES ('2016-01-12 11:17:23', '2016-01-12 11:17:34', '49', '17', '24', null, '2', '176', '1', 'alipay', '2016-01-12 11:17:34', 'IOSCZPackage/cz_package_doing/', '6', '3649', '72');
INSERT INTO `cz_package_order` VALUES ('2016-01-12 11:18:47', '2016-01-12 11:18:56', '50', '16', '25', null, '1', '5', '1', 'alipay', '2016-01-12 11:18:56', 'IOSCZPackage/cz_package_doing/', '6', '3650', '72');

-- ----------------------------
-- Table structure for email_auth_key
-- ----------------------------
DROP TABLE IF EXISTS `email_auth_key`;
CREATE TABLE `email_auth_key` (
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `rand_num` varchar(8) DEFAULT NULL COMMENT '随机数',
  `key` varchar(32) DEFAULT NULL COMMENT '加密串',
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of email_auth_key
-- ----------------------------
INSERT INTO `email_auth_key` VALUES ('2015-09-02 17:18:37', '3', '66', '3717', 'a893a6d2ca8e6f65fbb53b5753ad5003', '1');

-- ----------------------------
-- Table structure for example
-- ----------------------------
DROP TABLE IF EXISTS `example`;
CREATE TABLE `example` (
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) DEFAULT NULL,
  `tel` varchar(63) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL,
  `nickname` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of example
-- ----------------------------

-- ----------------------------
-- Table structure for fake_list
-- ----------------------------
DROP TABLE IF EXISTS `fake_list`;
CREATE TABLE `fake_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) DEFAULT NULL,
  `num` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fake_list
-- ----------------------------
INSERT INTO `fake_list` VALUES ('1', '281113137@qq.com', '8');
INSERT INTO `fake_list` VALUES ('11', '281113137@qq.com', '123');
INSERT INTO `fake_list` VALUES ('10', 'xconly@qq.com', '15');
INSERT INTO `fake_list` VALUES ('12', '281113137@qq.com', '1');
INSERT INTO `fake_list` VALUES ('13', '281113137@qq.com', '111');
INSERT INTO `fake_list` VALUES ('14', '281113137@qq.com', '1');
INSERT INTO `fake_list` VALUES ('15', '281113137@qq.com', '1');
INSERT INTO `fake_list` VALUES ('16', '281113137@qq.com', '1');
INSERT INTO `fake_list` VALUES ('17', '281113137@qq.com', '1');

-- ----------------------------
-- Table structure for footer_col
-- ----------------------------
DROP TABLE IF EXISTS `footer_col`;
CREATE TABLE `footer_col` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `image_path` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of footer_col
-- ----------------------------

-- ----------------------------
-- Table structure for footer_col_item
-- ----------------------------
DROP TABLE IF EXISTS `footer_col_item`;
CREATE TABLE `footer_col_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `href` varchar(128) DEFAULT NULL,
  `footer_col_id` int(11) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `foreign_link` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of footer_col_item
-- ----------------------------

-- ----------------------------
-- Table structure for friend_link
-- ----------------------------
DROP TABLE IF EXISTS `friend_link`;
CREATE TABLE `friend_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) DEFAULT NULL,
  `url` varchar(512) DEFAULT NULL,
  `contact` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend_link
-- ----------------------------
INSERT INTO `friend_link` VALUES ('67', '武汉麻将', 'http://www.laiyouxi.com/', 'QQ:2853263769');
INSERT INTO `friend_link` VALUES ('48', '一游网', 'http://www.eeyy.cc/', 'QQ:1271718282');
INSERT INTO `friend_link` VALUES ('66', '爱手游网', 'http://www.shouyou520.com/', 'QQ:2418869780');
INSERT INTO `friend_link` VALUES ('59', '神游网', 'http://www.gh175.com/', 'QQ:835077531');
INSERT INTO `friend_link` VALUES ('18', '安卓游戏下载', 'http://www.682.com/', 'QQ:2880603667');
INSERT INTO `friend_link` VALUES ('16', '智能手机刷机', 'http://www.1980a.com/', 'QQ:1796980723');
INSERT INTO `friend_link` VALUES ('45', '游戏试玩', 'http://www.13177.com/ ', 'QQ:2371482842');
INSERT INTO `friend_link` VALUES ('71', '8477手游网', 'http://www.8477.com/', 'QQ:3296921871');
INSERT INTO `friend_link` VALUES ('72', '手游岛模拟器', 'http://www.shouyoudao.com/', '');
INSERT INTO `friend_link` VALUES ('44', '通讯加盟', 'http://chaoliu.jiameng.com', 'QQ:1878690558');
INSERT INTO `friend_link` VALUES ('63', '一键刷机软件', 'http://www.xianshuabao.com/', 'QQ:2850501383');
INSERT INTO `friend_link` VALUES ('28', '手机单机游戏', 'http://www.6137.net/', 'QQ:960651369');
INSERT INTO `friend_link` VALUES ('32', '风云天下', 'http://fytx.sjwyx.com/', 'QQ:2252214019');
INSERT INTO `friend_link` VALUES ('69', '9669', 'http://bbs.9669.com/', 'QQ:184587865');
INSERT INTO `friend_link` VALUES ('37', '卡牌游戏', 'http://www.17kapai.com/', 'QQ:645792384');
INSERT INTO `friend_link` VALUES ('50', '张家口游戏网', 'http://game.zjknews.com/', 'QQ:1989705376');
INSERT INTO `friend_link` VALUES ('46', '电影票房', 'http://www.dypf8.com/', 'QQ:2940848752');
INSERT INTO `friend_link` VALUES ('61', '手游论坛', 'http://bbs.9669.com/', 'QQ:97337143');
INSERT INTO `friend_link` VALUES ('68', '手机网游', 'http://www.poodou.com/', 'QQ:184587865');
INSERT INTO `friend_link` VALUES ('53', '苹果充值', 'http://www.honghonghu.com/', '');
INSERT INTO `friend_link` VALUES ('54', '网页游戏排行榜', 'http://www.5173ww.com/', 'QQ:2506927484');
INSERT INTO `friend_link` VALUES ('58', '讯易网', 'http://xun-yi.com/', 'QQ:1834651279');
INSERT INTO `friend_link` VALUES ('65', '上网卡', 'http://www.12315168.com.cn/', 'QQ:414505991');
INSERT INTO `friend_link` VALUES ('73', '卡牌游戏', null, null);
INSERT INTO `friend_link` VALUES ('74', '卡牌游戏', null, null);
INSERT INTO `friend_link` VALUES ('75', '卡牌游戏', null, null);
INSERT INTO `friend_link` VALUES ('76', '卡牌游戏', null, null);
INSERT INTO `friend_link` VALUES ('77', '卡牌游戏', null, null);
INSERT INTO `friend_link` VALUES ('78', '卡牌游戏', null, null);
INSERT INTO `friend_link` VALUES ('79', '卡牌游戏', null, null);
INSERT INTO `friend_link` VALUES ('80', '卡牌游戏', null, null);
INSERT INTO `friend_link` VALUES ('81', '卡牌游戏', null, null);
INSERT INTO `friend_link` VALUES ('82', '卡牌游戏', null, null);
INSERT INTO `friend_link` VALUES ('83', '卡牌游戏', null, null);
INSERT INTO `friend_link` VALUES ('84', '卡牌游戏', null, null);
INSERT INTO `friend_link` VALUES ('85', '卡牌游戏', null, null);
INSERT INTO `friend_link` VALUES ('86', '卡牌游戏', null, null);

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) DEFAULT NULL,
  `pinyin` varchar(63) DEFAULT NULL,
  `thumbnail_path` varchar(512) DEFAULT NULL,
  `chongzhi_help` varchar(512) DEFAULT NULL,
  `currency_name` varchar(512) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `android_platform` tinyint(1) DEFAULT NULL,
  `ios_platform` tinyint(1) DEFAULT NULL,
  `is_tx` tinyint(1) DEFAULT NULL,
  `need_qufu` tinyint(1) DEFAULT NULL,
  `pinyin_category` varchar(26) DEFAULT NULL,
  `card_name` varchar(63) DEFAULT NULL,
  `ios_url` varchar(255) DEFAULT NULL,
  `android_url` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=529 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES ('6', '新神曲', 'xinshenqu', 'xinshenqu.jpg', null, '钻石', null, '0', '1', '0', '1', 'X', '', 'http://www.honghonghu.com', '', null);
INSERT INTO `game` VALUES ('7', '三国志国战版', 'sanguozhiguozhanban', '13907349091251.jpg', null, '元宝', null, '0', '1', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('8', '全民斩仙', 'quanminzhanxian', '14089357151362.jpg', null, '元宝', null, '0', '0', '1', '1', 'Q', '充不了', null, null, null);
INSERT INTO `game` VALUES ('9', '凡人修真', 'fanrenxiuzhen', '133.jpg', null, '元宝', null, '1', '1', '0', '1', 'F', null, null, null, null);
INSERT INTO `game` VALUES ('10', '猎神', 'lieshen', 'u40883577022258601865fm58.jpeg', null, '钻', null, '0', '1', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('11', '造梦西游', 'zaomengxiyou', '1449196032.png', null, '点券', '1', '0', '1', '0', '1', 'Z', '11', '111', '11', '1');
INSERT INTO `game` VALUES ('12', '混沌与秩序之英雄战歌', 'hundunyuzhixuzhiyingxiongzhange', '8.png', null, '钻', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('13', '帝国舰队', 'diguojiandui', '8.jpg', null, '宝石', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('14', '石器时代', 'shiqishidai', '13610825092366.jpg', null, '钻石', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('15', '忘仙', 'wangxian', '13934808461971.jpg', null, '银两', null, '1', '1', '0', '1', 'W', null, null, null, null);
INSERT INTO `game` VALUES ('16', '萌英雄', 'mengyingxiong', '13893313846946.jpg', null, '钻石', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('17', '天龙豪杰传', 'tianlonghaojiechuan', '13904693121473.jpg', null, '元宝', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('18', '忍将', 'renjiang', '13808773029707.png', null, '金币', null, '0', '1', '0', '1', 'R', null, null, null, null);
INSERT INTO `game` VALUES ('19', '口袋忍者', 'koudairenzhe', 'koud.jpg', null, '元宝', null, '0', '1', '0', '1', 'K', '', null, null, null);
INSERT INTO `game` VALUES ('20', '乱斗堂', 'luandoutang', '13666100533155.jpg', null, '钻石', null, '0', '1', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('21', '海贼来了', 'haizeilaile', '14444.jpg', null, '元宝', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('22', '斗斗堂', 'doudoutang', '13720575541031.jpg', null, '钻石', null, '0', '1', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('23', '放开那三国', 'fangkainasanguo', '13826852615904.jpg', null, '金币', null, '1', '0', '0', '1', 'F', '', null, null, null);
INSERT INTO `game` VALUES ('24', '神鬼幻想', 'shenguihuanxiang', '13758775352237.jpg', null, '红钻', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('25', '王者之剑', 'wangzhezhijian', 'wangzhezhijian.jpg', null, '红钻', null, '1', '1', '0', '1', 'W', null, null, null, null);
INSERT INTO `game` VALUES ('26', '世界ol', 'shijieol', '13588440539669.png', null, '金叶', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('27', '武侠Q传', 'wuxiaQchuan', '13856337776009.jpg', null, '元宝', null, '0', '1', '0', '1', 'W', null, null, null, null);
INSERT INTO `game` VALUES ('28', '仙变', 'xianbian', '13716974838731.jpg', null, '元宝', null, '0', '1', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('29', '龙将', 'longjiang', '78c214f2-5ebc-4ce6-b2b0-af73d313bb10_140_98.jpg', null, '金币', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('30', '三剑豪', 'sanjianhao', '13878730746514.jpg', null, '钻石', null, '1', '1', '0', '1', 'S', '需要转单处理', null, null, null);
INSERT INTO `game` VALUES ('31', '冰火王座', 'binghuowangzuo', '13891711494243.jpg', null, '绿钻', null, '0', '0', '0', '1', 'B', null, null, null, null);
INSERT INTO `game` VALUES ('32', '魔物狩猎者', 'mowushouliezhe', '13895939457904.jpg', null, '金币', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('33', '全民西游', 'quanminxiyou', '13861513567182.jpg', null, '点券', null, '1', '1', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('34', '铁血战神', 'tiexiezhanshen', '13741353573846.jpg', null, '钻石', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('35', '比武招亲', 'biwuzhaoqin', 'biwuzhaoqin.jpg', null, '元宝', null, '0', '0', '0', '1', 'B', '', null, null, null);
INSERT INTO `game` VALUES ('36', '啪啪三国', 'papasanguo', 'papsanguo.jpg', null, '钻石', null, '0', '1', '0', '1', 'P', '', null, null, null);
INSERT INTO `game` VALUES ('37', '新苍穹之剑', 'xincangqiongzhijian', '14225135154474.jpg', null, '蓝钻', null, '1', '1', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('38', '梦梦爱三国', 'mengmengaisanguo', '14254401559166.jpg', null, '', null, '0', '0', '0', '1', 'M', '', null, null, null);
INSERT INTO `game` VALUES ('39', '扩散性百万亚瑟王', 'kuosanxingbaiwanyasewang', '13741163469740.jpg', null, 'MC', null, '0', '0', '0', '1', 'K', null, null, null, null);
INSERT INTO `game` VALUES ('40', '怒斩轩辕2', 'nuzhanxuanyuan2', '13896024233711.jpg', null, '元宝', null, '0', '0', '0', '1', 'N', null, null, null, null);
INSERT INTO `game` VALUES ('41', 'QQ降龙2', 'QQjianglong2', '13812833376640.png', null, '奇缘', null, '0', '1', '1', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('42', '口袋妖精', 'koudaiyaojing', '13655872957179.jpg', null, '宝石', null, '0', '0', '0', '1', 'K', null, null, null, null);
INSERT INTO `game` VALUES ('43', '全民斗西游', 'quanmindouxiyou', 'QQ20140307173616.jpg', null, '元宝', null, '0', '0', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('44', 'nba梦之队', 'nbamengzhidui', 'NBA.jpg', null, '梦之币', null, '0', '1', '0', '1', 'N', '', null, null, null);
INSERT INTO `game` VALUES ('45', '全民飞机大战', 'quanminfeijidazhan', '13891734544402.png', null, '钻石', null, '0', '1', '1', '0', 'Q', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('46', '欢乐斗地主', 'huanledoudizhu', '13637742971489.png', null, '钻石', null, '0', '1', '1', '0', 'H', '可直接zm50充', null, null, null);
INSERT INTO `game` VALUES ('47', '火线指令2', 'huoxianzhiling2', 'QQ20140310103855.jpg', null, '金', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('48', '大富豪', 'dafuhao', '13717145618471.jpg', null, 'G', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('49', '天天飞车', 'tiantianfeiche', '13896861254427.jpg', null, '钻石', null, '0', '1', '1', '0', 'T', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('50', '天天酷跑', 'tiantiankupao', '13792343156434.png', null, '钻石', null, '0', '1', '1', '0', 'T', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('51', '欢乐麻将', 'huanlemajiang', '13895772336207.jpg', null, '钻石', null, '0', '1', '1', '0', 'H', '可用日本充', null, null, null);
INSERT INTO `game` VALUES ('52', '节奏大师', 'jiezoudashi', '13723161789149.jpg', null, '钻石', null, '0', '1', '1', '0', 'J', '可用日本充', null, null, null);
INSERT INTO `game` VALUES ('53', '萌江湖', 'mengjianghu', '13754382383507.jpg', null, '元宝', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('54', '天天爱消除', 'tiantianaixiaochu', '13768352112027.png', null, '钻石', null, '0', '0', '1', '0', 'T', '可切号充或人民币', null, null, null);
INSERT INTO `game` VALUES ('55', '我叫MT', 'wojiaoMT', '13808631805922.png', null, '符石', null, '0', '1', '0', '1', 'W', '', null, null, null);
INSERT INTO `game` VALUES ('56', '你好英雄', 'nihaoyingxiong', '13891622287488.png', null, '钻石', null, '0', '0', '0', '1', 'N', null, null, null, null);
INSERT INTO `game` VALUES ('57', '神雕侠侣', 'shendiaoxialv', '13774824155892.jpg', null, '元宝', null, '0', '1', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('58', '悍将三国', 'hanjiangsanguo', '13780441902528.jpg', null, '元宝', null, '0', '1', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('59', '暴走无双', 'baozouwushuang', '13898437727616.jpg', null, '元宝', null, '0', '0', '0', '1', 'B', null, null, null, null);
INSERT INTO `game` VALUES ('60', '战神大陆 ', 'zhanshendalu ', '13789540945444.jpg', null, '元宝', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('61', '魔力宝贝', 'molibaobei', 'u14005697891652444708fm11gp0.jpg', null, '钻石', null, '1', '1', '0', '1', 'M', '阿俊充', null, null, null);
INSERT INTO `game` VALUES ('62', '剑魂之刃', 'jianhunzhiren', 'jianhun.png', null, '钻石', null, '1', '1', '0', '1', 'J', '', null, null, null);
INSERT INTO `game` VALUES ('63', '怪物X联盟', 'guaiwuXlianmeng', '13533048837678.jpg', null, 'M', null, '0', '1', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('64', '君王2', 'junwang2', '13897759438934.jpg', null, '钻石', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('65', '唐门世界', 'tangmenshijie', '93bf2907d3b0ac0921c764a57b04a09b.jpg', null, '元宝', null, '1', '1', '0', '1', 'T', '', null, null, null);
INSERT INTO `game` VALUES ('66', '部落冲突', 'buluochongtu', '13617598578749.jpg', null, '宝石', null, '0', '1', '0', '0', 'B', '', null, null, null);
INSERT INTO `game` VALUES ('67', '三国来了', 'sanguolaile', '13801650918242.jpg', null, '元宝', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('68', '战神黎明', 'zhanshenliming', 'u19385664713600227609fm58.jpeg', null, '钻石', null, '1', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('69', '龙之力量', 'longzhililiang', '13934075803860.jpg', null, '钻石', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('70', '神域之光', 'shenyuzhiguang', 'shenyuzhiguang.jpg', null, '钻石', null, '0', '1', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('71', '宫廷Q传', 'gongtingQchuan', '13984036612280.jpg', null, '元宝', null, '0', '0', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('72', '口袋战争', 'koudaizhanzheng', '13720425665310.jpg', null, '钻石', null, '0', '0', '0', '1', 'K', null, null, null, null);
INSERT INTO `game` VALUES ('73', '大掌门 ', 'dazhangmen ', 'dahzang.jpg', null, '元宝', null, '0', '1', '0', '1', 'D', '', null, null, null);
INSERT INTO `game` VALUES ('74', '横扫西游', 'hengsaoxiyou', 'hengshaoxiyou.jpg', null, '黄金', null, '0', '1', '1', '1', 'H', '下单失败，必须rmb充', null, null, null);
INSERT INTO `game` VALUES ('75', '倚天', 'yitian', 'yitian.png', null, '元宝', null, '0', '1', '0', '1', 'Y', '', null, null, null);
INSERT INTO `game` VALUES ('76', '永恒战士', 'yonghengzhanshi', null, null, '钻石', null, '0', '0', '0', '1', 'Y', null, null, null, null);
INSERT INTO `game` VALUES ('77', '真三国.猛将传', 'zhensanguo.mengjiangchuan', '13812212848589.png', null, '元宝', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('78', '战国之道', 'zhanguozhidao', '13860577277301.jpg', null, '小判', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('79', '龙珠Q传', 'longzhuQchuan', '13927057188456.png', null, '钻石', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('80', '秦美人', 'qinmeiren', '13716135117937.png', null, '元宝', null, '0', '0', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('81', '梦回西游', 'menghuixiyou', '13599463682603.png', null, '元宝', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('82', '混沌之理', 'hundunzhili', '14098159291841.jpg', null, '钻石', null, '0', '1', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('83', '时空猎人', 'shikonglieren', '13811359982066.png', null, '金币', null, '1', '1', '0', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('84', '萌兽堂', 'mengshoutang', '14011822298126.png', null, '钻石', null, '0', '0', '1', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('85', '刀剑天下-征途', 'daojiantianxia-zhengtu', '13801667455052.png', null, '点数', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('86', '全民枪战', 'quanminqiangzhan', '14098001528419.jpg', null, '钻石', null, '0', '1', '0', '1', 'Q', '', null, null, null);
INSERT INTO `game` VALUES ('87', '钢铁力量(lron Force)', 'gangtieliliang(lron Force)', 'u2927576023269898038fm21gp0.jpg', null, '钻石', null, '0', '0', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('88', '忍者q传', 'renzheqchuan', '13934680475758.png', null, '金币', null, '0', '0', '0', '1', 'R', null, null, null, null);
INSERT INTO `game` VALUES ('89', '神仙道', 'shenxiandao', '13630573217696_1.png', null, '元宝', null, '0', '0', '0', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('90', '轩辕之战', 'xuanyuanzhizhan', '13886311627166.jpg', null, '元宝', null, '0', '0', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('91', '梦回大唐', 'menghuidatang', '13736230983327.jpg', null, '元宝', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('92', '刀塔女神ol', 'daotanvshenol', '4345353453213123.jpg', null, '钻石', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('93', '新明珠三国', 'xinmingzhusanguo', '13938379778432.png', null, '元宝', null, '0', '1', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('94', '三国演义ol·君临天下', 'sanguoyanyiol·junlintianxia', '13751753369891.png', null, '黄金', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('95', '圣纹ol', 'shengwenol', '13523607012319.png', null, '点券', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('96', '新三国', 'xinsanguo', 'xsg.jpg', null, '黄金', null, '0', '0', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('97', '我的部落：史诗英雄', 'wodebuluo：shishiyingxiong', '13883952669720.jpg', null, '钻石', null, '0', '0', '0', '1', 'W', null, null, null, null);
INSERT INTO `game` VALUES ('98', '仙侠', 'xianxia', 'QQ20140911095539.jpg', null, '金子', null, '1', '0', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('99', '魔卡幻想', 'moqiahuanxiang', 'mokahuanxiang.png', null, '晶钻', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('100', '绝世天府', 'jueshitianfu', 'jueshitianfu.jpg', null, '黄金', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('101', '弹弹岛online', 'dandandaoonline', 'dandandao.jpg', null, '钻石', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('102', '后宫无双', 'hougongwushuang', 'hougongwushuang.jpg', null, '钻石', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('103', '龙斗士-女神来了', 'longdoushi-nvshenlaile', 'longdoushi.jpg', null, '钻石', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('104', '西游记online', 'xiyoujionline', 'online.jpg', null, '元宝', null, '0', '0', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('105', '刀塔传奇', 'daotachuanqi', 'daota.jpg', null, '钻石', null, '1', '0', '0', '1', 'D', '需要切号充', null, null, null);
INSERT INTO `game` VALUES ('106', '三国合伙人', 'sanguohehuoren', '13926094089073.png', null, '元宝', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('107', '魔刃之魂 : 邪恶护符', 'morenzhihun : xieehufu', '13859506438031_1.png', null, '钻石', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('108', '神指三国', 'shenzhisanguo', '13907925442567.jpg', null, '元宝', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('109', '三国杀', 'sanguosha', 'u5391811241433544477fm23gp0.jpg', null, '元宝', null, '0', '1', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('110', '全民英雄', 'quanminyingxiong', '343634542.jpg', null, '魔钻', null, '0', '0', '1', '1', 'Q', '', null, null, null);
INSERT INTO `game` VALUES ('111', '莽荒纪', 'manghuangji', '13861513898462.png', null, '金币', null, '1', '1', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('112', '仙战', 'xianzhan', '13872839787065.jpg', null, '元宝', null, '0', '0', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('113', '傲世西游', 'aoshixiyou', '1448250417.jpg', null, '神石', '1', '0', '1', '1', '1', 'A', '需切号或rmb', 'http://www.honghonghu.com', '', '113');
INSERT INTO `game` VALUES ('114', '诛神之战online', 'zhushenzhizhanonline', '13865775756644.jpg', null, '红宝石', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('115', '神魔', 'shenmo', 'shenmo.jpg', null, '金币', null, '1', '1', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('116', '进击之刃', 'jinjizhiren', 't01b50c78023efa7f55.jpg', null, '金币', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('117', '呆兵萌将', 'daibingmengjiang', 'daibingmengjiang.jpg', null, '元宝', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('118', '神魔之塔', 'shenmozhita', '13806302548688.jpg', null, '魔法石', null, '0', '1', '1', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('119', '楚汉传奇', 'chuhanchuanqi', 'chuhanchuanqi.png', null, '元宝', null, '0', '0', '0', '1', 'C', null, null, null, null);
INSERT INTO `game` VALUES ('120', '一代宗师官方版', 'yidaizongshiguanfangban', '6.jpg', null, '黄金', null, '0', '1', '0', '1', 'Y', null, null, null, null);
INSERT INTO `game` VALUES ('121', '射雕群侠传', 'shediaoqunxiachuan', '20140319142011.jpg', null, '元宝', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('122', '封魔', 'fengmo', 'fengmo.jpg', null, '魔晶', null, '0', '0', '0', '1', 'F', null, null, null, null);
INSERT INTO `game` VALUES ('123', '疯狂部落', 'fengkuangbuluo', 'fengkuanbuluo.jpg', null, '珍珠', null, '0', '0', '0', '1', 'F', null, null, null, null);
INSERT INTO `game` VALUES ('124', '光辉之城', 'guanghuizhicheng', 'guanghuizhicheng.jpg', null, '魔石', null, '0', '0', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('125', '去吧皮卡丘', 'qubapiqiaqiu', '1403079894_156.jpg', null, '钻石', null, '1', '0', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('126', '秦时明月2', 'qinshimingyue2', 'qingshi.jpg', null, '元宝', null, '1', '0', '0', '1', 'Q', '', null, null, null);
INSERT INTO `game` VALUES ('127', '战神联盟（赛尔号）', 'zhanshenlianmeng（saierhao）', 'zhanshen.jpg', null, '金豆', null, '0', '1', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('128', '机甲三国', 'jijiasanguo', '320115516.jpg', null, '元宝', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('129', '君临三国', 'junlinsanguo', '13717152975393.jpg', null, '元宝', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('130', '永恒战士3', 'yonghengzhanshi3', 'yonghengzhanshi3.jpg', null, '宝石', null, '0', '0', '0', '1', 'Y', '', null, null, null);
INSERT INTO `game` VALUES ('131', '新部落守卫战', 'xinbuluoshouweizhan', 'qqbuluo.jpg', null, '元宝', null, '0', '1', '1', '1', 'X', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('132', '魔域探险', 'moyutanxian', 'moyutanxian.jpg', null, '金币', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('133', '恋舞', 'lianwu', 'lianwu.jpg', null, '恋舞币', null, '0', '0', '0', '0', 'L', '', null, null, null);
INSERT INTO `game` VALUES ('134', '新三国小镇', 'xinsanguoxiaozhen', 'xinsanguoxiaozhen.jpg', null, '点券', null, '0', '0', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('135', '人人秀舞', 'renrenxiuwu', 'renrenxiuwu.jpg', null, '钻石', null, '0', '0', '0', '1', 'R', null, null, null, null);
INSERT INTO `game` VALUES ('136', '战仙Q版', 'zhanxianQban', 'zhanxian.jpg', null, '元宝', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('137', '英雄战魂OL', 'yingxiongzhanhunOL', 'yingxiongzhanhun.jpg', null, '钻石', null, '0', '0', '0', '1', 'Y', null, null, null, null);
INSERT INTO `game` VALUES ('138', '神之刃', 'shenzhiren', 'shenzhiren.jpg', null, '蓝钻', null, '0', '1', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('139', '三国名将', 'sanguomingjiang', 'sanguomingjiang.jpg', null, '元宝', null, '0', '1', '0', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('140', '三分天下-风云莫测', 'sanfentianxia-fengyunmoce', 'sanfentianxia.jpg', null, '金币', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('141', '雄霸天地', 'xiongbatiandi', '13408706406578.jpg', null, '金锭', null, '0', '1', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('142', '传世三国', 'chuanshisanguo', '13890881498982.jpg', null, '传世币', null, '0', '0', '0', '1', 'C', null, null, null, null);
INSERT INTO `game` VALUES ('143', '热血兄弟', 'rexiexiongdi', '13690365204761.jpg', null, '热血币', null, '0', '0', '0', '1', 'R', null, 'http://www.baidu.com', 'http://www.honghonghu.com', null);
INSERT INTO `game` VALUES ('144', '全民斗三国', 'quanmindousanguo', 'quanmingdousanguo.jpg', null, '元宝', null, '0', '0', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('145', '女神契约', 'nvshenqiyue', 'nvhsenqiyue.jpg', null, '晶钻', null, '0', '0', '0', '1', 'N', null, null, null, null);
INSERT INTO `game` VALUES ('146', '影之刃', 'yingzhiren', '07b88a7fe9cdfc8e509bd893b397e817_90_90.jpg', null, '元宝', null, '0', '0', '0', '1', 'Y', '', null, null, null);
INSERT INTO `game` VALUES ('147', '部落英雄', 'buluoyingxiong', '13476802081468.jpg', null, '金', null, '0', '0', '0', '1', 'B', null, null, null, null);
INSERT INTO `game` VALUES ('148', '搞怪大富翁', 'gaoguaidafuweng', 'gaoguaidafuweng.jpg', null, '元宝', null, '0', '0', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('149', '命运英雄传', 'mingyunyingxiongchuan', '13635729221970.jpg', null, '宝石', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('150', '太古', 'taigu', '14115249295715.jpg', null, '黄金', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('151', '大老二-神来也大老2', 'dalaoer-shenlaiyedalao2', 'dalaoer.jpg', null, '大老二币', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('152', '战国', 'zhanguo', 'zhanguo.jpg', null, '元宝', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('153', '决战三国', 'juezhansanguo', 'juezhansanguo.jpg', null, '金币', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('154', '逆天仙魔录', 'nitianxianmolu', 'nitianxianmolu.png', null, '元宝', null, '0', '0', '0', '1', 'N', null, null, null, null);
INSERT INTO `game` VALUES ('155', '我是大大侠', 'woshidadaxia', '14074696202452.jpg', null, '元宝', null, '0', '1', '0', '1', 'W', null, null, null, null);
INSERT INTO `game` VALUES ('156', '进击吧！三国', 'jinjiba！sanguo', '14098125008732.jpg', null, '元宝', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('157', '天龙八部-移动版', 'tianlongbabu-yidongban', 'tianlongbabu.jpg', null, '元宝', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('158', '名将无双', 'mingjiangwushuang', 'mingjiangwushuang.jpg', null, '元宝', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('159', '格子RPG', 'geziRPG', 'gezi.jpg', null, '钻石', null, '0', '0', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('160', '明珠轩辕', 'mingzhuxuanyuan', 'xuanyuan.jpg', null, '元宝', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('161', '逆转三国', 'nizhuansanguo', 'nizhuansanguo.jpg', null, '元宝', null, '0', '0', '0', '1', 'N', null, null, null, null);
INSERT INTO `game` VALUES ('162', 'Q英雄', 'Qyingxiong', 'Qyingxiong.jpg', null, '钻石', null, '0', '0', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('163', '霸气三国', 'baqisanguo', 'baqisanguo.jpg', null, '元宝', null, '0', '0', '0', '1', 'B', null, null, null, null);
INSERT INTO `game` VALUES ('164', '神将传奇', 'shenjiangchuanqi', 'shenjiangchuanqi.jpg', null, '元宝', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('165', 'QQ御剑天涯', 'QQyujiantianya', 'QQyujiantianya.jpg', null, '仙缘', null, '0', '0', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('166', '九尾妖狐', 'jiuweiyaohu', 'jiuweiyaohu.png', null, '钻石', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('167', '富豪传奇', 'fuhaochuanqi', 'fuhaochuanqi.jpg', null, '金币', null, '0', '0', '0', '1', 'F', null, null, null, null);
INSERT INTO `game` VALUES ('168', '炉石英雄之联盟传说', 'lushiyingxiongzhilianmengchuanshuo', '0140321131525.jpg', null, '钻石', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('169', '妖姬三国', 'yaojisanguo', 'yaojisanguo.png', null, '元宝', null, '0', '0', '0', '1', 'Y', null, null, null, null);
INSERT INTO `game` VALUES ('170', '剑神世界3D', 'jianshenshijie3D', '3djianxianshijie.jpg', null, '钻石', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('171', '战神三国OL', 'zhanshensanguoOL', '13859781621167.jpg', null, '元宝', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('172', '四国战记', 'siguozhanji', 'siguozhanji.png', null, '晶钻', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('173', '调教三国', 'diaojiaosanguo', '13464850082736.jpg', null, '金锭', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('174', '串烧三国', 'chuanshaosanguo', 'chuanshaosanguo.jpg', null, '元宝', null, '0', '0', '0', '1', 'C', null, null, null, null);
INSERT INTO `game` VALUES ('175', '龙之守护', 'longzhishouhu', 'longzhishouhu.jpg', null, '宝石', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('176', '皇帝崛起', 'huangdijueqi', '13897695008224.jpg', null, '元宝', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('177', '热血海贼王HD', 'rexiehaizeiwangHD', 'rexuehaizhewang.png', null, '钻石', null, '0', '0', '0', '1', 'R', null, null, null, null);
INSERT INTO `game` VALUES ('178', '秦时明月', 'qinshimingyue', 'qins.jpg', null, '元宝', null, '1', '1', '0', '1', 'Q', '', null, null, null);
INSERT INTO `game` VALUES ('179', '银河护卫队（银河传说）', 'yinhehuweidui（yinhechuanshuo）', 'yinhe.jpg', null, '信用点', null, '0', '1', '0', '1', 'Y', null, null, null, null);
INSERT INTO `game` VALUES ('180', '卡你妹', 'qianimei', 'kanimei.jpg', null, '钻石', null, '0', '0', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('181', '天天星连萌', 'tiantianxinglianmeng', 'tiantianlianmeng.jpg', null, '钻石', null, '0', '1', '1', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('182', '雷霆战机', 'leitingzhanji', 'leit.jpg', null, '钻石', null, '0', '1', '1', '0', 'L', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('183', '陌陌争霸', 'momozhengba', 'momo.jpg', null, '宝石', null, '0', '0', '0', '0', 'M', '', null, null, null);
INSERT INTO `game` VALUES ('184', '金箍棒OL', 'jingubangOL', 'jingubang.png', null, '元宝', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('185', '真·三国无双：爆裂', 'zhen·sanguowushuang：baolie', null, null, '', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('186', '乱世之刃2', 'luanshizhiren2', 'luanshizhiren2.jpg', null, '元宝', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('187', '囧西游', 'jiongxiyou', 'jxiyou.jpg', null, '元宝', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('188', '天外飞仙OL', 'tianwaifeixianOL', 'tianwaifeixian.jpg', null, '元宝', null, '0', '1', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('189', '攻城掠地', 'gongchenglvedi', 'gong.jpg', null, '金币', null, '0', '1', '0', '1', 'G', '切直充，可切号', null, null, null);
INSERT INTO `game` VALUES ('190', '坦克风云', 'tankefengyun', 'tankefengyu.png', null, '金币', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('191', '航海大时代', 'hanghaidashidai', 'hanghaidashidai.jpg', null, '元', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('192', '炉石传说', 'lushichuanshuo', 'lushicuhanshuo.jpg', null, '', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('193', '钓鱼发烧友', 'diaoyufashaoyou', 'diaoyufasaoyou.jpg', null, '现金', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('194', '天天德州', 'tiantiandezhou', 'u15796598002420512616fm58.jpg', null, '钻石', null, '0', '0', '1', '1', 'T', '不可以用日本', null, null, null);
INSERT INTO `game` VALUES ('195', '海岛奇兵', 'haidaoqibing', 'haidaoqibing.jpg', null, '钻石', null, '0', '1', '0', '0', 'H', '', null, null, null);
INSERT INTO `game` VALUES ('196', '天天修仙OL', 'tiantianxiuxianOL', 'tiantianxiuxian.jpg', null, '元宝', null, '0', '1', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('197', '天天爱西游', 'tiantianaixiyou', 'tiantianaixiyou.jpg', null, '仙玉', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('198', '封神英雄', 'fengshenyingxiong', 'fengshenyingxiong.jpg', null, '钻石', null, '0', '0', '0', '1', 'F', null, null, null, null);
INSERT INTO `game` VALUES ('199', '崩坏学园2', 'benghuaixueyuan2', 'benghuaixueyuan2.jpg', null, '水晶', null, '0', '1', '0', '0', 'B', '（需要切号充）', null, null, null);
INSERT INTO `game` VALUES ('200', '主公莫慌', 'zhugongmohuang', 'zhugongmohuang.jpg', null, '绿钻', null, '1', '0', '0', '1', 'Z', '', null, null, null);
INSERT INTO `game` VALUES ('201', '进击的小伙伴', 'jinjidexiaohuoban', 'jinjidexiaohuoban.jpg', null, '金币', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('202', '黑暗光年', 'heianguangnian', 'heianguangnian.png', null, '水晶', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('203', '永生门', 'yongshengmen', '13854598148593.jpg', null, '元宝', null, '0', '0', '0', '1', 'Y', null, null, null, null);
INSERT INTO `game` VALUES ('204', '风云天下', 'fengyuntianxia', 'u3593142065434951129fm21gp0.jpg.png', null, '金币', null, '0', '0', '0', '1', 'F', '', null, null, null);
INSERT INTO `game` VALUES ('205', '梦幻火影', 'menghuanhuoying', 'menghuanhuoying.jpg', null, '钻石', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('206', '圣歌', 'shengge', 'shengge.jpg', null, '钻石', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('207', '忍者百分百', 'renzhebaifenbai', '14117967977660.jpg', null, '元宝', null, '0', '0', '0', '1', 'R', null, null, null, null);
INSERT INTO `game` VALUES ('208', '女神战记', 'nvshenzhanji', 'nvshenzhanji.jpg', null, '钻石', null, '0', '0', '0', '1', 'N', null, null, null, null);
INSERT INTO `game` VALUES ('209', '暴走武侠', 'baozouwuxia', 'baozouwuxia.jpg', null, '元宝', null, '1', '0', '0', '1', 'B', null, null, null, null);
INSERT INTO `game` VALUES ('210', '格斗江湖', 'gedoujianghu', 'gedou.jpg', null, '元宝', null, '0', '1', '0', '1', 'G', '', null, null, null);
INSERT INTO `game` VALUES ('211', '魔神契约', 'moshenqiyue', 'moshenqiyue.jpg', null, '钻石', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('212', '捕鱼达人2', 'buyudaren2', 'buyudaren.jpg', null, '宝石', null, '0', '0', '0', '1', 'B', null, null, null, null);
INSERT INTO `game` VALUES ('213', '乱世封神', 'luanshifengshen', 'luanshifengshen.png', null, '元宝', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('214', 'Q版三国志', 'Qbansanguozhi', 'qBANSANGUOZHI.jpg', null, '元宝', null, '0', '0', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('215', '暗黑魔王-英雄历险', 'anheimowang-yingxionglixian', 'anheimowang.png', null, '钻石', null, '0', '0', '0', '1', 'A', null, null, null, null);
INSERT INTO `game` VALUES ('216', '血族萝莉', 'xiezuluoli', 'u7648849202698910850fm11gp0.jpg', null, '钻石', null, '0', '0', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('217', '女帝', 'nvdi', 'nvdi.jpg', null, '钻石', null, '0', '0', '0', '1', 'N', null, null, null, null);
INSERT INTO `game` VALUES ('218', '乱世曲', 'luanshiqu', 'luanshiqu.jpg', null, '金钟', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('219', '仙国志', 'xianguozhi', 'xianguozhi.png', null, '金子', null, '0', '1', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('220', '陌陌劲舞团', 'momojingwutuan', 'momojingwutuo.jpg', null, '钻石', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('221', '醉西游', 'zuixiyou', 'zuixiyou.png', null, '元宝', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('222', '佣兵天下（神圣骑士）', 'yongbingtianxia（shenshengqishi）', 'yongbingtianxia.png', null, '金币', null, '0', '1', '0', '1', 'Y', null, null, null, null);
INSERT INTO `game` VALUES ('223', '第一偶像', 'diyiouxiang', 'diyiouxiang.png', null, '金', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('224', '防御英雄', 'fangyuyingxiong', 'fangyuyingxiong.jpg', null, '钻石', null, '0', '0', '0', '1', 'F', null, null, null, null);
INSERT INTO `game` VALUES ('225', '最强王者', 'zuiqiangwangzhe', 'zuiqiangwangzhe.jpg', null, '金砖', null, '0', '1', '0', '1', 'Z', '不可用日本充，会卡单', null, null, null);
INSERT INTO `game` VALUES ('226', '莽荒传奇', 'manghuangchuanqi', 'manghuanchuangqi.jpg', null, '', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('227', '全民小镇', 'quanminxiaozhen', 'quanmingxiaozhen.png', null, '钻石', null, '0', '1', '1', '0', 'Q', '需用人民币ID进行充值', null, null, null);
INSERT INTO `game` VALUES ('228', '人气动漫全明星', 'renqidongmanquanmingxing', 'renqidongmanquanmingx.png', null, '宝石', null, '0', '0', '0', '1', 'R', null, null, null, null);
INSERT INTO `game` VALUES ('229', 'line rangers', 'line rangers', 'line.png', null, '', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('230', '植物向前冲', 'zhiwuxiangqianchong', 'zhiwuxiangqianchong.png', null, '金券', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('231', '天天炫斗', 'tiantianxuandou', 'tiantianxuandou.jpg', null, '钻石', null, '0', '1', '1', '1', 'T', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('232', 'App充值', 'Appchongzhi', 'APP2.png', null, '元', null, '0', '0', '0', '1', 'A', null, null, null, null);
INSERT INTO `game` VALUES ('233', '暗黑君王', 'anheijunwang', 'anheijunwang.jpg', null, '元宝', null, '0', '0', '0', '1', 'A', null, null, null, null);
INSERT INTO `game` VALUES ('234', '霸气江湖', 'baqijianghu', 'baqijianghu.jpg', null, '元宝', null, '0', '1', '0', '1', 'B', null, null, null, '234');
INSERT INTO `game` VALUES ('235', '城堡争霸', 'chengbaozhengba', 'cheng.jpg', null, '宝石', null, '0', '1', '1', '0', 'C', '可用日本充', null, null, null);
INSERT INTO `game` VALUES ('236', '刀了个塔', 'daolegeta', 'daolegeta.png', null, '宝石', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('237', '帝国OnLine', 'diguoOnLine', 'diguoOL.jpg', null, '黄金或银币', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('238', '封神Q传', 'fengshenQchuan', 'fengshenQzhuan.png', null, '元宝', null, '0', '0', '0', '1', 'F', null, null, null, null);
INSERT INTO `game` VALUES ('239', '格斗大师', 'gedoudashi', 'gedoudashi.jpg', null, '元宝', null, '0', '0', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('240', '海贼幻想2', 'haizeihuanxiang2', 'haizeihuangxiang.png', null, '海贼币', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('241', '胡莱战国', 'hulaizhanguo', 'hulaizhanguo.jpg', null, '钻', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('242', '幻想三国', 'huanxiangsanguo', 'huanxiangsanguo.jpg', null, '金砖', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('243', '幻想三国志', 'huanxiangsanguozhi', 'huanxiangsanguozhi.jpg', null, '元宝', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('244', '江湖OL', 'jianghuOL', 'jianghu.jpg', null, '元宝', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('245', '进击的英雄', 'jinjideyingxiong', 'jinjideyingxiong.png', null, '水晶', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('246', '口袋奇迹', 'koudaiqiji', 'koudaijiqi.png', null, '钻石', null, '0', '0', '0', '1', 'K', '', null, null, null);
INSERT INTO `game` VALUES ('247', '龙将无双', 'longjiangwushuang', 'longjiangwushuang.png', null, '元宝', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('248', '龙纹三国', 'longwensanguo', 'longw.jpg', null, '金币', null, '0', '1', '0', '1', 'L', '', null, null, null);
INSERT INTO `game` VALUES ('249', '猛将无双', 'mengjiangwushuang', 'mengjiangwushuang.jpg', null, '元宝', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('250', '逆转天下', 'nizhuantianxia', 'nizhuantianxia.jpg', null, '元宝', null, '0', '0', '0', '1', 'N', null, null, null, null);
INSERT INTO `game` VALUES ('251', '女神无双', 'nvshenwushuang', 'nvshenwushuang.jpg', null, '元宝', null, '0', '0', '0', '1', 'N', null, null, null, null);
INSERT INTO `game` VALUES ('252', '全民打怪兽', 'quanmindaguaishou', 'quanmingdaguaishou.jpg', null, '钻石', null, '0', '1', '1', '0', 'Q', '可用日本充', null, null, null);
INSERT INTO `game` VALUES ('253', '全民砰砰砰', 'quanminpengpengpeng', 'quanmingpengpengpeng.jpg', null, '钻石', null, '0', '0', '1', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('254', '全民炫舞', 'quanminxuanwu', 'u42178789902734299956fm23gp0.jpg', null, '钻石', null, '0', '1', '1', '0', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('255', '忍者传说：火影英雄传', 'renzhechuanshuo：huoyingyingxiongchuan', 'renzhechuanshuo.jpg', null, '金币', null, '0', '0', '0', '1', 'R', null, null, null, null);
INSERT INTO `game` VALUES ('256', '天下', 'tianxia', 'tianxia.png', null, '元宝', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('257', '无双三国', 'wushuangsanguo', 'wushuangsanguo.jpg', null, '元宝', null, '0', '0', '0', '1', 'W', null, null, null, null);
INSERT INTO `game` VALUES ('258', '天天风之旅', 'tiantianfengzhilv', 'f.png', null, '钻石', null, '0', '1', '1', '0', 'T', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('259', '仙魔诀', 'xianmojue', 'xianmojue.jpg', null, '元宝', null, '0', '0', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('260', '进击吧！勇者', 'jinjiba！yongzhe', '14017821005840.jpg', null, '钻石', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('261', '妖精去哪儿', 'yaojingqunaer', 'yaojingqunaer.jpg', null, '元宝', null, '0', '0', '0', '1', 'Y', null, null, null, null);
INSERT INTO `game` VALUES ('262', '战姬天下', 'zhanjitianxia', 'zhanjitianxia.jpg', null, '金币', null, '0', '1', '0', '1', 'Z', '可直充', null, null, null);
INSERT INTO `game` VALUES ('263', '战神', 'zhanshen', 'zhanshen.jpg', null, '元宝', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('264', '迷你西游', 'minixiyou', 'minixiyou.jpg', null, '元宝', null, '0', '0', '0', '1', 'M', '', null, null, null);
INSERT INTO `game` VALUES ('265', '梦想海贼王', 'mengxianghaizeiwang', '13850384833137.png', null, '', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('266', '街机海贼王', 'jiejihaizeiwang', '13962567184485.png', null, '元宝', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('267', '绿茶妹', 'lvchamei', '13853520585668.png', null, '金币', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('268', '勇者前线', 'yongzheqianxian', '13987620796150.jpg', null, '钻石', null, '0', '0', '0', '1', 'Y', null, null, null, null);
INSERT INTO `game` VALUES ('269', '三国霸王大陆加强版', 'sanguobawangdalujiaqiangban', '13794849672910.jpg', null, '元宝', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('270', '冒险王', 'maoxianwang', '1111.jpg', null, '哈斯币', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('271', '摩尔庄园', 'moerzhuangyuan', '13904716387532.jpg', null, '超级贝壳', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('272', '晴天小狗', 'qingtianxiaogou', '13408678583800.jpg', null, '骨头', null, '0', '0', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('273', '东邪西毒', 'dongxiexidu', '13965891241339.jpg', null, '元宝', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('274', '新忍者必须死2', 'xinrenzhebixusi2', 'renzhebixusi2.jpg', null, '勾玉', null, '0', '0', '0', '0', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('275', '格斗之皇', 'gedouzhihuang', '55d3d539b6003af3d662e5ea372ac65c1138b664.png', null, '', null, '0', '0', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('276', '大闹天宫HD', 'danaotiangongHD', 'danao.jpg', null, '元宝', null, '0', '1', '0', '1', 'D', '', null, null, null);
INSERT INTO `game` VALUES ('277', '超级英雄', 'chaojiyingxiong', 'chaoji.jpg', null, '钻石', null, '1', '1', '0', '1', 'C', '', null, null, null);
INSERT INTO `game` VALUES ('278', '锁链战记', 'suolianzhanji', 'QQ20140609105043.jpg', null, '精灵石', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('279', '全民修仙', 'quanminxiuxian', 'u41381005120512824fm58.jpg', null, '元宝', null, '0', '0', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('280', '神魔大陆', 'shenmodalu', '14020198526786.jpg', null, '树叶', null, '1', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('281', '天龙八部3D', 'tianlongbabu3D', 't.jpg', null, '元宝', null, '0', '0', '0', '1', 'T', '', null, null, null);
INSERT INTO `game` VALUES ('282', '囧西游（囧闹天宫）', 'jiongxiyou（jiongnaotiangong）', 'j.jpg', null, '元宝', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('283', '伊甸', 'yidian', '14164755772301.jpg', null, '钻石', null, '0', '0', '0', '1', 'Y', null, null, null, null);
INSERT INTO `game` VALUES ('284', '梦幻神界', 'menghuanshenjie', '13787113004773.png', null, '元宝', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('285', '新三国争霸', 'xinsanguozhengba', '13952843413667.jpg', null, '黄金', null, '0', '1', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('286', 'lovelive', 'lovelive', '2262-1404111624320-L.png', null, '心', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('287', '天尊', 'tianzun', 'common_2433_icon.jpg', null, '元宝', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('288', '全民水浒', 'quanminshuihu', 'quanminshuihu.jpg', null, '银票', null, '0', '1', '1', '1', 'Q', '会卡单，必须rmb充', null, null, null);
INSERT INTO `game` VALUES ('289', '永恒之井', 'yonghengzhijing', 'yonghengzhijin.jpg', null, '钻石', null, '0', '0', '0', '1', 'Y', null, null, null, null);
INSERT INTO `game` VALUES ('290', '功夫西游', 'gongfuxiyou', '13988430409650.png', null, '元宝', null, '0', '0', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('291', '幻想江湖', 'huanxiangjianghu', '512x512.png', null, '文', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('292', '热血战纪', 'rexiezhanji', 'a98742a3325314d545e092787e0d7dae_90_90.jpg', null, '元宝', null, '0', '0', '0', '1', 'R', null, null, null, null);
INSERT INTO `game` VALUES ('293', '微信表情', 'weixinbiaoqing', 'u14464731804156404596fm23gp0.jpg', null, '', null, '0', '0', '0', '1', 'W', null, null, null, null);
INSERT INTO `game` VALUES ('294', '黄金圣斗士', 'huangjinshengdoushi', '13868421763316.jpg', null, '', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('295', '萌将冲冲冲', 'mengjiangchongchongchong', 'mjccc_thumb.jpg', null, '元宝', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('296', '众将听令', 'zhongjiangtingling', 'zhongjiangtingling_thumb.jpg', null, '萌币', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('297', '全民精灵', 'quanminjingling', '2262-14060Z93052139.png', null, '钻石', null, '0', '1', '1', '1', 'Q', '可用日本充', null, null, null);
INSERT INTO `game` VALUES ('298', '血族', 'xiezu', 'u11157326362483974251fm58.jpg', null, '钻石', null, '0', '0', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('299', '欢乐西游', 'huanlexiyou', 'huanlexi.jpg', null, '钻石', null, '0', '1', '1', '1', 'H', '', null, null, null);
INSERT INTO `game` VALUES ('300', '大武侠物语', 'dawuxiawuyu', 'dawuxiawuyu.jpg', null, '元宝', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('301', '热斗领域', 'redoulingyu', 'rdly.jpg', null, '金钻', null, '0', '1', '0', '1', 'R', null, null, null, null);
INSERT INTO `game` VALUES ('302', '天天来取经', 'tiantianlaiqujing', 'u33449081152568008714fm58.png', null, '元宝', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('303', '狐狸精', 'hulijing', 'icon.png', null, '元宝', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('304', '变形金刚', 'bianxingjingang', '13981510893826.jpg', null, '赛星币', null, '0', '0', '0', '1', 'B', null, null, null, null);
INSERT INTO `game` VALUES ('305', '决战沙城', 'juezhanshacheng', 'juezhan.jpg', null, '元宝', null, '0', '1', '0', '1', 'J', '', null, null, null);
INSERT INTO `game` VALUES ('306', '帝王三国', 'diwangsanguo', 'u25182912473602880451fm23gp0.jpg', null, '黄金', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('307', '剑の灵', 'jianのling', 'u32098662043946238864fm15gp0.jpg.png', null, '元宝', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('308', '刀塔联盟', 'daotalianmeng', '13956457222182.jpg', null, '钻石', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('309', '酷酷爱魔兽', 'kukuaimoshou', 'kukuaimoshou.jpg', null, '钻石', null, '1', '1', '0', '1', 'K', null, null, null, null);
INSERT INTO `game` VALUES ('310', '疾风勇者传', 'jifengyongzhechuan', 'jifeng.jpg', null, '钻石', null, '0', '1', '0', '1', 'J', '', null, null, null);
INSERT INTO `game` VALUES ('311', '魔灵召唤', 'molingzhaohuan', '14030739774414.jpg', null, '水晶', null, '0', '0', '0', '1', 'M', '', null, null, null);
INSERT INTO `game` VALUES ('312', '仙之痕', 'xianzhihen', '14029038581175.jpg', null, '五彩石', null, '0', '0', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('313', '一起闯三国', 'yiqichuangsanguo', '14085017873968.jpg', null, '元宝', null, '0', '0', '0', '1', 'Y', null, null, null, null);
INSERT INTO `game` VALUES ('314', '天天富翁', 'tiantianfuweng', 'tiantianfuwong.jpg', null, '钻石', null, '0', '1', '1', '0', 'T', '下单失败，必须rmb充', null, null, null);
INSERT INTO `game` VALUES ('315', '嚣张大冒险', 'xiaozhangdamaoxian', null, null, '', null, '0', '0', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('316', '龙骑战歌', 'longqizhange', null, null, '', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('317', '幻想武侠', 'huanxiangwuxia', null, null, '', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('318', '不败战神', 'bubaizhanshen', 'bu.jpg', null, '元宝', null, '0', '0', '0', '1', 'B', '', null, null, null);
INSERT INTO `game` VALUES ('319', '逆战三国志', 'nizhansanguozhi', null, null, '', null, '0', '0', '0', '1', 'N', null, null, null, null);
INSERT INTO `game` VALUES ('320', '嗨皮海贼团', 'haipihaizeituan', null, null, '', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('321', '暗黑复仇者', 'anheifuchouzhe', null, null, 'Gem', null, '0', '0', '0', '1', 'A', null, null, null, null);
INSERT INTO `game` VALUES ('322', '三国志乱消', 'sanguozhiluanxiao', null, null, '', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('323', '暗黑战神 ', 'anheizhanshen ', '3.jpg', null, '钻石礼包', null, '0', '0', '0', '1', 'A', null, null, null, null);
INSERT INTO `game` VALUES ('324', '暗黑3', 'anhei3', '2.jpg', null, '金币', null, '0', '0', '0', '1', 'A', '', null, null, null);
INSERT INTO `game` VALUES ('325', '新英雄之剑', 'xinyingxiongzhijian', '14071377629870_1.jpg', null, '红宝石', null, '0', '0', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('326', '最萌英雄', 'zuimengyingxiong', '14012603697882.jpg', null, '水晶', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('327', '巨人的进击', 'jurendejinji', null, null, '', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('328', '遗迹之塔', 'yijizhita', 'yijizhita.png', null, '金币', null, '0', '1', '0', '1', 'Y', null, null, null, null);
INSERT INTO `game` VALUES ('329', '天才樱木', 'tiancaiyingmu', null, null, '', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('330', '格斗火影', 'gedouhuoying', null, null, '', null, '0', '0', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('331', '现代战争5 眩晕风暴', 'xiandaizhanzheng5 xuanyunfengbao', null, null, '', null, '0', '0', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('332', '地牢女王', 'dilaonvwang', null, null, '', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('333', '三国战神', 'sanguozhanshen', null, null, '', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('334', '变形金刚：崛起', 'bianxingjingang：jueqi', null, null, '', null, '0', '0', '0', '1', 'B', null, null, null, null);
INSERT INTO `game` VALUES ('335', '忍者降临', 'renzhejianglin', null, null, '', null, '0', '0', '0', '1', 'R', null, null, null, null);
INSERT INTO `game` VALUES ('336', '轩辕争霸', 'xuanyuanzhengba', 'xyzb.jpg', null, '元宝', null, '0', '0', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('337', '红刃', 'hongren', null, null, '', null, '0', '0', '0', '1', 'H', null, null, null, null);
INSERT INTO `game` VALUES ('338', '刀塔来了', 'daotalaile', null, null, '', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('339', '霸天下', 'batianxia', null, null, '', null, '0', '0', '0', '1', 'B', null, null, null, null);
INSERT INTO `game` VALUES ('340', '龙之骑士团', 'longzhiqishituan', null, null, '', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('341', '洪荒ol', 'honghuangol', 'hong.jpg', null, '灵玉', null, '0', '1', '0', '1', 'H', '', null, null, null);
INSERT INTO `game` VALUES ('342', '笑傲江湖', 'xiaoaojianghu', 'xiao.jpg', null, '元宝', null, '0', '1', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('343', '帝国(Empire）', 'diguo(Empire）', 'jpg.jpg', null, '红宝石', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('344', '大话来了', 'dahualaile', '14053141459994.jpg', null, '金币包', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('345', '格斗刀魂', 'gedoudaohun', '14064618175977.jpg', null, '钻石', null, '0', '0', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('346', '龙族崛起', 'longzujueqi', '13788666168464.jpg', null, '红宝石', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('347', '媚三国', 'meisanguo', '14056696962070.jpg', null, '元宝', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('348', '天剑奇缘', 'tianjianqiyuan', 'tianjianqiyuan.jpg', null, '元宝', null, '0', '1', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('349', '推翻那部落（龙骑帝国）', 'tuifannabuluo（longqidiguo）', '2262-1406051325210-L.png', null, '元宝', null, '0', '1', '1', '1', 'T', '要切号', null, null, null);
INSERT INTO `game` VALUES ('350', '天天戳吕布', 'tiantianchuolvbu', 'tiantianchuolvbu.jpg', null, '元宝', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('351', '愤怒的小鸟：Stella', 'fennudexiaoniao：Stella', null, null, '', null, '0', '0', '0', '1', 'F', null, null, null, null);
INSERT INTO `game` VALUES ('352', 'Q将无双', 'Qjiangwushuang', null, null, '', null, '0', '0', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('353', '天劫', 'tianjie', null, null, '', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('354', '兽血猛将', 'shouxiemengjiang', null, null, '', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('355', '神武', 'shenwu', '14089607448096.jpg', null, '元宝', null, '0', '1', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('356', '梅露可物语', 'meilukewuyu', '14083308964433.jpg', null, '钻石', null, '0', '1', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('357', '吞噬星空', 'tunshixingkong', '13989195531072.jpg', null, '钻石', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('358', '掌上封神', 'zhangshangfengshen', '14096512837405.jpg', null, '元宝', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('359', '全民战神', 'quanminzhanshen', null, null, '', null, '0', '0', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('360', '众神之光', 'zhongshenzhiguang', null, null, '', null, '0', '0', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('361', '怪物猎人：大狩猎', 'guaiwulieren：dashoulie', null, null, '', null, '0', '0', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('362', '全民魔兽(萨尔酋长)', 'quanminmoshou(saerqiuchang)', '14089601461550.jpg', null, '符石', null, '0', '1', '0', '0', 'Q', '', null, null, null);
INSERT INTO `game` VALUES ('363', '暴走神仙', 'baozoushenxian', 'QQ20140905131504.jpg', null, '元宝', null, '0', '0', '0', '1', 'B', null, null, null, null);
INSERT INTO `game` VALUES ('364', '超神传说', 'chaoshenchuanshuo', null, null, '', null, '0', '0', '0', '1', 'C', null, null, null, null);
INSERT INTO `game` VALUES ('365', '三国之刃', 'sanguozhiren', '14138789646334.png', null, '元宝', null, '0', '0', '1', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('366', '乱斗西游', 'luandouxiyou', 'l.png', null, '元宝', null, '0', '0', '0', '1', 'L', '', null, null, null);
INSERT INTO `game` VALUES ('367', '君临天下', 'junlintianxia', 'jun.jpg', null, '元宝', null, '0', '1', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('368', '全民切水果', 'quanminqieshuiguo', 'u18732908462497541940fm58.png', null, '钻石', null, '0', '1', '1', '0', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('369', 'SamuraiSiege(战士围城)', 'SamuraiSiege(zhanshiweicheng)', 'QQ20141104012227.jpg', null, '钻石', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('370', '全民农场', 'quanminnongchang', 'u15773572823861130774fm23gp0.jpg.png', null, '钻石', null, '0', '1', '1', '0', 'Q', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('371', '游龙英雄', 'youlongyingxiong', 'f4bf6e06df73336ffc50d2e702ef993a_121_121.jpg', null, '钻石', null, '0', '0', '1', '1', 'Y', '需要挂机一段时间才弹框', null, null, null);
INSERT INTO `game` VALUES ('372', '灌篮来了', 'guanlanlaile', 'guan.jpg', null, '证券', null, '0', '1', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('373', '陌陌', 'momo', 'u26826937943031831083fm23gp0.jpg.png', null, '陌陌币', null, '0', '0', '0', '1', 'M', null, null, null, null);
INSERT INTO `game` VALUES ('374', '太极熊猫', 'taijixiongmao', '14013430634849.png', null, '钻石', null, '1', '1', '0', '1', 'T', '', null, null, null);
INSERT INTO `game` VALUES ('375', '七雄争霸', 'qixiongzhengba', 'qixiong.jpg', null, '元宝', null, '0', '1', '1', '1', 'Q', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('376', '女神联盟', 'nvshenlianmeng', 'nvshen.jpg', null, '钻石', null, '1', '1', '0', '1', 'N', '', null, null, null);
INSERT INTO `game` VALUES ('377', '我是死神', 'woshisishen', 'woshi.jpg', null, '钻石', null, '0', '0', '0', '1', 'W', '', null, null, null);
INSERT INTO `game` VALUES ('378', '全民挂机', 'quanminguaji', 'quanm.jpg', null, '钻石', null, '0', '0', '0', '1', 'Q', '', null, null, null);
INSERT INTO `game` VALUES ('379', '霸世英雄', 'bashiyingxiong', 'ba.jpg', null, '金条', null, '0', '1', '1', '1', 'B', '日本直接充', null, null, null);
INSERT INTO `game` VALUES ('380', '糖果传奇', 'tangguochuanqi', 'tang.jpg', null, '金条包', null, '0', '1', '1', '1', 'T', '只能小宇阿俊充', null, null, null);
INSERT INTO `game` VALUES ('381', '悟空归来', 'wukongguilai', 'wukong.jpg', null, '钻石', null, '0', '0', '0', '1', 'W', null, null, null, null);
INSERT INTO `game` VALUES ('382', '实况俱乐部', 'shikuangjulebu', 'shikuang.jpg', null, '金球', null, '0', '1', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('383', '我家公主最可爱 ', 'wojiagongzhuzuikeai ', 'wjia.jpg', null, '彩钻', null, '0', '1', '0', '1', 'W', null, null, null, null);
INSERT INTO `game` VALUES ('384', '刀塔帝国 ', 'daotadiguo ', 'daota.png', null, '钻石', null, '0', '1', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('385', '塔塔塔防陌陌哒', 'tatatafangmomoda', 'tatata.jpg', null, '宝石', null, '0', '0', '0', '1', 'T', null, null, null, null);
INSERT INTO `game` VALUES ('386', '天天来战', 'tiantianlaizhan', '14138613274345.jpg', null, '钻石', null, '0', '1', '1', '1', 'T', '会卡单，必须rmb充', null, null, null);
INSERT INTO `game` VALUES ('387', '仙剑奇侠传', 'xianjianqixiachuan', 'xian.png', null, '元宝', null, '0', '0', '1', '1', 'X', '需要挂机一段时间才弹框', null, null, null);
INSERT INTO `game` VALUES ('388', '开心消消乐', 'kaixinxiaoxiaole', 'kaixin.jpg', null, '风车币', null, '0', '1', '0', '1', 'K', '可用日本充', null, null, null);
INSERT INTO `game` VALUES ('389', '唱吧', 'changba', 'changba.jpg', null, '金币', null, '0', '0', '0', '1', 'C', null, null, null, null);
INSERT INTO `game` VALUES ('390', '星座女神', 'xingzuonvshen', 'xing.jpg', null, '钻石', null, '0', '0', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('391', '七骑士', 'qiqishi', 'qi.png', null, '红宝石', null, '0', '1', '1', '0', 'Q', '需用人民币ID方可进行充值', null, null, null);
INSERT INTO `game` VALUES ('392', '怪物弹珠', 'guaiwudanzhu', 'guaiwu.png', null, '宝珠', null, '0', '1', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('393', '灌篮高手', 'guanlangaoshou', 'guanlan.jpg', null, '钻石', null, '0', '1', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('394', '变身吧主公', 'bianshenbazhugong', 'bian.jpg', null, '元宝', null, '0', '1', '0', '1', 'B', null, null, null, null);
INSERT INTO `game` VALUES ('395', '新征途', 'xinzhengtu', 'zheng.jpg', null, '银两包', null, '1', '1', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('396', '全民奇迹', 'quanminqiji', 'quanming.jpg', null, '钻石', null, '0', '0', '0', '1', 'Q', '', null, null, null);
INSERT INTO `game` VALUES ('397', '杀手：狙击之神', 'shashou：jujizhishen', 'sha.jpg', null, '金条', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('398', '仙侠道', 'xianxiadao', 'xian.jpg', null, '元宝', null, '0', '0', '0', '1', 'X', null, null, null, null);
INSERT INTO `game` VALUES ('399', '三国威力加强版', 'sanguoweilijiaqiangban', 'sanguo.jpg', null, '元宝', null, '0', '1', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('400', '新勇者前线', 'xinyongzheqianxian', 'yong.jpg', null, '钻石', null, '0', '0', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('401', '加勒比海盗', 'jialebihaidao', 'jia.jpg', null, '钻石', null, '0', '1', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('402', '加勒比海盗', 'jialebihaidao', 'jia.jpg', null, '钻石', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('403', '战地坦克', 'zhanditanke', 'tan.jpg', null, '金币', null, '0', '1', '0', '1', 'Z', null, null, null, null);
INSERT INTO `game` VALUES ('404', '末日争霸', 'morizhengba', 'mo.jpg', null, '金币', null, '0', '0', '0', '1', 'M', '', null, null, null);
INSERT INTO `game` VALUES ('405', '暗黑黎明', 'anheiliming', 'anhei.jpg', null, '钻石', null, '0', '0', '0', '1', 'A', '', null, null, null);
INSERT INTO `game` VALUES ('406', '我叫MT2', 'wojiaoMT2', 'WO.jpg', null, '符石', null, '0', '0', '1', '1', 'W', '需要挂机一段时间才弹框', null, null, null);
INSERT INTO `game` VALUES ('407', '刀剑传奇', 'daojianchuanqi', 'dao.jpg', null, '钻石', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('408', '暴打魏蜀吴', 'baodaweishuwu', 'bao.png', null, '元宝', null, '0', '0', '0', '1', 'B', '', null, null, null);
INSERT INTO `game` VALUES ('409', '塔防三国志（加强版）', 'tafangsanguozhi（jiaqiangban）', 'tafang.jpg', null, '套餐', null, '0', '0', '0', '1', 'T', '', null, null, null);
INSERT INTO `game` VALUES ('410', '狙击之王3D', 'jujizhiwang3D', 'juji.png', null, '', null, '0', '0', '0', '1', 'J', null, null, null, null);
INSERT INTO `game` VALUES ('411', '生死阻击OL', 'shengsizujiOL', 's.jpg', null, '子弹', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('412', '天下HD', 'tianxiaHD', 'tian.jpg', null, '元宝', null, '0', '0', '0', '1', 'T', '', null, null, null);
INSERT INTO `game` VALUES ('413', '圣斗士星矢', 'shengdoushixingshi', 'sheng.jpg', null, '星钻', null, '0', '1', '0', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('414', '格斗冒险岛', 'gedoumaoxiandao', 'ge.jpg', null, '元宝', null, '0', '0', '0', '1', 'G', null, null, null, null);
INSERT INTO `game` VALUES ('415', 'SimCity BuildIt ', 'SimCity BuildIt ', 'SimCity_BuildIt.png', null, 'simCash', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('416', '指尖刀塔', 'zhijiandaota', 'zhijian.jpg', null, '钻石', null, '0', '1', '0', '1', 'Z', '', null, null, null);
INSERT INTO `game` VALUES ('417', '全民破坏神', 'quanminpohuaishen', '14194123674077.jpg', null, '钻石', null, '0', '0', '1', '1', 'Q', '可以用日本', null, null, null);
INSERT INTO `game` VALUES ('418', '大召唤师', 'dazhaohuanshi', '13953024373442.jpg', null, '钻石', null, '0', '0', '0', '1', 'D', null, null, null, null);
INSERT INTO `game` VALUES ('419', '暖暖环游世界', 'nuannuanhuanyoushijie', '14038421705813.jpg', null, '钻石', null, '0', '1', '0', '1', 'N', null, null, null, null);
INSERT INTO `game` VALUES ('420', '开心水族箱', 'kaixinshuizuxiang', '13557314913657.jpg', null, '贝币', null, '0', '0', '0', '1', 'K', null, null, null, null);
INSERT INTO `game` VALUES ('421', '神女控', 'shennvkong', '13659274854587.png', null, '宝石', null, '0', '0', '0', '1', 'S', null, null, null, null);
INSERT INTO `game` VALUES ('422', 'Ayakashi(灵异阴阳录)', 'Ayakashi(lingyiyinyanglu)', '13587378673329.png', null, '金币', null, '0', '0', '0', '1', 'A', null, null, null, null);
INSERT INTO `game` VALUES ('423', '三国战神3D', 'sanguozhanshen3D', '13962519631871.jpg', null, '元宝', null, '0', '0', '0', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('424', '王者帝国', 'wangzhediguo', '13409683228658.jpg', null, '', null, '0', '0', '0', '1', 'W', null, null, null, null);
INSERT INTO `game` VALUES ('425', '魔域口袋版', 'moyukoudaiban', 'moyu.jpg', null, '魔石', null, '0', '0', '0', '1', 'M', '', null, null, null);
INSERT INTO `game` VALUES ('426', '王者帝国（豪华版）', 'wangzhediguo（haohuaban）', 'wang.jpg', null, '', null, '0', '0', '0', '1', 'W', null, null, null, null);
INSERT INTO `game` VALUES ('427', '龙印2', 'longyin2', 'long.png', null, '金票', null, '0', '0', '0', '1', 'L', null, null, null, null);
INSERT INTO `game` VALUES ('428', '欢乐斗牛', 'huanledouniu', 'huanle.jpg', null, '钻石', null, '0', '1', '1', '1', 'H', '可用日本充', null, null, null);
INSERT INTO `game` VALUES ('429', '全民突击', 'quanmintuji', '2150436ac984b9c57b6873acda9ffc79_121_121.jpg', null, '钻石', null, '0', '1', '1', '1', 'Q', '会卡单，必须rmb充', null, null, null);
INSERT INTO `game` VALUES ('430', '三国杀传奇', 'sanguoshachuanqi', 'san.jpg', null, '元宝', null, '0', '0', '0', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('431', '无敌唤灵', 'wudihuanling', 'wudi.jpg', null, '元宝', null, '0', '1', '0', '1', 'W', null, null, null, null);
INSERT INTO `game` VALUES ('432', '烈焰之刃', 'lieyanzhiren', 'lie.jpg', null, '元宝', null, '0', '1', '0', '1', 'L', '', null, null, null);
INSERT INTO `game` VALUES ('433', '忍者之王', 'renzhezhiwang', 'renzhe.jpg', null, '金币', null, '0', '1', '0', '1', 'R', null, null, null, null);
INSERT INTO `game` VALUES ('434', '三国武神（武神）', 'sanguowushen（wushen）', 'wushen.png', null, '元宝', null, '0', '1', '0', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('435', '全民宝贝', 'quanminbaobei', 'quanmi.jpg', null, '钻石', null, '0', '1', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('436', '航海王启航', 'hanghaiwangqihang', 'hang.jpg', null, '钻石', null, '0', '1', '0', '1', 'H', '', null, null, null);
INSERT INTO `game` VALUES ('437', '一刀流', 'yidaoliu', 'yi.png', null, '元宝', null, '1', '1', '0', '1', 'Y', '', null, null, null);
INSERT INTO `game` VALUES ('438', '全民闯天下', 'quanminchuangtianxia', 'quan.png', null, '钻石', null, '0', '1', '1', '1', 'Q', '下单失败，必须rmb充', null, null, null);
INSERT INTO `game` VALUES ('439', '天天斗三国', 'tiantiandousanguo', 'tt.jpg', null, '宝石', null, '0', '1', '1', '1', 'T', '可用日本充值', null, null, null);
INSERT INTO `game` VALUES ('440', 'qq斗地主', 'qqdoudizhu', 'qq.jpg', null, '', null, '0', '0', '0', '1', 'Q', null, null, null, null);
INSERT INTO `game` VALUES ('441', '龙之狂热', 'longzhikuangre', 'long.jpg', null, '钻石', null, '0', '0', '0', '1', 'L', '', null, null, null);
INSERT INTO `game` VALUES ('442', 'WWE Immortals', 'WWE Immortals', 'chao.png', null, '游戏币', null, '0', '0', '0', '1', 'W', '', null, null, null);
INSERT INTO `game` VALUES ('443', '魔力时代', 'molishidai', '14219948751672.jpg', null, '钻石', null, '0', '1', '0', '1', 'M', '', null, null, null);
INSERT INTO `game` VALUES ('444', '天天来塔防', 'tiantianlaitafang', '14132644742991.jpg', null, '钻石', null, '0', '1', '1', '1', 'T', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('445', '塔防骑士团', 'tafangqishituan', '14176644969101.jpg', null, '水晶', null, '0', '0', '0', '1', 'T', '', null, null, null);
INSERT INTO `game` VALUES ('446', '全民帝王', 'quanmindiwang', 'u3817782914900620167fm11gp0.jpg.png', null, '金币', null, '0', '0', '0', '1', 'Q', '', null, null, null);
INSERT INTO `game` VALUES ('447', '红警坦克世界2014', 'hongjingtankeshijie2014', 'u5804343452018095388fm21gp0.jpg.png', null, '宝石', null, '0', '0', '0', '1', 'H', '', null, null, null);
INSERT INTO `game` VALUES ('448', '全民泡泡大战', 'quanminpaopaodazhan', '14229536572355.jpg', null, '钻石', null, '0', '1', '1', '1', 'Q', '可以用日本', null, null, null);
INSERT INTO `game` VALUES ('449', '西游神魔决', 'xiyoushenmojue', '14224319943279.jpg', null, '玉帛', null, '0', '0', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('450', '天天挂机', 'tiantianguaji', '14117103065205.jpg', null, '钻石', null, '0', '1', '0', '1', 'T', '', null, null, null);
INSERT INTO `game` VALUES ('451', '明星梦工厂', 'mingxingmenggongchang', '14098835439768.jpg', null, '钻石', null, '0', '0', '0', '1', 'M', '', null, null, null);
INSERT INTO `game` VALUES ('452', '龙界启示录', 'longjieqishilu', 'u25175524843717427834fm11gp0.jpg', null, '水晶', null, '0', '1', '1', '1', 'L', '可用日本充', null, null, null);
INSERT INTO `game` VALUES ('453', '狂野飙车8', 'kuangyebiaoche8', '13771351392084.png', null, '', null, '0', '0', '0', '1', 'K', '', null, null, null);
INSERT INTO `game` VALUES ('454', '口袋侏罗纪', 'koudaizhuluoji', '14220012399005.jpg', null, '', null, '0', '0', '0', '1', 'K', '', null, null, null);
INSERT INTO `game` VALUES ('455', '武媚娘传奇', 'wumeiniangchuanqi', '14193063856634.jpg', null, '', null, '0', '1', '0', '1', 'W', '', null, null, null);
INSERT INTO `game` VALUES ('456', '萌卡篮球', 'mengqialanqiu', 'meng.jpg', null, '', null, '0', '1', '0', '1', 'M', '', null, null, null);
INSERT INTO `game` VALUES ('457', '烈火遮天', 'liehuozhetian', '14117189746290.jpg', null, '', null, '0', '0', '0', '1', 'L', '', null, null, null);
INSERT INTO `game` VALUES ('458', '风暴传说', 'fengbaochuanshuo', '14204398627018.jpg', null, '', null, '0', '1', '0', '1', 'F', '', null, null, null);
INSERT INTO `game` VALUES ('459', 'NBA英雄', 'NBAyingxiong', '14189818516795.jpg', null, '', null, '0', '1', '0', '1', 'N', '', null, null, null);
INSERT INTO `game` VALUES ('460', '真吞食天地', 'zhentunshitiandi', '14176000497521.jpg', null, '', null, '0', '0', '0', '1', 'Z', '', null, null, null);
INSERT INTO `game` VALUES ('461', '大航海时代5', 'dahanghaishidai5', '14131828152889.jpg', null, '', null, '0', '0', '0', '1', 'D', '', null, null, null);
INSERT INTO `game` VALUES ('462', '新三国萌将录', 'xinsanguomengjianglu', 'u3073504075791432711fm21gp0.jpg', null, '', null, '0', '0', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('463', '火柴人联盟', 'huochairenlianmeng', '14193190597476.jpg', null, '', null, '0', '0', '0', '1', 'H', '', null, null, null);
INSERT INTO `game` VALUES ('464', '一骑当千', 'yiqidangqian', 'u27656237216268811fm21gp0.jpg.png', null, '', null, '0', '0', '0', '1', 'Y', '', null, null, null);
INSERT INTO `game` VALUES ('465', '仙侠风云', 'xianxiafengyun', 'u42676950142710231662fm21gp0.jpg', null, '', null, '0', '0', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('466', '梦幻仙灵', 'menghuanxianling', '14219965408588.jpg', null, '', null, '0', '0', '0', '1', 'M', '', null, null, null);
INSERT INTO `game` VALUES ('467', '武圣三国', 'wushengsanguo', 'u34214534413302339796fm11gp0.jpg', null, '', null, '0', '0', '0', '1', 'W', '', null, null, null);
INSERT INTO `game` VALUES ('468', '疾风猎人', 'jifenglieren', 'u28332609134194841259fm15gp0.jpg.png', null, '', null, '0', '0', '0', '1', 'J', '', null, null, null);
INSERT INTO `game` VALUES ('469', '大闹三国', 'danaosanguo', 'danao.jpg', null, '', null, '0', '1', '1', '1', 'D', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('470', '少年三国志', 'shaoniansanguozhi', '14222676081305.jpg', null, '', null, '0', '1', '0', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('471', '西游释厄传', 'xiyoushiechuan', 'u4127775220522693231fm15gp0.jpg.png', null, '', null, '0', '0', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('472', '大主宰', 'dazhuzai', '14229309776470.jpg', null, '', null, '0', '1', '0', '1', 'D', '俊鹏可直充，其他切号', null, null, null);
INSERT INTO `game` VALUES ('473', '霸三国大战', 'basanguodazhan', 'u30130470492162733743fm15gp0.jpg', null, '', null, '0', '0', '0', '1', 'B', '', null, null, null);
INSERT INTO `game` VALUES ('474', '忍界传奇', 'renjiechuanqi', '13934680475758.png', null, '', null, '0', '0', '0', '1', 'R', '', null, null, null);
INSERT INTO `game` VALUES ('475', '西游圣徒', 'xiyoushengtu', '14237957106594.png', null, '', null, '0', '0', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('476', '圣灵勇士', 'shenglingyongshi', '14237961324570.jpg', null, '', null, '0', '0', '0', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('477', '古龙群侠传', 'gulongqunxiachuan', '14254354211488.jpg', null, '', null, '0', '1', '0', '1', 'G', '', null, null, null);
INSERT INTO `game` VALUES ('478', '格斗宝贝', 'gedoubaobei', '14198375785241.jpg', null, '', null, '0', '0', '0', '1', 'G', '', null, null, null);
INSERT INTO `game` VALUES ('479', '战舰少女', 'zhanjianshaonv', '14253541914217.jpg', null, '', null, '0', '1', '0', '1', 'Z', '', null, null, null);
INSERT INTO `game` VALUES ('480', '天将雄师', 'tianjiangxiongshi', 'u33463354381173320069fm11gp0.jpg', null, '', null, '0', '1', '0', '1', 'T', '', null, null, null);
INSERT INTO `game` VALUES ('481', '天将雄师online', 'tianjiangxiongshionline', 'u4257492803568275358fm11gp0.jpg.png', null, '', null, '0', '1', '0', '1', 'T', '', null, null, null);
INSERT INTO `game` VALUES ('482', '赵云战纪', 'zhaoyunzhanji', '14237233836491.jpg', null, '', null, '0', '0', '0', '1', 'Z', '', null, null, null);
INSERT INTO `game` VALUES ('483', '黑夜传说OL', 'heiyechuanshuoOL', '14080715304953.jpg', null, '', null, '0', '0', '0', '0', 'H', '', null, null, null);
INSERT INTO `game` VALUES ('484', '龙骑士', 'longqishi', 'u3770296781226640392fm11gp0.jpg', null, '', null, '0', '0', '0', '1', 'L', '', null, null, null);
INSERT INTO `game` VALUES ('485', '萌脸大撞击', 'mengliandazhuangji', 'u11870203201861898499fm11gp0.jpg.png', null, '', null, '0', '0', '0', '1', 'M', '', null, null, null);
INSERT INTO `game` VALUES ('486', '女妖', 'nvyao', '14090362104797.jpg', null, '', null, '0', '0', '0', '1', 'N', '', null, null, null);
INSERT INTO `game` VALUES ('487', '暗黑女王', 'anheinvwang', 'u33815526822976255878fm21gp0.jpg', null, '', null, '0', '0', '0', '1', 'A', '', null, null, null);
INSERT INTO `game` VALUES ('488', '全民格斗', 'quanmingedou', 'u12716424233671773744fm21gp0.jpg.png', null, '', null, '0', '1', '0', '1', 'Q', '', null, null, null);
INSERT INTO `game` VALUES ('489', 'TOUCH舞动全城', 'TOUCHwudongquancheng', 'u17096938763769955089fm21gp0.jpg', null, '', null, '0', '0', '0', '1', 'T', '', null, null, null);
INSERT INTO `game` VALUES ('490', '仙侠奇缘', 'xianxiaqiyuan', 'u3642247589564493958fm11gp0.jpg.png', null, '', null, '0', '0', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('491', '战神之怒', 'zhanshenzhinu', '13796568034650.png', null, '', null, '0', '0', '0', '1', 'Z', '', null, null, null);
INSERT INTO `game` VALUES ('492', '超凡特工', 'chaofantegong', '14129347863941.jpg', null, '', null, '0', '1', '0', '1', 'C', '', null, null, null);
INSERT INTO `game` VALUES ('493', '糖果萌萌消', 'tangguomengmengxiao', 'u3242720733744532206fm21gp0.jpg.png', null, '', null, '0', '1', '0', '1', 'T', '', null, null, null);
INSERT INTO `game` VALUES ('494', '仙侠缘', 'xianxiayuan', 'u34870072933949981843fm11gp0.jpg.png', null, '', null, '0', '0', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('495', '仙剑诀', 'xianjianjue', 'u42090938752195445733fm11gp0.jpg.png', null, '', null, '0', '0', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('496', '神龙骑士团', 'shenlongqishituan', '14198400832852.jpg', null, '', null, '0', '0', '0', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('497', '斯巴达战记', 'sibadazhanji', 'u4402926881049337fm11gp0.jpg.png', null, '', null, '0', '0', '0', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('498', '全民主公', 'quanminzhugong', '14260650935154.jpg', null, '', null, '0', '0', '1', '1', 'Q', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('499', '全民偶像', 'quanminouxiang', '14260643733652.png', null, '', null, '0', '1', '1', '1', 'Q', '', null, null, null);
INSERT INTO `game` VALUES ('500', '十万个冷笑话', 'shiwangelengxiaohua', '14200077736034.jpg', null, '', null, '0', '0', '0', '1', 'S', '', null, null, null);
INSERT INTO `game` VALUES ('501', '无双剑姬', 'wushuangjianji', 'wushuang.jpg', null, '蓝钻', null, '0', '1', '0', '1', 'W', '', null, null, null);
INSERT INTO `game` VALUES ('502', '梦幻西游', 'menghuanxiyou', '14262433009839.jpg', null, '仙玉', null, '0', '1', '0', '1', 'M', '日本可充 ', null, null, null);
INSERT INTO `game` VALUES ('503', '勇者大冒险', 'yongzhedamaoxian', '14265766094734.jpg', null, '', null, '0', '1', '1', '1', 'Y', '不弹框，必须rmb充', null, null, null);
INSERT INTO `game` VALUES ('504', '我叫MT外传', 'wojiaoMTwaichuan', '14253676065404.jpg', null, '', null, '0', '1', '0', '1', 'W', '', null, null, null);
INSERT INTO `game` VALUES ('505', '宫爆老奶奶||', 'gongbaolaonainai||', '14280316214789.png', null, '', null, '0', '1', '1', '1', 'G', 'zm140直充', null, null, null);
INSERT INTO `game` VALUES ('506', '万万没想到', 'wanwanmeixiangdao', 'untitled.png', null, '', null, '0', '1', '0', '1', 'W', '', null, null, null);
INSERT INTO `game` VALUES ('507', '自由之战', 'ziyouzhizhan', '14273420089453.jpg', null, '钻石', null, '0', '1', '0', '1', 'Z', '直充', null, null, null);
INSERT INTO `game` VALUES ('508', '新仙剑奇侠传3d', 'xinxianjianqixiachuan3d', 'xianjian.jpg', null, '元宝', null, '0', '1', '0', '1', 'X', '', null, null, null);
INSERT INTO `game` VALUES ('509', ' 热血问战', ' rexiewenzhan', 'rexue.jpg', null, '', null, '0', '1', '0', '1', ' ', '', null, null, null);
INSERT INTO `game` VALUES ('510', '推倒三国', 'tuidaosanguo', 'tuidao.jpg', null, '元宝', null, '0', '1', '0', '1', 'T', '', null, null, null);
INSERT INTO `game` VALUES ('511', '进击的女神', 'jinjidenvshen', 'jinji.jpg', null, '紫晶', null, '0', '1', '0', '1', 'J', '', null, null, null);
INSERT INTO `game` VALUES ('512', '潮爆三国', 'chaobaosanguo', 'cao.jpg', null, '钻石', null, '0', '1', '1', '1', 'C', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('513', '大圣归来', 'dashengguilai', 'da.jpg', null, '元宝', null, '0', '1', '0', '1', 'D', '', null, null, null);
INSERT INTO `game` VALUES ('514', '魔剑之刃', 'mojianzhiren', 'mojian.jpg', null, '钻石', null, '0', '1', '0', '1', 'M', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('515', '卧虎藏龙', 'wohucanglong', 'wo.jpg', null, '官银', null, '0', '0', '0', '1', 'W', '', null, null, null);
INSERT INTO `game` VALUES ('516', '天天传奇', 'tiantianchuanqi', 'tt.jpg', null, '钻石', null, '0', '1', '1', '1', 'T', '需切号或rmb', null, null, null);
INSERT INTO `game` VALUES ('517', '魔龙与勇士', 'molongyuyongshi', '14310772875031.jpg', null, '', null, '0', '1', '1', '1', 'M', '会卡单，必须rmb充', null, null, null);
INSERT INTO `game` VALUES ('518', '战塔英雄', 'zhantayingxiong', 'zhan.jpg', null, '钻石', null, '0', '1', '0', '1', 'Z', '', null, null, null);
INSERT INTO `game` VALUES ('519', '白猫计划', 'baimaojihua', 'bai.png', null, '宝石', null, '0', '1', '0', '1', 'B', '', null, null, null);
INSERT INTO `game` VALUES ('520', '盗梦英雄', 'daomengyingxiong', 'dao.jpg', null, '钻石', null, '0', '1', '0', '1', 'D', '', null, null, null);
INSERT INTO `game` VALUES ('521', '奇迹暖暖', 'qijinuannuan', 'qiji.jpg', null, '钻石', null, '0', '0', '1', '1', 'Q', '', null, null, null);
INSERT INTO `game` VALUES ('522', '复仇者联盟', 'fuchouzhelianmeng', 'fu.png', null, '钻石', null, '0', '1', '1', '1', 'F', '', null, null, null);
INSERT INTO `game` VALUES ('523', '黑夜传说之狼人归来', 'heiyechuanshuozhilangrenguilai', 'fu.png', null, '钻石', null, '0', '1', '0', '1', 'H', '', null, null, null);
INSERT INTO `game` VALUES ('524', '超神吧英雄', 'chaoshenbayingxiong', 'chao.jpg', null, '钻石', null, '0', '1', '0', '1', 'C', '', null, null, null);
INSERT INTO `game` VALUES ('525', '大唐双龙传', 'datangshuanglongchuan', 'da.jpg', null, '元宝', null, '0', '1', '0', '1', 'D', '', null, null, null);
INSERT INTO `game` VALUES ('526', '葵花宝典', 'kuihuabaodian', 'kui.png', null, '金币', null, '0', '1', '0', '1', 'K', '', null, null, null);
INSERT INTO `game` VALUES ('527', '宝贝联盟', 'baobeilianmeng', 'bao.jpg', null, '精灵石', null, '0', '1', '0', '1', 'B', '', null, null, null);
INSERT INTO `game` VALUES ('528', '刀塔传奇', 'daotachuanqi', 'daot.jpg', null, '钻石', null, '0', '1', '0', '1', 'D', '', null, null, null);

-- ----------------------------
-- Table structure for game_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `game_evaluation`;
CREATE TABLE `game_evaluation` (
  `created_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(127) DEFAULT NULL,
  `content` text,
  `game_id` int(11) DEFAULT NULL,
  `scan_num` smallint(6) DEFAULT NULL,
  `meta_title` text,
  `meta_keyword` text,
  `meta_desc` text,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game_evaluation
-- ----------------------------
INSERT INTO `game_evaluation` VALUES (null, '1', '11111111111', null, '13', null, null, null, null, '74');
INSERT INTO `game_evaluation` VALUES (null, '2', '22222222222', null, '13', null, null, null, null, '74');
INSERT INTO `game_evaluation` VALUES ('2015-07-17 16:58:52', '3', '11', '<p><img src=\"/storeSystem/Public/upload/game_strategy/201507/1437123530468443.jpg\" title=\"1437123530468443.jpg\" alt=\"apple.jpg\" width=\"383\" height=\"306\" style=\"width: 383px; height: 306px;\"/></p>', '113', '7', '', '', '', '74');
INSERT INTO `game_evaluation` VALUES ('2015-07-17 16:59:32', '4', '11', '<p><img src=\"/storeSystem/Public/upload/game_strategy/201507/1437123530468443.jpg\" title=\"1437123530468443.jpg\" alt=\"apple.jpg\"/></p>', '113', '5', '', '', '', '74');
INSERT INTO `game_evaluation` VALUES ('2015-07-17 16:59:47', '5', '哈啊哈哈哈哈', '<p>第三方</p>', '6', '2', '多少', '都', '多少', '72');
INSERT INTO `game_evaluation` VALUES ('2015-07-17 17:01:21', '6', '王者荣耀', '<p>dsd酸</p>', '6', '4', '多少', '都', '多少', '72');
INSERT INTO `game_evaluation` VALUES ('2015-09-14 18:06:41', '7', '33333', '<p style=\"text-align: center;\"><img src=\"/storeSystem/Public/upload/game_strategy/201509/1442225197122076.jpg\" title=\"1442225197122076.jpg\" alt=\"1_1.jpg\"/></p>', '0', '3', '', '', '', '72');
INSERT INTO `game_evaluation` VALUES ('2015-09-24 15:30:00', '8', '好好学习，天天向上dsf ！', '斯蒂芬dd', '8', '13', '斯蒂芬', '斯蒂芬', '斯蒂芬', '72');

-- ----------------------------
-- Table structure for game_strategy
-- ----------------------------
DROP TABLE IF EXISTS `game_strategy`;
CREATE TABLE `game_strategy` (
  `created_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(127) DEFAULT NULL,
  `content` text,
  `game_id` int(11) DEFAULT NULL,
  `scan_num` smallint(6) DEFAULT NULL,
  `meta_title` text,
  `meta_keyword` text,
  `meta_desc` text,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game_strategy
-- ----------------------------
INSERT INTO `game_strategy` VALUES ('2015-09-14 17:02:12', '5', '2222222222222', '<p style=\"text-align: center;\"><strong>111111111111111111111</strong></p>', '0', '54', '111111111', '111111111111', '11111111', '72');
INSERT INTO `game_strategy` VALUES ('2015-09-24 15:27:59', '6', '斯蒂芬', '1111', '6', '7', '1111', '1111', '11111111', '74');
INSERT INTO `game_strategy` VALUES ('2015-11-16 16:59:11', '7', '账号交易', 'sdaf ', '6', '5', '斯蒂芬', 'sdf ', 'sdf ', '72');
INSERT INTO `game_strategy` VALUES ('2015-11-16 17:07:46', '8', 'Highcharts Demo', 'swfd', '8', '28', '好好学习', '哈哈哈', '天天向上', '72');
INSERT INTO `game_strategy` VALUES ('2015-12-01 14:12:27', '9', '账号交易', 'sdf', '9', '2', '斯蒂芬', '哈哈哈', '天天向上', '72');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `store_num` int(11) DEFAULT NULL,
  `exchange_num` int(11) DEFAULT NULL,
  `pic_name` varchar(1024) DEFAULT NULL,
  `details` varchar(1024) DEFAULT NULL COMMENT '商品详情',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '好好学习', '100', '20', '20', 'apple.jpg', null);
INSERT INTO `goods` VALUES ('2', '天', '11', '26', '26', 'apple.jpg', null);
INSERT INTO `goods` VALUES ('3', 'dddd', '222', '3333', '224', '1442219679.jpg', null);
INSERT INTO `goods` VALUES ('4', 'fg', '33', '333', '333', '1442220223.jpg', null);
INSERT INTO `goods` VALUES ('5', '1111111', '11', '11', '2231', '1442220989.png', '<p style=\"text-align: center;\"><strong>好好学习天天向上！</strong></p>');
INSERT INTO `goods` VALUES ('6', '2222222', '222', '222', '22', '1442223453.jpg', '<p style=\"text-align: center;\"><img src=\"/storeSystem/Public/upload/game_strategy/201509/1442224351125446.jpg\" title=\"1442224351125446.jpg\" alt=\"1_5.jpg\"/></p>');

-- ----------------------------
-- Table structure for goods_order
-- ----------------------------
DROP TABLE IF EXISTS `goods_order`;
CREATE TABLE `goods_order` (
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `credits_record_id` int(11) DEFAULT NULL,
  `address_info` varchar(1024) DEFAULT NULL,
  `customer_user_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `tel` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_order
-- ----------------------------
INSERT INTO `goods_order` VALUES ('2015-07-31 11:04:48', null, '2', '1', '100', '0', null, '23', null, '1', '74', null, null);
INSERT INTO `goods_order` VALUES ('2015-07-31 11:05:02', '2015-07-31 11:05:03', '3', '1', '100', '10', '', '23', null, '1', '74', null, null);
INSERT INTO `goods_order` VALUES ('2015-07-31 17:07:31', '2015-07-31 17:07:33', '4', '1', '100', '11', '', '23', null, '1', '74', null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 14:10:26', '2015-08-25 14:10:43', '5', '2', '11', '28', 'rfds ', '23', null, '1', '74', null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 14:13:00', null, '6', '2', '11', '0', null, '23', null, '0', '74', null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 15:40:52', null, '7', '1', '100', '0', null, '23', null, '0', '74', null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 15:45:50', null, '8', '1', '0', '0', null, '23', null, '0', '75', null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 15:46:08', null, '9', '1', '0', '0', null, '23', null, '0', null, null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 15:46:30', null, '10', '2', '0', '0', null, '23', null, '0', null, null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 15:53:06', null, '11', '1', '100', '0', null, '23', null, '0', null, null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 16:12:00', null, '12', '1', '100', '0', null, '23', null, '0', null, null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 16:12:41', '2015-08-25 17:02:17', '13', '1', '100', '35', 'cv ', '23', null, '1', null, null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 16:22:45', '2015-08-25 16:33:17', '14', '1', '100', '32', '', '23', null, '1', null, null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 16:27:21', '2015-08-25 16:27:26', '15', '1', '100', '30', 'dfs ', '23', null, '1', null, null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 16:30:49', '2015-08-25 16:32:20', '16', '1', '100', '31', 'ef ', '23', null, '1', null, null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 16:44:57', '2015-08-25 16:45:01', '17', '1', '100', '34', 'ews ', '23', null, '1', null, null, null);
INSERT INTO `goods_order` VALUES ('2015-08-25 17:17:29', '2015-08-25 17:17:31', '18', '1', '100', '36', 'dsf ', '23', null, '1', null, null, null);
INSERT INTO `goods_order` VALUES ('2015-09-18 16:56:05', null, '19', '6', '222', '0', null, '23', null, '0', null, null, null);
INSERT INTO `goods_order` VALUES ('2015-09-28 16:46:47', '2015-09-28 16:53:01', '20', '5', '11', '72', '但范甘迪发', null, null, '1', '72', null, null);
INSERT INTO `goods_order` VALUES ('2015-09-28 16:54:24', '2015-09-28 16:54:32', '21', '5', '11', '73', 'dfs ', null, null, '1', '72', null, null);
INSERT INTO `goods_order` VALUES ('2015-09-28 16:58:26', null, '22', '5', '11', '0', null, null, null, '0', '72', null, null);
INSERT INTO `goods_order` VALUES ('2015-09-28 17:40:16', '2015-09-28 17:40:18', '23', '5', '11', '74', 'sd ', null, null, '1', '72', null, null);
INSERT INTO `goods_order` VALUES ('2015-09-28 17:41:09', '2015-09-28 17:41:12', '24', '1', '100', '75', 'dfg ', null, null, '1', '72', null, null);
INSERT INTO `goods_order` VALUES ('2015-09-28 17:42:35', null, '25', '1', '100', '0', null, null, null, '0', '72', null, null);
INSERT INTO `goods_order` VALUES ('2015-09-28 17:44:30', '2015-09-28 17:44:32', '26', '1', '100', '76', 'h ', null, null, '1', '72', null, null);
INSERT INTO `goods_order` VALUES ('2015-09-28 17:45:09', '2015-09-28 17:45:17', '27', '1', '100', '78', 'sdf ', null, null, '1', '72', null, null);
INSERT INTO `goods_order` VALUES ('2015-09-28 17:49:23', null, '28', '3', '222', '0', null, null, null, '0', '72', null, null);
INSERT INTO `goods_order` VALUES ('2015-09-29 09:37:42', null, '29', '3', '222', '0', null, null, null, '0', '72', null, null);
INSERT INTO `goods_order` VALUES ('2015-09-29 09:39:09', '2015-09-29 09:39:30', '30', '3', '222', '80', '斯蒂芬', null, null, '1', '72', null, null);
INSERT INTO `goods_order` VALUES ('2015-10-16 17:58:53', null, '31', '6', '222', '0', null, null, null, '0', '72', null, null);
INSERT INTO `goods_order` VALUES ('2016-02-01 14:42:40', '2016-02-01 14:42:56', '32', '6', '222', '173', '18514253610', null, null, '1', '72', '18514253610', '18514253610');
INSERT INTO `goods_order` VALUES ('2016-02-01 14:48:57', null, '33', '6', '222', '0', null, null, null, '0', '72', null, null);
INSERT INTO `goods_order` VALUES ('2016-02-01 14:49:01', null, '34', '6', '222', '0', null, null, null, '0', '72', null, null);
INSERT INTO `goods_order` VALUES ('2016-02-01 15:10:30', '2016-02-01 15:10:36', '35', '6', '222', '175', 'sdf ', null, null, '1', '72', '18514253610', '18514253610');
INSERT INTO `goods_order` VALUES ('2016-02-01 15:15:46', '2016-02-01 15:15:50', '36', '6', '222', '176', 'dfs ', null, null, '1', '72', '18514253610', '18514253610');

-- ----------------------------
-- Table structure for group_buy_cz
-- ----------------------------
DROP TABLE IF EXISTS `group_buy_cz`;
CREATE TABLE `group_buy_cz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `dued_date` datetime DEFAULT NULL COMMENT '截止日期',
  `option_num` int(11) DEFAULT NULL COMMENT '面额',
  `unit_num` int(11) DEFAULT NULL COMMENT '单位金额',
  `max_time` smallint(6) DEFAULT NULL COMMENT '最多购买次数',
  `option_text` varchar(512) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `lucky_code` varchar(24) DEFAULT NULL,
  `release_time` varchar(24) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `lucky_ticket_id` int(11) DEFAULT NULL,
  `rand_txt` varchar(12) DEFAULT NULL,
  `sep_line` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_buy_cz
-- ----------------------------
INSERT INTO `group_buy_cz` VALUES ('5', '6', '2015-09-25 19:33:21', '1000', '1', '5', '新神曲1000钻石一元购', '10', null, null, '1', '1', '430', '1443094401', '420');
INSERT INTO `group_buy_cz` VALUES ('4', '7', '2015-09-25 19:03:15', '100', '1', '5', '三国志国战版100元宝一元购', '10', '1', '2015-09-24 19:17:35.644', '2', '0', '414', '1443092595', '409');

-- ----------------------------
-- Table structure for group_buy_cz_order
-- ----------------------------
DROP TABLE IF EXISTS `group_buy_cz_order`;
CREATE TABLE `group_buy_cz_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_buy_cz_id` int(11) DEFAULT NULL COMMENT '套餐id',
  `real_payment` int(11) DEFAULT NULL COMMENT '支付金额',
  `is_paid` tinyint(1) DEFAULT NULL,
  `id_no` varchar(16) DEFAULT NULL,
  `pay_way` varchar(256) DEFAULT NULL COMMENT '支付方式',
  `callback_url` varchar(512) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_date` datetime DEFAULT NULL COMMENT '修改时间',
  `customer_id` int(11) DEFAULT NULL,
  `pay_time` varchar(23) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_buy_cz_order
-- ----------------------------
INSERT INTO `group_buy_cz_order` VALUES ('57', '4', '1', '0', null, null, null, '2015-09-24 19:03:27', null, '72', null);
INSERT INTO `group_buy_cz_order` VALUES ('58', '4', '5', '1', '961443092686', 'alipay', 'Home/GroupBuyCz/buy_finish/orderId/58', '2015-09-24 19:03:32', '2015-09-24 19:04:46', '72', '2015-09-24 19:04:46.376');
INSERT INTO `group_buy_cz_order` VALUES ('59', '4', '5', '1', '961443092855', 'alipay', 'Home/GroupBuyCz/buy_finish/orderId/59', '2015-09-24 19:07:32', '2015-09-24 19:07:35', '74', '2015-09-24 19:07:35.644');
INSERT INTO `group_buy_cz_order` VALUES ('60', '5', '1', '0', null, null, null, '2015-10-16 15:41:24', null, '72', null);
INSERT INTO `group_buy_cz_order` VALUES ('61', '5', '1', '0', null, null, null, '2015-10-16 15:41:32', null, '72', null);
INSERT INTO `group_buy_cz_order` VALUES ('62', '5', '1', '0', null, null, null, '2015-10-16 15:45:10', null, '0', null);
INSERT INTO `group_buy_cz_order` VALUES ('63', '5', '1', '0', null, null, null, '2015-10-16 15:45:55', null, '0', null);
INSERT INTO `group_buy_cz_order` VALUES ('64', '5', '1', '0', null, null, null, '2015-10-16 15:48:25', null, '72', null);
INSERT INTO `group_buy_cz_order` VALUES ('65', '5', '1', '0', null, null, null, '2015-11-26 10:22:02', null, '72', null);
INSERT INTO `group_buy_cz_order` VALUES ('66', '5', '1', '1', '9666', 'alipay', 'GroupBuyCz/buy_finish', '2015-11-26 14:09:26', '2015-11-26 16:55:41', '72', '2015-11-26 16:55:41.425');
INSERT INTO `group_buy_cz_order` VALUES ('67', '5', '1', '1', '9667', 'alipay', 'GroupBuyCz/buy_finish', '2016-01-04 17:15:10', '2016-01-04 17:15:18', '72', '2016-01-04 17:15:18.119');
INSERT INTO `group_buy_cz_order` VALUES ('68', '5', '1', '1', '9668', 'alipay', 'GroupBuyCz/buy_finish', '2016-01-12 11:29:05', '2016-01-12 11:29:08', '72', '2016-01-12 11:29:08.695');

-- ----------------------------
-- Table structure for group_buy_cz_ticket
-- ----------------------------
DROP TABLE IF EXISTS `group_buy_cz_ticket`;
CREATE TABLE `group_buy_cz_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `value` varchar(1024) DEFAULT NULL,
  `ticket_text` smallint(6) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=431 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_buy_cz_ticket
-- ----------------------------
INSERT INTO `group_buy_cz_ticket` VALUES ('409', '0', '4', '0', null, '0', '0');
INSERT INTO `group_buy_cz_ticket` VALUES ('410', '72', '4', '58', null, '7', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('411', '72', '4', '58', null, '6', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('412', '72', '4', '58', null, '8', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('413', '72', '4', '58', null, '2', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('414', '72', '4', '58', null, '1', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('415', '74', '4', '59', null, '9', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('416', '74', '4', '59', null, '3', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('417', '74', '4', '59', null, '5', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('418', '74', '4', '59', null, '10', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('419', '74', '4', '59', null, '4', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('420', '0', '5', '0', null, '0', '0');
INSERT INTO `group_buy_cz_ticket` VALUES ('421', '72', '5', '66', null, '7', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('422', '72', '5', '67', null, '9', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('423', '72', '5', '68', null, '3', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('424', '74', '5', '0', null, '8', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('425', '74', '5', '0', null, '1', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('426', '74', '5', '0', null, '5', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('427', '74', '5', '0', null, '10', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('428', '74', '5', '0', null, '6', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('429', '74', '5', '0', null, '2', '1');
INSERT INTO `group_buy_cz_ticket` VALUES ('430', '74', '5', '0', null, '4', '1');

-- ----------------------------
-- Table structure for grow_records
-- ----------------------------
DROP TABLE IF EXISTS `grow_records`;
CREATE TABLE `grow_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `operation` varchar(8) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `original_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grow_records
-- ----------------------------
INSERT INTO `grow_records` VALUES ('1', '1', '+', '72', '100', '100', '2015-12-28 11:13:12');
INSERT INTO `grow_records` VALUES ('2', '1', '+', '72', '6', '149', '2016-01-12 09:46:59');
INSERT INTO `grow_records` VALUES ('3', '1', '+', '72', '6', '151', '2016-01-12 09:57:11');
INSERT INTO `grow_records` VALUES ('4', '3', '', '72', '50', '13', '2016-01-12 10:42:37');
INSERT INTO `grow_records` VALUES ('5', '3', '+', '72', '1555', '14', '2016-01-12 10:49:28');
INSERT INTO `grow_records` VALUES ('6', '3', '+', '72', '70', '1289133', '2016-01-12 11:08:27');
INSERT INTO `grow_records` VALUES ('7', '4', '+', '72', '176', '49', '2016-01-12 11:17:34');
INSERT INTO `grow_records` VALUES ('8', '4', '+', '72', '5', '50', '2016-01-12 11:18:56');
INSERT INTO `grow_records` VALUES ('9', '5', '+', '72', '1', '68', '2016-01-12 11:29:08');
INSERT INTO `grow_records` VALUES ('10', '4', '+', '72', '1555', '1289134', '2016-01-13 17:37:59');
INSERT INTO `grow_records` VALUES ('11', '1', '+', '72', '180', '153', '2016-01-21 15:20:58');
INSERT INTO `grow_records` VALUES ('12', '1', '+', '72', '328', '154', '2016-01-22 11:11:46');

-- ----------------------------
-- Table structure for help_article
-- ----------------------------
DROP TABLE IF EXISTS `help_article`;
CREATE TABLE `help_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) DEFAULT NULL,
  `text` text,
  `help_category_id` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of help_article
-- ----------------------------
INSERT INTO `help_article` VALUES ('1', 'c', '这是内容d', '3', '0');
INSERT INTO `help_article` VALUES ('2', '说的好不如做的好', '<p style=\"text-align: center;\"><span style=\"text-decoration: none; font-size: 20px; background-color: rgb(253, 234, 218);\"><strong>好好学习天天向上！</strong></span></p>', '2', '0');
INSERT INTO `help_article` VALUES ('3', '斯蒂芬', '<p>斯蒂芬斯蒂芬</p>', '4', '0');
INSERT INTO `help_article` VALUES ('4', '斯蒂芬', '<p>哈哈哈</p>', '4', '0');
INSERT INTO `help_article` VALUES ('7', '哈哈啊哈', '<p style=\"text-align: center;\"><span style=\"font-size: 20px; background-color: rgb(227, 108, 9);\"><strong>好好学习，天天向上!</strong></span></p>', '2', '0');

-- ----------------------------
-- Table structure for help_category
-- ----------------------------
DROP TABLE IF EXISTS `help_category`;
CREATE TABLE `help_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of help_category
-- ----------------------------
INSERT INTO `help_category` VALUES ('2', '常见问题2');
INSERT INTO `help_category` VALUES ('3', '常见问题3');
INSERT INTO `help_category` VALUES ('4', '常见问题4');

-- ----------------------------
-- Table structure for identify_request
-- ----------------------------
DROP TABLE IF EXISTS `identify_request`;
CREATE TABLE `identify_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `true_name` varchar(1024) DEFAULT NULL COMMENT '真实名字',
  `idc_no` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `state` smallint(6) DEFAULT NULL COMMENT '状态',
  `result` varchar(256) DEFAULT NULL,
  `photo_face` varchar(255) DEFAULT NULL COMMENT '正面照',
  `photo_back` varchar(255) DEFAULT NULL COMMENT '反面照',
  `photo_body` varchar(255) DEFAULT NULL COMMENT '手持身份证照',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of identify_request
-- ----------------------------
INSERT INTO `identify_request` VALUES ('4', '23', '谢超', '123456789', null, null, 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', null);
INSERT INTO `identify_request` VALUES ('5', '23', '林海灿', '987654321', null, null, 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', null);
INSERT INTO `identify_request` VALUES ('6', '23', '11', '362202199009273610', null, null, '', '', '', null);
INSERT INTO `identify_request` VALUES ('7', '23', '11', '362202199009273610', null, null, '', '', '', null);
INSERT INTO `identify_request` VALUES ('8', '23', '谢超', '362202199009273610', null, null, '', '', '', null);
INSERT INTO `identify_request` VALUES ('9', '23', '谢超', '362202199009273610', null, null, '', '', '', null);
INSERT INTO `identify_request` VALUES ('10', '23', '谢超', '362202199009273610', null, null, '', '', '', null);
INSERT INTO `identify_request` VALUES ('11', '23', '谢超', '362202199009273610', null, null, 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', null);
INSERT INTO `identify_request` VALUES ('12', '23', '谢超', '362202199009273610', null, null, 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', null);
INSERT INTO `identify_request` VALUES ('13', '23', '谢超', '362202199009273610', null, null, '', '', '', null);
INSERT INTO `identify_request` VALUES ('14', '23', '订单', '362202199009273610', null, null, '', '', '', null);
INSERT INTO `identify_request` VALUES ('15', '23', '谢超', '362202199009273610', null, null, 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', null);
INSERT INTO `identify_request` VALUES ('16', '23', '谢超', '362202199009273610', '2', '', 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', null);
INSERT INTO `identify_request` VALUES ('17', '23', '', '', null, null, '', '', '', null);
INSERT INTO `identify_request` VALUES ('18', '23', '谢超', '362202199009273610', null, null, 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', null);
INSERT INTO `identify_request` VALUES ('19', '23', '谢超', '362202199009273610', null, null, 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', null);
INSERT INTO `identify_request` VALUES ('20', '23', '谢超', '362202199009273610', null, null, 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', null);
INSERT INTO `identify_request` VALUES ('21', '23', '谢超', '362202199009273610', '2', '', 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', null);
INSERT INTO `identify_request` VALUES ('22', '23', '谢超', '362202199009273610', null, null, 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', null);
INSERT INTO `identify_request` VALUES ('23', '23', '谢超', '362202199009273610', '1', '', 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', null);
INSERT INTO `identify_request` VALUES ('24', '72', 'sdf ', '362202199009273610', '1', '', 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', null);
INSERT INTO `identify_request` VALUES ('25', '72', '谢超', '362202199009273610', '1', '', 'photo_face.jpg', 'photo_back.png', 'photo_body.png', '2015-11-13 15:45:21');
INSERT INTO `identify_request` VALUES ('26', '72', '谢超', '362202199009273610', '2', '', 'photo_face.jpg', 'photo_back.jpg', 'photo_body.jpg', '2015-11-13 15:56:27');

-- ----------------------------
-- Table structure for invite_record
-- ----------------------------
DROP TABLE IF EXISTS `invite_record`;
CREATE TABLE `invite_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inviter_id` int(11) DEFAULT NULL,
  `invitee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invite_record
-- ----------------------------

-- ----------------------------
-- Table structure for mb_trade_game
-- ----------------------------
DROP TABLE IF EXISTS `mb_trade_game`;
CREATE TABLE `mb_trade_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mb_trade_game
-- ----------------------------
INSERT INTO `mb_trade_game` VALUES ('1', '113');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `contribt_sum` int(11) DEFAULT NULL COMMENT '总贡献值',
  `created_date` datetime DEFAULT NULL,
  `nick_name` varchar(64) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('108', '72', '75', '0', '2016-01-27 10:22:37', '哈哈', '2');
INSERT INTO `member` VALUES ('122', '74', '75', '0', '2016-01-27 12:28:59', '地方', '2');
INSERT INTO `member` VALUES ('123', '74', '75', '0', '2016-01-27 12:38:45', '订单', '2');
INSERT INTO `member` VALUES ('124', '74', '75', '0', '2016-01-27 12:39:18', '斯蒂芬', '2');
INSERT INTO `member` VALUES ('125', '74', '75', '0', '2016-01-27 17:53:37', '全名超神', '2');
INSERT INTO `member` VALUES ('126', '74', '75', '0', '2016-01-27 17:56:33', '第三方', '2');
INSERT INTO `member` VALUES ('127', '74', '75', '0', '2016-01-27 17:59:28', 'df ', '2');
INSERT INTO `member` VALUES ('128', '74', '75', '0', '2016-01-27 18:01:23', 'sdf ', '2');
INSERT INTO `member` VALUES ('129', '74', '75', '0', '2016-01-27 18:01:59', '全名超神', '2');
INSERT INTO `member` VALUES ('130', '74', '75', '0', '2016-01-27 18:03:28', '王者荣耀', '2');
INSERT INTO `member` VALUES ('131', '74', '75', '0', '2016-01-27 18:05:48', 'dsf ', '1');
INSERT INTO `member` VALUES ('132', '74', '76', '0', '2016-01-27 18:15:48', '王者荣耀', '1');
INSERT INTO `member` VALUES ('133', '74', '77', '0', '2016-01-27 18:15:58', '王者荣耀', '1');
INSERT INTO `member` VALUES ('134', '72', '78', '0', '2016-02-02 18:41:18', '王者荣耀', '2');
INSERT INTO `member` VALUES ('135', '72', '79', '0', '2016-02-02 18:48:21', 'dffff', '2');
INSERT INTO `member` VALUES ('136', '72', '80', '0', '2016-02-02 18:49:53', 'sdfdsaf', '2');
INSERT INTO `member` VALUES ('137', '74', '82', '0', '2016-02-02 18:50:55', '全名超神', '1');
INSERT INTO `member` VALUES ('138', '72', '82', '0', '2016-02-02 18:51:43', 'dffdd', '1');

-- ----------------------------
-- Table structure for menu_structure
-- ----------------------------
DROP TABLE IF EXISTS `menu_structure`;
CREATE TABLE `menu_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '菜单文字',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级菜单ID',
  `r_id` int(11) DEFAULT NULL COMMENT '规则ID',
  `bg_img` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_structure
-- ----------------------------
INSERT INTO `menu_structure` VALUES ('1', '首页', '0', '0', null);
INSERT INTO `menu_structure` VALUES ('2', '用户管理', '0', '0', 'user.png');
INSERT INTO `menu_structure` VALUES ('3', '游戏中心', '0', '0', 'game.png');
INSERT INTO `menu_structure` VALUES ('4', '订单管理', '0', '0', 'order.png');
INSERT INTO `menu_structure` VALUES ('7', '组权限管理', '2', '3', null);
INSERT INTO `menu_structure` VALUES ('6', '用户列表', '2', '2', null);
INSERT INTO `menu_structure` VALUES ('5', '网站相关', '0', '0', 'system.png');
INSERT INTO `menu_structure` VALUES ('8', '游戏列表', '3', '4', null);
INSERT INTO `menu_structure` VALUES ('10', '攻略', '3', '6', null);
INSERT INTO `menu_structure` VALUES ('11', '评测', '3', '7', null);
INSERT INTO `menu_structure` VALUES ('13', 'ios充值', '4', '9', null);
INSERT INTO `menu_structure` VALUES ('25', '安卓首充号', '3', '48', null);
INSERT INTO `menu_structure` VALUES ('15', '代练套餐', '3', '11', null);
INSERT INTO `menu_structure` VALUES ('16', 'ios首充号', '4', '12', null);
INSERT INTO `menu_structure` VALUES ('17', '代练需求', '3', '13', null);
INSERT INTO `menu_structure` VALUES ('19', '最新公告', '5', '15', null);
INSERT INTO `menu_structure` VALUES ('20', '友情链接', '5', '16', null);
INSERT INTO `menu_structure` VALUES ('32', '一元购', '4', '67', null);
INSERT INTO `menu_structure` VALUES ('12', '充值团购', '3', '8', null);
INSERT INTO `menu_structure` VALUES ('9', 'ios首充号', '3', '5', null);
INSERT INTO `menu_structure` VALUES ('21', '商品列表', '5', '19', null);
INSERT INTO `menu_structure` VALUES ('22', '管理员编辑', '2', '41', null);
INSERT INTO `menu_structure` VALUES ('26', '代练套餐', '4', '50', null);
INSERT INTO `menu_structure` VALUES ('27', '代练需求', '4', '51', null);
INSERT INTO `menu_structure` VALUES ('28', '一元购', '3', '55', null);
INSERT INTO `menu_structure` VALUES ('29', '账号交易', '4', '58', null);
INSERT INTO `menu_structure` VALUES ('30', '安卓首充号', '4', '61', null);
INSERT INTO `menu_structure` VALUES ('31', '充值团购', '4', '65', null);
INSERT INTO `menu_structure` VALUES ('33', '商品兑换', '4', '69', null);
INSERT INTO `menu_structure` VALUES ('34', '帮助中心', '5', '71', null);
INSERT INTO `menu_structure` VALUES ('35', '投诉与建议', '5', '80', null);
INSERT INTO `menu_structure` VALUES ('36', '首页轮播图', '5', '83', null);
INSERT INTO `menu_structure` VALUES ('37', '虎币订单', '4', '88', null);
INSERT INTO `menu_structure` VALUES ('38', '积分列表', '4', '93', null);
INSERT INTO `menu_structure` VALUES ('39', '代练师验证', '2', '95', null);
INSERT INTO `menu_structure` VALUES ('40', '用户搜索', '5', '108', null);
INSERT INTO `menu_structure` VALUES ('41', '推荐游戏', '3', '109', null);
INSERT INTO `menu_structure` VALUES ('42', 'SEO中心', '5', '112', null);
INSERT INTO `menu_structure` VALUES ('43', '第三方订单查询', '4', '124', null);
INSERT INTO `menu_structure` VALUES ('44', '堂会logo列表', '5', '125', null);
INSERT INTO `menu_structure` VALUES ('45', '堂会列表', '5', '132', null);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `text` varchar(512) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0' COMMENT '是否阅读',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '2015-12-07 17:19:04', '72', '好好学习天天向上！好好学习天天向上！好好学习天天向上！好好学习天天向上！好好学习天天向上！好好学习天天向上！好好学习天天向上！好好学习天天向上！好好学习天天向上！好好学习天天向上！', '1');
INSERT INTO `message` VALUES ('2', '2015-12-07 17:19:29', '72', 'hello world!', '1');
INSERT INTO `message` VALUES ('4', '2016-01-04 18:15:27', '72', '全民枪战780钻石一元购', '1');
INSERT INTO `message` VALUES ('5', '2016-01-04 18:22:20', '72', '您购买的一元购全民枪战780钻石一元购已完成，点击<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">这里</a>了解开奖结果！', '1');
INSERT INTO `message` VALUES ('6', '2016-01-04 18:25:52', '72', '您购买的一元购全民枪战780钻石一元购已完成，点击<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">这里</a>了解开奖结果！', '1');
INSERT INTO `message` VALUES ('3', '2015-12-08 11:10:32', '72', '哈哈哈哈哈', '1');
INSERT INTO `message` VALUES ('7', '2016-01-04 18:25:55', '72', '您购买的一元购全民枪战780钻石一元购已完成，点击<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">这里</a>了解开奖结果！', '1');
INSERT INTO `message` VALUES ('8', '2016-01-04 18:31:35', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('9', '2016-01-04 18:31:40', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('10', '2016-01-04 18:36:35', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('11', '2016-01-05 09:42:42', '72', '恭喜您，您是一元购<a>全民枪战780钻石一元购</a>的中奖者，请到<a href=\"\">个人中心</a>填写信息，谢谢！', '1');
INSERT INTO `message` VALUES ('12', '2016-01-05 09:43:01', '72', '恭喜您，您是一元购<a>全民枪战780钻石一元购</a>的中奖者，请到<a href=\"\">个人中心</a>填写信息，谢谢！', '1');
INSERT INTO `message` VALUES ('13', '2016-01-05 09:43:24', '72', '恭喜您，您是一元购<b>全民枪战780钻石一元购</b>的中奖者，请到<a href=\"\">个人中心</a>填写信息，谢谢！', '1');
INSERT INTO `message` VALUES ('14', '2016-01-05 09:52:33', '72', '您的vip等级已发生变化，点击<a href=\"/branches/send_message/User/info\">这里</a>了解详情！', '1');
INSERT INTO `message` VALUES ('15', '2016-01-05 09:54:18', '72', '您的vip等级已发生变化，点击<a href=\"/branches/send_message/User/info\">这里</a>了解详情！', '1');
INSERT INTO `message` VALUES ('16', '2016-01-05 09:58:27', '72', '您的vip等级已发生变化，点击<a href=\"/branches/send_message/User/info\">这里</a>了解详情！', '1');
INSERT INTO `message` VALUES ('17', '2016-01-05 09:58:47', '72', '您的vip等级已发生变化，点击<a href=\"/branches/send_message/User/info\">这里</a>了解详情！', '1');
INSERT INTO `message` VALUES ('18', '2016-01-05 09:58:49', '72', '您的vip等级已发生变化，点击<a href=\"/branches/send_message/User/info\">这里</a>了解详情！', '1');
INSERT INTO `message` VALUES ('19', '2016-01-05 09:58:49', '72', '您的vip等级已发生变化，点击<a href=\"/branches/send_message/User/info\">这里</a>了解详情！', '1');
INSERT INTO `message` VALUES ('20', '2016-01-05 09:58:49', '72', '您的vip等级已发生变化，点击<a href=\"/branches/send_message/User/info\">这里</a>了解详情！', '1');
INSERT INTO `message` VALUES ('21', '2016-01-05 09:58:49', '72', '您的vip等级已发生变化，点击<a href=\"/branches/send_message/User/info\">这里</a>了解详情！', '1');
INSERT INTO `message` VALUES ('22', '2016-01-05 09:58:50', '72', '您的vip等级已发生变化，点击<a href=\"/branches/send_message/User/info\">这里</a>了解详情！', '1');
INSERT INTO `message` VALUES ('23', '2016-01-05 10:02:58', '72', '您的vip等级已发生变化，点击<a href=\"/branches/send_message/User/info\">这里</a>了解详情！', '1');
INSERT INTO `message` VALUES ('24', '2016-01-05 10:12:40', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('25', '2016-01-05 10:12:41', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('26', '2016-01-05 10:12:41', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('27', '2016-01-05 10:12:41', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('28', '2016-01-05 10:12:41', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('29', '2016-01-05 10:12:42', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('30', '2016-01-05 10:12:42', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('31', '2016-01-05 10:12:42', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('32', '2016-01-05 10:12:44', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('33', '2016-01-05 10:12:44', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('34', '2016-01-05 10:12:46', '72', '您购买的一元购<a href=\"/branches/send_message/GroupBuyCz/buy.html?id=4\">全民枪战780钻石一元购</a>已开奖！', '1');
INSERT INTO `message` VALUES ('35', '2016-01-13 17:37:59', '72', '您的vip成长值已发生变化，点击<a href=\"/branches/cz_package_order/User/grow_record_list\">这里</a>了解详情！', '1');
INSERT INTO `message` VALUES ('36', '2016-01-21 15:20:58', '72', '您的vip成长值已发生变化，点击<a href=\"/branches/family_model/User/grow_record_list\">这里</a>了解详情！', '1');
INSERT INTO `message` VALUES ('37', '2016-01-22 11:11:46', '72', '您的vip成长值已发生变化，点击<a href=\"/branches/family_model/User/grow_record_list\">这里</a>了解详情！', '1');
INSERT INTO `message` VALUES ('38', '2016-01-26 12:53:10', '72', '您的堂会成员<b>  </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('39', '2016-01-26 12:57:38', '72', '您的堂会成员<b>  </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('40', '2016-01-26 12:58:27', '72', '您的堂会成员<b>  </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('41', '2016-01-26 13:00:19', '72', '您的堂会成员<b>  </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('42', '2016-01-26 13:03:06', '72', '您的堂会成员<b>  </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('43', '2016-01-26 13:04:14', '72', '您的堂会成员<b>  </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('44', '2016-01-26 13:07:03', '72', '您的堂会成员<b> 我不是管理员 </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('45', '2016-01-26 13:08:50', '72', '您的堂会成员<b> 好好学习天天向上 </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('46', '2016-01-26 14:55:33', '72', '您的堂会成员<b> 哈哈哈哈哈 </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('47', '2016-01-27 11:09:49', '72', '您的堂会成员<b> 第三方 </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('48', '2016-01-27 11:10:27', '72', '您的堂会成员<b> 全名超神 </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('49', '2016-01-27 11:13:33', '72', '您的堂会成员<b> sdfdsaf </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('50', '2016-01-27 12:36:00', '72', '您的堂会成员<b> 地方 </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('51', '2016-01-27 12:42:15', '72', '您的堂会成员<b> 地方 </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('52', '2016-01-27 12:45:01', '72', '您的堂会成员<b> 地方 </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('53', '2016-01-27 17:53:01', '72', '您的堂会成员<b> 斯蒂芬 </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('54', '2016-01-27 17:56:04', '72', '您的堂会成员<b> 全名超神 </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('55', '2016-01-27 17:57:36', '72', '您的堂会成员<b> 第三方 </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('56', '2016-01-27 18:01:08', '72', '您的堂会成员<b> df  </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('57', '2016-01-27 18:01:52', '72', '您的堂会成员<b> sdf  </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('58', '2016-01-27 18:03:18', '72', '您的堂会成员<b> 全名超神 </b> 离开了堂会', '1');
INSERT INTO `message` VALUES ('59', '2016-01-27 18:05:40', '72', '您的堂会成员<b> 王者荣耀 </b> 离开了堂会', '1');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `title` varchar(125) DEFAULT NULL,
  `text` text,
  `html_title` text,
  `html_keyword` text,
  `html_desc` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('5', '2016-02-18 17:13:55', '22222222', null, null, null, null);
INSERT INTO `news` VALUES ('2', '2015-09-11 15:46:06', '轰轰虎手游充值，超值特惠！轰轰虎手游充值，超值特惠！', '<p style=\"text-align: justify;\"><span style=\"border: 1px solid rgb(0, 0, 0); font-size: 24px;\"><strong><em>好好啊系诶系刺f骨的<img src=\"/storeSystem/Public/upload/game_strategy/201509/1442224841793936.png\" title=\"1442224841793936.png\" alt=\"1.png\"/></em></strong></span></p>', '11111', '33333333', '22222222');
INSERT INTO `news` VALUES ('4', '2015-09-14 18:03:33', '1111111', '<p style=\"text-align: center;\"><img src=\"/storeSystem/Public/upload/game_strategy/201509/1442225010125222.png\" title=\"1442225010125222.png\" alt=\"00.png\"/></p>', '1111111111', '111111111111', '1111111111');
INSERT INTO `news` VALUES ('6', null, 'n', null, null, null, null);
INSERT INTO `news` VALUES ('7', null, 'n', null, null, null, null);
INSERT INTO `news` VALUES ('8', null, 'n', null, null, null, null);
INSERT INTO `news` VALUES ('9', null, 'n', null, null, null, null);
INSERT INTO `news` VALUES ('10', null, 'n', null, null, null, null);

-- ----------------------------
-- Table structure for order_count
-- ----------------------------
DROP TABLE IF EXISTS `order_count`;
CREATE TABLE `order_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `numbers` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_count
-- ----------------------------
INSERT INTO `order_count` VALUES ('1', '2015', '11', '1', '388', '55555');
INSERT INTO `order_count` VALUES ('2', '2015', '11', '2', '300', '88888');
INSERT INTO `order_count` VALUES ('3', '2015', '11', '3', '288', '666666');
INSERT INTO `order_count` VALUES ('4', '2015', '11', '4', '256', '77777');
INSERT INTO `order_count` VALUES ('5', '2015', '10', '1', '327', null);
INSERT INTO `order_count` VALUES ('6', '2015', '10', '2', '266', null);
INSERT INTO `order_count` VALUES ('7', '2015', '10', '3', '233', null);
INSERT INTO `order_count` VALUES ('8', '2015', '10', '4', '344', null);
INSERT INTO `order_count` VALUES ('9', '2015', '10', '5', '233', null);
INSERT INTO `order_count` VALUES ('10', '2015', '10', '6', '321', null);
INSERT INTO `order_count` VALUES ('11', '2015', '10', '7', '243', null);
INSERT INTO `order_count` VALUES ('12', '2015', '10', '8', '234', null);
INSERT INTO `order_count` VALUES ('13', '2015', '10', '9', '341', null);
INSERT INTO `order_count` VALUES ('14', '2015', '10', '10', '222', null);
INSERT INTO `order_count` VALUES ('15', '2015', '10', '11', '213', null);
INSERT INTO `order_count` VALUES ('16', '2015', '10', '12', '267', null);
INSERT INTO `order_count` VALUES ('17', '2015', '10', '13', '276', null);
INSERT INTO `order_count` VALUES ('18', '2015', '10', '14', '254', null);
INSERT INTO `order_count` VALUES ('19', '2015', '10', '15', '199', null);
INSERT INTO `order_count` VALUES ('20', '2015', '10', '16', '211', null);
INSERT INTO `order_count` VALUES ('21', '2015', '10', '17', '250', null);
INSERT INTO `order_count` VALUES ('22', '2015', '10', '18', '245', null);
INSERT INTO `order_count` VALUES ('23', '2015', '10', '19', '298', null);
INSERT INTO `order_count` VALUES ('24', '2015', '10', '20', '266', null);
INSERT INTO `order_count` VALUES ('25', '2015', '10', '21', '211', null);
INSERT INTO `order_count` VALUES ('26', '2015', '10', '22', '245', null);
INSERT INTO `order_count` VALUES ('27', '2015', '10', '23', '311', null);
INSERT INTO `order_count` VALUES ('28', '2015', '10', '24', '321', null);
INSERT INTO `order_count` VALUES ('29', '2015', '10', '25', '235', null);
INSERT INTO `order_count` VALUES ('30', '2015', '10', '27', '264', null);
INSERT INTO `order_count` VALUES ('31', '2015', '10', '28', '276', null);
INSERT INTO `order_count` VALUES ('32', '2015', '10', '29', '290', null);
INSERT INTO `order_count` VALUES ('33', '2015', '10', '30', '500', null);
INSERT INTO `order_count` VALUES ('34', '2015', '10', '31', '245', null);
INSERT INTO `order_count` VALUES ('35', '2015', '9', '1', '310', null);
INSERT INTO `order_count` VALUES ('36', '2015', '9', '2', '256', null);
INSERT INTO `order_count` VALUES ('37', '2016', '2', '28', '6', null);

-- ----------------------------
-- Table structure for order_log
-- ----------------------------
DROP TABLE IF EXISTS `order_log`;
CREATE TABLE `order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `operation` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_log
-- ----------------------------

-- ----------------------------
-- Table structure for order_tag
-- ----------------------------
DROP TABLE IF EXISTS `order_tag`;
CREATE TABLE `order_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `bg` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_tag
-- ----------------------------
INSERT INTO `order_tag` VALUES ('9', '顶号党', '#5BC0DE');
INSERT INTO `order_tag` VALUES ('2', '密码错误', '#00ff00');
INSERT INTO `order_tag` VALUES ('3', '暂时无法充值', '#0000ff');
INSERT INTO `order_tag` VALUES ('4', '充值不了，给予退款', '#F20C00');
INSERT INTO `order_tag` VALUES ('10', '随便试试', '#F0AD4E');

-- ----------------------------
-- Table structure for order_tag_link
-- ----------------------------
DROP TABLE IF EXISTS `order_tag_link`;
CREATE TABLE `order_tag_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `bg` varchar(8) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_tag_link
-- ----------------------------
INSERT INTO `order_tag_link` VALUES ('7', '144', '#F20C00', '充值不了，给予退款');
INSERT INTO `order_tag_link` VALUES ('8', '143', '#0000ff', '暂时无法充值');
INSERT INTO `order_tag_link` VALUES ('9', '139', '#00ff00', '密码错误');
INSERT INTO `order_tag_link` VALUES ('17', '132', '#F0AD4E', '随便试试');
INSERT INTO `order_tag_link` VALUES ('11', '138', '#F20C00', '充值不了，给予退款');
INSERT INTO `order_tag_link` VALUES ('18', '154', '#F0AD4E', '随便试试');
INSERT INTO `order_tag_link` VALUES ('15', '138', '#0000ff', '暂时无法充值');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `member_count` int(11) DEFAULT NULL COMMENT '成员数量',
  `sum` float DEFAULT NULL COMMENT '总贡献值',
  `mgr_id` int(11) DEFAULT NULL COMMENT '管理员id',
  `introduction` varchar(512) DEFAULT NULL COMMENT '介绍',
  `max_count` int(11) DEFAULT NULL,
  `recommand` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('81', '5', '2016-02-02 18:50:55', '1', '1111110', '74', 'ddddddddddddddddddddddddddddffffffffffff', '100', '1');
INSERT INTO `organization` VALUES ('80', '4', '2016-02-02 18:49:53', '1', '0', '74', 'ddddddddddddddddddddddddd', '100', '1');
INSERT INTO `organization` VALUES ('79', '3', '2016-02-02 18:48:21', '1', '0', '74', 'dddddddddddddddddddddd', '100', '0');
INSERT INTO `organization` VALUES ('78', '2', '2016-02-02 18:41:18', '1', '0', '74', 'sadfffffffffffffffffffffffffffffff', '100', '0');
INSERT INTO `organization` VALUES ('76', '1', '2016-01-27 18:15:48', '1', '0', '74', 'sdf dddddddddddddddddddddddddd', '100', '0');
INSERT INTO `organization` VALUES ('77', '1', '2016-01-27 18:15:58', '1', '0', '74', 'sdf dddddddddddddddddddddddddd', '100', '1');
INSERT INTO `organization` VALUES ('75', '1', '2016-01-25 15:39:28', '98', '0', '74', '我是王者我是王者我是王者我是王者我是王者', '100', '1');
INSERT INTO `organization` VALUES ('82', '6', '2016-02-02 18:51:43', '1', '0', '72', 'dddddddddddddddddddddddddddddddddddddddddd', '100', '1');

-- ----------------------------
-- Table structure for organization_logo
-- ----------------------------
DROP TABLE IF EXISTS `organization_logo`;
CREATE TABLE `organization_logo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_name` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_logo
-- ----------------------------
INSERT INTO `organization_logo` VALUES ('1', '021.png', '英雄联盟1', '1');
INSERT INTO `organization_logo` VALUES ('2', '022.png', '英雄联盟2', '1');
INSERT INTO `organization_logo` VALUES ('3', '023.png', '英雄联3', '1');
INSERT INTO `organization_logo` VALUES ('4', '024.png', '英雄联盟4', '1');
INSERT INTO `organization_logo` VALUES ('5', '026.png', '英雄联盟5', '1');
INSERT INTO `organization_logo` VALUES ('6', '027.png', '英雄联盟6', '1');
INSERT INTO `organization_logo` VALUES ('7', '028.png', '英雄联盟7', '0');
INSERT INTO `organization_logo` VALUES ('8', '029.png', '英雄联盟8', '0');
INSERT INTO `organization_logo` VALUES ('9', '030.png', '英雄联盟9', '0');
INSERT INTO `organization_logo` VALUES ('10', '031.png', '英雄联盟10', '0');
INSERT INTO `organization_logo` VALUES ('11', '032.png', '英雄联盟11', '0');
INSERT INTO `organization_logo` VALUES ('12', '033.png', '英雄联盟12', '0');
INSERT INTO `organization_logo` VALUES ('13', '034.png', '英雄联盟13', '0');
INSERT INTO `organization_logo` VALUES ('14', '035.png', '英雄联盟14', '0');
INSERT INTO `organization_logo` VALUES ('15', '036.png', '英雄联盟15', '0');
INSERT INTO `organization_logo` VALUES ('16', '037.png', '英雄联盟16', '0');
INSERT INTO `organization_logo` VALUES ('17', '038.png', '英雄联盟17', '0');
INSERT INTO `organization_logo` VALUES ('18', '039.png', '英雄联盟18', '0');
INSERT INTO `organization_logo` VALUES ('23', '041.png', '英雄联盟20', '0');
INSERT INTO `organization_logo` VALUES ('22', '040.png', '英雄联盟19', '0');
INSERT INTO `organization_logo` VALUES ('25', '043.png', '英雄联盟22', '0');
INSERT INTO `organization_logo` VALUES ('24', '042.png', '英雄联盟21', '0');

-- ----------------------------
-- Table structure for package
-- ----------------------------
DROP TABLE IF EXISTS `package`;
CREATE TABLE `package` (
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `title` varchar(63) DEFAULT NULL,
  `platform` tinyint(1) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `qufu` varchar(128) DEFAULT NULL,
  `details` text,
  `price` int(11) DEFAULT NULL,
  `security_price` int(11) DEFAULT NULL,
  `contact_way` varchar(64) DEFAULT NULL,
  `spend_day` smallint(6) DEFAULT NULL,
  `remarks` varchar(1024) DEFAULT NULL,
  `cz_provided` tinyint(1) DEFAULT NULL,
  `game_account_id` int(11) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `result` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of package
-- ----------------------------
INSERT INTO `package` VALUES ('2015-07-14 15:23:51', null, '22', '113', '24', '23', '天天酷跑等级代练天天酷', '1', '1', '2', 'zc', '200', '11', '18773371328', '2', '', '1', null, '3', '1', null, '');
INSERT INTO `package` VALUES (null, null, '23', '113', '24', '23', '天天酷跑等级代练', '1', '1', null, null, '1000', null, null, null, null, null, null, '2', '1', null, '');
INSERT INTO `package` VALUES (null, null, '37', '113', '24', null, '天天酷跑等级代练天天酷', '1', '1', null, null, null, null, null, null, null, null, null, '3', '1', null, null);
INSERT INTO `package` VALUES (null, null, '38', '113', '24', null, '天天酷跑等级代练天天酷', '1', '1', null, null, null, null, null, null, null, null, null, '3', '1', null, null);
INSERT INTO `package` VALUES (null, null, '39', '113', '24', null, '天天酷跑等级代练天天酷', '1', '1', null, null, null, null, null, null, null, null, null, '3', '1', null, null);
INSERT INTO `package` VALUES (null, null, '40', '113', '24', null, '天天酷跑等级代练天天酷', '1', '1', null, null, null, null, null, null, null, null, null, '2', '0', null, '');

-- ----------------------------
-- Table structure for package_game_account
-- ----------------------------
DROP TABLE IF EXISTS `package_game_account`;
CREATE TABLE `package_game_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `qufu` varchar(128) DEFAULT NULL,
  `role` varchar(256) DEFAULT NULL,
  `role_details` varchar(1024) DEFAULT NULL,
  `role_result` varchar(1024) DEFAULT NULL,
  `contact_way` varchar(64) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `platform` tinyint(1) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `image_path` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of package_game_account
-- ----------------------------
INSERT INTO `package_game_account` VALUES ('3', '18514253610', '123456', '艾欧尼亚', '坑神的忧愁', '2', '2', '18773371328', null, '1', '0', '/upload/package/20150714/1/');
INSERT INTO `package_game_account` VALUES ('4', '18514253610', '123456', 'sd ', 'dsf ', 'dsf ', 'sd f', '18514253610', null, '1', '0', '/upload/package/20150729/4/');
INSERT INTO `package_game_account` VALUES ('5', '把', '吧', '把', '吧', '把', '把', '把', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('6', '三点多d', '是', '方法', '说的', '分手', '说的', '18514253610', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('7', '第三方', 'dsf', '说的', 'sdf ', '第三方', '第三方', '斯蒂芬', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('8', 'dd', 'dd', 'ddq', 'xx', 'ix', 'dd', 'dd', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('9', '第三方', '', '说的', 'sdf ', '第三方', '第三方', '斯蒂芬', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('10', 'dd', '', 'ddq', 'xx', 'ix', 'dd', 'dd', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('11', '', '', '', '', '', '', '', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('12', '斯蒂芬', 'sdf ', 'sdf ', '斯蒂芬', '斯蒂芬', '斯蒂芬', '18514253610', null, '1', '0', '/upload/package/20150831/12/');
INSERT INTO `package_game_account` VALUES ('13', '斯蒂芬', 'dfg ', 'sdf ', '斯蒂芬', '斯蒂芬', '斯蒂芬', '18514253610', null, '1', '0', '/upload/package/20150831/13/');
INSERT INTO `package_game_account` VALUES ('14', '斯蒂芬', 'sds', 'sdf ', '斯蒂芬', '斯蒂芬', '斯蒂芬', '18514253610', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('15', '', '', '', '', '', '', '', null, '0', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('16', 'sd', 'd', 'd', 'dd', 'dd', 'dd', '18514253610', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('17', 'sd', 'll', 'd', 'dd', 'dd', 'k,l', '18514253610', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('18', 'sd', 's', 'd', 'dd', 'dd', 'k,l', '18514253610', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('19', 'dsf', 'sdf sd', 'fds ', 'sdfd', 'dsf', 'sdf ', '18514253610', null, '1', '0', '/upload/package/20150831/19/');
INSERT INTO `package_game_account` VALUES ('20', 'dsfd', 'dd', 'dd', 'dd', 'ddd', 'dd', '18514253610', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('21', 'dsf', 'sdf', 'sdf', 'sdf', 'asdf', 'sdf', '18514253610', null, '1', '0', '/upload/package/20150831/21/');
INSERT INTO `package_game_account` VALUES ('22', '', '', '', '', '', '', '', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('23', '', '', '', '', '', '', '', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('24', 'sdf ', 'sdf ', 'sdf ', 'sdf ', 'sdf ', 'sdf ', '18514253610', null, '1', '0', '/upload/package/20150831/24/');
INSERT INTO `package_game_account` VALUES ('25', 'sdf ', 'df', 'sdf ', 'sdf ', 'sdf ', 'sdf ', '18514253610', null, '1', '0', '/upload/package/20150831/25/');
INSERT INTO `package_game_account` VALUES ('26', 'sdf ', 'sdf', 'sdf ', 'sdf ', 'sdf ', 'sdf ', '18514253610', null, '1', '0', '/upload/package/20150831/26/');
INSERT INTO `package_game_account` VALUES ('27', '', '', '', '', '', '', '', null, '1', '0', '没有上传的文件！');
INSERT INTO `package_game_account` VALUES ('28', 'sdf ', 'sdf ', 'sdf ', 'sdf ', 'sdf', 'sdf', '18514253610', null, '1', '0', '/upload/package/20150910/28/');
INSERT INTO `package_game_account` VALUES ('29', '18514253610', 'ef', 'sdfa', 'asdf', 'sadf', 'sadf', '18514253610', null, '1', '0', '/upload/package/20151224/29/');

-- ----------------------------
-- Table structure for package_order
-- ----------------------------
DROP TABLE IF EXISTS `package_order`;
CREATE TABLE `package_order` (
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) DEFAULT NULL,
  `trainer_is_paid` tinyint(1) DEFAULT NULL,
  `player_is_paid` tinyint(1) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `parent_order_id` int(11) DEFAULT NULL,
  `game_account_id` int(11) DEFAULT NULL,
  `callback_url` varchar(512) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `id_no` varchar(16) DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  `pay_way` varchar(256) DEFAULT NULL,
  `real_payment` float DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of package_order
-- ----------------------------
INSERT INTO `package_order` VALUES ('2015-07-14 15:31:38', null, '46', '22', '0', '0', '1', '47', null, 'Home/Package/get_finish/orderId/46', null, '1436859103', null, null, 'alipay', '2', '1');
INSERT INTO `package_order` VALUES ('2015-07-14 15:23:51', null, '45', '22', '1', '0', '2', '103', null, 'Home/Package/publish_finish/orderId/45', null, '1436858634', '2015-07-14 15:28:12', null, 'alipay', '11', '1');
INSERT INTO `package_order` VALUES ('2015-07-14 15:31:38', null, '47', '22', null, null, '3', null, '3', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-07-29 17:26:53', null, '48', '22', null, null, '1', '49', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-07-29 17:26:53', null, '49', '22', null, null, '3', null, '4', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-21 15:23:15', '2015-08-21 15:23:33', '50', '24', null, null, '2', null, null, 'Home/Package/publish_finish/orderId/50', null, '561440141813', '2015-08-21 15:23:33', null, 'alipay', '323', '1');
INSERT INTO `package_order` VALUES ('2015-08-24 16:09:50', null, '51', '22', null, null, '1', '52', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-24 16:09:50', null, '52', '22', null, null, '3', null, '5', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-24 17:51:36', null, '53', '22', null, null, '1', '54', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-24 17:51:36', null, '54', '22', null, null, '3', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-24 17:54:19', null, '55', '22', null, null, '1', '56', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-24 17:54:19', null, '56', '22', null, null, '3', null, '7', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-24 17:55:37', null, '57', '22', null, null, '1', '58', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-24 17:55:37', null, '58', '22', null, null, '3', null, '8', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-24 17:58:26', '2015-08-24 17:58:33', '59', '22', null, null, '1', '60', null, 'Home/Package/get_finish/orderId/59', null, '561440410313', '2015-08-24 17:58:33', null, 'alipay', '200', '1');
INSERT INTO `package_order` VALUES ('2015-08-24 17:58:26', null, '60', '22', null, null, '3', null, '9', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-24 18:04:59', '2015-08-24 18:05:06', '61', '22', null, null, '1', '62', null, 'Home/Package/get_finish/orderId/61', null, '561440410706', '2015-08-24 18:05:06', null, '', '200', '1');
INSERT INTO `package_order` VALUES ('2015-08-24 18:04:59', null, '62', '22', null, null, '3', null, '10', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-24 19:12:06', '2015-08-24 19:12:13', '63', '26', null, null, '2', null, null, 'Home/Package/publish_finish/orderId/63', null, '561440414733', '2015-08-24 19:12:13', null, '', '2', '1');
INSERT INTO `package_order` VALUES ('2015-08-25 10:46:25', null, '64', '22', null, null, '1', '65', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-25 10:46:25', null, '65', '22', null, null, '3', null, '11', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-25 11:10:46', null, '66', '30', null, null, '2', null, null, null, null, null, null, null, null, '66', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 16:06:37', '2015-08-31 16:06:57', '67', '22', null, null, '1', '68', null, 'Home/Package/get_finish/orderId/67', null, '561441008417', '2015-08-31 16:06:57', null, 'alipay', '200', '1');
INSERT INTO `package_order` VALUES ('2015-08-31 16:06:37', null, '68', '22', null, null, '3', null, '12', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 16:07:35', '2015-08-31 16:07:38', '69', '22', null, null, '1', '70', null, 'Home/Package/get_finish/orderId/69', null, '561441008458', '2015-08-31 16:07:38', null, '', '200', '1');
INSERT INTO `package_order` VALUES ('2015-08-31 16:07:35', null, '70', '22', null, null, '3', null, '13', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 16:14:43', null, '71', '31', null, null, '2', null, null, null, null, null, null, null, null, '33', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 16:52:26', null, '72', '22', null, null, '1', '73', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 16:52:26', null, '73', '22', null, null, '3', null, '14', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 16:59:48', null, '74', '22', null, null, '1', '75', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 16:59:48', null, '75', '22', null, null, '3', null, '15', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 17:30:34', null, '76', '35', null, null, '2', null, null, null, null, null, null, null, null, '22', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 17:35:24', null, '77', '22', null, null, '1', '78', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 17:35:24', null, '78', '22', null, null, '3', null, '16', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 17:38:38', null, '79', '22', null, null, '1', '80', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 17:38:38', null, '80', '22', null, null, '3', null, '17', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 17:57:22', null, '81', '36', null, null, '2', null, null, null, null, null, null, null, null, '111', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 17:57:47', null, '82', '22', null, null, '1', '83', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 17:57:47', null, '83', '22', null, null, '3', null, '18', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 18:12:18', null, '84', '22', null, null, '1', '85', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 18:12:18', null, '85', '22', null, null, '3', null, '19', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 18:59:12', null, '86', '22', null, null, '1', '87', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 18:59:12', null, '87', '22', null, null, '3', null, '20', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 19:20:43', null, '88', '22', null, null, '1', '89', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 19:20:43', null, '89', '22', null, null, '3', null, '21', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 19:35:41', null, '90', '22', null, null, '1', '91', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 19:35:41', null, '91', '22', null, null, '3', null, '22', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 20:06:00', null, '92', '22', null, null, '1', '93', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 20:06:00', null, '93', '22', null, null, '3', null, '23', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 20:12:26', null, '94', '22', null, null, '1', '95', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 20:12:26', null, '95', '22', null, null, '3', null, '24', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 20:12:41', null, '96', '22', null, null, '1', '97', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 20:12:41', null, '97', '22', null, null, '3', null, '25', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-08-31 20:13:10', null, '98', '22', null, null, '1', '99', null, null, null, null, null, null, null, '200', '0');
INSERT INTO `package_order` VALUES ('2015-08-31 20:13:10', null, '99', '22', null, null, '3', null, '26', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-09-01 09:15:35', null, '100', '23', null, null, '1', '101', null, null, null, null, null, null, null, '1000', '0');
INSERT INTO `package_order` VALUES ('2015-09-01 09:15:35', null, '101', '23', null, null, '3', null, '27', null, null, null, null, null, null, null, null);
INSERT INTO `package_order` VALUES ('2015-09-10 14:20:14', '2015-09-10 14:20:19', '102', '22', null, null, '1', '103', null, 'Home/Package/get_finish/orderId/102', null, '561441866019', '2015-09-10 14:20:19', null, 'alipay', '200', '1');
INSERT INTO `package_order` VALUES ('2015-09-10 14:20:14', null, '103', '22', null, null, '3', null, '28', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for partner
-- ----------------------------
DROP TABLE IF EXISTS `partner`;
CREATE TABLE `partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partner
-- ----------------------------
INSERT INTO `partner` VALUES ('1', '72');

-- ----------------------------
-- Table structure for password_question
-- ----------------------------
DROP TABLE IF EXISTS `password_question`;
CREATE TABLE `password_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(512) DEFAULT NULL COMMENT '问题描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of password_question
-- ----------------------------
INSERT INTO `password_question` VALUES ('1', '我父亲的名字');
INSERT INTO `password_question` VALUES ('2', '我母亲的名字');
INSERT INTO `password_question` VALUES ('3', '我的职业');

-- ----------------------------
-- Table structure for password_question_answer
-- ----------------------------
DROP TABLE IF EXISTS `password_question_answer`;
CREATE TABLE `password_question_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL COMMENT '问题ID',
  `answer` varchar(2048) DEFAULT NULL COMMENT '答案',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of password_question_answer
-- ----------------------------
INSERT INTO `password_question_answer` VALUES ('7', '3', 'php工程师');
INSERT INTO `password_question_answer` VALUES ('8', '3', 'php工程师');
INSERT INTO `password_question_answer` VALUES ('9', '3', '射鸡尸');
INSERT INTO `password_question_answer` VALUES ('10', '3', 'php工程师');

-- ----------------------------
-- Table structure for pay_method
-- ----------------------------
DROP TABLE IF EXISTS `pay_method`;
CREATE TABLE `pay_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_method
-- ----------------------------

-- ----------------------------
-- Table structure for pwd_auth_key
-- ----------------------------
DROP TABLE IF EXISTS `pwd_auth_key`;
CREATE TABLE `pwd_auth_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `rand_num` varchar(8) DEFAULT NULL,
  `ticket` varchar(32) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pwd_auth_key
-- ----------------------------
INSERT INTO `pwd_auth_key` VALUES ('97', '2015-09-02 15:18:51', 'xy8o', '281113137@qq.comg', '0');
INSERT INTO `pwd_auth_key` VALUES ('98', '2015-09-02 15:20:19', 'jy7a', '281113137@qq.comf', '0');
INSERT INTO `pwd_auth_key` VALUES ('99', '2015-09-02 15:26:20', 'otcp', '281113137@qq.comd', '0');
INSERT INTO `pwd_auth_key` VALUES ('100', '2015-09-02 15:35:08', 'l1ms', '281113137@qq.comg', '0');
INSERT INTO `pwd_auth_key` VALUES ('101', '2015-09-02 15:37:40', '6trt', '281113137@qq.comg', '0');
INSERT INTO `pwd_auth_key` VALUES ('102', '2015-09-02 15:41:40', 'zfqp', '281113137@qq.comh', '0');
INSERT INTO `pwd_auth_key` VALUES ('103', '2015-09-02 15:42:16', 'twjj', '281113137@qq.comh', '0');
INSERT INTO `pwd_auth_key` VALUES ('104', '2015-09-02 15:45:52', 'is0l', '281113137@qq.comd', '0');
INSERT INTO `pwd_auth_key` VALUES ('105', '2015-09-02 15:46:12', '7jxc', '281113137@qq.comd', '0');
INSERT INTO `pwd_auth_key` VALUES ('106', '2015-09-02 15:46:38', 'uja4', '281113137@qq.comd', '0');
INSERT INTO `pwd_auth_key` VALUES ('107', '2015-09-02 15:46:48', 'sv70', '281113137@qq.comd', '0');
INSERT INTO `pwd_auth_key` VALUES ('108', '2015-09-02 15:50:20', 'twyd', '281113137@qq.comd', '0');
INSERT INTO `pwd_auth_key` VALUES ('109', '2015-09-02 16:43:34', 'xhqz', '', '0');
INSERT INTO `pwd_auth_key` VALUES ('110', '2015-09-02 16:44:56', 'r4kp', '281113137@qq.comq', '0');
INSERT INTO `pwd_auth_key` VALUES ('111', '2015-09-02 16:45:34', 'dxlz', '281113137@qq.comd', '0');
INSERT INTO `pwd_auth_key` VALUES ('112', '2015-09-02 17:22:26', '243275', '18514253619', '0');
INSERT INTO `pwd_auth_key` VALUES ('113', '2015-09-02 17:24:38', '133146', '18514253619', '0');
INSERT INTO `pwd_auth_key` VALUES ('114', '2015-09-02 17:26:47', '886770', '18514253619', '0');
INSERT INTO `pwd_auth_key` VALUES ('115', '2015-09-14 15:03:48', '234664', '15626485037', '0');
INSERT INTO `pwd_auth_key` VALUES ('116', '2015-09-14 15:08:56', '078817', '15626485037', '0');
INSERT INTO `pwd_auth_key` VALUES ('117', '2015-09-14 15:09:45', '779894', '15626485037', '0');
INSERT INTO `pwd_auth_key` VALUES ('118', '2015-09-22 09:48:20', '035138', '18514253610', '0');
INSERT INTO `pwd_auth_key` VALUES ('119', '2015-09-22 09:51:23', '807504', '18514253610', '0');
INSERT INTO `pwd_auth_key` VALUES ('120', '2015-09-22 10:16:05', '141256', '18514253610', '0');
INSERT INTO `pwd_auth_key` VALUES ('121', '2015-09-22 10:20:09', '913331', '18514253610', '0');
INSERT INTO `pwd_auth_key` VALUES ('122', '2015-09-23 17:08:44', 'zgek', '281113137@qq.com', '0');
INSERT INTO `pwd_auth_key` VALUES ('123', '2015-09-23 17:08:45', 'dtxj', '281113137@qq.com', '0');
INSERT INTO `pwd_auth_key` VALUES ('124', '2015-09-28 11:54:07', '389945', '18514253611', '0');
INSERT INTO `pwd_auth_key` VALUES ('125', '2015-09-28 12:49:15', '186523', '18514253619', '0');
INSERT INTO `pwd_auth_key` VALUES ('126', '2015-09-28 12:49:40', '983000', '18773371328', '0');
INSERT INTO `pwd_auth_key` VALUES ('127', '2015-09-28 12:51:35', '632474', '18773371328', '0');
INSERT INTO `pwd_auth_key` VALUES ('128', '2015-09-28 12:53:04', '885936', '18514253611', '0');
INSERT INTO `pwd_auth_key` VALUES ('129', '2015-09-28 12:53:33', '231233', '18514253611', '0');
INSERT INTO `pwd_auth_key` VALUES ('130', '2015-09-28 12:54:09', '426185', '18514253619', '0');
INSERT INTO `pwd_auth_key` VALUES ('131', '2015-09-28 12:54:41', '221554', '18514253619', '0');
INSERT INTO `pwd_auth_key` VALUES ('132', '2015-09-28 12:55:29', '519293', '18514253619', '0');
INSERT INTO `pwd_auth_key` VALUES ('133', '2015-09-28 12:55:52', '127221', '18773371328', '0');
INSERT INTO `pwd_auth_key` VALUES ('134', '2015-09-28 12:57:40', '416176', '18514253619', '0');
INSERT INTO `pwd_auth_key` VALUES ('135', '2015-09-28 13:04:40', '627322', '18514253618', '0');
INSERT INTO `pwd_auth_key` VALUES ('136', '2015-10-09 11:37:57', '200934', '18514253610', '1');

-- ----------------------------
-- Table structure for requirement
-- ----------------------------
DROP TABLE IF EXISTS `requirement`;
CREATE TABLE `requirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL COMMENT '游戏ID',
  `title` varchar(63) DEFAULT NULL COMMENT '标题',
  `price` int(11) DEFAULT NULL COMMENT '需求价格',
  `security_price` int(11) DEFAULT NULL COMMENT '保证金',
  `spend_day` smallint(6) DEFAULT NULL COMMENT '时间',
  `remarks` varchar(1024) DEFAULT NULL COMMENT '备注',
  `cz_provided` tinyint(1) DEFAULT NULL COMMENT '是否提供充值支持',
  `game_account_id` int(11) DEFAULT NULL COMMENT '游戏账号ID',
  `publisher_id` int(11) DEFAULT NULL COMMENT '需求发布者ID',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_date` datetime DEFAULT NULL COMMENT '最近修改时间',
  `result` varchar(256) DEFAULT NULL COMMENT '审核不通过原因',
  `reviewer_id` int(11) DEFAULT NULL COMMENT '审核者ID',
  `state` smallint(6) DEFAULT NULL COMMENT '需求状态',
  `active` tinyint(1) DEFAULT NULL COMMENT '是否下架',
  `receiver_id` int(11) DEFAULT NULL COMMENT '接单者ID',
  `is_paid` tinyint(1) DEFAULT NULL COMMENT '是否付款',
  `platform` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of requirement
-- ----------------------------
INSERT INTO `requirement` VALUES ('1', '113', '好好学习，好好学习!', '111', '100', '7', '111', '1', '333', '23', '2015-07-08 18:28:21', '2015-07-08 18:28:27', '', null, '2', '1', null, '1', '1');
INSERT INTO `requirement` VALUES ('2', '113', '天天向上，天天向上！', '100', '120', null, null, null, null, null, null, null, null, null, '2', '1', null, '1', '1');
INSERT INTO `requirement` VALUES ('9', '113', '得失', null, null, '5', '第三方', '1', '12', '23', '2015-08-21 16:06:27', null, null, null, '2', '1', null, null, '1');
INSERT INTO `requirement` VALUES ('4', '19', '斯蒂芬s', null, null, '2', ' 飞傲视', '1', '13', '23', '2015-08-24 18:09:11', null, null, null, '2', '1', null, null, '1');
INSERT INTO `requirement` VALUES ('11', '19', '', null, null, '0', '', '1', '14', '23', '2015-08-24 19:01:53', null, null, null, '2', '1', null, null, '1');
INSERT INTO `requirement` VALUES ('12', '19', '', null, null, '0', '', '1', '15', '23', '2015-08-25 10:58:30', null, null, null, '2', '1', null, null, '1');
INSERT INTO `requirement` VALUES ('13', '113', 'sdf ', null, null, '1', 'sdf ', '1', '16', '23', '2015-09-10 17:20:14', null, null, null, '2', '1', null, null, '1');

-- ----------------------------
-- Table structure for requirement_game_account
-- ----------------------------
DROP TABLE IF EXISTS `requirement_game_account`;
CREATE TABLE `requirement_game_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(256) DEFAULT NULL COMMENT '账号',
  `password` varchar(256) DEFAULT NULL COMMENT '密码',
  `qufu` varchar(128) DEFAULT NULL COMMENT '区服',
  `role` varchar(256) DEFAULT NULL COMMENT '角色',
  `role_details` varchar(1024) DEFAULT NULL COMMENT '当前角色状态',
  `result` varchar(1024) DEFAULT NULL COMMENT '期望状态',
  `contact_way` varchar(64) DEFAULT NULL COMMENT '联系方式',
  `platform` tinyint(1) DEFAULT NULL COMMENT '平台',
  `operator_id` int(11) DEFAULT NULL COMMENT '客户端',
  `image_path` varchar(512) DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of requirement_game_account
-- ----------------------------
INSERT INTO `requirement_game_account` VALUES ('12', null, null, '斯蒂芬', '说的', '说的', '斯蒂芬', null, '1', '0', '/upload/requirement/20150821/1/');
INSERT INTO `requirement_game_account` VALUES ('13', null, null, '飞', '斯蒂芬', '第三方', '斯蒂芬f', null, '1', '0', 'null');
INSERT INTO `requirement_game_account` VALUES ('14', null, null, '', '', '', '', null, '1', '0', '没有上传的文件！');
INSERT INTO `requirement_game_account` VALUES ('15', null, null, '', '', '', '', null, '1', '0', '没有上传的文件！');
INSERT INTO `requirement_game_account` VALUES ('16', null, null, 'sdf ', 'sdaf ', 'sdf ', 'sdf ', null, '1', '0', '/upload/requirement/20150910/16/');

-- ----------------------------
-- Table structure for requirement_order
-- ----------------------------
DROP TABLE IF EXISTS `requirement_order`;
CREATE TABLE `requirement_order` (
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requirement_id` int(11) DEFAULT NULL COMMENT '需求ID',
  `parent_order_id` int(11) DEFAULT NULL COMMENT '父订单ID',
  `trainer_is_paid` tinyint(1) DEFAULT NULL COMMENT '代练师是否付款',
  `player_is_paid` tinyint(1) DEFAULT NULL COMMENT '玩家是否付款',
  `type` smallint(6) DEFAULT NULL COMMENT '订单类型（现金(玩家/代练师）/交易（玩家&&代练师））',
  `trainer_tel` varchar(63) DEFAULT NULL COMMENT '代练师联系方式',
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of requirement_order
-- ----------------------------
INSERT INTO `requirement_order` VALUES ('2015-07-30 17:00:09', null, '1', '1', '1', '1', '1', '1', '', null);

-- ----------------------------
-- Table structure for sc_account_android
-- ----------------------------
DROP TABLE IF EXISTS `sc_account_android`;
CREATE TABLE `sc_account_android` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `details` varchar(256) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `sell_amount` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `is_on_sale` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_account_android
-- ----------------------------
INSERT INTO `sc_account_android` VALUES ('2', '143', 'ewr33', '50', '0.7', '20', '10', '1', '1');
INSERT INTO `sc_account_android` VALUES ('3', '143', '第三方', '30', '0.7', '20', '10', '1', '1');
INSERT INTO `sc_account_android` VALUES ('4', '113', '12345', '100', '0.7', '20', '10', '1', null);
INSERT INTO `sc_account_android` VALUES ('5', '113', '111', '2222', '1', '20', '10', '1', null);
INSERT INTO `sc_account_android` VALUES ('6', '8', '12345', '2222', '0.7', '20', '10', '2', null);
INSERT INTO `sc_account_android` VALUES ('7', '8', '12345', '2222', '0.7', '20', '10', '2', null);
INSERT INTO `sc_account_android` VALUES ('8', '8', '12345', '2222', '0.7', '20', '10', '2', null);
INSERT INTO `sc_account_android` VALUES ('9', '8', '12345', '2222', '0.7', '20', '10', '2', null);

-- ----------------------------
-- Table structure for sc_account_ios
-- ----------------------------
DROP TABLE IF EXISTS `sc_account_ios`;
CREATE TABLE `sc_account_ios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `details` varchar(256) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `sell_amount` int(11) DEFAULT NULL,
  `is_on_sale` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_account_ios
-- ----------------------------
INSERT INTO `sc_account_ios` VALUES ('1', '143', '1000元宝=50元rdgdfg', '100', '0.5', '88', '23', null);
INSERT INTO `sc_account_ios` VALUES ('2', '143', '4444444', '200', '0.7', '100', '25', '1');
INSERT INTO `sc_account_ios` VALUES ('3', '113', '2222', '2222', '0.7', '20', '10', null);
INSERT INTO `sc_account_ios` VALUES ('4', '6', '12345', '2222', '1', '11', '10', null);
INSERT INTO `sc_account_ios` VALUES ('5', '6', '1000元宝=50元rdgdfg', '100', '0.7', '20', '10', null);
INSERT INTO `sc_account_ios` VALUES ('6', '6', '1000元宝=50元rdgdfg', '100', '0.7', '20', '10', null);
INSERT INTO `sc_account_ios` VALUES ('7', '6', '1000元宝=50元rdgdfg', '100', '0.7', '20', '10', null);

-- ----------------------------
-- Table structure for sc_account_ios_copy
-- ----------------------------
DROP TABLE IF EXISTS `sc_account_ios_copy`;
CREATE TABLE `sc_account_ios_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `details` varchar(256) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `sell_amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_account_ios_copy
-- ----------------------------
INSERT INTO `sc_account_ios_copy` VALUES ('1', '143', '1000元宝=50元rdgdfg', '100', '0.5', '88', '23');
INSERT INTO `sc_account_ios_copy` VALUES ('2', '143', '4444444', '200', '0.7', '100', '25');
INSERT INTO `sc_account_ios_copy` VALUES ('3', '113', '2222', '2222', '0.7', '20', '10');
INSERT INTO `sc_account_ios_copy` VALUES ('4', '6', '12345', '2222', '1', '11', '10');

-- ----------------------------
-- Table structure for sc_game_account_android
-- ----------------------------
DROP TABLE IF EXISTS `sc_game_account_android`;
CREATE TABLE `sc_game_account_android` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `qufu` varchar(128) DEFAULT NULL,
  `qufu_type` varchar(128) DEFAULT NULL,
  `role` varchar(256) DEFAULT NULL,
  `contact_way` varchar(64) DEFAULT NULL,
  `occupation` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_game_account_android
-- ----------------------------
INSERT INTO `sc_game_account_android` VALUES ('1', 'sdf', 'dfs', 'sdf', null, 'ds', 'sdf', null);
INSERT INTO `sc_game_account_android` VALUES ('2', 'sdf', 'sdf', '斯蒂芬', null, '第三方刚', 'sdf', null);
INSERT INTO `sc_game_account_android` VALUES ('3', 'dd', 'hhhh', 'bbhh', null, 'hh', 'hhh', null);
INSERT INTO `sc_game_account_android` VALUES ('4', '18514253610', 'sdf', 'sdf', null, 'sdf', '18514253610', null);
INSERT INTO `sc_game_account_android` VALUES ('5', 'sdf', 'sdf', 'sdf', null, '第三方', '18514253610', null);
INSERT INTO `sc_game_account_android` VALUES ('6', 'sdf', 'sdf', 'sdf', null, 'gfd', '18514253610', null);
INSERT INTO `sc_game_account_android` VALUES ('7', '18514253610', 'sdf', 'sdf', null, 'sdf', '18514253610', null);
INSERT INTO `sc_game_account_android` VALUES ('8', 'sss', 'sss', 'dd', null, 'dd', '18514253610', null);
INSERT INTO `sc_game_account_android` VALUES ('9', 'dd', 'dd', 'dd', null, 'ddd', '18514253610', null);

-- ----------------------------
-- Table structure for sc_game_account_ios
-- ----------------------------
DROP TABLE IF EXISTS `sc_game_account_ios`;
CREATE TABLE `sc_game_account_ios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `qufu` varchar(128) DEFAULT NULL,
  `qufu_type` varchar(128) DEFAULT NULL,
  `role` varchar(256) DEFAULT NULL,
  `contact_way` varchar(64) DEFAULT NULL,
  `occupation` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_game_account_ios
-- ----------------------------
INSERT INTO `sc_game_account_ios` VALUES ('1', 'sdf', '123abc', 'sdf', null, 'ds', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('2', 'sdf', 'sdf', 'sdf', null, 'sdf', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('3', 'dsf', 'sdf', 'sdf', null, 'dsf', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('4', 'dsf', 'sdf', 'sdf', null, 'dsf', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('5', 'cxzc', 'fsd', 'fdg', null, 'gfd', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('6', 'sdf', 'sdf', 'fsdf', null, 'fsd sd', 'sdf', null);
INSERT INTO `sc_game_account_ios` VALUES ('7', 'abc', 'abc', 'abc', null, 'abc', 'abc', null);
INSERT INTO `sc_game_account_ios` VALUES ('8', 'dfs', 'sdf', 'dfg', null, 'gfd', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('9', 'abc', '1把', 'abc', null, 'abc', 'abc', null);
INSERT INTO `sc_game_account_ios` VALUES ('10', '发的', 'ds', '地方官', null, '地方', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('11', 'dd', 'ss', 'hhh', null, 'hh', 'bbb', null);
INSERT INTO `sc_game_account_ios` VALUES ('12', 'sdf', 'df', 'sdf', null, 'sdf', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('13', '', '', '', null, '', '', null);
INSERT INTO `sc_game_account_ios` VALUES ('14', '18514253610', '1111', 'sdf', null, 'sdf', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('15', '18514253610', '1111', 'sdf', null, 'sdf', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('16', '18514253610', '1111', 'sdf', null, 'sdf', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('17', 'sdf', 'sdf', '撒地方', null, '撒地方', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('18', '18514253610', 'sdf', 'sdf', null, 'sdf', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('19', '18514253610', 'dsf', 'sdf', null, 'sdf', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('20', '111', '111', '订单', null, '肥嘟嘟地', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('21', 'ss', 'ss', 'sss', null, '订单', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('22', 'ss', 'ss', 'ss', null, 'ss', '18514253610', null);
INSERT INTO `sc_game_account_ios` VALUES ('23', 'ss', 'sss', 'ss', null, 'ss', '18514253610', null);

-- ----------------------------
-- Table structure for sc_order_android
-- ----------------------------
DROP TABLE IF EXISTS `sc_order_android`;
CREATE TABLE `sc_order_android` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `sc_account_id` int(11) DEFAULT NULL,
  `game_account_id` int(11) DEFAULT NULL,
  `real_payment` float DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `callback_url` varchar(512) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `id_no` varchar(16) DEFAULT NULL,
  `pay_way` varchar(256) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1289135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_order_android
-- ----------------------------
INSERT INTO `sc_order_android` VALUES ('1289130', '2015-11-20 11:55:41', '143', '1', '5', '899', '1', '2015-11-20 11:55:46', 'AndroidSc/get_finish', '1', null, '1161289130', 'alipay', '2015-11-20 11:55:46', '72');
INSERT INTO `sc_order_android` VALUES ('1289131', '2015-11-20 11:56:29', '113', '4', '6', '70', '1', '2015-11-20 11:56:33', 'AndroidSc/get_finish', '1', null, '1161289131', 'alipay', '2015-11-20 11:56:33', '72');
INSERT INTO `sc_order_android` VALUES ('1289132', '2015-12-02 17:01:06', '8', '6', '7', '1555', '1', '2015-12-02 17:01:12', 'AndroidSc/get_finish', '1', null, '1161289132', 'alipay', '2015-12-02 17:01:12', '72');
INSERT INTO `sc_order_android` VALUES ('1289133', '2016-01-12 11:08:21', '113', '4', '8', '70', '1', '2016-01-12 11:08:27', 'AndroidSc/get_finish', '1', null, '1161289133', 'alipay', '2016-01-12 11:08:27', '72');
INSERT INTO `sc_order_android` VALUES ('1289134', '2016-01-13 17:37:54', '8', '6', '9', '1555', '1', '2016-01-13 17:37:59', 'AndroidSc/get_finish', '1', null, '1161289134', 'alipay', '2016-01-13 17:37:59', '72');

-- ----------------------------
-- Table structure for sc_order_ios
-- ----------------------------
DROP TABLE IF EXISTS `sc_order_ios`;
CREATE TABLE `sc_order_ios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `sc_account_id` int(11) DEFAULT NULL,
  `game_account_id` int(11) DEFAULT NULL,
  `customer_user_id` int(11) DEFAULT NULL,
  `real_payment` float DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `callback_url` varchar(512) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `id_no` varchar(16) DEFAULT NULL,
  `pay_way` varchar(256) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_order_ios
-- ----------------------------
INSERT INTO `sc_order_ios` VALUES ('1', '2015-08-22 17:45:51', '113', '1', '8', '23', '50', '1', '2015-08-22 17:45:58', 'Home/AndroidSc/get_finish/orderId/1', null, null, '1440239909', '', '2015-08-22 17:45:58', null);
INSERT INTO `sc_order_ios` VALUES ('2', '2015-08-22 17:50:06', '113', '1', '9', '23', '50', '1', '2015-08-22 17:50:09', 'Home/AndroidSc/get_finish/orderId/2', null, null, '1440382498', 'shengpayICBC', '2015-08-22 17:50:09', null);
INSERT INTO `sc_order_ios` VALUES ('3', '2015-08-24 09:40:28', '113', '1', '10', '23', '50', '1', '2015-08-24 09:40:43', 'Home/IOSSc/get_finish/orderId/3', null, null, '1440385938', 'shengpayICBC', '2015-08-24 09:40:43', null);
INSERT INTO `sc_order_ios` VALUES ('4', '2015-08-24 11:09:14', '113', '1', '11', '23', '50', '1', '2015-08-24 11:09:24', 'Home/IOSSc/get_finish/orderId/4', null, null, '1440385764', '', '2015-08-24 11:09:24', null);
INSERT INTO `sc_order_ios` VALUES ('5', '2015-08-24 11:12:47', '113', '2', '12', '23', '140', '1', '2015-08-24 11:12:52', 'Home/IOSSc/get_finish/orderId/5', null, null, '1440385972', 'shengpaySPDB', '2015-08-24 11:12:52', null);
INSERT INTO `sc_order_ios` VALUES ('6', '2015-08-31 09:45:16', '113', '1', '13', '23', '50', null, null, null, null, null, null, null, null, null);
INSERT INTO `sc_order_ios` VALUES ('7', '2015-09-28 10:20:30', '143', '1', '16', null, '50', '1', '2015-09-28 11:23:18', 'Home/IOSSc/get_finish/orderId/7', '1', null, '1443410598', 'hb', '2015-09-28 11:23:18', '72');
INSERT INTO `sc_order_ios` VALUES ('8', '2015-12-02 16:45:23', '6', '4', '17', null, '2222', null, null, 'IOSSc/get_finish', '0', null, '8', 'alipay', null, '72');
INSERT INTO `sc_order_ios` VALUES ('9', '2015-12-02 16:58:10', '6', '4', '18', null, '2222', '1', '2015-12-02 16:59:40', 'IOSSc/get_finish', '1', null, '9', 'alipay', '2015-12-02 16:59:40', '72');
INSERT INTO `sc_order_ios` VALUES ('10', '2016-01-12 09:59:25', '143', '1', '19', null, '50', '1', '2016-01-12 09:59:33', 'IOSSc/get_finish', '1', null, '10', 'alipay', '2016-01-12 09:59:33', '72');
INSERT INTO `sc_order_ios` VALUES ('11', '2016-01-12 10:20:30', '143', '1', '20', null, '50', '1', '2016-01-12 10:20:34', 'IOSSc/get_finish', '1', null, '11', 'alipay', '2016-01-12 10:20:34', '72');
INSERT INTO `sc_order_ios` VALUES ('12', '2016-01-12 10:21:39', '143', '1', '21', null, '50', '1', '2016-01-12 10:21:47', 'IOSSc/get_finish', '0', null, '12', 'alipay', '2016-01-12 10:21:47', '72');
INSERT INTO `sc_order_ios` VALUES ('13', '2016-01-12 10:42:33', '143', '1', '22', null, '50', '1', '2016-01-12 10:42:37', 'IOSSc/get_finish', '1', null, '13', 'alipay', '2016-01-12 10:42:37', '72');
INSERT INTO `sc_order_ios` VALUES ('14', '2016-01-12 10:49:21', '113', '3', '23', null, '1555', '1', '2016-01-12 10:49:28', 'IOSSc/get_finish', '1', null, '14', 'alipay', '2016-01-12 10:49:28', '72');

-- ----------------------------
-- Table structure for sc_record_ios
-- ----------------------------
DROP TABLE IF EXISTS `sc_record_ios`;
CREATE TABLE `sc_record_ios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_record_ios
-- ----------------------------
INSERT INTO `sc_record_ios` VALUES ('1', '113', 'xconly2014');
INSERT INTO `sc_record_ios` VALUES ('2', '111', '18514253610');

-- ----------------------------
-- Table structure for search_game_list
-- ----------------------------
DROP TABLE IF EXISTS `search_game_list`;
CREATE TABLE `search_game_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of search_game_list
-- ----------------------------

-- ----------------------------
-- Table structure for search_word
-- ----------------------------
DROP TABLE IF EXISTS `search_word`;
CREATE TABLE `search_word` (
  `created_date` datetime DEFAULT NULL,
  `word` varchar(125) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of search_word
-- ----------------------------
INSERT INTO `search_word` VALUES ('2015-12-14 16:32:56', '三国');
INSERT INTO `search_word` VALUES ('2015-12-24 17:04:23', '18514253610f ');
INSERT INTO `search_word` VALUES ('2015-12-24 17:23:44', '18514253610');
INSERT INTO `search_word` VALUES ('2015-12-25 17:45:50', 'sdf');
INSERT INTO `search_word` VALUES ('2016-01-28 11:08:24', 'fgg');
INSERT INTO `search_word` VALUES ('2016-02-25 10:45:00', '热');

-- ----------------------------
-- Table structure for security
-- ----------------------------
DROP TABLE IF EXISTS `security`;
CREATE TABLE `security` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `security_price` int(11) DEFAULT NULL,
  `efficiency_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security
-- ----------------------------

-- ----------------------------
-- Table structure for seo
-- ----------------------------
DROP TABLE IF EXISTS `seo`;
CREATE TABLE `seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `html_title` text,
  `html_keyword` text,
  `html_description` text,
  `url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seo
-- ----------------------------

-- ----------------------------
-- Table structure for sign_records
-- ----------------------------
DROP TABLE IF EXISTS `sign_records`;
CREATE TABLE `sign_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(16) DEFAULT NULL,
  `month` varchar(16) DEFAULT NULL,
  `day` varchar(16) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sign_records
-- ----------------------------
INSERT INTO `sign_records` VALUES ('11', '2015', '7', '29', '23', '2015-07-29 11:47:39');
INSERT INTO `sign_records` VALUES ('13', '2015', '8', '14', '23', '2015-08-14 09:34:08');
INSERT INTO `sign_records` VALUES ('14', '2015', '8', '24', '23', '2015-08-24 16:11:51');
INSERT INTO `sign_records` VALUES ('15', '2015', '8', '25', '23', '2015-08-25 10:13:30');
INSERT INTO `sign_records` VALUES ('18', '2015', '8', '27', '23', '2015-08-27 10:28:16');
INSERT INTO `sign_records` VALUES ('19', '2015', '8', '28', '23', '2015-08-28 09:10:48');
INSERT INTO `sign_records` VALUES ('20', '2015', '9', '14', '23', '2015-09-14 10:55:02');
INSERT INTO `sign_records` VALUES ('21', '2015', '9', '22', '68', '2015-09-22 09:49:15');
INSERT INTO `sign_records` VALUES ('22', '2015', '9', '23', '72', '2015-09-23 10:14:01');
INSERT INTO `sign_records` VALUES ('23', '2015', '9', '24', '72', '2015-09-24 14:51:37');
INSERT INTO `sign_records` VALUES ('24', '2015', '9', '24', '74', '2015-09-24 16:55:08');
INSERT INTO `sign_records` VALUES ('25', '2015', '9', '28', '72', '2015-09-28 16:44:18');
INSERT INTO `sign_records` VALUES ('26', '2015', '10', '16', '72', '2015-10-16 17:13:47');
INSERT INTO `sign_records` VALUES ('27', '2015', '10', '19', '72', '2015-10-19 10:39:28');
INSERT INTO `sign_records` VALUES ('28', '2015', '10', '30', '72', '2015-10-30 16:30:59');
INSERT INTO `sign_records` VALUES ('29', '2015', '11', '12', '72', '2015-11-12 10:43:59');
INSERT INTO `sign_records` VALUES ('30', '2015', '12', '16', '74', '2015-12-16 10:09:48');
INSERT INTO `sign_records` VALUES ('31', '2015', '12', '19', '72', '2015-12-19 10:47:43');
INSERT INTO `sign_records` VALUES ('41', '2015', '12', '18', '74', '2015-12-18 18:16:08');
INSERT INTO `sign_records` VALUES ('49', '2015', '12', '19', '74', '2015-12-19 09:57:57');
INSERT INTO `sign_records` VALUES ('65', '2015', '12', '20', '72', '2015-12-20 18:19:30');
INSERT INTO `sign_records` VALUES ('97', '2015', '12', '22', '72', '2015-12-22 17:19:13');
INSERT INTO `sign_records` VALUES ('96', '2015', '12', '22', '74', '2015-12-22 17:16:34');
INSERT INTO `sign_records` VALUES ('98', '2015', '12', '24', '72', '2015-12-24 09:30:01');
INSERT INTO `sign_records` VALUES ('99', '2015', '12', '29', '72', '2015-12-29 17:58:25');
INSERT INTO `sign_records` VALUES ('100', '2015', '12', '31', '72', '2015-12-31 15:29:08');
INSERT INTO `sign_records` VALUES ('103', '2016', '1', '4', '72', '2016-01-04 10:37:27');
INSERT INTO `sign_records` VALUES ('104', '2016', '1', '5', '72', '2016-01-05 09:54:23');
INSERT INTO `sign_records` VALUES ('105', '2016', '1', '7', '72', '2016-01-07 11:20:05');
INSERT INTO `sign_records` VALUES ('106', '2016', '1', '7', '76', '2016-01-07 17:12:22');
INSERT INTO `sign_records` VALUES ('107', '2016', '1', '25', '72', '2016-01-25 11:33:56');
INSERT INTO `sign_records` VALUES ('108', '2016', '1', '26', '74', '2016-01-26 09:51:24');
INSERT INTO `sign_records` VALUES ('109', '2016', '2', '1', '72', '2016-02-01 14:49:05');
INSERT INTO `sign_records` VALUES ('110', '2016', '2', '26', '72', '2016-02-26 17:11:20');

-- ----------------------------
-- Table structure for suggested_game_list
-- ----------------------------
DROP TABLE IF EXISTS `suggested_game_list`;
CREATE TABLE `suggested_game_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suggested_game_list
-- ----------------------------
INSERT INTO `suggested_game_list` VALUES ('1', '113');
INSERT INTO `suggested_game_list` VALUES ('2', '234');
INSERT INTO `suggested_game_list` VALUES ('3', '6');
INSERT INTO `suggested_game_list` VALUES ('6', '7');
INSERT INTO `suggested_game_list` VALUES ('7', '96');
INSERT INTO `suggested_game_list` VALUES ('11', '9');

-- ----------------------------
-- Table structure for suggestion
-- ----------------------------
DROP TABLE IF EXISTS `suggestion`;
CREATE TABLE `suggestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advice` text,
  `created_date` datetime DEFAULT NULL,
  `contact_way` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suggestion
-- ----------------------------
INSERT INTO `suggestion` VALUES ('1', '啊啊啊', '2016-01-19 10:02:03', '把');
INSERT INTO `suggestion` VALUES ('2', '的冯绍峰sd', '2016-01-19 10:06:59', '飞');
INSERT INTO `suggestion` VALUES ('3', 'dsfd ', '2016-01-19 10:12:52', 'dsf ');
INSERT INTO `suggestion` VALUES ('4', 'oih', '2016-01-19 10:13:24', 'jj');
INSERT INTO `suggestion` VALUES ('5', '来来来', '2016-01-19 10:13:33', '把');
INSERT INTO `suggestion` VALUES ('6', '斯蒂芬', '2016-01-19 10:19:34', '斯蒂芬');
INSERT INTO `suggestion` VALUES ('7', '第三方', '2016-01-19 10:26:36', '撒地方');
INSERT INTO `suggestion` VALUES ('8', '呃呃', '2016-01-19 10:26:54', '看看');
INSERT INTO `suggestion` VALUES ('9', '呃呃呃', '2016-01-19 10:27:12', '呃呃');
INSERT INTO `suggestion` VALUES ('10', '斯蒂芬', '2016-01-19 10:27:43', '倒萨');
INSERT INTO `suggestion` VALUES ('11', '啊啊啊啊', '2016-01-19 10:27:56', '啊啊啊');
INSERT INTO `suggestion` VALUES ('12', '呃呃', '2016-01-19 10:29:36', '把');
INSERT INTO `suggestion` VALUES ('13', 'dddd', '2016-01-28 11:05:23', 'dddd');

-- ----------------------------
-- Table structure for traffic_option
-- ----------------------------
DROP TABLE IF EXISTS `traffic_option`;
CREATE TABLE `traffic_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_price` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `production_no` varchar(32) DEFAULT NULL,
  `yys_type_id` smallint(6) DEFAULT NULL,
  `real_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traffic_option
-- ----------------------------
INSERT INTO `traffic_option` VALUES ('5', '5.4', '6', '50', '000000004cdff715014ce05ff5d70000', '2', '50');
INSERT INTO `traffic_option` VALUES ('6', '0.9', '1', '5', '000000004cdff715014ce062806c0020', '3', '5');
INSERT INTO `traffic_option` VALUES ('7', '1.8', '2', '10', '000000004cdff715014ce0ab9f50005f', '3', '10');
INSERT INTO `traffic_option` VALUES ('8', '6.3', '7', '50', '000000004ce97bdb014cede579c80047', '3', '50');
INSERT INTO `traffic_option` VALUES ('9', '4.5', '5', '30', '000000004d09ba28014d09f143d60000', '3', '30');
INSERT INTO `traffic_option` VALUES ('10', '2.7', '3', '10', '000000004d23c6ef014d2847799b0023', '1', '10');
INSERT INTO `traffic_option` VALUES ('11', '4.5', '5', '30', '000000004d23c6ef014d28481c4a0025', '1', '30');
INSERT INTO `traffic_option` VALUES ('12', '9', '10', '70', '000000004d23c6ef014d2848b58c0027', '1', '70');
INSERT INTO `traffic_option` VALUES ('13', '18', '20', '150', '000000004d23c6ef014d284a17660029', '1', '150');
INSERT INTO `traffic_option` VALUES ('14', '27', '30', '500', '000000004d23c6ef014d284a913a002b', '1', '500');
INSERT INTO `traffic_option` VALUES ('15', '13.5', '15', '200', '000000004d375387014d41da22a8002f', '2', '200');
INSERT INTO `traffic_option` VALUES ('16', '9', '10', '100', '000000004d375387014d41dc5144008d', '3', '100');
INSERT INTO `traffic_option` VALUES ('17', '13.5', '15', '200', '000000004d375387014d41dd174b00ad', '3', '200');
INSERT INTO `traffic_option` VALUES ('18', '27', '30', '500', '000000004d375387014d41dd94ac00cd', '3', '500');
INSERT INTO `traffic_option` VALUES ('19', '45', '50', '1000', '000000004d375387014d41ddf64200ed', '3', '1000');
INSERT INTO `traffic_option` VALUES ('20', '45', '50', '1000', '000000004d56e353014d6ae8c7470021', '1', '1000');
INSERT INTO `traffic_option` VALUES ('21', '2.7', '3', '20', '000000004d9f2a6d014db6e97a2300cf', '2', '20');
INSERT INTO `traffic_option` VALUES ('22', '9', '10', '100', '000000004d9f2a6d014db6ea579400ef', '2', '100');
INSERT INTO `traffic_option` VALUES ('23', '27', '30', '500', '000000004d9f2a6d014db6ec9e29010f', '2', '500');

-- ----------------------------
-- Table structure for traffic_order
-- ----------------------------
DROP TABLE IF EXISTS `traffic_order`;
CREATE TABLE `traffic_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(12) DEFAULT NULL,
  `pay_way` varchar(256) DEFAULT NULL,
  `real_payment` float DEFAULT NULL,
  `option_id` smallint(6) DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `callback_url` varchar(512) DEFAULT NULL,
  `id_no` varchar(16) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traffic_order
-- ----------------------------
INSERT INTO `traffic_order` VALUES ('19', '18514253610', '', '0', '0', '2015-08-31 09:46:08', 'Home/TrafficOrder/buy_finish/orderId/19', '1061440985568', '1', null, '2015-08-31 09:46:08');
INSERT INTO `traffic_order` VALUES ('20', '18773371328', 'mobile_alipay', '9.5', '12', null, 'Home/TrafficOrder/buy_finish/orderId/20', '1061441509368', '0', null, null);
INSERT INTO `traffic_order` VALUES ('21', '18514253610', '', '2.85', '10', null, 'Home/TrafficOrder/buy_finish/orderId/21', '1061441521169', '0', null, null);
INSERT INTO `traffic_order` VALUES ('22', '18514253610', 'mobile_alipay', '4.75', '11', '2015-09-06 17:27:35', 'Home/TrafficOrder/buy_finish/orderId/22', '1061441531655', '1', null, '2015-09-06 17:27:35');
INSERT INTO `traffic_order` VALUES ('23', '18514253610', 'mobile_alipay', '0', '0', '2015-09-06 17:39:58', 'Home/TrafficOrder/buy_finish/orderId/23', '1061441532398', '1', null, '2015-09-06 17:39:58');
INSERT INTO `traffic_order` VALUES ('24', '18514253610', 'mobile_alipay', '6', '5', '2015-09-06 17:42:16', 'Home/TrafficOrder/buy_finish/orderId/24', '1061441532536', '1', null, '2015-09-06 17:42:16');
INSERT INTO `traffic_order` VALUES ('25', '', 'alipay', '0', '0', '2015-09-16 17:21:19', 'Home/TrafficOrder/buy_finish/orderId/25', '1061442395279', '1', null, '2015-09-16 17:21:19');
INSERT INTO `traffic_order` VALUES ('26', '', 'wx', '0', '0', '2015-09-16 17:21:35', 'Home/TrafficOrder/buy_finish/orderId/26', '1061442395295', '1', null, '2015-09-16 17:21:35');
INSERT INTO `traffic_order` VALUES ('27', '', 'alipay', '0', '0', '2015-09-16 17:22:40', 'Home/TrafficOrder/buy_finish/orderId/27', '1061442395360', '1', null, '2015-09-16 17:22:40');
INSERT INTO `traffic_order` VALUES ('28', '', 'alipay', '0', '0', '2015-09-16 17:24:04', 'Home/TrafficOrder/buy_finish/orderId/28', '1061442395444', '1', null, '2015-09-16 17:24:04');
INSERT INTO `traffic_order` VALUES ('29', '', 'alipay', '0', '0', '2015-09-16 17:24:13', 'Home/TrafficOrder/buy_finish/orderId/29', '1061442395453', '1', null, '2015-09-16 17:24:13');
INSERT INTO `traffic_order` VALUES ('30', '', '', '0', '0', '2015-09-16 17:24:15', 'Home/TrafficOrder/buy_finish/orderId/30', '1061442395455', '1', null, '2015-09-16 17:24:15');
INSERT INTO `traffic_order` VALUES ('31', '', '', '0', '0', '2015-09-16 17:24:16', 'Home/TrafficOrder/buy_finish/orderId/31', '1061442395456', '1', null, '2015-09-16 17:24:16');
INSERT INTO `traffic_order` VALUES ('32', '', '', '0', '0', '2015-09-16 17:24:17', 'Home/TrafficOrder/buy_finish/orderId/32', '1061442395457', '1', null, '2015-09-16 17:24:17');
INSERT INTO `traffic_order` VALUES ('33', '', 'alipay', '0', '0', '2015-09-16 17:37:45', 'Home/TrafficOrder/buy_finish/orderId/33', '1061442396265', '1', null, '2015-09-16 17:37:45');
INSERT INTO `traffic_order` VALUES ('34', '', '', '0', '0', '2015-09-16 17:37:49', 'Home/TrafficOrder/buy_finish/orderId/34', '1061442396269', '1', null, '2015-09-16 17:37:49');
INSERT INTO `traffic_order` VALUES ('35', '', '', '0', '0', null, 'Home/TrafficOrder/buy_finish/orderId/35', '1061442396269', '0', null, null);
INSERT INTO `traffic_order` VALUES ('36', '', '', '0', '0', null, 'Home/TrafficOrder/buy_finish/orderId/36', '1061442396269', '0', null, null);
INSERT INTO `traffic_order` VALUES ('37', '', '', '0', '0', '2015-09-16 17:37:50', 'Home/TrafficOrder/buy_finish/orderId/37', '1061442396270', '1', null, '2015-09-16 17:37:50');
INSERT INTO `traffic_order` VALUES ('38', '', 'alipay', '0', '0', '2015-09-16 17:46:14', 'Home/TrafficOrder/buy_finish/orderId/38', '1061442396774', '1', null, '2015-09-16 17:46:14');
INSERT INTO `traffic_order` VALUES ('39', '', '', '0', '0', '2015-09-16 18:21:15', 'Home/TrafficOrder/buy_finish/orderId/39', '1061442398875', '1', null, '2015-09-16 18:21:15');
INSERT INTO `traffic_order` VALUES ('40', '', '', '0', '0', '2015-09-16 20:09:14', 'Home/TrafficOrder/buy_finish/orderId/40', '1061442405354', '1', null, '2015-09-16 20:09:14');
INSERT INTO `traffic_order` VALUES ('41', '18514253610', 'alipay', '30', '23', '2015-09-16 20:16:02', 'Home/TrafficOrder/buy_finish/orderId/41', '1061442405762', '1', null, '2015-09-16 20:16:02');
INSERT INTO `traffic_order` VALUES ('42', '18514253610', 'alipay', '0', '0', '2015-09-16 20:16:24', 'Home/TrafficOrder/buy_finish/orderId/42', '1061442405784', '1', null, '2015-09-16 20:16:24');
INSERT INTO `traffic_order` VALUES ('43', '18514253610', 'hb', '0', '0', '2015-09-17 09:56:06', 'Home/TrafficOrder/buy_finish/orderId/43', '1061442454966', '1', null, '2015-09-17 09:56:06');
INSERT INTO `traffic_order` VALUES ('44', '18514253610', 'alipay', '0', '0', '2015-09-17 10:14:54', 'Home/TrafficOrder/buy_finish/orderId/44', '1061442456094', '1', null, '2015-09-17 10:14:54');
INSERT INTO `traffic_order` VALUES ('45', '', '', '0', '0', '2015-09-17 10:18:07', 'Home/TrafficOrder/buy_finish/orderId/45', '1061442456287', '1', null, '2015-09-17 10:18:07');
INSERT INTO `traffic_order` VALUES ('46', '18514253610', 'alipay', '0', '0', '2015-09-17 10:34:34', 'Home/TrafficOrder/buy_finish/orderId/46', '1061442457274', '1', null, '2015-09-17 10:34:34');
INSERT INTO `traffic_order` VALUES ('47', '18514253610', 'alipay', '30', '23', '2015-09-17 11:02:48', 'Home/TrafficOrder/buy_finish/orderId/47', '1061442458968', '1', null, '2015-09-17 11:02:48');
INSERT INTO `traffic_order` VALUES ('48', '18514253610', 'alipay', '6', '5', '2015-09-17 11:03:31', 'Home/TrafficOrder/buy_finish/orderId/48', '1061442459011', '1', null, '2015-09-17 11:03:31');
INSERT INTO `traffic_order` VALUES ('49', '18514253610', 'mobile_alipay', '0', '0', '2015-09-17 11:04:36', 'Home/TrafficOrder/buy_finish/orderId/49', '1061442459076', '1', null, '2015-09-17 11:04:36');
INSERT INTO `traffic_order` VALUES ('50', '18514253610', 'mobile_alipay', '3', '21', '2015-09-17 11:09:27', 'Home/TrafficOrder/buy_finish/orderId/50', '1061442459367', '1', null, '2015-09-17 11:09:27');
INSERT INTO `traffic_order` VALUES ('51', '18514253610', 'alipay', '3', '21', '2015-09-17 11:10:56', 'Home/TrafficOrder/buy_finish/orderId/51', '1061442459456', '1', null, '2015-09-17 11:10:56');
INSERT INTO `traffic_order` VALUES ('52', '18514253610', 'mobile_alipay', '30', '23', '2015-09-17 11:11:21', 'Home/TrafficOrder/buy_finish/orderId/52', '1061442459481', '1', null, '2015-09-17 11:11:21');
INSERT INTO `traffic_order` VALUES ('53', '18514253610', 'alipay', '6', '5', '2015-09-18 14:21:37', 'Home/TrafficOrder/buy_finish/orderId/53', '1061442557297', '1', null, '2015-09-18 14:21:37');
INSERT INTO `traffic_order` VALUES ('54', '18514253610', 'alipay', '6', '5', '2015-09-18 14:21:59', 'Home/TrafficOrder/buy_finish/orderId/54', '1061442557319', '1', null, '2015-09-18 14:21:59');
INSERT INTO `traffic_order` VALUES ('55', '18773371328', 'mobile_alipay', '3', '21', '2015-10-19 11:13:31', 'Home/TrafficOrder/buy_finish/orderId/55', '1061445224411472', '1', null, '2015-10-19 11:13:31');
INSERT INTO `traffic_order` VALUES ('56', '18773371328', 'mobile_alipay', '4.75', '11', '2015-10-19 11:43:16', 'Home/TrafficOrder/buy_finish/orderId/56', '1061445226196853', '1', null, '2015-10-19 11:43:16');
INSERT INTO `traffic_order` VALUES ('57', '18514253610', 'mobile_alipay', '4.75', '11', '2015-10-19 11:45:19', 'Home/TrafficOrder/buy_finish/orderId/57', '1061445226319723', '1', null, '2015-10-19 11:45:19');
INSERT INTO `traffic_order` VALUES ('58', '18773371328', 'mobile_alipay', '3', '21', '2015-10-19 11:45:52', 'Home/TrafficOrder/buy_finish/orderId/58', '1061445226352157', '1', null, '2015-10-19 11:45:52');
INSERT INTO `traffic_order` VALUES ('59', '18514253610', 'mobile_alipay', '30', '23', '2015-10-19 11:47:28', 'Home/TrafficOrder/buy_finish/orderId/59', '1061445226448137', '1', null, '2015-10-19 11:47:28');
INSERT INTO `traffic_order` VALUES ('60', '18514253610', 'mobile_alipay', '4.75', '11', '2015-10-19 14:15:33', 'Home/TrafficOrder/buy_finish/orderId/60', '1061445235333588', '1', null, '2015-10-19 14:15:33');
INSERT INTO `traffic_order` VALUES ('61', '18514253610', 'mobile_alipay', '4.75', '11', '2015-10-19 14:17:26', 'Home/TrafficOrder/buy_finish/orderId/61', '1061445235446484', '1', null, '2015-10-19 14:17:26');
INSERT INTO `traffic_order` VALUES ('62', '18514253610', 'alipay', '4.75', '11', '2015-10-19 14:17:40', 'Home/TrafficOrder/buy_finish/orderId/62', '1061445235460286', '1', null, '2015-10-19 14:17:40');
INSERT INTO `traffic_order` VALUES ('63', '', '', '0', '0', '2015-10-19 14:17:45', 'Home/TrafficOrder/buy_finish/orderId/63', '1061445235465402', '1', null, '2015-10-19 14:17:45');
INSERT INTO `traffic_order` VALUES ('64', '', '', '0', '0', '2015-10-19 14:17:46', 'Home/TrafficOrder/buy_finish/orderId/64', '1061445235466533', '1', null, '2015-10-19 14:17:46');
INSERT INTO `traffic_order` VALUES ('65', '18773371328', 'alipay', '9', '12', null, 'Home/TrafficOrder/buy_finish/orderId/65', '1061445306451288', '0', null, null);
INSERT INTO `traffic_order` VALUES ('66', '18773371328', 'hb', '45', '20', null, 'Home/TrafficOrder/buy_finish/orderId/66', '10666', '0', null, null);
INSERT INTO `traffic_order` VALUES ('67', '18514253610', 'alipay', '2.7', '21', null, 'TrafficOrder/buy_finish', '10667', '0', null, null);
INSERT INTO `traffic_order` VALUES ('68', '18514253610', 'alipay', '2.7', '21', null, 'TrafficOrder/buy_finish', '10668', '0', null, null);
INSERT INTO `traffic_order` VALUES ('69', '', '', '0', '0', null, 'TrafficOrder/buy_finish', '10669', '0', null, null);
INSERT INTO `traffic_order` VALUES ('70', '', '', '0', '0', null, 'TrafficOrder/buy_finish', '10670', '0', null, null);
INSERT INTO `traffic_order` VALUES ('71', '18514253610', 'alipay', '2.7', '21', null, 'TrafficOrder/buy_finish', '10671', '0', null, null);
INSERT INTO `traffic_order` VALUES ('72', '18514253610', 'alipay', '2.7', '21', '2015-12-24 16:51:20', 'TrafficOrder/buy_finish', '10672', '1', null, '2015-12-24 16:51:20');

-- ----------------------------
-- Table structure for traffic_province
-- ----------------------------
DROP TABLE IF EXISTS `traffic_province`;
CREATE TABLE `traffic_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traffic_province
-- ----------------------------
INSERT INTO `traffic_province` VALUES ('1', '北京');
INSERT INTO `traffic_province` VALUES ('2', '新疆');
INSERT INTO `traffic_province` VALUES ('3', '重庆');
INSERT INTO `traffic_province` VALUES ('4', '广东');
INSERT INTO `traffic_province` VALUES ('5', '浙江');
INSERT INTO `traffic_province` VALUES ('6', '天津');
INSERT INTO `traffic_province` VALUES ('7', '广西');
INSERT INTO `traffic_province` VALUES ('8', '内蒙古');
INSERT INTO `traffic_province` VALUES ('9', '宁夏');
INSERT INTO `traffic_province` VALUES ('10', '江西');
INSERT INTO `traffic_province` VALUES ('11', '安徽');
INSERT INTO `traffic_province` VALUES ('12', '贵州');
INSERT INTO `traffic_province` VALUES ('13', '陕西');
INSERT INTO `traffic_province` VALUES ('14', '辽宁');
INSERT INTO `traffic_province` VALUES ('15', '山西');
INSERT INTO `traffic_province` VALUES ('16', '青海');
INSERT INTO `traffic_province` VALUES ('17', '四川');
INSERT INTO `traffic_province` VALUES ('18', '江苏');
INSERT INTO `traffic_province` VALUES ('19', '河北');
INSERT INTO `traffic_province` VALUES ('20', '西藏');
INSERT INTO `traffic_province` VALUES ('21', '福建');
INSERT INTO `traffic_province` VALUES ('22', '吉林');
INSERT INTO `traffic_province` VALUES ('23', '云南');
INSERT INTO `traffic_province` VALUES ('24', '上海');
INSERT INTO `traffic_province` VALUES ('25', '湖北');
INSERT INTO `traffic_province` VALUES ('26', '海南');
INSERT INTO `traffic_province` VALUES ('27', '甘肃');
INSERT INTO `traffic_province` VALUES ('28', '湖南');
INSERT INTO `traffic_province` VALUES ('29', '山东');
INSERT INTO `traffic_province` VALUES ('30', '河南');
INSERT INTO `traffic_province` VALUES ('31', '黑龙江');
INSERT INTO `traffic_province` VALUES ('32', '未知');

-- ----------------------------
-- Table structure for traffic_yys
-- ----------------------------
DROP TABLE IF EXISTS `traffic_yys`;
CREATE TABLE `traffic_yys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traffic_yys
-- ----------------------------
INSERT INTO `traffic_yys` VALUES ('1', '移动');
INSERT INTO `traffic_yys` VALUES ('2', '联通');
INSERT INTO `traffic_yys` VALUES ('3', '电信');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `created_date` datetime DEFAULT NULL COMMENT '创建日期',
  `modified_date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(63) DEFAULT NULL COMMENT '邮箱',
  `nickname` varchar(31) DEFAULT NULL COMMENT '用户名',
  `sex` tinyint(1) DEFAULT NULL,
  `password_hash` varchar(256) DEFAULT NULL COMMENT '密码（md5加密）',
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(15) DEFAULT NULL,
  `deposit` int(11) DEFAULT NULL,
  `tel` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `active` tinyint(1) DEFAULT NULL,
  `coins` int(11) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `week_credit` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `pwd_question_answer` int(11) DEFAULT NULL COMMENT '密保问题及答案',
  `email_is_check` tinyint(1) DEFAULT NULL COMMENT '邮箱是否已验证',
  `tel_is_bind` tinyint(1) DEFAULT NULL COMMENT '手机是否绑定',
  `is_trainer` int(11) DEFAULT NULL COMMENT '代练师认证id',
  `head_image` varchar(50) DEFAULT NULL COMMENT '头像',
  `ali_name` varchar(1024) DEFAULT NULL,
  `wx_name` varchar(1024) DEFAULT NULL,
  `cz_sum` float DEFAULT NULL COMMENT '充值金额',
  `sign_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2015-09-22 10:20:35', null, '72', '', 'haha', null, 'sha1:1000:Rqsux78w:5e7f590cad8365a3f2af6e06356e212c521f1ac2', '2016-02-29 09:26:15', '127.0.0.1', null, '18514253610', null, '37', '8976', null, null, '1', '0', '0', '0', '0', '568e35a53f942.png', null, null, '55500', '1');
INSERT INTO `user` VALUES ('2015-09-23 16:53:08', null, '74', '281113137@qq.com', 'xconly', null, 'sha1:1000:Dy0nqzg4:704dba322cfefabf6963fe58b72c58542500b534', '2016-02-03 16:27:56', '127.0.0.1', null, '', null, '0', '4990', null, null, '1', null, '1', '0', null, null, null, null, '5000', '1');
INSERT INTO `user` VALUES ('2015-10-09 11:45:17', null, '75', '281113137@qq.comd', '2233', null, 'sha1:1000:wUSxQMbU:048e6dfa8204bc67d9a5f3f6457af822cedbac5f', '2015-10-09 11:45:17', '127.0.0.1', null, '', null, '0', '0', null, null, '1', null, '0', '0', null, null, null, null, '1800', '0');
INSERT INTO `user` VALUES ('2016-01-07 14:17:03', null, '76', '281113137@qq.com1', 'xconly1', null, 'sha1:1000:gFmZMwBb:857cbb5da08c628abb7c8901d80e852654cd50c0', '2016-01-07 14:17:03', '127.0.0.1', null, '', null, '0', '10', null, null, '1', null, '0', '0', null, null, null, null, '0', '1');

-- ----------------------------
-- Table structure for vip_level
-- ----------------------------
DROP TABLE IF EXISTS `vip_level`;
CREATE TABLE `vip_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `end` int(11) DEFAULT NULL,
  `sign_score` int(11) DEFAULT NULL,
  `sign_grow_score` int(11) DEFAULT NULL,
  `grow_unit` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=503 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip_level
-- ----------------------------
INSERT INTO `vip_level` VALUES ('1', '青铜', '500', '2000', '2', null, null, '1');
INSERT INTO `vip_level` VALUES ('2', '黄金', '2000', '5000', '2', null, null, '2');
INSERT INTO `vip_level` VALUES ('3', '白金', '5000', '10000', '3', null, null, '3');
INSERT INTO `vip_level` VALUES ('4', '钻石', '10000', '50000', '4', null, null, '4');
INSERT INTO `vip_level` VALUES ('5', '王者', '50000', '1000000', '5', null, null, '5');
