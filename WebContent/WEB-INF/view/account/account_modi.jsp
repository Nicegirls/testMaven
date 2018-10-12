<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@ include file="/WEB-INF/view/include/header.jsp"%>
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/global_color.css" />
        <script language="javascript" type="text/javascript">
        //保存成功的提示信息
        function showResult() {
        	$.ajax({
        		url:'${pageContext.request.contextPath}/account/update2.action',
        		type:'post',
        		data:$("#myform").serialize(),
        		success:function(data){
        			if("true"==data){
        				$.ajax({
        					url:'${pageContext.request.contextPath}/account/updateCheck.action',
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
        							$("#operate_result_info").text("修改失败！");
            						$("#operate_result_info").show().delay(2000).hide(300);
        						}
        					}
        				})
        				
        			}else{
        				if("3"==data){
        					$("#save_result_info1").text("姓名不能为空！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("s"==data){
        					$("#save_result_info1").text("姓名由2~6位汉字组成！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("5"==data){
        					$("#save_result_info1").text("旧密码输入不正确！");
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
        				if("33"==data){
        					$("#save_result_info1").text("手机号码不能为空！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("11111"==data){
        					$("#save_result_info1").text("手机号码不存在！");
        					$("#save_result_info1").show().delay(2000).hide(300);
        				}
        				if("1"==data){
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
        					$("#save_result_info1").text("qq号码为5到13位数字！");
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

            //显示修改密码的信息项
            function showPwd(chkObj) {
                if (chkObj.checked)
                    document.getElementById("divPwds").style.display = "block";
                else
                    document.getElementById("divPwds").style.display = "none";
            }
            
            $(function(){
              	 $(".account_off").attr("class","account_on");
               })
               
               //前台验证
              $(function(){
            	  $("#notname").hide();
            	  $("#notopsw").hide();
            	  $("#notnewpsw").hide();
            	  $("#notrepsw").hide();
            	  $("#nottelnum").hide();
            	  $("#notrecidcard").hide();
            	  $("#notemail").hide();
            	  $("#notpostcode").hide();
            	  $("#notqq").hide();
            	  $("#notaddress").hide();
              })
              
             
              $(function(){
            	  //姓名验证
            	  $("#acc_name").blur(function(){
            		var acc_name1=$("#acc_name").val();
            		var name=/^[\u4e00-\u9fa5]{2,6}$/;
            		var acc_name=acc_name1.replace(/\s+/g,"");//将字符串左边的空格替换成空字符串
            		if(acc_name!=""&&name.test(acc_name)==false){
            			$("#notname").css("color","red");
            			$("#notname").show();
            		}else{
            			$("#notname").hide();
            		}
            	})
            	   //密码旧密码验证
					$("#acc_oldpsw").blur(function(){
            		  var acc_oldpsw=$("#acc_oldpsw").val();
            		  var oldpsw=/^[a-zA-Z0-9]\w{5,19}$/;
            		  if(acc_oldpsw!=""&&oldpsw.test(acc_oldpsw)==false){
            			  $("#notopsw").css("color","red");
            			  $("#notopsw").show();
            		  }else{
            			  $("#notopsw").hide();
            		  }
            	  })
            	  //验证新密码
            	  $("#acc_newpsw").blur(function(){
            		  var acc_newpsw=$("#acc_newpsw").val();
            		  var newpsw=/^[a-zA-Z0-9]\w{5,19}$/;
            		  if(acc_newpsw!=""&&newpsw.test(acc_newpsw)==false){
            			  $("#notnewpsw").css("color","red");
            			  $("#notnewpsw").show();
            		  }else{
            			  $("#notnewpsw").hide();
            		  }
            	  })
            	  //验证密码是否一致
            	   $("#acc_repsw").blur(function(){
            		  var acc_repsw=$("#acc_repsw").val();
            		  var acc_newpsw=$("#acc_newpsw").val();
            		  if(acc_repsw!=acc_newpsw){
            			  $("#notrepsw").css("color","red");
            			  $("#notrepsw").show();
            		  }else{
            			  $("#notrepsw").hide();
            		  }
            	  })
            	  //验证电话号码
            	  $("#acc_tel").blur(function(){
            		  var acc_tel1=$("#acc_tel").val();
            		  var tel=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
            		  var acc_tel=acc_tel1.replace(/\s+/g,"");
            		  if(acc_tel!=""&&tel.test(acc_tel)==false){
            			  $("#nottelnum").css("color","red");
            			  $("#nottelnum").show();
            		  }else{
            			  $("#nottelnum").hide();
            		  }
            	  })
            	//  身份证验证
            	  $("#acc_idcard").blur(function(){
            		  var acc_idcard1=$("#acc_idcard").val();
            		  var idcard=/^[1-9](\d{13}|\d{16})[0-9Xx]$/;
            		  var acc_idcard=acc_idcard1.replace(/\s+/g,"");
            		  if(acc_idcard!=""&&idcard.test(acc_idcard)==false){
            			  $("#notrecidcard").css("color","red");
            			  $("#notrecidcard").show();
            		  }else{
            			  $("#notrecidcard").hide();
            		  }
            	  })
            	  
            	  //电子邮件验证
            	  $("#acc_email").blur(function(){
            		  var acc_email1=$("#acc_email").val();
            		  var email=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            		  var acc_email=acc_email1.replace(/\s+/g,"");
            		  if(acc_email!=""&&email.test(acc_email)==false){
            			  $("#notemail").css("color","red");
            			  $("#notemail").show();
            		  }else{
            			  $("#notemail").hide();
            		  }
            	  })
            	  
            	  //邮政编码验证
            	$("#acc_postcode").blur(function(){
            		var acc_postcode1=$("#acc_postcode").val();
            		var postcode=/^[1-9]\d{5}(?!\d)$/;
            		var acc_postcode=acc_postcode1.replace(/\s+/g,"");
            		if(acc_postcode!=""&&postcode.test(acc_postcode)==false){
            			$("#notpostcode").css("color","red");
            			$("#notpostcode").show();
            		}else{
            			$("#notpostcode").hide();
            		}
            	})
            	//qq验证
            	$("#acc_qq").blur(function(){
            		var acc_qq1=$("#acc_qq").val();
            		var qq=/^[1-9][0-9]{4,}$/;
            		var acc_qq=acc_qq1.replace(/\s+/g,"");
            		if(acc_qq!=""&&qq.test(acc_qq)==false){
            			$("#notqq").css("color","red");
            			$("#notqq").show();
            		}else{
            			$("#notqq").hide();
            		}
            	})
            	  
              })
              
              
        </script>
        <style type="text/css">
        	#female{
        		position: absolute;
        		margin-left: -1px;
        		margin-top: -1px;
        	}
        	#male{
        		position: absolute;
        		margin-left: 36px;
        		margin-top: -1px;
        	}
        	
        </style>
    </head>
    <body>
        <!--Logo区域开始-->
        <%@include file="../include/info.jsp"%>
        <%-- <div id="header">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div> --%>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <%@ include file="/WEB-INF/view/include/menu.jsp"%>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">  
            <!--保存成功或者失败的提示消息-->                  
            <div id="save_result_info" class="save_success">保存成功！</div>
            <div id="save_result_info1" class="save_fail">保存失败！</div>
            <form id="myform" action="${pageContext.request.contextPath}/account/update2.action" method="post" class="main_form">
                    <!--必填项-->
                    <div class="text_info clearfix"><span>账务账号ID：</span></div>
                    <div class="input_info">
                        <input type="text" value="${accco.acc_id}" readonly class="readonly" name="acc_id"/>
                    </div>
                    
                    <div class="text_info clearfix"><span class="required" style="display:inline">*</span>&nbsp;姓名：</div>
                    
                    <div class="input_info">
                        <input id="acc_name" type="text" value="${accco.acc_name}"  name="acc_name"/>
                        <!-- <span class="required">*</span> -->
                        <div id="notname" class="validate_msg_long">姓名由2~6位汉字组成!</div>
                    </div>
                    <div class="text_info clearfix"><span>身份证：</span></div>
                    <div class="input_info">
                        <input type="text" value="${accco.acc_idcard}" readonly class="readonly" name="acc_idcard"/>
                    </div>
                    <div class="text_info clearfix"><span>登录账号：</span></div>
                    <div class="input_info">
                        <input type="text" value="${accco.acc_account}" readonly class="readonly" name="acc_account" />                        
                        <!-- <div class="change_pwd">
                            <input id="chkModiPwd" type="checkbox" onclick="showPwd(this);" />
                           <label for="chkModiPwd">修改密码</label>
                        </div> -->
                    </div>
                    <!--修改密码部分-->
                   <!--  <div >
                        <div class="text_info clearfix"><span>旧密码：</span></div>
                        <div class="input_info">
                            <input id="acc_oldpsw" type="password"  value=""  name="acc_oldpsw"/>
                            <span class="required">*</span>
                            <div id="notopsw" class="validate_msg_short">密码由6~60位字母、数字、下划线组成!</div>
                        </div>
                        <div id="notnpsw" class="text_info clearfix"><span>新密码：</span></div>
                        <div class="input_info">
                            <input id="acc_newpsw" type="password" value="" name="acc_psw" />
                            <span class="required">*</span>
                            <div id="notnewpsw" class="validate_msg_short">密码由6~60位字母、数字、下划线组成!</div>
                        </div>
                        <div class="text_info clearfix"><span>重复新密码：</span></div>
                        <div class="input_info">
                            <input  id="acc_repsw" type="password" value="" name="acc_repsw"/>
                            <span class="required">*</span>
                            <div id="notrepsw" class="validate_msg_short">两次密码必须相同</div>
                        </div>  
                    </div>               -->     
                    <div class="text_info clearfix"><span class="required" style="display:inline">*</span>&nbsp;电话：</div>
                    <div class="input_info">
                        <input id="acc_tel" type="text" class="width160" value="${accco.acc_telnum}" name="acc_telnum"/>
                        <!-- <span class="required">*</span> -->
                        <div id="nottelnum" class="validate_msg_long">手机号码不存在!</div>
                    </div>
                    <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                    <div class="input_info">
                        <input id="acc_idcard" type="text" value="${accco.acc_rec_idcard}" name="acc_rec_idcard"/>
                        <div id="notrecidcard" class="validate_msg_long">身份证号由15或18位数字组成，可x结尾!</div>
                    </div>
                    <div class="text_info clearfix"><span>生日：</span></div>
                    <div class="input_info">
                        <input type="text" value="${accco.acc_birth}" readonly class="readonly" name="acc_birth"/>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input id="acc_email" type="text" class="width160" value="${accco.acc_email}" name="acc_email"/>
                        <div id="notemail" class="validate_msg_long">email不符合规范!</div>
                    </div> 
                    
                    <div class="text_info clearfix"><span>职业：</span></div>
                    <div class="input_info">
                        <select name="acc_job">
                            <option value="1">干部</option>
                            <option value="2">学生</option>
                            <option value="3">技术人员</option>
                            <option value="4">其他</option>
                        </select>                        
                    </div>
                    <div class="text_info clearfix"><span>性别：</span></div>
                    <c:choose>
                    <c:when test="${accco.acc_sex==0}">
                    <div class="input_info fee_type">
                        <input type="radio" name="acc_sex" value="0" checked="checked" id="female" onclick="feeTypeChange(1);" />
                        <label for="female">&nbsp;&nbsp;&nbsp;女</label>
                        <input type="radio" name="acc_sex" value="1" id="male" onclick="feeTypeChange(2);" />
                        <label for="male">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;男</label>
                    </div> 
                    </c:when>
                    <c:otherwise>
                    <div class="input_info fee_type">
                        <input type="radio" name="acc_sex" value="0"  id="female" onclick="feeTypeChange(1);" />
                        <label for="female" >&nbsp;&nbsp;&nbsp;女</label>
                        <input type="radio" name="acc_sex" value="1" checked="checked" id="male" onclick="feeTypeChange(2);" />
                        <label for="male" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;男</label>
                    </div> 
                    </c:otherwise>
                    </c:choose>
                    
                    <div class="text_info clearfix"><span>通信地址：</span></div>
                    <div class="input_info">
                        <input type="text" class="width350" value="${accco.acc_address}" name="acc_address"/>
                        <div id="notaddress" class="validate_msg_tiny">50长度以内</div>
                    </div> 
                    <div class="text_info clearfix"><span>邮编：</span></div>
                    <div class="input_info">
                        <input id="acc_postcode" type="text" value="${accco.acc_postcode}" name="acc_postcode"/>
                        <div id="notpostcode" class="validate_msg_long">邮政编码由6位数字组成!</div>
                    </div> 
                    <div class="text_info clearfix"><span>QQ：</span></div>
                    <div class="input_info">
                        <input id="acc_qq" type="text" value="${accco.acc_qq}" name="acc_qq"/>
                        <div id="notqq" class="validate_msg_short">5到13位数字</div>
                    </div>  
                    <div id="operate_result_info" class="operate_success">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                                                                 修改成功！
                	</div>              
                    <!--操作按钮-->
                    <div class="button_info clearfix">
                        <input type="button" value="保存" class="btn_save" onclick="showResult();" />
                        <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/account/select.action';" />
                    </div>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
