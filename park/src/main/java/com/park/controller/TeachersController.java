package com.park.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.park.common.bean.MemberInputView;
import com.park.common.bean.PageBean;
import com.park.common.constant.IDBConstant;
import com.park.common.util.JsonUtils;
import com.park.service.IMemberService;

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
    public String teachersRegister() {
        return "Teachers/TeachersCreate";
    }

    // 教师查询
    @RequestMapping("list")
    public String teachersList(MemberInputView memberInputView, Model model) {
    	try {
            model.addAllAttributes(JsonUtils.fromJsonDF(memberInputView));
            memberInputView.setCardTypeId(IDBConstant.LOGIC_STATUS_YES); //教师卡类型
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
    public String teachersView() {
        return "Teachers/TeachersView";
    }

    // 教师用场流水
    @RequestMapping("data")
    public String teachersVenueData() {return "Teachers/TeachersVenueData";}

    // 教师订单统计
    @RequestMapping("orderMeal")
    public String teachersOrderMeal() {return "Teachers/TeachersMealData";}
}
