package com.park.controller;

import com.park.common.bean.*;
import com.park.common.exception.MessageException;
import com.park.common.po.*;
import com.park.common.util.JsonUtils;
import com.park.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wangjun on 16/11/17.
 */
@Controller
@RequestMapping("office")
public class OfficeController extends BaseController {

    @Autowired
    private INotificationsService notificationsService;

    @Autowired
    private ITrainsCourseService trainsCourseService;

    @Autowired
    private ITrainsClassService trainsClassService;

    @Autowired
    private ITrainsClassStudentsService trainsClassStudentsService;

    @Autowired
    private IOperatorService operatorService;

    // 获取发件人的通知管理
    @RequestMapping("notifications")
    public String notifications(NotificationsInputView notificationsInputView,
                                NotificationsUsersInputView notificationsUsersInputView, Model model) {
        try {
            OperatorInputView operatorInputView = new OperatorInputView();
            UserOperator userInfo = super.getUserInfo();
            model.addAllAttributes(JsonUtils.fromJsonDF(notificationsInputView));
            model.addAttribute("operators", operatorService.getOperatorsName(operatorInputView));
            PageBean pageBean = notificationsService.getNotificationsBySender(notificationsInputView, notificationsUsersInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Office/OfficeNotifications";
    }

    // 通知管理详情
    @ResponseBody
    @RequestMapping(value = "viewNotifications", method = RequestMethod.POST)
    public ResponseBean viewNotifications(int noteId) {
        try {
            return new ResponseBean(JsonUtils.fromJson(notificationsService.getNotificationInfo(noteId)));
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 通知管理删除
    @ResponseBody
    @RequestMapping(value = "deleteNotifications", method = RequestMethod.POST)
    public ResponseBean deleteNotifications(int noteId) {
        try {
            notificationsService.deleteNotification(noteId);
            return new ResponseBean(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 通知管理保存
    @ResponseBody
    @RequestMapping(value = "sendNotifications", method = RequestMethod.POST)
    public ResponseBean saveNotifications(NotificationsInfo notificationsInfo, NotificationsUsers notificationsUsers) {
        try {
            UserOperator userInfo = super.getUserInfo();

            Integer noteId = notificationsService.saveSetNotification(notificationsInfo, notificationsUsers);
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("noteId", noteId);
            return new ResponseBean(data);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 通知管理标记发送
    @ResponseBody
    @RequestMapping(value = "markNotificationRead", method = RequestMethod.POST)
    public ResponseBean markNotificationRead(int noteId) {
        try {
            notificationsService.saveMarkNotificationRead(noteId);
            return new ResponseBean(true);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 排班管理
    @RequestMapping("schedule")
    public String schedule(DataInputView dataInputView, Model model) {
    	try{
    		model.addAllAttributes(JsonUtils.fromJson(dataInputView));
            OperatorInputView operatorInputView = new OperatorInputView();
            model.addAttribute("operators", operatorService.getOperatorsName(operatorInputView));
    		model.addAttribute("schedules", operatorService.getUserSchedulings(dataInputView));
    	}catch(Exception e){
    		e.printStackTrace();
    	}
        return "Office/OfficeSchedule";
    }

    // 排班信息
    @ResponseBody
    @RequestMapping("scheduleInfo")
    public ResponseBean scheduleInfo(int schedulingId) {
        try {
            return new ResponseBean(JsonUtils.fromJson(operatorService.getUserScheduling(schedulingId)));
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }
    
    @ResponseBody
    @RequestMapping("saveSchedule")
    public ResponseBean saveSchedule(UserScheduling userScheduling){
    	try{
    		userScheduling.setSalesId(getUserInfo().getId());
    		Map<String, Object> data = new HashMap<String, Object>();
    		data.put("schedulingId", operatorService.saveUserScheduling(userScheduling));
    		return new ResponseBean(data);
    	} catch(MessageException e){
    		e.printStackTrace();
    		return new ResponseBean(e.getMessage());
    	} catch(Exception e){
    		e.printStackTrace();
    		return new ResponseBean(false);
    	}
    }

    // 培训课程管理
    @RequestMapping("getTrainsCourseList")
    public String getTrainsCourseList(TrainsCourseInputView trainsCourseInputView, Model model) {
        try {
            UserOperator userInfo = super.getUserInfo();
            trainsCourseInputView.setSaleId(userInfo.getId());
            model.addAllAttributes(JsonUtils.fromJsonDF(trainsCourseInputView));
            PageBean pageBean = trainsCourseService.getTrainsCourseList(trainsCourseInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Office/OfficeTrainsCourseList";
    }

    // 培训课程详情
    @ResponseBody
    @RequestMapping(value = "viewTrainsCourseInfo", method = RequestMethod.POST)
    public ResponseBean viewTrainsCourseInfo(int courseId) {
        try {
            return new ResponseBean(JsonUtils.fromJson(trainsCourseService.getTrainsCourseInfo(courseId)));
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 培训课程删除
    @ResponseBody
    @RequestMapping(value = "deleteTrainsCourseInfo", method = RequestMethod.POST)
    public ResponseBean deleteTrainsCourseInfo(int courseId) {
        try {
            trainsCourseService.deleteTrainsCourseInfo(courseId);
            return new ResponseBean(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 培训课程保存
    @ResponseBody
    @RequestMapping(value = "saveTrainsCourseInfo", method = RequestMethod.POST)
    public ResponseBean saveTrainsCourseInfo(TrainsCourseInfo trainsCourseInfo) {
        try {
            UserOperator userInfo = super.getUserInfo();
            trainsCourseInfo.setSaleId(userInfo.getId());

            Integer courseId = trainsCourseService.saveTrainsCourseInfo(trainsCourseInfo);
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("courseId", courseId);
            return new ResponseBean(data);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 培训班级管理
    @RequestMapping("getTrainsClassList")
    public String getTrainsClassList(TrainsClassInputView trainsClassInputView, Model model) {
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

        return "Office/OfficeTrainsClassList";
    }

    // 培训班级详情
    @ResponseBody
    @RequestMapping(value = "viewTrainsClassInfo", method = RequestMethod.POST)
    public ResponseBean viewTrainsClassInfo(int classId) {
        try {
            return new ResponseBean(JsonUtils.fromJson(trainsClassService.getTrainsClassInfo(classId)));
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 培训班级删除
    @ResponseBody
    @RequestMapping(value = "deleteTrainsClassInfo", method = RequestMethod.POST)
    public ResponseBean deleteTrainsClassInfo(int classId) {
        try {
            trainsClassService.deleteTrainsClassInfo(classId);
            return new ResponseBean(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 培训班级保存
    @ResponseBody
    @RequestMapping(value = "saveTrainsClassInfo", method = RequestMethod.POST)
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

    // 培训报名学生
    @RequestMapping("getTrainsStudents")
    public String getTrainsStudents(TrainsClassStudentsInputView trainsClassStudentsInputView, Model model) {
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

        return "Office/OfficeTrainsStudents";
    }

    // 培训报名详情
    @ResponseBody
    @RequestMapping(value = "getTrainsClassStudentsSign", method = RequestMethod.POST)
    public ResponseBean getTrainsClassStudentsSign(int signId) {
        try {
            return new ResponseBean(JsonUtils.fromJson(trainsClassStudentsService.getTrainsClassStudentsSign(signId)));
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 培训学生报名
    @ResponseBody
    @RequestMapping(value = "signTrainsStudents", method = RequestMethod.POST)
    public ResponseBean signTrainsStudents(TrainsClassStudents trainsClassStudents) {
        try {
            UserOperator userInfo = super.getUserInfo();
            trainsClassStudents.setSaleId(userInfo.getId());

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

    // 培训学生删除
    @ResponseBody
    @RequestMapping(value = "deleteTrainsStudents", method = RequestMethod.POST)
    public ResponseBean deleteTrainsStudents(int signId) {
        try {
            trainsClassStudentsService.deleteTrainsClassStudentsSign(signId);
            return new ResponseBean(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 培训学生支付
    @ResponseBody
    @RequestMapping(value = "payTrainsStudents", method = RequestMethod.POST)
    public ResponseBean payTrainsStudents(TrainsClassStudents trainsClassStudents) {
        try {
            UserOperator userInfo = super.getUserInfo();
            trainsClassStudents.setSaleId(userInfo.getId());

            Integer signId = trainsClassStudentsService.confirmTrainsClassStudentsPay(trainsClassStudents);
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
}
