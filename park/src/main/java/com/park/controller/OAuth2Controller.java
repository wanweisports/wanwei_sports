package com.park.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.park.common.constant.IPlatformConstant;
import com.park.common.util.AdvancedUtil;
import com.park.pojo.SNSUserInfo;
import com.park.pojo.WeixinOauth2Token;

/**授权后的回调请求处理
 * 
 * @author Administrator
 *
 */
@Controller
public class OAuth2Controller extends HttpServlet {
	private static final long serialVersionUID = -1847238807216447030L;

	@RequestMapping(value = "oAuth2", method = RequestMethod.GET)
	public void oAuth2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 用户同意授权后，能获取到code
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		System.out.println("code:" + code + ", state:" + state);

		// 用户同意授权
		if (!"authdeny".equals(code)) {
			// 获取网页授权access_token,应用的appid和appsecret
			WeixinOauth2Token weixinOauth2Token = AdvancedUtil
					.getOauth2AccessToken(IPlatformConstant.APP_ID, IPlatformConstant.APP_SECRET, code);
			// 网页授权接口访问凭证
			String accessToken = weixinOauth2Token.getAccessToken();
			// 用户标识
			String openId = weixinOauth2Token.getOpenId();
			// 获取用户信息
			SNSUserInfo snsUserInfo = AdvancedUtil.getSNSUserInfo(accessToken, openId);

			// 设置要传递的参数
			request.setAttribute("snsUserInfo", snsUserInfo);
		}
		// 跳转到index.jsp
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
