package com.park.controller;

import com.park.common.bean.MenuInputView;
import com.park.common.bean.ResponseBean;
import com.park.common.exception.MessageException;
import com.park.common.po.UserOperator;
import com.park.platform.service.IMenuService;
import com.park.platform.service.IOperatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;


/**
 * Created by wangjun on 16/11/21.
 */
@Controller
@RequestMapping("home")
public class DashboardController extends BaseController {

    @Autowired
    private IMenuService menuService;

    @Autowired
    private IOperatorService operatorService;

    // 首页
    @RequestMapping("index")
    public String index(Model model){
        try {
            MenuInputView menuInputView = new MenuInputView();
            menuInputView.setOperatorId(super.getUserInfo().getOperatorId());
            model.addAttribute("menu", menuService.getMenus(menuInputView));
            model.addAttribute("user", operatorService.getOperator(super.getUserInfo().getOperatorId()));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Home/HomeIndex";
    }

    // 首页
    @RequestMapping("dashboard")
    public String dashboard(){
        return "Home/HomeDashboard";
    }
    
}
