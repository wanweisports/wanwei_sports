package com.park.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.park.common.po.OtherResource;
import com.park.common.util.CustomizedPropertyConfigurer;
import com.park.dao.IBaseDao;
/**
文件上传
步骤:
(1) 
*/
@Component
public class ProcessUpload extends HttpServlet {
	
	@Autowired
	private IBaseDao baseDao;
	
	@Override   
    public void init(ServletConfig servletConfig) throws ServletException {   
        super.init(servletConfig);   
        WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(servletConfig.getServletContext());   
  
        baseDao=(IBaseDao) webApplicationContext.getBean("baseDao");   
    }  
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**/
		System.out.println("I am a serlvet to process upload!!!");
		
	
		request.setCharacterEncoding( "UTF-8" );	// 从request中取时, 以UTF-8编码解析
		
		String fileName = CustomizedPropertyConfigurer.getPhotoPath().toString();
		String path = new File("").getAbsolutePath();
		if(path.contains("bin")){
			path = path.replace("bin", "webapps") + fileName;
		}else{
			path = path + File.separator + "webapps" + File.separator + fileName;
		}

		// 工厂, 
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();

		// 获取上传文件存放的 目录 , 无则创建
//		String path = request.getRealPath( "/upload" );
		System.out.println("path : " + path);

		new java.io.File( path ).mkdir();
        /** 
         * 原理 它是先存到 暂时存储室，然后在真正写到 对应目录的硬盘上，  
         * 按理来说 当上传一个文件时，其实是上传了两份，第一个是以 .tem 格式的  
         * 然后再将其真正写到 对应目录的硬盘上 
         */  
		diskFileItemFactory.setRepository( new File( path ) );
        //设置 缓存的大小，当上传文件的容量超过该缓存时，直接放到 暂时存储室  
        diskFileItemFactory.setSizeThreshold( 1024*1024 );
		

        ServletFileUpload upload = new ServletFileUpload(diskFileItemFactory); 
        try
        {
        	String resourceIds = "";
            // 可上传多个文件
            List<FileItem> list = (List<FileItem>) upload.parseRequest( request );
            
            String resourceType = "";
            for (FileItem item : list )
            {
                // 字符串类 属性
                if ( item.isFormField() )
                {
                	 // 获取 提交表单的 属性名
                	if("resourceType".equals(item.getFieldName())){
                		resourceType = item.getString();
                	}
                } 
                // 二进制类
                else 
                {
                    // 获取上传文件的名字                   
                    String value = item.getName(); // 1,获取路径                    
                    int start = value.lastIndexOf( "\\" );// 2,索引到最后一个反斜杠
                    String filename = value.substring( start+1 );//3, 截取(+1是去掉反斜杠) 

                    System.out.println( resourceType + "<===>" + value );
                    // 生成文件名
                    start = filename.lastIndexOf( "." );    // 索引到最后一个点
                    filename = filename.substring( 0, start )    // 不含扩展名的文件
                                + UUID.randomUUID().toString()  // 随机数
                                + filename.substring( start );  // 扩展名
//                    filename =  UrlConvertor.returnOSSPath() + filename;

                    System.out.println( "filename=" + filename );
                    File file = new File(path, filename);
                    item.write(file);
                    /*int b = -1;
		    		byte[] by = new byte[8096];
		    		OutputStream out = new FileOutputStream(absolutePath + filename);
		    		InputStream inputStream = item.getInputStream();
		    		while ((b=inputStream.read(by)) >= 0) {
		    			out.write(by, 0, b); 
		    		}
		    		out.flush();
		    		out.close();*/
                    
                    OtherResource resourceInfo = new OtherResource();
                    /*resourceInfo.setFileSize(String.valueOf(item.getSize()));*/
                    resourceInfo.setResourceName(value.substring( 0, start ));
                    resourceInfo.setResourcePath(filename);
                    resourceInfo.setResourceServiceType(resourceType);
                    baseDao.save(resourceInfo, resourceInfo.getResourceId());
                    System.out.println(resourceInfo.getResourceId());
                    response.getWriter().print(resourceInfo.getResourceId());
                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

	}






// -------------------
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("doGet");
		this.doPost(request, response);
	}
	
	public static void main(String[] args) {
		System.out.println( "I am a serlvet to process upload!" );
	}
}