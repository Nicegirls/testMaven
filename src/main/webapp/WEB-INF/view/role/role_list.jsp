<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@include file="../include/header.jsp" %> 
        <script language="javascript" type="text/javascript">
            $(function(){
            	$("[value='删除']").click(function(){
            		var r = window.confirm("确定要删除此管理员吗？");
            		var id=$(this).attr("id")
            		$.post({
            			url:"${pageContext.request.contextPath}/role/removeRoleByRole_id.action",
            			data:{role_id:id},
            			success:function(error){
            				if(error==0){
            					$("#save_result_info.save_fail").text("删除失败");
            					$("#save_result_info.save_fail").show().delay(3000).hide(300);
            				}else{
            					$("#"+id).hide();
            					$("#save_result_info.save_success").text("删除成功");
            					$("#save_result_info.save_success").show().delay(3000).hide(300);
            				}
            			}
            		})
            	})
            })
            
        </script>
    </head>
    <body>
    <%@include file="../include/menu.jsp" %> 
        <!--主要区域开始-->
        <div id="main">
        	<div id="save_result_info" class="save_success">删除成功！</div>
            <div id="save_result_info" class="save_fail">删除失败！</div>
            <form >
                <!--查询-->
                <div class="search_add">
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/role/fillPrivilege.action?a=1';" />
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功！
                </div> <!--删除错误！该角色被使用，不能删除。-->
                <!--数据区域：用表格展示数据-->     
                <div id="data">                      
                    <table id="datalist">
                        <tr>                            
                            <th>角色 ID</th>
                            <th>角色名称</th>
                            <th class="width600">拥有的权限</th>
                            <th class="td_modi"></th>
                        </tr> 
                        <c:forEach items="${roles}" var="role">
	                        	<tr id="${role.role_id}">
	                        		<td >${role.role_id}</td>
	                        		<td>${role.role_name}</td>
	                        		<td>${role.strPri_name}</td>
		                            <td>
		                                <input type="button" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/role/fillPrivilege.action?a=2&role_id=${role.role_id}';"/>
		                                <input type="button" value="删除" class="btn_delete" id="${roler.rid}" />
		                            </td>
		                        </tr>
                        </c:forEach> 
                    </table>
                </div> 
                <!--分页-->
                <div id="pages">
        	        <a href="#">上一页</a>
                    <a href="#" class="current_page">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">下一页</a>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
