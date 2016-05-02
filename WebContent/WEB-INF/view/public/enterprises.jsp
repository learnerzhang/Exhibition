<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
<!--
.mcontent_body .content {
	float: left;
	width: 996px;
}
.Category-list {
	clear: both;
	overflow: hidden;
	margin-bottom: 8px;
}
.box {
	border-top: #aaccee 1px solid;
}
.box .title {
	border: #aaccee 1px solid;
	border-bottom: none;
	border-top: none;
	height: 26px;
	line-height: 26px;
	background: url(resources/images/bg-box-px.png) left bottom repeat-x;
}
.box .title h3 {
	float: left;
	font-size: 14px;
	line-height: 26px;
	padding-left: 8px;
	margin-right: 15px;
}
.box .con {
	border: #aaccee 1px solid;
	border-top: none;
	padding: 4px 8px;
	clear: both;
	overflow: hidden;
}
.Category-list .ul-Category {
	float: left;
	width: 236px;
	height: 145px;
	margin-right: 8px;
	margin-bottom: 8px;
	background: url(resources/images/line-bottom.png) left bottom repeat-x;
}
.ul-Category ul{
	height:120px;
	padding: 0px;
	margin-top：8px;
}
.ul-Category ul li{
	height:20px;
	padding: 0px;
	margin: 0px;
}
.Category-list .ul-Category h4 {
	font-size: 14px;
	padding-bottom: 5px;
}
* {
	margin: 0px;
	padding: 0px;
}
-->
</style>
<script type="text/javascript">
<!--
	$(function(){
		/* $(".ul-Category li a").click(function(){
			alert($(this).attr("id"));
		}); */
	})
	
	$(function(){
		$("#type1").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/search/enterprise_list?type=1");
		});
		$("#type2").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/search/enterprise_list?type=2");
		});
		$("#type3").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/search/enterprise_list?type=3");
		});
		$("#type4").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/search/enterprise_list?type=4");
		});
		$("#type5").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/search/enterprise_list?type=5");
		});
		$("#type6").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/search/enterprise_list?type=6");
		});
		$("#type7").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/search/enterprise_list?type=7");
		});
		$("#type8").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/search/enterprise_list?type=8");
		});
		
	})
//-->
</script>

<div class="mcontent_body" style="height: 620px; padding: 2px;">
	<div style="width: 996px; height: 260px; border: 1px solid #aaccee;margin-bottom: 4px;padding: 3px;" align="center">
		<img style="margin-top: 3px;border:1px solid #aaccee ;" alt="" src="resources/images/bg3.jpg" height="98%">
	</div>
	<div class="content">
		<div class="Category-list box">
			<div class="title">
				<h3>找展商</h3>
			</div>
			<div class="con">
				<div class="ul-Category">
					<h4>
						<a id="type1">工业/机械/加工</a>
					</h4>
					<ul>
						<c:forEach items="${enterprises_1 }" var="e" varStatus="status">
							<li><a href="enterprise?id=${e.id }" target="_blank">${e.name }</a></li>
						</c:forEach>
					</ul>
				</div>

				<div class="ul-Category">
					<h4>
						<a id="type2">汽车/交通工具</a>
					</h4>
					<ul>
						<c:forEach items="${enterprises_2 }" var="e" varStatus="status">
							<li><a href="enterprise?id=${e.id }" target="_blank">${e.name }</a></li>
						</c:forEach>
					</ul>
				</div>

				<div class="ul-Category">
					<h4>
						<a id="type3">IT设备/数码/软件</a>
					</h4>
					<ul>
						<c:forEach items="${enterprises_3 }" var="e" varStatus="status">
							<li><a href="enterprise?id=${e.id }" target="_blank">${e.name }</a></li>
						</c:forEach>
					</ul>
				</div>

				<div class="ul-Category">
					<h4>
						<a id="type4" >通信/通讯/电子</a>
					</h4>
					<ul>
						<c:forEach items="${enterprises_4 }" var="e" varStatus="status">
							<li><a href="enterprise?id=${e.id }" target="_blank">${e.name }</a></li>
						</c:forEach>
					</ul>
				</div>

				<div class="ul-Category">
					<h4>
						<a id="type5" >海洋/航空/航天</a>
					</h4>
					<ul>
						<c:forEach items="${enterprises_5 }" var="e" varStatus="status">
							<li><a href="enterprise?id=${e.id }" target="_blank">${e.name }</a></li>
						</c:forEach>
					</ul>
				</div>

				<div class="ul-Category">
					<h4>
						<a id="type6" >化工/能源/环保</a>
					</h4>
					<ul>
						<c:forEach items="${enterprises_6 }" var="e" varStatus="status">
							<li><a href="enterprise?id=${e.id }" target="_blank">${e.name }</a></li>
						</c:forEach>
					</ul>
				</div>

				<div class="ul-Category">
					<h4>
						<a id="type7" >建筑/装潢/五金</a>
					</h4>
					<ul>
						<c:forEach items="${enterprises_7 }" var="e" varStatus="status">
							<li><a href="enterprise?id=${e.id }" target="_blank">${e.name }</a></li>
						</c:forEach>
					</ul>
				</div>

				<div class="ul-Category">
					<h4>
						<a id="type8" >家居/家电/日用品</a>
					</h4>
					<ul>
						<c:forEach items="${enterprises_8 }" var="e" varStatus="status">
							<li><a href="enterprise?id=${e.id }" target="_blank">${e.name }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>