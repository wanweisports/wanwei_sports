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
import com.park.platform.service.*;
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

    @Autowired
    private IDataService dataService;

    // 通知员工列表
    @RequestMapping("oa/employees")
    public String employees() {
        return "OA/OAEmployees";
    }

    // 收入统计
    @RequestMapping("data/income")
    public String income(DataInputView dataInputView, Model model) {
        try{
            model.addAllAttributes(JsonUtils.fromJson(dataInputView));
            model.addAllAttributes(dataService.getMobileBusinessIncome(dataInputView));
        }catch (Exception e) {
            e.printStackTrace();
        }

        return "Data/DataIncome";
    }

    // 收入统计对比
    @RequestMapping("data/incomeCompare")
    public String incomeCompare(Model model) {
        Date date = new Date();//取时间
        SimpleDateFormat formatterWeek = new SimpleDateFormat("E");

        DataInputView dataInputView = new DataInputView();
        dataInputView.setCountNum(IDBConstant.DATA_DATE_DAY);
        model.addAttribute("today", dataService.getMobileBusinessIncome(dataInputView));
        model.addAttribute("todayWeek", formatterWeek.format(date.getTime()));

        Date yesterday = new Date(date.getTime() - (long)24 * 60 * 60 * 1000);
        dataInputView.setCountNum(IDBConstant.DATA_DATE_PRE_DAY);
        model.addAttribute("yesterday", dataService.getMobileBusinessIncome(dataInputView));
        model.addAttribute("yesterdayWeek", formatterWeek.format(yesterday));

        Date compare = new Date(date.getTime() - (long)7 * 24 * 60 * 60 * 1000);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        dataInputView.setCreateTimeStart(formatter.format(compare));
        dataInputView.setCreateTimeEnd(formatter.format(compare));
        model.addAttribute("compare", dataService.getMobileBusinessIncome(dataInputView));
        model.addAttribute("compareWeek", formatterWeek.format(compare));

        return "Data/DataIncomeCompare";
    }

    // 场地使用率
    @RequestMapping("data/venuePercentage")
    public String venuePercentage(DataInputView dataInputView, Model model) {
    	try{
    		model.addAllAttributes(dataService.getBusinessSiteCount(dataInputView));
    		model.addAllAttributes(dataService.getBusinessSiteSignCount(dataInputView));
    	}catch (Exception e) {
			e.printStackTrace();
		}
        return "Data/DataVenuePercentage";
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

        return "Schedule/OfficeSchedule";
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

        return "Training/TrainingList";
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

        return "Training/TrainingStudents";
    }
    // 课程创建
    @RequestMapping("training/create")
    public String renderTrainingCreate(Model model) {
        model.addAttribute("courseNames", trainsCourseService.getTrainsCourseNames());

        return "Training/TrainingCreate";
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

        return "Training/TrainingSignUp";
    }
}
