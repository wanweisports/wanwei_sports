package com.park.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.park.common.po.OtherResource;

public class FileUtil {
	
	private static Logger logger = Logger.getLogger(FileUtil.class);
	
	public static OtherResource saveFile(MultipartHttpServletRequest multipartRequest, OtherResource resourceInfo) throws Exception {
		if(multipartRequest != null){
			String fileName = CustomizedPropertyConfigurer.getPhotoPath().toString();
			String absolutePath = new File("").getAbsolutePath();
			if(absolutePath.contains("bin")){
    			absolutePath = absolutePath.replace("bin", "webapps") + fileName;
    		}else{
    			absolutePath = absolutePath + File.separator + "webapps" + File.separator + fileName;
    		}
			logger.info("absolutePath===>" + absolutePath);
			int size = multipartRequest.getMultiFileMap().size();
			System.out.println("size===>" + size);
			for (Iterator<String> it = multipartRequest.getFileNames(); it.hasNext();) {
				String key = it.next();  
		        MultipartFile imgFile = multipartRequest.getFile(key);  
		        String originalFilename = imgFile.getOriginalFilename();
		        System.out.println("imgFile.getOriginalFilename()===>" + originalFilename);
		        if (originalFilename.length() > 0) {
		        	String imgName = System.currentTimeMillis()+originalFilename.substring(originalFilename.lastIndexOf("."));
		        	int b = -1;
		    		byte[] by = new byte[8096];
		    		OutputStream out = new FileOutputStream(absolutePath + imgName);
		    		InputStream inputStream = imgFile.getInputStream();
		    		while ((b=inputStream.read(by)) >= 0) {
		    			out.write(by, 0, b); 
		    		}
		    		out.flush();
		    		out.close();
		    		if(resourceInfo == null){
		    			resourceInfo = new OtherResource();
		    		}
                    /*resourceInfo.setFileSize(String.valueOf(imgFile.getSize()));
                    resourceInfo.setResourceName(originalFilename);
                    resourceInfo.setResourcePath(imgName);
                    resourceInfo.setIsFlag("1");
                    resourceInfo.setAdddate(DateUtil.dateToString(new Date(), DateUtil.YYYYMMDDHHMMSS));*/
                    return resourceInfo;
		        }
			}
		}
		return null;
	}

}
