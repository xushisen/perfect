<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
	    html,body{font:normal 14px/24px "Microsoft Yahei","冬青黑体简体中文 w3","宋体";} 
	    *{margin:0;padding:0}
		.pubu{width:900px;height:500px;margin:50px auto;}
		.pubu .pubuImg{width:200px;box-shadow:0 0 10px #6e6e6e;margin-bottom:5px;}
		.pubu ul li{width:200px;list-style:none;float:left;padding:5px;margin:5px;}
		.pubu img{animation:dh 1s 1 ease-in-out forwards}
		
		::-webkit-scrollbar{width:8px;height:6px;background:#eee}  /**滚动条整体部分*/
		::-webkit-scrollbar-button{background-color:#eee}/**滚动条的轨道的两端按钮，允许通过点击微调小方块的位置*/
		::-webkit-scrollbar-track{background:#eee}/**滚动条的轨道（里面装有Thumb）*/
		::-webkit-scrollbar-track-piece{background:#eee}/**内层轨道，滚动条中间部分（除去）*/
		::-webkit-scrollbar-thumb{background:#aaa;border-radius:4px;}/**滚动条里面的小方块，能向上向下移动（或往左往右移动，取决于是垂直滚动条还是水平滚动条）*/
		::-webkit-scrollbar-corner{background:#82afff}/**边角，即两个滚动条的交汇处*/
		::-webkit-scrollbar-resizer{background:#ff0bee}/**两个滚动条的交汇处上用于通过拖动调整元素大小的小控件*/

		 @keyframes dh{
			0%{transform:scale(0.3)}
			100%{transform:scale(1)}
		 }
	</style>
  </head>
  
  <body>
  <p style="font-size:20px;-webkit-text-stroke:1px red;color:#fff;font-weight:900;">尽情的滑动你的鼠标吧</p>
      <div class="pubu">
		 <ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		 </ul>
	  </div>
		
     <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
     <script type="text/javascript" src="../js/zidingyi/tsUtil.js"></script>
     <script type="text/javascript">
        
       	$(parent.window.document.body).find(".mask").remove();//取消遮罩层
     	
     	$.ts({"direction":"load","content":"数据加载中...","time":"2000"});   //load准备 
     	
     	var ji = 0;  //记录是要显示前4个还是后4个
     	var tupian = [
   				{"src":"../images/pubuliu/1.jpg"},
   				{"src":"../images/pubuliu/2.jpg"},
   				{"src":"../images/pubuliu/3.jpg"},
   				{"src":"../images/pubuliu/4.jpg"},
   				{"src":"../images/pubuliu/5.jpg"},
   				{"src":"../images/pubuliu/6.jpg"},
   				{"src":"../images/pubuliu/7.jpg"},
   				{"src":"../images/pubuliu/8.jpg"}
   			];
     	
            create(true);
     		
   			function create(type){  //type true 8个加载 false 4个加载
   				if(type){  //8个一起加载  小屏幕8个可以  但是大屏幕小于8个  没有滚动条   所以下拉就不管用了  必须让出现滚动条
   					var height = $(window).height(); //获取当前浏览器的高度
   					if(height < 560){  //小屏幕
		   				for(var i=0;i<tupian.length;i++){
		   					var index = getMinli();
		   					var img = "<div class='pubuImg'><img src='"+tupian[i].src+"' width='200' alert='美女' /></div>";
		   					$(".pubu ul li:eq("+index+")").append(img);
		   				}
   					}else{
   						for(var i=0;i<12;i++){
		   					var index = getMinli();
		   					var img = "<div class='pubuImg'><img src='"+tupian[i%8].src+"' width='200' alert='美女' /></div>";
		   					$(".pubu ul li:eq("+index+")").append(img);
		   				}
   					}
   				}else{  //4个4个加载
   					var start = ji%2 == 0 ? 0 : 4;
   					var end = start == 0 ? 4 : 8;
   					for(var i=start;i<end;i++){
	   					var index = getMinli();
	   					var img = "<div class='pubuImg'><img src='"+tupian[i].src+"' width='200' alert='美女' /></div>";
	   					$(".pubu ul li:eq("+index+")").append(img);
	   				}
   					ji ++ ;
   				}
   			}

   			//获取高度最小的li
   			function getMinli(){
   				var minHeight = 9999999;
   				var li = 0;
   				$(".pubu ul li").each(function (i){
   					var height = $(this).height();
   					if(height < minHeight){
   						minHeight = height;
   						li = i;
   					}
   				});
   				return li;
   			}
   			
   			//滚动条
   			$(window).scroll(function(){
   				var scrollTop = $(this).scrollTop();
   				var scrollHeight = $(document).height();
   				var windowHeight = $(this).height();
   				if((scrollTop + windowHeight + 1) > scrollHeight){
   					$.ts({"direction":"load","content":"数据加载中...","time":"1000"});   //load准备 
   					create(false);
   				};
   			});
     </script>
  </body>
</html>
