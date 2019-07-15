package com.zhongyi.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 功能描述:   当前日期+1天
 *
 * @author: liuzhiting
 * @date: 2019/7/10
 */

public class DateIncrementer {

    public static String addOneDay(String date) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd" );
        Calendar cal = Calendar.getInstance();
        cal.setTime( dateFormat.parse(date));
        cal.add(Calendar.DATE, 1);
        Date time = cal.getTime();
        String datehouyitian = dateFormat.format(time);
        return datehouyitian;
    }
}
