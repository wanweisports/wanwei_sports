package com.park.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.park.common.constant.IPlatformConstant;
import com.wx.WeiXinConnector;
import com.wx.pojo.WeixinOauth2Token;



/**
 * @author ex_yangxiaoyi
 * 
 */
@RequestMapping("")
@Controller
public class WXOAuth2Controller extends BaseController {
	
	private static Logger logger = Logger.getLogger(WXOAuth2Controller.class);

	/**
	 * 微信授权登录
	 */
	@RequestMapping("oAuth2")
	public void oAuth2(HttpServletRequest request, HttpServletResponse response){
		
		// 用户同意授权后，能获取到code
		String code = request.getParameter("code");
		String returnUrl = request.getParameter("returnUrl");
		System.out.println(code);
		System.out.println(returnUrl);

		// 用户同意授权
		if (!"authdeny".equals(code)) {
			// 获取网页授权access_token,应用的appid和appsecret
			WeixinOauth2Token weixinOauth2Token = WeiXinConnector.getOauth2AccessToken(IPlatformConstant.APP_ID, IPlatformConstant.APP_SECRET, code);
			// 用户标识
			String openId = weixinOauth2Token.getOpenId();
			//根据openId判断用户是否授权登陆过，未授权过，则调用获取用户信息微信接口
			//OperatorInfo operatorInfo = operatorInfoService.getOperatorInfoByOpenId(openId);
			HttpSession session = request.getSession();
			session.setAttribute(IPlatformConstant.WX_OPEN_ID_KEY, openId);
			/*if(){ //不存在先保存
				
			}*/
		}
	}

}
