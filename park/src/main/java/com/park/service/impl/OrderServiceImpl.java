package com.park.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.po.OrderDetail;
import com.park.common.po.OrderInfo;
import com.park.common.util.DateUtil;
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
	
	private String getOrderNo(){
		return DateUtil.dateToString(new Date(), DateUtil.YYYYMMDD_HMS);
	}

}
