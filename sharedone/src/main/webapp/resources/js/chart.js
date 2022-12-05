$(document).ready(function(){
	 $('.report-table-div').hide();
	 $('.subData').hide();
	 
	 
	 	//이번달 매출 누적그래프
		$.ajax({
		    url: 'monthAmount.do',
			type : "POST",
			async : true,
			traditional: true,
			dataType : "json",
			cache : false,
	        success: function (data) {
				
	        	var labels = data.map(function(e) {
	        		   return e.pricingDate;
	        		});
	        		var datas = data.map(function(e) {
	        		   return e.runningTotal;
	        		});
	        		
	        		new Chart(document.getElementById("allAmountGraph"), {
	        		    type: 'line',
	        		    data: {
	        		      labels: labels,
	        		      datasets: [
	        		        {
	        		          label: "누적금액",
	        		          borderColor: 'rgba(75, 192, 192, 1)',
	        	              backgroundColor: 'rgba(75, 192, 192, 0.2)',
	        		          data: datas
	        		        }
	        		      ]
	        		    },
	        		    options: {
	        		      legend: { display: false },
	        		      title: {
	        		        display: true,
	        		        text: '이번달 누적 매출'
	        		      }
	        		    }
	        		});
	        	
			}
		});
	 	//이번달 매출 누적 그래프 끝
	 	
	 	//팀별 누적 매출
		$.ajax({
		    url: 'groupAmount.do',
			type : "POST",
			async : true,
			traditional: true,
			dataType : "json",
			cache : false,
	        success: function (data) {
				
	        	var labels = data.map(function(e) {
	        		   return e.dept;
	        		});
	        		var datas = data.map(function(e) {
	        		   return e.amount;
	        		});
	        		
	        		new Chart(document.getElementById("groupGraph"), {
	        		    type: 'pie',
	        		    data: {
	        		      labels: labels,
	        		      datasets: [
	        		        {
	        		          label: "팀별 매출",
	        		          backgroundColor: ['#fd7c78', '#70dafc', '#fed085', '#b9e88b', '#82a5fc'],
	        		          data: datas
	        		        }
	        		      ]
	        		    },
	        		    options: {
	        		      legend: { display: false },
	        		      title: {
	        		        display: true,
	        		        text: '팀별 매출 합계'
	        		      }
	        		    }
	        		});
	        	
			}
		});
	 	//팀별 누적 매출 끝
	 	
	 	//승인여부 그래프
		$.ajax({
		    url: 'statusAmount.do',
			type : "POST",
			async : true,
			traditional: true,
			dataType : "json",
			cache : false,
	        success: function (data) {
				
	        	var labels = data.map(function(e) {
	        		   return e.status;
	        		});
	        		var datas = data.map(function(e) {
	        		   return e.cnt;
	        		});
	        		
	        		new Chart(document.getElementById("statusGraph"), {
	        		    type: 'bar',
	        		    data: {
	        		      labels: labels,
	        		      datasets: [
	        		        {
	        		          label: "건수",
	        		          backgroundColor: [
	                              'rgba(255, 99, 132, 0.5)',
	                              'rgba(54, 162, 235, 0.5)',
	                              'rgba(255, 206, 86, 0.5)',
	                              'rgba(75, 192, 192, 0.5)',
	                              'rgba(153, 102, 255, 0.5)',
	                              'rgba(255, 159, 64, 0.5)'],
	                          borderColor: ['rgb(255, 99, 132,1.5)',
	                              'rgba(54, 162, 235, 1.5)',
	                              'rgba(255, 206, 86, 1.5)',
	                              'rgba(75, 192, 192, 1.5)',
	                              'rgba(153, 102, 255, 1.5)',
	                              'rgba(255, 159, 64, 1.5)'],
	        		          data: datas
	        		        }
	        		      ]
	        		    },
	        		    options: {
	        		      legend: { display: false },
	        		      title: {
	        		        display: true,
	        		        text: '승인여부 별'
	        		      }
	        		    }
	        		});
	        	
			}
		});
	 	//팀별 누적 매출 끝
})