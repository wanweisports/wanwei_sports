package com.park.controller;

import com.park.common.annotation.NotProtected;
import com.park.common.bean.ResponseBean;
import com.park.common.constant.IDBConstant;
import com.park.common.constant.IPlatformConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.UserOperator;
import com.park.common.util.StrUtil;
import com.park.service.IOperatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by wangjun on 16/11/11.
 */
@Controller
@RequestMapping("business")
public class BusinessController extends BaseController {

    @Autowired
    private IOperatorService operatorService;

    // 用户登录
    @NotProtected
    @RequestMapping("passport/login")
    public String passportLogin(String returnUrl, Model model) {
        model.addAttribute("returnUrl", StrUtil.isBlank(returnUrl) ? "/business/dashboard" : returnUrl);
        return "Business/Passport/PassportLogin";
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
        return redirect("/business/passport/login");
    }

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

    // 培训

    // 报名课程列表
    @RequestMapping("training/list")
    public String renderTrainingList() {
        return "Business/Training/TrainingList";
    }
    // 报名人数列表
    @RequestMapping("training/students")
    public String renderTrainingStudents() {
        return "Business/Training/TrainingStudents";
    }
    // 课程创建
    @RequestMapping("training/create")
    public String renderTrainingCreate() {
        return "Business/Training/TrainingCreate";
    }
}
