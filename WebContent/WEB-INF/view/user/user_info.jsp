<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息修改</title>
<%@include file="../include/header.jsp"%>
<script language="javascript" type="text/javascript">
	//保存成功的提示信息
	function exit() {
		pageContext.forward("${pageContext.request.contextPath}/index.jsp");
	}
	$(function() {
		$(".information_off").attr("class", "information_on");
	})
	
	/* 表单验证 */
	function verify(){
		/* var reg=/^[\u0391-\uFFE5]+$/; 
		if(obj!=""&&!reg.test(obj)){
		return false; 
		} */
		return true;
	}
	//前台验证
	$(function(){
		$("#notName").hide();
		$("#notPhonenum").hide();
		$("#notEmail").hide();
		//姓名验证
		$("#adm_name").blur(function(){
			var name= /^[0-9a-zA-Z\u4e00-\u9fa5]{2,20}$/;
			var adm_name1=$("#adm_name").val();
			var adm_name=adm_name1.replace(/\s+/g,"");
			if(adm_name!=""&&name.test(adm_name)==false){
				$("#notName").css("color","red");
				$("#notName").show();
			}else{
				$("#notName").hide();
			}
		})
		//电话号码
		$("#adm_phonenum").blur(function(){
			var phonenum= /^(13[0-9]|14[0-9]|15[0-9]|16[0-9]|17[0-9]|18[0-9])\d{8}$/;
			var adm_phonenum1=$("#adm_phonenum").val();
			var adm_phonenum=adm_phonenum1.replace(/\s+/g,"");
			if(adm_phonenum!=""&&phonenum.test(adm_phonenum)==false){
				$("#notPhonenum").css("color","red");
				$("#notPhonenum").show();
			}else{
				$("#notPhonenum").hide();
			}
		})
		//邮箱
		$("#adm_email").blur(function(){
			var email= /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
			var adm_email1=$("#adm_email").val();
			var adm_email=adm_email1.replace(/\s+/g,"");
			if(adm_email!=""&&email.test(adm_email)==false){
				$("#notEmail").css("color","red");
				$("#notEmail").show();
			}else{
				$("#notEamil").hide();
			}
		})
	})
	$(function(){
		//点击保存
		$("#btn").click(function(){
			var r=window.confirm("确定修改您的信息吗?");
			if(r==true){
				var adm_name=$("#adm_name").val();
				var adm_phonenum=$("#adm_phonenum").val();
				var adm_email=$("#adm_email").val();
				$.post({
					url:'${pageContext.request.contextPath}/admin/checkUpdateUser.action',
					data:{
						'adm_name':adm_name,
						'adm_phonenum':adm_phonenum,
						'adm_email':adm_email
					},
					traditional:true,
					success:function(data){
						//信息校验不无误
						if(data=="yes"){
							$.post({
	              				url:'${pageContext.request.contextPath}/admin/updateUser.action',
	              				data:$("#form").serialize(),
	              				traditional:true,
	              				success:function(data){
	              					if("yes"==data){
	              						$("#operate_result_info").text("保存成功");
                  						$("#operate_result_info").attr("class","operate_success");
                  						$("#operate_result_info").show().delay(2000).hide(200);
                  						window.setTimeout(function(){
                  							window.location="${pageContext.request.contextPath }/admin/login1.action"
                  						},1500);
	              					}else{
	              						$("#operate_result_info").text("保存失败");
                  						$("#operate_result_info").attr("class","operate_fail");
                  						$("#operate_result_info").show().delay(2000).hide(300);
	              					}
	              				}
	              			})
						//信息校验有误
						}else{
							if(data=="name"){
								$("#save_result_info").text("姓名由2~20位汉字、数字、字母组成");
							}else if(data=="phonenum"){
								$("#save_result_info").text("手机号码不存在");
							}else if(data=="email"){
								$("#save_result_info").text("email不符合正确格式");
							}else{
								$("#save_result_info").text("数据提交格式有误");
							}
							$("#save_result_info").attr("class","save_fail");
							$("#save_result_info").show().delay(2000).hide(200);
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
	<%-- <div id="header">
		<img src="${pageContext.request.contextPath}/images/logo.png"
			alt="logo" class="left" /> <a href="#" onclick="exit()">[退出]</a>
	</div> --%>
	<!--Logo区域结束-->
	<!--导航区域开始-->
	<div id="navi">
		<%@include file="../include/menu.jsp"%>
	</div>
	<!--导航区域结束-->
	<!--主要区域开始-->
	<div id="main">
		<!--保存操作后的提示信息：成功或者失败-->
		<div id="save_result_info" class="save_success">修改成功！</div>
		<!--保存失败，数据并发错误！-->
		<form id="form" action="${pageContext.request.contextPath}/admin/updateUser.action"
			method="post" class="main_form" onsubmit="return verify()">
			<div class="text_info clearfix">
				<span>管理员账号：</span>
			</div>
			<div class="input_info">
				<input type="text" name="adm_account" readonly="readonly" class="readonly"
					disabled="disabled" value="${user_info.adm_account}" />
			</div>
			<div class="text_info clearfix">
				<span>角色：</span>
			</div>
			<div class="input_info">
				<input type="text" name="per_name" readonly="readonly" class="readonly width140"
					disabled="disabled" value="${user_info.per_name}" />
			</div>
			<div class="text_info clearfix">
				<span>姓名：</span>
			</div>
			<div class="input_info">
				<input type="text" id="adm_name" name="adm_name" value="${user_info.adm_name}" />
				<span class="required"></span>
				<div id="notName" class="validate_msg_medium">姓名由2~20位汉字、数字、字母组成</div>
			</div>
			<div class="text_info clearfix">
				<span>手机号码：</span>
			</div>
			<div class="input_info">
				<input type="text" id="adm_phonenum" name="adm_phonenum" class="width200"
					value="${user_info.adm_phonenum}" />
				<div id="notPhonenum" class="validate_msg_medium">手机号不符合规范</div>
			</div>
			<div class="text_info clearfix">
				<span>Email：</span>
			</div>
			<div class="input_info">
				<input type="text" id="adm_email" name="adm_email" class="width200"
					value="${user_info.adm_email}" />
				<div id="notEmail" class="validate_msg_medium">email不符合规范</div>
			</div>
			<div class="text_info clearfix">
				<span>创建时间：</span>
			</div>
			<div class="input_info">
				<input type="text" name="adm_create_time" readonly="readonly" class="readonly"
					disabled="disabled" value="${user_info.adm_create_time}" />
			</div>
			<div class="button_info clearfix">
				<input type="button" value="保存" class="btn_save" id="btn" /> 
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
