package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * MemberReceivable entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "member_receivable", catalog = "park")
public class MemberReceivable implements java.io.Serializable {

	// Fields

	private Integer receivableId;
	private Integer memberId;
	private Integer orderId;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public MemberReceivable() {
	}

	/** full constructor */
	public MemberReceivable(Integer memberId, Integer orderId,
			String createTime, String updateTime, Integer salesId) {
		this.memberId = memberId;
		this.orderId = orderId;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "receivableId", unique = true, nullable = false)
	public Integer getReceivableId() {
		return this.receivableId;
	}

	public void setReceivableId(Integer receivableId) {
		this.receivableId = receivableId;
	}

	@Column(name = "memberId")
	public Integer getMemberId() {
		return this.memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name = "orderId")
	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
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