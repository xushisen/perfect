package com.xiaosen.util.ffmpeg;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * 将视频格式转换为ts流
 * 
 * @author Administrator
 *
 */
public class FfmpegUtil {

	/**
	 * 将视频转换为ts流
	 * 
	 * @param ffmpegPath
	 *            ffmpegPath bin路径
	 * @param inputPath
	 *            源文件路径
	 * @param outputPath
	 *            输出文件路径
	 * @return
	 */
	public static Boolean ffmpeg(String ffmpegPath, String inputPath, String outputPath) throws FFmpegException{
 
		if (!checkfile(inputPath)) {
			 throw new FFmpegException("文件格式不合法");
		}

		int type = checkContentType(inputPath);
		List<String> command = getFfmpegCommand(type, ffmpegPath, inputPath, outputPath);
		if (null != command && command.size() > 0) {
			return process(command);
			 
		}
		return false;
	}

	/**
	 * 检查视频的格式
	 * 
	 * @param inputPath
	 *            源文件
	 * @return
	 */
	private static int checkContentType(String inputPath) {
		String type = inputPath.substring(inputPath.lastIndexOf(".") + 1, inputPath.length()).toLowerCase();
		// ffmpeg能解析的格式：（asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等）
		if (type.equals("avi")) {
			return 1;
		} else if (type.equals("mpg")) {
			return 1;
		} else if (type.equals("wmv")) {
			return 1;
		} else if (type.equals("3gp")) {
			return 1;
		} else if (type.equals("mov")) {
			return 1;
		} else if (type.equals("mp4")) {
			return 1;
		} else if (type.equals("mkv")){
			return 1;
		}else if (type.equals("asf")) {
			return 0;
		} else if (type.equals("flv")) {
			return 0;
		}else if (type.equals("rm")) {
			return 0;
		} else if (type.equals("rmvb")) {
			return 1;
		}
		return 9;
	}

	/**
	 * 检查文件的合法性
	 * 
	 * @param path
	 * @return
	 */
	public static boolean checkfile(String path) {
		File file = new File(path);
		if (!file.isFile()) {
			return false;
		}
		return true;
	}

	/**
	 * ffmpeg能解析的格式：（asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等）
	 * 
	 * @param command
	 * @param dto
	 * @throws FFmpegException 
	 */
	public static boolean process(List<String> command) throws FFmpegException{

		try {

			if (null == command || command.size() == 0)
				return false;
			Process videoProcess = new ProcessBuilder(command).redirectErrorStream(true).start();

			new PrintStream(videoProcess.getErrorStream()).start();

			new PrintStream(videoProcess.getInputStream()).start();

			int exitcode = videoProcess.waitFor();
			 
			if (exitcode == 1) {
				return false;
			}
			return true;
		} catch (Exception e) {
			throw new FFmpegException("file upload failed",e);
		}

	}

	/**
	 * 根据文件类型设置ffmpeg命令
	 * 
	 * @param type
	 * @param oldfilepath
	 * @param outputPath
	 * @param dto
	 * @return
	 * @throws FFmpegException 
	 */
	private static List<String> getFfmpegCommand(int type, String ffmpegPath, String oldfilepath, String outputPath) throws FFmpegException {
		List<String> command = new ArrayList<String>();
		if (type == 1) {
			command.add(ffmpegPath + "/ffmpeg");
			//同名文件直接覆盖
			command.add("-y");
			command.add("-i");  // 添加参数＂-i＂，该参数指定要转换的文件
			command.add(oldfilepath);
			/**command.add("-c:v");
			command.add("libx264");
			command.add("-x264opts");
			command.add("force-cfr=1");
			command.add("-c:a");
			command.add("mp2");
			command.add("-b:a");
			command.add("256k");
			command.add("-vsync");
			command.add("cfr");
			command.add("-f");
			command.add("mpegts");*/
			/**
			 * 10:10  左上角 
			 * main_w-overlay_w-10:10  右上角
			 * 10:main_h-overlay_h-10  左下角
			 * main_w-overlay_w-10:main_h-overlay_h-10  右下角
			 * (main_w-overlay_w)/2:main_h-overlay_h:1底部居中
			 */
			// 下面两句是添加水印的
	        command.add("-vf");
	        String[] first = ffmpegPath.replaceAll("\\\\", "/").split(":");
	        command.add("\"movie="+first[0]+"\\\\:"+first[1].replaceAll("//", "/")+"/2.png[logo];[in][logo]overlay=main_w-overlay_w-10:10\"");
	        command.add("-strict");
	        command.add("-2");
	        command.add("-q:v");  
	        command.add("4");  
			
			command.add(outputPath);
		} else if(type==0){
			command.add(ffmpegPath + "\\ffmpeg");
			command.add("-i");
			command.add(oldfilepath);
			command.add("-c:v");
			command.add("libx264");
			command.add("-x264opts");
			command.add("force-cfr=1");
			command.add("-vsync");
			command.add("cfr");
			command.add("-vf");
			command.add("idet,yadif=deint=interlaced");
			command.add("-filter_complex");
			command.add("aresample=async=1000");
			command.add("-c:a");
			command.add("libmp3lame");
			command.add("-b:a");
			command.add("192k");
			command.add("-pix_fmt");
			command.add("yuv420p");
			command.add("-f");
			command.add("mpegts");
			command.add(outputPath);
		}else{
			throw new FFmpegException("不支持当前上传的文件格式");
		}
		//添加截图
        command.add("-ss");
		command.add("1");//这个参数是设置截取视频多少秒时的画面    
        command.add("-y");
        command.add("-f");    
        command.add("image2");    
        command.add("-t");    
        command.add("0.001");
        command.add("-s");    
        command.add("700x525"); //这个参数是设置截取图片的大小 
        String imagePath = outputPath.substring(0, outputPath.lastIndexOf("\\"));
		String name = outputPath.substring(outputPath.lastIndexOf("\\") + 1,
				outputPath.lastIndexOf(".")-3);
		String imagesPath = imagePath + File.separator + "images" + File.separator;
		File file = new File(imagesPath);
		if (!file.exists()) {
			file.mkdirs();
        }
        command.add(imagesPath + name + ".jpg");
		return command;
	}
}

class PrintStream extends Thread {
	java.io.InputStream __is = null;

	public PrintStream(java.io.InputStream is) {
		__is = is;
	}

	public void run() {
		try {
			while (this != null) {
				int _ch = __is.read();
				if (_ch == -1) {
					break;
				} else {
					System.out.print((char) _ch);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
