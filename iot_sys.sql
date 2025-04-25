/*
 Navicat Premium Dump SQL

 Source Server         : 172.16.110.235
 Source Server Type    : MySQL
 Source Server Version : 50736 (5.7.36-log)
 Source Host           : 172.16.110.235:3306
 Source Schema         : iot_sys

 Target Server Type    : MySQL
 Target Server Version : 50736 (5.7.36-log)
 File Encoding         : 65001

 Date: 11/03/2025 17:08:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cldataauth
-- ----------------------------
DROP TABLE IF EXISTS `cldataauth`;
CREATE TABLE `cldataauth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `grid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限组id',
  `kks` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备唯一编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cldataauth
-- ----------------------------

-- ----------------------------
-- Table structure for cldepartment
-- ----------------------------
DROP TABLE IF EXISTS `cldepartment`;
CREATE TABLE `cldepartment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `deptid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门编号',
  `deptname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `contacts` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `haschild` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否有子集',
  `parent` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phonenum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `orderby` bigint(12) NULL DEFAULT NULL COMMENT '排序',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delflag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '删除标识',
  `systemid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统ID',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态:0未提交、1已提交、2已注销、9已删除',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `depttype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cldepartment
-- ----------------------------
INSERT INTO `cldepartment` VALUES (1, '1001', '泰山玻纤有限公司', '', '是', '', '', '', NULL, NULL, '2021-04-12 20:27:03', NULL, '2022-11-30 11:11:37', '否', NULL, NULL, NULL, '公司');

-- ----------------------------
-- Table structure for cldepsys
-- ----------------------------
DROP TABLE IF EXISTS `cldepsys`;
CREATE TABLE `cldepsys`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `depid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编号',
  `syscode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统应用编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织机构与系统应用关联关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cldepsys
-- ----------------------------

-- ----------------------------
-- Table structure for cldict
-- ----------------------------
DROP TABLE IF EXISTS `cldict`;
CREATE TABLE `cldict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典编码',
  `typename` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型描述',
  `sort` int(6) NULL DEFAULT NULL COMMENT '排序',
  `parent` int(64) NULL DEFAULT NULL COMMENT '父id',
  `delflag` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '删除标记',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `createby` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'root' COMMENT '创建人',
  `updatetime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新数据',
  `updateby` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'root' COMMENT '更新人',
  `systemid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_code`(`type`) USING BTREE,
  INDEX `idx_pid`(`parent`) USING BTREE,
  INDEX `idx_value`(`value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cldict
-- ----------------------------
INSERT INTO `cldict` VALUES (1, 'DCS', '水泥行业测点变量', 'point_type', 'Opc Server', NULL, NULL, '否', 'DCS', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (2, 'DCS', 'DCS变量', 'point_type', '风机', NULL, NULL, '是', 'DCS', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (3, 'Cement', '水泥行业', 'category_type', '行业分类', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (4, 'A类', '设备分类', 'device_type', '设备分类', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (5, 'B类', '设备分类', 'device_type', '设备分类', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (6, '2021-03-23 19:17:04', '系统发布时间', 'system_time', '系统运行时间', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cldict` VALUES (7, 'status_type', '状态参数(待修改)', 'status_type', '状态参数', NULL, NULL, '否', '记得修改', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (8, 'TmHigh', '温度状态参数', 'status_type', '温度状态参数', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (9, '1', '公司', 'dept_type', 'dept_type', NULL, NULL, '否', '给组织架构提供类型', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (10, '2', '部门', 'dept_type', 'dept_type', NULL, NULL, '否', '给组织架构提供类型', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (11, 'C类', '设备分类', 'device_type', '设备分类', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (12, '1', 'SYSMA', 'sysgroup', 'sysgroup', NULL, NULL, '否', '不允许删除的角色', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (13, '2', 'DEVELOPER', 'devgroup', 'sysgroup', NULL, NULL, '否', '不允许删除的角色', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (14, '3', 'guest', 'guestgroup', 'sysgroup', NULL, NULL, '否', '不允许删除的角色', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (15, '3s', '3s', 'data_history_data', '3秒', NULL, NULL, '否', NULL, '2021-04-16 18:45:18', 'root', '2021-04-16 18:45:18', 'root', NULL);
INSERT INTO `cldict` VALUES (16, '5s', '5s', 'data_history_data', '5秒', NULL, NULL, '否', NULL, '2021-04-16 18:45:53', 'root', '2021-04-16 18:45:53', 'root', NULL);
INSERT INTO `cldict` VALUES (17, '10s', '10s', 'data_history_data', '10秒', NULL, NULL, '否', NULL, '2021-04-16 18:46:15', 'root', '2021-04-16 18:46:15', 'root', NULL);
INSERT INTO `cldict` VALUES (18, '15s', '15s', 'data_history_data', '15秒', NULL, NULL, '否', NULL, '2021-04-16 18:46:30', 'root', '2021-04-16 18:46:30', 'root', NULL);
INSERT INTO `cldict` VALUES (19, '20s', '20s', 'data_history_data', '20秒', NULL, NULL, '否', NULL, '2021-04-16 18:46:45', 'root', '2021-04-16 18:46:45', 'root', NULL);
INSERT INTO `cldict` VALUES (20, '30s', '30s', 'data_history_data', '30秒', NULL, NULL, '否', NULL, '2021-04-16 18:46:58', 'root', '2021-04-16 18:46:58', 'root', NULL);
INSERT INTO `cldict` VALUES (21, '40s', '40s', 'data_history_data', '40秒', NULL, NULL, '否', NULL, '2021-04-16 18:47:14', 'root', '2021-04-16 18:47:14', 'root', NULL);
INSERT INTO `cldict` VALUES (22, '50s', '50s', 'data_history_data', '50秒', NULL, NULL, '否', NULL, '2021-04-16 18:47:24', 'root', '2021-04-16 18:47:24', 'root', NULL);
INSERT INTO `cldict` VALUES (23, '60s', '60s', 'data_history_data', '60秒', NULL, NULL, '否', NULL, '2021-04-16 18:47:47', 'root', '2021-04-16 18:47:47', 'root', NULL);
INSERT INTO `cldict` VALUES (24, 'SN/TC/', 'topicid生成的规则', 'topicid_rules', 'topicid生成的规则', NULL, NULL, '否', 'topicid生成的规则', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (25, '301', '高温', 'warn_type', '用于预警规则', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (26, '302', '低温', 'warn_type', '用于预警规则', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (27, '300', '正常温度', 'warn_type', '用于预警规则', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (28, 'bool', '数据类型', 'data_type', '数据类型', NULL, NULL, '否', '数据类型分类', '2021-01-02 10:10:23', 'admin', '2021-01-02 10:10:23', 'admin', NULL);
INSERT INTO `cldict` VALUES (29, 'int', '数据类型', 'data_type', '数据类型', NULL, NULL, '否', '数据类型分类', '2021-01-02 10:10:23', 'admin', '2021-01-02 10:10:23', 'admin', NULL);
INSERT INTO `cldict` VALUES (30, 'double', '数据类型', 'data_type', '数据类型', NULL, NULL, '否', '数据类型分类', '2021-01-02 10:10:23', 'admin', '2021-01-02 10:10:23', 'admin', NULL);
INSERT INTO `cldict` VALUES (31, 'String', '数据类型', 'data_type', '数据类型', NULL, NULL, '否', '数据类型分类', '2021-01-02 10:10:23', 'admin', '2021-01-02 10:10:23', 'admin', NULL);
INSERT INTO `cldict` VALUES (32, 'long', '数据类型', 'data_type', '数据类型', NULL, NULL, '否', '数据类型分类', '2021-01-02 10:10:23', 'admin', '2021-01-02 10:10:23', 'admin', NULL);
INSERT INTO `cldict` VALUES (33, 'float', '数据类型', 'data_type', '数据类型', NULL, NULL, '否', '数据类型分类', '2021-01-02 10:10:23', 'admin', '2021-01-02 10:10:23', 'admin', NULL);
INSERT INTO `cldict` VALUES (34, '设备主题', '设备主题', 'topic_type', '主题分类', NULL, NULL, '否', '设备主题分类', '2021-01-02 10:10:23', 'admin', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (35, '状态主题', '状态主题', 'topic_type', '主题分类', NULL, NULL, '否', '设备主题分类', '2021-01-02 10:10:23', 'admin', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (36, '计算主题', '计算主题', 'topic_type', '主题分类', NULL, NULL, '否', '设备主题分类', '2021-01-02 10:10:23', 'admin', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (37, '预警主题', '预警主题', 'topic_type', '主题分类', NULL, NULL, '否', '设备主题分类', '2021-01-02 10:10:23', 'admin', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (38, '1', '测试', 'sinoma001', '测试', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (39, '1', '主分类', 'cldevice_type', '类型分类', NULL, NULL, '否', '用于设备类型分类', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (40, '2', '次分类', 'cldevice_type', '类型分类', NULL, NULL, '否', '用于设备类型分类', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (41, '1', '主要属性', 'clbastatt_type', '属性类型', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (42, '2', '次分类', 'clbaseatt_type', '设备属性分组', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (43, '工段', '首页测点模型-工段', 'modelpoint_type', '首页测点模型', NULL, NULL, '否', '首页测点模型分类', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (44, '工序', '首页测点模型-工序', 'modelpoint_type', '首页测点模型', NULL, NULL, '否', '首页测点模型分类', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (45, '车间', '首页测点模型-车间', 'modelpoint_type', '首页测点模型', NULL, NULL, '否', '首页测点模型分类', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (46, 'bs_pc', '看板类型-生产PC', 'portal_type', '看板类型', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (47, 'qc_pc', '看板类型-质量PC', 'portal_type', '看板类型', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (48, '1', '大屏类型', 'bigscreen_type', '生产', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (49, '2', '大屏类型', 'bigscreen_type', '质量', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (50, '3', '大屏类型', 'bigscreen_type', '设备', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (51, '1', '大屏接口类型', 'bigscreen_inter_type', '数据中台', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (52, '2', '大屏接口类型', 'bigscreen_inter_type', '设备', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (53, 'true', '大屏开关配置', 'bigscreen_adjust_switch', '大屏开关配置', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (54, '主分类', '主分类', 'cldevice_type', '主分类', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (55, '公共分类', '公共', 'clbaseatt_type', '公共', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (56, 'v2.0', '协议导入模板版本', 'agrimport_version', '协议导入模板版本', NULL, NULL, '否', '协议设置一键导入版本(2.0版本新增一个测点字段)', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (57, 'test', '测试', 'test', 'test', NULL, NULL, '是', '测试描述', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (58, '13', '测试', 'test', 'test', NULL, NULL, '否', 'remark', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (59, '1', '四舍五入', 'formula_retain', '四舍五入', NULL, NULL, '否', '四舍五入', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (60, '2', '向上取整', 'formula_retain', '向上取整', NULL, NULL, '否', '向上取整', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (61, '3', '向下取整', 'formula_retain', '向下取整', NULL, NULL, '否', '向下取整', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (62, '4', '按精度截取', 'formula_retain', '按精度截取', NULL, NULL, '否', '按精度截取', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (63, '1', '工厂业务应用', 'nav_type', '首页业务应用分类', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (64, '2', '区域业务应用', 'nav_type', '首页业务应用分类', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (65, '3', '集团业务应用', 'nav_type', '首页业务应用分类', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (66, 'bs_app', '看板类型-APP', 'portal_type', '看板类型', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (67, '4', '矿山应用', 'nav_type', '首页业务应用分类', NULL, NULL, '否', '首页业务应用分类', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (68, '1', '系统消息', 'message_type', '消息渠道', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (69, '2', '邮件', 'message_type', '消息渠道', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (70, '3', '短信', 'message_type', '消息渠道', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (71, '4', '钉钉', 'message_type', '消息渠道', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (72, '5', '企业微信', 'message_type', '消息渠道', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (73, '6', '公众号', 'message_type', '消息渠道', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);
INSERT INTO `cldict` VALUES (74, '1', '消息保留时间', 'message_recovery', '消息回收时间（字段值中填入要回收几天前的数据）', NULL, NULL, '否', '', '2021-01-02 10:10:23', 'tengyong', '2021-01-02 10:10:23', 'tengyong', NULL);

-- ----------------------------
-- Table structure for clfuncpoint
-- ----------------------------
DROP TABLE IF EXISTS `clfuncpoint`;
CREATE TABLE `clfuncpoint`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `funcnum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能点编号',
  `funcname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能点名称',
  `parent` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级',
  `image` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `funcid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能点ID',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `orderby` bigint(20) NULL DEFAULT NULL COMMENT '排序',
  `isvisible` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否显示',
  `systemid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统ID',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delflag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '删除标识',
  `funcdesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能点描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clgroupmenus`(`funcnum`, `parent`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5841 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clfuncpoint
-- ----------------------------
INSERT INTO `clfuncpoint` VALUES (972, '1001', '添加', '1010', NULL, NULL, NULL, '2021-02-26 17:55:56', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (973, '1002', '编辑', '1010', NULL, NULL, NULL, '2021-02-26 17:55:56', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (974, '1003', '删除', '1010', NULL, NULL, NULL, '2021-02-26 17:55:56', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (975, '1004', '查看', '1010', NULL, NULL, NULL, '2021-02-26 17:55:56', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (976, '1001', '添加', '101001', NULL, NULL, NULL, '2021-02-26 17:57:00', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (977, '1002', '编辑', '101001', NULL, NULL, NULL, '2021-02-26 17:57:00', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (978, '1003', '删除', '101001', NULL, NULL, NULL, '2021-02-26 17:57:00', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (979, '1004', '查看', '101001', NULL, NULL, NULL, '2021-02-26 17:57:00', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (980, '1001', '添加', '101002', NULL, NULL, NULL, '2021-02-26 17:57:39', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (981, '1002', '编辑', '101002', NULL, NULL, NULL, '2021-02-26 17:57:39', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (982, '1003', '删除', '101002', NULL, NULL, NULL, '2021-02-26 17:57:39', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (983, '1004', '查看', '101002', NULL, NULL, NULL, '2021-02-26 17:57:39', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (984, '1001', '添加', '101003', NULL, NULL, NULL, '2021-02-26 17:58:05', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (985, '1002', '编辑', '101003', NULL, NULL, NULL, '2021-02-26 17:58:05', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (986, '1003', '删除', '101003', NULL, NULL, NULL, '2021-02-26 17:58:05', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (987, '1004', '查看', '101003', NULL, NULL, NULL, '2021-02-26 17:58:05', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (1487, '1004', '查看', '101004', NULL, NULL, NULL, '2021-03-17 18:50:22', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (1488, '1003', '删除', '101004', NULL, NULL, NULL, '2021-03-17 18:50:22', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (1489, '1002', '编辑', '101004', NULL, NULL, NULL, '2021-03-17 18:50:22', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (1490, '1001', '添加', '101004', NULL, NULL, NULL, '2021-03-17 18:50:22', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2028, '1004', '查看', '40000103', NULL, NULL, NULL, '2021-02-04 17:08:27', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2029, '1003', '删除', '40000103', NULL, NULL, NULL, '2021-02-04 17:08:27', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2030, '1002', '编辑', '40000103', NULL, NULL, NULL, '2021-02-04 17:08:27', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2031, '1001', '添加', '40000103', NULL, NULL, NULL, '2021-02-04 17:08:27', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2032, '1004', '查看', '40000101', NULL, NULL, NULL, '2021-04-17 10:27:22', 4, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2033, '1003', '删除', '40000101', NULL, NULL, NULL, '2021-04-17 10:27:22', 3, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2034, '1002', '编辑', '40000101', NULL, NULL, NULL, '2021-04-17 10:27:22', 2, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2035, '1001', '添加', '40000101', NULL, NULL, NULL, '2021-04-17 10:27:22', 1, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2040, '1004', '查看', '40000104', NULL, NULL, NULL, '2021-04-17 11:12:41', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2041, '1003', '删除', '40000104', NULL, NULL, NULL, '2021-04-17 11:12:41', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2042, '1002', '编辑', '40000104', NULL, NULL, NULL, '2021-04-17 11:12:41', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2043, '1001', '添加', '40000104', NULL, NULL, NULL, '2021-04-17 11:12:41', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2044, '1004', '查看', '40000105', NULL, NULL, NULL, '2021-04-17 11:13:43', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2045, '1003', '删除', '40000105', NULL, NULL, NULL, '2021-04-17 11:13:43', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2046, '1002', '编辑', '40000105', NULL, NULL, NULL, '2021-04-17 11:13:43', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2047, '1001', '添加', '40000105', NULL, NULL, NULL, '2021-04-17 11:13:43', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2052, '1004', '查看', '40000107', NULL, NULL, NULL, '2021-04-17 11:18:40', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2053, '1003', '删除', '40000107', NULL, NULL, NULL, '2021-04-17 11:18:40', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2054, '1002', '编辑', '40000107', NULL, NULL, NULL, '2021-04-17 11:18:40', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2055, '1001', '添加', '40000107', NULL, NULL, NULL, '2021-04-17 11:18:40', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2108, '1004', '查看', '40000301', NULL, NULL, NULL, '2021-06-03 15:31:03', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2109, '1003', '删除', '40000301', NULL, NULL, NULL, '2021-06-03 15:31:03', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2110, '1002', '编辑', '40000301', NULL, NULL, NULL, '2021-06-03 15:31:03', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2111, '1001', '添加', '40000301', NULL, NULL, NULL, '2021-06-03 15:31:03', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2112, '1004', '查看', '40000302', NULL, NULL, NULL, '2021-06-03 15:31:36', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2113, '1003', '删除', '40000302', NULL, NULL, NULL, '2021-06-03 15:31:36', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2114, '1002', '编辑', '40000302', NULL, NULL, NULL, '2021-06-03 15:31:36', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2115, '1001', '添加', '40000302', NULL, NULL, NULL, '2021-06-03 15:31:36', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2124, '1004', '查看', '40000109', NULL, NULL, NULL, '2021-06-03 15:42:19', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2125, '1003', '删除', '40000109', NULL, NULL, NULL, '2021-06-03 15:42:19', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2126, '1002', '编辑', '40000109', NULL, NULL, NULL, '2021-06-03 15:42:19', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2127, '1001', '添加', '40000109', NULL, NULL, NULL, '2021-06-03 15:42:19', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2128, '1005', '停用', '40000101', '', '', '', '2021-01-29 12:01:07', 5, '', '', '', '2021-06-03 15:45:16', '否', '用户管理');
INSERT INTO `clfuncpoint` VALUES (2129, '1006', '重置密码', '40000101', '', '', '', '2021-01-29 12:01:07', 6, '', '', '', '2021-06-03 15:45:21', '否', '用户管理');
INSERT INTO `clfuncpoint` VALUES (2130, '1008', '查询', '40000101', '', '', '', '2021-01-29 12:01:07', 9, '', '', '', '2021-06-03 15:45:23', '否', '用户管理');
INSERT INTO `clfuncpoint` VALUES (2131, '1009', '查询', '40000101', '', '', '', '2021-01-29 12:01:07', 9, '', '', '', '2021-06-03 15:45:27', '否', '用户管理-角色');
INSERT INTO `clfuncpoint` VALUES (2132, '1010', '重置', '40000101', '', '', '', '2021-03-16 16:11:48', NULL, '', '', '', '2021-06-03 15:45:30', '否', '用户-重置');
INSERT INTO `clfuncpoint` VALUES (2133, '1011', '重置', '40000101', '', '', '', '2021-03-16 16:31:22', NULL, '', '', '', '2021-06-03 23:10:23', '否', '角色-重置');
INSERT INTO `clfuncpoint` VALUES (2134, '1005', '编辑', '40000104', '', '', '', '2021-01-29 12:01:07', 4, '', '', '', '2021-06-03 16:14:30', '否', '菜单管理-功能点');
INSERT INTO `clfuncpoint` VALUES (2135, '1014', '重置', '40000103', '', '', '', '2021-03-17 11:34:21', NULL, '', '', '', '2021-06-03 16:19:25', '否', '角色-重置');
INSERT INTO `clfuncpoint` VALUES (2136, '1013', '刷新', '40000103', '', '', '', '2021-01-29 12:01:07', 6, '', '', '', '2021-06-03 16:19:25', '否', '角色管理-用户');
INSERT INTO `clfuncpoint` VALUES (2137, '1012', '查询', '40000103', '', '', '', '2021-01-29 12:01:07', 5, '', '', NULL, '2022-09-29 10:42:29', '否', '角色管理-用户');
INSERT INTO `clfuncpoint` VALUES (2138, '1011', '编辑', '40000103', '', '', '', '2021-01-29 12:01:07', 4, '', '', '', '2021-06-03 16:19:25', '否', '角色管理-用户');
INSERT INTO `clfuncpoint` VALUES (2139, '1010', '添加', '40000103', '', '', '', '2021-01-29 12:01:07', 2, '', '', '', '2021-06-03 16:19:25', '否', '角色管理-用户');
INSERT INTO `clfuncpoint` VALUES (2140, '1009', '删除', '40000103', '', '', '', '2021-01-29 12:01:07', 3, '', '', '', '2021-06-03 16:19:25', '否', '角色管理-用户');
INSERT INTO `clfuncpoint` VALUES (2141, '1008', '查看', '40000103', '', '', '', '2021-01-29 12:01:07', 1, '', '', '', '2021-06-03 16:19:25', '否', '角色管理-用户');
INSERT INTO `clfuncpoint` VALUES (2142, '1005', '查询', '40000103', '', '', '', '2021-01-29 12:01:07', 5, '', '', NULL, '2022-09-29 10:42:19', '否', '角色管理');
INSERT INTO `clfuncpoint` VALUES (2143, '1007', '授权', '40000103', '', '', '', '2021-01-29 12:01:07', 7, '', '', NULL, '2023-06-02 10:51:19', '否', '角色管理');
INSERT INTO `clfuncpoint` VALUES (2144, '1005', '查询', '40000105', '', '', '', '2019-12-30 16:57:15', NULL, '', '', '', '2021-06-03 16:20:36', '否', '数据字典');
INSERT INTO `clfuncpoint` VALUES (2145, '1005', '查询', '40000107', '', '', '', '2021-01-15 18:27:43', NULL, '', '', '', '2021-06-03 16:21:33', '否', '用户组管理');
INSERT INTO `clfuncpoint` VALUES (2146, '1006', '查看', '40000107', '', '', '', '2021-01-15 18:27:43', NULL, '', '', '', '2021-06-03 16:21:35', '否', '用户组管理-用户');
INSERT INTO `clfuncpoint` VALUES (2147, '1007', '删除', '40000107', '', '', '', '2021-01-15 18:27:43', NULL, '', '', '', '2021-06-03 16:21:37', '否', '用户组管理-用户');
INSERT INTO `clfuncpoint` VALUES (2148, '1008', '添加', '40000107', '', '', '', '2021-01-15 18:27:43', NULL, '', '', '', '2021-06-03 16:21:41', '否', '用户组管理-用户');
INSERT INTO `clfuncpoint` VALUES (2149, '1009', '编辑', '40000107', '', '', '', '2021-01-15 18:27:43', NULL, '', '', '', '2021-06-03 16:21:44', '否', '用户组管理-用户');
INSERT INTO `clfuncpoint` VALUES (2150, '1010', '查询', '40000107', '', '', '', '2021-01-15 18:27:43', NULL, '', '', '', '2021-06-03 16:21:46', '否', '用户组管理-用户');
INSERT INTO `clfuncpoint` VALUES (2151, '1009', '查看', '40000109', '', '', '', '2021-01-29 12:01:07', NULL, '', '', '', '2021-06-03 16:22:52', '否', '子系统管理-用户组');
INSERT INTO `clfuncpoint` VALUES (2152, '1008', '删除', '40000109', '', '', '', '2021-01-29 12:01:07', NULL, '', '', '', '2021-06-03 16:22:50', '否', '子系统管理-用户组');
INSERT INTO `clfuncpoint` VALUES (2153, '1007', '编辑', '40000109', '', '', '', '2021-01-29 12:01:07', NULL, '', '', '', '2021-06-03 16:22:48', '否', '子系统管理-用户组');
INSERT INTO `clfuncpoint` VALUES (2154, '1006', '添加', '40000109', '', '', '', '2021-01-29 12:01:07', NULL, '', '', '', '2021-06-03 16:22:46', '否', '子系统管理-用户组');
INSERT INTO `clfuncpoint` VALUES (2155, '1005', '查询', '40000109', '', '', '', '2021-01-29 12:01:07', NULL, '', '', '', '2021-06-03 16:22:44', '否', '子系统管理');
INSERT INTO `clfuncpoint` VALUES (2156, '1010', '查询', '40000109', '', '', '', '2021-01-29 12:01:07', NULL, '', '', '', '2021-06-03 16:22:41', '否', '子系统管理-用户组');
INSERT INTO `clfuncpoint` VALUES (2157, '1011', '刷新', '40000109', '', '', '', '2021-03-05 14:29:54', NULL, '', '', '', '2021-06-03 16:22:37', '否', '子系统刷新');
INSERT INTO `clfuncpoint` VALUES (2158, '1012', '重置', '40000109', '', '', '', '2021-03-17 14:36:07', NULL, '', '', '', '2021-03-17 14:36:37', '否', '角色-查看');
INSERT INTO `clfuncpoint` VALUES (2159, '1004', '查看', '400009', NULL, NULL, NULL, '2021-04-17 11:32:35', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2160, '1003', '删除', '400009', NULL, NULL, NULL, '2021-04-17 11:32:35', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2161, '1002', '编辑', '400009', NULL, NULL, NULL, '2021-04-17 11:32:35', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2162, '1001', '添加', '400009', NULL, NULL, NULL, '2021-04-17 11:32:35', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2472, '1004', '查看', '40000303', NULL, NULL, NULL, '2021-08-03 11:21:28', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2473, '1003', '删除', '40000303', NULL, NULL, NULL, '2021-08-03 11:21:28', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2474, '1002', '编辑', '40000303', NULL, NULL, NULL, '2021-08-03 11:21:28', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2475, '1001', '添加', '40000303', NULL, NULL, NULL, '2021-08-03 11:21:28', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2476, '1004', '查看', '40000304', NULL, NULL, NULL, '2021-08-03 11:22:14', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2477, '1003', '删除', '40000304', NULL, NULL, NULL, '2021-08-03 11:22:14', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2478, '1002', '编辑', '40000304', NULL, NULL, NULL, '2021-08-03 11:22:14', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2479, '1001', '添加', '40000304', NULL, NULL, NULL, '2021-08-03 11:22:14', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2589, '1004', '查看', '40000501', NULL, NULL, NULL, '2021-08-14 14:33:36', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2590, '1003', '删除', '40000501', NULL, NULL, NULL, '2021-08-14 14:33:36', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2591, '1002', '编辑', '40000501', NULL, NULL, NULL, '2021-08-14 14:33:36', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2592, '1001', '添加', '40000501', NULL, NULL, NULL, '2021-08-14 14:33:36', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2593, '1004', '查看', '40000502', NULL, NULL, NULL, '2021-08-14 14:34:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2594, '1003', '删除', '40000502', NULL, NULL, NULL, '2021-08-14 14:34:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2595, '1002', '编辑', '40000502', NULL, NULL, NULL, '2021-08-14 14:34:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (2596, '1001', '添加', '40000502', NULL, NULL, NULL, '2021-08-14 14:34:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3257, '1003', '添加', '10021803', NULL, NULL, NULL, '2021-01-29 12:01:07', 2, NULL, NULL, NULL, NULL, '否', '报警代码');
INSERT INTO `clfuncpoint` VALUES (3258, '1004', '编辑', '10021803', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '报警代码');
INSERT INTO `clfuncpoint` VALUES (3259, '1002', '删除', '10021803', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '报警代码');
INSERT INTO `clfuncpoint` VALUES (3260, '1001', '查看', '10021803', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '报警代码');
INSERT INTO `clfuncpoint` VALUES (3261, '1005', '查询', '10021803', NULL, NULL, NULL, '2021-01-29 12:01:07', 5, NULL, NULL, NULL, NULL, '否', '报警代码');
INSERT INTO `clfuncpoint` VALUES (3274, '1004', '编辑', '10021903', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '是', '设备台账');
INSERT INTO `clfuncpoint` VALUES (3275, '1001', '查看', '10021903', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '是', '设备台账');
INSERT INTO `clfuncpoint` VALUES (3276, '1005', '查询', '10021903', NULL, NULL, NULL, '2021-01-29 12:01:07', 5, NULL, NULL, NULL, NULL, '是', '设备台账');
INSERT INTO `clfuncpoint` VALUES (3277, '1003', '添加', '10021802', NULL, NULL, NULL, '2021-01-29 12:01:07', 2, NULL, NULL, NULL, NULL, '否', '测点集合');
INSERT INTO `clfuncpoint` VALUES (3278, '1004', '编辑', '10021802', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '测点集合');
INSERT INTO `clfuncpoint` VALUES (3279, '1002', '删除', '10021802', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '测点集合');
INSERT INTO `clfuncpoint` VALUES (3280, '1001', '查看', '10021802', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '测点集合');
INSERT INTO `clfuncpoint` VALUES (3281, '1003', '添加', '10021801', NULL, NULL, NULL, '2021-01-29 12:01:07', 2, NULL, NULL, NULL, NULL, '否', '标准测点');
INSERT INTO `clfuncpoint` VALUES (3282, '1004', '编辑', '10021801', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '标准测点');
INSERT INTO `clfuncpoint` VALUES (3283, '1002', '删除', '10021801', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '标准测点');
INSERT INTO `clfuncpoint` VALUES (3284, '1001', '查看', '10021801', NULL, NULL, NULL, '2021-01-29 12:01:07', 6, NULL, NULL, NULL, NULL, '否', '标准测点');
INSERT INTO `clfuncpoint` VALUES (3285, '1005', '查询', '10021801', NULL, NULL, NULL, '2021-01-29 12:01:07', 5, NULL, NULL, NULL, NULL, '否', '标准测点');
INSERT INTO `clfuncpoint` VALUES (3286, '1003', '添加', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 2, NULL, NULL, NULL, NULL, '否', '设备位置');
INSERT INTO `clfuncpoint` VALUES (3287, '1004', '编辑', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '设备位置');
INSERT INTO `clfuncpoint` VALUES (3288, '1002', '删除', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '设备位置');
INSERT INTO `clfuncpoint` VALUES (3289, '1001', '查看', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '设备位置');
INSERT INTO `clfuncpoint` VALUES (3290, '1003', '添加', '100208', NULL, NULL, NULL, '2021-01-29 12:01:07', 2, NULL, NULL, NULL, NULL, '否', '数据集');
INSERT INTO `clfuncpoint` VALUES (3291, '1004', '编辑', '100208', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '数据集');
INSERT INTO `clfuncpoint` VALUES (3292, '1002', '删除', '100208', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '数据集');
INSERT INTO `clfuncpoint` VALUES (3293, '1001', '查看', '100208', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '数据集');
INSERT INTO `clfuncpoint` VALUES (3304, '1003', '添加', '10021902', NULL, NULL, NULL, '2021-01-29 12:01:07', 2, NULL, NULL, NULL, NULL, '否', '设备类型');
INSERT INTO `clfuncpoint` VALUES (3305, '1004', '编辑', '10021902', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '设备类型');
INSERT INTO `clfuncpoint` VALUES (3306, '1002', '删除', '10021902', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '设备类型');
INSERT INTO `clfuncpoint` VALUES (3307, '1001', '查看', '10021902', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '设备类型');
INSERT INTO `clfuncpoint` VALUES (3308, '1005', '查询', '10021902', NULL, NULL, NULL, '2021-01-29 12:01:07', 5, NULL, NULL, NULL, NULL, '否', '设备类型');
INSERT INTO `clfuncpoint` VALUES (3309, '1005', '查询', '100304', NULL, NULL, NULL, '2021-01-29 12:01:07', 2, NULL, NULL, NULL, NULL, '否', '数据分析');
INSERT INTO `clfuncpoint` VALUES (3314, '1001', '查看', '100304', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3315, '1006', '刷新', '100304', NULL, NULL, NULL, '2021-01-29 12:01:07', 6, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3316, '1001', '查看', '10021804', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '计算测点');
INSERT INTO `clfuncpoint` VALUES (3317, '1003', '添加', '10021804', NULL, NULL, NULL, '2021-01-29 12:01:07', 2, NULL, NULL, NULL, NULL, '否', '计算测点');
INSERT INTO `clfuncpoint` VALUES (3318, '1004', '编辑', '10021804', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '计算测点');
INSERT INTO `clfuncpoint` VALUES (3319, '1002', '删除', '10021804', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '计算测点');
INSERT INTO `clfuncpoint` VALUES (3320, '1005', '查询', '10021804', NULL, NULL, NULL, '2021-01-29 12:01:07', 5, NULL, NULL, NULL, NULL, '否', '计算测点');
INSERT INTO `clfuncpoint` VALUES (3321, '1006', '关联设备', '10021804', NULL, NULL, NULL, '2021-01-29 12:01:07', 6, NULL, NULL, NULL, NULL, '否', '计算测点');
INSERT INTO `clfuncpoint` VALUES (3324, '1007', '导入', '10021801', NULL, NULL, NULL, '2019-12-20 13:28:16', 1, NULL, NULL, NULL, NULL, '否', '标准测点');
INSERT INTO `clfuncpoint` VALUES (3325, '1008', '导出模板', '10021801', NULL, NULL, NULL, '2019-12-20 13:29:20', 7, NULL, NULL, NULL, NULL, '否', '标准测点');
INSERT INTO `clfuncpoint` VALUES (3326, '1001', '查看', '10022003', NULL, NULL, NULL, '2019-12-26 14:46:10', NULL, NULL, NULL, NULL, NULL, '否', '协议设置');
INSERT INTO `clfuncpoint` VALUES (3327, '1004', '编辑', '10022003', NULL, NULL, NULL, '2019-12-26 14:47:22', NULL, NULL, NULL, NULL, NULL, '否', '协议设置');
INSERT INTO `clfuncpoint` VALUES (3328, '1002', '删除', '10022003', NULL, NULL, NULL, '2019-12-26 14:48:09', NULL, NULL, NULL, NULL, NULL, '否', '协议设置');
INSERT INTO `clfuncpoint` VALUES (3329, '1003', '添加', '10022003', NULL, NULL, NULL, '2019-12-26 14:48:42', NULL, NULL, NULL, NULL, NULL, '否', '协议设置');
INSERT INTO `clfuncpoint` VALUES (3330, '1003', '添加', '100112', NULL, NULL, NULL, '2019-12-27 14:25:39', NULL, NULL, NULL, NULL, NULL, '否', '数据字典');
INSERT INTO `clfuncpoint` VALUES (3331, '1001', '查看', '100112', NULL, NULL, NULL, '2019-12-27 14:25:39', NULL, NULL, NULL, NULL, NULL, '否', '数据字典');
INSERT INTO `clfuncpoint` VALUES (3332, '1004', '编辑', '100112', NULL, NULL, NULL, '2019-12-27 14:25:40', NULL, NULL, NULL, NULL, NULL, '否', '数据字典');
INSERT INTO `clfuncpoint` VALUES (3333, '1002', '删除', '100112', NULL, NULL, NULL, '2019-12-27 14:25:40', NULL, NULL, NULL, NULL, NULL, '否', '数据字典');
INSERT INTO `clfuncpoint` VALUES (3334, '1005', '查询', '100112', NULL, NULL, NULL, '2019-12-30 16:57:15', NULL, NULL, NULL, NULL, NULL, '否', '数据字典');
INSERT INTO `clfuncpoint` VALUES (3335, '1003', '添加', '10022201', NULL, NULL, NULL, '2020-03-25 18:16:31', 2, NULL, NULL, NULL, NULL, '否', '预警规则设置');
INSERT INTO `clfuncpoint` VALUES (3336, '1004', '编辑', '10022201', NULL, NULL, NULL, '2020-03-25 18:16:31', 4, NULL, NULL, NULL, NULL, '否', '预警规则设置');
INSERT INTO `clfuncpoint` VALUES (3337, '1002', '删除', '10022201', NULL, NULL, NULL, '2020-03-25 18:16:31', 3, NULL, NULL, NULL, NULL, '否', '预警规则设置');
INSERT INTO `clfuncpoint` VALUES (3338, '1001', '查看', '10022201', NULL, NULL, NULL, '2020-03-25 18:16:31', 1, NULL, NULL, NULL, NULL, '否', '预警规则设置');
INSERT INTO `clfuncpoint` VALUES (3339, '1003', '添加', '10022202', NULL, NULL, NULL, '2020-03-25 18:16:31', 2, NULL, NULL, NULL, NULL, '否', '状态规则设置');
INSERT INTO `clfuncpoint` VALUES (3340, '1004', '编辑', '10022202', NULL, NULL, NULL, '2020-03-25 18:16:31', 4, NULL, NULL, NULL, NULL, '否', '状态规则设置');
INSERT INTO `clfuncpoint` VALUES (3341, '1002', '删除', '10022202', NULL, NULL, NULL, '2020-03-25 18:16:31', 3, NULL, NULL, NULL, NULL, '否', '状态规则设置');
INSERT INTO `clfuncpoint` VALUES (3342, '1001', '查看', '10022202', NULL, NULL, NULL, '2020-03-25 18:16:31', 1, NULL, NULL, NULL, NULL, '否', '状态规则设置');
INSERT INTO `clfuncpoint` VALUES (3355, '1003', '添加', '100401', NULL, NULL, NULL, '2021-01-18 16:29:26', 1, NULL, NULL, NULL, NULL, '否', '系统主题');
INSERT INTO `clfuncpoint` VALUES (3356, '1001', '查看', '100401', NULL, NULL, NULL, '2021-01-18 16:29:26', NULL, NULL, NULL, NULL, NULL, '否', '系统主题');
INSERT INTO `clfuncpoint` VALUES (3357, '1004', '查询', '100401', NULL, NULL, NULL, '2021-01-18 16:29:26', 2, NULL, NULL, NULL, NULL, '否', '系统主题');
INSERT INTO `clfuncpoint` VALUES (3358, '1002', '删除', '100401', NULL, NULL, NULL, '2021-01-18 16:29:26', NULL, NULL, NULL, NULL, NULL, '否', '系统主题');
INSERT INTO `clfuncpoint` VALUES (3359, '1001', '查询', '100402', NULL, NULL, NULL, '2021-01-18 16:29:59', NULL, NULL, NULL, NULL, NULL, '否', '主题列表');
INSERT INTO `clfuncpoint` VALUES (3360, '1004', '编辑', '100402', NULL, NULL, NULL, '2021-01-18 16:29:59', NULL, NULL, NULL, NULL, NULL, '否', '主题列表');
INSERT INTO `clfuncpoint` VALUES (3369, '1003', '添加', '1006', NULL, NULL, NULL, '2021-01-18 17:02:44', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3370, '1001', '查看', '1006', NULL, NULL, NULL, '2021-01-18 17:02:44', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3371, '1004', '编辑', '1006', NULL, NULL, NULL, '2021-01-18 17:02:44', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3372, '1002', '删除', '1006', NULL, NULL, NULL, '2021-01-18 17:02:44', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3373, '1004', '查看', '1007', NULL, NULL, NULL, '2021-01-29 12:01:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3374, '1003', '删除', '1007', NULL, NULL, NULL, '2021-01-29 12:01:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3375, '1002', '编辑', '1007', NULL, NULL, NULL, '2021-01-29 12:01:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3376, '1001', '添加', '1007', NULL, NULL, NULL, '2021-01-29 12:01:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3377, '1005', '配置', '10022003', NULL, NULL, NULL, '2021-01-29 17:53:10', NULL, NULL, NULL, NULL, NULL, '否', '协议设置');
INSERT INTO `clfuncpoint` VALUES (3378, '1006', '生成点表', '10022003', NULL, NULL, NULL, '2021-01-29 18:01:30', NULL, NULL, NULL, NULL, NULL, '否', '协议设置');
INSERT INTO `clfuncpoint` VALUES (3379, '1007', '导入原始测点', '10022003', NULL, NULL, NULL, '2021-01-29 18:06:28', NULL, NULL, NULL, NULL, NULL, '否', '协议设置');
INSERT INTO `clfuncpoint` VALUES (3407, '1005', '查看', '10021802', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '测点集合-标准测点');
INSERT INTO `clfuncpoint` VALUES (3408, '1006', '删除', '10021802', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '测点集合-标准测点');
INSERT INTO `clfuncpoint` VALUES (3409, '1007', '添加', '10021802', NULL, NULL, NULL, '2021-01-29 12:01:07', 2, NULL, NULL, NULL, NULL, '否', '测点集合-标准测点');
INSERT INTO `clfuncpoint` VALUES (3410, '1008', '编辑', '10021802', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '测点集合-标准测点');
INSERT INTO `clfuncpoint` VALUES (3411, '1009', '查询', '10021802', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '测点集合-标准测点');
INSERT INTO `clfuncpoint` VALUES (3412, '1006', '导入模板', '10021803', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '报警代码');
INSERT INTO `clfuncpoint` VALUES (3413, '1007', '导出模板', '10021803', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '报警代码');
INSERT INTO `clfuncpoint` VALUES (3414, '1004', '查看', '100701', NULL, NULL, NULL, '2021-02-01 17:58:57', 1, NULL, NULL, NULL, NULL, '否', '查看');
INSERT INTO `clfuncpoint` VALUES (3415, '1003', '删除', '100701', NULL, NULL, NULL, '2021-02-01 17:58:57', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3416, '1002', '编辑', '100701', NULL, NULL, NULL, '2021-02-01 17:58:57', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3417, '1001', '添加', '100701', NULL, NULL, NULL, '2021-02-01 17:58:57', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3418, '1004', '查看', '100702', NULL, NULL, NULL, '2021-02-01 17:59:56', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3419, '1003', '删除', '100702', NULL, NULL, NULL, '2021-02-01 17:59:56', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3420, '1002', '编辑', '100702', NULL, NULL, NULL, '2021-02-01 17:59:56', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3421, '1001', '添加', '100702', NULL, NULL, NULL, '2021-02-01 17:59:56', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3422, '1008', '查询', '10022003', NULL, NULL, NULL, '2021-01-29 18:06:28', NULL, NULL, NULL, NULL, NULL, '否', '协议设置');
INSERT INTO `clfuncpoint` VALUES (3423, '1005', '查看', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '设备位置-测点-标准测点');
INSERT INTO `clfuncpoint` VALUES (3424, '1006', '删除', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 2, NULL, NULL, NULL, NULL, '否', '设备位置-测点-标准测点');
INSERT INTO `clfuncpoint` VALUES (3425, '1007', '挂载', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '设备位置-测点-标准测点');
INSERT INTO `clfuncpoint` VALUES (3426, '1008', '编辑', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '设备位置-测点-标准测点');
INSERT INTO `clfuncpoint` VALUES (3427, '1009', '查询', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 5, NULL, NULL, NULL, NULL, '否', '设备位置-测点-标准测点');
INSERT INTO `clfuncpoint` VALUES (3428, '1011', '导入数据', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 7, NULL, NULL, NULL, NULL, '否', '设备位置-测点-标准测点');
INSERT INTO `clfuncpoint` VALUES (3429, '1012', '导出数据', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 8, NULL, NULL, NULL, NULL, '否', '设备位置-测点-标准测点');
INSERT INTO `clfuncpoint` VALUES (3430, '1013', '下标排序', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 9, NULL, NULL, NULL, NULL, '否', '设备位置-测点-标准测点');
INSERT INTO `clfuncpoint` VALUES (3431, '1014', '查看', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '设备位置-测点-计算测点');
INSERT INTO `clfuncpoint` VALUES (3432, '1015', '查询', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '设备位置-测点-计算测点');
INSERT INTO `clfuncpoint` VALUES (3433, '1016', '编辑', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '设备位置-测点-计算测点');
INSERT INTO `clfuncpoint` VALUES (3434, '1017', '查看', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '设备位置-测点-状态规则测点');
INSERT INTO `clfuncpoint` VALUES (3435, '1018', '查询', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '设备位置-测点-状态规则测点');
INSERT INTO `clfuncpoint` VALUES (3436, '1019', '删除', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '设备位置-测点-状态规则测点');
INSERT INTO `clfuncpoint` VALUES (3437, '1020', '编辑', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '设备位置-测点-状态规则测点');
INSERT INTO `clfuncpoint` VALUES (3438, '1021', '查看', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '设备位置-测点-预警规则测点');
INSERT INTO `clfuncpoint` VALUES (3439, '1022', '查询', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '设备位置-测点-预警规则测点');
INSERT INTO `clfuncpoint` VALUES (3440, '1023', '编辑', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '设备位置-测点-预警规则测点');
INSERT INTO `clfuncpoint` VALUES (3441, '1006', '查看', '10021902', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '设备类型-设备型号');
INSERT INTO `clfuncpoint` VALUES (3442, '1007', '删除', '10021902', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '设备类型-设备型号');
INSERT INTO `clfuncpoint` VALUES (3443, '1008', '添加', '10021902', NULL, NULL, NULL, '2021-01-29 12:01:07', 2, NULL, NULL, NULL, NULL, '否', '设备类型-设备型号');
INSERT INTO `clfuncpoint` VALUES (3444, '1009', '编辑', '10021902', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '设备类型-设备型号');
INSERT INTO `clfuncpoint` VALUES (3445, '1010', '查询', '10021902', NULL, NULL, NULL, '2021-01-29 12:01:07', 5, NULL, NULL, NULL, NULL, '否', '设备类型-设备型号');
INSERT INTO `clfuncpoint` VALUES (3446, '1011', '相关属性', '10021902', NULL, NULL, NULL, '2021-01-29 12:01:07', 5, NULL, NULL, NULL, NULL, '否', '设备类型-设备型号');
INSERT INTO `clfuncpoint` VALUES (3447, '1005', '查询', '10022201', NULL, NULL, NULL, '2020-03-25 18:16:31', 2, NULL, NULL, NULL, NULL, '否', '预警规则设置');
INSERT INTO `clfuncpoint` VALUES (3448, '1006', '关联设备', '10022201', NULL, NULL, NULL, '2020-03-25 18:16:31', 4, NULL, NULL, NULL, NULL, '否', '预警规则设置');
INSERT INTO `clfuncpoint` VALUES (3449, '1005', '查询', '10022202', NULL, NULL, NULL, '2020-03-25 18:16:31', 2, NULL, NULL, NULL, NULL, '否', '状态规则设置');
INSERT INTO `clfuncpoint` VALUES (3450, '1006', '关联设备', '10022202', NULL, NULL, NULL, '2020-03-25 18:16:31', 4, NULL, NULL, NULL, NULL, '否', '状态规则设置');
INSERT INTO `clfuncpoint` VALUES (3451, '1010', '实时监控', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 6, NULL, NULL, NULL, NULL, '否', '设备位置-测点-标准测点');
INSERT INTO `clfuncpoint` VALUES (3452, '1024', '查看', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '设备位置-属性');
INSERT INTO `clfuncpoint` VALUES (3453, '1025', '查询', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '设备位置-属性');
INSERT INTO `clfuncpoint` VALUES (3454, '1026', '编辑', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '否', '设备位置-属性');
INSERT INTO `clfuncpoint` VALUES (3455, '1027', '添加', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 1, NULL, NULL, NULL, NULL, '否', '设备位置-属性');
INSERT INTO `clfuncpoint` VALUES (3456, '1028', '删除', '100219', NULL, NULL, NULL, '2021-01-29 12:01:07', 3, NULL, NULL, NULL, NULL, '否', '设备位置-属性');
INSERT INTO `clfuncpoint` VALUES (3457, '1029', '删除', '100219', NULL, NULL, NULL, '2021-02-02 18:51:01', NULL, NULL, NULL, NULL, NULL, '否', '设备位置-测点-预警规则测点');
INSERT INTO `clfuncpoint` VALUES (3458, '1005', '查询', '100208', NULL, NULL, NULL, '2021-02-04 19:39:49', NULL, NULL, NULL, NULL, NULL, '否', '数据集-主题');
INSERT INTO `clfuncpoint` VALUES (3459, '1006', '添加', '100208', NULL, NULL, NULL, '2021-02-04 19:40:44', NULL, NULL, NULL, NULL, NULL, '否', '数据集-主题');
INSERT INTO `clfuncpoint` VALUES (3460, '1007', '删除', '100208', NULL, NULL, NULL, '2021-02-04 19:40:59', NULL, NULL, NULL, NULL, NULL, '否', '数据集-主题');
INSERT INTO `clfuncpoint` VALUES (3461, '1008', '查询', '100208', NULL, NULL, NULL, '2021-02-04 19:41:50', NULL, NULL, NULL, NULL, NULL, '否', '数据集-测点');
INSERT INTO `clfuncpoint` VALUES (3462, '1009', '添加', '100208', NULL, NULL, NULL, '2021-02-04 19:41:58', NULL, NULL, NULL, NULL, NULL, '否', '数据集-测点');
INSERT INTO `clfuncpoint` VALUES (3463, '1010', '删除', '100208', NULL, NULL, NULL, '2021-02-04 19:42:13', NULL, NULL, NULL, NULL, NULL, '否', '数据集-测点');
INSERT INTO `clfuncpoint` VALUES (3464, '1005', '刷新', '100702', NULL, NULL, NULL, '2021-03-04 09:05:30', NULL, NULL, NULL, NULL, NULL, '否', '客户端刷新');
INSERT INTO `clfuncpoint` VALUES (3465, '1003', '添加', '10021903', NULL, NULL, NULL, '2021-01-29 12:01:07', 4, NULL, NULL, NULL, NULL, '是', '设备台账');
INSERT INTO `clfuncpoint` VALUES (3466, '1004', '查看', '100703', NULL, NULL, NULL, '2021-03-04 14:03:31', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3467, '1003', '删除', '100703', NULL, NULL, NULL, '2021-03-04 14:03:31', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3468, '1002', '编辑', '100703', NULL, NULL, NULL, '2021-03-04 14:03:31', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3469, '1001', '添加', '100703', NULL, NULL, NULL, '2021-03-04 14:03:31', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3471, '1010', '重置', '10021802', NULL, NULL, NULL, '2021-03-11 11:29:52', NULL, NULL, NULL, NULL, NULL, '否', '测点集合-重置');
INSERT INTO `clfuncpoint` VALUES (3472, '1011', '详情', '10021802', NULL, NULL, NULL, '2021-03-11 11:33:02', NULL, NULL, NULL, NULL, NULL, '否', '测点集合-详情');
INSERT INTO `clfuncpoint` VALUES (3477, '1009', '添加', '10022003', NULL, NULL, NULL, '2021-03-17 15:36:44', NULL, NULL, NULL, NULL, NULL, '否', '基本信息-添加');
INSERT INTO `clfuncpoint` VALUES (3478, '1010', '删除', '10022003', NULL, NULL, NULL, '2021-03-17 15:37:19', NULL, NULL, NULL, NULL, NULL, '否', '基本信息-删除');
INSERT INTO `clfuncpoint` VALUES (3479, '1011', '编辑', '10022003', NULL, NULL, NULL, '2021-03-17 15:37:43', NULL, NULL, NULL, NULL, NULL, '否', '基本信息-编辑');
INSERT INTO `clfuncpoint` VALUES (3480, '1030', '变更节点', '100219', NULL, NULL, NULL, '2021-04-27 17:57:06', NULL, NULL, NULL, NULL, NULL, '否', '变更节点按钮');
INSERT INTO `clfuncpoint` VALUES (3481, '1032', '挂载当前节点', '100219', NULL, NULL, NULL, '2021-05-21 18:26:20', NULL, NULL, NULL, NULL, NULL, '否', '挂载当前节点');
INSERT INTO `clfuncpoint` VALUES (3482, '1033', '挂载节点', '100219', NULL, NULL, NULL, '2021-05-21 18:26:59', NULL, NULL, NULL, NULL, NULL, '否', '挂载节点');
INSERT INTO `clfuncpoint` VALUES (3487, '1034', '添加', '100219', NULL, NULL, NULL, '2021-07-15 14:58:13', NULL, NULL, NULL, NULL, NULL, '否', '设备下能添加测点等信息');
INSERT INTO `clfuncpoint` VALUES (3488, '1004', '查看', '100305', NULL, NULL, NULL, '2021-07-24 14:40:33', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3489, '1003', '删除', '100305', NULL, NULL, NULL, '2021-07-24 14:40:33', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3490, '1002', '编辑', '100305', NULL, NULL, NULL, '2021-07-24 14:40:33', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3491, '1001', '添加', '100305', NULL, NULL, NULL, '2021-07-24 14:40:33', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3492, '1004', '查看', '100306', NULL, NULL, NULL, '2021-07-28 18:56:13', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3493, '1003', '删除', '100306', NULL, NULL, NULL, '2021-07-28 18:56:13', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3494, '1002', '编辑', '100306', NULL, NULL, NULL, '2021-07-28 18:56:13', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3495, '1001', '添加', '100306', NULL, NULL, NULL, '2021-07-28 18:56:13', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3496, '1004', '查看', '1002210501', NULL, NULL, NULL, '2022-01-14 10:26:43', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3497, '1003', '删除', '1002210501', NULL, NULL, NULL, '2022-01-14 10:26:43', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3498, '1002', '编辑', '1002210501', NULL, NULL, NULL, '2022-01-14 10:26:43', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3499, '1001', '添加', '1002210501', NULL, NULL, NULL, '2022-01-14 10:26:43', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3500, '1004', '查看', '1002210502', NULL, NULL, NULL, '2022-01-14 10:27:17', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3501, '1003', '删除', '1002210502', NULL, NULL, NULL, '2022-01-14 10:27:17', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3502, '1002', '编辑', '1002210502', NULL, NULL, NULL, '2022-01-14 10:27:17', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3503, '1001', '添加', '1002210502', NULL, NULL, NULL, '2022-01-14 10:27:17', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3504, '1004', '查看', '100223', NULL, NULL, NULL, '2022-01-20 09:47:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3505, '1003', '删除', '100223', NULL, NULL, NULL, '2022-01-20 09:47:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3506, '1002', '编辑', '100223', NULL, NULL, NULL, '2022-01-20 09:47:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3507, '1001', '添加', '100223', NULL, NULL, NULL, '2022-01-20 09:47:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3512, '1004', '查看', '1002210503', NULL, NULL, NULL, '2022-02-17 11:37:56', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3513, '1003', '删除', '1002210503', NULL, NULL, NULL, '2022-02-17 11:37:56', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3514, '1002', '编辑', '1002210503', NULL, NULL, NULL, '2022-02-17 11:37:56', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3515, '1001', '添加', '1002210503', NULL, NULL, NULL, '2022-02-17 11:37:56', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3516, '1004', '查看', '1002210504', NULL, NULL, NULL, '2022-03-15 14:39:29', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3517, '1003', '删除', '1002210504', NULL, NULL, NULL, '2022-03-15 14:39:29', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3518, '1002', '编辑', '1002210504', NULL, NULL, NULL, '2022-03-15 14:39:29', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3519, '1001', '添加', '1002210504', NULL, NULL, NULL, '2022-03-15 14:39:29', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (3520, '1004', '测点信息', '1002210601', NULL, NULL, NULL, '2022-03-18 10:16:38', NULL, NULL, NULL, NULL, NULL, '否', '测点计算管理');
INSERT INTO `clfuncpoint` VALUES (3521, '1003', '删除', '1002210601', NULL, NULL, NULL, '2022-03-18 10:16:38', NULL, NULL, NULL, NULL, NULL, '否', '测点计算管理');
INSERT INTO `clfuncpoint` VALUES (3522, '1002', '编辑', '1002210601', NULL, NULL, NULL, '2022-03-18 10:16:38', NULL, NULL, NULL, NULL, NULL, '否', '测点计算管理');
INSERT INTO `clfuncpoint` VALUES (3523, '1001', '添加', '1002210601', NULL, NULL, NULL, '2022-03-18 10:16:38', NULL, NULL, NULL, NULL, NULL, '否', '测点计算管理');
INSERT INTO `clfuncpoint` VALUES (3524, '1004', '查看', '1002210602', NULL, NULL, NULL, '2022-03-28 09:37:23', NULL, NULL, NULL, NULL, NULL, '否', '数据处理服务');
INSERT INTO `clfuncpoint` VALUES (3525, '1003', '删除', '1002210602', NULL, NULL, NULL, '2022-03-28 09:37:23', NULL, NULL, NULL, NULL, NULL, '否', '数据处理服务');
INSERT INTO `clfuncpoint` VALUES (3526, '1002', '编辑', '1002210602', NULL, NULL, NULL, '2022-03-28 09:37:23', NULL, NULL, NULL, NULL, NULL, '否', '数据处理服务');
INSERT INTO `clfuncpoint` VALUES (3527, '1001', '添加', '1002210602', NULL, NULL, NULL, '2022-03-28 09:37:23', NULL, NULL, NULL, NULL, NULL, '否', '数据处理服务');
INSERT INTO `clfuncpoint` VALUES (3532, '1005', '编辑', '1002210601', NULL, NULL, NULL, '2022-04-24 17:56:43', NULL, NULL, NULL, NULL, NULL, '否', 'select语句编辑按钮');
INSERT INTO `clfuncpoint` VALUES (3533, '1006', '编辑', '1002210601', NULL, NULL, NULL, '2022-04-24 18:01:29', NULL, NULL, NULL, NULL, NULL, '否', 'where条件编辑');
INSERT INTO `clfuncpoint` VALUES (3534, '1007', '编辑', '1002210601', NULL, NULL, NULL, '2022-04-24 18:03:09', NULL, NULL, NULL, NULL, NULL, '否', 'groupby条件编辑');
INSERT INTO `clfuncpoint` VALUES (3535, '1008', '测试', '1002210601', NULL, NULL, NULL, '2022-04-25 10:12:18', NULL, NULL, NULL, NULL, NULL, '否', '测试按钮');
INSERT INTO `clfuncpoint` VALUES (3536, '1006', '导入', '10021903', NULL, NULL, NULL, '2022-04-25 10:25:13', NULL, NULL, NULL, NULL, NULL, '是', '设备台账导入');
INSERT INTO `clfuncpoint` VALUES (3537, '1007', '导出', '10021903', NULL, NULL, NULL, '2022-04-25 10:25:27', NULL, NULL, NULL, NULL, NULL, '是', '设备台账导出');
INSERT INTO `clfuncpoint` VALUES (3538, '1008', '修改', '10021903', NULL, NULL, NULL, '2022-04-25 10:26:21', NULL, NULL, NULL, NULL, NULL, '是', '设备台账列表修改');
INSERT INTO `clfuncpoint` VALUES (3539, '1009', '查看属性', '10021903', NULL, NULL, NULL, '2022-04-25 10:26:36', NULL, NULL, NULL, NULL, NULL, '是', '设备台账查看属性');
INSERT INTO `clfuncpoint` VALUES (3540, '1005', '新建', '1002210501', NULL, NULL, NULL, '2022-04-25 10:28:52', 5, NULL, NULL, NULL, NULL, '否', '主题信息');
INSERT INTO `clfuncpoint` VALUES (3541, '1006', '删除', '1002210501', NULL, NULL, NULL, '2022-04-25 10:31:18', NULL, NULL, NULL, NULL, NULL, '否', '主题信息');
INSERT INTO `clfuncpoint` VALUES (3542, '1005', '添加主题', '1002210502', NULL, NULL, NULL, '2022-04-25 10:32:39', NULL, NULL, NULL, NULL, NULL, '否', '主题信息');
INSERT INTO `clfuncpoint` VALUES (3543, '1006', '删除主题', '1002210502', NULL, NULL, NULL, '2022-04-25 10:33:00', NULL, NULL, NULL, NULL, NULL, '否', '主题信息');
INSERT INTO `clfuncpoint` VALUES (3544, '1007', '修改', '1002210501', NULL, NULL, NULL, '2022-04-25 10:34:07', NULL, NULL, NULL, NULL, NULL, '否', '主题信息');
INSERT INTO `clfuncpoint` VALUES (3545, '1008', '加载', '1002210501', NULL, NULL, NULL, '2022-04-25 10:34:29', NULL, NULL, NULL, NULL, NULL, '否', '主题信息');
INSERT INTO `clfuncpoint` VALUES (3546, '1007', '监控', '1002210502', NULL, NULL, NULL, '2022-04-25 10:36:40', NULL, NULL, NULL, NULL, NULL, '否', '桥接服务操作');
INSERT INTO `clfuncpoint` VALUES (3547, '1008', '启动', '1002210502', NULL, NULL, NULL, '2022-04-25 10:37:04', NULL, NULL, NULL, NULL, NULL, '否', '桥接服务操作');
INSERT INTO `clfuncpoint` VALUES (3548, '1009', '停止', '1002210502', NULL, NULL, NULL, '2022-04-25 10:37:53', NULL, NULL, NULL, NULL, NULL, '否', '桥接服务停止');
INSERT INTO `clfuncpoint` VALUES (3549, '1010', '重启', '1002210502', NULL, NULL, NULL, '2022-04-25 10:38:30', NULL, NULL, NULL, NULL, NULL, '否', '桥接服务重启');
INSERT INTO `clfuncpoint` VALUES (3550, '1011', '加载', '1002210502', NULL, NULL, NULL, '2022-04-25 10:38:53', NULL, NULL, NULL, NULL, NULL, '否', '桥接服务');
INSERT INTO `clfuncpoint` VALUES (3551, '1012', '订阅', '1002210502', NULL, NULL, NULL, '2022-04-25 10:40:33', NULL, NULL, NULL, NULL, NULL, '否', '主题信息');
INSERT INTO `clfuncpoint` VALUES (3552, '1005', '自动分配', '1002210503', NULL, NULL, NULL, '2022-04-25 10:41:11', NULL, NULL, NULL, NULL, NULL, '否', '解析服务管理');
INSERT INTO `clfuncpoint` VALUES (3553, '1006', '监控', '1002210503', NULL, NULL, NULL, '2022-04-25 10:42:08', NULL, NULL, NULL, NULL, NULL, '否', '解析服务管理');
INSERT INTO `clfuncpoint` VALUES (3554, '1007', '详情', '1002210503', NULL, NULL, NULL, '2022-04-25 10:42:56', NULL, NULL, NULL, NULL, NULL, '否', '解析服务管理');
INSERT INTO `clfuncpoint` VALUES (3555, '1008', '启动', '1002210503', NULL, NULL, NULL, '2022-04-25 10:43:16', NULL, NULL, NULL, NULL, NULL, '否', '解析服务管理');
INSERT INTO `clfuncpoint` VALUES (3556, '1009', '停止', '1002210503', NULL, NULL, NULL, '2022-04-25 10:43:29', NULL, NULL, NULL, NULL, NULL, '否', '解析服务管理');
INSERT INTO `clfuncpoint` VALUES (3557, '1010', '重启', '1002210503', NULL, NULL, NULL, '2022-04-25 10:44:01', NULL, NULL, NULL, NULL, NULL, '否', '解析服务管理');
INSERT INTO `clfuncpoint` VALUES (3558, '1011', '加载', '1002210503', NULL, NULL, NULL, '2022-04-25 10:44:23', NULL, NULL, NULL, NULL, NULL, '否', '解析服务管理');
INSERT INTO `clfuncpoint` VALUES (3559, '1012', '删除', '1002210503', NULL, NULL, NULL, '2022-04-25 10:44:56', NULL, NULL, NULL, NULL, NULL, '否', '解析服务管理');
INSERT INTO `clfuncpoint` VALUES (3560, '1013', '设备信息', '1002210503', NULL, NULL, NULL, '2022-04-25 10:45:17', NULL, NULL, NULL, NULL, NULL, '否', '解析服务管理');
INSERT INTO `clfuncpoint` VALUES (3561, '1014', '批量删除', '1002210503', NULL, NULL, NULL, '2022-04-25 10:46:35', NULL, NULL, NULL, NULL, NULL, '否', '设备信息');
INSERT INTO `clfuncpoint` VALUES (3562, '1015', '添加', '1002210503', NULL, NULL, NULL, '2022-04-25 10:46:58', NULL, NULL, NULL, NULL, NULL, '否', '设备信息');
INSERT INTO `clfuncpoint` VALUES (3563, '1016', '删除', '1002210503', NULL, NULL, NULL, '2022-04-25 10:47:36', NULL, NULL, NULL, NULL, NULL, '否', '设备信息操作');
INSERT INTO `clfuncpoint` VALUES (3564, '1017', '测点信息', '1002210503', NULL, NULL, NULL, '2022-04-25 10:48:20', NULL, NULL, NULL, NULL, NULL, '否', '设备信息操作');
INSERT INTO `clfuncpoint` VALUES (3565, '1005', '自动分配', '1002210504', NULL, NULL, NULL, '2022-04-25 10:51:15', NULL, NULL, NULL, NULL, NULL, '否', '存储服务管理');
INSERT INTO `clfuncpoint` VALUES (3566, '1006', '批量删除', '1002210504', NULL, NULL, NULL, '2022-04-25 10:51:40', NULL, NULL, NULL, NULL, NULL, '否', '存储服务管理');
INSERT INTO `clfuncpoint` VALUES (3567, '1007', '监控', '1002210504', NULL, NULL, NULL, '2022-04-25 10:52:16', NULL, NULL, NULL, NULL, NULL, '否', '存储服务管理操作');
INSERT INTO `clfuncpoint` VALUES (3568, '1008', '服务详情', '1002210504', NULL, NULL, NULL, '2022-04-25 10:52:33', NULL, NULL, NULL, NULL, NULL, '否', '存储服务管理操作');
INSERT INTO `clfuncpoint` VALUES (3569, '1009', '启动', '1002210504', NULL, NULL, NULL, '2022-04-25 10:52:54', NULL, NULL, NULL, NULL, NULL, '否', '存储服务管理操作');
INSERT INTO `clfuncpoint` VALUES (3570, '1010', '停止', '1002210504', NULL, NULL, NULL, '2022-04-25 10:53:06', NULL, NULL, NULL, NULL, NULL, '否', '存储服务管理操作');
INSERT INTO `clfuncpoint` VALUES (3571, '1011', '重启', '1002210504', NULL, NULL, NULL, '2022-04-25 10:53:23', NULL, NULL, NULL, NULL, NULL, '否', '存储服务管理操作');
INSERT INTO `clfuncpoint` VALUES (3572, '1012', '加载', '1002210504', NULL, NULL, NULL, '2022-04-25 10:53:39', NULL, NULL, NULL, NULL, NULL, '否', '存储服务管理操作');
INSERT INTO `clfuncpoint` VALUES (3573, '1013', '设备信息', '1002210504', NULL, NULL, NULL, '2022-04-25 10:53:59', NULL, NULL, NULL, NULL, NULL, '否', '存储服务管理操作');
INSERT INTO `clfuncpoint` VALUES (3574, '1014', '删除', '1002210504', NULL, NULL, NULL, '2022-04-25 10:54:55', NULL, NULL, NULL, NULL, NULL, '否', '设备信息列表');
INSERT INTO `clfuncpoint` VALUES (3575, '1015', '测点信息', '1002210504', NULL, NULL, NULL, '2022-04-25 10:55:13', NULL, NULL, NULL, NULL, NULL, '否', '设备信息列表');
INSERT INTO `clfuncpoint` VALUES (3576, '1009', '批量删除', '1002210601', NULL, NULL, NULL, '2022-04-25 11:01:26', NULL, NULL, NULL, NULL, NULL, '否', '测点计算管理');
INSERT INTO `clfuncpoint` VALUES (3577, '1010', '任务管理', '1002210601', NULL, NULL, NULL, '2022-04-25 11:12:14', NULL, NULL, NULL, NULL, NULL, '否', '测点计算管理操作');
INSERT INTO `clfuncpoint` VALUES (3578, '1011', '添加', '1002210601', NULL, NULL, NULL, '2022-04-25 11:20:57', NULL, NULL, NULL, NULL, NULL, '否', '任务管理');
INSERT INTO `clfuncpoint` VALUES (3579, '1012', '批量删除', '1002210601', NULL, NULL, NULL, '2022-04-25 11:21:12', NULL, NULL, NULL, NULL, NULL, '否', '任务管理');
INSERT INTO `clfuncpoint` VALUES (3580, '1013', '修改', '1002210601', NULL, NULL, NULL, '2022-04-25 11:21:41', NULL, NULL, NULL, NULL, NULL, '否', '任务管理');
INSERT INTO `clfuncpoint` VALUES (3581, '1014', '运行记录', '1002210601', NULL, NULL, NULL, '2022-04-25 11:21:57', NULL, NULL, NULL, NULL, NULL, '否', '任务管理');
INSERT INTO `clfuncpoint` VALUES (3582, '1015', '启动', '1002210601', NULL, NULL, NULL, '2022-04-25 11:22:10', NULL, NULL, NULL, NULL, NULL, '否', '任务管理');
INSERT INTO `clfuncpoint` VALUES (3583, '1016', '停止', '1002210601', NULL, NULL, NULL, '2022-04-25 11:22:19', NULL, NULL, NULL, NULL, NULL, '否', '任务管理');
INSERT INTO `clfuncpoint` VALUES (3584, '1017', '删除', '1002210601', NULL, NULL, NULL, '2022-04-25 14:06:36', NULL, NULL, NULL, NULL, NULL, '否', '任务管理');
INSERT INTO `clfuncpoint` VALUES (3585, '1018', '测点信息', '1002210601', NULL, NULL, NULL, '2022-04-25 14:06:56', NULL, NULL, NULL, NULL, NULL, '否', '任务管理');
INSERT INTO `clfuncpoint` VALUES (3586, '1005', '批量删除', '1002210602', NULL, NULL, NULL, '2022-04-25 15:12:21', NULL, NULL, NULL, NULL, NULL, '否', '数据处理服务');
INSERT INTO `clfuncpoint` VALUES (3587, '1006', '监控', '1002210602', NULL, NULL, NULL, '2022-04-25 15:14:35', NULL, NULL, NULL, NULL, NULL, '否', '数据处理服务操作');
INSERT INTO `clfuncpoint` VALUES (3588, '1007', '服务详情', '1002210602', NULL, NULL, NULL, '2022-04-25 15:14:59', NULL, NULL, NULL, NULL, NULL, '否', '数据处理服务操作');
INSERT INTO `clfuncpoint` VALUES (3589, '1008', '启动', '1002210602', NULL, NULL, NULL, '2022-04-25 15:18:36', NULL, NULL, NULL, NULL, NULL, '否', '数据处理服务操作');
INSERT INTO `clfuncpoint` VALUES (3590, '1009', '停止', '1002210602', NULL, NULL, NULL, '2022-04-25 15:18:47', NULL, NULL, NULL, NULL, NULL, '否', '数据处理服务操作');
INSERT INTO `clfuncpoint` VALUES (3591, '1010', '重启', '1002210602', NULL, NULL, NULL, '2022-04-25 15:18:55', NULL, NULL, NULL, NULL, NULL, '否', '数据处理服务操作');
INSERT INTO `clfuncpoint` VALUES (3592, '1011', '加载', '1002210602', NULL, NULL, NULL, '2022-04-25 15:19:10', NULL, NULL, NULL, NULL, NULL, '否', '数据处理服务操作');
INSERT INTO `clfuncpoint` VALUES (3593, '1012', '测点信息', '1002210602', NULL, NULL, NULL, '2022-04-25 15:19:26', NULL, NULL, NULL, NULL, NULL, '否', '数据处理服务操作');
INSERT INTO `clfuncpoint` VALUES (3594, '1013', '添加', '1002210602', NULL, NULL, NULL, '2022-04-25 15:20:05', NULL, NULL, NULL, NULL, NULL, '否', '测点信息列表');
INSERT INTO `clfuncpoint` VALUES (3595, '1014', '批量删除', '1002210602', NULL, NULL, NULL, '2022-04-25 15:20:16', NULL, NULL, NULL, NULL, NULL, '否', '测点信息列表');
INSERT INTO `clfuncpoint` VALUES (3596, '1015', '历史数据', '1002210602', NULL, NULL, NULL, '2022-04-25 15:20:45', NULL, NULL, NULL, NULL, NULL, '否', '测点信息列表操作');
INSERT INTO `clfuncpoint` VALUES (3597, '1016', '修改测点数据', '1002210602', NULL, NULL, NULL, '2022-04-25 15:21:23', NULL, NULL, NULL, NULL, NULL, '否', '测点信息列表操作');
INSERT INTO `clfuncpoint` VALUES (3598, '1017', '测点详情', '1002210602', NULL, NULL, NULL, '2022-04-25 15:21:39', NULL, NULL, NULL, NULL, NULL, '否', '测点信息列表操作');
INSERT INTO `clfuncpoint` VALUES (3599, '1018', '删除', '1002210602', NULL, NULL, NULL, '2022-04-25 15:21:50', NULL, NULL, NULL, NULL, NULL, '否', '测点信息列表操作');
INSERT INTO `clfuncpoint` VALUES (3600, '1009', '导出', '10021801', NULL, NULL, NULL, '2022-04-28 15:17:09', NULL, NULL, NULL, NULL, NULL, '否', '导出标准测点信息');
INSERT INTO `clfuncpoint` VALUES (5370, '1004', '查看', '4000100303', NULL, NULL, NULL, '2023-01-11 15:21:08', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5371, '1003', '删除', '4000100303', NULL, NULL, NULL, '2023-01-11 15:21:08', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5372, '1002', '编辑', '4000100303', NULL, NULL, NULL, '2023-01-11 15:21:08', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5373, '1001', '添加', '4000100303', NULL, NULL, NULL, '2023-01-11 15:21:08', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5540, '1004', '查看', '1000001', NULL, NULL, NULL, '2023-04-27 15:20:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5541, '1003', '删除', '1000001', NULL, NULL, NULL, '2023-04-27 15:20:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5542, '1002', '编辑', '1000001', NULL, NULL, NULL, '2023-04-27 15:20:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5543, '1001', '添加', '1000001', NULL, NULL, NULL, '2023-04-27 15:20:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5656, '1004', '查看', '100224', NULL, NULL, NULL, '2023-05-19 10:56:23', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5657, '1003', '删除', '100224', NULL, NULL, NULL, '2023-05-19 10:56:23', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5658, '1002', '编辑', '100224', NULL, NULL, NULL, '2023-05-19 10:56:23', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5659, '1001', '添加', '100224', NULL, NULL, NULL, '2023-05-19 10:56:23', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5660, '1004', '查询', '10000101', NULL, NULL, NULL, '2023-05-24 13:53:31', NULL, NULL, NULL, NULL, '2023-06-15 10:52:36', '否', '查询');
INSERT INTO `clfuncpoint` VALUES (5661, '1003', '删除', '10000101', NULL, NULL, NULL, '2023-05-24 13:53:31', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5662, '1002', '编辑', '10000101', NULL, NULL, NULL, '2023-05-24 13:53:31', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5663, '1001', '添加', '10000101', NULL, NULL, NULL, '2023-05-24 13:53:31', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5664, '1004', '查看', '10000102', NULL, NULL, NULL, '2023-05-24 14:00:57', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5665, '1003', '删除', '10000102', NULL, NULL, NULL, '2023-05-24 14:00:57', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5666, '1002', '编辑', '10000102', NULL, NULL, NULL, '2023-05-24 14:00:57', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5667, '1001', '添加', '10000102', NULL, NULL, NULL, '2023-05-24 14:00:57', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5668, '1004', '查看', '10000103', NULL, NULL, NULL, '2023-05-24 17:02:11', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5669, '1003', '删除', '10000103', NULL, NULL, NULL, '2023-05-24 17:02:11', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5670, '1002', '编辑', '10000103', NULL, NULL, NULL, '2023-05-24 17:02:11', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5671, '1001', '添加', '10000103', NULL, NULL, NULL, '2023-05-24 17:02:11', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5672, '1004', '查看', '10000104', NULL, NULL, NULL, '2023-05-29 14:36:42', NULL, NULL, NULL, NULL, NULL, '是', NULL);
INSERT INTO `clfuncpoint` VALUES (5673, '1003', '删除', '10000104', NULL, NULL, NULL, '2023-05-29 14:36:42', NULL, NULL, NULL, NULL, NULL, '是', NULL);
INSERT INTO `clfuncpoint` VALUES (5674, '1002', '编辑', '10000104', NULL, NULL, NULL, '2023-05-29 14:36:42', NULL, NULL, NULL, NULL, NULL, '是', NULL);
INSERT INTO `clfuncpoint` VALUES (5675, '1001', '添加', '10000104', NULL, NULL, NULL, '2023-05-29 14:36:42', NULL, NULL, NULL, NULL, NULL, '是', NULL);
INSERT INTO `clfuncpoint` VALUES (5676, '1004', '查看', '10000201', NULL, NULL, NULL, '2023-06-01 09:27:40', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5677, '1003', '删除', '10000201', NULL, NULL, NULL, '2023-06-01 09:27:40', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5678, '1002', '编辑', '10000201', NULL, NULL, NULL, '2023-06-01 09:27:40', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5679, '1001', '添加', '10000201', NULL, NULL, NULL, '2023-06-01 09:27:40', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5680, '1004', '查看', '10000202', NULL, NULL, NULL, '2023-06-01 09:28:38', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5681, '1003', '删除', '10000202', NULL, NULL, NULL, '2023-06-01 09:28:38', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5682, '1002', '编辑', '10000202', NULL, NULL, NULL, '2023-06-01 09:28:38', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5683, '1001', '添加', '10000202', NULL, NULL, NULL, '2023-06-01 09:28:38', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5684, '1004', '查看', '100225', NULL, NULL, NULL, '2023-06-02 09:31:25', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5685, '1003', '删除', '100225', NULL, NULL, NULL, '2023-06-02 09:31:25', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5686, '1002', '编辑', '100225', NULL, NULL, NULL, '2023-06-02 09:31:25', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5687, '1001', '添加', '100225', NULL, NULL, NULL, '2023-06-02 09:31:25', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5688, '1004', '查看', '100226', NULL, NULL, NULL, '2023-06-02 09:36:51', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5689, '1003', '删除', '100226', NULL, NULL, NULL, '2023-06-02 09:36:51', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5690, '1002', '编辑', '100226', NULL, NULL, NULL, '2023-06-02 09:36:51', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5691, '1001', '添加', '100226', NULL, NULL, NULL, '2023-06-02 09:36:51', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5692, '1004', '查看', '10022107', NULL, NULL, NULL, '2023-06-02 19:02:24', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5693, '1003', '删除', '10022107', NULL, NULL, NULL, '2023-06-02 19:02:24', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5694, '1002', '编辑', '10022107', NULL, NULL, NULL, '2023-06-02 19:02:24', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5695, '1001', '添加', '10022107', NULL, NULL, NULL, '2023-06-02 19:02:24', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5696, '1005', '查询', '100225', NULL, NULL, NULL, '2023-06-07 15:16:52', NULL, NULL, NULL, NULL, NULL, '否', '查询');
INSERT INTO `clfuncpoint` VALUES (5697, '1004', '查看', '100227', NULL, NULL, NULL, '2023-10-09 09:56:08', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5698, '1003', '删除', '100227', NULL, NULL, NULL, '2023-10-09 09:56:08', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5699, '1002', '编辑', '100227', NULL, NULL, NULL, '2023-10-09 09:56:08', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5700, '1001', '添加', '100227', NULL, NULL, NULL, '2023-10-09 09:56:08', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5701, '1004', '查看', '10022004', NULL, NULL, NULL, '2023-10-17 09:35:24', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5702, '1003', '删除', '10022004', NULL, NULL, NULL, '2023-10-17 09:35:24', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5703, '1002', '编辑', '10022004', NULL, NULL, NULL, '2023-10-17 09:35:24', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5704, '1001', '添加', '10022004', NULL, NULL, NULL, '2023-10-17 09:35:24', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5705, '1004', '查看', '10022005', NULL, NULL, NULL, '2023-10-25 09:21:05', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5706, '1003', '删除', '10022005', NULL, NULL, NULL, '2023-10-25 09:21:05', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5707, '1002', '编辑', '10022005', NULL, NULL, NULL, '2023-10-25 09:21:05', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5708, '1001', '添加', '10022005', NULL, NULL, NULL, '2023-10-25 09:21:05', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5709, '1004', '查看', '10021904', NULL, NULL, NULL, '2022-01-20 09:47:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5710, '1003', '删除', '10021904', NULL, NULL, NULL, '2022-01-20 09:47:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5711, '1002', '编辑', '10021904', NULL, NULL, NULL, '2022-01-20 09:47:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5712, '1001', '添加', '10021904', NULL, NULL, NULL, '2022-01-20 09:47:07', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5713, '1004', '查看', '10022108', NULL, NULL, NULL, '2023-11-09 09:33:39', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5714, '1003', '删除', '10022108', NULL, NULL, NULL, '2023-11-09 09:33:39', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5715, '1002', '编辑', '10022108', NULL, NULL, NULL, '2023-11-09 09:33:39', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5716, '1001', '添加', '10022108', NULL, NULL, NULL, '2023-11-09 09:33:39', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5717, '1004', '查看', '10022109', NULL, NULL, NULL, '2023-11-24 09:55:19', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5718, '1003', '删除', '10022109', NULL, NULL, NULL, '2023-11-24 09:55:19', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5719, '1002', '编辑', '10022109', NULL, NULL, NULL, '2023-11-24 09:55:19', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5720, '1001', '添加', '10022109', NULL, NULL, NULL, '2023-11-24 09:55:19', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5721, '1004', '查看', '1002210505', NULL, NULL, NULL, '2024-01-08 16:19:49', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5722, '1003', '删除', '1002210505', NULL, NULL, NULL, '2024-01-08 16:19:49', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5723, '1002', '编辑', '1002210505', NULL, NULL, NULL, '2024-01-08 16:19:49', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5724, '1001', '添加', '1002210505', NULL, NULL, NULL, '2024-01-08 16:19:49', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5725, '1005', '安装', '1002210505', NULL, NULL, NULL, '2024-01-10 11:31:45', NULL, NULL, NULL, NULL, NULL, '否', '安装');
INSERT INTO `clfuncpoint` VALUES (5726, '1006', '更新', '1002210505', NULL, NULL, NULL, '2024-01-10 11:32:06', NULL, NULL, NULL, NULL, NULL, '否', '更新');
INSERT INTO `clfuncpoint` VALUES (5727, '1007', '配置', '1002210505', NULL, NULL, NULL, '2024-01-10 11:32:28', NULL, NULL, NULL, NULL, NULL, '否', '配置');
INSERT INTO `clfuncpoint` VALUES (5728, '1013', '更新服务', '1002210502', NULL, NULL, NULL, '2024-01-10 13:59:09', NULL, NULL, NULL, NULL, NULL, '否', '更新服务');
INSERT INTO `clfuncpoint` VALUES (5729, '1014', '安装服务', '1002210502', NULL, NULL, NULL, '2024-01-10 13:59:28', NULL, NULL, NULL, NULL, NULL, '否', '安装服务');
INSERT INTO `clfuncpoint` VALUES (5730, '1015', '配置服务', '1002210502', NULL, NULL, NULL, '2024-01-10 13:59:51', NULL, NULL, NULL, NULL, NULL, '否', '配置服务');
INSERT INTO `clfuncpoint` VALUES (5731, '1018', '安装服务', '1002210503', NULL, NULL, NULL, '2024-01-10 14:06:23', NULL, NULL, NULL, NULL, NULL, '否', '安装服务');
INSERT INTO `clfuncpoint` VALUES (5732, '1019', '更新服务', '1002210503', NULL, NULL, NULL, '2024-01-10 14:07:17', NULL, NULL, NULL, NULL, NULL, '否', '更新服务');
INSERT INTO `clfuncpoint` VALUES (5733, '1020', '配置服务', '1002210503', NULL, NULL, NULL, '2024-01-10 14:07:18', NULL, NULL, NULL, NULL, '2024-01-10 14:10:28', '否', '配置服务');
INSERT INTO `clfuncpoint` VALUES (5734, '1021', '安装服务移除', '1002210503', NULL, NULL, NULL, '2024-01-10 14:08:39', NULL, NULL, NULL, NULL, '2024-01-10 14:10:14', '否', '安装服务移除');
INSERT INTO `clfuncpoint` VALUES (5735, '1016', '安装', '1002210504', NULL, NULL, NULL, '2024-01-10 14:24:25', NULL, NULL, NULL, NULL, NULL, '否', '安装');
INSERT INTO `clfuncpoint` VALUES (5736, '1017', '更新', '1002210504', NULL, NULL, NULL, '2024-01-10 14:24:39', NULL, NULL, NULL, NULL, NULL, '否', '更新');
INSERT INTO `clfuncpoint` VALUES (5737, '1018', '配置', '1002210504', NULL, NULL, NULL, '2024-01-10 14:24:52', NULL, NULL, NULL, NULL, NULL, '否', '配置');
INSERT INTO `clfuncpoint` VALUES (5738, '1019', '安装', '1002210602', NULL, NULL, NULL, '2024-01-10 14:28:55', NULL, NULL, NULL, NULL, NULL, '否', '安装');
INSERT INTO `clfuncpoint` VALUES (5739, '1020', '更新', '1002210602', NULL, NULL, NULL, '2024-01-10 14:29:04', NULL, NULL, NULL, NULL, NULL, '否', '更新');
INSERT INTO `clfuncpoint` VALUES (5740, '1021', '配置', '1002210602', NULL, NULL, NULL, '2024-01-10 14:29:13', NULL, NULL, NULL, NULL, NULL, '否', '配置');
INSERT INTO `clfuncpoint` VALUES (5741, '1008', '监控', '1002210505', NULL, NULL, NULL, '2024-01-10 14:34:20', NULL, NULL, NULL, NULL, NULL, '否', '监控');
INSERT INTO `clfuncpoint` VALUES (5742, '1009', '详情', '1002210505', NULL, NULL, NULL, '2024-01-10 14:34:33', NULL, NULL, NULL, NULL, NULL, '否', '详情');
INSERT INTO `clfuncpoint` VALUES (5743, '1010', '启动', '1002210505', NULL, NULL, NULL, '2024-01-10 14:34:50', NULL, NULL, NULL, NULL, NULL, '否', '启动');
INSERT INTO `clfuncpoint` VALUES (5744, '1011', '停止', '1002210505', NULL, NULL, NULL, '2024-01-10 14:35:01', NULL, NULL, NULL, NULL, NULL, '否', '停止');
INSERT INTO `clfuncpoint` VALUES (5745, '1012', '重启', '1002210505', NULL, NULL, NULL, '2024-01-10 14:35:10', NULL, NULL, NULL, NULL, NULL, '否', '重启');
INSERT INTO `clfuncpoint` VALUES (5746, '1013', '加载', '1002210505', NULL, NULL, NULL, '2024-01-10 14:35:30', NULL, NULL, NULL, NULL, NULL, '否', '加载');
INSERT INTO `clfuncpoint` VALUES (5747, '1014', '日志', '1002210505', NULL, NULL, NULL, '2024-01-10 14:35:42', NULL, NULL, NULL, NULL, NULL, '否', '日志');
INSERT INTO `clfuncpoint` VALUES (5748, '1005', '安装服务', '10022107', NULL, NULL, NULL, '2024-01-10 14:45:23', NULL, NULL, NULL, NULL, NULL, '否', '安装服务');
INSERT INTO `clfuncpoint` VALUES (5749, '1006', '更新服务', '10022107', NULL, NULL, NULL, '2024-01-10 14:45:38', NULL, NULL, NULL, NULL, NULL, '否', '更新服务');
INSERT INTO `clfuncpoint` VALUES (5750, '1007', '终端', '10022107', NULL, NULL, NULL, '2024-01-18 16:03:05', NULL, NULL, NULL, NULL, NULL, '否', '终端');
INSERT INTO `clfuncpoint` VALUES (5751, '1005', '终端', '10022109', NULL, NULL, NULL, '2024-01-18 16:03:28', NULL, NULL, NULL, NULL, NULL, '否', '终端');
INSERT INTO `clfuncpoint` VALUES (5752, '1005', '刷新', '10022005', NULL, NULL, NULL, '2024-01-25 14:26:03', NULL, NULL, NULL, NULL, NULL, '否', '刷新');
INSERT INTO `clfuncpoint` VALUES (5753, '1008', '配置管理', '10022107', NULL, NULL, NULL, '2024-01-25 14:32:58', NULL, NULL, NULL, NULL, NULL, '否', '配置管理');
INSERT INTO `clfuncpoint` VALUES (5754, '1004', '查看', '10000301', NULL, NULL, NULL, '2024-03-28 14:15:51', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5755, '1003', '删除', '10000301', NULL, NULL, NULL, '2024-03-28 14:15:51', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5756, '1002', '编辑', '10000301', NULL, NULL, NULL, '2024-03-28 14:15:51', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5757, '1001', '添加', '10000301', NULL, NULL, NULL, '2024-03-28 14:15:51', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5758, '1006', '导入', '10022005', NULL, NULL, NULL, '2024-05-11 15:24:06', NULL, NULL, NULL, NULL, '2024-05-24 17:28:39', '否', '测点信息--导入');
INSERT INTO `clfuncpoint` VALUES (5759, '1007', '导出', '10022005', NULL, NULL, NULL, '2024-05-24 17:29:13', NULL, NULL, NULL, NULL, NULL, '否', '测点信息--导出');
INSERT INTO `clfuncpoint` VALUES (5760, '1008', '添加', '10022005', NULL, NULL, NULL, '2024-05-27 15:47:34', NULL, NULL, NULL, NULL, NULL, '否', '测点信息--添加');
INSERT INTO `clfuncpoint` VALUES (5761, '1009', '删除', '10022005', NULL, NULL, NULL, '2024-05-27 15:48:07', NULL, NULL, NULL, NULL, NULL, '否', '测点信息--删除');
INSERT INTO `clfuncpoint` VALUES (5762, '1010', '编辑', '10022005', NULL, NULL, NULL, '2024-05-27 15:48:41', NULL, NULL, NULL, NULL, NULL, '否', '测点信息--编辑');
INSERT INTO `clfuncpoint` VALUES (5763, '1035', '历史数据', '100219', NULL, NULL, NULL, '2024-05-27 15:55:34', NULL, NULL, NULL, NULL, NULL, '否', '采集测点--历史数据');
INSERT INTO `clfuncpoint` VALUES (5764, '1036', '编辑', '100219', NULL, NULL, NULL, '2024-05-27 15:56:36', NULL, NULL, NULL, NULL, NULL, '否', '采集测点--编辑');
INSERT INTO `clfuncpoint` VALUES (5765, '1037', '历史数据', '100219', NULL, NULL, NULL, '2024-05-27 15:58:24', NULL, NULL, NULL, NULL, NULL, '否', '计算测点--历史数据');
INSERT INTO `clfuncpoint` VALUES (5766, '1038', '编辑', '100219', NULL, NULL, NULL, '2024-05-27 15:59:42', NULL, NULL, NULL, NULL, NULL, '否', '计算测点--编辑');
INSERT INTO `clfuncpoint` VALUES (5767, '1004', '查看', '10000302', NULL, NULL, NULL, '2024-06-18 10:22:03', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5768, '1003', '删除', '10000302', NULL, NULL, NULL, '2024-06-18 10:22:03', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5769, '1002', '编辑', '10000302', NULL, NULL, NULL, '2024-06-18 10:22:03', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5770, '1001', '添加', '10000302', NULL, NULL, NULL, '2024-06-18 10:22:03', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5771, '1006', '导入', '100225', NULL, NULL, NULL, '2024-07-10 16:26:37', NULL, NULL, NULL, NULL, NULL, '否', '导入');
INSERT INTO `clfuncpoint` VALUES (5772, '1007', '导出', '100225', NULL, NULL, NULL, '2024-07-10 16:27:10', NULL, NULL, NULL, NULL, NULL, '否', '导出');
INSERT INTO `clfuncpoint` VALUES (5773, '1008', '添加', '100225', NULL, NULL, NULL, '2024-07-10 16:30:58', NULL, NULL, NULL, NULL, NULL, '否', '添加--原始测点');
INSERT INTO `clfuncpoint` VALUES (5774, '1009', '删除', '100225', NULL, NULL, NULL, '2024-07-10 16:31:13', NULL, NULL, NULL, NULL, NULL, '否', '删除--原始测点');
INSERT INTO `clfuncpoint` VALUES (5775, '1010', '编辑', '100225', NULL, NULL, NULL, '2024-07-10 16:31:47', NULL, NULL, NULL, NULL, NULL, '否', '编辑--原始测点');
INSERT INTO `clfuncpoint` VALUES (5776, '1011', '历史数据', '100225', NULL, NULL, NULL, '2024-07-10 16:32:14', NULL, NULL, NULL, NULL, NULL, '否', '历史数据--原始测点');
INSERT INTO `clfuncpoint` VALUES (5777, '1012', '保存', '100225', NULL, NULL, NULL, '2024-07-10 16:39:14', NULL, NULL, NULL, NULL, NULL, '否', '保存--模拟数据');
INSERT INTO `clfuncpoint` VALUES (5778, '1004', '查看', '101301', NULL, NULL, NULL, '2024-08-16 09:34:49', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5779, '1003', '删除', '101301', NULL, NULL, NULL, '2024-08-16 09:34:49', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5780, '1002', '编辑', '101301', NULL, NULL, NULL, '2024-08-16 09:34:49', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5781, '1001', '添加', '101301', NULL, NULL, NULL, '2024-08-16 09:34:49', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5782, '1004', '查看', '10000303', NULL, NULL, NULL, '2024-09-19 10:56:39', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5783, '1003', '删除', '10000303', NULL, NULL, NULL, '2024-09-19 10:56:39', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5784, '1002', '编辑', '10000303', NULL, NULL, NULL, '2024-09-19 10:56:39', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5785, '1001', '添加', '10000303', NULL, NULL, NULL, '2024-09-19 10:56:39', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5786, '1004', '查看', '101302', NULL, NULL, NULL, '2024-10-21 14:25:35', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5787, '1003', '删除', '101302', NULL, NULL, NULL, '2024-10-21 14:25:35', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5788, '1002', '编辑', '101302', NULL, NULL, NULL, '2024-10-21 14:25:35', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5789, '1001', '添加', '101302', NULL, NULL, NULL, '2024-10-21 14:25:35', NULL, NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clfuncpoint` VALUES (5790, '1039', '告警配置', '100219', NULL, NULL, NULL, '2024-11-15 10:06:22', NULL, NULL, NULL, NULL, NULL, '否', '采集测点');
INSERT INTO `clfuncpoint` VALUES (5791, '1040', '告警配置', '100219', NULL, NULL, NULL, '2024-11-15 10:07:01', NULL, NULL, NULL, NULL, NULL, '否', '计算测点');
INSERT INTO `clfuncpoint` VALUES (5792, '1004', '查看', '101303', NULL, NULL, NULL, '2024-11-28 11:36:58', 4, NULL, NULL, NULL, '2024-12-31 11:17:31', '否', '查看');
INSERT INTO `clfuncpoint` VALUES (5793, '1003', '删除', '101303', NULL, NULL, NULL, '2024-11-28 11:36:58', 3, NULL, NULL, NULL, '2024-12-31 11:17:24', '否', '删除');
INSERT INTO `clfuncpoint` VALUES (5794, '1002', '编辑', '101303', NULL, NULL, NULL, '2024-11-28 11:36:58', 2, NULL, NULL, NULL, '2024-12-31 11:17:17', '否', '编辑');
INSERT INTO `clfuncpoint` VALUES (5795, '1001', '添加', '101303', NULL, NULL, NULL, '2024-11-28 11:36:58', 1, NULL, NULL, NULL, '2024-12-31 11:17:10', '否', '添加');
INSERT INTO `clfuncpoint` VALUES (5796, '1005', '查询', '101301', NULL, NULL, NULL, '2024-12-31 10:09:21', 5, NULL, NULL, NULL, '2024-12-31 10:13:38', '否', '查询');
INSERT INTO `clfuncpoint` VALUES (5797, '1005', '添加', '101302', NULL, NULL, NULL, '2024-12-31 10:41:11', 5, NULL, NULL, NULL, '2024-12-31 10:41:21', '否', '配置');
INSERT INTO `clfuncpoint` VALUES (5798, '1006', '编辑', '101302', NULL, NULL, NULL, '2024-12-31 10:41:43', 6, NULL, NULL, NULL, '2024-12-31 10:41:51', '否', '配置');
INSERT INTO `clfuncpoint` VALUES (5799, '1007', '删除', '101302', NULL, NULL, NULL, '2024-12-31 10:42:15', 7, NULL, NULL, NULL, '2024-12-31 10:42:52', '否', '配置');
INSERT INTO `clfuncpoint` VALUES (5800, '1008', '查看', '101302', NULL, NULL, NULL, '2024-12-31 10:42:29', 8, NULL, NULL, NULL, '2024-12-31 10:43:00', '否', '配置');
INSERT INTO `clfuncpoint` VALUES (5801, '1009', '手动执行', '101302', NULL, NULL, NULL, '2024-12-31 10:45:18', 9, NULL, NULL, NULL, '2024-12-31 10:46:26', '否', '配置 - 接口');
INSERT INTO `clfuncpoint` VALUES (5802, '1010', '接口启动', '101302', NULL, NULL, NULL, '2024-12-31 10:45:37', 10, NULL, NULL, NULL, '2024-12-31 10:46:31', '否', '配置 - 接口');
INSERT INTO `clfuncpoint` VALUES (5803, '1011', '接口停止', '101302', NULL, NULL, NULL, '2024-12-31 10:45:51', 11, NULL, NULL, NULL, '2024-12-31 10:46:35', '否', '配置 - 接口');
INSERT INTO `clfuncpoint` VALUES (5804, '1012', '运行实例', '101302', NULL, NULL, NULL, '2024-12-31 10:46:04', 12, NULL, NULL, NULL, '2024-12-31 10:46:39', '否', '配置 - 接口');
INSERT INTO `clfuncpoint` VALUES (5805, '1013', '添加', '101302', NULL, NULL, NULL, '2024-12-31 10:48:01', 13, NULL, NULL, NULL, '2024-12-31 11:07:10', '否', '接口 - 请求参数');
INSERT INTO `clfuncpoint` VALUES (5806, '1014', '编辑', '101302', NULL, NULL, NULL, '2024-12-31 10:49:02', 14, NULL, NULL, NULL, '2024-12-31 11:07:19', '否', '接口 - 请求参数');
INSERT INTO `clfuncpoint` VALUES (5807, '1015', '删除', '101302', NULL, NULL, NULL, '2024-12-31 10:49:17', 15, NULL, NULL, NULL, '2024-12-31 11:07:25', '否', '接口 - 请求参数');
INSERT INTO `clfuncpoint` VALUES (5808, '1016', '查看', '101302', NULL, NULL, NULL, '2024-12-31 10:49:41', 16, NULL, NULL, NULL, '2024-12-31 11:07:31', '否', '接口 - 请求参数');
INSERT INTO `clfuncpoint` VALUES (5809, '1017', '添加', '101302', NULL, NULL, NULL, '2024-12-31 10:50:46', 17, NULL, NULL, NULL, '2024-12-31 11:07:36', '否', '接口 - 结果参数');
INSERT INTO `clfuncpoint` VALUES (5810, '1018', '编辑', '101302', NULL, NULL, NULL, '2024-12-31 10:50:57', 18, NULL, NULL, NULL, '2024-12-31 11:07:42', '否', '接口 - 结果参数');
INSERT INTO `clfuncpoint` VALUES (5811, '1019', '删除', '101302', NULL, NULL, NULL, '2024-12-31 10:51:08', 19, NULL, NULL, NULL, '2024-12-31 11:07:47', '否', '接口 - 结果参数');
INSERT INTO `clfuncpoint` VALUES (5812, '1020', '查看', '101302', NULL, NULL, NULL, '2024-12-31 10:51:35', 20, NULL, NULL, NULL, '2024-12-31 11:07:51', '否', '接口 - 结果参数');
INSERT INTO `clfuncpoint` VALUES (5813, '1021', '数据发布', '101302', NULL, NULL, NULL, '2024-12-31 10:52:12', 21, NULL, NULL, NULL, '2024-12-31 10:52:28', '否', '接口结果参数');
INSERT INTO `clfuncpoint` VALUES (5814, '1022', '数据重新发布', '101302', NULL, NULL, NULL, '2024-12-31 10:52:25', 22, NULL, NULL, NULL, '2024-12-31 10:52:34', '否', '接口结果参数');
INSERT INTO `clfuncpoint` VALUES (5833, '1005', '授权', '101303', NULL, NULL, NULL, '2025-01-08 10:50:23', 5, NULL, NULL, NULL, '2025-01-08 10:50:27', '否', '授权');
INSERT INTO `clfuncpoint` VALUES (5834, '1006', '添加', '101303', NULL, NULL, NULL, '2025-01-15 09:47:25', 6, NULL, NULL, NULL, '2025-01-15 09:49:12', '否', '添加 - 授权用户');
INSERT INTO `clfuncpoint` VALUES (5835, '1007', '删除', '101303', NULL, NULL, NULL, '2025-01-15 09:49:30', 7, NULL, NULL, NULL, '2025-01-15 09:49:37', '否', '删除 - 授权用户');
INSERT INTO `clfuncpoint` VALUES (5836, '1008', '添加', '101303', NULL, NULL, NULL, '2025-01-15 09:53:05', 8, NULL, NULL, NULL, '2025-01-15 09:56:17', '否', '添加 - 授权功能模块');
INSERT INTO `clfuncpoint` VALUES (5837, '1009', '删除', '101303', NULL, NULL, NULL, '2025-01-15 09:53:21', 9, NULL, NULL, NULL, '2025-01-15 09:56:23', '否', '删除 - 授权功能模块');
INSERT INTO `clfuncpoint` VALUES (5838, '1010', '添加', '101303', NULL, NULL, NULL, '2025-01-15 09:57:00', 10, NULL, NULL, NULL, '2025-01-15 09:57:48', '否', '添加 - 功能模块');
INSERT INTO `clfuncpoint` VALUES (5839, '1011', '删除', '101303', NULL, NULL, NULL, '2025-01-15 09:57:19', 11, NULL, NULL, NULL, '2025-01-15 09:57:51', '否', '删除 - 功能模块');
INSERT INTO `clfuncpoint` VALUES (5840, '1012', '编辑', '101303', NULL, NULL, NULL, '2025-01-15 09:57:37', 12, NULL, NULL, NULL, '2025-01-15 09:57:55', '否', '编辑 - 功能模块');

-- ----------------------------
-- Table structure for clfunction_app
-- ----------------------------
DROP TABLE IF EXISTS `clfunction_app`;
CREATE TABLE `clfunction_app`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父级ID',
  `function_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能编码',
  `function_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能名称',
  `link_type` int(2) NOT NULL DEFAULT 0 COMMENT '链接跳转类型（0-原生，1-h5）',
  `is_tree` int(1) NULL DEFAULT NULL COMMENT '是否是树节点（0-不是，1-是）',
  `link_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转链接(如果是h5跳转需要传递)',
  `label_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角标URL',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能ICON',
  `is_landscape_screen` int(1) NULL DEFAULT 1 COMMENT '横竖屏标识(0-横屏，1-竖屏)',
  `is_enable` int(1) NULL DEFAULT 1 COMMENT '是否启用标识 0-停用 1-启用',
  `is_show_title` int(1) UNSIGNED ZEROFILL NULL DEFAULT 1 COMMENT '是否显示标题栏(0-不显示，1-显示)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `sort_num` int(3) NULL DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'APP功能配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clfunction_app
-- ----------------------------

-- ----------------------------
-- Table structure for clfunction_group_app
-- ----------------------------
DROP TABLE IF EXISTS `clfunction_group_app`;
CREATE TABLE `clfunction_group_app`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `function_id` bigint(20) NOT NULL COMMENT '功能ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `del_flag` int(1) NOT NULL DEFAULT 1 COMMENT '删除标识 0-删除 1-有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'APP功能和用户映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clfunction_group_app
-- ----------------------------

-- ----------------------------
-- Table structure for clfunction_user_app
-- ----------------------------
DROP TABLE IF EXISTS `clfunction_user_app`;
CREATE TABLE `clfunction_user_app`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `function_id` bigint(20) NOT NULL COMMENT '功能ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `del_flag` int(1) NOT NULL DEFAULT 1 COMMENT '删除标识 0-删除 1-有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'APP功能和用户映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clfunction_user_app
-- ----------------------------

-- ----------------------------
-- Table structure for clgroupdata
-- ----------------------------
DROP TABLE IF EXISTS `clgroupdata`;
CREATE TABLE `clgroupdata`  (
  `grpid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`grpid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clgroupdata
-- ----------------------------

-- ----------------------------
-- Table structure for clgrouping
-- ----------------------------
DROP TABLE IF EXISTS `clgrouping`;
CREATE TABLE `clgrouping`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `grpname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `groupid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组编号',
  `delflag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '删除标识',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `grpdesc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统介绍',
  `parent` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级用户组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clgrouping
-- ----------------------------
INSERT INTO `clgrouping` VALUES (38, 'Administrator', '03e251a9b1578d443adb7a4f5f1a693a', '否', '2021-04-13 21:21:00', NULL, '2021-08-11 21:17:24', NULL, '超级管理员', NULL);
INSERT INTO `clgrouping` VALUES (53, '开发组', 'ba359855bb5f630d32c3aeac91752d30', '否', '2023-06-02 11:14:12', NULL, NULL, NULL, '开发组', NULL);

-- ----------------------------
-- Table structure for clgroupmenus
-- ----------------------------
DROP TABLE IF EXISTS `clgroupmenus`;
CREATE TABLE `clgroupmenus`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `grid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `menunum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编号',
  `parent` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级菜单',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `isspecialfunc` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是特殊功能点',
  `systemid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clgroupmenus`(`grid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35377 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clgroupmenus
-- ----------------------------
INSERT INTO `clgroupmenus` VALUES (8943, '100001', '1000', '', NULL, '2021-03-02 19:04:38', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (10196, '100001', '1002', '1000', NULL, '2021-03-04 15:12:49', NULL, '2023-06-02 19:03:51', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (11129, '100001', '1010', '1000', NULL, '2021-04-09 15:57:49', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (11198, '100001', '1010', '1000', NULL, '2021-04-09 16:50:33', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (11201, '100001', '1013', '1000', NULL, '2021-04-09 16:50:33', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (11271, '100001', '1010', '1000', NULL, '2021-04-09 16:51:27', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (11278, '100001', '1013', '1000', NULL, '2021-04-09 16:51:27', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (11290, '100001', '1010', '1000', NULL, '2021-04-09 16:51:30', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (11385, '100001', '1010', '1000', NULL, '2021-04-12 11:32:16', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (11391, '100001', '1010', '1000', NULL, '2021-04-12 19:25:21', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (11442, '100001', '4000', NULL, NULL, '2021-04-17 10:27:35', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (11557, '100001', '3000', '', NULL, '2021-04-17 18:43:08', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (11798, '100001', '1002', '1000', NULL, '2021-04-18 15:10:51', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12095, '100001', '1007', '1000', NULL, '2021-04-18 15:33:00', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12096, '100001', '1002', '1000', NULL, '2021-04-18 15:33:00', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12108, '100001', '1002', '1000', NULL, '2021-04-18 15:33:05', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12197, '100001', '1006', '1000', NULL, '2021-04-18 15:34:07', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (12198, '100001', '1003', '1006', NULL, '2021-04-18 15:34:07', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12200, '100001', '1004', '1006', NULL, '2021-04-18 15:34:07', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12201, '100001', '1002', '1000', NULL, '2021-04-18 15:34:07', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12274, '100001', '1002', '1000', NULL, '2021-04-18 15:34:42', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12277, '100001', '1003', '1004', NULL, '2021-04-18 15:34:53', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12279, '100001', '1004', '1004', NULL, '2021-04-18 15:34:53', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12280, '100001', '1002', '1000', NULL, '2021-04-18 15:34:53', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12292, '100001', '1002', '1000', NULL, '2021-04-18 15:35:04', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12297, '100001', '1002', '1000', NULL, '2021-04-18 15:35:06', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12303, '100001', '1002', '1000', NULL, '2021-04-18 15:35:09', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12836, '100001', '1013', '1000', NULL, '2021-05-21 18:34:10', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12850, '100001', '1002', '1000', NULL, '2021-06-04 16:59:10', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12855, '100001', '1002', '1000', NULL, '2021-06-06 20:05:16', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12929, '100001', '40000301', '400003', NULL, '2021-06-17 09:43:47', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (12930, '100001', '400003', '4000', NULL, '2021-06-17 09:43:47', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (12931, '100001', '1004', '40000301', NULL, '2021-06-17 09:43:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12932, '100001', '1003', '40000301', NULL, '2021-06-17 09:43:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12933, '100001', '1002', '1000', NULL, '2021-06-17 09:43:47', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12935, '100001', '40000302', '400003', NULL, '2021-06-17 09:43:50', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (12936, '100001', '1004', '40000302', NULL, '2021-06-17 09:43:50', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12937, '100001', '1003', '40000302', NULL, '2021-06-17 09:43:50', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (12938, '100001', '1002', '1000', NULL, '2021-06-17 09:43:50', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (13002, '100001', '400001', '4000', NULL, '2021-06-17 09:44:20', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (13025, '100001', '1013', '1000', NULL, '2021-06-17 09:44:25', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (13033, '100001', '40000105', '400001', NULL, '2021-06-17 09:44:40', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (13034, '100001', '1004', '40000105', NULL, '2021-06-17 09:44:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (13035, '100001', '1003', '40000105', NULL, '2021-06-17 09:44:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (13036, '100001', '1002', '1000', NULL, '2021-06-17 09:44:40', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (13039, '100001', '40000109', '400001', NULL, '2021-06-17 09:44:50', NULL, '2023-10-08 14:12:14', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (13040, '100001', '1004', '40000109', NULL, '2021-06-17 09:44:50', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (13041, '100001', '1003', '40000109', NULL, '2021-06-17 09:44:50', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (13042, '100001', '1002', '1000', NULL, '2021-06-17 09:44:50', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (13046, '100001', '1007', '1000', NULL, '2021-06-17 09:44:50', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (13047, '100001', '1006', '40000109', NULL, '2021-06-17 09:44:50', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (13049, '100001', '1010', '1000', NULL, '2021-06-17 09:44:50', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (16730, '100001', '40000303', '400003', NULL, '2021-08-03 11:23:32', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (16731, '100001', '1004', '40000303', NULL, '2021-08-03 11:23:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (16732, '100001', '1003', '40000303', NULL, '2021-08-03 11:23:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (16733, '100001', '1002', '1000', NULL, '2021-08-03 11:23:32', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (17595, '100001', '1002', '1000', NULL, '2021-08-11 23:45:35', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (19634, '100001', '40000502', '400005', NULL, '2021-08-14 14:34:22', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (19635, '100001', '400005', '4000', NULL, '2021-08-14 14:34:22', NULL, '2021-08-14 14:39:25', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (19636, '100001', '1004', '40000502', NULL, '2021-08-14 14:34:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (19637, '100001', '1003', '40000502', NULL, '2021-08-14 14:34:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (19638, '100001', '1002', '1000', NULL, '2021-08-14 14:34:22', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (19640, '100001', '40000501', '400005', NULL, '2021-08-14 14:34:24', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (19641, '100001', '1004', '40000501', NULL, '2021-08-14 14:34:24', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (19642, '100001', '1003', '40000501', NULL, '2021-08-14 14:34:24', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (19643, '100001', '1002', '1000', NULL, '2021-08-14 14:34:24', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (21824, '100001', '1002', '1000', NULL, '2022-01-10 15:58:56', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22146, '100001', '1002', '1000', NULL, '2022-04-20 17:01:18', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22154, '100001', '10022105', '1000', NULL, '2022-04-20 18:08:19', NULL, '2023-06-02 19:07:24', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (22175, '100001', '10022106', '1000', NULL, '2022-04-20 18:22:33', NULL, '2023-06-02 19:07:34', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (22241, '100001', '7000', NULL, NULL, '2022-05-07 18:04:27', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (22697, '100001', '1002', '1000', NULL, '2022-05-26 17:54:45', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22700, '100001', '1007', '1000', NULL, '2022-05-26 17:54:45', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22771, '100001', '1002', '1000', NULL, '2022-05-26 17:55:31', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22775, '100001', '1007', '1000', NULL, '2022-05-26 17:55:31', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22778, '100001', '1010', '1000', NULL, '2022-05-26 17:55:31', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22781, '100001', '1013', '1000', NULL, '2022-05-26 17:55:31', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22787, '100001', '1002210601', '10022106', NULL, '2022-05-26 17:55:37', NULL, '2023-06-02 11:22:00', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (22788, '100001', '1004', '1002210601', NULL, '2022-05-26 17:55:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22789, '100001', '1003', '1002210601', NULL, '2022-05-26 17:55:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22790, '100001', '1002', '1000', NULL, '2022-05-26 17:55:37', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22793, '100001', '1006', '1002210601', NULL, '2022-05-26 17:55:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22794, '100001', '1007', '1000', NULL, '2022-05-26 17:55:37', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22797, '100001', '1010', '1000', NULL, '2022-05-26 17:55:37', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (22800, '100001', '1013', '1000', NULL, '2022-05-26 17:55:37', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25550, '100001', '1004', '30001110', NULL, '2022-08-18 21:33:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25551, '100001', '1003', '30001110', NULL, '2022-08-18 21:33:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25552, '100001', '1002', '1000', NULL, '2022-08-18 21:33:16', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25731, '100001', '1002', '1000', NULL, '2022-08-23 11:36:57', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25734, '100001', '1007', '1000', NULL, '2022-08-23 11:36:57', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25736, '100001', '1010', '1000', NULL, '2022-08-23 11:36:57', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25831, '100001', '1002', '1000', NULL, '2022-08-23 12:53:30', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25834, '100001', '1007', '1000', NULL, '2022-08-23 12:53:30', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25837, '100001', '1010', '1000', NULL, '2022-08-23 12:53:30', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25840, '100001', '1013', '1000', NULL, '2022-08-23 12:53:30', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25908, '100001', '1002', '1000', NULL, '2022-08-23 12:53:42', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25911, '100001', '1007', '1000', NULL, '2022-08-23 12:53:42', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25914, '100001', '1010', '1000', NULL, '2022-08-23 12:53:42', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (25917, '100001', '1013', '1000', NULL, '2022-08-23 12:53:42', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (28054, '100001', '1002', '1000', NULL, '2022-09-13 11:14:00', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (28055, '100001', '1007', '1000', NULL, '2022-09-13 11:14:00', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (28472, '100001', '1004', '30001116', NULL, '2022-09-16 15:44:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (28473, '100001', '1003', '30001116', NULL, '2022-09-16 15:44:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (28474, '100001', '1002', '1000', NULL, '2022-09-16 15:44:21', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (28593, '100001', '1004', '900002', NULL, '2022-09-19 13:16:06', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (28594, '100001', '1003', '900002', NULL, '2022-09-19 13:16:06', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (28595, '100001', '1002', '1000', NULL, '2022-09-19 13:16:06', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (28608, '100001', '1004', '900003', NULL, '2022-09-19 13:16:14', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (28609, '100001', '1003', '900003', NULL, '2022-09-19 13:16:14', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (28610, '100001', '1002', '1000', NULL, '2022-09-19 13:16:14', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (30543, '100001', '700015', '7000', NULL, '2022-11-14 20:24:19', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (30815, '100001', '1002', '1000', NULL, '2022-11-29 10:43:50', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (30821, '100001', '1002', '1000', NULL, '2022-11-29 15:13:45', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (30825, '100001', '1007', '1000', NULL, '2022-11-29 15:13:45', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (30828, '100001', '1010', '1000', NULL, '2022-11-29 15:13:45', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (31433, '100001', '700014', '7000', NULL, '2022-11-30 14:31:22', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (32081, '100001', '1002', '1000', NULL, '2022-12-01 16:33:22', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32082, '100001', '1007', '1000', NULL, '2022-12-01 16:33:22', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32090, '100001', '1002', '1000', NULL, '2022-12-01 16:36:07', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32143, '100001', '1002', '1000', NULL, '2022-12-02 16:54:01', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32144, '100001', '1007', '1000', NULL, '2022-12-02 16:54:01', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32183, '100001', '1002', '1000', NULL, '2022-12-06 16:21:18', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32187, '100001', '1007', '1000', NULL, '2022-12-06 16:21:18', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32188, '100001', '1010', '1000', NULL, '2022-12-06 16:21:18', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32502, '100001', '1004', '300002230104', NULL, '2022-12-29 16:38:00', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32503, '100001', '1003', '300002230104', NULL, '2022-12-29 16:38:00', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32504, '100001', '1002', '1000', NULL, '2022-12-29 16:38:00', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32564, '100001', '1004', '4000100303', NULL, '2023-01-11 15:21:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32565, '100001', '1003', '4000100303', NULL, '2023-01-11 15:21:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32566, '100001', '1002', '1000', NULL, '2023-01-11 15:21:22', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32757, '100001', '1002', '1000', NULL, '2023-02-17 10:23:55', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32782, '100001', '1002', '1000', NULL, '2023-02-23 09:15:12', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32851, '100001', '1002', '1000', NULL, '2023-02-23 09:18:31', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32855, '100001', '1010', '1000', NULL, '2023-02-23 09:18:31', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32860, '100001', '1013', '1000', NULL, '2023-02-23 09:18:31', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32861, '100001', '1007', '1000', NULL, '2023-02-23 09:18:31', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (32924, '100001', '300002230108', '3000', NULL, '2023-03-17 14:00:57', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33001, '100001', '30000223010810', '300002230108', NULL, '2023-03-20 17:43:37', NULL, '2023-03-21 15:15:59', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33002, '100001', '1004', '30000223010810', NULL, '2023-03-20 17:43:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33003, '100001', '1003', '30000223010810', NULL, '2023-03-20 17:43:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33004, '100001', '1002', '1000', NULL, '2023-03-20 17:43:37', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33200, '100001', '1002', '1000', NULL, '2023-05-22 14:03:12', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33203, '100001', '100001', '1000', NULL, '2023-05-24 13:53:48', NULL, '2023-06-07 17:36:21', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33206, '100001', '1002', '1000', NULL, '2023-05-24 13:53:48', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33211, '100001', '1002', '1000', NULL, '2023-05-24 14:01:35', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33216, '100001', '1002', '1000', NULL, '2023-05-24 17:02:25', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33221, '100001', '1002', '1000', NULL, '2023-05-29 14:37:01', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33236, '100001', '1002', '1000', NULL, '2023-06-01 09:28:51', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33241, '100001', '1002', '1000', NULL, '2023-06-01 09:28:53', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33257, '100001', '10000102', '100001', NULL, '2023-06-02 09:35:53', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33258, '100001', '1004', '10000102', NULL, '2023-06-02 09:35:53', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33259, '100001', '1003', '10000102', NULL, '2023-06-02 09:35:53', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33260, '100001', '1002', '1000', NULL, '2023-06-02 09:35:53', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33261, '100001', '1001', '10000102', NULL, '2023-06-02 09:35:53', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33262, '100001', '10000101', '100001', NULL, '2023-06-02 09:35:55', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33263, '100001', '1004', '10000101', NULL, '2023-06-02 09:35:55', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33264, '100001', '1003', '10000101', NULL, '2023-06-02 09:35:55', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33265, '100001', '1002', '1000', NULL, '2023-06-02 09:35:55', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33266, '100001', '1001', '10000101', NULL, '2023-06-02 09:35:55', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33270, '100001', '1002', '1000', NULL, '2023-06-02 09:35:56', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33337, '100001', '1002', '1000', NULL, '2023-06-02 09:37:59', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33342, '100001', '1002', '1000', NULL, '2023-06-02 09:38:04', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33347, '100001', '1002', '1000', NULL, '2023-06-02 09:38:05', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33398, '100001', '1002', '1000', NULL, '2023-06-02 09:38:10', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33399, '100001', '1007', '1000', NULL, '2023-06-02 09:38:10', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33413, '100001', '1010', '1000', NULL, '2023-06-02 09:38:10', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33416, '100001', '1013', '1000', NULL, '2023-06-02 09:38:10', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33420, '100001', '1002', '1000', NULL, '2023-06-02 09:38:12', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33425, '100001', '1002', '1000', NULL, '2023-06-02 09:38:15', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33430, '100001', '1002', '1000', NULL, '2023-06-02 09:38:21', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33435, '100001', '1002', '1000', NULL, '2023-06-02 09:38:23', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33437, '100001', '1007', '1000', NULL, '2023-06-02 11:03:44', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33450, '100001', '1010', '1000', NULL, '2023-06-02 11:06:14', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33452, '100001', '1002', '1000', NULL, '2023-06-02 11:06:14', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33459, '100002', '10000102', '100001', NULL, '2023-06-02 11:08:00', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33460, '100002', '100001', '1000', NULL, '2023-06-02 11:08:00', NULL, '2023-06-07 17:36:21', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33461, '100002', '1000', '', NULL, '2023-06-02 11:08:00', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33462, '100002', '1004', '10000102', NULL, '2023-06-02 11:08:00', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33463, '100002', '1003', '10000102', NULL, '2023-06-02 11:08:00', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33464, '100002', '1002', '1000', NULL, '2023-06-02 11:08:00', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33465, '100002', '1001', '10000102', NULL, '2023-06-02 11:08:00', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33466, '100002', '10000101', '100001', NULL, '2023-06-02 11:08:01', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33467, '100002', '1004', '10000101', NULL, '2023-06-02 11:08:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33468, '100002', '1003', '10000101', NULL, '2023-06-02 11:08:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33469, '100002', '1002', '1000', NULL, '2023-06-02 11:08:01', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33470, '100002', '1001', '10000101', NULL, '2023-06-02 11:08:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33474, '100002', '1002', '1000', NULL, '2023-06-02 11:08:03', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33476, '100002', '10021803', '1013', NULL, '2023-06-02 11:08:09', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33477, '100002', '1013', '1000', NULL, '2023-06-02 11:08:09', NULL, '2023-06-02 19:03:44', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33478, '100002', '1001', '10021803', NULL, '2023-06-02 11:08:09', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33479, '100002', '1003', '10021803', NULL, '2023-06-02 11:08:09', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33480, '100002', '1002', '1000', NULL, '2023-06-02 11:08:09', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33481, '100002', '1007', '1000', NULL, '2023-06-02 11:08:09', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33482, '100002', '1004', '10021803', NULL, '2023-06-02 11:08:09', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33483, '100002', '1006', '10021803', NULL, '2023-06-02 11:08:09', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33484, '100002', '1005', '10021803', NULL, '2023-06-02 11:08:09', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33485, '100002', '10021902', '1013', NULL, '2023-06-02 11:08:10', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33486, '100002', '1001', '10021902', NULL, '2023-06-02 11:08:10', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33487, '100002', '1006', '10021902', NULL, '2023-06-02 11:08:10', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33488, '100002', '1003', '10021902', NULL, '2023-06-02 11:08:10', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33489, '100002', '1008', '10021902', NULL, '2023-06-02 11:08:10', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33490, '100002', '1002', '1000', NULL, '2023-06-02 11:08:10', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33491, '100002', '1007', '1000', NULL, '2023-06-02 11:08:10', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33492, '100002', '1004', '10021902', NULL, '2023-06-02 11:08:10', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33493, '100002', '1009', '10021902', NULL, '2023-06-02 11:08:10', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33494, '100002', '1005', '10021902', NULL, '2023-06-02 11:08:10', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33495, '100002', '1010', '1000', NULL, '2023-06-02 11:08:10', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33496, '100002', '1011', '10021902', NULL, '2023-06-02 11:08:10', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33497, '100002', '10021801', '100218', NULL, '2023-06-02 11:08:12', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33498, '100002', '100218', '1013', NULL, '2023-06-02 11:08:12', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33499, '100002', '1007', '1000', NULL, '2023-06-02 11:08:12', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33500, '100002', '1009', '10021801', NULL, '2023-06-02 11:08:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33501, '100002', '1003', '10021801', NULL, '2023-06-02 11:08:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33502, '100002', '1002', '1000', NULL, '2023-06-02 11:08:12', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33503, '100002', '1004', '10021801', NULL, '2023-06-02 11:08:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33504, '100002', '1005', '10021801', NULL, '2023-06-02 11:08:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33505, '100002', '1001', '10021801', NULL, '2023-06-02 11:08:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33506, '100002', '1008', '10021801', NULL, '2023-06-02 11:08:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33507, '100002', '10021802', '100218', NULL, '2023-06-02 11:08:13', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33508, '100002', '1001', '10021802', NULL, '2023-06-02 11:08:13', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33509, '100002', '1005', '10021802', NULL, '2023-06-02 11:08:13', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33510, '100002', '1009', '10021802', NULL, '2023-06-02 11:08:13', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33511, '100002', '1010', '1000', NULL, '2023-06-02 11:08:13', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33512, '100002', '1011', '10021802', NULL, '2023-06-02 11:08:13', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33513, '100002', '1003', '10021802', NULL, '2023-06-02 11:08:13', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33514, '100002', '1007', '1000', NULL, '2023-06-02 11:08:13', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33515, '100002', '1002', '1000', NULL, '2023-06-02 11:08:13', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33516, '100002', '1006', '10021802', NULL, '2023-06-02 11:08:13', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33517, '100002', '1004', '10021802', NULL, '2023-06-02 11:08:13', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33518, '100002', '1008', '10021802', NULL, '2023-06-02 11:08:13', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33519, '100002', '10022201', '100222', NULL, '2023-06-02 11:08:16', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33520, '100002', '100222', '1013', NULL, '2023-06-02 11:08:16', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33521, '100002', '1001', '10022201', NULL, '2023-06-02 11:08:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33522, '100002', '1003', '10022201', NULL, '2023-06-02 11:08:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33523, '100002', '1005', '10022201', NULL, '2023-06-02 11:08:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33524, '100002', '1002', '1000', NULL, '2023-06-02 11:08:16', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33525, '100002', '1004', '10022201', NULL, '2023-06-02 11:08:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33526, '100002', '1006', '10022201', NULL, '2023-06-02 11:08:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33527, '100002', '10022202', '100222', NULL, '2023-06-02 11:08:17', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33528, '100002', '1001', '10022202', NULL, '2023-06-02 11:08:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33529, '100002', '1003', '10022202', NULL, '2023-06-02 11:08:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33530, '100002', '1005', '10022202', NULL, '2023-06-02 11:08:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33531, '100002', '1002', '1000', NULL, '2023-06-02 11:08:17', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33532, '100002', '1004', '10022202', NULL, '2023-06-02 11:08:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33533, '100002', '1006', '10022202', NULL, '2023-06-02 11:08:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33534, '100002', '10021804', '100222', NULL, '2023-06-02 11:08:19', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33535, '100002', '1001', '10021804', NULL, '2023-06-02 11:08:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33536, '100002', '1003', '10021804', NULL, '2023-06-02 11:08:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33537, '100002', '1002', '1000', NULL, '2023-06-02 11:08:19', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33538, '100002', '1004', '10021804', NULL, '2023-06-02 11:08:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33539, '100002', '1005', '10021804', NULL, '2023-06-02 11:08:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33540, '100002', '1006', '10021804', NULL, '2023-06-02 11:08:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33545, '100002', '1002', '1000', NULL, '2023-06-02 11:08:21', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33547, '100002', '100226', '1002', NULL, '2023-06-02 11:08:24', NULL, '2023-09-15 11:22:05', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33548, '100002', '1002', '1000', NULL, '2023-06-02 11:08:24', NULL, '2023-06-02 19:03:51', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33549, '100002', '1004', '100226', NULL, '2023-06-02 11:08:24', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33550, '100002', '1003', '100226', NULL, '2023-06-02 11:08:24', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33551, '100002', '1002', '1000', NULL, '2023-06-02 11:08:24', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33552, '100002', '1001', '100226', NULL, '2023-06-02 11:08:24', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33556, '100002', '1002', '1000', NULL, '2023-06-02 11:08:26', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33558, '100002', '100219', '1002', NULL, '2023-06-02 11:08:28', NULL, '2023-06-02 19:04:34', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33559, '100002', '1001', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33560, '100002', '1005', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33561, '100002', '1014', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33562, '100002', '1017', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33563, '100002', '1021', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33564, '100002', '1024', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33565, '100002', '1027', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33566, '100002', '1029', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33567, '100002', '1030', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33568, '100002', '1032', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33569, '100002', '1033', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33570, '100002', '1034', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33571, '100002', '1003', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33572, '100002', '1006', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33573, '100002', '1002', '1000', NULL, '2023-06-02 11:08:28', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33574, '100002', '1007', '1000', NULL, '2023-06-02 11:08:28', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33575, '100002', '1015', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33576, '100002', '1018', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33577, '100002', '1022', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33578, '100002', '1025', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33579, '100002', '1028', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33580, '100002', '1004', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33581, '100002', '1008', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33582, '100002', '1016', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33583, '100002', '1019', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33584, '100002', '1020', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33585, '100002', '1023', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33586, '100002', '1026', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33587, '100002', '1009', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33588, '100002', '1010', '1000', NULL, '2023-06-02 11:08:28', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33589, '100002', '1011', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33590, '100002', '1012', '100219', NULL, '2023-06-02 11:08:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33591, '100002', '1013', '1000', NULL, '2023-06-02 11:08:28', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33595, '100002', '1002', '1000', NULL, '2023-06-02 11:08:30', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33597, '100002', '10022003', '100220', NULL, '2023-06-02 11:08:32', NULL, '2023-06-07 17:35:40', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33598, '100002', '100220', '1000', NULL, '2023-06-02 11:08:32', NULL, '2023-06-02 19:05:08', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33599, '100002', '1001', '10022003', NULL, '2023-06-02 11:08:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33600, '100002', '1004', '10022003', NULL, '2023-06-02 11:08:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33601, '100002', '1002', '1000', NULL, '2023-06-02 11:08:32', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33602, '100002', '1003', '10022003', NULL, '2023-06-02 11:08:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33603, '100002', '1005', '10022003', NULL, '2023-06-02 11:08:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33604, '100002', '1006', '10022003', NULL, '2023-06-02 11:08:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33605, '100002', '1007', '1000', NULL, '2023-06-02 11:08:32', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33606, '100002', '1008', '10022003', NULL, '2023-06-02 11:08:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33607, '100002', '1009', '10022003', NULL, '2023-06-02 11:08:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33608, '100002', '1010', '1000', NULL, '2023-06-02 11:08:32', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33609, '100002', '1011', '10022003', NULL, '2023-06-02 11:08:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33610, '100002', '100224', '1002', NULL, '2023-06-02 11:08:34', NULL, '2023-06-02 19:04:44', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33611, '100002', '1004', '100224', NULL, '2023-06-02 11:08:34', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33612, '100002', '1003', '100224', NULL, '2023-06-02 11:08:34', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33613, '100002', '1002', '1000', NULL, '2023-06-02 11:08:34', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33614, '100002', '1001', '100224', NULL, '2023-06-02 11:08:34', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33615, '100002', '10000201', '100002', NULL, '2023-06-02 11:08:37', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33616, '100002', '100002', '1000', NULL, '2023-06-02 11:08:37', NULL, '2023-06-02 19:05:17', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33617, '100002', '1004', '10000201', NULL, '2023-06-02 11:08:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33618, '100002', '1003', '10000201', NULL, '2023-06-02 11:08:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33619, '100002', '1002', '1000', NULL, '2023-06-02 11:08:37', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33620, '100002', '1001', '10000201', NULL, '2023-06-02 11:08:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33621, '100002', '10000202', '100002', NULL, '2023-06-02 11:08:40', NULL, '2023-06-02 19:10:52', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33622, '100002', '1004', '10000202', NULL, '2023-06-02 11:08:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33623, '100002', '1003', '10000202', NULL, '2023-06-02 11:08:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33624, '100002', '1002', '1000', NULL, '2023-06-02 11:08:40', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33625, '100002', '1001', '10000202', NULL, '2023-06-02 11:08:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33626, '100002', '100701', '1007', NULL, '2023-06-02 11:08:43', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33627, '100002', '1007', '1000', NULL, '2023-06-02 11:08:43', NULL, '2024-07-31 10:22:55', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33628, '100002', '1004', '100701', NULL, '2023-06-02 11:08:43', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33629, '100002', '1003', '100701', NULL, '2023-06-02 11:08:43', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33630, '100002', '1002', '1000', NULL, '2023-06-02 11:08:43', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33631, '100002', '1001', '100701', NULL, '2023-06-02 11:08:43', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33632, '100002', '100702', '1007', NULL, '2023-06-02 11:08:45', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33633, '100002', '1004', '100702', NULL, '2023-06-02 11:08:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33634, '100002', '1003', '100702', NULL, '2023-06-02 11:08:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33635, '100002', '1002', '1000', NULL, '2023-06-02 11:08:45', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33636, '100002', '1001', '100702', NULL, '2023-06-02 11:08:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33637, '100002', '1005', '100702', NULL, '2023-06-02 11:08:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33638, '100002', '100703', '1007', NULL, '2023-06-02 11:08:46', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33639, '100002', '1004', '100703', NULL, '2023-06-02 11:08:46', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33640, '100002', '1003', '100703', NULL, '2023-06-02 11:08:46', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33641, '100002', '1002', '1000', NULL, '2023-06-02 11:08:46', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33642, '100002', '1001', '100703', NULL, '2023-06-02 11:08:46', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33643, '100002', '100304', '1003', NULL, '2023-06-02 11:08:49', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33644, '100002', '1003', '1000', NULL, '2023-06-02 11:08:49', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33645, '100002', '1001', '100304', NULL, '2023-06-02 11:08:49', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33646, '100002', '1005', '100304', NULL, '2023-06-02 11:08:49', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33647, '100002', '1006', '100304', NULL, '2023-06-02 11:08:49', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33648, '100002', '100305', '1003', NULL, '2023-06-02 11:08:50', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33649, '100002', '1004', '100305', NULL, '2023-06-02 11:08:50', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33650, '100002', '1003', '100305', NULL, '2023-06-02 11:08:50', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33651, '100002', '1002', '1000', NULL, '2023-06-02 11:08:50', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33652, '100002', '1001', '100305', NULL, '2023-06-02 11:08:50', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33653, '100002', '100306', '1003', NULL, '2023-06-02 11:08:52', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33654, '100002', '1004', '100306', NULL, '2023-06-02 11:08:52', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33655, '100002', '1003', '100306', NULL, '2023-06-02 11:08:52', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33656, '100002', '1002', '1000', NULL, '2023-06-02 11:08:52', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33657, '100002', '1001', '100306', NULL, '2023-06-02 11:08:52', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33658, '100002', '100402', '1004', NULL, '2023-06-02 11:08:56', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33659, '100002', '1004', '1000', NULL, '2023-06-02 11:08:56', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33660, '100002', '1001', '100402', NULL, '2023-06-02 11:08:56', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33661, '100002', '1004', '100402', NULL, '2023-06-02 11:08:56', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33665, '100002', '1002', '1000', NULL, '2023-06-02 11:08:57', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33667, '100002', '100208', '1004', NULL, '2023-06-02 11:08:59', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33668, '100002', '1001', '100208', NULL, '2023-06-02 11:08:59', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33669, '100002', '1005', '100208', NULL, '2023-06-02 11:08:59', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33670, '100002', '1006', '100208', NULL, '2023-06-02 11:08:59', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33671, '100002', '1007', '1000', NULL, '2023-06-02 11:08:59', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33672, '100002', '1008', '100208', NULL, '2023-06-02 11:08:59', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33673, '100002', '1009', '100208', NULL, '2023-06-02 11:08:59', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33674, '100002', '1010', '1000', NULL, '2023-06-02 11:08:59', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33675, '100002', '1003', '100208', NULL, '2023-06-02 11:08:59', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33676, '100002', '1002', '1000', NULL, '2023-06-02 11:08:59', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33677, '100002', '1004', '100208', NULL, '2023-06-02 11:08:59', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33678, '100002', '1002210501', '10022105', NULL, '2023-06-02 11:09:15', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33679, '100002', '10022105', '1000', NULL, '2023-06-02 11:09:15', NULL, '2023-06-02 19:07:24', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33681, '100002', '1004', '1002210501', NULL, '2023-06-02 11:09:15', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33682, '100002', '1003', '1002210501', NULL, '2023-06-02 11:09:15', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33683, '100002', '1002', '1000', NULL, '2023-06-02 11:09:15', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33684, '100002', '1001', '1002210501', NULL, '2023-06-02 11:09:15', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33685, '100002', '1006', '1002210501', NULL, '2023-06-02 11:09:15', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33686, '100002', '1007', '1000', NULL, '2023-06-02 11:09:15', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33687, '100002', '1008', '1002210501', NULL, '2023-06-02 11:09:15', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33688, '100002', '1005', '1002210501', NULL, '2023-06-02 11:09:15', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33689, '100002', '1002210502', '10022105', NULL, '2023-06-02 11:09:17', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33690, '100002', '1004', '1002210502', NULL, '2023-06-02 11:09:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33691, '100002', '1003', '1002210502', NULL, '2023-06-02 11:09:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33692, '100002', '1002', '1000', NULL, '2023-06-02 11:09:17', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33693, '100002', '1001', '1002210502', NULL, '2023-06-02 11:09:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33694, '100002', '1005', '1002210502', NULL, '2023-06-02 11:09:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33695, '100002', '1006', '1002210502', NULL, '2023-06-02 11:09:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33696, '100002', '1007', '1000', NULL, '2023-06-02 11:09:17', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33697, '100002', '1008', '1002210502', NULL, '2023-06-02 11:09:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33698, '100002', '1009', '1002210502', NULL, '2023-06-02 11:09:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33699, '100002', '1010', '1000', NULL, '2023-06-02 11:09:17', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33700, '100002', '1011', '1002210502', NULL, '2023-06-02 11:09:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33701, '100002', '1012', '1002210502', NULL, '2023-06-02 11:09:17', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33702, '100002', '1002210503', '10022105', NULL, '2023-06-02 11:09:18', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33703, '100002', '1004', '1002210503', NULL, '2023-06-02 11:09:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33704, '100002', '1003', '1002210503', NULL, '2023-06-02 11:09:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33705, '100002', '1002', '1000', NULL, '2023-06-02 11:09:18', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33706, '100002', '1001', '1002210503', NULL, '2023-06-02 11:09:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33707, '100002', '1005', '1002210503', NULL, '2023-06-02 11:09:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33708, '100002', '1006', '1002210503', NULL, '2023-06-02 11:09:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33709, '100002', '1007', '1000', NULL, '2023-06-02 11:09:18', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33710, '100002', '1008', '1002210503', NULL, '2023-06-02 11:09:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33711, '100002', '1009', '1002210503', NULL, '2023-06-02 11:09:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33712, '100002', '1010', '1000', NULL, '2023-06-02 11:09:18', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33713, '100002', '1011', '1002210503', NULL, '2023-06-02 11:09:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33714, '100002', '1012', '1002210503', NULL, '2023-06-02 11:09:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33715, '100002', '1013', '1000', NULL, '2023-06-02 11:09:18', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33716, '100002', '1014', '1002210503', NULL, '2023-06-02 11:09:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33717, '100002', '1015', '1002210503', NULL, '2023-06-02 11:09:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33718, '100002', '1016', '1002210503', NULL, '2023-06-02 11:09:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33719, '100002', '1017', '1002210503', NULL, '2023-06-02 11:09:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33720, '100002', '1002210504', '10022105', NULL, '2023-06-02 11:09:20', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33721, '100002', '1004', '1002210504', NULL, '2023-06-02 11:09:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33722, '100002', '1003', '1002210504', NULL, '2023-06-02 11:09:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33723, '100002', '1002', '1000', NULL, '2023-06-02 11:09:20', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33724, '100002', '1001', '1002210504', NULL, '2023-06-02 11:09:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33725, '100002', '1005', '1002210504', NULL, '2023-06-02 11:09:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33726, '100002', '1006', '1002210504', NULL, '2023-06-02 11:09:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33727, '100002', '1007', '1000', NULL, '2023-06-02 11:09:20', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33728, '100002', '1008', '1002210504', NULL, '2023-06-02 11:09:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33729, '100002', '1009', '1002210504', NULL, '2023-06-02 11:09:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33730, '100002', '1010', '1000', NULL, '2023-06-02 11:09:20', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33731, '100002', '1011', '1002210504', NULL, '2023-06-02 11:09:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33732, '100002', '1012', '1002210504', NULL, '2023-06-02 11:09:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33733, '100002', '1013', '1000', NULL, '2023-06-02 11:09:20', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33734, '100002', '1014', '1002210504', NULL, '2023-06-02 11:09:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33735, '100002', '1015', '1002210504', NULL, '2023-06-02 11:09:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33736, '100002', '1002210602', '10022106', NULL, '2023-06-02 11:09:22', NULL, '2023-06-02 11:21:56', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33737, '100002', '10022106', '1000', NULL, '2023-06-02 11:09:22', NULL, '2023-06-02 19:07:34', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33738, '100002', '1004', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33739, '100002', '1003', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33740, '100002', '1002', '1000', NULL, '2023-06-02 11:09:22', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33741, '100002', '1001', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33742, '100002', '1005', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33743, '100002', '1006', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33744, '100002', '1007', '1000', NULL, '2023-06-02 11:09:22', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33745, '100002', '1008', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33746, '100002', '1009', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33747, '100002', '1010', '1000', NULL, '2023-06-02 11:09:22', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33748, '100002', '1011', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33749, '100002', '1012', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33750, '100002', '1013', '1000', NULL, '2023-06-02 11:09:22', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33751, '100002', '1014', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33752, '100002', '1015', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33753, '100002', '1016', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33754, '100002', '1017', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33755, '100002', '1018', '1002210602', NULL, '2023-06-02 11:09:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33759, '100002', '1002', '1000', NULL, '2023-06-02 11:09:23', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33763, '100002', '1007', '1000', NULL, '2023-06-02 11:09:23', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33766, '100002', '1010', '1000', NULL, '2023-06-02 11:09:23', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33769, '100002', '1013', '1000', NULL, '2023-06-02 11:09:23', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33776, '100002', '1004', '10022104', NULL, '2023-06-02 11:09:44', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33777, '100002', '1003', '10022104', NULL, '2023-06-02 11:09:44', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33778, '100002', '1002', '1000', NULL, '2023-06-02 11:09:44', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33779, '100002', '1001', '10022104', NULL, '2023-06-02 11:09:44', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33783, '100002', '1002', '1000', NULL, '2023-06-02 11:09:45', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33790, '100002', '1002', '1000', NULL, '2023-06-02 11:09:47', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33798, '100002', '1002', '1000', NULL, '2023-06-02 11:09:48', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33799, '100002', '101003', '1010', NULL, '2023-06-02 11:09:54', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33800, '100002', '1010', '1000', NULL, '2023-06-02 11:09:54', NULL, '2023-06-02 19:07:53', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33801, '100002', '1001', '101003', NULL, '2023-06-02 11:09:54', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33802, '100002', '1002', '1000', NULL, '2023-06-02 11:09:54', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33803, '100002', '1003', '101003', NULL, '2023-06-02 11:09:54', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33804, '100002', '1004', '101003', NULL, '2023-06-02 11:09:54', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33805, '100002', '101001', '1010', NULL, '2023-06-02 11:10:01', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33806, '100002', '1001', '101001', NULL, '2023-06-02 11:10:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33807, '100002', '1002', '1000', NULL, '2023-06-02 11:10:01', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33808, '100002', '1003', '101001', NULL, '2023-06-02 11:10:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33809, '100002', '1004', '101001', NULL, '2023-06-02 11:10:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33810, '100002', '101002', '1010', NULL, '2023-06-02 11:10:03', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33811, '100002', '1001', '101002', NULL, '2023-06-02 11:10:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33812, '100002', '1002', '1000', NULL, '2023-06-02 11:10:03', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33813, '100002', '1003', '101002', NULL, '2023-06-02 11:10:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33814, '100002', '1004', '101002', NULL, '2023-06-02 11:10:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33815, '100002', '101004', '1010', NULL, '2023-06-02 11:10:05', NULL, '2023-06-13 16:06:37', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33816, '100002', '1004', '101004', NULL, '2023-06-02 11:10:05', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33817, '100002', '1003', '101004', NULL, '2023-06-02 11:10:05', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33818, '100002', '1002', '1000', NULL, '2023-06-02 11:10:05', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33819, '100002', '1001', '101004', NULL, '2023-06-02 11:10:05', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33821, '100002', '1004', '101005', NULL, '2023-06-02 11:10:07', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33822, '100002', '1003', '101005', NULL, '2023-06-02 11:10:07', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33823, '100002', '1002', '1000', NULL, '2023-06-02 11:10:07', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33824, '100002', '1001', '101005', NULL, '2023-06-02 11:10:07', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33825, '100002', '400009', '4000', NULL, '2023-06-02 11:15:04', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33826, '100002', '4000', '', NULL, '2023-06-02 11:15:04', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33827, '100002', '1004', '400009', NULL, '2023-06-02 11:15:04', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33828, '100002', '40000301', '400003', NULL, '2023-06-02 11:15:06', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33829, '100002', '400003', '4000', NULL, '2023-06-02 11:15:06', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33830, '100002', '1004', '40000301', NULL, '2023-06-02 11:15:06', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33831, '100002', '1003', '40000301', NULL, '2023-06-02 11:15:06', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33832, '100002', '1002', '1000', NULL, '2023-06-02 11:15:06', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33833, '100002', '1001', '40000301', NULL, '2023-06-02 11:15:06', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33834, '100002', '40000302', '400003', NULL, '2023-06-02 11:15:07', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33835, '100002', '1004', '40000302', NULL, '2023-06-02 11:15:07', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33836, '100002', '1003', '40000302', NULL, '2023-06-02 11:15:07', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33837, '100002', '1002', '1000', NULL, '2023-06-02 11:15:07', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33838, '100002', '1001', '40000302', NULL, '2023-06-02 11:15:07', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33839, '100002', '40000303', '400003', NULL, '2023-06-02 11:15:09', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33840, '100002', '1004', '40000303', NULL, '2023-06-02 11:15:09', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33841, '100002', '1003', '40000303', NULL, '2023-06-02 11:15:09', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33842, '100002', '1002', '1000', NULL, '2023-06-02 11:15:09', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33843, '100002', '1001', '40000303', NULL, '2023-06-02 11:15:09', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33844, '100002', '40000304', '400003', NULL, '2023-06-02 11:15:11', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33845, '100002', '1004', '40000304', NULL, '2023-06-02 11:15:11', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33846, '100002', '1003', '40000304', NULL, '2023-06-02 11:15:11', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33847, '100002', '1002', '1000', NULL, '2023-06-02 11:15:11', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33848, '100002', '1001', '40000304', NULL, '2023-06-02 11:15:11', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33849, '100002', '40000502', '400005', NULL, '2023-06-02 11:15:14', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33850, '100002', '400005', '4000', NULL, '2023-06-02 11:15:14', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33851, '100002', '1004', '40000502', NULL, '2023-06-02 11:15:14', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33852, '100002', '1003', '40000502', NULL, '2023-06-02 11:15:14', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33853, '100002', '1002', '1000', NULL, '2023-06-02 11:15:14', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33854, '100002', '1001', '40000502', NULL, '2023-06-02 11:15:14', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33855, '100002', '40000501', '400005', NULL, '2023-06-02 11:15:16', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33856, '100002', '1004', '40000501', NULL, '2023-06-02 11:15:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33857, '100002', '1003', '40000501', NULL, '2023-06-02 11:15:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33858, '100002', '1002', '1000', NULL, '2023-06-02 11:15:16', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33859, '100002', '1001', '40000501', NULL, '2023-06-02 11:15:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33860, '100002', '40000101', '400001', NULL, '2023-06-02 11:15:19', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33861, '100002', '400001', '4000', NULL, '2023-06-02 11:15:19', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33862, '100002', '1001', '40000101', NULL, '2023-06-02 11:15:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33863, '100002', '1010', '1000', NULL, '2023-06-02 11:15:19', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33864, '100002', '1011', '40000101', NULL, '2023-06-02 11:15:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33865, '100002', '1002', '1000', NULL, '2023-06-02 11:15:19', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33866, '100002', '1003', '40000101', NULL, '2023-06-02 11:15:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33867, '100002', '1004', '40000101', NULL, '2023-06-02 11:15:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33868, '100002', '1005', '40000101', NULL, '2023-06-02 11:15:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33869, '100002', '1006', '40000101', NULL, '2023-06-02 11:15:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33870, '100002', '1008', '40000101', NULL, '2023-06-02 11:15:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33871, '100002', '1009', '40000101', NULL, '2023-06-02 11:15:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33872, '100002', '40000103', '400001', NULL, '2023-06-02 11:15:21', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33873, '100002', '1004', '40000103', NULL, '2023-06-02 11:15:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33874, '100002', '1003', '40000103', NULL, '2023-06-02 11:15:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33875, '100002', '1002', '1000', NULL, '2023-06-02 11:15:21', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33876, '100002', '1001', '40000103', NULL, '2023-06-02 11:15:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33877, '100002', '1014', '40000103', NULL, '2023-06-02 11:15:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33878, '100002', '1008', '40000103', NULL, '2023-06-02 11:15:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33879, '100002', '1010', '1000', NULL, '2023-06-02 11:15:21', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33880, '100002', '1009', '40000103', NULL, '2023-06-02 11:15:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33881, '100002', '1011', '40000103', NULL, '2023-06-02 11:15:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33882, '100002', '1012', '40000103', NULL, '2023-06-02 11:15:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33883, '100002', '1005', '40000103', NULL, '2023-06-02 11:15:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33884, '100002', '1013', '1000', NULL, '2023-06-02 11:15:21', NULL, '2023-06-02 19:03:44', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33885, '100002', '1007', '1000', NULL, '2023-06-02 11:15:21', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33886, '100002', '40000104', '400001', NULL, '2023-06-02 11:15:22', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33887, '100002', '1004', '40000104', NULL, '2023-06-02 11:15:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33888, '100002', '1003', '40000104', NULL, '2023-06-02 11:15:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33889, '100002', '1002', '1000', NULL, '2023-06-02 11:15:22', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33890, '100002', '1001', '40000104', NULL, '2023-06-02 11:15:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33891, '100002', '1005', '40000104', NULL, '2023-06-02 11:15:22', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33892, '100002', '40000105', '400001', NULL, '2023-06-02 11:15:25', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33893, '100002', '1004', '40000105', NULL, '2023-06-02 11:15:25', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33894, '100002', '1003', '40000105', NULL, '2023-06-02 11:15:25', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33895, '100002', '1002', '1000', NULL, '2023-06-02 11:15:25', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33896, '100002', '1001', '40000105', NULL, '2023-06-02 11:15:25', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33897, '100002', '1005', '40000105', NULL, '2023-06-02 11:15:25', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33898, '100002', '40000109', '400001', NULL, '2023-06-02 11:15:27', NULL, '2023-10-08 14:12:14', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33899, '100002', '1004', '40000109', NULL, '2023-06-02 11:15:27', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33900, '100002', '1003', '40000109', NULL, '2023-06-02 11:15:27', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33901, '100002', '1002', '1000', NULL, '2023-06-02 11:15:27', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33902, '100002', '1001', '40000109', NULL, '2023-06-02 11:15:27', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33903, '100002', '1009', '40000109', NULL, '2023-06-02 11:15:27', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33904, '100002', '1008', '40000109', NULL, '2023-06-02 11:15:27', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33905, '100002', '1007', '1000', NULL, '2023-06-02 11:15:27', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33906, '100002', '1006', '40000109', NULL, '2023-06-02 11:15:27', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33907, '100002', '1005', '40000109', NULL, '2023-06-02 11:15:27', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33908, '100002', '1010', '1000', NULL, '2023-06-02 11:15:27', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33909, '100002', '1011', '40000109', NULL, '2023-06-02 11:15:27', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33910, '100002', '1012', '40000109', NULL, '2023-06-02 11:15:27', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33911, '100002', '40000107', '400001', NULL, '2023-06-02 11:15:28', NULL, '2023-10-08 14:13:14', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33912, '100002', '1004', '40000107', NULL, '2023-06-02 11:15:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33913, '100002', '1003', '40000107', NULL, '2023-06-02 11:15:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33914, '100002', '1002', '1000', NULL, '2023-06-02 11:15:28', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33915, '100002', '1001', '40000107', NULL, '2023-06-02 11:15:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33916, '100002', '1005', '40000107', NULL, '2023-06-02 11:15:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33917, '100002', '1006', '40000107', NULL, '2023-06-02 11:15:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33918, '100002', '1007', '1000', NULL, '2023-06-02 11:15:28', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33919, '100002', '1008', '40000107', NULL, '2023-06-02 11:15:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33920, '100002', '1009', '40000107', NULL, '2023-06-02 11:15:28', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33921, '100002', '1010', '1000', NULL, '2023-06-02 11:15:28', NULL, '2023-06-02 19:07:53', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33934, '100001', '1002', '1000', NULL, '2023-06-02 11:20:34', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33941, '100001', '40000104', '400001', NULL, '2023-06-02 11:23:09', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33942, '100001', '1004', '40000104', NULL, '2023-06-02 11:23:09', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33943, '100001', '1003', '40000104', NULL, '2023-06-02 11:23:09', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33944, '100001', '1002', '1000', NULL, '2023-06-02 11:23:09', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33945, '100001', '1001', '40000104', NULL, '2023-06-02 11:23:09', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33946, '100001', '1005', '40000104', NULL, '2023-06-02 11:23:09', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33955, '100001', '1002', '1000', NULL, '2023-06-02 19:03:03', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33957, '100002', '10022107', '100221', NULL, '2023-06-02 19:03:08', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (33958, '100002', '1004', '10022107', NULL, '2023-06-02 19:03:08', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33959, '100002', '1003', '10022107', NULL, '2023-06-02 19:03:08', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33960, '100002', '1002', '1000', NULL, '2023-06-02 19:03:08', NULL, '2023-06-02 19:03:51', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33961, '100002', '1001', '10022107', NULL, '2023-06-02 19:03:08', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33962, '100002', '1007', '1000', NULL, '2023-06-02 19:16:48', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (33963, '100001', '1007', '1000', NULL, '2023-06-02 19:20:48', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34003, '100002', '10000103', '100001', NULL, '2023-06-05 09:17:18', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34004, '100002', '1004', '10000103', NULL, '2023-06-05 09:17:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34005, '100002', '1003', '10000103', NULL, '2023-06-05 09:17:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34006, '100002', '1002', '10000103', NULL, '2023-06-05 09:17:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34007, '100002', '1001', '10000103', NULL, '2023-06-05 09:17:18', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34042, '100001', '100220', '1000', NULL, '2023-06-05 10:23:14', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34104, '100001', '100112', '1013', NULL, '2023-06-07 14:52:45', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34105, '100001', '1013', '1000', NULL, '2023-06-07 14:52:45', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34106, '100001', '1003', '100112', NULL, '2023-06-07 14:52:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34107, '100001', '1001', '100112', NULL, '2023-06-07 14:52:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34108, '100001', '1004', '100112', NULL, '2023-06-07 14:52:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34109, '100001', '1002', '100112', NULL, '2023-06-07 14:52:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34110, '100001', '1005', '100112', NULL, '2023-06-07 14:52:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34116, '100002', '100112', '1013', NULL, '2023-06-07 15:17:33', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34117, '100002', '1003', '100112', NULL, '2023-06-07 15:17:33', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34118, '100002', '1001', '100112', NULL, '2023-06-07 15:17:33', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34119, '100002', '1004', '100112', NULL, '2023-06-07 15:17:33', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34120, '100002', '1002', '100112', NULL, '2023-06-07 15:17:33', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34121, '100002', '1005', '100112', NULL, '2023-06-07 15:17:33', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34127, '100002', '100225', '1002', NULL, '2023-06-07 15:17:39', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34128, '100002', '1004', '100225', NULL, '2023-06-07 15:17:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34129, '100002', '1003', '100225', NULL, '2023-06-07 15:17:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34130, '100002', '1002', '100225', NULL, '2023-06-07 15:17:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34131, '100002', '1001', '100225', NULL, '2023-06-07 15:17:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34132, '100002', '1005', '100225', NULL, '2023-06-07 15:17:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34144, '100001', '10000103', '100001', NULL, '2023-06-12 14:48:41', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34145, '100001', '1004', '10000103', NULL, '2023-06-12 14:48:41', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34146, '100001', '1003', '10000103', NULL, '2023-06-12 14:48:41', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34147, '100001', '1002', '10000103', NULL, '2023-06-12 14:48:41', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34148, '100001', '1001', '10000103', NULL, '2023-06-12 14:48:41', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34158, '100001', '10000201', '100002', NULL, '2023-06-16 18:02:54', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34159, '100001', '100002', '1000', NULL, '2023-06-16 18:02:54', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34160, '100001', '1004', '10000201', NULL, '2023-06-16 18:02:54', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34161, '100001', '1003', '10000201', NULL, '2023-06-16 18:02:54', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34162, '100001', '1002', '10000201', NULL, '2023-06-16 18:02:54', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34163, '100001', '1001', '10000201', NULL, '2023-06-16 18:02:54', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34164, '100001', '10000202', '100002', NULL, '2023-06-16 18:02:57', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34165, '100001', '1004', '10000202', NULL, '2023-06-16 18:02:57', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34166, '100001', '1003', '10000202', NULL, '2023-06-16 18:02:57', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34167, '100001', '1002', '10000202', NULL, '2023-06-16 18:02:57', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34168, '100001', '1001', '10000202', NULL, '2023-06-16 18:02:57', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34200, '100001', '100226', '1002', NULL, '2023-09-15 13:51:56', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34201, '100001', '1004', '100226', NULL, '2023-09-15 13:51:56', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34202, '100001', '1003', '100226', NULL, '2023-09-15 13:51:56', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34203, '100001', '1002', '100226', NULL, '2023-09-15 13:51:56', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34204, '100001', '1001', '100226', NULL, '2023-09-15 13:51:56', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34205, '100001', '100227', '1002', NULL, '2023-10-09 09:56:39', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34206, '100001', '1004', '100227', NULL, '2023-10-09 09:56:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34207, '100001', '1003', '100227', NULL, '2023-10-09 09:56:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34208, '100001', '1002', '100227', NULL, '2023-10-09 09:56:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34209, '100001', '1001', '100227', NULL, '2023-10-09 09:56:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34225, '100001', '10021904', '1013', NULL, '2023-11-06 15:23:40', NULL, '2023-11-07 17:50:07', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34226, '100001', '1004', '10021904', NULL, '2023-11-06 15:23:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34227, '100001', '1003', '10021904', NULL, '2023-11-06 15:23:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34228, '100001', '1002', '10021904', NULL, '2023-11-06 15:23:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34229, '100001', '1001', '10021904', NULL, '2023-11-06 15:23:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34230, '100002', '100223', '1002', NULL, '2023-11-07 14:15:41', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34231, '100002', '1004', '100223', NULL, '2023-11-07 14:15:41', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34232, '100002', '1003', '100223', NULL, '2023-11-07 14:15:41', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34233, '100002', '1002', '100223', NULL, '2023-11-07 14:15:41', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34234, '100002', '1001', '100223', NULL, '2023-11-07 14:15:41', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34250, '100002', '100401', '1004', NULL, '2023-11-29 10:07:16', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34251, '100002', '1003', '100401', NULL, '2023-11-29 10:07:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34252, '100002', '1001', '100401', NULL, '2023-11-29 10:07:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34253, '100002', '1002', '100401', NULL, '2023-11-29 10:07:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34254, '100002', '1004', '100401', NULL, '2023-11-29 10:07:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34295, '100001', '10022108', '100003', NULL, '2023-12-01 16:35:47', NULL, '2024-03-28 14:14:28', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34296, '100001', '1004', '10022108', NULL, '2023-12-01 16:35:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34297, '100001', '1003', '10022108', NULL, '2023-12-01 16:35:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34298, '100001', '1002', '10022108', NULL, '2023-12-01 16:35:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34299, '100001', '1001', '10022108', NULL, '2023-12-01 16:35:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34351, '100002', '1002210601', '10022106', NULL, '2023-12-06 15:12:01', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34352, '100002', '1004', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34353, '100002', '1003', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34354, '100002', '1002', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34355, '100002', '1001', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34356, '100002', '1005', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34357, '100002', '1006', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34358, '100002', '1007', '1000', NULL, '2023-12-06 15:12:01', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34359, '100002', '1008', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34360, '100002', '1009', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34361, '100002', '1010', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34362, '100002', '1011', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34363, '100002', '1012', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34364, '100002', '1013', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34365, '100002', '1014', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34366, '100002', '1015', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34367, '100002', '1016', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34368, '100002', '1017', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34369, '100002', '1018', '1002210601', NULL, '2023-12-06 15:12:01', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34370, '100001', '1002210501', '10022105', NULL, '2023-12-08 17:51:40', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34371, '100001', '1004', '1002210501', NULL, '2023-12-08 17:51:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34372, '100001', '1003', '1002210501', NULL, '2023-12-08 17:51:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34373, '100001', '1002', '1002210501', NULL, '2023-12-08 17:51:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34374, '100001', '1001', '1002210501', NULL, '2023-12-08 17:51:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34375, '100001', '1006', '1002210501', NULL, '2023-12-08 17:51:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34376, '100001', '1007', '1000', NULL, '2023-12-08 17:51:40', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34377, '100001', '1008', '1002210501', NULL, '2023-12-08 17:51:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34378, '100001', '1005', '1002210501', NULL, '2023-12-08 17:51:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34413, '100001', '1002210502', '10022105', NULL, '2024-01-10 14:01:47', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34414, '100001', '1004', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34415, '100001', '1003', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34416, '100001', '1002', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34417, '100001', '1001', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34418, '100001', '1005', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34419, '100001', '1006', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34420, '100001', '1007', '1000', NULL, '2024-01-10 14:01:47', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34421, '100001', '1008', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34422, '100001', '1009', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34423, '100001', '1010', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34424, '100001', '1011', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34425, '100001', '1012', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34426, '100001', '1013', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34427, '100001', '1014', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34428, '100001', '1015', '1002210502', NULL, '2024-01-10 14:01:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34533, '100001', '1007', '1000', NULL, '2024-01-10 14:16:14', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34555, '100001', '1007', '1000', NULL, '2024-01-10 14:57:57', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34574, '100001', '1007', '1000', NULL, '2024-01-10 14:58:04', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34582, '100001', '1002210602', '10022106', NULL, '2024-01-10 15:10:16', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34583, '100001', '1004', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34584, '100001', '1003', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34585, '100001', '1002', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34586, '100001', '1001', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34587, '100001', '1005', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34588, '100001', '1006', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34589, '100001', '1007', '1000', NULL, '2024-01-10 15:10:16', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34590, '100001', '1008', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34591, '100001', '1009', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34592, '100001', '1010', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34593, '100001', '1011', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34594, '100001', '1012', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34595, '100001', '1013', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34596, '100001', '1014', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34597, '100001', '1015', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34598, '100001', '1016', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34599, '100001', '1017', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34600, '100001', '1018', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34601, '100001', '1019', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34602, '100001', '1020', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34603, '100001', '1021', '1002210602', NULL, '2024-01-10 15:10:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34617, '100001', '10022005', '100220', NULL, '2024-01-25 14:27:44', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34618, '100001', '1004', '10022005', NULL, '2024-01-25 14:27:44', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34619, '100001', '1003', '10022005', NULL, '2024-01-25 14:27:44', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34620, '100001', '1002', '10022005', NULL, '2024-01-25 14:27:44', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34621, '100001', '1001', '10022005', NULL, '2024-01-25 14:27:44', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34622, '100001', '1005', '10022005', NULL, '2024-01-25 14:27:44', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34649, '100001', '100221', '1000', NULL, '2024-02-26 09:22:14', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34654, '100001', '10022107', '100221', NULL, '2024-02-26 11:03:48', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34655, '100001', '1004', '10022107', NULL, '2024-02-26 11:03:48', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34656, '100001', '1003', '10022107', NULL, '2024-02-26 11:03:48', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34657, '100001', '1002', '10022107', NULL, '2024-02-26 11:03:48', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34658, '100001', '1001', '10022107', NULL, '2024-02-26 11:03:48', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34659, '100001', '1005', '10022107', NULL, '2024-02-26 11:03:48', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34660, '100001', '1006', '10022107', NULL, '2024-02-26 11:03:48', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34661, '100001', '1007', '1000', NULL, '2024-02-26 11:03:48', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34662, '100001', '1008', '10022107', NULL, '2024-02-26 11:03:48', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34663, '100001', '10022109', '100003', NULL, '2024-02-29 14:13:20', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34664, '100001', '100003', '1000', NULL, '2024-02-29 14:13:20', NULL, '2024-02-29 14:19:13', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34665, '100001', '1004', '10022109', NULL, '2024-02-29 14:13:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34666, '100001', '1003', '10022109', NULL, '2024-02-29 14:13:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34667, '100001', '1002', '10022109', NULL, '2024-02-29 14:13:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34668, '100001', '1001', '10022109', NULL, '2024-02-29 14:13:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34669, '100001', '1005', '10022109', NULL, '2024-02-29 14:13:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34670, '100001', '10022004', '100003', NULL, '2024-02-29 14:22:36', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34671, '100001', '1004', '10022004', NULL, '2024-02-29 14:22:36', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34672, '100001', '1003', '10022004', NULL, '2024-02-29 14:22:36', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34673, '100001', '1002', '10022004', NULL, '2024-02-29 14:22:36', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34674, '100001', '1001', '10022004', NULL, '2024-02-29 14:22:36', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34675, '100001', '100223', '100004', NULL, '2024-02-29 14:23:25', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34676, '100001', '100004', '1000', NULL, '2024-02-29 14:23:25', NULL, '2024-02-29 14:24:02', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34677, '100001', '1004', '100223', NULL, '2024-02-29 14:23:25', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34678, '100001', '1003', '100223', NULL, '2024-02-29 14:23:25', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34679, '100001', '1002', '100223', NULL, '2024-02-29 14:23:25', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34680, '100001', '1001', '100223', NULL, '2024-02-29 14:23:25', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34691, '100001', '100224', '100004', NULL, '2024-02-29 14:28:27', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34692, '100001', '1004', '100224', NULL, '2024-02-29 14:28:27', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34693, '100001', '1003', '100224', NULL, '2024-02-29 14:28:27', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34694, '100001', '1001', '100224', NULL, '2024-02-29 14:28:27', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34695, '100001', '10000301', '100003', NULL, '2024-03-28 14:16:06', NULL, '2024-03-28 14:16:50', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34696, '100001', '1004', '10000301', NULL, '2024-03-28 14:16:06', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34697, '100001', '1003', '10000301', NULL, '2024-03-28 14:16:06', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34698, '100001', '1002', '10000301', NULL, '2024-03-28 14:16:06', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34699, '100001', '1001', '10000301', NULL, '2024-03-28 14:16:06', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34700, '100001', '100701', '1007', NULL, '2024-05-14 15:51:20', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34701, '100001', '1007', '1000', NULL, '2024-05-14 15:51:20', NULL, '2024-07-31 10:22:55', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34702, '100001', '1004', '100701', NULL, '2024-05-14 15:51:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34703, '100001', '1003', '100701', NULL, '2024-05-14 15:51:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34704, '100001', '1002', '100701', NULL, '2024-05-14 15:51:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34705, '100001', '1001', '100701', NULL, '2024-05-14 15:51:20', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34706, '100001', '100702', '1007', NULL, '2024-05-14 15:51:23', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34707, '100001', '1004', '100702', NULL, '2024-05-14 15:51:23', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34708, '100001', '1003', '100702', NULL, '2024-05-14 15:51:23', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34709, '100001', '1002', '100702', NULL, '2024-05-14 15:51:23', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34710, '100001', '1001', '100702', NULL, '2024-05-14 15:51:23', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34711, '100001', '1005', '100702', NULL, '2024-05-14 15:51:23', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34712, '100001', '100703', '1007', NULL, '2024-05-14 15:51:25', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34713, '100001', '1004', '100703', NULL, '2024-05-14 15:51:25', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34714, '100001', '1003', '100703', NULL, '2024-05-14 15:51:25', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34715, '100001', '1002', '100703', NULL, '2024-05-14 15:51:25', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34716, '100001', '1001', '100703', NULL, '2024-05-14 15:51:25', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34755, '100001', '10022005', '100220', NULL, '2024-05-27 15:50:16', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34756, '100001', '100220', '1000', NULL, '2024-05-27 15:50:16', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34757, '100001', '1004', '10022005', NULL, '2024-05-27 15:50:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34758, '100001', '1003', '10022005', NULL, '2024-05-27 15:50:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34759, '100001', '1002', '10022005', NULL, '2024-05-27 15:50:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34760, '100001', '1001', '10022005', NULL, '2024-05-27 15:50:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34761, '100001', '1005', '10022005', NULL, '2024-05-27 15:50:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34762, '100001', '1006', '10022005', NULL, '2024-05-27 15:50:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34763, '100001', '1007', '1000', NULL, '2024-05-27 15:50:16', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34764, '100001', '1008', '10022005', NULL, '2024-05-27 15:50:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34765, '100001', '1009', '10022005', NULL, '2024-05-27 15:50:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34766, '100001', '1010', '10022005', NULL, '2024-05-27 15:50:16', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34901, '100001', '10000302', '100003', NULL, '2024-06-18 10:22:21', NULL, '2024-07-15 17:55:16', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34902, '100001', '1004', '10000302', NULL, '2024-06-18 10:22:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34903, '100001', '1003', '10000302', NULL, '2024-06-18 10:22:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34904, '100001', '1002', '10000302', NULL, '2024-06-18 10:22:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34905, '100001', '1001', '10000302', NULL, '2024-06-18 10:22:21', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34976, '100001', '1007', '1000', NULL, '2024-07-10 16:39:29', NULL, '2024-07-31 10:22:55', '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34992, '100001', '1002210504', '10022105', NULL, '2024-08-01 11:07:12', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (34993, '100001', '1004', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34994, '100001', '1003', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34995, '100001', '1002', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34996, '100001', '1001', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34997, '100001', '1005', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34998, '100001', '1006', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (34999, '100001', '1007', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35000, '100001', '1008', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35001, '100001', '1009', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35002, '100001', '1010', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35003, '100001', '1011', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35004, '100001', '1012', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35005, '100001', '1013', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35006, '100001', '1014', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35007, '100001', '1015', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35008, '100001', '1016', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35009, '100001', '1017', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35010, '100001', '1018', '1002210504', NULL, '2024-08-01 11:07:12', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35011, '100001', '1002210505', '10022105', NULL, '2024-08-01 11:07:19', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35012, '100001', '1004', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35013, '100001', '1003', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35014, '100001', '1002', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35015, '100001', '1001', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35016, '100001', '1005', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35017, '100001', '1006', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35018, '100001', '1007', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35019, '100001', '1008', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35020, '100001', '1009', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35021, '100001', '1010', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35022, '100001', '1011', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35023, '100001', '1012', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35024, '100001', '1013', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35025, '100001', '1014', '1002210505', NULL, '2024-08-01 11:07:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35031, '100001', '101301', '1013', NULL, '2024-08-16 09:40:32', NULL, '2024-08-16 14:14:42', '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35032, '100001', '1004', '101301', NULL, '2024-08-16 09:40:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35033, '100001', '1003', '101301', NULL, '2024-08-16 09:40:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35034, '100001', '1002', '101301', NULL, '2024-08-16 09:40:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35035, '100001', '1001', '101301', NULL, '2024-08-16 09:40:32', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35036, '100002', '10021904', '1013', NULL, '2024-08-29 13:48:40', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35037, '100002', '1004', '10021904', NULL, '2024-08-29 13:48:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35038, '100002', '1003', '10021904', NULL, '2024-08-29 13:48:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35039, '100002', '1002', '10021904', NULL, '2024-08-29 13:48:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35040, '100002', '1001', '10021904', NULL, '2024-08-29 13:48:40', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35041, '100002', '1006', '1000', NULL, '2024-08-29 13:48:42', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35042, '100002', '1003', '1006', NULL, '2024-08-29 13:48:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35043, '100002', '1001', '1006', NULL, '2024-08-29 13:48:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35044, '100002', '1004', '1006', NULL, '2024-08-29 13:48:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35045, '100002', '1002', '1006', NULL, '2024-08-29 13:48:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35046, '100001', '40000107', '400001', NULL, '2024-08-29 13:54:40', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35047, '100001', '1004', '40000107', NULL, '2024-08-29 13:54:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35048, '100001', '1003', '40000107', NULL, '2024-08-29 13:54:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35049, '100001', '1002', '40000107', NULL, '2024-08-29 13:54:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35050, '100001', '1001', '40000107', NULL, '2024-08-29 13:54:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35051, '100001', '1005', '40000107', NULL, '2024-08-29 13:54:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35052, '100001', '1006', '40000107', NULL, '2024-08-29 13:54:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35053, '100001', '1007', '40000107', NULL, '2024-08-29 13:54:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35054, '100001', '1008', '40000107', NULL, '2024-08-29 13:54:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35055, '100001', '1009', '40000107', NULL, '2024-08-29 13:54:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35056, '100001', '1010', '40000107', NULL, '2024-08-29 13:54:39', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35057, '100001', '40000103', '400001', NULL, '2024-08-29 13:54:42', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35058, '100001', '1004', '40000103', NULL, '2024-08-29 13:54:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35059, '100001', '1003', '40000103', NULL, '2024-08-29 13:54:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35060, '100001', '1002', '40000103', NULL, '2024-08-29 13:54:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35061, '100001', '1001', '40000103', NULL, '2024-08-29 13:54:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35062, '100001', '1014', '40000103', NULL, '2024-08-29 13:54:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35063, '100001', '1008', '40000103', NULL, '2024-08-29 13:54:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35064, '100001', '1010', '40000103', NULL, '2024-08-29 13:54:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35065, '100001', '1009', '40000103', NULL, '2024-08-29 13:54:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35066, '100001', '1011', '40000103', NULL, '2024-08-29 13:54:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35067, '100001', '1012', '40000103', NULL, '2024-08-29 13:54:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35068, '100001', '1005', '40000103', NULL, '2024-08-29 13:54:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35069, '100001', '1013', '40000103', NULL, '2024-08-29 13:54:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35070, '100001', '1007', '40000103', NULL, '2024-08-29 13:54:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35071, '100001', '40000101', '400001', NULL, '2024-08-29 13:54:45', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35072, '100001', '1001', '40000101', NULL, '2024-08-29 13:54:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35073, '100001', '1010', '40000101', NULL, '2024-08-29 13:54:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35074, '100001', '1011', '40000101', NULL, '2024-08-29 13:54:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35075, '100001', '1002', '40000101', NULL, '2024-08-29 13:54:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35076, '100001', '1003', '40000101', NULL, '2024-08-29 13:54:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35077, '100001', '1004', '40000101', NULL, '2024-08-29 13:54:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35078, '100001', '1005', '40000101', NULL, '2024-08-29 13:54:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35079, '100001', '1006', '40000101', NULL, '2024-08-29 13:54:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35080, '100001', '1008', '40000101', NULL, '2024-08-29 13:54:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35081, '100001', '1009', '40000101', NULL, '2024-08-29 13:54:45', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35082, '100001', '1002210503', '10022105', NULL, '2024-09-06 15:03:03', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35083, '100001', '1004', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35084, '100001', '1003', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35085, '100001', '1002', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35086, '100001', '1001', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35087, '100001', '1005', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35088, '100001', '1006', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35089, '100001', '1007', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35090, '100001', '1008', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35091, '100001', '1009', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35092, '100001', '1010', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35093, '100001', '1011', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35094, '100001', '1012', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35095, '100001', '1013', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35096, '100001', '1014', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35097, '100001', '1015', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35098, '100001', '1016', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35099, '100001', '1017', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35100, '100001', '1018', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35101, '100001', '1019', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35102, '100001', '1020', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35103, '100001', '1021', '1002210503', NULL, '2024-09-06 15:03:03', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35267, '100001', '100219', '1002', NULL, '2024-09-25 10:50:51', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35268, '100001', '1001', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35269, '100001', '1005', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35270, '100001', '1014', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35271, '100001', '1017', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35272, '100001', '1021', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35273, '100001', '1024', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35274, '100001', '1027', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35275, '100001', '1029', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35276, '100001', '1030', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35277, '100001', '1032', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35278, '100001', '1033', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35279, '100001', '1035', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35280, '100001', '1037', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35281, '100001', '1003', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35282, '100001', '1006', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35283, '100001', '1002', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35284, '100001', '1015', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35285, '100001', '1018', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35286, '100001', '1022', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35287, '100001', '1025', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35288, '100001', '1028', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35289, '100001', '1004', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35290, '100001', '1008', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35291, '100001', '1016', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35292, '100001', '1019', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35293, '100001', '1020', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35294, '100001', '1023', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35295, '100001', '1026', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35296, '100001', '1009', '100219', NULL, '2024-09-25 10:50:51', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35297, '100001', '100225', '1002', NULL, '2024-11-05 14:37:37', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35298, '100001', '1004', '100225', NULL, '2024-11-05 14:37:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35299, '100001', '1003', '100225', NULL, '2024-11-05 14:37:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35300, '100001', '1002', '100225', NULL, '2024-11-05 14:37:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35301, '100001', '1001', '100225', NULL, '2024-11-05 14:37:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35302, '100001', '1005', '100225', NULL, '2024-11-05 14:37:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35303, '100001', '1006', '100225', NULL, '2024-11-05 14:37:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35304, '100001', '1007', '100225', NULL, '2024-11-05 14:37:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35305, '100001', '1008', '100225', NULL, '2024-11-05 14:37:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35306, '100001', '1009', '100225', NULL, '2024-11-05 14:37:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35307, '100001', '1010', '100225', NULL, '2024-11-05 14:37:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35308, '100001', '1011', '100225', NULL, '2024-11-05 14:37:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35309, '100001', '1012', '100225', NULL, '2024-11-05 14:37:37', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35323, '100001', '400009', '4000', NULL, '2024-11-05 16:28:38', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35324, '100001', '1004', '400009', NULL, '2024-11-05 16:28:38', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35325, '100001', '1003', '400009', NULL, '2024-11-05 16:28:38', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35331, '100001', '10000303', '100003', NULL, '2024-11-05 16:54:47', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35332, '100001', '1004', '10000303', NULL, '2024-11-05 16:54:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35333, '100001', '1003', '10000303', NULL, '2024-11-05 16:54:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35334, '100001', '1002', '10000303', NULL, '2024-11-05 16:54:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35335, '100001', '1001', '10000303', NULL, '2024-11-05 16:54:47', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35341, '100001', '101303', '1013', NULL, '2025-01-16 17:37:42', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35342, '100001', '1001', '101303', NULL, '2025-01-16 17:37:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35343, '100001', '1002', '101303', NULL, '2025-01-16 17:37:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35344, '100001', '1003', '101303', NULL, '2025-01-16 17:37:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35345, '100001', '1004', '101303', NULL, '2025-01-16 17:37:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35346, '100001', '1005', '101303', NULL, '2025-01-16 17:37:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35347, '100001', '1006', '101303', NULL, '2025-01-16 17:37:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35348, '100001', '1007', '101303', NULL, '2025-01-16 17:37:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35349, '100001', '1008', '101303', NULL, '2025-01-16 17:37:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35350, '100001', '1009', '101303', NULL, '2025-01-16 17:37:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35351, '100001', '1010', '101303', NULL, '2025-01-16 17:37:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35352, '100001', '1011', '101303', NULL, '2025-01-16 17:37:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35353, '100001', '1012', '101303', NULL, '2025-01-16 17:37:42', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35354, '100001', '101302', '1013', NULL, '2025-01-21 14:11:19', NULL, NULL, '否', NULL);
INSERT INTO `clgroupmenus` VALUES (35355, '100001', '1004', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35356, '100001', '1003', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35357, '100001', '1002', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35358, '100001', '1001', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35359, '100001', '1005', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35360, '100001', '1006', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35361, '100001', '1007', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35362, '100001', '1008', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35363, '100001', '1009', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35364, '100001', '1010', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35365, '100001', '1011', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35366, '100001', '1012', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35367, '100001', '1013', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35368, '100001', '1014', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35369, '100001', '1015', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35370, '100001', '1016', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35371, '100001', '1017', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35372, '100001', '1018', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35373, '100001', '1019', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35374, '100001', '1020', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35375, '100001', '1021', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);
INSERT INTO `clgroupmenus` VALUES (35376, '100001', '1022', '101302', NULL, '2025-01-21 14:11:19', NULL, NULL, '是', NULL);

-- ----------------------------
-- Table structure for clgroups
-- ----------------------------
DROP TABLE IF EXISTS `clgroups`;
CREATE TABLE `clgroups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `grpid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色ID',
  `grpname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色添加账户',
  `createdate` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `isenable` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否启用',
  `systemid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统ID',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delflag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '删除标识',
  `isplatform` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否平台',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clgroups
-- ----------------------------
INSERT INTO `clgroups` VALUES (1, '100001', 'SYSMA', 'SYSMA', 'admin', '2019-03-01 15:43:29', '1', 'CENTER', NULL, NULL, NULL, NULL, '否', NULL);
INSERT INTO `clgroups` VALUES (105, '100002', '开发', '开发', NULL, '2023-06-02 11:07:38', NULL, NULL, NULL, NULL, NULL, NULL, '否', '');

-- ----------------------------
-- Table structure for clgroupusers
-- ----------------------------
DROP TABLE IF EXISTS `clgroupusers`;
CREATE TABLE `clgroupusers`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `grpid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clgroupusers`(`userid`, `grpid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2524 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clgroupusers
-- ----------------------------
INSERT INTO `clgroupusers` VALUES (1882, '100001', 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '1', '2019-12-11 15:14:36', '1', '2022-07-04 10:03:51');
INSERT INTO `clgroupusers` VALUES (2519, '100002', 'Np5Av8Wm8Hr4Sq8Fh7Vz', NULL, NULL, NULL, NULL);
INSERT INTO `clgroupusers` VALUES (2520, '100001', 'Xv8Wo5Lq1Yr8Gw0Tj10Zk', NULL, '2023-06-12 15:08:20', NULL, NULL);
INSERT INTO `clgroupusers` VALUES (2521, '100001', 'Xk8Se6Ks2Ty8Jm3Td4Pl', NULL, '2023-06-12 15:13:44', NULL, NULL);
INSERT INTO `clgroupusers` VALUES (2523, '100001', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', NULL, '2024-08-29 13:55:41', NULL, NULL);

-- ----------------------------
-- Table structure for cllabor
-- ----------------------------
DROP TABLE IF EXISTS `cllabor`;
CREATE TABLE `cllabor`  (
  `id` bigint(20) NOT NULL,
  `labornum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人员编号',
  `laborname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `deptnum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属部门',
  `craft` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `jobcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务',
  `homephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭电话',
  `mobilephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动电话',
  `officephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话',
  `workaddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作地址',
  `homeaddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `postcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `birthdate` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `systemid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统ID',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delflag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标识',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cllabor
-- ----------------------------
INSERT INTO `cllabor` VALUES (1, 'yk', '杨凯', '开发部', '车间', '程序猿', '18823231940', '19209346782', '12986483729', '立水桥南', '朝阳区', '124@qq.com', '832208', '2019-06-14 00:00:00', 'CENTER', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for clmenus
-- ----------------------------
DROP TABLE IF EXISTS `clmenus`;
CREATE TABLE `clmenus`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `menunum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单编号',
  `menuname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menutype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单类型',
  `haschild` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否有子级',
  `parent` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级',
  `image` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `menuid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单ID',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `isfun` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否功能点',
  `orderby` bigint(20) NULL DEFAULT NULL COMMENT '排序',
  `issys` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否系统级',
  `isvisible` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否显示',
  `systemid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统ID',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delflag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '删除标识',
  `imagepath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'image路径',
  `menudesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单描述',
  `menuurl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `menukey` bigint(20) NULL DEFAULT NULL COMMENT '区分系统菜单',
  `menuparams` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单使用参数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clmenus_1`(`menunum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1830 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clmenus
-- ----------------------------
INSERT INTO `clmenus` VALUES (1, '1000', '采集配置', '系统', '是', '', '', 'lllggg', 'adminA', '2020-12-31 09:02:29', '', NULL, '是', '', 'CENTER', NULL, NULL, '否', NULL, '采集配置', NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (3, '1002', '建模管理', '目录', '是', '1000', 'block', 'monitor', 'adminA', '2019-09-09 10:45:39', '否', 2, '是', '', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (4, '1003', '数据分析', '菜单', '是', '1000', 'database', 'dataManage', 'adminA', '2019-12-11 15:10:49', '否', 10, '是', '是', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (13, '10021803', '报警代码', '菜单', '否', '1013', 'bars', 'warnCode', 'adminA', '2019-09-09 16:06:07', '否', 8, '是', '是', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (16, '10021903', '设备列表', '菜单', '否', '1013', 'bars', 'account', 'adminA', '2019-06-06 09:02:29', '否', 0, '是', '是', 'CENTER', NULL, NULL, '是', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (17, '10021802', '测点集合', '菜单', '否', '100218', 'devicecategory', 'pointSet', 'adminA', '2019-09-09 10:46:08', '否', 5, '是', '是', 'CENTER', 'adminA', '2019-04-25 17:03:18', '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (18, '10021801', '标准测点', '菜单', '否', '100218', 'standardpoint', 'standard', 'adminA', '2019-09-09 10:45:39', '否', 1, '是', '是', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (19, '100219', '工厂建模', '菜单', '否', '1002', 'cluster', 'position', 'adminA', '2019-12-11 15:10:49', '否', 3, '否', '', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (20, '100208', '数据集', '导航', '否', '1004', 'bars', 'data', 'adminA', '2019-06-24 14:04:56', '否', 8, '是', '是', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (23, '10021902', '设备类型', '菜单', '否', '1013', 'bars', 'deviceType', 'adminA', '2019-04-25 17:02:51', '否', 10, '是', '是', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (27, '100304', '趋势分析', '导航', '否', '1003', 'branches', 'history', 'adminA', '2019-09-09 16:06:07', '否', 4, '是', '是', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (91, '10021804', '计算测点', '菜单', '否', '100222', 'branches', 'compute', 'adminA', '2019-09-09 16:06:20', '否', 13, '是', '是', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (166, '100218', '测点定义', '导航', '是', '1013', 'bars', 'point', 'adminA', '2019-12-23 15:05:09', '否', 5, '否', '否', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (168, '100220', '通讯协议', '导航', '是', '1000', 'branches', 'agreement', 'adminA', '2019-12-23 15:27:09', '否', 3, '否', '否', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (169, '100221', '采集管理', '导航', '是', '1000', 'skin', 'gateway', 'adminA', '2019-12-23 15:28:07', '否', 9, '否', '否', 'CENTER', NULL, '2024-03-28 14:14:28', '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (170, '10022003', '协议设置', '菜单', '否', '100220', 'hdd', 'agreementSet', 'adminA', '2019-12-23 15:28:07', '否', 1, '是', '是', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (171, '100112', '全局参数', '菜单', '否', '1013', 'bars', 'code', 'adminA', '2019-12-27 14:25:39', '否', 20, '否', '否', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (176, '100222', '规则管理', '导航', '是', '1013', 'bars', 'rule', 'adminA', '2020-04-08 13:56:00', '否', 15, '否', '否', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (177, '10022201', '预警规则', '菜单', '否', '100222', 'rulemanageattr', 'earlyWarn', 'adminA', '2020-04-08 14:02:45', '否', 1, '是', '是', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (178, '10022202', '状态规则', '菜单', '否', '100222', 'statuscodeatrr', 'status', 'adminA', '2020-04-23 15:04:49', '否', 2, '是', '是', 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (317, '1004', '主题管理', '菜单', '是', '1000', 'skin', 'topicadmin', 'adminA', '2021-01-18 16:17:12', '否', 10, '是', NULL, 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (319, '100401', '系统主题', '菜单', '否', '1004', 'hdd', 'systemTheme', 'adminA', '2021-01-18 16:29:26', '否', 5, '是', NULL, 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (320, '100402', '主题列表', '菜单', '否', '1004', 'bars', 'themeInfo', 'adminA', '2021-01-18 16:29:59', '否', 2, '是', NULL, 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (323, '1006', '首页', '菜单', '否', '1000', 'home', 'dashboard', 'adminA', '2021-01-18 17:02:43', '否', 0, '是', NULL, 'CENTER', NULL, NULL, '否', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (358, '1007', 'EMQ控制', '导航', '是', '1000', 'cluster', 'MEQManage', 'adminA', '2021-01-29 12:01:07', '否', 6, '是', NULL, 'CENTER', NULL, NULL, '否', NULL, '', NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (360, '100701', '监控', '导航', '否', '1007', 'block', 'supervisory', NULL, '2021-02-01 17:58:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '否', NULL, '系统信息', NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (361, '100702', '客户端', '导航', '否', '1007', 'hdd', 'info', NULL, '2021-02-01 17:59:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '否', NULL, '会话信息', NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (434, '1010', '开发管理', '菜单', '是', '1000', 'setting', 'development', NULL, '2021-02-26 17:55:56', NULL, 10, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (435, '101001', 'API管理', '导航', '否', '1010', 'bars', 'APIdevelop', NULL, '2021-02-26 17:57:00', NULL, 1, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', 'http://47.110.72.151:8887/inter/swagger-ui.html', NULL, NULL);
INSERT INTO `clmenus` VALUES (436, '101002', '接口管理', '导航', '否', '1010', 'setting', 'creatdevelop', NULL, '2021-02-26 17:57:39', NULL, 2, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', 'http://47.97.65.233:10008/cnbm/login', NULL, NULL);
INSERT INTO `clmenus` VALUES (437, '101003', '生成代码', '菜单', '否', '1010', 'branches', 'http', NULL, '2021-02-26 17:58:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', 'http://47.97.65.233:10009/generator/', NULL, NULL);
INSERT INTO `clmenus` VALUES (458, '100703', '主题', '菜单', '否', '1007', 'hdd', 'theme', NULL, '2021-03-04 14:03:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (623, '101004', '调度任务', '菜单', '否', '1010', 'cluster', 'dpassjob', NULL, '2021-03-17 18:50:22', NULL, 4, NULL, NULL, NULL, NULL, NULL, '否', NULL, '调度任务', 'http://192.168.7.39:7700', NULL, NULL);
INSERT INTO `clmenus` VALUES (722, '1013', '基础数据', '目录', '是', '1000', 'setting', 'device', NULL, '2021-04-12 11:11:44', NULL, 1, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (748, '4000', '系统配置', '系统', '是', '', 'home', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '否', NULL, '系统配置', NULL, NULL, NULL);
INSERT INTO `clmenus` VALUES (842, '400001', '系统管理', '目录', '是', '4000', 'block', 'system', NULL, '2021-04-17 10:25:48', NULL, 90, NULL, NULL, NULL, NULL, '2022-05-16 10:27:30', '否', NULL, '系统管理', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (843, '400003', '消息中心', '目录', '是', '4000', 'block', 'message', NULL, '2021-04-17 11:28:48', NULL, 20, NULL, NULL, NULL, NULL, NULL, '否', NULL, '通知中心', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (845, '400005', '告警中心', '目录', '是', '4000', 'bars', 'alarmCenter', NULL, '2021-04-17 11:30:41', NULL, 30, NULL, NULL, NULL, NULL, NULL, '否', NULL, '预警中心', '', NULL, '');
INSERT INTO `clmenus` VALUES (849, '400009', '首页', '菜单', '否', '4000', 'home', 'dashboard', NULL, '2021-04-17 11:32:35', NULL, 0, NULL, NULL, NULL, NULL, NULL, '否', NULL, '首页', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (855, '40000101', '用户管理', '菜单', '否', '400001', 'user', 'user', NULL, '2021-04-17 10:27:22', NULL, 2, NULL, NULL, NULL, NULL, NULL, '否', NULL, '用户管理', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (857, '40000103', '角色管理', '菜单', '否', '400001', 'cluster', 'role', NULL, '2021-04-17 11:12:03', NULL, 3, NULL, NULL, NULL, NULL, NULL, '否', NULL, '角色管理', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (858, '40000104', '菜单管理', '菜单', '否', '400001', 'ellipsis', 'menu', NULL, '2021-04-17 11:12:41', NULL, 4, NULL, NULL, NULL, NULL, NULL, '否', NULL, '菜单管理', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (859, '40000105', '数据字典', '菜单', '否', '400001', 'hdd', 'code', NULL, '2021-04-17 11:13:43', NULL, 5, NULL, NULL, NULL, NULL, NULL, '否', NULL, '数据字典', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (861, '40000107', '用户组管理', '菜单', '否', '400001', 'skin', 'userGroup', NULL, '2021-04-17 11:18:40', NULL, 15, NULL, NULL, NULL, NULL, NULL, '否', NULL, '用户组', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (875, '40000301', '通知公告', '菜单', '否', '400003', 'block', 'announcement', NULL, '2021-06-03 15:31:03', NULL, 1, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (876, '40000302', '我的消息', '菜单', '否', '400003', 'user', 'userAnnouncementList', NULL, '2021-06-03 15:31:36', NULL, 2, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (879, '40000109', '应用管理', '菜单', '否', '400001', 'setting', 'systemManagement', NULL, '2021-06-03 15:42:19', NULL, 6, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (959, '100305', '测点一览', '菜单', '否', '1003', 'bars', 'REP_Pointinfo', NULL, '2021-07-24 14:40:33', NULL, 30, NULL, NULL, NULL, NULL, NULL, '否', NULL, '测点信息查询', 'http://172.17.37.9:28883/ureport/preview?_u=sinoma-CPS测点查询.ureport.xml&_i=1&_n=CPS测点查询', NULL, NULL);
INSERT INTO `clmenus` VALUES (961, '100306', '模型一览', '菜单', '否', '1003', 'bars', 'RPT_cllocation', NULL, '2021-07-28 18:56:13', NULL, 50, NULL, NULL, NULL, NULL, NULL, '否', NULL, '工厂模型', 'http://172.17.37.9:28883/ureport/preview?_u=sinoma-%E5%B7%A5%E5%8E%82%E6%A8%A1%E5%9E%8B.ureport.xml&_n=%E5%B7%A5%E5%8E%82%E6%A8%A1%E5%9E%8B', NULL, NULL);
INSERT INTO `clmenus` VALUES (962, '40000303', '消息模板', '菜单', '否', '400003', 'skin', 'messageTemplate', NULL, '2021-08-03 11:21:28', NULL, 3, NULL, NULL, NULL, NULL, NULL, '否', NULL, '消息模板', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (963, '40000304', '我的告警处理', '菜单', '否', '400003', 'hdd', 'forewarningManagement', NULL, '2021-08-03 11:22:14', NULL, 4, NULL, NULL, NULL, NULL, NULL, '否', NULL, '预警管理', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (995, '40000501', '我的告警处理', '菜单', '否', '400005', 'cluster', 'forewarningManagement', NULL, '2021-08-14 14:33:36', NULL, 2, NULL, NULL, NULL, NULL, NULL, '否', NULL, '我的告警处理', '', NULL, '');
INSERT INTO `clmenus` VALUES (996, '40000502', '告警分类', '菜单', '否', '400005', 'branches', 'msgSort', NULL, '2021-08-14 14:34:07', NULL, 1, NULL, NULL, NULL, NULL, NULL, '否', NULL, '告警分类', '', NULL, '');
INSERT INTO `clmenus` VALUES (1072, '10022105', '汇聚网关', '目录', '是', '1000', 'cluster', 'GatherGateway', NULL, '2021-12-29 10:51:19', NULL, 7, NULL, NULL, NULL, NULL, NULL, '否', NULL, '汇聚网关', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (1073, '1002210501', 'kafka配置管理', '菜单', '否', '10022105', 'branches', 'kafkaConfig', NULL, '2021-12-29 10:51:44', NULL, 1, NULL, NULL, NULL, NULL, NULL, '否', NULL, 'kafka配置管理', '', NULL, '');
INSERT INTO `clmenus` VALUES (1074, '1002210502', 'kafka桥接服务', '菜单', '否', '10022105', 'block', 'kafkaBridgeService', NULL, '2021-12-29 10:52:06', NULL, 2, NULL, NULL, NULL, NULL, NULL, '否', NULL, 'kafka桥接服务', '', NULL, '');
INSERT INTO `clmenus` VALUES (1077, '100223', '全量测点', '菜单', '否', '100004', 'cluster', 'devicePoint', NULL, '2022-01-10 15:58:42', NULL, 2, NULL, NULL, NULL, NULL, NULL, '否', NULL, '设备测点', '', NULL, '');
INSERT INTO `clmenus` VALUES (1115, '1002210503', '解析服务管理', '菜单', '否', '10022105', 'branches', 'parsingServiceManagement', NULL, '2022-04-20 18:16:11', NULL, 3, NULL, NULL, NULL, NULL, NULL, '否', NULL, '解析服务管理', '', NULL, '');
INSERT INTO `clmenus` VALUES (1116, '1002210504', '存储服务管理', '菜单', '否', '10022105', 'cluster', 'storeService', NULL, '2022-04-20 18:16:47', NULL, 4, NULL, NULL, NULL, NULL, NULL, '否', NULL, '入库服务', '', NULL, '');
INSERT INTO `clmenus` VALUES (1117, '10022106', '边缘计算', '菜单', '是', '1000', 'hdd', 'EdgeComputing', NULL, '2022-04-20 18:17:47', NULL, 8, NULL, NULL, NULL, NULL, NULL, '否', NULL, '边缘计算', '', NULL, '');
INSERT INTO `clmenus` VALUES (1118, '1002210601', '测点计算', '菜单', '否', '10022106', 'cluster', 'pointComputing', NULL, '2022-04-20 18:20:59', NULL, 2, NULL, NULL, NULL, NULL, NULL, '否', NULL, '测点计算', '', NULL, '');
INSERT INTO `clmenus` VALUES (1119, '1002210602', '数据处理', '菜单', '否', '10022106', 'hdd', 'dataProcessingServe', NULL, '2022-04-20 18:21:34', NULL, 1, NULL, NULL, NULL, NULL, NULL, '否', NULL, '数据处理管理', '', NULL, '');
INSERT INTO `clmenus` VALUES (1802, '100224', '标准测点', '菜单', '否', '100004', 'cluster', 'reportPoint', NULL, '2023-05-22 14:02:17', NULL, 4, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1803, '100001', '告警管理', '目录', '是', '1000', 'user', 'warning', NULL, '2023-05-24 13:52:29', NULL, 5, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (1804, '10000101', '历史告警', '菜单', '否', '100001', 'cluster', 'hisWarning', NULL, '2023-05-24 13:53:31', NULL, 1, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1805, '10000102', '实时告警', '菜单', '否', '100001', 'branches', 'nowWarning', NULL, '2023-05-24 14:00:57', NULL, 0, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1806, '10000103', '告警模板', '菜单', '否', '100001', 'home', 'WarningTemplate', NULL, '2023-05-24 17:02:11', NULL, 1, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1807, '10000104', '测点分组', '菜单', '否', '100001', 'branches', 'warningFz', NULL, '2023-05-29 14:36:42', NULL, 4, NULL, NULL, NULL, NULL, NULL, '是', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1808, '100002', '规则管理', '目录', '是', '1000', 'home', 'rules', NULL, '2023-06-01 09:27:06', NULL, 4, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (1809, '10000201', '告警规则', '菜单', '否', '100002', 'branches', 'warningrules', NULL, '2023-06-01 09:27:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1810, '10000202', '计算规则', '菜单', '否', '100002', 'hdd', 'countRules', NULL, '2023-06-01 09:28:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1811, '100225', '设备列表', '菜单', '否', '1002', 'bars', 'account', NULL, '2023-06-02 09:31:25', NULL, 1, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1812, '100226', '测点建模', '菜单', '否', '1002', 'cluster', 'warningFz', NULL, '2023-06-02 09:36:51', NULL, 5, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1813, '10022107', '采集网关', '菜单', '否', '100221', 'branches', 'edgeGateway', NULL, '2023-06-02 19:02:24', NULL, 1, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1814, '100227', '建模监控', '菜单', '否', '1002', 'skin', 'warningFzMoni', NULL, '2023-10-09 09:56:08', NULL, 8, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1815, '10022004', '插件管理', '菜单', '否', '100003', 'block', 'pacManage', NULL, '2023-10-17 09:35:24', NULL, 2, NULL, NULL, NULL, NULL, NULL, '否', NULL, '插件管理', '', NULL, '');
INSERT INTO `clmenus` VALUES (1816, '10022005', '协议管理', '菜单', '否', '100220', 'branches', 'protManage', NULL, '2023-10-25 09:21:05', NULL, 3, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1817, '10021904', '节点管理', '菜单', '否', '1013', 'setting', 'nodeManage', 'admin', '2021-10-13 16:14:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '否', NULL, '节点管理', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (1819, '10022108', '服务编排', '菜单', '否', '100003', 'branches', 'serviceOrc', NULL, '2023-11-09 09:33:39', NULL, 3, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1820, '10022109', '主机管理', '菜单', '否', '100003', 'block', 'edgeService', NULL, '2023-11-24 09:55:19', NULL, 5, NULL, NULL, NULL, NULL, NULL, '否', NULL, '服务管理', '', NULL, '');
INSERT INTO `clmenus` VALUES (1821, '1002210505', '全局服务管理', '菜单', '否', '10022105', 'hdd', 'globalServiceManagement', NULL, '2024-01-08 16:19:49', NULL, 5, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1822, '100003', '运维管理', '目录', '是', '1000', 'hdd', 'OperationManagement', NULL, '2024-02-29 11:24:37', NULL, 11, NULL, NULL, NULL, NULL, '2024-03-28 14:14:28', '否', NULL, '', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (1823, '100004', '测点管理', '目录', '否', '1000', 'cluster', 'PointManager', NULL, '2024-02-29 14:16:48', NULL, 3, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, NULL);
INSERT INTO `clmenus` VALUES (1824, '10000301', 'Opc工具', '菜单', '否', '100003', 'cluster', 'iottest', NULL, '2024-03-28 14:15:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1825, '10000302', '数据发布', '菜单', '否', '100003', 'branches', 'datarelease', NULL, '2024-06-18 10:22:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1826, '101301', '设备状态', '菜单', '否', '1013', 'bars', 'stateManage', NULL, '2024-08-16 09:34:49', NULL, 21, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1827, '10000303', '采集服务', '菜单', '否', '100003', 'branches', 'dataAcq', NULL, '2024-09-19 10:56:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1828, '101302', '常量管理', '菜单', '否', '1013', 'setting', 'const-manage', NULL, '2024-10-21 14:25:35', NULL, 22, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');
INSERT INTO `clmenus` VALUES (1829, '101303', '工厂管理', '菜单', '否', '1013', 'setting', 'factory-manage', NULL, '2024-12-31 10:17:32', NULL, 23, NULL, NULL, NULL, NULL, NULL, '否', NULL, '', '', NULL, '');

-- ----------------------------
-- Table structure for clsysdepartment
-- ----------------------------
DROP TABLE IF EXISTS `clsysdepartment`;
CREATE TABLE `clsysdepartment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `deptid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `deptparent` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门父级',
  `syscode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '子系统组织架构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clsysdepartment
-- ----------------------------
INSERT INTO `clsysdepartment` VALUES (13, '1001', NULL, '43613ccd6a11f6f4a0c8cf450d13ddfc');
INSERT INTO `clsysdepartment` VALUES (14, '1001', NULL, '5f445f5682a4edf7fdd4a58e2c8433a5');

-- ----------------------------
-- Table structure for clsysgroups
-- ----------------------------
DROP TABLE IF EXISTS `clsysgroups`;
CREATE TABLE `clsysgroups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `grpid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `syscode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编码',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '子系统角色组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clsysgroups
-- ----------------------------
INSERT INTO `clsysgroups` VALUES (37, '100001', '43613ccd6a11f6f4a0c8cf450d13ddfc', NULL, NULL, NULL, NULL);
INSERT INTO `clsysgroups` VALUES (41, '100001', 'de9cc638bbc691fc209eefb28223a6b3', NULL, NULL, NULL, NULL);
INSERT INTO `clsysgroups` VALUES (45, '100001', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, NULL, NULL, NULL);
INSERT INTO `clsysgroups` VALUES (47, '100001', 'b534095fe2e4a0a6412ef173f97341c4', NULL, NULL, NULL, NULL);
INSERT INTO `clsysgroups` VALUES (48, '100001', '816c559a778a696fc4cc1bee286b4681', NULL, NULL, NULL, NULL);
INSERT INTO `clsysgroups` VALUES (51, '100001', '941e2c885096631f654463e831964efe', NULL, NULL, NULL, NULL);
INSERT INTO `clsysgroups` VALUES (58, '100001', '308aa9de360326909158fb28da364ae2', NULL, NULL, NULL, NULL);
INSERT INTO `clsysgroups` VALUES (62, '100001', '2b5ca062331ea5f6647fc474e6ee25dc', NULL, NULL, NULL, NULL);
INSERT INTO `clsysgroups` VALUES (88, '100001', 'af6fbe0eb78e50f181c8a15ddc3b77a7', NULL, NULL, NULL, NULL);
INSERT INTO `clsysgroups` VALUES (89, '100001', '880c40d659498e95a8064f4a6ecb0fe0', NULL, NULL, NULL, NULL);
INSERT INTO `clsysgroups` VALUES (95, '100001', '580c1c34156f60618a0cb32685ab8f93', NULL, NULL, NULL, NULL);
INSERT INTO `clsysgroups` VALUES (101, '100001', '6cb2b95afceb985af18fc996184f3d0e', NULL, NULL, NULL, NULL);
INSERT INTO `clsysgroups` VALUES (102, '100002', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, NULL, NULL, NULL);
INSERT INTO `clsysgroups` VALUES (103, '100002', '43613ccd6a11f6f4a0c8cf450d13ddfc', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for clsysmenu
-- ----------------------------
DROP TABLE IF EXISTS `clsysmenu`;
CREATE TABLE `clsysmenu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `syscode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编码',
  `menuroot` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单根节点',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clsysmenu`(`syscode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clsysmenu
-- ----------------------------
INSERT INTO `clsysmenu` VALUES (4, '43613ccd6a11f6f4a0c8cf450d13ddfc', '4000');
INSERT INTO `clsysmenu` VALUES (7, 'b534095fe2e4a0a6412ef173f97341c4', '3000');
INSERT INTO `clsysmenu` VALUES (12, '5f445f5682a4edf7fdd4a58e2c8433a5', '1000');
INSERT INTO `clsysmenu` VALUES (15, '1828857d62bb8055dce800c5967c4b1d', '8000');
INSERT INTO `clsysmenu` VALUES (18, '941e2c885096631f654463e831964efe', '9000');
INSERT INTO `clsysmenu` VALUES (19, 'b89ef1de028f6167d6d463ec43f73e60', '8000');
INSERT INTO `clsysmenu` VALUES (20, '880c40d659498e95a8064f4a6ecb0fe0', '8000');
INSERT INTO `clsysmenu` VALUES (21, '8726bc3354c696595c45546baf16f3ec', '7000');
INSERT INTO `clsysmenu` VALUES (22, '580c1c34156f60618a0cb32685ab8f93', '7000');
INSERT INTO `clsysmenu` VALUES (24, '6cb2b95afceb985af18fc996184f3d0e', '3000');
INSERT INTO `clsysmenu` VALUES (26, 'd5169bca7cab28944c69125035ca454c', '10000');

-- ----------------------------
-- Table structure for clsystem
-- ----------------------------
DROP TABLE IF EXISTS `clsystem`;
CREATE TABLE `clsystem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sysname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用名称',
  `syscode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用编号',
  `delflag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '删除标识',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `secretkey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密钥',
  `timesecretkey` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时效性密钥',
  `sysimgurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统应用图标',
  `sysurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统url',
  `systemdesc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统说明',
  `isplatform` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否平台',
  `orderby` int(11) NULL DEFAULT NULL COMMENT '排序',
  `isvisible` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否显示',
  `ishide` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否隐藏系统，是：在页面头部和中转页面不显示，否：在页面头部和中转页显示 （在子系统管理中该字段无效，显示全部系统）',
  `ismenu` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否使用平台菜单',
  `nav_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页业务应用分类|字典nav_type',
  `is_target` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否新页签打开|0否1是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clsystem`(`syscode`, `sysurl`, `orderby`, `secretkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '应用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clsystem
-- ----------------------------
INSERT INTO `clsystem` VALUES (16, '采集配置', '5f445f5682a4edf7fdd4a58e2c8433a5', '否', NULL, NULL, '2024-09-03 10:59:31', NULL, '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'icon-kanban', '/cps_ui/#/dashboard', '采集配置', '否', 75, '否', '是', '否', '1', '0');
INSERT INTO `clsystem` VALUES (32, '系统配置', '43613ccd6a11f6f4a0c8cf450d13ddfc', '否', '2021-04-17 10:23:53', NULL, '2023-05-19 17:58:58', NULL, '43613ccd6a11f6f4a0c8cf450d13ddfc', NULL, 'icon-huabanfuben', '/cps/#/dashboard', '业务中台', '否', 77, '否', '是', '否', '1', '0');

-- ----------------------------
-- Table structure for clsystem_user_link
-- ----------------------------
DROP TABLE IF EXISTS `clsystem_user_link`;
CREATE TABLE `clsystem_user_link`  (
  `link_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '映射id',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id;业务中台用户id',
  `sys_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子系统编号;子系统编码',
  `sys_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子系统用户;子系统用户id',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人;制单人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间;制单日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人;更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间;更新日期',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '子系统用户映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clsystem_user_link
-- ----------------------------
INSERT INTO `clsystem_user_link` VALUES (1, 'Xq4Ys0Gt5Rw1Cd2Qh7Kw', '5eb6782d6061055ac555e1ec59675998', 'Xq4Ys0Gt5Rw1Cd2Qh7Kw', NULL, NULL, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '2022-07-07 10:55:32');

-- ----------------------------
-- Table structure for cluserappid
-- ----------------------------
DROP TABLE IF EXISTS `cluserappid`;
CREATE TABLE `cluserappid`  (
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `appid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'appid',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别，ios、android',
  `time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cluserappid
-- ----------------------------

-- ----------------------------
-- Table structure for cluserdepe
-- ----------------------------
DROP TABLE IF EXISTS `cluserdepe`;
CREATE TABLE `cluserdepe`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `deptnum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户挂职部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cluserdepe
-- ----------------------------
INSERT INTO `cluserdepe` VALUES (56, 'Qo3Kp7Dc8Ha10Dt8Tg6Cd', '100106');
INSERT INTO `cluserdepe` VALUES (59, 'Db6Jy1Fn10Po8Mw10Vt6Ch', '100118');
INSERT INTO `cluserdepe` VALUES (60, 'Li2Hb7Tk5Dk8Nv7Vn2Ez', '100118');

-- ----------------------------
-- Table structure for clusergroup
-- ----------------------------
DROP TABLE IF EXISTS `clusergroup`;
CREATE TABLE `clusergroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `groupid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clusergroup`(`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组与用户关联关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clusergroup
-- ----------------------------
INSERT INTO `clusergroup` VALUES (1, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '03e251a9b1578d443adb7a4f5f1a693a');
INSERT INTO `clusergroup` VALUES (2, 'Np5Av8Wm8Hr4Sq8Fh7Vz', 'ba359855bb5f630d32c3aeac91752d30');
INSERT INTO `clusergroup` VALUES (3, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'ba359855bb5f630d32c3aeac91752d30');

-- ----------------------------
-- Table structure for clusers
-- ----------------------------
DROP TABLE IF EXISTS `clusers`;
CREATE TABLE `clusers`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `loginid` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '登录名',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthdate` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `deptnum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属部门',
  `craft` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `jobcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `workphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话',
  `workaddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址',
  `homephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭电话',
  `homeaddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址',
  `mobilephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动电话',
  `postcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `isenable` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否启用',
  `forbiddentime` bigint(20) NULL DEFAULT NULL COMMENT '禁用时间',
  `lastfaillogintime` datetime NULL DEFAULT NULL COMMENT '最后一次登录失败时间',
  `faillogincount` int(20) NULL DEFAULT NULL COMMENT '已登录失败次数',
  `failloginforbiddencount` int(20) NULL DEFAULT NULL COMMENT '失败登录禁用次数',
  `isoriginalpassword` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '初始密码是否不修改',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `failloginfirsttime` datetime NULL DEFAULT NULL COMMENT '登录失败第一次时间',
  `delflag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '删除标识',
  `systemid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统ID',
  `issuperuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否超级管理员',
  `equipcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 891 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clusers
-- ----------------------------
INSERT INTO `clusers` VALUES (1, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'admin', '1103762440@qq.com', '男', '2022-05-17 00:00:00', '1001', '', '', '2019-12-11 15:14:36', 'adminA', NULL, NULL, '', '', '', '', '13900010002', '', '是', 5, '2025-01-07 17:05:31', 0, 6, '是', 'ee1171e7ab9d3651e932db917f681624', '2025-01-07 16:59:37', '否', NULL, '是', NULL);
INSERT INTO `clusers` VALUES (882, 'Np5Av8Wm8Hr4Sq8Fh7Vz', 'developer', 'developer', 'deceloper@163.com', '男', NULL, '1001', '', '', '2023-06-02 11:07:29', NULL, '2023-06-02 11:11:18', 'developer', '', '', '', '', '', '', '是', 5, '2023-06-02 11:11:35', 0, 6, '是', 'ee1171e7ab9d3651e932db917f681624', '2023-06-02 11:10:38', '否', NULL, '否', NULL);
INSERT INTO `clusers` VALUES (883, 'Xv8Wo5Lq1Yr8Gw0Tj10Zk', '测试', 'test1', '9969971131@qq.com', '男', NULL, '1001', '', '', '2023-06-12 15:08:20', NULL, '2024-07-29 10:37:04', 'admin', '', '', '', '', '', '', '否', 5, '2024-07-29 10:37:04', 0, 6, '是', 'ea533cf6d8409341f3171aa52aa001bc', '2024-07-29 10:37:04', '否', NULL, '否', NULL);
INSERT INTO `clusers` VALUES (884, 'Xk8Se6Ks2Ty8Jm3Td4Pl', '滕勇', 'tengyong', 'tengyong@cnbmtech.com', '男', NULL, '1001', '', '', '2023-06-12 15:13:44', NULL, NULL, NULL, '', '', '', '', '', '', '是', 5, NULL, NULL, 6, '是', 'ea533cf6d8409341f3171aa52aa001bc', NULL, '否', NULL, '否', NULL);
INSERT INTO `clusers` VALUES (885, 'Vg5Nq3Qy6Tf3Hk1Cu3Xf', '冷玉', 'lengyu', 'lengyu@cnbmtech.com', '男', NULL, '1001', '', '', '2023-06-19 16:30:07', NULL, NULL, NULL, '', '', '', '', '', '', '是', 5, NULL, NULL, 6, '是', 'ea533cf6d8409341f3171aa52aa001bc', NULL, '否', NULL, '否', NULL);
INSERT INTO `clusers` VALUES (886, 'It7Nr6Cb2Aq9Io6Sh6Ex', 'chenxq', 'chenxq', 'chenxiaoqing@cnbmtech.com', '男', NULL, '1001', '', '', '2023-08-24 10:28:05', NULL, NULL, NULL, '', '', '', '', '', '', '是', 5, NULL, NULL, 6, '是', 'ea533cf6d8409341f3171aa52aa001bc', NULL, '否', NULL, '否', NULL);
INSERT INTO `clusers` VALUES (887, 'If6Zu8Ys4Tl4Ma8Xn7Sj', 'test', 'test', '13619307257@163.com', '男', NULL, '1001', '', '', '2024-07-05 17:00:53', NULL, NULL, NULL, '', '', '', '', '', '', '是', 5, NULL, NULL, 6, '是', 'ea533cf6d8409341f3171aa52aa001bc', NULL, '是', NULL, '否', NULL);
INSERT INTO `clusers` VALUES (888, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'zhurg', '1933456@qq.com', '男', NULL, '1001', '', '', '2024-08-16 14:05:08', NULL, NULL, NULL, '', '', 'tengyong241031', '', '', '', '是', 5, '2024-08-29 10:44:34', 0, 6, '是', 'ea533cf6d8409341f3171aa52aa001bc', '2024-08-29 10:44:34', '否', NULL, '否', NULL);
INSERT INTO `clusers` VALUES (889, 'Aq9Vz2Xb8Yl3Wd7Hd8Nj', 'test2', 'test2', '2965835676@qq.com', '男', NULL, '1001', '', '', '2024-08-29 10:46:03', NULL, NULL, NULL, '', '', '', '', '', '', '是', 5, NULL, NULL, 6, '是', 'ea533cf6d8409341f3171aa52aa001bc', NULL, '是', NULL, '否', NULL);
INSERT INTO `clusers` VALUES (890, 'No1Qt2Oj3Wy2Un8Gp8In', 'test', 'test', '323213@qq.com', '男', NULL, '1001', '', '', '2024-08-29 13:50:06', NULL, NULL, NULL, '', '', 'yuqun18', '', '', '', '是', 5, NULL, NULL, 6, '是', 'ea533cf6d8409341f3171aa52aa001bc', NULL, '否', NULL, '否', NULL);

-- ----------------------------
-- Table structure for clusersys
-- ----------------------------
DROP TABLE IF EXISTS `clusersys`;
CREATE TABLE `clusersys`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `groupid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户组id',
  `syscode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 316 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组与系统应用关联关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clusersys
-- ----------------------------
INSERT INTO `clusersys` VALUES (312, '03e251a9b1578d443adb7a4f5f1a693a', '5f445f5682a4edf7fdd4a58e2c8433a5');
INSERT INTO `clusersys` VALUES (313, '03e251a9b1578d443adb7a4f5f1a693a', '43613ccd6a11f6f4a0c8cf450d13ddfc');
INSERT INTO `clusersys` VALUES (314, 'ba359855bb5f630d32c3aeac91752d30', '5f445f5682a4edf7fdd4a58e2c8433a5');
INSERT INTO `clusersys` VALUES (315, 'ba359855bb5f630d32c3aeac91752d30', '43613ccd6a11f6f4a0c8cf450d13ddfc');

-- ----------------------------
-- Table structure for document_auth
-- ----------------------------
DROP TABLE IF EXISTS `document_auth`;
CREATE TABLE `document_auth`  (
  `auth_document_type` tinyint(4) NOT NULL COMMENT '授权类型;分类、文件',
  `auth_document_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '授权的id',
  `auth_document_role` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '授权角色;多个授权逗号分割',
  `auth_document_user` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '授权用户;多个授权逗号分割',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `last_update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`auth_document_type`, `auth_document_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of document_auth
-- ----------------------------

-- ----------------------------
-- Table structure for document_file
-- ----------------------------
DROP TABLE IF EXISTS `document_file`;
CREATE TABLE `document_file`  (
  `file_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档id;uuid',
  `type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档分类',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档名称',
  `file_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档路径',
  `file_version` int(11) NOT NULL DEFAULT 1 COMMENT '文档版本',
  `file_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档大小(存什么单位待定)',
  `file_download_num` int(11) NOT NULL DEFAULT 0 COMMENT '下载次数',
  `file_view_num` int(11) NOT NULL DEFAULT 0 COMMENT '浏览次数',
  `auth_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否含有授权;1是0否',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of document_file
-- ----------------------------

-- ----------------------------
-- Table structure for document_file_history
-- ----------------------------
DROP TABLE IF EXISTS `document_file_history`;
CREATE TABLE `document_file_history`  (
  `file_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档id;uuid',
  `type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档分类',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档名称',
  `file_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档路径',
  `file_version` int(11) NOT NULL DEFAULT 1 COMMENT '文档版本',
  `file_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档大小(存什么单位待定)',
  `operation_type` int(11) NOT NULL COMMENT '操作类型;待定',
  `operation_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `operation_date` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`file_id`, `file_version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档文件历史' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of document_file_history
-- ----------------------------

-- ----------------------------
-- Table structure for document_type
-- ----------------------------
DROP TABLE IF EXISTS `document_type`;
CREATE TABLE `document_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `type_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `type_parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类上级id;一级节点为0',
  `type_order` int(11) NOT NULL DEFAULT 1 COMMENT '分类展示顺序',
  `auth_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否含有授权;1是0否',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of document_type
-- ----------------------------

-- ----------------------------
-- Table structure for inf_msmmessage_send
-- ----------------------------
DROP TABLE IF EXISTS `inf_msmmessage_send`;
CREATE TABLE `inf_msmmessage_send`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id(主键)',
  `recv_phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收的手机号码',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送内容',
  `priority` int(1) NULL DEFAULT NULL COMMENT '优先级:1普通 2次要 3重要 4紧急(为最高级)',
  `org_req` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原始请求json串方式存储',
  `req_date` datetime NULL DEFAULT NULL COMMENT '请求时间,可理解入表时间',
  `platform` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台/系统模块名,请求发消息的平台',
  `platform_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台/系统模块IP地址',
  `deal_flag` int(1) NULL DEFAULT NULL COMMENT '0:未处理 1：已处理',
  `deal_date` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `resp_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应编码',
  `resp_msg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应消息',
  `reserve1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `reserve2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `reserve3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inx_inf_msmmessage_send`(`recv_phone`, `priority`, `platform`, `resp_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inf_msmmessage_send
-- ----------------------------

-- ----------------------------
-- Table structure for inf_receive_message_switch
-- ----------------------------
DROP TABLE IF EXISTS `inf_receive_message_switch`;
CREATE TABLE `inf_receive_message_switch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `platform_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务平台编码',
  `platform_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务平台名称',
  `receive_switch` int(1) NOT NULL COMMENT '接收消息开关 0-关 1开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接收业务平台消息开关表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inf_receive_message_switch
-- ----------------------------

-- ----------------------------
-- Table structure for inf_sysmessage_send
-- ----------------------------
DROP TABLE IF EXISTS `inf_sysmessage_send`;
CREATE TABLE `inf_sysmessage_send`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id(主键)',
  `recv_userid` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接收的用户ID,多户用\",\"分割',
  `titile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题名称',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送内容',
  `msg_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型:10通知 20告警 30报警',
  `priority` int(1) NULL DEFAULT NULL COMMENT '优先级:1普通 2次要 3重要 4紧急(为最高级)',
  `org_req` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '原始请求json串方式存储',
  `req_tpl_code` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容引用的模板ID',
  `req_date` datetime NULL DEFAULT NULL COMMENT '请求时间,可理解入表时间',
  `platform` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台/系统模块名,请求发消息的平台',
  `platform_orderid` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源平台的相关业务ID',
  `platform_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台/系统模块IP地址',
  `deal_flag` int(1) NULL DEFAULT NULL COMMENT '0:未处理 1：已处理',
  `deal_date` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `send_userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送人用户ID',
  `reserve1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'html内容',
  `reserve2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `reserve3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `type_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型项编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inx_inf_sysmessage_send`(`priority`, `platform`) USING BTREE,
  INDEX `inx_inf_sysmessage_send_1`(`type_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inf_sysmessage_send
-- ----------------------------
INSERT INTO `inf_sysmessage_send` VALUES (1, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '告警推送', '告警消息内容推送', '20', 1, '{\"formUserId\":\"admin\",\"msg\":\"告警消息内容推送\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"告警消息内容推送\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"admin\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"告警推送\",\"waringTypeCode\":\"\"}', 'TP20202408261513030001', '2024-08-29 10:19:12', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 10:19:12', 'admin', '告警消息内容推送', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (2, 'admin', '告警推送', '告警消息内容推送', '20', 1, '{\"formUserId\":\"admin\",\"msg\":\"告警消息内容推送\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"告警消息内容推送\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"admin\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"告警推送\",\"waringTypeCode\":\"\"}', 'TP20202408261513030001', '2024-08-29 10:21:22', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 10:21:22', 'admin', '告警消息内容推送', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (3, 'admin', '告警推送', '告警消息内容推送', '20', 1, '{\"formUserId\":\"admin\",\"msg\":\"告警消息内容推送\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"告警消息内容推送\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"admin\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"告警推送\",\"waringTypeCode\":\"\"}', 'TP20202408261513030001', '2024-08-29 10:21:46', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 10:21:46', 'admin', '告警消息内容推送', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (4, 'admin', '告警推送', '告警消息内容推送', '20', 1, '{\"formUserId\":\"admin\",\"msg\":\"告警消息内容推送\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"告警消息内容推送\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"admin\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"告警推送\",\"waringTypeCode\":\"\"}', 'TP20202408261513030001', '2024-08-29 10:32:22', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 10:32:22', 'admin', '告警消息内容推送', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (5, 'admin', '告警推送', '告警消息内容推送', '20', 1, '{\"formUserId\":\"admin\",\"msg\":\"告警消息内容推送\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"告警消息内容推送\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"admin\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"告警推送\",\"waringTypeCode\":\"\"}', 'TP20202408261513030001', '2024-08-29 10:32:55', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 10:32:55', 'admin', '告警消息内容推送', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (6, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '中断', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 10:42:04】， 设备状态: 【待机状态报警】', '20', 1, '{\"formUserId\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"msg\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 10:42:04】， 设备状态: 【待机状态报警】\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 10:42:04】， 设备状态: 【待机状态报警】\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"中断\",\"waringTypeCode\":null}', 'TP20202408261513030001', '2024-08-29 10:42:51', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 10:42:51', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 10:42:04】， 设备状态: 【待机状态报警】', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (7, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '中断', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:13:38】， 设备状态: 【待机状态报警】', '20', 1, '{\"formUserId\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"msg\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:13:38】， 设备状态: 【待机状态报警】\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:13:38】， 设备状态: 【待机状态报警】\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"中断\",\"waringTypeCode\":null}', 'TP20202408261513030001', '2024-08-29 11:13:43', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 11:13:43', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:13:38】， 设备状态: 【待机状态报警】', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (8, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '中断', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:24:30】， 设备状态: 【待机状态报警】', '20', 1, '{\"formUserId\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"msg\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:24:30】， 设备状态: 【待机状态报警】\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:24:30】， 设备状态: 【待机状态报警】\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"中断\",\"waringTypeCode\":null}', 'TP20202408261513030001', '2024-08-29 11:24:36', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 11:24:36', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:24:30】， 设备状态: 【待机状态报警】', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (9, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '中断', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:29:40】， 设备状态: 【待机状态报警】', '20', 1, '{\"formUserId\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"msg\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:29:40】， 设备状态: 【待机状态报警】\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:29:40】， 设备状态: 【待机状态报警】\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"中断\",\"waringTypeCode\":null}', 'TP20202408261513030001', '2024-08-29 11:29:45', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 11:29:45', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:29:40】， 设备状态: 【待机状态报警】', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (10, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '中断', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:32:13】， 设备状态: 【待机状态报警】', '20', 1, '{\"formUserId\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"msg\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:32:13】， 设备状态: 【待机状态报警】\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:32:13】， 设备状态: 【待机状态报警】\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"中断\",\"waringTypeCode\":null}', 'TP20202408261513030001', '2024-08-29 11:32:17', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 11:32:17', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:32:13】， 设备状态: 【待机状态报警】', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (11, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '中断', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:42:54】， 设备状态: 【待机状态报警】', '20', 1, '{\"formUserId\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"msg\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:42:54】， 设备状态: 【待机状态报警】\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:42:54】， 设备状态: 【待机状态报警】\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"中断\",\"waringTypeCode\":null}', 'TP20202408261513030001', '2024-08-29 11:42:58', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 11:42:58', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 11:42:54】， 设备状态: 【待机状态报警】', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (12, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '中断', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 12:38:36】， 设备状态: 【待机状态报警】', '20', 1, '{\"formUserId\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"msg\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 12:38:36】， 设备状态: 【待机状态报警】\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 12:38:36】， 设备状态: 【待机状态报警】\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"中断\",\"waringTypeCode\":null}', 'TP20202408261513030001', '2024-08-29 12:38:41', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 12:38:41', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 12:38:36】， 设备状态: 【待机状态报警】', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (13, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '中断', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 12:48:44】， 设备状态: 【待机状态报警】', '20', 1, '{\"formUserId\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"msg\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 12:48:44】， 设备状态: 【待机状态报警】\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 12:48:44】， 设备状态: 【待机状态报警】\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"中断\",\"waringTypeCode\":null}', 'TP20202408261513030001', '2024-08-29 12:48:48', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 12:48:48', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 12:48:44】， 设备状态: 【待机状态报警】', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (14, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '设备状态通知', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 17:46:08】， 设备状态: 【待机状态报警】', '20', 1, '{\"formUserId\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"msg\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 17:46:08】， 设备状态: 【待机状态报警】\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 17:46:08】， 设备状态: 【待机状态报警】\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"设备状态通知\",\"waringTypeCode\":null}', 'TP20202408261513030001', '2024-08-29 17:46:20', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-29 17:46:20', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-29 17:46:08】， 设备状态: 【待机状态报警】', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (15, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '设备状态通知', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-30 09:35:58】， 设备状态: 【未知状态报警】', '20', 1, '{\"formUserId\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"msg\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-30 09:35:58】， 设备状态: 【未知状态报警】\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-30 09:35:58】， 设备状态: 【未知状态报警】\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"设备状态通知\",\"waringTypeCode\":null}', 'TP20202408261513030001', '2024-08-30 09:36:00', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-30 09:36:00', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-30 09:35:58】， 设备状态: 【未知状态报警】', NULL, NULL, '0001');
INSERT INTO `inf_sysmessage_send` VALUES (16, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '设备状态通知', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-30 10:46:08】， 设备状态: 【待机状态报警】', '20', 1, '{\"formUserId\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"msg\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-30 10:46:08】， 设备状态: 【待机状态报警】\",\"paramDetail\":[{\"id\":\"1\",\"name\":\"alarm_context\",\"value\":\"【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-30 10:46:08】， 设备状态: 【待机状态报警】\"}],\"platform\":\"5f445f5682a4edf7fdd4a58e2c8433a5\",\"platformIp\":\"localhost\",\"platformOrderid\":null,\"recvAddr\":\"Cw0Jc4Wf3Fx8Wf6Bh8Xh\",\"sendChannel\":1,\"templateCode\":\"TP20202408261513030001\",\"titile\":\"设备状态通知\",\"waringTypeCode\":null}', 'TP20202408261513030001', '2024-08-30 10:46:09', '5f445f5682a4edf7fdd4a58e2c8433a5', NULL, 'localhost', 1, '2024-08-30 10:46:09', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '【古浪工厂模型】 标题：设备状态，设备名称:【 生料配料秤】，设备编码:【 A0200401】， 当前时间:【 2024-08-30 10:46:08】， 设备状态: 【待机状态报警】', NULL, NULL, '0001');

-- ----------------------------
-- Table structure for pdman_db_version
-- ----------------------------
DROP TABLE IF EXISTS `pdman_db_version`;
CREATE TABLE `pdman_db_version`  (
  `DB_VERSION` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_DESC` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATED_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pdman_db_version
-- ----------------------------

-- ----------------------------
-- Table structure for pp_cc_category
-- ----------------------------
DROP TABLE IF EXISTS `pp_cc_category`;
CREATE TABLE `pp_cc_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中控分类编码',
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中控分类名称',
  `delflag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `systemid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pp_cc_category
-- ----------------------------

-- ----------------------------
-- Table structure for pp_cc_index
-- ----------------------------
DROP TABLE IF EXISTS `pp_cc_index`;
CREATE TABLE `pp_cc_index`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `index_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '指标编码',
  `index_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指标名称',
  `index_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指标参数',
  `category_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中控分类编码',
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中控分类名称',
  `delflag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `systemid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pp_cc_index
-- ----------------------------

-- ----------------------------
-- Table structure for sys_accounting_entity
-- ----------------------------
DROP TABLE IF EXISTS `sys_accounting_entity`;
CREATE TABLE `sys_accounting_entity`  (
  `entity_id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '会计单位id',
  `company_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位编码',
  `company_fullname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位全称',
  `company_shortname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位简称',
  `sup_accounting_entity_id` bigint(22) NOT NULL COMMENT '上级会计单位id',
  `sup_accounting_entity` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上级会计单位',
  `corporate_representative` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `duty_paragraph` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '税号',
  `contact_way` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `remark_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` datetime NULL DEFAULT NULL COMMENT '更新人',
  `last_update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`entity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会计单位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_accounting_entity
-- ----------------------------

-- ----------------------------
-- Table structure for sys_accounting_entity_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_accounting_entity_item`;
CREATE TABLE `sys_accounting_entity_item`  (
  `bank_id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '开户行id',
  `entity_id` bigint(22) NULL DEFAULT NULL COMMENT '会计单位id',
  `opening_bank` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `bank_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账户',
  `account_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户名',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`bank_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会计单位开户行表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_accounting_entity_item
-- ----------------------------

-- ----------------------------
-- Table structure for sys_accounting_period
-- ----------------------------
DROP TABLE IF EXISTS `sys_accounting_period`;
CREATE TABLE `sys_accounting_period`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `entity_id` bigint(22) NOT NULL COMMENT '会计单位id',
  `company_fullname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会计单位全称',
  `period_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '期间名称',
  `accounting_year` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会计年度',
  `period_number` int(11) NULL DEFAULT NULL COMMENT '期数',
  `start_date` date NULL DEFAULT NULL COMMENT '起始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '终止日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会计期间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_accounting_period
-- ----------------------------

-- ----------------------------
-- Table structure for sys_app_function_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_function_config`;
CREATE TABLE `sys_app_function_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `app_config_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能名称',
  `app_config_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能类型',
  `app_config_path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能地址',
  `app_config_order` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能排序',
  `show_app_bar` tinyint(1) NULL DEFAULT 0 COMMENT '是否显示标题栏',
  `horization` tinyint(1) NULL DEFAULT 1 COMMENT '是否强制横屏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'APP功能配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_app_function_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_bigscreen_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_bigscreen_config`;
CREATE TABLE `sys_bigscreen_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '系统类型（生产、质量、设备等，字典bigscreen_type）',
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `value_adjust` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调整值',
  `req_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求url',
  `req_param` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `req_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求类型（get,post）',
  `response` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '返回参数',
  `response_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回参数名称',
  `inter_type` tinyint(2) NULL DEFAULT NULL COMMENT '接口类型（数据中台、设备管理，字典bigscreen_inter_type）',
  `inter_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口类型名称',
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `delflag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标识',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `systemid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `switch_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_bigscreen_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_code_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_rule`;
CREATE TABLE `sys_code_rule`  (
  `rule_id` int(10) NOT NULL AUTO_INCREMENT,
  `rule_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则编码',
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `is_effect` int(11) NULL DEFAULT NULL COMMENT '是否生效 1：生效 ， 0:无效, -1:已删除',
  `split` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分隔符',
  `effect_time` datetime NULL DEFAULT NULL COMMENT '生效时间',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '失效时间',
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_code_rule
-- ----------------------------

-- ----------------------------
-- Table structure for sys_code_rule_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_rule_item`;
CREATE TABLE `sys_code_rule_item`  (
  `rule_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) NULL DEFAULT NULL,
  `item_sequence` int(11) NULL DEFAULT NULL COMMENT '排序',
  `rule_item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `rule_type_id` int(10) NULL DEFAULT NULL COMMENT '字段类型id',
  `constant_content` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常量内容',
  `seq_mark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流水标记',
  `reset_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流水号重置规则',
  `cur_time` datetime NULL DEFAULT NULL COMMENT '数据库中当前时间',
  `item_length` int(10) NULL DEFAULT NULL COMMENT '长度',
  `current_value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前值',
  `init_value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '初始值',
  `step_lengh` int(11) NULL DEFAULT NULL COMMENT '步长，增长幅度',
  `code_prefix` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前缀',
  `system_time` datetime NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `remark_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `last_update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`rule_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '编码规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_code_rule_item
-- ----------------------------

-- ----------------------------
-- Table structure for sys_code_rule_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_rule_type`;
CREATE TABLE `sys_code_rule_type`  (
  `rule_type_id` int(10) NOT NULL COMMENT '类型id',
  `rule_type_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `rule_type_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `rule_type_attr` int(11) NULL DEFAULT NULL COMMENT '属性，单例：0；对象：1',
  `rule_type_parent_id` int(10) NULL DEFAULT 0,
  `sort` int(3) NULL DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`rule_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字段类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_code_rule_type
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_holiday_calendar
-- ----------------------------
DROP TABLE IF EXISTS `sys_holiday_calendar`;
CREATE TABLE `sys_holiday_calendar`  (
  `rep_date` date NOT NULL COMMENT '日期',
  `rep_year` int(8) NOT NULL COMMENT '年号',
  `rep_month` int(8) NOT NULL COMMENT '月',
  `rep_day` int(8) NOT NULL COMMENT '天',
  `rep_week` int(8) NOT NULL COMMENT '周',
  `del_flag` tinyint(1) NULL DEFAULT 1 COMMENT '删除标识 0-删除 1-有效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`rep_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_holiday_calendar
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_type` int(2) NULL DEFAULT NULL COMMENT '日志类型（0:操作日志;1:登录日志;2:定时任务）',
  `log_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容',
  `operate_type` int(2) NULL DEFAULT NULL COMMENT '操作类型(1:添加;2:修改;3:删除;)',
  `userid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户账号',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户名称',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `method` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求java方法',
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `request_param` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求参数',
  `request_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求类型',
  `cost_time` bigint(20) NULL DEFAULT NULL COMMENT '耗时',
  `createby` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `delflag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '删除标识',
  `systemid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_table_userid`(`userid`) USING BTREE,
  INDEX `index_logt_ype`(`log_type`) USING BTREE,
  INDEX `index_operate_type`(`operate_type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2140 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1369, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 1, NULL, '2024-02-29 10:05:04', NULL, '2024-02-29 10:05:06', '否', NULL);
INSERT INTO `sys_log` VALUES (1370, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 10:06:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1371, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-02-29 14:11:43', NULL, '2024-02-29 14:11:44', '否', NULL);
INSERT INTO `sys_log` VALUES (1372, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:12:18', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1373, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-02-29 14:12:50', NULL, '2024-02-29 14:12:50', '否', NULL);
INSERT INTO `sys_log` VALUES (1374, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:12:57', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1375, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-02-29 14:13:26', NULL, '2024-02-29 14:13:27', '否', NULL);
INSERT INTO `sys_log` VALUES (1376, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:13:42', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1377, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:19:57', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1378, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-02-29 14:20:35', NULL, '2024-02-29 14:20:35', '否', NULL);
INSERT INTO `sys_log` VALUES (1379, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:20:43', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1380, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-02-29 14:21:07', NULL, '2024-02-29 14:21:08', '否', NULL);
INSERT INTO `sys_log` VALUES (1381, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-02-29 14:21:37', NULL, '2024-02-29 14:21:38', '否', NULL);
INSERT INTO `sys_log` VALUES (1382, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:21:48', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1383, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-02-29 14:22:40', NULL, '2024-02-29 14:22:40', '否', NULL);
INSERT INTO `sys_log` VALUES (1384, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:22:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1385, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-02-29 14:23:28', NULL, '2024-02-29 14:23:29', '否', NULL);
INSERT INTO `sys_log` VALUES (1386, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-02-29 14:24:06', NULL, '2024-02-29 14:24:07', '否', NULL);
INSERT INTO `sys_log` VALUES (1387, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-02-29 14:25:00', NULL, '2024-02-29 14:25:01', '否', NULL);
INSERT INTO `sys_log` VALUES (1388, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-02-29 14:27:40', NULL, '2024-02-29 14:27:40', '否', NULL);
INSERT INTO `sys_log` VALUES (1389, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-02-29 14:27:52', NULL, '2024-02-29 14:27:52', '否', NULL);
INSERT INTO `sys_log` VALUES (1390, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:28:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1391, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-02-29 14:28:36', NULL, '2024-02-29 14:28:36', '否', NULL);
INSERT INTO `sys_log` VALUES (1392, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-03-28 10:29:38', NULL, '2024-03-28 10:29:38', '否', NULL);
INSERT INTO `sys_log` VALUES (1393, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-28 13:58:34', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1394, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-03-28 14:16:14', NULL, '2024-03-28 14:16:14', '否', NULL);
INSERT INTO `sys_log` VALUES (1395, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-03-28 14:16:55', NULL, '2024-03-28 14:16:55', '否', NULL);
INSERT INTO `sys_log` VALUES (1396, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-28 17:00:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1397, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-29 15:23:57', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1398, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 11:03:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1399, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 14:58:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1400, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 16:01:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1401, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-09 08:06:39', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1402, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-09 08:13:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1403, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-09 09:27:27', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1404, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-10 10:11:49', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1405, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-04-10 17:38:09', NULL, '2024-04-10 17:38:09', '否', NULL);
INSERT INTO `sys_log` VALUES (1406, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-10 17:45:58', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1407, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-11 09:00:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1408, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-11 10:00:05', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1409, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-12 13:59:44', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1410, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-15 10:50:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1411, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 13:53:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1412, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 13:54:01', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1413, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 15:02:49', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1414, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 15:54:03', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1415, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 17:39:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1416, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 17:39:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1417, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 17:44:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1418, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 17:52:32', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1419, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 10:33:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1420, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 10:39:21', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1421, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 10:47:32', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1422, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 11:19:39', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1423, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 12:10:51', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1424, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 12:38:24', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1425, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-04-17 14:52:02', NULL, '2024-04-17 14:52:03', '否', NULL);
INSERT INTO `sys_log` VALUES (1426, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 14:52:25', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1427, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 14:52:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1428, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 14:59:41', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1429, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 15:00:38', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1430, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-18 09:26:06', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1431, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-18 09:46:44', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1432, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-18 16:19:00', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1433, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-18 17:44:32', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1434, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-19 09:43:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1435, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-04-19 11:19:15', NULL, '2024-04-19 11:19:16', '否', NULL);
INSERT INTO `sys_log` VALUES (1436, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-04-19 13:26:16', NULL, '2024-04-19 13:26:17', '否', NULL);
INSERT INTO `sys_log` VALUES (1437, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-19 16:03:42', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1438, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 14:44:27', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1439, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 16:02:18', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1440, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 09:18:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1441, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 11:40:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1442, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 16:18:21', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1443, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 17:17:57', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1444, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 17:19:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1445, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 17:45:32', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1446, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 17:47:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1447, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 17:47:51', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1448, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 17:48:34', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1449, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 08:08:36', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1450, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 08:16:16', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1451, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 08:19:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1452, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 08:20:03', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1453, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 09:32:50', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1454, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 15:30:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1455, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 15:47:54', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1456, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:34:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1457, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 09:03:46', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1458, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 09:55:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1459, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 09:56:42', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1460, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 10:36:28', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1461, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 17:16:24', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1462, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 09:40:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1463, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 17:34:16', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1464, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 18:29:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1465, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-29 10:32:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1466, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-29 11:21:23', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1467, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-29 15:54:51', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1468, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-30 15:28:03', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1469, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-06 08:46:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1470, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-06 17:54:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1471, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-06 17:58:25', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1472, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-06 17:59:16', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1473, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-06 18:00:41', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1474, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 11:28:42', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1475, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-08 11:38:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1476, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-08 14:45:42', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1477, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-09 10:23:49', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1478, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-09 13:40:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1479, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-09 14:21:12', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1480, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-11 14:58:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1481, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-11 22:26:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1482, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-14 14:53:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1483, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-05-14 15:51:31', NULL, '2024-05-14 15:51:31', '否', NULL);
INSERT INTO `sys_log` VALUES (1484, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-05-14 16:32:54', NULL, '2024-05-14 16:32:54', '否', NULL);
INSERT INTO `sys_log` VALUES (1485, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 14:05:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1486, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 15:33:16', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1487, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 17:40:17', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1488, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-16 10:25:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1489, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-16 16:46:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1490, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:54:51', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1491, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 11:31:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1492, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 15:31:39', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1493, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-21 16:48:20', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1494, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-21 17:58:52', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1495, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-22 14:22:16', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1496, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-22 15:01:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1497, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:41:20', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1498, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:48:16', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1499, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:55:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1500, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:56:01', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1501, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-05-28 16:57:44', NULL, '2024-05-28 16:57:44', '否', NULL);
INSERT INTO `sys_log` VALUES (1502, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-29 15:18:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1503, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-31 08:24:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1504, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-31 08:27:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1505, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-31 18:57:05', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1506, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-05 10:14:30', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1507, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-06-18 10:20:30', NULL, '2024-06-18 10:20:31', '否', NULL);
INSERT INTO `sys_log` VALUES (1508, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-18 10:20:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1509, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-06-18 10:24:07', NULL, '2024-06-18 10:24:07', '否', NULL);
INSERT INTO `sys_log` VALUES (1510, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-18 10:24:30', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1511, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-18 10:55:21', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1512, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-19 15:26:48', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1513, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-20 16:25:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1514, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-24 09:56:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1515, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-26 14:34:53', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1516, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 10:29:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1517, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 10:29:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1518, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 10:29:12', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1519, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 10:30:32', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1520, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 10:30:34', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1521, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 14:13:32', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1522, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-28 10:38:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1523, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-29 13:15:13', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1524, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-29 13:40:48', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1525, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-01 09:44:49', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1526, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-01 14:02:18', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1527, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-02 17:06:19', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1528, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-07-02 17:06:57', NULL, '2024-07-02 17:06:58', '否', NULL);
INSERT INTO `sys_log` VALUES (1529, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-02 17:07:03', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1530, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-03 17:23:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1531, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-04 09:52:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1532, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-05 09:12:41', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1533, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-05 14:43:49', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1534, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-05 15:02:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1535, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-05 15:43:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1536, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-08 14:06:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1537, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-09 09:53:32', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1538, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-09 10:46:51', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1539, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 10:23:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1540, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-07-10 16:29:24', NULL, '2024-07-10 16:29:25', '否', NULL);
INSERT INTO `sys_log` VALUES (1541, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:29:30', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1542, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-07-10 16:39:34', NULL, '2024-07-10 16:39:34', '否', NULL);
INSERT INTO `sys_log` VALUES (1543, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-07-10 16:42:34', NULL, '2024-07-10 16:42:34', '否', NULL);
INSERT INTO `sys_log` VALUES (1544, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:42:38', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1545, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-11 10:58:38', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1546, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-11 11:06:49', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1547, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-12 16:04:34', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1548, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-07-15 17:55:19', NULL, '2024-07-15 17:55:19', '否', NULL);
INSERT INTO `sys_log` VALUES (1549, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 2, NULL, '2024-07-16 15:54:08', NULL, '2024-07-16 15:54:11', '否', NULL);
INSERT INTO `sys_log` VALUES (1550, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 15:54:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1551, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 15:54:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1552, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 15:54:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1553, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 16:13:31', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1554, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 17:32:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1555, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 09:29:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1556, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 16:49:44', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1557, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 17:48:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1558, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 19:06:53', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1559, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 20:35:26', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1560, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-19 10:58:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1561, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 09:46:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1562, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 10:32:28', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1563, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 2, NULL, '2024-07-22 15:44:25', NULL, '2024-07-22 15:44:28', '否', NULL);
INSERT INTO `sys_log` VALUES (1564, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 15:45:16', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1565, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 16:23:17', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1566, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 16:32:39', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1567, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-07-22 16:32:55', NULL, '2024-07-22 16:32:55', '否', NULL);
INSERT INTO `sys_log` VALUES (1568, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 09:39:43', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1569, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 15:34:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1570, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 16:00:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1571, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 16:00:52', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1572, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 16:42:30', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1573, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 16:43:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1574, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-26 09:26:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1575, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 10:26:16', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1576, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 10:27:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1577, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 14:01:00', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1578, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 14:52:50', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1579, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 16:12:48', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1580, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 16:14:24', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1581, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 18:08:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1582, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 10:17:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1583, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 10:18:23', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1584, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:00:39', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1585, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:04:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1586, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:05:39', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1587, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:07:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1588, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:09:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1589, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:20:04', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1590, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:20:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1591, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-07-31 11:20:44', NULL, '2024-07-31 11:20:45', '否', NULL);
INSERT INTO `sys_log` VALUES (1592, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:21:36', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1593, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 17:17:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1594, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 17:50:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1595, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 17:52:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1596, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 17:52:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1597, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 18:07:26', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1598, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 18:23:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1599, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 09:35:50', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1600, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 09:44:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1601, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 09:46:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1602, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 09:46:10', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1603, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 09:46:36', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1604, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 1, NULL, '2024-08-01 10:58:38', NULL, '2024-08-01 10:58:40', '否', NULL);
INSERT INTO `sys_log` VALUES (1605, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 11:03:53', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1606, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 11:09:46', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1607, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-08-01 11:10:28', NULL, '2024-08-01 11:10:29', '否', NULL);
INSERT INTO `sys_log` VALUES (1608, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 14:28:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1609, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 14:31:18', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1610, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 15:43:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1611, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-02 09:18:59', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1612, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-02 18:32:51', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1613, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-05 13:48:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1614, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-05 13:54:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1615, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 1, NULL, '2024-08-06 09:37:34', NULL, '2024-08-06 09:37:35', '否', NULL);
INSERT INTO `sys_log` VALUES (1616, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-06 09:46:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1617, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-06 09:50:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1618, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-06 10:14:21', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1619, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-06 14:51:00', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1620, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-06 15:02:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1621, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-07 17:19:23', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1622, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-08 17:14:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1623, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-09 10:18:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1624, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-09 10:25:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1625, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-08-12 10:10:01', NULL, '2024-08-12 10:10:02', '否', NULL);
INSERT INTO `sys_log` VALUES (1626, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 10:11:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1627, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 10:46:57', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1628, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 14:26:04', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1629, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 16:33:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1630, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 16:41:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1631, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 14:21:35', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1632, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 14:39:42', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1633, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 15:04:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1634, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 16:31:26', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1635, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 17:19:42', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1636, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-14 09:57:32', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1637, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-14 10:46:23', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1638, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-14 17:59:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1639, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-14 18:02:39', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1640, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-14 18:05:59', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1641, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-15 09:16:48', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1642, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-15 09:35:52', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1643, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-15 10:26:05', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1644, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-15 13:51:46', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1645, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 1, NULL, '2024-08-15 14:08:14', NULL, '2024-08-15 14:08:15', '否', NULL);
INSERT INTO `sys_log` VALUES (1646, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-15 14:08:26', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1647, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 09:33:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1648, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 09:40:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1649, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 09:41:16', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1650, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 09:42:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1651, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-08-16 09:45:40', NULL, '2024-08-16 09:45:40', '否', NULL);
INSERT INTO `sys_log` VALUES (1652, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 14:14:17', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1653, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-08-16 14:15:31', NULL, '2024-08-16 14:15:31', '否', NULL);
INSERT INTO `sys_log` VALUES (1654, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 14:15:36', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1655, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 16:19:00', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1656, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 16:19:31', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1657, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:09:46', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1658, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:09:58', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1659, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:10:23', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1660, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:10:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1661, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:16:39', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1662, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:33:48', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1663, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:34:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1664, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 16:13:12', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1665, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 16:13:25', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1666, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 16:40:01', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1667, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 16:44:30', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1668, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 16:54:44', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1669, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 09:46:26', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1670, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 09:46:59', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1671, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 14:02:18', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1672, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 14:09:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1673, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 15:14:23', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1674, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 15:39:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1675, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 15:47:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1676, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 15:53:43', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1677, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 16:01:00', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1678, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 16:01:20', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1679, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 16:01:35', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1680, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 09:54:54', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1681, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 09:55:10', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1682, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 10:24:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1683, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 10:24:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1684, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 11:07:50', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1685, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:17:20', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1686, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:17:46', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1687, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:18:01', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1688, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:20:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1689, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:20:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1690, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:20:25', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1691, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:31:38', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1692, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:38:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1693, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:42:34', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1694, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 09:30:20', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1695, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 13:57:59', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1696, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 14:31:57', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1697, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 16:27:04', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1698, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-23 09:34:06', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1699, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-23 16:52:23', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1700, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 10:55:38', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1701, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 10:56:21', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1702, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 11:03:41', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1703, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 11:07:26', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1704, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 11:14:51', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1705, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 11:28:44', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1706, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 11:30:17', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1707, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 14:00:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1708, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 16:06:34', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1709, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 16:06:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1710, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 16:07:30', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1711, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 16:12:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1712, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 16:12:44', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1713, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 17:12:54', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1714, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 17:41:20', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1715, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 17:42:36', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1716, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 17:59:43', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1717, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 19:01:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1718, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-27 16:43:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1719, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-08-28 09:26:57', NULL, '2024-08-28 09:26:58', '否', NULL);
INSERT INTO `sys_log` VALUES (1720, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-28 09:28:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1721, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-08-28 10:55:58', NULL, '2024-08-28 10:55:59', '否', NULL);
INSERT INTO `sys_log` VALUES (1722, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-28 10:56:04', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1723, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 10:44:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1724, 1, '用户名: zhurg,登录成功！', 1, 'zhurg', 'zhurg', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 10:46:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1725, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 10:47:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1726, 1, '用户名: zhurg,登录成功！', 1, 'zhurg', 'zhurg', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:48:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1727, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:48:18', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1728, 1, '用户名: zhurg,登录成功！', 1, 'zhurg', 'zhurg', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:50:54', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1729, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:51:04', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1730, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:51:28', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1731, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 1, NULL, '2024-08-29 13:52:21', NULL, '2024-08-29 13:52:22', '否', NULL);
INSERT INTO `sys_log` VALUES (1732, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:52:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1733, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:54:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1734, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-08-29 13:55:13', NULL, '2024-08-29 13:55:14', '否', NULL);
INSERT INTO `sys_log` VALUES (1735, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:55:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1736, 1, '用户名: zhurg,登录成功！', 1, 'zhurg', 'zhurg', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:55:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1737, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:56:04', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1738, 1, '用户名: zhurg,登录成功！', 1, 'zhurg', 'zhurg', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:56:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1739, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:57:04', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1740, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:57:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1741, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-08-29 14:32:41', NULL, '2024-08-29 14:32:41', '否', NULL);
INSERT INTO `sys_log` VALUES (1742, 1, '用户名: zhurg,登录成功！', 1, 'zhurg', 'zhurg', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 14:32:48', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1743, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 14:34:03', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1744, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 15:08:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1745, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 16:05:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1746, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 16:06:17', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1747, 1, '用户名: zhurg,登录成功！', 1, 'zhurg', 'zhurg', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 17:22:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1748, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 18:00:12', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1749, 1, '用户名: zhurg,登录成功！', 1, 'zhurg', 'zhurg', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 10:27:52', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1750, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 10:28:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1751, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 10:30:18', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1752, 1, '用户名: zhurg,登录成功！', 1, 'zhurg', 'zhurg', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 10:47:27', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1753, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 14:22:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1754, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 14:25:12', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1755, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-02 14:16:02', NULL, '2024-09-02 14:16:02', '否', NULL);
INSERT INTO `sys_log` VALUES (1756, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-02 15:52:35', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1757, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-02 17:15:51', NULL, '2024-09-02 17:15:51', '否', NULL);
INSERT INTO `sys_log` VALUES (1758, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-02 17:20:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1759, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-03 10:53:10', NULL, '2024-09-03 10:53:11', '否', NULL);
INSERT INTO `sys_log` VALUES (1760, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 10:56:20', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1761, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-03 10:59:46', NULL, '2024-09-03 10:59:46', '否', NULL);
INSERT INTO `sys_log` VALUES (1762, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:00:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1763, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:02:30', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1764, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:02:59', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1765, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:03:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1766, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:03:49', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1767, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:04:32', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1768, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:04:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1769, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:04:54', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1770, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:04:59', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1771, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:06:52', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1772, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:08:19', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1773, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-03 14:14:41', NULL, '2024-09-03 14:14:41', '否', NULL);
INSERT INTO `sys_log` VALUES (1774, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 14:14:46', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1775, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 14:15:03', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1776, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 14:17:46', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1777, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-03 14:20:01', NULL, '2024-09-03 14:20:02', '否', NULL);
INSERT INTO `sys_log` VALUES (1778, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 14:58:50', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1779, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 15:47:57', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1780, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 15:54:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1781, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 15:57:27', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1782, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 15:58:39', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1783, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 15:59:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1784, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 15:59:35', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1785, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 16:08:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1786, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 16:41:06', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1787, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 16:44:36', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1788, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 16:44:53', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1789, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 08:52:16', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1790, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 09:19:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1791, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 10:15:51', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1792, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 13:59:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1793, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 14:02:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1794, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 15:46:03', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1795, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 08:57:51', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1796, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:38:21', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1797, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1798, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1799, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1800, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1801, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1802, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1803, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1804, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1805, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1806, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1807, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1808, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1809, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1810, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1811, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 4, NULL, '2024-09-06 15:03:24', NULL, '2024-09-06 15:03:29', '否', NULL);
INSERT INTO `sys_log` VALUES (1812, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 15:04:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1813, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 6, NULL, '2024-09-06 15:12:44', NULL, '2024-09-06 15:12:50', '否', NULL);
INSERT INTO `sys_log` VALUES (1814, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 17:11:52', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1815, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-09 10:52:09', NULL, '2024-09-09 10:52:09', '否', NULL);
INSERT INTO `sys_log` VALUES (1816, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-09 11:35:41', NULL, '2024-09-09 11:35:41', '否', NULL);
INSERT INTO `sys_log` VALUES (1817, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-10 11:29:01', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1818, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-10 11:31:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1819, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-10 15:23:58', NULL, '2024-09-10 15:23:58', '否', NULL);
INSERT INTO `sys_log` VALUES (1820, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-10 15:24:41', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1821, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-10 15:26:43', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1822, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-10 15:27:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1823, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-11 09:35:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1824, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-11 10:03:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1825, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-11 15:39:51', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1826, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-11 17:15:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1827, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 09:30:24', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1828, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 10:14:19', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1829, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 11:05:41', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1830, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 11:05:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1831, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-12 16:05:23', NULL, '2024-09-12 16:05:24', '否', NULL);
INSERT INTO `sys_log` VALUES (1832, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 16:06:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1833, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 16:35:31', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1834, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 17:05:06', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1835, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 17:05:36', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1836, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 08:51:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1837, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:12:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1838, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:12:17', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1839, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:12:19', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1840, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:12:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1841, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:14:19', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1842, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:17:13', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1843, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:23:05', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1844, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:23:12', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1845, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:33:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1846, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:58:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1847, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-13 13:43:44', NULL, '2024-09-13 13:43:44', '否', NULL);
INSERT INTO `sys_log` VALUES (1848, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-19 09:05:10', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1849, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 09:33:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1850, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 14:43:13', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1851, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-21 08:06:38', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1852, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-23 08:11:21', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1853, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-23 16:43:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1854, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-23 18:05:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1855, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-23 18:05:34', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1856, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-23 18:05:39', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1857, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-24 09:27:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1858, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 1, NULL, '2024-09-25 09:44:26', NULL, '2024-09-25 09:44:28', '否', NULL);
INSERT INTO `sys_log` VALUES (1859, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-25 09:56:50', NULL, '2024-09-25 09:56:51', '否', NULL);
INSERT INTO `sys_log` VALUES (1860, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-25 10:04:40', NULL, '2024-09-25 10:04:41', '否', NULL);
INSERT INTO `sys_log` VALUES (1861, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 1, NULL, '2024-09-25 10:34:31', NULL, '2024-09-25 10:34:33', '否', NULL);
INSERT INTO `sys_log` VALUES (1862, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 10:38:25', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1863, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 10:40:25', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1864, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 1, NULL, '2024-09-25 10:47:06', NULL, '2024-09-25 10:47:08', '否', NULL);
INSERT INTO `sys_log` VALUES (1865, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-25 10:48:37', NULL, '2024-09-25 10:48:37', '否', NULL);
INSERT INTO `sys_log` VALUES (1866, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-09-25 10:51:08', NULL, '2024-09-25 10:51:08', '否', NULL);
INSERT INTO `sys_log` VALUES (1867, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 16:41:43', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1868, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-26 11:10:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1869, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-26 11:39:53', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1870, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-27 13:11:31', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1871, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-27 14:44:52', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1872, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-09 10:01:24', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1873, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-10 09:17:30', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1874, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-11 15:23:52', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1875, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-11 15:24:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1876, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 11:37:17', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1877, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-15 08:57:59', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1878, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-15 10:15:52', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1879, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 11:10:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1880, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-22 11:43:28', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1881, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-23 09:49:49', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1882, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-25 13:56:31', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1883, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-25 14:55:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1884, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-25 17:42:19', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1885, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-30 09:05:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1886, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-30 09:39:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1887, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-31 13:37:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1888, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-31 17:35:01', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1889, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-01 09:07:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1890, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-01 15:12:41', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1891, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-01 17:17:52', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1892, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-11-05 14:37:50', NULL, '2024-11-05 14:37:50', '否', NULL);
INSERT INTO `sys_log` VALUES (1893, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-11-05 16:26:43', NULL, '2024-11-05 16:26:43', '否', NULL);
INSERT INTO `sys_log` VALUES (1894, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-11-05 16:40:46', NULL, '2024-11-05 16:40:46', '否', NULL);
INSERT INTO `sys_log` VALUES (1895, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-11-05 16:55:01', NULL, '2024-11-05 16:55:01', '否', NULL);
INSERT INTO `sys_log` VALUES (1896, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-05 16:58:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1897, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 09:17:01', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1898, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 17:05:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1899, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 17:42:17', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1900, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 17:43:36', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1901, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 21:13:03', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1902, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 21:13:12', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1903, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 21:13:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1904, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 09:29:13', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1905, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:02:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1906, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:27:59', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1907, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:28:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1908, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:29:34', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1909, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:31:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1910, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:39:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1911, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:40:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1912, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:44:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1913, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 11:00:23', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1914, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 17:56:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1915, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-12 16:35:00', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1916, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-13 09:20:05', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1917, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-13 09:26:38', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1918, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-13 11:00:49', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1919, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-13 14:19:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1920, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-13 15:35:13', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1921, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-14 10:40:18', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1922, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-14 11:05:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1923, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-14 14:29:10', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1924, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-19 10:45:39', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1925, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-20 09:55:27', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1926, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-20 10:16:48', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1927, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-21 15:49:32', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1928, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-22 08:43:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1929, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-22 09:46:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1930, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-25 09:01:18', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1931, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-26 10:46:57', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1932, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-26 17:55:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1933, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-27 15:07:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1934, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-28 16:05:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1935, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-29 10:08:58', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1936, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-12-02 14:08:54', NULL, '2024-12-02 14:08:55', '否', NULL);
INSERT INTO `sys_log` VALUES (1937, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-02 15:14:48', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1938, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-03 14:59:26', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1939, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-03 15:15:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1940, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-03 16:50:17', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1941, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-03 17:33:38', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1942, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-03 17:53:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1943, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-04 09:14:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1944, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-04 09:30:26', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1945, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-05 11:09:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1946, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-05 16:59:54', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1947, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-06 10:35:41', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1948, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-09 10:50:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1949, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-09 11:28:52', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1950, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-10 13:45:00', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1951, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-10 17:13:03', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1952, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-10 17:13:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1953, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-10 17:14:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1954, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-10 17:16:41', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1955, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-10 17:18:12', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1956, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-11 14:08:32', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1957, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-11 15:22:17', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1958, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-11 16:09:28', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1959, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-11 16:17:09', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1960, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-12 13:34:54', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1961, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-12 14:01:46', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1962, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 09:51:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1963, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 10:48:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1964, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 15:17:19', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1965, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 16:33:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1966, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 16:33:57', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1967, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-16 10:22:34', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1968, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-18 19:58:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1969, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-19 10:44:28', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1970, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-19 10:44:41', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1971, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-19 13:16:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1972, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-25 10:35:25', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1973, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-25 10:36:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1974, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-25 15:29:54', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1975, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-26 15:57:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1976, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-31 09:54:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1977, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-31 10:19:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1978, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-12-31 10:21:02', NULL, '2024-12-31 10:21:03', '否', NULL);
INSERT INTO `sys_log` VALUES (1979, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2024-12-31 10:22:33', NULL, '2024-12-31 10:22:34', '否', NULL);
INSERT INTO `sys_log` VALUES (1980, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-31 16:31:48', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1981, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-31 18:04:39', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1982, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-02 09:16:31', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1983, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-02 10:34:16', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1984, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:05:36', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1985, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:30:35', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1986, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:33:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1987, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:34:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1988, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:35:38', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1989, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:37:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1990, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:38:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1991, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:44:00', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1992, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:44:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1993, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:45:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1994, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:12', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1995, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:19', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1996, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1997, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:25', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1998, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:28', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (1999, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:36', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2000, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2001, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:50:21', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2002, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:51:13', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2003, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:53:05', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2004, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-08 13:20:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2005, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-08 13:20:59', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2006, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-09 09:07:51', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2007, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-09 15:24:03', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2008, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-13 16:55:21', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2009, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-14 15:40:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2010, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-14 16:26:53', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2011, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-14 16:27:49', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2012, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-14 16:35:18', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2013, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-14 17:57:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2014, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-15 10:24:41', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2015, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 11:36:43', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2016, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 13:40:42', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2017, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 13:44:32', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2018, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 13:44:51', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2019, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 13:44:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2020, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 14:03:26', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2021, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 17:22:27', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2022, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 17:23:01', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2023, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 17:32:01', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2024, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2025-01-16 17:37:31', NULL, '2025-01-16 17:37:31', '否', NULL);
INSERT INTO `sys_log` VALUES (2025, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2025-01-16 17:37:46', NULL, '2025-01-16 17:37:46', '否', NULL);
INSERT INTO `sys_log` VALUES (2026, 1, '用户名: developer,登录成功！', 1, 'developer', 'developer', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 17:39:14', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2027, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 17:42:04', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2028, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 19:27:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2029, 1, '用户名: developer,登录成功！', 1, 'developer', 'developer', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-17 10:34:39', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2030, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-17 10:34:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2031, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-19 14:17:03', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2032, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:27:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2033, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 10:57:06', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2034, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2025-01-21 14:11:25', NULL, '2025-01-21 14:11:25', '否', NULL);
INSERT INTO `sys_log` VALUES (2035, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-11 09:40:17', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2036, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-11 14:34:49', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2037, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-11 15:45:28', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2038, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-11 16:56:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2039, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-14 09:24:50', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2040, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 08:51:38', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2041, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 09:40:23', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2042, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 09:49:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2043, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 10:34:36', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2044, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 11:11:30', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2045, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 11:26:50', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2046, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 13:38:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2047, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 15:29:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2048, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 15:30:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2049, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 15:34:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2050, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 15:35:34', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2051, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 15:37:10', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2052, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 15:44:28', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2053, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 17:00:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2054, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 09:01:10', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2055, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 10:44:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2056, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 10:44:23', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2057, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 11:16:28', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2058, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 11:52:38', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2059, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 12:43:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2060, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 17:02:24', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2061, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-19 14:28:00', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2062, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-20 12:50:52', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2063, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-20 15:09:42', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2064, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-20 16:34:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2065, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-20 22:06:57', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2066, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-20 22:17:25', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2067, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-24 09:09:43', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2068, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-24 10:57:34', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2069, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-24 15:50:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2070, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-24 17:24:13', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2071, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-24 17:24:36', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2072, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-25 10:09:35', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2073, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-25 13:02:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2074, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-25 13:28:19', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2075, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-25 14:27:28', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2076, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-25 20:04:18', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2077, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 08:56:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2078, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 14:04:59', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2079, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 14:41:50', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2080, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 14:52:24', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2081, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 14:57:42', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2082, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 22:10:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2083, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-27 08:45:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2084, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-27 09:38:50', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2085, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-27 09:45:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2086, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-27 12:54:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2087, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-27 15:40:48', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2088, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-27 21:31:57', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2089, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-28 08:53:48', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2090, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-28 10:31:26', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2091, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-28 10:34:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2092, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-28 11:37:47', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2093, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-28 12:42:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2094, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 12:08:19', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2095, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 20:31:41', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2096, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 20:31:51', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2097, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 23:04:42', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2098, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 23:07:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2099, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 07:55:38', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2100, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 17:45:08', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2101, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 17:49:18', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2102, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 17:51:46', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2103, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 09:22:24', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2104, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 13:59:17', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2105, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 15:18:33', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2106, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 15:23:26', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2107, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 15:38:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2108, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 16:21:07', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2109, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-04 09:55:27', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2110, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-04 10:28:55', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2111, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-05 09:35:29', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2112, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-06 10:00:21', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2113, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-06 13:04:04', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2114, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-06 13:04:12', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2115, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-06 17:40:11', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2116, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-06 17:49:19', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2117, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-06 17:56:50', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2118, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-07 09:54:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2119, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-09 09:08:46', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2120, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-09 09:09:22', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2121, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-09 09:11:34', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2122, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 08:57:15', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2123, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 09:29:45', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2124, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 10:02:57', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2125, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 13:01:10', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2126, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 14:14:28', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2127, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 14:14:31', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2128, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 14:16:42', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2129, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 15:52:40', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2130, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 16:26:37', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2131, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 09:28:03', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2132, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 15:10:56', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2133, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 15:22:02', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2134, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 16:34:32', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2135, 1, '区域secret跳转 用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 16:36:49', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2136, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 16:40:24', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2137, 0, '刷新菜单缓存成功', 2, NULL, NULL, NULL, 'queryRedisAllGroupMenusData', NULL, NULL, NULL, 0, NULL, '2025-03-11 16:42:49', NULL, '2025-03-11 16:42:49', '否', NULL);
INSERT INTO `sys_log` VALUES (2138, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 16:42:54', NULL, NULL, '否', NULL);
INSERT INTO `sys_log` VALUES (2139, 1, '用户名: 管理员,登录成功！', 1, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 16:43:24', NULL, NULL, '否', NULL);

-- ----------------------------
-- Table structure for sys_message_announcement
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_announcement`;
CREATE TABLE `sys_message_announcement`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `msg_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `sender` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布人',
  `priority` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优先级（L低，M中，H高）',
  `msg_category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2' COMMENT '消息类型1:通知公告2:系统消息',
  `msg_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通告对象类型（USER:指定用户，ALL:全体用户）',
  `send_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布状态（0未发布，1已发布，2已撤销）',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '撤销时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `bus_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型(email:邮件 bpm:流程)',
  `bus_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `open_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打开方式(组件：component 路由：url)',
  `open_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件/路由 地址',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `last_update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `user_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '指定用户',
  `msg_abstract` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '摘要',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_message_announcement
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_announcement_send
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_announcement_send`;
CREATE TABLE `sys_message_announcement_send`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `annt_id` bigint(20) NULL DEFAULT NULL COMMENT '通告ID',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `read_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阅读状态（0未读，1已读）',
  `read_time` datetime NULL DEFAULT NULL COMMENT '阅读时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `last_update_date` datetime NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_message_announcement_send
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_param_def
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_param_def`;
CREATE TABLE `sys_message_param_def`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id(主键)',
  `param_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变量名',
  `param_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变量描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inx_sys_message_param_def`(`param_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_message_param_def
-- ----------------------------
INSERT INTO `sys_message_param_def` VALUES (1, 'alarm_context', '告警内容');

-- ----------------------------
-- Table structure for sys_message_reception_conf
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_reception_conf`;
CREATE TABLE `sys_message_reception_conf`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `begin_time` time NULL DEFAULT NULL COMMENT '开始接收消息时间',
  `end_time` time NULL DEFAULT NULL COMMENT '结束接收消息时间',
  `reception_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收消息类型(多个用,隔开)1:本系统消息 2:邮件 3:短信 4:钉钉 5:企业微信',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `enable_holiday` tinyint(1) NULL DEFAULT 1 COMMENT '节假日是否接收 0-不接收 1-接收',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NULL DEFAULT 1 COMMENT '删除标识 0-删除 1-有效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户消息接收方式配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_message_reception_conf
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_template`;
CREATE TABLE `sys_message_template`  (
  `template_code` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板id(主键),由系统生成',
  `titile` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板标题',
  `msg_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板内容(带参数)',
  `msg_paramids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '引用参数id,多个参数用,分割',
  `type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板类型:01系统 02邮件 03短信',
  `channel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模版适用渠道（1-系统消息，2-邮件，3-短信，4-钉钉，5-企业微信，6-公众号）',
  `type_item` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型项ID',
  `priority` int(1) NULL DEFAULT NULL COMMENT '优先级:1普通 2次要 3重要 4紧急(为最高级)',
  `del_flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '逻辑删除 是 否',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户id',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户id',
  `voicefile_id` int(4) NULL DEFAULT NULL COMMENT '音频文件id',
  `netbox_id` int(3) NULL DEFAULT NULL COMMENT '网络音箱id',
  `platform_callback_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '告警消息处理时回调业务系统方法',
  `reserve1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `reserve2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `reserve3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `h5_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板内容H5元素方式',
  PRIMARY KEY (`template_code`) USING BTREE,
  INDEX `inx_sys_message_template`(`type`, `voicefile_id`, `netbox_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_message_template
-- ----------------------------
INSERT INTO `sys_message_template` VALUES ('TP20202408261513030001', 'IOT告警消息通知', '{1}', '1', '20', '1', '2', 1, '0', '2024-08-26 15:13:03', 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '{1}');
INSERT INTO `sys_message_template` VALUES ('TP20202408261522220001', 'IOT服务失联告警', '{1}', '1', '20', '1', '2', 1, '0', '2024-08-26 15:22:23', 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '{1}');

-- ----------------------------
-- Table structure for sys_portal_components
-- ----------------------------
DROP TABLE IF EXISTS `sys_portal_components`;
CREATE TABLE `sys_portal_components`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `template_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板标识',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件类型，1:业务中台，2：质量管理，3：生产管理，4：CPS平台',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `high` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高',
  `width` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宽',
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动态数据接口',
  `static_data` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '静态数据',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `systemid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_portal_components
-- ----------------------------

-- ----------------------------
-- Table structure for sys_portal_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_portal_user`;
CREATE TABLE `sys_portal_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '看板名称',
  `components_ids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件id集合，用逗号分隔',
  `page_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面类型：1、业务看板，2、生产看板，3、质量看板，99、自定义',
  `def_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否默认看板：1、是，0：否',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属用户id',
  `systemid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_portal_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_portal
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_portal`;
CREATE TABLE `sys_role_portal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `grpid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `portal_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '看板编码',
  `portal_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '看板名称',
  `portal_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '看板url',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_portal
-- ----------------------------

-- ----------------------------
-- Table structure for sys_sysmessage_results
-- ----------------------------
DROP TABLE IF EXISTS `sys_sysmessage_results`;
CREATE TABLE `sys_sysmessage_results`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id(主键)',
  `infmessage_id` bigint(20) NULL DEFAULT NULL COMMENT '消息接口表中的ID',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收的用户ID',
  `msg_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型:10通知 20告警 30报警',
  `type_item` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型项ID',
  `type_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型项编码',
  `is_read` bit(1) NULL DEFAULT NULL COMMENT '是否已读:0:未读，1已读',
  `read_date` datetime NULL DEFAULT NULL COMMENT '读时间',
  `is_result` bit(1) NULL DEFAULT NULL COMMENT '是否已处理相关业务：0未处理 1已处理',
  `result_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理方法内容/结果内容',
  `result_date` datetime NULL DEFAULT NULL COMMENT '处理结果时间',
  `result_userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理结果用户',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_delete` bit(1) NULL DEFAULT NULL COMMENT '逻辑删除 1是 0否',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `reserve1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `reserve2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `reserve3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inx_sys_sysmessage_results`(`user_id`, `infmessage_id`, `msg_type`, `type_code`) USING BTREE,
  INDEX `inx_sys_sysmessage_results_1`(`msg_type`, `type_code`, `infmessage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_sysmessage_results
-- ----------------------------
INSERT INTO `sys_sysmessage_results` VALUES (1, 1, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '20', '2', '0001', b'1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, '2024-08-29 10:19:12', b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (2, 2, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '20', '2', '0001', b'1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, '2024-08-29 10:21:22', b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (3, 3, 'admin', '20', '2', '0001', b'1', NULL, b'1', '自动处理', NULL, NULL, '自动处理', NULL, '2024-08-29 10:21:46', b'0', NULL, '2024-08-30 11:00:00', NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (4, 4, 'admin', '20', '2', '0001', b'1', NULL, b'1', '自动处理', NULL, NULL, '自动处理', NULL, '2024-08-29 10:32:22', b'0', NULL, '2024-08-30 11:00:00', NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (5, 5, 'admin', '20', '2', '0001', b'1', NULL, b'1', '自动处理', NULL, NULL, '自动处理', NULL, '2024-08-29 10:32:55', b'0', NULL, '2024-08-30 11:00:00', NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (6, 6, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '20', '2', '0001', b'1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, '2024-08-29 10:42:51', b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (7, 7, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '20', '2', '0001', b'1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, '2024-08-29 11:13:43', b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (8, 8, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '20', '2', '0001', b'1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, '2024-08-29 11:24:36', b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (9, 9, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '20', '2', '0001', b'1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, '2024-08-29 11:29:45', b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (10, 10, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '20', '2', '0001', b'1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, '2024-08-29 11:32:17', b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (11, 11, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '20', '2', '0001', b'1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, '2024-08-29 11:42:58', b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (12, 12, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '20', '2', '0001', b'1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, '2024-08-29 12:38:41', b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (13, 13, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '20', '2', '0001', b'1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, '2024-08-29 12:48:48', b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (14, 14, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '20', '2', '0001', b'1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, '2024-08-29 17:46:20', b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (15, 15, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '20', '2', '0001', b'1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, '2024-08-30 09:36:00', b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_sysmessage_results` VALUES (16, 16, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '20', '2', '0001', b'1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, '2024-08-30 10:46:09', b'0', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_task_manager
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_manager`;
CREATE TABLE `sys_task_manager`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类型编码',
  `user_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务对象类型（USER:指定用户，ALL:全体用户）',
  `user_grpid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户组id',
  `user_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '指定用户id',
  `interval_num` bigint(20) NULL DEFAULT NULL COMMENT '间隔',
  `interval_unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '间隔单位',
  `run_type` int(2) NULL DEFAULT NULL COMMENT '运行方式（1：一次，2：周期）',
  `run_time` datetime NULL DEFAULT NULL COMMENT '运行时间（运行方式为一次时，选择运行时间）',
  `cycle_begin_time` datetime NULL DEFAULT NULL COMMENT '周期开始时间，保存时分秒',
  `cycle_end_time` datetime NULL DEFAULT NULL COMMENT '周期结束时间，保存时分秒',
  `begin_time` datetime NULL DEFAULT NULL COMMENT '生效开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '生效结束时间',
  `always_effective` int(2) NULL DEFAULT NULL COMMENT '是否永远生效（1：是，2：否）',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态（0：待发布，1：已发布，2：已完成，已超时）',
  `delflag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标识',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `systemid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recvmsg_userids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收系统消息的用户id(多户以,分割)',
  `system_callback_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务处理时回调URL -业务系统提供的方法',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_task_manager
-- ----------------------------

-- ----------------------------
-- Table structure for sys_task_manager_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_manager_user`;
CREATE TABLE `sys_task_manager_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类型编码',
  `user_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务对象类型（USER:指定用户，ALL:全体用户）',
  `user_grpid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户组id',
  `user_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '指定用户id',
  `interval_num` bigint(20) NULL DEFAULT NULL COMMENT '间隔',
  `interval_unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '间隔单位',
  `run_type` int(2) NULL DEFAULT NULL COMMENT '运行方式（1：一次，2：周期）',
  `run_time` datetime NULL DEFAULT NULL COMMENT '运行时间（运行方式为一次时，选择运行时间）',
  `cycle_begin_time` datetime NULL DEFAULT NULL COMMENT '周期开始时间，保存时分秒',
  `cycle_end_time` datetime NULL DEFAULT NULL COMMENT '周期结束时间，保存时分秒',
  `begin_time` datetime NULL DEFAULT NULL COMMENT '生效开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '生效结束时间',
  `always_effective` int(2) NULL DEFAULT NULL COMMENT '是否永远生效（1：是，2：否）',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态（0：待发布，1：已发布，2：已完成，已超时）',
  `delflag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标识',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `systemid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_task_manager_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_task_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_type`;
CREATE TABLE `sys_task_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `message_template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息模板',
  `haschild` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否有子级',
  `parent` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级',
  `createby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `orderby` bigint(20) NULL DEFAULT NULL COMMENT '排序',
  `systemid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统ID',
  `updateby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delflag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '删除标识',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `business_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_task_type
-- ----------------------------

-- ----------------------------
-- Table structure for sys_task_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_user`;
CREATE TABLE `sys_task_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务编码',
  `task_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `task_remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '任务描述',
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类型编码',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `begin_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `deal_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `deal_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人ID',
  `deal_user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人名称',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态（0：待处理，1：已完成，2：已拒收，已超时）',
  `feedback` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务反馈',
  `del_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标识',
  `createby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `system_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统/功能模块ID',
  `recvmsg_userids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收系统消息的用户ID(多户,分割)',
  `system_orderid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统/功能模块的相关单号 （比如生产管理的调度单号）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_task_user`(`type_code`, `user_id`, `system_id`, `system_orderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_task_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_browse_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_browse_record`;
CREATE TABLE `sys_user_browse_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `menu_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单id',
  `sys_menu_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统菜单编号',
  `sys_menu_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统菜单名称',
  `root_menu_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录菜单编号',
  `root_menu_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录菜单名称',
  `menu_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编号',
  `menu_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `logout_time` datetime NULL DEFAULT NULL COMMENT '退出时间',
  `login_duration` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录时长(秒)',
  `login_method` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录方式(Windows/Macintosh/Android/iPhone/iPad/other)',
  `login_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录Ip',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_menu_name`(`sys_menu_name`) USING BTREE,
  INDEX `idx_root_menu_name`(`root_menu_name`) USING BTREE,
  INDEX `idx_menu_name`(`menu_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1211 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录浏览菜单记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_browse_record
-- ----------------------------
INSERT INTO `sys_user_browse_record` VALUES (1, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 10:06:33', '2024-02-29 14:11:47', '14713', 'Macintosh', '127.0.0.1', '2024-02-29 10:06:13', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (2, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-02-29 10:36:57', '2024-02-29 11:05:55', '1737', 'Macintosh', '127.0.0.1', '2024-02-29 10:36:37', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (3, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 11:05:59', '2024-02-29 11:12:17', '378', 'Macintosh', '127.0.0.1', '2024-02-29 11:05:39', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (4, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 11:12:20', '2024-02-29 11:15:32', '192', 'Macintosh', '127.0.0.1', '2024-02-29 11:12:00', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (5, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 11:15:43', '2024-02-29 11:19:01', '197', 'Macintosh', '127.0.0.1', '2024-02-29 11:15:23', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (6, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 11:19:03', '2024-02-29 11:26:51', '468', 'Macintosh', '127.0.0.1', '2024-02-29 11:18:43', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (7, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 11:26:55', '2024-02-29 14:09:01', '9726', 'Macintosh', '127.0.0.1', '2024-02-29 11:26:35', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (8, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-02-29 14:09:04', '2024-02-29 14:09:07', '2', 'Macintosh', '127.0.0.1', '2024-02-29 14:08:44', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (9, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 14:09:07', '2024-02-29 14:11:29', '142', 'Macintosh', '127.0.0.1', '2024-02-29 14:08:47', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (10, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 14:11:31', '2024-02-29 14:11:47', '15', 'Macintosh', '127.0.0.1', '2024-02-29 14:11:12', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (11, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:12:18', '2024-02-29 14:12:52', '34', 'Macintosh', '127.0.0.1', '2024-02-29 14:11:58', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (12, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-02-29 14:12:25', '2024-02-29 14:12:27', '2', 'Macintosh', '127.0.0.1', '2024-02-29 14:12:05', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (13, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-02-29 14:12:27', '2024-02-29 14:12:52', '25', 'Macintosh', '127.0.0.1', '2024-02-29 14:12:08', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (14, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:12:57', '2024-02-29 14:13:29', '31', 'Macintosh', '127.0.0.1', '2024-02-29 14:12:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (15, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-02-29 14:13:08', '2024-02-29 14:13:08', '0', 'Macintosh', '127.0.0.1', '2024-02-29 14:12:48', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (16, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-02-29 14:13:08', '2024-02-29 14:13:29', '20', 'Macintosh', '127.0.0.1', '2024-02-29 14:12:49', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (17, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:13:42', '2024-02-29 14:17:36', '233', 'Macintosh', '127.0.0.1', '2024-02-29 14:13:23', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (18, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 14:16:01', '2024-02-29 14:17:33', '92', 'Macintosh', '127.0.0.1', '2024-02-29 14:15:42', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (19, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-02-29 14:17:34', '2024-02-29 14:17:36', '2', 'Macintosh', '127.0.0.1', '2024-02-29 14:17:15', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (20, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 14:17:36', '2024-02-29 14:17:36', '0', 'Macintosh', '127.0.0.1', '2024-02-29 14:17:16', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (21, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-02-29 14:17:40', '2024-02-29 14:17:42', '1', 'Macintosh', '127.0.0.1', '2024-02-29 14:17:20', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (22, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 14:17:42', '2024-02-29 14:19:41', '118', 'Macintosh', '127.0.0.1', '2024-02-29 14:17:22', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (23, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:19:57', '2024-02-29 14:20:38', '40', 'Macintosh', '127.0.0.1', '2024-02-29 14:19:38', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (24, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 14:20:20', '2024-02-29 14:20:38', '17', 'Macintosh', '127.0.0.1', '2024-02-29 14:20:01', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (25, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:20:43', '2024-02-29 14:21:40', '56', 'Macintosh', '127.0.0.1', '2024-02-29 14:20:24', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (26, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 14:20:58', '2024-02-29 14:21:17', '19', 'Macintosh', '127.0.0.1', '2024-02-29 14:20:38', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (27, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-02-29 14:21:17', '2024-02-29 14:21:35', '17', 'Macintosh', '127.0.0.1', '2024-02-29 14:20:57', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (28, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:21:48', '2024-02-29 14:22:43', '54', 'Macintosh', '127.0.0.1', '2024-02-29 14:21:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (29, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-02-29 14:22:02', '2024-02-29 14:22:04', '1', 'Macintosh', '127.0.0.1', '2024-02-29 14:21:43', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (30, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 14:22:04', '2024-02-29 14:22:22', '17', 'Macintosh', '127.0.0.1', '2024-02-29 14:21:44', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (31, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-02-29 14:22:22', '2024-02-29 14:22:43', '20', 'Macintosh', '127.0.0.1', '2024-02-29 14:22:02', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (32, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:22:47', '2024-02-29 14:27:58', '310', 'Macintosh', '127.0.0.1', '2024-02-29 14:22:27', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (33, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-02-29 14:23:20', '2024-02-29 14:23:31', '11', 'Macintosh', '127.0.0.1', '2024-02-29 14:23:00', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (34, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-02-29 14:23:40', '2024-02-29 14:23:40', '0', 'Macintosh', '127.0.0.1', '2024-02-29 14:23:20', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (35, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 14:23:40', '2024-02-29 14:24:29', '48', 'Macintosh', '127.0.0.1', '2024-02-29 14:23:21', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (36, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 14:24:31', '2024-02-29 14:24:39', '7', 'Macintosh', '127.0.0.1', '2024-02-29 14:24:12', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (37, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-02-29 14:24:39', '2024-02-29 14:26:01', '82', 'Macintosh', '127.0.0.1', '2024-02-29 14:24:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (38, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-02-29 14:26:04', '2024-02-29 14:27:48', '103', 'Macintosh', '127.0.0.1', '2024-02-29 14:25:44', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (39, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 14:28:02', '2024-03-29 14:21:47', '2505224', 'Macintosh', '127.0.0.1', '2024-02-29 14:27:42', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (40, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-02-29 14:28:14', '2024-03-28 13:58:34', '2417420', 'Macintosh', '127.0.0.1', '2024-02-29 14:27:54', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (41, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-28 13:58:34', '2024-03-29 14:21:47', '87792', 'Windows', '192.168.1.20', '2024-03-28 13:58:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (42, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-03-28 14:13:24', '2024-03-28 14:13:27', '2', 'Windows', '192.168.1.20', '2024-03-28 14:13:23', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (43, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-03-28 14:13:27', '2024-03-28 14:13:58', '31', 'Windows', '192.168.1.20', '2024-03-28 14:13:26', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (44, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-03-28 14:13:58', '2024-03-28 14:15:54', '115', 'Windows', '192.168.1.20', '2024-03-28 14:13:58', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (45, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-03-28 14:15:54', '2024-03-28 14:16:27', '33', 'Windows', '192.168.1.20', '2024-03-28 14:15:53', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (46, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-03-28 14:16:30', '2024-03-28 17:00:10', '9820', 'Windows', '192.168.1.20', '2024-03-28 14:16:29', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (47, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-28 17:00:29', '2024-03-29 14:21:47', '76877', 'Windows', '192.168.1.20', '2024-03-28 17:00:29', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (48, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-03-29 09:56:46', '2024-03-29 09:56:51', '4', 'Windows', '192.168.1.20', '2024-03-29 09:56:46', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (49, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-03-29 09:56:51', '2024-03-29 09:56:52', '1', 'Windows', '192.168.1.20', '2024-03-29 09:56:50', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (50, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-03-29 09:56:52', '2024-03-29 09:56:59', '6', 'Windows', '192.168.1.20', '2024-03-29 09:56:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (51, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-03-29 09:56:59', '2024-03-29 09:58:44', '104', 'Windows', '192.168.1.20', '2024-03-29 09:56:58', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (52, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-29 15:23:57', '2024-04-01 15:04:56', '258059', 'Windows', '192.168.1.20', '2024-03-29 15:23:57', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (53, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 11:03:37', '2024-04-01 15:04:56', '14479', 'Windows', '192.168.1.20', '2024-04-01 11:03:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (54, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 14:58:47', '2024-04-01 15:04:56', '369', 'Windows', '192.168.1.20', '2024-04-01 14:58:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (55, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 16:01:14', '2024-04-09 11:01:25', '673210', 'Windows', '192.168.1.20', '2024-04-01 16:01:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (56, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-09 08:06:39', '2024-04-09 11:01:25', '10485', 'Windows', '192.168.1.20', '2024-04-09 08:06:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (57, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-09 08:13:22', '2024-04-09 11:01:25', '10082', 'Windows', '192.168.1.20', '2024-04-09 08:13:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (58, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-04-09 08:13:32', '2024-04-09 08:13:35', '2', 'Windows', '192.168.1.20', '2024-04-09 08:13:31', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (59, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-04-09 08:13:35', '2024-04-09 08:13:37', '1', 'Windows', '192.168.1.20', '2024-04-09 08:13:34', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (60, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-04-09 08:13:37', '2024-04-09 08:20:31', '414', 'Windows', '192.168.1.20', '2024-04-09 08:13:36', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (61, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-04-09 08:20:31', '2024-04-09 08:20:37', '5', 'Windows', '192.168.1.20', '2024-04-09 08:20:31', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (62, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-04-09 08:20:37', '2024-04-09 08:20:40', '2', 'Windows', '192.168.1.20', '2024-04-09 08:20:36', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (63, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-04-09 08:20:40', '2024-04-09 08:20:49', '9', 'Windows', '192.168.1.20', '2024-04-09 08:20:39', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (64, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-04-09 08:20:49', '2024-04-09 08:21:11', '21', 'Windows', '192.168.1.20', '2024-04-09 08:20:49', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (65, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-04-09 08:21:11', '2024-04-09 08:21:49', '37', 'Windows', '192.168.1.20', '2024-04-09 08:21:10', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (66, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-04-09 08:21:49', '2024-04-09 08:21:52', '3', 'Windows', '192.168.1.20', '2024-04-09 08:21:48', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (67, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-04-09 08:21:52', '2024-04-09 08:22:03', '10', 'Windows', '192.168.1.20', '2024-04-09 08:21:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (68, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-04-09 08:22:03', '2024-04-09 08:22:03', '0', 'Windows', '192.168.1.20', '2024-04-09 08:22:02', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (69, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-04-09 08:22:03', '2024-04-09 08:26:46', '283', 'Windows', '192.168.1.20', '2024-04-09 08:22:03', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (70, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-04-09 08:26:51', '2024-04-09 08:26:53', '2', 'Windows', '192.168.1.20', '2024-04-09 08:26:50', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (71, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-04-09 08:26:53', '2024-04-09 08:26:55', '1', 'Windows', '192.168.1.20', '2024-04-09 08:26:53', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (72, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-04-09 08:26:55', '2024-04-09 08:27:00', '5', 'Windows', '192.168.1.20', '2024-04-09 08:26:54', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (73, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-04-09 08:27:00', '2024-04-09 08:27:03', '3', 'Windows', '192.168.1.20', '2024-04-09 08:27:00', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (74, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-04-09 08:27:03', '2024-04-09 08:27:06', '3', 'Windows', '192.168.1.20', '2024-04-09 08:27:03', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (75, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-04-09 08:27:06', '2024-04-09 08:27:09', '2', 'Windows', '192.168.1.20', '2024-04-09 08:27:06', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (76, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-04-09 08:27:09', '2024-04-09 09:27:19', '3609', 'Windows', '192.168.1.20', '2024-04-09 08:27:08', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (77, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-09 09:27:27', '2024-04-09 11:01:25', '5637', 'Windows', '192.168.1.20', '2024-04-09 09:27:26', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (78, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-10 10:11:49', '2024-04-10 10:53:28', '2499', 'Windows', '192.168.1.20', '2024-04-10 10:11:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (79, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-10 17:45:58', '2024-04-12 13:59:28', '159209', 'Windows', '192.168.1.20', '2024-04-10 17:45:58', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (80, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-11 09:00:55', '2024-04-12 13:59:28', '104312', 'Windows', '192.168.1.20', '2024-04-11 09:00:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (81, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-11 10:00:05', '2024-04-12 13:59:28', '100762', 'Windows', '192.168.1.20', '2024-04-11 10:00:05', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (82, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-12 13:59:44', '2024-04-16 13:53:30', '345226', 'Windows', '192.168.1.20', '2024-04-12 13:59:44', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (83, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-15 10:50:40', '2024-04-16 13:53:30', '97370', 'Windows', '192.168.1.20', '2024-04-15 10:50:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (84, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 13:53:33', '2024-04-16 16:29:41', '9367', 'Windows', '192.168.1.20', '2024-04-16 13:53:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (85, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 13:54:01', '2024-04-16 16:29:41', '9339', 'Windows', '192.168.1.20', '2024-04-16 13:54:00', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (86, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 15:02:49', '2024-04-16 16:29:41', '5211', 'Windows', '192.168.1.20', '2024-04-16 15:02:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (87, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 15:54:03', '2024-04-16 16:29:41', '2137', 'Windows', '192.168.1.20', '2024-04-16 15:54:02', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (88, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 17:39:33', '2024-04-16 17:39:40', '7', 'Windows', '192.168.1.20', '2024-04-16 17:39:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (89, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 17:39:55', '2024-04-16 17:44:00', '245', 'Windows', '192.168.1.20', '2024-04-16 17:39:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (90, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 17:44:07', '2024-04-16 17:55:16', '669', 'Windows', '192.168.1.20', '2024-04-16 17:44:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (91, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-16 17:52:32', '2024-04-16 17:55:16', '164', 'Windows', '192.168.1.20', '2024-04-16 17:52:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (92, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 10:33:37', '2024-04-17 10:39:14', '337', 'Windows', '127.0.0.1', '2024-04-17 10:33:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (93, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 10:39:21', '2024-04-17 10:47:26', '484', 'Windows', '127.0.0.1', '2024-04-17 10:39:20', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (94, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 10:47:32', '2024-04-17 12:10:45', '4992', 'Windows', '127.0.0.1', '2024-04-17 10:47:31', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (95, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 11:19:39', '2024-04-17 12:10:45', '3065', 'Windows', '127.0.0.1', '2024-04-17 11:19:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (96, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 12:10:51', '2024-04-17 12:38:18', '1647', 'Windows', '127.0.0.1', '2024-04-17 12:10:51', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (97, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 12:38:24', '2024-04-17 14:52:28', '8044', 'Windows', '127.0.0.1', '2024-04-17 12:38:24', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (98, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 14:52:25', '2024-04-17 14:52:28', '3', 'Windows', '127.0.0.1', '2024-04-17 14:52:24', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (99, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 14:52:33', '2024-04-18 09:45:47', '67993', 'Windows', '127.0.0.1', '2024-04-17 14:52:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (100, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 14:59:41', '2024-04-18 09:45:47', '67565', 'Windows', '127.0.0.1', '2024-04-17 14:59:40', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (101, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-17 15:00:38', '2024-04-18 09:45:47', '67508', 'Windows', '192.168.1.20', '2024-04-17 15:00:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (102, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-18 09:26:06', '2024-04-18 09:45:47', '1180', 'Windows', '127.0.0.1', '2024-04-18 09:26:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (103, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-18 09:46:44', '2024-04-18 14:03:10', '15386', 'Windows', '127.0.0.1', '2024-04-18 09:46:44', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (104, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-18 16:19:00', '2024-04-18 17:44:26', '5126', 'Windows', '192.168.1.20', '2024-04-18 16:18:59', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (105, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-18 17:44:32', '2024-04-20 16:05:04', '166831', 'Windows', '127.0.0.1', '2024-04-18 17:44:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (106, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-19 09:43:11', '2024-04-20 16:05:04', '109312', 'Macintosh', '192.168.1.20', '2024-04-19 09:43:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (107, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-19 16:03:42', '2024-04-20 16:05:04', '86481', 'Macintosh', '192.168.1.20', '2024-04-19 16:03:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (108, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 14:44:27', '2024-04-20 16:05:04', '4836', 'Macintosh', '192.168.1.20', '2024-04-20 14:44:27', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (109, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 16:02:18', '2024-04-20 16:05:04', '165', 'Windows', '192.168.1.20', '2024-04-20 16:02:17', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (110, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 09:18:02', '2024-04-22 17:36:06', '29884', 'Macintosh', '192.168.1.20', '2024-04-22 09:18:01', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (111, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 11:40:29', '2024-04-22 17:36:06', '21337', 'Macintosh', '192.168.1.20', '2024-04-22 11:40:29', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (112, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 16:18:21', '2024-04-22 17:36:06', '4665', 'Macintosh', '192.168.1.20', '2024-04-22 16:18:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (113, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 17:17:57', '2024-04-22 17:36:06', '1089', 'Windows', '192.168.1.20', '2024-04-22 17:17:56', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (114, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 17:19:22', '2024-04-22 17:36:06', '1004', 'Windows', '127.0.0.1', '2024-04-22 17:19:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (115, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 17:45:32', '2024-04-22 17:47:20', '107', 'Windows', '127.0.0.1', '2024-04-22 17:45:31', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (116, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 17:47:02', '2024-04-22 17:47:20', '17', 'Windows', '127.0.0.1', '2024-04-22 17:47:02', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (117, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 17:47:51', '2024-04-22 17:48:20', '29', 'Windows', '127.0.0.1', '2024-04-22 17:47:51', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (118, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 17:48:34', '2024-04-23 08:15:48', '52033', 'Windows', '127.0.0.1', '2024-04-22 17:48:34', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (119, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 08:08:36', '2024-04-23 08:15:48', '431', 'Windows', '127.0.0.1', '2024-04-23 08:08:36', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (120, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 08:16:16', '2024-04-23 08:19:58', '222', 'Windows', '127.0.0.1', '2024-04-23 08:16:15', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (121, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 08:19:55', '2024-04-23 08:19:58', '3', 'Windows', '127.0.0.1', '2024-04-23 08:19:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (122, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 08:20:03', '2024-04-23 14:58:32', '23908', 'Windows', '127.0.0.1', '2024-04-23 08:20:03', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (123, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 09:32:50', '2024-04-23 14:58:32', '19541', 'Macintosh', '192.168.112.56', '2024-04-23 09:32:50', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (124, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 15:30:02', '2024-04-23 15:47:44', '1061', 'Windows', '127.0.0.1', '2024-04-23 15:30:01', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (125, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 15:47:54', '2024-04-24 09:55:50', '65275', 'Windows', '127.0.0.1', '2024-04-23 15:47:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (126, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:34:07', '2024-04-24 09:55:50', '4902', 'Macintosh', '127.0.0.1', '2024-04-24 08:34:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (127, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 09:03:46', '2024-04-24 09:55:50', '3123', 'Macintosh', '127.0.0.1', '2024-04-24 09:03:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (128, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 09:55:56', '2024-04-24 10:30:10', '2054', 'Windows', '127.0.0.1', '2024-04-24 09:55:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (129, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 09:56:42', '2024-04-24 10:30:10', '2008', 'Windows', '127.0.0.1', '2024-04-24 09:56:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (130, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 10:36:28', '2024-04-25 17:16:17', '110389', 'Windows', '127.0.0.1', '2024-04-24 10:36:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (131, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-04-24 16:52:19', '2024-04-24 16:52:20', '0', 'Windows', '127.0.0.1', '2024-04-24 16:52:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (132, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'announcement', '4000', '业务中台', '400003', '消息中心', '40000301', '通知公告', '2024-04-24 16:52:20', '2024-04-24 16:52:21', '0', 'Windows', '127.0.0.1', '2024-04-24 16:52:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (133, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-04-24 16:52:21', '2024-04-24 18:17:01', '5080', 'Windows', '127.0.0.1', '2024-04-24 16:52:20', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (134, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 17:16:24', '2024-04-26 09:40:42', '59057', 'Windows', '127.0.0.1', '2024-04-25 17:16:23', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (135, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 09:40:45', '2024-04-26 17:34:13', '28408', 'Windows', '127.0.0.1', '2024-04-26 09:40:45', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (136, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 17:34:16', '2024-04-29 11:29:48', '237332', 'Windows', '127.0.0.1', '2024-04-26 17:34:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (137, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 18:29:37', '2024-04-29 11:29:48', '234011', 'Windows', '127.0.0.1', '2024-04-26 18:29:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (138, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-04-28 15:56:47', '2024-04-28 15:56:48', '0', 'Windows', '127.0.0.1', '2024-04-28 15:56:47', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (139, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-04-28 15:56:48', '2024-04-28 15:56:49', '0', 'Windows', '127.0.0.1', '2024-04-28 15:56:47', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (140, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-04-28 15:56:49', '2024-04-28 15:56:52', '2', 'Windows', '127.0.0.1', '2024-04-28 15:56:48', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (141, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-04-28 15:56:52', '2024-04-28 15:56:53', '0', 'Windows', '127.0.0.1', '2024-04-28 15:56:51', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (142, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-04-28 15:56:53', '2024-04-28 15:56:54', '1', 'Windows', '127.0.0.1', '2024-04-28 15:56:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (143, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-04-28 15:56:54', '2024-04-28 15:56:56', '1', 'Windows', '127.0.0.1', '2024-04-28 15:56:54', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (144, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-04-28 15:56:56', '2024-04-28 15:56:58', '2', 'Windows', '127.0.0.1', '2024-04-28 15:56:55', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (145, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-04-28 15:56:58', '2024-04-28 15:57:06', '8', 'Windows', '127.0.0.1', '2024-04-28 15:56:58', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (146, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-04-28 15:57:06', '2024-04-29 10:32:53', '66947', 'Windows', '127.0.0.1', '2024-04-28 15:57:06', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (147, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-29 10:32:56', '2024-04-29 11:29:48', '3412', 'Windows', '127.0.0.1', '2024-04-29 10:32:56', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (148, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-29 11:21:23', '2024-04-29 11:29:48', '505', 'Windows', '127.0.0.1', '2024-04-29 11:21:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (149, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-29 15:54:51', '2024-04-29 16:01:19', '388', 'Windows', '127.0.0.1', '2024-04-29 15:54:50', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (150, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-30 15:28:03', '2024-05-06 17:58:19', '527415', 'Windows', '127.0.0.1', '2024-04-30 15:28:02', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (151, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-06 08:46:55', '2024-05-06 17:58:19', '33083', 'Macintosh', '127.0.0.1', '2024-05-06 08:46:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (152, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-06 17:54:09', '2024-05-06 17:58:19', '249', 'Macintosh', '127.0.0.1', '2024-05-06 17:54:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (153, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-06 17:58:25', '2024-05-06 17:59:10', '44', 'Windows', '127.0.0.1', '2024-05-06 17:58:24', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (154, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-06 17:59:16', '2024-05-08 11:37:46', '149909', 'Windows', '127.0.0.1', '2024-05-06 17:59:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (155, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-06 18:00:41', '2024-05-08 11:37:46', '149824', 'Windows', '127.0.0.1', '2024-05-06 18:00:40', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (156, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 11:28:42', '2024-05-08 11:37:46', '86943', 'Macintosh', '127.0.0.1', '2024-05-07 11:28:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (157, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-08 11:38:47', '2024-05-11 22:25:15', '297988', 'Windows', '127.0.0.1', '2024-05-08 11:38:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (158, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-08 14:45:42', '2024-05-11 22:25:15', '286773', 'Macintosh', '127.0.0.1', '2024-05-08 14:45:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (159, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-09 10:23:49', '2024-05-11 22:25:15', '216086', 'Windows', '127.0.0.1', '2024-05-09 10:23:48', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (160, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-09 13:40:07', '2024-05-11 22:25:15', '204308', 'Windows', '127.0.0.1', '2024-05-09 13:40:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (161, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-09 14:21:12', '2024-05-11 22:25:15', '201843', 'Windows', '127.0.0.1', '2024-05-09 14:21:12', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (162, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-11 14:58:55', '2024-05-11 22:25:15', '26780', 'Macintosh', '127.0.0.1', '2024-05-11 14:58:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (163, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-11 22:26:56', '2024-05-14 19:36:54', '248998', 'Windows', '127.0.0.1', '2024-05-11 22:26:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (164, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-14 14:53:22', '2024-05-14 19:36:54', '17012', 'Macintosh', '127.0.0.1', '2024-05-14 14:53:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (165, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-05-14 15:51:09', '2024-05-14 16:48:27', '3437', 'Windows', '127.0.0.1', '2024-05-14 15:51:08', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (166, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 14:05:45', '2024-05-15 17:39:15', '12810', 'Windows', '127.0.0.1', '2024-05-15 14:05:44', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (167, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'announcement', '4000', '业务中台', '400003', '消息中心', '40000301', '通知公告', '2024-05-15 14:06:18', '2024-05-15 14:06:22', '3', 'Windows', '127.0.0.1', '2024-05-15 14:06:18', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (168, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-05-15 14:06:22', '2024-05-15 14:06:25', '3', 'Windows', '127.0.0.1', '2024-05-15 14:06:21', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (169, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-05-15 14:06:25', '2024-05-15 14:06:27', '1', 'Windows', '127.0.0.1', '2024-05-15 14:06:25', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (170, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-05-15 14:06:27', '2024-05-15 14:06:31', '3', 'Windows', '127.0.0.1', '2024-05-15 14:06:26', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (171, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-05-15 14:06:31', '2024-05-15 14:06:42', '10', 'Windows', '127.0.0.1', '2024-05-15 14:06:30', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (172, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-05-15 14:06:42', '2024-05-15 14:06:51', '9', 'Windows', '127.0.0.1', '2024-05-15 14:06:41', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (173, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-05-15 14:06:51', '2024-05-15 14:07:22', '30', 'Windows', '127.0.0.1', '2024-05-15 14:06:51', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (174, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-05-15 14:07:22', '2024-05-15 14:07:26', '3', 'Windows', '127.0.0.1', '2024-05-15 14:07:21', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (175, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-05-15 14:07:26', '2024-05-15 14:07:32', '6', 'Windows', '127.0.0.1', '2024-05-15 14:07:25', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (176, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-05-15 14:07:33', '2024-05-15 14:14:25', '411', 'Windows', '127.0.0.1', '2024-05-15 14:07:32', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (177, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 15:33:16', '2024-05-15 17:39:15', '7559', 'Macintosh', '127.0.0.1', '2024-05-15 15:33:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (178, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 17:40:17', '2024-05-16 10:23:42', '60205', 'Windows', '127.0.0.1', '2024-05-15 17:40:17', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (179, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-05-15 17:44:37', '2024-05-16 08:37:40', '53583', 'Windows', '127.0.0.1', '2024-05-15 17:44:37', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (180, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-05-16 08:38:40', '2024-05-16 08:59:34', '1253', 'Windows', '127.0.0.1', '2024-05-16 08:38:39', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (181, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-16 10:25:02', '2024-05-16 16:46:34', '22892', 'Windows', '127.0.0.1', '2024-05-16 10:25:01', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (182, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-16 16:46:47', '2024-05-16 17:19:12', '1944', 'Windows', '127.0.0.1', '2024-05-16 16:46:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (183, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:54:51', '2024-05-22 14:09:44', '188092', 'Windows', '127.0.0.1', '2024-05-20 09:54:51', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (184, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 11:31:33', '2024-05-22 14:09:44', '182290', 'Macintosh', '127.0.0.1', '2024-05-20 11:31:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (185, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 15:31:39', '2024-05-22 14:09:44', '167884', 'Windows', '127.0.0.1', '2024-05-20 15:31:38', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (186, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-21 16:48:20', '2024-05-22 14:09:44', '76883', 'Macintosh', '127.0.0.1', '2024-05-21 16:48:19', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (187, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-21 17:58:52', '2024-05-22 14:09:44', '72651', 'Windows', '127.0.0.1', '2024-05-21 17:58:52', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (188, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-22 14:22:16', '2024-05-22 14:52:26', '1809', 'Windows', '127.0.0.1', '2024-05-22 14:22:15', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (189, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-22 15:01:40', '2024-05-23 09:31:23', '66583', 'Windows', '127.0.0.1', '2024-05-22 15:01:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (190, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:41:20', '2024-05-28 16:54:46', '805', 'Windows', '127.0.0.1', '2024-05-28 16:41:20', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (191, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:48:16', '2024-05-28 16:54:46', '389', 'Windows', '127.0.0.1', '2024-05-28 16:48:15', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (192, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-05-28 16:48:36', '2024-05-28 16:48:41', '4', 'Windows', '127.0.0.1', '2024-05-28 16:48:35', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (193, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-05-28 16:48:41', '2024-05-28 16:54:46', '364', 'Windows', '127.0.0.1', '2024-05-28 16:48:40', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (194, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-05-28 16:54:53', '2024-05-28 16:55:09', '15', 'Windows', '127.0.0.1', '2024-05-28 16:54:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (195, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:55:11', '2024-05-28 16:55:56', '45', 'Windows', '127.0.0.1', '2024-05-28 16:55:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (196, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-05-28 16:55:31', '2024-05-28 16:55:31', '0', 'Windows', '127.0.0.1', '2024-05-28 16:55:30', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (197, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-05-28 16:55:31', '2024-05-28 16:55:56', '25', 'Windows', '127.0.0.1', '2024-05-28 16:55:31', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (198, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:56:01', '2024-05-29 15:18:44', '80562', 'Windows', '127.0.0.1', '2024-05-28 16:56:00', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (199, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-05-28 16:56:31', '2024-05-28 16:56:39', '7', 'Windows', '127.0.0.1', '2024-05-28 16:56:30', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (200, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-05-28 16:56:39', '2024-05-28 16:56:56', '17', 'Windows', '127.0.0.1', '2024-05-28 16:56:38', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (201, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-05-28 16:56:56', '2024-05-28 16:57:46', '50', 'Windows', '127.0.0.1', '2024-05-28 16:56:56', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (202, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-29 15:18:47', '2024-05-31 10:20:24', '154896', 'Windows', '127.0.0.1', '2024-05-29 15:18:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (203, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-31 08:24:45', '2024-05-31 10:20:24', '6938', 'Windows', '127.0.0.1', '2024-05-31 08:24:45', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (204, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-31 08:27:33', '2024-05-31 10:20:24', '6770', 'Windows', '127.0.0.1', '2024-05-31 08:27:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (205, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-31 18:57:05', '2024-06-05 09:09:23', '396737', 'Windows', '127.0.0.1', '2024-05-31 18:57:04', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (206, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-05 10:14:30', '2024-06-18 10:55:14', '1125644', 'Windows', '127.0.0.1', '2024-06-05 10:14:30', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (207, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-06-18 10:16:53', '2024-06-18 10:20:26', '212', 'Windows', '127.0.0.1', '2024-06-18 10:16:53', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (208, 'Np5Av8Wm8Hr4Sq8Fh7Vz', 'developer', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-06-18 10:20:26', '2024-06-18 10:20:34', '8', 'Macintosh', '127.0.0.1', '2024-06-18 10:20:26', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (209, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-18 10:20:40', '2024-06-18 10:55:14', '2074', 'Macintosh', '127.0.0.1', '2024-06-18 10:20:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (210, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-06-18 10:20:45', '2024-06-18 10:20:59', '13', 'Macintosh', '127.0.0.1', '2024-06-18 10:20:45', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (211, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-06-18 10:20:59', '2024-06-18 10:22:09', '70', 'Macintosh', '127.0.0.1', '2024-06-18 10:20:59', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (212, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-06-18 10:22:10', '2024-06-18 10:22:39', '28', 'Macintosh', '127.0.0.1', '2024-06-18 10:22:09', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (213, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-06-18 10:22:39', '2024-06-18 10:22:42', '2', 'Macintosh', '127.0.0.1', '2024-06-18 10:22:39', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (214, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-06-18 10:22:42', '2024-06-18 10:22:47', '4', 'Macintosh', '127.0.0.1', '2024-06-18 10:22:41', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (215, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-06-18 10:22:47', '2024-06-18 10:23:20', '32', 'Macintosh', '127.0.0.1', '2024-06-18 10:22:46', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (216, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-06-18 10:23:20', '2024-06-18 10:23:25', '4', 'Macintosh', '127.0.0.1', '2024-06-18 10:23:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (217, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-06-18 10:23:25', '2024-06-18 10:24:09', '44', 'Macintosh', '127.0.0.1', '2024-06-18 10:23:24', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (218, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-18 10:24:30', '2024-06-18 10:55:14', '1844', 'Macintosh', '127.0.0.1', '2024-06-18 10:24:29', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (219, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-06-18 10:55:00', '2024-06-18 10:55:14', '14', 'Windows', '127.0.0.1', '2024-06-18 10:55:00', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (220, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-18 10:55:21', '2024-06-19 14:57:23', '100922', 'Windows', '127.0.0.1', '2024-06-18 10:55:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (221, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-19 15:26:48', '2024-06-28 18:34:23', '788855', 'Macintosh', '127.0.0.1', '2024-06-19 15:26:48', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (222, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-20 16:25:33', '2024-06-28 18:34:23', '698930', 'Windows', '127.0.0.1', '2024-06-20 16:25:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (223, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-24 09:56:40', '2024-06-28 18:34:23', '376663', 'Windows', '192.168.1.200', '2024-06-24 09:56:40', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (224, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-26 14:34:53', '2024-06-28 18:34:23', '187170', 'Windows', '192.168.1.200', '2024-06-26 14:34:52', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (225, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 10:29:11', '2024-06-28 18:34:23', '115512', 'Windows', '192.168.1.200', '2024-06-27 10:29:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (226, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 10:29:11', '2024-06-28 18:34:23', '115512', 'Windows', '192.168.1.200', '2024-06-27 10:29:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (227, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 10:29:11', '2024-06-28 18:34:23', '115512', 'Windows', '127.0.0.1', '2024-06-27 10:29:12', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (228, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 10:30:32', '2024-06-28 18:34:23', '115431', 'Windows', '127.0.0.1', '2024-06-27 10:30:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (229, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 10:30:34', '2024-06-28 18:34:23', '115429', 'Windows', '192.168.1.200', '2024-06-27 10:30:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (230, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 14:13:32', '2024-06-28 18:34:23', '102051', 'Macintosh', '127.0.0.1', '2024-06-27 14:13:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (231, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-28 10:38:02', '2024-06-28 18:34:23', '28581', 'Windows', '192.168.1.200', '2024-06-28 10:38:01', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (232, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-06-28 10:45:46', '2024-06-28 10:49:53', '246', 'Windows', '127.0.0.1', '2024-06-28 10:45:46', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (233, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-06-28 14:13:49', '2024-06-28 14:13:49', '0', 'Windows', '127.0.0.1', '2024-06-28 14:13:48', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (234, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-06-28 14:13:49', '2024-06-28 14:23:14', '564', 'Windows', '127.0.0.1', '2024-06-28 14:13:49', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (235, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-29 13:15:13', '2024-06-29 13:40:39', '1526', 'Windows', '192.168.1.200', '2024-06-29 13:15:13', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (236, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-29 13:40:48', '2024-07-02 17:06:59', '271571', 'Windows', '192.168.1.200', '2024-06-29 13:40:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (237, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-01 09:44:49', '2024-07-02 17:06:59', '112930', 'Windows', '192.168.1.200', '2024-07-01 09:44:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (238, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-01 14:02:18', '2024-07-02 17:06:59', '97481', 'Windows', '127.0.0.1', '2024-07-01 14:02:17', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (239, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-02 17:06:19', '2024-07-02 17:06:59', '40', 'Macintosh', '127.0.0.1', '2024-07-02 17:06:19', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (240, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-02 17:07:03', '2024-07-03 21:01:15', '100452', 'Macintosh', '127.0.0.1', '2024-07-02 17:07:02', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (241, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-03 17:23:14', '2024-07-03 21:01:15', '13081', 'Macintosh', '127.0.0.1', '2024-07-03 17:23:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (242, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-04 09:52:02', '2024-07-04 18:38:28', '31586', 'Macintosh', '127.0.0.1', '2024-07-04 09:52:01', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (243, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-05 09:12:41', '2024-07-05 14:37:44', '19502', 'Windows', '127.0.0.1', '2024-07-05 09:12:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (244, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-05 14:43:49', '2024-07-05 15:43:01', '3552', 'Macintosh', '127.0.0.1', '2024-07-05 14:43:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (245, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-05 15:02:33', '2024-07-05 15:43:01', '2428', 'Windows', '127.0.0.1', '2024-07-05 15:02:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (246, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-05 15:43:09', '2024-07-09 09:53:17', '324607', 'Windows', '127.0.0.1', '2024-07-05 15:43:09', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (247, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-07-05 16:59:24', '2024-07-08 09:08:52', '230967', 'Windows', '127.0.0.1', '2024-07-05 16:59:24', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (248, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-08 14:06:37', '2024-07-09 09:53:17', '71199', 'Windows', '127.0.0.1', '2024-07-08 14:06:36', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (249, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-09 09:53:32', '2024-07-10 16:29:28', '110156', 'Windows', '192.168.1.200', '2024-07-09 09:53:31', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (250, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-09 10:46:51', '2024-07-10 16:29:28', '106957', 'Macintosh', '127.0.0.1', '2024-07-09 10:46:51', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (251, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-09 17:34:11', '2024-07-09 17:38:04', '233', 'Windows', '127.0.0.1', '2024-07-09 17:34:11', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (252, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 10:23:29', '2024-07-10 16:29:28', '21959', 'Macintosh', '127.0.0.1', '2024-07-10 10:23:29', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (253, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-07-10 16:23:10', '2024-07-10 16:29:09', '359', 'Windows', '127.0.0.1', '2024-07-10 16:23:09', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (254, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-10 16:29:09', '2024-07-10 16:29:28', '19', 'Windows', '127.0.0.1', '2024-07-10 16:29:09', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (255, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:29:30', '2024-07-10 16:42:36', '785', 'Windows', '192.168.1.200', '2024-07-10 16:29:30', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (256, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-07-10 16:30:19', '2024-07-10 16:30:20', '1', 'Windows', '127.0.0.1', '2024-07-10 16:30:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (257, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-07-10 16:30:20', '2024-07-10 16:39:17', '537', 'Windows', '127.0.0.1', '2024-07-10 16:30:20', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (258, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-07-10 16:39:17', '2024-07-10 16:39:19', '2', 'Windows', '127.0.0.1', '2024-07-10 16:39:17', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (259, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-10 16:39:19', '2024-07-10 16:42:36', '196', 'Windows', '127.0.0.1', '2024-07-10 16:39:19', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (260, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:42:38', '2024-07-16 18:05:12', '523354', 'Windows', '192.168.1.200', '2024-07-10 16:42:38', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (261, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-07-10 17:02:09', '2024-07-10 17:02:10', '0', 'Windows', '127.0.0.1', '2024-07-10 17:02:09', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (262, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-07-10 17:02:10', '2024-07-10 17:06:15', '244', 'Windows', '127.0.0.1', '2024-07-10 17:02:09', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (263, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-11 10:58:38', '2024-07-16 18:05:12', '457594', 'Windows', '127.0.0.1', '2024-07-11 10:58:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (264, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-11 11:06:49', '2024-07-16 18:05:12', '457103', 'Macintosh', '127.0.0.1', '2024-07-11 11:06:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (265, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-12 16:04:34', '2024-07-16 18:05:12', '352838', 'Macintosh', '127.0.0.1', '2024-07-12 16:04:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (266, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-07-15 17:55:00', '2024-07-15 18:13:24', '1103', 'Windows', '127.0.0.1', '2024-07-15 17:55:00', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (267, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 15:54:14', '2024-07-16 18:05:12', '7858', 'Macintosh', '127.0.0.1', '2024-07-16 15:54:13', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (268, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 15:54:14', '2024-07-16 18:05:12', '7858', 'Macintosh', '127.0.0.1', '2024-07-16 15:54:13', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (269, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 15:54:37', '2024-07-16 18:05:12', '7835', 'Windows', '192.168.1.200', '2024-07-16 15:54:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (270, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 16:13:31', '2024-07-16 18:05:12', '6701', 'Windows', '127.0.0.1', '2024-07-16 16:13:30', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (271, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 17:32:45', '2024-07-16 18:05:12', '1947', 'Macintosh', '127.0.0.1', '2024-07-16 17:32:45', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (272, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 09:29:37', '2024-07-19 10:47:44', '177486', 'Macintosh', '127.0.0.1', '2024-07-17 09:29:36', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (273, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 16:49:44', '2024-07-19 10:47:44', '151079', 'Macintosh', '127.0.0.1', '2024-07-17 16:49:43', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (274, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 17:48:14', '2024-07-19 10:47:44', '61169', 'Windows', '127.0.0.1', '2024-07-18 17:48:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (275, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 19:06:53', '2024-07-19 10:47:44', '56450', 'Windows', '192.168.1.200', '2024-07-18 19:06:53', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (276, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 20:35:26', '2024-07-19 10:47:44', '51137', 'Windows', '192.168.1.200', '2024-07-18 20:35:25', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (277, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-19 10:58:11', '2024-07-23 18:23:06', '372295', 'Macintosh', '127.0.0.1', '2024-07-19 10:58:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (278, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 09:46:15', '2024-07-23 18:23:06', '117411', 'Windows', '127.0.0.1', '2024-07-22 09:46:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (279, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 10:32:28', '2024-07-23 18:23:06', '114638', 'Macintosh', '127.0.0.1', '2024-07-22 10:32:27', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (280, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 15:45:16', '2024-07-23 18:23:06', '95870', 'Macintosh', '127.0.0.1', '2024-07-22 15:45:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (281, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 16:23:17', '2024-07-23 18:23:06', '93589', 'Windows', '127.0.0.1', '2024-07-22 16:23:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (282, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 16:32:39', '2024-07-23 18:23:06', '93027', 'Windows', '127.0.0.1', '2024-07-22 16:32:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (283, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 09:39:43', '2024-07-25 16:42:52', '111788', 'Macintosh', '127.0.0.1', '2024-07-24 09:39:42', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (284, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-07-25 14:46:00', '2024-07-25 15:23:27', '2247', 'Windows', '127.0.0.1', '2024-07-25 14:45:59', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (285, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 15:34:47', '2024-07-25 16:42:52', '4084', 'Windows', '192.168.1.200', '2024-07-25 15:34:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (286, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 16:00:09', '2024-07-25 16:42:52', '2562', 'Windows', '192.168.1.200', '2024-07-25 16:00:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (287, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 16:00:52', '2024-07-25 16:42:52', '2519', 'Windows', '192.168.1.200', '2024-07-25 16:00:52', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (288, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 16:42:30', '2024-07-25 16:42:52', '21', 'Macintosh', '127.0.0.1', '2024-07-25 16:42:29', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (289, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 16:43:09', '2024-07-25 17:40:30', '3440', 'Windows', '127.0.0.1', '2024-07-25 16:43:09', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (290, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-26 09:26:07', '2024-07-29 10:26:10', '262802', 'Macintosh', '127.0.0.1', '2024-07-26 09:26:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (291, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 10:26:16', '2024-07-29 14:52:32', '15975', 'Windows', '127.0.0.1', '2024-07-29 10:26:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (292, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 10:27:40', '2024-07-29 14:52:32', '15891', 'Macintosh', '127.0.0.1', '2024-07-29 10:27:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (293, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-07-29 10:36:44', '2024-07-29 10:37:06', '22', 'Macintosh', '127.0.0.1', '2024-07-29 10:36:43', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (294, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-29 10:37:06', '2024-07-29 10:37:15', '9', 'Macintosh', '127.0.0.1', '2024-07-29 10:37:06', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (295, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-07-29 10:37:15', '2024-07-29 13:58:54', '12099', 'Macintosh', '127.0.0.1', '2024-07-29 10:37:15', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (296, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 14:01:00', '2024-07-29 14:52:32', '3091', 'Windows', '127.0.0.1', '2024-07-29 14:00:59', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (297, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 14:52:50', '2024-07-29 16:14:20', '4889', 'Windows', '127.0.0.1', '2024-07-29 14:52:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (298, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 16:12:48', '2024-07-29 16:14:20', '91', 'Windows', '127.0.0.1', '2024-07-29 16:12:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (299, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 16:14:24', '2024-07-31 10:16:36', '151332', 'Windows', '127.0.0.1', '2024-07-29 16:14:24', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (300, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 18:08:33', '2024-07-31 10:16:36', '144483', 'Windows', '127.0.0.1', '2024-07-29 18:08:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (301, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-07-30 16:47:35', '2024-07-30 16:47:36', '0', 'Windows', '127.0.0.1', '2024-07-30 16:47:35', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (302, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-07-30 16:47:36', '2024-07-30 16:47:43', '6', 'Windows', '127.0.0.1', '2024-07-30 16:47:35', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (303, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 10:17:07', '2024-07-31 11:00:27', '2600', 'Windows', '127.0.0.1', '2024-07-31 10:17:07', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (304, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-07-31 10:17:15', '2024-07-31 10:17:15', '0', 'Windows', '127.0.0.1', '2024-07-31 10:17:15', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (305, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-07-31 10:17:15', '2024-07-31 10:17:48', '32', 'Windows', '127.0.0.1', '2024-07-31 10:17:15', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (306, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-07-31 10:17:48', '2024-07-31 10:17:49', '0', 'Windows', '127.0.0.1', '2024-07-31 10:17:47', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (307, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 10:17:49', '2024-07-31 10:18:20', '30', 'Windows', '127.0.0.1', '2024-07-31 10:17:49', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (308, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 10:18:23', '2024-07-31 11:00:27', '2524', 'Windows', '127.0.0.1', '2024-07-31 10:18:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (309, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 10:18:32', '2024-07-31 10:19:05', '32', 'Windows', '127.0.0.1', '2024-07-31 10:18:32', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (310, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-07-31 10:22:45', '2024-07-31 10:24:06', '81', 'Windows', '127.0.0.1', '2024-07-31 10:22:45', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (311, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-07-31 10:24:07', '2024-07-31 10:26:14', '126', 'Windows', '127.0.0.1', '2024-07-31 10:24:06', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (312, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:00:10', '2024-07-31 11:00:24', '13', 'Macintosh', '127.0.0.1', '2024-07-31 11:00:10', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (313, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:00:39', '2024-07-31 11:04:12', '212', 'Macintosh', '127.0.0.1', '2024-07-31 11:00:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (314, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-07-31 11:00:44', '2024-07-31 11:00:45', '1', 'Macintosh', '127.0.0.1', '2024-07-31 11:00:44', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (315, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:00:45', '2024-07-31 11:01:57', '71', 'Macintosh', '127.0.0.1', '2024-07-31 11:00:45', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (316, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:02:28', '2024-07-31 11:03:20', '51', 'Macintosh', '127.0.0.1', '2024-07-31 11:02:28', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (317, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:04:15', '2024-07-31 11:05:22', '66', 'Windows', '127.0.0.1', '2024-07-31 11:04:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (318, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-07-31 11:04:54', '2024-07-31 11:04:54', '0', 'Windows', '127.0.0.1', '2024-07-31 11:04:53', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (319, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-07-31 11:04:54', '2024-07-31 11:04:55', '1', 'Windows', '127.0.0.1', '2024-07-31 11:04:53', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (320, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-07-31 11:04:55', '2024-07-31 11:04:57', '1', 'Windows', '127.0.0.1', '2024-07-31 11:04:55', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (321, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:04:57', '2024-07-31 11:04:59', '2', 'Windows', '127.0.0.1', '2024-07-31 11:04:56', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (322, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-07-31 11:05:09', '2024-07-31 11:05:09', '0', 'Windows', '127.0.0.1', '2024-07-31 11:05:08', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (323, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-07-31 11:05:09', '2024-07-31 11:05:12', '2', 'Windows', '127.0.0.1', '2024-07-31 11:05:08', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (324, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:05:15', '2024-07-31 11:05:16', '1', 'Windows', '127.0.0.1', '2024-07-31 11:05:15', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (325, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-07-31 11:05:17', '2024-07-31 11:05:22', '4', 'Windows', '127.0.0.1', '2024-07-31 11:05:16', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (326, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:05:39', '2024-07-31 11:07:04', '84', 'Macintosh', '127.0.0.1', '2024-07-31 11:05:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (327, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:05:45', '2024-07-31 11:05:57', '11', 'Macintosh', '127.0.0.1', '2024-07-31 11:05:45', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (328, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:07:15', '2024-07-31 11:09:05', '110', 'Windows', '127.0.0.1', '2024-07-31 11:07:15', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (329, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-07-31 11:07:30', '2024-07-31 11:07:30', '0', 'Macintosh', '127.0.0.1', '2024-07-31 11:07:29', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (330, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:07:30', '2024-07-31 11:07:31', '0', 'Macintosh', '127.0.0.1', '2024-07-31 11:07:30', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (331, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-07-31 11:07:31', '2024-07-31 11:09:05', '94', 'Macintosh', '127.0.0.1', '2024-07-31 11:07:30', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (332, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:09:15', '2024-07-31 11:20:03', '648', 'Windows', '127.0.0.1', '2024-07-31 11:09:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (333, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-07-31 11:09:34', '2024-07-31 11:09:35', '1', 'Windows', '127.0.0.1', '2024-07-31 11:09:34', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (334, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:09:35', '2024-07-31 11:09:36', '0', 'Windows', '127.0.0.1', '2024-07-31 11:09:35', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (335, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-07-31 11:09:36', '2024-07-31 11:09:37', '0', 'Windows', '127.0.0.1', '2024-07-31 11:09:35', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (336, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-07-31 11:09:37', '2024-07-31 11:09:40', '2', 'Windows', '127.0.0.1', '2024-07-31 11:09:36', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (337, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:09:40', '2024-07-31 11:10:03', '23', 'Windows', '127.0.0.1', '2024-07-31 11:09:40', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (338, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-07-31 11:10:04', '2024-07-31 11:10:11', '6', 'Windows', '127.0.0.1', '2024-07-31 11:10:03', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (339, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-07-31 11:10:11', '2024-07-31 11:10:13', '2', 'Windows', '127.0.0.1', '2024-07-31 11:10:10', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (340, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-07-31 11:10:13', '2024-07-31 11:10:15', '2', 'Windows', '127.0.0.1', '2024-07-31 11:10:13', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (341, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-07-31 11:10:15', '2024-07-31 11:10:18', '3', 'Windows', '127.0.0.1', '2024-07-31 11:10:15', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (342, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:10:18', '2024-07-31 11:13:19', '181', 'Windows', '127.0.0.1', '2024-07-31 11:10:18', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (343, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:16:29', '2024-07-31 11:17:39', '69', 'Windows', '127.0.0.1', '2024-07-31 11:16:28', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (344, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-07-31 11:18:46', '2024-07-31 11:18:46', '0', 'Windows', '192.168.1.200', '2024-07-31 11:18:45', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (345, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-07-31 11:18:46', '2024-07-31 11:19:02', '15', 'Windows', '192.168.1.200', '2024-07-31 11:18:46', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (346, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-07-31 11:19:02', '2024-07-31 11:19:04', '2', 'Windows', '192.168.1.200', '2024-07-31 11:19:01', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (347, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:19:04', '2024-07-31 11:19:49', '44', 'Windows', '192.168.1.200', '2024-07-31 11:19:04', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (348, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:19:53', '2024-07-31 11:19:55', '2', 'Macintosh', '127.0.0.1', '2024-07-31 11:19:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (349, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-07-31 11:19:58', '2024-07-31 11:19:59', '1', 'Windows', '127.0.0.1', '2024-07-31 11:19:57', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (350, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:19:59', '2024-07-31 11:20:01', '2', 'Windows', '127.0.0.1', '2024-07-31 11:19:59', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (351, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:20:04', '2024-07-31 17:17:44', '21459', 'Macintosh', '127.0.0.1', '2024-07-31 11:20:03', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (352, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:20:10', '2024-07-31 11:20:11', '0', 'Macintosh', '127.0.0.1', '2024-07-31 11:20:10', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (353, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:20:11', '2024-07-31 17:17:44', '21452', 'Windows', '127.0.0.1', '2024-07-31 11:20:10', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (354, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:21:19', '2024-07-31 11:21:33', '13', 'Windows', '127.0.0.1', '2024-07-31 11:21:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (355, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:21:36', '2024-07-31 17:17:44', '21367', 'Macintosh', '127.0.0.1', '2024-07-31 11:21:35', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (356, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:21:41', '2024-07-31 11:22:08', '27', 'Macintosh', '127.0.0.1', '2024-07-31 11:21:41', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (357, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-07-31 11:22:11', '2024-07-31 15:50:30', '16098', 'Windows', '127.0.0.1', '2024-07-31 11:22:11', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (358, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 17:17:47', '2024-07-31 17:51:43', '2036', 'Windows', '192.168.1.200', '2024-07-31 17:17:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (359, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 17:50:02', '2024-07-31 17:51:43', '101', 'Macintosh', '127.0.0.1', '2024-07-31 17:50:01', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (360, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 17:52:33', '2024-07-31 18:04:08', '694', 'Windows', '127.0.0.1', '2024-07-31 17:52:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (361, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 17:52:45', '2024-07-31 18:04:08', '682', 'Windows', '192.168.1.200', '2024-07-31 17:52:44', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (362, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 18:07:26', '2024-07-31 18:18:30', '664', 'Windows', '127.0.0.1', '2024-07-31 18:07:25', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (363, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 18:23:56', '2024-08-01 09:45:58', '55321', 'Windows', '192.168.1.200', '2024-07-31 18:23:56', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (364, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 09:35:50', '2024-08-01 09:45:58', '607', 'Macintosh', '127.0.0.1', '2024-08-01 09:35:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (365, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 09:44:47', '2024-08-01 09:45:58', '70', 'Windows', '127.0.0.1', '2024-08-01 09:44:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (366, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 09:46:08', '2024-08-01 09:46:25', '17', 'Windows', '127.0.0.1', '2024-08-01 09:46:07', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (367, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 09:46:10', '2024-08-01 09:46:25', '15', 'Macintosh', '127.0.0.1', '2024-08-01 09:46:10', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (368, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 09:46:36', '2024-08-01 11:09:38', '4982', 'Macintosh', '127.0.0.1', '2024-08-01 09:46:36', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (369, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 11:03:53', '2024-08-01 11:09:38', '345', 'Windows', '127.0.0.1', '2024-08-01 11:03:52', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (370, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-01 11:06:58', '2024-08-01 11:08:47', '109', 'Windows', '127.0.0.1', '2024-08-01 11:06:58', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (371, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-01 11:08:54', '2024-08-01 11:09:38', '44', 'Macintosh', '127.0.0.1', '2024-08-01 11:08:53', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (372, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 11:09:46', '2024-08-01 15:43:27', '16420', 'Macintosh', '127.0.0.1', '2024-08-01 11:09:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (373, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-01 11:10:01', '2024-08-01 11:10:30', '29', 'Macintosh', '127.0.0.1', '2024-08-01 11:10:00', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (374, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-01 11:10:34', '2024-08-01 11:10:47', '12', 'Macintosh', '127.0.0.1', '2024-08-01 11:10:33', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (375, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 14:28:11', '2024-08-01 15:43:27', '4515', 'Windows', '127.0.0.1', '2024-08-01 14:28:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (376, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 14:31:18', '2024-08-01 15:43:27', '4328', 'Macintosh', '127.0.0.1', '2024-08-01 14:31:18', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (377, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-01 15:29:37', '2024-08-01 15:29:38', '1', 'Windows', '192.168.1.200', '2024-08-01 15:29:37', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (378, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-01 15:29:38', '2024-08-01 15:31:24', '105', 'Windows', '192.168.1.200', '2024-08-01 15:29:38', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (379, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-01 15:37:27', '2024-08-01 15:37:27', '0', 'Windows', '192.168.1.200', '2024-08-01 15:37:26', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (380, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-01 15:37:27', '2024-08-01 15:37:27', '0', 'Windows', '192.168.1.200', '2024-08-01 15:37:26', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (381, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-01 15:37:27', '2024-08-01 15:37:28', '0', 'Windows', '192.168.1.200', '2024-08-01 15:37:27', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (382, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-01 15:37:28', '2024-08-01 15:37:29', '1', 'Windows', '192.168.1.200', '2024-08-01 15:37:28', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (383, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 15:43:29', '2024-08-05 13:54:38', '339068', 'Windows', '192.168.1.200', '2024-08-01 15:43:29', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (384, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-02 09:18:59', '2024-08-05 13:54:38', '275738', 'Macintosh', '127.0.0.1', '2024-08-02 09:18:58', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (385, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-02 18:32:51', '2024-08-05 13:54:38', '242506', 'Windows', '127.0.0.1', '2024-08-02 18:32:50', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (386, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-05 13:48:55', '2024-08-05 13:54:38', '342', 'Macintosh', '127.0.0.1', '2024-08-05 13:48:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (387, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-05 13:54:40', '2024-08-05 16:31:07', '9386', 'Windows', '127.0.0.1', '2024-08-05 13:54:40', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (388, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-06 09:46:02', '2024-08-09 10:05:57', '260395', 'Macintosh', '127.0.0.1', '2024-08-06 09:46:02', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (389, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-06 09:50:33', '2024-08-09 10:05:57', '260124', 'Windows', '127.0.0.1', '2024-08-06 09:50:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (390, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-06 10:14:21', '2024-08-09 10:05:57', '258696', 'Windows', '192.168.1.200', '2024-08-06 10:14:20', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (391, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-06 14:51:00', '2024-08-09 10:05:57', '242097', 'Windows', '127.0.0.1', '2024-08-06 14:51:00', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (392, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-06 15:02:40', '2024-08-09 10:05:57', '241397', 'Macintosh', '127.0.0.1', '2024-08-06 15:02:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (393, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-07 17:19:23', '2024-08-09 10:05:57', '146794', 'Macintosh', '127.0.0.1', '2024-08-07 17:19:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (394, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-08 17:14:08', '2024-08-09 10:05:57', '60709', 'Windows', '127.0.0.1', '2024-08-08 17:14:07', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (395, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-09 10:18:09', '2024-08-13 14:39:39', '361290', 'Windows', '127.0.0.1', '2024-08-09 10:18:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (396, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-09 10:25:14', '2024-08-13 14:39:39', '360865', 'Macintosh', '127.0.0.1', '2024-08-09 10:25:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (397, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 10:11:33', '2024-08-13 14:39:39', '102486', 'Macintosh', '127.0.0.1', '2024-08-12 10:11:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (398, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 10:46:57', '2024-08-13 14:39:39', '100362', 'Macintosh', '127.0.0.1', '2024-08-12 10:46:56', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (399, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 14:26:04', '2024-08-13 14:39:39', '87215', 'Windows', '127.0.0.1', '2024-08-12 14:26:04', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (400, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 16:33:47', '2024-08-13 14:39:39', '79552', 'Macintosh', '127.0.0.1', '2024-08-12 16:33:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (401, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 16:41:29', '2024-08-13 14:39:39', '79090', 'Windows', '127.0.0.1', '2024-08-12 16:41:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (402, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 14:21:35', '2024-08-13 14:39:39', '1084', 'Windows', '192.168.1.200', '2024-08-13 14:21:34', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (403, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 14:39:42', '2024-08-13 15:03:43', '1441', 'Windows', '192.168.1.200', '2024-08-13 14:39:42', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (404, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 15:04:47', '2024-08-13 17:05:29', '7241', 'Windows', '192.168.1.200', '2024-08-13 15:04:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (405, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 16:31:26', '2024-08-13 17:05:29', '2042', 'Windows', '192.168.1.200', '2024-08-13 16:31:25', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (406, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 17:19:42', '2024-08-14 09:28:29', '58127', 'Windows', '192.168.1.200', '2024-08-13 17:19:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (407, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-14 09:57:32', '2024-08-14 17:59:10', '28898', 'Windows', '192.168.1.200', '2024-08-14 09:57:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (408, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-14 10:46:23', '2024-08-14 17:59:10', '25967', 'Windows', '192.168.1.200', '2024-08-14 10:46:23', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (409, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-14 17:59:14', '2024-08-14 18:02:34', '200', 'Windows', '127.0.0.1', '2024-08-14 17:59:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (410, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-14 18:02:39', '2024-08-14 18:05:44', '185', 'Windows', '127.0.0.1', '2024-08-14 18:02:38', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (411, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-14 18:05:59', '2024-08-14 18:11:06', '307', 'Windows', '127.0.0.1', '2024-08-14 18:05:59', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (412, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-15 09:16:48', '2024-08-16 09:33:11', '87382', 'Windows', '127.0.0.1', '2024-08-15 09:16:48', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (413, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-15 09:35:52', '2024-08-16 09:33:11', '86238', 'Windows', '192.168.1.200', '2024-08-15 09:35:51', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (414, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-15 10:26:05', '2024-08-16 09:33:11', '83225', 'Macintosh', '127.0.0.1', '2024-08-15 10:26:04', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (415, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-15 13:51:46', '2024-08-16 09:33:11', '70884', 'Windows', '127.0.0.1', '2024-08-15 13:51:45', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (416, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-15 14:08:26', '2024-08-16 09:33:11', '69884', 'Macintosh', '127.0.0.1', '2024-08-15 14:08:25', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (417, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-08-16 09:32:57', '2024-08-16 09:33:11', '13', 'Windows', '127.0.0.1', '2024-08-16 09:32:57', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (418, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 09:33:15', '2024-08-16 09:40:09', '414', 'Windows', '192.168.1.200', '2024-08-16 09:33:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (419, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-16 09:35:24', '2024-08-16 09:35:39', '14', 'Windows', '127.0.0.1', '2024-08-16 09:35:24', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (420, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-16 09:35:39', '2024-08-16 09:35:41', '1', 'Windows', '127.0.0.1', '2024-08-16 09:35:38', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (421, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-16 09:35:41', '2024-08-16 09:35:42', '1', 'Windows', '127.0.0.1', '2024-08-16 09:35:40', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (422, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-08-16 09:35:42', '2024-08-16 09:35:44', '1', 'Windows', '127.0.0.1', '2024-08-16 09:35:42', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (423, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-16 09:35:44', '2024-08-16 09:35:45', '0', 'Windows', '127.0.0.1', '2024-08-16 09:35:43', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (424, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-16 09:35:45', '2024-08-16 09:35:58', '13', 'Windows', '127.0.0.1', '2024-08-16 09:35:44', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (425, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-16 09:36:10', '2024-08-16 09:36:11', '1', 'Windows', '127.0.0.1', '2024-08-16 09:36:10', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (426, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-08-16 09:36:11', '2024-08-16 09:36:19', '8', 'Windows', '127.0.0.1', '2024-08-16 09:36:11', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (427, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-08-16 09:36:19', '2024-08-16 09:36:21', '1', 'Windows', '127.0.0.1', '2024-08-16 09:36:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (428, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-16 09:36:21', '2024-08-16 09:38:30', '128', 'Windows', '127.0.0.1', '2024-08-16 09:36:20', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (429, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-08-16 09:39:20', '2024-08-16 09:39:59', '38', 'Windows', '127.0.0.1', '2024-08-16 09:39:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (430, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 09:40:11', '2024-08-16 09:40:55', '43', 'Windows', '192.168.1.200', '2024-08-16 09:40:10', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (431, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-16 09:40:26', '2024-08-16 09:40:55', '28', 'Windows', '127.0.0.1', '2024-08-16 09:40:25', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (432, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 09:41:16', '2024-08-16 14:13:31', '16334', 'Windows', '192.168.1.200', '2024-08-16 09:41:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (433, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 09:42:07', '2024-08-16 14:13:31', '16283', 'Windows', '127.0.0.1', '2024-08-16 09:42:07', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (434, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-08-16 09:42:54', '2024-08-16 09:42:56', '2', 'Windows', '127.0.0.1', '2024-08-16 09:42:53', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (435, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-16 09:42:56', '2024-08-16 09:43:02', '6', 'Windows', '127.0.0.1', '2024-08-16 09:42:56', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (436, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-16 09:43:03', '2024-08-16 09:43:04', '0', 'Windows', '127.0.0.1', '2024-08-16 09:43:02', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (437, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-16 09:43:04', '2024-08-16 09:43:35', '31', 'Windows', '127.0.0.1', '2024-08-16 09:43:03', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (438, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-08-16 09:43:35', '2024-08-16 09:44:06', '31', 'Windows', '127.0.0.1', '2024-08-16 09:43:35', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (439, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-08-16 09:44:06', '2024-08-16 09:44:07', '0', 'Windows', '127.0.0.1', '2024-08-16 09:44:06', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (440, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-16 09:44:07', '2024-08-16 09:44:09', '1', 'Windows', '127.0.0.1', '2024-08-16 09:44:06', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (441, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-16 09:44:09', '2024-08-16 09:44:21', '11', 'Windows', '127.0.0.1', '2024-08-16 09:44:08', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (442, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-16 09:44:21', '2024-08-16 09:45:44', '83', 'Windows', '127.0.0.1', '2024-08-16 09:44:20', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (443, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-16 14:04:27', '2024-08-16 14:04:32', '4', 'Windows', '127.0.0.1', '2024-08-16 14:04:27', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (444, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-16 14:04:32', '2024-08-16 14:05:38', '65', 'Windows', '127.0.0.1', '2024-08-16 14:04:32', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (445, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 14:14:17', '2024-08-16 14:15:33', '75', 'Windows', '192.168.1.200', '2024-08-16 14:14:17', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (446, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-16 14:14:25', '2024-08-16 14:14:26', '1', 'Windows', '127.0.0.1', '2024-08-16 14:14:24', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (447, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-08-16 14:14:26', '2024-08-16 14:14:45', '18', 'Windows', '127.0.0.1', '2024-08-16 14:14:26', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (448, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-16 14:14:45', '2024-08-16 14:15:33', '47', 'Windows', '127.0.0.1', '2024-08-16 14:14:44', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (449, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 14:15:36', '2024-08-19 16:08:07', '265950', 'Windows', '192.168.1.200', '2024-08-16 14:15:36', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (450, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 16:19:00', '2024-08-19 16:08:07', '258546', 'Windows', '192.168.1.200', '2024-08-16 16:19:00', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (451, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 16:19:31', '2024-08-19 16:08:07', '258515', 'Windows', '192.168.1.200', '2024-08-16 16:19:31', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (452, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:09:46', '2024-08-19 16:08:07', '17900', 'Windows', '192.168.1.200', '2024-08-19 11:09:45', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (453, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:09:58', '2024-08-19 16:08:07', '17888', 'Windows', '192.168.1.200', '2024-08-19 11:09:58', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (454, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:10:23', '2024-08-19 16:08:07', '17863', 'Windows', '192.168.1.200', '2024-08-19 11:10:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (455, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:10:55', '2024-08-19 16:08:07', '17831', 'Windows', '192.168.1.200', '2024-08-19 11:10:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (456, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:16:39', '2024-08-19 16:08:07', '17487', 'Windows', '192.168.1.200', '2024-08-19 11:16:38', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (457, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:33:48', '2024-08-19 16:08:07', '16458', 'Windows', '192.168.1.200', '2024-08-19 11:33:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (458, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 11:34:15', '2024-08-19 16:08:07', '16431', 'Windows', '192.168.1.200', '2024-08-19 11:34:15', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (459, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 16:13:12', '2024-08-19 16:39:43', '1590', 'Windows', '192.168.1.200', '2024-08-19 16:13:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (460, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 16:13:25', '2024-08-19 16:39:43', '1577', 'Windows', '192.168.1.200', '2024-08-19 16:13:24', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (461, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 16:40:01', '2024-08-19 16:42:41', '160', 'Windows', '192.168.1.200', '2024-08-19 16:40:01', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (462, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 16:44:30', '2024-08-20 09:42:36', '61086', 'Windows', '192.168.1.200', '2024-08-19 16:44:29', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (463, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-19 16:54:44', '2024-08-20 09:42:36', '60472', 'Windows', '192.168.1.200', '2024-08-19 16:54:44', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (464, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 09:46:26', '2024-08-20 09:46:47', '20', 'Windows', '192.168.1.200', '2024-08-20 09:46:25', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (465, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 09:46:59', '2024-08-20 14:02:13', '15314', 'Windows', '192.168.1.200', '2024-08-20 09:46:59', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (466, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 14:02:18', '2024-08-20 16:01:16', '7138', 'Windows', '192.168.1.200', '2024-08-20 14:02:18', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (467, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 14:09:56', '2024-08-20 16:01:16', '6680', 'Windows', '192.168.1.200', '2024-08-20 14:09:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (468, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 15:14:23', '2024-08-20 16:01:16', '2813', 'Windows', '192.168.1.200', '2024-08-20 15:14:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (469, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 15:39:29', '2024-08-20 16:01:16', '1307', 'Windows', '192.168.1.200', '2024-08-20 15:39:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (470, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 15:47:45', '2024-08-20 16:01:16', '811', 'Windows', '192.168.1.200', '2024-08-20 15:47:44', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (471, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 15:53:43', '2024-08-20 16:01:16', '453', 'Windows', '192.168.1.200', '2024-08-20 15:53:42', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (472, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 16:01:00', '2024-08-20 16:01:16', '16', 'Windows', '192.168.1.200', '2024-08-20 16:01:00', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (473, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 16:01:20', '2024-08-21 16:19:57', '87517', 'Windows', '192.168.1.200', '2024-08-20 16:01:19', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (474, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 16:01:35', '2024-08-21 16:19:57', '87502', 'Windows', '192.168.1.200', '2024-08-20 16:01:35', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (475, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 09:54:54', '2024-08-21 16:19:57', '23103', 'Windows', '192.168.1.200', '2024-08-21 09:54:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (476, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 09:55:10', '2024-08-21 16:19:57', '23087', 'Windows', '192.168.1.200', '2024-08-21 09:55:09', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (477, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 10:24:09', '2024-08-21 16:19:57', '21348', 'Windows', '192.168.1.200', '2024-08-21 10:24:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (478, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 10:24:29', '2024-08-21 16:19:57', '21328', 'Windows', '192.168.1.200', '2024-08-21 10:24:29', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (479, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 11:07:50', '2024-08-21 16:19:57', '18727', 'Windows', '192.168.1.200', '2024-08-21 11:07:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (480, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:17:20', '2024-08-21 16:19:57', '157', 'Windows', '192.168.1.200', '2024-08-21 16:17:20', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (481, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:17:46', '2024-08-21 16:19:57', '131', 'Windows', '192.168.1.200', '2024-08-21 16:17:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (482, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:18:01', '2024-08-21 16:19:57', '116', 'Windows', '192.168.1.200', '2024-08-21 16:18:00', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (483, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:20:09', '2024-08-23 09:34:03', '148433', 'Windows', '192.168.1.200', '2024-08-21 16:20:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (484, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:20:09', '2024-08-23 09:34:03', '148433', 'Windows', '192.168.1.200', '2024-08-21 16:20:09', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (485, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:20:25', '2024-08-23 09:34:03', '148417', 'Windows', '192.168.1.200', '2024-08-21 16:20:24', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (486, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:31:38', '2024-08-23 09:34:03', '147744', 'Windows', '192.168.1.200', '2024-08-21 16:31:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (487, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:38:08', '2024-08-23 09:34:03', '147354', 'Windows', '192.168.1.200', '2024-08-21 16:38:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (488, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 16:42:34', '2024-08-23 09:34:03', '147088', 'Windows', '192.168.1.200', '2024-08-21 16:42:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (489, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 09:30:20', '2024-08-23 09:34:03', '86622', 'Windows', '192.168.1.200', '2024-08-22 09:30:20', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (490, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 13:57:59', '2024-08-23 09:34:03', '70563', 'Windows', '192.168.1.200', '2024-08-22 13:57:59', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (491, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 14:31:57', '2024-08-23 09:34:03', '68525', 'Windows', '192.168.1.200', '2024-08-22 14:31:56', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (492, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 16:27:04', '2024-08-23 09:34:03', '61618', 'Windows', '192.168.1.200', '2024-08-22 16:27:03', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (493, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-23 09:34:06', '2024-08-26 10:55:35', '264088', 'Windows', '192.168.1.200', '2024-08-23 09:34:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (494, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-23 16:52:23', '2024-08-26 10:55:35', '237791', 'Windows', '192.168.1.200', '2024-08-23 16:52:23', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (495, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 10:55:38', '2024-08-26 10:56:14', '35', 'Windows', '127.0.0.1', '2024-08-26 10:55:38', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (496, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 10:56:21', '2024-08-26 11:03:37', '436', 'Windows', '192.168.1.200', '2024-08-26 10:56:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (497, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 11:03:41', '2024-08-26 11:07:14', '212', 'Windows', '127.0.0.1', '2024-08-26 11:03:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (498, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 11:07:26', '2024-08-26 11:14:32', '426', 'Windows', '127.0.0.1', '2024-08-26 11:07:25', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (499, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 11:14:51', '2024-08-26 16:06:32', '17500', 'Windows', '192.168.1.200', '2024-08-26 11:14:50', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (500, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 11:28:44', '2024-08-26 16:06:32', '16667', 'Windows', '127.0.0.1', '2024-08-26 11:28:43', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (501, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 11:30:17', '2024-08-26 16:06:32', '16574', 'Windows', '192.168.1.200', '2024-08-26 11:30:17', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (502, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 14:00:47', '2024-08-26 16:06:32', '7544', 'Windows', '192.168.1.200', '2024-08-26 14:00:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (503, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-26 14:44:26', '2024-08-26 14:44:27', '1', 'Windows', '127.0.0.1', '2024-08-26 14:44:26', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (504, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-26 14:44:27', '2024-08-26 14:44:40', '12', 'Windows', '127.0.0.1', '2024-08-26 14:44:27', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (505, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-26 14:44:40', '2024-08-26 14:44:41', '0', 'Windows', '127.0.0.1', '2024-08-26 14:44:39', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (506, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-08-26 14:44:41', '2024-08-26 14:44:43', '2', 'Windows', '127.0.0.1', '2024-08-26 14:44:40', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (507, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-26 14:44:43', '2024-08-26 14:49:20', '276', 'Windows', '127.0.0.1', '2024-08-26 14:44:43', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (508, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-08-26 14:49:20', '2024-08-26 14:49:21', '0', 'Windows', '127.0.0.1', '2024-08-26 14:49:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (509, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-26 14:49:21', '2024-08-26 14:49:22', '0', 'Windows', '127.0.0.1', '2024-08-26 14:49:20', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (510, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-26 14:49:22', '2024-08-26 14:49:23', '0', 'Windows', '127.0.0.1', '2024-08-26 14:49:21', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (511, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-26 14:49:23', '2024-08-26 14:49:33', '9', 'Windows', '127.0.0.1', '2024-08-26 14:49:22', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (512, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-26 14:49:33', '2024-08-26 15:01:53', '740', 'Windows', '127.0.0.1', '2024-08-26 14:49:32', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (513, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-26 15:01:53', '2024-08-26 15:04:02', '128', 'Windows', '127.0.0.1', '2024-08-26 15:01:53', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (514, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-26 15:04:04', '2024-08-26 15:04:32', '28', 'Windows', '127.0.0.1', '2024-08-26 15:04:04', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (515, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-26 15:04:32', '2024-08-26 15:04:38', '6', 'Windows', '127.0.0.1', '2024-08-26 15:04:32', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (516, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-08-26 15:04:38', '2024-08-26 15:04:39', '1', 'Windows', '127.0.0.1', '2024-08-26 15:04:38', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (517, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-26 15:04:39', '2024-08-26 15:04:40', '1', 'Windows', '127.0.0.1', '2024-08-26 15:04:39', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (518, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-26 15:04:40', '2024-08-26 15:04:44', '4', 'Windows', '127.0.0.1', '2024-08-26 15:04:40', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (519, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-26 15:04:44', '2024-08-26 15:04:46', '2', 'Windows', '127.0.0.1', '2024-08-26 15:04:44', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (520, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'announcement', '4000', '业务中台', '400003', '消息中心', '40000301', '通知公告', '2024-08-26 15:04:46', '2024-08-26 15:04:47', '1', 'Windows', '127.0.0.1', '2024-08-26 15:04:46', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (521, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-26 15:04:47', '2024-08-26 15:04:48', '1', 'Windows', '127.0.0.1', '2024-08-26 15:04:47', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (522, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-26 15:04:48', '2024-08-26 15:04:55', '7', 'Windows', '127.0.0.1', '2024-08-26 15:04:48', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (523, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-26 15:04:55', '2024-08-26 15:04:58', '2', 'Windows', '127.0.0.1', '2024-08-26 15:04:55', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (524, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'announcement', '4000', '业务中台', '400003', '消息中心', '40000301', '通知公告', '2024-08-26 15:04:58', '2024-08-26 15:05:00', '2', 'Windows', '127.0.0.1', '2024-08-26 15:04:57', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (525, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-26 15:05:00', '2024-08-26 15:05:08', '7', 'Windows', '127.0.0.1', '2024-08-26 15:05:00', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (526, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-08-26 15:05:08', '2024-08-26 15:05:11', '3', 'Windows', '127.0.0.1', '2024-08-26 15:05:07', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (527, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-26 15:05:11', '2024-08-26 15:18:12', '780', 'Windows', '127.0.0.1', '2024-08-26 15:05:11', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (528, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-26 15:18:12', '2024-08-26 15:18:35', '22', 'Windows', '127.0.0.1', '2024-08-26 15:18:11', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (529, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-26 15:18:35', '2024-08-26 15:18:41', '6', 'Windows', '127.0.0.1', '2024-08-26 15:18:34', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (530, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-26 15:19:42', '2024-08-26 15:19:44', '1', 'Windows', '127.0.0.1', '2024-08-26 15:19:42', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (531, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-26 15:19:44', '2024-08-26 15:30:53', '669', 'Windows', '127.0.0.1', '2024-08-26 15:19:43', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (532, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-26 15:30:56', '2024-08-26 15:33:18', '142', 'Windows', '127.0.0.1', '2024-08-26 15:30:55', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (533, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 16:06:34', '2024-08-26 17:41:05', '5670', 'Windows', '192.168.1.200', '2024-08-26 16:06:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (534, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 16:06:56', '2024-08-26 17:41:05', '5648', 'Windows', '192.168.1.200', '2024-08-26 16:06:56', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (535, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 16:07:30', '2024-08-26 17:41:05', '5614', 'Windows', '192.168.1.200', '2024-08-26 16:07:30', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (536, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 16:12:08', '2024-08-26 17:41:05', '5336', 'Windows', '192.168.1.200', '2024-08-26 16:12:07', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (537, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 16:12:44', '2024-08-26 17:41:05', '5300', 'Windows', '192.168.1.200', '2024-08-26 16:12:44', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (538, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 17:12:54', '2024-08-26 17:41:05', '1690', 'Windows', '127.0.0.1', '2024-08-26 17:12:53', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (539, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 17:41:20', '2024-08-26 17:42:08', '48', 'Windows', '127.0.0.1', '2024-08-26 17:41:20', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (540, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 17:42:36', '2024-08-26 18:03:05', '1229', 'Windows', '127.0.0.1', '2024-08-26 17:42:36', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (541, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 17:59:43', '2024-08-26 18:03:05', '202', 'Windows', '127.0.0.1', '2024-08-26 17:59:43', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (542, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-26 18:00:53', '2024-08-26 18:00:56', '2', 'Windows', '127.0.0.1', '2024-08-26 18:00:53', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (543, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-26 18:00:56', '2024-08-26 18:03:05', '129', 'Windows', '127.0.0.1', '2024-08-26 18:00:55', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (544, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-26 19:01:29', '2024-08-29 10:44:25', '229375', 'Windows', '127.0.0.1', '2024-08-26 19:01:29', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (545, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-26 19:17:27', '2024-08-26 19:17:29', '2', 'Windows', '127.0.0.1', '2024-08-26 19:17:27', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (546, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-27 16:43:11', '2024-08-29 10:44:25', '151273', 'Windows', '192.168.1.200', '2024-08-27 16:43:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (547, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-28 09:28:56', '2024-08-29 10:44:25', '90928', 'Macintosh', '127.0.0.1', '2024-08-28 09:28:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (548, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-28 10:56:04', '2024-08-29 10:44:25', '85700', 'Windows', '192.168.1.200', '2024-08-28 10:56:03', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (549, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'announcement', '4000', '业务中台', '400003', '消息中心', '40000301', '通知公告', '2024-08-28 11:24:56', '2024-08-28 11:24:57', '1', 'Windows', '127.0.0.1', '2024-08-28 11:24:56', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (550, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-28 11:24:57', '2024-08-28 11:24:58', '0', 'Windows', '127.0.0.1', '2024-08-28 11:24:57', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (551, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-28 11:24:58', '2024-08-28 11:25:57', '58', 'Windows', '127.0.0.1', '2024-08-28 11:24:58', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (552, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-28 11:25:57', '2024-08-28 11:25:59', '2', 'Windows', '127.0.0.1', '2024-08-28 11:25:56', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (553, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-28 11:26:13', '2024-08-28 11:26:17', '3', 'Windows', '127.0.0.1', '2024-08-28 11:26:13', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (554, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-28 11:26:17', '2024-08-28 11:26:22', '4', 'Windows', '127.0.0.1', '2024-08-28 11:26:16', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (555, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-28 11:26:33', '2024-08-28 11:32:27', '354', 'Windows', '127.0.0.1', '2024-08-28 11:26:33', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (556, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-08-28 13:40:03', '2024-08-28 13:40:05', '2', 'Windows', '127.0.0.1', '2024-08-28 13:40:03', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (557, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-28 13:40:05', '2024-08-28 15:43:59', '7434', 'Windows', '127.0.0.1', '2024-08-28 13:40:05', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (558, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-28 15:44:09', '2024-08-28 15:46:35', '145', 'Windows', '127.0.0.1', '2024-08-28 15:44:08', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (559, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-08-28 15:46:35', '2024-08-28 16:02:57', '981', 'Windows', '127.0.0.1', '2024-08-28 15:46:34', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (560, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-28 16:02:57', '2024-08-28 16:13:10', '612', 'Windows', '127.0.0.1', '2024-08-28 16:02:56', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (561, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-28 16:19:22', '2024-08-28 16:19:26', '4', 'Windows', '127.0.0.1', '2024-08-28 16:19:21', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (562, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-28 16:19:26', '2024-08-28 16:19:26', '0', 'Windows', '127.0.0.1', '2024-08-28 16:19:26', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (563, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-28 16:19:27', '2024-08-28 16:19:35', '8', 'Windows', '127.0.0.1', '2024-08-28 16:19:26', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (564, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-08-28 16:19:35', '2024-08-28 16:19:37', '1', 'Windows', '127.0.0.1', '2024-08-28 16:19:35', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (565, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-28 16:19:37', '2024-08-28 16:41:22', '1304', 'Windows', '127.0.0.1', '2024-08-28 16:19:36', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (566, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 09:17:20', '2024-08-29 09:17:21', '0', 'Windows', '127.0.0.1', '2024-08-29 09:17:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (567, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 09:17:21', '2024-08-29 09:19:12', '111', 'Windows', '127.0.0.1', '2024-08-29 09:17:20', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (568, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-08-29 09:19:12', '2024-08-29 09:19:14', '1', 'Windows', '127.0.0.1', '2024-08-29 09:19:12', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (569, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-29 09:19:14', '2024-08-29 09:19:30', '15', 'Windows', '127.0.0.1', '2024-08-29 09:19:13', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (570, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 09:19:30', '2024-08-29 09:20:03', '33', 'Windows', '127.0.0.1', '2024-08-29 09:19:29', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (571, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-29 09:20:03', '2024-08-29 09:42:26', '1343', 'Windows', '127.0.0.1', '2024-08-29 09:20:03', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (572, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-29 10:13:05', '2024-08-29 10:19:19', '374', 'Windows', '127.0.0.1', '2024-08-29 10:13:04', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (573, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 10:19:26', '2024-08-29 10:19:26', '0', 'Windows', '127.0.0.1', '2024-08-29 10:19:26', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (574, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 10:19:26', '2024-08-29 10:20:13', '46', 'Windows', '127.0.0.1', '2024-08-29 10:19:26', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (575, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'announcement', '4000', '业务中台', '400003', '消息中心', '40000301', '通知公告', '2024-08-29 10:20:13', '2024-08-29 10:20:13', '0', 'Windows', '127.0.0.1', '2024-08-29 10:20:12', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (576, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 10:20:13', '2024-08-29 10:22:45', '152', 'Windows', '127.0.0.1', '2024-08-29 10:20:13', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (577, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 10:22:45', '2024-08-29 10:22:45', '0', 'Windows', '127.0.0.1', '2024-08-29 10:22:45', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (578, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 10:22:45', '2024-08-29 10:33:14', '629', 'Windows', '127.0.0.1', '2024-08-29 10:22:45', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (579, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 10:33:14', '2024-08-29 10:33:16', '2', 'Windows', '127.0.0.1', '2024-08-29 10:33:14', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (580, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 10:33:16', '2024-08-29 10:33:18', '1', 'Windows', '127.0.0.1', '2024-08-29 10:33:16', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (581, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'announcement', '4000', '业务中台', '400003', '消息中心', '40000301', '通知公告', '2024-08-29 10:33:18', '2024-08-29 10:33:19', '1', 'Windows', '127.0.0.1', '2024-08-29 10:33:17', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (582, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 10:33:19', '2024-08-29 10:34:50', '91', 'Windows', '127.0.0.1', '2024-08-29 10:33:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (583, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 10:34:50', '2024-08-29 10:43:42', '531', 'Windows', '127.0.0.1', '2024-08-29 10:34:50', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (584, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 10:43:42', '2024-08-29 10:43:50', '8', 'Windows', '127.0.0.1', '2024-08-29 10:43:41', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (585, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:43:58', '2024-08-29 10:44:25', '26', 'Windows', '127.0.0.1', '2024-08-29 10:43:57', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (586, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 10:44:40', '2024-08-29 10:46:37', '116', 'Windows', '127.0.0.1', '2024-08-29 10:44:40', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (587, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-29 10:44:48', '2024-08-29 10:44:49', '0', 'Windows', '127.0.0.1', '2024-08-29 10:44:47', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (588, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:44:49', '2024-08-29 10:46:37', '107', 'Windows', '127.0.0.1', '2024-08-29 10:44:48', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (589, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 10:46:45', '2024-08-29 10:46:59', '13', 'Windows', '127.0.0.1', '2024-08-29 10:46:45', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (590, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 10:47:02', '2024-08-29 13:48:00', '10858', 'Windows', '127.0.0.1', '2024-08-29 10:47:01', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (591, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:47:07', '2024-08-29 10:47:35', '27', 'Windows', '127.0.0.1', '2024-08-29 10:47:07', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (592, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 10:47:35', '2024-08-29 10:47:39', '3', 'Windows', '127.0.0.1', '2024-08-29 10:47:34', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (593, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-08-29 10:47:39', '2024-08-29 10:47:41', '1', 'Windows', '127.0.0.1', '2024-08-29 10:47:38', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (594, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-08-29 10:47:41', '2024-08-29 10:47:41', '0', 'Windows', '127.0.0.1', '2024-08-29 10:47:40', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (595, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-29 10:47:41', '2024-08-29 10:47:43', '2', 'Windows', '127.0.0.1', '2024-08-29 10:47:41', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (596, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-29 10:47:43', '2024-08-29 10:47:45', '1', 'Windows', '127.0.0.1', '2024-08-29 10:47:43', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (597, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:47:45', '2024-08-29 10:48:03', '18', 'Windows', '127.0.0.1', '2024-08-29 10:47:44', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (598, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 10:48:03', '2024-08-29 10:48:13', '9', 'Windows', '127.0.0.1', '2024-08-29 10:48:03', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (599, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:48:13', '2024-08-29 10:48:21', '7', 'Windows', '127.0.0.1', '2024-08-29 10:48:12', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (600, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-29 10:48:21', '2024-08-29 10:48:23', '2', 'Windows', '127.0.0.1', '2024-08-29 10:48:21', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (601, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-29 10:48:23', '2024-08-29 10:48:30', '7', 'Windows', '127.0.0.1', '2024-08-29 10:48:23', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (602, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'announcement', '4000', '业务中台', '400003', '消息中心', '40000301', '通知公告', '2024-08-29 10:48:30', '2024-08-29 10:48:31', '1', 'Windows', '127.0.0.1', '2024-08-29 10:48:30', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (603, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 10:48:31', '2024-08-29 10:48:32', '0', 'Windows', '127.0.0.1', '2024-08-29 10:48:31', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (604, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 10:48:32', '2024-08-29 10:48:34', '2', 'Windows', '127.0.0.1', '2024-08-29 10:48:31', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (605, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:48:34', '2024-08-29 10:48:47', '12', 'Windows', '127.0.0.1', '2024-08-29 10:48:34', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (606, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-08-29 10:48:47', '2024-08-29 10:48:57', '10', 'Windows', '127.0.0.1', '2024-08-29 10:48:46', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (607, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 10:48:57', '2024-08-29 10:49:01', '4', 'Windows', '127.0.0.1', '2024-08-29 10:48:57', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (608, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:49:01', '2024-08-29 10:49:08', '6', 'Windows', '127.0.0.1', '2024-08-29 10:49:01', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (609, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 10:49:08', '2024-08-29 10:49:15', '7', 'Windows', '127.0.0.1', '2024-08-29 10:49:07', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (610, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:49:15', '2024-08-29 10:49:23', '7', 'Windows', '127.0.0.1', '2024-08-29 10:49:15', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (611, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 10:49:23', '2024-08-29 10:49:45', '22', 'Windows', '127.0.0.1', '2024-08-29 10:49:22', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (612, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:49:45', '2024-08-29 10:50:09', '23', 'Windows', '127.0.0.1', '2024-08-29 10:49:45', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (613, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 10:50:09', '2024-08-29 10:50:13', '3', 'Windows', '127.0.0.1', '2024-08-29 10:50:08', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (614, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-08-29 10:50:13', '2024-08-29 10:50:17', '3', 'Windows', '127.0.0.1', '2024-08-29 10:50:12', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (615, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-08-29 10:50:17', '2024-08-29 10:50:18', '1', 'Windows', '127.0.0.1', '2024-08-29 10:50:16', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (616, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-29 10:50:19', '2024-08-29 10:50:21', '1', 'Windows', '127.0.0.1', '2024-08-29 10:50:18', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (617, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-29 10:50:21', '2024-08-29 10:50:24', '3', 'Windows', '127.0.0.1', '2024-08-29 10:50:20', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (618, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:50:24', '2024-08-29 10:51:00', '35', 'Windows', '127.0.0.1', '2024-08-29 10:50:24', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (619, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:51:05', '2024-08-29 10:51:08', '2', 'Windows', '127.0.0.1', '2024-08-29 10:51:05', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (620, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 10:51:08', '2024-08-29 10:51:14', '5', 'Windows', '127.0.0.1', '2024-08-29 10:51:07', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (621, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:51:14', '2024-08-29 10:51:29', '14', 'Windows', '127.0.0.1', '2024-08-29 10:51:13', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (622, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-29 10:51:29', '2024-08-29 10:51:30', '1', 'Windows', '127.0.0.1', '2024-08-29 10:51:28', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (623, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-08-29 10:51:30', '2024-08-29 10:51:31', '0', 'Windows', '127.0.0.1', '2024-08-29 10:51:30', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (624, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-08-29 10:51:31', '2024-08-29 10:51:31', '0', 'Windows', '127.0.0.1', '2024-08-29 10:51:30', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (625, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 10:51:31', '2024-08-29 10:53:45', '134', 'Windows', '127.0.0.1', '2024-08-29 10:51:31', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (626, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:53:45', '2024-08-29 10:55:50', '124', 'Windows', '127.0.0.1', '2024-08-29 10:53:45', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (627, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 10:55:50', '2024-08-29 10:55:51', '1', 'Windows', '127.0.0.1', '2024-08-29 10:55:49', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (628, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:55:51', '2024-08-29 10:55:53', '1', 'Windows', '127.0.0.1', '2024-08-29 10:55:51', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (629, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 10:55:53', '2024-08-29 10:55:55', '1', 'Windows', '127.0.0.1', '2024-08-29 10:55:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (630, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:55:55', '2024-08-29 10:56:07', '11', 'Windows', '127.0.0.1', '2024-08-29 10:55:54', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (631, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-29 10:56:07', '2024-08-29 10:56:09', '2', 'Windows', '127.0.0.1', '2024-08-29 10:56:06', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (632, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-08-29 10:56:09', '2024-08-29 10:56:13', '3', 'Windows', '127.0.0.1', '2024-08-29 10:56:09', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (633, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-29 10:56:13', '2024-08-29 10:56:40', '26', 'Windows', '127.0.0.1', '2024-08-29 10:56:12', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (634, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-29 10:56:40', '2024-08-29 10:56:45', '4', 'Windows', '127.0.0.1', '2024-08-29 10:56:39', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (635, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-29 10:56:45', '2024-08-29 10:57:16', '30', 'Windows', '127.0.0.1', '2024-08-29 10:56:44', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (636, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:57:16', '2024-08-29 10:57:21', '4', 'Windows', '127.0.0.1', '2024-08-29 10:57:15', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (637, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 10:57:21', '2024-08-29 10:57:36', '15', 'Windows', '127.0.0.1', '2024-08-29 10:57:20', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (638, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 10:57:36', '2024-08-29 13:39:47', '9730', 'Windows', '127.0.0.1', '2024-08-29 10:57:36', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (639, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 13:39:47', '2024-08-29 13:46:36', '408', 'Windows', '127.0.0.1', '2024-08-29 13:39:46', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (640, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 13:46:38', '2024-08-29 13:46:46', '7', 'Macintosh', '127.0.0.1', '2024-08-29 13:46:38', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (641, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 13:46:46', '2024-08-29 13:47:05', '19', 'Macintosh', '127.0.0.1', '2024-08-29 13:46:45', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (642, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 13:47:05', '2024-08-29 13:47:23', '17', 'Macintosh', '127.0.0.1', '2024-08-29 13:47:05', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (643, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-29 13:47:23', '2024-08-29 13:47:45', '21', 'Macintosh', '127.0.0.1', '2024-08-29 13:47:22', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (644, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 13:47:45', '2024-08-29 13:47:52', '6', 'Macintosh', '127.0.0.1', '2024-08-29 13:47:44', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (645, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-29 13:47:52', '2024-08-29 13:48:00', '8', 'Macintosh', '127.0.0.1', '2024-08-29 13:47:51', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (646, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:48:07', '2024-08-29 13:48:16', '8', 'Macintosh', '127.0.0.1', '2024-08-29 13:48:07', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (647, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:48:18', '2024-08-29 13:50:47', '148', 'Macintosh', '127.0.0.1', '2024-08-29 13:48:18', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (648, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-29 13:48:23', '2024-08-29 13:48:27', '3', 'Macintosh', '127.0.0.1', '2024-08-29 13:48:22', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (649, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 13:48:27', '2024-08-29 13:48:48', '21', 'Macintosh', '127.0.0.1', '2024-08-29 13:48:26', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (650, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 13:48:48', '2024-08-29 13:48:53', '5', 'Macintosh', '127.0.0.1', '2024-08-29 13:48:48', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (651, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 13:48:53', '2024-08-29 13:49:01', '8', 'Macintosh', '127.0.0.1', '2024-08-29 13:48:53', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (652, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-29 13:49:01', '2024-08-29 13:49:11', '9', 'Macintosh', '127.0.0.1', '2024-08-29 13:49:01', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (653, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 13:49:11', '2024-08-29 13:49:19', '8', 'Macintosh', '127.0.0.1', '2024-08-29 13:49:10', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (654, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 13:49:19', '2024-08-29 13:50:12', '53', 'Macintosh', '127.0.0.1', '2024-08-29 13:49:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (655, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 13:50:12', '2024-08-29 13:50:21', '8', 'Macintosh', '127.0.0.1', '2024-08-29 13:50:12', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (656, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-08-29 13:50:21', '2024-08-29 13:50:23', '1', 'Macintosh', '127.0.0.1', '2024-08-29 13:50:20', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (657, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', 'iot平台', '1013', '基础数据', '100112', '全局参数', '2024-08-29 13:50:23', '2024-08-29 13:50:24', '0', 'Macintosh', '127.0.0.1', '2024-08-29 13:50:22', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (658, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-08-29 13:50:24', '2024-08-29 13:50:26', '1', 'Macintosh', '127.0.0.1', '2024-08-29 13:50:23', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (659, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-29 13:50:26', '2024-08-29 13:50:47', '20', 'Macintosh', '127.0.0.1', '2024-08-29 13:50:25', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (660, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:50:54', '2024-08-29 13:51:01', '7', 'Macintosh', '127.0.0.1', '2024-08-29 13:50:53', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (661, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:51:04', '2024-08-29 13:51:26', '21', 'Macintosh', '127.0.0.1', '2024-08-29 13:51:04', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (662, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:51:28', '2024-08-29 13:52:31', '62', 'Macintosh', '127.0.0.1', '2024-08-29 13:51:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (663, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:52:33', '2024-08-29 13:54:52', '139', 'Macintosh', '127.0.0.1', '2024-08-29 13:52:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (664, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 13:52:38', '2024-08-29 13:52:48', '10', 'Macintosh', '127.0.0.1', '2024-08-29 13:52:37', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (665, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-29 13:52:48', '2024-08-29 13:53:08', '19', 'Macintosh', '127.0.0.1', '2024-08-29 13:52:48', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (666, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 13:53:08', '2024-08-29 13:53:12', '3', 'Macintosh', '127.0.0.1', '2024-08-29 13:53:07', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (667, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-29 13:53:12', '2024-08-29 13:53:22', '10', 'Macintosh', '127.0.0.1', '2024-08-29 13:53:11', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (668, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 13:53:22', '2024-08-29 13:53:30', '8', 'Macintosh', '127.0.0.1', '2024-08-29 13:53:22', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (669, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 13:53:30', '2024-08-29 13:53:38', '8', 'Macintosh', '127.0.0.1', '2024-08-29 13:53:30', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (670, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 13:53:39', '2024-08-29 13:53:42', '2', 'Macintosh', '127.0.0.1', '2024-08-29 13:53:38', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (671, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 13:53:42', '2024-08-29 13:54:04', '21', 'Macintosh', '127.0.0.1', '2024-08-29 13:53:41', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (672, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-08-29 13:54:04', '2024-08-29 13:54:10', '6', 'Macintosh', '127.0.0.1', '2024-08-29 13:54:03', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (673, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 13:54:10', '2024-08-29 13:54:49', '38', 'Macintosh', '127.0.0.1', '2024-08-29 13:54:10', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (674, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:54:56', '2024-08-29 13:55:17', '21', 'Macintosh', '127.0.0.1', '2024-08-29 13:54:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (675, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 13:55:00', '2024-08-29 13:55:02', '2', 'Macintosh', '127.0.0.1', '2024-08-29 13:54:59', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (676, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 13:55:02', '2024-08-29 13:55:17', '15', 'Macintosh', '127.0.0.1', '2024-08-29 13:55:02', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (677, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:55:22', '2024-08-29 13:55:50', '28', 'Macintosh', '127.0.0.1', '2024-08-29 13:55:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (678, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-08-29 13:55:25', '2024-08-29 13:55:31', '6', 'Macintosh', '127.0.0.1', '2024-08-29 13:55:25', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (679, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-08-29 13:55:31', '2024-08-29 13:55:50', '19', 'Macintosh', '127.0.0.1', '2024-08-29 13:55:31', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (680, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:55:55', '2024-08-29 13:56:02', '7', 'Macintosh', '127.0.0.1', '2024-08-29 13:55:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (681, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:56:04', '2024-08-29 13:56:26', '21', 'Macintosh', '127.0.0.1', '2024-08-29 13:56:04', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (682, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:56:29', '2024-08-29 13:57:01', '31', 'Windows', '127.0.0.1', '2024-08-29 13:56:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (683, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:57:04', '2024-08-29 13:57:39', '34', 'Windows', '127.0.0.1', '2024-08-29 13:57:03', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (684, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 13:57:13', '2024-08-29 13:57:13', '0', 'Windows', '127.0.0.1', '2024-08-29 13:57:12', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (685, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 13:57:13', '2024-08-29 13:57:19', '6', 'Windows', '127.0.0.1', '2024-08-29 13:57:12', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (686, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'announcement', '4000', '业务中台', '400003', '消息中心', '40000301', '通知公告', '2024-08-29 13:57:19', '2024-08-29 13:57:20', '0', 'Windows', '127.0.0.1', '2024-08-29 13:57:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (687, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 13:57:20', '2024-08-29 13:57:39', '18', 'Windows', '127.0.0.1', '2024-08-29 13:57:19', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (688, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 13:57:47', '2024-08-29 14:32:45', '2098', 'Windows', '127.0.0.1', '2024-08-29 13:57:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (689, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 13:57:49', '2024-08-29 13:57:49', '0', 'Windows', '127.0.0.1', '2024-08-29 13:57:49', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (690, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 13:57:49', '2024-08-29 13:58:08', '19', 'Windows', '127.0.0.1', '2024-08-29 13:57:49', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (691, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 13:58:11', '2024-08-29 13:58:11', '0', 'Windows', '127.0.0.1', '2024-08-29 13:58:10', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (692, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 13:58:11', '2024-08-29 14:11:53', '821', 'Windows', '127.0.0.1', '2024-08-29 13:58:11', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (693, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:11:53', '2024-08-29 14:11:53', '0', 'Windows', '127.0.0.1', '2024-08-29 14:11:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (694, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:11:53', '2024-08-29 14:11:59', '5', 'Windows', '127.0.0.1', '2024-08-29 14:11:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (695, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:11:59', '2024-08-29 14:11:59', '0', 'Windows', '127.0.0.1', '2024-08-29 14:11:58', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (696, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:11:59', '2024-08-29 14:12:04', '5', 'Windows', '127.0.0.1', '2024-08-29 14:11:58', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (697, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:12:04', '2024-08-29 14:12:04', '0', 'Windows', '127.0.0.1', '2024-08-29 14:12:04', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (698, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:12:04', '2024-08-29 14:32:33', '1228', 'Windows', '127.0.0.1', '2024-08-29 14:12:04', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (699, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:32:33', '2024-08-29 14:32:33', '0', 'Windows', '127.0.0.1', '2024-08-29 14:32:32', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (700, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:32:33', '2024-08-29 14:32:37', '4', 'Windows', '127.0.0.1', '2024-08-29 14:32:32', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (701, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 14:32:48', '2024-08-29 15:08:17', '2129', 'Windows', '127.0.0.1', '2024-08-29 14:32:48', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (702, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:33:00', '2024-08-29 14:33:00', '0', 'Windows', '127.0.0.1', '2024-08-29 14:32:59', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (703, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:33:00', '2024-08-29 14:35:33', '152', 'Windows', '127.0.0.1', '2024-08-29 14:32:59', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (704, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 14:34:03', '2024-08-29 16:05:38', '5495', 'Macintosh', '127.0.0.1', '2024-08-29 14:34:03', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (705, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:35:33', '2024-08-29 14:35:33', '0', 'Windows', '127.0.0.1', '2024-08-29 14:35:32', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (706, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:35:33', '2024-08-29 14:40:42', '308', 'Windows', '127.0.0.1', '2024-08-29 14:35:33', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (707, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:40:42', '2024-08-29 14:40:42', '0', 'Windows', '127.0.0.1', '2024-08-29 14:40:41', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (708, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:40:42', '2024-08-29 14:40:50', '8', 'Windows', '127.0.0.1', '2024-08-29 14:40:41', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (709, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'announcement', '4000', '业务中台', '400003', '消息中心', '40000301', '通知公告', '2024-08-29 14:40:50', '2024-08-29 14:40:52', '2', 'Windows', '127.0.0.1', '2024-08-29 14:40:50', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (710, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 14:40:52', '2024-08-29 14:40:56', '3', 'Windows', '127.0.0.1', '2024-08-29 14:40:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (711, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:40:56', '2024-08-29 14:40:58', '2', 'Windows', '127.0.0.1', '2024-08-29 14:40:55', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (712, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 14:40:58', '2024-08-29 14:41:01', '2', 'Windows', '127.0.0.1', '2024-08-29 14:40:58', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (713, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:41:01', '2024-08-29 14:41:03', '1', 'Windows', '127.0.0.1', '2024-08-29 14:41:00', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (714, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 14:41:03', '2024-08-29 14:41:12', '9', 'Windows', '127.0.0.1', '2024-08-29 14:41:02', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (715, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:41:12', '2024-08-29 14:41:13', '1', 'Windows', '127.0.0.1', '2024-08-29 14:41:12', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (716, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 14:41:13', '2024-08-29 14:41:23', '10', 'Windows', '127.0.0.1', '2024-08-29 14:41:13', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (717, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:41:23', '2024-08-29 14:41:30', '7', 'Windows', '127.0.0.1', '2024-08-29 14:41:23', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (718, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 14:41:30', '2024-08-29 14:41:37', '6', 'Windows', '127.0.0.1', '2024-08-29 14:41:30', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (719, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:41:37', '2024-08-29 14:44:53', '195', 'Windows', '127.0.0.1', '2024-08-29 14:41:36', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (720, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'announcement', '4000', '业务中台', '400003', '消息中心', '40000301', '通知公告', '2024-08-29 14:44:53', '2024-08-29 14:44:54', '1', 'Windows', '127.0.0.1', '2024-08-29 14:44:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (721, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:44:54', '2024-08-29 14:44:57', '2', 'Windows', '127.0.0.1', '2024-08-29 14:44:54', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (722, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 14:44:57', '2024-08-29 14:44:58', '1', 'Windows', '127.0.0.1', '2024-08-29 14:44:56', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (723, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:44:58', '2024-08-29 14:45:02', '4', 'Windows', '127.0.0.1', '2024-08-29 14:44:58', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (724, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-29 14:45:02', '2024-08-29 14:45:04', '2', 'Windows', '127.0.0.1', '2024-08-29 14:45:02', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (725, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-08-29 14:45:04', '2024-08-29 14:45:05', '1', 'Windows', '127.0.0.1', '2024-08-29 14:45:04', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (726, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 14:45:05', '2024-08-29 14:45:07', '1', 'Windows', '127.0.0.1', '2024-08-29 14:45:05', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (727, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:45:07', '2024-08-29 14:45:09', '2', 'Windows', '127.0.0.1', '2024-08-29 14:45:06', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (728, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'announcement', '4000', '业务中台', '400003', '消息中心', '40000301', '通知公告', '2024-08-29 14:45:09', '2024-08-29 14:45:10', '1', 'Windows', '127.0.0.1', '2024-08-29 14:45:09', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (729, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 14:45:10', '2024-08-29 15:04:52', '1182', 'Windows', '127.0.0.1', '2024-08-29 14:45:10', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (730, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 15:04:52', '2024-08-29 15:04:52', '0', 'Windows', '127.0.0.1', '2024-08-29 15:04:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (731, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 15:04:52', '2024-08-29 15:06:05', '73', 'Windows', '127.0.0.1', '2024-08-29 15:04:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (732, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 15:06:05', '2024-08-29 15:06:05', '0', 'Windows', '127.0.0.1', '2024-08-29 15:06:05', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (733, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 15:06:05', '2024-08-29 15:06:41', '35', 'Windows', '127.0.0.1', '2024-08-29 15:06:05', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (734, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-29 15:06:41', '2024-08-29 15:07:56', '75', 'Windows', '127.0.0.1', '2024-08-29 15:06:40', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (735, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 15:07:56', '2024-08-29 15:07:56', '0', 'Windows', '127.0.0.1', '2024-08-29 15:07:56', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (736, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 15:07:56', '2024-08-29 15:08:17', '21', 'Windows', '127.0.0.1', '2024-08-29 15:07:56', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (737, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 15:08:22', '2024-08-29 16:05:38', '3436', 'Windows', '127.0.0.1', '2024-08-29 15:08:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (738, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 16:05:56', '2024-08-29 17:22:05', '4568', 'Windows', '192.168.1.200', '2024-08-29 16:05:56', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (739, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 16:06:17', '2024-08-29 17:22:05', '4547', 'Windows', '192.168.1.200', '2024-08-29 16:06:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (740, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 17:22:08', '2024-08-30 10:27:49', '61541', 'Windows', '127.0.0.1', '2024-08-29 17:22:07', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (741, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 17:22:12', '2024-08-29 17:22:12', '0', 'Windows', '127.0.0.1', '2024-08-29 17:22:11', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (742, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 17:22:12', '2024-08-29 17:29:16', '423', 'Windows', '127.0.0.1', '2024-08-29 17:22:11', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (743, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 17:46:32', '2024-08-29 17:46:32', '0', 'Windows', '127.0.0.1', '2024-08-29 17:46:31', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (744, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 17:46:32', '2024-08-29 17:58:42', '729', 'Windows', '127.0.0.1', '2024-08-29 17:46:31', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (745, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 17:59:02', '2024-08-29 17:59:02', '0', 'Windows', '127.0.0.1', '2024-08-29 17:59:01', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (746, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-29 17:59:02', '2024-08-29 18:00:10', '67', 'Windows', '127.0.0.1', '2024-08-29 17:59:02', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (747, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 18:00:12', '2024-08-30 10:47:24', '60432', 'Windows', '127.0.0.1', '2024-08-29 18:00:12', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (748, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-30 09:37:58', '2024-08-30 09:37:58', '0', 'Windows', '127.0.0.1', '2024-08-30 09:37:57', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (749, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-30 09:37:58', '2024-08-30 10:27:43', '2985', 'Windows', '127.0.0.1', '2024-08-30 09:37:57', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (750, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 10:27:52', NULL, NULL, 'Windows', '127.0.0.1', '2024-08-30 10:27:52', NULL, '登录');
INSERT INTO `sys_user_browse_record` VALUES (751, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 10:28:56', '2024-08-30 10:47:24', '1108', 'Windows', '127.0.0.1', '2024-08-30 10:28:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (752, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 10:30:18', '2024-08-30 10:47:24', '1026', 'Windows', '127.0.0.1', '2024-08-30 10:30:18', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (753, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 10:47:27', NULL, NULL, 'Windows', '127.0.0.1', '2024-08-30 10:47:27', NULL, '登录');
INSERT INTO `sys_user_browse_record` VALUES (754, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-30 10:47:31', '2024-08-30 10:47:31', '0', 'Windows', '127.0.0.1', '2024-08-30 10:47:31', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (755, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-08-30 10:47:31', '2024-08-30 11:22:01', '2070', 'Windows', '127.0.0.1', '2024-08-30 10:47:31', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (756, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-30 11:30:55', '2024-08-30 11:31:02', '7', 'Windows', '127.0.0.1', '2024-08-30 11:30:55', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (757, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-30 11:31:02', '2024-08-30 11:32:12', '70', 'Windows', '127.0.0.1', '2024-08-30 11:31:02', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (758, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-30 11:32:12', '2024-08-30 11:33:36', '84', 'Windows', '127.0.0.1', '2024-08-30 11:32:12', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (759, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-08-30 11:33:36', '2024-08-30 11:33:57', '20', 'Windows', '127.0.0.1', '2024-08-30 11:33:36', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (760, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-30 11:33:57', '2024-08-30 11:38:00', '243', 'Windows', '127.0.0.1', '2024-08-30 11:33:56', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (761, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'messageTemplate', '4000', '业务中台', '400003', '消息中心', '40000303', '消息模板', '2024-08-30 11:38:00', '2024-08-30 11:38:22', '21', 'Windows', '127.0.0.1', '2024-08-30 11:38:00', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (762, 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', 'zhurg', 'msgSort', '4000', '业务中台', '400005', '告警中心', '40000502', '告警分类', '2024-08-30 11:38:22', NULL, NULL, 'Windows', '127.0.0.1', '2024-08-30 11:38:21', NULL, NULL);
INSERT INTO `sys_user_browse_record` VALUES (763, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 14:22:45', '2024-09-03 14:17:19', '345273', 'Windows', '127.0.0.1', '2024-08-30 14:22:45', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (764, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 14:25:12', '2024-09-03 14:17:19', '345126', 'Windows', '127.0.0.1', '2024-08-30 14:25:12', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (765, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-02 15:52:35', '2024-09-03 14:17:19', '80683', 'Windows', '127.0.0.1', '2024-09-02 15:52:35', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (766, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-02 17:20:14', '2024-09-03 14:17:19', '75424', 'Windows', '127.0.0.1', '2024-09-02 17:20:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (767, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 10:56:20', '2024-09-03 14:17:19', '12058', 'Windows', '127.0.0.1', '2024-09-03 10:56:19', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (768, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-09-03 10:58:45', '2024-09-03 10:58:48', '3', 'Windows', '127.0.0.1', '2024-09-03 10:58:44', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (769, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-09-03 10:58:48', '2024-09-03 10:58:50', '2', 'Windows', '127.0.0.1', '2024-09-03 10:58:48', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (770, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-09-03 10:58:50', '2024-09-03 10:59:14', '24', 'Windows', '127.0.0.1', '2024-09-03 10:58:50', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (771, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-09-03 10:59:14', '2024-09-03 10:59:36', '22', 'Windows', '127.0.0.1', '2024-09-03 10:59:14', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (772, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-09-03 10:59:36', '2024-09-03 10:59:38', '2', 'Windows', '127.0.0.1', '2024-09-03 10:59:36', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (773, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-09-03 10:59:38', '2024-09-03 10:59:48', '10', 'Windows', '127.0.0.1', '2024-09-03 10:59:38', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (774, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:00:07', '2024-09-03 14:17:19', '11831', 'Windows', '127.0.0.1', '2024-09-03 11:00:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (775, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:02:30', '2024-09-03 14:17:19', '11688', 'Macintosh', '127.0.0.1', '2024-09-03 11:02:30', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (776, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:02:59', '2024-09-03 14:17:19', '11659', 'Macintosh', '127.0.0.1', '2024-09-03 11:02:59', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (777, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:03:33', '2024-09-03 14:17:19', '11625', 'Macintosh', '127.0.0.1', '2024-09-03 11:03:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (778, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:03:49', '2024-09-03 14:17:19', '11609', 'Macintosh', '127.0.0.1', '2024-09-03 11:03:48', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (779, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:04:32', '2024-09-03 14:17:19', '11566', 'Macintosh', '127.0.0.1', '2024-09-03 11:04:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (780, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:04:47', '2024-09-03 14:17:19', '11551', 'Macintosh', '127.0.0.1', '2024-09-03 11:04:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (781, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:04:54', '2024-09-03 14:17:19', '11544', 'Macintosh', '127.0.0.1', '2024-09-03 11:04:53', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (782, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:04:59', '2024-09-03 14:17:19', '11539', 'Macintosh', '127.0.0.1', '2024-09-03 11:04:59', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (783, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:06:52', '2024-09-03 14:17:19', '11426', 'Macintosh', '127.0.0.1', '2024-09-03 11:06:52', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (784, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 11:08:19', '2024-09-03 14:17:19', '11339', 'Macintosh', '127.0.0.1', '2024-09-03 11:08:19', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (785, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-09-03 14:13:18', '2024-09-03 14:13:19', '0', 'Windows', '127.0.0.1', '2024-09-03 14:13:17', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (786, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-09-03 14:13:19', '2024-09-03 14:14:46', '87', 'Windows', '127.0.0.1', '2024-09-03 14:13:18', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (787, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 14:14:46', '2024-09-03 14:17:19', '152', 'Windows', '127.0.0.1', '2024-09-03 14:14:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (788, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 14:15:03', '2024-09-03 14:17:19', '135', 'Windows', '127.0.0.1', '2024-09-03 14:15:03', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (789, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-09-03 14:15:50', '2024-09-03 14:17:19', '88', 'Windows', '127.0.0.1', '2024-09-03 14:15:49', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (790, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 14:17:46', '2024-09-03 16:44:31', '8804', 'Windows', '127.0.0.1', '2024-09-03 14:17:45', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (791, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-09-03 14:17:56', '2024-09-03 14:17:57', '0', 'Windows', '127.0.0.1', '2024-09-03 14:17:55', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (792, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-09-03 14:17:57', '2024-09-03 14:20:16', '138', 'Windows', '127.0.0.1', '2024-09-03 14:17:56', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (793, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-09-03 14:20:59', '2024-09-03 14:57:15', '2176', 'Windows', '127.0.0.1', '2024-09-03 14:20:59', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (794, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 14:58:50', '2024-09-03 16:44:31', '6340', 'Windows', '127.0.0.1', '2024-09-03 14:58:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (795, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 15:47:57', '2024-09-03 16:44:31', '3393', 'Windows', '127.0.0.1', '2024-09-03 15:47:57', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (796, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 15:54:56', '2024-09-03 16:44:31', '2974', 'Windows', '127.0.0.1', '2024-09-03 15:54:56', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (797, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 15:57:27', '2024-09-03 16:44:31', '2823', 'Windows', '127.0.0.1', '2024-09-03 15:57:27', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (798, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 15:58:39', '2024-09-03 16:44:31', '2751', 'Windows', '127.0.0.1', '2024-09-03 15:58:38', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (799, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 15:59:09', '2024-09-03 16:44:31', '2721', 'Windows', '127.0.0.1', '2024-09-03 15:59:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (800, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 15:59:35', '2024-09-03 16:44:31', '2695', 'Windows', '127.0.0.1', '2024-09-03 15:59:35', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (801, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 16:08:22', '2024-09-03 16:44:31', '2168', 'Windows', '127.0.0.1', '2024-09-03 16:08:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (802, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 16:41:06', '2024-09-03 16:44:31', '204', 'Macintosh', '127.0.0.1', '2024-09-03 16:41:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (803, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 16:44:36', '2024-09-05 13:58:35', '162838', 'Windows', '127.0.0.1', '2024-09-03 16:44:36', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (804, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 16:44:53', '2024-09-05 13:58:35', '162821', 'Windows', '127.0.0.1', '2024-09-03 16:44:53', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (805, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-09-03 16:44:57', '2024-09-03 16:44:57', '0', 'Windows', '127.0.0.1', '2024-09-03 16:44:57', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (806, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-09-03 16:44:57', '2024-09-03 16:45:01', '3', 'Windows', '127.0.0.1', '2024-09-03 16:44:57', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (807, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-09-03 16:45:01', '2024-09-03 16:45:01', '0', 'Windows', '127.0.0.1', '2024-09-03 16:45:00', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (808, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-09-03 16:45:01', '2024-09-04 14:35:23', '78621', 'Windows', '127.0.0.1', '2024-09-03 16:45:00', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (809, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 08:52:16', '2024-09-05 13:58:35', '18378', 'Windows', '127.0.0.1', '2024-09-05 08:52:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (810, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 09:19:37', '2024-09-05 13:58:35', '16737', 'Windows', '127.0.0.1', '2024-09-05 09:19:36', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (811, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 10:15:51', '2024-09-05 13:58:35', '13363', 'Windows', '127.0.0.1', '2024-09-05 10:15:51', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (812, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 13:59:15', '2024-09-05 17:41:24', '13329', 'Windows', '127.0.0.1', '2024-09-05 13:59:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (813, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 14:02:11', '2024-09-05 17:41:24', '13153', 'Windows', '127.0.0.1', '2024-09-05 14:02:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (814, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 15:46:03', '2024-09-05 17:41:24', '6921', 'Windows', '127.0.0.1', '2024-09-05 15:46:03', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (815, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 08:57:51', '2024-09-06 15:04:28', '21996', 'Windows', '127.0.0.1', '2024-09-06 08:57:51', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (816, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:38:21', '2024-09-06 15:04:28', '15966', 'Windows', '127.0.0.1', '2024-09-06 10:38:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (817, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (818, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (819, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (820, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (821, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (822, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (823, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (824, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (825, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (826, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (827, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (828, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (829, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (830, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 10:55:08', '2024-09-06 15:04:28', '14959', 'Windows', '127.0.0.1', '2024-09-06 10:55:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (831, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-09-06 15:02:50', '2024-09-06 15:03:43', '53', 'Windows', '127.0.0.1', '2024-09-06 15:02:50', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (832, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-09-06 15:03:52', '2024-09-06 15:04:28', '35', 'Windows', '127.0.0.1', '2024-09-06 15:03:51', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (833, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 15:04:37', '2024-09-10 11:31:36', '332818', 'Windows', '127.0.0.1', '2024-09-06 15:04:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (834, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06 17:11:52', '2024-09-10 11:31:36', '325183', 'Windows', '127.0.0.1', '2024-09-06 17:11:52', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (835, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-10 11:29:01', '2024-09-10 11:31:36', '154', 'Macintosh', '127.0.0.1', '2024-09-10 11:29:00', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (836, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-10 11:31:07', '2024-09-10 11:31:36', '28', 'Macintosh', '127.0.0.1', '2024-09-10 11:31:07', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (837, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-10 15:24:41', '2024-09-10 17:42:48', '8286', 'Windows', '127.0.0.1', '2024-09-10 15:24:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (838, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-10 15:26:43', '2024-09-10 17:42:48', '8164', 'Windows', '127.0.0.1', '2024-09-10 15:26:42', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (839, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-10 15:27:40', '2024-09-10 17:42:48', '8107', 'Windows', '127.0.0.1', '2024-09-10 15:27:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (840, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-11 09:35:09', '2024-09-11 17:13:20', '27490', 'Windows', '127.0.0.1', '2024-09-11 09:35:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (841, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-11 10:03:45', '2024-09-11 17:13:20', '25774', 'Windows', '127.0.0.1', '2024-09-11 10:03:44', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (842, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-11 15:39:51', '2024-09-11 17:13:20', '5608', 'Windows', '127.0.0.1', '2024-09-11 15:39:50', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (843, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-11 17:15:22', '2024-09-23 09:18:31', '1008188', 'Windows', '127.0.0.1', '2024-09-11 17:15:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (844, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 09:30:24', '2024-09-23 09:18:31', '949686', 'Windows', '127.0.0.1', '2024-09-12 09:30:23', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (845, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 10:14:19', '2024-09-23 09:18:31', '947051', 'Windows', '127.0.0.1', '2024-09-12 10:14:19', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (846, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 11:05:41', '2024-09-23 09:18:31', '943969', 'Macintosh', '127.0.0.1', '2024-09-12 11:05:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (847, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 11:05:47', '2024-09-23 09:18:31', '943963', 'Macintosh', '127.0.0.1', '2024-09-12 11:05:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (848, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'announcement', '4000', '业务中台', '400003', '消息中心', '40000301', '通知公告', '2024-09-12 15:39:08', '2024-09-12 16:05:44', '1596', 'Windows', '127.0.0.1', '2024-09-12 15:39:07', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (849, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 16:06:47', '2024-09-23 09:18:31', '925903', 'Windows', '127.0.0.1', '2024-09-12 16:06:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (850, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 16:35:31', '2024-09-23 09:18:31', '924179', 'Macintosh', '127.0.0.1', '2024-09-12 16:35:31', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (851, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 17:05:06', '2024-09-23 09:18:31', '922404', 'Macintosh', '127.0.0.1', '2024-09-12 17:05:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (852, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-12 17:05:36', '2024-09-23 09:18:31', '922374', 'Macintosh', '127.0.0.1', '2024-09-12 17:05:36', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (853, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 08:51:56', '2024-09-23 09:18:31', '865594', 'Macintosh', '127.0.0.1', '2024-09-13 08:51:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (854, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:12:14', '2024-09-23 09:18:31', '860776', 'Windows', '127.0.0.1', '2024-09-13 10:12:13', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (855, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:12:17', '2024-09-23 09:18:31', '860773', 'Windows', '127.0.0.1', '2024-09-13 10:12:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (856, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:12:19', '2024-09-23 09:18:31', '860771', 'Windows', '127.0.0.1', '2024-09-13 10:12:19', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (857, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:12:37', '2024-09-23 09:18:31', '860753', 'Windows', '127.0.0.1', '2024-09-13 10:12:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (858, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:14:19', '2024-09-23 09:18:31', '860651', 'Windows', '127.0.0.1', '2024-09-13 10:14:19', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (859, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:17:13', '2024-09-23 09:18:31', '860477', 'Windows', '127.0.0.1', '2024-09-13 10:17:13', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (860, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:23:05', '2024-09-23 09:18:31', '860125', 'Windows', '127.0.0.1', '2024-09-13 10:23:04', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (861, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:23:12', '2024-09-23 09:18:31', '860118', 'Windows', '127.0.0.1', '2024-09-13 10:23:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (862, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:33:45', '2024-09-23 09:18:31', '859485', 'Windows', '127.0.0.1', '2024-09-13 10:33:44', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (863, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-13 10:58:15', '2024-09-23 09:18:31', '858015', 'Windows', '127.0.0.1', '2024-09-13 10:58:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (864, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-19 09:05:10', '2024-09-23 09:18:31', '346400', 'Macintosh', '127.0.0.1', '2024-09-19 09:05:10', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (865, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 09:33:55', '2024-09-23 09:18:31', '258275', 'Macintosh', '127.0.0.1', '2024-09-20 09:33:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (866, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 14:43:13', '2024-09-23 09:18:31', '239717', 'Windows', '127.0.0.1', '2024-09-20 14:43:12', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (867, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-21 08:06:38', '2024-09-23 09:18:31', '177112', 'Windows', '127.0.0.1', '2024-09-21 08:06:38', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (868, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-23 08:11:21', '2024-09-23 09:18:31', '4029', 'Windows', '127.0.0.1', '2024-09-23 08:11:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (869, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-23 16:43:07', '2024-09-25 10:37:57', '150889', 'Windows', '127.0.0.1', '2024-09-23 16:43:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (870, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-23 18:05:09', '2024-09-25 10:37:57', '145967', 'Macintosh', '127.0.0.1', '2024-09-23 18:05:09', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (871, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-23 18:05:34', '2024-09-25 10:37:57', '145942', 'Macintosh', '127.0.0.1', '2024-09-23 18:05:34', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (872, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-23 18:05:39', '2024-09-25 10:37:57', '145937', 'Macintosh', '127.0.0.1', '2024-09-23 18:05:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (873, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-24 09:27:56', '2024-09-25 10:37:57', '90600', 'Macintosh', '127.0.0.1', '2024-09-24 09:27:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (874, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-09-25 09:45:26', '2024-09-25 10:00:17', '891', 'Windows', '127.0.0.1', '2024-09-25 09:45:25', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (875, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-09-25 10:00:17', '2024-09-25 10:35:41', '2123', 'Windows', '127.0.0.1', '2024-09-25 10:00:17', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (876, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 10:38:25', '2024-09-25 10:39:25', '59', 'Windows', '127.0.0.1', '2024-09-25 10:38:24', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (877, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 10:40:25', '2024-09-25 13:42:08', '10902', 'Windows', '127.0.0.1', '2024-09-25 10:40:25', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (878, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-09-25 10:41:52', '2024-09-25 10:47:33', '341', 'Windows', '127.0.0.1', '2024-09-25 10:41:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (879, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-09-25 10:47:33', '2024-09-25 10:48:21', '48', 'Windows', '127.0.0.1', '2024-09-25 10:47:33', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (880, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-09-25 10:50:26', '2024-09-25 10:51:18', '51', 'Windows', '127.0.0.1', '2024-09-25 10:50:25', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (881, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 16:41:43', '2024-10-25 14:41:06', '2584763', 'Windows', '127.0.0.1', '2024-09-25 16:41:42', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (882, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-26 11:10:22', '2024-10-25 14:41:06', '2518244', 'Windows', '127.0.0.1', '2024-09-26 11:10:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (883, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-26 11:39:53', '2024-10-25 14:41:06', '2516473', 'Macintosh', '127.0.0.1', '2024-09-26 11:39:52', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (884, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-27 13:11:31', '2024-10-25 14:41:06', '2424575', 'Macintosh', '127.0.0.1', '2024-09-27 13:11:31', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (885, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-27 14:44:52', '2024-10-25 14:41:06', '2418974', 'Windows', '127.0.0.1', '2024-09-27 14:44:52', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (886, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-09 10:01:24', '2024-10-25 14:41:06', '1399182', 'Macintosh', '127.0.0.1', '2024-10-09 10:01:24', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (887, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-10 09:17:30', '2024-10-25 14:41:06', '1315416', 'Windows', '127.0.0.1', '2024-10-10 09:17:30', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (888, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-11 15:23:52', '2024-10-25 14:41:06', '1207034', 'Macintosh', '127.0.0.1', '2024-10-11 15:25:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (889, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-11 15:24:02', '2024-10-25 14:41:06', '1207024', 'Windows', '127.0.0.1', '2024-10-11 15:25:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (890, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 11:37:17', '2024-10-25 14:41:06', '961429', 'Macintosh', '127.0.0.1', '2024-10-14 11:37:17', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (891, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-15 08:57:59', '2024-10-25 14:41:06', '884587', 'Macintosh', '127.0.0.1', '2024-10-15 08:57:59', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (892, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-15 10:15:52', '2024-10-25 14:41:06', '879914', 'Windows', '127.0.0.1', '2024-10-15 10:15:51', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (893, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 11:10:29', '2024-10-25 14:41:06', '790237', 'Windows', '127.0.0.1', '2024-10-16 11:10:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (894, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-22 11:43:28', '2024-10-25 14:41:06', '269858', 'Macintosh', '127.0.0.1', '2024-10-22 11:43:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (895, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-23 09:49:49', '2024-10-25 14:41:06', '190277', 'Windows', '127.0.0.1', '2024-10-23 09:49:48', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (896, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-25 13:56:31', '2024-10-25 14:41:06', '2675', 'Windows', '127.0.0.1', '2024-10-25 13:56:31', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (897, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-25 14:55:47', '2024-11-01 14:32:35', '603407', 'Windows', '127.0.0.1', '2024-10-25 14:55:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (898, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-25 17:42:19', '2024-11-01 14:32:35', '593415', 'Windows', '127.0.0.1', '2024-10-25 17:42:18', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (899, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-10-29 15:12:10', '2024-10-29 15:15:40', '210', 'Windows', '127.0.0.1', '2024-10-29 15:12:10', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (900, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-10-29 15:15:44', '2024-10-29 15:15:46', '1', 'Windows', '127.0.0.1', '2024-10-29 15:15:43', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (901, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-10-29 15:15:46', '2024-10-29 15:30:58', '911', 'Windows', '127.0.0.1', '2024-10-29 15:15:45', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (902, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-10-29 15:31:00', '2024-10-29 15:32:48', '108', 'Windows', '127.0.0.1', '2024-10-29 15:31:00', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (903, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-10-29 15:32:48', '2024-10-29 15:32:49', '1', 'Windows', '127.0.0.1', '2024-10-29 15:32:48', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (904, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-10-29 15:32:49', '2024-10-29 15:32:57', '8', 'Windows', '127.0.0.1', '2024-10-29 15:32:49', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (905, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-10-29 15:32:57', '2024-10-29 15:32:59', '1', 'Windows', '127.0.0.1', '2024-10-29 15:32:57', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (906, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userGroup', '4000', '业务中台', '400001', '系统管理', '40000107', '用户组管理', '2024-10-29 15:32:59', '2024-10-29 15:33:00', '1', 'Windows', '127.0.0.1', '2024-10-29 15:32:58', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (907, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-10-29 15:33:00', '2024-10-29 15:33:01', '1', 'Windows', '127.0.0.1', '2024-10-29 15:33:00', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (908, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', '采集配置', '1013', '基础数据', '100112', '全局参数', '2024-10-29 15:33:01', '2024-10-29 15:33:03', '2', 'Windows', '127.0.0.1', '2024-10-29 15:33:01', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (909, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-10-29 15:33:03', '2024-10-29 15:33:04', '1', 'Windows', '127.0.0.1', '2024-10-29 15:33:03', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (910, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-10-29 15:33:05', '2024-10-29 15:37:31', '266', 'Windows', '127.0.0.1', '2024-10-29 15:33:04', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (911, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-10-29 15:37:34', '2024-10-29 16:31:31', '3236', 'Windows', '127.0.0.1', '2024-10-29 15:37:34', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (912, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-10-30 09:05:23', '2024-10-30 09:05:50', '26', 'Windows', '127.0.0.1', '2024-10-30 09:05:22', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (913, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-30 09:05:56', '2024-11-01 14:32:35', '192398', 'Windows', '127.0.0.1', '2024-10-30 09:05:56', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (914, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-10-30 09:06:07', '2024-10-30 09:21:10', '903', 'Windows', '127.0.0.1', '2024-10-30 09:06:07', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (915, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-30 09:39:15', '2024-11-01 14:32:35', '190399', 'Windows', '127.0.0.1', '2024-10-30 09:39:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (916, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2024-10-31 11:12:56', '2024-10-31 11:12:58', '1', 'Windows', '127.0.0.1', '2024-10-31 11:12:55', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (917, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-10-31 11:12:58', '2024-10-31 13:37:22', '8664', 'Windows', '127.0.0.1', '2024-10-31 11:12:57', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (918, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-31 13:37:22', '2024-11-01 14:32:35', '89712', 'Windows', '127.0.0.1', '2024-10-31 13:37:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (919, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-10-31 15:14:08', '2024-10-31 15:14:58', '49', 'Windows', '127.0.0.1', '2024-10-31 15:14:08', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (920, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-31 17:35:01', '2024-11-01 14:32:35', '75453', 'Macintosh', '127.0.0.1', '2024-10-31 17:35:01', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (921, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-10-31 18:04:17', '2024-10-31 18:04:55', '37', 'Windows', '127.0.0.1', '2024-10-31 18:04:17', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (922, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-10-31 18:04:55', '2024-11-01 09:07:02', '54126', 'Windows', '127.0.0.1', '2024-10-31 18:04:54', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (923, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-01 09:07:02', '2024-11-01 14:32:35', '19532', 'Macintosh', '127.0.0.1', '2024-11-01 09:07:01', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (924, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-01 15:12:41', '2024-11-05 16:56:47', '351846', 'Windows', '127.0.0.1', '2024-11-01 15:12:40', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (925, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-01 17:17:52', '2024-11-05 16:56:47', '344335', 'Windows', '127.0.0.1', '2024-11-01 17:17:51', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (926, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-11-05 14:37:10', '2024-11-05 14:37:14', '4', 'Windows', '127.0.0.1', '2024-11-05 14:37:10', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (927, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-11-05 14:37:14', '2024-11-05 14:37:26', '12', 'Windows', '127.0.0.1', '2024-11-05 14:37:14', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (928, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-11-05 14:37:26', '2024-11-05 14:37:27', '1', 'Windows', '127.0.0.1', '2024-11-05 14:37:26', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (929, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-11-05 14:37:27', '2024-11-05 14:37:52', '25', 'Windows', '127.0.0.1', '2024-11-05 14:37:27', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (930, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-11-05 16:27:44', '2024-11-05 16:27:53', '9', 'Windows', '127.0.0.1', '2024-11-05 16:27:44', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (931, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-11-05 16:27:53', '2024-11-05 16:28:03', '10', 'Windows', '127.0.0.1', '2024-11-05 16:27:53', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (932, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-11-05 16:28:03', '2024-11-05 16:28:05', '1', 'Windows', '127.0.0.1', '2024-11-05 16:28:03', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (933, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-11-05 16:28:05', '2024-11-05 16:36:12', '487', 'Windows', '127.0.0.1', '2024-11-05 16:28:04', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (934, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-11-05 16:36:22', '2024-11-05 16:36:24', '2', 'Windows', '127.0.0.1', '2024-11-05 16:36:22', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (935, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-11-05 16:36:24', '2024-11-05 16:36:29', '5', 'Windows', '127.0.0.1', '2024-11-05 16:36:24', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (936, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'code', '1000', '采集配置', '1013', '基础数据', '100112', '全局参数', '2024-11-05 16:36:29', '2024-11-05 16:36:30', '1', 'Windows', '127.0.0.1', '2024-11-05 16:36:29', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (937, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-11-05 16:36:30', '2024-11-05 16:39:30', '180', 'Windows', '127.0.0.1', '2024-11-05 16:36:30', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (938, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-11-05 16:39:34', '2024-11-05 16:40:48', '74', 'Windows', '127.0.0.1', '2024-11-05 16:39:34', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (939, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-11-05 16:53:36', '2024-11-05 16:54:28', '52', 'Windows', '127.0.0.1', '2024-11-05 16:53:35', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (940, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-11-05 16:54:31', '2024-11-05 16:55:08', '37', 'Windows', '127.0.0.1', '2024-11-05 16:54:31', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (941, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-05 16:58:08', '2024-11-06 17:42:14', '89046', 'Windows', '127.0.0.1', '2024-11-05 16:58:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (942, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 09:17:01', '2024-11-06 17:42:14', '30313', 'Windows', '127.0.0.1', '2024-11-06 09:17:01', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (943, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-11-06 09:18:33', '2024-11-06 09:32:56', '863', 'Windows', '127.0.0.1', '2024-11-06 09:18:32', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (944, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-11-06 14:16:01', '2024-11-06 14:16:01', '0', 'Windows', '127.0.0.1', '2024-11-06 14:16:01', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (945, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'userAnnouncementList', '4000', '业务中台', '400003', '消息中心', '40000302', '我的消息', '2024-11-06 14:16:01', '2024-11-06 14:26:31', '630', 'Windows', '127.0.0.1', '2024-11-06 14:16:01', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (946, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 17:05:22', '2024-11-06 17:42:14', '2212', 'Windows', '127.0.0.1', '2024-11-06 17:05:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (947, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 17:42:17', '2024-11-07 09:29:07', '56810', 'Windows', '127.0.0.1', '2024-11-06 17:42:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (948, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 17:43:36', '2024-11-07 09:29:07', '56731', 'Windows', '127.0.0.1', '2024-11-06 17:43:35', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (949, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 21:13:03', '2024-11-07 09:29:07', '44164', 'Windows', '127.0.0.1', '2024-11-06 21:13:03', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (950, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 21:13:12', '2024-11-07 09:29:07', '44155', 'Windows', '127.0.0.1', '2024-11-06 21:13:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (951, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-06 21:13:14', '2024-11-07 09:29:07', '44153', 'Windows', '127.0.0.1', '2024-11-06 21:13:13', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (952, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 09:29:13', '2024-11-07 10:02:41', '2008', 'Windows', '127.0.0.1', '2024-11-07 09:29:12', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (953, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:02:47', '2024-11-07 10:27:31', '1484', 'Windows', '127.0.0.1', '2024-11-07 10:02:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (954, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:27:59', '2024-11-07 10:42:25', '865', 'Windows', '10.232.10.94', '2024-11-07 10:27:59', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (955, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:28:37', '2024-11-07 10:42:25', '827', 'Windows', '10.232.10.94', '2024-11-07 10:28:36', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (956, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:29:34', '2024-11-07 10:42:25', '770', 'Windows', '127.0.0.1', '2024-11-07 10:29:34', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (957, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:31:37', '2024-11-07 10:42:25', '647', 'Windows', '10.232.10.94', '2024-11-07 10:31:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (958, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:39:07', '2024-11-07 10:42:25', '197', 'Windows', '10.232.10.94', '2024-11-07 10:39:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (959, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:40:45', '2024-11-07 10:42:25', '99', 'Windows', '10.232.10.94', '2024-11-07 10:40:44', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (960, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 10:44:07', '2024-11-13 09:19:59', '513352', 'Windows', '10.232.10.94', '2024-11-07 10:44:07', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (961, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 11:00:23', '2024-11-13 09:19:59', '512376', 'Windows', '127.0.0.1', '2024-11-07 11:00:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (962, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 17:56:33', '2024-11-13 09:19:59', '401006', 'Windows', '127.0.0.1', '2024-11-08 17:56:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (963, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-12 16:35:00', '2024-11-13 09:19:59', '60299', 'Windows', '127.0.0.1', '2024-11-12 16:34:59', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (964, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-13 09:20:05', '2024-11-13 09:25:00', '294', 'Windows', '127.0.0.1', '2024-11-13 09:20:05', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (965, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-13 09:26:38', '2024-11-14 11:05:11', '92313', 'Windows', '127.0.0.1', '2024-11-13 09:26:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (966, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-13 11:00:49', '2024-11-14 11:05:11', '86662', 'Windows', '127.0.0.1', '2024-11-13 11:00:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (967, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-13 14:19:09', '2024-11-14 11:05:11', '74762', 'Windows', '127.0.0.1', '2024-11-13 14:19:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (968, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-13 15:35:13', '2024-11-14 11:05:11', '70198', 'Windows', '127.0.0.1', '2024-11-13 15:35:12', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (969, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-14 10:40:18', '2024-11-14 11:05:11', '1493', 'Windows', '127.0.0.1', '2024-11-14 10:40:17', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (970, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-14 11:05:14', '2024-11-20 09:37:19', '513125', 'Windows', '127.0.0.1', '2024-11-14 11:05:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (971, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-14 14:29:10', '2024-11-20 09:37:19', '500889', 'Windows', '127.0.0.1', '2024-11-14 14:29:10', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (972, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-19 10:45:39', '2024-11-20 09:37:19', '82300', 'Macintosh', '127.0.0.1', '2024-11-19 10:45:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (973, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-20 09:55:27', '2024-11-20 10:16:43', '1276', 'Windows', '127.0.0.1', '2024-11-20 09:55:27', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (974, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-20 10:16:48', '2024-11-22 09:44:55', '170886', 'Windows', '127.0.0.1', '2024-11-20 10:16:48', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (975, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-21 15:49:32', '2024-11-22 09:44:55', '64522', 'Macintosh', '127.0.0.1', '2024-11-21 15:49:31', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (976, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-22 08:43:29', '2024-11-22 09:44:55', '3685', 'Windows', '127.0.0.1', '2024-11-22 08:43:29', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (977, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-22 09:46:29', '2024-11-22 11:31:07', '6277', 'Windows', '127.0.0.1', '2024-11-22 09:46:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (978, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-25 09:01:18', '2024-12-04 09:19:26', '778687', 'Windows', '127.0.0.1', '2024-11-25 09:01:17', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (979, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-26 10:46:57', '2024-12-04 09:19:26', '685948', 'Windows', '127.0.0.1', '2024-11-26 10:46:57', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (980, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-26 17:55:45', '2024-12-04 09:19:26', '660220', 'Windows', '127.0.0.1', '2024-11-26 17:55:44', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (981, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-27 15:07:02', '2024-12-04 09:19:26', '583943', 'Windows', '127.0.0.1', '2024-11-27 15:07:02', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (982, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-28 16:05:09', '2024-12-04 09:19:26', '494056', 'Macintosh', '127.0.0.1', '2024-11-28 16:05:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (983, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-29 10:08:58', '2024-12-04 09:19:26', '429027', 'Macintosh', '127.0.0.1', '2024-11-29 10:08:58', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (984, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-11-29 15:13:49', '2024-11-29 15:15:57', '128', 'Windows', '127.0.0.1', '2024-11-29 15:13:48', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (985, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-11-29 15:16:03', '2024-11-29 18:52:46', '13003', 'Windows', '127.0.0.1', '2024-11-29 15:16:02', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (986, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-02 15:14:48', '2024-12-04 09:19:26', '151477', 'Windows', '127.0.0.1', '2024-12-02 15:14:48', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (987, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-03 14:59:26', '2024-12-04 09:19:26', '65999', 'Windows', '127.0.0.1', '2024-12-03 14:59:26', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (988, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-03 15:15:47', '2024-12-04 09:19:26', '65018', 'Windows', '127.0.0.1', '2024-12-03 15:15:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (989, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-03 16:50:17', '2024-12-04 09:19:26', '59348', 'Windows', '127.0.0.1', '2024-12-03 16:50:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (990, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-03 17:33:38', '2024-12-04 09:19:26', '56747', 'Windows', '127.0.0.1', '2024-12-03 17:33:38', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (991, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-03 17:53:15', '2024-12-04 09:19:26', '55570', 'Windows', '127.0.0.1', '2024-12-03 17:53:15', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (992, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-04 09:14:15', '2024-12-04 09:19:26', '310', 'Macintosh', '127.0.0.1', '2024-12-04 09:14:15', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (993, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-04 09:30:26', '2024-12-09 10:50:33', '436807', 'Windows', '127.0.0.1', '2024-12-04 09:30:25', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (994, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-05 11:09:07', '2024-12-09 10:50:33', '344486', 'Macintosh', '127.0.0.1', '2024-12-05 11:09:07', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (995, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-05 16:59:54', '2024-12-09 10:50:33', '323439', 'Macintosh', '127.0.0.1', '2024-12-05 16:59:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (996, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-06 10:35:41', '2024-12-09 10:50:33', '260092', 'Windows', '127.0.0.1', '2024-12-06 10:35:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (997, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-09 10:50:37', '2024-12-09 11:20:22', '1785', 'Windows', '127.0.0.1', '2024-12-09 10:50:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (998, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-09 11:28:52', '2024-12-11 15:16:04', '186432', 'Windows', '127.0.0.1', '2024-12-09 11:28:51', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (999, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-10 13:45:00', '2024-12-11 15:16:04', '91864', 'Macintosh', '127.0.0.1', '2024-12-10 13:44:59', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1000, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-10 17:13:03', '2024-12-11 15:16:04', '79381', 'Windows', '127.0.0.1', '2024-12-10 17:13:02', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1001, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-10 17:13:37', '2024-12-11 15:16:04', '79347', 'Windows', '127.0.0.1', '2024-12-10 17:13:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1002, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-10 17:14:15', '2024-12-11 15:16:04', '79309', 'Macintosh', '127.0.0.1', '2024-12-10 17:14:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1003, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-10 17:16:41', '2024-12-11 15:16:04', '79163', 'Windows', '127.0.0.1', '2024-12-10 17:16:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1004, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-10 17:18:12', '2024-12-11 15:16:04', '79072', 'Windows', '127.0.0.1', '2024-12-10 17:18:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1005, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-11 14:08:32', '2024-12-11 15:16:04', '4052', 'Macintosh', '127.0.0.1', '2024-12-11 14:08:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1006, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-11 15:22:17', '2024-12-12 15:22:56', '86438', 'Windows', '127.0.0.1', '2024-12-11 15:22:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1007, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-11 16:09:28', '2024-12-12 15:22:56', '83607', 'Macintosh', '127.0.0.1', '2024-12-11 16:09:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1008, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-11 16:17:09', '2024-12-12 15:22:56', '83146', 'Macintosh', '127.0.0.1', '2024-12-11 16:17:09', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1009, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-12 13:34:54', '2024-12-12 15:22:56', '6481', 'Windows', '127.0.0.1', '2024-12-12 13:34:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1010, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-12 14:01:46', '2024-12-12 15:22:56', '4869', 'Windows', '127.0.0.1', '2024-12-12 14:01:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1011, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 09:51:07', '2024-12-19 11:39:23', '524896', 'Windows', '127.0.0.1', '2024-12-13 09:51:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1012, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 10:48:08', '2024-12-19 11:39:23', '521475', 'Macintosh', '127.0.0.1', '2024-12-13 10:48:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1013, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 15:17:19', '2024-12-19 11:39:23', '505324', 'Windows', '127.0.0.1', '2024-12-13 15:17:18', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1014, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 16:33:45', '2024-12-19 11:39:23', '500738', 'Macintosh', '127.0.0.1', '2024-12-13 16:33:45', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1015, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 16:33:57', '2024-12-19 11:39:23', '500726', 'Macintosh', '127.0.0.1', '2024-12-13 16:33:57', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1016, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-16 10:22:34', '2024-12-19 11:39:23', '263809', 'Macintosh', '127.0.0.1', '2024-12-16 10:22:34', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1017, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-18 19:58:11', '2024-12-19 11:39:23', '56472', 'Windows', '127.0.0.1', '2024-12-18 19:58:10', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1018, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-19 10:44:28', '2024-12-19 11:39:23', '3295', 'Windows', '127.0.0.1', '2024-12-19 10:44:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1019, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-19 10:44:41', '2024-12-19 11:39:23', '3282', 'Windows', '127.0.0.1', '2024-12-19 10:44:40', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1020, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-19 13:16:40', '2024-12-25 15:35:47', '526747', 'Windows', '127.0.0.1', '2024-12-19 13:16:40', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1021, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-25 10:35:25', '2024-12-25 15:35:47', '18022', 'Windows', '127.0.0.1', '2024-12-25 10:35:25', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1022, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-25 10:36:47', '2024-12-25 15:35:47', '17940', 'Windows', '127.0.0.1', '2024-12-25 10:36:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1023, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-25 15:29:54', '2024-12-25 15:35:47', '353', 'Windows', '127.0.0.1', '2024-12-25 15:29:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1024, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-26 15:57:14', '2024-12-31 16:31:32', '434058', 'Windows', '127.0.0.1', '2024-12-26 15:57:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1025, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-12-30 10:20:27', '2024-12-30 10:20:28', '1', 'Windows', '127.0.0.1', '2024-12-30 10:20:26', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1026, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-12-30 10:20:28', '2024-12-30 10:30:17', '588', 'Windows', '127.0.0.1', '2024-12-30 10:20:28', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1027, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-31 09:54:29', '2024-12-31 16:31:32', '23823', 'Windows', '127.0.0.1', '2024-12-31 09:54:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1028, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-12-31 09:56:20', '2024-12-31 09:56:26', '5', 'Windows', '127.0.0.1', '2024-12-31 09:56:19', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1029, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-12-31 09:56:26', '2024-12-31 10:03:16', '409', 'Windows', '127.0.0.1', '2024-12-31 09:56:25', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1030, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-12-31 10:03:21', '2024-12-31 10:03:22', '1', 'Windows', '127.0.0.1', '2024-12-31 10:03:20', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1031, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-12-31 10:03:22', '2024-12-31 10:17:38', '855', 'Windows', '127.0.0.1', '2024-12-31 10:03:22', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1032, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-12-31 10:17:38', '2024-12-31 10:17:47', '8', 'Windows', '127.0.0.1', '2024-12-31 10:17:37', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1033, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-31 10:19:15', '2024-12-31 16:31:32', '22337', 'Windows', '127.0.0.1', '2024-12-31 10:19:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1034, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '业务中台', '400001', '系统管理', '40000103', '角色管理', '2024-12-31 10:20:00', '2024-12-31 10:20:10', '9', 'Windows', '127.0.0.1', '2024-12-31 10:19:59', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1035, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-12-31 10:20:10', '2024-12-31 10:21:37', '86', 'Windows', '127.0.0.1', '2024-12-31 10:20:09', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1036, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2024-12-31 10:21:52', '2024-12-31 10:22:06', '13', 'Windows', '127.0.0.1', '2024-12-31 10:21:52', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1037, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-31 16:31:48', '2024-12-31 18:04:02', '5534', 'Windows', '127.0.0.1', '2024-12-31 16:31:48', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1038, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'forewarningManagement', '4000', '业务中台', '400003', '消息中心', '40000304', '我的告警处理', '2024-12-31 18:03:18', '2024-12-31 18:04:02', '44', 'Windows', '127.0.0.1', '2024-12-31 18:03:17', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (1039, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-31 18:04:39', '2024-12-31 18:08:26', '227', 'Windows', '127.0.0.1', '2024-12-31 18:04:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1040, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '业务中台', '400001', '系统管理', '40000101', '用户管理', '2024-12-31 18:05:26', '2024-12-31 18:08:26', '180', 'Windows', '127.0.0.1', '2024-12-31 18:05:25', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (1041, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-02 09:16:31', '2025-01-02 10:29:57', '4405', 'Windows', '127.0.0.1', '2025-01-02 09:16:30', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1042, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-02 10:34:16', '2025-01-16 17:39:09', '1235093', 'Windows', '127.0.0.1', '2025-01-02 10:34:15', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1043, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2025-01-02 11:02:18', '2025-01-02 11:16:25', '847', 'Windows', '127.0.0.1', '2025-01-02 11:02:17', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1044, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'systemManagement', '4000', '业务中台', '400001', '系统管理', '40000109', '应用管理', '2025-01-02 11:16:25', '2025-01-02 14:48:45', '12739', 'Windows', '127.0.0.1', '2025-01-02 11:16:25', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1045, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '业务中台', '400001', '系统管理', '40000104', '菜单管理', '2025-01-02 14:53:39', '2025-01-02 15:04:12', '632', 'Windows', '127.0.0.1', '2025-01-02 14:53:39', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1046, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '系统配置', '400001', '系统管理', '40000104', '菜单管理', '2025-01-02 15:04:33', '2025-01-02 15:08:54', '261', 'Windows', '127.0.0.1', '2025-01-02 15:04:33', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1047, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '系统配置', '400001', '系统管理', '40000104', '菜单管理', '2025-01-02 15:08:57', '2025-01-02 15:11:30', '153', 'Windows', '127.0.0.1', '2025-01-02 15:08:57', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1048, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '系统配置', '400001', '系统管理', '40000103', '角色管理', '2025-01-02 15:11:30', '2025-01-02 15:12:50', '79', 'Windows', '127.0.0.1', '2025-01-02 15:11:30', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1049, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '系统配置', '400001', '系统管理', '40000104', '菜单管理', '2025-01-02 15:12:50', '2025-01-02 15:33:42', '1252', 'Windows', '127.0.0.1', '2025-01-02 15:12:49', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1050, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:05:36', '2025-01-16 17:39:09', '779613', 'Windows', '127.0.0.1', '2025-01-07 17:05:35', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1051, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:30:35', '2025-01-16 17:39:09', '778114', 'Macintosh', '127.0.0.1', '2025-01-07 17:30:35', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1052, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:33:07', '2025-01-16 17:39:09', '777962', 'Macintosh', '127.0.0.1', '2025-01-07 17:33:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1053, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:34:14', '2025-01-16 17:39:09', '777895', 'Macintosh', '127.0.0.1', '2025-01-07 17:34:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1054, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:35:38', '2025-01-16 17:39:09', '777811', 'Macintosh', '127.0.0.1', '2025-01-07 17:35:38', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1055, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:37:45', '2025-01-16 17:39:09', '777684', 'Macintosh', '127.0.0.1', '2025-01-07 17:37:44', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1056, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:38:14', '2025-01-16 17:39:09', '777655', 'Macintosh', '127.0.0.1', '2025-01-07 17:38:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1057, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:44:00', '2025-01-16 17:39:09', '777309', 'Windows', '127.0.0.1', '2025-01-07 17:44:00', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1058, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:44:40', '2025-01-16 17:39:09', '777269', 'Windows', '127.0.0.1', '2025-01-07 17:44:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1059, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:45:11', '2025-01-16 17:39:09', '777238', 'Macintosh', '127.0.0.1', '2025-01-07 17:45:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1060, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:12', '2025-01-16 17:39:09', '777117', 'Windows', '127.0.0.1', '2025-01-07 17:47:12', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1061, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:19', '2025-01-16 17:39:09', '777110', 'Windows', '127.0.0.1', '2025-01-07 17:47:18', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1062, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:22', '2025-01-16 17:39:09', '777107', 'Windows', '127.0.0.1', '2025-01-07 17:47:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1063, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:25', '2025-01-16 17:39:09', '777104', 'Windows', '127.0.0.1', '2025-01-07 17:47:25', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1064, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:28', '2025-01-16 17:39:09', '777101', 'Windows', '127.0.0.1', '2025-01-07 17:47:27', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1065, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:36', '2025-01-16 17:39:09', '777093', 'Windows', '127.0.0.1', '2025-01-07 17:47:36', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1066, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:47:40', '2025-01-16 17:39:09', '777089', 'Windows', '127.0.0.1', '2025-01-07 17:47:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1067, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:50:21', '2025-01-16 17:39:09', '776928', 'Windows', '127.0.0.1', '2025-01-07 17:50:20', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1068, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:51:13', '2025-01-16 17:39:09', '776876', 'Windows', '127.0.0.1', '2025-01-07 17:51:12', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1069, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-07 17:53:05', '2025-01-16 17:39:09', '776764', 'Macintosh', '127.0.0.1', '2025-01-07 17:53:05', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1070, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-08 13:20:29', '2025-01-16 17:39:09', '706720', 'Windows', '127.0.0.1', '2025-01-08 13:20:29', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1071, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-08 13:20:59', '2025-01-16 17:39:09', '706690', 'Windows', '127.0.0.1', '2025-01-08 13:20:59', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1072, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-09 09:07:51', '2025-01-16 17:39:09', '635478', 'Macintosh', '127.0.0.1', '2025-01-09 09:07:50', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1073, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-09 15:24:03', '2025-01-16 17:39:09', '612906', 'Macintosh', '127.0.0.1', '2025-01-09 15:24:02', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1074, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-13 16:55:21', '2025-01-16 17:39:09', '261828', 'Windows', '127.0.0.1', '2025-01-13 16:55:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1075, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-14 15:40:55', '2025-01-16 17:39:09', '179894', 'Macintosh', '127.0.0.1', '2025-01-14 15:40:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1076, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-14 16:26:53', '2025-01-16 17:39:09', '177136', 'Macintosh', '127.0.0.1', '2025-01-14 16:26:52', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1077, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-14 16:27:49', '2025-01-16 17:39:09', '177080', 'Macintosh', '127.0.0.1', '2025-01-14 16:27:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1078, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-14 16:35:18', '2025-01-16 17:39:09', '176631', 'Macintosh', '127.0.0.1', '2025-01-14 16:35:17', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1079, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-14 17:57:40', '2025-01-16 17:39:09', '171689', 'Windows', '127.0.0.1', '2025-01-14 17:57:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1080, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-15 10:24:41', '2025-01-16 17:39:09', '112468', 'Windows', '127.0.0.1', '2025-01-15 10:24:40', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1081, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 11:36:43', '2025-01-16 17:39:09', '21746', 'Windows', '127.0.0.1', '2025-01-16 11:36:43', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1082, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 13:40:42', '2025-01-16 17:39:09', '14307', 'Windows', '127.0.0.1', '2025-01-16 13:40:42', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1083, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 13:44:32', '2025-01-16 17:39:09', '14077', 'Windows', '127.0.0.1', '2025-01-16 13:44:32', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1084, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 13:44:51', '2025-01-16 17:39:09', '14058', 'Windows', '127.0.0.1', '2025-01-16 13:44:51', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1085, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 13:44:55', '2025-01-16 17:39:09', '14054', 'Windows', '127.0.0.1', '2025-01-16 13:44:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1086, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 14:03:26', '2025-01-16 17:39:09', '12943', 'Windows', '127.0.0.1', '2025-01-16 14:03:26', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1087, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 17:22:27', '2025-01-16 17:39:09', '1002', 'Windows', '127.0.0.1', '2025-01-16 17:22:26', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1088, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 17:23:01', '2025-01-16 17:39:09', '968', 'Windows', '127.0.0.1', '2025-01-16 17:23:00', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1089, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 17:32:01', '2025-01-16 17:39:09', '428', 'Windows', '127.0.0.1', '2025-01-16 17:32:01', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1090, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '系统配置', '400001', '系统管理', '40000103', '角色管理', '2025-01-16 17:32:39', '2025-01-16 17:37:31', '292', 'Windows', '127.0.0.1', '2025-01-16 17:32:39', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1091, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '系统配置', '400001', '系统管理', '40000103', '角色管理', '2025-01-16 17:37:34', '2025-01-16 17:39:09', '95', 'Windows', '127.0.0.1', '2025-01-16 17:37:34', NULL, 'null,退出');
INSERT INTO `sys_user_browse_record` VALUES (1092, 'Np5Av8Wm8Hr4Sq8Fh7Vz', 'developer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 17:39:14', '2025-01-16 17:42:00', '166', 'Windows', '127.0.0.1', '2025-01-16 17:39:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1093, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 17:42:04', '2025-01-17 10:34:37', '60752', 'Windows', '127.0.0.1', '2025-01-16 17:42:04', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1094, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 19:27:55', '2025-01-17 10:34:37', '54401', 'Windows', '127.0.0.1', '2025-01-16 19:27:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1095, 'Np5Av8Wm8Hr4Sq8Fh7Vz', 'developer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-17 10:34:39', '2025-01-17 10:34:52', '13', 'Windows', '127.0.0.1', '2025-01-17 10:34:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1096, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-17 10:34:55', '2025-01-17 10:35:18', '22', 'Windows', '127.0.0.1', '2025-01-17 10:34:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1097, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-19 14:17:03', '2025-02-14 17:48:30', '2259086', 'Windows', '127.0.0.1', '2025-01-19 14:17:03', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1098, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:27:02', '2025-02-14 17:48:30', '2190087', 'Windows', '127.0.0.1', '2025-01-20 09:27:02', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1099, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 10:57:06', '2025-02-14 17:48:30', '2184683', 'Windows', '127.0.0.1', '2025-01-20 10:57:05', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1100, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'menu', '4000', '系统配置', '400001', '系统管理', '40000104', '菜单管理', '2025-01-20 17:01:57', '2025-01-21 09:05:56', '57838', 'Windows', '127.0.0.1', '2025-01-20 17:01:56', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1101, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '系统配置', '400001', '系统管理', '40000101', '用户管理', '2025-01-21 14:11:05', '2025-01-21 14:11:07', '2', 'Windows', '127.0.0.1', '2025-01-21 14:11:05', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1102, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '系统配置', '400001', '系统管理', '40000103', '角色管理', '2025-01-21 14:11:07', '2025-01-21 14:11:32', '25', 'Windows', '127.0.0.1', '2025-01-21 14:11:07', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1103, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-11 09:40:17', '2025-02-14 17:48:30', '288492', 'Windows', '127.0.0.1', '2025-02-11 09:40:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1104, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-11 14:34:49', '2025-02-14 17:48:30', '270820', 'Windows', '127.0.0.1', '2025-02-11 14:34:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1105, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-11 15:45:28', '2025-02-14 17:48:30', '266581', 'Windows', '127.0.0.1', '2025-02-11 15:45:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1106, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-11 16:56:29', '2025-02-14 17:48:30', '262320', 'Windows', '127.0.0.1', '2025-02-11 16:56:29', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1107, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-14 09:24:50', '2025-02-14 17:48:30', '30219', 'Windows', '127.0.0.1', '2025-02-14 09:24:50', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1108, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 08:51:38', '2025-03-03 13:59:11', '1228052', 'Windows', '127.0.0.1', '2025-02-17 08:51:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1109, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 09:40:23', '2025-03-03 13:59:11', '1225127', 'Windows', '127.0.0.1', '2025-02-17 09:40:23', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1110, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 09:49:11', '2025-03-03 13:59:11', '1224599', 'Windows', '127.0.0.1', '2025-02-17 09:49:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1111, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 10:34:36', '2025-03-03 13:59:11', '1221874', 'Windows', '127.0.0.1', '2025-02-17 10:34:36', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1112, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 11:11:30', '2025-03-03 13:59:11', '1219660', 'Windows', '127.0.0.1', '2025-02-17 11:11:30', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1113, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 11:26:50', '2025-03-03 13:59:11', '1218740', 'Windows', '127.0.0.1', '2025-02-17 11:26:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1114, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 13:38:55', '2025-03-03 13:59:11', '1210815', 'Windows', '127.0.0.1', '2025-02-17 13:38:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1115, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 15:29:56', '2025-03-03 13:59:11', '1204154', 'Windows', '127.0.0.1', '2025-02-17 15:29:56', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1116, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 15:30:15', '2025-03-03 13:59:11', '1204135', 'Windows', '127.0.0.1', '2025-02-17 15:30:15', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1117, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 15:34:22', '2025-03-03 13:59:11', '1203888', 'Windows', '127.0.0.1', '2025-02-17 15:34:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1118, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 15:35:34', '2025-03-03 13:59:11', '1203816', 'Windows', '127.0.0.1', '2025-02-17 15:35:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1119, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 15:37:10', '2025-03-03 13:59:11', '1203720', 'Windows', '127.0.0.1', '2025-02-17 15:37:10', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1120, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 15:44:28', '2025-03-03 13:59:11', '1203282', 'Windows', '127.0.0.1', '2025-02-17 15:44:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1121, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-17 17:00:29', '2025-03-03 13:59:11', '1198721', 'Windows', '127.0.0.1', '2025-02-17 17:00:29', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1122, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 09:01:10', '2025-03-03 13:59:11', '1141080', 'Windows', '127.0.0.1', '2025-02-18 09:01:10', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1123, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 10:44:08', '2025-03-03 13:59:11', '1134902', 'Windows', '127.0.0.1', '2025-02-18 10:44:07', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1124, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 10:44:23', '2025-03-03 13:59:11', '1134887', 'Windows', '127.0.0.1', '2025-02-18 10:44:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1125, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 11:16:28', '2025-03-03 13:59:11', '1132962', 'Windows', '127.0.0.1', '2025-02-18 11:16:27', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1126, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 11:52:38', '2025-03-03 13:59:11', '1130792', 'Windows', '127.0.0.1', '2025-02-18 11:52:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1127, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 12:43:11', '2025-03-03 13:59:11', '1127759', 'Windows', '127.0.0.1', '2025-02-18 12:43:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1128, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 17:02:24', '2025-03-03 13:59:11', '1112206', 'Windows', '127.0.0.1', '2025-02-18 17:02:23', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1129, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-19 14:28:00', '2025-03-03 13:59:11', '1035070', 'Windows', '127.0.0.1', '2025-02-19 14:28:00', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1130, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-20 12:50:52', '2025-03-03 13:59:11', '954498', 'Windows', '127.0.0.1', '2025-02-20 12:50:51', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1131, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-20 15:09:42', '2025-03-03 13:59:11', '946168', 'Windows', '127.0.0.1', '2025-02-20 15:09:42', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1132, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-20 16:34:29', '2025-03-03 13:59:11', '941081', 'Windows', '127.0.0.1', '2025-02-20 16:34:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1133, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-20 22:06:57', '2025-03-03 13:59:11', '921133', 'Windows', '127.0.0.1', '2025-02-20 22:06:56', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1134, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-20 22:17:25', '2025-03-03 13:59:11', '920505', 'Windows', '127.0.0.1', '2025-02-20 22:17:24', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1135, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-24 09:09:43', '2025-03-03 13:59:11', '622167', 'Windows', '127.0.0.1', '2025-02-24 09:09:42', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1136, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-24 10:57:34', '2025-03-03 13:59:11', '615696', 'Windows', '127.0.0.1', '2025-02-24 10:57:34', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1137, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-24 15:50:55', '2025-03-03 13:59:11', '598095', 'Windows', '127.0.0.1', '2025-02-24 15:50:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1138, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-24 17:24:13', '2025-03-03 13:59:11', '592497', 'Macintosh', '127.0.0.1', '2025-02-24 17:24:12', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1139, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-24 17:24:36', '2025-03-03 13:59:11', '592474', 'Macintosh', '127.0.0.1', '2025-02-24 17:24:35', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1140, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-25 10:09:35', '2025-03-03 13:59:11', '532175', 'Macintosh', '127.0.0.1', '2025-02-25 10:09:35', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1141, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-25 13:02:11', '2025-03-03 13:59:11', '521819', 'Windows', '127.0.0.1', '2025-02-25 13:02:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1142, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-25 13:28:19', '2025-03-03 13:59:11', '520251', 'Macintosh', '127.0.0.1', '2025-02-25 13:28:19', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1143, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-25 14:27:28', '2025-03-03 13:59:11', '516702', 'Windows', '127.0.0.1', '2025-02-25 14:27:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1144, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-25 20:04:18', '2025-03-03 13:59:11', '496492', 'Windows', '127.0.0.1', '2025-02-25 20:04:17', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1145, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 08:56:40', '2025-03-03 13:59:11', '450150', 'Windows', '127.0.0.1', '2025-02-26 08:56:39', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1146, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 14:04:59', '2025-03-03 13:59:11', '431651', 'Windows', '127.0.0.1', '2025-02-26 14:04:58', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1147, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 14:41:50', '2025-03-03 13:59:11', '429440', 'Windows', '127.0.0.1', '2025-02-26 14:41:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1148, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 14:52:24', '2025-03-03 13:59:11', '428806', 'Windows', '127.0.0.1', '2025-02-26 14:52:23', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1149, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 14:57:42', '2025-03-03 13:59:11', '428488', 'Windows', '127.0.0.1', '2025-02-26 14:57:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1150, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 22:10:33', '2025-03-03 13:59:11', '402517', 'Windows', '127.0.0.1', '2025-02-26 22:10:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1151, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-27 08:45:15', '2025-03-03 13:59:11', '364435', 'Windows', '127.0.0.1', '2025-02-27 08:45:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1152, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-27 09:38:50', '2025-03-03 13:59:11', '361220', 'Windows', '127.0.0.1', '2025-02-27 09:38:49', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1153, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-27 09:45:37', '2025-03-03 13:59:11', '360813', 'Windows', '127.0.0.1', '2025-02-27 09:45:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1154, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-27 12:54:22', '2025-03-03 13:59:11', '349488', 'Windows', '127.0.0.1', '2025-02-27 12:54:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1155, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-27 15:40:48', '2025-03-03 13:59:11', '339502', 'Windows', '127.0.0.1', '2025-02-27 15:40:48', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1156, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-27 21:31:57', '2025-03-03 13:59:11', '318433', 'Windows', '127.0.0.1', '2025-02-27 21:31:57', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1157, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-28 08:53:48', '2025-03-03 13:59:11', '277522', 'Windows', '127.0.0.1', '2025-02-28 08:53:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1158, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-28 10:31:26', '2025-03-03 13:59:11', '271664', 'Windows', '127.0.0.1', '2025-02-28 10:31:25', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1159, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-28 10:34:47', '2025-03-03 13:59:11', '271463', 'Windows', '127.0.0.1', '2025-02-28 10:34:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1160, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-28 11:37:47', '2025-03-03 13:59:11', '267683', 'Windows', '127.0.0.1', '2025-02-28 11:37:47', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1161, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-28 12:42:56', '2025-03-03 13:59:11', '263774', 'Windows', '127.0.0.1', '2025-02-28 12:42:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1162, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 12:08:19', '2025-03-03 13:59:11', '179451', 'Windows', '127.0.0.1', '2025-03-01 12:08:18', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1163, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 20:31:41', '2025-03-03 13:59:11', '149249', 'Windows', '127.0.0.1', '2025-03-01 20:31:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1164, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 20:31:51', '2025-03-03 13:59:11', '149239', 'Windows', '127.0.0.1', '2025-03-01 20:31:51', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1165, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 23:04:42', '2025-03-03 13:59:11', '140068', 'Windows', '127.0.0.1', '2025-03-01 23:04:41', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1166, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 23:07:08', '2025-03-03 13:59:11', '139922', 'Windows', '127.0.0.1', '2025-03-01 23:07:07', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1167, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 07:55:38', '2025-03-03 13:59:11', '108212', 'Windows', '127.0.0.1', '2025-03-02 07:55:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1168, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 17:45:08', '2025-03-03 13:59:11', '72842', 'Windows', '127.0.0.1', '2025-03-02 17:45:08', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1169, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 17:49:18', '2025-03-03 13:59:11', '72592', 'Windows', '127.0.0.1', '2025-03-02 17:49:17', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1170, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 17:51:46', '2025-03-03 13:59:11', '72444', 'Windows', '127.0.0.1', '2025-03-02 17:51:46', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1171, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 09:22:24', '2025-03-03 13:59:11', '16606', 'Windows', '127.0.0.1', '2025-03-03 09:22:23', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1172, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 13:59:17', '2025-03-04 18:26:59', '102462', 'Windows', '127.0.0.1', '2025-03-03 13:59:16', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1173, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 15:18:33', '2025-03-04 18:26:59', '97706', 'Windows', '127.0.0.1', '2025-03-03 15:18:33', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1174, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 15:23:26', '2025-03-04 18:26:59', '97413', 'Windows', '127.0.0.1', '2025-03-03 15:23:26', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1175, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 15:38:07', '2025-03-04 18:26:59', '96532', 'Macintosh', '127.0.0.1', '2025-03-03 15:38:06', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1176, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 16:21:07', '2025-03-04 18:26:59', '93952', 'Windows', '127.0.0.1', '2025-03-03 16:21:07', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1177, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-04 09:55:27', '2025-03-04 18:26:59', '30692', 'Windows', '127.0.0.1', '2025-03-04 09:55:26', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1178, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-04 10:28:55', '2025-03-04 18:26:59', '28684', 'Windows', '127.0.0.1', '2025-03-04 10:28:54', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1179, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'user', '4000', '系统配置', '400001', '系统管理', '40000101', '用户管理', '2025-03-04 11:05:20', '2025-03-04 15:51:36', '17176', 'Windows', '127.0.0.1', '2025-03-04 11:05:20', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1180, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-05 09:35:29', '2025-03-06 18:09:19', '117230', 'Windows', '127.0.0.1', '2025-03-05 09:35:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1181, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-06 10:00:21', '2025-03-06 18:09:19', '29338', 'Windows', '127.0.0.1', '2025-03-06 10:00:21', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1182, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-06 13:04:04', '2025-03-06 18:09:19', '18315', 'Windows', '127.0.0.1', '2025-03-06 13:04:03', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1183, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-06 13:04:12', '2025-03-06 18:09:19', '18307', 'Windows', '127.0.0.1', '2025-03-06 13:04:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1184, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-06 17:40:11', '2025-03-06 18:09:19', '1748', 'Windows', '127.0.0.1', '2025-03-06 17:40:11', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1185, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-06 17:49:19', '2025-03-06 18:09:19', '1200', 'Windows', '127.0.0.1', '2025-03-06 17:49:19', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1186, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-06 17:56:50', '2025-03-06 18:09:19', '749', 'Windows', '127.0.0.1', '2025-03-06 17:56:50', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1187, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-07 09:54:15', '2025-03-10 10:34:50', '261634', 'Windows', '127.0.0.1', '2025-03-07 09:54:14', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1188, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-09 09:08:46', '2025-03-10 10:34:50', '91563', 'Windows', '127.0.0.1', '2025-03-09 09:08:45', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1189, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-09 09:09:22', '2025-03-10 10:34:50', '91527', 'Windows', '127.0.0.1', '2025-03-09 09:09:22', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1190, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-09 09:11:34', '2025-03-10 10:34:50', '91395', 'Windows', '127.0.0.1', '2025-03-09 09:11:34', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1191, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 08:57:15', '2025-03-10 10:34:50', '5854', 'Windows', '127.0.0.1', '2025-03-10 08:57:15', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1192, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 09:29:45', '2025-03-10 10:34:50', '3904', 'Windows', '127.0.0.1', '2025-03-10 09:29:44', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1193, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 10:02:57', '2025-03-10 10:34:50', '1912', 'Windows', '127.0.0.1', '2025-03-10 10:02:57', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1194, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 13:01:10', '2025-03-11 16:41:51', '99640', 'Macintosh', '127.0.0.1', '2025-03-10 13:01:09', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1195, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 14:14:28', '2025-03-11 16:41:51', '95242', 'Windows', '127.0.0.1', '2025-03-10 14:14:28', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1196, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 14:14:31', '2025-03-11 16:41:51', '95239', 'Windows', '127.0.0.1', '2025-03-10 14:14:31', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1197, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 14:16:42', '2025-03-11 16:41:51', '95108', 'Macintosh', '127.0.0.1', '2025-03-10 14:16:42', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1198, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 15:52:40', '2025-03-11 16:41:51', '89350', 'Windows', '127.0.0.1', '2025-03-10 15:52:40', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1199, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 16:26:37', '2025-03-11 16:41:51', '87313', 'Macintosh', '127.0.0.1', '2025-03-10 16:26:37', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1200, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 09:28:03', '2025-03-11 16:41:51', '26027', 'Macintosh', '127.0.0.1', '2025-03-11 09:28:02', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1201, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 15:10:56', '2025-03-11 16:41:51', '5454', 'Windows', '127.0.0.1', '2025-03-11 15:10:55', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1202, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 15:22:02', '2025-03-11 16:41:51', '4788', 'Macintosh', '127.0.0.1', '2025-03-11 15:22:01', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1203, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 16:34:32', '2025-03-11 16:41:51', '438', 'Windows', '127.0.0.1', '2025-03-11 16:34:31', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1204, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 16:36:49', '2025-03-11 16:41:51', '301', 'Macintosh', '127.0.0.1', '2025-03-11 16:36:48', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1205, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '系统配置', '400001', '系统管理', '40000103', '角色管理', '2025-03-11 16:39:05', '2025-03-11 16:40:04', '59', 'Windows', '127.0.0.1', '2025-03-11 16:39:04', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1206, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 16:40:24', '2025-03-11 16:41:51', '86', 'Macintosh', '127.0.0.1', '2025-03-11 16:40:23', NULL, '登录,退出');
INSERT INTO `sys_user_browse_record` VALUES (1207, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '系统配置', '400001', '系统管理', '40000103', '角色管理', '2025-03-11 16:42:28', '2025-03-11 16:42:48', '19', 'Windows', '127.0.0.1', '2025-03-11 16:42:28', NULL, 'null,菜单');
INSERT INTO `sys_user_browse_record` VALUES (1208, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 16:42:54', NULL, NULL, 'Windows', '127.0.0.1', '2025-03-11 16:42:54', NULL, '登录');
INSERT INTO `sys_user_browse_record` VALUES (1209, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-11 16:43:24', NULL, NULL, 'Windows', '127.0.0.1', '2025-03-11 16:43:24', NULL, '登录');
INSERT INTO `sys_user_browse_record` VALUES (1210, 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '管理员', 'role', '4000', '系统配置', '400001', '系统管理', '40000103', '角色管理', '2025-03-11 16:43:25', '2025-03-11 17:05:55', '1349', 'Windows', '127.0.0.1', '2025-03-11 16:43:25', NULL, 'null,菜单');

-- ----------------------------
-- Table structure for sys_user_jpushid
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_jpushid`;
CREATE TABLE `sys_user_jpushid`  (
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `registration_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '极光ID',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别，ios、android',
  `time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_jpushid
-- ----------------------------

-- ----------------------------
-- Table structure for sys_voice_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_voice_file`;
CREATE TABLE `sys_voice_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id(主键)',
  `org_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原始文件名',
  `path_filename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器文件名带路径',
  `voice_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '声音名称',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` bit(1) NULL DEFAULT NULL COMMENT '逻辑删除 1是 0否',
  `reserve1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `reserve2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `reserve3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inx_sys_voice_file`(`org_name`, `path_filename`, `voice_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '音频文件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_voice_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_voice_netbox
-- ----------------------------
DROP TABLE IF EXISTS `sys_voice_netbox`;
CREATE TABLE `sys_voice_netbox`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id(主键)',
  `box_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '音箱编码',
  `box_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '音箱名称',
  `box_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '音箱IP地址',
  `brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂商',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '型号',
  `is_delete` bit(1) NULL DEFAULT NULL COMMENT '逻辑删除 1是 0否',
  `reserve1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `reserve2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `reserve3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inx_sys_voice_netbox`(`box_code`, `box_ip`, `box_name`, `is_delete`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_voice_netbox
-- ----------------------------

-- ----------------------------
-- Table structure for sys_warning_type_def
-- ----------------------------
DROP TABLE IF EXISTS `sys_warning_type_def`;
CREATE TABLE `sys_warning_type_def`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id(主键)',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型编码,用户可自主编写',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型中文名称',
  `node_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型: 0:目录(父节点) 1:类型(节点)',
  `parent_id` int(20) NULL DEFAULT NULL COMMENT '父节点ID',
  `node_path` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全局节点路径',
  `node_pathname` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全局节点路径(以节点名称显示)',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户ID',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户ID',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_delete` bit(1) NULL DEFAULT NULL COMMENT '逻辑删除 1是 0否',
  `reserve1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `reserve2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  `reserve3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inx_sys_warning_type_def`(`parent_id`, `node_path`, `code`, `node_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_warning_type_def
-- ----------------------------
INSERT INTO `sys_warning_type_def` VALUES (1, '', 'IOT告警消息', '0', 0, '0', 'root', 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '2024-08-26 14:48:43', NULL, NULL, b'0', '', NULL, NULL);
INSERT INTO `sys_warning_type_def` VALUES (2, '0001', 'IOT告警', '1', 1, '0/1', 'root/IOT告警消息', 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '2024-08-26 14:49:10', NULL, NULL, b'0', '', NULL, NULL);
INSERT INTO `sys_warning_type_def` VALUES (3, '', 'test', '0', 1, '0/1', 'root/IOT告警消息', 'Ft8Bx1Kj9Xr1Ps6Oi7Lq', '2024-08-30 11:32:10', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '2024-08-30 11:32:10', b'1', '', NULL, NULL);
INSERT INTO `sys_warning_type_def` VALUES (4, '', 'test', '0', 1, '0/1', 'root/IOT告警消息', 'Cw0Jc4Wf3Fx8Wf6Bh8Xh', '2024-08-30 11:37:18', NULL, NULL, b'0', '', NULL, NULL);

-- ----------------------------
-- Table structure for systemhead
-- ----------------------------
DROP TABLE IF EXISTS `systemhead`;
CREATE TABLE `systemhead`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `image` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统头部logo',
  `systemname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统头部标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统头部标题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of systemhead
-- ----------------------------
INSERT INTO `systemhead` VALUES (1, 'add', '信云凝智物联网平台');

SET FOREIGN_KEY_CHECKS = 1;
