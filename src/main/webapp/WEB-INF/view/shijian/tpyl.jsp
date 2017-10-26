<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    
    <title>图片预览</title>
    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="../css/tpyl.css"/>
	<link rel="stylesheet" type="text/css" href="../css/zidingyi.css"/>
	</style>
  </head>
  
  <body>
  	 <!-- <div class="yl">
  	  	 <span>×</span>
  	  	 <div class="bottom left">左</div>
  	  	 <div class="bottom right">右</div>
  	  	 <div class="yeshu">1/5</div>
  	  	 <div class="caozuo">旋转</div>
  	  	 <div class="yl-img">
  	  	     <img src="../images/bg0.jpg" width="500" height="400" alt="图片" />
  	  	 </div>
  	  </div> --> 
      <div class="imglist">
      	 <ul>
      	 	<li>
      	 		<a href="javascript:;"><img src="../images/IMG_20160210_165633.jpg" alt="图片" width="100" height="100" /></a>
      	 	</li>
      	 	<li>
      	 		<a href="javascript:;"><img src="../images/bg1.jpg" alt="图片" width="100" height="100" /></a>
      	 	</li>
      	 	<li>
      	 		<a href="javascript:;"><img src="../images/bg2.jpg" alt="图片" width="100" height="100" /></a>
      	 	</li>
      	 	<li>
      	 		<a href="javascript:;"><img src="../images/bj_1.png" alt="图片" width="100" height="100" /></a>
      	 	</li>
      	 	<li>
      	 		<a href="javascript:;"><img src="../images/bj_2.png" alt="图片" width="100" height="100" /></a>
      	 	</li>
      	 </ul>
      </div>
      
      <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
      <script type="text/javascript" src="../js/shijian/tpyl.js"></script>
	  <script type="text/javascript" src="../js/zidingyi/alert.min.js"></script>
       <script type="text/javascript">
        $.tpyl({divId:"imglist"});  /**divId 需要div里面的图片放大*/
       </script>
  </body>
</html>
