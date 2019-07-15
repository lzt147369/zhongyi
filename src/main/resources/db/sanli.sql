/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : sanli

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 12/07/2019 16:16:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jifen
-- ----------------------------
DROP TABLE IF EXISTS `jifen`;
CREATE TABLE `jifen`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jifen_count` int(100) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jifen
-- ----------------------------
INSERT INTO `jifen` VALUES ('1bf3bc08a833443b8f9ba064f8d45479', '13119129569', 10);
INSERT INTO `jifen` VALUES ('3585aed72c28443095741640ccd201d9', '13119129568', 10);
INSERT INTO `jifen` VALUES ('487a576595e04ac4bd1abd5b38cf0d80', '13119129568', 10);
INSERT INTO `jifen` VALUES ('788106dfbfba46759a2ce7844cb95713', '13119129568', 10);
INSERT INTO `jifen` VALUES ('ab55bcdfebb34879bed99fd46ee25e1c', '13119129568', 10);
INSERT INTO `jifen` VALUES ('b4c41f41b8714e9782c1b25504894c60', '13119129568', 10);
INSERT INTO `jifen` VALUES ('eb1139d0d30f4c9db9787552ab2c36f2', '13119129569', 10);

-- ----------------------------
-- Table structure for kehu
-- ----------------------------
DROP TABLE IF EXISTS `kehu`;
CREATE TABLE `kehu`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sex` bigint(36) NULL DEFAULT NULL COMMENT '0 男   1 女',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `comment` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `yaoqingma` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `beiyaoqingma` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被邀请码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kehu
-- ----------------------------
INSERT INTO `kehu` VALUES ('1', '1', '1', 1, '2019-07-20 13:20:02', NULL, 'ka9s9', 'ka9s6');
INSERT INTO `kehu` VALUES ('ad557a4411e74f6ca4a31876ba0e41a1', '13119129569', '李四', 0, '2019-07-12 13:12:39', NULL, 'ka9sb', 'ka9s6');
INSERT INTO `kehu` VALUES ('fa786d0240794106b75a9f34d189dc4d', '13119129568', '张三', 0, '2019-07-12 13:11:48', NULL, 'ka9s6', NULL);

-- ----------------------------
-- Table structure for qiandao
-- ----------------------------
DROP TABLE IF EXISTS `qiandao`;
CREATE TABLE `qiandao`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '连续五天签到天数',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` date NULL DEFAULT NULL,
  `count` int(20) NULL DEFAULT NULL COMMENT '连续签到天数',
  `days_7` int(5) NULL DEFAULT 1 COMMENT '是否连续7天签到   0是   1 否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qiandao
-- ----------------------------
INSERT INTO `qiandao` VALUES ('630a4d90f4c54c748ed5fda2d7f3e735', '13119129568', '2019-07-12', 1, 1);

-- ----------------------------
-- Table structure for qiandao_detail
-- ----------------------------
DROP TABLE IF EXISTS `qiandao_detail`;
CREATE TABLE `qiandao_detail`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qiandao_detail
-- ----------------------------
INSERT INTO `qiandao_detail` VALUES ('a81490368d5a498cace43f98d9298e6d', '13119129568', '2019-07-12');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `parent_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单',
  `level` bigint(2) NULL DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint(6) NULL DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint(2) NULL DEFAULT NULL COMMENT '是否显示',
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('00e53ef36b524e15a76b677d851e67db', '编辑权限', '01146657721a41289c63180f874f8bc2', 3, '542a6cb5cb604c88b516d6d959ab204f,01146657721a41289c63180f874f8bc2,00e53ef36b524e15a76b677d851e67db,', 3, '', NULL, NULL, '', 0, 'sys:menu:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-11-07 14:41:50', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-11-07 14:56:51', NULL, 0);
INSERT INTO `sys_menu` VALUES ('01146657721a41289c63180f874f8bc2', '菜单管理', '542a6cb5cb604c88b516d6d959ab204f', 2, '542a6cb5cb604c88b516d6d959ab204f,01146657721a41289c63180f874f8bc2,', 1, '/admin/system/menu/list', NULL, NULL, '', 1, 'sys:menu:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-11-07 14:39:32', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-11-07 14:44:22', NULL, 0);
INSERT INTO `sys_menu` VALUES ('01846aa0783e46f8a20c564438f831a8', '创建表', '5752a4ded5cb424585aaf3af8ee953f9', 2, '5752a4ded5cb424585aaf3af8ee953f9,01846aa0783e46f8a20c564438f831a8,', 2, 'db/creatList', NULL, '', '', 1, 'db:creatList', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-09-25 16:32:34', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-09-25 18:21:16', NULL, 0);
INSERT INTO `sys_menu` VALUES ('035e1a23222b4978b22e76af65169a65', '编辑存储方法', '67f9c5e2b9e14f87ae957333b05182ce', 3, '542a6cb5cb604c88b516d6d959ab204f,67f9c5e2b9e14f87ae957333b05182ce,035e1a23222b4978b22e76af65169a65,', 3, 'save/edit', NULL, NULL, '', 0, 'save:edit', NULL, '2019-06-11 15:08:14', NULL, '2019-06-11 18:38:52', NULL, 0);
INSERT INTO `sys_menu` VALUES ('0aaddad63e094f3ab023d95861550bd5', '公众号注册', NULL, 1, '0aaddad63e094f3ab023d95861550bd5,', 14, 'zhuce/list', NULL, NULL, '', 1, '', NULL, '2019-07-04 10:46:56', NULL, '2019-07-09 09:37:16', NULL, 0);
INSERT INTO `sys_menu` VALUES ('1467a0f8d6084925a69ea4af2b99fdf8', '提取行李', NULL, 1, '1467a0f8d6084925a69ea4af2b99fdf8,', 12, '', NULL, NULL, '', 1, '', NULL, '2019-06-11 19:03:26', NULL, '2019-07-09 09:33:17', NULL, 1);
INSERT INTO `sys_menu` VALUES ('186b5731db2a491d95c9636d8b1aeff9', '添加价格管理', '4712abb4d14c4516a5e0cf95ab1fe081', 3, '542a6cb5cb604c88b516d6d959ab204f,4712abb4d14c4516a5e0cf95ab1fe081,186b5731db2a491d95c9636d8b1aeff9,', 1, 'price/add', NULL, NULL, '', 0, 'price:add', NULL, '2019-06-11 15:09:50', NULL, '2019-06-11 18:15:20', NULL, 0);
INSERT INTO `sys_menu` VALUES ('2170f48da902490da272c78cb47155eb', '添加存储方法', '67f9c5e2b9e14f87ae957333b05182ce', 3, '542a6cb5cb604c88b516d6d959ab204f,67f9c5e2b9e14f87ae957333b05182ce,2170f48da902490da272c78cb47155eb,', 1, 'save/add', NULL, NULL, '', 0, 'save:add', NULL, '2019-06-11 15:07:36', NULL, '2019-06-11 18:38:08', NULL, 0);
INSERT INTO `sys_menu` VALUES ('27d39c2e717b4d1f94b9847d0bc45d44', '添加规格设置', '937a6bfea3cb44dbaddfe53502e09971', 3, '542a6cb5cb604c88b516d6d959ab204f,937a6bfea3cb44dbaddfe53502e09971,27d39c2e717b4d1f94b9847d0bc45d44,', 1, 'guige/add', NULL, NULL, '', 0, 'guige:add', NULL, '2019-06-11 15:08:47', NULL, '2019-06-11 16:52:49', NULL, 0);
INSERT INTO `sys_menu` VALUES ('330f11cd89b74054b001c411a1fbc56a', '寄存行李', NULL, 1, '330f11cd89b74054b001c411a1fbc56a,', 11, 'jicun/list', NULL, NULL, '', 1, 'jicun:list', NULL, '2019-06-11 19:03:15', NULL, '2019-07-09 09:33:21', NULL, 1);
INSERT INTO `sys_menu` VALUES ('3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', '用户管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', 2, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,', 9, '/admin/system/user/list', NULL, '', '#47e69c', 1, 'sys:user:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:31:18', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-20 05:59:20', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3b58e01e-9adb-11e8-aebe-1368d4ec24eb', '角色管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', 2, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,', 10, '/admin/system/role/list', NULL, '', '#c23ab9', 1, 'sys:role:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:32:33', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-20 05:58:58', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3ded5cec2b6b4ffb89690dd24d5b8e4a', '编辑角色', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,3ded5cec2b6b4ffb89690dd24d5b8e4a,', 21, '', NULL, NULL, '', 0, 'sys:role:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-11-07 15:25:37', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-11-07 15:25:37', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3e0b86a3-9adc-11e8-aebe-1368d4ec24eb', '新增用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e0b86a3-9adc-11e8-aebe-1368d4ec24eb,', 0, '', NULL, NULL, NULL, 0, 'sys:user:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:10:32', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:10:32', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb', '编辑用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb,', 10, '', NULL, NULL, NULL, 0, 'sys:user:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:11:49', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:11:49', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3e36cf2f-9adc-11e8-aebe-1368d4ec24eb', '删除用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e36cf2f-9adc-11e8-aebe-1368d4ec24eb,', 20, '', NULL, NULL, NULL, 0, 'sys:user:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:12:43', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:12:43', NULL, 0);
INSERT INTO `sys_menu` VALUES ('4230eb3101974061b63c20be036b3afc', '新增权限', '01146657721a41289c63180f874f8bc2', 3, '542a6cb5cb604c88b516d6d959ab204f,01146657721a41289c63180f874f8bc2,4230eb3101974061b63c20be036b3afc,', 1, '', NULL, NULL, '', 0, 'sys:menu:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-11-07 14:41:05', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-11-07 14:44:34', NULL, 0);
INSERT INTO `sys_menu` VALUES ('4712abb4d14c4516a5e0cf95ab1fe081', '价格管理', '542a6cb5cb604c88b516d6d959ab204f', 2, '542a6cb5cb604c88b516d6d959ab204f,4712abb4d14c4516a5e0cf95ab1fe081,', 5, 'price/list', NULL, NULL, '', 1, 'price:list', NULL, '2019-06-11 11:18:35', NULL, '2019-06-11 15:03:51', NULL, 0);
INSERT INTO `sys_menu` VALUES ('4d6c2163755a4c4a9ed5f1c7fb03c286', '清理数据', '5752a4ded5cb424585aaf3af8ee953f9', 2, '5752a4ded5cb424585aaf3af8ee953f9,4d6c2163755a4c4a9ed5f1c7fb03c286,', 1, 'db/clearList', NULL, '', '', 1, 'db:clearList', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-09-25 16:31:38', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-09-25 18:25:58', NULL, 0);
INSERT INTO `sys_menu` VALUES ('542a6cb5cb604c88b516d6d959ab204f', '系统管理', NULL, 1, '542a6cb5cb604c88b516d6d959ab204f,', 2, '', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-11-07 14:39:04', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-11-07 14:59:32', NULL, 0);
INSERT INTO `sys_menu` VALUES ('588ba032f45f4958af81ea9463ff37c2', '删除行李类型', '6004498741054e558b16bc14d04206e1', 3, '542a6cb5cb604c88b516d6d959ab204f,6004498741054e558b16bc14d04206e1,588ba032f45f4958af81ea9463ff37c2,', 2, 'baggage/delete', NULL, NULL, '', 0, 'baggage:delete', NULL, '2019-06-11 14:07:15', NULL, '2019-06-11 15:07:05', NULL, 0);
INSERT INTO `sys_menu` VALUES ('59a7ddf6ac77493a849df481c2b962db', '编辑价格管理', '4712abb4d14c4516a5e0cf95ab1fe081', 3, '542a6cb5cb604c88b516d6d959ab204f,4712abb4d14c4516a5e0cf95ab1fe081,59a7ddf6ac77493a849df481c2b962db,', 3, 'price/edit', NULL, NULL, '', 0, 'price:edit', NULL, '2019-06-11 15:10:43', NULL, '2019-06-11 18:16:00', NULL, 0);
INSERT INTO `sys_menu` VALUES ('5a6dbb6c5c0541b8a710f2a16c75f1b5', '签到', NULL, 1, '5a6dbb6c5c0541b8a710f2a16c75f1b5,', 16, 'qiandao/login', NULL, NULL, '', 1, 'qiandao:login', NULL, '2019-07-09 14:58:10', NULL, '2019-07-09 18:30:43', NULL, 0);
INSERT INTO `sys_menu` VALUES ('5d42d64950a749d992c8d78f83c39eb2', '客户列表', NULL, 1, '5d42d64950a749d992c8d78f83c39eb2,', 15, 'kehu/list', NULL, NULL, '', 1, 'kehu:list', NULL, '2019-07-09 09:38:12', NULL, '2019-07-09 10:00:13', NULL, 0);
INSERT INTO `sys_menu` VALUES ('6004498741054e558b16bc14d04206e1', '行李类型', '542a6cb5cb604c88b516d6d959ab204f', 2, '542a6cb5cb604c88b516d6d959ab204f,6004498741054e558b16bc14d04206e1,', 2, 'baggage/list', NULL, NULL, '', 1, 'baggage:list', NULL, '2019-06-11 11:16:01', NULL, '2019-06-11 14:17:26', NULL, 0);
INSERT INTO `sys_menu` VALUES ('67f9c5e2b9e14f87ae957333b05182ce', '存储方式', '542a6cb5cb604c88b516d6d959ab204f', 2, '542a6cb5cb604c88b516d6d959ab204f,67f9c5e2b9e14f87ae957333b05182ce,', 3, 'save/list', NULL, NULL, '', 1, 'save:list', NULL, '2019-06-11 11:17:32', NULL, '2019-06-11 15:06:13', NULL, 0);
INSERT INTO `sys_menu` VALUES ('7a227d43a7dc4f888ed766808fc06682', '我的邀请码', NULL, 1, '7a227d43a7dc4f888ed766808fc06682,', 18, 'kehu/yaoqingmalist', NULL, NULL, '', 1, '', NULL, '2019-07-12 13:38:13', NULL, '2019-07-12 14:08:09', NULL, 0);
INSERT INTO `sys_menu` VALUES ('7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', '权限管理', NULL, 1, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,', 3, '', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:29:46', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-11-07 14:38:41', NULL, 0);
INSERT INTO `sys_menu` VALUES ('89bcc726e70f4ac0b3bb29d23671aad5', '删除规格设置', '937a6bfea3cb44dbaddfe53502e09971', 3, '542a6cb5cb604c88b516d6d959ab204f,937a6bfea3cb44dbaddfe53502e09971,89bcc726e70f4ac0b3bb29d23671aad5,', 2, 'guige/delete', NULL, NULL, '', 0, 'guige:delete', NULL, '2019-06-11 15:09:06', NULL, '2019-06-11 16:53:17', NULL, 0);
INSERT INTO `sys_menu` VALUES ('9216c0808d78412ca8871141f33d773d', '删除存储方法', '67f9c5e2b9e14f87ae957333b05182ce', 3, '542a6cb5cb604c88b516d6d959ab204f,67f9c5e2b9e14f87ae957333b05182ce,9216c0808d78412ca8871141f33d773d,', 2, 'save/delete', NULL, NULL, '', 0, 'save:delete', NULL, '2019-06-11 15:07:56', NULL, '2019-06-11 18:38:34', NULL, 0);
INSERT INTO `sys_menu` VALUES ('92cd684525fa44b8993663ab4e690057', '删除权限', '01146657721a41289c63180f874f8bc2', 3, '542a6cb5cb604c88b516d6d959ab204f,01146657721a41289c63180f874f8bc2,92cd684525fa44b8993663ab4e690057,', 2, '', NULL, NULL, '', 0, 'sys:menu:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-11-07 14:41:34', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-11-07 14:44:46', NULL, 0);
INSERT INTO `sys_menu` VALUES ('937a6bfea3cb44dbaddfe53502e09971', '规格设置', '542a6cb5cb604c88b516d6d959ab204f', 2, '542a6cb5cb604c88b516d6d959ab204f,937a6bfea3cb44dbaddfe53502e09971,', 4, 'guige/list', NULL, NULL, '', 1, 'guige:list', NULL, '2019-06-11 11:17:56', NULL, '2019-06-11 14:39:06', NULL, 0);
INSERT INTO `sys_menu` VALUES ('97175e53640d48f5afe6f5efa9b134cd', '编辑规格设置', '937a6bfea3cb44dbaddfe53502e09971', 3, '542a6cb5cb604c88b516d6d959ab204f,937a6bfea3cb44dbaddfe53502e09971,97175e53640d48f5afe6f5efa9b134cd,', 3, 'guige/edit', NULL, NULL, '', 0, 'guige:edit', NULL, '2019-06-11 15:09:27', NULL, '2019-06-11 16:53:36', NULL, 0);
INSERT INTO `sys_menu` VALUES ('a3f58d976dd54b98bd21e1738142353d', '删除价格管理', '4712abb4d14c4516a5e0cf95ab1fe081', 3, '542a6cb5cb604c88b516d6d959ab204f,4712abb4d14c4516a5e0cf95ab1fe081,a3f58d976dd54b98bd21e1738142353d,', 2, 'price/delete', NULL, NULL, '', 0, 'price:delete', NULL, '2019-06-11 15:10:09', NULL, '2019-06-11 18:15:41', NULL, 0);
INSERT INTO `sys_menu` VALUES ('a7715af493b94ba28ead8e0e29d9155a', '删除', 'fc89a8a3ff244e1bb9466ca90e0feb4e', 3, 'dd358236007140ae8a98e13735737d49,fc89a8a3ff244e1bb9466ca90e0feb4e,a7715af493b94ba28ead8e0e29d9155a,', 1, '', NULL, NULL, '', 0, 'baojing:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-02-27 10:50:53', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-02-27 17:51:42', NULL, 0);
INSERT INTO `sys_menu` VALUES ('bd45e889c546430380539b61a051f4eb', '编辑行李类型', '6004498741054e558b16bc14d04206e1', 3, '542a6cb5cb604c88b516d6d959ab204f,6004498741054e558b16bc14d04206e1,bd45e889c546430380539b61a051f4eb,', 3, 'baggage/edit', NULL, NULL, '', 0, 'baggage:edit', NULL, '2019-06-11 14:08:24', NULL, '2019-06-11 14:08:24', NULL, 0);
INSERT INTO `sys_menu` VALUES ('c03b96af781f41c6968c651abb7afcf9', '行李类型', NULL, 1, 'c03b96af781f41c6968c651abb7afcf9,', 10, '', NULL, NULL, '', 1, '', NULL, '2019-06-11 11:15:15', NULL, '2019-07-09 09:33:24', NULL, 1);
INSERT INTO `sys_menu` VALUES ('c25818ab2a4f4cfaa11e0995b6f691f2', '注册', NULL, 1, 'c25818ab2a4f4cfaa11e0995b6f691f2,', 17, 'zhuce/list', NULL, NULL, '', 1, '', NULL, '2019-07-12 09:30:58', NULL, '2019-07-12 09:30:58', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ed63866b30cf46bfb6797a1d31ae930c', '锁定用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,ed63866b30cf46bfb6797a1d31ae930c,', 21, '', NULL, NULL, '', 0, 'sys:user:lock', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-08-21 17:44:05', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-08-21 17:44:05', NULL, 0);
INSERT INTO `sys_menu` VALUES ('f007d2e10a58403aa17c65c0b188cd52', '支付页面', NULL, 1, 'f007d2e10a58403aa17c65c0b188cd52,', 13, 'alipay/list', NULL, NULL, '', 1, '', NULL, '2019-06-22 17:56:09', NULL, '2019-07-09 09:33:14', NULL, 1);
INSERT INTO `sys_menu` VALUES ('fd695a175af54670809137a86d72cc6b', '添加行李类型', '6004498741054e558b16bc14d04206e1', 3, '542a6cb5cb604c88b516d6d959ab204f,6004498741054e558b16bc14d04206e1,fd695a175af54670809137a86d72cc6b,', 1, 'baggage/add', NULL, NULL, '', 0, 'baggage:add', NULL, '2019-06-11 12:03:15', NULL, '2019-06-11 16:04:10', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ff619e04-9adb-11e8-aebe-1368d4ec24eb', '新增角色', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff619e04-9adb-11e8-aebe-1368d4ec24eb,', 0, '', NULL, NULL, NULL, 0, 'sys:role:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:58:11', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:58:11', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ff9ad846-9adb-11e8-aebe-1368d4ec24eb', '删除角色', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff9ad846-9adb-11e8-aebe-1368d4ec24eb,', 20, '', NULL, NULL, NULL, 0, 'sys:role:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:56', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:56', NULL, 0);

-- ----------------------------
-- Table structure for sys_rescource
-- ----------------------------
DROP TABLE IF EXISTS `sys_rescource`;
CREATE TABLE `sys_rescource`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `web_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源网络地址',
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件标识',
  `file_size` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `original_net_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_rescource
-- ----------------------------
INSERT INTO `sys_rescource` VALUES ('90afe27dabc0469c8115c4fbd12ef1d3', 'ff3ec0e8-b8d2-45e1-bebf-673657ce816b.jpg', 'local', '/static/upload/ff3ec0e8-b8d2-45e1-bebf-673657ce816b.jpg', 'FplgDCML2x1o-L9oqRBZ7dNyCjCf', '20kb', 'image/jpeg', NULL, '2018-09-13 18:56:52', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-09-13 18:56:52', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', NULL, 0);
INSERT INTO `sys_rescource` VALUES ('a64eaa33d8c94cfeb33ea240b5d90064', '45751e87-97ad-48ea-855b-aa264ca2c745.jpg', 'local', '/static/upload/45751e87-97ad-48ea-855b-aa264ca2c745.jpg', 'FueKn-K3YzuVpGFEDjF3AHse1dTO', '57kb', 'image/jpeg', NULL, '2018-09-13 18:58:01', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-09-13 18:58:01', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', NULL, 0);
INSERT INTO `sys_rescource` VALUES ('f6a62f4351d542b8921b0ae26c36302b', '64c92abc-981b-4167-bbf9-dc78be2a6b57.jpg', 'local', '/static/upload/64c92abc-981b-4167-bbf9-dc78be2a6b57.jpg', 'FlMqATw2M33qcTEGy_ZhIAN2O84b', '74kb', 'image/jpeg', NULL, '2018-09-14 10:12:02', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-09-14 10:12:02', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', NULL, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '系统管理员', '2017-11-29 19:36:37', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-07-12 14:03:31', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', 0);
INSERT INTO `sys_role` VALUES ('9928401caa51469c9a132f21af22fe64', '普通用户', '2018-12-24 11:50:46', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-26 17:17:35', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '00e53ef36b524e15a76b677d851e67db');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '01146657721a41289c63180f874f8bc2');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '0aaddad63e094f3ab023d95861550bd5');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3ded5cec2b6b4ffb89690dd24d5b8e4a');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3e0b86a3-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3e36cf2f-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '4230eb3101974061b63c20be036b3afc');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '542a6cb5cb604c88b516d6d959ab204f');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '5a6dbb6c5c0541b8a710f2a16c75f1b5');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '5d42d64950a749d992c8d78f83c39eb2');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '7a227d43a7dc4f888ed766808fc06682');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '92cd684525fa44b8993663ab4e690057');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'c25818ab2a4f4cfaa11e0995b6f691f2');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ed63866b30cf46bfb6797a1d31ae930c');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ff619e04-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ff9ad846-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '00e53ef36b524e15a76b677d851e67db');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '01146657721a41289c63180f874f8bc2');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '03dd2e700e7f417d8229dc3165bc4c96');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '1a58b1d553004dbd986daa03a8d0988b');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '2112479ddb0949f9ab595fbfa22b045a');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '27ed582ed07d4941add7877496c94b30');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '3921630dbd6c44d9bd347c17f7d0b22d');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '3ded5cec2b6b4ffb89690dd24d5b8e4a');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '3e0b86a3-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '3e36cf2f-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '4230eb3101974061b63c20be036b3afc');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '542a6cb5cb604c88b516d6d959ab204f');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '6bc8edadc90f4612aabf1d11d5a8ceff');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '86b257094c3a43bdabc4bff644968703');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', '92cd684525fa44b8993663ab4e690057');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', 'a136ce1e19e8477a904766b995578bbf');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', 'b3f3897f4aa5486887d98143c88b4c26');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', 'bb5f1904fcde46d6b1dabe7b6d7a4707');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', 'c17565176c6f4f2ba9fe15a585759322');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', 'd067e13603b645fd8462aa541d716cd9');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', 'd32e1a1135714e93afc0e6e5f240acad');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', 'dd358236007140ae8a98e13735737d49');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', 'e3dd7de2550441ec8a9ac479ca154307');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', 'ed63866b30cf46bfb6797a1d31ae930c');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', 'ff619e04-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('9928401caa51469c9a132f21af22fe64', 'ff9ad846-9adb-11e8-aebe-1368d4ec24eb');

-- ----------------------------
-- Table structure for sys_save
-- ----------------------------
DROP TABLE IF EXISTS `sys_save`;
CREATE TABLE `sys_save`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `save_type_id` int(30) NULL DEFAULT NULL,
  `save_type_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_save
-- ----------------------------
INSERT INTO `sys_save` VALUES ('94dbd7baba044497a7485acb3fd3a13d', 1176551645, '货架存放');
INSERT INTO `sys_save` VALUES ('f86b89411d0444088ebce7c00cdccbd6', 1176571265, '独立保管柜');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `login_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'shiro加密盐',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint(2) NULL DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(4) NOT NULL,
  `is_admin` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('18b8b543-9ad7-11e8-aebe-1368d4ec24eb', 'admin', '超级管理员', '', 'b082df5210c747239e3938f652112b7a2706e5bf', '2532422bdedf9fe8', '13776055179', 'b@qq.com', 0, '2017-11-27 22:19:39', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-12 15:06:59', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', NULL, 0, 1);
INSERT INTO `sys_user` VALUES ('5d878a28c853435ead17dfd54bc9270c', 'zhangsan', '张三', NULL, '4d04692128e1c6e5d8888a6f6d732bbcf6f5a825', '7d21d3f869633f87', '18888888888', 'zhangsan@qq.com', 0, '2018-12-22 15:53:16', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-26 17:17:46', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', NULL, 0, 1);
INSERT INTO `sys_user` VALUES ('c9a23175fea54b3992ff7a2eeca928fd', 'lisi', '李四', NULL, '52c47ffd67bd46ecaf90cc705a1688566fedee49', '57c0b65018219ce1', '18877777777', 'lisi@qq.com', 0, '2018-12-22 15:53:40', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-26 17:17:52', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', NULL, 0, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '706e0195-9ad7-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_user_role` VALUES ('2da669e611194a6da8655e83452e4532', '706e0195-9ad7-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_user_role` VALUES ('5d878a28c853435ead17dfd54bc9270c', '9928401caa51469c9a132f21af22fe64');
INSERT INTO `sys_user_role` VALUES ('6c12df614f9f4dffa4d9d979f7725c82', '706e0195-9ad7-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_user_role` VALUES ('75269eb497144958a040c4c3a47100dd', '706e0195-9ad7-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_user_role` VALUES ('c9a23175fea54b3992ff7a2eeca928fd', '9928401caa51469c9a132f21af22fe64');

-- ----------------------------
-- Table structure for t_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_logs`;
CREATE TABLE `t_logs`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键编号',
  `action` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件',
  `data` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据',
  `authorId` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者编号',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `created` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_logs
-- ----------------------------
INSERT INTO `t_logs` VALUES ('044bb26052a3469c9035a196c87302d1', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-21 11:08:19');
INSERT INTO `t_logs` VALUES ('05a5cf22860c4364a120f1684f632e48', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 12:34:30');
INSERT INTO `t_logs` VALUES ('09f84ac8e0924e879708f0d520b34768', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 11:42:16');
INSERT INTO `t_logs` VALUES ('0aca3ac2d90f4bf7ac90f90ed8bec26c', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 12:28:03');
INSERT INTO `t_logs` VALUES ('0eebd0efcd5f4664b9b55afbc70e39d8', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 10:12:24');
INSERT INTO `t_logs` VALUES ('11b087d4d5514287ac9a4422cbbab4ef', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 12:28:44');
INSERT INTO `t_logs` VALUES ('15a30673d5f349c68b4674499314c90d', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-18 14:26:51');
INSERT INTO `t_logs` VALUES ('1656386d6fd84185a66dadad1e07937f', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-06 11:40:43');
INSERT INTO `t_logs` VALUES ('18f955aee28548e0be32021217bbfa48', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 11:39:58');
INSERT INTO `t_logs` VALUES ('1a8c6ed04f4740328316fe260b6a48a8', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 12:14:10');
INSERT INTO `t_logs` VALUES ('1fc7a4e6c9004d999f9cd3e98291b5d5', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-20 09:42:21');
INSERT INTO `t_logs` VALUES ('21bf7f90866c4b4788dc8d6b4676522e', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-21 11:02:07');
INSERT INTO `t_logs` VALUES ('262841a0cf7449f0bae454cc169afa50', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 10:45:29');
INSERT INTO `t_logs` VALUES ('263a062686a542df896d67b6a405f207', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 11:07:59');
INSERT INTO `t_logs` VALUES ('2752d06d660941f1b5eadb17cb1ddc07', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 12:31:12');
INSERT INTO `t_logs` VALUES ('28a8eddc7e5643e385aa981648958ef3', '登录后台', NULL, 'admin', '127.0.0.1', '2019-06-10 11:06:26');
INSERT INTO `t_logs` VALUES ('2bea4cffc6b543c295e65df5d137d654', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 12:38:32');
INSERT INTO `t_logs` VALUES ('2e5d93cc935344c89988c8c46b7b00e4', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 11:52:14');
INSERT INTO `t_logs` VALUES ('3411b92e655e454e9de3ab1a40966f11', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 12:40:09');
INSERT INTO `t_logs` VALUES ('3619344749f94fe5beeb5b77f575eb80', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-15 10:02:32');
INSERT INTO `t_logs` VALUES ('36272c249ac449b4aab3f909398b77da', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-15 10:27:06');
INSERT INTO `t_logs` VALUES ('391231abbca14efbb5f65fbf59cd1b8b', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-18 16:10:41');
INSERT INTO `t_logs` VALUES ('3b99bdd8a12646f2b6702fc8d89677c8', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 09:38:07');
INSERT INTO `t_logs` VALUES ('3d9d366487ec4541ae2d63e4656bcdf9', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-03-30 11:48:43');
INSERT INTO `t_logs` VALUES ('474ba822c322482ab466b6893833ed8d', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-03-27 15:01:16');
INSERT INTO `t_logs` VALUES ('4a2ad80340744397b9ab0f398529fcf2', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 10:44:31');
INSERT INTO `t_logs` VALUES ('4ecef91bd9bc4224994cfb062599bd68', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 12:30:37');
INSERT INTO `t_logs` VALUES ('56c651104cba47f090f70ec4b2b14ab2', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-18 16:14:04');
INSERT INTO `t_logs` VALUES ('57c3929ec2b948a7a2b3db6a00dc12db', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 10:42:28');
INSERT INTO `t_logs` VALUES ('62cc818ec21547f58c151549b6a7cf61', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-03-27 16:33:22');
INSERT INTO `t_logs` VALUES ('65f6c81e25424165b0a184dcea9279ec', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-18 16:57:18');
INSERT INTO `t_logs` VALUES ('6f090f6de4434a18a93882bcb152fdbd', '登录后台', NULL, 'admin', '127.0.0.1', '2019-06-05 12:40:33');
INSERT INTO `t_logs` VALUES ('70838fa8717441e9ac775d38e4bd1455', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-18 16:22:20');
INSERT INTO `t_logs` VALUES ('71d379bd03cf4cf2b0dca968736e86ff', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-15 11:04:33');
INSERT INTO `t_logs` VALUES ('729102b6203340cb93bbaf37ca482262', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-03-27 15:08:42');
INSERT INTO `t_logs` VALUES ('742eabcbf5b34e66a076872f76660fc9', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-04 16:20:51');
INSERT INTO `t_logs` VALUES ('75db9fa9a0254c37a3b241e4e0f5afa1', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-06 11:45:41');
INSERT INTO `t_logs` VALUES ('79ddfcf6ffc84b90b3de642ec561db1c', '登录后台', NULL, 'admin', '10.40.61.54', '2019-05-18 15:03:58');
INSERT INTO `t_logs` VALUES ('7f83a2eeadef4fc68ef77a1fc8c10744', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-18 16:02:05');
INSERT INTO `t_logs` VALUES ('80e9c1b923b84b1c82382f00234201f0', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 12:39:40');
INSERT INTO `t_logs` VALUES ('8230f537d77f449da93f62ed020d7b64', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-20 09:55:00');
INSERT INTO `t_logs` VALUES ('8328a5c6bfde4c82ab698b6249d967db', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 12:33:04');
INSERT INTO `t_logs` VALUES ('843b2065f2dd42d7b4704b020283955a', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-18 16:16:43');
INSERT INTO `t_logs` VALUES ('8611e4d1be784de6b610e4eb10ea085a', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-20 10:04:17');
INSERT INTO `t_logs` VALUES ('95c8e3c6317e43f68c8b7c9ff426eb9f', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-04 16:06:53');
INSERT INTO `t_logs` VALUES ('97227e38f8964f57a1f6e347e921f05f', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-20 10:10:40');
INSERT INTO `t_logs` VALUES ('9d5a4c3f05c14657b6691fbcd8ae74d8', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-20 10:40:18');
INSERT INTO `t_logs` VALUES ('9f99392667cf4dd2b031ea579740451c', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 10:06:22');
INSERT INTO `t_logs` VALUES ('a2dd39c769864801b43ac555b8930bde', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-06 11:39:18');
INSERT INTO `t_logs` VALUES ('a6949da8e7e84baf84e5eb1fc5f39238', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-18 16:03:39');
INSERT INTO `t_logs` VALUES ('ad4ad02a27a3428fa6035ccde3bf7917', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 10:13:24');
INSERT INTO `t_logs` VALUES ('ad517222c167406a9a1f90a44dc65bba', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-15 11:07:58');
INSERT INTO `t_logs` VALUES ('ae9c7be4dc344c62890076d81691315f', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 11:09:07');
INSERT INTO `t_logs` VALUES ('aec64ce0266b4d6d843a60578ef57221', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 11:05:26');
INSERT INTO `t_logs` VALUES ('b9c7d6485a5740d4a968abcf0397a8d0', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 12:16:08');
INSERT INTO `t_logs` VALUES ('bdf978de80234b548116cf729e79a6ea', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-06 09:38:07');
INSERT INTO `t_logs` VALUES ('bf093e213cd246cc8f99386b60193f1b', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-20 10:09:45');
INSERT INTO `t_logs` VALUES ('c885111f03254a75b9587a8ecbbc1f50', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-20 10:12:22');
INSERT INTO `t_logs` VALUES ('c91f15057a62476e91d60f56031c86ed', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-03 10:52:34');
INSERT INTO `t_logs` VALUES ('ca0b07ad4bc241889f734804836280df', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 10:31:53');
INSERT INTO `t_logs` VALUES ('ca4955bb24fc48aeace37776455ba684', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 12:36:02');
INSERT INTO `t_logs` VALUES ('ccc7d87d13f34c91be6c798ac97d51bf', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-06 09:54:26');
INSERT INTO `t_logs` VALUES ('cdd556d0c1c54c57b5da7278a9f27459', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-06 11:44:01');
INSERT INTO `t_logs` VALUES ('cf47b329de824fb6a04587c59e786b53', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 10:43:42');
INSERT INTO `t_logs` VALUES ('d58ccf5fc38b45d0a751a0aa8b8e179d', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-20 10:09:03');
INSERT INTO `t_logs` VALUES ('d5f4b40fa38943469956358d1ceae606', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-20 09:56:14');
INSERT INTO `t_logs` VALUES ('d69344df35ca4f14abba1d9120c73e6e', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-05 10:03:46');
INSERT INTO `t_logs` VALUES ('da239389ecf2454da559041401a0232e', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-18 16:08:21');
INSERT INTO `t_logs` VALUES ('de55c1631b394c629bc89b0aefc716e8', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 10:40:47');
INSERT INTO `t_logs` VALUES ('e22c21add343499da56637327183594c', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-06 10:45:13');
INSERT INTO `t_logs` VALUES ('e548c491127041578bec2591fe799de5', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-06 10:16:26');
INSERT INTO `t_logs` VALUES ('e5b05ec946e84f0e9ba0d2f17b264520', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 10:27:38');
INSERT INTO `t_logs` VALUES ('ef7b7bd461d945ef9b8aeb419e1855a7', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 10:24:06');
INSERT INTO `t_logs` VALUES ('f021eb8fac39423da96f60d9c68b68cc', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-18 14:32:09');
INSERT INTO `t_logs` VALUES ('f171e1ff4bfb4c31b8b1ed0a1448145e', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-06 10:20:25');
INSERT INTO `t_logs` VALUES ('f3334d2215d74acf8f41a236cb1c04e5', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-03-27 15:02:53');
INSERT INTO `t_logs` VALUES ('f5f5353d3b3b40f6a922efd2db7dfc7a', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-15 10:25:47');
INSERT INTO `t_logs` VALUES ('f7326902aee64e17b2ac5406f504d4cb', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-05-15 11:01:59');
INSERT INTO `t_logs` VALUES ('f7bc6912ed06493a931c0cf6be24a625', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 10:37:51');
INSERT INTO `t_logs` VALUES ('faf1e5c491674591a8d3062e35fbc058', '登录后台', NULL, 'admin', '0:0:0:0:0:0:0:1', '2019-06-10 11:48:45');

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
delimiter ;;
CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `currval`(seq_name VARCHAR(50)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN  
DECLARE v INTEGER;  
SET v = 0;  
SELECT current_value INTO v FROM sequence WHERE NAME = seq_name;  
RETURN v;  
END
;;
delimiter ;

-- ----------------------------
-- Function structure for nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
delimiter ;;
CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `nextval`(seq_name VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
BEGIN  
UPDATE sequence SET current_value = current_value + increment WHERE NAME = seq_name;  
RETURN currval(seq_name);  
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
