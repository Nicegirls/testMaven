<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">
			<img src="${pageContext.request.contextPath}/images/logo.png" alt="logo" class="left"/>
			<font color="white"><b>${user_info.adm_name}</b></font>
			&nbsp;
			<a href="${pageContext.request.contextPath}/admin/user_info.action" style='margin-right: 10px'><img src="${pageContext.request.contextPath}/img/${user_info.adm_portrait}"alt="logo"  style='width: 50px;height:50px;border-radius:50px'/></a>
			&nbsp;
            <a href="${pageContext.request.contextPath}/admin/out.action"><span class="glyphicon glyphicon-log-out"></span>退出</a>            
</div>
