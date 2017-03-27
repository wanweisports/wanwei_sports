package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * SiteInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "site_info", catalog = "park", uniqueConstraints = @UniqueConstraint(columnNames = "siteNo"))
public class SiteInfo implements java.io.Serializable {

	// Fields

	private Integer siteId;
	private String siteName;
	private String siteNo;
	private String siteRemark;
	private Integer siteType;
	private String siteStatus;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public SiteInfo() {
	}

	/** full constructor */
	public SiteInfo(String siteName, String siteNo, String siteRemark,
			Integer siteType, String siteStatus, String createTime,
			String updateTime, Integer salesId) {
		this.siteName = siteName;
		this.siteNo = siteNo;
		this.siteRemark = siteRemark;
		this.siteType = siteType;
		this.siteStatus = siteStatus;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "siteId", unique = true, nullable = false)
	public Integer getSiteId() {
		return this.siteId;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}

	@Column(name = "siteName", length = 32)
	public String getSiteName() {
		return this.siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	@Column(name = "siteNo", unique = true, length = 32)
	public String getSiteNo() {
		return this.siteNo;
	}

	public void setSiteNo(String siteNo) {
		this.siteNo = siteNo;
	}

	@Column(name = "siteRemark")
	public String getSiteRemark() {
		return this.siteRemark;
	}

	public void setSiteRemark(String siteRemark) {
		this.siteRemark = siteRemark;
	}

	@Column(name = "siteType")
	public Integer getSiteType() {
		return this.siteType;
	}

	public void setSiteType(Integer siteType) {
		this.siteType = siteType;
	}

	@Column(name = "siteStatus", length = 1)
	public String getSiteStatus() {
		return this.siteStatus;
	}

	public void setSiteStatus(String siteStatus) {
		this.siteStatus = siteStatus;
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