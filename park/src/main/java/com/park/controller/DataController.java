package com.park.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.park.common.bean.DataInputView;
import com.park.common.util.JsonUtils;
import com.park.service.IDataService;

/**
 * Created by wangjun on 16/10/20.
 */
@Controller
@RequestMapping("data")
public class DataController extends BaseController {
	
	@Autowired
	private IDataService dataService;
	
	
    // 会员注册统计
    @RequestMapping("getMembersRegister")
    public String getMembersRegister(DataInputView dataInputView, Model model) {
    	try {
    		model.addAllAttributes(JsonUtils.fromJson(dataInputView));
			model.addAttribute("data", dataService.countMembersRegister(dataService.getMembersRegister(dataInputView)));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "Data/DataMembersRegister";
    }

    // 用户签到记录
    @RequestMapping("getMembersAttendance")
    public String getMembersAttendance() {
        return "Data/DataMembersAttendance";
    }

    // 营业收支
    @RequestMapping("getBusinessIncome")
    public String getBusinessIncome() {
        return "Data/DataBusinessIncome";
    }

    // 场地使用率
    @RequestMapping("getVenuePercentage")
    public String getVenuePercentage(DataInputView dataInputView, Model model) {
    	try {
			model.addAllAttributes(dataService.getSitePercentage(dataInputView));
			System.out.println(JsonUtils.toJson(dataService.getSitePercentage(dataInputView)));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "Data/DataVenuePercentage";
    }
}
