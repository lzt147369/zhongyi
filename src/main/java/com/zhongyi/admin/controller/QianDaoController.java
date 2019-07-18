package com.zhongyi.admin.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhongyi.admin.entity.Jifen;
import com.zhongyi.admin.entity.Kehu;
import com.zhongyi.admin.entity.Qiandao;
import com.zhongyi.admin.entity.QiandaoDetail;
import com.zhongyi.admin.service.JifenService;
import com.zhongyi.admin.service.KehuService;
import com.zhongyi.admin.service.QiandaoDetailService;
import com.zhongyi.admin.service.QiandaoService;
import com.zhongyi.common.base.ApiResponse;
import com.zhongyi.common.util.DateIncrementer;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 功能描述:
 *
 * @author: liuzhiting
 * @date: 2019/7/4
 */
@Controller
@RequestMapping("qiandao")
public class QianDaoController {

    public static Integer JIFENVALUE_DAYS7 = 10;   //七天大礼包增加10个积分


    @Autowired
    private KehuService kehuService;

    @Autowired
    private QiandaoService qiandaoService;


    @Autowired   //签到详情
    private QiandaoDetailService qiandaoDetailService;

    @Autowired   //积分
    private JifenService jifenService;



    @RequestMapping("index")
    public String index() {
        System.out.println("进入签到页面....index()");
        return "qiandao/index";
    }

    //奖励
    @RequestMapping("jiangli")
    public String jiangli() {
        return "qiandao/sign";
    }

    //活动说明
    @RequestMapping("huodong")
    public String huodong() {
        return "qiandao/activity";
    }

    //手机号登陆签到页面
    @RequestMapping("logindenglu")
    public String login() {
        System.out.println("签到页面输入手机号码....logindenglu()");
        return "qiandao/login";
    }

    //  验证手机号进行转入签到页面
    @PostMapping("login")
    @ResponseBody
    public ApiResponse login1(String phone) {
        ApiResponse apiResponse = new ApiResponse();

        System.out.println(phone);
        if (StringUtils.isBlank(phone)) {
            apiResponse.setCode(1);
            apiResponse.setMsg("手机号不能为空！");
            return apiResponse;
        }
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("phone", phone);
        Kehu kehu = kehuService.getOne(queryWrapper);
        if (kehu == null) {
            apiResponse.setCode(2);
            apiResponse.setMsg("手机号未注册！请注册后再签到！");
            return apiResponse;
        }
        apiResponse.setCode(3);
        apiResponse.setMsg("即将跳转至签到页面");
        return apiResponse;
    }

    //插入一条签到记录
    @PostMapping("insert")
    @ResponseBody
    public ApiResponse insert(String phone) throws ParseException {

        ApiResponse apiResponse = new ApiResponse();
        if (StringUtils.isBlank(phone)) {
            apiResponse.setCode(404);
            return apiResponse;
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("phone", phone);
        Qiandao qiandao = qiandaoService.getOne(wrapper);

        if (qiandao == null) {  //第一次签到
            Qiandao qiandao1 = new Qiandao();
            qiandao1.setPhone(phone);
            qiandao1.setCreateDate(new Date());
            qiandao1.setCount(1);
            qiandaoService.save(qiandao1);
            saveDetail(phone, qiandaoDetailService);
            apiResponse.setCode(100);
            apiResponse.setMsg("第一次签到");
            return apiResponse;

        } else {//不是第一次签到
            //判断当日有没有签到过
            Date date = qiandao.getCreateDate();
            long l = System.currentTimeMillis();
            //new日期对象
            Date current_date = new Date(l);
            //转换日期输出格式
            String currentday = dateFormat.format(current_date); //当前日期
            String qiandaoday = dateFormat.format(date);//数据库最后一次的签到日期
            if (currentday.equals(qiandaoday)) {//今日已签到过，无须重复签到
                apiResponse.setCode(200);
                apiResponse.setMsg("今日已签到过，不可重复签到");
                return apiResponse;

            } else {//今日未签到
                //判断是否连续签到  思路：数据库最后签到的日期+1  是否为今日的日期  如果相等则是连续签到 如果不相等 不是连续

                //数据库最后一次的签到日期
                Date createDate = qiandao.getCreateDate();
                String addOneDay = DateIncrementer.addOneDay(dateFormat.format(createDate));
                //今日的日期
                String currentday1 = dateFormat.format(current_date);
                if (addOneDay.equals(currentday1)) {//相等   连续签到
                    qiandao.setCount(qiandao.getCount() + 1);
                    //判断连续签到天数
                    Map map = new HashMap();
                    lianxu(qiandao, map);
                    qiandao.setCreateDate(new Date());
                    qiandaoService.updateById(qiandao);

                    saveDetail(phone, qiandaoDetailService); //保存签到详情记录
                    apiResponse.setCode(300);
                    apiResponse.setMsg("连续签到");
                    apiResponse.setExtend(map);
                    return apiResponse;

                } else { //不是连续签到    连续签到天数赋值为空
                    qiandao.setCount(0);
                    qiandao.setCreateDate(new Date());
                    apiResponse.setCode(400);
                    apiResponse.setMsg("未连续签到");
                    //判断连续签到天数
                    Map map = new HashMap();
                    lianxu(qiandao, map);
                    qiandaoService.updateById(qiandao);
                    saveDetail(phone, qiandaoDetailService); //保存签到详情记录

                    apiResponse.setExtend(map);
                    return apiResponse;


                }
            }
        }

    }


    //查询签到详情
    @PostMapping("select")
    @ResponseBody
    public ApiResponse select(String phone) {
        ApiResponse apiResponse = new ApiResponse();

        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("phone", phone);
        Qiandao qiandao = qiandaoService.getOne(wrapper);
        if (qiandao == null) {//没有签到记录
            apiResponse.setCode(100);
            apiResponse.setMsg("无签到记录");

            return apiResponse;
        }
        //有签到记录  返回给前台 数据  包括 连续签到情况,这个月哪几天签到了，奖品领取详情,今日是否签到过
        Map map = new HashMap();  //连续签到情况
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String format = sdf.format(date);
        String same = format.substring(0, 7);
        lianxu(qiandao, map);
        QueryWrapper wrapper1 = new QueryWrapper();
        wrapper1.eq("phone", phone);
        wrapper1.like("create_date", same);
        List<QiandaoDetail> list = qiandaoDetailService.list(wrapper1);
        List listday = new ArrayList();
        if (!list.isEmpty()){
            for (QiandaoDetail detail : list) {
                String day = sdf.format(detail.getCreateDate()).substring(8, 10);
                listday.add(day);
            }
            map.put("lianxu", listday);
        }else {
            map.put("lianxu", listday);
        }


        //今日是否签到过
        Date date1 = qiandao.getCreateDate();
        long l = System.currentTimeMillis();
        //new日期对象
        Date current_date = new Date(l);
        //转换日期输出格式
        String currentday = sdf.format(current_date); //当前日期
        String qiandaoday = sdf.format(date1);//数据库最后一次的签到日期
        if (currentday.equals(qiandaoday)) {
            //今日已经签到过
            map.put("isqiandao", true);
        } else {
            map.put("isqiandao", false);
        }

        //查询积分   领取按钮是否置位disabled
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("phone", phone);

        Jifen jifen1 = jifenService.getOne(queryWrapper);
        Qiandao qiandao1 = qiandaoService.getOne(queryWrapper);

        if (jifen1!=null){
            map.put("count", jifen1.getJifenCount());
        }else{
            map.put("count", 0);
        }

        if (qiandao1!=null){
            if (qiandao1.getDays7()==1){
                map.put("is", false);
            }else {
                map.put("is", true);
            }
        }else{
            map.put("is", false);
        }
        apiResponse.setExtend(map);
        return apiResponse;


    }
    //七天礼包
    @PostMapping("qitianlibao")
    @ResponseBody
    public ApiResponse qitianlibao(String phone){
        ApiResponse apiResponse = new ApiResponse();

        //增加积分   10积分
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("phone", phone);
        Qiandao qiandao = qiandaoService.getOne(queryWrapper);
        Jifen jifen = jifenService.getOne(queryWrapper);
        //判断是否能够领取积分
        if (qiandao!=null){

            if (qiandao.getDays7()!=0){ //是
                apiResponse.setCode(500);
                return apiResponse;

            }
        }
        if (jifen!=null){

            jifen.setJifenCount(jifen.getJifenCount()+JIFENVALUE_DAYS7);
            jifenService.saveOrUpdate(jifen);
        }

        //同时清空连续签到情况

        qiandao.setCount(0);
        qiandao.setDays7(1);
        qiandaoService.updateById(qiandao);
        apiResponse.setCode(200);
        return apiResponse;
    }
    //查询积分  总积分   查询连续签到天数
//    @PostMapping("chaxunjifen")
//    @ResponseBody
//    public ApiResponse chaxunjifen(String phone){
//        ApiResponse apiResponse = new ApiResponse();
//
//
//
//        apiResponse.setCode(200);
//        apiResponse.setExtend(map);
//        return apiResponse;
//    }




    public static void saveDetail(String phone, QiandaoDetailService qiandaoDetailService) {
        QiandaoDetail qiandaoDetail = new QiandaoDetail();
        qiandaoDetail.setCreateDate(new Date());
        qiandaoDetail.setPhone(phone);
        qiandaoDetailService.save(qiandaoDetail);

    }

    public static void lianxu(Qiandao qiandao,Map map) {
        if (qiandao.getCount() > 6) {  //是否连续7天签到  正好是第七天
            //是连续七天签到的话   count复制为0  从新开始计算
            qiandao.setDays7(0);
            map.put("isQitian",true);

        }else{
            qiandao.setDays7(1);
            map.put("isQitian",false);
        }
    }




}
