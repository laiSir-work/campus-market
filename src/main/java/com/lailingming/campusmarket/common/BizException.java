package com.lailingming.campusmarket.common;

import lombok.Getter;

@Getter
public class BizException extends RuntimeException {
    private final Integer code;   // 把错误码捎在异常身上

    public BizException(ResultCode rc) {
        super(rc.getMessage());   // message 给异常
        this.code = rc.getCode();
    }

    public BizException(Integer code, String message) {
        super(message);
        this.code = code;
    }
}
