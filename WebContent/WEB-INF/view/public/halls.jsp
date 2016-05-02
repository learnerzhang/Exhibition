<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
<!--

//-->
</script>

<style>
<!--
#leftPanel {
	width: 713px;
	float: left;
}
#home_News {
	width: 713px;
	height: 224px;
	float: left;
	clear: both;
	overflow: hidden;
}
.MB6 {
	margin-bottom: 8px;
}
#News_pic_border {
	margin-bottom: 6px;
	border: solid 1px #aaccee;
}
#News_pic_border {
	width: 267px;
	height: 214px;
	margin-right: 7px;
	padding: 4px 2px 4px 6px;
}
#News_pic_border, #News_text_border {
	float: left;
}
.HomePickNo {
	position: absolute;
	z-index: 4;
	width: 90px;
	height: 19px;
	margin-top: 173px;
	color: #fff;
	padding-left: 173px;
	background: url(resources/images/PickBg.png) !important;
}
#bimg {
	width: 263px;
	height: 193px;
}
.undis {
	display: none;
	line-height: 0px;
	height: 0px;
}
.dis {
	display: block;
}
#infos {
	line-height: 20px;
}
#News_pic_border, #News_text_border {
	float: left;
}
#News_text_border {
	width: 428px;
	height: 223px;
	background: url(resources/images/new_pickBG.gif) no-repeat;
	padding: 1px 0px 0px 1px;
	margin-bottom: 6px;
}
.blue_bg {
	background: url(resources/images/BG_blue_kuai.gif) repeat-x;
	height: 26px;
}
.blue_bg h3 {
	height: 26px;
	line-height: 26px;
	padding-left: 6px;
	font-size: 14px;
}
.hallPickBor {
	border-right: solid 1px #aaccee;
}
.gengduom {
	height: 26px;
	line-height: 26px;
	float: right;
	padding-right: 10px;
	font-weight: normal;
	font-size: 12px;
}
.news_content {
	width: 419px;
	padding: 4px;
	height: 188px;
}
.news_content ul {
	padding: 10px 10px;
	font: 10pt/22px Arial,"宋体";
	margin: 0px;
}
.news_content li {
	background: url(resources/images/list_dian.gif) no-repeat left center;
	padding-left: 11px;
}
#news_pick_bg {
	background: url(resources/images/BG_news_pick.gif);
	width: 409px;
	height: 70px;
	padding: 7px 5px 3px;
}
#news_pick_bg h3 {
	color: #FF0000;
	font-size: 16px;
	font-weight: bold;
	height: 20px;
}
#news_pick_bg p {
	color: #666;
	padding: 1px;4px;1px;4px;
}
.lakai {
	font-size: 1px;
	line-height: 1px;
	display: block;
	clear: both;
}
.mainBodyHall2 {
	width: 711px;
	height: 896px;
	margin-bottom: 10px;
	border: solid 1px #aaccee;
	clear: both;
	overflow: hidden;
}
#hallMainCont, #hallNewsCont {
	padding: 5px 15px 15px;
}
.hallMainUl3 {
	background: url(resources/images/HallMainDian.gif) repeat-x center bottom;
	padding-left: 6px;
	height: 86px;
	clear: both;
	overflow: hidden;
}
#hallMainCont ul {
	width: 220px;
	float: left;
	padding: 13px 0px 8px;
	margin: 0px;
}
#hallMainCont li {
	height: 20px;
	line-height: 20px;
}

#rightPanel {
	width: 276px;
	float: right;
}
#expoXinxi2 {
	width: 274px;
	height: 179px;
	margin-bottom: 4px !important;
	margin-bottom: 5px;
	border: solid 1px #afd38d;
}
.green_bg {
	background: url(resources/images/BG_green_kuai.gif) repeat-x;
	height: 26px;
	color: #4f8226;
}
.green_bg h3 {
	height: 26px;
	line-height: 26px;
	padding-left: 6px;
	font-size: 14px;
}
.page_tishiBor {
	width: 269px;
	height: 142px;
	background: url(resources/images/page_tishiBG.gif) no-repeat;
	margin: 0px auto;
	padding: 10px 0px 0px 0px;
}
.page_tishiBor h3 {
	height: 24px;
	line-height: 24px;
	color: #555;
	padding: 0px 0px 10px 35px;
	font-size: 14px;
}
.page_tishiBor p {
	width: 243px;
	padding: 0px 13px 15px;
	font-size: 14px;
	height: 45px;
}
.red {
	color: red;
}
.page_tishiLogin {
	height: 42px;
	width: 264px;
	padding-left: 5px;
}
.page_tishiLogin ins {
	display: none;
}
#exhiRTAD {
	margin-bottom: 9px;
}
#hall_TJzhang {
	margin-bottom: 10px;
	border: solid 1px #aaccee;
	width: 274px;
	height: 550px;
}
#hall_TJzhang dl {
	padding: 10px 3px 0px;
	height: 88px;
	margin: 0px 2px;
	background: url(resources/images/HallMainDian.gif) repeat-x center bottom;
}
strong, b {
	font-weight: bold;
}
#hall_TJzhang dd {
	float: left;
	margin-right: 5px;
	padding-top: 5px;
	width: 83px;
	height: 76px;
}
#hall_TJzhang dt {
	float: left;
	line-height: 18px;
	width: 176px;
	height: 76px;
}
#hall_map {
	margin-bottom: 10px;
	border: solid 1px #aaccee;
	width: 274px;
	height: 332px;
}
.hall_mapImg {
	padding-top: 20px;
}
-->
</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
<!--
	$(function() {
		$("#News_pic_border a").click(function() {
			$("#mcontent_nav_main li").eq(3).addClass('current').siblings().removeClass('current');
			$("#content").empty().load("<%=request.getContextPath()%>/index/news?id="+$(this).attr('id'));
		});
		
		$("#news_content_id a").click(function() {
			$("#mcontent_nav_main li").eq(3).addClass('current').siblings().removeClass('current');
			$("#content").empty().load("<%=request.getContextPath()%>/index/news?id="+$(this).attr('id'));
		});
		$("#mainBodyHall2_id a").click(function() {
			//alert($(this).attr("id"));
			var id = $(this).attr("id");
			if (id.length > 5) {
				//待续.....
			}else{
				 window.location.href="hall?id="+id; 
			}
			
		});
	});
//-->
</script>
<div class="mcontent_body" style="padding: 2px;">
	<div style="width: 996px;height: 260px;border: 1px solid #aaccee; margin-bottom: 6px;" align="center">
		<img style="margin-top: 3px;border:1px solid #aaccee;" alt="" src="resources/images/bg4.jpg" height="98%">
	</div>
	<div id="leftPanel">
		<!-----首页新闻----->
		<div id="home_News" class="MB6">
			<div id="News_pic_border">
				<div class="HomePickNo">
					<table id="simg" cellspacing="0" cellpadding="0" border="0">
						<tbody>
							<tr>
								<c:forEach var="i" begin="1" end="${fn:length(zgimagelist) }">
									<td onmouseover="play(${i-1},'bimg','infos');clearAuto();" onmouseout="setAuto()" class="">${i }</td>
								</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="bimg">
					<c:forEach items="${zgimagelist }" var="image" varStatus="status">
							<div name="f">
								<a id="${image.review_id }"><img style="width:100%;height:90%;" src="<%=request.getContextPath() %>/resources/upload/${image.nname }" alt="" border="0"></a>
							</div>
					</c:forEach>
				</div>

				<div id="infos">
					<c:forEach items="${zgimagelist }" var="image" varStatus="status">
							<div class="undis" name="f">
								<a id="${image.review_id }">${image.review_title }</a>
							</div>
					</c:forEach>
				</div>
			</div>

			<div id="News_text_border">
				<div class="blue_bg">
					<h3 class="hallPickBor">
						<span class="gengduom"></span>展馆新闻
					</h3>
				</div>
				<div class="news_content" id="news_content_id">
					<c:if test="${fn:length(zhanguan)>0}">
						<div id="news_pick_bg">
							<h3>
								<a id="${zhanguan[0].id }" class="ared">${fn:substring(zhanguan[0].title,0,20) } </a>
							</h3>
							<p>
								<a id="${zhanguan[0].id }" class="ahuise">${fn:substring(zhanguan[0].context,0,50) }..</a>
								<span>
									<a id="${zhanguan[0].id }" class="ared">[全文]</a>
								</span>
							</p>
						</div>
					</c:if>
					<ul>
						<c:forEach items="${zhanguan }" var="zg" begin="1" end="${fn:length(zhanguan) }" >
								<li><font color="red"></font><a id="${zg.id }" >${zg.title }</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="lakai"></div>
			</div>
			<div class="lakai"></div>
		</div>
		<!-----国内会展----->
		<div class="mainBodyHall2" id="mainBodyHall2_id">
			<div class="blue_bg">
				<h3>展览场馆</h3>
			</div>
			<div id="hallMainCont">
				<div class="hallMainUl3">
					<ul>
						<li><strong><a id="area_1" target="_blank">北京市</a></strong></li>
						<c:forEach items="${area_1 }" var="a" >
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>
					</ul>
					<ul>
						<li><strong><a id="area_2" target="_blank">天津市</a></strong></li>
						<c:forEach items="${area_2 }" var="a" >
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_3" target="_blank">河北省</a></strong></li>
						<c:forEach items="${area_3 }" var="a" >
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>

					<!--每一行的div End-->
					<div class="lakai"></div>
				</div>
				<div class="hallMainUl3">
					<ul>
						<li><strong><a id="area_4" target="_blank">山西省</a></strong></li>
						<c:forEach items="${area_4 }" var="a">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_5" target="_blank">内蒙古</a></strong></li>
						<c:forEach items="${area_5 }" var="a" >
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_6" target="_blank">辽宁省</a></strong></li>
						<c:forEach items="${area_6 }" var="a" >
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>

					<!--每一行的div End-->
					<div class="lakai"></div>
				</div>
				<div class="hallMainUl3">
					<ul>
						<li><strong><a id="area_7" target="_blank">吉林省</a></strong></li>

						<c:forEach  items="${area_7 }" var="a">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_8" target="_blank">黑龙江</a></strong></li>

						<c:forEach  items="${area_8 }" var="a">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_9" target="_blank">上海市</a></strong></li>

						<c:forEach items="${area_9 }" var="a" >
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>

					<!--每一行的div End-->
					<div class="lakai"></div>
				</div>
				<div class="hallMainUl3">
					<ul>
						<li><strong><a id="area_10" target="_blank">江苏省</a></strong></li>
						<c:forEach var="a" items="${area_10 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_11" target="_blank">浙江省</a></strong></li>
						<c:forEach var="a" items="${area_11 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_12" target="_blank">安徽省</a></strong></li>

						<c:forEach var="a" items="${area_12 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>

					<!--每一行的div End-->
					<div class="lakai"></div>
				</div>
				<div class="hallMainUl3">
					<ul>
						<li><strong><a id="area_13" target="_blank">福建省</a></strong></li>

						<c:forEach var="a" items="${area_13 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_14" target="_blank">江西省</a></strong></li>

						<c:forEach var="a" items="${area_14 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_15" target="_blank">山东省</a></strong></li>

						<c:forEach var="a" items="${area_15 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>

					<!--每一行的div End-->
					<div class="lakai"></div>
				</div>
				<div class="hallMainUl3">
					<ul>
						<li><strong><a id="area_16" target="_blank">河南省</a></strong></li>

						<c:forEach var="a" items="${area_16 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_17"target="_blank">湖北省</a></strong></li>

						<c:forEach var="a" items="${area_17 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_18" target="_blank">湖南省</a></strong></li>

						<c:forEach var="a" items="${area_18 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>

					<!--每一行的div End-->
					<div class="lakai"></div>
				</div>
				<div class="hallMainUl3">
					<ul>
						<li><strong><a id="area_19" target="_blank">广东省</a></strong></li>

						<c:forEach var="a" items="${area_19 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_20" target="_blank">广西省</a></strong></li>

						<c:forEach var="a" items="${area_20 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_21" target="_blank">海南省</a></strong></li>
						<c:forEach var="a" items="${area_21 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>

					<!--每一行的div End-->
					<div class="lakai"></div>
				</div>
				<div class="hallMainUl3">
					<ul>
						<li><strong><a id="area_22" target="_blank">重庆市</a></strong></li>
						<c:forEach var="a" items="${area_22 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_23" target="_blank">四川省</a></strong></li>

						<c:forEach var="a" items="${area_23 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_24" target="_blank">贵州省</a></strong></li>

						<c:forEach var="a" items="${area_24 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>

					<!--每一行的div End-->
					<div class="lakai"></div>
				</div>
				<div class="hallMainUl3">
					<ul>
						<li><strong><a id="area_25" target="_blank">云南省</a></strong></li>

						<c:forEach var="a" items="${area_25 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_26" target="_blank">西 藏</a></strong></li>

						<c:forEach var="a" items="${area_26 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_27" target="_blank">陕西省</a></strong></li>

						<c:forEach var="a" items="${area_27 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>

					<!--每一行的div End-->
					<div class="lakai"></div>
				</div>
				<div class="hallMainUl3">
					<ul>
						<li><strong><a id="area_28" target="_blank">甘肃省</a></strong></li>

						<c:forEach var="a" items="${area_28 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_29" target="_blank">青海省</a></strong></li>
						<c:forEach var="a" items="${area_29 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>

					</ul>
					<ul>
						<li><strong><a id="area_30" target="_blank">宁夏省</a></strong></li>
						<c:forEach var="a" items="${area_30 }">
							<li><a id="${a.id }" target="_blank">${a.name }</a></li>
						</c:forEach>
					</ul>
					<!--每一行的div End-->
					<div class="lakai"></div>
				</div>
			</div>
		</div>
		<div class="lakai"></div>
		<!-----参展常识----->
	</div>
	<div id="rightPanel">
		<!-----展馆信息征集----->
		<div id="expoXinxi2">
			<div class="green_bg">
				<h3>展馆信息征集</h3>
			</div>
			<div class="page_tishiBor">
				<h3>欢迎光临展览场馆频道,我们共有：</h3>
				<p>
					国内展馆信息<span class="red">${total }</span>条
				</p>
				<div class="page_tishiLogin">
					<a href="#" class="pg_tsLink1" title="注册成为网站用户"><ins>注册成为网站用户</ins></a>
					<a href="#" class="pg_tsLink2" title="登录用户管理中心"><ins>登录用户管理中心</ins></a>
					<a href="#" class="pg_tsLink3" itle="发布相关会展信息"><ins>发布相关会展信息</ins></a>
				</div>
			</div>
		</div>


		<!--登录下的新闻-->
		<div id="exhiRTAD">
			<a href="#" style="padding:0px; 5px;font-size: 12px;" target="_blank"><img src="http://www.expo-china.com/Static/Adv/Inc/Images/593_20120510171154631796.gif" width="277" height="38" border="0" alt="topad"></a>
		</div>

		<!-----推荐展馆----->
		<div id="hall_TJzhang">
			<div class="blue_bg">
				<h3>推荐展馆</h3>
			</div>
			<c:forEach items="${recommendHall }" var="hall">
				<dl>
					<dd>
						<a href="#" target="_blank">
							<img src="resources/images/zhanguan.jpg" alt="推荐展馆" style="border: solid #d6e0e5 1px;" width="80" height="55">
						</a>
					</dd>
					<dt>
						<strong><a href="hall?id=${hall.id }" target="_blank">${hall.name }</a></strong><br> <a
							href="hall?id=${hall.id }" target="_blank">${fn:substring(hall.introduction,0,36)}..</a>
						<a href="hall?id=${hall.id }" target="_blank"
							class="ared">[详细]</a>
					</dt>
				</dl>
			</c:forEach>

		</div>
		<!-----地图查询----->
		<div id="hall_map">
			<div class="blue_bg">
				<h3>地图查询</h3>
			</div>
			<div class="hall_mapImg">
				<img src="resources/images/hall_map.gif" alt="地图">
			</div>
		</div>
		<div class="lakai"></div>
	</div>
</div>