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
	// 准备一个调用后台服务的核心对象
	var xmlHttp ;
	
	function initData() {
		// 调用后台服务器操作
		// 建立核心对象
		xmlHttp = new XMLHttpRequest();
		// 设置后台进行数据库操作的Servlet地址。
		xmlHttp.open("get","servlet/LoadDataServlet");
		// 设置读取到数据后继续处理的js回调函数
		xmlHttp.onreadystatechange = initDataCallback;
		// 发送数据
		xmlHttp.send();
	}
	
	function initDataCallback() {
		// 判断数据是否完全返回了
		if (xmlHttp.readyState == 4) {
			// 判断是否正确返回
			if (xmlHttp.status == 200) {
				// 接收结果
				var result = eval("("+xmlHttp.responseText+")");
				
				
				// 开始写到图表中。
				// 找到要绘制图表的div
				var myChart = echarts.init(document.getElementById('main'));
				
				var xArray = new Array();
				var dataArray = new Array();
				// 根据返回的数据来建立数组
				for (var i = 0;i < result.length;i++) {
					xArray[i] = result[i].userid;
					dataArray[i] = result[i].favCount;
				}
				

				// 配置图表的各种属性。
				var option = {
					title : {
						text : 'ECharts 入门示例'
					},
					tooltip : {},
					legend : {
						data : [ "收藏量" ]
					},
					xAxis : {
						data : xArray
					},
					yAxis : {},
					series : [ {
						name : '收藏量',
						type : 'bar',
						data : dataArray
					} ]
				};

				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(option);
			}
		}
	}
</script>
</head>

<body onload="initData();">
	<div id="main" style="width:800px;height:600px;border:1px solid;"></div>
</body>
</html>
