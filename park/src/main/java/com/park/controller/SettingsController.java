package com.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangjun on 16/10/12.
 */
@Controller
public class SettingsController extends BaseController {
    // 常用设置
    @RequestMapping("settings/common")
    public String settingsCommon() {
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
}
