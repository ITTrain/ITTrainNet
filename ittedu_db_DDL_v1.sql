set names utf8;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ittedu_db_v1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ittedu_db_v1`;
--select @@sql_mode;
--SET GLOBAL sql_mode='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SET @@sql_mode='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

/*Table structure for table `edu_article` */

DROP TABLE IF EXISTS `edu_article`;

CREATE TABLE `edu_article` (
  `ARTICLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `TITLE` varchar(100) DEFAULT NULL COMMENT '文章标题',
  `SUMMARY` varchar(200) DEFAULT NULL COMMENT '文章摘要',
  `KEY_WORD` varchar(50) DEFAULT NULL COMMENT '文章关键字',
  `IMAGE_URL` varchar(100) DEFAULT NULL COMMENT '文章图片URL',
  `SOURCE` varchar(50) DEFAULT NULL COMMENT '文章来源',
  `AUTHOR` varchar(10) DEFAULT NULL COMMENT '文章作者',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '文章创建时间',
  `PUBLISH_TIME` timestamp NULL DEFAULT NULL COMMENT '文章发布时间',
  `LINK` varchar(100) DEFAULT NULL COMMENT '文章访问链接',
  `ARTICLE_TYPE` tinyint(4) DEFAULT '0' COMMENT '文章类型 2文章',
  `CLICK_NUM` int(11) DEFAULT '0' COMMENT '文章点击量',
  `PRAISE_COUNT` int(11) DEFAULT '0' COMMENT '点赞数量',
  `COMMENT_NUM` int(11) DEFAULT '0' COMMENT '评论数',
  `SORT` int(11) DEFAULT '0' COMMENT '排序值',
  PRIMARY KEY (`ARTICLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='文章信息表';

/*Table structure for table `edu_article_content` */

DROP TABLE IF EXISTS `edu_article_content`;

CREATE TABLE `edu_article_content` (
  `ARTICLE_ID` int(11) DEFAULT '0' COMMENT '文章ID',
  `CONTENT` text COMMENT '文章内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章内容表';

/*Table structure for table `edu_comment` */

DROP TABLE IF EXISTS `edu_comment`;

CREATE TABLE `edu_comment` (
  `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论表',
  `USER_ID` int(11) DEFAULT '0' COMMENT '用户id',
  `P_COMMENT_ID` int(11) DEFAULT NULL COMMENT '父级评论id(为0则是一级评论,不为0则是回复)',
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '评论内容',
  `ADDTIME` datetime DEFAULT NULL COMMENT '创建时间',
  `OTHER_ID` int(11) DEFAULT NULL COMMENT '评论的相关id',
  `PRAISE_COUNT` int(11) DEFAULT '0' COMMENT '点赞数量',
  `REPLY_COUNT` int(11) DEFAULT '0' COMMENT '回复数量',
  `TYPE` int(11) DEFAULT '0' COMMENT '1文章 2课程',
  PRIMARY KEY (`COMMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Table structure for table `edu_course` */

DROP TABLE IF EXISTS `edu_course`;

CREATE TABLE `edu_course` (
  `COURSE_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `COURSE_NAME` varchar(300) NOT NULL DEFAULT '' COMMENT '课程名称',
  `IS_AVALIABLE` int(10) NOT NULL DEFAULT '0' COMMENT '1正常2删除',
  `SUBJECT_ID` int(11) DEFAULT '0' COMMENT '课程专业ID',
  `SUBJECT_LINK` varchar(255) DEFAULT NULL COMMENT '课程专业链',
  `ADD_TIME` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `SOURCE_PRICE` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '课程原价格（只显示）',
  `CURRENT_PRICE` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '课程销售价格（实际支付价格）设置为0则可免费观看',
  `TITLE` varchar(200) NOT NULL DEFAULT '' COMMENT '课程简介',
  `CONTEXT` longtext NOT NULL COMMENT '课程详情',
  `LESSION_NUM` int(11) NOT NULL DEFAULT '0' COMMENT '总课时',
  `LOGO` varchar(200) NOT NULL DEFAULT '' COMMENT '图片路径',
  `UPDATE_TIME` timestamp NULL DEFAULT NULL COMMENT '最后更新时间',
  `PAGE_BUYCOUNT` int(11) DEFAULT '0' COMMENT '销售数量',
  `PAGE_VIEWCOUNT` int(11) NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `END_TIME` timestamp NULL DEFAULT NULL COMMENT '有效结束时间',
  `LOSETYPE` int(2) DEFAULT '0' COMMENT '有效期类型，0：到期时间，1：按天数',
  `LOSE_TIME` varchar(255) DEFAULT NULL COMMENT '有效期:商品订单过期时间点',
  `SEQUENCE` int(1) DEFAULT '0' COMMENT '序列',
  `COURSE_GROSS_INCOME` decimal(10,2) DEFAULT '0.00' COMMENT '该课程总共卖了多少钱（新加字段暂时没用到）',
  PRIMARY KEY (`COURSE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='课程表';

/*Table structure for table `edu_course_favorites` */

DROP TABLE IF EXISTS `edu_course_favorites`;

CREATE TABLE `edu_course_favorites` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `COURSE_ID` int(11) DEFAULT '0' COMMENT '课程id',
  `USER_ID` int(11) DEFAULT '0' COMMENT '用户ID',
  `ADD_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `user_id` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='收藏';

/*Table structure for table `edu_course_kpoint` */

DROP TABLE IF EXISTS `edu_course_kpoint`;

CREATE TABLE `edu_course_kpoint` (
  `KPOINT_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `COURSE_ID` int(11) DEFAULT '0' COMMENT '课程id',
  `NAME` varchar(300) DEFAULT NULL COMMENT '节点名称',
  `PARENT_ID` int(11) DEFAULT '0' COMMENT '父级ID',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '添加时间',
  `SORT` int(11) DEFAULT '0' COMMENT '显示排序',
  `PLAY_COUNT` int(11) DEFAULT '0' COMMENT '播放次数',
  `IS_FREE` tinyint(1) DEFAULT '0' COMMENT '是否可以试听1免费2收费',
  `VIDEO_URL` varchar(500) DEFAULT NULL COMMENT '视频地址',
  `TEACHER_ID` int(11) DEFAULT '0' COMMENT '讲师id',
  `play_time` varchar(100) DEFAULT '' COMMENT '播放时间',
  `KPOINT_TYPE` int(1) DEFAULT '0' COMMENT '节点类型 0文件目录 1视频',
  `VIDEO_TYPE` varchar(30) DEFAULT NULL COMMENT '视频类型',
  `FILE_TYPE` varchar(20) DEFAULT NULL COMMENT 'VIDEO视频 AUDIO音频 FILE文档 TXT文本 ATLAS图片集',
  `CONTENT` longtext COMMENT '文本',
  PRIMARY KEY (`KPOINT_ID`),
  KEY `course_id` (`COURSE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='知识点的基本信息';

/*Table structure for table `edu_course_note` */

DROP TABLE IF EXISTS `edu_course_note`;

CREATE TABLE `edu_course_note` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `USER_ID` int(11) DEFAULT '0' COMMENT '用户ID',
  `COURSE_ID` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `KPOINT_ID` int(11) NOT NULL DEFAULT '0' COMMENT '节点ID',
  `CONTENT` longtext NOT NULL COMMENT '笔记信息',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `STATUS` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0公开1隐藏',
  PRIMARY KEY (`ID`),
  KEY `CUS_ID` (`KPOINT_ID`),
  KEY `POINT_ID` (`COURSE_ID`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='笔记信息';

/*Table structure for table `edu_course_studyhistory` */

DROP TABLE IF EXISTS `edu_course_studyhistory`;

CREATE TABLE `edu_course_studyhistory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL COMMENT '用户id',
  `COURSE_ID` int(11) NOT NULL COMMENT '课程id',
  `KPOINT_ID` int(11) NOT NULL COMMENT '节点id',
  `PLAYERCOUNT` int(11) NOT NULL DEFAULT '0' COMMENT '观看次数,累加',
  `COURSE_NAME` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `KPOINT_NAME` varchar(50) DEFAULT NULL COMMENT '节点名称',
  `DATABACK` text COMMENT 'playercount小于20时记录,备注观看的时间，叠加',
  `UPDATE_TIME` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后观看时间',
  PRIMARY KEY (`ID`),
  KEY `user_course_id` (`USER_ID`,`COURSE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='课程播放记录(学习记录)';

/*Data for the table `edu_course_studyhistory` */

DROP TABLE IF EXISTS `edu_course_subject`;

CREATE TABLE `edu_course_subject` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `COURSE_ID` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `SUBJECT_ID` int(11) NOT NULL DEFAULT '0' COMMENT '分类id',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `course_subject` (`COURSE_ID`,`SUBJECT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Table structure for table `edu_course_teacher` */

DROP TABLE IF EXISTS `edu_course_teacher`;

CREATE TABLE `edu_course_teacher` (
  `COURSE_ID` int(11) DEFAULT NULL COMMENT '课程id',
  `TEACHER_ID` int(11) DEFAULT NULL COMMENT '讲师id',
  KEY `course_id` (`COURSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='课程讲师关联';

/*Table structure for table `edu_emailsend_history` */

DROP TABLE IF EXISTS `edu_emailsend_history`;

CREATE TABLE `edu_emailsend_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` longtext,
  `user_id` int(11) DEFAULT '0',
  `title` varchar(300) DEFAULT '' COMMENT '邮箱标题',
  `content` text COMMENT '邮箱正文',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00',
  `send_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '定时发送时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '1 已发送 2 未发送',
  `type` tinyint(3) DEFAULT '1' COMMENT '1 普通 2 定时',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='邮件发送记录';

/*Table structure for table `edu_help_menu` */

DROP TABLE IF EXISTS `edu_help_menu`;

CREATE TABLE `edu_help_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT '0' COMMENT '父级分类ID，默认0为一级分类',
  `name` varchar(20) DEFAULT '' COMMENT '菜单名称',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `content` longtext COMMENT '菜单内容',
  `sort` int(11) DEFAULT '0' COMMENT '排序  倒叙',
  `varchar` varchar(200) DEFAULT NULL,
  `link_building` varchar(255) DEFAULT NULL COMMENT '外链字段',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COMMENT='帮助菜单';

/*Table structure for table `edu_mobilesend_history` */

DROP TABLE IF EXISTS `edu_mobilesend_history`;

CREATE TABLE `edu_mobilesend_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` text,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `send_time` datetime DEFAULT NULL COMMENT '定时发送时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '1 已发送 2 未发送',
  `type` tinyint(3) DEFAULT '1' COMMENT '1 正常 2 定时',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='手机短信发送记录';

/*Table structure for table `edu_msg_receive` */

DROP TABLE IF EXISTS `edu_msg_receive`;

CREATE TABLE `edu_msg_receive` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ADD_TIME` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `CUS_ID` int(11) DEFAULT '0' COMMENT '发信人用户id',
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `CONTENT` text COMMENT '信内容',
  `TYPE` tinyint(3) DEFAULT '0' COMMENT '类型1系统通知2站内信',
  `STATUS` tinyint(3) DEFAULT '0' COMMENT '0未读1已读2接受3拒绝4黑名单',
  `RECEIVING_CUSID` int(11) DEFAULT '0' COMMENT '收信人id',
  `GROUP_ID` int(11) DEFAULT '0' COMMENT '申请加入群同意之后所需要的字段',
  `SHOWNAME` varchar(50) NOT NULL DEFAULT '' COMMENT '会员名',
  PRIMARY KEY (`ID`),
  KEY `CUS_ID` (`CUS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='站内信';

/*Table structure for table `edu_msg_system` */

DROP TABLE IF EXISTS `edu_msg_system`;

CREATE TABLE `edu_msg_system` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ADD_TIME` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `CONTENT` text COMMENT '信内容',
  `STATUS` tinyint(3) DEFAULT '0' COMMENT '0正常1删除2过期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统消息';

/*Table structure for table `edu_praise` */

DROP TABLE IF EXISTS `edu_praise`;

CREATE TABLE `edu_praise` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户id',
  `TARGET_ID` int(11) DEFAULT NULL COMMENT '点赞的对象id',
  `TYPE` int(11) DEFAULT NULL COMMENT '点赞类型 1问答点赞 2问答评论点赞 3 文章点赞数4 评论点赞',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='所有的点赞表';

/*Table structure for table `edu_questions` */

DROP TABLE IF EXISTS `edu_questions`;

CREATE TABLE `edu_questions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CUS_ID` int(11) DEFAULT NULL COMMENT '创建人id',
  `TITLE` varchar(100) DEFAULT NULL COMMENT '问答标题',
  `CONTENT` text COMMENT '问答内容',
  `TYPE` int(1) DEFAULT NULL COMMENT '分类 1课程问答 2 学习分享',
  `STATUS` int(1) DEFAULT '0' COMMENT '状态 0可回复1不可回复（采纳最佳答案后改为1 ）',
  `REPLY_COUNT` int(11) DEFAULT '0' COMMENT '问答回复数量',
  `BROWSE_COUNT` int(11) DEFAULT '0' COMMENT '问答浏览次数',
  `PRAISE_COUNT` int(11) DEFAULT '0' COMMENT '问答点赞数量',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='问答';

/*Table structure for table `edu_questions_comment` */

DROP TABLE IF EXISTS `edu_questions_comment`;

CREATE TABLE `edu_questions_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `CUS_ID` int(11) DEFAULT NULL COMMENT '评论人id',
  `QUESTION_ID` int(11) DEFAULT NULL COMMENT '问答id',
  `CONTENT` varchar(300) DEFAULT NULL COMMENT '评论内容',
  `IS_BEST` int(1) DEFAULT NULL COMMENT '是否最佳答案 0否1是',
  `REPLY_COUNT` int(11) DEFAULT '0' COMMENT '回复数量',
  `PRAISE_COUNT` int(11) DEFAULT '0' COMMENT '点赞数',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '回复时间',
  `COMMENT_ID` int(11) DEFAULT '0' COMMENT '父级评论id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='问答评论';

/*Table structure for table `edu_questions_tag` */

DROP TABLE IF EXISTS `edu_questions_tag`;

CREATE TABLE `edu_questions_tag` (
  `QUESTIONS_TAG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `QUESTIONS_TAG_NAME` varchar(45) DEFAULT NULL COMMENT '标签名',
  `STATUS` int(1) DEFAULT NULL COMMENT '状态0默认1删除',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `PARENT_ID` varchar(45) DEFAULT NULL COMMENT '父级id',
  PRIMARY KEY (`QUESTIONS_TAG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='问答标签';

/*Table structure for table `edu_questions_tag_relation` */

DROP TABLE IF EXISTS `edu_questions_tag_relation`;

CREATE TABLE `edu_questions_tag_relation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `QUESTIONS_ID` int(11) DEFAULT NULL COMMENT '问答id',
  `QUESTIONS_TAG_ID` int(11) DEFAULT NULL COMMENT '问答标签id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Table structure for table `edu_statistics_computer` */

DROP TABLE IF EXISTS `edu_statistics_computer`;

CREATE TABLE `edu_statistics_computer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATISTICS_TIME` datetime NOT NULL COMMENT '统计日期',
  `CPU_USAGE` varchar(20) NOT NULL COMMENT 'cpu使用率',
  `MEMORY_USAGE` varchar(20) NOT NULL COMMENT '内存使用率',
  `NET_USAGE` varchar(20) NOT NULL COMMENT '网络使用率',
  PRIMARY KEY (`ID`),
  KEY `STATISTICS_TIME` (`STATISTICS_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站统计cpu、磁盘、网络带宽使用率';

/*Data for the table `edu_statistics_computer` */

/*Table structure for table `edu_statistics_day` */

DROP TABLE IF EXISTS `edu_statistics_day`;

CREATE TABLE `edu_statistics_day` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATISTICS_TIME` datetime NOT NULL COMMENT '统计日期',
  `LOGIN_NUM` int(11) NOT NULL DEFAULT '0' COMMENT '登录人数（活跃人数 ）',
  `CREATE_TIME` datetime NOT NULL COMMENT '生成时间',
  `REGISTERED_NUM` int(11) NOT NULL COMMENT '注册人数',
  `VIDEO_VIEWING_NUM` int(11) NOT NULL DEFAULT '0' COMMENT '每日播放视频数',
  `DAILY_USER_NUMBER` int(11) DEFAULT '0' COMMENT '每日用户数',
  `DAILY_COURSE_NUMBER` int(11) DEFAULT '0' COMMENT '每日课程数',
  PRIMARY KEY (`ID`),
  KEY `STATISTICS_TIME` (`STATISTICS_TIME`)
) ENGINE=InnoDB AUTO_INCREMENT=1610 DEFAULT CHARSET=utf8 COMMENT='网站统计日数据';

/*Table structure for table `edu_teacher` */

DROP TABLE IF EXISTS `edu_teacher`;

CREATE TABLE `edu_teacher` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '教师ID',
  `NAME` varchar(12) NOT NULL DEFAULT '' COMMENT '教师名称',
  `EDUCATION` varchar(200) NOT NULL DEFAULT '' COMMENT '教师资历,一句话说明老师',
  `CAREER` text NOT NULL COMMENT '教师简介',
  `IS_STAR` tinyint(1) NOT NULL DEFAULT '0' COMMENT '头衔 1高级讲师2首席讲师',
  `PIC_PATH` varchar(200) NOT NULL DEFAULT '' COMMENT '图片路径',
  `STATUS` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态:0正常1删除',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `SUBJECT_ID` int(11) DEFAULT '0' COMMENT '专业ID',
  `SORT` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`ID`),
  KEY `NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='讲师';

/*Table structure for table `edu_user` */

DROP TABLE IF EXISTS `edu_user`;

CREATE TABLE `edu_user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '学员ID',
  `MOBILE` varchar(11) DEFAULT NULL COMMENT '手机号',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '邮箱号',
  `PASSWORD` varchar(64) DEFAULT NULL COMMENT '密码',
  `USER_NAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `SHOW_NAME` varchar(50) DEFAULT NULL COMMENT '显示名 （昵称）',
  `SEX` tinyint(1) DEFAULT '0' COMMENT '性别  1男  2女',
  `AGE` tinyint(3) DEFAULT '0' COMMENT '年龄',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '注册时间',
  `IS_AVALIBLE` tinyint(1) DEFAULT '1' COMMENT '是否可用 1正常  2冻结',
  `PIC_IMG` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `BANNER_URL` varchar(200) DEFAULT NULL COMMENT '个人中心用户背景图片',
  `MSG_NUM` int(11) DEFAULT '0' COMMENT '站内信未读消息数',
  `SYS_MSG_NUM` int(11) DEFAULT '0',
  `LAST_SYSTEM_TIME` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '上传统计系统消息时间',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='学员表';

/*Table structure for table `edu_user_login_log` */

DROP TABLE IF EXISTS `edu_user_login_log`;

CREATE TABLE `edu_user_login_log` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN_TIME` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `IP` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `USER_ID` int(11) DEFAULT '0' COMMENT '用户ID',
  `OS_NAME` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `USER_AGENT` varchar(50) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `edu_website_course` */

DROP TABLE IF EXISTS `edu_website_course`;

CREATE TABLE `edu_website_course` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT '' COMMENT '推荐模块名称',
  `LINK` varchar(255) DEFAULT '' COMMENT '点击更多链接',
  `DESCRIPTION` varchar(255) DEFAULT '' COMMENT '说明',
  `COURSENUM` int(11) DEFAULT '0' COMMENT '推荐课程限制数量',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网站课程推荐分类';

/*Table structure for table `edu_website_course_detail` */

DROP TABLE IF EXISTS `edu_website_course_detail`;

CREATE TABLE `edu_website_course_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `RECOMMEND_ID` int(11) DEFAULT '0' COMMENT '推荐分类的id',
  `COURSE_ID` int(11) DEFAULT '0' COMMENT '课程id',
  `ORDER_NUM` int(11) DEFAULT '0' COMMENT '课程显示排序',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='推荐课程表';

/*Table structure for table `edu_website_ehcache` */

DROP TABLE IF EXISTS `edu_website_ehcache`;

CREATE TABLE `edu_website_ehcache` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ehcache_key` varchar(200) NOT NULL DEFAULT '' COMMENT 'ehcache key',
  `ehcache_desc` varchar(200) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Table structure for table `edu_website_images` */

DROP TABLE IF EXISTS `edu_website_images`;

CREATE TABLE `edu_website_images` (
  `IMAGE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `IMAGE_URL` varchar(200) NOT NULL DEFAULT '' COMMENT '图片地址',
  `LINK_ADDRESS` varchar(255) DEFAULT NULL COMMENT '图链接地址',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '图标题',
  `TYPE_ID` int(11) DEFAULT '0' COMMENT '图片类型',
  `SERIES_NUMBER` int(11) DEFAULT '0' COMMENT '序列号',
  `PREVIEW_URL` varchar(255) DEFAULT NULL COMMENT '略缩图片地址',
  `COLOR` varchar(255) DEFAULT '' COMMENT '背景色',
  `describe` varchar(600) DEFAULT '' COMMENT '图片描述',
  PRIMARY KEY (`IMAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='banner图管理';

/*Table structure for table `edu_website_images_type` */

DROP TABLE IF EXISTS `edu_website_images_type`;

CREATE TABLE `edu_website_images_type` (
  `TYPE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `TYPE_NAME` varchar(50) DEFAULT NULL COMMENT '类型名',
  PRIMARY KEY (`TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='图片类型表';

/*Table structure for table `edu_website_navigate` */

DROP TABLE IF EXISTS `edu_website_navigate`;

CREATE TABLE `edu_website_navigate` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `NAME` varchar(100) NOT NULL DEFAULT '' COMMENT '导航显示名称',
  `URL` varchar(100) NOT NULL DEFAULT '' COMMENT '导航显示位置',
  `NEWPAGE` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否在新页面打开0是1否',
  `TYPE` varchar(50) NOT NULL DEFAULT '' COMMENT '类型：INDEX首页、USER个人中心、FRIENDLINK尾部友链、TAB尾部标签',
  `ORDERNUM` int(11) NOT NULL DEFAULT '0' COMMENT '显示排序',
  `STATUS` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常1冻结',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='导航表';

/*Table structure for table `edu_website_profile` */

DROP TABLE IF EXISTS `edu_website_profile`;

CREATE TABLE `edu_website_profile` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(20) NOT NULL DEFAULT '' COMMENT '类型',
  `DESCIPTION` text COMMENT '内容JSON格式',
  `EXPLAIN` varchar(50) DEFAULT '' COMMENT '说明',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `sys_function` */

DROP TABLE IF EXISTS `sys_function`;

CREATE TABLE `sys_function` (
  `FUNCTION_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `PARENT_ID` int(11) DEFAULT '0' COMMENT '权限父ID',
  `FUNCTION_NAME` varchar(100) DEFAULT NULL COMMENT '权限名',
  `FUNCTION_URL` varchar(255) DEFAULT NULL COMMENT '权限URL',
  `FUNCTION_TYPE` tinyint(1) DEFAULT '0' COMMENT '权限类型 1菜单 2功能',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `SORT` int(11) DEFAULT '0' COMMENT '排序',
  `image_url` varchar(300) DEFAULT NULL COMMENT '图标路径',
  PRIMARY KEY (`FUNCTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COMMENT='权限表';

/*Table structure for table `sys_login_log` */

DROP TABLE IF EXISTS `sys_login_log`;

CREATE TABLE `sys_login_log` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN_TIME` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `IP` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `USER_ID` int(11) DEFAULT '0' COMMENT '用户ID',
  `OS_NAME` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `USER_AGENT` varchar(50) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(100) DEFAULT NULL COMMENT '角色名',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Table structure for table `sys_role_function` */

DROP TABLE IF EXISTS `sys_role_function`;

CREATE TABLE `sys_role_function` (
  `ROLE_ID` int(11) DEFAULT '0' COMMENT '角色ID',
  `FUNCTION_ID` int(11) DEFAULT '0' COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';

/*Table structure for table `sys_subject` */

DROP TABLE IF EXISTS `sys_subject`;

CREATE TABLE `sys_subject` (
  `SUBJECT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `SUBJECT_NAME` varchar(50) NOT NULL DEFAULT '' COMMENT '专业名称',
  `STATUS` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0:默认 1:删除',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `PARENT_ID` int(11) DEFAULT '0' COMMENT '父ID',
  `sort` int(11) DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`SUBJECT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='专业信息';

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `LOGIN_NAME` varchar(20) NOT NULL DEFAULT '' COMMENT '登录名',
  `LOGIN_PWD` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `USER_NAME` varchar(50) DEFAULT NULL COMMENT '用户真实姓名名',
  `STATUS` tinyint(1) DEFAULT '0' COMMENT '状态.0: 正常,1:冻结,2：删除',
  `LAST_LOGIN_TIME` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `LAST_LOGIN_IP` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '邮件地址',
  `TEL` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `ROLE_ID` int(11) DEFAULT '0' COMMENT '所属角色ID',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户表';
