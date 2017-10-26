package com.xiaosen.util.numbertochinese;

import java.util.HashMap;

public class Tool {
	// 数字位
	public static String[] chnNumChar = new String[] { "零", "一", "二", "三", "四",
			"五", "六", "七", "八", "九" };
	public static char[] chnNumChinese = new char[] { '零', '一', '二', '三', '四',
			'五', '六', '七', '八', '九' };
	// 节权位
	public static String[] chnUnitSection = new String[] { "", "万", "亿", "万亿" };
	// 权位
	public static String[] chnUnitChar = new String[] { "", "十", "百", "千" };
	public static HashMap<Character, Integer> intList = new HashMap<Character, Integer>();
	static {
		for (int i = 0; i < chnNumChar.length; i++) {
			intList.put(chnNumChinese[i], i);
		}
		intList.put('十', 10);
		intList.put('百', 100);
		intList.put('千', 1000);
	}
}
