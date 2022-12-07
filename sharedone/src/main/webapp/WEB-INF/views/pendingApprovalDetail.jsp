<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/sharedone/resources/css/share.css");</style>
<style type="text/css">@import url("/sharedone/resources/css/Approval.css");</style>
<style type="text/css">
label,
textarea {
    font-size: .8rem;
    letter-spacing: 1px;
}
textarea {
	height:150px;
	width: 400px;
    padding: 10px;
    max-width: 100%;
    line-height: 1.5;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-shadow: 1px 1px 1px #999;
}

label {
    display: block;
    margin-bottom: 10px;
}
</style>
<script type="text/javascript" src="/sharedone/resources/js/jquery.js"></script>
<script type="text/javascript">
	function chk1() {
		frm.check.value = 1;//1일 때 승인
	}
	function chk2() {
		frm.check.value = 2;//2일 때 반려
	}
</script>
</head>
<body>
	<div class="main-container">
		<div class="content">
			<div class="top-div">
				<div class="top-title">${sono }번 오더 상세</div>
				<ul class="top-ul">
					<li><img class="home-img" src="/sharedone/resources/images/home.png"/><span class="home-text">HOME</span></li>
					<li class="s-li">/</li>
					<li class="sub-text-li">오더 상세</li>
				</ul>
			</div>
			<br>
			<div class="buyerList-div">
				<table class="list-table">
					<tr>
						<th>제품코드</th>
						<th>제품명</th>
						<th>수량</th>
						<th>단위</th>
						<th>판매가</th>
					</tr>
					<c:forEach var="orderDetail" items="${odlist}">
						<tr>
							<td>${orderDetail.productCd }</td>
							<td>${orderDetail.productNm }</td>
							<td>${orderDetail.qty}</td>
							<td>${orderDetail.unit }</td>
							<td>${orderDetail.unitPrice }</td>
						</tr>
					</c:forEach>
					<tr><td colspan="5" align="center"><pre style="background-color: #e5e1dc; width: 200px; height: 100px;">승인 요청 코멘트 란</pre></td></tr>
				</table>
			</div>
			<div align="center">
				<label for="content">상세 사유 작성</label>
				<form name="frm" action="approveOrRefer.do">
					<input type="hidden" value="1" name="sono"> <input
						type="hidden" value="0" name="check">
					<textarea rows="5" name="content" required="required"
						placeholder="상세 사유 작성란" id="content"></textarea>
						
					<div align="center">
					 <span><input type="submit" id="approve" class="new-input-btn" value="승인"
						onclick="chk1()"><input type="submit" value="반려" class="new-input-btn2"
						onclick="chk2()"></span>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>