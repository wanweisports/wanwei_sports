package com.park.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.po.SystemRole;
import com.park.common.po.SystemRoleOperator;
import com.park.dao.IBaseDao;
import com.park.service.IRoleService;

@Service
public class RoleServiceImpl extends BaseService implements IRoleService {
	
	@Autowired
	private IBaseDao baseDao;
	
	@Override
	public SystemRoleOperator getOperatorRole(String operatorId){
		return baseDao.queryByHqlFirst("FROM SystemRoleOperator WHERE id.operatorId = ?", operatorId);
	}
	
	@Override
	public SystemRole getSystemRole(int roleId){
		return baseDao.queryByHqlFirst("FROM SystemRole WHERE roleId = ?", roleId);
	}
	
	@Override
	public List<Map<String, Object>> getRoleNames(int minRoleId){
		return baseDao.queryBySql("SELECT roleId, roleName FROM system_role WHERE roleId >= ?", minRoleId);
	}
	
}
