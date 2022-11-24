<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    background-color: #fff;
    margin: 23px auto 20px auto;
    box-shadow: 2px -1px 4px #b1b1b1;
    font-size: 14px;
    display: flex;
    justify-content: space-between;
}
.search-sub-wrap{
    margin: 20px 0px 20px 40px;
}
.search-sub-div{
    display: flex;
    margin-bottom: 9px;

}
.search-item-div{
    width: 325px;
    display: flex;
    align-items: center;
}
.each-item-div{
	margin-left: 78px;
}
.search-item-text{
    width: 100px;
}
.search-item-div>input{
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
</style>
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
				<div class="search-item-div"><div class="search-item-text">• 거래처코드</div><input type="text"><img class="dodbogi-img" alt="" src="/sharedone/resources/images/dodbogi.png"><img class="list-img" alt="" src="/sharedone/resources/images/list.png"> </div>
				<div class="search-item-div each-item-div"><div class="search-item-text">• 거래처명</div><input type="text"><img class="dodbogi-img" alt="" src="/sharedone/resources/images/dodbogi.png"><img class="list-img" alt="" src="/sharedone/resources/images/list.png"></div>
			</div>
			<div class="search-item-div"><div class="search-item-text">• 담당자</div><input type="text"><img class="dodbogi-img" alt="" src="/sharedone/resources/images/dodbogi.png"><img class="list-img" alt="" src="/sharedone/resources/images/list.png"></div>	
			</div>
			<div class="search-box">조회</div>
		</div>

		
		</div>
	</div>


</body>
</html>