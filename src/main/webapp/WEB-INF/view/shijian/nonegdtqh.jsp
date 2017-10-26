<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
		*{margin:0;padding:0}
		html,body{height:100%;overflow:hidden;}
		/**内容区开始*/
		.content{width:100%;height:100%;}
		.hong{width:100%;height:100%;background:red;}
		.lv{width:100%;height:100%;background:green;}
		.lan{width:100%;height:100%;background:blue;}
		.huang{width:100%;height:100%;background:yellow;}
		.pink{width:100%;height:100%;background:pink;}
		.orange{width:100%;height:100%;background:orange;}
		/**内容区结束*/
		/**定位圆区开始*/
		.dingwei{width:10px;height:100px;position:fixed;right:10px;top:50%;margin-top:-50px;}
		.dingwei p{width:10px;height:10px;background:#757575;border-radius:5px;margin-top:5px;}
		/**定位圆区结束*/
	</style>
  </head>
  
  <body>
  	 <!-- 定位圆区开始 -->
	 <div class="dingwei">
	 	<p></p>
	 	<p></p>
	 	<p></p>
	 	<p></p>
	 	<p></p>
	 	<p></p>
	 </div>
  	 <!-- 定位圆区结束 -->
	 <!-- 内容区开始 -->
	 <div class="content">
	 	<div class="hong"></div>
	 	<div class="lv"></div>
	 	<div class="lan"></div>
	 	<div class="huang"></div>
	 	<div class="pink"></div>
	 	<div class="orange"></div>
	 </div>
	 <!-- 内容区结束 -->
	 
     <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
     <script type="text/javascript">
     	$(parent.window.document.body).find(".mask").remove();//取消遮罩层
     	//滚轮事件只有firefox比较特殊，使用DOMMouseScroll; 其他浏览器使用mousewheel;
     	//默认右边的圆圈第一个是选择色
     	$(".dingwei p:eq(0)").css("background","#4c2f2f");
     	//firefox
     	document.body.addEventListener("DOMMouseScroll", function(event) {
	       var direction= event.detail && (event.detail > 0 ? "shang" : "xia");
	       if(direction == "xia"){
	          var index = pIndex();
	          index = index == 5 ? 4 : index;
	          $(".content div:eq("+(index+1)+")").slideDown();  //向下滑动（显示）被选元素
	          $(".content div:eq("+index+")").slideUp(); //向上滑动（隐藏）被选元素
	          gbp(index+1);  //改变右边的背景颜色
	       }else{
	          var index = pIndex();
	          index = index == 0 ? 1 : index;
	          $(".content div:eq("+index+")").slideUp(); //向上滑动（隐藏）被选元素
	          $(".content div:eq("+(index-1)+")").slideDown();  //向下滑动（显示）被选元素
	          gbp(index-1);  //改变右边的背景颜色
	       }  
	    });
     	// chrome and ie
     	document.body.onmousewheel = function (event) {
	       event = event || window.event;
	       var direction = event.wheelDelta && (event.wheelDelta > 0 ? "shang" : "xia");
	       if(direction == "xia"){
	          var index = pIndex();
	          index = index == 5 ? 4 : index;
	          $(".content div:eq("+(index+1)+")").slideDown();  //向下滑动（显示）被选元素
	          $(".content div:eq("+index+")").slideUp(); //向上滑动（隐藏）被选元素
	          gbp(index+1);  //改变右边的背景颜色
	       }else{
	          var index = pIndex();
	          index = index == 0 ? 1 : index;
	          $(".content div:eq("+index+")").slideUp(); //向上滑动（隐藏）被选元素
	          $(".content div:eq("+(index-1)+")").slideDown();  //向下滑动（显示）被选元素
	          gbp(index-1);  //改变右边的背景颜色
	       }
   		};
   		
   	   /**右边圆圈改变背景颜色*/
   	   function gbp(index){
   	      $(".dingwei p").css("background","#757575");
   	      $(".dingwei p:eq("+index+")").css("background","#4c2f2f");
   	   }
   	   
   	   /**获取右边是第几个选中*/
   	   function pIndex(){
   	     var retu;
   	     $(".dingwei p").each(function (i){
   	     	var color = rgb2hex($(this).css("background-color"));
   	        if(color == '#4c2f2f'){
   	           retu = i;
   	        }
   	     });
   	     return retu;
   	   }
   	  
	   	/**获取颜色值*/
	   	function rgb2hex(rgb) {
	   		if(rgb != 'transparent' && rgb != "rgba(0, 0, 0, 0)"){
	   			rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
	   			function hex(x) {
	   				return ("0" + parseInt(x).toString(16)).slice(-2);
	   			}
	   			return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
	   		}
	   	}
   	
   		/**点击事件*/
   		$(".dingwei p").each(function (){
		   $(this).click(function (){
		      var qindex = pIndex();
		      var index = $(this).index();
		      //if(qindex > index){  //前
		        $(".content div:eq("+(qindex)+")").slideUp(); //向上滑动（隐藏）被选元素
		        $(".content div:eq("+(index)+")").slideDown();  //向下滑动（显示）被选元素
		    // }else{  //后
		         //$(".content div:eq("+qindex+")").slideUp(); //向上滑动（隐藏）被选元素
		         //$(".content div:eq("+(index+1)+")").slideDown();//向下滑动（显示）被选元素
		    //  }
		      gbp(index);  //改变右边的背景颜色
		   });
		});
     </script>
  </body>
</html>
