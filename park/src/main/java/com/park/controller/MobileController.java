package com.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangjun on 16/10/17.
 * 移动端页面
 */
@Controller
public class MobileController extends BaseController {

    // 首页
    @RequestMapping("mobile/dashboard")
    public String renderDashboard() {
        return "Mobile/Dashboard/DashboardIndex";
    }

    // 最新活动

    // 个人中心会员信息
    @RequestMapping("mobile/center/profile")
    public String renderCenterProfile() {
        return "Mobile/Center/CenterProfile";
    }

    // 个人中心会员卡
    @RequestMapping("mobile/center/card")
    public String renderCenterCard() {
        return "Mobile/Center/CenterCard";
    }

    // 个人中心修改密码
    @RequestMapping("mobile/center/password")
    public String renderCenterPassword() {
        return "Mobile/Center/CenterPassword";
    }

    // 个人中心关于我们
    @RequestMapping("mobile/center/about")
    public String renderCenterAbout() {
        return "Mobile/Center/CenterAbout";
    }

    // 预订时序图
    @RequestMapping("mobile/reservation/sequence")
    public String renderReservationSequence() {
        return "Mobile/Reservation/ReservationSequence";
    }

    // 预订订单
    @RequestMapping("mobile/reservation/orders")
    public String renderReservationOrders() {
        return "Mobile/Reservation/ReservationList";
    }

    // 培训报名
    @RequestMapping("mobile/training/signup")
    public String renderTrainingSignUp() {
        return "Mobile/Training/TrainingSignUp";
    }
}
