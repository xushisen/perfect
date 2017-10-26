package com.xiaosen.controller.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xiaosen.controller.BaseController;

/**
 * 
 * 类描述：   跳转实践文件夹
 * 创建人：ssxu  
 * 创建时间：2017-5-5 上午11:18:24   
 * @version  1.0
 *
 */
@Controller
@RequestMapping("/shijian")
public class ShiJianController extends BaseController{

	@RequestMapping("/yzm")
	public ModelAndView yzm(){
		 mav.setViewName("shijian/yzm");
		 return mav;
	}
	
	@RequestMapping("/tpyl")
	public ModelAndView tpyl(){
		 mav.setViewName("shijian/tpyl");
		 return mav;
	}
	
	@RequestMapping("/xlkjs")
	public ModelAndView xlkjs(){
		 mav.setViewName("shijian/xlkjs");
		 return mav;
	}
	
	@RequestMapping("/hqJspYm")
	public ModelAndView hqJspYm(){
		 mav.setViewName("shijian/hqJspYm");
		 return mav;
	}
	
	@RequestMapping("/pubuliu")
	public ModelAndView pubuliu(){
		 mav.setViewName("shijian/pubuliu");
		 return mav;
	}
	
	@RequestMapping("/nonegdtqh")
	public ModelAndView nonegdtqh(){
		 mav.setViewName("shijian/nonegdtqh");
		 return mav;
	}
	
	@RequestMapping("/youjian")
	public ModelAndView youjian(){
		 mav.setViewName("shijian/youjian");
		 return mav;
	}
	
	@RequestMapping("/load")
	public ModelAndView load(){
		 mav.setViewName("shijian/load");
		 return mav;
	}
	
	@RequestMapping("/erweima")
	public ModelAndView erweima(){
		 mav.setViewName("shijian/erweima");
		 return mav;
	}
	
	@RequestMapping("/jsDate")
	public ModelAndView jsDate(){
		 mav.setViewName("shijian/jsDate");
		 return mav;
	}
	
	@RequestMapping("/tzxz")
	public ModelAndView tzxz(){
		 mav.setViewName("shijian/tzxz");
		 return mav;
	}
	
	@RequestMapping("/liuyanban")
	public String liuyanban(){
		 return "shijian/liuyanban";
	}
}
