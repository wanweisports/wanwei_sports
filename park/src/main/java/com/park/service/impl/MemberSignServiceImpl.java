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
import com.park.common.po.MemberSiteSign;
import com.park.common.po.OrderInfo;
import com.park.common.po.UserMember;
import com.park.common.po.UserOperator;
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
	//签到的时候   会员用ID签到  但是注意关联关系  这个会员可能是子会员，预订的时候用的主会员预订的  签到可以用子会员
	//类型(1会员 2散客) 手机。签到人名称。 签到会员卡(散客不传)。预定时间id，多个逗号分隔【2016-12-01新加】
	@Override
	public void saveSign(MemberSiteSign memberSiteSign, Integer memberId, String reserveTimeIds) throws ParseException{
		String signType = memberSiteSign.getSignType();
		String signMemberCardNo = memberSiteSign.getSignMemberCardNo();
		String signDate = memberSiteSign.getSignDate();
		if(StrUtil.isBlank(signDate)) throw new MessageException("signDate参数为空");
		
		if(IDBConstant.LOGIC_STATUS_YES.equals(signType)){ //会员
			//根据卡号找到主会员
			UserMember member = memberService.getMemberByCardNo(signMemberCardNo);
			//查询memberId参数是否与主会员相关
			if(member == null) throw new MessageException("该会员卡未查询到会员信息");
			if(member.getMemberId() != memberId){ //子会员
				UserMember childmember = memberService.getUserMember(memberId);
				if(childmember == null) throw new MessageException("未查询到会员信息");
				if(childmember.getParentMemberId() != member.getMemberId()) throw new MessageException("该会员不能使用此会员卡");
				memberSiteSign.setSignName(childmember.getMemberName());
			}else{
				memberSiteSign.setSignName(member.getMemberName());
			}
			memberSiteSign.setSignMobile(member.getMemberMobile());
		}
		
		if(getSignSites(signType, signMemberCardNo, memberSiteSign.getSignMobile()).size() == 0) throw new MessageException("暂无预定");
		
		String[] reserveTimeIdArr = reserveTimeIds.split(",");
		
		for(String reserveTimeId : reserveTimeIdArr){
			Map<String, Object> siteReserveBasic = siteService.getNextSiteReserveBasic(reserveTimeId, signDate);
			if(siteReserveBasic == null) throw new MessageException("对应的订单不存在，或已超过、未到签到时间");
			
			Integer reserveTimeIdInt = StrUtil.objToInt(reserveTimeId);
			//【新，不限制签到】
			if(getMemberSiteSign(reserveTimeIdInt, signDate) != null) throw new MessageException("该场次已经签到过，请勿重复签到");
			
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
			/*SiteReserveTime siteReserveTime = siteService.getSiteReserveTime(reserveTimeIdInt);
			siteReserveTime.setIsUse(IDBConstant.LOGIC_STATUS_YES);
			baseDao.save(siteReserveTime, reserveTimeId);*/
		}
	}
	
	//获取签到场地只查今天的可签到的。9：50，取9：00。散客：mobile需要。会员不需要mobile
	@Override
	public List<Map<String, Object>> getSignSites(String signType, String signMemberCardNo, String mobile) throws ParseException{
		if(IDBConstant.LOGIC_STATUS_YES.equals(signType)){ //会员
			//根据会员卡号查询会员
			UserMember member = memberService.getMemberByCardNo(signMemberCardNo);
			if(member == null) throw new MessageException("该会员卡未查询到会员信息");
			mobile = member.getMemberMobile();
			
			/*UserMember userMember = memberService.getUserMemberByChildMobile(mobile);
			if(userMember.getParentMemberId() != null){ //如果是子会员，则查询主会员
				userMember = memberService.getUserMember(userMember.getParentMemberId());
			}
			mobile = userMember.getMemberMobile(); //父会员手机号
			MemberCard memberCard = memberService.getMemberCardNotThrow(userMember.getMemberId());*/
			//if(!memberCard.getCardNo().equals(signMemberCardNo)) throw new MessageException("该手机号未与该会员卡有关，请重新输入");
		}else if(IDBConstant.LOGIC_STATUS_NO.equals(signType)){ //散客
			
		}else throw new MessageException("操作错误");
		
		return siteService.getSiteReserveBasicByMobile(mobile);
	}
	
	@Override
	public MemberSiteSign getMemberSiteSign(int reserveTimeId, String date) throws ParseException{
		return baseDao.queryByHqlFirst("FROM MemberSiteSign WHERE reserveTimeId = ? AND DATE(signDate) = ?", reserveTimeId, DateUtil.stringToDate(date, null));
	}
	
	@Override
	public Map<String, Object> getQrSign(UserOperator userOperator){
		//memberService.getMemberOperator(userOperator.getOperatorId());
	}
	
}
