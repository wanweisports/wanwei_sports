package com.park.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.common.bean.ResponseBean;
import com.park.common.exception.MessageException;
import com.park.common.po.UserScheduling;
import com.park.common.util.JsonUtils;
import com.park.service.IOperatorService;

/**
 * Created by wangjun on 16/11/21.
 */
@Controller
@RequestMapping("dashboard")
public class DashboardController extends BaseController {
	
	@Autowired
	private IOperatorService operatorService;
	
    // 场地实时
    @RequestMapping("led")
    public String getVenueLED(){
        return "Dashboard/DashboardLED";
    }

    // 值班表
    @RequestMapping("rota")
    public String getRota(Model model){
    	try{
    		model.addAttribute("rotas", operatorService.getUserSchedulings());
    		Map map = new HashMap<>();
    		map.put("rotas", (operatorService.getUserSchedulings()));
    		System.out.println(JsonUtils.toJson((map)));
    	}catch(Exception e){
    		e.printStackTrace();
    	}
        return "Dashboard/DashboardRota";
    }
    
    @ResponseBody
    @RequestMapping("saveRota")
    public ResponseBean saveRota(UserScheduling userScheduling){
    	try{
    		userScheduling.setSalesId(getUserInfo().getId());
    		Map<String, Object> data = new HashMap<String, Object>();
    		data.put("schedulingId", operatorService.saveUserScheduling(userScheduling));
    		return new ResponseBean(data);
    	} catch(MessageException e){
    		e.printStackTrace();
    		return new ResponseBean(e.getMessage());
    	} catch(Exception e){
    		e.printStackTrace();
    		return new ResponseBean(false);
    	}
    }
    
}
