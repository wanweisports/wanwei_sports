package com.park.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.park.common.po.ParkBusiness;
import com.park.service.IParkService;

/**
 * Created by wangjun on 16/10/12.
 */
@Controller
public class SettingsController extends BaseController {
	
	@Autowired
	private IParkService parkService;
	
    // 常用设置
    @RequestMapping("settings/common")
    public String settingsCommon(ParkBusiness parkBusiness, Model model) {
    	try {
			model.addAttribute("businessId", parkService.saveParkBusiness(parkBusiness));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "Settings/SettingsCommon";
    }

    // 用户设置详情
    @RequestMapping("settings/getUsersView")
    public String getUsersView() {
        return "Settings/SettingsSystemUsersView";
    }

    // 用户设置
    @RequestMapping("settings/getUsers")
    public String getUsers() {
        return "Settings/SettingsSystemUsers";
    }

    // 角色设置详情
    @RequestMapping("settings/getRolesView")
    public String getRolesView() {
        return "Settings/SettingsSystemRolesView";
    }

    // 角色设置
    @RequestMapping("settings/getRoles")
    public String getRoles() {
        return "Settings/SettingsSystemRoles";
    }

    // 通知设置
    @RequestMapping("settings/notification")
    public String notification() {
        return "Settings/SettingsNotification";
    }

    // 数据库操作
    @RequestMapping("settings/database")
    public String systemDatabase() {
        return "Settings/SettingsSystemDatabase";
    }

    // 系统操作日志
    @RequestMapping("settings/systemLogs")
    public String systemLogs() {
        return "Settings/SettingsSystemLogs";
    }
}
