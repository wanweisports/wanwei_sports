package com.park.service.impl;

import com.park.common.bean.PageBean;
import com.park.common.bean.TrainsClassInputView;
import com.park.common.exception.MessageException;
import com.park.common.po.TrainsClassInfo;
import com.park.common.util.DateUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.ITrainsClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TrainsClassServiceImpl extends BaseService implements ITrainsClassService {

	@Autowired
	private IBaseDao baseDao;


	@Override
	public PageBean getTrainsClassList(TrainsClassInputView trainsClassInputView){
		String className = trainsClassInputView.getClassName();
        Integer courseId = trainsClassInputView.getCourseId();
		
		StringBuilder headSql = new StringBuilder("SELECT tc.*, uo.operatorName");
		StringBuilder bodySql = new StringBuilder(" FROM trains_course tc left join user_operator uo on tc.saleId=uo.id");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
		if(StrUtil.isNotBlank(className)){
			whereSql.append(" AND className = :className");
		}
		if(courseId == null){
			whereSql.append(" AND courseId = :courseId");
		}
		return super.getPageBean(headSql, bodySql, whereSql, trainsClassInputView);
	}
	
	@Override
	public TrainsClassInfo getTrainsClassInfo(int classId) {
		return baseDao.getToEvict(TrainsClassInfo.class, classId);
	}
	
	@Override
	public void deleteTrainsClassInfo(int classId){
        TrainsClassInfo trainsClassInfo = getTrainsClassInfo(classId);
		if(trainsClassInfo == null) throw new MessageException("该班级已经不存在");
		baseDao.delete(trainsClassInfo);
	}
	
	@Override
	public Integer saveTrainsClassInfo(TrainsClassInfo trainsClassInfo) {
		String nowDate = DateUtil.getNowDate();
        Integer classId = trainsClassInfo.getId();

		if (classId == null) {
            trainsClassInfo.setCreateTime(nowDate);
			baseDao.save(trainsClassInfo, null);
            classId = trainsClassInfo.getId();
		} else {
            TrainsClassInfo trainsClassInfoDB = getTrainsClassInfo(classId);
			if(trainsClassInfoDB == null) throw new MessageException("该班级已经不存在");
            trainsClassInfoDB.setClassName(trainsClassInfoDB.getClassName());
            trainsClassInfoDB.setClassRemark(trainsClassInfoDB.getClassRemark());
            trainsClassInfoDB.setUpdateTime(nowDate);
			baseDao.save(trainsClassInfoDB, classId);
		}

		return classId;
	}
}

