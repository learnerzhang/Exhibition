<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.date_input.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/dateFormat.js"></script>
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
	var backPage = "${page}"
	$.extend(DateInput.DEFAULT_OPTS, {
		month_names : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月",
				"十月", "十一月", "十二月" ],
		short_month_names : [ "一", "二", "三", "四", "五", "六", "七", "八", "九", "十",
				"十一", "十二" ],
		short_day_names : [ "日", "一", "二", "三", "四", "五", "六" ],
		dateToString : function(date) {
			var month = (date.getMonth() + 1).toString();//月份  
			var dom = date.getDate().toString();//日  
			if (month.length == 1)
				month = "0" + month;//控制月份为10一下的显示为01格式  
			if (dom.length == 1)
				dom = "0" + dom;//同月份  
			return date.getFullYear() + "-" + month + "-" + dom;
		}
	});
	function initType(){
		var types= ["国内展讯","国际展讯","专题报道","会展人物","幻灯图库","会展知识","政策条例","展馆新闻","人事政策","参展实务","展台展具","交通住宿"];
		$("#type option").remove();
		var option="";
		$.each(types,function(i,item){
			if("${review.type }"==item)
			{
				option+="<option selected='selected'>"+item+"</option>"
			}else{
				option+="<option>"+item+"</option>"
			}
		});
		$("#type").append(option);	
	};
	$(document).ready(function() {
		initType();
		$("#creattime").date_input();
		$("#deadline").date_input();
		
		$("#listReview").click(function(){
			$("#div").empty().load("<%=request.getContextPath()%>/review/${user.username }/userReview?page=1");
		});
		$("#back").click(function(){
			$("#div").empty().load("<%=request.getContextPath()%>/review/${user.username }/userReview?page="+backPage);
		});
		$("#save").click(function() {
			
			$("#Required_creattime").css("display", "none");
			$("#Required_deadline").css("display", "none");
			$("#Required_from").css("display", "none");
			$("#Required_keyword").css("display", "none");
			$("#Required_title").css("display", "none");
			$("#Required_context").css("display", "none");

			var flag = true;
			var date = new Date().Format("yyyy-MM-dd");
			var startDate = $("#creattime").val().trim();
			var endDate = $("#deadline").val().trim();
			
			if (startDate == "") {
				
				$("#Required_creattime").html("&nbsp;请输入显示日期").css("display", "block");flag = false;
			}else if (startDate<date) {
				
				$("#Required_creattime").html("&nbsp;显示日期需大于当前日期").css("display", "block");flag = false;
			}
			if (endDate == "") {
				$("#Required_deadline").html("&nbsp;请输入过期日期").css("display", "block");flag = false;
			}else if (endDate<=startDate) {
				$("#Required_deadline").html("&nbsp;过期日期需大于显示时间").css("display", "block");flag = false;
			}
			
			if ($("#comefrom").val()=="") {
				$("#Required_from").html("&nbsp;请输入来源").css("display", "block");flag = false;
			}
			
			if ($("#keyword").val()=="") {
				$("#Required_keyword").html("&nbsp;请输入关键词").css("display", "block");flag = false;
			}
			
			if ($("#title").val()=="") {
				$("#Required_title").html("&nbsp;请输入标题").css("display", "block");flag = false;
			}
			if ($("#context").val()=="") {
				$("#Required_context").html("&nbsp;请输入内容").css("display", "block");flag = false;
			}
			
			if (!flag) {
				return;
			}
			var paratmeter = {
					"type" : $("#type").val(),
					"creattime" : $("#creattime").val(),
					"deadline" : $("#deadline").val(),
					"comefrom" : $("#comefrom").val(),
					"keyword" : $("#keyword").val(),
					"title" : $("#title").val(),
					"context" : $("#context").val()
				};
			//alert(JSON.stringify(paratmeter));
			var url = "<%=request.getContextPath()%>/review/${user.username }/";
			if("${review!=null }"=="true"){
				url+="update?id="+${review.id };
			}else {
				url+="save";
			}
			
			$.ajax({
				contentType : "application/json",
				type : "post",
				url : url,//判断密码是否正确
				data : JSON.stringify(paratmeter),
				datatype : "json",
				async : false,
				success : function(result) {
					if (result.hasOwnProperty("code")) {
						if (result.code=="0") {
							$("#div").empty().load("<%=request.getContextPath()%>/review/${user.username }/userReview?page="+1);
						}else if (result.code=="-1") {
							alert("网络异常,请稍后再试!");
						}
					}
				}
			});
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
									class="zthong16"><img height="9" src="" width="4">网上投稿：请在这里发布您的投稿信息！</span></td>
								<td width="20%" bgcolor="#f1ede3" align="right">[<a href="#" class="a1" id="listReview">返回网上投稿列表</a>]
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
								<td width="12%" height="21" align="center" bgcolor="#f1ede3">类
									别：</td>
								<td height="21" bgcolor="#f9f9f9">&nbsp; 
									<select name="type" id="type" class="kuanglan"> </select>
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_creattime" style="color: Red; display: none;">请输入显示日期</font></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">显示日期：</td>
								<td bgcolor="#f9f9f9">&nbsp; 
								<input name="creattime" type="text" value='${fn:split(review.creattime," ")[0] }' readonly="readonly" id="creattime" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_deadline" style="color: Red; display: none;">请输入过期日期</font></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">过期日期：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<input name="deadline" type="text" value='${fn:split(review.deadline," ")[0] }' readonly="readonly" id="deadline" class="kuanglan">
									&nbsp; [<a href="#" onclick="">设为默认</a>]
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_from" style="color: Red; display: none;">请输入来源</font></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">来 源：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="comefrom" type="text" value='${review.comefrom }' id="comefrom" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_keyword" style="color: Red; display: none;">请输入关键词</font>
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">关 键 词：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="keyword" type="text" value='${review.keyword }' id="keyword" class="kuanglan">
									&nbsp;[<a href="#">使用";"分割关键词</a>]
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_title" style="color: Red; display: none;">请输入标题</font></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">标 题：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="title" type="text" value='${review.title }' id="title" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_context" style="color: Red; display: none;">请输入内容</font></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">内 容：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="context" rows="10" cols="20" id="context" class="kuanglan" style="height: 360px;">${review.context }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">&nbsp;</td>
								<td bgcolor="#f9f9f9">&nbsp;</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">&nbsp;</td>
								<td bgcolor="#f9f9f9">&nbsp; 
									<input type="button" value="<<返回" id="back">&nbsp; 
									<input type="submit" name="save" value="保存>>" id="save"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">&nbsp;</td>
								<td bgcolor="#f9f9f9">&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td height="12"></td>
			</tr>
		</tbody>
	</table>
</div>