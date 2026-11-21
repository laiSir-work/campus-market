package com.lailingming.campusmarket.controller;

import com.lailingming.campusmarket.common.BizException;
import com.lailingming.campusmarket.common.Result;
import com.lailingming.campusmarket.common.ResultCode;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/test/ok")
    public Result<String> ok() {
        return Result.success("ok");
    }

    @GetMapping("/test/biz-error")
    public Result<Void> bizError() {
        throw new BizException(ResultCode.GOODS_NOT_FOUND);
    }

    @GetMapping("/test/boom")
    public Result<Void> boom() {
        int a = 1 / 0;   // 故意制造 ArithmeticException
        return Result.success();
    }
}
