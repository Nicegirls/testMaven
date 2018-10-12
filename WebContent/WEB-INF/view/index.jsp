<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="include/header.jsp" %>
<title>中国电信宽带资费管理</title>

<style>
	/* #time2{
	position:absolute;
	margin-left:83%;
	margin-top:3%;
	color:white;
	font-size: 18px; */
	*{margin:0;padding:0;list-style:none;border:none;}
	#zzsc{width:920px;margin:100px auto;}
	}
</style> 
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath }/js/zzsc.js">
</script> --%>
</head>
<body class="index" >
	<div  id="zzsc">
		<marquee scrollAmount=8 width="800px">
			<font size="60px" color="blue" style="bold">您好,欢迎${user_info.adm_name}来到电信资费管理系统！</font>
		</marquee>
	</div>
	<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
	<!--导航区域开始-->
	<div id="index_navi">
		<%@include file="include/menu.jsp" %>
	</div>
</body>
</html>