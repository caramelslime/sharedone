<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<div align="center">
	<h2 class="text-primary">로그인</h2>
<form action="empLogin.do" method="post">
<table>
	<tr><th>아이디</th>
		<td><input type="text" name="id" required="required" autofocus="autofocus"></td></tr>
	<tr><th>암호</th>
		<td><input type="password" name="password" required="required"></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="확인"></td></tr>
</table>
</form>
</div>
</body>
</html>