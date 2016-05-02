<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/area.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/ajaxfileupload.js"></script>
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
	function selectCity(data){
		var option = "";
		var selectedIndex = $("#prov :selected").text();
		$("#city").empty();
		$("#city").removeAttr("disabled");
		$.each(data, function(index, indexItem) {
			if(indexItem.n == selectedIndex){
				$.each(indexItem.c,function(i, item){
					option+="<option>"+item+"</option>";
				});
			}
		});
		$("#city").append(option);
	}
	
	function init_area(){
		var option = "";
		$.each(area, function(index, indexItem) {
			option+="<option>"+indexItem.n+"</option>";
		});
		$("#prov").append(option);
		$("#prov").bind("change", function() {
			$("#prov option[id='-1']").remove();//移除第一个元素
			selectCity(area);
		});
	}

	$(function() {
		
		var loc="";
		init_area();
		$("#listHall").click(function(){
			$("#div").empty().load("<%=request.getContextPath()%>/hall/${user.username }/userHall?page=1");
		});
		$("#back").click(function(){
			$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username}/userCenter");
		});
		
		$("#upload").click(function(){
			var formData = new FormData($("#imageForm" )[0]);
			
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
		        		  
		        		  loc = ret.src;
		        		  var src = "<%=request.getContextPath()%>/resources/upload/"+loc;
		        		  $("#logo").empty().append("<img src='"+src+"' width='441' hight='291' border='0'>").css("display","block");
	 					}  
		          },  
		          error: function (returndata) {  
		              alert("添加失败,请稍后再试!");  
		          }
			});
		});
		$("#save").click(function() {
			
			$("#Required_name").css("display", "none");
			$("#Required_area").css("display", "none");
			$("#Required_address").css("display", "none");
			$("#Required_contact").css("display", "none");
			$("#Required_tel").css("display", "none");
			$("#Required_email").css("display", "none");
			$("#Required_code").css("display", "none");
			$("#Required_size").css("display", "none");
			$("#Required_businessScope").css("display", "none");
			$("#Required_busRoutes").css("display", "none");
			$("#Required_introduction").css("display", "none");
		
			var flag = true;
			
			if ($("#name").val()=="") {
				$("#Required_name").css("display", "block");flag = false;
			}
			
			if ($("#prov").val()=="" || $("#city").val()=="") {
				$("#Required_area").css("display", "block");flag = false;
			}
			
			if ($("#address").val()=="") {
				$("#Required_address").css("display", "block");flag = false;
			}
			
			if ($("#contact").val()=="") {
				$("#Required_contact").css("display", "block");flag = false;
			}
			
			if ($("#tel").val()=="") {
				$("#Required_tel").html("&nbsp;&nbsp;联系方式不能为空").css("display", "block");flag = false;
				
			}else if (!$("#tel").val().match(/^1[3|4|5|8][0-9]\d{4,8}$/)) {
				$("#Required_tel").html("&nbsp;&nbsp;联系方式输入不正确").css("display", "block");flag = false;
			}
			
			if ($("#email").val()=="") {
				
				$("#Required_email").html("&nbsp;&nbsp;邮箱不能为空").css("display", "block");flag = false;
				
			}else if(! /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($("#email").val())){
				
				$("#Required_email").html("&nbsp;&nbsp;邮箱格式不正确").css("display", "block");flag = false;
			}
			
			if ($("#code").val()=="") {
				$("#Required_code").html("&nbsp;&nbsp;邮编不能为空").css("display", "block");flag = false;
				
			}else if (! /^[0-9][0-9]{5}$/.test($("#code").val())) {
				$("#Required_code").html("&nbsp;&nbsp;邮编输入不正确").css("display", "block");flag = false;
			}
			
			if ($("#innerSize").val()=="" || $("#outSize").val()=="") {
				
				$("#Required_size").html("&nbsp;&nbsp;规模数据不能为空").css("display", "block");flag = false;
				
			}else if (isNaN($("#innerSize").val())||isNaN($("#outSize").val())) {
				
				$("#Required_size").html("&nbsp;&nbsp;规模数据输入不正确").css("display", "block");flag = false;
			}
			
			if ($("#businessScope").val()=="") {
				$("#Required_businessScope").css("display", "block");flag = false;
			}
			
			if ($("#busRoutes").val()=="") {
				$("#Required_busRoutes").css("display", "block");flag = false;
			}
			
			if ($("#introduction").val()=="") {
				$("#Required_introduction").css("display", "block");flag = false;
			}
			
			if (!flag) {
				return;
			}
			var paratmeter = {
					"name" : $("#name").val(),
					"area" : $("#prov").val()+";"+$("#city").val(),
					"address" : $("#address").val(),
					"contact" : $("#contact").val(),
					"tel" : $("#tel").val(),
					"email" : $("#email").val(),
					"code" : $("#code").val(),
					"innerSize" : $("#innerSize").val(),
					"outSize" : $("#outSize").val(),
					"businessScope" : $("#businessScope").val(),
					"busRoutes" : $("#busRoutes").val(),
					"introduction" : $("#introduction").val(),
					"locPic":loc
				};
			
			$.ajax({
				contentType : "application/json",
				type : "post",
				url : "<%=request.getContextPath()%>/hall/${user.username }/save",
				data : JSON.stringify(paratmeter),
				datatype : "json",
				async : false,
				success : function(result) {
					if (result.hasOwnProperty("code")) {
						if (result.code=="0") {
							$("#div").empty().load("<%=request.getContextPath()%>/hall/${user.username }/userHall?page="+1);
						}else if (result.code=="-1") {
							$("#Required_name").html("&nbsp;&nbsp;该展馆已经被注册").css("display", "block")
						}else if (result.code=="-2") {
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
								<td width="80%" height="25px" bgcolor="#f1ede3"><span
									class="zthong16"><img height="9" src="" width="4">提示：请在这里发布您的场馆信息！</span></td>
								<td width="20%" bgcolor="#f1ede3" align="right">[<a href="#" class="a1" id="listHall">返回场馆信息列表</a>]
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
								<td width="12%" height="21px" align="center" bgcolor="#f1ede3">展 馆：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="name" type="text" value='${hall.name }' id="name" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766px" bgcolor="#f9f9f9" >&nbsp;&nbsp;
									<font face="宋体" id="Required_name" style="color: Red; display: none;">&nbsp;&nbsp;请输入展馆名</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3" height="25px">地 区：</td>
								<td bgcolor="#f9f9f9" height="25px">
									<div id="area"> 
									    <select id="prov" class="prov" style="width: 90px; margin-left: 12px; border: 1px solid #2396CC;">
									    	<option id="-1">${fn:split(hall.area,";")[0] }</option>
									    </select>  
									    <select id="city" class="city" disabled="disabled" style="width: 90px; margin-left: 6px; border: 1px solid #2396CC;">
									    	<option id="-1">${fn:split(hall.area,";")[1] }</option>
									    </select> 
									</div> 
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_area" style="color: Red; display: none;">&nbsp;&nbsp;选择展馆所在地区</font></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">地 址：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="address" type="text" value='${hall.address }' id="address" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_address" style="color: Red; display: none;">&nbsp;&nbsp;请输入地址</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">联系人：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="contact" type="text" value='${hall.contact }' id="contact" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_contact" style="color: Red; display: none;">&nbsp;&nbsp;请输入联系人</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">联系电话：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="tel" type="text" value='${hall.tel }' id="tel" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_tel" style="color: Red; display: none;">&nbsp;&nbsp;请输入联系电话</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">电子邮箱：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="email" type="text" value='${hall.email }' id="email" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_email" style="color: Red; display: none;">&nbsp;&nbsp;请输入电子邮箱</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">邮 编：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="code" type="text" value='${hall.code }' id="code" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_code" style="color: Red; display: none;">&nbsp;&nbsp;请输入邮编</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">规 模：</td>
								<td width="766" bgcolor="#f9f9f9">
								<div>
								
									&nbsp;&nbsp;室内<input name="innerSize" type="text" value='${hall.innerSize }' id="innerSize" style="width: 90px; margin-left: 6px; margin-right:4px; border: 1px solid #2396CC;">平方&nbsp;&nbsp;&nbsp;
									室外<input name="outSize" type="text" value='${hall.outSize }' id="outSize" style="width: 90px; margin-left: 6px; margin-right:4px; border: 1px solid #2396CC;">平方
								</div>
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_size" style="color: Red; display: none;">&nbsp;&nbsp;请输入场馆规模</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">业务范围：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="businessScope" type="text" value='${hall.businessScope }' id="businessScope" class="kuanglan">
									&nbsp;[<a href="#">使用";"分割路线</a>]
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_businessScope" style="color: Red; display: none;">&nbsp;&nbsp;请输入场馆的业务范围</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">乘车路线：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="busRoutes" type="text" value='${hall.busRoutes }' id="busRoutes" class="kuanglan">
									&nbsp;[<a href="#">使用";"分割路线</a>]
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_busRoutes" style="color: Red; display: none;">&nbsp;&nbsp;请输入乘车路线</font></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3" >展馆方位图</td>
								<td bgcolor="#f9f9f9">&nbsp;
									<form id="imageForm" action="<%=request.getContextPath()%>/upload">
										<input type="file" name="file" accept=".jpg,.png,.gif" id="file"><input type="button" id="upload" value="上传">
									</form>
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp; 
									<div id="logo" style="display: none;">
									
									</div>
								</td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">展馆简介：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="introduction" rows="10" cols="20" id="introduction" class="kuanglan" style="height: 360px;">${hall.introduction }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_introduction" style="color: Red; display: none;">&nbsp;&nbsp;请输入展馆简介</font></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">&nbsp;</td>
								<td bgcolor="#f9f9f9">&nbsp; <input type="button"
									value="<<返回" onclick="" id="back">&nbsp; 
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