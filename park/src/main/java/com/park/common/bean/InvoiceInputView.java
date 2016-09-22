package com.park.common.bean;

public class InvoiceInputView extends BaseInputView {

	private String status;
	
	private String invoiceIds;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getInvoiceIds() {
		return invoiceIds;
	}

	public void setInvoiceIds(String invoiceIds) {
		this.invoiceIds = invoiceIds;
	}
	
}
