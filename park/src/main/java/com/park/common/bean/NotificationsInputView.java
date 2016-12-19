package com.park.common.bean;

/**
 * Created by wangjun on 16/11/21.
 */
public class NotificationsInputView extends BaseInputView {

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

    public Integer getNoteId() {
        return noteId;
    }

    public void setNoteId(Integer noteId) {
        this.noteId = noteId;
    }

    public String getNoteTitle() {
        return noteTitle;
    }

    public void setNoteTitle(String noteTitle) {
        this.noteTitle = noteTitle;
    }

    public String getNoteContent() {
        return noteContent;
    }

    public void setNoteContent(String noteContent) {
        this.noteContent = noteContent;
    }

    public Integer getNoteSender() {
        return noteSender;
    }

    public void setNoteSender(Integer noteSender) {
        this.noteSender = noteSender;
    }

    public Integer getNoteReceiver() {
        return noteReceiver;
    }

    public void setNoteReceiver(Integer noteReceiver) {
        this.noteReceiver = noteReceiver;
    }

    public String getNoteAttachments() {
        return noteAttachments;
    }

    public void setNoteAttachments(String noteAttachments) {
        this.noteAttachments = noteAttachments;
    }

    public String getNoteSenderStatus() {return noteSenderStatus;}

    public void setNoteSenderStatus(String noteSenderStatus) {
        this.noteSenderStatus = noteSenderStatus;
    }

    public String getNoteReceiverStatus() {return noteReceiverStatus;}

    public void setNoteReceiverStatus(String noteReceiverStatus) {
        this.noteReceiverStatus = noteReceiverStatus;
    }

    public String getNoteCreateTime() {
        return noteCreateTime;
    }

    public void setNoteCreateTime(String noteCreateTime) {
        this.noteCreateTime = noteCreateTime;
    }

    public String getNoteReadTime() {
        return noteReadTime;
    }

    public void setNoteReadTime(String noteReadTime) {
        this.noteReadTime = noteReadTime;
    }

    public String getNoteUpdateTime() {
        return noteUpdateTime;
    }

    public void setNoteUpdateTime(String noteUpdateTime) {
        this.noteUpdateTime = noteUpdateTime;
    }

    public String getNoteSendTime() {
        return noteSendTime;
    }

    public void setNoteSendTime(String noteSendTime) {
        this.noteSendTime = noteSendTime;
    }

}
