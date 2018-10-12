<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta>
<link type="text/css" rel="stylesheet" media="all"
	href="${pageContext.request.contextPath }/styles/global.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="${pageContext.request.contextPath }/styles/global_color.css" />
<script language="javascript" type="text/javascript">
	function changeTab(e, ulObj) {
		var obj = e.srcElement || e.target;
		if (obj.nodeName == "A") {
			var links = ulObj.getElementsByTagName("a");
			for (var i = 0; i < links.length; i++) {
				if (links[i].innerHTML == obj.innerHTML) {
					links[i].className = "tab_on";
				} else {
					links[i].className = "tab_out";
				}
			}
		}
	}
</script>
</head>
<body style="text-align:center;vertical-align:middle;">
<div style="margin-top:-20px;">
<!-- ampie script-->
  <script type="text/javascript" src="../../../components/chart/ampie_1.6.4.1/ampie/swfobject.js"></script>
  	<c:if test="${empty user }">
		<li><a href="${pageContext.request.contextPath }/jsp1/login.jsp">登录</a></li>
	</c:if>
	<c:if test="${not empty user}">
		<div id="header">
			<img src="../images/logo.png" alt="logo" class="left" />${user.userUsername}:您好
			<a href="${pageContext.request.contextPath }/user/logout.action">[退出]</a>
		</div>
	</c:if>
	<!--导航区域开始-->
	<div id="navi">
		<ul id="menu">
			<%-- <jsp:include page="/head.jsp"></jsp:include> --%>
		</ul>
	</div>
	<div id="report_main">
		<div class="tabs">
			<ul onclick="changeTab(event,this);">
				<li><a href="${pageContext.request.contextPath }/report/list.action " class="tab_on" title="每位客户每月的累计时长">客户使用时长</a></li>
				<li><a href="${pageContext.request.contextPath }/report/orderTime.action" class="tab_out" title="每台服务器上累计时长最高的前三名客户">时长排行榜</a></li>
				<li><a href="${pageContext.request.contextPath }/report/mealUse.action" class="tab_out" title="每台服务器每种资费标准的使用次数">资费使用率</a></li>
			</ul>
		</div>
	<div id="flashcontent">
		<strong>You need to upgrade your Flash Player</strong>
	</div>
	<script type="text/javascript">
		// <![CDATA[		
		var so = new SWFObject("../../../components/chart/amcolumn/amcolumn.swf", "amcolumn", "600", "300", "0", "#FFFFFF");
		so.addVariable("path", "../../../components/chart/amcolumn/");
		so.addVariable("settings_file", encodeURIComponent("amcolumn_settings.xml"));
		so.addVariable("data_file", encodeURIComponent("data.xml"));
		so.addVariable("preloader_color", "#000000");
		so.write("flashcontent");// this id must match the div id above
		// ]]>
	</script>
	</td>
</tr>
</table>	
<div id="footer"></div>
</body>
</html>
