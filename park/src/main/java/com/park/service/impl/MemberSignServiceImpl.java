package com.park.service.impl;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.MemberSignInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.MemberCard;
import com.park.common.po.MemberSiteSign;
import com.park.common.po.OrderInfo;
import com.park.common.po.SiteReserveTime;
import com.park.common.po.UserMember;
import com.park.common.util.DateUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IMemberService;
import com.park.service.IMemberSignService;
import com.park.service.IOrderService;
import com.park.service.ISiteService;

@Service
public class MemberSignServiceImpl extends BaseService implements IMemberSignService {
	
	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private ISiteService siteService;
	
	@Autowired
	private IOrderService orderService;

	@Override
	public PageBean getSigns(MemberSignInputView memberSignInputView){
		StringBuilder headSql = new StringBuilder("SELECT * ");
		StringBuilder bodySql = new StringBuilder(" FROM member_site_sign");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
		
		return super.getPageBean(headSql, bodySql, whereSql, memberSignInputView);
	}
	
	//场地预订的签到开场提醒（会员卡号和本人手机号（子会员的手机号反查主会员订单），只能每个预订每个时间段只能签到一次）
	@Override
	public void saveSign(MemberSiteSign memberSiteSign) throws ParseException{
		String signType = memberSiteSign.getSignType();
		String signMemberCardNo = memberSiteSign.getSignMemberCardNo();
		
		if(getSignSites(signType, signMemberCardNo, memberSiteSign.getSignMobile()) == null) throw new MessageException("暂无预定");
		
		String[] reserveTimeIds = memberSiteSign.getReserveTimeIds().split(",");
		
		for(String reserveTimeId : reserveTimeIds){
			Map<String, Object> siteReserveBasic = siteService.getNextSiteReserveBasic(reserveTimeId);
			if(siteReserveBasic == null) throw new MessageException("手机号对应的订单不存在，或已超过签到时间");
			
			Integer reserveTimeIdInt = StrUtil.objToInt(reserveTimeId);
			if(getMemberSiteSign(reserveTimeIdInt) != null) throw new MessageException("该场次已经签到过，请勿重复签到");
			
			Integer orderId = StrUtil.objToInt(siteReserveBasic.get("orderId"));
			memberSiteSign.setReserveTimeId(reserveTimeIdInt);
			memberSiteSign.setCreateTime(DateUtil.getNowDate());
			memberSiteSign.setOrderId(orderId);
			baseDao.save(memberSiteSign, null);
			
			OrderInfo orderInfo = orderService.getOrderInfo(orderId);
			if(orderInfo == null) throw new MessageException("订单不存在");
			orderInfo.setUseCount(orderInfo.getUseCount()+DateUtil.getTimeHourNums(StrUtil.objToStr(siteReserveBasic.get("siteStartTime")), StrUtil.objToStr(siteReserveBasic.get("siteEndTime")))); //计算场地时间有多少场
			baseDao.save(orderInfo, orderId);
			
			//场次变为已使用状态
			SiteReserveTime siteReserveTime = siteService.getSiteReserveTime(reserveTimeIdInt);
			siteReserveTime.setIsUse(IDBConstant.LOGIC_STATUS_YES);
			baseDao.save(siteReserveTime, reserveTimeId);
		}
	}
	
	@Override
	public List<Map<String, Object>> getSignSites(String signType, String signMemberCardNo, String mobile){
		if(IDBConstant.LOGIC_STATUS_YES.equals(signType)){ //会员
			UserMember userMember = memberService.getUserMemberByChildMobile(mobile);
			if(userMember.getParentMemberId() != null){ //如果是子会员，则查询主会员
				userMember = memberService.getUserMember(userMember.getParentMemberId());
			}
			mobile = userMember.getMemberMobile(); //父会员手机号
			List<MemberCard> memberCards = memberService.getMemberCards(userMember.getMemberId());
			if(memberCards.size() < 0) throw new MessageException("该会员没有会员卡信息");
			if(!memberCards.get(0).getCardNo().equals(signMemberCardNo)) throw new MessageException("该手机号未与该会员卡有关，请重新输入");
		}else if(IDBConstant.LOGIC_STATUS_NO.equals(signType)){ //散客
			
		}else throw new MessageException("操作错误");
		
		return siteService.getSiteReserveBasicByMobile(mobile);
	}
	
	private MemberSiteSign getMemberSiteSign(int reserveTimeId){
		return baseDao.queryByHqlFirst("FROM MemberSiteSign WHERE reserveTimeId = ?", reserveTimeId);
	}
	
}
