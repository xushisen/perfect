<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
  	 <style type="text/css">
  	    body{font-size:12px;font-family:"微软雅黑";color:#eee;}
  	    /**验证码开始*/
  	 	.image{width:150px;}
  	 	.image a{display:block;width:50px;height:20px;background:rgba(122,142,22,1);text-align:center;line-height:20px;color:#fff;text-decoration:none;float:right;}
  	 	/**验证码结束*/
  	 	
  	 	/**图片banner开始*/
  	 	.banner{width:1100px;height:489px;margin:20px auto;position:relative;}
  	 	.banner .banner_img ul li{list-style:none;position:absolute;top:0;left:0;}
  	 	.banner .banner_bot ul{position:absolute;bottom:10px;left:45%;}
  	 	.banner .banner_bot ul li{list-style:none;width:30px;height:8px;background:rgba(0,0,0,.5);margin:5px;float:left;}
  	 	.banner .banner_bot ul li:hover{cursor:pointer;}
  	 	
  	 	.banner .index_left_nav{width:225px;height:100%;position:absolute;left:0;top:0;background:rgba(56,56,56,.8)}
  	 	.banner .index_left_nav ul{list-style:none;}
  	 	.banner .index_left_nav ul>li{line-height:40px;font-size:14px;margin-left:-40px;}
  	 	.banner .index_left_nav .sen ul>li:hover{cursor:pointer;background:#585D64;}
  	 	.banner .index_left_nav ul>li a{color:#fff;text-decoration:none;}
  	 	.banner .index_left_nav ul>li .ico{width:18px;height:18px;display:block;background:url('../images/duozhong.png');margin:11px -8px 0 15px;float:left;background-position:0 -195px;}
  	 	.banner .index_left_nav ul>li .ico2{background-position:-167px -195px;}
  	 	.banner .index_left_nav ul>li span{margin-left:25px;}
  	 	.banner .index_left_nav ul>li .jian{width:10px;height:10px;display:block;float:right;background:url('../images/duozhong.png');background-position:-47px 0px;margin:16px 30px 0 0}
  	 	
  	 	.index_left_nav .xiang{width:200px;height:489px;background:#fff;position:absolute;left:225px;top:0px;box-shadow:0 0 2px #505050;}
  	 	.index_left_nav .xiang ul li{text-align:center;}
  	 	.index_left_nav .xiang ul li a{color:#505050;}
  	 	.index_left_nav .xiang ul li a:hover{color:red;}
  	 	
  	 	.banner .banner_buttom{width:30px;height:50px;position:absolute;top:45%;}
  	 	.banner .banner_buttom i{width:20px;height:25px;display:block;background:url('../images/duozhong.png');}
  	 	.banner .banner_left_buttom{left:230px;}
  	 	.banner .banner_right_buttom{right:30px;}
  	 	.banner .banner_left_buttom .buttom_left{margin:11px auto;background-position:-67px 0px;}
  	 	.banner .banner_right_buttom .buttom_right{margin:11px auto;background-position:-87px 0px;}
  	 	.banner .banner_buttom:hover{background:#434649;}
  	 	/**图片banner结束*/
  	 </style>
  </head>
  
  <body>
  	 <!-- 虚拟路径的写法 <img src="/test/1.jpg" width="100" height="100" alt="图片" /> -->
  	 
  	 <!-- 验证码开始 -->
  	 <div class="image">
     	<img id="image" alt="验证码" src="<%=basePath%>servlet/image">&nbsp<a href="javascript:;" onclick="relesh()">换一张</a>
  	 </div>
  	 <!-- 验证码结束 -->
  	 
  	 <!-- 图片banner开始 -->
  	 <div class="banner">
  	 	<!-- 图片切换部分开始 -->
  	 	<div class="banner_img">
	  	 	<ul>
	  	 		<li>
	  	 			<a href="javascript:;"><img src="../images/tz_1.jpg" width="1100" height="489" src="谭洲教育" /></a>
	  	 		</li>
	  	 		<li>
	  	 			<a href="javascript:;"><img src="../images/tz_2.jpg" width="1100" height="489" src="谭洲教育" /></a>
	  	 		</li>
	  	 		<li>
	  	 			<a href="javascript:;"><img src="../images/tz_3.jpg" width="1100" height="489" src="谭洲教育" /></a>
	  	 		</li>
	  	 		<li>
	  	 			<a href="javascript:;"><img src="../images/tz_4.jpg" width="1100" height="489" src="谭洲教育" /></a>
	  	 		</li>
	  	 	</ul>
  	 	</div>
  	 	<!-- 图片切换部分结束 -->
  	 	<!-- 按钮部分开始 -->
  	 	<div class="banner_bot">
  	 		<ul>
  	 			<li></li>
  	 			<li></li>
  	 			<li></li>
  	 			<li></li>
  	 		</ul>
  	 	</div>
  	 	<!-- 按钮部分结束-->
  	 	<!-- 菜单部分开始 -->
  	 	<div class="index_left_nav">
  	 		<div class="sen">
	  	 		<ul>
	  	 			<li>
	  	 				<a href="javascript:;">
	  	 					<i class="ico"></i>
	  	 					<span>软件培训</span>
	  	 					<i class="jian"></i>
	  	 				</a>
	  	 			</li>
	  	 			<li>
	  	 				<a href="javascript:;">
	  	 					<i class="ico ico2"></i>
	  	 					<span>视觉设计</span>
	  	 					<i class="jian"></i>
	  	 				</a>
	  	 			</li>
	  	 		</ul>
  	 		</div>
  	 		<div class="xiang">
				<ul>
					<li><a href="http://www.baidu.com">java</a></li>
					<li><a href="http://www.baidu.com">web前端</a></li>
					<li><a href="http://www.baidu.com">安卓</a></li>
				</ul>
				<ul>
					<li><a href="http://www.baidu.com">平面设计</a></li>
					<li><a href="http://www.baidu.com">网页设计</a></li>
					<li><a href="http://www.baidu.com">电视设计</a></li>
				</ul>
			</div>
		</div>
  	 	<!-- 菜单部分结束 -->
  	 	<!-- 菜单左右切换按钮开始 -->
  	 	<a href="javascript:;" class="banner_buttom banner_left_buttom">
  	 		<i class="buttom_left"></i>
  	 	</a>
  	 	<a href="javascript:;" class="banner_buttom banner_right_buttom">
  	 		<i class="buttom_right"></i>
  	 	</a>
  	 	<!-- 菜单左右切换按钮结束 -->
  	 </div>
  	 <!-- 图片banner结束-->
	<script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
	 $(parent.window.document.body).find(".mask").remove();//取消遮罩层
	
 	 /**图片切换 start*/
	 $(".banner .banner_img ul li:gt(0)").css({"display":"none"});
	 $(".banner .banner_bot ul li:eq(0)").css({"background":"#fff"});
	 
	 $(".index_left_nav .xiang").hide();
	 $(".index_left_nav .xiang ul").hide();
	 
	 var length = $(".banner .banner_img ul li").length;  /**图片的数量  用于计算要显示图片的索引是否超过length*/
	 
	 /**处理图片和button定时*/
	 function imgButton(){
		 var index = 0;
	 	 $(".banner .banner_img ul li").each(function (){
			 var hidden = $(this).is(":hidden");
			 if(hidden == false){
				 index = $(this).index();
			 }
		  });
	 	 hiddenImg(index,true);
	 }
	 
	 /**根据传入的index 去对图片和button做相应的操作  true下一张 false当前index对应的图片和button的索引*/
	 function hiddenImg(index,flag){
	 	 if(flag){
	 		 index = index+1;
		 	 index = index == length ? 0 : index;
	 	 }
		 //隐藏所有的图片
		 //$(".banner .banner_img ul li").css({"display":"none"});
		 $(".banner .banner_img ul li").fadeOut("slow");
		 //隐藏所有的button
		 $(".banner .banner_bot ul li").css({"background":"rgba(0,0,0,.5)"});
	 	 //当前图片显示
		 //$(".banner .banner_img ul li:eq("+index+")").css({"display":""});
	 	 $(".banner .banner_img ul li:eq("+index+")").fadeIn("slow");
	 	 //当前的button显示
		 $(".banner .banner_bot ul li:eq("+index+")").css({"background":"#fff"});
	 }
	 
	 var times = setInterval("imgButton()",2000);
	 
	 /**鼠标移动到图片的buttom事件*/
	 $(".banner .banner_bot ul li").each(function (){
		$(this).hover(function(){
			clearInterval(times);
			var index = $(this).index();
			hiddenImg(index,false);
		},function (){
			times = setInterval("imgButton()",2000);
		}); 
	 });
	 
	 /**图片切换 end*/
	 
	 /**菜单划上去开始*/
	 var indexs;  //记录鼠标当前是悬浮在哪个菜单
	 $(".index_left_nav .sen ul>li").each(function (){
		$(this).hover(function (){
			 indexs = $(this).index();
			 $(".index_left_nav .xiang").show();
			 $(".index_left_nav .xiang ul:eq("+indexs+")").show();
		},function (){
			 $(".index_left_nav .xiang ul").hide();
			 $(".index_left_nav .xiang").hide();
		}); 
	 });
	 
	 /**鼠标在2级菜单移出的时候*/
	 $(".index_left_nav .xiang").hover(function(){
		 $(".index_left_nav .xiang").show();
		 $(".index_left_nav .xiang ul:eq("+indexs+")").show();
	 },function (){
		 $(".index_left_nav .xiang ul").hide();
		 $(".index_left_nav .xiang").hide();
	 });
	 /**菜单划上去结束*/
	 
	 /**banner 上面左右两个按钮的切换*/
	 /**左边按钮点击事件*/
	 var buttonFlag = true;  //true 代表动画已经执行完成  false没有执行完成  避免多次点击按钮出现bug
	 $(".banner .banner_left_buttom .buttom_left").click(function (){
		 if(buttonFlag) buttomImgButton(true);
	 });
	 /**右边按钮点击事件*/
	 $(".banner .banner_right_buttom .buttom_right").click(function (){
		 if(buttonFlag) buttomImgButton(false);
	 });
	 
	 /**左右按钮触发的事件*/
	 function buttomImgButton(flag){
		 var index = 0;
	 	 $(".banner .banner_img ul li").each(function (){
			 var hidden = $(this).is(":hidden");
			 if(hidden == false){
				 index = $(this).index();
			 }
		  });
	 	buttomHiddenImg(index,flag);
	 }
	 
	 /**左右触发按钮需要隐藏对应的操作  flag true 向左移动  false 向右移动*/
	 function buttomHiddenImg(index,flag){
		 buttonFlag = false;
		 clearInterval(times); //清楚计时器
	 	 if(flag){  //左
	 		 index = index-1;
		 	 index = index == -1 ? length-1 : index;
	 	 }else{  //右
	 		index = index+1;
	 		index = index == length ? 0 : index;
	 	 }
		 //隐藏所有的图片
		 //$(".banner .banner_img ul li").css({"display":"none"});
		 $(".banner .banner_img ul li").fadeOut("slow");
		 //隐藏所有的button
		 $(".banner .banner_bot ul li").css({"background":"rgba(0,0,0,.5)"});
	 	 //当前图片显示
		 //$(".banner .banner_img ul li:eq("+index+")").css({"display":""});
	 	 $(".banner .banner_img ul li:eq("+index+")").fadeIn("slow",function (){buttonFlag = true;});
	 	 //当前的button显示
		 $(".banner .banner_bot ul li:eq("+index+")").css({"background":"#fff"});
	 	 
		 times = setInterval("imgButton()",2000);  //启动计时器
	 }
	 
	 
	 
	 /**更换验证码*/
	 function relesh(){
		 var src = document.getElementById("image").src;
		 document.getElementById("image").src=""+chgUrl(src)+"";
	 }  	
	 
	 function chgUrl(url){     
		    var timestamp = (new Date()).valueOf();     
		    urlurl = url.substring(0,17);     
		    if((url.indexOf("&")>=0)){     
		        urlurl = url + "×tamp=" + timestamp;   
		    }else{    
		        urlurl = url + "?timestamp=" + timestamp;     
		    }     
		    return urlurl;     
		}     
	 /**更换验结束*/
	 
	</script>
  </body>

 
</html>
