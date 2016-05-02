<%@page import="com.es.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${expo.name }</title>
<link
	href="http://resource.expo-china.com/Style/Exhibition/jquery-ui.css"
	rel="stylesheet" type="text/css">
<link
	href="http://resource.expo-china.com/style/exhibition/jquery-ui-timepicker-addon.css"
	rel="stylesheet" type="text/css">
<link
	href="http://resource.expo-china.com/style/exhibition/jquery.slideBox.css"
	type="text/css" rel="Stylesheet">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/dateFormat.js"></script>

<style type="text/css">
body, ul, ol, li, p, h1, h2, h3, h4, h5, h6, form, fieldset, table, td,
	img, div, dl, dt, dd {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 12px;
}

html, body {
	font-family: "微软雅黑";
}

body {
	color: #666666;
	font: 12px Arial, '宋体';
}

.shouqi_link, .close_tanchu, .shouquan, .zhankai_link, .hzsmall_icon,
	.nav, .nav dl, .nav dl.nav_2 dt, .width100, .zhanhuijieshao_t,
	.zhanhuijieshao_t a, .lijie_zhanhuitupian_t, .lijie_zhanhuitupian_t a,
	.zhanweitu_t, .zhanweitu_t .t, .zaixianzhanshang_t, .zaixianzhanshang_t .t,
	.sidian, .shengqing_jia, .tongqizhanhui_t, .tongqizhanhui_t .t,
	.industy_contantUs_t, .industy_contantUs_t .t, .t, .ask dt, .answer dt,
	.zhantai_design_t, .zhantai_design_t .t, .huizhanfuwu_t, .huizhanfuwu_t .t,
	.yuwei {
	background-image: url(resources/images/index_bg.png);
	background-repeat: no-repeat;
}

li {
	list-style-type: none;
}

a {
	cursor: pointer;
}

.hangYeLogo {
	float: left;
	height: 130px;
	padding-left: 10px;
	padding-top: 50px;
	text-align: right;
	width: 180px;
}

.width100 {
	width: 100%;
	background-position: 0px -327px;
	border-bottom: 1px solid #ddd;
	background-image: url("resources/images/index_bg.png");
	background-repeat: repeat-x;
	position: fixed;
	top: 0px;
	z-index: 999;
	left: 0px;
}

.width_1000 {
	width: 1000px;
	margin: 0px auto;
}

.top_head {
	width: 1000px;
	height: 27px;
	line-height: 27px;
	margin: 0px auto;
}

.top {
	height: 200px;
	margin-top: 27px;
}

.headerSpan3 a, .top_head a {
	text-decoration: none;
	padding: 0 5px;
}

.top_head a {
	color: #666;
}

.top_head a:hover {
	color: blue;
	text-decoration: underline;
}

.hearderLeft {
	color: #000000;
	float: left;
	font: 18pt/20px Arial, "微软雅黑";
	width: 800px;
}

.hangYeLogo {
	float: left;
	height: 130px;
	padding-left: 10px;
	padding-top: 50px;
	text-align: right;
	width: 180px;
}

.hangye_title {
	float: left;
	padding: 40px 0 0 20px;
	width: 470px;
}

.hangye_t_wenzi {
	font-size: 21px;
	line-height: 22px;
	padding-top: 6px;
	position: absolute;
	width: 650px;
	z-index: 99;
}

.headerTime {
	color: #222222;
	font: 12pt/20px Arial, "微软雅黑";
}

.headerSpan3 {
	margin-right: 15px;
}

.hangye_c_h {
	color: #222222;
	font: 10pt/26px Arial, "微软雅黑";
}

.hearderRight {
	float: right;
	padding-top: 40px;
	text-align: right;
	width: 110px;
	padding-right: 15px;
}

.clear {
	clear: both;
	font-size: 0;
	height: 0;
	line-height: 0;
	margin: 0;
	overflow: hidden;
	padding: 0;
}

.nav {
	height: 40px;
	background-position: 0px 0px;
	background-repeat: repeat-x;
	background-image: url("resources/images/index_bg.png");
	color: #fff;
	font-weight: bold;
	overflow: hidden;
}

.mb10 {
	margin-bottom: 10px;
}

.nav dl {
	float: left;
	display: block;
	height: 40px;
	line-height: 40px;
	background-position: 0px -226px;
	background-image: url("resources/images/index_bg.png");
	background-repeat: no-repeat no-repeat;
}

.nav dl.nav_1 {
	width: 2px;
}

.nav dl.nav_2 {
	padding: 0px 35px;
	float: left;
	background: url("resources/images/index_bg.png") no-repeat 0px -223px
		right center;
}

.nav dl.nav_2 dt {
	width: 93px;
	background-position: -3px -40px;
	text-align: center;
}

.nav dl dt, .nav dl dd {
	float: left;
	font-size: 16px;
	font-family: "宋体", Arial, Helvetica, sans-serif;
}

.font20 {
	font-size: 20px;
}

.pr5 {
	padding-right: 5px;
}

i, em {
	font-style: normal;
}

em.renzheng_tu {
	display: inline-block;
	width: 21px;
	height: 22px;
	padding-top: 8px;
	float: left;
	padding-right: 5px;
}

.shareLink {
	background: #fff;
	margin-top: 5px;
	padding: 3px;
	border-radius: 3px;
}

.columnLeft {
	float: left;
	width: 220px;
	margin-right: 10px;
}

.mb10 {
	margin-bottom: 10px;
}

.daojishi {
	height: 100px;
	background-repeat: no-repeat;
}

.daoshi_date_number {
	font-size: 20px;
	font-family: Tahoma, Geneva, sans-serif;
	color: #4d4d4d;
	padding-right: 5px;
}

.dateAndTiXing {
	padding: 40px 15px 0px 30px;
	height: 45px;
}

.tishi_big {
	position: relative;
	float: right;
	width: 55px;
}

.daojishi_tishi {
	display: block;
	text-decoration: none;
	text-align: center;
	background: #ff8800;
	padding: 3px;
	margin-top: 15px;
}

.daoshi_date {
	width: 120px;
	float: left;
	font-size: 14px;
	font-weight: bold;
}

.tixing_text {
	position: absolute;
	white-space: nowrap;
	border: 1px solid #BFBFBF;
	box-shadow: 0 0 5px #DDDDDD;
}

.tixing_text_c {
	padding: 5px;
	background: #fff;
}

.cover_style {
	position: absolute;
	background: #DDDDDD;
	left: 0%;
	top: 0%;
	right: 0%;
	z-index: 19998;
}

.Mail_Remind {
	width: 220px;
	height: 150px;
	position: absolute;
	left: 50%;
	right: 50%;
	border: 1px solid red;
	background-color: white;
	margin-left: -110px;
	margin-top: -75px;
	display: none;
	z-index: 19999;
	border: 3px solid #FEBE8F;
	border-radius: 5px;
	padding: 15px;
}

.close_tanchu {
	float: right;
	background-position: -57px -356px;
	margin-top: -33px;
	margin-right: -30px;
	_margin-right: -18px;
	position: relative;
	z-index: 4;
}

.close_tanchu a {
	display: block;
	width: 36px;
	height: 36px;
}

.tanchu_sq_btn_weizhi {
	padding-top: 25px;
	text-align: center;
	padding-bottom: 10px;
}

.tijiao_shenqing_btn {
	display: inline-block;
	padding: 0px 20px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	background: #f80;
	font-size: 14px;
	font-weight: bold;
	color: #fff;
	text-decoration: none;
	border: 1px solid #f80;
	border-radius: 3px;
}

.zhanweitu_t, .zaixianzhanshang_t, .tongqizhanhui_t,
	.industy_contantUs_t, .online_questions_t, .zhantai_design_t,
	.huizhanfuwu_t {
	height: 33px;
	background-position: 0px -266px;
	background-repeat: repeat-x;
	overflow: hidden;
}

.zaixianzhanshang_c, .tongqizhanhui_c {
	text-align: center;
}

.zhanweitu_c, .zaixianzhanshang_c, .tongqizhanhui_c {
	padding: 6px 10px;
}

.zaixianshengqing {
	position: relative;
	display: inline-block;
	background: #fff8d9;
	border: 1px solid #febe8f;
	border-radius: 3px;
	font-weight: bold;
	padding: 5px 15px;
	margin-top: 8px;
	cursor: pointer;
}

.zaixianshengqing a, .fabu_b_b, .t_fabu_btn {
	color: #ff6600;
	text-decoration: none;
	float: left;
}

.shengqing_jia {
	display: inline-block;
	display: block;
	float: left;
	width: 16px;
	height: 17px;
	background-position: -33px -305px;
	margin-left: 5px;
}

.canzhanshang_tanchu, .fabumess_tanchu {
	width: 540px;
	display: none;
	position: absolute;
}

.canzhanshang_tanchu, .fabumess_tanchu, .fabu_zhaobiao_tanchu {
	padding: 15px;
	background: #fff;
	border: 3px solid #FEBE8F;
	border-radius: 5px;
	text-align: left;
}

.tongqizhanhui_t {
	height: 33px;
	background-position: 0px -266px;
	background-repeat: repeat-x;
	overflow: hidden;
}

.zaixianzhanshang_c, .tongqizhanhui_c {
	text-align: center;
}

.zhanweitu_c, .zaixianzhanshang_c, .tongqizhanhui_c {
	padding: 6px 10px;
}

.zaixianzhanshang_c, .tongqizhanhui_c {
	text-align: center;
}

.sidian {
	display: inline-block;
	float: left;
	width: 15px;
	height: 15px;
	background-position: 0px -302px;
	margin-top: 5px;
}

ul.zxzs li, ul.tqzh li {
	height: 30px;
	line-height: 30px;
	border-bottom: 1px dashed #ddd;
	text-align: left;
}

ul.zxzs li a:hover, ul.tqzh li a:hover {
	color: #1e82ca;
	text-decoration: underline;
}

ul.tqzh li a {
	display: block;
	height: 30px;
	width: 175px;
	overflow: hidden;
}

ul.zxzs li a, ul.tqzh li a {
	color: #666;
	text-decoration: none;
}

.columnCenter {
	float: left;
	width: 560px;
}

.tab_content {
	height: auto;
	padding: 15px 10px;
}

ul.time_zhanguang {
	padding-bottom: 10px;
	height: 15px;
}

ul.time_zhanguang li {
	float: left;
	width: 260px;
}

strong {
	color: #BB5500;
}

.lg18 {
	line-height: 18px;
}

.suoj {
	text-indent: 2em;
}

.zhuban_danwei_big {
	padding: 8px 0px;
	line-height: 20px;
}

.zhuban_danwei p {
	float: left;
	width: 470px;
}

.zhuban_danwei strong {
	float: left;
	width: 66px;
}

.zhanhui_gaishu_l, .zhanpin_fanwei_l {
	float: left;
	padding-top: 10px;
}

.zhanhui_gaishu_t, .zhanpin_fanwei_t {
	padding-bottom: 8px;
}

.zhanhui_gaishu, .zhanpin_fanwei_big {
	padding-bottom: 10px;
}

.bdb {
	border-bottom: 1px dashed #6e6e6e;
}

.zhanhuijieshao, .zaixianzhanshang, .tongqizhanhui, .lijie_zhanhuitupian,
	.industy_contantUs, .zhantai_design, .huizhanfuwu {
	border: 1px solid #bed8f1;
	border-top: none;
}

.zhanhuijieshao_t a:hover, .zhanhuijieshao_t a.current,
	.lijie_zhanhuitupian_t a:hover, .lijie_zhanhuitupian_t a.current {
	background-position: 0px -117px;
	_background-position: 0px -116.5px;
	color: #fff;
	font-weight: bold;
}

.zhanhuijieshao_t a, .lijie_zhanhuitupian_t a {
	height: 37px;
	display: block;
	float: left;
	height: 37px;
	width: 93px;
	background-position: 0px -80px;
	background-repeat: repeat-x;
	text-align: center;
	font-size: 14px;
	color: #333;
	text-decoration: none;
}

.zhanhuijieshao_t, .lijie_zhanhuitupian_t {
	width: 558px;
	height: 37px;
	line-height: 32px;
	background-position: 0px -80px;
	background-repeat: repeat-x;
	overflow: hidden;
}

.zhanweitu_t {
	height: 33px;
	background-position: 0px -266px;
	background-repeat: repeat-x;
	overflow: hidden;
}

.zhanweitu_t .t, .zaixianzhanshang_t .t, .tongqizhanhui_t .t,
	.industy_contantUs_t .t, .online_questions_t .t, .zhantai_design_t .t,
	.huizhanfuwu_t .t {
	float: left;
	height: 33px;
	background-position: 0px -116px;
	font-size: 14px;
	font-weight: bold;
	line-height: 33px;
	padding: 0px 12px;
	color: #fff;
	background-repeat: repeat-x;
}

.zhanweitu {
	border: 1px solid #bed8f1;
	border-top: none;
}

.industy_contantUs_c, .my_say {
	padding: 15px;
	overflow: hidden;
}

.industy_contantUs_c {
	height: 130px;
}

.industy_contant_left {
	float: left;
	width: 120px;
	height: 80px;
	border: 1px solid #ccc;
}

.industy_contant_right {
	float: right;
	width: 396px;
	line-height: 24px;
	margin-top: -5px;
}

.industy_con_textTwo {
	float: left;
	width: 198px;
}

img {
	vertical-align: top;
}

.columnRight {
	float: right;
	width: 200px;
}

.order_btn_big a.zhanweiyuding {
	background-position: 0px -100px;
	background-repeat: no-repeat;
}

.order_btn_big a.guangzhanyuding {
	background-position: 0px -148px;
	background-repeat: no-repeat;
}

.order_btn_big a {
	display: block;
	width: 200px;
	height: 48px;
	margin-bottom: 8px;
}

.zhanhuijieshao, .zaixianzhanshang, .tongqizhanhui, .lijie_zhanhuitupian,
	.industy_contantUs, .online_questions, .zhantai_design, .huizhanfuwu {
	border: 1px solid #bed8f1;
	border-top: none;
}

.zhantai_design_t {
	height: 33px;
	background-position: 0px -266px;
	background-repeat: repeat-x;
	overflow: hidden;
}

.zhantai_design_t {
	height: 33px;
	background-position: 0px -266px;
	background-repeat: repeat-x;
	overflow: hidden;
}

.design_c_tab {
	border-bottom: 1px solid #bed8f1;
}

.design_tab {
	float: left;
	width: 68px;
	background: #e7f2fd;
}

.design_tab li a {
	display: block;
	text-decoration: none;
	color: #666;
	border-right: 1px solid #bed8f1;
	border-top: 1px solid #bed8f1;
	height: 30px;
	line-height: 30px;
	overflow: hidden;
	padding: 4px 0;
	text-indent: 10px;
}

.design_tab li a:hover, .design_tab li a.current {
	display: block;
	color: #0097dd;
	font-weight: bold;
	height: 30px;
	line-height: 30px;
	background: #fff;
	border-top: 1px solid #bed8f1;
	border-right: 1px solid #fff;
}

.design_con {
	float: right;
	width: 120px;
}

.daojishi, .order_btn_big a, .business_services .t, .zhanshi_qq_online,
	.zhanshi_ting a, .zhanshi_zulin a, .zhanshi_gongchang a {
	background: url(resources/images/icon_2.png);
}

.zhanshi_ting a, .zhanshi_zulin a, .zhanshi_gongchang a {
	display: block;
	height: 23px;
}

.zhanshi_ting, .zhanshi_zulin, .zhanshi_gongchang {
	width: 198px;
	height: 30px;
	margin: 5px 0px 0px 0px;
}

.zhanshi_ting a {
	background-position: 0px -289px;
}

.zhanshi_ting a:hover {
	text-decoration: underline;
	color: #1e82ca;
}

.zhanshi_zulin a {
	background-position: 0px -312px;
}

.zhanshi_zulin a:hover {
	text-decoration: underline;
	color: #1e82ca;
}

.zhanshi_qq_online {
	border-top: 1px solid #bed8f1;
	width: 198px;
	height: 46px;
	background-position: 0px -243px;
	background-repeat: no-repeat;
}

.design_qq_num {
	display: block;
	color: #D61010;
	text-decoration: none;
	padding-top: 30px;
	padding-left: 58px;
	width: 140px;
	height: 16px;
}

.canzhanshang_tanchu, .fabumess_tanchu {
	width: 540px;
	display: none;
	position: absolute;
}

.canzhanshang_tanchu, .fabumess_tanchu, .fabu_zhaobiao_tanchu {
	padding: 15px;
	background: #fff;
	border: 3px solid #FEBE8F;
	border-radius: 5px;
	text-align: left;
}

.close_tanchu {
	float: right;
	background-position: -57px -356px;
	margin-top: -33px;
	margin-right: -30px;
	_margin-right: -18px;
	position: relative;
	z-index: 4;
}
.cz_tanchu_t {
	height: 30px;
	overflow: hidden;
	padding-left: 25px;
	line-height: 30px;
	border-left: 5px solid #FEBE8F;
	background: #fffbe7;
	margin-bottom: 8px;
}
.text_bottom_line {
	border: none;
	background: none;
	border-bottom: 1px solid #ccc;
	height: 20px;
	line-height: 20px;
}
.fuzhu_text {
	color: #888;
	padding-top: 20px;
}
.tijiao_shenqing_btn {
	display: inline-block;
	padding: 0px 20px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	background: #f80;
	font-size: 14px;
	font-weight: bold;
	color: #fff;
	text-decoration: none;
	border: 1px solid #f80;
	border-radius: 3px;
}
.table_canzhanshang_tanchu tr td {
	padding: 4px 0px;
}
</style>
<script type="text/javascript">
<!--实现 scan 功能-->
	function setTab(name, cursel, n) {
		for (i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById("tab_" + name + "_" + i);
			menu.className = i == cursel ? "current" : "";
			con.style.display = i == cursel ? "block" : "none";
		}
	}
	function DateDiff(sDate1, sDate2) { //sDate1和sDate2是2006-12-18格式  
		var aDate, oDate1, oDate2, iDays;
		aDate = sDate1.split("-");
		oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]); //转换为12-18-2006格式  
		aDate = sDate2.split("-");
		oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
		iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24); //把相差的毫秒数转换为天数  
		return iDays;
	}

	function setDaoJiShi() {
		var id = $("#daoshi_date").attr("id");
		var startline = "${fn:split(expo.startline," ")[0] }";
		var deadline = "${fn:split(expo.deadline," ")[0] }";
		var date = new Date().Format("yyyy-MM-dd");

		if (startline > date) {
			$("#daoshi_date").append(
					"<i class='daoshi_date_number'>距开幕 "
							+ DateDiff(startline, date) + "天</i>");
		} else if (deadline > date) {
			$("#daoshi_date").append(
					"<i class='daoshi_date_number'>距结束 "
							+ DateDiff(deadline, date) + "天</i>");
		} else {
			$("#daoshi_date").append("<i class='daoshi_date_number'>已结束</i>");
		}
	}

	function AddWaterMark() {
		$("#C_phone").watermark(' 如：021-51696950-XXX ', 'water');
		$("#C_website").watermark('如：www.a.com', 'water');
	}

	function Show_cover() {
		var client_width = $(window).width()
		var clent_heigth = $(window).height() + $(document).scrollTop();
		$("#cover").css("width", client_width + "px").css("height",clent_heigth + "px").css("filter", "alpha(opacity=80)").css("opacity", "0.8").show();

	}
	function get_obj(id) {
		return document.getElementById(id);
	}
	function Show_p(obj) {
		var scrolltop = $(document).scrollTop();
		var b_width = $(window).width();
		var b_height = $(window).height();
		var divS = get_obj(obj);
		divS.style.display = "block";
		var div_width = divS.offsetWidth;
		var div_height = divS.offsetHeight;

		var left = b_width/2-div_width/2 + "px";
		var top = b_height/2+scrolltop-div_height/2 + "px";
		$("#" + obj).css("top", top).css("left", left).css("z-index", "19999");
		Show_cover();
	}
	$(function() {
		setDaoJiShi();
	});
</script>
</head>
<body>
	<iframe frameborder="0"
		style="position: absolute; display: none; opacity: 0;"></iframe>
	<div class="jiathis_style"
		style="position: absolute; z-index: 1000000000; display: none; top: 50%; left: 50%; overflow: auto;"></div>
	<div class="jiathis_style"
		style="position: absolute; z-index: 1000000000; display: none; overflow: auto;">
	</div>
	<form name="frmExhibition" method="post"
		action="./Exhibition-97102.html?ex_id=97102" id="frmExhibition">
		<div class="width100" id="ie6head">
			<div class="top_head">
				<div id="UCLogin1_Panel_NoLogin">

					<div class="mini-header-mblogin">
						<ul>
							<li>
								<%
									User user = (User) session.getAttribute("user");
									if (user == null) {
								%> <font color="#417aa3">您好，欢迎来中国会展网!</font>&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="<%=request.getContextPath()%>/user?method=login">登录</a> |
								<a href="<%=request.getContextPath()%>/user?method=register">注册</a>
								| <a href="<%=request.getContextPath()%>"> 忘记密码</a> | <a
								href="<%=request.getContextPath()%>" target="_blank">帮助中心</a> <%
 	} else {
 %>
								欢迎<span style="padding: 0px 5px 0px 5px;"><%=user.getUsername()%>
							</span><a
								href="<%=request.getContextPath()%>/user/<%=user.getUsername()%>">用户中心</a><a
								href="<%=request.getContextPath()%>/user?method=logout">退出登录</a>
								<%
									}
								%>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="width_1000">

			<!--头部开始-->
			<div class="top"
				style="background: url(resources/images/header_bg.jpg) no-repeat;">
				<div class="hearderLeft">
					<div class="hangYeLogo">
						<img alt="log" src="resources/images/ttt.jpg" width="120"
							height="90">
					</div>
					<div class="hangye_title">
						<div class="hangye_t_wenzi">${expo.name }</div>
						<br> <br> <br> <span class="headerTime">${fn:split(expo.startline," ")[0] }--${fn:split(expo.deadline," ")[0] }</span>
						<br> <span class="hangye_c_h"> <span class="headerSpan3">场馆：<a target="_blank" href="#">${expo.venue }</a></span> 行业:${expo.industry }
						</span>
					</div>
				</div>
				<div class="hearderRight">
					<a href="<%=request.getContextPath()%>/"><img alt="exhi_logo"
						src="resources/images/logo.gif" width="107" height="29"></a>
				</div>
				<div class="clear"></div>
			</div>

			<div class="nav mb10">
				<dl class="nav_1" style="float: right;">
					<dt></dt>
					<dd></dd>
				</dl>
				<dl class="nav_2">
					<dt>推荐指数：</dt>
					<dd>
						<i class="font20 pr5">${expo.recommend }</i>分
					</dd>
				</dl>
				<dl class="nav_2">
					<dt>展会认证：</dt>
					<dd>
						<c:choose>
							<c:when test="${expo.certified == '0'}">
								<em class="renzheng_tu"> <img
									src="resources/images/False.png" width="21" height="22">
								</em>
								<i class="renzheng">(未认证)</i>
							</c:when>
							<c:when test="${expo.certified == '1'}">
								<em class="renzheng_tu"> <img
									src="resources/images/True.png" width="21" height="22">
								</em>
								<i class="renzheng">(已认证)</i>
							</c:when>
						</c:choose>
					</dd>
				</dl>
				<dl class="nav_2">
					<dt>访问量：</dt>
					<dd>
						<i class="font20 pr5">${expo.visit_number }</i>
					</dd>
				</dl>
				<dl class="nav_2 last">
					<dt>分享到：</dt>
					<dd class="shareLink">
						<!-- JiaThis Button BEGIN -->
						<div class="jiathis_style_24x24">
							<a class="jiathis_button_qzone" title="分享到QQ空间"> <span
								class="jiathis_txt jtico jtico_qzone"></span></a> <a
								class="jiathis_button_tsina" title="分享到新浪微博"><span
								class="jiathis_txt jtico jtico_tsina"></span></a> <a
								class="jiathis_button_tqq" title="分享到腾讯微博"><span
								class="jiathis_txt jtico jtico_tqq"></span></a> <a
								class="jiathis_button_renren" title="分享到人人网"><span
								class="jiathis_txt jtico jtico_renren"></span></a> <a
								class="jiathis_button_kaixin001" title="分享到开心网"><span
								class="jiathis_txt jtico jtico_kaixin001"></span></a>
						</div>
						<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1356662987785668" charset="utf-8"></script>
						<script type="text/javascript"
							src="http://v3.jiathis.com/code/plugin.client.js" charset="utf-8"></script>
						<!-- JiaThis Button END -->
					</dd>
				</dl>
				<div class="clear"></div>
			</div>
			<div class="mainContant">
				<div class="columnLeft">
					<div class="daojishi mb10">
						<div class="dateAndTiXing">
							<div class="daoshi_date" id="daoshi_date"></div>

							<div class="tishi_big">
								<a class="daojishi_tishi" id="remind" style="cursor: pointer; color: gray;" title="登陆，设置展会提醒！" href="#">提醒</a>
								<div class="tixing_text" style="display: none;">
									<div class="tixing_text_c" id="remaindmail"></div>
								</div>
							</div>
							<div class="clear"></div>
						</div>

						<div class="Mail_Remind" id="Mail_Remind">
							<div class="close_tanchu">
								<a href="#" onclick="close();"> </a>
							</div>
							<div id="wrap">
								<br> 邮箱地址：<i id="txtMail"></i><br> <br> 提醒时间：<input type="text" id="txttime" maxlength="20" value="" readonly="readonly"><i id="timemsg"></i> <br>
								<div class="tanchu_sq_btn_weizhi">
									<a class="tijiao_shenqing_btn" style="cursor: pointer;" id="btnsend" onclick="PostMailInfo();">发送</a>
								</div>
							</div>
						</div>
					</div>


					<div class="zhanweitu mb10">
						<div class="zhanweitu_t">
							<h2 class="t">展位图</h2>
						</div>
						<div class="zhanweitu_c" style="height: 225px;">
							<div id="demo3" class="slideBox"
								style="width: 208px; height: 220px;">
								<ul class="items" style="width: 208px; left: 208px;">
									<li class="" style="width: 208px; height: 220px;"><a href="javascript:void(0)"><img width="208" height="220" src="resources/images/wu.jpg"></a></li>
								</ul>
								<div class="tips" style="opacity: 0.6;">
									<div class="title">
										<a href="javascript:void(0)"></a>
									</div>
									<div class="nums" style="">
										<a href="javascript:void(0)" class="active"
											style="border-radius: 10px;"></a> <a
											href="javascript:void(0)" class="active"
											style="border-radius: 10px;"></a> <a
											href="javascript:void(0)" class="active"
											style="border-radius: 10px;"></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="zaixianzhanshang mb10">
						<div class="zaixianzhanshang_t">
							<h2 class="t">在线展商</h2>
						</div>
						<div class="zaixianzhanshang_c">
							<ul class="zxzs">
							</ul>
							<span class="zaixianshengqing"><a id="zaixianshengqing">申请成为在线参展商</a><i
								class="shengqing_jia"></i></span>
						</div>
					</div>

					<div class="tongqizhanhui mb10">
						<div class="tongqizhanhui_t">
							<h2 class="t">同类型展会</h2>
						</div>
						<div class="tongqizhanhui_c">
							<span class="zaixianshengqing"><a target="_blank"
								href="http://wpa.qq.com/msgrd?v=3&amp;uin=613553124&amp;site=qq&amp;menu=yes">申请成为同类型展会<br>
							</a> <!--<i class="shengqing_jia"></i>--></span>
						</div>
					</div>
				</div>
				<div class="columnCenter">
					<div class="zhanhuijieshao mb10" id="displaying">
						<div class="zhanhuijieshao_t">
							<a id="zhanhui1" onclick="setTab('zhanhui',1,6)" class="current">展会概况</a>
							<a id="zhanhui2" onclick="setTab('zhanhui',2,6);GuideLoadData();"
								class="">参展指南</a> <a id="zhanhui3"
								onclick="setTab('zhanhui',3,6);LoadvisitguideData()" class="">
								观展指南</a> <a id="zhanhui4"
								onclick="setTab('zhanhui',4,6);LoadNews();" class="">最新动态</a> <a
								id="zhanhui5" onclick="setTab('zhanhui',5,6);LoadPreviousData()"
								class="">往届回顾</a> <a style="border: currentColor;" id="zhanhui6"
								onclick="setTab('zhanhui',6,6);LoadHostInfo();" class="">关于主办方</a>
							<div class="clear"></div>
						</div>
						<input type="hidden" name="ExhibitionUserControl1$HfExid"
							id="ExhibitionUserControl1_HfExid" value="97102">
						<div class="zhanhuijieshao_c">
							<div id="tab_zhanhui_1" class="tab_content"
								style="display: block;">
								<ul class="time_zhanguang bdb clearfix">
									<li><strong>展览时间：</strong>${fn:split(expo.startline," ")[0] }至${fn:split(expo.deadline," ")[0] }</li>
									<li><strong>会展场馆：</strong>${expo.venue }</li>
								</ul>
								<div class="zhanhui_gaishu bdb">
									<div class="zhanhui_gaishu_t">
										<div class="clear"></div>
									</div>
									<p class="suoj lg18" id="brief">${expo.expo_introduction }
									</p>
								</div>
								<div class="zhuban_danwei_big bdb">
									<div class="zhuban_danwei">
										<strong>主办单位：</strong>
										<p>${expo.organizer }</p>
										<div class="clear"></div>
									</div>
									<div class="zhuban_danwei">
										<strong>承办单位：</strong>
										<p>${expo.undertaker }</p>
										<div class="clear"></div>
									</div>
									<div class="zhuban_danwei">
										<strong>协办单位：</strong>
										<p>${expo.co_organizer }</p>
										<div class="clear"></div>
									</div>
								</div>
								<div class="zhanpin_fanwei_big bdb">
									<div class="zhanpin_fanwei_t">
										<strong class="zhanpin_fanwei_l">展品范围：</strong>
										<!----<a class="zhankai_link" ishow="false" onclick='Myshow($("#range"),arr[1],$("#tab_zhanhui_1"))'></a>------>
										<div class="clear"></div>
									</div>
									<p id="range">${expo.product_area }</p>
								</div>
								<div class="zhanpin_fanwei_big bdb">
									<div class="zhanpin_fanwei_t">
										<strong class="zhanpin_fanwei_l">展会特色：</strong>
										<!------<a class="zhankai_link" ishow="false" onclick='Myshow($("#feature"),arr[2],$("#tab_zhanhui_1"))'></a>---->
										<div class="clear"></div>
									</div>
									<p id="feature">${expo.product_feature }</p>
								</div>
							</div>
							<div style="display: none;" id="tab_zhanhui_2"
								class="tab_content">
								<div
									style="border-top-color: rgb(110, 110, 110); border-top-width: 1px; border-top-style: dashed;"
									class="zhanhui_gaishu bdb">
									<div class="zhanhui_gaishu_t">
										<strong class="zhanhui_gaishu_l">展会概述：</strong>
										<!--------<a class="zhankai_link" ishow="false" onclick='Myshow($("#guide_brief"),arr[3],$("#tab_zhanhui_2"))'></a>----->
										<div class="clear"></div>
									</div>
									<p class="suoj lg18" id="guide_brief">
										${expo.expo_description }</p>
								</div>
								<div class="zhuban_danwei_big bdb">
									<div class="zhuban_danwei">
										<strong>展会时间：</strong>
										<p id="ex_time">${fn:split(expo.startline," ")[0] }</p>
										<div class="clear"></div>
									</div>
								</div>
								<div class="zhuban_danwei_big bdb">
									<div class="zhuban_danwei">
										<strong>参展价格：</strong>
										<p id="participant_pricle">${expo.expo_price }</p>
										<div class="clear"></div>
									</div>
								</div>
								<div class="zhuban_danwei_big bdb">
									<div class="zhuban_danwei">
										<strong>优惠活动：</strong>
										<p id="preferential">${expo.promotions }</p>
										<div class="clear"></div>
									</div>
								</div>
								<div class="zhuban_danwei_big bdb">
									<div class="zhuban_danwei">
										<strong>广告费用：</strong>
										<p id="adv_cost">${expo.ad }</p>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							<div style="display: none;" id="tab_zhanhui_3"
								class="tab_content">
								<div class="zhuban_danwei_big bdb">
									<div class="zhuban_danwei">
										<strong>展会时间：</strong>
										<p id="visit_time">${fn:split(expo.startline," ")[0] }</p>
										<div class="clear"></div>
									</div>
								</div>
								<div class="zhuban_danwei_big bdb">
									<div class="zhuban_danwei">
										<strong>观众要求：</strong>
										<p id="ex_require">${expo.audience_require }</p>
										<div class="clear"></div>
									</div>
								</div>
								<div class="zhuban_danwei_big bdb" style="display: none;">
									<div class="zhuban_danwei">
										<strong>优惠活动：</strong>
										<p id="visit_preferential">${expo.promotions }</p>
										<div class="clear"></div>
									</div>
								</div>
								<div class="zhanhui_gaishu bdb" style="display: none;">
									<div class="zhanhui_gaishu_t">
										<strong class="zhanhui_gaishu_l">已报名展商：</strong>
										<!--<a class="zhankai_link" ishow="false" onclick='Myshow($("#visit_company"),arr[4],$("#tab_zhanhui_3"))'></a>--->
										<div class="clear"></div>
									</div>
									<p class="suoj lg18" id="visit_company"></p>
								</div>
							</div>
							<div style="display: none;" id="tab_zhanhui_4"
								class="tab_content">
								<ul class="huizhan_news_list" id="exhi_news"></ul>
							</div>
							<div style="display: none;" id="tab_zhanhui_5"
								class="tab_content">
								<div
									style="border-top-color: rgb(110, 110, 110); border-top-width: 1px; border-top-style: dashed;"
									class="zhanpin_fanwei_big bdb">
									<div class="zhanpin_fanwei_t">
										<strong class="zhanpin_fanwei_l">往届总结：</strong> <a
											class="zhankai_link" onclick=""></a>
										<div class="clear"></div>
									</div>
									<p id="pastsummary"></p>
								</div>
							</div>
							<div style="display: none;" id="tab_zhanhui_6"
								class="tab_content">
								<div class="zhuban_danwei_big bdb">
									<div class="zhuban_danwei">
										<strong style="display: block; width: 90px;">主办方介绍：</strong>
										<p id="host_info">${expo.about_organizer }</p>
										<div class="clear"></div>
									</div>
								</div>
								<div class="zhuban_danwei_big bdb">
									<div class="zhuban_danwei">
										<strong>联系方式：</strong>
										<p id="host_contact">${expo.contact }</p>
										<div class="clear"></div>
									</div>
								</div>
							</div>
						</div>
						<!--展会介绍结束-->
					</div>

					<div class="industy_contantUs mb10">
						<div class="industy_contantUs_t">
							<h2 class="t">联系方式</h2>
						</div>
						<div class="industy_contantUs_c">
							<div class="industy_contant_left">
								<img alt="CompanyLogo" width="120px" height="80px" src="resources/images/wu.jpg">
							</div>
							<div class="industy_contant_right">
								<p>公司名称：${user.company_name }</p>
								<p>公司地址：${user.area } ${user.address }</p>
								<p class="industy_con_textTwo">联&nbsp;
									系&nbsp;人：${user.contact }</p>
								<p class="industy_con_textTwo">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：${user.mobile_number }
								</p>
								<p class="industy_con_textTwo">
									在&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;线： <a target="_blank"
										href="http://wpa.qq.com/msgrd?v=3&amp;uin=2506816587&amp;site=qq&amp;menu=yes">
										<img border="0" src="http://wpa.qq.com/pa?p=2:2506816587:42"
										alt="12345678" title="12345678">
									</a>

								</p>
								<p class="industy_con_textTwo">固定电话：16888888888</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
				<div class="columnRight">
					<!--展位预订按钮开始-->
					<div class="order_btn_big mb10">
						<a href="#" style="cursor: pointer;" class="zhanweiyuding"></a>
						<a href="#" style="cursor: pointer;" class="guangzhanyuding"> </a>
					</div>
					<div class="zhantai_design mb10">
						<div class="zhantai_design_t">
							<h2 class="t">展会营销</h2>
						</div>
						<div class="zhantai_design_c">
							<div style="text-align: center; padding: 2px 0;">
								<a href="#"><img src="resources/images/innerpage_banner.jpg"></a>
							</div>
							<div class="zhanshi_qq_online">
								<a target="_blank" class="design_qq_num" href="http://wpa.qq.com/msgrd?v=3&amp;uin=88888888&amp;site=qq&amp;menu=yes">
									<strong>88888888</strong>
								</a>
							</div>
						</div>
					</div>
					<div class="zhantai_design mb10">
						<div class="zhantai_design_t">
							<h2 class="t">展台设计</h2>
						</div>
						<div class="zhantai_design_c">
							<div class="design_c_tab">
								<ul class="design_tab" id="design_tab">
									<li><a href="#" id="zwdesign1"
										onmouseover="setTab('zwdesign',1,3)">经济型</a></li>
									<li><a href="#" id="zwdesign2"
										onmouseover="setTab('zwdesign',2,3)" class="current"> 标准型</a></li>
									<li><a href="#" id="zwdesign3"
										onmouseover="setTab('zwdesign',3,3)">豪华型</a></li>
								</ul>
								<div class="design_con">
									<div class="design_contant" id="tab_zwdesign_1"
										style="display: block;">
										<dl class="ztdesign_tu">
											<dd>
												<img
													src="http://www.expo-china.com/Static/ExDesk/Images/367_20110413170133916601.jpg"
													width="110" height="70">
											</dd>
											<dt>500~800/平米</dt>
										</dl>
									</div>
									<div class="design_contant" id="tab_zwdesign_2"
										style="display: none">
										<dl class="ztdesign_tu">
											<dd>
												<img
													src="http://www.expo-china.com/Static/ExDesk/Images/413_20110422160012613099.jpg"
													width="110" height="70">
											</dd>
											<dt>800~1000/平米</dt>
										</dl>
									</div>
									<div class="design_contant" id="tab_zwdesign_3"
										style="display: none">
										<dl class="ztdesign_tu">
											<dd>
												<img
													src="http://www.expo-china.com/Static/ExDesk/Images/461_20110713173354317857.jpg"
													width="110" height="70">
											</dd>
											<dt>1200/平米</dt>
										</dl>
									</div>
								</div>
								<div class="clear"></div>
							</div>
							<div class="zhanshi_gongchang"
								style="border-bottom: 1px solid #bed8f1; display: none;">
								<a href="#"></a>
							</div>
							<div class="zhanshi_ting"
								style="border-bottom: 1px solid #bed8f1;">
								<a href="http://sr.expo-china.com/zhanting/show_office.html"
									target="_blank"></a>
							</div>
							<div class="zhanshi_zulin">
								<a href="#" target="_blank"> </a>
							</div>
							<div class="zhanshi_qq_online">
								<a target="_blank" class="design_qq_num"
									href="http://wpa.qq.com/msgrd?v=3&amp;uin=12345678&amp;site=qq&amp;menu=yes">
									<strong>12345678</strong>
								</a>
							</div>
						</div>
					</div>
					<!--展台设计结束-->
				</div>
				<div class="clear"></div>
			</div>
			<jsp:include page="../public/footer.jsp"></jsp:include><!-- 公共部分 -->
		</div>
	</form>
	<iframe style="display: none;"></iframe>
</body>
</html>