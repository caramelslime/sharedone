<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
</script>

</head>
<body>

<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("변경 완료")
		pageView('priceDetail.do?buyerCD=${buyer.buyerCD} + productCD=${product.productCD} + periodStart=${price.periodStart}');
	</script>
</c:if>
<c:if test="${!(result > 0) }">
	<script type="text/javascript">
		alert("변경 실패")
		pageView('priceDetail.do?buyerCD=${buyer.buyerCD} + productCD=${product.productCD} + periodStart=${price.periodStart}');
	</script>
</c:if>

</body>
</html>