<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员登录 - 会展交流平台</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery.json-2.4.js"></script>
<script type="text/javascript" src="resources/js/jquery.i18n.properties-1.0.9.js"></script>
<script type="text/javascript" src="resources/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="resources/js/md5.js"></script>
<script type="text/javascript" src="resources/js/page_login.js"></script>
<link href="resources/style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	window.onload = function() {
		var outer_width = document.body.clientWidth; //获取body宽度
		var outer_height = document.documentElement.clientHeight; //获取页面可见高度
		//alert(map_width);
		//alert(map_height);
		document.getElementById("outer").style.height = outer_width + "px";
	}
	function reloadVcode() {
		var img = $("#vcode_image");
		var src = img.attr("src");

		var timestamp = (new Date()).valueOf();
		//时间戳   
		//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳   
		if (src.indexOf("?") != -1) {
			src = src.substring(0, src.indexOf("?timestamp"));
		}
		src = src + "?timestamp=" + timestamp;
		img.attr("src", src);
	}
</script>
<style type="text/css">
body {
	overflow: hidden;
}

.outer {
	
}

#header {
	margin: 2% auto;
	width: 996px;
	min-width: 700px;
	height: 90px;
	position: relative;
}

#logo {
	width: 197px;
	height: 63px;
	float: left;
	
}

#online {
	width: 220px;
	height: 28px;
	float: right;
	background:
		url("<%=request.getContextPath()%>/resources/images/online.png");
}

#content {
	margin: 2% auto;
	width: 996px;
	height: 400px;
	position: relative;
	top: -20px;
	background:
		url("<%=request.getContextPath()%>/resources/images/login_bg.png")
		right top no-repeat;
}

#login_form {
	width: 280px;
	height: 380px;
	padding: 20px 20px 20px 20px;
	border: 1px solid #ccc;
	background: #FFF;
	overflow: hidden;
	float: left;
	padding: 20px 20px 20px 20px;
}

.login_title {
	font-size: 14px;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
	padding-top: 8px;
	padding-left: 28px;
	margin-bottom: 15px;
	background:
		url("<%=request.getContextPath()%>/resources/images/hydl.png") left
		center no-repeat;
}

.login_list .noPic .vnoPic {
	width: 200px;
	position: absolute;
	left: 10px;
	top: 13px;
	height: 34px;
	line-height: 34px;
}

.login_list {
	padding: 8px;
	margin: 8px auto;
	height: 35px;
	line-height: 20px;
	position: relative;
	height: 35px;
}

.input-text-user .input-text-user.error {
	background:
		url("<%=request.getContextPath()%>/resources/images/img.png")
		no-repeat 0px top;
	border-width: 3px;
}

.input-text-user {
	background:
		url("<%=request.getContextPath()%>/resources/images/img.png")
		no-repeat 0px top;
}

.input-text-password .input-text-password.error {
	background:
		url("<%=request.getContextPath()%>/resources/images/img.png")
		no-repeat 0px -50px;
	border-width: 3px;
}

.input-text-vcode {
	border: #D8D8D8 1px solid;
	border-radius: 3px;
	padding-left: 40px;
	height: 32px;
	line-height: 32px;
}

label.error {
	position: absolute;
	left: auto;
	right: 70px;
	bottom: 12px;
}

label.v_error {
	position: absolute;
	left: auto;
	right: 70px;
	bottom: 12px;
}

input.error {
	color: #666;
	font-size: 12px;
	border: 1px solid #c00;
}

.noPic {
	background-image: none;
	width: 200px;
	padding: 0px 8px;
}

.vnoPic {
	background-image: none;
	padding: 0px 8px;
	width: 60px;
}

.field {
	position: absolute;
	left: 19px;
	top: 9px;
	height: 35px;
	line-height: 35px;
}

.login_btn_box {
	font-size: 14px;
	margin-bottom: 15px;
	margin-left: 50px;
	margin-top: 7px;
}

.btn {
	border: none;
	background: #206bc5;
	color: #FFFFFF;
	cursor: pointer;
	font-weight: bold;
	height: 30px;
	width: 100px;
	padding-bottom: 1px;
	border-radius: 3px;
}

.login_zhuce {
	padding-top: 20px;
	font-size: 14px;
	padding-bottom: 10px;
	margin-top: 20px;
	border-top: 1px solid #ddd;
	position: relative;
	color: #999;
}

.login_email {
	display: block;
	position: absolute;
	margin-top: -28px;
	color: #666;
	width: 119px;
	height: 23px;
	background:
		url("<%=request.getContextPath()%>/resources/images/email.png");
	font-size: 12px;
	text-align: center;
	right: 24px;
	line-height: 22px;
	font-style: normal;
}

#footer {
	margin: 0px auto;
	border-top: solid 2px #0868b0;
}
</style>
</head>
<!-- background:url("<%=request.getContextPath()%>/resources/images/logo.png"); -->
<body bgcolor="#D6E4FF">
	<div id="outer">
		<div id="header">
			<div id="logo">
				<a href="<%=request.getContextPath()%>/"><img height="63" width="197" src="resources/images/logo1.png"></a>
			</div>
			<div id="online"></div>
		</div>
		<div id="content">
			<div id="login_form">
				<form id="loginForm">
					<div class="login_title">
						<strong>会员登录</strong>
					</div>
					<div class="login_list">
						<label class="field" for="username">用户名</label> <input type="text"
							value="" class="input-text-user noPic input-click"
							name="username" id="username">
					</div>
					<div class="login_list">
						<label class="field" for="password">密&nbsp;&nbsp;&nbsp;码</label> <input
							type="password" value=""
							class="input-text-password noPic input-click" name="password"
							id="password">
					</div>
					<div class="login_list">
						<label class="field" for="vcode">验证码</label> <input id="vcode" type="text"
							value="" class="input-text-vcode vnoPic input-click" name="vcode">&nbsp;&nbsp;<img id="vcode_image" alt=""
							src="<%=request.getContextPath()%>/vcode"
							style="margin-bottom: -8px;" onclick="reloadVcode()">&nbsp;看不清,<a
							id="changeVcode" href="javascript:void(0);"
							style="cursor: pointer; color: #0053aa; text-decoration: none;"
							onclick="javascript:reloadVcode();">换一张</a>
					</div>
					<em id="emTip"
						style="display: none; padding-left: 40px; padding-bottom: 10px;">
					</em>
					<div class="login_list login_btn_box">
						<input id="login_btn" type="button" value="登 录" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>忘记密码?</a>
					</div>

					<div class="login_zhuce">
						还不是会员?&nbsp;<a
							href="<%=request.getContextPath()%>/user?method=register"
							style="color: #4d4d4d; cursor: pointer; text-decoration: none">免费注册</a>
						<em class="login_email">&nbsp;&nbsp;推荐使用邮箱注册</em>
					</div>
				</form>
			</div>
		</div>

		<div id="footer">
			<div class="dblock">
				<div class="inline-block" align="center">
					<img src="resources/images/logo.png" width="229">
				</div>
				<div class="inline-block copyright">
					<p>
						<a href="#">关于我们</a> | <a href="#">微博</a> | <a href="#">隐私政策</a> |
						<a href="#">人员招聘</a>
					</p>
					<p>Copyright © 2015 会展交流中心</p>
				</div>
			</div>
		</div>
		<div class="loading">
		<div class="mask">
			<div class="loading-img">
				<img src="resources/images/loading.gif" width="31" height="31">
			</div>
		</div>
	</div>
	</div>
</body>
</html>