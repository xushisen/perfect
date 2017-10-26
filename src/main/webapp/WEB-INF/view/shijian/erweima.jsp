<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
	 <link rel="stylesheet" type="text/css" href="../css/texiao.css" />
	 <style type="text/css">
	    *{margin:0;padding:0;}
	 	.myForm{width:400px;height:100px;margin:200px 100px;}
	 	.myForm p{border-radius:5px;overflow:hidden;height:34px;margin:30px 0;}
	 	.myForm p span{width:150px;height:100%;display:block;background:red;float:left;text-align:right;line-height:34px;}
	 	.myForm p .text{width:248px;height:100%;border:1px solid #666;outline:none;background:green;text-indent:10px;color:#fff;}
	 	.myForm p .but{width:100%;height:100%;outline:none;background:repeating-linear-gradient(45deg,#d2d2d2 10px,#b6b6b6 30px);animation:play 10s linear infinite;text-align:center;font-size:20px;cursor:pointer;}
	 	.myForm p .but:hover{box-shadow:0 0 5px #666 inset}
	 	
	 	img{position:absolute;top:100px;left:800px;}
	 	
	 	@keyframes play{
			from{background-position:0 0;}
			to{background-position:1200px 0px;}
		}
	 </style>
  </head>
  
  <body>
	  <%
		String filePath =(String)request.getAttribute("filePath");
	    if(null != filePath){
	    	out.print("<img src='/test/"+filePath+"' />");
	    }
	  %>
  	  <div class="myForm">
	      <form action="<%=basePath%>servlet/erweima" method="post" enctype="multipart/form-data" id="scFrom">
	      	 <p><span>需要生成的内容:</span><input type="text" class="text" name="content" /></p>
	      	 <p><span>生成中间的图片:</span><input accept="image/*" class="text" name="file" type="file" /> </p>
	      	 <p><input type="button" class="but" value="生成" id="sc" /></p>
	      </form>
      </div>
      
      <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../js/zidingyi/tcUtil.min.js"></script>
      <script type="text/javascript">
      	 $(function (){
      		 $("#sc").click(function (){
       			$.jzjd();  //打开遮罩
           		$("#scFrom").submit();
           	 });
      		 if($("img").length == 0){
      			$(parent.window.document.body).find(".mask").remove();//取消遮罩层
      		 }else{
      			$("body").find(".mask").remove();//取消遮罩层
      		 }
      	 });
      	 
      </script>
  </body>
</html>
