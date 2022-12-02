<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Resources -->
<!-- <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>

<!-- Excel -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>

<!--semoselect  -->
<script src="/sharedone/resources/js/jquery.sumoselect.min.js"></script>

<!-- css -->
<style type="text/css">@import url("/sharedone/resources/css/sumoselect.min.css");</style>

<style type="text/css">
/* 공통속성 */
ul{
	display: flex;
	list-style:none;
	text-decoration-line: none;
}

.content{
    position: static;
    background-color: #e5e1dc;
    height: 900px;
}

/* 메뉴 카테고리 박스 */
.top-div{
	background-color: #fff;
}
.top-title{
    margin: 10px 0 0 25px;
    font-weight: 900;
    font-size: 20px;
}
.top-ul{
	padding: 0px 0px 10px 0;
    margin: 5px 0 0px 26px;
    font-size: 14px;
}

.home-img{
	width: 15px;
}
.home-text{
    color: #00944e;
}
.s-li{
    color: #bebebe;
    margin: 0 10px 0 10px;
}
.sub-text-li{
}


/* 검색 박스 */
.search-div{
    width: 92%;
    height: 92px;
    background-color: #fff;
    margin: 23px auto 20px auto;
    box-shadow: 2px -1px 4px #b1b1b1;
    font-size: 14px;
    display: flex;
    justify-content: space-between;
}
.search-sub-wrap{
    width: 100%;
    padding: 0 0 0 33px;
    display: flex;
}
.search-sub-div{
	display: flex;
    justify-content: center;
    align-items: center;
}
.search-item-div{
	width: 1131px;
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    justify-content: space-around;
}
.each-item-div{
	margin-left: 78px;
}
.search-each-div{
	display: flex;
	margin-left: 22px;
}
.search-item-text{
    width: 53px;
    display: flex;
    justify-content: end;
    padding-right: 10px;
    align-items: center;
}
.search-item-text2{
    width: 67px;
    display: flex;
    justify-content: end;
    padding-right: 10px;
    align-items: center;
}
.search-each-div>input{
	border: none;
    background-color: #d7d7d7;
    height: 25px;
    position: static;
}
.dodbogi-img{
	width: 17px;
    position: relative;
    left: -47px;
    cursor: pointer;
}
.list-img{
	width: 17px;
    left: -41px;
	height: 14px;
    cursor: pointer;
    margin-left: 2px;
}
.search-box{
    width: 106px;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f0f0f0;
    font-size: 15px;
    font-weight: 400;
}

#select-dept-text{
    color: #4f4f4f;
    font-style: italic;	
}


.report-table-div{
    background-color: #fff;
	width: 90%;
    resize: both;
    box-shadow: 2px -1px 4px #b1b1b1;
    margin-left: 4%;
    overflow: scroll;
    height: 600px;
}


/* 신규등록과 삭제가 있는 bottom 박스*/
.bottom-div{
	position: fixed;
    background-color: #fff;
    width: 100%;
    height: 43px;
    margin : 23px 0 0 2px;
    bottom: 0;
}
.bottom-btn-div{
	display: flex;
    margin: 9px 0 0 21px;
}
.new-input-btn{
	border: none;
    background-color: #00944e;
    color: white;
    box-shadow: 1px -1px 2px #b1b1b1;
    margin-right: 10px;
    height: 24px;
    cursor: pointer;
}

.search-item-text3{
    width: 43px;
    display: flex;
    justify-content: end;
    padding-right: 10px;
    align-items: center;
}

.list-chart-btn-wrap{
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
.list-btn{
	display: flex;
    justify-content: center;
    align-items: center;
}
.chart-btn{
	display: flex;
    justify-content: center;
    align-items: center;
    width: 25px;
    border-left: 1px solid #aaaaaa;
}
.list-img{

}
.chart-img{
	width: 17px;
    left: -41px;
    height: 15px;
    cursor: pointer;
    margin-left: 4px;
}
#report-table{
	margin: 4px 10px 0 10px;
	border-collapse: collapse;
	font-size: 12px;
	width: 1500px;
}

td{
	border-bottom: 1px solid #444444;
    border-left: 1px solid #444444;
    padding: 10px;
}
th{
	border-bottom: 1px solid #444444;
    border-left: 1px solid #444444;
    padding: 10px;
}
th:first-child, td:first-child {
    border-left: none;
  }

.graphBox{
    display: flex;
    justify-content: center;
    margin-top: 83px;
}

/* sumo select */
.SumoSelect>.CaptionCont{
    width: 128px;
    background-color: #d7d7d7;
    border: none;
}
.SumoSelect {
    width: 147px;
}
.SumoSelect>.CaptionCont>span.placeholder {
    color: #4f4f4f;
    font-style: italic;
}
.SumoSelect.open .search-txt {
	background-color: #d7d7d7;
}


/* 반응형 */
@media screen and (max-width:1800px) {
	.search-div{
		width:1447px;
	}
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	 $('.report-table-div').hide();
	})


//검색
function search() {
	$('.maindata').hide();
	$('.report-table-div').show();
	 
	var year = document.querySelector('.dashYear-select').value;
	var month = document.querySelector('.dashMonth-select').value;
	var buyercd = document.querySelector('.buyerList').value;
	var dept = document.querySelector('.deptList').value;
	var empcd = document.querySelector('.employeeList').value;
	var orderStatus = document.querySelector('.statusList').value;
	$.post('dashBoard.do'
			, "year="+year+"&month="+month+"&buyercd="+buyercd+"&dept="+dept+"&empcd="+empcd+"&orderStatus="+orderStatus
			, function(data) {
		
			var sum = 0;
			$('#report-table').append(
					"<tr>"
						+"<th>"+"날짜"+"</th>"
						+"<th>"+"판매액"+"</th>"
						+"<th>"+"누적판매액"+"</th>"
					+"</tr>"
			);
			for(var i = 0; i < data.length; i++){
				sum += data[i].amount;
				//표만들기
				$('#report-table').append(
					"<tr>"
						+"<th>"+data[i].pricingDate+"</th>"
						+"<td>"+data[i].amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"</td>"
						+"<td>"+sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"</td>"
					+"<tr>"
						
				);
			}


	});	
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



//그래프
   function showList() {
	   $('.report-table-div').show();
	   $('.graphBox').hide();
   }
   
   function showChart(){
	   $('.graphBox').show();
	   $('.report-table-div').hide();
	   
	 //table -> json

	   function tableToJson(table) { // 변환 함수
	       var data = [];

	       var headers = [];
	       for(var i=0; i<table.rows[0].cells.length; i++) {
	           headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace(/ /gi,'');
	       }

	       for(var i=1; i<table.rows.length; i++) {
	           var tableRow = table.rows[i];
	           var rowData = {};

	           for(var j=0; j<tableRow.cells.length; j++) {
	               rowData[headers[j]] = tableRow.cells[j].innerHTML;
	           }
	           data.push(rowData);
	       }

	       return data;
	   }

	   var jsonObj = tableToJson(document.getElementById("report-table")); // table id를 던지고 함수를 실행한다.
	   //alert(JSON.stringify(jsonObj)); // JSON 객체가 리턴
	  

	   //table -> json 끝
	   
      var data = {
   
            labels: ["1일", "2일", "7일", "9일", "16일", "19일", "25일", "26일"],
   
            datasets: [
   
               {
   
                  label: "",
   
                  fillColor: "#293b4b",
   
                  strokeColor: "#44505a",
   
                  highlightFill: "#707d89",
   
                  highlightStroke: "#707d89",
   
                  data: [1200000, 400000, 400000, 800000, 400000, 400000, 400000, 400000]
   
               }
   
            ]
   
         };
   
       var ctx = document.getElementById("barCanvas").getContext("2d");
   
       var options = { };
   
       var barChart = new Chart(ctx).Bar(data, options);
   
   }
//그래프 끝
</script>

<script type="text/javascript">
/* 기간-년 */
$('.dashYear-select').SumoSelect({ 
	selectAll: true
	,placeholder: '년도선택'
	,captionFormatAllSelected : '2021~2022년'
	,locale :  ['OK', '취소', '모두선택']
	});
/* 기간-월 */
$('.dashMonth-select').SumoSelect({ 
	selectAll: true
	,placeholder: '월선택'
	,captionFormatAllSelected : '1월~12월'
	,locale :  ['OK', '취소', '모두선택']
	});
/* 팀 */
$('.deptList').SumoSelect();
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
/* 승인여부리스트 */
$('.statusList').SumoSelect({
	});
</script>

</head>
<body>

	<div class="main-container">
		<div class="content">
		
 		<div class="top-div">
			<div class="top-title">오더현황분석</div>
			<ul class="top-ul">
				<li><img class="home-img" src="/sharedone/resources/images/home.png"/><span class="home-text">HOME</span></li>
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
								<select class="dashYear-select" name="dashYearSelect[]" multiple>
									<option value="2022">2022년</option>
									<option value="2021">2021년</option>
								</select>
								<select class="dashMonth-select" name="dashMonthSelect[]" multiple>
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
								</select>
						</div>
						<!-- 바이어 -->
						<div class="search-each-div">
							<div class="search-item-text">• 바이어</div>
							<!-- 검색용 거래처 데이터 리스트 -->
							<select class="buyerList" name="buyerSelect">
								<option value="">선택안함</option>
								<c:forEach var="buyer" items="${buyerAllList }">
									<option value="${buyer.buyerCd }" >${buyer.buyerCd } ${buyer.buyerNm }</option>
								</c:forEach>
							</select>
						</div>
						<!-- 팀 -->
						<div class="search-each-div">
							<div class="search-item-text3">• 팀</div>
							<select class="deptList" name="deptSelect">
								<option value="">선택안함</option>
								<option value="1">영업1팀</option>
								<option value="2">영업2팀</option>
								<option value="3">영업3팀</option>
							</select>

						</div>
						<!-- 사원 -->
						<div class="search-each-div">
							<div class="search-item-text">• 사원</div>
							<!-- 검색용 직원 데이터 리스트 -->
							<select class="employeeList" name="employeeSelect">
								<option value="">선택안함</option>
								<c:forEach var="emp" items="${employee_list }">
									<option value="${emp.empCd }">${emp.empCd } ${emp.name }</option>
								</c:forEach>
							</select>
						</div>
						<!-- 승인여부 -->
						<div class="search-each-div">
							<div class="search-item-text2">• 승인여부</div>
							<select class="statusList" name="statusSelect">
								<option value="">선택안함</option>
								<option value="">승인요청전</option>
								<option value="">승인요청중</option>
								<option value="">승인완료</option>
								<option value="">반려</option>
								<option value="">종결</option>
							</select>
						</div>
				
				</div>
					
			</div>
			<!-- 조회버튼 -->
			<div class="search-box" onclick="search()">조회</div>
			
		</div>


			<div class="list-chart-btn-wrap">
				<div class="list-btn" onclick="showList()">
					<img class="list-img" src="/sharedone/resources/images/list.png">
				</div>
				<div class="chart-btn" onclick="showChart()">
					<img class="chart-img" src="/sharedone/resources/images/chart.png">
				</div>
			</div>
			
			
			
		<!-- 메인화면 -->
		<div class="maindata">
			<div>
				<div>이번달 매출 누적그래프</div>
				<div>팀별 원형그래프</div>
				<div>승인여부 막대그래프</div>
			</div>
		</div>
		
		<!-- 리스트 테이블 -->
			<div class="report-table-div">
				<table id="report-table">
					
				</table>
			</div>
		
	   <!-- 그래프 -->   
	   <div class="graphBox">
	      <canvas id="barCanvas" width = "700" height = "400"></canvas>
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