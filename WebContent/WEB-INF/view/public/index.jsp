<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
<!--
	function showTab(loc){
		for (var int = 0; int < $("#blue_bg_id p").length; int++) {
			if(int+1==loc){
				$("#blue_bg_id p").eq(int).attr("class","news_tab_on");
				$("#cont_"+loc).css("display","block");
			}else {
				$("#blue_bg_id p").eq(int).attr("class","news_tab_off");
				$("#cont_"+(int+1)).css("display","none");
			}
		}
	}
	$(function(){
		
		$("#a1").click(function() {
			$("#content").empty().load("<%=request.getContextPath()%>/search/expoIndustry?industry="+encodeURI(encodeURI("工业、机械、加工")));
		});
		$("#a2").click(function() {
			$("#content").empty().load("<%=request.getContextPath()%>/search/expoIndustry?industry="+encodeURI(encodeURI("汽车、交通工具")));
		});
		$("#a3").click(function() {
			$("#content").empty().load("<%=request.getContextPath()%>/search/expoIndustry?industry="+encodeURI(encodeURI("IT设备、数码、软件")));
		});
		$("#a4").click(function() {
			$("#content").empty().load("<%=request.getContextPath()%>/search/expoIndustry?industry="+encodeURI(encodeURI("通信、通讯、电子")));
		});
		$("#a5").click(function() {
			$("#content").empty().load("<%=request.getContextPath()%>/search/expoIndustry?industry="+encodeURI(encodeURI("海洋、航空、航天")));
		});
		$("#a6").click(function() {
			$("#content").empty().load("<%=request.getContextPath()%>/search/expoIndustry?industry="+encodeURI(encodeURI("化工、能源、环保")));
		});
		$("#a7").click(function() {
			$("#content").empty().load("<%=request.getContextPath()%>/search/expoIndustry?industry="+encodeURI(encodeURI("建筑、装潢、五金")));
		});
		$("#a8").click(function() {
			$("#content").empty().load("<%=request.getContextPath()%>/search/expoIndustry?industry="+encodeURI(encodeURI("家居、家电、日用品")));
		});
		
		
		$("#div2 a").click(function() {
			$("#mcontent_nav_main li").eq(1).addClass('current').siblings().removeClass('current');
			$("#content").empty().load("<%=request.getContextPath()%>/index/news?id="+$(this).attr('id'));
		});
		
		$("#div1 a").click(function() {
			$("#mcontent_nav_main li").eq(1).addClass('current').siblings().removeClass('current');
			$("#content").empty().load("<%=request.getContextPath()%>/index/news?id="+$(this).attr('id'));
		});
		$("#tabs_id li").mouseover(function() {
			for (var int = 0; int < $("#tabs_id li").length; int++) {
				if($(this).attr("id")==int)
				{
					if ($(this).attr("id")==2) {
						$(this).attr("class","last current");
					}else {
						$(this).attr("class","current");
					}
					$("#tbcon_id ul").eq(int).css("display","block");
				}else {
					if ($("#tabs_id li").eq(int).attr("id")==2) {
						$("#tabs_id li").eq(int).attr("class","last");
					}else {
						$("#tabs_id li").eq(int).attr("class","");
					}
					$("#tbcon_id ul").eq(int).css("display","none");
				}
			}
		});
	})
//-->
</script>
<style>
<!--
#div1 a{
	color: #417aa3;
	cursor: pointer;
	text-decoration: none;
}
#div1 a:visited {
	color: #417aa3;
	text-decoration: none;
}
#div1 a:hover{
	color:red;
	cursor:pointer;
	text-decoration: underline;
}

.news_content a{
	color: #417aa3;
	cursor: pointer;
	text-decoration: none;
}
.news_content a:visited {
	color: #417aa3;
	text-decoration: none;
}
.news_content a:hover{
	color:red;
	text-decoration: underline;
}
-->
</style>
<div class="mcontent_body" style="height: 840px; padding: 2px;" >
	<div style="height: 224px; width: 100%; overflow: hidden; clear: both; margin-bottom: 6px;">
		<div style="width: 713px; height: 224px; float: left; clear: both; overflow: hidden;">
			<div id="div1" style="">
				<div class="HomePickNo">
					<table id="simg" cellspacing="0" cellpadding="0" border="0">
						<tbody>
							<tr>
								<c:forEach var="i" begin="1" end="${fn:length(imagelist) }">
									<td onmouseover="play(${i-1},'bimg','infos');clearAuto();" onmouseout="setAuto()" class="">${i }</td>
								</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="bimg">
					<c:forEach items="${imagelist }" var="image" varStatus="status">
							<div name="f">
								<a id="${image.review_id }"><img style="width:100%;height:90%;" src="<%=request.getContextPath() %>/resources/upload/${image.nname }" alt="" border="0"></a>
							</div>
					</c:forEach>
				</div>
				<div id="infos">
					<c:forEach items="${imagelist }" var="image" varStatus="status">
							<div class="undis" name="f">
								<a id="${image.review_id }">${image.review_title }</a>
							</div>
					</c:forEach>
				</div>
			</div>
			<div id="div2" style="">
				<div class="blue_bg" id="blue_bg_id">
					<p class="news_tab_on" id="Tab_1" onmouseover="showTab('1');">国内</p>
					<p class="news_tab_off" id="Tab_2" onmouseover="showTab('2');">国际</p>
					<p class="news_tab_off" id="Tab_3" onmouseover="showTab('3');">专题</p>
					<p class="news_tab_off" id="Tab_4" onmouseover="showTab('4');">人物</p>
				</div>
				<div class="news_content" id="cont_1" style="display: block;">
					<c:if test="${fn:length(guonei)>0 }">
						<div id="news_pick_bg">
							<h3>
								<a class="ared" id="${guonei[0].id }">${fn:substring(guonei[0].title,0,20) }</a>
							</h3>
							<p>
								<a class="ahuise" id="${guonei[0].id }" ></a>
							</p>
							<p>
								<a class="ahuise" id="${guonei[0].id }">${fn:substring(guonei[0].context,0,50) }..</a>
								<span><a id="${guonei[0].id }" class="ared">[全文]</a></span>
							</p>
						</div>
						<ul>
							<c:forEach items="${guonei }" var="gn" begin="1" end="${fn:length(guonei) }" >
								<li><a id="${gn.id }">${gn.title }</a></li>
							</c:forEach>
						</ul>
					</c:if>
				</div>

				<div class="news_content" id="cont_2" style="display: none;">
					<c:if test="${fn:length(guoji)>0 }">
						<div id="news_pick_bg">
							<h3>
								<a id="${guoji[0].id }" class="ared">${fn:substring(guoji[0].title,0,20) }</a>
							</h3>
							<p>
								<a id="${guoji[0].id }" class="ahuise"></a>
							</p>
							<p>
								<a id="${guoji[0].id }" class="ahuise">${fn:substring(guoji[0].context,0,50) }..</a>
								<span><a id="${guoji[0].id }" class="ared">[全文]</a></span>
							</p>
						</div>
						<ul>
							<c:forEach items="${guoji }" var="gj" begin="1" end="${fn:length(guoji) }" >
								<li><a id="${gj.id }" >${gj.title }</a></li>
							</c:forEach>
						</ul>
					</c:if>
				</div>

				<div class="news_content" id="cont_3" style="display: none;">
					<c:if test="${fn:length(zhuanti)>0 }">
						<div id="news_pick_bg">
							<h3>
								<a id="${zhuanti[0].id }" class="ared">${fn:substring(zhuanti[0].title,0,20) }</a>
							</h3>
							<p>
								<a id="${zhuanti[0].id }" class="ahuise"></a>
							</p>
							<p>
								<a id="${zhuanti[0].id }" class="ahuise">${fn:substring(zhuanti[0].context,0,50) }..</a>
								<span><a id="${zhuanti[0].id }" target="_blank" class="ared">[全文]</a></span>
							</p>
						</div>
						<ul>
							<c:forEach items="${zhuanti }" var="zt" begin="1" end="${fn:length(zhuanti) }" >
								<li><a id="${zt.id }" target="_blank">${zt.title }</a></li>
							</c:forEach>
						</ul>
					</c:if>
				</div>
				<div class="news_content" id="cont_4" style="display: none;">
					<c:if test="${fn:length(renwu)>0 }">
						<div id="news_pick_bg">
							<h3>
								<a id="${renwu[0].id }" class="ared">${fn:substring(renwu[0].title,0,20) }</a>
							</h3>
							<p>
								<a id="${renwu[0].id }" class="ahuise"></a>
							</p>
							<p>
								<a id="${renwu[0].id }" class="ahuise">${fn:substring(renwu[0].context,0,50) }..</a>
								<span><a id="${renwu[0].id }" class="ared">[全文]</a></span>
							</p>
						</div>
						<ul>
							<c:forEach items="${renwu }" var="rw" begin="1" end="${fn:length(renwu) }" >
								<li><a id="${rw.id }" >${rw.title }</a></li>
							</c:forEach>
						</ul>
					</c:if>
				</div>
				<div class="lakai"></div>
			</div>
		</div>
		<div id="div3" class="expo_list_index">
			<div class="tabs" id="tabs_id">
				<ul>
					<li id="0" class="current">今日展会</li>
					<li id="1" class="">近期展会</li>
					<li id="2" class="last">展会回顾</li>
				</ul>
			</div>
			<div class="tbcon" id="tbcon_id">
				<ul id="today" style="">
					<c:forEach items="${jinri }" var="jr" varStatus="status">
						<li><span>进行</span> <font class="forange">${fn:split(jr.area,';')[0] }</font> <a href="<%=request.getContextPath() %>/expo?id=${jr.id}" target="_blank" title="${jr.name }">${fn:substring(jr.name,0,12) }</a></li>
					</c:forEach>
				</ul>
				<ul id="tomorrow" style="display: none;">
					<c:forEach items="${jinqi }" var="jq" varStatus="status">
						<li><span>${fn:split(jq.startline," ")[0] }</span> <font class="forange">${fn:split(jq.area,';')[0] }</font> <a href="<%=request.getContextPath() %>/expo?id=${jq.id}" target="_blank" title="${jq.name }">${fn:substring(jq.name,0,12) }</a>
						</li>
					</c:forEach>
				</ul>
				<ul id="yesterday" style="display: none;">
					<c:forEach items="${lisi }" var="ls" varStatus="status">
						<li><span>${fn:split(ls.startline," ")[0] }</span> <font class="forange">${fn:split(ls.area,';')[0] }</font> <a href="<%=request.getContextPath() %>/expo?id=${ls.id}" target="_blank" title="${ls.name }">${fn:substring(ls.name,0,12) }</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div style="float: left;">
		<div
			style="height: 600px; width: 711px; border: solid 1px #aaccee; float: right; margin: 10px 0px 10px 0px;">
			<div class="blue_bg">
				<p class="expo_china_on" id="guojihuizhan_1">展会信息</p>
			</div>

			<div class="r1" style="height: 20%; padding: 5px;5px;1px;5px;">
				<div class="grid">
					<h3 style="font-size: 16px; font-weight: bold;">
						<a id="a1" target="_blank" style="font-size: 16px; font-weight: bold;">工业、机械、加工</a>
					</h3>
					<ul>
						<c:forEach items="${gongye }" varStatus="status" var="gy">
							<li style="line-height: 20px;"><a href="/Exhibition/expo?id=${gy.id }" target="_blank">${fn:substring(gy.name, 0, 20)}</a><span style="color: #417aa3">[${fn:split(gy.startline," ")[0] }]</span></li>
						</c:forEach>
					</ul>
				</div>
				<div class="grid">
					<h3 style="font-size: 16px; font-weight: bold;">
						<a id="a2" target="_blank" style="font-size: 16px; font-weight: bold;">汽车、交通工具</a>
					</h3>
					<ul>
						<c:forEach items="${jiaotong }" varStatus="status" var="jt">
							<li style="line-height: 20px;"><a href="/Exhibition/expo?id=${jt.id }" target="_blank">${fn:substring(jt.name, 0, 20)}</a><span style="color: #417aa3">[${fn:split(jt.startline," ")[0] }]</span></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="r1" style="height: 20%; padding: 5px;5px;5px;5px;">
				<div class="grid">
					<h3 style="font-size: 16px; font-weight: bold;">
						<a id="a3" target="_blank"
							style="font-size: 16px; font-weight: bold;">IT设备、数码、软件</a>
					</h3>
					<ul>
						<c:forEach items="${it }" varStatus="status" var="i">
							<li style="line-height: 20px;"><a href="/Exhibition/expo?id=${i.id }" target="_blank">${fn:substring(i.name, 0, 20)}</a><span style="color: #417aa3">[${fn:split(i.startline," ")[0] }]</span></li>
						</c:forEach>
					</ul>
				</div>
				<div class="grid">
					<h3 style="font-size: 16px; font-weight: bold;">
						<a id="a4" target="_blank"
							style="font-size: 16px; font-weight: bold;">通信、通讯、电子</a>
					</h3>
					<ul>
						<c:forEach items="${tongxin }" varStatus="status" var="tx">
							<li style="line-height: 20px;"><a href="/Exhibition/expo?id=${tx.id }" target="_blank">${fn:substring(tx.name, 0, 20)}</a><span style="color: #417aa3">[${fn:split(tx.startline," ")[0] }]</span></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="r1" style="height: 20%; padding: 5px;5px;5px;5px;">
				<div class="grid">
					<h3 style="font-size: 16px; font-weight: bold;">
						<a id="a5" target="_blank" style="font-size: 16px; font-weight: bold;">海洋、航空、航天</a>
					</h3>
					<ul>
						<c:forEach items="${sea }" varStatus="status" var="s">
							<li style="line-height: 20px;"><a href="/Exhibition/expo?id=${s.id }" target="_blank">${fn:substring(s.name, 0, 20)}</a><span style="color: #417aa3">[${fn:split(s.startline," ")[0] }]</span></li>
						</c:forEach>
					</ul>
				</div>
				<div class="grid">
					<h3 style="font-size: 16px; font-weight: bold;">
						<a id="a6" target="_blank" style="font-size: 16px; font-weight: bold;">化工、能源、环保</a>
					</h3>
					<ul>
						<c:forEach items="${energy }" varStatus="status" var="e">
							<li style="line-height: 20px;"><a href="/Exhibition/expo?id=${e.id }" target="_blank">${fn:substring(e.name, 0, 20)}</a><span style="color: #417aa3">[${fn:split(e.startline," ")[0] }]</span></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="r2" style="height: 20%; padding: 5px;5px;5px;5px;">
				<div class="grid">
					<h3 style="font-size: 16px; font-weight: bold;">
						<a id="a7" target="_blank" style="font-size: 16px; font-weight: bold;">建筑、装潢、五金</a>
					</h3>
					<ul>
						<c:forEach items="${art }" varStatus="status" var="a">
							<li style="line-height: 20px;"><a href="/Exhibition/expo?id=${a.id }" target="_blank">${fn:substring(a.name, 0, 20)}</a><span style="color: #417aa3">[${fn:split(a.startline," ")[0] }]</span></li>
						</c:forEach>
					</ul>
				</div>
				<div class="grid">
					<h3 style="font-size: 16px; font-weight: bold;">
						<a id="a8" target="_blank"
							style="font-size: 16px; font-weight: bold;">家居、家电、日用品</a>
					</h3>
					<ul>
						<c:forEach items="${jiaju }" varStatus="status" var="jj">
							<li style="line-height: 20px;"><a href="/Exhibition/expo?id=${jj.id }" target="_blank">${fn:substring(jj.name, 0, 20)}</a><span style="color: #417aa3">[${fn:split(jj.startline," ")[0] }]</span></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div style="height: 600px; width: 266px; float: right; margin: 10px 0px 10px 0px;">
		<div style="height: 300px; width: 274px; border: 1px solid #da751b; margin-bottom: 7px; margin-left: -10px; overflow: hidden;">
			<table>
				<c:forEach items="${adimages }" var="image" varStatus="status">
					<tr><td><div align="center"><a href="${image.href }" target="_blank"><img width="266px" height="100px;" src="resources/upload/${image.path }" alt="${image.name }"/></a></div></td></tr>
				</c:forEach>
			</table>		
		</div>
		<div style="height: 290px; width: 274px; border: solid 1px #AACCEE; margin-bottom: 10px; margin-left: -10px; overflow: hidden;">
			<div class="recommend_t_bg">
				<h3 class="recommend_title">推荐展会</h3>
			</div>
			<div class="recommend_cont">
				<c:forEach items="${recommendlist }" var="recommend">
					<div class="recommend_c_list">
						<div class="recommend_c_img">
							<a href="#"><img src="resources/images/wu.jpg" width="81" height="56"></a>
						</div>
						<div class="recommend_c_text">
							<h4 class="t">
								<a href="<%=request.getContextPath() %>/expo?id=${recommend.id }" title="${recommend.name }" target="_blank" class="c_f">${recommend.name }</a>
							</h4>
							<p>
								<span>时间：${fn:split(recommend.startline," ")[0] }</span><span>地点：${fn:substring(recommend.venue,0,8) }</span>
							</p>
						</div>
						<div class="clear"></div>
					</div>
				</c:forEach>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</div>