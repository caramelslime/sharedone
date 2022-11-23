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
	<h2>${sono }번 오더 상세</h2>
	<table>
		<tr><th>제품코드</th><th>제품명</th><th>수량</th><th>단위</th><th>판매가</th></tr>
			<c:forEach var="orderDetail" items="${odlist}">
				<tr>
					<td>${orderDetail.productCd }</td>
					<td>${orderDetail.productNm }</td>
					<td>${orderDetail.qty}</td>
					<td>${orderDetail.unit }</td>
					<td>${orderDetail.unitPrice }</td>
				</tr>
			</c:forEach>
	</table>
	<form>
		<textarea rows="5" name="content"
		required="required" placeholder="상세 사유 작성란"></textarea><br>
		<span><input type="submit" value="승인" formaction="approve.do"><input type="submit" value="반려" formaction="refer.do"></span>
	</form>
</div>
</body>
</html>