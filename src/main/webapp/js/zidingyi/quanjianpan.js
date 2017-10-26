/**
 * 全键盘js 也就是按回车键光标自动定位到当前文本的下一个文本
 * @memberOf {TypeName} 
 */

var shuzu = new Array();  //页面上全部要绑定回车时间的id集合
var index = 0;//下一个聚焦的索引
$(function (){
	//所有的需要绑定事件的选择
	var obj = $("input[type='text'],select,input[type='radio']");

	//存储所有的id到数组里面
	$(obj).each(function(i,ob){
		shuzu[i] = $(ob).attr("id");
	});

	//循环数组
	for(var i=0;i<shuzu.length;i++){
		$("#"+shuzu[i]).keyup(function (event){
			var e = event || window.event;
			e.preventDefault();
			var code = e.keyCode || e.which;
			if(code == 13){
				var dqvalue = $(this).val();
				var type = $(this).attr("type");
				if(dqvalue == '' && type != 'radio'){
					alert("是空");
					$(this).focus();  //当前文本框聚焦
				}else{   //当前文本框的下一个文本框聚焦
					index++;
					$("#"+shuzu[index]).focus();
				}
			}
		});
		/**点击事件改变index的索引值*/
		$("#"+shuzu[i]).click(function (){
			var id = $(this).attr("id");
			fuzhi(id);
		});
	}
});

/**用于鼠标点击input改变index的值*/
function fuzhi(id){
	for(var i=0;i<shuzu.length;i++){
		if(id==shuzu[i]){
			index = i;
		}
	}
}