<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/global_color.css" />
        <jsp:include page="../include/link.jsp" flush="true"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
        <script language="javascript" type="text/javascript">
      //保存成功的提示信息
        function showResult() {
        	$.ajax({
        		url:'${pageContext.request.contextPath}/account/check.action',
        		type:'post',
        		data:$("#myform").serialize(),
        		success:function(data){
        			if("true"==data){
            			$.ajax({
            				url:'${pageContext.request.contextPath}/account/add.action',
            				type:'post',
            				data:$("#myform").serialize(),
            				success:function(data){
            					if("true"==data){
            						$("#operate_result_info").show().delay(2000).hide(300);
            						window.setTimeout(function(){
            							window.location="${pageContext.request.contextPath}/account/select.action";
            						},2000);
            					}else{
            						/* showResultDiv1(true);
                        			window.setTimeout("showResultDiv1(false);", 2000); */
                        			$("#operate_result_info").text("添加失败！");
            						$("#operate_result_info").show().delay(2000).hide(300);
            					}
            				}
            			})
        			}else{
        				if("3"==data){
        					$("#save_result_info1").text("姓名不能为空！");
            				//showResultDiv1(true);
                			//window.setTimeout("showResultDiv1(false);", 2000);
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("s"==data){
        					$("#save_result_info1").text("姓名由2~6位汉字组成！");
            				//showResultDiv1(true);
                			//window.setTimeout("showResultDiv1(false);", 2000);
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("33"==data){
        					$("#save_result_info1").text("身份证号码不能为空！");
            				//showResultDiv1(true);
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("1"==data){
        					$("#save_result_info1").text("身份证号码有误！");
            				//showResultDiv1(true);
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("333"==data){
        					$("#save_result_info1").text("账号不能为空！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("11"==data){
        					$("#save_result_info1").text("账号由3~20位字母、数字组成！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("3333"==data){
        					$("#save_result_info1").text("密码不能为空！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("111"==data){
        					$("#save_result_info1").text("密码由6~60位字母、数字、下划线组成！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("1111"==data){
        					$("#save_result_info1").text("两次密码不一致！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("33333"==data){
        					$("#save_result_info1").text("手机号码不能为空！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("11111"==data){
        					$("#save_result_info1").text("手机号码不存在！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("111111"==data){
        					$("#save_result_info1").text("身份证号由15或18位数字组成，可x结尾！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("1111111"==data){
        					$("#save_result_info1").text("email不符合规范！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("11111111"==data){
        					$("#save_result_info1").text("邮政编码由6位数字组成！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("2"==data){
        					$("#save_result_info1").text("5到13位数字！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        			}
        		}
        	})
        }
        function showResultDiv(flag) {
            if (flag)
            	$("#save_result_info").show();
            else
            	$("#save_result_info").hide();
        }
        function showResultDiv1(flag) {
            if (flag)
            	$("#save_result_info1").show();
            else
            	$("#save_result_info1").hide();
        }

            //显示选填的信息项
            function showOptionalInfo(imgObj) {
                var div = document.getElementById("optionalInfo");
                if (div.className == "hide") {
                    div.className = "show";
                    imgObj.src = "${pageContext.request.contextPath}/images/hide.png";
                }
                else {
                    div.className = "hide";
                    imgObj.src = "${pageContext.request.contextPath}/images/show.png";
                }
            }
		    
            $(function(){
           	 $(".account_off").attr("class","account_on");
            })
            
            
            //前台添加验证
            $(function(){
            	$("#not_name").hide();
            	$("#not_idcard").hide();
            	$("#not_account").hide();
            	$("#not_psw").hide();
            	$("#not_repsw").hide();
            	$("#not_telnum").hide();
            	$("#not_reidcard ").hide();
            	$("#not_email").hide();
            	$("#not_address").hide();
            	$("#not_postcode").hide();
            	$("#not_qq").hide();
            })
            $(function(){
            	//姓名验证
            	$("#acc_name").blur(function(){
            		var acc_name1=$("#acc_name").val();
            		var name=/^[\u4e00-\u9fa5]{2,6}$/;
            		var acc_name=acc_name1.replace(/\s+/g,"");
            		if(acc_name!=""&&name.test(acc_name)==false){
            			$("#not_name").css("color","red");
            			$("#not_name").show();
            		}else{
            			$("#not_name").hide();
            		}
            	})
            	//身份证验证
            	$("#acc_idcard").blur(function(){
            		var acc_idcard1=$("#acc_idcard").val();
            		//var idcard=/^[1-9](\d{13}|\d{16})[0-9Xx]$/;
            		var idcard=/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
            		var acc_idcard=acc_idcard1.replace(/\s+/g,"");
            		if(acc_idcard!=""&&idcard.test(acc_idcard)==false){
            			$("#not_idcard").css("color","red");
            			$("#not_idcard").show();
            		}else{
            			$("#not_idcard").hide();
            		}
            	})
            	//账务账号验证
            	$("#acc_account").blur(function(){
            		var acc_account1=$("#acc_account").val();
            		var account=/^[A-Za-z0-9]{3,20}$/;
            		var acc_account=acc_account1.replace(/\s+/g,"");
            		if(acc_account!=""&&account.test(acc_account)==false){
            			$("#not_account").css("color","red");
            			$("#not_account").show();
            		}else{
            			$("#not_account").hide();
            		}
            	})
            	//密码验证
            	$("#acc_psw").blur(function(){
            		var acc_psw=$("#acc_psw").val();
            		var psw=/^[a-zA-Z0-9]\w{5,19}$/;
            		if(acc_psw!=""&&psw.test(acc_psw)==false){
            			$("#not_psw").css("color","red");
            			$("#not_psw").show();
            		}else{
            			$("#not_psw").hide();
            		}
            	})
            	//重复密码验证
            	$("#acc_repsw").blur(function(){
            		var acc_repsw=$("#acc_repsw").val();
            		var acc_psw=$("#acc_psw").val();
            		if(acc_psw!=acc_repsw){
            			$("#not_repsw").css("color","red");
            			$("#not_repsw").show();
            		}else{
            			$("#not_repsw").hide();
            		}
            	})
            	//手机号码验证
            	$("#acc_telnum").blur(function(){
            		var acc_telnum1=$("#acc_telnum").val();
            		var telnum=/^(13[0-9]|14[0-9]|15[0-9]|16[0-9]|17[0-9]|18[0-9]|19[0-9])\d{8}$/;
            		var acc_telnum=acc_telnum1.replace(/\s+/g,"");
            		if(acc_telnum!=""&&telnum.test(acc_telnum)==false){
            			$("#not_telnum").css("color","red");
            			$("#not_telnum").show();
            		}else{
            			
            			$("#not_telnum").hide();
            		}
            	})
            	//身份证号码验证
            	$("#acc_reidcard").blur(function(){
            		var acc_reidcard1=$("#acc_reidcard").val();
            		var reidcard=/^[1-9](\d{13}|\d{16})[0-9Xx]$/;
            		var acc_reidcard=acc_reidcard1.replace(/\s+/g,"");
            		if(acc_reidcard!=""&&reidcard.test(acc_reidcard)==false){
            			$("#not_reidcard").css("color","red");
            			$("#not_reidcard").show();
            		}else{
            			$("#not_reidcard").hide();
            		}
            	})
            	//邮箱格式验证
            	$("#acc_email").blur(function(){
            		var acc_email1=$("#acc_email").val();
            		var email=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            		var acc_email=acc_email1.replace(/\s+/g,"");
            		if(acc_email!=""&&email.test(acc_email)==false){
            			$("#not_email").css("color","red");
            			$("#not_email").show();
            		}else{
            			$("#not_email").hide();
            		}
            	})
            	//邮政编码验证
            	$("#acc_postcode").blur(function(){
            		var acc_postcode1=$("#acc_postcode").val();
            		var postcode=/^[1-9]\d{5}(?!\d)$/;
            		var acc_postcode=acc_postcode1.replace(/\s+/g,"");
            		if(acc_postcode!=""&&postcode.test(acc_postcode)==false){
            			$("#not_postcode").css("color","red");
            			$("#not_postcode").show();
            		}else{
            			$("#not_postcode").hide();
            		}
            	})
            	//qq验证
            	$("#acc_qq").blur(function(){
            		var acc_qq1=$("#acc_qq").val();
            		var qq=/^[1-9][0-9]{4,}$/;
            		var acc_qq=acc_qq1.replace(/\s+/g,"");
            		if(acc_qq!=""&&qq.test(acc_qq)==false){
            			$("#not_qq").css("color","red");
            			$("#not_qq").show();
            		}else{
            			$("#not_qq").hide();
            		}
            	})
            })
        </script>
        
     
    </head>
    <body>
        <!--Logo区域开始-->
        <%@include file="../include/info.jsp"%>
       <!--  <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div> -->
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <%@ include file="/WEB-INF/view/include/menu.jsp"%>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">       
            <!--保存成功或者失败的提示消息-->     
            <div id="save_result_info1" class="save_fail">保存失败！</div>
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form  class="main_form" id="myform" action="${pageContext.request.contextPath}/account/add.action" method="post">
                <!--必填项-->
               
                <div class="text_info clearfix"><span class="required"  style="display:inline">*</span>&nbsp;姓名</div>
                <div class="input_info">
                    <input id="acc_name" type="text" value=""  name="acc_name"/>
                    <div class="validate_msg_long" id="not_name">姓名由2~6位汉字组成!</div>
                </div>
                <div class="text_info clearfix"><span class="required" style="display:inline">*</span>&nbsp;身份证：</div>
                <div class="input_info">
                    <input id="acc_idcard" type="text" value=""  name="acc_idcard"/>
                    <div class="validate_msg_long" id="not_idcard">身份证号格式有误！</div>
                </div>
                <div class="text_info clearfix"><span class="required" style="display:inline">*</span>&nbsp;登录账号：</div>
                <div class="input_info">
                    <input id="acc_account" type="text" value="" name="acc_account" />
                    <!-- <span class="required">*</span> -->
                    <div class="validate_msg_long" id="not_account">账号由3~20位字母、数字组成!</div>
                </div>
                <div class="text_info clearfix"><span class="required" style="display:inline">*</span>&nbsp;密码：</div>
                <div class="input_info">
                    <input id="acc_psw" type="password"  value="" name="acc_psw"/>
                    <!-- <span class="required">*</span> -->
                    <div class="validate_msg_long" id="not_psw">密码由6~60位字母、数字、下划线组成!</div>
                </div>
                <div id="operate_result_info" class="operate_success">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                                                                 保存成功！
                </div>
                <div class="text_info clearfix"><span class="required" style="display:inline">*</span>&nbsp;重复密码：</div>
                <div class="input_info">
                    <input id="acc_repsw" type="password"  name="acc_repsw" value=""/>
                    <!-- <span class="required">*</span> -->
                    <div class="validate_msg_long" id="not_repsw">两次密码必须相同!</div>
                </div>     
                <div class="text_info clearfix"><span class="required" style="display:inline">*</span>&nbsp;电话：</div>
                <div class="input_info">
                    <input id="acc_telnum" type="text" class="width175" name="acc_telnum" value=""/>
                    <!-- <span class="required">*</span> -->
                    <div class="validate_msg_long" id="not_telnum">手机号码不存在!</div>
                </div>                
                <!--可选项-->
                <div class="text_info clearfix"><span>可选项：</span></div>
                <div class="input_info">
                    <img src="${pageContext.request.contextPath}/images/show.png" alt="展开" onclick="showOptionalInfo(this);" />
                </div>
                <div id="optionalInfo" class="hide">
                    <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                    <div class="input_info">
                        <input id="acc_reidcard" type="text" value="" name="acc_rec_idcard"/>
                        <div class="validate_msg_long" id="not_reidcard">身份证号格式有误！</div>
                    </div>
                    <div class="text_info clearfix"><span>生日：</span></div>
                    <div class="input_info">
                        <input type="text" value="" readonly class="readonly" name=""/>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input id="acc_email" type="text" class="width160" name="acc_email" value=""/>
                        <div class="validate_msg_long" id="not_email">email不符合规范!</div>
                    </div> 
                    <div class="text_info clearfix"><span>职业：</span></div>
                    <div class="input_info" >
                        <select name="acc_job">
                            <option value="1">干部</option>
                            <option value="2">学生</option>
                            <option value="3">技术人员</option>
                            <option value="4">其他</option>
                        </select>                        
                    </div>
                    <div class="text_info clearfix"><span>性别：</span></div>
                    <div class="input_info fee_type">
                        <input type="radio" name="acc_sex" checked="checked" id="female" value="0"/>
                        <label for="female">女</label>
                        <input type="radio" name="acc_sex" id="male"  value="1"/>
                        <label for="male">男</label>
                    </div> 
                    <div class="text_info clearfix"><span>通信地址：</span></div>
                    <div class="input_info">
                        <input type="text" class="width350" name="acc_address" value=""/>
                        <div class="validate_msg_long" id="not_address">50长度以内!</div>
                    </div> 
                    <div class="text_info clearfix"><span>邮编：</span></div>
                    <div class="input_info">
                        <input id="acc_postcode" type="text" value="" name="acc_postcode"/>
                        <div class="validate_msg_long" id="not_postcode">邮政编码由6位数字组成!</div>
                    </div> 
                    <div class="text_info clearfix"><span>QQ：</span></div>
                    <div class="input_info">
                        <input id="acc_qq" type="text" value="" name="acc_qq"/>
                        <div class="validate_msg_long" id="not_qq">5到13位数字!</div>
                    </div>                
                </div>
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="showResult();" />
                    <input type="button" value="取消" class="btn_save"  onclick="location.href='${pageContext.request.contextPath}/account/select.action';"/>
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
