package com.park.controller.training;

import com.park.common.annotation.NotProtected;
import com.park.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangjun on 17/3/6.
 */
@Controller
@RequestMapping("training/reports")
public class ReportsController extends BaseController {

    // 学生缴费统计
    @NotProtected
    @RequestMapping("students/cost")
    public String renderReportsStudentsCost(){
        return "Training/Reports/ReportsStudentsCost";
    }

    // 学生课程统计
    @NotProtected
    @RequestMapping("students/join")
    public String renderReportsStudentsJoin(){
        return "Training/Reports/ReportsStudentsJoin";
    }

    // 学生列表统计
    @NotProtected
    @RequestMapping("students/list")
    public String renderReportsStudentsList(){
        return "Training/Reports/ReportsStudentsList";
    }
}
