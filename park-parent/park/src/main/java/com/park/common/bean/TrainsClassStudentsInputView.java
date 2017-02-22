package com.park.common.bean;

/**
 * Created by wangjun on 16/12/14.
 */
public class TrainsClassStudentsInputView extends BaseInputView {
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


    public Integer getid() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudentName() {
        return this.studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentMobile() { return this.studentMobile; }

    public void setStudentMobile(String studentMobile) {
        this.studentMobile = studentMobile;
    }

    public String getRemark() {
        return this.remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getClassId() {
        return this.classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
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

    public String getSignTime() {
        return this.signTime;
    }

    public void setSignTime(String signTime) {
        this.signTime = signTime;
    }

    public String getPayStatus() {
        return this.payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    public Double getPayPrice() {
        return this.payPrice;
    }

    public void setPayPrice(Double payPrice) {
        this.payPrice = payPrice;
    }

    public String getUpdateTime() {
        return this.updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

}
