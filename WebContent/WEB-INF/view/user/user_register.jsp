<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>会员注册 - 会展交流平台</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="keywords" content="注册页面,注册页面表单验证">
<meta name="description" content="会员注册">
<link rel="shortcut icon" href="resources/images/favicon.ico" />
<link href="resources/style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery.i18n.properties-1.0.9.js"></script>
<script type="text/javascript" src="resources/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="resources/js/jquery.json-2.4.js"></script>
<script type="text/javascript" src="resources/js/md5.js"></script>
<script type="text/javascript" src="resources/js/page_regist.js?lang=zh"></script>
<style type="text/css">
.input-text-user {
	border: #D8D8D8 1px solid;
	border-radius: 3px;
	width: 290px;
	padding-left: 40px;
	height: 32px;
	line-height: 32px;
	background: white url("<%=request.getContextPath()%>/images/img.png")
		no-repeat 0px top;
}

.input-text-password {
	border: #D8D8D8 1px solid;
	border-radius: 3px;
	width: 290px;
	padding-left: 40px;
	height: 32px;
	line-height: 32px;
	background: white url("<%=request.getContextPath()%>/images/img.png")
		no-repeat 0px -50px;
}

.input-text-user.error {
	background: #FFD2D2 url("<%=request.getContextPath()%>/images/img.png")
		no-repeat 0px top;
	border-width: 3px;
}

.input-text-password.error {
	background: #FFD2D2 url("<%=request.getContextPath()%>/images/img.png")
		no-repeat 0px -50px;
	border-width: 3px;
}
</style>
<!--[if IE]>
  <script src="resources/js/html5.js"></script>
<![endif]-->
<!--[if lte IE 6]>
	<script src="resources/js/DD_belatedPNG_0.0.8a-min.js" language="javascript"></script>
	<script>
	  DD_belatedPNG.fix('div,li,a,h3,span,img,.png_bg,ul,input,dd,dt');
	</script>
<![endif]-->
</head>
<body class="loginbody">
	<div class="dataEye">
		<div class="loginbox registbox">
			<div class="logo-a" style="margin:0px;height: 91px;">
				<a href="<%=request.getContextPath()%>/" title="会展交流平台"> <img src="resources/images/logo.png" width="398"> </a>
			</div>
			<div class="login-content reg-content">
				<div class="login"></div>
				<form id="signupForm">
					<div class="loginbox-title">
						<h3>注册类型</h3>
					</div>
					<div class="row">
						<div style="display: inline">
							<label>用户类型</label>
						</div>
						<div style="display: inline; margin: 10px"></div>
						<div style="display: inline">
							<input type="radio" name="type" value="0" checked="checked" />参展商&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
								type="radio" name="type" value="1" />展馆方
						</div>
					</div>
					<div class="loginbox-title">
						<h3>账号信息</h3>
					</div>
					<div class="row">
						<label class="field" for="username">用户名</label> <input type="text"
							value="" class="input-text-user noPic input-click"
							name="username" id="username">
					</div>
					<div class="row">
						<label class="field" for="email">常用邮箱</label> <input type="text"
							value="" class="input-text-user noPic input-click" name="email"
							id="email">
					</div>
					<div class="row">
						<label class="field" for="password">密码</label> <input
							type="password" value=""
							class="input-text-password noPic input-click" name="password"
							id="password">
					</div>
					<div class="row">
						<label class="field" for="passwordAgain">确认密码</label> <input
							type="password" value=""
							class="input-text-password noPic input-click"
							name="passwordAgain" id="passwordAgain">
					</div>
					<div class="loginbox-title">
						<h3>用户信息</h3>
					</div>
					<div class="row">
						<label class="field" for="company">公司名称</label> <input type="text"
							value="" class="input-text-user noPic input-click" name="company"
							id="company">
					</div>
					<div class="row">
						<label class="field" for="contact">联系人</label> <input type="text"
							value="" class="input-text-user noPic input-click" name="contact"
							id="contact">
					</div>
					<div class="row">
						<label class="field" for="area">地区</label> <input type="text"
							value="" class="input-text-user noPic input-click" name="area"
							id="area">
					</div>
					<div class="row">
						<label class="field" for="tel">移动电话</label> <input type="text"
							value="" class="input-text-user noPic input-click" name="tel"
							id="tel">
					</div>
					<div class="row">
						<label class="field" for="address">联系地址</label> <input type="text"
							value="" class="input-text-user noPic input-click" name="address"
							id="address">
					</div>
					<div class="row">
						<label class="field" for="code">邮政编码</label> <input type="text"
							value="" class="input-text-user noPic input-click" name="code"
							id="code">
					</div>
					<div class="row tips">
						<input type="checkbox" id="checkBox"> <label>
							我已阅读并同意 <a href="#" target="_blank">隐私政策、服务条款</a>
						</label>
					</div>
					<div class="row btnArea">
						<a class="login-btn" id="submit">注册</a>
					</div>
				</form>
			</div>
			<div class="go-regist">
				已有帐号,请<a href="<%=request.getContextPath()%>/user?method=login"
					class="link">登录</a>
			</div>
		</div>
		<div id="footer">
			<div class="dblock">
				<div class="inline-block">
					<img src="resources/images/logo.png" height="30" width="129">
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
	</div>
	<div class="loading">
		<div class="mask">
			<div class="loading-img">
				<img src="resources/images/loading.gif" width="31" height="31">
			</div>
		</div>
	</div>
</body>
</html>