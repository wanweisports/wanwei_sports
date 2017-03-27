package com.park.platform.service;

import com.park.common.bean.PageBean;
import com.park.common.bean.RoleInputView;
import com.park.common.po.SystemMenu;
import com.park.common.po.SystemRole;
import com.park.common.po.SystemRoleOperator;

import java.util.List;
import java.util.Map;

public interface IRoleService {

	public SystemRoleOperator getOperatorRole(String operatorId);
	
	public SystemRole getSystemRole(int roleId);
	
	public List<Map<String, Object>> getRoleNames(int minRoleId);
	
	public PageBean getRoles(RoleInputView roleInputView);
	
	public Map<String, Object> getRolesView(int roleId);
	
	public Map<String, Object> getAllRoles(int roleId);
	
	public List<SystemMenu> getRoleMenus(int roleId);
	
	public Integer saveRole(SystemRole systemRole, String menuIds);
	
}
