package com.park.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.DataInputView;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IDataService;

@Service
public class DataServiceImpl extends BaseService implements IDataService {

	@Autowired
	private IBaseDao baseDao;
	
	@Override
	public List<Map<String, Object>> getMembersRegister(DataInputView dataInputView){
		Integer countNum = dataInputView.getCountNum();
		String createTimeStart = dataInputView.getCreateTimeStart();
		String createTimeEnd = dataInputView.getCreateTimeEnd();
		
		StringBuffer sql = new StringBuffer("SELECT mct.cardTypeName, mct.cardTypeMoney, COUNT(mc.cardId) count, COUNT(mc.cardId)*mct.cardTypeMoney countMoney FROM member_card_type mct");
		sql.append(" LEFT JOIN member_card mc ON(mc.cardTypeId = mct.cardTypeId");
		if(StrUtil.isNotBlank(createTimeStart)){
			sql.append(" AND DATE(mc.createTime) >= :createTimeStart");
		}
		if(StrUtil.isNotBlank(createTimeEnd)){
			sql.append(" AND DATE(mc.createTime) <= :createTimeEnd");
		}
		sql.append(getCountSql(countNum, "mc.createTime"));
		sql.append(") GROUP BY mct.cardTypeId");
		return baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
	}
	
	@Override
	public Map<String, Object> countMembersRegister(List<Map<String, Object>> dataList){
		int sumCount = 0;
		double sumCountMoney = 0.0;
		if(dataList.size() > 0){
			for (Map<String, Object> map : dataList) {
				sumCount += StrUtil.objToInt(map.get("count"));
				sumCountMoney += StrUtil.objToDouble(map.get("countMoney"));
			}
		}
		Map<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("sumCount", sumCount);
		countMap.put("sumCountMoney", sumCountMoney);
		countMap.put("list", dataList);
		return countMap;
	}
	
	private String getCountSql(Integer countNum, String field) {
		countNum = countNum != null ? countNum : 1;
		switch (countNum) {
		case 2: //昨日
			return " AND DATE_FORMAT("+field+", '%Y-%m-%d') = adddate(CURDATE(), -1)";
		case 3: //本周
			return " AND YEARWEEK("+field+") = YEARWEEK(CURDATE())";
		case 4: //本月
			return " AND DATE_FORMAT("+field+", '%Y-%m') = DATE_FORMAT(CURDATE(), '%Y-%m')";
		case 1: //今日
		default:
			return " AND DATE_FORMAT("+field+", '%Y-%m-%d') = CURDATE()";
		}
	}
	
}
