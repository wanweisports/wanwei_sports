package com.park.controller;

import com.park.common.bean.OrderInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.ResponseBean;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.UserOperator;
import com.park.common.util.JsonUtils;
import com.park.platform.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("order")
public class OrderController extends BaseController {

	@Autowired
	private IOrderService orderService;
	
	/**
	 * 获取订单列表
	 */
	@RequestMapping("getOrderList")
    public String getOrderList(OrderInputView orderInputView, Model model) {
        try {
        	UserOperator userInfo = super.getUserInfo();
            model.addAllAttributes(JsonUtils.fromJsonDF(orderInputView));
            orderInputView.setOperatorId(userInfo.getOperatorId());
            orderInputView.setSalesId(userInfo.getId());
            PageBean pageBean = orderService.getOrderList(orderInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (orderInputView.getOrderServiceTypes().equals(IDBConstant.ORDER_SERVICE_TYPE_GOODS)) {
            return "Goods/GoodsOrders";
        } else {
            return "Reservation/ReservationsOrders";
        }
    }
	
	/**
	 * 删除订单
	 */
	@ResponseBody
	@RequestMapping("deleteOrder")
    public ResponseBean deleteOrder(int orderId){
        try {
        	UserOperator userInfo = getUserInfo();
        	OrderInputView orderInputView = new OrderInputView();
        	orderInputView.setSalesId(userInfo.getId());
        	orderInputView.setOperatorId(userInfo.getOperatorId());
        	orderInputView.setOrderId(orderId);
        	orderService.deleteOrder(orderInputView);
            return new ResponseBean(true);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }
	
	/**
	 * 取消订单
	 */
	@ResponseBody
	@RequestMapping("cancelOrder")
    public ResponseBean cancelOrder(int orderId){
        try {
        	UserOperator userInfo = getUserInfo();
        	OrderInputView orderInputView = new OrderInputView();
        	orderInputView.setSalesId(userInfo.getId());
        	orderInputView.setOperatorId(userInfo.getOperatorId());
        	orderInputView.setOrderId(orderId);
        	orderInputView.setStatus(IDBConstant.LOGIC_STATUS_OTHER); //取消订单
        	orderService.updateOrderStatus(orderInputView);
            return new ResponseBean(true);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    /**
     * 查询今天的订单信息，为订餐使用，根据会员ID
     */
    @ResponseBody
    @RequestMapping("getMealsOrderToday")
    public ResponseBean getMealsOrderToday(int memberId){
        try {
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("orders", orderService.getMealsOrderToday(memberId));
            return new ResponseBean(data);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }
    
    @ResponseBody
    @RequestMapping("getOrderToPay")
    public ResponseBean getOrderToPay(int orderId){
        try {
            return new ResponseBean(orderService.getOrderToPay(orderId));
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    } 
    
}
