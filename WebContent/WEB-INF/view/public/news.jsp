<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
#News_expoRenwu {
	height: 228px;
	width: 995px;
	border: 1px solid #aaccee;
	margin-bottom: 10px;
}
#News_expoRenwu a:hover{
	color: red;
	cursor: pointer;
}
.blue_bg h3 {
	height: 26px;
	line-height: 26px;
	padding-left: 6px;
	font-size: 14px;
}
.gengduom {
	height: 26px;
	line-height: 26px;
	float: right;
	padding-right: 10px;
	font-weight: normal;
	font-size: 12px;
}
#News_expoRenwuLeft {
	width: 290px;
	float: left;
	height: 202px;
	padding-left: 5px;
}
#News_expoRenwuLeft dl {
	height: 90px;
	margin: 0px 3px;
	border-bottom: 1px dashed #dadada;
	padding-top: 5px;
}
#News_expoRenwuLeft dt {
	float: left;
	color: #666;
	width: 157px;
}
#News_expoRenwuLeft dt strong {
	color: red;
	font-size: 14px;
}
#News_expoRenwuLeft dd {
	width: 100px;
	height: 75px;
	padding: 2px;
	border: 1px solid #ccc;
	float: left;
	margin-right: 3px;
}
#News_expoRenwuLeft ul {
	margin-top: 4px;
	padding-left:0px;
	font-size: 14px;
}

#News_expoRenwuLeft li {
	height: 24px;
	padding: 0px 3px;
	margin: 0px 5px;
	line-height: 24px;
}
#News_expoRenwuLeft li a {
	color: #417aa3;
	font-size: 14px;
	text-decoration: none;
}
#News_expoRenwuLeft b {
	background: url(resources/images/list_dian.gif) no-repeat left center;
	height: 24px;
	padding-left: 12px;
	font-weight: normal;
}
#News_expoRenwuRight {
	width: 416px;
	float: left;
	height: 202px;
}
#News_expoRenwuRight dl {
	width: 138px;
	float: left;
	text-align: center;
	padding-top: 10px;
}

#News_expoRenwuRight dd img {
	width: 120px;
	height: 160px;
	padding: 2px;
	border: 1px solid #ccc;
}
#News_PointPic {
	height: 290px;
	border: 1px solid #aaccee;
	width: 995px;
	margin-bottom: 10px;
}
#News_PointBigPic {
	width: 215px;
	height: 264px;
	float: left;
}
#News_PointBigPic p {
	text-align: center;
	padding-top: 2px;
}
#News_PointBigPic img {
	padding: 2px;
	border: 1px solid #ccc;
	margin: 6px;
	margin-right：2px;
	margin-bottom: 0px;
	width: 194px;
	height: 224px;
}
#News_PointSmallPic {
	width: 779px;
	height: 264px;
	float: left;
}
.newsPointXT {
	width: 779px;
	height: 120px;
	padding-top: 8px;
}
.newsPointXT dd{
	margin: 0px;
	padding: 0px;
	height: 102px;
	width: 155px;
	text-align: center;
}
.newsPointXT dd img {
	width: 128px;
	height: 96px;
	padding: 2px;
	border: 1px solid #ccc;
	display: block;
}
.newsPointXT dl {
	width: 155px;
	height:120px;
	float: left;
	text-align: center;
	display: block;
}
.newsPointXT dt {
	height: 18px;
	line-height: 18px;
	margin-top: 12px;
}
</style>
<script type="text/javascript">
<!--
	$(function(){
		$("#News_expoRenwu a").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/index/news?id="+$(this).attr('id'));
		});
		
		$("#News_PointPic a").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/index/pics?id="+$(this).attr('id'));
		});
	});
//-->
</script>
<div class="mcontent_body" style="height: 840px; padding: 2px;">
	<div style="width: 996px;height: 260px;border: 1px solid #aaccee; margin-bottom: 4px;" align="center">
		<img style="margin-top: 3px;border:1px solid #aaccee ;" alt="" src="resources/images/bg1.jpg" height="98%">
	</div>
	<div id="Div1">
		<div id="News_expoRenwu">
			<div class="blue_bg">
				<span class="gengduom"></span>
				<h3>会展人物</h3>
				<div id="News_expoRenwuLeft">
					<dl>
						<c:if test="${fn:length(imagelist) > 0 }">
							<dd>
								<a id="${renwuimagelist[0].title }" target="_blank"><img src="resources/upload/${imagelist[0].nname }" alt="会展资讯会展人物" width="100px" height="75px" border="0"></a>
							</dd>
							<dt>
								<strong>
									<a id="${renwuimagelist[0].id }" target="_blank" class="ared"></a>
								</strong><br>
								<a id="${renwuimagelist[0].id }" target="_blank" class="ahuise">${renwuimagelist[0].title }</a>
								<p>
									<a target="_blank" class="ahuise"><span class="red">${fn:substring(renwuimagelist[0].context,0,25 ) }...</span></a>
									 <br>[<a id="${renwuimagelist[0].id }" target="_blank" class="ared">详细 </a>]
								</p>
							</dt>
						</c:if>
					</dl>
					<ul>
						<c:forEach items="${renwulist }" var="rw" varStatus="status">
							<li>
								<b><a id="${rw.id }" target="_blank">${rw.title }</a></b>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div id="News_expoRenwuRight" style="width: 700px;">
					<c:forEach items="${imagelist }" var="image" begin="1" end="${fn:length(imagelist) }" varStatus="status">
						<dl>
							<dd>
								<a id="${image.review_id }" target="_blank"> <img src="resources/upload/${imagelist[status.count].nname }" alt="${rwil.title }" border="0"></a>
							</dd>
							<dt>
								<a id="${image.review_id }" target="_blank">${fn:substring(image.review_title,0,9) }...</a>
							</dt>
						</dl>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<div id="News_PointPic">
            <div class="blue_bg">
                <span class="gengduom"></span>
                <h3>幻灯图库</h3>
                <div id="News_PointBigPic">
                	<c:if test="${fn:length(huandengtukuimagelist) > 0 }">
                		<a id="${huandengtukuimagelist[0].review_id }" target="_blank">
                			<img src="resources/upload/${huandengtukuimagelist[0].nname }" width="198" height="225" target="_blank" alt="${huandengtukuimagelist[0].review_title }" border="0"></a>
  						<p><a id="${huandengtukuimagelist[0].review_id }" target="_blank">${fn:substring(huandengtukuimagelist[0].review_title,0,12) }..</a></p>
                	</c:if>
        		</div>
				<div id="News_PointSmallPic">
			          <div class="newsPointXT" style="padding-top: 0px;">
				          	<c:forEach items="${huandengtukuimagelist }" var="image" begin="1" end="5">
				          		<dl>
						             <dd><a id="${image.review_id }" target="_blank"><img src="resources/upload/${image.nname }" alt="" target="_blank" border="0"></a></dd>
						             <dt><a id="${image.review_id }" target="_blank">${fn:substring(image.review_title,0,9) }..</a></dt>
					            </dl>
				          	</c:forEach>     
			          </div>
			          <div class="newsPointXT">
			            	<c:forEach items="${huandengtukuimagelist }" var="image" begin="6" end="10">
				          		<dl>
						             <dd><a id="${image.review_id }" target="_blank"><img src="#" alt="" target="_blank" border="0"></a></dd>
						             <dt><a id="${image.review_id }" target="_blank">${fn:substring(image.review_title,0,9) }..</a></dt>
					            </dl>
				           </c:forEach>    
			          </div>
				</div>
            </div>
        </div>
</div>