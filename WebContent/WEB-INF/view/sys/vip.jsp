<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>会员管理-有点</title>
<link rel="stylesheet" type="text/css" href="../css/css.css" />
<link rel="stylesheet" type="text/css" href="../css/manhuaDate.1.0.css"/>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/manhuaDate.1.0.js"></script>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<!-- <script type="text/javascript" src="js/page.js" ></script> -->
<style type="text/css">
	#pageGro{ width:400px; height:25px; margin:0px auto; padding-top:30px;}
	#pageGro div,#pageGro div ul li{ font-size:12px; color:#999; line-height:23px; float:left; margin-left:5px;}
	#pageGro div ul li{ width:22px; text-align:center; border:1px solid #999; cursor:pointer;}
	#pageGro div ul li.on{ color:#fff; background:#3c90d9; border:1px solid #3c90d9;}
	#pageGro .pageUp,#pageGro .pageDown{ width:63px; border:1px solid #999; cursor:pointer;text-align: center;}
</style>
<script type="text/javascript">

function initSelect(){
	$("#pageList option").remove();
	var option="";
	for (var i = 0; i <"${page.totalPage }"; i++) {
		if ((i+1)=="${page.currentPage }") {
			option+="<option selected='selected'>"+(i+1)+"</option>";
		}else {
			option+="<option>"+(i+1)+"</option>";
		}
	}
	$("#pageList").append(option);
}

function changeStatus(id){
	$.ajax({
		contentType: "application/json;charset=utf-8",
		url : "<%=request.getContextPath()%>/sys/index/changeVipStatus?id="+id,
		type : "post",
		dataType : "json",
		success : function(data) {
			if (data.hasOwnProperty("code")) {
				if (data.code == "0") {
					if (data.status=="yes") {
						$("#button"+id).val("yes").css("background-color","#C5E211")
					}else{
						$("#button"+id).val("no").css("background-color","rgba(165, 168, 60, 0.74)")
					}
				} else if (data.code == "1") {
					alert("网络异常....");
				} 
			}
		}
	});	
}
$(function (){
	
	  var id = 0;
	  var page = "${page.currentPage }";
	  initSelect();
	  $("#pageList").change(function(){
			var page = $("#pageList option:selected").val();
			self.location="<%=request.getContextPath()%>/sys/index/vip?page="+page;
		});
	  
	  $("#prev").click(function(){
			var flag = "${page.hasPrePage }";
			var page = "${page.currentPage-1 }";
			if (flag=="true") {
				self.location="<%=request.getContextPath()%>/sys/index/vip?page="+page;
			}
		});
		$("#next").click(function(){
			var flag = "${page.hasNextPage }";
			var page = "${page.currentPage+1 }";
			if (flag=="true") {
				self.location="<%=request.getContextPath()%>/sys/index/vip?page="+page;
			}
		});
		
	  $("input.mh_date").manhuaDate({
	    Event : "click",//可选               
	    Left : 0,//弹出时间停靠的左边位置
	    Top : -16,//弹出时间停靠的顶部边位置
	    fuhao : "-",//日期连接符默认为-
	    isTime : false,//是否开启时间值默认为false
	    beginY : 1949,//年份的开始默认为1949
	    endY :2100//年份的结束默认为2049
	  });
	  
	  $("#button").click(function(){
		 var context = $("#search").val();
		 window.location.href="<%=request.getContextPath()%>/sys/index/search_vip?context="+encodeURI(encodeURI(context));
		 return false;
	  });
	  
	  $(".delban").click(function(){
		  id = $(this).attr("id");
	 	  $(".banDel").show();
	 	  return false;
	  });
	  $(".close").click(function(){
		  $(".banDel").hide();
	  });
	  $(".no").click(function(){
	 	 $(".banDel").hide();
	  });
	  $(".yes").click(function(){
		 $(".banDel").hide();
		 
		 $.ajax({
				contentType: "application/json;charset=utf-8",
				url : "<%=request.getContextPath()%>/sys/index/delVip?id="+id,
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.hasOwnProperty("code")) {
						if (data.code == "0") {
							window.location.href = "<%=request.getContextPath() %>/sys/index/vip?page=1";//当前页面...
						} else if (data.code == "1") {
							alert("网络异常....");
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
				<img src="../img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">会员管理</a>&nbsp;-</span>&nbsp;会员管理
			</div>
		</div>
		<div class="page">
			<!-- vip页面样式 -->
			<div class="vip">
				<div class="conform">
					<form>
						<!-- <div class="cfD">
							时间段：<input class="vinput mh_date" type="text" readonly="true" />&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
							<input class="vinput mh_date" type="text" readonly="true" />
						</div> -->
						<div class="cfD">
							<div style="float: left;padding-top: 10px;"><input id="search" class="addUser" type="text" placeholder="输入用户名/手机号/城市" /></div>
							<div id="button" align="center" style="padding-top:4px;margin-top:8px;float:left;margin-left: 10px;width: 135px;height: 30px;border: none;font-size: 16px;color: #fff;background-color: #47a4e1;">搜索</div>
							<a class="addA addA1" href="<%=request.getContextPath() %>/sys/index/vipadd?page=${page.currentPage }">新增会员+</a> 
							<!-- <a class="addA addA1 addA2" href="vipadd.html">密码重置</a> -->
						</div>
					</form>
				</div>
				<!-- vip 表格 显示 -->
				<div class="conShow">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="66px" class="tdColor tdC">序号</td>
							<td width="160px" class="tdColor">用户名</td>
							<td width="88px" class="tdColor">姓名</td>
							<td width="66px" class="tdColor">类型</td>
							<td width="235px" class="tdColor">邮箱</td>
							<td width="155px" class="tdColor">手机号码</td>
							<td width="220px" class="tdColor">所在城市</td>
							<td width="180px" class="tdColor">状态</td>
							<td width="282px" class="tdColor">注册时间</td>
							<td width="130px" class="tdColor">操作</td>
						</tr>
						<c:forEach items="${users }" var="user" varStatus="status">
							<tr>
									<td>${page.beginIndex + status.index+1 }</td>
									<td>
										${user.username }
									</td>
									<td>${user.contact }</td>
									<td>${user.type }</td>
									<td>${user.email }</td>
									<td>${user.mobile_number }</td>
									<td>${user.area }</td>
									<td>
										<c:choose>
											<c:when test="${user.status=='yes' }">
												<input id="button${user.id }" onclick="changeStatus(${user.id })" style="background-color:#C5E211;width:80px;color: #fff" type="button" value="${user.status }"/>
											</c:when>
											<c:otherwise>
												<input id="button${user.id }" onclick="changeStatus(${user.id })" style="background-color:rgba(165, 168, 60, 0.74);width:80px;color: #fff" type="button" value="${user.status }"/>
											</c:otherwise>
										</c:choose>
									</td>
									<td>${fn:split(user.c_time,".")[0] }</td>
									<td><a href="connoisseuradd.html">
									<!-- <img class="operation" src="../img/update.png"></a> -->
									<img id="${user.id }" class="operation delban" src="../img/delete.png"></td>
								</tr>
						</c:forEach>
					</table>
					<div class="paging">
						<div id="pageGro" class="cb">
							<div class="pageList">
						        	<font color="black" size="12px;">[共有${page.totalCount }条记录 页:${page.currentPage }/${page.totalPage }]</font>
						    </div>
							<div class="pageUp" id="prev">上一页</div>
						    <div class="pageDown" id="next">下一页</div>
						    <div class="pageList">
						        	<font color="black" size="12px;">跳到 &nbsp;<select id="pageList"><option>1</option></select> &nbsp; 页</font>
						    </div>
						</div>
					</div>
				</div>
				<!-- vip 表格 显示 end-->
			</div>
			<!-- vip页面样式end -->
		</div>

	</div>


	<!-- 删除弹出框 -->
	<div class="banDel">
		<div class="delete">
			<div class="close">
				<a><img src="../img/shanchu.png" /></a>
			</div>
			<p class="delP1">你确定要删除此条记录吗？</p>
			<p class="delP2">
				<a href="#" class="ok yes">确定</a><a class="ok no">取消</a>
			</p>
		</div>
	</div>
	<!-- 删除弹出框  end-->
</body>
</script>
</html>