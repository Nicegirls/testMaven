<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="../include/header.jsp"%>
<title>修改密码</title>
<script language="javascript" type="text/javascript">
	function exit() {
		pageContext.forward("${pageContext.request.contextPath}/index.jsp");
	}
	$(function() {
		$(".password_off").attr("class", "password_on");
	})
	//提交后验证
	$(function(){
		$("#btn").click(function(){
			var r=window.confirm("确定修改您的信息吗?");
			if(r==true){
				var oldpsw=$("#old_psw").val();
				var newpsw=$("#new_psw").val();
				var renewpsw=$("#new_repsw").val();
				
				$.post({
					url:'${pageContext.request.contextPath}/admin/checkUpdatePswUser.action',
					data:{
						'oldpsw':oldpsw,
						'newpsw':newpsw,
						'renewpsw':renewpsw
					},
					traditional:true,
					success:function(data){
						if(data=="yes"){
							$.post({
	              				url:'${pageContext.request.contextPath}/admin/updatePswUser.action',
	              				data:$("#form").serialize(),
	              				traditional:true,
	              				success:function(data){
	              					if("yes"==data){
	              						$("#operate_result_info").text("修改成功,请重新登录");
                  						$("#operate_result_info").attr("class","operate_success");
                  						$("#operate_result_info").show().delay(2000).hide(200);
	              						window.setTimeout(function(){
                  							window.location="${pageContext.request.contextPath }/login.jsp"
                  						},1500);
	              					}else{
	              						$("#operate_result_info").text("修改失败");
                  						$("#operate_result_info").attr("class","operate_fail");
                  						$("#operate_result_info").show().delay(2000).hide(300);
	              					}
	              				}
	              			})
						}else{
							if(data=="oldpsw"){
								$("#save_result_info").text("原密码不正确");
							}else if(data=="newpsw"){
								$("#save_result_info").text("新密码不符合规范");
							}else if(data=="renewpsw"){
								$("#save_result_info").text("两次密码必须相同");
							}else{
								$("#save_result_info").text("数据提交格式不规范");
							}
							$("#save_result_info").attr("class","save_fail");
							$("#save_result_info").show().delay(2000).hide(300);
						}
						
					}
				})
			}
		})
	}) 
	function showError(flag){
    	if(flag==true){
    		$("#save_result_info").show();
    	}else if(flag==false){
    		$("#save_result_info").hide();
    	}
    }
	//前台验证
	$(function(){
		$("#notOldpsw").hide();
		$("#notNewpsw").hide();
		$("#notNewrepsw").hide();
		$("#old_psw").blur(function(){
			var oldpsw= /^[0-9A-Za-z_.]{6,20}$/;
			var old_psw=$("#old_psw").val();
			if(old_psw!=""&&oldpsw.test(old_psw)==false){
				$("#notOldpsw").css("color","red");
				$("#notOldpsw").show();
			}else{
				$("#notOldpsw").hide();
			}
		})
		$("#new_psw").blur(function(){
			var newpsw= /^[0-9A-Za-z_.]{6,20}$/;
			var new_psw=$("#new_psw").val();
			if(new_psw!=""&&newpsw.test(new_psw)==false){
				$("#notNewpsw").css("color","red");
				$("#notNewpsw").show();
			}else{
				$("#notNewpsw").hide();
			}
		})
		$("#new_repsw").blur(function(){
			var new_psw=$("#new_psw").val();
			var new_repsw=$("#new_repsw").val();
			if(new_repsw!=new_psw){
				$("#notNewrepsw").css("color","red");
				$("#notNewrepsw").show();
			}else{
				$("#notNewrepsw").hide();
			}
		})
	})
</script>
</head>
<body>
 <%@include file="../include/info.jsp"%>
	<%-- <!--Logo区域开始-->
	<div id="header">
		<img src="${pageContext.request.contextPath}/images/logo.png"
			alt="logo" class="left" /> <a href="#" onclick="exit()">[退出]</a>
	</div> --%>
	<!--Logo区域结束-->
	<!--导航区域开始-->
	<div id="navi">
		<%@include file="../include/menu.jsp"%>
	</div>
	<!--导航区域结束-->
	<div id="main">
		<!--保存操作后的提示信息：成功或者失败-->
		<div id="save_result_info" class="save_success">修改成功！</div>
		<!--保存失败，旧密码错误！-->
		<form id="form" action="${pageContext.request.contextPath}/admin/updatePswUser.action"
			method="post" class="main_form">
			<div class="text_info clearfix">
			<span class="required" style="display:inline">*</span>&nbsp;旧密码：</div>
			<div class="input_info">
				<input type="password" class="width200" id="old_psw" name="oldpsw"/> 
				<div class="validate_msg_medium" id="notOldpsw">20长度以内的字母、数字和下划线的组合</div>
			</div>
			<div class="text_info clearfix">
			<span class="required" style="display:inline">*</span>&nbsp;新密码：</div>
			<div class="input_info">
				<input type="password" class="width200" name="newpsw" id="new_psw" /><span
					class="required"></span>
				<div class="validate_msg_medium" id="notNewpsw">20长度以内的字母、数字和下划线的组合</div>
			</div>
			<div class="text_info clearfix">
			<span class="required" style="display:inline">*</span>&nbsp;重复新密码：</div>
			<div class="input_info">
				<input type="password" class="width200" name="renewpsw" id="new_repsw" /><span
					class="required"></span>
				<div class="validate_msg_medium" id="notNewrepsw">两次新密码必须相同</div>
			</div>
			<div class="button_info clearfix">
				<input type="button" value="保存" class="btn_save" id="btn"  /> 
				<input type="button" value="取消" onclick="location.href='${pageContext.request.contextPath}/admin/showAdmin.action'"
					class="btn_save" />
			</div>
			<input type="hidden" name="adm_id" value="${user_info.adm_id}" />
			<div id="operate_result_info" class="operate_success">
		</form>
	</div>
	<!--主要区域结束-->
	<div id="footer"></div>
</body>
</html>
