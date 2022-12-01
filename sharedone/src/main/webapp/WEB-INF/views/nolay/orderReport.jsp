<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Styles -->
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}
</style>
<!-- amcharts -->
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
<script src="https://cdn.amcharts.com/lib/5/locales/de_DE.js"></script>
<script src="https://cdn.amcharts.com/lib/5/geodata/germanyLow.js"></script>
<script src="https://cdn.amcharts.com/lib/5/fonts/notosans-sc.js"></script>



<script src="/sharedone/resources/js/jquery.sumoselect.min.js"></script>
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
	margin-left: 15px;
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
    position: relative;
    left: -41px;
    height: 15px;
    cursor: pointer;
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
$('.dept-select').SumoSelect();
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
<!-- <script>
am5.ready(function() {

// Create root element
// https://www.amcharts.com/docs/v5/getting-started/#Root_element
var root = am5.Root.new("chartdiv");


// Set themes
// https://www.amcharts.com/docs/v5/concepts/themes/
root.setThemes([
  am5themes_Animated.new(root)
]);


// Create chart
// https://www.amcharts.com/docs/v5/charts/xy-chart/
var chart = root.container.children.push(am5xy.XYChart.new(root, {
  panX: false,
  panY: false,
  wheelX: "panX",
  wheelY: "zoomX"
}));


// Add cursor
// https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {
  behavior: "zoomX"
}));
cursor.lineY.set("visible", false);

var date = new Date();
date.setHours(0, 0, 0, 0);
var value = 100;

function generateData() {
  value = Math.round((Math.random() * 10 - 5) + value);
  am5.time.add(date, "day", 1);
  return {
    date: date.getTime(),
    value: value
  };
}

function generateDatas(count) {
  var data = [];
  for (var i = 0; i < count; ++i) {
    data.push(generateData());
  }
  return data;
}


// Create axes
// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
var xAxis = chart.xAxes.push(am5xy.DateAxis.new(root, {
  maxDeviation: 0,
  baseInterval: {
    timeUnit: "day",
    count: 1
  },
  renderer: am5xy.AxisRendererX.new(root, {}),
  tooltip: am5.Tooltip.new(root, {})
}));

var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
  renderer: am5xy.AxisRendererY.new(root, {})
}));


// Add series
// https://www.amcharts.com/docs/v5/charts/xy-chart/series/
var series = chart.series.push(am5xy.ColumnSeries.new(root, {
  name: "Series",
  xAxis: xAxis,
  yAxis: yAxis,
  valueYField: "value",
  valueXField: "date",
  tooltip: am5.Tooltip.new(root, {
    labelText: "{valueY}"
  })
}));



// Add scrollbar
// https://www.amcharts.com/docs/v5/charts/xy-chart/scrollbars/
chart.set("scrollbarX", am5.Scrollbar.new(root, {
  orientation: "horizontal"
}));

var data = generateDatas(50);
series.data.setAll(data);


// Make stuff animate on load
// https://www.amcharts.com/docs/v5/concepts/animations/
series.appear(1000);
chart.appear(1000, 100);

}); // end am5.ready()
</script> -->
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
									<option value="22">2022년</option>
									<option value="21">2021년</option>
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
								<option>선택안함</option>
								<c:forEach var="buyer" items="${buyer_list }">
									<option value="${buyer.buyercd }" >${buyer.buyercd } ${buyer.buyernm }</option>
								</c:forEach>
							</select>
						</div>
						<!-- 팀 -->
						<div class="search-each-div">
							<div class="search-item-text">• 팀</div>
							<select class="dept-select" name="deptSelect">
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
			<div class="search-box">조회</div>
			
		</div>




















		<!-- amcharts -->
		<!-- <div id="chartdiv"></div> -->
	
		

		</div>
	</div>


</body>
</html>