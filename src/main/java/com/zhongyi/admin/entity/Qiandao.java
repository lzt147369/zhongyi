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
@TableName("qiandao")
@Data
public class Qiandao extends BaseEntity {
    private static final long serialVersionUID = 1L;


    @TableField("phone")
    private String phone;

    @TableField("count")
    private Integer count;

    @TableField("days_7")
    private Integer days7;




    @TableField(value = "create_date", fill = FieldFill.INSERT)
    protected Date createDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


}
