package com.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangjun on 16/11/15.
 */
@Controller
@RequestMapping("teachers")
public class TeachersController extends BaseController {
    // 教师注册
    @RequestMapping("register")
    public String teachersRegister() {
        return "Teachers/TeachersCreate";
    }

    // 教师查询
    @RequestMapping("list")
    public String teachersList() {
        return "Teachers/TeachersList";
    }

    // 教师查询
    @RequestMapping("view")
    public String teachersView() {
        return "Teachers/TeachersView";
    }

    // 教师用场流水
    @RequestMapping("data")
    public String teachersVenueData() {return "Teachers/TeachersVenueData";}

    // 教师订单统计
    @RequestMapping("orderMeal")
    public String teachersOrderMeal() {return "Teachers/TeachersMealData";}
}
