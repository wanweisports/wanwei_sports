package com.park.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.BalanceInputView;
import com.park.common.bean.InvoiceInputView;
import com.park.common.bean.MemberCardOpInputView;
import com.park.common.bean.MemberInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IDBConstant;
import com.park.common.constant.IPlatformConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.MemberCard;
import com.park.common.po.MemberCardType;
import com.park.common.po.OrderInfo;
import com.park.common.po.OtherBalance;
import com.park.common.po.OtherInvoice;
import com.park.common.po.UserMember;
import com.park.common.po.UserOperator;
import com.park.common.util.DateUtil;
import com.park.common.util.JsonUtils;
import com.park.common.util.SQLUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IDictService;
import com.park.service.IMemberService;
import com.park.service.IOperatorService;

@Service
public class MemberServiceImpl extends BaseService implements IMemberService {
	
	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IDictService dictService;
	
	@Autowired
	private IOperatorService operatorService;
	
	@Override
	public Integer saveMember(UserMember userMember) {
		Integer memberId = userMember.getMemberId();
		String nowDate = DateUtil.getNowDate();
		if(memberId == null){ //新增
			userMember.setCreateTime(nowDate);
			userMember.setMemberStatus(IDBConstant.LOGIC_STATUS_YES);
			UserOperator operator = new UserOperator();
			operator.setOperatorMobile(userMember.getMemberMobile());
			operator.setOperatorId(userMember.getTempCardNo()); //会员帐号暂时使用第一次注册的会员卡号
			operator.setStatus(IDBConstant.LOGIC_STATUS_YES);
			operator.setCreateTime(nowDate);
			operator.setOperatorName(userMember.getMemberName());
			String operatorId = operatorService.saveOperator(operator, IDBConstant.ROLE_MEMBER);
			userMember.setOperationId(operatorId);
			baseDao.save(userMember, null);
			return userMember.getMemberId();
		}else{ //编辑
			UserMember userMemberDB = getUserMember(memberId);
			if(userMemberDB == null) throw new MessageException("会员信息不存在！");
			userMemberDB.setMemberName(userMember.getMemberName());
			userMemberDB.setMemberMobile(userMember.getMemberMobile());
			userMemberDB.setMemberMobile2(userMember.getMemberMobile2());
			userMemberDB.setMemberIdcard(userMember.getMemberIdcard());
			userMemberDB.setMemberSex(userMember.getMemberSex());
			userMemberDB.setMemberBirthday(userMember.getMemberBirthday());
			userMemberDB.setMemberAddress(userMember.getMemberAddress());
			userMemberDB.setMemberRemark(userMember.getMemberRemark());
			userMemberDB.setParentMemberId(userMember.getParentMemberId()); //父会员id
			userMemberDB.setSalesId(userMember.getSalesId());
			userMemberDB.setUpdateTime(nowDate);
			baseDao.save(userMemberDB, userMemberDB.getMemberId());
			UserOperator operator = operatorService.getOperator(userMemberDB.getOperationId());
			operator.setOperatorMobile(userMemberDB.getMemberMobile());
			operator.setOperatorName(userMember.getMemberName());
			baseDao.save(operator, operator.getId());
			return userMemberDB.getMemberId();
		}
	}
	
	@Override
	public void updateMemberName(UserMember userMember) {
		Integer memberId = userMember.getMemberId();
		String nowDate = DateUtil.getNowDate();
		if(memberId == null) throw new MessageException("会员id为null！");
		UserMember userMemberDB = baseDao.getToEvict(UserMember.class, memberId);
		if(userMemberDB == null) throw new MessageException("会员信息不存在！");
		userMemberDB.setMemberName(userMember.getMemberName());
		userMemberDB.setMemberMobile(userMember.getMemberMobile());
		userMemberDB.setUpdateTime(nowDate);
		baseDao.save(userMemberDB, userMemberDB.getMemberId());
	}
	
	@Override
	public Map<String, Object> saveMemberCar(MemberCard memberCard, OtherBalance otherBalance) {
		UserMember userMember = getUserMember(memberCard.getMemberId());
		if(userMember == null) throw new MessageException("会员信息不存在！");
		Map<String, Object> data = new HashMap<String, Object>();
		if(getMemberCards(userMember.getMemberId()).size() == 0){// throw new RotaryException("该会员已绑定了会员卡！");
			MemberCardType memberCarType = getMemberCardType(memberCard.getCardTypeId());
			if(memberCarType == null) throw new MessageException("会员卡类型不存在！");
			
			//保存之前的临时会员卡号，并清除临时卡号！
			memberCard.setCardNo(userMember.getTempCardNo());
			userMember.setTempCardNo(null);
			
			if(this.getMemberCard(memberCard.getCardNo()) != null ) throw new MessageException("会员卡号已存在！");
			memberCard.setCardDeadline(DateUtil.cardDeadline(memberCarType.getCardTypeMonth())); //计算会员卡截至日期(0:无限制)
			String nowDate = DateUtil.getNowDate();
			memberCard.setMemberId(userMember.getMemberId());
			//memberCard.setCardNo(getCardNo()); //会员卡编号	唯一的;
			memberCard.setCreateTime(nowDate);
			memberCard.setCardStatus(IDBConstant.LOGIC_STATUS_YES); //默认有效
			memberCard.setCardDeposit(memberCarType.getCardDeposit()); //保存原始押金
			
			//原始金额（充值金额|升级金额|补办金额）
			otherBalance.setOldAmount(memberCard.getCardBalance());
			//实际价格（最终支付金额）
			otherBalance.setRealAmount(memberCard.getCardBalance()+memberCarType.getCardTypeMoney()-StrUtil.objToDoubleDef0(otherBalance.getSubAmount()));
			
			memberCard.setCardBalance(memberCard.getCardBalance()+StrUtil.objToDoubleDef0(otherBalance.getGivingAmount())); //会员卡金额（充值+赠送）
			baseDao.save(memberCard, memberCard.getCardId());
			baseDao.save(userMember, userMember.getMemberId());
			
			otherBalance.setBalanceServiceType(IDBConstant.BALANCE_SERVICE_TYPE_REG);
			otherBalance.setBalanceServiceId(memberCard.getCardId());
			otherBalance.setBalanceNo(getBalanceNo());
			otherBalance.setCreateTime(nowDate);
			otherBalance.setServiceDate(nowDate);
			otherBalance.setBalanceType(IDBConstant.BALANCE_TYPE_OTHER);
			otherBalance.setSalesId(memberCard.getSalesId());
			
			//订单状态（暂定，现金直接已支付，如果是微信应该是回调）
			otherBalance.setBalanceStatus(IDBConstant.BALANCE_STATUS_ALL);
			baseDao.save(otherBalance, null);
			/*OtherInvoice invoice = new OtherInvoice();
			invoice.setInvoiceNo(otherBalance.getBalanceNo());
			invoice.setSalesId(memberCard.getSalesId());
			invoice.setInvoiceServiceType(IDBConstant.BALANCE_SERVICE_TYPE_REG);
			invoice.setInvoiceServiceId(userMember.getMemberId());
			//保存发票信息
			data.put("invoiceId", saveInvoice(invoice));*/
		}else{
			memberCard = getMemberCards(memberCard.getMemberId()).get(0);
			otherBalance = getOtherBalance(IDBConstant.BALANCE_SERVICE_TYPE_REG, memberCard.getCardId());
			data.put("invoiceId", getInvoice(IDBConstant.BALANCE_SERVICE_TYPE_REG, userMember.getMemberId()).getInvoiceId());
		}
		data.put("cardId", memberCard.getCardId());
		data.put("balanceNo", otherBalance.getBalanceNo());
		data.put("balanceServiceType", otherBalance.getBalanceServiceType());
		data.put("balanceServiceTypeName", dictService.getDictValueByNameKey(IDBConstant.BALANCE_SERVICE_TYPE, otherBalance.getBalanceServiceType()));
		data.put("createTime", otherBalance.getCreateTime());
		data.put("balanceStatusName", dictService.getDictValueByNameKey(IDBConstant.BALANCE_STATUS, otherBalance.getBalanceStatus()));
		return data;
	}
	
	@Override
	public List<Map<String, Object>> getMemberCarTypeNames(MemberInputView memberInputView) {
		String cardType = memberInputView.getCardType();
		
		StringBuilder sql = new StringBuilder("SELECT cardTypeId, cardTypeName FROM member_card_type WHERE cardTypeStatus = ").append(IDBConstant.LOGIC_STATUS_YES);
		if(StrUtil.isNotBlank(cardType)){
			sql.append(" AND cardType = :cardType");
		}
		return baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(memberInputView));
	}
	
	@Override
	public List<MemberCard> getMemberCards(int memberId){
		return baseDao.queryByHql("FROM MemberCard WHERE memberId=?", memberId);
	}
	
	@Override
	public MemberCard getMemberCard(String cardNo){
		return baseDao.queryByHqlFirst("FROM MemberCard WHERE cardNo=?", cardNo);
	}
	
	@Override
	public OtherBalance getOtherBalance(String balanceServiceType, Integer balanceServiceId){
		return baseDao.queryByHqlFirst("FROM OtherBalance WHERE balanceServiceType=? AND balanceServiceId=?", balanceServiceType, balanceServiceId);
	}
	
	@Override
	public PageBean getMemberCarTypes(MemberInputView memberInputView) {
		String cardTypeStatus = memberInputView.getCardTypeStatus();
		StringBuilder headSql = new StringBuilder("SELECT uo.operatorName, cardTypeId, cardType, cardTypeAhead, cardTypeCredit, cardTypeName, cardTypeStatus, cardTypeMonth, cardTypeMoney, cardTypeDiscount, cardTypeWeek, cardTypeTimeStart, cardTypeTimeEnd, salesId, cardDeposit, DATE_FORMAT(mct.createTime,'%Y-%m-%d') createTime");
		StringBuilder bodySql = new StringBuilder(" FROM member_card_type mct, user_operator uo");
		StringBuilder whereSql = new StringBuilder(" WHERE mct.salesId=uo.id");
		if(StrUtil.isNotBlank(cardTypeStatus)){
			whereSql.append(" AND cardTypeStatus = :cardTypeStatus");
		}
		/*if(!super.isAdmin(memberInputView)){
			bodySql.append(", user_operator uo");
			whereSql.append(" AND mct.salesId = uo.id");
		}*/
		return super.getPageBean(headSql, bodySql, whereSql, memberInputView);
	}
	
	@Override
	public MemberCardType getMemberCardType(int cardTypeId) {
		return baseDao.queryByHqlFirst("FROM MemberCardType WHERE cardTypeId = ?", cardTypeId);
	}
	
	@Override
	public Map<String, Object> getMemberCardTypeMap(int cardTypeId) {
		Map<String, Object> memberCardType = baseDao.queryBySqlFirst("SELECT cardTypeId, cardTypeName, cardTypeMonth, cardTypeAhead, cardTypeCredit, cardType, cardTypeMoney, cardTypeDiscount, cardTypeWeek, cardTypeTimeStart, cardTypeTimeEnd, cardTypeStatus, cardDeposit FROM member_card_type WHERE cardTypeId = ?", cardTypeId);

		String cardTypeMonth = StrUtil.objToStr(memberCardType.get("cardTypeMonth"));
        memberCardType.put("cardDeadline", DateUtil.getAddMonth(cardTypeMonth));
		return memberCardType;
	}
	
	@Override
	public UserMember getUserMember(int memberId) {
		return baseDao.getToEvict(UserMember.class, memberId);
	}
	
	@Override
	public MemberCard getMemberCard(int cardId) {
		return baseDao.getToEvict(MemberCard.class, cardId);
	}
	
	@Override
	public Integer saveInvoice(OtherInvoice invoice) {
		//OtherInvoice invoiceDB = getInvoice(invoice.getInvoiceServiceType(), invoice.getInvoiceServiceId());
		boolean isPrint = IDBConstant.LOGIC_STATUS_YES.equals(invoice.getInvoiceState());
		if(isPrint){ //打印
			invoice.setPrintTime(DateUtil.getNowDate());
		}
		if(invoice.getInvoiceId() != null){ //修改
			OtherInvoice invoiceDB = getInvoice(invoice.getInvoiceId());
			if(invoiceDB != null && IDBConstant.LOGIC_STATUS_YES.equals(invoiceDB.getInvoiceState())) throw new MessageException("已经打印过了！");
			invoiceDB.setInvoiceHeader(invoice.getInvoiceHeader());
			invoiceDB.setInvoiceContent(invoice.getInvoiceContent());
			invoiceDB.setInvoiceMoney(invoice.getInvoiceMoney());
			invoiceDB.setInvoiceRemark(invoice.getInvoiceRemark());
            invoiceDB.setInvoiceType(invoice.getInvoiceType());
			invoiceDB.setInvoiceState(invoice.getInvoiceState()!=null?invoice.getInvoiceState():IDBConstant.LOGIC_STATUS_NO);
			invoiceDB.setPrintTime(invoice.getPrintTime());
			baseDao.save(invoiceDB, invoiceDB.getInvoiceId());
		}else{ //新建
			invoice.setCreateTime(DateUtil.getNowDate());
			invoice.setInvoiceOpenState(IDBConstant.LOGIC_STATUS_NO); //默认未开
			invoice.setInvoiceState(IDBConstant.LOGIC_STATUS_NO); //默认未打印(领取)，改变状态需要结合打印机状态
			//invoice.setInvoiceNo(getInvoiceNo()); //发票的流水号和订单的流水号是一个不是两个
			baseDao.save(invoice, null);
		}
		if(isPrint){
			//调用打印接口
		}
		return invoice.getInvoiceId();
	}
	
	@Override
	public OtherInvoice getInvoice(String serviceType, int serviceId) {
		return baseDao.queryByHqlFirst("FROM OtherInvoice WHERE invoiceServiceType=? AND invoiceServiceId=?", serviceType, serviceId);
	}
	
	@Override
	public OtherInvoice getInvoice(int invoiceId) {
		return baseDao.queryByHqlFirst("FROM OtherInvoice WHERE invoiceId=?", invoiceId);
	}
	
	@Override
	public PageBean getUserMembers(MemberInputView memberInputView) {
		String memberMobile = memberInputView.getMemberMobile();
		String memberIdcard = memberInputView.getMemberIdcard();
		String cardNo = memberInputView.getCardNo();
		String cardTypeId = memberInputView.getCardTypeId();
		String memberType = memberInputView.getMemberType();
		
		StringBuilder headSql = new StringBuilder("SELECT uo.operatorName, um.memberId, mc.cardId, um.memberName, um.memberMobile, um.memberIdcard, mc.cardNo, mc.cardTypeId, mc.cardDeadline, mc.cardBalance, mc.cardStatus, mc.salesId, um.createTime, tempCardNo, (SELECT COUNT(1) FROM user_member umc WHERE umc.parentMemberId=um.memberId) childrenCount");
		StringBuilder bodySql = new StringBuilder(" FROM user_member um");
		bodySql.append(" LEFT JOIN member_card mc ON(um.memberId = mc.memberId)");
		bodySql.append(" LEFT JOIN user_operator uo ON(um.salesId = uo.id)");
		StringBuilder whereSql = new StringBuilder(" WHERE um.parentMemberId IS NULL AND um.memberStatus = ").append(IDBConstant.LOGIC_STATUS_YES);
		if(StrUtil.isNotBlank(memberMobile)){
			whereSql.append(" AND um.memberMobile = :memberMobile");
		}
		if(StrUtil.isNotBlank(memberIdcard)){
			whereSql.append(" AND um.memberIdcard = :memberIdcard");
		}
		if(StrUtil.isNotBlank(cardNo)){
			whereSql.append(" AND mc.cardNo = :cardNo");
		}
		if(StrUtil.isNotBlank(cardTypeId)){
			if(memberInputView.isCommonCard()){
				whereSql.append(" AND (mc.cardTypeId = :cardTypeId OR mc.cardTypeId IS NULL)");
			}else{
				whereSql.append(" AND mc.cardTypeId = :cardTypeId");
			}
		}
		if(StrUtil.isNotBlank(memberType)){
			whereSql.append(" AND um.memberType = :memberType");
		}
		whereSql.append(" ORDER BY um.createTime DESC");
		PageBean pageBean = super.getPageBean(headSql, bodySql, whereSql, memberInputView);
		List<Map<String, Object>> list = pageBean.getList();
		for(Map<String, Object> map : list){
			map.put("cardTypeName", baseDao.getUniqueObjectResult("SELECT cardTypeName FROM member_card_type WHERE cardTypeId = ?", map.get("cardTypeId")));
			getType(map);
		}
		return pageBean;
	}

	@Override
	public Map<String, Object> getUserMemberAndCard(int memberId) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT operatorName, um.memberId, mc.cardId, um.memberName, um.memberType, um.memberSex, um.memberBirthday, um.memberAddress, um.memberRemark, um.memberMobile, um.memberMobile2, um.memberIdcard, mc.cardNo, mc.cardTypeId, mc.cardDeadline, mc.cardBalance, mc.cardStatus, mc.salesId, DATE_FORMAT(mc.createTime,'%Y-%m-%d') createTime, mct.cardTypeDiscount, mct.cardTypeWeek, mct.cardTypeTimeStart, mct.cardTypeTimeEnd, mct.cardTypeName");
		sql.append(" FROM user_member um");
		sql.append(" LEFT JOIN member_card mc ON(um.memberId = mc.memberId)");
		sql.append(" LEFT JOIN member_card_type mct ON(mc.cardTypeId = mct.cardTypeId)");
		sql.append(" LEFT JOIN user_operator uo ON(mc.salesId = uo.id)");
		sql.append(" WHERE um.memberId = ?");
		Map<String, Object> memberMap = baseDao.queryBySqlFirst(sql.toString(), memberId);
		if(memberMap == null) throw new MessageException("会员信息不存在！");
		return getType(memberMap);
	}
	
	@Override
	public Integer saveMemberCardType(MemberCardType memberCardType) {
		//String[] cardTypeTimes = memberCardType.getCardTypeTime().split("-");
		if(memberCardType.getCardTypeId() == null){
			if(baseDao.getUniqueObjectResult("SELECT 1 FROM member_card_type WHERE cardTypeName = ?", memberCardType.getCardTypeName()) != null) throw new MessageException("会员卡类型名称已存在！");
		}
		/*memberCardType.setCardTypeTimeStart(cardTypeTimes[0]);
		memberCardType.setCardTypeTimeEnd(cardTypeTimes[1]);*/
		memberCardType.setCreateTime(DateUtil.getNowDate());
		baseDao.save(memberCardType, memberCardType.getCardTypeId());
		return memberCardType.getCardTypeId();
	}
	
	@Override
	public Integer updateMemberCardUpLevel(MemberCardOpInputView memberCardOpInputView) {
		String cardId = memberCardOpInputView.getCardId();
		String cardTypeId = memberCardOpInputView.getCardTypeId();
		String balanceStyle = memberCardOpInputView.getBalanceStyle();
		Double upLevelMoney = StrUtil.objToDouble(memberCardOpInputView.getUpLevelMoney());
		Double subMoney = StrUtil.objToDoubleDef0(memberCardOpInputView.getSubMoney());
		Double givingAmount = StrUtil.objToDoubleDef0(memberCardOpInputView.getGivingAmount());
		String remark = memberCardOpInputView.getRemark();
		int salesId = StrUtil.objToInt(memberCardOpInputView.getSalesId());
		MemberCard memberCard = getMemberCard(StrUtil.objToInt(cardId));
		if(memberCard == null) throw new MessageException("会员卡信息不存在！");
		MemberCardType memberCardType = getMemberCardType(StrUtil.objToInt(cardTypeId));
		if(memberCardType == null) throw new MessageException("会员卡类型不存在！");
		if(cardTypeId.equals(StrUtil.objToStr(memberCard.getCardTypeId()))) throw new MessageException("当前会员卡已经是此类型！");
		String nowDate = DateUtil.getNowDate();
		memberCard.setCardDeadline(DateUtil.cardDeadline(memberCardType.getCardTypeMonth())); //会员卡升级，根据新会员卡类型重新计算会员卡截至日期
		memberCard.setCardTypeId(memberCardType.getCardTypeId());
		memberCard.setCardStatus(IDBConstant.LOGIC_STATUS_YES); //升级会员卡后，默认会员卡为可用状态
		memberCard.setSalesId(salesId); //升级会员卡后，操作员覆盖为当前的
		memberCard.setUpdateTime(nowDate);
		memberCard.setCardRemark(remark);
		memberCard.setCardBalance(memberCard.getCardBalance()+givingAmount);
		baseDao.save(memberCard, memberCard.getCardId());
		OtherBalance balance = new OtherBalance();
		balance.setBalanceNo(getBalanceNo());
		balance.setBalanceServiceId(memberCard.getCardId());
		balance.setBalanceServiceType(IDBConstant.BALANCE_SERVICE_TYPE_CARD_UP);
		balance.setBalanceStyle(balanceStyle);
		balance.setOldAmount(upLevelMoney);
		balance.setSubAmount(subMoney);
		balance.setRealAmount(balance.getOldAmount()-balance.getSubAmount());
		balance.setGivingAmount(givingAmount);
		balance.setBalanceType(IDBConstant.BALANCE_TYPE_OTHER);
		balance.setServiceDate(nowDate);
		balance.setCreateTime(nowDate);
		balance.setRemark(remark);
		balance.setSalesId(salesId);
		baseDao.save(balance, null);
		return memberCard.getCardId();
	}
	
	@Override
	public Map<String, Object> updateMemberCardCZ(MemberCardOpInputView memberCardOpInputView) {
		String cardId = memberCardOpInputView.getCardId();
		String balanceStyle = memberCardOpInputView.getBalanceStyle();
		Double czMoney = StrUtil.objToDouble(memberCardOpInputView.getCzMoney());
		Double subMoney = StrUtil.objToDoubleDef0(memberCardOpInputView.getSubMoney());
		Double givingAmount = StrUtil.objToDoubleDef0(memberCardOpInputView.getGivingAmount());
		String remark = memberCardOpInputView.getRemark();
		Integer salesId = memberCardOpInputView.getSalesId();
		String balanceCheckNo = memberCardOpInputView.getBalanceCheckNo();
		
		MemberCard memberCard = getMemberCard(StrUtil.objToInt(cardId));
		if(memberCard == null) throw new MessageException("会员卡信息不存在！");
		
		String nowDate = DateUtil.getNowDate();
		
		memberCard.setCardBalance(memberCard.getCardBalance()+czMoney+givingAmount);
		memberCard.setUpdateTime(nowDate);
		baseDao.save(memberCard, memberCard.getCardId());
		
		OtherBalance balance = new OtherBalance();
		balance.setBalanceNo(getBalanceNo());
		balance.setBalanceServiceId(memberCard.getCardId());
		balance.setBalanceServiceType(IDBConstant.BALANCE_SERVICE_TYPE_CARD_CZ);
		balance.setBalanceStyle(balanceStyle);
		balance.setOldAmount(czMoney);
		balance.setSubAmount(subMoney);
		balance.setRealAmount(czMoney-subMoney);
		balance.setGivingAmount(givingAmount);
		balance.setBalanceType(IDBConstant.BALANCE_TYPE_CZ);
		balance.setServiceDate(nowDate);
		balance.setCreateTime(nowDate);
		balance.setRemark(remark);
		balance.setSalesId(salesId);
		balance.setBalanceCheckNo(balanceCheckNo);
		balance.setBalanceStatus(IDBConstant.BALANCE_STATUS_ALL);
		baseDao.save(balance, null);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("cardId", memberCard.getCardId());
		resultMap.put("balanceNo", balance.getBalanceNo());
		resultMap.put("balanceServiceType", balance.getBalanceServiceType());
		resultMap.put("balanceServiceTypeName", dictService.getDictValueByNameKey(IDBConstant.BALANCE_SERVICE_TYPE, balance.getBalanceServiceType()));
		resultMap.put("createTime", balance.getCreateTime());
		resultMap.put("balanceStatusName", dictService.getDictValueByNameKey(IDBConstant.BALANCE_STATUS, balance.getBalanceStatus()));
		
		return resultMap;
	}
	
	@Override
	public Integer updateMemberCardBuBan(MemberCardOpInputView memberCardOpInputView) {
		String cardId = memberCardOpInputView.getCardId();
		String balanceStyle = memberCardOpInputView.getBalanceStyle();
		Double buBanMoney = StrUtil.objToDouble(memberCardOpInputView.getBuBanMoney());
		Double subMoney = StrUtil.objToDoubleDef0(memberCardOpInputView.getSubMoney());
		Double givingAmount = StrUtil.objToDoubleDef0(memberCardOpInputView.getGivingAmount());
		String newCardNo = memberCardOpInputView.getNewCardNo();
		String remark = memberCardOpInputView.getRemark();
		int salesId = StrUtil.objToInt(memberCardOpInputView.getSalesId());
		MemberCard memberCard = getMemberCard(StrUtil.objToInt(cardId));
		if(memberCard == null) throw new MessageException("会员卡信息不存在！");
		
		if(!availableCardNo(newCardNo)) throw new MessageException("会员卡号重复，请重新输入！");
		
		String nowDate = DateUtil.getNowDate();
		
		memberCard.setCardStatus(IDBConstant.LOGIC_STATUS_YES); //补办会员卡后，默认会员卡为可用状态
		memberCard.setSalesId(salesId); //补办会员卡后，操作员覆盖为当前的
		memberCard.setUpdateTime(nowDate);
		memberCard.setCardRemark(remark);
		memberCard.setCardBalance((memberCard.getCardBalance()!=null?memberCard.getCardBalance():0)+givingAmount);
		memberCard.setCardNo(newCardNo); //补办新创建会员卡号
		baseDao.save(memberCard, memberCard.getCardId());
		
		OtherBalance balance = new OtherBalance();
		balance.setBalanceNo(getBalanceNo());
		balance.setBalanceServiceId(memberCard.getCardId());
		balance.setBalanceServiceType(memberCardOpInputView.getBalanceServiceType());
		balance.setBalanceStyle(balanceStyle);
		balance.setOldAmount(buBanMoney);
		balance.setSubAmount(subMoney);
		balance.setRealAmount(buBanMoney-balance.getSubAmount());
		balance.setGivingAmount(givingAmount);
		balance.setBalanceType(IDBConstant.BALANCE_TYPE_OTHER);
		balance.setServiceDate(nowDate);
		balance.setCreateTime(nowDate);
		balance.setRemark(remark);
		balance.setSalesId(salesId);
		baseDao.save(balance, null);
		return memberCard.getCardId();
	}
	
	@Override
	public PageBean getBalances(BalanceInputView balanceInputView) {
		String balanceType = balanceInputView.getBalanceType();
		String createTimeStart = balanceInputView.getCreateTimeStart();
		String createTimeEnd = balanceInputView.getCreateTimeEnd();
		String memberMobile = balanceInputView.getMemberMobile();
		String cardId = balanceInputView.getCardId();
		String balanceServiceType = balanceInputView.getBalanceServiceType();
		
		StringBuilder headSql = new StringBuilder("SELECT * ");
		StringBuilder bodySql = new StringBuilder(" FROM(SELECT balanceId,balanceType,balanceCheckNo,memberMobile,cardId, balanceNo, memberName, balanceServiceType, balanceStyle, balanceServiceName, mc.cardNo, oldAmount, realAmount,givingAmount,mc.cardBalance,balanceStatus,ob.salesId,uo.operatorName,DATE_FORMAT(ob.createTime, '%Y-%m-%d') createTime, ob.createTime opCreateTime FROM other_balance ob, member_card mc, user_member um, user_operator uo WHERE ob.balanceServiceId = mc.cardId AND CAST(ob.balanceServiceType AS signed INTEGER) >= ${one} AND CAST(ob.balanceServiceType AS signed INTEGER) <= ${two} AND mc.memberId = um.memberId AND ob.salesId = uo.id AND mc.memberId = :memberId UNION ALL SELECT balanceId,balanceType,balanceCheckNo,memberMobile,cardId, balanceNo, memberName, balanceServiceType, balanceStyle, balanceServiceName, mc.cardNo, oldAmount, realAmount, givingAmount, mc.cardBalance, balanceStatus, ob.salesId, uo.operatorName, DATE_FORMAT(ob.createTime, '%Y-%m-%d') createTime, ob.createTime opCreateTime FROM other_balance ob, order_info oi, member_card mc, user_member um, user_operator uo WHERE ob.balanceServiceId = oi.orderId AND oi.memberId = um.memberId AND CAST(ob.balanceServiceType AS signed INTEGER) >= ${three} AND CAST(ob.balanceServiceType AS signed INTEGER) <= ${four} AND mc.memberId = um.memberId AND ob.salesId = uo.id AND mc.memberId = :memberId) t ");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
		if(StrUtil.isNotBlank(balanceType)){
			whereSql.append(" AND balanceType IN(:balanceTypeArr)");
		}
		if(StrUtil.isNotBlank(createTimeStart)){
			whereSql.append(" AND createTime >= :createTimeStart");
		}
		if(StrUtil.isNotBlank(createTimeEnd)){
			whereSql.append(" AND createTime <= :createTimeEnd");
		}
		if(StrUtil.isNotBlank(memberMobile)){
			whereSql.append(" AND memberMobile = :memberMobile");
		}
		if(StrUtil.isNotBlank(cardId)){
			whereSql.append(" AND cardId = :cardId");
		}
		if(StrUtil.isNotBlank(balanceServiceType)){
			whereSql.append(" AND balanceServiceType = :balanceServiceType");
		}
		whereSql.append(" ORDER BY opCreateTime DESC");
		
		StringBuilder bodySql2 = new StringBuilder(bodySql.toString().replace("${one}", IDBConstant.BALANCE_SERVICE_TYPE_REG).replace("${two}", IDBConstant.BALANCE_SERVICE_TYPE_CARD_BUBAN_STUDENT).replace("${three}", IDBConstant.BALANCE_SERVICE_TYPE_SITE).replace("${four}", IDBConstant.BALANCE_SERVICE_TYPE_GOODS));
		
		PageBean pageBean = super.getPageBean(headSql, bodySql2, whereSql, balanceInputView, SQLUtil.getInToSQL("balanceTypeArr", balanceType));
		List<Map<String, Object>> list = pageBean.getList();
		for(Map<String, Object> map : list){ 
			map.put("balanceServiceTypeName", dictService.getDictValueByNameKey(IDBConstant.BALANCE_SERVICE_TYPE, StrUtil.objToStr(map.get("balanceServiceType"))));
			map.put("balanceStyleName", dictService.getDictValueByNameKey(IDBConstant.BALANCE_STYLE, StrUtil.objToStr(map.get("balanceStyle"))));
		}
		return pageBean;
	}
	
	@Override
	public PageBean getInvoices(InvoiceInputView invoiceInputView){
		String invoiceHeader = invoiceInputView.getInvoiceHeader();
		String invoiceState = invoiceInputView.getInvoiceState();
        String invoiceOpenState = invoiceInputView.getInvoiceOpenState();
		
		StringBuilder headSql = new StringBuilder("SELECT oi.*, uo.operatorName");
		StringBuilder bodySql = new StringBuilder(" FROM other_invoice oi, user_operator uo");
		StringBuilder whereSql = new StringBuilder(" WHERE oi.salesId = uo.id");
		
		if(StrUtil.isNotBlank(invoiceState)){
			whereSql.append(" AND invoiceState = :invoiceState");
		}
        if(StrUtil.isNotBlank(invoiceOpenState)){
            whereSql.append(" AND invoiceOpenState = :invoiceOpenState");
        }
		if(StrUtil.isNotBlank(invoiceHeader)){
			whereSql.append(" AND invoiceHeader = :invoiceHeader");
		}
		whereSql.append(" ORDER BY oi.createTime DESC");
		return super.getPageBean(headSql, bodySql, whereSql, invoiceInputView);
	}
	
	@Override
	public void updateOpenInvoices(String invoiceIds) {
		String[] invoiceIdArr = invoiceIds.split(",");
		if(ArrayUtils.isEmpty(invoiceIdArr)) throw new MessageException("请选择发票进行操作！");
		Map params = SQLUtil.getInToSQL("invoiceIdArr", invoiceIdArr);
		params.put("invoiceOpenState", IDBConstant.LOGIC_STATUS_YES);
		baseDao.updateBySql("UPDATE other_invoice o SET invoiceOpenState=:invoiceOpenState, openTime=NOW() WHERE o.invoiceId IN(:invoiceIdArr)", params);
	}
	
	@Override
	public void updateGetInvoices(String invoiceIds) {
		String[] invoiceIdArr = invoiceIds.split(",");
		if(ArrayUtils.isEmpty(invoiceIdArr)) throw new MessageException("请选择发票进行操作！");
		Map params = SQLUtil.getInToSQL("invoiceIdArr", invoiceIdArr);
		params.put("invoiceState", IDBConstant.LOGIC_STATUS_YES);
        params.put("invoiceOpenState", IDBConstant.LOGIC_STATUS_YES);
		baseDao.updateBySql("UPDATE other_invoice o SET invoiceState=:invoiceState, invoiceOpenState=:invoiceOpenState, printTime=NOW() WHERE o.invoiceId IN(:invoiceIdArr)", params);
	}
	
	@Override
	public Map<String, Object> getRegMember(int memberId) {
		return baseDao.queryBySqlFirst("SELECT memberId, memberName, memberMobile, memberType, tempCardNo FROM user_member WHERE memberId = ?", memberId);
	}
	
	@Override
	public Map<String, Object> getOperations(String cardNo){
		return baseDao.queryBySqlFirst("SELECT mc.cardId, um.memberId, mc.cardNo, um.memberName, um.memberMobile, mc.cardBalance, mc.cardDeadline, mc.cardTypeId FROM member_card mc, user_member um WHERE mc.memberId = um.memberId AND  mc.cardNo = ?", cardNo);
	}
	
	private Map<String, Object> getType(Map<String, Object> map) {
		map.put("cardStatusName", dictService.getDictValueByNameKey(IDBConstant.STATUS, StrUtil.objToStr(map.get("cardStatus"))));
		return map;
	}
	
	@Override
	public UserMember getMemberOperator(String operatorId) {
		return baseDao.queryByHqlFirst("FROM UserMember WHERE operatorId = ?", operatorId);
	}
	
	@Override
	public List<Map<String, Object>> getMemberNames(MemberInputView memberInputView){
		String memberName = memberInputView.getMemberName();
		StringBuffer sql = new StringBuffer("SELECT memberId, memberName, memberMobile FROM user_member WHERE 1=1");
		if(StrUtil.isNotBlank(memberName)){
			sql.append(" AND memberName = :memberName");
		}
		sql.append(" AND memberStatus = ").append(IDBConstant.LOGIC_STATUS_YES);
		return baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(memberInputView));
	}

	// 搜索可预订会员
	@Override
	public List<Map<String, Object>> searchMember(String search){
		if(StrUtil.isBlank(search)) throw new MessageException("请输入搜索条件");
		StringBuilder sql = new StringBuilder("SELECT um.memberId, memberName, memberMobile, mc.cardNo, mct.cardTypeName FROM user_member um, member_card mc, member_card_type mct");
		sql.append(" WHERE um.memberId = mc.memberId AND mc.cardTypeId = mct.cardTypeId");
		sql.append(" AND (memberMobile LIKE :search OR memberName LIKE :search OR memberIdcard LIKE :search OR mc.cardNo LIKE :search)");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("search", search+"%");
		return baseDao.queryBySql(sql.toString(), paramMap);
	}

    // 搜索可开场会员
    @Override
    public List<Map<String, Object>> searchOpenMember(String search){
        if(StrUtil.isBlank(search)) throw new MessageException("请输入搜索条件");
        StringBuilder sql = new StringBuilder("SELECT um.memberId, memberName, memberMobile, mc.cardNo FROM user_member um LEFT JOIN member_card mc");
        sql.append(" ON um.memberId = mc.memberId WHERE 1=1");
        sql.append(" AND (memberMobile LIKE :search OR memberName LIKE :search OR memberIdcard LIKE :search OR mc.cardNo LIKE :search)");
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("search", search+"%");
        return baseDao.queryBySql(sql.toString(), paramMap);
    }
	
	@Override
	public double getMemberDiscount(Integer memberId, String opType){
		if(IDBConstant.LOGIC_STATUS_YES.equals(opType) && memberId != null){ //会员打折
			//获取会员的会员卡，（如果后期有多张会员卡，则需要在前端用户选择哪张卡，把会员卡id传到后台查询折扣）
			List<MemberCard> memberCards = getMemberCards(memberId);
			if(memberCards != null && memberCards.size() > 0){ //memberCards.size()==0：没有会员卡按不打折计算   throw new MessageException("该用户没有绑定会员卡");
				MemberCardType memberCardType = getMemberCardType(memberCards.get(0).getCardTypeId());
				return memberCardType.getCardTypeDiscount() != null ? memberCardType.getCardTypeDiscount() : 100;
			}
		}
		return 100;
	}

	// type m1会员 m2教师 m3学生
	@Override
	public String getCardNo(int type) {
		do {
			StringBuffer no = new StringBuffer();
            no.append('m');
            no.append(type);
			for(int i = 0; i < 6; i++){
				no.append((int)(Math.random()*10));
			}
			if(availableCardNo(no.toString())) return no.toString(); 
		} while (true);
	}
	
	private boolean availableCardNo(String no){
		return baseDao.getUniqueResult("SELECT 1 FROM member_card WHERE cardNo = ?", no) == null;
	}
	
	@Override
	public String getBalanceNo(){
		return DateUtil.dateToString(new Date(), DateUtil.YYYYMMDD_HMS);
	}
	
	@Override
	public Map<String, Object> getMembersChildren(int memberId){
		UserMember userMember = getUserMember(memberId);
		if(userMember == null) throw new MessageException("操作错误");
		List<MemberCard> memberCards = getMemberCards(memberId);
		if(memberCards.size() == 0) throw new MessageException("该会员未绑定会员卡");
		Map<String, Object> memberMap = new HashMap<String, Object>();
		memberMap.put("cardNo", memberCards.get(0).getCardNo());
		memberMap.put("memberName", userMember.getMemberName());
		memberMap.put("memberId", userMember.getMemberId());
		
		List<Map<String, Object>> childrenMembers = baseDao.queryBySql("SELECT memberId, memberName, memberMobile FROM user_member WHERE parentMemberId = ? ORDER BY createTime DESC", memberId);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("member", memberMap);
		resultMap.put("childrenMembers", childrenMembers);
		
		return resultMap;
	}
	
	@Override
	public Integer saveChildrenMember(UserMember userMember){
		Integer parentMemberId = userMember.getParentMemberId();
		UserMember userMemberDB = getUserMember(parentMemberId);
		if(userMemberDB == null) throw new MessageException("父会员不存在，操作错误");
		if(!availableMobile(userMember.getMemberMobile())) throw new MessageException("会员手机号重复");
		String nowDate = DateUtil.getNowDate();
		userMember.setCreateTime(nowDate);
		userMember.setUpdateTime(nowDate);
		baseDao.save(userMember, userMember.getMemberId());
		return userMember.getMemberId();
	}
	
	@Override
	public void deleteChildrenMember(int memberId){
		UserMember userMember = getUserMember(memberId);
		if(userMember == null) throw new MessageException("操作错误");
		if(userMember.getParentMemberId() == null) throw new MessageException("该会员不是子会员");
		baseDao.delete(userMember);
	}
	
	@Override
	public boolean availableMobile(String mobile){
		Map<String, Object> map = baseDao.queryBySqlFirst("SELECT 1 FROM user_member WHERE memberMobile = ?", mobile);
		return map == null ? true : false;
	}
	
	@Override
	public UserMember getUserMemberByMobile(String mobile){
		return baseDao.queryByHqlFirst("FROM UserMember WHERE memberMobile = ?", mobile);
	}
	
	@Override
	public UserMember getUserMemberByChildMobile(String childMobile){
		UserMember userMember = getUserMemberByMobile(childMobile);
		if(userMember == null) throw new MessageException("会员手机不存在"); //可能是自己，也可能是子会员
		//if(userMember.getParentMemberId() == null) throw new MessageException("该手机不是子会员手机号");
		return userMember;
	}
	
	@Override
	public void updateLockTeacher(int memberId, int salesId){
		UserMember userMember = getUserMember(memberId);
		userMember.setMemberStatus(IDBConstant.LOGIC_STATUS_NO);
		userMember.setSalesId(salesId);
		baseDao.save(userMember, memberId);
	}
	
	@Override
	public Map<String, Object> countTeacher(MemberInputView memberInputView) throws Exception {
		
		int page = memberInputView.getPage();
		int pageSize = memberInputView.getPageSize();
		String siteType = memberInputView.getSiteType();
		String cardId = memberInputView.getCardId();
		String startTime = memberInputView.getStartTime();
		String endTime = memberInputView.getEndTime();
		
		StringBuilder sql = new StringBuilder("SELECT um.memberId, um.memberName, um.memberMobile, mss.createTime signTime, LEFT(TIMEDIFF(siteEndTime, siteStartTime),2) duration, siteStartTime, siteEndTime, uo.operatorName, mss.createTime opTime, ss.sportName");
		sql.append(" FROM user_member um, member_card mc, member_site_sign mss, site_reserve_time srt, user_operator uo, site_info si, site_sport ss");
		sql.append(" WHERE um.memberId = mc.memberId AND mc.cardNo = mss.signMemberCardNo AND mss.reserveTimeId = srt.reserveTimeId AND uo.id = mss.salesId AND srt.siteId = si.siteId AND si.siteType = ss.sportId");
		if(StrUtil.isNotBlank(siteType)){
			sql.append(" AND si.siteType = :siteType");
		}
		if(StrUtil.isNotBlank(cardId)){
			sql.append(" AND mc.cardId = :cardId");
		}
		if(StrUtil.isNotBlank(startTime)){
			sql.append(" AND mss.createTime >= :startTime");
		}
		if(StrUtil.isNotBlank(endTime)){
			sql.append(" AND mss.createTime <= :endTime");
		}
		List<Map<String, Object>> teacherCounts = baseDao.queryBySql(sql.toString(), JsonUtils.fromJson(memberInputView));
		
		PageBean pageBean = new PageBean(teacherCounts, page, pageSize, teacherCounts.size());
		pageBean.pagedList().init();
		
		List<Map<String, Object>> typeCountList = new ArrayList<Map<String, Object>>();
		Map<String, Object> all = new HashMap<String, Object>();
		typeCountList.add(all);
		
		for(Map<String, Object> map : teacherCounts){
			String sportName = StrUtil.objToStr(map.get("sportName"));
			int hourNums = DateUtil.getTimeHourNums(StrUtil.objToStr(map.get("siteStartTime")), StrUtil.objToStr(map.get("siteEndTime")));
			int index = getTypeIndex(typeCountList, sportName);
			if(index == 0){
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("sportName", sportName);
				m.put("typeCount", 1);
				m.put("typeTime", hourNums);
				typeCountList.add(m);
			}else{
				Map<String, Object> m = typeCountList.get(index);
				m.put("typeCount", StrUtil.objToInt(map.get("typeCount"))+1);
				m.put("typeTime", StrUtil.objToInt(map.get("typeTime"))+hourNums);
			}
			all.put("sportName", "全部");
			all.put("typeCount", all.get("typeCount")!=null?StrUtil.objToInt(all.get("typeCount"))+1:1);
			all.put("typeTime", all.get("typeTime")!=null?StrUtil.objToInt(all.get("typeTime"))+hourNums:hourNums);
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("pageBean", pageBean);
		resultMap.put("itemCounts", typeCountList);
		return resultMap;
	}
	
	@Override
	public Integer saveBalanceByOrderInfo(OrderInfo orderInfo){
		String nowDate = DateUtil.getNowDate();
		OtherBalance balance = new OtherBalance();
		balance.setBalanceNo(getBalanceNo());
		balance.setBalanceServiceId(orderInfo.getOrderId());
		balance.setBalanceServiceType(orderInfo.getOrderServiceType());
		balance.setBalanceStyle(orderInfo.getPayType());
		balance.setOldAmount(orderInfo.getOrderSumPrice());
		balance.setSubAmount(orderInfo.getSubAmount());
		balance.setRealAmount(orderInfo.getPaySumPrice());
		balance.setBalanceType(IDBConstant.BALANCE_TYPE_OTHER);
		balance.setServiceDate(nowDate);
		balance.setCreateTime(nowDate);
		balance.setSalesId(orderInfo.getSalesId());
		balance.setBalanceStatus(IDBConstant.BALANCE_STATUS_ALL);
		baseDao.save(balance, null);
		return balance.getBalanceId();
	}
	
	@Override
	public MemberCard getMemberCardNotThrow(int memberId){
		List<MemberCard> memberCards = getMemberCards(memberId);
		if(memberCards.size() == 0) throw new MessageException("该会员没有会员卡信息");
		return memberCards.get(0);
	}
	
	@Override
	public UserMember getMemberByCardNo(String cardNo){
		return baseDao.queryByHqlFirst("SELECT um FROM UserMember um, MemberCard mc WHERE um.memberId = mc.memberId AND mc.cardNo = ?", cardNo);
	}
	
	private int getTypeIndex(List<Map<String, Object>> typeCountList, String sportName){
		int index = 0;
		for(Map<String, Object> map : typeCountList){
			if(map.get("sportName").equals(sportName)) return index;
			index++;
		}
		return 0;
	}
	
}



