package com.park.service;

import com.park.common.bean.OperatorInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.out.ReserveInfo;
import com.park.common.po.SystemRole;
import com.park.common.po.SystemRoleOperator;
import com.park.common.po.UserOperator;

public interface IOperatorService {

	public String saveOperator(UserOperator userOperator, int roleId);
	
	public SystemRole getSystemRole(int roleId);
	
	public UserOperator getOperator(String operatorId);
	
	public SystemRoleOperator getSystemRoleOperator(String operatorId);
	
	public UserOperator getUserOperator(String id);
	
	public ReserveInfo getOperatorNameInfo(String operatorId);
	
	public PageBean getOperatorList(OperatorInputView operatorInputView);
	
}
