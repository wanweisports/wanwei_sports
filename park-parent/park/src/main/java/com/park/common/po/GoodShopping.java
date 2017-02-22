package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * GoodShopping entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "good_shopping", catalog = "park")
public class GoodShopping implements java.io.Serializable {

	// Fields

	private Integer shoppingId;
	private Integer goodId;
	private String shoppingName;
	private Integer shoppingGoodAmount;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public GoodShopping() {
	}

	/** full constructor */
	public GoodShopping(Integer goodId, String shoppingName,
			Integer shoppingGoodAmount, String createTime, String updateTime,
			Integer salesId) {
		this.goodId = goodId;
		this.shoppingName = shoppingName;
		this.shoppingGoodAmount = shoppingGoodAmount;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "shoppingId", unique = true, nullable = false)
	public Integer getShoppingId() {
		return this.shoppingId;
	}

	public void setShoppingId(Integer shoppingId) {
		this.shoppingId = shoppingId;
	}

	@Column(name = "goodId")
	public Integer getGoodId() {
		return this.goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	@Column(name = "shoppingName", length = 32)
	public String getShoppingName() {
		return this.shoppingName;
	}

	public void setShoppingName(String shoppingName) {
		this.shoppingName = shoppingName;
	}

	@Column(name = "shoppingGoodAmount")
	public Integer getShoppingGoodAmount() {
		return this.shoppingGoodAmount;
	}

	public void setShoppingGoodAmount(Integer shoppingGoodAmount) {
		this.shoppingGoodAmount = shoppingGoodAmount;
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