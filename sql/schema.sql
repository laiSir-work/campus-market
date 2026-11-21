-- ============================================================
-- campus-market 建表脚本（Day3）
-- 作用：一次性建好用户表 / 商品表 / 订单表
-- 执行方式：在 IDEA「数据库（Database）」里连上 campus_market，
--           新建「查询控制台（Query Console）」，全选粘贴后执行。
-- 注意：本文件只是「存档」，保存它不会自动建表，必须执行才算数。
--       只执行一次；要重来先手动执行：drop table orders, goods, user;
-- ============================================================

USE campus_market;

CREATE TABLE `user` (
  `id`          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username`    VARCHAR(32)  NOT NULL COMMENT '登录名',
  `password`    VARCHAR(100) NOT NULL COMMENT 'BCrypt 密文',
  `nickname`    VARCHAR(32)  DEFAULT NULL COMMENT '昵称',
  `phone`       VARCHAR(20)  DEFAULT NULL,
  `avatar`      VARCHAR(255) DEFAULT NULL COMMENT '头像 URL',
  `status`      TINYINT      NOT NULL DEFAULT 1 COMMENT '1正常 0禁用',
  `deleted`     TINYINT      NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

CREATE TABLE `goods` (
  `id`             BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_id`      BIGINT UNSIGNED NOT NULL COMMENT '卖家用户 id',
  `title`          VARCHAR(64)  NOT NULL COMMENT '标题',
  `description`    TEXT COMMENT '描述',
  `price`          DECIMAL(10,2) NOT NULL COMMENT '售价',
  `original_price` DECIMAL(10,2) DEFAULT NULL COMMENT '原价',
  `category`       TINYINT      NOT NULL DEFAULT 1 COMMENT '1教材 2数码 3生活 4其他',
  `cover_img`      VARCHAR(255) DEFAULT NULL,
  `stock`          INT          NOT NULL DEFAULT 1 COMMENT '库存',
  `status`         TINYINT      NOT NULL DEFAULT 1 COMMENT '1在售 0下架 2已售出',
  `view_count`     INT          NOT NULL DEFAULT 0 COMMENT '浏览量',
  `deleted`        TINYINT      NOT NULL DEFAULT 0,
  `create_time`    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time`    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_seller` (`seller_id`),
  KEY `idx_cat_status_time` (`category`, `status`, `create_time`)   -- 列表页主力索引
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

CREATE TABLE `orders` (
  `id`          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no`    VARCHAR(32)  NOT NULL COMMENT '业务单号',
  `goods_id`    BIGINT UNSIGNED NOT NULL,
  `buyer_id`    BIGINT UNSIGNED NOT NULL,
  `seller_id`   BIGINT UNSIGNED NOT NULL,
  `amount`      DECIMAL(10,2) NOT NULL,
  `status`      TINYINT      NOT NULL DEFAULT 0 COMMENT '0待付款 1已完成 2已取消',
  `deleted`     TINYINT      NOT NULL DEFAULT 0,
  `create_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`),
  KEY `idx_buyer` (`buyer_id`),
  KEY `idx_goods` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';
