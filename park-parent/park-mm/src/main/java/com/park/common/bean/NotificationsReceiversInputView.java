package com.park.common.bean;

/**
 * Created by wangjun on 16/11/21.
 */
public class NotificationsReceiversInputView extends BaseInputView {

    private Integer id;

    private Integer noteId;

    private Integer receiverId;

    private String readTime;

    private String receiverStatus;

    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

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

    public Integer getReceiverId() {
        return this.receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    public String getReceiverStatus() {
        return this.receiverStatus;
    }

    public void setReceiverStatus(String receiverStatus) {
        this.receiverStatus = receiverStatus;
    }

    public String getReadTime() {
        return this.readTime;
    }

    public void setReadTime(String readTime) {
        this.readTime = readTime;
    }

}
