<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">
<title>EChartsDemo</title>
<script type="text/javascript" src="js/echarts.js"></script>
<script type="text/javascript">
	function initData() {
		// 找到要绘制图表的div
		var myChart = echarts.init(document.getElementById('main'));

		// 配置图表的各种属性。
		var option = {
			title : {
				text : 'ECharts 入门示例'
			},
			tooltip : {},
			legend : {
				data : [ '销量','销售额' ]
			},
			xAxis : {
				data : [ "衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子" ]
			},
			yAxis : {},
			series : [ {
				name : '销量',
				type : 'bar',
				data : [ 5, 20, 36, 10, 10, 20 ]
			},{
				name : '销售额',
				type : 'line',
				data : [ 80, 400, 800, 80, 800, 40 ]
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	}
</script>
</head>

<body onload="initData();">
	<div id="main" style="width:800px;height:600px;border:1px solid;"></div>
</body>
</html>