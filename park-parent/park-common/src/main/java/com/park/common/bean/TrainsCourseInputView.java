package com.park.common.bean;

/**
 * Created by wangjun on 16/12/16.
 */
public class TrainsCourseInputView extends BaseInputView {
    private Integer id;
    private String courseName;
    private String courseNo;
    private String courseRemark;
    private String courseTag;
    private Integer saleId;
    private String createTime;
    private String updateTime;
    private String courseStatus;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourseName() {
        return this.courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseNo() { return this.courseNo; }

    public void setCourseNo(String courseNo) {
        this.courseNo = courseNo;
    }

    public String getCourseRemark() {
        return this.courseRemark;
    }

    public void setCourseRemark(String courseRemark) {
        this.courseRemark = courseRemark;
    }

    public String getCourseTag() {
        return this.courseTag;
    }

    public void setCourseTag(String courseTag) {
        this.courseTag = courseTag;
    }

    public Integer getSaleId() {
        return this.saleId;
    }

    public void setSaleId(Integer saleId) {
        this.saleId = saleId;
    }

    public String getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return this.updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getCourseStatus() {
        return this.courseStatus;
    }

    public void setCourseStatus(String courseStatus) {
        this.courseStatus = courseStatus;
    }

}
