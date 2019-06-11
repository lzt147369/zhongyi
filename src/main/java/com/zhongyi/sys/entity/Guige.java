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
@TableName("sys_guige")
public class Guige extends Model<Guige> {

    private static final long serialVersionUID = 1L;

    private String id;

    @TableField("guige_type_id")
    private Integer guigeTypeId;

    @TableField("guige_type_name")
    private Integer guigeTypeName;


    public String getId() {
        return id;
    }

    public Guige setId(String id) {
        this.id = id;
        return this;
    }

    public Integer getGuigeTypeId() {
        return guigeTypeId;
    }

    public Guige setGuigeTypeId(Integer guigeTypeId) {
        this.guigeTypeId = guigeTypeId;
        return this;
    }

    public Integer getGuigeTypeName() {
        return guigeTypeName;
    }

    public Guige setGuigeTypeName(Integer guigeTypeName) {
        this.guigeTypeName = guigeTypeName;
        return this;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Guige{" +
        ", id=" + id +
        ", guigeTypeId=" + guigeTypeId +
        ", guigeTypeName=" + guigeTypeName +
        "}";
    }
}
