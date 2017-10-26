package com.xiaosen.service;

import java.util.Map;

import com.xiaosen.entity.User;

/**
 * 
 * 类描述：   userService
 * 创建人：ssxu  
 * 创建时间：2017-6-23 上午9:42:29   
 * @version  1.0
 *
 */
public interface UserService {
	/**
	 * 登录校验
	 * @param userName
	 * @param userPwd
	 * @return
	 */
	User selectUserByPwd(String userName, String userPwd);
	
	/**
	 * list查询
	 * @return
	 * @throws Exception
	 */
	Map<String,Object> getList(Map<String,Object> params) throws Exception;
	
	/**
	 * 删除
	 * @param ids
	 * @throws Exception
	 */
	void deleteByIds(String ids) throws Exception;
	
}
