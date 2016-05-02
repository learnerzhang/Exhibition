<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Enterprises</title>
<!-- <script src="script/jquery-1.12.0.js"></script> -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function add() {
		window.location.href="<%=request.getContextPath()%>/enterprise?method=add";
	}
	
	function edit(id){
		window.location.href="<%=request.getContextPath()%>/enterprise?method=edit&id="+ id;
	}
	function del(id) {
		var uri = "<%=request.getContextPath()%>/enterprise?method=del&id="+ id;
		$.ajax({
			type : "POST",
			url : uri,
			dataType : "text",
			async : true,
			success : function(data) {
				if (data == "true") {
					alert("删除成功!");
					$("#" + id).remove();
				} else {
					alert("删除失败!")
				}
			},
			error : function() {
				alert("网络连接出错!" + data);
			}
		});
	}
</script>
</head>
<body>

	<input id="add" type="button" onclick="add()" value="添加" />
	<table border="1">
		<tr>
			<td>序号</td>
			<td>企业名称</td>
			<td>代理人</td>
			<td>密码</td>
			<td>状态</td>
			<td>入住时间</td>
			<td>操作</td>
		</tr>

		<c:forEach items="${list }" var="enterprise">
			<tr id="<c:out value="${enterprise.id }"/>">
				<td><c:out value="${enterprise.name }" /></td>
				<td><c:out value="${enterprise.agent }" /></td>
				<td><c:out value="${enterprise.password }" /></td>
				<td><c:out value="${enterprise.context }" /></td>
				<td><c:out value="${enterprise.status }" /></td>
				<td><c:out value="${enterprise.time }" /></td>
				<td><input type="button" value="Edit"
					onclick="edit('<c:out value="${enterprise.id }"/>')" /> <input
					type="button" value="Delete"
					onclick="del('<c:out value="${enterprise.id }"/>')"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>