package com.zhongyi.admin.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.zhongyi.common.base.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 功能描述:
 *
 * @author: liuzhiting
 * @date: 2019/7/9
 */
@TableName("kehu")
@Data
public class Kehu extends BaseEntity {
    private static final long serialVersionUID = 1L;


    @TableField("phone")
    private String phone;

    @TableField("name")
    private String name;

    @TableField("sex")
    private Integer sex;
    @TableField("comment")
    private String comment;
    //邀请码   ----- 邀请别人
    @TableField("yaoqingma")
    private String yaoqingma;

    //邀请码   ----- 填写谁邀请的
    @TableField("beiyaoqingma")
    private String beiyaoqingma;

    @TableField(value = "create_date", fill = FieldFill.INSERT)
    protected Date createDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


}
