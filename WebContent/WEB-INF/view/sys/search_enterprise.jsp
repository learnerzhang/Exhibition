<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行家-有点</title>
<link rel="stylesheet" type="text/css" href="../css/css.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="js/page.js" ></script> -->
<style type="text/css">
	#pageGro{ width:400px; height:25px; margin:0px auto; padding-top:30px;}
	#pageGro div,#pageGro div ul li{ font-size:12px; color:#999; line-height:23px; float:left; margin-left:5px;}
	#pageGro div ul li{ width:22px; text-align:center; border:1px solid #999; cursor:pointer;}
	#pageGro div ul li.on{ color:#fff; background:#3c90d9; border:1px solid #3c90d9;}
	#pageGro .pageUp,#pageGro .pageDown{ width:63px; border:1px solid #999; cursor:pointer;text-align: center;}
</style>
<script type="text/javascript">

	function changeStatus(id){
		$.ajax({
			contentType: "application/json;charset=utf-8",
			url : "<%=request.getContextPath()%>/sys/index/changeEnterpriseStatus?id="+id,
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

  	$(function(){
  		var id ="";
  		$(".delban").click(function(){
  			id = $(this).attr("id");
  			$(".banDel").show();
  		});
  		$(".close").click(function(){
  			$(".banDel").hide();
  		});
  		$(".no").click(function(){
  			$(".banDel").hide();
  		});
		$("#button").click(function(){
			 var context = $("#search").val();
			 window.location.href="<%=request.getContextPath()%>/sys/index/search_enterprise?context="+encodeURI(encodeURI(context));
		});
		$(".yes").click(function(){
			  $(".banDel").hide();
			  $.ajax({
					contentType: "application/json;charset=utf-8",
					url : "<%=request.getContextPath()%>/sys/index/delEnterprise?id="+id,
					type : "post",
					dataType : "json",
					success : function(data) {
						if (data.hasOwnProperty("code")) {
							if (data.code == "0") {
								window.location.href = "<%=request.getContextPath() %>/sys/index/enterprise?page=1";//当前页面...
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
					href="#">展商管理</a>&nbsp;-</span>&nbsp;展商管理
			</div>
		</div>

		<div class="page">
			<!-- banner页面样式 -->
			<div class="connoisseur">
				<div class="conform">
					<form>
						<div class="cfD">
							<div style="float: left;padding-top: 10px;"><input id="search" class="addUser" type="text" placeholder="公司名/城市" /></div>
							<div id="button" align="center" style="padding-top:4px;margin-top:8px;float:left;margin-left: 10px;width: 135px;height: 30px;border: none;font-size: 16px;color: #fff;background-color: #47a4e1;">搜索</div>
							<a class="addA addA1" style="background-color:#fff" href="#"></a> 
						</div>
					</form>
				</div>
				<!-- banner 表格 显示 -->
				<div class="conShow">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="66px" class="tdColor tdC">序号</td>
							<td width="170px" class="tdColor">公司名称</td>
							<td width="135px" class="tdColor">用户名</td>
							<td width="135px" class="tdColor">代理人</td>
							<td width="145px" class="tdColor">手机号码</td>
							<td width="140px" class="tdColor">所在城市</td>
							<td width="80px" class="tdColor">审核状态</td>
							<td width="130px" class="tdColor">操作</td>
						</tr>
						<c:forEach items="${enterprises }" var="enterprise" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td>
									${enterprise.name }
								</td>
								<td>${enterprise.username }</td>
								<td>${enterprise.agent }</td>
								<td>${enterprise.contact }</td>
								<td>${enterprise.area }</td>
								<td>
									<c:choose>
										<c:when test="${enterprise.status=='yes' }">
											<input id="button${enterprise.id }" onclick="changeStatus(${enterprise.id })" style="background-color:#C5E211;width:80px;color: #fff" type="button" value="${enterprise.status }"/>
										</c:when>
										<c:otherwise>
											<input id="button${enterprise.id }" onclick="changeStatus(${enterprise.id })" style="background-color:rgba(165, 168, 60, 0.74);width:80px;color: #fff" type="button" value="${enterprise.status }"/>
										</c:otherwise>
									</c:choose>
								</td>
								<td><a href="<%=request.getContextPath()%>/sys/index/toUpdateEnterprise?id=${enterprise.id}&page=1"><img class="operation" src="../img/update.png"></a> <img id="${enterprise.id }" class="operation delban" src="../img/delete.png"></td>
							</tr>		
						</c:forEach>
					</table>
					<div class="paging">
					</div>
				</div>
				<!-- banner 表格 显示 end-->
			</div>
			<!-- banner页面样式end -->
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
</html>