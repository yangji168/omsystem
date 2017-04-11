/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.214
Source Server Version : 50630
Source Host           : 192.168.1.214:3306
Source Database       : omsystem

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2017-04-11 15:22:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_domain_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_domain_info`;
CREATE TABLE `sys_domain_info` (
  `domain_id` varchar(30) NOT NULL,
  `domain_name` varchar(300) NOT NULL,
  `domain_status_id` char(1) NOT NULL,
  `domain_create_date` datetime NOT NULL,
  `domain_owner` varchar(30) NOT NULL,
  `domain_maintance_date` datetime DEFAULT NULL,
  `domain_maintance_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`domain_id`),
  KEY `fk_sys_idx_05` (`domain_status_id`),
  CONSTRAINT `fk_sys_idx_05` FOREIGN KEY (`domain_status_id`) REFERENCES `sys_domain_status_attr` (`domain_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='域管理';

-- ----------------------------
-- Records of sys_domain_info
-- ----------------------------
INSERT INTO `sys_domain_info` VALUES ('vertex_root', '系统顶级域空间', '0', '2016-12-26 16:43:19', 'sys', '2017-03-13 19:44:37', 'admin');

-- ----------------------------
-- Table structure for `sys_domain_share_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_domain_share_info`;
CREATE TABLE `sys_domain_share_info` (
  `uuid` varchar(66) NOT NULL,
  `domain_id` varchar(30) NOT NULL,
  `target_domain_id` varchar(30) NOT NULL,
  `Authorization_level` char(1) NOT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `modify_date` date DEFAULT NULL,
  `modify_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `fk_sys_domain_share_info_01_idx` (`domain_id`),
  CONSTRAINT `fk_sys_domain_share_info_01` FOREIGN KEY (`domain_id`) REFERENCES `sys_domain_info` (`domain_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sys_domain_share_info_02` FOREIGN KEY (`domain_id`) REFERENCES `sys_domain_info` (`domain_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_domain_share_info
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_domain_status_attr`
-- ----------------------------
DROP TABLE IF EXISTS `sys_domain_status_attr`;
CREATE TABLE `sys_domain_status_attr` (
  `domain_status_id` char(1) NOT NULL,
  `domain_status_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`domain_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_domain_status_attr
-- ----------------------------
INSERT INTO `sys_domain_status_attr` VALUES ('0', '正常');
INSERT INTO `sys_domain_status_attr` VALUES ('1', '锁定');
INSERT INTO `sys_domain_status_attr` VALUES ('2', '失效');

-- ----------------------------
-- Table structure for `sys_handle_logs`
-- ----------------------------
DROP TABLE IF EXISTS `sys_handle_logs`;
CREATE TABLE `sys_handle_logs` (
  `uuid` varchar(60) NOT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `handle_time` datetime DEFAULT NULL,
  `client_ip` varchar(30) DEFAULT NULL,
  `status_code` varchar(10) DEFAULT NULL,
  `method` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `data` varchar(3000) DEFAULT NULL,
  `domain_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_handle_logs
-- ----------------------------
INSERT INTO `sys_handle_logs` VALUES ('67cd08c3-1e87-11e7-b57a-525400ec396c', 'admin', '2017-04-11 15:20:56', '192.168.1.112', '200', 'GET', '/HomePage', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('67e8c777-1e87-11e7-b57a-525400ec396c', 'admin', '2017-04-11 15:20:57', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=-1&TypeId=0&_=1491895255348', 'vertex_root');

-- ----------------------------
-- Table structure for `sys_index_page`
-- ----------------------------
DROP TABLE IF EXISTS `sys_index_page`;
CREATE TABLE `sys_index_page` (
  `theme_id` varchar(30) NOT NULL,
  `res_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_index_page
-- ----------------------------
INSERT INTO `sys_index_page` VALUES ('1001', './views/hauth/theme/default/index.tpl');
INSERT INTO `sys_index_page` VALUES ('1004', './views/hauth/theme/cyan/index.tpl');

-- ----------------------------
-- Table structure for `sys_org_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_org_info`;
CREATE TABLE `sys_org_info` (
  `org_unit_id` varchar(66) NOT NULL,
  `org_unit_desc` varchar(300) NOT NULL,
  `up_org_id` varchar(66) NOT NULL,
  `org_status_id` char(1) NOT NULL,
  `domain_id` varchar(30) NOT NULL,
  `create_date` date NOT NULL,
  `maintance_date` date NOT NULL,
  `create_user` varchar(30) NOT NULL,
  `maintance_user` varchar(30) NOT NULL,
  `code_number` varchar(66) NOT NULL,
  PRIMARY KEY (`org_unit_id`),
  KEY `FK_REFERENCE_15` (`org_status_id`),
  KEY `pk_sys_org_info_03_idx` (`domain_id`),
  CONSTRAINT `FK_REFERENCE_15` FOREIGN KEY (`org_status_id`) REFERENCES `sys_org_status_attr` (`org_status_id`),
  CONSTRAINT `fk_sys_org_info_01` FOREIGN KEY (`domain_id`) REFERENCES `sys_domain_info` (`domain_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_org_info
-- ----------------------------
INSERT INTO `sys_org_info` VALUES ('vertex_root_join_vertex_root', '终结者', 'root_vertex_system', '0', 'vertex_root', '2016-01-01', '2016-01-01', 'sys', 'sys', 'vertex_root');

-- ----------------------------
-- Table structure for `sys_org_status_attr`
-- ----------------------------
DROP TABLE IF EXISTS `sys_org_status_attr`;
CREATE TABLE `sys_org_status_attr` (
  `org_status_id` char(1) NOT NULL,
  `org_status_desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`org_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_org_status_attr
-- ----------------------------
INSERT INTO `sys_org_status_attr` VALUES ('0', '正常');
INSERT INTO `sys_org_status_attr` VALUES ('1', '禁用');

-- ----------------------------
-- Table structure for `sys_resource_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_info`;
CREATE TABLE `sys_resource_info` (
  `res_id` varchar(30) NOT NULL,
  `res_name` varchar(300) DEFAULT NULL,
  `res_attr` char(1) DEFAULT NULL,
  `res_up_id` varchar(30) DEFAULT NULL,
  `res_type` char(1) DEFAULT NULL,
  `sys_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`res_id`),
  KEY `fk_sys_idx_13` (`res_type`),
  KEY `fk_sys_idx_14` (`res_attr`),
  CONSTRAINT `fk_sys_idx_13` FOREIGN KEY (`res_type`) REFERENCES `sys_resource_type_attr` (`res_type`),
  CONSTRAINT `fk_sys_idx_14` FOREIGN KEY (`res_attr`) REFERENCES `sys_resource_info_attr` (`res_attr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource_info
-- ----------------------------
INSERT INTO `sys_resource_info` VALUES ('0100000000', '系统管理', '0', '-1', '0', '0');
INSERT INTO `sys_resource_info` VALUES ('0101000000', '系统审计', '0', '0100000000', '4', '0');
INSERT INTO `sys_resource_info` VALUES ('0101010000', '操作查询', '1', '0101000000', '1', '0');
INSERT INTO `sys_resource_info` VALUES ('0101010100', '查询操作日志', '1', '0101010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0101010200', '下载操作日志按钮', '1', '0101010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0101010300', '搜索日志信息按钮', '1', '0101010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103000000', '资源管理', '0', '0100000000', '4', '0');
INSERT INTO `sys_resource_info` VALUES ('0103010000', '菜单', '1', '0103000000', '1', '0');
INSERT INTO `sys_resource_info` VALUES ('0103010100', '查询资源信息', '1', '0103010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103010200', '新增资源信息按钮', '1', '0103010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103010300', '编辑资源信息按钮', '1', '0103010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103010400', '编辑资源信息按钮', '1', '0103010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103010500', '配置主题信息按钮', '1', '0103010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103020000', '组织', '1', '0103000000', '1', '0');
INSERT INTO `sys_resource_info` VALUES ('0103020100', '查询组织架构信息', '1', '0103020000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103020200', '新增组织架构信息按钮', '1', '0103020000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103020300', '更新组织架构信息按钮', '1', '0103020000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103020400', '删除组织架构信息按钮', '1', '0103020000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103020500', '导出组织架构信息按钮', '1', '0103020000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103030100', '查询共享域信息', '1', '0104010200', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103030200', '新增共享域信息按钮', '1', '0104010200', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103030300', '删除共享域信息按钮', '1', '0104010200', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0103030400', '更新共享域信息按钮', '1', '0104010200', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0104010000', '域定义', '1', '0103000000', '1', '0');
INSERT INTO `sys_resource_info` VALUES ('0104010100', '查询域信息', '1', '0104010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0104010200', '共享域管理', '1', '0104010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0104010300', '编辑域信息按钮', '1', '0104010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0104010400', '删除域信息按钮', '1', '0104010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0104010500', '新增域信息按钮', '1', '0104010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105000000', '用户与安全管理', '0', '0100000000', '4', '0');
INSERT INTO `sys_resource_info` VALUES ('0105010000', '用户', '1', '0105000000', '1', '0');
INSERT INTO `sys_resource_info` VALUES ('0105010100', '查询用户信息', '1', '0105010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105010200', '新增用户信息按钮', '1', '0105010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105010300', '编辑用户信息按钮', '1', '0105010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105010400', '删除用户信息按钮', '1', '0105010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105010500', '修改用户密码按钮', '1', '0105010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105010600', '修改用户状态按钮', '1', '0105010000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105020000', '角色', '1', '0105000000', '1', '0');
INSERT INTO `sys_resource_info` VALUES ('0105020100', '查询角色信息', '1', '0105020000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105020200', '新增角色信息按钮', '1', '0105020000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105020300', '更新角色信息按钮', '1', '0105020000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105020400', '删除角色信息按钮', '1', '0105020000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105020500', '角色资源管理', '1', '0105020000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105020510', '查询角色资源信息', '1', '0105020500', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105020520', '修改角色资源信息', '1', '0105020500', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105040000', '授权', '1', '0105000000', '1', '0');
INSERT INTO `sys_resource_info` VALUES ('0105040100', '授予权限按钮', '1', '0105040000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('0105040200', '移除权限', '1', '0105040000', '2', null);
INSERT INTO `sys_resource_info` VALUES ('1100000000', '系统帮助', '0', '-1', '0', null);
INSERT INTO `sys_resource_info` VALUES ('1101000000', '系统管理帮助', '0', '1100000000', '4', null);
INSERT INTO `sys_resource_info` VALUES ('1101010000', '系统维护帮助信息', '1', '1101000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('1102000000', '管理会计帮助文档', '0', '1100000000', '4', null);
INSERT INTO `sys_resource_info` VALUES ('1103000000', '公共信息帮助', '0', '1100000000', '4', null);

-- ----------------------------
-- Table structure for `sys_resource_info_attr`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_info_attr`;
CREATE TABLE `sys_resource_info_attr` (
  `res_attr` char(1) NOT NULL,
  `res_attr_desc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`res_attr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource_info_attr
-- ----------------------------
INSERT INTO `sys_resource_info_attr` VALUES ('0', '目录');
INSERT INTO `sys_resource_info_attr` VALUES ('1', '叶子');

-- ----------------------------
-- Table structure for `sys_resource_type_attr`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_type_attr`;
CREATE TABLE `sys_resource_type_attr` (
  `res_type` char(1) NOT NULL,
  `res_type_desc` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`res_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource_type_attr
-- ----------------------------
INSERT INTO `sys_resource_type_attr` VALUES ('0', '首页菜单');
INSERT INTO `sys_resource_type_attr` VALUES ('1', '子系统菜单');
INSERT INTO `sys_resource_type_attr` VALUES ('2', '功能按钮');
INSERT INTO `sys_resource_type_attr` VALUES ('4', '虚拟节点');

-- ----------------------------
-- Table structure for `sys_role_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_info`;
CREATE TABLE `sys_role_info` (
  `role_id` varchar(66) NOT NULL,
  `role_name` varchar(300) NOT NULL,
  `role_owner` varchar(30) NOT NULL,
  `role_create_date` datetime NOT NULL,
  `role_status_id` char(1) NOT NULL,
  `domain_id` varchar(30) NOT NULL,
  `role_maintance_date` datetime NOT NULL,
  `role_maintance_user` varchar(30) NOT NULL,
  `code_number` varchar(66) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `fk_sys_idx_11` (`role_status_id`),
  CONSTRAINT `fk_sys_idx_11` FOREIGN KEY (`role_status_id`) REFERENCES `sys_role_status_attr` (`role_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_info
-- ----------------------------
INSERT INTO `sys_role_info` VALUES ('vertex_root_join_sysadmin', '超级管理员', 'admin', '2016-01-01 00:00:00', '0', 'vertex_root', '2016-12-16 00:00:00', 'admin', 'sysadmin');

-- ----------------------------
-- Table structure for `sys_role_resource_relat`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource_relat`;
CREATE TABLE `sys_role_resource_relat` (
  `uuid` varchar(60) NOT NULL DEFAULT 'uuid()',
  `role_id` varchar(66) DEFAULT NULL,
  `res_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `fk_sys_idx_06` (`res_id`),
  KEY `fk_sys_role_res_01_idx` (`role_id`),
  CONSTRAINT `fk_sys_idx_06` FOREIGN KEY (`res_id`) REFERENCES `sys_resource_info` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sys_role_res_01` FOREIGN KEY (`role_id`) REFERENCES `sys_role_info` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resource_relat
-- ----------------------------
INSERT INTO `sys_role_resource_relat` VALUES ('00716df3-07ed-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105010600');
INSERT INTO `sys_role_resource_relat` VALUES ('0574d053-07e7-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103020300');
INSERT INTO `sys_role_resource_relat` VALUES ('0f931a5a-07f2-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105040100');
INSERT INTO `sys_role_resource_relat` VALUES ('1bdeaba6-07e9-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103010100');
INSERT INTO `sys_role_resource_relat` VALUES ('1bf28a08-07e7-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103020400');
INSERT INTO `sys_role_resource_relat` VALUES ('1c3118cc-07e2-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103030400');
INSERT INTO `sys_role_resource_relat` VALUES ('25167037-07f2-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105040200');
INSERT INTO `sys_role_resource_relat` VALUES ('33bb66bb-07e9-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103010200');
INSERT INTO `sys_role_resource_relat` VALUES ('3d23d85e-07e7-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103020500');
INSERT INTO `sys_role_resource_relat` VALUES ('43ad40d2-07f1-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020510');
INSERT INTO `sys_role_resource_relat` VALUES ('48463b39-07e9-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103010300');
INSERT INTO `sys_role_resource_relat` VALUES ('5a7db1f7-07f1-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020520');
INSERT INTO `sys_role_resource_relat` VALUES ('6bb7e04d-07e9-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103010400');
INSERT INTO `sys_role_resource_relat` VALUES ('76e8be09-07e5-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0101010100');
INSERT INTO `sys_role_resource_relat` VALUES ('776b1d4b-024c-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '1101000000');
INSERT INTO `sys_role_resource_relat` VALUES ('7d73294c-07ec-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105010100');
INSERT INTO `sys_role_resource_relat` VALUES ('8024c16b-07d8-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0104010300');
INSERT INTO `sys_role_resource_relat` VALUES ('8ca4f732-07e5-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0101010200');
INSERT INTO `sys_role_resource_relat` VALUES ('9466d2dc-07d5-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0104010200');
INSERT INTO `sys_role_resource_relat` VALUES ('9490d276-024a-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '1100000000');
INSERT INTO `sys_role_resource_relat` VALUES ('970569ee-07d8-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0104010400');
INSERT INTO `sys_role_resource_relat` VALUES ('974d1286-07ec-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105010200');
INSERT INTO `sys_role_resource_relat` VALUES ('a2658092-07ed-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020100');
INSERT INTO `sys_role_resource_relat` VALUES ('a2a01355-07e5-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0101010300');
INSERT INTO `sys_role_resource_relat` VALUES ('ad3e53ed-07d8-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0104010500');
INSERT INTO `sys_role_resource_relat` VALUES ('b5801636-07ec-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105010300');
INSERT INTO `sys_role_resource_relat` VALUES ('b8df3b71-07e9-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103010500');
INSERT INTO `sys_role_resource_relat` VALUES ('bd267b0e-07ed-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020200');
INSERT INTO `sys_role_resource_relat` VALUES ('c1177dbf-07e1-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103030100');
INSERT INTO `sys_role_resource_relat` VALUES ('c3baf059-07ee-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020500');
INSERT INTO `sys_role_resource_relat` VALUES ('c988dc67-07ec-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105010400');
INSERT INTO `sys_role_resource_relat` VALUES ('cf420a8e-0991-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '1102000000');
INSERT INTO `sys_role_resource_relat` VALUES ('d517d48d-07ed-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020300');
INSERT INTO `sys_role_resource_relat` VALUES ('d89f256d-0991-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '1103000000');
INSERT INTO `sys_role_resource_relat` VALUES ('d8fd37ed-07e1-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103030200');
INSERT INTO `sys_role_resource_relat` VALUES ('daae0b92-07e6-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103020100');
INSERT INTO `sys_role_resource_relat` VALUES ('ea23a4e6-07ed-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020400');
INSERT INTO `sys_role_resource_relat` VALUES ('ec5e6b47-07ec-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105010500');
INSERT INTO `sys_role_resource_relat` VALUES ('ee768238-07e6-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103020200');
INSERT INTO `sys_role_resource_relat` VALUES ('f0766b0d-c597-11e6-9b11-d4bed967cdff', 'vertex_root_join_sysadmin', '0100000000');
INSERT INTO `sys_role_resource_relat` VALUES ('f07680fd-c597-11e6-9b11-d4bed967cdff', 'vertex_root_join_sysadmin', '0101000000');
INSERT INTO `sys_role_resource_relat` VALUES ('f076a4d5-c597-11e6-9b11-d4bed967cdff', 'vertex_root_join_sysadmin', '0103000000');
INSERT INTO `sys_role_resource_relat` VALUES ('f076b2d1-c597-11e6-9b11-d4bed967cdff', 'vertex_root_join_sysadmin', '0103010000');
INSERT INTO `sys_role_resource_relat` VALUES ('f076c09b-c597-11e6-9b11-d4bed967cdff', 'vertex_root_join_sysadmin', '0103020000');
INSERT INTO `sys_role_resource_relat` VALUES ('f076e3ca-c597-11e6-9b11-d4bed967cdff', 'vertex_root_join_sysadmin', '0104010000');
INSERT INTO `sys_role_resource_relat` VALUES ('f076efb4-c597-11e6-9b11-d4bed967cdff', 'vertex_root_join_sysadmin', '0105000000');
INSERT INTO `sys_role_resource_relat` VALUES ('f076fb82-c597-11e6-9b11-d4bed967cdff', 'vertex_root_join_sysadmin', '0105010000');
INSERT INTO `sys_role_resource_relat` VALUES ('f077074b-c597-11e6-9b11-d4bed967cdff', 'vertex_root_join_sysadmin', '0105020000');
INSERT INTO `sys_role_resource_relat` VALUES ('f0771e6b-c597-11e6-9b11-d4bed967cdf1', 'vertex_root_join_sysadmin', '0101010000');
INSERT INTO `sys_role_resource_relat` VALUES ('f0771e6b-c597-11e6-9b11-d4bed967cdff', 'vertex_root_join_sysadmin', '0105040000');
INSERT INTO `sys_role_resource_relat` VALUES ('f2e86103-07d2-11e7-95d9-a0c58951c8d5', 'vertex_root_join_sysadmin', '0104010100');
INSERT INTO `sys_role_resource_relat` VALUES ('f87aad5f-0991-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '1101010000');
INSERT INTO `sys_role_resource_relat` VALUES ('fb9787a0-07e1-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103030300');

-- ----------------------------
-- Table structure for `sys_role_status_attr`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_status_attr`;
CREATE TABLE `sys_role_status_attr` (
  `role_status_id` char(1) NOT NULL,
  `role_status_desc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`role_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_status_attr
-- ----------------------------
INSERT INTO `sys_role_status_attr` VALUES ('0', '正常');
INSERT INTO `sys_role_status_attr` VALUES ('1', '锁定');
INSERT INTO `sys_role_status_attr` VALUES ('2', '失效');

-- ----------------------------
-- Table structure for `sys_role_user_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user_relation`;
CREATE TABLE `sys_role_user_relation` (
  `uuid` varchar(60) NOT NULL,
  `role_id` varchar(66) DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `maintance_date` date DEFAULT NULL,
  `maintance_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `fk_sys_idx_03` (`user_id`),
  KEY `fk_sys_role_user_01_idx` (`role_id`),
  CONSTRAINT `fk_sys_idx_03` FOREIGN KEY (`user_id`) REFERENCES `sys_user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sys_role_user_01` FOREIGN KEY (`role_id`) REFERENCES `sys_role_info` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_user_relation
-- ----------------------------
INSERT INTO `sys_role_user_relation` VALUES ('19890228hzwy23', 'vertex_root_join_sysadmin', 'admin', '2000-01-01', 'admin');

-- ----------------------------
-- Table structure for `sys_sec_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_sec_user`;
CREATE TABLE `sys_sec_user` (
  `user_id` varchar(30) NOT NULL,
  `user_passwd` varchar(30) DEFAULT NULL,
  `status_id` char(1) DEFAULT NULL,
  `continue_error_cnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_sys_idx_02` (`status_id`),
  CONSTRAINT `fk_sys_idx_01` FOREIGN KEY (`user_id`) REFERENCES `sys_user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sys_idx_02` FOREIGN KEY (`status_id`) REFERENCES `sys_user_status_attr` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_sec_user
-- ----------------------------
INSERT INTO `sys_sec_user` VALUES ('admin', 'HyfHArYBOqiiFLIB4iGyVw==', '0', '0');

-- ----------------------------
-- Table structure for `sys_theme_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_theme_info`;
CREATE TABLE `sys_theme_info` (
  `theme_id` varchar(30) NOT NULL,
  `theme_desc` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_theme_info
-- ----------------------------
INSERT INTO `sys_theme_info` VALUES ('1001', '活泼型');
INSERT INTO `sys_theme_info` VALUES ('1002', '稳重型');
INSERT INTO `sys_theme_info` VALUES ('1003', '果粉');
INSERT INTO `sys_theme_info` VALUES ('1004', '传统');

-- ----------------------------
-- Table structure for `sys_theme_value`
-- ----------------------------
DROP TABLE IF EXISTS `sys_theme_value`;
CREATE TABLE `sys_theme_value` (
  `uuid` varchar(60) NOT NULL,
  `theme_id` varchar(30) DEFAULT NULL,
  `res_id` varchar(30) DEFAULT NULL,
  `res_url` varchar(120) DEFAULT NULL,
  `res_type` varchar(5) DEFAULT NULL,
  `res_bg_color` varchar(30) DEFAULT NULL,
  `res_class` varchar(90) DEFAULT NULL,
  `group_id` char(1) DEFAULT NULL,
  `res_img` varchar(200) DEFAULT NULL,
  `sort_id` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `pk_sys_theme_value_01` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_theme_value
-- ----------------------------
INSERT INTO `sys_theme_value` VALUES ('00714873-07ed-11e7-952f-a0c58951c8d5', '1001', '0105010600', '/v1/auth/user/modify/status', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('0574add7-07e7-11e7-952f-a0c58951c8d5', '1001', '0103020300', '/v1/auth/resource/org/update', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('0f9303e2-07f2-11e7-952f-a0c58951c8d5', '1001', '0105040100', '/v1/auth/user/roles/auth', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('1001-0100000000', '1001', '0100000000', './views/hauth/theme/default/sysconfig.tpl', '0', '#FF6600', 'tile tile-wide', '1', '/static/theme/default/img/system.png', '1');
INSERT INTO `sys_theme_value` VALUES ('1001-0101010000', '1001', '0101010000', '/v1/auth/HandleLogsPage', '1', '#336699', 'tile tile-large', '3', '/static/theme/default/img/logs_shen.png', '1');
INSERT INTO `sys_theme_value` VALUES ('1001-0103010000', '1001', '0103010000', '/v1/auth/resource/page', '1', '#666699', 'tile', '1', '/static/theme/default/img/menus.png', '3');
INSERT INTO `sys_theme_value` VALUES ('1001-0103020000', '1001', '0103020000', '/v1/auth/resource/org/page', '1', '#FF6666', 'tile', '1', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('1001-0104010000', '1001', '0104010000', '/v1/auth/domain/page', '1', '#0099CC', 'tile tile-wide', '1', '/static/theme/default/img/domain.png', '1');
INSERT INTO `sys_theme_value` VALUES ('1001-0105010000', '1001', '0105010000', '/v1/auth/user/page', '1', '#CC6600', 'tile tile-wide', '2', '/static/theme/default/img/user_manager.png', '1');
INSERT INTO `sys_theme_value` VALUES ('1001-0105020000', '1001', '0105020000', '/v1/auth/role/page', '1', '#FFCC33', 'tile', '2', '/static/theme/default/img/role_manager.png', '2');
INSERT INTO `sys_theme_value` VALUES ('1001-0105040000', '1001', '0105040000', '/v1/auth/batch/page', '1', '#339999', 'tile', '2', '/static/theme/default/img/grant.png', '4');
INSERT INTO `sys_theme_value` VALUES ('1bde8991-07e9-11e7-952f-a0c58951c8d5', '1001', '0103010100', '/v1/auth/resource/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('1bf270aa-07e7-11e7-952f-a0c58951c8d5', '1001', '0103020400', '/v1/auth/resource/org/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('1c30f988-07e2-11e7-952f-a0c58951c8d5', '1001', '0103030400', '/v1/auth/domain/share/put', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('25165700-07f2-11e7-952f-a0c58951c8d5', '1001', '0105040200', '/v1/auth/user/roles/revoke', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('33b9cb0c-07e9-11e7-952f-a0c58951c8d5', '1001', '0103010200', '/v1/auth/resource/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('3d237ba7-07e7-11e7-952f-a0c58951c8d5', '1001', '0103020500', '/v1/auth/resource/org/download', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('43ad2a9a-07f1-11e7-952f-a0c58951c8d5', '1001', '0105020510', '/v1/auth/role/resource/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('48460086-07e9-11e7-952f-a0c58951c8d5', '1001', '0103010300', '/v1/auth/resource/update', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('5a7d8dbf-07f1-11e7-952f-a0c58951c8d5', '1001', '0105020520', '/v1/auth/role/resource/rights', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('624b90c0-0278-11e7-9b60-a0c58951c8d5', '1002', '0101010000', '/v1/auth/HandleLogsPage', '1', '#339999', 'tile tile-wide', '3', '/static/theme/default/img/logs_shen.png', '1');
INSERT INTO `sys_theme_value` VALUES ('6bb7b2c8-07e9-11e7-952f-a0c58951c8d5', '1001', '0103010400', '/v1/auth/resource/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('76e895cd-07e5-11e7-952f-a0c58951c8d5', '1001', '0101010100', '/v1/auth/handle/logs', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('7d73058c-07ec-11e7-952f-a0c58951c8d5', '1001', '0105010100', '/v1/auth/user/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('8024ac09-07d8-11e7-952f-a0c58951c8d5', '1001', '0104010300', '/v1/auth/domain/update', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('8ca386d8-07e5-11e7-952f-a0c58951c8d5', '1001', '0101010200', '/v1/auth/handle/logs/download', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('946658e9-07d5-11e7-952f-a0c58951c8d5', '1001', '0104010200', '/v1/auth/domain/share/page', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('948f67dc-024a-11e7-9b60-a0c58951c8d5', '1001', '1100000000', './views/help/default/syshelp.tpl', '0', '#0099CC', 'tile tile-wide', '1', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('9705437b-07d8-11e7-952f-a0c58951c8d5', '1001', '0104010400', '/v1/auth/domain/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('974ce1fd-07ec-11e7-952f-a0c58951c8d5', '1001', '0105010200', '/v1/auth/user/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('991641c3-0d55-11e7-964b-a0c58951c8d5', '1004', '0101010000', '/v1/auth/HandleLogsPage', '1', '#336699', 'tile tile-large', '3', '/static/theme/default/img/logs_shen.png', '1');
INSERT INTO `sys_theme_value` VALUES ('99164f5c-0d55-11e7-964b-a0c58951c8d5', '1004', '0103010000', '/v1/auth/resource/page', '1', '#666699', 'tile', '1', '/static/theme/default/img/menus.png', '3');
INSERT INTO `sys_theme_value` VALUES ('9916502d-0d55-11e7-964b-a0c58951c8d5', '1004', '0104010000', '/v1/auth/domain/page', '1', '#0099CC', 'tile tile-wide', '1', '/static/theme/default/img/domain.png', '1');
INSERT INTO `sys_theme_value` VALUES ('991650a9-0d55-11e7-964b-a0c58951c8d5', '1004', '0105010000', '/v1/auth/user/page', '1', '#CC6600', 'tile tile-wide', '2', '/static/theme/default/img/user_manager.png', '1');
INSERT INTO `sys_theme_value` VALUES ('9916512d-0d55-11e7-964b-a0c58951c8d5', '1004', '0105020000', '/v1/auth/role/page', '1', '#FFCC33', 'tile', '2', '/static/theme/default/img/role_manager.png', '2');
INSERT INTO `sys_theme_value` VALUES ('9916519c-0d55-11e7-964b-a0c58951c8d5', '1004', '0100000000', './views/hauth/theme/cyan/sysconfig.tpl', '0', '#FF6600', 'tile tile-wide', '1', '/static/theme/default/img/system.png', '1');
INSERT INTO `sys_theme_value` VALUES ('99165203-0d55-11e7-964b-a0c58951c8d5', '1004', '0105040000', '/v1/auth/batch/page', '1', '#339999', 'tile', '2', '/static/theme/default/img/grant.png', '4');
INSERT INTO `sys_theme_value` VALUES ('9916525c-0d55-11e7-964b-a0c58951c8d5', '1004', '0103020000', '/v1/auth/resource/org/page', '1', '#FF6666', 'tile', '1', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('9917f6e5-0d55-11e7-964b-a0c58951c8d5', '1004', '1100000000', './views/help/cyan/syshelp.tpl', '0', '#0099CC', 'tile tile-wide', '1', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('99180d65-0d55-11e7-964b-a0c58951c8d5', '1004', '0104010100', '/v1/auth/domain/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99180da1-0d55-11e7-964b-a0c58951c8d5', '1004', '0104010200', '/v1/auth/domain/share/page', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99180ddc-0d55-11e7-964b-a0c58951c8d5', '1004', '0104010300', '/v1/auth/domain/update', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99180e14-0d55-11e7-964b-a0c58951c8d5', '1004', '0104010400', '/v1/auth/domain/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99180e4f-0d55-11e7-964b-a0c58951c8d5', '1004', '0104010500', '/v1/auth/domain/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99180e87-0d55-11e7-964b-a0c58951c8d5', '1004', '0103030100', '/v1/auth/domain/share/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99180ec3-0d55-11e7-964b-a0c58951c8d5', '1004', '0103030200', '/v1/auth/domain/share/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99180efa-0d55-11e7-964b-a0c58951c8d5', '1004', '0103030300', '/v1/auth/domain/share/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99180f32-0d55-11e7-964b-a0c58951c8d5', '1004', '0103030400', '/v1/auth/domain/share/put', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99180f69-0d55-11e7-964b-a0c58951c8d5', '1004', '0101010100', '/v1/auth/handle/logs', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99180fa1-0d55-11e7-964b-a0c58951c8d5', '1004', '0101010200', '/v1/auth/handle/logs/download', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99180fdc-0d55-11e7-964b-a0c58951c8d5', '1004', '0101010300', '/v1/auth/handle/logs/search', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99181014-0d55-11e7-964b-a0c58951c8d5', '1004', '0103020100', '/v1/auth/resource/org/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('9918104b-0d55-11e7-964b-a0c58951c8d5', '1004', '0103020200', '/v1/auth/resource/org/insert', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99181087-0d55-11e7-964b-a0c58951c8d5', '1004', '0103020300', '/v1/auth/resource/org/update', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('991810be-0d55-11e7-964b-a0c58951c8d5', '1004', '0103020400', '/v1/auth/resource/org/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('991810fe-0d55-11e7-964b-a0c58951c8d5', '1004', '0103020500', '/v1/auth/resource/org/download', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('9918113a-0d55-11e7-964b-a0c58951c8d5', '1004', '0103010100', '/v1/auth/resource/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99181176-0d55-11e7-964b-a0c58951c8d5', '1004', '0103010200', '/v1/auth/resource/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('991811ad-0d55-11e7-964b-a0c58951c8d5', '1004', '0103010300', '/v1/auth/resource/update', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('991811e1-0d55-11e7-964b-a0c58951c8d5', '1004', '0103010400', '/v1/auth/resource/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99181218-0d55-11e7-964b-a0c58951c8d5', '1004', '0103010500', '/v1/auth/resource/config/theme', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('9918124f-0d55-11e7-964b-a0c58951c8d5', '1004', '0105010100', '/v1/auth/user/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('9918128b-0d55-11e7-964b-a0c58951c8d5', '1004', '0105010200', '/v1/auth/user/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('991812c3-0d55-11e7-964b-a0c58951c8d5', '1004', '0105010300', '/v1/auth/user/put', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('991812fa-0d55-11e7-964b-a0c58951c8d5', '1004', '0105010400', '/v1/auth/user/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99181332-0d55-11e7-964b-a0c58951c8d5', '1004', '0105010500', '/v1/auth/user/modify/passwd', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99181365-0d55-11e7-964b-a0c58951c8d5', '1004', '0105010600', '/v1/auth/user/modify/status', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('9918139c-0d55-11e7-964b-a0c58951c8d5', '1004', '0105020100', '/v1/auth/role/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('991813d4-0d55-11e7-964b-a0c58951c8d5', '1004', '0105020200', '/v1/auth/role/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('9918140b-0d55-11e7-964b-a0c58951c8d5', '1004', '0105020300', '/v1/auth/role/update', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99181443-0d55-11e7-964b-a0c58951c8d5', '1004', '0105020400', '/v1/auth/role/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99181476-0d55-11e7-964b-a0c58951c8d5', '1004', '0105020500', '/v1/auth/role/resource/details', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('991814ad-0d55-11e7-964b-a0c58951c8d5', '1004', '0105020510', '/v1/auth/role/resource/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('991814f2-0d55-11e7-964b-a0c58951c8d5', '1004', '0105020520', '/v1/auth/role/resource/rights', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('9918152d-0d55-11e7-964b-a0c58951c8d5', '1004', '0105040100', '/v1/auth/user/roles/auth', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('99181569-0d55-11e7-964b-a0c58951c8d5', '1004', '0105040200', '/v1/auth/user/roles/revoke', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('991815e1-0d55-11e7-964b-a0c58951c8d5', '1004', '1101010000', '/v1/help/system/help', '1', '#339999', 'tile tile-large', '1', '/static/theme/default/img/org.png', '1');
INSERT INTO `sys_theme_value` VALUES ('a265597d-07ed-11e7-952f-a0c58951c8d5', '1001', '0105020100', '/v1/auth/role/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('a29fba3f-07e5-11e7-952f-a0c58951c8d5', '1001', '0101010300', '/v1/auth/handle/logs/search', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('ad3e295c-07d8-11e7-952f-a0c58951c8d5', '1001', '0104010500', '/v1/auth/domain/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('b58002f6-07ec-11e7-952f-a0c58951c8d5', '1001', '0105010300', '/v1/auth/user/put', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('b8df0cd7-07e9-11e7-952f-a0c58951c8d5', '1001', '0103010500', '/v1/auth/resource/config/theme', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('bd264fd7-07ed-11e7-952f-a0c58951c8d5', '1001', '0105020200', '/v1/auth/role/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('c1174621-07e1-11e7-952f-a0c58951c8d5', '1001', '0103030100', '/v1/auth/domain/share/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('c3bad47b-07ee-11e7-952f-a0c58951c8d5', '1001', '0105020500', '/v1/auth/role/resource/details', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('c988bb89-07ec-11e7-952f-a0c58951c8d5', '1001', '0105010400', '/v1/auth/user/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('d517aab8-07ed-11e7-952f-a0c58951c8d5', '1001', '0105020300', '/v1/auth/role/update', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('d8fccbcb-07e1-11e7-952f-a0c58951c8d5', '1001', '0103030200', '/v1/auth/domain/share/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('daadf91b-07e6-11e7-952f-a0c58951c8d5', '1001', '0103020100', '/v1/auth/resource/org/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('ea237b6a-07ed-11e7-952f-a0c58951c8d5', '1001', '0105020400', '/v1/auth/role/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('ec5cb33a-07ec-11e7-952f-a0c58951c8d5', '1001', '0105010500', '/v1/auth/user/modify/passwd', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('ee765e9a-07e6-11e7-952f-a0c58951c8d5', '1001', '0103020200', '/v1/auth/resource/org/insert', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('f2e81083-07d2-11e7-95d9-a0c58951c8d5', '1001', '0104010100', '/v1/auth/domain/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('f87a9123-0991-11e7-952f-a0c58951c8d5', '1001', '1101010000', '/v1/help/system/help', '1', '#339999', 'tile tile-large', '1', '/static/theme/default/img/org.png', '1');
INSERT INTO `sys_theme_value` VALUES ('fb975107-07e1-11e7-952f-a0c58951c8d5', '1001', '0103030300', '/v1/auth/domain/share/delete', '2', '', '', '', '', '0');

-- ----------------------------
-- Table structure for `sys_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info` (
  `user_id` varchar(30) NOT NULL,
  `user_name` varchar(300) DEFAULT NULL,
  `user_create_date` datetime DEFAULT NULL,
  `user_owner` varchar(30) DEFAULT NULL,
  `user_email` varchar(30) DEFAULT NULL,
  `user_phone` decimal(15,0) DEFAULT NULL,
  `org_unit_id` varchar(66) DEFAULT NULL,
  `user_maintance_date` datetime DEFAULT NULL,
  `user_maintance_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_sys_user_org_idx` (`org_unit_id`),
  CONSTRAINT `fk_sys_user_org` FOREIGN KEY (`org_unit_id`) REFERENCES `sys_org_info` (`org_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
INSERT INTO `sys_user_info` VALUES ('admin', '超级管理员', '2016-01-01 00:00:00', 'sys', 'omsystem@163.com', '18986110550', 'vertex_root_join_vertex_root', '2016-12-19 13:34:32', 'sys');

-- ----------------------------
-- Table structure for `sys_user_status_attr`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_status_attr`;
CREATE TABLE `sys_user_status_attr` (
  `status_id` char(1) NOT NULL,
  `status_desc` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_status_attr
-- ----------------------------
INSERT INTO `sys_user_status_attr` VALUES ('0', '正常');
INSERT INTO `sys_user_status_attr` VALUES ('1', '锁定');
INSERT INTO `sys_user_status_attr` VALUES ('2', '失效');

-- ----------------------------
-- Table structure for `sys_user_theme`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_theme`;
CREATE TABLE `sys_user_theme` (
  `user_id` varchar(30) NOT NULL,
  `theme_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `pk_sys_user_theme_01` FOREIGN KEY (`user_id`) REFERENCES `sys_user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_theme
-- ----------------------------
INSERT INTO `sys_user_theme` VALUES ('admin', '1004');

-- ----------------------------
-- Function structure for `getChildDomainList`
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildDomainList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getChildDomainList`(rootId varchar(60)) RETURNS varchar(4000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(4000);

SET sTemp = '$';
SET sTempChd = cast(rootId as char);

WHILE sTempChd is not NULL DO
SET sTemp = CONCAT(sTemp,',',sTempChd);
SELECT group_concat(domain_id) INTO sTempChd FROM sys_domain_info where FIND_IN_SET(domain_up_id,sTempChd) > 0;
END WHILE;
return sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getChildList`
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getChildList`(rootId varchar(60)) RETURNS varchar(4000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(4000);

SET sTemp = '$';
SET sTempChd = cast(rootId as char);

WHILE sTempChd is not NULL DO
SET sTemp = CONCAT(sTemp,',',sTempChd);
SELECT group_concat(res_id) INTO sTempChd FROM sys_resource_info where FIND_IN_SET(res_up_id,sTempChd) > 0;
END WHILE;
return sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getChildOrgList`
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildOrgList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getChildOrgList`(rootId varchar(60)) RETURNS varchar(4000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(4000);

SET sTemp = '$';
SET sTempChd = cast(rootId as char);

WHILE sTempChd is not NULL DO
SET sTemp = CONCAT(sTemp,',',sTempChd);
SELECT group_concat(org_unit_id) INTO sTempChd FROM sys_org_info where FIND_IN_SET(up_org_id,sTempChd) > 0;
END WHILE;
return sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getParentAndChindDomainList`
-- ----------------------------
DROP FUNCTION IF EXISTS `getParentAndChindDomainList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getParentAndChindDomainList`(
	rootId varchar(90)
) RETURNS varchar(4000) CHARSET utf8
BEGIN
	DECLARE sTemp VARCHAR(4000);
	DECLARE sTempChd VARCHAR(4000);
	DECLARE curDomain VARCHAR(90);

	SET sTemp = '$';
	SET curDomain = cast(rootId as char);
	SET sTempChd = curDomain;
	
	WHILE sTempChd <> '-1' DO

		SELECT domain_up_id into sTempChd from sys_domain_info where domain_id = curDomain;
		
        if sTempChd <> '-1' then
			SET sTemp = CONCAT(sTemp,',',sTempChd);
        end if;

		SET curDomain = sTempChd;

	END WHILE;
    
    SET sTempChd = cast(rootId as char);
    
    WHILE sTempChd is not NULL DO
    
		SET sTemp = CONCAT(sTemp,',',sTempChd);
        
		SELECT group_concat(domain_id) INTO sTempChd FROM sys_domain_info where FIND_IN_SET(domain_up_id,sTempChd) > 0;
	
    END WHILE;
    
	return sTemp;

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getParentDomainList`
-- ----------------------------
DROP FUNCTION IF EXISTS `getParentDomainList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getParentDomainList`(
	rootId varchar(90)
) RETURNS varchar(4000) CHARSET utf8
BEGIN
	DECLARE sTemp VARCHAR(4000);
	DECLARE sTempChd VARCHAR(4000);
	DECLARE curDomain VARCHAR(90);

	SET sTemp = '$';
	SET curDomain = cast(rootId as char);
	SET sTempChd = curDomain;
	
	WHILE sTempChd <> '-1' DO

		SELECT domain_up_id into sTempChd from sys_domain_info where domain_id = curDomain;
		
        if sTempChd <> '-1' then
			SET sTemp = CONCAT(sTemp,',',sTempChd);
        end if;

		SET curDomain = sTempChd;

	END WHILE;
    
	return sTemp;

END
;;
DELIMITER ;
