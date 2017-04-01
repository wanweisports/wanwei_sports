package com.park.controller;

import com.park.common.bean.*;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.TrainsClassInfo;
import com.park.common.po.TrainsClassStudents;
import com.park.common.po.UserOperator;
import com.park.common.util.JsonUtils;
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
@RequestMapping("oa")
public class NotificationsController extends BaseController {

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

    // 通知消息列表
    @RequestMapping("getNotifications")
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

        return "OA/OANotifications";
    }

    // 通知消息详情
    @RequestMapping("notificationsDetail")
    public String notificationsDetail(int noteId, Model model) {
        try {
            model.addAllAttributes(JsonUtils.fromJsonDF(notificationsService.getNotificationInfo(noteId)));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "OA/OANotificationsDetail";
    }

    // 获取消息列表
    @RequestMapping("getMessage")
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

        return "OA/OAMessage";
    }

    // 通知消息创建
    @RequestMapping("notificationsCreate")
    public String notificationsCreate() {
        return "OA/OANotificationsCreate";
    }

}
