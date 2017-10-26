<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>  
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<meta name="keywords" content="perfect,特效,完美" />
<meta name="description" content="perfect,特效,完美" />
<title>让优秀变成一种习惯</title>
<link rel="stylesheet" type="text/css" href="css/zidingyi.css" /> 
<!--<link rel="stylesheet" type="text/css" href="<c:url value='/css/zidingyi.css'/>" />-->
<link rel="stylesheet" type="text/css" href="css/texiao.css" />

<style type="text/css">
*{margin:0;padding:0}html,body{height:100%}.jm{padding-top:10px;width:304px;height:200px;position:absolute;left:50%;top:50%;margin-left:-151px;margin-top:-100px;background:rgba(255,255,255,.3);border-radius:5px;}.jm p{height:40px;width:100%;margin-left:40px}.jm span{width:100%;height:40px;display:block;font-size:26px;color:#fff;text-align:center}.jm label{margin-left:40px;width:30px;height:30px;background:url("images/login.png");display:block;position:absolute;border-top-left-radius:10px;border-bottom-left-radius:10px}.jm .yh{top:10;left:0;background-position:-2px -4px}.jm .mm{top:90px;left:0;background-position:-50px -4px}.jm .text{width:220px;height:30px;outline:0;text-indent:3em;border-radius:10px;border:0;background:rgba(255,255,255,.7)}.jm .but{width:220px;height:30px;border:0;border-radius:10px;outline:0;margin-left:40px}.jm .but:hover{cursor:pointer;box-shadow:1px 1px black inset}.jm .text:focus{box-shadow:rgba(0,0,0,.3) 0 0 15px}.error{width:100%;height:50px;background:green;text-align:center;line-height:50px;color:#fff;position:absolute;top:0;animation:dh 1s alternate linear}@keyframes dh{from{height:0;line-height:0}to{height:50px;line-height:50px}}@keyframes mymove{0%{top:-200px}80%{top:55%}100%{top:50%}}@-webkit-keyframes mymove{0%{top:-200px}80%{top:55%}100%{top:50%}}
</style>
</head>

<body>
	<canvas id="myCanvas">您的浏览器out了</canvas>
	<div class="jm" id="jm">
		<form action="/servlet/login" id="loginForm" method="post">
			<span>Welcome</span>
			<p><label class="yh"></label><input type="text" name="userName" class="text" placeholder="用户名" /></p>
			<p><label class="mm"></label><input type="password" name="passWord" class="text" placeholder="用户密码" /></p><br />
			<input type="button" class="but" id="butLogin" value="登录" />
		</form>
	</div>
	<script type="text/javascript" src="js/jquery/jquery-1.9.1.min.js"></script>
	<!-- 下拉的校验 -->
	<script type="text/javascript" src="js/zidingyi/jiaoyan.js"></script>
	<!-- 弹出框js -->
	<script type="text/javascript" src="js/zidingyi/tcUtil.min.js"></script>
	<script type="text/javascript" src="js/util/util.min.js"></script>
	<!-- canvas js -->
	<script type="text/javascript" src="js/xitong/login.min.js"></script>
	<script type="text/javascript">
	$.dl();if(window!=top){top.location.href=location.href;}$(document).keydown(function(event){if(event.keyCode==13){login();}});$("#butLogin").click(function(){login();});document.getElementById("jm").style.animation="mymove 1s 1 ease-in-out forwards";$(".jm input:eq(0)").focus();function login(){var flag=$.voliad([{name:"userName",title:"用户名",required:true},{name:"passWord",title:"密码",letterOrNum:true,required:true}]);var time;if(flag){time=setInterval(dldh,300);$.ajax({url:getRootPath()+"/login",type:"post",data:$("#loginForm").serialize(),dataType:"text",success:function(data){if(data=="error"){$.ts({"width":"140px","height":"30px","color":"#fff","content":"用户名密码不正确","backgroundColor":"green","type":"Left","direction":"around","date":"5000"});$(".jm input[type='password']").val("");$(".jm input[name='password']").focus();clearInterval(time);$("#butLogin").val("登录");}else{clearInterval(time);window.location.href=getRootPath();}},error:function(){clearInterval(time);$.ts({"width":"140px","height":"30px","color":"#fff","content":"网络错误 请稍后重试","backgroundColor":"green","type":"Left","direction":"around","date":"5000"});}});}}$("body").append("<img style='display:none;' src='images/bj_1.png' width=100 height=100 alt='图片' />");$(window).resize(function(){$.dl();});function dldh(){var text=$("#butLogin").val();var textj=text.substring(text.length-3);var re=/[。.]/g;var n=0;if(re.test(textj)){n=textj.match(re).length;}if(n==0){$("#butLogin").val("登录中"+".");}else{if(n==1){$("#butLogin").val("登录中"+"..");}else{if(n==2){$("#butLogin").val("登录中"+"...");}else{if(n==3){$("#butLogin").val("登录中");}}}}};
	</script>
</body>
</html>
