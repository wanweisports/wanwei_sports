package com.park.common.bean;

public class SiteOperationInfo {

	private String reserveModel;
	private String reserveStartDate;
	private String reserveEndDate;
	private String reserveWeek;
	private Integer siteId;
	private String startTime;
	private String endTime;
	
	public Integer getSiteId() {
		return siteId;
	}
	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
}
