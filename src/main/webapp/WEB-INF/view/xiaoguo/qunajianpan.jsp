<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
	  	<meta name="keywords" content="搜索"/>
		<meta name="description" content="描述"/>
		<title>全键盘</title>
 	    <%--css公共文件 --%>
		<link rel="stylesheet" type="text/css" href="../css/zidingyi.css"/>
  </head>
  
  <body>
    <p>回车键自动聚焦到下一个文本框</p>
  	<input type="text" id="da" value=""/>
  	<input type="text" id="ds" value=""/>
  	<input type="text" id="dd" value=""/>
  	<input type="text" id="dq" value=""/>
  	<input type="text" id="dz" value=""/>
  	<input type="text" id="dc" value=""/>
  	<select id="de"><option>--请选--</option><option>是</option></select>
	<%--js文件 --%>
	<script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../js/zidingyi/quanjianpan.min.js"></script>
	<script type="text/javascript">
		$(parent.window.document.body).find(".mask").remove();//取消遮罩层
	</script>
  </body>
</html>
