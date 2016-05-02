<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加企业信息</title>
<script type="text/javascript">
function turnback(){
	window.location.href="<%=request.getContextPath()%>/enterprise";
	}
</script>
</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/enterprise?method=update&id=${enterprise.id }">
		<table>
			<tr>
				<td>公司信息</td>
				<td><input id="name" name="name" type="text" value="${enterprise.name }"/></td>
			</tr>
			<tr>
				<td>代理人</td>
				<td><input id="agent" name="agent" type="text" value="${enterprise.agent }" /></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input id="password" name="password" type="password" value="${enterprise.password }"/></td>
			</tr>
			<tr>
				<td>标语</td>
				<td><input id="context" name="context" type="text" value="${enterprise.context }"/></td>
			</tr>
			<tr>
				<td colSpan="2" align="center"><input type="submit" value="提交" /><input type="button" onclick="turnback()" value="返回" /></td>
			</tr>
		</table>
	</form>
</body>
</html>