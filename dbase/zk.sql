CREATE TABLE IF NOT EXISTS `t_ps_user`
(
    `id`             bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `login_name`     varchar(32)  NOT NULL DEFAULT '' COMMENT '登录名',
    `login_password` varchar(32)  NOT NULL DEFAULT '' COMMENT '登录密码',
    `nick_name`      varchar(32)  NOT NULL DEFAULT '' COMMENT '昵称',
    `role_id`        bigint       NOT NULL DEFAULT 0 COMMENT '关联角色ID',
    `remark`         varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
    `user_status`    tinyint      NOT NULL DEFAULT 1 COMMENT '状态',
    `create_by`      varchar(32)  NOT NULL DEFAULT '' COMMENT '创建人',
    `create_time`    bigint       NOT NULL DEFAULT 0 COMMENT '创建时间',
    `update_by`      varchar(32)  NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`    bigint       NOT NULL DEFAULT 0 COMMENT '更新时间',
    `delete_by`      varchar(32)  NOT NULL DEFAULT '' COMMENT '删除人',
    `delete_flag`    tinyint      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `delete_time`    bigint       NOT NULL DEFAULT 0 COMMENT '删除时间',
    `secret_key`     varchar(255) NOT NULL DEFAULT '' COMMENT '密匙',
    `head_pic`       varchar(64)  NOT NULL DEFAULT '' COMMENT '头像地址',
    `merchant_alia`  varchar(5)   NOT NULL DEFAULT '' COMMENT '平台简称',
    `error_number`   int          NOT NULL DEFAULT 0 COMMENT '错误次数',
    `error_time`     bigint       NOT NULL DEFAULT 0 COMMENT '错误时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10000 COMMENT '后台用户表';

CREATE TABLE IF NOT EXISTS `t_ps_oper_log`
(
    `id`            bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `module_name`   varchar(32)  NOT NULL DEFAULT '' COMMENT '操作模块',
    `content`       varchar(255) NOT NULL DEFAULT '' COMMENT '操作内容',
    `call_url`      varchar(255) NOT NULL DEFAULT '' COMMENT '访问URL',
    `ip_address`    varchar(32)  NOT NULL DEFAULT '' COMMENT 'IP地址',
    `operator`      varchar(32)  NOT NULL DEFAULT '' COMMENT '操作人',
    `remark`        varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
    `merchant_alia` varchar(5)   NOT NULL DEFAULT '' COMMENT '平台简称',
    `create_by`     varchar(32)  NOT NULL DEFAULT '' COMMENT '创建人',
    `create_time`   bigint       NOT NULL DEFAULT 0 COMMENT '创建时间',
    `update_by`     varchar(32)  NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`   bigint       NOT NULL DEFAULT 0 COMMENT '更新时间',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT '权限组件操作日志';


CREATE TABLE IF NOT EXISTS `t_ps_role`
(
    `id`            bigint       NOT NULL DEFAULT 0 COMMENT '主键ID',
    `role_name`     varchar(32)  NOT NULL DEFAULT '' COMMENT '角色名称',
    `role_status`   tinyint      NOT NULL DEFAULT 0 COMMENT '状态',
    `remark`        varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
    `merchant_alia` varchar(5)   NOT NULL DEFAULT '' COMMENT '平台简称',
    `create_by`     varchar(32)  NOT NULL DEFAULT '' COMMENT '创建人',
    `create_time`   bigint       NOT NULL DEFAULT 0 COMMENT '创建时间',
    `update_by`     varchar(32)  NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`   bigint       NOT NULL DEFAULT 0 COMMENT '更新时间',
    `delete_by`     varchar(32)  NOT NULL DEFAULT '' COMMENT '删除人',
    `delete_flag`   tinyint      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `delete_time`   bigint       NOT NULL DEFAULT 0 COMMENT '删除时间',
    `role_level_id` varchar(32)  NOT NULL DEFAULT '' COMMENT '角色层级ID',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `create_time_key` (`create_time`) USING BTREE
) ENGINE = InnoDB COMMENT '权限角色表';

CREATE TABLE IF NOT EXISTS `t_ps_permission`
(
    `id`            bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `role_id`       bigint      NOT NULL DEFAULT 0 COMMENT '角色ID',
    `module_id`     bigint      NOT NULL DEFAULT 0 COMMENT '组件ID',
    `merchant_alia` varchar(5)  NOT NULL DEFAULT '' COMMENT '平台简称',
    `create_by`     varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
    `create_time`   bigint      NOT NULL DEFAULT 0 COMMENT '创建时间',
    `update_by`     varchar(32) NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`   bigint      NOT NULL DEFAULT 0 COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT '权限角色权限绑定表';



CREATE TABLE IF NOT EXISTS `t_ps_module`
(
    `id`            bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `parent_id`     bigint       NOT NULL DEFAULT 0 COMMENT '上级ID',
    `module_name`   varchar(32)  NOT NULL DEFAULT 0 COMMENT '组件名称',
    `module_url`    varchar(255) NOT NULL DEFAULT 0 COMMENT '访问的URL',
    `module_label`  varchar(255) NOT NULL DEFAULT 0 COMMENT '标签',
    `module_level`  tinyint      NOT NULL DEFAULT 0 COMMENT '组件级别',
    `module_order`  varchar(16)  NOT NULL DEFAULT 0 COMMENT '组件排序',
    `module_status` tinyint      NOT NULL DEFAULT 1 COMMENT '状态',
    `remark`        varchar(255) NOT NULL DEFAULT 0 COMMENT '备注',
    `merchant_alia` varchar(5)   NOT NULL DEFAULT '' COMMENT '平台简称',
    `create_by`     varchar(32)  NOT NULL DEFAULT 0 COMMENT '创建人',
    `create_time`   bigint       NOT NULL DEFAULT 0 COMMENT '创建时间',
    `update_by`     varchar(32)  NOT NULL DEFAULT 0 COMMENT '更新人',
    `update_time`   bigint       NOT NULL DEFAULT 0 COMMENT '更新时间',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT '菜单组件配置表';


CREATE TABLE IF NOT EXISTS `t_marquee`
(
    `marquee_id`           bigint       NOT NULL AUTO_INCREMENT COMMENT '跑马灯id',
    `show_id`              varchar(30)  NOT NULL DEFAULT 'PMD-0000' COMMENT '跑马灯唯一标识',
    `state`                tinyint      NOT NULL DEFAULT '0' COMMENT '状态：0 待发布，1 已发布，2 已归档，3 已删除，4已废弃。',
    `t_range`              tinyint      NOT NULL DEFAULT '0' COMMENT '公告范围：0 联盟，1 平台，2 预告。',
    `t_type`               tinyint      NOT NULL DEFAULT '0' COMMENT '播报类型：0 公告，1 活动',
    `is_to_hall`           tinyint      NOT NULL DEFAULT '0' COMMENT '是否发送大厅通知：0 不发送，1 发送。',
    `broadcast_begin_time` bigint       NOT NULL DEFAULT '-28800' COMMENT '播报开始时间',
    `broadcast_end_time`   bigint       NOT NULL DEFAULT '-28800' COMMENT '播报结束时间',
    `broadcast_time`       varchar(30)  NOT NULL DEFAULT '00:00' COMMENT '播报时间',
    `broadcast_count`      int          NOT NULL DEFAULT '0' COMMENT '播报次数',
    `create_by`            varchar(64)  NOT NULL DEFAULT '' COMMENT '创建人',
    `create_time`          bigint       NOT NULL DEFAULT '-28800' COMMENT '创建时间',
    `broadcast_interval`   int          NOT NULL DEFAULT '60' COMMENT '播报间隔',
    `broadcast_content`    varchar(500) NOT NULL DEFAULT '' COMMENT '播报内容',
    PRIMARY KEY (`marquee_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='跑马灯';


CREATE TABLE IF NOT EXISTS `t_popup`
(
    `popup_id`      bigint       NOT NULL AUTO_INCREMENT COMMENT '弹窗id',
    `show_id`       varchar(30)  NOT NULL DEFAULT 'TC-0000' COMMENT '弹窗唯一标识',
    `state`         tinyint      NOT NULL DEFAULT '0' COMMENT '状态：0 待发布，1 已发布，2 已归档，3 已删除，4 已废弃。',
    `is_send`       tinyint      NOT NULL DEFAULT '0' COMMENT '是否发送邮件给平台管理员：0 发送，1 不发送。',
    `is_notice`     tinyint      NOT NULL DEFAULT '0' COMMENT '是否预告跑马灯：0 不预告，1 预告。',
    `is_define`     tinyint      NOT NULL DEFAULT '1' COMMENT '是否自定义 1 模板，2 自定义',
    `t_type`        tinyint      NOT NULL DEFAULT '0' COMMENT '类别：0 大厅，1游戏。',
    `popup_time`    bigint       NOT NULL DEFAULT '-28800' COMMENT '弹窗时间',
    `popup_content` varchar(500) NOT NULL DEFAULT '' COMMENT '弹窗内容',
    `notice_time`   bigint       NOT NULL DEFAULT '0' COMMENT '预告时间',
    `marquee_id`    bigint       NOT NULL DEFAULT '0' COMMENT '跑马灯id',
    `create_by`     varchar(64)  NOT NULL DEFAULT '' COMMENT '创建人',
    `create_time`   bigint       NOT NULL DEFAULT '-28800' COMMENT ' 创建时间',
    PRIMARY KEY (`popup_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='弹窗';


CREATE TABLE IF NOT EXISTS `t_operation_log`
(
    `operation_log_id` bigint      NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
    `operation_id`     bigint      NOT NULL DEFAULT '0' COMMENT '操作对象id',
    `operation_type`   tinyint     NOT NULL DEFAULT '0' COMMENT '操作类型：0新增 1修改 2归档 3删除 4废弃',
    `create_time`      bigint      NOT NULL DEFAULT '-28800' COMMENT '操作时间',
    `create_by`        varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
    `before_operation` json COMMENT '操作前记录信息json串',
    `after_operation`  json COMMENT '操作后记录信息json串',
    `business_type`    tinyint     NOT NULL DEFAULT '0' COMMENT '业务类型 0 弹窗，1 跑马灯',
    `module_type`      tinyint     NOT NULL DEFAULT '0' COMMENT '模块类型 0 公告 1 平台 ',
    `act`              tinyint     NOT NULL DEFAULT '0' COMMENT '动作 1 申请调整 2 申请调整-审批通过 3 申请调整-拒绝 4 申请解控 5 申请解控-审批通过 6 申请解控-拒绝',
    `apply_order_no`   varchar(20) NOT NULL DEFAULT '0' COMMENT '申请单号 ',
    PRIMARY KEY (`operation_log_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='操作日志表';


CREATE TABLE IF NOT EXISTS `t_notice_game`
(
    `id`        bigint      NOT NULL AUTO_INCREMENT COMMENT '公告游戏id',
    `game_id`   bigint      NOT NULL DEFAULT '0' COMMENT '游戏id',
    `notice_id` bigint      NOT NULL DEFAULT '0' COMMENT '公告id',
    `t_type`    tinyint     NOT NULL DEFAULT '0' COMMENT '类型 0 弹窗 1 跑马灯',
    `game_name` varchar(32) NOT NULL DEFAULT '' COMMENT '游戏名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='公告游戏表';


CREATE TABLE IF NOT EXISTS `t_notice_league`
(
    `id`          bigint      NOT NULL AUTO_INCREMENT COMMENT '公告联盟id',
    `league_id`   bigint      NOT NULL DEFAULT '0' COMMENT '联盟id',
    `marquee_id`  bigint      NOT NULL DEFAULT '0' COMMENT '跑马灯id',
    `league_name` varchar(32) NOT NULL DEFAULT '' COMMENT '联盟名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='公告联盟表';


CREATE TABLE IF NOT EXISTS `t_notice_platform`
(
    `id`            bigint      NOT NULL AUTO_INCREMENT COMMENT '公告平台id',
    `platform_id`   bigint      NOT NULL DEFAULT '0' COMMENT '平台id',
    `marquee_id`    bigint      NOT NULL DEFAULT '0' COMMENT '跑马灯id',
    `platform_name` varchar(32) NOT NULL DEFAULT '' COMMENT '平台名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='公告平台表';



CREATE TABLE IF NOT EXISTS `t_rs_config`
(
    `id`                             bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `risk_name`                      varchar(32)     NOT NULL DEFAULT '' COMMENT '名称',
    `plat_net_profit_margin`         float(18, 2)    NOT NULL DEFAULT 0.00 COMMENT '1',
    `plat_profit_control_param1`     float(10, 2)    NOT NULL DEFAULT 0.00 COMMENT '平台盈利控制参数1',
    `plat_profit_control_param2`     bigint          NOT NULL DEFAULT 0 COMMENT '3',
    `plat_low_limit_profit`          bigint          NOT NULL DEFAULT 0 COMMENT '4',
    `plat_day_start_money`           bigint          NOT NULL DEFAULT 0 COMMENT '5',
    `plat_day_start_battle_number`   bigint          NOT NULL DEFAULT 0 COMMENT '6',
    `player_exp_profit_margin`       float(20, 2)    NOT NULL DEFAULT 0.00 COMMENT '玩家期望盈利率',
    `player_profit_control_param1`   float(15, 2)    NOT NULL DEFAULT 0.00 COMMENT '玩家盈利控制参数1',
    `player_profit_control_param2`   bigint          NOT NULL DEFAULT 0 COMMENT '9',
    `player_day_start_money`         bigint          NOT NULL DEFAULT 0 COMMENT '11',
    `player_day_start_battle_number` bigint          NOT NULL DEFAULT 0 COMMENT '12',
    `player_lose_excep_val`          float(20, 2)    NOT NULL DEFAULT 0.00 COMMENT '14',
    `player_exper_control_param1`    float(20, 2)    NOT NULL DEFAULT 0.00 COMMENT '15',
    `player_exper_control_param2`    bigint          NOT NULL DEFAULT 0 COMMENT '16',
    `plat_profitLoss_weights`        int             NOT NULL DEFAULT 0 COMMENT '17',
    `game_profitLoss_weights`        int             NOT NULL DEFAULT 0 COMMENT '18',
    `player_profitLoss_weights`      int             NOT NULL DEFAULT '0' COMMENT '19',
    `player_exper_weights`           int             NOT NULL DEFAULT '0' COMMENT '20',
    `rs_status`                      tinyint         NOT NULL DEFAULT '0' COMMENT '21',
    `default_flag`                   tinyint         NOT NULL DEFAULT '0' COMMENT '创建人',
    `create_by`                      varchar(32)     NOT NULL DEFAULT '' COMMENT '创建人',
    `create_time`                    bigint          NOT NULL DEFAULT '0' COMMENT '创建时间',
    `update_by`                      varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`                    bigint          NOT NULL DEFAULT '0' COMMENT '修改时间',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT '风控表';


CREATE TABLE IF NOT EXISTS `t_rs_factor_config`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `factor_name`  varchar(64)     NOT NULL DEFAULT '' COMMENT '系数名称',
    `factor_value` float(20, 2)    NOT NULL DEFAULT 0.00 COMMENT '系数值',
    `delete_flag`  tinyint         NOT NULL DEFAULT 0 COMMENT '删除标志',
    `create_by`    varchar(32)     NOT NULL DEFAULT '' COMMENT '创建人',
    `create_time`  bigint          NOT NULL DEFAULT 0 COMMENT '创建时间',
    `update_by`    varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`  bigint          NOT NULL DEFAULT 0 COMMENT '更新时间',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT '点控配置表';


CREATE TABLE IF NOT EXISTS `t_rs_game_config`
(
    `id`                   bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `game_id`              bigint          NOT NULL DEFAULT '0' COMMENT '游戏ID',
    `game_name`            varchar(32)     NOT NULL DEFAULT '' COMMENT '游戏名称',
    `risk_id`              bigint          NOT NULL DEFAULT '0' COMMENT '关联风控配置ID',
    `expected_profit_rate` float(20, 2)    NOT NULL DEFAULT '0.00' COMMENT '游戏期望盈利率',
    `risk_start_amount`    bigint          NOT NULL DEFAULT '0' COMMENT '游戏日风控起始金额',
    `risk_start_innings`   bigint          NOT NULL DEFAULT '0' COMMENT '游戏日风控起始局数',
    `risk_profit_param1`   float(20, 2)    NOT NULL DEFAULT '0.00' COMMENT '游戏盈利风控参数1',
    `risk_profit_param2`   bigint          NOT NULL DEFAULT '0' COMMENT '游戏盈利风控参数2',
    `create_by`            varchar(32)     NOT NULL DEFAULT '' COMMENT '创建人',
    `create_time`          bigint          NOT NULL DEFAULT '0' COMMENT '创建时间',
    `update_by`            varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`          bigint          NOT NULL DEFAULT '0' COMMENT '修改时间',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT ='游戏风控配置表';


CREATE TABLE IF NOT EXISTS `t_rs_game_exclusive_config`
(
    `id`              bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `game_config_id`  bigint          NOT NULL DEFAULT '0' COMMENT '游戏风控ID',
    `exclusive_name`  varchar(32)     NOT NULL DEFAULT '' COMMENT '专属名称',
    `exclusive_value` float(20, 2)    NOT NULL DEFAULT '0.00' COMMENT '专属值',
    `create_by`       varchar(32)     NOT NULL DEFAULT '' COMMENT '创建人',
    `create_time`     bigint          NOT NULL DEFAULT '0' COMMENT '创建时间',
    `update_by`       varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`     bigint          NOT NULL DEFAULT '0' COMMENT '修改时间',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT ='风控专属配置表';



CREATE TABLE IF NOT EXISTS `t_rs_plus_minus_config`
(
    `id`                   bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `game_config_id`       bigint          NOT NULL DEFAULT '0' COMMENT '游戏风控ID',
    `distribution_avg`     float(20, 2)    NOT NULL DEFAULT '0.00' COMMENT '分布平均值',
    `distribution_range`   float(20, 2)    NOT NULL DEFAULT '0.00' COMMENT '分布均差值',
    `plastic_param1`       float(20, 2)    NOT NULL DEFAULT '0.00' COMMENT '整形参数1',
    `plastic_param2`       float(20, 2)    NOT NULL DEFAULT '0.00' COMMENT '整形参数2',
    `characteristic_param` float(20, 2)    NOT NULL DEFAULT '0.00' COMMENT '特征扩张参数',
    `tensile_strength`     float(20, 2)    NOT NULL DEFAULT '0.00' COMMENT '强度拉伸参数',
    `tensile_translation`  float(20, 2)    NOT NULL DEFAULT '0.00' COMMENT '强度平移参数',
    `create_by`            varchar(32)     NOT NULL DEFAULT '' COMMENT '创建人',
    `create_time`          bigint          NOT NULL DEFAULT '0' COMMENT '创建时间',
    `update_by`            varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`          bigint          NOT NULL DEFAULT '0' COMMENT '更新时间',
    `config_type`          int             NOT NULL DEFAULT '0' COMMENT '类型',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT ='风控正负配置表';


CREATE TABLE IF NOT EXISTS `t_rs_weight`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `game_config_id` bigint          NOT NULL DEFAULT '0' COMMENT '游戏风控ID',
    `weight_type`    int             NOT NULL DEFAULT 0 COMMENT '类型',
    `weight`         bigint          NOT NULL DEFAULT '0' COMMENT '权重',
    `people_number`  int             NOT NULL DEFAULT 0 COMMENT '人数',
    `create_by`      varchar(32)     NOT NULL DEFAULT '' COMMENT '创建人',
    `create_time`    bigint          NOT NULL DEFAULT '0' COMMENT '创建时间',
    `update_by`      varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`    bigint          NOT NULL DEFAULT '0' COMMENT '更新时间',
    `rank_index`     int             NOT NULL DEFAULT 0 COMMENT '排名',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT ='风控权重配置表';

CREATE TABLE IF NOT EXISTS `t_behalf_game_config`
(
    `game_id`     bigint      NOT NULL AUTO_INCREMENT COMMENT '游戏id',
    `game_name`   varchar(50) NOT NULL DEFAULT '' COMMENT '游戏名称',
    `game_status` tinyint     NOT NULL DEFAULT 1 COMMENT '状态 0启用，1停用',
    PRIMARY KEY (`game_id`) USING BTREE
) ENGINE = InnoDB comment '代单游戏设置表';

CREATE TABLE IF NOT EXISTS `t_league`
(
    `id`            bigint       NOT NULL AUTO_INCREMENT COMMENT '本表主键id',
    `league_name`   varchar(50)  NOT NULL DEFAULT '' COMMENT '联盟名称',
    `league_alia`   varchar(50)  NOT NULL DEFAULT '' COMMENT '联盟简称',
    `create_time`   bigint       NOT NULL DEFAULT 0 COMMENT '联盟注册时间',
    `update_time`   bigint       NOT NULL DEFAULT 0 COMMENT '联盟更新时间',
    `league_status` tinyint      NOT NULL DEFAULT 0 COMMENT '联盟状态0启用，1停用',
    `league_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '联盟原因',
    `show_id`       varchar(50)  NOT NULL DEFAULT '' COMMENT '前端展示id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT '总控设置模块的联盟表';


CREATE TABLE IF NOT EXISTS `t_merchant`
(
    `merchant_id`      bigint       NOT NULL AUTO_INCREMENT COMMENT '本表主键id',
    `merchant_name`    varchar(200) NOT NULL DEFAULT '' COMMENT '商户名称',
    `merchant_alia`    varchar(50)  NOT NULL DEFAULT '' COMMENT '平台简称',
    `create_time`      bigint       NOT NULL DEFAULT 0 COMMENT '商户创建时间',
    `update_time`      bigint       NOT NULL DEFAULT 0 COMMENT '商户修改时间',
    `create_by`        varchar(50)  NOT NULL DEFAULT '' COMMENT '创建人',
    `last_operation`   varchar(50)  NOT NULL DEFAULT '' COMMENT '最后操作人',
    `league_id`        bigint       NOT NULL DEFAULT 0 COMMENT '联盟id',
    `merchant_avatar`  varchar(200) NOT NULL DEFAULT '' COMMENT '商户头像',
    `verify_type`      tinyint      NOT NULL DEFAULT 1 COMMENT '验证方式(0:google验证 1:普通验证)',
    `google_key`       varchar(64)  NOT NULL DEFAULT '' COMMENT '谷歌秘钥',
    `m_status`         tinyint      NOT NULL DEFAULT 0 COMMENT '平台状态 0启用,1停用',
    `risk_id`          bigint       NOT NULL DEFAULT 0 COMMENT '风控id',
    `connector`        varchar(50)  NOT NULL DEFAULT '' COMMENT '对接人',
    `email`            varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
    `phone`            varchar(50)  NOT NULL DEFAULT '' COMMENT '电话',
    `telegram`         varchar(100) NOT NULL DEFAULT '' COMMENT 'telegram',
    `skype`            varchar(100) NOT NULL DEFAULT '' COMMENT 'skype',
    `transfer_type`    tinyint      NOT NULL DEFAULT 1 COMMENT '转换方式',
    `agent`            varchar(50)  NOT NULL DEFAULT '' COMMENT '平台简称+平台id组成的字符串',
    `merchant_parent_id` bigint  NOT NULL DEFAULT '0' COMMENT '商户父级id',
    `bind_time` bigint  NOT NULL DEFAULT '0' COMMENT '子商户绑定时间',
    `platform_style` tinyint(4) NOT NULL DEFAULT '0' COMMENT '平台类型，0普通平台，1父平台',
    PRIMARY KEY (merchant_id) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10000 COMMENT = '总控设置模块的商户表';


CREATE TABLE IF NOT EXISTS `t_merchant_settle`
(
    `settle_id`       bigint       NOT NULL AUTO_INCREMENT COMMENT '本表主键id',
    `merchant_id`     bigint       NOT NULL DEFAULT 0 COMMENT '平台id',
    `settle_cycle`    varchar(255) NOT NULL DEFAULT '' COMMENT '结算周期',
    `settle_cycle_id` bigint       NOT NULL DEFAULT 0 COMMENT '结算周期id',
    `settlement`      varchar(255) NOT NULL DEFAULT '' COMMENT '结算方案',
    `effect_time`     varchar(255) NOT NULL DEFAULT '' COMMENT '有效周期',
    `create_time`     bigint       NOT NULL DEFAULT 0 COMMENT '创建时间',
    `settle_type`     varchar(50)  NOT NULL DEFAULT '' COMMENT '结算方式',
    `compact_no`      varchar(50)  NOT NULL DEFAULT '' COMMENT '协议编号',
    PRIMARY KEY (`settle_id`) USING BTREE
) ENGINE = InnoDB COMMENT = '总控设置模块的结算方案表';


CREATE TABLE IF NOT EXISTS `t_merchant_settle_cycle`
(
    `settle_cycle_id`          int          NOT NULL COMMENT '本表主键id,固定只有1，2，3，4',
    `settle_cycle_name`        varchar(255) NOT NULL DEFAULT '' COMMENT '结算周期',
    `settle_cycle_description` varchar(255) NOT NULL DEFAULT '' COMMENT '结算周期描述',
    PRIMARY KEY (`settle_cycle_id`) USING BTREE
) ENGINE = InnoDB COMMENT = '总控设置模块的结算周期表';


CREATE TABLE IF NOT EXISTS `t_merchant_settle_scale`
(
    `settle_scale_id` bigint     NOT NULL AUTO_INCREMENT COMMENT '本表主键id',
    `settle_id`       bigint     NOT NULL DEFAULT 0 COMMENT '结算id',
    `lv`              varchar(2) NOT NULL DEFAULT '' COMMENT '结算比列层级',
    `settle_amount`   bigint     NOT NULL DEFAULT 0 COMMENT '结算比列金额',
    `settle_rate`     int        NOT NULL DEFAULT 0 COMMENT '结算比例比率',
    PRIMARY KEY (`settle_scale_id`) USING BTREE
) ENGINE = InnoDB COMMENT = '总控设置模块的结算比例表';

CREATE TABLE IF NOT EXISTS `t_rs_cards_config`
(
    `id`             bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `game_config_id` bigint       NOT NULL default '0' COMMENT '游戏风控ID',
    `config_type`    int          NOT NULL default '0' COMMENT '类型',
    `poker_count`    int                   DEFAULT '0' COMMENT '张数',
    `weight`         float(20, 2) NOT NULL DEFAULT '0.00' COMMENT '权重',
    `sim_points`     int                   DEFAULT '0' COMMENT '点数',
    `create_by`      varchar(32)  NOT NULL default '' COMMENT '创建人',
    `create_time`    bigint       NOT NULL default '0' COMMENT '创建时间',
    `update_by`      varchar(32)  NOT NULL default '' COMMENT '更新人',
    `update_time`    bigint       NOT NULL default '0' COMMENT '更新时间',
    `rate`           float(20, 2) NOT NULL DEFAULT '0.00' COMMENT '倍率',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT '牌类风控配置表';

CREATE TABLE IF NOT EXISTS `user_config`
(
    `member_id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '用于产生唯一的自增id',
    `merchant_id`        bigint          NOT NULL DEFAULT 0 COMMENT '平台id',
    `merchant_member_id` varchar(60)     NOT NULL DEFAULT '' COMMENT '商户会员id',
    PRIMARY KEY (`member_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 20000 COMMENT '该表用于产生全局唯一用户id';


CREATE TABLE IF NOT EXISTS `t_financial_bill`
(
    `id`                     bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `bill_no`                varchar(32)     NOT NULL DEFAULT '' COMMENT '账单编号',
    `merchant_id`            bigint          NOT NULL DEFAULT '0' COMMENT '商户ID',
    `merchant_name`          varchar(50)     NOT NULL DEFAULT '' COMMENT '商户名称',
    `compute_amount`         bigint          NOT NULL DEFAULT '0' COMMENT '应收金额',
    `settlement_amount`      bigint          NOT NULL DEFAULT '0' COMMENT '实际结算金额',
    `settled_amount`         bigint          NOT NULL DEFAULT '0' COMMENT '已结算金额',
    `outstanding_amount`     bigint          NOT NULL DEFAULT '0' COMMENT '待结算金额',
    `settlement_scheme_id`   bigint          NOT NULL DEFAULT '0' COMMENT '关联结算方案ID',
    `settlement_scheme_name` varchar(50)     NOT NULL DEFAULT '' COMMENT '结算方案名称',
    `settlement_method`      varchar(50)     NOT NULL DEFAULT '' COMMENT '结算方式',
    `batch_no`               varchar(30)     NOT NULL DEFAULT '' COMMENT '批次号',
    `bill_time`              varchar(50)     NOT NULL DEFAULT '' COMMENT '账单时间',
    `start_time`             bigint          NOT NULL DEFAULT '0' COMMENT '开始时间',
    `end_time`               bigint          NOT NULL DEFAULT '0' COMMENT '结束时间',
    `settlement_status`      tinyint         NOT NULL DEFAULT '0' COMMENT '结算状态',
    `remark`                 varchar(255)    NOT NULL DEFAULT '' COMMENT '备注',
    `approval_by`            varchar(32)     NOT NULL DEFAULT '' COMMENT '审批人',
    `approval_time`          bigint          NOT NULL DEFAULT '0' COMMENT '审批时间',
    `create_by`              varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `create_time`            bigint          NOT NULL DEFAULT '0' COMMENT '创建时间',
    `update_by`              varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`            bigint          NOT NULL DEFAULT '0' COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1 comment ='财务账单表';


CREATE TABLE IF NOT EXISTS `t_financial_bill_detail`
(
    `id`                bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `bill_id`           bigint          NOT NULL DEFAULT '0' COMMENT '账单id',
    `rel_bill_no`       varchar(32)     NOT NULL DEFAULT '' COMMENT '关联账单编号',
    `merchant_name`     varchar(50)     NOT NULL DEFAULT '' COMMENT '商户名称',
    `merchant_id`       bigint          NOT NULL DEFAULT '0' COMMENT '商户ID',
    `total_profit_loss` bigint          NOT NULL DEFAULT '0' COMMENT '总盈亏',
    `check_profit_loss` bigint          NOT NULL DEFAULT '0' COMMENT '查询ES核对盈亏',
    `check_status`      tinyint         NOT NULL DEFAULT '0' COMMENT '核对状态，0.异常，1.正常',
    `total_bet_count`   bigint          NOT NULL DEFAULT '0' COMMENT '总注单数',
    `approval_status`   tinyint         NOT NULL DEFAULT '0' COMMENT '审批状态',
    `bet_time`          bigint          NOT NULL DEFAULT '0' COMMENT '投注日期',
    `remark`            varchar(255)    NOT NULL DEFAULT '' COMMENT '备注',
    `approval_by`       varchar(32)     NOT NULL DEFAULT '' COMMENT '审批人',
    `approval_time`     bigint          NOT NULL DEFAULT '0' COMMENT '审批时间',
    `create_by`         varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `create_time`       bigint          NOT NULL DEFAULT '0' COMMENT '创建时间',
    `update_by`         varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`       bigint          NOT NULL DEFAULT '0' COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1 comment ='财务每日盈亏表';


CREATE TABLE IF NOT EXISTS `t_financial_settled`
(
    `id`                bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `bill_id`           bigint          NOT NULL DEFAULT '0' COMMENT '账单id',
    `rel_bill_no`       varchar(32)     NOT NULL DEFAULT '' COMMENT '关联账单编号',
    `settlement_amount` bigint          NOT NULL DEFAULT 0 COMMENT '结算金额',
    `create_by`         varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `create_time`       bigint          NOT NULL DEFAULT 0 COMMENT '创建时间',
    `update_by`         varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`       bigint          NOT NULL DEFAULT 0 COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1 comment ='财务结算表';


CREATE TABLE IF NOT EXISTS `t_financial_settlement`
(
    `id`                bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `bill_id`           bigint          NOT NULL DEFAULT '0' COMMENT '账单id',
    `rel_bill_no`       varchar(32)     NOT NULL DEFAULT '' COMMENT '关联账单编号',
    `profit_loss`       bigint          NOT NULL DEFAULT 0 COMMENT '盈利',
    `settlement_rate`   decimal(20,2)    NOT NULL DEFAULT 0.00 COMMENT '结算比例',
    `compute_amount`    bigint          NOT NULL DEFAULT 0 COMMENT '应收金额',
    `settlement_amount` bigint          NOT NULL DEFAULT 0 COMMENT '实际应收金额',
    `create_by`         varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `create_time`       bigint          NOT NULL DEFAULT 0 COMMENT '创建时间',
    `update_by`         varchar(32)     NOT NULL DEFAULT '' COMMENT '更新人',
    `update_time`       bigint          NOT NULL DEFAULT 0 COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1 comment ='财务账单计算表';

CREATE TABLE IF NOT EXISTS `t_game_label`
(
    `label_id`    bigint unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '游戏标签id',
    `label_name`  varchar(25)              NOT NULL DEFAULT 'no' COMMENT '标签名称',
    `delete_flag` tinyint                  NOT NULL DEFAULT '0' COMMENT '游戏删除状态，0：未删除，1：已删除',
    `delete_by`   varchar(50)              NOT NULL DEFAULT 'no' COMMENT '删除人',
    `delete_time` bigint                   NOT NULL DEFAULT 0 COMMENT '删除时间',
    `create_time` bigint                   NOT NULL DEFAULT 0 COMMENT '当前游戏设置创建时间',
    `create_by`   varchar(50)              NOT NULL DEFAULT 'admin' COMMENT '创建人',
    `update_time` bigint                   NOT NULL DEFAULT 0 COMMENT '最近修改时间',
    `update_by`   varchar(50)              NOT NULL DEFAULT 'no' COMMENT '修改人',
    PRIMARY KEY (`label_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='游戏标签'
  ROW_FORMAT = Dynamic;

INSERT INTO `t_game_label`
VALUES (00001, '无', 0, 'no', 1577936565, 1577936565, 'admin', 1577936565, 'no');
INSERT INTO `t_game_label`
VALUES (00002, '最新', 0, 'no', 1577936576, 1577936576, 'admin', 1577936576, 'no');
INSERT INTO `t_game_label`
VALUES (00003, '人气', 0, 'no', 1578567607, 1578567607, 'admin', 1578567607, 'no');
INSERT INTO `t_game_label`
VALUES (00004, '活动', 0, 'no', 1578658631, 1578658631, 'admin', 1578658631, 'no');
INSERT INTO `t_game_label`
VALUES (00005, '最近', 0, 'no', 1578658631, 1578658631, 'admin', 1578658631, 'no');

CREATE TABLE IF NOT EXISTS `t_game_setting`
(
    `setting_id`     bigint unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `game_id`        bigint                   NOT NULL DEFAULT 1 COMMENT '游戏id',
    `game_name`      varchar(255)             NOT NULL DEFAULT "name" COMMENT '游戏名称',
    `game_status`    tinyint                  NOT NULL DEFAULT 1 COMMENT '游戏运行状态：1：预计上线，2：启用，3：停用，4：待启用',
    `merchant_id`    bigint                   NOT NULL DEFAULT 0 COMMENT '平台id',
    `failure_reason` varchar(500)             NOT NULL DEFAULT 'no' COMMENT '失败原因',
    `delete_flag`    tinyint                  NOT NULL DEFAULT 0 COMMENT '游戏删除状态，0：未删除，1：已删除',
    `delete_by`      varchar(50)              NOT NULL DEFAULT 'no' COMMENT '删除人',
    `delete_time`    bigint                   NOT NULL DEFAULT 0 COMMENT '删除时间',
    `create_time`    bigint                   NOT NULL DEFAULT 0 COMMENT '当前游戏设置创建时间',
    `create_by`      varchar(50)              NOT NULL DEFAULT 'admin' COMMENT '创建人',
    `update_time`    bigint                   NOT NULL DEFAULT 0 COMMENT '最近修改时间',
    `update_by`      varchar(50)              NOT NULL DEFAULT 'no' COMMENT '修改人',
    `remark`         varchar(500)             NOT NULL DEFAULT 'no' COMMENT '备注（游戏停用启用时需要备注）',
    PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='游戏设置'
  ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `t_game_settings_type_order`
(
    `settings_type_order_id` bigint unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '游戏和分类关联表（一个游戏可以有多个分类，一个分类下可以有多个游戏）',
    `setting_id`             bigint unsigned zerofill NOT NULL DEFAULT 1 COMMENT '游戏设置id',
    `game_id`                bigint                   NOT NULL DEFAULT 1 COMMENT '游戏ID',
    `label_id`               bigint                   NOT NULL DEFAULT 1 COMMENT '标签',
    `type_id`                bigint                   NOT NULL DEFAULT 1 COMMENT '类型ID',
    `merchant_id`            bigint                   NOT NULL DEFAULT 0 COMMENT '平台id',
    `game_order`             int                      NOT NULL DEFAULT 1 COMMENT '游戏根据标签，类型的排序',
    `version`                int                      NOT NULL DEFAULT 1 COMMENT '版本号：通过版本号确认平台是否修改过游戏设置',
    PRIMARY KEY (`settings_type_order_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='游戏，分类，标签关联表'
  ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `t_game_type`
(
    `type_id`     bigint unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '游戏分类id',
    `type_name`   varchar(100)             NOT NULL DEFAULT 'no' COMMENT '游戏分类名称',
    `game_order`  int                      NOT NULL DEFAULT 0 COMMENT '分类在大厅的排列顺序',
    `delete_flag` tinyint                  NOT NULL DEFAULT 0 COMMENT '游戏删除状态，0：未删除，1：已删除',
    `delete_by`   varchar(50)              NOT NULL DEFAULT 'no' COMMENT '删除人',
    `delete_time` bigint                   NOT NULL DEFAULT 0 COMMENT '删除时间',
    `create_time` bigint                   NOT NULL DEFAULT 0 COMMENT '当前游戏设置创建时间',
    `create_by`   varchar(50)              NOT NULL DEFAULT 'admin' COMMENT '创建人',
    `update_time` bigint                   NOT NULL DEFAULT 0 COMMENT '最近修改时间',
    `update_by`   varchar(50)              NOT NULL DEFAULT 'no' COMMENT '修改人',
    PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='游戏分类'
  ROW_FORMAT = Dynamic;

INSERT INTO `t_game_type`(`type_name`, `game_order`, `delete_flag`, `delete_by`, `delete_time`, `create_time`,
                          `create_by`, `update_time`, `update_by`)
VALUES ('全部游戏', 1, 0, '', 1576303059, 1576303059, 'admin', 1576303059, '');
INSERT INTO `t_game_type`(`type_name`, `game_order`, `delete_flag`, `delete_by`, `delete_time`, `create_time`,
                          `create_by`, `update_time`, `update_by`)
VALUES ('街机电游', 2, 0, '', 1576303059, 1576303059, 'admin', 1576303059, '');
INSERT INTO `t_game_type`(`type_name`, `game_order`, `delete_flag`, `delete_by`, `delete_time`, `create_time`,
                          `create_by`, `update_time`, `update_by`)
VALUES ('经典扑克', 3, 0, '', 1576303059, 1576303059, 'admin', 1576303059, '');
INSERT INTO `t_game_type`(`type_name`, `game_order`, `delete_flag`, `delete_by`, `delete_time`, `create_time`,
                          `create_by`, `update_time`, `update_by`)
VALUES ('麻将达人', 4, 0, '', 1576303059, 1576303059, 'admin', 1576303059, '');
INSERT INTO `t_game_type`(`type_name`, `game_order`, `delete_flag`, `delete_by`, `delete_time`, `create_time`,
                          `create_by`, `update_time`, `update_by`)
VALUES ('百人大战', 5, 0, '', 1576303059, 1576303059, 'admin', 1576303059, '');
INSERT INTO `t_game_type`(`type_name`, `game_order`, `delete_flag`, `delete_by`, `delete_time`, `create_time`,
                          `create_by`, `update_time`, `update_by`)
VALUES ('真实赌场', 6, 0, '', 1576303059, 1576303059, 'admin', 1576303059, '');
INSERT INTO `t_game_type`(`type_name`, `game_order`, `delete_flag`, `delete_by`, `delete_time`, `create_time`,
                          `create_by`, `update_time`, `update_by`)
VALUES ('精品游戏', 7, 0, '', 1576303059, 1576303059, 'admin', 1576303059, '');
INSERT INTO `t_game_type`(`type_name`, `game_order`, `delete_flag`, `delete_by`, `delete_time`, `create_time`,
                          `create_by`, `update_time`, `update_by`)
VALUES ('万人大战', 8, 0, '', 1576303059, 1576303059, 'admin', 1576303059, '');

CREATE TABLE IF NOT EXISTS `t_platform_game_room`
(
    `game_room_id`     bigint unsigned zerofill  NOT NULL AUTO_INCREMENT COMMENT '房间ID',
    `game_id`          bigint                             DEFAULT 1 NOT NULL COMMENT '游戏id',
    `merchant_id`      bigint                             DEFAULT 0 NOT NULL COMMENT '商户平台id',
    `room_start_grade` varchar(2000)             NOT NULL DEFAULT 'no' COMMENT '房间启用等级： 1初级场，2中级场，3高级场，4至尊场',
    `room_all_grade`   varchar(2000)             NOT NULL DEFAULT 'no' COMMENT '保存从游戏服务获取到的该游戏所有房间信息，格式：1，初级场；2，中级场...',
    `game_status`      tinyint unsigned zerofill NOT NULL DEFAULT '1' COMMENT '游戏运行状态：0：停用,         1：启用',
    `failure_reason`   varchar(500)              NOT NULL DEFAULT 'no' COMMENT '失败原因',
    `delete_flag`      tinyint                   NOT NULL DEFAULT 0 COMMENT '游戏删除状态，0：未删除，1：已删除',
    `delete_by`        varchar(50)               NOT NULL DEFAULT 'no' COMMENT '删除人',
    `delete_time`      bigint                    NOT NULL DEFAULT 0 COMMENT '删除时间',
    `create_time`      bigint                    NOT NULL DEFAULT 0 COMMENT '当前游戏设置创建时间',
    `create_by`        varchar(50)               NOT NULL DEFAULT 'admin' COMMENT '创建人',
    `update_time`      bigint                    NOT NULL DEFAULT 0 COMMENT '最近修改时间',
    `update_by`        varchar(50)               NOT NULL DEFAULT 'no' COMMENT '修改人',
    PRIMARY KEY (`game_room_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='商户平台游戏房间等级设置'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_list
(
    id         int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    game_id    tinyint      NOT NULL DEFAULT '0' COMMENT '游戏id',
    game_name  varchar(64)  NOT NULL DEFAULT '' COMMENT '游戏名称',
    state      tinyint      NOT NULL DEFAULT '0' COMMENT '游戏状态',
    have_rooms tinyint      NOT NULL DEFAULT '1' COMMENT '是否存在房间',
    rooms      json COMMENT '配置数据',
    PRIMARY KEY (id)
) ENGINE = InnoDB
  AUTO_INCREMENT = 31 COMMENT ='游戏列表';

CREATE TABLE IF NOT EXISTS t_system_param
(
    id          int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    param_name  VARCHAR(64)  NOT NULL DEFAULT '' COMMENT '参数名',
    param_value VARCHAR(255) NOT NULL DEFAULT '' COMMENT '参数值',
    PRIMARY KEY (id)
) ENGINE = InnoDB COMMENT ='系统参数';


CREATE TABLE IF NOT EXISTS t_gamestate
(
    id          int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    member_id   bigint           NOT NULL DEFAULT '0' COMMENT '会员id',
    server_id   varchar(32)      NOT NULL DEFAULT '' COMMENT '用户游戏服serverId',
    terminal    tinyint unsigned NOT NULL DEFAULT '0' COMMENT '终端id 1：PC ,2:安卓 3：IOS ,4:H5',
    login_time  bigint           NOT NULL DEFAULT '0' COMMENT '登录时间',
    merchant_id bigint           NOT NULL DEFAULT '0' COMMENT '商户id',
    login_ip    varchar(32)      NOT NULL DEFAULT '' COMMENT '登录ip',
    mac         varchar(50)      NOT NULL DEFAULT '' COMMENT 'mac地址',
    game_id     tinyint          NOT NULL DEFAULT '0' COMMENT '游戏id',
    game_type   tinyint          NOT NULL DEFAULT '0' COMMENT '房间id',
    desk_id     int              NOT NULL DEFAULT '0' COMMENT '桌子id',
    member_type tinyint          NOT NULL DEFAULT '0' COMMENT '会员类型：0 真实玩家 ，1 测试玩家账号，2带单账号',
    PRIMARY KEY (id) USING BTREE,
    UNIQUE KEY member_id (member_id) USING BTREE,
    KEY server_id (server_id) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  ROW_FORMAT = DYNAMIC COMMENT ='玩家状态表';


CREATE TABLE IF NOT EXISTS game_config_101
(
    id          int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype    int          NOT NULL DEFAULT '0' COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(32)  NOT NULL DEFAULT '' COMMENT '房间名称|0||场次名称',
    baseScore   int          NOT NULL DEFAULT '0' COMMENT '房间底分|1||底分',
    coinLimit   int          NOT NULL DEFAULT '0' COMMENT '准入分数|1||准入',
    addBet      varchar(255) NOT NULL DEFAULT '' COMMENT '加注阶梯|1|[int,int,int,...]|加注[]',
    maxRound    int          NOT NULL DEFAULT '0' COMMENT '最大轮数|1||最大轮数',
    tipCoin     int          NOT NULL DEFAULT '0' COMMENT '喜钱|1||喜钱',
    revenuePerc int          NOT NULL DEFAULT '0' COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc     int          NOT NULL DEFAULT '0' COMMENT '获胜概率|1||获胜百分比',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  ROW_FORMAT = DYNAMIC COMMENT ='炸金花配置';


CREATE TABLE IF NOT EXISTS game_config_102
(
    id          int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype    int          NOT NULL DEFAULT '0' COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(32)  NOT NULL DEFAULT '' COMMENT '房间名称|0||场次名称',
    baseScore   int          NOT NULL DEFAULT '0' COMMENT '房间底分|1||底分',
    coinLimit   int          NOT NULL DEFAULT '0' COMMENT '准入分数|1||准入',
    maxBet      int          NOT NULL DEFAULT '0' COMMENT '最大下注|1||最大下注',
    revenuePerc int          NOT NULL DEFAULT '0' COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc     int          NOT NULL DEFAULT '0' COMMENT '获胜概率|1||获胜百分比',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  ROW_FORMAT = DYNAMIC COMMENT ='21点配置';


CREATE TABLE IF NOT EXISTS game_config_103
(
    id          int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype    int          NOT NULL DEFAULT '0' COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(32)  NOT NULL DEFAULT '' COMMENT '房间名称|0||场次名称',
    baseScore   int          NOT NULL DEFAULT '0' COMMENT '房间底分|1||底分',
    coinLimit   int          NOT NULL DEFAULT '0' COMMENT '准入分数|1||准入',
    maxMult     int          NOT NULL DEFAULT '0' COMMENT '抢庄最大倍数|1||抢庄最大倍数',
    revenuePerc int          NOT NULL DEFAULT '0' COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc     int          NOT NULL DEFAULT '0' COMMENT '获胜概率|1||获胜百分比',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  ROW_FORMAT = DYNAMIC COMMENT ='推筒子配置';


CREATE TABLE IF NOT EXISTS game_config_104
(
    id          int unsigned  NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype    int           NOT NULL DEFAULT '0' COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(32)   NOT NULL DEFAULT '' COMMENT '房间名称|0||场次名称',
    mult        double(11, 2) NOT NULL DEFAULT '0.00' COMMENT '倍率|1||房间倍率',
    bagNum      int           NOT NULL DEFAULT '0' COMMENT '红包个数|1||红包个数',
    bagMoneys   varchar(255)  NOT NULL DEFAULT '' COMMENT '最小红包金额|1||最小红包金额',
    maxPlayer   int           NOT NULL DEFAULT '0' COMMENT '最大玩家数|1||最大玩家数',
    revenuePerc int           NOT NULL DEFAULT '0' COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc     int           NOT NULL DEFAULT '0' COMMENT '获胜概率|1||获胜百分比',
    coinLimit   int           NOT NULL DEFAULT '0' COMMENT '准入分数|1||准入',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  ROW_FORMAT = DYNAMIC COMMENT ='渔童钓宝配置';


CREATE TABLE IF NOT EXISTS game_config_105
(
    id          int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype    int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    mult        int          NOT NULL DEFAULT 0 COMMENT '倍率|1||房间倍率',
    bagNum      int          NOT NULL DEFAULT 0 COMMENT '红包个数|1||红包个数',
    bagMoneys   varchar(255) NOT NULL DEFAULT '' COMMENT '最小红包金额|1||最小红包金额',
    maxPlayer   int          NOT NULL DEFAULT 0 COMMENT '最大玩家数|1||最大玩家数',
    revenuePerc int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc     int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    coinLimit   int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '抢红包配置'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_106
(
    id            int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype      int          NOT NULL DEFAULT 0 COMMENT '房间类型1: 体验房 2初级房 3中级房 4体验房',
    gamename      varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    nickName      varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT 'UI房间名称',
    minLimit      int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxLimit      int          NOT NULL DEFAULT 0 COMMENT '单局最大下注额|1||最大下注额',
    bet           varchar(100) NOT NULL DEFAULT '' COMMENT '下注额|1||下注区间 0:红,1:黑,2:会心一击',
    mult          varchar(100) NOT NULL DEFAULT '' COMMENT '倍率|1||倍率 0:黑,1:红,2:豹子,3:顺金,4:金花,5:顺子,6:对子(9-A)',
    revenuePerc   int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    coinLimit     int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    luckyMaxLimit int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    luckyMinLimit int          NOT NULL DEFAULT 0 COMMENT '单局最大下注额|1||最大下注额',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '红黑配置'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_107
(
    id          int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype    int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    coinLimit   int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxLimit    varchar(100) NOT NULL DEFAULT '' COMMENT '每个位置最大下注额',
    bet         varchar(100) NOT NULL DEFAULT '' COMMENT '可下注额|1|',
    mult        varchar(100) NOT NULL DEFAULT '' COMMENT '倍率|1||倍率 0:闲,1:上庄赢,2:上庄输, 3:庄,4:闲对,5,大,6:和,7:小,8:庄对',
    revenuePerc int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc     int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    minLimit    int          NOT NULL DEFAULT 0 COMMENT '最小投注额',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 17 COMMENT = '百家乐配置'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_108
(
    id          int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype    int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    coinLimit   int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxLimit    varchar(100) NOT NULL DEFAULT '' COMMENT '每个位置单局最大下注额|1||每个位置最大下注额',
    bet         varchar(100) NOT NULL DEFAULT '' COMMENT '可下注额|1|',
    mult        varchar(100) NOT NULL DEFAULT '' COMMENT '倍率|1||倍率 0:闲,1:上庄赢,2:上庄输, 3:庄,4:闲对,5,大,6:和,7:小,8:庄对',
    revenuePerc int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc     int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    minLimit    int          NOT NULL DEFAULT 0 COMMENT '最小投注额',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '单人百家乐配置'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_109
(
    id             int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype       int          NOT NULL DEFAULT 0 COMMENT '房间id',
    gamename       varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称',
    maxTable       int          NOT NULL DEFAULT 0 COMMENT '房间允许的最大桌子数',
    tableMinPlayer int          NOT NULL DEFAULT 0 COMMENT '开局允许的最少玩家数',
    tableMaxPlayer int          NOT NULL DEFAULT 0 COMMENT '开局允许的最大玩家数',
    coinLimit      int          NOT NULL DEFAULT 0 COMMENT '房间准入金币',
    revenue        int          NOT NULL DEFAULT 0 COMMENT '房间抽水',
    smallBlind     int          NOT NULL DEFAULT 0 COMMENT '小盲注',
    stageTime      varchar(64)  NOT NULL DEFAULT '' COMMENT '游戏阶段时间',
    minTableCoin   int          NOT NULL DEFAULT 0 COMMENT '最小带入金币',
    maxTableCoin   int          NOT NULL DEFAULT 0 COMMENT '最大带入金币',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '德州扑克'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_110
(
    id           int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype     int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename     varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    baseScore    int          NOT NULL DEFAULT 0 COMMENT '房间底分|1||底分',
    coinLimit    int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxQiangMult int          NOT NULL DEFAULT 0 COMMENT '抢庄倍数|1||抢庄倍数[0,1,2,3] 0:不抢',
    maxBetMult   int          NOT NULL DEFAULT 0 COMMENT '最大下注倍数|1||闲家最大下注倍数',
    revenuePerc  int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc      int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '抢庄牛牛配置'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_111
(
    id           int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype     int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename     varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    baseScore    int          NOT NULL DEFAULT 0 COMMENT '房间底分|1||底分',
    coinLimit    int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxQiangMult int          NOT NULL DEFAULT 0 COMMENT '抢庄倍数|1||抢庄倍数[0,1,2,3] 0:不抢',
    maxBetMult   int          NOT NULL DEFAULT 0 COMMENT '最大下注倍数|1||闲家最大下注倍数',
    revenuePerc  int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc      int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '看四张抢庄牛牛'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_112
(
    id           int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype     int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename     varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    baseScore    int          NOT NULL DEFAULT 0 COMMENT '房间底分|1||底分',
    coinLimit    int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxQiangMult int          NOT NULL DEFAULT 0 COMMENT '抢庄倍数|1||抢庄倍数[0,1,2,3] 0:不抢',
    maxBetMult   int          NOT NULL DEFAULT 0 COMMENT '最大下注倍数|1||闲家最大下注倍数',
    revenuePerc  int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc      int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '十三水配置'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_113
(
    id          int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype    int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    baseScore   int          NOT NULL DEFAULT 0 COMMENT '房间底分|1||底分',
    coinLimit   int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxMult     int          NOT NULL DEFAULT 0 COMMENT '下注最大倍数|1||下注最大倍数',
    revenuePerc int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc     int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比 （100必赢，0必输）',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '牌九配置'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_114
(
    id          int unsigned   NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gameType    int            NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(255)   NOT NULL DEFAULT '' COMMENT '房间名称|0||场次名称',
    minLimit    int            NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxLimit    int            NOT NULL DEFAULT 0 COMMENT '单局最大下注额|1||最大下注额',
    bet         varchar(100)   NOT NULL DEFAULT '' COMMENT '下注额|1||下注区间 0:龙,1:庄赢,2:庄输,3:虎,4:龙黑桃,5:龙红桃,6:龙梅花,7:龙方块,8:和,9:虎黑桃,10:胡红桃,11:虎梅花,12:虎方块',
    mult        varchar(100)   NOT NULL DEFAULT '' COMMENT '倍率|1||倍率 0:龙,1:庄赢,2:庄输,3:虎,4:龙黑桃,5:龙红桃,6:龙梅花,7:龙方块,8:和,9:虎黑桃,10:胡红桃,11:虎梅花,12:虎方块',
    revenuePerc decimal(12, 2) NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|1||赢家抽水比例',
    state       int            NOT NULL DEFAULT 0 COMMENT '房间状态|1||0:关闭,1:开启(赶人的时候用)',
    winPerc     int            NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    betMaxLimit varchar(100)   NOT NULL DEFAULT '' COMMENT '限红',
    baseScore   int            NOT NULL DEFAULT 0 COMMENT '底注',
    roomType    int            NOT NULL DEFAULT 0 COMMENT '房间类型',
    coinLimit   int            NOT NULL DEFAULT 0 COMMENT '金币限制',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 28 COMMENT = '龙虎配置'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_115
(
    id               int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype         int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename         varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    revenuePerc      int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc          int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    addBet           varchar(255) NOT NULL DEFAULT '' COMMENT '加注阶梯|1|[int,int,int,...]|加注[]',
    coinLimit        int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    addScoreMinCoin  int          NOT NULL DEFAULT 0 COMMENT '下注最小金额',
    addScoreMaxCoin  int          NOT NULL DEFAULT 0 COMMENT '下注最大金额',
    bankerScoreLimit int          NOT NULL DEFAULT 0 COMMENT '申请上庄的最小金额',
    bankerCountLimit int          NOT NULL DEFAULT 0 COMMENT '申请上庄列表最大数量',
    userNum          int          NOT NULL DEFAULT 0 COMMENT '最大用户数',
    addScoreTime     int          NOT NULL DEFAULT 0 COMMENT '下注等待的时间',
    bankerRoundNum   int          NOT NULL DEFAULT 0 COMMENT '上庄最大牌局数',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5 COMMENT = '万人牛牛配置'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_116
(
    id          int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype    int UNSIGNED NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    baseScore   int UNSIGNED NOT NULL DEFAULT 0 COMMENT '房间底分|1||底分',
    coinLimit   int UNSIGNED NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    revenuePerc int UNSIGNED NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc     int UNSIGNED NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '必出跑的快'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_117
(
    id          int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype    int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    revenuePerc int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc     int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    baseScore   int          NOT NULL DEFAULT 0 COMMENT '房间底分|1||底分',
    coinLimit   int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxMult     int          NOT NULL DEFAULT 0 DEFAULT 8 COMMENT '\'最大倍数|1||最大倍数\'',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '真人匹配斗地主'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_118
(
    id          int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype    int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    minLimit    int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxLimit    int          NOT NULL DEFAULT 0 COMMENT '单局最大下注额|1||最大下注额',
    bet         varchar(255) NOT NULL DEFAULT '' COMMENT '可下注额|1|',
    mult        varchar(255) NOT NULL DEFAULT '' COMMENT '各投注点赔率0:大,1:小,2:单,3:双,4:任意豹子,5:豹子,6:豹子,7:豹子,8:豹子4,9:豹子5,10:豹子6,11:4点,12:5点,13:6点,14:7点,15:8点,16:9点,17:10点,18:11点,19:12点,20:13点,21:14点,22:15点,23:16,24:17点',
    maxBetCoins varchar(255) NOT NULL DEFAULT '' COMMENT '各投注位置限额0:大,1:小,2:单,3:双,4:任意豹子,5:豹子,6:豹子,7:豹子,8:豹子4,9:豹子5,10:豹子6,11:4点,12:5点,13:6点,14:7点,15:8点,16:9点,17:10点,18:11点,19:12点,20:13点,21:14点,22:15点,23:16点,24:17点',
    revenuePerc int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc     int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    betTime     int          NOT NULL DEFAULT 0 COMMENT '投注状态持续时间(秒)',
    waitTime    int          NOT NULL DEFAULT 0 COMMENT '等待状态持续时间(秒)',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '骰宝配置'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_119
(
    id           int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype     int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename     varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    baseScore    int          NOT NULL DEFAULT 0 COMMENT '房间底分|1||底分',
    coinLimit    int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxQiangMult int          NOT NULL DEFAULT 0 COMMENT '抢庄倍数|1||抢庄倍数[0,1,2,3] 0:不抢',
    maxBetMult   int          NOT NULL DEFAULT 0 COMMENT '最大下注倍数|1||闲家最大下注倍数',
    revenuePerc  int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc      int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '真人匹配三公'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_120
(
    id           int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype     int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename     varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    baseScore    int          NOT NULL DEFAULT 0 COMMENT '房间底分|1||底分',
    minCoinLimit int          NOT NULL DEFAULT 0 COMMENT '最低准入分数|1||准入',
    maxCoinLimit int          NOT NULL DEFAULT 0 COMMENT '最高准入分数|1|准入',
    addBet       varchar(255) NOT NULL DEFAULT '' COMMENT '加注阶梯|1|[int,int,int,...]|加注[]',
    maxRound     int          NOT NULL DEFAULT 0 COMMENT '最大回合数',
    revenuePerc  int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc      int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '真人匹配梭哈'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_121
(
    id          int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype    int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    baseScore   int          NOT NULL DEFAULT 0 COMMENT '房间底分|1||底分',
    coinLimit   int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxBetMult  int          NOT NULL DEFAULT 0 COMMENT '玩家允许的下注返回',
    revenuePerc int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc     int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    matchTime   int          NOT NULL DEFAULT 0 COMMENT '匹配时间',
    betTime     int          NOT NULL DEFAULT 0 COMMENT '下注时间',
    settleTime  int          NOT NULL DEFAULT 0 COMMENT '结算时间',
    showTime    int          NOT NULL DEFAULT 0 COMMENT '显示时间',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '通比牛牛'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_122
(
    id            int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype      int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename      varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    revenuePerc   int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    baseScore     int          NOT NULL DEFAULT 0 COMMENT '房间底分|1||底分',
    coinLimit     int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxMult       int          NOT NULL DEFAULT 0 DEFAULT 8 COMMENT '\'最大倍数|1||最大倍数\'',
    minLimit      int          NOT NULL DEFAULT 0 COMMENT '最小限制',
    maxLimit      int          NOT NULL DEFAULT 0 COMMENT '最大限制',
    luckyMinLimit int          NOT NULL DEFAULT 0 COMMENT '幸运最小限制',
    luckyMaxLimit int          NOT NULL DEFAULT 0 COMMENT '幸运值最大限制',
    mult          int          NOT NULL DEFAULT 0 COMMENT '倍率',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7 COMMENT = '二人麻将'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_123
(
    id          int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype    int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename    varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    baseScore   int          NOT NULL DEFAULT 0 COMMENT '房间底分|1||底分',
    coinLimit   int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    addBet      varchar(255) NOT NULL DEFAULT '' COMMENT '加注阶梯|1|[int,int,int,...]|加注[]',
    maxRound    int          NOT NULL DEFAULT 0 COMMENT '最大轮数|1||最大轮数',
    tipCoin     int          NOT NULL DEFAULT 0 COMMENT '喜钱|1||喜钱',
    revenuePerc int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc     int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '极速炸金花'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_124
(
    id               int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype         int UNSIGNED NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename         varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    revenuePerc      int          NOT NULL DEFAULT 0 DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc          int UNSIGNED NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    addBet           varchar(255) NOT NULL DEFAULT '' COMMENT '加注阶梯|1|[int,int,int,...]|加注[]',
    coinLimit        int UNSIGNED NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    addScoreMinCoin  int UNSIGNED NOT NULL DEFAULT 0 COMMENT '下注最小金额',
    addScoreMaxCoin  int UNSIGNED NOT NULL DEFAULT 0 COMMENT '下注最大金额',
    bankerScoreLimit int UNSIGNED NOT NULL DEFAULT 0 COMMENT '申请上庄的最小金额',
    bankerCountLimit int UNSIGNED NOT NULL DEFAULT 0 COMMENT '申请上庄列表最大数量',
    userNum          int          NOT NULL DEFAULT 0 DEFAULT 0 COMMENT '最大用户数',
    addScoreTime     int UNSIGNED NOT NULL DEFAULT 0 COMMENT '下注等待的时间',
    bankerRoundNum   int UNSIGNED NOT NULL DEFAULT 0 COMMENT '上庄最大牌局数',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '万人推筒子配置'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS game_config_125
(
    id           int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    gametype     int          NOT NULL DEFAULT 0 COMMENT '房间编号|0||场次(1:初级,2:中级...)',
    gamename     varchar(32)  NOT NULL DEFAULT '' NOT NULL COMMENT '房间名称|0||场次名称',
    baseScore    int          NOT NULL DEFAULT 0 COMMENT '房间底分|1||底分',
    coinLimit    int          NOT NULL DEFAULT 0 COMMENT '准入分数|1||准入',
    maxQiangMult int          NOT NULL DEFAULT 0 COMMENT '抢庄倍数|1||抢庄倍数[0,1,2,3] 0:不抢',
    maxBetMult   int          NOT NULL DEFAULT 0 COMMENT '最大下注倍数|1||闲家最大下注倍数',
    revenuePerc  int          NOT NULL DEFAULT 0 COMMENT '赢家抽水比例|0||赢家抽水比例',
    winPerc      int          NOT NULL DEFAULT 0 COMMENT '获胜概率|1||获胜百分比',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '二人广东麻将配置'
  ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS `t_mail`
(
    `id`            bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    `mail_main`     varchar(50)     NOT NULL DEFAULT '' COMMENT '邮件主题',
    `recipients`    varchar(50)     NOT NULL DEFAULT '' COMMENT '收件人',
    `cc_person`     varchar(100)    NOT NULL DEFAULT '' COMMENT '抄送人',
    `mail_title`    varchar(50)     NOT NULL DEFAULT '' COMMENT '邮件标题',
    `mail_content`  varchar(255)    NOT NULL DEFAULT '' COMMENT '邮件内容',
    `mail_type`     varchar(50)     NOT NULL DEFAULT '1' COMMENT '邮件类型 1财务管理， 2游戏设置管理，3公告弹窗',
    `delete_flag`   tinyint         NOT NULL DEFAULT '0' COMMENT '游戏删除状态，0：未删除，1：已删除',
    `create_time`   bigint          NOT NULL DEFAULT '0' COMMENT '当前游戏设置创建时间',
    `create_by`     varchar(64)     NOT NULL DEFAULT '' COMMENT '创建人',
    `update_time`   bigint          NOT NULL DEFAULT '0' COMMENT '最近修改时间',
    `update_by`     varchar(64)     NOT NULL DEFAULT '' COMMENT '修改人',
    `mail_state`    varchar(50)     NOT NULL DEFAULT '' COMMENT '区分对应哪个模板',
    `mail_template` varchar(255)    NOT NULL DEFAULT '' COMMENT '模板',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT ='邮箱设置';


CREATE TABLE IF NOT EXISTS `t_message`
(
    `id`            bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    `recevier`      varchar(50)     NOT NULL DEFAULT '' COMMENT '收件人',
    `copyer`        varchar(100)    NOT NULL DEFAULT '' COMMENT '抄送人',
    `sender`        varchar(64)     NOT NULL DEFAULT '' COMMENT '创建人',
    `msg_title`     varchar(50)     NOT NULL DEFAULT '' COMMENT '标题',
    `msg_content`   json            NULL COMMENT '邮件内容',
    `msg_type`      varchar(50)     NOT NULL DEFAULT '1' COMMENT '邮件类型 1运营邮件， 2游戏邮件，3公告邮件',
    `read_type`     tinyint         NOT NULL DEFAULT '0' COMMENT '状态，0：未读，1：已读',
    `delete_flag`   tinyint         NOT NULL DEFAULT '0' COMMENT '游戏删除状态，0：未删除，1：已删除',
    `create_time`   bigint          NOT NULL DEFAULT '0' COMMENT '当前游戏设置创建时间',
    `update_time`   bigint          NOT NULL DEFAULT '0' COMMENT '最近修改时间',
    `update_by`     varchar(64)     NOT NULL DEFAULT '' COMMENT '修改人',
    `verify_status` tinyint         NOT NULL DEFAULT '0' COMMENT '审核状态 0未审核(默) 1已审核',
    `verify_msg`    varchar(500)    NOT NULL DEFAULT '' COMMENT '审核备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT ='消息设置';



CREATE TABLE IF NOT EXISTS `t_validator_setting`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `merchant_id`    bigint          NOT NULL DEFAULT '0' COMMENT '平台id',
    `merchant_name`  varchar(50)     NOT NULL DEFAULT ' ' COMMENT '平台名称',
    `validator_name` varchar(50)     NOT NULL DEFAULT ' ' COMMENT '验证器项目名称',
    `validator_type` tinyint         NOT NULL DEFAULT '0' COMMENT '验证器项目：0没有验证，1普通验证器(图形验证)，2 google验证器',
    `is_platform`    tinyint         NOT NULL DEFAULT '1' COMMENT '区分平台和总控：0，总控；1，平台',
    `vali_status`    tinyint         NOT NULL DEFAULT '1' COMMENT '状态：0,停用；1，启用',
    `delete_flag`    tinyint         NOT NULL DEFAULT '0' COMMENT '游戏删除状态，0：未删除，1：已删除',
    `create_time`    bigint          NOT NULL DEFAULT '0' COMMENT '当前游戏设置创建时间',
    `create_by`      varchar(64)     NOT NULL DEFAULT 'unknown' COMMENT '创建人',
    `update_time`    bigint          NOT NULL DEFAULT '0' COMMENT '最近修改时间',
    `update_by`      varchar(64)     NOT NULL DEFAULT 'unknown' COMMENT '修改人',
    PRIMARY KEY (`id`),
    KEY `merchant_id` (`merchant_id`)
) ENGINE = InnoDB COMMENT ='验证器表';

CREATE TABLE IF NOT EXISTS `t_merchant_secret`
(
    `id`           bigint unsigned NOT NULL default '0' COMMENT '主键ID',
    `merchant_id`  bigint          NOT NULL default '0' COMMENT '商户ID',
    `valid_status` tinyint         NOT NULL default '1' COMMENT '1 未绑定成功  2绑定成功',
    `secret_key`   varchar(255)    NOT NULL DEFAULT '' COMMENT '谷歌秘钥',
    `create_by`    varchar(32)     NOT NULL default '' COMMENT '创建人',
    `create_time`  bigint          NOT NULL default '0' COMMENT '创建时间',
    `update_by`    varchar(32)     NOT NULL default '' COMMENT '更新人',
    `update_time`  bigint          NOT NULL default '0' COMMENT '更新时间',
    `user_id`      bigint          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `merchant_id_index` (`merchant_id`) USING BTREE
) ENGINE = InnoDB
  ROW_FORMAT = DYNAMIC COMMENT '商户密匙表';

CREATE TABLE IF NOT EXISTS `t_backstage_setting`
(
    `id`            bigint unsigned AUTO_INCREMENT NOT NULL COMMENT '主键ID',
    `merchant_id`   bigint                         NOT NULL DEFAULT '0' COMMENT '平台id',
    `merchant_name` varchar(50)  DEFAULT ''        NOT NULL COMMENT '平台名称',
    `type_code`     tinyint      DEFAULT '0'       NOT NULL COMMENT '样式类别：0 logo ,1 品牌名称',
    `type_name`     varchar(50)  DEFAULT ''        NOT NULL COMMENT '样式名称',
    `location_code` tinyint      DEFAULT '0'       NOT NULL COMMENT '位置码',
    `location_name` varchar(50)  DEFAULT ''        NOT NULL COMMENT '位置名称',
    `content`       varchar(255) DEFAULT ''        NOT NULL COMMENT '内容',
    `statu`         tinyint      DEFAULT '0'       NOT NULL COMMENT '状态：0,未启用；1，启用',
    `delete_flag`   tinyint                        NOT NULL DEFAULT '0' COMMENT '游戏删除状态，0：未删除，1：已删除',
    `create_time`   bigint                         NOT NULL DEFAULT '0' COMMENT '当前游戏设置创建时间',
    `create_by`     varchar(64)  DEFAULT ''        NOT NULL COMMENT '创建人',
    `update_time`   bigint                         NOT NULL DEFAULT '0' COMMENT '最近修改时间',
    `update_by`     varchar(64)  DEFAULT ''        NOT NULL COMMENT '修改人',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `merchant_id_index` (`merchant_id`) USING BTREE
) ENGINE = InnoDB COMMENT '后台设置';


CREATE TABLE IF NOT EXISTS `t_backstage_setting_location`
(
    `id`        bigint unsigned AUTO_INCREMENT NOT NULL COMMENT '主键ID',
    `type_code` bigint      DEFAULT '0'        NOT NULL COMMENT '位置编码',
    `type_name` varchar(50) DEFAULT ''         NOT NULL COMMENT '位置名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT '后台设置位置';


CREATE TABLE IF NOT EXISTS `t_backstage_setting_type`
(
    `id`        bigint unsigned AUTO_INCREMENT NOT NULL COMMENT '主键ID',
    `type_code` tinyint     DEFAULT '0'        NOT NULL COMMENT '类型ID',
    `type_name` varchar(50) DEFAULT ''         NOT NULL COMMENT '类型名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT '后台设置类型';


CREATE TABLE `t_freeze_record`
(
    `id`                 bigint UNSIGNED  NOT NULL AUTO_INCREMENT COMMENT '冻结ID',
    `member_id`          bigint           NOT NULL DEFAULT 0 COMMENT '会员ID',
    `freeze_time`        bigint           NOT NULL DEFAULT 0 COMMENT '冻结时间',
    `freeze_reason`      varchar(200)     NOT NULL DEFAULT '' COMMENT '冻结原因',
    `freeze_operator`    varchar(20)      NOT NULL DEFAULT '' COMMENT '冻结操作员',
    `thaw_time`          bigint           NOT NULL DEFAULT 0 COMMENT '解冻时间',
    `thaw_operator`      varchar(50)      NOT NULL DEFAULT '' COMMENT '解冻人员',
    `thaw_reason`        varchar(200)     NOT NULL DEFAULT '' COMMENT '解冻原因',
    `current_state`      tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '当前状态:0、未冻结,1已冻结',
    `freeze_period`      bigint           NOT NULL DEFAULT 0 COMMENT '冻结时长段',
    `freeze_type`        tinyint          NOT NULL DEFAULT 0 COMMENT '冻结类型',
    `merchant_id`        bigint           NOT NULL DEFAULT 0 COMMENT '商户id',
    `merchant_member_id` varchar(60)      NOT NULL DEFAULT '' COMMENT '商户会员id',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1 COMMENT '冻结记录表';

CREATE TABLE `t_white_list`
(
    `id`            bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '游戏测试白名单id',
    `user_id`       bigint          NOT NULL DEFAULT '0' COMMENT '用户id',
    `nick_name`     varchar(100)    NOT NULL DEFAULT '' COMMENT '昵称',
    `start_time`    bigint          NOT NULL DEFAULT '0' COMMENT '测试开始时间',
    `end_time`      bigint          NOT NULL DEFAULT '0' COMMENT '测试结束时间',
    `ip`            varchar(255)    NOT NULL DEFAULT '' COMMENT 'ip',
    `member_status` tinyint         NOT NULL DEFAULT '0' COMMENT '状态：0:正常使用，1：停用',
    `create_time`   bigint          NOT NULL DEFAULT '0' COMMENT '当前游戏设置创建时间',
    `create_by`     varchar(50)     NOT NULL DEFAULT '' COMMENT '创建人',
    `update_time`   bigint          NOT NULL DEFAULT '0' COMMENT '最近修改时间',
    `update_by`     varchar(50)     NOT NULL DEFAULT '' COMMENT '修改人',
    `merchant_id`   bigint          NOT NULL DEFAULT '0' COMMENT '商户id',
    `merchant_name` varchar(255)    NOT NULL DEFAULT '' COMMENT '商户名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 COMMENT ='游戏测试白名单';


#总控sql 初始化

#总控admin用户初始化
INSERT INTO `t_ps_role` (`id`, `role_name`, `role_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`, `delete_by`, `delete_flag`, `delete_time`, `role_level_id`) VALUES ('10000', '超级管理员', '1', '', 'ybqp', 'admin', '1577773005', 'admin', '1579603457', '', '0', '1576234628915', '');
INSERT INTO `t_ps_user` (`id`, `login_name`, `login_password`, `nick_name`, `role_id`, `remark`, `user_status`, `create_by`, `create_time`, `update_by`, `update_time`, `delete_by`, `delete_flag`, `delete_time`, `secret_key`, `head_pic`, `merchant_alia`, `error_number`, `error_time`) VALUES ('10000', 'admin', '5d93ceb70e2bf5daa84ec3d0cd2c731a', 'admin', '10000', '', '1', 'admin', '1576234628', 'admin', '1579943708', '', '0', '1576234628915', '5ZGL65UVIU2LABGC', '10', 'ybqp', '0', '0');

INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1', '0', '权限管理', '/permission', 'permission', '1', '11', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('2', '0', '玩家管理', '/playerManage', 'player', '1', '12', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('3', '0', '游戏管理', '/gameManage', 'game', '1', '14', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('4', '0', '风控管理', '/riskManage', 'risk', '1', '16', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('5', '0', '公告管理', '/noticeManage', 'notice', '1', '18', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('6', '0', '平台管理', '/platformManage', 'platform', '1', '15', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('7', '0', '系统设置', '/configSystem', 'config', '1', '19', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('8', '0', '财务管理', '/finance', 'finance', '1', '13', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('9', '0', '点控', '/pointControl', 'risk', '1', '17', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('10', '1', '菜单管理', '/permission/meauManage', 'meauManage', '2', '1110', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('11', '1', '管理员管理', '/permission/admin', 'admin', '2', '1111', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('12', '1', '角色管理', '/permission/role', 'role', '2', '1112', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('13', '1', '操作日志', '/permission/operationLog', 'role-operationLog', '2', '1113', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('14', '2', '玩家列表', '/playerManage/playerList/playerList', 'playerList', '2', '1210', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('15', '2', '游戏记录', '/playerManage/gameRecord/gameRecord', 'gameRecord', '2', '1211', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('16', '2', '冻结记录', '/playerManage/blockRecord', 'blockRecord', '2', '1214', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('17', '2', '留存报表', '/playerManage/keepTable', 'keepTable', '2', '1216', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('18', '2', '日活报表', '/playerManage/dailyData/dailyData', 'dailyData', '2', '1218', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('19', '3', '游戏设置', '/gameManage/settings/settings', 'gameManage-settings', '2', '1410', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('20', '3', '测试白名单', '/gameManage/testWhitelist', 'testWhitelist', '2', '1413', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('21', '3', '代单管理', '/gameManage/Fronting', 'settingsbtn', '2', '1414', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('22', '3', '代单游戏配置', '/gameManage/Frontinggame', 'Frontinggamebtn', '2', '1416', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('23', '3', '代单登录记录', '/gameManage/Frontinlogin', 'Frontinloginbtn', '2', '1418', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('24', '3', '代单游戏记录', '/gameManage/Frontingamerecord', 'Frontingamerecordbtn', '2', '1415', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('25', '4', '风控设置', '/riskManage/riskConfig', 'riskConfig', '2', '1610', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('26', '4', '游戏风控设置', '/riskManage/gameConfig', 'gameConfig', '2', '1611', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('27', '5', '跑马灯管理', '/noticeManage/marqueeConfig', 'marqueeConfig', '2', '1810', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('28', '5', '弹窗公告管理', '/noticeManage/popManage', 'popManage', '2', '1811', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('29', '6', '平台设置', '/platformManage/platformConfig/platformConfig', 'platformConfig', '2', '1511', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('30', '6', '平台游戏设置', '/platformManage/gamesetting', 'gamesetting', '2', '1514', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('31', '7', '验证器设置', '/configSystem/validatorSetting', 'validatorSetting', '2', '1911', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('32', '7', '后台设置', '/configSystem/backgroundSetting', 'backgroundSetting', '2', '1912', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('33', '7', '邮件模板配置', '/configSystem/mail', 'mail', '2', '1913', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('34', '7', '邮箱管理', '/configSystem/emaildata', 'emaildata', '2', '1914', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('35', '8', '总控盈亏', '/financeManage/projectControlling', 'projectControlling', '2', '1310', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('36', '8', '平台盈亏', '/financeManage/platform', 'platformProfitAndLoss', '2', '1311', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('37', '8', '帐变流水', '/financeManage/accountChange', 'financeMangeAccountChange', '2', '1317', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('38', '8', '终端盈亏', '/financeManage/terminal', 'terminalbtn', '2', '1313', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('39', '8', '玩家盈亏', '/financeManage/playerfitloss', 'playerfitlossbtn', '2', '1314', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('40', '8', '游戏盈亏', '/financeManage/gameprofitloss', 'gameprofitlossbtn', '2', '1316', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('41', '8', '平台结算', '/financeManage/platformSettlement', 'platformSettlement', '2', '1318', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('42', '8', '结算方案', '/financeManage/ptSettlement', 'ptSettlement', '2', '1315', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('43', '9', '点控系数设置', '/pointControl/pointConfig', 'pointConfig', '2', '1710', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('44', '9', '总控游戏盈亏', '/pointControl/gamePositLoss/gamePositLoss', 'gamePositLoss', '2', '1711', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('45', '9', '平台盈亏', '/pointControl/platformPofitLoss/platformPofitLoss', 'platformPofitLoss', '2', '1712', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('46', '9', '平台游戏盈亏', '/pointControl/platformGame/platformGame', 'platformGame', '2', '1713', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('47', '9', '平台玩家盈亏', '/pointControl/plateformPlayer/plateformPlayer', 'plateformPlayer', '2', '1714', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('48', '9', '玩家点控报表', '/pointControl/playerPoint', 'playerPoint', '2', '1716', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('49', '10', '查询', '/qp-permission/module/queryModuleList', 'menu-search', '3', '111010', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('50', '10', '修改', '/qp-permission/module/modifyModule', 'menu-modify', '3', '111011', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('51', '11', '查询', '/qp-permission/user/queryUserList', 'adManage-search', '3', '111110', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('52', '11', '新增', '/qp-permission/user/createUser', 'adManage-create', '3', '111111', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('53', '11', '修改', '/qp-permission/user/modifyUser', 'adManage-modify', '3', '111112', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('54', '12', '启用/禁用', '/qp-permission/rolePermission/modifyRole', 'modifyRole', '3', '111113', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('55', '11', '删除', '/qp-permission/user/deleteUser', 'adManage-delete', '3', '111113', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('56', '11', 'Google绑定', '/qp-permission/merchantSerc/blindMerchantSecr', 'googlebtn', '3', '111114', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('57', '12', '查询', '/qp-permission/rolePermission/queryRoleList', 'role-search', '3', '111210', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('58', '12', '新增', '/qp-permission/rolePermission/createRolePermission', 'role-create', '3', '111211', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('59', '12', '修改', '/qp-permission/rolePermission/modifyRolePermission', 'role-modify', '3', '111214', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('60', '12', '删除', '/qp-permission/rolePermission/deleteRole', 'role-delete', '3', '111216', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('61', '13', '查询', '/qp-permission/log/queryLogList', 'operationLog-search', '3', '111310', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('62', '13', '详情', '/qp-permission/log/', 'operationLog', '3', '111311', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('63', '14', '查询', '/qp-member/member/list', 'playerList-search', '3', '121010', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('64', '15', '高级查询', '0', 'gameRecordheightbtn', '3', '121011', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('65', '14', '高级查询', '0', 'memberheightbtn', '3', '121011', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('66', '14', '批量冻结', '/qp-member/member/freezeMember', 'playerList-freezeMember', '3', '121012', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('67', '14', '批量解冻', '/qp-member/member/thawMember', 'playerList-thawMember', '3', '121013', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('68', '14', '冻结', '/qp-member/member/freezeMember', 'playerList-freeze', '3', '121014', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('69', '14', '解冻', '/qp-member/member/thawMember', 'playerList-thaw', '3', '121016', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('70', '14', '详情', '/qp-member/member/selectAccountFlow', 'playerList-playerDetail', '3', '121015', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('71', '14', '玩家资金流水', '/playerManage/playerDetail', 'playerDetail-stream', '3', '121019', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('72', '14', '玩家游戏记录', '/playerManage/playerDetail', 'playerDetail-gameRecord', '3', '121013', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('73', '14', '注单详情', '/qp-member/member/memberGameRecordDetails', 'playerDetail-detailbtn', '3', '121017', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('74', '14', '玩家冻结记录', '/qp-member/member/freezeLog', 'playerDetail-frozenRecord', '3', '121021', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('75', '14', '玩家登录记录', '/qp-member/user/loginLogDetail', 'playerDetail-loginRecord', '3', '121022', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('76', '15', '查询', '/qp-member/member/gameRecord', 'gameRecord-search', '3', '121110', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('77', '15', '注单详情', '/qp-member/member/gameRecord/detail', 'gameRecord-detailbtn', '3', '121112', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('78', '16', '查询', '/qp-member/member/freezeLog/platform', 'platform-search', '3', '121410', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('79', '42', '查询(平台)', '/qp-merchant/settle/list', '0', '3', '121434', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('80', '42', '结算方案查看(平台)', '/qp-merchant/settle/detail', 'settlement-lookBtn', '3', '121435', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('81', '17', '日留存查询', '/qp-member/report/retain/day', 'keepTable-day', '3', '121610', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('82', '17', '月留存查询', '/qp-member/report/retain/month', 'keepTable-month', '3', '121612', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('83', '18', '日活报表查询', '/qp-member/report/active/day', 'dailyData-day', '3', '121810', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('84', '18', '终端日活报表查询', '/qp-member/report/active/device', 'dailyData-device', '3', '121811', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('85', '18', '日活报表详情', '', 'dailyData-info', '3', '121814', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('86', '18', '日活报表游戏详情', '/qp-member/report/gameDetail', 'dailyData-gameInfo', '3', '121816', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('87', '19', '查询', '/qp-game-setting/setting/querySettingPageByIds', 'querySettingPageByIdsbtn', '3', '141010', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('88', '19', '修改', '/qp-game-setting/order/saveGameOrder', 'gameManage-modification', '3', '141011', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('89', '19', '保存', '/qp-game-setting/order/saveGameOrder', 'gameManage-saveGameOrder', '3', '141012', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('90', '19', '预览', '/qp-game-setting/order/queryGamePreviewByPid', 'gameManage-gamePreview', '3', '141013', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('91', '19', '标签设置', '', 'gameManage-labelSet', '3', '141016', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('92', '19', '分类设置', '', 'gameManage-typeSet', '3', '141018', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('93', '19', '查询分类', '/qp-game-setting/setting/getGameTypePage', 'getGameTypePage', '3', '141015', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('94', '19', '查询标签', '/qp-game-setting/setting/getGameLabelPage', 'getGameLabelPage', '3', '141019', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('95', '19', '修改分类', '/qp-game-setting/setting/updateGameType', 'updateGameType', '3', '141017', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('96', '19', '同步', '/qp-game-setting/setting/readDataForGameService', 'gameManage-readDataForGameService', '3', '141022', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('97', '19', '停用', '/qp-game-setting/setting/setGameStatus', 'gameManage-blockUp', '3', '141023', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('98', '20', '查询', '/qp-member/whiteList/list', 'testWhitelist-inquire', '3', '141310', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('99', '20', '新增', '/qp-member/whiteList/create', 'testWhitelist-added', '3', '141311', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('100', '20', '检测', '/qp-member/whiteList/getMembers', 'getMembers', '3', '141313', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('101', '21', '查询', '/qp-behalf/userInfo/list', 'userInfossearch', '3', '141410', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('102', '21', '新增', '/qp-behalf/userInfo/saveBehalfUserInfo', 'saveBehalfUserInfobtn', '3', '141411', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('103', '21', '修改', '/qp-behalf/userInfo/updateBehalfUserInfo', 'updateBehalfUserInfobtn', '3', '141412', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('104', '21', '检测', '/qp-behalf/userInfo/validate', 'validate', '3', '141413', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('105', '22', '查询', '/qp-behalf/gameConfig/list', 'gameConfigsearch', '3', '141610', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('106', '22', '同步游戏', '/qp-behalf/gameConfig/syc', 'sycbtn', '3', '141611', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('107', '22', '启用禁用', '/qp-behalf/gameConfig/save', 'gameConfigupdate', '3', '141612', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('108', '23', '查询', '/qp-behalf/login/list', 'loginlistbtn', '3', '141810', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('109', '24', '查询', '/qp-behalf/gameRecord/list', 'gameRecord-searchbtn', '3', '141510', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('110', '24', '高级查询', '/qp-behalf/gameRecord/list', 'gameRecord-heighsearchbtn', '3', '141511', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('111', '24', '详情', '/qp-member/member/gameRecord/detail', 'gotodeatailbtn', '3', '141512', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('112', '32', '启用', '/qp-system-settings/backstageSetting/update', 'update', '3', '141513', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('113', '25', '查询', '/qp-risk/riskConfig/queryRiskConfigList', 'riskConfig-search', '3', '161010', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('114', '25', '新增', '/qp-risk/riskConfig/createRiskConfig', 'riskConfig-create', '3', '161011', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('115', '25', '启用', '/qp-risk/riskConfig/modifyRiskConfig', 'riskConfig-start', '3', '161012', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('116', '25', '修改', '/qp-risk/riskConfig/modifyRiskConfig', 'riskConfig-modify', '3', '161013', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('117', '26', '查询', '/qp-risk/gameConfig/queryGameConfigList', 'gameConfig-search', '3', '161110', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('118', '26', '游戏风控参数设置', '/qp-risk/gameConfig/modifyGameConfig', 'gameConfig-config', '3', '161111', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('119', '27', '查询', '/qp-notice/notice/queryMarqueeParamList', 'marqueeConfig-searchBtn', '3', '181010', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('120', '27', '新增', '/qp-notice/notice/insertMarquee', 'marqueeConfig-addBtn', '3', '181011', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('121', '27', '修改', '/qp-notice/notice/updateMarquee', 'marqueeConfig-modifierBtn', '3', '181012', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('122', '27', '删除', '/qp-notice/notice/deleteMarqueeParam', 'marqueeConfig-delBtn', '3', '181013', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('123', '27', '操作日志查询', '/qp-notice/notice/selectOperationLog', 'selectOperationLog', '3', '181014', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('124', '27', '归档', '/qp-notice/notice/marqueeArchive', 'marqueeConfig-archiveBtn', '3', '181016', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('125', '27', '操作日志详情', '/qp-notice/notice/selectOperateLogById', 'selectOperateLogById', '3', '181018', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('126', '28', '查询', '/qp-notice/notice/queryPopupParamList', 'popManage-searchBtn', '3', '181110', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('127', '28', '新增', '/qp-notice/notice/insertPopup', 'popManage-addBtn', '3', '181111', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('128', '28', '修改', '/qp-notice/notice/updatePopup', 'popManage-modifierBtn', '3', '181112', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('129', '28', '删除', '/qp-notice/notice/deletePopup', 'popManage-delBtn', '3', '181113', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('130', '28', '操作日志查询', '/qp-notice/notice/selectOperationLog', 'selectOperationLog', '3', '181114', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('131', '28', '操作日志详情', '/qp-notice/notice/selectOperateLogById', 'selectOperateLogById', '3', '181118', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('132', '29', '查询', '/qp-merchant/merchant/searchList', 'platformConfig-searchBtn', '3', '151110', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('133', '29', '新增', '/qp-merchant/merchant/saveMerchant', 'platformConfig-addBtn', '3', '151111', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('134', '29', '结算方案', '/platformManage/Settlement', 'platformConfig-settlementBtn', '3', '151112', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('135', '29', '查看结算周期', '/platformManage/intervals', 'platformConfig-settlementcycleBtn', '3', '151113', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('136', '29', '结算方案详情', '/qp-merchant/settle/pdetail', 'Settlement', '3', '151114', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('137', '29', '启用', '/qp-merchant/merchant/updateMerchant', 'updateMerchantBtn', '3', '151116', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('138', '29', '修改', '/qp-merchant/merchant/updateMerchant', 'platformConfig-modifierBtn', '3', '151118', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('139', '29', '结算方案查询', '/qp-merchant/settle/list', 'Settlement-searchBtn', '3', '151115', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('140', '29', '结算方案新增', '/qp-merchant/settle/insert', 'Settlement-addBtn', '3', '151119', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('141', '29', '结算方案修改', '/qp-merchant/settleOperationLog/querySettleOperationLogList', 'Settlement-modifierBtn', '3', '151113', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('142', '29', '操作日志查询', '/qp-merchant/settleOperationLog/querySettleOperationLogList', 'querySettleOperationLogList', '3', '151117', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('143', '29', '操作日志详情', '/qp-merchant/settleOperationLog/operationLogId', 'operationLogId', '3', '151121', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('144', '29', '子平台查询', '/qp-merchant/merchant/child/list', 'child-list', '3', '151122', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('145', '29', '子平台新增', '/qp-merchant/merchant/child/bind', 'child-bind', '3', '151123', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('146', '29', '子平台详情', '/qp-merchant/merchant/child/detail', 'child-detail', '3', '151124', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('147', '30', '查询', '/qp-game-setting/order/queryGameOrderByPage', 'gamesetting-searchBtn', '3', '151410', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('148', '30', '预览', '/qp-game-setting/order/queryGamePreviewByPid', 'gamesetting-previewBtn', '3', '151411', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('149', '30', '启用', '/qp-game-setting/room/queryPlatformGameRoom', 'opeanBtn', '3', '151412', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('150', '30', '房间设置查看', '/qp-game-setting/room/queryPlatformGameRoom', 'gamesetting-setroomBtn', '3', '151413', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('151', '34', '邮件查看权限', '/qp-system-settings/message/updateType', 'message-updateType', '3', '19110', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('152', '31', '查询', '/qp-system-settings/validator/selectValidatorPage', 'validatorSetting-search', '3', '191110', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('153', '31', '启用', '/qp-system-settings/validator/updateValidator', 'validatorSetting-updateValidator', '3', '191111', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('154', '32', '查询', '/qp-system-settings/backstageSetting/queryList', 'backgroundSetting-search', '3', '191210', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('155', '32', '修改', '/qp-system-settings/backstageSetting/update', 'backgroundSetting-update', '3', '191212', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('156', '33', '游戏管理邮件', '/qp-system-settings/mail/queryMailInfo', 'mailbtn', '3', '191311', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('157', '33', '游戏修改', '/qp-system-settings/mail/updateMail', 'mail-update', '3', '191317', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('158', '33', '游戏保存', '/qp-system-settings/mail/updateMail', 'mail-save', '3', '191313', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('159', '33', '公告管理邮件', '/qp-system-settings/mail/queryMailInfo', 'announcement', '3', '191314', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('160', '33', '公告修改', '/qp-system-settings/mail/updateMail', 'announcement-update', '3', '191316', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('161', '33', '公告保存', '/qp-system-settings/mail/updateMail', 'announcement-save', '3', '191318', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('162', '34', '游戏邮件查询', '/qp-system-settings/message/queryGameMsg', 'queryGameMsgbtn', '3', '191414', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('163', '34', '游戏邮件删除', '/qp-system-settings/message/delOne', 'queryGameMsgdelOnebtn', '3', '191416', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('164', '34', '游戏邮件一键删除已读邮件', '/qp-system-settings/message/delAll', 'queryGameMsgdelAllbtn', '3', '191418', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('165', '34', '公告邮件查询', '/qp-system-settings/message/queryCommonMsg', 'queryCommonMsgbtn', '3', '191415', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('166', '34', '公告邮件删除', '/qp-system-settings/message/delOne', 'queryCommonMsgdelOnebtn', '3', '191418', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('167', '34', '公告邮件一键删除已读邮件', '/qp-system-settings/message/delAll', 'queryCommonMsgdelAllOnebtn', '3', '191419', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('168', '35', '查询', '/qp-financial/report/queryConsoleProfitAndLoss', 'profitAndLoss-searchBtn', '3', '131010', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('169', '35', '详情', '', 'platformProfit-detailsBtn', '3', '131011', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('170', '36', '查询', '/qp-financial/report/queryPlatformProfitAndLoss', 'queryPlatform-searchBtn', '3', '131110', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('171', '36', '详情', '', 'queryGame-detailsBtn', '3', '131111', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('172', '37', '查询', '/qp-wallet/memberBalanceChange/list', 'fundsDeductList-search', '3', '131710', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('173', '37', '高级查询', '', 'accountChange-advanceSearchBtn', '3', '131711', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('174', '38', '查询', '/qp-financial/report/queryTerminalProfitAndLoss', 'queryTerminalProfitAndLossbtn', '3', '131310', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('175', '39', '查询', '/qp-financial/report/queryPlayerProfitAndLoss', 'playerfitlosssearchbtn', '3', '131410', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('176', '39', '高级查询', '/qp-financial/report/queryPlayerProfitAndLoss', 'advancedsearchbtn', '3', '131411', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('177', '39', '详情', '', 'playerfitlossgodetailbtn', '3', '131412', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('178', '39', '玩家盈亏排行榜查询', '/qp-financial/report/queryPlayerRank', 'queryPlayerRankbtn', '3', '131413', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('179', '40', '查询', '/qp-financial/report/queryGameProfitAndLoss', 'queryGameProfitAndLossbtn', '3', '131610', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('180', '41', '查询', '/qp-financial/platSettle/list', 'platformSettlement-search', '3', '131810', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('181', '41', '结算方案查看', '/qp-merchant/settle/detail', 'settlement-lookBtn', '3', '131812', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('182', '41', '审核', '/qp-financial/platSettle/audit', 'platformSettlement-audit', '3', '131813', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('183', '41', '驳回', '/qp-financial/platSettle/rejected', 'rejected', '3', '131814', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('184', '41', '结算', '/qp-financial/platSettle/settlement', 'platformSettlement-btn', '3', '131814', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('185', '41', '查看', '/qp-financial/platSettle/check', 'settlement-checkBtn', '3', '131816', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('186', '41', '保存', '/qp-financial/platSettle/modifyAmount', 'modifyAmount', '3', '131818', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('187', '43', '查询', '/rs-factor/conf/queryList', 'pointConfig', '3', '171010', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('188', '43', '新增', '/rs-factor/conf/create', 'pointConfig-addBtn', '3', '171011', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('189', '43', '日志查询', '/rs-factor/conf/queryLog', 'pointConfig-log', '3', '171014', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('190', '43', '查看日志详情', '/rs-factor/conf/queryLogDetail', 'pointConfig-detail', '3', '171016', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('191', '44', '查询', '/rs-report/conf/queryGameFormSumData', 'gamePositLos-searchBtn', '3', '171110', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('192', '44', '详情', '/rs-report/conf/queryGameDetail', 'gamePositLos-detailsBtn', '3', '171111', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('193', '45', '查询', '/rs-report/conf/queryPlatFormSumData', 'PlatFormSumData-searchBtn', '3', '171210', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('194', '45', '详情', '/rs-report/conf/queryPlatDetail', 'PlatFormSumData-detailsBtn', '3', '171211', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('195', '46', '查询', '/rs-report/conf/queryPlatGameSumData', 'platGame-searchBtn', '3', '171310', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('196', '46', '详情', '/rs-report/conf/queryPlatGameDetail', 'platGame-detailsBtn', '3', '171311', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('197', '47', '查询', '/rs-player/conf/queryPlaysListModel', 'plateformPlayer-searchBtn', '3', '171410', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('198', '47', '高级查询', '/rs-player/conf/queryPlaysListModel', 'plateformPlayer-advanceSearchBtn', '3', '171411', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('199', '47', '盈亏详情', '/rs-player/conf/queryPlayerRsDetail', 'plateformPlayer-lossWinBtn', '3', '171412', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('200', '47', '查看风控系数', '/rs-player/conf/queryLastRsParam', 'plateformPlayer-look', '3', '171413', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('201', '47', '调整期望盈利率', '/rs-player/conf/create', 'plateformPlayer-editProfil', '3', '171414', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('202', '47', '调整期望盈利率-申请', '/rs-player/conf/getDetail', 'getDetail', '3', '171416', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('203', '47', '调整点控系数', '/rs-player/conf/create', 'plateformPlayer-editPoint', '3', '171416', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('204', '47', '调整点控系数-申请', '/rs-player/conf/getDetail', 'getDetail', '3', '171418', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('205', '47', '审批', '/rs-player/conf/update', 'plateformPlayer-audit', '3', '171418', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('206', '47', '日志查询', '/rs-player/conf/queryLog', 'plateformPlayer-log', '3', '171415', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('207', '47', '日志详情', '/rs-player/conf/queryLogDetail', 'plateformPlayer-logDetails', '3', '171419', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('208', '47', '今日盈亏详情', '/rs-report/conf/queryPlayersProfitDetail', 'queryPlayersProfitDetail', '3', '171419', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('209', '47', '游戏占比盈亏详情', '/rs-player/conf/queryReportWinLoseAndCount', 'queryReportWinLoseAndCount', '3', '171413', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('210', '47', '端口占比-端口详情', '/rs-player/conf/queryReportDeviceCount', 'queryReportDeviceCount', '3', '171417', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('211', '47', '盈亏详情-游戏记录', '', 'gameRecord', '3', '171421', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('212', '48', '查询', '/rs-player/conf/queryPointReport', 'playerPoint', '3', '171610', '1', 'ybqp平台', 'ybqp', 'admin', '1579678562', '0', '1579678562');

# 平台菜单组件初始化(用于新建平台时初始化菜单数据)
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('213', '0', '权限管理', '/permission', 'permission', '1', '11', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('214', '0', '玩家管理', '/playerManage', 'player', '1', '12', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('215', '0', '游戏管理', '/gameManage', 'game', '1', '14', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('216', '0', '系统设置', '/configSystem', 'config', '1', '19', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('217', '0', '财务管理', '/finance', 'finance', '1', '13', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('218', '213', '管理员管理', '/permission/admin', 'admin', '2', '1111', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('219', '213', '角色管理', '/permission/role', 'role', '2', '1112', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('220', '213', '操作日志', '/permission/operationLog', 'role-operationLog', '2', '1113', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('221', '214', '玩家列表', '/playerManage/ptplayerList', 'playerList', '2', '1210', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('222', '214', '游戏记录', '/playerManage/gameRecord/gameRecord', 'gameRecord', '2', '1211', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('223', '214', '冻结记录', '/playerManage/ptBlockRecord', 'blockRecord', '2', '1214', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('224', '214', '留存报表', '/playerManage/keepTable', 'keepTable', '2', '1216', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('225', '214', '日活报表', '/playerManage/dailyData/dailyData', 'dailyData', '2', '1218', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('226', '215', '平台游戏设置', '/gameManage/settings/settings', 'gameManage-settings', '2', '1410', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('227', '215', '代单管理', '/gameManage/Fronting', 'settingsbtn', '2', '1414', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('228', '215', '代单登录记录', '/gameManage/Frontinlogin', 'Frontinloginbtn', '2', '1418', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('229', '215', '代单游戏记录', '/gameManage/Frontingamerecord', 'Frontingamerecordbtn', '2', '1415', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('230', '216', '后台设置', '/configSystem/backgroundSetting', 'backgroundSetting', '2', '1912', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('231', '216', '邮箱管理', '/configSystem/emaildata', 'emaildata', '2', '1916', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('232', '217', '平台盈亏', '/financeManage/platformItem', 'platformProfitAndLoss', '2', '1311', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('233', '217', '帐变流水', '/financeManage/accountPlateformChange', 'financeMangeAccountChange', '2', '1317', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('234', '217', '终端盈亏', '/financeManage/platformTerminal', 'terminalbtn', '2', '1313', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('235', '217', '玩家盈亏', '/financeManage/ptplayerfitloss', 'playerfitlossbtn', '2', '1314', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('236', '217', '游戏盈亏', '/financeManage/ptgameprofitloss', 'gameprofitlossbtn', '2', '1316', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('237', '217', '平台结算', '/financeManage/ptplatformSettlement', 'platformSettlement', '2', '1318', '1', '00000平台', '00000', 'admin', '1579678889', '0', '1579678889');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('238', '217', '结算方案', '/financeManage/ptSettlement', 'ptSettlement', '2', '1315', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('239', '218', '查询', '/qp-permission/user/queryUserList', 'adManage-search', '3', '111110', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('240', '218', '新增', '/qp-permission/user/createUser', 'adManage-create', '3', '111111', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('241', '218', '修改', '/qp-permission/user/modifyUser', 'adManage-modify', '3', '111112', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('242', '218', '删除', '/qp-permission/user/deleteUser', 'adManage-delete', '3', '111113', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('243', '219', '启用/禁用', '/qp-permission/rolePermission/modifyRole', 'modifyRole', '3', '111114', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('244', '218', 'Google绑定', '/qp-permission/merchantSerc/blindMerchantSecr', 'googlebtn', '3', '111114', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('245', '219', '查询', '/qp-permission/rolePermission/queryRoleList', 'role-search', '3', '111210', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('246', '219', '新增', '/qp-permission/rolePermission/createRolePermission', 'role-create', '3', '111211', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('247', '219', '修改', '/qp-permission/rolePermission/modifyRolePermission', 'role-modify', '3', '111212', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('248', '219', '删除', '/qp-permission/rolePermission/deleteRole', 'role-delete', '3', '111213', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('249', '220', '查询', '/qp-permission/log/queryLogList', 'operationLog-search', '3', '111310', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('250', '220', '详情', '/qp-permission/log/', 'operationLog', '3', '111311', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('251', '238', '结算方案查看', '/qp-merchant/settle/detail', 'settlement-lookBtn', '3', '11315', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('252', '221', '查询', '/qp-member/member/list', 'playerList-search', '3', '121010', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('253', '221', '批量冻结', '/qp-member/member/freezeMember', 'playerList-freezeMember', '3', '121013', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('254', '221', '批量解冻', '/qp-member/member/thawMember', 'playerList-thawMember', '3', '121014', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('255', '221', '冻结', '/qp-member/member/freezeMember', 'playerList-freeze', '3', '121016', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('256', '221', '解冻', '/qp-member/member/thawMember', 'playerList-thaw', '3', '121018', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('257', '221', '详情', '/qp-member/member/selectAccountFlow', 'playerList-playerDetail', '3', '121019', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('258', '221', '玩家资金流水', '/playerManage/playerDetail', 'playerDetail-stream', '3', '121022', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('259', '221', '注单详情', '/qp-member/member/memberGameRecordDetails', 'playerDetail-detailbtn', '3', '121025', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('260', '221', '玩家游戏记录', '/playerManage/playerDetail', 'playerDetail-gameRecord', '3', '121027', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('261', '221', '玩家冻结记录', '/qp-member/member/freezeLog', 'playerDetail-frozenRecord', '3', '121028', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('262', '221', '玩家登录记录', '/qp-member/user/loginLogDetail', 'playerDetail-loginRecord', '3', '121029', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('263', '222', '查询', '/qp-member/member/gameRecord', 'gameRecord-search', '3', '121110', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('264', '222', '注单详情', '/qp-member/member/gameRecord/detail', 'gameRecord-detailbtn', '3', '121111', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('265', '223', '查询', '/qp-member/member/freezeLog/platform', 'platform-search', '3', '121410', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('266', '238', '查询', '/qp-merchant/settle/list', '0', '3', '121434', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('267', '224', '日留存查询', '/qp-member/report/retain/day', 'keepTable-day', '3', '121610', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('268', '224', '月留存查询', '/qp-member/report/retain/month', 'keepTable-month', '3', '121612', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('269', '225', '日活报表查询', '/qp-member/report/active/day', 'dailyData-day', '3', '121810', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('270', '225', '终端日活报表查询', '/qp-member/report/active/device', 'dailyData-device', '3', '121811', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('271', '225', '日活报表详情', '', 'dailyData-info', '3', '121814', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('272', '225', '日活报表游戏详情', '/qp-member/report/gameDetail', 'dailyData-gameInfo', '3', '121816', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('273', '226', '查询', '/qp-game-setting/setting/querySettingPageByIds', 'querySettingPageByIdsbtn', '3', '141010', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('274', '226', '修改', '/qp-game-setting/order/saveGameOrder', 'gameManage-modification', '3', '141011', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('275', '226', '保存', '/qp-game-setting/order/saveGameOrder', 'gameManage-saveGameOrder', '3', '141012', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('276', '226', '同步', '/qp-game-setting/setting/readDataForGameService', 'gameManage-readDataForGameService', '3', '141013', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('277', '226', '停用', '/qp-game-setting/setting/setGameStatus', 'gameManage-blockUp', '3', '141013', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('278', '227', '查询', '/qp-behalf/userInfo/list', 'userInfossearch', '3', '141410', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('279', '227', '新增', '/qp-behalf/userInfo/saveBehalfUserInfo', 'saveBehalfUserInfobtn', '3', '141411', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('280', '227', '修改', '/qp-behalf/userInfo/updateBehalfUserInfo', 'updateBehalfUserInfobtn', '3', '141412', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('281', '227', '检测', '/qp-behalf/userInfo/validate', 'validate', '3', '141413\r\n', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('282', '228', '查询', '/qp-behalf/login/list', 'loginlistbtn', '3', '141810', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('283', '229', '查询', '/qp-behalf/gameRecord/list', 'gameRecord-searchbtn', '3', '141510', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('284', '229', '详情', '/playerManage/betDetails', 'gotodeatailbtn', '3', '141512', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('285', '230', '启用', '/qp-system-settings/backstageSetting/update', 'update', '3', '141513', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('286', '226', '预览', '/qp-game-setting/setting/getGameTypeList', 'gamesetting-previewBtn', '3', '151411', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('287', '231', '邮件查看权限', '/qp-system-settings/message/updateType', 'message-updateType', '3', '19110', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('288', '230', '查询', '/qp-system-settings/backstageSetting/queryList', 'backgroundSetting-search', '3', '191210', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('289', '230', '修改', '/qp-system-settings/backstageSetting/update', 'backgroundSetting-update', '3', '191212', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('290', '231', '游戏邮件查询', '/qp-system-settings/message/queryGameMsg', 'queryGameMsgbtn', '3', '191414', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('291', '231', '游戏邮件删除', '/qp-system-settings/message/delOne', 'queryGameMsgdelOnebtn', '3', '191416', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('292', '231', '游戏邮件一键删除已读邮件', '/qp-system-settings/message/delAll', 'queryGameMsgdelAllbtn', '3', '191418', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('293', '231', '公告邮件查询', '/qp-system-settings/message/queryCommonMsg', 'queryCommonMsgbtn', '3', '191415', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('294', '231', '公告邮件删除', '/qp-system-settings/message/delOne', 'queryCommonMsgdelOnebtn', '3', '191418', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('295', '231', '公告邮件一键删除已读邮件', '/qp-system-settings/message/delAll', 'queryCommonMsgdelAllOnebtn', '3', '191419', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('296', '232', '查询', '/qp-financial/report/queryPlatformProfitAndLoss', 'queryPlatform-searchBtn', '3', '131110', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('297', '232', '详情', '', 'queryGame-detailsBtn', '3', '131111', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('298', '233', '查询', '/qp-wallet/memberBalanceChange/list', 'fundsDeductList-search', '3', '131710', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('299', '234', '查询', '/qp-financial/report/queryTerminalProfitAndLoss', 'queryTerminalProfitAndLossbtn', '3', '131310', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('300', '235', '查询', '/qp-financial/report/queryPlayerProfitAndLoss', 'playerfitlosssearchbtn', '3', '131410', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('301', '235', '详情', '', 'playerfitlossgodetailbtn', '3', '131412', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('302', '235', '玩家盈亏排行榜查询', '/qp-financial/report/queryPlayerRank', 'queryPlayerRankbtn', '3', '131413', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('303', '236', '查询', '/qp-financial/report/queryGameProfitAndLoss', 'queryGameProfitAndLossbtn', '3', '131610', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('304', '237', '查询', '/qp-financial/platSettle/list', 'platformSettlement-search', '3', '131810', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('305', '237', '结算方案查看', '/qp-merchant/settle/detail', 'settlement-lookBtn', '3', '131813', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('306', '237', '查看', '/qp-financial/platSettle/check', 'settlement-checkBtn', '3', '131813', '1', '00000平台', '00000', 'admin', '1579678890', '0', '1579678890');


# 子平台菜单组件初始化(用于新建子平台时初始化菜单数据)
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('307', '0', '权限管理', '/permission', 'permission', '1', '11', '1', '11111平台', '11111', 'admin', '1579681790', '0', '1579681790');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('308', '0', '玩家管理', '/playerManage', 'player', '1', '12', '1', '11111平台', '11111', 'admin', '1579681790', '0', '1579681790');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('309', '0', '游戏管理', '/gameManage', 'game', '1', '14', '1', '11111平台', '11111', 'admin', '1579681790', '0', '1579681790');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('310', '0', '系统设置', '/configSystem', 'config', '1', '19', '1', '11111平台', '11111', 'admin', '1579681790', '0', '1579681790');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('311', '0', '子平台', '/childplatform', 'childplatform', '1', '17', '1', '11111平台', '11111', 'admin', '1579681790', '0', '1579681790');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('312', '307', '管理员管理', '/permission/admin', 'admin', '2', '1111', '1', '11111平台', '11111', 'admin', '1579681790', '0', '1579681790');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('313', '307', '角色管理', '/permission/role', 'role', '2', '1112', '1', '11111平台', '11111', 'admin', '1579681790', '0', '1579681790');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('314', '307', '操作日志', '/permission/operationLog', 'role-operationLog', '2', '1113', '1', '11111平台', '11111', 'admin', '1579681790', '0', '1579681790');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('315', '308', '玩家列表', '/playerManage/ptplayerList', 'playerList', '2', '1210', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('316', '308', '游戏记录', '/playerManage/gameRecord/gameRecord', 'gameRecord', '2', '1211', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('317', '308', '冻结记录', '/playerManage/ptBlockRecord', 'blockRecord', '2', '1214', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('318', '308', '留存报表', '/playerManage/keepTable', 'keepTable', '2', '1216', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('319', '308', '日活报表', '/playerManage/dailyData/dailyData', 'dailyData', '2', '1218', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('320', '309', '平台游戏设置', '/gameManage/settings/settings', 'gameManage-settings', '2', '1410', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('321', '309', '代单管理', '/gameManage/Fronting', 'settingsbtn', '2', '1414', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('322', '309', '代单登录记录', '/gameManage/Frontinlogin', 'Frontinloginbtn', '2', '1418', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('323', '309', '代单游戏记录', '/gameManage/Frontingamerecord', 'Frontingamerecordbtn', '2', '1415', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('324', '310', '后台设置', '/configSystem/backgroundSetting', 'backgroundSetting', '2', '1912', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('325', '310', '邮箱管理', '/configSystem/emaildata', 'emaildata', '2', '1916', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('326', '311', '子平台盈亏', '/childplatform/childplatformlist', 'childplatformlist', '2', '1710', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('327', '312', '查询', '/qp-permission/user/queryUserList', 'adManage-search', '3', '111110', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('328', '312', '新增', '/qp-permission/user/createUser', 'adManage-create', '3', '111111', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('329', '312', '修改', '/qp-permission/user/modifyUser', 'adManage-modify', '3', '111112', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('330', '312', '删除', '/qp-permission/user/deleteUser', 'adManage-delete', '3', '111113', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('331', '312', 'Google绑定', '/qp-permission/merchantSerc/blindMerchantSecr', 'googlebtn', '3', '111114', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('332', '313', '启用/禁用', '/qp-permission/rolePermission/modifyRole', 'modifyRole', '3', '111114', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('333', '313', '查询', '/qp-permission/rolePermission/queryRoleList', 'role-search', '3', '111210', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('334', '313', '新增', '/qp-permission/rolePermission/createRolePermission', 'role-create', '3', '111211', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('335', '313', '修改', '/qp-permission/rolePermission/modifyRolePermission', 'role-modify', '3', '111212', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('336', '313', '删除', '/qp-permission/rolePermission/deleteRole', 'role-delete', '3', '111213', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('337', '314', '查询', '/qp-permission/log/queryLogList', 'operationLog-search', '3', '111310', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('338', '314', '详情', '/qp-permission/log/', 'operationLog', '3', '111311', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('339', '315', '查询', '/qp-member/member/list', 'playerList-search', '3', '121010', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('340', '315', '批量冻结', '/qp-member/member/freezeMember', 'playerList-freezeMember', '3', '121013', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('341', '315', '批量解冻', '/qp-member/member/thawMember', 'playerList-thawMember', '3', '121014', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('342', '315', '冻结', '/qp-member/member/freezeMember', 'playerList-freeze', '3', '121016', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('343', '315', '解冻', '/qp-member/member/thawMember', 'playerList-thaw', '3', '121018', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('344', '315', '详情', '/qp-member/member/selectAccountFlow', 'playerList-playerDetail', '3', '121019', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('345', '315', '玩家资金流水', '/playerManage/playerDetail', 'playerDetail-stream', '3', '121022', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('346', '315', '注单详情', '/qp-member/member/memberGameRecordDetails', 'playerDetail-detailbtn', '3', '121025', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('347', '315', '玩家游戏记录', '/playerManage/playerDetail', 'playerDetail-gameRecord', '3', '121027', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('348', '315', '玩家冻结记录', '/qp-member/member/freezeLog', 'playerDetail-frozenRecord', '3', '121028', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('349', '315', '玩家登录记录', '/qp-member/user/loginLogDetail', 'playerDetail-loginRecord', '3', '121029', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('350', '316', '查询', '/qp-member/member/gameRecord', 'gameRecord-search', '3', '121110', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('351', '316', '注单详情', '/qp-member/member/gameRecord/detail', 'gameRecord-detailbtn', '3', '121111', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('352', '317', '查询', '/qp-member/member/freezeLog/platform', 'platform-search', '3', '121410', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('353', '318', '日留存查询', '/qp-member/report/retain/day', 'keepTable-day', '3', '121610', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('354', '318', '月留存查询', '/qp-member/report/retain/month', 'keepTable-month', '3', '121612', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('355', '319', '日活报表查询', '/qp-member/report/active/day', 'dailyData-day', '3', '121810', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('356', '319', '终端日活报表查询', '/qp-member/report/active/device', 'dailyData-device', '3', '121811', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('357', '319', '日活报表详情', '', 'dailyData-info', '3', '121814', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('358', '319', '日活报表游戏详情', '/qp-member/report/gameDetail', 'dailyData-gameInfo', '3', '121816', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('359', '320', '查询', '/qp-game-setting/setting/querySettingPageByIds', 'querySettingPageByIdsbtn', '3', '141010', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('360', '320', '修改', '/qp-game-setting/order/saveGameOrder', 'gameManage-modification', '3', '141011', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('361', '320', '保存', '/qp-game-setting/order/saveGameOrder', 'gameManage-saveGameOrder', '3', '141012', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('362', '320', '同步', '/qp-game-setting/setting/readDataForGameService', 'gameManage-readDataForGameService', '3', '141013', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('363', '320', '停用', '/qp-game-setting/setting/setGameStatus', 'gameManage-blockUp', '3', '141013', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('364', '321', '查询', '/qp-behalf/userInfo/list', 'userInfossearch', '3', '141410', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('365', '321', '新增', '/qp-behalf/userInfo/saveBehalfUserInfo', 'saveBehalfUserInfobtn', '3', '141411', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('366', '321', '修改', '/qp-behalf/userInfo/updateBehalfUserInfo', 'updateBehalfUserInfobtn', '3', '141412', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('367', '321', '检测', '/qp-behalf/userInfo/validate', 'validate', '3', '141413\r\n', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('368', '322', '查询', '/qp-behalf/login/list', 'loginlistbtn', '3', '141810', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('369', '323', '查询', '/qp-behalf/gameRecord/list', 'gameRecord-searchbtn', '3', '141510', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('370', '323', '详情', '/playerManage/betDetails', 'gotodeatailbtn', '3', '141512', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('371', '324', '启用', '/qp-system-settings/backstageSetting/update', 'update', '3', '141513', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('372', '320', '预览', '/qp-game-setting/setting/getGameTypeList', 'gamesetting-previewBtn', '3', '151411', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('373', '325', '邮件查看权限', '/qp-system-settings/message/updateType', 'message-updateType', '3', '19110', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('374', '324', '查询', '/qp-system-settings/backstageSetting/queryList', 'backgroundSetting-search', '3', '191210', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('375', '324', '修改', '/qp-system-settings/backstageSetting/update', 'backgroundSetting-update', '3', '191212', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('376', '325', '游戏邮件查询', '/qp-system-settings/message/queryGameMsg', 'queryGameMsgbtn', '3', '191414', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('377', '325', '游戏邮件删除', '/qp-system-settings/message/delOne', 'queryGameMsgdelOnebtn', '3', '191416', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('378', '325', '游戏邮件一键删除已读邮件', '/qp-system-settings/message/delAll', 'queryGameMsgdelAllbtn', '3', '191418', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('379', '325', '公告邮件查询', '/qp-system-settings/message/queryCommonMsg', 'queryCommonMsgbtn', '3', '191415', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('380', '325', '公告邮件删除', '/qp-system-settings/message/delOne', 'queryCommonMsgdelOnebtn', '3', '191418', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('381', '325', '公告邮件一键删除已读邮件', '/qp-system-settings/message/delAll', 'queryCommonMsgdelAllOnebtn', '3', '191419', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('382', '326', '查询', '/qp-financial/subReport/querySumPlatReport', 'querySumPlatReport', '3', '171010', '1', '11111平台', '11111', 'admin', '1579681791', '0', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('383', '0', '财务管理', '/finance', 'finance', '1', '13', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('384', '383', '游戏盈亏', '/financeManage/gameprofitloss', 'gameprofitlossbtn', '2', '1316', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('385', '383', '玩家盈亏', '/financeManage/playerfitloss', 'playerfitlossbtn', '2', '1314', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('386', '383', '终端盈亏', '/financeManage/terminal', 'terminalbtn', '2', '1313', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('387', '385', '高级查询', '/qp-financial/report/queryPlayerProfitAndLoss', 'advancedsearchbtn', '3', '131411', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('388', '385', '查询', '/qp-financial/report/queryPlayerProfitAndLoss', 'playerfitlosssearchbtn', '3', '131410', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('389', '384', '查询', '/qp-financial/report/queryGameProfitAndLoss', 'queryGameProfitAndLossbtn', '3', '131610', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('390', '386', '查询', '/qp-financial/report/queryTerminalProfitAndLoss', 'queryTerminalProfitAndLossbtn', '3', '13385', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('391', '385', '详情', '', 'playerfitlossgodetailbtn', '3', '131412', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('392', '385', '玩家盈亏排行榜查询', '/qp-financial/report/queryPlayerRank', 'queryPlayerRankbtn', '3', '131413', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('393', '383', '平台盈亏', '/financeManage/platform', 'platformProfitAndLoss', '2', '1311', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('394', '383', '总控盈亏', '/financeManage/projectControlling', 'projectControlling', '2', '1310', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('395', '394', '查询', '/qp-financial/report/queryConsoleProfitAndLoss', 'profitAndLoss-searchBtn', '3', '131010', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('396', '393', '查询', '/qp-financial/report/queryPlatformProfitAndLoss', 'queryPlatform-searchBtn', '3', '131110', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('397', '383', '帐变流水', '/financeManage/accountChange', 'financeMangeAccountChange', '2', '1317', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('398', '383', '平台结算', '/financeManage/platformSettlement', 'platformSettlement', '2', '1318', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('399', '397', '高级查询', '', 'accountChange-advanceSearchBtn', '3', '131711', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('400', '397', '查询', '/qp-wallet/memberBalanceChange/list', 'fundsDeductList-search', '3', '131710', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('401', '394', '详情', '', 'platformProfit-detailsBtn', '3', '131011', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('402', '393', '详情', '', 'queryGame-detailsBtn', '3', '131111', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('403', '398', '查询', '/qp-financial/platSettle/list', 'platformSettlement-search', '3', '131810', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('404', '398', '审核', '/qp-financial/platSettle/audit', 'platformSettlement-audit', '3', '131813', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('405', '398', '查看', '/qp-financial/platSettle/check', 'settlement-checkBtn', '3', '131816', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('406', '398', '结算', '/qp-financial/platSettle/settlement', 'platformSettlement-btn', '3', '131814', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('407', '398', '结算方案查看', '/qp-merchant/settle/detail', 'settlement-lookBtn', '3', '131812', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('408', '383', '结算方案', '/financeManage/ptSettlement', 'ptSettlement', '2', '1315', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('409', '398', '驳回', '/qp-financial/platSettle/rejected', 'rejected', '3', '131814', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');
INSERT INTO `t_ps_module` (`id`, `parent_id`, `module_name`, `module_url`, `module_label`, `module_level`, `module_order`, `module_status`, `remark`, `merchant_alia`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('410', '398', '保存', '/qp-financial/platSettle/modifyAmount', 'modifyAmount', '3', '131818', '1', '11111平台', '11111', 'admin', '1579681791', 'admin', '1579681791');


#本次备份时间  2020年1月22日16:42:15

# 验证器初始化
INSERT INTO `t_validator_setting`
VALUES (1, 0, '总控', 'google验证器', 2, 0, 1, 0, 1576034798, 'admin', 1576034798, 'admin');
INSERT INTO `t_validator_setting`
VALUES (2, 0, '总控', '普通验证器', 1, 0, 0, 0, 1576034798, 'admin', 1576034798, 'admin');

# 系统LOGO,标题配置
INSERT INTO `t_backstage_setting_type`
VALUES (1, 1, 'LOGO');
INSERT INTO `t_backstage_setting_type`
VALUES (2, 2, '品牌名称');

# 风控配置
INSERT INTO `t_rs_config` (`id`, `risk_name`, `plat_net_profit_margin`, `plat_profit_control_param1`,
                           `plat_profit_control_param2`, `plat_low_limit_profit`, `plat_day_start_money`,
                           `plat_day_start_battle_number`, `player_exp_profit_margin`, `player_profit_control_param1`,
                           `player_profit_control_param2`, `player_day_start_money`, `player_day_start_battle_number`,
                           `player_lose_excep_val`, `player_exper_control_param1`, `player_exper_control_param2`,
                           `plat_profitLoss_weights`, `game_profitLoss_weights`, `player_profitLoss_weights`,
                           `player_exper_weights`, `rs_status`, `default_flag`, `create_by`, `create_time`, `update_by`,
                           `update_time`)
VALUES ('1', '通用风控设置', '0.05', '5.00', '15', '-1000000', '100000', '50', '-0.10', '1.00', '50', '50000', '10', '2.00',
        '2.00', '1.10', '30', '20', '10', '10', '1', '0', 'admin', '1576840560', '10000', '1577428484');

#结算方案
INSERT IGNORE INTO t_merchant_settle_cycle
VALUES (1, '月结', '自然月');
INSERT IGNORE INTO t_merchant_settle_cycle
VALUES (2, '季结', '（第一、二、三、四）季度');

#游戏列表
INSERT INTO `game_list`
VALUES (4, 101, '炸金花', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级房\",
      \"addBet\": \"[200,500,1000]\",
      \"baseScore\": 100,
      \"coinLimit\": 2000
    },
    {
      \"Id\": 2,
      \"Name\": \"中级房\",
      \"addBet\": \"[1000,5000,10000]\",
      \"baseScore\": 500,
      \"coinLimit\": 10000
    },
    {
      \"Id\": 3,
      \"Name\": \"高级房\",
      \"addBet\": \"[5000,10000,50000]\",
      \"baseScore\": 2000,
      \"coinLimit\": 40000
    },
    {
      \"Id\": 4,
      \"Name\": \"王者房\",
      \"addBet\": \"[10000,50000,100000]\",
      \"baseScore\": 5000,
      \"coinLimit\": 100000
    }
  ]
}');
INSERT INTO game_list
VALUES (5, 102, '二十一点', 1, 1, '{
  \"Rooms\":
  [
    {
      \"Id\": 1,
      \"Name\": \"初级房\",
      \"maxCoin\": 10000,
      \"minCoin\": 100,
      \"baseScore\": 100,
      \"coinLimit\": 1000
    },
    {
      \"Id\": 2,
      \"Name\": \"中级房\",
      \"maxCoin\": 50000,
      \"minCoin\": 500,
      \"baseScore\": 500,
      \"coinLimit\": 10000
    },
    {
      \"Id\": 3,
      \"Name\": \"高级房\",
      \"maxCoin\": 200000,
      \"minCoin\": 2000,
      \"baseScore\": 2000,
      \"coinLimit\": 50000
    },
    {
      \"Id\": 4,
      \"Name\": \"王者房\",
      \"maxCoin\": 500000,
      \"minCoin\": 5000,
      \"baseScore\": 5000,
      \"coinLimit\": 100000
    }
  ]
}');
INSERT INTO `game_list`
VALUES (6, 103, '推筒子', 1, 1, '{
  "Rooms": [
    {
      "Id": 1,
      "gameNo": "1",
      "Name": "初级房",
      "baseScore": "100",
      "coinLimit": "2000",
      "maxMult": "200",
      "revenuePerc": "5",
      "winPerc": "100"
    },
    {
      "Id": 2,
      "gameNo": "2",
      "Name": "中级房",
      "baseScore": "400",
      "coinLimit": "5000",
      "maxMult": "200",
      "revenuePerc": "5",
      "winPerc": "19"
    },
    {
      "Id": 3,
      "gameNo": "3",
      "Name": "高级房",
      "baseScore": "1000",
      "coinLimit": "12000",
      "maxMult": "200",
      "revenuePerc": "5",
      "winPerc": "18"
    },
    {
      "Id": 4,
      "gameNo": "4",
      "Name": "王者房",
      "baseScore": "3000",
      "coinLimit": "30000",
      "maxMult": "200",
      "revenuePerc": "5",
      "winPerc": "17"
    }
  ]
}');
INSERT INTO `game_list`
VALUES (7, 104, '渔童钓宝', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"10包1倍\",
      \"mult\": 1,
      \"state\": 1,
      \"bagNum\": 10,
      \"maxCoin\": 0,
      \"minCoin\": 1000,
      \"winPerc\": 20,
      \"bagMoneys\": \"[1000,2000,5000,6600,8000,10000,20000,30000]\",
      \"baseScore\": 0,
      \"channelId\": 1003,
      \"coinLimit\": 20000,
      \"maxPlayer\": 100,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 2,
      \"Name\": \"7包1.5倍\",
      \"mult\": 1.5,
      \"state\": 1,
      \"bagNum\": 7,
      \"maxCoin\": 0,
      \"minCoin\": 10000,
      \"winPerc\": 20,
      \"bagMoneys\": \"[1000,2000,5000,6600,8000,10000,20000,30000]\",
      \"baseScore\": 0,
      \"channelId\": 1003,
      \"coinLimit\": 20000,
      \"maxPlayer\": 100,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 3,
      \"Name\": \"5包2倍\",
      \"mult\": 2,
      \"state\": 1,
      \"bagNum\": 5,
      \"maxCoin\": 0,
      \"minCoin\": 50000,
      \"winPerc\": 20,
      \"bagMoneys\": \"[1000,2000,5000,6600,8000,10000,20000,30000]\",
      \"baseScore\": 0,
      \"channelId\": 1003,
      \"coinLimit\": 20000,
      \"maxPlayer\": 100,
      \"revenuePerc\": 5
    }
  ]
}');
INSERT INTO `game_list`
VALUES (8, 105, '抢红包', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"新手房\",
      \"mult\": 1,
      \"state\": 1,
      \"bagNum\": 10,
      \"gameNo\": 1,
      \"winPerc\": 20,
      \"bagMoneys\": \"[2000]\",
      \"baseScore\": 0,
      \"channelId\": 1003,
      \"coinLimit\": 6000,
      \"maxPlayer\": 100,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 2,
      \"Name\": \"初级房\",
      \"mult\": 1,
      \"state\": 1,
      \"bagNum\": 10,
      \"gameNo\": 2,
      \"winPerc\": 20,
      \"bagMoneys\": \"[10000]\",
      \"baseScore\": 0,
      \"channelId\": 1003,
      \"coinLimit\": 30000,
      \"maxPlayer\": 100,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 3,
      \"Name\": \"中级房\",
      \"mult\": 1,
      \"state\": 1,
      \"bagNum\": 10,
      \"gameNo\": 3,
      \"winPerc\": 20,
      \"bagMoneys\": \"[50000]\",
      \"baseScore\": 0,
      \"channelId\": 1003,
      \"coinLimit\": 150000,
      \"maxPlayer\": 100,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 4,
      \"Name\": \"高级房\",
      \"mult\": 1,
      \"state\": 1,
      \"bagNum\": 10,
      \"gameNo\": 4,
      \"winPerc\": 20,
      \"bagMoneys\": \"[250000]\",
      \"baseScore\": 0,
      \"channelId\": 1003,
      \"coinLimit\": 500000,
      \"maxPlayer\": 100,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 5,
      \"Name\": \"王者房\",
      \"mult\": 1,
      \"state\": 1,
      \"bagNum\": 10,
      \"gameNo\": 5,
      \"winPerc\": 20,
      \"bagMoneys\": \"[500000]\",
      \"baseScore\": 0,
      \"channelId\": 1003,
      \"coinLimit\": 1000000,
      \"maxPlayer\": 100,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 6,
      \"Name\": \"至尊房\",
      \"mult\": 1,
      \"state\": 1,
      \"bagNum\": 10,
      \"gameNo\": 6,
      \"winPerc\": 20,
      \"bagMoneys\": \"[1000000]\",
      \"baseScore\": 0,
      \"channelId\": 1003,
      \"coinLimit\": 2000000,
      \"maxPlayer\": 100,
      \"revenuePerc\": 5
    }
  ]
}');
INSERT INTO `game_list`
VALUES (9, 106, '红黑大战', 1, 1, '{
  "Rooms": [
    {
      "Id": 1,
      "bet": "[100,500,1000,5000,10000]",
      "Name": "初级房",
      "mult": "[195,195,1000,500,300,200,100]",
      "GameNo": "1",
      "maxLimit": "10000",
      "minLimit": "100",
      "nickName": "C",
      "coinLimit": "200",
      "revenuePerc": "0",
      "luckyMaxLimit": "10000",
      "luckyMinLimit": "100"
    },
    {
      "Id": 2,
      "bet": "[500,1000,5000,10000,50000]",
      "Name": "中级房",
      "mult": "[195,195,1000,500,300,200,100]",
      "GameNo": "2",
      "maxLimit": "100000",
      "minLimit": "500",
      "nickName": "Z",
      "coinLimit": "2000",
      "revenuePerc": "0",
      "luckyMaxLimit": "20000",
      "luckyMinLimit": "500"
    },
    {
      "Id": 3,
      "bet": "[1000,5000,10000,50000,100000]",
      "Name": "高级房",
      "mult": "[195,195,1000,500,300,200,100]",
      "GameNo": "3",
      "maxLimit": "500000",
      "minLimit": "1000",
      "nickName": "G",
      "coinLimit": "20000",
      "revenuePerc": "0",
      "luckyMaxLimit": "100000",
      "luckyMinLimit": "1000"
    },
    {
      "Id": 4,
      "bet": "[10000,50000,100000,500000,1000000]",
      "Name": "王者房",
      "mult": "[195,195,1000,500,300,200,100]",
      "GameNo": "4",
      "maxLimit": "2000000",
      "minLimit": "10000",
      "nickName": "W",
      "coinLimit": "50000",
      "revenuePerc": "0",
      "luckyMaxLimit": "200000",
      "luckyMinLimit": "10000"
    }
  ]
}');
INSERT INTO `game_list`
VALUES (10, 107, '百家乐', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级房\",
      \"minCoin\": 100,
      \"baseScore\": 0,
      \"coinLimit\": 5000
    },
    {
      \"Id\": 2,
      \"Name\": \"中级房\",
      \"minCoin\": 500,
      \"baseScore\": 0,
      \"coinLimit\": 10000
    },
    {
      \"Id\": 3,
      \"Name\": \"高级房\",
      \"minCoin\": 1000,
      \"baseScore\": 0,
      \"coinLimit\": 50000
    },
    {
      \"Id\": 4,
      \"Name\": \"王者房\",
      \"minCoin\": 5000,
      \"baseScore\": 0,
      \"coinLimit\": 200000
    }
  ]
}');
INSERT INTO `game_list`
VALUES (11, 108, '单人百家乐', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"标准场\",
      \"minCoin\": 100,
      \"baseScore\": 0,
      \"coinLimit\": 100
    }
  ]
}');
INSERT INTO `game_list`
VALUES (12, 109, '德州扑克', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级房\",
      \"maxCoin\": 20000,
      \"minCoin\": 1000,
      \"baseScore\": 0,
      \"coinLimit\": 1000,
      \"smallBlind\": 50,
      \"defaultTableCoin\": 10000
    },
    {
      \"Id\": 2,
      \"Name\": \"中级房\",
      \"maxCoin\": 80000,
      \"minCoin\": 4000,
      \"baseScore\": 0,
      \"coinLimit\": 4000,
      \"smallBlind\": 200,
      \"defaultTableCoin\": 40000
    },
    {
      \"Id\": 3,
      \"Name\": \"高级房\",
      \"maxCoin\": 160000,
      \"minCoin\": 8000,
      \"baseScore\": 0,
      \"coinLimit\": 8000,
      \"smallBlind\": 400,
      \"defaultTableCoin\": 80000
    },
    {
      \"Id\": 4,
      \"Name\": \"至尊房\",
      \"maxCoin\": 400000,
      \"minCoin\": 20000,
      \"baseScore\": 0,
      \"coinLimit\": 20000,
      \"smallBlind\": 1000,
      \"defaultTableCoin\": 200000
    }
  ]
}');
INSERT INTO `game_list`
VALUES (13, 110, '抢庄牛牛', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级场\",
      \"state\": 1,
      \"gameNo\": 1,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"winPerc\": 50,
      \"baseScore\": 100,
      \"channelId\": 1003,
      \"coinLimit\": 1000,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 4
    },
    {
      \"Id\": 2,
      \"Name\": \"中级场\",
      \"state\": 1,
      \"gameNo\": 2,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"winPerc\": 19,
      \"baseScore\": 500,
      \"channelId\": 1003,
      \"coinLimit\": 5000,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 4
    },
    {
      \"Id\": 3,
      \"Name\": \"高级场\",
      \"state\": 1,
      \"gameNo\": 3,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"winPerc\": 100,
      \"baseScore\": 1000,
      \"channelId\": 1003,
      \"coinLimit\": 10000,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 4
    },
    {
      \"Id\": 4,
      \"Name\": \"顶级房\",
      \"state\": 1,
      \"gameNo\": 4,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"winPerc\": 100,
      \"baseScore\": 3000,
      \"channelId\": 1003,
      \"coinLimit\": 30000,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 4
    }
  ]
}');
INSERT INTO `game_list`
VALUES (14, 111, '看四张抢庄牛牛', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级场\",
      \"state\": 1,
      \"gameNo\": 1,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"winPerc\": 50,
      \"baseScore\": 100,
      \"channelId\": 1003,
      \"coinLimit\": 1000,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 4
    },
    {
      \"Id\": 2,
      \"Name\": \"中级场\",
      \"state\": 1,
      \"gameNo\": 2,
      \"maxCoin\": 500,
      \"minCoin\": 1,
      \"winPerc\": 19,
      \"baseScore\": 500,
      \"channelId\": 1003,
      \"coinLimit\": 5000,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 4
    },
    {
      \"Id\": 3,
      \"Name\": \"高级场\",
      \"state\": 1,
      \"gameNo\": 3,
      \"maxCoin\": 500,
      \"minCoin\": 1,
      \"winPerc\": 100,
      \"baseScore\": 1000,
      \"channelId\": 1003,
      \"coinLimit\": 10000,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 4
    },
    {
      \"Id\": 4,
      \"Name\": \"顶级房\",
      \"state\": 1,
      \"gameNo\": 4,
      \"maxCoin\": 500,
      \"minCoin\": 1,
      \"winPerc\": 100,
      \"baseScore\": 3000,
      \"channelId\": 1003,
      \"coinLimit\": 30000,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 4
    }
  ]
}');
INSERT INTO `game_list`
VALUES (15, 112, '十三水', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级房\",
      \"maxCoin\": 3500,
      \"minCoin\": 100,
      \"baseScore\": 100,
      \"coinLimit\": 2000
    },
    {
      \"Id\": 2,
      \"Name\": \"中级房\",
      \"maxCoin\": 3500,
      \"minCoin\": 500,
      \"baseScore\": 500,
      \"coinLimit\": 6000
    },
    {
      \"Id\": 3,
      \"Name\": \"高级房\",
      \"maxCoin\": 3500,
      \"minCoin\": 2000,
      \"baseScore\": 2000,
      \"coinLimit\": 24000
    },
    {
      \"Id\": 4,
      \"Name\": \"至尊房\",
      \"maxCoin\": 3500,
      \"minCoin\": 5000,
      \"baseScore\": 5000,
      \"coinLimit\": 60000
    }
  ]
}');
INSERT INTO `game_list`
VALUES (16, 113, '抢庄牌九', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"新手房\",
      \"state\": 1,
      \"gameNo\": 1,
      \"maxMult\": 200,
      \"winPerc\": 100,
      \"baseScore\": 100,
      \"channelId\": 1003,
      \"coinLimit\": 400,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 2,
      \"Name\": \"初级房\",
      \"state\": 1,
      \"gameNo\": 2,
      \"maxMult\": 200,
      \"winPerc\": 19,
      \"baseScore\": 500,
      \"channelId\": 1003,
      \"coinLimit\": 2000,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 3,
      \"Name\": \"中级房\",
      \"state\": 1,
      \"gameNo\": 3,
      \"maxMult\": 200,
      \"winPerc\": 18,
      \"baseScore\": 1000,
      \"channelId\": 1003,
      \"coinLimit\": 4000,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 4,
      \"Name\": \"高级房\",
      \"state\": 1,
      \"gameNo\": 4,
      \"maxMult\": 200,
      \"winPerc\": 17,
      \"baseScore\": 3000,
      \"channelId\": 1003,
      \"coinLimit\": 12000,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 5,
      \"Name\": \"王者房\",
      \"state\": 1,
      \"gameNo\": 5,
      \"maxMult\": 200,
      \"winPerc\": 17,
      \"baseScore\": 10000,
      \"channelId\": 1003,
      \"coinLimit\": 40000,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 6,
      \"Name\": \"至尊房\",
      \"state\": 1,
      \"gameNo\": 6,
      \"maxMult\": 200,
      \"winPerc\": 17,
      \"baseScore\": 30000,
      \"channelId\": 1003,
      \"coinLimit\": 120000,
      \"revenuePerc\": 5
    }
  ]
}');
INSERT INTO `game_list`
VALUES (17, 114, '龙虎斗', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级房\",
      \"state\": 1,
      \"gameNo\": 1,
      \"maxMult\": 200,
      \"winPerc\": 100,
      \"baseScore\": 1,
      \"channelId\": 1003,
      \"coinLimit\": 3,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 2,
      \"Name\": \"中级房\",
      \"state\": 1,
      \"gameNo\": 2,
      \"maxMult\": 200,
      \"winPerc\": 19,
      \"baseScore\": 5,
      \"channelId\": 1003,
      \"coinLimit\": 15,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 3,
      \"Name\": \"高级房\",
      \"state\": 1,
      \"gameNo\": 3,
      \"maxMult\": 200,
      \"winPerc\": 18,
      \"baseScore\": 20,
      \"channelId\": 1003,
      \"coinLimit\": 60,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 4,
      \"Name\": \"王者房\",
      \"state\": 1,
      \"gameNo\": 4,
      \"maxMult\": 200,
      \"winPerc\": 17,
      \"baseScore\": 50,
      \"channelId\": 1003,
      \"coinLimit\": 150,
      \"revenuePerc\": 5
    }
  ]
}');
INSERT INTO `game_list`
VALUES (18, 115, '万人牛牛', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级房\",
      \"minCoin\": 100,
      \"baseScore\": 0,
      \"coinLimit\": 2000
    },
    {
      \"Id\": 2,
      \"Name\": \"中级房\",
      \"minCoin\": 500,
      \"baseScore\": 0,
      \"coinLimit\": 2000
    },
    {
      \"Id\": 3,
      \"Name\": \"高级房\",
      \"minCoin\": 1000,
      \"baseScore\": 0,
      \"coinLimit\": 2000
    },
    {
      \"Id\": 4,
      \"Name\": \"王者房\",
      \"minCoin\": 5000,
      \"baseScore\": 0,
      \"coinLimit\": 2000
    }
  ]
}');
INSERT INTO `game_list`
VALUES (19, 116, '跑得快', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级房\",
      \"state\": 1,
      \"gameNo\": 1,
      \"maxCoin\": 5,
      \"minCoin\": 1,
      \"winPerc\": 19,
      \"baseScore\": 10,
      \"channelId\": 1003,
      \"coinLimit\": 2000,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 4
    },
    {
      \"Id\": 2,
      \"Name\": \"中级房\",
      \"state\": 1,
      \"gameNo\": 2,
      \"maxCoin\": 5,
      \"minCoin\": 1,
      \"winPerc\": 19,
      \"baseScore\": 20,
      \"channelId\": 1003,
      \"coinLimit\": 5000,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 4
    },
    {
      \"Id\": 3,
      \"Name\": \"高级房\",
      \"state\": 1,
      \"gameNo\": 3,
      \"maxCoin\": 5,
      \"minCoin\": 1,
      \"winPerc\": 100,
      \"baseScore\": 50,
      \"channelId\": 1003,
      \"coinLimit\": 10000,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 4
    },
    {
      \"Id\": 4,
      \"Name\": \"王者房\",
      \"state\": 1,
      \"gameNo\": 4,
      \"maxCoin\": 5,
      \"minCoin\": 1,
      \"winPerc\": 100,
      \"baseScore\": 100,
      \"channelId\": 1003,
      \"coinLimit\": 20000,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 4
    }
  ]
}');
INSERT INTO `game_list`
VALUES (20, 117, '斗地主', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级房\",
      \"baseScore\": 10,
      \"coinLimit\": 2000
    },
    {
      \"Id\": 2,
      \"Name\": \"中级房\",
      \"baseScore\": 20,
      \"coinLimit\": 5000
    },
    {
      \"Id\": 3,
      \"Name\": \"高级房\",
      \"baseScore\": 50,
      \"coinLimit\": 10000
    },
    {
      \"Id\": 4,
      \"Name\": \"至尊房\",
      \"baseScore\": 100,
      \"coinLimit\": 20000
    }
  ]
}');
INSERT INTO `game_list`
VALUES (21, 118, '万人骰宝', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级房\",
      \"minCoin\": 100,
      \"baseScore\": 0,
      \"coinLimit\": 500
    },
    {
      \"Id\": 2,
      \"Name\": \"中级房\",
      \"minCoin\": 500,
      \"baseScore\": 0,
      \"coinLimit\": 5000
    },
    {
      \"Id\": 3,
      \"Name\": \"高级房\",
      \"minCoin\": 1000,
      \"baseScore\": 0,
      \"coinLimit\": 10000
    },
    {
      \"Id\": 4,
      \"Name\": \"至尊房\",
      \"minCoin\": 5000,
      \"baseScore\": 0,
      \"coinLimit\": 20000
    }
  ]
}');
INSERT INTO `game_list`
VALUES (22, 119, '三公', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"新手房\",
      \"state\": 1,
      \"gameNo\": 1,
      \"winPerc\": 5,
      \"baseScore\": 100,
      \"channelId\": 1003,
      \"coinLimit\": 800,
      \"maxBetMult\": 35,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 1
    },
    {
      \"Id\": 2,
      \"Name\": \"初级房\",
      \"state\": 1,
      \"gameNo\": 2,
      \"winPerc\": 5,
      \"baseScore\": 300,
      \"channelId\": 1003,
      \"coinLimit\": 2400,
      \"maxBetMult\": 35,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 1
    },
    {
      \"Id\": 3,
      \"Name\": \"中级房\",
      \"state\": 1,
      \"gameNo\": 3,
      \"winPerc\": 5,
      \"baseScore\": 1000,
      \"channelId\": 1003,
      \"coinLimit\": 8000,
      \"maxBetMult\": 35,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 1
    },
    {
      \"Id\": 4,
      \"Name\": \"高级房\",
      \"state\": 1,
      \"gameNo\": 4,
      \"winPerc\": 5,
      \"baseScore\": 3000,
      \"channelId\": 1003,
      \"coinLimit\": 24000,
      \"maxBetMult\": 35,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 1
    },
    {
      \"Id\": 5,
      \"Name\": \"王者房\",
      \"state\": 1,
      \"gameNo\": 5,
      \"winPerc\": 5,
      \"baseScore\": 10000,
      \"channelId\": 1003,
      \"coinLimit\": 80000,
      \"maxBetMult\": 35,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 1
    },
    {
      \"Id\": 6,
      \"Name\": \"至尊房\",
      \"state\": 1,
      \"gameNo\": 6,
      \"winPerc\": 5,
      \"baseScore\": 30000,
      \"channelId\": 1003,
      \"coinLimit\": 240000,
      \"maxBetMult\": 35,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 1
    }
  ]
}');
INSERT INTO `game_list`
VALUES (23, 120, '梭哈', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级房\",
      \"state\": 1,
      \"gameNo\": 1,
      \"maxMult\": 20000,
      \"midCoin\": 10000,
      \"winPerc\": 19,
      \"baseScore\": 100,
      \"coinLimit\": 1000,
      \"revenuePerc\": 5,
      \"maxCoinLimit\": 20000,
      \"minCoinLimit\": 10
    },
    {
      \"Id\": 2,
      \"Name\": \"中级房\",
      \"state\": 1,
      \"gameNo\": 2,
      \"maxMult\": 100000,
      \"midCoin\": 50000,
      \"winPerc\": 19,
      \"baseScore\": 500,
      \"coinLimit\": 5000,
      \"revenuePerc\": 5,
      \"maxCoinLimit\": 100000,
      \"minCoinLimit\": 5000
    },
    {
      \"Id\": 3,
      \"Name\": \"高级房\",
      \"state\": 1,
      \"gameNo\": 3,
      \"maxMult\": 200000,
      \"midCoin\": 100000,
      \"winPerc\": 18,
      \"baseScore\": 1000,
      \"coinLimit\": 10000,
      \"revenuePerc\": 5,
      \"maxCoinLimit\": 200000,
      \"minCoinLimit\": 10000
    },
    {
      \"Id\": 4,
      \"Name\": \"至尊房\",
      \"state\": 1,
      \"gameNo\": 4,
      \"maxMult\": 400000,
      \"midCoin\": 200000,
      \"winPerc\": 17,
      \"baseScore\": 2000,
      \"coinLimit\": 20000,
      \"revenuePerc\": 5,
      \"maxCoinLimit\": 400000,
      \"minCoinLimit\": 20000
    }
  ]
}');
INSERT INTO `game_list`
VALUES (24, 121, '通比牛牛', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"新手房\",
      \"state\": 1,
      \"gameNo\": 1,
      \"betTime\": 15,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"winPerc\": 50,
      \"showTime\": 6,
      \"baseScore\": 100,
      \"channelId\": 1003,
      \"coinLimit\": 600,
      \"matchTime\": 1,
      \"maxBetMult\": 5,
      \"settleTime\": 180,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 2,
      \"Name\": \"初级房\",
      \"state\": 1,
      \"gameNo\": 2,
      \"betTime\": 15,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"winPerc\": 19,
      \"showTime\": 6,
      \"baseScore\": 400,
      \"channelId\": 1003,
      \"coinLimit\": 2400,
      \"matchTime\": 1,
      \"maxBetMult\": 5,
      \"settleTime\": 180,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 3,
      \"Name\": \"中级房\",
      \"state\": 1,
      \"gameNo\": 3,
      \"betTime\": 15,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"winPerc\": 100,
      \"showTime\": 6,
      \"baseScore\": 1000,
      \"channelId\": 1003,
      \"coinLimit\": 6000,
      \"matchTime\": 1,
      \"maxBetMult\": 5,
      \"settleTime\": 180,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 4,
      \"Name\": \"高级房\",
      \"state\": 1,
      \"gameNo\": 4,
      \"betTime\": 15,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"winPerc\": 100,
      \"showTime\": 6,
      \"baseScore\": 3000,
      \"channelId\": 1003,
      \"coinLimit\": 18000,
      \"matchTime\": 1,
      \"maxBetMult\": 5,
      \"settleTime\": 180,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 5,
      \"Name\": \"王者房\",
      \"state\": 1,
      \"gameNo\": 5,
      \"betTime\": 15,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"winPerc\": 100,
      \"showTime\": 6,
      \"baseScore\": 10000,
      \"channelId\": 1003,
      \"coinLimit\": 60000,
      \"matchTime\": 1,
      \"maxBetMult\": 5,
      \"settleTime\": 180,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 6,
      \"Name\": \"至尊房\",
      \"state\": 1,
      \"gameNo\": 6,
      \"betTime\": 15,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"winPerc\": 100,
      \"showTime\": 6,
      \"baseScore\": 30000,
      \"channelId\": 1003,
      \"coinLimit\": 180000,
      \"matchTime\": 1,
      \"maxBetMult\": 5,
      \"settleTime\": 180,
      \"revenuePerc\": 5
    }
  ]
}');
INSERT INTO `game_list`
VALUES (25, 122, '二人麻将', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"新手房\",
      \"gameNo\": 1,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"baseScore\": 100,
      \"coinLimit\": 1500,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 2,
      \"Name\": \"初级房\",
      \"gameNo\": 2,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"baseScore\": 200,
      \"coinLimit\": 3000,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 3,
      \"Name\": \"中级房\",
      \"gameNo\": 3,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"baseScore\": 1000,
      \"coinLimit\": 20000,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 4,
      \"Name\": \"高级房\",
      \"gameNo\": 4,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"baseScore\": 5000,
      \"coinLimit\": 100000,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 5,
      \"Name\": \"王者房\",
      \"gameNo\": 5,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"baseScore\": 20000,
      \"coinLimit\": 400000,
      \"revenuePerc\": 5
    },
    {
      \"Id\": 6,
      \"Name\": \"至尊房\",
      \"gameNo\": 6,
      \"maxCoin\": 500,
      \"minCoin\": 100,
      \"baseScore\": 50000,
      \"coinLimit\": 1200000,
      \"revenuePerc\": 5
    }
  ]
}');
INSERT INTO `game_list`
VALUES (27, 123, '极速炸金花', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级房\",
      \"addBet\": \"[100]\",
      \"baseScore\": 100,
      \"coinLimit\": 2000
    },
    {
      \"Id\": 2,
      \"Name\": \"中级房\",
      \"addBet\": \"[500]\",
      \"baseScore\": 500,
      \"coinLimit\": 10000
    },
    {
      \"Id\": 3,
      \"Name\": \"高级房\",
      \"addBet\": \"[2000]\",
      \"baseScore\": 2000,
      \"coinLimit\": 40000
    },
    {
      \"Id\": 4,
      \"Name\": \"王者房\",
      \"addBet\": \"[5000]\",
      \"baseScore\": 5000,
      \"coinLimit\": 100000
    }
  ]
}');
INSERT INTO `game_list`
VALUES (28, 124, '万人推筒子', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"初级房\",
      \"minCoin\": 100,
      \"baseScore\": 0,
      \"coinLimit\": 100
    },
    {
      \"Id\": 2,
      \"Name\": \"中级房\",
      \"minCoin\": 1000,
      \"baseScore\": 0,
      \"coinLimit\": 1000
    },
    {
      \"Id\": 3,
      \"Name\": \"高级房\",
      \"minCoin\": 5000,
      \"baseScore\": 0,
      \"coinLimit\": 5000
    },
    {
      \"Id\": 4,
      \"Name\": \"至尊房\",
      \"minCoin\": 20000,
      \"baseScore\": 0,
      \"coinLimit\": 20000
    }
  ]
}');
INSERT INTO `game_list`
VALUES (30, 125, '二人广东麻将', 1, 1, '{
  \"Rooms\": [
    {
      \"Id\": 1,
      \"Name\": \"新手房\",
      \"state\": 1,
      \"gameNo\": 1,
      \"winPerc\": 5,
      \"baseScore\": 10,
      \"channelId\": 1003,
      \"coinLimit\": 5000,
      \"maxBetMult\": 35,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 1
    },
    {
      \"Id\": 2,
      \"Name\": \"初级房\",
      \"state\": 1,
      \"gameNo\": 2,
      \"winPerc\": 5,
      \"baseScore\": 50,
      \"channelId\": 1003,
      \"coinLimit\": 10000,
      \"maxBetMult\": 35,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 1
    },
    {
      \"Id\": 3,
      \"Name\": \"中级房\",
      \"state\": 1,
      \"gameNo\": 3,
      \"winPerc\": 5,
      \"baseScore\": 100,
      \"channelId\": 1003,
      \"coinLimit\": 30000,
      \"maxBetMult\": 35,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 1
    },
    {
      \"Id\": 4,
      \"Name\": \"高级房\",
      \"state\": 1,
      \"gameNo\": 4,
      \"winPerc\": 5,
      \"baseScore\": 200,
      \"channelId\": 1003,
      \"coinLimit\": 100000,
      \"maxBetMult\": 35,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 1
    },
    {
      \"Id\": 5,
      \"Name\": \"王者房\",
      \"state\": 1,
      \"gameNo\": 5,
      \"winPerc\": 5,
      \"baseScore\": 500,
      \"channelId\": 1003,
      \"coinLimit\": 200000,
      \"maxBetMult\": 35,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 1
    },
    {
      \"Id\": 6,
      \"Name\": \"至尊房\",
      \"state\": 1,
      \"gameNo\": 6,
      \"winPerc\": 5,
      \"baseScore\": 1000,
      \"channelId\": 1003,
      \"coinLimit\": 500000,
      \"maxBetMult\": 35,
      \"revenuePerc\": 5,
      \"maxQiangMult\": 1
    }
  ]
}');

# 系统参数
insert into t_system_param(param_name, param_value)
values ('state', '0');

# 初始化游戏房间
INSERT INTO `game_config_101`
VALUES (1, 1, '初级房', 100, 2000, '[200,500,1000]', 15, 10000, 5, 10);
INSERT INTO `game_config_101`
VALUES (2, 2, '中级房', 500, 10000, '[1000,5000,10000]', 15, 10000, 5, 18);
INSERT INTO `game_config_101`
VALUES (3, 3, '高级房', 2000, 40000, '[5000,10000,50000]', 15, 10000, 5, 17);
INSERT INTO `game_config_101`
VALUES (4, 4, '王者房', 5000, 100000, '[10000,50000,100000]', 15, 10000, 5, 15);

INSERT INTO `game_config_102`
VALUES (1, 1, '初级房', 100, 1000, 10000, 5, 90);
INSERT INTO `game_config_102`
VALUES (2, 2, '中级房', 500,10000,50000, 5, 50);
INSERT INTO `game_config_102`
VALUES (3, 3, '高级房', 2000,50000,200000, 5, 50);
INSERT INTO `game_config_102`
VALUES (4, 4, '王者房', 5000,100000,500000 , 5, 50);

INSERT INTO `game_config_103` VALUES (1, 1, '初级房', 100, 2000, 200, 5, 100);
INSERT INTO `game_config_103` VALUES (2, 2, '中级房', 400, 5000, 200, 5, 19);
INSERT INTO `game_config_103` VALUES (3, 3, '高级房', 1000, 12000, 200, 5, 18);
INSERT INTO `game_config_103` VALUES (4, 4, '王者房', 3000, 30000, 200, 5, 17);

INSERT INTO `game_config_104`
VALUES (1, 1, '10包1倍', 1.00, 10, '[1000,2000,5000,6600,8800,10000,20000,30000]', 30, 5, 20, 20000);
INSERT INTO `game_config_104`
VALUES (2, 2, '7包1.5倍', 1.50, 7, '[1000,2000,5000,6600,8800,10000,20000,30000]', 25, 5, 20, 20000);
INSERT INTO `game_config_104`
VALUES (3, 3, '5包2倍', 2.00, 5, '[1000,2000,5000,6600,8800,10000,20000,30000]', 20, 5, 20, 20000);

INSERT INTO `game_config_105`
VALUES (1, 1, '新手房', 1, 10, '[2000]', 100, 5, 20, 6000);
INSERT INTO `game_config_105`
VALUES (2, 2, '初级房', 1, 10, '[10000]', 100, 5, 20, 30000);
INSERT INTO `game_config_105`
VALUES (3, 3, '中级房', 1, 10, '[50000]', 100, 5, 20, 150000);
INSERT INTO `game_config_105`
VALUES (4, 4, '高级房', 1, 10, '[250000]', 100, 5, 20, 500000);
INSERT INTO `game_config_105`
VALUES (5, 5, '王者房', 1, 10, '[500000]', 100, 5, 20, 1000000);
INSERT INTO `game_config_105`
VALUES (6, 6, '至尊房', 1, 10, '[1000000]', 100, 5, 20, 2000000);

INSERT INTO `game_config_106` VALUES (1, 1, '初级房', 'C', 100, 10000, '[100,500,1000,5000,10000]', '[195,195,1000,500,300,200,100]', 0, 200, 10000, 100);
INSERT INTO `game_config_106` VALUES (2, 2, '中级房', 'Z', 500, 100000, '[500,1000,5000,10000,50000]', '[195,195,1000,500,300,200,100]', 0, 2000, 20000, 500);
INSERT INTO `game_config_106` VALUES (3, 3, '高级房', 'G', 1000, 500000, '[1000,5000,10000,50000,100000]', '[195,195,1000,500,300,200,100]', 0, 20000, 100000, 1000);
INSERT INTO `game_config_106` VALUES (4, 4, '王者房', 'W', 10000, 2000000, '[10000,50000,100000,500000,1000000]', '[195,195,1000,500,300,200,100]', 0, 50000, 200000, 10000);

INSERT INTO `game_config_107`
VALUES (1, 1, '初级房', 5000, '[50000,50000,10000,10000,10000]', '[100,500,1000,5000,10000]', '[2,1.95,9,12,12]', 0, 50, 100);
INSERT INTO `game_config_107`
VALUES (2, 2, '中级房', 10000, '[250000,250000,50000,50000,50000]', '[500,1000,5000,10000,50000]', '[2,1.95,9,12,12]', 0, 50,
        500);
INSERT INTO `game_config_107`
VALUES (3, 3, '高级房', 50000, '[500000,500000,100000,100000,100000]', '[1000,5000,10000,50000,100000]', '[2,1.95,9,12,12]',
        0, 50, 1000);
INSERT INTO `game_config_107`
VALUES (4, 4, '王者房', 200000, '[2000000,2000000,500000,200000,200000]', '[5000,10000,50000,100000,500000]',
        '[2,1.95,9,12,12]', 0, 50, 5000);

INSERT INTO `game_config_108`
VALUES (1, 1, '初级房', 100, '[100000,100000,25000,10000,10000]', '[100,1000,5000,10000,50000]', '[2,1.95,9,12,12]', 0, 50,
        100);

INSERT INTO `game_config_109`
VALUES (1, 1, '初级房', 800, 4, 7, 1000, 5, 50, '[5,5,5,5,5,5]', 1000, 20000);
INSERT INTO `game_config_109`
VALUES (2, 2, '中级房', 800, 4, 7, 4000, 5, 200, '[5,5,5,5,5,5]', 4000, 80000);
INSERT INTO `game_config_109`
VALUES (3, 3, '高级房', 800, 4, 7, 8000, 5, 400, '[5,5,5,5,5,5]', 8000, 160000);
INSERT INTO `game_config_109`
VALUES (4, 4, '至尊房', 800, 4, 7, 20000, 5, 1000, '[5,5,5,5,5,5]', 20000, 400000);

INSERT INTO `game_config_110`
VALUES (1, 1, '初级房', 100, 1000, 4, 5, 5, 50);
INSERT INTO `game_config_110`
VALUES (2, 2, '中级房', 500, 5000, 4, 5, 5, 19);
INSERT INTO `game_config_110`
VALUES (3, 3, '高级房', 1000, 10000, 4, 5, 5, 100);
INSERT INTO `game_config_110`
VALUES (4, 4, '王者房', 3000, 30000, 4, 5, 5, 100);

INSERT INTO `game_config_111`
VALUES (1, 1, '初级房', 100, 1000, 3, 5, 5, 100);
INSERT INTO `game_config_111`
VALUES (2, 2, '中级房', 500, 5000, 3, 5, 5, 19);
INSERT INTO `game_config_111`
VALUES (3, 3, '高级房', 1000, 10000, 3, 5, 5, 18);
INSERT INTO `game_config_111`
VALUES (4, 4, '王者房', 3000, 30000, 3, 5, 5, 17);

INSERT INTO `game_config_112`
VALUES (1, 1, '初级房', 100, 2000, 1, 35, 5, 0);
INSERT INTO `game_config_112`
VALUES (2, 2, '中级房', 500, 6000, 1, 35, 5, 50);
INSERT INTO `game_config_112`
VALUES (3, 3, '高级房', 2000, 24000, 1, 35, 5, 50);
INSERT INTO `game_config_112`
VALUES (4, 4, '至尊房', 5000, 60000, 1, 35, 5, 50);

INSERT INTO `game_config_113`
VALUES (1, 1, '新手房', 100, 400, 30, 5, 80);
INSERT INTO `game_config_113`
VALUES (2, 2, '初级房', 500, 2000, 30, 5, 80);
INSERT INTO `game_config_113`
VALUES (3, 3, '中级房', 1000, 4000, 30, 5, 80);
INSERT INTO `game_config_113`
VALUES (4, 4, '高级房', 3000, 12000, 30, 5, 80);
INSERT INTO `game_config_113`
VALUES (5, 5, '王者房', 10000, 40000, 30, 5, 80);
INSERT INTO `game_config_113`
VALUES (6, 6, '至尊房', 30000, 120000, 30, 5, 80);

INSERT INTO `game_config_114`
VALUES (1, 1, '初级房', 100, 10000, '[100,500,1000,5000,10000]', '[2,2,20]', 0.00, 1, 0, '[10000,10000,10000]', 1, 0, 200);
INSERT INTO `game_config_114`
VALUES (2, 2, '中级房', 500, 100000, '[500,1000,5000,10000,50000]', '[2,2,20]', 0.00, 1, 0, '[100000,100000,20000]', 1, 1,
        2000);
INSERT INTO `game_config_114`
VALUES (3, 3, '高级房', 1000, 500000, '[1000,5000,10000,50000,100000]', '[2,2,20]', 0.00, 1, 0,
        '[500000,500000,50000]', 1, 2, 20000);
INSERT INTO `game_config_114`
VALUES (4, 4, '王者房', 10000, 2000000, '[10000,50000,100000,500000,1000000]', '[2,2,20]', 0.00, 1, 0,
        '[2000000,2000000,100000]', 1, 3, 50000);

INSERT INTO `game_config_115`
VALUES (1, 1, '初级房', 5, 51, '[100,500,1000,5000,10000]', 600, 100, 20000, 1000000, 5, 100, 15, 5);
INSERT INTO `game_config_115`
VALUES (2, 2, '中级房', 5, 51, '[500,1000,5000,10000,50000]', 3000, 500, 100000, 2000000, 5, 100, 15, 5);
INSERT INTO `game_config_115`
VALUES (3, 3, '高级房', 5, 51, '[1000,5000,10000,50000,100000]', 15000, 1000, 300000, 3000000, 5, 100, 15, 5);
INSERT INTO `game_config_115`
VALUES (4, 4, '王者房', 5, 51, '[10000,50000,100000,500000,1000000]', 60000, 10000, 1000000, 5000000, 5, 100, 15, 5);

INSERT INTO `game_config_116`
VALUES (1, 1, '初级房', 10, 2000, 5, 50);
INSERT INTO `game_config_116`
VALUES (2, 2, '中级房', 20, 5000, 5, 50);
INSERT INTO `game_config_116`
VALUES (3, 3, '高级房', 50, 10000, 5, 50);
INSERT INTO `game_config_116`
VALUES (4, 4, '王者房', 100, 20000, 5, 50);

INSERT INTO `game_config_117`
VALUES (1, 1, '初级房', 5, 50, 10, 2000, 8);
INSERT INTO `game_config_117`
VALUES (2, 2, '中级房', 5, 50, 20, 5000, 8);
INSERT INTO `game_config_117`
VALUES (3, 3, '高级房', 5, 50, 50, 10000, 8);
INSERT INTO `game_config_117`
VALUES (4, 4, '至尊房', 5, 50, 100, 20000, 8);

INSERT INTO `game_config_118`
VALUES (1, 1, '初级房', 500, 50000, '[100,500,1000,5000,10000]',
        '[1,1,1,1,30,180,180,180,180,180,180,60,30,18,12,8,7,6,6,7,8,12,18,30,60]',
        '[50000,50000,50000,50000,5000,1000,1000,1000,1000,1000,1000,3000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,3000]',
        0, 50, 16, 2);
INSERT INTO `game_config_118`
VALUES (2, 2, '中级房', 5000, 250000, '[500,1000,5000,10000,50000]',
        '[1,1,1,1,30,180,180,180,180,180,180,60,30,18,12,8,7,6,6,7,8,12,18,30,60]',
        '[250000,250000,250000,250000,30000,5000,5000,5000,5000,5000,5000,20000,30000,30000,30000,30000,30000,30000,30000,30000,30000,30000,30000,30000,20000]',
        0, 50, 16, 2);
INSERT INTO `game_config_118`
VALUES (3, 3, '高级房', 10000, 600000, '[1000,5000,10000,50000,100000]',
        '[1,1,1,1,30,180,180,180,180,180,180,60,30,18,12,8,7,6,6,7,8,12,18,30,60]',
        '[600000,600000,600000,600000,80000,10000,10000,10000,10000,10000,10000,40000,80000,80000,80000,80000,80000,80000,80000,80000,80000,80000,80000,80000,40000]',
        0, 50, 16, 2);
INSERT INTO `game_config_118`
VALUES (4, 4, '至尊房', 20000, 2000000, '[5000,10000,50000,100000,500000]',
        '[1,1,1,1,30,180,180,180,180,180,180,60,30,18,12,8,7,6,6,7,8,12,18,30,60]',
        '[2000000,2000000,2000000,2000000,100000,20000,20000,20000,20000,20000,20000,60000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,60000]',
        0, 50, 16, 2);

INSERT INTO `game_config_119`
VALUES (1, 1, '新手房', 100, 800, 1, 35, 5, 5);
INSERT INTO `game_config_119`
VALUES (2, 2, '初级房', 300, 2400, 1, 35, 5, 5);
INSERT INTO `game_config_119`
VALUES (3, 3, '中级房', 1000, 8000, 1, 35, 5, 5);
INSERT INTO `game_config_119`
VALUES (4, 4, '高级房', 3000, 24000, 1, 35, 5, 5);
INSERT INTO `game_config_119`
VALUES (5, 5, '王者房', 10000, 80000, 1, 35, 5, 5);
INSERT INTO `game_config_119`
VALUES (6, 6, '至尊房', 30000, 240000, 1, 35, 5, 5);

INSERT INTO `game_config_120` VALUES (16, 1, '初级房', 100, 1000, 20000, '[200,300,500,1000]', 4, 5, 20);
INSERT INTO `game_config_120` VALUES (17, 2, '中级房', 500, 5000, 100000, '[200,300,500,1000]', 4, 5, 18);
INSERT INTO `game_config_120` VALUES (18, 3, '高级房', 1000, 10000, 200000, '[200,300,500,1000]', 4, 5, 17);
INSERT INTO `game_config_120` VALUES (19, 4, '至尊房', 2000, 20000, 400000, '[200,300,500,1000]', 4, 5, 15);

INSERT INTO `game_config_121`
VALUES (1, 1, '新手房', 100, 600, 5, 5, 50, 1, 5, 180, 6);
INSERT INTO `game_config_121`
VALUES (2, 2, '初级房', 400, 2400, 5, 5, 19, 1, 5, 180, 6);
INSERT INTO `game_config_121`
VALUES (3, 3, '中级房', 1000, 6000, 5, 5, 100, 1, 5, 180, 6);
INSERT INTO `game_config_121`
VALUES (4, 4, '高级房', 3000, 18000, 5, 5, 100, 1, 5, 180, 6);
INSERT INTO `game_config_121`
VALUES (5, 5, '王者房', 10000, 60000, 5, 5, 100, 1, 5, 180, 6);
INSERT INTO `game_config_121`
VALUES (6, 6, '至尊房', 30000, 180000, 5, 5, 100, 1, 5, 180, 6);

INSERT INTO `game_config_122`
VALUES (1, 1, '新手房', 5, 100, 1500, 8, 100, 100000, 100, 100000, 1);
INSERT INTO `game_config_122`
VALUES (2, 2, '初级房', 5, 200, 3000, 8, 200, 100000, 200, 100000, 1);
INSERT INTO `game_config_122`
VALUES (3, 3, '中级房', 5, 1000, 20000, 8, 500, 100000, 500, 100000, 1);
INSERT INTO `game_config_122`
VALUES (4, 4, '高级房', 5, 5000, 100000, 8, 1000, 100000, 1000, 100000, 1);
INSERT INTO `game_config_122`
VALUES (5, 5, '王者房', 5, 20000, 400000, 8, 5000, 100000, 5000, 100000, 1);
INSERT INTO `game_config_122`
VALUES (6, 6, '至尊房', 5, 50000, 1200000, 8, 10000, 100000, 10000, 100000, 1);

INSERT INTO `game_config_123`
VALUES (1, 1, '初级房', 100, 2000, '[100]', 20, 10000, 5, 10);
INSERT INTO `game_config_123`
VALUES (2, 2, '中级房', 500, 10000, '[500]', 20, 10000, 5, 18);
INSERT INTO `game_config_123`
VALUES (3, 3, '高级房', 2000, 40000, '[2000]', 20, 10000, 5, 15);
INSERT INTO `game_config_123`
VALUES (4, 4, '王者房', 5000, 100000, '[5000]', 20, 10000, 5, 14);

INSERT INTO `game_config_124`
VALUES (1, 1, '初级房', 5, 51, '[100,500,1000,5000,10000]', 100, 100, 10000, 2000000, 5, 200, 15, 5);
INSERT INTO `game_config_124`
VALUES (2, 2, '中级房', 5, 51, '[1000,5000,10000,50000,100000]', 1000, 1000, 100000, 2000000, 5, 200, 15, 5);
INSERT INTO `game_config_124`
VALUES (3, 3, '高级房', 5, 51, '[5000,10000,50000,100000,500000]', 5000, 5000, 500000, 2000000, 5, 200, 15, 5);
INSERT INTO `game_config_124`
VALUES (4, 4, '至尊房', 5, 51, '[20000,50000,100000,500000,1000000]', 20000, 20000, 2000000, 2000000, 5, 200, 15, 5);

INSERT INTO `game_config_125`
VALUES (1, 1, '新手房', 10, 5000, 1, 35, 5, 5);
INSERT INTO `game_config_125`
VALUES (2, 2, '初级房', 50, 10000, 1, 35, 5, 5);
INSERT INTO `game_config_125`
VALUES (3, 3, '中级房', 100, 30000, 1, 35, 5, 5);
INSERT INTO `game_config_125`
VALUES (4, 4, '高级房', 200, 100000, 1, 35, 5, 5);
INSERT INTO `game_config_125`
VALUES (5, 5, '王者房', 500, 200000, 1, 35, 5, 5);
INSERT INTO `game_config_125`
VALUES (6, 6, '至尊房', 1000, 500000, 1, 35, 5, 5);

