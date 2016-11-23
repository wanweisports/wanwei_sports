package com.park.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.park.common.bean.MemberSignInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.ResponseBean;
import com.park.common.exception.MessageException;
import com.park.common.po.MemberSiteSign;
import com.park.common.util.JsonUtils;
import com.park.service.IMemberSignService;

@Controller
@RequestMapping("memberSign")
public class MemberSignController extends BaseController {

	@Autowired
	private IMemberSignService memberSignService;
	
	@RequestMapping("getSigns")
	public String getSiteSports(MemberSignInputView memberSignInputView, Model model) {
		try {
			model.addAllAttributes(JsonUtils.fromJsonDF(memberSignInputView));
			PageBean pageBean = memberSignService.getSigns(memberSignInputView);
			super.setPageInfo(model, pageBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	@RequestMapping("memberSign")
	public ResponseBean memberSign(MemberSiteSign memberSiteSign){
		try {
			memberSiteSign.setSalesId(super.getUserInfo().getId());
			memberSignService.saveSign(memberSiteSign);
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
