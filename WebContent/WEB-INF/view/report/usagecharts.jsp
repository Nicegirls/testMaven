<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../include/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 600px; height: 400px; background-color: white">
		<div id="main"
			style="width: 600px; height: 400px; background-color: white"></div>
	</div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));

		// 指定图表的配置项和数据
		var option = {
			title : {
				text : '资费使用率',
				subtext : '每种资费标准的使用次数',
				x : 'center'
			},
			color : [ '#c23531', '#91c7ae', '#d48265' ],
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				left : 'left',
				data : [ '包月', '套餐', '计时' ]
			},
			series : [ {
				name : '资费类型',
				type : 'pie',
				radius : '55%',
				center : [ '50%', '60%' ],
				data : [ {
					value : parseInt('${i}'),
					name : '包月'
				}, {
					value : parseInt('${j}'),
					name : '套餐'
				}, {
					value : parseInt('${k}'),
					name : '计时'
				}, ],
				itemStyle : {
					emphasis : {
						shadowBlur : 10,
						shadowOffsetX : 0,
						shadowColor : 'rgba(0, 0, 0, 0.10)'
					}
				}
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	</script>
</body>
</html>