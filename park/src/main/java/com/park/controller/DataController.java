package com.park.controller;


import com.park.common.bean.ResponseBean;
import com.park.common.constant.IDBConstant;
import com.park.common.exception.MessageException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.common.bean.DataInputView;
import com.park.common.bean.ResponseBean;
import com.park.common.exception.MessageException;
import com.park.common.util.JsonUtils;
import com.park.service.IDataService;
import com.park.service.IXlsExportImportService;

/**
 * Created by wangjun on 16/10/20.
 */
@Controller
@RequestMapping("data")
public class DataController extends BaseController {
	
	@Autowired
	private IDataService dataService;
	
	@Autowired
	private IXlsExportImportService xlsExportImportService;

    // 会员注册个数
    @ResponseBody
    @RequestMapping(value = "getMembersCountData", method = RequestMethod.POST)
    public ResponseBean getMembersCountData(DataInputView dataInputView) {
        try {
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("current", dataService.getMembersRegisterNew(dataInputView));

            if (dataInputView.getCountNum() == IDBConstant.DATA_DATE_WEEK) {
                dataInputView.setCountNum(IDBConstant.DATA_DATE_PRE_WEEK);
                data.put("previous", dataService.getMembersRegisterNew(dataInputView));
            }
            else if (dataInputView.getCountNum() == IDBConstant.DATA_DATE_MONTH) {
                dataInputView.setCountNum(IDBConstant.DATA_DATE_PRE_MONTH);
                data.put("previous", dataService.getMembersRegisterNew(dataInputView));
            }
            else if (dataInputView.getCountNum() == IDBConstant.DATA_DATE_YEAR) {
                dataInputView.setCountNum(IDBConstant.DATA_DATE_PRE_YEAR);
                data.put("previous", dataService.getMembersRegisterNew(dataInputView));
            }
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
            data.put("current", dataService.getMembersCZNew(dataInputView));

            if (dataInputView.getCountNum() == IDBConstant.DATA_DATE_WEEK) {
                dataInputView.setCountNum(IDBConstant.DATA_DATE_PRE_WEEK);
                data.put("previous", dataService.getMembersCZNew(dataInputView));
            }
            else if (dataInputView.getCountNum() == IDBConstant.DATA_DATE_MONTH) {
                dataInputView.setCountNum(IDBConstant.DATA_DATE_PRE_MONTH);
                data.put("previous", dataService.getMembersCZNew(dataInputView));
            }
            else if (dataInputView.getCountNum() == IDBConstant.DATA_DATE_YEAR) {
                dataInputView.setCountNum(IDBConstant.DATA_DATE_PRE_YEAR);
                data.put("previous", dataService.getMembersCZNew(dataInputView));
            }
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
    @ResponseBody
    @RequestMapping(value = "getMembersConsumedData", method = RequestMethod.POST)
    public ResponseBean getMembersConsumedData(DataInputView dataInputView) {
        try {
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("current", dataService.getMembersXFNew(dataInputView));

            if (dataInputView.getCountNum() == IDBConstant.DATA_DATE_WEEK) {
                dataInputView.setCountNum(IDBConstant.DATA_DATE_PRE_WEEK);
                data.put("previous", dataService.getMembersXFNew(dataInputView));
            }
            else if (dataInputView.getCountNum() == IDBConstant.DATA_DATE_MONTH) {
                dataInputView.setCountNum(IDBConstant.DATA_DATE_PRE_MONTH);
                data.put("previous", dataService.getMembersXFNew(dataInputView));
            }
            else if (dataInputView.getCountNum() == IDBConstant.DATA_DATE_YEAR) {
                dataInputView.setCountNum(IDBConstant.DATA_DATE_PRE_YEAR);
                data.put("previous", dataService.getMembersXFNew(dataInputView));
            }
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
            /*model.addAttribute("memberCount", dataService.getMembersRegister(dataInputView));
            model.addAttribute("memberStored", dataService.getMembersRegisterStored(dataInputView));*/
    		model.addAttribute("register", dataService.getMembersRegisterNew(dataInputView));
    		model.addAttribute("cz", dataService.getMembersCZNew(dataInputView));
    		model.addAttribute("xf", dataService.getMembersXFNew(dataInputView));
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
    
    //营业收支统计导出excel
    @RequestMapping("exportBusinessIncome")
    public void exportBusinessIncome(DataInputView dataInputView, HttpServletResponse response){
    	try {
            Workbook workbook = dataService.exportBusinessIncome(dataInputView);
            outExcel(response, workbook, "营业收支统计");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
 	//用户签到记录导出excel
    @RequestMapping("exportMembersAttendance")
    public void exportMembersAttendance(DataInputView dataInputView, HttpServletResponse response) {
    	try {
    		dataInputView.setPageSize(null);
    		List list = dataService.getDataMembersAttendance(dataInputView).getList();
    		Workbook workbook = xlsExportImportService.xlsExport("template_members_attendance.xlsx", list);
    		outExcel(response, workbook, "签到记录统计");
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    //场地使用率导出excel
    @RequestMapping("exportVenuePercentage")
    public void exportVenuePercentage(DataInputView dataInputView, HttpServletResponse response) {
    	try {
    		dataInputView.setPageSize(null);
    		List list = (List) dataService.getSitePercentage(dataInputView).get("list");
    		Workbook workbook = xlsExportImportService.xlsExport("template_venue_percentage.xlsx", list);
    		outExcel(response, workbook, "场地使用率统计");
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
}



