package com.xiaosen.controller.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
