package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * MemberCardType entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "member_card_type", catalog = "park")
public class MemberCardType implements java.io.Serializable {

	// Fields

	private Integer cardTypeId;
	private String cardTypeName;
	private String cardType;
	private String cardTypeStatus;
	private String cardTypeMonth;
	private String cardTypeWeek;
	private String cardTypeTimeStart;
	private String cardTypeTimeEnd;
	private Integer cardTypeAhead;
	private Double cardTypeMoney;
	private Double cardTypeCredit;
	private String createTime;
	private String updateTime;
	private Integer salesId;
	private Double cardDeposit;
	private Integer cardTypeDiscount;

	// Constructors

	/** default constructor */
	public MemberCardType() {
	}

	/** minimal constructor */
	public MemberCardType(String cardTypeName, String cardType,
			String cardTypeStatus, Double cardTypeMoney) {
		this.cardTypeName = cardTypeName;
		this.cardType = cardType;
		this.cardTypeStatus = cardTypeStatus;
		this.cardTypeMoney = cardTypeMoney;
	}

	/** full constructor */
	public MemberCardType(String cardTypeName, String cardType,
			String cardTypeStatus, String cardTypeMonth, String cardTypeWeek,
			String cardTypeTimeStart, String cardTypeTimeEnd,
			Integer cardTypeAhead, Double cardTypeMoney, Double cardTypeCredit,
			String createTime, String updateTime, Integer salesId,
			Double cardDeposit, Integer cardTypeDiscount) {
		this.cardTypeName = cardTypeName;
		this.cardType = cardType;
		this.cardTypeStatus = cardTypeStatus;
		this.cardTypeMonth = cardTypeMonth;
		this.cardTypeWeek = cardTypeWeek;
		this.cardTypeTimeStart = cardTypeTimeStart;
		this.cardTypeTimeEnd = cardTypeTimeEnd;
		this.cardTypeAhead = cardTypeAhead;
		this.cardTypeMoney = cardTypeMoney;
		this.cardTypeCredit = cardTypeCredit;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
		this.cardDeposit = cardDeposit;
		this.cardTypeDiscount = cardTypeDiscount;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "cardTypeId", unique = true, nullable = false)
	public Integer getCardTypeId() {
		return this.cardTypeId;
	}

	public void setCardTypeId(Integer cardTypeId) {
		this.cardTypeId = cardTypeId;
	}

	@Column(name = "cardTypeName", nullable = false, length = 16)
	public String getCardTypeName() {
		return this.cardTypeName;
	}

	public void setCardTypeName(String cardTypeName) {
		this.cardTypeName = cardTypeName;
	}

	@Column(name = "cardType", nullable = false, length = 1)
	public String getCardType() {
		return this.cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	@Column(name = "cardTypeStatus", nullable = false, length = 1)
	public String getCardTypeStatus() {
		return this.cardTypeStatus;
	}

	public void setCardTypeStatus(String cardTypeStatus) {
		this.cardTypeStatus = cardTypeStatus;
	}

	@Column(name = "cardTypeMonth", length = 32)
	public String getCardTypeMonth() {
		return this.cardTypeMonth;
	}

	public void setCardTypeMonth(String cardTypeMonth) {
		this.cardTypeMonth = cardTypeMonth;
	}

	@Column(name = "cardTypeWeek", length = 32)
	public String getCardTypeWeek() {
		return this.cardTypeWeek;
	}

	public void setCardTypeWeek(String cardTypeWeek) {
		this.cardTypeWeek = cardTypeWeek;
	}

	@Column(name = "cardTypeTimeStart", length = 64)
	public String getCardTypeTimeStart() {
		return this.cardTypeTimeStart;
	}

	public void setCardTypeTimeStart(String cardTypeTimeStart) {
		this.cardTypeTimeStart = cardTypeTimeStart;
	}

	@Column(name = "cardTypeTimeEnd", length = 64)
	public String getCardTypeTimeEnd() {
		return this.cardTypeTimeEnd;
	}

	public void setCardTypeTimeEnd(String cardTypeTimeEnd) {
		this.cardTypeTimeEnd = cardTypeTimeEnd;
	}

	@Column(name = "cardTypeAhead")
	public Integer getCardTypeAhead() {
		return this.cardTypeAhead;
	}

	public void setCardTypeAhead(Integer cardTypeAhead) {
		this.cardTypeAhead = cardTypeAhead;
	}

	@Column(name = "cardTypeMoney", nullable = false, precision = 10)
	public Double getCardTypeMoney() {
		return this.cardTypeMoney;
	}

	public void setCardTypeMoney(Double cardTypeMoney) {
		this.cardTypeMoney = cardTypeMoney;
	}

	@Column(name = "cardTypeCredit", precision = 10)
	public Double getCardTypeCredit() {
		return this.cardTypeCredit;
	}

	public void setCardTypeCredit(Double cardTypeCredit) {
		this.cardTypeCredit = cardTypeCredit;
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

	@Column(name = "cardDeposit", precision = 10)
	public Double getCardDeposit() {
		return this.cardDeposit;
	}

	public void setCardDeposit(Double cardDeposit) {
		this.cardDeposit = cardDeposit;
	}

	@Column(name = "cardTypeDiscount")
	public Integer getCardTypeDiscount() {
		return this.cardTypeDiscount;
	}

	public void setCardTypeDiscount(Integer cardTypeDiscount) {
		this.cardTypeDiscount = cardTypeDiscount;
	}

}