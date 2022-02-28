<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

<style>
    .line-chart-legend {
	display: inline-block;
	right: 5%;
	position: absolute;
	top: 12px;
	font-size: 12px;
	}
	
	.bar-chart-legend .legend-item {
	display: block;
	}
	
	.bar-chart-legend .legend-color {
	width: 12px;
	height: 12px;
	margin: 3px 5px;
	display: inline-block;
	}
</style>
</head>

<body>
    <div id="전국단위 시간별 미세먼지 경보발령 현황" style="height: 100%; width: 100%;"></div>
    <div id="legend" class="line-chart-legend"></div>
</body>

<script>
const hourNames = ["", "0시", "1시", "2시", "3시", "4시", "5시", "6시", "7시", "8시", "9시", "10시", "11시", "12시", "13시", "14시", "15시", "16시", "17시", "18시", "19시", "20시", "21시", "22시", "23시"];

	var lineChart = Morris.Line({
	 
	  element: '전국단위 시간별 미세먼지 경보발령 현황',
	  
	  data: [
         	{ t: '0시', a: 22},
            { t: '1시', a: 20},
	   	    { t: '2시', a: 23},
	        { t: '3시', a: 15},
	        { t: '4시', a: 21},
	        { t: '5시', a: 47},
	        { t: '6시', a: 37},
	        { t: '7시', a: 29},
	        { t: '8시', a: 27},
	        { t: '9시', a: 20},
	        { t: '10시', a: 42},
	        { t: '11시', a: 46},
	   	    { t: '12시', a: 50},
	        { t: '13시', a: 62},
	        { t: '14시', a: 48},
	        { t: '15시', a: 29},
	        { t: '16시', a: 32},
	        { t: '17시', a: 32},
	        { t: '18시', a: 41},
	        { t: '19시', a: 30},
	        { t: '20시', a: 34},
	        { t: '21시', a: 31},
	   	    { t: '22시', a: 27},
	        { t: '23시', a: 28}
      ],
	 
	  xkey: 't',
	  ykeys: ['a'],
	  labels: ['SUM'],
	  xLabels: "hour",
	  lineColors: ["#FF0000"],
	  parseTime: false,
	  hideHover: 'auto'
	});

  lineChart.options.labels.forEach(function(label, i) {
    var legendItem = $('<span></span>').text(label).prepend('<br><span>&nbsp;</span>');
    legendItem.find('span')
      .css('backgroundColor', lineChart.options.lineColors[i])
      .css('width', '20px')
      .css('display', 'inline-block')
      .css('margin', '5px'); 
    $('#legend').append(legendItem)
  }); 
  
</script>
</html>