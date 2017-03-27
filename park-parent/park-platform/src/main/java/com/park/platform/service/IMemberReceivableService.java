package com.park.platform.service;

import com.park.common.bean.MemberInputView;
import com.park.common.bean.PageBean;
import com.park.common.po.MemberReceivable;

public interface IMemberReceivableService {

	public MemberReceivable getMemberReceivable(int receivableId);
	
	public Integer saveMemberReceivable(MemberReceivable memberReceivable, double payPrice, int payCount, String payType);
	
	public PageBean getMemberReceivables(MemberInputView memberInputView);
	
}
