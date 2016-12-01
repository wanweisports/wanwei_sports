package com.park.service;

import java.util.List;
import java.util.Map;

import com.park.common.bean.DataInputView;

public interface IDataService {

	public List<Map<String, Object>> getMembersRegister(DataInputView dataInputView);
	
	public Map<String, Object> countMembersRegister(List<Map<String, Object>> dataList);
	
	public Map<String, Object> getSitePercentage(DataInputView dataInputView);
	
	public Map<String, Object> getBusinessIncome(DataInputView dataInputView);
	
}
