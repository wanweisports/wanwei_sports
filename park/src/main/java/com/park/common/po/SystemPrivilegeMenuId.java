package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * SystemPrivilegeMenuId entity. @author MyEclipse Persistence Tools
 */
@Embeddable
public class SystemPrivilegeMenuId implements java.io.Serializable {

	// Fields

	private Integer privilegeId;
	private String menuId;

	// Constructors

	/** default constructor */
	public SystemPrivilegeMenuId() {
	}

	/** full constructor */
	public SystemPrivilegeMenuId(Integer privilegeId, String menuId) {
		this.privilegeId = privilegeId;
		this.menuId = menuId;
	}

	// Property accessors

	@Column(name = "privilegeId", nullable = false)
	public Integer getPrivilegeId() {
		return this.privilegeId;
	}

	public void setPrivilegeId(Integer privilegeId) {
		this.privilegeId = privilegeId;
	}

	@Column(name = "menuId", nullable = false, length = 16)
	public String getMenuId() {
		return this.menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof SystemPrivilegeMenuId))
			return false;
		SystemPrivilegeMenuId castOther = (SystemPrivilegeMenuId) other;

		return ((this.getPrivilegeId() == castOther.getPrivilegeId()) || (this
				.getPrivilegeId() != null && castOther.getPrivilegeId() != null && this
				.getPrivilegeId().equals(castOther.getPrivilegeId())))
				&& ((this.getMenuId() == castOther.getMenuId()) || (this
						.getMenuId() != null && castOther.getMenuId() != null && this
						.getMenuId().equals(castOther.getMenuId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getPrivilegeId() == null ? 0 : this.getPrivilegeId()
						.hashCode());
		result = 37 * result
				+ (getMenuId() == null ? 0 : this.getMenuId().hashCode());
		return result;
	}

}