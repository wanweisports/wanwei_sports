package com.park.service.impl;

import static com.park.common.constant.IPlatformConstant.WEIXIN;
import static com.park.common.constant.IPlatformConstant.XIANJIN;
import static com.park.common.constant.IPlatformConstant.ZHIFUBAO;

import java.util.ArrayList;
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
			return " AND DATE_FORMAT("+field+", '%Y-%m-%d') = CURDATE()";
		default:
			return " ";
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
			map.put("sumCount", StrUtil.objToInt(map.get("sumCount")));
			map.put("useCount", StrUtil.objToInt(map.get("useCount")));
		}
		PageBean pageBean = new PageBean(siteCountList, page, pageSize, siteCountList.size());
		pageBean.pagedList().init();
		
		double sumSportUsePercentage = 0;
		int sportCount = 0;
		for(Map<String, Object> map : sportCountList){
			Double sumCount = StrUtil.objToDoubleDef0(map.get("sumCount"));
			Double useCount = StrUtil.objToDoubleDef0(map.get("useCount"));
			double percentage = StrUtil.roundKeepTwo(useCount/sumCount);
			sumSportUsePercentage += percentage;
			sportCount++;
		}
		Map<String, Object> allSportCountMap = new HashMap<String, Object>();
		allSportCountMap.put("sportName", "全部");
		allSportCountMap.put("percentage", sumSportUsePercentage/sportCount);
		sportCountList.add(0, allSportCountMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("pageBean", JsonUtils.fromJson(pageBean));
		resultMap.put("sportCountList", sportCountList);

		return resultMap;
	}
	
	@Override
	public PageBean getDataMembersAttendance(DataInputView dataInputView){
		StringBuilder headSql = new StringBuilder("SELECT mc.cardNo, um.memberName, srb.`name`, mss.signDate, oi.orderNo, mss.signName, mss.signMobile, si.siteName, ss.sportName");
		StringBuilder bodySql = new StringBuilder(" FROM member_site_sign mss");
		bodySql.append(" JOIN order_info oi ON(mss.orderId = oi.orderId)");
		bodySql.append(" JOIN site_reserve_time srt ON(mss.reserveTimeId = srt.reserveTimeId)");
		bodySql.append(" JOIN site_reserve_basic srb ON(oi.orderId = srb.orderId)");
		bodySql.append(" JOIN site_info si ON(srt.siteId = si.siteId)");
		bodySql.append(" JOIN site_sport ss ON(si.siteType = ss.sportId)");
		bodySql.append(" LEFT JOIN user_member um ON(um.memberId = oi.memberId)");
		bodySql.append(" LEFT JOIN member_card mc ON(mc.memberId = um.memberId)");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
		
		return super.getPageBean(headSql, bodySql, whereSql, dataInputView);
	}
	
	@Override
	public Map<String, Object> getBusinessIncome(DataInputView dataInputView){
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		StringBuilder sql = new StringBuilder("SELECT cardTypeName name, SUM(realAmount) price, ob.balanceStyle style, ob.balanceId");
		sql.append(" FROM member_card_type mct");
		sql.append(" LEFT JOIN member_card mc ON(mct.cardTypeId = mc.cardTypeId)");
		sql.append(" LEFT JOIN other_balance ob ON(ob.balanceServiceId = mc.cardId AND '' = ? AND ob.balanceServiceType >= ? AND ob.balanceServiceType <= ?)");
		sql.append(" GROUP BY mct.cardTypeId, ob.balanceStyle ORDER BY mct.cardTypeId");
		List<Map<String, Object>> cardCountsList = baseDao.queryBySql(sql.toString(), StrUtil.EMPTY, StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_REG), StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_CARD_BUBAN_STUDENT));
		resultMap.put("cardCounts", getCountMap(cardCountsList));
		
		sql.setLength(0);
		sql.append("SELECT dictValue name, SUM(realAmount) price, ob.balanceStyle style, ob.balanceId");
		sql.append(" FROM system_dict sd");
		sql.append(" LEFT JOIN other_balance ob ON(ob.balanceServiceType = sd.dictKey)");
		sql.append(" LEFT JOIN order_info oi ON(ob.balanceServiceId = oi.orderId)");
		sql.append(" WHERE dictName = ? AND dictKey >= ? AND dictKey <= ?");
		sql.append(" GROUP BY dictKey, ob.balanceStyle ORDER BY dictKey");
		List<Map<String, Object>> siteCountsList = baseDao.queryBySql(sql.toString(), IDBConstant.BALANCE_SERVICE_TYPE, StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_SITE), StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_BLOCK_SITE));
		resultMap.put("siteCounts", getCountMap(siteCountsList));
		
		sql.setLength(0);
		sql.append("SELECT dictValue name, SUM(realAmount) price, ob.balanceStyle style, ob.balanceId");
		sql.append(" FROM system_dict sd");
		sql.append(" LEFT JOIN other_balance ob ON(ob.balanceServiceType = sd.dictKey)");
		sql.append(" LEFT JOIN order_info oi ON(ob.balanceServiceId = oi.orderId)");
		sql.append(" WHERE dictName = ? AND dictKey = ?");
		sql.append(" GROUP BY dictKey, ob.balanceStyle ORDER BY dictKey");
		List<Map<String, Object>> goodsCountsList = baseDao.queryBySql(sql.toString(), IDBConstant.BALANCE_SERVICE_TYPE, StrUtil.objToInt(IDBConstant.BALANCE_SERVICE_TYPE_GOODS));
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
		double xianjin = 0, zhifubao = 0, weixin = 0;
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
			default:
				tempMap.put(XIANJIN, StrUtil.objToDoubleDef0(tempMap.get(XIANJIN))+0);
				tempMap.put(ZHIFUBAO, StrUtil.objToDoubleDef0(tempMap.get(ZHIFUBAO))+0);
				tempMap.put(WEIXIN, StrUtil.objToDoubleDef0(tempMap.get(WEIXIN))+0);
				break;
			}
			tempMap.put("sumPrice", StrUtil.objToDoubleDef0(tempMap.get(XIANJIN))+StrUtil.objToDoubleDef0(tempMap.get(ZHIFUBAO))+StrUtil.objToDoubleDef0(tempMap.get(WEIXIN)));
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
		return map;
	}
	
	private Map<String, Object> getCountSumPrice(List<Map<String, Object>> countList){
		double xianjinSum = 0, zhifubaoSum = 0, weixinSum = 0;
		for(Map<String, Object> map : countList){
			xianjinSum += StrUtil.objToDoubleDef0(map.get(XIANJIN));
			zhifubaoSum += StrUtil.objToDoubleDef0(map.get(ZHIFUBAO));
			weixinSum += StrUtil.objToDoubleDef0(map.get(WEIXIN));
			
		}
		Map<String, Object> sumPriceMap = new HashMap<String, Object>();
		sumPriceMap.put("xianjinSumPrice", xianjinSum);
		sumPriceMap.put("zhifubaoSumPrice", zhifubaoSum);
		sumPriceMap.put("weixinSumPrice", weixinSum);
		sumPriceMap.put("sumPrice", xianjinSum+zhifubaoSum+weixinSum);
		return sumPriceMap;
	}
	
}
