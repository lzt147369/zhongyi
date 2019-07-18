package com.zhongyi.admin.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhongyi.admin.entity.Kehu;
import com.zhongyi.admin.service.KehuService;
import com.zhongyi.common.base.ApiResponse;
import com.zhongyi.common.base.PageData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 功能描述:
 *
 * @author: liuzhiting
 * @date: 2019/7/9
 */
@Controller
@RequestMapping("kehu")
public class KehuController {

    @Autowired
    private KehuService kehuService;
    @GetMapping("list")
    public String list() {
        return "admin/kehu/list";
    }

    @PostMapping("list")
    @ResponseBody
    public PageData<Kehu> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                               @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                               ServletRequest request) {
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        PageData<Kehu> userPageData = new PageData<>();
        QueryWrapper<Kehu> userWrapper = new QueryWrapper<>();
        if (!map.isEmpty()) {
            String type = (String) map.get("type");
            if (StringUtils.isNotBlank(type)) {
                userWrapper.eq("sex", type);
            }
            String keys = (String) map.get("key");
            if (StringUtils.isNotBlank(keys)) {
                userWrapper.and(wrapper -> wrapper.like("name", keys).or().like("phone", keys));
            }
        }
        IPage<Kehu> userPage = kehuService.page(new Page<>(page, limit), userWrapper);
        userPageData.setCount(userPage.getTotal());
        userPageData.setData(userPage.getRecords());
        return userPageData;
    }

    //备注
    @RequestMapping("setComment")
    @ResponseBody
    public String setComment(String phone,String comment){
    System.out.println(phone);
    System.out.println(comment);
        QueryWrapper<Kehu> kehuWrapper = new QueryWrapper<>();
        kehuWrapper.eq("phone", phone);
        Kehu kehu = kehuService.getOne(kehuWrapper);
        kehu.setComment(comment);
        kehuService.updateById(kehu);
        return "success";
    }
    //查看下级
    @RequestMapping("xiaji")
    public String xiaji(String phone, ModelMap modelMap){
        modelMap.put("phone", phone);
        return "admin/kehu/xiaji";

    }
    @PostMapping("xiaji")
    @ResponseBody
    public PageData<Kehu> xiaji(@RequestParam(value = "page", defaultValue = "1") Integer page,
                               @RequestParam(value = "limit", defaultValue = "10") Integer limit,String phone) {
        PageData<Kehu> userPageData = new PageData<>();
        QueryWrapper<Kehu> userWrapper = new QueryWrapper<>();
        userWrapper.eq("phone",phone);
        Kehu kehu = kehuService.getOne(userWrapper);
        String yaoqingma = kehu.getYaoqingma();
        if (StringUtils.isBlank(yaoqingma)){
            return userPageData;
        }
        QueryWrapper<Kehu> userWrapper1 = new QueryWrapper<>();
        userWrapper1.eq("beiyaoqingma",yaoqingma);

        IPage<Kehu> userPage = kehuService.page(new Page<>(page, limit), userWrapper1);
        userPageData.setCount(userPage.getTotal());
        userPageData.setData(userPage.getRecords());
        return userPageData;
    }

    //查询邀请码
    @PostMapping("chaxunyaoqingma")
    @ResponseBody
    public ApiResponse chaxunyaoqingma(String phone){
        ApiResponse apiResponse = new ApiResponse();
        System.out.println("chaxunyaoqingma()"+phone);
        QueryWrapper<Kehu> userWrapper = new QueryWrapper<>();
        userWrapper.eq("phone",phone);
        Kehu kehu = kehuService.getOne(userWrapper);
        if (kehu==null){
            apiResponse.setCode(500);
            apiResponse.setMsg("该手机号码未注册");
            return apiResponse;
        }

        apiResponse.setCode(200);
        apiResponse.setMsg("您的邀请码是:"+kehu.getYaoqingma());
        Map map = new HashMap();
        map.put("yaoqingma", kehu.getYaoqingma());
        apiResponse.setExtend(map);
        return apiResponse;
    }
    //跳转到查询邀请码页面
    @RequestMapping("yaoqingmalist")
    public String yaoqingmalist(){

        return "admin/kehu/yaoqingma";
    }

    //查询最近一个月注册人数
    @RequestMapping("renshu")
    public ApiResponse renshu(){
        ApiResponse apiResponse = new ApiResponse();


        return apiResponse;
    }




}
