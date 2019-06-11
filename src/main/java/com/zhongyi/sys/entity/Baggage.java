package com.zhongyi.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author lqh
 * @since 2019-06-11
 */
@TableName("sys_baggage")
public class Baggage extends Model<Baggage> {

    private static final long serialVersionUID = 1L;

    private String id;

    /**
     * 行李类型编号
     */
    @TableField("type_id")
    private Integer typeId;

    /**
     * 行李类型名称
     */
    @TableField("type_name")
    private String typeName;


    public String getId() {
        return id;
    }

    public Baggage setId(String id) {
        this.id = id;
        return this;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public Baggage setTypeId(Integer typeId) {
        this.typeId = typeId;
        return this;
    }

    public String getTypeName() {
        return typeName;
    }

    public Baggage setTypeName(String typeName) {
        this.typeName = typeName;
        return this;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Baggage{" +
        ", id=" + id +
        ", typeId=" + typeId +
        ", typeName=" + typeName +
        "}";
    }
}
