package com.park.service.impl;

import static com.park.common.constant.IPlatformConstant.WEIXIN;
import static com.park.common.constant.IPlatformConstant.XIANJIN;
import static com.park.common.constant.IPlatformConstant.YINLIAN;
import static com.park.common.constant.IPlatformConstant.ZHIFUBAO;
import static com.park.common.constant.IPlatformConstant.ZHIPIAO;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.DataInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IDBConstant;
import com.park.common.constant.IPlatformConstant;
import com.park.common.util.DateUtil;
import com.park.common.util.JsonUtils;
import com.park.common.util.SQLUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IDataService;
import com.park.service.IXlsExportImportService;

@Service
public class DataServiceImpl extends BaseService implements IDataService {

	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IXlsExportImportService xlsExportImportService;

	// 查询某周的会员注册统计
    @Override
    public Map<String, Object> getCountMembersByWeek(DataInputView dataInputView) {
        /*List<String> dateList = DateUtil.getWeekDate("");

        ArrayList<String> weeks = new ArrayList<String>() {{
            add("Monday");
            add("Tuesday");
            add("Wednesday");
            add("Thursday");
            add("Friday");
            add("Saturday");
            add("Sunday");
        }};

        // 全周每天的统计
        StringBuffer sql = new StringBuffer("SELECT mc.cardTypeId, mct.cardTypeName");
        sql.append(", COUNT(case when (DATE_FORMAT(mc.createTime, '%Y-%m-%d')>='" + dateList.get(0) +
                "' AND DATE_FORMAT(mc.createTime, '%Y-%m-%d')<='" + dateList.get(dateList.size() - 1) +
                "') then 'allWeek' end) as 'allWeek'");
        for (int i = 0; i < dateList.size(); i++) {
            sql.append(", COUNT(case when DATE_FORMAT(mc.createTime, '%Y-%m-%d')='" + dateList.get(i) +
                    "' then '" + weeks.get(i) + "' end) as '" + weeks.get(i) + "'");
        }
        sql.append(" FROM member_card mc INNER JOIN member_card_type mct ON mc.cardTypeId = mct.cardTypeId");
        sql.append(" GROUP BY mc.cardTypeId ORDER BY mc.cardTypeId ASC");

        List<Map<String, Object>> dataWeekList = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));

        // 全周统计
        StringBuffer countSql = new StringBuffer("SELECT '合计' as 'cardTypeName'");
        countSql.append(", COUNT(case when (DATE_FORMAT(mc.createTime, '%Y-%m-%d')>='" + dateList.get(0) +
                "' AND DATE_FORMAT(mc.createTime, '%Y-%m-%d')<='" + dateList.get(dateList.size() - 1) +
                "') then 'allWeek' end) as 'allWeek'");
        for (int i = 0; i < dateList.size(); i++) {
            countSql.append(", COUNT(case when DATE_FORMAT(mc.createTime, '%Y-%m-%d')='" + dateList.get(i) +
                    "' then '" + weeks.get(i) + "' end) as '" + weeks.get(i) + "'");
        }
        countSql.append(" FROM member_card mc INNER JOIN member_card_type mct ON mc.cardTypeId = mct.cardTypeId");

        List<Map<String, Object>> dataCountList = baseDao.queryBySql(countSql.toString(), JsonUtils.fromJson(dataInputView));

        // 组合数据
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("data", dataWeekList);
        resultMap.put("total", dataCountList);
        resultMap.put("DICT", weeks);

        return resultMap;*/
    	return null;
    }

    // 查询某月的会员注册统计
    @Override
    public Map<String, Object> getCountMembersByMonth(DataInputView dataInputView) {
        /*List<String> dateList = DateUtil.getMonthDate("");

        // 全月每天的统计
        StringBuffer sql = new StringBuffer("SELECT mc.cardTypeId, mct.cardTypeName");
        sql.append(", COUNT(case when (DATE_FORMAT(mc.createTime, '%Y-%m-%d')>='" + dateList.get(0) +
                "' AND DATE_FORMAT(mc.createTime, '%Y-%m-%d')<='" + dateList.get(dateList.size() - 1) +
                "') then 'allMonth' end) as 'allMonth'");
        for (int i = 0; i < dateList.size(); i++) {
            sql.append(", COUNT(case when DATE_FORMAT(mc.createTime, '%Y-%m-%d')='" + dateList.get(i) +
                    "' then '" + dateList.get(i) + "' end) as '" + dateList.get(i) + "'");
        }
        sql.append(" FROM member_card mc INNER JOIN member_card_type mct ON mc.cardTypeId = mct.cardTypeId");
        sql.append(" GROUP BY mc.cardTypeId ORDER BY mc.cardTypeId ASC");

        List<Map<String, Object>> dataMonthList = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(dataInputView));

        // 全月统计
        StringBuffer countSql = new StringBuffer("SELECT '合计' as 'cardTypeName'");
        countSql.append(", COUNT(case when (DATE_FORMAT(mc.createTime, '%Y-%m-%d')>='" + dateList.get(0) +
                "' AND DATE_FORMAT(mc.createTime, '%Y-%m-%d')<='" + dateList.get(dateList.size() - 1) +
                "') then 'allMonth' end) as 'allMonth'");
        for (int i = 0; i < dateList.size(); i++) {
            countSql.append(", COUNT(case when DATE_FORMAT(mc.createTime, '%Y-%m-%d')='" + dateList.get(i) +
                    "' then '" + dateList.get(i) + "' end) as '" + dateList.get(i) + "'");
        }
        countSql.append(" FROM member_card mc INNER JOIN member_card_type mct ON mc.cardTypeId = mct.cardTypeId");

        List<Map<String, Object>> dataCountList = baseDao.queryBySql(countSql.toString(), JsonUtils.fromJson(dataInputView));

        // 组合数据
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("data", dataMonthList);
        resultMap.put("total", dataCountList);
        resultMap.put("DICT", dateList);

        return resultMap;*/
    	return null;
    }
    
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
    		dataInputView.setCreateTimeEnd(DateUtil.getTimesWeeknight());
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
    	
    	resultMap.put("num", num-1);
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
    	sql.append(" ,SUM(CASE WHEN ob.balanceServiceType IN(100,200) THEN ob.realAmount ELSE 0 END) siteXF");
    	sql.append(" ,SUM(CASE WHEN ob.balanceServiceType = 300 THEN ob.realAmount ELSE 0 END) goodsXF");
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
			dataInputView.setCreateTimeEnd(DateUtil.getTimesWeeknight());
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
                return " AND YEARWEEK("+field+") = YEARWEEK(CURDATE())";
            case IDBConstant.DATA_DATE_PRE_WEEK: //上周
                return " AND YEARWEEK("+field+") = YEARWEEK(CURDATE())-1";
            case IDBConstant.DATA_DATE_NEXT_WEEK: //下周
                return " AND YEARWEEK("+field+") = YEARWEEK(CURDATE())+1";
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
	
	@Override
	public Map<String, Object> getSitePercentage(DataInputView dataInputView){
		
		int page = dataInputView.getPage();
		int pageSize = dataInputView.getPageSize();
		String sportId = dataInputView.getSportId();
		Integer countNum = dataInputView.getCountNum();
		String createTimeStart = dataInputView.getCreateTimeStart();
		String createTimeEnd = dataInputView.getCreateTimeEnd();
		
		/**
		 *    — 计算数据：场地预订率 = 预订场次数 / 总场次数
			  — 计算数据：场地使用率 = 签到场次数 / 预订场次数
			  — 检索条件：全部，今天，本周，本年，自定义的起止日期，场地类型
		 */
		StringBuilder sql = new StringBuilder("SELECT ss.sportName, si.siteName, SUM(oi.sumCount) siteSumCount, SUM(oi.useCount) siteUseCount, SUM(oi.useCount)/SUM(oi.sumCount) siteUsePercentage");
		if(StrUtil.isNotBlank(createTimeStart) && StrUtil.isNotBlank(createTimeEnd)){
			sql.append(" ,DATEDIFF(':createTimeStart',':createTimeEnd') * (ss.`endTime`-ss.`startTime`) AS siteBusinessCount");
		}

		if (countNum != null) {
            if (countNum == 2 || countNum == 1) {
                sql.append(" ,(ss.`endTime`-ss.`startTime`) AS siteBusinessCount");
            }
            if (countNum == 3 || countNum == 100 || countNum == 200) {
                sql.append(" ,7*(ss.`endTime`-ss.`startTime`) AS siteBusinessCount");
            }
            if (countNum == 4) {
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
		StringBuilder sql = new StringBuilder("SELECT cardTypeName name, SUM(realAmount) price, ob.balanceStyle style, ob.balanceId");
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
		sql.append("SELECT dictValue name, SUM(realAmount) price, ob.balanceStyle style, ob.balanceId");
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
		sql.append("SELECT dictValue name, SUM(realAmount) price, ob.balanceStyle style, ob.balanceId");
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
		sumPriceMap.put("sumPrice", xianjinSum+zhifubaoSum+weixinSum+yinlianSum+zhipiaoSum);
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
		xlsExportImportService.writeWorkbook(StrUtil.zeroToLine(siteList), workbook, 0, 0, sheetAt0.getLastRowNum()+2, false);
		xlsExportImportService.writeWorkbook(getSum(siteCounts, "场地收入小计"), workbook, 0, 0, sheetAt0.getLastRowNum()+1, false);
		
		Map goodsCounts = (Map)resultMap.get("goodsCounts");
		List goodsList = (List) goodsCounts.get("countList");
		xlsExportImportService.writeWorkbook(StrUtil.zeroToLine(goodsList), workbook, 0, 0, sheetAt0.getLastRowNum()+2, false);
		xlsExportImportService.writeWorkbook(getSum(goodsCounts, "商品收入小计"), workbook, 0, 0, sheetAt0.getLastRowNum()+1, false);
		
		xlsExportImportService.writeWorkbook(getSum(resultMap, "金额总计"), workbook, 0, 0, sheetAt0.getLastRowNum()+1, true);
		return workbook;
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
	public PageBean getOtherBalance(DataInputView dataInputView){
		StringBuilder headSql = new StringBuilder("");
		StringBuilder bodySql = new StringBuilder("");
		StringBuilder whereSql = new StringBuilder("");
		
		return super.getPageBean(headSql, bodySql, whereSql, dataInputView);
	}
	
	
	
	
}
