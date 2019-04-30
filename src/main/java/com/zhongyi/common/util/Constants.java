package com.zhongyi.common.util;

public class Constants {

    /**
     * shiro采用加密算法
     */
    public static final String HASH_ALGORITHM = "SHA-1";

    /**
     * 生成Hash值的迭代次数
     */
    public static final int HASH_INTERATIONS = 1024;

    /**
     * 生成盐的长度
     */
    public static final int SALT_SIZE = 8;

    /**
     * 验证码
     */
    public static final String VALIDATE_CODE = "validateCode";

    /**
     *系统用户默认密码
     */
    public static final String DEFAULT_PASSWORD = "123456";


    /**
     * 注册用户默认的角色
     *
     */
    public static final String ZHUCE_USER_ROLE = "注册";


    /**
     * 云片短信key
     */
    public static final String YUNPIAN_APIKEY = "9421795feb7215a3bc609a47b4e33128";

}
