package com.park.controller;

import com.park.common.annotation.NotProtected;
import com.park.common.bean.*;
import com.park.common.constant.IDBConstant;
import com.park.common.constant.IPlatformConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.ParkBusiness;
import com.park.common.po.TrainsClassStudents;
import com.park.common.po.UserOperator;
import com.park.common.util.DateUtil;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    private ISiteService siteService;

    @Autowired
    private IParkService parkService;

    @Autowired
    private ITrainsClassService trainsClassService;

    @Autowired
    private ITrainsClassStudentsService trainsClassStudentsService;

    // 用户登录
    @NotProtected
    @ResponseBody
    @RequestMapping("/passport/userLogin")
    public ResponseBean userLogin(String mobile, String password) {
        try{
            if(StrUtil.isBlank(mobile)) throw new MessageException("请输入手机号！");
            if(StrUtil.isBlank(password)) throw new MessageException("请输入密码！");

            UserOperator operator = operatorService.userMobileLogin(mobile);
            if(operator == null) throw new MessageException("此用户不存在！");
            if(!password.equals(operator.getOperatorPwd())) throw new MessageException("密码错误！");
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
    @ResponseBody
    @RequestMapping("passport/userLogout")
    public ResponseBean userLogout() {
        try{
            super.getRequest().getSession().invalidate();
            return new ResponseBean(true);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 用户注册[临时不做]
    @NotProtected
    @RequestMapping("passport/register")
    public String renderRegister() {
        return "Mobile/Passport/PassportRegister";
    }

    // 用户注册[临时不做]
    @NotProtected
    @ResponseBody
    @RequestMapping("/passport/userRegister")
    public ResponseBean userRegister(String mobile, String password, String confirm) {
        try{
            if(StrUtil.isBlank(mobile)) throw new MessageException("请输入手机号！");
            if(StrUtil.isBlank(password)) throw new MessageException("请输入密码！");
            if(StrUtil.isBlank(confirm)) throw new MessageException("请输入确认密码！");
            if(password.equals(confirm)) throw new MessageException("密码和确认密码不一致！");

            UserOperator operator = operatorService.userMobileLogin(mobile);
            if(operator != null) throw new MessageException("此手机号已被占用！");
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

    // 用户完善[临时不做]
    @NotProtected
    @RequestMapping("passport/profile")
    public String renderProfile() {
        return "Mobile/Passport/PassportProfile";
    }

    // 首页
    @NotProtected
    @RequestMapping("dashboard")
    public String renderDashboard(Model model) {
        model.addAttribute("isLogin", checkLogin());

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
    @NotProtected
    @RequestMapping("center/about")
    public String renderCenterAbout() {
        return "Mobile/Center/CenterAbout";
    }

    // 预订时序图
    @NotProtected
    @RequestMapping("reservation/sequence")
    public String renderReservationSequence() {
        return "Mobile/Reservation/ReservationSequence";
    }

    // 快速预订
    @NotProtected
    @RequestMapping("reservation/quick")
    public String renderReservationQuick(SiteInputView siteInputView, Model model) throws ParseException {
        siteInputView.setSportStatus(IDBConstant.LOGIC_STATUS_YES);
        List<Map<String, Object>> siteSports = siteService.getSiteSportNames(siteInputView);
        if(siteSports.size() > 0){
        	ParkBusiness business = parkService.getBusiness();
            Integer sportId = siteInputView.getSportId();
            if(sportId == null){ //未选择，默认第一个
                Map<String, Object> sportMap = siteSports.get(0);
                sportId = StrUtil.objToInt(sportMap.get("sportId"));
            }
            if(StrUtil.isBlank(siteInputView.getSiteDate())){ //默认当时间
            	siteInputView.setSiteDate(DateUtil.dateToString(new Date(), null));
            	siteInputView.setStartTime(business.getBusinessStartTime());
            	siteInputView.setEndTime(business.getBusinessEndTime());
            }
            siteInputView.setSportId(sportId);
            siteInputView.setSiteStatus(IDBConstant.LOGIC_STATUS_YES);
            siteInputView.setSportStatus(IDBConstant.LOGIC_STATUS_YES);
            siteInputView.setPageSize(null); //暂不分页
            PageBean pageBean = siteService.getMobileReservationSite(siteInputView);
            List<Map<String, Object>> timePeriod = parkService.getTimePeriod(business);
            model.addAttribute("sportId", sportId);
            model.addAttribute("siteSports", siteSports);
            model.addAttribute("sites", pageBean.getList());
            model.addAttribute("timePeriod", timePeriod);
            model.addAttribute("curDate", DateUtil.dateToString(new Date(), null));
            model.addAttribute("curSportId", sportId);
            model.addAllAttributes(JsonUtils.fromJson(siteInputView));
        }

        return "Mobile/Reservation/ReservationSequence";
    }

    // 预订支付结果
    @NotProtected
    @RequestMapping("reservation/result")
    public String renderReservationResult() {
        return "Mobile/Reservation/ReservationResult";
    }

    // 预订支付确认
    @NotProtected
    @RequestMapping("reservation/confirm")
    public String renderReservationConfirm() {
        return "Mobile/Reservation/ReservationConfirm";
    }

    // 预订订单
    @NotProtected
    @RequestMapping("reservation/orders")
    public String renderReservationOrders() {
        return "Mobile/Reservation/ReservationList";
    }
    

    // 培训

    // 培训报名
    @NotProtected
    @RequestMapping("training/signup")
    public String renderTrainingSignUp(int classId ,Model model) {
        model.addAttribute("classId", classId);
        model.addAttribute("classList", trainsClassService.getTrainsSignClassList());
        return "Mobile/Training/TrainingSignUp";
    }

    @NotProtected
    @ResponseBody
    @RequestMapping(value = "training/signTrainsStudents", method = RequestMethod.POST)
    public ResponseBean signTrainsStudents(TrainsClassStudents trainsClassStudents) {
        try {
            trainsClassStudents.setSaleId(13);
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

    // 报名课程列表
    @NotProtected
    @RequestMapping("training/list")
    public String renderTrainingList(TrainsClassInputView trainsClassInputView, Model model) {
        try {
            model.addAllAttributes(JsonUtils.fromJsonDF(trainsClassInputView));
            PageBean pageBean = trainsClassService.getTrainsClassList(trainsClassInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Mobile/Training/TrainingList";
    }

    // 报名人数列表
    @NotProtected
    @RequestMapping("training/students")
    public String renderTrainingStudents(TrainsClassStudentsInputView trainsClassStudentsInputView, Model model) {
        try {
            model.addAllAttributes(JsonUtils.fromJsonDF(trainsClassStudentsInputView));
            model.addAttribute("classInfo", trainsClassService.getTrainsClassInfo(trainsClassStudentsInputView.getClassId()));
            PageBean pageBean = trainsClassStudentsService.getTrainsClassStudentsList(trainsClassStudentsInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Mobile/Training/TrainingStudents";
    }

    // 报名人数列表
    @NotProtected
    @ResponseBody
    @RequestMapping(value = "training/classInfo", method = RequestMethod.POST)
    public ResponseBean getTrainingClassInfo(TrainsClassStudentsInputView trainsClassStudentsInputView, Model model) {
        try {
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("classInfo", trainsClassService.getTrainsClassInfo(trainsClassStudentsInputView.getClassId()));
            return new ResponseBean(data);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    private boolean checkLogin() {
        if (super.getUserInfo() == null) {
            return false;
        } else {
            UserOperator operator = operatorService.getOperator(super.getUserInfo().getOperatorId());
            return operator != null;
        }
    }
}
