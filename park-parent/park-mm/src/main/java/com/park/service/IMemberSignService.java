package com.park.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.park.common.bean.MemberSignInputView;
import com.park.common.bean.PageBean;
import com.park.common.po.MemberSiteSign;

public interface IMemberSignService {

	public PageBean getSigns(MemberSignInputView memberSignInputView);
	
	public void saveSign(MemberSiteSign memberSiteSign, Integer memberId, String reserveTimeIds) throws ParseException;
	
	public List<Map<String, Object>> getSignSites(String signType, String signMemberCardNo, String mobile) throws ParseException;
	
	public MemberSiteSign getMemberSiteSign(int reserveTimeId, String date) throws ParseException;
	
	public Map<String, Object> getQrSign(String operatorId, String mobile) throws ParseException;
	
}
