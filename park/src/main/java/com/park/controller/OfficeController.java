package com.park.controller;

import com.park.common.bean.*;
import com.park.common.exception.MessageException;
import com.park.common.po.NotificationsInfo;
import com.park.common.po.UserOperator;
import com.park.common.po.UserScheduling;
import com.park.common.util.JsonUtils;
import com.park.service.INotificationsService;
import com.park.service.IOperatorService;
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
    private IOperatorService operatorService;

    // 通知管理
    @RequestMapping("notifications")
    public String notifications(NotificationsInputView notificationsInputView, Model model) {
        try {
            OperatorInputView operatorInputView = new OperatorInputView();
            UserOperator userInfo = super.getUserInfo();
            notificationsInputView.setNoteSender(userInfo.getId());
            model.addAllAttributes(JsonUtils.fromJsonDF(notificationsInputView));
            model.addAttribute("operators", operatorService.getOperatorsName(operatorInputView));
            PageBean pageBean = notificationsService.getNotifications(notificationsInputView);
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
    @RequestMapping(value = "saveNotifications", method = RequestMethod.POST)
    public ResponseBean saveNotifications(NotificationsInfo notificationsInfo, MultipartHttpServletRequest multipartRequest) {
        try {
            UserOperator userInfo = super.getUserInfo();
            notificationsInfo.setNoteSender(userInfo.getId());

            Integer noteId = notificationsService.saveSetNotification(notificationsInfo, multipartRequest);
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

    // 通知管理保存
    @ResponseBody
    @RequestMapping(value = "sendNotifications", method = RequestMethod.POST)
    public ResponseBean sendNotifications(int noteId) {
        try {
            Integer notificationId = notificationsService.saveSendNotification(noteId);
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("noteId", notificationId);
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

    // 培训报名
    @RequestMapping("trains")
    public String trains() {
        return "Office/OfficeTrains";
    }
    // 培训报名学生
    @RequestMapping("trainsStudents")
    public String trainsStuednts() {
        return "Office/OfficeTrainsStudents";
    }
}
