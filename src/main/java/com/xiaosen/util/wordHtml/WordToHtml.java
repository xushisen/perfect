package com.xiaosen.util.wordHtml;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xwpf.converter.core.BasicURIResolver;
import org.apache.poi.xwpf.converter.core.FileImageExtractor;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.w3c.dom.Document;

/**
 * 类描述： wold 转 html 
 * 创建人：ssxu 
 * 创建时间：2017-7-17 上午10:31:46
 * 
 * @version 1.0
 * 
 */
public class WordToHtml {

	// doc转换为html
	public static void docToHtml() throws Exception {
		String sourceFileName = "F:\\dochtml\\doc\\1.doc";
		String targetFileName = "F:\\dochtml\\html\\1.html";
		final String imagePathStr = "F:\\dochtml\\image\\";
		HWPFDocument wordDocument = new HWPFDocument(new FileInputStream(
				sourceFileName));
		Document document = DocumentBuilderFactory.newInstance()
				.newDocumentBuilder().newDocument();
		WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter(
				document);
		// 设置图片存放的位置
		wordToHtmlConverter.setPicturesManager(new PicturesManager() {
			public String savePicture(byte[] content, PictureType pictureType,
					String suggestedName, float widthInches, float heightInches) {
				File imgPath = new File(imagePathStr);
				if (!imgPath.exists()) {// 图片目录不存在则创建
					imgPath.mkdirs();
				}
				File file = new File(imagePathStr + suggestedName);
				try {
					OutputStream os = new FileOutputStream(file);
					os.write(content);
					os.close();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				// 图片在html文件上的路径 相对路径
				return "../image/" + suggestedName;
			}
		});

		wordToHtmlConverter.processDocument(wordDocument);
		Document htmlDocument = wordToHtmlConverter.getDocument();
		DOMSource domSource = new DOMSource(htmlDocument);
		StreamResult streamResult = new StreamResult(new File(targetFileName));

		TransformerFactory tf = TransformerFactory.newInstance();
		Transformer serializer = tf.newTransformer();
		serializer.setOutputProperty(OutputKeys.ENCODING, "utf-8");
		serializer.setOutputProperty(OutputKeys.INDENT, "yes");
		serializer.setOutputProperty(OutputKeys.METHOD, "html");
		serializer.transform(domSource, streamResult);
	}

	// docx转换为html
	public static void docxToHtml() throws Exception {
		String sourceFileName = "D:\\dd\\s.docx";
		String targetFileName = "D:\\dd\\test.html";
		String imagePathStr = "D:\\dd\\image\\";
		OutputStreamWriter outputStreamWriter = null;
		try {
			XWPFDocument document = new XWPFDocument(new FileInputStream(
					sourceFileName));
			XHTMLOptions options = XHTMLOptions.create();
			// 存放图片的文件夹
			options.setExtractor(new FileImageExtractor(new File(imagePathStr)));
			// html中图片的路径
			options.URIResolver(new BasicURIResolver("image"));
			outputStreamWriter = new OutputStreamWriter(new FileOutputStream(
					targetFileName), "utf-8");
			XHTMLConverter xhtmlConverter = (XHTMLConverter) XHTMLConverter
					.getInstance();
			xhtmlConverter.convert(document, outputStreamWriter, options);
		} finally {
			if (outputStreamWriter != null) {
				outputStreamWriter.close();
			}
		}
	}
	
	
	public static void main(String[] args) {
		try {
			//docToHtml();  //doc转html
			/**DocToHtml d = new DocToHtml();
			d.htmlToWord2();  //html转doc*/
			docxToHtml();
			//Word2007ToHtml("D:\\dd\\","s",".docx");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * html转wold
	 * 
	 * @throws Exception
	 */
	public void htmlToWord2() throws Exception {
		InputStream bodyIs = new FileInputStream("f:\\dochtml\\html\\1.html");
		InputStream cssIs = new FileInputStream("f:\\dochtml\\html\\1.css");
		String body = this.getContent(bodyIs);
		String css = this.getContent(cssIs);
		// 拼一个标准的HTML格式文档
		String content = "<html><head><style>" + css + "</style></head><body>"
				+ body + "</body></html>";
		InputStream is = new ByteArrayInputStream(content.getBytes("utf-8"));
		OutputStream os = new FileOutputStream("f:\\dochtml\\doc\\2.doc");
		this.inputStreamToWord(is, os);
	}

	/**
	 * 把is写入到对应的word输出流os中 不考虑异常的捕获，直接抛出
	 * 
	 * @param is
	 * @param os
	 * @throws IOException
	 */
	private void inputStreamToWord(InputStream is, OutputStream os)
			throws IOException {
		POIFSFileSystem fs = new POIFSFileSystem();
		// 对应于org.apache.poi.hdf.extractor.WordDocument
		fs.createDocument(is, "WordDocument");
		fs.writeFilesystem(os);
		os.close();
		is.close();
	}

	/**
	 * 把输入流里面的内容以UTF-8编码当文本取出。 不考虑异常，直接抛出
	 * 
	 * @param ises
	 * @return
	 * @throws IOException
	 */
	private String getContent(InputStream... ises) throws IOException {
		if (ises != null) {
			StringBuilder result = new StringBuilder();
			BufferedReader br;
			String line;
			for (InputStream is : ises) {
				br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
				while ((line = br.readLine()) != null) {
					result.append(line);
				}
			}
			return result.toString();
		}
		return null;
	}
}
