<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 		<meta name="keywords" content="搜索"/>
		<meta name="description" content="描述"/>
		<title>下拉框</title>
 	    <%--css公共文件 --%>
		<link rel="stylesheet" type="text/css" href="../css/zidingyi.css"/>
		
  </head>
  
  <body>
    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="sou"/>
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="sous"/>
	<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="souss"/>
	<%--js文件 --%>
	<script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../js/zidingyi/inputXl.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(parent.window.document.body).find(".mask").remove();//取消遮罩层
			//调用select自动拼下拉框
			$.setApDiv("sous");
			$.setApDiv("sou");
			$.setApDiv("souss");
		});
	</script>
  </body>
</html>
