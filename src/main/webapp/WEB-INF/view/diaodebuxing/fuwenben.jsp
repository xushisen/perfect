<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<!-- 富文本  S -->  	
  	<link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
	<!-- 富文本  E -->
  </head>
  
  <body>
    <textarea name="styleContent" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${obj.styleContent}</textarea>
    
	 <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	 <!-- 富文本  S -->
	 <script charset="utf-8" src="../kindeditor/kindeditor-all.js"></script>
	 <script charset="utf-8" src="../kindeditor/lang/zh-CN.js"></script>
	 <script charset="utf-8" src="../kindeditor/plugins/code/prettify.js"></script>
	 <!-- 富文本  E -->
	 <script type="text/javascript">
	 $(parent.window.document.body).find(".mask").remove();//取消遮罩层
	 KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="styleContent"]', {
				height : "300px",
				cssPath : '<c:url value="/kindeditor/plugins/code/prettify.css"/>',
				uploadJson : '<c:url value="/fuploadFile"/>',
				fileManagerJson : '../jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				},
				afterBlur: function(){this.sync();}
			});
			prettyPrint();
		});
	 </script>
  </body>
</html>
