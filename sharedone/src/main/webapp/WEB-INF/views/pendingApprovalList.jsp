<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/sharedone/resources/css/share.css");</style>
<style type="text/css">@import url("/sharedone/resources/css/Approval.css");</style>
</head>
<body>
<div class="main-container">
	<div class="content">
			<div class="top-div">
				<div class="top-title">오더 승인대기 리스트</div>
				<ul class="top-ul">
					<li><img class="home-img" src="/sharedone/resources/images/home.png"/><span class="home-text">HOME</span></li>
					<li class="s-li">/</li>
					<li class="sub-text-li">오더 승인대기 리스트</li>
				</ul>
			</div>
			<br>
		<div class="buyerList-div">
			<table class="list-table">
			<tr><th>오더번호</th><th>거래처 코드</th><th>영업 담당자</th><th>오더 등록일</th><th>판매가 기준일</th><th>납품 요청일</th><th>상태</th></tr>
			<c:if test="${empty list }">
				<tr><td colspan="7">승인요청중인 오더가 없습니다</td></tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="t_order" items="${list}">
					<tr>
						<td>${t_order.sono }</td>
						<td><a href="pendingApprovalDetail.do?sono=${t_order.sono }&pageNum=${pb.currentPage}">${t_order.sono }</a></td>
						<td>${t_order.buyerCd }</td>
						<td>${t_order.soUser }</td>
						<td>${t_order.addDate }</td>
						<td>${t_order.pricingDate }</td>
						<td>${t_order.requestDate }</td>
						
					</tr>
				</c:forEach>
			</c:if>
			</table>
		</div>
		<div align="center">
			<ul>
				<!-- 시작페이지가 pagePerBlock보다 크면 앞에 보여줄것이 없다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="pendingApprovalList.do?pageNum=1"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
					<li><a href="pendingApprovalList.do?pageNum=${pd.startPage-1 }"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
				<c:if test="${pb.currentPage == i }">
					<li class="active"><a href="pendingApprovalList.do?pageNum=${i }">${i }</a></li>
				</c:if>
				<c:if test="${pb.currentPage != i }">
					<li><a href="pendingApprovalList.do?pageNum=${i }">${i }</a></li>
				</c:if>
				</c:forEach>
				<!-- engPage보다 totalPage가 크면 뒤에 보여줄것이 있다 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="pendingApprovalList.do?pageNum=${pb.endPage+1 }"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
					<li><a href="pendingApprovalList.do?pageNum=${pb.totalPage }"><span class="glyphicon glyphicon-fast-forward"></span></a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
</body>
</html>