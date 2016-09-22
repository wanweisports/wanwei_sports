package com.park.common.po;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * SystemRolePrivilege entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "system_role_privilege", catalog = "park")
public class SystemRolePrivilege implements java.io.Serializable {

	// Fields

	private SystemRolePrivilegeId id;

	// Constructors

	/** default constructor */
	public SystemRolePrivilege() {
	}

	/** full constructor */
	public SystemRolePrivilege(SystemRolePrivilegeId id) {
		this.id = id;
	}

	// Property accessors
	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "roleId", column = @Column(name = "roleId", nullable = false)),
			@AttributeOverride(name = "privilegeId", column = @Column(name = "privilegeId", nullable = false)) })
	public SystemRolePrivilegeId getId() {
		return this.id;
	}

	public void setId(SystemRolePrivilegeId id) {
		this.id = id;
	}

}