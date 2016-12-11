package com.park.service;

import java.util.List;
import java.util.Map;

import com.park.common.bean.OrderInputView;
import com.park.common.bean.PageBean;
import com.park.common.po.OrderDetail;
import com.park.common.po.OrderInfo;

public interface IOrderService {

	public Integer saveOrderInfo(OrderInfo orderInfo, List<OrderDetail> orderDetails);
	
	public Integer updateConfirmOrder(OrderInfo orderInfo);
	
	public OrderInfo getOrderInfo(Integer orderId);
	
	public PageBean getOrderList(OrderInputView orderInputView) throws Exception;
	
	public List<OrderDetail> getOrderDetails(int orderId) throws Exception;
	
	public void deleteOrder(OrderInputView orderInputView);
	
	public void updateOrderStatus(OrderInputView orderInputView);

	public List<Map<String, Object>> getMealsOrderToday(int memberId) throws Exception;
	
}
