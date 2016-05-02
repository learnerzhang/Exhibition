<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广告-有点</title>
<link rel="stylesheet" type="text/css" href="../css/css.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="js/page.js" ></script> -->
<style type="text/css">
	#pageGro{ width:400px; height:25px; margin:0px auto; padding-top:30px;}
	#pageGro div,#pageGro div ul li{ font-size:12px; color:#999; line-height:23px; float:left; margin-left:5px;}
	#pageGro div ul li{ width:22px; text-align:center; border:1px solid #999; cursor:pointer;}
	#pageGro div ul li.on{ color:#fff; background:#3c90d9; border:1px solid #3c90d9;}
	#pageGro .pageUp,#pageGro .pageDown{ width:63px; border:1px solid #999; cursor:pointer;text-align: center;}
</style>
<script type="text/javascript">
// 广告弹出框

function initSelect(){
	$("#pageList option").remove();
	var option="";
	for (var i = 0; i <"${page.totalPage }"; i++) {
		if ((i+1)=="${page.currentPage }") {
			option+="<option selected='selected'>"+(i+1)+"</option>";
		}else {
			option+="<option>"+(i+1)+"</option>";
		}
	}
	$("#pageList").append(option);
}

$(function(){
	initSelect();
	var id = 0;
	$(".close").click(function(){
	  $(".banDel").hide();
	});
	$(".no").click(function(){
	  $(".banDel").hide();
	});
	$(".delban").click(function(){
		id = $(this).attr("id");
		 $(".banDel").show();
	});
	$(".yes").click(function(){
		  $(".banDel").hide();
		  $.ajax({
				contentType: "application/json;charset=utf-8",
				url : "<%=request.getContextPath()%>/sys/index/delMsg?id="+id,
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.hasOwnProperty("code")) {
						if (data.code == "0") {
							window.location.href = "<%=request.getContextPath() %>/sys/index/msg?page=1";//当前广告页面...
						} else if (data.code == "1") {
							alert("网络异常请稍后再试....");
						} 
					}
				}
		});	
	});
	
	 $("#pageList").change(function(){
			var page = $("#pageList option:selected").val();
			self.location="<%=request.getContextPath()%>/sys/index/msg?page="+page;
		});
	  
	  $("#prev").click(function(){
			var flag = "${page.hasPrePage }";
			var page = "${page.currentPage-1 }";
			if (flag=="true") {
				self.location="<%=request.getContextPath()%>/sys/index/msg?page="+page;
			}
		});
		$("#next").click(function(){
			var flag = "${page.hasNextPage }";
			var page = "${page.currentPage+1 }";
			if (flag=="true") {
				self.location="<%=request.getContextPath()%>/sys/index/msg?page="+page;
			}
		});	
})
// 广告弹出框 end

function del(){
    var input=document.getElementsByName("check[]");
    for(var i=input.length-1; i>=0;i--){
       if(input[i].checked==true){
           //获取td节点
           var td=input[i].parentNode;
          //获取tr节点
          var tr=td.parentNode;
          //获取table
          var table=tr.parentNode;
          //移除子节点
          table.removeChild(tr);
        }
    }     
}
</script>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="../img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp;-</span>&nbsp;通知管理
			</div>
		</div>
		<div class="page">
			<!-- banner页面样式 -->
			<div class="banner">
				<div class="add">
					<a class="addA" href="<%=request.getContextPath() %>/sys/index/msgAdd">发布通知&nbsp;&nbsp;+</a>
				</div>
				<!-- banner 表格 显示 -->
				<div class="banShow">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="66px" class="tdColor tdC">序号</td>
							<td width="315px" class="tdColor">标题</td>
							<td width="308px" class="tdColor">内容</td>
							<td width="125px" class="tdColor">操作</td>
						</tr>
						<c:forEach items="${msgs }" var="msg" varStatus="status">
							<tr>
							<td>${status.index+1+page.beginIndex }</td>
							<%-- <td><div class="bsImg">
									<img src="<%=request.getContextPath()%>/resources/upload/${adimage.path}">
								</div></td> --%>
							<td>${msg.title }</td>
							<%-- <td><a class="bsA" href="#">${adimage.href }</a></td> --%>
							<%-- <td>${adimage.status }</td> --%>
							<td>${msg.context }</td>
							<td>
							<a href="<%=request.getContextPath()%>/sys/index/updateMsg?id=${msg.id }"> <img class="operation" src="../img/update.png">
							</a>
							<img id="${msg.id }" class="operation delban" src="../img/delete.png"></td>
						</tr>
						</c:forEach>
					</table>
					<div class="paging">
						<div id="pageGro" class="cb">
							<div class="pageList">
						        	<font color="black" size="12px;">[共有${page.totalCount }条记录 页:${page.currentPage }/${page.totalPage }]</font>
						    </div>
							<div class="pageUp" id="prev">上一页</div>
						    <div class="pageDown" id="next">下一页</div>
						    <div class="pageList">
						        	<font color="black" size="12px;">跳到 &nbsp;<select id="pageList"><option>1</option></select> &nbsp; 页</font>
						    </div>
						</div>
					</div>
				</div>
				<!-- banner 表格 显示 end-->
			</div>
			<!-- banner页面样式end -->
		</div>

	</div>


	<!-- 删除弹出框 -->
	<div class="banDel">
		<div class="delete">
			<div class="close">
				<a><img src="../img/shanchu.png" /></a>
			</div>
			<p class="delP1">你确定要删除此条记录吗？</p>
			<p class="delP2">
				<a href="#" class="ok yes" onclick="del()">确定</a><a class="ok no">取消</a>
			</p>
		</div>
	</div>
	<!-- 删除弹出框  end-->
</body>
</html>