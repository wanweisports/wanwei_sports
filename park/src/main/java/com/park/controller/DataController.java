package com.park.controller;

import com.park.common.bean.ResponseBean;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.park.common.bean.DataInputView;
import com.park.common.util.JsonUtils;
import com.park.service.IDataService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wangjun on 16/10/20.
 */
@Controller
@RequestMapping("data")
public class DataController extends BaseController {
	
	@Autowired
	private IDataService dataService;

    // 会员注册个数
    @ResponseBody
    @RequestMapping(value = "getMembersCountData", method = RequestMethod.POST)
    public ResponseBean getMembersCountData(DataInputView dataInputView) {
        try {
            Map<String, Object> data;
            //data = dataService.getCountMembersByWeek(dataInputView);
            data = dataService.getCountMembersByMonth(dataInputView);
            return new ResponseBean(data);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 会员注册储值统计
    @ResponseBody
    @RequestMapping(value = "getMembersStoredData", method = RequestMethod.POST)
    public ResponseBean getMembersStoredData(DataInputView dataInputView) {
        try {
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("memberStored", dataService.getMembersRegisterStored(dataInputView));
            return new ResponseBean(data);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }

    // 会员注册消费统计
    /*@ResponseBody
    @RequestMapping(value = "getMembersConsumeData", method = RequestMethod.POST)
    public ResponseBean getMembersConsumeData(DataInputView dataInputView) {
        try {
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("memberConsume", dataService.getMembersRegisterStored(dataInputView));
            return new ResponseBean(data);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }*/

    // 会员注册统计
    @ResponseBody
    @RequestMapping(value = "getMembersRegister", method = RequestMethod.POST)
    public ResponseBean getMembersRegisterP(DataInputView dataInputView) {
        try {
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("memberCount", dataService.getMembersRegister(dataInputView));
            data.put("memberStored", dataService.getMembersRegisterStored(dataInputView));
            data.put("memberCount1", dataService.getCountMembersByWeek(dataInputView));
            return new ResponseBean(data);
        } catch (MessageException e) {
            e.printStackTrace();
            return new ResponseBean(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseBean(false);
        }
    }
	
    // 会员注册统计
    @RequestMapping("getMembersRegister")
    public String getMembersRegister(DataInputView dataInputView, Model model) {
    	try {
    		model.addAllAttributes(JsonUtils.fromJson(dataInputView));
            model.addAttribute("memberCount", dataService.getMembersRegister(dataInputView));
            model.addAttribute("memberStored", dataService.getMembersRegisterStored(dataInputView));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "Data/DataMembersRegister";
    }

    // 会员注册统计按照注册日期
    @RequestMapping("getMembersRegisterGroupDate")
    public String getMembersRegisterGroupDate(DataInputView dataInputView, Model model) {
        try {
            model.addAllAttributes(JsonUtils.fromJson(dataInputView));
            model.addAttribute("data", dataService.getMembersRegisterGroupDate(dataInputView));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Data/DataMembersRegisterGroupDate";
    }

    // 用户签到记录
    @RequestMapping("getMembersAttendance")
    public String getMembersAttendance(DataInputView dataInputView, Model model) {
    	try {
    		model.addAllAttributes(JsonUtils.fromJson(dataInputView));
    		super.setPageInfo(model, dataService.getDataMembersAttendance(dataInputView));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "Data/DataMembersAttendance";
    }

    // 营业收支
    @RequestMapping("getBusinessIncome")
    public String getBusinessIncome(DataInputView dataInputView, Model model) {
    	try{
    		model.addAllAttributes(JsonUtils.fromJson(dataInputView));
    		model.addAllAttributes(dataService.getBusinessIncome(dataInputView));
    	}catch (Exception e) {
			e.printStackTrace();
		}
        return "Data/DataBusinessIncome";
    }

    // 营业收支按照注册日期
    @RequestMapping("getBusinessIncomeGroupDate")
    public String getBusinessIncomeGroupDate(DataInputView dataInputView, Model model) {
        try {
            model.addAllAttributes(JsonUtils.fromJson(dataInputView));
            model.addAttribute("data", dataService.getBusinessIncome(dataInputView));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Data/DataBusinessIncomeGroupDate";
    }

	// 营业收支日志
	@RequestMapping("getBusinessIncomeLog")
	public String getBusinessIncomeLog(DataInputView dataInputView, Model model) {
		return "Data/DataBusinessIncomeLog";
	}

    // 场地使用率
    @RequestMapping("getVenuePercentage")
    public String getVenuePercentage(DataInputView dataInputView, Model model) {
    	try {
            model.addAllAttributes(JsonUtils.fromJson(dataInputView));
			model.addAllAttributes(dataService.getSitePercentage(dataInputView));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "Data/DataVenuePercentage";
    }
}
