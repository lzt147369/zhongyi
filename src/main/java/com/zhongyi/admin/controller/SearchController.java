package com.zhongyi.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 功能描述:
 *
 * @author: liuzhiting
 * @date: 2019/6/5
 */
@Controller
@RequestMapping("search")
public class SearchController {
    @RequestMapping("list")
    public String index(String keywords){
        System.out.println(keywords);

        return "admin/search";

    }


}
