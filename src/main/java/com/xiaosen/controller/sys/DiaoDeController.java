package com.xiaosen.controller.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xiaosen.controller.BaseController;

/**
 * 
 * 类描述：    跳转屌的不行文件夹
 * 创建人：ssxu  
 * 创建时间：2017-5-5 上午11:22:19   
 * @version  1.0
 *
 */
@Controller
@RequestMapping("/diaodebuxing")
public class DiaoDeController extends BaseController {

	@RequestMapping("/imgDefault")
	public ModelAndView imgDefault(){
		 mav.setViewName("diaodebuxing/imgDefault");
		 return mav;
	}
	
	@RequestMapping("/jd")
	public ModelAndView jd(){
		 mav.setViewName("diaodebuxing/jd");
		 return mav;
	}
	
	@RequestMapping("/webSocket")
	public ModelAndView webSocket(){
		 mav.setViewName("diaodebuxing/webSocket");
		 return mav;
	}
	
	@RequestMapping("/tree")
	public ModelAndView tree(){
		 mav.setViewName("diaodebuxing/tree");
		 return mav;
	}
}
