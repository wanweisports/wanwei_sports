package com.park.service.impl;

import com.park.common.bean.PageBean;
import com.park.common.bean.TrainsClassStudentsInputView;
import com.park.common.exception.MessageException;
import com.park.common.po.TrainsClassStudents;
import com.park.common.util.DateUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.ITrainsClassStudentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TrainsClassStudentsServiceImpl extends BaseService implements ITrainsClassStudentsService {

	@Autowired
	private IBaseDao baseDao;


	@Override
	public PageBean getTrainsClassStudentsList(TrainsClassStudentsInputView trainsClassStudentsInputView){
		StringBuilder headSql = new StringBuilder("SELECT tc.*, uo.operatorName");
		StringBuilder bodySql = new StringBuilder(" FROM trains_course tc left join user_operator uo on tc.saleId=uo.id");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");

		return super.getPageBean(headSql, bodySql, whereSql, trainsClassStudentsInputView);
	}
	
	@Override
	public TrainsClassStudents getTrainsClassStudentsSign(int signId) {
		return baseDao.getToEvict(TrainsClassStudents.class, signId);
	}
	
	@Override
	public void deleteTrainsClassStudentsSign(int signId){
        TrainsClassStudents trainsClassStudents = getTrainsClassStudentsSign(signId);
		if(trainsClassStudents == null) throw new MessageException("该报名已经不存在");
		baseDao.delete(trainsClassStudents);
	}
	
	@Override
	public Integer saveTrainsClassStudentsSign(TrainsClassStudents trainsClassStudents) {
		String nowDate = DateUtil.getNowDate();
        Integer signId = trainsClassStudents.getId();

		if (signId == null) {
			trainsClassStudents.setCreateTime(nowDate);
			baseDao.save(trainsClassStudents, null);
			signId = trainsClassStudents.getId();
		} else {
			TrainsClassStudents trainsClassStudentsDB = getTrainsClassStudentsSign(signId);
			if(trainsClassStudentsDB == null) throw new MessageException("该班级已经不存在");
			trainsClassStudentsDB.setClassId(trainsClassStudentsDB.getClassId());
			trainsClassStudentsDB.setStudentName(trainsClassStudentsDB.getStudentName());
			baseDao.save(trainsClassStudentsDB, signId);
		}

		return signId;
	}

	@Override
	public Integer confirmTrainsClassStudentsPay(TrainsClassStudents trainsClassStudents){
        String nowDate = DateUtil.getNowDate();
        Integer signId = trainsClassStudents.getId();

        TrainsClassStudents trainsClassStudentsDB = getTrainsClassStudentsSign(signId);
        if(trainsClassStudentsDB == null) throw new MessageException("该班级已经不存在");
        trainsClassStudentsDB.setClassId(trainsClassStudentsDB.getClassId());
        trainsClassStudentsDB.setStudentName(trainsClassStudentsDB.getStudentName());
        baseDao.save(trainsClassStudentsDB, signId);

        return signId;
	}
}

