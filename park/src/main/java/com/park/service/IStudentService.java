package com.park.service;

import java.util.Map;

import com.park.common.bean.PageBean;
import com.park.common.bean.StudentInputView;
import com.park.common.po.MemberSiteStudentSign;
import com.park.common.po.UserStudent;

public interface IStudentService {

	public PageBean getStudents(StudentInputView studentInputView);
	
	public UserStudent getStudent(Integer studentId);
	
	public Map<String, Object> studentsView(Integer studentId);
	
	public Integer saveStudent(UserStudent student, String cardNo);
	
	public boolean availableMobile(String mobile);
	
	public void updateLockStudent(int studentId, int salesId);
	
	public Map<String, Object> getCardDeposit(int cardTypeId);
	
	public void saveStudentGign(MemberSiteStudentSign memberSiteStudentSign);
	
}
