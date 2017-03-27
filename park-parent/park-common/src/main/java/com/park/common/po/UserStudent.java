package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * UserStudent entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user_student", catalog = "park")
public class UserStudent implements java.io.Serializable {

	// Fields

	private Integer studentId;
	private Integer cardId;
	private String studentName;
	private String studentGrade;
	private String studentClass;
	private String studentMobile;
	private Integer siteCount;
	private String studentSex;
	private String studentStatus;
	private String studentAddress;
	private String studentRemark;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public UserStudent() {
	}

	/** full constructor */
	public UserStudent(Integer cardId, String studentName, String studentGrade,
			String studentClass, String studentMobile, Integer siteCount,
			String studentSex, String studentStatus, String studentAddress,
			String studentRemark, String createTime, String updateTime,
			Integer salesId) {
		this.cardId = cardId;
		this.studentName = studentName;
		this.studentGrade = studentGrade;
		this.studentClass = studentClass;
		this.studentMobile = studentMobile;
		this.siteCount = siteCount;
		this.studentSex = studentSex;
		this.studentStatus = studentStatus;
		this.studentAddress = studentAddress;
		this.studentRemark = studentRemark;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "studentId", unique = true, nullable = false)
	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	@Column(name = "cardId")
	public Integer getCardId() {
		return this.cardId;
	}

	public void setCardId(Integer cardId) {
		this.cardId = cardId;
	}

	@Column(name = "studentName", length = 32)
	public String getStudentName() {
		return this.studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	@Column(name = "studentGrade", length = 32)
	public String getStudentGrade() {
		return this.studentGrade;
	}

	public void setStudentGrade(String studentGrade) {
		this.studentGrade = studentGrade;
	}

	@Column(name = "studentClass", length = 32)
	public String getStudentClass() {
		return this.studentClass;
	}

	public void setStudentClass(String studentClass) {
		this.studentClass = studentClass;
	}

	@Column(name = "studentMobile", length = 16)
	public String getStudentMobile() {
		return this.studentMobile;
	}

	public void setStudentMobile(String studentMobile) {
		this.studentMobile = studentMobile;
	}

	@Column(name = "siteCount")
	public Integer getSiteCount() {
		return this.siteCount;
	}

	public void setSiteCount(Integer siteCount) {
		this.siteCount = siteCount;
	}

	@Column(name = "studentSex", length = 1)
	public String getStudentSex() {
		return this.studentSex;
	}

	public void setStudentSex(String studentSex) {
		this.studentSex = studentSex;
	}

	@Column(name = "studentStatus", length = 1)
	public String getStudentStatus() {
		return this.studentStatus;
	}

	public void setStudentStatus(String studentStatus) {
		this.studentStatus = studentStatus;
	}

	@Column(name = "studentAddress")
	public String getStudentAddress() {
		return this.studentAddress;
	}

	public void setStudentAddress(String studentAddress) {
		this.studentAddress = studentAddress;
	}

	@Column(name = "studentRemark")
	public String getStudentRemark() {
		return this.studentRemark;
	}

	public void setStudentRemark(String studentRemark) {
		this.studentRemark = studentRemark;
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