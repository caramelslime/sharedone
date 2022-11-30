<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 주소검색 api -->
<script type="text/javascript" src="/sharedone/resources/js/address.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">@import url("/sharedone/resources/css/share.css");</style>
<style type="text/css">@import url("/sharedone/resources/css/buyerManagement.css");</style>
<style type="text/css">

.insert-div{
	background: #fff;
    width: 860px;
    height: 720px;
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
.insert-buyercd{
	font-size: 12px;
    font-style: italic;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		  $('.insert-div').hide();
		  $('.update-div').hide();
	})
	function xBack(){
		 $('.insert-div').hide();
		 $('.update-div').hide();
		 $('.buyerList-div').css('opacity', '1');
		 $('.search-div').css('opacity', '1');
	}
	
	function newInputView() {
		 $('.insert-div').show();
		 $('.buyerList-div').css('opacity', '0.3');
		 $('.search-div').css('opacity', '0.3');
	}
	
	function insertBuyer(){
		var sendData = $('#insertFrm').serialize();
		$.post('newInsertConfirm.do'
				, sendData
				, function(data) {
			if(data == "y"){
 			alert("새로운 거래처가 등록되었습니다");
 			$('.insert-div').hide();
 			$('.buyerList-div').css('opacity', '1');
 			$('.search-div').css('opacity', '1');
			}else if(data == "n"){
				alert("거래처 등록에 실패했습니다");
			}
	});		
		
	}
	//수정
	
 	function buyerUpdate(buyercd){
		$.post('updateForm.do', "buyercd="+buyercd, function(data) {
			updateFrm.buyercd.value = data.buyercd;
			$('#buyercd').attr("readonly", true);
			updateFrm.buyernm.value = data.buyernm;
			updateFrm.brno.value = data.brno;
			updateFrm.rprsv_nm.value = data.rprsv_nm;
			updateFrm.business_status.value = data.business_status;
			updateFrm.event.value = data.event;
			updateFrm.receiveuserid.value = data.receiveuserid;
			updateFrm.status.value = data.status;
			updateFrm.nationcd.value = data.nationcd;
			updateFrm.postcode.value = data.postcode;
			updateFrm.address.value = data.address;
			updateFrm.address_detail.value = data.address_detail;
			updateFrm.tel.value = data.tel;
			updateFrm.email.value = data.email;
			updateFrm.remark.value = data.remark;
			updateFrm.adddate.value = data.adddate;
			updateFrm.adduser.value = data.adduser;
			
			$('.buyerList-div').css('opacity', '0.3');
			$('.search-div').css('opacity', '0.3');
			 
			$('.update-div').show();
			
			});
		
	}
	
	function updateBuyer(){
		var sendData = $('#updateFrm').serialize();
		alert(sendData);
		$.post('updateConfirm.do'
				, sendData
				, function(data) {
			if(data == "y"){
 			alert("거래처 정보가 수정되었습니다");
 			$('.update-div').hide();
 			$('.buyerList-div').css('opacity', '1');
 			$('.search-div').css('opacity', '1');
			}else if(data == "n"){
				alert("거래처 수정에 실패했습니다");
			}
		});		
	}
	
	//+버튼 눌렀을 때
	function addInsert() {
		//var buyerCD = insertFrm.buyercd.value;
		var buyerNM = insertFrm.buyernm.value;
		var brno = insertFrm.brno.value;
		var rprsv_nm = insertFrm.rprsv_nm.value;
		var business_status = insertFrm.business_status.value;
		var event = insertFrm.event.value;
		var receiveuserid = insertFrm.receiveuserid.value;
		var status = insertFrm.status.value;
		var nationcd = insertFrm.nationcd.value;
		var postcode = insertFrm.postcode.value;
		var address = insertFrm.address.value;
		var address_detail = insertFrm.address_detail.value;
		var tel = insertFrm.tel.value;
		var email = insertFrm.email.value;
		var remark = insertFrm.remark.value;
		var adddate = insertFrm.adddate.value;
		var adduser = insertFrm.adduser.value;
		
		var rowNumber=document.querySelector('#insertList-table').rows.length;
		
		
		
		if (buyerNM == "" || brno == "" || rprsv_nm == "" || business_status == "" || event == "" || receiveuserid == "" || status == "" || nationcd == "" || postcode == "" || address == "" || address_detail == "" || tel == "" || email == "" || adddate == "" || adduser == "" ) {
			alert("값을 입력하세요");
		} else {
			$('#insertList-table').append(
					"<tr class='insertListTr'>"
						+ "<td>"
						+ "<img  class='minus-img' alt='이미지 없음' src='/sharedone/resources/images/minus.png' onclick='removeInsert(this)' />"
						+ "</td>"
						+ "<td>"+buyerNM+"</td>"
						+ "<td>"+brno+"</td>"
						+ "<td>"+rprsv_nm+"</td>"
						+ "<td>"+business_status+"</td>"
						+ "<td>"+event+"</td>"
						+ "<td>"+receiveuserid+"</td>"
						+ "<td>"+status+"</td>"
						+ "<td>"+nationcd+"</td>"
						+ "<td>"+postcode+"</td>"
						+ "<td>"+address+"</td>"
						+ "<td>"+address_detail+"</td>"
						+ "<td>"+tel+"</td>"
						+ "<td>"+email+"</td>"
						+ "<td>"+remark+"</td>"
						+ "<td>"+adddate+"</td>"
						+ "<td>"+adduser+"</td>"	
					+ "</tr>"		
			);
			
			insertFrm.buyernm.value="";
			insertFrm.brno.value="";
			insertFrm.rprsv_nm.value="";
			insertFrm.business_status.value="";
			insertFrm.event.value="";
			insertFrm.receiveuserid.value="";
			insertFrm.nationcd.value="";
			insertFrm.postcode.value="";
			insertFrm.address.value="";
			insertFrm.address_detail.value="";
			insertFrm.tel.value="";
			insertFrm.email.value="";
			insertFrm.remark.value="";
			insertFrm.adddate.value = new Date().toISOString().substring(0, 10);
			insertFrm.adduser.value="";
		
		}
		
			
	}
	function removeInsert(e) {
		e.parentNode.parentNode.parentNode.removeChild(e.parentNode.parentNode);
		
	}

	function insertAction() {
		var table = document.querySelector('#insertList-table');
		var rows = document.getElementById("insertList-table").getElementsByTagName("tr");
		var insertArray = new Array(table.rows.length-1);
		console.log(table);
		console.log(insertArray);
		console.log(rows);
		
		
		for (var i = 0; i < table.rows.length-1; i++) {
			var cells = rows[i+1].getElementsByTagName("td");
			insertArray[i] = { 
					buyerNM: cells[1].firstChild.data, 
					brno: cells[2].firstChild.data, 
					rprsv_nm: cells[3].firstChild.data, 
					business_status: cells[4].firstChild.data, 
					event: cells[5].firstChild.data, 
					receiveuserid: cells[6].firstChild.data, 
					status: cells[7].firstChild.data, 
					nationcd: cells[8].firstChild.data, 
					postcode: cells[9].firstChild.data, 
					address: cells[10].firstChild.data, 
					address_detail: cells[11].firstChild.data, 
					tel: cells[12].firstChild.data, 
					email: cells[13].firstChild.data, 
					remark: cells[14].firstChild.data, 
					adddate: cells[15].firstChild.data, 
					adduser: cells[16].firstChild.data
					};
			console.log(insertArray[i]);
		};
		
		console.log(insertArray);
		
		$.ajax({
		     method: 'post',
		     url: 'buyerInsert.do',
		     traditional: true,
		     data: {
		       data: JSON.stringify(insertArray)
		     },
		     dataType: 'json',
		     success: function (res) {
		        if (res.result) {
					pageView('buyerManagement.do');
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
			alert("거래처를 선택해주세요");
			return false;
		} else {
			$(function() {
				$.ajax({
				    url: 'buyerDelete.do',
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
			pageView('buyerManagement.do');
	    }, 200);
	}

</script>
</head>
<body>

	<div class="main-container">
		<div class="content">
		<div class="top-div">
			<div class="top-title">바이어관리</div>
			<ul class="top-ul">
				<li><img class="home-img" src="/sharedone/resources/images/home.png"/><span class="home-text">HOME</span></li>
				<li class="s-li">/</li>
				<li class="sub-text-li">바이어관리</li>
			</ul>
		</div>
		<div class="search-div">
			<div class="search-sub-wrap">
			<div class="search-sub-div">
				<div class="search-item-div">
					<div class="search-item-text">• 거래처코드/거래처명</div>
					<input type="text" list="buyerList" id="input" >
					<!-- 검색용 거래처 데이터 리스트 -->
					<datalist id="buyerList">
						<c:forEach var="buyer" items="${buyer_list }">
							<option value="${buyer.buyercd }" label="${buyer.buyernm }"></option>
						</c:forEach>
					</datalist>
				</div>
				<div class="search-item-div">
					<div class="search-item-text">• 거래처상태</div>
					<select name="status">
						<option value="활성">활성</option>
						<option value="활성">비활성</option>
					</select>
				</div>
			</div>
			<div class="search-item-div">
				<div class="search-item-text">• 담당자</div>
				<input type="text" list="employeeList">
				<!-- 검색용 거래처 데이터 리스트 -->
				<datalist id="employeeList">
					<c:forEach var="emp" items="${employee_list }">
						<option value="${emp.empCd }" label="${emp.name }"></option>
					</c:forEach>
				</datalist>
			</div>	
			</div>
			<div class="search-box">조회</div>
		</div>

		<!-- 검색용 직원 데이터 리스트 -->
		<datalist id="employeeList">
		
		</datalist>
		
		<div class="buyerList-div">
			<table class="list-table">
				<tr>
					<th>
						<input type='checkbox' name='selectChk' value="selectAll" onclick='selectAll(this)' />
					</th>
					<th>거래처코드</th>
					<th>거래처명</th>
					<th>사업자등록번호</th>
					<th>대표자</th>
					<th>업태</th>
					<th>종목</th>
					<th>담당자</th>
					<th>거래처상태</th>
					<th>국가코드</th>
					<th>소재지</th>
					<th>전화번호</th>
					<th>이메일</th
					><th>참고사항</th>
				</tr>
				
				<c:if test="${not empty buyer_list}">
					<c:forEach var="buyer_list" items="${buyer_list }"> 
						<tr ondblclick="buyerUpdate('${buyer_list.buyercd}')" id="buyerListTr_${buyer_list.buyercd }" class="buyerListTr">
							<td><input type="checkbox" name="selectChk" value="${buyer_list.buyercd}" ></td>
							<td>${buyer_list.buyercd }</td>
							<td>${buyer_list.buyernm }</td>
							<td>${buyer_list.brno }</td>
							<td>${buyer_list.rprsv_nm }</td>
							<td>${buyer_list.business_status}</td>
							<td>${buyer_list.event }</td>
							<td>${buyer_list.receiveuserid }</td>
							<td>${buyer_list.status }</td>
							<td>${buyer_list.nationcd }</td>
							<td>〒${buyer_list.postcode }&nbsp;${buyer_list.address } ${buyer_list.address_detail }</td>
							<td>${buyer_list.tel }</td>
							<td>${buyer_list.email }</td>
							<td>${buyer_list.remark }</td>
						</tr>
					</c:forEach>
				</c:if>
				
			</table>
		</div>

		
	
		<div class="insert-div">
			<form name="insertFrm" id="insertFrm">
			<div class="x-div"><div onclick="xBack()" class="x-sub-div">✖</div></div>
			<!-- 거래처 코드, 거래처 상태, 담당자 -->
			<div class="insert-row-div">
 				<div class="insert-sub-row-div">
					<div class="insert-text">거래처코드<span class="red_warn">*</span></div>
					<div><span class="insert-buyercd">자동생성</span></div>
				</div> 
				<div class="insert-sub-row-div">
					<div class="insert-text">거래처상태<span class="red_warn">*</span></div>
					<select name="status">
						<option value="활성">활성</option>
						<option value="비활성">비활성</option>
					</select>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">담당자<span class="red_warn">*</span></div>
					<input type="text" name="receiveuserid" required="required"/>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 거래처명, 국가코드, 작성자 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">거래처명<span class="red_warn">*</span></div>
					<input type="text" name="buyernm" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">국가코드<span class="red_warn">*</span></div>
					<input type="text" name="nationcd" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">작성자<span class="red_warn">*</span></div>
					<input type="text" name="adduser" required="required"/>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 사업자등록번호, 전화번호, 작성일시 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">사업자등록번호<span class="red_warn">*</span></div>
					<input type="text" name="brno" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">전화번호<span class="red_warn">*</span></div>
					<input type="tel" name="tel" placeholder="숫자만 입력해주세요" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">작성일시<span class="red_warn">*</span></div>
					<input type="date" id="currentDate" name="adddate"/>
				</div>
				<script>
				  document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
				</script>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 대표자, 이메일 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">대표자<span class="red_warn">*</span></div>
					<input type="text" name="rprsv_nm" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">이메일</div>
					<input type="email" name="email"/>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 업태, 종목 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">업태<span class="red_warn">*</span></div>
					<input type="text" name="business_status" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">종목<span class="red_warn">*</span></div>
					<input type="text" name="event" required="required"/>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 사업상소재지 -->
			<div>
				<div class="insert-sub-row-div2">
					<div class="insert-text">사업장소재지<span class="red_warn">*</span></div>
					<div class="add-div">
					    <div id="address_btn_wrap">
					    	<input type="text" name="postcode" id="sample4_postcode" placeholder="우편번호">
							<input id="addr-search-btn" type="button" onclick="sample4_execDaumPostcode()" value="주소찾기">
						</div>
						<div class="address-wrap">
							<input type="text" id="sample4_roadAddress" name="address" placeholder="도로명주소">
							<!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
							<span id="guide" style="color:#52c9c6; display:none; font-family:summernote; font-size:10px;"></span>
							<input type="text" id="sample4_detailAddress" name="address_detail" required="required" placeholder="상세주소">
							<!-- <input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->
						</div>
					</div>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 참고사항 -->
			<div>
				<div class="insert-sub-row-div2">
					<div class="insert-text">참고사항</div>
					<textarea class="remark-textarea" rows="4" cols="" name="remark"></textarea>
				</div>
			</div>			
			
			<div class="warn-div red_warn">*는 필수 입력 사항</div>
			<!-- <div class="insert-submit-div">
				<input type="button" onclick="insertBuyer()" id="insertSubmit" value="확정">
			</div> -->
			<div class="insert-sub-row-div2">
				<img class="plus-img" alt="이미지 없음" src="/sharedone/resources/images/plus.png" onclick="addInsert()" />
			</div>
			</form>
			
			
			<div class="insertList-div">
				<table id="insertList-table">
					<tr>
						<th class="col0"></th>
						<!-- <th class="col1">거래처코드</th> -->
						<th class="col2">거래처명</th>
						<th class="col3">사업자등록번호</th>
						<th class="col4">대표자</th>
						<th class="col5">업태</th>
						<th class="col6">종목</th>
						<th class="col7">담당자</th>
						<th class="col8">거래처상태</th>
						<th class="col9">국가코드</th>
						<th class="col10">우편번호</th>
						<th class="col11">도로명주소</th>
						<th class="col12">상세주소</th>
						<th class="col13">전화번호</th>
						<th class="col14">이메일</th>
						<th class="col15">참고사항</th>
						<th class="col16">작성일시</th>
						<th class="col17">작성자</th>
					</tr>
				</table>
			</div>
			
			<div class="insert-action-div">
				<div class="insert-action-btn-div">
					<button class="insert-action-btn" onclick="insertAction()">등록</button>
				</div>
			</div>
			
		</div>



		<!-- 수정수정 -->
		<div class="update-div">
			<form name="updateFrm" id="updateFrm">
			<div class="x-div"><div onclick="xBack()" class="x-sub-div">✖</div></div>
			<!-- 거래처 코드, 거래처 상태, 담당자 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">거래처코드<span class="red_warn">*</span></div>
					<input type="text" class="buyercdText" id="buyercd" name="buyercd"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">거래처상태<span class="red_warn">*</span></div>
					<select name="status">
						<option value="활성">활성</option>
						<option value="비활성">비활성</option>
					</select>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">담당자<span class="red_warn">*</span></div>
					<input type="text" name="receiveuserid" required="required"/>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 거래처명, 국가코드, 작성자 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">거래처명<span class="red_warn">*</span></div>
					<input type="text" name="buyernm" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">국가코드<span class="red_warn">*</span></div>
					<input type="text" name="nationcd" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">작성자<span class="red_warn">*</span></div>
					<input type="text" name="adduser" required="required"/>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 사업자등록번호, 전화번호, 작성일시 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">사업자등록번호<span class="red_warn">*</span></div>
					<input type="text" name="brno" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">전화번호<span class="red_warn">*</span></div>
					<input type="tel" name="tel" placeholder="숫자만 입력해주세요" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">작성일시<span class="red_warn">*</span></div>
					<input type="date" id="currentDate" name="adddate"/>
				</div>
				<script>
				  document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
				</script>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 대표자, 이메일 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">대표자<span class="red_warn">*</span></div>
					<input type="text" name="rprsv_nm" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">이메일</div>
					<input type="email" name="email"/>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 업태, 종목 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">업태<span class="red_warn">*</span></div>
					<input type="text" name="business_status" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">종목<span class="red_warn">*</span></div>
					<input type="text" name="event" required="required"/>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 사업상소재지 -->
			<div>
				<div class="insert-sub-row-div2">
					<div class="insert-text">사업장소재지<span class="red_warn">*</span></div>
					<div class="add-div">
					    <div id="address_btn_wrap">
					    	<input type="text" name="postcode" id="sample4_postcode" placeholder="우편번호">
							<input id="addr-search-btn" type="button" onclick="sample4_execDaumPostcode()" value="주소찾기">
						</div>
						<div class="address-wrap">
							<input type="text" id="sample4_roadAddress" name="address" placeholder="도로명주소">
							<!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
							<span id="guide" style="color:#52c9c6; display:none; font-family:summernote; font-size:10px;"></span>
							<input type="text" id="sample4_detailAddress" name="address_detail" required="required" placeholder="상세주소">
							<!-- <input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->
						</div>
					</div>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 참고사항 -->
			<div>
				<div class="insert-sub-row-div2">
					<div class="insert-text">참고사항</div>
					<textarea class="remark-textarea" rows="4" cols="" name="remark"></textarea>
				</div>
			</div>			
			
			<div class="warn-div red_warn">*는 필수 입력 사항</div>
			<div class="insert-submit-div">
				<input type="button" onclick="updateBuyer()" id="insertSubmit" value="수정">
			</div>
			</form>
		</div>


		

		
		<div class="bottom-div">
			<div class="bottom-btn-div">
				<button class="new-input-btn" onclick="newInputView()">신규등록</button>
				<button class="del-btn" onclick="check()">삭제</button>
			</div>
		</div>
		
		
		
		
		</div>
	</div>


</body>
</html>