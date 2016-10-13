package com.park.common.bean.out;

public class ReserveInfo{
	
	private String time;
	private String siteReserveStatus;
	private String operatorName;
	private String operatorMobile;
	private String opType;
	private String operatorId;
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
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
	
}