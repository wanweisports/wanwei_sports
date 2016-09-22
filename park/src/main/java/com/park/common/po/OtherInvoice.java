package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * OtherInvoice entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "other_invoice", catalog = "park")
public class OtherInvoice implements java.io.Serializable {

	// Fields

	private Integer invoiceId;
	private String invoiceServiceType;
	private Integer invoiceServiceId;
	private String invoiceHeader;
	private String invoiceContent;
	private Double invoiceMoney;
	private String invoiceRemark;
	private String invoiceState;
	private String createTime;
	private String printTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public OtherInvoice() {
	}

	/** full constructor */
	public OtherInvoice(String invoiceServiceType, Integer invoiceServiceId,
			String invoiceHeader, String invoiceContent, Double invoiceMoney,
			String invoiceRemark, String invoiceState, String createTime,
			String printTime, Integer salesId) {
		this.invoiceServiceType = invoiceServiceType;
		this.invoiceServiceId = invoiceServiceId;
		this.invoiceHeader = invoiceHeader;
		this.invoiceContent = invoiceContent;
		this.invoiceMoney = invoiceMoney;
		this.invoiceRemark = invoiceRemark;
		this.invoiceState = invoiceState;
		this.createTime = createTime;
		this.printTime = printTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "invoiceId", unique = true, nullable = false)
	public Integer getInvoiceId() {
		return this.invoiceId;
	}

	public void setInvoiceId(Integer invoiceId) {
		this.invoiceId = invoiceId;
	}

	@Column(name = "invoiceServiceType", length = 16)
	public String getInvoiceServiceType() {
		return this.invoiceServiceType;
	}

	public void setInvoiceServiceType(String invoiceServiceType) {
		this.invoiceServiceType = invoiceServiceType;
	}

	@Column(name = "invoiceServiceId")
	public Integer getInvoiceServiceId() {
		return this.invoiceServiceId;
	}

	public void setInvoiceServiceId(Integer invoiceServiceId) {
		this.invoiceServiceId = invoiceServiceId;
	}

	@Column(name = "invoiceHeader", length = 100)
	public String getInvoiceHeader() {
		return this.invoiceHeader;
	}

	public void setInvoiceHeader(String invoiceHeader) {
		this.invoiceHeader = invoiceHeader;
	}

	@Column(name = "invoiceContent", length = 65535)
	public String getInvoiceContent() {
		return this.invoiceContent;
	}

	public void setInvoiceContent(String invoiceContent) {
		this.invoiceContent = invoiceContent;
	}

	@Column(name = "invoiceMoney", precision = 10)
	public Double getInvoiceMoney() {
		return this.invoiceMoney;
	}

	public void setInvoiceMoney(Double invoiceMoney) {
		this.invoiceMoney = invoiceMoney;
	}

	@Column(name = "invoiceRemark")
	public String getInvoiceRemark() {
		return this.invoiceRemark;
	}

	public void setInvoiceRemark(String invoiceRemark) {
		this.invoiceRemark = invoiceRemark;
	}

	@Column(name = "invoiceState", length = 1)
	public String getInvoiceState() {
		return this.invoiceState;
	}

	public void setInvoiceState(String invoiceState) {
		this.invoiceState = invoiceState;
	}

	@Column(name = "createTime", length = 20)
	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Column(name = "printTime", length = 20)
	public String getPrintTime() {
		return this.printTime;
	}

	public void setPrintTime(String printTime) {
		this.printTime = printTime;
	}

	@Column(name = "salesId")
	public Integer getSalesId() {
		return this.salesId;
	}

	public void setSalesId(Integer salesId) {
		this.salesId = salesId;
	}

}