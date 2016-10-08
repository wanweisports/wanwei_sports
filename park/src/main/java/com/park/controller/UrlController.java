package com.park.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.park.common.bean.MemberInputView;
import com.park.service.IMemberService;

@Controller
public class UrlController extends BaseController {
	
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping("request")
	public String toRequest() {
		return "Request";
	}
	
	@RequestMapping("member/regMember")
	public String toRegMember(Model model) {
		model.addAttribute("cardNo", memberService.getCardNo()); //注册会员之前，生成会员号
		return "Members/RegMember";
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
	
	@RequestMapping("member/membersInfoCar")
	public String toMembersInfoCar(Integer memberId, String cardNo, Model model) {
		Map<String, Object> regMember = memberService.getRegMember(memberId);
		regMember.put("cardNo", cardNo);
		model.addAllAttributes(regMember);
		MemberInputView memberInputView = new  MemberInputView();
		memberInputView.setCardType(regMember.get("memberType").toString());
		model.addAttribute("memberCarTypeNames", memberService.getMemberCarTypeNames(memberInputView));
		return "Members/MembersInfoCar";
	}

}












