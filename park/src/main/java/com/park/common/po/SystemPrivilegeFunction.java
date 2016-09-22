package com.park.common.po;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * SystemPrivilegeFunction entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "system_privilege_function", catalog = "park")
public class SystemPrivilegeFunction implements java.io.Serializable {

	// Fields

	private SystemPrivilegeFunctionId id;

	// Constructors

	/** default constructor */
	public SystemPrivilegeFunction() {
	}

	/** full constructor */
	public SystemPrivilegeFunction(SystemPrivilegeFunctionId id) {
		this.id = id;
	}

	// Property accessors
	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "privilegeId", column = @Column(name = "privilegeId", nullable = false)),
			@AttributeOverride(name = "functionId", column = @Column(name = "functionId", nullable = false, length = 16)) })
	public SystemPrivilegeFunctionId getId() {
		return this.id;
	}

	public void setId(SystemPrivilegeFunctionId id) {
		this.id = id;
	}

}