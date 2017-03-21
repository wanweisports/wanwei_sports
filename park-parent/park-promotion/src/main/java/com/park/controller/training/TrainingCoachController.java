package com.park.controller.training;

import com.park.common.annotation.NotProtected;
import com.park.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("training/coach/v1")
public class TrainingCoachController extends BaseController {

    // 首页
    @NotProtected
    @RequestMapping("home/index")
    public String renderHomeIndex(){
        return "TrainingCoach/Home/HomeIndex";
    }

    // 预约课程列表
    @NotProtected
    @RequestMapping("course/list")
    public String renderCourseList(){
        return "TrainingCoach/Course/CourseList";
    }

    // 课程详情
    @NotProtected
    @RequestMapping("course/detail")
    public String renderCourseDetail(){
        return "TrainingCoach/Course/CourseDetail";
    }

    // 我要报名
    @NotProtected
    @RequestMapping("course/sign")
    public String renderCourseSign(){ return "TrainingCoach/Course/CourseSign"; }

    // 报名协议
    @NotProtected
    @RequestMapping("course/protocol")
    public String renderCourseSignProtocol(){
        return "TrainingCoach/Course/CourseSignProtocol";
    }

    // 报名结果
    @NotProtected
    @RequestMapping("course/result")
    public String renderCourseResult(){ return "TrainingCoach/Course/CourseResult"; }

    // 登录
    @NotProtected
    @RequestMapping("pp/login")
    public String renderPassportLogin(){
        return "TrainingCoach/Passport/PassportLogin";
    }

    // 快捷登录
    @NotProtected
    @RequestMapping("pp/smsLogin")
    public String renderPassportSMSLogin(){
        return "TrainingCoach/Passport/PassportSMSLogin";
    }

    // 注册
    @NotProtected
    @RequestMapping("pp/register")
    public String renderPassportRegister(){
        return "TrainingCoach/Passport/PassportRegister";
    }

    // 忘记密码
    @NotProtected
    @RequestMapping("pp/forget")
    public String renderPassportForgetPassword(){
        return "TrainingCoach/Passport/PassportForgetPassword";
    }

    // 重置密码
    @NotProtected
    @RequestMapping("pp/reset")
    public String renderPassportResetPassword(){
        return "TrainingCoach/Passport/PassportResetPassword";
    }

    // 注册协议
    @NotProtected
    @RequestMapping("pp/protocol")
    public String renderPassportRegisterProtocol(){
        return "TrainingCoach/Passport/PassportRegisterProtocol";
    }

    // 个人中心
    @NotProtected
    @RequestMapping("center/index")
    public String renderCenterIndex(){
        return "TrainingCoach/Center/CenterIndex";
    }

    // 个人资质
    @NotProtected
    @RequestMapping("center/honor")
    public String renderCenterHonor(){
        return "TrainingCoach/Center/CenterHonor";
    }

    // 个人信息
    @NotProtected
    @RequestMapping("center/profile")
    public String renderCenterProfile(){
        return "TrainingCoach/Center/CenterProfile";
    }

    // 上传头像
    @NotProtected
    @RequestMapping("center/uploadHeader")
    public String renderCenterUploadHeader(){
        return "TrainingCoach/Center/CenterUploadHeader";
    }

    // 关于我们
    @NotProtected
    @RequestMapping("center/about")
    public String renderCenterAbout(){
        return "TrainingCoach/Center/CenterAbout";
    }

    // 我的课程
    @NotProtected
    @RequestMapping("center/course/list")
    public String renderCenterCourseList(){
        return "TrainingCoach/Center/CenterCourseList";
    }

    // 我的课程内容
    @NotProtected
    @RequestMapping("center/course/detail")
    public String renderCenterCourseDetail(){
        return "TrainingCoach/Center/CenterCourseDetail";
    }

    // 签到记录
    @NotProtected
    @RequestMapping("center/sign/weekLog")
    public String renderCenterSignWeekLog(){
        return "TrainingCoach/Center/CenterSignWeekLog";
    }

    // 全部签到记录
    @NotProtected
    @RequestMapping("center/sign/log")
    public String renderCenterSignLog(){
        return "TrainingCoach/Center/CenterSignLog";
    }

    // 通讯簿
    @NotProtected
    @RequestMapping("center/contact/list")
    public String renderCenterContactList(){
        return "TrainingCoach/Center/CenterContactList";
    }
    
}
