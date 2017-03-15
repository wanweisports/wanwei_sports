package com.park.controller.training;

import com.park.common.annotation.NotProtected;
import com.park.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangjun on 17/3/3.
 */
@Controller
@RequestMapping("training/settings")
public class SettingsController extends BaseController {

    // 课程设置
    @NotProtected
    @RequestMapping("course")
    public String renderSettingsCourse(){
        return "Training/Settings/SettingsCourse";
    }

    // 数据库备份与还原
    @NotProtected
    @RequestMapping("backup")
    public String renderSettingsBackup(){
        return "Training/Settings/SettingsBackup";
    }

    // 操作员设置
    @NotProtected
    @RequestMapping("operators")
    public String renderSettingsOperators(){
        return "Training/Settings/SettingsOperators";
    }

    // 其他设置
    @NotProtected
    @RequestMapping("others")
    public String renderSettingsOthers(){
        return "Training/Settings/SettingsOthers";
    }
}
