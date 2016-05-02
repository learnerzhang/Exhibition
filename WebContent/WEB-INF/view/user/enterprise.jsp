<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/area.js"></script>
<script type="text/javascript" src="resources/js/jquery.json-2.4.js"></script>
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

	function init_type(){
		var type = new Array("工业/机械/加工","汽车/交通工具","IT设备/数码/软件","通信/通讯/电子","海洋/航空/航天","化工/能源/环保","建筑/装潢/五金","家居/家电/日用品");
		var option = "";
		for (var int = 0; int < type.length; int++) {
			
			if(int+1=="${enterprise.type}")
				option+="<option selected='selected' value="+(int+1)+">"+type[int]+"</option>";
			else {
				option+="<option value="+(int+1)+">"+type[int]+"</option>";
			}
		}
		$("#type").append(option);
	}
	$(function() {
		
		init_type();
		init_area();
		$("#listEnterprise").click(function(){
			$("#div").empty().load("<%=request.getContextPath()%>/enterprise/${enterprise.username }/userEnterprise?page=1");
		});
		$("#back").click(function(){
			$("#div").empty().load("<%=request.getContextPath()%>/user/${enterprise.username}/userCenter");
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
			
			$("#name").css("boder-color","#2396CC");
			$("#prov").css("border-color","#2396CC");
			$("#address").css("border-color","#2396CC");
			$("#agent").css("border-color","#2396CC");
			$("#contact").css("border-color","#2396CC");
			$("#code").css("border-color","#2396CC");
			$("#email").css("border-color","#2396CC");
			$("#remark").css("border-color","#2396CC");
			$("#website").css("border-color","#2396CC");
			$("#introduction").css("border-color","#2396CC");
			$("#manager").css("border-color","#2396CC");
			
			var flag = true;
			if ($("#name").val().trim()=="") { $("#name").css("border-color","red"); flag = false; }
			
			if ($("#prov").val().trim()=="" || $("#city").val()=="") {
				$("#prov").css("border-color","red");
				flag = false;
			}
			
			if ($("#address").val().trim()=="") {
				$("#address").css("border-color","red");
				flag = false;
			}
			
			if ($("#agent").val().trim()=="") {
				$("#agent").css("border-color","red");flag = false;
			}
			
			if ($("#contact").val().trim()==""||!$("#contact").val().match(/^1[3|4|5|8][0-9]\d{4,8}$/)) {
				$("#contact").css("border-color","red");flag = false;
			}
			
			if ($("#email").val().trim()==""||! /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($("#email").val())) {
				$("#email").css("border-color","red");flag = false;
			}
			
			if ($("#code").val().trim()==""||! /^[0-9][0-9]{5}$/.test($("#code").val())) {
				$("#code").css("border-color","red");flag = false;
			}
			
			if ($("#introduction").val().trim()=="") {
				$("#introduction").css("border-color","red");flag = false;
			}
			
			if ($("#manager").val().trim()=="") {
				$("#manager").css("border-color","red");flag = false;
			}
			if (!flag) {
				return;
			}
			var paratmeter = {
					"id": "${enterprise.id}",
					"username": "${enterprise.username}",
					"name" : $("#name").val(),
					"type" : $("#type").val(),
					"area" : $("#prov").val()+";"+$("#city").val(),
					"address" : $("#address").val(),
					"contact" : $("#contact").val(),
					"agent" : $("#agent").val(),
					"email" : $("#email").val(),
					"code" : $("#code").val(),
					"remark" : $("#remark").val(),
					"website" : $("#website").val(),
					"introduction" : $("#introduction").val(),
					"manager" : $("#manager").val(),
					"about_us" : $("#about_us").val(),
					"manager_context" : $("#manager_context").val()
				};
			
			$.ajax({
				contentType:"application/json;charset=utf-8",
				type : "post",
				url : "<%=request.getContextPath()%>/enterprise/${user.username }/update?id="+"${enterprise.id }",
				data : JSON.stringify(paratmeter),
				datatype : "json",
				async : false,
				success : function(result) {
					if (result.hasOwnProperty("code")) {
						if (result.code=="0") {
							$("#div").empty().load("<%=request.getContextPath()%>/enterprise/${user.username }/userEnterprise?page="+1);
						}else if (result.code=="1") {
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
									class="zthong16"><img height="9" src="" width="4">提示：请在这里发布您的展商公司信息！</span></td>
								<td width="20%" bgcolor="#f1ede3" align="right">[<a href="#" class="a1" id="listEnterprise">返回展商公司列表</a>]
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
								<td width="12%" height="21px" align="center" bgcolor="#f1ede3">公 司：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="name" disabled="disabled"  type="text" value='${enterprise.name }' id="name" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766px" bgcolor="#f9f9f9" >&nbsp;&nbsp;
									<font face="宋体" id="Required_name" style="color: Red; display: none;">&nbsp;&nbsp;请输入公 司名</font></td>
							</tr>
							
							<tr>
								<td width="12%" height="21px" align="center" bgcolor="#f1ede3">公司类型：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
									<select name="type" id="type" style="width: 100px;height: 20px">
									</select>
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766px" bgcolor="#f9f9f9" >&nbsp;&nbsp;
									<font face="宋体" id="Required_type" style="color: Red; display: none;">&nbsp;&nbsp;请选择公司类型</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3" height="25px">地 区：</td>
								<td bgcolor="#f9f9f9" height="25px">
									<div id="area"> 
									    <select id="prov" class="prov" style="width: 90px; margin-left: 12px; border: 1px solid #2396CC;">
									    	<option id="-1">${fn:split(enterprise.area,";")[0] }</option>
									    </select>
									    <select id="city" class="city" disabled="disabled" style="width: 90px; margin-left: 6px; border: 1px solid #2396CC;">
									    	<option id="-1">${fn:split(enterprise.area,";")[1] }</option>
									    </select> 
									</div> 
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_area" style="color: Red; display: none;">&nbsp;&nbsp;选择公司所在地区</font></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3">地 址：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="address" type="text" value='${enterprise.address }' id="address" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_address" style="color: Red; display: none;">&nbsp;&nbsp;请输入地址</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">代理人：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="agent" type="text" value='${enterprise.agent }' id="agent" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_agent" style="color: Red; display: none;">&nbsp;&nbsp;请输入代理人</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">联系电话：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="contact" type="text" value='${enterprise.contact }' id="contact" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_contact" style="color: Red; display: none;">&nbsp;&nbsp;请输入联系电话</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">电子邮箱：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="email" type="text" value='${enterprise.email }' id="email" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_email" style="color: Red; display: none;">&nbsp;&nbsp;请输入电子邮箱</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">邮 编：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="code" type="text" value='${enterprise.code }' id="code" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_code" style="color: Red; display: none;">&nbsp;&nbsp;请输入邮编</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">口 号：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="remark" type="text" value='${enterprise.remark }' id="remark" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_remark" style="color: Red; display: none;">&nbsp;&nbsp;请输入公司口号</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">网 址：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="website" type="text" value='${enterprise.website }' id="website" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_website" style="color: Red; display: none;">&nbsp;&nbsp;请输入公司网址</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">公司简介：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="introduction" rows="10" cols="20" id="introduction" class="kuanglan" style="height: 360px;">${enterprise.introduction }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_introduction" style="color: Red; display: none;">&nbsp;&nbsp;请输入公司简介</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">关于我们：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="about_us" rows="10" cols="20" id="about_us" class="kuanglan" style="height: 360px;">${enterprise.about_us }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_about_us" style="color: Red; display: none;">&nbsp;&nbsp;请输入关于我们</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">主营业务：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="manager" type="text" value='${enterprise.manager }' id="manager" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_manager" style="color: Red; display: none;">&nbsp;&nbsp;请输入公司主营业务</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">主营业务内容：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="manager_context" rows="10" cols="20" id="manager_context" class="kuanglan" style="height: 360px;">${enterprise.manager_context }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_manager_context" style="color: Red; display: none;">&nbsp;&nbsp;请输入主营业务内容</font></td>
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