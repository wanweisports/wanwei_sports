package com.park.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public ResponseBean saveSiteSport(String param) {
		try {
			Integer sportId = siteService.saveSiteSport(super.getData(param, SiteSport.class));
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
	public ResponseBean saveSiteInfo(String param) {
		try {
			Integer siteId = siteService.saveSiteInfo(super.getData(param, SiteInfo.class));
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
	public ResponseBean getSiteNames(String param) {
		try {
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("siteNames", siteService.getSiteNames(super.getData(param, SiteInputView.class)));
			return new ResponseBean(data);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "getSiteInfo")
	public ResponseBean getSiteInfo(String param) {
		try {
			return new ResponseBean(siteService.getSiteInfoMap(super.getData(param, SiteInputView.class).getSiteId()));
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "getSiteSport")
	public ResponseBean getSiteSport(String param) {
		try {
			SiteSport siteSport = siteService.getSiteSport(super.getData(param, SiteInputView.class).getSportId());
			return new ResponseBean(JsonUtils.fromJsonDF(siteSport));
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	/*@RequestMapping()
	public String getSiteInfos() {
		
	}*/

}
