package com.xiaosen.util.ffmpeg;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class VedioInfoUtil {
	/** 
     * 获取视频总时间 
     * @param viedo_path    视频路径 
     * @param ffmpeg_path   ffmpeg路径 
     * @return 
     */  
    public static String getVideoTime(String video_path) {  
        List<String> commands = new java.util.ArrayList<String>();  
        commands.add(ConvertVedio.getFfmpegPath()+"/ffmpeg");  
        commands.add("-i");  
        commands.add(video_path);  
        try {  
            ProcessBuilder builder = new ProcessBuilder();  
            builder.command(commands);  
            final Process p = builder.start();  
              
            //从输入流中读取视频信息  
            BufferedReader br = new BufferedReader(new InputStreamReader(p.getErrorStream()));  
            StringBuffer sb = new StringBuffer();  
            String line = "";  
            while ((line = br.readLine()) != null) {  
                sb.append(line);  
            }  
            br.close();  
              
            //从视频信息中解析时长  
            String regexDuration = "Duration: (.*?), start: (.*?), bitrate: (\\d*) kb\\/s";  
            Pattern pattern = Pattern.compile(regexDuration);  
            Matcher m = pattern.matcher(sb.toString());  
            if (m.find()) {
                int time = getTimelen(m.group(1));  
                //System.out.println(video_path+",视频时长："+secToTime(time)+", 开始时间："+m.group(2)+",比特率："+m.group(3)+"kb/s");  
                return secToTime(time);  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return "";  
    }  
      
    //格式:"00:00:10.68"  
    private static int getTimelen(String timelen){  
        int min=0;  
        String strs[] = timelen.split(":");  
        if (strs[0].compareTo("0") > 0) {
            min+=Integer.valueOf(strs[0])*60*60;//秒
        }
        if(strs[1].compareTo("0")>0){
            min+=Integer.valueOf(strs[1])*60;
        }
        if(strs[2].compareTo("0")>0){
            min+=Math.round(Float.valueOf(strs[2]));
        }
        return min;  
    }
    
    private static String secToTime(int seconds) {  
		int temp=0;
		StringBuffer sb=new StringBuffer();
		temp = seconds/3600;
		sb.append((temp<10) ? "0" + temp + ":":"" + temp + ":");

		temp=seconds%3600/60;
		sb.append((temp<10) ? "0" + temp+ ":":"" + temp + ":");

		temp=seconds%3600%60;
		sb.append((temp<10) ? "0" + temp:"" + temp);
		return sb.toString();
    }  
}
