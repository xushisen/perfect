package com.xiaosen.controller.sys;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xiaosen.controller.BaseController;
import com.xiaosen.entity.User;
import com.xiaosen.service.UserService;
import com.xiaosen.util.string.StringUtils;

/**
 * 
 * 类描述：   登录验证
 * 创建人：ssxu  
 * 创建时间：2017-4-29 下午8:51:46   
 * @version  1.0
 *
 */
@Controller
@RequestMapping("/")
public class UserController extends BaseController{
	protected Logger logger = LoggerFactory.getLogger(getClass());
	@Resource  
    private UserService userService;   //userService
	
	@Value("#{configProperties['jdbc_username']}")
	private String propertiesPwd;
	
	/**
	 * 直接输入地址跳转的后台
	 * @param session
	 * @return
	 */
	@RequestMapping("/")
    public String getIndex(HttpSession session){      
		System.out.println(propertiesPwd);
        ModelAndView mav = new ModelAndView("");
        String username = (String) session.getAttribute("userName");
        if (StringUtils.isNotEmpty(username)){
        	mav.setViewName("index");
        	return "index";
        } else {
        	mav.setViewName("login");
        	return "login";
        }
       // return mav;
    }   
	
	/**
	 * 登录校验
	 * @param session
	 * @param userName 页面用户名
	 * @param passWord 页面密码
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
    public String getIndexs(HttpSession session, String userName, String passWord){      
        User user = userService.selectUserByPwd(userName, passWord);
        if (null != user){
    		session.setAttribute("userName", user.getUserName());
    		return "success";
        } else {
        	return "error";
        }
    }
	
	/**
	 * 退出
	 * @param session
	 * @param userName
	 * @param passWord
	 * @return
	 */
	@RequestMapping("/exit")
	@ResponseBody
    public String exit(HttpSession session, String userName, String passWord){      
		session.removeAttribute("userName");
		return "success";
    }
	
	/**
	 * list查询
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView list(HttpServletRequest req){
		try {
			Map<String,Object> list = userService.getList(getRequestParams(req));
			mav.addObject("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("xiaoguo/biaoge");
		return mav;
	}
	
	@RequestMapping("/deleteByIds")
	@ResponseBody
	public String deleteByIds(String ids){
		try {
			userService.deleteByIds(ids);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping("/readme")
	public ModelAndView ds (){
		 ModelAndView mav = new ModelAndView("readme");
		 return mav;
	}
	
	public static void main(String[] args) {
		Map<String,Object> map1 = new HashMap<String, Object>();
		Map<String,Object> map2 = new HashMap<String, Object>();
		map1.put("1", "1");
		map1.put("2", "2");
		map2.put("1", "3");
		map2.put("4", "4");
		map1.putAll(map2);
		System.out.println(map1);
	}
}
