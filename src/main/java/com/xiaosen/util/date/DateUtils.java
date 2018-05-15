package com.xiaosen.util.date;

import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 
 * 类描述：  时间处理工具类
 * 创建人：ssxu  
 * 创建时间：2017-4-29 下午8:54:12   
 * @version  1.0
 *
 */
public class DateUtils {

	/**
	 * 根据传入的类型返回SimpleDateFormat对象
	 * @param dateType
	 * @return
	 */
	public static SimpleDateFormat getDateFormat(String... dateType){
		String type = dateType.length==0 ? "yyyy-MM-dd" : dateType[0];
		return new SimpleDateFormat(type);
	}
	
	/**
	 * 返回当前时间字符串  默认格式yyyy-MM-dd
	 * @param dateType 要返回的格式  <span style="color:red">yyyy-MM-dd HH:mm:ss</span>
	 * @return 返回当前时间字符串
	 */
	public static String getNowDate(String... dateType){
		return getDateFormat(dateType).format(new Date()); 
	}
	
	/**
	 * 时间转字符串  默认格式yyyy-MM-dd
	 * @param data 时间
	 * @param dateType 要转的类型  <span style="color:red">yyyy-MM-dd HH:mm:ss</span>
	 * @return 相对应的字符串
	 */
	public static String dateToStr(Date data, String... dateType){
		return getDateFormat(dateType).format(data);
	}
	
	/**
	 * 字符串转日期   默认格式yyyy-MM-dd
	 * @param str 时间字符串
	 * @param dateType 要转的类型  <span style="color:red">yyyy-MM-dd HH:mm:ss</span>
	 * @return 转成的date
	 */
	public static Date strToDate(String str, String... dateType){
		Date date = null;
		try {
			date = getDateFormat(dateType).parse(str);
		} catch (Exception e) {
			System.err.println("时间转字符串出错"+e.toString());
		}
		return date;
	}
	
	/**  
     * 计算两个日期之间相差的天数  
     * @param smdate 较小的时间  格式yyyy-MM-dd
     * @param bdate  较大的时间  格式yyyy-MM-dd
     * @return 相差天数 
     */    
    public static int daysBetween(Date smdate, Date bdate){    
        SimpleDateFormat sdf=getDateFormat("yyyy-MM-dd");  
        try {
			smdate=sdf.parse(sdf.format(smdate));
			bdate=sdf.parse(sdf.format(bdate));
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(smdate);
	        long time1 = cal.getTimeInMillis();            
	        cal.setTime(bdate);
	        long time2 = cal.getTimeInMillis();    
	        long between_days=(time2-time1)/(1000*3600*24);
	        return Integer.parseInt(String.valueOf(between_days));
		} catch (ParseException e) {
			System.err.println("计算日期天数出错==="+e.toString());
		}  
        return 0;
    } 
    
    /**
     * 两个日期相减得到天数小时分钟
     * @param date1
     * @param date2
     * @return
     */
    public static String dateXj(String date1,String date2){
    	try {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date d1 = df.parse(date1);
			Date d2 = df.parse(date2);
			long diff = d1.getTime() - d2.getTime();// 这样得到的差值是微秒级别
			long days = diff / (1000 * 60 * 60 * 24);

			long hours = (diff - days * (1000 * 60 * 60 * 24))
					/ (1000 * 60 * 60);
			long minutes = (diff - days * (1000 * 60 * 60 * 24) - hours
					* (1000 * 60 * 60))
					/ (1000 * 60);
			return "" + days + "天" + hours + "小时" + minutes + "分";
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	return "计算出错";
    }
    
	/***
     * 给日期增加多少天
     * 
     * @param calDate
     * @param addDate 类型必须是long
     * @return
     */
    public static String addCalendarDay(Date calDate, long addDate) {
        long time = calDate.getTime();
        addDate = addDate * 24 * 60 * 60 * 1000;
        time += addDate;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(new Date(time));
    }
    
    /**
     * 给日期加几个月 然后当前日减去一
     * @param calDate
     * @param addDate
     * @return
     */
    public static String addCalendarMonth(Date calDate, int month) {
    	Format f = new SimpleDateFormat("yyyy-MM-dd");
	    Calendar c = Calendar.getInstance();
	    c.add(Calendar.MONTH, month);
	    c.add(Calendar.DAY_OF_MONTH, -1); 
	    return f.format(c.getTime());
    }

	/**
     * 计算传入的时间离当前时间的时间差
     * @param time
     * @return
     */
    public static String CalculateTime(String time){
        long nowTime=System.currentTimeMillis();  //获取当前时间的毫秒数
        String msg = null;
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//指定时间格式
        Date setTime = null;  //指定时间
        try {
            setTime = sdf.parse(time);  //将字符串转换为指定的时间格式
        } catch (ParseException e) {
            e.printStackTrace();
        }
        long reset=setTime.getTime();   //获取指定时间的毫秒数
        long dateDiff=nowTime-reset;
        if(dateDiff<0){
            msg="输入的时间不对";
        }else{
            long dateTemp1=dateDiff/1000; //秒
            long dateTemp2=dateTemp1/60; //分钟
            long dateTemp3=dateTemp2/60; //小时
            long dateTemp4=dateTemp3/24; //天数
            long dateTemp5=dateTemp4/30; //月数
            long dateTemp6=dateTemp5/12; //年数
            if(dateTemp6>0){
                msg = dateTemp6+"年前";
            }else if(dateTemp5>0){
                msg = dateTemp5+"个月前";
            }else if(dateTemp4>0){
                msg = dateTemp4+"天前";
            }else if(dateTemp3>0){
                msg = dateTemp3+"小时前";
            }else if(dateTemp2>0){
                msg = dateTemp2+"分钟前";
            }else if(dateTemp1>0){
                msg = "刚刚";
            }
        }
        return msg;
    }

	public static void main(String[] args) {
		System.err.println(strToDate("2017-02-21 12:55:55","yyyy-MM-dd HH:mm:ss"));
		//System.out.println(getNowDate("yyyy-MM-dd HH:mm:ss"));
		//System.out.println(daysBetween(strToDate("2017-1-6","yyyy-MM-dd"),strToDate("2017-2-6","yyyy-MM-dd")));
	}
}
