package com.lailingming.campusmarket.common;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    // 客人点菜单上没有的：业务异常（后厨摇的铃）
    @ExceptionHandler(BizException.class)
    public Result<Void> handleBiz(BizException e) {
        log.warn("业务异常: {}", e.getMessage());
        return Result.fail(e.getCode(), e.getMessage());
    }

    // 菜单上字写错了：@Validated 参数校验失败（Day5 用到，先写上）
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Result<Void> handleValid(MethodArgumentNotValidException e) {
        String msg = e.getBindingResult().getFieldErrors().stream()
                .map(f -> f.getField() + ": " + f.getDefaultMessage())
                .findFirst().orElse("参数校验失败");
        return Result.fail(ResultCode.PARAM_ERROR.getCode(), msg);
    }

    // 后厨真着火了：一切没预料到的异常
    @ExceptionHandler(Exception.class)
    public Result<Void> handleOther(Exception e) {
        log.error("系统异常", e);   // 完整堆栈进日志，给程序员自己看
        return Result.fail(ResultCode.BIZ_ERROR.getCode(), "服务器开小差了，请稍后重试");
    }
}