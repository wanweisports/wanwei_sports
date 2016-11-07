package com.park.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.common.bean.OperatorInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.ResponseBean;
import com.park.common.bean.RoleInputView;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.ParkBusiness;
import com.park.common.po.UserOperator;
import com.park.common.util.JsonUtils;
import com.park.service.IOperatorService;
import com.park.service.IParkService;
import com.park.service.IRoleService;

/**
 * Created by wangjun on 16/10/12.
 */
@Controller
@RequestMapping("settings")
public class SettingsController extends BaseController {
	
	@Autowired
	private IParkService parkService;
	
	@Autowired
	private IOperatorService operatorService;
	
	@Autowired
	private IRoleService roleService;
	
    // 常用设置
    @RequestMapping("common")
    public String settingsCommon(Model model) {
    	try {
			model.addAllAttributes(JsonUtils.fromJson(parkService.getParkBusiness()));
			System.out.println(JsonUtils.toJson(parkService.getParkBusiness()));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "Settings/SettingsCommon";
    }
    
    @ResponseBody
    @RequestMapping("saveCommon")
    public ResponseBean saveCommon(ParkBusiness parkBusiness) {
    	try {
    		parkBusiness.setSalesId(super.getUserInfo().getId());
    		parkService.saveParkBusiness(parkBusiness);
			return new ResponseBean(true);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
    }

    // 用户设置详情
    @RequestMapping("getUsersView")
    public String getUsersView(String operatorId, Model model) {
    	try {
    		model.addAttribute("roleNames", roleService.getRoleNames(IDBConstant.ROLE_EMPLOYEE));
			model.addAllAttributes(operatorService.getEmployee(operatorId));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "Settings/SettingsSystemUsersView";
    }

    // 用户设置
    @RequestMapping("getUsers")
    public String getUsers(OperatorInputView operatorInputView, Model model) {
    	try {
    		model.addAllAttributes(JsonUtils.fromJsonDF(operatorInputView));
    		model.addAttribute("roleNames", roleService.getRoleNames(IDBConstant.ROLE_EMPLOYEE));
			PageBean pageBean = operatorService.getOperatorList(operatorInputView);
			super.setPageInfo(model, pageBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "Settings/SettingsSystemUsers";
    }
    
    //添加/修改员工信息
    @ResponseBody
    @RequestMapping("saveEmployee")
    public ResponseBean saveEmployee(UserOperator userOperator, int roleId){
    	try {
    		operatorService.saveEmployee(userOperator, roleId);
    		return new ResponseBean(true);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
    }
    
    //锁定/解锁员工信息
    @ResponseBody
    @RequestMapping("lockEmployee")
    public ResponseBean lockEmployee(String operatorId, boolean lock){
    	try {
    		operatorService.updateLockEmployee(operatorId, lock);
    		return new ResponseBean(true);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
    }

    // 角色设置详情
    @RequestMapping("getRolesView")
    public String getRolesView(Integer roleId, Model model) {
    	try {
    		if(roleId != null){
    			model.addAllAttributes(roleService.getRolesView(roleId));
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "Settings/SettingsSystemRolesView";
    }

    // 角色设置
    @RequestMapping("getRoles")
    public String getRoles(RoleInputView roleInputView, Model model) {
    	try{
    		model.addAllAttributes(JsonUtils.fromJsonDF(roleInputView));
    		roleInputView.setMinRoleId(IDBConstant.ROLE_EMPLOYEE);
            PageBean pageBean = roleService.getRoles(roleInputView);
            super.setPageInfo(model, pageBean);
    	} catch (Exception e) {
            e.printStackTrace();
        }
        return "Settings/SettingsSystemRoles";
    }

    // 通知设置
    @RequestMapping("notification")
    public String notification() {
        return "Settings/SettingsNotification";
    }

    // 数据库操作
    @RequestMapping("database")
    public String systemDatabase() {
        return "Settings/SettingsSystemDatabase";
    }

    // 系统操作日志
    @RequestMapping("systemLogs")
    public String systemLogs() {
        return "Settings/SettingsSystemLogs";
    }
    
}
