package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * GoodInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "notifications_users", catalog = "park")
public class NotificationsUsers implements java.io.Serializable {
	// Fields
	private Integer id;
	private Integer noteId;
	private Integer senderId;
	private Integer receiverId;
	private String status;
	private String sendTime;
    private String readTime;

	// Constructors

	/** default constructor */
	public NotificationsUsers() {
	}

	/** full constructor */
	public NotificationsUsers(Integer noteId, Integer senderId, Integer receiverId, String status, String sendTime,
							  String readTIme) {
        this.noteId = noteId;
        this.senderId = senderId;
        this.receiverId = receiverId;
		this.status = status;
        this.sendTime = sendTime;
		this.readTime = readTime;
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

	@Column(name = "noteId", length = 11)
	public Integer getNoteId() {
		return this.noteId;
	}

	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
	}

	@Column(name = "senderId", length = 11)
	public Integer getSenderId() {
		return this.senderId;
	}

	public void setSenderId(Integer senderId) {
		this.senderId = senderId;
	}

	@Column(name = "receiverId", length = 11)
	public Integer getReceiverId() {
		return this.receiverId;
	}

	public void setReceiverId(Integer receiverId) {
		this.receiverId = receiverId;
	}

	@Column(name = "status", length = 1)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "readTime", length = 20)
	public String getReadTime() {
		return this.readTime;
	}

	public void setReadTime(String readTime) {
		this.readTime = readTime;
	}

    @Column(name = "sendTime", length = 20)
    public String getSendTime() {
        return this.sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }

}
