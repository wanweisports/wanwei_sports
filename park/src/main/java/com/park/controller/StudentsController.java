package com.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangjun on 16/11/11.
 */
@Controller
@RequestMapping("students")
public class StudentsController extends BaseController {
    // 学生注册
    @RequestMapping("register")
    public String studentsRegister() {
        return "Students/StudentsCreate";
    }

    // 学生查询
    @RequestMapping("list")
    public String studentsList() {
        return "Students/StudentsList";
    }

    // 学生详情
    @RequestMapping("view")
    public String studentsView() {
        return "Students/StudentsView";
    }

    // 学生用场流水
    @RequestMapping("data")
    public String studentsVenueData() {return "Students/StudentsVenueData";}
}
