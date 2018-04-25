package com.xiaosen.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaosen.entity.Ajax;
import com.xiaosen.util.statics.StaticVariable;

/**
 * 
 * 类描述:全局异常处理
 * 创建人:ssxu
 * 创建时间:2018-4-25 下午2:22:38
 * @version  1.0
 */
@ControllerAdvice
public class ExceptionHandle {
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	/** 使用方法springboot下的使用方法    controller异常抛出   然后返回自定义异常    自定义异常会自动返回
	@RequestMapping("/login")
	public void loginUser(String userName, String userPwd,
			HttpSession session) throws Exception {
		if (StringUtils.isEmpty(session.getAttribute("username"))){  //session为空
			if (! StringUtils.isEmpty(userName) || ! StringUtils.isEmpty(userPwd)){
				Map<String,String> map = new HashMap<String, String>();
				map.put("userLogin", userName);
				map.put("userPwd", userPwd);
				User user = userService.isExitByUserLoginPwd(map);
				if (null != user){
					session.setAttribute("tenantId", "123456789");
					session.setAttribute("userId", user.getUserId());
					session.setAttribute("username", user.getUserName());
					throw new MyException(StaticVariable.AJAXSUCCESS,"");
				} else {
					throw new MyException(StaticVariable.AJAXERROR,"用户名密码不正确");
				}
			}
		}
	}*/
	
	/**
	 * 全局异常处理
	 * @param e
	 * @return
	 */
	@ExceptionHandler(value = Exception.class)
	@ResponseBody
    public Ajax Handle(Exception e){
        if (e instanceof MyException){
        	MyException myException = (MyException) e;
            return AjaxUtil.success(myException.getCode(),myException.getMessage());
        } else {
        	logger.info("[系统异常]{}",e);
            return AjaxUtil.error(StaticVariable.AJAXERROR,"未知错误");
        }
    }
}
