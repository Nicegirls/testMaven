<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="WEB-INF/view/include/header.jsp"%>
<link rel="Shortcut Icon" href="images/favicon.ico" />
<title>欢迎登录中国电信资费管理系统</title>
<style type="text/css">
	#errorcode{
		position:absolute;
		margin-left: 360px;
		margin-top: -25px;
	}
	#	user{
		position:absolute;
		margin-left: 355px;
		margin-top: 10px;
	}
</style>
<script src="../js/check.js">
	
</script>
<script type="text/javascript">
	
	$(function(){
		$("#user").hide();
		$("#errorcode").hide();
	})
	
	$(function() {
		changeImg();
	})
	//更换验证码
	function changeImg() {
		var imgSrc = $("#codeImg");
		var src = imgSrc.attr("src");
		imgSrc.attr("src", chgUrl(src));
	}

	//加入时间戳，去缓存机制   
	function chgUrl(url) {
		var timestamp = (new Date()).valueOf();
		if ((url.indexOf("&") >= 0)) {
			url = url + "&timestamp=" + timestamp;
		} else {
			url = url + "?timestamp=" + timestamp;
		}
		return url;
	}
	$(function() {
		$("#login").click(function() {
			login();
		});
		$("#body").keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == "13") {
				login();
			}
		});
	});
	function login(){
		$("#user").hide();
		$("#errorcode").hide();
		var name=$("#firstname").val();
		var psw =$("#inputPassword").val();
		var code=$("#code").val() ;
		$.post({
			url:'${pageContext.request.contextPath }/admin/login.action',
			data:{
				'adm_account':name,
				'adm_psw':psw,
				'code':code
			},
			traditional:true,
			success:function(data){
				if(data=="infonull"){
					$("#showMessage").text("用户名或密码为空");
					$("#user").show();
				}else if(data=="infoerror"){
					$("#showMessage").text("用户名或密码错误");
					$("#user").show();
				}else if(data=="infocode"){
					$("#showcode").text("验证码错误");
					$("#errorcode").show();
				}else{
					location.href='${pageContext.request.contextPath }/admin/login1.action';
				}
			}
		})
	}
	$(function(){
		$("#firstname").blur(function(){
			var adm_account = $("#firstname").val();
			$.post({
				url:"${pageContext.request.contextPath }/admin/checkAccount.action",
				data:{
					adm_account : adm_account
				},
				success:function(result){
					if(result=="yes"){
						$("#user").hide();
					}
					if(result=="no"){
						$("#showMessage").text("用户名不存在");
						$("#user").show();
					}
				}
			})
		})
	})
</script>
<style type="text/css">
#top {
	margin-top: 1%;
	margin-left: 20%;
	margin-right: 1%;
	color: white;
}
</style>
</head>
<body class="index" onload="hideTag()" id="body">
	<div id="top">
		<marquee scrollAmount=8 width="800px">
			<font size="6px">您好,欢迎来到电信资费管理系统！</font>
		</marquee>
	</div>
	<div class="container login_box" style="height: 600px;">
		<div class="row">
			<form class="form-horizontal" role="form"
				action="${pageContext.request.contextPath }/admin/login.action"
				method="post" id="loginForm">
				<div class="form-group">
					<label for="firstname" class="col-sm-3 control-label"
						style="color: #FFFFFF;"><span
						class="glyphicon glyphicon-user"></span>&nbsp;帐号</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="firstname"
							name="adm_account" placeholder="请输入帐号"  />
					</div>
					<!-- <label id="user"><font color="#FF00000" face="微软雅黑" size="2"
						id="showMessage"></font></label> -->
						<div id="user">
							<font color="#FF00000" face="微软雅黑" size="2" id="showMessage">
								用户名不存在
							</font>
						</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-3 control-label"
						style="color: #FFFFFF;"><span
						class="glyphicon glyphicon-log-in"></span>&nbsp;密码</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" id="inputPassword"
							name="adm_psw" placeholder="请输入密码">
					</div>
					<label><font color="#FF00000" face="微软雅黑" size="2">&nbsp;&nbsp;&nbsp;&nbsp;</font></label>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-3 control-label"
						style="color: #FFFFFF;">验证码</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="code" name="code"
							placeholder="验证码">
					</div>
					<!-- <label><font color="#FF00000" face="微软雅黑" size="2">&nbsp;&nbsp;&nbsp;&nbsp;啊</font></label> -->
					<img id="codeImg" alt="验证码"
						src="${pageContext.request.contextPath }/admin/code.action" /> <span
						class="glyphicon glyphicon-refresh" onclick="changeImg();"
						style="color: #FFFFFF;"></span>
					<div id="errorcode">
						<font color="#FF00000" face="微软雅黑" size="2" id="showcode">
								验证码错误
						</font>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-10">
						<a id="login"><img
							src="${pageContext.request.contextPath }/images/login_btn.png" /></a>
						<!-- <button type="submit" class="btn btn-default">登录</button> -->
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>