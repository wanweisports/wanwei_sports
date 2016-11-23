package com.park.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.MemberSignInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IDBConstant;
import com.park.common.constant.IPlatformConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.MemberSiteSign;
import com.park.common.po.UserMember;
import com.park.common.util.DateUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IMemberService;
import com.park.service.IMemberSignService;
import com.park.service.ISiteService;

@Service
public class MemberSignServiceImpl extends BaseService implements IMemberSignService {
	
	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private ISiteService siteService;

	@Override
	public PageBean getSigns(MemberSignInputView memberSignInputView){
		StringBuilder headSql = new StringBuilder("SELECT * ");
		StringBuilder bodySql = new StringBuilder(" FROM member_site_sign");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
		
		return super.getPageBean(headSql, bodySql, whereSql, memberSignInputView);
	}
	
	//场地预订的签到开场提醒（会员卡号和本人手机号（子会员的手机号反查主会员订单），只能每个预订每个时间段只能签到一次）
	@Override
	public void saveSign(MemberSiteSign memberSiteSign){
		String signType = memberSiteSign.getSignType();
		
		String mobile = memberSiteSign.getSignMobile();
		if(IDBConstant.LOGIC_STATUS_YES.equals(signType)){ //会员
			UserMember userMemberChild = memberService.getUserMemberByChildMobile(mobile);
			UserMember userMember = memberService.getUserMember(userMemberChild.getParentMemberId());
			mobile = userMember.getMemberMobile(); //父会员手机号
		}else if(IDBConstant.LOGIC_STATUS_NO.equals(signType)){ //散客
			
		}else throw new MessageException("操作错误");
		
		Map<String, Object> nextSiteReserveBasic = siteService.getNextSiteReserveBasicByMobile(mobile);
		if(nextSiteReserveBasic == null) throw new MessageException("手机号对应的订单不存在");
		Map<String, Object> siteReserveBasic = siteService.getSiteReserveBasicByMobile(mobile);
		if(siteReserveBasic == null) throw new MessageException("场地开场时间尚未开始，下一场开始时间为：" + nextSiteReserveBasic.get("startSiteDate") + "，您可以提前"+IPlatformConstant.SITE_ADVANCE_START_TIME+"分钟或晚"+IPlatformConstant.SITE_LATE_START_TIME+"分钟签到");
		Integer reserveTimeId = StrUtil.objToInt(siteReserveBasic.get("reserveTimeId"));
		if(siteService.getSiteReserveTime(reserveTimeId) != null) throw new MessageException("该场次已经签到过，请勿重复签到");
		
		memberSiteSign.setReserveTimeId(reserveTimeId);
		memberSiteSign.setCreateTime(DateUtil.getNowDate());
		baseDao.save(memberSiteSign, null);
	}
	
}
