package com.park.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.OrderDetail;
import com.park.common.po.OrderInfo;
import com.park.common.util.DateUtil;
import com.park.common.util.JsonUtils;
import com.park.dao.IBaseDao;
import com.park.service.IOrderService;

@Service
public class OrderServiceImpl extends BaseService implements IOrderService {
	
	@Autowired
	private IBaseDao baseDao;
	
	@Override
	public Integer saveOrderInfo(OrderInfo orderInfo, List<OrderDetail> orderDetails){
		String nowDate = DateUtil.getNowDate();
		orderInfo.setCreateTime(nowDate);
		orderInfo.setOrderNo(getOrderNo());
		Double sumPrice = 0.0;
		for(OrderDetail orderDetail : orderDetails){
			sumPrice += orderDetail.getItemPrice();
		}
		orderInfo.setOrderSumPrice(sumPrice);
		baseDao.save(orderInfo, null);
		for(OrderDetail orderDetail : orderDetails){
			orderDetail.setOrderId(orderInfo.getOrderId());
			baseDao.save(orderDetail, null);
			sumPrice += orderDetail.getItemPrice();
		}
		return orderInfo.getOrderId();
	}
	
	@Override
	public Integer updateConfirmOrder(OrderInfo orderInfo){
		OrderInfo orderInfoDB = getOrderInfo(orderInfo.getOrderId());
		if(orderInfoDB == null) throw new MessageException("订单不存在");
		if(IDBConstant.LOGIC_STATUS_YES.equals(orderInfoDB.getPayStatus())) throw new MessageException("该订单已支付过了，请不要重复支付");
		Double orderSumPrice = orderInfo.getOrderSumPrice();
		Double paySumPrice = orderInfo.getPaySumPrice();
		if(paySumPrice >= orderSumPrice){
			orderInfoDB.setPayStatus(IDBConstant.LOGIC_STATUS_YES); //已支付
		}else{
			orderInfoDB.setPayStatus(IDBConstant.LOGIC_STATUS_OTHER); //部分支付
		}
		String nowDate = DateUtil.getNowDate();
		orderInfoDB.setAdditionalPrice(orderInfo.getAdditionalPrice());
		orderInfoDB.setCheckNo(orderInfo.getCheckNo());
		orderInfoDB.setOrderRemark(orderInfo.getOrderRemark());
		orderInfoDB.setOrderSumPrice(orderSumPrice);
		orderInfoDB.setPaySumPrice(paySumPrice);
		orderInfoDB.setSubAmount(orderInfo.getSubAmount());
		orderInfoDB.setPayType(orderInfo.getPayType());
		orderInfoDB.setPayTime(nowDate);
		orderInfoDB.setUpdateTime(nowDate);
		baseDao.save(orderInfoDB, orderInfoDB.getOrderId());
		return orderInfoDB.getOrderId();
	}
	
	@Override
	public OrderInfo getOrderInfo(Integer orderId){
		return baseDao.getToEvict(OrderInfo.class, orderId);
	}
	
	private String getOrderNo(){
		return DateUtil.dateToString(new Date(), DateUtil.YYYYMMDD_HMS);
	}

}
