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
import com.park.common.constant.IPlatformConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.MemberCard;
import com.park.common.po.MemberSiteSign;
import com.park.common.po.OrderDetail;
import com.park.common.po.OrderInfo;
import com.park.common.po.ParkBusiness;
import com.park.common.po.SiteInfo;
import com.park.common.po.SiteMealInfo;
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
import com.park.service.IMemberSignService;
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
	
	@Autowired
	private IMemberSignService memberSignService;
	
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
		Integer sportId = siteInputView.getSportId();
		
		StringBuilder sql = new  StringBuilder("SELECT siteId, siteName, siteStatus FROM site_info WHERE 1=1");
		if(StrUtil.isNotBlank(siteStatus)){
			sql.append(" AND siteStatus = :siteStatus");
		}
        if(sportId != null){
            sql.append(" AND siteType = :sportId");
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
				
				Map<String, Object> reserveIntersectionMap = this.getReserveIntersection(StrUtil.objToInt(site.getSiteId()), siteDate, siteDate, StrUtil.objToStr(DateUtil.getWeek(DateUtil.stringToDate(siteDate, null))), startTime, endTime);
				if(reserveIntersectionMap != null){
					reserveInfo.setOperatorName(StrUtil.objToStr(reserveIntersectionMap.get("name")));
					reserveInfo.setOperatorId(StrUtil.objToStr(reserveIntersectionMap.get("memberId")));
					reserveInfo.setOperatorMobile(StrUtil.objToStr(reserveIntersectionMap.get("mobile")));
					reserveInfo.setOpType(StrUtil.objToStr(reserveIntersectionMap.get("opType")));
					reserveInfo.setReserveType(StrUtil.objToStr(reserveIntersectionMap.get("reserveType")));
					reserveInfo.setSiteReserveStatus(StrUtil.objToStr(reserveIntersectionMap.get("siteReserveStatus")));
					reserveInfo.setReserveTimeId(StrUtil.objToInt(reserveIntersectionMap.get("reserveTimeId"))); //根据时间id，来解锁
                    reserveInfo.setIsUse(getReservationSiteStatus(siteDate, StrUtil.objToInt(reserveIntersectionMap.get("reserveTimeId"))));
					if(IDBConstant.LOGIC_STATUS_YES.equals(reserveInfo.getOpType())){
						List<MemberCard> memberCards = memberService.getMemberCards(StrUtil.objToInt(reserveIntersectionMap.get("memberId")));
						if(memberCards.size() > 0) reserveInfo.setCardNo(memberCards.get(0).getCardNo());
					}
				}else{  //每个开始-结束数据段在 场地类型时间 之内
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
	
	private String getReservationSiteStatus(String date, int reserveTimeId) throws ParseException{
		MemberSiteSign memberSiteSign = memberSignService.getMemberSiteSign(reserveTimeId, date);
		if(memberSiteSign != null) return IDBConstant.SIGN_STATUS_IN;
		SiteReserveTime siteReserveTime = getSiteReserveTime(reserveTimeId);
		if(DateUtil.stringToDate(date+" "+siteReserveTime.getSiteEndTime(), DateUtil.YYYYMMDDHHMM).getTime() < new Date().getTime()) return IDBConstant.SIGN_STATUS_OVER;
		return IDBConstant.SIGN_STATUS_NORMAL;
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
	
	//先生成订单，在修改订单
	@Override
	public Map<String, Object> saveReservationSite(SiteInputView siteInputView) throws ParseException{
		SiteReserveBasic siteReserveBasic = JsonUtils.fromJsonDF(siteInputView.getSiteOperationJson(), SiteReserveBasic.class);
		List<SiteReserveDate> siteReserveDateList = siteReserveBasic.getSiteReserveDateList();
		
		String nowDate = DateUtil.getNowDate();
		siteReserveBasic.setCreateTime(nowDate);
		siteReserveBasic.setSalesId(siteInputView.getSalesId());
		
		UserMember member = null;
		OrderInfo orderInfo = new OrderInfo();
		if(IDBConstant.LOGIC_STATUS_YES.equals(siteReserveBasic.getOpType())){
			member = memberService.getUserMember(siteReserveBasic.getMemberId());
			if(member == null || member.getParentMemberId() != null) throw new MessageException("会员不存在");
			orderInfo.setMemberId(member.getMemberId());
			siteReserveBasic.setMobile(member.getMemberMobile()); //如果预定是会员，预定为会员的手机号
			siteReserveBasic.setName(member.getMemberName());
		}else if(IDBConstant.LOGIC_STATUS_NO.equals(siteReserveBasic.getOpType())){
			orderInfo.setMemberId(0); //散客
			orderInfo.setName(siteReserveBasic.getName());
			orderInfo.setMobile(siteReserveBasic.getMobile());
		}else throw new MessageException("opType参数不正确");
		
		orderInfo.setOrderServiceType(IDBConstant.LOGIC_STATUS_YES.equals(siteReserveBasic.getReserveModel()) ? IDBConstant.ORDER_SERVICE_TYPE_SITE : IDBConstant.ORDER_SERVICE_TYPE_BLOCK_SITE);
		orderInfo.setOrderStatus(IDBConstant.LOGIC_STATUS_NO); //未完成
		orderInfo.setPayStatus(IDBConstant.LOGIC_STATUS_NO); //未支付
		//orderInfo.setPayCount(siteReserveBasic.getPayCount()); //支付次数（缴纳的次数）
		orderInfo.setUseCount(0);
	
		orderInfo.setSalesId(siteReserveBasic.getSalesId());
		
		//老需求
		/*Map<String, Object> priceMap = getPrice(siteReserveDateList, siteReserveBasic.getMemberId(), siteReserveBasic.getOpType());
		orderInfo.setOrderSumPrice(StrUtil.objToDouble(priceMap.get("originalPrice")));
		orderInfo.setOrderDiscount(StrUtil.objToInt(priceMap.get("memberDiscount")));
		double memberDiscount = StrUtil.objToDouble(priceMap.get("memberDiscount"))/100;*/
		//新需求
		//orderInfo.setOrderSumPrice(siteReserveBasic.getOrderSumPrice());
		
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		
		siteReserveBasic.setSiteReserveStatus(orderInfo.getPayStatus());
		baseDao.save(siteReserveBasic, null);
		
		
		int hourNums = 0;
		int weekNums = 0;
		for(SiteReserveDate siteReserveDate : siteReserveDateList){
			weekNums += getWeekNums(siteReserveDate);
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
				siteReserveTime.setIsUse(IDBConstant.LOGIC_STATUS_NO);
				baseDao.save(siteReserveTime, null);
				
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setItemMoneyType(IDBConstant.LOGIC_STATUS_NO); //计时收费
				orderDetail.setItemId(siteReserveTime.getReserveTimeId());
				orderDetail.setItemName("【"+siteSportInfo.getSportName()+"】"+IPlatformConstant.ORDER_SITE_NAME);
				//orderDetail.setItemPrice(getHourPrice(siteReserveTime)*memberDiscount); //老需求(计算每个具体多少钱)
				//orderDetail.setItemPrice(siteReserveBasic.getOrderSumPrice()); //新需求(手动输入多少钱)
				orderDetail.setItemStartTime(siteReserveDate.getReserveStartDate()+" "+siteReserveTime.getSiteStartTime());
				orderDetail.setItemEndTime(siteReserveDate.getReserveEndDate()+" "+siteReserveTime.getSiteEndTime());
				orderDetail.setOrderDetailStatus(IDBConstant.LOGIC_STATUS_NO); //子订单：未完成
				orderDetail.setItemAmount(1); //场地预定，数量为1
				orderDetails.add(orderDetail);
				hourNums += getHourNums(siteReserveTime);
			}
		}
		orderInfo.setSumCount(weekNums * hourNums); //总次数（通过计算）
		//if(orderInfo.getSumCount() < orderInfo.getPayCount()) throw new MessageException("输入的场次数超过，最大场次数为："+orderInfo.getSumCount());
		Integer orderId = orderService.saveOrderInfo(orderInfo, orderDetails);
		siteReserveBasic.setOrderId(orderId);
		baseDao.save(siteReserveBasic, siteReserveBasic.getSiteReserveId());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("orderId", orderId);
		resultMap.put("orderNo", orderInfo.getOrderNo());
		return resultMap;
	}
	
	@Override
	public void updateLockSite(SiteInputView siteInputView) throws ParseException{
		SiteReserveBasic siteReserveBasic = JsonUtils.fromJsonDF(siteInputView.getSiteOperationJson(), SiteReserveBasic.class);
		List<SiteReserveDate> siteReserveDateList = siteReserveBasic.getSiteReserveDateList();
		Boolean lock = siteInputView.getLock();
		
		if(lock == null || lock){ //锁定
			siteReserveBasic.setCreateTime(DateUtil.getNowDate());
			siteReserveBasic.setSalesId(siteInputView.getSalesId());
			siteReserveBasic.setSiteReserveStatus(IDBConstant.LOGIC_STATUS_OTHER);
			baseDao.save(siteReserveBasic, null);
			for(SiteReserveDate siteReserveDate : siteReserveDateList){
				siteReserveDate.setSiteReserveId(siteReserveBasic.getSiteReserveId());
				baseDao.save(siteReserveDate, null);
				List<SiteReserveTime> siteReserveTimeList = siteReserveDate.getSiteReserveTimeList();
				for(SiteReserveTime siteReserveTime : siteReserveTimeList){
					Map<String, Object> reserveIntersectionMap = this.getReserveIntersection(siteReserveTime.getSiteId(), siteReserveDate.getReserveStartDate(), siteReserveDate.getReserveEndDate(), null, siteReserveTime.getSiteStartTime(), siteReserveTime.getSiteEndTime());
					if(reserveIntersectionMap != null) throw new MessageException("操作错误，请刷新页面重试"); 
					siteReserveTime.setReserveDateId(siteReserveDate.getReserveDateId());
					baseDao.save(siteReserveTime, null);
				}
			}
		}else{ //解锁
			SiteReserveBasic siteReserveBasicDB = null;
			for(SiteReserveDate siteReserveDate : siteReserveDateList){
				List<SiteReserveTime> siteReserveTimeList = siteReserveDate.getSiteReserveTimeList();
				SiteReserveDate siteReserveDateDB = null;
				for(SiteReserveTime siteReserveTime : siteReserveTimeList){
					if(siteReserveDateDB == null) siteReserveDateDB = getReserveDateByTimeId(siteReserveTime.getReserveTimeId());
					baseDao.delete(siteReserveTime);
				}
				//若没有时间，则删除日期
				if(baseDao.queryBySqlFirst("SELECT 1 FROM site_reserve_time WHERE reserveDateId = ?", siteReserveDateDB.getReserveDateId()) == null){
					baseDao.delete(siteReserveDateDB);
				}
				if(siteReserveBasicDB == null) siteReserveBasicDB = getReserveBasic(siteReserveDateDB.getSiteReserveId());
				if(!IDBConstant.LOGIC_STATUS_OTHER.equals(siteReserveBasicDB.getSiteReserveStatus())) throw new MessageException("操作错误，请刷新页面重试");
			}
			//若没有日期，则删除basic
			if(baseDao.queryBySqlFirst("SELECT 1 FROM site_reserve_date WHERE siteReserveId = ?", siteReserveBasicDB.getSiteReserveId()) == null){
				baseDao.delete(siteReserveBasicDB);
			}
		}
	}
	
	private SiteReserveBasic getReserveBasic(int siteReserveId){
		return baseDao.getToEvict(SiteReserveBasic.class, siteReserveId);
	}
	
	private SiteReserveDate getReserveDateByTimeId(int reserveTimeId){
		SiteReserveTime siteReserveTime = baseDao.getToEvict(SiteReserveTime.class, reserveTimeId);
		return baseDao.getToEvict(SiteReserveDate.class, siteReserveTime.getReserveDateId());
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
	
	@Override
	public Map<String, Object> getPrice(List<SiteReserveDate> siteReserveDateList, Integer memberId, String opType) throws ParseException {
		//double memberDiscount = memberService.getMemberDiscount(memberId, opType); //会员折扣
		
		Double originalPriceSum = 0.0; //原价
		int sumWeekNums = 0;
		int hourNums = 0;
		for(SiteReserveDate siteReserveDate : siteReserveDateList){
			int weekNums = getWeekNums(siteReserveDate);
			List<SiteReserveTime> siteReserveTimeList = siteReserveDate.getSiteReserveTimeList();
			Double originalPrice = 0.0;
			for(SiteReserveTime siteReserveTime : siteReserveTimeList){
				originalPrice += getHourPrice(siteReserveTime);
				hourNums += getHourNums(siteReserveTime);
			}
			originalPriceSum += originalPrice * weekNums; //每一段时间多少钱（总场地钱数*星期个数）
			sumWeekNums += weekNums;
		}
		//Double presentPriceSum = originalPriceSum * (memberDiscount/100); //打折后的价格
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("originalPrice", originalPriceSum);
		/*resultMap.put("presentPrice", presentPriceSum);
		resultMap.put("memberDiscount", memberDiscount);*/ //【新需求没有折扣】
		resultMap.put("sumNums", sumWeekNums * hourNums);
		return resultMap;
	}

	private int getWeekNums(SiteReserveDate siteReserveDate) throws ParseException {
		return DateUtil.getDateScopeWeekNums(siteReserveDate.getReserveStartDate(), siteReserveDate.getReserveEndDate(), siteReserveDate.getReserveWeek());
	}

	private Double getHourPrice(SiteReserveTime siteReserveTime) throws ParseException {
		int hourNums = getHourNums(siteReserveTime);
		Map<String, Object> siteSport = getSiteSportName(siteReserveTime.getSiteId());
		return StrUtil.objToDouble(siteSport.get("sportMoney"))*hourNums; //最底层每个场地多少钱（小时数*价格）
	}

	private int getHourNums(SiteReserveTime siteReserveTime) throws ParseException {
		return DateUtil.getTimeHourNums(siteReserveTime.getSiteStartTime(), siteReserveTime.getSiteEndTime());
	}
	
	@Override
	public Integer updateConfirmOrder(OrderInfo orderInfo) throws ParseException{
		Integer orderId = orderInfo.getOrderId();
		if(orderId == null) throw new MessageException("订单id为空");
		//找到打折价，进行计算覆盖订单应付总价和打折价字段
		SiteReserveBasic siteReserveBasic = this.getSiteReserveBasicAllByOrderId(orderId);
		//计算打折价格【点击去支付，已经生成了订单总价】
		/*Map<String, Object> priceMap = getPrice(siteReserveBasic.getSiteReserveDateList(), siteReserveBasic.getMemberId(), IDBConstant.LOGIC_STATUS_YES);
		orderInfo.setOrderSumPrice(StrUtil.objToDouble(priceMap.get("presentPrice")));*/
		OrderInfo orderInfoDB = orderService.getOrderInfo(orderId);
		if(orderInfoDB.getSumCount() < orderInfo.getPayCount()) throw new MessageException("输入的场次数超过，最大场次数为："+orderInfoDB.getSumCount());
		orderInfoDB.setOrderSumPrice(orderInfo.getOrderSumPrice());
		orderInfoDB.setPayCount(orderInfo.getPayCount());
		baseDao.save(orderInfoDB, orderId);
		
		orderId = orderService.updateConfirmOrder(orderInfo);
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
	public List<SiteReserveTime> getSiteReserveTimeByDateId(int reserveDateId){
		return baseDao.queryByHql("FROM SiteReserveTime WHERE reserveDateId = ?", reserveDateId);
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
		if(siteReserveBasic == null) throw new MessageException("订单不存在，请重新预定");
		siteReserveBasic.setSiteReserveDateList(getSiteReserveDate(siteReserveBasic.getSiteReserveId()));
		getSiteReserveDateTime(siteReserveBasic.getSiteReserveDateList());
		return siteReserveBasic;
	}
	
	@Override
	public List<Map<String, Object>> getSiteReserveBasicByMobile(String mobile) throws ParseException{ 
		StringBuilder sql = new StringBuilder("SELECT srt.reserveTimeId, srt.siteId, siteName, sportName, srb.name, srb.mobile, siteEndTime, CONCAT(srd.reserveStartDate,' ',srt.siteStartTime) startTime, CONCAT(srd.reserveEndDate,' ',srt.siteEndTime) endTime, reserveWeek FROM site_reserve_basic srb, site_reserve_date srd, site_reserve_time srt, site_info si, site_sport ss");
		sql.append(" WHERE srb.mobile = ? AND srb.siteReserveId = srd.siteReserveId AND srd.reserveDateId = srt.reserveDateId AND srt.siteId = si.siteId AND si.siteType = ss.sportId");
		sql.append(" AND srd.reserveStartDate <= CURDATE() AND srd.reserveEndDate >= CURDATE() AND siteEndTime >= DATE_FORMAT(NOW(), '%H:00')");
		List<Map<String, Object>> list = baseDao.queryBySql(sql.toString(), mobile/*, IPlatformConstant.SITE_ADVANCE_START_TIME, IPlatformConstant.SITE_LATE_START_TIME*/);
		Date nowDate = new Date();
		List<Map<String, Object>> spList = new ArrayList<Map<String,Object>>();
		for(Map<String, Object> map : list){
			String startTime = StrUtil.objToStr(map.get("startTime"));
			String endTime = StrUtil.objToStr(map.get("endTime"));
			List<String> dateList = DateUtil.getDateScopeByWeek(startTime, endTime, StrUtil.objToStr(map.get("reserveWeek")), DateUtil.YYYYMMDDHHMM);
			for(int i = 0; i < dateList.size(); i++){
				String date = dateList.get(i);
				if(DateUtil.dateToDate(nowDate).getTime() == DateUtil.stringToDate(date, null).getTime()){ //只取今天的预定场地
					Map spDate = (Map)((HashMap)map).clone();
					spDate.put("startTime", date);
					spDate.put("endTime", DateUtil.dateToString(DateUtil.stringToDate(date, null), null) + " " +map.get("siteEndTime"));
					spList.add(spDate);
				}
			}
		}
		return spList;
	}
	
	@Override
	public Map<String, Object> getNextSiteReserveBasic(String reserveTimeId, String date) throws ParseException{
		StringBuilder sql = new StringBuilder("SELECT orderId, siteStartTime, siteEndTime FROM site_reserve_basic srb, site_reserve_date srd, site_reserve_time srt, site_info si, site_sport ss");
		sql.append(" WHERE srt.reserveTimeId = ? AND srb.siteReserveId = srd.siteReserveId AND srd.reserveDateId = srt.reserveDateId AND srt.siteId = si.siteId AND si.siteType = ss.sportId");
		sql.append(" AND DATE(srd.reserveEndDate) >= ? AND DATE(srd.reserveStartDate) <= ?");
/*		sql.append(" AND CONCAT(srd.reserveStartDate,' ',srt.siteStartTime) >= DATE_ADD(NOW(),INTERVAL ? MINUTE)");
		sql.append(" AND CONCAT(srd.reserveStartDate,' ',srt.siteStartTime) <= DATE_ADD(NOW(),INTERVAL ? MINUTE)");*/
		Date d = DateUtil.stringToDate(date, null);
		return baseDao.queryBySqlFirst(sql.toString(), reserveTimeId, d, d/*, IPlatformConstant.SITE_ADVANCE_START_TIME, IPlatformConstant.SITE_LATE_START_TIME*/);
	}
	
	@Override
	public SiteReserveTime getSiteReserveTime(int reserveTimeId){
		return baseDao.getToEvict(SiteReserveTime.class, reserveTimeId);
	}
	
	@Override
	public Map<String, Object> getSiteSportTime(int sportId){
		return baseDao.queryBySqlFirst("SELECT sportId, startTime, endTime FROM site_sport WHERE sportId = ?", sportId);
	}
	
	@Override
	public PageBean getMeals(SiteInputView siteInputView){
		StringBuilder headSql = new StringBuilder("SELECT smi.*, oi.orderNo");
		StringBuilder bodySql = new StringBuilder(" FROM site_meal_info smi INNER JOIN order_info oi ON smi.orderId = oi.orderId");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
		
		return super.getPageBean(headSql, bodySql, whereSql, siteInputView);
	}
	
	@Override
	public SiteMealInfo getMealInfo(Integer mealId){
		return baseDao.getToEvict(SiteMealInfo.class, mealId);
	}
	
	@Override
	public Integer saveMeal(SiteMealInfo mealInfo){
		Integer mealId = mealInfo.getMealId();
		String nowDate = DateUtil.getNowDate();
		mealInfo.setMealDate(nowDate);
		if(mealId == null){
			mealInfo.setCreateTime(nowDate);
			baseDao.save(mealInfo, null);
			return  mealInfo.getMealId();
		}
		SiteMealInfo mealInfoDB = getMealInfo(mealId);
		mealInfoDB.setUpdateTime(nowDate);
		mealInfoDB.setOrderId(mealInfo.getOrderId());
		mealInfoDB.setMealDate(mealInfo.getMealDate());
		//判断是否能点餐--->判断订单memberId必须与点餐人memberId相同？
		List<Map<String, Object>> siteSeserveDates = baseDao.queryBySql("SELECT * FROM site_reserve_basic srb, site_reserve_date srd WHERE srb.siteReserveId = srd.siteReserveId AND srb.orderId = ? AND srd.reserveStartDate >= ? AND srd.reserveEndDate <= ?", mealInfo.getOrderId(), nowDate);
		if(siteSeserveDates == null) throw new MessageException("没有查询到今天的场地预定信息，您不能点餐");
		baseDao.save(mealInfoDB, mealId);
		return mealId;
	}
	
	@Override
	public void deleteMeal(int mealId){
		SiteMealInfo mealInfo = getMealInfo(mealId);
		if(mealInfo != null){
			baseDao.delete(mealInfo);
		}
	}
	
	private Map<String, Object> getReserveIntersection(int siteId, String startDate, String endDate, String weeks, String startTime, String endTime) throws ParseException{
		startDate = DateUtil.getAddDay(startDate, -1);
		
		StringBuilder sql = new StringBuilder("SELECT name, memberId, mobile, opType, reserveType, siteReserveStatus, reserveTimeId FROM site_reserve_basic srb, site_reserve_date srd, site_reserve_time srt WHERE srb.siteReserveId = srd.siteReserveId AND srd.reserveDateId = srt.reserveDateId");
		sql.append(" AND siteId = ?");
		sql.append(" AND NOT ((DATE(reserveEndDate) <= DATE(?)) OR (DATE(reserveStartDate) > DATE(?)))");
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
