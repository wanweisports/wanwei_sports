package com.park.service;

import java.util.List;

import com.park.common.po.OrderDetail;
import com.park.common.po.OrderInfo;

public interface IOrderService {

	public Integer saveOrderInfo(OrderInfo orderInfo, List<OrderDetail> orderDetails);
	
}
