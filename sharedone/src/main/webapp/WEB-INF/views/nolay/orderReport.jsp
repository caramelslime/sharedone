<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Resources -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js"></script>
<!-- Excel -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>

<!--semoselect  -->
<script src="/sharedone/resources/js/jquery.sumoselect.min.js"></script>

<!-- css -->
<style type="text/css">@import url("/sharedone/resources/css/sumoselect.min.css");</style>

<style type="text/css">
/* 공통속성 */
ul {
	display: flex;
	list-style: none;
	text-decoration-line: none;
}

.content {
	position: static;
	background-color: #e5e1dc;
	height: 900px;
}

/* 메뉴 카테고리 박스 */
.top-div {
	background-color: #fff;
}

.top-title {
	margin: 10px 0 0 25px;
	font-weight: 900;
	font-size: 20px;
}

.top-ul {
	padding: 0px 0px 10px 0;
	margin: 5px 0 0px 26px;
	font-size: 14px;
}

.home-img {
	width: 15px;
}

.home-text {
	color: #00944e;
}

.s-li {
	color: #bebebe;
	margin: 0 10px 0 10px;
}

.sub-text-li {
	
}

/* 검색 박스 */
.search-div {
	width: 92%;
	height: 110px;
    background-color: #fff;
    margin: 23px auto 18px auto;
    box-shadow: 2px -1px 4px #b1b1b1;
    font-size: 14px;
    display: flex;
    justify-content: space-between;
}

.search-sub-wrap {
	width: 100%;
	display: flex;
}

.search-sub-div {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
.search-sub-sub-div{
	display: flex;
	margin-top: 15px;
}

.search-item-div {
	width: 1131px;
	display: flex;
	align-items: center;
	flex-wrap: wrap;
	justify-content: space-around;
}

.each-item-div {
	margin-left: 78px;
}

.search-each-div {
	display: flex;
    width: 100%;
    margin-left: 17px;
}

.search-item-text {
	width: 53px;
	display: flex;
	justify-content: end;
	padding-right: 10px;
	align-items: center;
}

.search-item-text2 {
	width: 67px;
	display: flex;
	justify-content: end;
	padding-right: 10px;
	align-items: center;
}

.search-each-div>input {
	border: none;
	background-color: #d7d7d7;
	height: 25px;
	position: static;
}

.dodbogi-img {
	width: 17px;
	position: relative;
	left: -47px;
	cursor: pointer;
}

.list-img {
	width: 17px;
	left: -41px;
	height: 14px;
	cursor: pointer;
	margin-left: 2px;
}

.search-box {
	width: 106px;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f0f0f0;
	font-size: 15px;
	font-weight: 400;
}

#select-dept-text {
	color: #4f4f4f;
	font-style: italic;
}


/* 신규등록과 삭제가 있는 bottom 박스*/
.bottom-div {
	position: fixed;
	background-color: #fff;
	width: 100%;
	height: 43px;
	margin: 23px 0 0 2px;
	bottom: 0;
}

.bottom-btn-div {
	display: flex;
	margin: 9px 0 0 21px;
}

.new-input-btn {
	border: none;
	background-color: #00944e;
	color: white;
	box-shadow: 1px -1px 2px #b1b1b1;
	margin-right: 10px;
	height: 24px;
	cursor: pointer;
}

.search-item-text3 {
	width: 43px;
	display: flex;
	justify-content: end;
	padding-right: 10px;
	align-items: center;
}

.list-chart-btn-wrap {
	display: flex;
	width: 58px;
	justify-content: space-around;
	margin-left: 90%;
	margin-bottom: 7px;
	background-color: #fff;
	height: 26px;
	display: flex;
	box-shadow: 1px -1px 4px #b1b1b1;
}

.list-btn {
	display: flex;
	justify-content: center;
	align-items: center;
}

.chart-btn {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 25px;
	border-left: 1px solid #aaaaaa;
}

.list-img {
	
}

.chart-img {
	width: 17px;
	left: -41px;
	height: 15px;
	cursor: pointer;
	margin-left: 4px;
}

td {
	border-bottom: 1px solid #444444;
	border-left: 1px solid #444444;
	padding: 10px;
}

th {
	border-bottom: 1px solid #444444;
	border-left: 1px solid #444444;
	padding: 10px;
}

th:first-child, td:first-child {
	border-left: none;
}

.subData {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 550px;
    width: 92%;
    margin: -80px auto 0 auto;
}

/* sumo select */
.SumoSelect>.CaptionCont {
	width: 128px;
	background-color: #d7d7d7;
	border: none;
}

.SumoSelect {
	width: 147px;
}

.SumoSelect.open .search-txt {
	background-color: #d7d7d7;
}

.SumoSelect>.CaptionCont>span.placeholder {
    color: #cfcfcf;
    font-style: italic;
}

/* mainData div */
.maindata{
	width: 92%;
    margin: auto;
    display: flex;
    justify-content: space-around;
}
.maindata>div{
	height: 308px;
    width: 32%;
    background-color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 2px -1px 4px #b1b1b1;
}

.maindata2{
background-color: #fff;
    width: 90%;
    height: 180px;
    /* display: flex; */
    margin: auto;
}


.listBox{
	width: 600px;
    margin-left: 20px;
    background-color: #fff;
    box-shadow: 2px -1px 4px #b1b1b1;
    margin-top: 37px;
}

.graphBox{
	background-color: #fff;
    box-shadow: 2px -1px 4px #b1b1b1;
    width: 600px;
    display: flex;
    justify-content: center;
    margin-top: 34px;
}

.thLength{
	width:200px;
}

.report-table-div{
    background-color: #fff;
    width: 91%;
    overflow: hidden;
    resize: both;
    box-shadow: 2px -1px 4px #b1b1b1;
    margin: 10px auto 0 auto;
    overflow: scroll;
    height: 316px;
}

#report-table{
	width: 1328px;
}
.titleTr{
	background-color: lightgray;
}
.delBtn{
	cursor:pointer;
	padding-top: 4px;
}
.reloadDiv{
	width: 24px;
    height: 24px;
    border: 1px solid #e8e8e8;
    border-radius: 5px;
    background-color: #e9e9e9;
    cursor: pointer;
    margin: 0 0 0 19px;
}
.reloadImg{
    width: 18px;
    margin: 3px 3px 0 3px;
}
.search-box{
    width: 106px;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f0f0f0;
    font-size: 15px;
    font-weight: 400;
    cursor: pointer;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var year = document.querySelector('.dashYear-select').value;
	var month = document.querySelector('.dashMonth-select').value;
	var productCD = document.querySelector('.productList').value;
	var buyerCd = document.querySelector('.buyerList').value;
	var empCd2 = document.querySelector('.employeeList').value;
	var dept = document.querySelector('.deptList').value;
	var status = document.querySelector('.statusList').value;
	
	if(month == ''){
		$('.maindata').hide();
		$('.report-table-div').css('height', '600px');
	}
	else if(month != ''){
		//달별 매출 누적그래프
		$.ajax({
		    url: 'monthAllAmount.do?year='+year+"&month="+month+"&productCD="+productCD+"&buyerCd="+buyerCd+"&empCd2="+empCd2+"&dept="+dept,
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
	        		        text: '월별 누적 매출'
	        		      },
	        		      scales: {
	                          yAxes: [{
	                            ticks: {
	                            	beginAtZero:true,
	                                userCallback: function(value, index, values) {
	                                    value = value.toString();
	                                    value = value.split(/(?=(?:...)*$)/);
	                                    value = value.join(',');
	                                    return value;
	                                }
	                            }
	                          }]
	                        },
	        		      tooltips: { 
	        	               callbacks: { 
	        	                   label: function(tooltipItem, data) { //그래프 콤마
	        	                       return tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원"; 
	        	                       } 
	        	    	    	},
	        	    		},

	        		    },
	        		    

       		    
	        		});
	        	
			}
		});
	 	//달별 매출 누적 그래프 끝
	 	
	 	//팀별 누적 매출
		$.ajax({
		    url: 'groupAllAmount.do?year='+year+"&month="+month+"&productCD="+productCD+"&buyerCd="+buyerCd,
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
	        		        text: '월별 팀 매출 합계'
	        		      }

	        		      
	        		      
	        		    }
	        		    
	        		});
	        	
			}
		});
	 	//팀별 누적 매출 끝
	 	
	 	//승인여부 그래프
		$.ajax({
		    url: 'statusAllAmount.do?year='+year+"&month="+month+"&productCD="+productCD+"&buyerCd="+buyerCd+"&empCd2="+empCd2+"&dept="+dept+"&status="+status,
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
	        		        text: '월별 승인여부 현황'
	        		      },
	        		      responsive: false,
	        				scales: {
	        					yAxes: [{
	        						ticks: {
	        							beginAtZero: true,	
	        						}
	        					}]
	        				}
	        		    }
	        		});
	        	
			}
		});
	 	//승인여부 그래프 끝
	 	
	}
 	
})

	//검색 조건 초기화
	function delSearchMonth() {
		 $ ('.dashMonth-select')[0].sumo.selectItem(0); 
	}
	function delSearchProductCD() {
		 $ ('.productList')[0].sumo.selectItem(0); 
	}
	function delSearchBuyerCd() {
		 $ ('.buyerList')[0].sumo.selectItem(0); 
	}
	function delSearchEmpCd() {
		 $ ('.employeeList')[0].sumo.selectItem(0); 
	}
	function delSearchDept() {
		 $ ('.deptList')[0].sumo.selectItem(0); 
	}
	function delSearchStatus() {
		 $ ('.statusList')[0].sumo.selectItem(0); 
	}
	
	//전체 검색 조건 초기화
	function reloadBtn() {
		$ ('.dashMonth-select')[0].sumo.selectItem(0); 
		$ ('.productList')[0].sumo.selectItem(0); 
		$ ('.buyerList')[0].sumo.selectItem(0);
		$ ('.employeeList')[0].sumo.selectItem(0);
		$ ('.deptList')[0].sumo.selectItem(0); 
		$ ('.statusList')[0].sumo.selectItem(0);
	}
</script>




<script type="text/javascript">
/* 기간-년 */
$('.dashYear-select').SumoSelect({ 
	selectAll: true
	,placeholder: '년도선택'
	});
/* 기간-월 */
$('.dashMonth-select').SumoSelect({ 
	selectAll: true
	,placeholder: '월선택'
	});
/* 제품리스트 */
$('.productList').SumoSelect({
	search: true, searchText: '코드/제품명'
	,noMatch : '"{0}"가 없습니다',
	});
/* 바이어리스트 */
$('.buyerList').SumoSelect({
	search: true, searchText: '코드/거래처명'
	,noMatch : '"{0}"가 없습니다',
	});
/* 사원리스트 */
$('.employeeList').SumoSelect({
	search: true, searchText: '코드/사원명'
	,noMatch : '"{0}"가 없습니다',
	});
/* 소속 */
$('.deptList').SumoSelect();
/* 승인여부리스트 */
$('.statusList').SumoSelect({
	});
</script>
<script type="text/javascript">

//검색
function search() {
	var year = document.querySelector('.dashYear-select').value;
	var month = document.querySelector('.dashMonth-select').value;
	var productCD = document.querySelector('.productList').value;
	var buyerCd = document.querySelector('.buyerList').value;
	var empCd2 = document.querySelector('.employeeList').value;
	var dept = document.querySelector('.deptList').value;
	var status = document.querySelector('.statusList').value;
	
	if(month == ''){
		alert('기간을 입력해주세요');
		return false;
	}
	
	pageView('orderReport.do?year='+year+'&month='+month+'&productCD='+productCD+'&buyerCd='+buyerCd+'&empCd2='+empCd2+'&dept='+dept+'&status='+status);
	

	
	
}
//검색 끝


//엑셀

	function s2ab(s) { 
	    var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
	    var view = new Uint8Array(buf);  //create uint8array as viewer
	    for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
	    return buf;    
	}

	function exportExcel() {
			// step 1. workbook 생성
		    var wb = XLSX.utils.book_new();
		    // step 2. 시트 만들기 
		    var newWorksheet = excelHandler.getWorksheet();
		    // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
		    XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());
		    // step 4. 엑셀 파일 만들기 
		    var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});
		    // step 5. 엑셀 파일 내보내기 
		    saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
		}
		
		var excelHandler = {
		        getExcelFileName : function(){
		            return 'dashboard.xlsx';
		        },
		        getSheetName : function(){
		            return 'dashboard';
		        },
		        getExcelData : function(){
		            return document.getElementById('report-table'); 
		        },
		        getWorksheet : function(){
		            return XLSX.utils.table_to_sheet(this.getExcelData());
		        }
		}
//엑셀끝

   
   
</script>
</head>
<body>

	<div class="main-container">
		<div class="content">

			<div class="top-div">
				<div class="top-title">오더현황분석</div>
				<ul class="top-ul">
					<li><img class="home-img"
						src="/sharedone/resources/images/home.png" /><span
						class="home-text">HOME</span></li>
					<li class="s-li">/</li>
					<li class="sub-text-li">오더현황분석</li>
				</ul>
			</div>
			<div class="search-div">
				<!-- 검색조건들 -->
				<div class="search-sub-wrap">
					<div class="search-sub-div">
					
						<!-- 기간 -->
						<div class="search-each-div">
							<div class="search-item-text">• 기간</div>
							<select class="dashYear-select">
								<option value=""></option>
								<option value="2022" selected="selected">2022년</option>
								<option value="2021">2021년</option>
							</select> 
							<select class="dashMonth-select">
								<option hidden="" value=""></option>
								<c:if test="${month == '' || month==null}">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</c:if>
								<c:if test="${month == '01'}">
									<option value="01" selected="selected">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</c:if>
								<c:if test="${month == '02'}">
									<option value="01">1월</option>
									<option value="02" selected="selected">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</c:if>
								<c:if test="${month == '03'}">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03" selected="selected">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</c:if>
								<c:if test="${month == '04'}">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04" selected="selected">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</c:if>
								<c:if test="${month == '05'}">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05" selected="selected">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</c:if>
								<c:if test="${month == '06'}">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06" selected="selected">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</c:if>
								<c:if test="${month == '07'}">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07" selected="selected">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</c:if>
								<c:if test="${month == '08'}">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08" selected="selected">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</c:if>
								<c:if test="${month == '09'}">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09" selected="selected">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</c:if>
								<c:if test="${month == '10'}">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10" selected="selected">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</c:if>
								<c:if test="${month == '11'}">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11" selected="selected">11월</option>
									<option value="12">12월</option>
								</c:if>
								<c:if test="${month == '12'}">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12" selected="selected">12월</option>
								</c:if>
								
							</select><div class="delBtn" onclick="delSearchMonth()">&nbsp;✖</div>
						</div>
						
						<div class="search-sub-sub-div">
						<!-- 제품 -->
						<div class="search-each-div">
							<div class="search-item-text3">• 제품</div>
							<select class="productList" name="productSelect">
								<option class="hidden" value=""></option>
								<option value="${productCD }" selected="selected">${productCD } ${productNM2 } </option>
								<c:forEach var="product" items="${productAllList }">
									<option value="${product.productCD }">${product.productCD }
										${product.productNM }</option>
								</c:forEach>
							</select><div class="delBtn" onclick="delSearchProductCD()">&nbsp;✖</div>

						</div>
						<!-- 바이어 -->
						<div class="search-each-div">
							<div class="search-item-text">• 바이어</div>
							<!-- 검색용 거래처 데이터 리스트 -->
							<select class="buyerList" name="buyerSelect">
								<option class="hidden" value=""></option>
								<option value="${buyerCd }" selected="selected">${buyerCd } ${buyerNm2 } </option>
								<c:forEach var="buyer" items="${buyerAllList }">
									<option value="${buyer.buyerCd }">${buyer.buyerCd }
										${buyer.buyerNm }</option>
								</c:forEach>
							</select><div class="delBtn" onclick="delSearchBuyerCd()">&nbsp;✖</div>
						</div>
						<!-- 사원 -->
						<div class="search-each-div">
							<div class="search-item-text">• 담당자</div>
							<!-- 검색용 직원 데이터 리스트 -->
							<select class="employeeList" name="employeeSelect">
								<option class="hidden" value=""></option>
								<option value="${empCd2 }" selected="selected">${empCd2 } ${empNm2 } </option>
								<c:forEach var="emp" items="${employee_list }">
									<option value="${emp.empCd }">${emp.empCd }
									${emp.name }</option>
								</c:forEach>
							</select><div class="delBtn" onclick="delSearchEmpCd()">&nbsp;✖</div>
						</div>
						<!-- 소속 -->
						<div class="search-each-div">
							<div class="search-item-text">• 소속</div>
							<!-- 검색용 직원 데이터 리스트 -->
							<select class="deptList" name="deptSelect">
								<option class="hidden" value=""></option>
								<c:if test="${dept == '' || dept==null}">
									<option value="영업1팀">영업1팀</option>
									<option value="영업2팀">영업2팀</option>
									<option value="영업3팀">영업3팀</option>
								</c:if>
								<c:if test="${dept == '영업1팀'}">
									<option value="영업1팀" selected="selected">영업1팀</option>
									<option value="영업2팀">영업2팀</option>
									<option value="영업3팀">영업3팀</option>
								</c:if>
								<c:if test="${dept == '영업2팀'}">
									<option value="영업1팀">영업1팀</option>
									<option value="영업2팀" selected="selected">영업2팀</option>
									<option value="영업3팀">영업3팀</option>
								</c:if>
								<c:if test="${dept == '영업3팀'}">
									<option value="영업1팀">영업1팀</option>
									<option value="영업2팀">영업2팀</option>
									<option value="영업3팀" selected="selected">영업3팀</option>
								</c:if>
							</select><div class="delBtn" onclick="delSearchDept()">&nbsp;✖</div>
							
							
						</div>
						<!-- 승인여부 -->
						<div class="search-each-div">
							<div class="search-item-text2">• 승인여부</div>
							<select class="statusList" name="statusSelect">
								<option class="hidden" value=""></option>
								<c:if test="${status == '' || status==null}">
									<option value="입력완료">입력완료</option>
									<option value="승인대기">승인대기</option>
									<option value="반려">반려</option>
									<option value="승인완료">승인완료</option>
									<option value="종결">종결</option>
								</c:if>
								<c:if test="${status == '입력완료'}">
									<option value="입력완료" selected="selected">입력완료</option>
									<option value="승인대기">승인대기</option>
									<option value="반려">반려</option>
									<option value="승인완료">승인완료</option>
									<option value="종결">종결</option>
								</c:if>
								<c:if test="${status == '승인대기'}">
									<option value="입력완료">입력완료</option>
									<option value="승인대기" selected="selected">승인대기</option>
									<option value="반려">반려</option>
									<option value="승인완료">승인완료</option>
									<option value="종결">종결</option>
								</c:if>
								<c:if test="${status == '반려'}">
									<option value="입력완료">입력완료</option>
									<option value="승인대기">승인대기</option>
									<option value="반려" selected="selected">반려</option>
									<option value="승인완료">승인완료</option>
									<option value="종결">종결</option>
								</c:if>
								<c:if test="${status == '승인완료'}">
									<option value="입력완료">입력완료</option>
									<option value="승인대기">승인대기</option>
									<option value="반려">반려</option>
									<option value="승인완료" selected="selected">승인완료</option>
									<option value="종결">종결</option>
								</c:if>
								<c:if test="${status == '종결'}">
									<option value="입력완료">입력완료</option>
									<option value="승인대기">승인대기</option>
									<option value="반려">반려</option>
									<option value="승인완료">승인완료</option>
									<option value="종결" selected="selected">종결</option>
								</c:if>
							</select><div class="delBtn" onclick="delSearchStatus()">&nbsp;✖</div>
						</div>
						<div class="reloadDiv" onclick="reloadBtn()" title="검색조건 초기화"><img class="reloadImg" alt="" src="/sharedone/resources/images/reload.png"> </div>
						
						
						</div>

					</div>

				</div>
				<!-- 조회버튼 -->
				<div class="search-box" onclick="search()">조회</div>

			</div>


			<!-- 메인화면 -->
			<div class="maindata">
				<!-- 이번달 매출 누적그래프 -->
				<div>
					<div class="graph1">
						<canvas id="allAmountGraph" width="350" height="300"></canvas>
					</div>
				</div>
				
				<!-- 팀별 원형그래프 -->
				<div>
					<div class="graph2">
						<canvas id="groupGraph" width="350" height="300"></canvas>
					</div>
				</div>
				
				<!-- 승인여부 막대그래프 -->
				<div>
					<div class="graph2">
						<canvas id="statusGraph" width="350" height="300"></canvas>
					</div>
				</div>
			</div>
			
			<div class="report-table-div">
				<table id="report-table">
					<tr class="titleTr">
						<th></th>
						<th>날짜</th>
						<th>제품</th>
						<th>바이어</th>
						<th>담당자</th>
						<th>소속</th>
						<th>승인여부</th>
						<th>매출</th>
						<th>누적매출</th>
					</tr>
				
					<c:forEach var="reportList" items="${reportList }">
					
						<tr>
							<td><c:set var="i" value="${i+1}"></c:set>${i }</td>
							<td>${reportList.pricingDate }</td>
							<td>${reportList.productNM }</td>
							<td>${reportList.buyerNm }</td>
							<td>${reportList.name }</td>
							<td>${reportList.dept }</td>
							<td>${reportList.status }</td>
							<td><fmt:formatNumber value="${reportList.amount}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${reportList.cumSales }" pattern="#,###"/></td>
						</tr>
					</c:forEach>
					
				</table>
			</div>

			
			<!-- floating bottom div -->
			<div class="bottom-div">
				<div class="bottom-btn-div">
					<button class="new-input-btn" onclick="exportExcel()">엑셀로내보내기</button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>