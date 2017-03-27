package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * UserOperatorCard entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user_operator_card", catalog = "park")
public class UserOperatorCard implements java.io.Serializable {

	// Fields

	private String operatorId;
	private String cardNo;
	private String createTime;
	private String updateTime;

	// Constructors

	/** default constructor */
	public UserOperatorCard() {
	}

	/** full constructor */
	public UserOperatorCard(String cardNo, String createTime, String updateTime) {
		this.cardNo = cardNo;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "operatorId", unique = true, nullable = false, length = 32)
	public String getOperatorId() {
		return this.operatorId;
	}

	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}

	@Column(name = "cardNo", length = 32)
	public String getCardNo() {
		return this.cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
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