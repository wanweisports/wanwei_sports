package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * UserOperator entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user_operator", catalog = "park")
public class UserOperator implements java.io.Serializable {

	// Fields

	private String operatorId;
	private String operatorName;
	private String operatorPwd;
	private String status;
	private String createTime;
	private String updateTime;

	// Constructors

	/** default constructor */
	public UserOperator() {
	}

	/** full constructor */
	public UserOperator(String operatorName, String operatorPwd, String status,
			String createTime, String updateTime) {
		this.operatorName = operatorName;
		this.operatorPwd = operatorPwd;
		this.status = status;
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

	@Column(name = "operatorName", length = 32)
	public String getOperatorName() {
		return this.operatorName;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

	@Column(name = "operatorPwd", length = 32)
	public String getOperatorPwd() {
		return this.operatorPwd;
	}

	public void setOperatorPwd(String operatorPwd) {
		this.operatorPwd = operatorPwd;
	}

	@Column(name = "status", length = 1)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
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