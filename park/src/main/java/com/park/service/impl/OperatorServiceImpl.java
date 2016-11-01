package com.park.service.impl;

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
import com.park.common.util.DateUtil;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IOperatorService;
import com.park.service.IRoleService;

@Service
public class OperatorServiceImpl extends BaseService implements IOperatorService {

	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IRoleService roleService;
	
	@Override
	public String saveOperator(UserOperator userOperator, int roleId){
		SystemRole systemRole = roleService.getSystemRole(roleId);
		if(systemRole == null) throw new MessageException("角色不存在");
		if(!IDBConstant.LOGIC_STATUS_YES.equals(systemRole.getRoleStatus())) throw new MessageException("角色不可用");
		if(userOperator.getId() == null){
			if(getOperator(userOperator.getOperatorId()) != null) throw new MessageException("登录账户重复，请重新");
			userOperator.setOperatorPwd("123456"); //密码暂时设置为123456
			userOperator.setCreateTime(DateUtil.getNowDate());
			userOperator.setStatus(IDBConstant.LOGIC_STATUS_YES);
		}
		baseDao.save(userOperator, userOperator.getId());
		
		//删除之前的角色
		SystemRoleOperator operatorRole = roleService.getOperatorRole(userOperator.getOperatorId());
		if(operatorRole != null) baseDao.delete(operatorRole);
		
		SystemRoleOperator systemRoleOperator = new SystemRoleOperator(new SystemRoleOperatorId(roleId, userOperator.getOperatorId()));
		baseDao.save(systemRoleOperator, null);
		return userOperator.getOperatorId();
	}
	
	@Override
	public UserOperator getOperator(String operatorId){
		return baseDao.queryByHqlFirst("FROM UserOperator WHERE operatorId = ?", operatorId);
	}
	
	@Override
	public UserOperator getUserOperator(String id) {
		return baseDao.getToEvict(UserOperator.class, id);
	}
	
	@Override
	public ReserveInfo getOperatorNameInfo(String operatorId){
		/*UserOperator operator = getOperator(operatorId);
		SystemRoleOperator systemRoleOperator = getSystemRoleOperator(operatorId);
		ReserveInfo reserveInfo = new ReserveInfo();
		reserveInfo.setOperatorId(operatorId);
		reserveInfo.setOperatorName(operator.getOperatorName());
		reserveInfo.setOperatorMobile(operator.getOperatorMobile());
		reserveInfo.setOpType(StrUtil.objToStr(systemRoleOperator.getId().getRoleId()));
		return reserveInfo;*/
		return null;
	}
	
	@Override
	public PageBean getOperatorList(OperatorInputView operatorInputView){
		String roleId = operatorInputView.getRoleId();
		String status = operatorInputView.getStatus();
		
		StringBuilder headSql = new StringBuilder("SELECT uo.operatorNo, uo.operatorId, uo.operatorName, sr.roleName, uo.operatorEffectDate, uo.operatorEndDate, uo.status");
		StringBuilder bodySql = new StringBuilder(" FROM user_operator uo, system_role_operator sro, system_role sr");
		StringBuilder whereSql = new StringBuilder(" WHERE uo.operatorId = sro.operatorId AND sro.roleId = sr.roleId");
		whereSql.append(" AND sr.roleId >= ").append(IDBConstant.ROLE_EMPLOYEE);
		if(StrUtil.isNotBlank(status)){
			whereSql.append(" AND uo.status = :status");
		}
		if(StrUtil.isNotBlank(roleId)){
			whereSql.append(" AND sro.roleId = :roleId");
		}
		return super.getPageBean(headSql, bodySql, whereSql, operatorInputView);
	}
	
	@Override
	public Map<String, Object> getEmployee(String operatorId){
		UserOperator operator = getOperator(operatorId);
		if(operator == null) throw new MessageException("用户不存在");
		SystemRoleOperator operatorRole = roleService.getOperatorRole(operatorId);
		Integer roleId = operatorRole.getId().getRoleId();
		if(roleId < IDBConstant.ROLE_EMPLOYEE) throw new MessageException("操作错误");
		Map<String, Object> operatorMap = JsonUtils.fromJson(operator);
		operatorMap.put("roleId", roleId);
		return operatorMap;
	}
	
	@Override
	public String saveEmployee(UserOperator operator, int roleId){
		if(roleId < IDBConstant.ROLE_EMPLOYEE) throw new MessageException("操作错误");
		if(operator.getId() != null){
			UserOperator operatorDB = getOperator(operator.getOperatorId());
			operatorDB.setOperatorNo(operator.getOperatorNo());
			operatorDB.setOperatorName(operator.getOperatorName());
			operatorDB.setOperatorBirthday(operator.getOperatorBirthday());
			operatorDB.setOperatorContact(operator.getOperatorContact());
			operatorDB.setOperatorMobile(operator.getOperatorMobile());
			operatorDB.setOperatorEffectDate(operator.getOperatorEffectDate());
			operatorDB.setOperatorEndDate(operator.getOperatorEndDate());
			operatorDB.setOperatorAddress(operator.getOperatorAddress());
			operatorDB.setUpdateTime(DateUtil.getNowDate());
			return saveOperator(operatorDB, roleId);
		}
		return saveOperator(operator, roleId);
	}
	
	@Override
	public void updateProfile(UserOperator operator){
		UserOperator operatorDB = getOperator(operator.getOperatorId());
		operatorDB.setOperatorName(operator.getOperatorName());
		operatorDB.setOperatorBirthday(operator.getOperatorBirthday());
		operatorDB.setOperatorMobile(operator.getOperatorMobile());
		operatorDB.setOperatorAddress(operator.getOperatorAddress());
		operatorDB.setOperatorSex(operator.getOperatorSex());
		operatorDB.setUpdateTime(DateUtil.getNowDate());
		baseDao.save(operatorDB, operatorDB.getId());
	}
	
	@Override
	public void updateLockEmployee(String operatorIds, boolean lock){
		if(StrUtil.isBlank(operatorIds)) throw new MessageException("请选择员工");
		String[] operatorIdArr = operatorIds.split(",");
		for(String operatorId : operatorIdArr){
			SystemRoleOperator operatorRole = roleService.getOperatorRole(operatorId);
			if(operatorRole.getId().getRoleId() < IDBConstant.ROLE_EMPLOYEE) throw new MessageException("操作错误");
			UserOperator operator = getOperator(operatorId);
			operator.setStatus(lock ? IDBConstant.LOGIC_STATUS_NO : IDBConstant.LOGIC_STATUS_YES);
			baseDao.save(operator, operatorId);
		}
	}
	
	@Override
	public UserOperator innerLogin(String name){
		return JsonUtils.fromJson(baseDao.queryBySqlFirst("SELECT * FROM user_operator WHERE operatorId = ?", name), UserOperator.class);
	}
	
	@Override
	public void saveLastLoginTime(int id){
		baseDao.updateBySql("UPDATE user_operator SET lastLoginTime = ? WHERE id = ?", DateUtil.getNowDate(), id);
	}
	
	@Override
	public void updatePassword(String oldPwd, String newPwd, String operatorId){
		UserOperator operator = getOperator(operatorId);
		if(!oldPwd.equals(operator.getOperatorPwd())) throw new MessageException("原密码错误");
		operator.setOperatorPwd(newPwd);
		baseDao.save(operator, operator.getId());
	}
	
}
