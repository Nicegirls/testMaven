<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <jsp:include page="../include/link.jsp" flush="true"/>
        <script language="javascript" type="text/javascript">
            //修改业务信息
            $(function(){
              	$(".service_off").attr("class","service_on");
              	$("#btn").click(function(){
              		var r=window.confirm("确定修改此业务信息吗?");
              		if(r==true){
              			$.post({
              				url:'${pageContext.request.contextPath}/service/updateService2.action',
              				data:$("#form").serialize(),
              				traditional:true,
              				success:function(data){
              					if("yes"==data){
              						$("#operate_result_info").text("修改成功");
              						$("#operate_result_info").attr("class","operate_success");
              						$("#operate_result_info").show().delay(2000).hide(200);
              						window.setTimeout(function(){
              							window.location="${pageContext.request.contextPath }/service/getAllService.action"
              						},2000);
              					}else{
              						$("#operate_result_info").text("修改失败");
              						$("#operate_result_info").attr("class","operate_fail");
              						$("#operate_result_info").show().delay(2000).hide(200);
              					}
              				}
              			})
              		}
              	})
            })
            
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <%@include file="../include/info.jsp"%>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <%@include file="../include/menu.jsp" %>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <!--保存操作的提示信息-->
            <div id="save_result_info" class="save_fail">修改失败</div>
            <form id="form" action="${pageContext.request.contextPath}/service/updateService2.action" method="post" class="main_form">
                <!--必填项-->
                <div class="text_info clearfix"><span>业务账号ID：</span></div>
                <div class="input_info">
                    <input type="text" id="ser_id" name="ser_id" value="${service.ser_id}" readonly class="readonly" />
                </div>
                <div class="text_info clearfix"><span>OS 账号：</span></div>
                <div class="input_info">
                    <input type="text" id="ser_os" name="ser_os" value="${service.ser_os}" readonly class="readonly" />
                </div>
                <div class="text_info clearfix"><span>服务器 IP：</span></div>
                <div class="input_info">
                    <input type="text" id="ser_ip" name="ser_ip" value="${service.ser_ip}" readonly class="readonly" />
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                
                <div class="input_info">
                    <select class="width150" id="fee_id" name="fee_id">
                    
                    	<c:forEach items="${AllFee}" var="fee">
                    		<option value="${fee.fee_id}"> 
                    			<c:if test="${service.fee_id==fee.fee_id}">
                    				
                    			</c:if>
                    		${fee.fee_name}</option>
                    	</c:forEach>
                        
                        <option>包 40 小时</option>
                        <option>全球通</option>                     
                    </select>
                    <div class="validate_msg_long">请修改资费类型，或者取消修改操作。</div>                      
                </div>
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input id="btn" type="button" value="保存" class="btn_save" />
                    <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath }/service/getAllService.action';"/>
                </div>
                <div id="operate_result_info" class="operate_success">
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
