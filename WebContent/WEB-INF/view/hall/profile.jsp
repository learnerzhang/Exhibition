<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<style>
<!--
.context_title{
	font-size: 14px;
	margin:0px;
	padding-top: 10px;
	border-bottom: solid 1px #dfdfdf;
	padding: 12px 8px 0px;
}
.tongjibiaoLi {
	height: 20px;
	width: 488px;
}
.tongjibiaoLi ul {
	text-align: center;
	padding: 0px;
	margin: 0px;
}
.tongjibiaoLi li {
	width: 97px;
	float: left;
	line-height: 20px;
}
-->
</style>
<div>
	<h3 class="context_title">展馆简介</h3>
	<p style="padding: 4px 8px; margin: 0;">${hall.introduction }</p>
</div>
<div>
	<h3 class="context_title">展馆规模</h3>
	<p style="padding: 4px 8px; margin: 0;">
		室内：${hall.innerSize } ㎡<br> 室外：${hall.outSize } ㎡
	</p>
</div>
<div>
	<h3 class="context_title">技术参数</h3>
	<p style="padding: 4px 8px; margin: 0;">${hall.technicalParameters }
	</p>
</div>

<div>
	<h3 class="context_title">展馆地址</h3>
	<p style="padding: 4px 8px; margin: 0;">
		<span style="color: #dc741d;">${hall.area } </span>${hall.address }
	</p>
</div>
<div>
	<h3 class="context_title">乘车路线</h3>
	<p style="padding: 4px 8px; margin: 0;">${hall.busRoutes }</p>
</div>

<div>
	<div style="height: 60px; padding-left: 4px;">
		<h3
			style="font-size: 14px; padding-top: 10px; padding: 12px 8px 0px; color: #c46039;">最新统计</h3>
	</div>
	<div
		style="height: 25px; line-height: 25px; padding: 0px 8px; width: 465px;">
		<img src="resources/images/green_icon.gif" alt="展会数量"
			align="absmiddle"><span style="margin: 0px 5px 0px 2px;">展会数量</span>
		<img src="resources/images/orange_icon.gif" alt="展会面积"
			align="absmiddle"><span style="margin: 0px 5px 0px 2px;">展会面积</span>
	</div>
	<div style="height: 109px; width: 486px; padding: 0px 1px;">
		<img src="resources/images/stat.gif" alt="统计表">
	</div>

	<div class="tongjibiaoLi">
		<ul>
			<li>2012年</li>
			<li>2013年</li>
			<li>2014年</li>
			<li>2015年</li>
			<li>2016年</li>
		</ul>
	</div>
</div>

<div style="padding-left: 200px;">
	<ul>
		<li class="endBtnDingLi2"><a id="btnTop" class="ading"
			href="javascript:__doPostBack('btnTop','')">0</a></li>
		<li class="endBtnDingLi1"><a id="btnTread" class="ading2"
			href="javascript:__doPostBack('btnTread','')">0</a></li>
	</ul>
</div>
<div class="lakai"></div>