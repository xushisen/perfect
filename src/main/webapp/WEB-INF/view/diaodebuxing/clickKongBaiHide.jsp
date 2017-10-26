<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>点击空白处关闭弹出层</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
#box{width:300px;height:200px;border:1px solid #000;display:none;}
.btn{color:red;}
</style>
<script type="text/javascript" src="http://www.internetke.com/public/js/jquery.js"></script>
<script type="text/javascript">
$(function(){
    $(".btn").click(function(event){
        var e=window.event || event;
        if(e.stopPropagation){
            e.stopPropagation();
        }else{
            e.cancelBubble = true;
        }   
        $("#box").show();
    });
    $("#box").click(function(event){
        var e=window.event || event;
        if(e.stopPropagation){
            e.stopPropagation();
        }else{
            e.cancelBubble = true;
        }
    });
    document.onclick = function(){
        $("#box").hide();
    };
});
</script>
</head>
<body>
<div id="box"></div>
<span class="btn">点击此处打开弹出层</span><br>点击空白处关闭弹出层
</body>
</html>
