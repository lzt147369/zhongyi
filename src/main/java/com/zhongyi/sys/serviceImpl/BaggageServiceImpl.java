package com.zhongyi.sys.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhongyi.sys.entity.Baggage;
import com.zhongyi.sys.mapper.BaggageMapper;
import com.zhongyi.sys.service.IBaggageService;
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
public class BaggageServiceImpl extends ServiceImpl<BaggageMapper, Baggage> implements IBaggageService {

}
