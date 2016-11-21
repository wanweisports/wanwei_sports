package com.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangjun on 16/11/21.
 */
@Controller
@RequestMapping("dashboard")
public class DashboardController extends BaseController {
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
