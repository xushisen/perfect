<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
     <style type="text/css">
     		*{margin:0px;padding:0px;}
			 body,html{background:url('../images/yy.jpg')no-repeat;background-size:100% 100%;height:100%;}
			 /**大的框架开始*/
			.zong{width:1000px;height:500px;position:relative;top:50%;left:50%;margin-top:-250px;margin-left:-500px;}
			/**列表部分开始*/
			.zong .left{width:200px;height:100%;background:rgba(180,180,180,0.5);float:left;}
			.zong .right{width:800px;height:100%;float:right;}
			.zong .left ul{list-style:none;margin-left:16px;margin-top:20px;margin-right:14px;height:450px;overflow:auto;}
			.zong .left ul li{text-align:left;height:22px;line-height:22px;color:#fff;font-size:14px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}/**white-space规定段落中的文本不进行换行   text-overflow  ellipsis 显示省略符号来代表被修剪的文本*/
			.zong .left ul li:hover{color:pink;cursor:pointer}
			/**列表部分结束*/
			/**歌词部分大的框架开始*/
			/**歌词部分开始*/
			.zong .right .gc{width:800px;height:450px;background:rgba(150,150,150,0.5);text-align:center;overflow:hidden;position:relative;color:#fff;}
			.zong .right .gc ul{position:absolute;top:200px;list-style:none;width:800px;}
			.zong .right .gc ul li{text-align:center;height:40px;line-height:40px;}
			/**歌词部分结束*/
			/**歌词下面的操作部分开始*/
			/**上一首按钮*/
			.zong .right .cz .top{width:40px;height:40px;background:#fff;border-radius:40px;position:absolute;top:5px;left:21px;} 
			.zong .right .cz .top:hover{cursor:pointer;border:1px solid #9a9fa2;}
			.zong .right .cz .top p{margin-top:10px;margin-left:10px;font-weight:900;}
			/**播放暂停按钮*/
			.zong .right .cz .yuan{width:40px;height:40px;background:#fff;border-radius:40px;position:absolute;top:5px;left:65px;} 
			.zong .right .cz .yuan:hover{cursor:pointer;border:1px solid #9a9fa2;}
			.zong .right .cz .yuan #zt{margin-left:12px;margin-top:12px;display:block;height:17px;width:17px;background:black;}
			.zong .right .cz .yuan #bf{ border-left: 1px solid black;border-right:1px solid black;display:block;height:15px;margin-left:14px;margin-top:13px;width:11px;background:rgba(0,0,0,0);}
			/**下一首按钮*/
			.zong .right .cz .buttom{width:40px;height:40px;background:#fff;border-radius:40px;position:absolute;top:5px;left:111px;} 
			.zong .right .cz .buttom:hover{cursor:pointer;border:1px solid #9a9fa2;}
			.zong .right .cz .buttom p{margin-top:10px;margin-left:11px;font-weight:900;}
			
			/**滚动条美化开始*/
			::-webkit-scrollbar{width:8px;height:6px;background:#eee}  /**滚动条整体部分*/
			::-webkit-scrollbar-button{background-color:#eee}/**滚动条的轨道的两端按钮，允许通过点击微调小方块的位置*/
			::-webkit-scrollbar-track{background:#eee}/**滚动条的轨道（里面装有Thumb）*/
			::-webkit-scrollbar-track-piece{background:#eee}/**内层轨道，滚动条中间部分（除去）*/
			::-webkit-scrollbar-thumb{background:#aaa;border-radius:4px;}/**滚动条里面的小方块，能向上向下移动（或往左往右移动，取决于是垂直滚动条还是水平滚动条）*/
			::-webkit-scrollbar-corner{background:#82afff}/**边角，即两个滚动条的交汇处*/
			::-webkit-scrollbar-resizer{background:#ff0bee}/**两个滚动条的交汇处上用于通过拖动调整元素大小的小控件*/
			/**滚动条美化结束*/
			
			/**进度条*/
			.zong .right .cz .jdt{height:20px;left:186px;position:absolute;top:15px;width:503px;font-size:14px;}
			.zong .right .cz .jdt .dateBd{width:40px;height:100%;float:left;}
			.zong .right .cz .jdt .dateBb{width:40px;height:100%;float:right;}
			.zong .right .cz .jdt .dateJd{width:420px;height:4px;background:#272628;float:left;margin-top:8px;position:relative;}
			.zong .right .cz .jdt .dateJd:hover{cursor:pointer;}
			
			/**进度条滚动*/
			.zong .right .cz .jdt .dateJd .dateJdZd{position:absolute;left:0px;top:0px;background:linear-gradient(to right,#698ACA,#c2438F);height:100%;}
           
            /**进度条前面的圆圈*/
           .zong .right .cz .jdt .dateJd .quan{width:10px;height:10px;background:#FFF;position:absolute;top:0px;margin-top:-3px;margin-left:-5px;border-radius:5px;z-index:1;box-shadow:0px 0px 16px #828267;}
           
            /**歌词下面的操作部分结束*/
            
            /**循环  顺序播放按钮位置*/
			.zong .right span{display: block;float:right;margin-right:35px;}
			.zong .right span:hover{cursor:pointer;color:#9a9fa2;}
			/**start gc*/
			.zong .right .cz{width:450px;height:40px;background:rgba(200,200,200,0.5);padding-left:350px;padding-top:10px;position:relative;}
			.zong .right .cz a{width:60px;height:30px;display:block;background:blue;text-align:center;line-height:30px;border-radius:4px;background;background:linear-gradient(#15A216,#fafafa);cursor:pointer;}
            .colors{color:pink;font-size:18px;};
            /**歌词部分大的框架结束*/
            /**大的框架开始*/
		</style>
  </head>
  
  <body>
  	  <!-- 大的框架开始 -->
      <div class="zong">
      		<!-- 列表部分开始 -->
			<div class="left">
				<ul></ul>
			</div>
			<!-- 列表部分结束 -->
			<!-- 歌词部分大的框架开始 -->
			<div class="right">
				<!-- 歌词部分开始 -->
				<div class="gc">
					<ul></ul>
				</div>
				<!-- 歌词部分结束-->
				<!-- 歌词下面的操作部分开始 -->
				<div class="cz">
					<div class="top" title="上一首"><p>&lt;&lt;</p></div>
					<div class="yuan" title="播放/暂停"><p id="zt"></p><p id="bf"></p></div>
					<div class="buttom" title="下一首"><p>&gt;&gt;</p></div>
					<div class="jdt">
						<div class="dateBd"></div>
						<div class="dateJd">
							<!-- 进度条前面的圆圈 -->
							<div class="quan"></div>
							<!-- 进度条 -->
							<div class="dateJdZd"></div>
						</div>
						<div class="dateBb"></div>
					</div>
					<span id="bfms">循环</span>
				</div>
				<!-- 歌词下面的操作部分结束 -->
			</div>
			<!-- 歌词部分大的框架结束 -->
		</div>
		<!-- 大的框架结束 -->
	  <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	  <script type="text/javascript" src="../js/zidingyi/bofangqi.js"></script>
	  <script type="text/javascript">
		  $(parent.window.document.body).find(".mask").remove();//取消遮罩层	
	  </script>
  </body>
</html>
