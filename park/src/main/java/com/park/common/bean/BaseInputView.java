package com.park.common.bean;

import java.io.Serializable;

import com.park.common.annotation.GsonExclude;
import com.park.common.util.StrUtil;

public class BaseInputView implements Serializable {

	@GsonExclude
    private int page;

    @GsonExclude
    private int pageSize = 30; //默认每页显示30条

    @GsonExclude
    private String orderBy = StrUtil.EMPTY; //排序sql

    @GsonExclude
    private String groupBy;

    public int getPage() {
        return page;
    }

    public void setPage(Double page) {
        if(page != null) {
            this.page = Double.valueOf(page).intValue();
        }
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(Double pageSize) {
        if(pageSize != null) {
            this.pageSize = Double.valueOf(pageSize).intValue();
        }
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public String getGroupBy() {
        return groupBy;
    }

    public void setGroupBy(String groupBy) {
        this.groupBy = groupBy;
    }
}