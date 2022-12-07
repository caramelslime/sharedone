<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.login-wrap{
	padding-top: 50px;
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
</head>
<body>
<div align="center">
	
	<form action="empLogin.do" method="post">
		<div class="login-wrap">
			<img alt="" src="/sharedone/resources/images/logo.png">
			<div><input class="login-input login-input2" type="text" name="empCd" required="required" placeholder="아이디" ></div>
			<div><input class="login-input login-input2" type="password" name="pw" required="required" placeholder="비밀번호"></div>
			<div><input class="login-input" id="login-btn" type="submit" value="확인"></div>
		</div>
		
	</form>
	</div>
</body>
</html>