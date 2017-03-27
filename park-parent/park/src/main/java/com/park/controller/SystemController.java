package com.park.controller;

import com.park.common.bean.MenuInputView;
import com.park.common.bean.ResponseBean;
import com.park.platform.service.IMenuService;
import com.park.platform.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("system")
public class SystemController extends BaseController {

	@Autowired
	private IMenuService menuService;
	
	@Autowired
	private IRoleService roleService;
	
	@ResponseBody
	@RequestMapping("getMenus")
	public ResponseBean getMenus(){
		try {
			MenuInputView menuInputView = new MenuInputView();
			menuInputView.setOperatorId(super.getUserInfo().getOperatorId());
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("menus", menuService.getMenus(menuInputView));
			return new ResponseBean(data);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping("getAllRoles")
	public ResponseBean getAllRoles(){
		try {
			return new ResponseBean(roleService.getAllRoles(0));
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
}
