package com.zhongyi.admin.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhongyi.admin.entity.Jifen;
import com.zhongyi.admin.entity.Kehu;
import com.zhongyi.admin.entity.Role;
import com.zhongyi.admin.entity.User;
import com.zhongyi.admin.service.JifenService;
import com.zhongyi.admin.service.KehuService;
import com.zhongyi.common.base.ApiResponse;
import com.zhongyi.common.config.redisConfig.RedisUtil;
import com.zhongyi.common.util.CheckPhone;
import com.zhongyi.common.util.Constants;
import com.zhongyi.common.util.JavaSmsApi;
import com.zhongyi.common.util.ShareCodeUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 功能描述:
 *
 * @author: liuzhiting
 * @date: 2019/7/4
 */
@Controller
@RequestMapping("zhuce")
public class ZhuceController {
    public static final int YAOQINGRENJIFEN = 10;
    public static final int BEIYAOQINGRENJIFEN = 10;
    public static final int ZHUCEJIFEN = 10;


    @Autowired
    private KehuService kehuService;
    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private JifenService jifenService;

    @RequestMapping("list")
    public String index() {

        return "zhuce/zhuce";
    }

    @RequestMapping("register")
    @ResponseBody
    public ApiResponse register(String phone, String vercode, String name, Integer sex, String beiyaoqingma) {
        ApiResponse msg = new ApiResponse();
        Kehu kehu1 = new Kehu();
        //验证参数的有效性

        //检查手机号是否合法
        boolean b = CheckPhone.isCellPhoneNo(phone);
        if (!b) {
            msg.setCode(1);
            msg.setMsg("手机号码不合法");
            return msg;
        }
        //验证码邀请码有效性  查看数据库中是否存在这样一个邀请码
        if (StringUtils.isNotBlank(beiyaoqingma)) {
            QueryWrapper queryWrapper1 = new QueryWrapper();
            queryWrapper1.eq("yaoqingma", beiyaoqingma);
            Kehu kehu2 = kehuService.getOne(queryWrapper1);
            if (kehu2 == null) {  //不存在此邀请码
                msg.setCode(6);
                msg.setMsg("邀请码错误！");
                return msg;
            }
            kehu1.setBeiyaoqingma(beiyaoqingma);
            //增加一条积分  给邀请人
            String phone1 = kehu2.getPhone();
            QueryWrapper queryWrapper2 = new QueryWrapper();
            queryWrapper2.eq("phone", phone1);
            Jifen jifen = jifenService.getOne(queryWrapper2);
            jifen.setJifenCount(jifen.getJifenCount()+YAOQINGRENJIFEN);
            jifenService.saveOrUpdate(jifen);

        }


        //检查手机号是否已经注册过
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("phone", phone);
        Kehu kehu = kehuService.getOne(queryWrapper);
        if (kehu != null) {
            msg.setCode(2);
            msg.setMsg("该手机号码已经注册过");
            return msg;

        }

        //从缓存中取得该手机号的缓存
        int code = (int) redisUtil.get(phone);

        if (code != 0) {
            //缓存中有值
            if (String.valueOf(code).equals(vercode)) { //如果用户填写的code和缓存中的code相等

                //处理业务，保存用户信息到数据库

                kehu1.setPhone(phone);
                kehu1.setName(name);
                kehu1.setSex(sex);

                //生成6位邀请码
                long l = Long.parseLong(phone.substring(3));
                String s = ShareCodeUtil.toSerialCode(l);
                kehu1.setYaoqingma(s);
                //TODO  发送短信告知用户自己的邀请码


                kehuService.save(kehu1);

                //积分表增加一条记录

                Jifen jifen = new Jifen();
                jifen.setPhone(phone);
                jifen.setJifenCount(ZHUCEJIFEN);
                jifenService.save(jifen);

                if (StringUtils.isBlank(kehu1.getId())) {
                    msg.setCode(2);
                    msg.setMsg("注册失败");
                    return msg;
                }


                msg.setCode(3);
                msg.setMsg("注册成功!签到有大礼包...");
                return msg;

            } else {
                //验证码填写错误

                msg.setCode(4);
                msg.setMsg("验证码填写错误！");
                return msg;
            }

        } else {

            //时间已经过去120s  请重新发送验证码

            msg.setCode(300);
            msg.setMsg("验证码已过期，请重新发送！");
            return msg;


        }


    }

    //发送验证码
    //手机验证码业务 ---注册
    @PostMapping("sendCode")
    @ResponseBody
    public ApiResponse sendCode(String phone) {
        ApiResponse msg = new ApiResponse();
        //检查手机号是否合法
        boolean b = CheckPhone.isCellPhoneNo(phone);
        if (!b) {
            msg.setCode(1);
            msg.setMsg("手机号码不合法!");
            return msg;
        }
        //检查手机号是否已经注册过
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("phone", phone);
        Kehu kehu = kehuService.getOne(queryWrapper);
        if (kehu != null) {
            msg.setCode(2);
            msg.setMsg("该手机号码已经注册过!");
            return msg;

        }
        ApiResponse send = JavaSmsApi.send(phone);

        if (send.getCode() == 0) {//短信接口调用成功
            msg.setCode(3);
            msg.setMsg("验证码已发送");

            //将手机号 验证码code存入缓存中并且设置过期时间120s
            int code = (int) send.getExtend().get("code");
            redisUtil.set(phone, code, 120);

        } else {  //短信接口调用失败
            msg.setCode(4);
            msg.setMsg("操作太过频繁，请稍后再试！");
        }
        return msg;

    }


}
