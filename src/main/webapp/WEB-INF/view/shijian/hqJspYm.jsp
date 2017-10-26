<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
  <head>
    
    <title>My JSP 'hqJspYm.jsp' starting page</title>
    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<style type="text/css">
	    *{margin:0;padding:0}
	    html,body{height:100%;}
	    /**弹出内容层开始*/
		.popup{width:400px;height:400px;box-shadow:0 0 10px 1px black;position:absolute;top:0;bottom:0;right:0;left:0;margin:auto;}
		.popup .popup-title{width:100%;height:35px;background:#F0F;line-height:35px;}
		.popup .popup-title .title-left{width:75%;height:100%;margin-left:10px;font-size:16px;font-family:"微软雅黑";color:#eee;float:left;}
		.popup .popup-title .title-right{width:15px;height:15px;float:right;margin:10px 20px 0 0;border-radius:15px;text-align:center;line-height:17px;}
		.popup .popup-title .title-right:hover{background:red;cursor:pointer;}
		.popup .popup-content{width:100%;height:365px;background:#fff;}
		.popup .popup-content iframe{width:100%;height:100%;border:none;}
		/**弹出内容层结束*/
		/**遮罩层*/
		.zhezhao{width:100%;height:100%;position:fixed;top:0px;filter:alpha(opacity=60);background-color:#777;left:0px;opacity:0.5;-moz-opacity:0.5;}
	</style>
  </head>
  	 <p>弹出层里面是的内容是个jsp页面</p>
     <a href="#" onclick="tcContent()">获取</a>
     <!-- 遮罩层 
     <div class="zhezhao"></div>-->
     <!-- 弹出内容层开始
     <div class="popup">
     	<div class="popup-title">
     		<div class="title-left">标题,内容</div>
     		<div class="title-right">×</div>
     	</div>
     	<div class="popup-content"></div>
     </div>
      <!-- 弹出内容层开始 -->
  <body>
     
     <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	 <script type="text/javascript" src="../js/zidingyi/alert.min.js"></script>
	 <script type="text/javascript" src="<c:url value="/js/util/util.min.js"/>"></script>
     <script type="text/javascript">
     $(parent.window.document.body).find(".mask").remove();//取消遮罩层
     
     function tcContent(){
	     $.tContent({
	    	    title:"标题",
				width:"700",
				height:"450",   //true 需要跳出ifame封住全屏
				url:getRootPath()+"/shijian/yzm"
			});
     }
     
     /**
     
     var tcContentDiv = "<div class=\"zhezhao\"></div>"+
	     				"<div class=\"popup\">"+
	     				"	<div class=\"popup-title\">"+
	     				"		<div class=\"title-left\">标题,内容</div>"+
	     				"		<div class=\"title-right\" id=\"sen\">×</div>"+
	     				"	</div>"+
	     				"	<div class=\"popup-content\"><iframe></iframe></div>"+
	     				"</div>";
     
	   function tcContent(url){
		   $("body").append(tcContentDiv);
		   $(".popup .popup-content iframe").attr("src",url);
		   /**叉号取消div
		   $(".popup .popup-title .title-right").click(function (){
		       $("body").find(".zhezhao,.popup").remove();
		   });
	   }  				
	    
	     				
	  /**拿到jsp页面的内容 然后经过处理放到popup-content里面 
     function huoqu(url){
    	 	$("body").append(tcContentDiv);
    		//建立一个XMLHttpRequest请求
    		var request = new XMLHttpRequest();
    		//配置, url为要获取网页的地址
    		request.open('GET', url, true);
    		//因为我们需要的源码是纯文本形式的，所以设置返回类型为文本
    		request.responseType = 'text';
    		//一旦请求成功，但得到了想要的数据了
    		request.onload = function() {
    			//这里获得网页的内容
    			var lyric = request.response;
    			//输出内容
    			var styleStart = lyric.indexOf("<style type=\"text/css\">");
    			var styleEnd = lyric.indexOf("</style>");
    			var bodyStart = lyric.indexOf("<body>");
    			var bodyEnd = lyric.indexOf("</body>");
    			var scriptStart = lyric.indexOf("<script>");
    			var scriptEnd = lyric.indexOf("/"+"<script>");
    			var style = lyric.substring(styleStart,(styleEnd+8));
    			var body = lyric.substring(bodyStart,(bodyEnd+7));
    			var scirpt = lyric.substring(scriptStart,(scriptEnd+9));
				//添加到弹出层的内容的div里面    			
    			$(".popup .popup-content").append(style+body+scirpt);
				
    		    /**叉号取消div
    		    $(".popup .popup-title .title-right").click(function (){
    		    	$("body").find(".zhezhao,.popup").remove();
    		    });
    		};
    		//向服务器发送请求
    		request.send();
    	} 
     */
     </script>
  </body>
</html>
