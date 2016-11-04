package com.park.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.common.bean.MenuInputView;
import com.park.common.bean.ResponseBean;
import com.park.service.IMenuService;

@Controller
@RequestMapping("system")
public class SystemController extends BaseController {

	@Autowired
	private IMenuService menuService;
	
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
	
}
