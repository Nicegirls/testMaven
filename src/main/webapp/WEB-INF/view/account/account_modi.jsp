<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@include file="../include/header.jsp"%>
        <script language="javascript" type="text/javascript">
      //保存成功的提示信息
        function showResult() {
        	$.ajax({
        		url:'${pageContext.request.contextPath}/controller/UpdateAllAccountController',
        		type:'post',
        		data:$("#myform").serialize(),
        		success:function(){
        			showResultDiv(true);
        			window.setTimeout("showResultDiv(false);", 5000);
        		},
        		error:function(){
        			showResultDiv1(true);
        			window.setTimeout("showResultDiv1(false);", 5000);
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
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <ul id="menu">
                <li><a href="${pageContext.request.contextPath}/view/index.jsp" class="index_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/controller/SelectRoleController" class="role_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/controller/SelectAdminController" class="admin_on"></a></li>
                <li><a href="${pageContext.request.contextPath}/controller/SelectAllFeeController" class="fee_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/controller/SelectAccountController" class="account_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/controller/SelectAllBussniesController" class="service_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/bill/bill_list.jsp" class="bill_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/report/report_list.jsp" class="report_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/user/user_info.jsp" class="information_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/user/user_modi_pwd.jsp" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">  
            <!--保存成功或者失败的提示消息-->          
            <div id="save_result_info" class="save_success">保存成功！</div>
            <div id="save_result_info1" class="save_fail">保存失败！</div>
            <form id="myform" action="" method="" class="main_form">
                    <!--必填项-->
                    <div class="text_info clearfix"><span>账务账号ID：</span></div>
                    <div class="input_info">
                        <input type="text" value="${accco.acc_id}" readonly class="readonly" name="acc_id"/>
                    </div>
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text" value="${accco.acc_name}"  name="acc_name"/>
                        <span class="required">*</span>
                        <div class="validate_msg_long error_msg">20长度以内的汉字、字母和数字的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>身份证：</span></div>
                    <div class="input_info">
                        <input type="text" value="${accco.acc_idcard}" readonly class="readonly" name="acc_idcard"/>
                    </div>
                    <div class="text_info clearfix"><span>登录账号：</span></div>
                    <div class="input_info">
                        <input type="text" value="${accco.acc_login}" readonly class="readonly" name="acc_login" />                        
                        <div class="change_pwd">
                            <input id="chkModiPwd" type="checkbox" onclick="showPwd(this);" />
                            <label for="chkModiPwd">修改密码</label>
                        </div>
                    </div>
                    <!--修改密码部分-->
                    <div id="divPwds">
                        <div class="text_info clearfix"><span>旧密码：</span></div>
                        <div class="input_info">
                            <input type="password"  value="" />
                            <span class="required">*</span>
                            <div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>
                        </div>
                        <div class="text_info clearfix"><span>新密码：</span></div>
                        <div class="input_info">
                            <input type="password" value="" name="acc_psw" />
                            <span class="required">*</span>
                            <div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>
                        </div>
                        <div class="text_info clearfix"><span>重复新密码：</span></div>
                        <div class="input_info">
                            <input type="password"  />
                            <span class="required">*</span>
                            <div class="validate_msg_long">两次密码必须相同</div>
                        </div>  
                    </div>                   
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" value="${accco.acc_tel}" name="acc_tel"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium error_msg">正确的电话号码格式：手机或固话</div>
                    </div>
                    <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                    <div class="input_info">
                        <input type="text" value="${accco.acc_re_idcard}" name="acc_re_idcard"/>
                        <div class="validate_msg_long error_msgs">正确的身份证号码格式</div>
                    </div>
                    <div class="text_info clearfix"><span>生日：</span></div>
                    <div class="input_info">
                        <input type="text" value="${accco.acc_birth}" readonly class="readonly" name="acc_birth"/>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" value="${accco.acc_email}" name="acc_email"/>
                        <div class="validate_msg_medium">50长度以内，合法的 Email 格式</div>
                    </div> 
                    <div class="text_info clearfix"><span>职业：</span></div>
                    <div class="input_info">
                        <select name="acc_job">
                            <option value="干部">干部</option>
                            <option value="学生">学生</option>
                            <option value="技术人员">技术人员</option>
                            <option value="其他">其他</option>
                        </select>                        
                    </div>
                    <div class="text_info clearfix"><span>性别：</span></div>
                    <c:choose>
                    <c:when test="${accco.acc_sex==0}">
                    <div class="input_info fee_type">
                        <input type="radio" name="acc_sex" value="0" checked="checked" id="female" onclick="feeTypeChange(1);" />
                        <label for="female">女</label>
                        <input type="radio" name="acc_sex" value="1" id="male" onclick="feeTypeChange(2);" />
                        <label for="male">男</label>
                    </div> 
                    </c:when>
                    <c:otherwise>
                    <div class="input_info fee_type">
                        <input type="radio" name="acc_sex" value="0"  id="female" onclick="feeTypeChange(1);" />
                        <label for="female">女</label>
                        <input type="radio" name="acc_sex" value="1" checked="checked" id="male" onclick="feeTypeChange(2);" />
                        <label for="male">男</label>
                    </div> 
                    </c:otherwise>
                    </c:choose>
                    <div class="text_info clearfix"><span>通信地址：</span></div>
                    <div class="input_info">
                        <input type="text" class="width350" value="${accco.acc_address}" name="acc_address"/>
                        <div class="validate_msg_tiny">50长度以内</div>
                    </div> 
                    <div class="text_info clearfix"><span>邮编：</span></div>
                    <div class="input_info">
                        <input type="text" value="${accco.acc_zipcard}" name="acc_zipcard"/>
                        <div class="validate_msg_long">6位数字</div>
                    </div> 
                    <div class="text_info clearfix"><span>QQ：</span></div>
                    <div class="input_info">
                        <input type="text" value="${accco.acc_qq}" name="acc_qq"/>
                        <div class="validate_msg_long">5到13位数字</div>
                    </div>                
                    <!--操作按钮-->
                    <div class="button_info clearfix">
                        <input type="button" value="保存" class="btn_save" onclick="showResult();" />
                        <input type="button" value="取消" class="btn_save" />
                    </div>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
