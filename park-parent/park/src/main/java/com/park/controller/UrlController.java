package com.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UrlController extends BaseController {

    @RequestMapping("request")
	public String toRequest() {
		return "Request";
	}
	
	@RequestMapping("request2")
	public String toRequest2() {
		return "Request2";
	}
	
	// 登录后主页
    @RequestMapping("loginWelCome")
    public String loginWelCome() {
        return "LoginWelCome";
    }

    // 帮助文档
    @RequestMapping("/error/questions")
    public String errorQuestions() {
        return "Error/Questions";
    }

	// 我的消息
	@RequestMapping("/passport/message")
    public String notificationsReceiver( Model model) {
        return "Center/CenterNotification";
    }
}












