<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//제품 목록
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
	}
	//바이어목록
	function pageView2(data) {
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
	}
	//판매가격관리
	function pageView3(data) {
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
	}
	//오더현황분석
	function pageView4(data) {
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
	}
</script>
<style type="text/css">
.menu-main-container{
	margin: 0;
    height: 100%;
    background-color: #293b4b;
}
#icon-div{
	background-color: #243646;
	height: 90px;
}
.menu-div{
    height: 60px;
    color: white;
    font-size: 16px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
}
.menu-div:hover{
	background-color: #243646;
}

.menu-img{
	width: 20px;
}
.menu-img2{
	width:25px;
}
</style>
</head>
<body>
	<div class="menu-main-container">
	
		<div class="menu-div" id="icon-div">
			<img style="width:120px; height : 50px;" alt="" src="/sharedone/resources/images/logo.png">
		</div>
		<div class="menu-div"  onclick="pageView('product.do?sortBy=productCD&sortAs=desc')">
			<img class="menu-img" alt="이미지 없음" src="/sharedone/resources/images/product.png"/>&nbsp;제품관리
		</div>
		<div class="menu-div"  onclick="pageView2('buyerManagement.do')">
			<img class="menu-img2" alt="이미지 없음" src="/sharedone/resources/images/buyer.png"/>&nbsp;바이어관리
		</div>
		<div class="menu-div"  onclick="pageView3('priceList.do')">
			<img class="menu-img" alt="이미지 없음" src="/sharedone/resources/images/price.png"/>&nbsp;판매가격관리
		</div>
		<div class="menu-div"  onclick="pageView('order.do?sortBy=soNo&sortAs=desc')">
			<img class="menu-img" alt="이미지 없음" src="/sharedone/resources/images/order.png"/>&nbsp;오더관리
		</div>
		<div class="menu-div"  onclick="pageView4('orderReport.do')">
			<img class="menu-img2" alt="이미지 없음" src="/sharedone/resources/images/dashboard.png"/>&nbsp;오더현황분석
		</div>
		<c:if test="${sessionScope.job == '팀장'}">
			<div class="menu-div"  onclick="pageView('pendingApprovalList.do')">
				<img class="menu-img" alt="이미지 없음" src="/sharedone/resources/images/confirm.png"/>&nbsp;오더승인
			</div>
		</c:if>
	</div>
</body>

</html>