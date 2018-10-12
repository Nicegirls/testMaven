<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <jsp:include page="../include/header.jsp" flush="true"/>
        <script language="javascript" type="text/javascript">
	        $(function(){
	        	$(".service_off").attr("class","service_on");
	        })
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <%@include file="../include/info.jsp"%>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <jsp:include page="../include/menu.jsp" flush="true"/>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <form action="" method="" class="main_form">
                <!--必填项-->
                
                <div class="text_info clearfix"><span>业务账号ID：</span></div>
                <div class="input_info"><input type="text" value="${service.ser_id}" readonly class="readonly" /></div>
                
                <div class="text_info clearfix"><span>账务账号ID：</span></div>
                <div class="input_info"><input type="text" value="${service.acc_id}" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>客户姓名：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="${service.account.acc_name}" /></div>
                <div class="text_info clearfix"><span>身份证号码：</span></div>               
                <div class="input_info"><input type="text" readonly class="readonly" value="${service.account.acc_idcard}" /></div>
              
                <div class="text_info clearfix"><span>服务器 IP：</span></div>
                <div class="input_info"><input type="text" value="${service.ser_ip}" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>OS 账号：</span></div>
                <div class="input_info"><input type="text" value="${service.ser_os}" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>状态：</span></div>
                <div class="input_info">
                    <c:choose>
                    	<c:when test="${service.ser_status==1}">
                    		<select disabled>
                        		<option selected="selected">开通</option>
                        		<option>暂停</option>
                        		<option>删除</option>
                    		</select>
                    	</c:when>
                    	<c:when test="${service.ser_status==2}">
                    		<select disabled>
                        		<option>开通</option>
                        		<option selected="selected">暂停</option>
                        		<option>删除</option>
                    		</select>
                    	</c:when>
                    	<c:when test="${service.ser_status==0}">
                    		<select disabled>
                        		<option>开通</option>
                        		<option>暂停</option>
                        		<option selected="selected">删除</option>
                    		</select>
                    	</c:when>
                    </c:choose>                        
                </div>
                <div class="text_info clearfix"><span>开通时间：</span></div>
                <div class="input_info"><input type="text" value="${service.ser_otime}" readonly class="readonly" /></div>
                
                <div class="text_info clearfix"><span>资费 ID：</span></div>
                <div class="input_info"><input type="text" value="${service.fee.fee_id}" class="readonly" readonly /></div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info"><input type="text" value="${service.fee.fee_name}" readonly class="width200 readonly" /></div>
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70 readonly" readonly>${service.fee.fee_desc}</textarea>
                </div>  
               
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick="location.href='${pageContext.request.contextPath }/service/getAllService.action';" />
                </div>
                
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
