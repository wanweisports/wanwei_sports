package com.park.common.po;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Transient;

import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SiteReserveBasic entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "site_reserve_basic", catalog = "park")
public class SiteReserveBasic implements java.io.Serializable {

	// Fields

	private Integer siteReserveId;
	private String name;
	private String mobile;
	private String opType;
	private String siteReserveStatus;
	private String reserveType;
	private String reserveModel;
	private String createTime;
	private String updateTime;
	private Integer salesId;
	private Integer memberId;
	private Integer orderId;
	@Transient
	private Double orderSumPrice;
	@Transient
	private Integer useCount;
	@Transient
	private List<SiteReserveDate> siteReserveDateList;

	// Constructors

	/** default constructor */
	public SiteReserveBasic() {
	}

	/** full constructor */
	public SiteReserveBasic(String name, String mobile, String opType,
			String siteReserveStatus, String reserveType, String reserveModel,
			String createTime, String updateTime, Integer salesId,
			Integer memberId, Integer orderId) {
		this.name = name;
		this.mobile = mobile;
		this.opType = opType;
		this.siteReserveStatus = siteReserveStatus;
		this.reserveType = reserveType;
		this.reserveModel = reserveModel;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
		this.memberId = memberId;
		this.orderId = orderId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "siteReserveId", unique = true, nullable = false)
	public Integer getSiteReserveId() {
		return this.siteReserveId;
	}

	public void setSiteReserveId(Integer siteReserveId) {
		this.siteReserveId = siteReserveId;
	}

	@Column(name = "name", length = 32)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "mobile", length = 11)
	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "opType", length = 1)
	public String getOpType() {
		return this.opType;
	}

	public void setOpType(String opType) {
		this.opType = opType;
	}

	@Column(name = "siteReserveStatus", length = 1)
	public String getSiteReserveStatus() {
		return this.siteReserveStatus;
	}

	public void setSiteReserveStatus(String siteReserveStatus) {
		this.siteReserveStatus = siteReserveStatus;
	}

	@Column(name = "reserveType", length = 1)
	public String getReserveType() {
		return this.reserveType;
	}

	public void setReserveType(String reserveType) {
		this.reserveType = reserveType;
	}

	@Column(name = "reserveModel", length = 1)
	public String getReserveModel() {
		return this.reserveModel;
	}

	public void setReserveModel(String reserveModel) {
		this.reserveModel = reserveModel;
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

	@Column(name = "memberId")
	public Integer getMemberId() {
		return this.memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name = "orderId")
	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	@Transient
	public List<SiteReserveDate> getSiteReserveDateList() {
		return siteReserveDateList;
	}

	@Transient
	public void setSiteReserveDateList(List<SiteReserveDate> siteReserveDateList) {
		this.siteReserveDateList = siteReserveDateList;
	}

	@Transient
	public Double getOrderSumPrice() {
		return orderSumPrice;
	}

	@Transient
	public void setOrderSumPrice(Double orderSumPrice) {
		this.orderSumPrice = orderSumPrice;
	}

	@Transient
	public Integer getUseCount() {
		return useCount;
	}

	@Transient
	public void setUseCount(Integer useCount) {
		this.useCount = useCount;
	}
	
}