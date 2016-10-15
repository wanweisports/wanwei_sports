package com.park.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.common.bean.PageBean;
import com.park.common.bean.ResponseBean;
import com.park.common.bean.SiteInputView;
import com.park.common.exception.MessageException;
import com.park.common.po.SiteInfo;
import com.park.common.po.SiteSport;
import com.park.common.util.JsonUtils;
import com.park.service.ISiteService;

@Controller
@RequestMapping("site")
public class SiteController extends BaseController {
	
	@Autowired
	private ISiteService siteService;
	
	@ResponseBody
	@RequestMapping(value = "saveSiteSport", method = RequestMethod.POST)
	public ResponseBean saveSiteSport(SiteSport siteSport) {
		try {
			siteSport.setSalesId(super.getUserInfo().getId());
			Integer sportId = siteService.saveSiteSport(siteSport);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("sportId", sportId);
			return new ResponseBean(data);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "saveSiteInfo", method = RequestMethod.POST)
	public ResponseBean saveSiteInfo(SiteInfo siteInfo) {
		try {
			siteInfo.setSalesId(super.getUserInfo().getId());
			Integer siteId = siteService.saveSiteInfo(siteInfo);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("siteId", siteId);
			return new ResponseBean(data);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "getSiteNames")
	public ResponseBean getSiteNames(SiteInputView siteInputView) {
		try {
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("siteNames", siteService.getSiteNames(siteInputView));
			return new ResponseBean(data);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "getSiteInfo")
	public ResponseBean getSiteInfo(Integer siteId) {
		try {
			return new ResponseBean(siteService.getSiteInfoMap(siteId));
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "getSiteSport")
	public ResponseBean getSiteSport(Integer sportId) {
		try {
			SiteSport siteSport = siteService.getSiteSport(sportId);
			return new ResponseBean(JsonUtils.fromJsonDF(siteSport));
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@RequestMapping("getSiteInfos")
	public String getSiteInfos(SiteInputView siteInputView, Model model) {
		try {
			model.addAllAttributes(JsonUtils.fromJsonDF(siteInputView));
			PageBean pageBean = siteService.getSiteInfos(siteInputView);
			super.setPageInfo(model, pageBean);
			model.addAttribute("siteSportNames", siteService.getSiteSportNames(siteInputView));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Sites/SitesList";
	}
	
	@RequestMapping("getSiteSports")
	public String getSiteSports(SiteInputView siteInputView, Model model) {
		try {
			model.addAllAttributes(JsonUtils.fromJsonDF(siteInputView));
			PageBean pageBean = siteService.getSiteSports(siteInputView);
			super.setPageInfo(model, pageBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Reservation/ReservationsSportsSettings";
	}
	
	@RequestMapping("getSiteReservationInfo")
	public String getSiteReservationInfo(Model model){
		return "Reservation/ReservationsSequence";
	}

	// 批量预订
	@RequestMapping("getSiteReservationBatch")
	public String getSiteReservationBatch(Model model){
		return "Reservation/ReservationsBatch";
	}

}
