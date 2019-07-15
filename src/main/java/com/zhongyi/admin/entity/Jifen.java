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
@TableName("jifen")
@Data
public class Jifen extends BaseEntity {
    private static final long serialVersionUID = 1L;


    @TableField("phone")
    private String phone;

    @TableField("jifen_count")
    private int jifenCount;



}
