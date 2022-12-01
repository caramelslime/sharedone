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
<style type="text/css">@import url("/sharedone/resources/css/product.css");</style>

<script type="text/javascript">
	
	document.querySelector('#searchCdnm').focus();
	
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
		$('.productList-div').css('opacity', '1');
		$('.search-div').css('opacity', '1');
		$("#insertList-table tr:not(:first)").remove();	// 입력창 닫을 때 입력한 값 제거
		document.querySelector('#unit').value="";
		document.querySelector('#insertProductNM').value="";
	}
	
	function newInputView() {
		 $('.insert-div').show();
		 $('.productList-div').css('opacity', '0.3');
		 $('.search-div').css('opacity', '0.3');
		 document.querySelector('#insertProductNM').focus()	// 입력창 열었을 때 첫번째 input에 focus
	}
	
	function addInsert() {
		var productNM = document.querySelector('#insertProductNM').value;
		var unit = document.querySelector('#insertUnit').value;
		var productGroup = document.querySelector('#insertProductGroup').value;
		
		var rowNumber=document.querySelector('#insertList-table').rows.length;
		
		console.log(productNM, unit, productGroup);
		
		
		if (productNM == "" || unit == "" || productGroup == "") {
			alert("값을 입력하세요");
		} else {
			$('#insertList-table').append(
					"<tr class='insertListTr'>"
						+ "<td>"+productNM+"</td>"
						+ "<td>"+unit+"</td>"
						+ "<td>"+productGroup+"</td>"
						+ "<td>"
						+ "<img  class='minus-img' alt='이미지 없음' src='/sharedone/resources/images/minus.png' onclick='removeInsert(this)' />"
						+ "</td>"	
					+ "</tr>"
			);
			document.querySelector('#insertUnit').value="";
			document.querySelector('#insertProductNM').value="";
			document.querySelector('#insertProductNM').focus();
		}
		
		
	}
	
	function removeInsert(e) {
		e.parentNode.parentNode.parentNode.removeChild(e.parentNode.parentNode);
		
	}
	
	$(function() {
		$('.insert').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				addInsert();
			}
		});
		
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
	
	function insertAction() {
		var table = document.querySelector('#insertList-table');
		var rows = document.getElementById("insertList-table").getElementsByTagName("tr");
		var insertArray = new Array(table.rows.length-1);
		console.log(rows);
		
		
		for (var i = 0; i < table.rows.length-1; i++) {
			var cells = rows[i+1].getElementsByTagName("td");
			
			insertArray[i] = { productNM: cells[0].firstChild.data, unit: cells[1].firstChild.data, productGroup: cells[2].firstChild.data};
			console.log(insertArray[i]);
		};
		
		console.log(insertArray);
		
		$.ajax({
		     method: 'post',
		     url: 'productInsert.do',
		     traditional: true,
		     data: {
		       data: JSON.stringify(insertArray)
		     },
		     dataType: 'json',
		     success: function (res) {
		        if (res.result) {
					pageView('product.do');
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
			alert("제품을 선택해주세요");
			return false;
		} else {
			$(function() {
				$.ajax({
				    url: 'productDelete.do',
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
			pageView('product.do');
	    }, 200);
	}
	
	function productNMUpdate(e) {
		console.log(e);
		var str = e.split('_');
		
		console.log(str[0]);
		console.log(str[1]);
		
		var productCD = str[0];
		var productNM = str[1];
		
		
		
		console.log(document.querySelector('#'+e).value);
		
		
	}
	
	var editable = 0;
	
	function editStart() {
		document.querySelector('.edit-start-btn').style.display = 'none';
		document.querySelector('.edit-finish-btn').style.display = 'block';
		editable = 1;
		console.log(editable);
	}
	
	function editFinish() {
		document.querySelector('.edit-start-btn').style.display = 'block';
		document.querySelector('.edit-finish-btn').style.display = 'none';
		editable = 0;
		console.log(editable);
	}
	
	$(function() {
		
			$('.edit').on("focusin", function(event) {
				if (editable == 1) {
					this.readOnly = false;
					console.log("focusin");
//					console.log(this.value);
//					console.log(this.getAttribute('id'));
				};
			});
			
			$('.edit').on("focusout", function(event) {
				if (editable == 1) {
					
					var str = this.getAttribute('id').split('_');
					
					if (str[1] == 'productNM') {
						var productCD = str[0];
						var productNM = str[1];
						console.log("productNM = "+productNM);
						
						
						console.log("focusout");
						console.log(this.value);
						this.readOnly = true;
						
					} else if (str[1] == 'unit') {
						var productCD = str[0];
						var unit = str[1];
						
						
						console.log("focusout");
						console.log(this.value);
						this.readOnly = true;
						
					} else if (str[1] == 'productGroup') {
						var productCD = str[0];
						var productGroup = str[1];
						
						
						console.log("focusout");
						console.log(this.value);
						this.readOnly = true;
						
					}
				}
			});
	})
	
	function search() {
		
		var cdnm = document.querySelector('#searchCdnm').value;
		var productGroup = document.querySelector('#searchProductGroup').value;
		
		pageView('product.do?cdnm='+cdnm+'&productGroup='+productGroup);
	}
	
	
	
</script>

</head>
<body>
	
	<div class="main-container">
		<div class="content">
			<div class="top-div">
				<div class="top-title">제품관리</div>
				<ul class="top-ul">
					<li><img class="home-img" src="/sharedone/resources/images/home.png"/><span class="home-text">HOME</span></li>
					<li class="s-li">/</li>
					<li class="sub-text-li">제품목록</li>
				</ul>
			</div>
			<div class="search-div">
				<div class="search-sub-wrap">
					<div class="search-sub-div">
						<div class="search-item-div">
							<div class="search-item-text">• 제품 코드 / 제품명</div>
							<input type=text id="searchCdnm" class="search" list="CDList">
						</div>
					</div>
					<div class="search-item-div">
						<div class="search-item-text">• 제품 그룹</div>
						<select id="searchProductGroup" class="search" required="required">
							<option value=""></option>
							<option value="스낵류">스낵류</option>
							<option value="초콜릿류">초콜릿류</option>
						</select>
					</div>	
				</div>
				<div class="search-box search" onclick="search()" tabIndex="0">조회</div>
			</div>
			
			<div class="productList-div">
				<table class="list-table">
					<tr>
						<th class="col1">
							<input type='checkbox' name='selectChk' value="selectAll" onclick='selectAll(this)' />
						</th>
						<th class="col2">제품 코드</th>
						<th class="col3">제품명</th>
						<th class="col4">단위</th>
						<th class="col5">제품 그룹</th>
					</tr>
					<c:if test="${not empty productList}">
						<c:forEach var="list" items="${productList }">
							<tr class="productListTr">
								<td class="col1">
									<input type="checkbox" name="selectChk" value="${list.productCD}" >
								</td>
								<td class="col2"><input type="text" class="no-border" value="${list.productCD}" readonly="readonly"></td>
								<td class="col3"><input type="text" id="${list.productCD}_productNM" class="edit" <%-- onclick="edit('${list.productCD}'+'_productNM')" --%> value="${list.productNM}" readonly="readonly"></td>
								<td class="col4"><input type="text" id="${list.productCD}_unit" class="edit" value="${list.unit}" readonly="readonly"></td>
								<td class="col5"><input type="text" class="edit" value="${list.productGroup }" readonly="readonly"></td>
							</tr>
						</c:forEach>
					</c:if>
					
				</table>
			</div>
			
			<div class="insert-div">
				<div class="x-div"><div onclick="xBack()" class="x-sub-div">✖</div></div>
				
				<div class="insert-row-div">
					<div class="insert-sub-row-div">
						<div class="insert-text">제품명<span class="red_warn">*</span></div>
						<input type="text" id="insertProductNM" class="insert" required="required"/>
					</div>
					<div class="insert-sub-row-div">
						<div class="insert-text">단위<span class="red_warn">*</span></div>
						<input type="text" id="insertUnit" class="insert" required="required"/>
					</div>
					<div class="insert-sub-row-div">
						<div class="insert-text">제품 그룹<span class="red_warn">*</span></div>
						<select id="insertProductGroup" class="insert" required="required">
							<option value="스낵류">스낵류</option>
							<option value="초콜릿류">초콜릿류</option>
						</select>
					</div>
					<div class="insert-sub-row-div">
						<img class="plus-img" alt="이미지 없음" src="/sharedone/resources/images/plus.png" onclick="addInsert()" />
					</div>
				</div>
				
				<hr class="insert-hr">
				
				<div class="insertList-div">
					<table id="insertList-table">
						<tr>
							<th class="col1">제품명</th>
							<th class="col2">단위</th>
							<th class="col3">제품 그룹</th>
							<th class="col4"></th>
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
					<c:set var="editable" value="a"></c:set>
					<button class="new-input-btn" onclick="newInputView()">제품등록</button>
					<button class="del-btn" onclick="check()">삭제</button>
					<button class="edit-start-btn" onclick="editStart()" style="display: block;">수정하기</button>
					<button class="edit-finish-btn" onclick="editFinish()" style="display: none;">수정 완료</button>
				</div>
			</div>
		</div>
		<div style="display: none;">
			
			<datalist id="CDList">
				<c:forEach var="product" items="${productList }">
					<option value="${product.productCD}">${product.productNM}</option>
				</c:forEach>
			</datalist>
		</div>
	</div>
	
</body>
</html>