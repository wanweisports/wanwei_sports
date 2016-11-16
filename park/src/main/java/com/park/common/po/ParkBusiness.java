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
	private String businessName;
	private String businessAreaName;
	private String businessContact;
	private String businessPhone;
	private String businessAddress;
	private String createTime;
	private String updateTime;
	private Integer salesId;
	private Integer points;

	// Constructors

	/** default constructor */
	public ParkBusiness() {
	}

	/** full constructor */
	public ParkBusiness(String businessStartTime, String businessEndTime,
			String businessTimePeriod, String businessName,
			String businessAreaName, String businessContact,
			String businessPhone, String businessAddress, String createTime,
			String updateTime, Integer salesId, Integer points) {
		this.businessStartTime = businessStartTime;
		this.businessEndTime = businessEndTime;
		this.businessTimePeriod = businessTimePeriod;
		this.businessName = businessName;
		this.businessAreaName = businessAreaName;
		this.businessContact = businessContact;
		this.businessPhone = businessPhone;
		this.businessAddress = businessAddress;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
		this.points = points;
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

	@Column(name = "businessName")
	public String getBusinessName() {
		return this.businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	@Column(name = "businessAreaName", length = 512)
	public String getBusinessAreaName() {
		return this.businessAreaName;
	}

	public void setBusinessAreaName(String businessAreaName) {
		this.businessAreaName = businessAreaName;
	}

	@Column(name = "businessContact", length = 32)
	public String getBusinessContact() {
		return this.businessContact;
	}

	public void setBusinessContact(String businessContact) {
		this.businessContact = businessContact;
	}

	@Column(name = "businessPhone", length = 32)
	public String getBusinessPhone() {
		return this.businessPhone;
	}

	public void setBusinessPhone(String businessPhone) {
		this.businessPhone = businessPhone;
	}

	@Column(name = "businessAddress", length = 1024)
	public String getBusinessAddress() {
		return this.businessAddress;
	}

	public void setBusinessAddress(String businessAddress) {
		this.businessAddress = businessAddress;
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

	@Column(name = "points")
	public Integer getPoints() {
		return this.points;
	}

	public void setPoints(Integer points) {
		this.points = points;
	}

}