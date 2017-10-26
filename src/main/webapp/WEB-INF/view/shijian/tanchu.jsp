<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tanchu.jsp' starting page</title>
    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
		.ddd{width:100px;height:100px;background:red;}
		.ddd a{color:#fff;}
	</style>
  </head>
  
  <body>
     <div class="ddd"><a href="javascript:;" onclick="dd()">我是另外一个页面1</a><br /><a href="javascript:;" onclick="ss()">我是另外一个页面2</a></div>
     
     <script type="text/javascript">
        function dd(){
        	alert("我是另外一个页面1");
        }
        function ss(){
        	alert("我是另外一个页面2");
        }
     </script>
  </body>
</html>
