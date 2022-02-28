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
	right: 1%;
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
    <div id="전국단위  일별 미세먼지 경보발령 현황" style="height: 100%; width: 96%;"></div>
    <div id="legend" class="line-chart-legend"></div>
</body>

<script>
const dayNames = ["", "1일", "2일", "3일", "4일", "5일", "6일", "7일", "8일", "9일", "10일", "11일", "12일", "13일", "14일", "15일", "16일", "17일", "18일", "19일", "20일", "21일", "22일", "23일", "24일", "25일", "26일", "27일", "28일", "29일", "30일", "31일"];
var lineChart = Morris.Line({
	 
	  element: '전국단위  일별 미세먼지 경보발령 현황',
	  
	  data: [
            { s: '1일', a: 0, b: 64, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	   	    { s: '2일', a: 0, b: 8, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '3일', a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '4일', a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '5일', a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '6일', a: 0, b: 12, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '7일', a: 0, b: 14, c: 0, d: 0, e: 126, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '8일', a: 0, b: 0, c: 0, d: 0, e: 54, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 1},
	        { s: '9일', a: 0, b: 0, c: 0, d: 0, e: 36, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '10일', a: 0, b: 0, c: 30, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '11일', a: 0, b: 15, c: 18, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	   	    { s: '12일', a: 0, b: 28, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '13일', a: 5, b: 3, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '14일', a: 5, b: 2, c: 9, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '15일', a: 6, b: 0, c: 6, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 27},
	        { s: '16일', a: 11, b: 0, c: 29, d: 11, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 10},
	        { s: '17일', a: 0, b: 0, c: 1, d: 41, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '18일', a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '19일', a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 48, l: 0},
	        { s: '20일', a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 14, l: 0},
	        { s: '21일', a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 4, l: 0},
	   	    { s: '22일', a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '23일', a: 0, b: 0, c: 9, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '24일', a: 0, b: 0, c: 0, d: 0, e: 48, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '25일', a: 0, b: 0, c: 0, d: 0, e: 14, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '26일', a: 0, b: 0, c: 24, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '27일', a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '28일', a: 0, b: 0, c: 0, d: 12, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '29일', a: 0, b: 0, c: 196, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '30일', a: 2, b: 0, c: 60, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0},
	        { s: '31일', a: 0, b: 0, c: 1, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0, k: 0, l: 0}
      ],
	 
	  xkey: 's',
	  ykeys: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l'],
	  labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  xLabels: "day",
	  lineColors: ["#FFFF00", "#FF9900", "#FF0000", "#075de8", "#a3b0c4", "#2c13cf", "#6a13cf", "#c213cf", "#cf1371", "#13cf35", "#8cde9b", "#47f502"],
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