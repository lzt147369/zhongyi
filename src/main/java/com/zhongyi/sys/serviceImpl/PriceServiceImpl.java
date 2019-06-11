package com.zhongyi.sys.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhongyi.sys.entity.Price;
import com.zhongyi.sys.mapper.PriceMapper;
import com.zhongyi.sys.service.IPriceService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lqh
 * @since 2019-06-11
 */
@Service
public class PriceServiceImpl extends ServiceImpl<PriceMapper, Price> implements IPriceService {

}
