<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报表</title>
<%@include file="../include/header.jsp"%>
<script language="javascript" type="text/javascript">
	function changeTab(e, ulObj) {
		var obj = e.srcElement || e.target;
		if (obj.nodeName == "A") {
			var links = ulObj.getElementsByTagName("a");
			for (var i = 0; i < links.length; i++) {
				if (links[i].innerHTML == obj.innerHTML) {
					links[i].className = "tab_on";
				} else {
					links[i].className = "tab_out";
				}
			}
		}
	}
	$(function() {
		$(".report_off").attr("class", "report_on");
		$("#usage").hide();
		$("#chartdiv").hide();
		$("#piediv").hide();
		$("#piesdiv").hide();
	})
	function sub(pageIndex) {
		var tatolPages = ${page.allPage};
		$("#pageIndex").attr("value",pageIndex);
		if (pageIndex >= 1 && tatolPages >= pageIndex) {
			location.href = "${pageContext.request.contextPath}/report/getAllReport.action?pageIndex="+pageIndex;
		}
	}
	function getUsage(){
		$.get({
			url:'${pageContext.request.contextPath}/report/usage.action',
			success:function(result){
				$("#chartdiv").empty();
				$("#chartdiv").hide();
				$("#pages").hide();
				$("#report_data").hide();
				$("#piediv").show();
				showpie(result);
				//$("#usage").show();
				//initCharts(result.i,result.j,result.k);
			}
		})
	}
	function showpie(result){
		var chart = AmCharts.makeChart( "piediv", {
			  "type": "pie",
			  "theme": "none",
			  "dataProvider": [ {
			    "country": "包月",
			    "value": result.i
			  }, {
			    "country": "套餐",
			    "value": result.j
			  }, {
			    "country": "计时",
			    "value": result.k
			  } ],
			  "valueField": "value",
			  "titleField": "country",
			  "outlineAlpha": 0.4,
			  "depth3D": 15,
			  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
			  "angle": 30,
			  "export": {
			    "enabled": true
			  }
			} );
	}
// 	柱状图
	function getChart(){
		$.get({
			url:'${pageContext.request.contextPath}/report/getChart.action',
			success:function(result){
				var chartData=result.reports;
				$("#piediv").empty();
				$("#piediv").hide();
				$("#pages").hide();
				$("#report_data").hide();
				$("#usage").hide();
				$("#chartdiv").show();
				showChart(chartData);
			}
		})
	}
	
	function showChart(chartData){
		var chart = AmCharts.makeChart( "chartdiv", {
			  "type": "serial",
			  "theme": "light",
			  "dataProvider":chartData,
			  "valueAxes": [ {
			    "gridColor": "#FFFFFF",
			    "gridAlpha": 0.2,
			    "dashLength": 0
			  } ],
			  "gridAboveGraphs": true,
			  "startDuration": 1,
			  "graphs": [ {
			    "balloonText": "[[category]]: <b>[[value]]</b>",
			    "fillAlphas": 0.8,
			    "lineAlpha": 0.2,
			    "type": "column",
			    "valueField": "bill_sumtime"
			  } ],
			  "chartCursor": {
			    "categoryBalloonEnabled": false,
			    "cursorAlpha": 0,
			    "zoomable": false
			  },
			  "categoryField": "acc_name",
			  "categoryAxis": {
			    "gridPosition": "start",
			    "gridAlpha": 0,
			    "tickPosition": "start",
			    "tickLength": 20
			  },
			  "export": {
			    "enabled": true
			  }

			} );
	}
	function showTable(){
		$("#piediv").empty();
		$("#piediv").hide();
		$("#usage").hide();
		$("#chartdiv").empty();
		$("#chartdiv").hide();
		$("#pages").show();
		$("#report_data").show();
	}
	 function initCharts(i,j,k){
    	 // 基于准备好的dom，初始化echarts实例
    	var myChart = echarts.init(document.getElementById('main'));
    	
    	// 指定图表的配置项和数据
        var option = {
        	    title : {
        	        text: '资费使用率',
        	        subtext: '每种资费标准的使用次数',
        	        x:'center'
        	    },
        	    color : [ '#c23531', '#91c7ae', '#d48265' ],
        	    tooltip : {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        left: 'left',
        	        data: ['包月','套餐','计时']
        	    },
        	    series : [
        	        {
        	            name: '资费类型',
        	            type: 'pie',
        	            radius : '50%',
        	            center: ['50%', '50%'],
        	            data:[
        	                {value:parseInt(i), name:'包月'},
        	                {value:parseInt(j), name:'套餐'},
        	                {value:parseInt(k), name:'计时'},
        	            ],
        	            itemStyle: {
        	                emphasis: {
        	                    shadowBlur: 10,
        	                    shadowOffsetX: 0,
        	                    shadowColor: 'rgba(0, 0, 0, 0.10)'
        	                }
        	            }
        	        }
        	    ]
        	};

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }

</script>
<script type="text/javascript">
       
        
</script>
</head>
<body>
	<!--Logo区域开始-->
	<%@include file="../include/info.jsp"%>
	<%-- <div id="header">
		<img src="${pageContext.request.contextPath}/images/logo.png"
			alt="logo" class="left" /> <a
			href="${pageContext.request.contextPath}/view/login.jsp">[退出]</a>
	</div> --%>
	<!--Logo区域结束-->
	<!--导航区域开始-->
	<div id="navi">
		<%@include file="../include/menu.jsp"%>
	</div>
	<!--导航区域结束-->
	<!--主要区域开始-->
	<div id="report_main">
		<div class="tabs">
			<ul onclick="changeTab(event,this);">
				<li><a href="javascript:showTable()" class="tab_on" title="每位客户每月的累计时长">客户使用时长</a></li>
				<li><a href="javascript:getChart()" class="tab_out" title="每台服务器上累计时长最高的前三名客户">时长排行榜</a></li>
				<li><a href="javascript:getUsage();" class="tab_out" title="每台服务器每种资费标准的使用次数">资费使用率</a></li>
			</ul>
		</div>
		<div class="report_box">
		<!--数据区域：柱状图-->
		<div id="chartdiv" style='width	: 100%;height: 375px;font-size	: 11px;'></div>
<!-- 		饼状图 -->
		<div id="piediv" style='width	: 100%;height: 375px;'></div>
		<div style="width: 950px; height: 350px; background-color: white" id="usage">
			<div id="main"
				style="width: 950px; height: 350px; background-color: white"></div>
		</div>
			<!--数据区域：用表格展示数据--> 
			<div id="report_data">
				<table id="datalist">
					<tr>
						<th>账号 ID</th>
						<th>账务帐号</th>
						<th>客户名称</th>
						<th class="width200">身份证号码</th>
						<th>电话</th>
						<th class="width150">月份</th>
						<th class="width150">累积时长</th>
					</tr>
					<c:forEach items="${allReports}" var="report">
						<tr>
							<td>${report.acc_id}</td>
							<td>${report.acc_account}</td>
							<td>${report.acc_name}</td>
							<td>${report.acc_idcard}</td>
							<td>${report.acc_telnum}</td>
							<td><fmt:formatDate value="${report.bill_time}"
									pattern="yyyy年MM月" /></td>
							<td>${report.bill_sumtime}小时</td>
						</tr>
					</c:forEach>
				</table>
				<!-- <tr>
                            <td>1</td>
                            <td>mary</td>
                            <td>贾强</td>
                            <td>220222020202020202</td>
                            <td>13987654345</td>
                            <td>2013年2月</td>
                            <td>16小时32分</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>mary</td>
                            <td>贾强</td>
                            <td>220222020202020202</td>
                            <td>13987654345</td>
                            <td>2013年3月</td>
                            <td>16小时32分</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>tony</td>
                            <td>真真</td>
                            <td>220222020202020202</td>
                            <td>13987654345</td>
                            <td>2013年1月</td>
                            <td>16小时32分</td>
                        </tr>
                    </table>
                    <table id="datalist1" style="display:none;">
                        <tr>                            
                            <th class="width300">Unix 服务器IP</th>
                            <th>账务帐号</th>
                            <th>客户名称</th>
                            <th class="width200">身份证号码</th>
                            <th class="width150">累积时长</th>
                        </tr>                      
                        <tr>
                            <td>192.168.0.20</td>
                            <td>mary</td>
                            <td>贾强</td>
                            <td>220222020202020202</td>
                            <td>106小时32分</td>
                        </tr>
                        <tr>
                            <td>192.168.0.20</td>
                            <td>tony</td>
                            <td>米奇</td>
                            <td>220222020202020202</td>
                            <td>96小时32分</td>
                        </tr><tr>
                            <td>192.168.0.20</td>
                            <td>jecy</td>
                            <td>米妮</td>
                            <td>220222020202020202</td>
                            <td>16小时32分</td>
                        </tr>
                        <tr>
                            <td>192.168.0.23</td>
                            <td>mary</td>
                            <td>贾强</td>
                            <td>220222020202020202</td>
                            <td>16小时32分</td>
                        </tr>
                    </table>
                    <table id="datalist2" style="display:none;">
                        <tr>                            
                            <th class="width300">Unix 服务器IP</th>
                            <th>包月</th>
                            <th>套餐</th>
                            <th>计时</th>
                        </tr>                      
                        <tr>
                            <td>192.168.0.20</td>
                            <td>345</td>
                            <td>21</td>
                            <td>34</td>
                        </tr>
                        <tr>
                            <td>192.168.0.23</td>
                            <td>32</td>
                            <td>221</td>
                            <td>314</td>
                        </tr>  -->

			</div>
			<!--分页-->
			<!-- <div id="pages">
				<a href="#">首页</a> <a href="#">上一页</a> <a href="#"
					class="current_page">1</a> <a href="#">2</a> <a href="#">3</a> <a
					href="#">4</a> <a href="#">5</a> <a href="#">下一页</a> <a href="#">末页</a>
			</div> -->
			<div id="pages">
				<a id="start" onclick="sub(1)"
					<c:if test="${page.nowPage==1}">
                    		class="current_page"
                    	</c:if>>首页</a>

				<a onclick="sub(${page.nowPage-1})">上一页</a>

				<c:choose>
					<c:when test="${page.nowPage==1&&page.allPage==1}">
						<a onclick="sub(1)"
							<c:if test="${page.nowPage==1}">
	            				class="current_page"
	            			</c:if>>1</a>
					</c:when>

					<c:when test="${page.nowPage<=2&&page.allPage==2}">
						<a onclick="sub(1)"
							<c:if test="${page.nowPage==1}">
	            				class="current_page"
	            			</c:if>>1</a>
						<a onclick="sub(2)"
							<c:if test="${page.nowPage==2}">
	            				class="current_page"
	            			</c:if>>2</a>
					</c:when>

					<c:when test="${page.nowPage<=1&&page.allPage>=3}">
						<a onclick="sub(1)"
							<c:if test="${page.nowPage==1}">
	            				class="current_page"
	            			</c:if>>1</a>
						<a onclick="sub(2)"
							<c:if test="${page.nowPage==2}">
	            				class="current_page"
	            			</c:if>>2</a>
						<a onclick="sub(3)"
							<c:if test="${page.nowPage==3}">
	            				class="current_page"
	            			</c:if>>3</a>
					</c:when>

					<c:when
						test="${page.nowPage>=2&&page.nowPage<=(page.allPage-1)&&page.allPage>=3}">
						<a onclick="sub(${page.nowPage-1})">${page.nowPage-1}</a>
						<a onclick="sub(${page.nowPage})" class="current_page">${page.nowPage}</a>
						<a onclick="sub(${page.nowPage+1})">${page.nowPage+1}</a>
					</c:when>

					<c:when test="${page.nowPage>=page.allPage&&page.allPage>=3}">
						<a onclick="sub(${page.allPage-2})"
							<c:if test="${page.nowPage==tatolPage-2}">
	            				class="current_page"
	            			</c:if>>${page.allPage-2}</a>
						<a onclick="sub(${page.allPage-1})"
							<c:if test="${page.nowPage==page.allPage-1}">
	            				class="current_page"
	            			</c:if>>${page.allPage-1}</a>
						<a onclick="sub(${page.allPage})"
							<c:if test="${page.nowPage==page.allPage}">
	            				class="current_page"
	            			</c:if>>${page.allPage}</a>
					</c:when>
				</c:choose>

				<a onclick="sub(${page.nowPage+1})">下一页</a> <a
					onclick="sub(${page.allPage})"
					<c:if test="${page.nowPage==page.allPage}">
                    		class="current_page"
                    	</c:if>>末页</a>
				<a>共&nbsp;${page.allPage}&nbsp;页</a>
			</div>
		</div>
	</div>
	<!--主要区域结束-->
	<div id="footer"></div>
</body>
</html>
