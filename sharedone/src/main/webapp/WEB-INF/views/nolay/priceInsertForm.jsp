<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function insertPrice() {
		var buyerNM = document.querySelector('#buyerNM').value;
		var productNM = document.querySelector('#productNM').value;
		var periodStart = document.querySelector('#periodStart').value;
		var periodEnd = document.querySelector('#periodEnd').value;
		var listPrice = document.querySelector('#listPrice').value;
		var currency = document.querySelector('#currency').value;
		pageView('priceInsert.do?buyerCD=' + buyerCD + '&productCD='
				+ productCD + '&periodStart=' + periodStart + '&periodEnd=' + periodEnd + '&listPrice=' + listPrice + '&currency=' + currency);
	}
</script>

</head>
<body>

	<div>
		<div>
			거래처명 <input type="text" id="buyerNM" class="input"
				value="${price.buyerNM}">
		</div>
		<div>
			제품명 <input type="text" id="productNM" class="input" 
				value="${price.productNM}">
		</div>
		<div>
			유효기간 시작일 <input type="date" id="periodStart" class="input"
				value="${price.periodStart}">
		</div>
		<div>
			유효기간 종료일 <input type="date" id="periodEnd" class="input"
				value="${price.periodEnd}">
		</div>
		<div>
			판매가 <input type="text" id="listPrice" class="input"
				value="${price.listPrice}">
		</div>
		<div>
			통화 <input type="text" id="currency" class="input"
				value="${price.currency}">
		</div>
	</div>
	<div>
		<div>
			<button class="update-btn" type="button" onclick="insertPrice()">입력</button>
		</div>
	</div>
</body>
</html>