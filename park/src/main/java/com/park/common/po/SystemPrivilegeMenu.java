package com.park.common.po;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * SystemPrivilegeMenu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "system_privilege_menu", catalog = "park")
public class SystemPrivilegeMenu implements java.io.Serializable {

	// Fields

	private SystemPrivilegeMenuId id;

	// Constructors

	/** default constructor */
	public SystemPrivilegeMenu() {
	}

	/** full constructor */
	public SystemPrivilegeMenu(SystemPrivilegeMenuId id) {
		this.id = id;
	}

	// Property accessors
	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "privilegeId", column = @Column(name = "privilegeId", nullable = false)),
			@AttributeOverride(name = "menuId", column = @Column(name = "menuId", nullable = false, length = 16)) })
	public SystemPrivilegeMenuId getId() {
		return this.id;
	}

	public void setId(SystemPrivilegeMenuId id) {
		this.id = id;
	}

}