package com.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UrlController extends BaseController {
	
	@RequestMapping("request")
	public String toRequest() {
		return "Request";
	}
	
	@RequestMapping("regMember")
	public String toRegMember() {
		return "member/RegMember";
	}
	
	@RequestMapping("request2")
	public String toRequest2() {
		return "Request2";
	}

	@RequestMapping("/users/membersQuery")
	public String MembersList() {
		return "Members/MembersList";
	}

}












