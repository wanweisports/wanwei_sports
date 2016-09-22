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
import com.park.common.po.OtherBalance;
import com.park.common.po.OtherInvoice;
import com.park.common.po.UserMember;


public interface IMemberService {
	
	public Integer saveMember(UserMember userMember);
	
	public Map<String, Object> saveMemberCar(MemberCard memberCard, OtherBalance otherBalance);
	
	public List<Map<String, Object>> getMemberCarTypes();
	
	public MemberCardType getMemberCardType(int cardTypeId);
	
	public Map<String, Object> getMemberCardTypeMap(int cardTypeId);
	
	public UserMember getUserMember(int memberId);
	
	public MemberCard getMemberCard(int cardId);
	
	public Integer saveInvoice(OtherInvoice invoice);
	
	public OtherInvoice getInvoice(String serviceType, int serviceId);
	
	public PageBean getUserMembers(MemberInputView memberInputView);
	
	public Map<String, Object> getUserMemberAndCard(int memberId);
	
	public Integer saveMemberCardType(MemberCardType memberCardType);

	public Integer updateMemberCardUpLevel(MemberCardOpInputView memberCardOpInputView);
	
	public Integer updateMemberCardCZ(MemberCardOpInputView memberCardOpInputView);
	
	public Integer updateMemberCardBuBan(MemberCardOpInputView memberCardOpInputView);
	
	public PageBean getBalances(BalanceInputView balanceInputView);
	
	public PageBean getInvoices(InvoiceInputView invoiceInputView);
	
	public void updateGetInvoices(String invoiceIds);
}