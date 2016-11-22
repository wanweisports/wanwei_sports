package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * MemberSiteSign entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "member_site_sign", catalog = "park")
public class MemberSiteSign implements java.io.Serializable {

	// Fields

	private Integer signId;
	private String signMemberCardNo;
	private String signName;
	private String signMobile;
	private Integer orderId;
	private String signType;
	private Integer reserveTimeId;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public MemberSiteSign() {
	}

	/** full constructor */
	public MemberSiteSign(String signMemberCardNo, String signName,
			String signMobile, Integer orderId, String signType,
			Integer reserveTimeId, String createTime, String updateTime,
			Integer salesId) {
		this.signMemberCardNo = signMemberCardNo;
		this.signName = signName;
		this.signMobile = signMobile;
		this.orderId = orderId;
		this.signType = signType;
		this.reserveTimeId = reserveTimeId;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "signId", unique = true, nullable = false)
	public Integer getSignId() {
		return this.signId;
	}

	public void setSignId(Integer signId) {
		this.signId = signId;
	}

	@Column(name = "signMemberCardNo", length = 32)
	public String getSignMemberCardNo() {
		return this.signMemberCardNo;
	}

	public void setSignMemberCardNo(String signMemberCardNo) {
		this.signMemberCardNo = signMemberCardNo;
	}

	@Column(name = "signName", length = 32)
	public String getSignName() {
		return this.signName;
	}

	public void setSignName(String signName) {
		this.signName = signName;
	}

	@Column(name = "signMobile", length = 16)
	public String getSignMobile() {
		return this.signMobile;
	}

	public void setSignMobile(String signMobile) {
		this.signMobile = signMobile;
	}

	@Column(name = "orderId")
	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	@Column(name = "signType", length = 1)
	public String getSignType() {
		return this.signType;
	}

	public void setSignType(String signType) {
		this.signType = signType;
	}

	@Column(name = "reserveTimeId")
	public Integer getReserveTimeId() {
		return this.reserveTimeId;
	}

	public void setReserveTimeId(Integer reserveTimeId) {
		this.reserveTimeId = reserveTimeId;
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