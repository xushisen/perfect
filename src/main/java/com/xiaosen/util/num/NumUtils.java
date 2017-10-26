package com.xiaosen.util.num;

import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.NumberFormat;

import com.xiaosen.util.string.StringUtils;

/**
 * 类描述：数字处理工具类
 * 
 * 创建人：ssxu 创建时间：2017-2-23 下午4:06:16 版本 1.0.0
 * 
 */
public class NumUtils {

	/**
	 * 结果是两个int型字符串相加
	 * 
	 * @param str1
	 *            数字1
	 * @param str2
	 *            数字2
	 * @return 求和的结果
	 */
	public static int intSum(String str1, String str2) {
		int num1 = StringUtils.isEmpty(str1) ? 0 : Integer.parseInt(str1);
		int num2 = StringUtils.isEmpty(str2) ? 0 : Integer.parseInt(str2);
		return num1 + num2;
	}

	/**
	 * 结果是两个double型字符串相加
	 * 
	 * @param str1
	 *            数字1
	 * @param str2
	 *            数字2
	 * @return 求和的结果
	 */
	public static double doubleSum(String str1, String str2) {
		double num1 = StringUtils.isEmpty(str1) ? 0 : Double.parseDouble(str1);
		double num2 = StringUtils.isEmpty(str2) ? 0 : Double.parseDouble(str2);
		return num1 + num2;
	}

	/**
	 * 去掉小数点后面多余的0 比如25.0
	 * 
	 * @param d1
	 *            数字
	 * @return 返回操作后的数字 25
	 */
	public static String splitZero(Double d1) {
		DecimalFormat df = new DecimalFormat("###################.###########");
		return df.format(d1);
	}

	/**
	 * double保留多少位小数
	 * 
	 * @param num
	 *            需要操作的数字
	 * @param backNum
	 *            要保留的位数
	 * @return 返回保留后的string
	 */
	public static String RetainDecimals(Double num, int backNum) {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < backNum; i++) {
			if (i == 0) {
				buffer.append(".");
			}
			buffer.append("0");
		}
		DecimalFormat df = new DecimalFormat("#" + buffer.toString());
		return df.format(num);
	}

	/**
	 * 求百分比
	 * @param num
	 * @param total
	 * @param scale
	 * @return
	 */
	public static String accuracy(double num, double total, int scale) {
		DecimalFormat df = (DecimalFormat) NumberFormat.getInstance();
		// 可以设置精确几位小数
		df.setMaximumFractionDigits(scale);
		// 模式 例如四舍五入
		df.setRoundingMode(RoundingMode.HALF_UP);
		double accuracy_num = num / total * 100;
		return df.format(accuracy_num) + "%";
	}
}
