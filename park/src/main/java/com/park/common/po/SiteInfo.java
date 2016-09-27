package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SiteInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "site_info", catalog = "park")
public class SiteInfo implements java.io.Serializable {

	// Fields

	private Integer siteId;
	private String siteName;
	private String siteNo;
	private String siteRemark;
	private Integer siteType;
	private String createTime;
	private String updateTime;

	// Constructors

	/** default constructor */
	public SiteInfo() {
	}

	/** full constructor */
	public SiteInfo(String siteName, String siteNo, String siteRemark,
			Integer siteType, String createTime, String updateTime) {
		this.siteName = siteName;
		this.siteNo = siteNo;
		this.siteRemark = siteRemark;
		this.siteType = siteType;
		this.createTime = createTime;
		this.updateTime = updateTime;
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

	@Column(name = "siteNo", length = 32)
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

}