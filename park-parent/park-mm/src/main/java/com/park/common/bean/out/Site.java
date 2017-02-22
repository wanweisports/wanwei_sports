package com.park.common.bean.out;

import java.util.List;

public class Site{
	
	private String siteId;
	private String siteName;
	private List<ReserveInfo> reserveInfos;
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public List<ReserveInfo> getReserveInfos() {
		return reserveInfos;
	}
	public void setReserveInfos(List<ReserveInfo> reserveInfos) {
		this.reserveInfos = reserveInfos;
	}
	
}
