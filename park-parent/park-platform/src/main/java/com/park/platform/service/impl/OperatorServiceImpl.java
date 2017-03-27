package com.park.platform.service.impl;

import com.park.common.bean.DataInputView;
import com.park.common.bean.OperatorInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.out.ReserveInfo;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.*;
import com.park.common.util.DateUtil;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.platform.dao.IBaseDao;
import com.park.platform.service.IDataService;
import com.park.platform.service.IOperatorService;
import com.park.platform.service.IParkService;
import com.park.platform.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OperatorServiceImpl extends BaseService implements IOperatorService {

	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IRoleService roleService;
	
	@Autowired
	private IParkService parkService;
	
	@Autowired
	private IDataService dataService;
	
	@Override
	public String saveOperator(UserOperator userOperator, int roleId){
		SystemRole systemRole = roleService.getSystemRole(roleId);
		if(systemRole == null) throw new MessageException("角色不存在");
		if(!IDBConstant.LOGIC_STATUS_YES.equals(systemRole.getRoleStatus())) throw new MessageException("角色不可用");
		if(userOperator.getId() == null){
			if(getOperator(userOperator.getOperatorId()) != null) throw new MessageException("登录账户重复，请重新");
			if(StrUtil.isBlank(userOperator.getOperatorPwd())){
				userOperator.setOperatorPwd("123456"); //密码暂时设置为123456
			}
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
    public List<Map<String, Object>> getOperatorsName(OperatorInputView operatorInputView) {
        String status = operatorInputView.getStatus();

        StringBuilder sql = new StringBuilder("SELECT uo.id, uo.operatorNo, uo.operatorId, uo.operatorName, sr.roleName, uo.operatorEffectDate, uo.operatorEndDate, uo.status");
        sql.append(" FROM user_operator uo, system_role_operator sro, system_role sr");
        sql.append(" WHERE uo.operatorId = sro.operatorId AND sro.roleId = sr.roleId");
        sql.append(" AND sr.roleId >= ").append(IDBConstant.ROLE_EMPLOYEE);

        if(StrUtil.isNotBlank(status)){
            sql.append(" AND uo.status = :status");
        }
        return baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(operatorInputView));
    }
	
	@Override
	public Map<String, Object> getEmployee(String operatorId){
		UserOperator operator = getOperator(operatorId);
		if(operator == null) throw new MessageException("员工不存在");
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
		}else { //新建员工不能超过安装点数
			ParkBusiness business = parkService.getBusiness();
			if(business == null) throw new MessageException("请先初始化场馆信息！");
			Integer points = business.getPoints();
			if(points != null && points > 0){
				if(getEmployeeCount() >= points) throw new MessageException("添加员工数量已超过上线，请联系管理员！");
			}
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
	public UserOperator userMobileLogin(String mobile){
		return JsonUtils.fromJson(baseDao.queryBySqlFirst("SELECT * FROM user_operator WHERE operatorMobile = ?", mobile), UserOperator.class);
	}

    @Override
    public UserOperator userMobileRegister(String mobile, String password){
        return JsonUtils.fromJson(baseDao.queryBySqlFirst("SELECT * FROM user_operator WHERE operatorMobile = ?", mobile), UserOperator.class);
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
	
	@Override
	public List<Map<String, Object>> getUserSchedulings(DataInputView dataInputView){
		
		Integer countNum = dataInputView.getCountNum();
		String createTimeStart = dataInputView.getCreateTimeStart();
		String createTimeEnd = dataInputView.getCreateTimeEnd();
		
		StringBuilder sql = new StringBuilder("SELECT us.*, DATE_FORMAT(us.date, '%w') as 'operatorWeek', uo1.operatorName, DATE_FORMAT(NOW(), '%Y-%m-%d') as 'today'");
		sql.append(" FROM user_scheduling us, user_operator uo1");
		sql.append(" WHERE us.operatorId = uo1.operatorId");
		if(StrUtil.isNotBlank(createTimeStart)){
			sql.append(" AND DATE(us.date) >= :createTimeStart");
		}
		if(StrUtil.isNotBlank(createTimeEnd)){
			sql.append(" AND DATE(us.date) <= :createTimeEnd");
		}
		if (countNum != null) {
			sql.append(dataService.getCountSql(countNum, "us.date"));
		}
		sql.append(" ORDER BY date, startTime");
		
		List<Map<String, Object>> list = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
        Map<String, Object> businessTime = parkService.getBusinessTime();
		String datePre = null;
		List<Map<String, Object>> listGroup = new ArrayList<Map<String, Object>>();
		for(Map<String, Object> map : list){
			String date = StrUtil.objToStr(map.get("date"));
			String today = StrUtil.objToStr(map.get("today"));

			map.put("today", today);

			int week = StrUtil.objToInt(map.get("operatorWeek"));
			String[] weeks = new String[]{"周日", "周一", "周二", "周三", "周四", "周五", "周六"};

			String startTime = StrUtil.objToStr(map.get("startTime"));
			String businessStartTime = StrUtil.objToStr(businessTime.get("businessStartTime"));
            String endTime = StrUtil.objToStr(map.get("endTime"));
            String businessEndTime = StrUtil.objToStr(businessTime.get("businessEndTime"));
            int startCount = (StrUtil.objToInt(startTime.substring(0,2)) - StrUtil.objToInt(businessStartTime.substring(0,2))) * 2 +
                    StrUtil.objToInt(startTime.substring(3,5)) / 30;
            int endCount = (StrUtil.objToInt(endTime.substring(0,2)) - StrUtil.objToInt(businessStartTime.substring(0,2))) * 2 +
                    StrUtil.objToInt(endTime.substring(3,5)) / 30;
            int compareCount = endCount - startCount;
            int totalCount = (StrUtil.objToInt(businessEndTime.substring(0,2)) - StrUtil.objToInt(businessStartTime.substring(0,2))) * 2;

            map.put("startCount", startCount);
            map.put("endCount", endCount);
            map.put("compareCount", compareCount);
            map.put("totalCount", totalCount);

			if(!date.equals(datePre)){
				Map<String, Object> mapGroup = new HashMap<String, Object>();
				mapGroup.put("date", date);
                mapGroup.put("today", today);
				mapGroup.put("week", weeks[week]);
				List timeList = new ArrayList();
				timeList.add(((HashMap)map).clone());
				mapGroup.put("schedule", timeList);
				listGroup.add(mapGroup);
				datePre = date;
			}else{
				Map<String, Object> mapGroup = getGroupMap(listGroup, date);
				List timeList = (List)mapGroup.get("schedule");
				timeList.add(((HashMap)map).clone());
			}
		}
		return listGroup;
	}
	
	private Map getGroupMap(List<Map<String, Object>> listGroup, String date){
		for(Map<String, Object> map : listGroup){
			if(date.equals(map.get("date"))){
				return map;
			}
		}
		return null;
	}
	
	@Override
	public Integer saveUserScheduling(UserScheduling userScheduling){
		Integer schedulingId = userScheduling.getSchedulingId();
		String nowDate = DateUtil.getNowDate();
		if(getEmployee(userScheduling.getOperatorId()) == null) throw new MessageException("值班员工不存在");
		if(schedulingId == null){
			userScheduling.setCreateTime(nowDate);
			baseDao.save(userScheduling, null);
			return userScheduling.getSchedulingId();
		}
		UserScheduling userSchedulingDB = getUserScheduling(schedulingId);
		userSchedulingDB.setUpdateTime(nowDate);
		userSchedulingDB.setDate(userScheduling.getDate());
		userSchedulingDB.setOperatorId(userScheduling.getOperatorId());
		userSchedulingDB.setSchedulingJob(userScheduling.getSchedulingJob());
		userSchedulingDB.setStartTime(userScheduling.getStartTime());
		userSchedulingDB.setEndTime(userScheduling.getEndTime());
		userSchedulingDB.setSalesId(userScheduling.getSalesId());
		baseDao.save(userSchedulingDB, schedulingId);
		return schedulingId;
	}
	
	@Override
	public UserScheduling getUserScheduling(int schedulingId){
		return baseDao.getToEvict(UserScheduling.class, schedulingId);
	}
	
	private int getEmployeeCount(){
		return baseDao.getUniqueResult("SELECT COUNT(1) FROM user_operator").intValue();
	}

	@Override
	public UserOperator checkUserNameExist(String userName, int type) {
		return JsonUtils.fromJson(baseDao.queryBySqlFirst("SELECT * FROM user_operator WHERE operatorId = ? AND operatorType = ?", userName, type), UserOperator.class);
	}
	
	@Override
	public UserOperator getUserOperatorByOpenId(String openId){
		return baseDao.queryByHqlFirst("FROM UserOperator WHERE openId = ?", openId);
	}
	
	@Override
	public UserOperator updateUserOperatorOpenId(String operatorId, String openId){
		UserOperator userOperator = getOperator(operatorId);
		userOperator.setOpenId(openId);
		baseDao.save(userOperator, operatorId);
		return userOperator;
	}
	
}
