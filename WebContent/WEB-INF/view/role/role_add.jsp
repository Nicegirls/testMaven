<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色增加页面</title>
<%@include file="../include/header.jsp"%>
<script language="javascript" type="text/javascript">
        $(function(){
        	$(".role_off").attr("class","role_on");
        	function check(){
        		var role_name=$("[name='role_name']").val();
        		var reg=/^[0-9a-zA-Z\u4e00-\u9fa5]{1,20}$/;
        		var pri_length=$("[name='arrayprivilege']:checked").length;
        		if(reg.test(role_name)==false||role_name.length>20){
        			$("[name='role_name']").focus();
        			$("#save_result_info.save_fail").text("角色名不符合规范");
        			$("#save_result_info.save_fail").show().delay(2000).hide(300);
        			return false;
        		}
        		if(pri_length==0){
        			$("#save_result_info.save_fail").text("必须选择一个权限");
        			$("#save_result_info.save_fail").show().delay(2000).hide(300);
        			return false;
        		}
        		return true;
        	}
        	$("[value='保存']").click(function(){
        		if(!check()){
        			return;
        		}
        		$.post({
        			url:"${pageContext.request.contextPath}/role/addRole.action",
        			data:$("#form").serialize(),
        			success:function(error){
        				if(error==0){
        					$("#save_result_info.save_fail").text("保存失败");
        					$("#save_result_info.save_fail").show().delay(2000).hide(300);
        				}
        				if(error==2){
        					$("#save_result_info.save_fail").text("角色名被占用");
        					$("#save_result_info.save_fail").show().delay(2000).hide(300);
        				}
        				if(error==1){
        					$("#operate_result_info").text("保存成功");
        					$("#operate_result_info").show().delay(2000).hide(300);
        					setTimeout(function(){
       						 window.location="${pageContext.request.contextPath}/role/getAllRole.action";
       						}, 2000);
        				}
        			}
        		})
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
		<%@include file="../include/menu.jsp"%>
	</div>
	<!--导航区域结束-->
	<!--主要区域开始-->
	<div id="main">
		<!--保存操作后的提示信息：成功或者失败-->
		<div id="save_result_info" class="save_fail">保存失败,角色名不能为空或必须选择一个权限！</div>
		<div id="save_result_info" class="save_success">保存成功！</div>
		<div id="operate_result_info" class="operate_success">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                                                                  删除成功，且已删除其下属的业务账号！
        </div>
		<!--保存失败，角色名称重复！-->
		<form id="form" class="main_form">
			<div class="text_info clearfix">
				<div class="text_info clearfix">
					<span class="required" style="display:inline">*</span>
					&nbsp;角色名称：
				</div>
			</div>
			<div class="input_info">
				<input type="text" class="width200" name="role_name" onfocus="check()"/>
				<div  class="validate_msg_medium">(不能为空，且为20长度的字母、数字和汉字的组合)</div>
			</div>
			<div class="text_info clearfix">
				<div class="text_info clearfix">
					<span class="required" style="display:inline">*</span>
					&nbsp;设置权限：
				</div>
			</div>
			<div class="input_info_high">
				<div class="input_info_scroll">
					<ul>
						<c:forEach items="${privileges}" var="privilege">
							<li><input type="checkbox" value="${privilege.pri_id}"
								name="arrayprivilege" />${privilege.pri_name}</li>
						</c:forEach>
					</ul>
				</div>
				<div class="validate_msg_tiny">(至少选择一个权限)</div>
			</div>
			<div class="button_info clearfix">
				<input type="button" value="保存" class="btn_save" /> <input
					type="button" value="取消" class="btn_save"
					onclick="location.href='${pageContext.request.contextPath}/role/getAllRole.action'" />
			</div>
		</form>
	</div>
	<!--主要区域结束-->
	<div id="footer"></div>
</body>
</html>
