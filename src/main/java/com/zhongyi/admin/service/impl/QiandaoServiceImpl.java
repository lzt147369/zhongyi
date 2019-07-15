package com.zhongyi.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhongyi.admin.entity.Kehu;
import com.zhongyi.admin.entity.Qiandao;
import com.zhongyi.admin.mapper.KehuMapper;
import com.zhongyi.admin.mapper.QiandaoMapper;
import com.zhongyi.admin.service.KehuService;
import com.zhongyi.admin.service.QiandaoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class QiandaoServiceImpl extends ServiceImpl<QiandaoMapper, Qiandao> implements QiandaoService {




}
