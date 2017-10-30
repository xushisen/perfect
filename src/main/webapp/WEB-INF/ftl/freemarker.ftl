<!DOCTYPE HTML>
<html>
  <head>
  	<#assign ctx = request.contextPath />
    <title>freemarker</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/biaoge.css"/>
  </head>
  
  <body>
  	 <p id="woqu">welcome ${name} to freemarker</p>
  	 <p>性别:
  	 	<#if genter == 0> 女
  	 	<#elseif genter == 1> 男
  	 	<#else> 保密 </#if>
  	 </p>
  	 <h4>我的好友:</h4>
  	 <#list friends as item>
  	 	姓名:${item.name},年龄:${item.age}<br />
  	 </#list>
  	 <@page count="300" page="1" pagesize="20"></@page>
  	 <script type="text/javascript" src="${ctx}/js/jquery/jquery-1.9.1.min.js"></script>
  	 <script type="text/javascript">
	  	 $(parent.window.document.body).find(".mask").remove();//取消遮罩层
	 </script>
  </body>
</html>