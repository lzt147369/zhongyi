package com.zhongyi.admin;

public enum Status {

    SCUUESS("1", "成功"), FAILED("2", "失败");

    private String value;
    private String desc;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }


    Status(String desc, String value) {
        this.value = value;
        this.desc = desc;
    }

    //adas
    public static void main(String[] args) {
        String s1 = "123";
        String s2 = "123";
        String s3 = new String("123");
        System.out.println(s1 == s2); //true
        System.out.println(s1 == s3);  //false
        System.out.println(s1 == s3.intern());  //true
    }
}
