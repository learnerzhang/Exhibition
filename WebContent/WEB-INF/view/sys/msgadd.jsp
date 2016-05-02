<%@page import="com.es.model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>头部-有点</title>
<link rel="stylesheet" type="text/css" href="../css/css.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../../resources/js/jquery.json-2.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/ajaxfileupload.js"></script>

<script type="text/javascript">

$(function(){
	var id="${msg.id}";
	$(".btn_yes").click(function(){
		
		var flag = true;
		$("#title").css("border","1px solid #ccc");
		$("#context").css("border","1px solid #ccc");
		
		if($("#title").val().trim()==""){
			$("#title").css("border","1px solid red");flag=false;
		}
		if($("#context").val().trim()==""){
			$("#context").css("border","1px solid red");flag=false;
		}
		if(!flag) return;
		var paratmeter = {
				"ifrom" :'${admin.username}',
				"title" : $("#title").val(),
				"context" : $("#context").val(),
				"type":"2"
		};
		//alert(JSON.stringify(paratmeter));
		$.ajax({
			contentType: "application/json;charset=utf-8",
			url : "<%=request.getContextPath()%>/sys/index/addMsg?id="+id,
			type : "post",
			data : JSON.stringify(paratmeter),
			dataType : "json",
			success : function(data) {
				if (data.hasOwnProperty("code")) {
					if (data.code == "0") {
						window.location.href = "<%=request.getContextPath() %>/sys/index/msg?page=1";//当前广告页面...
					} else if (data.code == "1") {
						alert("网络异常请稍后再试....");
					} 
				}
			}
		});	
	});
});
</script>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="../img/coin02.png" /><span>
				<a href="#">首页</a>&nbsp;-&nbsp;<a href="#">公共管理</a>&nbsp;-</span>&nbsp;通知管理
			</div>
		</div>
		<div class="page ">
			<!-- 上传广告页面样式 -->
			<div class="banneradd bor">
				<div class="baTop">
					<span>发布通知</span>
				</div>
				<div class="baBody">
					<div class="bbD">
						通知标题：<input type="text" name="title" id="title" class="input1" value="${msg.title }"/>
					</div>
					<div class="bbD">
						通知内容：<textarea id="context" name="context" rows="50" cols="20" class="input1" style="height: 300px;">${msg.context }</textarea>
					</div>
					<div class="bbD">
						<p class="bbDP">
							<button class="btn_ok btn_yes" href="#">发布</button>
							<a class="btn_ok btn_no" href="<%=request.getContextPath() %>/sys/index/msg?page=1">取消</a>
						</p>
					</div>
				</div>
			</div>
			<!-- 上传广告页面样式end -->
		</div>
	</div>
</body>
</html>