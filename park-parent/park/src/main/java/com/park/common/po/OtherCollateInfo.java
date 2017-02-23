package com.park.common.po;

import javax.persistence.*;
import java.math.BigDecimal;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * Created by leida on 2017/2/23.
 */
@Entity
@Table(name = "other_collate_info", schema = "", catalog = "park")
public class OtherCollateInfo {
    private int collateId;
    private String collateType;
    private BigDecimal oldAmount;
    private BigDecimal collateAmount;
    private String collateStatus;
    private String collateRemark;
    private String createTime;
    private String updateTime;
    private Integer salesId;

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "collateId")
    public int getCollateId() {
        return collateId;
    }

    public void setCollateId(int collateId) {
        this.collateId = collateId;
    }

    @Basic
    @Column(name = "collateType")
    public String getCollateType() {
        return collateType;
    }

    public void setCollateType(String collateType) {
        this.collateType = collateType;
    }

    @Basic
    @Column(name = "oldAmount")
    public BigDecimal getOldAmount() {
        return oldAmount;
    }

    public void setOldAmount(BigDecimal oldAmount) {
        this.oldAmount = oldAmount;
    }

    @Basic
    @Column(name = "collateAmount")
    public BigDecimal getCollateAmount() {
        return collateAmount;
    }

    public void setCollateAmount(BigDecimal collateAmount) {
        this.collateAmount = collateAmount;
    }

    @Basic
    @Column(name = "collateStatus")
    public String getCollateStatus() {
        return collateStatus;
    }

    public void setCollateStatus(String collateStatus) {
        this.collateStatus = collateStatus;
    }

    @Basic
    @Column(name = "collateRemark")
    public String getCollateRemark() {
        return collateRemark;
    }

    public void setCollateRemark(String collateRemark) {
        this.collateRemark = collateRemark;
    }

    @Basic
    @Column(name = "createTime")
    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "updateTime")
    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    @Basic
    @Column(name = "salesId")
    public Integer getSalesId() {
        return salesId;
    }

    public void setSalesId(Integer salesId) {
        this.salesId = salesId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OtherCollateInfo that = (OtherCollateInfo) o;

        if (collateId != that.collateId) return false;
        if (collateType != null ? !collateType.equals(that.collateType) : that.collateType != null) return false;
        if (oldAmount != null ? !oldAmount.equals(that.oldAmount) : that.oldAmount != null) return false;
        if (collateAmount != null ? !collateAmount.equals(that.collateAmount) : that.collateAmount != null)
            return false;
        if (collateStatus != null ? !collateStatus.equals(that.collateStatus) : that.collateStatus != null)
            return false;
        if (collateRemark != null ? !collateRemark.equals(that.collateRemark) : that.collateRemark != null)
            return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;
        if (updateTime != null ? !updateTime.equals(that.updateTime) : that.updateTime != null) return false;
        if (salesId != null ? !salesId.equals(that.salesId) : that.salesId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = collateId;
        result = 31 * result + (collateType != null ? collateType.hashCode() : 0);
        result = 31 * result + (oldAmount != null ? oldAmount.hashCode() : 0);
        result = 31 * result + (collateAmount != null ? collateAmount.hashCode() : 0);
        result = 31 * result + (collateStatus != null ? collateStatus.hashCode() : 0);
        result = 31 * result + (collateRemark != null ? collateRemark.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (salesId != null ? salesId.hashCode() : 0);
        return result;
    }
}
