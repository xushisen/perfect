/**
 * 在后面拼的校验
 * @param {Object} options
 * 存在的bug  无法记住鼠标移走后如果第一个校验通过了 第二个没有校验通过 那么鼠标移走应该自动校验第二个
 * 因为现在jiaoyan这个方法返回的只会是第一个  所以鼠标移走怎么校验的都是第一个  如果要校验其他的 需要那个方法返回
 * 全部的  然后在blurJiao用indexOf里面一个一个去判断  不通过直接不往下执行  然后提示
 */
 
 $.voliadNext = function(options){
	 var opts = $.extend({},$.voliadNext.method,options);
	 var len = options.length,i=0;
	 var flag = true;
	 for(;i<len;i++){
		 var obj = $("input[name='"+options[i].name+"']");  //对象
		 var title = options[i].title;  //提示
		 //添加光标事件
		 //光标进入
		 $(obj).focus(function (){
			 opts.removePj($(this));
		 });
		 //光标移走
		 $(obj).blur(function (){
			 //校验该对象的校验项的信息是否通过
			 var volid = opts.jiaoyan(options,$(this).attr("name"));  //获取该校验项的第一个校验  目的是为了鼠标失去焦点以后再去校验是否通过
			 opts.blurJiao(volid,$(this));  //鼠标移走需要做的操作
		 });
		 
		 //需要校验的项目
		 var voliad = options[i].required;  //必填
		 var letterOrNum = options[i].letterOrNum; //字母数字
		 if(voliad != undefined){
			 flag = opts.required(obj);
			 if(flag == false){
				 continue;  //跳出本次循环 执行下一个校验 
			 }
		 }
		 if(letterOrNum != undefined){
			 flag = opts.letterOrNum(obj);
			 if(flag == false){
				 continue;
			 } 
		 }
	 }
	 return flag;
 }
 
 /**
  * 向后拼接的提示
  * @param {Object} volid
  * @param {Object} obj
  * @memberOf {TypeName} 
  */
 $.voliadNext.method = {
	  /**
	   * 鼠标移走需要做的操作
	   * @param {Object} volid
	   * obj 需要校验的对象
	   */
	  blurJiao:function(volid,obj){
  		 if(volid != ''){
			 if(volid == 'required'){  //必填
				this.required(obj);
			 }
			 if(volid == 'letterOrNum'){  //字母数字 
				this.letterOrNum(obj);
			 }
		  }else{
			 alert("返回空字符串");
		  }
	  },
	  /**
	   * 用于光标移走时取出该项的所有的校验项
	   * @param {Object} options  所有的需要校验
	   * @param {Object} name   需要匹配的校验
	   * 如果只校验第一个就返回第一个  如果要全部校验  返回全部校验的  在blurJiao用indexOf
	   */
	  jiaoyan:function(options,name){
	 	 var len = options.length,i=0;
	 	 for(;i<len;i++){
	 		 if(options[i].name==name){
	 			 return JSON.stringify(options[i]).split('"')[9]; //每个校验的第一个校验项
	 		 }
	 	 }
	 	 return "";
	  },
	  //必填
	  required:function(obj){
	      if(! obj.val()){
	    	  this.pj(obj,"必填项");
	    	  return false;
	      }
	      return true;
	  },
	  //字母或者数字
	  letterOrNum:function(obj,title){
 		 var reg = /^[0-9a-zA-Z]*$/g;
 		 if(! reg.test(obj.val())){
	 		 this.pj(obj,"必须是字母和数字组成");
	 		 return false;
	 	 }
	     return true;
	  },
	  //拼接提示
	  pj:function(obj,title){
		  this.removePj(obj);  //先移出一下
		  $(obj).after("<span style='background:red;'>"+title+"</span>");
	  },
	  //取消提示
	  removePj:function(obj){
		  $(obj).next("span").remove();
	  }
 }