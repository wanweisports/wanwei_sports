package com.park.service;

import java.util.Map;

import com.park.common.bean.OperatorInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.out.ReserveInfo;
import com.park.common.po.UserOperator;

public interface IOperatorService {

	public String saveOperator(UserOperator userOperator, int roleId);
	
	public UserOperator getOperator(String operatorId);
	
	public UserOperator getUserOperator(String id);
	
	public ReserveInfo getOperatorNameInfo(String operatorId);
	
	public PageBean getOperatorList(OperatorInputView operatorInputView);
	
	public Map<String, Object> getEmployee(String operatorId);
	
	public String saveEmployee(UserOperator userOperator, int roleId);
	
	public void updateLockEmployee(String operatorId, boolean lock);
	
	public UserOperator innerLogin(String name);
	
}
