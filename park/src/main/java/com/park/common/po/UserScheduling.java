package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * UserScheduling entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user_scheduling", catalog = "park")
public class UserScheduling implements java.io.Serializable {

	// Fields

	private Integer schedulingId;
	private String operatorId;
	private String date;
	private String startTime;
	private String endTime;
	private String schedulingJob;
	private String createTime;
	private String updateTime;
	private Integer salesId;

	// Constructors

	/** default constructor */
	public UserScheduling() {
	}

	/** full constructor */
	public UserScheduling(String operatorId, String date, String startTime,
			String endTime, String schedulingJob, String createTime,
			String updateTime, Integer salesId) {
		this.operatorId = operatorId;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.schedulingJob = schedulingJob;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.salesId = salesId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "schedulingId", unique = true, nullable = false)
	public Integer getSchedulingId() {
		return this.schedulingId;
	}

	public void setSchedulingId(Integer schedulingId) {
		this.schedulingId = schedulingId;
	}

	@Column(name = "operatorId", length = 32)
	public String getOperatorId() {
		return this.operatorId;
	}

	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}

	@Column(name = "date", length = 20)
	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Column(name = "startTime", length = 20)
	public String getStartTime() {
		return this.startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	@Column(name = "endTime", length = 20)
	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	@Column(name = "schedulingJob")
	public String getSchedulingJob() {
		return this.schedulingJob;
	}

	public void setSchedulingJob(String schedulingJob) {
		this.schedulingJob = schedulingJob;
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