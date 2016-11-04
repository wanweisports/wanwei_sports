package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SystemRole entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "system_role", catalog = "park")
public class SystemRole implements java.io.Serializable {

	// Fields

	private Integer roleId;
	private String roleName;
	private String roleStatus;
	private String readOnly;
	private String roleDescribe;
	private Integer roleLevel;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public SystemRole() {
	}

	/** minimal constructor */
	public SystemRole(String roleName, String roleStatus, String readOnly) {
		this.roleName = roleName;
		this.roleStatus = roleStatus;
		this.readOnly = readOnly;
	}

	/** full constructor */
	public SystemRole(String roleName, String roleStatus, String readOnly,
			String roleDescribe, Integer roleLevel, String createTime,
			String updateTime, Integer salesId) {
		this.roleName = roleName;
		this.roleStatus = roleStatus;
		this.readOnly = readOnly;
		this.roleDescribe = roleDescribe;
		this.roleLevel = roleLevel;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "roleId", unique = true, nullable = false)
	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Column(name = "roleName", nullable = false, length = 32)
	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Column(name = "roleStatus", nullable = false, length = 16)
	public String getRoleStatus() {
		return this.roleStatus;
	}

	public void setRoleStatus(String roleStatus) {
		this.roleStatus = roleStatus;
	}

	@Column(name = "readOnly", nullable = false, length = 16)
	public String getReadOnly() {
		return this.readOnly;
	}

	public void setReadOnly(String readOnly) {
		this.readOnly = readOnly;
	}

	@Column(name = "roleDescribe")
	public String getRoleDescribe() {
		return this.roleDescribe;
	}

	public void setRoleDescribe(String roleDescribe) {
		this.roleDescribe = roleDescribe;
	}

	@Column(name = "roleLevel")
	public Integer getRoleLevel() {
		return this.roleLevel;
	}

	public void setRoleLevel(Integer roleLevel) {
		this.roleLevel = roleLevel;
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