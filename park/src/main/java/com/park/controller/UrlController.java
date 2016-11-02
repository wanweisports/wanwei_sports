package com.park.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.common.annotation.NotProtected;
import com.park.common.bean.ResponseBean;
import com.park.common.constant.IDBConstant;
import com.park.common.constant.IPlatformConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.UserOperator;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.service.IOperatorService;

@Controller
public class UrlController extends BaseController {
	
	@Autowired
	private IOperatorService operatorService;
	
	@RequestMapping("request")
	public String toRequest() {
		return "Request";
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
	
	// 登录后主页
    @RequestMapping("loginWelCome")
    public String loginWelCome() {
        return "LoginWelCome";
    }
	
    // 登录
	@NotProtected
	@RequestMapping("/passport/login")
	public String passportLogin(String returnUrl, Model model) {
		model.addAttribute("returnUrl", StrUtil.isBlank(returnUrl) ? "/loginWelCome" : returnUrl);
		return "Passport/PassportLogin";
	}
	
	@NotProtected
	@ResponseBody
	@RequestMapping("/passport/submitUserLogin")
	public ResponseBean submitUserLogin(String name, String pwd) {
		try{
			if(StrUtil.isBlank(name)) throw new MessageException("请输入用户名！");
			if(StrUtil.isBlank(pwd)) throw new MessageException("请输入密码！");
			UserOperator operator = operatorService.innerLogin(name);
			if(operator == null) throw new MessageException("用户名错误！");
			if(!pwd.equals(operator.getOperatorPwd())) throw new MessageException("密码错误！");
			if(!IDBConstant.LOGIC_STATUS_YES.equals(operator.getStatus())) throw new MessageException("您的帐号已被锁定，请联系管理员！");
			operator.setOperatorPwd(null);
			operatorService.saveLastLoginTime(operator.getId());
			super.getRequest().getSession().setAttribute(IPlatformConstant.LOGIN_USER, operator);
			return new ResponseBean(true);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
		
	}
	
	//退出登录
	@RequestMapping("passport/logout")
	public String logout() {
		super.getRequest().getSession().invalidate();
		return redirect("/passport/login");
	}

    // 完善信息
    @RequestMapping("/passport/profile")
    public String passportProfile(Model model) {
    	UserOperator operator = operatorService.getOperator(super.getUserInfo().getOperatorId());
    	operator.setOperatorPwd(null);
    	model.addAllAttributes(JsonUtils.fromJsonDF(operator));
        return "Center/CenterProfileComplete";
    }
    
    @ResponseBody
    @RequestMapping("/passport/updateProfile")
    public ResponseBean updateProfile(UserOperator userOperator) {
    	try {
    		UserOperator userInfo = super.getUserInfo();
    		userOperator.setId(userInfo.getId());
    		userOperator.setOperatorId(userInfo.getOperatorId());
    		operatorService.updateProfile(userOperator);
    		return new ResponseBean(true);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
    }

    // 修改密码
    @RequestMapping("/passport/modifyPassword")
    public String modifyPassword() {
        return "Center/CenterPasswordModification";
    }
    
    @ResponseBody
    @RequestMapping("/passport/updatePwd")
    public ResponseBean updatePwd(String oldPwd, String newPwd, String confirmPwd){
    	try {
    		if(StrUtil.isBlank(oldPwd)) throw new MessageException("请输入原密码");
    		if(StrUtil.isBlank(newPwd)) throw new MessageException("请输入新密码");
    		if(StrUtil.isBlank(confirmPwd)) throw new MessageException("请输入确认密码");
    		if(!newPwd.equals(confirmPwd)) throw new MessageException("两次密码不一致");
    		operatorService.updatePassword(oldPwd, newPwd, super.getUserInfo().getOperatorId());
    		return new ResponseBean(true);
		} catch (MessageException e) {
			e.printStackTrace();
			return new ResponseBean(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseBean(false);
		}
    }

    // 帮助文档
    @RequestMapping("/error/questions")
    public String errorQuestions() {
        return "Error/Questions";
    }

}












