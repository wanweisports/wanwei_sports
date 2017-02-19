package com.park.controller;

import com.park.common.annotation.NotProtected;
import com.park.common.bean.*;
import com.park.common.constant.IDBConstant;
import com.park.common.constant.IPlatformConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.TrainsClassInfo;
import com.park.common.po.TrainsClassStudents;
import com.park.common.po.UserOperator;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by wangjun on 16/11/11.
 */
@Controller
@RequestMapping("business")
public class BusinessController extends BaseController {

    @Autowired
    private IOperatorService operatorService;

    @Autowired
    private ITrainsCourseService trainsCourseService;

    @Autowired
    private ITrainsClassService trainsClassService;

    @Autowired
    private ITrainsClassStudentsService trainsClassStudentsService;

    @Autowired
    private INotificationsService notificationsService;

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

    // 完善信息
    @RequestMapping("/passport/profile")
    public String passportProfile(Model model) {
        UserOperator operator = operatorService.getOperator(super.getUserInfo().getOperatorId());
        operator.setOperatorPwd(null);
        model.addAllAttributes(JsonUtils.fromJsonDF(operator));
        return "Business/Center/CenterProfile";
    }

    // 修改密码
    @RequestMapping("/passport/modifyPassword")
    public String modifyPassword() {
        return "Business/Center/CenterPassword";
    }

    // 工作面板
    @RequestMapping("dashboard")
    public String dashboard() {
        return "Business/Dashboard/DashboardIndex";
    }

    // 通知消息列表
    @RequestMapping("oa/getNotifications")
    public String getNotifications(NotificationsSendersInputView notificationsSendersInputView, Model model) {
        try {
            OperatorInputView operatorInputView = new OperatorInputView();
            UserOperator userInfo = super.getUserInfo();
            notificationsSendersInputView.setSenderId(userInfo.getId());
            model.addAllAttributes(JsonUtils.fromJsonDF(notificationsSendersInputView));
            model.addAttribute("operators", operatorService.getOperatorsName(operatorInputView));

            PageBean pageBean;
            if (notificationsSendersInputView.getType().equals(IDBConstant.NOTIFICATIONS_TYPE_DRAFT)) {
                notificationsSendersInputView.setSendStatus(IDBConstant.NOTIFICATIONS_SENDER_NO);
                pageBean = notificationsService.getNotificationsDraft(notificationsSendersInputView);
                super.setPageInfo(model, pageBean);
            }
            if (notificationsSendersInputView.getType().equals(IDBConstant.NOTIFICATIONS_TYPE_SEND)) {
                notificationsSendersInputView.setSendStatus(IDBConstant.NOTIFICATIONS_SENDER_YES);
                pageBean = notificationsService.getNotificationsBySender(notificationsSendersInputView);
                super.setPageInfo(model, pageBean);
            }
            if (notificationsSendersInputView.getType().equals(IDBConstant.NOTIFICATIONS_TYPE_TRASH)) {
                notificationsSendersInputView.setSendStatus(IDBConstant.NOTIFICATIONS_SENDER_DEL);
                pageBean = notificationsService.getNotificationsBySender(notificationsSendersInputView);
                super.setPageInfo(model, pageBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Business/OA/OANotifications";
    }

    // 通知消息详情
    @RequestMapping("oa/notificationsDetail")
    public String notificationsDetail(int noteId, Model model) {
        try {
            model.addAllAttributes(JsonUtils.fromJsonDF(notificationsService.getNotificationInfo(noteId)));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Business/OA/OANotificationsDetail";
    }

    // 获取消息列表
    @RequestMapping("oa/getMessage")
    public String getMessage(NotificationsReceiversInputView notificationsReceiversInputView, Model model) {
        try {
            OperatorInputView operatorInputView = new OperatorInputView();
            UserOperator userInfo = super.getUserInfo();
            notificationsReceiversInputView.setReceiverId(userInfo.getId());
            model.addAllAttributes(JsonUtils.fromJsonDF(notificationsReceiversInputView));
            model.addAttribute("operators", operatorService.getOperatorsName(operatorInputView));

            PageBean pageBean;
            if (notificationsReceiversInputView.getType().equals(IDBConstant.NOTIFICATIONS_TYPE_RECEIVE)) {
                notificationsReceiversInputView.setReceiverStatus(IDBConstant.NOTIFICATIONS_RECEIVER_ALL);
                pageBean = notificationsService.getNotificationsByReceiver(notificationsReceiversInputView);
                super.setPageInfo(model, pageBean);
            }
            if (notificationsReceiversInputView.getType().equals(IDBConstant.NOTIFICATIONS_TYPE_RECEIVE_READ)) {
                notificationsReceiversInputView.setReceiverStatus(IDBConstant.NOTIFICATIONS_RECEIVER_YES);
                pageBean = notificationsService.getNotificationsByReceiver(notificationsReceiversInputView);
                super.setPageInfo(model, pageBean);
            }
            if (notificationsReceiversInputView.getType().equals(IDBConstant.NOTIFICATIONS_TYPE_RECEIVE_UNREAD)) {
                notificationsReceiversInputView.setReceiverStatus(IDBConstant.NOTIFICATIONS_RECEIVER_NO);
                pageBean = notificationsService.getNotificationsByReceiver(notificationsReceiversInputView);
                super.setPageInfo(model, pageBean);
            }
            if (notificationsReceiversInputView.getType().equals(IDBConstant.NOTIFICATIONS_TYPE_TRASH)) {
                notificationsReceiversInputView.setReceiverStatus(IDBConstant.NOTIFICATIONS_RECEIVER_DEL);
                pageBean = notificationsService.getNotificationsByReceiver(notificationsReceiversInputView);
                super.setPageInfo(model, pageBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Business/OA/OAMessage";
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
    public String income(DataInputView dataInputView, Model model) {
        /*try{
            model.addAllAttributes(JsonUtils.fromJson(dataInputView));
            model.addAllAttributes(dataService.getBusinessIncome(dataInputView));
        }catch (Exception e) {
            e.printStackTrace();
        }*/

        return "Business/Data/DataIncome";
    }

    // 收入统计对比
    @RequestMapping("data/incomeCompare")
    public String incomeCompare() {
        return "Business/Data/DataIncomeCompare";
    }

    // 场地使用率
    @RequestMapping("data/venuePercentage")
    public String venuePercentage() {
        return "Business/Data/DataVenuePercentage";
    }


    // 排班管理
    @RequestMapping("office/schedule")
    public String schedule(DataInputView dataInputView, Model model) {
        try{
            model.addAllAttributes(JsonUtils.fromJson(dataInputView));
            OperatorInputView operatorInputView = new OperatorInputView();
            model.addAttribute("operators", operatorService.getOperatorsName(operatorInputView));
            model.addAttribute("schedules", operatorService.getUserSchedulings(dataInputView));
        }catch(Exception e){
            e.printStackTrace();
        }

        return "Business/Schedule/OfficeSchedule";
    }

    // 培训

    // 培训课程管理
    @RequestMapping("training/list")
    public String renderTrainsClassList(TrainsClassInputView trainsClassInputView, Model model) {
        try {
            UserOperator userInfo = super.getUserInfo();
            trainsClassInputView.setSaleId(userInfo.getId());
            model.addAllAttributes(JsonUtils.fromJsonDF(trainsClassInputView));
            model.addAttribute("courseNames", trainsCourseService.getTrainsCourseNames());
            PageBean pageBean = trainsClassService.getTrainsClassList(trainsClassInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Business/Training/TrainingList";
    }


    // 报名人数列表
    @RequestMapping("training/students")
    public String renderTrainingStudents(TrainsClassStudentsInputView trainsClassStudentsInputView, Model model) {
        try {
            Date date = new Date();//取时间
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            UserOperator userInfo = super.getUserInfo();
            trainsClassStudentsInputView.setSaleId(userInfo.getId());
            model.addAllAttributes(JsonUtils.fromJsonDF(trainsClassStudentsInputView));
            model.addAttribute("classInfo", trainsClassService.getTrainsClassInfo(trainsClassStudentsInputView.getClassId()));
            model.addAttribute("today", formatter.format(date));
            PageBean pageBean = trainsClassStudentsService.getTrainsClassStudentsList(trainsClassStudentsInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Business/Training/TrainingStudents";
    }
    // 课程创建
    @RequestMapping("training/create")
    public String renderTrainingCreate(Model model) {
        model.addAttribute("courseNames", trainsCourseService.getTrainsCourseNames());

        return "Business/Training/TrainingCreate";
    }

    // 培训班级保存
    @ResponseBody
    @RequestMapping(value = "training/saveTrainsClassInfo", method = RequestMethod.POST)
    public ResponseBean saveTrainsClassInfo(TrainsClassInfo trainsClassInfo) {
        try {
            UserOperator userInfo = super.getUserInfo();
            trainsClassInfo.setSaleId(userInfo.getId());

            Integer classId = trainsClassService.saveTrainsClassInfo(trainsClassInfo);
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("classId", classId);
            return new ResponseBean(data);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    @ResponseBody
    @RequestMapping(value = "training/signTrainsStudents", method = RequestMethod.POST)
    public ResponseBean signTrainsStudents(TrainsClassStudents trainsClassStudents) {
        try {
            UserOperator userInfo = super.getUserInfo();
            trainsClassStudents.setSaleId(userInfo.getId());
            trainsClassStudents.setPayStatus(IDBConstant.LOGIC_STATUS_YES);

            Integer signId = trainsClassStudentsService.saveTrainsClassStudentsSign(trainsClassStudents);
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("signId", signId);
            return new ResponseBean(data);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 培训报名
    @RequestMapping("training/signup")
    public String renderTrainingSignUp(int classId, Model model) {
        model.addAttribute("classId", classId);
        model.addAttribute("classList", trainsClassService.getTrainsSignClassList());

        return "Business/Training/TrainingSignUp";
    }
}
