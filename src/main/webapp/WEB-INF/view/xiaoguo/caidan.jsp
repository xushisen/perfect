<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
	<style type="text/css">
			*{margin:0px;padding:0px;}
			#menu{width:100px;background:#467CA2;height:500px;}
			#menu li{list-style:none;line-height:30px;text-align:center;}
			li{border-bottom:1px solid #31698E;}
			/**所有的ul隐藏*/
			#menu li ul{display:none}  
			/**第二个li的北京颜色*/
			#menu li > ul > li{background:#6096BA;}
			/**第三个li的北京颜色*/
			#menu li > ul > li > ul > li{background:#D5E6F0;}
			/**所以的li鼠标移动上去事件*/
			li:hover{cursor:pointer;}
			
			/**十字架开始*/
			.szj{width:10px;height:10px;position:relative;float:right;margin-top:10px;margin-right:10px;}
			.szj .h{height:10px;width:3px;background:#2B2B2B;position:absolute;left:5px;}
			.szj .w{height:3px;width:10px;background:#2B2B2B;position:absolute;top:4px;left:2px;}
			/**十字架结束*/
		</style>
  </head>
  
  <body>
  		<!-- <div class="szj">
  			<div class="h"></div>
  			<div class="w"></div>
  		</div> -->
		<ul id="menu">
			<li>家电
				<ul>
					<li>空调
						<ul>
							<li>海尔空调</li>
							<li>空调</li>
						</ul>
					</li>
					<li>电视
						<ul>
							<li>彩虹电视</li>
							<li>电视</li>
						</ul>
					</li>
					<li>洗衣机</li>
				</ul>
			</li>
			<li>
				学校
				<ul>
					<li>老师
						<ul>
							<li>张老师</li>
							<li>王老师</li>
						</ul>
					</li>
					<li>学生
						<ul>
							<li>张学生</li>
							<li>王学生</li>
						</ul>
					</li>
				</ul>
			</li>
	
	
	<%--js文件 --%>
	<script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../js/zidingyi/caidan.min.js"></script>
	
  </body>
</html>
