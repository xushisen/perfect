package com.xiaosen.util.ffmpeg;



/**
 * 转换视频格式为ts流
 * @author Administrator
 *
 */
public class ConvertVedio {
	
	public static void convertVedio(String inputPath){
		String ffmpegPath = getFfmpegPath();
		String outputPath = getOutputPath(inputPath);
		try {
			FfmpegUtil.ffmpeg(ffmpegPath, inputPath, outputPath);
		} catch (FFmpegException e) {
			e.printStackTrace();
		}
		 
	}

	/**
	 * 获取ffmpeg执行文件的路径
	 * 
	 * @return
	 */
	public static String getFfmpegPath() {
		String path = ConvertVedio.class.getResource("/").getPath().replaceAll("/", "\\\\\\\\");
		return path.substring(2,path.length()-1)+"\\ffmpeg";
	}

	/**
	 * 获取输出文件名
	 * 
	 * @param inputPath
	 * @return
	 */
	private static String getOutputPath(String inputPath) {
//		return inputPath.substring(0, inputPath.lastIndexOf(".")).toLowerCase() + ".ts";
		return inputPath.substring(0, inputPath.lastIndexOf(".")).toLowerCase() + "out.mp4";
		//return "D:\\hehe\\apache-tomcat-8.0.48\\webapps\\fvideoupload\\20180408\\2out.mp4";
	}
	
}
