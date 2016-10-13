package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * OrderDetail entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "order_detail", catalog = "park")
public class OrderDetail implements java.io.Serializable {

	// Fields

	private Integer orderDetailId;
	private Integer orderId;
	private Integer itemId;
	private String itemName;
	private Double itemPrice;
	private String itemStartTime;
	private String itemEndTime;
	private String itemRemark;
	private String itemMoneyType;
	private Integer itemDiscount;

	// Constructors

	/** default constructor */
	public OrderDetail() {
	}

	/** full constructor */
	public OrderDetail(Integer orderId, Integer itemId, String itemName,
			Double itemPrice, String itemStartTime, String itemEndTime,
			String itemRemark, String itemMoneyType, Integer itemDiscount) {
		this.orderId = orderId;
		this.itemId = itemId;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemStartTime = itemStartTime;
		this.itemEndTime = itemEndTime;
		this.itemRemark = itemRemark;
		this.itemMoneyType = itemMoneyType;
		this.itemDiscount = itemDiscount;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "orderDetailId", unique = true, nullable = false)
	public Integer getOrderDetailId() {
		return this.orderDetailId;
	}

	public void setOrderDetailId(Integer orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	@Column(name = "orderId")
	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	@Column(name = "itemId")
	public Integer getItemId() {
		return this.itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	@Column(name = "itemName", length = 32)
	public String getItemName() {
		return this.itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	@Column(name = "itemPrice", precision = 10)
	public Double getItemPrice() {
		return this.itemPrice;
	}

	public void setItemPrice(Double itemPrice) {
		this.itemPrice = itemPrice;
	}

	@Column(name = "itemStartTime", length = 20)
	public String getItemStartTime() {
		return this.itemStartTime;
	}

	public void setItemStartTime(String itemStartTime) {
		this.itemStartTime = itemStartTime;
	}

	@Column(name = "itemEndTime", length = 20)
	public String getItemEndTime() {
		return this.itemEndTime;
	}

	public void setItemEndTime(String itemEndTime) {
		this.itemEndTime = itemEndTime;
	}

	@Column(name = "itemRemark", length = 65535)
	public String getItemRemark() {
		return this.itemRemark;
	}

	public void setItemRemark(String itemRemark) {
		this.itemRemark = itemRemark;
	}

	@Column(name = "itemMoneyType", length = 1)
	public String getItemMoneyType() {
		return this.itemMoneyType;
	}

	public void setItemMoneyType(String itemMoneyType) {
		this.itemMoneyType = itemMoneyType;
	}

	@Column(name = "itemDiscount")
	public Integer getItemDiscount() {
		return this.itemDiscount;
	}

	public void setItemDiscount(Integer itemDiscount) {
		this.itemDiscount = itemDiscount;
	}

}