package com.zhongyi.common.util;

import org.apache.commons.lang3.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CheckPhone {
    public static boolean isCellPhoneNo(String telephone) {
        String regex = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";

        if (StringUtils.isBlank(telephone)) {
            return false;
        }
        if (telephone.length() != 11) {
            return false;
        }
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(telephone);

        if (matcher.matches()) {
            return true;
        }
        return false;


    }

}
