<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <img src="D:/java/javawork/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/net111/WEB-INF/img/1.jpg" alt="logo" class="left"/> -->
<div id="navi">
    <ul id="menu">
    <%-- <li><a href="${pageContext.request.contextPath}/admin/index.action" class="index_off"></a></li> --%>
   	<c:forEach items="${adminPri}" var="Privilege">
    	<li><a href="${pageContext.request.contextPath}/${Privilege.pri_url}" class="${Privilege.pri_class}"></a></li>
    </c:forEach>
        <%-- <li><a href="${pageContext.request.contextPath}/admin/user_info.action" class="information_off"></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/user_modi_pwd.action" class="password_off"></a></li>      --%>
    </ul>   
</div>