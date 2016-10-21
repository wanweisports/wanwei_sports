package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SiteReserveTime entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "site_reserve_time", catalog = "park")
public class SiteReserveTime implements java.io.Serializable {

	// Fields

	private Integer reserveTimeId;
	private Integer reserveDateId;
	private Integer siteId;
	private String siteStartTime;
	private String siteEndTime;

	// Constructors

	/** default constructor */
	public SiteReserveTime() {
	}

	/** full constructor */
	public SiteReserveTime(Integer reserveDateId, Integer siteId,
			String siteStartTime, String siteEndTime) {
		this.reserveDateId = reserveDateId;
		this.siteId = siteId;
		this.siteStartTime = siteStartTime;
		this.siteEndTime = siteEndTime;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "reserveTimeId", unique = true, nullable = false)
	public Integer getReserveTimeId() {
		return this.reserveTimeId;
	}

	public void setReserveTimeId(Integer reserveTimeId) {
		this.reserveTimeId = reserveTimeId;
	}

	@Column(name = "reserveDateId")
	public Integer getReserveDateId() {
		return this.reserveDateId;
	}

	public void setReserveDateId(Integer reserveDateId) {
		this.reserveDateId = reserveDateId;
	}

	@Column(name = "siteId")
	public Integer getSiteId() {
		return this.siteId;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
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

}