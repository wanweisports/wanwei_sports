package com.park.service;

import java.util.List;
import java.util.Map;

import com.park.common.bean.BalanceInputView;
import com.park.common.bean.InvoiceInputView;
import com.park.common.bean.MemberCardOpInputView;
import com.park.common.bean.MemberInputView;
import com.park.common.bean.PageBean;
import com.park.common.po.MemberCard;
import com.park.common.po.MemberCardType;
import com.park.common.po.OrderInfo;
import com.park.common.po.OtherBalance;
import com.park.common.po.OtherInvoice;
import com.park.common.po.UserMember;


public interface IMemberService {
	
	public Integer saveMember(UserMember userMember);
	
	public void updateMemberName(UserMember userMember);
	
	public Map<String, Object> saveMemberCar(MemberCard memberCard, OtherBalance otherBalance);
	
	public List<Map<String, Object>> getMemberCarTypeNames(MemberInputView memberInputView);
	
	public List<MemberCard> getMemberCards(int memberId);
	
	public MemberCard getMemberCard(String cardNo);
	
	public OtherBalance getOtherBalance(String balanceServiceType, Integer balanceServiceId);
	
	public PageBean getMemberCarTypes(MemberInputView memberInputView);
	
	public MemberCardType getMemberCardType(int cardTypeId);
	
	public Map<String, Object> getMemberCardTypeMap(int cardTypeId);
	
	public UserMember getUserMember(int memberId);
	
	public MemberCard getMemberCard(int cardId);
	
	public Integer saveInvoice(OtherInvoice invoice);
	
	public OtherInvoice getInvoice(String serviceType, int serviceId);
	
	public OtherInvoice getInvoice(int invoiceId);
	
	public PageBean getUserMembers(MemberInputView memberInputView);
	
	public Map<String, Object> getUserMemberAndCard(int memberId);
	
	public Integer saveMemberCardType(MemberCardType memberCardType);

	public Integer updateMemberCardUpLevel(MemberCardOpInputView memberCardOpInputView);
	
	public Integer updateMemberCardCZ(MemberCardOpInputView memberCardOpInputView);
	
	public Integer updateMemberCardBuBan(MemberCardOpInputView memberCardOpInputView);
	
	public PageBean getBalances(BalanceInputView balanceInputView);
	
	public PageBean getInvoices(InvoiceInputView invoiceInputView);
	
	public void updateOpenInvoices(String invoiceIds);
	
	public void updateGetInvoices(String invoiceIds);
	
	public Map<String, Object> getRegMember(int memberId);
	
	public Map<String, Object> getOperations(String cardNo);

	public UserMember getMemberOperator(String operatorId);
	
	public List<Map<String, Object>> getMemberNames(MemberInputView memberInputView);
	
	public double getMemberDiscount(Integer memberId, String opType);
	
	public String getCardNo();
	
	public List<Map<String, Object>> searchMember(String search);

	public List<Map<String, Object>> searchOpenMember(String search);
	
	public String getBalanceNo();
	
	public Map<String, Object> getMembersChildren(int memberId);
	
	public void deleteChildrenMember(int memberId);
	
	public Integer saveChildrenMember(UserMember userMember);
	
	public boolean availableMobile(String mobile);
	
	public UserMember getUserMemberByMobile(String mobile);
	
	public UserMember getUserMemberByChildMobile(String childMobile);
	
	public void updateLockTeacher(int memberId, int salesId);
	
	public Map<String, Object> countTeacher(MemberInputView memberInputView) throws Exception ;
	
	public Integer saveBalanceByOrderInfo(OrderInfo orderInfo);
	
	public MemberCard getMemberCardNotThrow(int memberId);
	
	public UserMember getMemberByCardNo(String cardNo);
	
}
