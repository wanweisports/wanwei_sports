package com.park.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.park.common.bean.OrderInputView;
import com.park.common.bean.PageBean;
import com.park.common.po.UserOperator;
import com.park.common.util.JsonUtils;
import com.park.service.IOrderService;

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
            System.out.println(JsonUtils.toJson(pageBean));
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    } 
	
}
