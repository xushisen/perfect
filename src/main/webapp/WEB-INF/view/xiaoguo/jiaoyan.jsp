<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
	 <style type="text/css">
	 	*{margin:0px;padding:0px;}
	 	html,body{height:100%;}
	 	.bj{width:100%;height:100%;background:repeating-linear-gradient(45deg,#d2d2d2 10px,#b6b6b6 30px);animation:play 10s linear infinite;}
	 	.jm{width:304px;height:100px;position:absolute;left:0;top:0;right:0;bottom:0;margin:auto;}
	 	.jm p{height:36px;}
	 	.jm .text{width:220px;height:26px;outline:none;text-indent:0.5em;border-radius:2px;border:none;}
	 	.jm .but{width:220px;height:28px;float:right;margin-right:45px;border:none;border-radius:2px;}
	 	.jm .but:hover{cursor:pointer;box-shadow:1px 1px black inset;}
	 	
	 	.error{width:100%;height:50px;background:green;text-align:center;line-height:50px;color:#fff;position:absolute;top:0px;animation:dh 1s alternate linear;}
	 	
	 	@keyframes dh{
	 		from{height:0px;line-height:0px;}
  	 	 	to{height:50px;line-height:50px;}
	 	}
	 	
	 	@keyframes play{
			from{background-position:0 0;}
			to{background-position:1200px 0px;}
		}
	 </style>
  </head>
  
  <body>
      <div class="bj">
      	 <div class="jm">
      	 	<form action="" id="loginForm" method="post">
			 	<p><label>用户:</label><input type="text" name="user.username" class="text" placeholder="请输入用户名"/></p>
			 	<p><label>密码:</label><input type="password" name="user.password" class="text" placeholder="密码字母数字组成"/></p>
			 	<input type="button" class="but" id="butLogin" value="登录" />
		 	</form>
      	 </div>
      </div>
      <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
      <!-- 下拉的校验 -->
      <script type="text/javascript" src="../js/zidingyi/jiaoyan.js"></script>
      <!-- 在后面拼的校验 -->
      <script type="text/javascript" src="../js/zidingyi/houjy.js"></script>
      <script type="text/javascript">
     	 $(parent.window.document.body).find(".mask").remove();//取消遮罩层
     	 
		 $("#butLogin").click(function (){
			 var flag = $.voliad([
				 {name:"user.username",title:"用户名",required:true},
				 {name:"user.password",title:"密码",letterOrNum:true,required:true}
			 ]);
		
			/**var flag = $.voliadNext([   //往后拼的校验
				 {name:"user.username",title:"用户名",required:true},
				 {name:"user.password",title:"密码",required:true,letterOrNum:true}
			]);
			 
			alert(flag);*/
		 });
      </script> 
  </body>
</html>
