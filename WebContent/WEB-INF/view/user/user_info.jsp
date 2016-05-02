<%@page import="com.es.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会展信息交流综合平台-用户管理中心</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 40px;
	margin-right: 0px;
	margin-bottom: 0px;
	background: #F1EDE3;
	font: 9pt/20px Arial, "微软雅黑", "宋体";
}

#nav {
	
}

#nav tr {
	height: 30px;
}

a.a1 {
	
}

a.a1:visited {
	font-family: "宋体";
	font-size: 12px;
	line-height: 20px;
	color: #000000;
	text-decoration: underline;
}

a.a1:link {
	font-family: "宋体";
	font-size: 12px;
	line-height: 20px;
	color: #000000;
	text-decoration: underline;
}

a.a1:hover {
	font-family: "宋体";
	font-size: 12px;
	line-height: 20px;
	color: #CC0000;
	text-decoration: underline;
}

a.a2 {
	
}

a.a2:visited {
	font-family: "宋体";
	font-size: 12px;
	line-height: 20px;
	color: #FFFFFF;
	text-decoration: none;
}

a.a2:hover {
	font-family: "宋体";
	font-size: 12px;
	line-height: 20px;
	color: #FFFF00;
	text-decoration: underline;
}

a.a2:link {
	font-family: "宋体";
	font-size: 12px;
	line-height: 20px;
	color: #ffffff;
	text-decoration: none;
}

a:visited {
	font-family: "宋体";
	font-size: 12px;
	line-height: 18px;
	color: #000000;
	text-decoration: none;
}
</style>
<%
	User u = (User)session.getAttribute("user");
	String path = request.getContextPath();
	if(u==null)
	{
	%>
		<script type="text/javascript">  
           window.location.href="<%=request.getContextPath()%>/user?method=login";
     	</script> 
	<%
	}
%>
<script type="text/javascript">
	$(document).ready(function() {
		
		
		$("#logout").click(function() {
			$.ajax({
				contentType : "application/json",
				type : "post",
				url : "<%=request.getContextPath()%>/user?method=logout",
				datatype : "json",
				//async : false,
				success : function(result) {
					if (result.hasOwnProperty("code")) {
						if (result.code=="0") {
							  window.location.href="<%=request.getContextPath()%>/";
						}else if (result.code=="-1") {
							alert("网络异常,请稍后再试!");
						}
					}
				}
			});
		});
		$("#nav a").click(function() {
			if ($(this).attr('id') == "center") {
				$.ajaxSettings.async = false; 
				$("#content").empty().css("height","480px").load("<%=request.getContextPath()%>/user/${user.username}/userCenter");
				
			} else if ($(this).attr('id') == "base") {
				$("#content").empty().load("<%=request.getContextPath()%>/user/${user.username}/userBase");
				
			} else if ($(this).attr('id') == "review") {
				$("#content").empty().load("<%=request.getContextPath()%>/review/${user.username }/userReview?page=1");
			} else if ($(this).attr('id') == "hall") {
				<!--场馆管理-->
				$("#content").empty().load("<%=request.getContextPath()%>/hall/${user.username }/userHall?page=1");
			} else if ($(this).attr('id') == "expo") {
				<!--展会管理-->
				$("#content").empty().load("<%=request.getContextPath()%>/expo/${user.username }/userExpo?page=1");
			}else if ($(this).attr('id') == "enterprise") {
				<!--展会管理-->
				$("#content").empty().load("<%=request.getContextPath()%>/enterprise/${user.username }/userEnterprise?page=1");
			}
		});
	})
	
	
</script>
</head>
<body>
	<%
		//需要进行用户登录状态判断......
	%>
	<table width="960px" align="center" cellpadding="0px" cellspacing="0px"
		style="margin-top: 25px">
		<tr>
			<td width="200px" valign="top">
				<table width="200" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tbody>
						<tr>
							<td width="24" height="24"
								background="<%=path%>/resources/images/zb_02.gif">&nbsp;</td>
							<td height="24" background="<%=path%>/resources/images/zb_03.gif">&nbsp;</td>
							<td width="24" height="24"
								background="<%=path%>/resources/images/zb_04_1.jpg">&nbsp;</td>
						</tr>
						<tr>
							<td width="24" background="<%=path%>/resources/images/zb_07.gif">&nbsp;</td>
							<td height="20" align="center" valign="top"
								background="<%=path%>/resources/images/zb_17.gif"
								bgcolor="#ebdbc4">
								<table width="80%" border="1" align="center" cellpadding="2"
									cellspacing="2" style="border-collapse: collapse">
									<tbody class="nav" id="nav">
										<tr>
											<td height="35px" align="center" bgcolor="#FF6600"><a
												href="#" class="a2" id="center">用户中心</a></td>
										</tr>

										<tr>
											<td height="20px" align="center" bgcolor="#F0F0F0"
												style="cursor: hand" onmouseover="this.className='020-a'"
												onmouseout="this.className='020-b'" class="020-b"><a
												href="#" class="a1" id="base">基本信息</a></td>
										</tr>
										<tr>
											<td height="20px" align="center" bgcolor="#F0F0F0"
												style="cursor: hand" onmouseover="this.className='020-a'"
												onmouseout="this.className='020-b'" class="020-b"><a
												href="#" class="a1" id="review">网上投稿</a></td>
										</tr>
										<c:choose>
											<c:when test="${user.type == 1 }">
												<tr>
													<td height="20px" align="center" bgcolor="#F0F0F0"
														style="cursor: hand" onmouseover="this.className='020-a'"
														onmouseout="this.className='020-b'" class="020-b"><a
														href="#" class="a1" id="hall">场馆信息</a></td>
												</tr>
												<tr>
													<td height="20px" align="center" bgcolor="#F0F0F0"
														style="cursor: hand" onmouseover="this.className='020-a'"
														onmouseout="this.className='020-b'" class="020-b"><a
														href="#" class="a1" id="expo">办展信息</a></td>
												</tr>
											</c:when>
											<c:when test="${user.type == 0 }">
												<tr>
													<td height="20px" align="center" bgcolor="#F0F0F0"
														style="cursor: hand" onmouseover="this.className='020-a'"
														onmouseout="this.className='020-b'" class="020-b"><a
														href="#" class="a1" id="enterprise">展商公司</a></td>
												</tr>
											</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>
										<!-- <tr>
											<td height="20px" align="center" bgcolor="#F0F0F0"
												style="cursor: hand" onmouseover="this.className='020-a'"
												onmouseout="this.className='020-b'" class="020-b"><a
												href="#" class="a1">参展订单</a></td>
										</tr>
										<tr>
											<td height="20px" align="center" bgcolor="#F0F0F0"
												style="cursor: hand" onmouseover="this.className='020-a'"
												onmouseout="this.className='020-b'" class="020-b"><a
												href="#" class="a1">观展订单</a></td>
										</tr> 
										
										<tr>
											<td height="20" align="center" bgcolor="#F0F0F0"
												style="cursor: hand" onmouseover="this.className='020-a'"
												onmouseout="this.className='020-b'" class="020-b"><a
												target="_blank" href="#" class="a1">展台租赁</a></td>
										</tr>
										-->
										
										<tr>
											<td height="20px" align="center" bgcolor="#F0F0F0"
												style="cursor: hand" onmouseover="this.className='020-a'"
												onmouseout="this.className='020-b'" class="020-b"><a id="logout" href="#" class="a1">安全退出</a></td>
										</tr>
										<tr>
											<td height="20px" align="center" bgcolor="#F0F0F0"
												style="cursor: hand" onmouseover="this.className='020-a'"
												onmouseout="this.className='020-b'" class="020-b"><a href="<%=path%>/" class="a1">首页</a></td>
										</tr>
									</tbody>
								</table> <br>
								<div>
									<span style="color: #CC0000; font-weight: bold;" align="center">有任何问题？请联系</span>
									<div align="left">
										<ul>
											<li><a href="mailto:exhibition@163.com"
												style="text-decoration: underline;"> 邮件咨询</a></li>
											<li><a target="_blank"
												href="http:\\wpa.qq.com\msgrd?v=3&amp;uin=215454560&amp;site=qq&amp;menu=yes"
												style="text-decoration: underline;">在线咨询<img border="0"
													src="<%=path%>/resources/images/button_51.gif" alt="直接在线咨询"
													title="在线咨询"></a></li>
										</ul>
										<div align="center">
											工作时间：<a href="#" title="9:00-12:00 13:00-17:30">周一\周五</a><br>
											非工作时间：<a href="#">邮件咨询</a>
										</div>
									</div>
								</div>
							</td>
							<td width="24" height="480" valign="top"
								background="<%=path%>/resources/images/zb_18.jpg"><img
								src="<%=path%>/resources/images/zb_081.jpg" width="24"
								height="460"></td>
						</tr>
						<tr>
							<td width="24" height="24"
								background="<%=path%>/resources/images/zb_10.gif">&nbsp;</td>
							<td height="24" align="center"
								background="<%=path%>/resources/images/zb_11.gif">&nbsp;</td>
							<td width="24" height="24"
								background="<%=path%>/resources/images/zb_12_1.jpg">&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td valign="top">
				<table cellspacing="0" cellpadding="0" width="100%">
					<tbody>
						<tr>
							<td width="23px" background="<%=path%>/resources/images/zb_04_2.jpg">&nbsp;</td>
							<td background="<%=path%>/resources/images/zb_05.gif">&nbsp;</td>
							<td width="24px" background="<%=path%>/resources/images/zb_06.gif"
								height="24px">&nbsp;</td>
						</tr>
						<tr>
							<td valign="top" width="23px"
								background="<%=path%>/resources/images/zb_19.jpg"><img
								height="460px" src="<%=path%>/resources/images/zb_08_2.jpg"
								width="23px">
							</td>
							
							<td id="content">
								<jsp:include page="user_center.jsp" /><!-- 进入用户中心默认页面 -->
							</td>
							
							<td width="24px" background="<%=path%>/resources/images/zb_09.gif">&nbsp;</td>

						</tr>
						<tr>
							<td width="23px"
								background="<%=path%>/resources/images/zb_12_2.jpg">&nbsp;</td>
							<td background="<%=path%>/resources/images/zb_15.gif">&nbsp;</td>
							<td width="24px" background="<%=path%>/resources/images/zb_16.gif"
								height="24px">&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>