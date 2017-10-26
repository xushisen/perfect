/**
 * 拖拽上传
 */
/**
 * 点击显示拖拽的区域
 */
 $(function(){ 
	//必须加上阻止行为
    //阻止浏览器默认行。 
     $(document).on({ 
        dragleave:function(e){    //拖离
            e.preventDefault(); 
        }, 
        drop:function(e){  //拖后放 
            e.preventDefault(); 
        }, 
        dragenter:function(e){    //拖进 
            e.preventDefault(); 
        }, 
        dragover:function(e){    //拖来拖去 
            e.preventDefault(); 
        } 
    }); 
});
 
$(".tzsctopright").click(function (){
	$(".zz").slideToggle();
});

var tu = new Array();  //记录图片以便显示在列表里
var xhr;   //xht对象
var index = 0;
$.tzsc = function (options){
	var opts = $.extend({},$.tzsc.method,options);
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
					tu[index] = this.result;  //存储数据
					index++;
				};
				
			}else{
				alert("不是图片");
			}
		}
		//提交
		opts.uploading(form1,opts.url);
	};
};

$.tzsc.method = {
	//创建xhr对象
	createXhr:function(){
	   if (window.XMLHttpRequest){
          xhr=new XMLHttpRequest();
       }else if(window.ActiveXObject){
  	      xhr=new ActiveXObject("Microsoft.XMLHTTP");
       }
	},
	//发送数据
	uploading:function(form1,url){
	this.createXhr();
	//监听进度
	xhr.upload.onprogress = this.updateProgress;
	//上传成功的回掉函数
	xhr.upload.load = this.uploadComplete;
	//回掉函数
	xhr.onreadystatechange = this.callback;
		
	//获取根路径
	var path = this.getRootPath();
	xhr.open("post",path+url,true);
	//设置xhr请求的超时时间
  	xhr.timeout = 3000;
	//xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
	xhr.send(form1);
	},
	//上传进度监听
	updateProgress:function(event){
		if (event.lengthComputable) {
    		console.log("接收到 " + event.loaded + " of " + event.total + " bytes");
    	}
	},
	callback:function(){
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {//表示服务器的相应代码是200；正确返回了数据   
				var json = xhr.responseText;
				var jsonObject = eval("(" + json + ")");
				for(var i=0;i<jsonObject.length;i++){
					var tr = $("<tr><td>"+"<img src='/test/"+jsonObject[i].name+"' width='30' height='30' style='margin:2px;'>"+"</td><td>"+jsonObject[i].name+"</td><td>"+jsonObject[i].size+"</td></tr>");
					$(".table tbody").append(tr);
				}
				$.ts({"width":"140px","height":"30px","color":"#fff","content":"上传完成,共"+jsonObject.length+"条","backgroundColor":"green","type":"Left","direction":"around","date":"2000"});
				$.tpyl({divId:"table"});  /**divId 需要div里面的图片放大*/
			}
		}
	},
	//上传成功的回掉函数
	uploadComplete:function(event){
		console.log(event.target.responseText+"....上传成功");
	},
	//获取项目根目录
	getRootPath:function(){
		var strFullPath=window.document.location.href;
		var strPath=window.document.location.pathname;
		var pos=strFullPath.indexOf(strPath);
		var prePath=strFullPath.substring(0,pos);
		var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
		return(prePath+postPath);
	}
};
