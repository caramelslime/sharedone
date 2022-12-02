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
<style type="text/css">@import url("/sharedone/resources/css/price.css");</style>

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
	
		$.ajax(ajaxOption).done(function(data) {
			$('#layout-body').children().remove();
			$('#layout-body').html(data);
		});
	}
	
	function xBack(){
		$('.insert-div').hide();
		$('.priceList-div').css('opacity', '1');
		$('.search-div').css('opacity', '1');
		$("#insertList-table tr:not(:first)").remove();	// 입력창 닫을 때 입력한 값 제거
		document.querySelector('#buyerNM').value="";
		document.querySelector('#productNM').value="";
		document.querySelector('#periodStart').value="";
		document.querySelector('#listPrice').value="";
		document.querySelector('#currency').value="";
	}
	
	function newInputView() {
		 $('.insert-div').show();
		 $('.priceList-div').css('opacity', '0.3');
		 $('.search-div').css('opacity', '0.3');
		 document.querySelector('#buyerNM').focus()	// 입력창 열었을 때 첫번째 input에 focus
	}
	
	function addInsert() {
		var buyerNM = document.querySelector('#buyerNM').value;
		var productNM = document.querySelector('#productNM').value;
		var periodStart = document.querySelector('#periodStart').value;
		var listPrice = document.querySelector('#listPrice').value;
		var currency = document.querySelector('#currency').value;
		
		var rowNumber=document.querySelector('#insertList-table').rows.length;
		
		
		
		if (buyerNM == "" || productNM == "" || periodStart == "" || listPrice == "" || currency == "") {
			alert("값을 입력하세요");
		} else {
			$('#insertList-table').append(
					"<tr class='insertListTr'>"
						+ "<td>"+buyerNM+"</td>"
						+ "<td>"+productNM+"</td>"
						+ "<td>"+periodStart+"</td>"
						+ "<td>"+listPrice+"</td>"
						+ "<td>"+currency+"</td>"
						+ "<td>"
						+ "<img  class='minus-img' alt='이미지 없음' src='/sharedone/resources/images/minus.png' onclick='removeInsert(this)' />"
						+ "</td>"	
					+ "</tr>"		
			);
			document.querySelector('#buyerNM').focus();
		}
		
		
	}
	
	function removeInsert(e) {
		e.parentNode.parentNode.parentNode.removeChild(e.parentNode.parentNode);
		
	}
	
	$(function() {
		$('#buyerNM').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(ascii값)
				addInsert();
			}
		});
		$('#productNM').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(ascii값)
				addInsert();
			}
		});
		$('#periodStart').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(ascii값)
				addInsert();
			}
		});
		$('#listPrice').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(ascii값)
				addInsert();
			}
		});
		$('#currency').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(ascii값)
				addInsert();
			}
		});
		$(document).keydown(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 27) { // 27이 esc(ascii값)
				xBack();
			}
		});
	})
	
	function insertAction() {
		var table = document.querySelector('#insertList-table');
		var rows = document.getElementById("insertList-table").getElementsByTagName("tr");
		var insertArray = new Array(table.rows.length-1);
		console.log(rows);
		
		
		for (var i = 0; i < table.rows.length-1; i++) {
			var cells = rows[i+1].getElementsByTagName("td");
			
			insertArray[i] = { buyerNM: cells[0].firstChild.data, productNM: cells[1].firstChild.data, periodStart: cells[2].firstChild.data, listPrice: cells[3].firstChild.data, currency: cells[4].firstChild.data};
			console.log(insertArray[i]);
		};
		
		console.log(insertArray);
		
		$.ajax({
		     method: 'post',
		     url: 'priceInsert.do',
		     traditional: true,
		     data: {
		       data: JSON.stringify(insertArray)
		     },
		     dataType: 'json',
		     success: function (res) {
		        if (res.result) {
					pageView('priceList.do');
		        }
			}
	   });
	}
	
	function selectAll(selectAll) {  
		const checkboxes1 = document.getElementsByName('selectChk');
		
		checkboxes1.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
		})
		
	}
	
	function check() {
		const checkboxes2 = document.getElementsByName('selectChk');
		
		
		let count = 0;
		for (let i=0; i<checkboxes2.length;i++) {
			if (checkboxes2[i].checked == true) {
				count++;
			}
		}
		
		var obj = $("[name=selectChk]");
		var selectChk = Array();
		
		$('input:checkbox[name=selectChk]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
			selectChk.push(this.value);
        });
		console.log(selectChk);
		
		if(count<=0) {
			alert("판매가를 선택해주세요");
			return false;
		} else {
			$(function() {
				$.ajax({
				    url: 'priceDelete.do',
					type : "POST",
					async : true,
					traditional: true,
					data: {"selectChk" : selectChk},
					dataType : "json",
					cache : false
				});
			});
			
		}
		setTimeout(function() {
			pageView('priceList.do');
	    }, 200);
	}
	
// 	function priceNMUpdate(e) {
// 		console.log(e);
// 		var str = e.split('_');
		
// 		console.log(str[0]);
// 		console.log(str[1]);
// 		console.log(str[2]);
		
// 		var buyerCD = str[0];
// 		var productCD = str[1];
// 		var periodStart = str[2];
		
		
		
// 		console.log(document.querySelector('#'+e).value);
		
		
// 	}
	
// 	var editable = 0;
	
// 	function editStart() {
// 		document.querySelector('.edit-start-btn').style.display = 'none';
// 		document.querySelector('.edit-finish-btn').style.display = 'block';
// 		editable = 1;
// 		console.log(editable);
// 	}
	
// 	function editFinish() {
// 		document.querySelector('.edit-start-btn').style.display = 'block';
// 		document.querySelector('.edit-finish-btn').style.display = 'none';
// 		editable = 0;
// 		console.log(editable);
// 	}
	
// 	$(function() {
		
// 			$('.edit').on("focusin", function(event) {
// 				if (editable == 1) {
// 					this.readOnly = false;
// 					console.log("focusin");
// //					console.log(this.value);
// //					console.log(this.getAttribute('id'));
// 				};
// 			});
			
// 			$('.edit').on("focusout", function(event) {
// 				if (editable == 1) {
					
// 					var str = this.getAttribute('id').split('_');
					
// 					if (str[1] == 'productCD') {
// 						var buyerCD = str[0];
// 						var productCD = str[1];
// 						console.log("priceNM = "+priceNM);
						
						
// 						console.log("focusout");
// 						console.log(this.value);
// 						this.readOnly = true;
						
// 					} else if (str[1] == 'unit') {
// 						var productCD = str[0];
// 						var unit = str[1];
						
						
// 						console.log("focusout");
// 						console.log(this.value);
// 						this.readOnly = true;
						
// 					} else if (str[1] == 'productGroup') {
// 						var productCD = str[0];
// 						var productGroup = str[1];
						
						
// 						console.log("focusout");
// 						console.log(this.value);
// 						this.readOnly = true;
						
// 					}
// 				}
// 			});
// 	})

	function search() {
		
		var bcdnm = document.querySelector('#searchBcdnm').value;
		var pcdnm = document.querySelector('#searchPcdnm').value;
		var periodStart = document.querySelector('#searchPeriodStart').value;
		
		pageView('priceList.do?bcdnm='+bcdnm+'&pcdnm='+pcdnm+'&periodStart='+periodStart);
	}
	
</script>

</head>
<body>

	<div class="main-container">
		<div class="content">
			<div class="top-div">
				<div class="top-title">판매가격관리</div>
				<ul class="top-ul">
					<li><img class="home-img" src="/sharedone/resources/images/home.png"/><span class="home-text">HOME</span></li>
					<li class="s-li">/</li>
					<li class="sub-text-li">판매가격관리</li>
				</ul>
			</div>
			<div class="search-div">
				<div class="search-sub-wrap">
				<div class="search-sub-div">
					<div class="search-item-div"><div class="search-item-text">• 거래처명/코드</div><input type=text id="searchBcdnm" class="search" list="buyerList"></div>
					<div class="search-item-div each-item-div"><div class="search-item-text">• 제품명/코드</div><input type="text" id="searchPcdnm" class="search" list="productList"></div>
				</div>
				<div class="search-item-div"><div class="search-item-text">• 유효기간 시작일 </div><input type="date" id="searchPeriodStart" class="search" ></div>	
				</div>
				<div class="search-box search" onclick="search()" tabIndex="0">조회</div>
			</div>
			
			<div class="priceList-div">
				<table class="list-table">
					<tr>
						<th class="col1">
							<input type='checkbox' name='selectChk' value="selectAll" onclick='selectAll(this)' />
						</th>
						<th class="col2">거래처 코드</th>
						<th class="col3">제품 코드</th>
						<th class="col4">유효기간 시작일</th>
						<th class="col5">유효기간 종료일</th>
						<th class="col6">판매가</th>
						<th class="col7">통화</th>
					</tr>
					<c:if test="${not empty priceList}">
						<c:forEach var="price" items="${priceList}">
							<tr class="priceListTr">
								<td class="col1">
									<input type="checkbox" name="selectChk" value="${price.buyerCD},${price.productCD},${price.periodStart}" >
								</td>
								<td class="col2">${price.buyerCD}</td>
								<td class="col3">${price.productCD}</td>
								<td class="col4">${price.periodStart}</td>
								<td class="col5">${price.periodEnd}</td>
								<td class="col6">${price.listPrice}</td>
								<td class="col7">${price.currency}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			
			<div class="insert-div">
				<div class="x-div"><div onclick="xBack()" class="x-sub-div">✖</div></div>
				
				<div class="insert-row-div">
					<div class="insert-sub-row-div">
						<div class="insert-text">거래처명<span class="red_warn">*</span></div>
						<input type="text" id="buyerNM" required="required"/>
					</div>
					<div class="insert-sub-row-div">
						<div class="insert-text">제품명<span class="red_warn">*</span></div>
						<input type="text" id="productNM" required="required"/>
					</div>
					<div class="insert-sub-row-div">
						<div class="insert-text">유효기간 시작일<span class="red_warn">*</span></div>
						<input type="date" id="periodStart" required="required">
					</div>
				</div>
				<div class="insert-row-div">
					<div class="insert-sub-row-div">
						<div class="insert-text">판매가<span class="red_warn">*</span></div>
						<input type="text" id="listPrice" required="required"/>
					</div>
					<div class="insert-sub-row-div">
						<div class="insert-text">통화<span class="red_warn">*</span></div>
						<input type="text" id="currency" required="required"/>
					</div>
					<div class="insert-sub-row-div">
						<img class="plus-img" alt="이미지 없음" src="/sharedone/resources/images/plus.png" onclick="addInsert()" />
					</div>
				</div>
				
				<hr class="insert-hr">
				
				<div class="insertList-div">
					<table id="insertList-table">
						<tr>
							<th class="col1">거래처명</th>
							<th class="col2">제품명</th>
							<th class="col3">유효기간 시작일</th>
							<th class="col4">판매가</th>
							<th class="col5">통화</th>
							<th class="col6"></th>
						</tr>
					</table>
				</div>
				<div class="insert-action-div">
					<div class="insert-action-btn-div">
						<button class="insert-action-btn" onclick="insertAction()">등록</button>
					</div>
				</div>
			</div>
			
			<div class="bottom-div">
				<div class="bottom-btn-div">
					<button class="new-input-btn" onclick="newInputView()">판매가격등록</button>
					<button class="del-btn" onclick="check()">삭제</button>
				</div>
			</div>
		</div>
		<div style="display: none;">
			<datalist id="buyerList">
				<c:forEach var="buyer" items="${buyerList }">
					<option value="${buyer.buyernm}">${buyer.buyercd }</option>
				</c:forEach>
			</datalist>
			<datalist id="productList">
				<c:forEach var="product" items="${productList }">
					<option value="${product.productNM}">${product.productCD }</option>
				</c:forEach>
			</datalist>
		</div>
	</div>

</body>
</html>