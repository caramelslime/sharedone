<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
@import url("/sharedone/resources/css/share.css");
</style>
<style type="text/css">
@import url("/sharedone/resources/css/product.css");
</style>

<style type="text/css">
@import url("/sharedone/resources/css/sumoselect.min.css");
</style>
<script src="/sharedone/resources/js/jquery.sumoselect.min.js"></script>

<style type="text/css">
.SumoSelect>.CaptionCont {
	position: relative;
	border: 1px solid #a4a4a4;
	min-height: 14px;
	background-color: #d7d7d7;
	border-radius: 2px;
	margin: 0;
}
</style>

<script type="text/javascript">
	
	var sortAs = '${sortAs}';
	var sortBy = '${sortBy}';
	
	var doubleSubmitFlag = false;
	function doubleSubmitCheck(){
	    if(doubleSubmitFlag){
	        return doubleSubmitFlag;
	    }else{
	        doubleSubmitFlag = true;
	        return false;
	    }
	}
	
	
	/* 비동기 화면 출력 */
	function pageView(data) {
		console.log("pageView : "+data);
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
	
	/* 입력창 닫고 목록 표시 */
	function xBack(){
		search();
	}
	
	/* 입력창 보여주기 */
	function newProductInputView() {
		 $('.insert-div').show();
		 $('.productList-div').css('opacity', '0.3');
		 $('.search-div').css('opacity', '0.3');
		 document.querySelector('#insertProductNM').focus()	// 입력창 열었을 때 첫번째 input에 focus
	}
	
	/* 제품등록에서 새로운 제품을 제품목록에 추가하기 */
	function addInsert() {
		
		if (doubleSubmitCheck()) return;
		
		var productNM = document.querySelector('#insertProductNM').value;
		var unit = document.querySelector('#insertUnit').value;
		var productGroup = document.querySelector('#insertProductGroup').value;
		var defaultPrice = document.querySelector('#insertDefaultPrice').value;
		
		var rowNumber=document.querySelector('#insertList-table').rows.length;
		
		console.log(productNM, unit, productGroup);
		
		doubleSubmitFlag = true;
		
		if (productNM == "" || unit == "" || productGroup == "" || defaultPrice =="") {
			alert("값을 입력하세요");
			doubleSubmitFlag = false;
		} else {
			
			console.log("널이 아님");
			var count=0;
			
			console.log(productNM);
			
			$.post('productNMCheck.do', "productNM="+productNM, function(data) {
				console.log("data : "+data);
				count += parseInt(data);
				
				console.log("db검색 후 count : "+count);
				
				document.querySelectorAll('.productNMCheck').forEach(function(el) {
					console.log(el.innerHTML);
					if (el.innerHTML == document.querySelector('#insertProductNM').value) {
						console.log(el.innerHTML);
						count += 1;
					}
				})
				
				if (count>0) {
					alert("같은 이름이 존재합니다.");
					document.querySelector('#insertDefaultPrice').value="";
					document.querySelector('#insertProductNM').value="";
					document.querySelector('#insertProductNM').focus();
				} else if (count == 0) {
					$('#insertList-table').append(
							"<tr class='insertListTr'>"
								+ "<td class='productNMCheck'>"+productNM+"</td>"
								+ "<td>"+unit+"</td>"
								+ "<td>"+defaultPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"</td>"
								+ "<td>"+productGroup+"</td>"
								+ "<td>"
								+ "<img  class='minus-img' alt='이미지 없음' src='/sharedone/resources/images/minus.png' onclick='removeInsert(this)' />"
								+ "</td>"	
							+ "</tr>"
					);
					document.querySelector('#insertDefaultPrice').value="";
					document.querySelector('#insertProductNM').value="";
					document.querySelector('#insertProductNM').focus();
				}
				
				doubleSubmitFlag = false;
			});
		} 
	}
	
	/* 제품등록에서 제품목록에 추가된 제품 제거 */
	function removeInsert(e) {
		e.parentNode.parentNode.parentNode.removeChild(e.parentNode.parentNode);
		
	}
	
	$(function() {
		
		var cdnm2 = '${cdnm}';
		
		if (cdnm2 != null || cdnm2 != '') {
			document.querySelector('#searchCdnm').value = cdnm2;
		}
		
		$(".readonly").attr("disabled", "disabled");
		
		/* 제품 추가창에서 엔터 누르면 addInsert실행 */
		$('.insert').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				addInsert();
			}
		});
		
		
		/* 검색창에서 엔터 누르면 search 실행 */
		$('.search').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				search();
			}
		});
		
		/* 검색창에서 엔터 누르면 search 실행 */
		$('.search-text').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				search();
			}
		});
		
		/* esc를 눌렀을 때 product 페이지 내의 모달 창 닫고 목록으로 돌아가기 */
		$(document).keydown(function() { // esc키를 insert 화면에서 나오기
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 27) { // 27이 esc (assii값)
				xBack();
			}
		});
		
		/* 수정 중에 엔터치면 포커스아웃(blur) */
		$('.edit').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				this.blur();
			}
		});
		
		
	})
	
	/* 제품등록 목록에 추가된 제품을 DB에 입력*/
	function insertAction() {
		
		var table = document.querySelector('#insertList-table');
		var rows = document.getElementById("insertList-table").getElementsByTagName("tr");
		var insertArray = new Array(table.rows.length-1);
		console.log(rows);
		
		
		for (var i = 0; i < table.rows.length-1; i++) {
			var cells = rows[i+1].getElementsByTagName("td");
			
			var defaultPrice = cells[2].firstChild.data.replace(/,/g, "");
			
			insertArray[i] = { productNM: cells[0].firstChild.data, unit: cells[1].firstChild.data, defaultPrice: defaultPrice, productGroup: cells[3].firstChild.data};
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
		        	search();
		        }
			}
	   });
	}
	
	/* checkbox 전체 선택 */
	function selectAll(selectAll) {  
		const checkboxes1 = document.getElementsByName('selectChk');
		
		checkboxes1.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
		})
		
	}
	
	/* 체크박스 선택여부 확인 후 삭제 */
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
				
				if (confirm("진짜로 삭제하시겠습니까?")) {
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
					
					setTimeout(function() {
						pageView('product.do?sortBy='+sortBy+'&sortAs='+sortAs);
				    }, 200);
				}
			}
	}
	
	/* 제품 업데이트 */
	function productUpdate(productCD, type, value) {
		
		$(function() {
			$.ajax({
			    url: 'productUpdate.do?productCD='+productCD+'&type='+type+'&value='+value,
				type : "POST",
				async : true,
				traditional: true,
				dataType : "html",
				cache : false
			});
		});
		
	}
	
	var editable = 0;
	
	/* 제품 수정 활성화 */
	function editStart() {
		document.querySelector('.edit-start-btn').style.display = 'none';
		document.querySelector('.edit-finish-btn').style.display = 'block';
		$('.col3, .col4, .col5').css('background-color', '#d3dfea');
		editable = 1;
		readOnlyOff();
		console.log(editable);
	}
	
	/* 제품 수정 비활성화 */
	function editFinish() {
		
		var cdnm = document.querySelector('#searchCdnm').value;
		var productGroup = document.querySelector('#searchProductGroup').value;
		
		pageView('product.do?cdnm='+cdnm+'&productGroup='+productGroup+'&sortBy='+sortBy+'&sortAs='+sortAs);
	}
	
	var previousValue = "";
	
	$(function() {
			
			/* f */
			$('.edit').on("focusin", function(event) {
				if (editable == 1) {
					this.readOnly = false;
					console.log("focusin : "+this.value);
					previousValue = this.value;
				};
			});
			
			$('.edit').on("focusout", function(event) {
				
				console.log("previousValue : "+previousValue+", thisValue : "+this.value);
				
				if (editable == 1 && previousValue != this.value) {
					var updateInfo = this.getAttribute('id');
					var str = updateInfo.split('_');
					productUpdate(str[0], str[1], this.value);
					console.log("update done!!")
				} else if (editable == 1 && previousValue == this.value) {
					console.log("no update(same value)")
				}
			});
	})
	
	function search() {
		
		var cdnm = document.querySelector('#searchCdnm').value;
		var productGroup = document.querySelector('#searchProductGroup').value;
		
		pageView('product.do?cdnm='+cdnm+'&productGroup='+productGroup+'&sortBy='+sortBy+'&sortAs='+sortAs);
	}
	
	
	/* sumoselect */
	$('#searchCdnm').SumoSelect({
		search: true, searchText: '코드 / 제품명',
		noMatch : '"{0}"가 없습니다',
		placeholder: ' '
		});
	
	function searchCdnmReset() {
		document.querySelector('#searchCdnm').value='';
	}
	
	function readOnlyOff() {
		$(".readonly").attr("disabled", false);
	}
	
	function readOnlyOn() {
		$(".readonly").attr("disabled", true);
	}
	
	function sortChange(sortB, sortA) {
		
		var cdnm = document.querySelector('#searchCdnm').value;
		var productGroup = document.querySelector('#searchProductGroup').value;
		
		if (sortB == sortBy) {
			if (sortA == 'asc') {
				pageView('product.do?cdnm='+cdnm+'&productGroup='+productGroup+'&sortBy='+sortB+'&sortAs=desc');
			} else if (sortA == 'desc') {
				pageView('product.do?cdnm='+cdnm+'&productGroup='+productGroup+'&sortBy='+sortB+'&sortAs=asc');
			}
		} else if (sortB != sortBy) {
			pageView('product.do?cdnm='+cdnm+'&productGroup='+productGroup+'&sortBy='+sortB+'&sortAs=desc');
		}
	}
	
	
</script>

</head>
<body>

	<div class="main-container">
		<div class="content">
			<div class="top-div">
				<div class="top-title">제품관리</div>
				<ul class="top-ul">
					<li><img class="home-img"
						src="/sharedone/resources/images/home.png" /><span
						class="home-text">HOME</span></li>
					<li class="s-li">/</li>
					<li class="sub-text-li">제품목록</li>
				</ul>
			</div>
			<div class="search-div">
				<div class="search-sub-wrap">
					<div class="search-sub-div">
						<div class="insert-row-div2">
							<div class="search-item-text1">• 제품 코드 / 제품명</div>
							<div class="search-item-text2 insert-row-div">
								<c:if test="${cdnm != null && cdnm != '' }">
									<input type=text id="searchCdnm" class="search" name="productSelect"
										list="productAllList" autocomplete="off">
								</c:if>
								<c:if test="${cdnm == null || cdnm == '' }">
									<input type=text id="searchCdnm" class="search"
										name="productSelect" list="productAllList" autocomplete="off">
								</c:if>
								<div class="searchCdnm-reset-div">
									<div onclick="searchCdnmReset()" class="searchCdnm-reset">✖</div>
								</div>
							</div>
						</div>
					</div>
					<div class="search-item-div">
						<div class="search-item-text">• 제품 그룹</div>
						<c:if test="${productGroup != null && productGroup != '' }">
							<select id="searchProductGroup" class="search"
								required="required">
								<c:if test="${productGroup == '스낵류' }">
									<option value="">전체</option>
									<option value="스낵류" selected="selected">스낵류</option>
									<option value="초콜릿류">초콜릿류</option>
								</c:if>
								<c:if test="${productGroup == '초콜릿류' }">
									<option value="">전체</option>
									<option value="스낵류">스낵류</option>
									<option value="초콜릿류" selected="selected">초콜릿류</option>
								</c:if>
							</select>
						</c:if>
						<c:if test="${productGroup == null || productGroup == '' }">
							<select id="searchProductGroup" class="search"
								required="required">
								<option value="">전체</option>
								<option value="스낵류">스낵류</option>
								<option value="초콜릿류">초콜릿류</option>
							</select>
						</c:if>
					</div>
				</div>
				<div class="search-box search" onclick="search()" tabIndex="0">조회</div>
			</div>

			<div class="productList-div">
				<table class="list-table">
					<tr>
						<th class="headerCol1"><input type='checkbox' name='selectChk'
							value="selectAll" onclick='selectAll(this)' /></th>
						<th class="headerCol2">제품 코드
							<c:choose>
								<c:when test="${sortBy eq 'productCD' && sortAs eq 'asc' }">
									<span class="sort-div" onclick="sortChange('productCD', 'asc')">▲</span>
								</c:when>
								<c:when test="${sortBy eq 'productCD' && sortAs eq 'desc' }">
									<span class="sort-div"
										onclick="sortChange('productCD', 'desc')">▼</span>
								</c:when>
								<c:otherwise>
									<span class="sort-div"
										onclick="sortChange('productCD', 'desc')">▽</span>
								</c:otherwise>
							</c:choose>
						</th>
						<th class="headerCol3">제품명 <c:choose>
								<c:when test="${sortBy eq 'productNM' && sortAs eq 'asc' }">
									<span class="sort-div" onclick="sortChange('productNM', 'asc')">▲</span>
								</c:when>
								<c:when test="${sortBy eq 'productNM' && sortAs eq 'desc' }">
									<span class="sort-div"
										onclick="sortChange('productNM', 'desc')">▼</span>
								</c:when>
								<c:otherwise>
									<span class="sort-div"
										onclick="sortChange('productNM', 'desc')">▽</span>
								</c:otherwise>
							</c:choose>
						</th>
						<th class="headerCol4">단위</th>
						<th class="headerCol5">제품 그룹 <c:choose>
								<c:when test="${sortBy eq 'productGroup' && sortAs eq 'asc' }">
									<span class="sort-div"
										onclick="sortChange('productGroup', 'asc')">▲</span>
								</c:when>
								<c:when test="${sortBy eq 'productGroup' && sortAs eq 'desc' }">
									<span class="sort-div"
										onclick="sortChange('productGroup', 'desc')">▼</span>
								</c:when>
								<c:otherwise>
									<span class="sort-div"
										onclick="sortChange('productGroup', 'desc')">▽</span>
								</c:otherwise>
							</c:choose>
						</th>
					</tr>
					<c:if test="${not empty productList}">
						<c:forEach var="list" items="${productList }">
							<tr class="productListTr">
								<td class="col1" align="center"><input type="checkbox" name="selectChk"
									value="${list.productCD}"></td>
								<td class="col2" align="center"><input type="text" class="no-border text-center"
									value="${list.productCD}" readonly="readonly"></td>
								<td class="col3" align="center"><input type="text"
									id="${list.productCD}_productNM" class="edit text-center"
									<%-- onclick="edit('${list.productCD}'+'_productNM')" --%> value="${list.productNM}"
									readonly="readonly"></td>
								<td class="col4" align="center"><select id="${list.productCD}_unit"
									class="edit readonly text-center">
										<c:if test="${list.unit == 'box'}">
											<option value="box" selected="selected">box</option>
										</c:if>
										<c:if test="${list.unit != 'box'}">
											<option value="box">box</option>
										</c:if>
										<c:if test="${list.unit == 'ea'}">
											<option value="ea" selected="selected">ea</option>
										</c:if>
										<c:if test="${list.unit != 'ea'}">
											<option value="ea">ea</option>
										</c:if>
								</select></td>

								<td class="col5" align="center">
								<select id="${list.productCD}_productGroup" class="edit readonly text-center">
										<c:if test="${list.productGroup == '스낵류'}">
											<option value="스낵류" selected="selected">스낵류</option>
										</c:if>
										<c:if test="${list.productGroup != '스낵류'}">
											<option value="스낵류">스낵류</option>
										</c:if>
										<c:if test="${list.productGroup == '초콜릿류'}">
											<option value="초콜릿류" selected="selected">초콜릿류</option>
										</c:if>
										<c:if test="${list.productGroup != '초콜릿류'}">
											<option value="초콜릿류">초콜릿류</option>
										</c:if>
								</select></td>

							</tr>
						</c:forEach>
					</c:if>

				</table>
			</div>

			<div class="insert-div">
				<div class="x-div">
					<div onclick="xBack()" class="x-sub-div">✖</div>
				</div>

				<div class="insert-row-div">
					<div class="insert-sub-row-div">
						<div class="insert-text">
							제품명<span class="red_warn">*</span>
						</div>
						<input type="text" id="insertProductNM" class="insert"
							required="required" />
					</div>
					<div class="insert-sub-row-div">
						<div class="insert-text">
							단위<span class="red_warn">*</span>
						</div>
						<select id="insertUnit" class="insert" required="required">
							<option value="box">box</option>
							<option value="ea">ea</option>
						</select>
					</div>
					<div class="insert-sub-row-div">
						<div class="insert-text">
							기본 가격(KRW)<span class="red_warn">*</span>
						</div>
						<input type="text" id="insertDefaultPrice" class="insert" autocomplete="off" required="required" />
					</div>
					<div class="insert-sub-row-div">
						<div class="insert-text">
							제품 그룹<span class="red_warn">*</span>
						</div>
						<select id="insertProductGroup" class="insert" required="required">
							<option value="스낵류">스낵류</option>
							<option value="초콜릿류">초콜릿류</option>
						</select>
					</div>
					<div class="insert-sub-row-div">
						<img class="plus-img" alt="이미지 없음"
							src="/sharedone/resources/images/plus.png" onclick="addInsert()" />
					</div>
				</div>

				<hr class="insert-hr">

				<div class="insertList-div">
					<table id="insertList-table">
						<tr>
							<th class="col1">제품명</th>
							<th class="col2">단위</th>
							<th class="col2">기본 가격(KRW)</th>
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
					<button class="new-product-input-btn"
						onclick="newProductInputView()">제품등록</button>
					<button class="del-btn" onclick="check()">삭제</button>
					<button class="edit-start-btn" onclick="editStart()"
						style="display: block;">수정하기</button>
					<button class="edit-finish-btn" onclick="editFinish()"
						style="display: none;">수정 완료</button>
				</div>
			</div>
		</div>
		<div style="display: none;">

			<datalist id="CDList">
				<c:forEach var="product" items="${productList }">
					<option value="${product.productCD}">${product.productNM}</option>
				</c:forEach>
			</datalist>

			<div style="display: none;">
				<datalist id="productAllList">
					<c:forEach var="product" items="${productAllList }">
						<option value="${product.productCD}">${product.productNM}</option>
					</c:forEach>
				</datalist>
			</div>
		</div>
	</div>

</body>
</html>