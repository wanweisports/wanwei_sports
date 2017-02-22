package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * SystemRoleMenuId entity. @author MyEclipse Persistence Tools
 */
@Embeddable
public class SystemRoleMenuId implements java.io.Serializable {

	// Fields

	private Integer roleId;
	private Integer menuId;

	// Constructors

	/** default constructor */
	public SystemRoleMenuId() {
	}

	/** full constructor */
	public SystemRoleMenuId(Integer roleId, Integer menuId) {
		this.roleId = roleId;
		this.menuId = menuId;
	}

	// Property accessors

	@Column(name = "roleId", nullable = false)
	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Column(name = "menuId", nullable = false)
	public Integer getMenuId() {
		return this.menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof SystemRoleMenuId))
			return false;
		SystemRoleMenuId castOther = (SystemRoleMenuId) other;

		return ((this.getRoleId() == castOther.getRoleId()) || (this
				.getRoleId() != null && castOther.getRoleId() != null && this
				.getRoleId().equals(castOther.getRoleId())))
				&& ((this.getMenuId() == castOther.getMenuId()) || (this
						.getMenuId() != null && castOther.getMenuId() != null && this
						.getMenuId().equals(castOther.getMenuId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getRoleId() == null ? 0 : this.getRoleId().hashCode());
		result = 37 * result
				+ (getMenuId() == null ? 0 : this.getMenuId().hashCode());
		return result;
	}

}