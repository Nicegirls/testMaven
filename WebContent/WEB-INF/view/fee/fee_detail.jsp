<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>资费详情</title>
        <%@include file="../include/header.jsp" %>
        <script language="javascript" type="text/javascript">
            $(function(){
            	$(".fee_off").attr("class","fee_on");
            	var fee_type=${fee.fee_type};
        		if(fee_type==1){
        			$("#fee_btime").hide();
        			$("#fee_ufee").hide();
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
        			$("#fee_bfee").hide();
        			$("#fee_ufee").show();
        			$("#timeBased").attr("checked","checked");
        		}
            })
            $(function(){
            	$(".fee_off").attr("class","fee_on");
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
                <div class="text_info clearfix"><span>资费ID：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly="readonly" value="${fee.fee_id}" /></div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly="readonly" value="${fee.fee_name}"/></div>
                <div class="text_info clearfix"><span>资费状态：</span></div>
                <div class="input_info">
                    <select class="readonly" disabled="disabled">
                    <c:if test="${fee.fee_status==1}">
                    	<option>包月</option>
                    </c:if>
                    <c:if test="${fee.fee_status==2}">
                    	<option>套餐</option>
                    </c:if>
                    <c:if test="${fee.fee_status==3}">
                    	<option>计时</option>
                    </c:if>
                    </select>                        
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info fee_type">
                    <input type="radio" name="radFeeType" id="monthly" disabled="disabled" />
                    <label for="monthly">包月</label>
                    <input type="radio" name="radFeeType" id="package" disabled="disabled" />
                    <label for="package">套餐</label>
                    <input type="radio" name="radFeeType" id="timeBased" disabled="disabled" />
                    <label for="timeBased">计时</label>
                </div>
                <div id="fee_btime">
	                <div class="text_info clearfix"><span>基本时长：</span></div>
	                <div class="input_info">
	                    <input type="text" class="readonly" readonly="readonly" value="${fee.fee_btime}"  />
	                    <span>小时</span>
	                </div>
                </div>
                <div id="fee_bfee">
	                <div class="text_info clearfix"><span>基本费用：</span></div>
	                <div class="input_info">
	                    <input type="text" id="fee_bfee" class="readonly" readonly="readonly" value="${fee.fee_bfee}" />
	                    <span>元</span>
	                </div>
                </div>
                <div id="fee_ufee">
	                <div class="text_info clearfix"><span>单位费用：</span></div>
	                <div class="input_info">
	                    <input type="text" id="" class="readonly" readonly="readonly" value="${fee.fee_ufee}" />
	                    <span>元/小时</span>
	                </div>
	            </div>
                <div class="text_info clearfix"><span>创建时间：</span></div>
                <div class="input_info"><input type="text"  class="readonly" readonly="readonly" value="<fmt:formatDate value="${fee.fee_cretime}" type="both" />" /></div>      
                <div class="text_info clearfix"><span>启动时间：</span></div>
                <div class="input_info"><input type="text"  class="readonly" readonly="readonly" value="<fmt:formatDate value="${fee.fee_otime}" type="both" />" /></div>      
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70 readonly" readonly>${fee.fee_desc}</textarea>
                </div>                    
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/fee/getAllFees.action'" />
                </div>
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
