<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="resources/js/jquery.js"></script>

<style type="text/css">
.flex-row {
	display: flex;
	flex-direction: row;
	height: 600px;
}

#layout-menu {
	width: 200px;
	border-right: 1px solid;
}

#layout-header {
	height: 100px;
	border-bottom: 1px solid;
}
</style>


</head>
<body style="overflow-y: scroll; overflow-x: hidden; align-content: center;">
	<div>
		<div id="layout-header">
			<tiles:insertAttribute name="header"></tiles:insertAttribute>
		</div>
		<div class="flex-row">
			<div id="layout-menu">
				<tiles:insertAttribute name="menu"></tiles:insertAttribute>
			</div>
			<div id="layout-body">
				<tiles:insertAttribute name="body"></tiles:insertAttribute>
			</div>
		</div>
	</div>
</body>
</html>