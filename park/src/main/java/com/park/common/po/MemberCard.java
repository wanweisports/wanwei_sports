package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * MemberCard entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "member_card", catalog = "park", uniqueConstraints = @UniqueConstraint(columnNames = "cardNo"))
public class MemberCard implements java.io.Serializable {

	// Fields

	private Integer cardId;
	private Integer memberId;
	private String cardNo;
	private Double cardBalance;
	private String cardDeadline;
	private String cardStatus;
	private Integer cardTypeId;
	private String createTime;
	private String updateTime;
	private String cardRemark;
	private Integer salesId;
	private Double cardDeposit;

	// Constructors

	/** default constructor */
	public MemberCard() {
	}

	/** minimal constructor */
	public MemberCard(String cardStatus, Integer cardTypeId) {
		this.cardStatus = cardStatus;
		this.cardTypeId = cardTypeId;
	}

	/** full constructor */
	public MemberCard(Integer memberId, String cardNo, Double cardBalance,
			String cardDeadline, String cardStatus, Integer cardTypeId,
			String createTime, String updateTime, String cardRemark,
			Integer salesId, Double cardDeposit) {
		this.memberId = memberId;
		this.cardNo = cardNo;
		this.cardBalance = cardBalance;
		this.cardDeadline = cardDeadline;
		this.cardStatus = cardStatus;
		this.cardTypeId = cardTypeId;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.cardRemark = cardRemark;
		this.salesId = salesId;
		this.cardDeposit = cardDeposit;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "cardId", unique = true, nullable = false)
	public Integer getCardId() {
		return this.cardId;
	}

	public void setCardId(Integer cardId) {
		this.cardId = cardId;
	}

	@Column(name = "memberId")
	public Integer getMemberId() {
		return this.memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name = "cardNo", unique = true, length = 32)
	public String getCardNo() {
		return this.cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	@Column(name = "cardBalance", precision = 10)
	public Double getCardBalance() {
		return this.cardBalance;
	}

	public void setCardBalance(Double cardBalance) {
		this.cardBalance = cardBalance;
	}

	@Column(name = "cardDeadline", length = 32)
	public String getCardDeadline() {
		return this.cardDeadline;
	}

	public void setCardDeadline(String cardDeadline) {
		this.cardDeadline = cardDeadline;
	}

	@Column(name = "cardStatus", nullable = false, length = 1)
	public String getCardStatus() {
		return this.cardStatus;
	}

	public void setCardStatus(String cardStatus) {
		this.cardStatus = cardStatus;
	}

	@Column(name = "cardTypeId", nullable = false)
	public Integer getCardTypeId() {
		return this.cardTypeId;
	}

	public void setCardTypeId(Integer cardTypeId) {
		this.cardTypeId = cardTypeId;
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

	@Column(name = "cardRemark")
	public String getCardRemark() {
		return this.cardRemark;
	}

	public void setCardRemark(String cardRemark) {
		this.cardRemark = cardRemark;
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

}