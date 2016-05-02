<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.date_input.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/dateFormat.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/ajaxfileupload.js"></script>
<link href="<%=request.getContextPath()%>/resources/style/date_input.css" rel="stylesheet" type="text/css" />
<style>
<!--
#image td{
	border: 1px solid gray;
	overflow:hidden;
	width: 165px;
	height: 150px;
	bgcolor:"#ffffff";
}
#name td{
	border: 1px solid gray;
	bgcolor:#eeeeee;
	width:160px;
	height:23px;
}
-->
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		var cur = 0;
		$("#backlistReview").click(function(){
			$("#div").empty().load("<%=request.getContextPath()%>/hall/${username }/userHall?page=${page}");
		});
		
		$("#table td").click(function(){
			cur = $(this).attr("id").split("_")[1];
			
			$("#table td").css("background","#eeeeee");
			$("#name_"+cur).css("background","#853f04");
			$("#image_"+cur).css("background","#853f04");
		});
		
		$("#del").click(function(){
			$("#name_"+cur).empty("");
			$("#image_"+cur).empty("")
		});
		
		$("#save").click(function(){
			var formData = new FormData($("#imageForm")[0]);
			$.ajax({
				  url:"<%=request.getContextPath()%>/upload",
				  type: 'POST',  
		          data: formData,  
		          async: false,  
		          cache: false,  
		          contentType: false,  
		          processData: false,
		          success: function (ret) {
		        	  if (ret.hasOwnProperty("src")) {
		        		  
	 		            	var nn = $("#file").val().split("\\");
	 		            	$("#name_"+cur).html(nn[nn.length-1]);
	 		            	var src = "<%=request.getContextPath()%>/resources/upload/"+ret.src;
	 		            	$("#image_"+cur).html("<img src='"+src+"' width='160px' height='150px'>");
	 		            	cur=(Number(cur)+1)%8;
	 		            	
	 		            	$("#table td").css("background","#eeeeee");
	 		   				$("#name_"+cur).css("background","#853f04");
	 		   				$("#image_"+cur).css("background","#853f04");
	 					}  
		          },  
		          error: function (returndata) {  
		              alert("添加失败,请稍后再试!");  
		          }  
			});
		});
		
		$("#upload").click(function(){
			
			var paratmeter = new Array();
			var k = 0;
			for (var int = 0; int < 8; int++) {
				
				if ($("#name_"+int).html()!="") {
					
					var oname = $("#name_"+int).html();
					var srcs = $("#image_"+int+" img").attr("src").split("/");
					paratmeter[k++]= oname+";"+srcs[srcs.length-1];
				}
			}
			$.ajax({
				  url:"<%=request.getContextPath()%>/saveImage/${username }/hallImage?id=${id}",
				  type: "POST",  
		          contentType: "json", 
		          data : JSON.stringify(paratmeter),
		          contentType: "application/json;charset=utf-8",
		          success: function (result) {
		        	  if (result.hasOwnProperty("code")) {
							if (result.code=="0") {
								$("#div").empty().load("<%=request.getContextPath()%>/hall/${username }/userHall?page=${page}");
							
							}else if (result.code=="-1") {
								alert("网络异常,请稍后再试!");
							}
						}
		          },  
		          error: function (returndata) {  
		              alert("添加失败,请稍后再试!");
		          }  
			});
		});
	});
</script>

<div id="div" style="width: 100%;height: 520px">
	<table cellspacing="0" cellpadding="4" width="97%" align="center" border="0">
		<tbody>
			<tr>
				<td height="12"><font face="宋体"></font></td>
			</tr>
			<tr>
				<td bgcolor="#f7f7f2">
					<table cellspacing="1" cellpadding="4" width="100%" border="0">
						<tbody>
							<tr>
								<td width="80%" height="25" bgcolor="#f1ede3"><span style="font-size: 12px;line-height: 22px;font-weight: bold;color:#CC0000;"><img height="9" src="" width="4">图片信息：请在这里发布您的展馆相关图片信息！</span></td>
								<td width="20%" bgcolor="#f1ede3" align="right">[<a href="#" class="a1" id="backlistReview">返回展馆列表</a>]</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	<table style="width: 700px;height: 420px;" >
		<tr>
			<td>
				<div style="width: 700px;height: 200px;">
					<table id="table" style="margin: 1px;padding: 1px;width: 100%;height: 100%;border: 1px solid gray;">
						<tr id="name">
							<td align="center" id="name_0">${himage_0.oname }</td>
							<td align="center" id="name_1">${himage_1.oname }</td>
							<td align="center" id="name_2">${himage_2.oname }</td>
							<td align="center" id="name_3">${himage_3.oname }</td>
						</tr>
						<tr id="image">
							<td align="center" id="image_0">
								<c:if test="${!empty himage_0 }">
									<img width="160px" height="150px" src="<%=request.getContextPath()%>/resources/upload/${himage_0.src }">
								</c:if>
							</td>
							<td align="center" id="image_1">
								<c:if test="${!empty himage_1 }">
									<img  width="160px" height="150px" src="<%=request.getContextPath()%>/resources/upload/${himage_1.src }">
								</c:if>
							</td>
							<td align="center" id="image_2">
								<c:if test="${!empty himage_2 }">
									<img  width="160px" height="150px" src="<%=request.getContextPath()%>/resources/upload/${himage_2.src }">
								</c:if>
							</td>
							<td align="center" id="image_3">
								<c:if test="${!empty himage_3 }">
									<img   width="160px" height="150px" src="<%=request.getContextPath()%>/resources/upload/${himage_3.src }">
								</c:if>
							</td>
						</tr>
						<tr id="name">
							<td align="center" id="name_4">${himage_4.oname }</td>
							<td align="center" id="name_5">${himage_5.oname }</td>
							<td align="center" id="name_6">${himage_6.oname }</td>
							<td align="center" id="name_7">${himage_7.oname }</td>
						</tr>
						<tr id="image">
							<td align="center" id="image_4">
								<c:if test="${!empty himage_4 }">
									<img   width="160px" height="150px" src="<%=request.getContextPath()%>/resources/upload/${himage_4.src }">
								</c:if>
							</td>
							<td align="center" id="image_5">
								<c:if test="${!empty himage_5 }">
									<img   width="160px" height="150px" src="<%=request.getContextPath()%>/resources/upload/${himage_5.src }">
								</c:if>
							</td>
							<td align="center" id="image_6">
								<c:if test="${!empty himage_6 }">
									<img   width="160px" height="150px" src="<%=request.getContextPath()%>/resources/upload/${himage_6.src }">
								</c:if>
							</td>
							<td align="center" id="image_7">
								<c:if test="${!empty himage_7 }">
									<img   width="160px" height="150px"  src="<%=request.getContextPath()%>/resources/upload/${himage_7.src }">
								</c:if>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
	</table>
	<table style="width: 100%;">
		<tr>
			<td width="250px"></td>
			<td align="center" colspan="1">
				<form id="imageForm" action="<%=request.getContextPath()%>/upload">
					<input type="file" name="file"  accept=".jpg,.png" id="file">
					<input type="button" id="save" value="添加">
				</form>
			</td>
			<td><input type="button" id="del" value="删除"></td>
			<td align="center" colspan="1">
				<input id="upload" type="button" value="上传图片">
			</td>
			<td width="30px"></td>
		</tr>
	</table>
</div>