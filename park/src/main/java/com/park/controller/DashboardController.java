package com.park.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.park.service.IOperatorService;

/**
 * Created by wangjun on 16/11/21.
 */
@Controller
@RequestMapping("dashboard")
public class DashboardController extends BaseController {
	
	@Autowired
	private IOperatorService operatorService;
	
    // 场地实时
    @RequestMapping("led")
    public String getVenueLED(){
        return "Dashboard/DashboardLED";
    }

    // 值班表
    @RequestMapping("rota")
    public String getRota(){
        return "Dashboard/DashboardRota";
    }
    
}
