package com.xiaosen.controller.email;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 类描述： 发送邮件
 *   
 * 创建人：ssxu  
 * 创建时间：2016-12-4 上午11:25:25   
 * 版本 1.0.0
 *
 */
@Controller
@RequestMapping("/email")
public class Mail{

	@RequestMapping("/sendEmail")
	public void sendEmail(HttpServletRequest req, HttpServletResponse res){
		try {
			//设置编码
			req.setCharacterEncoding("utf-8");
			res.setContentType("text/html;charset=utf-8");
			
			String name = req.getParameter("name");  //收件人
			String zt = req.getParameter("zt");  //主题
			String content = req.getParameter("content");  //内容
			
			//设置用户名 密码
			String username = "m15229323003@163.com";
			String password = "Xs091202";  //邮箱的独立密码  也就是开启pop3服务时设置的  原先密码 Xs940224
			
			//设置配置文件
			Properties pro = new Properties();
			pro.put("mail.transport.protocol", "smtp");  //传输协议
			pro.put("mail.host", "smtp.163.com");
			pro.put("mail.smtp.auth", "true");
			
			Session session = Session.getInstance(pro);
			//创建一个邮件
			MimeMessage me = new MimeMessage(session);
			//设置自定义发件人昵称  
	        String nick="";
	        try {  
	            nick=javax.mail.internet.MimeUtility.encodeText("徐石森");  
	        } catch (UnsupportedEncodingException e) {  
	            e.printStackTrace();  
	        }   
			Address address = new InternetAddress(nick+" <"+username+">");
			//设置邮件来源
			me.setFrom(address);
			//接收者
			me.setRecipients(Message.RecipientType.TO, name);
			me.setSubject(zt); //主题
			//me.setText(content);  //内容 文本形式发送
			
			//邮件发送附件开始
			// 创建邮件的各个 MimeBodyPart 部分  
	        /**MimeBodyPart attachment01 = createAttachment("F:\\java\\Snake.java");  
	        MimeBodyPart attachment02 = createAttachment("F:\\java\\meng.mp3");  
	        MimeBodyPart contents = createContent(content, "F:\\java\\logo.jpg");
	        
	        // 将邮件中各个部分组合到一个"mixed"型的 MimeMultipart 对象  
	        MimeMultipart allPart = new MimeMultipart("mixed");  
	        allPart.addBodyPart(attachment01);  
	        allPart.addBodyPart(attachment02);  
	        allPart.addBodyPart(contents);  
	        
	        // 将上面混合型的 MimeMultipart 对象作为邮件内容并保存  
	        me.setContent(allPart);*/
			//邮件发送附件结束
			me.setContent(content,"text/html;charset=UTF-8");  //html形式发送
			me.saveChanges(); //保存
			
			//创建一个发送工具
			Transport ts = session.getTransport();
			ts.connect(username, password);  //绑定用户名  密码
			ts.sendMessage(me, me.getAllRecipients());  //邮箱所有的接受者
			ts.close();
			
			//验证是否发送成功
			PrintWriter pw = res.getWriter();
			pw.print("success");
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 /**  
     * 根据传入的文件路径创建附件并返回  
     */ 
    public MimeBodyPart createAttachment(String fileName) throws Exception {  
        MimeBodyPart attachmentPart = new MimeBodyPart();  
        FileDataSource fds = new FileDataSource(fileName);  
        attachmentPart.setDataHandler(new DataHandler(fds));  
        attachmentPart.setFileName(fds.getName());  
        return attachmentPart;  
    }  
    /**  
     * 根据传入的邮件正文body和文件路径创建图文并茂的正文部分  
     */ 
    public MimeBodyPart createContent(String body, String fileName)  
            throws Exception {  
        // 用于保存最终正文部分  
        MimeBodyPart contentBody = new MimeBodyPart();  
        // 用于组合文本和图片，"related"型的MimeMultipart对象  
        MimeMultipart contentMulti = new MimeMultipart("related");  
 
        // 正文的文本部分  
        MimeBodyPart textBody = new MimeBodyPart();  
        textBody.setContent(body, "text/html;charset=gbk");  
        contentMulti.addBodyPart(textBody);  
 
        // 正文的图片部分  
        MimeBodyPart jpgBody = new MimeBodyPart();  
        FileDataSource fds = new FileDataSource(fileName);  
        jpgBody.setDataHandler(new DataHandler(fds));  
        jpgBody.setContentID("logo_jpg");  
        contentMulti.addBodyPart(jpgBody);  
 
        // 将上面"related"型的 MimeMultipart 对象作为邮件的正文  
        contentBody.setContent(contentMulti);  
        return contentBody;  
    }  
}
