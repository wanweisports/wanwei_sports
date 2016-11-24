package com.park.controller;

import com.park.common.exception.MessageException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.park.common.bean.MemberInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IDBConstant;
import com.park.common.util.JsonUtils;
import com.park.service.IMemberService;

import java.util.Map;

/**
 * Created by wangjun on 16/11/15.
 */
@Controller
@RequestMapping("teachers")
public class TeachersController extends BaseController {
	
	@Autowired
	private IMemberService memberService;
	
    // 教师注册
    @RequestMapping("register")
    public String teachersRegister(Model model) {
        model.addAttribute("cardNo", memberService.getCardNo()); //注册会员之前，生成会员号
        return "Teachers/TeachersCreate";
    }

    // 教师查询
    @RequestMapping("list")
    public String teachersList(MemberInputView memberInputView, Model model) {
    	try {
            model.addAllAttributes(JsonUtils.fromJsonDF(memberInputView));
            memberInputView.setCardTypeId(IDBConstant.CARD_TEACHERS); //教师卡类型
            PageBean pageBean = memberService.getUserMembers(memberInputView);
            super.setPageInfo(model, pageBean);
            //model.addAttribute("memberCarTypeNames", memberService.getMemberCarTypeNames(memberInputView));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Teachers/TeachersList";
    }

    // 教师查询
    @RequestMapping("view")
    public String teachersView(Integer memberId, Model model) {
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
        return "Teachers/TeachersView";
    }

    // 教师用场流水
    @RequestMapping("data")
    public String teachersVenueData() {return "Teachers/TeachersVenueData";}

    // 教师订单统计
    @RequestMapping("orderMeal")
    public String teachersOrderMeal() {return "Teachers/TeachersMealData";}
}
