<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
	function activateUpdate() {
		var inputList = document.querySelectorAll('.input');
		for (var i = 0; i < inputList.length; i++) {
			inputList[i].readOnly = false;
		}
		var value = document.querySelector('#buyerNM').value;
		document.querySelector('#buyerNM').focus();
		document.querySelector('#buyerNM').value = '';
		document.querySelector('#buyerNM').value = value;
		
		
		document.querySelector('.update-btn').style.display = 'none';
		document.querySelector('.update-del-btn').style.display = 'none';
		document.querySelector('.update-action-btn').style.display = 'block';
		document.querySelector('.update-cancel-btn').style.display = 'block';
	}
	
	function update() {
		var buyerCD = document.querySelector('#buyerCD').value;
		var productCD = document.querySelector('#productCD').value;
		var periodStart = document.querySelector('#periodStart').value;
		var periodEnd = document.querySelector('#periodEnd').value;
		var listPrice = document.querySelector('#listPrice').value;
		var currency = document.querySelector('#currency').value;
		pageView('productUpdate.do?buyerCD='+buyerCD+'&productCD='+productCD+'&periodStart='+periodStart+'&periodEnd='+periodEnd+'&listPrice='+listPrice+'&currency='+currency);
	}
	
	function updateCancel() {
		var buyerCD = document.querySelector('#buyerCD').value;
		var productCD = document.querySelector('#productCD').value;
		var periodStart = document.querySelector('#periodStart').value;
		pageView('productDetail.do?buyerCD='+buyerCD+'&productCD='+productCD+'&periodStart='+periodStart);
	}
	
	function del() {
		if (confirm("정말 삭제할까요?")) {
			var buyerCD = document.querySelector('#buyerCD').value;
			var productCD = document.querySelector('#productCD').value;
			var periodStart = document.querySelector('#periodStart').value;
			pageView('productDelete.do?buyerCD='+buyerCD+'&productCD='+productCD+'&periodStart='+periodStart);
		}
	}
	
	
</script>

</head>
<body>

	<div onclick="pageView('productList.do')" style="cursor: pointer">
		제품 목록
	</div>
	<div>
		<div>
			<input type="text" id="productCD" readonly="readonly" value="${product.productCD}">
		</div>
		<div>
			<input type="text" id="productNM" class="input" readonly="readonly" value="${product.productNM}">
		</div>
		<div>
			<input type="text" id="unit" class="input" readonly="readonly" value="${product.unit}">
		</div>
		<div>
			<input type="text" id="productGroup" class="input" readonly="readonly" value="${product.productGroup}">
		</div>
	</div>
	<div>
		<div>
			<button class="update-btn" type="button" onclick="activateUpdate()">수정</button>
		</div>
		<div>
			<button class="update-action-btn" type="button" onclick="update()" style="display: none;">수정 완료</button>
		</div>
		<div>
			<button class="update-cancel-btn" type="button" onclick="updateCancel()" style="display: none;">수정 취소</button>
		</div>
		<div>
			<button class="update-del-btn" type="button" onclick="del()">삭제</button>
		</div>
	</div>
</body>
</html>