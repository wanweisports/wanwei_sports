package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * SystemRoleOperatorId entity. @author MyEclipse Persistence Tools
 */
@Embeddable
public class SystemRoleOperatorId implements java.io.Serializable {

	// Fields

	private Integer roleId;
	private String operatorId;

	// Constructors

	/** default constructor */
	public SystemRoleOperatorId() {
	}

	/** full constructor */
	public SystemRoleOperatorId(Integer roleId, String operatorId) {
		this.roleId = roleId;
		this.operatorId = operatorId;
	}

	// Property accessors

	@Column(name = "roleId", nullable = false)
	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Column(name = "operatorId", nullable = false, length = 64)
	public String getOperatorId() {
		return this.operatorId;
	}

	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof SystemRoleOperatorId))
			return false;
		SystemRoleOperatorId castOther = (SystemRoleOperatorId) other;

		return ((this.getRoleId() == castOther.getRoleId()) || (this
				.getRoleId() != null && castOther.getRoleId() != null && this
				.getRoleId().equals(castOther.getRoleId())))
				&& ((this.getOperatorId() == castOther.getOperatorId()) || (this
						.getOperatorId() != null
						&& castOther.getOperatorId() != null && this
						.getOperatorId().equals(castOther.getOperatorId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getRoleId() == null ? 0 : this.getRoleId().hashCode());
		result = 37
				* result
				+ (getOperatorId() == null ? 0 : this.getOperatorId()
						.hashCode());
		return result;
	}

}