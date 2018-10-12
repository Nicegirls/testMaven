<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>角色增加页面</title>
        <%@include file="../include/header.jsp" %> 
        <script language="javascript" type="text/javascript">
        $(function(){
        	$("[value='保存']").click(function(){
        		$.post({
        			url:"${pageContext.request.contextPath}/view/role/Role_addServlet.do",
        			data:$("#form").serialize(),
        			success:function(error){
        				if(error==0){
        					$("#save_result_info.save_fail").show().delay(3000).hide(300);
        					
        				}else{
        					$("#save_result_info.save_success").show().delay(3000).hide(300);
        				}
        			}
        		})
        	})
        })
        </script>
    </head>
    <body>
       <%@include file="../include/menu.jsp" %> 
        <!--主要区域开始-->
        <div id="main">            
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_fail">保存失敗！</div>
            <div id="save_result_info" class="save_success">保存成功！</div><!--保存失败，角色名称重复！-->
            <form id="form" class="main_form">
                <div class="text_info clearfix"><span>角色名称：</span></div>
                <div class="input_info">
                    <input type="text" class="width200" name="role_name"/>
                    <span class="required">*</span>
                    <div class="validate_msg_medium">不能为空，且为20长度的字母、数字和汉字的组合</div>
                </div>                    
                <div class="text_info clearfix"><span>设置权限：</span></div>
                <div class="input_info_high">
                    <div class="input_info_scroll">
                        <ul>
                        	<c:forEach items="${privileges}" var="privilege">
                        		<li><input type="checkbox" value="${privilege.pri_id}" name="privilege"/>${privilege.pri_name}</li>
                        	</c:forEach>
                        </ul>
                    </div>
                    <span class="required">*</span>
                    <div class="validate_msg_tiny">至少选择一个权限</div>
                </div>
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" />
                    <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/view/role/Role_listServlet.do'" />
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
