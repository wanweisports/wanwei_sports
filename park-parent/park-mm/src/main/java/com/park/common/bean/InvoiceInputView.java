package com.park.common.bean;

public class InvoiceInputView extends BaseInputView {

	private String status;
	
	private String invoiceIds;
	
	private String invoiceHeader;

	private String invoiceOpenState;

    private String invoiceState;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

    public String getInvoiceOpenState() {
        return invoiceOpenState;
    }

    public void setInvoiceOpenState(String invoiceOpenState) {
        this.invoiceOpenState = invoiceOpenState;
    }

    public String getInvoiceState() {
        return invoiceState;
    }

    public void setInvoiceState(String invoiceState) {
        this.invoiceState = invoiceState;
    }

	public String getInvoiceIds() {
		return invoiceIds;
	}

	public void setInvoiceIds(String invoiceIds) {
		this.invoiceIds = invoiceIds;
	}

	public String getInvoiceHeader() {
		return invoiceHeader;
	}

	public void setInvoiceHeader(String invoiceHeader) {
		this.invoiceHeader = invoiceHeader;
	}
	
}
