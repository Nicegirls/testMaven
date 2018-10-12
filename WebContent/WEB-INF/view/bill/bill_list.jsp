<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账单管理</title>
<%@include file="../include/header.jsp"%>
<script language="javascript" type="text/javascript">
	//写入下拉框中的年份和月份
	function initialYearAndMonth() {
		//写入最近3年
		var yearObj = document.getElementById("selYears");
		var year = (new Date()).getFullYear();
		for (var i = 0; i <= 2; i++) {
			var opObj = new Option(year - i, year - i);
			yearObj.options[i] = opObj;
		}
		if ("${s_year}" != "") {
			$("#selYears").val("${s_year}");
		}
		//写入12个月
		var monthObj = document.getElementById("selMonths");
		var opObj = new Option("全部", "-1");
		monthObj.options[0] = opObj;
		for (var i = 1; i <= 12; i++) {
			var opObj = new Option(i, i);
			monthObj.options[i] = opObj;
		}
		if ("${s_month}" != "") {
			$("#selMonths").val("${s_month}");
		}
	}
	function getBillByCon() {
		$("#billForm").attr("action",
				"${pageContext.request.contextPath }/bill/search.action");
		$("#billForm").submit();
		/* $.post({
			url:"${pageContext.request.contextPath }/bill/search.action",
			data:$("#billForm").serialize(),
			success:function(result){
				$("#datalist").empty();
				$("#datalist").append("<tr><th	class='width50'>账单ID</th><th	class='width70'>姓名</th><th	class='width150'>身份证</th><th	class='width150'>账务账号</th><th>费用</th><th	class='width100'>月份</th><th	class='width100'>支付方式</th><th	class='width100'>支付状态</th><th	class='width50'></th></tr>");
				$.each(result, function(index, element) {
					$("#datalist").append("<tr><td>"+element.bill_id+"</td><td>"+element.account.acc_name+"</td><td>"+element.account.acc_idcard+"</td><td>"+element.account.acc_account+"</td><td>"+element.bill_sumfee+"</td><td>"+element.bill_time+"</td><td>"+element.payWay+"</td><td>"+element.payStatus+"</td><td><a href='javascript:item("+element.bill_id+");'title='账单明细'>明细</a></td></tr>");
		        });
			}
		}) */
	}
	//跳转到item
	function item(id) {
		$("#hiddenService").attr("value", id);
		$("#billForm").submit();
	}

	$(function() {
		$(".bill_off").attr("class", "bill_on");
	})
	function sub(pageIndex) {
		var tatolPages = ${page.allPage};
		$("#pageIndex").attr("value",pageIndex);
		if (pageIndex >= 1 && tatolPages >= pageIndex) {
			//location.href = "${pageContext.request.contextPath}/bill/list.action?pageIndex="+pageIndex;
			$("#billForm").attr("action","${pageContext.request.contextPath}/bill/list.action");
			$("#billForm").submit();
		}
	}
</script>
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
		<%@include file="../include/menu.jsp"%>
	</div>
	<!--导航区域结束-->
	<!--主要区域开始-->
	<div id="main">
		<form action="${pageContext.request.contextPath }/bill/item.action"
			method="get" id="billForm">
			<!--查询-->
			<div class="search_add">
				<input type="hidden" id="hiddenService" name="bill_id" value="-1" />
				<div>
					身份证：<input type="text" name="acc_idcard" class="text_search"
						value="${s_idcard }" />
				</div>
				<div>
					账务账号：<input type="text" name="acc_account"
						class="width100 text_search" value="${s_account }" />
				</div>
				<div>
					姓名：<input type="text" name="acc_name" value="${s_name }"
						class="width70 text_search" />
				</div>
				<div>
					<select class="select_search" id="selYears" name="year">
					</select> 年 <select class="select_search" id="selMonths" name="month">
					</select> 月
				</div>
				<div>
					<input type="button" value="搜索" class="btn_search"
						onclick="getBillByCon();" />
				</div>
			</div>
			<!--数据区域：用表格展示数据-->
			<div id="data">
				<table id="datalist">
					<tr>
						<th class="width50">账单ID</th>
						<th class="width70">姓名</th>
						<th class="width150">身份证</th>
						<th class="width150">账务账号</th>
						<th>费用</th>
						<th class="width100">月份</th>
						<th class="width100">支付方式</th>
						<th class="width100">支付状态</th>
						<th class="width50"></th>
					</tr>
					<c:forEach items="${listBills }" var="bill">
						<tr>
							<td>${bill.bill_id }</td>
							<td>${bill.account.acc_name }</td>
							<td>${bill.account.acc_idcard }</td>
							<td>${bill.account.acc_account }</td>
							<td>${bill.bill_sumfee }</td>
							<td><fmt:formatDate value="${bill.bill_time}"
									pattern="yyyy年MM月" /></td>
							<td>${bill.payWay }</td>
							<td>${bill.payStatus }</td>
							<td><a href="javascript:item(${bill.bill_id});" title="账单明细">明细</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!--分页-->
			<!-- 			<div id="pages">
				<a href="#">首页</a> <a href="#">上一页</a> <a href="#"
					class="current_page">1</a> <a href="#">2</a> <a href="#">3</a> <a
					href="#">4</a> <a href="#">5</a><a href="#">下一页</a> <a href="#">末页</a>
			</div> -->
			<%-- <div id="pages">
				<c:if test="${page.nowPage>1 }">
					<a name="page" class="current_page">上一页</a>
				</c:if>
				<a name="page" value="1" class="current_page">1</a>
				<c:forEach var="item" varStatus="status" begin="2"
					end="${page.allPage}">
					<a name="page" value="${status.index}">${status.index}</a>
				</c:forEach>
				<!--                     <a name="page">下一页</a> -->
				<c:if test="${page.allPage>2}">
					<a name="page" value="2">下一页</a>
				</c:if> --%>
				<%-- <c:if test="${page.allPage==1}">
					<a name="page">下一页</a>
				</c:if> --%>
			<!-- </div> -->
			<div id="pages"> 
			<input type="hidden" id="pageIndex" name="pageIndex" value="1">
                    <a id="start" onclick="sub(1)"
                    	<c:if test="${page.nowPage==1}">
                    		class="current_page"
                    	</c:if>
                    >首页</a>
                    
        	        <a onclick="sub(${page.nowPage-1})"
        	        >上一页</a>
        	        
        	        <c:choose>
        	        <c:when test="${page.nowPage==1&&page.allPage==1}">
        	        	<a onclick="sub(1)"
	                    	<c:if test="${page.nowPage==1}">
	            				class="current_page"
	            			</c:if>
	                    >1</a>
        	        </c:when>
        	        
        	        <c:when test="${page.nowPage<=2&&page.allPage==2}">
        	        	<a onclick="sub(1)"
	                    	<c:if test="${page.nowPage==1}">
	            				class="current_page"
	            			</c:if>
	                    >1</a>
	                    <a onclick="sub(2)"
	                    	<c:if test="${page.nowPage==2}">
	            				class="current_page"
	            			</c:if>
	                    >2</a>
        	        </c:when>
        	        
        	        <c:when test="${page.nowPage<=1&&page.allPage>=3}">
	                    <a onclick="sub(1)"
	                    	<c:if test="${page.nowPage==1}">
	            				class="current_page"
	            			</c:if>
	                    >1</a>
	                    <a onclick="sub(2)"
	                    	<c:if test="${page.nowPage==2}">
	            				class="current_page"
	            			</c:if>
	                    >2</a>
	                    <a onclick="sub(3)"
	                    	<c:if test="${page.nowPage==3}">
	            				class="current_page"
	            			</c:if>
	                    >3</a>
	                </c:when>
	                
	                <c:when test="${page.nowPage>=2&&page.nowPage<=(page.allPage-1)&&page.allPage>=3}">
	                	<a onclick="sub(${page.nowPage-1})">${page.nowPage-1}</a>
	                    <a onclick="sub(${page.nowPage})" class="current_page">${page.nowPage}</a>
	                    <a onclick="sub(${page.nowPage+1})">${page.nowPage+1}</a>
	                </c:when>
	                
	                <c:when test="${page.nowPage>=page.allPage&&page.allPage>=3}">
	                	<a onclick="sub(${page.allPage-2})"
	                    	<c:if test="${page.nowPage==tatolPage-2}">
	            				class="current_page"
	            			</c:if>
	                    >${page.allPage-2}</a>
	                    <a onclick="sub(${page.allPage-1})"
	                    	<c:if test="${page.nowPage==page.allPage-1}">
	            				class="current_page"
	            			</c:if>
	                    >${page.allPage-1}</a>
	                    <a onclick="sub(${page.allPage})"
	                    	<c:if test="${page.nowPage==page.allPage}">
	            				class="current_page"
	            			</c:if>
	                    >${page.allPage}</a>
	                </c:when>
	                </c:choose>
                   
                    <a onclick="sub(${page.nowPage+1})"
                    >下一页</a>
                    <a onclick="sub(${page.allPage})"
                    	<c:if test="${page.nowPage==page.allPage}">
                    		class="current_page"
                    	</c:if>
                    >末页</a>
                    <a>共&nbsp;${page.allPage}&nbsp;页</a>
                </div> 
		</form>
	</div>
	<!--主要区域结束-->
	<div id="footer"></div>
</body>
</html>