<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="resources/style/pic.css" type="text/css" media="screen">
<script type="text/javascript" src="resources/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.versatileTouchSlider.min.js"></script>

<script>
	jQuery(document).ready(function() {
		$.versatileTouchSlider('#banner', {
			slideWidth : 915, // some number. ex: 880 or '100%'
			slideHeight : 500, // some number. ex: 220 or 'auto'
			showPreviousNext : true,
			currentSlide : 0,
			scrollSpeed : 600,
			autoSlide : false,
			autoSlideDelay : 3000,
			showPlayPause : true,
			showPagination : true,
			alignPagination : 'center',
			alignMenu : 'left',
			swipeDrag : true,
			sliderType : 'image_banner', // image_shelf, image_banner, image_text, image_gallery
			pageStyle : 'thumbnails', // numbers, bullets, thumbnails
			onScrollEvent : function(slideNum) {
			},
			ajaxEvent : function() {
			}
		});
		
		$("#NewsViewPinglun_id a").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/index/pics?id="+$(this).attr('id'));
		});
	});//ready
</script>
<style>
<!--
.News_PointView {
	text-align: center;
	margin: 15px 0px 25px;
}
.News_PointView h2 {
	font-size: 20px;
	color: #000;
	height: 25px;
	margin-bottom:10px;
	padding-top: 2px;
}
.News_PointViewSpan {
	margin-right: 20px;
	color: #000;
}
.NewsViewPinglun {
	margin-top:20px;
	border-top: 1px solid #cce1f3;
	padding: 12px;
	color: #000;
}
#NewsViewPinglun_id a{
	color: #417aa3;
	text-decoration: none;
}
#NewsViewPinglun_id a:hover{
	color: red;
	cursor: pointer;
}
-->
</style>
<div style="border: 1px solid #aaccee;height: 800px;width: 98%;margin-top: 10px;margin-bottom: 10px">
	<div class="News_PointView">
    	<h2> ${review.title }</h2>
    	<span class="News_PointViewSpan">${fn:split(review.creattime," ")[0] }</span>
    	<span class="News_PointViewSpan">来源：${review.comefrom }</span>
    	<span class="News_PointViewSpan">欢迎浏览<b style="color: blue">会展交流综合平台</b>资讯</span>
    </div>
	<div class="sti_container" align="center" id="banner" style="margin-top: 20px;">
		<!-- slider -->
		<div class="sti_slider">
			<div class="sti_items" style="display: block;" align="center">
				<c:forEach items="${imagelist }" var="image">
					<div class="sti_slide" style="margin:auto;"> 
						<div style="border: 1px solid #ccc;" align="center">
							<img class="image" style="max-height: 533px;float: none;" src="resources/upload/${image.nname }" alt="">
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- sti_items -->
		</div>
		<!-- sti_slider -->
		<div class="sti_paginate">
			<div class="sti_page">
				<c:forEach items="${imagelist }" var="image">
					<img src="resources/upload/${image.nname }" >
				</c:forEach>
			</div>
			<div class="sti_control">
				<a href="#" class="sti_btn sti_play"><img src="resources/img/play.png"
					alt=""></a> <a href="#" class="sti_btn sti_pause"><img
					src="resources/img/pause.png" alt=""></a>
			</div>
		</div>
		<div class="sti_clear"></div>
	</div>
	<!-- sti_container -->
	<div class="NewsViewPinglun" id="NewsViewPinglun_id">
		<div style="margin-top: 18px;">
			<c:choose>
				<c:when test="${empty pre_review}">
					<div style="float: left;">上一组图 ： 没有了</div>
				</c:when>
				<c:otherwise>
					<div style="float: left;">上一组图 ：<a id="${pre_review.id }">${pre_review.title }</a><br></div>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${empty next_review}">
					<div style="float: right;">下一组图 ： 没有了</div>
				</c:when>
				<c:otherwise>
					<div style="float: right;">下一组图 ：<a id="${next_review.id }">${next_review.title }</a></div>
				</c:otherwise>
			</c:choose>
		
    	</div>  	
	</div>
</div>
<style>
<!--
.sti_page img{
	width: 60px;
	height: 42px;
}
-->
</style>
