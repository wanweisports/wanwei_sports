package com.park.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.OperatorInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.out.ReserveInfo;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.SystemRole;
import com.park.common.po.SystemRoleOperator;
import com.park.common.po.SystemRoleOperatorId;
import com.park.common.po.UserOperator;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IMemberService;
import com.park.service.IOperatorService;

@Service
public class OperatorServiceImpl extends BaseService implements IOperatorService {

	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IMemberService memberService;
	
	@Override
	public String saveOperator(UserOperator userOperator, int roleId){
		SystemRole systemRole = getSystemRole(roleId);
		if(systemRole == null) throw new MessageException("角色不存在");
		if(!IDBConstant.LOGIC_STATUS_YES.equals(systemRole.getRoleStatus())) throw new MessageException("角色不可用");
		baseDao.save(userOperator, null);
		
		SystemRoleOperator systemRoleOperator = new SystemRoleOperator(new SystemRoleOperatorId(roleId, userOperator.getOperatorId()));
		baseDao.save(systemRoleOperator, null);
		return userOperator.getOperatorId();
	}
	
	@Override
	public SystemRole getSystemRole(int roleId){
		return baseDao.queryByHqlFirst("FROM SystemRole WHERE roleId = ?", roleId);
	}
	
	@Override
	public UserOperator getOperator(String operatorId){
		return baseDao.queryByHqlFirst("FROM UserOperator WHERE operatorId = ?", operatorId);
	}
	
	@Override
	public SystemRoleOperator getSystemRoleOperator(String operatorId){
		return baseDao.queryByHqlFirst("FROM SystemRoleOperator WHERE operatorId = ?", operatorId);
	}
	
	@Override
	public UserOperator getUserOperator(String id) {
		return baseDao.getToEvict(UserOperator.class, id);
	}
	
	@Override
	public ReserveInfo getOperatorNameInfo(String operatorId){
		UserOperator operator = getOperator(operatorId);
		SystemRoleOperator systemRoleOperator = getSystemRoleOperator(operatorId);
		ReserveInfo reserveInfo = new ReserveInfo();
		reserveInfo.setOperatorId(operatorId);
		reserveInfo.setOperatorName(operator.getOperatorName());
		reserveInfo.setOperatorMobile(operator.getOperatorMobile());
		reserveInfo.setOpType(StrUtil.objToStr(systemRoleOperator.getId().getRoleId()));
		return reserveInfo;
	}
	
	@Override
	public PageBean getOperatorList(OperatorInputView operatorInputView){
		StringBuilder headSql = new StringBuilder("SELECT uo.operatorNo, uo.operatorId, uo.operatorName, sr.roleName, uo.operatorEffectDate, uo.operatorEndDate, uo.status");
		StringBuilder bodySql = new StringBuilder(" FROM user_operator uo, system_role_operator sro, system_role sr");
		StringBuilder whereSql = new StringBuilder(" WHERE uo.operatorId = sro.operatorId AND sro.roleId = sr.roleId");
		whereSql.append(" AND sr.roleId >= ").append(IDBConstant.ROLE_EMPLOYEE);
		return super.getPageBean(headSql, bodySql, whereSql, operatorInputView);
	}
	
}
