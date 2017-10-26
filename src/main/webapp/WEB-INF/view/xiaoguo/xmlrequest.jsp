<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>

  </head>
  
  <body>
      <input id="a"/>&nbsp;&nbsp;&nbsp;&nbsp;<input id="b"/>&nbsp;&nbsp;&nbsp;&nbsp;和<input id="he" /><br />
      <input type="button" id="butt" value="计算"/>
  </body>
  
   <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
   <script type="text/javascript">
	    var xmlHttp;
		function createXMLHttpRequest(){
		   if(window.ActiveXObject)
		   {
		      xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		   }
		   else if(window.XMLHttpRequest)
		   {
		      xmlHttp = new XMLHttpRequest();
		   }
		}
   
   	   $("#butt").click(function (){
   		   createXMLHttpRequest();
   		   var url = "../servlet/hello?a="+$("#a").val()+"&b="+$("#b").val();
   		  // xmlHttp.progress = updateProgress;
   		   xmlHttp.open("get",url,true);
   		   xmlHttp.onreadystatechange=ShowResult;
   		   xmlHttp.send(null);
   	   });
   	   
   	   function ShowResult(){
   		   if(xmlHttp.readyState==4){
			   if(xmlHttp.status==200){
				  $("#he").val(xmlHttp.responseText);
			   }   			   
   		   }
   	   }
   	   
   	   function updateProgress(evt) {
   		   console.log("dsds");
		  if (evt.lengthComputable) {
		    var percentComplete = evt.loaded / evt.total;
		    console.log(percentComplete);
		  } else {
		    // Unable to compute progress information since the total size is unknown
		  }
	  }
   </script>
</html>
