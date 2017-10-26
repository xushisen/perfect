package com.xiaosen.util.txm;

/*import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;

import org.jbarcode.JBarcode;
import org.jbarcode.encode.Code128Encoder;
import org.jbarcode.encode.EAN13Encoder;
import org.jbarcode.encode.InvalidAtributeException;
import org.jbarcode.paint.BaseLineTextPainter;
import org.jbarcode.paint.EAN13TextPainter;
import org.jbarcode.paint.WidthCodedPainter;
import org.jbarcode.util.ImageUtil;

import sun.misc.BASE64Encoder;

*//**
 * 类描述：条形码工具包
 *   
 * 创建人：ssxu  
 * 创建时间：2017-2-14 下午12:44:56   
 * 版本 1.0.0
 *
 *//*
public class BarcodeUtil {
	*//**
	 * 128条形码
	 * 
	 * @param strBarCode 条形码：0-100位
	 * @param dimension 商品条形码：尺寸
	 * @param barheight 商品条形码：高度
	 * @param type true 返回图片的路径  false 返回图片的base64
	 * @return 图片(Base64编码)
	 *//*
	public static String generateBarCode128(String strBarCode,
			String dimension, String barheight, boolean type) {
		try {
			ByteArrayOutputStream outputStream = null;
			BufferedImage bi = null;
			JBarcode productBarcode = new JBarcode(
					Code128Encoder.getInstance(),
					WidthCodedPainter.getInstance(),
					EAN13TextPainter.getInstance());

			// 尺寸，面积，大小 密集程度
			productBarcode.setXDimension(Double.valueOf(dimension).doubleValue());
			// 高度 10.0 = 1cm 默认1.5cm
			productBarcode.setBarHeight(Double.valueOf(barheight).doubleValue());
			// 宽度
			productBarcode.setWideRatio(Double.valueOf(30).doubleValue());
			// 是否显示字体
			productBarcode.setShowText(true);
			// 显示字体样式
			productBarcode.setTextPainter(BaseLineTextPainter.getInstance());
			// 生成二维码
			bi = productBarcode.createBarcode(strBarCode);
			
			if (type) {  //生成图片 返回路径
				return createImg(bi,strBarCode);
			} else {   //返回图片的base64
				outputStream = new ByteArrayOutputStream();
				ImageIO.write(bi, "jpg", outputStream);
				BASE64Encoder encoder = new BASE64Encoder();
				return encoder.encode(outputStream.toByteArray());
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "encodeError";
		}
	}

	*//**
	 * 商品条形码
	 * @param strBarCode 商品条形码：13位
	 * @param dimension 商品条形码：尺寸
	 * @param barheight 商品条形码：高度
	 * @param  type true 返回图片的路径   false 返回图片的base64
	 * @return 图片(Base64编码)
	 *//*
	public static String generateBarCode(String strBarCode, String dimension,
			String barheight, boolean type) {
		try {
			ByteArrayOutputStream outputStream = null;
			BufferedImage bi = null;
			int len = strBarCode.length();
			JBarcode productBarcode = new JBarcode(EAN13Encoder.getInstance(),
					WidthCodedPainter.getInstance(),
					EAN13TextPainter.getInstance());

			String barCode = strBarCode.substring(0, len - 1);
			String code = strBarCode.substring(len - 1, len);
			
			// 校验13位
			String checkCode = productBarcode.calcCheckSum(barCode);
			if (!code.equals(checkCode)) {
				return "checkCodeError";
			}
			
			// 尺寸，面积，大小
			productBarcode.setXDimension(Double.valueOf(dimension).doubleValue());
			// 高度 10.0 = 1cm 默认1.5cm
			productBarcode.setBarHeight(Double.valueOf(barheight).doubleValue());
			// 宽度
			productBarcode.setWideRatio(Double.valueOf(25).doubleValue());
			// 是否校验13位，默认false
			productBarcode.setShowCheckDigit(true);
			// 显示字符串内容中是否显示检查码内容
			// productBarcode.setShowCheckDigit(true);
			// 生成二维码
			bi = productBarcode.createBarcode(barCode);
			
			if (type) {  //生成图片 返回路径
				return createImg(bi,strBarCode);
			} else {  //返回图片的base64
				outputStream = new ByteArrayOutputStream();
				ImageIO.write(bi, "jpg", outputStream);
				BASE64Encoder encoder = new BASE64Encoder();
				return encoder.encode(outputStream.toByteArray());
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "encodeError";
		}
	}

	*//**
	 * 生成图片调用的方法
	 * @param bi 图片对象
	 * @param jbarCode 条形码的字
	 * @return  图片的路径
	 *//*
	public static String createImg(BufferedImage bi,String jbarCode){
		String savePath = "D://barcode//images//"; //图片文件路径
		String imgFormat = "png";  //图片格式
		// 定义图片名称
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		String imgName = sdf.format(new Date()) + "_" + jbarCode;
		// 保存图片
		FileOutputStream fileOutputStream = null;
		String imgPath = savePath + imgName + "." + imgFormat;
		try {
			try {
				savePath = URLDecoder.decode(savePath, "UTF-8");
			} catch (UnsupportedEncodingException uee) {
				uee.printStackTrace();
				savePath = "D://barcode//images//";
			}
			File dirFile = new File(savePath);
			
			if (!dirFile.exists()) {
				dirFile.mkdirs();
			}
			fileOutputStream = new FileOutputStream(imgPath);

			ImageUtil.encodeAndWrite(bi, imgFormat, fileOutputStream, 96, 96);
			fileOutputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		// 返回路径
		return imgPath;
	}
	
	*//**
	 * @param args
	 * @throws InvalidAtributeException
	 *//*
	public static void main(String[] args) throws InvalidAtributeException {
		 //6907992501154     6921899990873
		 //String encode = BarcodeUtil.generateBarCode("6921899990873","0.5", "30",false);
		 String encode = BarcodeUtil.generateBarCode128("Y20161228155820520", "0.5", "30",true);
		 System.out.println(encode);
	}
}*/
