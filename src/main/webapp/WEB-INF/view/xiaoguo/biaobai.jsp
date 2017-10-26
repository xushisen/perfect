<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
	  <style type="text/css">
			.{margin:0px;padding:0px;}
			 body{background:url('../images/bg1.jpg');background-size:100% 100%;}
			.top{width:300px;height:40px;margin:50px auto;line-height:40px;animation:color 3s linear infinite;}
			.box{width:300px;height:300px;margin:0px auto;perspective:800px;}
			.box .pic{width:240px;height:240px;position:relative;transform-style:preserve-3d;animation:zhuan 10s linear infinite;}
			.box .pic ul{list-style:none;}
			.box .pic ul li{position:absolute;top:0px;left:0px;transform:rotateY(0deg);}
			
			.text{width:400px;height:180px;background:pink;margin:0px auto;font-family:"微软雅黑";font-size:14px;animation:color 5s linear infinite;}
			
			@keyframes color{
				0%{color:red;}
				50%{color:green;}
				100%{color:yellow;}
			}
			@keyframes zhuan{
				from{transform:rotateY(0deg);}
				to{transform:rotateY(360deg);}
			}
			
		</style>
  </head>
  
  <body>
      <div class="top"><marquee behavior="alternate">myLove</marquee></div>
	<div class="box">
		<div class="pic">
			<ul>
				<li><img src="../images/1.png" /></li>
				<li><img src="../images/2.png" /></li>
				<li><img src="../images/3.png" /></li>
				<li><img src="../images/4.png" /></li>
				<li><img src="../images/5.png" /></li>
				<li><img src="../images/6.png" /></li>
			</ul>
		</div>
	</div>
	<div class="text">
		
	</div>
	
	<script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		
		$(function (){
			$(parent.window.document.body).find(".mask").remove();//取消遮罩层
			
			$(".pic ul li").each(function (i){
				var deg = 360/$(".pic ul li").size();
				$(this).css({"transform":"rotateY("+i*deg+"deg) translateZ(216px)"});
			});
			
			var zi = ["我只有会在做一件事的时候想起你,那就是呼吸"];
			var str = zi.join(),i=0,arr = str.split("");
			var ms_stop = setInterval(function (){
				if(i>arr.length-1){
					i=0;
					$(".text").html('');
				}
				$(".text").html($(".text").html()+arr[i]);
				i++;
			},500);
			
			//var img = ["1","2","3","4"];
			
			var readomImg = function readom(){
				return Math.floor(Math.random()*4);
			};
			
			setInterval(function (){
				$("body").css("background","url('../images/bg"+readomImg()+".jpg')").css("background-size","100% 100%");
			},5000);
		});
		
	</script>
  </body>
</html>
