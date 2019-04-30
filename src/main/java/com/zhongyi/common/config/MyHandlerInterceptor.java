package com.zhongyi.common.config;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class MyHandlerInterceptor implements HandlerInterceptor {

    private static final Logger LOGGER = LoggerFactory.getLogger(MyHandlerInterceptor.class);

    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) {
//        LOGGER.info("当前请求路径.."+httpServletRequest.getRequestURI());
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) {
        if (response.getStatus() == 500) {
            modelAndView.setViewName("/errorpage/500");
        }

        if (response.getStatus() == 404) {
            modelAndView.setViewName("/errorpage/404");
        } else {

        }

    }

}
