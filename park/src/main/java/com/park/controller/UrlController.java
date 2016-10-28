package com.park.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.park.common.bean.ResponseBean;
import com.park.common.exception.MessageException;
import com.park.service.IOperatorService;

@Controller
public class UrlController extends BaseController {
	
	@Autowired
	private IOperatorService operatorService;
	
	@RequestMapping("request")
	public String toRequest() {
		return "Request";
	}
	
	@RequestMapping("request2")
	public String toRequest2() {
		return "Request2";
	}

	//列表页需要获取数据再返回, 因为回填到页面，必须先获取到数据再返回到页面，并不能直接返回到页面，除非Ajax请求可以先返回到页面。
	/*@RequestMapping("/users/membersQuery")
	public String MembersList() { 
		return "Members/MembersList";
	}*/
	
    // 登录
	@RequestMapping("/passport/login")
	public String passportLogin() {
		return "Passport/PassportLogin";
	}
	
	@RequestMapping("/passport/submitUserLogin")
	public ResponseBean submitUserLogin(String name, String pwd) {
		try{
			return null;
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
		
	}

    // 完善信息
    @RequestMapping("/passport/profile")
    public String passportProfile() {
        return "Center/CenterProfileComplete";
    }

    // 修改密码
    @RequestMapping("/passport/modifyPassword")
    public String modifyPassword() {
        return "Center/CenterPasswordModification";
    }

    // 帮助文档
    @RequestMapping("/error/questions")
    public String errorQuestions() {
        return "Error/Questions";
    }

}












