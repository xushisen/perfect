<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
  	<link rel="stylesheet" type="text/css" href="../css/texiao.css" />
  	<link rel="stylesheet" type="text/css" href="../css/zjUpload.css" />
	<link rel="stylesheet" type="text/css" href="../css/tpyl.css"/>
	<style type="text/css">
			*{margin:0px;padding:0px;}
			
			#tzsc{width:660px;height:200px;margin:10px auto;border:1px solid #000;}
			body{font-family:"楷体";font-size:16px;background:#949494;background-size:cover;}
			
			#tzsc .tzsctop{width:611px;height:100px;margin:20px auto;border:1px solid #000;}
			#tzsc .tzsctop .tzsctopleft{float:left; width:510px; height:100px;border-right:1px solid #000;}
			#tzsc .tzsctop .tzsctopright{float:left; width:100px; height:100px;text-align:center;line-height:100px;cursor:pointer;}
			#tzsc .tzsctop .tzsctopright:active{box-shadow:1px 1px 1px #000 inset;}
			
			#tzsc .imgbtn{width:610px;height:30px;margin:5px auto;border:1px solid #000;}
			#tzsc .imgbtn span{margin-left:20px;}
			#tzsc .imgbtn .txt{float:right;margin-right:20px;}
			#tzsc .imgbtn .txt a{text-decoration:none;width:50px;height:80%;background:linear-gradient(red, blue);display:block;text-align:center;line-height:25px;color:#fff;text-shadow:1px 1px 1px #000;}
			#tzsc .imgbtn .txt a:active{background:linear-gradient(blue,red);text-shadow:-1px -1px 1px #000;}
			
			#tzsc .zz{margin:28px auto;width:640px;height:200px;background:rgba(250,250,250,0.6);display:none;position:relative;}
			#tzsc .zz .text{width:640px;line-height:200px;text-align:center;font-size:20px;position:absolute;}
			
			/**图片展示区域开始*/
			.table{width:100%;margin-top:10px;border-collapse:collapse;}  /**border-collapse:collapse  为表格设置合并边框模型*/
			.table thead tr td{font-size:16px;}
			.table thead tr,.t_tab table tbody tr{margin:5px;height:30px;background:#4fada1;}
			.table tbody tr td{color:#949188;}
			.table tbody tr{background:#fff;height:30px;}
			.table tbody tr:nth-child(even) {background:#e7eeee;}
			.table tbody tr:hover{background:rgba(200,200,200,1);}
			/**图片展示区域结束*/
		</style>
  </head>
  
  <body>
  		<table class="table">
  			<thead>
  				<tr>
  					<td>图片预览</td>
  					<td>图片名字</td>
  					<td>图片大小</td>
  				</tr>
  			</thead>
  			<tbody>
  			</tbody>
  		</table> 
    	<div id="tzsc">
			<div class="tzsctop">
				<div class="tzsctopleft"></div>
				<div class="tzsctopright">点击上传</div>
			</div>
			<div class="imgbtn">
				<span>上传图片</span>
				<span>哈哈哈哈</span>
				<div class="txt">
					<a href="javascript:;">上传</a>
				</div>
			</div>
			<div class="zz">
				<div class="text">请将图片拖至此区域</div>
			</div>
		</div>
		
	  <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	  <script type="text/javascript" src="../js/zidingyi/tzUpload.js"></script><!-- 预览图片js -->
	  <script type="text/javascript" src="../js/shijian/tpyl.js"></script> <!-- 弹出框js -->
	  <script type="text/javascript" src="../js/zidingyi/tcUtil.min.js"></script>
	  <script type="text/javascript">
	  	$(parent.window.document.body).find(".mask").remove();//取消遮罩层
	  
	  	$.tzsc({
	  		url:"/servlet/hello"
	  	});
	  </script>
  </body>
</html>
