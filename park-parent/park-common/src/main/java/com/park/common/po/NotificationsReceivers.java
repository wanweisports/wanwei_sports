package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * GoodInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "notifications_receivers", catalog = "park")
public class NotificationsReceivers implements java.io.Serializable {
	// Fields
	private Integer id;
	private Integer noteId;
	private Integer receiverId;
    private String receiverStatus;
    private String readTime;

	// Constructors

	/** default constructor */
	public NotificationsReceivers() {
	}

	/** full constructor */
	public NotificationsReceivers(Integer noteId, Integer receiverId, String readTime, String receiverStatus) {
        this.noteId = noteId;
        this.receiverId = receiverId;
        this.receiverStatus = receiverStatus;
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

	@Column(name = "receiverId", length = 11)
	public Integer getReceiverId() {
		return this.receiverId;
	}

	public void setReceiverId(Integer receiverId) {
		this.receiverId = receiverId;
	}

    @Column(name = "receiverStatus", length = 1)
    public String getReceiverStatus() {
        return this.receiverStatus;
    }

    public void setReceiverStatus(String receiverStatus) {
        this.receiverStatus = receiverStatus;
    }

	@Column(name = "readTime", length = 20)
	public String getReadTime() {
		return this.readTime;
	}

	public void setReadTime(String readTime) {
		this.readTime = readTime;
	}

}
