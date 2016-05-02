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
	function initHall(){
		//获取该用户下的场馆信息
		$.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/hall/${user.username }/listHall",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function(result) {
            	if (result.hasOwnProperty("rs")) {
            		if(result.rs==""){
            			alert("你目前还没有可用的场馆信息");//
            		}
            		else {
            			var option="";
            			$("#venue option").remove();
            			var venues= new Array();
            			venues = result.rs.split(";");
            			for (var int = 0; int < venues.length; int++) {
            				option+="<option>"+venues[int]+"</option>";
						}
            			$("#venue").append(option);	
					}
				}
            },
            error: function(error) {
            }
        });
	};
	$(document).ready(function() {
		//初始场馆
		initHall();
		
		$("#startline").date_input();
		$("#deadline").date_input();
		
		$("#listExpo").click(function(){
			$("#div").empty().load("<%=request.getContextPath()%>/expo/${user.username }/userExpo?page=1");
		});
		
		$("#back").click(function(){
			$("#div").empty().load("<%=request.getContextPath()%>/user/${user.username}/userCenter");
		});
		
		$("#save").click(function() {
			
			$("#Required_venue").css("display", "none");
			$("#Required_name").css("display", "none");
			$("#Required_startline").css("display", "none");
			$("#Required_deadline").css("display", "none");
			$("#Required_industry").css("display", "none");
			$("#Required_num").css("display", "none");
			$("#Required_organizer").css("display", "none");
			$("#Required_undertaker").css("display", "none");
			$("#Required_co_organizer").css("display", "none");
			$("#Required_expo_introduction").css("display", "none");
			$("#Required_product_area").css("display", "none");
			$("#Required_product_feature").css("display", "none");

			var flag = true;
			var date = new Date().Format("yyyy-MM-dd");
			var startline = $("#startline").val().trim();
			var deadline = $("#deadline").val().trim();
			
			if (startline == "") {
				$("#Required_startline").html("&nbsp;请输入开始日期").css("display", "block");flag = false;
			}else if (startline<date) {
				$("#Required_startline").html("&nbsp;显示日期需大于当前日期").css("display", "block");flag = false;
			}else if (deadline<startline) {
				$("#Required_deadline").html("&nbsp;截止日期需大于起始日期").css("display", "block");flag = false;
			}
			
			if ($("#name").val()=="") {
				$("#Required_name").html("&nbsp;请输入展会名称").css("display", "block");flag = false;
			}
			
			if ($("#deadline").val()=="") {
				$("#Required_deadline").html("&nbsp;请选择截止日期").css("display", "block");flag = false;
			}
			
			if ($("#organizer").val()=="") {
				$("#Required_organizer").html("&nbsp;请输入主办方").css("display", "block");flag = false;
			}
			
			if ($("#undertaker").val()=="") {
				$("#Required_undertaker").html("&nbsp;请输入承办方").css("display", "block");flag = false;
			}
			
			if ($("#industry").val()=="") {
				$("#Required_industry").html("&nbsp;请选择所属行业").css("display", "block");flag = false;
			}
			if ($("#a").val()==""||$("#b").val()==""||$("#c").val()=="") {
				
				$("#Required_num").html("&nbsp;请输入展台数量").css("display", "block");flag = false;
				
			}else if (isNaN($("#a").val())||isNaN($("#b").val())||isNaN($("#c").val())) {
				$("#Required_num").html("&nbsp;请正确输入展台数量").css("display", "block");flag = false;
			}
			
			if ($("#expo_introduction").val()=="") {
				$("#Required_expo_introduction").html("&nbsp;请输入展会简介").css("display", "block");flag = false;
			}
			
			if ($("#product_area").val()=="") {
				$("#Required_product_area").html("&nbsp;请输入展品范围").css("display", "block");flag = false;
			}
			
			if ($("#product_feature").val()=="") {
				$("#Required_product_feature").html("&nbsp;请输入展品特色").css("display", "block");flag = false;
			}
			
			
			if (!flag) {
				return;
			}
			var paratmeter = {
					"venue" : $("#venue").val(),
					"name" : $("#name").val(),
					"startline" : $("#startline").val(),
					"deadline" : $("#deadline").val(),
					"industry" : $("#industry").val(),
					"a" : $("#a").val(),
					"b" : $("#b").val(),
					"c" : $("#c").val(),
					"organizer" : $("#organizer").val(),
					"about_organizer" : $("#about_organizer").val(),
					"contact" : $("#contact").val(),
					"undertaker" : $("#undertaker").val(),
					"co_organizer" : $("#co_organizer").val(),
					"audience_require" : $("#audience_require").val(),
					"expo_introduction" : $("#expo_introduction").val(),
					"expo_description" : $("#expo_description").val(),
					"ad" : $("#ad").val(),
					"expo_price" : $("#expo_price").val(),
					"promotion" : $("#promotion").val(),
					"product_area" : $("#product_area").val(),
					"product_feature" : $("#product_feature").val()
				};
			
			$.ajax({
				contentType : "application/json",
				type : "post",
				url : "<%=request.getContextPath()%>/expo/${user.username }/update?id=${expo.id }",
				data : JSON.stringify(paratmeter),
				datatype : "json",
				async : false,
				success : function(result) {
					if (result.hasOwnProperty("code")) {
						if (result.code=="0") {
							$("#div").empty().load("<%=request.getContextPath()%>/expo/${user.username }/userExpo?page="+1);
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
									class="zthong16"><img height="9" src="" width="4">发布展会：请在这里发布您的展会信息！</span></td>
								<td width="20%" bgcolor="#f1ede3" align="right">[<a href="#" class="a1" id="listExpo">返回展会列表</a>]
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
								<td width="12%" height="21" align="center" bgcolor="#f1ede3">场馆：</td>
								<td height="21" bgcolor="#f9f9f9">&nbsp; 
									<select name="venue" id="venue" class="kuanglan">
									</select>
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_venue" style="color: Red; display: none;">请选择发布的会展场馆</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">展会名称：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="name" type="text" value='${expo.name }' id="name" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_name" style="color: Red; display: none;">请输入展会名称</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">开始日期：</td>
								<td bgcolor="#f9f9f9">&nbsp; 
								<input name="startline" type="text" value='${fn:split(expo.startline," ")[0] }' readonly="readonly" id="startline" class="kuanglan"></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_startline" style="color: Red; display: none;">请输入展会开始日期</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">截止日期：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<input name="deadline" type="text" value='${fn:split(expo.deadline," ")[0] }' readonly="readonly" id="deadline" class="kuanglan">
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_deadline" style="color: Red; display: none;">请选择截止日期</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">所属行业：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
									<select name="industry" id="industry" class="kuanglan">
										<option>工业、机械、加工</option>
										<option>汽车、交通工具</option>
										<option>IT设备、数码、软件</option>
										<option>通信、通讯、电子</option>
										<option>建筑、装潢、五金</option>
										<option>化工、能源、环保</option>
										<option>家居、家电、日用品</option>
										<option>海洋、航空、航天</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
								<font face="宋体" id="Required_industry" style="color: Red; display: none;">请选择展行业类型</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">展台数量：</td>
								<td width="766" bgcolor="#f9f9f9">
									<div>
										&nbsp;&nbsp;经济型：<input name="a" type="text" value='${expo.a }' id="a" style="width: 50px;margin-right: 4px;margin-left: 2px;" class="kuanglan">个
										&nbsp;&nbsp;标准型：<input name="b" type="text" value='${expo.b }' id="b" style="width: 50px;margin-right: 4px;margin-left: 2px;" class="kuanglan">个
										&nbsp;&nbsp;豪华型：<input name="c" type="text" value='${expo.c }' id="c" style="width: 50px;margin-right: 4px;margin-left: 2px;" class="kuanglan">个
									</div>
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_num" style="color: Red; display: none;">请输入展台数量</font>
								</td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">主办单位：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="organizer" type="text" value='${expo.organizer }' id="organizer" class="kuanglan">
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_organizer" style="color: Red; display: none;">请输入主办方</font>
								</td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">关于主办方：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="about_organizer" rows="10" cols="20" id="about_organizer" class="kuanglan" style="height: 110px;">${expo.about_organizer }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_about_organizer" style="color: Red; display: none;">请输入主办方相关信息</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">联系方式：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="contact" type="text" value='${expo.contact }' id="contact" class="kuanglan">
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_contact" style="color: Red; display: none;">请输入主办方联系方式</font>
								</td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">承办单位：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="undertaker" type="text" value='${expo.undertaker }' id="undertaker" class="kuanglan">
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_undertaker" style="color: Red; display: none;">请输入承办方</font>
								</td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">协办单位：</td>
								<td width="766" bgcolor="#f9f9f9">&nbsp; <input name="co_organizer" type="text" value='${expo.co_organizer }' id="co_organizer" class="kuanglan">
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td width="766" bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_co_organizer" style="color: Red; display: none;">请输入协办方</font>
								</td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">展会概述：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="expo_description" rows="10" cols="20" id="expo_description" class="kuanglan" style="height: 110px;">${expo.expo_description }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_expo_description" style="color: Red; display: none;">请输入展会概述</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">展会价格：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="expo_price" rows="10" cols="20" id="expo_price" class="kuanglan" style="height: 110px;">${expo.expo_price }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_expo_price" style="color: Red; display: none;">请输入展会价格信息</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">优惠活动：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="promotions" rows="10" cols="20" id="promotions" class="kuanglan" style="height: 110px;">${expo.promotions }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_promotions" style="color: Red; display: none;">请输入优惠活动</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">广告费用：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="ad" rows="10" cols="20" id="ad" class="kuanglan" style="height: 110px;">${expo.ad }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_ad" style="color: Red; display: none;">请输入广告价格</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">观众要求：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="audience_require" rows="10" cols="20" id="audience_require" class="kuanglan" style="height: 110px;">${expo.audience_require }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_audience_require" style="color: Red; display: none;">请输入观众要求</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">展会简介：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="expo_introduction" rows="10" cols="20" id="expo_introduction" class="kuanglan" style="height: 110px;">${expo.expo_introduction }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_expo_introduction" style="color: Red; display: none;">请输入简介内容</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">展品范围：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="product_area" rows="10" cols="20" id="product_area" class="kuanglan" style="height: 110px;">${expo.product_area }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_product_area" style="color: Red; display: none;">请输入展品范围</font></td>
							</tr>
							
							<tr>
								<td align="center" bgcolor="#f1ede3">展品特色：</td>
								<td bgcolor="#f9f9f9">&nbsp; <textarea name="product_feature" rows="10" cols="20" id="product_feature" class="kuanglan" style="height: 110px;">${expo.product_feature }</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1ede3"></td>
								<td bgcolor="#f9f9f9">&nbsp;
									<font face="宋体" id="Required_product_feature" style="color: Red; display: none;">请输入展品特色内容</font></td>
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