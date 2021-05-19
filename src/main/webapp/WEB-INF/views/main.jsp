<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must_revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Corona Live : Main</title>
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/main.css" />
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.0/chart.min.js" integrity="sha512-RGbSeD/jDcZBWNsI1VCvdjcDULuSfWTtIva2ek5FtteXeSjLfXac4kqkDRHVGf1TwsXCAqPTF7/EYITD0/CTqw==" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	//function window::onload()
	window.onload = function () {  
		fn_getPatientDataList();
		fn_getDeadDataList();	    
		fn_getQuarantineDataList();
		fn_getAreaList();

	    document.getElementById('legend-div').innerHTML = window.pieChart.generateLegend();
	}
	
	function fn_getAreaList(){
		$.ajax({	 
            url: "/patientAreaData",
            type: "get", 
            success: function(result){           	
            	pieChartDraw(result);
            },
            error: function () {
            	console.log("에러")
            }
        });
	}

	let pieChartDraw = function (resultData) {
		var areaPatient = resultData.areaPatient;
    	
		let ctx = document.getElementById('pieChartCanvas').getContext('2d');
	    
	    window.pieChart = new Chart(ctx, {
	        type: 'pie',
	        data: {labels: ['서울 신환', '부산 신환', '대구 신환', '인천 신환', '광주 신환', '대전 신환', '울산 신환'],
    	    	datasets: [{
	    	        data: [areaPatient.cldap_seoul, areaPatient.cldap_busan, areaPatient.cldap_daegu, areaPatient.cldap_incheon, areaPatient.cldap_gwangju, areaPatient.cldap_daejeon,areaPatient.cldap_ulsan],
	    	        backgroundColor: ['rgb(255, 100, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(1, 1, 250)','rgb(100, 100, 100)']
	    	    }]},
	        options: {
	            responsive: false
	        }
	    });
	};
	
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic1);
	
	function fn_getPatientDataList() {
		$.ajax({	 
            url: "/patientDataList",
            type: "get", 
            success: function(result){
            	drawBasic1(result);
            },
            error: function () {
            	console.log("error");
            }
        });
	};
	
	function drawBasic1(returnData) {
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'week');
		data.addColumn('number', 'patient');
		var dailyPatient = returnData.dailyPatient;
		var rowArr = [];

		for (i = dailyPatient.length-1; i >= 0; i--) {
			var rowArr2 = [];
			rowArr2.push(dailyPatient[i].date);
			rowArr2.push(dailyPatient[i].sumPatient);
			rowArr.push(rowArr2);
		};
			data.addRows(rowArr);

		var options = {
				title: '이번주 일별 신환',
				hAxis: {
				title: 'week',
				viewWindow: {
				min: [7, 30, 0],
				max: [17, 30, 0]
				}
				},
				vAxis: {
					title: '신규환자'
				}
		};
		var chart = new google.visualization.ColumnChart(
			document.getElementById('chart_div_square1'));
			chart.draw(data, options);
	}
	
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic2);

	function fn_getDeadDataList() {
		$.ajax({	 
            url: "/deadDataList",
            type: "get", 
            success: function(result){
            	drawBasic2(result);
            },
            error: function () {
            	console.log("error")
            }
        });
	};
	
	function drawBasic2(returnData) {
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'week');
		data.addColumn('number', 'dead');
		var dailyDead = returnData.dailyDead;
		var rowArr = [];
		
		for (i = dailyDead.length-1; i >= 0; i--) {
			var rowArr2 = [];
			rowArr2.push(dailyDead[i].date);
			rowArr2.push(dailyDead[i].sumDead);
			rowArr.push(rowArr2);
		};
			data.addRows(rowArr);

		var options = {
				title: '이번주 일별 사망자',
				hAxis: {
				title: 'week',
				viewWindow: {
				min: [7, 30, 0],
				max: [17, 30, 0]
				}
				},
				vAxis: {
					title: '사망자'
				}
		};
		var chart = new google.visualization.ColumnChart(
			document.getElementById('chart_div_square2'));
			chart.draw(data, options);
	}

	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic3);
	
	function fn_getQuarantineDataList() {
		$.ajax({	 
            url: "/quarantineDataList",
            type: "get", 
            success: function(result){
            	drawBasic3(result);
            },
            error: function () {
            	console.log("error")
            }
        });
	};
	
	function drawBasic3(returnData) {
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'week');
		data.addColumn('number', 'quarantine');
		var dailyQuarantine = returnData.dailyQuarantine;
		var rowArr = [];
		
		for (i = dailyQuarantine.length-1; i >= 0; i--) {
			var rowArr2 = [];
			rowArr2.push(dailyQuarantine[i].date);
			rowArr2.push(dailyQuarantine[i].sumQuarantine);
			rowArr.push(rowArr2);
		};
			data.addRows(rowArr);

		var options = {
				title: '이번주 일별 격리 해제',
				hAxis: {
				title: 'week',
				viewWindow: {
				min: [7, 30, 0],
				max: [17, 30, 0]
				}
				},
				vAxis: {
					title: '격리해제'
				}
		};
		var chart = new google.visualization.ColumnChart(
			document.getElementById('chart_div_square3'));
			chart.draw(data, options);
	}

	
	</script>
	<style>
		#pieChartCanvas {width: 350px; height: 350px; display: inline-block;} 
	</style>
</head>
<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>
	<div class="body1">
		<c:if test="${userInfo == null}">
			<div class="loginBox">
				<h1>이 홈페이지의 모든 정보는 회원만 열람할 수 있습니다</h1>
			    <div class="login_area">
					<a href="/user/login">로그인하러 가기</a>
					<a href="/user/join">회원가입하러 가기</a>
				</div>
			</div>
			<div class="liveNumNon">
				<ul>
		    		<li>
		    		<strong class="title">확진환자</strong>
		    		<span class="num">
		    			<span class="mini"><span class="mini_title">누적</span></span>
		    			회원전용
		    		</span>
		    		<span class="before">(???)</span>
		    		</li>
		    		<li>
		    			<strong class="title">격리해제</strong>
		    			<span class="num">회원전용</span>
		    			<span class="before">(+???)</span>
		    		</li>
		    		<li>
		    			<strong class="title">의심환자</strong>
		    			<span class="num">회원전용</span>
		    			<span class="before">(+???)</span>
		    		</li>
		    		<li>
		    			<strong class="title">사망</strong>
		    			<span class="num">회원전용</span>
		    			<span class="before">(+???)</span>
		    		</li>
		    	</ul>
		    </div>
		</c:if>
	</div>
	<div class="body2">
		<c:if test="${userInfo != null}">
		
		    <div class="liveNum_area">
		    	<ul class="liveNum" style="width:562px">
		    		<li>
		    		<strong class="title">확진환자</strong>
		    		<span class="num">
		    			<span class="mini"><span class="mini_title">누적</span></span>
		    			${patient}
		    		</span>
		    		<span class="before">(+${dailyNewPatient})</span>
		    		</li>
		    		<li>
		    			<strong class="title">격리해제</strong>
		    			<span class="num">${quarantine}</span>
		    			<span class="before">(+${dailyNewQuarantine})</span>
		    		</li>
		    		<li>
		    			<strong class="title">의심환자</strong>
		    			<span class="num">${suspicion}</span>
		    			<span class="before">(+${dailyNewSuspicion})</span>
		    		</li>
		    		<li>
		    			<strong class="title">사망</strong>
		    			<span class="num">${dead}</span>
		    			<span class="before">(+${dailyNewDead})</span>
		    		</li>
		    	</ul>
		    </div>
		    <div id="chart_div_square1"></div>
			<div id="chart_div_square2"></div>
			<div id="chart_div_square3"></div>
		   	<div id="chart_div_pie">
            	<canvas id="pieChartCanvas"></canvas>
		   		<p>오늘의 지역별 확진자</p>
		   		<span>(마우스를 가져다 대시면 정확한 수치확인이 가능합니다)</span>
        	</div>
        	<div class="newNewsBox">
        		<div><a href="/category/corona_news">뉴스더보기</a></div>
	        	<c:forEach items="${postNewsListMain}" var="post" >
					<div class="postNewsListMain">
		        		<div><a href="/postDetailPage?pi_seq=${post.pi_seq}&pi_board_seq=${post.pi_board_seq}&pi_title=${post.pi_title}&pi_content=${post.pi_content}"><span>제목 : ${post.pi_title}</span></a></div>
		        		<div><a href="/postDetailPage?pi_seq=${post.pi_seq}&pi_board_seq=${post.pi_board_seq}&pi_title=${post.pi_title}&pi_content=${post.pi_content}"><span>내용 : ${post.pi_content}</span></a></div>
		        	</div>
	        	</c:forEach>
        	</div>
        </c:if>
	</div>	
        
</body>
</html>