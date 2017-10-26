var c=document.getElementById("myCanvas");
var ctx=c.getContext("2d");
ctx.lineWidth = 1; 
var arr = [];
var widht = $(document).width();
var height = $(document).height();
c.width = widht;
c.height = height;
$.xue = function(options){
	var opts = $.extend({},$.xue.method,options);
	ctx.strokeStyle = opts.color;
	opts.create(opts.num);
};

$.xue.method = {
	create:function(num){
		for(var i=0;i<num;i++){
		   arr.push({"x":parseInt((widht*Math.random()+1)),"y":parseInt((height*Math.random()+1))});
		}
		createXue(num);
	}
};

/**
 * 创建雪
 * color 颜色
 */
function createXue(num){
	console.log(arr.length);
	if(arr.length == 0){
		console.log("取消了");
		clearInterval(tt);  //取消定时
	}
	ctx.clearRect(0,0,widht,height);
	ctx.beginPath();
	for(var z=0;z<arr.length;z++){
		arr[z].x = arr[z].x+Math.floor(Math.random()*(10-(-10)+1)+(-10));  //-10 到10之间是随机数
		arr[z].y = arr[z].y+parseInt((10*Math.random()+1));
		//如果大于边框 从数组移出
		if(arr[z].x<0 || arr[z].x>widht || arr[z].y>height){
			arr.splice(z--, 1);
			continue;
		}
		console.log(arr.length);
		this.huaxue(arr[z].x,arr[z].y);
	}
}

/**
 * 画雪
 * @param {Object} x
 * @param {Object} y
 */
function huaxue(x,y){
	//先保存
		//ctx.save();
		//旋转
		//ctx.rotate(parseInt((2*Math.random()+1))*Math.PI/180);
		ctx.moveTo(x,y);
		ctx.lineTo(x,y-3);
		ctx.lineTo(x-3,y-5);
		//改变坐标
		ctx.moveTo(x,y-3);
		ctx.lineTo(x+3,y-5);
		ctx.moveTo(x,y-3);
		ctx.lineTo(x,y-7);
		ctx.lineTo(x-3,y-9);
		ctx.moveTo(x,y-7);
		ctx.lineTo(x+3,y-9);
		
		ctx.moveTo(x,y);
		ctx.lineTo(x-3,y);
		ctx.lineTo(x-5,y-3);
		ctx.moveTo(x-3,y);
		ctx.lineTo(x-5,y+3);
		ctx.moveTo(x-3,y);
		ctx.lineTo(x-8,y);
		ctx.lineTo(x-10,y-3);
		ctx.moveTo(x-8,y);
		ctx.lineTo(x-10,y+3);
		
		ctx.moveTo(x,y);
		ctx.lineTo(x,y+3);
		ctx.lineTo(x-3,y+6);
		ctx.moveTo(x,y+3);
		ctx.lineTo(x+3,y+5);
		ctx.moveTo(x,y+3);
		ctx.lineTo(x,y+9);
		ctx.lineTo(x-3,y+11);
		ctx.moveTo(x,y+9);
		ctx.lineTo(x+3,y+11);
		
		ctx.moveTo(x,y);
		ctx.lineTo(x+3,y);
		ctx.lineTo(x+5,y+3);
		ctx.moveTo(x+3,y);
		ctx.lineTo(x+5,y-3);
		ctx.moveTo(x+3,y);
		ctx.lineTo(x+9,y);
		ctx.lineTo(x+11,y+3);
		ctx.moveTo(x+9,y);
		ctx.lineTo(x+11,y-3);
		ctx.restore();
		ctx.stroke();
		ctx.closePath();
		//ctx.restore();
}
var tt = setInterval(createXue,1000);
