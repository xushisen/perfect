<%@ page language="java" import="java.util.*,com.xiaosen.controller.webSocket.WebChatSocket" pageEncoding="UTF-8" %>

<!DOCTYPE HTML>
<html>
  <head>
    
    <title>My JSP 'webSocket.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	 <a href="javascript:;" id="fa">sdsd</a>
  	 
     <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
     <script type="text/javascript">
        $(parent.window.document.body).find(".mask").remove();//取消遮罩层
        
     	var ws;
     	var url = "ws://localhost:8080/perfect/message";
     	var content = false;
     	
     	if(window.WebSocket || window.MozWebSocket){
     		printMsg("支持");
     	} else {
     		printMsg("不支持");
     	}
     	
     	/**
     	 * 打印消息
     	 */
     	function printMsg(msg,msgType){
     		$("body").append(msg+"<br />");
     	}
     	
     	if (content){
     		content = false;
     		ws.close();
     	} else {
			printMsg("正在加入,请稍后....."); 	
			ws = new WebSocket(url);
     	}
     	
     	//注册事件
     	ws.onopen = openWs;
     	ws.onmessage = msgWs;
     	ws.onclose = closeWs;
     	ws.onerror = errorWs;
     	
     	/**
     	 * 打开websocket
     	 */
     	function openWs(){
     		printMsg("成功进入.....");
     		ws.send("我哈哈哈哈哈");
     	};
     	
     	/**
     	 * 接收消息
     	 */
     	function msgWs(event){
     		printMsg(event.data);
     	}
     	
     	/**
     	 * 出错
     	 */
     	function errorWs(){
     		printMsg("进入出错.....");
     	}
     	
     	/**
     	 * 关闭
     	 */
     	function closeWs(){
     	
     	}
     	
     	 
        $("#fa").click(function (){
        	ws.send("卧槽你二大爷");
        });
     </script>
  </body>
</html>
