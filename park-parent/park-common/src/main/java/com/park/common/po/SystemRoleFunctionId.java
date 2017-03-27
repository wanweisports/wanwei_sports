package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * SystemRoleFunctionId entity. @author MyEclipse Persistence Tools
 */
@Embeddable
public class SystemRoleFunctionId implements java.io.Serializable {

	// Fields

	private Integer roleId;
	private String functionId;

	// Constructors

	/** default constructor */
	public SystemRoleFunctionId() {
	}

	/** full constructor */
	public SystemRoleFunctionId(Integer roleId, String functionId) {
		this.roleId = roleId;
		this.functionId = functionId;
	}

	// Property accessors

	@Column(name = "roleId", nullable = false)
	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Column(name = "functionId", nullable = false, length = 16)
	public String getFunctionId() {
		return this.functionId;
	}

	public void setFunctionId(String functionId) {
		this.functionId = functionId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof SystemRoleFunctionId))
			return false;
		SystemRoleFunctionId castOther = (SystemRoleFunctionId) other;

		return ((this.getRoleId() == castOther.getRoleId()) || (this
				.getRoleId() != null && castOther.getRoleId() != null && this
				.getRoleId().equals(castOther.getRoleId())))
				&& ((this.getFunctionId() == castOther.getFunctionId()) || (this
						.getFunctionId() != null
						&& castOther.getFunctionId() != null && this
						.getFunctionId().equals(castOther.getFunctionId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getRoleId() == null ? 0 : this.getRoleId().hashCode());
		result = 37
				* result
				+ (getFunctionId() == null ? 0 : this.getFunctionId()
						.hashCode());
		return result;
	}

}