package com.park.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.MemberInputView;
import com.park.common.bean.PageBean;
import com.park.common.exception.MessageException;
import com.park.common.po.MemberReceivable;
import com.park.common.po.OrderInfo;
import com.park.common.util.DateUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IMemberReceivableService;
import com.park.service.IOrderService;

@Service
public class MemberReceivableServiceImpl extends BaseService implements IMemberReceivableService {

	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IOrderService orderService;
	
	@Override
	public Integer saveMemberReceivable(MemberReceivable memberReceivable, double payPrice, int payCount, String payType){
		String nowDate = DateUtil.getNowDate();
		if(memberReceivable.getReceivableId() == null){
			memberReceivable.setCreateTime(nowDate);
			baseDao.save(memberReceivable, null);
			return memberReceivable.getReceivableId();
		}
		int receivableId = memberReceivable.getReceivableId();
		MemberReceivable memberReceivableDB = getMemberReceivable(receivableId);
		if(memberReceivableDB == null) throw new MessageException("该应收款不存在");
		memberReceivableDB.setUpdateTime(nowDate);
		baseDao.save(memberReceivableDB, receivableId);
		
		//订单价格变化
		OrderInfo orderInfo = orderService.getOrderInfo(memberReceivableDB.getOrderId());
		if(orderInfo == null) throw new MessageException("订单不存在");
		orderInfo.setPayCount(orderInfo.getPayCount() + payCount);
		orderInfo.setPaySumPrice(orderInfo.getPaySumPrice() + payPrice);
		baseDao.save(orderInfo, orderInfo.getOrderId());
		if(orderInfo.getSumCount() >= orderInfo.getPayCount()){ //应付款结清，删除此应收款
			baseDao.delete(memberReceivableDB);
		}
		return receivableId;
	}
	
	@Override
	public MemberReceivable getMemberReceivable(int receivableId){
		return baseDao.getToEvict(MemberReceivable.class, receivableId);
	}
	
	@Override
	public PageBean getMemberReceivables(MemberInputView memberInputView){
		String memberName = memberInputView.getMemberName();
		String cardNo = memberInputView.getCardNo();
		String orderNo = memberInputView.getOrderNo();
		
		StringBuilder headSql = new StringBuilder("SELECT mr.receivableId, um.memberName, um.memberMobile, oi.sumCount, oi.payCount, oi.useCount, (oi.useCount - oi.payCount) oweCount, mc.cardNo, oi.orderNo, oi.orderSumPrice, (oi.orderSumPrice-oi.paySumPrice) owePrice");
		StringBuilder bodySql = new StringBuilder(" FROM member_receivable mr, order_info oi, user_member um, member_card mc");
		StringBuilder whereSql = new StringBuilder(" WHERE mr.orderId = oi.orderId AND mr.memberId = um.memberId AND um.memberId = mc.memberId");
		if(StrUtil.isNotBlank(memberName)){
			whereSql.append(" AND memberName = :memberName");
		}
		if(StrUtil.isNotBlank(cardNo)){
			whereSql.append(" AND cardNo = :cardNo");
		}
		if(StrUtil.isNotBlank(orderNo)){
			whereSql.append(" AND orderNo = :orderNo");
		}
		
		return super.getPageBean(headSql, bodySql, whereSql, memberInputView);
	}
	
}
