
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE IF NOT EXISTS `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='代码生成业务表';


INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 'report_data_resource', '报表数据源管理表', NULL, NULL, 'ReportDataResource', 'crud', 'com.ruoyi.system', 'report', 'resource', '报数据源管理', 'ruoyi', '0', '/', '{"parentMenuId":"2000"}', 'admin', '2021-10-13 21:41:32', '', '2021-10-18 19:41:02', NULL),
	(2, 'sys_source_config', '数据源配置', NULL, NULL, 'SysSourceConfig', 'crud', 'com.ruoyi.system', 'system', 'config', '数据源配置', 'ruoyi', '0', '/', '{}', 'admin', '2021-10-18 19:41:09', '', '2021-10-18 19:41:25', NULL);

DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE IF NOT EXISTS `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COMMENT='代码生成业务表字段';


INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(1, '1', 'id', '序号', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-13 21:41:32', '', '2021-10-18 19:41:02'),
	(2, '1', 'connName', '连接名称', 'varchar(100)', 'String', 'connname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-10-13 21:41:32', '', '2021-10-18 19:41:02'),
	(3, '1', 'connDriverClass', '驱动包名', 'varchar(100)', 'String', 'conndriverclass', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-13 21:41:32', '', '2021-10-18 19:41:02'),
	(4, '1', 'connType', '数据库类型', 'varchar(50)', 'String', 'conntype', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'conn_type', 4, 'admin', '2021-10-13 21:41:32', '', '2021-10-18 19:41:02'),
	(5, '1', 'connIp', 'IP地址', 'varchar(100)', 'String', 'connip', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-10-13 21:41:32', '', '2021-10-18 19:41:02'),
	(6, '1', 'connPort', '端口号', 'varchar(50)', 'String', 'connport', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-10-13 21:41:32', '', '2021-10-18 19:41:02'),
	(7, '1', 'connUserName', '用户名', 'varchar(20)', 'String', 'connusername', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2021-10-13 21:41:32', '', '2021-10-18 19:41:02'),
	(8, '1', 'connPassWord', '密码', 'varchar(50)', 'String', 'connpassword', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-10-13 21:41:32', '', '2021-10-18 19:41:02'),
	(9, '1', 'connProperty', '附加属性', 'varchar(100)', 'String', 'connproperty', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-10-13 21:41:32', '', '2021-10-18 19:41:02'),
	(10, '1', 'createDate', '创建日期', 'datetime', 'Date', 'createdate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2021-10-13 21:41:32', '', '2021-10-18 19:41:02'),
	(11, '2', 'source_id', 'id', 'bigint(20)', 'Long', 'sourceId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-18 19:41:09', '', '2021-10-18 19:41:25'),
	(12, '2', 'source_code', '数据源编码', 'varchar(255)', 'String', 'sourceCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-10-18 19:41:09', '', '2021-10-18 19:41:25'),
	(13, '2', 'project', '项目名称', 'varchar(255)', 'String', 'project', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-18 19:41:09', '', '2021-10-18 19:41:25'),
	(14, '2', 'package_name', '切面声明包名称', 'varchar(255)', 'String', 'packageName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-10-18 19:41:09', '', '2021-10-18 19:41:25'),
	(15, '2', 'url', '连接信息', 'varchar(255)', 'String', 'url', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-10-18 19:41:09', '', '2021-10-18 19:41:25'),
	(16, '2', 'user_name', '用户名', 'varchar(255)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2021-10-18 19:41:09', '', '2021-10-18 19:41:25'),
	(17, '2', 'pass_word', '密码', 'varchar(255)', 'String', 'passWord', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-10-18 19:41:09', '', '2021-10-18 19:41:25'),
	(18, '2', 'drivers', '数据驱动类', 'varchar(255)', 'String', 'drivers', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-10-18 19:41:09', '', '2021-10-18 19:41:25'),
	(19, '2', 'database_type', '数据库类型', 'varchar(255)', 'String', 'databaseType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'conn_type', 9, 'admin', '2021-10-18 19:41:09', '', '2021-10-18 19:41:25'),
	(20, '2', 'remark', '备注说明', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-10-18 19:41:09', '', '2021-10-18 19:41:25');

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob DEFAULT NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Blob类型的触发器表';


DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE IF NOT EXISTS `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='日历信息表';


DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cron类型的触发器表';


INSERT INTO `qrtz_cron_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`) VALUES
	('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai'),
	('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai'),
	('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='已触发的触发器表';


DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE IF NOT EXISTS `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob DEFAULT NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='任务详细信息表';


INSERT INTO `qrtz_job_details` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`) VALUES
	('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', _binary 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001e636f6d2e72756f79692e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720027636f6d2e72756f79692e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000017c753d022878707400007070707400013174000e302f3130202a202a202a202a203f74001172795461736b2e72794e6f506172616d7374000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000001740018e7b3bbe7bb9fe9bb98e8aea4efbc88e697a0e58f82efbc8974000133740001317800),
	('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', _binary 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001e636f6d2e72756f79692e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720027636f6d2e72756f79692e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000017c753d022878707400007070707400013174000e302f3135202a202a202a202a203f74001572795461736b2e7279506172616d7328277279272974000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000002740018e7b3bbe7bb9fe9bb98e8aea4efbc88e69c89e58f82efbc8974000133740001317800),
	('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', _binary 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001e636f6d2e72756f79692e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720027636f6d2e72756f79692e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000017c753d022878707400007070707400013174000e302f3230202a202a202a202a203f74003872795461736b2e72794d756c7469706c65506172616d7328277279272c20747275652c20323030304c2c203331362e3530442c203130302974000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000003740018e7b3bbe7bb9fe9bb98e8aea4efbc88e5a49ae58f82efbc8974000133740001317800);

DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE IF NOT EXISTS `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='存储的悲观锁信息表';


INSERT INTO `qrtz_locks` (`sched_name`, `lock_name`) VALUES
	('RuoyiScheduler', 'STATE_ACCESS'),
	('RuoyiScheduler', 'TRIGGER_ACCESS');

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE IF NOT EXISTS `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='暂停的触发器表';

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE IF NOT EXISTS `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='调度器状态表';


INSERT INTO `qrtz_scheduler_state` (`sched_name`, `instance_name`, `last_checkin_time`, `checkin_interval`) VALUES
	('RuoyiScheduler', 'MS-MRMXZQIDIHVL1634783398700', 1634801523422, 15000);

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='简单触发器的信息表';

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='同步机制的行锁表';

DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob DEFAULT NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='触发器详细信息表';

INSERT INTO `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`) VALUES
	('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1634783400000, -1, 5, 'PAUSED', 'CRON', 1634783398000, 0, NULL, 2, _binary ''),
	('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1634783400000, -1, 5, 'PAUSED', 'CRON', 1634783398000, 0, NULL, 2, _binary ''),
	('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1634783400000, -1, 5, 'PAUSED', 'CRON', 1634783398000, 0, NULL, 2, _binary '');

DROP TABLE IF EXISTS `report_data_resource`;
CREATE TABLE IF NOT EXISTS `report_data_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `connName` varchar(100) DEFAULT NULL COMMENT '连接名称',
  `connDriverClass` varchar(100) DEFAULT NULL COMMENT '驱动包名',
  `connType` varchar(50) DEFAULT NULL COMMENT '数据库类型',
  `connIp` varchar(100) DEFAULT NULL COMMENT 'IP地址',
  `connPort` varchar(50) DEFAULT NULL COMMENT '端口号',
  `connUserName` varchar(20) DEFAULT NULL COMMENT '用户名',
  `connPassWord` varchar(50) DEFAULT NULL COMMENT '密码',
  `connProperty` varchar(100) DEFAULT NULL COMMENT '附加参数',
  `createDate` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='报表数据源管理表';


INSERT INTO `report_data_resource` (`id`, `connName`, `connDriverClass`, `connType`, `connIp`, `connPort`, `connUserName`, `connPassWord`, `connProperty`, `createDate`) VALUES
	(1, 'Test01', 'com.mysql.cj.jdbc.Driver', 'Mysql', '192.168.0.11', '3306', 'root', '123', 'serverTimezone=UTC', '2021-10-13 00:00:00'),
	(2, 'Test02', NULL, 'Mongo', '127.0.0.1', '27017', 'admin', '111111', NULL, '2021-10-13 00:00:00');

DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE IF NOT EXISTS `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='参数配置表';


INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-green', 'Y', 'admin', '2021-10-13 00:01:45', 'admin', '2021-10-13 00:16:37', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
	(2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-10-13 00:01:45', '', NULL, '初始化密码 123456'),
	(3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2021-10-13 00:01:45', 'admin', '2021-10-13 00:17:11', '深色主题theme-dark，浅色主题theme-light'),
	(4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'false', 'N', 'admin', '2021-10-13 00:01:45', 'admin', '2021-10-13 00:17:20', '是否开启验证码功能（true开启，false关闭）'),
	(5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'N', 'admin', '2021-10-13 00:01:45', 'admin', '2021-10-13 00:17:27', '是否开启注册用户功能（true开启，false关闭）');

DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE IF NOT EXISTS `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb3 COMMENT='部门表';


INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(100, 0, '0', '集团总部', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-13 00:01:45', '', NULL),
	(101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-13 00:01:45', '', NULL),
	(102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-13 00:01:45', '', NULL),
	(103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-13 00:01:45', '', NULL),
	(104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-13 00:01:45', '', NULL),
	(105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-13 00:01:45', '', NULL),
	(106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-13 00:01:45', '', NULL),
	(107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-13 00:01:45', '', NULL),
	(108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-13 00:01:45', '', NULL),
	(109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-13 00:01:45', '', NULL);

DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE IF NOT EXISTS `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3 COMMENT='字典数据表';


INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '性别男'),
	(2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '性别女'),
	(3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '性别未知'),
	(4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '显示菜单'),
	(5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '隐藏菜单'),
	(6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '正常状态'),
	(7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '停用状态'),
	(8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '正常状态'),
	(9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '停用状态'),
	(10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '默认分组'),
	(11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '系统分组'),
	(12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '系统默认是'),
	(13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '系统默认否'),
	(14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '通知'),
	(15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '公告'),
	(16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '正常状态'),
	(17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '关闭状态'),
	(18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '新增操作'),
	(19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '修改操作'),
	(20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '删除操作'),
	(21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '授权操作'),
	(22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '导出操作'),
	(23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '导入操作'),
	(24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '强退操作'),
	(25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '生成操作'),
	(26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '清空操作'),
	(27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '正常状态'),
	(28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '停用状态'),
	(100, 0, 'Mysql', 'Mysql', 'conn_type', NULL, 'default', 'N', '0', 'admin', '2021-10-13 21:48:06', '', NULL, 'Mysql数据库'),
	(101, 1, 'Mongo', 'Mongo', 'conn_type', NULL, 'default', 'N', '0', 'admin', '2021-10-13 21:48:32', '', NULL, 'Mongo数据库');

DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE IF NOT EXISTS `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COMMENT='字典类型表';


INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '用户性别列表'),
	(2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '菜单状态列表'),
	(3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '系统开关列表'),
	(4, '任务状态', 'sys_job_status', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '任务状态列表'),
	(5, '任务分组', 'sys_job_group', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '任务分组列表'),
	(6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '系统是否列表'),
	(7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '通知类型列表'),
	(8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '通知状态列表'),
	(9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '操作类型列表'),
	(10, '系统状态', 'sys_common_status', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '登录状态列表'),
	(100, '连接类型', 'conn_type', '0', 'admin', '2021-10-13 21:47:24', '', NULL, '数据库类型');

DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE IF NOT EXISTS `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度表';


INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-10-13 00:01:45', '', NULL, '');

DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE IF NOT EXISTS `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度日志表';


INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `invoke_target`, `job_message`, `status`, `exception_info`, `create_time`) VALUES
	(1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：2毫秒', '0', '', '2021-10-13 00:10:17');

DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE IF NOT EXISTS `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COMMENT='系统访问记录';


INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES
	(1, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-13 00:19:28'),
	(2, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 00:20:19'),
	(3, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-13 00:22:34'),
	(4, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 00:22:37'),
	(5, 'admin', '192.168.0.4', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 00:36:23'),
	(6, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 08:44:57'),
	(7, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-13 09:00:07'),
	(8, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 09:00:12'),
	(9, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-13 09:11:44'),
	(10, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 09:23:44'),
	(11, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-13 09:23:50'),
	(12, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 09:29:08'),
	(13, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-13 09:59:07'),
	(14, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 11:00:38'),
	(15, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 12:44:34'),
	(16, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-13 12:57:54'),
	(17, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 12:57:56'),
	(18, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 15:49:46'),
	(19, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 17:09:44'),
	(20, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-13 17:32:53'),
	(21, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 17:32:55'),
	(22, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-13 17:35:28'),
	(23, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 17:35:30'),
	(24, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 18:26:48'),
	(25, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-13 19:46:56'),
	(26, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 19:47:00'),
	(27, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 21:38:55'),
	(28, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-13 22:09:06'),
	(29, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 22:09:08'),
	(30, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-13 23:50:41'),
	(31, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-14 09:02:42'),
	(32, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-14 09:51:41'),
	(33, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-14 13:05:14'),
	(34, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-14 16:03:53'),
	(35, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-15 09:24:35'),
	(36, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-15 10:55:39'),
	(37, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-15 12:42:00'),
	(38, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-15 15:51:19'),
	(39, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-18 11:05:18'),
	(40, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-18 16:15:46'),
	(41, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-18 19:27:47'),
	(42, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-19 10:58:48'),
	(43, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-19 11:49:59'),
	(44, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-19 16:45:45'),
	(45, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-20 09:29:58'),
	(46, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-20 11:55:10'),
	(47, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-20 12:56:23'),
	(48, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-20 18:29:44'),
	(49, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-21 10:31:09'),
	(50, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-21 15:22:48');

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2037 DEFAULT CHARSET=utf8mb3 COMMENT='菜单权限表';


INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-10-13 00:01:45', '', NULL, '系统管理目录'),
	(2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-10-13 00:01:45', '', NULL, '系统监控目录'),
	(3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-10-13 00:01:45', '', NULL, '系统工具目录'),
	(100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-10-13 00:01:45', '', NULL, '用户管理菜单'),
	(101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-10-13 00:01:45', '', NULL, '角色管理菜单'),
	(102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-10-13 00:01:45', '', NULL, '菜单管理菜单'),
	(103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-10-13 00:01:45', '', NULL, '部门管理菜单'),
	(104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-10-13 00:01:45', '', NULL, '岗位管理菜单'),
	(105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-10-13 00:01:45', '', NULL, '字典管理菜单'),
	(106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-10-13 00:01:45', '', NULL, '参数设置菜单'),
	(107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-10-13 00:01:45', '', NULL, '通知公告菜单'),
	(108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-10-13 00:01:45', '', NULL, '日志管理菜单'),
	(109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-10-13 00:01:45', '', NULL, '在线用户菜单'),
	(110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-10-13 00:01:45', '', NULL, '定时任务菜单'),
	(111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-10-13 00:01:45', '', NULL, '数据监控菜单'),
	(112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-10-13 00:01:45', '', NULL, '服务监控菜单'),
	(113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-10-13 00:01:45', '', NULL, '缓存监控菜单'),
	(114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-10-13 00:01:45', '', NULL, '表单构建菜单'),
	(115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-10-13 00:01:45', '', NULL, '代码生成菜单'),
	(116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-10-13 00:01:45', '', NULL, '系统接口菜单'),
	(500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-10-13 00:01:45', '', NULL, '操作日志菜单'),
	(501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-10-13 00:01:45', '', NULL, '登录日志菜单'),
	(1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(2000, '报表中心', 0, 4, 'report', NULL, NULL, 1, 0, 'M', '0', '0', '', 'report', 'admin', '2021-10-13 17:25:40', 'admin', '2021-10-13 17:26:06', ''),
	(2002, '数据源管理', 2000, 2, 'resource', 'report/resource/index', NULL, 1, 0, 'C', '0', '0', 'report:resource:list', 'bxs-data', 'admin', '2021-10-13 21:53:44', 'admin', '2021-10-14 09:20:33', '数据源管理菜单'),
	(2003, '查询数据源', 2002, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'report:resource:query', '#', 'admin', '2021-10-13 21:53:45', 'admin', '2021-10-13 23:47:40', ''),
	(2004, '新增数据源', 2002, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'report:resource:add', '#', 'admin', '2021-10-13 21:53:45', 'admin', '2021-10-13 23:47:48', ''),
	(2005, '修改数据源', 2002, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'report:resource:edit', '#', 'admin', '2021-10-13 21:53:45', 'admin', '2021-10-13 23:47:58', ''),
	(2006, '删除数据源', 2002, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'report:resource:remove', '#', 'admin', '2021-10-13 21:53:45', 'admin', '2021-10-13 23:48:07', ''),
	(2007, '导出数据源', 2002, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'report:resource:export', '#', 'admin', '2021-10-13 21:53:45', 'admin', '2021-10-13 23:48:15', ''),
	(2008, '效果展示', 2000, 1, 'dashboard', 'report/resource/dashboard', NULL, 1, 0, 'C', '0', '0', '', 'tongjibaobiao', 'admin', '2021-10-14 09:19:56', 'admin', '2021-10-14 14:16:28', ''),
	(2009, '地图示例', 0, 5, 'map', NULL, NULL, 1, 0, 'M', '0', '0', '', 'ditu', 'admin', '2021-10-14 10:24:52', 'admin', '2021-10-14 13:41:15', ''),
	(2010, '百度地图', 2009, 1, 'baidu', '', NULL, 1, 0, 'M', '0', '0', '', 'baidumap', 'admin', '2021-10-14 10:27:51', 'admin', '2021-10-14 14:05:38', ''),
	(2011, '覆盖物', 2010, 1, 'point', 'map/baidu/point', NULL, 1, 0, 'C', '0', '0', '', 'dibiao', 'admin', '2021-10-14 10:32:55', 'admin', '2021-10-14 13:42:11', ''),
	(2012, '自定义主题', 2010, 2, 'theme', 'map/baidu/theme', NULL, 1, 0, 'C', '0', '0', '', 'button', 'admin', '2021-10-14 10:44:48', 'admin', '2021-10-14 11:25:25', ''),
	(2013, '地图类型', 2010, 3, 'maptype', 'map/baidu/maptype', NULL, 1, 0, 'C', '0', '0', '', 'qiehuan', 'admin', '2021-10-14 10:49:40', 'admin', '2021-10-14 13:53:54', ''),
	(2014, '城市列表', 2010, 4, 'citylist', 'map/baidu/citylist', NULL, 1, 0, 'C', '0', '0', '', 'chengshi', 'admin', '2021-10-14 11:18:25', 'admin', '2021-10-14 13:48:17', ''),
	(2015, '测距', 2010, 5, 'distancetool', 'map/baidu/distancetool', NULL, 1, 0, 'C', '0', '0', NULL, 'design_nor', 'admin', '2021-10-14 11:28:25', '', NULL, ''),
	(2016, '海量点', 2010, 6, 'multipoint', 'map/baidu/multipoint', NULL, 1, 0, 'C', '0', '0', '', 'hailiangdian', 'admin', '2021-10-14 11:44:14', 'admin', '2021-10-14 14:04:34', ''),
	(2017, '交通流量', 2010, 7, 'traffic', 'map/baidu/traffic', NULL, 1, 0, 'C', '0', '0', '', 'jiaotong', 'admin', '2021-10-14 11:54:59', 'admin', '2021-10-14 13:54:43', ''),
	(2018, '瓦片图', 2010, 8, 'transparentpng', 'map/baidu/transparentpng', NULL, 1, 0, 'C', '0', '0', '', 'wapian', 'admin', '2021-10-14 11:57:28', 'admin', '2021-10-14 14:07:14', ''),
	(2019, '行政区划', 2010, 9, 'boundary', 'map/baidu/boundary', NULL, 1, 0, 'C', '0', '0', '', 'quyu', 'admin', '2021-10-14 12:01:59', 'admin', '2021-10-14 13:56:08', ''),
	(2020, '区域检索', 2010, 10, 'nearby', 'map/baidu/nearby', NULL, 1, 0, 'C', '0', '0', NULL, 'international', 'admin', '2021-10-14 12:05:33', '', NULL, ''),
	(2021, '路线规划', 2010, 11, 'transit', 'map/baidu/transit', NULL, 1, 0, 'C', '0', '0', '', 'lianxian', 'admin', '2021-10-14 12:15:18', 'admin', '2021-10-14 13:52:12', ''),
	(2022, '公交检索', 2010, 12, 'bus', 'map/baidu/bus', NULL, 1, 0, 'C', '0', '0', NULL, 'checkbox', 'admin', '2021-10-14 12:24:24', '', NULL, ''),
	(2023, '点聚合', 2010, 13, 'marker', 'map/baidu/marker', NULL, 1, 0, 'C', '0', '0', '', 'huiju', 'admin', '2021-10-14 13:05:48', 'admin', '2021-10-14 13:58:19', ''),
	(2024, '路书', 2010, 14, 'lushu', 'map/baidu/lushu', NULL, 1, 0, 'C', '0', '0', '', 'lushu', 'admin', '2021-10-14 13:17:13', 'admin', '2021-10-14 13:43:43', ''),
	(2025, '热力图', 2010, 15, 'heatmap', 'map/baidu/heatmap', NULL, 1, 0, 'C', '0', '0', '', 'heatmap', 'admin', '2021-10-14 13:19:49', 'admin', '2021-10-14 13:59:41', ''),
	(2026, '弧线', 2010, 16, 'curveline', 'map/baidu/curveline', NULL, 1, 0, 'C', '0', '0', '', 'huxian', 'admin', '2021-10-14 13:25:16', 'admin', '2021-10-14 14:02:17', ''),
	(2027, '菜单', 2010, 17, 'contextmenu', 'map/baidu/contextmenu', NULL, 1, 0, 'C', '0', '0', NULL, 'cascader', 'admin', '2021-10-14 13:30:30', '', NULL, ''),
	(2028, '大屏展示', 0, 6, 'datav', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'monitor', 'admin', '2021-10-14 14:42:11', '', NULL, ''),
	(2029, '大屏01', 2028, 1, 'datav01', 'datav/vuedatav/datav01', NULL, 1, 0, 'C', '0', '0', '', 'textarea', 'admin', '2021-10-14 14:44:12', 'admin', '2021-10-14 14:47:37', ''),
	(2030, '数据源配置', 2000, 1, 'sys_source_config', 'system/sys_source_config/index', '', 1, 0, 'C', '0', '0', 'system:sys_source_config:list', 'example', 'admin', '2020-12-01 17:11:00', 'admin', '2020-12-01 17:14:19', '数据源配置菜单'),
	(2031, '数据源配置查询', 2030, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:sys_source_config:query', '#', 'admin', '2020-12-01 17:11:00', '', NULL, ''),
	(2032, '数据源配置新增', 2030, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:sys_source_config:add', '#', 'admin', '2020-12-01 17:11:00', '', NULL, ''),
	(2033, '数据源配置修改', 2030, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:sys_source_config:edit', '#', 'admin', '2020-12-01 17:11:00', '', NULL, ''),
	(2034, '数据源配置删除', 2030, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:sys_source_config:remove', '#', 'admin', '2020-12-01 17:11:00', '', NULL, ''),
	(2035, '数据源配置导出', 2030, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:sys_source_config:export', '#', 'admin', '2020-12-01 17:11:00', '', NULL, ''),
	(2036, 'SQL编辑器', 2000, 4, 'design', 'report/resource/design', NULL, 1, 0, 'C', '0', '0', NULL, 'code', 'admin', '2021-10-20 09:45:00', '', NULL, '');

DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE IF NOT EXISTS `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='通知公告表';


DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE IF NOT EXISTS `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb3 COMMENT='操作日志记录';


INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
	(1, '操作日志', 9, 'com.ruoyi.web.controller.monitor.SysOperlogController.clean()', 'DELETE', 1, 'admin', NULL, '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 00:18:32'),
	(2, '登录日志', 9, 'com.ruoyi.web.controller.monitor.SysLogininforController.clean()', 'DELETE', 1, 'admin', NULL, '/monitor/logininfor/clean', '127.0.0.1', '内网IP', '{}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 00:18:46'),
	(3, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{"noticeContent":"新版本内容","createBy":"admin","createTime":1634054506000,"updateBy":"admin","noticeType":"2","remark":"管理员","params":{},"noticeId":1,"noticeTitle":"温馨提醒：2018-07-01 若依新版本发布啦","status":"1"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 00:30:28'),
	(4, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{"noticeContent":"<p>维护内容</p>","createBy":"admin","createTime":1634054506000,"updateBy":"admin","noticeType":"1","remark":"管理员","params":{},"noticeId":2,"noticeTitle":"维护通知：2018-07-01 若依系统凌晨维护","status":"1"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 00:30:34'),
	(5, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{"roles":[{"flag":false,"roleId":2,"admin":false,"dataScope":"2","params":{},"roleSort":"2","deptCheckStrictly":false,"menuCheckStrictly":false,"roleKey":"common","roleName":"普通角色","status":"0"}],"phonenumber":"15666666666","admin":false,"loginDate":1634054505000,"remark":"测试员","delFlag":"0","password":"","updateBy":"admin","postIds":[2],"loginIp":"127.0.0.1","email":"ry@qq.com","nickName":"测试","sex":"1","deptId":105,"avatar":"","dept":{"deptName":"测试部门","leader":"若依","deptId":105,"orderNum":"3","params":{},"parentId":101,"children":[],"status":"0"},"params":{},"userName":"ry","userId":2,"createBy":"admin","roleIds":[2],"createTime":1634054505000,"status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 11:26:03'),
	(6, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{"postSort":"1","flag":false,"remark":"","postId":1,"params":{},"createBy":"admin","createTime":1634054505000,"updateBy":"admin","postName":"董事长","postCode":"CEO","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 11:27:09'),
	(7, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{"postSort":"3","flag":false,"remark":"","postId":3,"params":{},"createBy":"admin","createTime":1634054505000,"updateBy":"admin","postName":"人力资源","postCode":"HR","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 11:27:19'),
	(8, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"report","orderNum":"6","menuName":"报表中心","params":{},"parentId":0,"isCache":"0","path":"#","createBy":"admin","children":[],"isFrame":"1","menuType":"M","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 17:25:40'),
	(9, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"report","orderNum":"6","menuName":"报表中心","params":{},"parentId":0,"isCache":"0","path":"report","children":[],"createTime":1634117140000,"updateBy":"admin","isFrame":"1","menuId":2000,"menuType":"M","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 17:26:00'),
	(10, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"report","orderNum":"4","menuName":"报表中心","params":{},"parentId":0,"isCache":"0","path":"report","children":[],"createTime":1634117140000,"updateBy":"admin","isFrame":"1","menuId":2000,"menuType":"M","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 17:26:06'),
	(11, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"resource","orderNum":"1","menuName":"数据源","params":{},"parentId":2000,"isCache":"0","path":"report:resource","createBy":"admin","children":[],"isFrame":"1","menuType":"M","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 17:29:49'),
	(12, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"resource","orderNum":"1","menuName":"数据源","params":{},"parentId":2000,"isCache":"0","path":"resource","component":"report/resource/Index","children":[],"createTime":1634117389000,"updateBy":"admin","isFrame":"1","menuId":2001,"menuType":"C","perms":"report:resource","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 17:32:32'),
	(13, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"resource","orderNum":"1","menuName":"数据源","params":{},"parentId":2000,"isCache":"0","path":"resource","component":"report/resource/index","children":[],"createTime":1634117389000,"updateBy":"admin","isFrame":"1","menuId":2001,"menuType":"C","perms":"report:resource","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 17:36:12'),
	(14, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"resource","orderNum":"1","menuName":"数据源","params":{},"parentId":2000,"isCache":"0","path":"resource","component":"report/resource/index","children":[],"createTime":1634117389000,"updateBy":"admin","isFrame":"1","menuId":2001,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 17:38:39'),
	(15, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'report_data_resource', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 21:41:32'),
	(16, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{"createBy":"admin","dictName":"连接类型","remark":"数据库类型","params":{},"dictType":"conn_type","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 21:47:24'),
	(17, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{"dictValue":"Mysql","listClass":"default","dictSort":0,"remark":"Mysql数据库","params":{},"dictType":"conn_type","dictLabel":"Mysql","createBy":"admin","default":false,"status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 21:48:06'),
	(18, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{"dictValue":"Mongo","listClass":"default","dictSort":1,"remark":"Mongo数据库","params":{},"dictType":"conn_type","dictLabel":"Mongo","createBy":"admin","default":false,"status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 21:48:32'),
	(19, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{"sub":false,"functionAuthor":"ruoyi","columns":[{"capJavaField":"Id","usableColumn":false,"columnId":1,"isIncrement":"1","increment":true,"insert":true,"dictType":"","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"id","htmlType":"input","edit":false,"query":false,"sort":1,"list":false,"params":{},"javaType":"Long","queryType":"EQ","columnType":"int(11)","createBy":"admin","isPk":"1","createTime":1634132492000,"tableId":1,"pk":true,"columnName":"id"},{"capJavaField":"Connname","usableColumn":false,"columnId":2,"isIncrement":"0","increment":false,"insert":true,"isList":"1","dictType":"","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"connname","htmlType":"input","edit":true,"query":true,"isQuery":"1","sort":2,"list":true,"params":{},"javaType":"String","queryType":"LIKE","columnType":"varchar(100)","createBy":"admin","isPk":"0","createTime":1634132492000,"isEdit":"1","tableId":1,"pk":false,"columnName":"connName"},{"capJavaField":"Conndriverclass","usableColumn":false,"columnId":3,"isIncrement":"0","increment":false,"insert":true,"isList":"1","dictType":"","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"conndriverclass","htmlType":"input","edit":true,"query":true,"isQuery":"1","sort":3,"list":true,"params":{},"javaType":"String","queryType":"EQ","columnType":"varchar(100)","createBy":"admin","isPk":"0","createTime":1634132492000,"isEdit":"1","tableId":1,"pk":false,"columnName":"connDriverClass"},{"capJavaField":"Conntype","usableColumn":false,"columnId":4,"isIncrement":"0","increment":false,"insert":true,"isList":"1","dictType":"conn_type","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"conntype","htmlType":"select","edit":true,"query":true,"isQuery":"1","sort":4,"list":true,"params":{},"javaType":"String","queryType":"EQ","columnType":"varchar(50)","createBy":"admin","isPk":"0","createTime":1634132492000,"isEdit":"1","tableId":1,"pk":false,"col', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 21:49:31'),
	(20, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-10-13 21:49:35'),
	(21, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{menuId=2001}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 21:50:13'),
	(22, '报数据源管理', 1, 'com.ruoyi.web.controller.report.ReportDataResourceController.add()', 'POST', 1, 'admin', NULL, '/report/resource', '127.0.0.1', '内网IP', '{"conntype":"Mysql","connname":"Test01","createdate":1634054400000,"connip":"192.168.0.11","params":{},"connport":"3306","connpassword":"123","id":1,"connusername":"root"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 22:29:38'),
	(23, '报数据源管理', 5, 'com.ruoyi.web.controller.report.ReportDataResourceController.export()', 'GET', 1, 'admin', NULL, '/report/resource/export', '127.0.0.1', '内网IP', '{}', '{"msg":"7bf73cd9-a813-424e-a750-25f25d611757_报数据源管理数据.xlsx","code":200}', 0, NULL, '2021-10-13 22:31:09'),
	(24, '报数据源管理', 5, 'com.ruoyi.web.controller.report.ReportDataResourceController.export()', 'GET', 1, 'admin', NULL, '/report/resource/export', '127.0.0.1', '内网IP', '{}', '{"msg":"aaa905e8-e2a4-4705-9191-7c1d19736803_报数据源管理数据.xlsx","code":200}', 0, NULL, '2021-10-13 22:34:50'),
	(25, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/report_data_resource', '127.0.0.1', '内网IP', '{tableName=report_data_resource}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 22:39:16'),
	(26, '报数据源管理', 5, 'com.ruoyi.web.controller.report.ReportDataResourceController.export()', 'GET', 1, 'admin', NULL, '/report/resource/export', '127.0.0.1', '内网IP', '{}', '{"msg":"b20872be-eecb-4378-beb1-4755e16ae63c_报数据源管理数据.xlsx","code":200}', 0, NULL, '2021-10-13 22:40:10'),
	(27, '报数据源管理', 2, 'com.ruoyi.web.controller.report.ReportDataResourceController.edit()', 'PUT', 1, 'admin', NULL, '/report/resource', '127.0.0.1', '内网IP', '{"conntype":"Mysql","connname":"Test01","createdate":1634054400000,"connip":"192.168.0.11","params":{},"connport":"3306","conndriverclass":"com.mysql.cj.jdbc.Driver","connpassword":"123","id":1,"connusername":"root"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 22:46:04'),
	(28, '报数据源管理', 1, 'com.ruoyi.web.controller.report.ReportDataResourceController.add()', 'POST', 1, 'admin', NULL, '/report/resource', '127.0.0.1', '内网IP', '{"conntype":"Mongo","connname":"Test02","createdate":1634054400000,"connip":"127.0.0.1","params":{},"connport":"27017","connpassword":"111111","id":2,"connusername":"admin"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 22:56:26'),
	(29, '报数据源管理', 2, 'com.ruoyi.web.controller.report.ReportDataResourceController.edit()', 'PUT', 1, 'admin', NULL, '/report/resource', '127.0.0.1', '内网IP', '{"connproperty":"serverTimezone=UTC","conntype":"Mysql","connname":"Test01","createdate":1634054400000,"connip":"192.168.0.11","params":{},"connport":"3306","conndriverclass":"com.mysql.cj.jdbc.Driver","connpassword":"123","id":1,"connusername":"root"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 22:58:16'),
	(30, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"#","orderNum":"1","menuName":"数据源管理","params":{},"parentId":2000,"isCache":"0","path":"resource","component":"report/resource/index","children":[],"createTime":1634133224000,"updateBy":"admin","isFrame":"1","menuId":2002,"menuType":"C","perms":"report:resource:list","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:03:13'),
	(31, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"resource","orderNum":"1","menuName":"数据源管理","params":{},"parentId":2000,"isCache":"0","path":"resource","component":"report/resource/index","children":[],"createTime":1634133224000,"updateBy":"admin","isFrame":"1","menuId":2002,"menuType":"C","perms":"report:resource:list","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:03:47'),
	(32, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"report","orderNum":"1","menuName":"数据源管理","params":{},"parentId":2000,"isCache":"0","path":"resource","component":"report/resource/index","children":[],"createTime":1634133224000,"updateBy":"admin","isFrame":"1","menuId":2002,"menuType":"C","perms":"report:resource:list","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:16:06'),
	(33, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"data-source","orderNum":"1","menuName":"数据源管理","params":{},"parentId":2000,"isCache":"0","path":"resource","component":"report/resource/index","children":[],"createTime":1634133224000,"updateBy":"admin","isFrame":"1","menuId":2002,"menuType":"C","perms":"report:resource:list","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:18:47'),
	(34, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"bxs-data","orderNum":"1","menuName":"数据源管理","params":{},"parentId":2000,"isCache":"0","path":"resource","component":"report/resource/index","children":[],"createTime":1634133224000,"updateBy":"admin","isFrame":"1","menuId":2002,"menuType":"C","perms":"report:resource:list","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:20:25'),
	(35, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"#","orderNum":"1","menuName":"查询","params":{},"parentId":2002,"isCache":"0","path":"#","component":"","children":[],"createTime":1634133225000,"updateBy":"admin","isFrame":"1","menuId":2003,"menuType":"F","perms":"report:resource:query","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:46:35'),
	(36, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"#","orderNum":"2","menuName":"新增","params":{},"parentId":2002,"isCache":"0","path":"#","component":"","children":[],"createTime":1634133225000,"updateBy":"admin","isFrame":"1","menuId":2004,"menuType":"F","perms":"report:resource:add","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:46:49'),
	(37, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"#","orderNum":"3","menuName":"报修改","params":{},"parentId":2002,"isCache":"0","path":"#","component":"","children":[],"createTime":1634133225000,"updateBy":"admin","isFrame":"1","menuId":2005,"menuType":"F","perms":"report:resource:edit","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:46:59'),
	(38, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"#","orderNum":"4","menuName":"删除","params":{},"parentId":2002,"isCache":"0","path":"#","component":"","children":[],"createTime":1634133225000,"updateBy":"admin","isFrame":"1","menuId":2006,"menuType":"F","perms":"report:resource:remove","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:47:11'),
	(39, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"#","orderNum":"5","menuName":"导出","params":{},"parentId":2002,"isCache":"0","path":"#","component":"","children":[],"createTime":1634133225000,"updateBy":"admin","isFrame":"1","menuId":2007,"menuType":"F","perms":"report:resource:export","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:47:19'),
	(40, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"#","orderNum":"1","menuName":"查询数据源","params":{},"parentId":2002,"isCache":"0","path":"#","component":"","children":[],"createTime":1634133225000,"updateBy":"admin","isFrame":"1","menuId":2003,"menuType":"F","perms":"report:resource:query","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:47:40'),
	(41, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"#","orderNum":"2","menuName":"新增数据源","params":{},"parentId":2002,"isCache":"0","path":"#","component":"","children":[],"createTime":1634133225000,"updateBy":"admin","isFrame":"1","menuId":2004,"menuType":"F","perms":"report:resource:add","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:47:48'),
	(42, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"#","orderNum":"3","menuName":"修改数据源","params":{},"parentId":2002,"isCache":"0","path":"#","component":"","children":[],"createTime":1634133225000,"updateBy":"admin","isFrame":"1","menuId":2005,"menuType":"F","perms":"report:resource:edit","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:47:58'),
	(43, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"#","orderNum":"4","menuName":"删除数据源","params":{},"parentId":2002,"isCache":"0","path":"#","component":"","children":[],"createTime":1634133225000,"updateBy":"admin","isFrame":"1","menuId":2006,"menuType":"F","perms":"report:resource:remove","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:48:07'),
	(44, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"#","orderNum":"5","menuName":"导出数据源","params":{},"parentId":2002,"isCache":"0","path":"#","component":"","children":[],"createTime":1634133225000,"updateBy":"admin","isFrame":"1","menuId":2007,"menuType":"F","perms":"report:resource:export","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:48:15'),
	(45, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-13 23:49:25'),
	(46, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"dashboard","orderNum":"1","menuName":"效果展示","params":{},"parentId":2000,"isCache":"0","path":"dashboard","component":"report/resource/dashboard","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 09:19:56'),
	(47, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"dashboard","orderNum":"2","menuName":"效果展示","params":{},"parentId":2000,"isCache":"0","path":"dashboard","component":"report/resource/dashboard","children":[],"createTime":1634174396000,"updateBy":"admin","isFrame":"1","menuId":2008,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 09:20:05'),
	(48, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"bxs-data","orderNum":"2","menuName":"数据源管理","params":{},"parentId":2000,"isCache":"0","path":"resource","component":"report/resource/index","children":[],"createTime":1634133224000,"updateBy":"admin","isFrame":"1","menuId":2002,"menuType":"C","perms":"report:resource:list","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 09:20:33'),
	(49, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"dashboard","orderNum":"1","menuName":"效果展示","params":{},"parentId":2000,"isCache":"0","path":"dashboard","component":"report/resource/dashboard","children":[],"createTime":1634174396000,"updateBy":"admin","isFrame":"1","menuId":2008,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 09:20:38'),
	(50, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"international","orderNum":"5","menuName":"地图示例","params":{},"parentId":0,"isCache":"0","path":"report","createBy":"admin","children":[],"isFrame":"1","menuType":"M","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 10:24:52'),
	(51, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"international","orderNum":"5","menuName":"地图示例","params":{},"parentId":0,"isCache":"0","path":"map","children":[],"createTime":1634178292000,"updateBy":"admin","isFrame":"1","menuId":2009,"menuType":"M","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 10:25:15'),
	(52, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"color","orderNum":"1","menuName":"百度地图","params":{},"parentId":2009,"isCache":"0","path":"baidu","component":"map/baidu/index","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 10:27:51'),
	(53, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"color","orderNum":"1","menuName":"百度地图","params":{},"parentId":2009,"isCache":"0","path":"baidu","component":"map/baidu/index","children":[],"createTime":1634178471000,"updateBy":"admin","isFrame":"1","menuId":2010,"menuType":"M","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 10:31:40'),
	(54, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"color","orderNum":"1","menuName":"百度地图","params":{},"parentId":2009,"isCache":"0","path":"baidu","component":"","children":[],"createTime":1634178471000,"updateBy":"admin","isFrame":"1","menuId":2010,"menuType":"M","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 10:32:06'),
	(55, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"guide","orderNum":"1","menuName":"点标记","params":{},"parentId":2010,"isCache":"0","path":"baidu","component":"map/baidu/index","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 10:32:55'),
	(56, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"guide","orderNum":"1","menuName":"覆盖物","params":{},"parentId":2010,"isCache":"0","path":"baidu","component":"map/baidu/index","children":[],"createTime":1634178775000,"updateBy":"admin","isFrame":"1","menuId":2011,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 10:34:54'),
	(57, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"guide","orderNum":"1","menuName":"覆盖物","params":{},"parentId":2010,"isCache":"0","path":"baidu","component":"map/baidu/point","children":[],"createTime":1634178775000,"updateBy":"admin","isFrame":"1","menuId":2011,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 10:39:47'),
	(58, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"button","orderNum":"2","menuName":"自定义主题","params":{},"parentId":2010,"isCache":"0","path":"theme","component":"map/baidu/theme","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 10:44:48'),
	(59, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"component","orderNum":"3","menuName":"地图类型","params":{},"parentId":2010,"isCache":"0","path":"maptype","component":"map/baidu/maptype","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 10:49:40'),
	(60, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"eye-open","orderNum":"4","menuName":"城市列表","params":{},"parentId":2010,"isCache":"0","path":"plugin","component":"map/baidu/plugin","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 11:18:25'),
	(61, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"eye-open","orderNum":"4","menuName":"城市列表","params":{},"parentId":2010,"isCache":"0","path":"citylist","component":"map/baidu/citylist","children":[],"createTime":1634181505000,"updateBy":"admin","isFrame":"1","menuId":2014,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 11:23:46'),
	(62, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"button","orderNum":"2","menuName":"自定义主题","params":{},"parentId":2010,"isCache":"0","path":"baidu","component":"map/baidu/theme","children":[],"createTime":1634179488000,"updateBy":"admin","isFrame":"1","menuId":2012,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 11:24:20'),
	(63, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"component","orderNum":"3","menuName":"地图类型","params":{},"parentId":2010,"isCache":"0","path":"baidu","component":"map/baidu/maptype","children":[],"createTime":1634179780000,"updateBy":"admin","isFrame":"1","menuId":2013,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 11:24:27'),
	(64, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"eye-open","orderNum":"4","menuName":"城市列表","params":{},"parentId":2010,"isCache":"0","path":"baidu","component":"map/baidu/citylist","children":[],"createTime":1634181505000,"updateBy":"admin","isFrame":"1","menuId":2014,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 11:24:34'),
	(65, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"component","orderNum":"3","menuName":"地图类型","params":{},"parentId":2010,"isCache":"0","path":"maptype","component":"map/baidu/maptype","children":[],"createTime":1634179780000,"updateBy":"admin","isFrame":"1","menuId":2013,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 11:25:11'),
	(66, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"eye-open","orderNum":"4","menuName":"城市列表","params":{},"parentId":2010,"isCache":"0","path":"citylist","component":"map/baidu/citylist","children":[],"createTime":1634181505000,"updateBy":"admin","isFrame":"1","menuId":2014,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 11:25:18'),
	(67, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"button","orderNum":"2","menuName":"自定义主题","params":{},"parentId":2010,"isCache":"0","path":"theme","component":"map/baidu/theme","children":[],"createTime":1634179488000,"updateBy":"admin","isFrame":"1","menuId":2012,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 11:25:25'),
	(68, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"guide","orderNum":"1","menuName":"覆盖物","params":{},"parentId":2010,"isCache":"0","path":"point","component":"map/baidu/point","children":[],"createTime":1634178775000,"updateBy":"admin","isFrame":"1","menuId":2011,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 11:25:33'),
	(69, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"design_nor","orderNum":"5","menuName":"测距","params":{},"parentId":2010,"isCache":"0","path":"distancetool","component":"map/baidu/distancetool","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 11:28:25'),
	(70, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"color","orderNum":"6","menuName":"海量点","params":{},"parentId":2010,"isCache":"0","path":"multipoint","component":"map/baidu/multipoint","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 11:44:14'),
	(71, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"cascader","orderNum":"7","menuName":"交通流量","params":{},"parentId":2010,"isCache":"0","path":"traffic","component":"map/baidu/traffic","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 11:54:59'),
	(72, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"eye-open","orderNum":"8","menuName":"瓦片图","params":{},"parentId":2010,"isCache":"0","path":"transparentpng","component":"map/baidu/transparentpng","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 11:57:28'),
	(73, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"exit-fullscreen","orderNum":"9","menuName":"行政区划","params":{},"parentId":2010,"isCache":"0","path":"boundary","component":"map/baidu/boundary","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 12:01:59'),
	(74, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"international","orderNum":"10","menuName":"区域检索","params":{},"parentId":2010,"isCache":"0","path":"nearby","component":"map/baidu/nearby","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 12:05:33'),
	(75, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"bug","orderNum":"11","menuName":"公交路线","params":{},"parentId":2010,"isCache":"0","path":"transit","component":"map/baidu/transit","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 12:15:18'),
	(76, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"bug","orderNum":"11","menuName":"路线规划","params":{},"parentId":2010,"isCache":"0","path":"transit","component":"map/baidu/transit","children":[],"createTime":1634184918000,"updateBy":"admin","isFrame":"1","menuId":2021,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 12:22:27'),
	(77, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"checkbox","orderNum":"12","menuName":"公交检索","params":{},"parentId":2010,"isCache":"0","path":"bus","component":"map/baidu/bus","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 12:24:24'),
	(78, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"download","orderNum":"13","menuName":"点聚合","params":{},"parentId":2010,"isCache":"0","path":"marker","component":"map/baidu/marker","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:05:48'),
	(79, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"nested","orderNum":"13","menuName":"点聚合","params":{},"parentId":2010,"isCache":"0","path":"marker","component":"map/baidu/marker","children":[],"createTime":1634187948000,"updateBy":"admin","isFrame":"1","menuId":2023,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:07:26'),
	(80, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"drag","orderNum":"14","menuName":"路书","params":{},"parentId":2010,"isCache":"0","path":"lushu","component":"map/baidu/lushu","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:17:13'),
	(81, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"color","orderNum":"15","menuName":"热力图","params":{},"parentId":2010,"isCache":"0","path":"heatmap","component":"map/baidu/heatmap","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:19:49'),
	(82, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"eye","orderNum":"16","menuName":"弧线","params":{},"parentId":2010,"isCache":"0","path":"curveline","component":"map/baidu/curveline","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:25:16'),
	(83, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"cascader","orderNum":"17","menuName":"菜单","params":{},"parentId":2010,"isCache":"0","path":"contextmenu","component":"map/baidu/contextmenu","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:30:30'),
	(84, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"ditu","orderNum":"5","menuName":"地图示例","params":{},"parentId":0,"isCache":"0","path":"map","children":[],"createTime":1634178292000,"updateBy":"admin","isFrame":"1","menuId":2009,"menuType":"M","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:41:15'),
	(85, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"dibiao","orderNum":"1","menuName":"覆盖物","params":{},"parentId":2010,"isCache":"0","path":"point","component":"map/baidu/point","children":[],"createTime":1634178775000,"updateBy":"admin","isFrame":"1","menuId":2011,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:42:11'),
	(86, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"lushu","orderNum":"14","menuName":"路书","params":{},"parentId":2010,"isCache":"0","path":"lushu","component":"map/baidu/lushu","children":[],"createTime":1634188633000,"updateBy":"admin","isFrame":"1","menuId":2024,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:43:43'),
	(87, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"luxian","orderNum":"11","menuName":"路线规划","params":{},"parentId":2010,"isCache":"0","path":"transit","component":"map/baidu/transit","children":[],"createTime":1634184918000,"updateBy":"admin","isFrame":"1","menuId":2021,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:44:39'),
	(88, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"juhe","orderNum":"13","menuName":"点聚合","params":{},"parentId":2010,"isCache":"0","path":"marker","component":"map/baidu/marker","children":[],"createTime":1634187948000,"updateBy":"admin","isFrame":"1","menuId":2023,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:47:05'),
	(89, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"chengshi","orderNum":"4","menuName":"城市列表","params":{},"parentId":2010,"isCache":"0","path":"citylist","component":"map/baidu/citylist","children":[],"createTime":1634181505000,"updateBy":"admin","isFrame":"1","menuId":2014,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:48:17'),
	(90, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"daohang","orderNum":"7","menuName":"交通流量","params":{},"parentId":2010,"isCache":"0","path":"traffic","component":"map/baidu/traffic","children":[],"createTime":1634183699000,"updateBy":"admin","isFrame":"1","menuId":2017,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:50:50'),
	(91, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"lianxian","orderNum":"11","menuName":"路线规划","params":{},"parentId":2010,"isCache":"0","path":"transit","component":"map/baidu/transit","children":[],"createTime":1634184918000,"updateBy":"admin","isFrame":"1","menuId":2021,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:52:12'),
	(92, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"cardaohang","orderNum":"7","menuName":"交通流量","params":{},"parentId":2010,"isCache":"0","path":"traffic","component":"map/baidu/traffic","children":[],"createTime":1634183699000,"updateBy":"admin","isFrame":"1","menuId":2017,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:52:58'),
	(93, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"qiehuan","orderNum":"3","menuName":"地图类型","params":{},"parentId":2010,"isCache":"0","path":"maptype","component":"map/baidu/maptype","children":[],"createTime":1634179780000,"updateBy":"admin","isFrame":"1","menuId":2013,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:53:54'),
	(94, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"jiaotong","orderNum":"7","menuName":"交通流量","params":{},"parentId":2010,"isCache":"0","path":"traffic","component":"map/baidu/traffic","children":[],"createTime":1634183699000,"updateBy":"admin","isFrame":"1","menuId":2017,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:54:43'),
	(95, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"quyu","orderNum":"9","menuName":"行政区划","params":{},"parentId":2010,"isCache":"0","path":"boundary","component":"map/baidu/boundary","children":[],"createTime":1634184119000,"updateBy":"admin","isFrame":"1","menuId":2019,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:56:08'),
	(96, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"huiju","orderNum":"13","menuName":"点聚合","params":{},"parentId":2010,"isCache":"0","path":"marker","component":"map/baidu/marker","children":[],"createTime":1634187948000,"updateBy":"admin","isFrame":"1","menuId":2023,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:58:19'),
	(97, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"heatmap","orderNum":"15","menuName":"热力图","params":{},"parentId":2010,"isCache":"0","path":"heatmap","component":"map/baidu/heatmap","children":[],"createTime":1634188789000,"updateBy":"admin","isFrame":"1","menuId":2025,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 13:59:41'),
	(98, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"huxian","orderNum":"16","menuName":"弧线","params":{},"parentId":2010,"isCache":"0","path":"curveline","component":"map/baidu/curveline","children":[],"createTime":1634189116000,"updateBy":"admin","isFrame":"1","menuId":2026,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 14:02:17'),
	(99, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"hailiangdian","orderNum":"6","menuName":"海量点","params":{},"parentId":2010,"isCache":"0","path":"multipoint","component":"map/baidu/multipoint","children":[],"createTime":1634183054000,"updateBy":"admin","isFrame":"1","menuId":2016,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 14:04:34'),
	(100, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"baidumap","orderNum":"1","menuName":"百度地图","params":{},"parentId":2009,"isCache":"0","path":"baidu","component":"","children":[],"createTime":1634178471000,"updateBy":"admin","isFrame":"1","menuId":2010,"menuType":"M","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 14:05:38'),
	(101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"wapian","orderNum":"8","menuName":"瓦片图","params":{},"parentId":2010,"isCache":"0","path":"transparentpng","component":"map/baidu/transparentpng","children":[],"createTime":1634183848000,"updateBy":"admin","isFrame":"1","menuId":2018,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 14:07:14'),
	(102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"tongjibaobiao","orderNum":"1","menuName":"效果展示","params":{},"parentId":2000,"isCache":"0","path":"dashboard","component":"report/resource/dashboard","children":[],"createTime":1634174396000,"updateBy":"admin","isFrame":"1","menuId":2008,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 14:16:28'),
	(103, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"monitor","orderNum":"6","menuName":"大屏展示","params":{},"parentId":0,"isCache":"0","path":"datav","createBy":"admin","children":[],"isFrame":"1","menuType":"M","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 14:42:11'),
	(104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","orderNum":"1","menuName":"大屏01","params":{},"parentId":2028,"isCache":"0","path":"datav01","component":"datav/datv01","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 14:44:12'),
	(105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"textarea","orderNum":"1","menuName":"大屏01","params":{},"parentId":2028,"isCache":"0","path":"datav01","component":"datav/datv01","children":[],"createTime":1634193852000,"updateBy":"admin","isFrame":"1","menuId":2029,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 14:44:43'),
	(106, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"textarea","orderNum":"1","menuName":"大屏01","params":{},"parentId":2028,"isCache":"0","path":"datav01","component":"datav/vuedatav/datav01","children":[],"createTime":1634193852000,"updateBy":"admin","isFrame":"1","menuId":2029,"menuType":"C","perms":"","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-14 14:47:37'),
	(107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/report_data_resource', '127.0.0.1', '内网IP', '{tableName=report_data_resource}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-18 19:37:12'),
	(108, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{"sub":false,"functionAuthor":"ruoyi","columns":[{"capJavaField":"Id","usableColumn":false,"columnId":1,"isIncrement":"1","increment":true,"insert":true,"dictType":"","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"id","htmlType":"input","edit":false,"query":false,"columnComment":"序号","updateTime":1634132971000,"sort":1,"list":false,"params":{},"javaType":"Long","queryType":"EQ","columnType":"int(11)","createBy":"admin","isPk":"1","createTime":1634132492000,"tableId":1,"pk":true,"columnName":"id"},{"capJavaField":"Connname","usableColumn":false,"columnId":2,"isIncrement":"0","increment":false,"insert":true,"isList":"1","dictType":"","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"connname","htmlType":"input","edit":true,"query":true,"columnComment":"连接名称","isQuery":"1","updateTime":1634132971000,"sort":2,"list":true,"params":{},"javaType":"String","queryType":"LIKE","columnType":"varchar(100)","createBy":"admin","isPk":"0","createTime":1634132492000,"isEdit":"1","tableId":1,"pk":false,"columnName":"connName"},{"capJavaField":"Conndriverclass","usableColumn":false,"columnId":3,"isIncrement":"0","increment":false,"insert":true,"isList":"1","dictType":"","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"conndriverclass","htmlType":"input","edit":true,"query":true,"columnComment":"驱动包名","isQuery":"1","updateTime":1634132971000,"sort":3,"list":true,"params":{},"javaType":"String","queryType":"EQ","columnType":"varchar(100)","createBy":"admin","isPk":"0","createTime":1634132492000,"isEdit":"1","tableId":1,"pk":false,"columnName":"connDriverClass"},{"capJavaField":"Conntype","usableColumn":false,"columnId":4,"isIncrement":"0","increment":false,"insert":true,"isList":"1","dictType":"conn_type","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"conntype","htmlType":"select","edit":true,"query":true,"columnComment":"数据库类型","isQuery":"1","updateTime":163413297', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-18 19:39:11'),
	(109, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/report_data_resource', '127.0.0.1', '内网IP', '{tableName=report_data_resource}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-18 19:39:16'),
	(110, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{"sub":false,"functionAuthor":"ruoyi","columns":[{"capJavaField":"Id","usableColumn":false,"columnId":1,"isIncrement":"1","increment":true,"insert":true,"dictType":"","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"id","htmlType":"input","edit":false,"query":false,"columnComment":"序号","updateTime":1634557151000,"sort":1,"list":false,"params":{},"javaType":"Long","queryType":"EQ","columnType":"int(11)","createBy":"admin","isPk":"1","createTime":1634132492000,"tableId":1,"pk":true,"columnName":"id"},{"capJavaField":"Connname","usableColumn":false,"columnId":2,"isIncrement":"0","increment":false,"insert":true,"isList":"1","dictType":"","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"connname","htmlType":"input","edit":true,"query":true,"columnComment":"连接名称","isQuery":"1","updateTime":1634557151000,"sort":2,"list":true,"params":{},"javaType":"String","queryType":"LIKE","columnType":"varchar(100)","createBy":"admin","isPk":"0","createTime":1634132492000,"isEdit":"1","tableId":1,"pk":false,"columnName":"connName"},{"capJavaField":"Conndriverclass","usableColumn":false,"columnId":3,"isIncrement":"0","increment":false,"insert":true,"isList":"1","dictType":"","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"conndriverclass","htmlType":"input","edit":true,"query":true,"columnComment":"驱动包名","isQuery":"1","updateTime":1634557151000,"sort":3,"list":true,"params":{},"javaType":"String","queryType":"EQ","columnType":"varchar(100)","createBy":"admin","isPk":"0","createTime":1634132492000,"isEdit":"1","tableId":1,"pk":false,"columnName":"connDriverClass"},{"capJavaField":"Conntype","usableColumn":false,"columnId":4,"isIncrement":"0","increment":false,"insert":true,"isList":"1","dictType":"conn_type","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"conntype","htmlType":"select","edit":true,"query":true,"columnComment":"数据库类型","isQuery":"1","updateTime":163455715', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-18 19:41:02'),
	(111, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_source_config', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-18 19:41:09'),
	(112, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{"sub":false,"functionAuthor":"ruoyi","columns":[{"capJavaField":"SourceId","usableColumn":false,"columnId":11,"isIncrement":"1","increment":true,"insert":true,"dictType":"","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"sourceId","htmlType":"input","edit":false,"query":false,"columnComment":"id","sort":1,"list":false,"params":{},"javaType":"Long","queryType":"EQ","columnType":"bigint(20)","createBy":"admin","isPk":"1","createTime":1634557269000,"tableId":2,"pk":true,"columnName":"source_id"},{"capJavaField":"SourceCode","usableColumn":false,"columnId":12,"isIncrement":"0","increment":false,"insert":true,"isList":"1","dictType":"","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"sourceCode","htmlType":"input","edit":true,"query":true,"columnComment":"数据源编码","isQuery":"1","sort":2,"list":true,"params":{},"javaType":"String","queryType":"EQ","columnType":"varchar(255)","createBy":"admin","isPk":"0","createTime":1634557269000,"isEdit":"1","tableId":2,"pk":false,"columnName":"source_code"},{"capJavaField":"Project","usableColumn":false,"columnId":13,"isIncrement":"0","increment":false,"insert":true,"isList":"1","dictType":"","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"project","htmlType":"input","edit":true,"query":true,"columnComment":"项目名称","isQuery":"1","sort":3,"list":true,"params":{},"javaType":"String","queryType":"EQ","columnType":"varchar(255)","createBy":"admin","isPk":"0","createTime":1634557269000,"isEdit":"1","tableId":2,"pk":false,"columnName":"project"},{"capJavaField":"PackageName","usableColumn":false,"columnId":14,"isIncrement":"0","increment":false,"insert":true,"isList":"1","dictType":"","required":false,"superColumn":false,"updateBy":"","isInsert":"1","javaField":"packageName","htmlType":"input","edit":true,"query":true,"columnComment":"切面声明包名称","isQuery":"1","sort":4,"list":true,"params":{},"javaType":"String","queryType":"LIKE","columnType":"varchar(255', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-18 19:41:25'),
	(113, '数据源配置', 2, 'com.ruoyi.system.controller.SysSourceConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/sys_source_config', '127.0.0.1', '内网IP', '{"passWord":"Root2020@","sourceId":1,"project":"运管原始库1","params":{},"userName":"root","url":"jdbc:mysql://172.168.9.159:3306/gffp_original?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B8","databaseType":"mysql","sourceCode":"gffp_original","packageName":"com.nxhz.dao.original","drivers":"com.mysql.cj.jdbc.Driver"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-19 11:02:11'),
	(114, '数据源配置', 2, 'com.ruoyi.system.controller.SysSourceConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/sys_source_config', '127.0.0.1', '内网IP', '{"passWord":"Root2020@","sourceId":1,"project":"运管原始库1","params":{},"userName":"root","url":"jdbc:mysql://172.168.9.159:3306/gffp_original?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B8","databaseType":"mysql","sourceCode":"gffp_original","packageName":"com.nxhz.dao.original","drivers":"com.mysql.cj.jdbc.Driver"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-19 11:02:13'),
	(115, '报数据源管理', 2, 'com.ruoyi.web.controller.report.ReportDataResourceController.edit()', 'PUT', 1, 'admin', NULL, '/report/resource', '127.0.0.1', '内网IP', '{"connproperty":"serverTimezone=UTC","conntype":"Mysql","connname":"Test01","createdate":1634054400000,"connip":"192.168.0.11","params":{},"connport":"3306","conndriverclass":"com.mysql.cj.jdbc.Driver","connpassword":"123","id":1,"connusername":"root"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-19 11:02:35'),
	(116, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{"visible":"0","icon":"code","orderNum":"4","menuName":"SQL编辑器","params":{},"parentId":2000,"isCache":"0","path":"design","component":"report/resource/design","createBy":"admin","children":[],"isFrame":"1","menuType":"C","status":"0"}', '{"msg":"操作成功","code":200}', 0, NULL, '2021-10-20 09:45:00');

DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE IF NOT EXISTS `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='岗位信息表';


INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 'CEO', '董事长', 1, '0', 'admin', '2021-10-13 00:01:45', 'admin', '2021-10-13 11:27:09', ''),
	(2, 'se', '项目经理', 2, '0', 'admin', '2021-10-13 00:01:45', '', NULL, ''),
	(3, 'HR', '人力资源', 3, '0', 'admin', '2021-10-13 00:01:45', 'admin', '2021-10-13 11:27:19', ''),
	(4, 'user', '普通员工', 4, '0', 'admin', '2021-10-13 00:01:45', '', NULL, '');

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='角色信息表';


INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-10-13 00:01:45', '', NULL, '超级管理员'),
	(2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-10-13 00:01:45', 'admin', '2021-10-13 00:12:48', '普通角色');

DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE IF NOT EXISTS `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色和部门关联表';


INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES
	(2, 100),
	(2, 101),
	(2, 105);

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色和菜单关联表';


INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
	(2, 1),
	(2, 2),
	(2, 3),
	(2, 100),
	(2, 101),
	(2, 102),
	(2, 103),
	(2, 104),
	(2, 105),
	(2, 106),
	(2, 107),
	(2, 108),
	(2, 109),
	(2, 110),
	(2, 111),
	(2, 112),
	(2, 113),
	(2, 114),
	(2, 115),
	(2, 116),
	(2, 500),
	(2, 501),
	(2, 1001),
	(2, 1002),
	(2, 1003),
	(2, 1004),
	(2, 1005),
	(2, 1006),
	(2, 1007),
	(2, 1008),
	(2, 1009),
	(2, 1010),
	(2, 1011),
	(2, 1012),
	(2, 1013),
	(2, 1014),
	(2, 1015),
	(2, 1016),
	(2, 1017),
	(2, 1018),
	(2, 1019),
	(2, 1020),
	(2, 1021),
	(2, 1022),
	(2, 1023),
	(2, 1024),
	(2, 1025),
	(2, 1026),
	(2, 1027),
	(2, 1028),
	(2, 1029),
	(2, 1030),
	(2, 1031),
	(2, 1032),
	(2, 1033),
	(2, 1034),
	(2, 1035),
	(2, 1036),
	(2, 1037),
	(2, 1038),
	(2, 1039),
	(2, 1040),
	(2, 1041),
	(2, 1042),
	(2, 1043),
	(2, 1044),
	(2, 1045),
	(2, 1046),
	(2, 1047),
	(2, 1048),
	(2, 1049),
	(2, 1050),
	(2, 1051),
	(2, 1052),
	(2, 1053),
	(2, 1054),
	(2, 1055),
	(2, 1056),
	(2, 1057),
	(2, 1058),
	(2, 1059),
	(2, 1060);

DROP TABLE IF EXISTS `sys_source_config`;
CREATE TABLE IF NOT EXISTS `sys_source_config` (
  `source_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `source_code` varchar(255) DEFAULT NULL COMMENT '数据源编码',
  `project` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `package_name` varchar(255) DEFAULT NULL COMMENT '切面声明包名称',
  `url` varchar(255) DEFAULT NULL COMMENT '连接信息',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `pass_word` varchar(255) DEFAULT NULL COMMENT '密码',
  `drivers` varchar(255) DEFAULT NULL COMMENT '数据驱动类',
  `database_type` varchar(255) DEFAULT NULL COMMENT '数据库类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`source_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='数据源配置';


INSERT INTO `sys_source_config` (`source_id`, `source_code`, `project`, `package_name`, `url`, `user_name`, `pass_word`, `drivers`, `database_type`, `remark`) VALUES
	(1, 'gffp_original', '运管原始库1', 'com.nxhz.dao.original', 'jdbc:mysql://172.168.9.159:3306/gffp_original?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B8', 'root', 'Root2020@', 'com.mysql.cj.jdbc.Driver', 'mysql', NULL),
	(2, 'gffp_statistics', '运管统计库', 'com.nxhz.dao.statistics', 'jdbc:mysql://172.168.9.159:3306/gffp_statistics?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B8', 'root', 'Root2020@', 'com.mysql.cj.jdbc.Driver', 'mysql', NULL),
	(3, 'gffp_dictionary', '运管字典库', 'com.nxhz.dao.dictionary', 'jdbc:mysql://172.168.9.159:3306/gffp_dictionary?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B8', 'root', 'Root2020@', 'com.mysql.cj.jdbc.Driver', 'mysql', NULL);

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='用户信息表';


INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 103, 'admin', '手里没有王', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-10-21 15:22:48', 'admin', '2021-10-13 00:01:45', '', '2021-10-21 15:22:48', '管理员'),
	(2, 105, 'ry', '测试', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-10-13 00:01:45', 'admin', '2021-10-13 00:01:45', 'admin', '2021-10-13 11:26:03', '测试员');

DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE IF NOT EXISTS `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户与岗位关联表';


INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES
	(1, 1),
	(2, 2);

DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户和角色关联表';


INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 2);
