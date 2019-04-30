package com.zhongyi.admin.controller;

import com.zhongyi.admin.entity.User;
import com.zhongyi.admin.service.UserService;
import com.zhongyi.common.config.redisConfig.RedisUtil;
import com.zhongyi.common.util.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 找回密码
 */
@Controller
@RequestMapping("/findPass")
public class FindPassController {


    @Autowired
    private UserService userService;

    @Autowired
    private RedisUtil redisUtil;
    //跳转到找回密码页面
    @RequestMapping("index")
    public String index() {
        return "admin/findPass";
    }

    //跳转至重置密码页
    @RequestMapping("resetpass/index")
    public String resetpassIndex(String phone, ModelMap modelMap) {
        modelMap.addAttribute("phone", phone);
        return "admin/resetpass";
    }


    //重置密码
    @RequestMapping("resetpass")
    @ResponseBody
    public  Msg resetpass(String password,String repass,String phone){

        Msg msg = new Msg();
        if (!password.equals(repass)){
            msg.setCode(1);
            msg.setMsg("俩次输入密码不一致！");
        }

        //修改密码

        User user = userService.findUserByLoginName(phone);
        if (user==null){
            msg.setCode(2);
            msg.setMsg("此手机号未注册过");
            return msg;
        }
        user.setPassword(repass);
        Encodes.entryptPassword(user);
        userService.updateById(user);
        msg.setCode(3);
        msg.setMsg("密码已成功重置");

        return msg;
    }

    //处理短信验证码，检查手机号是否存在
    @RequestMapping("verifyMobile/2")
    @ResponseBody
    public Msg sendCode(String phone) {
        Msg msg = new Msg();
        //检查手机号是否合法
        boolean b = CheckPhone.isCellPhoneNo(phone);
        if (!b) {
            msg.setCode(1);
            msg.setMsg("手机号码不合法");
            return msg;
        }
        //检查手机号是否已经注册过
        User user = userService.findUserByLoginName(phone);
        if (user == null) {
            msg.setCode(2);
            msg.setMsg("此手机号未注册过！");
            return msg;

        }
        Msg send = JavaSmsApi.send(phone);

        if (send.getCode() == 0) {//短信接口调用成功
            msg.setCode(3);
            msg.setMsg("短信验证码已经发送到您的手机，请注意查收");

            //将手机号 验证码code存入缓存中并且设置过期时间120s
            int code = (int) send.getExtend().get("code");
            redisUtil.set(phone, code, 120);

        } else {  //短信接口调用失败
            msg.setCode(4);
            msg.setMsg("操作太过频繁，请稍后再试！");
        }
        return msg;

    }


    //  验证手机手机验证码是否正确，手机是否在数据库是否存在  图形验证码是否正确，手机验证码是否正确
    @RequestMapping("find")
    @ResponseBody
    public Msg find(String phone,String vercode,String smscode,HttpServletRequest request){
        Msg msg = new Msg();
        //检查手机号是否合法
        boolean b = CheckPhone.isCellPhoneNo(phone);
        if (!b) {
            msg.setCode(1);
            msg.setMsg("请检查手机号码的格式！");
            return msg;
        }
        //检查手机号是否已经注册过
        User user = userService.findUserByLoginName(phone);
        if (user == null) {
            msg.setCode(2);
            msg.setMsg("此手机号未注册过");
            return msg;

        }
        //检查图形验证码是否正确
        HttpSession session = request.getSession();
        String trueCode = (String)session.getAttribute(Constants.VALIDATE_CODE);
        if(StringUtils.isBlank(trueCode)){
            msg.setCode(2);
            msg.setMsg("图形验证码超时");
            return msg;
        }

        if(StringUtils.isBlank(vercode) || !trueCode.toLowerCase().equals(vercode.toLowerCase())){

            msg.setCode(2);
            msg.setMsg("图形验证码错误");
            return msg;


        }
        //检查手机验证码是否正确
        int code = (int) redisUtil.get(phone);
        if (code != 0) {
            //缓存中有值
            if (String.valueOf(code).equals(smscode)) { //如果用户填写的code和缓存中的code相等

                msg.setCode(3);
                msg.setMsg("验证通过！");
                return msg;

            } else {
                //验证码填写错误
                msg.setCode(4);
                msg.setMsg("手机验证码填写错误");

                return msg;
            }

        } else {
            //时间已经过去120s  请重新发送验证码
            msg.setCode(300);
            msg.setMsg("验证码已过期，请重新发送");
            return msg;
        }
    }
}
