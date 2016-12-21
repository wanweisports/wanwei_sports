package com.park.common.bean;

/**
 * Created by wangjun on 16/11/21.
 */
public class NotificationsUsersInputView extends BaseInputView {

    private Integer id;

    private Integer noteId;

    private Integer senderId;

    private Integer receiverId;

    private String status;

    private String sendTime;

    private String readTime;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNoteId() {
        return this.noteId;
    }

    public void setNoteId(Integer noteId) {
        this.noteId = noteId;
    }

    public Integer getSenderId() {
        return this.senderId;
    }

    public void setSenderId(Integer senderId) {
        this.senderId = senderId;
    }

    public Integer getReceiverId() {
        return this.receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReadTime() {
        return this.readTime;
    }

    public void setReadTime(String readTime) {
        this.readTime = readTime;
    }

    public String getSendTime() {
        return this.sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }

}
