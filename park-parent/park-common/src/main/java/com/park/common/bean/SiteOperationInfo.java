package com.park.common.bean;

public class SiteOperationInfo {

	private String reserveModel;
	private String reserveStartDate;
	private String reserveEndDate;
	private String reserveWeek;
	private String startTime;
	private String endTime;
	
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
