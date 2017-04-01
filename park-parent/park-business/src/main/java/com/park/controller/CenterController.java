package com.park.controller;

import com.park.common.bean.ResponseBean;
import com.park.common.exception.MessageException;
import com.park.common.po.UserOperator;
import com.park.common.util.JsonUtils;
import com.park.platform.service.IOperatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by wangjun on 16/11/11.
 */
@Controller
@RequestMapping("center")
public class CenterController extends BaseController {

    @Autowired
    private IOperatorService operatorService;

    @RequestMapping("index")
    public String centerIndex() {
        return "Center/CenterIndex";
    }

    @RequestMapping("profile")
    public String centerProfile(Model model) {
        UserOperator operator = operatorService.getOperator(super.getUserInfo().getOperatorId());
        operator.setOperatorPwd(null);
        model.addAllAttributes(JsonUtils.fromJsonDF(operator));

        return "Center/CenterProfile";
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

    // 修改密码
    @RequestMapping("password")
    public String centerPassword() {
        return "Center/CenterPassword";
    }

}
