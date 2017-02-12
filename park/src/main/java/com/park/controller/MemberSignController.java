package com.park.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.common.annotation.NotProtected;
import com.park.common.bean.MemberSignInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.ResponseBean;
import com.park.common.exception.MessageException;
import com.park.common.po.MemberSiteSign;
import com.park.common.util.JsonUtils;
import com.park.push.WebSocketTest;
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
	
	@ResponseBody
	@RequestMapping("memberSign")
	public ResponseBean memberSign(MemberSiteSign memberSiteSign, Integer memberId, String reserveTimeIds){
		try {
			memberSiteSign.setSalesId(super.getUserInfo().getId());
			memberSignService.saveSign(memberSiteSign, memberId, reserveTimeIds);
			return new ResponseBean(true);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping("getSignSites")
	public ResponseBean getSignSites(String signType, String signMemberCardNo, String mobile){
		try {
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("signSites", memberSignService.getSignSites(signType, signMemberCardNo, mobile));
			return new ResponseBean(data);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@RequestMapping("toQr")
    public String toQr(Model model, HttpSession httpSession){
    	model.addAttribute("sessionId", httpSession.getId());
    	return "";
    }
    
    @NotProtected
    @RequestMapping("qrSign")
    public void qrSign(String sessionId, HttpSession httpSession) throws IOException {
    	
    	Session session = WebSocketTest.getSession(sessionId);
    	session.getBasicRemote().sendText();
    	
    	return;
    }
	
}
