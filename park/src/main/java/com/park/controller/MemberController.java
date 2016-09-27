package com.park.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.common.bean.BalanceInputView;
import com.park.common.bean.InvoiceInputView;
import com.park.common.bean.MemberCardOpInputView;
import com.park.common.bean.MemberInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.ResponseBean;
import com.park.common.exception.MessageException;
import com.park.common.po.MemberCard;
import com.park.common.po.MemberCardType;
import com.park.common.po.OtherBalance;
import com.park.common.po.OtherInvoice;
import com.park.common.po.UserMember;
import com.park.common.po.UserOperator;
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
			UserOperator userOperator = super.getUserInfo();
			UserMember userMember = super.getData(param, UserMember.class);
			userMember.setSalesId(userOperator.getId());
			Integer memberId = memberService.saveMember(userMember);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("memberId", memberId);
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
	@RequestMapping(value = "updateMemberName", method = RequestMethod.POST)
	public ResponseBean updateMemberName(String param){
		try {
			memberService.updateMemberName(super.getData(param, UserMember.class));
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
	@RequestMapping(value = "saveMemberCar", method = RequestMethod.POST)
	public ResponseBean saveMemberCar(String param){
		try {
			UserOperator userOperator = super.getUserInfo();
			MemberCard memberCard = super.getData(param, MemberCard.class);
			memberCard.setSalesId(userOperator.getId());
			Map<String, Object> balanceMap = memberService.saveMemberCar(memberCard, super.getData(param, OtherBalance.class));
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
	@RequestMapping(value = "getMemberCarTypeNames")
	public ResponseBean getMemberCarTypeNames() {
		try {
			//model.addAttribute("memberCarTypes", memberService.getMemberCarTypeNames());
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("memberCarTypeNames", memberService.getMemberCarTypeNames());
			return new ResponseBean(data);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
		
	}
	
	@RequestMapping(value = "getMemberCarTypes")
	public String getMemberCarTypes(MemberInputView memberInputView, Model model) {
		try {
			PageBean pageBean = memberService.getMemberCarTypes(memberInputView);
			model.addAttribute("list", pageBean.getList());
			model.addAttribute("count", pageBean.getCount());
			model.addAttribute("lastPage", pageBean.getLastPage());
			model.addAttribute("currentPage", pageBean.getCurrentPage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Member/MemberCarTypeList";
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
			UserOperator userOperator = super.getUserInfo();
			OtherInvoice invoice = super.getData(param, OtherInvoice.class);
			invoice.setSalesId(userOperator.getId());
			Integer invoiceId = memberService.saveInvoice(invoice);
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
	
	@RequestMapping(value = "getUserMembers")
	public String getUserMembers(MemberInputView memberInputView, Model model) {
		try {
			PageBean pageBean = memberService.getUserMembers(memberInputView);
			model.addAttribute("list", pageBean.getList());
			model.addAttribute("count", pageBean.getCount());
			model.addAttribute("lastPage", pageBean.getLastPage());
			model.addAttribute("currentPage", pageBean.getCurrentPage());
			//return new ResponseBean(JsonUtils.fromJsonDF(memberService.getUserMembers(super.getData(param, MemberInputView.class))));
		} catch (Exception e) {
			e.printStackTrace();
			//return new ResponseBean(false);
		}
		return "Member/MemberList";
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
			UserOperator userOperator = super.getUserInfo();
			MemberCardType memberCardType = super.getData(param, MemberCardType.class);
			memberCardType.setSalesId(userOperator.getId());
			Integer cardTypeId = memberService.saveMemberCardType(memberCardType);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("cardTypeId", cardTypeId);
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
		} catch (Exception e) {
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
		} catch (Exception e) {
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
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}
	
	@RequestMapping(value = "getBalances")
	public String getBalances(BalanceInputView balanceInputView, Model model) {
		try {
			PageBean pageBean = memberService.getBalances(balanceInputView);
			model.addAttribute("list", pageBean.getList());
			model.addAttribute("count", pageBean.getCount());
			model.addAttribute("lastPage", pageBean.getLastPage());
			model.addAttribute("currentPage", pageBean.getCurrentPage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Balance/BalanceList";
	}
	
	@RequestMapping(value = "getInvoices")
	public String getInvoices(InvoiceInputView invoiceInputView, Model model) {
		try {
			PageBean pageBean = memberService.getInvoices(invoiceInputView);
			model.addAttribute("list", pageBean.getList());
			model.addAttribute("count", pageBean.getCount());
			model.addAttribute("lastPage", pageBean.getLastPage());
			model.addAttribute("currentPage", pageBean.getCurrentPage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Invoice/InvoiceList";
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
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
	}

}












