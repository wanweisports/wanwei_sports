package com.park.controller;

import com.park.common.bean.NotificationsInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.ResponseBean;
import com.park.common.util.JsonUtils;
import com.park.service.INotificationsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by wangjun on 16/11/17.
 */
@Controller
@RequestMapping("office")
public class OfficeController extends BaseController {

    @Autowired
    private INotificationsService notificationsService;

    // 通知管理
    @RequestMapping("notifications")
    public String notifications(NotificationsInputView notificationsInputView, Model model) {
        try {
            model.addAllAttributes(JsonUtils.fromJsonDF(notificationsInputView));
            //model.addAttribute("noteStatus", notificationsService.getGoodTypeNames());
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
            return new ResponseBean(JsonUtils.fromJsonDF(notificationsService.getNotificationInfo(noteId)));
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

    // 排班管理
    @RequestMapping("schedule")
    public String schedule() {
        return "Office/OfficeSchedule";
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
