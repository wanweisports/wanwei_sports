package com.park.platform.service.impl;

import com.park.common.constant.IDBConstant;
import com.park.common.constant.IPlatformConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.ParkBusiness;
import com.park.common.po.UserOperator;
import com.park.platform.dao.IBaseDao;
import com.park.platform.service.IInitService;
import com.park.platform.service.IOperatorService;
import com.park.platform.service.IParkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InitServiceImpl extends BaseService implements IInitService {

	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IParkService parkService;
	
	@Autowired
	private IOperatorService operatorService;
	
	@Override
	public void saveInit(ParkBusiness parkBusiness, UserOperator operator){
		if(parkService.getBusiness() != null) throw new MessageException("场馆已设置！");
		if(operatorService.getOperator(IPlatformConstant.ADMIN) != null) throw new MessageException("管理员已设置！");
		parkService.saveParkBusiness(parkBusiness);
		operator.setOperatorId(IPlatformConstant.ADMIN);
		operator.setOperatorName(IPlatformConstant.ADMIN_NAME);
		operatorService.saveOperator(operator, IDBConstant.ROLE_ADMIN);
	}
	
}
