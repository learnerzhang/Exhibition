<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
<!--
.search-list {
	border: #abd1ee 1px solid;
	padding: 1px 1px 0 1px;
	background-color: #f5fcff;
	margin-bottom: 10px;
}
.control ul{
	margin: 0px;
	padding: 0px;
}
.search-list .control {
	padding: 5px 10px;
	line-height: 22px;
	height:22px;
	background: url(resources/images/bg_search_t.png) left bottom repeat-x;
	color: #01529f;
	font-weight: bold;
	clear: both;
	overflow: hidden;
	_height: 1%;
}
.search-list .Introduction {
	float: left;
	width: 750px;
}
.search-list .Resueltlist ul{
	margin: 0px;
	padding: 0px;
}
.search-list .Resueltlist ul li {
	padding: 10px;
	clear: both;
	overflow: hidden;
	_height: 1%;
	color: #01529f;
	line-height: 180%;
	border-bottom: #abd1ee solid 1px;
}
.search-list .data {
	float: left;
	width: 100px;
}
.star00, .star01, .star02, .star03, .star04, .star05 {
	display: block;
	width: 64px;
	height: 12px;
	overflow: hidden;
}
.star00 { background:url(resources/images/icon_star.gif) left 0 no-repeat;}
.star01 { background:url(resources/images/icon_star.gif) left -13px no-repeat;}
.star02 { background:url(resources/images/icon_star.gif) left -26px no-repeat;}
.star03 { background:url(resources/images/icon_star.gif) left -39px no-repeat;}
.star04 { background:url(resources/images/icon_star.gif) left -52px no-repeat;}
.star05 { background:url(resources/images/icon_star.gif) left -65px no-repeat;}
-->
</style>
<script type="text/javascript">
	
</script>

<div class="mcontent_body" style="padding: 2px; border: 1px solid blue">
	<div style="width: 996px; height: 260px; border: 1px solid #aaccee; margin-bottom: 4px;" align="center">
		<img style="margin-top: 3px; border: 1px solid #aaccee;" alt=""
			src="resources/images/bg1.jpg" height="98%">
	</div>
	<div class="content">
		<div class="search-list">
			<div class="control">
				<ul>
					<li class="Introduction">展会名称/概况</li>
					<li class="data">开展日期</li>
					<li class="Rating">评级</li>
				</ul>
			</div>
			<div class="Resueltlist">
				<ul>
					<c:forEach var="expo" items="${expolist }" varStatus="status">
						<li>
							<div class="Introduction">
								<h3>
									<a id="" href="expo?id=${expo.id }" target="_blank">${expo.name }</a>
								</h3>
								<br>
								<p></p>
							</div>
							<div class="data">
								<span id="">${fn:split(expo.startline," ")[0] }</span>
							</div>
							<div class="Rating">
								<c:choose>
									<c:when test="${expo.recommend/10<1 }">
										<span class="star00"></span>
									</c:when>
									<c:when test="${expo.recommend/10<2 }">
										<span class="star01"></span>
									</c:when>
									<c:when test="${expo.recommend/10<3 }">
										<span class="star02"></span>
									</c:when>
									<c:when test="${expo.recommend/10<4 }">
										<span class="star03"></span>
									</c:when>
									<c:when test="${expo.recommend/10<5 }">
										<span class="star04"></span>
									</c:when>
									<c:otherwise>
										<span class="star05"></span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="clear"></div>
						</li>
					</c:forEach>
				</ul>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>