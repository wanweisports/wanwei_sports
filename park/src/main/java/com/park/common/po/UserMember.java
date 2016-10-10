package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * UserMember entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user_member", catalog = "park")
public class UserMember implements java.io.Serializable {

	// Fields

	private Integer memberId;
	private String operationId;
	private String memberName;
	private String memberType;
	private String memberMobile;
	private String memberMobile2;
	private String memberSex;
	private String memberIdcard;
	private String memberBirthday;
	private String memberPayPassword;
	private String memberStatus;
	private String memberAddress;
	private String memberRemark;
	private String createTime;
	private String updateTime;
	private Integer salesId;
	private String tempCardNo;

	// Constructors

	/** default constructor */
	public UserMember() {
	}

	/** full constructor */
	public UserMember(String operationId, String memberName, String memberType,
			String memberMobile, String memberMobile2, String memberSex,
			String memberIdcard, String memberBirthday,
			String memberPayPassword, String memberStatus,
			String memberAddress, String memberRemark, String createTime,
			String updateTime, Integer salesId, String tempCardNo) {
		this.operationId = operationId;
		this.memberName = memberName;
		this.memberType = memberType;
		this.memberMobile = memberMobile;
		this.memberMobile2 = memberMobile2;
		this.memberSex = memberSex;
		this.memberIdcard = memberIdcard;
		this.memberBirthday = memberBirthday;
		this.memberPayPassword = memberPayPassword;
		this.memberStatus = memberStatus;
		this.memberAddress = memberAddress;
		this.memberRemark = memberRemark;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
		this.tempCardNo = tempCardNo;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "memberId", unique = true, nullable = false)
	public Integer getMemberId() {
		return this.memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name = "operationId", length = 32)
	public String getOperationId() {
		return this.operationId;
	}

	public void setOperationId(String operationId) {
		this.operationId = operationId;
	}

	@Column(name = "memberName", length = 16)
	public String getMemberName() {
		return this.memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Column(name = "memberType", length = 1)
	public String getMemberType() {
		return this.memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	@Column(name = "memberMobile", length = 16)
	public String getMemberMobile() {
		return this.memberMobile;
	}

	public void setMemberMobile(String memberMobile) {
		this.memberMobile = memberMobile;
	}

	@Column(name = "memberMobile2", length = 16)
	public String getMemberMobile2() {
		return this.memberMobile2;
	}

	public void setMemberMobile2(String memberMobile2) {
		this.memberMobile2 = memberMobile2;
	}

	@Column(name = "memberSex", length = 1)
	public String getMemberSex() {
		return this.memberSex;
	}

	public void setMemberSex(String memberSex) {
		this.memberSex = memberSex;
	}

	@Column(name = "memberIdcard", length = 22)
	public String getMemberIdcard() {
		return this.memberIdcard;
	}

	public void setMemberIdcard(String memberIdcard) {
		this.memberIdcard = memberIdcard;
	}

	@Column(name = "memberBirthday", length = 11)
	public String getMemberBirthday() {
		return this.memberBirthday;
	}

	public void setMemberBirthday(String memberBirthday) {
		this.memberBirthday = memberBirthday;
	}

	@Column(name = "memberPayPassword", length = 32)
	public String getMemberPayPassword() {
		return this.memberPayPassword;
	}

	public void setMemberPayPassword(String memberPayPassword) {
		this.memberPayPassword = memberPayPassword;
	}

	@Column(name = "memberStatus", length = 1)
	public String getMemberStatus() {
		return this.memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	@Column(name = "memberAddress")
	public String getMemberAddress() {
		return this.memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	@Column(name = "memberRemark")
	public String getMemberRemark() {
		return this.memberRemark;
	}

	public void setMemberRemark(String memberRemark) {
		this.memberRemark = memberRemark;
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

	@Column(name = "tempCardNo", length = 32)
	public String getTempCardNo() {
		return this.tempCardNo;
	}

	public void setTempCardNo(String tempCardNo) {
		this.tempCardNo = tempCardNo;
	}

}