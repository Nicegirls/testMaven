﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <jsp:include page="../include/link.jsp" />
        <script type="text/javaScript" language="javascript">
			 $(function(){
        	 $(".account_off").attr("class","account_on");
         })
		</script>
    </head>
    <body>
        <!--Logo区域开始-->
        <%@include file="../include/info.jsp"%>
       <!--  <div id="header">
            <img src="../images/logo.png" alt="logo" class="left" />
            <a href="#">[退出]</a>            
        </div> -->
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <%@ include file="/WEB-INF/view/include/menu.jsp"%>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <form action="" method="" class="main_form">
                <!--必填项-->
               <div class="text_info clearfix"><span>账务账号ID：</span></div>
                <div class="input_info"><input type="text" value="${accc.acc_id}" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info"><input type="text" value="${accc.acc_name}" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <input type="text" value="${accc.acc_idcard}" readonly class="readonly" />
                </div>
                <div class="text_info clearfix"><span>登录账号：</span></div>
                <div class="input_info">
                    <input type="text" value="${accc.acc_account}" readonly class="readonly" />
                </div>                   
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input type="text" class="width200 readonly" readonly value="${accc.acc_telnum}" />
                </div>
                <!-- <div class="text_info clearfix"><span>推荐人账务账号ID：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="5" /></div> -->
                <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="${accc.acc_rec_idcard}" /></div>
                <div class="text_info clearfix"><span>状态：</span></div>
                <c:choose>
                <c:when test="${accc.acc_status==2}">
                <div class="input_info">
                    <select disabled>
                     	<option>暂停</option>
                        <option>开通</option>
                        <option>删除</option>
                    </select>                        
                </div>  
                </c:when>
                <c:when test="${accc.acc_status==1}">
                <div class="input_info">
                    <select disabled>
                   		<option>开通</option>
                     	<option>暂停</option>
                        <option>删除</option>
                    </select>                        
                </div>  
                </c:when>
                <c:otherwise>
                 <div class="input_info">
                    <select disabled>
                    	<option>删除</option>
                   		<option>开通</option>
                     	<option>暂停</option>   
                    </select>                        
                </div> 
                </c:otherwise>
                </c:choose>                  
                <div class="text_info clearfix"><span>开通/暂停/删除时间：</span></div>
                <c:choose>
                <c:when test="${accc.acc_status==1}">
                 <div class="input_info"><input type="text" readonly class="readonly" value="${accc.acc_ptime}" /></div>
                </c:when>
                <c:when test="${accc.acc_status==0}">
                 <div class="input_info"><input type="text" readonly class="readonly" value="${accc.acc_otime}" /></div>
                </c:when>
                <c:otherwise>
                 <div class="input_info"><input type="text" readonly class="readonly" value="${accc.acc_dtime}" /></div>
                </c:otherwise>
                </c:choose>           
                <div class="input_info"><input type="text" readonly class="readonly" value="${accc.acc_otime}" /></div>
                <div class="text_info clearfix"><span>上次登录时间：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="" /></div>
                <div class="text_info clearfix"><span>上次登录IP：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="${accc.acc_ip}" /></div>
                <!--可选项数据-->
                <div class="text_info clearfix"><span>生日：</span></div>
                <div class="input_info">
                    <input type="text" readonly class="readonly" value="" />
                </div>
                <div class="text_info clearfix"><span>Email：</span></div>
                <div class="input_info">
                    <input type="text" class="width350 readonly" readonly value="${accc.acc_email}" />
                </div> 
                <div class="text_info clearfix"><span>职业：</span></div>
                <c:choose>
                <c:when test="${accc.acc_job=='1'}">
                <div class="input_info ">
                    <select disabled>
                        <option>干部</option>
                        <option>学生</option>
                        <option>技术人员</option>
                        <option>其他</option>
                    </select>                        
                </div>
                </c:when>
                <c:when test="${accc.acc_job=='2'}">
                <div class="input_info ">
                    <select disabled>
                        <option>学生</option>
                        <option>干部</option>
                        <option>技术人员</option>
                        <option>其他</option>
                    </select>                        
                </div>
                </c:when>
                <c:when test="${accc.acc_job=='3'}">
                <div class="input_info ">
                    <select disabled>
                        <option>技术人员</option>
                        <option>学生</option>
                        <option>干部</option>
                        <option>其他</option>
                    </select>                        
                </div>
                </c:when>
                <c:otherwise>
                <div class="input_info ">
                    <select disabled>
                        <option>其他</option>
                        <option>学生</option>
                        <option>干部</option>
                        <option>技术人员</option>
                    </select>                        
                </div>
                </c:otherwise>
                </c:choose>
                <div class="text_info clearfix"><span>性别：</span></div>
                <c:choose>
                <c:when test="${accc.acc_sex==0}">
                <div class="input_info fee_type">
                    <input type="radio" name="radSex" checked="checked" id="female" disabled />
                    <label for="female">女</label>
                    <input type="radio" name="radSex" id="male" disabled />
                    <label for="male">男</label>
                </div> 
                </c:when>
                <c:otherwise>
                <div class="input_info fee_type">
                    <input type="radio" name="radSex"  id="female" disabled />
                    <label for="female">女</label>
                    <input type="radio" name="radSex" checked="checked" id="male" disabled />
                    <label for="male">男</label>
                </div> 
                </c:otherwise>
                </c:choose>
                <div class="text_info clearfix"><span>通信地址：</span></div>
                <div class="input_info"><input type="text" class="width350 readonly" readonly value="${accc.acc_address}" /></div> 
                <div class="text_info clearfix"><span>邮编：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly value="${accc.acc_email}" /></div> 
                <div class="text_info clearfix"><span>QQ：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly value="${accc.acc_qq}" /></div>                
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/account/select.action';" />
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
