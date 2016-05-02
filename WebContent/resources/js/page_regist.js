document.write(' <script src="jquery.json-2.4.js"> <\/script>')
$(document).ready(function() {
	// 获取JS传递的语言参数
	var utils = new Utils();
	var args = utils.getScriptArgs();
	// 隐藏Loading/注册失败 DIV
	$(".loading").hide();
	$(".login").hide();
	registError = $("<label class='error repeated'></label>");

	// 加载国际化语言包资源
	utils.loadProperties(args.lang);
	// 输入框激活焦点、移除焦点
	jQuery.focusblur = function(focusid) {
		var focusblurid = $(focusid);
		var defval = focusblurid.val();
		focusblurid.focus(function() {
			var thisval = $(this).val();
			if (thisval == defval) 
			{	
				$(this).val("");
			}
		});
		focusblurid.blur(function() {
			var thisval = $(this).val();
			if (thisval == "") {
				$(this).val(defval);
			}
		});
	};

	/* 下面是调用方法 */
	$.focusblur("#email");
	// 获取表单验证对象[填写验证规则]
	var validate = $("#signupForm").validate({
		rules : {
			email : {required : true,email : true},						
			username : {required : true},
			password : {required : true,minlength : 4,maxlength : 16},
			passwordAgain : {required : true,minlength : 4,maxlength : 16,equalTo : "#password"},
			contact : {required : true},
			company : {required : true},
			tel : {required : true,digits : true},
			code : {required : true,digits : true,minlength : 6,maxlength : 6}},
		messages : {
			email : {
				required : $.i18n.prop("Form.PleaseInputEmail"),
				email : $.i18n.prop("Form.PleaseInputCorrectEmail")
				},
			username : {
				required : $.i18n.prop("Form.PleaseInputUser"),
				},
			password : {
				required : $.i18n.prop("Form.PleaseInputPassword"),
				minlength : jQuery.format($.i18n.prop("Form.PasswordFormat")),
				maxlength : jQuery.format($.i18n.prop("Form.PasswordFormatMax"))
				},
			passwordAgain : {
				required : $.i18n.prop("Form.PasswordAgain"),
				minlength : jQuery.format($.i18n.prop("Form.PasswordFormat")),
				maxlength : jQuery.format($.i18n.prop("Form.PasswordFormatMax")),
				equalTo : jQuery.format($.i18n.prop("Form.PasswordDifferent"))
				},
			contact : {required : $.i18n.prop("Form.PleaseInputContact")},
			company : {required : $.i18n.prop("Form.PleaseInputCompany")},
			tel : {required : $.i18n.prop("Form.PleaseInputTel"),digits : $.i18n.prop("Form.IncorrectFormatTel")},
			code : {
				required : $.i18n.prop("Form.PleaseInputCode"),
				digits : $.i18n.prop("Form.IncorrectFormatCode"),
				minlength:$.i18n.prop("Form.CodeFormat"),
				maxlength : jQuery.format($.i18n.prop("Form.CodeFormatMax"))
				}
			}
		});
	
		// 输入框激活焦点、溢出焦点的渐变特效
		if ($("#username").val()) {
			$("#username").prev().fadeOut();
			};
			$("#username").focus(function() {
				$(this).prev().fadeOut();
			});
			$("#username").blur(function() {
				if (!$("#username").val()) {$(this).prev().fadeIn();};
			});
		
			if ($("#email").val()) {$("#email").prev().fadeOut();};
			$("#email").focus(function() {$(this).prev().fadeOut();});
			$("#email").blur(function() {if (!$("#email").val()) {$(this).prev().fadeIn();};});
		
			if ($("#password").val()) {$("#password").prev().fadeOut();};
			$("#password").focus(function() {$(this).prev().fadeOut();});
			$("#password").blur(function() {
				if (!$("#password").val()) {$(this).prev().fadeIn();};
			});
			if ($("#passwordAgain").val()) {$("#passwordAgain").prev().fadeOut();};
			$("#passwordAgain").focus(function() {$(this).prev().fadeOut();});
			$("#passwordAgain").blur(function() {if (!$("#passwordAgain").val()) {$(this).prev().fadeIn();};});
		
			if ($("#contact").val()) {$("#contact").prev().fadeOut();};
			$("#contact").focus(function() {$(this).prev().fadeOut();});
			$("#contact").blur(function() {if (!$("#contact").val()) {$(this).prev().fadeIn();};});
		
			if ($("#company").val()) {$("#company").prev().fadeOut();};
			$("#company").focus(function() {$(this).prev().fadeOut();});
			$("#company").blur(function() {if (!$("#company").val()) {$(this).prev().fadeIn();};});
		
			if ($("#tel").val()) {$("#tel").prev().fadeOut();};
			$("#tel").focus(function() {$(this).prev().fadeOut();});
			$("#tel").blur(function() {if (!$("#tel").val()) {$(this).prev().fadeIn();};});
		
			if ($("#area").val()) {$("#area").prev().fadeOut();};
			$("#area").focus(function() {$(this).prev().fadeOut();});
			$("#area").blur(function() {if (!$("#area").val()) {$(this).prev().fadeIn();};});
		
			if ($("#address").val()) {$("#address").prev().fadeOut();};
			$("#address").focus(function() {$(this).prev().fadeOut();});
			$("#address").blur(function() {if (!$("#address").val()) {$(this).prev().fadeIn();};});
		
			if ($("#code").val()) {$("#code").prev().fadeOut();};
			$("#code").focus(function() {$(this).prev().fadeOut();});
			$("#code").blur(function() {if (!$("#code").val()) {$(this).prev().fadeIn();};});
		
			// ajax提交注册信息
			$("#submit").bind("click", function() {
				//alert("点击提交");
				regist(validate);
			});
		
			$("body").each(function() {
				$(this).keydown(function() {
					if (event.keyCode == 13) {
						regist(validate);
						}
					});
			});

});
var local = document.location.pathname;
var index = local.substr(1).indexOf("/");
var contextPath = local.substr(0, index + 1);
var t = 5;
function showTime(){  
    t = t - 1;  
    $(".login").html($.i18n.prop("MSG.success")+","+t+"秒后自动调转到登录页面....");
    if(t==0){
    	window.location.href = contextPath + "/user?method=login";
    }
    //每秒执行一次,showTime()  
    setTimeout("showTime()",1000);
}  
function regist(validate) {
	// 校验Email, password，校验如果失败的话不提交
	if (validate.form()) {
		if ($("#checkBox").attr("checked")) {
			//alert("提交数据,,,,path: "+contextPath);
			var md5 = new MD5();
			var paratmeter = {
					"username" : $("#username").val(),
					"email" : $("#email").val(),
					"password" : md5.MD5($("#password").val()),
					"contact" : $("#contact").val(),
					"company_name" : $("#company").val(),
					"type" : $('input:radio[name="type"]:checked').val(),
					"mobile_number" : $("#tel").val(),
					"area" : $("#area").val(),
					"address" : $("#address").val(),
					"code" : $("#code").val()
				};
			//alert(paratmeter);
			//alert(JSON.stringify(paratmeter))
			$.ajax({
						contentType : 'application/json',
						url : contextPath + "/user?method=add",
						type : "post",
						data : JSON.stringify(paratmeter),
						dataType : "json",
						beforeSend : function() {
							$('.loading').show();
						},
						success : function(data) {
							$('.loading').hide();
							if (data.hasOwnProperty("code")) {
								if (data.code == 0) {
									// 注册成功
									$(".login").show();
									showTime();
								} else if (data.code == 1) {
									// 用户名已存在
									$(".login").html($.i18n.prop("Error.UserAlreadyExists"));
									$("#username").addClass("error");
									$("#username").after(registError);
									$("#username").next("label.repeated").text($.i18n.prop("Error.UserAlreadyExists"));
									registError.show();
								} else if (data.code == 2) {
									// 公司名已存在
									$("#company").addClass("error");
									$("#company").after(registError);
									$("#company").next("label.repeated").text($.i18n.prop("Error.CompaniesAlreadyExists"));
									registError.show();
								} else if (data.code == 3) {
									// 邮箱已经被注册
									$("#email").addClass("error");
									$("#email").after(registError);
									$("#email").next("label.repeated").text($.i18n.prop("Error.EmailAlreadyExists"));
									registError.show();
								} /*else if (data.code == 4) {
									$(".login").show();
									$(".login").html($.i18n.prop("Error.ParameterError"));
								}*/ else {
									// 系统错误
									$(".login").show();
									$(".login").html($.i18n.prop("Error.SysError"));
								}
							}
						}
					});
		} else {
			// 勾选隐私政策和服务条款
			$(".login").show();
			$(".login").html($.i18n.prop("Error.ReadAndAgree"));
		}
	}
}

var Utils = function() {
};

Utils.prototype.loadProperties = function(lang) {
	jQuery.i18n.properties({// 加载资浏览器语言对应的资源文件
		name : 'ApplicationResources',
		language : lang,
		path : 'resources/i18n/',
		mode : 'map',
		callback : function() {// 加载成功后设置显示内容
		}
	});
};

Utils.prototype.getScriptArgs = function() {// 获取多个参数
	var scripts = document.getElementsByTagName("script"),
	// 因为当前dom加载时后面的script标签还未加载，所以最后一个就是当前的script
	script = scripts[scripts.length - 1], src = script.src, reg = /(?:\?|&)(.*?)=(.*?)(?=&|$)/g, temp, res = {};
	while ((temp = reg.exec(src)) != null)
		res[temp[1]] = decodeURIComponent(temp[2]);
	return res;
};
