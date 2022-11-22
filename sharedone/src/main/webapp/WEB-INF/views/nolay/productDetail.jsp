<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<input type="text" readonly="readonly" value="${product.productCD}">
		<input type="text" readonly="readonly" value="${product.productNM}">
		<input type="text" readonly="readonly" value="${product.unit}">
		<input type="text" readonly="readonly" value="${product.productGroup}">
	</div>
	<div>
		<button type="button">수정</button>
		<button type="button">삭제</button>
	</div>
</body>
</html>