<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
  <head>
  </head>
  
  <body>
  	   <%-- behavior="alternate"  marquee的属性 意思就是左右晃动 --%>
   	  <marquee>成功其实也不难，只要树立一个目标，不需要你是一个很强的人，不需要你很高智商，不需要你是千里马，你只要像老黄牛一样，每天哪怕做一点点，往目标前进一点点，你就会成功。可是成功又很难，因为在通往成功的路上，很少人能够坚持下来。在坚持的过程中，很多人都选择了放弃</marquee>
  	  <div class="logo"><a href="<c:url value="/"/>"><img src="images/indexlogo.png" width="164" height="52" alt="logo" /></a></div>
  	  <div class="name">${sessionScope.userName}</div>
  	  <div class="n_xx">
  	  		<ul>
  	  			<li><a title="个人信息" href="javascript:;" onclick="grxx()">个人中心</a></li>
  	  			<li><a title="退出系统" href="javascript:;" onclick="exit()">退出</a></li>
  	  		</ul>
  	  	</div>
  	  <div class="cz">
  	  	 <a title="意见反馈" target="Conframe" href="shijian/liuyanban">反馈</a>
  	  	 <a title="更换皮肤" href='javascript:;' onclick='hf()'>换肤</a>
  	  </div>
  </body>
</html>
