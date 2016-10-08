package com.park.common.bean;

public class SiteInputView extends BaseInputView {

	private Integer siteId;
	
	private Integer sportId;
	
	private String siteName;
	
	private String siteStatus;
	
	private String sportStatus;

	public Integer getSiteId() {
		return siteId;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}

	public Integer getSportId() {
		return sportId;
	}

	public void setSportId(Integer sportId) {
		this.sportId = sportId;
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public String getSiteStatus() {
		return siteStatus;
	}

	public void setSiteStatus(String siteStatus) {
		this.siteStatus = siteStatus;
	}

	public String getSportStatus() {
		return sportStatus;
	}

	public void setSportStatus(String sportStatus) {
		this.sportStatus = sportStatus;
	}
	
}
