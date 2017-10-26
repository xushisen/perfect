package com.xiaosen.controller.webSocket;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.WsOutbound;



/**
 * 
 * 类描述：   建立连接发送消息
 * 创建人：ssxu  
 * 创建时间：2017-6-14 下午2:22:28   
 * @version  1.0
 *
 */
@SuppressWarnings("deprecation")
public class ChatMsgInBound extends MessageInbound {

	
	public ChatMsgInBound(HttpServletRequest request) {
	}
	/**
	 * 建立连接
	 */
	@Override
	protected void onOpen(WsOutbound outbound){
		ChatMsgInboundPool.getMsgList().add(this);  //像缓冲池加入对象
		super.onOpen(outbound);
	}
	
	/**
	 * 关闭连接
	 */
	@Override
	protected void onClose(int status){
		ChatMsgInboundPool.getMsgList().remove(this);  //移出缓冲池
		super.onClose(status);
	}
	
	@Override
	public int getReadTimeout() {
		return 0;
	}

	/**
	 * 二进制消息响应
	 */
	@Override
	protected void onBinaryMessage(ByteBuffer arg0) throws IOException {

	}

	/**
	 * 发送文本消息
	 */
	@Override
	protected void onTextMessage(CharBuffer charBuffer) throws IOException {
		for (MessageInbound ms : ChatMsgInboundPool.getMsgList()){
			CharBuffer cbBuffer = CharBuffer.wrap(charBuffer); //包装到缓冲区
			WsOutbound outbound = ms.getWsOutbound();//提供所有像客户端发送消息的方法  线程同步
			outbound.writeTextMessage(cbBuffer);
			outbound.flush();
		}
	}

}
