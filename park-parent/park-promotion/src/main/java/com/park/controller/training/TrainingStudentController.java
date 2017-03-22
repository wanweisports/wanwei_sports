package com.park.controller.training;

import com.park.common.annotation.NotProtected;
import com.park.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("training/mobile/v1")
public class TrainingStudentController extends BaseController {

    // 首页
    @NotProtected
    @RequestMapping("home/index")
    public String renderHomeIndex(){
        return "TrainingStudent/Home/HomeIndex";
    }

    // 预约课程列表
    @NotProtected
    @RequestMapping("course/list")
    public String renderCourseList(){
        return "TrainingStudent/Course/CourseList";
    }

    // 课程详情
    @NotProtected
    @RequestMapping("course/detail")
    public String renderCourseDetail(){
        return "TrainingStudent/Course/CourseDetail";
    }

    // 我要报名
    @NotProtected
    @RequestMapping("course/sign")
    public String renderCourseSign(){ return "TrainingStudent/Course/CourseSign"; }

    // 报名协议
    @NotProtected
    @RequestMapping("course/protocol")
    public String renderCourseSignProtocol(){
        return "TrainingStudent/Course/CourseSignProtocol";
    }

    // 报名结果
    @NotProtected
    @RequestMapping("course/result")
    public String renderCourseResult(){ return "TrainingStudent/Course/CourseResult"; }

    // 登录
    @NotProtected
    @RequestMapping("pp/login")
    public String renderPassportLogin(){
        return "TrainingStudent/Passport/PassportLogin";
    }

    // 快捷登录
    @NotProtected
    @RequestMapping("pp/smsLogin")
    public String renderPassportSMSLogin(){
        return "TrainingStudent/Passport/PassportSMSLogin";
    }

    // 注册
    @NotProtected
    @RequestMapping("pp/register")
    public String renderPassportRegister(){
        return "TrainingStudent/Passport/PassportRegister";
    }

    // 忘记密码
    @NotProtected
    @RequestMapping("pp/forget")
    public String renderPassportForgetPassword(){
        return "TrainingStudent/Passport/PassportForgetPassword";
    }

    // 重置密码
    @NotProtected
    @RequestMapping("pp/reset")
    public String renderPassportResetPassword(){
        return "TrainingStudent/Passport/PassportResetPassword";
    }

    // 注册协议
    @NotProtected
    @RequestMapping("pp/protocol")
    public String renderPassportRegisterProtocol(){
        return "TrainingStudent/Passport/PassportRegisterProtocol";
    }

    // 个人中心
    @NotProtected
    @RequestMapping("center/index")
    public String renderCenterIndex(){
        return "TrainingStudent/Center/CenterIndex";
    }

    // 个人信息
    @NotProtected
    @RequestMapping("center/profile")
    public String renderCenterProfile(){
        return "TrainingStudent/Center/CenterProfile";
    }

    // 上传头像
    @NotProtected
    @RequestMapping("center/uploadHeader")
    public String renderCenterUploadHeader(){
        return "TrainingStudent/Center/CenterUploadHeader";
    }

    // 关于我们
    @NotProtected
    @RequestMapping("center/about")
    public String renderCenterAbout(){
        return "TrainingStudent/Center/CenterAbout";
    }

    // 已经预约的课程
    @NotProtected
    @RequestMapping("center/course/list")
    public String renderCenterCourseList(){
        return "TrainingStudent/Center/CenterCourseList";
    }

    // 已经预约的课程内容
    @NotProtected
    @RequestMapping("center/course/detail")
    public String renderCenterCourseDetail(){
        return "TrainingStudent/Center/CenterCourseDetail";
    }

    // 我的最近两周的上课记录
    @NotProtected
    @RequestMapping("center/sign/weekLog")
    public String renderCenterSignWeekLog(){
        return "TrainingStudent/Center/CenterSignWeekLog";
    }

    // 我的全部上课记录
    @NotProtected
    @RequestMapping("center/sign/log")
    public String renderCenterSignLog(){
        return "TrainingStudent/Center/CenterSignLog";
    }
    
}
