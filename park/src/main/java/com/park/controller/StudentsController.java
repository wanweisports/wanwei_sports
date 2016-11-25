package com.park.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.common.bean.MemberCardOpInputView;
import com.park.common.bean.PageBean;
import com.park.common.bean.ResponseBean;
import com.park.common.bean.StudentInputView;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.UserOperator;
import com.park.common.po.UserStudent;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.service.IMemberService;
import com.park.service.IStudentService;

/**
 * Created by wangjun on 16/11/11.
 */
@Controller
@RequestMapping("students")
public class StudentsController extends BaseController {
	
	@Autowired
	private IStudentService studentService;
	
	@Autowired
	private IMemberService memberService;
	
    // 学生注册
    @RequestMapping("register")
    public String studentsRegister(Model model) {
    	model.addAttribute("cardNo", memberService.getCardNo());
    	model.addAllAttributes(studentService.getCardDeposit(StrUtil.objToInt(IDBConstant.CARD_STUDENT)));
        return "Students/StudentsCreate";
    }
    
    @ResponseBody
    @RequestMapping("saveStudent")
    public ResponseBean saveStudent(UserStudent userStudent, String cardNo) {
    	try{
    		userStudent.setSalesId(getUserInfo().getId());
    		Integer studentId = studentService.saveStudent(userStudent, cardNo);
    		Map<String, Object> data = new HashMap<String, Object>();
    		data.put("studentId", studentId);
    		return new ResponseBean(data);
    	} catch (MessageException e) {
    		return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
    }

    // 学生查询
    @RequestMapping("list")
    public String studentsList(StudentInputView studentInputView, Model model) {
    	try{
    		model.addAllAttributes(JsonUtils.fromJsonDF(studentInputView));
    		PageBean pageBean = studentService.getStudents(studentInputView);
    		System.out.println(JsonUtils.toJsonDF(pageBean));
    		super.setPageInfo(model, pageBean);
    	}catch (Exception e) {
			e.printStackTrace();
		}
        return "Students/StudentsList";
    }

    // 学生详情
    @RequestMapping("view")
    public String studentsView(Integer studentId, Model model) {
    	try {
			model.addAttribute("student", studentService.studentsView(studentId));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "Students/StudentsView";
    }

    // 学生用场流水
    @RequestMapping("data")
    public String studentsVenueData() {return "Students/StudentsVenueData";}
    
    @ResponseBody
    @RequestMapping("lockStudent")
    public ResponseBean lockStudent(int studentId){
    	try{
    		studentService.updateLockStudent(studentId, getUserInfo().getId());
    		return new ResponseBean(true);
    	} catch (MessageException e) {
    		return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
    }
    
    
    //验证学生是否重复手机号true可用  false重复
    @ResponseBody
    @RequestMapping("availableMobile")
    public boolean availableMobile(String mobile){
    	try{
    		return studentService.availableMobile(mobile);
    	} catch (MessageException e) {
    		e.printStackTrace();
    		return false;
		} catch (Exception e) {
    		e.printStackTrace();
    		return false;
		}
    }
    
    @ResponseBody
    @RequestMapping("studentCardBuBan")
    public ResponseBean studentCardBuBan(MemberCardOpInputView memberCardOpInputView){
    	try {
            UserOperator userOperator = super.getUserInfo();
            memberCardOpInputView.setSalesId(userOperator.getId());
            memberCardOpInputView.setBalanceServiceType(IDBConstant.BALANCE_SERVICE_TYPE_CARD_BUBAN_STUDENT);
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
    
}
