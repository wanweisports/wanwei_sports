package com.park.common.po;

import static javax.persistence.GenerationType.IDENTITY;

import java.beans.Transient;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.park.common.constant.IDBConstant;

/**
 * MemberCard entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "member_card", catalog = "park", uniqueConstraints = @UniqueConstraint(columnNames = "cardNo"))
public class MemberCard implements java.io.Serializable {

	// Fields

	private Integer cardId;
	private String cardNo;
	private Double cardBalance;
	private String cardDeadline;
	private String cardStatus = IDBConstant.LOGIC_STATUS_YES;
	private Integer cardTypeId;
	private String createTime;
	private String updateTime;
	private Integer salesId;
	
	@javax.persistence.Transient
	private Integer memberId;

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
	public MemberCard(String cardNo, Double cardBalance, String cardDeadline,
			String cardStatus, Integer cardTypeId, String createTime,
			String updateTime, Integer salesId) {
		this.cardNo = cardNo;
		this.cardBalance = cardBalance;
		this.cardDeadline = cardDeadline;
		this.cardStatus = cardStatus;
		this.cardTypeId = cardTypeId;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
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

	@Column(name = "createTime", length = 19)
	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Column(name = "updateTime", length = 19)
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
	
	@javax.persistence.Transient
	public Integer getMemberId() {
		return memberId;
	}

	@javax.persistence.Transient
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	
	

}