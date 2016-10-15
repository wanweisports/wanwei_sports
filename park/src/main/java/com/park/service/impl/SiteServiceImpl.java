package com.park.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
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
import com.park.common.po.OrderDetail;
import com.park.common.po.OrderInfo;
import com.park.common.po.ParkBusiness;
import com.park.common.po.SiteInfo;
import com.park.common.po.SiteReserve;
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
		
		for(Map<String, Object> map : list){
			Site site = new Site();
			site.setSiteId(StrUtil.objToStr(map.get("siteId")));
			site.setSiteName(StrUtil.objToStr(map.get("siteName")));
			
			List<ReserveInfo> reserveInfos = new ArrayList<ReserveInfo>();
			for(Map<String, Object> p : timePeriodList){
				ReserveInfo reserveInfo = new ReserveInfo();
				
				String startTime = StrUtil.objToStr(p.get("startTime"));
				String endTime = StrUtil.objToStr(p.get("endTime"));
				
				Date siteStartTime = DateUtil.getHHMM(StrUtil.objToStr(map.get("startTime")));
				Date siteEndTime = DateUtil.getHHMM(StrUtil.objToStr(map.get("endTime")));
				SiteReserve siteReserve = getSiteReserve(siteDate, startTime, endTime, StrUtil.objToInt(map.get("siteId")));
				if(siteReserve != null){
					/*if(siteReserve.getOperatorId() != null){
						reserveInfo = operatorService.getOperatorNameInfo(siteReserve.getOperatorId());
					}*/
					reserveInfo.setOperatorName(siteReserve.getName());
					reserveInfo.setOperatorMobile(siteReserve.getMobile());
					reserveInfo.setOpType(siteReserve.getOpType());
					reserveInfo.setSiteReserveStatus(siteReserve.getSiteReserveStatus());
				}else{
					if(siteStartTime.getTime() <= DateUtil.getHHMM(startTime).getTime() && siteEndTime.getTime() >= DateUtil.getHHMM(endTime).getTime()){
						reserveInfo.setSiteReserveStatus("5");
					}else{
						reserveInfo.setSiteReserveStatus("4");
					}
				}
				reserveInfo.setTime(startTime+"-"+endTime);
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
		StringBuffer sql = new StringBuffer("SELECT *");
		sql.append(" FROM site_info si, site_sport ss WHERE si.siteType = ss.sportId");
		if(sportId != null){
			sql.append(" AND ss.sportId = :sportId");
		}
		return baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(siteInputView));
	}
	
	private SiteReserve getSiteReserve(String siteDate, String startTime, String endTime, int siteId){
		return baseDao.queryByHqlFirst("FROM SiteReserve WHERE siteDate=? AND siteStartTime=? AND siteEndTime=? AND siteId = ?", siteDate, startTime, endTime, siteId);
	}
	
	@Override
	public void saveReservationSite(SiteInputView siteInputView){
		String[] siteIds = siteInputView.getSiteIds().split(",");
		String[] times = siteInputView.getTimes().split(",");
		String opType = siteInputView.getOpType();
		String reserveType = siteInputView.getReserveType();
		Integer salesId = siteInputView.getSalesId();
		String siteDate = siteInputView.getSiteDate();
		String payType = siteInputView.getPayType();
		
		String nowDate = DateUtil.getNowDate();
		
		UserMember member = null;
		OrderInfo orderInfo = new OrderInfo();
		if(IDBConstant.LOGIC_STATUS_YES.equals(opType)){
			member = memberService.getUserMember(siteInputView.getMemberId());
			orderInfo.setMemberId(member.getMemberId());
		}else{
			orderInfo.setMemberId(0); //散客
		}
		
		orderInfo.setOrderServiceType(IDBConstant.ORDER_SERVICE_TYPE_SITE);
		if(IDBConstant.BALANCE_STYLE_XJ.equals(payType)){
			orderInfo.setPayStatus(IDBConstant.LOGIC_STATUS_YES); //已支付【现金直接已支付】
		}else{
			orderInfo.setPayStatus(IDBConstant.LOGIC_STATUS_NO); //未支付
		}
		orderInfo.setPayType(payType);
		orderInfo.setSalesId(salesId);
		
		List<SiteReserve> siteReserves = new ArrayList<SiteReserve>();
		
		
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		
		
		for(int i = 0; i < siteIds.length; i++){
			OrderDetail orderDetail = new OrderDetail();
			
			Integer siteId = StrUtil.objToInt(siteIds[i]);
			String[] timeSN = times[i].split("-");
			
			String startTime = timeSN[0];
			String endTime = timeSN[1];
			
			Map<String, Object> siteSport = getSiteSportName(siteId);
			String siteName = StrUtil.objToStr(siteSport.get("siteName"));
			
			SiteReserve reserveIntersection = getReserveIntersection(startTime, endTime, siteDate);
			if(reserveIntersection != null) throw new MessageException("["+siteName+"]"+reserveIntersection.getSiteStartTime()+"-"+reserveIntersection.getSiteEndTime()+"时间段已有顾客预定");
			
			SiteReserve siteReserve = new SiteReserve();
			siteReserve.setSiteReserveStatus(orderInfo.getPayStatus());
			siteReserve.setMemberId(orderInfo.getMemberId());
			siteReserve.setSiteDate(siteDate);
			siteReserve.setSiteId(siteId);
			siteReserve.setSalesId(salesId);
			siteReserve.setSiteStartTime(startTime);
			siteReserve.setSiteEndTime(endTime);
			siteReserve.setReserveType(reserveType);
			siteReserve.setCreateTime(nowDate);
			if(member != null){
				siteReserve.setName(member.getMemberName());
				siteReserve.setMobile(member.getMemberMobile());
				siteReserve.setOpType(opType);
			}
			siteReserves.add(siteReserve);
			
			orderDetail.setItemName(siteSport.get("sportName")+siteName); //羽毛球场地1
			orderDetail.setItemPrice(StrUtil.objToDouble(siteSport.get("sportMoney")));
			orderDetail.setItemMoneyType(IDBConstant.LOGIC_STATUS_NO); //计时收费
			orderDetail.setItemStartTime(siteReserve.getSiteStartTime());
			orderDetail.setItemEndTime(siteReserve.getSiteEndTime());
			orderDetail.setItemId(siteId);
			//orderDetail.setItemDiscount(100); //折扣【是否提到订单表】
			orderDetails.add(orderDetail);
		}
		
		Integer orderId = orderService.saveOrderInfo(orderInfo, orderDetails);
		
		for(SiteReserve siteReserve : siteReserves){
			siteReserve.setOrderId(orderId);
			baseDao.save(siteReserve, null);
		}
		for(OrderDetail od : orderDetails){
			od.setOrderId(orderId);
			baseDao.save(od, od.getOrderDetailId());
		}
	}
	
	private Map<String, Object> getSiteSportName(int siteId){
		return baseDao.queryBySqlFirst("SELECT si.siteName, ss.sportName, ss.sportMoney FROM site_info si, site_sport ss WHERE si.siteType = ss.sportId AND si.siteId=?", siteId);
	}
	
	private SiteReserve getReserveIntersection(String startTime, String endTime, String date){
		return baseDao.queryByHqlFirst("FROM SiteReserve WHERE data = ? AND NOT ((TIME(siteEndTime) <= TIME(?)) OR (TIME(siteStartTime) >= TIME(?)))", date, startTime, endTime);
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
