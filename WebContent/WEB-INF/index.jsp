<%@page import="com.es.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会展信息交流综合平台</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.json-2.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.i18n.properties-1.0.9.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.bgiframe.js"></script>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

body {
	background: #fff;
	color: #444;
	font: 12px Arial, '宋体';
}
ul, li, dl, dd, dt, ol {
	list-style: none;
}
.mheader {
	height: 30px;
	line-height: 20px;
	margin-bottom: 10px;
	margin-top: 2px;
	background: url(resources/images/bg-mini-header.gif) left top repeat-x;
}

.mheader_wrap {
	width: 1000px;
	margin: 0 auto;
	position: relative;
}

}
.mheader_left ul li {
	float: left;
	padding: 5px 5px 5px 0;
	overflow: hidden;
}

.mheader_left {
	padding-left: 0px;
	float: left;
}

ul {
	list-style-type: disc;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
	-webkit-padding-start: 40px;
	display: block;
}

li {
	list-style-type: none;
	display: list-item;
	text-align: -webkit-match-parent;
}

a {
	color: #417aa3;
	padding: 0 5px;
	font-size: 12px;
	text-decoration: none;
}
a:VISITED {
	color: #417aa3;
	text-decoration: none;
}
a:hover {
	color:red;
	text-decoration: underline;
}
.mheader_right {
	float: right;
	padding: 2px 2px 5px 0px;
	text-align: right;
	font-size: 12px;
	color: #CCC border: 2px solid black;
}

.mcontent {
	width: 996px;
	margin: 0 auto;
}

.mcontent_header {
	width: 996px;
	margin: 0 auto;
	margin-bottom：7px;
}

.mcontent_header_logo {
	width: 298px;
	height: 55px;
	padding-right: 5px;
	color: #999;
}

.mcontent_header_logo img {
	float: left;
	padding-right: 5px;
	border: none;
	margin-top: -5px;
}

.mcontent_header_logo span {
	float: left;
	display: inline-block;
	padding-top: 15px;
	width: 60px;
}

.mcontent_header_search {
	float: left;
	width: 570px;
	height: 56px;
	margin: 0px;
	padding: 0px;
	background: url("resources/images/bg_search.png") left bottom no-repeat;
}

.mcontent_header_search .call {
	float: right;
	height: 21px;
	line-height: 20px;
	text-align: right;
	color: #666;
}

.mcontent_header_search .call .callFront {
	font-size: 14px;
	font-weight: bold;
	color: #d5251d;
}

.mcontent_header_search .tabs {
	float: left;
	height: 21px;
	padding: 0;
	margin: 0;
	overflow: hidden;
	margin: 0;
}

.mcontent_header_search .tabs li {
	display: block;
	float: left;
	height: 21px;
	overflow: hidden;
}

.mcontent_header_search .tabs li.current {
	background: url("resources/images/bg_search.png") -56px top no-repeat;
	font-weight: bold;
	color: #555555;
	width: 56px;
}

.mcontent_header_search .tabs li a {
	display: block;
	float: left;
	height: 21px;
	width: 56px; margin：0px;
	padding: 0px;
	line-height: 20px;
	overflow: hidden;
	text-align: center;
	color: #666;
	text-decoration: none;
	line-height: 20px
}

.mcontent_header_search .tabs li.current a.first {
	width: 56px;
	background: url(resources/images/bg_search.png ") left top no-repeat;
}

.mcontent_header_search .panes {
	padding: 3px 0 4px 0;
	height: 28px;
}

.mcontent_header_search .panes ol li {
	float: left;
	padding-left: 4px;
}

.mcontent_header_search input {
	outline: none;
}

.input-search-name {
	background: url(resources/images/search-form.png) left top no-repeat;
	width: 380px;
	padding-left: 25px;
	border: none;
	height: 28px;
	color: #666;
	line-height: 28px;
	background-position: 0px -454px;
}

.input-search-area {
	background: url(resources/images/search-form.png) left -84px no-repeat;
	width: 55px;
	border: none;
	height: 28px;
	color: #666;
	line-height: 28px;
	padding-left: 5px;
	height: 28px;
	color: #666;
	line-height: 28px;
}

#search_select div.select {
	width: 98px;
	display: -moz-inline-stack;
	s display: inline-block;
	zoom: 1;
	vertical-align: bottom;
	background: #fff;
	height: 28px;
	background: url(resources/images/search-form.png) left -56px no-repeat;
	color: #666;
}

.areabox h3 {
	font-size: 12px;
	color: #01529f;
	margin: 0px;
	padding: 0px;
	padding-bottom: 5px;
	padding-left: 7px;
	font-weight: normal;
}

.areabox ul {
	width: 160px;
	padding-left: 0px;
	clear: both;
	overflow: hidden;
	margin: 0px;
}

.areabox ul.hline {
	background: url(resources/images/origin/hline.gif) left bottom repeat-x;
	padding-left: 0px;
	padding-bottom: 10px;
	margin-bottom: 10px;
}

.areabox ul.hline li {
	display: inline-block;
	float: left;
	width: 40px;
	height: 18px;
	text-align: center;
	overflow: hidden;
	margin: 0px;
	padding: 0px;
	padding-left: 0px;
	list-style: none;
	list-style-type: none;
}

.areabox ul.more li {
	display: inline-block;
	float: left;
	width: 40px;
	height: 18px;
	text-align: center;
	overflow: hidden;
	margin: 0px;
	padding: 0px;
	padding-left: 0px;
	list-style: none;
	list-style-type: none;
}

.areabox ul li a {
	display: block;
	height: 16px;
	line-height: 16px;
	padding-left: 0px;
	overflow: hidden;
	font-size: 12px;
	width: 40px;
	padding: 0;
	margin: 0;
}

.mcontent_nav {
	height: 33px;
	background: url(resources/images/nav.png) left top no-repeat;
	line-height: 33px;
	color: #FFF;
}

.mcontent_nav_main {
	float: left;
	width: 756px;
	padding: 0 2px;
	margin: 0px;
}

.mcontent_nav_main ul li.current {
	background: url(resources/images/bg_nav_h.png) right center no-repeat;
	color: #01529f;
}

.mcontent_nav_main ul li {
	float: left;
	margin-top: -12px;
	font-size: 14px;
	font-weight: bold;
	width: 120px;
	text-align: center;
	background: url(resources/images/bg_nav_h.png) right center no-repeat;
}

.mcontent_nav_main ul li a, .mcontent_nav_main ul li a:link, .mcontent_nav_main ul li a:visited {
	color: #FFF;
	text-decoration: none;
}
.mcontent_nav_main ul li a:hover{
	cursor: pointer;
}
.mcontent_nav_main ul li.current a, .mcontent_nav_main ul li.current a:link, .mcontent_nav_main ul li.current a:hover, .mcontent_nav_main ul li.current a:visited
{
	color: yellow;
	background: url(resources/images/bg_nav_current.png) top center no-repeat;
}

.mcontent_body {
	width: 100%;
	margin: 0 auto;
	margin-top: 10px;
}

#div1{
	float:left;
	margin-bottom: 6px;
	border: solid 1px #aaccee;
	width: 267px;
	height: 214px;
	margin-right: 7px;
	padding: 4px 2px 4px 6px;
}
.HomePickNo {
	position: absolute;
	z-index: 4;
	width: 90px;
	height: 19px;
	margin-top: 173px;
	color: #fff;
	padding-left: 173px;
	background: url(resources/images/PickBg.png) !important;
	_background: #000;
	filter: Alpha(Opacity=0, -moz-opacity:0, FinishOpacity=100, -moz-FinishOpacity=100, Style=1, StartX=0, StartY=0, FinishX=100, FinishY=140);
}
#simg TD, #simg li {
	float: left;
	border-left: 1px solid #858484;
	height: 19px;
	line-height: 19px;
	display: block;
	text-align: center;
	width: 17px;
	display: block;
	background: #000;
	color: #fff;
	cursor: hand;
}
#simg .s{
	background: red;
}
#bimg {
	width: 263px;
	height: 193px;
}
.undis {
	display: none;
	line-height: 0px;
	height: 0px;
}
.dis{
	display: block;
}
#infos {
	line-height: 20px;
}
#div2{
	width: 428px;
	height: 223px;
	float: left;
	background: url(resources/images/new_pickBG.gif) no-repeat;
	padding: 1px 0px 0px 1px;
	margin-bottom: 6px;
}
.expo_list_index {
	float: right;
	margin-left: 5px;
	border: #aaccee 1px solid;
	width: 274px;
	height: 221px;
	overflow: hidden;
}
.expo_list_index .tabs {
	height: 26px;
	background: url(resources/images/expo_photo_index.gif) left top repeat-x;
	clear: both;
	overflow: hidden;
}
.expo_list_index .tbcon {
	padding: 10px;
}
.expo_list_index .tabs ul{
	margin: 0px;
	padding: 0px;
}
.expo_list_index .tabs ul li {
	float: left;
	height: 25px;
	line-height: 25px;
	width: 90px;
	border-bottom: #aaccee 1px solid;
	border-right: #aaccee 1px solid;
	text-align: center;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
}
.expo_list_index .tabs ul li.current {
	float: left;
	width: 90px;
	background-color: #FFF;
	border-bottom: #fff 1px solid;
}

.expo_list_index .tabs ul li.last {
	border-right: none;
}

.expo_list_index .tbcon ul{
	padding: 0px;
	margin: 2px;
}
.expo_list_index .tbcon ul li {
	background: url(resources/images/arow01.gif) left center no-repeat;
	line-height: 22px;
	padding-left: 10px;
}
.expo_list_index .tbcon ul li span {
	float: right;
	color: #666;
}
.forange, .forange a {
	color: #d5251d;
}
.blue_bg {
	background: url(resources/images/BG_blue_kuai.gif) repeat-x;
	height: 26px;
}

.expo_china_on {
	width: 108px;
	background: #fff;
	height: 25px;
	border-bottom: solid 1px #aaccee;
	border-right: solid 1px #aaccee;
	font-weight: bold;
	line-height: 25px;
	text-align: center;
	font-size: 14px;
	float: left;
	cursor: pointer;
}
.gengduom {
	height: 26px;
	line-height: 26px;
	float: right;
	padding-right: 10px;
	font-weight: normal;
	font-size: 12px;
}

.r1{
	height: 120px;
	background: url(resources/images/BG_xuxian.gif) repeat-x left bottom;
	margin-bottom: 3px;
	margin-top: 7px !important;
	margin-top: 5px;
}

.r2{
	height: 95px;
	margin-top: 7px;
}
.grid{
	width: 50%;
	float: left;
	height: 100px;
	font: 9pt/20px Arial, "宋体";
	color: #417aa3;
}
.grid ul{
	margin-top:2px;
	margin-left:0px;
	padding: 5px 5px;
}
.grid h3{
	margin-top:8px;
	margin-left: 5px;
}
.grid h3 a{
	font-size: 16px;
	font-weight: bold;
}

.grid h3 a:HOVER{
	color:red;
	text-decoration: none;
}
.grid h3 a:VISITED{
	color: #417aa3;
	text-decoration: none;
}

.grid h3 strong{
	color: #FF0000;
}
.grid h3 ul li a{
	color: #417aa3;
	text-decoration: none;
}
.grid h3 ul li a:hover{
	color: red;
	text-decoration: underline;
}
.grid h3 ul li a:visited{
	color: #417aa3;
	text-decoration: none;
}
.blue_bg {
	background: url(resources/images/BG_blue_kuai.gif) repeat-x;
	height: 26px;
}
.news_tab_on {
	width: 106px;
	background: #fff;
	height: 25px;
	border-bottom: solid 1px #fff;
	border-right: solid 1px #aaccee;
	font-weight: bold;
	line-height: 25px;
	text-align: center;
	font-size: 14px;
	float: left;
	cursor: pointer;
}
.news_tab_off {
	width: 106px;
	background: none;
	height: 25px;
	border-bottom: solid 1px #aaccee;
	border-right: solid 1px #aaccee;
	line-height: 25px;
	text-align: center;
	font-size: 14px;
	float: left;
	cursor: pointer;
}
#news_pick_bg {
	background: url(resources/images/BG_news_pick.gif);
	width: 409px;
	height: 70px;
	padding: 7px 5px 3px;
}
#news_pick_bg h3 {
	color: #FF0000;
	font-size: 16px;
	font-weight: bold;
}
#news_pick_bg h3 a{
	color: #FF0000;
	font-size: 16px;
	font-weight: bold;
}
.ared {
	color: #ff0000;
	text-decoration: none;
}
.ared:visited {
	color: #ff0000;
	text-decoration: none;
}
.ahuise {
	color: #666;
	text-decoration: none;
}
.ahuise:visited {
	color: #666;
	text-decoration: none;
}
#news_pick_bg p {
	color: #666;
}
.news_content {
	width: 419px;
	padding: 4px;
	height: 188px;
}
.news_content ul {
	padding: 0px 10px 10px 10px;
	font: 10pt/22px Arial,"宋体";
}
.news_content li {
	background: url(resources/images/list_dian.gif) no-repeat left center;
	padding-left: 11px;
}
.news_content li a{
	color: #417aa3;
	text-decoration: none;
}
.news_content li a:visited {
	color: #417aa3;
	text-decoration: none;
}
.recommend_cont {
	display: block;
	padding: 0px 5px;
	height: 280px;
	overflow: hidden;
	clear: both;
}
.recommend_t_bg {
	height: 26px;
	background: url(resources/images/BG_blue_kuai.gif) repeat-x left top;
	line-height: 26px;
}
.recommend_title {
	font-weight: bold;
	font-size: 14px;
	height: 26px;
	line-height: 26px;
	padding-left: 6px;
	color: #417AA3;
}

.recommend_c_list {
	height:70px;
	padding-bottom: 6px;
	margin-top: 9px;
	border-bottom: 1px dotted #aaccee;
}
.recommend_c_img {
	float: left;
	width: 81px;
	height: 56px;
	overflow: hidden;
	position: relative;
	_position: static;
}
.recommend_c_img a {
	display: inline-block;
	width: 81px;
	height: 56px;
}
.recommend_c_text {
	float: right;
	width: 176px;
}
.recommend_c_text h4.t {
	font-weight: bold;
	color: red;
	line-height: 15px;
}
.recommend_c_text h4 a.c_f {
	color: #1259b7;
	text-decoration: none;
}
.recommend_c_text p span {
	display: block;
	padding: 1px 0px;
}
.recommend_c_text p span {
	display: block;
	padding: 1px 0px;
}
</style>
<script type="text/javascript">
	jQuery.fn.selectCity = function(targetId) {
		var _seft = this;
		var targetId = $(targetId);
		this.click(function() {
					//alert("click the area");
					var A_top = $(this).offset().top + $(this).outerHeight(true);
					var A_left = $(this).offset().left;

					//alert(A_top + "px ; "+A_left + "px");
					targetId.bgiframe();
					targetId.show().css( {
										"display" : "block",
										"position" : "absolute",
										//"top" : A_top + "px",
										//"left" : A_left + "px",
										"height" : "350px",
										"width" : "160px",
										"top" : "25px",
										"left" : "0px",
										"padding" : "10px 10px",
										"background" : "url(resources/images/bg_area_pop.gif) left top no-repeat",
										"overflow" : "hidden"
									});
				});
		$(document).click(function(event) {//点击文本空白处......
			if (event.target.id != _seft.selector.substring(1)) {
				targetId.hide();
			}
		});
		targetId.find("#close").click(function() {
			targetId.hide();
		});
		/****
		 *	填充内容
		 */
		targetId.find("a").click(function() {
			_seft.val($(this).html());
			_seft.css("color", "rgb(0, 0, 0)");
			targetId.hide();
		});

		targetId.click(function(e) {
			e.stopPropagation();
		});

		return this;
	}
	jQuery.focusblur = function(focusid) {
		var focusblurid = $(focusid);
		var defval = focusblurid.val();

		focusblurid.focus(function() {
			var thisval = $(this).val();
			if (thisval == defval) {
				$(this).val("");
				$(this).css("color", "rgb(0, 0, 0)");
			}
		});
		focusblurid.blur(function() {
			var thisval = $(this).val();
			if (thisval == "") {
				$(this).css("color", "rgb(213, 213, 213)");
				$(this).val(defval);
			}
		});
	};
	<!--- onmouseover  play(this,'bimg','infos');clearAuto(); onmouseout setAuto() --->
	function play(index,bimg,infos)
	{
		for(var i=0;i<$("#simg td").length;i++)
		{
			if(index == i)
			{
				$("#simg td").eq(i).attr("class","s");
				$("#bimg div").eq(i).attr("class","dis");
				$("#infos div").eq(i).attr("class","dis");
				
			}else {
				$("#simg td").eq(i).attr("class","");
				$("#bimg div").eq(i).attr("class","undis");
				$("#infos div").eq(i).attr("class","undis");
			}
		}
	}
	
	var curIndex = 0;
	var hasStarted = false; //是否已经开始轮播
	var interval;
	function switchFun(){
		
		var preIndex = curIndex;
		curIndex = (curIndex+1)%5;
		
		$("#simg td").eq(preIndex).attr("class","");
		$("#bimg div").eq(preIndex).attr("class","undis");
		$("#infos div").eq(preIndex).attr("class","undis");
		
		$("#simg td").eq(curIndex).attr("class","s");
		$("#bimg div").eq(curIndex).attr("class","dis");
		$("#infos div").eq(curIndex).attr("class","dis");
	}
	function setAuto()
	{
		for(var i=0;i<$("#simg td").length;i++)
		{
			if(i == 0)
			{
				$("#simg td").eq(i).attr("class","s");
				$("#bimg div").eq(i).attr("class","dis");
				$("#infos div").eq(i).attr("class","dis");
				
			}else {
				$("#simg td").eq(i).attr("class","");
				$("#bimg div").eq(i).attr("class","undis");
				$("#infos div").eq(i).attr("class","undis");
			}
		}
		if(!hasStarted){
			hasStarted = true;
			curIndex = 0;
			interval = setInterval(switchFun, 2000);
		}
	}
	
	function clearAuto()
	{
		clearInterval(interval);
		hasStarted = false;
	}
	
	$(function() {
		setAuto();
		
		var type="展会";
		$("#area").selectCity("#areabox");
		$("#logout").click(function() {
			$.ajax({
				contentType : "application/json",
				type : "post",
				url : "<%=request.getContextPath()%>/user?method=logout",
				datatype : "json",
				//async : false,
				success : function(result) {
					if (result.hasOwnProperty("code")) {
						if (result.code=="0") {
							  window.location.href="<%=request.getContextPath()%>/";
						}else if (result.code=="-1") {
							alert("网络异常,请稍后再试!");
						}
					}
				}
			});
		});
		$("#search_btn").click(function() {

			var search = $("#search_context").val();
			if (search == "请输入展会名称"||search == "请输入展商名称"||search == "请输入展馆名称") {
				search="";//搜索的内容
			}
			var area = $("#area").val();
			if(area =="地区"){
				area = "";
			}
			search = encodeURI(encodeURI(search));
			area = encodeURI(encodeURI(area));
			if (type=="展会") {
				$("#content").empty().load("<%=request.getContextPath()%>/search/expo?context="+search+"&area="+area);
			}else if (type=="展商") {
				$("#content").empty().load("<%=request.getContextPath()%>/search/enterprise?context="+search+"&area="+area);
			}else if (type=="展馆") {
				$("#content").empty().load("<%=request.getContextPath()%>/search/hall?context="+search+"&area="+area);
			}
			
		});
		var urlstatus = false;
		$("#search_tabs li").click(function() {
			$(this).addClass('current').siblings().removeClass('current');
			type = $(this).find('a').text();
			$("#search_context").val("请输入" + type + "名称");
			$("#search_context").css("color", "rgb(213, 213, 213)");
			$.focusblur("#search_context");
		});
		if (!urlstatus) {
			$("#search_tabs li").eq(0).addClass('current');
			$.focusblur("#search_context");
		}
		urlstatus = false;
		if (!urlstatus) {
			$("#mcontent_nav_main li").eq(0).addClass('current');
		}
		
		$("#mcontent_nav_main li").click(function() {
			$(this).addClass('current').siblings().removeClass('current');
			var id = $(this).attr("id");
			if (id==1) {
				$("#content").empty().load("<%=request.getContextPath()%>/index");
			} else if (id==2) {
				$("#content").empty().load("<%=request.getContextPath()%>/news");
			} else if (id==3) {
				$("#content").empty().load("<%=request.getContextPath()%>/enterprises");
			} else if (id==4) {
				$("#content").empty().load("<%=request.getContextPath()%>/halls");
			} else if (id==5) {
				
			}
		});
	});
</script>
</head>
<body>
	<div>
		<!-- 网站开头 -->
		<div class="mheader">
			<div class="mheader_wrap">
				<div class="mheader_left">
					<ul style="padding: 2px 0px 5px 2px; margin: 0px 0px 0px 0px;">
						<li>
							<%
								User user = (User) session.getAttribute("user");
								if (user == null) {
							%> <font color="#417aa3">您好，欢迎来中国会展网!</font>
							<a href="<%=request.getContextPath()%>/user?method=login">登录</a>
							|<a href="<%=request.getContextPath()%>/user?method=register">注册</a>
							<%-- |<a href="<%=request.getContextPath()%>"> 忘记密码</a> |<a
							href="<%=request.getContextPath()%>" target="_blank">帮助中心</a>  --%><%
 	} else {
 %> 欢迎<span style="padding: 0px 5px 0px 5px;"><%=user.getUsername()%>
						</span><a
							href="<%=request.getContextPath()%>/user/<%=user.getUsername()%>">用户中心</a><a id="logout">退出登录</a>
							<%
								}
							%>
						</li>
					</ul>
				</div>
				<div class="mheader_right">
					<a style="color: #666; font-size: 12px; padding: 0 5px; background-image: url('resources/images/weibo.png'); background-repeat: no-repeat; text-decoration: none; cursor: pointer;" href="http://weibo.com/" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;关注会展中心</a>
				</div>
			</div>
		</div>
		<div class="mcontent">
			<div class="mcontent_header">
				<!-- header 包含三部分 0 logo  1 search  2 menu bar -->

				<div class="mcontent_header_logo" style="float: left;">
					<!-- logo block-->
					<a href="<%=request.getContextPath()%>/"> <img alt="会展综合平台" src="resources/images/logo.png" width="225" height="60">
					</a> <span style="padding: 0; margin: 0;"> 会展交流综合平台 </span>
				</div>
				<div class="mcontent_header_search">
					<!-- search block-->
					<div class="call">
						<span style="padding: 0px; margin: 0px; background-image: url('resources/images/un_bg_nav_foot.png'); background-repeat: no-repeat; background-position-x: 0px; background-position-y: -236px; padding-left: 20px; padding-right: 10px"><font class="callFront">400-8888-888</font></span>
					</div>
					<ul class="tabs" id="search_tabs">
						<li><a href="#">展会</a></li>
						<li><a href="#">展商</a></li>
						<li><a href="#">展馆</a></li>
					</ul>
					<div style="clear: both;"></div>
					<div class="panes">
						<div class="current">
							<ol>
								<li><input type="text" id="search_context" class="input-search-name" value="请输入展会名称" style="color: rgb(213, 213, 213);"></li>
								<li style="position: relative;">
								<input type="text" id="area" class="input-search-area" value="地区" name="address" style="color: rgb(213, 213, 213);"> <!-- 弹出的内容 -->
									<div id="areabox" class="areabox" style="display: none; clear: both;">
										<h3>
											<img src="resources/images/close.png" id="close" style="cursor: pointer; float: right;">选择地区
										</h3>
										<ul class="hline">
											<li><a href="#" id="3101">上海</a></li>
											<li><a href="#" id="1101">北京</a></li>
											<li><a href="#" id="4401">广州</a></li>
											<li><a href="#" id="4403">深圳</a></li>
											<li><a href="#" id="1201">天津</a></li>
											<li><a href="#" id="2102">大连</a></li>
											<li><a href="#" id="3201">南京</a></li>
											<li><a href="#" id="3301">杭州</a></li>
											<li><a href="#" id="3701">济南</a></li>
											<li><a href="#" id="3702">青岛</a></li>
											<li><a href="#" id="4101">郑州</a></li>
											<li><a href="#" id="5001">重庆</a></li>
											<li><a href="#" id="5101">成都</a></li>
											<li><a href="#" id="5301">昆明</a></li>
											<li><a href="#" id="6101">西安</a></li>
											<li><a href="#" id="8101">香港</a></li>
										</ul>
										<ul class="more">
											<li><a href="#" id="1100">北京</a></li>
											<li><a href="#" id="1200">天津</a></li>
											<li><a href="#" id="1300">河北</a></li>
											<li><a href="#" id="1400">山西</a></li>
											<li><a href="#" id="1500">内蒙古</a></li>
											<li><a href="#" id="2100">辽宁</a></li>
											<li><a href="#" id="2200">吉林</a></li>
											<li><a href="#" id="2300">黑龙江</a></li>
											<li><a href="#" id="3100">上海</a></li>
											<li><a href="#" id="3200">江苏</a></li>
											<li><a href="#" id="3300">浙江</a></li>
											<li><a href="#" id="3400">安徽</a></li>
											<li><a href="#" id="3500">福建</a></li>
											<li><a href="#" id="3600">江西</a></li>
											<li><a href="#" id="3700">山东</a></li>
											<li><a href="#" id="4100">河南</a></li>
											<li><a href="#" id="4200">湖北</a></li>
											<li><a href="#" id="4300">湖南</a></li>
											<li><a href="#" id="4400">广东</a></li>
											<li><a href="#" id="4500">广西</a></li>
											<li><a href="#" id="4600">海南</a></li>
											<li><a href="#" id="5000">重庆</a></li>
											<li><a href="#" id="5100">四川</a></li>
											<li><a href="#" id="5200">贵州</a></li>
											<li><a href="#" id="5300">云南</a></li>
											<li><a href="#" id="">西藏</a></li>
											<li><a href="#" id="6100">陕西</a></li>
											<li><a href="#" id="6200">甘肃</a></li>
											<li><a href="#" id="6300">青海</a></li>
											<li><a href="#" id="6400">宁夏</a></li>
											<li><a href="#" id="">新疆</a></li>
											<li><a href="#" id="">台湾</a></li>
											<li><a href="#" id="8101">香港</a></li>
											<li><a href="#" id="8201">澳门</a></li>
											<li><a href="#" id="9000">亚洲</a></li>
											<li><a href="#" id="9100">欧洲</a></li>
											<li><a href="#" id="9200">北美洲</a></li>
											<li><a href="#" id="9300">南美洲</a></li>
											<li><a href="#" id="9400">大洋洲</a></li>
											<li><a href="#" id="9500">非洲</a></li>
										</ul>
									</div></li>
								<li><input type="image" name="" id="search_btn" src="resources/images/btn-search.png" style="border-width: 0px;"></li>
							</ol>
						</div>
					</div>
				</div>
				<div style="clear: both;"></div>
				<div style="display: block; height: 10px; margin: 0px; padding: 0px;"></div>
				<div class="mcontent_nav">
					<!-- menu bar block-->
					<div class="mcontent_nav_main" id="mcontent_nav_main">
						<ul>
							<li id="1"><a>首页</a></li>
							<li id="2"><a>展会资讯</a></li>
							<li id="3"><a>参展展商</a></li>
							<li id="4"><a>参展展馆</a></li>
						</ul>
					</div>
					<div class="mcontent_nav_service"></div>
				</div>

			</div>
			<div id="content">
				<jsp:include page="view/public/index.jsp"></jsp:include>
			</div>
		</div>
		<div style="clear: both;"></div>
		<!-- <div id="footer">
			<div class="dblock">
				<div class="inline-block">
					<img src="resources/images/logo-gray.png">
				</div>
				<div class="inline-block copyright">
					<p>
						<a href="#">关于我们</a> | <a href="#">微博</a> | <a href="#">隐私政策</a> |
						<a href="#">人员招聘</a>
					</p>
					<p>Copyright © 2015 会展交流中心</p>
				</div>
			</div>
		</div> -->
		<jsp:include page="view/public/footer.jsp"></jsp:include><!-- 公共部分 -->
	</div>
</body>
</html>