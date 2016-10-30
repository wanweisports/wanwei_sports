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
import com.park.common.util.StrUtil;
import com.park.service.IMemberService;

@Controller
@RequestMapping("member")
public class MemberController extends BaseController {

    @Autowired
    private IMemberService memberService;

    /**
     * [页面]注册会员的录入会员信息页面,自动生成会员卡的编号
     * @param model
     * @return
     */
    @RequestMapping("regMember")
	public String toRegMember(Model model) {
		model.addAttribute("cardNo", memberService.getCardNo()); //注册会员之前，生成会员号
		return "Members/RegMember";
	}

    /**
     * [API]注册会员的录入会员信息保存
     * @param userMember
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "saveMember", method = RequestMethod.POST)
    public ResponseBean saveMember(UserMember userMember){
        try {
            UserOperator userOperator = super.getUserInfo();
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

    /**
     * [页面]会员绑卡页面, 根据录入信息的支付类型, 显示会员类型列表
     * @param memberId 会员ID
     * @param model
     * @return
     */
    @RequestMapping("membersInfoCar")
	public String toMembersInfoCar(Integer memberId, Model model) {
		Map<String, Object> regMember = memberService.getRegMember(memberId);
		model.addAllAttributes(regMember);
		MemberInputView memberInputView = new  MemberInputView();
		memberInputView.setCardType(regMember.get("memberType").toString());
		model.addAttribute("memberCarTypeNames", memberService.getMemberCarTypeNames(memberInputView));
		return "Members/MembersInfoCar";
	}

    /**
     * [API]更新部分会员信息, 手机号, 姓名等
     * @param userMember
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "updateMemberName", method = RequestMethod.POST)
    public ResponseBean updateMemberName(UserMember userMember){
        try {
            memberService.updateMemberName(userMember);
            return new ResponseBean(true);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    /**
     * [API]会员绑卡提交
     * @param memberCard
     * @param otherBalance
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "saveMemberCar", method = RequestMethod.POST)
    public ResponseBean saveMemberCar(MemberCard memberCard, OtherBalance otherBalance){
        try {
            UserOperator userOperator = super.getUserInfo();
            memberCard.setSalesId(userOperator.getId());
            Map<String, Object> balanceMap = memberService.saveMemberCar(memberCard, otherBalance);
            return new ResponseBean(balanceMap);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    /**
     * [API]查询所有的会员卡类型
     * @param memberInputView
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getMemberCarTypeNames")
    public ResponseBean getMemberCarTypeNames(MemberInputView memberInputView) {
        try {
            //model.addAttribute("memberCarTypes", memberService.getMemberCarTypeNames());
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("memberCarTypeNames", memberService.getMemberCarTypeNames(memberInputView));
            return new ResponseBean(data);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }

    }

    /**
     * 显示会员卡类型设置页面, 页面内容包括当前会员卡类型数据
     * @param memberInputView 可作为查询条件的会员字段
     * @param model
     * @return
     */
    @RequestMapping(value = "getMemberCarTypes")
    public String getMemberCarTypes(MemberInputView memberInputView, Model model) {
        try {
            model.addAllAttributes(JsonUtils.fromJsonDF(memberInputView));
            PageBean pageBean = memberService.getMemberCarTypes(memberInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Members/MembersCarTypeList";
    }

    /**
     * 根据会员卡类型ID,获取会员卡类型详情
     * @param cardTypeId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getMemberCarType", method = RequestMethod.POST)
    public ResponseBean getMemberCarType(Integer cardTypeId) {
        try {
            return new ResponseBean(memberService.getMemberCardTypeMap(cardTypeId));
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    /**
     * 保存(增加或者更新)会员卡类型,cardTypeId有值为更新
     * @param memberCardType
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "saveMemberCardType", method = RequestMethod.POST)
    public ResponseBean saveMemberCardType(MemberCardType memberCardType) {
        try {
            UserOperator userOperator = super.getUserInfo();
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
    @RequestMapping(value = "saveInvoice", method = RequestMethod.POST)
    public ResponseBean saveInvoice(OtherInvoice otherInvoice) {
        try {
            UserOperator userOperator = super.getUserInfo();
            otherInvoice.setSalesId(userOperator.getId());
            Integer invoiceId = memberService.saveInvoice(otherInvoice);
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

    @RequestMapping(value = "memberList")
    public String getUserMembers(MemberInputView memberInputView, Model model) {
        try {
            model.addAllAttributes(JsonUtils.fromJsonDF(memberInputView));
            PageBean pageBean = memberService.getUserMembers(memberInputView);
            super.setPageInfo(model, pageBean);
            model.addAttribute("memberCarTypeNames", memberService.getMemberCarTypeNames(memberInputView));
            //return new ResponseBean(JsonUtils.fromJsonDF(memberService.getUserMembers(super.getData(param, MemberInputView.class))));
        } catch (Exception e) {
            e.printStackTrace();
            //return new ResponseBean(false);
        }
        return "Members/MembersList";
    }

    @RequestMapping(value = "memberInfo")
    public String getMemberAndCard(Integer memberId, Model model) {
        try {
            Map<String, Object> userMemberAndCard = memberService.getUserMemberAndCard(memberId);
            model.addAllAttributes(userMemberAndCard);
            MemberInputView memberInputView = new  MemberInputView();
            memberInputView.setCardType(userMemberAndCard.get("memberType").toString());
            model.addAttribute("memberCarTypeNames", memberService.getMemberCarTypeNames(memberInputView));
            //return new ResponseBean(JsonUtils.fromJsonDF(memberService.getUserMemberAndCard(super.getData(param, UserMember.class).getMemberId())));
        } catch (MessageException e) {
            e.printStackTrace();
            //return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            //return new ResponseBean(false);
        }
        return "Members/MembersInfo";
    }

    @ResponseBody
    @RequestMapping(value = "memberCardUpLevel", method = RequestMethod.POST)
    public ResponseBean memberCardUpLevel(MemberCardOpInputView memberCardOpInputView) {
        try {
            UserOperator userOperator = super.getUserInfo();
            memberCardOpInputView.setSalesId(userOperator.getId());
            Integer cardId = memberService.updateMemberCardUpLevel(memberCardOpInputView);
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
    public ResponseBean memberCardCZ(MemberCardOpInputView memberCardOpInputView) {
        try {
            UserOperator userOperator = super.getUserInfo();
            memberCardOpInputView.setSalesId(userOperator.getId());
            Integer cardId = memberService.updateMemberCardCZ(memberCardOpInputView);
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
    public ResponseBean memberCardBuBan(MemberCardOpInputView memberCardOpInputView) {
        try {
            UserOperator userOperator = super.getUserInfo();
            memberCardOpInputView.setSalesId(userOperator.getId());
            Integer cardId = memberService.updateMemberCardBuBan(memberCardOpInputView);
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
            model.addAllAttributes(JsonUtils.fromJsonDF(balanceInputView));
            PageBean pageBean = memberService.getBalances(balanceInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Members/BalanceList";
    }

    @RequestMapping(value = "getInvoices")
    public String getInvoices(InvoiceInputView invoiceInputView, Model model) {
        try {
            model.addAllAttributes(JsonUtils.fromJsonDF(invoiceInputView));
            PageBean pageBean = memberService.getInvoices(invoiceInputView);
            super.setPageInfo(model, pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Members/InvoiceList";
    }

    @ResponseBody
    @RequestMapping(value = "updateGetInvoices", method = RequestMethod.POST)
    public ResponseBean updateGetInvoices(String invoiceIds) {
        try {
            memberService.updateGetInvoices(invoiceIds);
            return new ResponseBean(true);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    /*@RequestMapping(value = "getOperations")
    public String getOperations(String cardNo, Model model) {
        try {
            if(StrUtil.isNotBlank(cardNo)){
                model.addAllAttributes(memberService.getOperations(cardNo));
            }
            model.addAttribute("memberCarTypeNames", memberService.getMemberCarTypeNames(new MemberInputView()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Members/MembersOperations";
    }*/

    @RequestMapping(value = "getMembersCardRecharge")
    public String getMembersCardRecharge(String cardNo, Model model) {
        try {
            if(StrUtil.isNotBlank(cardNo)){
                model.addAllAttributes(memberService.getOperations(cardNo));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Members/MembersCardRecharge";
    }

    @RequestMapping(value = "getMembersCardRefresh")
    public String getMembersCardRefresh(String cardNo, Model model) {
        try {
            if(StrUtil.isNotBlank(cardNo)){
                model.addAllAttributes(memberService.getOperations(cardNo));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Members/MembersCardRefresh";
    }

    @RequestMapping(value = "getMembersCardUpgrade")
    public String getMembersCardUpgrade(String cardNo, Model model) {
        try {
            if(StrUtil.isNotBlank(cardNo)){
                model.addAllAttributes(memberService.getOperations(cardNo));
            }
            model.addAttribute("memberCarTypeNames", memberService.getMemberCarTypeNames(new MemberInputView()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Members/MembersCardUpgrade";
    }

    @ResponseBody
    @RequestMapping(value = "getNewCardNo", method = RequestMethod.POST)
    public ResponseBean getNewCardNo(Model model) {
        try {
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("newCardNo", memberService.getCardNo());
            return new ResponseBean(data);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    //获取会员名称列表
    @ResponseBody
    @RequestMapping("getMemberNames")
    public ResponseBean getMemberNames(MemberInputView memberInputView){
        try {
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("memberNames", memberService.getMemberNames(memberInputView));
            return new ResponseBean(data);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 应收款管理
    @RequestMapping(value = "getMembersLoans")
    public String getMembersLoans(Model model) {
        return "Members/MembersLoans";
    }

    // 会员卡注销
    @RequestMapping(value = "getMembersCardCancel")
    public String getMembersCardCancel(Model model) {
        return "Members/MembersCardCancel";
    }

    // 会员卡消费查询
    @RequestMapping(value = "getConsumes")
    public String getConsumes(Model model) {
        return "Members/ConsumeList";
    }
    
    /**
     * 查询是个全文模糊查询  即我可能输入手机号，姓名，身份证号，会员卡号信息  来匹配会员
     */
    @ResponseBody
    @RequestMapping("searchMember")
    public ResponseBean searchMember(String search){
    	try{
    		Map<String, Object> data = new HashMap<String, Object>();
            data.put("members", memberService.searchMember(search));
            return new ResponseBean(data);
    	} catch (MessageException e) {
    		e.printStackTrace();
    		return new ResponseBean(e.getMessage());
		} catch (Exception e) {
    		e.printStackTrace();
    		return new ResponseBean(true);
		}
    }

}
