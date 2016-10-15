package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ParkBusiness entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "park_business", catalog = "park")
public class ParkBusiness implements java.io.Serializable {

	// Fields

	private Integer businessId;
	private String businessStartTime;
	private String businessEndTime;
	private String businessTimePeriod;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public ParkBusiness() {
	}

	/** full constructor */
	public ParkBusiness(String businessStartTime, String businessEndTime,
			String businessTimePeriod, String createTime, String updateTime,
			Integer salesId) {
		this.businessStartTime = businessStartTime;
		this.businessEndTime = businessEndTime;
		this.businessTimePeriod = businessTimePeriod;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "businessId", unique = true, nullable = false)
	public Integer getBusinessId() {
		return this.businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

	@Column(name = "businessStartTime", length = 20)
	public String getBusinessStartTime() {
		return this.businessStartTime;
	}

	public void setBusinessStartTime(String businessStartTime) {
		this.businessStartTime = businessStartTime;
	}

	@Column(name = "businessEndTime", length = 20)
	public String getBusinessEndTime() {
		return this.businessEndTime;
	}

	public void setBusinessEndTime(String businessEndTime) {
		this.businessEndTime = businessEndTime;
	}

	@Column(name = "businessTimePeriod", length = 20)
	public String getBusinessTimePeriod() {
		return this.businessTimePeriod;
	}

	public void setBusinessTimePeriod(String businessTimePeriod) {
		this.businessTimePeriod = businessTimePeriod;
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