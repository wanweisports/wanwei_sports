package com.park.common.po;

import javax.persistence.*;

/**
 * SystemRoleFunction entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "system_role_function", catalog = "park")
public class SystemRoleFunction implements java.io.Serializable {

	// Fields

	private SystemRoleFunctionId id;

	// Constructors

	/** default constructor */
	public SystemRoleFunction() {
	}

	/** full constructor */
	public SystemRoleFunction(SystemRoleFunctionId id) {
		this.id = id;
	}

	// Property accessors
	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "roleId", column = @Column(name = "roleId", nullable = false)),
			@AttributeOverride(name = "functionId", column = @Column(name = "functionId", nullable = false, length = 16)) })
	public SystemRoleFunctionId getId() {
		return this.id;
	}

	public void setId(SystemRoleFunctionId id) {
		this.id = id;
	}

}