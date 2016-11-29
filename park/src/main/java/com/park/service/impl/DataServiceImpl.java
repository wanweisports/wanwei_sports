package com.park.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.DataInputView;
import com.park.common.bean.PageBean;
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
	
	@Override
	public Map<String, Object> getSitePercentage(DataInputView dataInputView){
		
		int page = dataInputView.getPage();
		int pageSize = dataInputView.getPageSize();
		
		StringBuilder sql = new StringBuilder("SELECT ss.sportName, si.siteName, SUM(LEFT(TIMEDIFF(siteEndTime, siteStartTime),2)) sumCount");
		sql.append(",SUM(CASE srt.isUse WHEN 2 THEN LEFT(TIMEDIFF(siteEndTime, siteStartTime),2) ELSE 0 END) useCount");
		sql.append(" FROM site_info si, site_sport ss, site_reserve_time srt");
		sql.append(" WHERE si.siteType = ss.sportId AND srt.siteId = si.siteId");
		
		String siteGroup = " GROUP BY si.siteId";
		sql.append(siteGroup);
		List<Map<String, Object>> siteCountList = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
		
		String sportGroup = " GROUP BY ss.sportId";
		List<Map<String, Object>> sportCountList = baseDao.queryBySql(sql.toString().replace(siteGroup, sportGroup), JsonUtils.fromJson(dataInputView));
		
		for(Map<String, Object> map : siteCountList){
			Double sumCount = StrUtil.objToDoubleDef0(map.get("sumCount"));
			Double useCount = StrUtil.objToDoubleDef0(map.get("useCount"));
			map.put("percentage", StrUtil.roundKeepTwo(useCount/sumCount));
		}
		PageBean pageBean = new PageBean(siteCountList, page, pageSize, siteCountList.size());
		pageBean.pagedList().init();
		
		double sumSportUsePercentage = 0;
		int sportCount = 0;
		for(Map<String, Object> map : sportCountList){
			Double sumCount = StrUtil.objToDoubleDef0(map.get("sumCount"));
			Double useCount = StrUtil.objToDoubleDef0(map.get("useCount"));
			double percentage = StrUtil.roundKeepTwo(useCount/sumCount);
			map.put("percentage", percentage);
			sumSportUsePercentage += percentage;
			sportCount++;
		}
		Map<String, Object> allSportCountMap = new HashMap<String, Object>();
		allSportCountMap.put("sportName", "全部");
		allSportCountMap.put("percentage", sumSportUsePercentage/sportCount);
		sportCountList.add(0, allSportCountMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("pageBean", pageBean);
		resultMap.put("sportCountList", sportCountList);
		
		return resultMap;
	}
	
}
