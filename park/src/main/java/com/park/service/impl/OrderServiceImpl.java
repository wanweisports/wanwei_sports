package com.park.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.bean.OrderInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.MemberCard;
import com.park.common.po.MemberReceivable;
import com.park.common.po.OrderDetail;
import com.park.common.po.OrderInfo;
import com.park.common.po.SiteReserveBasic;
import com.park.common.po.SiteReserveDate;
import com.park.common.po.SiteReserveTime;
import com.park.common.util.DateUtil;
import com.park.common.util.SQLUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IMemberReceivableService;
import com.park.service.IMemberService;
import com.park.service.IOrderService;
import com.park.service.ISiteService;

@Service
public class OrderServiceImpl extends BaseService implements IOrderService {
	
	@Autowired
	private IBaseDao baseDao;
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IMemberReceivableService memberReceivableService;
	
	@Autowired
	private ISiteService siteService;
	
	@Override
	public Integer saveOrderInfo(OrderInfo orderInfo, List<OrderDetail> orderDetails){
		String nowDate = DateUtil.getNowDate();
		orderInfo.setCreateTime(nowDate);
		orderInfo.setOrderNo(getOrderNo());
		Double sumPrice = 0.0;
		baseDao.save(orderInfo, null);
		
		if(orderDetails != null && orderDetails.size() > 0){
			for(OrderDetail orderDetail : orderDetails){
				if(orderDetail.getItemPrice() != null){
					sumPrice += orderDetail.getItemPrice();
				}
			}
			orderInfo.setOrderSumPrice(sumPrice);
			for(OrderDetail orderDetail : orderDetails){
				orderDetail.setOrderId(orderInfo.getOrderId());
				baseDao.save(orderDetail, null);
			}
			baseDao.save(orderInfo, orderInfo.getOrderId());
		}
		return orderInfo.getOrderId();
	}
	
	@Override
	public Integer updateConfirmOrder(OrderInfo orderInfo){
		int orderId = orderInfo.getOrderId();
		OrderInfo orderInfoDB = getOrderInfo(orderId);
		if(orderInfoDB == null) throw new MessageException("订单不存在");
		if(IDBConstant.LOGIC_STATUS_YES.equals(orderInfoDB.getPayStatus())) throw new MessageException("该订单已支付过了，请不要重复支付");
		Double orderSumPrice = orderInfoDB.getOrderSumPrice();
		//orderInfoDB.setPaySumPrice((orderInfoDB.getPaySumPrice()!=null?orderInfoDB.getPaySumPrice():0) + orderInfo.getPaySumPrice()); //【老需求】加上之前已经支付过多少钱
		Double paySumPrice = orderInfo.getPaySumPrice();
		orderInfoDB.setPaySumPrice(paySumPrice); //新需求：剩余金额在应收款中收取
		//会员付款--->应收款（散客无应收款）
		Integer memberId = orderInfoDB.getMemberId();
		if(memberId != null && memberId > 0){
			//之前的逻辑
			/*//扣除订单orderSumPrice金额：先扣除用户支付输入的金额
			//不够：再扣会员卡金额
			//还不够，则生成应收款，保存到应收款表，会员卡金额减少
			Double remainingPrice = orderSumPrice - orderInfoDB.getPaySumPrice();
			double payPrice = orderInfoDB.getPaySumPrice();
			if(remainingPrice > 0){
				List<MemberCard> memberCards = memberService.getMemberCards(memberId);
				if(memberCards.size() > 0){
					MemberCard memberCard = memberCards.get(0);
					double remainingCardPrice = memberCard.getCardBalance() - remainingPrice;
					payPrice += remainingCardPrice > 0 ? remainingPrice : memberCard.getCardBalance(); //支付够了就是减去的钱，不够就是卡的余额
					memberCard.setCardBalance(remainingCardPrice > 0 ? remainingCardPrice : 0); //最低扣到0
					baseDao.save(memberCard, memberCard.getCardId());
					if(remainingCardPrice < 0){ //钱不够扣，生成应收款[商品生成应收款吗]
						memberReceivableService.saveMemberReceivable(new MemberReceivable(memberId, orderId, null, null, orderInfo.getSalesId()), 0, 0, StrUtil.EMPTY);
					}
				}
			}
			orderInfoDB.setPaySumPrice(payPrice);*/
			//新逻辑
			List<MemberCard> memberCards = memberService.getMemberCards(memberId);
			if(memberCards.size() > 0){
				MemberCard memberCard = memberCards.get(0);
				double remainingCardPrice = memberCard.getCardBalance() - paySumPrice;
				memberCard.setCardBalance(remainingCardPrice > 0 ? remainingCardPrice : 0); //最低扣到0
				baseDao.save(memberCard, memberCard.getCardId());
				if(orderInfo.getPayCount() < orderInfoDB.getSumCount()){ //场次不是最大，生成应收款
					memberReceivableService.saveMemberReceivable(new MemberReceivable(memberId, orderId, null, null, orderInfo.getSalesId()), 0, 0, StrUtil.EMPTY);
				}
			}else throw new MessageException("该会员未绑定会员卡");
			orderInfoDB.setPaySumPrice(paySumPrice);
		}
		orderInfoDB.setPayStatus(IDBConstant.LOGIC_STATUS_YES); //已支付
		/*if(orderInfoDB.getPaySumPrice() >= orderSumPrice){
			orderInfoDB.setPayStatus(IDBConstant.LOGIC_STATUS_YES); //已支付
		}else{
			orderInfoDB.setPayStatus(IDBConstant.LOGIC_STATUS_OTHER); //部分支付
		}*/
		String nowDate = DateUtil.getNowDate();
		orderInfoDB.setAdditionalPrice(orderInfo.getAdditionalPrice());
		orderInfoDB.setCheckNo(orderInfo.getCheckNo());
		orderInfoDB.setOrderRemark(orderInfo.getOrderRemark());
		//orderInfoDB.setOrderSumPrice(orderSumPrice);
		
		orderInfoDB.setSubAmount(orderInfo.getSubAmount());
		orderInfoDB.setPayType(orderInfo.getPayType());
		orderInfoDB.setPayTime(nowDate);
		orderInfoDB.setUpdateTime(nowDate);
		if(StrUtil.isNotBlank(orderInfo.getOrderStatus())){
			orderInfoDB.setOrderStatus(orderInfo.getOrderStatus());
		}
		baseDao.save(orderInfoDB, orderId);
		return orderId;
	}
	
	@Override
	public OrderInfo getOrderInfo(Integer orderId){
		return baseDao.getToEvict(OrderInfo.class, orderId);
	}
	
	@Override
	public PageBean getOrderList(OrderInputView orderInputView) throws Exception{
		
		String operatorId = orderInputView.getOperatorId();
		String orderServiceTypes = orderInputView.getOrderServiceTypes();
		
		StringBuilder headSql = new StringBuilder("SELECT *");
		StringBuilder bodySql = new StringBuilder(" FROM order_info");
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
		if(!super.isAdmin(orderInputView)){
			whereSql.append(" AND salesId = :salesId");
		}
		if(StrUtil.isNotBlank(orderServiceTypes)){
			whereSql.append(" AND orderServiceType IN (:orderServiceTypes)");
		}
		whereSql.append(" ORDER BY updateTime DESC");
		
		PageBean pageBean = super.getPageBean(headSql, bodySql, whereSql, orderInputView, SQLUtil.getInToSQL("orderServiceTypes", orderServiceTypes));
		List<Map<String, Object>> list = pageBean.getList();
		for(Map<String, Object> map : list){
			List<OrderDetail> orderDetailList = getOrderDetails(StrUtil.objToInt(map.get("orderId")));
			map.put("orderDetailList", orderDetailList);
			if(isAllComplete(orderDetailList)){ //子订单全部完成
				map.put("orderStatus", IDBConstant.LOGIC_STATUS_YES);
			}
		}
		return pageBean;
	}
	
	@Override
	public List<OrderDetail> getOrderDetails(int orderId) throws Exception{
		OrderInfo orderInfo = getOrderInfo(orderId);
		List<OrderDetail> orderDetailList = baseDao.queryByHql("FROM OrderDetail WHERE orderId = ?", orderId);
		if(IDBConstant.ORDER_SERVICE_TYPE_SITE.equals(orderInfo.getOrderServiceType())||IDBConstant.ORDER_SERVICE_TYPE_BLOCK_SITE.equals(orderInfo.getOrderServiceType())){
			return calculateTime(orderDetailList);
		}
		return orderDetailList;
	}
	
	@Override
	public void deleteOrder(OrderInputView orderInputView){
		Integer orderId = orderInputView.getOrderId();
		OrderInfo orderInfo = getOrder(orderId, orderInputView.getSalesId(), orderInputView.getOperatorId());
		baseDao.delete(orderInfo);
		baseDao.delete("order_detail", "orderId", orderInfo.getOrderId());
		//删除订单相关的场地
		if(IDBConstant.ORDER_SERVICE_TYPE_SITE.equals(orderInfo.getOrderServiceType()) || IDBConstant.ORDER_SERVICE_TYPE_BLOCK_SITE.equals(orderInfo.getOrderServiceType())){
			SiteReserveBasic siteReserveBasic = siteService.getSiteReserveBasicByOrderId(orderId);
			List<SiteReserveDate> siteReserveDates = siteService.getSiteReserveDate(siteReserveBasic.getSiteReserveId());
			for(SiteReserveDate siteReserveDate : siteReserveDates){
				List<SiteReserveTime> siteReserveTimes = siteService.getSiteReserveTimeByDateId(siteReserveDate.getReserveDateId());
				for(SiteReserveTime siteReserveTime : siteReserveTimes){
					baseDao.delete(siteReserveTime);
				}
				baseDao.delete(siteReserveDate);
			}
			baseDao.delete(siteReserveBasic);
		}
	}
	
	@Override
	public void updateOrderStatus(OrderInputView orderInputView){
		if(StrUtil.isBlank(orderInputView.getStatus())) throw new MessageException("操作错误");
		OrderInfo orderInfo = getOrder(orderInputView.getOrderId(), orderInputView.getSalesId(), orderInputView.getOperatorId());
		orderInfo.setOrderStatus(orderInputView.getStatus());
		baseDao.save(orderInfo, orderInfo.getOrderId());
	}
	
	private OrderInfo getOrder(int orderId, int salesId, String operatorId){
		OrderInfo orderInfo = getOrderInfo(orderId);
		if(!super.isAdmin(operatorId)){
			if(salesId != orderInfo.getSalesId()) throw new MessageException("操作错误");
		}
		return orderInfo;
	}
	
	private List<OrderDetail> calculateTime(List<OrderDetail> orderDetailList) throws Exception{
		if(orderDetailList.size() > 0){
			for(OrderDetail orderDetail : orderDetailList){
				if(IDBConstant.LOGIC_STATUS_NO.equals(orderDetail.getOrderDetailStatus())){
					orderDetail.setOrderDetailStatus(DateUtil.withinTheTime(orderDetail.getItemStartTime(), orderDetail.getItemEndTime()));
				}
			}
		}
		return orderDetailList;
	}
	
	private boolean isAllComplete(List<OrderDetail> orderDetailList){
		int count = 0;
		for(OrderDetail orderDetail : orderDetailList){
			if(IDBConstant.LOGIC_STATUS_YES.equals(orderDetail.getOrderDetailStatus())){
				count++;
			}
		}
		return count == orderDetailList.size();
	}
	
	private String getOrderNo(){
		return DateUtil.dateToString(new Date(), DateUtil.YYYYMMDD_HMS);
	}

}
