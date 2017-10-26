package com.xiaosen.test;
import org.junit.runner.RunWith;  
import org.slf4j.Logger;  
import org.slf4j.LoggerFactory;  
import org.springframework.test.context.ContextConfiguration;  
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;  
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;  
  
/**
 * 
 * ��������   
 * �����ˣ�ssxu  
 * ����ʱ�䣺2017-4-25 ����6:06:41   
 * @version  1.0
 *
 */
//ָ��beanע��������ļ�  
@ContextConfiguration(locations = { "classpath:application.xml" })  
//ʹ�ñ�׼��JUnit @RunWithע��������JUnitʹ��Spring TestRunner  
@RunWith(SpringJUnit4ClassRunner.class)  
public abstract class SpringTestCase extends AbstractJUnit4SpringContextTests{  
    protected Logger logger = LoggerFactory.getLogger(getClass());  
}  