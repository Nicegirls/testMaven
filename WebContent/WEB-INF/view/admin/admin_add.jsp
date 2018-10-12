<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员</title>
<%@include file="../include/header.jsp"%>
<script language="javascript" type="text/javascript">
	function showResultDiv(flag) {
		var divResult = document.getElementById("save_result_info");
		if (flag)
			divResult.style.display = "block";
		else
			divResult.style.display = "none";
	}
	$(function() {
		$(".admin_off").attr("class", "admin_on");
	})
	//前台添加验证
	$(function(){
		$("#not_name").hide();
		$("#not_account").hide();
		$("#not_psw").hide();
		$("#not_repsw").hide();
		$("#not_file").hide();
		$("#not_phonenum").hide();
		$("#not_email").hide();
		$("#not_role").hide();
	})
	
	$(function(){
		//姓名验证
		
		/* var adm_name=$("#adm_name").val();
		var adm_account=$("#adm_account").val();
		var adm_psw=$("#adm_psw").val();
		var adm_repsw=$("#adm_repsw").val();
		var adm_phonenum=$("#adm_phonenum").val();
		var adm_email=$("#adm_email").val(); 
		else if(adm_name==""||adm_account==""||adm_psw==""||adm_repsw==""||adm_phonenum==""||adm_email==""){
    	$("#save_result_info").text("请填写完整信息");
		$("#save_result_info").attr("class","save_fail");
		$("#save_result_info").show().delay(2000).hide(300);           
    }
		*/
		var check = false;
		$("#adm_name").blur(function(){
			var adm_name=$("#adm_name").val();
			var psw=/^[a-zA-Z0-9\u4e00-\u9fa5]+$/;
			//var psw=/^|d{15}$/;
			if(adm_name!=""&&psw.test(adm_name)==false){
				$("#not_name").css("color","red");
				$("#not_name").text("20长度以内的汉字,字母,数字的组合！");
				$("#not_name").show();
				check = true;
			}else if(adm_name==""){
				$("#not_name").css("color","red");
				$("#not_name").text("姓名输入为空，请输入！");
				$("#not_name").show();
				check = true;
			}else{
				check = false;
				$("#not_name").hide();
			}
		})
		//管理员账号验证,使用ajax验证这个管理员账号是否存在
		$("#adm_account").blur(function(){
			var adm_account=$("#adm_account").val();
			var psw=/^[A-Za-z0-9._]{3,16}$/;
			if(adm_account!=""&&psw.test(adm_account)==false){
				$("#not_account").css("color","red");
				$("#not_account").text("20长度以内的汉字,字母,数字的组合！");	
				$("#not_account").show();
				check=true;
			}else if(adm_account==""){
				$("#not_account").css("color","red");
				$("#not_account").text("管理员账号输入为空，请输入！");	
				$("#not_account").show();
				check = true;
			}else{
				check = false;
				$("#not_account").hide();
			}
			$.ajax({
				url:'${pageContext.request.contextPath}/admin/checkAdminAccount.action',
				type:'post',
				data:{
					adm_account:adm_account
				},
				success:function(data){
					if(data==1){	
						$("#not_account").css("color","red");
						$("#not_account").text("管理员账号已存在,请重新输入！");	
						$("#not_account").show();
						check=true;
					}else{
						check = false;
					}														
				}
			})
		})
		//密码验证
		$("#adm_psw").blur(function(){
			var adm_psw=$("#adm_psw").val();
			//var psw=/^[A-Za-z0-9._]{3,16}$/;
			var psw=/^\d{6,20}$/;	
			if(adm_psw!=""&&psw.test(adm_psw)==false){
				$("#not_psw").css("color","red");
				$("#not_psw").text("6~30长度以内的字母,数字和下划线组合!");
				$("#not_psw").show();
				check = true;
			}else if(adm_psw==""){
				$("#not_psw").css("color","red");
				$("#not_psw").text("密码输入为空，请输入！");
				$("#not_psw").show();
				check = true;
			}else{
				check = false;
				$("#not_psw").hide();
			}
		})
		//重复密码验证
		$("#adm_repsw").blur(function(){
			var adm_repsw=$("#adm_repsw").val();
			var adm_psw=$("#adm_psw").val();
			if(adm_psw!=adm_repsw){
				$("#not_repsw").css("color","red");
				$("#not_repsw").show();
				check = true;
			}else{
				check = false;
				$("#not_repsw").hide();
			}
		})
		//手机号码验证
		$("#adm_phonenum").blur(function(){
			var adm_phonenum=$("#adm_phonenum").val();
			var telnum =/^[1][3,4,5,7,8][0-9]{9}$/; 
			if(adm_phonenum!=""&&telnum.test(adm_phonenum)==false){
				$("#not_phonenum").css("color","red");
				$("#not_phonenum").text("正确的电话号码格式,手机或固话!");			
				$("#not_phonenum").show();
				check = true;
			}else if(adm_phonenum==""){
				$("#not_phonenum").css("color","red");
				$("#not_phonenum").text("电话输入为空,请输入!");			
				$("#not_phonenum").show();
				check = true;
			}else{
				check = false;
				$("#not_phonenum").hide();
			}
		})
		//邮箱格式验证
	    $("#adm_email").blur(function(){
	        var adm_email=$("#adm_email").val();
	        var email=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
	        if(adm_email!=""&&email.test(adm_email)==false){
	            $("#not_email").css("color","red");
	            $("#not_email").text("50长度以内,正确的email格式!");            
	            $("#not_email").show();
	            check = true;
	        }else if(adm_email==""){
	        	$("#not_email").css("color","red");
	            $("#not_email").text("Email输入为空，请输入！");            
	            $("#not_email").show();
	            check = true;
	        }else{
	        	check = false;
	            $("#not_email").hide();
	             }
	    })
	    //提交验证
	    $("#btn").click(function(){
	    	var adm_name=$("#adm_name").val();
			var adm_account=$("#adm_account").val();
			var adm_psw=$("#adm_psw").val();
			var adm_repsw=$("#adm_repsw").val();
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
			}	    	
	    	if((adm_name==""||adm_name==null)||(adm_account==""||adm_account==null)||(adm_psw==""||adm_psw==null)||(adm_repsw==""||adm_repsw==null)||(adm_phonenum==""||adm_phonenum==null)||(adm_email==""||adm_email==null)){		    	
	    		$("#operate_result_info").text("请填写完整信息!");
				$("#operate_result_info").show().delay(2000).hide(300);  
		    }else{
				$("#operate_result_info").text("保存成功");
				$("#operate_result_info").show().delay(2000).hide(300);
				$("#form").submit();
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
		<%@ include file="../include/menu.jsp"%>
	</div>
	<!--导航区域结束-->
	<!--主要区域开始-->
	<div id="main">
		<!-- <div id="save_result_info" class="save_success">保存成功！</div> -->
		<div id="operate_result_info" class="operate_success">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
        </div>
		<form
			action="${pageContext.request.contextPath}/admin/insertAdmin.action"
			method="post" class="main_form" id="form" enctype="multipart/form-data">				
			<div class="text_info clearfix">
			<span id="adm_namestar" class="required" style="display:inline">*</span>
			&nbsp;姓名:						
			</div>
			<div class="input_info">
				<input type="text" id="adm_name" name="adm_name" /> 
				<span id="not_name">20长度以内的汉字,字母,数字的组合</span>
			</div>
			<div class="text_info clearfix">
			<span id="adm_accountstar" class="required" style="display:inline">*</span>
				&nbsp;管理员账号：
			</div>
			<div class="input_info">
				<input type="text" id="adm_account" name="adm_account" /> 				
				<span id="not_account">30长度以内的字母,数字和下划线的组合</span>
			</div>
			<div class="text_info clearfix">
			<span id="adm_pswstar" class="required" style="display:inline">*</span>
				&nbsp;密码：
			</div>
			<div class="input_info">
				<input type="password" id="adm_psw" name="adm_psw" /> 				
				<span id="not_psw">6~30长度以内的字母,数字和下划线组合</span>
			</div>
			<div class="text_info clearfix">
			<span id="adm_repswstar" class="required" style="display:inline">*</span>
				&nbsp;重复密码：
			</div>
			<div class="input_info">
				<input type="password" id="adm_repsw" name="adm_repsw" /> 				
				<span id="not_repsw">两次密码必须相同</span>
			</div>
			<!-- 上传头像 -->
			<div class="text_info clearfix">
			<span id="filestar" class="required" style="display:inline">*</span>
				&nbsp;上传头像:
			</div>
			<div class="input_info">
				<input type="file" id="file" name="file"  /> 				
				<div id="not_file">图片大小400*400px</div> 
			</div>

			<div class="text_info clearfix">
			<span id="adm_phonenumstar" class="required" style="display:inline">*</span>
				&nbsp;电话：
			</div>
			<div class="input_info">
				<input type="text" id="adm_phonenum" class="width200" name="adm_phonenum" />				
				 <span id="not_phonenum">正确的电话号码格式,手机或固话</span>
			</div>
			<div class="text_info clearfix">
			<span id="adm_emailstar" class="required" style="display:inline">*</span>
				&nbsp;Email：
			</div>
			<div class="input_info">
				<input type="text" id="adm_email" class="width200" name="adm_email" /> 				
				<span id="not_email">50长度以内,正确的email格式</span>
			</div>
			<div class="text_info clearfix">
			<span id="role_namestar" class="required" style="display:inline">*</span>
				&nbsp;角色：
			</div>
			<div class="input_info_high">
				<div class="input_info_scroll">
					<ul>
						<c:forEach items="${role_name}" var="role">
							<li><input type="checkbox" name="like"
								value="${role.role_id}" />${role.role_name}</li>
						</c:forEach>
					</ul>
				</div>				
				<span id="not_role">至少选择一个</span> 
			</div>
			<div class="button_info clearfix">
				<input type="button" value="保存" id="btn" class="btn_save"/> 
				<input type="button" value="取消" onclick="location.href='${pageContext.request.contextPath}/admin/showAdmin.action'"
					class="btn_save" />
			</div>
		</form>
	</div>
	<!--主要区域结束-->
	<div id="footer"></div>
</body>
</html>
