<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.json-2.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.8.0.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/style/date_input.css" rel="stylesheet" type="text/css" />
<style>
<!--
.zthong16 {
	font-family: "宋体";
	font-size: 12px;
	line-height: 22px;
	font-weight: bold;
	color: #CC0000;
	text-decoration: none;
}

.kuanglan {
	padding: 1px;
	border: 1px solid #2396CC;
	font-family: "宋体";
	font-size: 12px;
	line-height: 16px;
	text-decoration: none;
	width: 360px;
}

a:visited {
	font-family: "宋体";
	font-size: 12px;
	line-height: 18px;
	color:#000000;
	text-decoration: none;
}

a:link {
	font-family: "宋体";
	font-size: 12px;
	line-height: 18px;
	color: #000000;
	text-decoration: none;
}
-->
</style>
<script type="text/javascript">
<!--
	function initIto(type){
		var option ="";
		//alert("sss");
		//<option value="0">展商</option>
		$.ajaxSettings.async = false;
		$.getJSON("<%=request.getContextPath()%>/user/names?type="+type,function(json){
		    var names = json.name.split("&");
		    for(var i=0;i<names.length;i++){
		    	option+="<option value="+names[i]+">"+names[i]+"</option>";
		    }
		});
		//alert(option);
		$("#ito").html(option);
	}
	$(document).ready(function() {
		//alert("s0");
		var type="0";
		initIto(type);
		var flag = true; 
		$("#type").change(function(){
			initIto($(this).val());
		});
		
		$("#msgList").click(function(){
			$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username }/msgList?page=1");
		});
		$("#back").click(function(){
			$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username}/userCenter");
		});
		$("#replay").click(function() {
			//alert(JSON.stringify(paratmeter));
			$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username }/resend?id=${msg.id }");
		});
	});
//-->
</script>
<div id="div">
	<table cellspacing="0" cellpadding="4" width="97%" align="center"
		border="0">
		<tbody>
			<tr>
				<td height="12"><font face="宋体"></font></td>
			</tr>
			<tr>
				<td bgcolor="#f7f7f2">
					<table cellspacing="1" cellpadding="4" width="100%" border="0">
						<tbody>
							<tr>
								<td width="80%" height="25" bgcolor="#f1ede3"><span
									class="zthong16"><img height="9" src="" width="4">站内信详情</span></td>
								<td width="20%" bgcolor="#f1ede3" align="right">[<a href="#" class="a1" id="msgList">返回消息列表</a>]
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f7f7f2">
					<table width="100%" border="0" cellpadding="2" cellspacing="1">
						<tbody>
							<tr>
								<td width="12%" height="21" align="center" bgcolor="#f1ede3">来自于：</td>
								<td height="21" bgcolor="#f9f9f9">&nbsp; 
									<c:choose>
										<c:when test="${msg.type eq '2' }"><input name="ifrom" readonly="readonly" type="text" value='系统' id="title" class="kuanglan"></c:when>
										<c:otherwise>
											<input name="ifrom" readonly="readonly" type="text" value='${msg.ifrom }' id="title" class="kuanglan">
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td height="20px;"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">标 题：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="title" readonly="readonly" type="text" value='${msg.title }' id="title" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_context" readonly="readonly" style="color: Red; display: none;">请输入内容</font></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">内 容：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="context" readonly="readonly" rows="10" cols="20" id="context" class="kuanglan" style="height: 360px;">${msg.context }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">&nbsp;</td>
								<td bgcolor="#f9f9f9">&nbsp;</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">&nbsp;</td>
								<td bgcolor="#f9f9f9">&nbsp; <input type="button"
									value="<<返回" onclick="" id="back">&nbsp;
									<c:if test="${msg.type ne '2' }">
										<input type="button" name="replay" value="回复>>" id="replay">
									</c:if> 
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">&nbsp;</td>
								<td bgcolor="#f9f9f9">&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</div>