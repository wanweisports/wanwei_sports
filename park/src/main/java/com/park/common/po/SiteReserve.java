package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SiteReserve entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "site_reserve", catalog = "park")
public class SiteReserve implements java.io.Serializable {

	// Fields

	private Integer siteReserveId;
	private Integer siteId;
	private Integer memberId;
	private Integer orderId;
	private String siteReserveStatus;
	private String siteDate;
	private String siteStartTime;
	private String siteEndTime;
	private String reserveType;
	private String createTime;
	private String updateTime;
	private Integer salesId;
	private String name;
	private String mobile;
	private String opType;

	// Constructors

	/** default constructor */
	public SiteReserve() {
	}

	/** full constructor */
	public SiteReserve(Integer siteId, Integer memberId, Integer orderId,
			String siteReserveStatus, String siteDate, String siteStartTime,
			String siteEndTime, String reserveType, String createTime,
			String updateTime, Integer salesId, String name, String mobile,
			String opType) {
		this.siteId = siteId;
		this.memberId = memberId;
		this.orderId = orderId;
		this.siteReserveStatus = siteReserveStatus;
		this.siteDate = siteDate;
		this.siteStartTime = siteStartTime;
		this.siteEndTime = siteEndTime;
		this.reserveType = reserveType;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
		this.name = name;
		this.mobile = mobile;
		this.opType = opType;
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

	@Column(name = "siteId")
	public Integer getSiteId() {
		return this.siteId;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
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

	@Column(name = "siteReserveStatus", length = 1)
	public String getSiteReserveStatus() {
		return this.siteReserveStatus;
	}

	public void setSiteReserveStatus(String siteReserveStatus) {
		this.siteReserveStatus = siteReserveStatus;
	}

	@Column(name = "siteDate", length = 20)
	public String getSiteDate() {
		return this.siteDate;
	}

	public void setSiteDate(String siteDate) {
		this.siteDate = siteDate;
	}

	@Column(name = "siteStartTime", length = 20)
	public String getSiteStartTime() {
		return this.siteStartTime;
	}

	public void setSiteStartTime(String siteStartTime) {
		this.siteStartTime = siteStartTime;
	}

	@Column(name = "siteEndTime", length = 20)
	public String getSiteEndTime() {
		return this.siteEndTime;
	}

	public void setSiteEndTime(String siteEndTime) {
		this.siteEndTime = siteEndTime;
	}

	@Column(name = "reserveType", length = 1)
	public String getReserveType() {
		return this.reserveType;
	}

	public void setReserveType(String reserveType) {
		this.reserveType = reserveType;
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

}