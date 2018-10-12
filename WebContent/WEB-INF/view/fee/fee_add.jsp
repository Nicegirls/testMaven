<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>资费增加</title>
<%@include file="../include/header.jsp"%>
<script language="javascript" type="text/javascript">
        $(function(){
        	function check(){
        		var fee_type=$("[name='fee_type']:checked").val();
        		var fee_name=$("[name='fee_name']").val();
        		var reg=/^[0-9a-zA-Z\u4e00-\u9fa5]{1,50}$/;
        		if(reg.test(fee_name)==false||fee_name.length>50){
        			$("[name='fee_name']").focus();
        			$("#save_result_info.save_fail").text("资费名不符合规范");
        			$("#save_result_info.save_fail").show().delay(2000).hide(300);
        			return false;
        		}
        		var fee_btime=$("[name='fee_btime']").val();
        		var fee_bfee=$("[name='fee_bfee']").val();
        		var fee_ufee=$("[name='fee_ufee']").val();
        		if(fee_type==2&&(fee_btime%1!=0||fee_btime<1||fee_btime>600)){
        			$("[name='fee_btime']").focus();
        			$("#save_result_info.save_fail").text("基本时长不符合规范");
        			$("#save_result_info.save_fail").show().delay(2000).hide(300);
        			return false;
        		}
        		if(fee_bfee<0||99999.99<fee_bfee){
        			$("[name='fee_bfee']").focus();
        			$("#save_result_info.save_fail").text("基本费用不符合规范");
        			$("#save_result_info.save_fail").show().delay(2000).hide(300);
        			return false;
        		}
        		if(fee_ufee<0||99999.99<fee_ufee){
        			$("[name='fee_ufee']").focus();
        			$("#save_result_info.save_fail").text("单位费用不符合规范");
        			$("#save_result_info.save_fail").show().delay(2000).hide(300);
        			return false;
        		}
        		var fee_desc=$("[name=fee_desc]").val();
        		var reg1=/^[0-9a-zA-Z\u4e00-\u9fa5]{1,100}$/;
        		if(reg.test(fee_name)==false||fee_name.length>100){
        			$("[name='fee_desc']").focus();
        			$("#save_result_info.save_fail").text("资费说明不符合规范");
        			$("#save_result_info.save_fail").show().delay(2000).hide(300);
        			return false;
        		}
        		return true;
        	}
        	$(".fee_off").attr("class","fee_on");
        	$("[name=fee_type]").click(function(){
        		if($(this).val()==1){
        			$("#fee_btime").hide();
        			$("#ftime").val("0");
        			$("#fee_ufee").hide();
        			$("#funitcost").val("0");
        			$("#fee_bfee").show();
        		}
        		if($(this).val()==2){
        			$("#fee_btime").show();
        			$("#fee_ufee").show();
        			$("#fee_bfee").show();
        		}
        		if($(this).val()==3){
        			$("#fee_btime").hide();
        			$("#ftime").val("0");
        			$("#fee_ufee").show();
        			$("#fee_bfee").hide();
        			$("#fcost").val("0");
        		}
        	});
        	$("[value='保存']").click(function(){
        		if(!check()){
        			return;
        		}
        		$("[value='保存']").attr("disabled","ture");
        		$.post({
        			url:"${pageContext.request.contextPath}/fee/addFee.action",
        			data:$("#form").serialize(),
        			success:function(error){
        				if(error==0){
        					$("[value='保存']").removeAttr("disabled");
        					$("#save_result_info.save_fail").text("保存失败");
        					$("#save_result_info.save_fail").show().delay(2000).hide(300);
        				}
        				if(error==2){
        					$("[value='保存']").removeAttr("disabled");
        					$("#save_result_info.save_fail").text("资费名被占用");
        					$("#save_result_info.save_fail").show().delay(2000).hide(300);
        				}
        				if(error==1){
        					$("#operate_result_info").text("保存成功");
        					$("#operate_result_info").show().delay(2000).hide(300);
        					setTimeout(function(){
       						 window.location="${pageContext.request.contextPath}/fee/getAllFees.action";
       						}, 2000);
        				}
        			}
        		})
        	})
        })
        $(function(){
            	$(".fee_off").attr("class","fee_on");
            })
        </script>
        <style type="text/css">
        	#monthly{
        		position: absolute;
        		margin-left: 1px;
        		margin-top: -1px;
        	}
        	#package{
        		position: absolute;
        		margin-left: 48px;
        		margin-top: -1px;
        	}
        	#timeBased{
        		position: absolute;
        		margin-left: 95px;
        		margin-top: -1px;
        	}
        </style>
        
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
		<div id="save_result_info" class="save_fail">保存失敗！</div>
		<div id="save_result_info" class="save_success">保存成功！</div>
		<div id="operate_result_info" class="operate_success">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                                                                  删除成功，且已删除其下属的业务账号！
        </div>
		<form id="form" class="main_form">
			<div class="text_info clearfix">
				<span class="required" style="display:inline">*</span>
				&nbsp;资费名称：
			</div>
			<div class="input_info">
				<input type="text" class="width300" name="fee_name" /> 
				<div class="validate_msg_short">(50长度的字母、数字、汉字和下划线的组合)</div>
			</div>
			<div class="text_info clearfix">
				<span class="required" style="display:inline">*</span>
				&nbsp;资费类型：
			</div>
			<div class="input_info fee_type">
				<input type="radio" name="fee_type" value="1" id="monthly"  />
                <label for="monthly">&nbsp;&nbsp;&nbsp;&nbsp;包月</label>
                <input type="radio" name="fee_type" value="2" id="package" checked="checked"/>
                <label for="package">&nbsp;&nbsp;&nbsp;套餐</label>
                <input type="radio" name="fee_type" value="3" id="timeBased"  />
                <label for="timeBased">&nbsp;&nbsp;计时</label>
			</div>
			<div id="fee_btime">
				<div class="text_info clearfix">
					<span class="required" style="display:inline">*</span>
					&nbsp;基本时长：
				</div>
				<div class="input_info">
					<input type="text" name="fee_btime" id="ftime" class="width100" />
					<span class="info">小时</span> 
					<div class="validate_msg_long">(1-600之间的整数)</div>
				</div>
			</div>
			<div id="fee_bfee">
				<div class="text_info clearfix">
					<span class="required" style="display:inline">*</span>
					&nbsp;基本费用：
				</div>
				<div class="input_info">
					<input type="text" name="fee_bfee" id="fcost" class="width100" />
					<span class="info">元</span> 
					<div class="validate_msg_long">(0-99999.99之间的数值)</div>
				</div>
			</div>
			<div id="fee_ufee">
				<div class="text_info clearfix">
					<span class="required" style="display:inline">*</span>
					&nbsp;单位费用：
				</div>
				<div class="input_info">
					<input type="text" name="fee_ufee" id="funitcost" class="width100" />
					<span class="info">元/小时</span>
					<div class="validate_msg_long">(0-99999.99之间的数值)</div>
				</div>
			</div>
			<div class="text_info clearfix">
				<span class="required" style="display:inline">*</span>
				&nbsp;资费说明：
			</div>
			<div class="input_info_high">
				<textarea class="width300 height70" name="fee_desc"></textarea>
				<div class="validate_msg_short">(100长度的字母、数字、汉字和下划线的组合)</div>
			</div>
			<div class="button_info clearfix">
				<input type="button" value="保存" class="btn_save" /> 
				<input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/fee/getAllFees.action'" />
			</div>
		</form>
	</div>
	<!--主要区域结束-->
	<div id="footer"></div>
</body>
</html>
