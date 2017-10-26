<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    	<meta name="keywords" content="搜索"/>
		<meta name="description" content="描述"/>
		<title>弹出框</title>
 	    <%--css公共文件 --%>
		<link rel="stylesheet" type="text/css" href="../css/zidingyi.css"/>
  		<link rel="stylesheet" type="text/css" href="../css/texiao.css" />
		
  </head>
  
  <body>
  
      <span onclick="tchf()">点击出现弹出框封住全屏</span>
	  <span onclick="tsf()">点击出现提示框封住全屏</span>
  	  <br />
      <span onclick="tch()">点击出现弹出框不封住全屏</span>
	  <span onclick="ts()">点击出现提示框不封住全屏</span>
  	  
	  <%--js公共文件 --%>
	  <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	  <script type="text/javascript" src="../js/zidingyi/alert.min.js"></script>
	  <script type="text/javascript" src="../js/zidingyi/tcUtil.min.js"></script>
	  <script type="text/javascript">
	  	$(parent.window.document.body).find(".mask").remove();//取消遮罩层
	  	
		/**显示弹出框*/
		function tch(){
			$.jAlert({
				title:"提示",
				content:"这是内容",
				sfqp:false,   //true 需要跳出ifame封住全屏
				direction:"left",
				qd:function (){
					//$.jAlert({title:"提示",content:"点击了确定",sfqp:false});
					$.ts({"width":"140px","height":"30px","color":"#fff","content":"点击了确定","backgroundColor":"green","type":"Left","direction":"around","date":"3000"});
				}
			});
		}
		
		/**显示提示框*/
		function ts(){
			$.tConfirm({
				content:"确定删除?",
				title:"系统提示",
				direction:"top",
				sfqp:false,   //true 需要跳出ifame封住全屏
				yes:function(){
					//$.jAlert({title:"提示",content:"点击了是",direction:"right",sfqp:false});
					$.ts({"width":"140px","height":"30px","color":"#fff","content":"点击了是","backgroundColor":"orange","type":"Right","direction":"around","date":"3000"});
				},
				no:function(){
					//$.jAlert({title:"提示",content:"点击了否",direction:"left",sfqp:false});
					$.ts({"width":"140px","height":"30px","color":"#fff","content":"点击了否","backgroundColor":"orange","type":"Right","direction":"around","date":"3000"});
				}
			});
		}
		/**显示弹出框*/
		function tchf(){
			$.jAlert({
				title:"提示",
				content:"这是内容",
				direction:"right",
				sfqp:true,   //true 需要跳出ifame封住全屏
				qd:function (){
					//$.jAlert({title:"提示",content:"点击了确定",direction:"right",sfqp:true});
					$.ts({"width":"140px","height":"30px","color":"#fff","content":"点击了确定","backgroundColor":"orange","type":"Right","direction":"around","date":"3000"});
				}
			});
		}
		
		/**显示提示框*/
		function tsf(){
			$.tConfirm({
				content:"确定删除?",
				title:"系统提示",
				direction:"bottom",
				sfqp:true,   //true 需要跳出ifame封住全屏
				yes:function(){
					//$.jAlert({title:"提示",content:"点击了是",direction:"right",sfqp:true});
					$.ts({"width":"140px","height":"30px","color":"#fff","content":"点击了确定","backgroundColor":"orange","type":"Top","direction":"around","date":"3000"});
				},
				no:function(){
					//$.jAlert({title:"提示",content:"点击了否",direction:"right",sfqp:true});
					$.ts({"width":"140px","height":"30px","color":"#fff","content":"点击了取消","backgroundColor":"orange","type":"Bottom","direction":"around","date":"3000"});
				}
			});
		}
	</script>
  </body>
</html>
