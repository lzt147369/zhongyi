package com.zhongyi.common.config;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 功能描述:
 *
 * @author: liuzhiting
 * @date: 2019/6/5
 */

@Controller
public class AppErrorController implements ErrorController {
    private static final String ERROR_PATH = "/error";



    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }



    /**
     * Web页面错误处理
     */
    @RequestMapping(value = ERROR_PATH, produces = "text/html")
    public String handleError(HttpServletRequest request) {
        Integer status = getStatus(request);
        switch (status) {
            case 403:
                return "errorpage/403";
            case 404:
                return "errorpage/404";
            case 405:
                return "errorpage/405";
                default:return "errorpage/500";
        }


    }



    private int getStatus(HttpServletRequest request) {
        Integer status = (Integer) request.getAttribute("javax.servlet.error.status_code");
        if (status != null) {
            return status;
        }

        return 500;
    }
}
