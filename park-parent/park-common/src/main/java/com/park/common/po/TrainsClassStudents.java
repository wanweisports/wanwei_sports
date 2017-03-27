package com.park.common.po;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "trains_class_students", catalog = "park")
public class TrainsClassStudents implements java.io.Serializable {
    // Fields
    private Integer id;
    private String studentName;
    private String studentMobile;
    private String signTime;
    private String remark;
    private Integer classId;
    private Integer saleId;
    private String createTime;
    private String payStatus;
    private Double payPrice;
    private String updateTime;

    // Constructors

    /** default constructor */
    public TrainsClassStudents() {
    }

    /** minimal constructor */
    public TrainsClassStudents(String studentName, String studentMobile) {
        this.studentMobile = studentMobile;
        this.studentMobile = studentMobile;
    }

    /** full constructor */
    public TrainsClassStudents(String studentName, String studentMobile, String remark, Integer saleId, String createTime,
                               String signTime, Integer classId, String payStatus, Double payPrice, String updateTime) {
        this.studentName = studentName;
        this.studentMobile = studentMobile;
        this.signTime = signTime;
        this.remark = remark;
        this.classId = classId;
        this.saleId = saleId;
        this.createTime = createTime;
        this.payStatus = payStatus;
        this.payPrice = payPrice;
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

    @Column(name = "studentName", nullable = false, length = 20)
    public String getStudentName() {
        return this.studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    @Column(name = "studentMobile", nullable = false, length = 20)
    public String getStudentMobile() { return this.studentMobile; }

    public void setStudentMobile(String studentMobile) {
        this.studentMobile = studentMobile;
    }

    @Column(name = "remark", length = 500)
    public String getRemark() {
        return this.remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Column(name = "classId")
    public Integer getClassId() {
        return this.classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
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

    @Column(name = "signTime", length = 20)
    public String getSignTime() {
        return this.signTime;
    }

    public void setSignTime(String signTime) {
        this.signTime = signTime;
    }

    @Column(name = "payStatus", length = 1)
    public String getPayStatus() {
        return this.payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    @Column(name = "payPrice")
    public Double getPayPrice() {
        return this.payPrice;
    }

    public void setPayPrice(Double payPrice) {
        this.payPrice = payPrice;
    }

    @Column(name = "updateTime", length = 20)
    public String getUpdateTime() {
        return this.updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

}
