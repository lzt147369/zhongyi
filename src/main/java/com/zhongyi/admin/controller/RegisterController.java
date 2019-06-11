package com.zhongyi.admin.controller;


import com.zhongyi.admin.entity.Role;
import com.zhongyi.admin.entity.User;
import com.zhongyi.admin.service.RoleService;
import com.zhongyi.admin.service.UserService;
import com.zhongyi.common.base.ApiResponse;
import com.zhongyi.common.config.redisConfig.RedisUtil;
import com.zhongyi.common.util.CheckPhone;
import com.zhongyi.common.util.Constants;
import com.zhongyi.common.util.JavaSmsApi;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 */
@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;


    //跳转到注册页面
    @RequestMapping("index")
    public String index() {
        return "admin/register";
    }


    //处理注册业务100---注册成功   200---验证码填写错误   300---验证码过期
    @RequestMapping("submit")
    @ResponseBody
    //phone+vercode+password+repass+nickname
    public ApiResponse submit(String phone, String vercode, String password, String repass, String nickname) {

        ApiResponse msg = new ApiResponse();
        //验证参数的有效性
        if (!password.equals(repass)) {
            msg.setCode(0);
            msg.setMsg("俩次输入的密码不一致");
            return msg;
        }
        //检查手机号是否合法
        boolean b = CheckPhone.isCellPhoneNo(phone);
        if (!b) {
            msg.setCode(1);
            msg.setMsg("手机号码不合法");
            return msg;
        }

        //检查手机号是否已经注册过

        User user1 = userService.findUserByLoginName(phone);
        if (user1 != null) {
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
                User user = new User();
                user.setLoginName(phone);
                user.setPassword(repass);
                user.setNickName(nickname);
                //用户角色
                Set set = new HashSet();
                List<Role> roles = roleService.selectAll();
                for (Role role : roles) {
                    if (role.getName().contains(Constants.ZHUCE_USER_ROLE)) {
                        set.add(role);
                    }

                }
                user.setRoleLists(set);

                userService.saveUser(user);
                if (StringUtils.isBlank(user.getId())) {
                    msg.setCode(2);
                    msg.setMsg("注册失败");
                    return msg;
                }
                //保存用户角色关系
                userService.saveUserRoles(user.getId(), user.getRoleLists());


                msg.setCode(3);
                msg.setMsg("注册成功,即将跳转到登陆页...");
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

    //手机验证码业务 ---注册
    @RequestMapping("verifyMobile/1")
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
        User user = userService.findUserByLoginName(phone);
        if (user != null) {
            msg.setCode(2);
            msg.setMsg("该手机号码已经注册过!");
            return msg;

        }
        ApiResponse send = JavaSmsApi.send(phone);

        if (send.getCode() == 0) {//短信接口调用成功
            msg.setCode(3);
            msg.setMsg("注册短信验证码已发送到您的手机，请尽快填写您收到的验证码完成注册！");

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
