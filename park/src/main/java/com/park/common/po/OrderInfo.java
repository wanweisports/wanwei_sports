package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * OrderInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "order_info", catalog = "park")
public class OrderInfo implements java.io.Serializable {

	// Fields

	private Integer orderId;
	private String orderNo;
	private String operatorId;
	private Integer memberId;
	private String orderServiceType;
	private String orderStatus;
	private String payStatus;
	private String payType;
	private String payTime;
	private Double orderSumPrice;
	private String orderRemark;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public OrderInfo() {
	}

	/** full constructor */
	public OrderInfo(String orderNo, String operatorId, Integer memberId,
			String orderServiceType, String orderStatus, String payStatus,
			String payType, String payTime, Double orderSumPrice,
			String orderRemark, String createTime, String updateTime,
			Integer salesId) {
		this.orderNo = orderNo;
		this.operatorId = operatorId;
		this.memberId = memberId;
		this.orderServiceType = orderServiceType;
		this.orderStatus = orderStatus;
		this.payStatus = payStatus;
		this.payType = payType;
		this.payTime = payTime;
		this.orderSumPrice = orderSumPrice;
		this.orderRemark = orderRemark;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "orderId", unique = true, nullable = false)
	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	@Column(name = "orderNo", length = 32)
	public String getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	@Column(name = "operatorId", length = 32)
	public String getOperatorId() {
		return this.operatorId;
	}

	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}

	@Column(name = "memberId")
	public Integer getMemberId() {
		return this.memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name = "orderServiceType", length = 10)
	public String getOrderServiceType() {
		return this.orderServiceType;
	}

	public void setOrderServiceType(String orderServiceType) {
		this.orderServiceType = orderServiceType;
	}

	@Column(name = "orderStatus", length = 1)
	public String getOrderStatus() {
		return this.orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	@Column(name = "payStatus", length = 1)
	public String getPayStatus() {
		return this.payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	@Column(name = "payType", length = 1)
	public String getPayType() {
		return this.payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	@Column(name = "payTime", length = 20)
	public String getPayTime() {
		return this.payTime;
	}

	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}

	@Column(name = "orderSumPrice", precision = 10)
	public Double getOrderSumPrice() {
		return this.orderSumPrice;
	}

	public void setOrderSumPrice(Double orderSumPrice) {
		this.orderSumPrice = orderSumPrice;
	}

	@Column(name = "orderRemark", length = 65535)
	public String getOrderRemark() {
		return this.orderRemark;
	}

	public void setOrderRemark(String orderRemark) {
		this.orderRemark = orderRemark;
	}

	@Column(name = "createTime", length = 20)
	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Column(name = "updateTime", length = 20)
	public String getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "salesId")
	public Integer getSalesId() {
		return this.salesId;
	}

	public void setSalesId(Integer salesId) {
		this.salesId = salesId;
	}

}