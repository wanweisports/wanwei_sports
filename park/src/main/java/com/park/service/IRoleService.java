package com.park.service;

import java.util.List;
import java.util.Map;

import com.park.common.bean.PageBean;
import com.park.common.bean.RoleInputView;
import com.park.common.po.SystemRole;
import com.park.common.po.SystemRoleOperator;

public interface IRoleService {

	public SystemRoleOperator getOperatorRole(String operatorId);
	
	public SystemRole getSystemRole(int roleId);
	
	public List<Map<String, Object>> getRoleNames(int minRoleId);
	
	public PageBean getRoles(RoleInputView roleInputView);
	
	public Map<String, Object> getRolesView(int roleId);
	
}
