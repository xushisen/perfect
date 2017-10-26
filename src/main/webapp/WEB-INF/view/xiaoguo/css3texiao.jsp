<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
  	 <link rel="stylesheet" type="text/css" href="../css/texiao.css" />
  </head>
  
  <body>
     <a class="jdt" href="#" onclick="jdt()">显示进度条</a><br />
     <a class="jdt" href="#" onclick="tsk('Top')">从上提示框</a><br />
     <a class="jdt" href="#" onclick="tsk('Bottom')">从下提示框</a><br />
     <a class="jdt" href="#" onclick="tsk('Left')">从左提示框</a><br />
     <a class="jdt" href="#" onclick="tsk('Right')">从右提示框</a><br />
     <a class="jdt" href="#" onclick="tsks()">从中间出来的提示框</a><br /><br />
      
      <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	  <!-- 弹出框js -->
	  <script type="text/javascript" src="../js/zidingyi/tcUtil.min.js"></script>
      <script type="text/javascript">
     	 $(parent.window.document.body).find(".mask").remove();//取消遮罩层
      	 function jdt(){
      		 $.jzjd();
      	 	 setTimeout(function(){$(".mask").remove();},2000);
      	 }
      	 function tsk(type){
      		 $.ts({"width":"140px","height":"30px","color":"#fff","content":"我是从四周出来的","backgroundColor":"green","type":type,"direction":"around","date":"5000"});
      	 }
      	 function tsks(){
      		 $.ts({"width":"140px","height":"30px","color":"#fff","content":"我是从中间出来的","backgroundColor":"red","type":"","direction":"among","date":"5000"});
      	 }
      </script>
  </body>
</html>
