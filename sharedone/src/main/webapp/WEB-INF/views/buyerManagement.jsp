<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main>

	<div class="main-container">
		<div class="content">
		
			<c:if test="${empty buyer_list}">
				buyer정보가 없습니다
			</c:if>
		
			<c:if test="${not empty buyer_list }">
				<c:forEach var="buyer_list" items="${buyer_list }"> 
					거래처 코드 : ${buyer_list.buyercd }
					거래처 명 : ${buyer_list.buyernm }
				</c:forEach>
			</c:if>
		
		
		
		</div>
	</div>

</main>
</body>
</html>