package com.xiaosen.controller.sys;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.xiaosen.controller.BaseController;

/**
 * 
 * 类描述：跳转效果文件夹
 * 创建人：ssxu  
 * 创建时间：2017-5-5 上午11:06:36   
 * @version  1.0
 *
 */
@Controller
@RequestMapping("/xiaoguo")
public class XiaoGuoController extends BaseController {

	@RequestMapping("/xilakuang")
	public ModelAndView xilakuang(){
		 mav.setViewName("xiaoguo/xilakuang");
		 return mav;
	}
	
	@RequestMapping("/tanchukuang")
	public ModelAndView tanchukuang(){
		 mav.setViewName("xiaoguo/tanchukuang");
		 return mav;
	}
	
	@RequestMapping("/qunajianpan")
	public ModelAndView qunajianpan(){
		 mav.setViewName("xiaoguo/qunajianpan");
		 return mav;
	}
	
	@RequestMapping("/css3texiao")
	public ModelAndView css3texiao(){
		 mav.setViewName("xiaoguo/css3texiao");
		 return mav;
	}
	
	@RequestMapping("/tuozhuaishangchuan")
	public ModelAndView tuozhuaishangchuan(){
		 mav.setViewName("xiaoguo/tuozhuaishangchuan");
		 return mav;
	}

	@RequestMapping("/biaobai")
	public ModelAndView biaobai(){
		 mav.setViewName("xiaoguo/biaobai");
		 return mav;
	}	
	
	@RequestMapping("/bofangqi")
	public ModelAndView bofangqi(){
		 mav.setViewName("xiaoguo/bofangqi");
		 return mav;
	}
	
	@RequestMapping("/xue")
	public ModelAndView xue(){
		 mav.setViewName("xiaoguo/xue");
		 return mav;
	}
	
	@RequestMapping("/zjUpload")
	public ModelAndView zjUpload(){
		 mav.setViewName("xiaoguo/zjUpload");
		 return mav;
	}
	
	/**
	 * 采用spring提供的上传文件的方法
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("springUpload")
	public @ResponseBody String springUpload(HttpServletRequest request){
		long startTime=System.currentTimeMillis();
		//将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
				request.getSession().getServletContext());
		StringBuilder pathList = new StringBuilder();
		//检查form中是否有enctype="multipart/form-data"
		if(multipartResolver.isMultipart(request)){
			//将request变成多部分request
			MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
			//获取multiRequest 中所有的文件名
			Iterator iter=multiRequest.getFileNames();
			pathList.append("[");
			while(iter.hasNext()){
				//一次遍历所有文件 
				//MultipartFile file=multiRequest.getFile(iter.next().toString());
				/**if(file!=null){
					String oldFilename = file.getOriginalFilename();
					long fileSize = file.getSize();
					String newFilenName = UUID.randomUUID().toString().replace("-", ""); //新的文件名
					int index = oldFilename.lastIndexOf(".");
					String hz = oldFilename.substring(index, oldFilename.length());  //后拽
					String path="d:/upload/filePath/"+newFilenName+hz;
					pathList.append("\"name\":"+"\""+oldFilename+"\",\"size\":"+"\""+fileSize+"\",\"newFilenName\":"+"\""+newFilenName+hz+"\"");
					//上传
					try {
						file.transferTo(new File(path));
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}*/
				List<MultipartFile> fileRows = multiRequest  
                         .getFiles(iter.next().toString());  
				if (fileRows != null && fileRows.size() != 0) {
					for (MultipartFile file : fileRows) {
						pathList.append("{");
						String oldFilename = file.getOriginalFilename();
						long fileSize = file.getSize();
						String newFilenName = UUID.randomUUID().toString().replace("-", ""); //新的文件名
						int index = oldFilename.lastIndexOf(".");
						String hz = oldFilename.substring(index, oldFilename.length());  //后拽
						String path="d:/upload/filePath/"+newFilenName+hz;
						pathList.append("\"name\":"+"\""+oldFilename+"\",\"size\":"+"\""+fileSize+"\",\"newFilenName\":"+"\""+newFilenName+hz+"\"");
						try {
							file.transferTo(new File(path));
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
						pathList.append("},");
					}
				}
			}
			pathList.append("]");
		}
		System.out.println(pathList.toString());
		long endTime=System.currentTimeMillis();
		System.out.println("所用时间====="+String.valueOf(endTime-startTime)+"ms");
		return pathList.toString();
	}
	
	@RequestMapping("/biaoge")
	public ModelAndView biaoge(){
		 mav.setViewName("xiaoguo/biaoge");
		 return mav;
	}
	
	@RequestMapping("/zidingyi")
	public ModelAndView zidingyi(){
		 mav.setViewName("xiaoguo/zidingyi");
		 return mav;
	}

}
