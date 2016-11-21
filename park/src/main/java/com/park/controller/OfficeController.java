package com.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangjun on 16/11/17.
 */
@Controller
@RequestMapping("office")
public class OfficeController extends BaseController {
    // 通知管理
    @RequestMapping("notifications")
    public String notifications() {
        return "Office/OfficeNotifications";
    }

    // 排班管理
    @RequestMapping("schedule")
    public String schedule() {
        return "Office/OfficeSchedule";
    }

    // 培训报名
    @RequestMapping("trains")
    public String trains() {
        return "Office/OfficeTrains";
    }
    // 培训报名学生
    @RequestMapping("trainsStudents")
    public String trainsStuednts() {
        return "Office/OfficeTrainsStudents";
    }
}
