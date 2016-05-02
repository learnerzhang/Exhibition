<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${enterprise.name }</title>
</head>
<style>
body {
	font: 9pt/20px Arial, "宋体";
	color: #474747;
	margin: 0;
	padding: 0;
	background: url(resources/images/top.gif) no-repeat top center;
}

#mainBody {
	width: 920px;
	margin: 0px auto;
}

#header {
	height: 88px;
}
#header ul {
	float: left;
	height: 36px;
	display: block;
	margin-top: 52px;
	padding-left: 0px;
}

#header ul li {
	float: left;
	width: 97px;
	height: 36px;
	line-height: 40px;
	display: block;
	margin-left: 4px;
	text-align: center;
	font-weight: bold;
	font-size: 14px;
}

#header ul li a {
	width: 97px;
	height: 36px;
	display: block;
	color: #fff;
	text-decoration: none;
}

#header ul li a:visited {
	text-decoration: none;
	color: #fff;
}

.menu_on, .menu_off {
	background: url(resources/images/menu.gif) no-repeat;
}

.menu_off {
	background-position: -97px 0px;
}

.menu_on {
	background-position: 0px 0px;
}

#banner {
	border: 5px solid #ddf2fc;
	width: 910px;
	height: 175px;
	margin: 10px 0px 6px;
}
#main {
	background: #ebf2fa;
	height:424px;
	border: 1px solid #cbd5e1;
	padding: 5px 5px 7px;
}
#footer {
	background: #dfeff7 url(resources/images/footer.gif) no-repeat top center;
	height: 146px;
	margin-top: 10px;
}
.end_menu {
	height: 30px;
	line-height: 30px;
	background: #232323;
}
.endMenu_Bor {
	width: 920px;
	height: 30px;
	margin: 0px auto;
}
.endMenu_Bor p {
	float: left;
	font-weight: bold;
	color: #fff;
	margin: 0px;
}
.endMenu_Bor p a{
	text-decoration: none;
	color: #fff;
}
.endMenu_Bor p a:visited {
	text-decoration: none;
	color: #fff;
}
.endMenu_Bor span {
	float: right;
	display: block;
	width: 35px;
	height: 21px;
	margin-top: 5px;
}
.copyright {
	margin: 20px auto 0px;
	width: 920px;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#header li").click(function() {
			
			$(this).addClass('menu_on').siblings().removeClass('menu_on').addClass('menu_off');
			var id = $(this).attr("id");
			if (id==1) {
				$("#main").empty().load("<%=request.getContextPath()%>/enterprise/index?id=${enterprise.id }");
			}else if (id==2) {
				$("#main").empty().load("<%=request.getContextPath()%>/enterprise/about_us?id=${enterprise.id }");
			}else if (id==4) {
				$("#main").empty().load("<%=request.getContextPath()%>/enterprise/manager?id=${enterprise.id }");
			}else if (id==6) {
				$("#main").empty().load("<%=request.getContextPath()%>/enterprise/contact?id=${enterprise.id }");
			}
			
		});
	});
</script>
<body>
	<div id="mainBody">
		<!--/ 网站头部 开始-->
		<div id="header">
			<ul>
				<li class="menu_on" id="1"><a >首 页</a></li>
				<li class="menu_off" id="2"><a >关于我们</a></li>
				<li class="menu_off" id="4"><a >主营业务</a></li>
				<li class="menu_off" id="6"><a >联系我们</a></li>
			</ul>
		</div>
		<!--网站头部 结束 /-->
		<!--/ Banner 开始-->
		<div id="banner">
			<img src="resources/images/banner.jpg">
		</div>
		<!--Banner 结束 /-->
		<div id="main">
			<jsp:include page="index.jsp"></jsp:include>
		</div>
	</div>
	<div id="footer">
		<div class="end_menu">
			<div class="endMenu_Bor">
				<p>
				</p>
			</div>
		</div>
		<div class="copyright">
			<table>
				<tr>
					<td align="right">公司：</td><td>${enterprise.name }</td><td>地址：</td><td>${enterprise.area }</td><td align="right">邮编：</td><td> ${enterprise.code }</td>
				</tr>
				<tr>
					<td align="right">咨询电话：</td><td>${enterprise.contact }</td><td>邮箱：</td><td> ${enterprise.email }</td><td align="right">技术支持：</td><td><a href="<%=request.getContextPath()%>/">会展综合交流平台</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>