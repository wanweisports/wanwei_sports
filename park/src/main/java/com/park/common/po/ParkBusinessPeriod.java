package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ParkBusinessPeriod entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "park_business_period", catalog = "park")
public class ParkBusinessPeriod implements java.io.Serializable {

	// Fields

	private Integer businessPeriodId;
	private Integer businessId;
	private String periodStartTime;
	private String periodEndTime;

	// Constructors

	/** default constructor */
	public ParkBusinessPeriod() {
	}

	/** full constructor */
	public ParkBusinessPeriod(Integer businessId, String periodStartTime,
			String periodEndTime) {
		this.businessId = businessId;
		this.periodStartTime = periodStartTime;
		this.periodEndTime = periodEndTime;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "businessPeriodId", unique = true, nullable = false)
	public Integer getBusinessPeriodId() {
		return this.businessPeriodId;
	}

	public void setBusinessPeriodId(Integer businessPeriodId) {
		this.businessPeriodId = businessPeriodId;
	}

	@Column(name = "businessId")
	public Integer getBusinessId() {
		return this.businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

	@Column(name = "periodStartTime", length = 20)
	public String getPeriodStartTime() {
		return this.periodStartTime;
	}

	public void setPeriodStartTime(String periodStartTime) {
		this.periodStartTime = periodStartTime;
	}

	@Column(name = "periodEndTime", length = 20)
	public String getPeriodEndTime() {
		return this.periodEndTime;
	}

	public void setPeriodEndTime(String periodEndTime) {
		this.periodEndTime = periodEndTime;
	}

}