package com.xiaosen.util.string;

import java.io.UnsupportedEncodingException;
import java.util.UUID;

/**
 * 类描述：关于字符串操作的各种方法
 *   
 * 创建人：ssxu  
 * 创建时间：2016-11-19 下午12:04:38   
 * 版本 1.0.0
 *
 */
public class StringUtils {

	/**
	 * 字符串为空
	 * @param str
	 * @return true 为空  false不为空
	 */
	public static boolean isEmpty(Object str){
		return null == str || "".equals(str) || str.toString().length() == 0 || str.toString().matches("\\s*");
	}
	
	/**
	 * 字符串不为空
	 * @param str
	 * @return true 不为空  false 为空
	 */
	public static boolean isNotEmpty(String str){
		return !isEmpty(str);
	}
	
	/**
	 * 转换编码
	 * @param str 要转码的str
	 * @param encode1 转码前的编码格式
	 * @param encode2 要转成的编码格式
	 * @return 返回编码成功的字符串
	 */
	public static String transcoding(String str, String encode1, String encode2){
		try {
			return new String(str.getBytes(encode1),encode2);
		} catch (UnsupportedEncodingException e) {
			System.err.println("转码异常==="+e.toString());
		}
		return str;
	}
	
	 /**
     * 获取指定位数的随机数
     * @param length   指定流水号长度
     * @param toNumber 指定流水号是否全由数字组成
     */
    public static String getSysJournalNo(int length, boolean isNumber){
        //replaceAll()之后返回的是一个由十六进制形式组成的且长度为32的字符串
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        if (uuid.length() > length) {
            uuid = uuid.substring(0, length);
        } else if (uuid.length() < length) {
            for(int i=0; i<length-uuid.length(); i++){
                uuid = uuid + Math.round(Math.random()*9);
            }
        }
        if (isNumber) {
            return uuid.replaceAll("a", "1").replaceAll("b", "2").replaceAll("c", "3").replaceAll("d", "4").replaceAll("e", "5").replaceAll("f", "6");
        } else {
            return uuid;
        }
    }
    
    /**
     * 获取一个字符串的简明效果
     * @return String 返回的字符串格式类似于"abcd***hijk"
     */
    public static String getStringSimple(String data){
        return data.substring(0,4) + "***" + data.substring(data.length()-4);
    }
    
    /**
     * HTML字符转义
     * @see 对输入参数中的敏感字符进行过滤替换,防止用户利用JavaScript等方式输入恶意代码
     * @see String input = <img src='http://t1.baidu.com/it/fm=0&gp=0.jpg'/>
     * @see HtmlUtils.htmlEscape(input);         //from spring.jar
     * @see StringEscapeUtils.escapeHtml(input); //from commons-lang.jar
     * @see 尽管Spring和Apache都提供了字符转义的方法,但Apache的StringEscapeUtils功能要更强大一些
     * @see StringEscapeUtils提供了对HTML,Java,JavaScript,SQL,XML等字符的转义和反转义
     * @see 但二者在转义HTML字符时,都不会对单引号和空格进行转义,而本方法则提供了对它们的转义
     * @return String 过滤后的字符串
     */
    public static String htmlEscape(String input) {
        if (isEmpty(input)) {
            return input;
        }
        input = input.replaceAll("&", "&amp;");
        input = input.replaceAll("<", "&lt;");
        input = input.replaceAll(">", "&gt;");
        input = input.replaceAll(" ", "&nbsp;");
        input = input.replaceAll("'", "&#39;");   //IE暂不支持单引号的实体名称,而支持单引号的实体编号,故单引号转义成实体编号,其它字符转义成实体名称
        input = input.replaceAll("\"", "&quot;"); //双引号也需要转义，所以加一个斜线对其进行转义
        input = input.replaceAll("\n", "<br/>");  //不能把\n的过滤放在前面，因为还要对<和>过滤，这样就会导致<br/>失效了
        return input;
    }

}
