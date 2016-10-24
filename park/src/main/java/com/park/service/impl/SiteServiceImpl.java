package com.park.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.PageBean;
import com.park.common.bean.SiteInputView;
import com.park.common.bean.out.ReserveInfo;
import com.park.common.bean.out.Site;
import com.park.common.bean.out.SiteReserveOutputView;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.MemberCard;
import com.park.common.po.MemberCardType;
import com.park.common.po.OrderInfo;
import com.park.common.po.ParkBusiness;
import com.park.common.po.SiteInfo;
import com.park.common.po.SiteReserveBasic;
import com.park.common.po.SiteReserveDate;
import com.park.common.po.SiteReserveTime;
import com.park.common.po.SiteSport;
import com.park.common.po.UserMember;
import com.park.common.util.DateUtil;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IMemberService;
import com.park.service.IOrderService;
import com.park.service.IParkService;
import com.park.service.ISiteService;

@Service
public class SiteServiceImpl extends BaseService implements ISiteService {

	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IParkService parkService;
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IOrderService orderService;
	
	@Override
	public Integer saveSiteSport(SiteSport siteSport) {
		Integer sportId = siteSport.getSportId();
		String nowDate = DateUtil.getNowDate();
		if(sportId != null){ //修改
			SiteSport siteSportDB = this.getSiteSport(sportId);
			if(this.getSiteSport(sportId) == null) throw new MessageException("该场地类型不存在！");
			siteSportDB.setSportName(siteSport.getSportName());
			siteSportDB.setSportDeposit(siteSport.getSportDeposit());
			siteSportDB.setStartTime(siteSport.getStartTime());
			siteSportDB.setEndTime(siteSport.getEndTime());
			siteSportDB.setSportCustom(siteSport.getSportCustom());
			siteSportDB.setSportMoney(siteSport.getSportMoney());
			siteSportDB.setSportStatus(siteSport.getSportStatus());
			siteSportDB.setUpdateTime(nowDate);
			baseDao.save(siteSportDB, sportId);
			return siteSportDB.getSportId();
		}else{ //新增
			siteSport.setCreateTime(nowDate);
			baseDao.save(siteSport, null);
		}
		if(IDBConstant.LOGIC_STATUS_YES.equals(siteSport.getSportCustom())){
			//处理自定义时间价格（改为单独接口）
			
		}
		return siteSport.getSportId();
	}
	
	@Override
	public Integer saveSiteInfo(SiteInfo siteInfo) {
		Integer siteId = siteInfo.getSiteId();
		String nowDate = DateUtil.getNowDate();
		if(this.getSiteSport(siteInfo.getSiteType()) == null) throw new MessageException("该场地类型不存在！");
		if(siteId != null){ //修改
			SiteInfo siteInfoDB = this.getSiteInfo(siteId);
			if(this.getSiteInfo(siteId) == null) throw new MessageException("该场地不存在！");
			siteInfoDB.setSiteName(siteInfo.getSiteName());
			siteInfoDB.setSiteRemark(siteInfo.getSiteRemark());
			siteInfoDB.setSiteType(siteInfo.getSiteType());
			siteInfoDB.setSiteStatus(siteInfo.getSiteStatus());
			siteInfoDB.setUpdateTime(nowDate);
			baseDao.save(siteInfoDB, siteId);
			return siteInfoDB.getSiteId();
		}else{ //新增
			siteInfo.setSiteNo(getSiteNo());
			siteInfo.setCreateTime(nowDate);
			baseDao.save(siteInfo, null);
		}
		return siteInfo.getSiteId();
	}
	
	@Override
	public SiteSport getSiteSport(int sportId) {
		return baseDao.getToEvict(SiteSport.class, sportId);
	}
	
	@Override
	public SiteInfo getSiteInfo(int siteId) {
		return baseDao.getToEvict(SiteInfo.class, siteId);
	}
	
	@Override
	public Map<String, Object> getSiteInfoMap(int siteId) {
		return baseDao.queryBySqlFirst("SELECT si.*, ss.sportName FROM site_info si, site_sport ss WHERE si.siteType = ss.sportId AND si.siteId = ?", siteId);
	}
	
	@Override
	public SiteSport getSiteSportInfo(int siteId) {
		return baseDao.queryByHqlFirst("SELECT ss FROM SiteInfo si, SiteSport ss WHERE si.siteType = ss.sportId AND si.siteId = ? AND si.siteStatus = ? AND ss.sportStatus = ?", siteId, IDBConstant.LOGIC_STATUS_YES, IDBConstant.LOGIC_STATUS_YES);
	}
	
	@Override
	public List<Map<String, Object>> getSiteNames(SiteInputView siteInputView) {
		String siteStatus = siteInputView.getSiteStatus();
		
		StringBuilder sql = new  StringBuilder("SELECT siteId, siteName, siteStatus FROM site_info WHERE 1=1");
		if(StrUtil.isNotBlank(siteStatus)){
			sql.append(" AND siteStatus = :siteStatus");
		}
		Map<String, Object> paramMap = JsonUtils.fromJson(siteInputView);
		return baseDao.queryBySql(sql.toString(), paramMap);
	}
	
	@Override
	public List<Map<String, Object>> getSiteSportNames(SiteInputView siteInputView) {
		String sportStatus = siteInputView.getSportStatus();
		
		StringBuilder sql = new  StringBuilder("SELECT sportId, sportName, sportStatus FROM site_sport WHERE 1=1");
		if(StrUtil.isNotBlank(sportStatus)){
			sql.append(" AND sportStatus = :sportStatus");
		}
		Map<String, Object> paramMap = JsonUtils.fromJson(siteInputView);
		return baseDao.queryBySql(sql.toString(), paramMap);
	}
	
	@Override
	public PageBean getSiteInfos(SiteInputView siteInputView) {
		Integer sportId = siteInputView.getSportId();
		String siteName = siteInputView.getSiteName();
		
		StringBuilder headSql = new StringBuilder("SELECT siteId, siteName, sportName, siteRemark, siteStatus, operatorName, si.createTime");
		StringBuilder bodySql = new StringBuilder(" FROM site_info si, site_sport ss, user_operator uo");
		StringBuilder whereSql = new StringBuilder(" WHERE si.siteType = ss.sportId AND si.salesId = uo.id");
		if(sportId != null){
			whereSql.append(" AND ss.sportId = :sportId");
		}
		if(StrUtil.isNotBlank(siteName)){
			whereSql.append(" AND si.siteName = :siteName");
		}
		return super.getPageBean(headSql, bodySql, whereSql, siteInputView);
	}
	
	@Override
	public PageBean getSiteSports(SiteInputView siteInputView) {
		StringBuilder headSql = new StringBuilder("SELECT sportId, sportName, sportMoney, sportDeposit, startTime, endTime, sportStatus, operatorName, ss.createTime");
		StringBuilder bodySql = new StringBuilder(" FROM site_sport ss, user_operator uo");
		StringBuilder whereSql = new StringBuilder(" WHERE ss.salesId = uo.id");
		return super.getPageBean(headSql, bodySql, whereSql, siteInputView);
	}
	
	@Override
	public SiteReserveOutputView getSiteReservationInfo(SiteInputView siteInputView) throws ParseException{
		
		ParkBusiness business = parkService.getBusiness();
		if(business == null) throw new MessageException("请设置场馆营业时间");
		
		String siteDate = siteInputView.getSiteDate(); //选中场馆的日期
		if(StrUtil.isBlank(siteDate)) throw new MessageException("参数错误");
		
		siteInputView.setSiteStatus(IDBConstant.LOGIC_STATUS_YES);
		siteInputView.setSportStatus(IDBConstant.LOGIC_STATUS_YES);
		List<Map<String, Object>> list = getSites(siteInputView);
		
		List<Map<String, Object>> timePeriodList = parkService.getTimePeriod(business);
		
		SiteReserveOutputView siteReserveOutputView = new SiteReserveOutputView();
		List<Site> siteInfos = new ArrayList<Site>();
		
		String siteDateSub1 = DateUtil.getAddDay(siteDate, -1);
		for(Map<String, Object> map : list){
			Site site = new Site();
			site.setSiteId(StrUtil.objToStr(map.get("siteId")));
			site.setSiteName(StrUtil.objToStr(map.get("siteName")));
			Date siteStartTime = DateUtil.getHHMM(StrUtil.objToStr(map.get("startTime")));
			Date siteEndTime = DateUtil.getHHMM(StrUtil.objToStr(map.get("endTime")));
			
			List<ReserveInfo> reserveInfos = new ArrayList<ReserveInfo>();
			for(Map<String, Object> p : timePeriodList){
				ReserveInfo reserveInfo = new ReserveInfo();
				
				String startTime = StrUtil.objToStr(p.get("startTime"));
				String endTime = StrUtil.objToStr(p.get("endTime"));
				
				Map<String, Object> reserveIntersectionMap = this.getReserveIntersection(StrUtil.objToInt(site.getSiteId()), siteDateSub1, siteDate, StrUtil.objToStr(DateUtil.getWeek(DateUtil.stringToDate(siteDate, null))), startTime, endTime);
				if(reserveIntersectionMap != null){
					reserveInfo.setOperatorName(StrUtil.objToStr(reserveIntersectionMap.get("name")));
					reserveInfo.setOperatorMobile(StrUtil.objToStr(reserveIntersectionMap.get("mobile")));
					reserveInfo.setOpType(StrUtil.objToStr(reserveIntersectionMap.get("opType")));
					reserveInfo.setReserveType(StrUtil.objToStr(reserveIntersectionMap.get("reserveType")));
					reserveInfo.setSiteReserveStatus(StrUtil.objToStr(reserveIntersectionMap.get("siteReserveStatus")));
				}else{  //每个开始-结束数据段在 场地类型时间 之类
					if(siteStartTime.getTime() <= DateUtil.getHHMM(startTime).getTime() && siteEndTime.getTime() >= DateUtil.getHHMM(endTime).getTime()){
						reserveInfo.setSiteReserveStatus("5");
					}else{
						reserveInfo.setSiteReserveStatus("4");
					}
				}
				reserveInfo.setStartTime(startTime);
				reserveInfo.setEndTime(endTime);
				reserveInfos.add(reserveInfo);
			}
			site.setReserveInfos(reserveInfos);
			siteInfos.add(site);
		}
		siteReserveOutputView.setSiteInfos(siteInfos);
		return siteReserveOutputView;
	}
	
	@Override
	public List<Map<String, Object>> getSites(SiteInputView siteInputView){
		Integer sportId = siteInputView.getSportId();
		String siteStatus = siteInputView.getSiteStatus();
		String sportStatus = siteInputView.getSportStatus();
		StringBuffer sql = new StringBuffer("SELECT *");
		sql.append(" FROM site_info si, site_sport ss WHERE si.siteType = ss.sportId");
		if(sportId != null){
			sql.append(" AND ss.sportId = :sportId");
		}
		if(StrUtil.isNotBlank(siteStatus)){
			sql.append(" AND si.siteStatus = :siteStatus");
		}
		if(StrUtil.isNotBlank(sportStatus)){
			sql.append(" AND ss.sportStatus = :sportStatus");
		}
		return baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(siteInputView));
	}
	
	/*private SiteReserve getSiteReserve(String siteDate, String startTime, String endTime, int siteId){
		return baseDao.queryByHqlFirst("FROM SiteReserve WHERE siteDate=? AND siteStartTime=? AND siteEndTime=? AND siteId = ?", siteDate, startTime, endTime, siteId);
	}*/
	
	//先生成订单，在修改订单
	@Override
	public Integer saveReservationSite(SiteInputView siteInputView) throws ParseException{
		SiteReserveBasic siteReserveBasic = JsonUtils.fromJsonDF(siteInputView.getSiteOperationJson(), SiteReserveBasic.class);
		List<SiteReserveDate> siteReserveDateList = siteReserveBasic.getSiteReserveDateList();
		
		String nowDate = DateUtil.getNowDate();
		siteReserveBasic.setCreateTime(nowDate);
		siteReserveBasic.setSalesId(siteInputView.getSalesId());
		
		UserMember member = null;
		OrderInfo orderInfo = new OrderInfo();
		if(IDBConstant.LOGIC_STATUS_YES.equals(siteReserveBasic.getOpType())){
			member = memberService.getUserMember(siteReserveBasic.getMemberId());
			orderInfo.setMemberId(member.getMemberId());
		}else{
			orderInfo.setMemberId(0); //散客
		}
		
		orderInfo.setOrderServiceType(IDBConstant.LOGIC_STATUS_YES.equals(siteReserveBasic.getReserveModel()) ? IDBConstant.ORDER_SERVICE_TYPE_SITE : IDBConstant.ORDER_SERVICE_TYPE_BLOCK_SITE);
		orderInfo.setPayStatus(IDBConstant.LOGIC_STATUS_NO); //未支付
		orderInfo.setSalesId(siteReserveBasic.getSalesId());
		
		Map<String, Object> priceMap = getPrice(siteReserveDateList, siteReserveBasic.getMemberId(), siteReserveBasic.getOpType());
		orderInfo.setOrderSumPrice(StrUtil.objToDouble(priceMap.get("originalPrice")));
		
		Integer orderId = orderService.saveOrderInfo(orderInfo, null);
		
		siteReserveBasic.setOrderId(orderId);
		siteReserveBasic.setSiteReserveStatus(orderInfo.getPayStatus());
		baseDao.save(siteReserveBasic, null);
		
		for(SiteReserveDate siteReserveDate : siteReserveDateList){
			
			siteReserveDate.setSiteReserveId(siteReserveBasic.getSiteReserveId());
			baseDao.save(siteReserveDate, null);
			List<SiteReserveTime> siteReserveTimeList = siteReserveDate.getSiteReserveTimeList();
			for(SiteReserveTime siteReserveTime : siteReserveTimeList){
				
				//判断是否在场地类型时间内
				SiteSport siteSportInfo = this.getSiteSportInfo(siteReserveTime.getSiteId());
				if(siteSportInfo == null) throw new MessageException("该场地已关闭");
				
				Date siteStartTime = DateUtil.getHHMM(siteSportInfo.getStartTime());
				Date siteEndTime = DateUtil.getHHMM(siteSportInfo.getEndTime());
				Date startTime = DateUtil.getHHMM(siteReserveTime.getSiteStartTime());
				Date endTime = DateUtil.getHHMM(siteReserveTime.getSiteEndTime());
				
				if(!(siteStartTime.getTime() <= startTime.getTime() && siteEndTime.getTime() >= endTime.getTime())){
					 throw new MessageException(siteReserveTime.getSiteStartTime()+"-"+siteReserveTime.getSiteEndTime()+"不在该场地时间范围内");
				}
				//判断时间是否重复
				Map<String, Object> reserveRepeatMap = this.getReserveIntersection(siteReserveTime.getSiteId(), siteReserveDate.getReserveStartDate(), siteReserveDate.getReserveEndDate(), siteReserveDate.getReserveWeek(), siteReserveTime.getSiteStartTime(), siteReserveTime.getSiteEndTime());
				if(reserveRepeatMap != null) throw new MessageException("【"+siteReserveDate.getReserveStartDate()+"至"+siteReserveDate.getReserveEndDate()+"日期，"+siteReserveTime.getSiteStartTime()+"-"+siteReserveTime.getSiteEndTime()+"，星期："+siteReserveDate.getReserveWeek()+"】与其他顾客预定时间有冲突，请重新选择");
				
				siteReserveTime.setReserveDateId(siteReserveDate.getReserveDateId());
				baseDao.save(siteReserveTime, null);
			}
			
			/*Integer siteId = siteOpInfo.getSiteId();
			
			String startTime = siteOpInfo.getStartTime();
			String endTime = siteOpInfo.getEndTime();
			String siteDate = siteOpInfo.getSiteDate();
			
			Map<String, Object> siteSport = getSiteSportName(siteId);
			
			//场馆类型开场时间
			String sportStartTimeStr = StrUtil.objToStr(siteSport.get("startTime"));
			String sportEndTimeStr = StrUtil.objToStr(siteSport.get("endTime"));
			Date sportStartTime = DateUtil.getHHMM(sportStartTimeStr);
			Date sportEndTime = DateUtil.getHHMM(sportEndTimeStr);
			
			//不在场馆类型时间内
			if(!(sportStartTime.getTime() <= DateUtil.getHHMM(startTime).getTime() && sportEndTime.getTime() >= DateUtil.getHHMM(endTime).getTime())) throw new MessageException("场馆["+siteSport.get("siteName")+"]开场时间为："+sportStartTimeStr+"-"+sportEndTimeStr+"，请选择正确的时间");
			String siteName = StrUtil.objToStr(siteSport.get("siteName"));
			
			SiteReserve reserveIntersection = getReserveIntersection(startTime, endTime, siteDate);
			//！if(reserveIntersection != null) throw new MessageException("["+siteName+"]"+reserveIntersection.getSiteStartTime()+"-"+reserveIntersection.getSiteEndTime()+"时间段已有顾客预定");
			
			SiteReserve siteReserve = new SiteReserve();
			siteReserve.setSiteReserveStatus(orderInfo.getPayStatus());
			siteReserve.setMemberId(orderInfo.getMemberId());
			siteReserve.setReserveStartDate(siteDate);
			siteReserve.setReserveEndDate(reserveEndDate)
			siteReserve.setSiteId(siteId);
			siteReserve.setSalesId(salesId);
			siteReserve.setSiteStartTime(startTime);
			siteReserve.setSiteEndTime(endTime);
			siteReserve.setReserveType(reserveType);
			siteReserve.setCreateTime(nowDate);
			if(member != null){
				siteReserve.setName(member.getMemberName());
				siteReserve.setMobile(member.getMemberMobile());
				siteReserve.setMemberId(memberId);
			}else{
				siteReserve.setMobile(mobile);
				siteReserve.setName(name);
			}
			siteReserve.setOpType(opType);
			siteReserves.add(siteReserve);
			*/
		}

		return orderId;
	}
	
	@Override
	public Integer updateLockSite(SiteInputView siteInputView){
		//String lockSiteJson = siteInputView.getLockSiteJson();
		
		return 0;
		
	}
	
	@Override
	public Map<String, Object> calculateSiteMoney(SiteInputView siteInputView) throws ParseException{
		SiteReserveBasic siteReserveBasic = JsonUtils.fromJsonDF(siteInputView.getSiteOperationJson(), SiteReserveBasic.class);
		List<SiteReserveDate> siteReserveDateList = siteReserveBasic.getSiteReserveDateList();
		Integer memberId = siteReserveBasic.getMemberId();
		String opType = siteReserveBasic.getOpType(); //1.会员 2.散客
		
		Map<String, Object> resultMap = getPrice(siteReserveDateList, memberId, opType);
		
		return resultMap;
	}

	private Map<String, Object> getPrice(List<SiteReserveDate> siteReserveDateList, Integer memberId, String opType) throws ParseException {
		double discount = 100;
		if(IDBConstant.LOGIC_STATUS_YES.equals(opType) && memberId != null){ //会员打折
			//获取会员的会员卡，（如果后期有多张会员卡，则需要在前端用户选择哪张卡，把会员卡id传到后台查询折扣）
			List<MemberCard> memberCards = memberService.getMemberCards(memberId);
			if(memberCards.size() > 0){ //memberCards.size()==0：没有会员卡按不打折计算   throw new MessageException("该用户没有绑定会员卡");
				MemberCardType memberCardType = memberService.getMemberCardType(memberCards.get(0).getCardTypeId());
				discount = memberCardType.getCardTypeDiscount();
			}
		}
		
		Double originalPriceSum = 0.0; //原价
		for(SiteReserveDate siteReserveDate : siteReserveDateList){
			int weekNums = DateUtil.getDateScopeWeekNums(siteReserveDate.getReserveStartDate(), siteReserveDate.getReserveEndDate(), siteReserveDate.getReserveWeek());
			List<SiteReserveTime> siteReserveTimeList = siteReserveDate.getSiteReserveTimeList();
			Double originalPrice = 0.0;
			for(SiteReserveTime siteReserveTime : siteReserveTimeList){
				int hourNums = DateUtil.getTimeHourNums(siteReserveTime.getSiteStartTime(), siteReserveTime.getSiteEndTime());
				Map<String, Object> siteSport = getSiteSportName(siteReserveTime.getSiteId());
				originalPrice += StrUtil.objToDouble(siteSport.get("sportMoney"))*hourNums; //最底层每个场地多少钱（小时数*价格）
			}
			originalPriceSum += originalPrice * weekNums; //每一段时间多少钱（总场地钱数*星期个数）
		}
		Double presentPriceSum = originalPriceSum * (discount/100); //打折后的价格
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("originalPrice", originalPriceSum);
		resultMap.put("presentPrice", presentPriceSum);
		return resultMap;
	}
	
	@Override
	public Integer updateConfirmOrder(OrderInfo orderInfo) throws ParseException{
		//找到打折价，进行计算覆盖订单应付总价和打折价字段
		SiteReserveBasic siteReserveBasic = this.getSiteReserveBasicAllByOrderId(orderInfo.getOrderId());
		//计算打折价格
		Map<String, Object> priceMap = getPrice(siteReserveBasic.getSiteReserveDateList(), siteReserveBasic.getMemberId(), IDBConstant.LOGIC_STATUS_YES);
		orderInfo.setOrderSumPrice(StrUtil.objToDouble(priceMap.get("presentPrice")));
		
		Integer orderId = orderService.updateConfirmOrder(orderInfo);
		 //同步更新到序列图表的状态
		siteReserveBasic.setSiteReserveStatus(IDBConstant.LOGIC_STATUS_YES);
		baseDao.save(siteReserveBasic, siteReserveBasic.getSiteReserveId());
		return orderId;
	}
	
	@Override
	public SiteReserveBasic getSiteReserveBasicByOrderId(int orderId){
		return baseDao.queryByHqlFirst("FROM SiteReserveBasic WHERE orderId = ?", orderId);
	}
	
	@Override
	public List<SiteReserveDate> getSiteReserveDate(int siteReserveId){
		return baseDao.queryByHql("FROM SiteReserveDate WHERE siteReserveId = ?", siteReserveId);
	}
	
	@Override
	public List<SiteReserveDate> getSiteReserveDateTime(List<SiteReserveDate> siteReserveDateList){
		for(SiteReserveDate siteReserveDate : siteReserveDateList){
			siteReserveDate.setSiteReserveTimeList((List)baseDao.queryByHql("FROM SiteReserveTime WHERE reserveDateId = ?", siteReserveDate.getReserveDateId()));
		}
		return siteReserveDateList;
	}
	
	@Override
	public SiteReserveBasic getSiteReserveBasicAllByOrderId(int orderId){
		SiteReserveBasic siteReserveBasic = getSiteReserveBasicByOrderId(orderId);
		siteReserveBasic.setSiteReserveDateList(getSiteReserveDate(siteReserveBasic.getSiteReserveId()));
		getSiteReserveDateTime(siteReserveBasic.getSiteReserveDateList());
		return siteReserveBasic;
	}
	
	private Map<String, Object> getReserveIntersection(int siteId, String startDate, String endDate, String weeks, String startTime, String endTime){
		StringBuilder sql = new StringBuilder("SELECT * FROM site_reserve_basic srb, site_reserve_date srd, site_reserve_time srt WHERE srb.siteReserveId = srd.siteReserveId AND srd.reserveDateId = srt.reserveDateId");
		sql.append(" AND siteId = ?");
		sql.append(" AND NOT ((DATE(reserveEndDate) <= DATE(?)) OR (DATE(reserveStartDate) >= DATE(?)))");
		sql.append(" AND NOT ((TIME(siteEndTime) <= TIME(?)) OR (TIME(siteStartTime) >= TIME(?)))");
		if(StrUtil.isNotBlank(weeks)){
			sql.append(" AND reserveWeek regexp ?");
			return baseDao.queryBySqlFirst(sql.toString(), siteId, startDate, endDate, startTime, endTime, weeks.replace(",", "|"));
		}
		return baseDao.queryBySqlFirst(sql.toString(), siteId, startDate, endDate, startTime, endTime);
	}
	
	private Map<String, Object> getSiteSportName(int siteId){
		return baseDao.queryBySqlFirst("SELECT si.siteName, ss.sportName, ss.sportMoney, ss.startTime, ss.endTime FROM site_info si, site_sport ss WHERE si.siteType = ss.sportId AND si.siteId=?", siteId);
	}
	
	private String getSiteNo() {
		do {
			StringBuffer no = new StringBuffer();
			for(int i = 0; i < 6; i++){
				no.append((int)(Math.random()*10));
			}
			if(baseDao.getUniqueResult("SELECT 1 FROM site_info WHERE siteNo = ?", no) == null) return no.toString(); 
		} while (true);
	}
	
}
