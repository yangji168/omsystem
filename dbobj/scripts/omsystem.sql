/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.214
Source Server Version : 50630
Source Host           : 192.168.1.214:3306
Source Database       : omsystem

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2017-04-07 13:48:34
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
INSERT INTO `sys_domain_info` VALUES ('devops_product', 'FTP测试域', '0', '2017-03-21 09:31:01', 'admin', '2017-03-21 09:31:01', 'admin');
INSERT INTO `sys_domain_info` VALUES ('mas', '管理会计', '0', '2017-03-01 10:58:18', 'admin', '2017-03-13 19:58:27', 'demo');
INSERT INTO `sys_domain_info` VALUES ('test', '测试', '0', '2017-03-14 13:48:06', 'demo', '2017-04-06 13:44:50', 'admin');
INSERT INTO `sys_domain_info` VALUES ('vertex_root', '系统顶级域空间', '0', '2016-12-26 16:43:19', 'sys', '2017-03-13 19:44:37', 'demo');

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
INSERT INTO `sys_domain_share_info` VALUES ('05918939-0d35-11e7-9c4f-a0c58951c8d5', 'test', 'vertex_root', '1', 'demo', '2017-03-20', '2017-03-20', 'demo');
INSERT INTO `sys_domain_share_info` VALUES ('0c3dfe8a-0dd6-11e7-9612-a0c58951c8d5', 'devops_product', 'vertex_root', '2', 'admin', '2017-03-21', '2017-03-21', 'admin');
INSERT INTO `sys_domain_share_info` VALUES ('123d11f8-0dd6-11e7-9612-a0c58951c8d5', 'devops_product', 'mas', '2', 'admin', '2017-03-21', '2017-03-21', 'admin');
INSERT INTO `sys_domain_share_info` VALUES ('b642fdaa-0866-11e7-952f-a0c58951c8d5', 'mas', 'vertex_root', '2', 'admin', '2017-03-14', '2017-03-14', 'admin');

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
INSERT INTO `sys_handle_logs` VALUES ('43332ab1-1b42-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:28:26', '192.168.1.112', '200', 'GET', '/HomePage', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('4362cf89-1b42-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:28:27', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=-1&TypeId=0&_=1491535705510', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('46c22d0e-1b43-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:35:42', '192.168.1.112', '200', 'GET', '/HomePage', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('46f3de1a-1b43-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:35:42', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=-1&TypeId=0&_=1491536140978', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('6fef7e1b-1b42-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:29:41', '192.168.1.112', '200', 'GET', '/HomePage', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('702058cb-1b42-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:29:42', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=-1&TypeId=0&_=1491535780561', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('8f6dff84-1b43-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:37:44', '192.168.1.112', '200', 'GET', '/HomePage', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('8f9f4049-1b43-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:37:44', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=-1&TypeId=0&_=1491536262911', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('98bee0e1-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:52:18', '192.168.1.112', '200', 'GET', '/HomePage', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('98efcd4d-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:52:19', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=-1&TypeId=0&_=1491537137528', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('b11cb9e7-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:52:59', '192.168.1.112', '200', 'GET', '/v1/auth/user/query', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('b2450bcc-1b43-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:38:42', '192.168.1.112', '200', 'GET', '/HomePage', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('b2762229-1b43-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:38:42', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=-1&TypeId=0&_=1491536321364', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('c23323ce-1b43-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:39:09', '192.168.1.112', '200', 'GET', '/v1/auth/index/entry', 'Id=0100000000&_=1491536321365', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('c2479279-1b43-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:39:09', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=0100000000&TypeId=1&_=1491536321366', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('c30cdb5e-1b43-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:39:10', '192.168.1.112', '200', 'GET', '/v1/auth/resource/page', '_=1491536321367', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('c3129bfa-1b43-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:39:10', '192.168.1.112', '200', 'GET', '/v1/auth/resource/get', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('c4649df7-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:53:31', '192.168.1.112', '200', 'POST', '/v1/auth/passwd/update', 'newpasswd=omsystem&orapasswd=hzwy23&surepasswd=omsystem&userid=admin', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('cfe2e1ce-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:53:51', '192.168.1.112', '200', 'GET', '/HomePage', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('d01066bc-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:53:51', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=-1&TypeId=0&_=1491537230043', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('dfc646d0-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:54:17', '192.168.1.112', '200', 'GET', '/v1/auth/index/entry', 'Id=0100000000&_=1491537230044', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('dfdc592e-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:54:18', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=0100000000&TypeId=1&_=1491537230045', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('e079967e-1b40-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:18:31', '192.168.1.112', '200', 'GET', '/HomePage', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('e0aa872c-1b40-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:18:31', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=-1&TypeId=0&_=1491535110371', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('e0c02c36-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:54:19', '192.168.1.112', '200', 'GET', '/v1/auth/user/page', '_=1491537230046', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('e0c87964-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:54:19', '192.168.1.112', '200', 'GET', '/v1/auth/user/get', 'domain_id=&limit=10&offset=0&order=asc', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('e0c90aaa-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:54:19', '192.168.1.112', '200', 'GET', '/v1/auth/domain/self/owner', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('e0cb34b2-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:54:19', '192.168.1.112', '200', 'GET', '/v1/auth/resource/org/get', 'domain_id=vertex_root', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('e375528f-1b40-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:18:36', '192.168.1.112', '200', 'GET', '/v1/auth/index/entry', 'Id=0200000000&_=1491535110372', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('e3ac4a6d-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:54:24', '192.168.1.112', '200', 'GET', '/v1/auth/resource/org/get', 'domain_id=vertex_root', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('e7688140-1b44-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:47:21', '192.168.1.112', '200', 'GET', '/', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('e929ae0e-1b40-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:18:46', '192.168.1.112', '200', 'GET', '/HomePage', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('e95d2447-1b40-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:18:46', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=-1&TypeId=0&_=1491535124957', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('ea5d74fc-1b44-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:47:26', '192.168.1.112', '200', 'POST', '/login', 'password=hzwy23&username=admin', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('ea60433f-1b44-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:47:26', '192.168.1.112', '200', 'GET', '/HomePage', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('ea6ea4da-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:54:35', '192.168.1.112', '200', 'PUT', '/v1/auth/user/put', 'orgId=vertex_root_join_vertex_root&userDesc=%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98&userEmail=omsystem%40163.com&userId=admin&userPhone=18986110550', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('ea71537f-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:54:35', '192.168.1.112', '200', 'GET', '/v1/auth/user/get', 'domain_id=vertex_root&limit=10&offset=0&order=asc', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('ea90609c-1b44-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:47:26', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=-1&TypeId=0&_=1491536844989', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('eec4e27d-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:54:43', '192.168.1.112', '200', 'GET', '/v1/auth/resource/org/get', 'domain_id=vertex_root', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('efe7543c-1b44-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:47:35', '192.168.1.112', '200', 'GET', '/v1/auth/index/entry', 'Id=0100000000&_=1491536844990', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('efffb103-1b44-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:47:35', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=0100000000&TypeId=1&_=1491536844991', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('f3b49d66-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:54:51', '192.168.1.112', '200', 'PUT', '/v1/auth/user/put', 'orgId=vertex_root_join_vertex_root&userDesc=%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98&userEmail=omsystem%40163.com&userId=admin&userPhone=18888888888', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('f3b7eabe-1b45-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:54:51', '192.168.1.112', '200', 'GET', '/v1/auth/user/get', 'domain_id=vertex_root&limit=10&offset=0&order=asc', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('f4b914b0-1b44-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:47:43', '192.168.1.112', '200', 'GET', '/v1/auth/domain/page', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('f4c19584-1b44-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:47:43', '192.168.1.112', '200', 'GET', '/v1/auth/domain/get', 'limit=40&offset=0&order=asc', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('fb201d37-1b42-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:33:35', '192.168.1.112', '200', 'GET', '/HomePage', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('fb522030-1b42-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:33:35', '192.168.1.112', '200', 'GET', '/v1/auth/main/menu', 'Id=-1&TypeId=0&_=1491536014100', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('ff8e75d2-1b44-11e7-b57a-525400ec396c', 'admin', '2017-04-07 11:48:01', '192.168.1.112', '200', 'GET', '/logout', '', 'vertex_root');
INSERT INTO `sys_handle_logs` VALUES ('ff91264e-1b44-11e7-b57a-525400ec396c', 'dev', '2017-04-07 11:48:01', '192.168.1.112', '200', 'GET', '/', '', 'dev');

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
INSERT INTO `sys_org_info` VALUES ('devops_product_join_1111000011', 'FTP测试', 'root_vertex_system', '0', 'devops_product', '2017-03-21', '2017-03-21', 'admin', 'admin', '1111000011');
INSERT INTO `sys_org_info` VALUES ('mas_join_234fda', '攀枝花市分行', 'mas_join_5233454', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', '234fda');
INSERT INTO `sys_org_info` VALUES ('mas_join_34124', '工商银行', 'root_vertex_system', '0', 'mas', '2017-03-01', '2017-03-01', 'admin', 'admin', '34124');
INSERT INTO `sys_org_info` VALUES ('mas_join_4321643', '自贡市分行', 'mas_join_5233454', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', '4321643');
INSERT INTO `sys_org_info` VALUES ('mas_join_45246543', '武汉市分行', 'mas_join_512345423', '0', 'mas', '2017-03-01', '2017-03-01', 'admin', 'admin', '45246543');
INSERT INTO `sys_org_info` VALUES ('mas_join_4542346', '孝感市分行', 'mas_join_512345423', '0', 'mas', '2017-03-01', '2017-03-01', 'admin', 'admin', '4542346');
INSERT INTO `sys_org_info` VALUES ('mas_join_512345423', '湖北省分行', 'mas_join_34124', '0', 'mas', '2017-03-01', '2017-03-01', 'admin', 'admin', '512345423');
INSERT INTO `sys_org_info` VALUES ('mas_join_5233454', '四川省分行', 'mas_join_34124', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', '5233454');
INSERT INTO `sys_org_info` VALUES ('mas_join_aefd', '欧洲分行', 'mas_join_34124', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'aefd');
INSERT INTO `sys_org_info` VALUES ('mas_join_fdafdg', '贵州省分行', 'mas_join_34124', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'fdafdg');
INSERT INTO `sys_org_info` VALUES ('mas_join_fdaga', '重庆市分行', 'mas_join_34124', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'fdaga');
INSERT INTO `sys_org_info` VALUES ('mas_join_fdagqe', '宁夏省分行', 'mas_join_34124', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'fdagqe');
INSERT INTO `sys_org_info` VALUES ('mas_join_fdasfd', '上海市分行', 'mas_join_34124', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'fdasfd');
INSERT INTO `sys_org_info` VALUES ('mas_join_fdsagd', '泸州市分行', 'mas_join_5233454', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'fdsagd');
INSERT INTO `sys_org_info` VALUES ('mas_join_feqhda', '海南省分行', 'mas_join_34124', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'feqhda');
INSERT INTO `sys_org_info` VALUES ('mas_join_ffadg', '安徽省分行', 'mas_join_34124', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'ffadg');
INSERT INTO `sys_org_info` VALUES ('mas_join_fgasdbc', '台湾省分行', 'mas_join_34124', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'fgasdbc');
INSERT INTO `sys_org_info` VALUES ('mas_join_fgasdf', '成都市分行', 'mas_join_5233454', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'fgasdf');
INSERT INTO `sys_org_info` VALUES ('mas_join_fgdasdf', '南充市分行', 'mas_join_5233454', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'fgdasdf');
INSERT INTO `sys_org_info` VALUES ('mas_join_fhadf', '香港特别行政区分行', 'mas_join_34124', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'fhadf');
INSERT INTO `sys_org_info` VALUES ('mas_join_gasdh3', '雅安市分行', 'mas_join_5233454', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'gasdh3');
INSERT INTO `sys_org_info` VALUES ('mas_join_gdsafe', '甘孜分行', 'mas_join_5233454', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'gdsafe');
INSERT INTO `sys_org_info` VALUES ('mas_join_reqggfdas', '江西省分行', 'mas_join_34124', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'reqggfdas');
INSERT INTO `sys_org_info` VALUES ('mas_join_rqreg', '北京市分行', 'mas_join_34124', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'rqreg');
INSERT INTO `sys_org_info` VALUES ('mas_join_trwt', '湖南省分行', 'mas_join_34124', '0', 'mas', '2017-03-14', '2017-03-14', 'admin', 'admin', 'trwt');
INSERT INTO `sys_org_info` VALUES ('test_join_test', 'Test', 'root_vertex_system', '0', 'test', '2017-04-06', '2017-04-06', 'admin', 'admin', 'test');
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
INSERT INTO `sys_resource_info` VALUES ('0200000000', '监控报警管理', '0', '-1', '0', null);
INSERT INTO `sys_resource_info` VALUES ('0201000000', '维度信息管理', '0', '0200000000', '4', null);
INSERT INTO `sys_resource_info` VALUES ('0201010000', '责任中心', '1', '0201000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0201030000', '费用方向', '1', '0201000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0201040000', '动因信息', '1', '0201000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0201060000', '成本池信息', '1', '0201000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0202000000', '规则定义管理', '0', '0200000000', '4', null);
INSERT INTO `sys_resource_info` VALUES ('0202010000', '静态规则配置', '1', '0202000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0202020000', '分摊规则', '1', '0202000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0202040000', '规则组配置', '1', '0202000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0203000000', '批次综合管理', '0', '0200000000', '4', null);
INSERT INTO `sys_resource_info` VALUES ('0203010000', '批次管理', '1', '0203000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0203020000', '批次历史信息', '1', '0203000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0203030000', '分摊追溯', '1', '0203000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0203040000', '费用查询', '1', '0203000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0203050000', '动因查询', '1', '0203000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0300000000', '日志管理系统', '0', '-1', '0', null);
INSERT INTO `sys_resource_info` VALUES ('0301000000', '曲线与规则', '0', '0300000000', '4', null);
INSERT INTO `sys_resource_info` VALUES ('0301010000', '曲线定义', '1', '0301000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0301020000', '曲线管理', '1', '0301000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0301050000', '定价规则', '1', '0301000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0302000000', '调节项管理', '0', '0300000000', '4', null);
INSERT INTO `sys_resource_info` VALUES ('0302010000', '内生性调节项', '1', '0302000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0302020000', '政策性调节项', '1', '0302000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0302030000', '过滤器配置管理', '1', '0302000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0303000000', '批次管理', '0', '0300000000', '4', null);
INSERT INTO `sys_resource_info` VALUES ('0303010000', '单笔试算', '1', '0303000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0303020000', '批次配置', '1', '0303000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0303030000', '批次历史', '1', '0303000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0400000000', '工程版本更新', '0', '-1', '0', null);
INSERT INTO `sys_resource_info` VALUES ('0401000000', '条线信息配置管理', '1', '0400000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0402000000', '产品信息配置管理', '1', '0400000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0403000000', '科目信息配置管理', '1', '0400000000', '1', null);
INSERT INTO `sys_resource_info` VALUES ('0404000000', '币种信息配置管理', '1', '0400000000', '1', null);
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
INSERT INTO `sys_role_info` VALUES ('devops_product_join_ftpadmin', 'FTP管理员角色', 'admin', '2017-03-21 09:43:36', '0', 'devops_product', '2017-03-21 09:43:36', 'admin', 'ftpadmin');
INSERT INTO `sys_role_info` VALUES ('mas_join_cademo', '成本分摊演示角色', 'admin', '2017-03-07 10:36:45', '0', 'mas', '2017-03-07 10:36:45', 'admin', 'cademo');
INSERT INTO `sys_role_info` VALUES ('mas_join_ftpdemo', '内部资金转移定价演示角色', 'admin', '2017-03-07 10:36:59', '0', 'mas', '2017-03-07 10:36:59', 'admin', 'ftpdemo');
INSERT INTO `sys_role_info` VALUES ('mas_join_masadmin', '管理会计管理员', 'admin', '2017-03-14 14:44:34', '0', 'mas', '2017-03-14 14:44:34', 'admin', 'masadmin');
INSERT INTO `sys_role_info` VALUES ('test_join_test1', 'Test1', 'admin', '2017-04-06 13:48:53', '0', 'test', '2017-04-06 13:48:53', 'admin', 'test1');
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
INSERT INTO `sys_role_resource_relat` VALUES ('0e9c6d37-094c-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0203050000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f65406b-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0201000000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f655305-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0201040000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f656609-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0203000000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f657dda-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0201030000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f65938e-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0203020000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f65a7da-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0203010000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f65bc56-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0203030000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f65d3c9-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0202000000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f671952-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0202010000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f672d27-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0202020000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f6753eb-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0202040000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f676552-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0203040000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f678912-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0200000000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f679a9f-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0201010000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f67bbf4-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', '0201060000');
INSERT INTO `sys_role_resource_relat` VALUES ('0f931a5a-07f2-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105040100');
INSERT INTO `sys_role_resource_relat` VALUES ('0fed7044-024a-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0301000000');
INSERT INTO `sys_role_resource_relat` VALUES ('15498bd1-02df-11e7-9b60-a0c58951c8d5', 'mas_join_ftpdemo', '0302000000');
INSERT INTO `sys_role_resource_relat` VALUES ('15499deb-02df-11e7-9b60-a0c58951c8d5', 'mas_join_ftpdemo', '0303000000');
INSERT INTO `sys_role_resource_relat` VALUES ('1549b2c0-02df-11e7-9b60-a0c58951c8d5', 'mas_join_ftpdemo', '0301020000');
INSERT INTO `sys_role_resource_relat` VALUES ('1549c489-02df-11e7-9b60-a0c58951c8d5', 'mas_join_ftpdemo', '0302030000');
INSERT INTO `sys_role_resource_relat` VALUES ('1549da33-02df-11e7-9b60-a0c58951c8d5', 'mas_join_ftpdemo', '0303010000');
INSERT INTO `sys_role_resource_relat` VALUES ('1549ebe7-02df-11e7-9b60-a0c58951c8d5', 'mas_join_ftpdemo', '0303020000');
INSERT INTO `sys_role_resource_relat` VALUES ('1549ff00-02df-11e7-9b60-a0c58951c8d5', 'mas_join_ftpdemo', '0301000000');
INSERT INTO `sys_role_resource_relat` VALUES ('154a0c8d-02df-11e7-9b60-a0c58951c8d5', 'mas_join_ftpdemo', '0302010000');
INSERT INTO `sys_role_resource_relat` VALUES ('154a1a9e-02df-11e7-9b60-a0c58951c8d5', 'mas_join_ftpdemo', '0303030000');
INSERT INTO `sys_role_resource_relat` VALUES ('154a2a7c-02df-11e7-9b60-a0c58951c8d5', 'mas_join_ftpdemo', '0300000000');
INSERT INTO `sys_role_resource_relat` VALUES ('154a62a2-02df-11e7-9b60-a0c58951c8d5', 'mas_join_ftpdemo', '0302020000');
INSERT INTO `sys_role_resource_relat` VALUES ('154a7233-02df-11e7-9b60-a0c58951c8d5', 'mas_join_ftpdemo', '0301050000');
INSERT INTO `sys_role_resource_relat` VALUES ('17994440-024c-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0303030000');
INSERT INTO `sys_role_resource_relat` VALUES ('19c75114-0248-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0202020000');
INSERT INTO `sys_role_resource_relat` VALUES ('1bdeaba6-07e9-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103010100');
INSERT INTO `sys_role_resource_relat` VALUES ('1bf28a08-07e7-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103020400');
INSERT INTO `sys_role_resource_relat` VALUES ('1c3118cc-07e2-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103030400');
INSERT INTO `sys_role_resource_relat` VALUES ('25167037-07f2-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105040200');
INSERT INTO `sys_role_resource_relat` VALUES ('32cfc9e5-0ba4-11e7-9649-a0c58951c8d5', 'mas_join_cademo', '0401000000');
INSERT INTO `sys_role_resource_relat` VALUES ('32cfe510-0ba4-11e7-9649-a0c58951c8d5', 'mas_join_cademo', '0402000000');
INSERT INTO `sys_role_resource_relat` VALUES ('32cff514-0ba4-11e7-9649-a0c58951c8d5', 'mas_join_cademo', '0403000000');
INSERT INTO `sys_role_resource_relat` VALUES ('32d00969-0ba4-11e7-9649-a0c58951c8d5', 'mas_join_cademo', '0404000000');
INSERT INTO `sys_role_resource_relat` VALUES ('32d0a0f2-0ba4-11e7-9649-a0c58951c8d5', 'mas_join_cademo', '0400000000');
INSERT INTO `sys_role_resource_relat` VALUES ('33bb66bb-07e9-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103010200');
INSERT INTO `sys_role_resource_relat` VALUES ('3d23d85e-07e7-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103020500');
INSERT INTO `sys_role_resource_relat` VALUES ('43ad40d2-07f1-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020510');
INSERT INTO `sys_role_resource_relat` VALUES ('4704352b-0acc-11e7-998e-a0c58951c8d5', 'mas_join_masadmin', '1100000000');
INSERT INTO `sys_role_resource_relat` VALUES ('470450e2-0acc-11e7-998e-a0c58951c8d5', 'mas_join_masadmin', '1101000000');
INSERT INTO `sys_role_resource_relat` VALUES ('4704667c-0acc-11e7-998e-a0c58951c8d5', 'mas_join_masadmin', '1102000000');
INSERT INTO `sys_role_resource_relat` VALUES ('47047a55-0acc-11e7-998e-a0c58951c8d5', 'mas_join_masadmin', '1103000000');
INSERT INTO `sys_role_resource_relat` VALUES ('47048c2b-0acc-11e7-998e-a0c58951c8d5', 'mas_join_masadmin', '1101010000');
INSERT INTO `sys_role_resource_relat` VALUES ('48463b39-07e9-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103010300');
INSERT INTO `sys_role_resource_relat` VALUES ('48fb522e-04a4-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0301010000');
INSERT INTO `sys_role_resource_relat` VALUES ('50482835-0247-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0201030000');
INSERT INTO `sys_role_resource_relat` VALUES ('53c399c4-024c-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0302030000');
INSERT INTO `sys_role_resource_relat` VALUES ('5479d2da-0246-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0200000000');
INSERT INTO `sys_role_resource_relat` VALUES ('5a7db1f7-07f1-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020520');
INSERT INTO `sys_role_resource_relat` VALUES ('5c60bc08-024b-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0301050000');
INSERT INTO `sys_role_resource_relat` VALUES ('66e57a22-0248-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0202040000');
INSERT INTO `sys_role_resource_relat` VALUES ('6bb7e04d-07e9-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103010400');
INSERT INTO `sys_role_resource_relat` VALUES ('72939327-024b-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0302000000');
INSERT INTO `sys_role_resource_relat` VALUES ('76e8be09-07e5-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0101010100');
INSERT INTO `sys_role_resource_relat` VALUES ('776b1d4b-024c-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '1101000000');
INSERT INTO `sys_role_resource_relat` VALUES ('7929becd-0247-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0201040000');
INSERT INTO `sys_role_resource_relat` VALUES ('7d73294c-07ec-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105010100');
INSERT INTO `sys_role_resource_relat` VALUES ('8009b52c-0ba4-11e7-9649-a0c58951c8d5', 'mas_join_cademo', '0203050000');
INSERT INTO `sys_role_resource_relat` VALUES ('8024c16b-07d8-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0104010300');
INSERT INTO `sys_role_resource_relat` VALUES ('824c1f28-04a3-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0400000000');
INSERT INTO `sys_role_resource_relat` VALUES ('83794268-024b-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0302010000');
INSERT INTO `sys_role_resource_relat` VALUES ('841c2ccd-0246-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0201000000');
INSERT INTO `sys_role_resource_relat` VALUES ('8a1979e2-0248-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0203010000');
INSERT INTO `sys_role_resource_relat` VALUES ('8ca4f732-07e5-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0101010200');
INSERT INTO `sys_role_resource_relat` VALUES ('9466d2dc-07d5-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0104010200');
INSERT INTO `sys_role_resource_relat` VALUES ('9490d276-024a-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '1100000000');
INSERT INTO `sys_role_resource_relat` VALUES ('970569ee-07d8-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0104010400');
INSERT INTO `sys_role_resource_relat` VALUES ('974d1286-07ec-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105010200');
INSERT INTO `sys_role_resource_relat` VALUES ('9bf2e6b3-0246-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0202000000');
INSERT INTO `sys_role_resource_relat` VALUES ('9e79cb72-024b-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0302020000');
INSERT INTO `sys_role_resource_relat` VALUES ('a2658092-07ed-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020100');
INSERT INTO `sys_role_resource_relat` VALUES ('a2a01355-07e5-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0101010300');
INSERT INTO `sys_role_resource_relat` VALUES ('a8320586-0248-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0203020000');
INSERT INTO `sys_role_resource_relat` VALUES ('ad3e53ed-07d8-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0104010500');
INSERT INTO `sys_role_resource_relat` VALUES ('ad96ffe8-0992-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0101010000');
INSERT INTO `sys_role_resource_relat` VALUES ('ad97168e-0992-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0101010100');
INSERT INTO `sys_role_resource_relat` VALUES ('ad972957-0992-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0101010300');
INSERT INTO `sys_role_resource_relat` VALUES ('ad973d01-0992-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0101000000');
INSERT INTO `sys_role_resource_relat` VALUES ('ad974e5b-0992-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0101010200');
INSERT INTO `sys_role_resource_relat` VALUES ('b096b467-024b-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0303000000');
INSERT INTO `sys_role_resource_relat` VALUES ('b142aabf-0246-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0203000000');
INSERT INTO `sys_role_resource_relat` VALUES ('b257854d-04a3-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0401000000');
INSERT INTO `sys_role_resource_relat` VALUES ('b5801636-07ec-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105010300');
INSERT INTO `sys_role_resource_relat` VALUES ('b687b293-024a-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0301020000');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ca0b31-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103010300');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ca200b-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103010400');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ca36e4-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103010500');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ca480f-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105010600');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ca5c0b-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103010000');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ca9a8f-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105020520');
INSERT INTO `sys_role_resource_relat` VALUES ('b6caa8cf-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105040100');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cab506-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103030200');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cac00f-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103000000');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cad202-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103020000');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cae5b5-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103020400');
INSERT INTO `sys_role_resource_relat` VALUES ('b6caf864-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105010200');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cc6dcb-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105010100');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cc8746-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105020400');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cc9c46-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105000000');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ccae31-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103020200');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ccbf4f-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0104010100');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ccd5ad-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0104010200');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ccf9f1-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0104010300');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cd0a06-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105010300');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cd1c82-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105020510');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cd3017-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105010400');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cd4386-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105040200');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cd66f5-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0104010000');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cd7506-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103010100');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cd8439-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103020500');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cd9375-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105020100');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cda1f9-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105020500');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cdb0d7-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103030100');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cdc093-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103030300');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cdccfe-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105010000');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cddc28-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103010200');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cdea17-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103020100');
INSERT INTO `sys_role_resource_relat` VALUES ('b6cdfb93-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0104010500');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ce08d7-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103030400');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ce14f1-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0104010400');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ce228f-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105010500');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ce2ded-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105020200');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ce39b5-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105020300');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ce49b5-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0100000000');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ce568f-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105020000');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ce6475-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0105040000');
INSERT INTO `sys_role_resource_relat` VALUES ('b6ce7217-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', '0103020300');
INSERT INTO `sys_role_resource_relat` VALUES ('b8df3b71-07e9-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103010500');
INSERT INTO `sys_role_resource_relat` VALUES ('ba1baad1-0249-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0300000000');
INSERT INTO `sys_role_resource_relat` VALUES ('bd267b0e-07ed-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020200');
INSERT INTO `sys_role_resource_relat` VALUES ('c1177dbf-07e1-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103030100');
INSERT INTO `sys_role_resource_relat` VALUES ('c35cb2d1-0248-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0203030000');
INSERT INTO `sys_role_resource_relat` VALUES ('c3baf059-07ee-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020500');
INSERT INTO `sys_role_resource_relat` VALUES ('c3ecdb6c-1a8c-11e7-b57a-525400ec396c', 'test_join_test1', '1100000000');
INSERT INTO `sys_role_resource_relat` VALUES ('c3ed325d-1a8c-11e7-b57a-525400ec396c', 'test_join_test1', '1101000000');
INSERT INTO `sys_role_resource_relat` VALUES ('c3ed7ffe-1a8c-11e7-b57a-525400ec396c', 'test_join_test1', '1102000000');
INSERT INTO `sys_role_resource_relat` VALUES ('c3edc892-1a8c-11e7-b57a-525400ec396c', 'test_join_test1', '1103000000');
INSERT INTO `sys_role_resource_relat` VALUES ('c3ee0de7-1a8c-11e7-b57a-525400ec396c', 'test_join_test1', '1101010000');
INSERT INTO `sys_role_resource_relat` VALUES ('c8650311-024b-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0303010000');
INSERT INTO `sys_role_resource_relat` VALUES ('c93c6302-0247-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0201060000');
INSERT INTO `sys_role_resource_relat` VALUES ('c988dc67-07ec-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105010400');
INSERT INTO `sys_role_resource_relat` VALUES ('cb4b16fb-04a3-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0402000000');
INSERT INTO `sys_role_resource_relat` VALUES ('cf420a8e-0991-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '1102000000');
INSERT INTO `sys_role_resource_relat` VALUES ('d517d48d-07ed-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020300');
INSERT INTO `sys_role_resource_relat` VALUES ('d6746779-0ba4-11e7-9649-a0c58951c8d5', 'mas_join_ftpdemo', '0301010000');
INSERT INTO `sys_role_resource_relat` VALUES ('d89f256d-0991-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '1103000000');
INSERT INTO `sys_role_resource_relat` VALUES ('d8fd37ed-07e1-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103030200');
INSERT INTO `sys_role_resource_relat` VALUES ('daae0b92-07e6-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103020100');
INSERT INTO `sys_role_resource_relat` VALUES ('dbaf4cc1-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105010200');
INSERT INTO `sys_role_resource_relat` VALUES ('dbaf6401-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0104010000');
INSERT INTO `sys_role_resource_relat` VALUES ('dbaf77a3-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0101010300');
INSERT INTO `sys_role_resource_relat` VALUES ('dbaf8930-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103020300');
INSERT INTO `sys_role_resource_relat` VALUES ('dbaf991b-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103020500');
INSERT INTO `sys_role_resource_relat` VALUES ('dbafaae3-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0104010100');
INSERT INTO `sys_role_resource_relat` VALUES ('dbafbc30-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0104010200');
INSERT INTO `sys_role_resource_relat` VALUES ('dbafce38-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0104010500');
INSERT INTO `sys_role_resource_relat` VALUES ('dbafdeca-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105020200');
INSERT INTO `sys_role_resource_relat` VALUES ('dbaff192-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105020500');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb01efd-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0101010000');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb03370-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105040000');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb0424a-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103020400');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb0533d-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0104010300');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb063b8-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105010100');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb07456-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105010300');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb0868e-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105020100');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb098db-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105010000');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb0b6bd-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103030200');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb0c8d6-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103030400');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb0d7e7-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103020000');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb0e45f-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103010100');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb0f052-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103010400');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb0ff4a-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105020400');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb10c30-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103030300');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb1182c-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105020000');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb12cdb-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0101010100');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb14505-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103010200');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb265ac-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103010300');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb27678-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105010500');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb2a54e-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105020300');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb2bf78-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105020520');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb2dbb4-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103030100');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb2e9c5-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0100000000');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb2f83d-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105000000');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb30885-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103010000');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb322ca-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103020100');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb33adf-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105010400');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb3539b-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105010600');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb36bf8-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105040200');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb38238-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0104010400');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb399f4-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105040100');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb3b16c-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0101000000');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb3c901-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103000000');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb3ddce-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0101010200');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb3f538-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103010500');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb40745-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0103020200');
INSERT INTO `sys_role_resource_relat` VALUES ('dbb41aa7-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0105020510');
INSERT INTO `sys_role_resource_relat` VALUES ('dd816233-0248-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0203040000');
INSERT INTO `sys_role_resource_relat` VALUES ('de1cb9ac-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0302010000');
INSERT INTO `sys_role_resource_relat` VALUES ('de1cc9db-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0302020000');
INSERT INTO `sys_role_resource_relat` VALUES ('de1cdeac-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0303010000');
INSERT INTO `sys_role_resource_relat` VALUES ('de1ceebd-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0303030000');
INSERT INTO `sys_role_resource_relat` VALUES ('de1d0156-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0301010000');
INSERT INTO `sys_role_resource_relat` VALUES ('de1d1241-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0301020000');
INSERT INTO `sys_role_resource_relat` VALUES ('de1d251f-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0301050000');
INSERT INTO `sys_role_resource_relat` VALUES ('de1d37b4-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0303000000');
INSERT INTO `sys_role_resource_relat` VALUES ('de1d5a63-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0302030000');
INSERT INTO `sys_role_resource_relat` VALUES ('de1d7705-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0303020000');
INSERT INTO `sys_role_resource_relat` VALUES ('de1d8e56-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0300000000');
INSERT INTO `sys_role_resource_relat` VALUES ('de1d9eb4-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0301000000');
INSERT INTO `sys_role_resource_relat` VALUES ('de1db1a3-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', '0302000000');
INSERT INTO `sys_role_resource_relat` VALUES ('e61931f7-04a3-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0403000000');
INSERT INTO `sys_role_resource_relat` VALUES ('ea23a4e6-07ed-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105020400');
INSERT INTO `sys_role_resource_relat` VALUES ('ec5e6b47-07ec-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0105010500');
INSERT INTO `sys_role_resource_relat` VALUES ('ecfe2317-024b-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0303020000');
INSERT INTO `sys_role_resource_relat` VALUES ('ee768238-07e6-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '0103020200');
INSERT INTO `sys_role_resource_relat` VALUES ('f02c157f-0247-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0202010000');
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
INSERT INTO `sys_role_resource_relat` VALUES ('f6a653e9-04a3-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0404000000');
INSERT INTO `sys_role_resource_relat` VALUES ('f87aad5f-0991-11e7-952f-a0c58951c8d5', 'vertex_root_join_sysadmin', '1101010000');
INSERT INTO `sys_role_resource_relat` VALUES ('fb945e39-0246-11e7-9b60-a0c58951c8d5', 'vertex_root_join_sysadmin', '0201010000');
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
INSERT INTO `sys_role_user_relation` VALUES ('19890228hzwy23', 'vertex_root_join_sysadmin', 'admin', '2000-01-01', 'hzwy23');
INSERT INTO `sys_role_user_relation` VALUES ('3b82e786-0ba4-11e7-9649-a0c58951c8d5', 'mas_join_cademo', 'test1', '2017-03-18', 'admin');
INSERT INTO `sys_role_user_relation` VALUES ('585a0307-02df-11e7-9b60-a0c58951c8d5', 'mas_join_cademo', 'yangpanhong', '2017-03-07', 'admin');
INSERT INTO `sys_role_user_relation` VALUES ('6198fb70-0ba4-11e7-9649-a0c58951c8d5', 'mas_join_ftpdemo', 'test1', '2017-03-18', 'admin');
INSERT INTO `sys_role_user_relation` VALUES ('adaced2e-0ba4-11e7-9649-a0c58951c8d5', 'mas_join_cademo', 'caadmin', '2017-03-18', 'admin');
INSERT INTO `sys_role_user_relation` VALUES ('b0190d77-0ba4-11e7-9649-a0c58951c8d5', 'mas_join_ftpdemo', 'caadmin', '2017-03-18', 'admin');
INSERT INTO `sys_role_user_relation` VALUES ('c9261d69-0881-11e7-952f-a0c58951c8d5', 'mas_join_masadmin', 'demo', '2017-03-14', 'admin');
INSERT INTO `sys_role_user_relation` VALUES ('d23d9a5c-1a8c-11e7-b57a-525400ec396c', 'test_join_test1', 'yangji', '2017-04-06', 'admin');
INSERT INTO `sys_role_user_relation` VALUES ('d4c05a05-0dd7-11e7-9612-a0c58951c8d5', 'devops_product_join_ftpadmin', 'ftpadmin', '2017-03-21', 'admin');

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
INSERT INTO `sys_sec_user` VALUES ('caadmin', 'CguSVgQY2Df4LxG0UT/xwA==', '0', '0');
INSERT INTO `sys_sec_user` VALUES ('demo', 'CguSVgQY2Df4LxG0UT/xwA==', '0', '0');
INSERT INTO `sys_sec_user` VALUES ('ftpadmin', 'CguSVgQY2Df4LxG0UT/xwA==', '0', '0');
INSERT INTO `sys_sec_user` VALUES ('test1', 'CguSVgQY2Df4LxG0UT/xwA==', '0', '0');
INSERT INTO `sys_sec_user` VALUES ('test10', 'CguSVgQY2Df4LxG0UT/xwA==', '0', null);
INSERT INTO `sys_sec_user` VALUES ('test11', 'CguSVgQY2Df4LxG0UT/xwA==', '0', null);
INSERT INTO `sys_sec_user` VALUES ('test12', 'CguSVgQY2Df4LxG0UT/xwA==', '0', null);
INSERT INTO `sys_sec_user` VALUES ('test13', 'CguSVgQY2Df4LxG0UT/xwA==', '0', null);
INSERT INTO `sys_sec_user` VALUES ('test14', 'CguSVgQY2Df4LxG0UT/xwA==', '0', null);
INSERT INTO `sys_sec_user` VALUES ('test2', 'CguSVgQY2Df4LxG0UT/xwA==', '0', null);
INSERT INTO `sys_sec_user` VALUES ('test3', 'CguSVgQY2Df4LxG0UT/xwA==', '0', null);
INSERT INTO `sys_sec_user` VALUES ('test4', 'CguSVgQY2Df4LxG0UT/xwA==', '0', null);
INSERT INTO `sys_sec_user` VALUES ('test5', 'CguSVgQY2Df4LxG0UT/xwA==', '0', null);
INSERT INTO `sys_sec_user` VALUES ('test6', 'CguSVgQY2Df4LxG0UT/xwA==', '0', null);
INSERT INTO `sys_sec_user` VALUES ('test7', 'CguSVgQY2Df4LxG0UT/xwA==', '0', null);
INSERT INTO `sys_sec_user` VALUES ('test8', 'CguSVgQY2Df4LxG0UT/xwA==', '0', null);
INSERT INTO `sys_sec_user` VALUES ('test9', 'CguSVgQY2Df4LxG0UT/xwA==', '0', null);
INSERT INTO `sys_sec_user` VALUES ('yangji', '+VJVDAAdme29eZ2D8CCDYQ==', '0', '0');
INSERT INTO `sys_sec_user` VALUES ('yangpanhong', 'CguSVgQY2Df4LxG0UT/xwA==', '0', '0');

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
INSERT INTO `sys_theme_value` VALUES ('0e9aec3f-094c-11e7-952f-a0c58951c8d5', '1001', '0203050000', '/v1/ca/driver/manage/page', '1', '#6caeb3', 'tile', '3', '/static/images/ca_icon/driver_query.png', '5');
INSERT INTO `sys_theme_value` VALUES ('0f9303e2-07f2-11e7-952f-a0c58951c8d5', '1001', '0105040100', '/v1/auth/user/roles/auth', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('1001-0100000000', '1001', '0100000000', './views/hauth/theme/default/sysconfig.tpl', '0', '#FF6600', 'tile tile-wide', '1', '/static/theme/default/img/system.png', '1');
INSERT INTO `sys_theme_value` VALUES ('1001-0101010000', '1001', '0101010000', '/v1/auth/HandleLogsPage', '1', '#336699', 'tile tile-large', '3', '/static/theme/default/img/logs_shen.png', '1');
INSERT INTO `sys_theme_value` VALUES ('1001-0103010000', '1001', '0103010000', '/v1/auth/resource/page', '1', '#666699', 'tile', '1', '/static/theme/default/img/menus.png', '3');
INSERT INTO `sys_theme_value` VALUES ('1001-0103020000', '1001', '0103020000', '/v1/auth/resource/org/page', '1', '#FF6666', 'tile', '1', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('1001-0104010000', '1001', '0104010000', '/v1/auth/domain/page', '1', '#0099CC', 'tile tile-wide', '1', '/static/theme/default/img/domain.png', '1');
INSERT INTO `sys_theme_value` VALUES ('1001-0105010000', '1001', '0105010000', '/v1/auth/user/page', '1', '#CC6600', 'tile tile-wide', '2', '/static/theme/default/img/user_manager.png', '1');
INSERT INTO `sys_theme_value` VALUES ('1001-0105020000', '1001', '0105020000', '/v1/auth/role/page', '1', '#FFCC33', 'tile', '2', '/static/theme/default/img/role_manager.png', '2');
INSERT INTO `sys_theme_value` VALUES ('1001-0105040000', '1001', '0105040000', '/v1/auth/batch/page', '1', '#339999', 'tile', '2', '/static/theme/default/img/grant.png', '4');
INSERT INTO `sys_theme_value` VALUES ('1797ac80-024c-11e7-9b60-a0c58951c8d5', '1001', '0303030000', '/v1/ftp/dispatch/history/page', '1', '#009999', 'tile', '3', '/static/theme/default/img/org.png', '3');
INSERT INTO `sys_theme_value` VALUES ('19c73fba-0248-11e7-9b60-a0c58951c8d5', '1001', '0202020000', '/v1/ca/amart/rules/page', '1', '#58c0b3', 'tile tile-wide', '2', '/static/images/ca_icon/amart_rules.png', '2');
INSERT INTO `sys_theme_value` VALUES ('1bde8991-07e9-11e7-952f-a0c58951c8d5', '1001', '0103010100', '/v1/auth/resource/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('1bf270aa-07e7-11e7-952f-a0c58951c8d5', '1001', '0103020400', '/v1/auth/resource/org/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('1c30f988-07e2-11e7-952f-a0c58951c8d5', '1001', '0103030400', '/v1/auth/domain/share/put', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('25165700-07f2-11e7-952f-a0c58951c8d5', '1001', '0105040200', '/v1/auth/user/roles/revoke', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('33b9cb0c-07e9-11e7-952f-a0c58951c8d5', '1001', '0103010200', '/v1/auth/resource/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('3d237ba7-07e7-11e7-952f-a0c58951c8d5', '1001', '0103020500', '/v1/auth/resource/org/download', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('43ad2a9a-07f1-11e7-952f-a0c58951c8d5', '1001', '0105020510', '/v1/auth/role/resource/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('48460086-07e9-11e7-952f-a0c58951c8d5', '1001', '0103010300', '/v1/auth/resource/update', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('48fb4303-04a4-11e7-9b60-a0c58951c8d5', '1001', '0301010000', '/v1/ftp/curve/define/page', '1', '#666699', 'tile', '1', '/static/theme/default/img/org.png', '1');
INSERT INTO `sys_theme_value` VALUES ('5046d07a-0247-11e7-9b60-a0c58951c8d5', '1001', '0201030000', '/v1/ca/cost/direction/page', '1', '#6faccd', 'tile', '1', '/static/images/ca_icon/cost_direction.png', '3');
INSERT INTO `sys_theme_value` VALUES ('53c3813f-024c-11e7-9b60-a0c58951c8d5', '1001', '0302030000', '/v1/ftp/filter/define/page', '1', '#FFCC33', 'tile tile-wide', '2', '/static/theme/default/img/org.png', '1');
INSERT INTO `sys_theme_value` VALUES ('54786c62-0246-11e7-9b60-a0c58951c8d5', '1001', '0200000000', './views/ca/ca.tpl', '0', '#666699', 'tile tile-wide', '2', '/static/theme/default/img/grant.png', '1');
INSERT INTO `sys_theme_value` VALUES ('5a7d8dbf-07f1-11e7-952f-a0c58951c8d5', '1001', '0105020520', '/v1/auth/role/resource/rights', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('5c60abdd-024b-11e7-9b60-a0c58951c8d5', '1001', '0301050000', '/v1/ftp/rules/manage/page', '1', '#99CC33', 'tile tile-wide', '1', '/static/theme/default/img/org.png', '3');
INSERT INTO `sys_theme_value` VALUES ('624b90c0-0278-11e7-9b60-a0c58951c8d5', '1002', '0101010000', '/v1/auth/HandleLogsPage', '1', '#339999', 'tile tile-wide', '3', '/static/theme/default/img/logs_shen.png', '1');
INSERT INTO `sys_theme_value` VALUES ('66e55e26-0248-11e7-9b60-a0c58951c8d5', '1001', '0202040000', '/v1/ca/amart/group/page', '1', '#ded1b0', 'tile tile-wide', '2', '/static/images/ca_icon/group_rules.png', '4');
INSERT INTO `sys_theme_value` VALUES ('6bb7b2c8-07e9-11e7-952f-a0c58951c8d5', '1001', '0103010400', '/v1/auth/resource/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('76e895cd-07e5-11e7-952f-a0c58951c8d5', '1001', '0101010100', '/v1/auth/handle/logs', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('7929aa2b-0247-11e7-9b60-a0c58951c8d5', '1001', '0201040000', '/v1/ca/driver/page', '1', '#b4d39e', 'tile', '1', '/static/images/ca_icon/driver_info.png', '4');
INSERT INTO `sys_theme_value` VALUES ('7d73058c-07ec-11e7-952f-a0c58951c8d5', '1001', '0105010100', '/v1/auth/user/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('8024ac09-07d8-11e7-952f-a0c58951c8d5', '1001', '0104010300', '/v1/auth/domain/update', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('824c0d97-04a3-11e7-9b60-a0c58951c8d5', '1001', '0400000000', './views/common/dimension.tpl', '0', '#FFCC33', 'tile tile-large', '3', '/static/theme/default/img/system.png', '1');
INSERT INTO `sys_theme_value` VALUES ('83792fdb-024b-11e7-9b60-a0c58951c8d5', '1001', '0302010000', '/v1/ftp/adjust/inner/page', '1', '#0099CC', 'tile', '2', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('8a180b66-0248-11e7-9b60-a0c58951c8d5', '1001', '0203010000', '/v1/ca/dispatch/page', '1', '#ed9f86', 'tile tile-wide', '3', '/static/images/ca_icon/dispatch_manage.png', '1');
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
INSERT INTO `sys_theme_value` VALUES ('991652b2-0d55-11e7-964b-a0c58951c8d5', '1004', '0200000000', './views/ca/ca.tpl', '0', '#666699', 'tile tile-wide', '2', '/static/theme/default/img/grant.png', '1');
INSERT INTO `sys_theme_value` VALUES ('9916534b-0d55-11e7-964b-a0c58951c8d5', '1004', '0201010000', '/v1/ca/responsibility/page', '1', '#6fc07c', 'tile tile-wide', '1', '/static/images/ca_icon/org_info.png', '1');
INSERT INTO `sys_theme_value` VALUES ('9916545c-0d55-11e7-964b-a0c58951c8d5', '1004', '0201030000', '/v1/ca/cost/direction/page', '1', '#6faccd', 'tile', '1', '/static/images/ca_icon/cost_direction.png', '3');
INSERT INTO `sys_theme_value` VALUES ('991654be-0d55-11e7-964b-a0c58951c8d5', '1004', '0201040000', '/v1/ca/driver/page', '1', '#b4d39e', 'tile', '1', '/static/images/ca_icon/driver_info.png', '4');
INSERT INTO `sys_theme_value` VALUES ('991657d4-0d55-11e7-964b-a0c58951c8d5', '1004', '0201060000', '/v1/ca/cost/page', '1', '#e4d690', 'tile tile-wide', '1', '/static/images/ca_icon/cost_pool.png', '6');
INSERT INTO `sys_theme_value` VALUES ('9916933a-0d55-11e7-964b-a0c58951c8d5', '1004', '0202010000', '/v1/ca/static/radio/page', '1', '#92cdd2', 'tile tile-wide', '2', '/static/images/ca_icon/static_rules.png', '1');
INSERT INTO `sys_theme_value` VALUES ('9917f369-0d55-11e7-964b-a0c58951c8d5', '1004', '0202020000', '/v1/ca/amart/rules/page', '1', '#58c0b3', 'tile tile-wide', '2', '/static/images/ca_icon/amart_rules.png', '2');
INSERT INTO `sys_theme_value` VALUES ('9917f42d-0d55-11e7-964b-a0c58951c8d5', '1004', '0202040000', '/v1/ca/amart/group/page', '1', '#ded1b0', 'tile tile-wide', '2', '/static/images/ca_icon/group_rules.png', '4');
INSERT INTO `sys_theme_value` VALUES ('9917f48b-0d55-11e7-964b-a0c58951c8d5', '1004', '0203010000', '/v1/ca/dispatch/page', '1', '#ed9f86', 'tile tile-wide', '3', '/static/images/ca_icon/dispatch_manage.png', '1');
INSERT INTO `sys_theme_value` VALUES ('9917f4cb-0d55-11e7-964b-a0c58951c8d5', '1004', '0203020000', '/v1/ca/dispatch/history/page', '1', '#b4d7de', 'tile', '3', '/static/images/ca_icon/dispatch_history.png', '2');
INSERT INTO `sys_theme_value` VALUES ('9917f532-0d55-11e7-964b-a0c58951c8d5', '1004', '0203030000', '/v1/ca/amart/ascend/page', '1', '#c3b7ce', 'tile', '3', '/static/images/ca_icon/amart_query.png', '3');
INSERT INTO `sys_theme_value` VALUES ('9917f598-0d55-11e7-964b-a0c58951c8d5', '1004', '0203040000', '/v1/ca/cost/manage/page', '1', '#f2cbaf', 'tile', '3', '/static/images/ca_icon/cost_query.png', '4');
INSERT INTO `sys_theme_value` VALUES ('9917f676-0d55-11e7-964b-a0c58951c8d5', '1004', '0300000000', './views/ftp/theme/cyan/ftp.tpl', '0', '#009999', 'tile tile-wide', '2', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('9917f6e5-0d55-11e7-964b-a0c58951c8d5', '1004', '1100000000', './views/help/cyan/syshelp.tpl', '0', '#0099CC', 'tile tile-wide', '1', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('9917f743-0d55-11e7-964b-a0c58951c8d5', '1004', '0301020000', '/v1/ftp/curve/manage/page', '1', '#336699', 'tile', '1', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('9917f7ba-0d55-11e7-964b-a0c58951c8d5', '1004', '0301050000', '/v1/ftp/rules/manage/page', '1', '#99CC33', 'tile tile-wide', '1', '/static/theme/default/img/org.png', '3');
INSERT INTO `sys_theme_value` VALUES ('9917f818-0d55-11e7-964b-a0c58951c8d5', '1004', '0302010000', '/v1/ftp/adjust/inner/page', '1', '#0099CC', 'tile', '2', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('9917f869-0d55-11e7-964b-a0c58951c8d5', '1004', '0302020000', '/v1/ftp/adjust/outer/page', '1', '#CC6600', 'tile', '2', '/static/theme/default/img/org.png', '3');
INSERT INTO `sys_theme_value` VALUES ('9917f8b6-0d55-11e7-964b-a0c58951c8d5', '1004', '0303010000', '/v1/ftp/single/calc/page', '1', '#FF6666', 'tile tile-wide', '3', '/static/theme/default/img/org.png', '1');
INSERT INTO `sys_theme_value` VALUES ('99180aad-0d55-11e7-964b-a0c58951c8d5', '1004', '0303020000', '/v1/ftp/dispatch/manage/page', '1', '#009933', 'tile', '3', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('99180b3a-0d55-11e7-964b-a0c58951c8d5', '1004', '0303030000', '/v1/ftp/dispatch/history/page', '1', '#009999', 'tile', '3', '/static/theme/default/img/org.png', '3');
INSERT INTO `sys_theme_value` VALUES ('99180b7a-0d55-11e7-964b-a0c58951c8d5', '1004', '0302030000', '/v1/ftp/filter/define/page', '1', '#FFCC33', 'tile tile-wide', '2', '/static/theme/default/img/org.png', '1');
INSERT INTO `sys_theme_value` VALUES ('99180bfa-0d55-11e7-964b-a0c58951c8d5', '1004', '0400000000', './views/common/dimension.tpl', '0', '#FFCC33', 'tile tile-large', '3', '/static/theme/default/img/system.png', '1');
INSERT INTO `sys_theme_value` VALUES ('99180c36-0d55-11e7-964b-a0c58951c8d5', '1004', '0401000000', '/v1/auth/resource/org/page', '1', '#6fc07c', 'tile tile-wide', '1', '/static/images/common_icon/department.png', '1');
INSERT INTO `sys_theme_value` VALUES ('99180c72-0d55-11e7-964b-a0c58951c8d5', '1004', '0402000000', '/v1/auth/resource/org/page', '1', '#92cdd2', 'tile tile-wide', '2', '/static/images/common_icon/product.png', '1');
INSERT INTO `sys_theme_value` VALUES ('99180ca9-0d55-11e7-964b-a0c58951c8d5', '1004', '0403000000', '/v1/auth/resource/org/page', '1', '#ed9f86', 'tile tile-wide', '3', '/static/images/common_icon/gl_account.png', '1');
INSERT INTO `sys_theme_value` VALUES ('99180ced-0d55-11e7-964b-a0c58951c8d5', '1004', '0404000000', '/v1/auth/resource/org/page', '1', '#67accd', 'tile tile-wide', '1', '/static/images/common_icon/iso_currency.png', '2');
INSERT INTO `sys_theme_value` VALUES ('99180d2d-0d55-11e7-964b-a0c58951c8d5', '1004', '0301010000', '/v1/ftp/curve/define/page', '1', '#666699', 'tile', '1', '/static/theme/default/img/org.png', '1');
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
INSERT INTO `sys_theme_value` VALUES ('991815a1-0d55-11e7-964b-a0c58951c8d5', '1004', '0203050000', '/v1/ca/driver/manage/page', '1', '#6caeb3', 'tile', '3', '/static/images/ca_icon/driver_query.png', '5');
INSERT INTO `sys_theme_value` VALUES ('991815e1-0d55-11e7-964b-a0c58951c8d5', '1004', '1101010000', '/v1/help/system/help', '1', '#339999', 'tile tile-large', '1', '/static/theme/default/img/org.png', '1');
INSERT INTO `sys_theme_value` VALUES ('9e79b725-024b-11e7-9b60-a0c58951c8d5', '1001', '0302020000', '/v1/ftp/adjust/outer/page', '1', '#CC6600', 'tile', '2', '/static/theme/default/img/org.png', '3');
INSERT INTO `sys_theme_value` VALUES ('a265597d-07ed-11e7-952f-a0c58951c8d5', '1001', '0105020100', '/v1/auth/role/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('a29fba3f-07e5-11e7-952f-a0c58951c8d5', '1001', '0101010300', '/v1/auth/handle/logs/search', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('a831ec58-0248-11e7-9b60-a0c58951c8d5', '1001', '0203020000', '/v1/ca/dispatch/history/page', '1', '#b4d7de', 'tile', '3', '/static/images/ca_icon/dispatch_history.png', '2');
INSERT INTO `sys_theme_value` VALUES ('ad3e295c-07d8-11e7-952f-a0c58951c8d5', '1001', '0104010500', '/v1/auth/domain/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('b2561d1e-04a3-11e7-9b60-a0c58951c8d5', '1001', '0401000000', '/v1/auth/resource/org/page', '1', '#6fc07c', 'tile tile-wide', '1', '/static/images/common_icon/department.png', '1');
INSERT INTO `sys_theme_value` VALUES ('b58002f6-07ec-11e7-952f-a0c58951c8d5', '1001', '0105010300', '/v1/auth/user/put', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('b687a0e9-024a-11e7-9b60-a0c58951c8d5', '1001', '0301020000', '/v1/ftp/curve/manage/page', '1', '#336699', 'tile', '1', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('b8df0cd7-07e9-11e7-952f-a0c58951c8d5', '1001', '0103010500', '/v1/auth/resource/config/theme', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('ba1a252f-0249-11e7-9b60-a0c58951c8d5', '1001', '0300000000', './views/ftp/theme/default/ftp.tpl', '0', '#009999', 'tile tile-wide', '2', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('bd264fd7-07ed-11e7-952f-a0c58951c8d5', '1001', '0105020200', '/v1/auth/role/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('c1174621-07e1-11e7-952f-a0c58951c8d5', '1001', '0103030100', '/v1/auth/domain/share/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('c35ca15a-0248-11e7-9b60-a0c58951c8d5', '1001', '0203030000', '/v1/ca/amart/ascend/page', '1', '#c3b7ce', 'tile', '3', '/static/images/ca_icon/amart_query.png', '3');
INSERT INTO `sys_theme_value` VALUES ('c3bad47b-07ee-11e7-952f-a0c58951c8d5', '1001', '0105020500', '/v1/auth/role/resource/details', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('c864e93c-024b-11e7-9b60-a0c58951c8d5', '1001', '0303010000', '/v1/ftp/single/calc/page', '1', '#FF6666', 'tile tile-wide', '3', '/static/theme/default/img/org.png', '1');
INSERT INTO `sys_theme_value` VALUES ('c93c4e93-0247-11e7-9b60-a0c58951c8d5', '1001', '0201060000', '/v1/ca/cost/page', '1', '#e4d690', 'tile tile-wide', '1', '/static/images/ca_icon/cost_pool.png', '6');
INSERT INTO `sys_theme_value` VALUES ('c988bb89-07ec-11e7-952f-a0c58951c8d5', '1001', '0105010400', '/v1/auth/user/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('cb4afcc4-04a3-11e7-9b60-a0c58951c8d5', '1001', '0402000000', '/v1/auth/resource/org/page', '1', '#92cdd2', 'tile tile-wide', '2', '/static/images/common_icon/product.png', '1');
INSERT INTO `sys_theme_value` VALUES ('d517aab8-07ed-11e7-952f-a0c58951c8d5', '1001', '0105020300', '/v1/auth/role/update', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('d8fccbcb-07e1-11e7-952f-a0c58951c8d5', '1001', '0103030200', '/v1/auth/domain/share/post', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('daadf91b-07e6-11e7-952f-a0c58951c8d5', '1001', '0103020100', '/v1/auth/resource/org/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('dd815000-0248-11e7-9b60-a0c58951c8d5', '1001', '0203040000', '/v1/ca/cost/manage/page', '1', '#f2cbaf', 'tile', '3', '/static/images/ca_icon/cost_query.png', '4');
INSERT INTO `sys_theme_value` VALUES ('e6191fef-04a3-11e7-9b60-a0c58951c8d5', '1001', '0403000000', '/v1/auth/resource/org/page', '1', '#ed9f86', 'tile tile-wide', '3', '/static/images/common_icon/gl_account.png', '1');
INSERT INTO `sys_theme_value` VALUES ('ea237b6a-07ed-11e7-952f-a0c58951c8d5', '1001', '0105020400', '/v1/auth/role/delete', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('ec5cb33a-07ec-11e7-952f-a0c58951c8d5', '1001', '0105010500', '/v1/auth/user/modify/passwd', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('ecfe0b20-024b-11e7-9b60-a0c58951c8d5', '1001', '0303020000', '/v1/ftp/dispatch/manage/page', '1', '#009933', 'tile', '3', '/static/theme/default/img/org.png', '2');
INSERT INTO `sys_theme_value` VALUES ('ee765e9a-07e6-11e7-952f-a0c58951c8d5', '1001', '0103020200', '/v1/auth/resource/org/insert', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('f02a3b32-0247-11e7-9b60-a0c58951c8d5', '1001', '0202010000', '/v1/ca/static/radio/page', '1', '#92cdd2', 'tile tile-wide', '2', '/static/images/ca_icon/static_rules.png', '1');
INSERT INTO `sys_theme_value` VALUES ('f2e81083-07d2-11e7-95d9-a0c58951c8d5', '1001', '0104010100', '/v1/auth/domain/get', '2', '', '', '', '', '0');
INSERT INTO `sys_theme_value` VALUES ('f6a6448b-04a3-11e7-9b60-a0c58951c8d5', '1001', '0404000000', '/v1/auth/resource/org/page', '1', '#67accd', 'tile tile-wide', '1', '/static/images/common_icon/iso_currency.png', '2');
INSERT INTO `sys_theme_value` VALUES ('f87a9123-0991-11e7-952f-a0c58951c8d5', '1001', '1101010000', '/v1/help/system/help', '1', '#339999', 'tile tile-large', '1', '/static/theme/default/img/org.png', '1');
INSERT INTO `sys_theme_value` VALUES ('fb944b0a-0246-11e7-9b60-a0c58951c8d5', '1001', '0201010000', '/v1/ca/responsibility/page', '1', '#6fc07c', 'tile tile-wide', '1', '/static/images/ca_icon/org_info.png', '1');
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
INSERT INTO `sys_user_info` VALUES ('admin', '超级管理员', '2016-01-01 00:00:00', 'sys', 'omsystem@163.com', '18888888888', 'vertex_root_join_vertex_root', '2017-04-07 11:54:51', 'admin');
INSERT INTO `sys_user_info` VALUES ('caadmin', 'CA业务管理员', '2017-03-18 14:32:22', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_34124', '2017-03-18 14:32:22', 'admin');
INSERT INTO `sys_user_info` VALUES ('demo', '演示用户', '2017-03-01 21:21:38', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_34124', '2017-03-07 09:58:54', 'demo');
INSERT INTO `sys_user_info` VALUES ('ftpadmin', 'FTP测试', '2017-03-21 09:43:05', 'admin', 'hzwy23@163.com', '18986110550', 'devops_product_join_1111000011', '2017-03-21 09:43:05', 'admin');
INSERT INTO `sys_user_info` VALUES ('test1', '测试用户', '2017-03-14 11:04:45', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_512345423', '2017-03-14 11:04:45', 'admin');
INSERT INTO `sys_user_info` VALUES ('test10', '测试用户', '2017-03-14 11:07:14', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_512345423', '2017-03-14 11:07:14', 'admin');
INSERT INTO `sys_user_info` VALUES ('test11', '测试用户', '2017-03-14 11:07:29', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_512345423', '2017-03-14 11:07:29', 'admin');
INSERT INTO `sys_user_info` VALUES ('test12', '测试用户', '2017-03-14 11:07:55', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_34124', '2017-03-14 11:07:55', 'admin');
INSERT INTO `sys_user_info` VALUES ('test13', '测试用户', '2017-03-14 11:08:13', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_34124', '2017-03-14 11:08:13', 'admin');
INSERT INTO `sys_user_info` VALUES ('test14', '测试用户', '2017-03-14 11:08:28', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_34124', '2017-03-14 11:08:28', 'admin');
INSERT INTO `sys_user_info` VALUES ('test2', '测试用户', '2017-03-14 11:05:10', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_45246543', '2017-03-14 11:05:10', 'admin');
INSERT INTO `sys_user_info` VALUES ('test3', '测试用户', '2017-03-14 11:05:26', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_4542346', '2017-03-14 11:05:26', 'admin');
INSERT INTO `sys_user_info` VALUES ('test4', '测试用户', '2017-03-14 11:05:41', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_4542346', '2017-03-14 11:05:41', 'admin');
INSERT INTO `sys_user_info` VALUES ('test5', '测试用户', '2017-03-14 11:05:54', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_4542346', '2017-03-14 11:05:54', 'admin');
INSERT INTO `sys_user_info` VALUES ('test6', '测试用户', '2017-03-14 11:06:12', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_45246543', '2017-03-14 11:06:12', 'admin');
INSERT INTO `sys_user_info` VALUES ('test7', '测试用户', '2017-03-14 11:06:25', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_45246543', '2017-03-14 11:06:25', 'admin');
INSERT INTO `sys_user_info` VALUES ('test8', '测试用户', '2017-03-14 11:06:39', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_512345423', '2017-03-14 11:06:39', 'admin');
INSERT INTO `sys_user_info` VALUES ('test9', '测试用户', '2017-03-14 11:06:58', 'admin', 'hzwy23@163.com', '18986110550', 'mas_join_45246543', '2017-03-14 11:06:58', 'admin');
INSERT INTO `sys_user_info` VALUES ('yangji', 'YangJi', '2017-04-06 13:45:49', 'admin', 'yangji@163.com', '15915436799', 'test_join_test', '2017-04-06 13:45:49', 'admin');
INSERT INTO `sys_user_info` VALUES ('yangpanhong', '测试', '2017-03-07 10:31:35', 'demo', 'hzwy23@163.com', '18986110550', 'mas_join_34124', '2017-03-07 10:31:35', 'demo');

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
INSERT INTO `sys_user_theme` VALUES ('caadmin', '1004');
INSERT INTO `sys_user_theme` VALUES ('demo', '1004');
INSERT INTO `sys_user_theme` VALUES ('ftpadmin', '1004');
INSERT INTO `sys_user_theme` VALUES ('test1', '1001');
INSERT INTO `sys_user_theme` VALUES ('test10', '1001');
INSERT INTO `sys_user_theme` VALUES ('test11', '1001');
INSERT INTO `sys_user_theme` VALUES ('test12', '1001');
INSERT INTO `sys_user_theme` VALUES ('test13', '1001');
INSERT INTO `sys_user_theme` VALUES ('test14', '1001');
INSERT INTO `sys_user_theme` VALUES ('test2', '1001');
INSERT INTO `sys_user_theme` VALUES ('test3', '1001');
INSERT INTO `sys_user_theme` VALUES ('test4', '1001');
INSERT INTO `sys_user_theme` VALUES ('test5', '1001');
INSERT INTO `sys_user_theme` VALUES ('test6', '1001');
INSERT INTO `sys_user_theme` VALUES ('test7', '1001');
INSERT INTO `sys_user_theme` VALUES ('test8', '1001');
INSERT INTO `sys_user_theme` VALUES ('test9', '1001');
INSERT INTO `sys_user_theme` VALUES ('yangji', '1001');
INSERT INTO `sys_user_theme` VALUES ('yangpanhong', '1001');

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
