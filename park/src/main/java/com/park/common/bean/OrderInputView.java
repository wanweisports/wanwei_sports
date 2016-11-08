package com.park.common.bean;

public class OrderInputView extends BaseInputView {

	private Integer orderId;
	private String status;
	private String orderServiceTypes;
	
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
	
}
