package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * GoodInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "notifications_senders", catalog = "park")
public class NotificationsSenders implements java.io.Serializable {
	// Fields
	private Integer noteId;
	private String noteTitle;
	private String noteContent;
	private String createTime;
    private String updateTime;
	private Integer senderId;
    private String sendTime;
    private String sendStatus;

	// Constructors

	/** default constructor */
	public NotificationsSenders() {
	}

	/** full constructor */
	public NotificationsSenders(String noteTitle, String noteContent, String createTime, String updateTime,
                                Integer senderId, String sendTime, String sendStatus) {
        this.noteTitle = noteTitle;
        this.noteContent = noteContent;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.senderId = senderId;
        this.sendTime = sendTime;
        this.sendStatus = sendStatus;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "noteId", unique = true, nullable = false)
	public Integer getNoteId() {
		return this.noteId;
	}

	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
	}

	@Column(name = "noteTitle", nullable = false, length = 200)
	public String getNoteTitle() {
		return this.noteTitle;
	}

	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}

	@Column(name = "noteContent", nullable = false, length = 500)
	public String getNoteContent() {
		return this.noteContent;
	}

	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
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

    @Column(name = "senderId")
    public Integer getSenderId() {
        return this.senderId;
    }

    public void setSenderId(Integer senderId) {
        this.senderId = senderId;
    }

    @Column(name = "sendTime", length = 20)
    public String getSendTime() {
        return this.sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }

    @Column(name = "sendStatus", length = 1)
    public String getSendStatus() {
        return this.sendStatus;
    }

    public void setSendStatus(String sendStatus) {
        this.sendStatus = sendStatus;
    }

}
