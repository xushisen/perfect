package com.xiaosen.controller.webSocket;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.websocket.StreamInbound;

/**
 * 
 * 类描述：   客户端连接服务器
 * 创建人：ssxu  
 * 创建时间：2017-6-14 下午2:21:28   
 * @version  1.0
 *
 */
@SuppressWarnings("deprecation")
@WebServlet(urlPatterns = {"/message"})
public class WebChatSocket extends org.apache.catalina.websocket.WebSocketServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected StreamInbound createWebSocketInbound(String arg0,
			HttpServletRequest arg1) {
		// TODO Auto-generated method stub
		return new ChatMsgInBound(arg1);
	}
	
}
