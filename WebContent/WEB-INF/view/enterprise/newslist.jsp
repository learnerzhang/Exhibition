<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
<!--
#leftpanel {
	width: 670px;
	background: white url(resources/images/main_bottom.gif) repeat-x bottom;
	border: 1px solid #d6e5f7;
	padding: 1px 1px 15px;
	float: left;
	min-height: 400px;
}
#leftpanel h2 {
	background: url(resources/images/main_title.gif) no-repeat;
	height: 43px;
	font: 18px/40px 微软雅黑;
	padding-left: 9px;
	margin: 0px;
	color: #0b4080;
	font-weight: normal;
}
.content {
	padding: 15px 15px 10px;
}
#rightpanel {
	width: 222px;
	background: white;
	border: 1px solid #d6e5f7;
	padding: 1px;
	float: right;
}
#rightpanel h2 {
	background: url(resources/images/right_title.gif) no-repeat;
	height: 33px;
	font: 15px/33px 微软雅黑;
	color: #ff6c00;
	padding-left: 5px;
	font-weight: normal;
}
#picture {
	background: #b1c2d2 url(pic_title.gif) no-repeat top left;
	padding: 32px 0px 4px;
}
.flashNews {
	position: relative;
	width: 210px;
	height: 147px;
	border: 1px solid #fff;
	margin: 0px auto;
}
.flashNews ul {
	position: absolute;
	z-index: 2;
	top: 124px;
	left: 7px;
}
-->
</style>

<script type="text/javascript">
<!--

//-->
</script>
	<!--/ 左侧模块 开始-->
	<div id="leftpanel">
		<h2>新闻动态</h2>
		<div class="content">
			当前新闻动态....
		</div>
	</div>
	<!--左侧模块 结束 /-->
	<div id="rightpanel">
		<!--/ 主营业务 开始-->
		<h2>主营业务</h2>
		<ul class="service">
			<br>
			<div style="text-align: center;">${enterprise.manager }</div>
			<br>
		</ul>
		<!--主营业务 结束 /-->
		<!--/ 公司图片 开始-->
		<div id="picture">
			<div class="picBor">
				<div class="flashNews">

					<ul id="SwitchNav">
					</ul>
				</div>
			</div>
		</div>
		<!--公司图片 结束 /-->
	</div>
	<div class="lakai"></div>
	<!--/ 产品展示 开始-->
	<!--产品展示 结束 /-->
	<div class="lakai"></div>
