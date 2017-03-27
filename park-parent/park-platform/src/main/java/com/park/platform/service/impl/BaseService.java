package com.park.platform.service.impl;

import com.park.common.bean.BaseInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IPlatformConstant;
import com.park.common.constant.SqlConfig;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.platform.dao.IBaseDao;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class BaseService {

    @Autowired
    protected IBaseDao baseDao;

    protected PageBean getPageBean(StringBuilder head, StringBuilder body, StringBuilder where, BaseInputView baseInputView, Map... otherParamMap){
        return getPageBean(head, body, where, baseInputView, false, otherParamMap);
    }

    protected PageBean getPageBean(StringBuilder head, StringBuilder body, StringBuilder where, BaseInputView baseInputView, boolean isGroupBy, Map... otherParamMap){

        int page = baseInputView.getPage();
        int pageSize = baseInputView.getPageSize();
        Map<String, Object> paramMap = JsonUtils.fromJson(baseInputView); //解析所有参数
        if(otherParamMap != null){
        	for(Map otherMap : otherParamMap){
        		paramMap.putAll(otherMap);
        	}
        }

        StringBuilder bwSql = body.append(where != null ? where : StrUtil.EMPTY);
        List<Map<String, Object>> dataList = baseDao.queryBySql(head.append(bwSql).toString(), page, pageSize, paramMap);

        Integer count = 0;
        if(!isGroupBy)
            count = baseDao.getAllCount(bwSql.insert(0, SqlConfig.SelectCountStr).toString(), paramMap);
        else
            count = baseDao.getAllCount(SqlConfig.SelectCountQuery + "(" + bwSql.insert(0, SqlConfig.SelectCountStr).toString() + ") t", paramMap);

        PageBean pageBean = new PageBean(dataList, page, pageSize, count);
        pageBean.init();

        pageBean.setParamsMap(JsonUtils.fromJsonDF(baseInputView)); //解析一些参数，不解析的不在前台显示，如userId
        return pageBean;
    }
    
    protected boolean isAdmin(BaseInputView baseInputView) {
		return isAdmin(baseInputView.getOperatorId());
	}
    
    protected boolean isAdmin(String operatorId) {
		if(IPlatformConstant.ADMIN.equals(operatorId)){
			return true;
		}
		return false;
	}

}
