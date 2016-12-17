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
	    Integer classId = trainsClassStudentsInputView.getClassId();

		StringBuilder headSql = new StringBuilder("SELECT tcs.*, uo.operatorName");
		StringBuilder bodySql = new StringBuilder("  FROM trains_class_students tcs LEFT JOIN user_operator uo ON tcs.saleId = uo.id");
		StringBuilder whereSql = new StringBuilder("  WHERE tcs.classId = :classId ORDER BY tcs.signTime DESC");

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
            trainsClassStudents.setSignTime(nowDate);
            trainsClassStudents.setUpdateTime(nowDate);
			baseDao.save(trainsClassStudents, null);
			signId = trainsClassStudents.getId();
		} else {
			TrainsClassStudents trainsClassStudentsDB = getTrainsClassStudentsSign(signId);
			if(trainsClassStudentsDB == null) throw new MessageException("该报名已经不存在");
			trainsClassStudentsDB.setClassId(trainsClassStudentsDB.getClassId());
			trainsClassStudentsDB.setStudentName(trainsClassStudentsDB.getStudentName());
            trainsClassStudentsDB.setStudentMobile(trainsClassStudentsDB.getStudentMobile());
            trainsClassStudentsDB.setPayStatus(trainsClassStudentsDB.getPayStatus());
            trainsClassStudentsDB.setPayPrice(trainsClassStudentsDB.getPayPrice());
            trainsClassStudentsDB.setRemark(trainsClassStudentsDB.getRemark());
            trainsClassStudentsDB.setUpdateTime(nowDate);
			baseDao.save(trainsClassStudentsDB, signId);
		}

		return signId;
	}

	@Override
	public Integer confirmTrainsClassStudentsPay(TrainsClassStudents trainsClassStudents){
        Integer signId = trainsClassStudents.getId();

        TrainsClassStudents trainsClassStudentsDB = getTrainsClassStudentsSign(signId);
        if(trainsClassStudentsDB == null) throw new MessageException("该报名已经不存在");
        trainsClassStudentsDB.setPayStatus(trainsClassStudents.getPayStatus());
        trainsClassStudentsDB.setPayPrice(trainsClassStudents.getPayPrice());
        trainsClassStudentsDB.setRemark(trainsClassStudents.getRemark());
        baseDao.save(trainsClassStudentsDB, signId);

        return signId;
	}
}

