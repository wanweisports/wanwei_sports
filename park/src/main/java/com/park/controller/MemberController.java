package com.park.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.common.bean.BalanceInputView;
import com.park.common.bean.InvoiceInputView;
import com.park.common.bean.MemberCardOpInputView;
import com.park.common.bean.MemberInputView;
import com.park.common.bean.ResponseBean;
import com.park.common.exception.MessageException;
import com.park.common.po.MemberCard;
import com.park.common.po.MemberCardType;
import com.park.common.po.OtherBalance;
import com.park.common.po.OtherInvoice;
import com.park.common.po.UserMember;
import com.park.common.util.JsonUtils;
import com.park.service.IMemberService;

@Controller
@RequestMapping("member")
public class MemberController extends BaseController {
	
	@Autowired
	private IMemberService memberService;
	
	@ResponseBody
	@RequestMapping(value = "saveMember", method = RequestMethod.POST)
	public ResponseBean saveMember(String param){
		try {
			Integer memberId = memberService.saveMember(super.getData(param, UserMember.class));
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("memberId", memberId);
			return new ResponseBean(data);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "saveMemberCar", method = RequestMethod.POST)
	public ResponseBean saveMemberCar(String param){
		try {
			Map<String, Object> balanceMap = memberService.saveMemberCar(super.getData(param, MemberCard.class), super.getData(param, OtherBalance.class));
			return new ResponseBean(balanceMap);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "getMemberCarTypes", method = RequestMethod.POST)
	public ResponseBean getMemberCarTypes(String param, HttpServletResponse response) {
		try {
			Map<String, Object> memberCarTypes = new HashMap<String, Object>();
			memberCarTypes.put("memberCarTypes", memberService.getMemberCarTypes());
			return new ResponseBean(memberCarTypes);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "getMemberCarType", method = RequestMethod.POST)
	public ResponseBean getMemberCarType(String param) {
		try {
			return new ResponseBean(memberService.getMemberCardTypeMap(super.getData(param, MemberCardType.class).getCardTypeId()));
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "saveInvoice", method = RequestMethod.POST)
	public ResponseBean saveInvoice(String param) {
		try {
			Integer invoiceId = memberService.saveInvoice(super.getData(param, OtherInvoice.class));
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("invoiceId", invoiceId);
			return new ResponseBean(data);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "getUserMembers", method = RequestMethod.POST)
	public ResponseBean getUserMembers(String param, HttpServletResponse response) {
		try {
			return new ResponseBean(JsonUtils.fromJsonDF(memberService.getUserMembers(super.getData(param, MemberInputView.class))));
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "getMemberAndCard", method = RequestMethod.POST)
	public ResponseBean getMemberAndCard(String param) {
		try {
			return new ResponseBean(JsonUtils.fromJsonDF(memberService.getUserMemberAndCard(super.getData(param, UserMember.class).getMemberId())));
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "saveMemberCardType", method = RequestMethod.POST)
	public ResponseBean saveMemberCardType(String param) {
		try {
			Integer cardTypeId = memberService.saveMemberCardType(super.getData(param, MemberCardType.class));
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("cardTypeId", cardTypeId);
			return new ResponseBean(data);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		}  catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "memberCardUpLevel", method = RequestMethod.POST)
	public ResponseBean memberCardUpLevel(String param) {
		try {
			Integer cardId = memberService.updateMemberCardUpLevel(super.getData(param, MemberCardOpInputView.class));
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("cardId", cardId);
			return new ResponseBean(data);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		}  catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "memberCardCZ", method = RequestMethod.POST)
	public ResponseBean memberCardCZ(String param) {
		try {
			Integer cardId = memberService.updateMemberCardCZ(super.getData(param, MemberCardOpInputView.class));
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("cardId", cardId);
			return new ResponseBean(data);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		}  catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "memberCardBuBan", method = RequestMethod.POST)
	public ResponseBean memberCardBuBan(String param) {
		try {
			Integer cardId = memberService.updateMemberCardBuBan(super.getData(param, MemberCardOpInputView.class));
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("cardId", cardId);
			return new ResponseBean(data);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		}  catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "getBalances", method = RequestMethod.POST)
	public ResponseBean getBalances(String param, HttpServletResponse response) {
		try {
			return new ResponseBean(JsonUtils.fromJsonDF(memberService.getBalances(super.getData(param, BalanceInputView.class))));
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "getInvoices", method = RequestMethod.POST)
	public ResponseBean getInvoices(String param, HttpServletResponse response) {
		try {
			return new ResponseBean(JsonUtils.fromJsonDF(memberService.getInvoices(super.getData(param, InvoiceInputView.class))));
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "updateGetInvoices", method = RequestMethod.POST)
	public ResponseBean updateGetInvoices(String param) {
		try {
			memberService.updateGetInvoices(super.getData(param, InvoiceInputView.class).getInvoiceIds());
			return new ResponseBean(true);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		}  catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}

}












