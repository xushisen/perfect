package com.xiaosen.util.ip;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

public class Address {
	/**
	 * 
	 * @param content
	 *            请求的参数 格式为：name=xxx&pwd=xxx
	 * @param encoding
	 *            服务器端请求编码。如GBK,UTF-8等
	 * @return
	 * @throws UnsupportedEncodingException
	 * 
	 * 
	 *             返回的列子 { "code": 0, "data": { "ip": "210.75.225.254",
	 *             "country": "中国", "area": "华北", "region": "北京市", "city":
	 *             "北京市", "county": "", "isp": "电信", "country_id": "86",
	 *             "area_id": "100000", "region_id": "110000", "city_id":
	 *             "110000", "county_id": "-1", "isp_id": "100017" } }
	 */
	public static String getAddresses(String content, String encodingString)
			throws UnsupportedEncodingException {
		// 这里调用pconline的接口
		String urlStr = "http://ip.taobao.com/service/getIpInfo.php";
		// 从http://whois.pconline.com.cn取得IP所在的省市区信息
		String returnStr = Address.getResult(urlStr, content, encodingString);
		if (returnStr != null) {
			// 处理返回的省市区信息
			// System.out.println(returnStr);
			String[] temp = returnStr.split(",");
			if (temp.length < 3) {
				return "0";// 无效IP，局域网测试
			}
			String country = (temp[1].split(":"))[2].replaceAll("\"", ""); // 国家
			String area = (temp[3].split(":"))[1].replaceAll("\"", "");
			String region = (temp[5].split(":"))[1].replaceAll("\"", ""); // 省
			String city = (temp[7].split(":"))[1].replaceAll("\"", ""); // 市
			String county = (temp[9].split(":"))[1].replaceAll("\"", "");
			String isp = (temp[11].split(":"))[1].replaceAll("\"", "");
			country = decodeUnicode(country);
			region = decodeUnicode(region);// 省份
			city = decodeUnicode(city);// 市
			area = decodeUnicode(area);
			county = decodeUnicode(county);
			isp = decodeUnicode(isp);
			/**
			 * \u5e7f\u4e1c\u7701 String country = ""; String area = ""; String
			 * region = ""; String city = ""; String county = ""; String isp =
			 * ""; for(int i=0;i<temp.length;i++){ switch(i){ case 1:country =
			 * (temp[i].split(":"))[2].replaceAll("\"", ""); country =
			 * decodeUnicode(country);//国家 break; case 3:area =
			 * (temp[i].split(":"))[1].replaceAll("\"", ""); area =
			 * decodeUnicode(area);//地区 break; case 5:region =
			 * (temp[i].split(":"))[1].replaceAll("\"", ""); region =
			 * decodeUnicode(region);//省份 break; case 7:city =
			 * (temp[i].split(":"))[1].replaceAll("\"", ""); city =
			 * decodeUnicode(city);//市区 break; case 9:county =
			 * (temp[i].split(":"))[1].replaceAll("\"", ""); county =
			 * decodeUnicode(county);//地区 break; case 11:isp =
			 * (temp[i].split(":"))[1].replaceAll("\"", ""); isp =
			 * decodeUnicode(isp);//ISP公司 break; } }
			 */
			// System.out.println(country+"="+area+"="+region+"="+city+"="+county+"="+isp);
			return country + area + region + city + county + isp;
		}
		return null;
	}

	/**
	 * @param urlStr
	 *            请求的地址
	 * @param content
	 *            请求的参数 格式为：name=xxx&pwd=xxx
	 * @param encoding
	 *            服务器端请求编码。如GBK,UTF-8等
	 * @return
	 */
	private static String getResult(String urlStr, String content,
			String encoding) {
		URL url = null;
		HttpURLConnection connection = null;
		try {
			url = new URL(urlStr);
			connection = (HttpURLConnection) url.openConnection();// 新建连接实例
			connection.setConnectTimeout(2000);// 设置连接超时时间，单位毫秒
			connection.setReadTimeout(2000);// 设置读取数据超时时间，单位毫秒
			connection.setDoOutput(true);// 是否打开输出流 true|false
			connection.setDoInput(true);// 是否打开输入流true|false
			connection.setRequestMethod("POST");// 提交方法POST|GET
			connection.setUseCaches(false);// 是否缓存true|false
			connection.connect();// 打开连接端口
			DataOutputStream out = new DataOutputStream(
					connection.getOutputStream());// 打开输出流往对端服务器写数据
			out.writeBytes(content);// 写数据,也就是提交你的表单 name=xxx&pwd=xxx
			out.flush();// 刷新
			out.close();// 关闭输出流
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					connection.getInputStream(), encoding));// 往对端写完数据对端服务器返回数据
			// ,以BufferedReader流来读取
			StringBuffer buffer = new StringBuffer();
			String line = "";
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			reader.close();
			return buffer.toString();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.disconnect();// 关闭连接
			}
		}
		return null;
	}

	/**
	 * unicode 转换成 中文
	 * 
	 * @author fanhui 2007-3-15
	 * @param theString
	 * @return
	 */
	public static String decodeUnicode(String theString) {
		char aChar;
		int len = theString.length();
		StringBuffer outBuffer = new StringBuffer(len);
		for (int x = 0; x < len;) {
			aChar = theString.charAt(x++);
			if (aChar == '\\') {
				aChar = theString.charAt(x++);
				if (aChar == 'u') {
					int value = 0;
					for (int i = 0; i < 4; i++) {
						aChar = theString.charAt(x++);
						switch (aChar) {
						case '0':
						case '1':
						case '2':
						case '3':
						case '4':
						case '5':
						case '6':
						case '7':
						case '8':
						case '9':
							value = (value << 4) + aChar - '0';
							break;
						case 'a':
						case 'b':
						case 'c':
						case 'd':
						case 'e':
						case 'f':
							value = (value << 4) + 10 + aChar - 'a';
							break;
						case 'A':
						case 'B':
						case 'C':
						case 'D':
						case 'E':
						case 'F':
							value = (value << 4) + 10 + aChar - 'A';
							break;
						default:
							throw new IllegalArgumentException(
									"Malformed      encoding.");
						}
					}
					outBuffer.append((char) value);
				} else {
					if (aChar == 't') {
						aChar = '\t';
					} else if (aChar == 'r') {
						aChar = '\r';
					} else if (aChar == 'n') {
						aChar = '\n';
					} else if (aChar == 'f') {
						aChar = '\f';
					}
					outBuffer.append(aChar);
				}
			} else {
				outBuffer.append(aChar);
			}
		}
		return outBuffer.toString();
	}

	/**
	 * 获取用户真实IP地址，不使用request.getRemoteAddr();的原因是有可能用户使用了代理软件方式避免真实IP地址,
	 * 
	 * 可是，如果通过了多级反向代理的话，X-Forwarded-For的值并不止一个，而是一串IP值，究竟哪个才是真正的用户端的真实IP呢？
	 * 答案是取X-Forwarded-For中第一个非unknown的有效IP字符串。
	 * 
	 * 如：X-Forwarded-For：192.168.1.110, 192.168.1.120, 192.168.1.130,
	 * 192.168.1.100
	 * 
	 * 用户真实IP为： 192.168.1.110
	 * 
	 * @param request
	 * @return
	 */
	public static String getIpAddress(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	/**
	 * java 获取mac地址
	 * @param args
	 */
	public static String getMac(){
		try {
			InetAddress ia = InetAddress.getLocalHost();
			byte[] mac = NetworkInterface.getByInetAddress(ia).getHardwareAddress();
			return DatatypeConverter.printHexBinary(mac);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * 获取ip  调用的接口是 www.showapi.com
	 */
	public static String getIp(){
		String ip = "";
		try {
			URL u = new URL(
					"http://route.showapi.com/632-1?showapi_appid=59910&showapi_sign=07e9f3f5e9ea43f499b9c425a085f784");
			InputStream in = u.openStream();
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			try {
				byte buf[] = new byte[1024];
				int read = 0;
				while ((read = in.read(buf)) > 0) {
					out.write(buf, 0, read);
				}
				byte b[] = out.toByteArray();
				ip = new String(b, "utf-8");
			} finally {
				if (in != null) {
					in.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ip;
	}
	
	// 测试
	public static void main(String[] args) {
		// 测试ip 219.136.134.157 中国=华南=广东省=广州市=越秀区=电信
		String ip = "192.168.0.103";
		String address = "";
		try {
			address = Address.getAddresses("ip=" + ip, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.println(address); 
		// 输出结果为：广东省,广州市,越秀区
		System.out.println(Address.getMac());
	}
}
