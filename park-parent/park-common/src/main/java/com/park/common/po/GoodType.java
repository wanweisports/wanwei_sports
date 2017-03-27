package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * GoodType entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "good_type", catalog = "park")
public class GoodType implements java.io.Serializable {

	// Fields

	private Integer goodTypeId;
	private String goodTypeName;
	private String goodTypeDescribe;
	private String goodTypeStatus;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public GoodType() {
	}

	/** full constructor */
	public GoodType(String goodTypeName, String goodTypeDescribe,
			String goodTypeStatus, String createTime, String updateTime,
			Integer salesId) {
		this.goodTypeName = goodTypeName;
		this.goodTypeDescribe = goodTypeDescribe;
		this.goodTypeStatus = goodTypeStatus;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "goodTypeId", unique = true, nullable = false)
	public Integer getGoodTypeId() {
		return this.goodTypeId;
	}

	public void setGoodTypeId(Integer goodTypeId) {
		this.goodTypeId = goodTypeId;
	}

	@Column(name = "goodTypeName", length = 32)
	public String getGoodTypeName() {
		return this.goodTypeName;
	}

	public void setGoodTypeName(String goodTypeName) {
		this.goodTypeName = goodTypeName;
	}

	@Column(name = "goodTypeDescribe")
	public String getGoodTypeDescribe() {
		return this.goodTypeDescribe;
	}

	public void setGoodTypeDescribe(String goodTypeDescribe) {
		this.goodTypeDescribe = goodTypeDescribe;
	}

	@Column(name = "goodTypeStatus", length = 1)
	public String getGoodTypeStatus() {
		return this.goodTypeStatus;
	}

	public void setGoodTypeStatus(String goodTypeStatus) {
		this.goodTypeStatus = goodTypeStatus;
	}

	@Column(name = "createTime", length = 20)
	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Column(name = "updateTime", length = 20)
	public String getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "salesId")
	public Integer getSalesId() {
		return this.salesId;
	}

	public void setSalesId(Integer salesId) {
		this.salesId = salesId;
	}

}