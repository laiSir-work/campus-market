package com.lailingming.campusmarket.common;

import lombok.Data;

@Data
public class Result<T> {
    private Integer code;
    private String message;
    private T data;
    public  static <T> Result<T> success(T data) {
        Result<T> r = new Result<>();
        r.code=200;
        r.message="success";
        r.data=data;
        return r;
    }

    public  static <T> Result<T> success() {
        return success(null);
    }
    public  static <T> Result<T> fail(ResultCode rc){
        Result<T> r = new Result<>();
        r.code=rc.getCode();
        r.message=rc.getMessage();
        return r;
    }

    public  static <T> Result<T> fail(Integer code,String message){
        Result<T> r = new Result<>();
        r.code=code;
        r.message=message;
        return r;
    }
}
