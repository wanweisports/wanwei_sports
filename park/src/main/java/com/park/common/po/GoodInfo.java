package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * GoodInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "good_info", catalog = "park")
public class GoodInfo implements java.io.Serializable {

	// Fields

	private Integer goodId;
	private String goodNo;
	private String goodName;
	private String goodPic;
	private Integer goodTypeId;
	private String goodMoneyType;
	private Double goodPrice;
	private String goodDiscount;
	private String goodStatus;
	private Integer goodCount;
	private String goodRemark;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public GoodInfo() {
	}

	/** minimal constructor */
	public GoodInfo(String goodNo, Double goodPrice) {
		this.goodNo = goodNo;
		this.goodPrice = goodPrice;
	}

	/** full constructor */
	public GoodInfo(String goodNo, String goodName, String goodPic,
			Integer goodTypeId, String goodMoneyType, Double goodPrice,
			String goodDiscount, String goodStatus, Integer goodCount,
			String goodRemark, String createTime, String updateTime,
			Integer salesId) {
		this.goodNo = goodNo;
		this.goodName = goodName;
		this.goodPic = goodPic;
		this.goodTypeId = goodTypeId;
		this.goodMoneyType = goodMoneyType;
		this.goodPrice = goodPrice;
		this.goodDiscount = goodDiscount;
		this.goodStatus = goodStatus;
		this.goodCount = goodCount;
		this.goodRemark = goodRemark;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "goodId", unique = true, nullable = false)
	public Integer getGoodId() {
		return this.goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	@Column(name = "goodNo", nullable = false, length = 32)
	public String getGoodNo() {
		return this.goodNo;
	}

	public void setGoodNo(String goodNo) {
		this.goodNo = goodNo;
	}

	@Column(name = "goodName", length = 100)
	public String getGoodName() {
		return this.goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	@Column(name = "goodPic")
	public String getGoodPic() {
		return this.goodPic;
	}

	public void setGoodPic(String goodPic) {
		this.goodPic = goodPic;
	}

	@Column(name = "goodTypeId")
	public Integer getGoodTypeId() {
		return this.goodTypeId;
	}

	public void setGoodTypeId(Integer goodTypeId) {
		this.goodTypeId = goodTypeId;
	}

	@Column(name = "goodMoneyType", length = 1)
	public String getGoodMoneyType() {
		return this.goodMoneyType;
	}

	public void setGoodMoneyType(String goodMoneyType) {
		this.goodMoneyType = goodMoneyType;
	}

	@Column(name = "goodPrice", nullable = false, precision = 10)
	public Double getGoodPrice() {
		return this.goodPrice;
	}

	public void setGoodPrice(Double goodPrice) {
		this.goodPrice = goodPrice;
	}

	@Column(name = "goodDiscount", length = 16)
	public String getGoodDiscount() {
		return this.goodDiscount;
	}

	public void setGoodDiscount(String goodDiscount) {
		this.goodDiscount = goodDiscount;
	}

	@Column(name = "goodStatus", length = 1)
	public String getGoodStatus() {
		return this.goodStatus;
	}

	public void setGoodStatus(String goodStatus) {
		this.goodStatus = goodStatus;
	}

	@Column(name = "goodCount")
	public Integer getGoodCount() {
		return this.goodCount;
	}

	public void setGoodCount(Integer goodCount) {
		this.goodCount = goodCount;
	}

	@Column(name = "goodRemark")
	public String getGoodRemark() {
		return this.goodRemark;
	}

	public void setGoodRemark(String goodRemark) {
		this.goodRemark = goodRemark;
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