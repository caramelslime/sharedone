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
		var value = document.querySelector('#productNM').value;
		document.querySelector('#productNM').focus();
		document.querySelector('#productNM').value = '';
		document.querySelector('#productNM').value = value;
		
		
		document.querySelector('.update-btn').style.display = 'none';
		document.querySelector('.update-del-btn').style.display = 'none';
		document.querySelector('.update-action-btn').style.display = 'block';
		document.querySelector('.update-cancel-btn').style.display = 'block';
	}
	
	function update() {
		var productCD = document.querySelector('#productCD').value;
		var productNM = document.querySelector('#productNM').value;
		var unit = document.querySelector('#unit').value;
		var productGroup = document.querySelector('#productGroup').value;
		pageView('productUpdate.do?productCD='+productCD+'&productNM='+productNM+'&unit='+unit+'&productGroup='+productGroup);
	}
	
	function updateCancel() {
		var productCD = document.querySelector('#productCD').value;
		pageView('productDetail.do?productCD='+productCD);
	}
	
	function del() {
		if (confirm("정말 삭제할까요?")) {
			var productCD = document.querySelector('#productCD').value;
			pageView('productDelete.do?productCD='+productCD);
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