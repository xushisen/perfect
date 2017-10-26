/**
 * 点击确定直接上传
 * type false 单选 true  多选
 */
/**
 * function _s() {  
        var f = document.getElementById("f").files;  
        //上次修改时间  
        alert(f[0].lastModifiedDate);  
        //名称  
        alert(f[0].name);  
        //大小 字节  
        alert(f[0].size);  
        //类型  
        alert(f[0].type);  
    }  
 */
//进度条div
var jdtdiv = "<div class='jdt_k'><div class='jdt_title'>上传进度</div><div class='jdt_con'><div class='jdt_con_dt'></div><div class='jdt_con_fg'></div></div></div>";
//var tu = new Array();  //记录图片以便显示在列表里
//var index = 0;
 $.upload = function (options){
	 var opts = $.extend({},$.upload.method,options);
	 var types = options.types; //需要上传的文件类型
	 var flag = true; //校验文件的类型是否通过 true通过  false不通过
	 var input = $("#"+opts.id);
	 if(typeof FileReader==='undefined'){
		alert("浏览器不支持FileReader");
	 }else{
		var type = opts.type;
		if(type == "false"){  //单选
			input.removeAttr("multiple");
		}else{  //多选
			input.attr("multiple","100");
		}
		input.change(function (){
    		var len = this.files.length,i=0;
    		var form1 = new FormData();  //创建fromdate对象
    		for(;i<len;i++){
    			//alert(this.files[i].name+"..."+this.files[i].type+"..."+this.files[i].size);
    			var name = this.files[i].name;
    			var size = this.files[i].size;
    			var type = name.substring(name.lastIndexOf(".")+1,name.length);
    			flag = (types.indexOf(type)!=-1); //判断上传文件的类型
    			if(! flag){
    				break;
    			}
    			var reader = new FileReader();
    			reader.readAsDataURL(this.files[i]);
    			form1.append("file",this.files[i]);  //添加到表单
    		}
    		if(! flag){
    			 $.jAlert({
      				title:"提示",
      				content:"此文件类型不允许上传",
      				sfqp:false,   //true 需要跳出ifame封住全屏
      				direction:"left",
      				qd:function (){
      				}
      			});
    			return;
    		}else{
    			//提交
    			opts.uploading(form1,opts.url);
    		}
	 	});
	 }
 };
 $.upload.method = {
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
	var $this = this;
	this.createXhr();
	//监听进度
	xhr.upload.onprogress = this.updateProgress;
	//上传成功的回掉函数
	xhr.upload.load = this.uploadComplete;
	//回掉函数
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4) {  //readyStatus的5个状态  0: 请求未初始化  1: 服务器连接已建立	2: 请求已接收 3: 请求处理中4: 请求已完成，且响应已就绪
			if (xhr.status == 200) {//表示服务器的相应代码是200；正确返回了数据    404: 未找到页面
				var json = xhr.responseText;
				($this.success)(json); //返回数据  jquery的带有参数的回掉
			}else{  //出错返回error
				($this.error)();
			}
		}
	};
		
	//获取根路径
	var path = this.getRootPath();
	xhr.open("post",path+url,true);
	
	//设置xhr请求的超时时间
	xhr.timeout = 10000;  //如果上传一直出错   可以吧这个时间加长
	//xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
	//xhr.setRequestHeader("Content-Type","multipart/form-data;");
	xhr.send(form1);
	},
	//上传进度监听
	updateProgress:function(event){
		if (event.lengthComputable) {
    		//console.log("接收到 " + event.loaded + " of " + event.total + " bytes");
			$("body").append(jdtdiv);  //进度框显示
			//计算百分比    赋值给进度条宽度
			var dqjd = Math.round(event.loaded*100/event.total);
			//算出进度条的宽度
			var jdtWidth = $(".jdt_k .jdt_con .jdt_con_dt").width();
			var zuizhong;  //最终的百分比算出的宽度
			var xiaoshudian = dqjd<10&&dqjd!=100 ? "0.0" : "0.";
			dqjd == 100 ? zuizhong = jdtWidth : zuizhong = Math.round(jdtWidth*(xiaoshudian+dqjd));
			$(".jdt_k .jdt_con .jdt_con_fg").width(zuizhong);
			if(dqjd == 100){
				setTimeout(function(){$(".jdt_k").fadeToggle(function(){$(".jdt_k").remove();});},2000);
			}
    	}
	},
	/*callback:function(){
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {//表示服务器的相应代码是200；正确返回了数据   
				var json = xhr.responseText;
				var jsonObject = eval("(" + json + ")");
				var ul = "<ul></ul>";
				$(".fileUtil").append(ul);
				for(var i=0;i<jsonObject.length;i++){
					var li = $("<li><img src='/test/"+jsonObject[i].name+"' width='200px' height='200px' alt='图片'/><p title='"+jsonObject[i].name+"'>"+jsonObject[i].name+"</p><span>"+jsonObject[i].size+"</span></li>");
    				$(".fileUtil ul").append(li);
				}
				
				$.ts({"width":"140px","height":"30px","color":"#fff","content":"上传完成,共"+jsonObject.length+"条","backgroundColor":"green","type":"Left","direction":"around","date":"2000"});
				$.tpyl({divId:"fileUtil"});  *//**divId 需要div里面的图片放大*//*
			}
		}
	},*/
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