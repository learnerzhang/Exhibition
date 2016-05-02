<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
<!--
.exhiSearMain {
	border: solid 1px #abd1ee;
	background: #f5fcff;
	margin-bottom: 10px;
}
.exhiSearTitle dl {
	height: 26px;
	background: #67A0C7;
	line-height: 26px;
	color: #fff;
	font-weight: bold;
	text-align: center;
}
.exhiSearTitle dd {
	float: left;
	text-align: center;
}
.exhiSearTitle dt {
	float: left;
}
.exhieri, .exhisan, .exhisi, .exhisan3, .exhisi3, .exhieri3, .exhiwu {
margin-top: 15px;
}
.exhieri4 {
	width: 392px;
	padding-left: 15px;
}
.exhiShi2 {
	width: 164px;
	float: left;
}
.exhisan2 {
	width: 66px;
	padding-left: 10px;
	text-align: left;
}
.exhiContentMain dt {
	float: left;
}
.exhiShi {
	width: 166px;
	height: 107px;
}
.exhiShi a {
	width: 128px;
	height: 70px;
	margin-left: 18px;
	margin-top: 15px;
	display: block;
	padding: 1px;
}
.exhiShi img {
	width: 128px;
	height: 70px;
}
.exhiDlline {
	border-bottom: solid 1px #C2D3E5;
	height: 107px;
}
.exhiyi2 {
	width: 66px;
}
.exhiwu2 {
	width: 140px;
	padding-left: 15px;
}

.exhieri3 {
	width: 400px;
	padding-left: 15px;
	color: #417aa3;
}
.exhieri3 strong {
	font-size: 14px;
	margin-bottom: 10px;
}
.exhisan3 {
	width: 71px;
	padding-left: 20px;
}
.exhisi3 {
	width: 57px;
	padding-left: 15px;
}
.jonbihsc:link, .jonbihsc:visited {
	color: #686868;
	text-decoration: none;
}
-->
</style>
<script type="text/javascript">
	
</script>

<div class="mcontent_body" style="padding: 2px; border: 1px solid blue">
	<div
		style="width: 996px; height: 260px; border: 1px solid #aaccee; margin-bottom: 4px;"
		align="center">
		<img style="margin-top: 3px; border: 1px solid #aaccee;" alt=""
			src="resources/images/bg4.jpg" height="98%">
	</div>
	<div class="content">

		<div class="exhiSearMain">
			<div class="exhiSearTitle">
				<dl>
					<dt class="exhiShi2">展馆标识</dt>
					<dt class="exhieri4" style="text-align: left">展馆名称/简述</dt>
					<dt class="exhisan2" style="text-align: center;margin-left: 10px;">室内面积  </dt>
					<dt class="exhisan2" style="text-align: center;margin-left: 10px;">室外面积  </dt>
				</dl>
			</div>
			<div class="exhiContentMain">
				<c:forEach items="${halllist }" var="hall" varStatus="status">
					<dl class="exhiDlline">
						<dt class="exhiShi">
							<a href="hall?id=${hall.id}" target="_blank"><img src="resources/images/zhanguan.jpg" alt="${hall.name }" style="border-width: 0px;"></a>
						</dt>
						<dt class="exhieri3">
							<div style="margin-bottom: 10px;">
								<strong>
								<a id="" class="jonbihsc" href="hall?id=${hall.id}" target="_blank">${hall.name }</a>
								<span style="color: #417aa3; font-weight: normal; padding-left: 4px;">[<span id="">${hall.area }</span>]
								</span>
								</strong>
							</div>
							<span >${fn:substring(hall.introduction,0,20) }...</span>
							<span></span><br>
						</dt>
						<dt class="exhisan3">
							<span >${hall.innerSize } 平方 </span>
						</dt>
						<dt class="exhisan3">
							<span >${hall.outSize } 平方 </span>
						</dt>
					</dl>
				</c:forEach>
			</div>
		</div>
	</div>
</div>