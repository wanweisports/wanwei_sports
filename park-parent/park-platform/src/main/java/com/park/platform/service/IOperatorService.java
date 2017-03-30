package com.park.platform.service;

import com.park.common.bean.DataInputView;
import com.park.common.bean.OperatorInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.out.ReserveInfo;
import com.park.common.po.UserOperator;
import com.park.common.po.UserScheduling;

import java.util.List;
import java.util.Map;

public interface IOperatorService {

	public String saveOperator(UserOperator userOperator, int roleId);
	
	public UserOperator getOperator(String operatorId);
	
	public UserOperator getUserOperator(String id);
	
	public ReserveInfo getOperatorNameInfo(String operatorId);
	
	public PageBean getOperatorList(OperatorInputView operatorInputView);

    public List<Map<String, Object>> getOperatorsName(OperatorInputView operatorInputView);
	
	public Map<String, Object> getEmployee(String operatorId);
	
	public String saveEmployee(UserOperator userOperator, int roleId);
	
	public void updateLockEmployee(String operatorIds, boolean lock);
	
	public void updateProfile(UserOperator operator);
	
	public UserOperator innerLogin(String name);

	public UserOperator userMobileLogin(String mobile);

    public UserOperator userMobileRegister(String mobile, String password);
	
	public void saveLastLoginTime(int id);
	
	public void updatePassword(String oldPwd, String newPwd, String operatorId);
	
	public List<Map<String, Object>> getUserSchedulings(DataInputView dataInputView);
	
	public Integer saveUserScheduling(UserScheduling userScheduling);
	
	public UserScheduling getUserScheduling(int schedulingId);

	// 检测用户名的存在性，根据类型（管理员1，销售员2，客户3）
	public UserOperator checkUserNameExist(String userName, int type);
	
	public UserOperator getUserOperatorByOpenId(String openId);
	
	public UserOperator updateUserOperatorOpenId(String operatorId, String openId);

	public String makeEmployeeNo();
	
}
