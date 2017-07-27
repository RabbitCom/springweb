/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50545
Source Host           : 127.0.0.1:3306
Source Database       : nezha_test

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2017-07-26 16:33:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `imgPath` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '道德经', '老子', '', '2017-05-08 16:20:44', 'img/11.jpg', null);
INSERT INTO `article` VALUES ('2', '基督山伯爵', '大仲马', null, '2017-05-02 16:21:35', 'img/22.jpg', null);
INSERT INTO `article` VALUES ('3', '巴黎圣母院', '雨果', null, '2017-05-01 16:22:19', 'img/33.jpg', null);
INSERT INTO `article` VALUES ('4', '昆虫记', '法布尔', null, null, 'img/44.jpg', null);
INSERT INTO `article` VALUES ('5', '苏菲的世界', '乔斯坦·贾德', null, null, 'img/55.jpg', null);
INSERT INTO `article` VALUES ('6', '静静的顿河', '肖洛霍夫', null, null, 'img/66.jpg', null);
INSERT INTO `article` VALUES ('7', '复活', '托尔斯泰', null, null, 'img/77.jpg', null);
INSERT INTO `article` VALUES ('8', '小王子', '埃克苏佩里', null, null, 'img/12.jpg', null);
INSERT INTO `article` VALUES ('9', '追忆似水年', '马塞尔·普鲁斯特', null, null, 'img/12.jpg', null);
INSERT INTO `article` VALUES ('10', '悲惨世界', '雨果', null, null, 'img/12.jpg', null);
INSERT INTO `article` VALUES ('11', '穆斯林的葬礼', '霍达', null, null, 'img/12.jpg', null);
INSERT INTO `article` VALUES ('12', '徐霞客游记', '徐霞客', null, null, 'img/12.jpg', null);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `art_id` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '1', '');
INSERT INTO `book` VALUES ('2', '2', '');
INSERT INTO `book` VALUES ('3', '3', '');
INSERT INTO `book` VALUES ('4', '4', '《昆虫记》是法国杰出昆虫学家、文学家法布尔的主要著作。也叫做《昆虫物语》、《昆虫学札记》和《昆虫世界》此作品涵盖了法布尔一生对昆虫（当中几册也描述了蜘蛛）的观察与研究，也是作品主要中心；当中也穿插了许多法布尔人生的种种经历，包括童年时期、教书的时期等。法布尔耗费一生的光阴来观察、研究“虫子”，为“虫子”写出十卷大部头的书，字里行间洋溢着作者本人对生命的尊重与热爱。在本书中，作者将专业知识与人生感悟融于一炉，娓娓道来，在对一种种昆虫的日常生活习性、特征的描述中体现出作者对生活世事特有的眼光。');
INSERT INTO `book` VALUES ('5', '5', '从这一天开始，苏菲不断接到一些极不寻常的来信，世界像谜团一般在她眼底展开。她运用少女天生的悟性与后天知识，企图解开这些谜团。然而，魔镜、少校的小屋、黎巴嫩寄来给席德明信片、会说话的汉密士、叫她席德的艾伯特、写着生日祝福的香蕉皮、现实出现的梦中的金十字架、捡到的10元硬币……接迥而至的奇闻怪事让苏菲一步步走下去。事实真相远比她所想的更怪异、 更离奇……');
INSERT INTO `book` VALUES ('6', '6', '一九一六年。十月。夜。风和雨。林木繁茂的低地。一片丛生着赤杨的沼泽边上是战壕。前面是一层一层的铁丝网。战壕里是冰冷的稀泥。监视哨的湿漉漉的铁护板闪着黯光。从处处的土屋里透出稀疏的光亮。一个矮小健壮的军官在一间军官住的土屋门口站了一会儿；他的湿淋淋的手指在衣扣上滑着，匆匆地解开军大衣，抖落领子上的水珠，很快在踏烂的干草上擦了擦长筒靴，这才推开门，弯腰走进土屋。');
INSERT INTO `book` VALUES ('7', '7', '该书取材于一件真实事件，主要描写男主人公聂赫留朵夫引诱姑妈家女仆玛丝洛娃，使她怀孕并被赶出家门。后来，她沦为妓女，因被指控谋财害命而受审判。男主人公以陪审员的身份出庭，见到从前被他引诱的女人，深受良心谴责。他为她奔走伸冤，并请求同她结婚，以赎回自己的罪过。上诉失败后，他陪她流放西伯利亚。他的行为感动了她，使她重新爱他。但为了不损害他的名誉和地位，她最终没有和他结婚而同一个革命者结为伉俪。');
INSERT INTO `book` VALUES ('8', '8', '《小王子》是法国作家安托万·德·圣·埃克苏佩里于1942年写成的著名儿童文学短篇小说。本书的主人公是来自外星球的小王子。书中以一位飞行员作为故事叙述者，讲述了小王子从自己星球出发前往地球的过程中，所经历的各种历险。作者以小王子的孩子式的眼光，透视出成人的空虚、盲目，愚妄和死板教条，用浅显天真的语言写出了人类的孤独寂寞、没有根基随风流浪的命运。同时，也表达出作者对金钱关系的批判，对真善美的讴歌。');
INSERT INTO `book` VALUES ('9', '9', '这是一部与传统小说不同的长篇小说。全书共七大卷，以叙述者“我”为主体，将其所见所闻所思所感融合一体，既有对社会生活，人情世态的真实描写，又是一份作者自我追求，自我认识的内心经历的记录。除叙事以外，还包含有大量的感想和议论。整部作品没有中心人物，没有完整的故事，没有波澜起伏，只有贯穿始终的情节线索。它大体以叙述者的生活经历和内心活动为轴心，穿插描写了大量的人物事件，犹如一棵枝丫交错的大树，可以说是在一部主要小说上派生着许多独立成篇的其他小说，也可以说是一部交织着好几个主题曲的巨大交响乐');
INSERT INTO `book` VALUES ('10', '10', '十九世纪的巴黎，贫苦的冉·阿让为了挨饿的孩子去偷面包，结果被饱食终日的法官判处19年的苦役。出狱后，走投无路的冉·阿让被好心的米里哀主教收留过夜，却偷走了主教的银器潜逃，后被警察捉回。主教声称银器是送给他的，使冉·阿让免于被捕。主教的言行感化了冉·阿让，他化名马德兰，从此洗心革面奋发向上，十年后成为成功的商人并当上市长。这时，以前缉拿过他的警长沙威出现，一心要找他的麻烦。在此期间，冉·阿让得知了妓女芳汀的悲惨遭遇，并承诺照顾她的私生女柯赛特');
INSERT INTO `book` VALUES ('11', '11', '古都京华老字号玉器行“奇珍斋”的梁亦清，原是回族底层的琢玉艺人，他家有两个女儿，长女君璧和次女冰玉。本书主人公韩子奇因摔碎了梁亦清做的碗而决定留下当学徒。师徒两人正为一件订货劳作，这是专做洋人买卖的“汇远斋”定做的“郑和航海船”。郑和是回族的英雄，他们决心做好这件光耀民族精神的作品，三年的精雕细刻将在中秋佳节完成。不料梁亦清突然晕倒在转动着的玉坨上，宝船被毁，人也丧命。为了抵债，梁家将奇珍斋转给落井下石的汇远斋老板，韩子奇则为了报仇潜伏到“汇远斋”当了学徒');
INSERT INTO `book` VALUES ('12', '12', '《徐霞客游记》是中国最早的一部详细记录所经地理环境的游记，也是世界上最早记述岩溶地貌并详细考证其成因的书籍。徐霞客一生除了家中发生重大事件外，几乎没有停止他的旅行，并详细记录了途中所见，是地理学家和考古学家不可多得的研究材料。《徐霞客游记》自明崇祯十五年（1642年）的初版到1985年朱惠荣的校注本。已出版38次，相关的研究论文有139篇，让人刮目相看。');

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `speci_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES ('1', '采矿小二班', '8');
INSERT INTO `class_info` VALUES ('2', '软件1班', '8');
INSERT INTO `class_info` VALUES ('3', '金融3班', '2');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '12', 'nezha');
INSERT INTO `customer` VALUES ('2', '18', 'meinv');
INSERT INTO `customer` VALUES ('3', '19', 'xiaohu');
INSERT INTO `customer` VALUES ('4', '22', 'xiaoxin');
INSERT INTO `customer` VALUES ('5', '22', 'xiaoxin');

-- ----------------------------
-- Table structure for mark_info
-- ----------------------------
DROP TABLE IF EXISTS `mark_info`;
CREATE TABLE `mark_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '学生姓名',
  `subject_id` int(11) DEFAULT NULL COMMENT '学生课程名称',
  `class_id` int(11) DEFAULT NULL,
  `spec_field_id` int(11) DEFAULT NULL COMMENT '学生所在专业',
  `stu_number` bigint(20) DEFAULT NULL COMMENT '学生学号',
  `score` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '学生成绩',
  `cla_grades` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '学生班级排名',
  `gra_grades` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '学生年级排名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mark_info
-- ----------------------------
INSERT INTO `mark_info` VALUES ('1', 'aaaa', '2', '1', '7', '311208000801', '60', '30', '30');
INSERT INTO `mark_info` VALUES ('2', 'bbbb', null, null, null, '2111111', '43', null, null);
INSERT INTO `mark_info` VALUES ('3', 'ffff', null, null, null, '211111331', '66', null, null);

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '组织名',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `code` varchar(64) NOT NULL COMMENT '编号',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级主键',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '总经办', '王家桥', '01', 'fi-social-windows', null, '0', '2014-02-19 01:00:00');
INSERT INTO `organization` VALUES ('3', '技术部', '', '02', 'fi-social-github', null, '1', '2015-10-01 13:10:42');
INSERT INTO `organization` VALUES ('5', '产品部', '', '03', 'fi-social-apple', null, '2', '2015-12-06 12:15:30');
INSERT INTO `organization` VALUES ('6', '测试组', '', '04', 'fi-social-snapchat', '3', '0', '2015-12-06 13:12:18');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '资源名称',
  `url` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `open_mode` varchar(32) DEFAULT NULL COMMENT '打开方式 ajax,iframe',
  `description` varchar(255) DEFAULT NULL COMMENT '资源介绍',
  `icon` varchar(32) DEFAULT NULL COMMENT '资源图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级资源id',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `opened` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打开状态',
  `resource_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '资源类别',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '权限管理', '', null, '系统管理', 'fi-folder', null, '0', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('11', '资源管理', '/resource/manager', 'ajax', '资源管理', 'fi-database', '1', '1', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('12', '角色管理', '/role/manager', 'ajax', '角色管理', 'fi-torso-business', '1', '2', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('13', '用户管理', '/user/manager', 'ajax', '用户管理', 'fi-torsos-all', '1', '3', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('14', '部门管理', '/organization/manager', 'ajax', '部门管理', 'fi-results-demographics', '1', '4', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('111', '列表', '/resource/treeGrid', 'ajax', '资源列表', 'fi-list', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('112', '添加', '/resource/add', 'ajax', '资源添加', 'fi-page-add', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('113', '编辑', '/resource/edit', 'ajax', '资源编辑', 'fi-page-edit', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('114', '删除', '/resource/delete', 'ajax', '资源删除', 'fi-page-delete', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('121', '列表', '/role/dataGrid', 'ajax', '角色列表', 'fi-list', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('122', '添加', '/role/add', 'ajax', '角色添加', 'fi-page-add', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('123', '编辑', '/role/edit', 'ajax', '角色编辑', 'fi-page-edit', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('124', '删除', '/role/delete', 'ajax', '角色删除', 'fi-page-delete', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('125', '授权', '/role/grant', 'ajax', '角色授权', 'fi-check', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('131', '列表', '/user/dataGrid', 'ajax', '用户列表', 'fi-list', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('132', '添加', '/user/add', 'ajax', '用户添加', 'fi-page-add', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('133', '编辑', '/user/edit', 'ajax', '用户编辑', 'fi-page-edit', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('134', '删除', '/user/delete', 'ajax', '用户删除', 'fi-page-delete', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('141', '列表', '/organization/treeGrid', 'ajax', '用户列表', 'fi-list', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('142', '添加', '/organization/add', 'ajax', '部门添加', 'fi-page-add', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('143', '编辑', '/organization/edit', 'ajax', '部门编辑', 'fi-page-edit', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('144', '删除', '/organization/delete', 'ajax', '部门删除', 'fi-page-delete', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('221', '日志监控', '', null, null, 'fi-folder', null, '3', '0', '0', '0', '2015-12-01 11:44:20');
INSERT INTO `resource` VALUES ('222', '视频教程', '', null, null, 'fi-folder', null, '2', '0', '0', '0', '2015-12-06 12:40:42');
INSERT INTO `resource` VALUES ('223', '官方网站', 'https://www.dreamlu.net', 'iframe', null, 'fi-home', '222', '0', '0', '1', '0', '2015-12-06 12:42:42');
INSERT INTO `resource` VALUES ('224', 'jfinal视频', 'http://blog.dreamlu.net/blog/79', 'iframe', null, 'fi-video', '222', '1', '0', '1', '0', '2015-12-06 12:45:28');
INSERT INTO `resource` VALUES ('226', '修改密码', '/user/editPwdPage', 'ajax', null, 'fi-unlock', null, '4', '0', '1', '1', '2015-12-07 20:23:06');
INSERT INTO `resource` VALUES ('227', '登录日志', '/sysLog/manager', 'ajax', null, 'fi-info', '221', '0', '0', '1', '0', '2016-09-30 22:10:53');
INSERT INTO `resource` VALUES ('228', 'Druid监控', '/druid', 'iframe', null, 'fi-monitor', '221', '0', '0', '1', '0', '2016-09-30 22:12:50');
INSERT INTO `resource` VALUES ('229', '系统图标', '/icons.html', 'ajax', null, 'fi-photo', '221', '0', '0', '1', '0', '2016-12-24 15:53:47');
INSERT INTO `resource` VALUES ('230', '文章管理', '', 'ajax', null, 'fi-page-multiple', null, '1', '0', '0', '0', '2016-12-24 15:53:47');
INSERT INTO `resource` VALUES ('231', '新建文章', '/article/create', 'ajax', null, 'fi-page-edit', '230', '0', '0', '1', '0', '2016-12-24 15:53:47');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '角色名',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序号',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '0', '超级管理员', '0');
INSERT INTO `role` VALUES ('2', 'de', '0', '技术部经理', '0');
INSERT INTO `role` VALUES ('7', 'pm', '0', '产品部经理', '0');
INSERT INTO `role` VALUES ('8', 'test', '0', '测试账户', '0');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  `resource_id` bigint(19) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`),
  KEY `idx_role_resource_ids` (`role_id`,`resource_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8 COMMENT='角色资源';

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('409', '1', '1');
INSERT INTO `role_resource` VALUES ('410', '1', '11');
INSERT INTO `role_resource` VALUES ('415', '1', '12');
INSERT INTO `role_resource` VALUES ('421', '1', '13');
INSERT INTO `role_resource` VALUES ('426', '1', '14');
INSERT INTO `role_resource` VALUES ('411', '1', '111');
INSERT INTO `role_resource` VALUES ('412', '1', '112');
INSERT INTO `role_resource` VALUES ('413', '1', '113');
INSERT INTO `role_resource` VALUES ('414', '1', '114');
INSERT INTO `role_resource` VALUES ('416', '1', '121');
INSERT INTO `role_resource` VALUES ('417', '1', '122');
INSERT INTO `role_resource` VALUES ('418', '1', '123');
INSERT INTO `role_resource` VALUES ('419', '1', '124');
INSERT INTO `role_resource` VALUES ('420', '1', '125');
INSERT INTO `role_resource` VALUES ('422', '1', '131');
INSERT INTO `role_resource` VALUES ('423', '1', '132');
INSERT INTO `role_resource` VALUES ('424', '1', '133');
INSERT INTO `role_resource` VALUES ('425', '1', '134');
INSERT INTO `role_resource` VALUES ('427', '1', '141');
INSERT INTO `role_resource` VALUES ('428', '1', '142');
INSERT INTO `role_resource` VALUES ('429', '1', '143');
INSERT INTO `role_resource` VALUES ('430', '1', '144');
INSERT INTO `role_resource` VALUES ('434', '1', '221');
INSERT INTO `role_resource` VALUES ('431', '1', '222');
INSERT INTO `role_resource` VALUES ('432', '1', '223');
INSERT INTO `role_resource` VALUES ('433', '1', '224');
INSERT INTO `role_resource` VALUES ('435', '1', '227');
INSERT INTO `role_resource` VALUES ('436', '1', '228');
INSERT INTO `role_resource` VALUES ('437', '2', '1');
INSERT INTO `role_resource` VALUES ('438', '2', '13');
INSERT INTO `role_resource` VALUES ('439', '2', '131');
INSERT INTO `role_resource` VALUES ('440', '2', '132');
INSERT INTO `role_resource` VALUES ('441', '2', '133');
INSERT INTO `role_resource` VALUES ('445', '2', '221');
INSERT INTO `role_resource` VALUES ('442', '2', '222');
INSERT INTO `role_resource` VALUES ('443', '2', '223');
INSERT INTO `role_resource` VALUES ('444', '2', '224');
INSERT INTO `role_resource` VALUES ('446', '2', '227');
INSERT INTO `role_resource` VALUES ('447', '2', '228');
INSERT INTO `role_resource` VALUES ('158', '3', '1');
INSERT INTO `role_resource` VALUES ('159', '3', '11');
INSERT INTO `role_resource` VALUES ('164', '3', '12');
INSERT INTO `role_resource` VALUES ('170', '3', '13');
INSERT INTO `role_resource` VALUES ('175', '3', '14');
INSERT INTO `role_resource` VALUES ('160', '3', '111');
INSERT INTO `role_resource` VALUES ('161', '3', '112');
INSERT INTO `role_resource` VALUES ('162', '3', '113');
INSERT INTO `role_resource` VALUES ('163', '3', '114');
INSERT INTO `role_resource` VALUES ('165', '3', '121');
INSERT INTO `role_resource` VALUES ('166', '3', '122');
INSERT INTO `role_resource` VALUES ('167', '3', '123');
INSERT INTO `role_resource` VALUES ('168', '3', '124');
INSERT INTO `role_resource` VALUES ('169', '3', '125');
INSERT INTO `role_resource` VALUES ('171', '3', '131');
INSERT INTO `role_resource` VALUES ('172', '3', '132');
INSERT INTO `role_resource` VALUES ('173', '3', '133');
INSERT INTO `role_resource` VALUES ('174', '3', '134');
INSERT INTO `role_resource` VALUES ('176', '3', '141');
INSERT INTO `role_resource` VALUES ('177', '3', '142');
INSERT INTO `role_resource` VALUES ('178', '3', '143');
INSERT INTO `role_resource` VALUES ('179', '3', '144');
INSERT INTO `role_resource` VALUES ('359', '7', '1');
INSERT INTO `role_resource` VALUES ('360', '7', '14');
INSERT INTO `role_resource` VALUES ('361', '7', '141');
INSERT INTO `role_resource` VALUES ('362', '7', '142');
INSERT INTO `role_resource` VALUES ('363', '7', '143');
INSERT INTO `role_resource` VALUES ('367', '7', '221');
INSERT INTO `role_resource` VALUES ('364', '7', '222');
INSERT INTO `role_resource` VALUES ('365', '7', '223');
INSERT INTO `role_resource` VALUES ('366', '7', '224');
INSERT INTO `role_resource` VALUES ('368', '7', '226');
INSERT INTO `role_resource` VALUES ('448', '8', '1');
INSERT INTO `role_resource` VALUES ('449', '8', '11');
INSERT INTO `role_resource` VALUES ('451', '8', '12');
INSERT INTO `role_resource` VALUES ('453', '8', '13');
INSERT INTO `role_resource` VALUES ('455', '8', '14');
INSERT INTO `role_resource` VALUES ('450', '8', '111');
INSERT INTO `role_resource` VALUES ('452', '8', '121');
INSERT INTO `role_resource` VALUES ('454', '8', '131');
INSERT INTO `role_resource` VALUES ('456', '8', '141');
INSERT INTO `role_resource` VALUES ('460', '8', '221');
INSERT INTO `role_resource` VALUES ('457', '8', '222');
INSERT INTO `role_resource` VALUES ('458', '8', '223');
INSERT INTO `role_resource` VALUES ('459', '8', '224');
INSERT INTO `role_resource` VALUES ('461', '8', '227');
INSERT INTO `role_resource` VALUES ('462', '8', '228');
INSERT INTO `role_resource` VALUES ('478', '8', '229');
INSERT INTO `role_resource` VALUES ('479', '8', '230');
INSERT INTO `role_resource` VALUES ('480', '8', '231');

-- ----------------------------
-- Table structure for speci_nfo
-- ----------------------------
DROP TABLE IF EXISTS `speci_nfo`;
CREATE TABLE `speci_nfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `speci_field_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '专业名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of speci_nfo
-- ----------------------------
INSERT INTO `speci_nfo` VALUES ('1', 'philosophy');
INSERT INTO `speci_nfo` VALUES ('2', 'economics');
INSERT INTO `speci_nfo` VALUES ('3', 'law');
INSERT INTO `speci_nfo` VALUES ('4', 'pedagogics');
INSERT INTO `speci_nfo` VALUES ('5', 'literature');
INSERT INTO `speci_nfo` VALUES ('6', 'history');
INSERT INTO `speci_nfo` VALUES ('7', '理学');
INSERT INTO `speci_nfo` VALUES ('8', '工学');
INSERT INTO `speci_nfo` VALUES ('9', '农学');
INSERT INTO `speci_nfo` VALUES ('10', '医学');
INSERT INTO `speci_nfo` VALUES ('11', '艺术学');
INSERT INTO `speci_nfo` VALUES ('12', '管理学');

-- ----------------------------
-- Table structure for subject_info
-- ----------------------------
DROP TABLE IF EXISTS `subject_info`;
CREATE TABLE `subject_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `subject_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `speci_id` int(2) DEFAULT NULL COMMENT '所属专业',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of subject_info
-- ----------------------------
INSERT INTO `subject_info` VALUES ('1', 'english', '5');
INSERT INTO `subject_info` VALUES ('2', 'math', '7');
INSERT INTO `subject_info` VALUES ('3', 'electron', '8');
INSERT INTO `subject_info` VALUES ('4', 'logic', '1');
INSERT INTO `subject_info` VALUES ('5', 'faith', '1');
INSERT INTO `subject_info` VALUES ('6', '经济统计学', '2');
INSERT INTO `subject_info` VALUES ('7', '经济统计学', '2');
INSERT INTO `subject_info` VALUES ('8', '国际经济与贸易', '2');
INSERT INTO `subject_info` VALUES ('9', '国际政治', '3');
INSERT INTO `subject_info` VALUES ('10', '社会学', '3');
INSERT INTO `subject_info` VALUES ('11', '科学社会主义', '3');
INSERT INTO `subject_info` VALUES ('12', '中国共产党历史', '3');
INSERT INTO `subject_info` VALUES ('13', '思想政治教育', '3');
INSERT INTO `subject_info` VALUES ('14', '科学教育', '4');
INSERT INTO `subject_info` VALUES ('15', '人文教育', '4');
INSERT INTO `subject_info` VALUES ('16', '学前教育', '4');
INSERT INTO `subject_info` VALUES ('17', '体育教育', '4');
INSERT INTO `subject_info` VALUES ('18', '中国语言文学类', '5');
INSERT INTO `subject_info` VALUES ('19', '汉语言', '5');
INSERT INTO `subject_info` VALUES ('20', '古典文献学', '5');
INSERT INTO `subject_info` VALUES ('21', '广播电视学', '5');
INSERT INTO `subject_info` VALUES ('22', '历史学', '6');
INSERT INTO `subject_info` VALUES ('23', '世界史', '6');
INSERT INTO `subject_info` VALUES ('24', '考古学', '6');
INSERT INTO `subject_info` VALUES ('25', '信息与计算科学', '7');
INSERT INTO `subject_info` VALUES ('26', '应用物理学', '7');
INSERT INTO `subject_info` VALUES ('27', '应用化学', '7');
INSERT INTO `subject_info` VALUES ('28', '天文学', '7');
INSERT INTO `subject_info` VALUES ('29', '地理科学', '7');
INSERT INTO `subject_info` VALUES ('30', '海洋科学', '7');
INSERT INTO `subject_info` VALUES ('31', '生物科学', '7');
INSERT INTO `subject_info` VALUES ('32', ' 统计学', '7');
INSERT INTO `subject_info` VALUES ('33', '心理学', '7');
INSERT INTO `subject_info` VALUES ('34', '理论与应用力学', '8');
INSERT INTO `subject_info` VALUES ('35', '机械工程', '8');
INSERT INTO `subject_info` VALUES ('36', '机械电子工程', '8');
INSERT INTO `subject_info` VALUES ('37', '过程装备与控制工程', '8');
INSERT INTO `subject_info` VALUES ('38', '测控技术与仪器', '8');
INSERT INTO `subject_info` VALUES ('39', '材料物理', '8');
INSERT INTO `subject_info` VALUES ('40', '电气工程及其自动化', '8');
INSERT INTO `subject_info` VALUES ('41', '电子信息工程', '8');
INSERT INTO `subject_info` VALUES ('42', '信息工程', '8');
INSERT INTO `subject_info` VALUES ('43', '物联网工程', '8');
INSERT INTO `subject_info` VALUES ('44', '土木工程', '8');
INSERT INTO `subject_info` VALUES ('45', '水利水电工程', '8');
INSERT INTO `subject_info` VALUES ('46', '遥感科学与技术', '8');
INSERT INTO `subject_info` VALUES ('47', '勘查技术与工程', '8');
INSERT INTO `subject_info` VALUES ('48', '种子科学与工程', '9');
INSERT INTO `subject_info` VALUES ('49', '农业资源与环境', '9');
INSERT INTO `subject_info` VALUES ('50', '水土保持与荒漠化防治', '9');
INSERT INTO `subject_info` VALUES ('51', '林学', '9');
INSERT INTO `subject_info` VALUES ('52', '森林保护', '9');
INSERT INTO `subject_info` VALUES ('53', '基础医学', '10');
INSERT INTO `subject_info` VALUES ('54', '临床医学', '10');
INSERT INTO `subject_info` VALUES ('55', '口腔医学', '10');
INSERT INTO `subject_info` VALUES ('56', '预防医学', '10');
INSERT INTO `subject_info` VALUES ('57', '中医学', '10');
INSERT INTO `subject_info` VALUES ('58', '护理学', '11');
INSERT INTO `subject_info` VALUES ('59', '管理科学', '12');
INSERT INTO `subject_info` VALUES ('60', '工程管理', '12');
INSERT INTO `subject_info` VALUES ('61', '工商管理', '12');
INSERT INTO `subject_info` VALUES ('62', '财务管理', '12');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登陆名',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `opt_content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '客户端ip',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('391', 'test', 'test', '[类名]:com.wangzhixuan.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1500630277343&', '127.0.0.1', '2017-07-21 17:44:37');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(64) NOT NULL COMMENT '登陆名',
  `name` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `salt` varchar(36) DEFAULT NULL COMMENT '密码加密盐',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` tinyint(2) DEFAULT '0' COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `user_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户类别',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `organization_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属机构',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDx_user_login_name` (`login_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '0', '0', '1', '2015-12-06 13:14:05');
INSERT INTO `user` VALUES ('13', 'snoopy', 'snoopy', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '1', '0', '3', '2015-10-01 13:12:07');
INSERT INTO `user` VALUES ('14', 'dreamlu', 'dreamlu', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '1', '0', '5', '2015-10-11 23:12:58');
INSERT INTO `user` VALUES ('15', 'test', 'test', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '1', '0', '6', '2015-12-06 13:13:03');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '111111', 'nezha');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  KEY `idx_user_role_ids` (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('60', '1', '1');
INSERT INTO `user_role` VALUES ('61', '1', '2');
INSERT INTO `user_role` VALUES ('62', '1', '7');
INSERT INTO `user_role` VALUES ('65', '1', '8');
INSERT INTO `user_role` VALUES ('63', '13', '2');
INSERT INTO `user_role` VALUES ('64', '14', '7');
INSERT INTO `user_role` VALUES ('53', '15', '8');

-- ----------------------------
-- Table structure for user_test
-- ----------------------------
DROP TABLE IF EXISTS `user_test`;
CREATE TABLE `user_test` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_test
-- ----------------------------
INSERT INTO `user_test` VALUES ('1', 'nezha', '111111', '13203977736');
