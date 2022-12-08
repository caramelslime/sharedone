<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body{
    margin: 0;
}
.loginForm{
	margin:0;
	width:100%;
	height:100vh;
	background-color: #e5e1dc;
}
.login-wrap{
    padding-top: 150px;
}
.login-input{
	margin-top: 3px;
	display: inline-block;
	width: 335px;
	height: 47px;
	padding: 0 14px 2px;
	color: #000;
	font-size: 14px;
	line-height: 42px;
	letter-spacing: -0.01em;
	font-family: "Noto Sans KR", sans-serif;
	background-color: #fff;
	border: 1px solid #d5d5d5;
	border-radius: 6px;
	box-sizing: border-box;
	transition: border-color 0.2s ease-out;
	outline: none;
}
.login-input:hover{
	border: 1px solid #091b50;
}
.login-input:focus{
	border: 1px solid #091b50;
}
#login-btn{
width: 335px;
    background: #293b4b;
    border: 1px solid #293b4b;
    border-radius: 6px;
    height: 50px;
	margin-top:30px;
	transition: background-color 0.2s ease-out, border-color 0.2s ease-out;
	
	color: #fff;
	font-size: 15px;
    font-weight: 600;
}
#login-btn:hover{
	cursor:pointer;
	background: #445666;
}
</style>
<script type="text/javascript">
	//제품 목록
	function pageView(data) {
		alert('로그인 후 이용해주세요');
		return false;
	}
	//바이어목록
	function pageView2(data) {
		alert('로그인 후 이용해주세요');
		return false;
	}
	//판매가격관리
	function pageView3(data) {
		alert('로그인 후 이용해주세요');
		return false;
	}
	//오더현황분석
	function pageView4(data) {
		alert('로그인 후 이용해주세요');
		return false;
	}
</script>
<style type="text/css">
.m-container{
	display: flex;
}
.menu-main-container{
	margin: 0;
    height: 100vh;
    background-color: #293b4b;
}
#icon-div{
	background-color: #243646;
	height: 90px;
}
.menu-div{
	width: 200px;
    height: 60px;
    color: white;
    font-size: 16px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
}
.menu-div:hover{
	background-color: #243646;
}

.menu-img{
	width: 20px;
}
.menu-img2{
	width:25px;
}
</style>
</head>
<body>
	<div class="m-container">
		<div class="menu-main-container">
	
			<div class="menu-div" id="icon-div">
				<img style="width:120px; height : 50px;" alt="" src="/sharedone/resources/images/logo.png">
			</div>
			<div class="menu-div"  onclick="pageView('product.do')">
				<img class="menu-img" alt="이미지 없음" src="/sharedone/resources/images/product.png"/>&nbsp;제품관리
			</div>
			<div class="menu-div"  onclick="pageView2('buyerManagement.do')">
				<img class="menu-img2" alt="이미지 없음" src="/sharedone/resources/images/buyer.png"/>&nbsp;바이어관리
			</div>
			<div class="menu-div"  onclick="pageView3('priceList.do')">
				<img class="menu-img" alt="이미지 없음" src="/sharedone/resources/images/price.png"/>&nbsp;판매가격관리
			</div>
			<div class="menu-div"  onclick="pageView('order.do')">
				<img class="menu-img" alt="이미지 없음" src="/sharedone/resources/images/order.png"/>&nbsp;오더관리
			</div>
			<div class="menu-div"  onclick="pageView4('orderReport.do')">
				<img class="menu-img2" alt="이미지 없음" src="/sharedone/resources/images/dashboard.png"/>&nbsp;오더현황분석
			</div>
			<c:if test="${sessionScope.job == '팀장'}">
				<div class="menu-div"  onclick="pageView('pendingApprovalList.do')">
					<img class="menu-img" alt="이미지 없음" src="/sharedone/resources/images/confirm.png"/>&nbsp;오더승인
				</div>
			</c:if>
		</div>

		<div class="loginForm" align="center">
		
			<form action="empLogin.do" method="post">
				<div class="login-wrap">
					<img alt="" src="/sharedone/resources/images/logo.png">
					<div><input class="login-input login-input2" type="text" name="empCd" required="required" placeholder="아이디" ></div>
					<div><input class="login-input login-input2" type="password" name="pw" required="required" placeholder="비밀번호"></div>
					<div><input class="login-input" id="login-btn" type="submit" value="확인"></div>
				</div>
				
			</form>
		</div>
	</div>
</body>
</html>