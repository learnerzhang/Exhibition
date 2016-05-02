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

var path = "${adImage.path}";
function upload(){
	var formData = new FormData($("#imageForm")[0]);
	$.ajax({
		  url:"<%=request.getContextPath()%>/upload",
		  type: 'POST',  
	      data: formData,  
	      async: false,  
	      cache: false,  
	      contentType: false,  
	      processData: false,
	      success: function (ret) {
	    	  if (ret.hasOwnProperty("src")) {
	    		path = ret.src;
				var src = "<%=request.getContextPath()%>/resources/upload/"+ret.src;
				$("#imageDiv").empty().html("<img id='image' src='"+src+"' width='160px' height='150px'/>");
	    	  }  
	      },  
	      error: function (returndata) {  
	          alert("添加失败,请稍后再试!");  
	      }  
	});
	
}
$(function(){
	$("#del").click(function(){
		$("#imageDiv").empty().html("+");
		$("#file").val("");
	});
	$(".btn_yes").click(function(){
		
		var flag = true;
		$("#name").css("border-color","#ccc");
		$("#href").css("border-color","#ccc");
		$("#imageDiv").css("background-color","#c6c6c6");
		$("#sort").css("border-color","#ccc");
		
		if($("#name").val().trim()==""){
			$("#name").css("border-color","#DD0EC3");flag=false;
		}
		
		if($("#href").val().trim()==""){
			$("#href").css("border-color","#DD0EC3");flag=false;
		}
		
		if (path=="") {
			$("#imageDiv").css("background-color","rgba(237, 218, 25, 1)");flag=false;
		}
		if ($("#sort").val().trim()=="") {
			$("#sort").css("border-color","#DD0EC3");flag=false;
		}
		if(!flag) return;
		var paratmeter = {
				"name" : $("#name").val(),
				"href" : $("#href").val(),
				"path" : path,
				"status" : $("input[name='status']:checked").val(),
				"sort" : $("#sort").val()
		};
		var id="${adImage.id}";
		$.ajax({
			contentType: "application/json;charset=utf-8",
			url : "<%=request.getContextPath()%>/sys/index/addAdImage?id="+id,
			type : "post",
			data : JSON.stringify(paratmeter),
			dataType : "json",
			success : function(data) {
				if (data.hasOwnProperty("code")) {
					if (data.code == "0") {
						window.location.href = "<%=request.getContextPath() %>/sys/index/banner?page=1";//当前广告页面...
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
				<a href="#">首页</a>&nbsp;-&nbsp;<a href="#">公共管理</a>&nbsp;-</span>&nbsp;广告管理
			</div>
		</div>
		<div class="page ">
			<!-- 上传广告页面样式 -->
			<div class="banneradd bor">
				<div class="baTop">
					<span>上传广告</span>
				</div>
				<div class="baBody">
					<div class="bbD">
						链接名称：<input type="text" name="name" id="name" class="input1" value="${adImage.name }"/>
					</div>
					<div class="bbD">
						链接地址：<input type="text" name="href" id="href" class="input1" value="${adImage.href }"/>
					</div>
					<div class="bbD">
						上传图片：
						<div class="bbDd">
							<c:choose>
								<c:when test="${!empty adImage }">
									<div class="bbDImg" id="imageDiv">
										<img id="image" src="<%=request.getContextPath()%>/resources/upload/${adImage.path}" width="160px" height="150px"/>
									</div>
								</c:when>
								<c:otherwise>
									<div class="bbDImg" id="imageDiv">+</div>
								</c:otherwise>
							</c:choose>
							<form action="<%=request.getContextPath()%>/upload" id="imageForm" enctype="multipart/form-data"><input onchange="upload()" name="file" type="file" id="file" class="file"/><a id="del" class="bbDDel" href="#">删除</a></form> 
						</div>
					</div>
					<div class="bbD">
						是否显示：<label><input name="status" type="radio" checked="checked" value="yes"/>是</label> <label><input
							type="radio" name="status" value="no"/>否</label>
					</div>
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排序：<input id="sort" name="sort" class="input2" type="text" value="${adImage.sort }"/>
					</div>
					<div class="bbD">
						<p class="bbDP">
							<button class="btn_ok btn_yes" href="#">提交</button>
							<a class="btn_ok btn_no" href="<%=request.getContextPath() %>/sys/index/banner?page=1">取消</a>
						</p>
					</div>
				</div>
			</div>
			<!-- 上传广告页面样式end -->
		</div>
	</div>
</body>
</html>