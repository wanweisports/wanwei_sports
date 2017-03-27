package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * SystemDict entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "system_dict", catalog = "park")
public class SystemDict implements java.io.Serializable {

	// Fields

	private Integer dictId;
	private Integer parentDictId;
	private String dictName;
	private String dictKey;
	private String dictValue;
	private String dictAdditional;

	// Constructors

	/** default constructor */
	public SystemDict() {
	}

	/** minimal constructor */
	public SystemDict(String dictName, String dictKey, String dictValue) {
		this.dictName = dictName;
		this.dictKey = dictKey;
		this.dictValue = dictValue;
	}

	/** full constructor */
	public SystemDict(Integer parentDictId, String dictName, String dictKey,
			String dictValue, String dictAdditional) {
		this.parentDictId = parentDictId;
		this.dictName = dictName;
		this.dictKey = dictKey;
		this.dictValue = dictValue;
		this.dictAdditional = dictAdditional;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "dictId", unique = true, nullable = false)
	public Integer getDictId() {
		return this.dictId;
	}

	public void setDictId(Integer dictId) {
		this.dictId = dictId;
	}

	@Column(name = "parentDictId")
	public Integer getParentDictId() {
		return this.parentDictId;
	}

	public void setParentDictId(Integer parentDictId) {
		this.parentDictId = parentDictId;
	}

	@Column(name = "dictName", nullable = false, length = 32)
	public String getDictName() {
		return this.dictName;
	}

	public void setDictName(String dictName) {
		this.dictName = dictName;
	}

	@Column(name = "dictKey", nullable = false, length = 16)
	public String getDictKey() {
		return this.dictKey;
	}

	public void setDictKey(String dictKey) {
		this.dictKey = dictKey;
	}

	@Column(name = "dictValue", nullable = false, length = 32)
	public String getDictValue() {
		return this.dictValue;
	}

	public void setDictValue(String dictValue) {
		this.dictValue = dictValue;
	}

	@Column(name = "dictAdditional", length = 65535)
	public String getDictAdditional() {
		return this.dictAdditional;
	}

	public void setDictAdditional(String dictAdditional) {
		this.dictAdditional = dictAdditional;
	}

}