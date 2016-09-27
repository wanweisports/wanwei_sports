package com.park.service;

import java.util.List;
import java.util.Map;

import com.park.common.bean.SiteInputView;
import com.park.common.po.SiteInfo;
import com.park.common.po.SiteSport;

public interface ISiteService {

	public Integer saveSiteSport(SiteSport siteSport);
	
	public Integer saveSiteInfo(SiteInfo siteInfo);
	
	public SiteSport getSiteSport(int sportId);
	
	public SiteInfo getSiteInfo(int siteId);
	
	public Map<String, Object> getSiteInfoMap(int siteId);
	
	public List<Map<String, Object>> getSiteNames(SiteInputView siteInputView);
	
}
