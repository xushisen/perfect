<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
	<link rel="stylesheet" type="text/css" href="../css/zidingyi.css"/>
  	<style type="text/css">
  		*{margin:0;padding:0}
  		body{font:normal 14px "Microsoft Yahei","冬青黑体简体中文 w3","宋体";font-size:12px;overflow:auto;}
  		.liuyan{width:90%;margin:50px auto 50px;}
  		/**留言板list S*/
  		.liu{width:100%;overflow:auto;border-bottom:1px solid #ececec;padding:18px 0 5px 0}
  		.liu .l_logo{width:50px;float:left;}
  		.liu .l_logo a img{border-radius:25px;}
  		.liu .l_content{width:calc(100% - 60px);float:right;margin-left:10px;}
  		.liu .l_content .c_title{height:30px;}
  		.liu .l_content .c_title a{height:100%;min-width:30px;display:block;font-weight:bold;color:black;text-decoration:none;float:left;}
  		.liu .l_content .c_title span{width:100px;height:100%;display:block;margin-left:20px;float:left;}
  		.liu .l_content .c_con{color:#666;font-size:14px;}
  		/**留言板list E*/
  		
  		/**发表  S*/
  		.fabiao{width:90%;height:150px;margin:50px auto;position:relative;}
  		.fabiao .f_con{width:calc(100% - 20px);min-height:80px;border:1px solid #d7d7d7;outline:none;padding:10px;}
  		.fabiao .f_con:focus{border:1px solid #7fb52b}
  		.fabiao .f_but{width:100%;height:50px;}
  		.fabiao .f_but a{width:85px;height:25px;float:right;text-align:center;line-height:25px;text-decoration:none;background:#699f00;border-radius:4px;margin-top:5px;color:#fff;}
  		.fabiao .f_but a:hover{background:#7fb52b;cursor:pointer;}
  		.fabiao .f_but span{width:300px;height:25px;float:left;margin:5px;}
  		.fabiao .f_but span,.fabiao .f_tu ul li{cursor:pointer;}
  		.fabiao .f_tu{display:none;width:310px;height:252px;background:#fff;box-shadow:0 0 1px #666;position:absolute;top:130px;left:10px;}
  		.fabiao .f_tu ul li{list-style:none;float:left;margin:3px;}
  		/**发表  E*/
  	</style>
  </head>
  
  <body>
      <!-- 发表  S -->
  	  <div class="fabiao">
  	     <input type="hidden" value="${sessionScope.userName}" id="name" />
  	  	 <div class="f_con" id="f_con" contenteditable="true">说出你的心里话...</div>
  	  	 <div class="f_but"><span><img src="../images/fabiao/zy_thumb.gif" width="22" height="22" alt="发表图片" /></span><a href="javascript:;" onclick="fabiao()">发表评论</a></div>
  	  	 <!-- 图片显示 -->
  	  	 <div class="f_tu">
  	  	 	<ul></ul>
  	  	 </div>
  	  </div>
  	  <!-- 发表  E -->
	  <div class="liuyan">
	  	 <!-- 留言板list S -->
	     <div class="liu">
	     	<div class="l_logo">
	     		<a href="javascript:;" target="_blank">
	     			<img src="http://himg.bdimg.com/sys/portrait/item/ad31f927.jpg" width="50" height="50" alt="头像" />
	     		</a>
	     	</div>
	     	<div class="l_content">
	     		<div class="c_title">
	     			<a href="javascript:;">徐石森</a><span>2016-12-17</span>
	     		</div>
	     		<div class="c_con">
	     			说实话那个小提琴拉的配合不到一起啊! 老萧每次唱抒情都有争议，希望多唱些抒情！因为摇滚你已经无敌了[可爱][可爱]>
	     			说实话那个小提琴拉的配合不到一起啊! 老萧每次唱抒情都有争议，希望多唱些抒情！因为摇滚你已经无敌了[可爱][可爱]>
	     			说实话那个小提琴拉的配合不到一起啊! 老萧每次唱抒情都有争议，希望多唱些抒情！因为摇滚你已经无敌了[可爱][可爱]>
	     			说实话那个小提琴拉的配合不到一起啊! 老萧每次唱抒情都有争议，希望多唱些抒情！因为摇滚你已经无敌了[可爱][可爱]>
	     		</div>
	     	</div>
	     </div>
	  	 <!-- 留言板list E -->
	     <div class="liu">
	     	<div class="l_logo">
	     		<a href="javascript:;" target="_blank">
	     			<img src="http://himg.bdimg.com/sys/portrait/item/ad31f927.jpg" width="50" height="50" alt="头像" />
	     		</a>
	     	</div>
	     	<div class="l_content">
	     		<div class="c_title">
	     			<a href="javascript:;">王雪瑶</a><span>2016-12-17</span>
	     		</div>
	     		<div class="c_con">
	     			说实话那个小提琴拉的配合不到一起啊! 老萧每次唱抒情都有争议，希望多唱些抒情！因为摇滚你已经无敌了[可爱][可爱]>
	     			说实话那个小提琴拉的配合不到一起啊! 老萧每次唱抒情都有争议，希望多唱些抒情！因为摇滚你已经无敌了[可爱][可爱]>
	     		</div>
	     	</div>
	     </div>
	     <div class="liu">
	     	<div class="l_logo">
	     		<a href="javascript:;" target="_blank">
	     			<img src="http://himg.bdimg.com/sys/portrait/item/ad31f927.jpg" width="50" height="50" alt="头像" />
	     		</a>
	     	</div>
	     	<div class="l_content">
	     		<div class="c_title">
	     			<a href="javascript:;">徐石森</a><span>2016-12-17</span>
	     		</div>
	     		<div class="c_con">
	     			说实话那个小提琴拉的配合不到一起啊! 老萧每次唱抒情都有争议，希望多唱些抒情！因为摇滚你已经无敌了[可爱][可爱]>
	     			说实话那个小提琴拉的配合不到一起啊! 老萧每次唱抒情都有争议，希望多唱些抒情！因为摇滚你已经无敌了[可爱][可爱]>
	     			说实话那个小提琴拉的配合不到一起啊! 老萧每次唱抒情都有争议，希望多唱些抒情！因为摇滚你已经无敌了[可爱][可爱]>
	     			说实话那个小提琴拉的配合不到一起啊! 老萧每次唱抒情都有争议，希望多唱些抒情！因为摇滚你已经无敌了[可爱][可爱]>
	     			说实话那个小提琴拉的配合不到一起啊! 老萧每次唱抒情都有争议，希望多唱些抒情！因为摇滚你已经无敌了[可爱][可爱]>
	     			说实话那个小提琴拉的配合不到一起啊! 老萧每次唱抒情都有争议，希望多唱些抒情！因为摇滚你已经无敌了[可爱][可爱]>
	     			说实话那个小提琴拉的配合不到一起啊! 老萧每次唱抒情都有争议，希望多唱些抒情！因为摇滚你已经无敌了[可爱][可爱]>
	     		</div>
	     	</div>
	     </div>
	   </div>
     <script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	  <script type="text/javascript" src="../js/zidingyi/alert.min.js"></script>
     <script type="text/javascript" src="../js/zidingyi/tsUtil.js"></script>
     <script type="text/javascript">
     
        $(".fabiao .f_con").click(function (){
        	if($(this).html() == "说出你的心里话...") $(this).text("");
        });
        
        $(".fabiao .f_con").blur(function (){
        	if($(this).html() == "") $(this).text("说出你的心里话...");
        });
        
        /**发表*/
     	function fabiao(){
     		var fabiaoHtml = $(".fabiao .f_con").html();
     		if(fabiaoHtml == "说出你的心里话..."){
     			$.jAlert({
    				title:"提示",
    				content:"您还没有输入任何内容",
    				sfqp:false,   //true 需要跳出ifame封住全屏
    				direction:"left",
    				qd:function (){
    				}
    			});
     			return;
     		}
     		var div = "<div class=\"liu\">"+
     		             "<div class=\"l_logo\">"+
     		                 "<a href=\"javascript:;\" target=\"_blank\">"+
     		                    "<img src=\"http://himg.bdimg.com/sys/portrait/item/ad31f927.jpg\" width=\"50\" height=\"50\" alt=\"头像\" />"+
     		                 "</a>"+
     		             "</div>"+
     		             "<div class=\"l_content\">"+
     		                 "<div class=\"c_title\">"+
     		                     "<a href=\"javascript:;\">"+$("#name").val()+"</a><span>"+new Date().format('yyyy-MM-dd')+"</span>"+
     		                 "</div>"+
     		                 "<div class=\"c_con\">"
     		                 	+fabiaoHtml+
     		                 "</div>"+
     		               "</div>"+
     		             "</div>";
     		$(".liuyan").prepend(div);
     		$.ts({"direction":"load","content":"发表成功","time":"1000"});   //load准备
     		$(".fabiao .f_con").text("说出你的心里话...");
     	}
        
     	/**
     	 * 将js Date对象格式化为指定格式,添加一个原型方法
     	 * 返回指定format的string
     	 * format eg:'yyyy-MM-dd hh:mm:ss'
     	 **/
     	Date.prototype.format = function(format) {
     	    var o = {
     	        "M+": this.getMonth() + 1,
     	        "d+": this.getDate(),
     	        "h+": this.getHours(),
     	        "m+": this.getMinutes(),
     	        "s+": this.getSeconds(),
     	        "q+": Math.floor((this.getMonth() + 3) / 3),
     	        "S": this.getMilliseconds()
     	    };
     	    if (/(y+)/.test(format)) {
     	        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
     	    }
     	    for (var k in o) {
     	        if (new RegExp("(" + k + ")").test(format)) {
     	            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
     	        }
     	    }
     	    return format;
     	};

     	/**点击图片隐藏显示*/
     	$(".fabiao .f_but span img").click(function (){
     		$(".fabiao .f_tu").slideToggle();
     	});
     	
     	//异步加载图片
     	var tupian = [
   					{"src":"../images/fabiao/zz2_thumb.gif",title:"[织]"},
   					{"src":"../images/fabiao/horse2_thumb.gif",title:"[神马]"},
   					{"src":"../images/fabiao/fuyun_thumb.gif",title:"[浮云]"},
   					{"src":"../images/fabiao/geili_thumb.gif",title:"[给力]"},
   					{"src":"../images/fabiao/wg_thumb.gif",title:"[围观]"},
   					{"src":"../images/fabiao/vw_thumb.gif",title:"[威武]"},
   					{"src":"../images/fabiao/panda_thumb.gif",title:"[熊猫]"},
   					{"src":"../images/fabiao/rabbit_thumb.gif",title:"[兔子]"},
   					{"src":"../images/fabiao/otm_thumb.gif",title:"[奥特曼]"},
   					{"src":"../images/fabiao/j_thumb.gif",title:"[囧]"},
   					{"src":"../images/fabiao/hufen_thumb.gif",title:"[互粉]"},
   					{"src":"../images/fabiao/liwu_thumb.gif",title:"[呵呵]"},
   					{"src":"../images/fabiao/tootha_thumb.gif",title:"[嘻嘻]"},
   					{"src":"../images/fabiao/laugh.gif",title:"[哈哈]"},
   					{"src":"../images/fabiao/kl_thumb.gif",title:"[可怜]"},
   					{"src":"../images/fabiao/kbsa_thumb.gif",title:"[挖鼻屎]"},
   					{"src":"../images/fabiao/cj_thumb.gif",title:"[吃惊]"},
   					{"src":"../images/fabiao/shamea_thumb.gif",title:"[害羞]"},
   					{"src":"../images/fabiao/zy_thumb.gif",title:"[挤眼]"},
   					{"src":"../images/fabiao/bz_thumb.gif",title:"[闭嘴]"},
   					{"src":"../images/fabiao/bs2_thumb.gif",title:"[鄙视]"},
   					{"src":"../images/fabiao/lovea_thumb.gif",title:"[爱你]"},
   					{"src":"../images/fabiao/sada_thumb.gif",title:"[泪]"},
   					{"src":"../images/fabiao/heia_thumb.gif",title:"[偷笑]"},
   					{"src":"../images/fabiao/qq_thumb.gif",title:"[亲亲]"},
   					{"src":"../images/fabiao/sb_thumb.gif",title:"[生病]"},
   					{"src":"../images/fabiao/mb_thumb.gif",title:"[太开心]"},
   					{"src":"../images/fabiao/ldln_thumb.gif",title:"[懒得理你]"},
   					{"src":"../images/fabiao/yhh_thumb.gif",title:"[右哼哼]"},
   					{"src":"../images/fabiao/zhh_thumb.gif",title:"[左哼哼]"},
   					{"src":"../images/fabiao/x_thumb.gif",title:"[嘘]"},
   					{"src":"../images/fabiao/cry.gif",title:"[衰]"},
   					{"src":"../images/fabiao/wq_thumb.gif",title:"[委屈]"},
   					{"src":"../images/fabiao/t_thumb.gif",title:"[吐]"},
   					{"src":"../images/fabiao/k_thumb.gif",title:"[打哈气]"},
   					{"src":"../images/fabiao/bba_thumb.gif",title:"[抱抱]"},
   					{"src":"../images/fabiao/angrya_thumb.gif",title:"[怒]"},
   					{"src":"../images/fabiao/yw_thumb.gif",title:"[疑问]"},
   					{"src":"../images/fabiao/cza_thumb.gif",title:"[馋嘴]"},
   					{"src":"../images/fabiao/88_thumb.gif",title:"[拜拜]"},
   					{"src":"../images/fabiao/sk_thumb.gif",title:"[思考]"},
   					{"src":"../images/fabiao/sweata_thumb.gif",title:"[汗]"},
   					{"src":"../images/fabiao/sleepya_thumb.gif",title:"[困]"},
   					{"src":"../images/fabiao/sleepa_thumb.gif",title:"[睡觉]"},
   					{"src":"../images/fabiao/money_thumb.gif",title:"[钱]"},
   					{"src":"../images/fabiao/sw_thumb.gif",title:"[失望]"},
   					{"src":"../images/fabiao/cool_thumb.gif",title:"[酷]"},
   					{"src":"../images/fabiao/hsa_thumb.gif",title:"[花心]"},
   					{"src":"../images/fabiao/hatea_thumb.gif",title:"[哼]"},
   					{"src":"../images/fabiao/gza_thumb.gif",title:"[鼓掌]"},
   					{"src":"../images/fabiao/dizzya_thumb.gif",title:"[晕]"},
   					{"src":"../images/fabiao/bs_thumb.gif",title:"[悲伤]"},
   					{"src":"../images/fabiao/crazya_thumb.gif",title:"[抓狂]"},
   					{"src":"../images/fabiao/h_thumb.gif",title:"[黑线]"},
   					{"src":"../images/fabiao/yx_thumb.gif",title:"[阴险]"},
   					{"src":"../images/fabiao/nm_thumb.gif",title:"[怒骂]"},
   					{"src":"../images/fabiao/hearta_thumb.gif",title:"[心]"},
   					{"src":"../images/fabiao/unheart.gif",title:"[伤心]"},
   					{"src":"../images/fabiao/pig.gif",title:"[猪头]"},
   					{"src":"../images/fabiao/ok_thumb.gif",title:"[ok]"},
   					{"src":"../images/fabiao/ye_thumb.gif",title:"[耶]"},
   					{"src":"../images/fabiao/good_thumb.gif",title:"[good]"},
   					{"src":"../images/fabiao/no_thumb.gif",title:"[不要]"},
   					{"src":"../images/fabiao/z2_thumb.gif",title:"[赞]"},
   					{"src":"../images/fabiao/come_thumb.gif",title:"[来]"},
   					{"src":"../images/fabiao/sad_thumb.gif",title:"[弱]"},
   					{"src":"../images/fabiao/lazu_thumb.gif",title:"[蜡烛]"},
   					{"src":"../images/fabiao/clock_thumb.gif",title:"[钟]"},
   					{"src":"../images/fabiao/cake.gif",title:"[蛋糕]"},
   					{"src":"../images/fabiao/m_thumb.gif",title:"[话筒]"},
   					{"src":"../images/fabiao/weijin_thumb.gif",title:"[围脖]"},
   					{"src":"../images/fabiao/lxhzhuanfa_thumb.gif",title:"[转发]"},
   					{"src":"../images/fabiao/lxhluguo_thumb.gif",title:"[路过这儿]"},
   					{"src":"../images/fabiao/bofubianlian_thumb.gif",title:"[bofu变脸]"},
   					{"src":"../images/fabiao/gbzkun_thumb.gif",title:"[gbz困]"},
   					{"src":"../images/fabiao/boboshengmenqi_thumb.gif",title:"[生闷气]"},
   					{"src":"../images/fabiao/chn_buyaoya_thumb.gif",title:"[不要啊]"},
   					{"src":"../images/fabiao/daxiongleibenxiong_thumb.gif",title:"[泪奔]"},
   					{"src":"../images/fabiao/cat_yunqizhong_thumb.gif",title:"[运气中]"},
   					{"src":"../images/fabiao/youqian_thumb.gif",title:"[有钱]"},
   					{"src":"../images/fabiao/cf_thumb.gif",title:"[冲锋]"},
   					{"src":"../images/fabiao/camera_thumb.gif",title:"[照相机]"}
     			];
     	//添加到ul
     	$.each(tupian,function(i,data){
     		$(".fabiao .f_tu ul").append("<li title='"+data.title+"'><img src='"+data.src+"' width=\"22\" height=\"22\" alt=\"发表图片\" /></li>");
     	});
     	
     	$(".fabiao .f_tu ul li").click(function (){
     		var src = $(this).find("img").attr("src");
     		if($(".fabiao .f_con").text() == "说出你的心里话..."){
     			$(".fabiao .f_con").text("");
     		}
     		$(".fabiao .f_con").append("<img src='"+src+"' width=\"22\" height=\"22\" alt=\"发表图片\" />");
     		/**var v = $(".fabiao .f_con").get(0);
     		if(document.all){//如果为ie
     		    var range=v.createTextRange();
     		    range.moveEnd('character',v.value.length);    
     		    //range.moveStart('character',0);
     		    range.collapse(false);
     		    range.select();
     		}else{
     		    obj.setSelectionRange(v.value.length,v.value.length);
     		    obj.focus();
     		}*/
     	});
     	
     	/**点击空白区域图片隐藏*/
     	$("body").click(function (event){
     		//console.log(event.target.nodeName+"..."+event.target.nodeName == "IMG");
     		if(event.target.nodeName != "IMG"){
     			$(".fabiao .f_tu").slideUp();
     		}
     	});
     </script>
  </body>
</html>
