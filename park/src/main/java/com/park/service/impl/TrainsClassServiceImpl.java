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
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TrainsClassServiceImpl extends BaseService implements ITrainsClassService {

	@Autowired
	private IBaseDao baseDao;


	@Override
	public PageBean getTrainsClassList(TrainsClassInputView trainsClassInputView){
		String className = trainsClassInputView.getClassName();
        Integer courseId = trainsClassInputView.getCourseId();
		Integer classStatus = trainsClassInputView.getClassStatus();
		
		StringBuilder headSql = new StringBuilder("SELECT trc.*, uo.operatorName, tc.courseName, COUNT(tcs.id) studentsCount,");
        headSql.append(" (CURDATE() >= trc.startTime AND  CURDATE() <= trc.endTime) signClass,");
        headSql.append(" (CURDATE() < trc.startTime) unSignClass,");
        headSql.append(" (CURDATE() > trc.endTime) signedClass");
		StringBuilder bodySql = new StringBuilder(" FROM trains_class trc LEFT JOIN user_operator uo ON trc.saleId=uo.id");
        bodySql.append(" INNER JOIN trains_course tc ON tc.id=trc.courseId");
        bodySql.append(" LEFT JOIN trains_class_students tcs ON tcs.classId=trc.id");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");

		if(StrUtil.isNotBlank(className)){
			whereSql.append(" AND className = :className");
		}
		if(courseId != null){
			whereSql.append(" AND courseId = :courseId");
		}
        if(classStatus != null && classStatus == 1){  // 未开始报名
            whereSql.append(" AND (CURDATE() < trc.startTime)");
        }
        if(classStatus != null && classStatus == 2){  // 开始报名
            whereSql.append(" AND (CURDATE() >= trc.startTime AND CURDATE() <= trc.endTime)");
        }
        if(classStatus != null && classStatus == 3){  // 结束报名
            whereSql.append(" AND (CURDATE() > trc.endTime)");
        }
        whereSql.append(" GROUP BY trc.id ORDER BY trc.updateTime DESC");

		return super.getPageBean(headSql, bodySql, whereSql, trainsClassInputView, true);
	}

    @Override
    public List<Map<String, Object>> getTrainsSignClassList(){
        StringBuilder sql = new StringBuilder("SELECT trc.* FROM trains_class trc");
        sql.append(" WhERE CURDATE() >= trc.startTime AND CURDATE() <= trc.endTime");
        sql.append(" ORDER BY trc.updateTime DESC");

        return baseDao.queryBySql(sql.toString());
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
            trainsClassInfo.setUpdateTime(nowDate);
			baseDao.save(trainsClassInfo, null);
            classId = trainsClassInfo.getId();
		} else {
            TrainsClassInfo trainsClassInfoDB = getTrainsClassInfo(classId);
			if(trainsClassInfoDB == null) throw new MessageException("该班级已经不存在");
            trainsClassInfoDB.setClassName(trainsClassInfo.getClassName());
            trainsClassInfoDB.setClassRemark(trainsClassInfo.getClassRemark());
            trainsClassInfoDB.setStartTime(trainsClassInfo.getStartTime());
            trainsClassInfoDB.setEndTime(trainsClassInfo.getEndTime());
            trainsClassInfoDB.setLeaderName(trainsClassInfo.getLeaderName());
            trainsClassInfoDB.setLeaderMobile(trainsClassInfo.getLeaderMobile());
            trainsClassInfoDB.setClassPrice(trainsClassInfo.getClassPrice());
            trainsClassInfoDB.setCourseId(trainsClassInfo.getCourseId());
            trainsClassInfoDB.setUpdateTime(nowDate);
			baseDao.save(trainsClassInfoDB, classId);
		}

		return classId;
	}
}

