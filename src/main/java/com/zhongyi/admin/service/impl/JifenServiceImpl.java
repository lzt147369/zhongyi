package com.zhongyi.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhongyi.admin.entity.Jifen;
import com.zhongyi.admin.mapper.jiFenMapper;
import com.zhongyi.admin.service.JifenService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class JifenServiceImpl extends ServiceImpl<jiFenMapper, Jifen> implements JifenService {




}
