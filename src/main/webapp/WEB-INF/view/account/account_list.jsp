<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@include file="../include/header.jsp"%>
        <script language="javascript" type="text/javascript">
            //删除
            function deleteAccount(acc_id) {
                var r = window.confirm("确定要删除此账务账号吗？\r\n删除后将不能恢复，且会删除其下属的所有业务账号。");
                $.ajax({
                	url:'${pageContext.request.contextPath}/controller/DelAccountController?acc_id='+acc_id,
                	type:'post',
                	success:function(){
                		$("#operate_result_info").show();
                	}
                })
            }
            //开通或暂停
            function setState() {
                var r = window.confirm("确定要开通此账务账号吗？");
                document.getElementById("operate_result_info").style.display = "block";
            }
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
           <img src="${pageContext.request.contextPath}/images/logo.png" alt="logo" class="left" />
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="${pageContext.request.contextPath}/view/index.jsp" class="index_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/controller/SelectRoleController" class="role_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/controller/SelectAdminController" class="admin_on"></a></li>
                <li><a href="${pageContext.request.contextPath}/controller/SelectAllFeeController" class="fee_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/controller/SelectAccountController" class="account_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/controller/SelectAllBussniesController" class="service_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/bill/bill_list.jsp" class="bill_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/report/report_list.jsp" class="report_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/user/user_info.jsp" class="information_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/user/user_modi_pwd.jsp" class="password_off"></a></li>
            </ul>            
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form  action="${pageContext.request.contextPath}/controller/SelectAccountByCondition" method="post">
                <!--查询-->
                <div class="search_add">                        
                    <div>身份证：<input type="text" value="" class="text_search" name="acc_idcard"/></div>                            
                    <div>姓名：<input type="text" class="width70 text_search" value="" name="acc_name"/></div>
                    <div>登录名：<input type="text"  value="" class="text_search""  name="acc_login"/></div>
                    <div>
                                                                     状态：
                        <select class="select_search" name="acc_state">
                        	<option value="全部">全部</option>
                            <option value="开通">开通</option>
                            <option value="暂停">暂停</option>
                            <option value="删除">删除</option>
                        </select>
                    </div>
                    <div><input type="submit" value="搜索" class="btn_search"  /></div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='account_add.jsp';" />
                </div>  
                <!--删除等的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                                                                      删除成功，且已删除其下属的业务账号！
                </div>   
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                    <tr>
                        <th>账号ID</th>
                        <th>姓名</th>
                        <th class="width150">身份证</th>
                        <th>登录名</th>
                        <th>状态</th>
                        <th class="width100">创建日期</th>
                        <th class="width150">上次登录时间</th>                                                        
                        <th class="width200"></th>
                    </tr>
                    
                    <c:forEach items="${acc}" var="ac">
                    <c:choose>
                    <c:when test="${ac.acc_state==0}">
                    <tr id="${ac.acc_id}">
                        <td>${ac.acc_id}</td>
                        <td><a href="${pageContext.request.contextPath}/controller/SelectAccountByIDController?acc_id=${ac.acc_id}">${ac.acc_name}</a></td>
                        <td>${ac.acc_idcard}</td>
                        <td>${ac.acc_login}</td>
                        <td>开通</td>
                        <td>${ac.acc_ctime}</td>
                        <td></td>                            
                        <td class="td_modi">
                            <input type="button" value="暂停" class="btn_pause" onclick="location.href='${pageContext.request.contextPath}/controller/ModiAccountStateController?acc_id=${ac.acc_id}&&acc_state=${ac.acc_state}';" />
                            <input type="button" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/controller/UpdateAccountController?acc_id=${ac.acc_id}';" />
                            <input type="button" value="删除" class="btn_delete" onclick="deleteAccount(${ac.acc_id});" />
                        </td>
                      </tr>
                       </c:when> 
                        <c:when test="${ac.acc_state==1}">
                      <tr id="${ac.acc_id}">
                        <td>${ac.acc_id}</td>
                        <td><a href="${pageContext.request.contextPath}/controller/SelectAccountByIDController?acc_id=${ac.acc_id}">${ac.acc_name}</a></td>
                        <td>${ac.acc_idcard}</td>
                        <td>${ac.acc_login}</td>
                        <td>暂停</td>
                        <td>${ac.acc_ctime}</td>
                        <td></td>    
                        <td class="td_modi">
                            <input type="button" value="开通" class="btn_start" onclick="location.href='${pageContext.request.contextPath}/controller/ModiAccountStateController?acc_id=${ac.acc_id}&&acc_state=${ac.acc_state}';" />
                            <input type="button" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/controller/UpdateAccountController?acc_id=${ac.acc_id}';" />
                            <input type="button" value="删除" class="btn_delete" onclick="deleteAccount(${ac.acc_id});" />
                        </td>
                      </tr>
                       </c:when>  
                       <c:otherwise>
                       <tr>
                       <td>${ac.acc_id}</td>
                        <td><a href="${pageContext.request.contextPath}/controller/SelectAccountByIDController?acc_id=${ac.acc_id}">${ac.acc_name}</a></td>
                        <td>${ac.acc_idcard}</td>
                        <td>${ac.acc_login}</td>
                        <td>删除</td>
                        <td>${ac.acc_ctime}</td>
                        <td></td>                               
                        <td class="td_modi">
                        </td>
                    </tr>
                       </c:otherwise>
                    </c:choose>
                    </c:forEach>
                    
                </table>
                <p>业务说明：<br />
                1、创建则开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、暂停账务账号，同时暂停下属的所有业务账号；<br />                
                6、暂停后重新开通账务账号，并不同时开启下属的所有业务账号，需要在业务账号管理中单独开启；<br />
                7、删除账务账号，同时删除下属的所有业务账号。</p>
                </div>                   
                <!--分页-->
                <div id="pages">
                    <a href="#">首页</a>
        	        <a href="#">上一页</a>
                    <a href="#" class="current_page">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">下一页</a>
                    <a href="#">末页</a>
                </div>                    
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            
        </div>
    </body>
</html>
