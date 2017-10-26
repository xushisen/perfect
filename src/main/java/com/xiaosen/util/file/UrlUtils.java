package com.xiaosen.util.file;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

/**
 * 类描述：网页静态化技术
 *   
 * 创建人：ssxu  
 * 创建时间：2017-2-25 下午10:25:09   
 * 版本 1.0.0
 *
 */
public class UrlUtils {

	/**
	 * 返回网址的html源码
	 * @param url 网页的地址
	 * @param encode 编码
	 * @return 网页的源码
	 */
	public static String readUrl(String url, String encode){
		StringBuffer buffer = new StringBuffer();
		URLConnection con = null;
		InputStreamReader in = null;
		BufferedReader reader = null;
		try {
			URL urlObj = new URL(url);
			//打开网络连接
			con = urlObj.openConnection();
			//建立写入流
			in = new InputStreamReader(con.getInputStream(),encode);
			//建立缓冲写入流
			reader = new BufferedReader(in);
			//临时变量
			String temp = null;
			while ((temp = reader.readLine()) != null) {
				buffer.append(temp+"\n");
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
			System.out.println("网络不给力,请检查设置");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("网络链接打开失败,请稍后重试");
		} finally{
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return buffer.toString();
	}
	
	/**
	 * 直接把url生成静态网页
	 * @param url  网址 
	 * @param encode  编码
	 * @param fileaName  输出文件的名
	 */
	public static void copyUrlStatic(String url, String encode, String fileName){
		URLConnection con = null;
		InputStreamReader in = null;
		BufferedReader reader = null;
		BufferedWriter writer = null;
		try {
			URL urlObj = new URL(url);
			//打开网络连接
			con = urlObj.openConnection();
			//建立写入流
			in = new InputStreamReader(con.getInputStream(),encode);
			//建立缓冲写入流
			reader = new BufferedReader(in);
			//建立输出流
			writer = new BufferedWriter(new FileWriter(fileName));
			//临时变量
			String temp = null;
			while ((temp = reader.readLine()) != null) {
				writer.write(temp);
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
			System.out.println("网络不给力,请检查设置");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("网络链接打开失败,请稍后重试");
		} finally{
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public static void main(String[] args) {
		//读取
		//String urls = readUrl("https://www.jd.com", "utf-8");
		//System.out.println(urls);
		copyUrlStatic("http://www.baidu.com/", "utf-8", "d:/baidu.html");
	}
}
