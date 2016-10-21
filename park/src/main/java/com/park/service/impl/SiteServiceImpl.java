package com.park.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.PageBean;
import com.park.common.bean.SiteInputView;
import com.park.common.bean.SiteOperationInfo;
import com.park.common.bean.SiteOperationInputView;
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
		
		String siteDate = siteInputView.getSiteDate(); //选中场馆的时间
		
		List<Map<String, Object>> list = getSites(siteInputView);
		
		List<Map<String, Object>> timePeriodList = parkService.getTimePeriod(business);
		
		SiteReserveOutputView siteReserveOutputView = new SiteReserveOutputView();
		List<Site> siteInfos = new ArrayList<Site>();
		
		/*for(Map<String, Object> map : list){
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
				
				SiteReserve siteReserve = getSiteReserve(siteDate, startTime, endTime, StrUtil.objToInt(site.getSiteId()));
				if(siteReserve != null){
					if(siteReserve.getOperatorId() != null){
						reserveInfo = operatorService.getOperatorNameInfo(siteReserve.getOperatorId());
					}
					reserveInfo.setOperatorName(siteReserve.getName());
					reserveInfo.setOperatorMobile(siteReserve.getMobile());
					reserveInfo.setOpType(siteReserve.getOpType());
					reserveInfo.setReserveType(siteReserve.getReserveType());
					reserveInfo.setSiteReserveStatus(siteReserve.getSiteReserveStatus());
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
		}*/
		siteReserveOutputView.setSiteInfos(siteInfos);
		return siteReserveOutputView;
	}
	
	@Override
	public List<Map<String, Object>> getSites(SiteInputView siteInputView){
		Integer sportId = siteInputView.getSportId();
		String siteStatus = siteInputView.getSiteStatus();
		StringBuffer sql = new StringBuffer("SELECT *");
		sql.append(" FROM site_info si, site_sport ss WHERE si.siteType = ss.sportId");
		if(sportId != null){
			sql.append(" AND ss.sportId = :sportId");
		}
		if(StrUtil.isNotBlank(siteStatus)){
			sql.append(" AND si.siteStatus = :siteStatus");
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
		
		orderInfo.setOrderServiceType(IDBConstant.ORDER_SERVICE_TYPE_SITE);
		orderInfo.setPayStatus(IDBConstant.LOGIC_STATUS_NO); //未支付
		orderInfo.setSalesId(siteReserveBasic.getSalesId());
		
		Integer orderId = orderService.saveOrderInfo(orderInfo, null);
		
		siteReserveBasic.setOrderId(orderId);
		siteReserveBasic.setSiteReserveStatus(orderInfo.getPayStatus());
		baseDao.save(siteReserveBasic, null);
		
		for(SiteReserveDate siteReserveDate : siteReserveDateList){
			
			siteReserveDate.setReserveInfoId(siteReserveBasic.getReserveInfoId());
			baseDao.save(siteReserveDate, null);
			List<SiteReserveTime> siteReserveTimeList = siteReserveDate.getSiteReserveTimeList();
			for(SiteReserveTime siteReserveTime : siteReserveTimeList){
				
				//判断时间是否重复
				//baseDao.queryBySql("SELECT 1 FROM site_reserve_date srd, site_reserve_time srt WHERE srd.reserveId = srt.reserveId AND ")
				
				siteReserveTime.setReserveId(siteReserveDate.getReserveId());
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
	public Map<String, Object> calculateSiteMoney(SiteInputView siteInputView){
		SiteOperationInputView siteOperation = JsonUtils.fromJsonDF(siteInputView.getSiteOperationJson(), SiteOperationInputView.class);
		List<SiteOperationInfo> siteOperationInfos = siteOperation.getSiteOperationInfo();
		Integer memberId = siteOperation.getMemberId();
		String opType = siteOperation.getOpType(); //1.会员 2.散客
		
		Map<String, Object> resultMap = getPrice(siteOperationInfos, memberId, opType);
		
		return resultMap;
	}

	private Map<String, Object> getPrice(List<SiteOperationInfo> siteOperationInfos, Integer memberId, String opType) {
		double discount = 100;
		if(IDBConstant.LOGIC_STATUS_YES.equals(opType) && memberId != null){ //会员打折
			//获取会员的会员卡，（如果后期有多张会员卡，则需要在前端用户选择哪张卡，把会员卡id传到后台查询折扣）
			List<MemberCard> memberCards = memberService.getMemberCards(memberId);
			if(memberCards.size() > 0){ //memberCards.size()==0：没有会员卡按不打折计算   throw new MessageException("该用户没有绑定会员卡");
				MemberCardType memberCardType = memberService.getMemberCardType(memberCards.get(0).getCardTypeId());
				discount = memberCardType.getCardTypeDiscount();
			}
		}
		
		Double originalPrice = 0.0; //原价
		for(SiteOperationInfo siteOpInfo : siteOperationInfos){
			Map<String, Object> siteSport = getSiteSportName(siteOpInfo.getSiteId());
			originalPrice += StrUtil.objToDouble(siteSport.get("sportMoney"));
		}
		Double presentPrice = originalPrice * (discount/100); //打折后的价格
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("originalPrice", originalPrice);
		resultMap.put("presentPrice", presentPrice);
		return resultMap;
	}
	
	@Override
	public Integer updateConfirmOrder(OrderInfo orderInfo){
		//找到打折价，进行计算覆盖订单应付总价和打折价字段
		/*List<SiteReserve> siteReserves = getReservesByOrderId(orderInfo.getOrderId());
		//查询根据会员id查询会员
		List<SiteOperationInfo> siteOperationInfos = new ArrayList<SiteOperationInfo>();
		for(SiteReserve siteReserve : siteReserves){
			SiteOperationInfo siteOperationInfo = new SiteOperationInfo();
			siteOperationInfo.setSiteId(siteReserve.getSalesId());
			siteOperationInfos.add(siteOperationInfo);
		}*/
		//计算打折价格
		//Map<String, Object> priceMap = getPrice(siteOperationInfos, siteReserves.get(0).getMemberId(), IDBConstant.LOGIC_STATUS_YES);
		//orderInfo.setOrderSumPrice(StrUtil.objToDouble(priceMap.get("presentPrice")));
		
		Integer orderId = orderService.updateConfirmOrder(orderInfo);
		 //同步更新到序列图表的状态
		baseDao.updateBySql("UPDATE site_reserve SET siteReserveStatus = ? WHERE orderId = ?", IDBConstant.LOGIC_STATUS_YES, orderId);
		return orderId;
	}
	
	/*@Override
	public List<SiteReserve> getReservesByOrderId(int orderId){
		return baseDao.queryByHql("FROM SiteReserve WHERE orderId = ?", orderId);
	}
	
	private SiteReserve getReserveIntersection(String startTime, String endTime, String date){
		return baseDao.queryByHqlFirst("FROM SiteReserve WHERE siteDate = ? AND NOT ((TIME(siteEndTime) <= TIME(?)) OR (TIME(siteStartTime) >= TIME(?)))", date, startTime, endTime);
	}*/
	
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
