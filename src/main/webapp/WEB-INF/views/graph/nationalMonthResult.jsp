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
	right: 33%;
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
    <div id="전국단위 월별 미세먼지 경보발령 현황" style="height: 100%; width: 70%;"></div>
    <div id="legend" class="line-chart-legend"></div>
</body>

<script>
	const monthNames = ["", "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
	
	var lineChart = Morris.Line({
        element: '전국단위 월별 미세먼지 경보발령 현황',
        data: [
            { m: '1월', a: 21, b: 4, c: 25},
  	   	    { m: '2월', a: 8, b: 66, c: 74},
  	        { m: '3월', a: 209, b: 124, c: 333},
  	        { m: '4월', a: 58, b: 0, c: 58},
  	        { m: '5월', a: 180, b: 74, c: 254},
  	        { m: '6월', a: 0, b: 0, c: 0},
  	        { m: '7월', a: 0, b: 0, c: 0},
  	        { m: '8월', a: 0, b: 0, c: 0},
  	        { m: '9월', a: 0, b: 0, c: 0},
  	        { m: '10월', a: 0, b: 0, c: 0},
  	        { m: '11월', a: 13, b: 21, c: 34},
  	        { m: '12월', a: 0, b: 15, c: 15}
        ],
        xkey: 'm',
        parseTime: false,
        ykeys: ['a', 'b', 'c'],
        labels: ['PM10', 'PM2.5', 'SUM'],
        xLabelFormat: function (x) {
            var index = parseInt(x.src.m);
            return monthNames[index];
        },
        xLabels: "month",
        lineColors: ["#FFFF00", "#FF9900", "#FF0000"],
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