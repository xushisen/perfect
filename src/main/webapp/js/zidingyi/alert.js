/**
 * 自定义弹出框
 * type  记录鼠标是否按下   srartTop 记录鼠标按下的top  srartLeft 记录鼠标按下的left  divTop  div离页面的上边距  divLeft  div离页面的左边距
 */

var type = false,startTop = 0,startLeft = 0,divTop = 0,divLeft = 0;
$(function (){
	jQuery.extend({
		//弹出框设置
		jAlert:function (content){
			var zhi = {
					qd: function(){}
				};
			//拼弹出框
			var tck = "<div class='mask'></div><div class='alert'><div class='alertTitle'><p>"+content.title+"</p><span id='cha'></span></div><div class='alertContent'><div class='content'>"+content.content+"</div><div class='contentBu'><a href='javascript:;' id='qd'>确定</a></div></div></div>";
			if(content.sfqp == false){  //需要跳出ifame 封住全屏
				$("body").append(tck);
				divCenter(content.direction);//计算中间位置
				mouseDown();//绑定拖动事件
				$("#qd,#cha").click(function (){
					//移出提示框
					removeDhk();
					this.content = $.extend({},zhi,content);
					(this.content.qd)();
					return true;
				});
			}else{
				$(parent.window.document.body).append(tck);
				divCenterIframe(content.direction);//计算中间位置
				mouseDownifame();//绑定拖动事件
				$(parent.window.document.body).find("#qd,#cha").click(function (){
					//移出提示框
					removeQpDhk();
					this.content = $.extend({},zhi,content);
					(this.content.qd)();
					return true;
				});
			}
		},
		//提示框
		tConfirm:function(content){
			var zhi = {
				yes: function(){},
				no: function(){}
			};

			var tsk = "<div class='mask'></div><div class='alert'><div class='alertTitle'><p>"+content.title+"</p><span id='cha'></span></div><div class='alertContent'><div class='content'>"+content.content+"</div><div class='contentBuTs'><a href='javascript:;' id='qd'>确定</a><a href='javascript:;' id='qx'>点错了</a></div></div></div>";
			//需要获取点击是确定还是取消
			if(content.sfqp == false){  //需要跳出ifame 封住全屏
				$("body").append(tsk);
				divCenter(content.direction);//计算中间位置
				mouseDown();//绑定拖动事件
				$("#qd").click(function (){
					//移出提示框
					removeDhk();
					//return true;
					//返回回掉函数 
					this.content = $.extend({},zhi,content);
					(this.content.yes)();
				});
				$("#qx,#cha").click(function (){
					//移出提示框
					removeDhk();
					//返回回掉函数 
					this.content = $.extend({},zhi,content);
					(this.content.no)();
				});
			}else{
				$(parent.window.document.body).append(tsk);
				divCenterIframe(content.direction);//计算中间位置
				mouseDownifame();//绑定拖动事件
				$(parent.window.document.body).find("#qd").click(function (){
					//移出提示框
					removeQpDhk();
					//return true;
					//返回回掉函数 
					this.content = $.extend({},zhi,content);
					(this.content.yes)();
				});
				$(parent.window.document.body).find("#qx,#cha").click(function (){
					//移出提示框
					removeQpDhk();
					//返回回掉函数 
					this.content = $.extend({},zhi,content);
					(this.content.no)();
				});
			}
		},
		tContent:function(options){
		     var tcContentDiv = "<div class=\"zhezhao\"></div>"+
				"<div class=\"popup\">"+
				"	<div class=\"popup-title\">"+
				"		<div class=\"title-left\">"+options.title+"</div>"+
				"		<div class=\"title-right\" id=\"sen\">×</div>"+
				"	</div>"+
				"	<div class=\"popup-content\"><iframe></iframe></div>"+
				"</div>";
		     
		       $("body").append(tcContentDiv);
		       $(".popup").width(options.width).height(options.height);
		       $(".popup .popup-content").height(options.height-35);
			   $(".popup .popup-content iframe").attr("src",options.url);
			   /**叉号取消div*/
			   $(".popup .popup-title .title-right").click(function (){
			       $("body").find(".zhezhao,.popup").remove();
			   });
			   
				  /**拿到jsp页面的内容 然后经过处理放到popup-content里面 */
			     /**function huoqu(url){
			    	 	$("body").append(tcContentDiv);
			    		//建立一个XMLHttpRequest请求
			    		var request = new XMLHttpRequest();
			    		//配置, url为要获取网页的地址
			    		request.open('GET', url, true);
			    		//因为我们需要的源码是纯文本形式的，所以设置返回类型为文本
			    		request.responseType = 'text';
			    		//一旦请求成功，但得到了想要的数据了
			    		request.onload = function() {
			    			//这里获得网页的内容
			    			var lyric = request.response;
			    			//输出内容
			    			var styleStart = lyric.indexOf("<style type=\"text/css\">");
			    			var styleEnd = lyric.indexOf("</style>");
			    			var bodyStart = lyric.indexOf("<body>");
			    			var bodyEnd = lyric.indexOf("</body>");
			    			var scriptStart = lyric.indexOf("<script>");
			    			var scriptEnd = lyric.indexOf("/"+"<script>");
			    			var style = lyric.substring(styleStart,(styleEnd+8));
			    			var body = lyric.substring(bodyStart,(bodyEnd+7));
			    			var scirpt = lyric.substring(scriptStart,(scriptEnd+9));
							//添加到弹出层的内容的div里面    			
			    			$(".popup .popup-content").append(style+body+scirpt);
							
			    		    /**叉号取消div
			    		    $(".popup .popup-title .title-right").click(function (){
			    		    	$("body").find(".zhezhao,.popup").remove();
			    		    });
			    		};
			    		//向服务器发送请求
			    		request.send();
			    	} */
		}
	});
});

/**不出ifame拖动*/
function mouseDown(){
	/**拖到效果开始*/
	$(".alert .alertTitle").mousedown(function (e){  //鼠标按下
		type = true;
		var e = e||window.event;
		startTop = e.clientY;
		startLeft = e.clientX;
		divTop = $(".alert").offset().top+90;  //因为 alert有个margin-top -90px; 所以要加90
		divLeft = $(".alert").offset().left+180;  //因为 alert有个margin-left -180px; 所以要加90
	});
	$(document).mouseup(function (){  //鼠标松开
		type = false;
	});
	$(document).mousemove(function (e){  //鼠标移动
		if(type){
			var e = e||window.event;
			var left = divLeft+(e.clientX-startLeft);
			var top = divTop+(e.clientY-startTop);
			if(left < 180){  //到了最左边
				left = 180;
			}
			if(top < 90){  //到了最上面  因为 alert有个margin-top -90px; 所以是90 不是0
				top = 90;
			}
			if(left+180 > $(window).width()){
				left = $(window).width()-180;
			}
			if(top+90 > $(window).height()){  //因为 alert有个margin-left-90px;  原先是160 现在是90
				top = $(window).height()-90;
			}
			$(".alert").css({"left":left+"px","top":top+"px"});
		} 
	});
	/**拖动效果结束*/
}

/**出ifame拖动*/
function mouseDownifame(){
	/**拖到效果开始*/
	$(parent.window.document.body).find(".alert .alertTitle").mousedown(function (e){  //鼠标按下
		type = true;
		var e = e||window.event;
		startTop = e.clientY;
		startLeft = e.clientX;
		divTop = $(parent.window.document.body).find(".alert").offset().top+90;//因为 alert有个margin-left-90px; 所以要加90
		divLeft = $(parent.window.document.body).find(".alert").offset().left;
	});
	$(parent.window.document).mouseup(function (){  //鼠标松开
		type = false;
	});
	$(parent.window.document).mousemove(function (e){  //鼠标移动
		if(type){
			var e = e||window.event;
			var left = divLeft+(e.clientX-startLeft);
			var top = divTop+(e.clientY-startTop);
			if(left < 180){  //到了最左边
				left = 180;
			}
			if(top < 90){  //到了最上面   因为 alert有个margin-left-90px; 所以是90 不是0
				top = 90;
			}
			if(left+180 > $(parent.window).width()){
				left = $(parent.window).width()-180;
			}
			if(top+90 > $(parent.window).height()){  //因为 alert有个margin-left-90px;  原先是160 现在是90
				top = $(parent.window).height()-90;
			}
			$(parent.window.document.body).find(".alert").css({"left":left+"px","top":top+"px"});
		} 
	});
	/**拖动效果结束*/
}


/**动态改变中间位置*/
function resize(){
	$(window).resize(function (){
		if($(".alert").length > 0){
			$(".alert").animate({"top":$(window).height()/2+"px"});
		}
	});
}


/**计算div居中  不出iframe  type 哪个方向 top left right buttom*/
function divCenter(type){
	var left = $(window).width()/2;
	var top = $(window).height()/2;
	//$(".alert").css({"left":left+"px","top":top+"px"});
	if(type == "left"){
		$(".alert").css({"left":"0","top":"50%"}).animate({"left":left+"px"});
	}else if(type == "top"){
		$(".alert").css({"top":"0","left":"50%"}).animate({"top":top+"px"});
	}else if(type == "right"){
		$(".alert").css({"right":"0","top":"50%"}).animate({"right":left-180+"px"});
	}else{
		$(".alert").css({"bottom":"0","left":"50%"}).animate({"bottom":top-90+"px"});
	}
	
	resize();  //动态改变中间位置
}

/**计算div居中  出iframe*/
function divCenterIframe(type){
	var left = $(parent.window).width()/2;
	var top = $(parent.window).height()/2;
	//$(parent.window.document.body).find(".alert").css({"left":left+"px","top":top+"px"});
	
	if(type == "left"){
		$(parent.window.document.body).find(".alert").css({"left":"0","top":"50%"}).animate({"left":left+"px"});
	}else if(type == "top"){
		$(parent.window.document.body).find(".alert").css({"top":"0","left":"50%"}).animate({"top":top+"px"});
	}else if(type == "right"){
		$(parent.window.document.body).find(".alert").css({"right":"0","top":"50%"}).animate({"right":left-180+"px"});
	}else{
		$(parent.window.document.body).find(".alert").css({"bottom":"0","left":"50%"}).animate({"bottom":top-90+"px"});
	}
	
	resize();  //动态改变中间位置
}

/**清除对话框*/
function removeDhk(){
	$(".alert").animate({"height":"0px"},function (){
		$(".mask").remove();
		$(".alert").remove();
	});
}

/**清除封住全屏*/
function removeQpDhk(){
	$(parent.window.document.body).find('.alert').animate({"height":"0px"},function (){
		$(parent.window.document.body).find('.mask').remove();
		$(parent.window.document.body).find('.alert').remove();
	});
}