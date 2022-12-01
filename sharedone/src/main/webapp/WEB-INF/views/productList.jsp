<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
</head>
<body>

	<div>
		<div class="">
			<span class="">번호</span>
			<span class="">제품 코드</span>
			<span class="">제품명</span>
			<span class="">단위</span>
			<span class="">제품 그룹</span>
		</div>
		<c:if test="${empty productList }">
			<div>데이터가 없습니다</div>
		</c:if>
		<c:if test="${not empty productList }">
			<c:forEach var="list" items="${productList }">
			<c:set var="i" value="${i+1 }"/>
				<div class="table-row">
					<span class="">${i}</span>
					<span class="">${list.productCD }</span>
					<span class="">${list.productNM}</span>
					<span class="">${list.unit}</span>
					<span class="">${list.productGroup }</span>
				</div>
			</c:forEach>
		</c:if>

	</div>


</body>
</html>