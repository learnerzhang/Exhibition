<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
<!--

body {
	font: 9pt/20px Arial, "宋体";
	color: #417aa3;
	background: #fff;
}
#NewsView_left {
	width: 719px;
	float: left;
	min-height: 215px;
	_height: 215px;
}
#NewsView_HDTK_bianju {
	padding: 8px 5px 5px 5px;
}
.News_PointView {
	text-align: center;
	margin: 15px 0px 25px;
}
.News_PointView h2 {
	font-size: 20px;
	color: #000;
	height: 25px;
	padding-top: 2px;
}
.News_PointViewSpan {
	margin-right: 20px;
	color: #000;
}
.NV_China_newsPickText {
	border: 1px solid #ccc;
	background: #fff;
	padding: 5px;
	text-indent: 25px;
	font-size: 14px;
	line-height: 24px;
	margin: 0px 17px;
}
.NV_China_newsContent {
	margin: 15px 0px;
	font-size: 14px;
	line-height: 25px;
	color: #000;
	padding: 0px 20px;
}
.NV_China_newsContent p {
	margin-bottom: 20px;
}
.NV_China_newsPic {
	text-align: center;
}
.NewsViewPinglun a{
	color: #417aa3;
	padding: 0 5px;
	font-size: 12px;
	text-decoration: none;
}
.NewsViewPinglun a:hover{
	color:red;
	cursor: pointer;
}

.NewsViewPinglun {
	border-top: 1px solid #cce1f3;
	padding: 12px;
	color: #000;
}
.NewsViewPinglun ul {
	color: #35719d;
	font-size: 14px;
}
.NewsViewPinglun li {
	background: url(resources/images/News_dian.gif) no-repeat left center;
	padding-left: 10px;
	line-height: 24px;
}
.NV_China_newsShenMing {
	border: 1px solid #ccc;
	background: #fff;
	padding: 5px;
	text-indent: 25px;
	font-size: 12px;
	line-height: 24px;
	margin: 0px 17px;
}
-->
</style>
<script type="text/javascript">
<!--
	$("#NewsViewPinglun_id a").click(function(){
		$("#content").empty().load("<%=request.getContextPath()%>/index/news?id="+$(this).attr('id'));
	});
//-->
</script>
<div style="margin-bottom: 10px;margin-top: 10px;">
	<div id="NewsView_left" style="border: solid 1px #aaccee;margin-bottom:10px;">
		<div id="NewsView_HdtkXiangxi">
			<div id="NewsView_HDTK_bianju">
				<!--内容-->
				<div class="News_PointView">
					<h2>${review.title }</h2>
					<span class="News_PointViewSpan">${fn:split(review.creattime," ")[0] }</span>
					<span class="News_PointViewSpan">${review.comefrom }</span>
					<span class="News_PointViewSpan">欢迎浏览中国会展网资讯</span>
				</div>
				<div class="NV_China_newsPickText">
					核心提示：${review.keyword }</div>
				<div class="NV_China_newsContent">
					<c:if test="${fn:length(imagelist)>0}">
						<p class="NV_China_newsPic"> <img src="<%=request.getContextPath() %>/resources/upload/${imagelist[0].nname }" width="500" alt="${review.title }"></p>
					</c:if>
					<p>
						${review.context }
					</p>
				</div>
				<div class="NewsViewPinglun" id="NewsViewPinglun_id">
					<ul style="list-style-type: none;">
						<c:choose>
							<c:when test="${empty pre_review}">
								<li><font color="#417aa3" style="font-size: large; font-weight: bold;">上一篇：</font><span>没有了</span></li>
							</c:when>
							<c:otherwise>
								<li><font color="#417aa3" style="font-size: large; font-weight: bold;">上一篇：</font><a id="${pre_review.id }" target="_blank">${pre_review.title }</a><span>${fn:split(pre_review.creattime,' ')[0] }</span></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty next_review}">
								<li><font color="#417aa3" style="font-size: large; font-weight: bold;">下一篇：</font><span>没有了</span></li>
							</c:when>
							<c:otherwise>
								<li><font color="#417aa3" style="font-size: large; font-weight: bold;">下一篇：</font><a id="${next_review.id }"  target="_blank">${next_review.title }</a><span>${fn:split(next_review.creattime,' ')[0] }</span></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="NV_China_newsShenMing">
					<font color="black">中国会展网新闻资讯版权及免责声明：
						<p>1、凡本网注明“来源：中国会展网”
							的所有资讯，版权均属于中国会展网，如其它媒体需转载、摘编或以其它方式使用上述内容，请在授权范围内使用，并标注“来源：中国会展网”。</p>
						<p>2、凡本网注明 “来源：XXX（非中国会展网）”
							的资讯，均转载自其它媒体，转载目的在于传递更多信息，对全部或者部分内容、文字的真实性、完整性、及时性本网不作任何保证或承诺，请读者仅作参考，并请自行核实相关内容。</p>
					</font>
				</div>
				<script src="http://c.cnzz.com/core.php?web_id=3802636&amp;t=z" charset="utf-8" type="text/javascript"></script>
				<a href="http://www.cnzz.com/stat/website.php?web_id=3802636" target="_blank" title="站长统计">站长统计</a>
				<div class="lakai"></div>
			</div>
		</div>
	</div>
</div>