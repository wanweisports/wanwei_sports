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
 * SiteReserveDate entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "site_reserve_date", catalog = "park")
public class SiteReserveDate implements java.io.Serializable {

	// Fields

	private Integer reserveDateId;
	private Integer siteReserveId;
	private String reserveStartDate;
	private String reserveEndDate;
	private String reserveWeek;
	private String reserveDates;
	@Transient
	private List<SiteReserveTime> siteReserveTimeList;

	// Constructors

	/** default constructor */
	public SiteReserveDate() {
	}

	/** full constructor */
	public SiteReserveDate(Integer siteReserveId, String reserveStartDate,
			String reserveEndDate, String reserveWeek, String reserveDates) {
		this.siteReserveId = siteReserveId;
		this.reserveStartDate = reserveStartDate;
		this.reserveEndDate = reserveEndDate;
		this.reserveWeek = reserveWeek;
		this.reserveDates = reserveDates;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "reserveDateId", unique = true, nullable = false)
	public Integer getReserveDateId() {
		return this.reserveDateId;
	}

	public void setReserveDateId(Integer reserveDateId) {
		this.reserveDateId = reserveDateId;
	}

	@Column(name = "siteReserveId")
	public Integer getSiteReserveId() {
		return this.siteReserveId;
	}

	public void setSiteReserveId(Integer siteReserveId) {
		this.siteReserveId = siteReserveId;
	}

	@Column(name = "reserveStartDate", length = 20)
	public String getReserveStartDate() {
		return this.reserveStartDate;
	}

	public void setReserveStartDate(String reserveStartDate) {
		this.reserveStartDate = reserveStartDate;
	}

	@Column(name = "reserveEndDate", length = 20)
	public String getReserveEndDate() {
		return this.reserveEndDate;
	}

	public void setReserveEndDate(String reserveEndDate) {
		this.reserveEndDate = reserveEndDate;
	}

	@Column(name = "reserveWeek", length = 20)
	public String getReserveWeek() {
		return this.reserveWeek;
	}

	public void setReserveWeek(String reserveWeek) {
		this.reserveWeek = reserveWeek;
	}

	@Column(name = "reserveDates", length = 16777215)
	public String getReserveDates() {
		return this.reserveDates;
	}

	public void setReserveDates(String reserveDates) {
		this.reserveDates = reserveDates;
	}

	@Transient
	public List<SiteReserveTime> getSiteReserveTimeList() {
		return siteReserveTimeList;
	}

	@Transient
	public void setSiteReserveTimeList(List<SiteReserveTime> siteReserveTimeList) {
		this.siteReserveTimeList = siteReserveTimeList;
	}

}