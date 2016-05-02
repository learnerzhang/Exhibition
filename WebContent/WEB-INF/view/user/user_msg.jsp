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
	
	/**
		accroding by review Id
	*/
	
	$(document).ready(function() {
		
		initSelect();
		$("#look a").click(function(){
			//alert($(this).attr("id"));
			$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username}/msg?id="+$(this).attr("id"));
		});
		$("#sendMsg").click(function(){
			$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username}/sendMsg");
		});
		$("#pageList").change(function(){
			var page = $("#pageList option:selected").val();
			$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username }/msgList?page="+page);
		});
		
		$("#prev").click(function(){
			var flag = "${page.hasPrePage }";
			var page = "${page.currentPage-1 }";
			if (flag=="true") {
				$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username }/msgList?page="+page);
			}
		});
		$("#next").click(function(){
			var flag = "${page.hasNextPage }";
			var page = "${page.currentPage+1 }";
			if (flag=="true") {
				$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username }/msgList?page="+page);
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
									class="zthong16"><img height="9" src="" width="4">网站通知：</span></td>
								<td width="20%" align="right" bgcolor="#f1ede3">[<a
									href="#" class="a1" id="sendMsg">点击发送网站消息</a>]&nbsp;
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
								<td align="center" width="10%" bgcolor="#eeeeee">来源</td>
								<td align="center" bgcolor="#eeeeee">主题</td>
								<td align="center" width="15%" bgcolor="#eeeeee">操作</td>
							</tr>
							<c:forEach items="${msgs }" var="msg" varStatus="status">
								<tr>
									<td bgcolor="#ffffff" align="center">${page.beginIndex + status.index + 1 }</td>
									<td align="center" bgcolor="#ffffff">
										<c:choose>
											<c:when test="${msg.type eq '2' }">系统</c:when>
											<c:otherwise>
												${msg.ifrom }
											</c:otherwise>
										</c:choose>
									</td>
									<td align="center" bgcolor="#ffffff">${msg.title }</td>
									<td align="center" bgcolor="#ffffff" id="look"><a href="#" id="${msg.id }">查看</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</td>
			</tr>
			<tr>
				<td align="center"><table cellspacing="1" cellpadding="2"
						width="100%" border="0">
						<tbody>
							<tr>
								<td align="center">[共有${page.totalCount }条记录 页:${page.currentPage }/${page.totalPage }] [
								<a id="prev" href="#">上一页</a>] [
								<a id="next" href="#">下一页</a>] 跳到第
								<select name="pageList" id="pageList">
								</select>页
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