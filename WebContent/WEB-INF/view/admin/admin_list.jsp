<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
       <%@include file="../include/header.jsp" %>
        <script language="javascript" type="text/javascript">
        	//删除用
        	function deleteAdmin(adm_id){
        		 var r = window.confirm("确定要删除此用户吗？");
                 if(r){
              	   $.ajax({             
                     	url:'${pageContext.request.contextPath}/admin/deleteAdmin.action?adm_id='+adm_id,
                     	type:'post',
                     	traditional:true,
                     	success:function(data){
                     		if(data==1){                   		
                     		$("#"+adm_id).hide();//假删除                     		
                     		$("#operate_result_info").text("删除成功！");
                     		$("#operate_result_info").show().delay(2000).hide(300); 
                     		}
                     		if(data==0){                         		
                     			$("#operate_result_info").text("删除失败！");
                         		$("#operate_result_info").show().delay(2000).hide(300);
                         		}
                     	}
                     })
                 }
        	}
            //显示角色详细信息
            function showDetail(flag, a) {
                var detailDiv = a.parentNode.getElementsByTagName("div")[0];
                if (flag) {
                    detailDiv.style.display = "block";
                }
                else
                    detailDiv.style.display = "none";
            }
            //全选
            $(function(){
				$("[value='密码重置']").click(function(){
					alert("确定重置密码吗？")
            		$.post({
            			url:"${pageContext.request.contextPath}/admin/newAdm_Psw.action",
            			data:$("#form").serialize(),
            			success:function(error){
            				if(error==0){           					
            					$("#operate_result_info").text("重置失败！");
                         		$("#operate_result_info").show().delay(2000).hide(300); 
            					
            				}else{           					
            					$("#operate_result_info").text("重置成功！");
                         		$("#operate_result_info").show().delay(2000).hide(300);
            					$("#all").removeAttr("checked");
            					$("[name='arrayAdm_id']").removeAttr("checked");
            				}
            			}
            		})
            	})
            /* 	//******搜索功能
             $("[value='搜索']").click(function(){
            	//alert("hello");
            		$.post({
            			url:"${pageContext.request.contextPath}/admin/getAdminByMap.action",
            			data:$("#form").serialize(),
            			success:function(result){           
            				var admins=result.admins;            			
            				$("#datalist").empty();
            				$("#datalist").append("<tr><th class='th_select_all'><input type='checkbox' onclick='selectAdmins(this);' /><span>全选</span></th><th>管理员ID</th><th>姓名</th><th>登录名</th><th>电子邮件</th><th>授权日期</th><th class='width100'>拥有角色</th>th></th><th></th></tr>");
            				$.each(admins, function(index, element) {
            					$("#datalist").append("<tr><td>"+"<input type='checkbox' name='arrayAdm_id' value='${showadmin.adm_id}'/>"+"</td><td>"+element.adm_id+"</td><td>"+element.adm_name+"</td><td>"+element.adm_account+"</td><td>"+element.adm_email+"</td><td>"+element.adm_create_time+"</td><td>"+"<a class='summary' onmouseover='showDetail(true,this);' onmouseout='showDetail(false,this);' >首页...</a>"+"<div class='detail_info'>"+element.per_name+"</div>"+"</td><td class='td_modi'>"+"<input type='button' value='修改' class='btn_modify' onclick='location.href='${pageContext.request.contextPath}/admin/showUpdateAdmin.action?adm_id=${showadmin.adm_id}';'>"+"</input><input type='button' value='删除' class='btn_delete' onclick='location.href='${pageContext.request.contextPath}/admin/deleteAdmin.action?adm_id=${showadmin.adm_id}';'></input>"+"</td></tr>");
            		            });            	
            			}
            		})
            	})
			})          */  
			//使用搜索功能
			$("[value='搜索']").click(function(){
            	//alert("hello");
            		$.post({
            			url:"${pageContext.request.contextPath}/admin/getAdminByMap.action",
            			data:$("#form").serialize(),
            			success:function(result){           
            				show(result);            	
            			}
            		})
            	})
			})        
            //******显示拼接数据
            function show(result){
					var admins=result.admins;            			
    				$("#datalist").empty();
    				$("#datalist").append("<tr><th class='th_select_all'><input type='checkbox' onclick='selectAdmins(this);' /><span>全选</span></th><th>管理员ID</th><th>姓名</th><th>登录名</th><th>电子邮件</th><th>授权日期</th><th class='width100'>拥有角色</th>th></th><th></th></tr>");
    				$.each(admins, function(index, element) {
    					//$("#datalist").append("<tr><td>"+"<input type='checkbox' name='arrayAdm_id' value='${showadmin.adm_id}'/>"+"</td><td>"+element.adm_id+"</td><td>"+element.adm_name+"</td><td>"+element.adm_account+"</td><td>"+element.adm_email+"</td><td>"+element.adm_create_time+"</td><td>"+"<a class='summary' onmouseover='showDetail(true,this);' onmouseout='showDetail(false,this);' >首页...</a>"+"<div class='detail_info'>"+element.per_name+"</div>"+"</td><td class='td_modi'>"+"<input type='button' value='修改' class='btn_modify' onclick='location.href='${pageContext.request.contextPath}/admin/showUpdateAdmin.action?adm_id=${showadmin.adm_id}';'>"+"</input><input type='button' value='删除' class='btn_delete' onclick='location.href='${pageContext.request.contextPath}/admin/deleteAdmin.action?adm_id=${showadmin.adm_id}';'></input>"+"</td></tr>");
    					$("#datalist").append("<tr id="+element.adm_id+"><td>"+"<input type='checkbox' name='arrayAdm_id' value='${showadmin.adm_id}' />"+"</td><td>"+element.adm_id+"</td><td>"+element.adm_name+"</td><td>"+element.adm_account+"</td><td>"+element.adm_email+"</td><td>"+element.adm_create_time+"</td><td>"+"<a class='summary' onmouseover='showDetail(true,this);' onmouseout='showDetail(false,this);' >"+element.per_name.substring(0,5)+"..."+"</a>"+"<div class='detail_info'>"+element.per_name+"</div>"+"</td><td class='td_modi'>"+"<input type='button' value='修改' class='btn_modify' id="+element.adm_id+">"+"</input><input type='button' value='删除' class='btn_delete' id="+element.adm_id+">"+"</input>"+"</td></tr>");
    		            }); 
    				$("[value='修改']").click(modi);
    				$("[value='删除']").click(del) ;                                    
            }
            //添加删除和修改功能
            function del(){
        		if(!window.confirm("确定要删除此用户吗？")){ 
        			return;
        		}
            	//var adm_id=$(this).parent().parent().children(':eq(1)').text();    
            	var adm_id=$(this).attr("id");
            	//alert(adm_id);
            	$.ajax({             
                     	url:'${pageContext.request.contextPath}/admin/deleteAdmin.action',                    	
                     	type:'post',
                     	data:{
                     		adm_id:adm_id
                     		},
                     	traditional:true,
                     	success:function(data){
                     		if(data==1){   
                     		$("tr#"+adm_id).hide();                    		
                     		$("#operate_result_info").text("删除成功！");
                     		$("#operate_result_info").show().delay(2000).hide(300);                      		
                     		}
                     		if(data==0){                        		
                         		$("#operate_result_info").text("删除失败！");
                         		$("#operate_result_info").show().delay(2000).hide(300);
                         		}
                     	}
                     })
        	}
            function modi(){
            	//alert("这里执行修改功能部分！");
        		var adm_id=$(this).attr("id");
        		//var adm_id=$(this).parent().parent().children(':eq(1)').text(); 
        		window.location.href="${pageContext.request.contextPath}/admin/showUpdateAdmin.action?adm_id="+adm_id; 
        	}
            //**********
             function selectAdmins(inputObj) {
                var inputArray = document.getElementById("datalist").getElementsByTagName("input");
                for (var i = 1; i < inputArray.length; i++) {
                    if (inputArray[i].type == "checkbox") {
                        inputArray[i].checked = inputObj.checked;
                    }
                }
            } 
            $(function() {
        		$(".admin_off").attr("class", "admin_on");
        	})
        </script>       
    </head>
    <body>
        <!--Logo区域开始-->
         <%@include file="../include/info.jsp"%>
        <%-- <div id="header">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="logo" class="left"/>
            <a href="${pageContext.request.contextPath}/view/login.jsp">[退出]</a>            
        </div> --%>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <%-- <%@include file="../include/menu.jsp" %> --%>          
       <%@include file="../include/menu.jsp" %>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
        <!-- <div id="save_result_info" class="save_success">删除成功！</div>
            <div id="save_result_info" class="save_fail">删除失败！</div> -->
            <div id="operate_result_info" class="operate_success">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                </div>
            <form id="form">
                <!--查询-->
                <div class="search_add">
                    <div>
                        模块：
                        <select id="selModules" name="pri_id" class="select_search">
                            <option value="0">全部</option>
                            <option value="2">角色管理</option>
                            <option value="3">管理员管理</option>
                            <option value="4">资费管理</option>
                            <option value="5">账务账号</option>
                            <option value="6">业务账号</option>
                            <option value="7">账单管理</option>
                            <option value="8">报表</option>
                        </select>
                    </div>
                    <div>姓名 ：<input name="adm_name" type="text" value="" class="text_search width200" /></div>
                    <div><input type="button" value="搜索" class="btn_search"/></div>                   
                    <input type="button" value="密码重置" class="btn_add" onclick="resetPwd();" />
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/admin/showRole_Name.action';" />
                </div>
                <!--删除和密码重置的操作提示-->
                <!-- <div id="operate_result_info" class="operate_fail">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    <span>删除失败！数据并发错误。</span>密码重置失败！数据并发错误。
                    ${fn:substringBefore(showadmin.per_name,",")}only
                </div>  -->
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th class="th_select_all">
                                <input type="checkbox" onclick="selectAdmins(this);" />
                                <span>全选</span>
                            </th>
                            <th>管理员ID</th>
                            <th>姓名</th>
                            <th>登录名</th>
                            <th>电子邮件</th>
                            <th>授权日期</th>
                            <th class="width100">拥有角色</th>
                            <th></th>
                        </tr>  
                        <c:forEach items="${admin}" var="showadmin" >                     
                        <tr id="${showadmin.adm_id}">   
                            <td><input type="checkbox" name="arrayAdm_id" value="${showadmin.adm_id}"/></td>
                            <td>${showadmin.adm_id}</td>
                            <td>${showadmin.adm_name}</td>
                            <td>${showadmin.adm_account}</td>
                            <td>${showadmin.adm_email}</td>
                            <td>${showadmin.adm_create_time}</td>
                            <td>                            
                                <a class="summary"   onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this);" >${fn:substring(showadmin.per_name,0,5)}...  </a>
                                <!--浮动的详细信息-->
                                <div class="detail_info">
                              ${showadmin.per_name}
                                </div>
                            </td>
                            <td class="td_modi">
                            <input type="button" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/admin/showUpdateAdmin.action?adm_id=${showadmin.adm_id}';"></input>
                            <input type="button" value="删除" class="btn_delete" onclick="deleteAdmin(${showadmin.adm_id});"></input>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
                <!--分页-->
               <!--  <div id="pages">
        	        <a href="#">上一页</a>
                    <a href="#" class="current_page">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">下一页</a>
                </div>     -->               
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
