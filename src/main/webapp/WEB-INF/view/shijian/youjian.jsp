<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="../css/texiao.css" />
	<style type="text/css">
	    *{margin:0;padding:0}
		.mail{width:600px;height:400px;margin:80px auto;}
		.mail .m_tit{width:100%;height:50px;line-height:50px;}
		.mail .m_tit input[type="text"]{width:249px;height:25px;border:1px solid #222;outline:none;text-indent:10px;}
		.mail .m_tit input[type="button"]{width:249px;height:25px;outline:none;border:1px solid red;cursor:pointer;border-radius:5px;}
		.mail .m_tit input[type="button"]:hover{background:red;}
		.mail .m_con{line-height:300px;margin-top:20px;}
		.mail .m_con .con{width:468px;;height:300px;outline:none;border:1px solid #222;float:right;padding:10px 0 0 10px;}
	</style>
  </head>
  
  <body>
  	<div class="mail">
  		<form id="mailForm">
	  		<div class="m_tit">
	  			&emsp;接收人:&emsp;&emsp;&emsp;<input type="text" name="name" />
	  		</div>
	  		<div class="m_tit">
	  			&emsp;主&emsp;题:&emsp;&emsp;&emsp;<input type="text" name="zt" />
	  		</div>
	  		<div class="m_con">
	  			&emsp;<span>内&emsp;容:</span>&emsp;&emsp;&emsp;<textarea name="content" class="con"></textarea>
	  		</div>
	  		<div class="m_tit">
	  			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="button" onclick="fs()" value="发送邮件" />
	  		</div>
  		</form>
  	</div>
  	<script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../js/util/util.min.js"></script>
	<script type="text/javascript" src="../js/zidingyi/tcUtil.min.js"></script>
  	<script type="text/javascript">
  		$(parent.window.document.body).find(".mask").remove();//取消遮罩层
  		
  		function fs(){
  			//打开遮罩
  			$.jzjd();  //打开遮罩
  			$.ajax({
				 url:getRootPath()+"/servlet/mail",
				 type:"post",
				 data:$("#mailForm").serialize(),
				 dataType:"text",
				 success:function(data){
					$("body").find(".mask").remove();//取消遮罩层
					if(data == "success"){
						 $.ts({"width":"140px","height":"30px","color":"#fff","content":"发送成功","backgroundColor":"green","type":"Left","direction":"around","date":"5000"});
					 }else{
						 $.ts({"width":"140px","height":"30px","color":"#fff","content":"发送失败","backgroundColor":"green","type":"Left","direction":"around","date":"5000"});
					 }
				 },
				 error:function (){
					$("body").find(".mask").remove();//取消遮罩层
					$.ts({"width":"140px","height":"30px","color":"#fff","content":"网络错误 请稍后重试","backgroundColor":"green","type":"Left","direction":"around","date":"5000"});
				 }
			 });
  		}
  	</script>
  </body>
</html>
