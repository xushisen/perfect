<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    
    <title>My JSP 'zjUpload.jsp' starting page</title>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 动画css -->
  	<link rel="stylesheet" type="text/css" href="../css/texiao.css" />
  	<link rel="stylesheet" type="text/css" href="../css/zjUpload.css" />
	<link rel="stylesheet" type="text/css" href="../css/tpyl.css"/>
	<link rel="stylesheet" type="text/css" href="../css/zidingyi.css"/>
  </head>
  
  <body style="overflow:auto;">
  	  <p style="font-size:20px;-webkit-text-stroke:1px red;color:#fff;font-weight:900;">默认支持多选上传 支持放大预览</p>
 	  <!-- 上传按钮美化开始 -->
      <a class="file" href="javascript:;">选择文件<input accept="image/*" type="file" value="上传" id="file_input" /></a> <br />
      <!-- 上传按钮美化结束 -->
      <!-- 图片显示开始 -->
      <div class="fileUtil"><ul></ul></div>
      <!-- 图片显示结束 -->
      
  	  <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	  <!-- 弹出框js -->
	  <script type="text/javascript" src="../js/zidingyi/tcUtil.min.js"></script>
  	  <!-- 上传js -->
	  <script type="text/javascript" src="../js/zidingyi/zjUpload.js"></script>
  	  <!-- 预览图片js -->
	  <script type="text/javascript" src="../js/shijian/tpyl.js"></script>
	  <script type="text/javascript" src="../js/zidingyi/alert.min.js"></script>
	  <script type="text/javascript">
	  	  $(parent.window.document.body).find(".mask").remove();//取消遮罩层
	  	  
		  /**
          * 直接上传
          */
          $.upload({
        	  "type":true,  //单穿false  多传true
        	  "url":"/xiaoguo/springUpload",  //路径
        	  "id":"file_input", //要触发的input file的id
        	  "types":"jpg,gif,png,pdf", //需要上传的类型
        	  success:function(json){
        		  if(json != "error"){
	        		  var jsonObject = eval("(" + json + ")");
	  				  for(var i=0;i<jsonObject.length;i++){
	  					 var li = $("<li><img src='/test/"+jsonObject[i].newFilenName+"' width='200px' height='200px' alt='图片'/><p title='"+jsonObject[i].name+"'>名字:"+jsonObject[i].name+"</p><span>大小:"+jsonObject[i].size+"</span></li>");
	      				 $(".fileUtil ul").append(li);
	  				  }
	  				  
	  				  $.ts({"width":"140px","height":"30px","color":"#fff","content":"上传完成,共"+jsonObject.length+"条","backgroundColor":"green","type":"Left","direction":"around","date":"2000"});
	  				  $.tpyl({divId:"fileUtil"});  //**divId 需要div里面的图片放大*//*
	        	  }else{
	        		  $.jAlert({
	      				title:"提示",
	      				content:"上传文件过大,请选择重新上传",
	      				sfqp:false,   //true 需要跳出ifame封住全屏
	      				direction:"left",
	      				qd:function (){
	      				}
	      			});
	        	  }
        	  },
        	  error:function(){
        		  $.jAlert({
	      				title:"提示",
	      				content:"网络异常,请稍后重试",
	      				sfqp:false,   //true 需要跳出ifame封住全屏
	      				direction:"left",
	      				qd:function (){
	      				}
	      			});
        	  }
          });
	  </script>
  </body>
</html>
