package com.park.common.bean;

import java.util.HashMap;
import java.util.Map;

import com.park.common.constant.IPlatformConstant;

public class ResponseBean {
	
	private String code;
	private String message;
	private Map<String, Object> data = new HashMap<String, Object>();
	
	public ResponseBean() {
		
	}
	
	public ResponseBean(Map<String, Object> data) {
		this.code = IPlatformConstant.SUCCESS_CODE;
		this.message = IPlatformConstant.SUCCESS_MESSAGE;
		this.data.putAll(data);
	}
	
	public ResponseBean(boolean isSuccess) {
		this.code = isSuccess ? IPlatformConstant.SUCCESS_CODE : IPlatformConstant.FAIL_CODE;
		this.message = isSuccess ? IPlatformConstant.SUCCESS_MESSAGE : IPlatformConstant.FAIL_MESSAGE;
	}
	
	public ResponseBean(String message) {
		this.code = IPlatformConstant.FAIL_CODE;
		this.message = message;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	
}
