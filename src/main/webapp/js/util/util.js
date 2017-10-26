/**
 * 获得web根路径
 */
function getRootPath(){
	var strFullPath=window.document.location.href;
	var strPath=window.document.location.pathname;
	var pos=strFullPath.indexOf(strPath);
	var prePath=strFullPath.substring(0,pos);
	var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
	return(prePath+postPath);
}

/**
 * js数字相加  包含小数点
 * 
 * @param {string} value1 相加的数字1
 * @param {string} value2 相加的数字2
 */
function addValue(value1, value2){
    if (value1 == "") value1 = "0";
    if (value2 == "") value2 = "0";
    var temp1 = 0;
    var temp2 = 0;
    if (value1.indexOf(".") != -1) temp1 = value1.length - value1.indexOf(".")-1;
    if (value2.indexOf(".") != -1) temp2 = value2.length - value2.indexOf(".")-1;
    var temp = 0;
    if (temp1 > temp2) temp = (parseFloat(value1) + parseFloat(value2)).toFixed(temp1);
    else temp = (parseFloat(value1) + parseFloat(value2)).toFixed(temp2);
    return temp;
}

/**
 * 时间兼容浏览器 用法 if(NewDate($(dq).val()) < NewDate($("#filterTimeStart").val())) alert("结束日期不能小于开始日期")
 *
 * @param {string} str 需要转换的时间
 */
function NewDate(str) {
	str = str.split('-');
	var date = new Date();
	date.setUTCFullYear(str[0], str[1] - 1, str[2]);
	date.setUTCHours(0, 0, 0, 0);
	return date;
} 

/**
 * 是undefined true是
 * 
 * @param {string} value 需要判断的值
 */
function isUndefined(value){
	return typeof(value) == "undefined";
}

/**
 * 不是undefined true不是
 * 
 * @param {string} value 需要判断的值
 */
function isNotUndefined(value){
	return !isUndefined(value);
}

/**
 * 校验上传文件的大小
 * @param id  fileid
 * @param size  大小
 * @returns {Boolean}
 */
function getSize(id,size){
	var fileSize = 0;
    var isIE = /msie/i.test(navigator.userAgent) && !window.opera;          
    if (isIE && !obj.files) {
    	var filePath = $("#"+id).value;      
    	var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
    	var file = fileSystem.GetFile (filePath);               
    	fileSize = file.Size;    
    } else {
    	fileSize = $("#"+id).get(0).files[0].size;  
    }
    fileSize=Math.round(fileSize/1024/1024)*size; //单位为MB
    if(fileSize>=size){
        alert("照片最大尺寸为4MB，请重新上传!");
        return false;
    }
}

/**
 * 获取地址栏的参数值 
 * @params name(key)  alert(GetQueryString("参数名1"));
 */
function getUrlParams(name){
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}

/**
 * 模拟java的stringBuild S
 */
function StringBuffer() {
	this.strings = new Array();
}

StringBuffer.prototype.append = function (str) {
	this.strings.push(str);
	return this;    //方便链式操作
};

StringBuffer.prototype.toString = function () {
	return this.strings.join("");
};

/**
 * 横线后面首字母转成大写去掉横线
 */
function ucfirst(str) {
	var ds = str.split("_");
	var str = ds[1].toLowerCase();
	str = str.replace(/\b\w+\b/g, function(word){
	    return word.substring(0,1).toUpperCase()+word.substring(1);
	});
	return ds[0]+str;
}
	
/**var buffer = new StringBuffer();
buffer.append("Hello ").append("javascript");
alert(buffer.toString());*/
 /**
  * 模拟java的stringBuild E
  */