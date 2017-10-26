package com.xiaosen.test;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.xiaosen.entity.User;
import com.xiaosen.service.UserService;

/**
 * 
 * ��������UserService��Ԫ����   
 * �����ˣ�ssxu  
 * ����ʱ�䣺2017-4-25 ����6:06:35   
 * @version  1.0
 *
 */
public class UserServiceTest extends SpringTestCase {
	@Autowired
	private UserService userService;
	Logger logger = Logger.getLogger(UserServiceTest.class);

	@Test
	public void selectUserByIdTest() {
		User user = userService.selectUserByPwd("徐石森","666666");
		System.out.println(user.getUserEmail());
		logger.debug("���ҽ��" + user.getUserEmail());
	}

}