package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * GoodInventoryLog entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "good_inventory_log", catalog = "park")
public class GoodInventoryLog implements java.io.Serializable {

	// Fields

	private Integer inventoryId;
	private Integer goodId;
	private Integer countChange;
	private String opType;
	private String remark;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public GoodInventoryLog() {
	}

	/** full constructor */
	public GoodInventoryLog(Integer goodId, Integer countChange, String opType,
			String remark, String createTime, String updateTime, Integer salesId) {
		this.goodId = goodId;
		this.countChange = countChange;
		this.opType = opType;
		this.remark = remark;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "inventoryId", unique = true, nullable = false)
	public Integer getInventoryId() {
		return this.inventoryId;
	}

	public void setInventoryId(Integer inventoryId) {
		this.inventoryId = inventoryId;
	}

	@Column(name = "goodId")
	public Integer getGoodId() {
		return this.goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	@Column(name = "countChange")
	public Integer getCountChange() {
		return this.countChange;
	}

	public void setCountChange(Integer countChange) {
		this.countChange = countChange;
	}

	@Column(name = "opType", length = 1)
	public String getOpType() {
		return this.opType;
	}

	public void setOpType(String opType) {
		this.opType = opType;
	}

	@Column(name = "remark")
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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