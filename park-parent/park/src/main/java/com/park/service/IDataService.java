package com.park.service;

import java.util.List;
import java.util.Map;

import com.park.common.po.OtherCollateInfo;
import org.apache.poi.ss.usermodel.Workbook;

import com.park.common.bean.DataInputView;
import com.park.common.bean.PageBean;

public interface IDataService {

	public List<Map<String, Object>> getMembersRegister(DataInputView dataInputView);
	
	public Map<String, Object> getMembersRegisterNew(DataInputView dataInputView);
	
	public Map<String, Object> getMembersCZNew(DataInputView dataInputView);
	
	public Map<String, Object> getMembersXFNew(DataInputView dataInputView);

    public List<Map<String, Object>> getMembersRegisterStored(DataInputView dataInputView);

	public List<Map<String, Object>> getMembersRegisterGroupDate(DataInputView dataInputView);
	
	public Map<String, Object> countMembersRegister(List<Map<String, Object>> dataList);
	
	public Map<String, Object> getSitePercentage(DataInputView dataInputView)throws Exception;
	
	public PageBean getDataMembersAttendance(DataInputView dataInputView);
	
	public Map<String, Object> getBusinessIncome(DataInputView dataInputView);
	
	public String getCountSql(Integer countItem, String field);
	
	public Workbook exportBusinessIncome(DataInputView dataInputView);
	
	public PageBean getOtherBalances(DataInputView dataInputView);
	
	public Map<String, Object> getOtherBalancesCount(DataInputView dataInputView);
	
	public Map<String, Object> getMobileBusinessIncome(DataInputView dataInputView);
	
	public Map<String, Object> getBusinessSiteCount(DataInputView dataInputView);
	
	public Map<String, Object> getBusinessSiteSignCount(DataInputView dataInputView);

	public void saveCollateInfo(OtherCollateInfo otherCollateInfo);

	public List<OtherCollateInfo> getCollateInfos(DataInputView dataInputView);

	public Map<String, Object> getCollateInfosMap(DataInputView dataInputView);
	
}
