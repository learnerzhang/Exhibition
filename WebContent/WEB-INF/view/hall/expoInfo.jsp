<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
<!--
.exhi_tab_on {
	width: 213px;
	background: #d2bf2d;
	height: 25px;
	border-bottom: solid 1px #fff;
	border-right: solid 1px #aaccee;
	font-weight: bold;
	line-height: 25px;
	text-align: center;
	font-size: 14px;
	float: left;
	cursor: pointer;
}
.exhi_tab_off {
	width: 213px;
	background: #BEBEBE;
	height: 25px;
	border-bottom: solid 1px #aaccee;
	border-right: solid 1px #aaccee;
	line-height: 25px;
	text-align: center;
	font-size: 14px;
	float: left;
	cursor: pointer;
}
.news_content {
	width: 470px;
	padding: 4px;
	height: 188px;
}
.news_content a{
	color: #686868;
	text-decoration: none;
}
.news_content a:hover{
	color: blue;
	text-decoration: none;
}
.banzhanxinxi {
	margin: 10px 0px 0px 10px;
	border-bottom: 1px dashed #dcdcdc;
	height: 70px;
	width: 450px;
}
.banzhanxinxi dd {
	float: left;
	margin-right: 5px;
}
.banzhanxinxi dd img {
	width: 98px;
	height: 58px;
	padding: 2px;
	border: 1px solid #dcdcdc;
}
.banzhanxinxi dt {
	float: left;
	padding-top: 3px;
}
strong, b {
	font-weight: bold;
}
-->
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
<!--
	function exhishowTab(id){
		$("#exhiTab_"+id).removeClass('exhi_tab_off').addClass('exhi_tab_on').siblings().removeClass('exhi_tab_on').addClass('exhi_tab_off');
		if (id==1) {
			$("#exhicont_1").css("display","block");
			$("#exhicont_2").css("display","none");
			
		}else if (id==2) {
			$("#exhicont_1").css("display","none");
			$("#exhicont_2").css("display","block");
		}
	};
//-->
</script>
<div class="blue_bg">
	<p class="exhi_tab_on" id="exhiTab_1" onmouseover="exhishowTab(1);">
		办展计划</p>
	<p class="exhi_tab_off" id="exhiTab_2" onmouseover="exhishowTab(2);">
		已办展会</p>
</div>
<div class="news_content" id="exhicont_1" style="">

	<c:forEach items="${news }" var="expo">
		<dl class="banzhanxinxi">
			<dd>
				<a href="<%=request.getContextPath() %>/expo?id=${expo.id }" target="_blank">
				<img src="" alt="${expo.name }" style="border-width: 0px;"></a>
			</dd>
			<dt>
				<strong>展会名称： <a id="${expo.id }" href="<%=request.getContextPath() %>/expo?id=${expo.id }"  target="_blank">${expo.name }</a></strong><br>
				开展时间： <span >${fn:split(expo.startline,' ')[0] }</span> --- <span >${fn:split(expo.deadline,' ')[0] }</span> 
				<br> 举办场馆：<span>${expo.venue }</span>
			</dt>
		</dl>
	</c:forEach>
	<div id="webPage">
	</div>
</div>
<div class="news_content" id="exhicont_2" style="display: none;">

	<c:forEach items="${olds }" var="expo">
		<dl class="banzhanxinxi">
			<dd>
				<a href="<%=request.getContextPath() %>/expo?id=${expo.id }" target="_blank">
				<img id="rptBgxx_ctl00_imgUrl" src="/Web/images/default_90_52.gif" alt="${expo.name }" style="border-width: 0px;"></a>
			</dd>
			<dt>
				<strong>展会名称： <a href="<%=request.getContextPath() %>/expo?id=${expo.id }" target="_blank">${expo.name }</a></strong>
				<br>开展时间： <span id="">${fn:split(expo.startline,' ')[0] }</span> --- <span id="">${fn:split(expo.deadline,' ')[0] }</span> 
				<br> 举办场馆：<span id="">${expo.venue }</span>
			</dt>
		</dl>
	</c:forEach>
</div>