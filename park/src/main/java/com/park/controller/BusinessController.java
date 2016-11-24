package com.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangjun on 16/11/11.
 */
@Controller
@RequestMapping("business")
public class BusinessController {
    // 工作面板
    @RequestMapping("dashboard")
    public String dashboard() {
        return "Business/Dashboard/DashboardIndex";
    }

    // 通知消息列表
    @RequestMapping("oa/notifications")
    public String notifications() {
        return "Business/OA/OANotifications";
    }

    // 通知消息详情
    @RequestMapping("oa/notificationsDetail")
    public String notificationsDetail() {
        return "Business/OA/OANotificationsDetail";
    }

    // 通知消息创建
    @RequestMapping("oa/notificationsCreate")
    public String notificationsCreate() {
        return "Business/OA/OANotificationsCreate";
    }

    // 通知员工列表
    @RequestMapping("oa/employees")
    public String employees() {
        return "Business/OA/OAEmployees";
    }

    // 收入统计
    @RequestMapping("data/income")
    public String income() {
        return "Business/Data/DataIncome";
    }

    // 场地使用率
    @RequestMapping("data/venuePercentage")
    public String venuePercentage() {
        return "Business/Data/DataVenuePercentage";
    }

    // 值班安排
    @RequestMapping("office/schedule")
    public String schedule() {
        return "Business/Schedule/OfficeSchedule";
    }
}
