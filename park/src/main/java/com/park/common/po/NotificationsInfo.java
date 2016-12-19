package com.park.common.po;

import javax.persistence.*;

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
@Table(name = "user_notifications", catalog = "park")
public class NotificationsInfo implements java.io.Serializable {

	// Fields
	private Integer noteId;
	private String noteTitle;
	private String noteContent;
	private Integer noteSender;
	private Integer noteReceiver;
	private String noteAttachments;
	private String noteSenderStatus;
	private String noteReceiverStatus;
	private String noteCreateTime;
	private String noteReadTime;
    private String noteUpdateTime;
	private String noteSendTime;

	// Constructors

	/** default constructor */
	public NotificationsInfo() {
	}

	/** minimal constructor */
	public NotificationsInfo(String noteTitle, String noteContent, String noteSenderStatus, String noteReceiverStatus,
							 String noteCreateTime) {
		this.noteTitle = noteTitle;
		this.noteContent = noteContent;
		this.noteSenderStatus = noteSenderStatus;
		this.noteReceiverStatus = noteReceiverStatus;
        this.noteCreateTime = noteCreateTime;
	}

	/** full constructor */
	public NotificationsInfo(String noteTitle, String noteContent, Integer noteSender, Integer noteReceiver,
                             String noteAttachments, String noteSenderStatus, String noteReceiverStatus,
							 String noteCreateTime, String noteReadTime, String noteUpdateTime, String noteSendTime) {
        this.noteTitle = noteTitle;
        this.noteContent = noteContent;
        this.noteSender = noteSender;
        this.noteReceiver = noteReceiver;
        this.noteAttachments = noteAttachments;
		this.noteSenderStatus = noteSenderStatus;
        this.noteReceiverStatus = noteReceiverStatus;
        this.noteCreateTime = noteCreateTime;
        this.noteReadTime = noteReadTime;
        this.noteUpdateTime = noteUpdateTime;
		this.noteSendTime = noteSendTime;
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

	@Column(name = "noteSender")
	public Integer getNoteSender() {
		return this.noteSender;
	}

	public void setNoteSender(Integer noteSender) {
		this.noteSender = noteSender;
	}

	@Column(name = "noteReceiver")
	public Integer getNoteReceiver() {
		return this.noteReceiver;
	}

	public void setNoteReceiver(Integer noteReceiver) {
		this.noteReceiver = noteReceiver;
	}

	@Column(name = "noteAttachments")
	public String getNoteAttachments() {
		return this.noteAttachments;
	}

	public void setNoteAttachments(String noteAttachments) {
		this.noteAttachments = noteAttachments;
	}

	@Column(name = "noteReceiverStatus", nullable = false, length = 1)
	public String getNoteReceiverStatus() {
		return this.noteReceiverStatus;
	}

	public void setNoteReceiverStatus(String noteReceiverStatus) {
		this.noteReceiverStatus = noteReceiverStatus;
	}

    @Column(name = "noteSenderStatus", nullable = false, length = 1)
    public String getNoteSenderStatus() {
        return this.noteSenderStatus;
    }

    public void setNoteSenderStatus(String noteSenderStatus) {
        this.noteSenderStatus = noteSenderStatus;
    }

	@Column(name = "noteCreateTime", length = 20)
	public String getNoteCreateTime() {
		return this.noteCreateTime;
	}

	public void setNoteCreateTime(String noteCreateTime) {
		this.noteCreateTime = noteCreateTime;
	}

	@Column(name = "noteReadTime", length = 20)
	public String getNoteReadTime() {
		return this.noteReadTime;
	}

	public void setNoteReadTime(String noteReadTime) {
		this.noteReadTime = noteReadTime;
	}

    @Column(name = "noteUpdateTime", length = 20)
    public String getNoteUpdateTime() {
        return this.noteUpdateTime;
    }

    public void setNoteUpdateTime(String noteUpdateTime) {
        this.noteUpdateTime = noteUpdateTime;
    }

    @Column(name = "noteSendTime", length = 20)
    public String getNoteSendTime() {
        return this.noteSendTime;
    }

    public void setNoteSendTime(String noteSendTime) {
        this.noteSendTime = noteSendTime;
    }

}
