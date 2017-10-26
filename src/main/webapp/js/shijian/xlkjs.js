
$(parent.window.document.body).find(".mask").remove();//取消遮罩层

$.xlkjs = function (options){
	var opts = $.extend({},$.xlkjs.method,options);
	var div = opts.div;
	$("."+div+"").css({"width":"152px","height":"30px","margin":"20px"});
	/**li 点击事件*/
    $("."+div+" ul li").click(function (){
       $("."+div+" input[type='hidden']").val($(this).data("val")); //赋值给传值的input
       $("."+div+" input[type='text']").val($(this).text());  //赋值给显示的input   鼠标点击的时候100毫秒后执行ul的hide方法 所以这里就不用写了
    });
	opts.defaultVal(div);
	opts.inputKeyUp(div);
};

$.xlkjs.method = {
	//如果刚进来有值  需要显示在下拉框里
	defaultVal:function (div){
		var hideVal =  $("."+div+" input[type='hidden']").val();
	    if(hideVal != ''){
	       $("."+div+" ul li").each(function (i,dq){
	          if($(dq).data("val") == hideVal){
	             $("."+div+" input[type='text']").val($(dq).text());
	          }
	       });
	    }
	},
	/**input 改变文本框事件*/
	inputKeyUp:function (div){
		$("."+div+" input").keyup(function (event){
			var e = event || window.event;
			var code = e.keyCode || e.which;
	        lishow(div,$(this).val());  //显示对应的数据
	        //监听键盘的上下键
	        //如果按了向下键 需要默认选中第一个
			if(code == 40){
				xia(div);
			};
			//向上
			if(code == 38){
				shang(div);
			}
			//回车
			if(code == 13){
				que(div);
			}
	     }).click(function (){
	        lishow(div,$("."+div+" input[type='text']").val());  //显示对应的数据
	     }).blur(function (){
	        setTimeout(function (){$("."+div+" ul").hide();},200);  //因为是先执行移走事件 在执行点击事件 这样点击li就不起作用  延迟200毫秒 就什么事都解决了
	     });
	},
};

/**根据input的内容显示对应的数据*/
function lishow(div,val){
   $("."+div+" ul").show();
   $("."+div+" ul li").hide();  //所以的li隐藏
   $("."+div+" ul li").each(function (i,vals){
      var lival = $(vals).text();
      if(lival.indexOf(val) != -1){  //符合条件的显示
         $(vals).show();
      }
   });
}

/**向下*/
function xia(div){
	var lis = $("."+div+"").find("ul li:visible");  //获取所有显示的li
	var li = 0;   //颜色背景的li的索引
	var xiaLength = 0;  //控制下拉框的高度
	$(lis).each(function (i,value){
		//先获取有背景颜色的id
		if(rgb2hex($(this).css("background-color")) == '#d2d2d2'){
			li = i+1;
			xiaLength = $(this).height();
		}
		$(this).css("background-color","");
	});
	if(li > 5){
		//50的值是算出的下一个li的高度的 
		$("."+div+" ul").scrollTop($("."+div+" ul").scrollTop()+xiaLength);
	}
	//设置背景颜色
	if(li < lis.length){  //不是最后一个
		$(lis[li]).css("background-color","#d2d2d2");
	}else{
		$(lis[lis.length-1]).css("background-color","#d2d2d2");
	}
}

/**向上*/
function shang(div){
	var lis = $("."+div+"").find("ul li:visible");
	var li = 0;   //颜色背景的li的索引
	var topLength = 0;  //控制下拉框的高度
	$(lis).each(function (i,value){
		//先获取有背景颜色的id
		if(rgb2hex($(this).css("background-color")) == '#d2d2d2'){
			li = i-1;
			topLength = $(this).height();
		}
		$(this).css("background-color","");
	});
	//设置滚动条  要不然看不到
	if(lis.length - li > 5){
		$("."+div+" ul").scrollTop($("."+div+" ul").scrollTop()-topLength);
	}
	//设置背景颜色
	if(li > 0){  //不是第一个
		$(lis[li]).css("background-color","#d2d2d2");
	}else{
		$(lis[0]).css("background-color","#d2d2d2");
	}
}

/**确定*/
function que(div){
	//获取有背景颜色的text文本
	var lis = $("."+div+"").find("ul li:visible");
	var text = "";
	var val = "";
	$(lis).each(function (i,value){
		//先获取有背景颜色的id
		if(rgb2hex($(this).css("background-color")) == '#d2d2d2'){
			text = $(this).text();
			val = $(this).data("val");
		}
	});
	if(val != ""){
		$("."+div+" input[type='text']").val(val);
	}
	//赋值
    $("."+div+" input[type='hidden']").val(val); //赋值给传值的input
    $("."+div+" input[type='text']").val(text);  //赋值给显示的input   鼠标点击的时候100毫秒后执行ul的hide方法 所以这里就不用写了
	//清楚拼出的下拉框
	$("."+div+" ul").hide();
	qcLiBackgrond(div);//清除选中的背景颜色 下次从头开始选择
}


/**清除li背景颜色  用于重新输入的时候 不至于原先的那个还是选中的*/
function qcLiBackgrond(div){
	$("."+div+" ul li").css("background","none");
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