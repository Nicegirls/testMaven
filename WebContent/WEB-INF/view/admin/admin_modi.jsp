<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@include file="../include/header.jsp" %>
        <script language="javascript" type="text/javascript">
            //保存成功的提示消息
           /*  function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            } */
            $(function(){
            	var role_id ="${role_id}";
            	//alert(per_id);
            	$(".checkbox").each(function(){
            		if(isContains(role_id,this.value)){
            			this.checked=true;
            		}
            	});
            });
            function isContains(str,substr){
            	return str.indexOf(substr)>=0;
            }
            $(function() {
        		$(".admin_off").attr("class", "admin_on");
        	})
        	//前台添加验证
	$(function(){
		var check = false;
		$("#not_name").hide();
		$("#not_phonenum").hide();
		$("#not_email").hide();
		$("#not_role").hide();
		//姓名验证
		$("#adm_name").blur(function(){
			var adm_name=$("#adm_name").val();
			var psw=/^[a-zA-Z0-9\u4e00-\u9fa5]+$/;
			//var psw=/^|d{15}$/;
			if(adm_name!=""&&psw.test(adm_name)==false){
				$("#not_name").css("color","red");
				$("#not_name").text("20长度以内的汉字、字母、数字的组合!");				
				$("#not_name").show();
				check = true;
			}else if(adm_name==""){
				$("#not_name").css("color","red");
				$("#not_name").text("姓名输入为空，请输入!");				
				$("#not_name").show();
				check = true;
			}else{
				$("#not_name").hide();
				check = false;
			}
		})
		//手机号码验证
		$("#adm_phonenum").blur(function(){
			var adm_phonenum=$("#adm_phonenum").val();
			var telnum=/^[1][3,4,5,7,8][0-9]{9}$/; 
			if(adm_phonenum!=""&&telnum.test(adm_phonenum)==false){
				$("#not_phonenum").css("color","red");	
				$("#not_phonenum").text("正确的电话号码格式：手机或固话!");			
				$("#not_phonenum").show();
				check=true;
			}else if(adm_phonenum==""){
				$("#not_phonenum").css("color","red");	
				$("#not_phonenum").text("电话输入为空,请输入!");			
				$("#not_phonenum").show();
				check=true;
			}else{				
				$("#not_phonenum").hide();
				check=false;
			}
		})
		//邮箱格式验证
	    $("#adm_email").blur(function(){
	        var adm_email=$("#adm_email").val();
	       // var email=/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	        var email=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
	        if(adm_email!=""&&email.test(adm_email)==false){
	            $("#not_email").css("color","red");
	            $("#not_email").text("50长度以内，正确的 email 格式!");	     
	            $("#not_email").show();
	            check = true;
	        }else if(adm_email==""){
	        	$("#not_email").css("color","red");
	            $("#not_email").text("Email输入为空,请输入!");	     
	            $("#not_email").show();
	            check = true;
	        }else{
	            $("#not_email").hide();
	            check = false;
	             }
	    })
	    $("#btn").click(function(){
	    	var adm_name=$("#adm_name").val();
			var adm_phonenum=$("#adm_phonenum").val();
			var adm_email=$("#adm_email").val(); 
			var pri_length=$("[name='like']:checked").length;
			if((pri_length==0)){
				$("#not_role").css("color","red");
	            $("#not_role").show();
	            check = true;
			}else{
				check = false;
	            $("#not_role").hide();
			}
	    	if(check){
				return;    //验证没有通过不能提交
			}else if(adm_name==""||adm_phonenum==""||adm_email==""){
		    	$("#operate_result_info").text("请填写完整信息");
				//$("#operate_result_info").attr("class","save_fail");
				$("#operate_result_info").show().delay(2000).hide(300);           
		    }else{
		    	//alert("保存成功！");
				$("#operate_result_info").text("保存成功");
				$("#operate_result_info").show().delay(2000).hide(300);
				$("#form").submit();
			} 
	    })
	})
        </script>
    </head>
    <body>
     <%@include file="../include/info.jsp"%>
       <!--Logo区域开始-->
         <!-- <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div> -->
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <%@ include file="../include/menu.jsp"%>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
          <!--   <div id="save_result_info" class="save_success">保存成功！</div> -->
          <div id="operate_result_info" class="operate_success">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                </div>
            <form id="form" action="${pageContext.request.contextPath}/admin/updateAdmin.action" method="get" class="main_form">
                    <div class="text_info clearfix">
                    <span class="required" style="display:inline">*</span>
                    &nbsp;姓名：
                    </div>
                    <div class="input_info">
                        <input type="text" id="adm_name" value="${adminself.adm_name}" name="adm_name"/>                       
                        <span id="not_name">20长度以内的汉字、字母、数字的组合</span>
                    </div>
                    <div class="text_info clearfix">
                    <span class="required" style="display:inline">*</span>
                    &nbsp;管理员账号：
                    </div>
                    <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${adminself.adm_account}" name="adm_account"/></div>
                    <div class="text_info clearfix">
                   <span class="required" style="display:inline">*</span>
                    &nbsp;电话：
                    </div>
                    <div class="input_info">
                        <input type="text" id="adm_phonenum" value="${adminself.adm_phonenum}"  name="adm_phonenum"/>                     
                        <span id="not_phonenum">正确的电话号码格式：手机或固话</span>
                    </div>
                    <div class="text_info clearfix">
                     <span class="required" style="display:inline">*</span>
                     &nbsp;Email：
                    </div>
                    <div class="input_info">
                        <input type="text" id="adm_email" class="width200" value="${adminself.adm_email}" name="adm_email"/>                      
                        <span id="not_email">50长度以内，正确的 email 格式</span>
                    </div>
                    <div class="text_info clearfix">
                   <span class="required" style="display:inline">*</span>
                    &nbsp;角色：
                    </div>
                    <div class="input_info_high">
                        <div class="input_info_scroll">
                            <ul>
                            <c:forEach items="${role_name1}" var="role">
                            <li><input class="checkbox" type="checkbox" name="like" value="${role.role_id}"/>${role.role_name}</li>
                            </c:forEach> 
                            </ul>
                        </div>
                       
                        <div class="validate_msg_tiny error_msg" id="not_role">至少选择一个</div>
                    </div>
                    <div class="button_info clearfix">
                        <input type="button" value="保存" id="btn" class="btn_save" />
                        <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/admin/showAdmin.action'"/>
                    </div>
                    <input type="hidden" value="${adminself.adm_id}" name="adm_id" />
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
