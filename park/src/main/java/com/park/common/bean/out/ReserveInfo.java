package com.park.common.bean.out;

public class ReserveInfo{
	
	private Integer reserveTimeId;
	private String startTime;
	private String endTime;
	private String siteReserveStatus;
	private String operatorName;
	private String operatorMobile;
	private String opType;
	private String operatorId;
	private String reserveType;
	private String isUse;
	
	
	public Integer getReserveTimeId() {
		return reserveTimeId;
	}
	public void setReserveTimeId(Integer reserveTimeId) {
		this.reserveTimeId = reserveTimeId;
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
	public String getSiteReserveStatus() {
		return siteReserveStatus;
	}
	public void setSiteReserveStatus(String siteReserveStatus) {
		this.siteReserveStatus = siteReserveStatus;
	}
	public String getOperatorName() {
		return operatorName;
	}
	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}
	public String getOperatorMobile() {
		return operatorMobile;
	}
	public void setOperatorMobile(String operatorMobile) {
		this.operatorMobile = operatorMobile;
	}
	public String getOpType() {
		return opType;
	}
	public void setOpType(String opType) {
		this.opType = opType;
	}
	public String getOperatorId() {
		return operatorId;
	}
	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}
	public String getReserveType() {
		return reserveType;
	}
	public void setReserveType(String reserveType) {
		this.reserveType = reserveType;
	}
    public String getIsUse() {
        return isUse;
    }
    public void setIsUse(String isUse) {
        this.isUse = isUse;
    }
	
}