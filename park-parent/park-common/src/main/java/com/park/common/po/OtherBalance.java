package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * OtherBalance entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "other_balance", catalog = "park", uniqueConstraints = @UniqueConstraint(columnNames = "balanceNo"))
public class OtherBalance implements java.io.Serializable {

	// Fields

	private Integer balanceId;
	private String balanceNo;
	private String balanceServiceType;
	private Integer balanceServiceId;
	private String balanceServiceName;
	private String balanceType;
	private String balanceStyle;
	private String balanceCheckNo;
	private Double oldAmount;
	private Double realAmount;
	private Double xjAmount;
	private Double subAmount;
	private Double givingAmount;
	private Double divBalance;
	private String balanceStatus;
	private String serviceDate;
	private Double changeAmount;
	private String createTime;
	private String updateTime;
	private Integer salesId;
	private String remark;
	private Integer balanceCardId;

	// Constructors

	/** default constructor */
	public OtherBalance() {
	}

	/** minimal constructor */
	public OtherBalance(String balanceNo, String balanceServiceType,
			Integer balanceServiceId) {
		this.balanceNo = balanceNo;
		this.balanceServiceType = balanceServiceType;
		this.balanceServiceId = balanceServiceId;
	}

	/** full constructor */
	public OtherBalance(String balanceNo, String balanceServiceType,
			Integer balanceServiceId, String balanceServiceName,
			String balanceType, String balanceStyle, String balanceCheckNo,
			Double oldAmount, Double realAmount, Double xjAmount,
			Double subAmount, Double givingAmount, Double divBalance,
			String balanceStatus, String serviceDate, Double changeAmount,
			String createTime, String updateTime, Integer salesId,
			String remark, Integer balanceCardId) {
		this.balanceNo = balanceNo;
		this.balanceServiceType = balanceServiceType;
		this.balanceServiceId = balanceServiceId;
		this.balanceServiceName = balanceServiceName;
		this.balanceType = balanceType;
		this.balanceStyle = balanceStyle;
		this.balanceCheckNo = balanceCheckNo;
		this.oldAmount = oldAmount;
		this.realAmount = realAmount;
		this.xjAmount = xjAmount;
		this.subAmount = subAmount;
		this.givingAmount = givingAmount;
		this.divBalance = divBalance;
		this.balanceStatus = balanceStatus;
		this.serviceDate = serviceDate;
		this.changeAmount = changeAmount;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
		this.remark = remark;
		this.balanceCardId = balanceCardId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "balanceId", unique = true, nullable = false)
	public Integer getBalanceId() {
		return this.balanceId;
	}

	public void setBalanceId(Integer balanceId) {
		this.balanceId = balanceId;
	}

	@Column(name = "balanceNo", unique = true, nullable = false, length = 32)
	public String getBalanceNo() {
		return this.balanceNo;
	}

	public void setBalanceNo(String balanceNo) {
		this.balanceNo = balanceNo;
	}

	@Column(name = "balanceServiceType", nullable = false, length = 16)
	public String getBalanceServiceType() {
		return this.balanceServiceType;
	}

	public void setBalanceServiceType(String balanceServiceType) {
		this.balanceServiceType = balanceServiceType;
	}

	@Column(name = "balanceServiceId", nullable = false)
	public Integer getBalanceServiceId() {
		return this.balanceServiceId;
	}

	public void setBalanceServiceId(Integer balanceServiceId) {
		this.balanceServiceId = balanceServiceId;
	}

	@Column(name = "balanceServiceName", length = 100)
	public String getBalanceServiceName() {
		return this.balanceServiceName;
	}

	public void setBalanceServiceName(String balanceServiceName) {
		this.balanceServiceName = balanceServiceName;
	}

	@Column(name = "balanceType", length = 1)
	public String getBalanceType() {
		return this.balanceType;
	}

	public void setBalanceType(String balanceType) {
		this.balanceType = balanceType;
	}

	@Column(name = "balanceStyle", length = 1)
	public String getBalanceStyle() {
		return this.balanceStyle;
	}

	public void setBalanceStyle(String balanceStyle) {
		this.balanceStyle = balanceStyle;
	}

	@Column(name = "balanceCheckNo", length = 100)
	public String getBalanceCheckNo() {
		return this.balanceCheckNo;
	}

	public void setBalanceCheckNo(String balanceCheckNo) {
		this.balanceCheckNo = balanceCheckNo;
	}

	@Column(name = "oldAmount", precision = 10)
	public Double getOldAmount() {
		return this.oldAmount;
	}

	public void setOldAmount(Double oldAmount) {
		this.oldAmount = oldAmount;
	}

	@Column(name = "realAmount", precision = 10)
	public Double getRealAmount() {
		return this.realAmount;
	}

	public void setRealAmount(Double realAmount) {
		this.realAmount = realAmount;
	}

	@Column(name = "xjAmount", precision = 10)
	public Double getXjAmount() {
		return this.xjAmount;
	}

	public void setXjAmount(Double xjAmount) {
		this.xjAmount = xjAmount;
	}

	@Column(name = "subAmount", precision = 10)
	public Double getSubAmount() {
		return this.subAmount;
	}

	public void setSubAmount(Double subAmount) {
		this.subAmount = subAmount;
	}

	@Column(name = "givingAmount", precision = 10)
	public Double getGivingAmount() {
		return this.givingAmount;
	}

	public void setGivingAmount(Double givingAmount) {
		this.givingAmount = givingAmount;
	}

	@Column(name = "divBalance", precision = 10)
	public Double getDivBalance() {
		return this.divBalance;
	}

	public void setDivBalance(Double divBalance) {
		this.divBalance = divBalance;
	}

	@Column(name = "balanceStatus", length = 1)
	public String getBalanceStatus() {
		return this.balanceStatus;
	}

	public void setBalanceStatus(String balanceStatus) {
		this.balanceStatus = balanceStatus;
	}

	@Column(name = "serviceDate", length = 20)
	public String getServiceDate() {
		return this.serviceDate;
	}

	public void setServiceDate(String serviceDate) {
		this.serviceDate = serviceDate;
	}

	@Column(name = "changeAmount", precision = 10)
	public Double getChangeAmount() {
		return this.changeAmount;
	}

	public void setChangeAmount(Double changeAmount) {
		this.changeAmount = changeAmount;
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

	@Column(name = "remark")
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "balanceCardId")
	public Integer getBalanceCardId() {
		return this.balanceCardId;
	}

	public void setBalanceCardId(Integer balanceCardId) {
		this.balanceCardId = balanceCardId;
	}

}