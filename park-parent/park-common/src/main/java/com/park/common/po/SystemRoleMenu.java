package com.park.common.po;


import javax.persistence.*;

/**
 * SystemRoleMenu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "system_role_menu", catalog = "park")
public class SystemRoleMenu implements java.io.Serializable {

	// Fields

	private com.park.common.po.SystemRoleMenuId id;

	// Constructors

	/** default constructor */
	public SystemRoleMenu() {
	}

	/** full constructor */
	public SystemRoleMenu(com.park.common.po.SystemRoleMenuId id) {
		this.id = id;
	}

	// Property accessors
	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "roleId", column = @Column(name = "roleId", nullable = false)),
			@AttributeOverride(name = "menuId", column = @Column(name = "menuId", nullable = false)) })
	public com.park.common.po.SystemRoleMenuId getId() {
		return this.id;
	}

	public void setId(com.park.common.po.SystemRoleMenuId id) {
		this.id = id;
	}

}