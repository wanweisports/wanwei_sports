package com.park.common.bean;

public class OrderInputView extends BaseInputView {

	private Integer orderId;
	private String status;
	private String orderServiceTypes;
	private String payStatus;
	private String orderNo;
	
	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOrderServiceTypes() {
		return orderServiceTypes;
	}

	public void setOrderServiceTypes(String orderServiceTypes) {
		this.orderServiceTypes = orderServiceTypes;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
}
