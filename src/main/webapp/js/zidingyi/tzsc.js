/**
 * 拖拽上传
 */
var tu = new Array();
var index = 0;
$(function (){
	$(".tzsctopright").click(function (){
		$(".zz").slideToggle();
	});

	var ob = $(".zz").get(0);//get(0) 转换成dom对象
	var te = $(".text");
	//鼠标进入
	ob.ondragenter = function (e){
		e = e || window.event;
		e.stopPropagation();
		e.preventDefault();
		te.html("你可以放开本帅了!!!");
	};
	//鼠标离开
	ob.ondragleave = function (e){
		e = e || window.event;
		e.stopPropagation();
		e.preventDefault();
		te.html("请将图片拖至此区域");
	};
	ob.ondrop = function (e){
		e = e || window.event;
		e.stopPropagation();
		e.preventDefault();
		var fs = e.dataTransfer.files;
		var len = fs.length;  //获取拖过来的个数
		te.html("");
		var form1 = new FormData();  //创建fromdate对象
		for(var i=0;i<len;i++){
			//获取table的最后一个tr
			var _type = fs[i]; //获取文件类型
			if(_type.type.indexOf('image')!=-1){
				var fd = new FileReader();
				//文件读取
				fd.readAsDataURL(fs[i]);
				var filename = _type.name; //图片名称
				var filesize = Math.floor((_type.size)/1024); //图片大小
				//alert("名称:"+filename+"大小:"+filesize);
				if(filesize>500){ 
					alert("上传大小不能超过500K.");
					te.html("请将图片拖至此区域");
					return false; 
				} 
				form1.append("file",fs[i]);  //添加到表单
				//文件读取完毕
				fd.onload = function (){
					//var olmg = $("<img src='' width='100' height='100' style='margin:2px;'>")
					//olmg.attr("src",this.result);
					console.log("尽了第"+index+"ci");
					tu[index] = this.result;  //存储数据
					index++;
				};
				
			}else{
				alert("不是图片");
			}
		}
		//提交
		uploading(form1);
	};
});

/**上传*/
function uploading(form1){
	var xhr = new XMLHttpRequest();
	//监听进度
	xhr.upload.addEventListener("progress", function(event) {  
    if (event.lengthComputable) {  
        console.log("接收到 " + event.loaded + " of " + event.total + " bytes");
  	   }  
	}, false);  
   
	xhr.upload.addEventListener("load", function(e){  
		console.log("上传完成");
	}, false);  

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {//表示服务器的相应代码是200；正确返回了数据   
				//console.log(xhr.responseText);
				var json = xhr.responseText;
				var jsonObject = eval("(" + json + ")");
				console.log("长度====="+tu.length);
				for(var z=0;z<tu.length;z++){
					console.log("总长度=="+tu.length+"第"+z+"个="+tu[z]);
				}
				for(var i=0;i<jsonObject.length;i++){
					var tr = $("<tr><td>"+"<img src='"+tu[i]+"' width='100' height='100' style='margin:2px;'>"+"</td><td>"+jsonObject[i].name+"</td><td>"+jsonObject[i].size+"</td></tr>");
					$(".table tbody").append(tr);
				}
			}
		}
	};
	xhr.open("post","../servlet/hello",true);
	xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
	xhr.send(form1);
}