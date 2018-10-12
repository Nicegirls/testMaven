<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>资费修改</title>
        <%@include file="../include/header.jsp" %>
        <script language="javascript" type="text/javascript">
            $(function(){
            	function check(){
            		var fee_type=$("[name='fee_type']:checked").val();
            		var fee_name=$("[name='fee_name']").val();
            		var reg=/^[0-9a-zA-Z\u4e00-\u9fa5]{1,50}$/;
            		if(reg.test(fee_name)==false||fee_name.length>50){
            			$("[name='fee_name']").focus();
            			$("#save_result_info.save_fail").text("资费名不符合规范");
            			$("#save_result_info.save_fail").show().delay(3000).hide(300);
            			return false;
            		}
            		var fee_btime=$("[name='fee_btime']").val();
            		var fee_bfee=$("[name='fee_bfee']").val();
            		var fee_ufee=$("[name='fee_ufee']").val();
            		if(fee_type==2&&(fee_btime%1!=0||fee_btime<1||fee_btime>600)){
            			$("[name='fee_btime']").focus();
            			$("#save_result_info.save_fail").text("基本时长不符合规范");
            			$("#save_result_info.save_fail").show().delay(3000).hide(300);
            			return false;
            		}
            		if(fee_bfee<0||99999.99<fee_bfee){
            			$("[name='fee_bfee']").focus();
            			$("#save_result_info.save_fail").text("基本费用不符合规范");
            			$("#save_result_info.save_fail").show().delay(3000).hide(300);
            			return false;
            		}
            		if(fee_ufee<0||99999.99<fee_ufee){
            			$("[name='fee_ufee']").focus();
            			$("#save_result_info.save_fail").text("单位费用不符合规范");
            			$("#save_result_info.save_fail").show().delay(3000).hide(300);
            			return false;
            		}
            		var fee_desc=$("[name=fee_desc]").val();
            		var reg1=/^[0-9a-zA-Z\u4e00-\u9fa5]{1,100}$/;
            		if(reg.test(fee_name)==false||fee_name.length>100){
            			$("[name='fee_desc']").focus();
            			$("#save_result_info.save_fail").text("资费说明不符合规范");
            			$("#save_result_info.save_fail").show().delay(3000).hide(300);
            			return false;
            		}
            		return true;
            	}
            	$(".fee_off").attr("class","fee_on");
            	var fee_type=${fee.fee_type};
        		if(fee_type==1){
        			$("#fee_btime").hide();
        			$("#ftime").val("0");
        			$("#fee_ufee").hide();
        			$("#funitcost").val("0");
        			$("#fee_bfee").show();
        			$("#monthly").attr("checked","checked");
        		}
        		if(fee_type==2){
        			$("#fee_btime").show();;
        			$("#fee_bfee").show();
        			$("#fee_ufee").show();
        			$("#package").attr("checked","checked");
        		}
        		if(fee_type==3){
        			$("#fee_btime").hide();
        			$("#ftime").val("0");
        			$("#fee_bfee").hide();
        			$("#fcost").val("0");
        			$("#fee_ufee").show();
        			$("#timeBased").attr("checked","checked");
        		}
            	$("[name=fee_type]").click(function(){
            		var ftime=${fee.fee_btime};
            		var fcost=${fee.fee_bfee};
            		var funitcost=${fee.fee_ufee};
            		if($(this).val()==1){
            			$("#fee_btime").hide();
            			$("#ftime").val(0);
            			$("#fee_ufee").hide();
            			$("#funitcost").val(0);
            			$("#fee_bfee").show();
            			$("#fcost").val(fcost);
            		}
            		if($(this).val()==2){
            			$("#fee_btime").show();
            			$("#ftime").val(ftime);
            			$("#fee_ufee").show();
            			$("#funitcost").val(funitcost);
            			$("#fee_bfee").show();
            			$("#fcost").val(fcost);
            		}
            		if($(this).val()==3){
            			$("#fee_btime").hide();
            			$("#ftime").val(0);
            			$("#fee_ufee").show();
            			$("#funitcost").val(funitcost);
            			$("#fee_bfee").hide();
            			$("#fcost").val(0);
            		}
            	});
            	$("[value='保存']").click(function(){
            		if(!check()){
            			return;
            		}
            		$.post({
            			url:"${pageContext.request.contextPath}/fee/changeFee.action",
            			data:$("#form").serialize(),
            			success:function(error){
            				if(error==0){
            					$("#save_result_info.save_fail").text("保存失败");
            					$("#save_result_info.save_fail").show().delay(3000).hide(300);
            				}
            				if(error==2){
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
        		margin-left: 50px;
        		margin-top: -1px;
        	}
        	#timeBased{
        		position: absolute;
        		margin-left: 97px;
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
                <div class="text_info clearfix"><span>资费ID：</span></div>
                <div class="input_info"><input type="text" name="fee_id" class="readonly" readonly="readonly" value="${fee.fee_id}" /></div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info">
                    <input type="text" class="width300" name="fee_name" value="${fee.fee_name}"/>
                    <span class="required">*</span>
                    <div class="validate_msg_short">50长度的字母、数字、汉字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info fee_type">
                    <input type="radio" name="fee_type" value="1" id="monthly" />
                    <label for="monthly">&nbsp;&nbsp;&nbsp;&nbsp;包月</label>
                    <input type="radio" name="fee_type" value="2" id="package" />
                    <label for="package">&nbsp;&nbsp;&nbsp;套餐</label>
                    <input type="radio" name="fee_type" value="3" id="timeBased" />
                    <label for="timeBased">&nbsp;&nbsp;&nbsp;计时</label>
                </div>
                <div id="fee_btime">
                <div class="text_info clearfix"><span>基本时长：</span></div>
                <div class="input_info">
                    <input type="text" name="fee_btime" value="${fee.fee_btime}" id="ftime" class="width100" />
                    <span class="info">小时</span>
                    <span class="required">*</span>
                    <div class="validate_msg_long">1-600之间的整数</div>
                </div>
                </div>
                <div id="fee_bfee">
                <div class="text_info clearfix"><span>基本费用：</span></div>
                <div class="input_info">
                    <input type="text" name="fee_bfee" value="${fee.fee_bfee}" id="fcost" class="width100" />
                    <span class="info">元</span>
                    <span class="required">*</span>
                    <div class="validate_msg_long">0-99999.99之间的数值</div>
                </div>
                </div>
                <div id="fee_ufee">
                <div class="text_info clearfix"><span>单位费用：</span></div>
                <div class="input_info">
                    <input type="text" name="fee_ufee" value="${fee.fee_ufee}" id="funitcost" class="width100" />
                    <span class="info">元/小时</span>
                    <span class="required">*</span>
                    <div class="validate_msg_long">0-99999.99之间的数值</div>
                </div>   
                </div>
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70" name="fee_desc">${fee.fee_desc}</textarea>
                    <div class="validate_msg_short">100长度的字母、数字、汉字和下划线的组合</div>
                </div>    
                <input type="hidden" name="oldName" value="${fee.fee_name}"/>                 
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" />
                    <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/fee/getAllFees.action'"/>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            
        </div>
    </body>
</html>
