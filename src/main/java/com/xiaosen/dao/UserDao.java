package com.xiaosen.dao;

import java.util.List;
import java.util.Map;

import com.xiaosen.entity.User;

/**
 * 
 * 类描述：   userDAO
 * 创建人：ssxu  
 * 创建时间：2017-6-23 上午9:42:53   
 * @version  1.0
 *
 */
public interface UserDao {
	/**
	 * 登录验证
	 * @param params
	 * @return
	 */
	public User selectUserById(Map<String,String> params);
	
	/**
	 * list查询
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<User> getList(Map<String,Object> map) throws Exception;
	
	/**
	 * 新增
	 * @param user
	 * @throws Exception
	 */
	public void save(User user) throws Exception;
	
	/**
	 * 修改
	 */
	public void update(User user) throws Exception;
	
	/**
	 * 删除
	 * @param ids
	 * @throws Exception
	 */
	public void deleteByIds(String[] ids) throws Exception;
}  
