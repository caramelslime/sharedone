<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	$(document).ready(function(){
		  $('.insert-div').hide();
		  $('.update-div').hide();

		  //사업자등록번호 중복검사
		  $('#brno-input').focusout(function() {
				$.post('brnoDupCheck.do', "brno="+insertFrm.brno.value,
				     function (data) {
						if(data=='y'){
							alert('이미 존재하는 거래처 입니다');
							insertFrm.brno.value="";
						}
			   });
		  });
		  
		  //거래처 리스트 select disabled
		  $('.readonly').attr("disabled",true);
		  
		  //sumoselect 0번째 요소 hide
		  $('.hidden').hide();
		   
	});
	
	//검색 조건 초기화
	function delSearchBuyerCd() {
		 $ ('.buyerList')[0].sumo.selectItem(0); 
	}
	function delSearchEmpCd() {
		 $ ('.employeeList')[0].sumo.selectItem(0); 
	}
	function delSearchStatus() {
		 $ ('.statusList')[0].sumo.selectItem(0); 
	}
	//전체 검색 조건 초기화
	function reloadBtn() {
		$ ('.buyerList')[0].sumo.selectItem(0);
		$ ('.employeeList')[0].sumo.selectItem(0);
		$ ('.statusList')[0].sumo.selectItem(0);
	}
	
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
	
	//하나씩 수정
 	function buyerUpdate(buyerCd){
		$.post('updateForm.do', "buyerCd="+buyerCd, function(data) {
			updateFrm.buyerCd.value = data.buyerCd;
			$('#buyerCd').attr("readonly", true);
			updateFrm.buyerNm.value = data.buyerNm;
			updateFrm.brno.value = data.brno;
			updateFrm.rprsvNm.value = data.rprsvNm;
			updateFrm.businessStatus.value = data.businessStatus;
			updateFrm.event.value = data.event;
			updateFrm.empCd.value = data.empCd+' '+data.empName;
			updateFrm.status.value = data.status;
			updateFrm.nationCd.value = data.nationCd;
			updateFrm.postcode.value = data.postcode;
			updateFrm.address.value = data.address;
			updateFrm.addressDetail.value = data.addressDetail;
			updateFrm.tel.value = data.tel;
			updateFrm.email.value = data.email;
			updateFrm.remark.value = data.remark;
			updateFrm.addDate.value = data.addDate;
			updateFrm.addUser.value = data.addUser+' '+data.addUserName;
			
			$('.buyerList-div').css('opacity', '0.3');
			$('.search-div').css('opacity', '0.3');
			 
			$('.update-div').show();
			
			
			
			});
		
	}
	
	function updateBuyer(){
		
		var e1 = updateFrm.empCd.value;
		var e2 = updateFrm.addUser.value;
		var empCd1 = e1.split(" ");
		var empCd2 = e2.split(" ");
		

		//var sendData = $('#updateFrm').serialize();
		//alert(sendData)

		$.post('updateConfirm.do'
				, "buyerCd="+updateFrm.buyerCd.value+"&buyerNm="+updateFrm.buyerNm.value
				+"&brno="+updateFrm.brno.value+"&rprsvNm="+updateFrm.rprsvNm.value
				+"&businessStatus="+updateFrm.businessStatus.value+"&event="+updateFrm.event.value
				+"&empCd="+empCd1[0]+"&status="+updateFrm.status.value+"&nationCd="
				+updateFrm.nationCd.value+"&postcode="+updateFrm.postcode.value+"&address="
				+updateFrm.address.value+"&addressDetail="+updateFrm.addressDetail.value+"&tel="
				+updateFrm.tel.value+"&email="+updateFrm.email.value+"&remark="+updateFrm.remark.value
				+"&addDate="+updateFrm.addDate.value+"&addUser="+empCd2[0]
				, function(data) {
			if(data == "y"){
 			alert("거래처 정보가 수정되었습니다");
 			$('.update-div').hide();
 			$('.buyerList-div').css('opacity', '1');
 			$('.search-div').css('opacity', '1');
		
 			setTimeout(function() {
 				pageView('buyerManagement.do');
 		    }, 200);
 			
			}else if(data == "n"){
				alert("거래처 수정에 실패했습니다");
			}
		});		
	}
	
	//+버튼 눌렀을 때
	function addInsert() {
		//var buyerCd = insertFrm.buyerCd.value;
		var buyerNm = insertFrm.buyerNm.value;
		var brno = insertFrm.brno.value;
		var rprsvNm = insertFrm.rprsvNm.value;
		var businessStatus = insertFrm.businessStatus.value;
		var event = insertFrm.event.value;
		var empCd = insertFrm.empCd.value;
		var status = insertFrm.status.value;
		var nationCd = insertFrm.nationCd.value;
		var postcode = insertFrm.postcode.value;
		var address = insertFrm.address.value;
		var addressDetail = insertFrm.addressDetail.value;
		var tel = insertFrm.tel.value;
		var email = insertFrm.email.value;
		var remark = insertFrm.remark.value;
		var addDate = insertFrm.addDate.value;
		var addUser = insertFrm.addUser.value;
		
		var rowNumber=document.querySelector('#insertList-table').rows.length;
		
		var empCdReg = RegExp(/^[E]{1}[0-9|ㄱ-ㅎ|가-힣\s]{2,12}$/);
		
		//입력 데이터 없을 때 안내메세지
		if (buyerNm == "" ) {
			alert("거래처 명을 입력하세요");
			insertFrm.buyerNm.focus();
		} else if(brno == ""){
			alert("사업자등록번호를 입력하세요");
			insertFrm.brno.focus();
		} else if(rprsvNm == ""){
			alert("대표자를 입력하세요");
			insertFrm.rprsvNm.focus();
		} else if(email == ""){
			alert("이메일을 입력하세요");
			insertFrm.email.focus();
		} else if(tel == ""){
			alert("전화번호를 입력하세요");
			insertFrm.tel.focus();
		} else if(!empCdReg.test(empCd)){
			alert("담당자를 선택하세요")
			insertFrm.empCd.value="";
			insertFrm.empCd.focus();
		} else if(empCd == ""){
			alert("담당자를 선택하세요");
			insertFrm.empCd.focus();
		} else if(!empCdReg.test(addUser)){
			alert("작성자를 선택하세요");
			insertFrm.addUser.value="";
			insertFrm.addUser.focus();
		} else if(addUser == ""){
			alert("작성자를 선택하세요");
			insertFrm.addUser.focus();
		} else if(postcode == ""){
			alert("우편번호를 입력하세요");
			insertFrm.postcode.focus();
		} else if(address == ""){
			alert("주소를 입력하세요");
			insertFrm.address.focus();
		} else if(addressDetail == ""){
			alert("상세주소를 입력하세요");
			insertFrm.addressDetail.focus();
		}
		
		else {
			$('#insertList-table').append(
					"<tr class='insertListTr'>"
						+ "<td>"
						+ "<img  class='minus-img' alt='이미지 없음' src='/sharedone/resources/images/minus.png' onclick='removeInsert(this)' />"
						+ "</td>"
						+ "<td>"+buyerNm+"</td>"
						+ "<td>"+brno+"</td>"
						+ "<td>"+rprsvNm+"</td>"
						+ "<td>"+businessStatus+"</td>"
						+ "<td>"+event+"</td>"
						+ "<td>"+empCd+"</td>"
						+ "<td>"+status+"</td>"
						+ "<td>"+nationCd+"</td>"
						+ "<td>"+postcode+"</td>"
						+ "<td>"+address+"</td>"
						+ "<td>"+addressDetail+"</td>"
						+ "<td>"+tel+"</td>"
						+ "<td>"+email+"</td>"
						+ "<td>"+remark+"</td>"
						+ "<td>"+addDate+"</td>"
						+ "<td>"+addUser+"</td>"	
					+ "</tr>"		
			);
			
			insertFrm.buyerNm.value="";
			insertFrm.brno.value="";
			insertFrm.rprsvNm.value="";
			insertFrm.businessStatus.value="도소매업";
			insertFrm.event.value="식료품";
			insertFrm.empCd.value="";
			insertFrm.nationCd.value="KR";
			insertFrm.postcode.value="";
			insertFrm.address.value="";
			insertFrm.addressDetail.value="";
			insertFrm.tel.value="";
			insertFrm.email.value="";
			insertFrm.remark.value=".";
			insertFrm.addDate.value = new Date().toISOString().substring(0, 10);
			insertFrm.addUser.value="";
		
		}
		
			
	}
	function removeInsert(e) {
		e.parentNode.parentNode.parentNode.removeChild(e.parentNode.parentNode);
		
	}

	function insertAction() {
		
		var table = document.querySelector('#insertList-table');
		var rows = document.getElementById("insertList-table").getElementsByTagName("tr");
		var insertArray = new Array(table.rows.length-1);
		
		var empCdNm = "";
		var addUserNm= "";
		
		for (var i = 0; i < table.rows.length-1; i++) {
			
			var cells = rows[i+1].getElementsByTagName("td");
			empCdNm = cells[6].firstChild.data;
			for (var i = 0; i < table.rows.length-1; i++) {
			var empCd2 = empCdNm.split(" ");
			console.log(empCd2[0]);
			}
			
			addUserNm = cells[16].firstChild.data;
			for (var i = 0; i < table.rows.length-1; i++) {
			var addUser2 = addUserNm.split(" ");
			console.log(addUser2[0]);
			}
		
		}
		
		for (var i = 0; i < table.rows.length-1; i++) {
			var cells = rows[i+1].getElementsByTagName("td");
			
			insertArray[i] = { 
					buyerNm: cells[1].firstChild.data, 
					brno: cells[2].firstChild.data, 
					rprsvNm: cells[3].firstChild.data, 
					businessStatus: cells[4].firstChild.data, 
					event: cells[5].firstChild.data, 
					empCd: empCd2[0], 
					status: cells[7].firstChild.data, 
					nationCd: cells[8].firstChild.data, 
					postcode: cells[9].firstChild.data, 
					address: cells[10].firstChild.data, 
					addressDetail: cells[11].firstChild.data, 
					tel: cells[12].firstChild.data, 
					email: cells[13].firstChild.data, 
					remark: cells[14].firstChild.data, 
					addDate: cells[15].firstChild.data, 
					addUser: addUser2[0]
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
		        	alert("새로운 거래처가 등록되었습니다");
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
	
	//삭제
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

	
	/* 바이어 업데이트 */
	function buyerUpdate2(buyerCd, type, value) {
		
		$(function() {
			$.ajax({
			    url: 'buyerListUpdate.do?buyerCd='+buyerCd+'&type='+type+'&value='+value,
				type : "POST",
				async : true,
				traditional: true,
				dataType : "html",
				cache : false
			});
		});
		
	}
	
	var editable = 0;
	
	/* 바이어 수정 활성화 */
	function editStart() {
		document.querySelector('.edit-start-btn').style.display = 'none';
		document.querySelector('.edit-finish-btn').style.display = 'block';
		$('.buyerList-div').css('background-color', '#d3dfea');
		editable = 1;
		$('.readonly').attr("disabled",false);
		console.log(editable);
	}
	
	/* 바이어 수정 비활성화 */
	function editFinish() {
		document.querySelector('.edit-start-btn').style.display = 'block';
		document.querySelector('.edit-finish-btn').style.display = 'none';
		$('.buyerList-div').css('background-color', '#fff');
		editable = 0;
		alert('거래처 정보가 수정되었습니다');
		setTimeout(function() {
				pageView('buyerManagement.do');
		    }, 200);
		console.log(editable);
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
					buyerUpdate2(str[0], str[1], this.value);
					console.log("update done!!")
				} else if (editable == 1 && previousValue == this.value) {
					console.log("no update(same value)")
				}
			});
	})

	
	//검색
	function search() {
		var buyerCd = document.querySelector('.buyerList').value;
		var empCd = document.querySelector('.employeeList').value;
		var status = document.querySelector('.statusList').value;
		pageView('buyerManagement.do?buyerCd='+buyerCd+'&empCd='+empCd+'&status='+status);
		
		
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
					<!-- sumoselect -->
					<select class="buyerList" name="buyerSelect">
						<option class="hidden" value=""></option>
						<option value="${buyerCd }" selected="selected">${buyerCd } ${buyerNm2 } </option>
						<c:forEach var="buyer" items="${buyerAllList }">
							<option value="${buyer.buyerCd }">${buyer.buyerCd } ${buyer.buyerNm }</option>
						</c:forEach>
					</select><div class="delBtn" onclick="delSearchBuyerCd()">&nbsp;✖</div>
				</div>
				<div class="search-item-div">
					<div class="search-item-text2">• 담당자</div>
 					<select id="empCdSelect" class="employeeList" name="employeeSelect">
						<option class="hidden" value=""></option>
						<option value="${empCd2 }" selected="selected">${empCd2 } ${empNm }</option>
						<c:forEach var="emp" items="${employee_list }">
							<option value="${emp.empCd }">${emp.empCd } ${emp.name }</option>
						</c:forEach>
					</select><div class="delBtn" onclick="delSearchEmpCd()">&nbsp;✖</div>
				</div>
				<div class="search-item-div">
					<div class="search-item-text">• 거래처상태</div>
					<select class="statusList" name="statusSelect">
						<option class="hidden" value=""></option>
						<option value="${status }" selected="selected">${status }</option>
						<c:if test="${status == '' || status==null}">
							<option value="활성">활성</option>
							<option value="비활성">비활성</option>
						</c:if>
						<c:if test="${status == '활성'}">
							<option value="비활성">비활성</option>
						</c:if>
						<c:if test="${status == '비활성'}">
							<option value="활성">활성</option>
						</c:if>
					</select><div class="delBtn" onclick="delSearchStatus()">&nbsp;✖</div>
				</div>
				
				<div class="reloadDiv" onclick="reloadBtn()" title="검색조건 초기화"><img class="reloadImg" alt="" src="/sharedone/resources/images/reload.png"> </div>
			</div>

			</div>
			<div class="search-box search" onclick="search()">조회</div>
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
					<th>이메일</th>
					<th>참고사항</th>
				</tr>
				
				<c:if test="${not empty buyer_list}">
					<c:forEach var="buyer_list" items="${buyer_list }"> 
						<tr ondblclick="buyerUpdate('${buyer_list.buyerCd}')" id="buyerListTr_${buyer_list.buyerCd }" class="buyerListTr">
							<td><input type="checkbox" name="selectChk" value="${buyer_list.buyerCd}" class="no-border" ></td>
							<td><input type="text" readonly="readonly" value="${buyer_list.buyerCd }"  class="list-input edit"></td>
							<td><input type="text" readonly="readonly" id="${buyer_list.buyerCd }_buyerNm" value="${buyer_list.buyerNm }" id="readonly" class="list-input4 edit readoonly"></td>
							<td><input type="text" readonly="readonly" id="${buyer_list.buyerCd }_brno" value="${buyer_list.brno }" class="list-input4 edit readoonly"></td>
							<td><input type="text" readonly="readonly" id="${buyer_list.buyerCd }_rprsvNm" value="${buyer_list.rprsvNm }" class="list-input edit readoonly"></td>
							<td>
								<select style="width:80px;" id="${buyer_list.buyerCd }_businessStatus" class="list-input edit readonly">
									<option value="${buyer_list.businessStatus}" selected="selected">${buyer_list.businessStatus}</option>
									<c:if test="${buyer_list.businessStatus == '도소매업'}">
										<option value="숙박업">숙박업</option>
										<option value="서비스업">서비스업</option>
										<option value="기타">기타</option>
									</c:if>
									<c:if test="${buyer_list.businessStatus == '숙박업'}">
										<option value="도소매업">도소매업</option>
										<option value="서비스업">서비스업</option>
										<option value="기타">기타</option>
									</c:if>
									<c:if test="${buyer_list.businessStatus == '서비스업'}">
										<option value="도소매업">도소매업</option>
										<option value="숙박업">숙박업</option>
										<option value="기타">기타</option>
									</c:if>
									<c:if test="${buyer_list.businessStatus == '기타'}">
										<option value="도소매업">도소매업</option>
										<option value="숙박업">숙박업</option>
										<option value="서비스업">서비스업</option>
									</c:if>
									
								</select>
							</td>
							<%-- <td><input type="text" id="${buyer_list.buyerCd }_businessStatus" value="${buyer_list.businessStatus}" class="list-input edit"></td> --%>
							<td>
								<select style="width:70px;" id="${buyer_list.buyerCd }_event" class="list-input edit readonly">
									<option value="${buyer_list.event }" selected="selected">${buyer_list.event }</option>
									<c:if test="${buyer_list.event == '식료품'}">
											<option value="한식">한식</option>
											<option value="잡화">잡화</option>
											<option value="사무">사무</option>
											<option value="기타">기타</option>
									</c:if>
									<c:if test="${buyer_list.event == '한식'}">
											<option value="식료품">식료품</option>
											<option value="잡화">잡화</option>
											<option value="사무">사무</option>
											<option value="기타">기타</option>
									</c:if>
									<c:if test="${buyer_list.event == '잡화'}">
											<option value="식료품">식료품</option>
											<option value="한식">한식</option>
											<option value="사무">사무</option>
											<option value="기타">기타</option>
									</c:if>
									<c:if test="${buyer_list.event == '사무'}">
											<option value="식료품">식료품</option>
											<option value="한식">한식</option>
											<option value="잡화">잡화</option>
											<option value="기타">기타</option>
									</c:if>
									<c:if test="${buyer_list.event == '기타'}">
											<option value="식료품">식료품</option>
											<option value="한식">한식</option>
											<option value="잡화">잡화</option>
											<option value="사무">사무</option>
									</c:if>
								</select>
							</td>
							<%-- <td><input type="text" id="${buyer_list.buyerCd }_event" value="${buyer_list.event }" class="list-input edit"></td> --%>
							<td><input type="text" readonly="readonly" id="${buyer_list.buyerCd }_name" value="${buyer_list.name }" class="list-input edit readoonly"></td>
							<td>
								<select style="width:60px;" id="${buyer_list.buyerCd }_status" class="list-input edit readonly">
									<option value="${buyer_list.status }" selected="selected">${buyer_list.status }</option>
									<c:if test="${buyer_list.status == '활성'}">
											<option value="비활성">비활성</option>
									</c:if>
									<c:if test="${buyer_list.status == '비활성'}">
											<option value="활성">활성</option>
									</c:if>

								</select>

							</td>
							<%-- <td><input type="text" id="${buyer_list.buyerCd }_status" value="${buyer_list.status }" class="list-input edit readoonly"></td> --%>
							<td>
								<select style="width:40px;" id="${buyer_list.buyerCd }_nationCd" class="list-input edit readonly">
									<option value="${buyer_list.nationCd }" selected="selected">${buyer_list.nationCd }</option>
									<c:if test="${buyer_list.nationCd == 'KR'}">
											<option value="US">US</option>
											<option value="DE">DE</option>
											<option value="JP">JP</option>
									</c:if>
									<c:if test="${buyer_list.nationCd == 'US'}">
											<option value="KR">KR</option>
											<option value="DE">DE</option>
											<option value="JP">JP</option>
									</c:if>
									<c:if test="${buyer_list.nationCd == 'DE'}">
											<option value="KR">KR</option>
											<option value="US">US</option>
											<option value="JP">JP</option>
									</c:if>
									<c:if test="${buyer_list.nationCd == 'JP'}">
											<option value="KR">KR</option>
											<option value="US">US</option>
											<option value="DE">DE</option>
									</c:if>
								</select>

							</td>
							<%-- <td><input type="text" id="${buyer_list.buyerCd }_nationCd" value="${buyer_list.nationCd }" class="list-input edit readoonly"></td> --%>
							<td >〒${buyer_list.postcode }&nbsp;${buyer_list.address }
							<input type="text" readonly="readonly" id="${buyer_list.buyerCd }_addressDetail"  value="${buyer_list.addressDetail }" class="list-input2 edit readoonly">
							 </td>
							<td><input type="text" readonly="readonly" id="${buyer_list.buyerCd }_tel"  value="${buyer_list.tel }" class="list-input2 edit readoonly"></td>
							<td><input type="text" readonly="readonly" id="${buyer_list.buyerCd }_email" value="${buyer_list.email }" class="list-input2 edit readoonly"></td>
							<td><input type="text" readonly="readonly" id="${buyer_list.buyerCd }_remark" value="${buyer_list.remark }" class="list-input3 edit readoonly"></td>
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
					<div><span class="insert-buyerCd">자동생성</span></div>
				</div> 
				<div class="insert-sub-row-div">
					<div class="insert-text">거래처상태<span class="red_warn">*</span></div>
					<select name="status" class="insert-select">
						<option value="활성">활성</option>
						<option value="비활성">비활성</option>
					</select>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">담당자<span class="red_warn">*</span></div>
					<input list="empSelect" name="empCd">
						<datalist id="empSelect">
							<c:forEach var="emp" items="${employee_list }">
								<option value="${emp.empCd } ${emp.name }"></option>
							</c:forEach>
						</datalist>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 거래처명, 국가코드, 작성자 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">거래처명<span class="red_warn">*</span></div>
					<input type="text" name="buyerNm" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">국가코드<span class="red_warn">*</span></div>
					<select name="nationCd" class="insert-select">
						<option value="KR">KR</option>
						<option value="US">US</option>
						<option value="DE">DE</option>
						<option value="JP">JP</option>
					</select>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">작성자<span class="red_warn">*</span></div>
					<input list="empSelect" name="addUser">
						<datalist id="empSelect">
							<c:forEach var="emp" items="${employee_list }">
								<option value="${emp.empCd } ${emp.name }"></option>
							</c:forEach>
						</datalist>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 사업자등록번호, 전화번호, 작성일시 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">사업자등록번호<span class="red_warn">*</span></div>
					<input id="brno-input" type="text" name="brno" placeholder="숫자만 입력해주세요" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="10"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">전화번호<span class="red_warn">*</span></div>
					<input id="tel-input" type="tel" name="tel" placeholder="숫자만 입력해주세요" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required="required" />
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">작성일시<span class="red_warn">*</span></div>
					<input type="date" id="currentDate" name="addDate"/>
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
					<input type="text" name="rprsvNm" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">이메일<span class="red_warn">*</span></div>
					<input id="email-input" type="email" name="email"/>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 업태, 종목 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">업태<span class="red_warn">*</span></div>
					<select name="businessStatus" class="insert-select">
						<option value="도소매업">도소매업</option>
						<option value="숙박업">숙박업</option>
						<option value="음식점업">음식점업</option>
						<option value="서비스업">서비스업</option>
						<option value="기타">기타</option>
					</select>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">종목<span class="red_warn">*</span></div>
					<select name="event" class="insert-select">
						<option value="식료품">식료품</option>
						<option value="한식">한식</option>
						<option value="잡화">잡화</option>
						<option value="사무">사무</option>
						<option value="기타">기타</option>
					</select>					
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
							<!-- <span id="guide" style="color:#52c9c6; display:none; font-family:summernote; font-size:10px;"></span> -->
							<input type="text" id="sample4_detailAddress" name="addressDetail" required="required" placeholder="상세주소">
							<input type="hidden" id="sample4_jibunAddress" name="" required="required" placeholder="상세주소">
							<!-- <input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->
							<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
						</div>
					</div>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 참고사항 -->
			<div>
				<div class="insert-sub-row-div2">
					<div class="insert-text">참고사항</div>
					<textarea class="remark-textarea" rows="4" cols="" name="remark">.</textarea>
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
					<input type="text" class="buyerCdText" id="buyerCd" name="buyerCd"/>
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
					<input list="empSelect" name="empCd">
						<datalist id="empSelect">
							<c:forEach var="emp" items="${employee_list }">
								<option value="${emp.empCd }"></option>
							</c:forEach>
						</datalist>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 거래처명, 국가코드, 작성자 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">거래처명<span class="red_warn">*</span></div>
					<input type="text" name="buyerNm" required="required"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">국가코드<span class="red_warn">*</span></div>
					<select name="nationCd" class="insert-select">
						<option value="KR">KR</option>
						<option value="US">US</option>
						<option value="DE">DE</option>
						<option value="JP">JP</option>
					</select>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">작성자<span class="red_warn">*</span></div>
					<input list="empSelect" name="addUser">
						<datalist id="empSelect">
							<c:forEach var="emp" items="${employee_list }">
								<option value="${emp.empCd }"></option>
							</c:forEach>
						</datalist>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 사업자등록번호, 전화번호, 작성일시 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">사업자등록번호<span class="red_warn">*</span></div>
					<input type="text" id="brno-input" name="brno" required="required" placeholder="숫자만 입력해주세요"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="10"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">전화번호<span class="red_warn">*</span></div>
					<input type="tel" name="tel" placeholder="숫자만 입력해주세요" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">작성일시<span class="red_warn">*</span></div>
					<input type="date" id="currentDate" name="addDate"/>
				</div>
			</div>
			
			<hr class="insert-hr">
			
			<!-- 대표자, 이메일 -->
			<div class="insert-row-div">
				<div class="insert-sub-row-div">
					<div class="insert-text">대표자<span class="red_warn">*</span></div>
					<input type="text" name="rprsvNm" required="required"/>
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
					<select name="businessStatus" class="insert-select">
						<option value="도소매업">도소매업</option>
						<option value="숙박업">숙박업</option>
						<option value="음식점업">음식점업</option>
						<option value="서비스업">서비스업</option>
						<option value="기타">기타</option>
					</select>
				</div>
				<div class="insert-sub-row-div">
					<div class="insert-text">종목<span class="red_warn">*</span></div>
					<select name="event" class="insert-select">
						<option value="식료품">식료품</option>
						<option value="한식">한식</option>
						<option value="잡화">잡화</option>
						<option value="사무">사무</option>
						<option value="기타">기타</option>
					</select>		
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
							<input type="text" id="sample4_detailAddress" name="addressDetail" required="required" placeholder="상세주소">
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
				<button class="edit-start-btn" onclick="editStart()" style="display: block;">수정하기</button>
				<button class="edit-finish-btn" onclick="editFinish()" style="display: none;">수정완료</button>
			</div>
		</div>
		
		
		
		
		</div>
	</div>


</body>
</html>