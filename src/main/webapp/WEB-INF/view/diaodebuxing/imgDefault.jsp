<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
 	 <style type="text/css">
 	 	*{margin:0;padding:0}
		.imglist{margin-bottom:700px;}
		.imglist ul li,.imglist1 ul li{list-style:none;width:200px;height:154px;margin-right:10px;float:left;}
 	 </style>
  </head>
  
  <body>
     <p style="font-size:20px;-webkit-text-stroke:1px red;color:#fff;font-weight:900;">刚开始图片默认显示默认的图片  然后慢慢加载出对应的图片 鼠标滑动还有一轮图片在下面</p>
     <div class="imglist">
	    <ul>
	       <li><img src="http://moonbuy.cn/mall/static/images/default.jpg" width="200" height="154" alt="detault" data-url="http://oss.mooncdn.cn/201611/11/20161111165517896651984.jpg" /></li>
		   <li><img src="http://moonbuy.cn/mall/static/images/default.jpg" width="200" height="154" alt="detault" data-url="http://oss.mooncdn.cn/group1/M00/8E/27/Ci27jlfRGb2AaDvrAAMavoSs3hA125.png" /></li>
		   <li><img src="http://moonbuy.cn/mall/static/images/default.jpg" width="200" height="154" alt="detault" data-url="http://oss.mooncdn.cn/group1/M00/49/D1/Ci27jlcQpqCAYiwJAAES3rLHQc0993.jpg" /></li>
		   <li><img src="http://moonbuy.cn/mall/static/images/default.jpg" width="200" height="154" alt="detault" data-url="http://oss.mooncdn.cn/group1/M00/40/D5/Ci27jlbzkvSAD-1KAAEGdPzDKbY100.jpg" /></li>
		   <li><img src="http://moonbuy.cn/mall/static/images/default.jpg" width="200" height="154" alt="detault" data-url="http://oss.mooncdn.cn/group1/M00/46/A4/Ci27jlcFDtiAZ9xWAACr0IoXu5Y650.jpg" /></li>
		   <li><img src="http://moonbuy.cn/mall/static/images/default.jpg" width="200" height="154" alt="detault" data-url="http://oss.mooncdn.cn/group1/M00/41/24/Ci27jlbzykOAXS9SAACqrvY77ps294.jpg" /></li>
	    </ul>
	 </div>
	 <div class="imglist1">
	    <ul>
	       <li><img src="http://moonbuy.cn/mall/static/images/default.jpg" width="200" height="154" alt="detault" data-url="http://oss.mooncdn.cn/group1/M00/56/58/Ci27jlc-t82AVFvoAAE2zLDyBco728.png" /></li>
		   <li><img src="http://moonbuy.cn/mall/static/images/default.jpg" width="200" height="154" alt="detault" data-url="http://oss.mooncdn.cn/group1/M00/42/15/Ci27jlb1FH6AJAngAAClrOOKR6U279.jpg" /></li>
		   <li><img src="http://moonbuy.cn/mall/static/images/default.jpg" width="200" height="154" alt="detault" data-url="http://oss.mooncdn.cn/group1/M00/3D/32/Ci27jlbtZ9mACOo5AABpDI5yMVs945.jpg" /></li>
		   <li><img src="http://moonbuy.cn/mall/static/images/default.jpg" width="200" height="154" alt="detault" data-url="http://oss.mooncdn.cn/group1/M00/46/9F/Ci27jlcFCaWAKlSGAACbREL9TVQ224.jpg" /></li>
		   <li><img src="http://moonbuy.cn/mall/static/images/default.jpg" width="200" height="154" alt="detault" data-url="http://oss.mooncdn.cn/group1/M00/0B/61/CqpsflYg7JaAVIhEAACkdtQ72h8238.jpg" /></li>
		   <li><img src="http://moonbuy.cn/mall/static/images/default.jpg" width="200" height="154" alt="detault" data-url="http://oss.mooncdn.cn/group1/M00/0C/0B/CqpsflYmQKeASOgxAAHnYO8enHM071.png" /></li>
	    </ul>
	 </div>
	 
	 <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	 <script type="text/javascript">
		 $(parent.window.document.body).find(".mask").remove();//取消遮罩层
	     jiazai("imglist");
	 	 function jiazai(divId){
	 		 var height = $(window).height(); //获取当前浏览器的高度
	 		 if(height > 560){ //大屏幕  让imglist改变成900px
	 			$(".imglist").css({"border-bottom":"1100px"});
	 		 }
	 		 var j=0;  //记录每次图换到了哪张图片 默认从0开始
		   	 var image = new Image();
		     var urls = [];
		     $("."+divId+" ul li").each(function (i,obj){ //获取所有需要替换的图片的url放到urls数组里面
		        var url = $(obj).find("img").data("url");
		        urls.push(url);
		     });
		     
			 //定时器去检查所有的图片是否都加载完成
		     var jishi = setInterval(function(){
		    	 if(j == urls.length-1){  //加载完成 清除定时器 j恢复为0
			        clearInterval(jishi);
			     }
		         image.src = urls[j];
		         if(image.complete){  //缓存 直接改变图片src
		        	 window.console && console.log("%c缓存中读取的","color:red");
		        	 $("."+divId+" ul li:eq("+j+") img").attr("src",urls[j]);
				     j++;
		         }else{  //没有缓存  加载完图片赋值src
		        	 image.onload = function (){
		        		window.console && console.log("%c不是缓存中读取的","color:green");
			        	$("."+divId+" ul li:eq("+j+") img").attr("src",urls[j]);
				        j++;
			      	 };
		         }
		     },100);
	 	 }
	 	 
	 	 /**
	 	  * 校验div里面的图片有没有没加载完成的 true有 false没有
	 	  */
	 	 function imgIsDefault(divId){
	 		 var flag = false;
	 		 $("."+divId+" ul li").each(function (i,obj){ //获取所有需要替换的图片的url放到urls数组里面
		        var url = $(obj).find("img").attr("src");
	 		 	if (url == 'http://moonbuy.cn/mall/static/images/default.jpg' && flag == false) {
	 		 		flag = true;
	 		 	}
		     });
	 		 return flag;
	 	 }
		 
	    //滚动条
		$(window).scroll(function(){
			var scrollTop = $(this).scrollTop();
			var scrollHeight = $(document).height();
			var windowHeight = $(this).height();
			if((scrollTop + windowHeight + 1) > scrollHeight){
				 //先校验图片是不是已经加载过  加载过就不用再次去加载  也就是img的src不是default
				 if(imgIsDefault("imglist1")){
				 	jiazai("imglist1");
				 }
			};
		});
	 </script>
  </body>
</html>
