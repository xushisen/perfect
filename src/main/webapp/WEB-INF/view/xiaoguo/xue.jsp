<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>My JSP 'xue.jsp' starting page</title>
  
    <style type="text/css">
    	*{padding:0px;margin:0px;}
    	body{background:url('https://ss1.bdstatic.com/lvoZeXSm1A5BphGlnYG/skin/412.jpg?2');background-size:cover;overflow:hidden;}
    </style>

  </head>
  
  <body>
  	 <canvas id="myCanvas" style="border:1px solid #d3d3d3;"></canvas>
	  <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	  <script type="text/javascript" src="../js/zidingyi/xue.js"></script>
	  <script type="text/javascript">
	  	$(parent.window.document.body).find(".mask").remove();//取消遮罩层
	  	
	  	$.xue({"num":"50","color":"yellow"});
	  </script>
  </body>
</html>
