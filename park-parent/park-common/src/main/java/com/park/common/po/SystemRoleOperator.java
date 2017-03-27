package com.park.common.po;

import javax.persistence.*;

/**
 * SystemRoleOperator entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "system_role_operator", catalog = "park")
public class SystemRoleOperator implements java.io.Serializable {

	// Fields

	private SystemRoleOperatorId id;

	// Constructors

	/** default constructor */
	public SystemRoleOperator() {
	}

	/** full constructor */
	public SystemRoleOperator(SystemRoleOperatorId id) {
		this.id = id;
	}

	// Property accessors
	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "roleId", column = @Column(name = "roleId", nullable = false)),
			@AttributeOverride(name = "operatorId", column = @Column(name = "operatorId", nullable = false, length = 64)) })
	public SystemRoleOperatorId getId() {
		return this.id;
	}

	public void setId(SystemRoleOperatorId id) {
		this.id = id;
	}

}