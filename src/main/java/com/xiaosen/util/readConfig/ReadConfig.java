package com.xiaosen.util.readConfig;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

/**
 * 
 * 类描述：读取配置文件工具类   
 * 创建人：ssxu  
 * 创建时间：2017-7-30 下午2:31:05   
 * @version  1.0
 *
 */
public class ReadConfig {

	private static Properties pro = new Properties();
	
	static {
		readConfig();
	}
	
	public static String getValue(String name){
		return pro.getProperty(name);
	}
	
	public static void readConfig(){
		FileInputStream in;
		try {
			in = new FileInputStream(ReadConfig.class.getResource("/").getFile() 
					+ File.separator + "jdbc.properties");
			pro.load(in);
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
