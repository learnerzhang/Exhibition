<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>资讯管理</title>
<link rel="stylesheet" type="text/css" href="../css/css.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="js/page.js" ></script> -->
<script type="text/javascript">
	function changeStatus(id){
		$.ajax({
			contentType: "application/json;charset=utf-8",
			url : "<%=request.getContextPath()%>/sys/index/changeReviewStatus?id="+id,
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
		  var id = "";
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
			 $(".yes").click(function(){
				 $(".banDel").hide();
				 
				 $.ajax({
						contentType: "application/json;charset=utf-8",
						url : "<%=request.getContextPath()%>/sys/index/delReview?id="+id,
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.hasOwnProperty("code")) {
								if (data.code == "0") {
									window.location.href = "<%=request.getContextPath() %>/sys/index/review?page=1";//当前页面...
								} else if (data.code == "1") {
									alert("网络异常....");
								} 
							}
						}
					});	
			  });
		  $("#button").click(function(){
			 var context = $("#search").val();
			 window.location.href="<%=request.getContextPath()%>/sys/index/search_review?context="+encodeURI(encodeURI(context));
			 return false;
		  });
		});
</script>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="../img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">咨询管理</a>&nbsp;-</span>&nbsp;咨询管理
			</div>
		</div>

		<div class="page">
			<!-- topic页面样式 -->
			<div class="topic">
				<div class="conform">
					<form>
						<!-- <div class="cfD">
							审核状态：<label><input type="radio" checked="checked"
								name="styleshoice1" />&nbsp;未审核</label> <label><input
								type="radio" name="styleshoice1" />&nbsp;已通过</label> <label class="lar"><input
								type="radio" name="styleshoice1" />&nbsp;不通过</label>
						</div> -->
						<div class="cfD">
							<div style="float: left;padding-top: 10px;"><input id="search" class="addUser" type="text" placeholder="类型/标题内容" /></div>
							<div id="button" align="center" style="padding-top:4px;margin-top:8px;float:left;margin-left: 10px;width: 135px;height: 30px;border: none;font-size: 16px;color: #fff;background-color: #47a4e1;">搜索</div>
							<a class="addA addA1" style="background-color:#fff" href="#"></a> 
						</div>
					</form>
				</div>
				<!-- topic表格 显示 -->
				<div class="conShow">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="66px" class="tdColor tdC">序号</td>
							<td width="100px" class="tdColor">类型</td>
							<td width="325px" class="tdColor">标题</td>
							<td width="120px" class="tdColor">显示时间</td>
							<td width="120px" class="tdColor">截止时间</td>
							<td width="70px" class="tdColor">审核状态</td>
							<td width="130px" class="tdColor">操作</td>
						</tr>
						<c:forEach items="${reviews }" var="review" varStatus="status">
							<tr>
								<td>${1+status.index }</td>
								<td>
									${review.type }
								</td>
								<td>${review.title }</td>
								<td>${fn:split(review.creattime," ")[0] }</td>
								<td>${fn:split(review.deadline," ")[0] }</td>
								<td>
									<c:choose>
										<c:when test="${review.status=='yes' }">
											<input id="button${review.id }" onclick="changeStatus(${review.id })" style="background-color:#C5E211;width:80px;color: #fff" type="button" value="${review.status }"/>
										</c:when>
										<c:otherwise>
											<input id="button${review.id }" onclick="changeStatus(${review.id })" style="background-color:rgba(165, 168, 60, 0.74);width:80px;color: #fff" type="button" value="${review.status }"/>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<a href="<%=request.getContextPath()%>/sys/index/readReview?id=${review.id }&page=${page}"> 
										<img class="operation" src="../img/update.png">
									</a>
									<img id="${review.id }" class="operation delban" src="../img/delete.png">
								</td>
							</tr>
						</c:forEach>
					</table>
					<div class="paging">
					</div>
				</div>
				<!-- topic 表格 显示 end-->
			</div>
			<!-- topic页面样式end -->
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