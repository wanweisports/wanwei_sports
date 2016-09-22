package com.park.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.park.common.util.JsonUtils;

public class BaseController {
	public static final String REQUEST_HEAD = "text/html; charset=UTF-8";
	
	public static final String APPLICATION_JSON = "application/json";
    
	public static final String CONTENT_TYPE_TEXT_JSON = "text/json";

	/** 
	 * 为AJAX往前端输出的方法
	 * 
	 * @param o
	 *            想要输出的对象
	 * @return 是否成功
	 */
	protected boolean AjaxJsonWrite(Object o, HttpServletResponse response) {
		return AjaxJsonWrite(o, false, response);
	}

	protected boolean AjaxJsonWrite(Object o, boolean println, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			response.setContentType(REQUEST_HEAD);
			out = response.getWriter();
			String jsonStr = String.valueOf(o instanceof String || o instanceof Number || o instanceof Boolean ? o
					: o instanceof List<?> || o instanceof Set<?> || o instanceof Object[] ? JSONArray.fromObject(o)
							: JSONObject.fromObject(o));
			if (println)
				System.out.println("zhe json string is " + jsonStr);
			out.write(jsonStr);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("JSON\u683c\u5f0f\u5316\u5bf9\u8c61\u65f6\u9519\u8bef" + o.getClass().getName());
			return false;
		} finally {
			out.flush();
			out.close();
		}
	}
	
	protected boolean AjaxJsonWriteGson(Object o, boolean println, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			response.setContentType(REQUEST_HEAD);
			out = response.getWriter();
			String jsonStr = JsonUtils.toJsonDF(o);
			if (println)
				System.out.println("zhe json string is " + jsonStr);
			out.write(jsonStr);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("JSON\u683c\u5f0f\u5316\u5bf9\u8c61\u65f6\u9519\u8bef" + o.getClass().getName());
			return false;
		} finally {
			out.flush();
			out.close();
		}
	}
	
	protected <T> T getData(String json, Class<T> clazz) {
		return JsonUtils.fromJson(json, clazz);
	}
	
}