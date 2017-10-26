<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'xlkjs.jsp' starting page</title>
    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<style type="text/css">
		*{margin:0;padding:0}
		/**下拉框的样式start*/
		.gg{width:150px;position:relative;}
		.gg input{width:100%;height:30px;outline:none;border:1px solid green;text-indent:10px;}
		.gg ul{display:none;border-top:1px solid #d2d2d2;border-left:1px solid #d2d2d2;border-right:1px solid #d2d2d2;max-height:300px;background:#eee;overflow:auto;position:absolute;top:30px;left:0;width:100%;z-index:1;}
		.gg ul li{width:100%;height:30px;text-align:center;line-height:30px;border-bottom:1px solid #d2d2d2;}
		.gg ul li:hover{background:#d2d2d2;cursor:pointer;}
		/**下拉框的样式end*/
	</style>
  </head>
  
  <body>
  	  根据输入的文字 字段检索出对应的数据  然后点击选择  如果有值  默认就会显示对应的那个文本<br />
     <div class="gg xiala">
     	<input type="hidden" name="duixiang.shuxing" value=""/>
     	<input type="text" />
     	<ul>
     		<li data-val="zhongguo">中国</li>
	        <li data-val="zhongshi">中式</li>
	        <li data-val="waiguo">外国</li>
	        <li data-val="waishi">外市</li>
	        <li data-val="zhongdian">重点</li>
	        <li data-val="waidian">外电</li>
	        <li data-val="woshi">我是</li>
	        <li data-val="xushisen">徐石森</li>
	        <li data-val="zhenghao">郑浩</li>
	        <li data-val="lishuze">李树泽</li>
	        <li data-val="liuzhuangzhuang">刘壮壮</li>
	        <li data-val="lijianheng">李建恒</li>
	        <li data-val="zhongguo">中国1</li>
	        <li data-val="zhongshi">中式1</li>
	        <li data-val="waiguo">外国1</li>
	        <li data-val="waishi">外市1</li>
	        <li data-val="zhongdian">重点1</li>
	        <li data-val="waidian">外电1</li>
	        <li data-val="woshi">我是1</li>
	        <li data-val="xushisen">徐石森1</li>
	        <li data-val="zhenghao">郑浩1</li>
	        <li data-val="lishuze">李树泽1</li>
	        <li data-val="liuzhuangzhuang">刘壮壮1</li>
	        <li data-val="lijianheng">李建恒1</li>
     	</ul>
     </div>
     
     <div class="gg xiala1">
     	<input type="hidden" name="duixiang.shuxing" value="wxy"/>
     	<input type="text" />
     	<ul>
     		<li data-val="zll">张亮亮</li>
	        <li data-val="xss">徐石森</li>
	        <li data-val="zh">邹红</li>
	        <li data-val="ymq">余民钱</li>
	        <li data-val="zh">郑浩</li>
	        <li data-val="lzz">刘壮壮</li>
	        <li data-val="wxy">王雪瑶</li>
	        <li data-val="ljh">李建恒</li>
	        <li data-val="xq">徐琼</li>
	        <li data-val="gzj">高紫娟</li>
	        <li data-val="yhc">杨汇春</li>
	        <li data-val="zhr">赵海瑞</li>
	        <li data-val="yy">杨洋</li>
     	</ul>
     </div>
     <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
      <script type="text/javascript" src="../js/shijian/xlkjs.js"></script>
     <script type="text/javascript">
     $.xlkjs({"div":"xiala"});
     $.xlkjs({"div":"xiala1"});
     </script>
  </body>
</html>
