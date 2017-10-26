package com.xiaosen.controller.webSocket;

import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.websocket.MessageInbound;

/**
 * 
 * 类描述：   当前聊天的人数
 * 创建人：ssxu  
 * 创建时间：2017-6-14 下午2:19:56   
 * @version  1.0
 *
 */
@SuppressWarnings("deprecation")
public class ChatMsgInboundPool {

	//创建一个集合
	private static List<MessageInbound> msglit = new ArrayList<MessageInbound>();
	
	public static List<MessageInbound> getMsgList(){
		return msglit;
	}
} 
