/**
 * version 1.0.2
 *
 *	新加的功能
 *	英文歌词需要翻译的功能  223关于sffy变量的
 *  去掉歌词里面的空格  189的for循环
 *	添加了上一首 下一首的功能
 *	时间变动
 * @memberOf {TypeName} 
 */

var audio,firstMusic;  //firstMusic 当前播放的音乐
var syssz = new Array();  //记录上一首的歌曲名字  只限于5个
var shubiao = false;  //记录鼠标是否按下  用于拖拽歌词用

 $(function (){
	 //默认播放按钮隐藏
	$(".zong .right .cz .yuan #bf").hide();
				
	/**读取歌曲列表*/
	readList();
	
	cj("../music/mp3/"+firstMusic+".mp3");
	
	/**改变暂停播放*/
	$(".yuan").click(function (){
		//判断当前是那个按钮显示
		var bf = $(".zong .right .cz .yuan #bf");  //播放
		var zt = $(".zong .right .cz .yuan #zt");  //暂停
		var status = bf.is(":hidden");  //播放按钮是否隐藏  true 隐藏 false 显示
		if(status){  //隐藏 需要显示  播放暂停
			zt.hide();  //暂停显示 
			bf.show();
			audio.pause();  //播放暂停
		}else{
			zt.show();  
			bf.hide();
			audio.play();  //播放开始
		}
	});
	
	/**上一首点击事件*/
	$(".top").click(function (){
		sysjy();
	});
	
	/**下一首播放*/
	$(".buttom").click(function (){
		//下一首
		nextGq();
	});
				
	/**改变播放模式*/
	$("#bfms").click(function (){
	    var val = $(this).html();
		if(val == '循环'){
			$(this).html("随机");
		}else if(val == '随机'){
			$(this).html("单曲");
		}else if(val == '单曲'){
			$(this).html("循环");
		}
		//弹出播放模式的框框
		tcBfms();
	});
 });
 
/**读取文件列表*/ 
function readList(){
	//建立一个XMLHttpRequest请求
	var request = new XMLHttpRequest();
	//配置, url为歌词地址，比如：'./content/songs/foo.lrc'
	request.open('GET', "../music/liebiao.json", false);
	//一旦请求成功，但得到了想要的歌词列表
	request.onload = function() {
		//这里获得歌词文件
		var gc = JSON.parse(request.responseText).data;
		firstMusic = gc[0].song_ename;  //赋值歌曲的第一个	
		gc.forEach(function (v /*数组元素值*/ , i /*元素索引*/ , a /*数组本身*/){
			var li = "<li id='"+v.song_ename+"' title='"+v.song_name+"'>"+v.song_name+"</li>";
			$(".left ul").append(li);
		});
		//给li添加绑定事件
		$('.left').delegate("li","click",function(){
			 //先添加歌曲到上一首数组  再进行下面的操作
			 sys();
			 audio.setAttribute('src', "../music/mp3/"+$(this).attr('id')+".mp3"); //切换歌曲
			 firstMusic = $(this).attr('id');  //改变当前播放音乐
			 $('.gc ul').empty(); //清空歌词 
			 dqgc("../music/lrc/"+$(this).attr('id')+".lrc");//加载当前的歌词
			 //默认选中
			 listBf();
		});
		//默认选中
		listBf();
	};
	//向服务器发送请求
	request.send();
}
 
/**********************************************************************************/
/**当前播放的歌曲在list选中  主要针对自动播放  点击事件直接给颜色 */
function listBf(){
	//循环页面上left所有li
	$(".left ul li").each(function (i){
		if(firstMusic == $(this).attr('id')){  //当前播放
			$(this).css("color","#91CA0B");
		}else{
			$(this).css("color","");
		}
	});
};

/**播放下一个歌曲*/
function nextGq(){
	//先添加歌曲到上一首数组  再进行下面的操作
	sys();
	var bfms = $("#bfms").html();
	if(bfms == "循环"){
		xhbf();
	}else if(bfms == "随机"){
		sjbf()
	}else if(bfms == "单曲"){
		//获取当前播放的
		bfyy(firstMusic);
	}
}

/**循环播放*/
function xhbf(){
	var nextIndex = "";  //当前播放歌曲对应的li
	$(".left ul li").each(function (i){
		//获取当前歌曲firstMusic对应left的第几个li
		if(firstMusic == $(this).attr('id')){
			nextIndex = i+1;
		}
	});
	var nextText = $('.left ul li:nth-child('+(nextIndex+1)+')').attr('id');
	if(nextText != undefined){  //不是最后一首
		bfyy(nextText);
	}else{  //是最后一首
		bfyy($('.left ul li:nth-child('+(1)+')').attr('id'));
	}
}

/**随机播放*/
function sjbf(){
	//获取列表的个数  取随机数有用到
	var lbLength = $(".left ul li").length;
	var nextIndex = Math.round(Math.random()*lbLength+1);  //这里加了1  会有大于lbLength的情况  判断如果大于lbLength 让选择列表的最后一个播放
	if(nextIndex < lbLength){
		bfyy($('.left ul li:nth-child('+(nextIndex)+')').attr('id'));
	}else{
		bfyy($('.left ul li:nth-child('+(lbLength)+')').attr('id'));
	}
}

/**根据传入的参数播放音乐*/
function bfyy(nextIndex){
	audio.setAttribute('src', "../music/mp3/"+nextIndex+".mp3");
	firstMusic = nextIndex;  //改变当前播放音乐
	$('.gc ul').empty(); //清空歌词 
	dqgc("../music/lrc/"+nextIndex+".lrc");//加载当前的歌词
	//默认选中
	listBf();
}

/**记录上一首*/
function sys(){
	if(syssz.length > 5){
		syssz.slice(1);  //移出第一个
	}
	syssz.push(firstMusic);  //添加到数组
}

/**上一首移出最后一个元素 并且判断数组有没有移玩  移玩了默认根据下面的模式去播放*/
function sysjy(){
	//判断数组里面还有没有  没有默认根据下面的模式去播放
	console.log(syssz.length);
	if(syssz.length == 0){
		nextGq();
	}else{
		//执行上一首操作
	    //从全局变量的数组中获取最后一个播放
		//播放音乐
		console.log(syssz[syssz.length-1]);
		bfyy(syssz[syssz.length-1]);
		syssz.pop();  //移除最後一元素
	}
}
/**********************************************************************************/

 
//创建
function cj(url){
	 //替换歌词背景
	 audio = document.createElement('audio');
	 audio.setAttribute('src', url); //打开自动播放
	 audio.setAttribute('autoplay', 'autoplay'); //打开自动播放
	 dqgc(url.replace(".mp3",".lrc").replace("mp3","lrc"));
}
 
//读取歌词
function dqgc(url){
	$(".gc ul").append("<li>正在加载歌词  请稍后。。。</li>");
	//建立一个XMLHttpRequest请求
	var request = new XMLHttpRequest();
	//配置, url为歌词地址，比如：'./content/songs/foo.lrc'
	request.open('GET', url, true);
	//因为我们需要的歌词是纯文本形式的，所以设置返回类型为文本
	request.responseType = 'text';
	//一旦请求成功，但得到了想要的歌词了
	request.onload = function() {
		//这里获得歌词文件
		var lyric = request.response;
		//处理歌词
		clgc(lyric);
	};
	//向服务器发送请求
	request.send();
} 
 
//处理歌词
function clgc(text){
	if(text != ""){
		//将文本分隔成一行一行，存入数组
		var lines = text.split('\n'),
		//用于匹配时间的正则表达式，匹配的结果类似[xx:xx.xx]
		pattern = /\[\d{2}:\d{2}.\d{2}\]/g,
		//保存最终结果的数组
		result = [];
		//去掉不含时间的行  这针对前几行
		while (!pattern.test(lines[0])) {
			lines = lines.slice(1);
		};
		//去掉空行
		for(var i=0,j=lines.length;i<j;i++){
			if(lines[i] == ''){
				lines.splice(i,1);
			}
		}
		//上面用'\n'生成生成数组时，结果中最后一个为空元素，这里将去掉
		lines[lines.length - 1].length === 0 && lines.pop();
		lines.forEach(function(v /*数组元素值*/ , i /*元素索引*/ , a /*数组本身*/ ) {
		//提取出时间[xx:xx.xx]
		var time = v.match(pattern),
			//提取歌词
		value = v.replace(pattern, '');
		//因为一行里面可能有多个时间，所以time有可能是[xx:xx.xx][xx:xx.xx][xx:xx.xx]的形式，需要进一步分隔
		time.forEach(function(v1, i1, a1) {
			//去掉时间里的中括号得到xx:xx.xx
			var t = v1.slice(1, -1).split(':');
			//将结果压入最终数组
			result.push([parseInt(t[0], 10) * 60 + parseFloat(t[1]), value]);
			});
		});
		//最后将结果数组中的元素按时间大小排序，以便保存之后正常显示歌词
		result.sort(function(a, b) {
			return a[0] - b[0];
		});
	}
	//放置歌词
	fzgc(result);
	//return result;
}
	
//放置歌词
function fzgc(result){	
	//清除一次ul 因为上面有拼一个正在加载的字
	$(".gc ul").empty();
	var sffy = true;  //true 不翻译  false翻译
	if(typeof(result) != "undefined"){
		result.forEach(function(v, i, a) {
			li=$('<li>'+v[1]+'</li>'); 
			$(".gc ul").append(li);
			if(sffy){  //判断有没有歌词时间是一样的 有证明歌词需要翻译
				if(result[(i+1)] != undefined){
					if(result[i][0] == result[(i+1)][0]){  //判断歌词里面有没有时间一样的 一样赋值false  下面歌词高亮取消要减法-1
						sffy = false;
					}
				}
			}
		});
	}
	
	audio.ontimeupdate = function(e) {
		//获取到距离现在播放的时间
		var dtDate = formatTime(audio.currentTime);
		var zdDate = dtDate.substring(0,dtDate.indexOf("."));  //走动时间
		//处理时间拼到页面
		$(".dateBd").html(zdDate);
		//时间百分比
		var dqDate = dateBfb(zdDate);
		//进度条
		jdtBfb(dqDate);
		if(typeof(result) != "undefined"){
			var z = 0;  //记录循环中与当前时间相比最大的那个 也就是要操作的那行
			for (var i = 0, l = result.length; i < l; i++) {
				if (this.currentTime /*当前播放的时间*/ > result[i][0]) {
					//赋值z是为了移动
					z = i;
				}
			}
			//向上移动
			$('.gc ul').css('top',-z*40+200+'px'); //让歌词向上移动
			//给当前的变成白色
			if(sffy){  //不翻译
				//高亮显示当前播放的哪一句歌词
				$('.gc ul li:nth-child('+(z)+')').removeClass('colors');
				$('.gc ul li:nth-child('+(z+1)+')').addClass('colors');
			}else{  //翻译
				//高亮显示当前播放的哪一句歌词
				$('.gc ul li:nth-child('+(z)+')').removeClass('colors');
				$('.gc ul li:nth-child('+(z-1)+')').removeClass('colors');
				$('.gc ul li:nth-child('+(z+1)+')').addClass('colors');
				$('.gc ul li:nth-child('+(z+2)+')').addClass('colors');
			}
		}else{
			$('.gc ul').empty().append("歌词加载失败...");
		}
		//判断歌曲是否播放完毕
		if(audio.ended){
			z = 0;
			nextGq();  //下一首
		}
	};
	//赋值当前歌曲的时间到页面
	dqgqTime();
	//一直变的时间
	$(".dateBd").html(formatTime(0));  //主要是00:0
}

/**获取当前歌曲的播放时间  赋值到页面*/
function dqgqTime(){
	//截取时间拼到页面
	setTimeout(function (){
	var date = audio.duration;
	var dateh = formatTime(date);
	var datess = (dateh.substring(0,dateh.indexOf(".")));
	$(".dateBb").html(datess);
	},200);  //必须给点时间 要不然获取不到时间
}

/*
 * 将秒数格式化时间
 * @param {Number} seconds: 整数类型的秒数
 * @return {String} time: 格式化之后的时间
 */ 
function formatTime(seconds) {
	var min = Math.floor(seconds / 60),
		second = seconds % 60,
		hour, newMin, time;

	if (min > 60) {
		hour = Math.floor(min / 60);
		newMin = min % 60;
	}

	if (second < 10) { second = '0' + second;}
	if (min < 10) { min = '0' + min;}

	return time = hour? (hour + ':' + newMin + ':' + second) : (min + ':' + second);
}

/**点击播放模式的时候  在页面的正中间弹出一个框  显示播放模式  2秒后消失*/
function tcBfms(){
	var val = $("#bfms").html();
	var $div = $("<div id='tcbfms'>"+val+"播放</div>");
	$div.css({
		"width":"100px",
		"height":"30px",
		"background":"rgba(100,100,100,0.5)",
		"position":"absolute",
		"left":"50%",
		"top":"50%",
		"text-align":"center",
		"line-height":"30px"
	});
	
	if($("#tcbfms").length == 0){  //页面上没有
		$("body").append($div);
	}else{  //页面上有只需要改变id为tcbfms的val值
		$("#tcbfms").html(val+"播放");
	}
	
	//2秒后自动移出
	var time = setTimeout(function (){$("#tcbfms").remove();},2000);
}

///////////////////////////////////进度条开始/////////////////////////////////////////////

/**
 * 根据传入的时间 算出百分比
 * @param {Object} dqDate
 */
function dateBfb(dqDate){
	var zDate = $(".dateBb").html(); //总时间
	var dqsj = fzMs(dqDate);
	var zsj = fzMs(zDate);
	//算百分比
	if(zsj){  //有总时间 //转成成秒数  求百分比
		return (dqsj*100)/zsj;
	}
	return "";
}

/**
 * 算出当前时间在480px的百分比
 * @param {Object} dqDate
 */
function jdtBfb(dqDate){
	var jdtWidth = $(".dateJd").width();
	if(dqDate != ''){
		//截取小数点前面的
		var dqBfb = Math.round(dqDate);
		var bgb = Math.round(dqDate*(jdtWidth/100));
		//改变进度条黄色的宽度
		$(".dateJdZd").css("width",bgb+"px");
		//改变圆圈的left
		$(".quan").css("left",bgb+"px");
	}
}

/**
 * 分钟转成秒
 */
function fzMs(date){
	var dates = date.split(":");
	var fen = dates[0];
	var miao = dates[1];
	return parseInt(fen)*60+parseInt(miao);
}

/**
 * 拖到进度条触犯的事件
 */
$(".dateJd").click(function (e){
	var e = e || window.event;
	var x = e.offsetX;
	//计算时间的百分比
	var xx = tdJdtBfb(x);
	tdJdtDate(xx);
	
	//这里要清除下歌词里面唱到当前的那个高亮  不然快进快退那个高亮还在
	$(".gc ul li").removeClass('colors');
});

/**
 * 获取拖到进度条的像素  算出百分比
 * x 点击进度条的像素
 */
function tdJdtBfb(x){
	var jdtWidth = $(".dateJd").width();
	return Math.round((x*100)/parseInt(jdtWidth));
}

/**
 * 根据拖动的像素的百分比算出对应的时间百分比
 * jdtBfb 根据点击宽度算出的百分比
 */
function tdJdtDate(jdtBfb){
	var zDate = $(".dateBb").html(); //总时间
	var zmiao = fzMs(zDate);  //吧总时间转化成秒
	//算出jdtBfb 所对应的时间  //也就是求出zmiao的百分之jdtBfb是多少
	var xiaoshudian = jdtBfb<10 ? "0.0" : "0.";
	var dateBfb = Math.round(zmiao*(xiaoshudian+jdtBfb));  //要改变播放的时间
	audio.currentTime = dateBfb;
}

/**
 * 进度条拖动事件
 */
/**$(".quan").mousedown(function (event){
	var e = e || event;
	e.stopPropagation();
	console.log("按下");
	shubiao = true;
});
$(".dateJd").mousemove(function (){
	if(shubiao){
		console.log("拖动拖动拖动拖动");
	}
});
$(".quan").mouseup(function(event){
	var e = e || event;
	e.stopPropagation();
	shubiao = false;
	console.log("松开");
});*/


/**
 * $(".quan").mousedown(function() {
	console.log("尽了11");
	//这里要清除下歌词里面唱到当前的那个高亮  不然快进快退那个高亮还在
	$(".gc ul li").removeClass('colors');
	audio.pause(); //暂停
	$(".dateJd").mouseover(function (e){
		console.log("尽了22");
		//记录x
		//先让歌曲停止 不然进度条会跟着歌词一直变
		//改变进度条颜色
		var x = e.offsetX;
		//改变进度条黄色的宽度
		$(".dateJdZd").css("width",x+"px");
		//改变圆圈的left
		$(".quan").css("left",x+"px");
	});
});


$(".quan").mouseup(function (e){
	console.log("尽了333");
	var x = e.offsetX;
	var jd = tdJdtBfb(x);
	tdJdtDate(jd);
	audio.play();  //播放开始
});
 */

 


///////////////////////////////////进度条结束/////////////////////////////////////////////