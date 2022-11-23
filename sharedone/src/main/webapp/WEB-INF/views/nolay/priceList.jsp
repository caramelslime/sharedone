<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
	function pageView(data) {
		var addr = data;
	
		var ajaxOption = {
			url : addr,
			async : true,
			type : "POST",
			dataType : "html",
			cache : false
		};
	
		$.ajax(ajaxOption).done(function(data) {
			$('#layout-body').children().remove();
			$('#layout-body').html(data);
		});
	};
	
</script>

</head>
<body>

	<div>
		<div class="">
			<span class="">번호</span>
			<span class="">판매 가격 코드</span>
			<span class="">거래처 코드</span>
			<span class="">제품 코드</span>
			<span class="">판매가</span>
			<span class="">통화</span>
			<span class="">유효기간 시작일</span>
			<span class="">유효기간 종료일</span>
			<span class="">할인율</span>
		</div>
		<c:if test="${empty priceList }">
			<div>데이터가 없습니다</div>
		</c:if>
		<c:if test="${not empty priceList }">
			<c:forEach var="list" items="${priceList }">
			<c:set var="i" value="${i+1 }"/>
				<div class="" onclick="pageView('priceDetail.do?pricingCD=${list.pricingCD}')">
					<span class="">${i}</span>
					<span class="">${list.pricingCD}</span>
					<span class="">${list.buyerCD}</span>
					<span class="">${list.productCD}</span>
					<span class="">${list.price}</span>
					<span class="">${list.currency}</span>
					<span class="">${list.periodStart}</span>
					<span class="">${list.periodEnd}</span>
					<span class="">${list.rate}</span>
				</div>
			</c:forEach>
		</c:if>

	</div>


</body>
</html>

</body>
</html>