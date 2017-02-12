package com.park.common.bean;

public class DataInputView extends BaseInputView {
	
	private Integer countNum;
	private String createTimeStart;
	private String createTimeEnd;
	private Integer balanceServiceType;
	private Integer balanceServiceTypeMin;
	private Integer balanceServiceTypeMax;
	private String balanceStyle1;
	private String balanceStyle2;
	private String balanceStyle3;
	private String dictName;
	private String memberName;
	private String sportId;
	private Integer[] balanceServiceTypeArr; 

	public Integer getCountNum() {
		return countNum;
	}

	public void setCountNum(Integer countNum) {
		this.countNum = countNum;
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
	
	public Integer getBalanceServiceType() {
		return balanceServiceType;
	}

	public void setBalanceServiceType(Integer balanceServiceType) {
		this.balanceServiceType = balanceServiceType;
	}

	public Integer getBalanceServiceTypeMin() {
		return balanceServiceTypeMin;
	}

	public void setBalanceServiceTypeMin(Integer balanceServiceTypeMin) {
		this.balanceServiceTypeMin = balanceServiceTypeMin;
	}

	public Integer getBalanceServiceTypeMax() {
		return balanceServiceTypeMax;
	}

	public void setBalanceServiceTypeMax(Integer balanceServiceTypeMax) {
		this.balanceServiceTypeMax = balanceServiceTypeMax;
	}

	public String getBalanceStyle1() {
		return balanceStyle1;
	}

	public void setBalanceStyle1(String balanceStyle1) {
		this.balanceStyle1 = balanceStyle1;
	}

	public String getBalanceStyle2() {
		return balanceStyle2;
	}

	public void setBalanceStyle2(String balanceStyle2) {
		this.balanceStyle2 = balanceStyle2;
	}

	public String getBalanceStyle3() {
		return balanceStyle3;
	}

	public void setBalanceStyle3(String balanceStyle3) {
		this.balanceStyle3 = balanceStyle3;
	}

	public String getDictName() {
		return dictName;
	}

	public void setDictName(String dictName) {
		this.dictName = dictName;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getSportId() {
		return sportId;
	}

	public void setSportId(String sportId) {
		this.sportId = sportId;
	}

	public Integer[] getBalanceServiceTypeArr() {
		return balanceServiceTypeArr;
	}

	public void setBalanceServiceTypeArr(Integer[] balanceServiceTypeArr) {
		this.balanceServiceTypeArr = balanceServiceTypeArr;
	}
	
}
