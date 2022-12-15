<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/sharedone/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/sharedone/resources/js/daterangepicker.js"></script>
<style type="text/css">@import url("/sharedone/resources/css/daterangepicker.css");</style>

<style type="text/css">@import url("/sharedone/resources/css/share.css");</style>
<style type="text/css">@import url("/sharedone/resources/css/order.css");</style>


<script type="text/javascript">
	
	var sortAs = '${sortAs}';
	var sortBy = '${sortBy}';
	
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
	
	
	
	var editable = 0;
	
	/* 제품 수정 활성화 */
	function editStart() {
		
		document.querySelectorAll('.minus-img').forEach(function(el) {
			el.style.visibility = 'hidden';
		})
		document.querySelector('#add-row-btn').style.visibility = 'hidden';
		document.querySelectorAll('.edit-start-btn2').forEach(function(el) {
			el.style.visibility = 'hidden';
		})
		document.querySelector('.edit-finish-btn2').style.display = 'block';
		document.querySelector('#request-approval-btn').style.display = 'none';
		
		$('.edit-back').css('background-color', '#d3dfea');
		
		editable = 1;
		
		document.querySelectorAll('.edit').forEach(function(element) {
			element.readOnly = false;
		})
			
	}
	
	/* 제품 수정 비활성화 */
	function editFinish() {
		
		$('.edit-back').css('background-color', '#fff');
		
		var count = 0;
		document.querySelectorAll('.edit').forEach(function(element) {
			if (element.value == '' || element.value == null) {
				count +=1;
			} 
		})
		
		document.querySelectorAll('.detailTotalPrice').forEach(function(element) {
			if (element.innerHTML == '' || element.innerHTML == null) {
				count +=1;
			} 
		})
		
		
		if (count > 0) {
			alert('제품 정보와 합계를 불러온 후에 저장해주세요');
		} else {
		
			document.querySelectorAll('.edit-start-btn2').forEach(function(el) {
				el.style.visibility = 'visible';
			})
			document.querySelector('.edit-finish-btn2').style.display = 'none';
			document.querySelector('#request-approval-btn').style.display = 'block';
			
			editable = 0;
			
			document.querySelectorAll('.edit').forEach(function(element) {
				element.readOnly = true;
			})
			
			var soNo = document.querySelector('#detailSoNo').value;
			detailProductDelete(soNo);
			
			document.querySelectorAll('.productCDCheck').forEach(function(element) {
				
				var row = element.getAttribute('id').substr(15);
				var productCD = element.value
				var qty = document.querySelector('#detailQty'+row).value;
				var unitPrice1 = document.querySelector('#detailUnitPrice'+row).innerHTML;
				var unitPrice = unitPrice1.replace(/,/g, "");
				
				setTimeout(function() {
			 		detailProductUpdate(soNo, productCD, qty, unitPrice);
				}, 200);
		 		
			})
				
			document.querySelectorAll('.minus-img').forEach(function(el) {
				el.style.visibility = 'visible';
			})
			document.querySelector('#add-row-btn').style.visibility = 'visible';
			
			
	 		setTimeout(function() {
		 		detail(soNo);
			}, 300);
	 		
		}
	}
	
	function detailProductDelete(soNo) {
		$(function() {
			$.ajax({
			    url: 'detailProductDelete.do?soNo='+soNo,
				type : "POST",
				async : true,
				traditional: true,
				dataType : "html",
				cache : false
			});
		});
	}
	
	var previousValue = "";
	
	 var keydown = false;
	
	$(function() {
		
		var addDateRange = '${addDateRange}';
		var pricingDateRange = '${pricingDateRange}';
		var requestDateRange = '${requestDateRange}';
		console.log("addDateRange : "+addDateRange);
		console.log("pricingDateRange : "+pricingDateRange);
		console.log("requestDateRange : "+requestDateRange);
		
		if (addDateRange != '') {
			console.log("addDateRange not null");
			$("input#searchAddDate").attr("placeholder", addDateRange);
		};
		if (pricingDateRange != '') {
			console.log("pricingDateRange not null");
			$("input#searchPricingDate").attr("placeholder", pricingDateRange);
		};
		if (requestDateRange != '') {
			console.log("requestDateRange not null");
			$("input#searchRequestDate").attr("placeholder", requestDateRange);
		};
		
		$('.dateRange').daterangepicker({
		    locale: {
		        "separator": " ~ ",                     // 시작일시와 종료일시 구분자
		        "format": 'YYYY-MM-DD',     // 일시 노출 포맷
		        "applyLabel": "확인",                    // 확인 버튼 텍스트
		        "cancelLabel": "취소",                   // 취소 버튼 텍스트
		        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
		        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		    }
        });
		
		document.querySelectorAll('.dateRange').forEach(function(el) {
			el.value="";
		});
		
		
		$('.search').keydown(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				search('soNo', 'desc');
			}
		});
		
		$(document).keydown(function() { // esc키를 insert 화면에서 나오기
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 27) { // 27이 esc (assii값)
				if (keydown) return;
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
				if (document.querySelector('#newBuyerCD').value == null || document.querySelector('#newBuyerCD').value == "") {
					alert("거래처코드를 입력해주세요.");
					document.querySelector('#newBuyerCD').focus();
				} else if (document.querySelector('#newBuyerCD').value != null && document.querySelector('#newBuyerCD').value != "") {
					loadNewProductData();
				}
			}
		});
		
		$(document).on('keydown', '.addDetailProductCD' ,function() {
			$(this).val($(this).val().toUpperCase());
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
					var row1 = this.getAttribute('id').substr(15);
					var row = Number(row1);
					loadDetailProductData(row);
			}
		});
		
		
		$('#detailList-table').on('keypress', '.calculateTotalPrice' ,function() {
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				calculateTotalPrice();
			}
		});
		
		$('#detailList-table').on('keypress', '.calculateDetailTotalPrice' ,function() {
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				var row = this.getAttribute('id').substr(9);
				calculateDetailTotalPrice(row);
			}
		});
		
		
		
	})
	
	/* 제품 업데이트 */
	function detailProductUpdate(soNo, productCD, qty, unitPrice) {
		
		$(function() {
			$.ajax({
			    url: 'detailProductUpdate.do?soNo='+soNo+'&productCD='+productCD+'&qty='+qty+'&unitPrice='+unitPrice,
				type : "POST",
				async : true,
				traditional: true,
				dataType : "html",
				cache : false
			});
		});
		
	}
	
	var status = "";
	
	var doubleSubmitFlag = false;
	function doubleSubmitCheck(){
	    if(doubleSubmitFlag){
	        return doubleSubmitFlag;
	    }else{
	        doubleSubmitFlag = true;
	        return false;
	    }
	}
	
	function detail(soNo) {
		
		if (doubleSubmitCheck()) return;
		
		$("#detailList-table tr:not(:first)").remove();	// 상세창 닫을 때 입력한 값 제거
		
		$.post('orderItems.do', "soNo="+soNo, function(data) {
			
			setTimeout(function() {
				for (var i = 0; i < data.length; i++) {
					
					var num = i+1;
					var productCD = data[i].productCD;
					var productNM = data[i].productNM;
					var productGroup = data[i].productGroup;
					var qty = data[i].qty;
					var unit = data[i].unit;
					var unitPrice = data[i].unitPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					var totalPrice1 = qty * unitPrice.replace(/,/g, "");
					var totalPrice = totalPrice1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					
					var status = document.querySelector('#detailStatus').value;
					
					var rowNumber=document.querySelector('#detailList-table').rows.length;
					
					if (status == '승인완료' || status == '승인대기' || status == '종결') {
						$('#detailList-table').append(
								"<tr class='detailListTr'>"
									+"<td class='center'>"
									+"</td>"
									+"<td class='center'>"+num+"</td>"
									+ "<td class='edit-back'> <input type='text' id='detailProductCD"+rowNumber+"' class='center addDetailProductCD edit productCDCheck' value='"+productCD+"' list='productAllList' readonly='readonly'></td>"
									+ "<td id='detailProductNM"+rowNumber+"' class='center'>"+productNM+"</td>"
									+ "<td id='detailProductGroup"+rowNumber+"' class='center'>"+productGroup+"</td>"
									+ "<td id='detailUnit"+rowNumber+"' class='center'>"+unit+"</td>"
									+ "<td class='edit-back'> <input type='text' id='detailQty"+rowNumber+"' class='center calculateDetailTotalPrice edit' value='"+qty+"' readonly='readonly'></td>"
									+ "<td id='detailUnitPrice"+rowNumber+"' class='right '>"+unitPrice+"</td>"
									+ "<td id='detailTotalPrice"+rowNumber+"' class='right detailTotalPrice'>"+totalPrice+"</td>"
								+ "</tr>"
						);
						
						
					} else {
						$('#detailList-table').append(
								"<tr class='detailListTr'>"
									+"<td class='center'>"
									+ "<img id='productCD_"+productCD+"' class='minus-img' alt='이미지 없음' src='/sharedone/resources/images/minus.png' onclick='removeItem(this)' />"
									+"</td>"
									+"<td class='center'>"+num+"</td>"
									+ "<td class='edit-back'> <input type='text' id='detailProductCD"+rowNumber+"' class='center addDetailProductCD edit productCDCheck' value='"+productCD+"' list='productAllList' readonly='readonly'></td>"
									+ "<td id='detailProductNM"+rowNumber+"' class='center'>"+productNM+"</td>"
									+ "<td id='detailProductGroup"+rowNumber+"' class='center'>"+productGroup+"</td>"
									+ "<td id='detailUnit"+rowNumber+"' class='center'>"+unit+"</td>"
									+ "<td class='edit-back'> <input type='text' id='detailQty"+rowNumber+"' class='center calculateDetailTotalPrice edit' value='"+qty+"' readonly='readonly'></td>"
									+ "<td id='detailUnitPrice"+rowNumber+"' class='right'>"+unitPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"</td>"
									+ "<td id='detailTotalPrice"+rowNumber+"' class='right detailTotalPrice'>"+totalPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"</td>"
								+ "</tr>"
						);
					}
				}
				loadComment();
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
				document.querySelector('.comment-return-div').style.display = 'block';
			} else if (status == '승인완료') {
				document.querySelector('.comment-finish-div').style.display = 'block';
				document.querySelector('.detail-action-btn-div').style.visibility = 'hidden';
				document.querySelector('.detailAddItem-div').style.visibility = 'hidden';
				document.querySelector('#comment-input').readOnly=true;
				document.querySelector('#comment-title').innerHTML='최종 승인 요청 코멘트';
			} else if (status == '승인대기' || status == '종결') {
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
		keydown = true;
		search(sortBy, sortAs);
		
	}
	
	function addItem() {
		
		var rowNumber=document.querySelector('#detailList-table').rows.length;
		
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
					+ "<td id='unitPrice"+rowNumber+"' class='right calculateTotalPrice'></td>"
					+ "<td id='totalPrice"+rowNumber+"' class='right'></td>"
				+ "</tr>"
		);
		
		document.querySelectorAll('.minus-img').forEach(function(el) {
			el.style.visibility = 'hidden';
		})
		
		document.querySelector('#add-row-btn').style.visibility = 'hidden';
		document.querySelector('#add-finish-btn').style.display = 'block';
		document.querySelector('#add-cancel-btn').style.display = 'block';
		document.querySelectorAll('.edit-start-btn2').forEach(function(el) {
			el.style.visibility = 'hidden';
		})
		
		document.querySelector('#request-approval-btn').style.visibility = 'hidden';
		
	}
	
	
	function loadProductData() {
		
		var rowNumber=document.querySelector('#detailList-table').rows.length-1;
		
		var productCD = document.querySelector('.addProductCD').value;
		
 		var pricingDate = document.querySelector('#detailPricingDate').value;
 		
 		var buyerCD = document.querySelector('#detailBuyerCD').value;
 		
 		var currency = document.querySelector('#detailCurrency').value;
		
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
					if (el.value == document.querySelector('#productCD'+rowNumber).value) {
						count += 1;
					}
				})
				
				if (count>0) {
					alert("이미 같은 제품이 등록되어 있습니다.");
					document.querySelector('#productCD'+rowNumber).value="";
					document.querySelector('#productCD'+rowNumber).focus();
				} else if (count == 0) {
					
					
					
					$.post('checkValidPrice.do', "productCD="+productCD+"&buyerCD="+buyerCD+"&currency="+currency+"&pricingDate="+pricingDate, function(count) {
						console.log("checkValidPrice끝나고: "+count);
						if (count > 0) {
							$.post('validPrice.do', "productCD="+productCD+"&buyerCD="+buyerCD+"&currency="+currency+"&pricingDate="+pricingDate, function(price) {
								console.log('기간내 가격 있음 : '+price);
								console.log(document.querySelector('#unitPrice'+rowNumber));
								document.querySelector('#unitPrice'+rowNumber).innerHTML = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
								document.querySelector('#productNM'+rowNumber).innerHTML=productNM;
								document.querySelector('#productGroup'+rowNumber).innerHTML=productGroup;
								document.querySelector('#unit'+rowNumber).innerHTML=unit;
							});
						} else if (count == 0) {
							
							console.log("테스트2"+document.querySelector('#detailCurrency').value);
							
							if (document.querySelector('#detailCurrency').value == 'KRW') {
								$.post('defaultPrice.do', "productCD="+productCD+"&currency="+currency, function(price) {
									console.log('기간내 가격 없음 -> defaultPrice : '+price);
									console.log(document.querySelector('#unitPrice'+rowNumber));
									alert("판매가 기준일에 부합하는 가격이 없어 기본 가격(KRW)이 입력되었습니다.");
									document.querySelector('#unitPrice'+rowNumber).innerHTML = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
									document.querySelector('#productNM'+rowNumber).innerHTML=productNM;
									document.querySelector('#productGroup'+rowNumber).innerHTML=productGroup;
									document.querySelector('#unit'+rowNumber).innerHTML=unit;
								});
							} else {
								alert("판매가 기준일과 통화에 부합하는 가격이 없습니다.");
								document.querySelector('#productCD'+rowNumber).value="";
								document.querySelector('#productCD'+rowNumber).focus();
								return;
							}
						}
					});
				}
				
			}
		});
		
	}
	
	function loadDetailProductData(row) {
		
		var rowNumber=row;
		
		var productCD = document.querySelector('#detailProductCD'+rowNumber).value;
		
 		var pricingDate = document.querySelector('#detailPricingDate').value;
 		
 		var buyerCD = document.querySelector('#detailBuyerCD').value;
 		
 		var currency = document.querySelector('#detailCurrency').value;
		
		
		
		$.post('selectByProductCD.do', "productCD="+productCD, function(data) {
			var productNM = data.productNM;
			var productGroup = data.productGroup;
			var unit = data.unit;
			var soNo = document.querySelector('#detailSoNo').value;
			
			if (data == null || data == "") {
				alert("없는 제품코드입니다");
				document.querySelector('#detailProductCD'+rowNumber).value="";
				document.querySelector('#detailProductCD'+rowNumber).focus();
			} else if (data != null) {
				
				var count=0;
				
				document.querySelectorAll('.productCDCheck').forEach(function(el) {
					
					if (el.value == document.querySelector('#detailProductCD'+rowNumber).value) {
						count += 1;
					}
				})
				
				if (count>1) {
					alert("이미 같은 제품이 등록되어 있습니다.");
					document.querySelector('#detailProductCD'+rowNumber).value="";
					document.querySelector('#detailProductCD'+rowNumber).focus();
					return;
				} else if (count == 1) {
					
					var buyerCD = document.querySelector('#detailBuyerCD').value;
					var currency = document.querySelector('#detailCurrency').value;
					
					$.post('checkValidPrice.do', "productCD="+productCD+"&buyerCD="+buyerCD+"&currency="+currency+"&pricingDate="+pricingDate, function(count) {
						if (count > 0) {
							$.post('validPrice.do', "productCD="+productCD+"&buyerCD="+buyerCD+"&currency="+currency+"&pricingDate="+pricingDate, function(price) {
								console.log('기간내 가격 있음 : '+price);
								console.log(document.querySelector('#detailUnitPrice'+rowNumber));
								document.querySelector('#detailUnitPrice'+rowNumber).innerHTML = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
							});
						} else if (count == 0) {
							
							console.log("테스트1"+document.querySelector('#detailCurrency').value);
							
							if (document.querySelector('#detailCurrency').value == 'KRW') {
								$.post('defaultPrice.do', "productCD="+productCD+"&currency="+currency+"&pricingDate="+pricingDate, function(price) {
									console.log('기간내 가격 없음 -> defaultPrice : '+price);
									alert("판매가 기준일에 부합하는 가격이 없어 기본 가격(KRW)이 입력되었습니다.");
									console.log(document.querySelector('#detailUnitPrice'+rowNumber));
									document.querySelector('#detailUnitPrice'+rowNumber).innerHTML = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
								});
							} else {
								alert("판매가 기준일과 통화에 부합하는 가격이 없습니다.");
								document.querySelector('#detailProductCD'+rowNumber).value="";
								document.querySelector('#detailProductCD'+rowNumber).focus();
								return;
							}
						}
					});
					
					document.querySelector('#detailProductNM'+rowNumber).innerHTML=productNM;
					document.querySelector('#detailProductGroup'+rowNumber).innerHTML=productGroup;
					document.querySelector('#detailUnit'+rowNumber).innerHTML=unit;
					document.querySelector('#detailTotalPrice'+rowNumber).innerHTML="";
					
				}
				
			}
		});
		
	}
	
	
	function addItemAction() {
		
		var rowNumber=document.querySelector('#detailList-table').rows.length-1;
		
		var productCD = document.querySelector('#productCD'+rowNumber).value;
		var qty = document.querySelector('#qty'+rowNumber).value;
		var unitPrice1 = document.querySelector('#unitPrice'+rowNumber).innerHTML;
		var unitPrice = unitPrice1.replace(/,/g, "");
		var soNo = document.querySelector('#detailSoNo').value;
		var totalPrice1 = document.querySelector('#totalPrice'+rowNumber).innerHTML;
		var totalPrice = totalPrice1.replace(/,/g, "");
		
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
				document.querySelector('#add-row-btn').style.visibility = 'visible';
				document.querySelectorAll('.edit-start-btn2').forEach(function(el) {
					el.style.visibility = 'visible';
				});
				document.querySelector('#request-approval-btn').style.visibility = 'visible';
				document.querySelectorAll('.minus-img').forEach(function(el) {
					el.style.visibility = 'visible';
				});
				doubleSubmitFlag = false;
				detail(soNo);
			})
		}
	}
		
	function calculateTotalPrice() {

		var rowNumber=document.querySelector('#detailList-table').rows.length-1;
		var count = 0;
		
		var qty = document.querySelector('#qty'+rowNumber).value;
		var unitPrice1 = document.querySelector('#unitPrice'+rowNumber).innerHTML;
		var unitPrice = unitPrice1.replace(/,/g, "");
		
		if (qty == null || qty == "" || unitPrice == null || unitPrice == "") {
			alert("제품코드와 수량을 입력하고 엔터를 눌러주세요");
		} else {
			var totalPrice1 = qty*unitPrice;
			var totalPrice = totalPrice1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			document.querySelector('#totalPrice'+rowNumber).innerHTML=totalPrice;
		}
		
	}
	
	function calculateDetailTotalPrice(row) {
	
		var rowNumber=row
		var count = 0;
		
		var qty = document.querySelector('#detailQty'+rowNumber).value;
		var unitPrice1 = document.querySelector('#detailUnitPrice'+rowNumber).innerHTML;
		var unitPrice = unitPrice1.replace(/,/g, "");
		
		if (qty == null || qty == "" || unitPrice == null || unitPrice == "") {
			alert("제품코드와 수량을 입력하고 엔터를 눌러주세요");
		} else {
			var totalPrice1 = qty*unitPrice;
			var totalPrice = totalPrice1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			document.querySelector('#detailTotalPrice'+rowNumber).innerHTML=totalPrice;
		}
		
	}
	
	function removeItem(e) {

		if (confirm("진짜로 삭제하시겠습니까?")) {
			doubleSubmitFlag = false;
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
		document.querySelector('#add-row-btn').style.visibility = 'visible';
		document.querySelectorAll('.edit-start-btn2').forEach(function(el) {
			el.style.visibility = 'visible';
		})
		document.querySelector('#request-approval-btn').style.visibility = 'visible';
		document.querySelectorAll('.minus-img').forEach(function(el) {
			el.style.visibility = 'visible';
		})
		detail(soNo);
	}
	
	function newOrderInputView() {
		$('.orderList-div').css('opacity', '0.3');
		$('.search-div').css('opacity', '0.3');
		$('.new-div').show();
		
		
		var soUser = document.querySelector('#searchSoUser').value;
		document.querySelector('#newSoUser').value = soUser;
	}
	
	function loadNewProductData() {
		
		var rowNumber=document.querySelector('#detailList-table').rows.length-1;
	
		var productCD = document.querySelector('#newProductCD').value;
 		var pricingDate = document.querySelector('#newPricingDate').value;
 		var buyerCD = document.querySelector('#newBuyerCD').value;
 		var currency = document.querySelector('#newCurrency').value;
		
		
		
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
					
					var buyerCD = document.querySelector('#newBuyerCD').value;
					var currency = document.querySelector('#newCurrency').value;
					
					$.post('checkValidPrice.do', "productCD="+productCD+"&buyerCD="+buyerCD+"&currency="+currency+"&pricingDate="+pricingDate, function(count) {
						if (count > 0) {
							$.post('validPrice.do', "productCD="+productCD+"&buyerCD="+buyerCD+"&currency="+currency+"&pricingDate="+pricingDate, function(price) {
								var finalPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
								console.log('기간내 가격 있음 : '+finalPrice);
								document.querySelector('#newUnitPrice').value = finalPrice;
							});
						} else if (count == 0) {
							$.post('defaultPrice.do', "productCD="+productCD+"&currency="+currency+"&pricingDate="+pricingDate, function(price) {
								var finalPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
								console.log('기간내 가격 없음 -> defaultPrice : '+finalPrice);
								document.querySelector('#newUnitPrice').value = finalPrice;
							});
						}
					});
					
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
		var totalPrice = qty * unitPrice.replace(/,/g, "");
		
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
						+ "<td id='newTotalPrice"+rowNumber+"' class='right'>"+totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"</td>"
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
		var pricingDate = document.querySelector('#newPricingDate').value;
		var currency = document.querySelector('#newCurrency').value;
		
		var soNo = "";
		
		if (buyerCD == "" || soUser == "" || requestDate == "" || currency == "") {
			alert("필요한 정보를 입력해 주세요.");
		} else {
			$.post('orderInsert.do', "buyerCD="+buyerCD+"&soUser="+soUser+"&requestDate="+requestDate+"&currency="+currency+"&pricingDate="+pricingDate, function(data) {
				soNo = data;
				
				var table = document.querySelector('#newList-table');
				var rows = document.getElementById("newList-table").getElementsByTagName("tr");
				var insertArray = new Array(table.rows.length-1);
				
				for (var i = 0; i < table.rows.length-1; i++) {
					var cells = rows[i+1].getElementsByTagName("td");
					
					insertArray[i] = { soNo: soNo, productCD: cells[2].firstChild.data, qty: cells[6].firstChild.data, unitPrice: cells[7].firstChild.data.replace(/,/g, "")};
				};
				
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
							alert("입력이 완료되었습니다");
							search('soNo', 'desc');
				        }
					}
			   });
			})
			
		}
		
	}
	
	function requestApproval() {
		
		if (document.querySelector('#comment-input').value == null || document.querySelector('#comment-input').value == '') {
			alert('승인 요청 코멘트를 입력해 주세요');
			document.querySelector('#comment-input').focus();
		} else {
			var soNo = document.querySelector('#detailSoNo').value;
			var msg = document.querySelector('#comment-input').value;
			var status = document.querySelector('#detailStatus').value;
			var empCd = document.querySelector('#detailSoUser').value;
			
			var encodeMsg = encodeURIComponent(msg);
			
			$.post('requestApproval.do', "soNo="+soNo+"&content="+encodeMsg+"&status="+status+"&empCd="+empCd, function(result) {
				if (result > 0) {
					pageView('order.do?soNo='+soNo+'&sortBy=soNo&sortAs=desc');
				} else if (result < 0) {
					alert("오더상태 변경 실패");
				} else if (result == 0) {
					alert("코멘트 저장 실패");
				}
			});
		}
	}
	
	function terminate() {
		if (document.querySelector('#comment-input').value == null || document.querySelector('#comment-input').value == '') {
			alert('종결을 위한 코멘트를 입력해 주세요');
			document.querySelector('#comment-input').focus();
		} else {
			var soNo = document.querySelector('#detailSoNo').value;
			var msg = document.querySelector('#comment-input').value;
			var status = document.querySelector('#detailStatus').value;
			var empCd = document.querySelector('#detailSoUser').value;
			
			var encodeMsg = encodeURIComponent(msg);
			
			$.post('terminate.do', "soNo="+soNo+"&content="+encodeMsg+"&status="+status+"&empCd="+empCd, function(result) {
				if (result > 0) {
					alert("종결상태로 변경 완료");
					pageView('order.do?soNo='+soNo+'&sortBy=soNo&sortAs=desc');
				} else if (result < 0) {
					alert("종결상태로 변경 실패");
				} else if (result == 0) {
					alert("코멘트 저장 실패");
				}
			});
		}
	}
	
	
	function loadComment() {
		
		var content = "";
		
		var soNo = document.querySelector('#detailSoNo').value;
		var empCd = document.querySelector('#detailSoUser').value;
		var status = document.querySelector('#detailStatus').value;
		
		console.log("커멘트 불러오기 시작");
		
		$.post('checkComment.do', "soNo="+soNo+"&empCd="+empCd, function(result) {
			if (result == 0) {
				console.log("커멘트가 없다");
				content = "";
				document.querySelector('#comment-input').value=content;
			} else if (result > 0) {
				$.post('loadComment.do', "soNo="+soNo+"&empCd="+empCd, function(result) {
					
					content=decodeURIComponent(result);
					console.log("커멘트가 있어서 불러옴 : "+content);
					$("#comment-input").attr("placeholder", content);
				});
			}
			
		});
		
		$.post('checkReturnComment.do', "soNo="+soNo+"&empCd="+empCd, function(result) {
			if (result == 0) {
				console.log("반려커멘트가 없다");
				content = "";
				document.querySelector('#comment-return-input').value=content;
			} else if (result > 0) {
				$.post('loadReturnComment.do', "soNo="+soNo+"&empCd="+empCd, function(result) {
					
					content=decodeURIComponent(result);
					console.log("커멘트가 있어서 불러옴 : "+content);
					if (status == "승인완료") {
						document.querySelector('#comment-finish-input').value=content;
					}
					document.querySelector('#comment-return-input').value=content;
				});
			}
			
		});	
		
		
	}
	
	
	
	
	
function search(sortB, sortA) {
		
		var soNo = document.querySelector('#searchSoNo').value;
		var soUser = document.querySelector('#searchSoUser').value;
		var status = document.querySelector('#searchStatus').value;
		var buyerCD = document.querySelector('#searchBuyerCD').value;
		var addDateRange = document.querySelector('#searchAddDate').value;
		var pricingDateRange = document.querySelector('#searchPricingDate').value;
		var requestDateRange = document.querySelector('#searchRequestDate').value;
		
		var addDateRangePlaceholder = document.querySelector('#searchAddDate').getAttribute('placeholder');
		var pricingDateRangePlaceholder = document.querySelector('#searchPricingDate').getAttribute('placeholder');
		var requestDateRangePlaceholder = document.querySelector('#searchRequestDate').getAttribute('placeholder');
		
		if (addDateRange == null || addDateRange == '') {
			if (addDateRangePlaceholder == null) {
				addDateRange = '';
			} else {
				addDateRange = addDateRangePlaceholder;
			}
		}
		
		
		if (pricingDateRange == null || pricingDateRange == '') {
			if (pricingDateRangePlaceholder == null) {
				pricingDateRange = '';
			} else {
				pricingDateRange = pricingDateRangePlaceholder;
			}
		}
		
		if (requestDateRange == null || requestDateRange == '') {
			if (requestDateRangePlaceholder == null) {
				requestDateRange = '';
			} else {
				requestDateRange = requestDateRangePlaceholder;
			}
		}
		
		console.log('order.do?soNo='+soNo+'&soUser='+soUser+'&pricingDateRange='+pricingDateRange+'&status='+status+'&buyerCD='+buyerCD+'&addDateRange='+addDateRange+'&requestDateRange='+requestDateRange+'&sortBy='+sortB+'&sortAs='+sortA);
		
		pageView('order.do?soNo='+soNo+'&soUser='+soUser+'&pricingDateRange='+pricingDateRange+'&status='+status+'&buyerCD='+buyerCD+'&addDateRange='+addDateRange+'&requestDateRange='+requestDateRange+'&sortBy='+sortB+'&sortAs='+sortA);
	}
	
	
	function searchSoNoReset() {
		document.querySelector('#searchSoNo').value='';
	}
	
	function searchBuyerCDReset() {
		document.querySelector('#searchBuyerCD').value='';
	}
	
	function searchSoUserReset() {
		document.querySelector('#searchSoUser').value='';
	}
	
	function searchPricingDateReset() {
		document.querySelector('#searchPricingDate').value='';
		$("input#searchPricingDate").attr("placeholder", '');
	}
	
	function searchAddDateReset() {
		document.querySelector('#searchAddDate').value='';
		$("input#searchAddDate").attr("placeholder", '');
	}
	
	function searchRequestDateReset() {
		document.querySelector('#searchRequestDate').value='';
		$("input#searchRequestDate").attr("placeholder", '');
	}
	
	function allReset() {
		var leader = '${leader}';
		
		document.querySelector('#searchSoNo').value='';
		document.querySelector('#searchBuyerCD').value='';
		if (leader == 'y') {
			document.querySelector('#searchSoUser').value='';
		}
		document.querySelector('#searchPricingDate').value='';
		document.querySelector('#searchAddDate').value='';
		document.querySelector('#searchRequestDate').value='';
		document.querySelector('#searchStatus').value='';
		$("input#searchPricingDate").attr("placeholder", '');
		$("input#searchAddDate").attr("placeholder", '');
		$("input#searchRequestDate").attr("placeholder", '');
	}
	
	function sortChange(sortB, sortA) {
		
		if (sortB == sortBy) {
			if (sortA == 'asc') {
				search(sortB, 'desc');
			} else if (sortA == 'desc') {
				search(sortB, 'asc');
			}
		} else if (sortB != sortBy) {
			search(sortB, 'desc');
		}
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
					<div class="row">
				<div class="search-sub-wrap">
					<div class="search-sub-div">
						<div class="search-item-div">
							<div class="search-item-text">• 오더번호</div>
							<div class="search-item-text2 insert-row-div">
								<c:if test="${soNo != null && soNo != '' }">
									<input type=text id="searchSoNo" class="search inputWidth search-text2" list="soNoAllList" autocomplete="off" value="${soNo}"><div onclick="searchSoNoReset()" class="searchSoNoReset reset click">✖</div>
								</c:if>
								<c:if test="${soNo == null || soNo == '' }">
									<input type=text id="searchSoNo" class="search inputWidth search-text2" list="soNoAllList" autocomplete="off"><div onclick="searchSoNoReset()" class="searchSoNoReset reset click">✖</div>
								</c:if>
							</div>
						</div>
						<div class="search-item-div">
							<div class="search-item-text">• 영업담당자</div>
							<div class="search-item-text3 insert-row-div">
								<c:if test="${leader == 'y'}">
									<input type=text id="searchSoUser" class="search inputWidth search-text3" list="employee_list" value="${order.soUser}" autocomplete="off"><div onclick="searchSoUserReset()" class="searchSoUserReset reset click">✖</div>
								</c:if>
								<c:if test="${leader == 'n'}">
									<input type=text id="searchSoUser" class="search inputWidth search-text3" readonly="readonly" value="${order.soUser }">
								</c:if>
							</div>
						</div>
						<div class="search-item-div">
							<div class="search-item-text">• 판매가기준일</div>
							<div class="search-item-text3 insert-row-div">
								<c:if test="${pricingDateRange != null && pricingDateRange != '' }">
									<input type=text id="searchPricingDate" class="search dateRange inputWidth search-text3" autocomplete="off"><div onclick="searchPricingDateReset()" class="searchPricingDateReset reset click">✖</div>
								</c:if>
								<c:if test="${pricingDateRange == null || pricingDateRange == '' }">
									<input type=text id="searchPricingDate" class="search dateRange inputWidth search-text3" autocomplete="off"><div onclick="searchPricingDateReset()" class="searchPricingDateReset reset click">✖</div>
								</c:if>
							</div>
						</div>
						<div class="search-item-div">
							<div class="search-item-text">• 상태</div>
							<c:if test="${status != null && status != '' }">
								<c:if test="${status == '임시저장' }">
									<select id="searchStatus" class="search" required="required">
										<option value=""></option>
										<option value="임시저장" selected="selected">임시저장</option>
										<option value="승인대기">승인대기</option>
										<option value="승인완료">승인완료</option>
										<option value="반려">반려</option>
										<option value="종결">종결</option>
									</select>
								</c:if>
								<c:if test="${status == '승인대기' }">
									<select id="searchStatus" class="search" required="required">
										<option value=""></option>
										<option value="임시저장">임시저장</option>
										<option value="승인대기" selected="selected">승인대기</option>
										<option value="승인완료">승인완료</option>
										<option value="반려">반려</option>
										<option value="종결">종결</option>
									</select>
								</c:if>
								<c:if test="${status == '승인완료' }">
									<select id="searchStatus" class="search" required="required">
										<option value=""></option>
										<option value="임시저장">임시저장</option>
										<option value="승인대기">승인대기</option>
										<option value="승인완료" selected="selected">승인완료</option>
										<option value="반려">반려</option>
										<option value="종결">종결</option>
									</select>
								</c:if>
								<c:if test="${status == '반려' }">
									<select id="searchStatus" class="search" required="required">
										<option value=""></option>
										<option value="임시저장" selected="selected">임시저장</option>
										<option value="승인대기">승인대기</option>
										<option value="승인완료">승인완료</option>
										<option value="반려" selected="selected">반려</option>
										<option value="종결">종결</option>
									</select>
								</c:if>
								<c:if test="${status == '종결' }">
									<select id="searchStatus" class="search" required="required">
										<option value=""></option>
										<option value="임시저장">임시저장</option>
										<option value="승인대기">승인대기</option>
										<option value="승인완료">승인완료</option>
										<option value="반려">반려</option>
										<option value="종결" selected="selected">종결</option>
									</select>
								</c:if>
							</c:if>
							<c:if test="${status == null || status == '' }">
								<select id="searchStatus" class="search" required="required">
									<option value=""></option>
									<option value="임시저장">임시저장</option>
									<option value="승인대기">승인대기</option>
									<option value="승인완료">승인완료</option>
									<option value="반려">반려</option>
									<option value="종결">종결</option>
								</select>
							</c:if>
						</div>
						<div class="reloadDiv">
							<img class="reloadImg click" alt="" src="/sharedone/resources/images/reload.png" onclick="allReset()">
						</div>
					</div>
						<div class="search-sub-div">
							<div class="search-item-div">
								<div class="search-item-text">• 거래처코드</div>
								<div class="search-item-text2 insert-row-div">
									<c:if test="${buyerCD != null && buyerCD != '' }">
										<input type=text id="searchBuyerCD" class="search inputWidth search-text2" list="buyerAllList" autocomplete="off" value="${buyerCD}"><div onclick="searchBuyerCDReset()" class="searchBuyerCDReset reset click">✖</div>
									</c:if>
									<c:if test="${buyerCD == null || buyerCD == '' }">
										<input type=text id="searchBuyerCD" class="search inputWidth search-text2" list="buyerAllList" autocomplete="off"><div onclick="searchBuyerCDReset()" class="searchBuyerCDReset reset click">✖</div>
									</c:if>
								</div>
							</div>
							<div class="search-item-div">
								<div class="search-item-text">• 오더등록일</div>
								<div class="search-item-text3 insert-row-div">
									<c:if test="${addDateRange != null && addDateRange != '' }">
										<input type=text id="searchAddDate" class="search dateRange inputWidth search-text3" value="${addDateRange }" autocomplete="off"><div onclick="searchAddDateReset()" class="searchAddDateReset reset click">✖</div>
									</c:if>
									<c:if test="${addDateRange == null || addDateRange == '' }">
										<input type=text id="searchAddDate" class="search dateRange inputWidth search-text3" autocomplete="off"><div onclick="searchAddDateReset()" class="searchAddDateReset reset click">✖</div>
									</c:if>
								</div>
							</div>
							<div class="search-item-div">
								<div class="search-item-text">• 납품요청일</div>
								<div class="search-item-text3 insert-row-div">
									<c:if test="${requestDateRange != null && requestDateRange != '' }">
										<input type=text id="searchRequestDate" class="search dateRange inputWidth search-text3" value="${requestDateRange}" autocomplete="off"><div onclick="searchRequestDateReset()" class="searchRequestDateReset reset click">✖</div>
									</c:if>
									<c:if test="${requestDateRange == null || requestDateRange == '' }">
										<input type=text id="searchRequestDate" class="search dateRange inputWidth search-text3" autocomplete="off"><div onclick="searchRequestDateReset()" class="searchRequestDateReset reset click">✖</div>
									</c:if>
								</div>
							</div>
							
						</div>
				</div>
						<div class="search-box2 search right-div" onclick="search('soNo', 'desc')" tabIndex="0">조회</div>
					</div>
			</div>
			
			<div class="orderList-div">
				<table class="list-table">
					<tr>
						<th class="col1">오더번호
							<c:choose>
								<c:when test="${sortBy eq 'soNo' && sortAs eq 'asc' }">
									<span class="sort-div" onclick="sortChange('soNo', 'asc')">▲</span>
								</c:when>
								<c:when test="${sortBy eq 'soNo' && sortAs eq 'desc' }">
									<span class="sort-div"
										onclick="sortChange('soNo', 'desc')">▼</span>
								</c:when>
								<c:otherwise>
									<span class="sort-div"
										onclick="sortChange('soNo', 'desc')">▽</span>
								</c:otherwise>
							</c:choose>
						</th>
						<th class="col2">거래처코드
							<c:choose>
								<c:when test="${sortBy eq 'o.buyerCD' && sortAs eq 'asc' }">
									<span class="sort-div" onclick="sortChange('o.buyerCD', 'asc')">▲</span>
								</c:when>
								<c:when test="${sortBy eq 'o.buyerCD' && sortAs eq 'desc' }">
									<span class="sort-div"
										onclick="sortChange('o.buyerCD', 'desc')">▼</span>
								</c:when>
								<c:otherwise>
									<span class="sort-div"
										onclick="sortChange('o.buyerCD', 'desc')">▽</span>
								</c:otherwise>
							</c:choose>
						</th>
						<th class="col2">거래처명
							<c:choose>
								<c:when test="${sortBy eq 'buyerNM' && sortAs eq 'asc' }">
									<span class="sort-div" onclick="sortChange('buyerNM', 'asc')">▲</span>
								</c:when>
								<c:when test="${sortBy eq 'buyerNM' && sortAs eq 'desc' }">
									<span class="sort-div"
										onclick="sortChange('buyerNM', 'desc')">▼</span>
								</c:when>
								<c:otherwise>
									<span class="sort-div"
										onclick="sortChange('buyerNM', 'desc')">▽</span>
								</c:otherwise>
							</c:choose>
						</th>
						<th class="col2">영업 담당자 코드
							<c:choose>
								<c:when test="${sortBy eq 'soUser' && sortAs eq 'asc' }">
									<span class="sort-div" onclick="sortChange('soUser', 'asc')">▲</span>
								</c:when>
								<c:when test="${sortBy eq 'soUser' && sortAs eq 'desc' }">
									<span class="sort-div"
										onclick="sortChange('soUser', 'desc')">▼</span>
								</c:when>
								<c:otherwise>
									<span class="sort-div"
										onclick="sortChange('soUser', 'desc')">▽</span>
								</c:otherwise>
							</c:choose>
						</th>
						<th class="col2">영업 담당자명
							<c:choose>
								<c:when test="${sortBy eq 'name' && sortAs eq 'asc' }">
									<span class="sort-div" onclick="sortChange('name', 'asc')">▲</span>
								</c:when>
								<c:when test="${sortBy eq 'name' && sortAs eq 'desc' }">
									<span class="sort-div"
										onclick="sortChange('name', 'desc')">▼</span>
								</c:when>
								<c:otherwise>
									<span class="sort-div"
										onclick="sortChange('name', 'desc')">▽</span>
								</c:otherwise>
							</c:choose>
						</th>
						<th class="col4">금액	</th>
						<th class="col4">오더등록일
							<c:choose>
								<c:when test="${sortBy eq 'o.addDate' && sortAs eq 'asc' }">
									<span class="sort-div" onclick="sortChange('o.addDate', 'asc')">▲</span>
								</c:when>
								<c:when test="${sortBy eq 'o.addDate' && sortAs eq 'desc' }">
									<span class="sort-div"
										onclick="sortChange('o.addDate', 'desc')">▼</span>
								</c:when>
								<c:otherwise>
									<span class="sort-div"
										onclick="sortChange('o.addDate', 'desc')">▽</span>
								</c:otherwise>
							</c:choose>
						</th>
						<th class="col5">판매가기준일
							<c:choose>
								<c:when test="${sortBy eq 'pricingDate' && sortAs eq 'asc' }">
									<span class="sort-div" onclick="sortChange('pricingDate', 'asc')">▲</span>
								</c:when>
								<c:when test="${sortBy eq 'pricingDate' && sortAs eq 'desc' }">
									<span class="sort-div"
										onclick="sortChange('pricingDate', 'desc')">▼</span>
								</c:when>
								<c:otherwise>
									<span class="sort-div"
										onclick="sortChange('pricingDate', 'desc')">▽</span>
								</c:otherwise>
							</c:choose>
						</th>
						<th class="col6">납품요청일
							<c:choose>
								<c:when test="${sortBy eq 'requestDate' && sortAs eq 'asc' }">
									<span class="sort-div" onclick="sortChange('requestDate', 'asc')">▲</span>
								</c:when>
								<c:when test="${sortBy eq 'requestDate' && sortAs eq 'desc' }">
									<span class="sort-div"
										onclick="sortChange('requestDate', 'desc')">▼</span>
								</c:when>
								<c:otherwise>
									<span class="sort-div"
										onclick="sortChange('requestDate', 'desc')">▽</span>
								</c:otherwise>
							</c:choose>
						</th>
						<th class="col7">통화
							<c:choose>
								<c:when test="${sortBy eq 'currency' && sortAs eq 'asc' }">
									<span class="sort-div" onclick="sortChange('currency', 'asc')">▲</span>
								</c:when>
								<c:when test="${sortBy eq 'currency' && sortAs eq 'desc' }">
									<span class="sort-div"
										onclick="sortChange('currency', 'desc')">▼</span>
								</c:when>
								<c:otherwise>
									<span class="sort-div"
										onclick="sortChange('currency', 'desc')">▽</span>
								</c:otherwise>
							</c:choose>
						</th>
						<th class="col8">상태
							<c:choose>
								<c:when test="${sortBy eq 'o.status' && sortAs eq 'asc' }">
									<span class="sort-div" onclick="sortChange('o.status', 'asc')">▲</span>
								</c:when>
								<c:when test="${sortBy eq 'o.status' && sortAs eq 'desc' }">
									<span class="sort-div"
										onclick="sortChange('o.status', 'desc')">▼</span>
								</c:when>
								<c:otherwise>
									<span class="sort-div"
										onclick="sortChange('o.status', 'desc')">▽</span>
								</c:otherwise>
							</c:choose>
						</th>
					</tr>
					<c:if test="${not empty orderList}">
						<c:forEach var="list" items="${orderList }">
							<tr class="orderListTr" onclick="detail('${list.soNo}')">
								<td class="col1 center">${list.soNo}</td>
								<td class="col2 center">${list.buyerCD}</td>
								<td class="col2 center">${list.buyerNM}</td>
								<td class="col3 center">${list.soUser}</td>
								<td class="col3 center">${list.name}</td>
								<fmt:formatNumber var="totalPrice" value="${list.totalPrice}" pattern="#,###"/>
								<td class="col4 right">${totalPrice}</td>
								<td class="col4 center">${list.addDate}</td>
								<td class="col5 center">${list.pricingDate}</td>
								<td class="col6 center">${list.requestDate}</td>
								<td class="col7 center">${list.currency}</td>
								<td class="col8 center">${list.status}</td>
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
						<input type="text" id="newSoUser" class="no-border newInput2" list="employee_list">
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
				
				<div class="new-row-div">
					<div class="new-sub-row-div">
						<div class="new-text">납품요청일<span class="red_warn">*</span></div>
						<input type="date" id="newRequestDate" class="no-border newInput2" value="">
					</div>
					<div class="new-sub-row-div">
						<div class="new-text">판매가기준일<span class="red_warn">*</span></div>
						<input type="date" id="newPricingDate" class="no-border newInput2" value="">
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
						<input type="text" id="newQty" class="newInput addNewProductCD" required="required"/>
					</div>
					<div class="new-sub-row-div">
						<div class="new-text">판매가</div>
						<input type="text" id="newUnitPrice" class="newInput" readonly="readonly"/>
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
				<div class="comment-return-div comment-margin" style="display: none;">
					<div>
						반려 코멘트
					</div>
					<div>
						<textarea id="comment-return-input" readonly="readonly"></textarea>
					</div>
				</div>
				
				<div class="comment-finish-div comment-margin" style="display: none;">
					<div>
						승인 코멘트
					</div>
					<div>
						<textarea id="comment-finish-input" readonly="readonly"></textarea>
					</div>
				</div>
				
				<div class="comment-div comment-margin">
					<div id="comment-title">
						코멘트
					</div>
					<div>
						<textarea id="comment-input"></textarea>
					</div>
				</div>
				
				
				<div class="detail-action-div">
					<div class="detail-action-btn-div">
						<button class="edit-start-btn2" onclick="editStart()" style="display: block;">수정하기</button>
						<button class="edit-start-btn2" onclick="terminate()" style="display: block;">종결</button>
						<button class="edit-finish-btn2" onclick="editFinish()" style="display: none;">수정 완료</button>
						<button id="request-approval-btn" class="detail-action-btn2" onclick="requestApproval()" style="display: block;">승인 요청</button>
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
			<datalist id="soNoAllList">
				<c:forEach var="order" items="${orderAllList }">
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