/**
 * 改变引入的css样式
 * var oLink=document.getElementById('gb');
 * oLink.href="/zacloud/css/zidingyi.min1.css";
 */

var url = "";  //换肤图片的地址
/**
 * 弹出换肤的div
 */
function hf(){ 
	divOut(true);
}

/**
 * 确定换肤 true 确定 false 取消
 * 
 * @param flag
 */
function qdhf(flag){
	if(flag){
		if(url != ""){
			$("body").css("background","url('images/"+url+".png')").css("background-size","cover");
			$.ts({"width":"140px","height":"30px","color":"#fff","content":"皮肤应用成功","type":"Left","backgroundColor":"green","direction":"around","date":"2000"});
		}
		divOut(false);
		url = "";
	}else{
		$.tConfirm({
			content:"确定取消?",
			title:"系统提示",
			direction:"right",  //从哪个方向出来  top left right bottom
			sfqp:false,   //true 需要跳出ifame封住全屏
			yes:function(){
  				$(".index_hf_img ul li").find(".xuanzhong").remove();
  				divOut(false);
			},
			no:function(){
			}
		});
	}
}

/**
 * 移出换肤div flag true 显示  false 隐藏
 * 
 * @param flag
 */
function divOut(flag){
	var hf = "<div class=\"index_hf\"></div><div class=\"index_hf_img\"><ul><li data-src=\"bj_2\"><img src=\"images/bj_2.png\" width=\"200px\" height=\"100px\" alt=\"换肤图片\" /></li><li data-src=\"bj_1\"><img src=\"images/bj_1.png\" width=\"200px\" height=\"100px\" alt=\"换肤图片\" /></li></ul><div class=\"index_hf_butt\"><a href=\"javascript:;\" onclick=\"qdhf(true)\">确定</a><a href=\"javascript:;\" onclick=\"qdhf(false)\">取消</a></div></div>";
	if(flag){
		 $("body").append(hf);
		 liClick();
		 $(".index_hf").fadeIn("slow");
		 $(".index_hf_img").fadeIn("slow");
	}else{
		$(".index_hf").fadeOut("slow",function(){$(this).remove();});
		$(".index_hf_img").fadeOut("slow",function(){$(this).remove();});
	}
}

/**
 * li绑定事件
 */
function liClick(){
	$(".index_hf_img ul li").each(function (){
		$(this).click(function (){
			//移出所以的对号
			$(".index_hf_img ul li").find(".xuanzhong").remove();
			var duihao = "<div class=\"xuanzhong\"><span></span></div>";
			$(this).append(duihao);
			url = $(this).data("src");
		});
	});
}

/**改变页面触犯的事件*/
/**$(window).resize(function (){
	var height = $(window).height();
	if(height < 510){
		//上边隐藏
		$(".indexTop").animate({"height":"20px"});
		$(".indexZhong").animate({"height":"calc(100% - 135px)"});
	}else{
		$(".indexTop").animate({"height":"65px"});
		$(".indexZhong").animate({"height":"calc(100% - 95px)"});
	}
});*/

/**
 * 退出
 */
 function exit(){
	$.tConfirm({
		content:"真的要离开了吗?",
		title:"您确定退出吗",
		sfqp:false,   //true 需要跳出ifame封住全屏
		direction:"top",  //从哪个方向出来  top left right bottom
		yes:function(){
			 $.ajax({
				 url:getRootPath()+"/exit",
				 type:"post",
				 dataType:"text",
				 success:function(data){
					 if(data == "success"){
					 	 $.ts({"width":"140px","height":"30px","color":"#fff","content":"成功退出","backgroundColor":"green","type":"Left","direction":"around","date":"5000"});
						 setTimeout(function (){window.location.href=getRootPath()+"/";},1500);
					 }else{
						 $.ts({"width":"140px","height":"30px","color":"#fff","content":"退出失败","backgroundColor":"green","type":"Left","direction":"around","date":"5000"});
					 }
				 },
				 error:function (){
					$.ts({"width":"140px","height":"30px","color":"#fff","content":"网络错误 请稍后重试","backgroundColor":"green","type":"Left","direction":"around","date":"5000"});
				 }
			 });
		},
		no:function(){
			
		}
	});
 }
 
/**
 * 个人信息
 */
function grxx(){
	$.jAlert({
		title:"温馨提示",
		content:"该功能正在开发中,敬请期待^_^",
		sfqp:false,   //true 需要跳出ifame封住全屏
		direction:"left",
		qd:function (){
		}
	});
}

/**放在名字上面悬浮退出等按钮  S*/
var xfds;
$(".name").hover(function (){
	$(".n_xx").fadeIn();
},function (){
	xfds = setTimeout(function (){$(".n_xx").fadeOut();},100);
});

$(".n_xx").hover(function (){
	clearTimeout(xfds);
},function (){
	$(this).fadeOut();
});
/**放在名字上面悬浮退出等按钮  E*/

/**left 点击 */
$("#menu > li > ul > li a").each(function (){
	$(this).click(function(event){
		event.stopPropagation();  //阻止冒泡
		$("#menu ul li").css("background",""); //当前背景色清空
		$(this).parent().css("background","rgba(255,255,255,.3)");  //当前背景色
		var text = $(this).text();
		if (text != "京东") {
			$.jzjd({"divId":"right"});  //打开遮罩
		}
		$("#Conframe").css({"background":"#fff"});  //改变ifarme背景为白色
		
		//给iframe赋值
		var textarr = new Array();  //存储所以显示的tables
		$(".tables-coll ul li").removeClass("xz");
		$(".tables-coll ul li a").each(function (){
			textarr.push($(this).text());
		});
		var index = textarr.indexOf($(this).text());  //index就是第几个li
		if(index != -1){  //有打开的
			var li = $(".tables-coll ul li:eq("+index+")");
			li.addClass("xz");
			$("#Conframe").attr("src",li.find("a").data("src"));
		} else {
			var src = $(this).data("url");
			$("#Conframe").attr("src",src);
			var li = "<li class=\"xz\"><a href=\"javascript:;\" data-src=\""+src+"\">"+$(this).text()+"</a><i class=\"fa fa-close\" title=\"关闭\"></i></li>";
			$(".tables-coll ul").append(li);
			pinliClick();
			pinchaClick();
		}
	});
});

/**左边菜单点击事件 S*/
var div1 = "<div class='szj'><div class='h'></div><div class='w'></div></div>";
var div2 = "<div class='szj'><div class='w'></div></div>";

$("#menu > li").prepend(div1);  //默认全部加号
$("#menu > li").click(function (){
    $(this).find("a").next().toggle(300,function(){
    	$(this).parent().find("div").remove();//移出当前点击li里面的div 要不然加号减号一直拼接
    	var flag = $(this).is(":hidden");  //true 隐藏 false不隐藏
    	if(flag) $(this).parent().prepend(div1);
    	else $(this).parent().prepend(div2);
    });
    
	//清除所有的第一个li的背景色 添加到当前点击的上面
	$("#menu > li > a").css("background","");
	//添加当前的背景色
	$(this).children("a").css("background","rgba(255,255,255,.3)");  //当前背景色
	
    var obj = $("#menu > li").not($(this)); //除了当前li对象的所有对象
    obj.find("ul").hide(). //隐藏所有的ul
    		end().find("div").remove().  //移出所有的加号减号
    		end().prepend(div1); //变成加号
 });
/**左边菜单点击事件 E*/

/**点击tables S*/
//拼出的li点击
function pinliClick(){
	$(".tables-coll ul li a").click(function (){
		$(this).parent().siblings().removeClass("xz");
		$(this).parent().addClass("xz");
		var src = $(this).data("src");
		$("#Conframe").attr("src",src);
	});
}

//拼出出叉号点击
function pinchaClick(){
	$(".tables-coll ul li i").click(function (){
		var next = $(this).parent().next();
		if ($(this).parent().hasClass("xz")){  //移出的是当前显示的标签页
			var url = "";
			if(next.html() != null){ //向后
				$(this).parent().next().addClass("xz");
				url = $(this).parent().next().find("a").data("src");
			} else {  //向前
				$(this).parent().prev().addClass("xz");
				url = $(this).parent().prev().find("a").data("src");
			}
			$("#Conframe").attr("src",url);
			$(this).parent().remove();
		} else {
			$(this).parent().remove();
		}
	});
}
/**阻止鼠标右键*/
$(document).bind("contextmenu",function(e){   
      return false;   
});

/**重新为表格绑定鼠标右键*/
$(".tables-coll").mousedown(function(e) {
	if(e.which == 3){  //鼠标右键
		var buffer = new StringBuffer();
		$(".tablesyj").remove();
		buffer.append("<div class=\"tablesyj\" style=\"width:100px;background:rgba(0,0,0,.7);text-align:center;border-radius:3px;position:fixed;top:"+e.clientY+"px;left:"+e.clientX+"px\">")
			  .append("	  <a href=\"javascript:;\" style=\"display:inline-block;width:100%;color:#fff;height:30px;line-height:30px;text-decoration:none;\" onclick=\"removeAllTables()\">全部移出</a>")
		      .append("</div>");
		$("body").append(buffer.toString());
	};
	if(e.which == 1){  //左键移出
		$(".tablesyj").remove();
	};
});

/**
 * 全部移出点击事件 
 */
function removeAllTables(){
	$('.tables-coll ul li:not(:first)').remove();$('.tablesyj').remove();$('#Conframe').attr('src','readme');
}
/**点击tables S*/