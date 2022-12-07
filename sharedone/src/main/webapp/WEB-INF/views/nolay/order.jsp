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
		
		$('#detailList-table').on('keypress', '.addProductCD' ,function() {
			$(this).val($(this).val().toUpperCase());
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				loadProductData();
			}
		});
		
		$(document).on('keypress', '.addNewProductCD' ,function() {
			$(this).val($(this).val().toUpperCase());
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				loadNewProductData();
			}
		});
		
		$('#detailList-table').on('keypress', '.calculateTotalPrice' ,function() {
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				calculateTotalPrice();
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
	
	var status = "";
	
	function detail(soNo) {
		
		console.log(soNo);
		
		$.post('orderItems.do', "soNo="+soNo, function(data) {
			
			setTimeout(function() {
				for (var i = 0; i < data.length; i++) {
					
					var num = i+1;
					var productCD = data[i].productCD;
					var productNM = data[i].productNM;
					var productGroup = data[i].productGroup;
					var qty = data[i].qty;
					var unit = data[i].unit;
					var unitPrice = data[i].unitPrice;
					var totalPrice = qty * unitPrice;
					
					var status = document.querySelector('#detailStatus').value;
					
					console.log("status : "+status);
					
					
					loadComment();
					
					if (status == '승인완료' || status == '승인대기' || status == '종결') {
						$('#detailList-table').append(
								"<tr class='detailListTr'>"
									+"<td class='center'>"
									+"</td>"
									+"<td class='center'>"+num+"</td>"
									+ "<td class='center productCDCheck'>"+productCD+"</td>"
									+ "<td class='center'>"+productNM+"</td>"
									+ "<td class='center'>"+productGroup+"</td>"
									+ "<td class='center'>"+unit+"</td>"
									+ "<td class='center'>"+qty+"</td>"
									+ "<td class='right'>"+unitPrice+"</td>"
									+ "<td class='right'>"+totalPrice+"</td>"
								+ "</tr>"
						);
						
						
					} else {
						$('#detailList-table').append(
								"<tr class='detailListTr'>"
									+"<td class='center'>"
									+ "<img id='productCD_"+productCD+"' class='minus-img' alt='이미지 없음' src='/sharedone/resources/images/minus.png' onclick='removeItem(this)' />"
									+"</td>"
									+"<td class='center'>"+num+"</td>"
									+ "<td class='center productCDCheck'>"+productCD+"</td>"
									+ "<td class='center'>"+productNM+"</td>"
									+ "<td class='center'>"+productGroup+"</td>"
									+ "<td class='center'>"+unit+"</td>"
									+ "<td class='center'>"+qty+"</td>"
									+ "<td class='right'>"+unitPrice+"</td>"
									+ "<td class='right'>"+totalPrice+"</td>"
								+ "</tr>"
						);
					}
				}
			}, 200);
			
		});
		
		$.post('orderHeader.do', "soNo="+soNo, function(data) {
			
			document.querySelector('#detailSoNo').value = data.soNo;
			document.querySelector('#detailBuyerCD').value = data.buyerCD;
			document.querySelector('#detailSoUser').value = data.soUser;
			document.querySelector('#detailAddDate').value = data.addDate;
			document.querySelector('#detailPricingDate').value = data.pricingDate;
			document.querySelector('#detailRequestDate').value = data.requestDate;
			document.querySelector('#detailStatus').value = data.status;
			document.querySelector('#detailCurrency').value = data.currency;
			
			var status = document.querySelector('#detailStatus').value;
			
			if (status == '반려') {
				document.querySelector('.comment-return-div').style.visibility = 'visible';
			} else if (status == '승인완료' || status == '승인대기' || status == '종결') {
				document.querySelector('.detail-action-btn-div').style.visibility = 'hidden';
				document.querySelector('.detailAddItem-div').style.visibility = 'hidden';
				document.querySelector('#comment-input').readOnly=true;
			}
		});
		
		setTimeout(function() {
			$('.orderList-div').css('opacity', '0.3');
			$('.search-div').css('opacity', '0.3');
			$('.detail-div').show();
		}, 200);
	}
	
	function xBack(){
		document.querySelector('#comment-input').value=""; // 상세창 닫을 때 코멘트 입력한 값 제거
		document.querySelector('#comment-input').readOnly=false;
		$("#detailList-table tr:not(:first)").remove();	// 상세창 닫을 때 입력한 값 제거
		$("#newList-table tr:not(:first)").remove();	// 상세창 닫을 때 입력한 값 제거
		document.querySelector('.comment-return-div').style.visibility = 'hidden';
		document.querySelector('#add-finish-btn').style.display = 'none';
		document.querySelector('#add-cancel-btn').style.display = 'none';
		document.querySelector('#add-row-btn').style.display = 'block';
		document.querySelector('.detailAddItem-div').style.visibility = 'visible';
		document.querySelector('.detail-action-btn-div').style.visibility = 'visible';
		document.querySelectorAll('.newInput').forEach(function(el) {
			el.value="";
		})
		document.querySelectorAll('.newInput2').forEach(function(el) {
			el.value="";
		})
		$('.detail-div').hide();
		$('.new-div').hide();
		$('.orderList-div').css('opacity', '1');
		$('.search-div').css('opacity', '1');
	}
	
	function addItem() {
		
		var rowNumber=document.querySelector('#detailList-table').rows.length;
		console.log(rowNumber);		
		
		$('#detailList-table').append(
				"<tr class='detailListTr'>"
					+ "<td class='center'></td>"
					+ "<td id='num"+rowNumber+"' class='center'>"+rowNumber+"</td>"
					+ "<td>"
					+ "<input type='text' id='productCD"+rowNumber+"' class='item-add-col addProductCD' list='productAllList'>"
					/* + "<input id='load-product-btn' type='button' onclick='loadProductData()' value='확인'>" */
					+ "</td>"
					+ "<td id='productNM"+rowNumber+"' class='center'></td>"
					+ "<td id='productGroup"+rowNumber+"' class='center'></td>"
					+ "<td id='unit"+rowNumber+"' class='center'></td>"
					+ "<td><input type='text' id='qty"+rowNumber+"' class='item-add-col calculateTotalPrice'></td>"
					+ "<td class='right'><input type='text' id='unitPrice"+rowNumber+"' class='item-add-col calculateTotalPrice'></td>"
					+ "<td id='totalPrice"+rowNumber+"' class='right'></td>"
				+ "</tr>"
		);
		
		document.querySelectorAll('.minus-img').forEach(function(el) {
			el.style.visibility = 'hidden';
		})
		
		document.querySelector('#add-row-btn').style.display = 'none';
		document.querySelector('#add-finish-btn').style.display = 'block';
		document.querySelector('#add-cancel-btn').style.display = 'block';
	}
	
	
	function loadProductData() {
		
		var rowNumber=document.querySelector('#detailList-table').rows.length-1;
		
		console.log(document.querySelector('.addProductCD').value);
		
		var productCD = document.querySelector('.addProductCD').value;
		
		$.post('selectByProductCD.do', "productCD="+productCD, function(data) {
			var productNM = data.productNM;
			var productGroup = data.productGroup;
			var unit = data.unit;
			
			
			if (data == null || data == "") {
				alert("없는 제품코드입니다");
				document.querySelector('#productCD'+rowNumber).value="";
				document.querySelector('#productCD'+rowNumber).focus();
			} else if (data != null) {
				
				var count=0;
				
				document.querySelectorAll('.productCDCheck').forEach(function(el) {
					if (el.innerHTML == document.querySelector('#productCD'+rowNumber).value) {
						count += 1;
					}
				})
				
				if (count>0) {
					alert("이미 같은 제품이 등록되어 있습니다.");
					document.querySelector('#productCD'+rowNumber).value="";
					document.querySelector('#productCD'+rowNumber).focus();
				} else if (count == 0) {
					document.querySelector('#productNM'+rowNumber).innerHTML=productNM;
					document.querySelector('#productGroup'+rowNumber).innerHTML=productGroup;
					document.querySelector('#unit'+rowNumber).innerHTML=unit;
				}
				
			}
		});
		
	}
	
	
	function addItemAction() {
		
		var rowNumber=document.querySelector('#detailList-table').rows.length-1;
		
		var productCD = document.querySelector('#productCD'+rowNumber).value;
		var qty = document.querySelector('#qty'+rowNumber).value;
		var unitPrice = document.querySelector('#unitPrice'+rowNumber).value;
		var soNo = document.querySelector('#detailSoNo').value;
		var totalPrice = document.querySelector('#totalPrice'+rowNumber).innerHTML;
		
		if (productCD == "") {
			alert("제품코드를 입력해 주세요.");
			document.querySelector('#productCD'+rowNumber).focus();
		} else if (qty == "") {
			alert("수량을 입력해 주세요.");
			document.querySelector('#qty'+rowNumber).focus();
		} else if (unitPrice == "") {
			alert("판매가를 입력해 주세요.");
			document.querySelector('#unitPrice'+rowNumber).focus();
		} else if (totalPrice == "") {
			alert("수량 또는 판매가에서 엔터를 입력하여 합계를 먼저 구하세요.");
			document.querySelector('#unitPrice'+rowNumber).focus();
		}else {
			$.post('addOrderDetail.do', "soNo="+soNo+"&productCD="+productCD+"&qty="+qty+"&unitPrice="+unitPrice, function(data) {
				$("#detailList-table tr:not(:first)").remove();	// 상세창 닫을 때 입력한 값 제거
				document.querySelector('#add-finish-btn').style.display = 'none';
				document.querySelector('#add-cancel-btn').style.display = 'none';
				document.querySelector('#add-row-btn').style.display = 'block';
				document.querySelectorAll('.minus-img').forEach(function(el) {
					el.style.visibility = 'visible';
				})
				detail(soNo);
			})
		}
	}
		
	function calculateTotalPrice() {

		var rowNumber=document.querySelector('#detailList-table').rows.length-1;
		var count = 0;
		
		var qty = document.querySelector('#qty'+rowNumber).value;
		var unitPrice = document.querySelector('#unitPrice'+rowNumber).value;
		
		if (qty == null || qty == "" || unitPrice == null || unitPrice == "") {
			alert("수량과 판매가 모두 입력하고 엔터를 눌러주세요");
		} else {
			var totalPrice = qty*unitPrice;
			console.log(totalPrice);
			document.querySelector('#totalPrice'+rowNumber).innerHTML=totalPrice;
		}
		
	}
	
	function removeItem(e) {

		if (confirm("진짜로 삭제하시겠습니까?")) {
			var split = e.getAttribute('id').split('_');
			var productCD = split[1];
			var soNo = document.querySelector('#detailSoNo').value;
				
			
			$.post('removeOrderDetail.do', "soNo="+soNo+"&productCD="+productCD, function(result) {
				if (result > 0) {
					console.log("삭제성공!");
					$("#detailList-table tr:not(:first)").remove();	// 상세창 닫을 때 입력한 값 제거
					detail(soNo);
				} else if (result == 0) {
					alert("삭제가 실패하였습니다.");
				}
			})
		}
	}
	
	
	function addItemCancel() {
		var soNo = document.querySelector('#detailSoNo').value;
		$("#detailList-table tr:not(:first)").remove();
		document.querySelector('#add-finish-btn').style.display = 'none';
		document.querySelector('#add-cancel-btn').style.display = 'none';
		document.querySelector('#add-row-btn').style.display = 'block';
		document.querySelectorAll('.minus-img').forEach(function(el) {
			el.style.visibility = 'visible';
		})
		detail(soNo);
	}
	
	function newOrderInputView() {
		$('.orderList-div').css('opacity', '0.3');
		$('.search-div').css('opacity', '0.3');
		$('.new-div').show();
	}
	
	function loadNewProductData() {
		
		var rowNumber=document.querySelector('#detailList-table').rows.length-1;
	
		var productCD = document.querySelector('#newProductCD').value;
		
		$.post('selectByProductCD.do', "productCD="+productCD, function(data) {
			var productNM = data.productNM;
			var productGroup = data.productGroup;
			var unit = data.unit;
			
			if (data == null || data == "") {
				alert("없는 제품코드입니다");
				document.querySelector('#newProductCD').value="";
				document.querySelector('#newProductCD').focus();
			} else if (data != null) {
				
				var count=0;
				
				document.querySelectorAll('.newProductCDCheck').forEach(function(el) {
					if (el.innerHTML == document.querySelector('#newProductCD').value) {
						count += 1;
					}
				})
				
				if (count>0) {
					alert("이미 같은 제품이 등록되어 있습니다.");
					document.querySelector('#newProductCD').value="";
					document.querySelector('#newProductCD').focus();
				} else if (count == 0) {
					document.querySelector('#newProductNM').value=productNM;
					document.querySelector('#newProductGroup').value=productGroup;
					document.querySelector('#newUnit').value=unit;
				}
			} 
		});
		
	}
	
	function newAddItem() {
		
		var productCD = document.querySelector('#newProductCD').value;
		var productNM = document.querySelector('#newProductNM').value;
		var productGroup = document.querySelector('#newProductGroup').value;
		var unit = document.querySelector('#newUnit').value;
		var qty = document.querySelector('#newQty').value;
		var unitPrice = document.querySelector('#newUnitPrice').value;
		var totalPrice = qty * unitPrice;
		
		var rowNumber=document.querySelector('#newList-table').rows.length;
		
		
		if (productCD == "" || productNM == "" || unit == "" || productGroup == "" || qty == "" || unitPrice == "") {
			alert("값을 입력하세요");
		} else {
			$('#newList-table').append(
					"<tr class='newListTr'>"
						+ "<td class='center'></td>"
						+ "<td id='newNum"+rowNumber+"' class='center'>"+rowNumber+"</td>"
						+ "<td id='newProductCD"+rowNumber+"' class='center newProductCDCheck'>"+productCD+"</td>"
						+ "<td id='newProductNM"+rowNumber+"' class='center'>"+productNM+"</td>"
						+ "<td id='newProductGroup"+rowNumber+"' class='center'>"+productGroup+"</td>"
						+ "<td id='newUnit"+rowNumber+"' class='center'>"+unit+"</td>"
						+ "<td id='newQty"+rowNumber+"' class='center'>"+qty+"</td>"
						+ "<td id='newUnitPrice"+rowNumber+"' class='right'>"+unitPrice+"</td>"
						+ "<td id='newTotalPrice"+rowNumber+"' class='right'>"+totalPrice+"</td>"
					+ "</tr>"
			);
			document.querySelectorAll('.newInput').forEach(function(el) {
				el.value="";
			})
			
			document.querySelector('#newProductCD').focus();
		}
	}
	
	function orderInsertAction() {
		
		
		var buyerCD = document.querySelector('#newBuyerCD').value;
		var soUser = document.querySelector('#newSoUser').value;
		var requestDate = document.querySelector('#newRequestDate').value;
		var currency = document.querySelector('#newCurrency').value;
		
		var soNo = "";
		
		if (buyerCD == "" || soUser == "" || requestDate == "" || currency == "") {
			alert("필요한 정보를 입력해 주세요.");
		} else {
			$.post('orderInsert.do', "buyerCD="+buyerCD+"&soUser="+soUser+"&requestDate="+requestDate+"&currency="+currency, function(data) {
				console.log(data);
				soNo = data;
				
				var table = document.querySelector('#newList-table');
				var rows = document.getElementById("newList-table").getElementsByTagName("tr");
				var insertArray = new Array(table.rows.length-1);
				
				for (var i = 0; i < table.rows.length-1; i++) {
					var cells = rows[i+1].getElementsByTagName("td");
					
					insertArray[i] = { soNo: soNo, productCD: cells[2].firstChild.data, qty: cells[6].firstChild.data, unitPrice: cells[7].firstChild.data};
					console.log(insertArray[i]);
				};
				
				console.log(insertArray);
				
			$.ajax({
				     method: 'post',
				     url: 'orderDetailInsert.do',
				     traditional: true,
				     data: {
				       data: JSON.stringify(insertArray)
				     },
				     dataType: 'json',
				     success: function (res) {
				        if (res.result) {
							pageView('order.do');
				        }
					}
			   });
			})
			
		}
		
	}
	
	function requestApproval() {
		
		var soNo = document.querySelector('#detailSoNo').value;
		var msg = document.querySelector('#comment-input').value;
		var status = document.querySelector('#detailStatus').value;
		var empCd = document.querySelector('#detailSoUser').value;
		
		console.log("soNo: "+soNo+", msg : "+msg);
		var encodeMsg = encodeURIComponent(msg);
		console.log("encodeMsg: "+encodeMsg);
		
		
		$.post('requestApproval.do', "soNo="+soNo+"&content="+encodeMsg+"&status="+status+"&empCd="+empCd, function(result) {
			if (result > 0) {
				pageView('order.do');
			} else if (result < 0) {
				alert("오더상태 변경 실패");
			} else if (result == 0) {
				alert("코멘트 저장 실패");
			}
		});
		
	}
	
	function loadComment() {
		
		var content = "";
		
		var soNo = document.querySelector('#detailSoNo').value;
		var empCd = document.querySelector('#detailSoUser').value;
		
		console.log("커멘트 불러오기 시작");
		
		$.post('checkComment.do', "soNo="+soNo+"&empCd="+empCd, function(result) {
			if (result == 0) {
				console.log("커멘트가 없다");
				content = " ";
				document.querySelector('#comment-input').value=content;
			} else if (result > 0) {
				$.post('loadComment.do', "soNo="+soNo+"&empCd="+empCd, function(result) {
					
					content=decodeURIComponent(result);
					console.log("커멘트가 있어서 불러옴 : "+content);
					document.querySelector('#comment-input').value=content;
				});
			}
			
		});	
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
							<input type=text id="searchSoNo" class="search" list="">
						</div>
						<div class="search-item-div">
							<div class="search-item-text">• 영업담당자</div>
							<input type=text id="searchSoUser" class="search" list="">
						</div>
						<div class="search-item-div">
							<div class="search-item-text">• 판매가기준일</div>
							<input type=text id="searchPricingDate" class="search" list="">
						</div>
						<div class="search-item-div">
							<div class="search-item-text">• 상태</div>
							<input type=text id="searchStatus" class="search" list="">
						</div>
					</div>
					<div class="search-sub-div">
						<div class="search-item-div">
							<div class="search-item-text">• 거래처코드</div>
							<input type=text id="searchBuyerCD" class="search" list="">
						</div>
						<div class="search-item-div">
							<div class="search-item-text">• 오더등록일</div>
							<input type=text id="searchAddDate" class="search" list="">
						</div>
						<div class="search-item-div">
							<div class="search-item-text">• 납품요청일</div>
							<input type=text id="searchRequestDate" class="search" list="">
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
			
			
			<div class="new-div">
				<div class="x-div"><div onclick="xBack()" class="x-sub-div">✖</div></div>
				
				<div class="new-row-div">
					<div class="new-sub-row-div">
						<div class="new-text">거래처 코드<span class="red_warn">*</span></div>
						<input type="text" id="newBuyerCD" class="no-border newInput2" list="buyerAllList" size="5" autocomplete="off">
					</div>
					<div class="new-sub-row-div">
						<div class="new-text">영업담당자<span class="red_warn">*</span></div>
						<input type="text" id="newSoUser" class="no-border newInput2" list="employee_list" value="${sessionScope.empCd }" readonly="readonly">
					</div>
					<div class="new-sub-row-div">
						<div class="new-text">납품요청일<span class="red_warn">*</span></div>
						<input type="date" id="newRequestDate" class="no-border newInput2" value="">
					</div>
					<div class="new-sub-row-div">
						<div class="new-text">통화<span class="red_warn">*</span></div>
						<select id="newCurrency"class="">
							<option value="KRW">KRW</option>
							<option value="USD">USD</option>
							<option value="EUR">EUR</option>
							<option value="JPY">JPY</option>
						</select>
					</div>
				</div>
				
				<hr class="new-hr">
				
				
				<div class="newAddItem-div" align="left">
					<div class="new-sub-row-div">
						<div class="new-text">제품코드<span class="red_warn">*</span></div>
						<input type="text" id="newProductCD" class="addNewProductCD newInput" required="required" list="productAllList" autocomplete="off"/>
					</div>
					<div class="new-sub-row-div">
						<div class="new-text">수량<span class="red_warn">*</span></div>
						<input type="text" id="newQty" class="newInput" required="required"/>
					</div>
					<div class="new-sub-row-div">
						<div class="new-text">판매가<span class="red_warn">*</span></div>
						<input type="text" id="newUnitPrice" class="newInput" required="required"/>
					</div>
					<button id="new-add-row-btn" class="new-action-btn2" onclick="newAddItem()">제품추가</button>
				</div>
				
				<div class="newAddItem-div" align="left">
					<div class="new-sub-row-div">
						<div class="new-text">제품명</div>
						<input type="text" id="newProductNM" class="newInput" readonly="readonly"/>
					</div>
					<div class="new-sub-row-div">
						<div class="new-text">제품그룹</div>
						<input type="text" id="newProductGroup" class="newInput" required="required"/>
					</div>
					<div class="new-sub-row-div">
						<div class="new-text">단위</div>
						<input type="text" id="newUnit" class="newInput" required="required"/>
					</div>
				</div>
				
				<div class="newList-div">
					<table id="newList-table">
						<tr>
							<th class="new-header-col1"></th>
							<th class="new-header-col2">번호</th>
							<th class="new-header-col3 center">제품코드</th>
							<th class="new-header-col4 center">제품명</th>
							<th class="new-header-col5 center">제품그룹</th>
							<th class="new-header-col6 center">단위</th>
							<th class="new-header-col7 center">수량</th>
							<th class="new-header-col8 center">판매가</th>
							<th class="new-header-col9 center">합계</th>
						</tr>
					</table>
				</div>
				
				<div class="new-action-div">
					<div class="new-action-btn-div">
						<button class="new-action-btn2" onclick="orderInsertAction()">저장</button>
					</div>
				</div>
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
					<button id="add-cancel-btn" class="detail-action-btn1" onclick="addItemCancel()" style="display: none;">제품추가취소</button>
				</div>
				
				<div class="detailList-div">
					<table id="detailList-table">
						<tr>
							<th class="detail-header-col1"></th>
							<th class="detail-header-col2">번호</th>
							<th class="detail-header-col3 center">제품코드</th>
							<th class="detail-header-col4 center">제품명</th>
							<th class="detail-header-col5 center">제품그룹</th>
							<th class="detail-header-col6 center">단위</th>
							<th class="detail-header-col7 center">수량</th>
							<th class="detail-header-col8 center">판매가</th>
							<th class="detail-header-col9 center">합계</th>
						</tr>
					</table>
				</div>
				<div class="comment-return-div" style="visibility: hidden;">
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
					<button class="new-order-input-btn" onclick="newOrderInputView()">오더등록</button>
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
			<datalist id="productAllList">
				<c:forEach var="product" items="${productAllList }">
					<option value="${product.productCD}">${product.productNM}</option>
				</c:forEach>
			</datalist>
		</div>
		
		<div style="display: none;">
			<datalist id="buyerAllList">
				<c:forEach var="buyer" items="${buyerAllList }">
					<option value="${buyer.buyerCd}">${buyer.buyerNm}</option>
				</c:forEach>
			</datalist>
		</div>
		<div style="display: none;">
			<datalist id="employee_list">
				<c:forEach var="employee" items="${employee_list }">
					<option value="${employee.empCd}">${employee.name}</option>
				</c:forEach>
			</datalist>
		</div>
	</div>
	
</body>
</html>