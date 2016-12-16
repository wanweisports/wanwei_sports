package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * Created by wangjun on 16/12/14.
 */
@Entity
@Table(name = "trains_course", catalog = "park")
public class TrainsCourseInfo implements java.io.Serializable {
    // Fields
    private Integer id;
    private String courseName;
    private String courseNo;
    private String courseRemark;
    private String courseTag;
    private Integer saleId;
    private String createTime;
    private String updateTime;

    // Constructors

    /** default constructor */
    public TrainsCourseInfo() {
    }

    /** minimal constructor */
    public TrainsCourseInfo(String courseName, String courseNo, String courseRemark) {
        this.courseName = courseName;
        this.courseNo = courseNo;
        this.courseRemark = courseRemark;
    }

    /** full constructor */
    public TrainsCourseInfo(String courseName, String courseNo, String courseRemark, Integer saleId, String createTime,
                            String updateTime, String courseTag) {
        this.courseName = courseName;
        this.courseNo = courseNo;
        this.courseRemark = courseRemark;
        this.courseTag = courseTag;
        this.saleId = saleId;
        this.createTime = createTime;
        this.updateTime = updateTime;
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

    @Column(name = "courseName", nullable = false, length = 20)
    public String getCourseName() {
        return this.courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    @Column(name = "courseNo", length = 20)
    public String getCourseNo() { return this.courseNo; }

    public void setCourseNo(String courseNo) {
        this.courseNo = courseNo;
    }

    @Column(name = "courseRemark", length = 500)
    public String getCourseRemark() {
        return this.courseRemark;
    }

    public void setCourseRemark(String courseRemark) {
        this.courseRemark = courseRemark;
    }

    @Column(name = "courseTag", length = 20)
    public String getCourseTag() { return this.courseTag; }

    public void setCourseTag(String courseTag) {
        this.courseTag = courseTag;
    }

    @Column(name = "saleId")
    public Integer getSaleId() {
        return this.saleId;
    }

    public void setSaleId(Integer saleId) {
        this.saleId = saleId;
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

}
