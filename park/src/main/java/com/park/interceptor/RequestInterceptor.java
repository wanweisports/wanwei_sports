package com.park.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class RequestInterceptor implements HandlerInterceptor{

	private Logger log = Logger.getLogger(RequestInterceptor.class); 
    
    public RequestInterceptor() {  
        
    }  
  
    private String mappingURL; //利用正则映射到需要拦截的路径 
    

    /** 
     * 在业务处理器处理请求之前被调用 
     */  
	@SuppressWarnings("rawtypes")
	@Override  
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {  
        log.info("==============执行顺序: 1、preHandle================");
        
       /* //解析request的JSON
        String receivePostJson = RequestUtil.receivePostJson(request);
        
        //将JSON转换为bean对象
        RequestBean requsetInfo = GsonUtil.getGson().fromJson(receivePostJson, RequestBean.class);
        
        //将bean对象保存到request域
        request.setAttribute(IPlatformConstant.REQUEST_JSON, requsetInfo);
        
        //转发到对应的action方法
        //request.getRequestDispatcher("/"+ requsetInfo.getMethod() +".do").forward(request, response);
*/        
        return false;
    }

  
    //在业务处理器处理请求执行完成后,生成视图之前执行的动作
    @Override  
    public void postHandle(HttpServletRequest request,  
            HttpServletResponse response, Object handler,  
            ModelAndView modelAndView) throws Exception {  
        log.info("==============执行顺序: 2、postHandle================");  
    }  
  
    /** 
     * 在DispatcherServlet完全处理完请求后被调用  
     *  
     *   当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion() 
     */  
    @Override  
    public void afterCompletion(HttpServletRequest request,  
            HttpServletResponse response, Object handler, Exception ex)  
            throws Exception {  
        log.info("==============执行顺序: 3、afterCompletion================");  
    }

    
	public String getMappingURL() {
		return mappingURL;
	}
	
	 public void setMappingURL(String mappingURL) {    
         this.mappingURL = mappingURL;    
  } 
    
}
