package com.park.controller;

import com.park.common.annotation.NotProtected;
import com.park.common.bean.ResponseBean;
import com.park.common.constant.IDBConstant;
import com.park.common.constant.IPlatformConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.UserOperator;
import com.park.common.util.StrUtil;
import com.park.platform.service.IOperatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by wangjun on 16/11/11.
 */
@Controller
@RequestMapping("pp")
public class PassportController extends BaseController {

    @Autowired
    private IOperatorService operatorService;

    @NotProtected
    @RequestMapping("login")
    public String passportLogin() {
        return "Passport/PassportLogin2";
    }

    // 用户登录
    @NotProtected
    @ResponseBody
    @RequestMapping("userLogin")
    public ResponseBean userLogin(String name, String pwd) {
        try{
            if (StrUtil.isBlank(name)) {
                throw new MessageException("请输入用户名！");
            }
            if (StrUtil.isBlank(pwd)) {
                throw new MessageException("请输入密码！");
            }

            UserOperator operator = operatorService.innerLogin(name);

            if(operator == null) {
                throw new MessageException("不存在的用户名！");
            }
            if (!pwd.equals(operator.getOperatorPwd())) {
                throw new MessageException("密码错误！");
            }
            if(!IDBConstant.LOGIC_STATUS_YES.equals(operator.getStatus())) {
                throw new MessageException("您的帐号已被锁定，请联系管理员！");
            }

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

    // 用户退出
    @RequestMapping("logout")
    public String logout() {
        super.getRequest().getSession().invalidate();
        return redirect("/pp/login");
    }

}
