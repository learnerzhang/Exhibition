<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.json-2.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/md5.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/validate_id.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/area.js"></script>
<style>
<!--
.kuanglan {
	padding: 1px;
	border: 1px solid #2396CC;
	font-family: "宋体";
	font-size: 12px;
	line-height: 16px;
	text-decoration: none;
	width: 360px;
}

.zthong16 {
	font-family: "宋体";
	font-size: 12px;
	line-height: 22px;
	font-weight: bold;
	color: #CC0000;
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
	$(document).ready(function() {
		init_area();
		$("#set_password").click(function() {
			$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username}/user_changepassword");});
			$("#submit").click(function() {
						var flag = true;
						$("#Required_company").css("display", "none");
						$("#Required_contact").css("display", "none");
						$("#Required_id").css("display","none");
						$("#Required_email").css("display","none");
						$("#Required_email_format").css("display", "none");
						$("#Required_address").css("display", "none");
						$("#Required_code").css("display","none");
						$("#Required_code_format").css("display", "none");

						if ($("#company_name").val().trim() == "") {
							$("#Required_company").css("display", "block");
							flag = false;
						}
						if ($("#contact").val().trim() == "") {
							$("#Required_contact").css("display", "block");
							flag = false;
						}
						if ($("#u_id").val().trim() != "") {
							if (!isCardNo($("#u_id").val().trim())) {
								$("#Required_id").html("您输入的身份证号码不正确，请重新输入").css("display","block");//长度   "您输入的身份证号码不正确，请重新输入"
								flag = false;
							} else if (!checkProvince($("#u_id").val().trim())) {//// 检查省份
								$("#Required_id").html("您输入的身份证中省份代码不正确，请重新输入").css("display","block")
								flag = false;
							} else if (!checkBirthday($("#u_id").val().trim())) {//"您输入的身份证号码生日不正确,请重新输入"
								$("#Required_id").html("您输入的身份证号码生日不正确,请重新输入").css("display","block");
								flag = false;
							} else if (!checkParity($("#u_id").val().trim())) {//"您的身份证校验位不正确,请重新输入"
								$("#Required_id").html("您的身份证校验位不正确,请重新输入").css("display","block");
								flag = false;
							}
						}

						var email = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
						if ($("#email").val().trim() == "") {
							$("#Required_email").css("display", "block");
							flag = false;
						} else if (!email.test($("#email").val().trim())) {
							$("#Required_email_format").css("display", "block");
							flag = false;
						}

						if ($("#address").val().trim() == "") {
							$("#Required_address").css(
									"display", "block");
							flag = false;
						}
						if ($("#code").val().trim() == "") {
							$("#Required_code").css("display", "block");
							flag = false;
						} else if ($("#code").val().trim().length != 6) {
							$("#Required_code_format").css("display", "block");
							flag = false;
						}

						if (!flag) {
							return;
						}
						var paratmeter = {
							"username" : $("#username").text(),
							"company_name" : $("#company_name").val(),
							"contact" : $("#contact").val(),
							"u_id" : $("#u_id").val(),
							"mobile_number" : $("#mobile_number").val(),
							"area" : $("#prov").val()+";"+$("#city").val(),
							"email" : $("#email").val(),
							"address" : $("#address").val(),
							"code" : $("#code").val()
						};
						//alert(JSON.stringify(paratmeter));
						$.ajax({
							contentType : "application/json",
							type : "post",
							url : "<%=request.getContextPath()%>/user/edit",//判断密码是否正确
							data : JSON.stringify(paratmeter),
							datatype : "json",
							async : false,
							success : function(result) {
								if (result.hasOwnProperty("code")) {
									if (result.code=="0") {
										alert("修改信息成功!");
										$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username}/userBase");
										
									}else if (result.code=="-1") {
										alert("网络异常,稍后再试!");
									}
								}
							}
						});
				});
		});
-->
</script>
<div id="div">
	<table cellspacing="0" cellpadding="4" width="97%" align="center"
		border="0" id="table">
		<tbody>
			<tr>
				<td height="12"></td>
			</tr>
			<tr>
				<td bgcolor="#f7f7f2">
					<table cellspacing="1" cellpadding="4" width="100%" border="0">
						<tbody>
							<tr>
								<td bgcolor="#f1ede3" height="25"><span class="zthong16"><img
										height="9" src="" width="4">基本信息：请在这里完善或修改您注册的基本信息！</span></td>
								<td align="right" bgcolor="#f1ede3"><input type="submit"
									name="set_password" value="密码修改" id="set_password"></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f7f7f2">
					<div id="Panel_Link_Name"></div>
					<table style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
						cellspacing="1" cellpadding="2" width="100%" border="0">
						<tbody>
							<tr>
								<td align="center" width="12%" bgcolor="#f1ede3" height="25px">登录帐号：</td>
								<td width="58%" bgcolor="#f9f9f9" height="25px">&nbsp; <span
									id="username">${user.username }</span></td>
								<td bgcolor="#f1ede3" height="25px">登录账号<font
									color="#ff5500">不可更改</font>，更换任职公司也可继续使用，只需修改任职公司名称
								</td>
							</tr>
							<tr>
								<td align="center" width="12%" bgcolor="#f1ede3" height="25px">任职公司：</td>
								<td width="58%" bgcolor="#f9f9f9" height="25px">&nbsp; <input
									name="company_name" type="text" value="${user.company_name }"
									id="company_name" class="kuanglan"> <font
									color="#ff0000">*</font> <span id="Required_company"
									style="color: Red; display: none;">任职公司不能为空</span>
								</td>
								<td bgcolor="#f9f9f9" height="25px">任职公司<font
									color="#ff5500">可以更改</font>；但更改后将无权再管理以原来公司名义发布的相关信息；更改时请修改为现任职公司全称
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3" height="25px">真实姓名：</td>
								<td bgcolor="#f9f9f9" height="25px">&nbsp; <input
									name="contact" value="${user.contact }" maxlength="20"
									id="contact" class="kuanglan" type="text"> <font
									color="#ff0000">*</font> <span id="Required_contact"
									style="color: Red; display: none;">姓名不能为空</span></td>
								<td bgcolor="#f1ede3" height="25">请填写您的真实姓名</td>
							</tr>


							<tr>
								<td align="center" bgcolor="#f1ede3" height="25px">身份证号：</td>
								<td bgcolor="#f9f9f9" height="25">&nbsp; 
								<input name="u_id" maxlength="18" id="u_id" class="kuanglan" type="text" value="${user.u_id }">
									<span id="Required_id" style="color: Red; display: none;">身份证号码错误</span></td>
								<td bgcolor="#f9f9f9" height="25px">身份证号码限定为十八位</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3" height="25px">所在地区：</td>
								<td bgcolor="#f9f9f9" height="25px">
								<div id="area"> 
								    <select id="prov" class="prov" style="width: 90px; margin-left: 6px;">
								    	<option id="-1">${fn:split(user.area,";")[0] }</option>
								    </select>  
								    <select id="city" class="city" disabled="disabled" style="width: 90px; margin-left: 6px;">
								    	<option id="-1">${fn:split(user.area,";")[1] }</option>
								    </select> 
									<font color="#ff0000">*</font>
								</div> 
								
								</td>
								<td bgcolor="#f1ede3" height="25px">所在省份＋所在城市</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3" height="25px">移动电话：</td>
								<td bgcolor="#f9f9f9" height="25px">&nbsp; <input
									name="mobile_number" maxlength="30" id="mobile_number"
									class="kuanglan" type="text" value="${user.mobile_number }"></td>
								<td bgcolor="#f1ede3" height="25px">该手机只用于会展网的即时信息发送<br>
									或客户的咨询订单通知，对外不公开
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3" height="25px">电子邮箱：</td>
								<td bgcolor="#f9f9f9" height="25">&nbsp; <input
									name="email" value="${user.email }" maxlength="50" id="email"
									class="kuanglan" type="text"><font color="#ff0000">*</font>
									<span id="Required_email" style="color: Red; display: none;">电子邮件不能为空</span>
									<span id="Required_email_format"
									style="color: Red; display: none;">电子邮件格式错误</span></td>
								<td bgcolor="#f1ede3" height="25">电子邮箱是您取回密码和浏览者与您联系的重要方式，请正确填写</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3" height="25px">联系地址：</td>
								<td bgcolor="#f9f9f9" height="25">&nbsp; <input
									name="address" value="${user.address }" maxlength="100"
									id="address" class="kuanglan" type="text"><font
									color="#ff0000">*</font> <span id="Required_address"
									style="color: Red; display: none;">地址不能为空</span></td>
								<td bgcolor="#f9f9f9" height="25">请将所填地址具体到区、街道、门牌号，以便潜在客户与您联系。
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3" height="25px">邮政编码：</td>
								<td height="25" valign="middle" bgcolor="#f9f9f9">&nbsp; <input
									name="code" value="${user.code }" maxlength="6" id="code"
									class="kuanglan" type="text"><font color="#ff0000">*
										<span id="Required_code"
										style="color: Red; visibility: hidden;">邮政编码不能为空</span> <span
										id="Required_code_format"
										style="color: Red; visibility: hidden;">邮政编码格式不正确</span>
								</font></td>
								<td bgcolor="#f1ede3" height="25">&nbsp;</td>
							</tr>
							<tr bgcolor="#f9f9f9">
								<td align="center" bgcolor="#f1ede3" height="30px">&nbsp;</td>
								<td align="left"><span lang="en-us">&nbsp; <input
										type="submit" name="submit" value="已经填写完毕  马上提交！" id="submit"></span></td>
								<td align="right">&nbsp;</td>
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