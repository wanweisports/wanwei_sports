package com.park.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.park.common.bean.*;
import com.park.service.ISiteService;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.MemberSiteStudentSign;
import com.park.common.po.UserOperator;
import com.park.common.po.UserStudent;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.service.IMemberService;
import com.park.service.IStudentService;
import com.park.service.IXlsExportImportService;

/**
 * Created by wangjun on 16/11/11.
 */
@Controller
@RequestMapping("students")
public class StudentsController extends BaseController {
	
	@Autowired
	private IStudentService studentService;

    @Autowired
    private ISiteService siteService;

	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IXlsExportImportService xlsExportImportService;
	
    // 学生注册
    @RequestMapping("register")
    public String studentsRegister(Model model) {
    	model.addAttribute("cardNo", memberService.getCardNo(3));
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
    		super.setPageInfo(model, pageBean);

            SiteInputView siteInputView = new SiteInputView();
            model.addAttribute("siteSportNames", siteService.getSiteSportNames(siteInputView));
    	}catch (Exception e) {
			e.printStackTrace();
		}
        return "Students/StudentsList";
    }

    // 学生详情
    @RequestMapping("view")
    public String studentsView(Integer studentId, Model model) {
    	try {
			model.addAllAttributes(studentService.studentsView(studentId));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "Students/StudentsView";
    }

    // 学生用场流水
    @RequestMapping("data")
    public String studentsVenueData(StudentInputView studentInputView, Model model) {
    	try{
    		model.addAllAttributes(JsonUtils.fromJsonDF(studentInputView));
    		PageBean pageBean = studentService.getStudentSites(studentInputView);
    		super.setPageInfo(model, pageBean);
    		
    		model.addAllAttributes(studentService.getSudentVenueCount());
    	}catch (Exception e) {
			e.printStackTrace();
		}
    	return "Students/StudentsVenueData";
    }
    
    //学生用场流水导出excel
    @RequestMapping("exportStudentsVenueData")
    public void exportStudentsVenueData(StudentInputView studentInputView, HttpServletResponse response) {
    	try {
    		studentInputView.setPageSize(null);
    		PageBean pageBean = studentService.getStudentSites(studentInputView);
    		Workbook workbook = xlsExportImportService.xlsExport("template_students_venue_data.xlsx", pageBean.getList());
    		outExcel(response, workbook, "学生用场流水");
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
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
    @RequestMapping(value = "getNewCardNo", method = RequestMethod.POST)
    public ResponseBean getNewCardNo(Model model) {
        try {
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("newCardNo", memberService.getCardNo(3));
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
    
    @ResponseBody
	@RequestMapping("studentSign")
	public ResponseBean studentSign(MemberSiteStudentSign memberSiteStudentSign){
		try {
			memberSiteStudentSign.setSalesId(super.getUserInfo().getId());
			studentService.saveStudentGign(memberSiteStudentSign);
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
