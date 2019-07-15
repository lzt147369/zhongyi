package com.zhongyi.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhongyi.admin.entity.Kehu;
import com.zhongyi.admin.entity.QiandaoDetail;
import com.zhongyi.admin.mapper.KehuMapper;
import com.zhongyi.admin.mapper.QiandaoDetailMapper;
import com.zhongyi.admin.service.KehuService;
import com.zhongyi.admin.service.QiandaoDetailService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class QiandaoDetailServiceImpl extends ServiceImpl<QiandaoDetailMapper, QiandaoDetail> implements QiandaoDetailService {




}
