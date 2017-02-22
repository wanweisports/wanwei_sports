package com.park.common.po;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * SystemRoleMenu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "system_role_menu", catalog = "park")
public class SystemRoleMenu implements java.io.Serializable {

	// Fields

	private SystemRoleMenuId id;

	// Constructors

	/** default constructor */
	public SystemRoleMenu() {
	}

	/** full constructor */
	public SystemRoleMenu(SystemRoleMenuId id) {
		this.id = id;
	}

	// Property accessors
	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "roleId", column = @Column(name = "roleId", nullable = false)),
			@AttributeOverride(name = "menuId", column = @Column(name = "menuId", nullable = false)) })
	public SystemRoleMenuId getId() {
		return this.id;
	}

	public void setId(SystemRoleMenuId id) {
		this.id = id;
	}

}