package com.park.common.bean;

import java.util.List;

public class SiteOperationInputView {
	
	private List<SiteOperationInfo> siteOperationInfo;
	private String opType; //1. 会员  2.散客
	private Integer memberId;
	private String name;
	private String mobile;
	private String reserveType;
	private String payType; //支付方式 1：现金  2：支付宝  3：微信

	public List<SiteOperationInfo> getSiteOperationInfo() {
		return siteOperationInfo;
	}

	public void setSiteOperationInfo(List<SiteOperationInfo> siteOperationInfo) {
		this.siteOperationInfo = siteOperationInfo;
	}

	public String getOpType() {
		return opType;
	}

	public void setOpType(String opType) {
		this.opType = opType;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getReserveType() {
		return reserveType;
	}

	public void setReserveType(String reserveType) {
		this.reserveType = reserveType;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}
	
}
