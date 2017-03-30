package com.park.controller;

import com.park.common.annotation.NotProtected;
import com.park.common.bean.MenuInputView;
import com.park.common.bean.ResponseBean;
import com.park.common.constant.IDBConstant;
import com.park.common.constant.IPlatformConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.UserOperator;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.platform.service.IMenuService;
import com.park.platform.service.IOperatorService;
import com.park.platform.service.IParkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by wangjun on 17/1/10.
 */
@Controller
@RequestMapping("passport")
public class PassportController extends BaseController {

    @Autowired
    private IParkService parkService;

    @Autowired
    private IOperatorService operatorService;
    
    @Autowired
    private IMenuService menuService;

    // 登录
    @NotProtected
    @RequestMapping("login")
    public String passportLogin(String returnUrl, Model model) {
        model.addAttribute("business", parkService.getParkBusiness());
        return "Passport/PassportLogin";
    }

    @NotProtected
    @ResponseBody
    @RequestMapping("submitUserLogin")
    public ResponseBean submitUserLogin(String name, String pwd, String loginType, HttpSession session) {
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
            //获取菜单
            MenuInputView menuInputView = new MenuInputView();
			menuInputView.setOperatorId(super.getUserInfo().getOperatorId());
			session.setAttribute("menus", menuService.getMenus(menuInputView));
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
    @RequestMapping("logout")
    public String logout() {
        super.getRequest().getSession().invalidate();
        return redirect("/passport/login");
    }

    // 完善信息
    @RequestMapping("profile")
    public String passportProfile(Model model) {
        UserOperator operator = operatorService.getOperator(super.getUserInfo().getOperatorId());
        operator.setOperatorPwd(null);
        model.addAllAttributes(JsonUtils.fromJsonDF(operator));
        return "Center/CenterProfileComplete";
    }

    @ResponseBody
    @RequestMapping("updateProfile")
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

    @ResponseBody
    @RequestMapping("getUserProfile")
    public ResponseBean getUserProfile() {
        try {
            UserOperator operator = operatorService.getOperator(super.getUserInfo().getOperatorId());
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("user", operator);
            return new ResponseBean(data);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 修改密码
    @RequestMapping("modifyPassword")
    public String modifyPassword() {
        return "Center/CenterPasswordModification";
    }

    @ResponseBody
    @RequestMapping("updatePwd")
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
}
