<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
<!--
td {
	font-size: 12px;
	font-family: "宋体";
	line-height: 19px;
}
-->
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.json-2.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/md5.js"></script>
<script type="text/javascript">
$(document).ready(function() { 
	$("#goback").click(function() {
			$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username}/userBase");
		});
	$("#submit").click(function(){
		var flag = true;
		$("#required_con_pwd").css('display','none');
		$("#CompareValidator").css('display','none');
		
		$("#required_pre_pwd1").css('display','none');
		$("#required_pre_pwd2").css('display','none');
		
		$("#required_pwd1").css('display','none');
		$("#required_pwd2").css('display','none');
		
		if($("#pre_password").val().trim()=="")
		{
			$("#required_pre_pwd1").css('display','block');
			$("#required_pre_pwd2").css('display','none');
			flag = false;
		}
		else if ($("#pre_password").val().trim().length<6||$("#pre_password").val().trim().length>20) {
			$("#required_pre_pwd1").css('display','none');
			$("#required_pre_pwd2").css('display','block');
			flag = false;
		}
		
		if($("#new_password").val().trim()=="")
		{
			$("#required_pwd2").css('display','block');
			$("#required_pwd1").css('display','none');
			flag = false;
		}
		else if ($("#new_password").val().trim().length<6||$("#new_password").val().trim().length>20) 
		{
			$("#required_pwd2").css('display','none');
			$("#required_pwd1").css('display','block');
			flag = false;
		}
		
		if($("#con_password").val().trim()=="")
		{
			$("#required_con_pwd").css('display','block');
			$("#CompareValidator").css('display','none');
			flag = false;
		}
		else if ($("#con_password").val().trim()!=$("#new_password").val().trim()) {
			$("#required_con_pwd").css('display','none');
			$("#CompareValidator").css('display','block');
			flag = false;
			
		}
		if (!flag) {
			return;
		}
		alert("xxxxxx");
		var md5 = new MD5();
		var paratmeter = {
				"username" : $("#username").text(),
				"password" : md5.MD5($("#pre_password").val()),
				"new_password" : md5.MD5($("#new_password").val())
			};
		//alert(JSON.stringify(paratmeter));
		$.ajax({
				contentType : "application/json;charset=UTF-8",
				type:"post",
		        url:"<%=request.getContextPath()%>/user/changepwd",//判断密码是否正确
				data:JSON.stringify(paratmeter),
				datatype:"json",
				async:false,
				success:function(result){
					if (result.hasOwnProperty("code")) {
						if(result.code=="0")
							$("#result").html("密码修改成功!");
						else if (result.code=="-1") {
							$("#result").html("原密码不正确!");
						}else if (result.code=="-2"){
							$("#result").html("新密码和原密码一样,请重新输入新密码!");
						}
					}
				}});
		
	});
});
</script>
<div id="div">
<table cellspacing="0px" cellpadding="4px" width="97%" align="center" border="0px" style="margin-top: -40px;" id="table">
	<tbody>
		<tr>
			<td height="12"></td>
		</tr>
		<tr>
			<td bgcolor="#f7f7f2">
				<table cellspacing="1" cellpadding="4" width="100%" border="0px">
					<tbody>
						<tr>
							<td bgcolor="#f1ede3" height="25"><span class="zthong16">
									<img height="9" src="" width="4">密码修改：请在这里您的登录密码！
							</span></td>
							<td align="right" bgcolor="#f1ede3"><font face="宋体">[<a class="a1" id="goback">返回基本信息</a>]
							</font></td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td bgcolor="#f7f7f2" align="center">

				<table style="border-collapse: collapse" bordercolor="#111111"
					cellspacing="1" cellpadding="2" width="100%" border="0">
					<tbody>
						<tr>
							<td align="center" width="15%" bgcolor="#f1ede3" height="25">
								用户名称：</td>
							<td width="38%" bgcolor="#f9f9f9" height="25">&nbsp; <span
								id="username">${user.username}</span>
							</td>
							<td bgcolor="#f9f9f9" height="25"><font face="宋体"></font></td>
						</tr>
						<tr>
							<td align="center" bgcolor="#f1ede3" height="25">原始密码：</td>
							<td bgcolor="#f9f9f9" height="25">&nbsp; <input name="pre_password" type="password" maxlength="20" id="pre_password"
								class="kuanglan"> <font color="#ff0000">*</font>
							</td>
							<td bgcolor="#f9f9f9" height="25">
							<span id="required_pre_pwd2" title="请输入您的登录密码" style="color: Red; display: none;">密码长度应该为6～20位，而且不能有特殊字符</span>
							<span id="required_pre_pwd1" style="color: Red; display: none;">请输入您的原始登录密码</span></td>
						</tr>
						<tr>
							<td align="center" bgcolor="#f1ede3" height="25">新 密 码：</td>
							<td bgcolor="#f9f9f9" height="25">&nbsp; <input name="new_password" type="password" maxlength="20" id="new_password" class="kuanglan"> <font
								color="#ff0000">*</font>
							</td>
							<td bgcolor="#f9f9f9" height="25">
							<span id="required_pwd1" title="请输入您的登录密码" style="color: Red; display: none;">密码长度应该为6～20位，而且不能有特殊字符</span>
							<span id="required_pwd2" style="color: Red; display: none;">请输入您的登录密码</span></td>
						</tr>
						<tr>
							<td align="center" bgcolor="#f1ede3" height="25">密码确认：</td>
							<td bgcolor="#f9f9f9" height="25">&nbsp; <input
								name="con_password" type="password" maxlength="18"
								id="con_password" class="kuanglan"> <font
								color="#ff0000">*</font>
							</td>
							<td bgcolor="#f9f9f9" height="25">
								<span id="required_con_pwd" style="color: Red; display: none;">请输入密码确认</span>
								<span id="CompareValidator" style="color: Red; display: none;">两次输入的密码不一致</span>
							</td>
						</tr>
						<tr>
							<td align="center" bgcolor="#f1ede3" height="24"
								style="height: 24px"></td>
							<td bgcolor="#f9f9f9" height="24" style="height: 24px">&nbsp;
							<span id="result" style="color: Red;">
							</span>
							</td>
							<td bgcolor="#f9f9f9" height="24" style="height: 24px"></td>
						</tr>
						<tr bgcolor="#f9f9f9">
							<td align="center" bgcolor="#f1ede3" height="30">&nbsp;</td>
							<td align="left"><span lang="en-us">&nbsp; <input type="submit" name="submit" value="已经填写完毕  马上提交！" id="submit">
							</span></td>
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