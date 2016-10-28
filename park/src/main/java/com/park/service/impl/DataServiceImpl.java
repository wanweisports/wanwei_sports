package com.park.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.DataInputView;
import com.park.dao.IBaseDao;
import com.park.service.IDataService;

@Service
public class DataServiceImpl extends BaseService implements IDataService {

	@Autowired
	private IBaseDao baseDao;
	
	@Override
	public List<Map<String, Object>> getMembersRegister(DataInputView dataInputView){
		Integer countNum = dataInputView.getCountNum();
		
		StringBuffer sql = new StringBuffer("SELECT mct.cardTypeName, mct.cardTypeMoney, COUNT(1) count, COUNT(1)*mct.cardTypeMoney countMoney FROM member_card mc, member_card_type mct");
		sql.append(" WHERE mc.cardTypeId = mct.cardTypeId");
		sql.append(getCountSql(countNum, "mc.createTime"));
		sql.append(" GROUP BY mc.cardTypeId");
		return baseDao.queryBySql(sql.toString());
	}
	
	private String getCountSql(Integer countNum, String field) {
		countNum = countNum != null ? countNum : 1;
		switch (countNum) {
		case 2: //昨日
			return " AND DATE_FORMAT(adddate("+field+",-1), '%Y-%m-%d') = CURDATE()";
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
