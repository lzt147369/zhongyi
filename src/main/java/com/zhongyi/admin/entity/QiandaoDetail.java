package com.zhongyi.admin.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.zhongyi.common.base.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 功能描述: 签到详情  记录每天的签到记录    每月新的一天则清空记录表
 *
 * @author: liuzhiting
 * @date: 2019/7/9
 */
@TableName("qiandao_detail")
@Data
public class QiandaoDetail extends BaseEntity {
    private static final long serialVersionUID = 1L;


    @TableField("phone")
    private String phone;


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
