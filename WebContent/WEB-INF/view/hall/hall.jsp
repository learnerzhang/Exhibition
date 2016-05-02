<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.7.min.js"></script>
<style>
<!--
body {
	margin: 0px;
	padding: 0px;
	font: 9pt/20px Arial, "宋体";
	color: #686868;
}

ul, li, ol, dl, dd, dt {
	list-style: none;
}

.mbody {
	width: 995px;
	margin: 0px auto;
}

#header {
	width: 995px;
	height: 230px;
	background: url(resources/images/exhiHallTop.jpg) no-repeat left top;
	margin-bottom: 10px;
}

#header2 {
	width: 995px;
}

#headerL {
	width: 620px;
	font: 18pt/20px Arial, "微软雅黑";
	color: #000;
	float: left;
}

#kehuLogo {
	width: 130px;
	float: left;
	height: 130px;
	padding-top: 65px;
	text-align: right;
	padding-left: 10px;
}

#wenzi {
	padding: 75px 0px 0px 20px;
	width: 460px;
	float: left;
}

.headerSpan {
	font: 14pt/20px Arial, "微软雅黑";
	color: red;
}

#headerR {
	width: 263px;
	height: 161px;
	float: left;
	text-align: right;
	padding-right: 112px;
}

.lakai {
	font-size: 1px;
	line-height: 1px;
	display: block;
	clear: both;
}

#menu {
	background: url(resources/images/exhiHall_08.gif) repeat-x;
	height: 35px;
	line-height: 35px;
	font-weight: bold;
	color: #fff;
}

#menul {
	width: 986px;
	height: 35px;
	background: url(resources/images/exhiHall_07.gif) no-repeat left;
	float: left;
}

#menul ul {
	margin: 0px;
	padding: 0px;
}

#menul li {
	width: 93px;
	float: left;
	background: url(resources/images/menulineHall.gif) no-repeat right top;
	padding-right: 5px;
	text-align: center;
}

.caidan {
	color: #fff;
	text-decoration: none;
}

.caidan:visited {
	color: #fff;
	text-decoration: none;
}

#menur {
	background: url(resources/images/exhiHall_10.gif);
	width: 9px;
	height: 35px;
	float: left;
}

#leftPanel {
	width: 227px;
	margin-right: 7px;
	float: left;
}

.zhanlanTime {
	display: block;
	clear: both;
	background: url(resources/images/leftconBg_17.gif) repeat-y left top;
	width: 222px;
	margin-left: 2px;
	color: #cb4f3d;
	line-height: 24px;
	margin-bottom: 10px;
}

.zhanlanTime h3 {
	background: url(resources/images/leftconBg_15.gif) no-repeat left top;
	height: 29px;
	margin: 0px;
	line-height: 29px;
	font-size: 14px;
	padding-left: 10px;
}

.zhanlanTime ul {
	padding: 5px 5px;
	margin: 0px;
}

.zhanlanTime ul a {
	color: #686868;
	text-decoration: none;
}

.zhanlanTime ul a:hover {
	color: red;
	text-decoration: none;
	cursor: pointer;
}

.zhanlanTime ul a:visited {
	color: #686868;
	text-decoration: none;
}

.zhanlanTime li {
	background: url(resources/images/hall_xuxian.gif) no-repeat left bottom;
	color: #686868;
	padding: 0px 3px;
}

.chengse {
	color: #c46039;
	text-decoration: none;
}

.chengse:visited {
	color: #c46039;
	text-decoration: none;
}

.chengse:hover {
	color: blue;
	cursor: pointer;
}

.more {
	float: right;
	padding-right: 10px;
	color: #cb4f3d;
	font-size: 12px;
	font-weight: normal;
	display: block;
	clear: both;
}

.redEndline {
	background: url(resources/images/leftconBg_19.gif) no-repeat left bottom;
	height: 7px;
	font-size: 0px;
}

.yellowTitle {
	display: block;
	clear: both;
	background: url(resources/images/leftconBg_22.gif) repeat-y left top;
	width: 222px;
	margin-left: 2px;
	line-height: 24px;
	margin-bottom: 10px;
}

.yellowTitle h3 {
	background: url(resources/images/leftconBg_21.gif) no-repeat left top;
	height: 29px;
	line-height: 29px;
	font-size: 14px;
	padding-left: 10px;
	color: #cb4f3d;
}

.yellowTitle img {
	margin: 8px 0px 0px 8px;
	width: 205px;
	height: 132px;
}

.yellowEndline {
	background: url(resources/images/leftconBg_32.gif) no-repeat left bottom;
	height: 7px;
	font-size: 0px;
}

#liuliang {
	background: url(resources/images/liuliang.gif) no-repeat;
	height: 35px;
	line-height: 35px;
	width: 212px;
	margin-left: 2px;
	padding-left: 10px;
}

#liuliang strong {
	font-weight: bold;
	color: #cb4f3d;
	margin-right: 10px;
}
.midConBgline {
	background: url(resources/images/exhiViewMidBg_17.gif) repeat-x;
	margin-bottom: 10px;
}
.midConBgUp {
	background: url(resources/images/exhiViewMidBg_15.gif) repeat-x left top;
}
.endBtnDingLi2 {
	background: url(resources/images/woding.gif) no-repeat;
	width: 66px;
	height: 51px;
	float: left;
	text-align: center;
	padding-top: 4px;
	font-weight: bold;
	font-size: 14px;
	margin-right: 5px;
	color: #000;
}
.endBtnDingLi1 {
	background: url(resources/images/wocai.gif) no-repeat;
	width: 66px;
	height: 51px;
	float: left;
	text-align: center;
	padding-top: 4px;
	font-weight: bold;
	font-size: 14px;
	margin-right: 5px;
	color: red;
}
#footer2 {
	margin-top: 35px;
	border-top: solid 4px #93c365;
	text-align: center;
	padding: 5px 0px 40px 0px;
	line-height: 22px;
	width: 996px;
	height: 66px;
}
-->
</style>
<script type="text/javascript">
<!--
	$(function(){
		$("#menu a").click(function(){

			var id = $(this).attr("id");
			if (id==1) {
				$("#mid").empty().load("hall/profile?id=${hall.id}");
			}else if(id==2){
				$("#mid").empty().load("hall/expo?id="+"${hall.id}");
			}else if(id==3){
				$("#mid").empty().load("hall/pic?id="+"${hall.id}");
			}else if(id==4){
				$("#mid").empty().load("hall/contact?id="+"${hall.id}");
			}
		});
		
		$("#yellowTitle_id a").click(function(){
			$("#mid").empty().load("hall/pic?id="+"${hall.id}");
		});
	})
//-->
</script>
<html>
<head>
<title>${hall.name }</title>
</head>
<body>
	<div class="mbody">
		<div id="header">
			<div id="header2">
				<div id="headerL">
					<div id="kehuLogo">
					</div>
					<div id="wenzi">
						${hall.name }<br> <br> <br> <span class="headerSpan">${hall.address }</span><br>
					</div>
				</div>
				<div id="headerR">
					<a href="<%=request.getContextPath() %>/"> <img height="60" src="resources/images/logo.gif" alt="中国会展网" border="0"></a>
				</div>
				<div class="lakai"></div>
			</div>
			<div id="menu">
				<div id="menul">
					<ul>
						<li><a id="1" class="caidan">展馆概况</a></li>
						<li><a id="2" class="caidan">办展信息</a></li>
						<li><a id="3" class="caidan">展馆图片</a></li>
						<li><a id="4" class="caidan">联系方式</a></li>
					</ul>
				</div>
				<div id="menur"></div>
			</div>
			<div class="lakai"></div>
		</div>

		<div style="height: 720px;">
			<div id="leftPanel">
				<div class="zhanlanTime">
					<h3>
						办展计划
					</h3>
					<ul>
						<c:forEach items="${news }" var="expo"> 
							<li><a href="expo?id=${expo.id }" target="_blank">${expo.name }</a></li>
						</c:forEach>
					</ul>
					<div class="redEndline"></div>
				</div>
				<div class="zhanlanTime">
					<h3>
						已办展会
					</h3>
					<ul>
						<c:forEach items="${olds }" var="expo"> 
							<li><a href="expo?id=${expo.id }" target="_blank">${expo.name }</a></li>
						</c:forEach>
					</ul>
					<div class="redEndline"></div>
				</div>
				<div class="yellowTitle" id="yellowTitle_id">
					<h3>
						<span class="more"><a class="chengse">更多&gt;&gt;</a></span>展馆图片
					</h3>
					<a > 
						<img src="<%=request.getContextPath() %>/resources/upload/${image.src}" width="234" height="132" border="0"></a>
					<div class="yellowEndline"></div>
				</div>
				<div id="liuliang">
					访问人：<strong>${hall.visit}</strong>
				</div>
			</div>
			
			<!-- 中间内容展示模块 -->
			<div id="mid" style="float:left;height：750px;width: 75%">
				<jsp:include page="profile.jsp"></jsp:include>
			</div>
		</div>
		<div id="footer2">
		    地址：${hall.address } 邮编：${hall.code }  联系人：${hall.contact } <br>电话：${hall.tel }
		    E-mail:${hall.email } Website: 待建中
		</div>
		
		<div class="lakai">
        </div>
	</div>
</body>
</html>