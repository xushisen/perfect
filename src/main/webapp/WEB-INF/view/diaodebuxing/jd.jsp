<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<!--声明当前页面的编码集-->
		<meta http-equiv="Content-Type" content="text/html;">
		<!--声明当前页面的三要素-->
		<title>自己写的京东网站</title>
		<meta name="keywords" content="网上购物,网上商城,手机,笔记本,电脑,MP3,CD,VCD,DV,相机,数码,配件,手表,存储卡,京东"/>
		<meta name="description" content="京东JD.COM-专业的综合网上购物商城,销售家电、数码通讯、电脑、家居百货、服装服饰、母婴、图书、食品等数万个品牌优质商品.便捷、诚信的服务，为您提供愉悦的网上购物体验!"/>

		<link rel="icon" href="https://www.jd.com/favicon.ico" mce_href="https://www.jd.com/favicon.ico" type="image/x-icon">

		<style type="text/css">
			*{margin:0;padding:0}
			body{font:normal 14px "Microsoft Yahei","冬青黑体简体中文 w3","宋体";}
			/**公共样式开始*/
			/**login默认颜色*/
			.r{color:red;}
			.h{color:#999;}
			.shugang{width:1px;height:10px;background:#ccc;margin:11px 5px 0;}
			li{list-style:none;}
			a{text-decoration:none;color:#999;}
			a:hover{color:#c81623;}
			::-webkit-scrollbar{width:8px;height:6px;background:#eee}::-webkit-scrollbar-button{background-color:#eee}::-webkit-scrollbar-track{background:#eee}::-webkit-scrollbar-track-piece{background:#eee}::-webkit-scrollbar-thumb{background:#aaa;border-radius:4px}::-webkit-scrollbar-corner{background:#82afff}::-webkit-scrollbar-resizer{background:#ff0bee}
			/**公共样式结束*/
			/**头部 横条广告开始*/
			.head_banner{background:#0b2310;}
			.head_banner .head_img{width:1190px;margin:0 auto;position:relative;}
			.head_banner .head_img i{width:20px;height:20px;display:block;background:rgba(45,45,45,.3);color:#fff;position:absolute;right:5px;top:5px;text-align:center;line-height:20px;cursor: pointer;}
			/**头部 横条广告结束*/
			/**切换城市开始*/
			.city{height:30px;background:#e3e4e5;border-bottom:1px solid #ddd;}
			.city .c_con{width:1190px;height:100%;margin:0 auto;}
			.city .c_con .c_con_city{width:257.56px;height:100%;float:left;}
			.city .c_con .c_con_city .c_con_city_right{width:57.56px;height:30px;float:right;text-align:center;line-height:30px;font-size:12px;color:#999;}
			.city .c_con .c_con_login{width:715px;height:100%;float:right;}
			.city .c_con .c_con_login ul li{line-height:30px;font-size:12px;float:left;margin-right:15px;width:}
			
			/**我的京东鼠标样式*/
			.city .c_con .c_con_login .wdjd{width:280px;height:160px;background:#fff;border:1px solid #ccc;position:absolute;top:30px;left:-16px;z-index:10;display:none;}
			.city .c_con .c_con_login .wdjd ul{width:100%;height:90px;border-bottom:1px solid rgba(170,170,170,.2);}
			.city .c_con .c_con_login .wdjd ul li{width:100px;height:20px;margin:5px 0 0 15px;}
			
			/**客户服务鼠标样式*/
			.city .c_con .c_con_login .khfw{width:170px;height:200px;background:#fff;border:1px solid #ccc;position:absolute;top:30px;left:-16px;z-index:10;display:none;}
			.city .c_con .c_con_login .khfw ul{height:137px;border-bottom:1px solid rgba(170,170,170,.2)}
			.city .c_con .c_con_login .khfw ul li:first-child{width:100%;height:25px;font-size:14px;color:#555;margin:5px 0 0 15px;}
			.city .c_con .c_con_login .khfw ul li:not(:first-child){margin-left:15px;height:25px;}
			
			/**切换城市结束*/
			/**搜索行开始*/
			.search{height:140px;}
			.search .s_con{width:1190px;height:100%;margin:0 auto;position:relative;}
			.search .s_con .logon{position:absolute;top:-31px;left:0;box-shadow:0 -12px 10px rgba(0,0,0,.2);background:#fff;}
			.search .s_con .s_input{width:1020px;height:100%;float:left;position:absolute;left:200px;top:0;}
			.search .s_con .s_input .s_input_k{width:550px;height:35px;margin:25px 0 0 120px;position:relative;}
			.search .s_con .s_input .s_input_k input{width:500px;height:35px;border:1px solid red;outline:none;text-indent:10px;}
			.search .s_con .s_input .s_input_k .s_input_but{width:48px;height:37px;display:block;background:red;position:absolute;right:0;top:0;cursor:pointer;color:#fff;text-align:center;line-height:37px;font-size:14px;}
			.search .s_con .s_input .s_input_con{width:550px;height:20px;margin:10px 0 0 120px}
			.search .s_con .s_input .s_input_con a{margin-right:10px;display:block;float:left;font-size:12px;}
			.search .s_con .s_input .s_input_shop{width:190px;height:36px;border:1px solid #e3e4e5;margin:-65px 0 0 690px;color:red;text-align:center;line-height:36px;}
			.search .s_con .s_input .s_input_er{width:60px;height:60px;background:pink;margin:-60px 0 0 900px;}
			.search .s_con .s_input .s_input_dao{width:790px;height:40px;margin:50px 0 0 30px;}
			.search .s_con .s_input .s_input_dao ul li{font-size:16px;float:left;margin-right:30px;font-weight:bold;}
			.search .s_con .s_input .s_input_dao ul li a{color:#555;}
			.search .s_con .s_input .s_input_dao ul li a:hover{color:red;}
			/**搜索行结束*/
			/**左边导航开始*/
			.dao{height:480px;}
			.dao .d_con{width:1190px;height:100%;margin:0 auto;position:relative;}
			.dao .d_con .d_con_cai{width:190px;height:450px;background:#6e6568;padding:15px 0;float:left;}
			.dao .d_con .d_con_cai ul li{font-size:14px;line-height:30px;padding-left:12px;}
			.dao .d_con .d_con_cai ul li:hover{background:#999395;}
			.dao .d_con .d_con_cai ul li a{color:#fff;}
			.dao .d_con .d_con_cai ul li a:hover{color:#c81623;}
			.dao .d_con .d_con_cai ul li span{color:#fff;margin-left:5px;}
			/**左边导航结束*/
			/**中加滚动图片开始*/
			.dao .d_con .d_con_banner{width:790px;height:100%;float:left;margin-left:10px;}
			.dao .d_con .d_con_banner .d_con_zdbanner{height:340px;position:relative;}
			.dao .d_con .d_con_banner .d_con_buzdbanner{height:130px;margin-top:10px;}
			.dao .d_con .d_con_banner .d_con_buzdbanner a{float:left;}
			.dao .d_con .d_con_banner .d_con_buzdbanner a:last-child{float:right;}
			/**中加滚动图片结束*/
			/**banner 滚动图片buttom开始*/
			.dao .d_con .d_con_banner .d_con_zdbanner .d_con_jujiao{position:absolute;left:50%;bottom:20px;display:inline-block;background-color:hsla(0,0%,100%,.3);padding:4px 10px 4px 0;border-radius:10px;margin-left:-90px;}
			.dao .d_con .d_con_banner .d_con_zdbanner .d_con_jujiao i{width:12px;height:12px;display:block;border-radius:6px;background:#fff;float:left;margin-left:10px;}
			.dao .d_con .d_con_banner .d_con_zdbanner .d_con_jujiao .focu{background:red;}
			/**banner 滚动图片buttom结束*/			
			/**左边鼠标悬浮  开始*/
			.dao .d_con .leftMouse{width:1015px;height:480px;background:#fff;position:absolute;left:190px;box-shadow:-2px 2px 10px #555;display:none;z-index:2;}
			.dao .d_con .leftMouse .mouseTitle{width:100%;height:20px;padding:20px;}
			.dao .d_con .leftMouse .mouseTitle a{display:inline-block;height:25px;line-height:25px;background:#6e6568;color:#fff;font-size:12px;padding:0 10px;margin-left:10px;}
			.dao .d_con .leftMouse .mouseTitle a:hover{background:#666;}
			.dao .d_con .leftMouse .mouseCon{width:100%;height:100px;padding:0 20px;}
			.dao .d_con .leftMouse .mouseCon .clear{clear:both;}
			.dao .d_con .leftMouse .mouseCon ul li a{color:#666;}
			.dao .d_con .leftMouse .mouseCon ul li a:hover{color:red;}
			.dao .d_con .leftMouse .mouseCon ul:not(:first-child){margin-top:20px;}
			.dao .d_con .leftMouse .mouseCon ul li:first-child{width:70px;text-align:right;font-weight:bold;font-size:12px;color:#666;float:left;margin-right:10px;}
			.dao .d_con .leftMouse .mouseCon ul li:not(:first-child){padding:0 12px;text-align:left;font-size:12px;float:left;border-left:1px solid #e0e0e0;}
			/**左边鼠标悬浮  结束*/
			/**右边登录以及各种话费开始*/
			.dao .d_con .d_con_gg{width:190px;height:100%;float:right;}
			.dao .d_con .d_con_gg .d_con_gg_login{height:45px;padding: 15px 0 15px 15px;}
			.dao .d_con .d_con_gg .d_con_gg_login .d_con_gg_loginImg{width:45px;height:45px;border-radius:22px;overflow:hidden;float:left;}
			.dao .d_con .d_con_gg .d_con_gg_login .c_con_gg_hi{width:110px;float:right;margin-right:10px;}
			.dao .d_con .d_con_gg .d_con_gg_login .c_con_gg_hi p{font-size:12px;line-height:20px;}
			
			.dao .d_con .d_con_gg .d_con_gg_xinren{margin:0 10px 15px 15px;height:24px;}
			.dao .d_con .d_con_gg .d_con_gg_xinren a{width:74px;height:20px;display:block;border:2px solid red;color:red;text-align:center;float:left;}
			.dao .d_con .d_con_gg .d_con_gg_xinren a:last-child{float:right;}
			
			.dao .d_con .d_con_gg .d_con_gg_cuxiao{height:154px;margin:0 10px 0 15px;}
			.dao .d_con .d_con_gg .d_con_gg_cuxiao .d_con_gg_cuxiao_shou{height:27px;border-top:1px solid #eee;border-bottom:1px solid #eee;}
			.dao .d_con .d_con_gg .d_con_gg_cuxiao .d_con_gg_cuxiao_shou a{cursor:pointer;font-size:12px;}
			.dao .d_con .d_con_gg .d_con_gg_cuxiao .gg{margin:0 60px 0 20px;}
			.dao .d_con .d_con_gg .d_con_gg_cuxiao a{color:#555;}
			.dao .d_con .d_con_gg .d_con_gg_cuxiao a:hover{color:red;}
			.dao .d_con .d_con_gg .d_con_gg_cuxiao .d_con_gg_cuxiao_yd{width:160px;height:96px;margin-top:20px;}
			.dao .d_con .d_con_gg .d_con_gg_cuxiao .d_con_gg_cuxiao_yd ul li{line-height:23px;text-overflow:ellipsis;white-space:nowrap;font-size:12px;}
			
			.dao .d_con .d_con_gg .d_con_gg_hf{margin:0 10px 0 15px;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou{width:192px;height:210px;padding:2px;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li{width:47px;height:69px;padding:font-size:12px;float:left;border-top:1px solid #eee;border-left:1px solid #eee;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li i{width:24px;height:24px;display:block;margin:10px auto;background:url("https://misc.360buyimg.com/mtd/pc/index/home/images/sprite_fs@1x.png");}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li .hf{background-position:0 -88px;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li .jp{background-position:0 -44px;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li .jd{background-position:-44px -88px;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li .yx{background-position:-88px 0;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li .qyg{background-position:-88px -44px;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li .jyk{background-position:0 0;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li .dyp{background-position:-44px -44px;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li .hcp{background-position:-88px -88px;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li .zc{background-position:-132px 0;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li .lc{background-position:-132px -44px;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li .lpk{background-position:-132px -88px;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li .bt{background-position:-44px 0;}
			.dao .d_con .d_con_gg .d_con_gg_hf .d_con_gg_hf_shou ul li span{width:100%;height:22px;display:block;text-align:center;margin-top:-2px;font-size:12px;}
			/**右边登录以及各种话费结束*/
		</style>
	</head>
		
	<body>
		<!--头部 横条广告开始-->
		<div class="head_banner">
			<div class="head_img">
				<a id="J_event_lk" href="https://sale.jd.com/act/QoJFcO6vHi.html" target="_blank" style="display:block;width:100%;height:80px;background:url(https://img10.360buyimg.com/da/jfs/t3823/340/3849388865/85613/98a0c248/58a3b25eN831ecc9d.jpg) no-repeat 50% 0;"></a>
				<i>&times;</i>
			</div>
		</div>
		<!--头部 横条广告结束-->
		<!--切换城市开始-->
		<div class="city">
			<div class="c_con">
				<div class="c_con_city">
					<div class="c_con_city_right">北京</div>
				</div>
				<div class="c_con_login">
					<ul>
						<li class="r"><a href="javascript:;" style="color:red;">徐石森</a>,<a href="javascript:;" style="color:red;">请登录</a></li>
						<li class="h"><a href="javascript:;">免费注册</a></li>
						<li class="shugang"></li>
						<li class="h" style="position:relative;">
							<a href="javascript:;">我的京东</a>&nbsp;∨
							<div class="wdjd">
								<ul>
									<li><a href="javascript:;">待处理订单</a></li>
									<li><a href="javascript:;">消息</a></li>
									<li><a href="javascript:;">返修退换货</a></li>
									<li><a href="javascript:;">我的问答</a></li>
									<li><a href="javascript:;">降价商品</a></li>
									<li><a href="javascript:;">我的关注</a></li>
								</ul>
								<ul>
									<li><a href="javascript:;">我的京豆</a></li>
									<li><a href="javascript:;">我的优惠券</a></li>
									<li><a href="javascript:;">我的白条</a></li>
									<li><a href="javascript:;">我的理财</a></li>
								</ul>
							</div>
						</li>
						<li class="shugang"></li>
						<li class="h"><a href="javascript:;">京东会员</a></li>
						<li class="shugang"></li>
						<li class="h"><a href="javascript:;">企业采购</a></li>
						<li class="shugang"></li>
						<li class="h" style="position:relative;">
							<a href="javascript:;">客户服务</a>&nbsp;∨
							<div class="khfw">
								<ul>
									<li>客户</li>
									<li><a href="javascript:;">帮助中心</a></li>
									<li><a href="javascript:;">售后服务</a></li>
									<li><a href="javascript:;">在线客服</a></li>
									<li><a href="javascript:;">意见建议</a></li>
									<li><a href="javascript:;">电话客服</a></li>
									<li><a href="javascript:;">客服邮箱</a></li>
									<li><a href="javascript:;">进入咨询</a></li>
								</ul>
								<ul>
									<li>商户</li>
									<li><a href="javascript:;">京东商学院</a></li>
									<li><a href="javascript:;">商家入驻</a></li>
								</ul>
							</div>
						</li>
						<li class="shugang"></li>
						<li class="h"><a href="javascript:;">网站导航</a>&nbsp;∨</li>
						<li class="shugang"></li>
						<li class="h"><a href="javascript:;">手机京东</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!--切换城市结束-->
		<!-- 搜索行开始 -->
		<div class="search">
			<div class="s_con">
				<div class="logon">
					<a href="http://18092514886.imwork.net:15819/perfect/diaodebuxing/jd.jsp"><img src="https://misc.360buyimg.com/mtd/pc/index/home/images/logo.v2.png" width="190" height="168" alt="logo" /></a>
				</div>
				<div class="s_input">
					<div class="s_input_k">
						<input type="text" placeholder="单反相机" /><a class="s_input_but">搜索</a>
					</div>
					<div class="s_input_con">
						<a target="_blank" href="https://sale.jd.com/act/fCpjlzMUSDrxgqP.html?spm=1.1.0" class="r">5件5折</a>
						<a target="_blank" href="https://sale.jd.com/act/Osx2K8DtzBXnoT.html?spm=1.1.1" class="h">爆款5折抢</a>
						<a target="_blank" href="https://sale.jd.com/act/wBdQi25NJSVb.html?spm=1.1.2" class="h">立减120元</a>
						<a target="_blank" href="https://sale.jd.com/act/nljyoXLKts.html?spm=1.1.3" class="h">每200减40</a>
						<a target="_blank" href="https://sale.jd.com/act/sxY35ojWkC.html?spm=1.1.4" class="h">格力大促</a>
						<a target="_blank" href="https://search.jd.com/Search?keyword=%E7%94%B5%E6%9A%96%E5%99%A8&enc=utf-8&spm=1.1.5" class="h">电暖器</a>
						<a target="_blank" href="https://search.jd.com/Search?keyword=%E6%A3%89%E9%9E%8B%E7%94%B7&enc=utf-8&spm=1.1.6" class="h">棉鞋男</a>
						<a target="_blank" href="https://sale.jd.com/act/ZnDo10XW3q.html?spm=1.1.7" class="h">零食专场</a>
						<a target="_blank" href="https://search.jd.com/Search?keyword=%E7%9A%AE%E8%A3%A4%E5%A5%B3&enc=utf-8&spm=1.1.8" class="h">皮裤女</a>
					</div>
					<div class="s_input_shop">
						我的购物车
					</div>
					<div class="s_input_er">
						<img src="https://misc.360buyimg.com/mtd/pc/index/home/images/mobile_qrcode.jpg" widht="60px" height="60px" alt="二维码">
					</div>
					<div class="s_input_dao">
						<ul>
							<li><a href="https://miaosha.jd.com/" target="_blank">秒杀</a></li>
							<li><a href="https://a.jd.com/" target="_blank">优惠购</a></li>
							<li><a href="https://red.jd.com/" target="_blank">闪购</a></li>
							<li><a href="https://auction.jd.com/home.html" target="_blank">拍卖</a></li>
							<li><a href="https://channel.jd.com/fashion.html" target="_blank">服装城</a></li>
							<li><a href="https://chaoshi.jd.com/" target="_blank">京东超市</a></li>
							<li><a href="https://fresh.jd.com/" target="_blank">生鲜</a></li>
							<li><a href="https://www.jd.hk/" target="_blank">全球购</a></li>
							<li><a href="https://jr.jd.com/" target="_blank">京东金融</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 搜索行结束 -->
		<!-- 左边导航开始 -->
		<div class="dao">
			<div class="d_con">
				<div class="d_con_cai">
					<ul>
						<li><a target="_blank" href="https://jiadian.jd.com/">家用电器</a></li>
						<li>
							<a target="_blank" href="https://shouji.jd.com/">手机</a><span>/</span>
							<a target="_blank" href="https://wt.jd.com/">运营商</a><span>/</span>
							<a target="_blank" href="https://shuma.jd.com/">数码</a>
						</li>
						<li><a target="_blank" href="https://diannao.jd.com/">电脑办公</a></li>
						<li>
							<a target="_blank" href="https://channel.jd.com/home.html">家居</a><span>/</span>
							<a target="_blank" href="https://channel.jd.com/furniture.html">家具</a><span>/</span>
							<a target="_blank" href="https://channel.jd.com/decoration.html">家装</a><span>/</span>
							<a target="_blank" href="https://channel.jd.com/kitchenware.html">厨具</a>
						</li>
						<li>
							<a target="_blank" href="http://channel.jd.com/men.html">男装</a><span>/</span>
							<a target="_blank" href="http://channel.jd.com/women.html">女装</a><span>/</span>
							<a target="_blank" href="https://channel.jd.com/children.html">童装</a><span>/</span>
							<a target="_blank" href="http://channel.jd.com/underwear.html">内衣</a>
						</li>
						<li>
							<a target="_blank" href="https://channel.jd.com/beauty.html">个护化妆</a><span>/</span>
							<a target="_blank" href="https://channel.jd.com/1620-1625.html">清洁用品</a><span>/</span>
							<a target="_blank" href="https://channel.jd.com/pet.html">宠物</a>
						</li>
						<li>
							<a target="_blank" href="https://channel.jd.com/shoes.html">鞋靴</a><span>/</span>
							<a target="_blank" href="https://channel.jd.com/bag.html">箱包</a><span>/</span>
							<a target="_blank" href="https://channel.jd.com/jewellery.html">珠宝</a><span>/</span>
							<a target="_blank" href="http://channel.jd.com/luxury.html">奢侈品</a>
						</li>
						<li>
							<a target="_blank" href="https://channel.jd.com/yundongcheng.html">运动</a><span>/</span>
							<a target="_blank" href="https://channel.jd.com/outdoor.html">户外</a><span>/</span>
							<a target="_blank" href="https://channel.jd.com/watch.html">钟表</a>
						</li>
						<li>
							<a target="_blank" href="http://car.jd.com/">汽车</a><span>/</span>
							<a target="_blank" href="https://che.jd.com/">汽车用品</a>
						</li>
						<li>
							<a target="_blank" href="https://baby.jd.com/">母婴</a><span>/</span>
							<a target="_blank" href="https://toy.jd.com/">玩具乐器</a>
						</li>
						<li>
							<a target="_blank" href="https://channel.jd.com/food.html">食品</a><span>/</span>
							<a target="_blank" href="https://channel.jd.com/wine.html">酒类</a><span>/</span>
							<a target="_blank" href="https://fresh.jd.com/">生鲜</a><span>/</span>
							<a target="_blank" href="https://china.jd.com/">特产</a>
						</li>
						<li>
							<a target="_blank" href="https://health.jd.com/">医药保健</a>
						</li>
						<li>
							<a target="_blank" href="https://book.jd.com/">图书</a><span>/</span>
							<a target="_blank" href="https://mvd.jd.com/">音像</a><span>/</span>
							<a target="_blank" href="https://e.jd.com/ebook.html">电子书</a>
						</li>
						<li>
							<a target="_blank" href="https://jipiao.jd.com/">机票</a><span>/</span>
							<a target="_blank" href="https://hotel.jd.com/">酒店</a><span>/</span>
							<a target="_blank" href="https://trip.jd.com/">旅游</a><span>/</span>
							<a target="_blank" href="https://ish.jd.com/">生活</a>
						</li>
						<li>
							<a target="_blank" href="https://licai.jd.com/">理财</a><span>/</span>
							<a target="_blank" href="https://z.jd.com/sceneIndex.html">众筹</a><span>/</span>
							<a target="_blank" href="https://baitiao.jd.com/">白条</a><span>/</span>
							<a target="_blank" href="https://bao.jd.com/">保险</a>
						</li>
					</ul>
				</div>
				<!-- 鼠标移动到左边菜单需要出现的div 开始 -->
				<div class="leftMouse">
					<div class="mouseTitle">
						<a target="_blank" href="https://jiadian.jd.com/">家具城&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://sale.jd.com/act/QGKqdHvopWietx.html">品牌日&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://smarthome.jd.com/">智能生活馆&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://sale.jd.com/act/rSRFscLklGhxXW2H.html">京东净化馆&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://sale.jd.com/act/eRszkp8fyiS3Yt.html">京东帮服务站&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://sale.jd.com/act/nRIkpl3KqwDU.html#?from=zctgw00050">家电众筹管&nbsp;&nbsp;&gt;</a>
					</div>
					<div class="mouseCon">
						<ul>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,798">电视</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,798&ev=5305_7189&sort=sort_totalsales15_desc&trans=1&JL=3_%E5%93%81%E7%89%8C%E7%B1%BB%E5%9E%8B_%E5%90%88%E8%B5%84%E5%93%81%E7%89%8C#J_crumbsBar">合资品牌</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,798&ev=5305_7188&sort=sort_totalsales15_desc&trans=1&JL=2_1_0#J_crumbsBar">国产品牌</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,798&ev=5305_89541&sort=sort_totalsales15_desc&trans=1&JL=2_1_0#J_crumbsBar">互联网品牌</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,870">空调</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,870&ev=1554_584893&JL=3_%E7%A9%BA%E8%B0%83%E7%B1%BB%E5%88%AB_%E5%A3%81%E6%8C%82%E5%BC%8F%E7%A9%BA%E8%B0%83#J_crumbsBar">壁挂式空调</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,870&ev=1554_584894&JL=3_%E7%A9%BA%E8%B0%83%E7%B1%BB%E5%88%AB_%E7%AB%8B%E6%9F%9C%E5%BC%8F%E7%A9%BA%E8%B0%83#J_crumbsBar">柜式空调</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,13701">中央空调</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,877&ev=2664_88741&trans=1&JL=3_%E9%85%8D%E4%BB%B6%E7%B1%BB%E5%9E%8B_%E7%A9%BA%E8%B0%83%E9%85%8D%E4%BB%B6#J_crumbsBar">空调配件</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,880">洗衣机</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,880&ev=998_605429&JL=3_%E4%BA%A7%E5%93%81%E7%B1%BB%E5%9E%8B_%E6%BB%9A%E7%AD%92#J_crumbsBar">滚筒洗衣机</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,880&ev=998_5006&JL=3_%E4%BA%A7%E5%93%81%E7%B1%BB%E5%9E%8B_%E6%B4%97%E7%83%98%E4%B8%80%E4%BD%93#J_crumbsBar">洗烘一体机</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,880&ev=998_5005&JL=3_%E4%BA%A7%E5%93%81%E7%B1%BB%E5%9E%8B_%E6%B3%A2%E8%BD%AE#J_crumbsBar">波轮洗衣机</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,880&ev=998_77402&JL=3_%E4%BA%A7%E5%93%81%E7%B1%BB%E5%9E%8B_%E8%BF%B7%E4%BD%A0%E6%B4%97%E8%A1%A3%E6%9C%BA#J_crumbsBar">迷你洗衣机</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,877&ev=2664_88742&trans=1&JL=2_1_0#J_crumbsBar">洗衣机配件</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,878">冰箱</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,878&ev=1015_5131&sort=sort_totalsales15_desc&JL=3_%E9%97%A8%E6%AC%BE%E5%BC%8F_%E5%A4%9A%E9%97%A8#J_crumbsBar">多门</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,878&ev=1015_5130&sort=sort_totalsales15_desc&JL=3_%E9%97%A8%E6%AC%BE%E5%BC%8F_%E5%AF%B9%E5%BC%80%E9%97%A8#J_crumbsBar">对开门</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,878&ev=1015_5128&sort=sort_totalsales15_desc&JL=2_1_0#J_crumbsBar">三门</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,878&ev=1015_5129&sort=sort_totalsales15_desc&JL=2_1_0#J_crumbsBar">双门</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,12392">冷柜/冰吧</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,12401">酒柜</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,877&ev=2664_88743&trans=1&JL=2_1_0#J_crumbsBar">冰箱配件</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a target="_blank" href="https://chuwei.jd.com/">厨卫大电</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,13297,1300&ev=%402047_584926&go=0&JL=3_%E4%BA%A7%E5%93%81%E7%B1%BB%E5%9E%8B_%E6%B2%B9%E7%83%9F%E6%9C%BA">油烟机</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,13297,13298">燃气灶</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,13297,1300&ev=%402047_15280&go=0&JL=3_%E4%BA%A7%E5%93%81%E7%B1%BB%E5%9E%8B_%E7%83%9F%E7%81%B6%E5%A5%97%E8%A3%85">烟灶套装</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,13297,1301">消毒柜</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,13297,13117">洗碗机</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,13297,13690">电热水器</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,13297,13691">燃气热水器</a></li>
							<li><a target="_blank" href="https://coll.jd.com/list.html?sub=1661">嵌入式厨电</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a target="_blank" href="https://channel.jd.com/737-752.html">厨房小电</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,752,753">电饭煲</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,752,758">微波炉</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,752,759">电烤箱</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,752,757">电磁炉</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,752,881">电压力锅</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,752,756">豆浆机</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,752,761">咖啡机</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,752,899">面包机</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,752,13116">榨汁机</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a target="_blank" href="https://channel.jd.com/737-738.html">生活电器</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,738,747">取暖电器</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,738,745">吸尘器</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,738,749">净化器</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,738,12394">扫地机器人</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,738,748">加湿器</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,738,1279">挂烫机/熨斗</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,738,751">电风扇</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,738,1278">冷风扇</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,738,1052">插座</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a target="_blank" href="https://channel.jd.com/737-1276.html">个护健康</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,1276,739">剃须刀</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,1276,741">口腔护理</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,1276,740">电吹风</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,1276,795">美容器</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,1276,12400">卷/直发器</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,1276,1287">理发器</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,1276,742">剃/脱毛器</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,1276,963">足浴盆</a></li>
							<li><a href="https://list.jd.com/list.html?cat=737,1276,1289" target="_blank">健康秤/厨房秤</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a href="http://coll.jd.com/list.html?sub=4932" target="_blank">家庭影音</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,823">家庭影院</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,1199">迷你音响</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,965">DVD</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=737,794,877&ev=2664_88744&trans=1&JL=3_%E9%85%8D%E4%BB%B6%E7%B1%BB%E5%9E%8B_%E7%94%B5%E8%A7%86%E5%BD%B1%E9%9F%B3%E9%85%8D%E4%BB%B6#J_crumbsBar">电视影音配件</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a href="https://jiadian.jd.com/" target="_blank">进口电器</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://coll.jd.com/list.html?sub=5061">进口电器</a></li>
						</ul>
					</div>
				</div>
				<div class="leftMouse">
					<div class="mouseTitle">
						<a target="_blank" href="https://3c.jd.com/">玩3C&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://shouji.jd.com/">手机频道&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://wt.jd.com/">网上营业厅&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://kong.jd.com/mobile/accyCenter">配件选购中心&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://yingxiang.jd.com/">影像Club&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://sale.jd.com/act/02ZCO1Nqk7eALJw.html">以旧换新&nbsp;&nbsp;&gt;</a>
					</div>
					<div class="mouseCon">
						<ul>
							<li><a target="_blank" href="https://shouji.jd.com/">手机通讯</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,653,655">手机</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,653,659">对讲机</a></li>
							<li><a target="_blank" href="http://sale.jd.com/act/02ZCO1Nqk7eALJw.html">以旧换新</a></li>
							<li><a target="_blank" href="https://weixiu.jd.com/">手机维修</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a target="_blank" href="https://wt.jd.com/">运营商</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://chongzhi.jd.com/">充话费/流量</a></li>
							<li><a target="_blank" href="https://sale.jd.com/act/BLFcWDiTOrXYdP.html">170选号</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,6880,6881">合约机</a></li>
							<li><a target="_blank" href="https://sale.jd.com/act/mRZ4HLxoOews3.html">办套餐</a></li>
							<li><a target="_blank" href="https://number-eve.jd.com/npc/initPage">选号码</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,6880,12428">固话宽带</a></li>
							<li><a target="_blank" href="https://mobile.jd.com/">京东通信</a></li>
							<li><a target="_blank" href="https://10086.jd.com/">中国移动</a></li>
							<li><a target="_blank" href="https://mall.jd.com/index-1000073123.html">中国联通</a></li>
							<li><a target="_blank" href="https://channel.jd.com/telecom.html">中国电信</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a target="_blank" href="https://channel.jd.com/peijian.html">手机配件</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,830,866">手机壳</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,830,867">贴膜</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,830,1099">手机存储卡</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,830,13661">数据线</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,830,13660">充电器</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,830,862">手机耳机</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,830,868">创意配件</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,830,11302">手机饰品</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,830,13657">手机电池</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=9987,830,13659">苹果周边</a></li>
						</ul>
					</div>
				</div>
				<div class="leftMouse">
					<div class="mouseTitle">
						<a target="_blank" href="https://3c.jd.com/">玩3C&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://sale.jd.com/act/6hd0T3HtkcEmqjpM.html">本周热卖&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="http://group.jd.com/index/20000001.htm">游戏部落&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://gaming.jd.com/">GAME+&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://diy.jd.com/?cpdad=1DLSUE">装机大师&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://bangong.jd.com/">办公生活馆&nbsp;&nbsp;&gt;</a>
					</div>
					<div class="mouseCon">
						<ul>
							<li><a target="_blank" href="https://channel.jd.com/670-671.html">电脑整机</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,671,672">笔记本</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,671,1105">游戏本</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,671,2694">平板电脑</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,671,5146">平板电脑配件</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,671,673">台式机</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,671,12798">一体机</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,671,674">服务器/工作站</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,671,675">笔记本配件</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a target="_blank" href="https://channel.jd.com/670-677.html">电脑配件</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,677,688">显示器</a></li>
							<li><a href="https://list.jd.com/list.html?cat=670,677,678" target="_blank">CPU</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,677,681">主板</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,677,679">显卡</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,677,683">硬盘</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,677,680">内存</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,677,687">机箱</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,677,691">电源</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,677,682">散热器</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=670,677,11762">组装电脑</a></li>
						</ul>
					</div>
				</div>
				<div class="leftMouse">
					<div class="mouseTitle">
						<a target="_blank" href="https://channel.jd.com/jiazhuang.html">家装城&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://channel.jd.com/home.html">居家日用&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://channel.jd.com/furniture.html">精品家具&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://channel.jd.com/decoration.html">家装建材&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://channel.jd.com/kitchenware.html">厨房达人&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://channel.jd.com/9855-9862.html">装修服务&nbsp;&nbsp;&gt;</a>
					</div>
					<div class="mouseCon">
						<ul>
							<li><a target="_blank" href="https://channel.jd.com/kitchenware.html">厨具</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://channel.jd.com/6196-6197.html">烹饪锅具</a></li>
							<li><a target="_blank" href="https://channel.jd.com/6196-6198.html">刀剪菜板</a></li>
							<li><a target="_blank" href="https://channel.jd.com/6196-6214.html">厨房配件</a></li>
							<li><a target="_blank" href="https://channel.jd.com/6196-6219.html">水具酒具</a></li>
							<li><a target="_blank" href="https://channel.jd.com/6196-6227.html">餐具</a></li>
							<li><a target="_blank" href="https://channel.jd.com/6196-11143.html">茶具/咖啡具</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=6196,6219,6223">保温杯</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a target="_blank" href="https://channel.jd.com/1620-1621.html">家纺</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1620,1621,1626">床品套件</a></li>
							<li><a href="https://list.jd.com/list.html?cat=1620,1621,1627" target="_blank">被子</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1620,1621,1628">枕芯</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1620,1621,1632">蚊帐</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1620,1621,11963">凉席</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1620,1621,1634">毛巾浴巾</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1620,11158,11160">地毯地垫</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1620,1621,1631">床垫/床褥</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1620,1621,1630">毯子</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1620,1621,1633">抱枕靠垫</a></li>
						</ul>
					</div>
				</div>
				
				<div class="leftMouse">
					<div class="mouseTitle">
						<a target="_blank" href="http://channel.jd.com/men.html">男装&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="http://channel.jd.com/women.html">女装&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://channel.jd.com/underwear.html">内衣&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://channel.jd.com/children.html">童装童鞋&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://sale.jd.com/act/lgVrqKBf5sON2.html">国际品牌&nbsp;&nbsp;&gt;</a>
						<a target="_blank" href="https://sale.jd.com/act/RmG6HOIc8nUi3E.html">自营服装&nbsp;&nbsp;&gt;</a>
					</div>
					<div class="mouseCon">
						<ul>
							<li><a target="_blank" href="http://channel.jd.com/women.html">女装</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://coll.jd.com/list.html?sub=11852">商场同款</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?tid=1001053">当季热卖</a></li>
							<li><a target="_blank" hdref="https://list.jd.com/list.html?tid=1000145">2017新品</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1315,1343,9719">连衣裙</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1315,1343,1355">T恤</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1315,1343,9713">雪纺衫</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1315,1343,9717">休闲裤</a></li>
						</ul>
						<div class="clear"></div>
						<ul>
							<li><a target="_blank" href="http://channel.jd.com/men.html">男装</a>&nbsp;&nbsp;></li>
							<li><a target="_blank" href="https://coll.jd.com/list.html?sub=11850">商场同款</a></li>
							<li><a href="https://list.jd.com/list.html?tid=1000157" target="_blank">当季热卖</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?tid=1000147">2017新品</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1315,1342,1349">T恤</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1315,1342,9735">牛仔裤</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1315,1342,9736">休闲裤</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1315,1342,1348">衬衫</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1315,1342,12004">短裤</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1315,1342,9733">POLO衫</a></li>
							<li><a target="_blank" href="https://list.jd.com/list.html?cat=1315,1342,3982">羽绒服</a></li>
						</ul>
					</div>
				</div>
				<!-- 鼠标移动到左边菜单需要出现的div 结束 -->
				<!-- 中间滚动图片开始 -->
				<div class="d_con_banner">
					<div class="d_con_zdbanner">
						<ul>
							<li style="display:block;">
								<a href="https://c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm7ANcd8TaakkD/zIYWRZc7VvtfY423rJcb/SOFjh+Yelmgxu90osd/emUdUnbH16485B0cUZkthW1SRehaFEm7B4fLWlvRBkxoM4QrINBB7LUvmQ362FzrmWC7uAkZeh6EpszFYOGmdwrFootvegqsmv/7SSe9q7ZBCXWwxjFHP/r6uO37CY0Gpq2F6VJodSxa+LcM/29HoFWRR+IS3JwzGX9Bp73GHZ79P1hYK54ixq3JUyYon4u6OguV+SYB+YpNilRuhHxyLJHkfid7fVu5mhiN6+Mc28apMMzd+icNrBA==&cv=2.0&url=https://sale.jd.com/act/8aUplu2Q7IcfJog.html" target="_blank">
									<img src="https://img20.360buyimg.com/da/jfs/t3292/4/6805162882/101847/f42c8af/58ad3a2eNac9331eb.jpg" width="790" height="340" alt="banner" />
								</a>
							</li>
							<li style="display:none;">
								<a href="https://sale.jd.com/act/JQgmfkNUStW50OL.html?cpdad=1DLSUE" target="_blank">
									<img src="https://img1.360buyimg.com/da/jfs/t3895/233/2677230559/82405/516238f6/58ad382fN3a16e3d0.jpg" width="790" height="340" alt="banner" />
								</a>
							</li>
							<li style="display:none;">
								<a href="https://c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm55k+xzSmdsZK1bWF8JfLYa65yYquVkfMfh7aGq8C0CoEwGuMcc4GYKBqyk0yw0rcVHWmoByPeXmwN+vPPmAue88vbCjJwzgisfHGxcwS/sj88JTug+Vld+x5PMMQHlg7Cu3obq7TnO4Lf+vJQ9t+LZZzMI/FNcIyqPvs7l7kzfgqwuiHO85wBSyA1FPeT/jgXBkyxapGKK0bayuRsyF1CjSHY0JSwCJdCXubq2wQCesktkSSOFA1pdGE/Iy7jQSEYQlCt5qtzWUNQR7nMClgnfA8pekfb4uNQnqgcfk9CP5w==&cv=2.0&url=//sale.jd.com/act/5E37HDOga1npl.html" target="_blank">
									<img src="https://img20.360buyimg.com/da/jfs/t3892/217/1909152339/229904/d0cff380/589c3727N2ad13337.jpg" width="790" height="340" alt="banner" />
								</a>
							</li>
							<li style="display:none;">
								<a href="https://c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm4ZWC0NjoFIWiTH/zN3o+/WiJrHxZmm04qPvYVovttjJ265Imfzetwzb4vjdNiZuHOfP7iWHuWOAGk+QlT0SmwX4fLWlvRBkxoM4QrINBB7LQ8fG1on47aNJGgDqTX9ucvSlMbGCN9NX7pcatm7vfIbjnSIFtrxkX4xkYbQvHViCGKnFtB6rhrxWO1MpkcMG5SoRUSOdb56zrttLfl8vNBFcptr0poJNKZrfeMvuWRplv4bRbtDQshzWfMXyqdyQxyNrmP1wRDLNloYOL46zk6YpGgD9f7DD80JI2OBqrgiZA==&cv=2.0&url=//sale.jd.com/act/Osx2K8DtzBXnoT.html" target="_blank">
									<img src="https://img14.360buyimg.com/da/jfs/t4048/143/2661854708/299954/ca635a93/58ad47d5Nc95666f3.jpg" width="790" height="340" alt="banner" />
								</a>
							</li>
							<li style="display:none;">
								<a href="https://c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm4qd+W12IX13fCjb0ab6SexbTk4VOSL3II11lyBNuno6FowMxxjSsklF+FX/h3roDZHWmoByPeXmwN+vPPmAue8nPRVaxDTMvb4FGTgPthaktn8gPOpqe+7/VxjbRwcMt3bLwU0UDTaLz6VMhnMX54zQBm0Myq73ZmTaMYtfetTW8ZG+bOJzueASAX30AkC+BJM7KhKAzacsw4AdWt8CpsTWGOQzs6c6SvsrASo0uZP0+sMmgEhkY9EeMVx6X1nDXuTWk+LdBAe6AGHS3ze5vGalrw0VRUczI/aZKUbzeydkA==&cv=2.0&url=//sale.jd.com/act/jPbZs6QhNV.html" target="_blank">
									<img src="https://img14.360buyimg.com/da/jfs/t3889/320/1663573324/106061/9f4225e/5885d7e9N0cefb065.jpg" width="790" height="340" alt="banner" />
								</a>
							</li>
							<li style="display:none;">
								<a href="https://c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm5negws9Nr657HKBfKMPWBCiJrHxZmm04qPvYVovttjJ7DI6kAFcvjBQ5HcvZKVTq1qaN5pw2tCNZh9AGxXYJ2O4fLWlvRBkxoM4QrINBB7LV2iyKJjDAcOaPa8p8pRycSzCtpI/8VedmAx6YXxYAhQPcADfOydEgb3r/t/IOD6jebwKAFQoJNlTkPYqRWHa7QpodVXpEL15gIhF7tS9XGTIH/3PVpFk1yWjCKplUWsYiZkUIzjmhlPlHv4wTLvUHI6PS3e2iAxIftN/cIOoqdkLMz+Zwh2Sv2uEPtOqU+3QA==&cv=2.0&url=//sale.jd.com/act/owGvima4ZCp.html" target="_blank">
									<img src="https://img10.360buyimg.com/da/jfs/t4006/157/2579093115/162312/ba1b04e9/58ac1022N709d4c68.jpg" width="790" height="340" alt="banner" />
								</a>
							</li>
							<li style="display:none;">
								<a href="https://c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm5/+Q6kSQOF21lpm773NgeAF7GqQf4A7IheNcAyMGXSj72jBFb/Kwim0/xHmVGXAEDuMCf/nMbkbwtSmEkbt/Qz4fLWlvRBkxoM4QrINBB7LeW64M4moVi+b+/TnsVIIy+GAkBOhtbSBfH2fEr7qSSXPcADfOydEgb3r/t/IOD6jebwKAFQoJNlTkPYqRWHa7QpodVXpEL15gIhF7tS9XGTIH/3PVpFk1yWjCKplUWsYiZkUIzjmhlPlHv4wTLvUHI6PS3e2iAxIftN/cIOoqdkLMz+Zwh2Sv2uEPtOqU+3QA==&cv=2.0&url=//sale.jd.com/act/Vd2fybpJCRc.html" target="_blank">
									<img src="https://img14.360buyimg.com/da/jfs/t3049/351/6747776088/154880/b313c031/58abf267N405a0f63.jpg" width="790" height="340" alt="banner" />
								</a>
							</li>
							<li style="display:none;">
								<a href="https://ccc-x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTEwNzM0NzE1NV8yMzgyJnRvPWh0dHA6Ly9zYWxlLmpkLmNvbS9hY3QvQm1MTjM2NENKYzVaMC5odG1s&log=iPKaRMv1Nrlwpvy1sbruWshOxqCFnGW-8dwB5zNNcIei5BQ5hbfxg94mPvyNy2Iq144su-cnMOl9GPOObldgVgzlbaHIIQvqt0svT-yfWp_q8L4ch5KCB-eeH6G1CNYH3uu_5ElcYncdASqJr-vdE8aPkH12F7DTbrBBnleIQtSCWYlZp0LFmb-zpvStFi5Ccc1UK8UVrsljF_NhSqU6T2kFl3MilMDKS0cQ4N_kTH_3v-yOWuUxBHz6jdInqdJZk0CcChd-2QSPjrOXrZWYTl_0Z22hzKUwSHuk_sLnRxlIG6xwlXsDk2BlChREc496I0rt0wN103YfbEYRhwiL6yMbwz_jqnD_vyihwpm-O4YibBxrMRz6ftl8lopxbBDx_WS9f2XzbpgsVQgswwkuxQ&v=404" target="_blank">
									<img src="https://img13.360buyimg.com/da/jfs/t3979/152/2261766534/99941/6aa59e86/58a6c7e7N42be6cab.jpg" width="790" height="340" alt="banner" />
								</a>
							</li>
						</ul>
						<div class="d_con_jujiao">
							<i class="focu"></i>
							<i></i>
							<i></i>
							<i></i>
							<i></i>
							<i></i>
							<i></i>
							<i></i>
						</div>
					</div>
					<div class="d_con_buzdbanner">
						<a target="_blank" href="https://sale.jd.com/act/fCpjlzMUSDrxgqP.html">
							<img src="https://img10.360buyimg.com/vclist/s390x130_jfs/t3835/243/3445135693/32818/8e459c20/589841c4Ndfe7be2a.jpg!q90" width="390" height="130" alt="banner" />
						</a>
						<a target="_blank" href="https://sale.jd.com/act/6WLTJdcg3i5.html">
							<img src="https://img13.360buyimg.com/vclist/s390x130_jfs/t3169/124/6227039433/14828/fed1ad9d/58a29833Nae864d64.jpg!q90" width="390" height="130" alt="banner" />
						</a>
					</div>
				</div>
				<!-- 中间滚动图片结束-->
				<!-- 右边登录以及各种话费开始 -->
				<div class="d_con_gg">
					<div class="d_con_gg_login">
						<div class="d_con_gg_loginImg">
							<a target="_blank" href="https://passport.jd.com/new/login.aspx?ReturnUrl=http%3A%2F%2Fhome.jd.com%2F">
								<img src="https://misc.360buyimg.com/mtd/pc/common/img/no_login.jpg" width="45" height="45" alt="Login" />
							</a>
						</div>
						<div class="c_con_gg_hi">
							<p>Hi，欢迎来到京东！</p>
							<p>登录&nbsp;&nbsp;&nbsp;注册</p>
						</div>
					</div>
					<div class="d_con_gg_xinren">
						<a target="_black" href="https://xinren.jd.com/?channel=99">新人福利</a>
						<a target="_black" href="https://passport.jd.com/new/login.aspx?ReturnUrl=https%3A%2F%2Fplus.jd.com%2Findex">PLUS会员</a>
					</div>
					<div class="d_con_gg_cuxiao">
						<div class="d_con_gg_cuxiao_shou">
							<a>促销</a>
							<a class="gg">公告</a>
							<a>更多</a>
						</div>
						
						<!-- 促销移上去要显示对应的div  S-->
						<div class="d_con_gg_cuxiao_yd">
							<ul>
								<li><a target="_blank" href="https://sale.jd.com/act/OZTpwVhb6kGl.html" target="_blank">新年耍新机 满千减百</a></li>
								<li><a target="_blank" href="https://sale.jd.com/act/m2UDe4KZwJA.html" target="_blank">图书每100减40,优惠券限时抢!</a></li>
								<li><a target="_blank" href="https://sale.jd.com/act/rKk472qbQncMw.html" target="_blank">开年红包 抢1000元E卡</a></li>
								<li><a target="_blank" href="https://trip.jd.com/" target="_blank">每日享折扣 京东品质游</a></li>
							</ul>
						</div>
						<!-- 促销移上去要显示对应的div  E-->
					</div>
					<!-- 充话费 S -->
					<div class="d_con_gg_hf">
						<div class="d_con_gg_hf_shou">
							<ul>
								<li>
									<a target="_blank" href="https://chongzhi.jd.com/">
										<i class="hf"></i>
										<span>话费</span>
									</a>
								</li>
								<li>
									<a target="_blank" href="https://jipiao.jd.com/">
										<i class="jp"></i>
										<span>机票</span>
									</a>
								</li>
								<li>
									<a target="_blank" href="https://hotel.jd.com/">
										<i class="jd"></i>
										<span>酒店</span>
									</a>
								</li>
								<li>
									<a target="_blank" href="https://game.jd.com/">
										<i class="yx"></i>
										<span>游戏</span>
									</a>
								</li>
								<li>
									<a target="_blank" href="https://b.jd.com/">
										<i class="qyg"></i>
										<span>企业购</span>
									</a>
								</li>
								<li>
									<a target="_blank" href="https://jiayouka.jd.com/">
										<i class="jyk"></i>
										<span>加油卡</span>
									</a>
								</li>
								<li>
									<a target="_blank" href="https://movie.jd.com/index.html">
										<i class="dyp"></i>
										<span>电影票</span>
									</a>
								</li>
								<li>
									<a target="_blank" href="https://train.jd.com/">
										<i class="hcp"></i>
										<span>火车票</span>
									</a>
								</li>
								
								<li>
									<a target="_blank" href="https://z.jd.com/sceneIndex.html?from=jrscyn_20162">
										<i class="zc"></i>
										<span>众筹</span>
									</a>
								</li>
								<li>
									<a target="_blank" href="https://licai.jd.com/?from=jrscyn_20161">
										<i class="lc"></i>
										<span>理财</span>
									</a>
								</li>
								<li>
									<a target="_blank" href="https://o.jd.com/market/index.action">
										<i class="lpk"></i>
										<span>礼品卡</span>
									</a>
								</li>
								<li>
									<a target="_blank" href="https://baitiao.jd.com/?from=jrscyn_20160">
										<i class="bt"></i>
										<span>白条</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- 充话费 E -->
				</div>
				<!-- 右边登录以及各种话费开始 -->
			</div>
		</div>
		
		<!-- 左边导航结束 -->
	</body>

	<script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		/**
		 * 头部 横条广告叉号点击事件
		 */
		$(".head_banner .head_img i").click(function (){
			$(this).parent().parent().fadeOut();
		});
		
		/**城市里面的鼠标移入事件*/
		$(".city .c_con .c_con_login ul li").hover(function (){
			$(this).find("div").show();
		},function (){
			$(this).find("div").hide();
		});
		
		var leftIndex = 0;
		/**左边菜单鼠标移入事件*/
		$(".dao .d_con .d_con_cai ul li").hover(function (){
			leftIndex = $(this).index();
			$(".dao .d_con .leftMouse:eq("+leftIndex+")").show();
		},function (){
			$(".dao .d_con .leftMouse:eq("+leftIndex+")").hide();
		});
		/**左边菜单鼠标移入事件并且展开事件*/
		$(".dao .d_con .leftMouse").hover(function (){
			$(".dao .d_con .leftMouse:eq("+leftIndex+")").show();
		},function () {
			console.log("tichu");
			$(".dao .d_con .leftMouse:eq("+leftIndex+")").hide();
		});
		
		/**banner图片自动切换   开始*/
		var length = $(".dao .d_con .d_con_banner .d_con_zdbanner ul li").length;  /**图片的数量  用于计算要显示图片的索引是否超过length*/
		/**处理图片和button定时*/
		function imgButton(){
			var index = 0;
		 	$(".dao .d_con .d_con_banner .d_con_zdbanner ul li").each(function (){
				var hidden = $(this).is(":hidden");
				if(hidden == false){
					index = $(this).index();
				}
			 });
		 	 hiddenImg(index,true);
		 }
		 
		 /**根据传入的index 去对图片和button做相应的操作  true下一张 false当前index对应的图片和button的索引*/
		 function hiddenImg(index,flag){
		 	 if (flag) {
		 		 index = index+1;
			 	 index = index == length ? 0 : index;
		 	 }
			 //隐藏所有的图片
			 $(".dao .d_con .d_con_banner .d_con_zdbanner ul li").stop();
			 $(".dao .d_con .d_con_banner .d_con_zdbanner ul li").hide();
			 //隐藏所有的button
			 $(".dao .d_con .d_con_banner .d_con_zdbanner .d_con_jujiao i").removeClass("focu");
		 	 //当前图片显示
		 	 $(".dao .d_con .d_con_banner .d_con_zdbanner ul li:eq("+index+")").fadeIn("slow");
		 	 //当前的button显示
			 $(".dao .d_con .d_con_banner .d_con_zdbanner .d_con_jujiao i:eq("+index+")").addClass("focu");
		 }
		 var times = setInterval("imgButton()",2000);
		 
		 /**鼠标移动到图片的buttom事件*/
		 $(".dao .d_con .d_con_banner .d_con_zdbanner .d_con_jujiao i").hover(function(){
			clearInterval(times);
			var index = $(this).index();  //当前的index
			var showIndex = 0;
			//只有index不等于显示的li的index时再执行  hiddenImg 要不然一直在当前的button移动  会一直先空白一下  然后再显示
			$(".dao .d_con .d_con_banner .d_con_zdbanner ul li").each(function (){
				var hidden = $(this).is(":hidden");
				if(hidden == false){
					showIndex = $(this).index();
				}
			});
			if (index != showIndex){
				hiddenImg(index,false);
			}
		 },function (){
			times = setInterval("imgButton()",2000);
		 }); 
		 
		 /**鼠标移到图片上停止动画*/
		 $(".dao .d_con .d_con_banner .d_con_zdbanner ul li").hover(function (){
			 clearInterval(times);
		 },function (){
			 times = setInterval("imgButton()",2000);
		 });
		 /**banner图片自动切换   结束*/
		
	</script>
	
</html>
