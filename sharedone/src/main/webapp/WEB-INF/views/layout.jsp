<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/sharedone/resources/js/jquery.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> -->
<style type="text/css">
/* .flex-row {
	display: flex;
	flex-direction: row;
	height: 600px;
}
 */
#layout-menu {
	width: 200px;
	border-right: 1px solid;
	position: fixed;
	height:100%;
}

#layout-header {
    height: 90px;
    background-color: #e5e1dc;
}
#layout-body{
	height:100vh;
	background-color: #e5e1dc;
} 
</style>


</head>
<body style="margin: 0;">
	<div>
		<div id="layout-menu">
			<tiles:insertAttribute name="menu"></tiles:insertAttribute>
		</div>
		<div style="margin-left:200px;">
			<div id="layout-header">
				<tiles:insertAttribute name="header"></tiles:insertAttribute>
			</div>
	 		<div id="layout-body">
				<tiles:insertAttribute name="body"></tiles:insertAttribute>
			</div> 
		</div>
	</div>
</body>
</html>