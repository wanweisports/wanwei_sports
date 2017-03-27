package com.park.controller;

import com.park.common.annotation.NotProtected;
import com.park.common.bean.ResponseBean;
import com.park.common.exception.MessageException;
import com.park.common.po.EnterpriseOpinion;
import com.park.service.IEnterpriseOpinionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("enterprise")
public class EnterpriseController extends BaseController {

    @Autowired
    private IEnterpriseOpinionService enterpriseOpinionService;

    // 首页
    @NotProtected
    @RequestMapping("index")
    public String renderEnterpriseIndex(){
        return "Enterprise/Home/HomeIndex";
    }

    // 建议1
    @NotProtected
    @ResponseBody
    @RequestMapping(value = "saveOpinion", method = RequestMethod.POST)
    public ResponseBean saveOpinion(EnterpriseOpinion enterpriseOpinion) {
        try {
            Integer opinionId = enterpriseOpinionService.saveOpinion(enterpriseOpinion);
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("opinionId", opinionId);
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
