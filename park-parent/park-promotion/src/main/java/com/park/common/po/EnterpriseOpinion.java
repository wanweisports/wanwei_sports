package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "enterprise_opinion", catalog = "park_promotion")
public class EnterpriseOpinion implements java.io.Serializable {

	// Fields
	private Integer id;
	private String name;
	private String mobile;
	private String opinion;
	private String createTime;

	// Constructors

	/** default constructor */
	public EnterpriseOpinion() {
	}

	/** full constructor */
	public EnterpriseOpinion(Integer id, String name, String mobile, String opinion, String createTime) {
		this.id = id;
		this.name = name;
		this.mobile = mobile;
		this.opinion = opinion;
		this.createTime = createTime;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", length = 30)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "mobile", length = 11)
	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "opinion")
	public String getOpinion() {
		return this.opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	@Column(name = "createTime", length = 20)
	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
