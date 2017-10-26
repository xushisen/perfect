<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
	 <style type="text/css">
	 	html,body{height:100%;}
		*{margin:0;padding:0;}
	 	li{list-style:none;width:100px;height:100px;border:1px solid red;margin:20px;float:left;}
	 </style>
  </head>
  
  <body leftmargin="0" topmargin="0" oncontextmenu="return false" ondragstart="return false" onselectstart="return false" onselect="document.selection.empty()" oncopy="document.selection.empty()" onbeforecopy="return false">
     <p style="font-size:20px;-webkit-text-stroke:1px red;color:#fff;font-weight:900;">提示  按住鼠标左键进行拖拽选中</p>
     <ul>
      <li>11</li>
      <li>22</li>
      <li>33</li>
      <li>44</li> 
	  <li>11</li>
      <li>22</li>
      <li>33</li>
      <li>44</li> 
	  <li>11</li>
      <li>22</li>
      <li>33</li>
      <li>44</li> 
	  <li>11</li>
      <li>22</li>
      <li>33</li>
      <li>44</li> 
	  <li>11</li>
      <li>22</li>
      <li>33</li>
      <li>44</li>
   </ul>
   
   <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
   <script type="text/javascript">
   $(parent.window.document.body).find(".mask").remove();//取消遮罩层
   
   $(document).ready(function(){
	   //鼠标滑动画出方形
	   $("body").append($("<div id=\"rect\"></div>").css({"background":"rgba(0,0,0,.5)","position":"absolute"}));

	    var flag = false;  //true按下鼠标  false松开鼠标
	    var lis = [];  //所有的li的坐标
	    var mousex = 0,mousey = 0,fx,rectWidth,rectHeight;  //记录鼠标点击时的x y 坐标 fx记录鼠标是从哪个方向来的; zs左上 ys右上 zx左下 yx右下  rectWidth鼠标滑动时矩形的宽  rectWHeight鼠标滑动时矩形的高
	    $("ul li").each(function (i,obj){
	        var lix = $(this).offset().left;
	        var liy = $(this).offset().top;
	        var height = $(this).height();
	        var width = $(this).width();     

	 	    lis.push({"num":i,"zsx":lix,"zsy":liy,"ysx":lix+width,"ysy":liy,"zxx":lix,"zxy":liy+height,"yxx":lix+width,"yxy":liy+height});
	    });
	    $("body").mousedown(function(e){
	       var e = e || window.event;
	       flag = true;
	       if(e.which == 1){  //左键移出
	          $("ul li").css({"background":"#fff"});
	          $("#rect").css({"height":"0",width:"0"});
	       }
	       mousex = e.pageX;
	       mousey = e.pageY;
	    }).mousemove(function (e){
	       if(flag){
	          //区分鼠标是从左上 右上  左下 右下的情况
	          var e = e || window.event;
	          var x = e.pageX;
	          var y = e.pageY;
	          if(mousex<x&&mousey<y){ //往右下方向移动
	             fx = "yx";
	             //要改变矩形的宽高
	             rectWidth = x-mousex;
	             rectHeight = y-mousey;
	          }else if(mousex>x&&mousey>y){  //往左上方向移动
	             fx = "zs";
	             rectWidth = mousex-x;
	             rectHeight = mousey-y;
	             console.log(rectWidth+".."+rectHeight);
	          }else if(mousex>x&&mousey<y){   //往左下方向移动
	             fx = "zx";
	  		     rectWidth = mousex-x;
	             rectHeight = y-mousey;
	          }else if(mousex<x&&mousey>y){  //往右上方向移动
	             fx = "ys";
	  		     rectWidth = x-mousex;
	             rectHeight = mousey-y;
	          }
	          var i=0,len = lis.length;
	          $("ul li").css({"background":"#fff"});
	          for(;i<len;i++){  //循环鼠标当前的位置和所有的li比较
	             var zsx = lis[i].zsx;  //左上x
	             var zsy = lis[i].zsy;  //左上y
	             var ysx = lis[i].ysx;  //右上x
	             var ysy = lis[i].ysy;  //右上y

	             var zxx = lis[i].zxx;  //左下x
	             var zxy = lis[i].zxy;  //左下y
	             var yxx = lis[i].yxx;  //右下x
	             var yxy = lis[i].yxy;  //右下y
	             var num = lis[i].num;

	             if(fx=="yx" && x>zsx && y>zsy && mousex<zsx && mousey<zsy){//往右下方向移动 鼠标滑动坐标x大于每个li的x:x>zsx 并且鼠标滑动的坐标y大于每个li的y:y>zsy 并且 鼠标开始坐标的左边不能选中:mousex<zsx 并且 鼠标开始坐标的上边不能选中:mousey<zsy
	                //改变矩形的宽高
	                $("#rect").css({"width":rectWidth,"height":rectHeight,"top":mousey,"left":mousex});
	  	      		//让li选中
	                $("ul li:eq("+num+")").css({"background":"red"});
	             }else if(fx=="zs" && x<yxx && y<yxy && mousex>yxx && mousey>yxy){//往左上方向移动 鼠标滑动的坐标x小于每个li的x:x<yxx  并且 鼠标滑动的坐标y小于每个li的y:y<yxy 并且 鼠标开始坐标的右边不能选中:mousex>yxx 并且 鼠标开始坐标的下边不能选中:mousey>yxy
	  			    $("#rect").css({"width":rectWidth,"height":rectHeight,"top":y,"left":x});
	                $("ul li:eq("+num+")").css({"background":"red"});
	             }else if(fx=="zx" && x<ysx && y>ysy && mousex>ysx && mousey<ysy){//往左下方向移动  鼠标滑动的坐标x小于每个li的x:x<ysx   并且 鼠标滑动的坐标y大于每个li的坐标y:y>ysy 并且 鼠标开始坐标的上方不能选择:mousex>ysx 并且鼠标开始坐标的右方不能选中:mousey<ysy
	                $("#rect").css({"width":rectWidth,"height":rectHeight,"top":mousey,"left":x});
	  			    $("ul li:eq("+num+")").css({"background":"red"});
	             }else if(fx=="ys" && x>zxx && y<zxy && mousex<zxx && mousey>zxy){//往右上方向移动  鼠标滑动的坐标x大于每个li的x:x>zxx 并且 鼠标滑动的坐标y小于每个li的y:y<zxy 并且开始坐标的左边不能选中:mousex>zxx 并且 开始坐标的下方不能选中:mousey>zxy
	                $("#rect").css({"width":rectWidth,"height":rectHeight,"top":y,"left":mousex});
	  			    $("ul li:eq("+num+")").css({"background":"red"});
	             }
	          }
	       }
	    }).mouseup(function (){
	       flag = false;
	    });
	  });
   
    /**cnavas 画饼图代码*/
/**var canvas = document.getElementById("myCanvas");
var data = [{"num":"20","color":"red"},{"num":"30","color":"yellow"},{"num":"40","color":"green"},{"num":"10","color":"blue"},{"num":"5","color":"pink"}];
var startPoint = 0;
var zh = 0;
var rectHeight = 50;
//简单地检测当前浏览器是否支持Canvas对象，以免在一些不支持html5的浏览器中提示语法错误
if(canvas.getContext){
    //获取对应的CanvasRenderingContext2D对象(画笔)
    var ctx = canvas.getContext("2d");  
    //计算总和
    for(var i=0;i<data.length;i++){
       zh = zh+parseInt(data[i].num);
    }
    for(var i=0;i<data.length;i++){
		//开始一个新的绘制路径
		ctx.beginPath();
		ctx.moveTo(100,100);
		//设置弧线的颜色为蓝色
		ctx.fillStyle = data[i].color;
		//沿着坐标点(100,100)为圆心、半径为50px的圆的顺时针方向绘制弧线
		ctx.arc(100, 100, 50, startPoint, startPoint + Math.PI * 2 * (data[i].num / zh), false);
		//按照指定的路径绘制弧线
		ctx.fill();
		ctx.closePath();
		startPoint += Math.PI * 2 * (data[i].num / zh);

                //画右边的方框
                ctx.fillRect(200,rectHeight,10,10);
                //写方框后面的字
                ctx.fillStyle="black";
                ctx.fillText(data[i].num,215,rectHeight+10);
                rectHeight += 15;
	}
}*/
   </script>
  </body>
</html>
