<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="include/header.jsp"%>
<title>欢迎登录中国电信资费管理系统</title>
<script src="../js/check.js">
	
</script>
<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
			$("#loginForm").submit();
		});
		$("#body").keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == "13") {
				$("#loginForm").submit();
				///LoginAction
			}
		});
	});
</script>
</head>
<body class="index" onload="hideTag()" id="body">
	<div class="login_box">
		<form class="form-horizontal" role="form"
			action="${pageContext.request.contextPath }/login.action"
			method="post" id="loginForm">
			<div class="form-group">
				<label for="firstname" class="col-sm-3 control-label" style="color:#FFFFFF;"><span class="glyphicon glyphicon-user"></span>&nbsp;帐号</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="firstname"
						name="account" placeholder="请输入帐号">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-3 control-label" style="color:#FFFFFF;"><span class="glyphicon glyphicon-log-in"></span>&nbsp;密码</label>
				<div class="col-sm-7">
					<input type="password" class="form-control" id="inputPassword"
						name="psw" placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-3 control-label" style="color:#FFFFFF;"><span class="glyphicon glyphicon-log-in"></span>&nbsp;验证码</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="yzm"
						name="account" placeholder="验证码">
				</div>
				<div class="col-sm-7" style="float:right;">
					<img alt="验证码" id="imagecode" src="${pageContext.request.contextPath}/user/ImageServlet"/><a href="javascript:reloadCode();">看不清楚</a>
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
		<%--         <form action="${pageContext.request.contextPath }/login.action" method="post" id="loginForm">
            <table>
                <tr>
                    <td class="login_info">账号：</td>
                    <td colspan="2"><input name="account" id="account" type="text" class="width150" onblur="checkAccount()" /></td>
                    <td class="login_error_info"><span class="required">3-30长度的字母、数字和下划线</span></td>
                </tr>
                <tr>
                    <td class="login_info">密码：</td>
                    <td colspan="2"><input name="psw" type="password" class="width150" id="psw" onblur="checkPsw()" /></td>
                    <td><span class="required">6-30长度的字母、数字和下划线</span></td>
                </tr>            
				<tr>
                    <td class="login_info">验证码：</td>
                    <td class="width70"><input name="idcode" type="text" class="width70" /></td>
                    <td><img src="../images/valicode.jpg" alt="验证码" title="点击更换" /></td>  
                    <td><span class="required">验证码错误</span></td>
                </tr>                  
                <tr>
                    <td></td>
                    <td class="login_button" colspan="2">
                    	<!-- <input type="image" src="${pageContext.request.contextPath }/images/login_btn.png" style="border: 0" /> -->
                       <a id="login"><img src="${pageContext.request.contextPath }/images/login_btn.png" /></a>
                    </td>    
                    <td><span class="required">用户名或密码错误，请重试</span></td>               
                </tr>
                <tr>
            		<td colspan="2"><font color="red">${error }</font></td>
            	</tr>
            </table>
            </form> --%>
	</div>
</body>
</html>