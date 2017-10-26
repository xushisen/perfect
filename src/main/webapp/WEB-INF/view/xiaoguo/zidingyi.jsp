<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/zidingyi.tld" prefix="ding"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
	<style type="text/css">
		.page{display:inline-block;height:50px;}
		.page ul li{list-style:none;float:left;margin:0px 2px;padding:0px 8px;border:1px solid #B2E05D;border-radius:3px;font-size:14px;font-family:"微软雅黑";color:#88AF3F;}
		.page ul li:hover{cursor:pointer;color:#fff;background:#88AF3F;}
		.page .bg{color:#fff;background:#88AF3F;}
	</style>
</head>
  <body>
  	  <p style="font-size:20px;-webkit-text-stroke:1px red;color:#fff;font-weight:900;">为了看到效果  默认显示第7页 总共300条数据  每页15条数据</p>
  	  <form action="<c:url value="/list"/>" method="post" >
  	  	  <input type="hidden" value="" id="pagebegin" name="pagebegin" >
  	  </form>
	  <ding:page count="300" page="1" pagesize="200">标签体的内容</ding:page>
	     标签后的内容
  </body>
  <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
  <script type="text/javascript">
  	 $(parent.window.document.body).find(".mask").remove();//取消遮罩层
  </script>
</html>
