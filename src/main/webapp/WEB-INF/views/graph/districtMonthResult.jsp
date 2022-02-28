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
	right: 27%;
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
    <div id="지역단위 월별 미세먼지 경보발령 현황" style="height: 500px; width: 70%;"></div>
    <div id="legend" class="line-chart-legend"></div>
</body>

<script>
	const monthNames = ["", "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
	
	var lineChart = Morris.Line({
        element: '지역단위 월별 미세먼지 경보발령 현황',
        data: [
            { m: '1월', 서울: 1, 경기: 1, 인천: 3, 세종: 0, 충북: 1, 충남: 1, 대전: 1, 전북: 3, 전남: 0, 광주: 0, 대구: 1, 경북: 2, 경남: 5, 울산: 0, 부산: 5, 강원: 1, 제주: 0},
  	   	    { m: '2월', 서울: 3, 경기: 10, 인천: 5, 세종: 4, 충북: 8, 충남: 8, 대전: 3, 전북: 10, 전남: 2, 광주: 2, 대구: 1, 경북: 2, 경남: 6, 울산: 0, 부산: 4, 강원: 4, 제주: 2},
  	        { m: '3월', 서울: 7, 경기: 33, 인천: 31, 세종: 4, 충북: 15, 충남: 20, 대전: 10, 전북: 15, 전남: 7, 광주: 4, 대구: 8, 경북: 19, 경남: 103, 울산: 5, 부산: 26, 강원: 20, 제주: 6},
  	        { m: '4월', 서울: 1, 경기: 7, 인천: 6, 세종: 1, 충북: 4, 충남: 3, 대전: 3, 전북: 5, 전남: 2, 광주: 2, 대구: 1, 경북: 4, 경남: 10, 울산: 1, 부산: 3, 강원: 4, 제주: 1},
  	        { m: '5월', 서울: 7, 경기: 30, 인천: 21, 세종: 4, 충북: 18, 충남: 19, 대전: 12, 전북: 18, 전남: 10, 광주: 7, 대구: 2, 경북: 14, 경남: 54, 울산: 1, 부산: 12, 강원: 20, 제주: 5},
  	        { m: '6월', 서울: 0, 경기: 0, 인천: 0, 세종: 0, 충북: 0, 충남: 0, 대전: 0, 전북: 0, 전남: 0, 광주: 0, 대구: 0, 경북: 0, 경남: 0, 울산: 0, 부산: 0, 강원: 0, 제주: 0},
  	        { m: '7월', 서울: 0, 경기: 0, 인천: 0, 세종: 0, 충북: 0, 충남: 0, 대전: 0, 전북: 0, 전남: 0, 광주: 0, 대구: 0, 경북: 0, 경남: 0, 울산: 0, 부산: 0, 강원: 0, 제주: 0},
  	        { m: '8월', 서울: 0, 경기: 0, 인천: 0, 세종: 0, 충북: 0, 충남: 0, 대전: 0, 전북: 0, 전남: 0, 광주: 0, 대구: 0, 경북: 0, 경남: 0, 울산: 0, 부산: 0, 강원: 0, 제주: 0},
  	        { m: '9월', 서울: 0, 경기: 0, 인천: 0, 세종: 0, 충북: 0, 충남: 0, 대전: 0, 전북: 0, 전남: 0, 광주: 0, 대구: 0, 경북: 0, 경남: 0, 울산: 0, 부산: 0, 강원: 0, 제주: 0},
  	        { m: '10월', 서울: 0, 경기: 0, 인천: 0, 세종: 0, 충북: 0, 충남: 0, 대전: 0, 전북: 0, 전남: 0, 광주: 0, 대구: 0, 경북: 0, 경남: 0, 울산: 0, 부산: 0, 강원: 0, 제주: 0},
  	        { m: '11월', 서울: 2, 경기: 7, 인천: 9, 세종: 2, 충북: 4, 충남: 5, 대전: 0, 전북: 2, 전남: 0, 광주: 1, 대구: 1, 경북: 0, 경남: 0, 울산: 0, 부산: 0, 강원: 1, 제주: 0},
  	        { m: '12월', 서울: 1, 경기: 2, 인천: 4, 세종: 1, 충북: 0, 충남: 3, 대전: 2, 전북: 2, 전남: 0, 광주: 0, 대구: 0, 경북: 0, 경남: 0, 울산: 0, 부산: 0, 강원: 0, 제주: 0}
        ],
        xkey: 'm',
        parseTime: false,
        ykeys: ['서울', '경기', '인천', '세종', '충북', '충남', '대전', '전북', '전남', '광주', '대구', '경북', '경남', '울산', '부산', '강원', '제주'],
        labels: ['서울', '경기', '인천', '세종', '충북', '충남', '대전', '전북', '전남', '광주', '대구', '경북', '경남', '울산', '부산', '강원', '제주'],
        xLabelFormat: function (x) {
            var index = parseInt(x.src.m);
            return monthNames[index];
        },
        xLabels: "month",
        lineColors: ["#FFFF00", "#FF9900", "#FF0000", "#075de8", "#a3b0c4", "#2c13cf", "#6a13cf", "#c213cf", "#cf1371", "#13cf35", "#8cde9b", "#47f502", "#a8f502", "#f52a02", "#e8a497", "#04ded7", "#a6edeb"],
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