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
import com.park.common.po.OrderDetail;
import com.park.common.po.OrderInfo;
import com.park.common.util.DateUtil;
import com.park.common.util.SQLUtil;
import com.park.common.util.StrUtil;
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
		baseDao.save(orderInfo, null);
		
		if(orderDetails != null && orderDetails.size() > 0){
			for(OrderDetail orderDetail : orderDetails){
				sumPrice += orderDetail.getItemPrice();
			}
			orderInfo.setOrderSumPrice(sumPrice);
			for(OrderDetail orderDetail : orderDetails){
				orderDetail.setOrderId(orderInfo.getOrderId());
				baseDao.save(orderDetail, null);
				sumPrice += orderDetail.getItemPrice();
			}
			baseDao.save(orderInfo, orderInfo.getOrderId());
		}
		return orderInfo.getOrderId();
	}
	
	@Override
	public Integer updateConfirmOrder(OrderInfo orderInfo){
		OrderInfo orderInfoDB = getOrderInfo(orderInfo.getOrderId());
		if(orderInfoDB == null) throw new MessageException("订单不存在");
		if(IDBConstant.LOGIC_STATUS_YES.equals(orderInfoDB.getPayStatus())) throw new MessageException("该订单已支付过了，请不要重复支付");
		Double orderSumPrice = orderInfoDB.getOrderSumPrice();
		orderInfoDB.setPaySumPrice((orderInfoDB.getPaySumPrice()!=null?orderInfoDB.getPaySumPrice():0) + orderInfo.getPaySumPrice()); //加上之前已经支付过多少钱
		if(orderInfoDB.getPaySumPrice() >= orderSumPrice){
			orderInfoDB.setPayStatus(IDBConstant.LOGIC_STATUS_YES); //已支付
		}else{
			orderInfoDB.setPayStatus(IDBConstant.LOGIC_STATUS_OTHER); //部分支付
		}
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
		baseDao.save(orderInfoDB, orderInfoDB.getOrderId());
		return orderInfoDB.getOrderId();
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
		OrderInfo orderInfo = getOrder(orderInputView.getOrderId(), orderInputView.getSalesId(), orderInputView.getOperatorId());
		baseDao.delete(orderInfo);
		baseDao.delete("order_detail", "orderId", orderInfo.getOrderId());
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
