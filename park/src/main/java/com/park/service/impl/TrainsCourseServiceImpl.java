package com.park.service.impl;

import com.park.common.bean.TrainsCourseInputView;
import com.park.common.bean.PageBean;
import com.park.common.exception.MessageException;
import com.park.common.po.TrainsCourseInfo;
import com.park.common.util.DateUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.ITrainsCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TrainsCourseServiceImpl extends BaseService implements ITrainsCourseService {

	@Autowired
	private IBaseDao baseDao;

	@Override
	public PageBean getTrainsCourseList(TrainsCourseInputView trainsCourseInputView){
		String courseName = trainsCourseInputView.getCourseName();
        String courseNo = trainsCourseInputView.getCourseNo();
		
		StringBuilder headSql = new StringBuilder("SELECT tc.*, uo.operatorName");
		StringBuilder bodySql = new StringBuilder(" FROM trains_course tc left join user_operator uo on tc.saleId=uo.id");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
		if(StrUtil.isNotBlank(courseName)){
			whereSql.append(" AND courseName = :courseName");
		}
		if(StrUtil.isNotBlank(courseNo)){
			whereSql.append(" AND courseNo = :courseNo");
		}
		return super.getPageBean(headSql, bodySql, whereSql, trainsCourseInputView);
	}
	
	@Override
	public TrainsCourseInfo getTrainsCourseInfo(int courseId) {
		return baseDao.getToEvict(TrainsCourseInfo.class, courseId);
	}
	
	@Override
	public void deleteTrainsCourseInfo(int courseId){
		TrainsCourseInfo trainsCourseInfo = getTrainsCourseInfo(courseId);
		if(trainsCourseInfo == null) throw new MessageException("该课程已经不存在");
		baseDao.delete(trainsCourseInfo);
	}
	
	@Override
	public Integer saveTrainsCourseInfo(TrainsCourseInfo trainsCourseInfo) {
		String nowDate = DateUtil.getNowDate();
        Integer courseId = trainsCourseInfo.getId();

		if (courseId == null) {
			trainsCourseInfo.setCreateTime(nowDate);
			baseDao.save(trainsCourseInfo, null);
			courseId = trainsCourseInfo.getId();
		} else {
			TrainsCourseInfo trainsCourseInfoDB = getTrainsCourseInfo(courseId);
			if(trainsCourseInfoDB == null) throw new MessageException("该课程已经不存在");
			trainsCourseInfoDB.setCourseName(trainsCourseInfoDB.getCourseName());
			trainsCourseInfoDB.setCourseNo(trainsCourseInfoDB.getCourseNo());
			trainsCourseInfoDB.setCourseRemark(trainsCourseInfoDB.getCourseRemark());
			trainsCourseInfoDB.setUpdateTime(nowDate);
			baseDao.save(trainsCourseInfoDB, courseId);
		}

		return courseId;
	}

	@Override
	public Map<String, Object> getTrainsCourseNames(){
        List<Map<String, Object>> courseNames = baseDao.queryBySql("SELECT * FROM trains_course WHERE 1=1 ORDER BY createTime DESC");

        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("courseNames", courseNames);

        return resultMap;
	}
}

