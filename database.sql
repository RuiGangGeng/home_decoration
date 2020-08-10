/*
 Navicat Premium Data Transfer

 Source Server         : d98e953019e56927
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : home_decoration

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 09/08/2020 16:02:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for table_admin
-- ----------------------------
DROP TABLE IF EXISTS `table_admin`;
CREATE TABLE `table_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '商家',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_admin
-- ----------------------------
INSERT INTO `table_admin` VALUES (1, 0, 'root', 'Admin', 'fc955e95339af41fd3c5a9623f922f84', 'a89a64', '/assets/img/qrcode.png', 'admin@admin.com', 0, 1596959891, '127.0.0.1', 1492186163, 1596959891, '7a067fbf-0ad5-4d31-9860-d80fe6278279', 'normal');

-- ----------------------------
-- Table structure for table_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `table_admin_log`;
CREATE TABLE `table_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1339 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_admin_log
-- ----------------------------
INSERT INTO `table_admin_log` VALUES (871, 1, 'root', '/admin.php/auth/rule/multi/ids/199', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"199\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596443514);
INSERT INTO `table_admin_log` VALUES (872, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596443514);
INSERT INTO `table_admin_log` VALUES (873, 1, 'root', '/admin.php/auth/rule/multi/ids/132', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"132\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596443534);
INSERT INTO `table_admin_log` VALUES (874, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596443534);
INSERT INTO `table_admin_log` VALUES (875, 1, 'root', '/admin.php/auth/admin/del/ids/11,10,9,8,7,3', '权限管理 管理员管理 删除', '{\"action\":\"del\",\"ids\":\"11,10,9,8,7,3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596443569);
INSERT INTO `table_admin_log` VALUES (876, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596443723);
INSERT INTO `table_admin_log` VALUES (877, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596445916);
INSERT INTO `table_admin_log` VALUES (878, 1, 'root', '/admin.php/shop_category/index', '分类管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596446276);
INSERT INTO `table_admin_log` VALUES (879, 1, 'root', '/admin.php/index/login?url=%2Fadmin.php%2Fgood%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin.php\\/good?ref=addtabs\",\"__token__\":\"4f4e08b04f96c5d8d3f51d9b1de503ab\",\"username\":\"root\",\"captcha\":\"uean\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596446615);
INSERT INTO `table_admin_log` VALUES (880, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"cp_tu.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596446935);
INSERT INTO `table_admin_log` VALUES (881, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"big84000.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596447007);
INSERT INTO `table_admin_log` VALUES (882, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"cpxq_tu.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596447041);
INSERT INTO `table_admin_log` VALUES (883, 1, 'root', '/admin.php/good/add?dialog=1', '产品管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5355\\u9879\\u68c0\\u67e5-\\u5168\\u5c4b\\u5730\\u677f\",\"original\":\"1300\",\"price\":\"800\",\"thumb_image\":\"\\/uploads\\/20200803\\/03b9cf24bf437601a42d2ab7efcd43f5.png\",\"images\":\"\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg\",\"content\":\"\",\"status\":\"1\",\"weigh\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596447079);
INSERT INTO `table_admin_log` VALUES (884, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596447130);
INSERT INTO `table_admin_log` VALUES (885, 1, 'root', '/admin.php/shop_category/index', '分类管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"shop_id\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596447131);
INSERT INTO `table_admin_log` VALUES (886, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596447134);
INSERT INTO `table_admin_log` VALUES (887, 1, 'root', '/admin.php/shop_category/index', '分类管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"shop_id\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596447135);
INSERT INTO `table_admin_log` VALUES (888, 1, 'root', '/admin.php/index/login?url=%2Fadmin.php%2Fgood%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin.php\\/good?ref=addtabs\",\"__token__\":\"23edd117ff984ddb65a0a7fd32e6cb6d\",\"username\":\"root\",\"captcha\":\"dvlh\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596503835);
INSERT INTO `table_admin_log` VALUES (889, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596503916);
INSERT INTO `table_admin_log` VALUES (890, 1, 'root', '/admin.php/auth/rule/edit/ids/150?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"11eb93fc0e5ebc817556ad1895d74b27\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"good\",\"title\":\"\\u9996\\u9875\\u4ea7\\u54c1\",\"icon\":\"fa fa-birthday-cake\",\"weigh\":\"993\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"150\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596504017);
INSERT INTO `table_admin_log` VALUES (891, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596504017);
INSERT INTO `table_admin_log` VALUES (892, 1, 'root', '/admin.php/good/edit/ids/38?dialog=1', '首页产品 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u57fa\\u7840\\u9a8c\\u6536\",\"original\":\"1300.00\",\"price\":\"800.00\",\"thumb_image\":\"\\/uploads\\/20200803\\/03b9cf24bf437601a42d2ab7efcd43f5.png\",\"images\":\"\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg\",\"content\":\"\",\"status\":\"1\",\"weigh\":\"38\"},\"ids\":\"38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596504041);
INSERT INTO `table_admin_log` VALUES (893, 1, 'root', '/admin.php/category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596504427);
INSERT INTO `table_admin_log` VALUES (894, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596504491);
INSERT INTO `table_admin_log` VALUES (895, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596504492);
INSERT INTO `table_admin_log` VALUES (896, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596504495);
INSERT INTO `table_admin_log` VALUES (897, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596504495);
INSERT INTO `table_admin_log` VALUES (898, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596504496);
INSERT INTO `table_admin_log` VALUES (899, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596505177);
INSERT INTO `table_admin_log` VALUES (900, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596505179);
INSERT INTO `table_admin_log` VALUES (901, 1, 'root', '/admin.php/index/login?url=%2Fadmin.php%2Fgood%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin.php\\/good?ref=addtabs\",\"__token__\":\"406a2df81e532f670c1d730b88e1b939\",\"username\":\"root\",\"captcha\":\"fyet\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596505503);
INSERT INTO `table_admin_log` VALUES (902, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596506022);
INSERT INTO `table_admin_log` VALUES (903, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596506025);
INSERT INTO `table_admin_log` VALUES (904, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596506026);
INSERT INTO `table_admin_log` VALUES (905, 1, 'root', '/admin.php/good/add?dialog=1', '首页产品 添加', '{\"dialog\":\"1\",\"row\":{\"good_ids\":\"38\",\"name\":\"\\u5168\\u7a0b\\u76d1\\u7406\",\"original\":\"1200\",\"price\":\"998\",\"thumb_image\":\"\\/uploads\\/20200803\\/03b9cf24bf437601a42d2ab7efcd43f5.png\",\"images\":\"\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg\",\"content\":\"\",\"status\":\"1\",\"weigh\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596506085);
INSERT INTO `table_admin_log` VALUES (906, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"banner.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507105);
INSERT INTO `table_admin_log` VALUES (907, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507147);
INSERT INTO `table_admin_log` VALUES (908, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507150);
INSERT INTO `table_admin_log` VALUES (909, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507179);
INSERT INTO `table_admin_log` VALUES (910, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507182);
INSERT INTO `table_admin_log` VALUES (911, 1, 'root', '/admin.php/content/content_banner/add?dialog=1', '内容管理 banner轮播 添加', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20200804\\/83bfdb846e5a006a7d0bc81864ac0a38.png\",\"shop_id\":\"39\",\"weigh\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507190);
INSERT INTO `table_admin_log` VALUES (912, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507203);
INSERT INTO `table_admin_log` VALUES (913, 1, 'root', '/admin.php/content/content_banner/add?dialog=1', '内容管理 banner轮播 添加', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20200804\\/83bfdb846e5a006a7d0bc81864ac0a38.png\",\"shop_id\":\"38\",\"weigh\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507205);
INSERT INTO `table_admin_log` VALUES (914, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507211);
INSERT INTO `table_admin_log` VALUES (915, 1, 'root', '/admin.php/content/content_banner/add?dialog=1', '内容管理 banner轮播 添加', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20200804\\/83bfdb846e5a006a7d0bc81864ac0a38.png\",\"shop_id\":\"43\",\"weigh\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507214);
INSERT INTO `table_admin_log` VALUES (916, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"43\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"43\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507294);
INSERT INTO `table_admin_log` VALUES (917, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"43\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"43\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507330);
INSERT INTO `table_admin_log` VALUES (918, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"43\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"43\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507352);
INSERT INTO `table_admin_log` VALUES (919, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"39\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"39\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507486);
INSERT INTO `table_admin_log` VALUES (920, 1, 'root', '/admin.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"e858ab334b69b7fd3a8cf9873d05e37d\",\"row\":{\"app_id\":\"wxbb98e1aa25ea3d7c\",\"app_secret\":\"4c632970c789ac2fa43bd393ff04edf7\",\"pay_notify_url\":\"https:\\/\\/jxm.bowangyun.net\\/api\\/Pay\\/notifyPay\",\"refund_notify_url\":\"https:\\/\\/jxm.bowangyun.net\\/api\\/Pay\\/notifyRefund\",\"distance_limit\":\"100000000\",\"review\":\"0\",\"mch_id\":\"1526467491\",\"key\":\"aK0bI1cC0iC1aC1gC1aR2bF0bB0aA6as\",\"ssl_cert\":\"-----BEGIN CERTIFICATE-----\\r\\nMIID8zCCAtugAwIBAgIUFCZAQyBC67M1tqIku42lwuil8hgwDQYJKoZIhvcNAQEL\\r\\nBQAwXjELMAkGA1UEBhMCQ04xEzARBgNVBAoTClRlbnBheS5jb20xHTAbBgNVBAsT\\r\\nFFRlbnBheS5jb20gQ0EgQ2VudGVyMRswGQYDVQQDExJUZW5wYXkuY29tIFJvb3Qg\\r\\nQ0EwHhcNMjAwNjI5MDIxOTM5WhcNMjUwNjI4MDIxOTM5WjCBhDETMBEGA1UEAwwK\\r\\nMTUyNjQ2NzQ5MTEbMBkGA1UECgwS5b6u5L+h5ZWG5oi357O757ufMTAwLgYDVQQL\\r\\nDCfljZrnvZHkupHnp5HmioDvvIjljJfkuqzvvInmnInpmZDlhazlj7gxCzAJBgNV\\r\\nBAYMAkNOMREwDwYDVQQHDAhTaGVuWmhlbjCCASIwDQYJKoZIhvcNAQEBBQADggEP\\r\\nADCCAQoCggEBALFsjUkqrgK1BpMaQPlCK3HeQVRJCep\\/x0VR\\/JKoRlmI\\/U9VWvoM\\r\\n1YkMIVmqj9Rx6QrrNgCUyzD+DYTLk0KT3sEjV72CxitgHi2VeflKmt9wR3XM3bs4\\r\\nO7mcoikG2GyFWEfbZE1VqGcFOJygovryuXr62bO8y\\/y6f8Lfr82T7yQymoSfM+JR\\r\\nlvDdvM1H06Mja+Z2XjbnPTl81MBGC63cDgTKgYHgoB+AIJQrfnF5u7AQDKxqDJBn\\r\\nkuUBwcNJpd0vYKRuFUtS0YNqrRPyI06hMnBdiPwvHJRLnrO\\/BHK61r59w\\/1+\\/Tx4\\r\\ngk9IGOcFxfNC\\/Wd0TqS3BN+Fp+GegkGrXlsCAwEAAaOBgTB\\/MAkGA1UdEwQCMAAw\\r\\nCwYDVR0PBAQDAgTwMGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly9ldmNhLml0cnVz\\r\\nLmNvbS5jbi9wdWJsaWMvaXRydXNjcmw\\/Q0E9MUJENDIyMEU1MERCQzA0QjA2QUQz\\r\\nOTc1NDk4NDZDMDFDM0U4RUJEMjANBgkqhkiG9w0BAQsFAAOCAQEAWDJwbOoY2QgQ\\r\\nKvUmMMFCz4tM58vvEbo8relAyPbuoxAHcyBLtHRTu5h\\/Oa8Jb+\\/BkXFiFW15CwNq\\r\\nOr2rpTGaiYTH3J8D\\/Dlk0L8tjo0dn2+EdgRzSdDp2ew0SQqk5pFfSz2pVfTLo14D\\r\\nS8apr1ftT+m29EuNkwBeUwY49Y8JRN9Wl4VJgfufFoEyITW5yeoppCwCFnL1cxJm\\r\\nWF5p5EPSKFu27xmpn9+W4H+RAJ\\/mDGKxZKmEY0G8xu5agLRq7UoITagARD\\/pjBqQ\\r\\n\\/tpjIg9PMRhE2U7v1wH1ikTruhDwtHZNyQpyBrAxxSQtLCUUUBMGkq0DFwbJX7eh\\r\\nykiQNoT2VA==\\r\\n-----END CERTIFICATE-----\",\"ssl_key\":\"-----BEGIN PRIVATE KEY-----\\r\\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCxbI1JKq4CtQaT\\r\\nGkD5Qitx3kFUSQnqf8dFUfySqEZZiP1PVVr6DNWJDCFZqo\\/UcekK6zYAlMsw\\/g2E\\r\\ny5NCk97BI1e9gsYrYB4tlXn5SprfcEd1zN27ODu5nKIpBthshVhH22RNVahnBTic\\r\\noKL68rl6+tmzvMv8un\\/C36\\/Nk+8kMpqEnzPiUZbw3bzNR9OjI2vmdl425z05fNTA\\r\\nRgut3A4EyoGB4KAfgCCUK35xebuwEAysagyQZ5LlAcHDSaXdL2CkbhVLUtGDaq0T\\r\\n8iNOoTJwXYj8LxyUS56zvwRyuta+fcP9fv08eIJPSBjnBcXzQv1ndE6ktwTfhafh\\r\\nnoJBq15bAgMBAAECggEALPQhFCHBNyRgxxLG1aDjWxWCHfXnkkfP2It+YDZMpNDl\\r\\nxZ0N0P9Bd1jgdlSV3rEB5+dSpnEMzpwAFt5xsFPBA9SNnZGt3j2bR9dwsS4q8WQE\\r\\nZx+CKraDw3KhT53RZiWfCY3X6xRB9+BFyMGWqdioEDXQxQ6X7K\\/gQSLl60OJOvU\\/\\r\\nNYBVsWqjT6\\/5eh9K7qS+2T165Vpv4SJ0CYq9RHLxTy5qpoCfoqdg3e+y5909GnL5\\r\\nRzkY9pCZzgRvuq2EgXtncbBalXfaHsDQ+ztylM6Nut4aphi+QwhJybM6kXbUfwv7\\r\\nxRinTB2onLY4i0ZeSje\\/LPxoYHLeusddzN0UVo6jqQKBgQDgpTj6vQc9xIywGeUC\\r\\njGgSF7MhJC\\/qtVXrwL6+qSZbaS8uXMNEX\\/9Xct+G0\\/HOFCIF0jeJ2zVwQeHaESpE\\r\\n\\/tM\\/TE48cNC+X2PKR5pGHj2kwrq9uz1kptv9VhI3reve7+X3RaH8CDpRLZ\\/X+ad1\\r\\n+IVVedZ9YgqwFL0uJCoYFPhIxwKBgQDKMBF8+BUiBXYULS8nRWOHGmi1JMOq9Hm2\\r\\nYlMKPoktT2eOlDSmw1tsEWSfHOORS\\/Hqg0UtgMTqTyjhtlPe30Fl8tpbt1XJtycY\\r\\noj+CCh8nuAeRNJbQZdWtsyGkOgiVBDix3EmI3LiXjn0c3+E9m9U87DBpmTSJvVp3\\r\\nTPVcGr0xzQKBgH+KTodMuse+x4FTskl4Hb3n5rNyMCI5QcbPb3wf3L8ZQMg5skMn\\r\\nnXiwp2eM\\/UPa+lYDu7Rw2C4buXZtOGpjotvVHrYB9wGedrFpZZVZpfXc+NivbXOv\\r\\nqEZ0j3M9MyUnXpC83\\/KPWUytcorUGtdHeavFuJkHCLpfi+ieb6esgCoRAoGAaIg\\/\\r\\nkmfErUk7iiTuOxSB54i81+KBEzLAdo4RNrusOnPSK4HuUsWvz4iSiDzsXuNv2Hoz\\r\\n2tm3dRimH0QfypuMeUP8pux7ewWpPfAse3P2NZfMucMBsg7kUaDKZNjoNPrwwOwO\\r\\nTKco\\/JpbjwEkt7CIp63JPd9KrWfrjMCKHito44UCgYEA2mfs7Cz+vWTblEOHS5Xj\\r\\nRtUwUC8uLNoQfk98AkxrKL8f1XY0AqOnDXnxNpXDXPHQSGANVTLkxaU2grKiPdK1\\r\\nvgAUZMsMBAZMpzr4ll3GPlJUmwifM9G9SiPjH4YY8ckrHi2XzZf3dCt8+m08Zhac\\r\\n3mNZ2awSFJNeuQxAtI6AhdQ=\\r\\n-----END PRIVATE KEY-----\",\"version_image\":\"\\/uploads\\/20200721\\/ad9c9de0deff14d9079f92288f4156c4.jpg\",\"version_update\":\"0\",\"shop_commission\":\"0.97\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596507867);
INSERT INTO `table_admin_log` VALUES (921, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508464);
INSERT INTO `table_admin_log` VALUES (922, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508467);
INSERT INTO `table_admin_log` VALUES (923, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508618);
INSERT INTO `table_admin_log` VALUES (924, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508619);
INSERT INTO `table_admin_log` VALUES (925, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508629);
INSERT INTO `table_admin_log` VALUES (926, 1, 'root', '/admin.php/category/edit/ids/1?dialog=1', '分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"type\":\"shop_type\",\"pid\":\"0\",\"name\":\"\\u9996\\u9875\\u5206\\u7c7b\",\"nickname\":\"\\u9996\\u9875\\u5206\\u7c7b\",\"image\":\"\\/uploads\\/20200602\\/1697e86b109f155ed46b7e58041b5404.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"10\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508679);
INSERT INTO `table_admin_log` VALUES (927, 1, 'root', '/admin.php/category/edit/ids/2?dialog=1', '分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"type\":\"shop_type\",\"pid\":\"0\",\"name\":\"\\u5206\\u7c7b\\u9875\",\"nickname\":\"\\u5206\\u7c7b\\u9875\",\"image\":\"\\/uploads\\/20200602\\/ed08658034b5d0dbd3a7c3225a35c180.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"9\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508691);
INSERT INTO `table_admin_log` VALUES (928, 1, 'root', '/admin.php/category/edit/ids/1?dialog=1', '分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"type\":\"shop_type\",\"pid\":\"0\",\"name\":\"\\u9996\\u9875\",\"nickname\":\"\\u9996\\u9875\",\"image\":\"\\/uploads\\/20200602\\/1697e86b109f155ed46b7e58041b5404.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"10\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508696);
INSERT INTO `table_admin_log` VALUES (929, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508732);
INSERT INTO `table_admin_log` VALUES (930, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508732);
INSERT INTO `table_admin_log` VALUES (931, 1, 'root', '/admin.php/category/multi/ids/1,2,3,4,5,6,7,8,9,10', '分类管理 批量更新', '{\"ids\":\"1,2,3,4,5,6,7,8,9,10\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508745);
INSERT INTO `table_admin_log` VALUES (932, 1, 'root', '/admin.php/category/multi/ids/1,2', '分类管理 批量更新', '{\"ids\":\"1,2\",\"params\":\"status=normal\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508750);
INSERT INTO `table_admin_log` VALUES (933, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508755);
INSERT INTO `table_admin_log` VALUES (934, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508759);
INSERT INTO `table_admin_log` VALUES (935, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508759);
INSERT INTO `table_admin_log` VALUES (936, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"searchShopId\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508833);
INSERT INTO `table_admin_log` VALUES (937, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508836);
INSERT INTO `table_admin_log` VALUES (938, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508836);
INSERT INTO `table_admin_log` VALUES (939, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508853);
INSERT INTO `table_admin_log` VALUES (940, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508880);
INSERT INTO `table_admin_log` VALUES (941, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508881);
INSERT INTO `table_admin_log` VALUES (942, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508882);
INSERT INTO `table_admin_log` VALUES (943, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508884);
INSERT INTO `table_admin_log` VALUES (944, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508922);
INSERT INTO `table_admin_log` VALUES (945, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508922);
INSERT INTO `table_admin_log` VALUES (946, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508924);
INSERT INTO `table_admin_log` VALUES (947, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508924);
INSERT INTO `table_admin_log` VALUES (948, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596508925);
INSERT INTO `table_admin_log` VALUES (949, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509000);
INSERT INTO `table_admin_log` VALUES (950, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509001);
INSERT INTO `table_admin_log` VALUES (951, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509003);
INSERT INTO `table_admin_log` VALUES (952, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509004);
INSERT INTO `table_admin_log` VALUES (953, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509006);
INSERT INTO `table_admin_log` VALUES (954, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509006);
INSERT INTO `table_admin_log` VALUES (955, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"nav_tb1.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509044);
INSERT INTO `table_admin_log` VALUES (956, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"1\",\"name\":\"\\u79d1\\u5b66\\u9664\\u919b\",\"thumb_image\":\"\\/uploads\\/20200804\\/4fb02b43c1f4760c29415e74ed390506.png\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509053);
INSERT INTO `table_admin_log` VALUES (957, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509152);
INSERT INTO `table_admin_log` VALUES (958, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509156);
INSERT INTO `table_admin_log` VALUES (959, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509203);
INSERT INTO `table_admin_log` VALUES (960, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509205);
INSERT INTO `table_admin_log` VALUES (961, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509205);
INSERT INTO `table_admin_log` VALUES (962, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509205);
INSERT INTO `table_admin_log` VALUES (963, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509206);
INSERT INTO `table_admin_log` VALUES (964, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509207);
INSERT INTO `table_admin_log` VALUES (965, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509208);
INSERT INTO `table_admin_log` VALUES (966, 1, 'root', '/admin.php/shop_category/edit/ids/1?dialog=1', '分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2,1\",\"name\":\"\\u79d1\\u5b66\\u9664\\u919b\",\"thumb_image\":\"\\/uploads\\/20200804\\/4fb02b43c1f4760c29415e74ed390506.png\",\"weigh\":\"1\",\"status\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509212);
INSERT INTO `table_admin_log` VALUES (967, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509241);
INSERT INTO `table_admin_log` VALUES (968, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509467);
INSERT INTO `table_admin_log` VALUES (969, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509468);
INSERT INTO `table_admin_log` VALUES (970, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509469);
INSERT INTO `table_admin_log` VALUES (971, 1, 'root', '/admin.php/shop_category/edit/ids/1?dialog=1', '分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2,1\",\"name\":\"\\u79d1\\u5b66\\u9664\\u919b\",\"thumb_image\":\"\\/uploads\\/20200804\\/4fb02b43c1f4760c29415e74ed390506.png\",\"weigh\":\"1\",\"status\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596509470);
INSERT INTO `table_admin_log` VALUES (972, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511651);
INSERT INTO `table_admin_log` VALUES (973, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_test\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511655);
INSERT INTO `table_admin_log` VALUES (974, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511659);
INSERT INTO `table_admin_log` VALUES (975, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511660);
INSERT INTO `table_admin_log` VALUES (976, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511660);
INSERT INTO `table_admin_log` VALUES (977, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511660);
INSERT INTO `table_admin_log` VALUES (978, 1, 'root', '/admin.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"table_test\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511676);
INSERT INTO `table_admin_log` VALUES (979, 1, 'root', '/admin.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"table_test\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511677);
INSERT INTO `table_admin_log` VALUES (980, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511677);
INSERT INTO `table_admin_log` VALUES (981, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511693);
INSERT INTO `table_admin_log` VALUES (982, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511694);
INSERT INTO `table_admin_log` VALUES (983, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511694);
INSERT INTO `table_admin_log` VALUES (984, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511694);
INSERT INTO `table_admin_log` VALUES (985, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_category\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511696);
INSERT INTO `table_admin_log` VALUES (986, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_category\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511696);
INSERT INTO `table_admin_log` VALUES (987, 1, 'root', '/admin.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"table_test\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"3\":{\"relation\":\"table_category\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"category_ids\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511710);
INSERT INTO `table_admin_log` VALUES (988, 1, 'root', '/admin.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"table_test\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"3\":{\"relation\":\"table_category\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"category_ids\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511710);
INSERT INTO `table_admin_log` VALUES (989, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511711);
INSERT INTO `table_admin_log` VALUES (990, 1, 'root', '/admin.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511721);
INSERT INTO `table_admin_log` VALUES (991, 1, 'root', '/admin.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511722);
INSERT INTO `table_admin_log` VALUES (992, 1, 'root', '/admin.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511724);
INSERT INTO `table_admin_log` VALUES (993, 1, 'root', '/admin.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511725);
INSERT INTO `table_admin_log` VALUES (994, 1, 'root', '/admin.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Test.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511726);
INSERT INTO `table_admin_log` VALUES (995, 1, 'root', '/admin.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Test.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511727);
INSERT INTO `table_admin_log` VALUES (996, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511727);
INSERT INTO `table_admin_log` VALUES (997, 1, 'root', '/admin.php/category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511731);
INSERT INTO `table_admin_log` VALUES (998, 1, 'root', '/admin.php/category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511733);
INSERT INTO `table_admin_log` VALUES (999, 1, 'root', '/admin.php/category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511734);
INSERT INTO `table_admin_log` VALUES (1000, 1, 'root', '/admin.php/category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"shop_type\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511768);
INSERT INTO `table_admin_log` VALUES (1001, 1, 'root', '/admin.php/category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"shop_type\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511769);
INSERT INTO `table_admin_log` VALUES (1002, 1, 'root', '/admin.php/category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"shop_type\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511769);
INSERT INTO `table_admin_log` VALUES (1003, 1, 'root', '/admin.php/category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"shop_type\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511769);
INSERT INTO `table_admin_log` VALUES (1004, 1, 'root', '/admin.php/category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"shop_type\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511770);
INSERT INTO `table_admin_log` VALUES (1005, 1, 'root', '/admin.php/category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"shop_type\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511770);
INSERT INTO `table_admin_log` VALUES (1006, 1, 'root', '/admin.php/test/add?dialog=1', 'Test 添加', '{\"dialog\":\"1\",\"row\":{\"category_ids\":\"8,4,10,7,1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511771);
INSERT INTO `table_admin_log` VALUES (1007, 1, 'root', '/admin.php/category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"8,4,10,7,1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"8,4,10,7,1\",\"searchField\":[\"name\"],\"custom\":{\"type\":\"test\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596511774);
INSERT INTO `table_admin_log` VALUES (1008, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596512521);
INSERT INTO `table_admin_log` VALUES (1009, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596512522);
INSERT INTO `table_admin_log` VALUES (1010, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596512524);
INSERT INTO `table_admin_log` VALUES (1011, 1, 'root', '/admin.php/shop_category/edit/ids/1?dialog=1', '分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2,1\",\"name\":\"\\u79d1\\u5b66\\u9664\\u919b\",\"thumb_image\":\"\\/uploads\\/20200804\\/4fb02b43c1f4760c29415e74ed390506.png\",\"weigh\":\"1\",\"status\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596512525);
INSERT INTO `table_admin_log` VALUES (1012, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596512529);
INSERT INTO `table_admin_log` VALUES (1013, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596512530);
INSERT INTO `table_admin_log` VALUES (1014, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596512577);
INSERT INTO `table_admin_log` VALUES (1015, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596512578);
INSERT INTO `table_admin_log` VALUES (1016, 1, 'root', '/admin.php/shop_category/edit/ids/1?dialog=1', '分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2,1\",\"name\":\"\\u79d1\\u5b66\\u9664\\u919b\",\"thumb_image\":\"\\/uploads\\/20200804\\/4fb02b43c1f4760c29415e74ed390506.png\",\"weigh\":\"1\",\"status\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596512579);
INSERT INTO `table_admin_log` VALUES (1017, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2,1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2,1\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596512582);
INSERT INTO `table_admin_log` VALUES (1018, 1, 'root', '/admin.php/category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"8,4,10,7,1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"8,4,10,7,1\",\"searchField\":[\"name\"],\"custom\":{\"type\":\"test\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596512736);
INSERT INTO `table_admin_log` VALUES (1019, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2,1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2,1\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596512775);
INSERT INTO `table_admin_log` VALUES (1020, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2,1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2,1\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518377);
INSERT INTO `table_admin_log` VALUES (1021, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518382);
INSERT INTO `table_admin_log` VALUES (1022, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518382);
INSERT INTO `table_admin_log` VALUES (1023, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518382);
INSERT INTO `table_admin_log` VALUES (1024, 1, 'root', '/admin.php/shop_category/edit/ids/1?dialog=1', '分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"1\",\"name\":\"\\u79d1\\u5b66\\u9664\\u919b\",\"thumb_image\":\"\\/uploads\\/20200804\\/4fb02b43c1f4760c29415e74ed390506.png\",\"weigh\":\"1\",\"status\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518384);
INSERT INTO `table_admin_log` VALUES (1025, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518802);
INSERT INTO `table_admin_log` VALUES (1026, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518802);
INSERT INTO `table_admin_log` VALUES (1027, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518828);
INSERT INTO `table_admin_log` VALUES (1028, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518829);
INSERT INTO `table_admin_log` VALUES (1029, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518833);
INSERT INTO `table_admin_log` VALUES (1030, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518835);
INSERT INTO `table_admin_log` VALUES (1031, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518901);
INSERT INTO `table_admin_log` VALUES (1032, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518973);
INSERT INTO `table_admin_log` VALUES (1033, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518983);
INSERT INTO `table_admin_log` VALUES (1034, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596518984);
INSERT INTO `table_admin_log` VALUES (1035, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"nav_tb2.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519003);
INSERT INTO `table_admin_log` VALUES (1036, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"1\",\"name\":\"\\u54c1\\u724c\\u4ecb\\u7ecd\",\"thumb_image\":\"\\/uploads\\/20200804\\/6ec48295acf2c5168ba4005352a88070.png\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519007);
INSERT INTO `table_admin_log` VALUES (1037, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519011);
INSERT INTO `table_admin_log` VALUES (1038, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519011);
INSERT INTO `table_admin_log` VALUES (1039, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"nav_tb3.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519030);
INSERT INTO `table_admin_log` VALUES (1040, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"1\",\"name\":\"\\u6210\\u529f\\u6848\\u4f8b\",\"thumb_image\":\"\\/uploads\\/20200804\\/d5fdd45b6b6e89f184d49edad75e8c8f.png\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519033);
INSERT INTO `table_admin_log` VALUES (1041, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519035);
INSERT INTO `table_admin_log` VALUES (1042, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519036);
INSERT INTO `table_admin_log` VALUES (1043, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"nav_tb4.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519050);
INSERT INTO `table_admin_log` VALUES (1044, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"1\",\"name\":\"\\u6838\\u5fc3\\u4f18\\u52bf\",\"thumb_image\":\"\\/uploads\\/20200804\\/3abe70d1befde1ac32b91e1f8e704dfe.png\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519056);
INSERT INTO `table_admin_log` VALUES (1045, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519058);
INSERT INTO `table_admin_log` VALUES (1046, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519063);
INSERT INTO `table_admin_log` VALUES (1047, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"nav_tb5.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519072);
INSERT INTO `table_admin_log` VALUES (1048, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"1\",\"name\":\"\\u8363\\u8a89\\u8d44\\u8d28\",\"thumb_image\":\"\\/uploads\\/20200804\\/30fbfb8b1092e2c5e7a7a40d74871303.png\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519075);
INSERT INTO `table_admin_log` VALUES (1049, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519077);
INSERT INTO `table_admin_log` VALUES (1050, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519078);
INSERT INTO `table_admin_log` VALUES (1051, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"nav_tb6.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519092);
INSERT INTO `table_admin_log` VALUES (1052, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"1\",\"name\":\"\\u4e13\\u5bb6\\u95ee\\u7b54\",\"thumb_image\":\"\\/uploads\\/20200804\\/32554a3dca56e851e00089144f873528.png\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519095);
INSERT INTO `table_admin_log` VALUES (1053, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519098);
INSERT INTO `table_admin_log` VALUES (1054, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519101);
INSERT INTO `table_admin_log` VALUES (1055, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519106);
INSERT INTO `table_admin_log` VALUES (1056, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\\u6743\\u5a01\\u62a5\\u544a\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\\u6743\\u5a01\\u62a5\\u544a\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519107);
INSERT INTO `table_admin_log` VALUES (1057, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519109);
INSERT INTO `table_admin_log` VALUES (1058, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"nav_tb7.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519119);
INSERT INTO `table_admin_log` VALUES (1059, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"1\",\"name\":\"\\u6743\\u5a01\\u62a5\\u544a\",\"thumb_image\":\"\\/uploads\\/20200804\\/85321b80c392ce2c1f283c9b6b3179e0.png\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519121);
INSERT INTO `table_admin_log` VALUES (1060, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519124);
INSERT INTO `table_admin_log` VALUES (1061, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519126);
INSERT INTO `table_admin_log` VALUES (1062, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"nav_tb8.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519138);
INSERT INTO `table_admin_log` VALUES (1063, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"1\",\"name\":\"\\u516c\\u53f8\\u7b80\\u5386\",\"thumb_image\":\"\\/uploads\\/20200804\\/4902fb07725ad8622d61b787ede920ec.png\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519140);
INSERT INTO `table_admin_log` VALUES (1064, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519163);
INSERT INTO `table_admin_log` VALUES (1065, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519408);
INSERT INTO `table_admin_log` VALUES (1066, 1, 'root', '/admin.php/shop_category/edit/ids/8?dialog=1', '分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"1\",\"name\":\"\\u516c\\u53f8\\u7b80\\u5386\",\"thumb_image\":\"\\/uploads\\/20200804\\/4902fb07725ad8622d61b787ede920ec.png\",\"content\":\"\\u5317\\u4eac\\u767e\\u4e07\\u5bb6\\u56ed\\u5ba4\\u5185\\u88c5\\u9970\\u76d1\\u7406\\u6709\\u9650\\u516c\\u53f8\\uff0c\\u4e8e2000-07-03\\u5728\\u5317\\u4eac\\u5e02\\u6ce8\\u518c\\u6210\\u7acb\\uff0c\\u5c5e\\u4e8e\\u79d1\\u5b66\\u7814\\u7a76\\u548c\\u6280\\u672f\\u670d\\u52a1\\u4e1a\\uff0c\\u4e3b\\u8425\\u884c\\u4e1a\\u4e3a\\u4e13\\u4e1a\\u6280\\u672f\\u670d\\u52a1\\u4e1a\\uff0c\\u670d\\u52a1\\u9886\\u57df\\u4e3a\\u5bb6\\u5c45\\u88c5\\u9970\\u5de5\\u7a0b\\u76d1\\u7406\\uff1b\\u6280\\u672f\\u5f00\\u53d1\\u3001\\u6280\\u672f\\u8f6c\\u8ba9\\u3001\\u6280\\u672f\\u57f9\\u8bad\\u3001\\u6280\\u672f\\u54a8\\u8be2\\u3002\\uff0c\\u6ce8\\u518c\\u8d44\\u672c188\\u4e07\\u5143\\u4eba\\u6c11\\u5e01\\u3002\\u5317\\u4eac\\u767e\\u4e07\\u5bb6\\u56ed\\u5ba4\\u5185\\u88c5\\u9970\\u76d1\\u7406\\u6709\\u9650\\u516c\\u53f8\\u529e\\u516c\\u5730\\u5740\\u4e3a\\u5317\\u4eac\\u5e02\\u671d\\u9633\\u533a\\u519c\\u5149\\u5357\\u91cc1\\u53f7(\\u4f4f\\u5b85)\\u697c(\\u9f99\\u8f89\\u5927\\u53a6\\u5c31\\u5c42\\u5357\\u4fa7)907\\u5ba4\\uff0c\\u5982\\u679c\\u60a8\\u5bf9\\u6211\\u4eec\\u7684\\u4ea7\\u54c1\\u3001\\u6280\\u672f\\u6216\\u670d\\u52a1\\u6709\\u5174\\u8da3\\uff0c\\u968f\\u65f6\\u6b22\\u8fce\\u60a8\\u7684\\u6765\\u7535\\u6216\\u4e0a\\u95e8\\u54a8\\u8be2\\u3002\",\"weigh\":\"8\",\"status\":\"1\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519490);
INSERT INTO `table_admin_log` VALUES (1067, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596519494);
INSERT INTO `table_admin_log` VALUES (1068, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"1,8,7,6,5,4,3,2\",\"changeid\":\"1\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596520015);
INSERT INTO `table_admin_log` VALUES (1069, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"1,2,8,7,6,5,4,3\",\"changeid\":\"2\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596520017);
INSERT INTO `table_admin_log` VALUES (1070, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"1,2,3,8,7,6,5,4\",\"changeid\":\"3\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596520019);
INSERT INTO `table_admin_log` VALUES (1071, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"1,2,3,4,8,7,6,5\",\"changeid\":\"4\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596520021);
INSERT INTO `table_admin_log` VALUES (1072, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"1,2,3,4,5,8,7,6\",\"changeid\":\"5\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596520023);
INSERT INTO `table_admin_log` VALUES (1073, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"1,2,3,4,5,6,8,7\",\"changeid\":\"6\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596520025);
INSERT INTO `table_admin_log` VALUES (1074, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"1,2,3,4,5,6,7,8\",\"changeid\":\"7\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596520027);
INSERT INTO `table_admin_log` VALUES (1075, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521339);
INSERT INTO `table_admin_log` VALUES (1076, 1, 'root', '/admin.php/command/get_field_list', '在线命令管理', '{\"table\":\"table_content_video\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521345);
INSERT INTO `table_admin_log` VALUES (1077, 1, 'root', '/admin.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"table_content_video\",\"controller\":\"content\\/ContetVideo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521369);
INSERT INTO `table_admin_log` VALUES (1078, 1, 'root', '/admin.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"table_content_video\",\"controller\":\"content\\/ContetVideo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521370);
INSERT INTO `table_admin_log` VALUES (1079, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521371);
INSERT INTO `table_admin_log` VALUES (1080, 1, 'root', '/admin.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521374);
INSERT INTO `table_admin_log` VALUES (1081, 1, 'root', '/admin.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521375);
INSERT INTO `table_admin_log` VALUES (1082, 1, 'root', '/admin.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521379);
INSERT INTO `table_admin_log` VALUES (1083, 1, 'root', '/admin.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"content\\/ContetVideo.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521419);
INSERT INTO `table_admin_log` VALUES (1084, 1, 'root', '/admin.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"content\\/ContetVideo.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521420);
INSERT INTO `table_admin_log` VALUES (1085, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521421);
INSERT INTO `table_admin_log` VALUES (1086, 1, 'root', '/admin.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"table_content_video\",\"controller\":\"content\\/ContetVideo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521459);
INSERT INTO `table_admin_log` VALUES (1087, 1, 'root', '/admin.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"table_content_video\",\"controller\":\"content\\/ContetVideo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521459);
INSERT INTO `table_admin_log` VALUES (1088, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596521460);
INSERT INTO `table_admin_log` VALUES (1089, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"a41aee5b028fc74adf4ef7448a0194c7b27248a3a85025b94d0f4c63f7326c3400e31dca0a0dc79205e005b315f7f2a6.mp4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596524477);
INSERT INTO `table_admin_log` VALUES (1090, 1, 'root', '/admin.php/content/contet_video/edit/ids/1?dialog=1', '内容管理 视频轮播 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20200804\\/83bfdb846e5a006a7d0bc81864ac0a38.png\",\"video_image\":\"\\/uploads\\/20200804\\/83888c9ccd5b24cd7f90ae0a065551a4.mp4\",\"weigh\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596524526);
INSERT INTO `table_admin_log` VALUES (1091, 1, 'root', '/admin.php/content/contet_video/edit/ids/3?dialog=1', '内容管理 视频轮播 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20200804\\/83bfdb846e5a006a7d0bc81864ac0a38.png\",\"video_image\":\"\\/uploads\\/20200804\\/83888c9ccd5b24cd7f90ae0a065551a4.mp4\",\"weigh\":\"3\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596524566);
INSERT INTO `table_admin_log` VALUES (1092, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"a41aee5b028fc74adf4ef7448a0194c7b27248a3a85025b94d0f4c63f7326c3400e31dca0a0dc79205e005b315f7f2a6.mp4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596524669);
INSERT INTO `table_admin_log` VALUES (1093, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"a41aee5b028fc74adf4ef7448a0194c7b27248a3a85025b94d0f4c63f7326c3400e31dca0a0dc79205e005b315f7f2a6.mp4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596524720);
INSERT INTO `table_admin_log` VALUES (1094, 1, 'root', '/admin.php/content/contet_video/edit/ids/2?dialog=1', '内容管理 视频轮播 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20200804\\/83bfdb846e5a006a7d0bc81864ac0a38.png\",\"video_image\":\"\\/uploads\\/20200804\\/83888c9ccd5b24cd7f90ae0a065551a4.mp4\",\"weigh\":\"2\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596524722);
INSERT INTO `table_admin_log` VALUES (1095, 1, 'root', '/admin.php/auth/rule/edit/ids/175?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"4923c286bef181c69daac18271f291e6\",\"row\":{\"ismenu\":\"1\",\"pid\":\"168\",\"name\":\"content\\/content_discount\\/edit\\/ids\\/1\",\"title\":\"\\u4f18\\u60e0\\u4e13\\u533a\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"175\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533182);
INSERT INTO `table_admin_log` VALUES (1096, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533182);
INSERT INTO `table_admin_log` VALUES (1097, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"shop_id\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533216);
INSERT INTO `table_admin_log` VALUES (1098, 1, 'root', '/admin.php/auth/rule/edit/ids/175?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"03eb0589e018cf35d850dc006fdfbb14\",\"row\":{\"ismenu\":\"1\",\"pid\":\"168\",\"name\":\"content\\/content_discount\\/edit\\/ids\\/1\",\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"175\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533248);
INSERT INTO `table_admin_log` VALUES (1099, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533248);
INSERT INTO `table_admin_log` VALUES (1100, 1, 'root', '/admin.php/auth/rule/edit/ids/175?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"d0940aa25989258a8a17f53262b6af4a\",\"row\":{\"ismenu\":\"1\",\"pid\":\"168\",\"name\":\"content\\/content_discount\\/edit\\/ids\\/1\",\"title\":\"\\u516c\\u53f8\\u4fe1\\u606f\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"175\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533262);
INSERT INTO `table_admin_log` VALUES (1101, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533262);
INSERT INTO `table_admin_log` VALUES (1102, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"shop_id\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533268);
INSERT INTO `table_admin_log` VALUES (1103, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"shop_id\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533274);
INSERT INTO `table_admin_log` VALUES (1104, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"shop_id\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533554);
INSERT INTO `table_admin_log` VALUES (1105, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"shop_id\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533579);
INSERT INTO `table_admin_log` VALUES (1106, 1, 'root', '/admin.php/category/index', '分类管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"content_discount\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533656);
INSERT INTO `table_admin_log` VALUES (1107, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"shop_id\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533696);
INSERT INTO `table_admin_log` VALUES (1108, 1, 'root', '/admin.php/content/content_discount/edit/ids/1?addtabs=1', '内容管理 编辑', '{\"addtabs\":\"1\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533697);
INSERT INTO `table_admin_log` VALUES (1109, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533699);
INSERT INTO `table_admin_log` VALUES (1110, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"shop_id\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533705);
INSERT INTO `table_admin_log` VALUES (1111, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533710);
INSERT INTO `table_admin_log` VALUES (1112, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"shop_id\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533725);
INSERT INTO `table_admin_log` VALUES (1113, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"shop_id\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533727);
INSERT INTO `table_admin_log` VALUES (1114, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"shop_id\":\"39.880581\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533746);
INSERT INTO `table_admin_log` VALUES (1115, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"shop_id\":\"39.880581\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533748);
INSERT INTO `table_admin_log` VALUES (1116, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533777);
INSERT INTO `table_admin_log` VALUES (1117, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533778);
INSERT INTO `table_admin_log` VALUES (1118, 1, 'root', '/admin.php/content/content_discount/edit/ids/1?addtabs=1', '内容管理 编辑', '{\"addtabs\":\"1\",\"row\":{\"type_list\":\"1\",\"category_id\":\"116.461827\",\"shop_id\":\"39.880581\",\"good_id\":\"39\",\"image\":\"\\/uploads\\/20200804\\/4902fb07725ad8622d61b787ede920ec.png\",\"weigh\":\"0\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533791);
INSERT INTO `table_admin_log` VALUES (1119, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"39\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"39\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533795);
INSERT INTO `table_admin_log` VALUES (1120, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"39\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"39\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533855);
INSERT INTO `table_admin_log` VALUES (1121, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"39\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"39\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533898);
INSERT INTO `table_admin_log` VALUES (1122, 1, 'root', '/admin.php/content/content_discount/edit/ids/1?addtabs=1', '内容管理 编辑', '{\"addtabs\":\"1\",\"row\":{\"type_list\":\"1\",\"category_id\":\"116.461827\",\"shop_id\":\"39.880581\",\"good_id\":\"39\",\"image\":\"\\/uploads\\/20200804\\/4902fb07725ad8622d61b787ede920ec.png\",\"weigh\":\"0\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533909);
INSERT INTO `table_admin_log` VALUES (1123, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"39\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"39\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533913);
INSERT INTO `table_admin_log` VALUES (1124, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"39\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"39\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596533951);
INSERT INTO `table_admin_log` VALUES (1125, 1, 'root', '/admin.php/content/content_discount/edit/ids/1?addtabs=1', '内容管理 编辑', '{\"addtabs\":\"1\",\"row\":{\"category_id\":\"116.4618270\",\"shop_id\":\"39.8805810\",\"good_id\":\"\\u5317\\u4eac\\u767e\\u4e07\\u5bb6\\u56ed\\u88c5\\u4fee\\u76d1\\u7406\\u4e2d\\u5fc3\",\"image\":\"\\/uploads\\/20200804\\/4902fb07725ad8622d61b787ede920ec.png\",\"weigh\":\"0\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596534020);
INSERT INTO `table_admin_log` VALUES (1126, 1, 'root', '/admin.php/content/content_discount/edit/ids/1?addtabs=1', '内容管理 编辑', '{\"addtabs\":\"1\",\"row\":{\"category_id\":\"116.4618270\",\"shop_id\":\"39.8805810\",\"good_id\":\"0\",\"weigh\":\"0\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596534263);
INSERT INTO `table_admin_log` VALUES (1127, 1, 'root', '/admin.php/content/content_discount/edit/ids/1?addtabs=1', '内容管理 编辑', '{\"addtabs\":\"1\",\"row\":{\"category_id\":\"116.4618270\",\"shop_id\":\"39.8805810\",\"good_id\":\"0\",\"weigh\":\"0\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596534318);
INSERT INTO `table_admin_log` VALUES (1128, 1, 'root', '/admin.php/content/content_discount/edit/ids/1?addtabs=1', '内容管理 编辑', '{\"addtabs\":\"1\",\"row\":{\"category_id\":\"116.4618270\",\"shop_id\":\"39.8805810\",\"good_id\":\"0\",\"weigh\":\"0\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596534321);
INSERT INTO `table_admin_log` VALUES (1129, 1, 'root', '/admin.php/content/content_discount/edit/ids/1?addtabs=1', '内容管理 编辑', '{\"addtabs\":\"1\",\"row\":{\"category_id\":\"116.4618270\",\"shop_id\":\"39.8805810\",\"good_id\":\"\\u5317\\u4eac\\u767e\\u4e07\\u5bb6\\u56ed\\u88c5\\u4fee\\u76d1\\u7406\\u4e2d\\u5fc3\",\"weigh\":\"0\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596534591);
INSERT INTO `table_admin_log` VALUES (1130, 1, 'root', '/admin.php/content/content_discount/edit/ids/1?addtabs=1', '内容管理 编辑', '{\"addtabs\":\"1\",\"row\":{\"category_id\":\"116.4618270\",\"shop_id\":\"39.8805810\",\"good_id\":\"\\u5317\\u4eac\\u767e\\u4e07\\u5bb6\\u56ed\\u88c5\\u4fee\\u76d1\\u7406\\u4e2d\\u5fc3\",\"weigh\":\"\\u5317\\u4eac\\u767e\\u4e07\\u5bb6\\u56ed\\u88c5\\u4fee\\u76d1\\u7406\\u4e2d\\u5fc3\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596534625);
INSERT INTO `table_admin_log` VALUES (1131, 1, 'root', '/admin.php/content/content_discount/edit/ids/1?addtabs=1', '内容管理 编辑', '{\"addtabs\":\"1\",\"row\":{\"category_id\":\"116.4618270\",\"shop_id\":\"39.8805810\",\"good_id\":\"\\u5317\\u4eac\\u767e\\u4e07\\u5bb6\\u56ed\\u88c5\\u4fee\\u76d1\\u7406\\u4e2d\\u5fc3\",\"weigh\":\"\\u5317\\u4eac\\u767e\\u4e07\\u5bb6\\u56ed\\u88c5\\u4fee\\u76d1\\u7406\\u4e2d\\u5fc3\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596534646);
INSERT INTO `table_admin_log` VALUES (1132, 1, 'root', '/admin.php/content/content_discount/edit/ids/1?addtabs=1', '内容管理 编辑', '{\"addtabs\":\"1\",\"row\":{\"category_id\":\"116.4618270\",\"shop_id\":\"39.8805810\",\"good_id\":\"\\u5317\\u4eac\\u767e\\u4e07\\u5bb6\\u56ed\\u88c5\\u4fee\\u76d1\\u7406\\u4e2d\\u5fc3\",\"weigh\":\"010-67309999\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596534657);
INSERT INTO `table_admin_log` VALUES (1133, 1, 'root', '/admin.php/content/content_discount/edit/ids/1?addtabs=1', '内容管理 编辑', '{\"addtabs\":\"1\",\"row\":{\"good_id\":\"\\u5317\\u4eac\\u767e\\u4e07\\u5bb6\\u56ed\\u88c5\\u4fee\\u76d1\\u7406\\u4e2d\\u5fc3\",\"category_id\":\"116.4618270\",\"shop_id\":\"39.8805810\",\"type_list\":\"\\u5317\\u4eac\\u5e02\\u671d\\u9633\\u533a\\u519c\\u5149\\u5357\\u91cc1\\u53f7(\\u4f4f\\u5b85)\\u697c(\\u9f99\\u8f89\\u5927\\u53a6\\u5c31\\u5c42\\u5357\",\"weigh\":\"010-67309999\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535270);
INSERT INTO `table_admin_log` VALUES (1134, 1, 'root', '/admin.php/auth/rule/edit/ids/224?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"3dedb2b59ad69934a28cae36346c30ac\",\"row\":{\"ismenu\":\"1\",\"pid\":\"168\",\"name\":\"content\\/contet_video\",\"title\":\"\\u89c6\\u9891\\u8f6e\\u64ad\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"10\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"224\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535734);
INSERT INTO `table_admin_log` VALUES (1135, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535735);
INSERT INTO `table_admin_log` VALUES (1136, 1, 'root', '/admin.php/auth/rule/multi/ids/212', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"212\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535752);
INSERT INTO `table_admin_log` VALUES (1137, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535752);
INSERT INTO `table_admin_log` VALUES (1138, 1, 'root', '/admin.php/auth/rule/multi/ids/193', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"193\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535759);
INSERT INTO `table_admin_log` VALUES (1139, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535759);
INSERT INTO `table_admin_log` VALUES (1140, 1, 'root', '/admin.php/auth/rule/multi/ids/187', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"187\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535764);
INSERT INTO `table_admin_log` VALUES (1141, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535764);
INSERT INTO `table_admin_log` VALUES (1142, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535785);
INSERT INTO `table_admin_log` VALUES (1143, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535785);
INSERT INTO `table_admin_log` VALUES (1144, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb1.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535818);
INSERT INTO `table_admin_log` VALUES (1145, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u5355\\u9879\\u68c0\\u67e5\",\"thumb_image\":\"\\/uploads\\/20200804\\/b87846e8c091921037bffbaef960530a.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535823);
INSERT INTO `table_admin_log` VALUES (1146, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535829);
INSERT INTO `table_admin_log` VALUES (1147, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535829);
INSERT INTO `table_admin_log` VALUES (1148, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535835);
INSERT INTO `table_admin_log` VALUES (1149, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535865);
INSERT INTO `table_admin_log` VALUES (1150, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535871);
INSERT INTO `table_admin_log` VALUES (1151, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb2.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535880);
INSERT INTO `table_admin_log` VALUES (1152, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u5168\\u7a0b\\u76d1\\u7406\",\"thumb_image\":\"\\/uploads\\/20200804\\/78a72a1e648401cfdb850fe514d9cf74.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535881);
INSERT INTO `table_admin_log` VALUES (1153, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535883);
INSERT INTO `table_admin_log` VALUES (1154, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb1.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535912);
INSERT INTO `table_admin_log` VALUES (1155, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb4.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535912);
INSERT INTO `table_admin_log` VALUES (1156, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb2.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535912);
INSERT INTO `table_admin_log` VALUES (1157, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb6.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535913);
INSERT INTO `table_admin_log` VALUES (1158, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb3.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535913);
INSERT INTO `table_admin_log` VALUES (1159, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb7.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535913);
INSERT INTO `table_admin_log` VALUES (1160, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb8.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535913);
INSERT INTO `table_admin_log` VALUES (1161, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb9.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535913);
INSERT INTO `table_admin_log` VALUES (1162, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb10.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535913);
INSERT INTO `table_admin_log` VALUES (1163, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb11.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535913);
INSERT INTO `table_admin_log` VALUES (1164, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb12.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535913);
INSERT INTO `table_admin_log` VALUES (1165, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb13.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535914);
INSERT INTO `table_admin_log` VALUES (1166, 1, 'root', '/admin.php/ajax/upload', '', '{\"name\":\"fl_tb5.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535914);
INSERT INTO `table_admin_log` VALUES (1167, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u6bdb\\u576f\\u623f\\u9a8c\\u6536\",\"thumb_image\":\"\\/uploads\\/20200804\\/9cc7258cc2b130c258e0b51c30845fc5.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535939);
INSERT INTO `table_admin_log` VALUES (1168, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535941);
INSERT INTO `table_admin_log` VALUES (1169, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u7cbe\\u88c5\\u4fee\\u9a8c\\u6536\",\"thumb_image\":\"\\/uploads\\/20200804\\/cddd26e5d4f6b33e2aa6d628a2869e5e.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535983);
INSERT INTO `table_admin_log` VALUES (1170, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596535991);
INSERT INTO `table_admin_log` VALUES (1171, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u88c5\\u4fee\\u5de5\\u7a0b\\u76d1\\u7406\",\"thumb_image\":\"\\/uploads\\/20200804\\/7991529eaed6d7a6098ed28e22d47046.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536005);
INSERT INTO `table_admin_log` VALUES (1172, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536007);
INSERT INTO `table_admin_log` VALUES (1173, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u5ba1\\u6838\\u8bbe\\u8ba1\\u65b9\\u6848\",\"thumb_image\":\"\\/uploads\\/20200804\\/3899c07fa0423cab7f6c62bf8494de88.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536019);
INSERT INTO `table_admin_log` VALUES (1174, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536029);
INSERT INTO `table_admin_log` VALUES (1175, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u5ba1\\u6838\\u88c5\\u4fee\\u62a5\\u4ef7\",\"thumb_image\":\"\\/uploads\\/20200804\\/f2274a84b65c7887402f2e1b84349642.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536040);
INSERT INTO `table_admin_log` VALUES (1176, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536042);
INSERT INTO `table_admin_log` VALUES (1177, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u5bb6\\u5c45\\u73af\\u5883\\u9884\\u8bc4\",\"thumb_image\":\"\\/uploads\\/20200804\\/45d9a6bbb1cbd28d133982a9f2c8af35.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536053);
INSERT INTO `table_admin_log` VALUES (1178, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536056);
INSERT INTO `table_admin_log` VALUES (1179, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u534f\\u52a9\\u7b7e\\u7f72\\u5408\\u540c\",\"thumb_image\":\"\\/uploads\\/20200804\\/a0b4314ad5a282d6a1934d1ec5b29524.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536065);
INSERT INTO `table_admin_log` VALUES (1180, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536071);
INSERT INTO `table_admin_log` VALUES (1181, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u88c5\\u4fee\\u9020\\u4ef7\\u8bc4\\u4f30\",\"thumb_image\":\"\\/uploads\\/20200804\\/62e020e62617ab8b3b9cf617e2e583f8.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536076);
INSERT INTO `table_admin_log` VALUES (1182, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536078);
INSERT INTO `table_admin_log` VALUES (1183, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u63d0\\u4ea4\\u53f8\\u6cd5\\u8bc1\\u636e\",\"thumb_image\":\"\\/uploads\\/20200804\\/27c2bf7ba5d17eed792d33b1cc0f1cdf.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536088);
INSERT INTO `table_admin_log` VALUES (1184, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536089);
INSERT INTO `table_admin_log` VALUES (1185, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u5ba1\\u6838\\u4f01\\u4e1a\\u8d44\\u8d28\",\"thumb_image\":\"\\/uploads\\/20200804\\/586b61dd25278f0c9b252627d069fabb.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536099);
INSERT INTO `table_admin_log` VALUES (1186, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536101);
INSERT INTO `table_admin_log` VALUES (1187, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u7cbe\\u88c5\\u4fee\\u9a8c\\u6536\",\"thumb_image\":\"\\/uploads\\/20200804\\/cddd26e5d4f6b33e2aa6d628a2869e5e.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536113);
INSERT INTO `table_admin_log` VALUES (1188, 1, 'root', '/admin.php/shop_category/del/ids/12', '分类管理 删除', '{\"action\":\"del\",\"ids\":\"12\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536121);
INSERT INTO `table_admin_log` VALUES (1189, 1, 'root', '/admin.php/shop_category/destroy/ids/12', '分类管理 真实删除', '{\"ids\":\"12\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536125);
INSERT INTO `table_admin_log` VALUES (1190, 1, 'root', '/admin.php/Category/selectpage', '分类管理', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"],\"custom\":{\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536149);
INSERT INTO `table_admin_log` VALUES (1191, 1, 'root', '/admin.php/shop_category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"shop_id\":\"2\",\"name\":\"\\u88c5\\u4fee\\u8d28\\u91cf\\u52d8\\u5bdf\",\"thumb_image\":\"\\/uploads\\/20200804\\/676d9be6de7490b24aa11e41c072e0a4.png\",\"content\":\"\",\"weigh\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536154);
INSERT INTO `table_admin_log` VALUES (1192, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"9,22,21,20,19,18,17,16,15,14,13,11,10\",\"changeid\":\"9\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536465);
INSERT INTO `table_admin_log` VALUES (1193, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"9,10,22,21,20,19,18,17,16,15,14,13,11\",\"changeid\":\"10\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536468);
INSERT INTO `table_admin_log` VALUES (1194, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"9,10,11,22,21,20,19,18,17,16,15,14,13\",\"changeid\":\"11\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536471);
INSERT INTO `table_admin_log` VALUES (1195, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"9,10,11,13,22,21,20,19,18,17,16,15,14\",\"changeid\":\"13\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536473);
INSERT INTO `table_admin_log` VALUES (1196, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"9,10,11,13,14,22,21,20,19,18,17,16,15\",\"changeid\":\"14\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536476);
INSERT INTO `table_admin_log` VALUES (1197, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"9,10,11,13,14,15,22,21,20,19,18,17,16\",\"changeid\":\"15\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536478);
INSERT INTO `table_admin_log` VALUES (1198, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"9,10,11,13,14,15,22,16,21,20,19,18,17\",\"changeid\":\"16\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536480);
INSERT INTO `table_admin_log` VALUES (1199, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"9,10,11,13,14,15,22,16,21,17,20,19,18\",\"changeid\":\"17\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536482);
INSERT INTO `table_admin_log` VALUES (1200, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"9,10,11,13,14,15,22,16,21,17,18,20,19\",\"changeid\":\"18\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536484);
INSERT INTO `table_admin_log` VALUES (1201, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"9,10,11,13,14,15,22,16,21,17,18,19,20\",\"changeid\":\"19\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536485);
INSERT INTO `table_admin_log` VALUES (1202, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"9,10,11,13,14,15,16,21,17,18,19,20,22\",\"changeid\":\"22\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536495);
INSERT INTO `table_admin_log` VALUES (1203, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"9,10,11,13,14,15,16,17,18,19,20,21,22\",\"changeid\":\"21\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"shop_category\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596536504);
INSERT INTO `table_admin_log` VALUES (1204, 1, 'root', '/admin.php/ajax/weigh', '', '{\"ids\":\"38,39,40,41,42,43,44,45,46,47\",\"changeid\":\"39\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"good\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539099);
INSERT INTO `table_admin_log` VALUES (1205, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539105);
INSERT INTO `table_admin_log` VALUES (1206, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539107);
INSERT INTO `table_admin_log` VALUES (1207, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539107);
INSERT INTO `table_admin_log` VALUES (1208, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539107);
INSERT INTO `table_admin_log` VALUES (1209, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539108);
INSERT INTO `table_admin_log` VALUES (1210, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539108);
INSERT INTO `table_admin_log` VALUES (1211, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539109);
INSERT INTO `table_admin_log` VALUES (1212, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539110);
INSERT INTO `table_admin_log` VALUES (1213, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539110);
INSERT INTO `table_admin_log` VALUES (1214, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539111);
INSERT INTO `table_admin_log` VALUES (1215, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539112);
INSERT INTO `table_admin_log` VALUES (1216, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539115);
INSERT INTO `table_admin_log` VALUES (1217, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539115);
INSERT INTO `table_admin_log` VALUES (1218, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539116);
INSERT INTO `table_admin_log` VALUES (1219, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539116);
INSERT INTO `table_admin_log` VALUES (1220, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539116);
INSERT INTO `table_admin_log` VALUES (1221, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539116);
INSERT INTO `table_admin_log` VALUES (1222, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539117);
INSERT INTO `table_admin_log` VALUES (1223, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539117);
INSERT INTO `table_admin_log` VALUES (1224, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539117);
INSERT INTO `table_admin_log` VALUES (1225, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539117);
INSERT INTO `table_admin_log` VALUES (1226, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539118);
INSERT INTO `table_admin_log` VALUES (1227, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539118);
INSERT INTO `table_admin_log` VALUES (1228, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539118);
INSERT INTO `table_admin_log` VALUES (1229, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539118);
INSERT INTO `table_admin_log` VALUES (1230, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539118);
INSERT INTO `table_admin_log` VALUES (1231, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539120);
INSERT INTO `table_admin_log` VALUES (1232, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539120);
INSERT INTO `table_admin_log` VALUES (1233, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539121);
INSERT INTO `table_admin_log` VALUES (1234, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539121);
INSERT INTO `table_admin_log` VALUES (1235, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539123);
INSERT INTO `table_admin_log` VALUES (1236, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539123);
INSERT INTO `table_admin_log` VALUES (1237, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539123);
INSERT INTO `table_admin_log` VALUES (1238, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539126);
INSERT INTO `table_admin_log` VALUES (1239, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539126);
INSERT INTO `table_admin_log` VALUES (1240, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539130);
INSERT INTO `table_admin_log` VALUES (1241, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539131);
INSERT INTO `table_admin_log` VALUES (1242, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539133);
INSERT INTO `table_admin_log` VALUES (1243, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"3\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539140);
INSERT INTO `table_admin_log` VALUES (1244, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539143);
INSERT INTO `table_admin_log` VALUES (1245, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"-\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"-\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539144);
INSERT INTO `table_admin_log` VALUES (1246, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"-3\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"-3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539145);
INSERT INTO `table_admin_log` VALUES (1247, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539149);
INSERT INTO `table_admin_log` VALUES (1248, 1, 'root', '/admin.php/good/edit/ids/38?dialog=1', '首页产品 编辑', '{\"dialog\":\"1\",\"row\":{\"good_ids\":\"38,39,40\",\"name\":\"\\u57fa\\u7840\\u9a8c\\u6536-1\",\"original\":\"1300.00\",\"price\":\"800.00\",\"thumb_image\":\"\\/uploads\\/20200803\\/03b9cf24bf437601a42d2ab7efcd43f5.png\",\"images\":\"\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg\",\"content\":\"\",\"status\":\"1\",\"weigh\":\"39\"},\"ids\":\"38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539203);
INSERT INTO `table_admin_log` VALUES (1249, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"38,39,40\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"38,39,40\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539206);
INSERT INTO `table_admin_log` VALUES (1250, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"38,39,40\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"38,39,40\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539206);
INSERT INTO `table_admin_log` VALUES (1251, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"38,39,40\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"38,39,40\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539211);
INSERT INTO `table_admin_log` VALUES (1252, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596539220);
INSERT INTO `table_admin_log` VALUES (1253, 1, 'root', '/admin.php/index/login?url=%2Fadmin.php%2Fgood%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin.php\\/good?ref=addtabs\",\"__token__\":\"b7883d797f3b2e487b123b60f0b7ee45\",\"username\":\"root\",\"captcha\":\"gmet\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596704698);
INSERT INTO `table_admin_log` VALUES (1254, 1, 'root', '/admin.php/index/login', '登录', '{\"__token__\":\"b7ac7573ba4a204b39222c0d91320eb4\",\"username\":\"root\",\"captcha\":\"pdur\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596704749);
INSERT INTO `table_admin_log` VALUES (1255, 0, 'Unknown', '/admin.php/index/login', '', '{\"__token__\":\"68acf0b8366ce2410914b8b4a42e2af9\",\"username\":\"root\",\"captcha\":\"w0jw\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596704768);
INSERT INTO `table_admin_log` VALUES (1256, 1, 'root', '/admin.php/index/login', '登录', '{\"__token__\":\"877541e3f92d2cdf4db3d2b494a89fe4\",\"username\":\"root\",\"captcha\":\"vhvw\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596704773);
INSERT INTO `table_admin_log` VALUES (1257, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"38,39,40\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"38,39,40\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596724505);
INSERT INTO `table_admin_log` VALUES (1258, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"38,39,40\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"38,39,40\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596765429);
INSERT INTO `table_admin_log` VALUES (1259, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596765432);
INSERT INTO `table_admin_log` VALUES (1260, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596765433);
INSERT INTO `table_admin_log` VALUES (1261, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596765433);
INSERT INTO `table_admin_log` VALUES (1262, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596765440);
INSERT INTO `table_admin_log` VALUES (1263, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596765442);
INSERT INTO `table_admin_log` VALUES (1264, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596765444);
INSERT INTO `table_admin_log` VALUES (1265, 1, 'root', '/admin.php/good/edit/ids/38?dialog=1', '首页产品 编辑', '{\"dialog\":\"1\",\"row\":{\"good_ids\":\"39,40,41\",\"name\":\"\\u57fa\\u7840\\u9a8c\\u6536-1\",\"original\":\"1300.00\",\"price\":\"800.00\",\"thumb_image\":\"\\/uploads\\/20200803\\/03b9cf24bf437601a42d2ab7efcd43f5.png\",\"images\":\"\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg\",\"content\":\"\",\"status\":\"1\",\"weigh\":\"39\"},\"ids\":\"38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596765446);
INSERT INTO `table_admin_log` VALUES (1266, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"39,40,41\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"39,40,41\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596766029);
INSERT INTO `table_admin_log` VALUES (1267, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596768390);
INSERT INTO `table_admin_log` VALUES (1268, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596768391);
INSERT INTO `table_admin_log` VALUES (1269, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596768392);
INSERT INTO `table_admin_log` VALUES (1270, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596768393);
INSERT INTO `table_admin_log` VALUES (1271, 1, 'root', '/admin.php/good/edit/ids/40?dialog=1', '首页产品 编辑', '{\"dialog\":\"1\",\"row\":{\"good_ids\":\"47,48,49\",\"name\":\"\\u57fa\\u7840\\u9a8c\\u6536-3\",\"original\":\"1300.00\",\"price\":\"800.00\",\"thumb_image\":\"\\/uploads\\/20200803\\/03b9cf24bf437601a42d2ab7efcd43f5.png\",\"images\":\"\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg\",\"content\":\"\",\"status\":\"1\",\"weigh\":\"39\"},\"ids\":\"40\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596768394);
INSERT INTO `table_admin_log` VALUES (1272, 1, 'root', '/admin.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"c8c773403b441536310bcc126560c3c4\",\"row\":{\"app_id\":\"wxbb98e1aa25ea3d7c\",\"app_secret\":\"4c632970c789ac2fa43bd393ff04edf7\",\"pay_notify_url\":\"https:\\/\\/jxm.bowangyun.net\\/api\\/Pay\\/notifyPay\",\"refund_notify_url\":\"https:\\/\\/jxm.bowangyun.net\\/api\\/Pay\\/notifyRefund\",\"distance_limit\":\"100000000\",\"review\":\"0\",\"mch_id\":\"1503520101\",\"key\":\"dI0iA3aG4iG5bB6gB2aK3oK0dC0hL0sa\",\"ssl_cert\":\"-----BEGIN CERTIFICATE-----\\r\\nMIID8zCCAtugAwIBAgIUFCZAQyBC67M1tqIku42lwuil8hgwDQYJKoZIhvcNAQEL\\r\\nBQAwXjELMAkGA1UEBhMCQ04xEzARBgNVBAoTClRlbnBheS5jb20xHTAbBgNVBAsT\\r\\nFFRlbnBheS5jb20gQ0EgQ2VudGVyMRswGQYDVQQDExJUZW5wYXkuY29tIFJvb3Qg\\r\\nQ0EwHhcNMjAwNjI5MDIxOTM5WhcNMjUwNjI4MDIxOTM5WjCBhDETMBEGA1UEAwwK\\r\\nMTUyNjQ2NzQ5MTEbMBkGA1UECgwS5b6u5L+h5ZWG5oi357O757ufMTAwLgYDVQQL\\r\\nDCfljZrnvZHkupHnp5HmioDvvIjljJfkuqzvvInmnInpmZDlhazlj7gxCzAJBgNV\\r\\nBAYMAkNOMREwDwYDVQQHDAhTaGVuWmhlbjCCASIwDQYJKoZIhvcNAQEBBQADggEP\\r\\nADCCAQoCggEBALFsjUkqrgK1BpMaQPlCK3HeQVRJCep\\/x0VR\\/JKoRlmI\\/U9VWvoM\\r\\n1YkMIVmqj9Rx6QrrNgCUyzD+DYTLk0KT3sEjV72CxitgHi2VeflKmt9wR3XM3bs4\\r\\nO7mcoikG2GyFWEfbZE1VqGcFOJygovryuXr62bO8y\\/y6f8Lfr82T7yQymoSfM+JR\\r\\nlvDdvM1H06Mja+Z2XjbnPTl81MBGC63cDgTKgYHgoB+AIJQrfnF5u7AQDKxqDJBn\\r\\nkuUBwcNJpd0vYKRuFUtS0YNqrRPyI06hMnBdiPwvHJRLnrO\\/BHK61r59w\\/1+\\/Tx4\\r\\ngk9IGOcFxfNC\\/Wd0TqS3BN+Fp+GegkGrXlsCAwEAAaOBgTB\\/MAkGA1UdEwQCMAAw\\r\\nCwYDVR0PBAQDAgTwMGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly9ldmNhLml0cnVz\\r\\nLmNvbS5jbi9wdWJsaWMvaXRydXNjcmw\\/Q0E9MUJENDIyMEU1MERCQzA0QjA2QUQz\\r\\nOTc1NDk4NDZDMDFDM0U4RUJEMjANBgkqhkiG9w0BAQsFAAOCAQEAWDJwbOoY2QgQ\\r\\nKvUmMMFCz4tM58vvEbo8relAyPbuoxAHcyBLtHRTu5h\\/Oa8Jb+\\/BkXFiFW15CwNq\\r\\nOr2rpTGaiYTH3J8D\\/Dlk0L8tjo0dn2+EdgRzSdDp2ew0SQqk5pFfSz2pVfTLo14D\\r\\nS8apr1ftT+m29EuNkwBeUwY49Y8JRN9Wl4VJgfufFoEyITW5yeoppCwCFnL1cxJm\\r\\nWF5p5EPSKFu27xmpn9+W4H+RAJ\\/mDGKxZKmEY0G8xu5agLRq7UoITagARD\\/pjBqQ\\r\\n\\/tpjIg9PMRhE2U7v1wH1ikTruhDwtHZNyQpyBrAxxSQtLCUUUBMGkq0DFwbJX7eh\\r\\nykiQNoT2VA==\\r\\n-----END CERTIFICATE-----\",\"ssl_key\":\"-----BEGIN PRIVATE KEY-----\\r\\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCxbI1JKq4CtQaT\\r\\nGkD5Qitx3kFUSQnqf8dFUfySqEZZiP1PVVr6DNWJDCFZqo\\/UcekK6zYAlMsw\\/g2E\\r\\ny5NCk97BI1e9gsYrYB4tlXn5SprfcEd1zN27ODu5nKIpBthshVhH22RNVahnBTic\\r\\noKL68rl6+tmzvMv8un\\/C36\\/Nk+8kMpqEnzPiUZbw3bzNR9OjI2vmdl425z05fNTA\\r\\nRgut3A4EyoGB4KAfgCCUK35xebuwEAysagyQZ5LlAcHDSaXdL2CkbhVLUtGDaq0T\\r\\n8iNOoTJwXYj8LxyUS56zvwRyuta+fcP9fv08eIJPSBjnBcXzQv1ndE6ktwTfhafh\\r\\nnoJBq15bAgMBAAECggEALPQhFCHBNyRgxxLG1aDjWxWCHfXnkkfP2It+YDZMpNDl\\r\\nxZ0N0P9Bd1jgdlSV3rEB5+dSpnEMzpwAFt5xsFPBA9SNnZGt3j2bR9dwsS4q8WQE\\r\\nZx+CKraDw3KhT53RZiWfCY3X6xRB9+BFyMGWqdioEDXQxQ6X7K\\/gQSLl60OJOvU\\/\\r\\nNYBVsWqjT6\\/5eh9K7qS+2T165Vpv4SJ0CYq9RHLxTy5qpoCfoqdg3e+y5909GnL5\\r\\nRzkY9pCZzgRvuq2EgXtncbBalXfaHsDQ+ztylM6Nut4aphi+QwhJybM6kXbUfwv7\\r\\nxRinTB2onLY4i0ZeSje\\/LPxoYHLeusddzN0UVo6jqQKBgQDgpTj6vQc9xIywGeUC\\r\\njGgSF7MhJC\\/qtVXrwL6+qSZbaS8uXMNEX\\/9Xct+G0\\/HOFCIF0jeJ2zVwQeHaESpE\\r\\n\\/tM\\/TE48cNC+X2PKR5pGHj2kwrq9uz1kptv9VhI3reve7+X3RaH8CDpRLZ\\/X+ad1\\r\\n+IVVedZ9YgqwFL0uJCoYFPhIxwKBgQDKMBF8+BUiBXYULS8nRWOHGmi1JMOq9Hm2\\r\\nYlMKPoktT2eOlDSmw1tsEWSfHOORS\\/Hqg0UtgMTqTyjhtlPe30Fl8tpbt1XJtycY\\r\\noj+CCh8nuAeRNJbQZdWtsyGkOgiVBDix3EmI3LiXjn0c3+E9m9U87DBpmTSJvVp3\\r\\nTPVcGr0xzQKBgH+KTodMuse+x4FTskl4Hb3n5rNyMCI5QcbPb3wf3L8ZQMg5skMn\\r\\nnXiwp2eM\\/UPa+lYDu7Rw2C4buXZtOGpjotvVHrYB9wGedrFpZZVZpfXc+NivbXOv\\r\\nqEZ0j3M9MyUnXpC83\\/KPWUytcorUGtdHeavFuJkHCLpfi+ieb6esgCoRAoGAaIg\\/\\r\\nkmfErUk7iiTuOxSB54i81+KBEzLAdo4RNrusOnPSK4HuUsWvz4iSiDzsXuNv2Hoz\\r\\n2tm3dRimH0QfypuMeUP8pux7ewWpPfAse3P2NZfMucMBsg7kUaDKZNjoNPrwwOwO\\r\\nTKco\\/JpbjwEkt7CIp63JPd9KrWfrjMCKHito44UCgYEA2mfs7Cz+vWTblEOHS5Xj\\r\\nRtUwUC8uLNoQfk98AkxrKL8f1XY0AqOnDXnxNpXDXPHQSGANVTLkxaU2grKiPdK1\\r\\nvgAUZMsMBAZMpzr4ll3GPlJUmwifM9G9SiPjH4YY8ckrHi2XzZf3dCt8+m08Zhac\\r\\n3mNZ2awSFJNeuQxAtI6AhdQ=\\r\\n-----END PRIVATE KEY-----\",\"version_image\":\"\\/uploads\\/20200721\\/ad9c9de0deff14d9079f92288f4156c4.jpg\",\"version_update\":\"0\",\"shop_commission\":\"0.97\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596782698);
INSERT INTO `table_admin_log` VALUES (1273, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596782994);
INSERT INTO `table_admin_log` VALUES (1274, 1, 'root', '/admin.php/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596782995);
INSERT INTO `table_admin_log` VALUES (1275, 1, 'root', '/admin.php/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596783065);
INSERT INTO `table_admin_log` VALUES (1276, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596783065);
INSERT INTO `table_admin_log` VALUES (1277, 1, 'root', '/admin.php/general/config/del', '常规管理 系统配置 删除', '{\"name\":\"shop_commission\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596783118);
INSERT INTO `table_admin_log` VALUES (1278, 1, 'root', '/admin.php/general/config/del', '常规管理 系统配置 删除', '{\"name\":\"version_update\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596783121);
INSERT INTO `table_admin_log` VALUES (1279, 1, 'root', '/admin.php/general/config/del', '常规管理 系统配置 删除', '{\"name\":\"version_image\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596783123);
INSERT INTO `table_admin_log` VALUES (1280, 1, 'root', '/admin.php/general/config/del', '常规管理 系统配置 删除', '{\"name\":\"ssl_key\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596783126);
INSERT INTO `table_admin_log` VALUES (1281, 1, 'root', '/admin.php/general/config/del', '常规管理 系统配置 删除', '{\"name\":\"ssl_cert\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596783128);
INSERT INTO `table_admin_log` VALUES (1282, 1, 'root', '/admin.php/general/config/del', '常规管理 系统配置 删除', '{\"name\":\"review\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596783133);
INSERT INTO `table_admin_log` VALUES (1283, 1, 'root', '/admin.php/general/config/del', '常规管理 系统配置 删除', '{\"name\":\"distance_limit\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596783136);
INSERT INTO `table_admin_log` VALUES (1284, 1, 'root', '/admin.php/general/config/del', '常规管理 系统配置 删除', '{\"name\":\"refund_notify_url\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596783141);
INSERT INTO `table_admin_log` VALUES (1285, 1, 'root', '/admin.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"b45dc9b251c08586b4b367f220c54c69\",\"row\":{\"app_id\":\"wxbb98e1aa25ea3d7c\",\"app_secret\":\"4c632970c789ac2fa43bd393ff04edf7\",\"pay_notify_url\":\"https:\\/\\/jxm.bowangyun.net\\/api\\/Pay\\/notifyPay\",\"mch_id\":\"1503520101\",\"key\":\"dI0iA3aG4iG5bB6gB2aK3oK0dC0hL0sa\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596783146);
INSERT INTO `table_admin_log` VALUES (1286, 1, 'root', '/admin.php/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596784081);
INSERT INTO `table_admin_log` VALUES (1287, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596784082);
INSERT INTO `table_admin_log` VALUES (1288, 1, 'root', '/admin.php/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596791005);
INSERT INTO `table_admin_log` VALUES (1289, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596791006);
INSERT INTO `table_admin_log` VALUES (1290, 1, 'root', '/admin.php/index/login?url=%2Fadmin.php%2Fgood%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin.php\\/good?ref=addtabs\",\"__token__\":\"473aea3635a113a63e21114404849ab6\",\"username\":\"root\",\"captcha\":\"luxd\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596863652);
INSERT INTO `table_admin_log` VALUES (1291, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596863667);
INSERT INTO `table_admin_log` VALUES (1292, 1, 'root', '/admin.php/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596863667);
INSERT INTO `table_admin_log` VALUES (1293, 1, 'root', '/admin.php/index/login?url=%2Fadmin.php%2Fgood%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin.php\\/good?ref=addtabs\",\"__token__\":\"9ffc4324cc7a18274fb9e610f1e7095b\",\"username\":\"root\",\"captcha\":\"srtk\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596950999);
INSERT INTO `table_admin_log` VALUES (1294, 1, 'root', '/admin.php/auth/rule/multi/ids/181', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"181\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951045);
INSERT INTO `table_admin_log` VALUES (1295, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951045);
INSERT INTO `table_admin_log` VALUES (1296, 1, 'root', '/admin.php/auth/rule/multi/ids/218', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"218\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951056);
INSERT INTO `table_admin_log` VALUES (1297, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951056);
INSERT INTO `table_admin_log` VALUES (1298, 1, 'root', '/admin.php/auth/rule/multi/ids/9', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"9\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951216);
INSERT INTO `table_admin_log` VALUES (1299, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951216);
INSERT INTO `table_admin_log` VALUES (1300, 1, 'root', '/admin.php/auth/rule/multi/ids/10', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"10\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951220);
INSERT INTO `table_admin_log` VALUES (1301, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951220);
INSERT INTO `table_admin_log` VALUES (1302, 1, 'root', '/admin.php/auth/rule/multi/ids/11', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"11\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951225);
INSERT INTO `table_admin_log` VALUES (1303, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951225);
INSERT INTO `table_admin_log` VALUES (1304, 1, 'root', '/admin.php/auth/rule/multi/ids/3', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"3\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951232);
INSERT INTO `table_admin_log` VALUES (1305, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951232);
INSERT INTO `table_admin_log` VALUES (1306, 1, 'root', '/admin.php/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951276);
INSERT INTO `table_admin_log` VALUES (1307, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951276);
INSERT INTO `table_admin_log` VALUES (1308, 1, 'root', '/admin.php/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951493);
INSERT INTO `table_admin_log` VALUES (1309, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951493);
INSERT INTO `table_admin_log` VALUES (1310, 1, 'root', '/admin.php/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951776);
INSERT INTO `table_admin_log` VALUES (1311, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951776);
INSERT INTO `table_admin_log` VALUES (1312, 1, 'root', '/admin.php/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951782);
INSERT INTO `table_admin_log` VALUES (1313, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951782);
INSERT INTO `table_admin_log` VALUES (1314, 1, 'root', '/admin.php/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951910);
INSERT INTO `table_admin_log` VALUES (1315, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951911);
INSERT INTO `table_admin_log` VALUES (1316, 1, 'root', '/admin.php/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951921);
INSERT INTO `table_admin_log` VALUES (1317, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951922);
INSERT INTO `table_admin_log` VALUES (1318, 1, 'root', '/admin.php/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951957);
INSERT INTO `table_admin_log` VALUES (1319, 1, 'root', '/admin.php/shop/index', '商家管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596951958);
INSERT INTO `table_admin_log` VALUES (1320, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"39,40,41\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"39,40,41\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953421);
INSERT INTO `table_admin_log` VALUES (1321, 1, 'root', '/admin.php/good/edit/ids/38?dialog=1', '首页产品 编辑', '{\"dialog\":\"1\",\"row\":{\"good_ids\":\"39,40,41\",\"name\":\"\\u57fa\\u7840\\u9a8c\\u6536-1\",\"original\":\"1300.00\",\"price\":\"900\",\"thumb_image\":\"\\/uploads\\/20200803\\/03b9cf24bf437601a42d2ab7efcd43f5.png\",\"images\":\"\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg,\\/uploads\\/20200803\\/4bb2d7b96a30e22607ff52c79aad260b.jpg\",\"content\":\"\",\"status\":\"1\",\"weigh\":\"39\"},\"ids\":\"38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953424);
INSERT INTO `table_admin_log` VALUES (1322, 1, 'root', '/admin.php/auth/rule/multi/ids/85', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"85\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953451);
INSERT INTO `table_admin_log` VALUES (1323, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953451);
INSERT INTO `table_admin_log` VALUES (1324, 1, 'root', '/admin.php/good/index', '首页产品 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"39,40,41\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"39,40,41\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953492);
INSERT INTO `table_admin_log` VALUES (1325, 1, 'root', '/admin.php/auth/rule/multi/ids/4', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953504);
INSERT INTO `table_admin_log` VALUES (1326, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953504);
INSERT INTO `table_admin_log` VALUES (1327, 1, 'root', '/admin.php/auth/rule/multi/ids/7', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"7\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953517);
INSERT INTO `table_admin_log` VALUES (1328, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953517);
INSERT INTO `table_admin_log` VALUES (1329, 1, 'root', '/admin.php/auth/rule/multi/ids/5', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"5\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953530);
INSERT INTO `table_admin_log` VALUES (1330, 1, 'root', '/admin.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953530);
INSERT INTO `table_admin_log` VALUES (1331, 0, 'Unknown', '/admin.php/index/login?url=%2Fadmin.php%2Fgood%3Fref%3Daddtabs', '', '{\"url\":\"\\/admin.php\\/good?ref=addtabs\",\"__token__\":\"bb1b30134454c65c029043ef500ae026\",\"username\":\"root\",\"captcha\":\"einw\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953779);
INSERT INTO `table_admin_log` VALUES (1332, 1, 'root', '/admin.php/index/login?url=%2Fadmin.php%2Fgood%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin.php\\/good?ref=addtabs\",\"__token__\":\"c63749eb71777317defec7b4cd6cbd31\",\"username\":\"root\",\"captcha\":\"elmr\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953782);
INSERT INTO `table_admin_log` VALUES (1333, 1, 'root', '/admin.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"047157ab406b99fbca82099fa9321521\",\"row\":{\"name\":\"\\u5ba4\\u5185\\u88c5\\u9970\\u76d1\\u7406\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"order\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953810);
INSERT INTO `table_admin_log` VALUES (1334, 1, 'root', '/admin.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"7b758ec6efdab9323d09a0f244afc888\",\"row\":{\"app_id\":\"wx2e713ea8cdc377e8\",\"app_secret\":\"4c632970c789ac2fa43bd393ff04edf7\",\"pay_notify_url\":\"https:\\/\\/jxm.bowangyun.net\\/api\\/Pay\\/notifyPay\",\"mch_id\":\"1503520101\",\"key\":\"dI0iA3aG4iG5bB6gB2aK3oK0dC0hL0sa\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953815);
INSERT INTO `table_admin_log` VALUES (1335, 1, 'root', '/admin.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"36b479ff8c593fdf63cfe5432e876b83\",\"row\":{\"app_id\":\"wx2e713ea8cdc377e8\",\"app_secret\":\"4c632970c789ac2fa43bd393ff04edf7\",\"pay_notify_url\":\"https:\\/\\/jxm.bowangyun.net\\/api\\/Pay\\/notifyPay\",\"mch_id\":\"1503520101\",\"key\":\"dI0iA3aG4iG5bB6gB2aK3oK0dC0hL0sa\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596953820);
INSERT INTO `table_admin_log` VALUES (1336, 0, 'Unknown', '/admin.php/index/login?url=%2Fadmin.php%2Fgood%3Fref%3Daddtabs', '', '{\"url\":\"\\/admin.php\\/good?ref=addtabs\",\"__token__\":\"7bdb817ff1e4f9debf7af41e856a777c\",\"username\":\"root\",\"captcha\":\"z77a\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596959886);
INSERT INTO `table_admin_log` VALUES (1337, 1, 'root', '/admin.php/index/login?url=%2Fadmin.php%2Fgood%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin.php\\/good?ref=addtabs\",\"__token__\":\"70520f5b673776f2aaf28cb4243d7b99\",\"username\":\"root\",\"captcha\":\"crwr\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596959892);
INSERT INTO `table_admin_log` VALUES (1338, 1, 'root', '/admin.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"3f599b635359d02d1f3901dc24641ad3\",\"row\":{\"app_id\":\"wx2e713ea8cdc377e8\",\"app_secret\":\"85d1009e850adc3ba587bdc260eb46ee\",\"pay_notify_url\":\"https:\\/\\/jxm.bowangyun.net\\/api\\/Pay\\/notifyPay\",\"mch_id\":\"1503520101\",\"key\":\"dI0iA3aG4iG5bB6gB2aK3oK0dC0hL0sa\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1596959900);

-- ----------------------------
-- Table structure for table_attachment
-- ----------------------------
DROP TABLE IF EXISTS `table_attachment`;
CREATE TABLE `table_attachment`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) NULL DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_attachment
-- ----------------------------
INSERT INTO `table_attachment` VALUES (177, 1, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '200', '210', 'png', 0, 59083, 'image/png', '{\"name\":\"cp_tu.png\"}', 1596446935, 1596446935, 1596446935, 'local', '21dfc66c6e51b8cc96216b25f064e06c13692dea');
INSERT INTO `table_attachment` VALUES (178, 1, 0, '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '980', '500', 'jpg', 0, 273925, 'image/jpeg', '{\"name\":\"big84000.jpg\"}', 1596447007, 1596447007, 1596447007, 'local', '4dd4bd7d9f788ddd57200cc70405054ff32e6311');
INSERT INTO `table_attachment` VALUES (179, 1, 0, '/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png', '752', '1750', 'png', 0, 1027565, 'image/png', '{\"name\":\"cpxq_tu.png\"}', 1596447041, 1596447041, 1596447041, 'local', '4925d81af812b08b86b17b5d876753922a1b5d49');
INSERT INTO `table_attachment` VALUES (180, 1, 0, '/uploads/20200804/83bfdb846e5a006a7d0bc81864ac0a38.png', '710', '420', 'png', 0, 148468, 'image/png', '{\"name\":\"banner.png\"}', 1596507105, 1596507105, 1596507105, 'local', 'cbc9dae1dbac9574e8e3f9d737b84a33a99e722e');
INSERT INTO `table_attachment` VALUES (181, 1, 0, '/uploads/20200804/4fb02b43c1f4760c29415e74ed390506.png', '92', '96', 'png', 0, 5262, 'image/png', '{\"name\":\"nav_tb1.png\"}', 1596509044, 1596509044, 1596509044, 'local', '8e8cf6c2759a8469ac46cd439618c6bd8eba649a');
INSERT INTO `table_attachment` VALUES (182, 1, 0, '/uploads/20200804/6ec48295acf2c5168ba4005352a88070.png', '92', '96', 'png', 0, 4966, 'image/png', '{\"name\":\"nav_tb2.png\"}', 1596519003, 1596519003, 1596519003, 'local', '03487d1f54af07efecb2641a0a8db4051eaee851');
INSERT INTO `table_attachment` VALUES (183, 1, 0, '/uploads/20200804/d5fdd45b6b6e89f184d49edad75e8c8f.png', '92', '96', 'png', 0, 4943, 'image/png', '{\"name\":\"nav_tb3.png\"}', 1596519030, 1596519030, 1596519030, 'local', '2335e339674c0464b3a07ae15c797fffe70e9550');
INSERT INTO `table_attachment` VALUES (184, 1, 0, '/uploads/20200804/3abe70d1befde1ac32b91e1f8e704dfe.png', '92', '96', 'png', 0, 4777, 'image/png', '{\"name\":\"nav_tb4.png\"}', 1596519050, 1596519050, 1596519050, 'local', 'f81e6fa85a2f15a3b6d62645ff39d6f605b83e2d');
INSERT INTO `table_attachment` VALUES (185, 1, 0, '/uploads/20200804/30fbfb8b1092e2c5e7a7a40d74871303.png', '92', '96', 'png', 0, 6422, 'image/png', '{\"name\":\"nav_tb5.png\"}', 1596519072, 1596519072, 1596519072, 'local', '725086d91a16deeb8413ec675fa51489bbc26e54');
INSERT INTO `table_attachment` VALUES (186, 1, 0, '/uploads/20200804/32554a3dca56e851e00089144f873528.png', '92', '96', 'png', 0, 4016, 'image/png', '{\"name\":\"nav_tb6.png\"}', 1596519092, 1596519092, 1596519092, 'local', '529c5d29e7ec7198104a0ce2e96f2e9a84884392');
INSERT INTO `table_attachment` VALUES (187, 1, 0, '/uploads/20200804/85321b80c392ce2c1f283c9b6b3179e0.png', '92', '96', 'png', 0, 5440, 'image/png', '{\"name\":\"nav_tb7.png\"}', 1596519119, 1596519119, 1596519119, 'local', '4bccc327d062b2ef08930c3de4c0b9a9e5c0f064');
INSERT INTO `table_attachment` VALUES (188, 1, 0, '/uploads/20200804/4902fb07725ad8622d61b787ede920ec.png', '92', '96', 'png', 0, 4882, 'image/png', '{\"name\":\"nav_tb8.png\"}', 1596519138, 1596519138, 1596519138, 'local', 'e143602aba2c087cfc4c090e58cfff09523dff4a');
INSERT INTO `table_attachment` VALUES (189, 1, 0, '/uploads/20200804/83888c9ccd5b24cd7f90ae0a065551a4.mp4', '', '', 'mp4', 0, 9035983, 'video/mp4', '{\"name\":\"a41aee5b028fc74adf4ef7448a0194c7b27248a3a85025b94d0f4c63f7326c3400e31dca0a0dc79205e005b315f7f2a6.mp4\"}', 1596524477, 1596524477, 1596524477, 'local', 'b110a8bd2f553d730805e17b56b3c8c94c6de583');
INSERT INTO `table_attachment` VALUES (190, 1, 0, '/uploads/20200804/b87846e8c091921037bffbaef960530a.png', '148', '153', 'png', 0, 8249, 'image/png', '{\"name\":\"fl_tb1.png\"}', 1596535818, 1596535818, 1596535818, 'local', '8baac91109e520fb91c61f81cad37fe57f5191c6');
INSERT INTO `table_attachment` VALUES (191, 1, 0, '/uploads/20200804/78a72a1e648401cfdb850fe514d9cf74.png', '148', '153', 'png', 0, 8504, 'image/png', '{\"name\":\"fl_tb2.png\"}', 1596535880, 1596535880, 1596535880, 'local', '2267117a426765344f98cd7ab88b734786e473f5');
INSERT INTO `table_attachment` VALUES (192, 1, 0, '/uploads/20200804/cddd26e5d4f6b33e2aa6d628a2869e5e.png', '148', '153', 'png', 0, 8106, 'image/png', '{\"name\":\"fl_tb4.png\"}', 1596535912, 1596535912, 1596535912, 'local', 'dd8ae96f13e77ce52644c047cb1769d0969f1cf6');
INSERT INTO `table_attachment` VALUES (193, 1, 0, '/uploads/20200804/3899c07fa0423cab7f6c62bf8494de88.png', '148', '153', 'png', 0, 8148, 'image/png', '{\"name\":\"fl_tb6.png\"}', 1596535912, 1596535912, 1596535912, 'local', '294e6b5c34caa07e69be092e2c9e5bd83d09cb1b');
INSERT INTO `table_attachment` VALUES (194, 1, 0, '/uploads/20200804/9cc7258cc2b130c258e0b51c30845fc5.png', '148', '153', 'png', 0, 7953, 'image/png', '{\"name\":\"fl_tb3.png\"}', 1596535913, 1596535913, 1596535913, 'local', '833c3e59f7162d295cf1b34357f988dcb70488d8');
INSERT INTO `table_attachment` VALUES (195, 1, 0, '/uploads/20200804/f2274a84b65c7887402f2e1b84349642.png', '148', '153', 'png', 0, 7955, 'image/png', '{\"name\":\"fl_tb7.png\"}', 1596535913, 1596535913, 1596535913, 'local', 'afc1c64d43548fe03aa5e4232376f6a8edcec5d2');
INSERT INTO `table_attachment` VALUES (196, 1, 0, '/uploads/20200804/586b61dd25278f0c9b252627d069fabb.png', '148', '153', 'png', 0, 7626, 'image/png', '{\"name\":\"fl_tb8.png\"}', 1596535913, 1596535913, 1596535913, 'local', '55ece91552c4d94c8a77a784cbf11c6a39bb996c');
INSERT INTO `table_attachment` VALUES (197, 1, 0, '/uploads/20200804/45d9a6bbb1cbd28d133982a9f2c8af35.png', '148', '153', 'png', 0, 9150, 'image/png', '{\"name\":\"fl_tb9.png\"}', 1596535913, 1596535913, 1596535913, 'local', 'c8f0e54dd78751aed970f33ee4a2bed61c803b08');
INSERT INTO `table_attachment` VALUES (198, 1, 0, '/uploads/20200804/a0b4314ad5a282d6a1934d1ec5b29524.png', '148', '153', 'png', 0, 7683, 'image/png', '{\"name\":\"fl_tb10.png\"}', 1596535913, 1596535913, 1596535913, 'local', '3d5f4bae7df15ce9992643ad4922984054506b13');
INSERT INTO `table_attachment` VALUES (199, 1, 0, '/uploads/20200804/62e020e62617ab8b3b9cf617e2e583f8.png', '148', '153', 'png', 0, 8179, 'image/png', '{\"name\":\"fl_tb11.png\"}', 1596535913, 1596535913, 1596535913, 'local', '0038bc474fe8fe7b41e94ad186f56604087a88a6');
INSERT INTO `table_attachment` VALUES (200, 1, 0, '/uploads/20200804/27c2bf7ba5d17eed792d33b1cc0f1cdf.png', '148', '153', 'png', 0, 8250, 'image/png', '{\"name\":\"fl_tb12.png\"}', 1596535913, 1596535913, 1596535913, 'local', '8c58b0b9111f6900bf6f8441ae661e1af500aebb');
INSERT INTO `table_attachment` VALUES (201, 1, 0, '/uploads/20200804/676d9be6de7490b24aa11e41c072e0a4.png', '148', '153', 'png', 0, 8180, 'image/png', '{\"name\":\"fl_tb13.png\"}', 1596535914, 1596535914, 1596535914, 'local', '4de4463641bbc97e6e71a1cc54d918fc641d52ba');
INSERT INTO `table_attachment` VALUES (202, 1, 0, '/uploads/20200804/7991529eaed6d7a6098ed28e22d47046.png', '148', '153', 'png', 0, 8383, 'image/png', '{\"name\":\"fl_tb5.png\"}', 1596535914, 1596535914, 1596535914, 'local', '7b307bc62508fcd2aa022b49f7267bf6980bc3f7');

-- ----------------------------
-- Table structure for table_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `table_auth_group`;
CREATE TABLE `table_auth_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_auth_group
-- ----------------------------
INSERT INTO `table_auth_group` VALUES (1, 0, 'Admin group', '*', 1490883540, 149088354, 'normal');
INSERT INTO `table_auth_group` VALUES (2, 1, '商家组', '1,8,13,14,15,16,17,24,29,30,31,32,33,34,142,145,151,153,154,155,156,157,158,160,162,163,164,167,201,207,208,2,7,141,150,159,200,199,206', 1594631562, 1595396169, 'normal');
INSERT INTO `table_auth_group` VALUES (3, 1, '财务管理', '199,200,201,202,203,204,205,206,207,208,209,210,211', 1595333650, 1595333650, 'normal');

-- ----------------------------
-- Table structure for table_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `table_auth_group_access`;
CREATE TABLE `table_auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '权限分组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_auth_group_access
-- ----------------------------
INSERT INTO `table_auth_group_access` VALUES (1, 1);
INSERT INTO `table_auth_group_access` VALUES (2, 2);
INSERT INTO `table_auth_group_access` VALUES (4, 2);
INSERT INTO `table_auth_group_access` VALUES (5, 2);
INSERT INTO `table_auth_group_access` VALUES (6, 2);

-- ----------------------------
-- Table structure for table_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `table_auth_rule`;
CREATE TABLE `table_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 230 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '节点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_auth_rule
-- ----------------------------
INSERT INTO `table_auth_rule` VALUES (1, 'file', 0, 'dashboard', '控制台', 'fa fa-dashboard', '', 'Dashboard tips', 0, 1497429920, 1595396038, 1001, 'normal');
INSERT INTO `table_auth_rule` VALUES (2, 'file', 0, 'general', '常规管理', 'fa fa-cogs', '', '', 1, 1497429920, 1592275809, 1000, 'normal');
INSERT INTO `table_auth_rule` VALUES (3, 'file', 0, 'category', '分类管理', 'fa fa-leaf', '', 'Category tips', 0, 1497429920, 1596951232, 999, 'normal');
INSERT INTO `table_auth_rule` VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', 0, 1502035509, 1596953504, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (5, 'file', 0, 'auth', '权限管理', 'fa fa-group', '', '', 0, 1497429920, 1596953530, 998, 'normal');
INSERT INTO `table_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal');
INSERT INTO `table_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 0, 1497429920, 1596953517, 53, 'normal');
INSERT INTO `table_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', 1, 1497429920, 1497429920, 34, 'normal');
INSERT INTO `table_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', 0, 1497429920, 1596951215, 118, 'normal');
INSERT INTO `table_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', 0, 1497429920, 1596951220, 113, 'normal');
INSERT INTO `table_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', 0, 1497429920, 1596951225, 109, 'normal');
INSERT INTO `table_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', 1, 1497429920, 1497430581, 104, 'normal');
INSERT INTO `table_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 136, 'normal');
INSERT INTO `table_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 135, 'normal');
INSERT INTO `table_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 133, 'normal');
INSERT INTO `table_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 134, 'normal');
INSERT INTO `table_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 132, 'normal');
INSERT INTO `table_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal');
INSERT INTO `table_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal');
INSERT INTO `table_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 50, 'normal');
INSERT INTO `table_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 49, 'normal');
INSERT INTO `table_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal');
INSERT INTO `table_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', 0, 1497429920, 1497429920, 59, 'normal');
INSERT INTO `table_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal');
INSERT INTO `table_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal');
INSERT INTO `table_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 56, 'normal');
INSERT INTO `table_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 55, 'normal');
INSERT INTO `table_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 54, 'normal');
INSERT INTO `table_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal');
INSERT INTO `table_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal');
INSERT INTO `table_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 31, 'normal');
INSERT INTO `table_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 30, 'normal');
INSERT INTO `table_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal');
INSERT INTO `table_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal');
INSERT INTO `table_auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', 0, 1497429920, 1497429920, 142, 'normal');
INSERT INTO `table_auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 141, 'normal');
INSERT INTO `table_auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 140, 'normal');
INSERT INTO `table_auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 139, 'normal');
INSERT INTO `table_auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 138, 'normal');
INSERT INTO `table_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', 0, 1497429920, 1497429920, 117, 'normal');
INSERT INTO `table_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 116, 'normal');
INSERT INTO `table_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 115, 'normal');
INSERT INTO `table_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 114, 'normal');
INSERT INTO `table_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', 0, 1497429920, 1497429920, 112, 'normal');
INSERT INTO `table_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 111, 'normal');
INSERT INTO `table_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 110, 'normal');
INSERT INTO `table_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', 0, 1497429920, 1497429920, 108, 'normal');
INSERT INTO `table_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 107, 'normal');
INSERT INTO `table_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 106, 'normal');
INSERT INTO `table_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 105, 'normal');
INSERT INTO `table_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', 0, 1497429920, 1497429920, 103, 'normal');
INSERT INTO `table_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 102, 'normal');
INSERT INTO `table_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 101, 'normal');
INSERT INTO `table_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 100, 'normal');
INSERT INTO `table_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (66, 'file', 0, 'user', '会员管理', 'fa fa-list', '', '', 1, 1516374729, 1592275862, 997, 'normal');
INSERT INTO `table_auth_rule` VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', 0, 1516374729, 1595397626, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', 0, 1516374729, 1595397618, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (85, 'file', 0, 'command', '在线命令管理', 'fa fa-terminal', '', '', 0, 1590741558, 1596953451, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (86, 'file', 85, 'command/index', '查看', 'fa fa-circle-o', '', '', 0, 1590741558, 1590741558, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (87, 'file', 85, 'command/add', '添加', 'fa fa-circle-o', '', '', 0, 1590741558, 1590741558, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (88, 'file', 85, 'command/detail', '详情', 'fa fa-circle-o', '', '', 0, 1590741558, 1590741558, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (89, 'file', 85, 'command/execute', '运行', 'fa fa-circle-o', '', '', 0, 1590741558, 1590741558, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (90, 'file', 85, 'command/del', '删除', 'fa fa-circle-o', '', '', 0, 1590741558, 1590741558, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (91, 'file', 85, 'command/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1590741558, 1590741558, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (132, 'file', 0, 'shop', '商家管理', 'fa fa-users', '', '', 0, 1591179138, 1596443533, 996, 'normal');
INSERT INTO `table_auth_rule` VALUES (133, 'file', 132, 'shop/index', '查看', 'fa fa-circle-o', '', '', 0, 1591179140, 1594705909, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (134, 'file', 132, 'shop/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1591179140, 1591179140, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (135, 'file', 132, 'shop/add', '添加', 'fa fa-circle-o', '', '', 0, 1591179140, 1591179140, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (136, 'file', 132, 'shop/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1591179140, 1591179140, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (137, 'file', 132, 'shop/del', '删除', 'fa fa-circle-o', '', '', 0, 1591179140, 1591179140, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (138, 'file', 132, 'shop/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1591179140, 1591179140, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (139, 'file', 132, 'shop/restore', '还原', 'fa fa-circle-o', '', '', 0, 1591179140, 1591179140, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (140, 'file', 132, 'shop/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1591179141, 1591179141, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (141, 'file', 0, 'order', '订单管理', 'fa fa-first-order', '', '', 1, 1591179773, 1594968669, 994, 'normal');
INSERT INTO `table_auth_rule` VALUES (142, 'file', 141, 'order/index', '查看', 'fa fa-circle-o', '', '', 0, 1591179774, 1591180716, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (143, 'file', 141, 'order/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1591179774, 1591180717, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (144, 'file', 141, 'order/add', '添加', 'fa fa-circle-o', '', '', 0, 1591179775, 1591180717, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (145, 'file', 141, 'order/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1591179775, 1591180717, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (146, 'file', 141, 'order/del', '删除', 'fa fa-circle-o', '', '', 0, 1591179775, 1591180717, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (147, 'file', 141, 'order/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1591179775, 1591180717, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (148, 'file', 141, 'order/restore', '还原', 'fa fa-circle-o', '', '', 0, 1591179775, 1591180717, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (149, 'file', 141, 'order/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1591179775, 1591180717, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (150, 'file', 0, 'good', '首页产品', 'fa fa-birthday-cake', '', '', 1, 1591180745, 1596504017, 993, 'normal');
INSERT INTO `table_auth_rule` VALUES (151, 'file', 150, 'good/index', '查看', 'fa fa-circle-o', '', '', 0, 1591180747, 1594714106, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (152, 'file', 150, 'good/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1591180747, 1594714106, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (153, 'file', 150, 'good/add', '添加', 'fa fa-circle-o', '', '', 0, 1591180747, 1594714106, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (154, 'file', 150, 'good/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1591180747, 1594714106, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (155, 'file', 150, 'good/del', '删除', 'fa fa-circle-o', '', '', 0, 1591180747, 1594714106, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (156, 'file', 150, 'good/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1591180747, 1594714106, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (157, 'file', 150, 'good/restore', '还原', 'fa fa-circle-o', '', '', 0, 1591180747, 1594714106, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (158, 'file', 150, 'good/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1591180748, 1594714106, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (159, 'file', 0, 'shop_category', '分类管理', 'fa fa-stack-overflow', '', '', 1, 1592273540, 1594968715, 995, 'normal');
INSERT INTO `table_auth_rule` VALUES (160, 'file', 159, 'shop_category/index', '查看', 'fa fa-circle-o', '', '', 0, 1592273540, 1592273540, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (161, 'file', 159, 'shop_category/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1592273540, 1592273540, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (162, 'file', 159, 'shop_category/add', '添加', 'fa fa-circle-o', '', '', 0, 1592273540, 1592273540, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (163, 'file', 159, 'shop_category/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1592273540, 1592273540, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (164, 'file', 159, 'shop_category/del', '删除', 'fa fa-circle-o', '', '', 0, 1592273540, 1592273540, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (165, 'file', 159, 'shop_category/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1592273540, 1592273540, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (166, 'file', 159, 'shop_category/restore', '还原', 'fa fa-circle-o', '', '', 0, 1592273540, 1592273540, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (167, 'file', 159, 'shop_category/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1592273540, 1592273540, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (168, 'file', 0, 'content', '内容管理', 'fa fa-tencent-weibo', '', '', 1, 1594714204, 1594968395, 992, 'normal');
INSERT INTO `table_auth_rule` VALUES (169, 'file', 168, 'content/content_banner', 'banner轮播', 'fa fa-circle-o', '', '', 1, 1594714854, 1594714854, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (170, 'file', 169, 'content/content_banner/index', '查看', 'fa fa-circle-o', '', '', 0, 1594714854, 1594714854, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (171, 'file', 169, 'content/content_banner/add', '添加', 'fa fa-circle-o', '', '', 0, 1594714854, 1594714854, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (172, 'file', 169, 'content/content_banner/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1594714854, 1594714854, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (173, 'file', 169, 'content/content_banner/del', '删除', 'fa fa-circle-o', '', '', 0, 1594714854, 1594714854, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (174, 'file', 169, 'content/content_banner/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1594714854, 1594714854, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (175, 'file', 168, 'content/content_discount/edit/ids/1', '公司信息', 'fa fa-circle-o', '', '', 1, 1594716970, 1596533262, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (176, 'file', 175, 'content/content_discount/index', '查看', 'fa fa-circle-o', '', '', 0, 1594716970, 1594716970, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (177, 'file', 175, 'content/content_discount/add', '添加', 'fa fa-circle-o', '', '', 0, 1594716970, 1594716970, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (178, 'file', 175, 'content/content_discount/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1594716970, 1594716970, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (179, 'file', 175, 'content/content_discount/del', '删除', 'fa fa-circle-o', '', '', 0, 1594716970, 1594716970, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (180, 'file', 175, 'content/content_discount/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1594716970, 1594716970, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (181, 'file', 168, 'content/content_complaint', '投诉建议', 'fa fa-circle-o', '', '', 0, 1594722657, 1596951045, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (182, 'file', 181, 'content/content_complaint/index', '查看', 'fa fa-circle-o', '', '', 0, 1594722657, 1594722657, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (183, 'file', 181, 'content/content_complaint/add', '添加', 'fa fa-circle-o', '', '', 0, 1594722657, 1594722657, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (184, 'file', 181, 'content/content_complaint/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1594722657, 1594722657, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (185, 'file', 181, 'content/content_complaint/del', '删除', 'fa fa-circle-o', '', '', 0, 1594722657, 1594722657, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (186, 'file', 181, 'content/content_complaint/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1594722657, 1594722657, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (187, 'file', 168, 'content/content_headline', '头条管理', 'fa fa-circle-o', '', '', 0, 1594724191, 1596535764, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (188, 'file', 187, 'content/content_headline/index', '查看', 'fa fa-circle-o', '', '', 0, 1594724191, 1594724229, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (189, 'file', 187, 'content/content_headline/add', '添加', 'fa fa-circle-o', '', '', 0, 1594724191, 1594724229, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (190, 'file', 187, 'content/content_headline/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1594724191, 1594724229, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (191, 'file', 187, 'content/content_headline/del', '删除', 'fa fa-circle-o', '', '', 0, 1594724191, 1594724229, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (192, 'file', 187, 'content/content_headline/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1594724191, 1594724229, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (193, 'file', 168, 'content/content_help/edit/ids/1', '帮助说明', 'fa fa-circle-o', '', '', 0, 1594872028, 1596535759, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (194, 'file', 193, 'content/content_help/index', '查看', 'fa fa-circle-o', '', '', 0, 1594872028, 1594872028, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (195, 'file', 193, 'content/content_help/add', '添加', 'fa fa-circle-o', '', '', 0, 1594872028, 1594872028, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (196, 'file', 193, 'content/content_help/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1594872028, 1594872028, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (197, 'file', 193, 'content/content_help/del', '删除', 'fa fa-circle-o', '', '', 0, 1594872028, 1594872028, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (198, 'file', 193, 'content/content_help/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1594872028, 1594872028, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (199, 'file', 0, 'finance', '财务管理', 'fa fa-money', '', '', 0, 1594968255, 1596443514, 991, 'normal');
INSERT INTO `table_auth_rule` VALUES (200, 'file', 199, 'finance/shop_balance', '商家收益', 'fa fa-circle-o', '', '', 1, 1594968255, 1594968798, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (201, 'file', 200, 'finance/shop_balance/index', '查看', 'fa fa-circle-o', '', '', 0, 1594968255, 1594968322, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (202, 'file', 200, 'finance/shop_balance/add', '添加', 'fa fa-circle-o', '', '', 0, 1594968255, 1594968322, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (203, 'file', 200, 'finance/shop_balance/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1594968255, 1594968322, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (204, 'file', 200, 'finance/shop_balance/del', '删除', 'fa fa-circle-o', '', '', 0, 1594968255, 1594968322, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (205, 'file', 200, 'finance/shop_balance/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1594968255, 1594968322, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (206, 'file', 199, 'finance/shop_balance_log', '提现申请', 'fa fa-circle-o', '', '', 1, 1594969108, 1594969108, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (207, 'file', 206, 'finance/shop_balance_log/index', '查看', 'fa fa-circle-o', '', '', 0, 1594969109, 1594969109, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (208, 'file', 206, 'finance/shop_balance_log/add', '添加', 'fa fa-circle-o', '', '', 0, 1594969109, 1594969109, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (209, 'file', 206, 'finance/shop_balance_log/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1594969109, 1594969109, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (210, 'file', 206, 'finance/shop_balance_log/del', '删除', 'fa fa-circle-o', '', '', 0, 1594969109, 1594969109, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (211, 'file', 206, 'finance/shop_balance_log/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1594969109, 1594969109, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (212, 'file', 168, 'content/balance/edit/ids/1', '提现说明', 'fa fa-circle-o', '', '', 0, 1595382001, 1596535752, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (213, 'file', 212, 'content/balance/index', '查看', 'fa fa-circle-o', '', '', 0, 1595382001, 1595382001, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (214, 'file', 212, 'content/balance/add', '添加', 'fa fa-circle-o', '', '', 0, 1595382001, 1595382001, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (215, 'file', 212, 'content/balance/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1595382001, 1595382001, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (216, 'file', 212, 'content/balance/del', '删除', 'fa fa-circle-o', '', '', 0, 1595382001, 1595382001, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (217, 'file', 212, 'content/balance/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1595382001, 1595382001, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (218, 'file', 0, 'test', 'Test', 'fa fa-circle-o', '', '', 0, 1596511726, 1596951056, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (219, 'file', 218, 'test/index', '查看', 'fa fa-circle-o', '', '', 0, 1596511727, 1596511727, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (220, 'file', 218, 'test/add', '添加', 'fa fa-circle-o', '', '', 0, 1596511727, 1596511727, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (221, 'file', 218, 'test/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1596511727, 1596511727, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (222, 'file', 218, 'test/del', '删除', 'fa fa-circle-o', '', '', 0, 1596511727, 1596511727, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (223, 'file', 218, 'test/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1596511727, 1596511727, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (224, 'file', 168, 'content/contet_video', '视频轮播', 'fa fa-circle-o', '', '', 1, 1596521420, 1596535734, 10, 'normal');
INSERT INTO `table_auth_rule` VALUES (225, 'file', 224, 'content/contet_video/index', '查看', 'fa fa-circle-o', '', '', 0, 1596521420, 1596521420, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (226, 'file', 224, 'content/contet_video/add', '添加', 'fa fa-circle-o', '', '', 0, 1596521420, 1596521420, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (227, 'file', 224, 'content/contet_video/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1596521420, 1596521420, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (228, 'file', 224, 'content/contet_video/del', '删除', 'fa fa-circle-o', '', '', 0, 1596521420, 1596521420, 0, 'normal');
INSERT INTO `table_auth_rule` VALUES (229, 'file', 224, 'content/contet_video/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1596521420, 1596521420, 0, 'normal');

-- ----------------------------
-- Table structure for table_category
-- ----------------------------
DROP TABLE IF EXISTS `table_category`;
CREATE TABLE `table_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `weigh`(`weigh`, `id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_category
-- ----------------------------
INSERT INTO `table_category` VALUES (1, 0, 'shop_type', '首页', '首页', '', '/uploads/20200602/1697e86b109f155ed46b7e58041b5404.png', '', '', '', 1591077482, 1596508750, 10, 'normal');
INSERT INTO `table_category` VALUES (2, 0, 'shop_type', '分类页', '分类页', '', '/uploads/20200602/ed08658034b5d0dbd3a7c3225a35c180.png', '', '', '', 1591077580, 1596508750, 9, 'normal');
INSERT INTO `table_category` VALUES (3, 0, 'shop_type', '蔬菜水果', '蔬菜水果', '', '/uploads/20200602/de75fd12d41d727b6fba587f6569fbcf.png', '', '', '', 1591077615, 1596508745, 8, 'hidden');
INSERT INTO `table_category` VALUES (4, 0, 'shop_type', '地方特产', '地方特产', '', '/uploads/20200602/4e97a253e11dc3db1d0ecb125fe4758d.png', '', '', '', 1591077649, 1596508745, 7, 'hidden');
INSERT INTO `table_category` VALUES (5, 0, 'shop_type', '鲜花礼品', '鲜花礼品', '', '/uploads/20200602/0d785291e9bbdd3ccbd91ef6940828bf.png', '', '', '', 1591077691, 1596508745, 6, 'hidden');
INSERT INTO `table_category` VALUES (6, 0, 'shop_type', '二手商品', '二手商品', '', '/uploads/20200722/d7a49e16e02ce5e80432c50e7ec33715.png', '', '', '', 1591077711, 1596508745, 5, 'hidden');
INSERT INTO `table_category` VALUES (7, 0, 'shop_type', '烘培蛋糕', '烘培蛋糕', '', '/uploads/20200602/7a2220be4e62d6b8b81190792fc99930.png', '', '', '', 1591077725, 1596508745, 4, 'hidden');
INSERT INTO `table_category` VALUES (8, 0, 'shop_type', '个人护理', '个人护理', '', '/uploads/20200602/66caea4069451b5619a8f3efe1dd530c.png', '', '', '', 1591077741, 1596508745, 3, 'hidden');
INSERT INTO `table_category` VALUES (9, 0, 'shop_type', '数码电器', '数码电器', '', '/uploads/20200722/6f005d13720323f806b334fb9cae5bf0.png', '', '', '', 1591077756, 1596508745, 2, 'hidden');
INSERT INTO `table_category` VALUES (10, 0, 'shop_type', '服装服饰', '服装服饰', '', '/uploads/20200602/72403e49f8270d9a155cd26a75a312e4.png', '', '', '', 1591077785, 1596508745, 1, 'hidden');

-- ----------------------------
-- Table structure for table_command
-- ----------------------------
DROP TABLE IF EXISTS `table_command`;
CREATE TABLE `table_command`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '命令',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '返回结果',
  `executetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行时间',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` enum('successed','failured') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '在线命令表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_command
-- ----------------------------
INSERT INTO `table_command` VALUES (73, 'crud', '[\"--table=mini_content_banner\",\"--controller=content\\/ContentBanner\",\"--relation=mini_shop\",\"--relationmode=hasone\",\"--relationforeignkey=id\",\"--relationprimarykey=shop_id\",\"--relationfields=name\"]', 'php think crud --table=mini_content_banner --controller=content/ContentBanner --relation=mini_shop --relationmode=hasone --relationforeignkey=id --relationprimarykey=shop_id --relationfields=name', 'Relation Primary key not found in table!', 1594714700, 1594714700, 1594714700, 'failured');
INSERT INTO `table_command` VALUES (74, 'crud', '[\"--table=mini_content_banner\",\"--controller=content\\/ContentBanner\",\"--relation=mini_shop\",\"--relationmode=hasone\",\"--relationforeignkey=id\",\"--relationprimarykey=shop_id\",\"--relationfields=name\"]', 'php think crud --table=mini_content_banner --controller=content/ContentBanner --relation=mini_shop --relationmode=hasone --relationforeignkey=id --relationprimarykey=shop_id --relationfields=name', 'Relation Primary key not found in table!', 1594714745, 1594714745, 1594714745, 'failured');
INSERT INTO `table_command` VALUES (75, 'crud', '[\"--table=mini_content_banner\",\"--controller=content\\/ContentBanner\",\"--fields=id,image,shop_id,weigh,createtime,updatetime\",\"--relation=mini_shop\",\"--relationmode=hasone\",\"--relationforeignkey=id\",\"--relationprimarykey=shop_id\",\"--relationfields=name\"]', 'php think crud --table=mini_content_banner --controller=content/ContentBanner --fields=id,image,shop_id,weigh,createtime,updatetime --relation=mini_shop --relationmode=hasone --relationforeignkey=id --relationprimarykey=shop_id --relationfields=name', 'Relation Primary key not found in table!', 1594714831, 1594714831, 1594714831, 'failured');
INSERT INTO `table_command` VALUES (76, 'crud', '[\"--table=mini_content_banner\",\"--controller=content\\/ContentBanner\",\"--fields=id,image,shop_id,weigh,createtime,updatetime\",\"--relation=mini_shop\",\"--relationmode=belongsto\",\"--relationforeignkey=shop_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --table=mini_content_banner --controller=content/ContentBanner --fields=id,image,shop_id,weigh,createtime,updatetime --relation=mini_shop --relationmode=belongsto --relationforeignkey=shop_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1594714843, 1594714843, 1594714843, 'successed');
INSERT INTO `table_command` VALUES (77, 'menu', '[\"--controller=content\\/ContentBanner\"]', 'php think menu --controller=content/ContentBanner', 'Build Successed!', 1594714854, 1594714854, 1594714854, 'successed');
INSERT INTO `table_command` VALUES (78, 'crud', '[\"--table=mini_content_discount\",\"--controller=content\\/ContentDiscount\",\"--relation=mini_good\",\"--relationmode=hasone\",\"--relationforeignkey=id\",\"--relationprimarykey=good_id\",\"--relationfields=name\"]', 'php think crud --table=mini_content_discount --controller=content/ContentDiscount --relation=mini_good --relationmode=hasone --relationforeignkey=id --relationprimarykey=good_id --relationfields=name', 'Relation Primary key not found in table!', 1594716952, 1594716952, 1594716952, 'failured');
INSERT INTO `table_command` VALUES (79, 'crud', '[\"--table=mini_content_discount\",\"--controller=content\\/ContentDiscount\",\"--relation=mini_good\",\"--relationmode=belongsto\",\"--relationforeignkey=good_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --table=mini_content_discount --controller=content/ContentDiscount --relation=mini_good --relationmode=belongsto --relationforeignkey=good_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1594716963, 1594716963, 1594716963, 'successed');
INSERT INTO `table_command` VALUES (80, 'menu', '[\"--controller=content\\/ContentDiscount\"]', 'php think menu --controller=content/ContentDiscount', 'Build Successed!', 1594716970, 1594716970, 1594716970, 'successed');
INSERT INTO `table_command` VALUES (81, 'crud', '[\"--force=1\",\"--table=mini_content_discount\",\"--controller=content\\/ContentDiscount\",\"--relation=mini_good\",\"--relationmode=belongsto\",\"--relationforeignkey=good_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=mini_content_discount --controller=content/ContentDiscount --relation=mini_good --relationmode=belongsto --relationforeignkey=good_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1594717034, 1594717034, 1594717034, 'successed');
INSERT INTO `table_command` VALUES (82, 'crud', '[\"--force=1\",\"--table=mini_content_discount\",\"--controller=content\\/ContentDiscount\",\"--relation=mini_good\",\"--relationmode=belongsto\",\"--relationforeignkey=good_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=mini_content_discount --controller=content/ContentDiscount --relation=mini_good --relationmode=belongsto --relationforeignkey=good_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1594720154, 1594720154, 1594720154, 'successed');
INSERT INTO `table_command` VALUES (83, 'crud', '[\"--table=mini_content_complaint\",\"--controller=content\\/ContentComplaint\"]', 'php think crud --table=mini_content_complaint --controller=content/ContentComplaint', 'Build Successed', 1594722647, 1594722647, 1594722647, 'successed');
INSERT INTO `table_command` VALUES (84, 'menu', '[\"--controller=content\\/ContentComplaint\"]', 'php think menu --controller=content/ContentComplaint', 'Build Successed!', 1594722657, 1594722657, 1594722657, 'successed');
INSERT INTO `table_command` VALUES (85, 'crud', '[\"--force=1\",\"--table=mini_content_complaint\",\"--controller=content\\/ContentComplaint\"]', 'php think crud --force=1 --table=mini_content_complaint --controller=content/ContentComplaint', 'Build Successed', 1594722706, 1594722706, 1594722706, 'successed');
INSERT INTO `table_command` VALUES (86, 'crud', '[\"--force=1\",\"--table=mini_content_complaint\",\"--controller=content\\/ContentComplaint\"]', 'php think crud --force=1 --table=mini_content_complaint --controller=content/ContentComplaint', 'Build Successed', 1594723574, 1594723574, 1594723574, 'successed');
INSERT INTO `table_command` VALUES (87, 'crud', '[\"--force=1\",\"--table=mini_content_complaint\",\"--controller=content\\/ContentComplaint\",\"--fields=id,content,stauts,createtime,updatetime\"]', 'php think crud --force=1 --table=mini_content_complaint --controller=content/ContentComplaint --fields=id,content,stauts,createtime,updatetime', 'Build Successed', 1594723844, 1594723844, 1594723844, 'successed');
INSERT INTO `table_command` VALUES (88, 'crud', '[\"--table=mini_content_headline\",\"--controller=content\\/ContentHeadline\"]', 'php think crud --table=mini_content_headline --controller=content/ContentHeadline', 'Build Successed', 1594724184, 1594724184, 1594724184, 'successed');
INSERT INTO `table_command` VALUES (89, 'menu', '[\"--controller=content\\/ContentHeadline\"]', 'php think menu --controller=content/ContentHeadline', 'Build Successed!', 1594724191, 1594724191, 1594724191, 'successed');
INSERT INTO `table_command` VALUES (90, 'crud', '[\"--force=1\",\"--table=mini_content_headline\",\"--controller=content\\/ContentHeadline\"]', 'php think crud --force=1 --table=mini_content_headline --controller=content/ContentHeadline', 'Build Successed', 1594724220, 1594724220, 1594724220, 'successed');
INSERT INTO `table_command` VALUES (91, 'menu', '[\"--controller=content\\/ContentHeadline\"]', 'php think menu --controller=content/ContentHeadline', 'Build Successed!', 1594724229, 1594724229, 1594724229, 'successed');
INSERT INTO `table_command` VALUES (92, 'crud', '[\"--table=mini_content_help\",\"--controller=content\\/ContentHelp\"]', 'php think crud --table=mini_content_help --controller=content/ContentHelp', 'Build Successed', 1594872020, 1594872020, 1594872020, 'successed');
INSERT INTO `table_command` VALUES (93, 'menu', '[\"--controller=content\\/ContentHelp\"]', 'php think menu --controller=content/ContentHelp', 'Build Successed!', 1594872028, 1594872028, 1594872028, 'successed');
INSERT INTO `table_command` VALUES (94, 'crud', '[\"--table=mini_shop_balance\",\"--controller=finance\\/ShopBalance\",\"--relation=mini_shop\",\"--relationmode=belongsto\",\"--relationforeignkey=shop_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --table=mini_shop_balance --controller=finance/ShopBalance --relation=mini_shop --relationmode=belongsto --relationforeignkey=shop_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1594968230, 1594968230, 1594968230, 'successed');
INSERT INTO `table_command` VALUES (95, 'menu', '[\"--controller=finance\\/ShopBalance\"]', 'php think menu --controller=finance/ShopBalance', 'Build Successed!', 1594968255, 1594968255, 1594968255, 'successed');
INSERT INTO `table_command` VALUES (96, 'crud', '[\"--force=1\",\"--table=mini_shop_balance\",\"--controller=finance\\/ShopBalance\",\"--relation=mini_shop\",\"--relationmode=belongsto\",\"--relationforeignkey=shop_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=mini_shop_balance --controller=finance/ShopBalance --relation=mini_shop --relationmode=belongsto --relationforeignkey=shop_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1594968318, 1594968318, 1594968318, 'successed');
INSERT INTO `table_command` VALUES (97, 'menu', '[\"--controller=finance\\/ShopBalance\"]', 'php think menu --controller=finance/ShopBalance', 'Build Successed!', 1594968322, 1594968322, 1594968322, 'successed');
INSERT INTO `table_command` VALUES (98, 'crud', '[\"--force=1\",\"--table=mini_shop_balance_log\",\"--controller=finance\\/ShopBalanceLog\",\"--relation=mini_shop\",\"--relationmode=belongsto\",\"--relationforeignkey=shop_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=mini_shop_balance_log --controller=finance/ShopBalanceLog --relation=mini_shop --relationmode=belongsto --relationforeignkey=shop_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1594969098, 1594969098, 1594969098, 'successed');
INSERT INTO `table_command` VALUES (99, 'menu', '[\"--controller=finance\\/ShopBalanceLog\"]', 'php think menu --controller=finance/ShopBalanceLog', 'Build Successed!', 1594969108, 1594969108, 1594969109, 'successed');
INSERT INTO `table_command` VALUES (100, 'crud', '[\"--table=mini_content_balance\",\"--controller=content\\/Balance\"]', 'php think crud --table=mini_content_balance --controller=content/Balance', 'Build Successed', 1595381992, 1595381992, 1595381992, 'successed');
INSERT INTO `table_command` VALUES (101, 'menu', '[\"--controller=content\\/Balance\"]', 'php think menu --controller=content/Balance', 'Build Successed!', 1595382001, 1595382001, 1595382001, 'successed');
INSERT INTO `table_command` VALUES (102, 'crud', '[\"--table=table_test\"]', 'php think crud --table=table_test', 'Build Successed', 1596511677, 1596511677, 1596511677, 'successed');
INSERT INTO `table_command` VALUES (103, 'crud', '[\"--force=1\",\"--table=table_test\",\"--relation=table_category\",\"--relationmode=belongsto\",\"--relationforeignkey=category_ids\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=table_test --relation=table_category --relationmode=belongsto --relationforeignkey=category_ids --relationprimarykey=id --relationfields=name', 'Build Successed', 1596511710, 1596511710, 1596511710, 'successed');
INSERT INTO `table_command` VALUES (104, 'menu', '[\"--controller=Test\"]', 'php think menu --controller=Test', 'Build Successed!', 1596511726, 1596511726, 1596511727, 'successed');
INSERT INTO `table_command` VALUES (105, 'crud', '[\"--table=table_content_video\",\"--controller=content\\/ContetVideo\"]', 'php think crud --table=table_content_video --controller=content/ContetVideo', 'Build Successed', 1596521370, 1596521370, 1596521370, 'successed');
INSERT INTO `table_command` VALUES (106, 'menu', '[\"--controller=content\\/ContetVideo\"]', 'php think menu --controller=content/ContetVideo', 'Build Successed!', 1596521420, 1596521420, 1596521420, 'successed');
INSERT INTO `table_command` VALUES (107, 'crud', '[\"--force=1\",\"--table=table_content_video\",\"--controller=content\\/ContetVideo\"]', 'php think crud --force=1 --table=table_content_video --controller=content/ContetVideo', 'Build Successed', 1596521459, 1596521459, 1596521459, 'successed');

-- ----------------------------
-- Table structure for table_config
-- ----------------------------
DROP TABLE IF EXISTS `table_config`;
CREATE TABLE `table_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_config
-- ----------------------------
INSERT INTO `table_config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '室内装饰监理', '', 'required', '');
INSERT INTO `table_config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '');
INSERT INTO `table_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `table_config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `table_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `table_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `table_config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `table_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'order', '', 'required', '');
INSERT INTO `table_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"shop_type\":\"ShopType\"}', '', '', '');
INSERT INTO `table_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"wx_app\":\"WxApp\"}', '', '', '');
INSERT INTO `table_config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `table_config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `table_config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `table_config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `table_config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `table_config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `table_config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');
INSERT INTO `table_config` VALUES (18, 'app_id', 'wx_app', '小程序AppID', '', 'string', 'wx2e713ea8cdc377e8', '', '', '');
INSERT INTO `table_config` VALUES (19, 'app_secret', 'wx_app', '小程序密钥', '', 'string', '85d1009e850adc3ba587bdc260eb46ee', '', '', '');
INSERT INTO `table_config` VALUES (21, 'pay_notify_url', 'wx_app', '支付结果通知URL', '不要随意修改', 'string', 'https://jxm.bowangyun.net/api/Pay/notifyPay', '', '', '');
INSERT INTO `table_config` VALUES (25, 'mch_id', 'wx_app', '商户平台 商户号', '', 'string', '1503520101', '', '', '');
INSERT INTO `table_config` VALUES (26, 'key', 'wx_app', '商户平台 密钥', '', 'string', 'dI0iA3aG4iG5bB6gB2aK3oK0dC0hL0sa', '', '', '');

-- ----------------------------
-- Table structure for table_content_balance
-- ----------------------------
DROP TABLE IF EXISTS `table_content_balance`;
CREATE TABLE `table_content_balance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '提现说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '提现说明' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_content_balance
-- ----------------------------

-- ----------------------------
-- Table structure for table_content_banner
-- ----------------------------
DROP TABLE IF EXISTS `table_content_banner`;
CREATE TABLE `table_content_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片710*320',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联商家',
  `weigh` int(10) NOT NULL COMMENT '权重',
  `createtime` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'banner轮播' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_content_banner
-- ----------------------------
INSERT INTO `table_content_banner` VALUES (1, '/uploads/20200804/83bfdb846e5a006a7d0bc81864ac0a38.png', 39, 1, 1596507190, 1596507190);
INSERT INTO `table_content_banner` VALUES (2, '/uploads/20200804/83bfdb846e5a006a7d0bc81864ac0a38.png', 38, 2, 1596507205, 1596507205);
INSERT INTO `table_content_banner` VALUES (3, '/uploads/20200804/83bfdb846e5a006a7d0bc81864ac0a38.png', 43, 3, 1596507214, 1596507214);

-- ----------------------------
-- Table structure for table_content_complaint
-- ----------------------------
DROP TABLE IF EXISTS `table_content_complaint`;
CREATE TABLE `table_content_complaint`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '投诉内容',
  `stauts` enum('1','2','3','4','5') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '标记:1=未处理,2=处理中,3=处理完成,5=垃圾数据',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '投诉建议' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_content_complaint
-- ----------------------------

-- ----------------------------
-- Table structure for table_content_discount
-- ----------------------------
DROP TABLE IF EXISTS `table_content_discount`;
CREATE TABLE `table_content_discount`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_list` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '位置:1=首页大图,2=首页小图,3=分类页大图,4=分类页小图',
  `category_id` decimal(10, 7) NULL DEFAULT NULL COMMENT '分类',
  `shop_id` decimal(10, 7) NULL DEFAULT NULL COMMENT '商家',
  `good_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '商品',
  `image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `weigh` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '权重',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '优惠专区' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_content_discount
-- ----------------------------
INSERT INTO `table_content_discount` VALUES (1, '北京市朝阳区农光南里1号(住宅)楼(龙辉大厦就层南', 116.4618270, 39.8805810, '北京百万家园装修监理中心', '/uploads/20200804/4902fb07725ad8622d61b787ede920ec.png', '010-67309999', NULL, 1596535270);

-- ----------------------------
-- Table structure for table_content_headline
-- ----------------------------
DROP TABLE IF EXISTS `table_content_headline`;
CREATE TABLE `table_content_headline`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '头条管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_content_headline
-- ----------------------------

-- ----------------------------
-- Table structure for table_content_help
-- ----------------------------
DROP TABLE IF EXISTS `table_content_help`;
CREATE TABLE `table_content_help`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '帮助说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '帮助说明' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_content_help
-- ----------------------------

-- ----------------------------
-- Table structure for table_content_video
-- ----------------------------
DROP TABLE IF EXISTS `table_content_video`;
CREATE TABLE `table_content_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片660*320',
  `video_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '视频',
  `weigh` int(10) NOT NULL COMMENT '权重',
  `createtime` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '视频轮播' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_content_video
-- ----------------------------
INSERT INTO `table_content_video` VALUES (1, '/uploads/20200804/83bfdb846e5a006a7d0bc81864ac0a38.png', '/uploads/20200804/83888c9ccd5b24cd7f90ae0a065551a4.mp4', 1, 1596507190, 1596524526);
INSERT INTO `table_content_video` VALUES (2, '/uploads/20200804/83bfdb846e5a006a7d0bc81864ac0a38.png', '/uploads/20200804/83888c9ccd5b24cd7f90ae0a065551a4.mp4', 2, 1596507205, 1596524722);
INSERT INTO `table_content_video` VALUES (3, '/uploads/20200804/83bfdb846e5a006a7d0bc81864ac0a38.png', '/uploads/20200804/83888c9ccd5b24cd7f90ae0a065551a4.mp4', 3, 1596507214, 1596524566);

-- ----------------------------
-- Table structure for table_ems
-- ----------------------------
DROP TABLE IF EXISTS `table_ems`;
CREATE TABLE `table_ems`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮箱验证码表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_ems
-- ----------------------------

-- ----------------------------
-- Table structure for table_good
-- ----------------------------
DROP TABLE IF EXISTS `table_good`;
CREATE TABLE `table_good`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '商家',
  `shop_category_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `original` decimal(10, 2) NOT NULL COMMENT '原价',
  `price` decimal(10, 2) NOT NULL COMMENT '售价',
  `stock` int(11) UNSIGNED NOT NULL COMMENT '库存',
  `thumb_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `images` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品图片【多选】',
  `short` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '简介',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详情',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态:0=下架,1=上架',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) NULL DEFAULT NULL COMMENT '删除时间',
  `good_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联产品',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shop_id`(`shop_id`, `shop_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_good
-- ----------------------------
INSERT INTO `table_good` VALUES (38, 0, 0, '基础验收-1', 1300.00, 900.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 39, 1596447079, 1596953424, NULL, '39,40,41');
INSERT INTO `table_good` VALUES (39, 0, 0, '基础验收-2', 1200.00, 998.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\"/></p>', 1, 38, 1596506085, 1596506085, NULL, '38');
INSERT INTO `table_good` VALUES (40, 0, 0, '基础验收-3', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 39, 1596447079, 1596768394, NULL, '47,48,49');
INSERT INTO `table_good` VALUES (41, 0, 0, '基础验收-4', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (42, 0, 0, '基础验收-5', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (43, 0, 0, '基础验收-6', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (44, 0, 0, '基础验收-7', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (45, 0, 0, '基础验收-8', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (46, 0, 0, '基础验收-9', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (47, 0, 0, '基础验收-10', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (48, 0, 0, '基础验收-11', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (49, 0, 0, '基础验收-12', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (50, 0, 0, '基础验收-13', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (51, 0, 0, '基础验收-14', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (52, 0, 0, '基础验收-15', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (53, 0, 0, '基础验收-16', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (54, 0, 0, '基础验收-17', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (55, 0, 0, '基础验收-18', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (56, 0, 0, '基础验收-19', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (57, 0, 0, '基础验收-20', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (58, 0, 0, '基础验收-21', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (59, 0, 0, '基础验收-22', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (60, 0, 0, '基础验收-23', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (61, 0, 0, '基础验收-24', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (62, 0, 0, '基础验收-25', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (63, 0, 0, '基础验收-26', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (64, 0, 0, '基础验收-27', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (65, 0, 0, '基础验收-28', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (66, 0, 0, '基础验收-29', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);
INSERT INTO `table_good` VALUES (67, 0, 0, '基础验收-30', 1300.00, 800.00, 0, '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg,/uploads/20200803/4bb2d7b96a30e22607ff52c79aad260b.jpg', '', '<p><img src=\"/uploads/20200803/7e4bcea1137a343147b1d822bea99eda.png\" title=\"\" alt=\"\"/></p>', 1, 38, 1596447079, 1596504041, NULL, NULL);

-- ----------------------------
-- Table structure for table_like
-- ----------------------------
DROP TABLE IF EXISTS `table_like`;
CREATE TABLE `table_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '商家',
  `user_id` int(11) NOT NULL COMMENT '用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_like
-- ----------------------------
INSERT INTO `table_like` VALUES (6, 48, 1);
INSERT INTO `table_like` VALUES (7, 40, 1);
INSERT INTO `table_like` VALUES (8, 43, 1);

-- ----------------------------
-- Table structure for table_order
-- ----------------------------
DROP TABLE IF EXISTS `table_order`;
CREATE TABLE `table_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '商家',
  `numbers` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '系统订单号',
  `transaction` char(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信订单号',
  `body` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单名称',
  `total_counts` int(3) NOT NULL DEFAULT 0 COMMENT '购买总数量',
  `total_price` decimal(10, 2) NOT NULL COMMENT '交易金额',
  `message` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户留言',
  `is_show` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '用户可见性:0=不可见,1=可见',
  `pay_time` int(10) NULL DEFAULT NULL COMMENT '付款时间',
  `delivery_time` int(10) NULL DEFAULT NULL COMMENT '发货时间',
  `receiving_time` int(10) NULL DEFAULT NULL COMMENT '收货时间',
  `refund_apply_time` int(10) NULL DEFAULT NULL COMMENT '申请退款时间',
  `refund_apply_msg` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '退款申请',
  `refund_agree_time` int(10) NULL DEFAULT NULL COMMENT '同意退款时间',
  `refund_refuse_time` int(10) NULL DEFAULT NULL COMMENT '拒绝退款时间',
  `refund_refuse_msg` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '拒绝原因',
  `back_time` int(10) NULL DEFAULT NULL COMMENT '退单时间',
  `back_msg` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '退单原因',
  `status` enum('-1','0','1','2','3','4','5','6','7','8','9','10') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '交易状态:-1=超时,0=待付款,1=待发货,2=待收货,3=交易完成,4=待退款,5=已退款,6=拒绝退款,7=商家退单,8=平台介入,9=平台退单,10=平台拒绝',
  `mark` int(10) NULL DEFAULT NULL COMMENT '评分',
  `platform_agree_time` int(10) NULL DEFAULT NULL COMMENT '平台退单时间',
  `platform_agree_msg` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '平台退单原因',
  `platform_refuse_time` int(10) NULL DEFAULT NULL COMMENT '平台拒绝时间',
  `platform_refuse_msg` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '平台拒绝原因',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `updatetime`(`user_id`, `updatetime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_order
-- ----------------------------
INSERT INTO `table_order` VALUES (3, 1, 0, '2020080812582690D6CC', '', '基础验收-1,基础验收-2,基础验收-3等3件商品', 3, 2598.00, 'aiyayayya', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-1', NULL, NULL, NULL, NULL, NULL, 1596782821, 1596862788, NULL);
INSERT INTO `table_order` VALUES (4, 1, 0, '20200807145309xCrskV', '', '基础验收-1,基础验收-2,基础验收-3等3件商品', 3, 2598.00, '', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-1', NULL, NULL, NULL, NULL, NULL, 1596783189, 1596783189, NULL);
INSERT INTO `table_order` VALUES (5, 1, 0, '20200807145617GaVqDP', '', '基础验收-1,基础验收-2,基础验收-3等3件商品', 3, 2598.00, 'asdasda', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-1', NULL, NULL, NULL, NULL, NULL, 1596783378, 1596783378, NULL);
INSERT INTO `table_order` VALUES (6, 1, 0, '202008071457371lyXZE', '', '基础验收-1,基础验收-2,基础验收-3等3件商品', 3, 2598.00, '', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-1', NULL, NULL, NULL, NULL, NULL, 1596783457, 1596783457, NULL);
INSERT INTO `table_order` VALUES (7, 1, 0, '20200807145852KtcAAM', '', '基础验收-1,基础验收-2,基础验收-3等3件商品', 3, 2598.00, '', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-1', NULL, NULL, NULL, NULL, NULL, 1596783533, 1596783533, NULL);
INSERT INTO `table_order` VALUES (8, 1, 0, '20200807145922uTZ27C', '4200000586202008075467929721', '基础验收-1,基础验收-2,基础验收-3等3件商品', 3, 2598.00, '', '1', 1596783573, NULL, 1596863903, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', 2, 1596950295, '测试', NULL, NULL, 1596783562, 1596950295, NULL);
INSERT INTO `table_order` VALUES (9, 1, 0, '20200807150055segUgC', '4200000577202008076805851385', '基础验收-1,基础验收-3等2件商品', 2, 1600.00, '...', '1', 1596783672, NULL, 1596863636, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', 3, 1596951726, '阿萨德', NULL, NULL, 1596783655, 1596951726, NULL);
INSERT INTO `table_order` VALUES (10, 1, 0, '20200807150649KE16cH', '4200000572202008070465266323', '基础验收-1等1件商品', 1, 800.00, '', '1', 1596784033, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1596784010, 1596784033, NULL);
INSERT INTO `table_order` VALUES (11, 1, 0, '20200807151832TKgjG6', '', '基础验收-3等1件商品', 1, 800.00, 'asdasd', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-1', NULL, NULL, NULL, NULL, NULL, 1596784714, 1596784714, NULL);
INSERT INTO `table_order` VALUES (12, 1, 0, '20200808124431tGw8Ns', '', '基础验收-3等1件商品', 1, 800.00, 'asdasdas', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-1', NULL, NULL, NULL, NULL, NULL, 1596785397, 1596862833, NULL);

-- ----------------------------
-- Table structure for table_order_address
-- ----------------------------
DROP TABLE IF EXISTS `table_order_address`;
CREATE TABLE `table_order_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单',
  `contact` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `order_id_2`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单地址表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_order_address
-- ----------------------------
INSERT INTO `table_order_address` VALUES (3, 3, '耿先生', '17853609200', '北京市朝阳区建国路88号院现代城1705');
INSERT INTO `table_order_address` VALUES (4, 4, '耿先生', '17853609200', '北京市朝阳区建国路88号院现代城1705');
INSERT INTO `table_order_address` VALUES (5, 5, '耿先生', '17853609200', '北京市朝阳区建国路88号院现代城1705');
INSERT INTO `table_order_address` VALUES (6, 6, '耿先生', '17853609200', '北京市朝阳区建国路88号院现代城1705');
INSERT INTO `table_order_address` VALUES (7, 7, '耿先生', '17853609200', '北京市朝阳区建国路88号院现代城1705');
INSERT INTO `table_order_address` VALUES (8, 8, '耿先生', '17853609200', '北京市朝阳区建国路88号院现代城1705');
INSERT INTO `table_order_address` VALUES (9, 9, '耿先生', '17853609200', '北京市朝阳区建国路88号院现代城1705');
INSERT INTO `table_order_address` VALUES (10, 10, '耿先生', '17853609200', '北京市朝阳区建国路88号院现代城1705');
INSERT INTO `table_order_address` VALUES (11, 11, '耿先生', '17853609200', '北京市朝阳区建国路88号院现代城1705');
INSERT INTO `table_order_address` VALUES (12, 12, '耿先生', '17853609200', '北京市朝阳区建国路88号院现代城1705');

-- ----------------------------
-- Table structure for table_order_good
-- ----------------------------
DROP TABLE IF EXISTS `table_order_good`;
CREATE TABLE `table_order_good`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单',
  `good_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `thumb_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `short` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '简介',
  `original` decimal(10, 2) NOT NULL COMMENT '原价',
  `price` decimal(10, 2) NOT NULL COMMENT '售价',
  `counts` int(3) NOT NULL DEFAULT 0 COMMENT '购买数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_order_good
-- ----------------------------
INSERT INTO `table_order_good` VALUES (1, 3, 0, '基础验收-1', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (2, 3, 0, '基础验收-2', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1200.00, 998.00, 0);
INSERT INTO `table_order_good` VALUES (3, 3, 0, '基础验收-3', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (4, 4, 0, '基础验收-1', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (5, 4, 0, '基础验收-2', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1200.00, 998.00, 0);
INSERT INTO `table_order_good` VALUES (6, 4, 0, '基础验收-3', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (7, 5, 0, '基础验收-1', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (8, 5, 0, '基础验收-2', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1200.00, 998.00, 0);
INSERT INTO `table_order_good` VALUES (9, 5, 0, '基础验收-3', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (10, 6, 0, '基础验收-1', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (11, 6, 0, '基础验收-2', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1200.00, 998.00, 0);
INSERT INTO `table_order_good` VALUES (12, 6, 0, '基础验收-3', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (13, 7, 0, '基础验收-1', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (14, 7, 0, '基础验收-2', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1200.00, 998.00, 0);
INSERT INTO `table_order_good` VALUES (15, 7, 0, '基础验收-3', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (16, 8, 0, '基础验收-1', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (17, 8, 0, '基础验收-2', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1200.00, 998.00, 0);
INSERT INTO `table_order_good` VALUES (18, 8, 0, '基础验收-3', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (19, 9, 0, '基础验收-1', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (20, 9, 0, '基础验收-3', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (21, 10, 0, '基础验收-1', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (22, 11, 0, '基础验收-3', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);
INSERT INTO `table_order_good` VALUES (23, 12, 0, '基础验收-3', '/uploads/20200803/03b9cf24bf437601a42d2ab7efcd43f5.png', '', 1300.00, 800.00, 0);

-- ----------------------------
-- Table structure for table_shop
-- ----------------------------
DROP TABLE IF EXISTS `table_shop`;
CREATE TABLE `table_shop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL COMMENT '推广人',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户',
  `category_id` int(11) NOT NULL DEFAULT 0 COMMENT '经营行业',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `logo_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'logo',
  `short` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简介',
  `contact` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `status` enum('0','1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '2' COMMENT '状态:0=禁用,1=正常,2=审核中,3=审核失败',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `createtime` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `deletetime` int(10) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商家表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_shop
-- ----------------------------

-- ----------------------------
-- Table structure for table_shop_address
-- ----------------------------
DROP TABLE IF EXISTS `table_shop_address`;
CREATE TABLE `table_shop_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '商家',
  `address` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商铺地址',
  `longitude` decimal(13, 10) NOT NULL COMMENT '经度',
  `latitude` decimal(13, 10) NOT NULL COMMENT '纬度',
  `hours_start` tinyint(2) NOT NULL DEFAULT 0 COMMENT '营业开始时间',
  `hours_end` tinyint(2) NOT NULL DEFAULT 0 COMMENT '营业结束时间',
  `delivery` int(3) NOT NULL DEFAULT 0 COMMENT '配送时间 分钟',
  `distance` int(10) NOT NULL DEFAULT 0 COMMENT '配送距离 千米',
  `base_price` decimal(8, 2) NOT NULL COMMENT '起送价格',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `shop_id`(`shop_id`) USING BTREE,
  INDEX `longitude`(`longitude`) USING BTREE,
  INDEX `Latitude`(`latitude`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商户地址表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_shop_address
-- ----------------------------

-- ----------------------------
-- Table structure for table_shop_balance
-- ----------------------------
DROP TABLE IF EXISTS `table_shop_balance`;
CREATE TABLE `table_shop_balance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '商家',
  `total_price` decimal(10, 2) NOT NULL COMMENT '总收益',
  `cash` decimal(10, 2) NOT NULL COMMENT '已提现',
  `balance` decimal(10, 2) NOT NULL COMMENT '余额',
  `balance_` decimal(10, 2) NOT NULL COMMENT '未到账收益',
  `bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `bank_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户人名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `shop_id`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商家收益' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_shop_balance
-- ----------------------------

-- ----------------------------
-- Table structure for table_shop_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `table_shop_balance_log`;
CREATE TABLE `table_shop_balance_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '商家',
  `bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行名称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开户人名称',
  `bank_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行卡号',
  `cash` decimal(10, 2) NOT NULL COMMENT '提现金额',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态:0=待打款,1=已打款',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT 0 COMMENT '更新时间',
  `pay_time` int(10) NULL DEFAULT NULL COMMENT '打款时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提现申请' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_shop_balance_log
-- ----------------------------

-- ----------------------------
-- Table structure for table_shop_category
-- ----------------------------
DROP TABLE IF EXISTS `table_shop_category`;
CREATE TABLE `table_shop_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '商家',
  `name` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `thumb_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '状态:0=关闭,1=正常',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商家分类' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_shop_category
-- ----------------------------
INSERT INTO `table_shop_category` VALUES (1, 1, '科学除醛', '/uploads/20200804/4fb02b43c1f4760c29415e74ed390506.png', NULL, 8, '1', 1596509053, 1596518384, NULL);
INSERT INTO `table_shop_category` VALUES (2, 1, '品牌介绍', '/uploads/20200804/6ec48295acf2c5168ba4005352a88070.png', NULL, 7, '1', 1596519007, 1596519007, NULL);
INSERT INTO `table_shop_category` VALUES (3, 1, '成功案例', '/uploads/20200804/d5fdd45b6b6e89f184d49edad75e8c8f.png', NULL, 6, '1', 1596519033, 1596519033, NULL);
INSERT INTO `table_shop_category` VALUES (4, 1, '核心优势', '/uploads/20200804/3abe70d1befde1ac32b91e1f8e704dfe.png', NULL, 5, '1', 1596519056, 1596519056, NULL);
INSERT INTO `table_shop_category` VALUES (5, 1, '荣誉资质', '/uploads/20200804/30fbfb8b1092e2c5e7a7a40d74871303.png', NULL, 4, '1', 1596519075, 1596519075, NULL);
INSERT INTO `table_shop_category` VALUES (6, 1, '专家问答', '/uploads/20200804/32554a3dca56e851e00089144f873528.png', NULL, 3, '1', 1596519095, 1596519095, NULL);
INSERT INTO `table_shop_category` VALUES (7, 1, '权威报告', '/uploads/20200804/85321b80c392ce2c1f283c9b6b3179e0.png', NULL, 2, '1', 1596519121, 1596519121, NULL);
INSERT INTO `table_shop_category` VALUES (8, 1, '公司简历', '/uploads/20200804/4902fb07725ad8622d61b787ede920ec.png', '<p><span style=\"color: rgb(60, 60, 60); font-family: Arial; font-size: 14px; background-color: rgb(255, 255, 255);\">北京百万家园室内装饰监理有限公司，于2000-07-03在北京市注册成立，属于科学研究和技术服务业，主营行业为专业技术服务业，服务领域为家居装饰工程监理；技术开发、技术转让、技术培训、技术咨询。，注册资本188万元人民币。北京百万家园室内装饰监理有限公司办公地址为北京市朝阳区农光南里1号(住宅)楼(龙辉大厦就层南侧)907室，如果您对我们的产品、技术或服务有兴趣，随时欢迎您的来电或上门咨询。</span></p>', 1, '1', 1596519140, 1596519490, NULL);
INSERT INTO `table_shop_category` VALUES (9, 2, '单项检查', '/uploads/20200804/b87846e8c091921037bffbaef960530a.png', '', 22, '1', 1596535823, 1596535823, NULL);
INSERT INTO `table_shop_category` VALUES (10, 2, '全程监理', '/uploads/20200804/78a72a1e648401cfdb850fe514d9cf74.png', '', 21, '1', 1596535881, 1596535881, NULL);
INSERT INTO `table_shop_category` VALUES (11, 2, '毛坯房验收', '/uploads/20200804/9cc7258cc2b130c258e0b51c30845fc5.png', '', 20, '1', 1596535939, 1596535939, NULL);
INSERT INTO `table_shop_category` VALUES (13, 2, '装修工程监', '/uploads/20200804/7991529eaed6d7a6098ed28e22d47046.png', '', 19, '1', 1596536005, 1596536005, NULL);
INSERT INTO `table_shop_category` VALUES (14, 2, '审核设计方', '/uploads/20200804/3899c07fa0423cab7f6c62bf8494de88.png', '', 18, '1', 1596536019, 1596536019, NULL);
INSERT INTO `table_shop_category` VALUES (15, 2, '审核装修报', '/uploads/20200804/f2274a84b65c7887402f2e1b84349642.png', '', 17, '1', 1596536040, 1596536040, NULL);
INSERT INTO `table_shop_category` VALUES (16, 2, '家居环境预', '/uploads/20200804/45d9a6bbb1cbd28d133982a9f2c8af35.png', '', 16, '1', 1596536053, 1596536053, NULL);
INSERT INTO `table_shop_category` VALUES (17, 2, '协助签署合', '/uploads/20200804/a0b4314ad5a282d6a1934d1ec5b29524.png', '', 15, '1', 1596536065, 1596536065, NULL);
INSERT INTO `table_shop_category` VALUES (18, 2, '装修造价评', '/uploads/20200804/62e020e62617ab8b3b9cf617e2e583f8.png', '', 14, '1', 1596536076, 1596536076, NULL);
INSERT INTO `table_shop_category` VALUES (19, 2, '提交司法证', '/uploads/20200804/27c2bf7ba5d17eed792d33b1cc0f1cdf.png', '', 13, '1', 1596536087, 1596536087, NULL);
INSERT INTO `table_shop_category` VALUES (20, 2, '审核企业资', '/uploads/20200804/586b61dd25278f0c9b252627d069fabb.png', '', 11, '1', 1596536099, 1596536099, NULL);
INSERT INTO `table_shop_category` VALUES (21, 2, '精装修验收', '/uploads/20200804/cddd26e5d4f6b33e2aa6d628a2869e5e.png', '', 10, '1', 1596536113, 1596536113, NULL);
INSERT INTO `table_shop_category` VALUES (22, 2, '装修质量勘', '/uploads/20200804/676d9be6de7490b24aa11e41c072e0a4.png', '', 9, '1', 1596536154, 1596536154, NULL);

-- ----------------------------
-- Table structure for table_shop_material
-- ----------------------------
DROP TABLE IF EXISTS `table_shop_material`;
CREATE TABLE `table_shop_material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '商家',
  `card_up_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证正面',
  `card_down_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证反面',
  `license_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '营业执照',
  `storefront_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '实体店照片',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `shop_id`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商家资料表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_shop_material
-- ----------------------------

-- ----------------------------
-- Table structure for table_sms
-- ----------------------------
DROP TABLE IF EXISTS `table_sms`;
CREATE TABLE `table_sms`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信验证码表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_sms
-- ----------------------------

-- ----------------------------
-- Table structure for table_test
-- ----------------------------
DROP TABLE IF EXISTS `table_test`;
CREATE TABLE `table_test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of table_test
-- ----------------------------
INSERT INTO `table_test` VALUES (1, '8,4,10,7,1');

-- ----------------------------
-- Table structure for table_user
-- ----------------------------
DROP TABLE IF EXISTS `table_user`;
CREATE TABLE `table_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `open_id` varchar(56) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '组别ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10, 2) UNSIGNED NOT NULL COMMENT '余额',
  `score` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '最大连续登录天数',
  `prevtime` int(10) NULL DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) NULL DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证',
  `session_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_extension` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '是否是推广员',
  `child` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '推广下级',
  `child_number` int(11) NULL DEFAULT NULL COMMENT '推广人数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE,
  INDEX `open_id`(`open_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_user
-- ----------------------------
INSERT INTO `table_user` VALUES (1, 'ouaA341gNjrnZLC4CGEv4okZwv8Y', 1, '耿先生', ' ', '', '', '北京市朝阳区建国路88号院现代城1705', '17853609200', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eolTQ926hibYfSwiaxNQOK18JD1S5QDPibbyV9nKoBCcojUhSbkYCUceIANvTjFBlUP2E2XXCTJicla8A/132', 0, 0, NULL, '', 0.00, 0, 1, 2, 1596950936, 1596950964, '127.0.0.1', 0, '127.0.0.1', 1596507874, 1596507874, 2020, '', 'normal', '', 'o5krY6+sYNHu79W9CT/7Zg==', '0', NULL, NULL);
INSERT INTO `table_user` VALUES (2, 'ouaA343yLiRpkWONUIuULQkfJUFI', 1, '', '', '', '', '', '', '', 0, 0, NULL, '', 0.00, 0, 1, 1, 1596785720, 1596786078, '127.0.0.1', 0, '127.0.0.1', 1596785720, 1596785720, 1596786078, '', 'normal', '', 'NZKdc/sLTa2uxaQXtMqn7w==', '0', NULL, NULL);

-- ----------------------------
-- Table structure for table_user_address
-- ----------------------------
DROP TABLE IF EXISTS `table_user_address`;
CREATE TABLE `table_user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `longitude` decimal(13, 10) NOT NULL COMMENT '经度',
  `latitude` decimal(13, 10) NOT NULL COMMENT '纬度',
  `address` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '收货地址',
  `doorplate` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '门牌号',
  `contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认:0=正常,1=默认',
  `createtime` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户地址表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_user_address
-- ----------------------------
INSERT INTO `table_user_address` VALUES (1, 1, 116.4163700000, 39.9285500000, '北京市北京市', '草场地73号302', '耿先生', '17853609200', 0, 1596703942, 1596765118);
INSERT INTO `table_user_address` VALUES (2, 1, 116.4758933490, 39.9065846980, '北京市朝阳区建国路88号院', '现代城1705', '耿先生', '17853609200', 1, 1596706781, 1596765466);

-- ----------------------------
-- Table structure for table_user_cart
-- ----------------------------
DROP TABLE IF EXISTS `table_user_cart`;
CREATE TABLE `table_user_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `shop_id` int(11) NOT NULL COMMENT '商家',
  `good_id` int(11) NOT NULL COMMENT '商品',
  `number` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数量',
  `select_` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '选中:0=未选中,1=选中',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `good_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '购物车' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_user_cart
-- ----------------------------

-- ----------------------------
-- Table structure for table_user_group
-- ----------------------------
DROP TABLE IF EXISTS `table_user_group`;
CREATE TABLE `table_user_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '权限节点',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_user_group
-- ----------------------------
INSERT INTO `table_user_group` VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1515386468, 1516168298, 'normal');

-- ----------------------------
-- Table structure for table_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `table_user_money_log`;
CREATE TABLE `table_user_money_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL COMMENT '变更余额',
  `before` decimal(10, 2) NOT NULL COMMENT '变更前余额',
  `after` decimal(10, 2) NOT NULL COMMENT '变更后余额',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员余额变动表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_user_money_log
-- ----------------------------

-- ----------------------------
-- Table structure for table_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `table_user_rule`;
CREATE TABLE `table_user_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) NULL DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_user_rule
-- ----------------------------
INSERT INTO `table_user_rule` VALUES (1, 0, 'index', '前台', '', 1, 1516168079, 1516168079, 1, 'normal');
INSERT INTO `table_user_rule` VALUES (2, 0, 'api', 'API接口', '', 1, 1516168062, 1516168062, 2, 'normal');
INSERT INTO `table_user_rule` VALUES (3, 1, 'user', '会员模块', '', 1, 1515386221, 1516168103, 12, 'normal');
INSERT INTO `table_user_rule` VALUES (4, 2, 'user', '会员模块', '', 1, 1515386221, 1516168092, 11, 'normal');
INSERT INTO `table_user_rule` VALUES (5, 3, 'index/user/login', '登录', '', 0, 1515386247, 1515386247, 5, 'normal');
INSERT INTO `table_user_rule` VALUES (6, 3, 'index/user/register', '注册', '', 0, 1515386262, 1516015236, 7, 'normal');
INSERT INTO `table_user_rule` VALUES (7, 3, 'index/user/index', '会员中心', '', 0, 1516015012, 1516015012, 9, 'normal');
INSERT INTO `table_user_rule` VALUES (8, 3, 'index/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 4, 'normal');
INSERT INTO `table_user_rule` VALUES (9, 4, 'api/user/login', '登录', '', 0, 1515386247, 1515386247, 6, 'normal');
INSERT INTO `table_user_rule` VALUES (10, 4, 'api/user/register', '注册', '', 0, 1515386262, 1516015236, 8, 'normal');
INSERT INTO `table_user_rule` VALUES (11, 4, 'api/user/index', '会员中心', '', 0, 1516015012, 1516015012, 10, 'normal');
INSERT INTO `table_user_rule` VALUES (12, 4, 'api/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 3, 'normal');

-- ----------------------------
-- Table structure for table_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `table_user_score_log`;
CREATE TABLE `table_user_score_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT 0 COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT 0 COMMENT '变更后积分',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员积分变动表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_user_score_log
-- ----------------------------
INSERT INTO `table_user_score_log` VALUES (1, 1, 0, 0, 0, '管理员变更积分', 1591084928);

-- ----------------------------
-- Table structure for table_user_token
-- ----------------------------
DROP TABLE IF EXISTS `table_user_token`;
CREATE TABLE `table_user_token`  (
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员Token表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_user_token
-- ----------------------------
INSERT INTO `table_user_token` VALUES ('7e32dceeb284a99e11f13d53ab72f3a34c5a1ce4', 1, 1596950964, 1599542964);
INSERT INTO `table_user_token` VALUES ('d2e9faa5c744946e6a666026f27b73ec622d8e4b', 2, 1596786078, 1599378078);

-- ----------------------------
-- Table structure for table_view
-- ----------------------------
DROP TABLE IF EXISTS `table_view`;
CREATE TABLE `table_view`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '商家',
  `user_id` int(11) NOT NULL COMMENT '用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table_view
-- ----------------------------
INSERT INTO `table_view` VALUES (6, 48, 1);
INSERT INTO `table_view` VALUES (7, 40, 1);
INSERT INTO `table_view` VALUES (8, 43, 1);
INSERT INTO `table_view` VALUES (9, 48, 1);
INSERT INTO `table_view` VALUES (10, 40, 1);
INSERT INTO `table_view` VALUES (11, 43, 1);
INSERT INTO `table_view` VALUES (12, 48, 1);
INSERT INTO `table_view` VALUES (13, 40, 1);
INSERT INTO `table_view` VALUES (14, 43, 1);
INSERT INTO `table_view` VALUES (15, 48, 1);
INSERT INTO `table_view` VALUES (16, 40, 1);
INSERT INTO `table_view` VALUES (17, 43, 1);
INSERT INTO `table_view` VALUES (18, 48, 1);
INSERT INTO `table_view` VALUES (19, 40, 1);
INSERT INTO `table_view` VALUES (20, 43, 1);
INSERT INTO `table_view` VALUES (21, 48, 1);
INSERT INTO `table_view` VALUES (22, 48, 1);
INSERT INTO `table_view` VALUES (23, 40, 1);
INSERT INTO `table_view` VALUES (24, 40, 1);
INSERT INTO `table_view` VALUES (25, 43, 1);
INSERT INTO `table_view` VALUES (26, 43, 1);

SET FOREIGN_KEY_CHECKS = 1;
