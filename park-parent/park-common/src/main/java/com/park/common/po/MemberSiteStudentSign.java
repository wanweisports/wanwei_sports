package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * MemberSiteStudentSign entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "member_site_student_sign", catalog = "park")
public class MemberSiteStudentSign implements java.io.Serializable {

	// Fields

	private Integer signId;
	private Integer studentId;
	private String signStudentCardNo;
	private String signName;
	private String signMobile;
	private Integer sportId;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public MemberSiteStudentSign() {
	}

	/** full constructor */
	public MemberSiteStudentSign(Integer studentId, String signStudentCardNo,
			String signName, String signMobile, Integer sportId,
			String createTime, String updateTime, Integer salesId) {
		this.studentId = studentId;
		this.signStudentCardNo = signStudentCardNo;
		this.signName = signName;
		this.signMobile = signMobile;
		this.sportId = sportId;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "signId", unique = true, nullable = false)
	public Integer getSignId() {
		return this.signId;
	}

	public void setSignId(Integer signId) {
		this.signId = signId;
	}

	@Column(name = "studentId")
	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	@Column(name = "signStudentCardNo", length = 32)
	public String getSignStudentCardNo() {
		return this.signStudentCardNo;
	}

	public void setSignStudentCardNo(String signStudentCardNo) {
		this.signStudentCardNo = signStudentCardNo;
	}

	@Column(name = "signName", length = 32)
	public String getSignName() {
		return this.signName;
	}

	public void setSignName(String signName) {
		this.signName = signName;
	}

	@Column(name = "signMobile", length = 16)
	public String getSignMobile() {
		return this.signMobile;
	}

	public void setSignMobile(String signMobile) {
		this.signMobile = signMobile;
	}

	@Column(name = "sportId")
	public Integer getSportId() {
		return this.sportId;
	}

	public void setSportId(Integer sportId) {
		this.sportId = sportId;
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