package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SiteSport entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "site_sport", catalog = "park")
public class SiteSport implements java.io.Serializable {

	// Fields

	private Integer sportId;
	private String sportName;
	private Double sportMoney;
	private Double sportDeposit;
	private String startTime;
	private String endTime;
	private String sportStatus;
	private String sportCustom;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public SiteSport() {
	}

	/** full constructor */
	public SiteSport(String sportName, Double sportMoney, Double sportDeposit,
			String startTime, String endTime, String sportStatus,
			String sportCustom, String createTime, String updateTime,
			Integer salesId) {
		this.sportName = sportName;
		this.sportMoney = sportMoney;
		this.sportDeposit = sportDeposit;
		this.startTime = startTime;
		this.endTime = endTime;
		this.sportStatus = sportStatus;
		this.sportCustom = sportCustom;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "sportId", unique = true, nullable = false)
	public Integer getSportId() {
		return this.sportId;
	}

	public void setSportId(Integer sportId) {
		this.sportId = sportId;
	}

	@Column(name = "sportName", length = 32)
	public String getSportName() {
		return this.sportName;
	}

	public void setSportName(String sportName) {
		this.sportName = sportName;
	}

	@Column(name = "sportMoney", precision = 10)
	public Double getSportMoney() {
		return this.sportMoney;
	}

	public void setSportMoney(Double sportMoney) {
		this.sportMoney = sportMoney;
	}

	@Column(name = "sportDeposit", precision = 10)
	public Double getSportDeposit() {
		return this.sportDeposit;
	}

	public void setSportDeposit(Double sportDeposit) {
		this.sportDeposit = sportDeposit;
	}

	@Column(name = "startTime", length = 20)
	public String getStartTime() {
		return this.startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	@Column(name = "endTime", length = 20)
	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	@Column(name = "sportStatus", length = 1)
	public String getSportStatus() {
		return this.sportStatus;
	}

	public void setSportStatus(String sportStatus) {
		this.sportStatus = sportStatus;
	}

	@Column(name = "sportCustom", length = 1)
	public String getSportCustom() {
		return this.sportCustom;
	}

	public void setSportCustom(String sportCustom) {
		this.sportCustom = sportCustom;
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