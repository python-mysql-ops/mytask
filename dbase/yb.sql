CREATE TABLE IF NOT EXISTS `t_point_record`
(
    `id`              bigint      NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `point_id`        varchar(50) NOT NULL DEFAULT '' COMMENT '后台订单ID',
    `point_value`     bigint      NOT NULL DEFAULT 0 COMMENT '积分值',
    `point_type`      varchar(1)  NOT NULL DEFAULT '' COMMENT '积分类型：0、上分 1、下分',
    `create_time`     bigint      NOT NULL DEFAULT 0 COMMENT '订单中时间戳',
    `merchant_id`     bigint      NOT NULL DEFAULT 0 COMMENT '商户ID',
    `member_id`       bigint      NOT NULL DEFAULT 0 COMMENT '会员ID',
    `point_status`    varchar(1)  NOT NULL DEFAULT '' COMMENT '积分状态：0、成功 1、失败',
    `order_id`        varchar(64) NOT NULL DEFAULT '' COMMENT '第三方上下分订单ID',
    `handle_time` bigint NOT NULL DEFAULT '0' COMMENT '处理时间',
    PRIMARY KEY (`id`,`create_time`) USING BTREE,
    UNIQUE KEY `index_order_id_create_time` (`order_id`,`create_time`)
) ENGINE = InnoDB COMMENT '上下分记录表'
    /*!50100 PARTITION BY RANGE (`create_time`)
    (PARTITION p202001 VALUES LESS THAN (1580486400) ENGINE = InnoDB,
    PARTITION p202002 VALUES LESS THAN (1582992000) ENGINE = InnoDB,
    PARTITION p202003 VALUES LESS THAN (1585670400) ENGINE = InnoDB,
    PARTITION p202004 VALUES LESS THAN (1588262400) ENGINE = InnoDB,
    PARTITION p202005 VALUES LESS THAN (1590940800) ENGINE = InnoDB,
    PARTITION p202006 VALUES LESS THAN (1593532800) ENGINE = InnoDB,
    PARTITION p202007 VALUES LESS THAN (1596211200) ENGINE = InnoDB,
    PARTITION p202008 VALUES LESS THAN (1598889600) ENGINE = InnoDB,
    PARTITION p202009 VALUES LESS THAN (1601481600) ENGINE = InnoDB,
    PARTITION p202010 VALUES LESS THAN (1604160000) ENGINE = InnoDB,
    PARTITION p202011 VALUES LESS THAN (1606752000) ENGINE = InnoDB,
    PARTITION p202012 VALUES LESS THAN (1609430400) ENGINE = InnoDB,
    PARTITION p202101 VALUES LESS THAN (1612108800) ENGINE = InnoDB,
    PARTITION p202102 VALUES LESS THAN (1614528000) ENGINE = InnoDB,
    PARTITION p202103 VALUES LESS THAN (1617206400) ENGINE = InnoDB,
    PARTITION p202104 VALUES LESS THAN (1619798400) ENGINE = InnoDB,
    PARTITION p202105 VALUES LESS THAN (1622476800) ENGINE = InnoDB,
    PARTITION p202106 VALUES LESS THAN (1625068800) ENGINE = InnoDB,
    PARTITION p202107 VALUES LESS THAN (1627747200) ENGINE = InnoDB,
    PARTITION p202108 VALUES LESS THAN (1630425600) ENGINE = InnoDB,
    PARTITION p202109 VALUES LESS THAN (1633017600) ENGINE = InnoDB,
    PARTITION p202110 VALUES LESS THAN (1635696000) ENGINE = InnoDB,
    PARTITION p202111 VALUES LESS THAN (1638288000) ENGINE = InnoDB,
    PARTITION p202112 VALUES LESS THAN (1640966400) ENGINE = InnoDB,
    PARTITION p202201 VALUES LESS THAN (1643644800) ENGINE = InnoDB,
    PARTITION p202202 VALUES LESS THAN (1646064000) ENGINE = InnoDB,
    PARTITION p202203 VALUES LESS THAN (1648742400) ENGINE = InnoDB,
    PARTITION p202204 VALUES LESS THAN (1651334400) ENGINE = InnoDB) */;


CREATE TABLE `t_member_balance`
(
    `member_id`          bigint         NOT NULL COMMENT '会员id',
    `member_bal`         bigint         NOT NULL DEFAULT '0' COMMENT '会员余额',
    `member_able_bal`    bigint         NOT NULL DEFAULT '0' COMMENT '会员可用余额',
    `member_in`          bigint         NOT NULL DEFAULT '0' COMMENT '会员转入',
    `member_out`         bigint         NOT NULL DEFAULT '0' COMMENT '会员转出',
    `merchant_id`        bigint         NOT NULL DEFAULT '0' COMMENT '商户id',
    `merchant_member_id` varchar(60)    NOT NULL DEFAULT '' COMMENT '商户会员id',
    `win_lose`           bigint         NOT NULL DEFAULT '0' COMMENT '总输赢',
    `bet_coins`          bigint         NOT NULL DEFAULT '0' COMMENT '总投注额度',
    `bet_count`          int unsigned   NOT NULL DEFAULT '0' COMMENT '总投注数量',
    `member_pumping`     bigint         NOT NULL DEFAULT '0' COMMENT '会员总抽水',
    `last_login_ip`      varchar(50)    NOT NULL DEFAULT '' COMMENT '最后登录ip',
    `current_state`      tinyint        NOT NULL DEFAULT '0' COMMENT '当前状态:0、未冻结,1登录冻结2，资金冻结',
    `create_time`        bigint         NOT NULL DEFAULT '0' COMMENT '创建时间',
    `update_time`        bigint         NOT NULL DEFAULT '0' COMMENT '更新时间',
    `loss`               decimal(12, 2) NOT NULL DEFAULT '0.00' COMMENT '连败值',
    `daily_winlose`      bigint         NOT NULL DEFAULT '0' COMMENT '当日盈亏',
    `daily_betcoins`     bigint         NOT NULL DEFAULT '0' COMMENT '当日有效投注总额',
    `game_update_time`   bigint         NOT NULL DEFAULT '0' COMMENT '游服操作更新时间',
    `profig_rate`        double(12, 2)  NOT NULL DEFAULT '0.00' COMMENT '实时玩家净盈利率 (倒数第二局)',
    `member_type`        tinyint        NOT NULL DEFAULT '0' COMMENT '会员类型：0 真实玩家 ，1 测试玩家账号，2带单账号',
    PRIMARY KEY (`member_id`) USING BTREE,
    KEY `ind_update_time` (`update_time`)
) ENGINE = InnoDB
  ROW_FORMAT = COMPACT COMMENT '余额(扩展表)';


CREATE TABLE `t_member_balance_change`
(
    `trade_id`           bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '帐变id(主键自增id)',
    `member_id`          bigint          NOT NULL DEFAULT '0' COMMENT '会员id',
    `merchant_id`        bigint          NOT NULL DEFAULT '0' COMMENT '商户id',
    `merchant_member_id` varchar(60)     NOT NULL DEFAULT '' COMMENT '平台会员id',
    `bet_play_id`        bigint          NOT NULL DEFAULT '0' COMMENT '注单id',
    `bet_num`            varchar(50)     NOT NULL DEFAULT '' COMMENT '注单编号',
    `merchant_name`      varchar(100)    NOT NULL DEFAULT '' COMMENT '商户名称',
    `trade_type`         tinyint         NOT NULL DEFAULT '-1' COMMENT '帐变类型 0：上分(玩家转入) 1：下分（玩家转出） 2：投注（游戏注单）',
    `amt_change_in`      bigint          NOT NULL DEFAULT '0' COMMENT '帐变收入金额',
    `amt_change_out`     bigint          NOT NULL DEFAULT '0' COMMENT '账变支出金额',
    `balance_before`     bigint          NOT NULL DEFAULT '0' COMMENT '帐变前的余额',
    `balance_after`      bigint          NOT NULL DEFAULT '0' COMMENT '帐变后的余额',
    `create_time`        bigint          NOT NULL DEFAULT '0' COMMENT '帐变时间',
    `bet_amount`         bigint          NOT NULL DEFAULT '0' COMMENT '下注总额',
    `member_type`        tinyint         NOT NULL DEFAULT '0' COMMENT '会员类型：0 真实玩家 ，1 测试玩家账号，2带单账号',
    PRIMARY KEY (`trade_id`, `create_time`) USING BTREE,
    KEY `member_id_index` (`member_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1 COMMENT '玩家帐变表'
    /*!50100 PARTITION BY RANGE (`create_time`)
    (PARTITION p202001 VALUES LESS THAN (1580486400) ENGINE = InnoDB,
    PARTITION p202002 VALUES LESS THAN (1582992000) ENGINE = InnoDB,
    PARTITION p202003 VALUES LESS THAN (1585670400) ENGINE = InnoDB,
    PARTITION p202004 VALUES LESS THAN (1588262400) ENGINE = InnoDB,
    PARTITION p202005 VALUES LESS THAN (1590940800) ENGINE = InnoDB,
    PARTITION p202006 VALUES LESS THAN (1593532800) ENGINE = InnoDB,
    PARTITION p202007 VALUES LESS THAN (1596211200) ENGINE = InnoDB,
    PARTITION p202008 VALUES LESS THAN (1598889600) ENGINE = InnoDB,
    PARTITION p202009 VALUES LESS THAN (1601481600) ENGINE = InnoDB,
    PARTITION p202010 VALUES LESS THAN (1604160000) ENGINE = InnoDB,
    PARTITION p202011 VALUES LESS THAN (1606752000) ENGINE = InnoDB,
    PARTITION p202012 VALUES LESS THAN (1609430400) ENGINE = InnoDB,
    PARTITION p202101 VALUES LESS THAN (1612108800) ENGINE = InnoDB,
    PARTITION p202102 VALUES LESS THAN (1614528000) ENGINE = InnoDB,
    PARTITION p202103 VALUES LESS THAN (1617206400) ENGINE = InnoDB,
    PARTITION p202104 VALUES LESS THAN (1619798400) ENGINE = InnoDB,
    PARTITION p202105 VALUES LESS THAN (1622476800) ENGINE = InnoDB,
    PARTITION p202106 VALUES LESS THAN (1625068800) ENGINE = InnoDB,
    PARTITION p202107 VALUES LESS THAN (1627747200) ENGINE = InnoDB,
    PARTITION p202108 VALUES LESS THAN (1630425600) ENGINE = InnoDB,
    PARTITION p202109 VALUES LESS THAN (1633017600) ENGINE = InnoDB,
    PARTITION p202110 VALUES LESS THAN (1635696000) ENGINE = InnoDB,
    PARTITION p202111 VALUES LESS THAN (1638288000) ENGINE = InnoDB,
    PARTITION p202112 VALUES LESS THAN (1640966400) ENGINE = InnoDB,
    PARTITION p202201 VALUES LESS THAN (1643644800) ENGINE = InnoDB,
    PARTITION p202202 VALUES LESS THAN (1646064000) ENGINE = InnoDB,
    PARTITION p202203 VALUES LESS THAN (1648742400) ENGINE = InnoDB,
    PARTITION p202204 VALUES LESS THAN (1651334400) ENGINE = InnoDB) */;


CREATE TABLE `t_member`
(
    `member_id`           bigint      NOT NULL COMMENT '会员id',
    `merchant_id`         bigint      NOT NULL DEFAULT '0' COMMENT '商户id',
    `merchant_member_id`  varchar(60) NOT NULL DEFAULT '' COMMENT '商户会员id',
    `nick_name`           varchar(64) NOT NULL DEFAULT '' COMMENT '会员名称(第三方登录的昵称)改nick_name',
    `merchant_name`       varchar(64) NOT NULL DEFAULT '' COMMENT '商户名称',
    `merchant_account`    varchar(64) NOT NULL DEFAULT '' COMMENT '商户账号',
    `member_avatar`       tinyint     NOT NULL DEFAULT '0' COMMENT '会员头像',
    `member_type`         tinyint     NOT NULL DEFAULT '0' COMMENT '会员类型：0 真实玩家 ，1 测试玩家账号，2带单账号',
    `member_is_kick`      tinyint     NOT NULL DEFAULT '0' COMMENT '会员是否被踢出：0、未踢出，1、已踢出(待确认)',
    `member_kick_times`   int         NOT NULL DEFAULT '0' COMMENT '会员踢出次数',
    `create_time`         bigint      NOT NULL DEFAULT '0' COMMENT '创建时间',
    `update_time`         bigint      NOT NULL DEFAULT '0' COMMENT '更新时间',
    `update_by`           varchar(50) NOT NULL DEFAULT '' COMMENT '修改人',
    `sex`                 tinyint     NOT NULL DEFAULT '0' COMMENT '0:未知1:男2:女',
    `first_recharge`      bigint      NOT NULL DEFAULT '0' COMMENT '首充金币',
    `first_recharge_time` bigint      NOT NULL DEFAULT '0' COMMENT '首充金币时间',
    `merchant_member_pwd` varchar(64) NOT NULL DEFAULT '' COMMENT '商户会员密码(64以下)',
    PRIMARY KEY (`member_id`) USING BTREE,
    KEY `ind_update_time` (`update_time`),
    UNIQUE KEY `merchant_memeber_id_index` (`merchant_member_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='会员表';


CREATE TABLE IF NOT EXISTS `t_behalf`
(
    `id`            bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '游戏代单id',
    `user_id`       bigint          NOT NULL DEFAULT 0 COMMENT '用户id',
    `nick_name`     varchar(100)    NOT NULL DEFAULT '' COMMENT '昵称',
    `start_time`    bigint          NOT NULL DEFAULT 0 COMMENT '代单开始时间',
    `end_time`      bigint          NOT NULL DEFAULT 0 COMMENT '代单结束时间',
    `ip`            varchar(255)    NOT NULL DEFAULT '0' COMMENT 'ip',
    `statu`         tinyint         NOT NULL DEFAULT 0 COMMENT '状态：0:正常使用，1：停用',
    `create_time`   bigint          NOT NULL DEFAULT 0 COMMENT '创建时间',
    `create_by`     varchar(50)     NOT NULL DEFAULT '' COMMENT '创建人',
    `update_time`   bigint          NOT NULL DEFAULT 0 COMMENT '最近修改时间',
    `update_by`     varchar(50)     NOT NULL DEFAULT '' COMMENT '修改人',
    `merchant_id`   bigint          NOT NULL DEFAULT 0 COMMENT '商户id',
    `behalf_amount` bigint          NOT NULL DEFAULT 50000 COMMENT '带入金额',
    `merchant_name` varchar(64)     NOT NULL DEFAULT '' COMMENT '商户会员名称',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `ind_update_time` (`update_time`)
) ENGINE = InnoDB COMMENT = '游戏代单表';

CREATE TABLE `t_behalf_bet_record`
(
    `id`                 bigint unsigned  NOT NULL AUTO_INCREMENT COMMENT '主键',
    `bet_id`             bigint           NOT NULL DEFAULT '0' COMMENT '注单id(唯一索引)',
    `member_id`          bigint           NOT NULL DEFAULT '0' COMMENT '会员id(索引)',
    `merchant_id`        bigint           NOT NULL DEFAULT '0' COMMENT '商户id',
    `merchant_member_id` varchar(60)      NOT NULL DEFAULT '' COMMENT '商户会员id',
    `member_type`        tinyint          NOT NULL DEFAULT '0' COMMENT '会员类型：0 真实玩家 ，1 测试玩家账号，2带单账号',
    `start_time`         bigint           NOT NULL DEFAULT '0' COMMENT '游戏开始时间',
    `end_time`           bigint           NOT NULL DEFAULT '0' COMMENT '游戏结束时间',
    `game_table`         int              NOT NULL DEFAULT '0' COMMENT '游戏桌号(int)',
    `game_id`            int              NOT NULL DEFAULT '0' COMMENT '游戏id',
    `game_name`          varchar(32)      NOT NULL DEFAULT '' COMMENT '游戏名称',
    `game_type`          tinyint          NOT NULL DEFAULT '0' COMMENT '房间类型(1:初级,2:中级...)',
    `game_room`          varchar(24)      NOT NULL DEFAULT '' COMMENT '游戏房间',
    `last_login_ip`      varchar(32)      NOT NULL DEFAULT '' COMMENT '最后登录ip',
    `enter_coins`        bigint           NOT NULL DEFAULT '0' COMMENT '入场金币',
    `exit_coins`         bigint           NOT NULL DEFAULT '0' COMMENT '出场金币',
    `member_wol`         bigint           NOT NULL DEFAULT '0' COMMENT '会员输赢',
    `member_pumping`     bigint           NOT NULL DEFAULT '0' COMMENT '会员抽水',
    `bet_info`           varchar(256)     NOT NULL DEFAULT '' COMMENT '注单详情',
    `bet_coins`          bigint           NOT NULL DEFAULT '0' COMMENT '有效投注',
    `cardgame_id`        bigint           NOT NULL DEFAULT '0' COMMENT '牌局id',
    `terminal`           tinyint unsigned NOT NULL DEFAULT '0' COMMENT '终端id 1：PC ,2:安卓 3：IOS ,4:H5',
    `existrobot`         tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在机器人',
    `total_bet`          bigint           NOT NULL DEFAULT '0' COMMENT '总投注',
    `seat`               int              NOT NULL DEFAULT '0' COMMENT '座位号',
    `cardgame_num`       varchar(32)      NOT NULL DEFAULT '0' COMMENT '牌局编号',
    PRIMARY KEY (`id`, `end_time`),
    UNIQUE KEY `bet_id` (`end_time`, `bet_id`),
    KEY `member_id` (`member_id`) USING BTREE
) ENGINE = InnoDB COMMENT '代单游戏记录表';

CREATE TABLE t_member_notes
(
    id          bigint           NOT NULL AUTO_INCREMENT COMMENT '主键',
    member_id   bigint           NOT NULL COMMENT '会员id',
    game_id     int              NOT NULL DEFAULT '0' COMMENT '游戏id',
    merchant_id bigint           NOT NULL COMMENT '商户id',
    idx         tinyint unsigned NOT NULL DEFAULT '0' COMMENT '记录下标',
    last_risk   decimal(12, 2)   NOT NULL DEFAULT '0.00' COMMENT '游戏最后 风控控制系数（实际风控控制系数 * 100）',
    record0     varchar(86)      NOT NULL DEFAULT '' COMMENT '游戏记录',
    record1     varchar(86)      NOT NULL DEFAULT '' COMMENT '游戏记录',
    record2     varchar(86)      NOT NULL DEFAULT '' COMMENT '游戏记录',
    record3     varchar(86)      NOT NULL DEFAULT '' COMMENT '游戏记录',
    record4     varchar(86)      NOT NULL DEFAULT '' COMMENT '游戏记录',
    record5     varchar(86)      NOT NULL DEFAULT '' COMMENT '游戏记录',
    record6     varchar(86)      NOT NULL DEFAULT '' COMMENT '游戏记录',
    record7     varchar(86)      NOT NULL DEFAULT '' COMMENT '游戏记录',
    record8     varchar(86)      NOT NULL DEFAULT '' COMMENT '游戏记录',
    record9     varchar(86)      NOT NULL DEFAULT '' COMMENT '游戏记录',
    record10    varchar(86)      NOT NULL DEFAULT '' COMMENT '游戏记录',
    PRIMARY KEY (`id`),
    UNIQUE KEY `member_id` (`member_id`, `game_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='游戏历史记录表';

CREATE TABLE `t_game_record`
(
    `id`                 bigint unsigned  NOT NULL AUTO_INCREMENT COMMENT '主键',
    `bet_id`             bigint           NOT NULL DEFAULT '0' COMMENT '注单id(唯一索引)',
    `member_id`          bigint           NOT NULL DEFAULT '0' COMMENT '会员id(索引)',
    `merchant_id`        bigint           NOT NULL DEFAULT '0' COMMENT '商户id',
    `merchant_member_id` varchar(60)      NOT NULL DEFAULT '' COMMENT '商户会员id',
    `member_type`        tinyint          NOT NULL DEFAULT '0' COMMENT '会员类型：0 真实玩家 ，1 测试玩家账号，2带单账号',
    `start_time`         bigint           NOT NULL DEFAULT '0' COMMENT '游戏开始时间',
    `end_time`           bigint           NOT NULL DEFAULT '0' COMMENT '游戏结束时间',
    `game_table`         int              NOT NULL DEFAULT '0' COMMENT '游戏桌号(int)',
    `game_id`            int              NOT NULL DEFAULT '0' COMMENT '游戏id',
    `game_name`          varchar(32)      NOT NULL DEFAULT '' COMMENT '游戏名称',
    `game_type`          tinyint          NOT NULL DEFAULT '0' COMMENT '房间类型(1:初级,2:中级...)',
    `game_room`          varchar(24)      NOT NULL DEFAULT '' COMMENT '游戏房间',
    `last_login_ip`      varchar(32)      NOT NULL DEFAULT '' COMMENT '最后登录ip',
    `enter_coins`        bigint           NOT NULL DEFAULT '0' COMMENT '入场金币',
    `exit_coins`         bigint           NOT NULL DEFAULT '0' COMMENT '出场金币',
    `member_wol`         bigint           NOT NULL DEFAULT '0' COMMENT '会员输赢',
    `member_pumping`     bigint           NOT NULL DEFAULT '0' COMMENT '会员抽水',
    `bet_info`           varchar(256)     NOT NULL DEFAULT '' COMMENT '注单详情',
    `bet_coins`          bigint           NOT NULL DEFAULT '0' COMMENT '有效投注',
    `cardgame_id`        bigint           NOT NULL DEFAULT '0' COMMENT '牌局id',
    `terminal`           tinyint unsigned NOT NULL DEFAULT '0' COMMENT '终端id 1：PC ,2:安卓 3：IOS ,4:H5',
    `existrobot`         tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在机器人',
    `total_bet`          bigint           NOT NULL DEFAULT '0' COMMENT '总投注',
    `seat`               int              NOT NULL DEFAULT '0' COMMENT '座位号',
    `cardgame_num`       varchar(32)      NOT NULL DEFAULT '0' COMMENT '牌局编号',
    PRIMARY KEY (`id`, `end_time`),
    UNIQUE KEY `bet_id` (`end_time`, `bet_id`),
    KEY `member_id` (`member_id`) USING BTREE
) ENGINE = InnoDB COMMENT '游戏注单表'
    /*!50100 PARTITION BY RANGE (`end_time`)
    (PARTITION p202001 VALUES LESS THAN (1580486400) ENGINE = InnoDB,
    PARTITION p202002 VALUES LESS THAN (1582992000) ENGINE = InnoDB,
    PARTITION p202003 VALUES LESS THAN (1585670400) ENGINE = InnoDB,
    PARTITION p202004 VALUES LESS THAN (1588262400) ENGINE = InnoDB,
    PARTITION p202005 VALUES LESS THAN (1590940800) ENGINE = InnoDB,
    PARTITION p202006 VALUES LESS THAN (1593532800) ENGINE = InnoDB,
    PARTITION p202007 VALUES LESS THAN (1596211200) ENGINE = InnoDB,
    PARTITION p202008 VALUES LESS THAN (1598889600) ENGINE = InnoDB,
    PARTITION p202009 VALUES LESS THAN (1601481600) ENGINE = InnoDB,
    PARTITION p202010 VALUES LESS THAN (1604160000) ENGINE = InnoDB,
    PARTITION p202011 VALUES LESS THAN (1606752000) ENGINE = InnoDB,
    PARTITION p202012 VALUES LESS THAN (1609430400) ENGINE = InnoDB,
    PARTITION p202101 VALUES LESS THAN (1612108800) ENGINE = InnoDB,
    PARTITION p202102 VALUES LESS THAN (1614528000) ENGINE = InnoDB,
    PARTITION p202103 VALUES LESS THAN (1617206400) ENGINE = InnoDB,
    PARTITION p202104 VALUES LESS THAN (1619798400) ENGINE = InnoDB,
    PARTITION p202105 VALUES LESS THAN (1622476800) ENGINE = InnoDB,
    PARTITION p202106 VALUES LESS THAN (1625068800) ENGINE = InnoDB,
    PARTITION p202107 VALUES LESS THAN (1627747200) ENGINE = InnoDB,
    PARTITION p202108 VALUES LESS THAN (1630425600) ENGINE = InnoDB,
    PARTITION p202109 VALUES LESS THAN (1633017600) ENGINE = InnoDB,
    PARTITION p202110 VALUES LESS THAN (1635696000) ENGINE = InnoDB,
    PARTITION p202111 VALUES LESS THAN (1638288000) ENGINE = InnoDB,
    PARTITION p202112 VALUES LESS THAN (1640966400) ENGINE = InnoDB,
    PARTITION p202201 VALUES LESS THAN (1643644800) ENGINE = InnoDB,
    PARTITION p202202 VALUES LESS THAN (1646064000) ENGINE = InnoDB,
    PARTITION p202203 VALUES LESS THAN (1648742400) ENGINE = InnoDB,
    PARTITION p202204 VALUES LESS THAN (1651334400) ENGINE = InnoDB) */;


CREATE TABLE `t_rs_member_conf`
(
    `id`                            bigint         NOT NULL AUTO_INCREMENT COMMENT 'id',
    `member_id`                     bigint         NOT NULL DEFAULT '0' COMMENT '会员id',
    `merchant_id`                   bigint         NOT NULL DEFAULT '0' COMMENT '商户id',
    `request_no`                    varchar(20)    NOT NULL DEFAULT '' COMMENT '申请单号',
    `update_time`                   bigint         NOT NULL DEFAULT '0' COMMENT '更新时间',
    `create_time`                   bigint         NOT NULL DEFAULT '0' COMMENT '操作时间',
    `create_by`                     varchar(50)    NOT NULL DEFAULT '' COMMENT '操作人',
    `update_by`                     varchar(50)    NOT NULL DEFAULT '' COMMENT '操作人',
    `profig_rate`                   DECIMAL(18, 2)  NOT NULL DEFAULT '0.00' COMMENT '实时玩家净盈利率 (倒数第二局)',
    `control_coin`                  bigint         NOT NULL DEFAULT '0' COMMENT '点控控制金额（分）（后台设置）',
    `control_profig_per`            DECIMAL(18, 2)  NOT NULL DEFAULT '0.00' COMMENT '点控控制玩家期望盈利率（*100）（后台设置）',
    `control_risk`                  DECIMAL(18, 2)  NOT NULL DEFAULT '0.00' COMMENT '点控控制风控系数 （*100）（后台设置）',
    `already_control_coin`          bigint         NOT NULL DEFAULT '0' COMMENT '点控已控制金额 （分）（设置 ‘点控控制金额 ’ 时设置为 0 ）',
    `control_type`                  tinyint        NOT NULL DEFAULT '0' COMMENT '点控状态（1-14） 0 3 10',
    `grandmaster_exp_profit_margin` DECIMAL(18, 2) not null DEFAULT 0.00 COMMENT '期望总盈利率',
    PRIMARY KEY (`id`),
    UNIQUE KEY `member_id_index` (`member_id`) USING BTREE,
    UNIQUE KEY `request_no_index` (`request_no`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1;

CREATE TABLE `t_game_betinfo`
(
    `id`          bigint        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `bet_id`      bigint        NOT NULL DEFAULT '0' COMMENT '注单id(唯一索引)',
    `member_id`   bigint        NOT NULL DEFAULT '0' COMMENT '会员id',
    `merchant_id` bigint        NOT NULL COMMENT '商户id',
    `bet_info`    varchar(1024) NOT NULL COMMENT '注单详情',
    PRIMARY KEY (`id`),
    UNIQUE KEY `bet_id` (`bet_id`)
) ENGINE = InnoDB;

CREATE TABLE `t_rs_factor_log`
(
    `id`               bigint      NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
    `create_time`      bigint      NOT NULL DEFAULT -28800 COMMENT '操作时间',
    `member_id`        bigint      NOT NULL DEFAULT 0 COMMENT '玩家id',
    `create_by`        varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
    `before_operation` json COMMENT '操作前记录信息json串',
    `after_operation`  json COMMENT '操作后记录信息json串',
    `act`              tinyint     NOT NULL DEFAULT 0 COMMENT '动作 1 申请调整 2 申请调整-审批通过 3 申请调整-拒绝 4 申请解控 5 申请解控-审批通过 6 申请解控-拒绝',
    `apply_order_no`   varchar(20) NOT NULL DEFAULT '0' COMMENT '申请单号 ',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1 COMMENT = '操作日志表'
  ROW_FORMAT = Dynamic;

