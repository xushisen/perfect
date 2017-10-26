var c=document.getElementById("myCanvas");
var context=c.getContext("2d");
var widht = $(window).width()-5;
var height = $(window).height()-5;
c.width = widht;
c.height = height;
var num = $(window).height()+300;

var shu = [];  //flag 0下 1上 
var xia = [0,2];  //圆圈向下的集合
var shang = [1,3];//圆圈向上的集合
var xianshu = []; //线条集合
var x = Math.random()*widht; //鼠标当前x
var y = Math.random()*height; //鼠标当前y

$.dl = function (options){
	var opts = $.extend({},options);
    for(var i=0;i<num;i++){
       shu.push({"x":Math.floor(Math.random()*widht),"y":Math.floor(Math.random()*height),"flag":Math.floor(Math.random()*4),bj:Math.floor(Math.random()*4),color:"rgba("+getColor()+",.8)"});
    }
   
    drawPath();
};

function drawPath(){
	context.clearRect(0,0,widht,height);
	var grad  = context.createLinearGradient(0,0, widht,height);
    grad.addColorStop(0,'rgb(028, 128, 152)');    // 红
    grad.addColorStop(0.5,'rgb(107, 162, 139)'); // 绿
    grad.addColorStop(1,'rgb(023, 086, 130)');  // 紫
    context.fillStyle = grad;
    context.fillRect(0,0,widht,height);
	//context.fillStyle = "#1a1a1a";
	//context.fillRect(0,0,widht,height);
	xianshu.splice(0,xianshu.length);
	for(var i=0;i<num;i++){
		//线条的坐标
		if(shu[i].x>(x-50) && shu[i].x<(x+50) && shu[i].y>(y-50) && shu[i].y<(y+50)){
			xianshu.push({x:shu[i].x,y:shu[i].y});
		}
		//圆
		var colors = getColor();
		context.fillStyle =shu[i].color;//填充红色，半透明
		context.beginPath();
		if(shu[i].flag == 0){  //下
			shu[i].x = shu[i].x+1;
			shu[i].y = shu[i].y+1;
		}else if(shu[i].flag == 1){  //上
			shu[i].x = shu[i].x-1;
			shu[i].y = shu[i].y-1;
		}else if(shu[i].flag == 2){  //左下
		    shu[i].x = shu[i].x-1;
            shu[i].y=shu[i].y+1;
		}else if(shu[i].flag == 3){  //左上
		    shu[i].x = shu[i].x+1;
		    shu[i].y=shu[i].y-1;
		}
		if(shu[i].y<5 || shu[i].x<5){  
			//shu[i].flag = 0; //改方向为下
			var ran = Math.floor(Math.random()*2);
            shu[i].flag = xia[ran];
		}else if(shu[i].y>height || shu[i].x>widht){
			//shu[i].flag = 1;  //改方向为上
			var ran = Math.floor(Math.random()*2);
            shu[i].flag = shang[ran];
		}
		context.arc(shu[i].x,shu[i].y,shu[i].bj,0,2*Math.PI,false); 
		context.closePath();
		context.fill();
	}
	//画线条
	drawXt();
}

function getColor(){
	var r = Math.floor(Math.random()*254);
	var g = Math.floor(Math.random()*254);
	var b = Math.floor(Math.random()*254);
	return r+","+g+","+b;
}

setInterval(drawPath,100);

//画线条
function drawXt(){
	if(xianshu.length != 0){
		context.strokeStyle="#fff";
		context.beginPath();
		context.moveTo(xianshu[0].x,xianshu[0].y);
		for(var i=0;i<xianshu.length;i++){
			context.lineTo(xianshu[i].x,xianshu[i].y);
		}
		context.closePath();
		context.stroke();
	}
}

/**鼠标事件*/
c.onmousemove=function (e){
	xianshu.splice(0,xianshu.length);
	var e = e||event;
	x = e.clientX;
	y = e.clientY;
	//拿到数组里面坐标在x y 区域内的坐标
	for(var i=0;i<num;i++){//x在70-100 y在70-130 
		if(shu[i].x>(x-50) && shu[i].x<(x+50) && shu[i].y>(y-50) && shu[i].y<(y+50)){
			xianshu.push({x:shu[i].x,y:shu[i].y});
		}
	}
	drawXt();
};
