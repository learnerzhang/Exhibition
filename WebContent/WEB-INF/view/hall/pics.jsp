<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.7.min.js"></script>

<div style="margin: 0px 5px 0px;">

	<c:forEach items="${images }" var="image">
		<div style="margin: 10px;0px;10px;20px;">
			<img alt="" src="<%=request.getContextPath() %>/resources/upload/${image.src}">
		</div>
	</c:forEach>
</div>