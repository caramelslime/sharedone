<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" charset="UTF-8">
<title>header</title>
<style type="text/css">
.logout-div{
   margin-right: 25px;
   display: flex;
}
.logout-img{
    width: 15px;
    align-items: center;
    height: 15px;
    display: flex;
    margin: auto;
}	
.logout-text{
	color: #00944e;
}
.header-main-container{
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: end;
    align-items: center;
}
</style>
</head>
<body>
<div class="header-main-container">
	<div class="logout-div">
		<img class="logout-img" alt="" src="/sharedone/resources/images/logout.png"><a href="logout.do"><span class="logout-text">Log out</span></a>
	</div>
</div>
</body>
</html>