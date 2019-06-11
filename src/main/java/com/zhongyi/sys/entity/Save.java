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
@TableName("sys_save")
public class Save extends Model<Save> {

    private static final long serialVersionUID = 1L;

    private String id;

    @TableField("save_type_id")
    private Integer saveTypeId;

    @TableField("save_type_name")
    private String saveTypeName;


    public String getId() {
        return id;
    }

    public Save setId(String id) {
        this.id = id;
        return this;
    }

    public Integer getSaveTypeId() {
        return saveTypeId;
    }

    public Save setSaveTypeId(Integer saveTypeId) {
        this.saveTypeId = saveTypeId;
        return this;
    }

    public String getSaveTypeName() {
        return saveTypeName;
    }

    public Save setSaveTypeName(String saveTypeName) {
        this.saveTypeName = saveTypeName;
        return this;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Save{" +
        ", id=" + id +
        ", saveTypeId=" + saveTypeId +
        ", saveTypeName=" + saveTypeName +
        "}";
    }
}
