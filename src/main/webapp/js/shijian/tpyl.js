/**
 * 图片预览
 */
var yldiv = "<div class=\"yl\"><span>×</span><div class=\"bottom left\"><a href=\"#\" title=\"上一张\"><<</a></div><div class=\"bottom right\"><a href=\"#\" title=\"下一张\">>></a></div> <div class=\"yeshu\"></div> <div class=\"caozuo\"><a id=\"xz\" href=\"javascript:;\">旋转</a></div><div class=\"yl-img\"><img src=\"\" alt=\"图片\" /></div></div>";
/**获取所有的img 放到数组array*/
var array = new Array();
var imgsrcIndex = "";  //记录当前要显示图片的src在数组的索引
var deg = 90;  //图片旋转的度数
var imgFlag = true;  //记录图片是否是横排 竖排  true横排 flase竖排
var image = new Image(); //获取当前图片的宽高

$(parent.window.document.body).find(".mask").remove();//取消遮罩层
$.tpyl = function(options){
	var opts = $.extend({},$.tpyl.method,options);
	var divId = options.divId;
	
	var img = $("."+divId+" img");  //所有的img
	img.each(function(index){
		array[index] = $(this).attr("src");  //吧所有的img的地址赋值给array数组
  	});
	/**img点击事件*/
	img.click(function (){
		var src = $(this).attr("src");
		for(var i=0,j=array.length;i<j;i++){
			if(src == array[i]){
				imgsrcIndex = i;
			} 
		 }
		opts.yledit(imgsrcIndex,divId);
	});
};

$.tpyl.method = {
	/**点击图片需要加载预览div*/
	yledit:function(imgsrcIndex,divId){
		imgsrcIndex = imgsrcIndex == "" ? 0 : imgsrcIndex;  //当前点击不是第一个图片就是imgsrc 第一个就是[0]
     	 $("body").append(yldiv);
     	 djgb(imgsrcIndex,divId);
     	 /**叉号*/
     	 $(".yl span").click(function (){
     		 $(".yl").remove();
     	 });
     	 /**左*/
     	 $(".yl .left").click(function (){
     		imgsrcIndex -- ;
     		if(imgsrcIndex < 0){
     			$.jAlert({
      				title:"提示",
      				content:"嗷嗷嗷,前面没有了",
      				sfqp:false,   //true 需要跳出ifame封住全屏
      				direction:"right",
      				qd:function (){
      				}
      			});
     			imgsrcIndex = 0;
     		}
     		djgb(imgsrcIndex,divId);
     	 });
     	 /**右*/
     	$(".yl .right").click(function (){
     		imgsrcIndex ++ ;
     		if(imgsrcIndex > array.length-1){
     			$.jAlert({
      				title:"提示",
      				content:"嗷嗷嗷,后面没有了",
      				sfqp:false,   //true 需要跳出ifame封住全屏
      				direction:"left",
      				qd:function (){
      				}
      			});
     			imgsrcIndex = array.length-1;
     		}
     		djgb(imgsrcIndex,divId);
    	 });
     	 /**选择*/
     	 $(".yl .caozuo #xz").click(function (){
     		 //拿到当前图片的宽高  然后根据宽高去给图片最对应的适应操作
     		 var imgWidth = $(".yl .yl-img img").width(),imgHeight = $(".yl .yl-img img").height();
     	 	 var ylWidth = $(".yl").width(),ylHeight = $(".yl").height();  //最大的宽度 高度
 			 var jo = (deg/90)%2 == 0 ? true : false;  //基数false  偶数true
     		 if(imgFlag){    //宽大于高的图片旋转
     			 if(jo){  //偶数是横显示
      		     	$(".yl .yl-img").css({"left":(ylWidth*0.2)/2,"top":"0"});
     				$(".yl .yl-img img").css({"transform":"rotateZ("+deg+"deg)","width":ylWidth-(ylWidth*0.2),"height":ylHeight-(ylHeight*0.1)+"px"});
     			 }else{  //竖排显示
     				$(".yl .yl-img").css({"left":(ylWidth*0.6)/2,"top":ylHeight*0.2+"px"});
     				$(".yl .yl-img img").css({"transform":"rotateZ("+deg+"deg)","width":"auto","height":ylHeight-(ylHeight*0.5)+"px"});
     			 }
     		 }else{  //高大于宽的图片旋转
     			 if(jo){  //偶数是横显示
      		 		$(".yl .yl-img").css({"left":(ylWidth*0.7)/2,"top":"0"});
     				$(".yl .yl-img img").css({"transform":"rotateZ("+deg+"deg)","width":ylWidth-(ylWidth*0.7),"height":ylHeight-(ylHeight*0.1)});
      			 }else{  //竖排显示
      				$(".yl .yl-img").css({"left":(ylWidth*0.7)/2,"top":"0"});
     				$(".yl .yl-img img").css({"transform":"rotateZ("+deg+"deg)","width":"auto","height":ylHeight-(ylHeight*0.1)+"px"});
      			 }
     		 }
     		 deg+=90;
     	 });
	}
};
/**图片改变操作*/
function djgb(imgsrcIndex,divId){
	$(".yl .yl-img img").css("transform","rotateZ(0deg)"); //还原img的度数
	deg = 90;
	$(".yl .yl-img img").attr("src",array[imgsrcIndex]);
 	/**拼出总共的图片的数量和当前图片在总图片的第几个*/
 	$(".yl .yeshu").text(imgsrcIndex+1+"/"+array.length);
 	//计算图片到适应的大小
 	var imgWidth,imgHeight; //图片的宽度  高度
 	image.src = ""+array[imgsrcIndex]+"";
 	//判断是否有缓存
 	if(image.complete){
 		console.log("缓存");
 		imgWidth = image.width;
	    imgHeight = image.height;
 	}else{
 		console.log("不是缓存");
 		image.onload = function(){
 			imgWidth = image.width;
 			imgHeight = image.height;
 		};
 	}
 	var ylWidth = $(".yl").width(),ylHeight = $(".yl").height();  //最大的宽度 高度
 	if(imgWidth>imgHeight){  //宽大于高   横的
 		imgFlag = true;
     	$(".yl-img img").css({"width":ylWidth-(ylWidth*0.2),"height":ylHeight-(ylHeight*0.1)});
     	$(".yl-img").css({"left":(ylWidth*0.2)/2,"top":"0"});
 	}else{  //高大于长  竖的
 		imgFlag = false;
 		$(".yl-img img").css({"width":ylWidth-(ylWidth*0.7),"height":ylHeight-(ylHeight*0.1)});
 		$(".yl-img").css({"left":(ylWidth*0.7)/2,"top":"0"});
 	}
}