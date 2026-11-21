package com.lailingming.campusmarket.common;

import lombok.Getter;

@Getter
public enum ResultCode {
    SUCCESS(200, "success"),
    PARAM_ERROR(400, "参数错误"),
    UNAUTHORIZED(401, "未授权"),
    FORBIDDEN(403, "拒绝访问"),
    NOT_FOUND(404, "未找到"),
    BIZ_ERROR(500, "业务错误"),

    // 用户模块 1xxx
    USERNAME_EXISTS(1001, "用户名已存在"),
    LOGIN_FAILED(1002, "用户名或密码错误"),

    // 商品模块 2xxx
    GOODS_NOT_FOUND(2001, "商品不存在"),
    GOODS_OFF_SALE(2002, "商品已下架");

    private final int code;
    private final String message;

    ResultCode(int code, String message) {
        this.code = code;
        this.message = message;
    }
}
