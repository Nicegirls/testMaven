<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../include/header.jsp"%>
<script type="text/javascript">
	function detail(id){
		$("#item").attr("value",id);
		$("#billDetailForm").submit();
	}
	$(function(){
		$(".bill_off").attr("class","bill_on");
	})
		function sub(pageIndex) {
		var tatolPages = ${page.allPage};
		$("#pageIndex").attr("value",pageIndex);
		if (pageIndex >= 1 && tatolPages >= pageIndex) {
			location.href = "${pageContext.request.contextPath}/bill/item.action?pageIndex="+pageIndex+"&bill_id="+${bill.bill_id};
		}
	}
</script>
<title>明细</title>
</head>
<body onload="initialYearAndMonth();">
	<!--Logo区域开始-->
	<%@include file="../include/info.jsp"%>
	<%-- <div id="header">
		<img src="${pageContext.request.contextPath }/images/logo.png"
			alt="logo" class="left" /> <a href="#">[退出]</a>
	</div> --%>
	<!--Logo区域结束-->
	<!--导航区域开始-->
	<div id="navi">
		<ul id="menu">
			<%@ include file="../include/menu.jsp"%>
		</ul>
	</div>
	<!--导航区域结束-->
	<!--主要区域开始-->
	<div id="main">
		<form id="billDetailForm"
			action="${pageContext.request.contextPath }/bill/detail.action"
			method="get">
			<input type="hidden" name="ite_id" id="item" />
			<!--查询-->
			<div class="search_add">
				<div>
					账务账号:<span class="readonly width100">${bill.account.acc_account
						}</span>
				</div>
				<div>
					身份证:<span class="readonly width150">${bill.account.acc_idcard
						}</span>
				</div>
				<div>
					姓名:<span class="readonly width100">${bill.account.acc_name }</span>
				</div>
				<%-- <fmt:formatDate value="" pattern="yyyy-MM"/> --%>
				<div>
					计费时间:<span class="readonly width100"><fmt:formatDate
							value="${bill.bill_time }" pattern="yyyy年MM月" /></span>
				</div>
				<div>
					<%-- 总费用：<span class="readonly width70">${bill.bill_sumfee}</span> --%>
				</div>
				<input type="button" value="返回" class="btn_add"
					onclick="location.href ='${pageContext.request.contextPath}/bill/list.action';" />
			</div>
			<!--数据区域：用表格展示数据-->
			<div id="data">
				<table id="datalist">
					<tr>
						<th class="width70">明细ID</th>
						<th class="width150">OS 账号</th>
						<th class="width150">服务器 IP</th>
						<th class="width70">账务ID</th>
						<th class="width150">时长(秒)</th>
						<th>费用</th>
						<th class="width150">资费</th>
						<th class="width50"></th>
					</tr>
					<c:forEach items="${listItems }" var="item">
						<tr>
							<td>${item.ite_id }</td>
							<td>${item.service.ser_os }</td>
							<td>${item.service.ser_ip }</td>
							<td>${bill.account.acc_id }</td>
							<td>${item.ite_sumtime }</td>
							<td>${item.ite_fee }</td>
							<td>${item.fee.fee_name }</td>
							<td><a href="javascript:detail(${item.ite_id });"
								title="业务详单">详单</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!--分页-->
			<!-- <div id="pages">
				<a href="#">上一页</a> <a href="#" class="current_page">1</a> <a
					href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
				<a href="#">下一页</a>
			</div> -->
			<div id="pages">
				<a id="start" onclick="sub(1)"
					<c:if test="${page.nowPage==1}">
                    		class="current_page"
                    	</c:if>>首页</a>
				<a onclick="sub(${page.nowPage-1})">上一页</a>

				<c:choose>
					<c:when test="${page.nowPage==1&&page.allPage==1}">
						<a onclick="sub(1)"
							<c:if test="${page.nowPage==1}">
	            				class="current_page"
	            			</c:if>>1</a>
					</c:when>

					<c:when test="${page.nowPage<=2&&page.allPage==2}">
						<a onclick="sub(1)"
							<c:if test="${page.nowPage==1}">
	            				class="current_page"
	            			</c:if>>1</a>
						<a onclick="sub(2)"
							<c:if test="${page.nowPage==2}">
	            				class="current_page"
	            			</c:if>>2</a>
					</c:when>

					<c:when test="${page.nowPage<=1&&page.allPage>=3}">
						<a onclick="sub(1)"
							<c:if test="${page.nowPage==1}">
	            				class="current_page"
	            			</c:if>>1</a>
						<a onclick="sub(2)"
							<c:if test="${page.nowPage==2}">
	            				class="current_page"
	            			</c:if>>2</a>
						<a onclick="sub(3)"
							<c:if test="${page.nowPage==3}">
	            				class="current_page"
	            			</c:if>>3</a>
					</c:when>

					<c:when
						test="${page.nowPage>=2&&page.nowPage<=(page.allPage-1)&&page.allPage>=3}">
						<a onclick="sub(${page.nowPage-1})">${page.nowPage-1}</a>
						<a onclick="sub(${page.nowPage})" class="current_page">${page.nowPage}</a>
						<a onclick="sub(${page.nowPage+1})">${page.nowPage+1}</a>
					</c:when>

					<c:when test="${page.nowPage>=page.allPage&&page.allPage>=3}">
						<a onclick="sub(${page.allPage-2})"
							<c:if test="${page.nowPage==tatolPage-2}">
	            				class="current_page"
	            			</c:if>>${page.allPage-2}</a>
						<a onclick="sub(${page.allPage-1})"
							<c:if test="${page.nowPage==page.allPage-1}">
	            				class="current_page"
	            			</c:if>>${page.allPage-1}</a>
						<a onclick="sub(${page.allPage})"
							<c:if test="${page.nowPage==page.allPage}">
	            				class="current_page"
	            			</c:if>>${page.allPage}</a>
					</c:when>
				</c:choose>

				<a onclick="sub(${page.nowPage+1})">下一页</a> <a
					onclick="sub(${page.allPage})"
					<c:if test="${page.nowPage==page.allPage}">
                    		class="current_page"
                    	</c:if>>末页</a>
				<a>共&nbsp;${page.allPage}&nbsp;页</a>
			</div>
		</form>
	</div>
	<!--主要区域结束-->
	<div id="footer"></div>
</body>
</html>