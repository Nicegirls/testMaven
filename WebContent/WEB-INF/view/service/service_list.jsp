<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
         <%@include file="../include/header.jsp" %>
        <script language="javascript" type="text/javascript">
	        function showDetail(flag, a) {
	            var detailDiv = a.parentNode.getElementsByTagName("div")[0];
	            if (flag) {
	                detailDiv.style.display = "block";
	            }
	            else
	                detailDiv.style.display = "none";
	        }
            //开通或暂停，并判断账务账号是否开通
            function  change(serid,state,accid){
            	//开通
            	if(state==1){
            		var r=window.confirm("确定开通此业务吗?");
            		if(r==true){
		           		$.post({
		           			url:'${pageContext.request.contextPath}/service/openService.action',
		           			data:{
		           				'ser_id':serid,
		           				'acc_id':accid
		           			},
		           			traditional:true,
		           			success:function(data){
		           				if("true"==data){
		           					$("#operate_success").attr("class","operate_success");
		           					$("#operate_result_info").text("开通成功");
	               					$("#operate_result_info").show().delay(2000).hide(300);
		           					$("#"+(serid-1000)).html('开通');
		           					$("#"+serid).html('<input type="button" value="暂停" class="btn_pause" onclick="change('+serid+',2,'+accid+');"'+'/> <input type="button" value="修改" class="btn_modify" onclick='+'"'+'modify('+accid+')"'+' /> <input type="button" id="del" value="删除" class="btn_delete" onclick="dele('+serid+');" />');
		           				//账务账号未开通
		           				}else if("false"==data){
		           					$("#operate_result_info").attr("class","save_fail");
		           					$("#operate_result_info").text("账务账号已暂停使用，请先开启账务账号");
	               					$("#operate_result_info").show().delay(2000).hide(300);
		           				}
		           			}
		           		})
            		}
            	}
            	//暂停
            	if(state==2){
            		var r=window.confirm("确定暂停此业务吗?");
            		if(r==true){
	            		$.post({
		           			url:'${pageContext.request.contextPath}/service/stopService.action',
		           			data:{
		           				'ser_id':serid,
		           				'acc_id':accid
		           			},
		           			traditional:true,
		           			success:function(data){
		           				if("true"==data){
		           					$("#operate_success").attr("class","operate_success");
		           					$("#operate_result_info").text("暂停成功");
	               					$("#operate_result_info").show().delay(2000).hide(300);
		           					$("#"+(serid-1000)).html("暂停");
	 	           					var str='<input type="button" value="开通" class="btn_start" onclick="change('+serid+',1,'+accid+');"'+'/> <input type="button" value="修改" class="btn_modify" onclick='+'"'+'modify('+accid+')"'+' /> <input type="button" id="del" value="删除" class="btn_delete" onclick="dele('+serid+');" />';
	           						$("#"+serid).html(str);
	           					//账务账号未开通
		           				}else if("false"==data){
		           					$("#operate_result_info").attr("class","save_fail");
		           					$("#operate_result_info").text("账务账号已暂停使用，请先开启账务账号");
	               					$("#operate_result_info").show().delay(2000).hide(300);
		           				}
		           			}
		           		})
            		}
            	}
            }
            //修改业务信息
            function modify(id){
            	var r=window.confirm("确定修改此业务吗?");
            	if(r==true){
            		$.post({
               			url:'${pageContext.request.contextPath}/service/updateService.action',
               			data:{
               				'ser_id':id
               			},
               			traditional:true,
               			success:function(data){
               				if("no"!=data){
               					$("#operate_success").attr("class","operate_success");
               					$("#operate_result_info").text("修改成功");
               					$("#operate_result_info").show().delay(2000).hide(300);
               					$("#"+id).html(""),
               					$("#"+(id-1000)).html("修改");
               				}else{
               					$("#operate_success").attr("class","operate_fail");
               					$("#operate_result_info").text("修改失败");
               					$("#operate_result_info").show().delay(2000).hide(300);
               				}
               			}
               		})
            	}
            	/* location.href="${pageContext.request.contextPath}/service/updateService.action?ser_id="+id; */
            }
            
            //删除业务信息
            function dele(id){
            	var r=window.confirm("确定删除此业务吗?");
            	if(r==true){
            		$.post({
               			url:'${pageContext.request.contextPath}/service/deleteService.action',
               			data:{
               				'ser_id':id
               			},
               			traditional:true,
               			success:function(data){
               				if("no"!=data){
               					$("#operate_success").attr("class","operate_success");
               					$("#operate_result_info").text("删除成功");
               					$("#operate_result_info").show().delay(2000).hide(300);
               					$("#"+id).html(""),
               					$("#"+(id-1000)).html("删除");
               				}else{
               					$("#operate_success").attr("class","operate_fail");
               					$("#operate_result_info").text("删除失败");
               					$("#operate_result_info").show().delay(2000).hide(300);
               				}
               			}
               		})
            	}
           		
            }
            //修改图标样式
            $(function(){
            	$(".service_off").attr("class","service_on");
            })
            //分页
            function sub(pageIndex){
            	var tatolPages=${tatolPages}
            	if(pageIndex>=1&&tatolPages>=pageIndex){
            		$("#pageIndex").val(pageIndex);
            		$("#form").submit()
            		//location.href="${pageContext.request.contextPath}/service/getAllService.action?pageIndex="+pageIndex+",ser_os1="+ser_os1+",ser_ip1="+ser_ip1+",ser_status1="+ser_status1+",acc_idcard1="+acc_idcard1;
            	}
            }            
            //快捷键
            function toFind(type){
            	if(event.keyCode==13){
            		$("#pageIndex").val(1);
            		$("#form").submit();
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
      	 	<%@include file="../include/menu.jsp"%>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
        	<div id="save_result_info" class="save_success">保存成功</div>
            <form id="form" action="${pageContext.request.contextPath }/service/getAllService.action" method="post">
                <!--查询-->
                <input type="hidden" id="pageIndex" name="pageIndex" value="1"/>
                <input type="hidden" id="acc_status" name="acc_status" value="3"/>
                <div class="search_add">                        
                    <div>OS 账号：<input type="text" id="ser_os1"   onkeypress="toFind(2)"    name="ser_os1" value="${Service.ser_os}" class="width100 text_search" /></div>                            
                    <div>服务器 IP：<input type="text" id="ser_ip1"   onkeypress="toFind(2)"   name="ser_ip1" value="${Service.ser_ip}" class="width100 text_search" /></div>
                    <div>身份证：<input type="text" id="acc_idcard1" onkeypress="toFind(2)"   name="acc_idcard1" value="${acc_idcard}" class="text_search" /></div>
                    <div>状态：
                        <select id="ser_status1" name="ser_status1" class="select_search">
                            <option value="-1">全部</option>
                            	<c:if test="${Service.ser_status==-1}">
                            		selected=selected
                            	</c:if>
                            
                            <option value="1">
                            	<c:if test="${Service.ser_status==1}">
                            		selected=selected
                            	</c:if>
                            	开通</option>
                            <option value="2">
                            	<c:if test="${Service.ser_status==2}">
                            		selected=selected
                            	</c:if>
                            	暂停</option>
                            <option value="0">
                            	<c:if test="${Service.ser_status==0}">
                            		selected=selected
                            	</c:if>
                            	删除</option>
                        </select>
                    </div>
                    <div><input type="submit" id="search" value="搜索" class="btn_search" /></div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath }/service/addService.action';" />
 
                	</div>  
                <!--删除的操作提示-->
                <div id="save_result_info1" class="save_fail">账务账号已暂停使用，请先开启账务账号！</div>
                <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                                                                        删除成功！
                </div>   
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                    <tr>
                        <th class="width50">业务ID</th>
                        <th class="width100">账务账号ID</th>
                        <th class="width150">身份证</th>
                        <th class="width70">姓名</th>
                        <th class="width70">os账号</th>
                        <th class="width100">服务器 IP</th>
                        <th class="width70">资费</th>  
                        <th class="width50">状态</th>                                                      
                        <th class="width200"></th>
                    </tr>
                    <c:forEach items="${AllService}" var="service">
                    	<tr>
                    		
	                        <td><a href="${pageContext.request.contextPath}/service/detailService.action?ser_id=${service.ser_id}" title="查看明细">${service.ser_id}</a></td>
	                        <td>${service.acc_id}</td>
	                        <td>${service.account.acc_idcard}</td>
	                        <td>${service.account.acc_name}</td>
	                        <td>${service.ser_os}</td>
	                        <td>${service.ser_ip}</td>
	                        <td>
		                            <a onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this);">${service.fee.fee_name}</a>
		                            <!--浮动的详细信息-->
		                            <div class="detail_info">
		                                ${service.fee.fee_desc}
		                            </div>
		                        </td> 
		                        <c:choose>
		                        	<c:when test="${service.ser_status==2}">
		                        		<td id="${service.ser_id-1000}">暂停</td>                           
				                        <td class="td_modi" id="${service.ser_id}">
				                            <input type="button" value="开通" class="btn_start" onclick="change(${service.ser_id},1,${service.acc_id});" />
				                            <input type="button" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath }/service/updateService.action?ser_id=${service.ser_id}';" />
				                            <input type="button" id="del" value="删除" class="btn_delete" onclick="dele(${service.ser_id});" />
				                        </td>
		                        	</c:when>
		                        	<c:when test="${service.ser_status==1}">
		                        		<td id="${service.ser_id-1000}">开通</td>                           
				                        <td class="td_modi" id="${service.ser_id}">

				                            <input type="button" value="暂停" class="btn_pause" onclick="change(${service.ser_id},2,${service.acc_id});" />
				                            <input type="button" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath }/service/updateService.action?ser_id=${service.ser_id}';" />
				                            <input type="button" id="del" value="删除" class="btn_delete" onclick="dele(${service.ser_id});"/>
				                        </td>
		                        	</c:when>
		                        	<c:when test="${service.ser_status==0}">
		                        		<td>删除</td>                           
				                        <td></td>
		                        	</c:when>
		                        </c:choose>
                    	</tr>
                    </c:forEach>                                             
                </table>                
                <p>业务说明：<br />
                1、创建即开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、业务账号不设计修改密码功能，由用户自服务功能实现；<br />
                6、暂停和删除状态的账务账号下属的业务账号不能被开通。</p> 
                </div>                    
                <!--分页-->
                <div id="pages">
                    <a id="start" onclick="sub(1)"
                    	<c:if test="${pageIndex==1}">
                    		class="current_page"
                    	</c:if>
                    >首页</a>
                    
        	        <a onclick="sub(${pageIndex-1})"
        	        >上一页</a>
        	        
        	        <c:choose>
        	        <c:when test="${pageIndex==1&&tatolPages==1}">
        	        	<a onclick="sub(1)"
	                    	<c:if test="${pageIndex==1}">
	            				class="current_page"
	            			</c:if>
	                    >1</a>
        	        </c:when>
        	        
        	        <c:when test="${pageIndex<=2&&tatolPages==2}">
        	        	<a onclick="sub(1)"
	                    	<c:if test="${pageIndex==1}">
	            				class="current_page"
	            			</c:if>
	                    >1</a>
	                    <a onclick="sub(2)"
	                    	<c:if test="${pageIndex==2}">
	            				class="current_page"
	            			</c:if>
	                    >2</a>
        	        </c:when>
        	        
        	        <c:when test="${pageIndex<=1&&tatolPages>=3}">
	                    <a onclick="sub(1)"
	                    	<c:if test="${pageIndex==1}">
	            				class="current_page"
	            			</c:if>
	                    >1</a>
	                    <a onclick="sub(2)"
	                    	<c:if test="${pageIndex==2}">
	            				class="current_page"
	            			</c:if>
	                    >2</a>
	                    <a onclick="sub(3)"
	                    	<c:if test="${pageIndex==3}">
	            				class="current_page"
	            			</c:if>
	                    >3</a>
	                </c:when>
	                
	                <c:when test="${pageIndex>=2&&pageIndex<=(tatolPages-1)&&tatolPages>=3}">
	                	<a onclick="sub(${pageIndex-1})">${pageIndex-1}</a>
	                    <a onclick="sub(${pageIndex})" class="current_page">${pageIndex}</a>
	                    <a onclick="sub(${pageIndex+1})">${pageIndex+1}</a>
	                </c:when>
	                
	                <c:when test="${pageIndex>=tatolPages&&tatolPages>=3}">
	                	<a onclick="sub(${tatolPages-2})"
	                    	<c:if test="${pageIndex==tatolPage-2}">
	            				class="current_page"
	            			</c:if>
	                    >${tatolPages-2}</a>
	                    <a onclick="sub(${tatolPages-1})"
	                    	<c:if test="${pageIndex==tatolPages-1}">
	            				class="current_page"
	            			</c:if>
	                    >${tatolPages-1}</a>
	                    <a onclick="sub(${tatolPages})"
	                    	<c:if test="${pageIndex==tatolPages}">
	            				class="current_page"
	            			</c:if>
	                    >${tatolPages}</a>
	                </c:when>
	                </c:choose>
                   
                    <a onclick="sub(${pageIndex+1})"
                    >下一页</a>
                    <a onclick="sub(${tatolPages})"
                    	<c:if test="${pageIndex==tatolPages}">
                    		class="current_page"
                    	</c:if>
                    >末页</a>
                    <a>共&nbsp;${tatolPages}&nbsp;页</a>
                </div>                    
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
