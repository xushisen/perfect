<!DOCTYPE HTML>
<html>
  <head>
  	<#assign ctx = request.contextPath />
    <title>freemarker</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/biaoge.css"/>
  	<link rel="stylesheet" type="text/css" href="${ctx}/css/texiao.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/zidingyi.css"/>
	<style type="text/css">
  		body{overflow:auto;}
  	</style>
  </head>
  
  <body leftmargin=0 topmargin=0  oncontextmenu='return false' ondragstart='return false' onselectstart ='return false' onselect='document.selection.empty()' oncopy='document.selection.empty()' onbeforecopy='return false'>
	 <#-- 搜索框开始 -->
	 freemarker页面<br />
	<form action="${ctx}/listfreemarker" method="post" >
  	  	<input type="hidden" id="pagebegin" name="pagebegin" >  <#-- 第几页 -->
  	  	<input type="hidden" value="15" id="pagesize" name="pagesize" >  <#-- 每页多少条 改变每页的数量只需要改变这个val就可以 -->
  	   
		<div class="text">
			<div class="searchD">
			   <span>姓名:</span>
			   <input type="text" name="userName" class="inputText" value="${list.page.userName!}" />
			</div>
			<div class="searchD">
			   <span>email:</span>
			   <input type="text" name="userEmail" class="inputText" value="${list.page.userEmail!}" />
			</div>
		</div>
		 <#--<div class="b-center">  居中调整这个宽度
			<a href="javascript:;"><i class="fa fa-search"></i>查询</a>
		</div> -->
	</form>
	<#-- 搜索框结束 -->
    <table class="table">
  			<thead>
  				<tr>
  					<td><a href="javascript:;" onclick="xuan(this)">全选</a></td>
  					<td>姓名</td>
  					<td>email</td>
  					<td>性别</td>
  				</tr>
  			</thead>
  			<tbody>
  				<#if list.list?? && (list.list?size > 0) >
  					 <#list list.list as user>
		  				<tr>
		  					<td><div class="checkK" data-num="${user.userId}"></div></td>
		  					<td>${user.userName!}</td>
		  					<td>${user.userEmail!}</td>
		  					<td>女</td>
		  				</tr>
	  				</#list>
  				<#else>
  					<tr>
						<td colspan="20" style="text-align:center">没有查到数据</td>
					</tr>
  				</#if>
  			</tbody>
  		</table>
  		<@page count="${list.page.count}" page="${list.page.pagebegin}" pagesize="${list.page.pagesize}"></@page>  
  			
  		<script type="text/javascript" src="${ctx}/js/jquery/jquery-1.9.1.min.js"></script>
  		<script type="text/javascript" src="${ctx}/js/zidingyi/biaoge.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/zidingyi/alert.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/zidingyi/tcUtil.min.js"></script>
	 	<script type="text/javascript" src="${ctx}/js/util/util.js"></script>
	 	<script type="text/javascript">
	  		$(parent.window.document.body).find(".mask").remove();//取消遮罩层
	  		
	  		/**
			 * 查询
			 */
			$("form .text .searchD input").keydown(function(e){
				if(e.keyCode==13){
				   document.forms[0].submit();
				}
			});
		
			$.rightClick({
				"val":"新增,编辑,删除,报关",
				save:function (data){
					$.jAlert({
						title:"提示",
						content:data,
						direction:"right",  //从哪个方向出来  top left right bottom
						sfqp:false   //true 需要跳出ifame封住全屏
					});
				},
				edit:function (){
					var checked = hiddenVal();  //返回值是以逗号分开的
					if(checked.split(",").length>2){
						$.jAlert({
							title:"提示",
							content:"只能编辑一条数据",
							direction:"left",  //从哪个方向出来  top left right bottom
							sfqp:false   //true 需要跳出ifame封住全屏
						});
					}else{
						$.jAlert({
							title:"提示",
							content:"编辑",
							direction:"left",  //从哪个方向出来  top left right bottom
							sfqp:false   //true 需要跳出ifame封住全屏
						});
					}
				},
				dele:function (){
					$.tConfirm({
						content:"确定删除?",
						title:"提示",
						direction:"bottom",  //从哪个方向出来  top left right bottom
						sfqp:false,   //true 需要跳出ifame封住全屏 
						yes:function(){
							$.ajax({
								url: getRootPath()+"/deleteByIds",
								type: 'post',
								dataType: 'text',
								timeout: 1000,
								data : {ids : hiddenVal()},
								success: function (data, status) {
									if (data == "success"){
										$.ts({"width":"140px","height":"30px","color":"#fff","content":"删除成功","backgroundColor":"orange","type":"Left","direction":"around","date":"3000"});
									} else {
										$.ts({"width":"140px","height":"30px","color":"#fff","content":"删除失败","backgroundColor":"orange","type":"Left","direction":"around","date":"3000"});
									}
								},
								error: function (err, status) {
									$.ts({"width":"140px","height":"30px","color":"#fff","content":"网络异常,删除失败","backgroundColor":"orange","type":"Left","direction":"around","date":"3000"});
								}
							});
						},
						no:function(){
							//$.jAlert({title:"提示",content:"点击了否",direction:"top",sfqp:false});
							$.ts({"width":"140px","height":"30px","color":"#fff","content":"点击了取消","backgroundColor":"orange","type":"Right","direction":"around","date":"3000"});
						}
					});
				},
				baoguan:function(){
					$.jAlert({
						title:"提示",
						content:"报关",
						direction:"bottom",
						sfqp:false   //true 需要跳出ifame封住全屏 
					});
				}
			});
	  	</script>
  </body>
</html>