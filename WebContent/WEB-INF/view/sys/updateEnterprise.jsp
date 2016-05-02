<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会展综合交流平台</title>
<link rel="stylesheet" type="text/css" href="../css/css.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.json-2.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/area.js"></script>
<script type="text/javascript">
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
			
			$(".btn_yes").click(function(){
				
				$("#agent").css("border-color","#ccc");
				$("#email").css("border-color","#ccc");
				$("#contact").css("border-color","#ccc");
				$("#prov").css("border-color","#ccc");
				$("#code").css("border-color","#ccc");
				$("#address").css("border-color","#ccc");
				
				var flag = true;
				if ($("#agent").val()==""||$("#agent").val().trim()=="") {
					$("#agent").css("border-color","red").focus();
					flag = false;
				}
				var email = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
				if ($("#email").val()==""||$("#email").val().trim() == ""||!email.test($("#email").val().trim())) {
					$("#email").css("border-color","red").focus();
					flag = false;
				} 
				if ($("#contact").val()==""||$("#contact").val().trim()=="") {
					$("#contact").css("border-color","red").focus();
					flag = false;
				}
				if ($("#prov").val()==""||$("#prov").val().trim()=="") {
					$("#prov").css("border-color","red").focus();
					flag = false;
				}
				
				if (isNaN($("#code").val())||$("#code").val()==""||$("#code").val().trim()==""||$("#code").val().length!=6) {
					$("#code").css("border-color","red").focus();
					flag = false;
				}
				
				if ($("#address").val()==""||$("#address").val().trim()=="") {
					$("#address").css("border-color","red").focus();
					flag = false;
				}
				
				if(!flag)return;
				var paratmeter = {
						  id :"${enterprise.id}",
						name : $("#name").val().trim(),
						contact : $("#contact").val().trim(),
						email : $("#email").val().trim(),
						agent : $("#agent").val().trim(),
						area : $("#prov").val().trim()+";"+$("#city").val().trim(),
						code : $("#code").val().trim(),
						address : $("#address").val().trim()
					};
				$.ajax({
					contentType: "application/json;charset=utf-8",
					url : "<%=request.getContextPath()%>/sys/index/updateEnterprise",
					type : "post",
					data : JSON.stringify(paratmeter),
					dataType : "json",
					success : function(data) {
						if (data.hasOwnProperty("code")) {
							if (data.code == "0") {
								window.location.href = "<%=request.getContextPath() %>/sys/index/enterprise?page=${page}";//当前页面...
							} else if (data.code == "1") {
								alert("网络异常;请稍后再试");
							} 
						}
					}
				});	
			});
		});
</script>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="../img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">网站管理</a>&nbsp;-</span>&nbsp;信息修改
			</div>
		</div>
		<div class="page ">
			<!-- 上传广告页面样式 -->
			<div class="banneradd bor">
				<div class="baTopNo">
					<span>信息修改</span>
				</div>
				<div class="baBody">
					<div class="bbD"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公司名称：<input disabled type="text" id="name" name="name" class="input3" value="${enterprise.name }"/>
					</div>
					<div class="bbD"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;代&nbsp;&nbsp;理&nbsp;人：<input type="text" id="agent" name="agent" class="input3" value="${enterprise.agent }"/>
					</div>
					<div class="bbD"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 箱：<input type="text" id="email" class="input3" value="${enterprise.email }"/>
					</div>
					<div class="bbD"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机号码：<input type="text" id="contact" name="contact" class="input3" value="${enterprise.contact }"/>
					</div>
					<div class="bbD"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所在城市： <select id="prov" class="input3" style="width: 120px; margin-left: 6px;"> <option id="-1">${fn:split(enterprise.area,";")[0] }</option> </select><select id="city" class="input3" disabled="disabled" style="width: 120px; margin-left: 6px;"> <option id="-1">${fn:split(enterprise.area,";")[1] }</option></select> 
					</div>
					<div class="bbD"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 遍：<input class="input3" id="code" name="code" type="text" value="${enterprise.code }"/>
					</div>
					<div class="bbD"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 址：<input class="input3" name="address" id="address" type="text" value="${enterprise.address }"/>
					</div>
					<div class="bbD">
						<p class="bbDP">
							<button class="btn_ok btn_yes" href="#">提交</button>
							<a class="btn_ok btn_no" href="<%=request.getContextPath() %>/sys/index/enterprise?page=${page}">取消</a>
						</p>
					</div>
				</div>
			</div>
			<!-- 上传广告页面样式end -->
		</div>
	</div>
</body>
</html>