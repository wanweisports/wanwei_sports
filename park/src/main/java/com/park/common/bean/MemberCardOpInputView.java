package com.park.common.bean;

public class MemberCardOpInputView extends BaseInputView {
	
	private String cardId;
	
	private String cardTypeId;
	
	private String buBanMoney;
	
	private String czMoney;
	
	private String givingAmount;
	
	private String upLevelMoney;
	
	private String subMoney;
	
	private String balanceStyle;
	
	private String remark;
	
	private Integer salesId;

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getCardTypeId() {
		return cardTypeId;
	}

	public void setCardTypeId(String cardTypeId) {
		this.cardTypeId = cardTypeId;
	}
	
	public String getBuBanMoney() {
		return buBanMoney;
	}

	public void setBuBanMoney(String buBanMoney) {
		this.buBanMoney = buBanMoney;
	}

	public String getCzMoney() {
		return czMoney;
	}

	public void setCzMoney(String czMoney) {
		this.czMoney = czMoney;
	}

	public String getUpLevelMoney() {
		return upLevelMoney;
	}

	public void setUpLevelMoney(String upLevelMoney) {
		this.upLevelMoney = upLevelMoney;
	}

	public String getSubMoney() {
		return subMoney;
	}

	public void setSubMoney(String subMoney) {
		this.subMoney = subMoney;
	}

	public String getBalanceStyle() {
		return balanceStyle;
	}

	public void setBalanceStyle(String balanceStyle) {
		this.balanceStyle = balanceStyle;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getSalesId() {
		return salesId;
	}

	public void setSalesId(Integer salesId) {
		this.salesId = salesId;
	}

	public String getGivingAmount() {
		return givingAmount;
	}

	public void setGivingAmount(String givingAmount) {
		this.givingAmount = givingAmount;
	}
	
}
