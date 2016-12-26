package com.park.controller;

import com.park.common.annotation.NotProtected;
import com.park.common.bean.PageBean;
import com.park.common.bean.ResponseBean;
import com.park.common.bean.TrainsClassInputView;
import com.park.common.bean.TrainsClassStudentsInputView;
import com.park.common.constant.IDBConstant;
import com.park.common.constant.IPlatformConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.UserOperator;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.service.IOperatorService;
import com.park.service.ITrainsClassService;
import com.park.service.ITrainsClassStudentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by wangjun on 16/10/17.
 * 移动端页面
 */
@Controller
@RequestMapping("mobile")
public class MobileController extends BaseController {

    @Autowired
    private IOperatorService operatorService;

    @Autowired
    private ITrainsClassService trainsClassService;

    @Autowired
    private ITrainsClassStudentsService trainsClassStudentsService;

    // 用户登录
    @NotProtected
    @RequestMapping("passport/login")
    public String passportLogin(String returnUrl, Model model) {
        model.addAttribute("returnUrl", StrUtil.isBlank(returnUrl) ? "/mobile/dashboard" : returnUrl);
        return "Mobile/Passport/PassportLogin";
    }

    // 用户登录
    @NotProtected
    @ResponseBody
    @RequestMapping("/passport/userLogin")
    public ResponseBean userLogin(String name, String pwd) {
        try{
            if(StrUtil.isBlank(name)) throw new MessageException("请输入用户名！");
            if(StrUtil.isBlank(pwd)) throw new MessageException("请输入密码！");

            UserOperator operator = operatorService.innerLogin(name);
            if(operator == null) throw new MessageException("用户名错误！");
            if(!pwd.equals(operator.getOperatorPwd())) throw new MessageException("密码错误！");
            if(!IDBConstant.LOGIC_STATUS_YES.equals(operator.getStatus())) throw new MessageException("您的帐号已被锁定，请联系管理员！");
            operator.setOperatorPwd(null);

            operatorService.saveLastLoginTime(operator.getId());
            super.getRequest().getSession().setAttribute(IPlatformConstant.LOGIN_USER, operator);
            return new ResponseBean(true);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 用户退出
    @RequestMapping("passport/logout")
    public String logout() {
        super.getRequest().getSession().invalidate();
        return redirect("/mobile/passport/login");
    }

    // 首页
    @RequestMapping("dashboard")
    public String renderDashboard() {
        return "Mobile/Dashboard/DashboardIndex";
    }

    // 最新活动

    // 个人中心会员信息
    @RequestMapping("center/profile")
    public String renderCenterProfile() {
        return "Mobile/Center/CenterProfile";
    }

    // 个人中心会员卡
    @RequestMapping("center/card")
    public String renderCenterCard() {
        return "Mobile/Center/CenterCard";
    }

    // 个人中心修改密码
    @RequestMapping("center/password")
    public String renderCenterPassword() {
        return "Mobile/Center/CenterPassword";
    }

    // 个人中心子会员
    @RequestMapping("center/children")
    public String renderCenterChildren() {
        return "Mobile/Center/CenterChildren";
    }

    // 个人中心关于我们
    @RequestMapping("center/about")
    public String renderCenterAbout() {
        return "Mobile/Center/CenterAbout";
    }

    // 预订时序图
    @RequestMapping("reservation/sequence")
    public String renderReservationSequence() {
        return "Mobile/Reservation/ReservationSequence";
    }

    // 预订订单
    @RequestMapping("reservation/orders")
    public String renderReservationOrders() {
        return "Mobile/Reservation/ReservationList";
    }

    // 培训

    // 培训报名
    @RequestMapping("training/signup")
    public String renderTrainingSignUp() {
        return "Mobile/Training/TrainingSignUp";
    }

    // 报名课程列表
    @RequestMapping("training/list")
    public String renderTrainingList(TrainsClassInputView trainsClassInputView, Model model) {
        try {
            UserOperator userInfo = super.getUserInfo();
            trainsClassInputView.setSaleId(userInfo.getId());
            model.addAllAttributes(JsonUtils.fromJsonDF(trainsClassInputView));
            PageBean pageBean = trainsClassService.getTrainsClassList(trainsClassInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Mobile/Training/TrainingList";
    }

    // 报名人数列表
    @RequestMapping("training/students")
    public String renderTrainingStudents(TrainsClassStudentsInputView trainsClassStudentsInputView, Model model) {
        try {
            UserOperator userInfo = super.getUserInfo();
            trainsClassStudentsInputView.setSaleId(userInfo.getId());
            model.addAllAttributes(JsonUtils.fromJsonDF(trainsClassStudentsInputView));
            model.addAttribute("classInfo", trainsClassService.getTrainsClassInfo(trainsClassStudentsInputView.getClassId()));
            PageBean pageBean = trainsClassStudentsService.getTrainsClassStudentsList(trainsClassStudentsInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Mobile/Training/TrainingStudents";
    }
}
