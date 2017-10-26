package com.xiaosen.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaosen.controller.tld.Page;
import com.xiaosen.dao.UserDao;
import com.xiaosen.entity.User;
import com.xiaosen.service.UserService;

/**
 * 
 * 类描述：   userServiceImpl
 * 创建人：ssxu  
 * 创建时间：2017-6-23 上午9:42:40   
 * @version  1.0
 *
 */
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	/**
	 * 登录验证
	 */
	@Override
	public User selectUserByPwd(String userName, String userPwd) {
		Map<String,String> params = new HashMap<String, String>();
		params.put("name", userName);
		params.put("pwd", userPwd);
		return userDao.selectUserById(params);
	}

	/**
	 * list查询
	 */
	@Override
	public Map<String,Object> getList(Map<String,Object> params) throws Exception {
		Map<String,Object> pageMap = Page.getPageMap(params);
		List<User> list = userDao.getList(pageMap);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		//拦截器会自动让pageMap加上总数的参数
		resultMap.put("page", pageMap);
		return resultMap;
	}
	
	/**
	 * 删除
	 */
	public void deleteByIds(String ids) throws Exception{
		userDao.deleteByIds(ids.split(","));
	}
}
