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
							<tr class="orderListTr">
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
	</div>
	
</body>
</html>