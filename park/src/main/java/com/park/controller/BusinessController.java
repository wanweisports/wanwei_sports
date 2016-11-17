package com.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangjun on 16/11/11.
 */
@Controller
public class BusinessController {
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
}
