package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SystemPrivilege entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "system_privilege", catalog = "park")
public class SystemPrivilege implements java.io.Serializable {

	// Fields

	private Integer privilegeId;
	private String privilegeName;
	private String privilegeStatus;
	private String createTime;
	private String updateTime;

	// Constructors

	/** default constructor */
	public SystemPrivilege() {
	}

	/** minimal constructor */
	public SystemPrivilege(String privilegeName, String privilegeStatus) {
		this.privilegeName = privilegeName;
		this.privilegeStatus = privilegeStatus;
	}

	/** full constructor */
	public SystemPrivilege(String privilegeName, String privilegeStatus,
			String createTime, String updateTime) {
		this.privilegeName = privilegeName;
		this.privilegeStatus = privilegeStatus;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "privilegeId", unique = true, nullable = false)
	public Integer getPrivilegeId() {
		return this.privilegeId;
	}

	public void setPrivilegeId(Integer privilegeId) {
		this.privilegeId = privilegeId;
	}

	@Column(name = "privilegeName", nullable = false, length = 32)
	public String getPrivilegeName() {
		return this.privilegeName;
	}

	public void setPrivilegeName(String privilegeName) {
		this.privilegeName = privilegeName;
	}

	@Column(name = "privilegeStatus", nullable = false, length = 16)
	public String getPrivilegeStatus() {
		return this.privilegeStatus;
	}

	public void setPrivilegeStatus(String privilegeStatus) {
		this.privilegeStatus = privilegeStatus;
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