package com.zhongyi.common.base;

import java.util.HashMap;
import java.util.Map;

public class ApiResponse {
    //状态吗 100-成功 200-失败
    private int code;
    //提示信息
    private String msg;
    //用户要返回给游览器的数据
    private Map<String, Object> extend = new HashMap<>();

    public static ApiResponse success() {
        ApiResponse result = new ApiResponse();
        result.setCode(100);
        result.setMsg("处理成功!");
        return result;
    }

    public static ApiResponse fail() {
        ApiResponse result = new ApiResponse();
        result.setCode(200);
        result.setMsg("处理失败!");
        return result;
    }

    //链式操作返回信息
    public ApiResponse add(String key, Object value) {
        this.getExtend().put(key, value);
        return this;
    }


    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
