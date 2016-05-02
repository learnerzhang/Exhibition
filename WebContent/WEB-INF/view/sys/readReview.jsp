<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员注册-有点</title>
<link rel="stylesheet" type="text/css" href="../css/css.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.json-2.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/area.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/md5.js"></script>
<script type="text/javascript">
function yiru(t)
{
 	$("#big_image").html("<img src='"+t.src+"' />")
 	$("#big_image").css("display","block");
 	//还可以让div跟着图片所在的当前窗体位置居中，代码略。
}
function yichu()
{
	$("#big_image").css("display","none");
}
function changeStatus(id){
	$.ajax({
		contentType: "application/json;charset=utf-8",
		url : "<%=request.getContextPath()%>/sys/index/changeReviewStatus?id="+id,
		type : "post",
		dataType : "json",
		success : function(data) {
			if (data.hasOwnProperty("code")) {
				if (data.code == "0") {
					if (data.status=="yes") {
						$(".btn_yes").html("不显示");
					}else{
						$(".btn_yes").html("显示");
					}
				} else if (data.code == "1") {
					alert("网络异常....");
				} 
			}
		}
	});	
}
</script>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="../img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">咨询管理</a>&nbsp;-</span>&nbsp;咨询审阅
			</div>
		</div>
		<div class="page ">
			<!-- 会员注册页面样式 -->
			<div class="banneradd bor">
				<div class="baTopNo">
					<span>咨询审阅</span>
				</div>
				<div class="baBody" style="margin-left: 10px;margin-top: 0px;" align="center">
					<div style="border: solid 1px #aaccee;width: 760px;" align="center">
						<div class="bbD" align="center">
							<font style="font-size: 20px;">${review.title }</font>
						</div>
						<div class="bbD" align="right" style="margin-right: 280px;">
							日期：<font style="color:rgb(0, 23, 255);font-size: 12px;">${fn:split(review.creattime," ")[0] }</font>
						</div>
						<div align="left" style="color: #417aa3;border: 1px solid #ccc;background: #fff;padding: 5px;text-indent: 25px;font-size: 14px;line-height: 24px;margin: 12px 27px;width: 660px;">
							核心提示：${review.keyword }
						</div>
						<div align="left" style="color: #000;border: 1px solid #ccc;background: #fff;padding: 5px;text-indent: 25px;font-size: 14px;line-height: 24px;margin: 8px 17px;width: 660px;">
							${review.context }
						</div>
						
						<div>
							<div id="big_image" style="position: absolute; display: none; z-index: 2; border: 0px solid #f4f4f4;width: 400px;"></div>
							<table>
								<tr>
									<c:forEach items="${imagelist }" var="image" varStatus="status">
										<td><div><img onmousemove="yiru(this);" onmouseout="yichu(this);" src="<%=request.getContextPath() %>/resources/upload/${image.nname}" width="140px"/></div></td>
									</c:forEach>
								</tr>
							</table>
						</div>
						<div class="bbD">
							<p class="bbDP">
								<c:choose>
									<c:when test="${review.status=='yes' }">
										<a class="btn_ok btn_yes" onclick="changeStatus(${review.id })">不显示</a>
									</c:when>
									<c:otherwise>
										<a class="btn_ok btn_yes" onclick="changeStatus(${review.id })">显示</a>
									</c:otherwise>
								</c:choose> <a class="btn_ok btn_no" href="<%=request.getContextPath() %>/sys/index/review?page=${page }">取消</a>
							</p>
						</div>
					</div>
				</div>
			</div>

			<!-- 会员注册页面样式end -->
		</div>
	</div>
</body>
</html>