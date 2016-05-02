<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
<!--
.zthong16 {
	font-family: "宋体";
	font-size: 12px;
	line-height: 22px;
	font-weight: bold;
	color: #CC0000;
	text-decoration: none;
}

td {
	font-size: 12px;
	font-family: "宋体";
	line-height: 19px;
}

a {
	font-family: "宋体";
	font-size: 12px;
	line-height: 20px;
	color: #000000;
	text-decoration: none;
}
a:hover {
	font-family: "宋体";
	font-size: 12px;
	line-height: 20px;
	color: red;
	text-decoration: none;
}
-->
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
<!--

	var page = "${page.currentPage }";
	
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
	
	function edit(id){
		$("#div").empty().load("<%=request.getContextPath()%>/hall/${user.username}/hall?id="+id+"&page="+page);
	}
	function hallimage(id){
		$("#div").empty().load("<%=request.getContextPath()%>/hall/${user.username}/hallImage?id="+id+"&page="+page);
	}
	function del(id){
		
		$.ajax({
			url: "<%=request.getContextPath()%>/hall/${user.username}/delHall?id="+id,
			type: "POST",
			dataType:'json',
			success:function(result){
				if (result.hasOwnProperty("code")) {
					if (result.code=="0") {
						$("#div").empty().load("<%=request.getContextPath()%>/hall/${user.username}/userHall?page=1");
					}else if (result.code=="-1") {
						alert("网络异常,请稍后再试!");
					}
				}
			},
			error:function(er){
				alert("网络连接不稳定,请稍后再试!");
			}
		});
	
	}
	
	$(document).ready(function() {
		
		initSelect();
		
		$("#addHall").click(function(){
			$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username}/addHall");
		});
		$("#pageList").change(function(){
			var page = $("#pageList option:selected").val();
			
			$("#div").empty().load("<%=request.getContextPath()%>/hall/${user.username }/userHall?page="+page);
		});
		
		$("#prev").click(function(){
			var flag = "${page.hasPrePage }";
			var page = "${page.currentPage-1 }";
			if (flag=="true") {
				
				$("#div").empty().load("<%=request.getContextPath()%>/hall/${user.username }/userHall?page="+page);
			}
		});
		$("#next").click(function(){
			var flag = "${page.hasNextPage }";
			var page = "${page.currentPage+1 }";
			if (flag=="true") {
				$("#div").empty().load("<%=request.getContextPath()%>/hall/${user.username }/userHall?page="+page);
			}
		});
	})

//-->
</script>
<div id="div">
	<table cellspacing="0" cellpadding="4" width="97%" align="center"
		border="0">
		<tbody>
			<tr>
				<td height="12"><font face="宋体"></font></td>
			</tr>
			<tr>
				<td bgcolor="#f7f7f2">
					<table cellspacing="1" cellpadding="4" width="100%" border="0">
						<tbody>
							<tr>
								<td width="80%" height="25" bgcolor="#f1ede3"><span
									class="zthong16"><img height="9" src="" width="4">提示：请在这里添加或编辑您的场馆信息！</span></td>
								<td width="20%" align="right" bgcolor="#f1ede3">[<a href="#" class="a1" id="addHall">点击添加场馆信息</a>]&nbsp;
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center" bgcolor="#f7f7f2">
					<table cellspacing="1" cellpadding="4" width="100%" bgcolor="#cccccc" border="0">
						<tbody>
							<tr>
								<td align="center" width="5%" bgcolor="#eeeeee">序号</td>
								<td align="center" bgcolor="#eeeeee" width="20%">场馆名称</td>
								<td align="center" bgcolor="#eeeeee" width="10%">地区</td>
								<td align="center" width="7%" bgcolor="#eeeeee">审核</td>
								<td align="center" width="7%" bgcolor="#eeeeee">图片</td>
								<td align="center" width="9%" bgcolor="#eeeeee">管理</td>
							</tr>
							<c:forEach items="${halllist }" var="hall" varStatus="status">
								<tr>
									<td bgcolor="#ffffff" align="center">${page.beginIndex + status.index + 1 }</td>
									<td bgcolor="#ffffff" align="center">${hall.name }</td>
									<td bgcolor="#ffffff" align="center">${hall.area }</td>
									<td align="center" bgcolor="#ffffff"><c:choose>
											<c:when test="${hall.status == 'no'}">
												<font color="#ffcc00">待审核</font>
											</c:when>
											<c:when test="${hall.status == 'yes'}">
												<font color="red">已审核</font>
											</c:when>
										</c:choose>
									</td>
									<td align="center" bgcolor="#ffffff">[ <a href="#" onclick="hallimage(${hall.id })">${hall.hallimage }</a> ]
									</td>
									<td align="center" bgcolor="#ffffff">[<a href="#" onclick="edit(${hall.id })">编辑</a>] [<a href="#" onclick="del(${hall.id })">删除</a>]
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</td>
			</tr>
			<tr>
				<td align="center">
					<table cellspacing="1" cellpadding="2" width="100%" border="0">
						<tbody>
							<tr>
								<td align="center">[共有${page.totalCount }条记录 页:${page.currentPage }/${page.totalPage }] [
								<a id="prev" href="#">上一页</a>] [ <a id="next" href="#">下一页</a>] 跳到第 <select name="pageList" id="pageList"></select>页
								</td>
							</tr>
						</tbody>
					</table></td>
				</tr>
			<tr>
				<td height="12"></td>
			</tr>
		</tbody>
	</table>
</div>