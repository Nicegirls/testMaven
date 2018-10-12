<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="navi">
    <ul id="menu">
   	<c:forEach items="${sessionScope.user.listPur }" var="purview">
    	<li><a href="${pageContext.request.contextPath }/${purview.pur_url }" class="${purview.pur_class }"></a></li>
    </c:forEach>
        <li><a href="${pageContext.request.contextPath }/view/user/user_info.jsp" class="information_off"></a></li>
        <li><a href="${pageContext.request.contextPath }/view/user/user_modi_pwd.jsp" class="password_off"></a></li>
    </ul>   
</div>