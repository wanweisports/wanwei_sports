package com.park.service.impl;

import com.park.common.bean.DataInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.SiteInputView;
import com.park.common.constant.IDBConstant;
import com.park.common.constant.IPlatformConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.OtherCollateInfo;
import com.park.common.util.DateUtil;
import com.park.common.util.JsonUtils;
import com.park.common.util.SQLUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IDataService;
import com.park.service.IParkService;
import com.park.service.ISiteService;
import com.park.service.IXlsExportImportService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.*;

import static com.park.common.constant.IPlatformConstant.*;

@Service
public class DataServiceImpl extends BaseService implements IDataService {

	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IXlsExportImportService xlsExportImportService;
	
	@Autowired
	private IParkService parkService;

	@Autowired
	private ISiteService siteService;
    
    @Override
    public Map<String, Object> getMembersRegisterNew(DataInputView dataInputView){
    	Integer countNum = dataInputView.getCountNum();
    	
    	dataInputView = getDataCountTime(dataInputView, countNum);
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	List<String> titleList = new ArrayList<String>();
    	
    	StringBuilder sql = new StringBuilder("SELECT mct.cardTypeName, COUNT(mc.cardTypeId) count");
    	
    	int num = 0;
    	if(countNum == IDBConstant.DATA_DATE_MONTH){ //本月
    		titleList.add("本月");
    		String yearMonth = DateUtil.dateToString(new Date(), DateUtil.YYYYMM);
    		num = DateUtil.getCurrentMonthDay();
    		for (int i = 0; i < num; i++) {
    			sql.append(" ,(SELECT COUNT(1) FROM member_card_type mct1 LEFT JOIN member_card mc1 ON(mct1.cardTypeId = mc1.cardTypeId) LEFT JOIN user_member um1 ON(mc1.memberId = um1.memberId) WHERE mct1.cardTypeId = mct.cardTypeId AND DATE_FORMAT(mc1.createTime, '%Y-%m%e')='").append(yearMonth).append(i+1).append("') d"+i);
	    		titleList.add(DateUtil.getDayName(i));
    		}
    		dataInputView.setCreateTimeStart(DateUtil.getTimesMonthmorning());
    		dataInputView.setCreateTimeEnd(DateUtil.getTimesMonthnight());
    	} else if(countNum == IDBConstant.DATA_DATE_YEAR){ //本年
    		titleList.add("本年");
    		String year = DateUtil.dateToString(new Date(), DateUtil.YYYY);
    		num = 12;
	    	for (int i = 0; i < num; i++) {
	    		sql.append(" ,(SELECT COUNT(1) FROM member_card_type mct1 LEFT JOIN member_card mc1 ON(mct1.cardTypeId = mc1.cardTypeId) LEFT JOIN user_member um1 ON(mc1.memberId = um1.memberId) WHERE mct1.cardTypeId = mct.cardTypeId AND DATE_FORMAT(mc1.createTime, '%Y%c')='").append(year).append(i+1).append("') d"+i);
	    		titleList.add(DateUtil.getMonthName(i));
	    	}
	    	dataInputView.setCreateTimeStart(DateUtil.getCurrentYearEndTime());
    		dataInputView.setCreateTimeEnd(DateUtil.getLastYearStartTime());
    	}else{ //默认本周
    		titleList.add("本周");
    		num = 7;
    		for (int i = 0; i < num; i++) {
	    		sql.append(" ,(SELECT COUNT(1) FROM member_card_type mct1 LEFT JOIN member_card mc1 ON(mct1.cardTypeId = mc1.cardTypeId) LEFT JOIN user_member um1 ON(mc1.memberId = um1.memberId) WHERE mct1.cardTypeId = mct.cardTypeId AND mc1.createTime BETWEEN :createTimeStart AND :createTimeEnd AND DATE_FORMAT(mc1.createTime, '%w')=").append((i==num-1?0:i+1)).append(") d"+i);
	    		titleList.add(DateUtil.getWeekName(i)); 
	    	}
    		dataInputView.setCreateTimeStart(DateUtil.getTimesWeekmorningStr());
    		dataInputView.setCreateTimeEnd(DateUtil.getTimesWeeknightStr());
    	} 
    	sql.append(" FROM member_card_type mct");
    	sql.append(" LEFT JOIN member_card mc ON(mct.cardTypeId = mc.cardTypeId AND mc.createTime BETWEEN :createTimeStart AND :createTimeEnd)"); 
    	sql.append(" LEFT JOIN user_member um ON(mc.memberId = um.memberId)");
    	sql.append(" GROUP BY mct.cardTypeId");
    	
    	List<Map<String, Object>> list = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
    	
    	Map<String, Object> combinedMap = new HashMap<String, Object>();
    	
    	combinedMap.put("cardTypeName", "合计");
    	for (int i = 0; i < num; i++) {
    		combinedMap.put("d"+i, (int)getCombinedByNum(list, i));
		}
    	int count = 0;
    	for (Map<String, Object> map : list) {
    		count += StrUtil.objToDouble(map.get("count"));
		}
    	combinedMap.put("count", count);
    	list.add(combinedMap);
    	
    	for (Map<String, Object> map : list) {
    		List<String> values = new ArrayList<String>();
    		for (int i = 0; i < num; i++) {
    			values.add(map.get("d"+i).toString());
    		}
    		map.put("data", values);
		}
    	
    	resultMap.put("num", num - 1);
    	resultMap.put("list", list);
    	resultMap.put("titleList", titleList);
    	return resultMap;
    }
    
    private double getCombinedByNum(List<Map<String, Object>> list, int i){
    	double count = 0;
    	for (Map<String, Object> map : list) {
    		count += StrUtil.objToDouble(map.get("d"+i));
		}
    	return count;
    }
    
    @Override
    public Map<String, Object> getMembersCZNew(DataInputView dataInputView){
    	Integer countNum = dataInputView.getCountNum();
    	
    	dataInputView = getDataCountTime(dataInputView, countNum);
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	List<String> titleList = new ArrayList<String>();
    	
    	StringBuilder sql = new StringBuilder("SELECT mct.cardTypeName, IFNULL(SUM(realAmount),0) realAmountSum");
    	
    	int num = 0;
    	if(countNum == IDBConstant.DATA_DATE_MONTH){ //本月
    		titleList.add("本月");
    		String yearMonth = DateUtil.dateToString(new Date(), DateUtil.YYYYMM);
    		num = DateUtil.getCurrentMonthDay();
    		for (int i = 0; i < num; i++) {
    			sql.append(" ,(SELECT IFNULL(SUM(realAmount),0) FROM member_card_type mct1 LEFT JOIN member_card mc1 ON(mct1.cardTypeId = mc1.cardTypeId) LEFT JOIN other_balance ob1 ON(mc1.cardId = ob1.balanceServiceId AND ob1.balanceServiceType IN(:balanceServiceTypes)) WHERE mct1.cardTypeId = mct.cardTypeId AND :createTimeEnd AND DATE_FORMAT(mc1.createTime, '%Y-%m%e')='").append(yearMonth).append(i+1).append("') d"+i);
	    		titleList.add(DateUtil.getDayName(i));
    		}
    	} else if(countNum == IDBConstant.DATA_DATE_YEAR){ //本年
    		titleList.add("本年");
    		String year = DateUtil.dateToString(new Date(), DateUtil.YYYY);
    		num = 12;
	    	for (int i = 0; i < num; i++) {
	    		sql.append(" ,(SELECT IFNULL(SUM(realAmount),0) FROM member_card_type mct1 LEFT JOIN member_card mc1 ON(mct1.cardTypeId = mc1.cardTypeId) LEFT JOIN other_balance ob1 ON(mc1.cardId = ob1.balanceServiceId AND ob1.balanceServiceType IN(:balanceServiceTypes)) WHERE mct1.cardTypeId = mct.cardTypeId AND :createTimeEnd AND DATE_FORMAT(mc1.createTime, '%Y%c')='").append(year).append(i+1).append("') d"+i);
	    		titleList.add(DateUtil.getMonthName(i));
	    	}
    	}else{ //默认本周
    		titleList.add("本周");
    		num = 7;
    		for (int i = 0; i < num; i++) { 
	    		sql.append(" ,(SELECT IFNULL(SUM(realAmount),0) FROM member_card_type mct1 LEFT JOIN member_card mc1 ON(mct1.cardTypeId = mc1.cardTypeId) LEFT JOIN other_balance ob1 ON(mc1.cardId = ob1.balanceServiceId AND ob1.balanceServiceType IN(:balanceServiceTypes)) WHERE mct1.cardTypeId = mct.cardTypeId AND mc1.createTime BETWEEN :createTimeStart AND :createTimeEnd AND DATE_FORMAT(mc1.createTime, '%w')=").append((i==num-1?0:i+1)).append(") d"+i);
	    		titleList.add(DateUtil.getWeekName(i)); 
	    	}
    	} 
    	sql.append(" FROM member_card_type mct"); 
    	sql.append(" LEFT JOIN member_card mc ON(mct.cardTypeId = mc.cardTypeId AND mc.createTime BETWEEN :createTimeStart AND :createTimeEnd)"); 
    	sql.append(" LEFT JOIN other_balance ob ON(mc.cardId = ob.balanceServiceId AND ob.balanceServiceType IN(:balanceServiceTypes))");
    	sql.append(" GROUP BY mct.cardTypeId");
    	
    	dataInputView.setBalanceServiceTypeArr(new Integer[]{StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_REG), StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_CARD_CZ)});
    	
    	Map<String, Object> paramMap = JsonUtils.fromJson(dataInputView);
    	paramMap.putAll(SQLUtil.getInToSQL("balanceServiceTypes", dataInputView.getBalanceServiceTypeArr()));
    	
    	List<Map<String, Object>> list = baseDao.queryBySql(sql.toString(), paramMap);
    	Map<String, Object> combinedMap = new HashMap<String, Object>();
    	combinedMap.put("cardTypeName", "合计");
    	for (int i = 0; i < num; i++) {
    		combinedMap.put("d"+i, getCombinedByNum(list, i)); 
		}
    	double realAmountSum = 0;
    	for (Map<String, Object> map : list) {
    		realAmountSum += StrUtil.objToDouble(map.get("realAmountSum"));
		}
    	combinedMap.put("realAmountSum", realAmountSum);
    	list.add(combinedMap);
    	
    	for (Map<String, Object> map : list) {
    		List<String> values = new ArrayList<String>();
    		for (int i = 0; i < num; i++) {
    			values.add(map.get("d"+i).toString());
    		}
    		map.put("data", values);
		}
    	
    	resultMap.put("num", num-1);
    	resultMap.put("list", list);
    	resultMap.put("titleList", titleList);
    	
    	return resultMap;
    }
    
    @Override
    public Map<String, Object> getMembersXFNew(DataInputView dataInputView){
    	
    	Integer countNum = dataInputView.getCountNum();
    	
    	dataInputView = getDataCountTime(dataInputView, countNum);
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	StringBuffer sql = new StringBuffer("SELECT mct.cardTypeName");
    	sql.append(" ,SUM(CASE WHEN ob.balanceServiceType IN(100,200) THEN ob.realAmount-ob.xjAmount ELSE 0 END) siteXF");
    	sql.append(" ,SUM(CASE WHEN ob.balanceServiceType = 300 THEN ob.realAmount-ob.xjAmount ELSE 0 END) goodsXF");
    	sql.append(" ,IFNULL((SELECT SUM(cardBalance) FROM member_card mc1 WHERE mc1.cardTypeId = mct.cardTypeId AND mc1.createTime BETWEEN :createTimeStart AND :createTimeEnd),0) cardBalance");
    	sql.append(" FROM member_card_type mct");
    	sql.append(" LEFT JOIN member_card mc ON(mct.cardTypeId = mc.cardTypeId AND mc.createTime BETWEEN :createTimeStart AND :createTimeEnd)");
    	sql.append(" LEFT JOIN other_balance ob ON(ob.balanceCardId = mc.cardId)");
    	sql.append(" GROUP BY mct.cardTypeId");
    	//IDBConstant.BALANCE_SERVICE_TYPE_SITE, IDBConstant.BALANCE_SERVICE_TYPE_BLOCK_SITE, IDBConstant.BALANCE_SERVICE_TYPE_GOODS
    	List<Map<String, Object>> list = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
    	
    	Map<String, Object> combinedMap = new HashMap<String, Object>();
    	combinedMap.put("cardTypeName", "合计");
    	
    	double siteXF = 0, goodsXF = 0, cardBalance = 0;
    	for (Map<String, Object> map : list) {
    		siteXF += StrUtil.objToDoubleDef0(map.get("siteXF"));
    		goodsXF += StrUtil.objToDoubleDef0(map.get("goodsXF"));
    		cardBalance += StrUtil.objToDoubleDef0(map.get("cardBalance"));
		}
    	combinedMap.put("siteXF", siteXF);
    	combinedMap.put("goodsXF", goodsXF);
    	combinedMap.put("cardBalance", cardBalance); 
    	list.add(combinedMap);
    	
    	for (Map<String, Object> map : list) {
    		List<String> values = new ArrayList<String>();
    		values.add(map.get("siteXF").toString());
    		values.add(map.get("goodsXF").toString());
    		values.add(map.get("cardBalance").toString());
    		map.put("data", values);
		}
    	
    	resultMap.put("list", list);
    	
    	return resultMap;
    }
    
    private DataInputView getDataCountTime(DataInputView dataInputView, Integer countNum){
    	
    	countNum = countNum != null ? countNum : IDBConstant.DATA_DATE_WEEK;
    	switch (countNum) {
		case IDBConstant.DATA_DATE_MONTH:
			dataInputView.setCreateTimeStart(DateUtil.getTimesMonthmorning());
    		dataInputView.setCreateTimeEnd(DateUtil.getTimesMonthnight());
			break;
		case IDBConstant.DATA_DATE_YEAR:
			dataInputView.setCreateTimeStart(DateUtil.getCurrentYearEndTime());
    		dataInputView.setCreateTimeEnd(DateUtil.getLastYearStartTime());
			break;
		case IDBConstant.DATA_DATE_WEEK:
		default:
			dataInputView.setCreateTimeStart(DateUtil.getTimesWeekmorningStr());
			dataInputView.setCreateTimeEnd(DateUtil.getTimesWeeknightStr());
			break;
		}

		return dataInputView;
    }

    @Override
    public List<Map<String, Object>> getMembersRegister(DataInputView dataInputView){
        Integer countNum = dataInputView.getCountNum();
        String createTimeStart = dataInputView.getCreateTimeStart();
        String createTimeEnd = dataInputView.getCreateTimeEnd();

        StringBuffer sql = new StringBuffer("SELECT total.cardTypeId, total.cardTypeName, total.cardTypeTotal, item.cardTypeCount FROM");
        sql.append(" (SELECT mct.cardTypeId, mct.cardTypeName, COUNT(mc.cardTypeId) cardTypeTotal FROM member_card mc INNER JOIN member_card_type mct ON mc.cardTypeId = mct.cardTypeId GROUP BY mct.cardTypeId ORDER BY mct.cardTypeId) total,");

        sql.append(" (SELECT mct.cardTypeId, mct.cardTypeName, COUNT(mc.cardTypeId) cardTypeCount FROM member_card mc INNER JOIN member_card_type mct ON mc.cardTypeId = mct.cardTypeId");
        sql.append(" WHERE 1=1");
        if(StrUtil.isNotBlank(createTimeStart)){
            sql.append(" AND DATE(mc.createTime) >= :createTimeStart");
        }
        if(StrUtil.isNotBlank(createTimeEnd)){
            sql.append(" AND DATE(mc.createTime) <= :createTimeEnd");
        }
        sql.append(getCountSql(countNum, "mc.createTime"));
        sql.append(" GROUP BY mct.cardTypeId ORDER BY mct.cardTypeId) item");

        sql.append(" WHERE total.cardTypeId = item.cardTypeId");
        sql.append(" GROUP BY total.cardTypeId");
        return baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
    }

    @Override
    public List<Map<String, Object>> getMembersRegisterStored(DataInputView dataInputView){
        Integer countNum = dataInputView.getCountNum();
        String createTimeStart = dataInputView.getCreateTimeStart();
        String createTimeEnd = dataInputView.getCreateTimeEnd();
        dataInputView.setBalanceServiceTypeMin(StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_CARD_CZ));
        dataInputView.setBalanceServiceTypeMax(StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_REG));
        StringBuffer sql = new StringBuffer("SELECT total.cardTypeId, total.cardTypeName, SUM(total.realCount) realTotal, SUM(total.givingCount) givingTotal, SUM(total.cardBalance) balanceTotal FROM");
        sql.append(" (SELECT mct.cardTypeId, mct.cardTypeName, SUM(ob.realAmount) realCount, SUM(ob.givingAmount) givingCount, mc.cardId, mc.cardBalance FROM member_card mc INNER JOIN member_card_type mct ON mc.cardTypeId = mct.cardTypeId INNER JOIN other_balance ob ON ob.balanceServiceId = mc.cardId");
        sql.append(" WHERE ob.balanceServiceType = :balanceServiceTypeMin OR ob.balanceServiceType = :balanceServiceTypeMax");
        if(StrUtil.isNotBlank(createTimeStart)){
            sql.append(" AND DATE(mc.createTime) >= :createTimeStart");
        }
        if(StrUtil.isNotBlank(createTimeEnd)){
            sql.append(" AND DATE(mc.createTime) <= :createTimeEnd");
        }
        sql.append(getCountSql(countNum, "mc.createTime"));
        sql.append(" GROUP BY mc.cardId) total");
        sql.append(" GROUP BY total.cardTypeId ORDER BY total.cardTypeId");
        return baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
    }

    @Override
    public List<Map<String, Object>> getMembersRegisterGroupDate(DataInputView dataInputView){
        Integer countNum = dataInputView.getCountNum();
        String createTimeStart = dataInputView.getCreateTimeStart();
        String createTimeEnd = dataInputView.getCreateTimeEnd();

        StringBuffer sql = new StringBuffer("SELECT mct.cardTypeName, mct.cardTypeMoney, COUNT(mc.cardId) count, COUNT(mc.cardId)*mct.cardTypeMoney countMoney, DATE_FORMAT(mc.createTime, '%Y-%m-%d') createDate FROM member_card_type mct");
        sql.append(" LEFT JOIN member_card mc ON(mc.cardTypeId = mct.cardTypeId");
        if(StrUtil.isNotBlank(createTimeStart)){
            sql.append(" AND DATE(mc.createTime) >= :createTimeStart");
        }
        if(StrUtil.isNotBlank(createTimeEnd)){
            sql.append(" AND DATE(mc.createTime) <= :createTimeEnd");
        }
        sql.append(getCountSql(countNum, "mc.createTime"));

        sql.append(") GROUP BY mct.cardTypeId, DATE_FORMAT(mc.createTime, '%Y-%m-%d') ORDER BY mc.createTime");
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

    @Override
    public String getCountSql(Integer countItem, String field) {
		countItem = countItem != null ? countItem : IDBConstant.DATA_DATE_MONTH;

        switch (countItem) {
            case IDBConstant.DATA_DATE_DAY: //今日
                return " AND DATE_FORMAT("+field+", '%Y-%m-%d') = CURDATE()";
            case IDBConstant.DATA_DATE_PRE_DAY: //昨日
                return " AND DATE_FORMAT("+field+", '%Y-%m-%d') = adddate(CURDATE(), -1)";
            case IDBConstant.DATA_DATE_WEEK: //本周
                return " AND YEARWEEK("+field+",1) = YEARWEEK(CURDATE(),1)";
            case IDBConstant.DATA_DATE_PRE_WEEK: //上周
                return " AND YEARWEEK("+field+",1) = YEARWEEK(CURDATE(),1)-1";
            case IDBConstant.DATA_DATE_NEXT_WEEK: //下周
                return " AND YEARWEEK("+field+",1) = YEARWEEK(CURDATE(),1)+1";
            case IDBConstant.DATA_DATE_MONTH: //本月
                return " AND DATE_FORMAT("+field+", '%Y-%m') = DATE_FORMAT(CURDATE(), '%Y-%m')";
            case IDBConstant.DATA_DATE_YEAR: //本年
                return " AND DATE_FORMAT("+field+", '%Y') = DATE_FORMAT(CURDATE(), '%Y')";
            default:
                return " ";
        }
    }

	/*@Override
	public String getCountSql(Integer countNum, String field) {
		countNum = countNum != null ? countNum : 10;
		switch (countNum) {
		case 2: //昨日
			return " AND DATE_FORMAT("+field+", '%Y-%m-%d') = adddate(CURDATE(), -1)";
		case 3: //本周
			return " AND YEARWEEK("+field+") = YEARWEEK(CURDATE())";
		case 4: //本月
			return " AND DATE_FORMAT("+field+", '%Y-%m') = DATE_FORMAT(CURDATE(), '%Y-%m')";
		case 1: //今日
			return " AND DATE_FORMAT("+field+", '%Y-%m-%d') = CURDATE()";
		case 100: //上周
			return " AND YEARWEEK("+field+") = YEARWEEK(CURDATE())-1";
		case 200: //下周
			return " AND YEARWEEK("+field+") = YEARWEEK(CURDATE())+1";
		default:
			return " ";
		}
	}*/
	
	/*@Override
	public Map<String, Object> getSitePercentage(DataInputView dataInputView){
		
		int page = dataInputView.getPage();
		int pageSize = dataInputView.getPageSize();
		String sportId = dataInputView.getSportId();
		Integer countNum = dataInputView.getCountNum();
		String createTimeStart = dataInputView.getCreateTimeStart();
		String createTimeEnd = dataInputView.getCreateTimeEnd();
		
		*//**
		 *    — 计算数据：场地预订率 = 预订场次数 / 总场次数
			  — 计算数据：场地使用率 = 签到场次数 / 预订场次数
			  — 检索条件：全部，今天，本周，本年，自定义的起止日期，场地类型
		 *//*
		StringBuilder sql = new StringBuilder("SELECT ss.sportName, si.siteName, SUM(oi.sumCount) siteSumCount, SUM(oi.useCount) siteUseCount, SUM(oi.useCount)/SUM(oi.sumCount) siteUsePercentage");
		if(StrUtil.isNotBlank(createTimeStart) && StrUtil.isNotBlank(createTimeEnd)){
			sql.append(" ,DATEDIFF(':createTimeStart',':createTimeEnd') * (ss.`endTime`-ss.`startTime`) AS siteBusinessCount");
		}

		if (countNum != null) {
            if (countNum == IDBConstant.DATA_DATE_PRE_DAY || countNum == IDBConstant.DATA_DATE_DAY) {
                sql.append(" ,(ss.`endTime`-ss.`startTime`) AS siteBusinessCount");
            }
            if (countNum == IDBConstant.DATA_DATE_WEEK || countNum == IDBConstant.DATA_DATE_PRE_WEEK || countNum == IDBConstant.DATA_DATE_NEXT_WEEK) {
                sql.append(" ,7*(ss.`endTime`-ss.`startTime`) AS siteBusinessCount");
            }
            if (countNum == IDBConstant.DATA_DATE_MONTH) {
                sql.append(" ,30*(ss.`endTime`-ss.`startTime`) AS siteBusinessCount");
            }
        }

		sql.append(" FROM site_info si");
		sql.append(" INNER JOIN site_sport ss ON(si.siteType = ss.sportId)");
		sql.append(" LEFT JOIN site_reserve_time srt ON(srt.siteId = si.siteId)");
		sql.append(" LEFT JOIN member_site_sign mss ON(mss.reserveTimeId = srt.reserveTimeId");
		
		if(StrUtil.isNotBlank(createTimeStart)){
			sql.append(" AND DATE(mss.createTime) >= :createTimeStart");
		}
		if(StrUtil.isNotBlank(createTimeEnd)){
			sql.append(" AND DATE(mss.createTime) <= :createTimeEnd");
		}
		sql.append(getCountSql(countNum, "mss.createTime"));
		
		sql.append(") LEFT JOIN order_info oi ON(mss.orderId = oi.orderId)");
		sql.append(" WHERE 1=1");
		if(StrUtil.isNotBlank(sportId)){
			sql.append(" AND ss.sportId = :sportId");
		}
		
		String siteGroup = " GROUP BY si.siteId";
		sql.append(siteGroup);
		List<Map<String, Object>> siteCountList = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
		
		String sportGroup = " GROUP BY ss.sportId";
		List<Map<String, Object>> sportCountList = baseDao.queryBySql(sql.toString().replace(siteGroup, sportGroup), JsonUtils.fromJson(dataInputView));
		
		Double sumCountAll = 0.0;
		for(Map<String, Object> map : siteCountList){
			sumCountAll += StrUtil.objToDoubleDef0(map.get("siteSumCount"));
		}
		for(Map<String, Object> map : siteCountList){
			Double siteSumCount = StrUtil.objToDoubleDef0(map.get("siteSumCount"));
			Double siteUseCount = StrUtil.objToDoubleDef0(map.get("siteUseCount"));
			Double siteBusinessCount = StrUtil.objToDoubleDef0(map.get("siteBusinessCount"));
			map.put("siteSumCount", siteSumCount.intValue());
			map.put("siteUseCount", siteUseCount.intValue());
			map.put("siteBusinessCount", siteBusinessCount.intValue());
			map.put("siteSumPercentage", (sumCountAll > 0 ? StrUtil.roundKeepTwo(siteSumCount / sumCountAll) : 0) * 100); //场地预订率
			map.put("siteUsePercentage", (StrUtil.roundKeepTwo(StrUtil.objToDoubleDef0(map.get("siteUsePercentage")))) * 100); //场地使用率
		}
		PageBean pageBean = new PageBean(siteCountList, page, pageSize, siteCountList.size());
		pageBean.pagedList().init();
		
		double sumSportUsePercentage = 0;
		int sportCount = 0;
		for(Map<String, Object> map : sportCountList){
			double siteUsePercentage = StrUtil.roundKeepTwo(StrUtil.objToDoubleDef0(map.get("siteUsePercentage")));
			map.put("siteUsePercentage", StrUtil.roundKeepTwo(siteUsePercentage));
			sumSportUsePercentage += siteUsePercentage;
			sportCount++;
		}
		Map<String, Object> allSportCountMap = new HashMap<String, Object>();
		allSportCountMap.put("sportName", "全部");
		allSportCountMap.put("siteUsePercentage", StrUtil.roundKeepTwo(sumSportUsePercentage/sportCount));
		sportCountList.add(0, allSportCountMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("pageBean", JsonUtils.fromJson(pageBean));
		resultMap.put("list", pageBean.getList());
		resultMap.put("sportCountList", sportCountList);

		return resultMap;
	}*/

	@Override
	public Map<String, Object> getSitePercentage(DataInputView dataInputView) throws Exception{

		Map<String, Object> resultMap = new HashMap<>();
		SiteInputView siteInputView = new SiteInputView();
		siteInputView.setSportStatus(IDBConstant.LOGIC_STATUS_YES);
		List<Map<String, Object>> sports = siteService.getSiteSportNames(siteInputView);
		int sumSiteCount = (parkService.getBusinessTimePeriod().size()) * getDayNumByCountNum(dataInputView.getCountNum());
		dataInputView.setSumSiteCount(sumSiteCount);

		List<Map<String, Object>> sumCountList = new ArrayList<>();
		int sumCountZ = 0, useCountZ = 0;
		for(Map<String, Object> map : sports){
			dataInputView.setSportId(StrUtil.objToStr(map.get("sportId")));
			List<Map<String, Object>> siteUseList = getSiteUseList(dataInputView);
			int sumCount = 0, useCount = 0;
			for(Map<String, Object> s : siteUseList){
				useCount += StrUtil.objToInt(s.get("useCount"));
			}
			map.put("sites", siteUseList);
			map.put("sumSiteCount", sumSiteCount);

			sumCount += StrUtil.objToInt(siteUseList.size()*sumSiteCount);
			map.put("sumCount", sumCount);
			map.put("sumUsePercentage", StrUtil.roundKeepTwo(useCount > 0  ? 1.0*useCount/sumCount*100 : 0));
			sumCountList.add(map);
			sumCountZ += sumCount;
			useCountZ += useCount;
		}
		Map<String, Object> sumCountMap = new HashMap<>();
		sumCountMap.put("sportName", "全部");
		sumCountMap.put("sumCount", sumCountZ);
		sumCountMap.put("sumUsePercentage", StrUtil.roundKeepTwo(useCountZ > 0  ? 1.0*useCountZ/sumCountZ*100 : 0));
		sumCountList.add(0, sumCountMap);

		resultMap.put("sports", sports);
		resultMap.put("sumCountList", sumCountList);
		return resultMap;
	}

	private List<Map<String, Object>> getSiteUseList(DataInputView dataInputView) throws Exception {

		String sportId = dataInputView.getSportId();
		Integer sumSiteCount = dataInputView.getSumSiteCount();

		List<String> dates = getDatesByCountNum(dataInputView.getCountNum());
		dataInputView.setDates(StrUtil.join(dates, "|"));

		StringBuilder sql = new StringBuilder("SELECT mss.signId, si.siteId, si.siteName, ss.sportName, GROUP_CONCAT(DISTINCT srd.reserveDates) reserveDateStrs ,SUM((siteEndTime-siteStartTime)*IF(srd.reserveDates IS NULL, 0, 1)) times, 0 ydCount, 0 ydPercentage, 0 useCount, 0 usePercentage");
		sql.append(" FROM site_info si");
		sql.append(" INNER JOIN site_sport ss ON(si.siteType = ss.sportId)");
		sql.append(" LEFT JOIN site_reserve_time srt ON (si.siteId = srt.siteId)");
		sql.append(" LEFT JOIN site_reserve_date srd ON(srt.reserveDateId = srd.reserveDateId AND srd.reserveDates REGEXP :dates)");
		sql.append(" LEFT JOIN member_site_sign mss ON(mss.reserveTimeId = srt.reserveTimeId)");
		sql.append(" WHERE 1=1");
		if (StrUtil.isNotBlank(sportId)) {
			sql.append(" AND ss.sportId = :sportId");
		}
		sql.append(" GROUP BY si.siteId ORDER BY si.createTime");

		List<Map<String, Object>> list = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
		for (Map<String, Object> map : list) {
			String reserveDateStrs = StrUtil.objToStr(map.get("reserveDateStrs"));
			Integer times = StrUtil.objToInt(map.get("times"));
			if (StrUtil.isNotBlank(reserveDateStrs)) {
				List<String> containsList = StrUtil.getListContainsValue(dates, Arrays.asList(reserveDateStrs.split(",")));
				if(containsList.size() > 0) {
					map.put("ydCount", containsList.size() * times);
					Double ydCount = StrUtil.objToDoubleDef0(map.get("ydCount"));
					map.put("ydPercentage", sumSiteCount > 0 ? StrUtil.roundKeepTwo(ydCount / sumSiteCount * 100) : 0);
					if (map.get("signId") != null) {
						map.put("useCount", times);
						map.put("usePercentage", ydCount > 0 ? StrUtil.roundKeepTwo(StrUtil.objToDouble(map.get("useCount")) / ydCount) * 100 : 0);
					}
				}
			}
		}
		return list;
	}

	@Override
	public Workbook exportVenuePercentage(DataInputView dataInputView) throws Exception{
		Workbook workbook = xlsExportImportService.getWorkbook(XlsExportImportServiceImpl.class.getResourceAsStream(XlsExportImportServiceImpl.ROOT + "template_venue_percentage.xlsx"), IPlatformConstant.EXCEL_EXTENSION_X);

		Map<String, Object> sitePercentage = getSitePercentage(dataInputView);
		List<Map<String, Object>> sports = (List)sitePercentage.get("sports");
		for(Map<String, Object> sss : sports){
			Sheet sheetAt = workbook.createSheet(sss.get("sportName") + "场地");
			Row row1 = sheetAt.createRow(0);
			Row row2 = sheetAt.createRow(1);
			Row row3 = sheetAt.createRow(2);
			Row row4 = sheetAt.createRow(3);
			List<Map<String, Object>> sis = (List)sss.get("sites");
			row1.createCell(0).setCellValue("统计项");
			row2.createCell(0).setCellValue("总场次");
			row3.createCell(0).setCellValue("预订场次");
			row4.createCell(0).setCellValue("使用场次");
			int c = 1;
			for(Map<String, Object> si : sis){
				row1.createCell(c).setCellValue(si.get("siteName").toString());
				row2.createCell(c).setCellValue(sss.get("sumSiteCount")+"时");
				row3.createCell(c).setCellValue(si.get("ydCount")+"时("+si.get("ydPercentage")+"%)");
				row4.createCell(c).setCellValue(si.get("useCount")+"时("+si.get("usePercentage")+"%)");
				c++;
			}
		}
		workbook.removeSheetAt(0);
		return workbook;
	}

	private List<String> getDatesByCountNum(Integer countNum) throws Exception{
		List<String> dates = new ArrayList<>();
		Date date = new Date();
		switch (countNum){
			case IDBConstant.DATA_DATE_PRE_DAY:
				dates.add(DateUtil.dateToString(DateUtil.addDate(date, -1), DateUtil.YYYYMMDD));
				break;
			case IDBConstant.DATA_DATE_PRE_WEEK:
				dates = DateUtil.getWeekTimes(DateUtil.addDate(date, -7));
				break;
			case IDBConstant.DATA_DATE_WEEK:
				dates = DateUtil.getWeekTimes(date);
				break;
			case IDBConstant.DATA_DATE_PRE_MONTH:
				dates.add(DateUtil.getAddMonth(-1));
				break;
			case IDBConstant.DATA_DATE_PRE_YEAR:
				dates.add(DateUtil.getAddYear(-1));
				break;
		}
		return dates;
	}

	private int getDayNumByCountNum(Integer countNum) throws Exception{
		int days = 0;
		switch (countNum){
			case IDBConstant.DATA_DATE_PRE_DAY:
				days = 1;
				break;
			case IDBConstant.DATA_DATE_PRE_WEEK:
			case IDBConstant.DATA_DATE_WEEK:
				days = 7;
				break;
			case IDBConstant.DATA_DATE_PRE_MONTH:
				days = DateUtil.getMonthDay(DateUtil.stringToDate(DateUtil.getAddMonth(-1), DateUtil.YYYYMM));
				break;
			case IDBConstant.DATA_DATE_PRE_YEAR:
				days = DateUtil.getYearDay(DateUtil.getAddYear(-1));
				break;
		}
		return days;
	}
	
	@Override
	public PageBean getDataMembersAttendance(DataInputView dataInputView){
		
		Integer countNum = dataInputView.getCountNum();
		String createTimeStart = dataInputView.getCreateTimeStart();
		String createTimeEnd = dataInputView.getCreateTimeEnd();
		String memberName = dataInputView.getMemberName();
		
		StringBuilder headSql = new StringBuilder("SELECT mc.cardNo, um.memberName, srb.`name`, mss.signDate, oi.orderNo, mss.signName, mss.signMobile, si.siteName, ss.sportName, mss.createTime");
		StringBuilder bodySql = new StringBuilder(" FROM member_site_sign mss");
		bodySql.append(" JOIN order_info oi ON(mss.orderId = oi.orderId)");
		bodySql.append(" JOIN site_reserve_time srt ON(mss.reserveTimeId = srt.reserveTimeId)");
		bodySql.append(" JOIN site_reserve_basic srb ON(oi.orderId = srb.orderId)");
		bodySql.append(" JOIN site_info si ON(srt.siteId = si.siteId)");
		bodySql.append(" JOIN site_sport ss ON(si.siteType = ss.sportId)");
		bodySql.append(" LEFT JOIN user_member um ON(um.memberId = oi.memberId)");
		bodySql.append(" LEFT JOIN member_card mc ON(mc.memberId = um.memberId)");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
		if(StrUtil.isNotBlank(createTimeStart)){
			whereSql.append(" AND DATE(mss.createTime) >= :createTimeStart");
		}
		if(StrUtil.isNotBlank(createTimeEnd)){
			whereSql.append(" AND DATE(mss.createTime) <= :createTimeEnd");
		}
		if(StrUtil.isNotBlank(memberName)){
			whereSql.append(" AND um.memberName LIKE :memberName");
			dataInputView.setMemberName(memberName + "%");
		}
		whereSql.append(getCountSql(countNum, "mss.createTime"));
		whereSql.append(" ORDER BY mss.createTime DESC");
		
		return super.getPageBean(headSql, bodySql, whereSql, dataInputView);
	}
	
	@Override
	public Map<String, Object> getBusinessIncome(DataInputView dataInputView){
		
		Integer countNum = dataInputView.getCountNum();
		String createTimeStart = dataInputView.getCreateTimeStart();
		String createTimeEnd = dataInputView.getCreateTimeEnd();
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		StringBuilder sql = new StringBuilder("SELECT cardTypeName name, SUM(xjAmount) price, ob.balanceStyle style, ob.balanceId");
		sql.append(" FROM member_card_type mct");
		sql.append(" LEFT JOIN member_card mc ON(mct.cardTypeId = mc.cardTypeId)");
		sql.append(" LEFT JOIN other_balance ob ON(ob.balanceServiceId = mc.cardId AND CAST(ob.balanceServiceType AS signed INTEGER) >= :balanceServiceTypeMin AND CAST(ob.balanceServiceType AS signed INTEGER) <= :balanceServiceTypeMax");
		if(StrUtil.isNotBlank(createTimeStart)){
			sql.append(" AND DATE(ob.createTime) >= :createTimeStart");
		}
		if(StrUtil.isNotBlank(createTimeEnd)){
			sql.append(" AND DATE(ob.createTime) <= :createTimeEnd");
		}
		sql.append(getCountSql(countNum, "ob.createTime"));
		
		sql.append(") GROUP BY mct.cardTypeId, ob.balanceStyle");
		
		dataInputView.setBalanceServiceTypeMin(StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_REG));
		dataInputView.setBalanceServiceTypeMax(StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_CARD_BUBAN_STUDENT));
		List<Map<String, Object>> cardCountsList = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
		resultMap.put("cardCounts", getCountMap(cardCountsList));
		
		sql.setLength(0);
		sql.append("SELECT dictValue name, SUM(xjAmount) price, ob.balanceStyle style, ob.balanceId");
		sql.append(" FROM system_dict sd");
		sql.append(" LEFT JOIN other_balance ob ON(ob.balanceServiceType = sd.dictKey");
		
		if(StrUtil.isNotBlank(createTimeStart)){
			sql.append(" AND DATE(ob.createTime) >= :createTimeStart");
		}
		if(StrUtil.isNotBlank(createTimeEnd)){
			sql.append(" AND DATE(ob.createTime) <= :createTimeEnd");
		}
		sql.append(getCountSql(countNum, "ob.createTime"));
		
		sql.append(") LEFT JOIN order_info oi ON(ob.balanceServiceId = oi.orderId)");
		sql.append(" WHERE dictName = :dictName AND CAST(dictKey AS signed INTEGER) >= :balanceServiceTypeMin AND CAST(dictKey AS signed INTEGER) <= :balanceServiceTypeMax");
		sql.append(" GROUP BY dictKey, ob.balanceStyle ORDER BY dictKey");
		
		dataInputView.setDictName(IDBConstant.BALANCE_SERVICE_TYPE);
		dataInputView.setBalanceServiceTypeMin(StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_SITE));
		dataInputView.setBalanceServiceTypeMax(StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_BLOCK_SITE));
		
		List<Map<String, Object>> siteCountsList = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
		resultMap.put("siteCounts", getCountMap(siteCountsList));
		
		sql.setLength(0);
		sql.append("SELECT dictValue name, SUM(xjAmount) price, ob.balanceStyle style, ob.balanceId");
		sql.append(" FROM system_dict sd");
		sql.append(" LEFT JOIN other_balance ob ON(ob.balanceServiceType = sd.dictKey");
		
		if(StrUtil.isNotBlank(createTimeStart)){
			sql.append(" AND DATE(ob.createTime) >= :createTimeStart");
		}
		if(StrUtil.isNotBlank(createTimeEnd)){
			sql.append(" AND DATE(ob.createTime) <= :createTimeEnd");
		}
		sql.append(getCountSql(countNum, "ob.createTime"));
		
		sql.append(") LEFT JOIN order_info oi ON(ob.balanceServiceId = oi.orderId)");
		sql.append(" WHERE dictName = :dictName AND CAST(dictKey AS signed INTEGER) = :balanceServiceType");
		sql.append(" GROUP BY dictKey, ob.balanceStyle ORDER BY dictKey");
		
		dataInputView.setDictName(IDBConstant.BALANCE_SERVICE_TYPE);
		dataInputView.setBalanceServiceType(StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_GOODS));
		
		List<Map<String, Object>> goodsCountsList = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
		resultMap.put("goodsCounts", getCountMap(goodsCountsList));
		
		List sumlist = new ArrayList();
		sumlist.addAll(cardCountsList);
		sumlist.addAll(siteCountsList);
		sumlist.addAll(goodsCountsList);
		resultMap.putAll(getCountMap(sumlist));
		return resultMap;
	}
	
	private Map<String, Object> getCountMap(List<Map<String, Object>> countList){
		countList = getCountItemPrice(countList);

		Map map = new HashMap<>();
		map.put("countList", countList);
		map.putAll(getCountSumPrice(countList));
		return map;
	}
	
	private List<Map<String, Object>> getCountItemPrice(List<Map<String, Object>> countList){
		List<Map<String, Object>> tempListMap = new  ArrayList<Map<String, Object>>();
		for(Map<String, Object> map : countList){
			Object name = map.get("name");
			String style = String.valueOf(map.get("style"));
			Double price = StrUtil.objToDoubleDef0(map.get("price"));
			Map tempMap = getTempMapByName(tempListMap, name, style);
			switch (String.valueOf(map.get("style"))) {
			case IDBConstant.BALANCE_STYLE_XJ:
				tempMap.put(XIANJIN, StrUtil.objToDoubleDef0(tempMap.get(XIANJIN))+price);
				break;
			case IDBConstant.BALANCE_STYLE_ZFB:
				tempMap.put(ZHIFUBAO, StrUtil.objToDoubleDef0(tempMap.get(ZHIFUBAO))+price);
				break;
			case IDBConstant.BALANCE_STYLE_WX:
				tempMap.put(WEIXIN, StrUtil.objToDoubleDef0(tempMap.get(WEIXIN))+price);
				break;
			case IDBConstant.BALANCE_STYLE_YINLIAN:
				tempMap.put(YINLIAN, StrUtil.objToDoubleDef0(tempMap.get(YINLIAN))+price);
				break;
			case IDBConstant.BALANCE_STYLE_ZHIPIAO:
				tempMap.put(ZHIPIAO, StrUtil.objToDoubleDef0(tempMap.get(ZHIPIAO))+price);
				break;
			default:
				tempMap.put(XIANJIN, StrUtil.objToDoubleDef0(tempMap.get(XIANJIN))+0);
				tempMap.put(ZHIFUBAO, StrUtil.objToDoubleDef0(tempMap.get(ZHIFUBAO))+0);
				tempMap.put(WEIXIN, StrUtil.objToDoubleDef0(tempMap.get(WEIXIN))+0);
				tempMap.put(YINLIAN, StrUtil.objToDoubleDef0(tempMap.get(YINLIAN))+0);
				tempMap.put(ZHIPIAO, StrUtil.objToDoubleDef0(tempMap.get(ZHIPIAO))+0);
				break;
			}
			tempMap.put("sumPrice", StrUtil.objToDoubleDef0(tempMap.get(XIANJIN))+StrUtil.objToDoubleDef0(tempMap.get(ZHIFUBAO))+StrUtil.objToDoubleDef0(tempMap.get(WEIXIN))+StrUtil.objToDoubleDef0(tempMap.get(YINLIAN))+StrUtil.objToDoubleDef0(tempMap.get(ZHIPIAO)));
			tempListMap.add(tempMap);
		}
		
		return delRepeat(tempListMap);
	}

	private Map getTempMapByName(List<Map<String, Object>> tempListMap, Object name, Object style){
		for(Map<String, Object> map : tempListMap){
			if(name != null && name.equals(map.get("name")) && style != null && style.equals(map.get("style"))){
				return map;
			}else if(name != null && name.equals(map.get("name"))){
				return map;
			}
		}
		Map map = new HashMap();
		map.put("name", name);
		return map;
	}
	
	private List<Map<String, Object>> delRepeat(List<Map<String, Object>> tempListMap) {
		String name = null;
		for (int i = 0; i < tempListMap.size(); i++) {
			Map<String, Object> map = tempListMap.get(i);
			if(map.get("name").equals(name)){
				tempListMap.remove(map);
				i--;
				continue;
			}
			name = countFill(map).get("name").toString();
		}
		return tempListMap;
	}

	private Map<String, Object> countFill(Map<String, Object> map) {
		if(map.get(XIANJIN) == null) map.put(XIANJIN, 0);
		if(map.get(ZHIFUBAO) == null) map.put(ZHIFUBAO, 0);
		if(map.get(WEIXIN) == null) map.put(WEIXIN, 0);
		if(map.get(YINLIAN) == null) map.put(YINLIAN, 0);
		if(map.get(ZHIPIAO) == null) map.put(ZHIPIAO, 0);
		return map;
	}
	
	private Map<String, Object> getCountSumPrice(List<Map<String, Object>> countList){
		double xianjinSum = 0, zhifubaoSum = 0, weixinSum = 0, yinlianSum = 0, zhipiaoSum = 0;
		for(Map<String, Object> map : countList){
			xianjinSum += StrUtil.objToDoubleDef0(map.get(XIANJIN));
			zhifubaoSum += StrUtil.objToDoubleDef0(map.get(ZHIFUBAO));
			weixinSum += StrUtil.objToDoubleDef0(map.get(WEIXIN));
			yinlianSum += StrUtil.objToDoubleDef0(map.get(YINLIAN));
			zhipiaoSum += StrUtil.objToDoubleDef0(map.get(ZHIPIAO));
			
		}
		Map<String, Object> sumPriceMap = new HashMap<String, Object>();
		sumPriceMap.put("xianjinSumPrice", xianjinSum);
		sumPriceMap.put("zhifubaoSumPrice", zhifubaoSum);
		sumPriceMap.put("weixinSumPrice", weixinSum);
		sumPriceMap.put("yinlianSumPrice", yinlianSum);
		sumPriceMap.put("zhipiaoSumPrice", zhipiaoSum);
		sumPriceMap.put("sumPrice", xianjinSum + zhifubaoSum + weixinSum + yinlianSum + zhipiaoSum);
		return sumPriceMap;
	}
	
	@Override
	public Workbook exportBusinessIncome(DataInputView dataInputView){
		Map<String, Object> resultMap = getBusinessIncome(dataInputView);
		Map cardCounts = (Map)resultMap.get("cardCounts");
		List cardList = (List) cardCounts.get("countList");
		Workbook workbook = xlsExportImportService.getWorkbook(XlsExportImportServiceImpl.class.getResourceAsStream(XlsExportImportServiceImpl.ROOT + "template_business_income.xlsx"), IPlatformConstant.EXCEL_EXTENSION_X);
		
		Sheet sheetAt0 = workbook.getSheetAt(0);
		
		xlsExportImportService.writeWorkbook(StrUtil.zeroToLine(cardList), workbook, 0, 0, 2, false);
		xlsExportImportService.writeWorkbook(getSum(cardCounts, "会员收入小计"), workbook, 0, 0, sheetAt0.getLastRowNum()+1, false);
		
		Map siteCounts = (Map)resultMap.get("siteCounts");
		List siteList = (List) siteCounts.get("countList");
		xlsExportImportService.writeWorkbook(StrUtil.zeroToLine(siteList), workbook, 0, 0, sheetAt0.getLastRowNum() + 2, false);
		xlsExportImportService.writeWorkbook(getSum(siteCounts, "场地收入小计"), workbook, 0, 0, sheetAt0.getLastRowNum() + 1, false);
		
		Map goodsCounts = (Map)resultMap.get("goodsCounts");
		List goodsList = (List) goodsCounts.get("countList");
		xlsExportImportService.writeWorkbook(StrUtil.zeroToLine(goodsList), workbook, 0, 0, sheetAt0.getLastRowNum() + 2, false);
		xlsExportImportService.writeWorkbook(getSum(goodsCounts, "商品收入小计"), workbook, 0, 0, sheetAt0.getLastRowNum() + 1, false);
		
		xlsExportImportService.writeWorkbook(getSum(resultMap, "金额总计"), workbook, 0, 0, sheetAt0.getLastRowNum() + 1, true);
		return workbook;
	}
	
	@Override
	public Map<String, Object> getMobileBusinessIncome(DataInputView dataInputView){
		//年月日时间参数[由前端传入]
		Map<String, Object> resultMap = getBusinessIncome(dataInputView);
		Map cardCounts = (Map)resultMap.get("cardCounts");
		Map siteCounts = (Map)resultMap.get("siteCounts");
		Map goodsCounts = (Map)resultMap.get("goodsCounts");
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("cardSum", cardCounts.get("sumPrice"));
		data.put("siteSum", siteCounts.get("sumPrice"));
		data.put("goodsSum", goodsCounts.get("sumPrice"));
		data.put("countSum", resultMap);
		return data;
	}
	
	private List getSum(Map<String, Object> map, String name){
		Map newMap = new HashMap();
		for(String key : map.keySet()){
			newMap.put(key.replace("SumPrice", StrUtil.EMPTY), map.get(key));
		}
		newMap.put("name", name);
		
		List list = new ArrayList();
		list.add(newMap);
		return list;
	}
	
	@Override
	public PageBean getOtherBalances(DataInputView dataInputView){
		
		Integer countNum = dataInputView.getCountNum();
		String createTimeStart = dataInputView.getCreateTimeStart();
		String createTimeEnd = dataInputView.getCreateTimeEnd();
		Integer balanceServiceType = dataInputView.getBalanceServiceType();
		
		StringBuilder headSql = new StringBuilder("SELECT ob.balanceId, ob.balanceNo, mc.cardNo, IFNULL(um.memberName,'散客') memberName, (SELECT dictValue FROM system_dict WHERE dictName='BALANCE_SERVICE_TYPE' AND dictKey = ob.balanceServiceType) balanceServiceType,(SELECT dictValue FROM system_dict WHERE dictName='BALANCE_STYLE' AND dictKey = ob.balanceStyle) payStyle, CONCAT(ob.realAmount,'元') realAmount, uo.operatorName, ob.createTime");
		StringBuilder bodySql = new StringBuilder(" FROM other_balance ob");
		bodySql.append(" LEFT JOIN member_card mc ON(ob.balanceServiceId = mc.cardId)");
		bodySql.append(" LEFT JOIN user_member um ON(mc.memberId = um.memberId)");
		bodySql.append(" LEFT JOIN user_operator uo ON(uo.id = ob.salesId)");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
		if(StrUtil.isNotBlank(createTimeStart)){
			whereSql.append(" AND DATE(mc.createTime) >= :createTimeStart");
        }
        if(StrUtil.isNotBlank(createTimeEnd)){
        	whereSql.append(" AND DATE(mc.createTime) <= :createTimeEnd");
        }
        if(balanceServiceType != null){
        	whereSql.append(" AND ob.balanceServiceType =:balanceServiceType");
        }
		whereSql.append(getCountSql(countNum, "ob.createTime"));
		whereSql.append(" ORDER BY ob.createTime DESC");
		return super.getPageBean(headSql, bodySql, whereSql, dataInputView);
	}
	
	@Override
	public Map<String, Object> getOtherBalancesCount(DataInputView dataInputView){
		
		Integer countNum = dataInputView.getCountNum();
		String createTimeStart = dataInputView.getCreateTimeStart();
		String createTimeEnd = dataInputView.getCreateTimeEnd();
		Integer balanceServiceType = dataInputView.getBalanceServiceType();
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		StringBuilder sql = new StringBuilder("SELECT dictValue payStyle, IFNULL(SUM(ob.xjAmount),0) realAmountSum FROM system_dict sd LEFT JOIN other_balance ob ON(ob.balanceStyle = sd.dictKey");
		sql.append(getCountSql(countNum, "ob.createTime"));
		sql.append(") WHERE dictName='BALANCE_STYLE'");
		if(StrUtil.isNotBlank(createTimeStart)){
            sql.append(" AND DATE(mc.createTime) >= :createTimeStart");
        }
        if(StrUtil.isNotBlank(createTimeEnd)){
            sql.append(" AND DATE(mc.createTime) <= :createTimeEnd");
        }
        if(balanceServiceType != null){
        	sql.append(" AND ob.balanceServiceType =:balanceServiceType");
        }
		sql.append(" GROUP BY sd.dictKey");
		
		List<Map<String, Object>> list = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
		
		Map<String, Object> allMap = new HashMap<String, Object>();
		allMap.put("payStyle", "全部");
		double allRealAmountSum = 0;
		for (Map<String, Object> map : list) {
			allRealAmountSum += StrUtil.objToDoubleDef0(map.get("realAmountSum"));
		}
		allMap.put("realAmountSum", allRealAmountSum);
		list.add(0, allMap);
		
		resultMap.put("balancesCount", list);
		return resultMap;
	}
	
	/*@Override
	public Map<String, Object> getBusinessSiteCount(DataInputView dataInputView){
		int sumSiteCount = parkService.getBusinessTimePeriod().size();
		
		String sportId = dataInputView.getSportId();
		String createTimeStart = dataInputView.getCreateTimeStart();
		String createTimeEnd = dataInputView.getCreateTimeEnd();
		
		StringBuilder sql = new StringBuilder("SELECT IFNULL(SUM(sc),0) reserveCount");
		sql.append(" FROM(SELECT SUM(siteEndTime-siteStartTime) * (LENGTH(reserveDates) - LENGTH(REPLACE(reserveDates,',','')) + 1) sc");
		sql.append(" FROM site_reserve_time srt, site_reserve_date srd, site_reserve_basic srb, site_info si, site_sport ss");
		sql.append(" WHERE srt.reserveDateId = srd.reserveDateId AND srd.siteReserveId = srb.siteReserveId AND srt.siteId = si.siteId AND si.siteType = ss.sportId");
		if(StrUtil.isNotBlank(sportId)){
            sql.append(" AND ss.sportId = :sportId");
        }
		if(StrUtil.isNotBlank(createTimeStart)){
            sql.append(" AND DATE(srb.createTime) >= :createTimeStart");
        }
        if(StrUtil.isNotBlank(createTimeEnd)){
            sql.append(" AND DATE(srb.createTime) <= :createTimeEnd");
        }
        sql.append(getCountSql(dataInputView.getCountNum(), "srb.createTime"));
		sql.append(" GROUP BY srd.reserveDateId) t");
		
		int sc = baseDao.getUniqueResult(sql.toString(), JsonUtils.fromJson(dataInputView)).intValue();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("sumSiteCount", sumSiteCount);
		resultMap.put("emptySiteCount", sumSiteCount-sc);
		resultMap.put("useRate", sc / sumSiteCount * 1.0 * 100);
		resultMap.put("parkBusiness", parkService.getBusiness());
		return resultMap;
	}*/

	@Override
	public Map<String, Object> getBusinessSiteCount(DataInputView dataInputView){
		SiteInputView siteInputView = new SiteInputView();
		siteInputView.setSportId(StrUtil.objToInt(dataInputView.getSportId()));
		siteInputView.setSiteStatus(IDBConstant.LOGIC_STATUS_YES);
		List<Map<String, Object>> sites = siteService.getSiteNames(siteInputView);

		int sumSiteCount = (parkService.getBusinessTimePeriod().size()) * sites.size();

		String sportId = dataInputView.getSportId();
		String createTimeStart = dataInputView.getCreateTimeStart();
		String createTimeEnd = dataInputView.getCreateTimeEnd();

		StringBuilder sql = new StringBuilder("SELECT srd.reserveDateId, srd.reserveStartDate, srd.reserveEndDate, srt.reserveTimeId, srt.siteEndTime, srt.siteStartTime, srd.reserveDates");
		sql.append(" FROM site_reserve_time srt, site_reserve_date srd, site_info si, site_sport ss");
		sql.append(" WHERE srt.reserveDateId = srd.reserveDateId AND srt.siteId = si.siteId AND si.siteType = ss.sportId");
		if(StrUtil.isNotBlank(sportId)){
			sql.append(" AND ss.sportId = :sportId");
		}
		if(StrUtil.isNotBlank(createTimeStart) && StrUtil.isNotBlank(createTimeEnd)){
			sql.append(" AND ((DATE(srd.reserveStartDate) <= :createTimeStart AND DATE(srd.reserveEndDate) >= :createTimeStart) || (DATE(srd.reserveStartDate) <= :createTimeEnd AND DATE(srd.reserveEndDate) >= :createTimeEnd))");
		}

		List<Map<String, Object>> list = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));
		Map<String, Object> item = new HashMap<String, Object>();
		int hasReservedSize = 0;
		for (Map<String, Object> map : list) {
			String reserveDates = StrUtil.objToStr(map.get("reserveDates"));

			String[] reserveDatesList = reserveDates.split(",");
			if (reserveDatesList.length > 1) {
				for (int i = 0; i < reserveDatesList.length; i++) {
					String reserveDate = reserveDatesList[i];

					if(StrUtil.isNotBlank(createTimeStart) && StrUtil.isNotBlank(createTimeEnd)){
						if (reserveDate.compareTo(createTimeStart) >= 0 && reserveDate.compareTo(createTimeEnd) <= 0) {
							hasReservedSize++;
						}
					}
				}
			} else {
				hasReservedSize++;
			}
		}

		DecimalFormat df = new DecimalFormat("0.00");//格式化小数
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("sumSiteCount", sumSiteCount);
		resultMap.put("emptySiteCount", sumSiteCount - hasReservedSize);
		resultMap.put("useRate", df.format((hasReservedSize/(sumSiteCount*1.0))*100));
		return resultMap;
	}
	
	@Override
	public Map<String, Object> getBusinessSiteSignCount(DataInputView dataInputView){
		
		String sportId = dataInputView.getSportId();
		String createTimeStart = dataInputView.getCreateTimeStart();
		String createTimeEnd = dataInputView.getCreateTimeEnd();
		
		StringBuilder sql = new StringBuilder("SELECT COUNT(DISTINCT signMemberCardNo) signTeacherCount FROM member_site_sign mss, site_reserve_time srt, site_info si, site_sport ss");
		sql.append(" WHERE mss.reserveTimeId = srt.reserveTimeId AND srt.siteId = si.siteId AND si.siteType = ss.sportId");
		sql.append(" AND mss.signType = ").append(IDBConstant.LOGIC_STATUS_OTHER);
		if(StrUtil.isNotBlank(sportId)){
            sql.append(" AND ss.sportId = :sportId");
        }
		if(StrUtil.isNotBlank(createTimeStart)){
            sql.append(" AND DATE(mss.createTime) >= :createTimeStart");
        }
        if(StrUtil.isNotBlank(createTimeEnd)){
            sql.append(" AND DATE(mss.createTime) <= :createTimeEnd");
        }
        sql.append(getCountSql(dataInputView.getCountNum(), "mss.createTime"));
        int signTeacherCount = baseDao.getUniqueResult(sql.toString(), JsonUtils.fromJson(dataInputView)).intValue();
        
        sql.setLength(0);
        
        sql.append("SELECT COUNT(1) signTeacherCount FROM member_site_student_sign msss, site_sport ss");
        sql.append(" WHERE msss.sportId = ss.sportId");
        if(StrUtil.isNotBlank(sportId)){
            sql.append(" AND ss.sportId = :sportId");
        }
		if(StrUtil.isNotBlank(createTimeStart)){
            sql.append(" AND DATE(msss.createTime) >= :createTimeStart");
        }
        if(StrUtil.isNotBlank(createTimeEnd)){
            sql.append(" AND DATE(msss.createTime) <= :createTimeEnd");
        }
        sql.append(getCountSql(dataInputView.getCountNum(), "msss.createTime"));
        int signStudentCount = baseDao.getUniqueResult(sql.toString(), JsonUtils.fromJson(dataInputView)).intValue();
        
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("signTeacherCount", signTeacherCount);
        resultMap.put("signStudentCount", signStudentCount);
        return resultMap;
	}

	private String[] getCollateCountTime(Integer countNum){

		String[] times = new String[2];
		Date date = new Date();
		switch (countNum) {
			case IDBConstant.DATA_DATE_MONTH:
				times[0] = DateUtil.getTimesMonthmorning();
				times[1] = DateUtil.getTimesMonthnight();
				break;
			case IDBConstant.DATA_DATE_YEAR:
				times[0] = DateUtil.getCurrentYearEndTime();
				times[1] = DateUtil.getLastYearStartTime();
				break;
			case IDBConstant.DATA_DATE_WEEK:
				times[0] = DateUtil.getTimesWeekmorningStr();
				times[1] = DateUtil.getTimesWeeknightStr();
				break;
			case IDBConstant.DATA_DATE_PRE_DAY:
				times[0] = DateUtil.dateToString(DateUtil.addDate(date, -1), null) + IPlatformConstant.time00;
				times[1] = DateUtil.dateToString(date, null) + IPlatformConstant.time00;
				break;
			case IDBConstant.DATA_DATE_DAY:
				String nowDay = DateUtil.dateToString(date, null) + IPlatformConstant.time00;
				times[0] =nowDay;
				times[1] =nowDay;
				break;
		}

		return times;
	}

	@Override
	public void saveCollateInfo(OtherCollateInfo otherCollateInfo){
		if(otherCollateInfo.getCollateAmount() == null) throw new MessageException("对账金额必填");

		String[] collateCountTime = getCollateCountTime(StrUtil.objToInt(otherCollateInfo.getCollateCountNum()));
		otherCollateInfo.setCollateStartTime(collateCountTime[0]);
		otherCollateInfo.setCollateEndTime(collateCountTime[1]);

		otherCollateInfo.setCreateTime(DateUtil.getNowDate());
		baseDao.save(otherCollateInfo, otherCollateInfo.getCollateId());
	}

	@Override
	public List<OtherCollateInfo> getCollateInfos(DataInputView dataInputView){

		String[] collateCountTime = getCollateCountTime(dataInputView.getCountNum());
		dataInputView.setCreateTimeStart(collateCountTime[0]);
		dataInputView.setCreateTimeEnd(collateCountTime[1]);

		StringBuilder sql = new StringBuilder("SELECT * FROM other_collate_info WHERE collateCountNum = :countNum");
		sql.append(" AND collateStartTime = :createTimeStart");
		sql.append(" AND collateEndTime = :createTimeEnd");
		return JsonUtils.stringToArray(baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView)), OtherCollateInfo[].class);
	}

	@Override
	public Map<String, Object> getCollateInfosMap(DataInputView dataInputView){
		Map<String, Object> data = new HashMap<String, Object>();

		double collateAmount = 0;
		List<OtherCollateInfo> collateInfos = getCollateInfos(dataInputView);
		for (OtherCollateInfo otherCollateInfo : collateInfos){
			collateAmount = otherCollateInfo.getCollateAmount().doubleValue();
			switch (otherCollateInfo.getCollateType()){
				case IDBConstant.BALANCE_STYLE_XJ:
					data.put("xjCollateAmount", collateAmount);
					data.put("xjCollateStatus", otherCollateInfo.getCollateStatus());
					data.put("xjCollateRemark", otherCollateInfo.getCollateRemark());
					break;
				case IDBConstant.BALANCE_STYLE_ZFB:
					data.put("zfbCollateAmount", collateAmount);
					data.put("zfbCollateStatus", otherCollateInfo.getCollateStatus());
					data.put("zfbCollateRemark", otherCollateInfo.getCollateRemark());
					break;
				case IDBConstant.BALANCE_STYLE_WX:
					data.put("wxCollateAmount", collateAmount);
					data.put("wxCollateStatus", otherCollateInfo.getCollateStatus());
					data.put("wxCollateRemark", otherCollateInfo.getCollateRemark());
					break;
				case IDBConstant.BALANCE_STYLE_YINLIAN:
					data.put("yinlianCollateAmount", collateAmount);
					data.put("yinlianCollateStatus", otherCollateInfo.getCollateStatus());
					data.put("yinlianCollateRemark", otherCollateInfo.getCollateRemark());
					break;
				case IDBConstant.BALANCE_STYLE_ZHIPIAO:
					data.put("zhipiaoCollateAmount", collateAmount);
					data.put("zhipiaoCollateStatus", otherCollateInfo.getCollateStatus());
					data.put("zhipiaoCollateRemark", otherCollateInfo.getCollateRemark());
					break;
			}
		}
		return data;
	}
	
}
