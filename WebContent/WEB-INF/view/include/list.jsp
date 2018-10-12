<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <ul id="menu">
            <c:forEach items="${sessionScope.admin}" var="Permission">
            <c:choose>
            	<c:when test="${Permission==1}">
                <li><a href="${pageContext.request.contextPath}/view/index.jsp" class="index_on"></a></li>
                </c:when>
                <c:when test="${Permission==2}">
                <li><a href="${pageContext.request.contextPath}/ShowRoleServlet" class="role_off"></a></li>
                </c:when>
                <c:when test="${Permission==3}">
                <li><a href="${pageContext.request.contextPath}/ShowAdminServlet" class="admin_off"></a></li>
                </c:when>
                <c:when test="${Permission==4}">
                <li><a href="${pageContext.request.contextPath}/ShowExpensesServlet" class="fee_off"></a></li>
                </c:when>
                <c:when test="${Permission==5}">
                <li><a href="${pageContext.request.contextPath}/ShowUserinfoServlet" class="account_off"></a></li>
                </c:when>
                <c:when test="${Permission==6}">
                <li><a href="${pageContext.request.contextPath}/ShowBussinessServlet" class="service_off"></a></li>
                </c:when>
                <c:when test="${Permission==7}">
                <li><a href="${pageContext.request.contextPath}/view/bill/bill_list.jsp" class="bill_off"></a></li>
                </c:when>
                <c:when test="${Permission==8}">
                <li><a href="${pageContext.request.contextPath}/view/report/report_list.jsp" class="report_off"></a></li>
                </c:when>
                <c:when test="${Permission==9}">
                <li><a href="${pageContext.request.contextPath}/view/user/user_info.jsp" class="information_off"></a></li>
                </c:when>
                <c:when test="${Permission==10}">
                <li><a href="${pageContext.request.contextPath}/view/user/user_modi_pwd.jsp" class="password_off"></a></li>
                </c:when>
            </c:choose>
            </c:forEach>
            </ul>