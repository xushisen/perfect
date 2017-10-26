/**
 * input框绑定下拉框事件
 
另外一种方法
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<head>
<script>
jQuery.fn.setApDiv=function () {
        //apDiv浮动层显示位置居中控制
        alert(this.attr("name"));
    }

function dianji(){
  $("#dd").setApDiv();
}
</script>
</head>
<body>

<a herf="#" id="dd" name="zhangll" onclick="dianji()">ssss</a>

</body>
</html>
*/

$(function (){
	jQuery.extend({
		setApDiv:function(id){
			//给this绑定keyup事件
			$("#"+id).keyup(function (event){
				var inputs = $(this);
				var e = event || window.event;
				e.preventDefault();
				//38 上  40下  绑定向下按钮事件
				var code = e.keyCode || e.which; 
				
				//获取当前input的宽度 
				var inputWidth = inputs.width();
				//获取当前input距页面左边的宽度
				var inputLeft = inputs.offset().left;
				//获取当前input距页面上边的宽度
				var inputTop = inputs.offset().top;
				if(inputs.val() == ''){
					//移出拼出的div
					$("#pin").remove();
					return;
				}
				if(code != 40 && code != 38 && code != 13){
					//异步请求数据
					$.ajax({
						type:"get",
						url:"https://sp0.baidu.com/5a1Fazu8AA54nxGko9WTAnF6hhy/su?wd="+inputs.val()+"&cb=?",
						dataType:"jsonp",
						success:function(date){
							var li = "";
							var dates = date.s;
							for(var i=0,j=dates.length;i<j;i++){
								//li += "<li><a href='https://www.baidu.com/s?word="+dates[i]+"'>"+dates[i]+"</a></li>";
								//li += "<li onclick=\"copyVal('"+id+"','"+dates[i]+"')\">"+dates[i]+"</li>";
								li += "<li>"+dates[i]+"</li>";
							}
							$("#pin").remove();
							inputs.parent().append("<div id='pin' class='kuang'><ul>"+li+"</ul></div>");
							$("#pin").width(inputWidth);
							//定位div到当前input的正下面
							$("#pin").css({position: "absolute",'top':inputTop+20,'left':inputLeft,'z-index':2});
							
							/**给拼出的下框li绑定onclick事件*/
							$("#pin ul li").each(function (){
								$(this).click(function (){
									$("#"+id).val($(this).text());
									//移出拼出的下拉框
									$("#pin").remove();
								});
							});
						},
						error:function(){
							
						}
					});
				}
				
				//如果按了向下键 需要默认选中第一个
				if(code == 40){
					xia();
				};
				//向上
				if(code == 38){
					shang();
				}
				//回车
				if(code == 13){
					que(id);
				}
			});
		}
	});
});

/**向下*/
function xia(){
	var lis = $("#pin").find("ul li");  //获取所有的拼出的li元素
	var li = 0;   //颜色背景的li的索引
	var xiaLength = 0;  //控制下拉框的高度
	$(lis).each(function (i,value){
		//先获取有背景颜色的id
		if(rgb2hex($(this).css("background-color")) == '#888888'){
			li = i+1;
			xiaLength = $(this).height();
		}
		$(this).css("background-color","");
	});
	if(li > 2){
		//50的值是算出的下一个li的高度的 
		$("#pin").scrollTop($("#pin").scrollTop()+xiaLength);
	}
	//设置背景颜色
	if(li < lis.length){  //不是最后一个
		$(lis[li]).css("background-color","#888888");
	}else{
		$(lis[lis.length-1]).css("background-color","#888888");
	}
}

/**向上*/
function shang(){
	var lis = $("#pin").find("ul li");
	var li = 0;   //颜色背景的li的索引
	var topLength = 0;  //控制下拉框的高度
	$(lis).each(function (i,value){
		//先获取有背景颜色的id
		if(rgb2hex($(this).css("background-color")) == '#888888'){
			li = i-1;
			topLength = $(this).height();
		}
		$(this).css("background-color","");
	});
	//设置滚动条  要不然看不到
	if(li < 8){
		$("#pin").scrollTop($("#pin").scrollTop()-topLength);
	}
	//设置背景颜色
	if(li > 0){  //不是第一个
		$(lis[li]).css("background-color","#888888");
	}else{
		$(lis[0]).css("background-color","#888888");
	}
}

/**确定*/
function que(id){
	//获取有背景颜色的text文本
	var lis = $("#pin").find("ul li");
	var val = "";
	$(lis).each(function (i,value){
		//先获取有背景颜色的id
		if(rgb2hex($(this).css("background-color")) == '#888888'){
			val = $(this).text();
		}
	});
	if(val != ""){
		$("#"+id).val(val);
	}else{
		$("#"+id).val($("#"+id).val());
	}
	//清楚拼出的下拉框
	$("#pin").remove();
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
