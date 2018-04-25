package com.xiaosen.controller.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;


/**
 *
 * 类描述：图片上传公共类   
 * 创建人：ssxu  
 * 创建时间：2018-3-3 上午10:30:55   
 * @version  1.0
 *
 */
@Controller
public class FUpload {

	@Value("#{configProperties['fpath']}")
	private String fpath;
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	//最大文件大小
	long maxSize = 1000000;

	@RequestMapping("/demo")
	public String list(){
		logger.info("进入的demo");
		return "kindeditor/demo";
	}
	
	 /**
	 * @return  
     * @Description 文件上传 
     * @param  参数 
     * @return void 返回类型  
     * @throws 
     */
    @RequestMapping(value = "/fuploadFile", method = RequestMethod.POST)
    @ResponseBody
    public String uploadFile(HttpServletRequest req,
            MultipartHttpServletRequest multiReq) {
    	
    	//定义允许上传的文件扩展名
    	HashMap<String, String> extMap = new HashMap<String, String>();
    	extMap.put("image", "gif,jpg,jpeg,png,bmp");
    	
        // 获取上传文件的路径
        String uploadFilePath = multiReq.getFile("imgFile").getOriginalFilename();
        logger.info("uploadFlePath:" + uploadFilePath);
        // 截取上传文件的文件名
        /**String uploadFileName = uploadFilePath.substring(uploadFilePath.lastIndexOf('\\') + 1,
                uploadFilePath.indexOf('.'));*/
        String uploadFileName = UUID.randomUUID().toString();
        logger.info("multiReq.getFile()" + uploadFileName);
        // 截取上传文件的后缀
        String uploadFileSuffix = uploadFilePath.substring(uploadFilePath.lastIndexOf('.') + 1,
                uploadFilePath.length());
        logger.info("uploadFileSuffix:" + uploadFileSuffix);

        if(!Arrays.<String>asList(extMap.get("image").split(",")).contains(uploadFileSuffix)){
			return getError("上传文件扩展名是不允许的扩展名。只允许" + extMap.get("image") + "格式。");
		}
        FileOutputStream fos = null;
        FileInputStream fis = null;
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
        String mulu = fpath + File.separator + df.format(new Date()) + File.separator;
        String newFileName = mulu + uploadFileName + "." + uploadFileSuffix;
        File saveDirFile = new File(mulu);
        if (!saveDirFile.exists()) {
        	saveDirFile.mkdirs();
        }
        try {
            fis = (FileInputStream)multiReq.getFile("imgFile").getInputStream();
            fos = new FileOutputStream(newFileName);
            byte[] temp = new byte[1024];
            int i = fis.read(temp);
            while (i != -1) {
                fos.write(temp, 0, temp.length);
                fos.flush();
                i = fis.read(temp);
            }
           //压缩图片
           //Thumbnails.of(newFileName).scale(0.85f).toFile(newFileName);
        }
        catch (IOException e) {
            e.printStackTrace();
            return getError("上传文件失败。");
        }
        finally {
            if (fis != null) {
                try {
                    fis.close();
                }
                catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fos != null) {
                try {
                    fos.close();
                }
                catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        /**if(RegUtil.isEnglish(newFileName.substring(0,1))){
        	// window
        	return getSeccess(newFileName.substring(2).replaceAll("\\\\", "/"));
        } else {
        	// linux
        	return getSeccess("../"+newFileName.substring(1));
        }*/
        return getSeccess(req.getScheme()+"://"+ req.getServerName()+":"+req.getServerPort()+"/fupload/"+df.format(new Date())+"/"+uploadFileName + "." + uploadFileSuffix);
    }
    
    private static String getError(String message) {
    	StringBuilder err = new StringBuilder("{");
    	err.append("\"error\":1,");
    	err.append("\"message\":\""+message+"\"}");
    	return err.toString();
    }
    
    private static String getSeccess(String url) {
    	StringBuilder success = new StringBuilder("{");
    	success.append("\"error\":0,");
    	success.append("\"url\":\""+url+"\"}");
    	return success.toString();
    }
}
