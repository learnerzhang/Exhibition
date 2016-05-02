<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
<!--
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
.zs-list ul li .imgwrap, .zs-list ul li .infowrap, .zs-list ul li .contact, .zs-list ul li .contactwrap, .zs-list ul li .data {
	float: left;
	margin-right: 8px;
}
.box .title h3 {
	float: left;
	font-size: 14px;
	line-height: 26px;
	padding-left: 8px;
	margin-right: 15px;
}
strong, b {
	font-weight: bold;
}
.box .con {
	border: #aaccee 1px solid;
	border-top: none;
	padding: 4px 8px;
	clear: both;
	overflow: hidden;
}
.zs-list a {
color: #184da0;
}
.zs-list ul{
	margin: 0px;
	padding: 0px;
}
.zs-list ul li {
	padding-bottom: 8px;
	margin-bottom: 8px;
	background: url(resources/images/line-bottom.png) left bottom repeat-x;
	clear: both;
	overflow: hidden;
}
.zs-list ul li .infowrap {
	width: 300px;
	padding-top: 5px;
}
.zs-list ul li .infowrap h4 {
	font-size: 14px;
	padding-bottom: 4px;
}
.zs-list ul li .infowrap p {
	font-size: 12px;
	color: #232323;
	line-height: 150%;
	padding-bottom: 4px;
}
.zs-list ul li .contact {
	width: 300px;
	padding-top: 5px;
	text-align: left;
}
.zs-list ul li .data {
	width: 150px;
	padding-top: 5px;
	color: #333;
}
.zs-list ul li .infowrap p {
	font-size: 12px;
	color: #232323;
	line-height: 150%;
	padding-bottom: 4px;
}
-->
</style>
<script type="text/javascript">
	
</script>

<div class="mcontent_body" style="padding: 2px;">
	<div
		style="width: 996px; height: 260px; border: 1px solid #aaccee; margin-bottom: 4px;"
		align="center">
		<img style="margin-top: 3px; border: 1px solid #aaccee;" alt=""
			src="resources/images/bg3.jpg" height="98%">
	</div>
	<div class="content">

		<div class="zs-list box">
			<div class="title">
				<h3>
					相关结果
				</h3>
			</div>
			<div class="con">
				<ul>
					<c:forEach items="${enterpriselist }" var="enterprise" varStatus="status">
						<li>
							<div class="infowrap">
								<h4>
									<a href="enterprise?id=${enterprise.id }"
										target="_blank"> ${enterprise.name }</a>
								</h4>
								<p>
									地区： ${enterprise.area }<br>行业：
									<c:choose>
										<c:when test="${enterprise.type==1}">
										工业/机械/加工
										</c:when>
										<c:when test="${enterprise.type==2}">
										汽车/交通工具
										</c:when>
										<c:when test="${enterprise.type==3}">
										IT设备/数码/软件
										</c:when>
										<c:when test="${enterprise.type==4}">
										通信/通讯/电子
										</c:when>
										<c:when test="${enterprise.type==5}">
										海洋/航空/航天
										</c:when>
										<c:when test="${enterprise.type==6}">
										化工/能源/环保
										</c:when>
										<c:when test="${enterprise.type==7}">
										建筑/装潢/五金
										</c:when>
										<c:when test="${enterprise.type==8}">
										家居/家电/日用品
										</c:when>
									</c:choose>
								</p>
							</div>
							<div class="contact">联系人：${enterprise.agent }&nbsp;&nbsp;&nbsp;
								联系电话：${enterprise.contact }</div>
							<div class="data">发布日期：${fn:split(enterprise.time," ")[0] }</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>