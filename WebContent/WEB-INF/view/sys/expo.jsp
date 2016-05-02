<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>展会管理</title>
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
// 广告弹出框
	function changeStatus(id){
		$.ajax({
			contentType: "application/json;charset=utf-8",
			url : "<%=request.getContextPath()%>/sys/index/changeExpoStatus?id="+id,
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
	
	$(function(){
		  var page = "${page.currentPage }";
		  initSelect();
		  $("#pageList").change(function(){
				var page = $("#pageList option:selected").val();
				self.location="<%=request.getContextPath()%>/sys/index/expo?page="+page;
			});
		  
		  $("#prev").click(function(){
				var flag = "${page.hasPrePage }";
				var page = "${page.currentPage-1 }";
				if (flag=="true") {
					self.location="<%=request.getContextPath()%>/sys/index/expo?page="+page;
				}
			});
			$("#next").click(function(){
				var flag = "${page.hasNextPage }";
				var page = "${page.currentPage+1 }";
				if (flag=="true") {
					self.location="<%=request.getContextPath()%>/sys/index/expo?page="+page;
				}
			});	
			
			$(".delban").click(function(){
				$(".banDel").show();
			});
			$(".close").click(function(){
				$(".banDel").hide();
			});
			$(".no").click(function(){
				$(".banDel").hide();
			});
		});
// 广告弹出框 end
</script>
</head>

<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="../img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">展会管理</a>&nbsp;-</span>&nbsp;展会管理
			</div>
		</div>

		<div class="page">
			<!-- wish页面样式 -->
			<div class="wish">
				<!-- <div class="conform">
					<form>
						<div class="cfD">
							时间：<input class="vinput" type="text" />&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
							<input class="vinput" type="text" />
							<input class="addUser" type="text" placeholder="请输入您的心愿" />
							<button class="button">搜索</button>
						</div>
					</form>
				</div> -->
				<!-- wish 表格 显示 -->
				<div class="wishShow">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="66px" class="tdColor tdC">序号</td>
							<td width="290px" class="tdColor">展会名称</td>
							<td width="260px" class="tdColor">类型</td>
							<td width="160px" class="tdColor">开始时间</td>
							<td width="160px" class="tdColor">结束时间</td>
							<td width="195px" class="tdColor">展馆</td>
							<td width="275px" class="tdColor">举办单位</td>
							<td width="175px" class="tdColor">地区</td>
							<td width="115px" class="tdColor">操作人</td>
							<td width="130px" class="tdColor">操作</td>
						</tr>
						<c:forEach items="${expos }" var="expo" varStatus="status">
							<tr>
								<td>${status.index+1+page.beginIndex }</td>
								<td>${expo.name }</td>
								<td>${expo.industry }</td>
								<td>${fn:split(expo.startline," ")[0] }</td>
								<td>${fn:split(expo.deadline," ")[0] }</td>
								<td>${expo.venue }</td>
								<td>${expo.organizer }</td>
								<td>${expo.area }</td>
								<td>${expo.username }</td>
								<td>
									<c:choose>
										<c:when test="${expo.status=='yes' }">
											<input id="button${expo.id }" onclick="changeStatus(${expo.id })" style="background-color:#C5E211;width:80px;color: #fff" type="button" value="${expo.status }"/>
										</c:when>
										<c:otherwise>
											<input id="button${expo.id }" onclick="changeStatus(${expo.id })" style="background-color:rgba(165, 168, 60, 0.74);width:80px;color: #fff" type="button" value="${expo.status }"/>
										</c:otherwise>
									</c:choose>
								</td>
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
				<!-- wish 表格 显示 end-->
			</div>
			<!-- wish页面样式end -->
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