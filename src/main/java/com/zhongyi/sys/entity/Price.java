package com.zhongyi.sys.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author lqh
 * @since 2019-06-11
 */
@TableName("sys_price")
public class Price extends Model<Price> {

    private static final long serialVersionUID = 1L;

    private String id;

    private BigDecimal price;


    public String getId() {
        return id;
    }

    public Price setId(String id) {
        this.id = id;
        return this;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public Price setPrice(BigDecimal price) {
        this.price = price;
        return this;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Price{" +
        ", id=" + id +
        ", price=" + price +
        "}";
    }
}
