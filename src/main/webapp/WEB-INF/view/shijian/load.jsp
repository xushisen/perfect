<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
		body{background:#0dcecb;}
		.load2 .loader,
		.load2 .loader:before,
		.load2 .loader:after {
		  border-radius: 50%;
		}
		.load2 .loader:before,
		.load2 .loader:after {
		  position: absolute;
		  content: '';
		}
		.load2 .loader:before {
		  width: 5.2em;
		  height: 10.2em;
		  background: #0dcecb;
		  border-radius: 10.2em 0 0 10.2em;
		  top: -0.1em;
		  left: -0.1em;
		  -webkit-transform-origin: 5.2em 5.1em;
		  transform-origin: 5.2em 5.1em;
		  -webkit-animation: load2 2s infinite ease 1.5s;
		  animation: load2 2s infinite ease 1.5s;
		}
		.load2 .loader {
		  font-size: 11px;
		  text-indent: -99999em;
		  margin: 5em auto;
		  position: relative;
		  width: 10em;
		  height: 10em;
		  box-shadow: inset 0 0 0 1em #fff;
		}
		.load2 .loader:after {
		  width: 5.2em;
		  height: 10.2em;
		  background: #0dcecb;
		  border-radius: 0 10.2em 10.2em 0;
		  top: -0.1em;
		  left: 5.1em;
		  -webkit-transform-origin: 0px 5.1em;
		  transform-origin: 0px 5.1em;
		  -webkit-animation: load2 2s infinite ease;
		  animation: load2 2s infinite ease;
		}
		@-webkit-keyframes load2 {
		  0% {
		    -webkit-transform: rotate(0deg);
		    transform: rotate(0deg);
		  }
		  100% {
		    -webkit-transform: rotate(360deg);
		    transform: rotate(360deg);
		  }
		}
		@keyframes load2 {
		  0% {
		    -webkit-transform: rotate(0deg);
		    transform: rotate(0deg);
		  }
		  100% {
		    -webkit-transform: rotate(360deg);
		    transform: rotate(360deg);
		  }
		}
		
		/**3d旋转开始*/
		body{perspective:800px;} 
		*{  
		    padding: 0;  
		    margin: 0;  
		}  
		.container{  
		    position: relative;  
		    top: 50px;  
		    left: 50px;  
		    width:200px;  
		    height: 200px;  
		}  
		.container div{  
		    position: absolute;
		    top: 0;  
		    left: 0;  
		    width:200px;  
		    height: 200px;  
		    -webkit-transition: 1.5s ease-in-out;  
		    -moz-transition: 1.5s ease-in-out;  
		    -ms-transition: 1.5s ease-in-out;  
		    -o-transition: 1.5s ease-in-out;  
		    transition: 1.5s ease-in-out;  
		}  
		.upper{  
		    -moz-transform-style: preserve-3d;  
		    -moz-backface-visibility: hidden;  
		    -webkit-transform-style: preserve-3d;  
		    -webkit-backface-visibility: hidden;   
		    transform-style: preserve-3d;  
		    ckface-visibility: hidden;
		    background-color: #ffa043;  
		}  
		.lower{  
		    -moz-transform-style: preserve-3d;  
		    -moz-backface-visibility: hidden;/*抖动*/  
		    -webkit-transform-style: preserve-3d;  
		    -webkit-backface-visibility: hidden;
		    -moz-transform: rotateY(-180deg);  
		    -webkit-transform: rotateY(-180deg);  
		    backface-visibility: hidden;/*抖动*/   
		    transform: rotateY(-180deg); 
		    background-color: #fff000;  
		}  
		.container:hover .upper{  
		    -moz-transform: rotateY(180deg);  
		    -webkit-transform: rotateY(180deg);  
		    transform: rotateY(180deg);  
		}  
		.container:hover .lower{  
		    -moz-transform: rotateY(0deg);  
		    -webkit-transform: rotateY(0deg);  
		    transform: rotateY(0deg);  
		}  
		/**3d旋转结束*/
	</style>
  </head>
  
  <body>
    <div class="load-container load2">
		<div class="loader">Loading...</div>
	</div>
	
	<div class="container">  
        <div class="upper">我在马路边捡到2分钱  </div>  
        <div class="lower">把它交给警察叔叔手里边  </div>  
    </div>  
</div>
 <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
 <script type="text/javascript">
     $(parent.window.document.body).find(".mask").remove();//取消遮罩层
  </script>
  </body>
</html>
