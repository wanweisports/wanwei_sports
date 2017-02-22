package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * Created by wangjun on 16/12/14.
 */
@Entity
@Table(name = "trains_class", catalog = "park")
public class TrainsClassInfo implements java.io.Serializable {
    // Fields
    private Integer id;
    private Integer courseId;
    private String className;
    private String classRemark;
    private String startTime;
    private String endTime;
    private String leaderName;
    private String leaderPhone;
    private String leaderMobile;
    private String address;
    private Integer saleId;
    private String createTime;
    private String updateTime;
    private Double classPrice;

    // Constructors

    /** default constructor */
    public TrainsClassInfo() {
    }

    /** minimal constructor */
    public TrainsClassInfo(String className, String classRemark, String startTime, String endTime) {
        this.className = className;
        this.classRemark = classRemark;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    /** full constructor */
    public TrainsClassInfo(Integer courseId, String className, String classRemark, String startTime, String endTime,
                           String leaderName, String leaderPhone, String leaderMobile, String address, Integer saleId,
                           String createTime, String updateTime, Double classPrice) {
        this.courseId = courseId;
        this.className = className;
        this.classRemark = classRemark;
        this.startTime = startTime;
        this.endTime = endTime;
        this.leaderName = leaderName;
        this.leaderPhone = leaderPhone;
        this.leaderMobile = leaderMobile;
        this.address = address;
        this.saleId = saleId;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.classPrice = classPrice;
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

    @Column(name = "className", nullable = false, length = 20)
    public String getClassName() {
        return this.className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    @Column(name = "courseId", nullable = false, length = 11)
    public Integer getCourseId() {
        return this.courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    @Column(name = "classRemark", length = 500)
    public String getClassRemark() {
        return this.classRemark;
    }

    public void setClassRemark(String classRemark) {
        this.classRemark = classRemark;
    }

    @Column(name = "startTime", nullable = false, length = 20)
    public String getStartTime() {
        return this.startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    @Column(name = "endTime", nullable = false, length = 20)
    public String getEndTime() {
        return this.endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    @Column(name = "leaderName", length = 20)
    public String getLeaderName() {
        return this.leaderName;
    }

    public void setLeaderName(String leaderName) {
        this.leaderName = leaderName;
    }

    @Column(name = "leaderPhone", length = 20)
    public String getLeaderPhone() {
        return this.leaderPhone;
    }

    public void setLeaderPhone(String leaderPhone) {
        this.leaderPhone = leaderPhone;
    }

    @Column(name = "leaderMobile", length = 20)
    public String getLeaderMobile() {
        return this.leaderMobile;
    }

    public void setLeaderMobile(String leaderMobile) {
        this.leaderMobile = leaderMobile;
    }

    @Column(name = "address", length = 500)
    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    @Column(name = "classPrice")
    public Double getClassPrice() {
        return this.classPrice;
    }

    public void setClassPrice(Double classPrice) {
        this.classPrice = classPrice;
    }

}
