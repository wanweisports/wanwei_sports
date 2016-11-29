package com.park.service.impl;

import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ScheduleServiceImpl extends BaseService implements IScheduleService {

	@Autowired
	private IBaseDao baseDao;

    @Override
    public List<Map<String, Object>> getScheduleTable() {
        StringBuilder sql = new StringBuilder("SELECT uo.operatorName, utk.name, utk.note, utk.startTime, utk.endTime");
        sql.append(" FROM user_table ut INNER JOIN user_table_keys utk ON ut.class = utk.class");
		sql.append(" INNER JOIN user_operator uo ON ut.saleId=uo.id");

        return baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(""));
    }
}
