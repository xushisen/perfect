<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
	 <link rel="stylesheet" type="text/css" href="../css/date.css"/>
  </head>
  
  <body>
  <br /> <br /> <br />
  	 时间1<input type="text" id="sj" /><br />
  	 时间2<input type="text" id="sjj" /> 时间3<input type="text" id="sjjj" />
  	 <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
  	 <script type="text/javascript" src="../js/zidingyi/date.js"></script>
	 <script type="text/javascript">
		 $(parent.window.document.body).find(".mask").remove();//取消遮罩层
		 
		 $.date({"id":"sj"});
		 $.date({"id":"sjj"});
		 $.date({"id":"sjjj"});
	 </script>
  </body>
</html>
