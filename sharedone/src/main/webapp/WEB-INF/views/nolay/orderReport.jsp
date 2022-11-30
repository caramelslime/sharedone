<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    height: 100px;
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
    margin-bottom: 9px;
    justify-content: center;
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
}
.search-item-text{
    width: 70px;
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


/* sumo select */
.SumoSelect>.CaptionCont{
	width: 160px;
}
</style>
<script type="text/javascript">
$('.dashDate-select').SumoSelect({ 
	selectAll: true
	,placeholder: '월별 기간을 선택해주세요'
	,captionFormatAllSelected : '1월~12월'
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
			<div class="search-sub-wrap">
				<div class="search-sub-div">
					<div class="search-item-div">
						<div class="search-each-div">
							<!-- 기간 -->
							<div class="search-item-text">• 기간</div>
							<select class="dashDate-select" name="dashDate[]" multiple>
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

						<div class="search-each-div">
							<div class="search-item-text">• 바이어</div>
							<input type="text">
						</div>
						
						<div class="search-each-div">
							<div class="search-item-text">• 사원</div>
							<input type="text">
						</div>
						<div class="search-each-div">
							<div class="search-item-text">• 승인여부</div>
							<input type="text">
						</div>
					</div>
				</div>
					
			</div>
			<div class="search-box">조회</div>
		</div>

		
		</div>
	</div>


</body>
</html>