var rightDiv = "<div class='caidan'><ul></ul></div>";
var xzColor = "#bac3c3";  //选中的背景颜色

$.rightClick = function (options){
	/**var zhi = {
		save: function(){},
		edit: function(){}
	};*/
	var opts = $.extend({},options);
	var val = opts.val;
	var vals = val.split(",");
	$("body").append(rightDiv);
	for(var i=0;i<vals.length;i++){  //拼出li
		$(".caidan ul").append("<li>"+vals[i]+"</li>");
	}
	//为li绑定事件
	$(".caidan ul li").each(function (){
		$(this).click(function (){
			var vall = $(this).text();
			if(vall == '新增'){
				(opts.save)("我是回掉方法并且带有回掉参数的");
			}else if(vall == '编辑'){
				(opts.edit)();
			}else if(vall == '删除'){
				(opts.dele)();
			}else if(vall == '报关'){
				(opts.baoguan)();
			}
			$(".caidan").css({"display":"none"});
		});
	});
};

var crtlKey = false,shiftKey = false;
var firstIndex,lastIndex;
/**阻止鼠标右键*/
$(document).bind("contextmenu",function(e){   
      return false;   
});

/**重新为表格绑定鼠标右键*/
$(".table tr:not(:first)").mousedown(function(e) {
	if(e.which == 3){  //鼠标右键
		$(".caidan").css({"display":"block","position":"fixed","top":e.clientY+"px","left":e.clientX+"px"});
	};
	if(e.which == 1){  //左键移出
		$(".caidan").css({"display":"none"});
	};
});

/**监听是否按了shift键*/
$(document).keydown(function (e){
	var e = e || event;
	if(e.keyCode == 17){  //crtl
		crtlKey = true;
	}else if(e.keyCode == 16){
		shiftKey = true;
	}
}).keyup(function (){
	crtlKey = false;
	shiftKey = false;
	firstIndex = undefined;
	lastIndex = undefined;
});

/**绑定复选框的选中事件  点击复选框的时候
$(".table tr td .checkK").each(function (){
    $(this).click(function (){
    	console.log("kuang");
        var len = $(this).children().length;
        if(len == 0){  //没有选中
           var div = "<div class='checkK_dian'></div>";
           $(this).append(div);
        }else{  //选中
           $(this).children(".checkK_dian").remove();
        }
    });
});*/

/**绑定复选框的选中事件  点击tr的时候*/
 $(".table tr:not(:first)").each(function (e){
	//判断是否按了shift 或 ctrl
	$(this).click(function (){
		if(crtlKey){  //crtl 键
        	var len = $(this).find("td:first").find(".checkK").children().length;
        	if(len == 0){  //没有选中
        	   tjbackground($(this).index()+1);
            }else{  //选中
               qxbackground($(this).index()+1);
            }
		}else if(shiftKey){
			//首先清除所有的  然后获取按住shift的第一个  再获取最后一个  循环选中
			quanxiao();  //清除之前选中的
			if(typeof(firstIndex) == "undefined"){
				firstIndex = $(this).index();
				$(".table tr:not(:first):eq("+firstIndex+")").find("td:first").find(".checkK").append("<div class='checkK_dian'></div>");
				$(".table tr:not(:first):eq("+firstIndex+")").css("background",xzColor); //背景颜色
			}else{
				lastIndex = $(this).index();
			}
			if(typeof(firstIndex) != "undefined" && typeof(lastIndex) != "undefined"){
				shiftCheck(firstIndex,lastIndex);
			}
		}else{
			var len = $(this).find("td:first").find(".checkK").children().length;
			if(len == 0){  //没有选中
			   quanxiao();  //清除之前选中的
			   tjbackground($(this).index()+1);
            }else{  //选中
            	//这里需要判断当前页面是不是选中了多个  如果是多个  则需要另外处理
            	var vals = hiddenVal().split(",");
            	if(vals.length > 2){  //页面已经选中了多个  主要是用来处理按住ctrl选中了多个 然后不按ctrl点击已经选中的  会只消除选择的那个 这个应该是按住ctrl的功能
        			//说白了就是当前行选中  其余全部隐藏
            		quanxiao();
                    var div = "<div class='checkK_dian'></div>";
                    $(this).find("td:first").find(".checkK").append(div);  //红色框
                    $(this).css("background",xzColor); //背景颜色
            	}else{
            		qxbackground($(this).index()+1);
            	}
            }
		}
	});
 });

 
/**
 *firstIndex  前面的值  lastIndex 后面的值
 */
function shiftCheck(firstIndex,lastIndex){
	var div = "<div class='checkK_dian'></div>";
	if(firstIndex < lastIndex){  //向下
		$(".table tr:not(:first):lt("+(lastIndex+1)+")").find("td:first").find(".checkK").append(div);
		$(".table tr:not(:first):lt("+(lastIndex+1)+")").css("background",xzColor);
		$(".table tr:not(:first):lt("+(firstIndex)+")").find("td:first").find(".checkK").children(".checkK_dian").remove();
		$(".table tr:not(:first):lt("+(firstIndex)+")").each(function (){
			var index = $(this).index()+1;
			index%2 == 0 ? $(this).css("background","#e7eeee") : $(this).css("background","#fff");  //恢复背景色
		});
	}else{  //向上
		var eindex = lastIndex-1;
	    if(eindex == -1){
	    	eindex = 0;
	    	$(".table tr:not(:first):eq("+eindex+")").find("td:first").find(".checkK").append(div);
	    	$(".table tr:not(:first):eq("+eindex+")").css("background",xzColor);
	    }
		$(".table tr:not(:first):gt("+(eindex)+")").find("td:first").find(".checkK").append(div);
		$(".table tr:not(:first):gt("+(eindex)+")").css("background",xzColor);
		$(".table tr:not(:first):gt("+(firstIndex)+")").find("td:first").find(".checkK").children(".checkK_dian").remove();
		$(".table tr:not(:first):gt("+(firstIndex)+")").each(function (){
			var index = $(this).index()+1;
			index%2 == 0 ? $(this).css("background","#e7eeee") : $(this).css("background","#fff");  //恢复背景色
		});
	}
}

/**全选全消*/
function xuan(obj){
   var val = $(obj).text();
   if(val == "全选"){
      quanxuan();
      $(obj).text("全消");
   }else{
      quanxiao();
      $(obj).text("全选");
   }
}

/**全选*/
function quanxuan(){
   $(".table .checkK").each(function (){
       var div = "<div class='checkK_dian'></div>";
       $(this).append(div);
   });
}

/**全消*/
function quanxiao(){
   $(".table .checkK").each(function (){
       $(this).children(".checkK_dian").remove();
   });
   //恢复表格的隔行换色
   hf();
}

/**获取值*/
function hiddenVal(){
   var retu = "";
   $(".table .checkK").each(function (){
      if($(this).children().length == 1){  //==1是选中
         retu += $(this).data("num")+",";
      }
   });
   return retu;
}

/**恢复table的初始颜色*/
hf();
function hf(){
	$(".table tr:not(:first)").css("background","#fff");  //全部改为白色
	$(".table tr:not(:first):odd").css("background","#e7eeee"); //偶数的改为
}

/**tr添加背景颜色和前面红色的选中框*/
function tjbackground(index){
	 var div = "<div class='checkK_dian'></div>";
     $(".table tr:eq("+index+")").find("td:first").find(".checkK").append(div);  //红色框
     $(".table tr:eq("+index+")").css("background",xzColor); //背景颜色
}

/**tr取消背景颜色和前面红色的选中框*/
function qxbackground(index){
	$(".table tr:eq("+index+")").find("td:first").find(".checkK").children(".checkK_dian").remove(); //移出红色点
	index%2 == 0 ? $(".table tr:eq("+index+")").css("background","#e7eeee") : $(".table tr:eq("+index+")").css("background","#fff");  //恢复背景色
}

/**隔行换色*/
$(".table tr:not(:first)").hover(function (){
	/**var index = $(this).index();
	index%2 ==0 ? $(this).css("background","#fff") : $(this).css("background","#e7eeee");*/
},function (){
	/**var index = $(this).index();
	index%2 ==0 ? $(this).css("background","#fff") : $(this).css("background","#e7eeee");*/
});