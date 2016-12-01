package com.park.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.DataInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IDBConstant;
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
	
	@Override
	public Map<String, Object> getBusinessIncome(DataInputView dataInputView){
		dataInputView.setBalanceStyle1(IDBConstant.BALANCE_STYLE_XJ);
		dataInputView.setBalanceStyle2(IDBConstant.BALANCE_STYLE_ZFB);
		dataInputView.setBalanceStyle3(IDBConstant.BALANCE_STYLE_WX);
		dataInputView.setDictName(IDBConstant.BALANCE_SERVICE_TYPE);
		
		StringBuilder sql = new StringBuilder("SELECT ob.balanceId, mct.cardTypeName name,").append(countCardSql());
		sql.append(" FROM other_balance ob, member_card mc, member_card_type mct");
		sql.append(" WHERE ob.balanceServiceId = mc.cardId AND mc.cardTypeId = mct.cardTypeId AND ob.balanceServiceType >= :balanceServiceTypeMin AND ob.balanceServiceType <= :balanceServiceTypeMax");
		sql.append(" GROUP BY mct.cardTypeId");
		dataInputView.setBalanceServiceTypeMin(IDBConstant.BALANCE_SERVICE_TYPE_REG);
		dataInputView.setBalanceServiceTypeMax(IDBConstant.BALANCE_SERVICE_TYPE_CARD_BUBAN_STUDENT);
		List<Map<String, Object>> cardCounts = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
		
		sql.setLength(0);
		sql.append("SELECT ob.balanceId, (SELECT dictValue FROM system_dict WHERE dictName=:dictName AND dictKey = oi.orderServiceType) name, ").append(countBalanceSql());
		sql.append(" FROM other_balance ob, order_info oi");
		sql.append(" WHERE ob.balanceServiceId = oi.orderId AND ob.balanceServiceType >= :balanceServiceTypeMin AND ob.balanceServiceType <= :balanceServiceTypeMax");
		sql.append(" GROUP BY ob.balanceServiceType");
		dataInputView.setBalanceServiceTypeMin(IDBConstant.BALANCE_SERVICE_TYPE_SITE);
		dataInputView.setBalanceServiceTypeMax(IDBConstant.BALANCE_SERVICE_TYPE_SITE_RECEIVABLE);
		List<Map<String, Object>> siteCounts = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
		
		dataInputView.setBalanceServiceTypeMin(IDBConstant.BALANCE_SERVICE_TYPE_GOODS);
		dataInputView.setBalanceServiceTypeMax(IDBConstant.BALANCE_SERVICE_TYPE_GOODS);
		List<Map<String, Object>> goodsCounts = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("cardCounts", countSum(cardCounts));
		resultMap.put("siteCounts", countSum(siteCounts));
		resultMap.put("goodsCounts", countSum(goodsCounts));
		
		return resultMap;
	}
	
	private Map<String, Object> countSum(List<Map<String, Object>> countList){
		double xianjinSumPrice = 0, zhifubaoSumPrice = 0, weixinSumPrice = 0, sumPrice = 0;
		for(Map<String, Object> map : countList){
			Double xianjin = StrUtil.objToDoubleDef0(map.get("xianjin"));
			Double zhifubao = StrUtil.objToDoubleDef0(map.get("zhifubao"));
			Double weixin = StrUtil.objToDoubleDef0(map.get("weixin"));
			xianjinSumPrice += xianjin;
			zhifubaoSumPrice += zhifubao;
			weixinSumPrice += weixin;
			sumPrice += xianjin;
			sumPrice += zhifubao;
			sumPrice += weixin;
			map.put("sumPrice", xianjin+zhifubao+weixin);
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("countList", countList);
		resultMap.put("xianjinSumPrice", xianjinSumPrice);
		resultMap.put("zhifubaoSumPrice", zhifubaoSumPrice);
		resultMap.put("weixinSumPrice", weixinSumPrice);
		resultMap.put("sumPrice", sumPrice);
		return resultMap; 
		
	}
	
	private String countBalanceSql(){
		return "(SELECT SUM(realAmount) FROM other_balance WHERE balanceServiceType = ob.balanceServiceType AND balanceStyle = :balanceStyle1) xianjin, (SELECT SUM(realAmount) FROM other_balance WHERE balanceServiceType = ob.balanceServiceType AND balanceStyle = :balanceStyle2) zhifubao, (SELECT SUM(realAmount) FROM other_balance WHERE balanceServiceType = ob.balanceServiceType AND balanceStyle = :balanceStyle3) weixin";
	}
	
	private String countCardSql(){
		return "(SELECT SUM(realAmount) FROM other_balance ob, member_card mc1 WHERE ob.balanceServiceId = mc1.cardId AND mct.cardTypeId =mc1.cardTypeId AND balanceServiceType = ob.balanceServiceType AND balanceStyle = :balanceStyle1) xianjin, (SELECT SUM(realAmount) FROM other_balance ob, member_card mc1 WHERE ob.balanceServiceId = mc1.cardId AND mct.cardTypeId =mc1.cardTypeId AND balanceServiceType = ob.balanceServiceType AND balanceStyle = :balanceStyle2) zhifubao, (SELECT SUM(realAmount) FROM other_balance ob, member_card mc1 WHERE ob.balanceServiceId = mc1.cardId AND mct.cardTypeId =mc1.cardTypeId AND balanceServiceType = ob.balanceServiceType AND balanceStyle = :balanceStyle3) weixin";
	}
	
}
