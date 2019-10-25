-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- Server version:               5.7.17-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL 版本:                  10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for thinkadminvue
CREATE DATABASE IF NOT EXISTS `thinkadminvue` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `thinkadminvue`;

-- Dumping structure for table thinkadminvue.m_access_logs
DROP TABLE IF EXISTS `m_access_logs`;
CREATE TABLE IF NOT EXISTS `m_access_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(32) DEFAULT NULL,
  `area` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `region` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `isp` varchar(16) DEFAULT NULL,
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_access_logs: ~106 rows (approximately)
/*!40000 ALTER TABLE `m_access_logs` DISABLE KEYS */;
INSERT INTO `m_access_logs` (`id`, `ip`, `area`, `country`, `region`, `city`, `isp`, `create_at`) VALUES
	(1, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533539406),
	(2, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533539517),
	(3, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533540472),
	(4, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533540532),
	(5, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541000),
	(6, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541071),
	(7, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541193),
	(8, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541325),
	(9, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541403),
	(10, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541575),
	(11, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541601),
	(12, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533544764),
	(13, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533547459),
	(14, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533547586),
	(15, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533547634),
	(16, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533547840),
	(17, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533547892),
	(18, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533547991),
	(19, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533548018),
	(20, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533548057),
	(21, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533548090),
	(22, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533549630),
	(23, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533549645),
	(24, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533549951),
	(25, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1536803816),
	(26, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1536818396),
	(27, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1536820769),
	(28, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1536821043),
	(29, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1536821657),
	(30, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1536822747),
	(31, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568701373),
	(32, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568702964),
	(33, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568703225),
	(34, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568703915),
	(35, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568771888),
	(36, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568776191),
	(37, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568776218),
	(38, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568777059),
	(39, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568777575),
	(40, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568778050),
	(41, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568785763),
	(42, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568786622),
	(43, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568793673),
	(44, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568794955),
	(45, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568794987),
	(46, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568795178),
	(47, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568795382),
	(48, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568795444),
	(49, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568795553),
	(50, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568795613),
	(51, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568801825),
	(52, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568858445),
	(53, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568858550),
	(54, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568863659),
	(55, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568879376),
	(56, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568975668),
	(57, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1568977792),
	(58, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569205575),
	(59, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569206681),
	(60, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569220381),
	(61, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569220674),
	(62, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569231296),
	(63, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569232902),
	(64, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569234155),
	(65, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569234212),
	(66, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569291558),
	(67, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569305218),
	(68, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569322842),
	(69, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569392814),
	(70, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569553897),
	(71, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569554091),
	(72, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569554618),
	(73, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569565461),
	(74, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569565649),
	(75, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569569666),
	(76, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569572435),
	(77, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569573035),
	(78, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569573409),
	(79, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569575061),
	(80, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569576291),
	(81, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569739191),
	(82, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569808673),
	(83, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569809697),
	(84, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569809730),
	(85, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569810762),
	(86, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569810872),
	(87, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569811005),
	(88, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569811172),
	(89, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569811504),
	(90, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1569811771),
	(91, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1570584812),
	(92, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1570584816),
	(93, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1570670800),
	(94, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1570689359),
	(95, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1570701979),
	(96, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1570758991),
	(97, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1570773504),
	(98, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1570783685),
	(99, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1570844442),
	(100, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1570859683),
	(101, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571038516),
	(102, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571038803),
	(103, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571192047),
	(104, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571192156),
	(105, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571206112),
	(106, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571283198),
	(107, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571292680),
	(108, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571302132),
	(109, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571369146),
	(110, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571379288),
	(111, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571389918),
	(112, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571622699),
	(113, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571637806),
	(114, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571727753),
	(115, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571795155),
	(116, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571810431),
	(117, '127.0.0.1', NULL, '本机地址', '本机地址', '', '', 1571822607);
/*!40000 ALTER TABLE `m_access_logs` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_admin_user
DROP TABLE IF EXISTS `m_admin_user`;
CREATE TABLE IF NOT EXISTS `m_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `create_at` int(10) DEFAULT NULL,
  `r_id` tinyint(3) DEFAULT NULL,
  `d_id` tinyint(3) DEFAULT '0' COMMENT '部门id',
  `p_id` tinyint(3) DEFAULT '0' COMMENT '岗位',
  `last_login_at` int(10) DEFAULT '0' COMMENT '上次登录时间',
  `last_logout_at` int(10) DEFAULT NULL COMMENT '上次退出时间',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像路径',
  `status` tinyint(1) DEFAULT '1' COMMENT '当前状态0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_admin_user: ~5 rows (approximately)
/*!40000 ALTER TABLE `m_admin_user` DISABLE KEYS */;
INSERT INTO `m_admin_user` (`id`, `nickname`, `username`, `password`, `create_at`, `r_id`, `d_id`, `p_id`, `last_login_at`, `last_logout_at`, `avatar`, `status`) VALUES
	(1, '管理员', 'admin', 'c7122a1349c22cb3c009da3613d242ab', NULL, NULL, NULL, NULL, 1571822607, 1571038625, '/uploads/20190920/465d0fa7de525c7b6d7d3749d41738a9.jpg', 1),
	(2, '测试', 'dev', 'c9a973c677899e92518c823c31527716', NULL, 1, 5, 6, 1568701373, 1568702847, NULL, 1),
	(3, 'test', 'test', 'f2e52e3efb6647bc3aceb89349568b88', NULL, 2, 6, 9, 1533549645, 1533549944, NULL, 1),
	(4, '231', '321', '91f544db40265dbe9eb4a4580634ba55', NULL, 2, 5, 7, 0, NULL, NULL, 1),
	(5, 'jade', 'jade', 'd3a03f001428755d35b80572bc67d7d2', NULL, 1, 1, 11, 1568771888, 1568776182, NULL, 1);
/*!40000 ALTER TABLE `m_admin_user` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_attribute
DROP TABLE IF EXISTS `m_attribute`;
CREATE TABLE IF NOT EXISTS `m_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属商品类型',
  `attr_name` varchar(60) NOT NULL DEFAULT '' COMMENT '属性名称',
  `attr_cat_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '分类筛选样式，0普通，1颜色',
  `attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '该属性值的录入方式，0手工录入，1从列表选择',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '属性是否可选，0唯一属性，1单选属性，2复选属性',
  `attr_values` text NOT NULL COMMENT '可选值列表',
  `color_values` text,
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '能否进行检索，0不需要检索，1关键字检索，2范围检索',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_linked` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '相同属性值的商品是否关联，0否，1是',
  `attr_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `attr_input_category` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_attribute: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_attribute` DISABLE KEYS */;
INSERT INTO `m_attribute` (`attr_id`, `cat_id`, `attr_name`, `attr_cat_type`, `attr_input_type`, `attr_type`, `attr_values`, `color_values`, `attr_index`, `sort_order`, `is_linked`, `attr_group`, `attr_input_category`) VALUES
	(1, 1, '颜色', 1, 0, 0, '', NULL, 0, 0, 0, 0, NULL),
	(2, 1, '尺码', 0, 1, 1, 'M\nX\nXL\n2XL\n3XL\n4XL', NULL, 0, 0, 0, 0, NULL);
/*!40000 ALTER TABLE `m_attribute` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_category
DROP TABLE IF EXISTS `m_category`;
CREATE TABLE IF NOT EXISTS `m_category` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(90) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(8) unsigned NOT NULL DEFAULT '50',
  `template_file` varchar(50) NOT NULL DEFAULT '',
  `measure_unit` varchar(15) NOT NULL DEFAULT '',
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `style` varchar(150) NOT NULL DEFAULT ' ',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `grade` tinyint(4) NOT NULL DEFAULT '0',
  `filter_attr` varchar(255) NOT NULL DEFAULT '0',
  `is_top_style` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `top_style_tpl` varchar(255) NOT NULL DEFAULT ' ',
  `style_icon` varchar(50) NOT NULL DEFAULT 'other',
  `cat_icon` varchar(255) NOT NULL DEFAULT ' ',
  `is_top_show` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `category_links` text,
  `category_topic` text,
  `pinyin_keyword` text,
  `cat_alias_name` varchar(90) NOT NULL DEFAULT ' ',
  `commission_rate` smallint(5) unsigned NOT NULL DEFAULT '0',
  `touch_icon` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`cat_id`),
  KEY `parent_id` (`parent_id`),
  KEY `is_show` (`is_show`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_category: ~3 rows (approximately)
/*!40000 ALTER TABLE `m_category` DISABLE KEYS */;
INSERT INTO `m_category` (`cat_id`, `cat_name`, `keywords`, `cat_desc`, `parent_id`, `sort_order`, `template_file`, `measure_unit`, `show_in_nav`, `style`, `is_show`, `grade`, `filter_attr`, `is_top_style`, `top_style_tpl`, `style_icon`, `cat_icon`, `is_top_show`, `category_links`, `category_topic`, `pinyin_keyword`, `cat_alias_name`, `commission_rate`, `touch_icon`) VALUES
	(1, '分类一', '分类一', '分类一', 0, 0, '', '', 0, ' ', 1, 0, '0', 0, ' ', 'other', ' ', 0, NULL, NULL, NULL, '分类一', 0, ' '),
	(3, '分类二', '分类二', '分类二', 0, 0, '', '', 0, ' ', 1, 0, '0', 0, ' ', 'other', ' ', 0, NULL, NULL, NULL, '分类二', 0, '/uploads/20190918//964da693c8dbb57499f1a77e47017b97.png'),
	(4, 'test', 'test', 'test', 1, 0, '', '', 0, ' ', 0, 0, '0', 0, ' ', 'other', ' ', 0, NULL, NULL, NULL, 'test', 0, '');
/*!40000 ALTER TABLE `m_category` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_department
DROP TABLE IF EXISTS `m_department`;
CREATE TABLE IF NOT EXISTS `m_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '',
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- Dumping data for table thinkadminvue.m_department: ~8 rows (approximately)
/*!40000 ALTER TABLE `m_department` DISABLE KEYS */;
INSERT INTO `m_department` (`id`, `name`, `remark`, `status`) VALUES
	(1, '总经办1', '321', 1),
	(2, '财务部', NULL, 1),
	(3, '研发部', NULL, 1),
	(4, '设计部', NULL, 1),
	(5, '市场部', NULL, 1),
	(6, '测试部', NULL, 1),
	(7, '项目部', NULL, 1),
	(8, '321', '11', 1);
/*!40000 ALTER TABLE `m_department` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_files
DROP TABLE IF EXISTS `m_files`;
CREATE TABLE IF NOT EXISTS `m_files` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `u_id` int(10) DEFAULT '0',
  `ext` varchar(16) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `create_at` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_files: ~13 rows (approximately)
/*!40000 ALTER TABLE `m_files` DISABLE KEYS */;
INSERT INTO `m_files` (`id`, `name`, `hash`, `path`, `u_id`, `ext`, `type`, `create_at`) VALUES
	(1, '465d0fa7de525c7b6d7d3749d41738a9.jpg', 'd19f0ca99147f66a2b77257fa5cc8e94ccc67d90', 'uploads/20190920/', 1, 'jpg', 'avatar', 1568977549),
	(2, 'e11d704589588b542a57e399ec8d02f2.jpg', 'aaa73e7a721d03852a1fa3bbf0920281bc1d00dc', 'uploads/20190920/', 1, 'jpg', 'avatar', 1568977840),
	(3, '5b924cc8a5a0a7dc00dc180745eedaa3.jpg', '1b35561979aa4d4010c6a32dbc8049038124e524', 'uploads/20191016/', 1, 'jpg', 'goods_img', 1571206319),
	(4, '689c5d1789ca725f1d7afbadc3923c9b.png', '7563449b0700198139dd0eadcd109cb625c321a5', 'uploads/20191016/', 1, 'png', 'goods_img', 1571206404),
	(5, 'fd33a0ecf8901cb070a035f7dfcd22be.png', '71d7fa6f90b26e07ff5b04a9f16c998b1a75c6be', 'uploads/20191016/', 1, 'png', 'goods_img', 1571206411),
	(6, 'b09da61fc7174d17011d95875554f9a2.jpg', '7b2d7ec9198935720ba3dbf0e9036b95f59e235e', 'uploads/20191016/', 1, 'jpg', 'goods_img', 1571208402),
	(7, 'a05edc2eb917172fb8d67b13f4f1eb10.jpg', 'fdaa275e7c8f18bc46c1c133a0b453eece8e863f', 'uploads/20191016/', 1, 'jpg', 'goods_img', 1571208433),
	(8, '4385033968c7b110c0fa9de856d9f5a4.jpg', 'adf6aab2057bc775b1a321ba02e7804a86086251', 'uploads/20191016/', 1, 'jpg', 'goods_img', 1571208451),
	(9, '259e1b600da764dbdd10538233422f72.jpg', '24adeafbe695a225f529eae378dab27063b50a0a', 'uploads/20191016/', 1, 'jpg', 'goods_img', 1571208598),
	(10, '0e557695c9a0c421413d3aa1b9642efb.png', 'b4cd7484021279a5b61991da69ca5dbb873bac29', 'uploads/20191016/', 1, 'png', 'goods_img', 1571209075),
	(11, 'ec87baa7c73bb627e75e549fe7f4f48c.jpg', 'c1050a5dff8878964c6ee09793184d00339560ad', 'uploads/20191017/', 1, 'jpg', 'goods_img', 1571283858),
	(12, '946a826d1a05c5044ac23de39a4c1b80.jpg', '6b6a78c3b9b04566a8ea2459e1f57e51d6672704', 'uploads/20191023/', 1, 'jpg', 'goods_img', 1571814863),
	(13, '6f8f988d3d8d73f1b4bd83968b1ad1e3.jpg', '693cbe81b4b47ab109df912e57baf3523a39713c', 'uploads/20191023/', 1, 'jpg', 'goods_img', 1571814872);
/*!40000 ALTER TABLE `m_files` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods
DROP TABLE IF EXISTS `m_goods`;
CREATE TABLE IF NOT EXISTS `m_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类',
  `user_cat` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL,
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `bar_code` varchar(60) NOT NULL COMMENT '条码',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_name_style` varchar(60) NOT NULL DEFAULT '+',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `provider_name` varchar(100) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '商品重量',
  `default_shipping` int(11) unsigned NOT NULL DEFAULT '0',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '本店售价',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '促销价',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '促销开始时间',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '促销结束时间',
  `warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '库存预警值',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `goods_brief` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简单描述',
  `goods_desc` text COMMENT '电脑端商品详细描述',
  `desc_mobile` text COMMENT '手机端商品详细描述',
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `original_img` varchar(255) NOT NULL DEFAULT '',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否上架',
  `is_alone_sale` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '能作为普通商品销售',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为免运费商品',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分购买金额',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '加入推荐精品',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '加入推荐新品',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '加入推荐热销',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否促销',
  `is_volume` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '阶梯价格',
  `is_fullcut` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '满减价格',
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '属性类型',
  `seller_note` varchar(255) DEFAULT NULL COMMENT '商家备注',
  `give_integral` int(11) NOT NULL DEFAULT '-1' COMMENT '赠送消费积分数',
  `rank_integral` int(11) NOT NULL DEFAULT '-1' COMMENT '赠送等级积分数',
  `suppliers_id` smallint(5) unsigned DEFAULT NULL,
  `is_check` tinyint(1) unsigned DEFAULT '0',
  `store_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '店铺推荐热销',
  `store_new` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '店铺推荐新品',
  `store_best` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '店铺推荐精品',
  `group_number` smallint(8) unsigned NOT NULL DEFAULT '0',
  `is_xiangou` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限购',
  `xiangou_start_date` int(11) NOT NULL DEFAULT '0' COMMENT '限购开始时间',
  `xiangou_end_date` int(11) NOT NULL DEFAULT '0' COMMENT '限购结束时间',
  `xiangou_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '限购设定数量',
  `review_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `review_content` varchar(255) DEFAULT NULL,
  `goods_shipai` text,
  `comments_number` int(10) unsigned NOT NULL DEFAULT '0',
  `sales_volume` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_num` int(10) unsigned NOT NULL DEFAULT '0',
  `model_price` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `model_inventory` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `model_attr` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `largest_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `pinyin_keyword` text COMMENT '关键字拼音',
  `goods_product_tag` varchar(2000) DEFAULT NULL COMMENT '评论标签',
  `goods_tag` varchar(255) DEFAULT NULL COMMENT '服务承诺标签',
  `stages` varchar(512) DEFAULT NULL,
  `stages_rate` decimal(10,2) NOT NULL DEFAULT '0.50',
  `freight` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商品运费',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `dis_commission` decimal(10,0) DEFAULT NULL COMMENT '分销佣金百分比',
  `is_distribution` int(1) NOT NULL DEFAULT '0' COMMENT '商品是否参与分销',
  `goods_unit` varchar(15) NOT NULL DEFAULT '个' COMMENT '商品单位',
  `goods_cause` varchar(10) NOT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`),
  KEY `sales_volume` (`sales_volume`),
  KEY `xiangou_start_date` (`xiangou_start_date`),
  KEY `xiangou_end_date` (`xiangou_end_date`),
  KEY `user_id` (`user_id`),
  KEY `is_on_sale` (`is_on_sale`),
  KEY `is_alone_sale` (`is_alone_sale`),
  KEY `is_delete` (`is_delete`),
  KEY `user_cat` (`user_cat`),
  KEY `freight` (`freight`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods: ~1 rows (approximately)
/*!40000 ALTER TABLE `m_goods` DISABLE KEYS */;
INSERT INTO `m_goods` (`goods_id`, `cat_id`, `user_cat`, `user_id`, `goods_sn`, `bar_code`, `goods_name`, `goods_name_style`, `click_count`, `brand_id`, `provider_name`, `goods_number`, `goods_weight`, `default_shipping`, `market_price`, `cost_price`, `shop_price`, `promote_price`, `promote_start_date`, `promote_end_date`, `warn_number`, `keywords`, `goods_brief`, `goods_desc`, `desc_mobile`, `goods_thumb`, `goods_img`, `original_img`, `is_real`, `extension_code`, `is_on_sale`, `is_alone_sale`, `is_shipping`, `integral`, `add_time`, `sort_order`, `is_delete`, `is_best`, `is_new`, `is_hot`, `is_promote`, `is_volume`, `is_fullcut`, `bonus_type_id`, `last_update`, `goods_type`, `seller_note`, `give_integral`, `rank_integral`, `suppliers_id`, `is_check`, `store_hot`, `store_new`, `store_best`, `group_number`, `is_xiangou`, `xiangou_start_date`, `xiangou_end_date`, `xiangou_num`, `review_status`, `review_content`, `goods_shipai`, `comments_number`, `sales_volume`, `comment_num`, `model_price`, `model_inventory`, `model_attr`, `largest_amount`, `pinyin_keyword`, `goods_product_tag`, `goods_tag`, `stages`, `stages_rate`, `freight`, `shipping_fee`, `tid`, `dis_commission`, `is_distribution`, `goods_unit`, `goods_cause`) VALUES
	(1, 1, 0, 0, 'G000001', '', '测试商品', '+', 0, 0, '', 100, 0.000, 0, 15.00, 8.00, 10.00, 0.00, 0, 0, 10, '', '测试商品', '测试商品', NULL, '/uploads/20191017//ec87baa7c73bb627e75e549fe7f4f48c.jpg', '/uploads/20191017//ec87baa7c73bb627e75e549fe7f4f48c.jpg', '/uploads/20191017//ec87baa7c73bb627e75e549fe7f4f48c.jpg', 1, '', 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, NULL, -1, -1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, NULL, NULL, 0, 0, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, 0.50, 0, 0.00, 0, NULL, 0, '个', '1,2');
/*!40000 ALTER TABLE `m_goods` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_activity
DROP TABLE IF EXISTS `m_goods_activity`;
CREATE TABLE IF NOT EXISTS `m_goods_activity` (
  `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `act_desc` text NOT NULL,
  `activity_thumb` varchar(255) NOT NULL,
  `act_promise` text NOT NULL,
  `act_ensure` text NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `is_finished` tinyint(3) unsigned NOT NULL,
  `ext_info` text NOT NULL,
  `is_hot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `review_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `review_content` varchar(1000) NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`act_id`),
  KEY `act_name` (`act_name`,`act_type`,`goods_id`),
  KEY `user_id` (`user_id`),
  KEY `is_hot` (`is_hot`),
  KEY `review_status` (`review_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_activity: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_activity` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_article
DROP TABLE IF EXISTS `m_goods_article`;
CREATE TABLE IF NOT EXISTS `m_goods_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `article_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`,`article_id`,`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_article: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_article` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_attr
DROP TABLE IF EXISTS `m_goods_attr`;
CREATE TABLE IF NOT EXISTS `m_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attr_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attr_value` text NOT NULL,
  `color_value` text,
  `attr_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `attr_sort` int(10) unsigned NOT NULL,
  `attr_img_file` varchar(255) NOT NULL DEFAULT ' ' COMMENT '属性图片',
  `attr_gallery_file` varchar(255) NOT NULL DEFAULT ' ' COMMENT '相册图片',
  `attr_img_site` varchar(255) NOT NULL DEFAULT ' ',
  `attr_checked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `attr_value1` text,
  `lang_flag` int(2) DEFAULT '0',
  `attr_img` varchar(255) DEFAULT NULL,
  `attr_thumb` varchar(255) DEFAULT NULL,
  `img_flag` int(2) DEFAULT '0',
  `attr_pid` varchar(60) DEFAULT NULL,
  `admin_id` smallint(8) unsigned NOT NULL,
  PRIMARY KEY (`goods_attr_id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_attr: ~4 rows (approximately)
/*!40000 ALTER TABLE `m_goods_attr` DISABLE KEYS */;
INSERT INTO `m_goods_attr` (`goods_attr_id`, `goods_id`, `attr_id`, `attr_value`, `color_value`, `attr_price`, `attr_sort`, `attr_img_file`, `attr_gallery_file`, `attr_img_site`, `attr_checked`, `attr_value1`, `lang_flag`, `attr_img`, `attr_thumb`, `img_flag`, `attr_pid`, `admin_id`) VALUES
	(1, 1, 2, 'M', NULL, 0.00, 1, '/uploads/20191016//b09da61fc7174d17011d95875554f9a2.jpg', ' ', ' ', 0, NULL, 0, NULL, NULL, 0, NULL, 1),
	(2, 1, 2, 'X', NULL, 0.00, 2, '/uploads/20191016//259e1b600da764dbdd10538233422f72.jpg', ' ', ' ', 0, NULL, 0, NULL, NULL, 0, NULL, 1),
	(3, 1, 1, '#D9D2E9', NULL, 0.00, 3, ' ', ' ', ' ', 0, NULL, 0, NULL, NULL, 0, NULL, 1),
	(4, 1, 1, '#CFE2F3', NULL, 0.00, 4, ' ', ' ', ' ', 0, NULL, 0, NULL, NULL, 0, NULL, 1);
/*!40000 ALTER TABLE `m_goods_attr` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_cat
DROP TABLE IF EXISTS `m_goods_cat`;
CREATE TABLE IF NOT EXISTS `m_goods_cat` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`cat_id`),
  KEY `goods_id` (`goods_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_cat: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_cat` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_change_log
DROP TABLE IF EXISTS `m_goods_change_log`;
CREATE TABLE IF NOT EXISTS `m_goods_change_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增日志ID',
  `goods_id` mediumint(8) NOT NULL COMMENT '商品ID',
  `shop_price` decimal(10,2) NOT NULL COMMENT '本店价',
  `shipping_fee` decimal(10,2) NOT NULL COMMENT '运费',
  `promote_price` decimal(10,2) NOT NULL COMMENT '促销价',
  `member_price` varchar(255) NOT NULL COMMENT '会员价',
  `volume_price` varchar(255) NOT NULL COMMENT '阶梯价',
  `give_integral` int(11) NOT NULL COMMENT '赠送消费积分',
  `rank_integral` int(11) NOT NULL COMMENT '赠送等级积分',
  `goods_weight` decimal(10,3) NOT NULL COMMENT '商品重量',
  `is_on_sale` tinyint(1) NOT NULL COMMENT '上下架',
  `user_id` int(11) NOT NULL COMMENT '操作者ID',
  `handle_time` int(11) NOT NULL COMMENT '操作时间',
  `old_record` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '原纪录',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_change_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_change_log` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_conshipping
DROP TABLE IF EXISTS `m_goods_conshipping`;
CREATE TABLE IF NOT EXISTS `m_goods_conshipping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sfull` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `sreduce` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_conshipping: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_conshipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_conshipping` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_consumption
DROP TABLE IF EXISTS `m_goods_consumption`;
CREATE TABLE IF NOT EXISTS `m_goods_consumption` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfull` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `creduce` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_consumption: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_consumption` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_consumption` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_extend
DROP TABLE IF EXISTS `m_goods_extend`;
CREATE TABLE IF NOT EXISTS `m_goods_extend` (
  `extend_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `is_reality` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是正品0否1是',
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持包退服务0否1是',
  `is_fast` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否闪速送货0否1是',
  `width` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  `depth` varchar(50) NOT NULL,
  `origincountry` varchar(50) NOT NULL,
  `originplace` varchar(50) NOT NULL,
  `assemblycountry` varchar(50) NOT NULL,
  `barcodetype` varchar(50) NOT NULL,
  `catena` varchar(50) NOT NULL,
  `isbasicunit` varchar(50) NOT NULL,
  `packagetype` varchar(50) NOT NULL,
  `grossweight` varchar(50) NOT NULL,
  `netweight` varchar(50) NOT NULL,
  `netcontent` varchar(50) NOT NULL,
  `licensenum` varchar(50) NOT NULL,
  `healthpermitnum` varchar(50) NOT NULL,
  PRIMARY KEY (`extend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_extend: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_extend` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_gallery
DROP TABLE IF EXISTS `m_goods_gallery`;
CREATE TABLE IF NOT EXISTS `m_goods_gallery` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `img_url` varchar(255) NOT NULL DEFAULT '',
  `img_desc` smallint(4) NOT NULL DEFAULT '100',
  `thumb_url` varchar(255) NOT NULL DEFAULT '',
  `img_original` varchar(255) NOT NULL DEFAULT '',
  `single_id` mediumint(8) DEFAULT '0',
  `external_url` varchar(255) NOT NULL,
  `front_cover` tinyint(2) DEFAULT NULL,
  `dis_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_gallery: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_gallery` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_inventory_logs
DROP TABLE IF EXISTS `m_goods_inventory_logs`;
CREATE TABLE IF NOT EXISTS `m_goods_inventory_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) NOT NULL DEFAULT '0',
  `order_id` int(10) NOT NULL DEFAULT '0',
  `use_storage` tinyint(1) NOT NULL DEFAULT '0',
  `admin_id` int(10) NOT NULL DEFAULT '0',
  `number` varchar(160) NOT NULL,
  `model_inventory` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `model_attr` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `warehouse_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `area_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `order_id` (`order_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_inventory_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_inventory_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_inventory_logs` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_report
DROP TABLE IF EXISTS `m_goods_report`;
CREATE TABLE IF NOT EXISTS `m_goods_report` (
  `report_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL,
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL,
  `goods_image` varchar(255) NOT NULL,
  `title_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `inform_content` text NOT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `report_state` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `handle_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `handle_message` text NOT NULL,
  `handle_time` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_report: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_report` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_report_img
DROP TABLE IF EXISTS `m_goods_report_img`;
CREATE TABLE IF NOT EXISTS `m_goods_report_img` (
  `img_id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `report_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `img_file` varchar(255) NOT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_report_img: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_report_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_report_img` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_report_title
DROP TABLE IF EXISTS `m_goods_report_title`;
CREATE TABLE IF NOT EXISTS `m_goods_report_title` (
  `title_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title_name` varchar(60) NOT NULL,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_report_title: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_report_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_report_title` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_report_type
DROP TABLE IF EXISTS `m_goods_report_type`;
CREATE TABLE IF NOT EXISTS `m_goods_report_type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(60) NOT NULL,
  `type_desc` text NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_report_type: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_report_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_report_type` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_transport
DROP TABLE IF EXISTS `m_goods_transport`;
CREATE TABLE IF NOT EXISTS `m_goods_transport` (
  `tid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ru_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `freight_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL,
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `ru_id` (`ru_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_transport: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_transport` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_transport` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_transport_express
DROP TABLE IF EXISTS `m_goods_transport_express`;
CREATE TABLE IF NOT EXISTS `m_goods_transport_express` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ru_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_id` text NOT NULL,
  `shipping_fee` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `ru_id` (`ru_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_transport_express: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_transport_express` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_transport_express` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_transport_extend
DROP TABLE IF EXISTS `m_goods_transport_extend`;
CREATE TABLE IF NOT EXISTS `m_goods_transport_extend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ru_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area_id` text NOT NULL,
  `top_area_id` text NOT NULL,
  `sprice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `ru_id` (`ru_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_transport_extend: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_transport_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_transport_extend` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_transport_tpl
DROP TABLE IF EXISTS `m_goods_transport_tpl`;
CREATE TABLE IF NOT EXISTS `m_goods_transport_tpl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `shipping_id` int(11) NOT NULL DEFAULT '0',
  `region_id` varchar(255) NOT NULL,
  `configure` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_transport_tpl: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_transport_tpl` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_goods_transport_tpl` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_goods_type
DROP TABLE IF EXISTS `m_goods_type`;
CREATE TABLE IF NOT EXISTS `m_goods_type` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `cat_name` varchar(60) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_group` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_goods_type: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_goods_type` DISABLE KEYS */;
INSERT INTO `m_goods_type` (`cat_id`, `user_id`, `cat_name`, `enabled`, `attr_group`) VALUES
	(1, 0, '服装', 1, ' '),
	(2, 0, '鞋子', 1, '');
/*!40000 ALTER TABLE `m_goods_type` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_group_goods
DROP TABLE IF EXISTS `m_group_goods`;
CREATE TABLE IF NOT EXISTS `m_group_goods` (
  `id` smallint(8) NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配件分组',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `goods_id` (`goods_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table thinkadminvue.m_group_goods: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_group_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_group_goods` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_menu
DROP TABLE IF EXISTS `m_menu`;
CREATE TABLE IF NOT EXISTS `m_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT '0',
  `name` varchar(64) DEFAULT NULL COMMENT '路由中可跳转name，请保持唯一值',
  `title` varchar(64) DEFAULT NULL COMMENT '显示名称',
  `icon` varchar(64) DEFAULT NULL COMMENT '显示icon class，一级菜单有效',
  `component` varchar(255) DEFAULT NULL COMMENT '引入的vue在前端代码中的位置',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `redirect` varchar(255) DEFAULT '' COMMENT '面包屑点击跳转路径   弃用',
  `hidden` tinyint(1) DEFAULT '0' COMMENT '是否在左侧隐藏',
  `sort` tinyint(2) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `op` varchar(64) DEFAULT NULL COMMENT '后台判断权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- Dumping data for table thinkadminvue.m_menu: ~28 rows (approximately)
/*!40000 ALTER TABLE `m_menu` DISABLE KEYS */;
INSERT INTO `m_menu` (`id`, `pid`, `name`, `title`, `icon`, `component`, `path`, `redirect`, `hidden`, `sort`, `status`, `op`) VALUES
	(2, 0, 'system', '系统管理', 'el-icon-setting', 'home', '/system', '', 0, 1, 1, NULL),
	(3, 2, 'department', '部门管理', '', 'department', 'department/index', '', 0, 0, 1, 'admin-Department-index'),
	(4, 2, 'position', '岗位管理', '', 'position', 'position/index', '', 0, 1, 1, 'admin-Position-index'),
	(5, 2, 'user', '用户管理', '', 'user', 'user/index', '', 0, 2, 1, 'admin-AdminUser-index'),
	(6, 2, 'menu', '菜单管理', '', 'menu', 'menu/index', '', 0, 0, 1, 'admin-Menu-index'),
	(7, 2, 'rule', '权限管理', '', 'rule', 'rule/index', '', 0, 1, 1, 'admin-Rule-index'),
	(8, 2, 'add', '部门增加', NULL, NULL, NULL, '', 1, 0, 1, NULL),
	(9, 2, 'edit', '部门编辑', NULL, NULL, NULL, '', 1, 0, 1, NULL),
	(10, 2, 'add', '岗位增加', NULL, NULL, NULL, '', 1, 0, 1, NULL),
	(11, 2, 'edit', '岗位编辑', NULL, NULL, NULL, '', 1, 0, 1, NULL),
	(12, 2, 'add', '用户增加', NULL, NULL, NULL, '', 1, 0, 1, NULL),
	(13, 2, 'edit', '用户编辑', NULL, NULL, NULL, '', 1, 0, 1, NULL),
	(14, 2, 'add', '菜单增加', NULL, NULL, NULL, '', 1, 0, 1, NULL),
	(15, 2, 'edit', '菜单编辑', NULL, NULL, NULL, '', 1, 0, 1, NULL),
	(16, 2, 'add', '权限增加', NULL, NULL, NULL, '', 1, 0, 1, NULL),
	(17, 2, 'edit', '权限编辑', NULL, NULL, NULL, '', 1, 0, 1, NULL),
	(18, 0, 'shop', '商城管理', 'el-icon-s-goods', 'category', '/shop', '', 0, 2, 1, NULL),
	(19, 18, 'category', '商品分类管理', '', 'category', 'category/index', '', 0, 0, 1, NULL),
	(20, 18, 'add', '商品分类增加', '', 'category', 'category/add', '', 1, 0, 1, NULL),
	(21, 18, 'edit', '商品分类编辑', '', 'category', 'category/edit', '', 1, 0, 1, NULL),
	(22, 18, 'good', '商品管理', '', 'good', 'good/index', '', 0, 0, 1, NULL),
	(23, 18, 'goodAdd', '商品添加', '', 'goodAdd', 'good/add', '', 1, 0, 1, NULL),
	(24, 18, 'goodType', '商品类型管理', '', 'goodType', 'type/index', '', 0, 0, 1, NULL),
	(25, 18, 'typeAdd', '商品类型增加', '', 'goodType', 'type/add', '', 1, 0, 1, NULL),
	(26, 18, 'typeEdit', '商品类型编辑', '', 'goodType', 'type/edit', '', 1, 0, 1, NULL),
	(27, 18, 'goodEdit', '商品编辑', '', 'goodAdd', 'good/add', '', 1, 0, 1, NULL),
	(28, 18, 'attribute', '商品类型属性管理', '', 'attribute', 'attr/index', '', 0, 0, 1, NULL),
	(29, 18, 'attrAdd', '商品类型属性添加', '', 'attrEdit', 'attr/edit', '', 1, 0, 1, NULL),
	(30, 18, 'attrEdit', '商品类型属性编辑', '', 'attrEdit', 'attr/edit', '', 1, 0, 1, NULL);
/*!40000 ALTER TABLE `m_menu` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_position
DROP TABLE IF EXISTS `m_position`;
CREATE TABLE IF NOT EXISTS `m_position` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '岗位备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态1启用,0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- Dumping data for table thinkadminvue.m_position: ~11 rows (approximately)
/*!40000 ALTER TABLE `m_position` DISABLE KEYS */;
INSERT INTO `m_position` (`id`, `name`, `remark`, `status`) VALUES
	(1, '后端开发工程师', '1122223111', 1),
	(2, '前端开发工程师', '擦擦', 1),
	(3, '设计师', '231', 1),
	(4, '文案策划', NULL, 1),
	(5, '产品助理', NULL, 1),
	(6, '总经理', NULL, 1),
	(7, '项目经理', NULL, 1),
	(8, '项目助理', NULL, 1),
	(9, '测试工程师', NULL, 1),
	(10, '人事经理', NULL, 1),
	(11, 'CEO', NULL, 1);
/*!40000 ALTER TABLE `m_position` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_products
DROP TABLE IF EXISTS `m_products`;
CREATE TABLE IF NOT EXISTS `m_products` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_attr` varchar(50) DEFAULT NULL COMMENT 'goods_attr表中goods_attr_id值，多个用|隔开',
  `product_sn` varchar(60) DEFAULT NULL COMMENT '商品货号',
  `bar_code` varchar(60) NOT NULL COMMENT '商品条形码',
  `product_number` smallint(5) unsigned DEFAULT '0' COMMENT '商品库存',
  `product_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '本店价格',
  `product_market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价格',
  `product_warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '预警值',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `goods_id` (`goods_id`),
  KEY `product_sn` (`product_sn`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品属性规格';

-- Dumping data for table thinkadminvue.m_products: ~4 rows (approximately)
/*!40000 ALTER TABLE `m_products` DISABLE KEYS */;
INSERT INTO `m_products` (`product_id`, `goods_id`, `goods_attr`, `product_sn`, `bar_code`, `product_number`, `product_price`, `product_market_price`, `product_warn_number`, `admin_id`) VALUES
	(1, 1, '1|3', 'G000001_p1', '', 100, 10.00, 0.00, 10, 1),
	(2, 1, '1|4', 'G000001_p3', '', 100, 10.00, 0.00, 10, 1),
	(3, 1, '2|3', 'G000001_p4', '', 100, 10.00, 0.00, 10, 1),
	(4, 1, '2|4', 'G000001_p2', '', 100, 10.00, 0.00, 10, 1);
/*!40000 ALTER TABLE `m_products` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_rule
DROP TABLE IF EXISTS `m_rule`;
CREATE TABLE IF NOT EXISTS `m_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `rs` varchar(4000) DEFAULT NULL COMMENT '权限id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='权限组';

-- Dumping data for table thinkadminvue.m_rule: ~2 rows (approximately)
/*!40000 ALTER TABLE `m_rule` DISABLE KEYS */;
INSERT INTO `m_rule` (`id`, `name`, `rs`, `remark`, `status`) VALUES
	(1, '测试1', '1,5,4,10,2,11,12,13,6,7,8,9,3,14,15,16', '测试1', 1),
	(2, '测试2', '1,5,2,11,12,13,6,7,8,9', '', 1);
/*!40000 ALTER TABLE `m_rule` ENABLE KEYS */;

-- Dumping structure for table thinkadminvue.m_sys_config
DROP TABLE IF EXISTS `m_sys_config`;
CREATE TABLE IF NOT EXISTS `m_sys_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `logo` varchar(256) DEFAULT NULL,
  `session_valid` int(10) DEFAULT '0',
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- Dumping data for table thinkadminvue.m_sys_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_sys_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_sys_config` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
