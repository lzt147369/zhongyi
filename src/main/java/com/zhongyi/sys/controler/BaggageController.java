package com.zhongyi.sys.controler;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhongyi.admin.entity.User;
import com.zhongyi.common.annotation.SysLog;
import com.zhongyi.common.base.PageData;
import com.zhongyi.sys.entity.Baggage;
import com.zhongyi.sys.service.IBaggageService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import java.util.Map;

/**
 * <p>
 * 行李类型     1 拉杆箱    2  要物寄存  3 纸箱及其他  4 特殊物品
 * </p>
 *
 * @author liuzhiting
 * @since 2019-06-11
 */
@Controller
@RequestMapping("sys/baggage")
public class BaggageController {
    @Autowired
    private IBaggageService baggageService;

    @GetMapping("list")
    public String list() {
        return "sys/baggage/list";
    }

    @RequiresPermissions("sys:baggage:list")
    @PostMapping("list")
    @ResponseBody
    public PageData<Baggage> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                               @RequestParam(value = "limit", defaultValue = "10") Integer limit) {
        PageData<Baggage> userPageData = new PageData<>();
        QueryWrapper<Baggage> userWrapper = new QueryWrapper<>();

        IPage<Baggage> userPage = baggageService.page(new Page<>(page, limit), userWrapper);
        userPageData.setCount(userPage.getTotal());
        userPageData.setData(userPage.getRecords());
        return userPageData;
    }

}

