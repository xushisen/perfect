<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	 <style type="text/css">
		*{margin:0;padding:0}
		body{font-size:14px;color:#333;font-family:Verdana, Arial, Helvetica, AppleGothic, sans-serif;}
		ul li{list-style:none;}
		.ztree{margin:0;padding:5px;color:#333}
		.ztree li span.button{line-height:0;margin:0;padding:0;width:21px;height:21px;display:inline-block;vertical-align:middle;
		border:0 none;cursor:pointer;outline:none;background-color:transparent;background-repeat:no-repeat;background-attachment:scroll;background-image: url("../images/tree.png")}
		.ztree li span.button.switch{width:21px;height:21px;}
		.ztree li span.button.chk{width:13px;height:13px;margin:0 -2px;cursor:auto;}
		/**最前面的加号*/
		.ztree li span.button.roots_open{background-position:-105px 0;}
		/**最前面的减号*/
		.ztree li span.button.roots_close{background-position:-126px 0;}
		/**最前面的减号的最后一个加号*/
		.ztree li span.button.bottom_close{background-position:-126px -42px;}
		/**最前面的减号的最后一个减号*/
		.ztree li span.button.bottom_open{background-position:-105px -42px;}
		/**加号后面的蓝色方框复选框不选中*/
		.ztree li span.button.chk.checkbox_false_full{background-position:-5px -5px;}
		/**加号后面的蓝色方框复选框选中*/
		.ztree li span.button.chk.checkbox_true_full{background-position:-26px -5px;}
		/**复选框不能选中 默认不选中*/
		.ztree li span.button.chk.checkbox_readonly_notcheck{background-position:-5px -89px;}
		/**复选框不能选中 默认选中*/
		.ztree li span.button.chk.checkbox_readonly_check{background-position:-26px -89px;}
		/**文件夹打开图标*/
		.ztree li span.button.ico_open{margin-right:2px;background-position:-147px -21px;vertical-align:top;}
		/**文件夹关闭图标*/
		.ztree li span.button.ico_close{margin-right:2px;margin-right:2px;background-position:-147px 0;vertical-align:top;}
		/**二层立面的虚线*/
		.ztree li span.button.center_docu{background-position: -84px -21px;}
		/**二层立面的文件夹图标*/
		.ztree li span.button.ico_docu{margin-right:2px;background-position:-147px -43px;vertical-align:top;}
		/**二层虚线最后一个*/
		.ztree li span.button.bottom_docu{background-position:-84px -42px;}
		.ztree li ul.line {background:url("../images/line_conn.png") 0 0 repeat-y;}
		.ztree li ul{margin:0;padding:0 0 0 18px;}
		.ztree li a{padding-right:3px;margin:0;cursor:pointer;height:21px;color:#333;background-color:transparent;text-decoration:none;
		vertical-align:top;display:inline-block;}
		.none{display:none;}

		/**文件树css  S*/
		#treeView{width:600px;float:right;border:1px solid #f2f2f2;}
		#treeView ul .none{display:none;}
		.treeNode{height:32px;border:1px solid #fff;border-width:1px 0;cursor:pointer;font-size:0;}
		.treeNode:hover{background:#f4f9fd;border-color:#e5f0fb;}
		.treeNode-cur{background:#e5f0fb;border-color:#BBD4EF #fff;}
		.icon{background: url(../images/icon.png) no-repeat;vertical-align:middle;display:inline-block;}
		/**加号*/
		.icon-add{width:15px;height:15px;margin:0 4px;background-position:-30px 0;}
		/**减号*/
		.icon-minus{width:15px;height:15px;margin:0 4px;background-position:-30px -22px;}
		/**图片展开*/
		.icon-file{width:22px;height:18px;margin-right:5px;background-position:0 -22px;}
		/**图片关闭*/
		.icon-fileguan{width:22px;height:18px;margin-right:5px;background-position:0 0;}
		/**不显示图标*/
		.treeNode-empty .icon-add {background-position:-999px -999px;}
		.title{position:relative;top:6px;font-size:14px;}
		/**文件树css  e*/
	 </style>
  </head>
  
  <body>
  	 <div class="treeView" style="width:300px;float:left;">
			<!--<ul class="ztree">
				<li>
					<span class="button switch roots_open"></span>
					<span class="button chk checkbox_false_full" id="jidongdui"></span>
					<a title="机动队">
						<span class="button ico_open"></span>
						<span id="treeDemo_1_span" class="node_name">机动队</span>
					</a>
					<ul class="line">
						<li>
							<span class="button switch roots_close"></span>
							<span class="button chk checkbox_false_full" id="man"></span>
							<a title="男人">
								<span id="treeDemo_2_ico" class="button ico_close"></span>
								<span id="treeDemo_2_span" class="node_name">男人</span>
							</a>
							<ul class="line none">
								<li>
									<span class="button switch center_docu"></span>
									<span class="button chk checkbox_false_full" id="lzz"></span>
									<a title="刘壮壮">
										<span id="treeDemo_2_ico" class="button ico_docu"></span>
										<span id="treeDemo_2_span" class="node_name">刘壮壮</span>
									</a>
								</li>
								<li>
									<span class="button switch center_docu"></span>
									<span class="button chk checkbox_readonly_notcheck" id="xss"></span>
									<a title="徐石森">
										<span id="treeDemo_2_ico" class="button ico_docu"></span>
										<span id="treeDemo_2_span" class="node_name">徐石森</span>
									</a>
								</li>
								<li>
									<span class="button switch bottom_docu"></span>
									<span class="button chk checkbox_readonly_check" id="hg"></span>
									<a title="猴哥">
										<span id="treeDemo_2_ico" class="button ico_docu"></span>
										<span id="treeDemo_2_span" class="node_name">猴哥</span>
									</a>
								</li>
							</ul>
						</li>
						<li>
							<span class="button switch bottom_close"></span>
							<span class="button chk checkbox_false_full" id="woman"></span>
							<a title="女人">
								<span id="treeDemo_2_ico" class="button ico_close"></span>
								<span id="treeDemo_2_span" class="node_name">女人</span>
							</a>
							<ul class="none">
								<li>
									<span class="button switch bottom_docu"></span>
									<span class="button chk checkbox_false_full" id="zhr"></span>
									<a title="赵海瑞">
										<span id="treeDemo_2_ico" class="button ico_docu"></span>
										<span id="treeDemo_2_span" class="node_name">赵海瑞</span>
									</a>
								</li>
								<li>
									<span class="button switch bottom_docu"></span>
									<span class="button chk checkbox_false_full" id="haha"></span>
									<a title="哈哈哈">
										<span id="treeDemo_2_ico" class="button ico_docu"></span>
										<span id="treeDemo_2_span" class="node_name">哈哈哈</span>
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<span title="ahahah" class="button switch roots_close"></span>
					<span class="button chk checkbox_false_full" id="ypt"></span>
					<a title="云平台">
						<span class="button ico_close"></span>
						<span id="treeDemo_1_span" class="node_name">云平台</span>
					</a>
					<ul class="line none">
						<li>
							<span class="button switch center_docu"></span>
							<span class="button chk checkbox_false_full" id="yy"></span>
							<a title="杨渊">
								<span id="treeDemo_2_ico" class="button ico_docu"></span>
								<span id="treeDemo_2_span" class="node_name">杨渊</span>
							</a>
						</li>
						<li>
							<span class="button  switch bottom_docu"></span>
							<span class="button chk checkbox_false_full" id="lxm"></span>
							<a title="李小猛">
								<span id="treeDemo_2_ico" class="button ico_docu"></span>
								<span id="treeDemo_2_span" class="node_name">李小猛</span>
							</a>
						</li>
					</ul>
				</li>
				<li>
					<span title="ahahah" class="button switch bottom_close"></span>
					<span class="button chk checkbox_false_full" id="ydd"></span>
					<a target="_blank" title="移动端">
						<span class="button ico_close"></span>
						<span id="treeDemo_1_span" class="node_name">移动端</span>
					</a>
					<ul class="none">
						<li>
							<span class="button switch center_docu"></span>
							<span class="button chk checkbox_false_full" id="wz"></span>
							<a title="王朕">
								<span id="treeDemo_2_ico" class="button ico_docu"></span>
								<span id="treeDemo_2_span" class="node_name">王朕</span>
							</a>
						</li>
						<li>
							<span class="button switch center_docu"></span>
							<span class="button chk checkbox_false_full" id="jb"></span>
							<a title="贾斌">
								<span id="treeDemo_2_ico" class="button ico_docu"></span>
								<span id="treeDemo_2_span" class="node_name">贾斌</span>
							</a>
						</li>
						<li>
							<span class="button switch bottom_docu"></span>
							<span class="button chk checkbox_false_full" id="gxp"></span>
							<a title="高雪平">
								<span id="treeDemo_2_ico" class="button ico_docu"></span>
								<span id="treeDemo_2_span" class="node_name">高雪平</span>
							</a>
						</li>
					</ul>
				</li>
			</ul>-->
		</div>


		
		<!--文件树开始-->
		<div id="treeView">
			<ul>
				<li>
					<div class="treeNode" style="padding-left:0px" data-file-id="0">
						<i class="icon icon-control icon-minus"></i>
						<i class="icon icon-file"></i>
						<span class="title">全部文件</span>
					</div>
					<ul style="padding-left:20px">
						<li>
							<div class="treeNode treeNode-cur" data-file-id="0">
								<i class="icon icon-control icon-add"></i>
								<i class="icon icon-fileguan"></i>
								<span class="title">我的收藏</span>
							</div>
							<ul class="none" style="padding-left:40px">
								<li>
									<div class="treeNode treeNode-empty" data-file-id="0">
										<i class="icon icon-control icon-add"></i>
										<i class="icon icon-fileguan"></i>
										<span class="title">工具</span>
									</div>
								</li>
								<li>
									<div class="treeNode treeNode-cur" data-file-id="0">
										<i class="icon icon-control icon-add"></i>
										<i class="icon icon-fileguan"></i>
										<span class="title">画册</span>
									</div>
									<ul class="none" style="padding-left:40px">
										<li>
											<div class="treeNode treeNode-cur" data-file-id="0">
												<i class="icon icon-control icon-add"></i>
												<i class="icon icon-fileguan"></i>
												<span class="title">画册1</span>
											</div>
										</li>
									</ul>
								</li>
								<li>
									<div class="treeNode treeNode-empty" data-file-id="0">
										<i class="icon icon-control icon-add"></i>
										<i class="icon icon-fileguan"></i>
										<span class="title">班级图片</span>
									</div>
								</li>
							</ul>
						</li>
						<li>
							<div class="treeNode treeNode-empty" data-file-id="0">
								<i class="icon icon-control icon-add"></i>
								<i class="icon icon-fileguan"></i>
								<span class="title">我的音乐</span>
							</div>
						</li>
						<li>
							<div class="treeNode treeNode-empty" data-file-id="0">
								<i class="icon icon-control icon-add"></i>
								<i class="icon icon-fileguan"></i>
								<span class="title">我的电影</span>
							</div>
						</li>
						<li>
							<div class="treeNode" data-file-id="0">
								<i class="icon icon-control icon-add"></i>
								<i class="icon icon-fileguan"></i>
								<span class="title">我的书籍</span>
							</div>
							<ul class="none" style="padding-left:40px">
								<li>
									<div class="treeNode treeNode-empty" data-file-id="0">
										<i class="icon icon-control icon-add"></i>
										<i class="icon icon-fileguan"></i>
										<span class="title">javascript</span>
									</div>
								</li>
								<li>
									<div class="treeNode treeNode-empty" data-file-id="0">
										<i class="icon icon-control icon-add"></i>
										<i class="icon icon-fileguan"></i>
										<span class="title">JQuery</span>
									</div>
								<li>
								<li>
									<div class="treeNode treeNode-empty" data-file-id="0">
										<i class="icon icon-control icon-add"></i>
										<i class="icon icon-fileguan"></i>
										<span class="title">JAVA</span>
									</div>
								<li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<!--文件树结束-->
		
		
		<div class="buttom">
		<span style="color:red;">"checked":"checked" 默认选中 <br />  "readonly":"readonly" 只读 <br /> 默认展开一级菜单</span>
			<a href="javascript:;" onclick="alert(checkVal())">获取选中的值</a>
			<!--输入要展开的层数:<input type="text" id="num" style="width:15px;" /><a href="javascript:;" onclick="opens()">展开</a>-->
		</div>
		
		<script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
		<script type="text/javascript">
			$(parent.window.document.body).find(".mask").remove();//取消遮罩层
		
			//文件树js  S
			$(".treeNode").click(function (){
				//先看有没有ul 没有的话什么都不做
				var ulLen = $(this).nextAll("ul").length;
				//移出默认选中的背景颜色
				$("#treeView .treeNode").removeClass("treeNode-cur");
				$(this).addClass("treeNode-cur");
				if (ulLen != 0){
					/**隐藏显示*/
					$(this).nextAll("ul").toggleClass("none");
					/**加号减号切换*/
					$(this).find("i:first").toggleClass("icon-minus icon-add");
					/**图标展开关闭*/
					$(this).find("i:last").toggleClass("icon-file icon-fileguan");
				}				
			});
			//文件树js  E
	
	
			 //模拟数据 "checked":"checked" 默认选中  "readonly":"readonly" 只读
			 var jsonData = [
				 {"id":"1","name":"机动队","url":"www.baidu.com","pid":"0","checked":"checked"},
					 {"id":"4","name":"男人","url":"","pid":"1","checked":"checked"},
						 {"id":"13","name":"刘壮壮","url":"","pid":"4"},
						 {"id":"14","name":"徐石森","url":"","pid":"4","checked":"chekced"},
						 {"id":"15","name":"猴哥","url":"","pid":"4","checked":"chekced","readonly":"readonly"},
					 {"id":"5","name":"女人","url":"","pid":"1"},
						{"id":"6","name":"赵海瑞","url":"","pid":"5"},
						{"id":"20","name":"哈哈","url":"","pid":"5"},
				 {"id":"2","name":"云平台","url":"","pid":"0"},
					 {"id":"7","name":"杨渊","url":"","pid":"2","readonly":"readonly"},
					 {"id":"8","name":"李小猛","url":"","pid":"2"},
				 {"id":"3","name":"移动端","url":"","pid":"0"},
					 {"id":"10","name":"王朕","url":"","pid":"3"},
					 {"id":"11","name":"贾斌","url":"","pid":"3"},
					 {"id":"12","name":"高雪平","url":"","pid":"3"}
			 ];
			
	
	
			var menus = '';
	
		    //根据菜单主键id生成菜单列表html
		    //id：菜单主键id
		    //arry：菜单数组信息
			//cla class的名称 因为最大的ul的class和里面的不一样
		    function GetData(id, arry, cla) {
		        var childArry = GetParentArry(id, arry);
		        if (childArry.length > 0) {
		            menus += '<ul class="'+cla+'">';
		            for (var i in childArry) {
						//console.log(i+"======"+childArry[i].pid+"====="+childArry[i].name);
						var checked = "checkbox_false_full";  //复选框的选中  只读  等等
						if (typeof(childArry[i].checked) != "undefined"){  //选中
							checked = "checkbox_true_full";
						}
						if (typeof(childArry[i].readonly) != "undefined"){ // 只读
							checked = "checkbox_readonly_notcheck";
						}
						if (typeof(childArry[i].checked) != "undefined" && typeof(childArry[i].readonly) != "undefined"){ //只读选中
							checked = "checkbox_readonly_check";
						}
						menus += "<li>";
						menus += "	<span class=\"button switch roots_close\"></span>";
						menus += "	<span class=\"button chk "+checked+"\" id=\""+childArry[i].id+"\"></span>";  /**button chk 是否有复选框*/
						menus += "	<a title=\""+childArry[i].name+"\">";
						menus += "		<span class=\"button ico_close\"></span>";
						menus += "		<span id=\"treeDemo_1_span\" class=\"node_name\">"+ childArry[i].name+"</span>";
						menus += "	</a>";
		                GetData(childArry[i].id, arry, "line none");
		                menus += '</li>';
		            }
		            menus += '</ul>';
		        }
		    }
		
		    //根据菜单主键id获取下级菜单
		    //id：菜单主键id
		    //arry：菜单数组信息
		    function GetParentArry(id, arry) {
		        var newArry = new Array();
		        for (var i in arry) {
		            if (arry[i].pid == id)
		                newArry.push(arry[i]);
		        }
		        return newArry;
		    }
			
			/**重新组装树  主要是为了把最后一层的css改掉*/
			function reloadTree(){
				$(".treeView ul li").each(function (){
					var ulobj = $(this).find("ul");
					if(ulobj.length == 0){
						//前面的文件夹图标
						$(this).find("a span:first").removeClass("ico_open").addClass("ico_docu");
						//去掉加号减号
						$(this).find("span:eq(0)").removeClass("roots_open").addClass("center_docu");
						//最后一个css又是不一样  这句代码应该是只执行一次的  但是因为是在循环里面  所以执行多次  可以优化
						$(this).parent().find("li:last span:first").removeClass("center_docu").addClass("bottom_docu");
					}
				});
				//为每层的最后一个li做处理   比如每层的最后一个ul要去掉class 是line  还有就是最后一个的加号减号的图标和正常的也不一样
				$(".treeView ul").each(function (){
					if($(this).find("ul").length){  //只有下面有ul的情况才会进入  因为最后一层是没有ul的  查找也没意义
						$(this).find("li:last").parent().parent().find("ul").removeClass("line");  //每个最后一个li的ul
						$(this).find("li:last").parent().parent().find("span:first").removeClass("roots_close").addClass("bottom_close");  //每个最后一个li的ul
					}
				});
			}
		
			$(function(){
				 GetData(0, jsonData, "ztree");
				 $(".treeView").append(menus);
				 reloadTree();
				 opens(); //默认展开一级菜单
		
		
				 /**每个a绑定click事件*/
				$(".ztree a").each(function (i,obj){
					$(obj).click(function (){
						alert($(this).prev().attr("id"));
					});
				});
		
				/**加号减号*/
				$(".switch").click(function (){
					var cla = $(this).attr("class");
					if(cla.indexOf("roots") != -1){ //不是点击的最后一个的加号减号  //因为2个的样式不一样
						$(this).toggleClass("roots_open roots_close");
					} else {
						$(this).toggleClass("bottom_open bottom_close");
					}
					$(this).nextAll("ul").toggleClass("none");
					$(this).siblings("a").find("span:first").toggleClass("ico_open ico_close");
				});
				/**复选框*/
				$(".chk").click(function (){
					var chkCla = $(this).attr("class");
					if (chkCla.indexOf("readonly") != -1){  //点击只读的  不做任何操作
						return;
					}
					//自己切换
					$(this).toggleClass("checkbox_false_full checkbox_true_full");
		
					//给父元素选中
					$(this).parents().children(".chk").not(this).removeClass("checkbox_false_full").addClass("checkbox_true_full");
					var cla = $(this).attr("class");
		
					//给所有的子元素选中
					if (cla.indexOf("checkbox_true_full") != -1){  //选中
						$(this).nextAll("ul").find("li .chk").each(function (i,obj){
							var objCla = $(obj).attr("class");
							if(objCla.indexOf("readonly") == -1){  //只读的不参与选择操作
								$(obj).removeClass("checkbox_false_full").addClass("checkbox_true_full");
							}
						});
					} else {
						$(this).nextAll("ul").find("li .chk").each(function (i,obj){
							var objCla = $(obj).attr("class");
							if(objCla.indexOf("readonly") == -1){
								$(obj).removeClass("checkbox_true_full").addClass("checkbox_false_full");
							}
						});
					}
					
					//判断当前的取消是否是最后一个  如果是的话 父节点也要跟随取消 
					var ulall = $(this).parent().parent();
					var checkLen = true; //判断是否当前消除了就全部消除了 因为要同时去掉父节点的选中 false 不去 true 去掉
					ulall.children("li").each(function (){
						var checkCla = $(this).find("span:eq(1)").attr("class");
						if (checkCla.indexOf("checkbox_true_full") != -1){
							checkLen = false;
							return false;
						}
					});
					if (checkLen){  //去掉父节点的选中  这里存在如果第三级没了  第二级还有  这里直接就会把第一个也取消了
						$(this).parents().children(".chk").removeClass("checkbox_true_full").addClass("checkbox_false_full");
					}
				});
			}) ;
		
			/**获取选中的值*/
			function checkVal(){
				var ids = new Array();
				$(".chk").each(function (i,obj){
					var cla = $(obj).attr("class");
					if (cla.indexOf("checkbox_true_full") != -1 || cla.indexOf("checkbox_readonly_check") !=-1){  //默认不选中的和选择选中的
						ids.push($(obj).attr("id"));
					}
				});
				return ids.join();
			}
		
			/**打开第几层的树*/
			function opens(){
				var num = $("#num").val();
				if (num == ""){
					alert("请输入要展开的层数");
					return;
				}
				$(".treeView > ul > li > ul").each(function (){
					$(this).removeClass("none");
					$(this).prevAll("a").find("span:first").removeClass("ico_close").addClass("ico_open")  //图片变成展开
					$(this).prevAll(".roots_close").removeClass("roots_close").addClass("roots_open");  //加号 不是最后一个
					$(this).prevAll(".bottom_close").removeClass("bottom_close").addClass("bottom_open");  //加号 是最后一个
				});
			}




			/**
	 * 递归返回json树结构
	 * @param menuList
	 * @param parentId
	 * @return
	 
	public static JSONArray treeMenuList(JSONArray menuList, String parentId) {
        JSONArray childMenu = new JSONArray();
        for (Object object : menuList) {
            JSONObject jsonMenu = JSONObject.fromObject(object);
            String menuId = jsonMenu.getString("application_id");
            String pid = jsonMenu.getString("application_parent_id");
            if (parentId.equals(pid)) {
                JSONArray c_node = treeMenuList(menuList, menuId);
                jsonMenu.put("childNode", c_node);
                childMenu.add(jsonMenu);
            }
        }
        return childMenu;
    }*/

		</script>
  </body>
</html>
