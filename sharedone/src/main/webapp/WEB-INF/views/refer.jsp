<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("반려 되었습니다");
		location.href="pendingApprovalList.do?pageNum=${pageNum}";
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("반려 혹은 사유 입력이 정상적으로 작동하지 않았습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == -1}">
	<script type="text/javascript">
		alert("반려 실패");
		history.go(-1);
	</script>
</c:if>
</body>
</html>