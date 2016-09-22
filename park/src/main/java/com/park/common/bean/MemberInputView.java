package com.park.common.bean;

public class MemberInputView extends BaseInputView {
	
	private String memberMobile;
	
	private String memberIdcard;
	
	private String cardNo;
	
	private String cardTypeId;

	public String getMemberMobile() {
		return memberMobile;
	}

	public void setMemberMobile(String memberMobile) {
		this.memberMobile = memberMobile;
	}

	public String getMemberIdcard() {
		return memberIdcard;
	}

	public void setMemberIdcard(String memberIdcard) {
		this.memberIdcard = memberIdcard;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getCardTypeId() {
		return cardTypeId;
	}

	public void setCardTypeId(String cardTypeId) {
		this.cardTypeId = cardTypeId;
	}

}
