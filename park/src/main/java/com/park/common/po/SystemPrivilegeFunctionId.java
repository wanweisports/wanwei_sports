package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * SystemPrivilegeFunctionId entity. @author MyEclipse Persistence Tools
 */
@Embeddable
public class SystemPrivilegeFunctionId implements java.io.Serializable {

	// Fields

	private Integer privilegeId;
	private String functionId;

	// Constructors

	/** default constructor */
	public SystemPrivilegeFunctionId() {
	}

	/** full constructor */
	public SystemPrivilegeFunctionId(Integer privilegeId, String functionId) {
		this.privilegeId = privilegeId;
		this.functionId = functionId;
	}

	// Property accessors

	@Column(name = "privilegeId", nullable = false)
	public Integer getPrivilegeId() {
		return this.privilegeId;
	}

	public void setPrivilegeId(Integer privilegeId) {
		this.privilegeId = privilegeId;
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
		if (!(other instanceof SystemPrivilegeFunctionId))
			return false;
		SystemPrivilegeFunctionId castOther = (SystemPrivilegeFunctionId) other;

		return ((this.getPrivilegeId() == castOther.getPrivilegeId()) || (this
				.getPrivilegeId() != null && castOther.getPrivilegeId() != null && this
				.getPrivilegeId().equals(castOther.getPrivilegeId())))
				&& ((this.getFunctionId() == castOther.getFunctionId()) || (this
						.getFunctionId() != null
						&& castOther.getFunctionId() != null && this
						.getFunctionId().equals(castOther.getFunctionId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getPrivilegeId() == null ? 0 : this.getPrivilegeId()
						.hashCode());
		result = 37
				* result
				+ (getFunctionId() == null ? 0 : this.getFunctionId()
						.hashCode());
		return result;
	}

}