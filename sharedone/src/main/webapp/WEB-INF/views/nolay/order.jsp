<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">@import url("/sharedone/resources/css/share.css");</style>
<style type="text/css">@import url("/sharedone/resources/css/order.css");</style>

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
		
		console.log(addr);
		
		$.ajax(ajaxOption).done(function(data) {
			$('#layout-body').children().remove();
			$('#layout-body').html(data);
		});
	}
	
	$(function() {
		$('.search').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				search();
			}
		});
		
		$(document).keydown(function() { // esc키를 insert 화면에서 나오기
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 27) { // 27이 esc (assii값)
				xBack();
			}
		});
		
	})
	
	function search() {
		
		var soNo = document.querySelector('#searchSoNo').value;
		var buyerCD = document.querySelector('#searchBuyerCD').value;
		var soUser = document.querySelector('#searchSoUser').value;
		var addDate = document.querySelector('#searchAddDate').value;
		var pricingDate = document.querySelector('#searchPricingDate').value;
		var requestDate = document.querySelector('#searchRequestDate').value;
		var status = document.querySelector('#searchStatus').value;
		
		pageView('order.do?soNo='+soNo+'&buyerCD='+buyerCD+'&soUser='+soUser+'&addDate='+addDate+'&pricingDate='+pricingDate+'&requestDate='+requestDate+'&status='+status);
	}
	
	function detail(soNo) {
		
		console.log(soNo);
		
		$.post('orderHeader.do', "soNo="+soNo, function(data) {
			document.querySelector('#detailSoNo').value = data.soNo;
			document.querySelector('#detailBuyerCD').value = data.buyerCD;
			document.querySelector('#detailSoUser').value = data.soUser;
			document.querySelector('#detailAddDate').value = data.addDate;
			document.querySelector('#detailPricingDate').value = data.pricingDate;
			document.querySelector('#detailRequestDate').value = data.requestDate;
			document.querySelector('#detailStatus').value = data.status;
			document.querySelector('#detailCurrency').value = data.currency;
			
			if (data.status == '반려') {
				document.querySelector('.comment-return-div').style.display = 'block';
			}
		});
		
		$.post('orderItems.do', "soNo="+soNo, function(data) {
			
			for (var i = 0; i < data.length; i++) {
				
				var num = i+1;
				var productCD = data[i].productCD;
				var productNM = data[i].productNM;
				var productGroup = data[i].productGroup;
				var qty = data[i].qty;
				var unit = data[i].unit;
				var unitprice = data[i].unitprice;
				var totalprice = qty * unitprice;
				
				$('#detailList-table').append(
						"<tr class='detailListTr'>"
							+"<td class='center'>-</td>"
							+"<td class='center'>"+num+"</td>"
							+ "<td class='center'>"+productCD+"</td>"
							+ "<td class='center'>"+productNM+"</td>"
							+ "<td class='center'>"+productGroup+"</td>"
							+ "<td class='center'>"+qty+"</td>"
							+ "<td class='center'>"+unit+"</td>"
							+ "<td class='right'>"+unitprice+"</td>"
							+ "<td class='right'>"+totalprice+"</td>"
						+ "</tr>"
				);
			}
		});
		
		
		$('.orderList-div').css('opacity', '0.3');
		$('.search-div').css('opacity', '0.3');
		$('.detail-div').show();
	}
	
	function xBack(){
		$("#detailList-table tr:not(:first)").remove();	// 상세창 닫을 때 입력한 값 제거
		$('.detail-div').hide();
		$('.orderList-div').css('opacity', '1');
		$('.search-div').css('opacity', '1');
		$('.comment-return-div').hide();
		document.querySelector('#add-finish-btn').style.display = 'none';
		document.querySelector('#add-row-btn').style.display = 'block';
	}
	
	function addItem() {
		
		var rowNumber=document.querySelector('#detailList-table').rows.length;
		console.log(rowNumber);		
		
		$('#detailList-table').append(
				"<tr class='detailListTr'>"
					+ "<td class='center'></td>"
					+ "<td id='num"+rowNumber+"' class='center'>"+rowNumber+"</td>"
					+ "<td>"
					+ "<input type='text' id='productCD"+rowNumber+"' class='item-add-col2 addProductCD' list='productCDList'>"
					+ "<input id='load-product-btn' type='button' onclick='loadProductData()' value='확인'>"
					+ "</td>"
					+ "<td id='productNM"+rowNumber+"' class='center'></td>"
					+ "<td id='productGroup"+rowNumber+"' class='center'></td>"
					+ "<td><input type='text' id='qty"+rowNumber+"' class='item-add-col'></td>"
					+ "<td><input type='text' id='unit"+rowNumber+"' class='item-add-col'></td>"
					+ "<td class='right'><input type='text' id='unitprice"+rowNumber+"' class='item-add-col'></td>"
					+ "<td id='totalprice"+rowNumber+"' class='right'></td>"
				+ "</tr>"
		);
		
		document.querySelector('#add-row-btn').style.display = 'none';
		document.querySelector('#add-finish-btn').style.display = 'block';
	}
	
	
	function loadProductData() {
		
		var rowNumber=document.querySelector('#detailList-table').rows.length-1;
		
		console.log(document.querySelector('.addProductCD').value);
		
		var productCD = document.querySelector('.addProductCD').value;
		
		$.post('selectByProductCD.do', "productCD="+productCD, function(data) {
			var productNM = data.productNM;
			var productGroup = data.productGroup;
			
			console.log(data);
			console.log(productNM);
			console.log(productGroup);
			
			if (data == null || data == "") {
				alert("없는 제품코드입니다");
				document.querySelector('#productCD'+rowNumber).value="";
				document.querySelector('#productCD'+rowNumber).focus();
			} else if (data != null) {
				document.querySelector('#productNM'+rowNumber).innerHTML=productNM;
				document.querySelector('#productGroup'+rowNumber).innerHTML=productGroup;
			}
		});
		
	}
	
	
	function addItemAction() {
		document.querySelector('#add-finish-btn').style.display = 'none';
		document.querySelector('#add-row-btn').style.display = 'block';
	}
	
	
</script>


</head>
<body>
	
	<div class="main-container">
		<div class="content">
			<div class="top-div">
				<div class="top-title">오더관리</div>
				<ul class="top-ul">
					<li><img class="home-img" src="/sharedone/resources/images/home.png"/><span class="home-text">HOME</span></li>
					<li class="s-li">/</li>
					<li class="sub-text-li">오더목록</li>
				</ul>
			</div>
			<div class="search-div">
				<div class="search-sub-wrap">
					<div class="search-sub-div">
						<div class="search-item-div">
							<div class="search-item-text">• 오더번호</div>
							<input type=text id="searchSoNo" class="search" list="CDList">
						</div>
						<div class="search-item-div">
							<div class="search-item-text">• 영업담당자</div>
							<input type=text id="searchSoUser" class="search" list="CDList">
						</div>
						<div class="search-item-div">
							<div class="search-item-text">• 판매가기준일</div>
							<input type=text id="searchPricingDate" class="search" list="CDList">
						</div>
						<div class="search-item-div">
							<div class="search-item-text">• 상태</div>
							<input type=text id="searchStatus" class="search" list="CDList">
						</div>
					</div>
					<div class="search-sub-div">
						<div class="search-item-div">
							<div class="search-item-text">• 거래처코드</div>
							<input type=text id="searchBuyerCD" class="search" list="CDList">
						</div>
						<div class="search-item-div">
							<div class="search-item-text">• 오더등록일</div>
							<input type=text id="searchAddDate" class="search" list="CDList">
						</div>
						<div class="search-item-div">
							<div class="search-item-text">• 납품요청일</div>
							<input type=text id="searchRequestDate" class="search" list="CDList">
						</div>
					</div>
				</div>
				<div class="search-box search" onclick="search()" tabIndex="0">조회</div>
			</div>
			
			<div class="orderList-div">
				<table class="list-table">
					<tr>
						<th class="col1">오더번호</th>
						<th class="col2">거래처코드</th>
						<th class="col3">영업 담당자</th>
						<th class="col4">오더등록일</th>
						<th class="col5">판매가기준일</th>
						<th class="col6">납품요청일</th>
						<th class="col7">통화</th>
						<th class="col8">상태</th>
					</tr>
					<c:if test="${not empty orderList}">
						<c:forEach var="list" items="${orderList }">
							<tr class="orderListTr" onclick="detail('${list.soNo}')">
								<td class="col1">${list.soNo}</td>
								<td class="col2">${list.buyerCD}</td>
								<td class="col3">${list.soUser}</td>
								<td class="col4">${list.addDate}</td>
								<td class="col5">${list.pricingDate}</td>
								<td class="col6">${list.requestDate}</td>
								<td class="col7">${list.currency}</td>
								<td class="col8">${list.status}</td>
							</tr>
						</c:forEach>
					</c:if>
					
				</table>
			</div>
			
			
			<div class="detail-div">
				<div class="x-div"><div onclick="xBack()" class="x-sub-div">✖</div></div>
				
				<div class="detail-row-div">
					<div class="detail-sub-row-div">
						<div class="detail-text">오더번호</div>
						<input type="text" id="detailSoNo" class="no-border" value="" readonly="readonly">
					</div>
					<div class="detail-sub-row-div">
						<div class="detail-text">거래처 코드</div>
						<input type="text" id="detailBuyerCD" class="no-border" value="" readonly="readonly">
					</div>
					<div class="detail-sub-row-div">
						<div class="detail-text">영업담당자</div>
						<input type="text" id="detailSoUser" class="no-border" value="" readonly="readonly">
					</div>
					<div class="detail-sub-row-div">
						<div class="detail-text">오더등록일</div>
						<input type="date" id="detailAddDate" class="no-border" value="" readonly="readonly">
					</div>
				</div>
				
				<div class="detail-row-div">
					<div class="detail-sub-row-div">
						<div class="detail-text">판매가기준일</div>
						<input type="date" id="detailPricingDate" class="no-border" value="" readonly="readonly">
					</div>
					<div class="detail-sub-row-div">
						<div class="detail-text">납품요청일</div>
						<input type="date" id="detailRequestDate" class="no-border" value="" readonly="readonly">
					</div>
					<div class="detail-sub-row-div">
						<div class="detail-text">통화</div>
						<input type="text" id="detailCurrency" class="no-border" value="" readonly="readonly">
					</div>
					<div class="detail-sub-row-div">
						<div class="detail-text">상태</div>
						<input type="text" id="detailStatus" class="no-border" value="" readonly="readonly">
					</div>
				</div>
				
				<hr class="detail-hr">
				
				
				<div class="detailAddItem-div" align="right">
					<button id="add-row-btn" class="detail-action-btn2" onclick="addItem()">제품추가</button>
					<button id="add-finish-btn" class="detail-action-btn2" onclick="addItemAction()" style="display: none;">제품추가완료</button>
				</div>
				
				<div class="detailList-div">
					<table id="detailList-table">
						<tr>
							<th class="detail-header-col1"></th>
							<th class="detail-header-col2">번호</th>
							<th class="detail-header-col3 center">제품코드</th>
							<th class="detail-header-col4 center">제품명</th>
							<th class="detail-header-col5 center">제품그룹</th>
							<th class="detail-header-col6 center">수량</th>
							<th class="detail-header-col7 center">단위</th>
							<th class="detail-header-col8 center">판매가</th>
							<th class="detail-header-col9 center">합계</th>
						</tr>
					</table>
				</div>
				<div class="comment-return-div" style="display: none;">
					<div>
						반려 코멘트
					</div>
					<div>
						<textarea id="comment-return-input" readonly="readonly"></textarea>
					</div>
				</div>
				
				<div class="comment-div">
					<div>
						코멘트
					</div>
					<div>
						<textarea id="comment-input"></textarea>
					</div>
				</div>
				
				
				<div class="detail-action-div">
					<div class="detail-action-btn-div">
						<button class="detail-action-btn1" onclick="updateOrder()">수정</button>
						<button class="detail-action-btn2" onclick="requestApproval()">승인 요청</button>
					</div>
				</div>
			</div>
			
			
			
			<div class="bottom-div">
				<div class="bottom-btn-div">
					<c:set var="editable" value="a"></c:set>
					<button class="new-input-btn" onclick="newInputView()">오더등록</button>
				</div>
			</div>
			
			
		</div>
		
		<div style="display: none;">
			<datalist id="soNoList">
				<c:forEach var="order" items="${orderList }">
					<option value="${order.soNo}"></option>
				</c:forEach>
			</datalist>
		</div>
		
		<div style="display: none;">
			<datalist id="productCDList">
				<c:forEach var="product" items="${productAllList }">
					<option value="${product.productCD}">${product.productNM}</option>
				</c:forEach>
			</datalist>
		</div>
	</div>
	
</body>
</html>