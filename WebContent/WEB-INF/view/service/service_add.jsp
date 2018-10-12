<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <jsp:include page="../include/link.jsp" flush="true"/>
        <script language="javascript" type="text/javascript">

              $(function(){
            	  $("#notIdcard").hide();
                  $("#notAccount").hide();
                  $("#notIp").hide();
                  $("#notOs").hide();
                  $("#notPsw").hide();
                  $("#notRepsw").hide();
            	 //ip框失去焦点 验证
	            	$("#ser_ip").blur(function(){
	            		var ip=/^((25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d)))\.){3}(25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d)))$/
	            		var ser_ip1=$("#ser_ip").val();
	            		var ser_ip=ser_ip1.replace(/\s+/g,"");
	            		if(ser_ip!=""&&ip.test(ser_ip)==false){
	            			$("#notIp").css("color","red");
	            			$("#notIp").show();
	            		}else{
	            			$("#notIp").hide();
	            		}
	            		
	            	})
	            //os框失去焦点验证
            	$("#ser_os").blur(function(){
            		var os=/^[A-Za-z0-9]{3,20}$/
            		
            		var ser_os1=$("#ser_os").val();
            		var ser_os=ser_os1.replace(/\s+/g,"");
            		
            		if(ser_os!=""&&os.test(ser_os)==false){
            			$("#notOs").css("color","red");
            			$("#notOs").show();
            		}else{
            			$("#notOs").hide();
            		}
            		
            	})
            	//密码框失去焦点验证
            	$("#ser_psw").blur(function(){
            		var psw=/^[a-zA-Z0-9]\w{5,19}$/
            		var ser_psw=$("#ser_psw").val();
            	    if(ser_psw!=""&&psw.test(ser_psw)==false){
            	    	$("#notPsw").css("color","red");
            	    	$("#notPsw").show();
            	    }else{
            	    	$("#notPsw").hide();
            	    }
            	    
            	})
            	//重复密码失去焦点验证
            	$("#ser_repsw").blur(function(){
            		var ser_psw=$("#ser_psw").val();
            		var ser_repsw=$("#ser_repsw").val();
            	    if(ser_psw!=ser_repsw){
            	    	$("#notRepsw").css("color","red");
            	    	$("#notRepsw").show();
            	    }else{
            	    	$("#notRepsw").hide();
            	    }
            	})
            	//根据身份证号查询账务账号
            	$("#btn").click(function(){
            		var card= $("#acc_idcard").val();
            		$.ajax({
            			url: '${pageContext.request.contextPath}/service/getAccountByIdcard.action',
            			type: 'post',
            			data:{
            				'acc_idcard':card,
            				'acc_status':'1'
            				}, 
            			traditional:true,
            			success:function(data){
            				if(data!=null&&""!=data){
            					$("#acc_id").val(data.acc_id);
            					$("#acc_account").val(data.acc_account);
            				}else{
            					$("#acc_id").val("");
            					$("#acc_account").val("");
            					$("#notIdcard").css("color","red");
            					$("#notIdcard").show();
            				}
            			}
            		})
            	})
            	
            });
            //修改图标样式
            $(function(){
              	$(".service_off").attr("class","service_on");
            })
            
            //表单的后台验证及提交
            function sm(type){
            	if(type==3||event.keyCode==13){
            		var acc_id=$("#acc_id").val();
            		var acc_account=$("#acc_account").val();
            		var ser_os=$("#ser_os").val();
            		var ser_ip=$("#ser_ip").val();
            		var ser_psw=$("#ser_psw").val();
            		var ser_repsw=$("#ser_repsw").val();
            		if(acc_id==""||acc_account==""||ser_os==""||ser_ip==""||ser_psw==""||ser_repsw==""){
            			$("#save_result_info").text("请填写完整信息");
  						$("#save_result_info").attr("class","save_fail");
  						$("#save_result_info").show().delay(2000).hide(300);
  						return ;
            		}
            		$.post({
            			url:'${pageContext.request.contextPath}/service/checkService.action',
            			data:{
            				'acc_id':acc_id,
            				'ser_os':ser_os,
            				'ser_ip':ser_ip,
            				'ser_psw':ser_psw,
            				'ser_repsw':ser_repsw
            			},
            			traditional:true,
            			success:function(data){
            				//验证是否无误
            				if(data=="yes"){
            					$.post({
            						url:'${pageContext.request.contextPath}/service/addService2.action',
            						data:$("#form").serialize(),
            						tradition:true,
            						success:function(data){
            							//提交是否成功
            							if("yes"==data){
            								$("#operate_result_info").text("保存成功");
                      						$("#operate_result_info").attr("class","operate_success");
                      						$("#operate_result_info").show().delay(2000).hide(200);
                      						window.setTimeout(function(){
                      							window.location="${pageContext.request.contextPath }/service/getAllService.action"
                      						},1500);
            							}else{
            								$("#operate_result_info").text("保存失败");
                      						$("#operate_result_info").attr("class","operate_fail");
                      						$("#operate_result_info").show().delay(2000).hide(300);
            							}
            						}
            					})
            				//验证提示信息
            				}else{
            					if(data=="acc_iderror"){
            						$("#save_result_info").text("账务账号不可为空");
            					}else if(data=="iperror"){
            						$("#save_result_info").text("ip地址格式不符合规范");
            					}else if(data=="oshave"){
            						$("#save_result_info").text("该os账号已存在");
            					}else if(data=="oserror"){
            						$("#save_result_info").text("os账号由3~20位字母、数字组成");
            					}else if(data=="pswerror"){
            						$("#save_result_info").text("密码由6~20位字母、数字、下划线组成");
            					}else if(data=="repswerror"){
            						$("#save_result_info").text("两次密码不一致");
            					}else{
            						$("#save_result_info").text("信息不完整");
            					}
            					$("#save_result_info").attr("class","save_fail");
            					$("#save_result_info").show().delay(2000).hide(300);
            				}
            			}
            		})
            	}
            }    

        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <%@include file="../include/info.jsp"%>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            	<%@include file="../include/menu.jsp" %>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <!--保存操作的提示信息-->
            
            <div id="save_result_info" class="save_fail"></div>
            <form id="form" action="${pageContext.request.contextPath}/service/addService2.action" method="post" class="main_form">
                <!--内容项-->
                <input type="hidden" id="acc_id" name="acc_id"/>
                <div class="text_info clearfix"><span id="idcardstar" class="required" style="display:inline">*</span>&nbsp;身份证：</div>
                <div class="input_info">
                    <input type="text"  class="width180" id="acc_idcard" value="" name="acc_idcard"/>
                    <input type="button" value="查询账务账号" class="btn_search_large" id="btn"/>
                    <div id="notIdcard" class="validate_msg_short">此身份证号未激活，请重新录入</div>
                </div>
                <div class="text_info clearfix"><span id="accaccountstar" class="required" style="display:inline">*</span>&nbsp;账务账号：</div>
                <div class="input_info">
                    <input type="text" readonly class="readonly" value="" onkeyup="searchAccounts(this);" id="acc_account" name="acc_account"/>
                    <div id="notAccount" class="validate_msg_long"></div>
                </div>
                <div class="text_info clearfix"><span id="feeidstar" class="required" style="display:inline">*</span>&nbsp;资费类型：</div>
                <div class="input_info">
                    <select id="fee_id" onchange="selChange()" class="select" name="fee_id">            
                       <c:forEach items="${AllFee}" var="fee">
                       <!--  <option value="1">包 20 小时</option>
                        <option value="2">包 40 小时</option>
                        <option value="3">包 60 小时</option>
                        <option value="4">包月</option> -->
                        <option value="${fee.fee_id}">${fee.fee_name}</option>
                       </c:forEach>
                    </select>                        
                </div> 
                <div class="text_info clearfix"><span id="ipstar" class="required" style="display:inline">*</span>&nbsp;服务器 IP：</div>
                <div class="input_info">
                    <input type="text" id="ser_ip"  name="ser_ip" class="ser_ip"/>
                    <div id="notIp" class="validate_msg_long">ip地址格式不符合规范</div>
                </div>                   
                <div class="text_info clearfix"><span id="osstar" class="required" style="display:inline">*</span>&nbsp;登录 OS 账号：</div>
                <div class="input_info">
                    <input type="text" id="ser_os"  name="ser_os"/>
                    <div id="notOs" class="validate_msg_long">os账号由3~20位字母、数字组成</div>
                </div>
                <div class="text_info clearfix"><span id="pswstar" class="required" style="display:inline">*</span>&nbsp;密码：</div>
                <div class="input_info">
                    <input type="password" id="ser_psw"  name="ser_psw"/>
                    <div id="notPsw" class="validate_msg_long">密码由6~20位字母、数字、下划线组成</div>
                </div>
                <div class="text_info clearfix"><span id="repswstar" class="required" style="display:inline">*</span>&nbsp;重复密码：</div>
                <div class="input_info">
                    <input type="password" id="ser_repsw" name="ser_repsw" onkeypress="sm(2)"/>
                    <div id="notRepsw" class="validate_msg_long">两次密码不一致</div>
                </div>     
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="sm(3)"/>
                    <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath }/service/getAllService.action';"/>
                </div>
                <input type="hidden" id="acc_id" value="" name=""/>
                <div id="operate_result_info" class="operate_success">
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
