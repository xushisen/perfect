package com.xiaosen.util.reg;

import java.util.regex.Pattern;

/**
 * 
 * 类描述：   正则验证
 * 创建人：ssxu  
 * 创建时间：2017-6-14 上午11:06:15   
 * @version  1.0
 *
 */
public class RegUtil {

	/**
	 * 手机号
	 */
	public static final String PHONE = "^1(3|4|5|7|8)\\d{9}$";
	
	/**
	 * 身份证
	 */
	public static final String IDCARE = "(^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}$)";

	/**
	 * 邮箱
	 */
	public static final String EMAIL = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
	
	/**
     * 校验手机号
     * 
     * @param mobile
     * @return 校验通过返回true，否则返回false
     */
    public static boolean isPhone(String phone) {
        return Pattern.matches(PHONE, phone);
    }
    
    /**
     * 校验身份证
     * 
     * @param mobile
     * @return 校验通过返回true，否则返回false
     */
    public static boolean isIdCard(String phone) {
        return Pattern.matches(IDCARE, phone);
    }
    
    /**
     * 校验邮箱
     * 
     * @param mobile
     * @return 校验通过返回true，否则返回false
     */
    public static boolean isEmail(String email) {
        return Pattern.matches(EMAIL, email);
    }
}
