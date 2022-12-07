<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/sharedone/resources/js/jquery.js"></script>
</head>
<body>
<c:if test="${result>0 }">
	<script type="text/javascript">
		alert("로그인 성공");
		location.href="main.do";
	</script>
</c:if>
<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("비밀번호가 일치하지 안습니다");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result<0 }">
	<script type="text/javascript">
		alert("없는 아이디 입미다");
		history.back();
	</script>
</c:if>
</body>
</html>