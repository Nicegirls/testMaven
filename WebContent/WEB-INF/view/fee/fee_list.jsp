<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>资费列表</title>
        <%@include file="../include/header.jsp"%>
        <script language="javascript" type="text/javascript">
        	function showPage(page){
        		$("#pages").empty();
        		if(page==null){
        			var nowPage=${page.nowPage};
        			var allPage=${page.allPage};
        		}else{
        			var nowPage=page.nowPage;
        			var allPage=page.allPage;
        		}
        		var nowPageTemp=nowPage;
        		var str="<a name='page' value='1'>首页</a><a name='page' value='"+(nowPageTemp-1)+"'>上一页</a>";
        		if(nowPage==1){
        			for(var a=1;nowPage<=allPage;nowPage++){
        				a=a+1;
        				if(a==2){
        					str=str+"<a name='page' class='current_page' value='"+nowPage+"'>"+nowPage+"</a>";
        				}else{
        					str=str+"<a name='page' value='"+nowPage+"'>"+nowPage+"</a>";
        				}
        				if(a==4){
        					break;
        				}
        			}
        		}else if(nowPage==allPage){
        			nowPage=nowPage-2;
        			for(var a=1;;nowPage++){
        				a=a+1;
        				if(nowPage<1){
        					continue;
        				}
        				if(a==4){
        					str=str+"<a name='page' class='current_page' value='"+nowPage+"'>"+nowPage+"</a>";
        				}else{
        					str=str+"<a name='page' value='"+nowPage+"'>"+nowPage+"</a>";
        				}
        				if(a==4){
        					break;
        				}
        			}
        		}else{
        			nowPage=nowPage-1;
        			for(var a=1;;nowPage++){
        				a=a+1;
        				if(a==3){
        					str=str+"<a name='page' class='current_page' value='"+nowPage+"'>"+nowPage+"</a>";
        				}else{
        					str=str+"<a name='page' value='"+nowPage+"'>"+nowPage+"</a>";
        				}
        				if(a==4){
        					break;
        				}
        			}
        		}
        		str=str+"<a name='page' value='"+(nowPageTemp+1)+"'>下一页</a><a name='page'>末页</a><a>共"+allPage+"页</a>"
        		$("#pages").append(str);
        		if(nowPageTemp==1){
        			$("#pages").children(":first").attr("class","current_page");
        			if(allPage==1){
        				$("#pages").children(":last").prev().attr("value",allPage);
        				$("#pages").children(":last").prev().attr("class","current_page");
        			}else{
        				$("#pages").children(":last").prev().attr("value",allPage);
        			}
        		}else if(nowPageTemp==allPage){
        			$("#pages").children(":first").attr("value",1);
        			$("#pages").children(":last").prev().attr("value",allPage);
        			$("#pages").children(":last").prev().attr("class","current_page");
        		}else{
        			$("#pages").children(":first").attr("value",1);
        			$("#pages").children(":last").prev().attr("value",allPage);
        		}
        	}
        	function show(result){
        		var fees=result.fees;
    			$("#datalist").empty();
    			$("#datalist").append("<tr><th style='width: 54px'>资费ID</th><th class='width100'>资费名称</th><th style='width: 72px'>基本时长</th><th style='width: 72px'>基本费用</th><th style='width: 72px'>单位费用</th><th style='width: 156px'>创建时间</th><th style='width: 156px'>开通时间</th><th class='width50'>状态</th><th class='width200'></th></tr>");
    			$.each(fees, function(index,element) {
    				var fee_cretime=new Date(element.fee_cretime);
    				if(element.fee_otime==null){
    					var fee_otime="/";
    				}else{
    					var date=new Date(element.fee_otime);
    					var fee_otime=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
    				}
    				if(element.fee_type==1){
    					var fee_btime="/";
    					var fee_bfee=element.fee_bfee;
    					var fee_ufee="/";
    				}
    				if(element.fee_type==2){
    					var fee_btime=element.fee_btime;
    					var fee_bfee=element.fee_bfee;
    					var fee_ufee=element.fee_ufee;
    				}
    				if(element.fee_type==3){
    					var fee_btime="/";
    					var fee_bfee="/";
    					var fee_ufee=element.fee_ufee;
    				}
    				var str="<tr id='"+element.fee_id+"'><td>"+element.fee_id+"</td><td><a href='${pageContext.request.contextPath}/fee/getFeeByID.action?a=2&fee_id="+element.fee_id+"'>"+element.fee_name+"</a></td><td>"+fee_btime+"</td><td>"+fee_bfee+"</td><td>"+fee_ufee+"</td><td>"+fee_cretime.getFullYear()+"-"+(fee_cretime.getMonth()+1)+"-"+fee_cretime.getDate()+" "+fee_cretime.getHours()+":"+fee_cretime.getMinutes()+":"+fee_cretime.getSeconds()+"</td><td id="+element.fee_id+">"+fee_otime+"</td>"
    				if(element.fee_status==1){
    					str=str+"<td>开通</td><td></td>";
    				}else{
    					str=str+"<td>暂停</td><td><input type='button' value='开启' class='btn_start' id="+element.fee_id+" /><input type='button' value='修改' class='btn_modify' id="+element.fee_id+" /><input type='button' value='删除' class='btn_delete' id="+element.fee_id+" /></td>";
    				}
					$("#datalist").append(str);
		        });
				$("[value='删除']").click(del) ;
                $("[value='开启']").click(open);
                $("[value='修改']").click(modi);
        	}
        	function sort(){
        		var button=$(this);
        		if(button.val()=="月租"){
        			var term="fee_ufee";
        		}
        		if(button.val()=="基费"){
        			var term="fee_bfee";
        		}
        		if(button.val()=="时长"){
        			var term="fee_btime";
        		}
            	if(button.attr("class")=="sort_asc"){
            		var sort="desc";
            	}else{
            		var sort="asc";
            	}
            	$.post({
            		url:"${pageContext.request.contextPath}/fee/sortFee.action",
            		data:{
            			sort:sort,
            			term:term,
            			onePage:"8",
            			nowPage:"1"
            		},
            		success:function(result){
            			show(result);
            			if(result.sort=="asc"){
            				$("[name='sort']").attr("class","sort_asc");
            				$("#sortTemp").attr("value","asc");
    					}else{
    						$("[name='sort']").attr("class","sort_asc");
    						button.attr("class","sort_desc");
    						$("#sortTemp").attr("value","desc");
    					}
            			$("#termTemp").attr("value",term);
            			var temp=$("#sortTemp").attr("value");
            			showPage(result.page);
            			$("[name='page']").click(page);
            		}
            	})
        	}
        	function page(){
        		var button=$(this);
        		var sort=$("#sortTemp").attr("value");
        		var term=$("#termTemp").attr("value");
        		nowPage=button.attr("value");
        		allPage=$("#pages").children(":last").prev().attr("value");
        		if(nowPage<1){
        			return;
        		}
        		if(nowPage>allPage){
        			return;
        		}
            	$.post({
            		url:"${pageContext.request.contextPath}/fee/sortFee.action",
            		data:{
            			sort:sort,
            			term:term,
            			onePage:"8",
            			nowPage:nowPage
            		},
            		success:function(result){
            			show(result);
            			showPage(result.page);
            			$("[name='page']").click(page);
            		}
            	})
        	}
        	function del(){
        		if(!window.confirm("确定要删除此资费吗？")){
        			return;
        		}
            	var id=$(this).attr("id")
            	$.post({
            		url:"${pageContext.request.contextPath}/fee/deleteFee.action",
            		data:{fee_id:id},
            		success:function(error){
            			if(error==0){
            				$("#save_result_info.save_fail").text("删除失败");
            				$("#save_result_info.save_fail").show().delay(2000).hide(300);
            			}
            			if(error==1){
            				$("tr#"+id).hide();
            				$("#operate_result_info").text("删除成功");
            				$("#operate_result_info").show().delay(2000).hide(300);
            			}
            		}
            	})
        	}
        	function open(){
        		if(!window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。")){
        			return;
        		}
        		var id=$(this).attr("id");
        		var button=$(this);
        		$.post({
        			url:"${pageContext.request.contextPath}/fee/updateFeeState.action",
        			data:{fee_id:id},
        			success:function(error){
        				if(error==0){
        					$("#save_result_info.save_fail").text("启用失败");
        					$("#save_result_info.save_fail").show().delay(2000).hide(300);
        				}else{
        					button.parent().prev().text("开通");
        					var date=new Date();
        					var strDate=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
        					button.parent().prev().prev().text(strDate);
        					button.parent().empty();
        					$("#operate_result_info").text("启用成功");
        					$("#operate_result_info").show().delay(2000).hide(300);
        				}
        			}
        		})
        	}
        	function modi(){
        		var id=$(this).attr("id");
        		window.location.href="${pageContext.request.contextPath}/fee/getFeeByID.action?a=1&fee_id="+id; 
        	}
            $(function(){
            	showPage();
            	$(".fee_off").attr("class","fee_on");
            	$("[name='sort']").click(sort);
	            $("[name='page']").click(page);
            	$("[value='删除']").click(del) ;
                $("[value='开启']").click(open);
                $("[value='修改']").click(modi);
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
       		<div id="save_result_info" class="save_success">删除成功！</div>
            <div id="save_result_info" class="save_fail">删除失败！</div>
            <div id="operate_result_info" class="operate_success">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                                                                  删除成功，且已删除其下属的业务账号！
            </div>
            <form >
                <!--排序-->
                <div class="search_add">
                    <div>
                        <input type="button" name="sort" value="月租" class="sort_asc"/>
                        <input type="button" name="sort" value="基费" class="sort_asc"/>
                        <input type="button" name="sort" value="时长" class="sort_asc"/>
                    </div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/fee/toFee_add.action';" />
                </div> 
                <!--启用操作的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功！
                </div>    
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th style='width: 54px'>资费ID</th>
                            <th class="width100">资费名称</th>
                            <th style='width: 72px'>基本时长</th>
                            <th style='width: 72px'>基本费用</th>
                            <th style='width: 72px'>单位费用</th>
                            <th style='width: 156px'>创建时间</th>
                            <th style='width: 156px'>开通时间</th>
                            <th class="width50">状态</th>
                            <th class="width200"></th>
                        </tr> 
                        <c:forEach items="${fees}" var="fees">                  
                        <tr id="${fees.fee_id}">
                            <td>${fees.fee_id}</td>
                            <td><a href="${pageContext.request.contextPath}/fee/getFeeByID.action?a=2&fee_id=${fees.fee_id}">${fees.fee_name}</a></td>
                            <c:if test="${fees.fee_type==1}">
	                            <td>/</td>
	                            <td>${fees.fee_bfee}</td>
	                            <td>/</td>
                            </c:if>
                            <c:if test="${fees.fee_type==2}">
	                            <td>${fees.fee_btime}</td>
	                            <td>${fees.fee_bfee}</td>
	                            <td>${fees.fee_ufee}</td>
                            </c:if>
                            <c:if test="${fees.fee_type==3}">
	                            <td>/</td>
	                            <td>/</td>
	                            <td>${fees.fee_ufee}</td>
                            </c:if>
                            <td><fmt:formatDate value="${fees.fee_cretime}" type="both" /></td>
                            <td id="${fees.fee_id}"><fmt:formatDate value="${fees.fee_otime}" type="both" /></td>
                        	<c:if test="${fees.fee_status==1}">   
                            <td>开通</td>
                            <td>                              
                            </td>
                       		</c:if> 
                       		<c:if test="${fees.fee_status==2}">
	                        <td>暂停</td>
                        	<td>
                        	<input type="button" value="开启" class="btn_start" id="${fees.fee_id}"/>
                            	<input type="button" value="修改" class="btn_modify" id="${fees.fee_id}" />
                            	<input type="button" value="删除" class="btn_delete" id="${fees.fee_id}" />
                        	</td>
                       		</c:if>  
                       </tr>
                    </c:forEach>
                    </table>
                </div>
                <!--分页-->
                <div id="pages">
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
           <input type="hidden" id="sortTemp">
           <input type="hidden" id="termTemp">
        </div>
    </body>
</html>
