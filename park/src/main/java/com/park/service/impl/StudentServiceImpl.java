package com.park.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.PageBean;
import com.park.common.bean.StudentInputView;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.MemberCard;
import com.park.common.po.MemberCardType;
import com.park.common.po.UserStudent;
import com.park.common.util.DateUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IMemberService;
import com.park.service.IStudentService;

@Service
public class StudentServiceImpl extends BaseService implements IStudentService {

	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IMemberService memberService;
	
	@Override
	public PageBean getStudents(StudentInputView studentInputView){
		StringBuilder headSql = new StringBuilder("SELECT mc.cardId, us.studentId, us.studentName, CONCAT(us.studentGrade, us.studentClass) gradeClass, us.siteCount, mc.cardDeadline, us.studentStatus, uo.operatorName, us.createTime");
		StringBuilder bodySql = new StringBuilder(" FROM user_student us");
		StringBuilder whereSql = new StringBuilder(" WHERE us.studentStatus = ").append(IDBConstant.LOGIC_STATUS_YES);
		
		bodySql.append(" INNER JOIN user_operator uo ON(us.salesId = uo.id)");
		bodySql.append(" LEFT JOIN member_card mc ON(us.cardId = mc.cardId)");
		
		return super.getPageBean(headSql, bodySql, whereSql, studentInputView);
	}
	
	@Override
	public UserStudent getStudent(Integer studentId){
		return baseDao.getToEvict(UserStudent.class, studentId);
	}
	
	@Override
	public Integer saveStudent(UserStudent student, String cardNo){
		if(!availableMobile(student.getStudentMobile())) throw new MessageException("学生手机号重复，请重新输入！");
		String nowDate = DateUtil.getNowDate();
		Integer studentId = student.getStudentId();
		if(studentId == null){
			MemberCardType memberCarType = memberService.getMemberCardType(StrUtil.objToInt(IDBConstant.CARD_STUDENT));
			if(memberCarType == null) throw new MessageException("学生卡类型不存在，请联系管理员！");
			
			MemberCard memberCard = new MemberCard();
			memberCard.setCardTypeId(memberCarType.getCardTypeId());
			memberCard.setCardDeadline(DateUtil.cardDeadline(memberCarType.getCardTypeMonth())); //计算会员卡截至日期(0:无限制)
			memberCard.setCreateTime(nowDate);
			memberCard.setCardStatus(IDBConstant.LOGIC_STATUS_YES); //默认有效
			memberCard.setCardDeposit(memberCarType.getCardDeposit()); //保存原始押金
			memberCard.setCardNo(cardNo);
			memberCard.setSalesId(student.getSalesId());
			baseDao.save(memberCard, null);
			
			student.setSiteCount(0);
			student.setCardId(memberCard.getCardId());
			student.setCreateTime(nowDate);
			student.setStudentStatus(IDBConstant.LOGIC_STATUS_YES);
			baseDao.save(student, null);
			
			
			return student.getStudentId();
		}
		UserStudent studentDB = getStudent(studentId);
		studentDB.setSalesId(student.getSalesId());
		studentDB.setStudentAddress(student.getStudentAddress());
		studentDB.setStudentGrade(student.getStudentGrade());
		studentDB.setStudentClass(student.getStudentClass());
		studentDB.setStudentName(student.getStudentName());
		studentDB.setStudentRemark(student.getStudentRemark());
		studentDB.setStudentSex(student.getStudentSex());
		studentDB.setStudentStatus(student.getStudentStatus());
		studentDB.setUpdateTime(nowDate);
		baseDao.save(studentDB, studentId);
		return studentId;
	}
	
	@Override
	public boolean availableMobile(String mobile){
		Map<String, Object> map = baseDao.queryBySqlFirst("SELECT 1 FROM user_student WHERE studentMobile = ?", mobile);
		return map == null ? true : false;
	}
	
	@Override
	public void updateLockStudent(int studentId, int salesId){
		UserStudent student = getStudent(studentId);
		student.setStudentStatus(IDBConstant.LOGIC_STATUS_NO);
		student.setSalesId(salesId);
		baseDao.save(student, studentId);
	}
	
	@Override
	public Map<String, Object> getCardDeposit(int cardTypeId){
		return baseDao.queryBySqlFirst("SELECT cardDeposit FROM member_card_type", cardTypeId);
	}
	
}
