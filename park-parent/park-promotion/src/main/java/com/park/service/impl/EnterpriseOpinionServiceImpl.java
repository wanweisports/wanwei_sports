package com.park.service.impl;

import com.park.common.exception.MessageException;
import com.park.common.po.EnterpriseOpinion;
import com.park.common.util.DateUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IEnterpriseOpinionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EnterpriseOpinionServiceImpl extends BaseService implements IEnterpriseOpinionService {
	
	@Autowired
	private IBaseDao baseDao;
	
	@Override
	public Integer saveOpinion(EnterpriseOpinion enterpriseOpinion) {
		String nowDate = DateUtil.getNowDate();

		if (StrUtil.isBlank(enterpriseOpinion.getName())) {
		    throw new MessageException("请输入您的姓名！");
        }

        if (StrUtil.isBlank(enterpriseOpinion.getMobile())) {
            throw new MessageException("请输入您的手机号！");
        }

        if (StrUtil.isBlank(enterpriseOpinion.getOpinion())) {
            throw new MessageException("请输入您的意见建议！");
        }

        enterpriseOpinion.setCreateTime(nowDate);
        enterpriseOpinion.setName(enterpriseOpinion.getName());
        enterpriseOpinion.setMobile(enterpriseOpinion.getMobile());
        enterpriseOpinion.setOpinion(enterpriseOpinion.getOpinion());
        baseDao.save(enterpriseOpinion, null);

        return enterpriseOpinion.getId();
	}
}



