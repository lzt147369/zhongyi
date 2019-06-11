package com.zhongyi.common.util;

import com.yunpian.sdk.YunpianClient;
import com.yunpian.sdk.model.Result;
import com.yunpian.sdk.model.SmsSingleSend;
import com.zhongyi.common.base.ApiResponse;

import java.util.Map;

/**
 * http://www.yunpian.com 用户名：15229245001 密码:kuyitong123
 *
 * @author zhouxing
 */
public class JavaSmsApi {


    private static String apiKey;

    static {
        apiKey = Constants.YUNPIAN_APIKEY;
    }

    private static YunpianClient yunpianClient;

    public JavaSmsApi() { //无参构造方法
    }

    private static YunpianClient getInstance() {
        if (yunpianClient == null) {
            synchronized (JavaSmsApi.class) {
                if (yunpianClient == null) {
                    yunpianClient = new YunpianClient(apiKey).init();
                }
            }
        }
        return yunpianClient;
    }


    public static Integer random() {

        return ((int) ((Math.random() * 9 + 1) * 1000));
    }

    public static ApiResponse send(String phone) {

        Integer code = random();

        ApiResponse msg = new ApiResponse();

        Map<String, String> param = getInstance().newParam(2);
        param.put(YunpianClient.MOBILE, phone);
        param.put(YunpianClient.TEXT, "【酷易通】您的验证码是" + code + "。如非本人操作，请忽略本短信");
        Result<SmsSingleSend> result = yunpianClient.sms().single_send(param);
        msg.setCode(result.getCode());
        msg.setMsg(result.getMsg());
        msg.add("code", code);


        return msg;
    }


}
