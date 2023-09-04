/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:33062
 Source Schema         : class

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 04/09/2023 15:20:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_menu` VALUES (1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (8, 9, 0, 'student', 'fa-500px', 'student', '*', '2023-08-16 03:55:02', '2023-08-24 17:27:33');
INSERT INTO `admin_menu` VALUES (9, 0, 0, '学校', 'fa-bars', NULL, '*', '2023-08-16 06:35:17', '2023-08-16 06:35:17');
INSERT INTO `admin_menu` VALUES (10, 9, 0, 'teacher', 'fa-bars', 'teacher', '*', '2023-08-16 06:37:19', '2023-08-16 06:37:19');
INSERT INTO `admin_menu` VALUES (11, 9, 0, 'role', 'fa-bars', 'role', '*', '2023-08-16 06:42:09', '2023-08-17 16:32:05');
INSERT INTO `admin_menu` VALUES (12, 9, 0, 'school', 'fa-bars', 'school', '*', '2023-08-16 07:16:30', '2023-08-16 07:16:30');
INSERT INTO `admin_menu` VALUES (13, 9, 0, 'permission', 'fa-bars', 'permission', '*', '2023-08-17 16:32:39', '2023-08-17 16:34:43');
INSERT INTO `admin_menu` VALUES (14, 9, 0, 'line', 'fa-bars', 'line', NULL, '2023-08-24 18:13:08', '2023-08-24 18:13:08');
COMMIT;

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=576 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
BEGIN;
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '172.17.0.1', '[]', '2023-08-15 06:56:00', '2023-08-15 06:56:00');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-15 06:56:24', '2023-08-15 06:56:24');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/roles', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-15 06:56:27', '2023-08-15 06:56:27');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-15 06:56:32', '2023-08-15 06:56:32');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/auth/permissions', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-15 06:56:35', '2023-08-15 06:56:35');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-15 06:56:38', '2023-08-15 06:56:38');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-15 07:02:14', '2023-08-15 07:02:14');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin', 'GET', '172.17.0.1', '[]', '2023-08-16 03:25:11', '2023-08-16 03:25:11');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/auth/roles', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:25:44', '2023-08-16 03:25:44');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/auth/roles/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:25:48', '2023-08-16 03:25:48');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/roles', 'POST', '172.17.0.1', '{\"slug\":\"teacher_leader\",\"name\":\"teacher_leader\",\"permissions\":[null],\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/roles\"}', '2023-08-16 03:31:31', '2023-08-16 03:31:31');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/auth/roles', 'GET', '172.17.0.1', '[]', '2023-08-16 03:31:32', '2023-08-16 03:31:32');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:32:05', '2023-08-16 03:32:05');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/auth/permissions', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:32:55', '2023-08-16 03:32:55');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/auth/permissions', 'GET', '172.17.0.1', '[]', '2023-08-16 03:34:03', '2023-08-16 03:34:03');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:34:11', '2023-08-16 03:34:11');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin', 'GET', '172.17.0.1', '[]', '2023-08-16 03:34:21', '2023-08-16 03:34:21');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin', 'GET', '172.17.0.1', '[]', '2023-08-16 03:34:44', '2023-08-16 03:34:44');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:34:53', '2023-08-16 03:34:53');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/roles', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:34:55', '2023-08-16 03:34:55');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:36:15', '2023-08-16 03:36:15');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/roles', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:46:27', '2023-08-16 03:46:27');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:49:24', '2023-08-16 03:49:24');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:49:25', '2023-08-16 03:49:25');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:49:27', '2023-08-16 03:49:27');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/menu/5/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:49:56', '2023-08-16 03:49:56');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:50:15', '2023-08-16 03:50:15');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/menu/2/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:50:55', '2023-08-16 03:50:55');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:51:02', '2023-08-16 03:51:02');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/auth/menu/5/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:51:17', '2023-08-16 03:51:17');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:52:24', '2023-08-16 03:52:24');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/auth/permissions', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:52:41', '2023-08-16 03:52:41');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/auth/roles', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:52:56', '2023-08-16 03:52:56');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/auth/roles/2/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:53:00', '2023-08-16 03:53:00');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/auth/roles', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:53:19', '2023-08-16 03:53:19');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/auth/permissions', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:53:20', '2023-08-16 03:53:20');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/auth/permissions/5/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:53:40', '2023-08-16 03:53:40');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/auth/permissions', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:53:45', '2023-08-16 03:53:45');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:54:12', '2023-08-16 03:54:12');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/auth/permissions', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:54:15', '2023-08-16 03:54:15');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:54:19', '2023-08-16 03:54:19');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/auth/menu', 'POST', '172.17.0.1', '{\"parent_id\":\"0\",\"title\":\"Backend\",\"icon\":\"fa-500px\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\"}', '2023-08-16 03:55:02', '2023-08-16 03:55:02');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 03:55:03', '2023-08-16 03:55:03');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:55:05', '2023-08-16 03:55:05');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:55:13', '2023-08-16 03:55:13');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin', 'GET', '172.17.0.1', '[]', '2023-08-16 03:55:16', '2023-08-16 03:55:16');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:55:20', '2023-08-16 03:55:20');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:55:23', '2023-08-16 03:55:23');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:55:25', '2023-08-16 03:55:25');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:55:33', '2023-08-16 03:55:33');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 03:55:43', '2023-08-16 03:55:43');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/auth/menu/8', 'PUT', '172.17.0.1', '{\"parent_id\":\"0\",\"title\":\"Backend\",\"icon\":\"fa-500px\",\"uri\":\"backend\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/menu\"}', '2023-08-16 03:55:51', '2023-08-16 03:55:51');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 03:55:51', '2023-08-16 03:55:51');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:36:59', '2023-08-16 05:36:59');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/auth/menu/8', 'PUT', '172.17.0.1', '{\"parent_id\":\"2\",\"title\":\"Student\",\"icon\":\"fa-500px\",\"uri\":\"student\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/menu\"}', '2023-08-16 05:37:29', '2023-08-16 05:37:29');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 05:37:30', '2023-08-16 05:37:30');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 05:37:38', '2023-08-16 05:37:38');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:38:20', '2023-08-16 05:38:20');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:38:34', '2023-08-16 05:38:34');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/auth/roles', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:38:36', '2023-08-16 05:38:36');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/auth/permissions', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:38:38', '2023-08-16 05:38:38');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:39:07', '2023-08-16 05:39:07');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:39:08', '2023-08-16 05:39:08');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:39:09', '2023-08-16 05:39:09');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/auth/permissions', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:39:21', '2023-08-16 05:39:21');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:39:30', '2023-08-16 05:39:30');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:39:39', '2023-08-16 05:39:39');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/auth/menu/3/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:39:44', '2023-08-16 05:39:44');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:39:54', '2023-08-16 05:39:54');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 05:39:57', '2023-08-16 05:39:57');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/auth/menu/8', 'PUT', '172.17.0.1', '{\"parent_id\":\"2\",\"title\":\"Student\",\"icon\":\"fa-500px\",\"uri\":\"student\\/list\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/menu\"}', '2023-08-16 05:40:18', '2023-08-16 05:40:18');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 05:40:19', '2023-08-16 05:40:19');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 05:40:21', '2023-08-16 05:40:21');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:00:49', '2023-08-16 06:00:49');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/auth/menu/8', 'PUT', '172.17.0.1', '{\"parent_id\":\"2\",\"title\":\"Student\",\"icon\":\"fa-500px\",\"uri\":\"auth\\/student\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/menu\"}', '2023-08-16 06:02:31', '2023-08-16 06:02:31');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:02:32', '2023-08-16 06:02:32');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:03:03', '2023-08-16 06:03:03');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:04:29', '2023-08-16 06:04:29');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/auth/menu/8', 'PUT', '172.17.0.1', '{\"parent_id\":\"2\",\"title\":\"Student\",\"icon\":\"fa-500px\",\"uri\":\"student\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/menu\"}', '2023-08-16 06:04:35', '2023-08-16 06:04:35');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:04:36', '2023-08-16 06:04:36');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '[]', '2023-08-16 06:04:56', '2023-08-16 06:04:56');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/auth/menu/8', 'PUT', '172.17.0.1', '{\"parent_id\":\"2\",\"title\":\"Student\",\"icon\":\"fa-500px\",\"uri\":\"student\\/form\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/menu\"}', '2023-08-16 06:08:47', '2023-08-16 06:08:47');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:08:48', '2023-08-16 06:08:48');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin', 'GET', '172.17.0.1', '[]', '2023-08-16 06:09:48', '2023-08-16 06:09:48');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:09:52', '2023-08-16 06:09:52');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/student/form', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:10:42', '2023-08-16 06:10:42');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/student/form', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:15:07', '2023-08-16 06:15:07');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/student/form', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:15:32', '2023-08-16 06:15:32');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:16:59', '2023-08-16 06:16:59');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:17:04', '2023-08-16 06:17:04');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/auth/menu/8', 'PUT', '172.17.0.1', '{\"parent_id\":\"2\",\"title\":\"Student\",\"icon\":\"fa-500px\",\"uri\":\"student\\/grid\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/menu\"}', '2023-08-16 06:17:08', '2023-08-16 06:17:08');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:17:09', '2023-08-16 06:17:09');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:17:15', '2023-08-16 06:17:15');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/student/grid', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:17:19', '2023-08-16 06:17:19');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:17:21', '2023-08-16 06:17:21');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:17:39', '2023-08-16 06:17:39');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/student/grid', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:17:41', '2023-08-16 06:17:41');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/auth/users', 'GET', '172.17.0.1', '[]', '2023-08-16 06:17:42', '2023-08-16 06:17:42');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/student/grid', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:22:01', '2023-08-16 06:22:01');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/auth/users', 'GET', '172.17.0.1', '[]', '2023-08-16 06:22:02', '2023-08-16 06:22:02');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/student/grid', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:22:07', '2023-08-16 06:22:07');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/auth/users', 'GET', '172.17.0.1', '[]', '2023-08-16 06:22:08', '2023-08-16 06:22:08');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/student/grid', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:22:21', '2023-08-16 06:22:21');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/auth/users', 'GET', '172.17.0.1', '[]', '2023-08-16 06:22:22', '2023-08-16 06:22:22');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/student/grid', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:22:24', '2023-08-16 06:22:24');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/auth/users', 'GET', '172.17.0.1', '[]', '2023-08-16 06:22:26', '2023-08-16 06:22:26');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:27:12', '2023-08-16 06:27:12');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:27:16', '2023-08-16 06:27:16');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/auth/menu/8', 'PUT', '172.17.0.1', '{\"parent_id\":\"2\",\"title\":\"Student\",\"icon\":\"fa-500px\",\"uri\":\"student\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/menu\"}', '2023-08-16 06:27:20', '2023-08-16 06:27:20');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:27:21', '2023-08-16 06:27:21');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin', 'GET', '172.17.0.1', '[]', '2023-08-16 06:28:42', '2023-08-16 06:28:42');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:28:45', '2023-08-16 06:28:45');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:29:55', '2023-08-16 06:29:55');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:29:58', '2023-08-16 06:29:58');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/auth/menu/8', 'PUT', '172.17.0.1', '{\"parent_id\":\"0\",\"title\":\"Student\",\"icon\":\"fa-500px\",\"uri\":\"student\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/menu\"}', '2023-08-16 06:30:13', '2023-08-16 06:30:13');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:30:14', '2023-08-16 06:30:14');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:30:16', '2023-08-16 06:30:16');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:32:21', '2023-08-16 06:32:21');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/student/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:32:31', '2023-08-16 06:32:31');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:32:37', '2023-08-16 06:32:37');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:34:29', '2023-08-16 06:34:29');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/auth/menu', 'POST', '172.17.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5b66\\u6821\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\"}', '2023-08-16 06:35:17', '2023-08-16 06:35:17');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:35:18', '2023-08-16 06:35:18');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:35:20', '2023-08-16 06:35:20');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/auth/menu/8', 'PUT', '172.17.0.1', '{\"parent_id\":\"9\",\"title\":\"Student\",\"icon\":\"fa-500px\",\"uri\":\"student\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/menu\"}', '2023-08-16 06:35:28', '2023-08-16 06:35:28');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:35:28', '2023-08-16 06:35:28');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:35:36', '2023-08-16 06:35:36');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-16 06:35:40', '2023-08-16 06:35:40');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:36:56', '2023-08-16 06:36:56');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/auth/menu', 'POST', '172.17.0.1', '{\"parent_id\":\"9\",\"title\":\"teacher\",\"icon\":\"fa-bars\",\"uri\":\"teacher\",\"roles\":[null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\"}', '2023-08-16 06:37:19', '2023-08-16 06:37:19');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:37:20', '2023-08-16 06:37:20');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:37:23', '2023-08-16 06:37:23');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:37:28', '2023-08-16 06:37:28');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/auth/menu', 'POST', '172.17.0.1', '{\"parent_id\":\"9\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-bars\",\"uri\":\"role\",\"roles\":[null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\"}', '2023-08-16 06:42:09', '2023-08-16 06:42:09');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 06:42:09', '2023-08-16 06:42:09');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:42:12', '2023-08-16 06:42:12');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/role/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:42:40', '2023-08-16 06:42:40');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:42:43', '2023-08-16 06:42:43');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/role/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:44:12', '2023-08-16 06:44:12');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:44:46', '2023-08-16 06:44:46');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/role/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:44:49', '2023-08-16 06:44:49');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 06:44:55', '2023-08-16 06:44:55');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null}', '2023-08-16 06:45:56', '2023-08-16 06:45:56');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/role', 'GET', '172.17.0.1', '{\"id\":null}', '2023-08-16 07:15:29', '2023-08-16 07:15:29');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 07:16:14', '2023-08-16 07:16:14');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/auth/menu', 'POST', '172.17.0.1', '{\"parent_id\":\"9\",\"title\":\"school\",\"icon\":\"fa-bars\",\"uri\":\"school\",\"roles\":[null],\"permission\":\"*\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\"}', '2023-08-16 07:16:30', '2023-08-16 07:16:30');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 07:16:31', '2023-08-16 07:16:31');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/school', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 07:24:08', '2023-08-16 07:24:08');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 07:24:23', '2023-08-16 07:24:23');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-16 07:24:29', '2023-08-16 07:24:29');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/school', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 07:24:34', '2023-08-16 07:24:34');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/school/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 07:24:41', '2023-08-16 07:24:41');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/school', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-16 07:24:51', '2023-08-16 07:24:51');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/school', 'GET', '172.17.0.1', '[]', '2023-08-16 07:30:03', '2023-08-16 07:30:03');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/school', 'GET', '172.17.0.1', '[]', '2023-08-16 07:31:41', '2023-08-16 07:31:41');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/school', 'GET', '172.17.0.1', '[]', '2023-08-16 07:32:01', '2023-08-16 07:32:01');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/school', 'GET', '172.17.0.1', '[]', '2023-08-16 07:32:03', '2023-08-16 07:32:03');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/school', 'GET', '172.17.0.1', '[]', '2023-08-16 07:32:23', '2023-08-16 07:32:23');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/school/1', 'PUT', '172.17.0.1', '{\"name\":\"status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2023-08-16 07:32:30', '2023-08-16 07:32:30');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/school/1', 'PUT', '172.17.0.1', '{\"name\":\"status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2023-08-16 07:32:41', '2023-08-16 07:32:41');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/school', 'GET', '172.17.0.1', '[]', '2023-08-16 07:38:14', '2023-08-16 07:38:14');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/school', 'GET', '172.17.0.1', '[]', '2023-08-16 07:44:28', '2023-08-16 07:44:28');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/school/2', 'PUT', '172.17.0.1', '{\"name\":\"status\",\"value\":\"2\",\"pk\":\"2\",\"_token\":\"u5jiyCXTcMqc3Hiiev1qkcdDlomZTXyy8XK9WJWx\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2023-08-16 07:44:37', '2023-08-16 07:44:37');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/school', 'GET', '172.17.0.1', '[]', '2023-08-16 18:27:19', '2023-08-16 18:27:19');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/school', 'GET', '172.17.0.1', '[]', '2023-08-17 10:51:27', '2023-08-17 10:51:27');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/auth/permissions', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:29:23', '2023-08-17 16:29:23');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/auth/roles', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:29:31', '2023-08-17 16:29:31');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/auth/roles/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:29:38', '2023-08-17 16:29:38');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:31:40', '2023-08-17 16:31:40');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:31:46', '2023-08-17 16:31:46');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:31:55', '2023-08-17 16:31:55');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/auth/menu/11/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:31:58', '2023-08-17 16:31:58');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/auth/menu/11', 'PUT', '172.17.0.1', '{\"parent_id\":\"9\",\"title\":\"role\",\"icon\":\"fa-bars\",\"uri\":\"role\",\"roles\":[null],\"permission\":\"*\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/menu\"}', '2023-08-17 16:32:05', '2023-08-17 16:32:05');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-17 16:32:06', '2023-08-17 16:32:06');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/auth/menu', 'POST', '172.17.0.1', '{\"parent_id\":\"9\",\"title\":\"permission\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":\"*\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\"}', '2023-08-17 16:32:38', '2023-08-17 16:32:38');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-17 16:32:39', '2023-08-17 16:32:39');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/auth/menu/13/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:34:34', '2023-08-17 16:34:34');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/auth/menu/13', 'PUT', '172.17.0.1', '{\"parent_id\":\"9\",\"title\":\"permission\",\"icon\":\"fa-bars\",\"uri\":\"permission\",\"roles\":[null],\"permission\":\"*\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/menu\"}', '2023-08-17 16:34:43', '2023-08-17 16:34:43');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-17 16:34:44', '2023-08-17 16:34:44');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/permission', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:34:46', '2023-08-17 16:34:46');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-17 16:35:13', '2023-08-17 16:35:13');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/permission', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:35:17', '2023-08-17 16:35:17');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:36:36', '2023-08-17 16:36:36');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/permission', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:37:04', '2023-08-17 16:37:04');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/permission/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:37:09', '2023-08-17 16:37:09');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/permission', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:37:20', '2023-08-17 16:37:20');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:37:23', '2023-08-17 16:37:23');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/student/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:37:25', '2023-08-17 16:37:25');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:37:29', '2023-08-17 16:37:29');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/school', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:37:31', '2023-08-17 16:37:31');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/school/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:37:33', '2023-08-17 16:37:33');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/school', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:37:36', '2023-08-17 16:37:36');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/permission', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:38:15', '2023-08-17 16:38:15');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:38:17', '2023-08-17 16:38:17');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.teacher.create_school\",\"guard_name\":\"teacher\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-17 16:38:42', '2023-08-17 16:38:42');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-17 16:38:43', '2023-08-17 16:38:43');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:38:50', '2023-08-17 16:38:50');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.teacher.invite\",\"guard_name\":\"teacher\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-17 16:38:59', '2023-08-17 16:38:59');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-17 16:39:00', '2023-08-17 16:39:00');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:39:06', '2023-08-17 16:39:06');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.teacher.school_list\",\"guard_name\":\"teacher\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-17 16:39:12', '2023-08-17 16:39:12');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-17 16:39:13', '2023-08-17 16:39:13');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:39:20', '2023-08-17 16:39:20');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.teacher.create_student\",\"guard_name\":\"teacher\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-17 16:39:29', '2023-08-17 16:39:29');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-17 16:39:30', '2023-08-17 16:39:30');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:39:37', '2023-08-17 16:39:37');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.teacher.student_list\",\"guard_name\":\"teacher\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-17 16:39:43', '2023-08-17 16:39:43');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-17 16:39:44', '2023-08-17 16:39:44');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:39:49', '2023-08-17 16:39:49');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.teacher.watched_student\",\"guard_name\":\"teacher\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-17 16:39:54', '2023-08-17 16:39:54');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-17 16:39:55', '2023-08-17 16:39:55');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:40:10', '2023-08-17 16:40:10');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.student.info\",\"guard_name\":\"student\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-17 16:40:16', '2023-08-17 16:40:16');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-17 16:40:17', '2023-08-17 16:40:17');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:40:22', '2023-08-17 16:40:22');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.student.teacher_list\",\"guard_name\":\"student\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-17 16:40:27', '2023-08-17 16:40:27');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-17 16:40:28', '2023-08-17 16:40:28');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:40:33', '2023-08-17 16:40:33');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.student.watch_teacher\",\"guard_name\":\"student\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-17 16:40:38', '2023-08-17 16:40:38');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-17 16:40:39', '2023-08-17 16:40:39');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:40:44', '2023-08-17 16:40:44');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.student.unwatch_teacher\",\"guard_name\":\"student\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-17 16:40:50', '2023-08-17 16:40:50');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-17 16:40:51', '2023-08-17 16:40:51');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:40:56', '2023-08-17 16:40:56');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.student.watch_teacher_list\",\"guard_name\":\"student\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-17 16:41:02', '2023-08-17 16:41:02');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-17 16:41:03', '2023-08-17 16:41:03');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:42:59', '2023-08-17 16:42:59');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:47:31', '2023-08-17 16:47:31');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:49:01', '2023-08-17 16:49:01');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:49:04', '2023-08-17 16:49:04');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:49:29', '2023-08-17 16:49:29');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:49:32', '2023-08-17 16:49:32');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:49:37', '2023-08-17 16:49:37');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-17 16:49:39', '2023-08-17 16:49:39');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:49:42', '2023-08-17 16:49:42');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 16:53:56', '2023-08-17 16:53:56');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 16:54:24', '2023-08-17 16:54:24');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:54:47', '2023-08-17 16:54:47');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 16:54:51', '2023-08-17 16:54:51');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 16:58:16', '2023-08-17 16:58:16');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-17 17:00:07', '2023-08-17 17:00:07');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:00:11', '2023-08-17 17:00:11');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/role/1', 'PUT', '172.17.0.1', '{\"name\":\"\\u6559\\u5e08\\u7ba1\\u7406\\u5458\",\"guard_name\":\"teacher\",\"permission\":[\"4\",\"6\",\"9\",null],\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-17 17:00:15', '2023-08-17 17:00:15');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:01:04', '2023-08-17 17:01:04');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:01:07', '2023-08-17 17:01:07');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:01:16', '2023-08-17 17:01:16');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:02:07', '2023-08-17 17:02:07');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:02:31', '2023-08-17 17:02:31');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:02:34', '2023-08-17 17:02:34');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:02:59', '2023-08-17 17:02:59');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:03:20', '2023-08-17 17:03:20');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:03:22', '2023-08-17 17:03:22');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:04:49', '2023-08-17 17:04:49');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:05:04', '2023-08-17 17:05:04');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:05:10', '2023-08-17 17:05:10');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:05:52', '2023-08-17 17:05:52');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:06:32', '2023-08-17 17:06:32');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:07:08', '2023-08-17 17:07:08');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/role/1', 'PUT', '172.17.0.1', '{\"name\":\"\\u6559\\u5e08\\u7ba1\\u7406\\u5458\",\"guard_name\":\"teacher\",\"permission\":[\"5\",\"8\",null],\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\"}', '2023-08-17 17:07:19', '2023-08-17 17:07:19');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:07:23', '2023-08-17 17:07:23');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:10:08', '2023-08-17 17:10:08');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:10:11', '2023-08-17 17:10:11');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:12:19', '2023-08-17 17:12:19');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:12:55', '2023-08-17 17:12:55');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:13:47', '2023-08-17 17:13:47');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:14:01', '2023-08-17 17:14:01');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:14:03', '2023-08-17 17:14:03');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-17 17:23:33', '2023-08-17 17:23:33');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:23:37', '2023-08-17 17:23:37');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/role/1', 'PUT', '172.17.0.1', '{\"name\":\"\\u6559\\u5e08\\u7ba1\\u7406\\u5458\",\"guard_name\":\"teacher\",\"permission\":[\"8\",\"9\",null],\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-17 17:23:41', '2023-08-17 17:23:41');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/role/1', 'GET', '172.17.0.1', '[]', '2023-08-17 17:24:28', '2023-08-17 17:24:28');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:24:38', '2023-08-17 17:24:38');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:24:39', '2023-08-17 17:24:39');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:24:43', '2023-08-17 17:24:43');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/role/1', 'PUT', '172.17.0.1', '{\"name\":\"\\u6559\\u5e08\\u7ba1\\u7406\\u5458\",\"guard_name\":\"teacher\",\"permission\":[\"6\",null],\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-17 17:24:47', '2023-08-17 17:24:47');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:25:36', '2023-08-17 17:25:36');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:25:41', '2023-08-17 17:25:41');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:25:44', '2023-08-17 17:25:44');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/role/1', 'PUT', '172.17.0.1', '{\"name\":\"\\u6559\\u5e08\\u7ba1\\u7406\\u5458\",\"guard_name\":\"teacher\",\"permission\":[\"3\",\"7\",null],\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-17 17:25:48', '2023-08-17 17:25:48');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:28:09', '2023-08-17 17:28:09');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:28:13', '2023-08-17 17:28:13');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:28:46', '2023-08-17 17:28:46');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:28:49', '2023-08-17 17:28:49');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:29:52', '2023-08-17 17:29:52');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:30:49', '2023-08-17 17:30:49');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:31:00', '2023-08-17 17:31:00');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:33:02', '2023-08-17 17:33:02');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:35:23', '2023-08-17 17:35:23');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:37:29', '2023-08-17 17:37:29');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:37:44', '2023-08-17 17:37:44');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:39:02', '2023-08-17 17:39:02');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '[]', '2023-08-17 17:39:55', '2023-08-17 17:39:55');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/role/1', 'PUT', '172.17.0.1', '{\"name\":\"\\u6559\\u5e08\\u7ba1\\u7406\\u5458\",\"guard_name\":\"teacher\",\"permissions\":[\"1\",\"2\",\"5\",null],\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\"}', '2023-08-17 17:40:04', '2023-08-17 17:40:04');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-17 17:40:05', '2023-08-17 17:40:05');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:40:26', '2023-08-17 17:40:26');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/role/1', 'PUT', '172.17.0.1', '{\"name\":\"\\u6559\\u5e08\\u7ba1\\u7406\\u5458\",\"guard_name\":\"teacher\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",null],\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-17 17:40:42', '2023-08-17 17:40:42');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-17 17:40:43', '2023-08-17 17:40:43');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/role/2/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:40:50', '2023-08-17 17:40:50');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/role/2', 'PUT', '172.17.0.1', '{\"name\":\"\\u6559\\u5e08\",\"guard_name\":\"teacher\",\"permissions\":[\"2\",\"5\",\"7\",\"8\",null],\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-17 17:41:26', '2023-08-17 17:41:26');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-17 17:41:27', '2023-08-17 17:41:27');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/role/3/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:41:32', '2023-08-17 17:41:32');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/role/3', 'PUT', '172.17.0.1', '{\"name\":\"\\u5b66\\u751f\",\"guard_name\":\"student\",\"permissions\":[\"9\",\"10\",\"11\",\"12\",\"13\",null],\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-17 17:41:41', '2023-08-17 17:41:41');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-17 17:41:42', '2023-08-17 17:41:42');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/role/2', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:41:46', '2023-08-17 17:41:46');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:41:51', '2023-08-17 17:41:51');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/auth/roles', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:42:39', '2023-08-17 17:42:39');
INSERT INTO `admin_operation_log` VALUES (307, 1, 'admin/auth/roles/1', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:42:44', '2023-08-17 17:42:44');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:42:58', '2023-08-17 17:42:58');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:45:01', '2023-08-17 17:45:01');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/teacher/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:45:05', '2023-08-17 17:45:05');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:45:08', '2023-08-17 17:45:08');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/teacher/3/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:47:37', '2023-08-17 17:47:37');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:47:42', '2023-08-17 17:47:42');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:47:46', '2023-08-17 17:47:46');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/auth/users/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:47:49', '2023-08-17 17:47:49');
INSERT INTO `admin_operation_log` VALUES (316, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:48:00', '2023-08-17 17:48:00');
INSERT INTO `admin_operation_log` VALUES (317, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:48:27', '2023-08-17 17:48:27');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:56:12', '2023-08-17 17:56:12');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:58:46', '2023-08-17 17:58:46');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:59:20', '2023-08-17 17:59:20');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 17:59:45', '2023-08-17 17:59:45');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:00:44', '2023-08-17 18:00:44');
INSERT INTO `admin_operation_log` VALUES (323, 1, 'admin/auth/users/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:00:47', '2023-08-17 18:00:47');
INSERT INTO `admin_operation_log` VALUES (324, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:00:55', '2023-08-17 18:00:55');
INSERT INTO `admin_operation_log` VALUES (325, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:02:41', '2023-08-17 18:02:41');
INSERT INTO `admin_operation_log` VALUES (326, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:02:43', '2023-08-17 18:02:43');
INSERT INTO `admin_operation_log` VALUES (327, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:02:44', '2023-08-17 18:02:44');
INSERT INTO `admin_operation_log` VALUES (328, 1, 'admin/student/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:04:37', '2023-08-17 18:04:37');
INSERT INTO `admin_operation_log` VALUES (329, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:04:41', '2023-08-17 18:04:41');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/student/1', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:04:44', '2023-08-17 18:04:44');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/student/1', 'GET', '172.17.0.1', '[]', '2023-08-17 18:05:04', '2023-08-17 18:05:04');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:05:14', '2023-08-17 18:05:14');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/student/2', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:05:19', '2023-08-17 18:05:19');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:05:23', '2023-08-17 18:05:23');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'admin/student/2/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:05:29', '2023-08-17 18:05:29');
INSERT INTO `admin_operation_log` VALUES (336, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:06:20', '2023-08-17 18:06:20');
INSERT INTO `admin_operation_log` VALUES (337, 1, 'admin/student/2/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:06:23', '2023-08-17 18:06:23');
INSERT INTO `admin_operation_log` VALUES (338, 1, 'admin/student/2', 'PUT', '172.17.0.1', '{\"roles\":[\"3\",null],\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/student\"}', '2023-08-17 18:06:29', '2023-08-17 18:06:29');
INSERT INTO `admin_operation_log` VALUES (339, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-17 18:06:29', '2023-08-17 18:06:29');
INSERT INTO `admin_operation_log` VALUES (340, 1, 'admin/student/3/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:06:52', '2023-08-17 18:06:52');
INSERT INTO `admin_operation_log` VALUES (341, 1, 'admin/student/3', 'PUT', '172.17.0.1', '{\"roles\":\"3\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/student\"}', '2023-08-17 18:06:57', '2023-08-17 18:06:57');
INSERT INTO `admin_operation_log` VALUES (342, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-17 18:06:58', '2023-08-17 18:06:58');
INSERT INTO `admin_operation_log` VALUES (343, 1, 'admin/student/4/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:07:28', '2023-08-17 18:07:28');
INSERT INTO `admin_operation_log` VALUES (344, 1, 'admin/student/4', 'PUT', '172.17.0.1', '{\"roles\":\"3\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/student\"}', '2023-08-17 18:07:33', '2023-08-17 18:07:33');
INSERT INTO `admin_operation_log` VALUES (345, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-17 18:07:34', '2023-08-17 18:07:34');
INSERT INTO `admin_operation_log` VALUES (346, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:07:36', '2023-08-17 18:07:36');
INSERT INTO `admin_operation_log` VALUES (347, 1, 'admin/teacher/3/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-17 18:07:40', '2023-08-17 18:07:40');
INSERT INTO `admin_operation_log` VALUES (348, 1, 'admin/teacher/3', 'PUT', '172.17.0.1', '{\"roles\":\"2\",\"_token\":\"pCARU9itn0OW04A5FqdgiGHtmWziecC1szvIzrss\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/teacher\"}', '2023-08-17 18:07:44', '2023-08-17 18:07:44');
INSERT INTO `admin_operation_log` VALUES (349, 1, 'admin/teacher', 'GET', '172.17.0.1', '[]', '2023-08-17 18:07:45', '2023-08-17 18:07:45');
INSERT INTO `admin_operation_log` VALUES (350, 1, 'admin/teacher', 'GET', '172.17.0.1', '[]', '2023-08-18 09:19:49', '2023-08-18 09:19:49');
INSERT INTO `admin_operation_log` VALUES (351, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"_key\":\"7\",\"_model\":\"App_Models_Teacher\",\"_token\":\"XvpGRe81D1uRoo1gqd2iVfRzB6yxSczrDXmOlW9I\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-08-18 09:20:03', '2023-08-18 09:20:03');
INSERT INTO `admin_operation_log` VALUES (352, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-18 09:20:04', '2023-08-18 09:20:04');
INSERT INTO `admin_operation_log` VALUES (353, 1, 'admin/teacher/5/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-18 09:20:11', '2023-08-18 09:20:11');
INSERT INTO `admin_operation_log` VALUES (354, 1, 'admin/teacher/5', 'PUT', '172.17.0.1', '{\"roles\":\"2\",\"_token\":\"XvpGRe81D1uRoo1gqd2iVfRzB6yxSczrDXmOlW9I\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/teacher\"}', '2023-08-18 09:20:17', '2023-08-18 09:20:17');
INSERT INTO `admin_operation_log` VALUES (355, 1, 'admin/teacher', 'GET', '172.17.0.1', '[]', '2023-08-18 09:20:18', '2023-08-18 09:20:18');
INSERT INTO `admin_operation_log` VALUES (356, 1, 'admin/teacher/6/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-18 09:20:23', '2023-08-18 09:20:23');
INSERT INTO `admin_operation_log` VALUES (357, 1, 'admin/teacher/6', 'PUT', '172.17.0.1', '{\"roles\":\"2\",\"_token\":\"XvpGRe81D1uRoo1gqd2iVfRzB6yxSczrDXmOlW9I\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/teacher\"}', '2023-08-18 09:20:28', '2023-08-18 09:20:28');
INSERT INTO `admin_operation_log` VALUES (358, 1, 'admin/teacher', 'GET', '172.17.0.1', '[]', '2023-08-18 09:20:29', '2023-08-18 09:20:29');
INSERT INTO `admin_operation_log` VALUES (359, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-18 09:20:35', '2023-08-18 09:20:35');
INSERT INTO `admin_operation_log` VALUES (360, 1, 'admin/student/5/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-18 09:20:39', '2023-08-18 09:20:39');
INSERT INTO `admin_operation_log` VALUES (361, 1, 'admin/student/5', 'PUT', '172.17.0.1', '{\"roles\":\"3\",\"_token\":\"XvpGRe81D1uRoo1gqd2iVfRzB6yxSczrDXmOlW9I\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/student\"}', '2023-08-18 09:20:44', '2023-08-18 09:20:44');
INSERT INTO `admin_operation_log` VALUES (362, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-18 09:20:45', '2023-08-18 09:20:45');
INSERT INTO `admin_operation_log` VALUES (363, 1, 'admin', 'GET', '172.17.0.1', '[]', '2023-08-21 17:46:35', '2023-08-21 17:46:35');
INSERT INTO `admin_operation_log` VALUES (364, 1, 'admin/school', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-21 17:46:41', '2023-08-21 17:46:41');
INSERT INTO `admin_operation_log` VALUES (365, 1, 'admin/school/4', 'PUT', '172.17.0.1', '{\"name\":\"status\",\"value\":\"2\",\"pk\":\"4\",\"_token\":\"yrc8rhxOBYjYboYrRvemrkZznG6m3ov8ZcwkRXHD\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2023-08-21 17:46:56', '2023-08-21 17:46:56');
INSERT INTO `admin_operation_log` VALUES (366, 1, 'admin', 'GET', '172.17.0.1', '[]', '2023-08-24 11:34:38', '2023-08-24 11:34:38');
INSERT INTO `admin_operation_log` VALUES (367, 1, 'admin/permission', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:34:47', '2023-08-24 11:34:47');
INSERT INTO `admin_operation_log` VALUES (368, 1, 'admin/school', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:34:50', '2023-08-24 11:34:50');
INSERT INTO `admin_operation_log` VALUES (369, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:34:55', '2023-08-24 11:34:55');
INSERT INTO `admin_operation_log` VALUES (370, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:44:02', '2023-08-24 11:44:02');
INSERT INTO `admin_operation_log` VALUES (371, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:44:04', '2023-08-24 11:44:04');
INSERT INTO `admin_operation_log` VALUES (372, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:45:16', '2023-08-24 11:45:16');
INSERT INTO `admin_operation_log` VALUES (373, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:45:18', '2023-08-24 11:45:18');
INSERT INTO `admin_operation_log` VALUES (374, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:49:20', '2023-08-24 11:49:20');
INSERT INTO `admin_operation_log` VALUES (375, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:49:45', '2023-08-24 11:49:45');
INSERT INTO `admin_operation_log` VALUES (376, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:49:58', '2023-08-24 11:49:58');
INSERT INTO `admin_operation_log` VALUES (377, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:52:33', '2023-08-24 11:52:33');
INSERT INTO `admin_operation_log` VALUES (378, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"rrrr\",\"_model\":\"App_Models_Student\",\"_key\":\"25102\",\"_token\":\"bCLbb74XM1cB56glAjfAxbYGQD2OZenl5PQqswHE\",\"_action\":\"App_Admin_Actions_Post_ReportPost\"}', '2023-08-24 11:52:45', '2023-08-24 11:52:45');
INSERT INTO `admin_operation_log` VALUES (379, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"rrrr\",\"_model\":\"App_Models_Student\",\"_key\":\"25102\",\"_token\":\"bCLbb74XM1cB56glAjfAxbYGQD2OZenl5PQqswHE\",\"_action\":\"App_Admin_Actions_Post_ReportPost\"}', '2023-08-24 11:52:56', '2023-08-24 11:52:56');
INSERT INTO `admin_operation_log` VALUES (380, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"rrrr\",\"_model\":\"App_Models_Student\",\"_key\":\"25102\",\"_token\":\"bCLbb74XM1cB56glAjfAxbYGQD2OZenl5PQqswHE\",\"_action\":\"App_Admin_Actions_Post_ReportPost\"}', '2023-08-24 11:53:29', '2023-08-24 11:53:29');
INSERT INTO `admin_operation_log` VALUES (381, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:55:01', '2023-08-24 11:55:01');
INSERT INTO `admin_operation_log` VALUES (382, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:55:15', '2023-08-24 11:55:15');
INSERT INTO `admin_operation_log` VALUES (383, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"tfe\",\"_model\":\"App_Models_Student\",\"_key\":\"25102\",\"_token\":\"bCLbb74XM1cB56glAjfAxbYGQD2OZenl5PQqswHE\",\"_action\":\"App_Admin_Actions_Post_ReportPost\"}', '2023-08-24 11:55:20', '2023-08-24 11:55:20');
INSERT INTO `admin_operation_log` VALUES (384, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:55:34', '2023-08-24 11:55:34');
INSERT INTO `admin_operation_log` VALUES (385, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:55:56', '2023-08-24 11:55:56');
INSERT INTO `admin_operation_log` VALUES (386, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"uiu\",\"_model\":\"App_Models_Student\",\"_key\":\"25102\",\"_token\":\"bCLbb74XM1cB56glAjfAxbYGQD2OZenl5PQqswHE\",\"_action\":\"App_Admin_Actions_Post_ReportPost\"}', '2023-08-24 11:56:00', '2023-08-24 11:56:00');
INSERT INTO `admin_operation_log` VALUES (387, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:57:00', '2023-08-24 11:57:00');
INSERT INTO `admin_operation_log` VALUES (388, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 11:57:04', '2023-08-24 11:57:04');
INSERT INTO `admin_operation_log` VALUES (389, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 14:35:21', '2023-08-24 14:35:21');
INSERT INTO `admin_operation_log` VALUES (390, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 14:35:55', '2023-08-24 14:35:55');
INSERT INTO `admin_operation_log` VALUES (391, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 14:36:15', '2023-08-24 14:36:15');
INSERT INTO `admin_operation_log` VALUES (392, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 14:40:05', '2023-08-24 14:40:05');
INSERT INTO `admin_operation_log` VALUES (393, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-24 14:44:54', '2023-08-24 14:44:54');
INSERT INTO `admin_operation_log` VALUES (394, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"uu\",\"_token\":\"YvZdIERl79ixZl3ti48ytGBqukj25SC8BVsTyFao\",\"_action\":\"App_Admin_Actions_Post_ReportPost\"}', '2023-08-24 14:45:03', '2023-08-24 14:45:03');
INSERT INTO `admin_operation_log` VALUES (395, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 14:45:04', '2023-08-24 14:45:04');
INSERT INTO `admin_operation_log` VALUES (396, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-24 14:47:24', '2023-08-24 14:47:24');
INSERT INTO `admin_operation_log` VALUES (397, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-24 14:48:03', '2023-08-24 14:48:03');
INSERT INTO `admin_operation_log` VALUES (398, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-24 14:48:08', '2023-08-24 14:48:08');
INSERT INTO `admin_operation_log` VALUES (399, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"hh\",\"_token\":\"YvZdIERl79ixZl3ti48ytGBqukj25SC8BVsTyFao\",\"_action\":\"App_Admin_Actions_Post_StudentMessage\"}', '2023-08-24 14:48:14', '2023-08-24 14:48:14');
INSERT INTO `admin_operation_log` VALUES (400, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 14:48:15', '2023-08-24 14:48:15');
INSERT INTO `admin_operation_log` VALUES (401, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 14:52:14', '2023-08-24 14:52:14');
INSERT INTO `admin_operation_log` VALUES (402, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"sss\",\"_token\":\"YvZdIERl79ixZl3ti48ytGBqukj25SC8BVsTyFao\",\"_action\":\"App_Admin_Actions_Post_StudentMessage\"}', '2023-08-24 14:52:21', '2023-08-24 14:52:21');
INSERT INTO `admin_operation_log` VALUES (403, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 14:52:22', '2023-08-24 14:52:22');
INSERT INTO `admin_operation_log` VALUES (404, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-24 14:52:31', '2023-08-24 14:52:31');
INSERT INTO `admin_operation_log` VALUES (405, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"sss\",\"_token\":\"YvZdIERl79ixZl3ti48ytGBqukj25SC8BVsTyFao\",\"_action\":\"App_Admin_Actions_Post_StudentMessage\"}', '2023-08-24 14:52:38', '2023-08-24 14:52:38');
INSERT INTO `admin_operation_log` VALUES (406, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 14:52:39', '2023-08-24 14:52:39');
INSERT INTO `admin_operation_log` VALUES (407, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-24 15:02:45', '2023-08-24 15:02:45');
INSERT INTO `admin_operation_log` VALUES (408, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"asas\",\"_token\":\"YvZdIERl79ixZl3ti48ytGBqukj25SC8BVsTyFao\",\"_action\":\"App_Admin_Actions_Post_StudentMessage\"}', '2023-08-24 15:02:55', '2023-08-24 15:02:55');
INSERT INTO `admin_operation_log` VALUES (409, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 15:02:56', '2023-08-24 15:02:56');
INSERT INTO `admin_operation_log` VALUES (410, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-24 15:08:56', '2023-08-24 15:08:56');
INSERT INTO `admin_operation_log` VALUES (411, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"qqqq\",\"_token\":\"YvZdIERl79ixZl3ti48ytGBqukj25SC8BVsTyFao\",\"_action\":\"App_Admin_Actions_Post_StudentMessage\"}', '2023-08-24 15:09:03', '2023-08-24 15:09:03');
INSERT INTO `admin_operation_log` VALUES (412, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 15:09:04', '2023-08-24 15:09:04');
INSERT INTO `admin_operation_log` VALUES (413, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"asas\",\"_token\":\"YvZdIERl79ixZl3ti48ytGBqukj25SC8BVsTyFao\",\"_action\":\"App_Admin_Actions_Post_StudentMessage\"}', '2023-08-24 15:10:02', '2023-08-24 15:10:02');
INSERT INTO `admin_operation_log` VALUES (414, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 15:10:03', '2023-08-24 15:10:03');
INSERT INTO `admin_operation_log` VALUES (415, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 15:11:16', '2023-08-24 15:11:16');
INSERT INTO `admin_operation_log` VALUES (416, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"qqqq\",\"_token\":\"YvZdIERl79ixZl3ti48ytGBqukj25SC8BVsTyFao\",\"_action\":\"App_Admin_Actions_Post_TeacherMessage\"}', '2023-08-24 15:11:21', '2023-08-24 15:11:21');
INSERT INTO `admin_operation_log` VALUES (417, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 15:11:22', '2023-08-24 15:11:22');
INSERT INTO `admin_operation_log` VALUES (418, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"asdf\",\"_token\":\"YvZdIERl79ixZl3ti48ytGBqukj25SC8BVsTyFao\",\"_action\":\"App_Admin_Actions_Post_TeacherMessage\"}', '2023-08-24 15:11:41', '2023-08-24 15:11:41');
INSERT INTO `admin_operation_log` VALUES (419, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 15:11:42', '2023-08-24 15:11:42');
INSERT INTO `admin_operation_log` VALUES (420, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"uuu\",\"_token\":\"YvZdIERl79ixZl3ti48ytGBqukj25SC8BVsTyFao\",\"_action\":\"App_Admin_Actions_Post_TeacherMessage\"}', '2023-08-24 15:14:45', '2023-08-24 15:14:45');
INSERT INTO `admin_operation_log` VALUES (421, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 15:14:46', '2023-08-24 15:14:46');
INSERT INTO `admin_operation_log` VALUES (422, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"zzz\",\"_token\":\"YvZdIERl79ixZl3ti48ytGBqukj25SC8BVsTyFao\",\"_action\":\"App_Admin_Actions_Post_TeacherMessage\"}', '2023-08-24 15:15:15', '2023-08-24 15:15:15');
INSERT INTO `admin_operation_log` VALUES (423, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 15:15:16', '2023-08-24 15:15:16');
INSERT INTO `admin_operation_log` VALUES (424, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 15:16:21', '2023-08-24 15:16:21');
INSERT INTO `admin_operation_log` VALUES (425, 1, 'admin/_handle_action_', 'POST', '172.17.0.1', '{\"message\":\"zzz\",\"_token\":\"YvZdIERl79ixZl3ti48ytGBqukj25SC8BVsTyFao\",\"_action\":\"App_Admin_Actions_Post_StudentMessage\"}', '2023-08-24 15:16:25', '2023-08-24 15:16:25');
INSERT INTO `admin_operation_log` VALUES (426, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 15:16:26', '2023-08-24 15:16:26');
INSERT INTO `admin_operation_log` VALUES (427, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 17:24:29', '2023-08-24 17:24:29');
INSERT INTO `admin_operation_log` VALUES (428, 1, 'admin/role/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 17:24:33', '2023-08-24 17:24:33');
INSERT INTO `admin_operation_log` VALUES (429, 1, 'admin/role', 'POST', '172.17.0.1', '{\"name\":\"Line\",\"guard_name\":\"line\",\"permissions\":[null],\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-24 17:25:06', '2023-08-24 17:25:06');
INSERT INTO `admin_operation_log` VALUES (430, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-24 17:25:07', '2023-08-24 17:25:07');
INSERT INTO `admin_operation_log` VALUES (431, 1, 'admin/role/5/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 17:27:13', '2023-08-24 17:27:13');
INSERT INTO `admin_operation_log` VALUES (432, 1, 'admin/role/5', 'PUT', '172.17.0.1', '{\"name\":\"line\",\"guard_name\":\"line\",\"permissions\":[null],\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-24 17:27:18', '2023-08-24 17:27:18');
INSERT INTO `admin_operation_log` VALUES (433, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-24 17:27:19', '2023-08-24 17:27:19');
INSERT INTO `admin_operation_log` VALUES (434, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 17:27:22', '2023-08-24 17:27:22');
INSERT INTO `admin_operation_log` VALUES (435, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 17:27:26', '2023-08-24 17:27:26');
INSERT INTO `admin_operation_log` VALUES (436, 1, 'admin/auth/menu/8', 'PUT', '172.17.0.1', '{\"parent_id\":\"9\",\"title\":\"student\",\"icon\":\"fa-500px\",\"uri\":\"student\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/auth\\/menu\"}', '2023-08-24 17:27:32', '2023-08-24 17:27:32');
INSERT INTO `admin_operation_log` VALUES (437, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-24 17:27:33', '2023-08-24 17:27:33');
INSERT INTO `admin_operation_log` VALUES (438, 1, 'admin/permission', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:01:56', '2023-08-24 18:01:56');
INSERT INTO `admin_operation_log` VALUES (439, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:02:22', '2023-08-24 18:02:22');
INSERT INTO `admin_operation_log` VALUES (440, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.teacher.wk_bind\",\"guard_name\":\"teacher\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-24 18:02:30', '2023-08-24 18:02:30');
INSERT INTO `admin_operation_log` VALUES (441, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-24 18:02:31', '2023-08-24 18:02:31');
INSERT INTO `admin_operation_log` VALUES (442, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:02:36', '2023-08-24 18:02:36');
INSERT INTO `admin_operation_log` VALUES (443, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.teacher.send_meg_to_student\",\"guard_name\":\"teacher\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-24 18:02:44', '2023-08-24 18:02:44');
INSERT INTO `admin_operation_log` VALUES (444, 1, 'admin/permission/create', 'GET', '172.17.0.1', '[]', '2023-08-24 18:02:45', '2023-08-24 18:02:45');
INSERT INTO `admin_operation_log` VALUES (445, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.teacher.get_history_message\",\"guard_name\":\"teacher\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\"}', '2023-08-24 18:02:55', '2023-08-24 18:02:55');
INSERT INTO `admin_operation_log` VALUES (446, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-24 18:02:56', '2023-08-24 18:02:56');
INSERT INTO `admin_operation_log` VALUES (447, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:03:02', '2023-08-24 18:03:02');
INSERT INTO `admin_operation_log` VALUES (448, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.teacher.get_message_user\",\"guard_name\":\"teacher\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-24 18:03:09', '2023-08-24 18:03:09');
INSERT INTO `admin_operation_log` VALUES (449, 1, 'admin/permission/create', 'GET', '172.17.0.1', '[]', '2023-08-24 18:03:11', '2023-08-24 18:03:11');
INSERT INTO `admin_operation_log` VALUES (450, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.student.wk_bind\",\"guard_name\":\"student\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"after-save\":\"2\"}', '2023-08-24 18:03:22', '2023-08-24 18:03:22');
INSERT INTO `admin_operation_log` VALUES (451, 1, 'admin/permission/create', 'GET', '172.17.0.1', '[]', '2023-08-24 18:03:23', '2023-08-24 18:03:23');
INSERT INTO `admin_operation_log` VALUES (452, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.student.send_meg_to_teacher\",\"guard_name\":\"student\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\"}', '2023-08-24 18:03:30', '2023-08-24 18:03:30');
INSERT INTO `admin_operation_log` VALUES (453, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-24 18:03:31', '2023-08-24 18:03:31');
INSERT INTO `admin_operation_log` VALUES (454, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:03:33', '2023-08-24 18:03:33');
INSERT INTO `admin_operation_log` VALUES (455, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.student.get_history_message\",\"guard_name\":\"student\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-24 18:03:42', '2023-08-24 18:03:42');
INSERT INTO `admin_operation_log` VALUES (456, 1, 'admin/permission/create', 'GET', '172.17.0.1', '[]', '2023-08-24 18:03:43', '2023-08-24 18:03:43');
INSERT INTO `admin_operation_log` VALUES (457, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.student.get_message_user\",\"guard_name\":\"student\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\"}', '2023-08-24 18:03:50', '2023-08-24 18:03:50');
INSERT INTO `admin_operation_log` VALUES (458, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-24 18:03:51', '2023-08-24 18:03:51');
INSERT INTO `admin_operation_log` VALUES (459, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:03:57', '2023-08-24 18:03:57');
INSERT INTO `admin_operation_log` VALUES (460, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.line.bind_student\",\"guard_name\":\"line\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-24 18:04:04', '2023-08-24 18:04:04');
INSERT INTO `admin_operation_log` VALUES (461, 1, 'admin/permission/create', 'GET', '172.17.0.1', '[]', '2023-08-24 18:04:05', '2023-08-24 18:04:05');
INSERT INTO `admin_operation_log` VALUES (462, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.line.bind_teacher\",\"guard_name\":\"line\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"after-save\":\"2\"}', '2023-08-24 18:04:12', '2023-08-24 18:04:12');
INSERT INTO `admin_operation_log` VALUES (463, 1, 'admin/permission/create', 'GET', '172.17.0.1', '[]', '2023-08-24 18:04:13', '2023-08-24 18:04:13');
INSERT INTO `admin_operation_log` VALUES (464, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.line.student_list\",\"guard_name\":\"line\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"after-save\":\"2\"}', '2023-08-24 18:04:20', '2023-08-24 18:04:20');
INSERT INTO `admin_operation_log` VALUES (465, 1, 'admin/permission/create', 'GET', '172.17.0.1', '[]', '2023-08-24 18:04:22', '2023-08-24 18:04:22');
INSERT INTO `admin_operation_log` VALUES (466, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.line.teacher_list\",\"guard_name\":\"line\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\"}', '2023-08-24 18:04:28', '2023-08-24 18:04:28');
INSERT INTO `admin_operation_log` VALUES (467, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-24 18:04:29', '2023-08-24 18:04:29');
INSERT INTO `admin_operation_log` VALUES (468, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:04:43', '2023-08-24 18:04:43');
INSERT INTO `admin_operation_log` VALUES (469, 1, 'admin/role/5/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:04:54', '2023-08-24 18:04:54');
INSERT INTO `admin_operation_log` VALUES (470, 1, 'admin/role/5', 'PUT', '172.17.0.1', '{\"name\":\"line\",\"guard_name\":\"line\",\"permissions\":[\"22\",\"23\",\"24\",\"25\",null],\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-24 18:05:17', '2023-08-24 18:05:17');
INSERT INTO `admin_operation_log` VALUES (471, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-24 18:05:18', '2023-08-24 18:05:18');
INSERT INTO `admin_operation_log` VALUES (472, 1, 'admin/role/3/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:05:22', '2023-08-24 18:05:22');
INSERT INTO `admin_operation_log` VALUES (473, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:06:34', '2023-08-24 18:06:34');
INSERT INTO `admin_operation_log` VALUES (474, 1, 'admin/role/3/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:06:37', '2023-08-24 18:06:37');
INSERT INTO `admin_operation_log` VALUES (475, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:06:48', '2023-08-24 18:06:48');
INSERT INTO `admin_operation_log` VALUES (476, 1, 'admin/role/3/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:06:52', '2023-08-24 18:06:52');
INSERT INTO `admin_operation_log` VALUES (477, 1, 'admin/role/3', 'PUT', '172.17.0.1', '{\"name\":\"\\u5b66\\u751f\",\"guard_name\":\"student\",\"permissions\":[\"9\",\"10\",\"11\",\"12\",\"13\",\"18\",\"19\",\"20\",\"21\",null],\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-24 18:07:03', '2023-08-24 18:07:03');
INSERT INTO `admin_operation_log` VALUES (478, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-24 18:07:04', '2023-08-24 18:07:04');
INSERT INTO `admin_operation_log` VALUES (479, 1, 'admin/role/2/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:07:07', '2023-08-24 18:07:07');
INSERT INTO `admin_operation_log` VALUES (480, 1, 'admin/role/2', 'PUT', '172.17.0.1', '{\"name\":\"\\u6559\\u5e08\",\"guard_name\":\"teacher\",\"permissions\":[\"2\",\"5\",\"7\",\"8\",\"14\",\"15\",\"16\",\"17\",null],\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-24 18:07:33', '2023-08-24 18:07:33');
INSERT INTO `admin_operation_log` VALUES (481, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-24 18:07:34', '2023-08-24 18:07:34');
INSERT INTO `admin_operation_log` VALUES (482, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:07:37', '2023-08-24 18:07:37');
INSERT INTO `admin_operation_log` VALUES (483, 1, 'admin/role/1', 'PUT', '172.17.0.1', '{\"name\":\"\\u6559\\u5e08\\u7ba1\\u7406\\u5458\",\"guard_name\":\"teacher\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"14\",\"15\",\"16\",\"17\",null],\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-24 18:08:10', '2023-08-24 18:08:10');
INSERT INTO `admin_operation_log` VALUES (484, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-24 18:08:11', '2023-08-24 18:08:11');
INSERT INTO `admin_operation_log` VALUES (485, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:12:45', '2023-08-24 18:12:45');
INSERT INTO `admin_operation_log` VALUES (486, 1, 'admin/auth/menu', 'POST', '172.17.0.1', '{\"parent_id\":\"9\",\"title\":\"line\",\"icon\":\"fa-bars\",\"uri\":\"line\",\"roles\":[null],\"permission\":null,\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\"}', '2023-08-24 18:13:08', '2023-08-24 18:13:08');
INSERT INTO `admin_operation_log` VALUES (487, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '[]', '2023-08-24 18:13:09', '2023-08-24 18:13:09');
INSERT INTO `admin_operation_log` VALUES (488, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:13:12', '2023-08-24 18:13:12');
INSERT INTO `admin_operation_log` VALUES (489, 1, 'admin/auth/menu/8/edit', 'GET', '172.17.0.1', '[]', '2023-08-24 18:13:19', '2023-08-24 18:13:19');
INSERT INTO `admin_operation_log` VALUES (490, 1, 'admin/line', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:14:22', '2023-08-24 18:14:22');
INSERT INTO `admin_operation_log` VALUES (491, 1, 'admin/auth/menu', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:18:35', '2023-08-24 18:18:35');
INSERT INTO `admin_operation_log` VALUES (492, 1, 'admin/permission', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:18:39', '2023-08-24 18:18:39');
INSERT INTO `admin_operation_log` VALUES (493, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:18:42', '2023-08-24 18:18:42');
INSERT INTO `admin_operation_log` VALUES (494, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.line.wk_bind\",\"guard_name\":\"line\",\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-24 18:18:47', '2023-08-24 18:18:47');
INSERT INTO `admin_operation_log` VALUES (495, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-24 18:18:48', '2023-08-24 18:18:48');
INSERT INTO `admin_operation_log` VALUES (496, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:18:51', '2023-08-24 18:18:51');
INSERT INTO `admin_operation_log` VALUES (497, 1, 'admin/role/5/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-24 18:18:55', '2023-08-24 18:18:55');
INSERT INTO `admin_operation_log` VALUES (498, 1, 'admin/role/5/edit', 'GET', '172.17.0.1', '[]', '2023-08-24 18:19:45', '2023-08-24 18:19:45');
INSERT INTO `admin_operation_log` VALUES (499, 1, 'admin/role/5', 'PUT', '172.17.0.1', '{\"name\":\"line\",\"guard_name\":\"line\",\"permissions\":[\"22\",\"23\",\"24\",\"25\",\"26\",null],\"_token\":\"pAuur97dsZaNwLhrZ21xPCKpqOJyAsEkXbdXNUf0\",\"_method\":\"PUT\"}', '2023-08-24 18:19:50', '2023-08-24 18:19:50');
INSERT INTO `admin_operation_log` VALUES (500, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-24 18:19:51', '2023-08-24 18:19:51');
INSERT INTO `admin_operation_log` VALUES (501, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-25 14:07:28', '2023-08-25 14:07:28');
INSERT INTO `admin_operation_log` VALUES (502, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:08:04', '2023-08-25 14:08:04');
INSERT INTO `admin_operation_log` VALUES (503, 1, 'admin/teacher/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:08:16', '2023-08-25 14:08:16');
INSERT INTO `admin_operation_log` VALUES (504, 1, 'admin/auth/roles', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:11:41', '2023-08-25 14:11:41');
INSERT INTO `admin_operation_log` VALUES (505, 1, 'admin/auth/users', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:11:42', '2023-08-25 14:11:42');
INSERT INTO `admin_operation_log` VALUES (506, 1, 'admin/auth/users/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:11:46', '2023-08-25 14:11:46');
INSERT INTO `admin_operation_log` VALUES (507, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:13:44', '2023-08-25 14:13:44');
INSERT INTO `admin_operation_log` VALUES (508, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:13:48', '2023-08-25 14:13:48');
INSERT INTO `admin_operation_log` VALUES (509, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:13:52', '2023-08-25 14:13:52');
INSERT INTO `admin_operation_log` VALUES (510, 1, 'admin/student/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:13:56', '2023-08-25 14:13:56');
INSERT INTO `admin_operation_log` VALUES (511, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:14:04', '2023-08-25 14:14:04');
INSERT INTO `admin_operation_log` VALUES (512, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:14:14', '2023-08-25 14:14:14');
INSERT INTO `admin_operation_log` VALUES (513, 1, 'admin/student/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:14:17', '2023-08-25 14:14:17');
INSERT INTO `admin_operation_log` VALUES (514, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:16:31', '2023-08-25 14:16:31');
INSERT INTO `admin_operation_log` VALUES (515, 1, 'admin/student/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:16:35', '2023-08-25 14:16:35');
INSERT INTO `admin_operation_log` VALUES (516, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:17:00', '2023-08-25 14:17:00');
INSERT INTO `admin_operation_log` VALUES (517, 1, 'admin/teacher/2/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:17:06', '2023-08-25 14:17:06');
INSERT INTO `admin_operation_log` VALUES (518, 1, 'admin/teacher/2/edit', 'GET', '172.17.0.1', '[]', '2023-08-25 14:17:27', '2023-08-25 14:17:27');
INSERT INTO `admin_operation_log` VALUES (519, 1, 'admin/teacher/2', 'PUT', '172.17.0.1', '{\"roles\":[\"1\",null],\"_token\":\"cjSB0tX83BFYpD6zrJRb0wlNPMP1CMi8qvjcGdWS\",\"_method\":\"PUT\"}', '2023-08-25 14:17:37', '2023-08-25 14:17:37');
INSERT INTO `admin_operation_log` VALUES (520, 1, 'admin/teacher', 'GET', '172.17.0.1', '[]', '2023-08-25 14:17:38', '2023-08-25 14:17:38');
INSERT INTO `admin_operation_log` VALUES (521, 1, 'admin/school', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 14:18:58', '2023-08-25 14:18:58');
INSERT INTO `admin_operation_log` VALUES (522, 1, 'admin/school/5', 'PUT', '172.17.0.1', '{\"name\":\"status\",\"value\":\"3\",\"pk\":\"5\",\"_token\":\"cjSB0tX83BFYpD6zrJRb0wlNPMP1CMi8qvjcGdWS\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2023-08-25 14:19:08', '2023-08-25 14:19:08');
INSERT INTO `admin_operation_log` VALUES (523, 1, 'admin', 'GET', '172.17.0.1', '[]', '2023-08-28 10:56:14', '2023-08-28 10:56:14');
INSERT INTO `admin_operation_log` VALUES (524, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:56:19', '2023-08-28 10:56:19');
INSERT INTO `admin_operation_log` VALUES (525, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:56:26', '2023-08-28 10:56:26');
INSERT INTO `admin_operation_log` VALUES (526, 1, 'admin/school', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:56:49', '2023-08-28 10:56:49');
INSERT INTO `admin_operation_log` VALUES (527, 1, 'admin/permission', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:57:03', '2023-08-28 10:57:03');
INSERT INTO `admin_operation_log` VALUES (528, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:57:08', '2023-08-28 10:57:08');
INSERT INTO `admin_operation_log` VALUES (529, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:57:13', '2023-08-28 10:57:13');
INSERT INTO `admin_operation_log` VALUES (530, 1, 'admin/permission', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:57:55', '2023-08-28 10:57:55');
INSERT INTO `admin_operation_log` VALUES (531, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:57:58', '2023-08-28 10:57:58');
INSERT INTO `admin_operation_log` VALUES (532, 1, 'admin/permission', 'POST', '172.17.0.1', '{\"name\":\"api.teacher.school_teacher_list\",\"guard_name\":\"teacher\",\"_token\":\"FY1YU2vbxjGavXuTtlMYLx6ASdgyvJY34tjxMsmJ\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/permission\"}', '2023-08-28 10:58:13', '2023-08-28 10:58:13');
INSERT INTO `admin_operation_log` VALUES (533, 1, 'admin/permission', 'GET', '172.17.0.1', '[]', '2023-08-28 10:58:14', '2023-08-28 10:58:14');
INSERT INTO `admin_operation_log` VALUES (534, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:58:18', '2023-08-28 10:58:18');
INSERT INTO `admin_operation_log` VALUES (535, 1, 'admin/role/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:58:21', '2023-08-28 10:58:21');
INSERT INTO `admin_operation_log` VALUES (536, 1, 'admin/role/1', 'PUT', '172.17.0.1', '{\"name\":\"\\u6559\\u5e08\\u7ba1\\u7406\\u5458\",\"guard_name\":\"teacher\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"14\",\"15\",\"16\",\"17\",\"27\",null],\"_token\":\"FY1YU2vbxjGavXuTtlMYLx6ASdgyvJY34tjxMsmJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/role\"}', '2023-08-28 10:58:26', '2023-08-28 10:58:26');
INSERT INTO `admin_operation_log` VALUES (537, 1, 'admin/role', 'GET', '172.17.0.1', '[]', '2023-08-28 10:58:27', '2023-08-28 10:58:27');
INSERT INTO `admin_operation_log` VALUES (538, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:09:22', '2023-08-28 11:09:22');
INSERT INTO `admin_operation_log` VALUES (539, 1, 'admin/teacher/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:09:24', '2023-08-28 11:09:24');
INSERT INTO `admin_operation_log` VALUES (540, 1, 'admin/teacher/create', 'GET', '172.17.0.1', '[]', '2023-08-28 11:09:46', '2023-08-28 11:09:46');
INSERT INTO `admin_operation_log` VALUES (541, 1, 'admin/line', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:09:57', '2023-08-28 11:09:57');
INSERT INTO `admin_operation_log` VALUES (542, 1, 'admin/line/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:10:03', '2023-08-28 11:10:03');
INSERT INTO `admin_operation_log` VALUES (543, 1, 'admin/line/create', 'GET', '172.17.0.1', '[]', '2023-08-28 11:10:12', '2023-08-28 11:10:12');
INSERT INTO `admin_operation_log` VALUES (544, 1, 'admin/role', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:10:23', '2023-08-28 11:10:23');
INSERT INTO `admin_operation_log` VALUES (545, 1, 'admin/role/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:10:26', '2023-08-28 11:10:26');
INSERT INTO `admin_operation_log` VALUES (546, 1, 'admin/permission', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:10:31', '2023-08-28 11:10:31');
INSERT INTO `admin_operation_log` VALUES (547, 1, 'admin/permission/create', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:10:35', '2023-08-28 11:10:35');
INSERT INTO `admin_operation_log` VALUES (548, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:11:50', '2023-08-28 11:11:50');
INSERT INTO `admin_operation_log` VALUES (549, 1, 'admin/student/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:12:09', '2023-08-28 11:12:09');
INSERT INTO `admin_operation_log` VALUES (550, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:12:57', '2023-08-28 11:12:57');
INSERT INTO `admin_operation_log` VALUES (551, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:13:19', '2023-08-28 11:13:19');
INSERT INTO `admin_operation_log` VALUES (552, 1, 'admin/school', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:13:44', '2023-08-28 11:13:44');
INSERT INTO `admin_operation_log` VALUES (553, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:13:47', '2023-08-28 11:13:47');
INSERT INTO `admin_operation_log` VALUES (554, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:14:01', '2023-08-28 11:14:01');
INSERT INTO `admin_operation_log` VALUES (555, 1, 'admin/student/1/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:14:11', '2023-08-28 11:14:11');
INSERT INTO `admin_operation_log` VALUES (556, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:14:21', '2023-08-28 11:14:21');
INSERT INTO `admin_operation_log` VALUES (557, 1, 'admin/student/6/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:14:24', '2023-08-28 11:14:24');
INSERT INTO `admin_operation_log` VALUES (558, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:15:49', '2023-08-28 11:15:49');
INSERT INTO `admin_operation_log` VALUES (559, 1, 'admin/student/6/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:15:52', '2023-08-28 11:15:52');
INSERT INTO `admin_operation_log` VALUES (560, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:16:00', '2023-08-28 11:16:00');
INSERT INTO `admin_operation_log` VALUES (561, 1, 'admin/student/6/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:16:24', '2023-08-28 11:16:24');
INSERT INTO `admin_operation_log` VALUES (562, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:16:28', '2023-08-28 11:16:28');
INSERT INTO `admin_operation_log` VALUES (563, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-28 11:16:30', '2023-08-28 11:16:30');
INSERT INTO `admin_operation_log` VALUES (564, 1, 'admin/student/6/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:17:27', '2023-08-28 11:17:27');
INSERT INTO `admin_operation_log` VALUES (565, 1, 'admin/student/6', 'PUT', '172.17.0.1', '{\"roles\":[\"3\",null],\"_token\":\"FY1YU2vbxjGavXuTtlMYLx6ASdgyvJY34tjxMsmJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/student\"}', '2023-08-28 11:17:32', '2023-08-28 11:17:32');
INSERT INTO `admin_operation_log` VALUES (566, 1, 'admin/student', 'GET', '172.17.0.1', '[]', '2023-08-28 11:17:33', '2023-08-28 11:17:33');
INSERT INTO `admin_operation_log` VALUES (567, 1, 'admin/student/6/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:17:36', '2023-08-28 11:17:36');
INSERT INTO `admin_operation_log` VALUES (568, 1, 'admin/permission', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:18:54', '2023-08-28 11:18:54');
INSERT INTO `admin_operation_log` VALUES (569, 1, 'admin/permission/3/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:18:57', '2023-08-28 11:18:57');
INSERT INTO `admin_operation_log` VALUES (570, 1, 'admin/student', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:19:38', '2023-08-28 11:19:38');
INSERT INTO `admin_operation_log` VALUES (571, 1, 'admin/student/6/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:19:43', '2023-08-28 11:19:43');
INSERT INTO `admin_operation_log` VALUES (572, 1, 'admin/teacher', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:20:16', '2023-08-28 11:20:16');
INSERT INTO `admin_operation_log` VALUES (573, 1, 'admin/teacher/9/edit', 'GET', '172.17.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:20:21', '2023-08-28 11:20:21');
INSERT INTO `admin_operation_log` VALUES (574, 1, 'admin/teacher/9', 'PUT', '172.17.0.1', '{\"name\":\"teacher4\",\"email\":\"teacher4@qq.com\",\"roles\":[\"1\",null],\"_token\":\"FY1YU2vbxjGavXuTtlMYLx6ASdgyvJY34tjxMsmJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/local.class.com:8080\\/admin\\/teacher\"}', '2023-08-28 11:20:28', '2023-08-28 11:20:28');
INSERT INTO `admin_operation_log` VALUES (575, 1, 'admin/teacher', 'GET', '172.17.0.1', '[]', '2023-08-28 11:20:29', '2023-08-28 11:20:29');
COMMIT;

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 8, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
BEGIN;
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2023-08-15 06:48:00', '2023-08-15 06:48:00');
INSERT INTO `admin_roles` VALUES (2, 'teacher_leader', 'teacher_leader', '2023-08-16 03:31:31', '2023-08-16 03:31:31');
COMMIT;

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$aL9Rkm9/SSR2jt/d2bdIJefPbhR7D/uGgEgHkxEiKj7nvZHkXbnGq', 'Administrator', NULL, 'jYvkIehbXG4P0MazsuqcRv0jnwK5VSreNcVBNZihANRWovjvZhUMopTk1zIJ', '2023-08-15 06:48:00', '2023-08-15 06:48:00');
COMMIT;

-- ----------------------------
-- Table structure for line_binds
-- ----------------------------
DROP TABLE IF EXISTS `line_binds`;
CREATE TABLE `line_binds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `line_id` int NOT NULL DEFAULT '0',
  `bind_id` int NOT NULL DEFAULT '0' COMMENT '学生或教师id',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '1-学生,2-教师',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of line_binds
-- ----------------------------
BEGIN;
INSERT INTO `line_binds` VALUES (1, 1, 1, 1, '2023-08-24 17:55:13', '2023-08-24 17:55:13');
INSERT INTO `line_binds` VALUES (2, 1, 2, 2, '2023-08-24 17:57:57', '2023-08-24 17:57:57');
COMMIT;

-- ----------------------------
-- Table structure for line_users
-- ----------------------------
DROP TABLE IF EXISTS `line_users`;
CREATE TABLE `line_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `line_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `line_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of line_users
-- ----------------------------
BEGIN;
INSERT INTO `line_users` VALUES (1, 1, 'xiao', '', '365054037@qq.com', '2023-08-24 17:52:57', '2023-08-24 17:52:57');
COMMIT;

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from` int NOT NULL DEFAULT '0' COMMENT '发送者id',
  `to` int NOT NULL DEFAULT '0' COMMENT '接收者id',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '类型1-聊天，2-推送',
  `message_type` tinyint NOT NULL DEFAULT '0' COMMENT '消息方式1-学生->老师，2-老师->学生',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息内容',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of messages
-- ----------------------------
BEGIN;
INSERT INTO `messages` VALUES (1, 1, 1, 1, 2, '123456', '2023-08-23 14:19:18', '2023-08-23 14:19:18');
INSERT INTO `messages` VALUES (2, 1, 1, 1, 1, '654321', '2023-08-23 14:21:25', '2023-08-23 14:21:25');
INSERT INTO `messages` VALUES (3, 1, 1, 1, 1, 'haha', '2023-08-23 14:21:33', '2023-08-23 14:21:33');
INSERT INTO `messages` VALUES (4, 1, 2, 1, 1, 'wewe', '2023-08-23 14:23:59', '2023-08-23 14:23:59');
INSERT INTO `messages` VALUES (5, 0, 1, 2, 0, 'rttt', '2023-08-23 16:35:03', '2023-08-23 16:35:06');
INSERT INTO `messages` VALUES (6, 1, 3, 1, 2, '123456', '2023-08-23 17:03:11', '2023-08-23 17:03:11');
INSERT INTO `messages` VALUES (10, 1, 2, 1, 2, '333', '2023-08-23 17:20:50', '2023-08-23 17:20:50');
INSERT INTO `messages` VALUES (11, 1, 2, 1, 2, 'rr', '2023-08-23 17:23:07', '2023-08-23 17:23:07');
INSERT INTO `messages` VALUES (12, 1, 1, 1, 1, '654321', '2023-08-23 17:28:14', '2023-08-23 17:28:14');
INSERT INTO `messages` VALUES (13, 1, 1, 1, 1, '654321', '2023-08-23 17:35:04', '2023-08-23 17:35:04');
INSERT INTO `messages` VALUES (14, 1, 1, 1, 1, '654321', '2023-08-23 17:36:46', '2023-08-23 17:36:46');
INSERT INTO `messages` VALUES (15, 1, 2, 1, 2, 'eeee', '2023-08-23 17:38:14', '2023-08-23 17:38:14');
INSERT INTO `messages` VALUES (16, 1, 1, 1, 1, '654321', '2023-08-23 17:38:21', '2023-08-23 17:38:21');
INSERT INTO `messages` VALUES (17, 1, 1, 1, 1, '654321', '2023-08-23 17:38:42', '2023-08-23 17:38:42');
INSERT INTO `messages` VALUES (18, 1, 1, 1, 1, '654321', '2023-08-23 17:39:10', '2023-08-23 17:39:10');
INSERT INTO `messages` VALUES (19, 1, 1, 1, 1, '654321', '2023-08-23 17:39:55', '2023-08-23 17:39:55');
INSERT INTO `messages` VALUES (20, 1, 1, 1, 1, '654321', '2023-08-23 17:41:03', '2023-08-23 17:41:03');
INSERT INTO `messages` VALUES (21, 1, 1, 1, 1, '654321', '2023-08-23 17:42:49', '2023-08-23 17:42:49');
INSERT INTO `messages` VALUES (22, 1, 1, 1, 2, '11', '2023-08-23 17:43:40', '2023-08-23 17:43:40');
INSERT INTO `messages` VALUES (23, 1, 1, 1, 1, '654321', '2023-08-23 17:43:48', '2023-08-23 17:43:48');
INSERT INTO `messages` VALUES (24, 1, 1, 1, 1, '654321', '2023-08-23 17:45:31', '2023-08-23 17:45:31');
INSERT INTO `messages` VALUES (25, 1, 1, 1, 1, '65432', '2023-08-23 17:45:40', '2023-08-23 17:45:40');
INSERT INTO `messages` VALUES (26, 1, 1, 1, 1, 'ertrtrt', '2023-08-23 17:58:55', '2023-08-23 17:58:55');
INSERT INTO `messages` VALUES (27, 1, 1, 1, 2, 'rrrr', '2023-08-23 17:59:03', '2023-08-23 17:59:03');
INSERT INTO `messages` VALUES (28, 1, 1, 1, 1, 'ccc', '2023-08-23 17:59:08', '2023-08-23 17:59:08');
INSERT INTO `messages` VALUES (31, 1, 1, 1, 1, 'ee', '2023-08-24 11:05:49', '2023-08-24 11:05:49');
INSERT INTO `messages` VALUES (32, 1, 1, 1, 1, 'qwqw', '2023-08-24 11:06:00', '2023-08-24 11:06:00');
INSERT INTO `messages` VALUES (33, 1, 1, 1, 1, 'www', '2023-08-24 11:15:43', '2023-08-24 11:15:43');
INSERT INTO `messages` VALUES (36, 0, 1, 2, 2, 'asas', '2023-08-24 15:10:02', '2023-08-24 15:10:02');
INSERT INTO `messages` VALUES (37, 0, 1, 2, 2, 'qqqq', '2023-08-24 15:11:22', '2023-08-24 15:11:22');
INSERT INTO `messages` VALUES (38, 0, 1, 2, 2, 'asdf', '2023-08-24 15:11:41', '2023-08-24 15:11:41');
INSERT INTO `messages` VALUES (39, 0, 1, 2, 2, 'uuu', '2023-08-24 15:14:45', '2023-08-24 15:14:45');
INSERT INTO `messages` VALUES (40, 0, 1, 2, 2, 'zzz', '2023-08-24 15:15:15', '2023-08-24 15:15:15');
INSERT INTO `messages` VALUES (41, 0, 1, 2, 2, 'zzz', '2023-08-24 15:16:25', '2023-08-24 15:16:25');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2016_06_01_000001_create_oauth_auth_codes_table', 2);
INSERT INTO `migrations` VALUES (5, '2016_06_01_000002_create_oauth_access_tokens_table', 2);
INSERT INTO `migrations` VALUES (6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2);
INSERT INTO `migrations` VALUES (7, '2016_06_01_000004_create_oauth_clients_table', 2);
INSERT INTO `migrations` VALUES (8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);
INSERT INTO `migrations` VALUES (9, '2023_08_15_074053_create_students_table', 3);
INSERT INTO `migrations` VALUES (10, '2023_08_15_074128_create_teachers_table', 3);
INSERT INTO `migrations` VALUES (11, '2023_08_16_030018_create_permission_tables', 4);
INSERT INTO `migrations` VALUES (13, '2023_08_16_065404_create_schools_table', 5);
INSERT INTO `migrations` VALUES (14, '2023_08_16_075146_create_school_teachers_table', 6);
INSERT INTO `migrations` VALUES (15, '2023_08_17_143040_create_school_students_table', 7);
INSERT INTO `migrations` VALUES (16, '2023_08_17_153442_create_student_watch_teachers_table', 8);
INSERT INTO `migrations` VALUES (17, '2023_08_23_140340_create_messages_table', 9);
INSERT INTO `migrations` VALUES (18, '2023_08_24_161836_create_line_users_table', 10);
INSERT INTO `migrations` VALUES (19, '2023_08_24_172926_create_line_binds_table', 11);
COMMIT;

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------
BEGIN;
INSERT INTO `model_has_permissions` VALUES (2, 'App\\Models\\Teacher', 1);
COMMIT;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` int unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
BEGIN;
INSERT INTO `model_has_roles` VALUES (5, 'App\\Models\\LineUser', 1);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\Student', 1);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\Teacher', 1);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\Student', 2);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\Teacher', 2);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\Student', 3);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\Teacher', 3);
COMMIT;

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `client_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
BEGIN;
INSERT INTO `oauth_access_tokens` VALUES ('0810e07c0e63596699563bc9c3ea91463cf632260e38dcacacd41680706a07e041d11b47664e913d', 2, 1, 'teacher2', '[]', 0, '2023-08-25 14:17:49', '2023-08-25 14:17:49', '2024-08-25 14:17:49');
INSERT INTO `oauth_access_tokens` VALUES ('0a4729d91c3ea7f4647d4c206bc0f754c8ae64235971c7c13499675a1434124dc91c76743d6463e9', 1, 1, 'student1', '[]', 0, '2023-08-15 09:49:16', '2023-08-15 09:49:16', '2024-08-15 09:49:16');
INSERT INTO `oauth_access_tokens` VALUES ('0a9351aca973af9b05e68ba30a78b1d3118b5c7a7e49591101744bb9e5bed692f9180b7046217b8b', 1, 1, 'teacher1', '[]', 0, '2023-08-18 15:34:29', '2023-08-18 15:34:29', '2024-08-18 15:34:29');
INSERT INTO `oauth_access_tokens` VALUES ('17a9f3427e12e26b0cdabc7f4788fab34e28c4df0f2748bbc8784f3cc4b98bee01ca48543cb37d21', 1, 1, NULL, '[]', 0, '2023-08-15 08:42:58', '2023-08-15 08:42:58', '2024-08-15 08:42:58');
INSERT INTO `oauth_access_tokens` VALUES ('183ae3b0b73c10643b8b9a17a02b11a56b841713f62ef5cf3ea377e77c430f21935972bcd0fb6c29', 9, 1, 'teacher4', '[]', 0, '2023-08-28 11:05:11', '2023-08-28 11:05:11', '2024-08-28 11:05:11');
INSERT INTO `oauth_access_tokens` VALUES ('1a2e249a8d5d5f06fc613c6f2e23515b8b38165eefcdbd4904bfb4b3be9cb73bea6a22d0735933a3', 1, 1, 'student1', '[]', 0, '2023-08-21 14:31:16', '2023-08-21 14:31:16', '2024-08-21 14:31:16');
INSERT INTO `oauth_access_tokens` VALUES ('20a3e99e13f7444f9fb6bca57af933fb75ea2564b3ff0bdc35f33ff0ce0fba8450783611a59ac123', 1, 1, 'student1', '[]', 0, '2023-08-15 09:06:29', '2023-08-15 09:06:29', '2024-08-15 09:06:29');
INSERT INTO `oauth_access_tokens` VALUES ('2384c25777093818f5b2ca8e97b5311f87099adbb8ae23e9dbff211c1fc639ec08c4126a948ce62d', 1, 1, 'teacher1', '[]', 0, '2023-08-22 17:57:27', '2023-08-22 17:57:27', '2024-08-22 17:57:27');
INSERT INTO `oauth_access_tokens` VALUES ('2c63dcac16e9ec1c21f861490fec2b2ea838399ee4fda79c80d0da1ae20231820c4cef0badd9a32b', 1, 1, 'student1', '[]', 0, '2023-08-18 16:37:31', '2023-08-18 16:37:31', '2024-08-18 16:37:31');
INSERT INTO `oauth_access_tokens` VALUES ('2d426a0ab068bcb1c4a332daef17b6c91b5ba43c07d4543a8c82ddf0c3d1371d8edeb8fc98d48bdc', 1, 1, NULL, '[]', 0, '2023-08-15 08:44:52', '2023-08-15 08:44:52', '2024-08-15 08:44:52');
INSERT INTO `oauth_access_tokens` VALUES ('32f970710c93a17c809a96943e937e1ca02367d227f8b15579489e413f57390238e4ed516dec9bca', 1, 1, 'student1', '[]', 0, '2023-08-15 09:17:25', '2023-08-15 09:17:25', '2024-08-15 09:17:25');
INSERT INTO `oauth_access_tokens` VALUES ('33d921fc3d213a05891b3fec5846904228e1076fbd286106917ba6cadece7a7d1eb8a1d29bf6431a', 1, 1, 'student1', '[]', 0, '2023-08-21 14:47:40', '2023-08-21 14:47:40', '2024-08-21 14:47:40');
INSERT INTO `oauth_access_tokens` VALUES ('3740fa3ac2a248f98c700314969df9c3cf1762bbbfa5455ec3a03f93258a44ea9357457011551def', 1, 1, 'student1', '[]', 0, '2023-08-25 16:27:38', '2023-08-25 16:27:38', '2024-08-25 16:27:38');
INSERT INTO `oauth_access_tokens` VALUES ('3765c6fde54c428d14f964d39bae2cb4880335a4c575560c6aac6de5a510d6167d1a78cac214cfa5', 1, 1, 'teacher1', '[]', 0, '2023-08-18 15:35:03', '2023-08-18 15:35:03', '2024-08-18 15:35:03');
INSERT INTO `oauth_access_tokens` VALUES ('424284392b3ba63f66e67fcb7a66c12b6a540ca37d8b0f2015252fccf4ad0b2394cddcab0c9f089d', 1, 1, 'teacher1', '[]', 0, '2023-08-21 16:05:43', '2023-08-21 16:05:43', '2024-08-21 16:05:43');
INSERT INTO `oauth_access_tokens` VALUES ('461335ebbc2360e5a28311e92c395da863c8eb8507299811fc554eb1b65f0ebd543e1f17f72bc34b', 1, 1, 'teacher1', '[]', 0, '2023-08-22 17:59:36', '2023-08-22 17:59:36', '2024-08-22 17:59:36');
INSERT INTO `oauth_access_tokens` VALUES ('4ed486343830487b19ce35d96090f09ce9521bcdb452506657cf83b34bbc280a21a0dc4240bfcfb1', 1, 1, 'student1', '[]', 0, '2023-08-25 11:32:57', '2023-08-25 11:32:57', '2024-08-25 11:32:57');
INSERT INTO `oauth_access_tokens` VALUES ('5ef60f8980e3e0c1352289902e83f3c78205c165ce4ffbbac56b76618b3f68fb08dc7c0e32c6c55c', 1, 1, 'student1', '[]', 0, '2023-08-21 14:47:04', '2023-08-21 14:47:04', '2024-08-21 14:47:04');
INSERT INTO `oauth_access_tokens` VALUES ('5f79e9501ea08f2b5a38d8ef29bd0f4b4a82ccc4e31ea49467f3cdb8bc25305da36c6a5ae7f80835', 1, 1, NULL, '[]', 0, '2023-08-15 08:39:46', '2023-08-15 08:39:46', '2024-08-15 08:39:46');
INSERT INTO `oauth_access_tokens` VALUES ('649c1d41fed604cb0893ab3f39b218b3952c6560585dc80cbd79a9abf100d10954ef476e49133768', 1, 1, 'teacher1', '[]', 0, '2023-08-21 16:52:37', '2023-08-21 16:52:37', '2024-08-21 16:52:37');
INSERT INTO `oauth_access_tokens` VALUES ('6a44ec8e7f0279ccb8026e23e91eba5248273c466bdade11509ad849ba9f73fb2b89e88e0de22f72', 1, 1, 'student1', '[]', 0, '2023-08-15 08:48:33', '2023-08-15 08:48:33', '2024-08-15 08:48:33');
INSERT INTO `oauth_access_tokens` VALUES ('6e5fafe4caea7f2a9665037e158155e43062dddb3152330e70d01b45c1b6aaebab04d43c2f25dda4', 1, 1, 'student1', '[]', 0, '2023-08-23 17:53:20', '2023-08-23 17:53:20', '2024-08-23 17:53:20');
INSERT INTO `oauth_access_tokens` VALUES ('6ecce8144fee7ec5bd6c1caf641eff6a3fc2f51ffdd1bd83e7282e68b3404f633c0f6f9caa4d2430', 1, 1, 'student1', '[]', 0, '2023-08-21 17:48:23', '2023-08-21 17:48:23', '2024-08-21 17:48:23');
INSERT INTO `oauth_access_tokens` VALUES ('720076c139134b11d1141c34de8bb890b36f5401b9111cda30851670ca2575b8b4bd4f4f5a91f691', 2, 1, 'teacher2', '[]', 0, '2023-08-21 16:50:59', '2023-08-21 16:50:59', '2024-08-21 16:50:59');
INSERT INTO `oauth_access_tokens` VALUES ('7d5725b8682433005bd6e6e2553feb1e686e74adc7b2bfc259d0e236ffd4c1ca5daa8231f05a90fa', 1, 1, 'teacher1', '[]', 0, '2023-08-24 09:59:15', '2023-08-24 09:59:15', '2024-08-24 09:59:15');
INSERT INTO `oauth_access_tokens` VALUES ('7f6ed70d0b7b24045ef84f8979743764e1af70c43436e9b964530b82e1dfb746ba51f982395a8413', 1, 1, 'student1', '[]', 0, '2023-08-15 08:48:56', '2023-08-15 08:48:56', '2024-08-15 08:48:56');
INSERT INTO `oauth_access_tokens` VALUES ('8167d1e47c74e0897f141d740a1d3e5c5d5e8a5f143c055c081957d795788608dec75cc17c7c73de', 1, 1, 'teacher1', '[]', 0, '2023-08-21 15:43:07', '2023-08-21 15:43:07', '2024-08-21 15:43:07');
INSERT INTO `oauth_access_tokens` VALUES ('88cb7ea83b386cfaf0dd0e8b608a10b9177522d09b0420b913f847022093f425a4ea18d2a572fd11', 1, 1, 'student1', '[]', 0, '2023-08-21 14:48:08', '2023-08-21 14:48:08', '2024-08-21 14:48:08');
INSERT INTO `oauth_access_tokens` VALUES ('916bbc1f810e56cabe5d4ef002ad7620da36991235aa1c250674770e9e6171502b84f64ee12bcf66', 1, 1, NULL, '[]', 0, '2023-08-15 08:40:56', '2023-08-15 08:40:56', '2024-08-15 08:40:56');
INSERT INTO `oauth_access_tokens` VALUES ('9685cec0076ae77a2e61621be89b3c6641d7b2b80d44b252fdca84086d045e7072b3e0bb11dc4fec', 1, 1, 'teacher1', '[]', 0, '2023-08-16 03:16:30', '2023-08-16 03:16:30', '2024-08-16 03:16:30');
INSERT INTO `oauth_access_tokens` VALUES ('995a704134b7f0b2d5ac6220d01e81179b6977deffe6d49a416262073e62479c22df1feeddde1e83', 1, 1, 'student1', '[]', 0, '2023-08-18 17:41:14', '2023-08-18 17:41:14', '2024-08-18 17:41:14');
INSERT INTO `oauth_access_tokens` VALUES ('9e42b031367d3f4a6ceba89eeddd9284a40064cd2d36be611eb273885507781d2ad989736901f924', 1, 1, 'teacher1', '[]', 0, '2023-08-22 18:00:26', '2023-08-22 18:00:26', '2024-08-22 18:00:26');
INSERT INTO `oauth_access_tokens` VALUES ('9ee7e94197fd1389ef38ce6802b181303d28daa8f4d5558035d957264144a4fe0c808d4c68a97af1', 1, 1, 'xiao', '[]', 0, '2023-08-24 17:53:23', '2023-08-24 17:53:23', '2024-08-24 17:53:23');
INSERT INTO `oauth_access_tokens` VALUES ('a36ec4a8813fab94a46f12e160444bbae72c4319e52b79330bea6b073b5ee0a8dddeb09954027744', 1, 1, 'teacher1', '[]', 0, '2023-08-22 17:41:19', '2023-08-22 17:41:19', '2024-08-22 17:41:19');
INSERT INTO `oauth_access_tokens` VALUES ('a60942e1ecfd3d4643718e8078528d40619c94a2adbea78a1ca31abee64f1dfd9a53c55544e08e05', 1, 1, 'student1', '[]', 0, '2023-08-18 16:46:51', '2023-08-18 16:46:51', '2024-08-18 16:46:51');
INSERT INTO `oauth_access_tokens` VALUES ('aa08bc6a89d02063344bf85b0ef46684cbe22d547a9468a73e2dd3b27505a04bcd54c9083fc0d14d', 1, 1, 'teacher1', '[]', 0, '2023-08-21 15:19:28', '2023-08-21 15:19:28', '2024-08-21 15:19:28');
INSERT INTO `oauth_access_tokens` VALUES ('aea5d9cb840d7eb35d69e909972eca99492f2f1e13583d1f9f2e5101166009cadc473cb81b074431', 1, 1, 'teacher1', '[]', 0, '2023-08-21 16:03:34', '2023-08-21 16:03:34', '2024-08-21 16:03:34');
INSERT INTO `oauth_access_tokens` VALUES ('aed520ffc4f8562ebcb67a3432ddfe5ae7a991a0948f118b83aec8280af35ad9d897e7eeb5c2c539', 1, 1, 'student1', '[]', 0, '2023-08-21 14:47:56', '2023-08-21 14:47:56', '2024-08-21 14:47:56');
INSERT INTO `oauth_access_tokens` VALUES ('b1d409db92a65bea0555f935b5572f3ec3d3a5d51d9da752ae0068b888e6a6e5d05c0a049c362f51', 1, 1, 'teacher1', '[]', 0, '2023-08-23 11:49:11', '2023-08-23 11:49:11', '2024-08-23 11:49:11');
INSERT INTO `oauth_access_tokens` VALUES ('b6110be9d8fb063454d66aba7fbf8273b4e125380564e516135b26f2883b68cc2edd1e42e4abb470', 1, 1, 'teacher1', '[]', 0, '2023-08-21 15:44:40', '2023-08-21 15:44:40', '2024-08-21 15:44:40');
INSERT INTO `oauth_access_tokens` VALUES ('b7546233a60e4c2df94d328ec453d49dfd423afbe078215e8d2c48c316e94c8ec4d89d57c62061ee', 1, 1, 'teacher1', '[]', 0, '2023-08-23 11:19:49', '2023-08-23 11:19:49', '2024-08-23 11:19:49');
INSERT INTO `oauth_access_tokens` VALUES ('b8dc392ddcd5bd863b4f853e31948b108f3def55b99a42ed455753e259a21745c8abc4a1db6e70ca', 10, 1, 'teacher', '[]', 0, '2023-08-28 10:55:12', '2023-08-28 10:55:12', '2024-08-28 10:55:12');
INSERT INTO `oauth_access_tokens` VALUES ('bc541245579ad5e1edcac66482add8eaa151c8f0803e12dad4a84b52e87534d7a0424ef1b74b3082', 1, 1, 'student1', '[]', 0, '2023-08-25 15:20:31', '2023-08-25 15:20:31', '2024-08-25 15:20:31');
INSERT INTO `oauth_access_tokens` VALUES ('bff595d9b944941885eb38391b6e675f5b05591b1fb109154afc5bf71f0a0013a8ceeca7788c5cd8', 1, 1, 'student1', '[]', 0, '2023-08-18 16:36:13', '2023-08-18 16:36:13', '2024-08-18 16:36:13');
INSERT INTO `oauth_access_tokens` VALUES ('c02495dedabad2a74e5adefed4a74883301385f669a17efbcdf6f4dcf5105a65fcff52922ade7b8e', 1, 1, 'teacher1', '[]', 0, '2023-08-22 10:08:49', '2023-08-22 10:08:49', '2024-08-22 10:08:49');
INSERT INTO `oauth_access_tokens` VALUES ('c40597846d55a4ab60b1bf0250796a3fe29fe7be35a16a7d0d17a244764d419b63be8b3365759bfc', 1, 1, 'student1', '[]', 0, '2023-08-15 08:49:45', '2023-08-15 08:49:45', '2024-08-15 08:49:45');
INSERT INTO `oauth_access_tokens` VALUES ('c9466dc856a6d71e252ce5dd189950f9907503451ccf238cbe25679210893956d24c5f1484f9232e', 1, 1, 'student1', '[]', 0, '2023-08-21 14:52:25', '2023-08-21 14:52:25', '2024-08-21 14:52:25');
INSERT INTO `oauth_access_tokens` VALUES ('cbaa143100e37ec3a1b2cbcad9040cad930f66bce8a79fde49cfeb60190416fcbb8d12bb29ed174e', 1, 1, 'teacher1', '[]', 0, '2023-08-23 16:15:08', '2023-08-23 16:15:08', '2024-08-23 16:15:08');
INSERT INTO `oauth_access_tokens` VALUES ('cc36efbd32a08bf660761cc84741580d66699f27f86a60aa8155ebeda7ee5b454a8acfa9605988e5', 1, 1, 'student1', '[]', 0, '2023-08-15 09:31:27', '2023-08-15 09:31:27', '2024-08-15 09:31:27');
INSERT INTO `oauth_access_tokens` VALUES ('d941e0c17f80ebf096fed0b1cde615180b0b29c11b72fd988bfc3982c753c2e2f6d6d8558699fe23', 1, 1, 'teacher1', '[]', 0, '2023-08-21 15:15:57', '2023-08-21 15:15:57', '2024-08-21 15:15:57');
INSERT INTO `oauth_access_tokens` VALUES ('d99e004c6995625a88fa1c0e647f88b962f15124c8cf6419f0b15581ec18274e51e697e281112cfe', 1, 1, 'teacher1', '[]', 0, '2023-08-21 16:10:59', '2023-08-21 16:10:59', '2024-08-21 16:10:59');
INSERT INTO `oauth_access_tokens` VALUES ('db15d204ac2c16cc731341780b7937dde10740ceec4ac55afacd9d85908dc99fab4f7404ad5399be', 1, 1, 'student1', '[]', 0, '2023-08-18 17:39:27', '2023-08-18 17:39:27', '2024-08-18 17:39:27');
INSERT INTO `oauth_access_tokens` VALUES ('df414ab4078e09c6977e51d5bdda5ca28331c39c57dc538045bce8bad366fa56cea497d35f8774a0', 10, 1, 'teacher', '[]', 0, '2023-08-28 11:05:33', '2023-08-28 11:05:33', '2024-08-28 11:05:33');
INSERT INTO `oauth_access_tokens` VALUES ('e35fcfe4d5aadf7d2d2877da7ff28eea1872a1be38e830498e8d5b2c4348e13af72ea0813807ac7a', 1, 1, 'teacher1', '[]', 0, '2023-08-21 16:02:27', '2023-08-21 16:02:27', '2024-08-21 16:02:27');
INSERT INTO `oauth_access_tokens` VALUES ('e456c810df542e2879c6bbdc2d8e973c07ff770f69f7ba1bbf2d2177f8600f29f6f183753ed4a629', 1, 1, 'teacher1', '[]', 0, '2023-08-22 17:06:31', '2023-08-22 17:06:31', '2024-08-22 17:06:31');
INSERT INTO `oauth_access_tokens` VALUES ('ef3d4a350d6f7e5cb033f800a33dc46bef29fe47a5da67513f9adb6b0c202cb6d2618ec9cc079723', 2, 1, 'teacher2', '[]', 0, '2023-08-25 14:18:36', '2023-08-25 14:18:36', '2024-08-25 14:18:36');
INSERT INTO `oauth_access_tokens` VALUES ('f002f7c341d6ab223418e254d8112216242bb3229cc518cc8351234bd8d5b81d5f545bc017c57c01', 9, 1, 'teacher4', '[]', 0, '2023-08-28 10:48:51', '2023-08-28 10:48:51', '2024-08-28 10:48:51');
INSERT INTO `oauth_access_tokens` VALUES ('f2785ad8b3b4a3902ac2c3b738045547157ef55b2d5360f1cb5761dfa5065dc1fe8f676c2a658485', 1, 1, 'student1', '[]', 0, '2023-08-24 11:05:30', '2023-08-24 11:05:30', '2024-08-24 11:05:30');
INSERT INTO `oauth_access_tokens` VALUES ('f28596df6cef8685af409362159d0e674bab9c1b22f77bbc4117cbf1d999f33c2e5026b04d1524ae', 1, 1, 'teacher1', '[]', 0, '2023-08-18 15:36:19', '2023-08-18 15:36:19', '2024-08-18 15:36:19');
INSERT INTO `oauth_access_tokens` VALUES ('fe6f566f61dba6898e72b73b9dbff610ef60018ecfdbb8f6c269b543842c12d3848212b95b8f8beb', 1, 1, 'teacher1', '[]', 0, '2023-08-23 16:56:28', '2023-08-23 16:56:28', '2024-08-23 16:56:28');
COMMIT;

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `client_id` int NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
BEGIN;
INSERT INTO `oauth_clients` VALUES (1, NULL, 'Laravel Personal Access Client', '1njLblURxc4CnnD7NaySgH0VHUbRTeWLsrcnLBHk', 'http://localhost', 1, 0, 0, '2023-08-15 08:00:30', '2023-08-15 08:00:30');
INSERT INTO `oauth_clients` VALUES (2, NULL, 'Laravel Password Grant Client', 'saXsW7zK3Buru0114ybHJa2DNUMNq44PHGSvCl8f', 'http://localhost', 0, 1, 0, '2023-08-15 08:00:30', '2023-08-15 08:00:30');
COMMIT;

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
BEGIN;
INSERT INTO `oauth_personal_access_clients` VALUES (1, 1, '2023-08-15 08:00:30', '2023-08-15 08:00:30');
COMMIT;

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES (1, 'all.permission', 'teacher', '2020-12-21 15:26:58', '2020-12-24 13:47:11');
INSERT INTO `permissions` VALUES (2, 'api.teacher.info', 'teacher', '2022-07-05 16:46:28', '2022-07-05 16:46:28');
INSERT INTO `permissions` VALUES (3, 'api.teacher.create_school', 'teacher', '2023-08-17 16:38:42', '2023-08-17 16:38:42');
INSERT INTO `permissions` VALUES (4, 'api.teacher.invite', 'teacher', '2023-08-17 16:38:59', '2023-08-17 16:38:59');
INSERT INTO `permissions` VALUES (5, 'api.teacher.school_list', 'teacher', '2023-08-17 16:39:13', '2023-08-17 16:39:13');
INSERT INTO `permissions` VALUES (6, 'api.teacher.create_student', 'teacher', '2023-08-17 16:39:29', '2023-08-17 16:39:29');
INSERT INTO `permissions` VALUES (7, 'api.teacher.student_list', 'teacher', '2023-08-17 16:39:43', '2023-08-17 16:39:43');
INSERT INTO `permissions` VALUES (8, 'api.teacher.watched_student', 'teacher', '2023-08-17 16:39:54', '2023-08-17 16:39:54');
INSERT INTO `permissions` VALUES (9, 'api.student.info', 'student', '2023-08-17 16:40:16', '2023-08-17 16:40:16');
INSERT INTO `permissions` VALUES (10, 'api.student.teacher_list', 'student', '2023-08-17 16:40:27', '2023-08-17 16:40:27');
INSERT INTO `permissions` VALUES (11, 'api.student.watch_teacher', 'student', '2023-08-17 16:40:39', '2023-08-17 16:40:39');
INSERT INTO `permissions` VALUES (12, 'api.student.unwatch_teacher', 'student', '2023-08-17 16:40:50', '2023-08-17 16:40:50');
INSERT INTO `permissions` VALUES (13, 'api.student.watch_teacher_list', 'student', '2023-08-17 16:41:02', '2023-08-17 16:41:02');
INSERT INTO `permissions` VALUES (14, 'api.teacher.wk_bind', 'teacher', '2023-08-24 18:02:30', '2023-08-24 18:02:30');
INSERT INTO `permissions` VALUES (15, 'api.teacher.send_meg_to_student', 'teacher', '2023-08-24 18:02:44', '2023-08-24 18:02:44');
INSERT INTO `permissions` VALUES (16, 'api.teacher.get_history_message', 'teacher', '2023-08-24 18:02:55', '2023-08-24 18:02:55');
INSERT INTO `permissions` VALUES (17, 'api.teacher.get_message_user', 'teacher', '2023-08-24 18:03:09', '2023-08-24 18:03:09');
INSERT INTO `permissions` VALUES (18, 'api.student.wk_bind', 'student', '2023-08-24 18:03:22', '2023-08-24 18:03:22');
INSERT INTO `permissions` VALUES (19, 'api.student.send_meg_to_teacher', 'student', '2023-08-24 18:03:30', '2023-08-24 18:03:30');
INSERT INTO `permissions` VALUES (20, 'api.student.get_history_message', 'student', '2023-08-24 18:03:42', '2023-08-24 18:03:42');
INSERT INTO `permissions` VALUES (21, 'api.student.get_message_user', 'student', '2023-08-24 18:03:50', '2023-08-24 18:03:50');
INSERT INTO `permissions` VALUES (22, 'api.line.bind_student', 'line', '2023-08-24 18:04:04', '2023-08-24 18:04:04');
INSERT INTO `permissions` VALUES (23, 'api.line.bind_teacher', 'line', '2023-08-24 18:04:12', '2023-08-24 18:04:12');
INSERT INTO `permissions` VALUES (24, 'api.line.student_list', 'line', '2023-08-24 18:04:21', '2023-08-24 18:04:21');
INSERT INTO `permissions` VALUES (25, 'api.line.teacher_list', 'line', '2023-08-24 18:04:28', '2023-08-24 18:04:28');
INSERT INTO `permissions` VALUES (26, 'api.line.wk_bind', 'line', '2023-08-24 18:18:47', '2023-08-24 18:18:47');
INSERT INTO `permissions` VALUES (27, 'api.teacher.school_teacher_list', 'teacher', '2023-08-25 14:02:06', '2023-08-25 14:02:06');
INSERT INTO `permissions` VALUES (28, 'api.teacher.school_teacher_list', 'teacher', '2023-08-28 11:27:14', '2023-08-28 11:27:14');
COMMIT;

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
BEGIN;
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (3, 1);
INSERT INTO `role_has_permissions` VALUES (4, 1);
INSERT INTO `role_has_permissions` VALUES (5, 1);
INSERT INTO `role_has_permissions` VALUES (6, 1);
INSERT INTO `role_has_permissions` VALUES (7, 1);
INSERT INTO `role_has_permissions` VALUES (8, 1);
INSERT INTO `role_has_permissions` VALUES (14, 1);
INSERT INTO `role_has_permissions` VALUES (15, 1);
INSERT INTO `role_has_permissions` VALUES (16, 1);
INSERT INTO `role_has_permissions` VALUES (17, 1);
INSERT INTO `role_has_permissions` VALUES (27, 1);
INSERT INTO `role_has_permissions` VALUES (28, 1);
INSERT INTO `role_has_permissions` VALUES (2, 2);
INSERT INTO `role_has_permissions` VALUES (5, 2);
INSERT INTO `role_has_permissions` VALUES (6, 2);
INSERT INTO `role_has_permissions` VALUES (7, 2);
INSERT INTO `role_has_permissions` VALUES (8, 2);
INSERT INTO `role_has_permissions` VALUES (14, 2);
INSERT INTO `role_has_permissions` VALUES (15, 2);
INSERT INTO `role_has_permissions` VALUES (16, 2);
INSERT INTO `role_has_permissions` VALUES (17, 2);
INSERT INTO `role_has_permissions` VALUES (9, 3);
INSERT INTO `role_has_permissions` VALUES (10, 3);
INSERT INTO `role_has_permissions` VALUES (11, 3);
INSERT INTO `role_has_permissions` VALUES (12, 3);
INSERT INTO `role_has_permissions` VALUES (13, 3);
INSERT INTO `role_has_permissions` VALUES (18, 3);
INSERT INTO `role_has_permissions` VALUES (19, 3);
INSERT INTO `role_has_permissions` VALUES (20, 3);
INSERT INTO `role_has_permissions` VALUES (21, 3);
INSERT INTO `role_has_permissions` VALUES (22, 5);
INSERT INTO `role_has_permissions` VALUES (23, 5);
INSERT INTO `role_has_permissions` VALUES (24, 5);
INSERT INTO `role_has_permissions` VALUES (25, 5);
INSERT INTO `role_has_permissions` VALUES (26, 5);
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES (1, '教师管理员', 'teacher', '2023-08-16 03:27:12', '2023-08-16 03:27:12');
INSERT INTO `roles` VALUES (2, '教师', 'teacher', '2023-08-16 03:27:12', '2023-08-16 03:27:12');
INSERT INTO `roles` VALUES (3, '学生', 'student', '2023-08-16 03:27:12', '2023-08-16 03:27:12');
INSERT INTO `roles` VALUES (5, 'line', 'line', '2023-08-24 17:25:06', '2023-08-24 17:27:18');
COMMIT;

-- ----------------------------
-- Table structure for school_students
-- ----------------------------
DROP TABLE IF EXISTS `school_students`;
CREATE TABLE `school_students` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `school_id` int NOT NULL DEFAULT '0' COMMENT '学校id',
  `student_id` int NOT NULL DEFAULT '0' COMMENT '学生id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of school_students
-- ----------------------------
BEGIN;
INSERT INTO `school_students` VALUES (1, 1, 2, '2023-08-17 14:47:49', '2023-08-17 14:47:49');
INSERT INTO `school_students` VALUES (2, 1, 1, '2023-08-17 14:47:49', '2023-08-17 14:47:49');
COMMIT;

-- ----------------------------
-- Table structure for school_teachers
-- ----------------------------
DROP TABLE IF EXISTS `school_teachers`;
CREATE TABLE `school_teachers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `school_id` int NOT NULL DEFAULT '0' COMMENT '学校id',
  `teacher_id` int NOT NULL DEFAULT '0' COMMENT '教师id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of school_teachers
-- ----------------------------
BEGIN;
INSERT INTO `school_teachers` VALUES (3, 1, 3, '2023-08-16 09:16:33', '2023-08-16 09:16:33');
INSERT INTO `school_teachers` VALUES (4, 1, 1, '2023-08-16 09:16:33', '2023-08-16 09:16:33');
COMMIT;

-- ----------------------------
-- Table structure for schools
-- ----------------------------
DROP TABLE IF EXISTS `schools`;
CREATE TABLE `schools` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apply_id` bigint NOT NULL DEFAULT '0' COMMENT '申请者id',
  `own_id` bigint NOT NULL DEFAULT '0' COMMENT '管理员id',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态:1-申请中,2-通过,3-拒绝',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schools_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of schools
-- ----------------------------
BEGIN;
INSERT INTO `schools` VALUES (1, '学校1', 1, 1, 1, '2023-08-16 07:38:07', '2023-08-16 07:38:07');
INSERT INTO `schools` VALUES (2, '学校2', 1, 1, 2, '2023-08-16 07:44:22', '2023-08-16 07:44:37');
INSERT INTO `schools` VALUES (4, '学校3', 1, 1, 2, '2023-08-21 17:46:04', '2023-08-21 17:46:56');
INSERT INTO `schools` VALUES (5, '1', 2, 2, 3, '2023-08-25 14:18:52', '2023-08-25 14:19:09');
INSERT INTO `schools` VALUES (6, 'teacher4', 9, 9, 1, '2023-08-28 10:48:28', '2023-08-28 10:48:28');
INSERT INTO `schools` VALUES (7, 'teacher5', 10, 10, 1, '2023-08-28 10:54:59', '2023-08-28 10:54:59');
COMMIT;

-- ----------------------------
-- Table structure for student_watch_teachers
-- ----------------------------
DROP TABLE IF EXISTS `student_watch_teachers`;
CREATE TABLE `student_watch_teachers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL DEFAULT '0' COMMENT '学生id',
  `teacher_id` int NOT NULL DEFAULT '0' COMMENT '教师id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of student_watch_teachers
-- ----------------------------
BEGIN;
INSERT INTO `student_watch_teachers` VALUES (3, 1, 2, '2023-08-17 15:54:57', '2023-08-17 15:54:57');
INSERT INTO `student_watch_teachers` VALUES (4, 1, 1, '2023-08-18 18:30:27', '2023-08-18 18:30:27');
COMMIT;

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `students_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of students
-- ----------------------------
BEGIN;
INSERT INTO `students` VALUES (1, 'student1', 'student1@gmail.com', '$2y$10$/l2WfwsUhqYqd0IWhHn5sOtJfHPC8HWTlTwjFSAgPA4yIaeegsHqa', '2023-09-04 15:13:54', '2023-09-04 15:14:03');
INSERT INTO `students` VALUES (2, 'student2', 'student2@gmail.com', '$2y$10$IpgOUrCo80Ch/7tRZLOt6O7u80kqwmPLa.VqmZVnZ7iMvYopQFwWG', '2023-09-04 15:13:57', '2023-09-04 15:14:06');
INSERT INTO `students` VALUES (3, 'student3', 'student3@gmail.com', '$2y$10$5ddRT..1eiSkkH3Q6rOEM.fd8Cn.X6SkCaGV2pHUveM/5w0ZSl3ri', '2023-09-04 15:14:00', '2023-09-04 15:14:10');
COMMIT;

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teachers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of teachers
-- ----------------------------
BEGIN;
INSERT INTO `teachers` VALUES (1, 'teacher1', 'teacher1@gmail.com', '$2y$10$MuuZREbzBK.9/S/Oz5fsO.56Ui50Vv1LWPn6r1qENQPGVz0tSxszy', '2023-08-25 13:59:11', '2023-08-25 13:59:13');
INSERT INTO `teachers` VALUES (2, 'teacher2', 'teacher2@gmail.com', '$2y$10$qv2.u2mhNQikXZfSTARgy.z4Am/hXv04nrfdPGo2Ake1rjNaMmdbq', '2023-08-25 13:58:58', '2023-08-25 13:59:03');
INSERT INTO `teachers` VALUES (3, 'teacher3', 'teacher3@gmail.com', '$2y$10$UNhzIoSS8V9gRaLV7lB7nOhaZrhpBsOMrk1aChdaTVAPGyhv4YpDK', '2023-08-25 13:59:07', '2023-08-25 13:59:09');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
