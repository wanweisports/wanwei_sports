package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * SiteMealInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "site_meal_info", catalog = "park")
public class SiteMealInfo implements java.io.Serializable {

	// Fields

	private Integer mealId;
	private String mealType;
	private Integer mealCount;
	private String mealDate;
	private Integer orderId;
	private Integer memberId;
	private String mealOpName;
	private String mealOpMobile;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public SiteMealInfo() {
	}

	/** full constructor */
	public SiteMealInfo(String mealType, Integer mealCount, String mealDate,
			Integer orderId, Integer memberId, String mealOpName,
			String mealOpMobile, String createTime, String updateTime,
			Integer salesId) {
		this.mealType = mealType;
		this.mealCount = mealCount;
		this.mealDate = mealDate;
		this.orderId = orderId;
		this.memberId = memberId;
		this.mealOpName = mealOpName;
		this.mealOpMobile = mealOpMobile;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "mealId", unique = true, nullable = false)
	public Integer getMealId() {
		return this.mealId;
	}

	public void setMealId(Integer mealId) {
		this.mealId = mealId;
	}

	@Column(name = "mealType", length = 32)
	public String getMealType() {
		return this.mealType;
	}

	public void setMealType(String mealType) {
		this.mealType = mealType;
	}

	@Column(name = "mealCount")
	public Integer getMealCount() {
		return this.mealCount;
	}

	public void setMealCount(Integer mealCount) {
		this.mealCount = mealCount;
	}

	@Column(name = "mealDate", length = 20)
	public String getMealDate() {
		return this.mealDate;
	}

	public void setMealDate(String mealDate) {
		this.mealDate = mealDate;
	}

	@Column(name = "orderId")
	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	@Column(name = "memberId")
	public Integer getMemberId() {
		return this.memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name = "mealOpName", length = 32)
	public String getMealOpName() {
		return this.mealOpName;
	}

	public void setMealOpName(String mealOpName) {
		this.mealOpName = mealOpName;
	}

	@Column(name = "mealOpMobile", length = 16)
	public String getMealOpMobile() {
		return this.mealOpMobile;
	}

	public void setMealOpMobile(String mealOpMobile) {
		this.mealOpMobile = mealOpMobile;
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