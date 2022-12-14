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

<script src="/sharedone/resources/js/jquery.sumoselect.min.js"></script>
<style type="text/css">@import url("/sharedone/resources/css/sumoselect.min.css");</style>
<style type="text/css">

.search-item-div {
    width: 325px;
    display: flex;
    align-items: center;
    justify-content: center;
}
.search-sub-wrap {
    margin: 28px 0px 20px 64px;
}
.search-item-text2{
	width:67px;
}

.insert-div{
	background: #fff;
    width: 860px;
    height: 746px;
	position: relative;
    top: -700px;
	box-shadow: 2px -1px 4px #b1b1b1;
    padding: 27px 15px 15px 20px;
	margin: auto;
    font-size: 13px;
}
/* 입력 리스트 */
.insertList-div{
    background-color: #fff;
    width: 92%;
    box-shadow: 2px -1px 4px #b1b1b1;
    margin: 17px 0 0 4%;
    overflow: scroll;
    height: 200px;
    resize: both; 
}

#insertList-table{
	margin: 4px 10px 0 10px;
	border-collapse: collapse;
	font-size: 12px;
	width:1700px;
}

.insertListTr:hover{
	background-color: #d3dfea;
	cursor:pointer;
}

 /* 입력창 입력 완료 버튼 구역*/
.insert-action-div{
    background-color: #fff;
    width: 100%;
    height: 43px;
    margin : 18px 0 0 2px;
    bottom: 0;
}
.insert-action-btn-div{
	display: flex;
    margin: 0 0 0 21px;
}

.insert-action-btn{
	border: none;
    background-color: #00944e;
    color: white;
    box-shadow: 1px -1px 2px #b1b1b1;
    margin-right: 10px;
    height: 24px;
    cursor: pointer;
}

.insert-sub-row-div2{
	display: flex;
    flex-direction: row;
    margin-right: 36px;
    justify-content: end;

}
.plus-img{
	width: 17px;
	height: 17px;
	margin-top: 5px;
	cursor: pointer;
}
.minus-img{
	width: 17px;
	height: 17px;
	margin-top: 5px;
	cursor: pointer;
}


/*  */
.insert-buyerCd{
	font-size: 12px;
    font-style: italic;
}

/*  */
.edit-start-btn{
    border: none;
    background-color: #e5e1dc;
    box-shadow: 1px -1px 2px #b1b1b1;
    height: 24px;
    cursor: pointer;
    margin-left: 10px;
}

.edit-finish-btn{
    border: none;
    background-color: #e5e1dc;
    box-shadow: 1px -1px 2px #b1b1b1;
    height: 24px;
    cursor: pointer;
    margin-left: 10px;
}
.edit {
	border: none;
	outline: none;
}
.no-border {
	border: none;
}

.list-input{
	border: none;
    background: transparent;
    width: 55px;
}
.list-input2{
	border: none;
    background: transparent;
    width: 110px;
}
.list-input3{
	border: none;
    background: transparent;
    width: 139px;
}
.list-input4{
	border: none;
    background: transparent;
	width: 79px;
}

.insert-action-btn {
    border: none;
    background-color: #293b4b;
    color: white;
    box-shadow: 1px -1px 2px #b1b1b1;
    cursor: pointer;
    width: 110px;
    height: 39px;
    margin: 10px auto 0 auto;
}
.delBtn{
	cursor:pointer;
}
.reloadDiv{
	width: 24px;
    height: 24px;
    border: 1px solid #e8e8e8;
    border-radius: 5px;
	background-color: #e9e9e9;
    cursor: pointer;
    margin: 5px 0 0 28px;
}
.reloadImg{
	width:18px;
	margin: 3px 0 0 3px;
}

/*  */
#status-select{
    width: 98px;
    height: 26px;
    background-color: #d7d7d7;
    border: none;
}
.insert-select{
	height: 25px;
    width: 144px;
    border:none;
    background-color: #d7d7d7;
}


/* semoselect */

.SumoSelect>.CaptionCont {
    background-color: #d7d7d7;
    border: none;
}
.SumoSelect.open .search-txt{
	background-color: #d7d7d7;
}
</style>
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
	function approve() {
		var sono = document.getElementById("detailSoNo");
		var comm = document.getElementById("comment-input");
		var insertArray = new Array(1);
		console.log(sono);
		console.log(comm);
		if(comm.value==null){
			comm="";
		}
		
		
		insertArray[0] = { soNo: sono.value, content: comm.value, check:"1"};
		
		console.log(insertArray);
		
		$.ajax({
		     method: 'post',
		     url: 'approveOrRefer.do',
		     traditional: true,
		     data: {
		       data: JSON.stringify(insertArray)
		     },
		     dataType: 'json',
		     success: function (res) {
		        if (res.result) {
					pageView('pendingApprovalList.do');
		        }
			}
	   }); 
	}
	function refer() {
		var sono = document.getElementById("detailSoNo");
		var comm = document.getElementById("comment-input");
		var insertArray = new Array(1);
		console.log(sono);
		console.log(comm);
		if(comm.value==null){
			comm.value="";
		}
		
		
		insertArray[0] = { soNo: sono.value, content: comm.value, check:"2"};
		
		console.log(insertArray);
		
		$.ajax({
		     method: 'post',
		     url: 'approveOrRefer.do',
		     traditional: true,
		     data: {
		       data: JSON.stringify(insertArray)
		     },
		     dataType: 'json',
		     success: function (res) {
		        if (res.result) {
					pageView('pendingApprovalList.do');
		        }
			}
	   }); 
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
			document.querySelector('.comment-return-div').style.display = 'block';
		});
		
		$.post('orderItems.do', "soNo="+soNo, function(data) {
			
			for (var i = 0; i < data.length; i++) {
				
				var num = i+1;
				var productCD = data[i].productCD;
				var productNM = data[i].productNM;
				var productGroup = data[i].productGroup;
				var qty = data[i].qty;
				var unit = data[i].unit;
				var unitPrice = data[i].unitPrice;
				var totalPrice = qty * unitPrice;
				
				$('#detailList-table').append(
						"<tr class='detailListTr'>"
							+"<td class='center'>-</td>"
							+"<td class='center'>"+num+"</td>"
							+ "<td class='center'>"+productCD+"</td>"
							+ "<td class='center'>"+productNM+"</td>"
							+ "<td class='center'>"+productGroup+"</td>"
							+ "<td class='center'>"+qty+"</td>"
							+ "<td class='center'>"+unit+"</td>"
							+ "<td class='right'>"+unitPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"</td>"
							+ "<td class='right'>"+totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"</td>"
						+ "</tr>"
				);
			}
		});
		$.post('requestComment.do', "soNo="+soNo, function(data) {
			document.querySelector('#comment-return-input').value = data.content;
		});
		
		
		$('.orderList-div').css('opacity', '0.3');
		$('.search-div').css('opacity', '0.3');
		$('.detail-div').show();
	}
	//검색 조건 초기화
	function delSearchBuyerCd() {
		 $ ('.buyerList')[0].sumo.selectItem(0); 
	}
	function delSearchEmpCd() {
		 $ ('.employeeList')[0].sumo.selectItem(0); 
	}
	//전체 검색 조건 초기화
	function reloadBtn() {
		$ ('.buyerList')[0].sumo.selectItem(0);
		$ ('.employeeList')[0].sumo.selectItem(0);
	}
	
	function xBack(){
		$("#detailList-table tr:not(:first)").remove();	// 상세창 닫을 때 입력한 값 제거
		$('.detail-div').hide();
		$('.orderList-div').css('opacity', '1');
		$('.search-div').css('opacity', '1');
		$('.comment-return-div').hide();
		document.querySelector('#comment-return-input').value="";
		document.querySelector('#comment-input').value="";
	}
	//검색
	function search() {
		var buyerCd = document.querySelector('.buyerList').value;
		var empCd = document.querySelector('.employeeList').value;
		pageView('pendingApprovalList.do?buyerCD='+buyerCd+'&empCd2='+empCd);
	}
	
</script>
<script type="text/javascript">
/* sumoselect */
/* 바이어리스트 */
$('.buyerList').SumoSelect({
	search: true, searchText: '코드/거래처명'
	,noMatch : '"{0}"가 없습니다'
	});
/* 담당자리스트 */
$('.employeeList').SumoSelect({
	search: true, searchText: '코드/담당자명'
	,noMatch : '"{0}"가 없습니다',
	});
/* 거래처상태리스트 */
$('.statusList').SumoSelect({
});
</script>
</head>
<body>
	
	<div class="main-container">
		<div class="content">
			<div class="top-div">
				<div class="top-title">오더 승인 대기 목록</div>
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
						<div class="search-item-text">• 거래처코드/거래처명</div>
						<!-- sumoselect -->
						<select class="buyerList" name="buyerSelect">
							<!-- <option value=""></option> -->
							<option class="hidden" value=""></option>
							<option value="${buyerCd }" selected="selected">${buyerCd } ${buyerNm2 } </option>
							<c:forEach var="buyer" items="${buyerList }">
								<option value="${buyer.buyerCd }">${buyer.buyerCd } ${buyer.buyerNm }</option>
							</c:forEach>
						</select><div class="delBtn" onclick="delSearchBuyerCd()">&nbsp;✖</div>
					</div>
					<div class="search-item-div">
						<div class="search-item-text">• 담당자</div>
						<select id="empCdSelect" class="employeeList" name="employeeSelect">
							<!-- <option value=""></option> -->
							<option class="hidden" value=""></option>
							<option value="${empCd2 }" selected="selected">${empCd2 } ${empNm }</option>
							<c:forEach var="emp" items="${teamList }">
								<option value="${emp.empCd }">${emp.empCd } ${emp.name }</option>
							</c:forEach>
						</select><div class="delBtn" onclick="delSearchEmpCd()">&nbsp;✖</div>
					</div>
					<div class="reloadDiv" onclick="reloadBtn()" title="검색조건 초기화"><img class="reloadImg" alt="" src="/sharedone/resources/images/reload.png"> </div>
				</div>

					</div>
				<div class="search-box search" onclick="search()">조회</div>
			</div>
			<div class="orderList-div" style="margin-top: 50px;">
				<table class="list-table">
					<tr>
						<th class="col1">오더번호</th>
						<th class="col2">거래처코드</th>
						<th class="col3">영업 담당자</th>
						<th class="col4">금액</th>
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
								<td class="col2">${list.buyerCD} ${list.buyerNM }</td>
								<td class="col3">${list.soUser} ${list.name }</td>
								<fmt:formatNumber var="totalPrice" value="${list.totalPrice}" pattern="#,###"/>
								<td class="col4 right">${totalPrice}</td>
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
				<div class="comment-return-div">
					<div>
						승인 요청 코멘트
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
						<button class="detail-action-btn1" onclick="approve()">승인</button>
						<button class="detail-action-btn2" onclick="refer()">반려</button>
					</div>
				</div>
			</div>
			
			
			
			<div class="bottom-div">
				<div class="bottom-btn-div">
					<c:set var="editable" value="a"></c:set>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>