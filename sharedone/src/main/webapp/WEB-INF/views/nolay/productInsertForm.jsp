<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function insertProduct() {
		var productNM = document.querySelector('#productNM').value;
		var unit = document.querySelector('#unit').value;
		var productGroup = document.querySelector('#productGroup').value;
		pageView('productInsert.do?productCD=' + productCD + '&productNM='
				+ productNM + '&unit=' + unit + '&productGroup=' + productGroup);
	}
</script>

</head>
<body>

	<div>
		<div>
			제품명 <input type="text" id="productNM" class="input"
				value="${product.productNM}">
		</div>
		<div>
			단위 <input type="text" id="unit" class="input" value="${product.unit}">
		</div>
		<div>
			제품 그룹 <input type="text" id="productGroup" class="input"
				value="${product.productGroup}">
		</div>
	</div>
	<div>
		<div>
			<button class="update-btn" type="button" onclick="insertProduct()">입력</button>
		</div>
	</div>
</body>
</html>