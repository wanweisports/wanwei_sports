package com.park.common.bean;


public class BalanceInputView extends BaseInputView {
	
	private String balanceType;
	
	private String createTimeStart;
	
	private String createTimeEnd;
	
	private String memberMobile;
	
	private String cardId;
	
	private String balanceServiceType;

	public String getBalanceType() {
		return balanceType;
	}

	public void setBalanceType(String balanceType) {
		this.balanceType = balanceType;
	}

	public String getCreateTimeStart() {
		return createTimeStart;
	}

	public void setCreateTimeStart(String createTimeStart) {
		this.createTimeStart = createTimeStart;
	}

	public String getCreateTimeEnd() {
		return createTimeEnd;
	}

	public void setCreateTimeEnd(String createTimeEnd) {
		this.createTimeEnd = createTimeEnd;
	}

	public String getMemberMobile() {
		return memberMobile;
	}

	public void setMemberMobile(String memberMobile) {
		this.memberMobile = memberMobile;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getBalanceServiceType() {
		return balanceServiceType;
	}

	public void setBalanceServiceType(String balanceServiceType) {
		this.balanceServiceType = balanceServiceType;
	}

}
