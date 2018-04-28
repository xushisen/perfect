<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
	<style type="text/css">
	   body{font:normal 14px/24px "Microsoft Yahei","冬青黑体简体中文 w3","宋体";}
	   canvas{position:absolute;right:10%;top:20%;}
	   ::-webkit-scrollbar{width:8px;height:6px;background:#eee}::-webkit-scrollbar-button{background-color:#eee}::-webkit-scrollbar-track{background:#eee}::-webkit-scrollbar-track-piece{background:#eee}::-webkit-scrollbar-thumb{background:#aaa;border-radius:4px}::-webkit-scrollbar-corner{background:#82afff}::-webkit-scrollbar-resizer{background:#ff0bee}
	   .content{width:50%}.content p{text-indent:25px}
	</style>
  </head>
  
  <body>
  <canvas id="myCanvas" width="400" height="400"></canvas>
    <div class="content">
    	<pre style="line-height:14px;color:red;">               
					_     _                
			__  ___   _ ___| |__ (_)___  ___ _ __  
			\ \/ / | | / __| '_ \| / __|/ _ \ '_ \ 
			 &gt;  &lt;| |_| \__ \ | | | \__ \  __/ | | |
			/_/\_\\__,_|___/_| |_|_|___/\___|_| |_|
        </pre>
    	<p>
    		项目介绍:
    	</p>
    	<p>
    		孔雀开屏  <br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;异步检索下拉框:自己写的一个关于输入文字,自动出现下拉框并显示拼配该字的数据 <br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;弹出框,提示框:自己封装的一个提示框,弹出框组件<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全键盘:实现一个文本框输入完成后按回车键自动聚焦下一个输入框的功能<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;css3特效:自己写的一些小特效<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;异步拖拽上传:吧图片拖到指定的区域  可以无刷新的上传图片,并且可以放大预览<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;播放器:利用h5写的一个音乐播放器<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下雪:利用h5的canvas写的一个下雪的特效<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;异步直接上传:点击按钮无刷新的带有进度条的上传多个图片,支持图片放大预览<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;表格纯右键操作:仿操作系统写的一个对表格的单选多选右键操作表格的特效<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;自定义标签:自己写的一个分页的自定义标签  支持多种样式<br />
    	</p>
    	<p>
    		自作多情  <br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;验证码,谭洲官网:自己写的一个小的验证码的功能,还有一个谭洲官网的效果 <br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图片放大预览:图片的一个放大预览的功能 上面用到的图片预览都是这个封装的<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下拉框检索:根据输入文字字段匹配文字并且显示下拉框<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全键盘:实现一个文本框输入完成后按回车键自动聚焦下一个输入框的功能<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;弹出的是另一个页面:利用js写的一个弹出框,里面的内容是另外一个页面嵌套进来的<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;瀑布流:一个瀑布流的效果<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;无拖动条 鼠标滚动特效:在没有滚动条的情况下,自行的切换显示的文本<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发送邮件:一个发送邮件的功能<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;css3:css3的特效<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二维码生成:支持有图片的二维码和没有图片的二维码<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间插件:一个js页面选择日期的插件<br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;拖拽选中效果:仿照操作系统写的一个选择文件的效果<br />
    	</p>
    	<p>
    		屌的不行  <br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图片预加载:大型网站的图片懒加载的技术 <br />
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;京东:自己写的京东网站<br />
    	</p>
	</div>
	<script type="text/javascript">
		/**canvas*/
		var c=document.getElementById("myCanvas");
		var ctx=c.getContext("2d");
		draw();
		function draw(){
		//当前时间
		var date = new Date();
		var house = date.getHours();
		var fenzhong = date.getMinutes();
		var miao = date.getSeconds();
		var housedu = (house%12)*30; //小时度数
		var fenzhongdu = fenzhong*6; //分钟度数
		var miaodu = miao*6;  //秒度数
		
		ctx.clearRect(0,0,400,400);
		//画圆盘
		ctx.strokeStyle = "blue";
		ctx.lineWidth = "10";
		ctx.beginPath();
		ctx.arc(200,200,150,0,360,false);
		ctx.closePath();
		ctx.stroke();
		
		//画0 3 6 9 以及年月日
		ctx.fillStyle = "black";
		ctx.font="16px 微软雅黑";
		ctx.fillText("0",196,100);
		ctx.fillText("6",196,315);
		ctx.fillText("3",305,205);
		ctx.fillText("9",90,205);
		
		ctx.font="12px 微软雅黑";
		var nyr = date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日";
		var gradient=ctx.createLinearGradient(220,180,305,180);
		gradient.addColorStop("0","magenta");
		gradient.addColorStop("0.5","blue");
		gradient.addColorStop("1.0","red");
		ctx.fillStyle=gradient;
		ctx.fillText(nyr,220,180);
		
		//画小时
		for(var i=0;i<12;i++){
		   ctx.save();
		   ctx.strokeStyle = "pink";
		   ctx.lineWidth = "5";
		   ctx.translate(200,200);
		   ctx.rotate(i*30*Math.PI/180);
		   ctx.beginPath();
		   ctx.moveTo(0,-120);
		   ctx.lineTo(0,-140);
		   ctx.closePath();
		   ctx.stroke();
		   ctx.restore();
		}
		//画分钟
		for(var i=0;i<60;i++){
		   ctx.save();
		   ctx.strokeStyle = "pink";
		   ctx.lineWidth = "5";
		   ctx.translate(200,200);
		   ctx.rotate(i*6*Math.PI/180);
		   ctx.beginPath();
		   ctx.moveTo(0,-130);
		   ctx.lineTo(0,-140);
		   ctx.closePath();
		   ctx.stroke();
		   ctx.restore();
		}
		//画时针
		ctx.save();
		ctx.translate(200,200);
		ctx.rotate(housedu*Math.PI/180);
		ctx.lineWidth = "5";
		ctx.beginPath();
		ctx.moveTo(0,10);
		ctx.lineTo(0,-90);
		ctx.closePath();
		ctx.stroke();
		ctx.restore();
		//画分针
		ctx.save();
		ctx.translate(200,200);
		ctx.rotate(fenzhongdu*Math.PI/180);
		ctx.lineWidth = "5";
		ctx.strokeStyle = "yellow";
		ctx.beginPath();
		ctx.moveTo(0,10);
		ctx.lineTo(0,-100);
		ctx.closePath();
		ctx.stroke();
		ctx.restore();
		//画秒针
		ctx.save();
		ctx.translate(200,200);
		ctx.rotate(miaodu*Math.PI/180);
		ctx.lineWidth = "5";
		ctx.strokeStyle = "red";
		ctx.beginPath();
		ctx.moveTo(0,10);
		ctx.lineTo(0,-110);
		ctx.closePath();
		ctx.stroke();
		ctx.restore();
		//画中间的圆
		ctx.fillStyle = "red";
		ctx.beginPath();
		ctx.arc(200,200,5,0,360,false);
		ctx.closePath();
		ctx.fill();
		}
		setInterval(draw,1000);
	</script>
  </body>
</html>
