package com.xiaosen.util.numbertochinese;

public class Man {
	public static void main(String[] args) {
		Man ma = new Man();
		ma.initMain();
	}

	public void initMain() {
		testNumberToChinese();
		System.out.println("————————————————————————————————————————");
		testChineseToNumber();
	}

	public void testNumberToChinese() {
		System.out.println("0:" + NumberChangeToChinese.numberToChinese(0));
		System.out.println("1:" + NumberChangeToChinese.numberToChinese(1));
		System.out.println("2:" + NumberChangeToChinese.numberToChinese(2));
		System.out.println("3:" + NumberChangeToChinese.numberToChinese(3));
		System.out.println("4:" + NumberChangeToChinese.numberToChinese(4));
		System.out.println("5:" + NumberChangeToChinese.numberToChinese(5));
		System.out.println("6:" + NumberChangeToChinese.numberToChinese(6));
		System.out.println("7:" + NumberChangeToChinese.numberToChinese(7));
		System.out.println("8:" + NumberChangeToChinese.numberToChinese(8));
		System.out.println("9:" + NumberChangeToChinese.numberToChinese(9));
		System.out.println("10:" + NumberChangeToChinese.numberToChinese(10));
		System.out.println("11:" + NumberChangeToChinese.numberToChinese(11));
		System.out.println("110:" + NumberChangeToChinese.numberToChinese(110));
		System.out.println("111:" + NumberChangeToChinese.numberToChinese(111));
		System.out.println("100:" + NumberChangeToChinese.numberToChinese(100));
		System.out.println("102:" + NumberChangeToChinese.numberToChinese(102));
		System.out.println("1020:"
				+ NumberChangeToChinese.numberToChinese(1020));
		System.out.println("1001:"
				+ NumberChangeToChinese.numberToChinese(1001));
		System.out.println("1015:"
				+ NumberChangeToChinese.numberToChinese(1015));
		System.out.println("1000:"
				+ NumberChangeToChinese.numberToChinese(1000));
		System.out.println("10000:"
				+ NumberChangeToChinese.numberToChinese(10000));
		System.out.println("20010"
				+ NumberChangeToChinese.numberToChinese(20010));
		System.out.println("20001"
				+ NumberChangeToChinese.numberToChinese(20001));
		System.out.println("100000:"
				+ NumberChangeToChinese.numberToChinese(100000));
		System.out.println("1000000:"
				+ NumberChangeToChinese.numberToChinese(1000000));
		System.out.println("10000000"
				+ NumberChangeToChinese.numberToChinese(10000000));
		System.out.println("100000000:"
				+ NumberChangeToChinese.numberToChinese(100000000));
		System.out.println("1000000000"
				+ NumberChangeToChinese.numberToChinese(1000000000));
		System.out.println("2000105"
				+ NumberChangeToChinese.numberToChinese(2000105));
		System.out.println("20001007:"
				+ NumberChangeToChinese.numberToChinese(20001007));
		System.out.println("2005010010:"
				+ NumberChangeToChinese.numberToChinese(2005010010));
	}

	public void testChineseToNumber() {
		System.out.println("二十亿零五千五百零一万四千零一十:"
				+ ChineseChangeToNumber.ChineseToNumber("二十亿零五千五百零一万四千零一十"));
		System.out.println("二千万一千零七:"
				+ ChineseChangeToNumber.ChineseToNumber("二千万一千零七"));
		System.out.println("二万零一:"
				+ ChineseChangeToNumber.ChineseToNumber("二万零一"));
		System.out.println("二万零一十:"
				+ ChineseChangeToNumber.ChineseToNumber("二万零一十"));
		System.out.println("一万:" + ChineseChangeToNumber.ChineseToNumber("一万"));
		System.out.println("一千零一十五:"
				+ ChineseChangeToNumber.ChineseToNumber("一千零一十五"));
		System.out.println("一千:" + ChineseChangeToNumber.ChineseToNumber("一千"));
		System.out.println("一亿:" + ChineseChangeToNumber.ChineseToNumber("一亿"));

	}
}
