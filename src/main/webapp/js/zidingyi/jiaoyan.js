/**
 * 上面弹出框校验
 * voliad  必填
 * letterOrNum  必须是字母和数字
 */
 $.voliad = function(options){
	//解析传进来的所有name
	var flag = true;
	var opts = $.extend({},$.voliad.method,options);
	for(var i=0;i<options.length;i++){
		var obj = $("input[name='"+options[i].name+"']");  //对象
		var title = options[i].title;  //提示
		var voliad = options[i].required;  //必填
		var letterOrNum = options[i].letterOrNum; //字母数字
		if(voliad != undefined){
			flag = opts.required(obj,title);
			if(flag == false){  //校验不通过直接跳出 返回false
				break;
			}
		}
		if(letterOrNum != undefined){
			flag = opts.letterOrNum(obj,title);
			if(flag == false){  //校验不通过直接跳出 返回false
				break;
			}
		}
		//var len = options[i].length;
		//alert(len);
		/**for(var key in options[i]){
			//var name = key;  //每个对象的属性
			//var vlaue = options[i][key];  //每个对象的属性值
			if(key != 'name' && key != 'title'){  //这2个属性不是校验的
				console.log("dsds:"+key);
				flag = opts.key(obj,title);
				if(flag == false){
					break;
				}
			}
		}*/
	}
	return flag;
 };
 
 $.voliad.method = {
	 //必填
	 required:function(obj,title){
	 	 if(! obj.val()){ 
	 		 error(title+"必填项");
	 		 obj.focus();
	 		 return false;
	 	 }
	 	 return true;
	 },
     //字母或者数字
 	 letterOrNum:function(obj,title){
 		 var reg = /^[0-9a-zA-Z]*$/g;
 		 if(! reg.test(obj.val())){
 			 error(title+"格式不正确");
		 		 obj.focus();
		 		 return false;
	 		 }
	 		 return true;
	 	 }
   };
	 
  	 /**error*/
  	 function error(content){
  		 $(".error").remove();
  		 var div = $("<div class='error'>"+content+"</div>");
  		 $("body").append(div);
  		 setTimeout(removeErroe,2000);
  	 }
 
     function removeErroe(){
    	 $(".error").slideUp(function(){$(".error").remove();});
     }
 
 	 /**转换form表单的对象*/
	 function zh(params){
		 var param = {};
		 for(var i=0;i<params.length;i++){
			 param[params[i].name] = {
				value:params[i].value,
				obj:$("input[name='"+params[i].name+"']")
			 };
		 }
		 return param;
	 }
