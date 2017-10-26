/**
 * 各种提示特效
 * width  文本框的宽度
 * height 文本框的高度
 * color 文本的颜色
 * content 文本的字
 * backgroundColor 背景颜色
 * type 从哪个方向开始
 * direction   表示以什么动作旋转动画  among 中间  around 四周
 * date 多长时间消失
 */
/**********************************************弹出提示框开始***********************************************************/
$.ts = function (options){
	var opts = $.extend({},$.ts.method,options);
	var width = opts.width;
	var height = opts.height;
	var color = opts.color;
	var content = opts.content;
	var backgroundColor = opts.backgroundColor;
	var type = opts.type;
	var direction = opts.direction;
	var date = opts.date;
	var time = opts.time;  //主要用于load的
	opts.create(width,height,color,content,backgroundColor,type,direction,date,time);
};
$.ts.method = {
	//拼出提示框
	create:function (width,height,color,content,backgroundColor,type,direction,date,time){
		if(direction == 'around'){  //四周出现
			var divTskdh = "<div class='tskdh'>"+content+"</div>";
			$("body").append(divTskdh);
			$(".tskdh").css({
				"text-align":"center",
				"line-height":""+height+"",
				"color":""+color+"",
				"background":""+backgroundColor+"",
				"position":"fixed",
				"left":"0",
				"top":"0",
				"bottom":"0",
				"right":"0",
				"margin":"auto",
				"border-radius":"4px",
				"width":""+width+"",
				"height":""+height+"",
				"-webkit-animation":"tckdh"+type+" 1s 1 ease-in-out forwards",
				"animation":"tckdh"+type+" 1s 1 ease-in-out forwards;"
			});
			setTimeout(function(){$(".tskdh").remove();},date);
		}else if(direction == 'among'){  //中间出现
			var divZhong = "<div class='yuan'>"+content+"</div>";
			$("body").append(divZhong);
			$(".yuan").css({
				"position":"fixed",
				"top":"50%",
				"left":"50%",
				"width":""+width+"",
				"height":""+height+"",
				"background":""+backgroundColor+"",
				"color":""+color+"",
				"text-align":"center",
				"line-height":""+height+"",
				"border-radius":"4px",
				"-webkit-animation":"tckZhong 1s 1 ease-in-out forwards",
				"animation":"tckZhong 1s 1 ease-in-out forwards;"
			});
			setTimeout(function(){$(".yuan").remove();},date);
		}else if(direction == 'load'){  //load加载
			var loadDiv ="<div class=\"loading\"><span>"+content+"</span></div>";
			$("body").append(loadDiv);
			//$(".loading").animate({height:"50px"});
			$(".loading").css({
				"position":"fixed",
				"top":"50%",
				"left":"50%",
				"margin-left":"-68px",
				"margin-top":"-25px",
				"width":"135px",
				"background":"rgb(62,65,70)",
				"color":"rgb(255,255,255)",
				"border":"1px solid rgb(85,85,85)",
				"border-radius":"4px",
				"box-shadow":"2px 2px 1em #333"
			});
			$(".loading span").css({
				"background":"url('../images/loading.gif')no-repeat",
				"width":"100px",
				"height":"28px",
				"display":"block",
				"font-size":"12px",
				"margin":"13px 20px",
				"padding-left":"23px",
				"line-height":"20px"
			});
			setTimeout(function(){
				$(".loading").animate({height:"0px"},function (){  //取消load
					$(this).remove();
				});
			},time);
		}
	}
};
/**********************************************弹出提示框结束***********************************************************/
/**********************************************加载进度开始***********************************************************/
var div = "<div class='mask'><div class='spinner'><div class='rect1'></div><div class='rect2'></div><div class='rect3'></div><div class='rect4'></div><div class='rect5'></div></div></div>";
var mask = "";
$.jzjd = function(options){
	var opts = $.extend({},$.jzjd.method,options);
	var divId = opts.divId;  //是在当前body拼 还是在传入的指定div里面拼接  传过来的div必须position:relative;
	opts.szjd(divId);
};

$.jzjd.method={
	/**竖的进度*/
	szjd:function(divId){
		if(typeof(divId) == "undefined"){  //当前body
			$("body").append(div);
		}else{
			$("."+divId).append(div);
		}
		$(".spinner").css({	
			"position": "fixed",
			"left":"0",
			"top":"0",
			"bottom":"0",
			"right":"0",
			"margin":"auto",
   	        "width": "60px",
		    "height": "60px",
		    "text-align": "center",
		    "font-size": "10px"
		});
		$(".mask").css({
			"width":"100%",
			"height":"100%",
			"position":"fixed",
			"top":"0px",
			"filter":"alpha(opacity=60)",
			"background-color":"#777",
			"left":"0px",
			"opacity":"0.5",
			"-moz-opacity":"0.5"
		});
		$(".spinner > div").css({
			"background-color":"#67CF22",
			"height":"100%",
			"width":"3px",
			"display":"inline-block",
			"-webkit-animation":"stretchdelay 1.2s infinite ease-in-out",
			"animation":"stretchdelay 1.2s infinite ease-in-out",
			"margin-right":"3px"
		});
		$(".spinner .rect2").css({
			"-webkit-animation-delay":"-1.1s",
			"animation-delay":"-1.1s"
		});
		$(".spinner .rect3").css({
			"-webkit-animation-delay":"-1s",
			"animation-delay":"-1s"
		});
		$(".spinner .rect4").css({
			"-webkit-animation-delay":"-0.9s",
			"animation-delay":"-0.9s"
		});
		$(".spinner .rect5").css({
			"-webkit-animation-delay":"-0.8s",
			"animation-delay":"-0.8s"
		});
	}
};
/**********************************************加载进度结束***********************************************************/