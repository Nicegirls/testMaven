<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@ include file="../include/header.jsp"%>
        <script language="javascript" type="text/javascript">
         //删除功能
        function deleteAccount(acc_id) {
           var r = window.confirm("确定要删除此账务账号吗？\r\n删除后将不能恢复，且会删除其下属的所有业务账号。");
           if(r){
        	   $.ajax({
               	url:'${pageContext.request.contextPath}/account/delete.action?acc_id='+acc_id,
               	type:'post',
               	traditional:true,
               	success:function(data){
               		if("true"==data){
             			$("#"+acc_id).html("删除");
             			$("#"+(acc_id+10000)).html("");
               		$("#operate_result_info").show().delay(2000).hide(300);
               		}
               	}
               })
           }
        }
         //修改状态
         function updateStatus(id,status){
        	 if(status==1){
        		 var  r=window.confirm("您确定要暂停此账务账号吗？");
        		 if(r){
        			 $.ajax({
    	        		 url:'${pageContext.request.contextPath}/account/update1.action?acc_id='+id+'&&acc_status='+status,
    	        		 type:'post',
    	        		 traditional:true,
    	        		 success:function(data){
    	        			 if("true"==data){
    	        				 $("#"+id).html("暂停");
    	        				 $("#"+(id+10000)).html('<input type="button" value="开通" class="btn_start" onclick="updateStatus('+id+',2)'+';"'+'/><input type="button" value="修改" class="btn_modify" onclick="'+'modify('+id+');"'+'/><input type="button" value="删除" class="btn_delete" onclick="deleteAccount('+id+');" />');
    	        				 $("#operate_result_info").text("您已暂停此业务！");
    	        				 $("#operate_result_info").show().delay(2000).hide(300);
    	        				 
    	        			 }else{
    	        				 /* showResultDiv1(true);
    	             			 window.setTimeout("showResultDiv1(false);", 5000); */
    	        				 $("#operate_result_info").text("修改失败！");
    	        				 $("#operate_result_info").show().delay(2000).hide(300);
    	        			 }
    	        		 }
    	        	 })
        		 }
        	 }
        	 if(status==2){
        		 var  r=window.confirm("您确定要开通此账务账号吗？");
        		 if(r){
        			 $.ajax({
    	        		 url:'${pageContext.request.contextPath}/account/update1.action?acc_id='+id+'&&acc_status='+status,
    	        		 type:'post',
    	        		 traditional:true,
    	        		 success:function(data){
    	        			 if("true"==data){
    	        				 $("#"+id).html("开通");
    	        				 $("#"+(id+10000)).html('<input type="button" value="暂停" class="btn_pause" onclick="updateStatus('+id+',1)'+';"'+'/><input type="button" value="修改" class="btn_modify" onclick="'+'modify('+id+');"'+'/><input type="button" value="删除" class="btn_delete" onclick="deleteAccount('+id+');" />');
    	        				 $("#operate_result_info").text("您已开通此业务！");
    	        				 $("#operate_result_info").show().delay(2000).hide(300);
    	        			 }else{
    	        				 $("#operate_result_info").text("修改失败！");
    	        				 $("#operate_result_info").show().delay(2000).hide(300);
    	        			 }
    	        		 }
    	        	 })
        		 }
        	 }
         }
         
         function modify(id){
        	 location.href="${pageContext.request.contextPath}/account/modify.action?acc_id="+id;
         }
         function showResultDiv1(flag) {
             if (flag)
             	$("#save_result_info1").show();
             else
             	$("#save_result_info1").hide();
         }
           
         $(function(){
        	 $(".account_off").attr("class","account_on");
         })
         
         function page(curPage){
        	$("#curpage").val(curPage);
        	$("#form").submit();
         }
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <%@include file="../include/info.jsp"%>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">  
        	 <jsp:include page="../include/menu.jsp" flush="true"/>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form id="form" action="${pageContext.request.contextPath }/account/select.action" method="post">
                <!--查询-->
                <div class="search_add">   
                <!-- 隐藏表单域 -->
                     <input type="hidden" id="curpage" name="curPage" value=""/>              
                    <div>身份证：<input type="text" value="${mo.acc_idcard}" class="width150 text_search" id="idcard" name="acc_idcard1"/></div>                            
                    <div>姓名：<input type="text" class="width100 text_search" value="${mo.acc_name}" id="name" name="acc_name1"/></div>
                    <div>登录名：<input type="text"  value="${mo.acc_account}" class="width100 text_search" id="login_name" name="acc_account1"/></div>
                    <c:choose>
                    <c:when test="${mo.acc_status==1}">
                    <div>
                       	 状态：
                        <select class="select_search" id="search" name="acc_status1">
                        	<option value="开通">开通</option>
                            <option value="全部">全部</option>
                            <option value="暂停">暂停</option>
                            <option value="删除">删除</option>
                        </select>
                    </div>
                    </c:when>
                    <c:when test="${mo.acc_status==2}">
                    	<div>
                       	 状态：
                        <select class="select_search" id="search" name="acc_status1">
                        	<option value="暂停">暂停</option>
                            <option value="全部">全部</option>
                            <option value="开通">开通</option>
                            <option value="删除">删除</option>
                        </select>
                    </div>
                    </c:when>
                    <c:when test="${mo.acc_status==0}">
                    	<div>
                       	 状态：
                        <select class="select_search" id="search" name="acc_status1">
                       		 <option value="删除">删除</option>
                        	<option value="暂停">暂停</option>
                            <option value="全部">全部</option>
                            <option value="开通">开通</option>
                        </select>
                    </div>
                    </c:when>
                    <c:otherwise>
                    	<div>
                       	 状态：
                        <select class="select_search" id="search" name="acc_status1">
                        	<option value="全部">全部</option>
                       		<option value="删除">删除</option>
                        	<option value="暂停">暂停</option>
                            <option value="开通">开通</option>
                        </select>
                    </div>
                    </c:otherwise>
                    </c:choose>
                    <div><input type="button" value="搜索" class="btn_search" id="select" onclick="page(1)"/></div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/account/insert.action';" />
                </div>  
                <!--删除等的操作提示-->
                <div id="save_result_info1" class="save_fail">修改失败！</div>
                <div id="operate_result_info" class="operate_success">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                                                                  删除成功，且已删除其下属的业务账号！
                </div>   
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                    <tr>
                        <th >账号ID</th>
                        <th >姓名</th>
                        <th class="width150">身份证</th>
                        <th >登录名</th>
                        <th class="width100">创建日期</th>
                        <th class="width150">上次登录时间</th> 
                         <th >状态</th>                                                       
                        <th class="width200"></th>
                    </tr>
                    <c:forEach items="${acc}" var="ac">
                    <c:choose>
                    <c:when test="${ac.acc_status==1}">
                    <tr>
                        <td>${ac.acc_id}</td>
                        <td><a href="${pageContext.request.contextPath}/account/update.action?acc_id=${ac.acc_id}">${ac.acc_name}</a></td>
                        <td>${ac.acc_idcard}</td>
                        <td>${ac.acc_account}</td>      
                        <td><fmt:formatDate value="${ac.acc_cretime}" pattern="yyyy-MM-dd" /></td>
                        <td><fmt:formatDate value="${ac.acc_cretime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        <td id="${ac.acc_id}">开通</td>
                                                    
                        <td class="td_modi" id="${ac.acc_id+10000}">
                            <input type="button" value="暂停" class="btn_pause" onclick="updateStatus(${ac.acc_id},${ac.acc_status});"/>
                            <input type="button" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/account/modify.action?acc_id=${ac.acc_id}';"/>
                            <input type="button" value="删除" class="btn_delete" onclick="deleteAccount(${ac.acc_id});"/>
                        </td>
                      </tr>
                       </c:when> 
                        <c:when test="${ac.acc_status==2}">
                      <tr>
                        <td>${ac.acc_id}</td>
                        <td><a href="${pageContext.request.contextPath}/account/update.action?acc_id=${ac.acc_id}">${ac.acc_name}</a></td>
                        <td>${ac.acc_idcard}</td>
                        <td>${ac.acc_account}</td>
                        
                        <td><fmt:formatDate value="${ac.acc_cretime}" pattern="yyyy-MM-dd" /></td>
                         <td></td> 
                        <td id="${ac.acc_id}">暂停</td>
                          
                        <td class="td_modi" id="${ac.acc_id+10000}">
                            <input type="button" value="开通" class="btn_start" onclick="updateStatus(${ac.acc_id},${ac.acc_status});"/>
                            <input type="button" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/account/modify.action?acc_id=${ac.acc_id}';"/>
                            <input type="button" value="删除" class="btn_delete" onclick="deleteAccount(${ac.acc_id});"/>
                        </td>
                      </tr>
                       </c:when>  
                       <c:otherwise>
                       <tr>
                       <td>${ac.acc_id}</td>
                        <td><a href="${pageContext.request.contextPath}/account/update.action?acc_id=${ac.acc_id}">${ac.acc_name}</a></td>
                        <td>${ac.acc_idcard}</td>
                        <td>${ac.acc_account}</td>
                        <td><fmt:formatDate value="${ac.acc_cretime}" pattern="yyyy-MM-dd" /></td>
                         <td></td>   
                        <td>删除</td>
                                                   
                        <td class="td_modi">
                        </td>
                    </tr>
                       </c:otherwise>
                    </c:choose>
                    </c:forEach>
                    
                </table>
               <p>业务说明：<br />
                1、创建则开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、暂停账务账号，同时暂停下属的所有业务账号；<br />                
                6、暂停后重新开通账务账号，并不同时开启下属的所有业务账号，需要在业务账号管理中单独开启；<br />
                7、删除账务账号，同时删除下属的所有业务账号。</p> 
                </div>                   
                <!--分页-->
                <div id="pages">
                    <c:choose>
                    	<c:when test="${p==0}">
                    		<a>共&nbsp;${p}&nbsp;页</a>
                    	</c:when>
                    	<c:when test="${p==1}">
                    		<a onclick="page(1)" 
	                    		<c:if test="${pageindex==1}">
	                    			class="current_page"
	                    		</c:if>
                    		>首页</a>
                    		<a onclick="page(${pageindex-1})" >上一页</a>
                    		<a onclick="page(1)" 
                    			<c:if test="${pageindex==1}">
            						class="current_page"
            					</c:if>
                    		>1</a>
                     		<c:choose>
                    			<c:when test="${pageindex<p}">
                    				<a onclick="page(${pageindex+1})" >下一页</a>
                    			</c:when>
                    			<c:otherwise>
                    				<a onclick="page(${pageindex})" >下一页</a>
                    			</c:otherwise>
                    		</c:choose>
                    		<a onclick="page(${p})" 
                    	 		<c:if test="${pageindex==p}">
    								class="current_page"
    							</c:if>
                    		>末页</a>
                    		<a>共&nbsp;${p}&nbsp;页</a>
                    	</c:when>
                    	
                    	<c:when test="${p==2}">
                    		<a onclick="page(1)" 
                    			<c:if test="${pageindex==1}">
                    				class="current_page"
                    			</c:if>
                    		>首页</a>
                    		<a onclick="page(${pageindex-1})" >上一页</a>
                    		<a onclick="page(1)" 
                    			<c:if test="${pageindex==1}">
            						class="current_page"
            					</c:if>
                    		>1</a>
                    		<a onclick="page(2)" 
                    			<c:if test="${pageindex==2}">
    								class="current_page"
    							</c:if>
                    		>2</a>
                   			<c:choose>
                    			<c:when test="${pageindex<p}">
                    				<a onclick="page(${pageindex+1})" 
                     				>下一页</a>
                    			</c:when>
                    		<c:otherwise>
                    			<a onclick="page(${pageindex})" >下一页</a>
                    		</c:otherwise>
                    		</c:choose>
                    		<a onclick="page(${p})" 
                    	 		<c:if test="${pageindex==p}">
    								class="current_page"
    							</c:if>	
                    		>末页</a>
                    		<a>共&nbsp;${p}&nbsp;页</a>
                    	</c:when>
                    	
                    	<c:otherwise>
                    		<a onclick="page(1)" 
                    			<c:if test="${pageindex==1}">
                    				class="current_page"
                    		</c:if>
                    		>首页</a>
                    		<a onclick="page(${pageindex-1})" >上一页</a>
                    		<a onclick="page(1)" 
                    			<c:if test="${pageindex==1}">
            						class="current_page"
            					</c:if>
                    		>1</a>
                    		<a onclick="page(2)" 
                    			<c:if test="${pageindex==2}">
    								class="current_page"
    							</c:if>
                    		>2</a>
                    		<a onclick="page(3)" 
                    			<c:if test="${pageindex==3}">
									class="current_page"
								</c:if>
                    		>3</a>
                    		<c:choose>
                    			<c:when test="${pageindex<p}">
                    				<a onclick="page(${pageindex+1})" >下一页</a>
                    			</c:when>
                    			<c:otherwise>
                    				<a onclick="page(${pageindex})" >下一页</a>
                    			</c:otherwise>
                    		</c:choose>
                    		<a onclick="page(${p})" 
                    	 		<c:if test="${pageindex==p}">
    								class="current_page"
    							</c:if>
                    		>末页</a>
                    		<a>共&nbsp;${p}&nbsp;页</a>
                    	</c:otherwise>
                    </c:choose>
                </div>                    
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            
        </div>
    </body>
</html>
