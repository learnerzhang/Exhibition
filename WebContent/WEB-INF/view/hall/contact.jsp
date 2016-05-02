<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<style>
<!--
#midContBG {
margin: 0px 5px 0px;
}
#midContBG h3 {
font-size: 14px;
padding-top: 10px;
border-bottom: solid 1px #dfdfdf;
padding: 12px 8px 0px;
}
.midTable {
margin: 12px 0px 8px 12px;
}
.midTable td {
	padding: 0px 5px;
	line-height: 22px;
}
-->
</style>
<div id="midContBG">
	<h3>联系方式</h3>
	<table width="95%" border="0" cellpadding="0" cellspacing="1"
		bgcolor="#EBEBEB" class="midTable">
		<tbody>
			<tr>
				<td width="15%" align="center" bgcolor="#F9F9F9">联系电话</td>
				<td width="85%" bgcolor="#FFFFFF" style="padding-left: 5px;"> 86-010-68316677</td>
			</tr>
			<tr>
				<td align="center" bgcolor="#F9F9F9">移动电话</td>
				<td bgcolor="#FFFFFF" style="padding-left: 5px;">${user.mobile_number }</td>
			</tr>
			<tr>
				<td align="center" bgcolor="#F9F9F9">联系传真</td>
				<td bgcolor="#FFFFFF" style="padding-left: 5px;"> </td>
			</tr>
			<tr>
				<td align="center" bgcolor="#F9F9F9">联系地址</td>
				<td bgcolor="#FFFFFF" style="padding-left: 5px;">${user.address }</td>
			</tr>
			<tr>
				<td align="center" bgcolor="#F9F9F9">邮政编码</td>
				<td bgcolor="#FFFFFF" style="padding-left: 5px;">${user.code }</td>
			</tr>
			<tr>
				<td align="center" bgcolor="#F9F9F9">电子邮件</td>
				<td bgcolor="#FFFFFF" style="padding-left: 5px;">${user.email }</td>
			</tr>
			<tr>
				<td align="center" bgcolor="#F9F9F9">联 系 人</td>
				<td bgcolor="#FFFFFF" style="padding-left: 5px;">${user.contact }</td>
			</tr>
			<tr>
				<td align="center" bgcolor="#F9F9F9">网 址</td>
				<td bgcolor="#FFFFFF" style="padding-left: 5px;">
					<span>待建中</span>
				</td>
			</tr>
		</tbody>
	</table>
	<h3>展馆方位图</h3>
	<table width="95%" border="0" cellpadding="0" cellspacing="1" bgcolor="#e8e8e8" class="midTable">
		<tbody>
			<tr>
				<td width="15%" bgcolor="#FFFFFF" class="midTableMap">
					<img src="resources/upload/${hall.locPic }" alt="展馆方位地图" width="441" height="291" border="0">
				</td>
			</tr>
		</tbody>
	</table>
</div>