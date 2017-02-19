package com.park.interceptor;

import javax.servlet.http.HttpServletRequest;
import com.park.common.constant.IPlatformConstant;

public class InterceptorHelp {

	public final static String NOT_LOGIN = "-1";
    
	/*
	 * 是否是Ajax请求
	 */
	public static boolean isAjax(HttpServletRequest request){
    	String requestType = request.getHeader("X-Requested-With");
        if (requestType != null && requestType.equals("XMLHttpRequest")) {
            return true;
        } else {
            return false;
        }
    }
	
	/*
	 * 判断是C端，移动端或者PC端的登录
	 */
	public static String loginType(HttpServletRequest request){
		String requestURI = request.getRequestURI();
		if(requestURI.startsWith(IPlatformConstant.LOGIN_TYPE_MOBILE))return "";
		if(requestURI.startsWith(IPlatformConstant.LOGIN_TYPE_BUSINESS))return "/business/passport/login";
		else return "/passport/login";
	}
	
}
