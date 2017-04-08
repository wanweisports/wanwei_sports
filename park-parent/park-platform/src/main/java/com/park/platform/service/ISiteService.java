package com.park.platform.service;

import com.park.common.bean.PageBean;
import com.park.common.bean.SiteInputView;
import com.park.common.bean.out.SiteReserveOutputView;
import com.park.common.po.*;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

public interface ISiteService {

	public Integer saveSiteSport(SiteSport siteSport);
	
	public Integer saveSiteInfo(SiteInfo siteInfo);
	
	public SiteSport getSiteSport(int sportId);
	
	public SiteInfo getSiteInfo(int siteId);
	
	public Map<String, Object> getSiteInfoMap(int siteId);
	
	public SiteSport getSiteSportInfo(int siteId);
	
	public List<Map<String, Object>> getSiteNames(SiteInputView siteInputView);
	
	public PageBean getSiteInfos(SiteInputView siteInputView);
	
	public PageBean getSiteSports(SiteInputView siteInputView);
	
	public List<Map<String, Object>> getSiteSportNames(SiteInputView siteInputView);
	
	public SiteReserveOutputView getSiteReservationInfo(SiteInputView siteInputView) throws ParseException;
	
	public Map<String, Object> saveReservationSite(SiteInputView siteInputView) throws ParseException;
	
	public List<Map<String, Object>> getSites(SiteInputView siteInputView);
	
	public void updateLockSite(SiteInputView siteInputView) throws ParseException;
	
	public Map<String, Object> calculateSiteMoney(SiteInputView siteInputView) throws ParseException;
	
	public Map<String, Object> getPrice(List<SiteReserveDate> siteReserveDateList, Integer memberId, String opType) throws ParseException;
	
	public Integer updateConfirmOrder(OrderInfo orderInfo, String memberCardPay) throws ParseException;
	
	public SiteReserveBasic getSiteReserveBasicByOrderId(int orderId);
	
	public List<SiteReserveDate> getSiteReserveDate(int siteReserveId);
	
	public List<SiteReserveDate> getSiteReserveDateTime(List<SiteReserveDate> siteReserveDateList);
	
	public SiteReserveBasic getSiteReserveBasicAllByOrderId(int orderId);
	
	public List<Map<String, Object>> getSiteReserveBasicByMobile(String mobile) throws ParseException;
	
	public Map<String, Object> getNextSiteReserveBasic(String reserveTimeId, String date) throws ParseException;
	
	public SiteReserveTime getSiteReserveTime(int reserveTimeId);
	
	public List<SiteReserveTime> getSiteReserveTimeByDateId(int reserveDateId);
	
	public Map<String, Object> getSiteSportTime(int sportId);
	
	public PageBean getMeals(SiteInputView siteInputView);

	public int getMealTotal(SiteInputView siteInputView);
	
	public SiteMealInfo getMealInfo(Integer mealId);
	
	public Integer saveMeal(SiteMealInfo siteMealInfo);
	
	public void deleteMeal(int mealId);
	
	public PageBean getMobileReservationSite(SiteInputView siteInputView);
	
}
