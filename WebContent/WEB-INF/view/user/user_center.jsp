<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.js"></script>
<script type="text/javascript">
<!--
	$(document).ready(function() {
		
		$("a[id='review']").click(function() {
			$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username}/addReview");
		});
		$("#info").click(function() {
			
			$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username}/msgList?page=1");
		
		});
		/* $("#consume").click(function() {alert("consume");}); */
	});
//-->
</script>
<div id="div">
<table width="97%" border="0" align="center" cellpadding="4" cellspacing="0">
	<tbody>
		<tr>
			<td height="12"></td>
		</tr>
		<tr>
			<td bgcolor="#f7f7f2"><table width="100%" border="0" cellspacing="1" cellpadding="4">
					<tbody> 
						<tr>
							<td width="15%" height="25px" bgcolor="#f1ede3">用户<font
								color="#ff0000"> <span id="Label_LoginTimes">${user.username }</span></font>
							</td>
							<td width="21%" height="25px" bgcolor="#f1ede3">目前您是第<font
								color="#ff0000"> <span id="Label_LoginTimes">${user.times }</span></font>
								次光临
							</td>
							<td width="18%" bgcolor="#f1ede3">会员类别：<font color="#339900">
									<span id="Label_UserType">
									
										<c:choose>
											<c:when test="${user.type == 0 }">展商</c:when>
											<c:when test="${user.type == 1 }">展馆</c:when>
											<c:otherwise>系统管理员</c:otherwise>
										</c:choose>
									</span>
							</font></td>
							<td width="15%" bgcolor="#f1ede3">等级：<font color="#339900">
									<span id="Label_UserFlag">4</span>
							</font></td>

							<td bgcolor="#f1ede3">注册日期：<span id="Label_RegTime">${user.c_time }</span></td>
						</tr>
					</tbody>
				</table></td>
		</tr>
		<tr>
			<td bgcolor="#f7f7f2" id="td"><table width="100%" border="0" cellspacing="0" cellpadding="4">
					<tbody>
						<tr>
							<td>
								<table cellspacing="0" cellpadding="0" width="100%" border="0">
									<tbody>
										<tr>
											<td bgcolor="#cccccc" height="1"></td>
										</tr>
									</tbody>
								</table>
								<table cellspacing="0" cellpadding="0" width="100%" border="0">
									<tbody>
										<tr>
											<td height="25">
												<strong><font color="black">网上投稿</font></strong> - 共有投稿信息&nbsp;
												<font color="green"><b><span id="Label_News">${user.review }</span></b></font>&nbsp;条, <img height="9px" src="" width="5px">
												<a href="#" id="review" class="a3">马上投稿</a>
											</td>
										</tr>
										<tr>
											<td bgcolor="#cccccc" height="1"></td>
										</tr>
									</tbody>
								</table>

								<table cellspacing="0" cellpadding="0" width="100%" border="0">
									<tbody>
										<tr>
											<td height="25"><strong><font color="black">网站通知</font></strong>
												- 共有网站通知&nbsp;<font color="green"><strong>
												<span id="Label_Web_Message">${user.msg }</span></strong></font>&nbsp;条, <img height="9" src="" width="5">&nbsp;<a href="#" id="info" class="a3">查看通知</a></td>
										</tr>
										<tr>
											<td bgcolor="#cccccc" height="1"></td>
										</tr>
									</tbody>
								</table>

								<!-- <table cellspacing="0" cellpadding="0" width="100%" border="0">
									<tbody>
										<tr>
											<td height="25">
												<strong><font color="#000000">消费记录</font></strong>
												- 共有消费记录&nbsp;
												<b><font color="green"><span id="Label_Cost">0</span> </font></b> 笔，<img height="9" src="" width="5">&nbsp;总消费 <font color="green"><strong>
														<span id="Label_Cost_Money">0</span>
												</strong></font>元，<img height="9" src="" width="5">&nbsp;<a href="#" class="a3" id="consume">查看详情</a>
											</td>
										</tr>
										<tr>
											<td bgcolor="#cccccc" height="1"></td>
										</tr>
									</tbody>
								</table> -->

							</td>
						</tr>
					</tbody>
				</table></td>
		</tr>
		<tr>
			<td bgcolor="#f7f7f2"><table width="100%" border="0"
					cellpadding="2" cellspacing="0" bgcolor="#f1ede3">
					<tbody>
						<tr>
							<td><p>
									中国会展网致力于在广大的会展服务企业、展览馆、参展商、采购商、会展观众之间，构筑一座畅通的信息桥梁；为会展服务企业提供强大的网上宣传，为参展商推荐针对性极强的优秀展会，为业内人士提供信息交流的平台，促进会展行业的更好发展！<br>
									<br> 
									<br> <br>如有疑问，敬请咨询888-8888-888
								</p></td>
						</tr>
					</tbody>
				</table></td>
		</tr>
		<tr>
			<td height="12"></td>
		</tr>
		<tr align="center">
			<td></td>
		</tr>
	</tbody>
</table>
</div>