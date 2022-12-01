<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>

<script type="text/javascript">
	
	function barChart(){
	
		var data = {
	
				labels: ["09시", "10시", "11시", "12시", "13시", "14시", "15시", "16시", "17시", "18시", "19시", "20시", "21시", "22시"],
	
				datasets: [
	
					{
	
						label: "",
	
						fillColor: "rgba(150,200,250,0.5)",
	
						strokeColor: "rgba(150,200,250,0.8)",
	
						highlightFill: "rgba(150,200,250,0.75)",
	
						highlightStroke: "rgba(150,200,250,1)",
	
						data: [65, 59, 80, 81, 56, 55, 30, 100, 120, 50, 11, 40, 70, 120]
	
					}
	
				]
	
			};
	
	    var ctx = document.getElementById("barCanvas").getContext("2d");
	
	    var options = { };
	
	    var barChart = new Chart(ctx).Bar(data, options);
	
	}
</script>



</head>
<body>
	
	<div>
		<button type="button" onclick="barChart()">버튼</button>
	</div>
	
	<div class="graphBox">
		<canvas id="barCanvas" width="384" height="210"></canvas>
	</div>




</body>
</html>