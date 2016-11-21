package com.park.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.common.annotation.NotProtected;
import com.park.common.bean.ResponseBean;
import com.park.common.exception.MessageException;
import com.park.common.po.ParkBusiness;
import com.park.common.po.UserOperator;
import com.park.service.IInitService;

/**
 * Created by wangjun on 16/10/26.
 */
@Controller
@RequestMapping("init")
public class InitController extends BaseController {
	
	@Autowired
	private IInitService initService;
	
    // 初始化系统
	@NotProtected
    @RequestMapping("settings")
    public String typeGood(){
        return "Init/InitSettings";
    }
    
    @ResponseBody
    @RequestMapping("saveInit")
    public ResponseBean saveInit(ParkBusiness parkBusiness, UserOperator operator){
    	try {
    		initService.saveInit(parkBusiness, operator);
			return new ResponseBean(true);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
    }
    
}
